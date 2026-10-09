Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A00CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D7D10FE99;
	Fri,  9 Oct 2026 06:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSdbcS9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE76E10FE99
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791526890; x=1823062890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnEm2MHxYb0+J0uFUaojmeTDuUsefVyfzBbKx2/S92Y=;
 b=CSdbcS9mY+g/N2C9gMF3i4sglOPeJUUxapFuWiry7Lk9UKMr1Kwqoznx
 7XbUg3a9a38B1OgwRTiehtFnmZ4Ok+JFfKN64HXulxNN+hxSG/wn+cyr5
 vgP2MHzwe1QDScGUZ6TIpNHztJMW5qRszMfg4orFVl4ZPvgMtDVcG7j+I
 0VNirScwsoJd9fBltQH+f/ckvqJJAxZpGS+ai9wYoIeaauo49FtTO4/sA
 A7/di69fMGoji+YT0JM0v7iNO0rtUNT1IZOutC4lGmptNm4o3b3NWPt4u
 kdHhGjxf66JOzWh7neELLK4nou8buRB4lONSnnzlYD2QvasS9goAjK011 g==;
X-CSE-ConnectionGUID: zkFve4dERqSqp0VclVlJYg==
X-CSE-MsgGUID: 6nrZXKNBTC+UBgpia2Xvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="331197"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="331197"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:21:29 -0700
X-CSE-ConnectionGUID: Bxdgo424QROVu48FaHSJxA==
X-CSE-MsgGUID: yOuiOyyNRxC5Og2uSuo1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="253246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:21:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:21:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:21:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQP52Wj/syl3VC3t/FRWoYA7RUFNQiM/A8TwwEPG6w+MeQk0hTfJNG11I2lN98OpZgKf+wdJC/3CHTQOgoBUHtnOmDc8mRa1AYSL3GIAbavXI5m27Ya1PbEMuKvJM5ql5sGBWhHTGG65onTpJYd1UE9O52xpOkMK7Z3z++nT+d+vGPKsAbbj2ieFOj56tFenOIihMoNp3I7ESj75zxRov+y1vyZCpgY8sc+CC1Qs7dVSo6OI/sLzyWNxnZYbZJl8P9nbWj1IEino3STGFWjywAI5KtP67rWCefzwi/9vqkZc18bk7P5LZ+kpFCyu8FbuXn3/Iap64i4C26CSjs/ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJrI/DeuN1gQglcs9TPuEMoqovwEihBxxhqPO6zJnbg=;
 b=gIZGv0H41ZqOZL14Pvij8emf5ADTtVfxddrbYHohKIIBSbcwiAcoTZEU/Z7nhb0k53OzqYtxOXrWCJheikdRec2baqtN5yVy9imXOQ37lle2whcu6H8iGcV92S1pIfALOjTyJglJI5tniHB/jHpKCnXeGc1TKPV+IUncPF548r714BUAuaak2mxHUZXRl7z9Id3IjZyPSBnsHObXwn0RCPQxi55MwJLhERPPhZVnm97pzn5E7sSYFgdizNCR/7lzp7Zpn+SURY8jEICLQ1eQb1Za/Miu/ZKQppisGb8AWzM8ah/PxDG7M+WGa0rOMfB+VDf0rTelqN5jQP2FUXa2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Fri, 9 Oct 2026 06:21:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 06:21:25 +0000
Message-ID: <828f8763-8e2d-4811-8955-9a3080945461@intel.com>
Date: Fri, 9 Oct 2026 11:51:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrival
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-21-badal.nilawar@intel.com>
 <aqJN4Gfv7cG8viB1@black.igk.intel.com> <aqMvZQ79TYVpMe3M@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aqMvZQ79TYVpMe3M@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: fdca6ba9-cd89-413f-fc81-08df25cd8b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: d3JB0oiOXJ6T9tBNahw7g5xo9XuqXXgje86j+it2NSN1YWn6W0t5PVXX5wJSrELciYETxJHB8eY/LYTA1VsaQ19HUqnrsfTV1ebJ84+v+VOCFL1tYUa+OB/NhHRBIpc2oFyfN8y9f/1vHR8ONoVaKCcyfY4PdBwJ/yCnaKx8/dAQoieAs42mQYehWPiCCTwYPyiCVFGKQEMtUQOivgWyDJD7JXluhXxeiUvPFaIqXLM4Srf02WlwFiFLk4NEYXEHOaUvxOSyRS086CTKCE6fkYbel9kN/fbQtHyw4Xcw043XJ/ZNoGH6qixlJn6I25T5zY+XJwFO9wYpuqwJaWOBq1SQzWc9ITMreEGTDaiBqKmamA2j2ubCW77T+GEjOzcC41VHz9c2peYejxEQUVSGzC2Ggc4NAkHSQl4/qBQOjote5O4iLSgf4670WZCXHYxR4w3CKUIwMNKK/S/K58XGD1D+c1/kd5hOhIHMu8pOoYYirGrLxhI3sYBmJlXa66rWfGYTzDntnjHuDBhMAJSqWXzffO/QSS6K0Ajv9l++GJaKpSWmf2qGLahPh4SpZgP5ti+X6OUoR1K9JISEh0o0KIZBSMjgBL0chFqeAE7DXbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5ZdTc0MlVqUGVnVy9rUkt1MjROMkVvL3VBQkNqcnd1RmZXZWd6b1c2MGRz?=
 =?utf-8?B?OWFpM3NKZ2JMc2RPUkRLOVNDY1pFbUJHN3kwL1QycjNBWnVXdDhJOG5tTCti?=
 =?utf-8?B?TndZQm1OdEJlQUhSY1AzcXpCQ1ZCMmE5aUl1RDlwVXlMbUFRU3ZPbUc0OUxj?=
 =?utf-8?B?dUFqWFJjc3lHKzhiVlc1R1ZDTU1jRmptR3Y3bGJwREJzalNwWEJKaWRrdHVz?=
 =?utf-8?B?QWxGYnhvYWJiTzF3cG9kRzN1YnA5RitZSGhUR3pONTZnRGYxRnNNY3psaEJ1?=
 =?utf-8?B?aFEzOFpMd1hBbWIwUW1xc0d6YllVSmIzeTNBQUdqdmt2ZVVVQmN5K21XcVFw?=
 =?utf-8?B?VUJBRVdBT0hvUkExSHRjRzBISEdKSnlEaCsvUGdmcEwwaHV4eDVtVkRnV1Vz?=
 =?utf-8?B?U3VONkVib0QwVWp4K3o3R0djaC9Wd09zQ2VRRHQ3WnZWa3gyWWJMVVNzM1RQ?=
 =?utf-8?B?T2NKbXNsYlVjUDVTaHdvcW16WUVWcjZtODlYaEUwd1h0bFJCTDNDbUcvc2xh?=
 =?utf-8?B?VGQzK2Rrd3FHUU44WlgrM3B1NDNQbGZHUGZnZWZ5aWtzU2lES0NvS3NiaUl6?=
 =?utf-8?B?RW5RVGdwaFZVTFc5OWswRFJVMnZnaWFRd0xRb09lYVJGNnRBbVR5YlpHNFIy?=
 =?utf-8?B?Wkp1SFlxUWpFdGZtUzlUR2VVcFJtUVh5VE9xd05Wamp1K0g0d3VSRGpHOXpO?=
 =?utf-8?B?NGk3eVpTOWcxRkZZeTdsQ1FYQURtek8rKzFvdytvZHdjOWZEcHVwSE1rRkxH?=
 =?utf-8?B?aDVSZVlqclBHUEtYdTlEdjNwdzBxa21EY0kxZS9CUjgvQW1ibUlxYzlhNVRz?=
 =?utf-8?B?VkpyZjFJZlZscXJ1OVN6NGd4Rkw5TkgzUFJjVzUwd2xKWXl5UWF5OXVrVkJn?=
 =?utf-8?B?K24vZDBIUVphT0dDYU9HM3VPUlBxYS9ZT2luQ3dDY2lTWjYrc2NNdFdrd0J6?=
 =?utf-8?B?M0I3c3NHS09sV3E4TXhMbWJJdS8zanhnOU5OWlA5ZUprZ3JHVzlKcHhOVUh6?=
 =?utf-8?B?ZnJsVUhCNjgvTnZFNjdReFpnQTNkMWdVYys5MytxWUlXZGV4MUhLS29iZ3lG?=
 =?utf-8?B?UytqdmZ1VzVKbVFlMmpNbEphRGt0ZzhBL3NsTncwNVlKMFZCeDFNNHM3L3VV?=
 =?utf-8?B?Z3RtY090TXhLUVJobnpZWFdZemVScHhWVU9tNWEvS0lGdFByQ1R5cVVNTmFv?=
 =?utf-8?B?a21ZMEhjR3FYZ1BiRzBkTy9BSjVsTDR6TzdYSkZmZnF4RTlianJQOTcyUmR1?=
 =?utf-8?B?WllEUDVIMjdaTW5YT3I2Y3F5akxHVWlXWWpmZEdrMTdSNlNBMjU2YitPbVNm?=
 =?utf-8?B?aTRLOUl6YkFvZTR2NVN4NzVEekhEQ0FrdFYrWjRNbHBDVkFGNHByaUNEYVR5?=
 =?utf-8?B?NDIrbm16a2JJVjhxK1JqUkx0M1pUZjcvSnBwcmh5MW1GZ096dUhBSDFjZHlu?=
 =?utf-8?B?VVlzVnVqcEpQaWN3Q3VhK3d5YUh0MFozUmxmWUdLM0xGV1hXakcrRUptN1BI?=
 =?utf-8?B?Q2xSRUZEeEt2ekt1aHJWZmZnVG9zLytjazhnOVJxclZ5aUVuM3BHVnhDclF3?=
 =?utf-8?B?ZTlQdGc3UXc1aGh5KzRDVkZ6bDNpTEV6R3BadXRQOFMxVTJPbTUzVExLYks3?=
 =?utf-8?B?Vk9rR28rU2dKK1VxTG1nTzdqa2huUHYzZUtmZERsTGQ3VFZIaXREWm1oVUhr?=
 =?utf-8?B?WHBRVURid244TXFzOGJjbGQwajVZbGg5QS9XMHVWelJ6MGcyMHVnSk1DdjBK?=
 =?utf-8?B?VHRlUFNKVVlHMDFUOXYwOUxLM3gvZlBERUc0QS9mV2xFM1I5bXVVTkswSTFn?=
 =?utf-8?B?U3QxQTlQd3FxUG56TDQ4bEZHVUVTMHF4WCt3OWtrc1luTk1ob0hFcExNR2dW?=
 =?utf-8?B?cCtac3dGckdWTnhDLzgvRnhJTmN2N3U2VEd3LzkxUmg1UE9rUDlBR2JON0JN?=
 =?utf-8?B?Nm9TajJJU21GRU1IM01ZVXNGUlo0Y0RwVzJFd1M4ZHV4YXVKQXZOcVc5MC82?=
 =?utf-8?B?S3VoUmplblA2dlkvL094YjhlbXZJbGR5YjR6cTY1LzB1N0FKVFdBRUMrUmRz?=
 =?utf-8?B?UGZLWWhsdGdWVS9yTmhZbkRIcWc3YTZGUHlrZ05QS1hrQko0N0hkOTQvMUxa?=
 =?utf-8?B?NWZ5YkRaYlk5dGZjdXdxS09vaG45V0hDNG03RlVGRmxvUUlkMFhwdzVCWGNo?=
 =?utf-8?B?QmtuelRmWThuUWNmbHBqaHMvamlDYnVZS2UzdSs1RnRxMWl5MHBPTTk5WDc0?=
 =?utf-8?B?ZDRuM2VhdW16R0xQcHlvRXNUVW5tUjVwd09OUFJyUmszMFBmV2NHMWZ0dHhq?=
 =?utf-8?B?S1BGbStNODUrbEhZNzZIU3Q1UkR4UFBiM3YyRk5HOEFBQkZUckFndz09?=
X-Exchange-RoutingPolicyChecked: 4ZfMI5f6LxwX1SLqM9Ug+RGeAkfeHWb/2egMeeSU8bcikQEzqTpeNdO7uC2Y9VlwCGH3e1IGM5njuOMgrzF27uqM7CPwEIdSDKO1aEsmdE5VNJOO0513dYDCgQyVhQpATsJiP8Irup9p/hRE+hvMn/XgkPG3lxXR/kuMRZZWZ+6Fjh5Is0MtaelcT7G0+fsn3gxquw1pvTRvNr9AadHYIUikz+dajfLrYZ8uq3yg43wXaHI/ahsBUcCwZAv2WxapQyCyYTa2Fybujs3KnVZdyfkMzjLPNBzu7jju0HrOn/B4pVDK66Sn25XROwym7Ezuaf0cvXGH7UErzJE1IeNqzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fdca6ba9-cd89-413f-fc81-08df25cd8b69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:21:25.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZP5ss62JOnVuZjcUueKWqBLW9Max5eXOmGaTA/F1B/SvrMbDq3uwJ0D6woPP6U4LeIrUCbOBX7qjM903KHTjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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


On 11-09-2026 03:59, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 08:27:44AM +0200, Raag Jadav wrote:
>> On Sun, Sep 06, 2026 at 10:56:12PM +0530, Badal Nilawar wrote:
>>> Log CPER records for aggregate counter retrieval from userspace
>>> when cper_on_query sysfs is enabled.
>>>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 +
>>>   drivers/gpu/drm/xe/xe_ras.c           | 91 ++++++++++++++++++++++++++-
>>>   2 files changed, 93 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> index 0be218ba2db7..8fb5d6457c53 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> @@ -46,6 +46,9 @@ struct xe_drm_ras {
>>>   
>>>   	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
>>>   	bool disable_vram_page_offline;
>>> +
>>> +	/** @cper_on_query: emit a CPER record on each counter query */
>>> +	bool cper_on_query;
>> Nack, cper is unrelated to drm_ras and should not be mixed here.
>> This belongs to xe_device with its own state that is maintained
>> as something like struct xe_cper.
> agree
>
>> Same goes for disable_vram_page_offline, but that I think is upto
>> the maintainers.
> agree as well, at least until we don't get that mem page offline that Aravind is doing.

Saw this after it was merged.
Removed this in memory page offline series [v4,1/6] drm/xe: Separate 
drm-ras netlink data from device and firmware RAS state - Patchwork

<https://patchwork.freedesktop.org/patch/758077/?series=172710&rev=4>Thanks
Riana

>
>>>   };
>>>   
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 7e3e62750448..288dbc0942f5 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -4,6 +4,7 @@
>>>    */
>>>   
>>>   #include "xe_configfs.h"
>>> +#include "xe_cper.h"
>>>   #include "xe_debugfs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_drm_ras.h"
>>> @@ -199,6 +200,34 @@ static inline const char *comp_to_str(u8 component)
>>>   	return xe_ras_components[component];
>>>   }
>>>   
>>> +static u32 ras_comp_to_hw_sigid(u8 component)
>> All the switcheroos are above sev_to_str(), it'd be quite sad for these
>> to be left alone here.
>>
>>> +{
>>> +	switch (component) {
>>> +	case XE_RAS_COMP_DEVICE_MEMORY:
>>> +		return XE_SIGID_DEVICE_MEMORY;
>>> +	case XE_RAS_COMP_CORE_COMPUTE:
>>> +		return XE_SIGID_CORE_COMPUTE;
>>> +	case XE_RAS_COMP_PCIE:
>>> +		return XE_SIGID_PCIE;
>>> +	case XE_RAS_COMP_FABRIC:
>>> +		return XE_SIGID_FABRIC;
>>> +	case XE_RAS_COMP_SOC_INTERNAL:
>>> +		return XE_SIGID_SOC_INTERNAL;
>>> +	default:
>>> +		return U32_MAX;
>>> +	}
>>> +}
>>> +
>>> +static u8 ras_sev_to_cper_sev(u8 ras_sev)
>> Ditto.
>>
>>> +{
>>> +	switch (ras_sev) {
>>> +	case XE_RAS_SEV_CORRECTABLE:   return CPER_SEV_CORRECTED;
>>> +	case XE_RAS_SEV_UNCORRECTABLE: return CPER_SEV_RECOVERABLE;
>>> +	case XE_RAS_SEV_INFORMATIONAL: return CPER_SEV_INFORMATIONAL;
>>> +	default:                       return CPER_SEV_RECOVERABLE;
>> I like this formatting but these should be consistent with similar existing
>> switcheroos. So whatever your preference, please make all of them consistent.
>>
>>> +	}
>>> +}
>>> +
>>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>>   {
>>>   	struct pci_dev *vsp;
>>> @@ -612,6 +641,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>>    */
>>>   int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
>>>   {
>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   	struct xe_ras_error_class counter = {0};
>>>   	struct xe_ras_get_counter_response response = {0};
>>>   	int ret;
>>> @@ -623,8 +653,13 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>>>   	ret = xe_ras_get_counter_response(xe, &counter, &response);
>>>   	if (ret)
>>>   		return ret;
>>> -
>> Why?
>>
>>>   	*value = response.value;
>>> +
>>> +	if (xe->ras.cper_on_query)
>>> +		xe_emit_hardware_error_cper(pdev, ras_sev_to_cper_sev(counter.common.severity),
>>> +					    ras_comp_to_hw_sigid(counter.common.component),
>>> +					    (struct xe_ras_error_class *)&counter,
>>> +					    (struct xe_ras_get_counter_response *)&response);
>> Why the casting? What changed?
>>
>>>   	return 0;
>>>   }
>>>   
>>> @@ -1069,6 +1104,56 @@ static const struct attribute_group gpu_health_group = {
>>>   	.attrs = gpu_health_attrs,
>>>   };
>>>   
>>> +static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct xe_device *xe = kdev_to_xe_device(dev);
>>> +
>>> +	return sysfs_emit(buf, "%u\n", xe->ras.cper_on_query);
>>> +}
>>> +
>>> +static ssize_t cper_on_query_store(struct device *dev, struct device_attribute *attr,
>>> +				   const char *buf, size_t count)
>>> +{
>>> +	struct xe_device *xe = kdev_to_xe_device(dev);
>>> +	bool enable;
>>> +	int ret;
>>> +
>>> +	ret = kstrtobool(buf, &enable);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	xe->ras.cper_on_query = enable;
>>> +
>>> +	return count;
>>> +}
>>> +static DEVICE_ATTR_ADMIN_RW(cper_on_query);
>>> +
>>> +static struct attribute *cper_on_query_attrs[] = {
>>> +	&dev_attr_cper_on_query.attr,
>>> +	NULL
>>> +};
>>> +
>>> +/**
>>> + * DOC: CPER on query
>> Is this actually hooked to the docs?
>>
>>> + *
>>> + * On Intel Xe platforms that support the RAS error reporting interface,
>>> + * the driver can emit a CPER (Common Platform Error Record) each time an
>>> + * error counter is queried. This behaviour is controlled through the
>>> + * following sysfs attribute::
>>> + *
>>> + *     /sys/bus/pci/devices/<device>/cper_on_query
>>> + *
>>> + * The attribute is a boolean (``0`` or ``1``). When set to ``1``, every
>>> + * counter query emits a CPER record built from the associated info queue
>>> + * data; when set to ``0`` (default) no record is emitted on query.
>>> + *
>>> + * Reading the attribute is available to all users and returns the current
>>> + * setting, whereas writing is restricted to administrative users.
>>> + */
>>> +static const struct attribute_group cper_on_query_group = {
>>> +	.attrs = cper_on_query_attrs,
>>> +};
>>> +
>>>   /**
>>>    * xe_ras_init - Initialize Xe RAS
>>>    * @xe: xe device instance
>>> @@ -1098,4 +1183,8 @@ void xe_ras_init(struct xe_device *xe)
>>>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>   	if (ret)
>>>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>>> +
>>> +	ret = devm_device_add_group(xe->drm.dev, &cper_on_query_group);
>>> +	if (ret)
>>> +		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
>> I really dislike that we're ignoring error here. Same was done with
>> gpu_health_group. I know they're non-fatal but it just makes them
>> harder to root cause when something else breaks as a side-effect of
>> this. But again, not my call.
>>
>> Raag
>>
>>>   }
>>> -- 
>>> 2.54.0
>>>
