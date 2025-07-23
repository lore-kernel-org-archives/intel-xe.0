Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D477BC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 17:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9211910E83B;
	Wed, 23 Jul 2025 17:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxdHGOZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A1810E838
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753290909; x=1784826909;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c4xTB74ccXtSCJMkJ5Qgy4OJPv2LM+PAx/IXaK4sWZI=;
 b=LxdHGOZGajUjLb5t9P1dIrxJcUJGcgSwVwVgOSXyZPK1uSjadnT8IR83
 Bd8tm1mOaSkNxLG8iQbVK3rvnZqB/5AoCSjvHbt+CbBRu+fpqkqjtcMu9
 TUenKEQzofY0HeO1t181ipxCLC/zN+wlk8lwWuz/uw7onRk/PBGysHEY9
 i6xepf+SySVSnEsc2H/KtODaIGxXc7UQR6dLOx9jGG3rikPsPAuE5UR2g
 g97yw/11aE+DFmG0lXu7L2ZIcmAWYBwhCSyDGIYxyb6XW8YdvFq4iwKzB
 tg+F3oADgj7Kv6JmTLJJCYs6jLWBMJxYVaYgbNnC8TMdAtD9s2vM0hui/ g==;
X-CSE-ConnectionGUID: ZyAwLaXnRIKin4cjx7T61Q==
X-CSE-MsgGUID: UgHj14fmSFOZC8bQ0MdQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55736657"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55736657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:15:08 -0700
X-CSE-ConnectionGUID: IHZMr6VWRTKTqW9bKdh+Ew==
X-CSE-MsgGUID: gO7T1zCERVieqIpSbc80sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="196740997"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:15:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:15:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 10:15:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH2xVqPoZBhXegCU1TEwtmHQq18cWxyaXNEB88iHBluEGKYbrIgKwOy9QOv76GdCNSCvpPPYfZLYXc7T6lMvzgE/nxwzscgV5P2tqB9KkmPWL3AQrKyQ986d6xHmh4Q4pY2AE48CCb1FuEjcbovAbr5WAfSDjngeVz5opMNILo0hxIwc5qI2sT62VF6Liqg7VDJA7OMRIXrJLzA9z9YPWdW0NrSxYKnqkt99dd921AGvRoTMWYXm6SSheRu0OJhn73fNzBldjZYGSEvlrMqhcCew3EU6pgKL1iFhc+8DLUNaAXJYGe99eUb5SF3gHWgu5bFe3UdHPE6MhtEvlmoMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHtClPFKEbVKt8PhLCuINsY5vh/nlCsbeqIYOfVnRIY=;
 b=XUfUBpUKHZtuO5wsT24xspwnPKvwynzELUmNZt4Pts0XlS7M+3joiSEOcFRqCGq/DvU1P5B4P7KQbeD8yHfvnj1zwhiB5bAIdZtuAOh0u0CABjsSkL+sZ0dkOiNAXLySInWxz27g+SHXq/f12Y+1mfvCh2qV3UZx3CYjb+DWiTidv4t1KehJ9XnOeiD4mb+QYCF/2o1DgzKigEQibe+bCHd1EPs80zF3Wf26W/3r9+pG3YNuJSCk95qtj9rjfSaUX//SnpsDA6yDiae/hLKTSfrr5I1wDkxyi8EnuvmJSGa6O3E7/Ews9Fq7rmjM1j3RPGwsM556rFVJPtAbqktGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 17:15:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 17:15:04 +0000
Message-ID: <838ce588-02a6-456a-9f54-299f94895c20@intel.com>
Date: Wed, 23 Jul 2025 19:15:00 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Updates_for?=
 =?UTF-8?Q?_drm/xe/configfs_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
 <175321783957.181092.8785706270165515660@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175321783957.181092.8785706270165515660@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0078.eurprd04.prod.outlook.com
 (2603:10a6:802:2::49) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7780dd-658d-4f50-3228-08ddca0c76c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ylh3Y2wrRWFnb2F1U0dPdmhhT29yb1VzdWw0TCt3ZFRHbUhya1pJWVViSUlr?=
 =?utf-8?B?UXRQTU5sSlJIRXpQR0JYRGpGaWxUQlRvVkhVSWhzY3dJL2tkY25zQy83NzMx?=
 =?utf-8?B?bUtnNWx6TVhsYm1wOTM1MEc4a0lweUZjTVZ2YTl1TXp4T0RvcVc0TzI1aVRV?=
 =?utf-8?B?aEhMakpaR3c5YlpTZ0FadHNYb3BpbTNXVjVpUzBaeE5HdUVyUDNxdUYyTmty?=
 =?utf-8?B?ZHM4R0c4VFNyekxRRjF6ZS91a3VwVlNwd3NJb1IrZjRZU2V6VWdqdnNzbHVR?=
 =?utf-8?B?NmhKRGl3TE54VlA5L1ltcHh6L3VZdGd6Z1BjY0tZUkpMUmU4U010Zzk4SERN?=
 =?utf-8?B?UTJsUmh3WjBQYXc3YzJiUGNYeHNJdDUyU3JEckFJSjViTkRkbkdyUXkxUUNP?=
 =?utf-8?B?RnZvdnpZN0NRQlE5eUJRNUJvRG8zTlBOMmJEWDltVjdiWklacnl2U210TXd1?=
 =?utf-8?B?eEpQWlJJYnZIaC9xbDhMdng1MVlsTjBmUGNBbVo1aFFOOE5BWm5wN2p0dG9i?=
 =?utf-8?B?MkUyNHExR2gwQmZMUmlBVGl0QTF0bnFHdE1rcUQ3cDBoeFlYOE4wOTh3c2Z6?=
 =?utf-8?B?RG9jWDdvYzdqUXRPN1JuTnVWU2VTUXgvUisyK0J5RUdSVkYxRVl6c3dvazdu?=
 =?utf-8?B?a3BiMnkzelZoaDQ4cytoTWZrcU81VkYzS01zTG1SdHhmNTZlRjhyV3FvaUk0?=
 =?utf-8?B?cmFOTWY1aW1hWG5sbzlsV0VzVmFmSHYzanQxZ2NtYmN5RVZIVWtXbkU2RjVn?=
 =?utf-8?B?UDBFeUlYbjVCY2h2bDhXY0w3Mi9uOW00MWV0REJNRHRxTFBFMERibGNoM3ZK?=
 =?utf-8?B?a1gwb1RQM005QTk0ZWhsZFdYRGY5SUdNa1FpOXJjcGFXcG11WTdZeWJXMGpp?=
 =?utf-8?B?MFdaVUpnRjZMMkl5R0hsQ0NJenBKVlZNZTA3YytSZFFrQVB5d2J1VUtSMHly?=
 =?utf-8?B?aFEySExUWm8xYk15STJuYlRYK2IwWmFiUXhTTEQ4T0I1YnZaMTRIWEx0N3Qz?=
 =?utf-8?B?cFFnSmhuODNrLzJYRVdWVzRaeVVBd05sRUdQWDIvMm1EV0VWaFdkWlVDQmxp?=
 =?utf-8?B?VEpBVWFpYVVSWDNrbVE2U2VWY1JFRkdtSVUxYWN5TElNVzI5ZGlnK0IzSVZI?=
 =?utf-8?B?MEJSTjF2Z1ozSW8vbGpRVWJhYkZqQmtIbVVQMFYxV0JrTEgwb0lHOTRhbDFa?=
 =?utf-8?B?QU44U0I1Y3J0Y0I3bzhja1d0SGpPTTBLcEI1UFpjNHFTdnVOcGoxWm1tSHRG?=
 =?utf-8?B?elZNM1p0QUE5YnRtRkJqb09GaGQyTVlvWHRTekRHeklIWjJHZjZOa1FTcFNl?=
 =?utf-8?B?emRRb3JvQXpJMHM3bHJ5QlZWSEFpVmNiZnoyQ3RSNEpLQ3FoYUI3SnFwWkFK?=
 =?utf-8?B?UlJ4bzBseWlrRFhwb0pvUS9TbEhtYzV5MU9FdkN2RDlIdnVQbDZ1dWVyRUtD?=
 =?utf-8?B?RGtUTXJQM05MQk9ObkFZSVhmZkJ2cFY5YzZtZm84Y0pSa1dWYjNkYW94bkdE?=
 =?utf-8?B?bnBicmVUblYrTWkzSVR1amJuWnowNjQwd2d1dHZneEhWVEtjaktNb1Y2ejlJ?=
 =?utf-8?B?QU12WWI1amM2OGFyck5GckxNOURlSzhRTjhjVWQ4UGs0d0ZDS3FGaDJWbGxS?=
 =?utf-8?B?ZjhDZnFSS0ZLak9ONFNSem1Kb0lLRENiVkJEOU5seXVEdGxYRnVVeXFFS1Zy?=
 =?utf-8?B?c2U2U1UyYmRnY0ZZbTNIWEpsaGd5b1g0NGJUazNyVTljUktueEZRV01rdGNQ?=
 =?utf-8?B?bnpQRFJTcTc1Q0M1Q3k5dW5aU2I3eXFCTmpKcEtxcVlnZHpmQmJnc0tJcTNM?=
 =?utf-8?B?aEFTc2VzcE1oYmVlSjFhM0lWQUhhWXVyVm55VXNlVlA1Q0tGL25QalJweGNG?=
 =?utf-8?Q?482MORlzrqqA+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hFeWxJVEZFMzdlZFpRNGdvR3FmTFBKTUFOMWVST0RqYVhiWXNVWnROKy8w?=
 =?utf-8?B?NVBQUGpGZ25Dc08xLzN0cUJKenJkdGIzamRua09hU01UOHZwbnhTc0dhd1dN?=
 =?utf-8?B?M1M2c1dKUkZDQVh2V3pUanhneHN5YUwreXFscE5qa0JtNnp0QmE3SXJtTFhM?=
 =?utf-8?B?QWwxR2h5c0RzUnRjbmxkdzllZHUvcWd5ZFg4TmJGYjlHV2lHUjhKeXRHK1hx?=
 =?utf-8?B?dDBnNnBJNUhqN2pESU9KN1hybW1pbGlNMjRzdTNNbXFrVkFkKy9xakxpZVVZ?=
 =?utf-8?B?MVBnWU03b004cVI2QjBUUmJVTTIrT1ZtdjFsbmRQY0JyVEc3VzIvRjVwWlBj?=
 =?utf-8?B?S1h4Q3prV0RtYWJOQXZmclVrcVYrWGx5eUtVbWk1ZzdycSt6TUR5aGgrV1RN?=
 =?utf-8?B?ZzlpYlNQb1lOTncyMW9iOWl3NUhUYjMrZDdtUlI3ZG0rbnZtLzRDcURpV2Z1?=
 =?utf-8?B?RENLbDBTL1BtcHBoYURpL0dJb1kvUURhL1dhWFcwNTQ2YjZ3SkRaSGcvVHV1?=
 =?utf-8?B?MU56akNuei9sdVpYUHJSMTFBMzU4K1dWT2ZsbXVZeVk2bFhoZjJzZXFWRHFy?=
 =?utf-8?B?U3AxVkcrUFdIbExsY3gvTXUrMU9SMDUvWUM3WjdTL3N4RXRDeXBoQ2lvT1M5?=
 =?utf-8?B?eHEwcEdMRVFScUdLZU5QemovVzJObDNXVWhsbXE5TmZQTXVRS09GMW8zR2ZN?=
 =?utf-8?B?dXB4RkRRaXVaMjRQd0ZROFE1NU9nd1M2RkYveVovMWxMekJEWE1DNzBsU1JC?=
 =?utf-8?B?MXh5a1A1SHdVWlVGU0hjUjBnZUJtYnZVUFN2Mk1tQ0N0QXR5RFI2dXExZEMv?=
 =?utf-8?B?SFVpNXRuNTQ3OFJvck9VSlNzTVlHcUFUQ2NxbXlCL3Q2U3pmZytKeUlwNTZG?=
 =?utf-8?B?cWV1VXhIQTBTdWRldzJVS3NWOC9HeTVJTFJEUWg5V3hJOTJGbW9Dd1pIZWhn?=
 =?utf-8?B?Sko3UkkzK0U5NmUxYjlPbjdDRjRUNWVvZExTeTZ5NTFQam1FTXloaVp2SXNv?=
 =?utf-8?B?dHFodHBUakhhZmlrdi9oMGI0aExHeENtZWtLQ3l4L1AxZittaytGUE1WZkx3?=
 =?utf-8?B?cXI4cnFFMm9wRm4zNWRtZFNhMWpsOTZxcFM0bGR1MmRzb0RwdXVhSFN3dnFL?=
 =?utf-8?B?RDZjRzRuaGdUdXNEd2FmK251TmgweU5JS0xqMXB1ZGdhQ1J5YXdGQ0ZPQXFH?=
 =?utf-8?B?OVZtS3hRMmRZT3gwSjhjeXpOUmlldmtXeTRTNEhjRjEyWkNtTzk4VW9YdnhF?=
 =?utf-8?B?V2JKZkZpVTg1U1FQUlIzUGtSWFc4WGpuNGF6Qmt3a2Ruc3hZSGZ2bEZxcyt5?=
 =?utf-8?B?UFlzVUNZTjVRemhPNVd3Q1RzbWkrb1V5UG0ySW45S2FNcmpRTnNoUHNUUHZm?=
 =?utf-8?B?MnpadFB0eFV3K25TMC95SnU5Z3Rlek5ldkQzSjNiU3RhVVlGMTN2RU12S3hp?=
 =?utf-8?B?NVpmemdGY3JOVHBPUkp1ODBPWGFxNUtKWEtpcGxoaytSa3FBOHFrL1c1MkM1?=
 =?utf-8?B?eVV3ekVNdDhnRHhFWVl6dUJMcFo4S0piRG03Sm9KL28vbUx0TkJra3c2aDFB?=
 =?utf-8?B?aGp5bENJUDRNY21jSEJDeFNlVUh1akw5UWhQTTJXYWo4M2kzd0lobDZsd09k?=
 =?utf-8?B?U0tLTUtQdWw1NlZpUTEvYnB1OXAwTlhqZ3hTbUxxMHhBc0JZaFYzdS91c3dp?=
 =?utf-8?B?bUVRUVdyZnRjYWVRMEhEYlNBSHNTejgyR2xwVncrN1dTYUpIL0J3QU12VHcx?=
 =?utf-8?B?d2d6ZG1DS0F3YmFubWxsVlhwOWtJaVMvSmVYMC9EVlA0VWhWOUNkWXJIbnl0?=
 =?utf-8?B?OU85OUFLRnlqWlg5QUU3bThvVEVPWkd1NThUbGk2MVdaUllUNGViSXNTTTJD?=
 =?utf-8?B?VThBeTdRY3B4V2hhS0V3enlGU2RMUWxYS1liSDd6b0t6ZjkzSVRiaXYwZnNI?=
 =?utf-8?B?UGVhbmN6UXBxUFhWVWlNQ0dya1psdjBxUC9RdkVZaUI1YnZzVUd2Uzk3Vzdt?=
 =?utf-8?B?UGVNYVJYNnFqa0FSZ0ZPbXl4ei9PK0diVWdiNU9QZTdDVjRqQ1RoVUpUUHdm?=
 =?utf-8?B?MDhmWlp3TUswNGZvSU94dHdUMVBWZ2NoZ0JMVnRaa1l5S3Z3TFB2bVpSUHBE?=
 =?utf-8?B?eGxBT25tRTFYMW5EMlFoZXJRbHBPYVlFcStGaDk0Ym1JazYrRS9EU3JpMlMv?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7780dd-658d-4f50-3228-08ddca0c76c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 17:15:03.9823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIdr2lNok6RLzpKnAZvyP/w5pBqtFxppadO1tnEn3vLt/fNtkNodYd+kHvD5GXexX9xBUm8TCft5leAsk7IfWXn0t5JGWpoEBcmeJasS9AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
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



On 7/22/2025 10:57 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	Updates for drm/xe/configfs (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/151773/ <https://patchwork.freedesktop.org/series/151773/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v4/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v4/index.html>
> 
> 
>   CI Bug Log - changes from xe-3455-90f3e20cc198cddd5ccaa6ca66382a60114b2245_FULL -> xe-pw-151773v4_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-151773v4_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-151773v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-151773v4_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3455-90f3e20cc198cddd5ccaa6ca66382a60114b2245/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html> +1 other test fail

unrelated

(kms_flip:5873) DEBUG: vblank ts/seq: last 193.513855/1468, current 193.679626/1478: elapsed=165769.0us expected=164889.4us +- 824.4us, error 0.5%
(kms_flip:5873) DEBUG: inconsistent vblank ts/seq: last 193.513855/1468, current 193.679626/1478: elapsed=165769.0us expected=164889.4us
(kms_flip:5873) INFO: Event flip: expected 311, counted 310, passrate = 87.10%, encoder type 2
(kms_flip:5873) INFO: Event vblank: expected 311, counted 310, passrate = 83.87%, encoder type 2
(kms_flip:5873) DEBUG: dropped frames, expected 311, counted 310, passrate = 83.87%, encoder type 2
(kms_flip:5873) CRITICAL: Test assertion failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1704:
(kms_flip:5873) CRITICAL: Failed assertion: !retried

>   *
> 
>     igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3455-90f3e20cc198cddd5ccaa6ca66382a60114b2245/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v4/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset.html> +1 other test dmesg-fail

unrelated

<7> [229.020255] xe 0000:03:00.0: [drm:xe_svm_handle_pagefault [xe]] VRAM allocation failed, falling back to retrying fault, asid=826, errno=-EFAULT
<7> [229.021142] xe 0000:03:00.0: [drm:xe_svm_handle_pagefault [xe]] VRAM allocation failed, falling back to retrying fault, asid=827, errno=-EFAULT
<6> [229.025114] xe 0000:03:00.0: [drm] Range is already in VRAM
<7> [229.034146] xe 0000:03:00.0: [drm:xe_svm_handle_pagefault [xe]] VRAM allocation failed, falling back to retrying fault, asid=825, errno=-EFAULT
<7> [229.050707] xe 0000:03:00.0: [drm:xe_svm_handle_pagefault [xe]] VRAM allocation failed, falling back to retrying fault, asid=824, errno=-EFAULT
<4> [231.830439] xe 0000:03:00.0: [drm] GT1: Pending enable/disable failed to respond
<6> [231.830494] xe 0000:03:00.0: [drm] GT1: trying reset from disable_scheduling_deregister [xe]
<6> [231.830889] xe 0000:03:00.0: [drm] GT1: reset queued
<6> [231.837412] xe 0000:03:00.0: [drm] GT1: reset started


