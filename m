Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F46CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 20:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432910E0A6;
	Tue,  2 Sep 2025 20:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaStOkDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1EC10E0A6
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 20:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756845970; x=1788381970;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8YSzNIuOPPNuPheh1/b349UJSgQ61f2P3pQW4vVDB9A=;
 b=XaStOkDkEd52Nc7CxDcNEmf76aW44joZ7Qp3iqnNNkmEj40I5Ib+LLjB
 xHQMtJtTJUpuH5rM2HdFjhwyZVAyKKGFSDTkd9mquNGV6YWxmHVsrvzpE
 fFOYiDUAnD8xN4MI/T/rflQ/fs18x3Xjow1U/ciHgO/pJx6+Rf/4BBjBj
 HNfvyRmWCYoG+q+p5S2VxSmJ9G7eGBsvArnZ3ClfOzkcsW9tU3V2ICKVF
 keEJ16HdEfNdUlXAdZkwfuzuPoaa2KxHN3bzLka0U0UhYpgBs8Y+aEVIX
 HhL92whnxw95eT4m3YJGU2dgbTDLm8/e2RZLyeJGH9pBpAI0GSbHBWvKC w==;
X-CSE-ConnectionGUID: ji5nlDj+QiWIWbIbdQE49g==
X-CSE-MsgGUID: yCswVYiPQJ6wJcUcCUd+BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58996585"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58996585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:46:10 -0700
X-CSE-ConnectionGUID: 5nBuINceTd+s/YUiOdQXXw==
X-CSE-MsgGUID: WwbFs+JlQbCFdhZF/uoKuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170653469"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:46:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:46:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 13:46:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT4tKC8GCaaF2P2u4Uw6/9QeXEYLWnncU2TRhL7BLQ+KOq4oG9wuhgVS5z3LHbzAxcZzoN3A50AWdjD5tFK0CDWWggGrhyHHjAxfTpWD2kZvJ+rv78e4zUabD5l2yNONvvUifOijyWQr8ZTdPU4PzWfYMLGeuMfTT2MLM67hNo/SCuOUl0tiGd5q1qtwpDFyer8mXWe+0JeDlubpSV25h2KXK+On9XmkbNEnHooPScWGFfvUlmJs5gdJhl/AMt/W5X27JIuvsCc6lL6He7kMAjjpHN1S6qmSpVcTK69ND4z6XLy4JAPpxrKUESQo7sWqB8BdyBZ7pS8xFNbCYzI4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I1eJVQCyk25R5cDxwNVvDxSGd/mef3/gHYICJ3F35M=;
 b=o4+RKS1vOHMMaKklDVdMPgmL67jfXliHsXmx2O3fb9FmwlD6HiJyKunn2QGZB5oSRAfY8UQheRDSl9cwAVm9yoWmbZQ4awB+G8Mp9Tar5yhcpkMABlHShhtVcj0a1STXyYgl1HXsl0gnZf10DXIUQnrV4V+bqUgxwOZa0lB0+fwkYd28pgXIhAaf/LxP6Nyy5UrMuXT9NJ3mviPHqgH1gU7f/bXVjgMUowScew07yDnlqnyfMsmJkAefbEVtnPjGMuKdEg623fscoCbEs8EmOwMHJZefFZjjAboLT8x9FTZzF3CsOQN9npygCAaDhwwDmWQJbzWqqqS3wFecD7psbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:46:03 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%4]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 20:46:03 +0000
Message-ID: <329933c5-7d7c-4758-9039-aee9a48d512b@intel.com>
Date: Tue, 2 Sep 2025 16:46:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/xe/pvc: Add GuC firmware definition"
To: <intel-xe@lists.freedesktop.org>
References: <20250829235305.672287-5-julia.filipchuk@intel.com>
 <20250829235305.672287-6-julia.filipchuk@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250829235305.672287-6-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0176.namprd04.prod.outlook.com
 (2603:10b6:303:85::31) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|SA2PR11MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5b865a-1989-4d76-0a80-08ddea61bb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZGMVNCSlRUZi8yU2I4RUo2UXR0RVVNMFVrcXlmcjdiWnhJaHFZdFM3Mmx1?=
 =?utf-8?B?djlrTHZQR0lPRjJqTFdycmZIRGFNbnl6cm9EV2VBcEVCOENEdmtrZ0RlblZl?=
 =?utf-8?B?MFRwbng2dHBORzJvT2YvOThKMmZudmhBZ0xORmZodENLcmhIdnpMRUxNMlBH?=
 =?utf-8?B?d0dPTVAvdnpCeDVtRFVBeVFxV0NNdG5pR2N5aitvK1pWeCs4TWpsbDZFRU92?=
 =?utf-8?B?MFI1MzNCT1FUeXpSQTJTUW5paUxBTlRVN2ZUSStraTIxaC9SeDFyRFlnbFVw?=
 =?utf-8?B?VGpibzZJL2xXSmkrRHBvUUp5aUlGWnp0c3UxdWh6WEYxbVlvSkRHQzN4bUZh?=
 =?utf-8?B?MVhBVFQ2em5ZNnRQUFhXTnkyV0duZEkvcDg1aVlFb25MNEpHdlQ2Y3BLWlh4?=
 =?utf-8?B?akk0T1hWSWs3QXBBd1ZhKzMxSTl1bm9RV1VESG1NbmpzLzErUWRBSXB1bkxI?=
 =?utf-8?B?azBWbjJvTlZpSWFwdDZXTVFFYk1QSkJIV1JsZW5YU2tWL2lnUVE3MlMwbC9L?=
 =?utf-8?B?S1pYcDgwTDhxVkRsa3Q3NDZvYWRtRmd2eE5QcnI2YVBuWGRLVFpKRzFUS2FH?=
 =?utf-8?B?YUl6Ty9jbWFXOHpabGc3UG11ZVRtTHZHYnZBZkRyekZCbWlJeGp0eTdaUm1T?=
 =?utf-8?B?aVhEbTNMWmhIaWVnKytXbDQzaC9UckIrZHhJT1AxM3VoejFSVytOMlNpVjNL?=
 =?utf-8?B?dC9ab0w3WGhHK1FDZ1Ivbis0U0ZJczg2U3ZyYUYwQWpSWm9wL0I2OFc3SFNY?=
 =?utf-8?B?OGllOS9EeS9SMVBNVXVRQTJNZGVOS0xobVB1R2dtLzEvMnd2K1FkMXBhYnZY?=
 =?utf-8?B?SFRLemdIRnZwY0tGN0F3d2lKb3I5NnJ1MWt2b01ubFBkLzhpcE40NVA4eDND?=
 =?utf-8?B?TVRzZHFZdG5BYjVoOTNyNUNIN0ZFL0J0cXBlSEpNbG9HTGdLQUZPVzNXSlBS?=
 =?utf-8?B?STE2bG4vYzJNcGJHWWk2N0NVeXJIN3o1a1BGS1dkY2Zsa0lOUFdFMTF3WXdm?=
 =?utf-8?B?SnZoUTRlbWZKV210U2NiVXFQU2gyRDY0Tmc2dWxTWitOL3ZBRjBUUHQ4RVpY?=
 =?utf-8?B?ZXZIa0pwQzdqUWhFRUJvYnlyeUp5cVlJUXg0ODZGWTl3SXVUUVJaSFd1bG4v?=
 =?utf-8?B?NjEzVmpac0tmOFREOE1Eby9RaENlQmlPR2JWdjRIcnVtZExuc3ZxNkVheGVH?=
 =?utf-8?B?d1pHdnRTQjhyS2x4dS9iVit6WWNqaHA0VTdiSFd1dEpRV09JTjJwZm5aVjVq?=
 =?utf-8?B?eUdlcHFkblo5Z2FNa2pMbEoyNzB4U2JhZmpSTWhoVXZHUm5oNWRiQ05WZHkr?=
 =?utf-8?B?UHJ0RUQ1NGVpcmNTRXhtcUh2Vit4T1owM1pFdkZ3VW4rcWVqWEJnVWhvSFJD?=
 =?utf-8?B?UXhsdTUySlp5OVJRcWdUSnFRUm94bzdtRFliM1BHdlVpNkRTYTYrU3RKZm5G?=
 =?utf-8?B?TCtZZVlNK0dNSUpyK1JOTkQ1dDRCMEdDeFV6ZE5UZTJUUDQ5OVB1RzhMbnRG?=
 =?utf-8?B?ZENhMWx0eEZoNnoreWdYNVBrbUhRK3ZNdDhLOXM3dm5PMDRKU1R5S1VKbytn?=
 =?utf-8?B?aEROdk1XdkVZOGVDR3d0Qkt2dWNub3VIYkRPZjlla0xEa0FPRTcySm9MTHgx?=
 =?utf-8?B?Wnk1ZysvWUs2eVMzL21GaW9JL0o5WWZTeVVCMjdNbnNJeUltb04zNUJBckNS?=
 =?utf-8?B?KzNsQzhsMHFhdWpNUXI2VlpQM1JLL2lCZUpQZ1BjNXBFdy81U1dzVEFhTkVY?=
 =?utf-8?B?bXZyNXFuQ2p1SzMwSGVEMEFvcDd5WHR1QWJYMmZkNW1ZRktxRG5uTWlVcnps?=
 =?utf-8?B?bFFHTFBpd1ZKOVg4MXpYZE9leFV1VVpSWk83SmM0TjMwbUtrVjlUN3lYSFdY?=
 =?utf-8?B?cVdFa0R3dzZpZDVleUFCRS9MSVdTSzk1V24vZ3YwN0E1azZCMjUwUENRK1dD?=
 =?utf-8?Q?bBqAMqEECkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZQN1lVVGxGTTRtSk1pMGMzSUJjY3NJTDJYV3NxTU1RTUc5NWUrN1BjYU5L?=
 =?utf-8?B?L3JMdk5yV3JabmtWVHpvenBuclVoYUxOVVFRVy9RbXBpclNJN28raENBbGdv?=
 =?utf-8?B?aktFbVBNSWJMNFh1am42dE9xV3NRZ25tVkdzSk1sVXk1TlJKQTNHdGhHWEo5?=
 =?utf-8?B?T0x2cTRhbVFHWmdwd2szd1UvYlQza2dXTnlZdjMrWnRkdFFtMmdiN2FTQmhT?=
 =?utf-8?B?T1E3cFptMEtBMDE0Y2Zta2VlODBYbmtoMXZjQjZ4U0svTGVHSnJOSmFkZldK?=
 =?utf-8?B?N3JrazdrSUw3U3dvZGxYTEtrejNRekM2UXgzd3Y2M2g4TkdsakxNNno2S3l1?=
 =?utf-8?B?bWhRdm1xTzBvb0Nvc2VQOGhLVUhkRWhqakFCamtBNnRYM2RNa09KeSt0VTRw?=
 =?utf-8?B?eVk3WGdOWVdxK0pmV1NNazh3cnp5YW1YQUVRQ0ZITzJEZ0FVWVQrVTU1NlJo?=
 =?utf-8?B?bFk0dVdMMEs0U3hCM3Q3OTArbXhvbWRRM2R0RE83NW92bHlKOFh2ZDBBd1Ex?=
 =?utf-8?B?S1MvOFZzZldBcFF0Y3ZEZm1qY202SUI0OFY1dzhaaGtmU2dmZjNUdlUwZE1H?=
 =?utf-8?B?QVVWS3ZMdjlyWkR3WmZ6dzFlNmhldGVzczJyVkZKcHgzVENiL0FBVlJmdG5I?=
 =?utf-8?B?bHYrUUNjUnZLbUVlK1FDbnM5R1JXU0N6N1FkK0NKdFlmU2V0YmhUcFJvc3c0?=
 =?utf-8?B?R2hweXUrd2xTOWxlTHp1RkRRQkdaSnVkM1dteGM1MzRZbnRjczQrMnpBVytQ?=
 =?utf-8?B?TENaK1R4YnZvYkpvckpUMnovOU90TnBod2hLcmpSMTBpOTdTZURwenZ6NERy?=
 =?utf-8?B?a2FtbmRjdGhVUmIxNVpkMGpQVTBwcnYzekxyTDhrYVY4Mkx2UStwdnpiZFZU?=
 =?utf-8?B?RjluNGt3SE1BTU9qR2wya202eDFrV2RGc0NMOENlbEVGbWx2aVVmWVJQdmdO?=
 =?utf-8?B?THZBcld3NXBmU2Zzb3ZYNzJOQktaT0t5dHlvV3V2MmpXeU9QNWpTaWg3TzJl?=
 =?utf-8?B?bkIyM2dlTVpLUmtrV0l0ZGErZmhUek9zdzQ1TTlQckhPa2g4aXRrTkdJVVdk?=
 =?utf-8?B?azdtaUFnVVJaZ041Z3JQNmNZNitRdUdzbFBKc3lIZnIrVEV2ejZLQ094TC95?=
 =?utf-8?B?VHQwTSt6Sk8zb2Z5Q0VqSUh6YkYzbG16Q0V2L3NmZEZyaEUwb0VheGRHWVRr?=
 =?utf-8?B?SlhFYzZpeTluSG9CQ3hhMWdOKzA1dCs1aThGNWdhRGpiOVpLWXVZU2NlNXhF?=
 =?utf-8?B?ZkMwcDMxeTVCeDJXUUZndFdRakszYkdFOExHdHBnM0FFKzdhVXYvMmEzNXE4?=
 =?utf-8?B?SkUvNzBTSjkrWVBQelpKb3hKRmluUVRnZU9pYzlNRGI5NkRRVjc4NFkvdzY0?=
 =?utf-8?B?UXNvYXRuandjaDN6c3UwaUdkOTBqNXBUNCs3dklEMmxuUlJEdFdaaTMvdmdI?=
 =?utf-8?B?NUY3WlZqQ0hPeXVZVzI3WEVMQ1RmMTJ0SG9vZXJlQmFsNkdsQmduZXFaRk1K?=
 =?utf-8?B?WHpQbGc1WjZGSXlFcEExaUVCbENraWRlcllpVDRXS1dxOGh0ZWlDUk9rOEpC?=
 =?utf-8?B?Z3FUa09qYTUyV1EyaHNVRmsyS3Z6eGtWUCtybGU1dEd3N1NFWmJJb0w5OTB4?=
 =?utf-8?B?VWlJMEhWcnN2VzZVNElVS3dBb1BLUlpoUGdlY3FKdDFmNXN5NXYvUDg5ZlZO?=
 =?utf-8?B?MVBMMUViKzhWVncrMUJCOWIwbWpFb2l4YndJd1Y3YkRYbkRwSlYyWU04T2ll?=
 =?utf-8?B?ZXF6MU1VSGZrSDhKNEFKcFNJMnVnd0s3REZObzBhcGFabFowUExCa3Voa0NL?=
 =?utf-8?B?R0JBdGNWb3hObGhFS3NIODRPRUdjalEyWUFXKzNtRWxRSGJOZitRMzdXZ0RH?=
 =?utf-8?B?QzJjNkVQYTY1aEpiaXBCQkduZ3MweThmalEvd080cWdkWmlJL3ptSXRYcXMv?=
 =?utf-8?B?TytmS1dwbFRaS3N4bGRUSDFDSlFOVzRPcUVIY3d5akxCcTZLTWptZXFpVmxI?=
 =?utf-8?B?Y0FkNXFsVEpORDVGTmtZVm9KSjFWMmtNZzhzbGxHWlFuSzN5L2UzSDNZbXMr?=
 =?utf-8?B?YTlBeVdKRS9qTXhnMXFZVFREcCtzQ1F6ZUV4NjgwYTB4QW4wSVoxL3ZmR0JR?=
 =?utf-8?B?WlBpR0V2L0w3L1FSRFR1N0VzSmhMV0kyTjBWL3U3bVd0MFFadEY1d08yUW1O?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5b865a-1989-4d76-0a80-08ddea61bb7a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 20:46:03.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txiRahHcHM9crtmThgWr8iraC0D7S3R2i2kGYURixqaFnO5voxRRHvMrICPqVMUcMQi0nkyPJ67SaMZ9KofyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As described in cover letter, seems remove from for-ci branch.
LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2025-08-29 7:46 p.m., Julia Filipchuk wrote:
> This reverts commit 3dd32a625a5d1493b7bc2efaa72d5516f8119101.
> 
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a236f1d37248..9bbdde604923 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -119,7 +119,6 @@ struct fw_blobs_by_type {
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
> -	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
>   	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
>   	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
>   	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\

