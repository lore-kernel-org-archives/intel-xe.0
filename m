Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D640D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 15:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97FF10E1DC;
	Tue,  9 Dec 2025 15:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/UkCqr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375A10E1DC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765292854; x=1796828854;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lv7bkVd95Qurm6Cx/VuXO4scK+jaIYyww5U09VRTDtk=;
 b=K/UkCqr/0smJ8b1Fxiq7gL05gnlELXpcZ21fJk88Ewy74hakDK/Vh9Jc
 gMt8w9HlvoLMDERNAKMr0f9wvnKtT8CZGz+g+gaTRmBFDESauzESY7sd+
 blXhB7zOQvvICNvBS4uV7bVDqp/BFA+jo/5fUWiWLPTo18z6/Xuunyu5s
 +7/ll9/XABrIel9d0rUDXJqI+Y50lUGd/vFWkxSCS00vYXPmTrfEnjLhP
 KYlmZ1QZ0T9KwRU8kvayrqhMZXvPmwAn1pE/QJO8JXrR1pYtZhN4dqokp
 rd6WWykF0nAfjhr19UES9H/2SeATczFIKUAQl7/kt+gDYMXY9+hjf5Tdv g==;
X-CSE-ConnectionGUID: baOwcRRQQG6+cFV/tmb/8Q==
X-CSE-MsgGUID: /MDKdCXvRFKc7i9c5JvD9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54791201"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="54791201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:07:32 -0800
X-CSE-ConnectionGUID: 89VB+Y1FROWddhhVAOhDwQ==
X-CSE-MsgGUID: YJHbKAzKQ1+V+hdoY36srw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195312855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:07:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:07:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 07:07:31 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:07:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmP1N21NnQq6gE3kSwwaMYrBek1A2vW2LUGm1wYZqfWpwklEyqBfiL2vvj4Oc3LQq5Qbukqv5VnRqJDkWevDenWndJgSY9JiWDERyfzRYmNVuERy83A4/DyWscn6tsJlVDHy553HDsnP+rrwgJ7GGgEjgEO6iu6BXGSBhl7H+LaahnAG9QSLR24pDrcLsQ2x1bBMR8EkY9gAjyi59dyoYrFFx8ArfiQyRbhcEGdukZ55XL04RpXlkWoov7eIHAzI8TA2HAXiUkbmRJFXQqB1cA3eOQZo1ut5atAVT4oHFvBM+rUKvmgVUVaj1Ywb2+HeqEUh82IPH8O1ypSjeGm4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz98YBsxdiuLkrU/my9kCYJ1CYtfoi5WgH3y6saOzNU=;
 b=nCSEqL7ZYQ/7Ykk7meX22pZU5GWp4NmUZtco92ubOKrjo+bie1LUoUSwT8j+7+NL62RZY+8moQXu4zmUnLIk9tOAwLX2XMnSKRhf4XHPHmUuKGC2+EbPR1EJzlxhs+oB453XhQ5Ta1BTISocfOMcHlxTPnmY/dUhUmXHn6Kg401t18YImXWrcmpbV5o+cbs0EOwP6aSJsAEqKgGBcau8J5KXszJHaGJYwpKMaqxKf/7KE4HY+CPJ7Jfi2BF45bc8XFdfGMaYRzQ0zQdRGm7f+QEKbutdhDg7Gyv/iuIMCWUb6AjtuQz/hN6+8nJH6cCXyv734SCLTGMICX7/qld5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB9493.namprd11.prod.outlook.com (2603:10b6:208:5af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 15:07:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 15:07:29 +0000
Message-ID: <948063c6-f8d6-406a-9e07-25983777dbad@intel.com>
Date: Tue, 9 Dec 2025 16:07:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/xe/sriov: Add debugfs to enable scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
 <a203d8b9-628f-4b5e-94ac-fadd45b1e9c1@intel.com>
 <d6580e58-9e7b-4d5a-ae43-42154099260f@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d6580e58-9e7b-4d5a-ae43-42154099260f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0031.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1373ffe1-1d69-4212-e8d3-08de3734ab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTd1TU5GLzd6MHl0N3FvRThudFdLM3ZuTG1uQXhnemQ0dktXdG9Md1pyKy9E?=
 =?utf-8?B?bXExSXhONUpZVGJXNDR3TjFoYnZPUmw1WjVoLzZ0QjZUMDdtZ0xrYWRlblNE?=
 =?utf-8?B?aHNPS0o2SUZHWWpOZGtZNW8rMWFEUXNEc0hrOXhoR2hrNStDM3NQVERLano1?=
 =?utf-8?B?eGlFTmNvbTFyZm92SFZ2MkJnZ24rWGd1VDNJMUdTMmkwNlBia05yNFVZNk5a?=
 =?utf-8?B?TCt4eWNPdHhTay9QVlRFWnJWempXbUxxaElpN0IyOVlsR0NkS0FTVTRLbDIx?=
 =?utf-8?B?VE5uQ1JmNVIrSXpRaSsrV1BpcHN4eUhRRk9ESUNJWi95N0h0RmRkaGVkQ0hO?=
 =?utf-8?B?cTA2a3FFTkZ0M2dRUC9oanFOTHpBM2lLTnMwTFBJZk9SazUwSi8rWXhwaXJR?=
 =?utf-8?B?dm9jRG1kTk1jM251SWxHWEhYZHIxRTlsU29LOHQrdjBEOEt2VW4ySUROQjRp?=
 =?utf-8?B?M3F0aEExcExYNkp2L0svS2lNeFJESm1xL2hxSUNqSGNUSGxVM0E0YWg1dzZK?=
 =?utf-8?B?UStZUVVOenkweEFZL0hDU1VVQjBRZ0gycFlIZUw1R2wyWG9LV2hyeko2VEJk?=
 =?utf-8?B?UHRwRUFVWjBGYkI1cnZDRXdtUkhVNmVOQUxMVUxrQ3dIK2V2b1VkdXl6Y2V3?=
 =?utf-8?B?b3BHR3E3Q3pVVUJnWDRsZW1JOVFUM2U5Q2E2SG14U3kvNTRiSmoyYWdqNk5C?=
 =?utf-8?B?bzV1bnJ1bUV1MkxraVpGZDhXZnZkRm1mSGtOcGJqS1dadFJ4emsrQlM2c0pa?=
 =?utf-8?B?NDE4djBlNW9yMzZCZWFwV1FSWlI2L0VXRk1FUXlWTEYrZnpidTMwdjQrOHhP?=
 =?utf-8?B?ejdtN1dtQnJaV0FFZjV1dkFTbzYvM2VFbDlJK2RGOEs2NytmZTlMNnJuMkhY?=
 =?utf-8?B?TFhwSGkrdHVDQ1lZcjFJSGpJaytTQkRCcFZJZDVHV05ucVhLSmV4eXZEeFBq?=
 =?utf-8?B?T1krdkx0Kytxdno5VHJoTGgyZGY0RnlZYWhGK0t6SVd0SVhlVGE0V1hNcXUx?=
 =?utf-8?B?RUV1WmRCVTIxUWFjcWFkVCt6cUxMRWF1cU9EMnRjSXVZd1N0TTlta1FuNnNB?=
 =?utf-8?B?VGo2VE51QUVxV003Q1dGZDFIWjVPbjFTVm9mR0VLZUkrM0RodTQ0a2NsWWRz?=
 =?utf-8?B?SlhzOHlFWE5ZOGVKaEVkMkxpOHcwM2g4dll4TXhnWExzM0xEbHB0Z3N6MGlZ?=
 =?utf-8?B?WU1lNjY2VlJaVTBNRk01Vk5zY2RYTHdXMmlta2RBNXFOZjdybEF6RG9KOVZT?=
 =?utf-8?B?L1daZXRaallBNkxKclRuREF3K0xaaFFabTY0OW5sWGpDUkVWWEVvYmptL05Z?=
 =?utf-8?B?aGZwNXdicjhuSi9STkpSWUk5YXJlUTltSExhUzI0K3pxS0FGSmlhNGdhU3JM?=
 =?utf-8?B?aTl5UGc5WTVTN051dU42RC91aFFGam4rc2JkMzdNdWZaazBzYjhoaUs5T1RY?=
 =?utf-8?B?SWdnQTlMYjJoQTFRUFJpQjU4SmJnVjgwdHJYaXdRYjE4U25HRGRBalhiZDB4?=
 =?utf-8?B?Q2tFajg1ZGNIdFhmMzU4cTJOTFBuS2s1VXJ4akNpM3paS2pkT1lBajFGcjRL?=
 =?utf-8?B?M3lWd3Q1MFdhRVVXSlNNYlVmWDBkWDRpbGdIbnhTMjhKNi9zUUFJcWVBenpE?=
 =?utf-8?B?dUxnVHhQc1kweGp6eUZIeFh2dFNxVkp5eEpRVmpJNXZDN3l5T09LTE5BSTB1?=
 =?utf-8?B?NkhkVGpEMzVLWTRXa3ptVUU0NzVuNzB2dTZUOU1aY1FueStUVEZHNHpvQkw5?=
 =?utf-8?B?S0xCZm1BRDNwbFZvbUJtYmVOc2xWMTBid3R0UGtSTC8wSFZnQzllL1pqem1r?=
 =?utf-8?B?WVFsQkpDcUw3bnNlNmYzOENGNC8xNExkWEM4NEZiYkxDVWNzT3FxV2hNQUox?=
 =?utf-8?B?REJITHI1ekhMT0dtYUpsZno1VkRRZHpIM1lySWg3OCthVzRITGVlMDl4d0x2?=
 =?utf-8?Q?56HwotrIPf36PZShOm2z/dt93u05kinJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmdwUE85UDdoa1YxRitwcVh5aDFiMmRkYStKVDJiL2hFSWtFdE16bm1zZm5U?=
 =?utf-8?B?TUdoY0Z1bVBRUUFnNGljS1ZwTnZEK0d0STNCOGNOcXpCZE02N1ZzeUZYakp1?=
 =?utf-8?B?OVEvczFlVk8xdm1SdjUwK3pmWWlUYmtycE90bk9JL2RiWkxrV2srcWhEbTZW?=
 =?utf-8?B?bjR4TkFacWtqdmM3VXZ4SldWSktFV0tlY1JtZVNPL2dvOWxpeHY3R2xYQkxX?=
 =?utf-8?B?czVMZ2dBNmRZS3AxS3hMZkFzVndFZkpmbHIvdlFhWVhOSHpaZnRuUE1JUWtk?=
 =?utf-8?B?bW9mT2sxL0ZtTlprcGRtRWNkLzB4bUJDUktsNXJPM2N1eW5UQm9teUs2MUU4?=
 =?utf-8?B?RVc2ZmNYaThmZFdMYWxmUnRZaEJuYkpoTy93ak9XbnlwZW90YnRuM1NuTmZY?=
 =?utf-8?B?ejl4a3dtVkp1OUZsd0hCcDZXUmtUSFNpOGRZT2ZKcmU3RThaMkZEZHFIYWdR?=
 =?utf-8?B?ZXJTdmtod1lBT3lnU1FpTmNMcHRxekxJYW5ydmtWNG92T3l6RFk0bE5HSnBQ?=
 =?utf-8?B?bUxVRWh4L3pzMVRLSVJ0aGU5TWppNUpQbDN3NlVlTzY1TDArUTRGd041WHFk?=
 =?utf-8?B?Z01SYW5yL1BTQkhCRkJZTDRpRTNrdlhxOFk5WWtyaFkxcmRaeC9Cb3ZJeHR6?=
 =?utf-8?B?VGtzRi8reFk3OVhlSjhHL2lidWZhSjMxS3Brc1hFUUJYM2JLQlovSUU4R3N3?=
 =?utf-8?B?MjVHQ1lGYXFwTkhQYU9Pandmd3AzajBpOFpiakVTcDYzbXowanRqbnJyM2ZR?=
 =?utf-8?B?TmVILzZCaHI4c2k1cWwrTk1LUitocVJxaGRySU8ybU9hMjdDUFA5L0tFdk4y?=
 =?utf-8?B?V3RRa0s1MWlodmZKZ2p3d2FPc0IxZk1UdThwTUZZcjIrN3ZPR3Zid2NEblNw?=
 =?utf-8?B?V00yNXJCeUJqT0FZSW9CUzFTY3g2dHRwM2xpcWtHdTBPSTd5Y3R0N09Zc3BC?=
 =?utf-8?B?bmFXcUQ5T0VPcWQxM1V2aFdjdzF6bUZacUZEZlhhQUR5bURRSFozVnRZL3da?=
 =?utf-8?B?MnRDaVNNZHNBRFdLSUh5bVZOR1lkWVh3eHd3YndXQ0hwT3h0OVlNekJhSUZo?=
 =?utf-8?B?YmExejMvOFVablRzNnhEWjdNT2s0YUpVcFZXVWxCTk9rOWsrOG84YmxWOHN4?=
 =?utf-8?B?RmdaYSsyZUpqVGVoUHZkUFA4ZEVDcFRrclQxRi9iMFliSy9KZUtBak90VE9J?=
 =?utf-8?B?M0tKU3dCeC9CTElYYk9sRWR0cklHT05TWXZ5dE8rbG1CeWl5MEk0ZEs2YjJa?=
 =?utf-8?B?b2pXdlE4QkJXVXJ0Q3Y5SXpiWTdNYmdLYThhUVQ4ZXNNQVdkdDJxalNxdzhl?=
 =?utf-8?B?UE5sS0NwRDFUSWtyWXBzTXpnNWNoS2hSUjRVYmtNbzF1VmpVL1VMc1JMbkRJ?=
 =?utf-8?B?SzhvY2lsUzA5dVF3eExMS1RTekNScVhMakpLNnBjRFFwZ2FNcDc4WGU2Vmhy?=
 =?utf-8?B?NE51NlAwbXBSS0l3VVZHRElTQTZjQVQyMXVSZ2MxSTlFWlFnVS9hVTN6dHhH?=
 =?utf-8?B?d2VsUFgxUG5oWVpHRWxGWFIvWlpkM2JmRXEwR3Y4QXNGZGRPdUdRMEpEWUhK?=
 =?utf-8?B?V0ZGRmpMSlVmTFRoUXpUQWZxSHBqNW9SL0FZQUtUZTVCME5Ib1Vrek1uaFdm?=
 =?utf-8?B?d1VPMlkrby9IVmxTNnJ0UGF0NE9BQjhuWmpnTEpyOWdEMFBsZG1nTW80dXZU?=
 =?utf-8?B?Z0EvYy9mR295RkN3Q2VPVGR2YjgxcHliT0NyYU5QY1RORUlBR2RsUnphSTVH?=
 =?utf-8?B?QldRRkc1K0hOQSt3NUFaMll2cm1uNEZNSTJsWXdkczZXVlpPSWlPSklMejJQ?=
 =?utf-8?B?R1E3ZzVYRTlKRWtEdFRobjk1Y2VTaDkycFhiaWZEYjZML0VYWDdMdjN3Z0ty?=
 =?utf-8?B?UHpyVldEMUg4UVU5UW4yNXhjcWtGV2Zla3MrZ3M1MGplN2d1REpvU2lUaVQz?=
 =?utf-8?B?NUg2bk1vME5lR0dXK1REUmV6MTFFSlNjS0t3akpzZFNqbEZnMFI2T0NBN0Fk?=
 =?utf-8?B?R3ZXVVNMS1pDZkRRR1lPN2xyQjJlTURIMmdLWThvaDByWVRPS0J2UGp0dHlr?=
 =?utf-8?B?a0QzMFEyU3FzcnI3cERNZjNhQUozOUpOSGpmd1pqWDlVb0ttZG5DNFJYNEdQ?=
 =?utf-8?B?Ym9BbldnTThLZEhXRmxaYU9VYXJ4SzZ5ejljb24rUFEzYk5maUswWVpTRU5o?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1373ffe1-1d69-4212-e8d3-08de3734ab77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:07:29.2078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaQHEW2pfAdUfHeFjVaIkVN67jYcVW6tJaW0pSMjNqanZYLaTNdXDe7LzDDS3xHLg3Jw93t5eoqvq9c1L/nZmtxSKxZNXjiYTNOMpj7TcC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9493
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



On 12/9/2025 1:36 AM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/8/2025 3:38 PM, Michal Wajdeczko wrote:
>>
>> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>>> Reading the debugfs file lists the available configurations by name.
>>> Writing the name of a configuration to the file will enable it.
>>>
>>> v2: don't print anything if the feature is unsupported (Michal), add
>>>      TODO for reworking init order to know if there are valid groups
>>>      when we register debugfs, check for basic feature support.
>> btw, recently in Xe we started to follow core kernel rule and put the
>> change log under the --- line
> 
> ok
> 
>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  19 +--
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   1 +
>>>   3 files changed, 139 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> index 5123ff1fb116..1be23809e624 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> @@ -156,6 +156,131 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>>       debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>>>   }
>>>   +/*
>>> + *      /sys/kernel/debug/dri/BDF/
>>> + *      ├── sriov
>>> + *      :   ├── pf
>>> + *          :   ├── tile0
>>> + *              :   ├── gt0
>>> + *                  :   ├── sched_groups_mode
>>> + */
>>> +
>>> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>>> +{
>>> +    switch (mode) {
>>> +    case XE_SRIOV_SCHED_GROUPS_NONE:
>>> +        return "disabled";
>> maybe we should be consistent and use either:
>>
>>     "none" / XE_SRIOV_SCHED_GROUPS_NONE
>> or
>>     "disabled" / XE_SRIOV_SCHED_GROUPS_DISABLED
> 
> I am ok with switching both to disabled. Or maybe we should just go with "all_gt_engines", to indicate that all engines in one GT are in the same group? Because AFAIU from the GuC POV you always have groups, the question is if more than 1 group is actually active (and it also counts as an actual mode instead of just being the disabled state)

I would rather try to keep debugfs as close as possible to driver POV and GuC ABI, not as exposing GuC POV
so IMO in case of no groups configured, we should show them as empty == not configured, not fully configured

but we may want to change the approach once we promote EGS to sysfs
where for consistency we should show "default group" with all engines, where EGS is N/A or disabled

> 
>>> +    case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>>> +        return "media_slices";
>>> +    default:
>>> +        return "unknown";
>>> +    }
>>> +}
>>> +
>>> +static int sched_groups_info(struct seq_file *m, void *data)
>>> +{
>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>> +    struct xe_gt *gt = extract_gt(m->private);
>>> +    u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
>>> +    int mode = 0;
>>> +
>>> +    if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>>> +        return 0;
>>> +
>>> +    for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
>>> +        if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>>> +            continue;
>>> +
>>> +        if (mode)
>>> +            drm_printf(&p, " ");
>> nit: drm_puts() ?
> 
> I'd prefer not to add newlines here.

it's not about newlines

/**
 * drm_puts - print a const string to a &drm_printer stream
 * @p: the &drm printer
 * @str: const string
 *
 * Allow &drm_printer types that have a constant string
 * option to use it.
 */

> 
>>
>>> +
>>> +        if (mode == current_mode)
>>> +            drm_printf(&p, "[");
>>> +
>>> +        drm_printf(&p, "%s", sched_group_mode_to_string(mode));

only here you need to use drm_printf, all else could be drm_puts

>>> +
>>> +        if (mode == current_mode)
>>> +            drm_printf(&p, "]");
>>> +    }
>>> +
>>> +    drm_printf(&p, "\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
