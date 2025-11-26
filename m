Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D49FD1118E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 20:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3227910E113;
	Wed, 26 Nov 2025 20:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFFTVIZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BEB10E113
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188136; x=1795724136;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kfgMrUD/LOpg6RAmSvhNw0ECWDzbDElnB6V0orZi1Wc=;
 b=IFFTVIZAL5oxjoYhcjkSlLRGeVWvzxkJUGoodf7sx94xiATOCRV42EsA
 r+4NoAHmS0nLEezeJW43VZoyKAxoCMLdO/RqdhNTdK1uormqUVv2TPXdE
 XoxyJQSN/TDJPwfnFuH5MHQYrGZwdh4/vrJXI5Q57KtvFKmLLEy/DnVcv
 qCMZxYF5JWSaE9H/7oCChSY9vYLyDf0IYH1zjLthtJ8I3/2Vq+ZnmsQbM
 8UhtYGsuzq9WHiR5026pAtIba7rS79duccOUeOd5Ktw1Lv7Wnj9DkGyfb
 k3VLtxN/QYbw2Wsn5kmapqwgbFKwspDCQwrSUSload/nnjlW3cAAIfQ9D Q==;
X-CSE-ConnectionGUID: TPJ4uGWCTs+tx7Tsx8aZpw==
X-CSE-MsgGUID: 3nvBL4iEQyCEZ/cEtljmgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76922817"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76922817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:15:35 -0800
X-CSE-ConnectionGUID: pEzPSUYrRXKyQc34MyMOuA==
X-CSE-MsgGUID: IS89itPFTuC0uR1CQk/l4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192687607"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:15:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:15:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 12:15:34 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:15:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OS1i0d5ctlf/BxUt9EVwX6qqM044hIyHeET8K3EIcn/elq4A9c8SCPCYlqpWZWgfTaiBtmHpFUHFQdJUHJX1QI5idmsh0qobFjvoD2LGkHRPETiho6QETrHcqP5q3Zs/md0Wx6E6AQpJgeLnkVEtCT5lPK47PGWpZdq+kMlxoU3mi0NbSGLSyw1rgRQrYfsrBCE8cjEFEAWkPJ1TyngPNLWKiyVli4PWtIPTKi2gPXT8q949uj+++eHvD4DCMQHjIhRV502QFRBi7GnAMqBpkYvMOSdZz5IN/S444MnOj7oReuJ7VPVcYRBpZ7dCywJkl5oAcoav7v1uTUdksv9jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I34E7z2BI70m3qg333OGtLZkZp1LtoQ6Ok73e/4R9eo=;
 b=T49fApI//tvGexi2mGJCtJtsbhc3rrjMrsOQoSgswu+pookD4tsbwIrQLSSn432/2EyEQWI3dBD+siVrcLTvcaEp2BbLA1LavPehYAY2P8Gv7jQvCpEv/0uyzlni6USopY1RJ9eT8WEvJwIoW3qagIvh3ORQDM1rzeOXdzjN4IXfhCG8Ht+ERptDhYdQB55nUA91IJgJAT1B7hiSKMm++vyxyB68lb+6AVa5E09lynXMMxvTwtz454sLjj0XwAyiTmxhW7xpR/RyPntSmvgS9IQv+ZEIsMH3144pWpPpVjBezsexjMs90CVSGZl3Uo2ftK9j91uIHOuU7yhal8ruoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 20:15:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:15:29 +0000
Date: Wed, 26 Nov 2025 12:15:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/oa: Allow exec_queue's to be specified only
 for OAG OA unit
Message-ID: <aSdf3+JXMcOiHZqZ@soc-5CG1426VCC.clients.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6c6a5d-efc8-443e-7cb5-08de2d288b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0N0WGp1anJoTk5JUWdFdkx3aW1QdHNiUWEwbkx3VkVkNHhjUGtwVm9OQW44?=
 =?utf-8?B?YmkyeE4wK3dEdXlVL0RZMUZIaEdFRk5McVlBSkFJNlpQL1A0S3NxdTFhV0Qy?=
 =?utf-8?B?a2pXRVhXTzFDT3RHVW91cng0NUl6Zng2cXc0cENYUnZvTnQwNVNpRm9LR3FQ?=
 =?utf-8?B?MGsvMUhsSytVZWcrOTlOdldrQlczUHRja28wTHNBenZvVTdhWkFIamxTbkFG?=
 =?utf-8?B?N0RMUGt5eWJIZkwxWm5ad1UyNHRQR3p1eDRzN2k4YmtwaHdnN3RvR2JxSlNl?=
 =?utf-8?B?UTd3QzdqZTZ1bG1IK3NEUmxXbkJaV2NjRHZJSis5ZzJCUThIakZRdnBHcStI?=
 =?utf-8?B?NVVRdHFGQ21YbE5zT0Ywa3RyOFZFcjZOdlllNGhURHNyL2RudCtWcmp5Vk96?=
 =?utf-8?B?dzRvdjVDZTgzcGdnbnMyYkc1aHFyZ3g5WmFHNXg2RUpnUU5BSnRSeS8zcE0w?=
 =?utf-8?B?angreEFKbEVwMndrclhOQk5UeG1OamJwUDBzV3o3MG53YXdvMjFlcWN3clNJ?=
 =?utf-8?B?OGVYU0svSlByUStXWTJMUk9raTJpTGNRQ1R6LzFxSVp1U253UjZaaHlwb3dL?=
 =?utf-8?B?VVJ1Wm5WRHZsanU4VjVyTC9MdlBRVm9PS1hManZ5YUJuYS9RczZYTVpPY3Mw?=
 =?utf-8?B?YkVhU1l0czgvaTdGMC9zSklyMGpyaDArbUJ2K0lJR0hzUjhPejNJeU9UNFFR?=
 =?utf-8?B?bzZINWF4b0JSRmgzQU4vdFZnZG1HSERTMFZvUXEybWFMRjloN1M0dWp5UjZK?=
 =?utf-8?B?a25ZNnFsbEdmek82eXg1VnhkQ2FnQzUwMTJINHNKbzMzTzVIMjFoTWtyQVgy?=
 =?utf-8?B?UWI5V2MvaFZNQ3N1VW10NmZCZ0hXUGJzTzJaZmptcm1ibUN0RFlyVmdyZnBQ?=
 =?utf-8?B?N1NMaUNpaXB1M1Awc3MxMnp1eHZKQlN0WVovNEg5ZzdVbzFLbFhHdnNEK3Zn?=
 =?utf-8?B?YklnSUR3aFpHZytKM0pTUEhtb0lnYTVuKzI1bW1EUWREUy9kUHlVeHA5OFlm?=
 =?utf-8?B?R1lpNEExWWcyQW5xL0E2TTh6MzJaU2FSSkNCR3kreXJiUm9QYkUyamZUQzg4?=
 =?utf-8?B?cGZiVnMwaXg3WmRtaVN6cTZQa0JyRTU1V3FHeW9QQ2c1SmErYm4xRktyTXF3?=
 =?utf-8?B?RWQ3ZzRSdVp4MFBBQ0FUS3hkRllXL1ZjUHdFNUJiMFZRRU9DU3NtNFQ3ajly?=
 =?utf-8?B?T1M3Mnl4T1NhNkhTcmhud1JKbVd3cDFtT2MrNldvUTBpOGZVM2pueGhPaVBk?=
 =?utf-8?B?Q2ZIb3h6c2tzb3hoMlYyRXpnSGdybjMzamNZVXl6ZHl4eE5lYjhhdUJOd1Zt?=
 =?utf-8?B?Z0JxU2ZDdzNyOEJmRUV5U3J6dVhYNWt1NkF3TXZ3QStjQjQ2czlLMmJRL0F1?=
 =?utf-8?B?cU5Pa3FLREt0a1phak1reWpJajdNWkZNOFZVakNTaUY4d01scmlSd0xrekM5?=
 =?utf-8?B?Zk1LLysvaFgrYmErK2JZdW1INnNmazhUbWlLbzlhUHROaUpxa0g1bCtPa2Nk?=
 =?utf-8?B?engwL3FUUEVpMmtYczdUVzBscjBmZzREUzYxWGhZSnlBNC8rWEY0cDdTaU1I?=
 =?utf-8?B?bXY1cHFoQ1d5aDhxaTArL0x3NkZCQzM1Rjd2WElOOXpxTk9lZlVWRC94MUNM?=
 =?utf-8?B?MUtZWFE0ckhScnR0N0NEeUtYSWl6d1ZVbDFnS2xWUU1DaEl1aG5PTE1PNE9u?=
 =?utf-8?B?VUlUeElkMEc2V2pzS05ZZUhpdmM2WERvWkt0eURpa0NFeEFjNE9LV25wU2du?=
 =?utf-8?B?aVRuSDZVTE9tTElCOE9hNk1rMmpFMTRaSzJUWU84a2Y5Z3NVS0xhT3EvbTc1?=
 =?utf-8?B?ckhOVXpXdVVsUWJLT0hwek1qQkFyVWZwMDhRWXlJQS9JelIyNTZJUVhiZGd5?=
 =?utf-8?B?ZlhQZjFoZ1p0S0gvNEw5MnFzUFZTaEE2YkJqeVg0VzJJRy8yT2Y3cFk0WlNB?=
 =?utf-8?Q?cwHTZ+oNWcOcBSCO02OJ5o5poQ8rPAo7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzUxb00xbnBnSHB5OHpONkhpbFZuVmFZNXZaajl6eGc4S1hKTTlVL2d2YTc1?=
 =?utf-8?B?akRrZ1dSckcrY3BsbHFjNTI0V0xZNnh0K2hDNkFoTS8zTnhSMjZqUE5Lb0Ev?=
 =?utf-8?B?TzRDeU1pVWJvK3NIN1kvUDZXbU1pNExtSVd3ck40RE1IdkJXL1lPQ25ta1FK?=
 =?utf-8?B?c0FLVlVVcFk3NUdYTjVNUmdVWGpCTFkvTjIvZ1M4NVN1YXNWb290djF6bFdW?=
 =?utf-8?B?bnJZaElFM0swNWtzVVJqY0V1cDV4RDVIZTVBbmJvWElicW05aC9sbisxTnph?=
 =?utf-8?B?d2JGcU1CQXhMVE9GNkRTdnVnMWl1dXBmczJKNGFOd3BieXJuK25LTTJOVU9y?=
 =?utf-8?B?VStsTEc3QTdicEZ6ZDEvNnRHMzFMYWN6c1lPV3MrVk9QY1B2M2ZrSWNoR3ov?=
 =?utf-8?B?bkhDN1ZqVWdZM0dKdWM0SmxLbUhNN1hFNWVEUms0MW5NbGdZdzNVczU3VnVn?=
 =?utf-8?B?L2pBQjlucGFkNWlEZlluYWx3b3psZkpPVjBKdFJEK1d3Y1N6QnhMSjV0N2Z3?=
 =?utf-8?B?VkVxdlN0TEtoTWZBK2Npb09WSjM1OXJ1NDA2Q2NHK1FDdGRicC9uSnBhUnQ4?=
 =?utf-8?B?cXgwWDd6dC91MERIaTI0bno0L3pxcFNFQnZoZjJxUlZRZjdqdEFjNzJyNUxw?=
 =?utf-8?B?TEMrV0Qvd2hVME5sVTZiRkJybVYxM1oxbXhiTWlVcmdGVWZjNGRTNVAyczVD?=
 =?utf-8?B?Mml3RHBvL1VtcmtZd29Zd09LSTl1R0JUQ3ZKSW1zODhiYW5aYkMzZ3F4ZkF3?=
 =?utf-8?B?S1d3emlBV0RJbzh3VWRaRlVPbU1Mb25CYk5iZ3M5cEkybE40NnEzemR6Qis5?=
 =?utf-8?B?UVlIRUcxcWNoMjlBSmhXNlI3QnpuWlQva2UvV05neEhZQmlBV2M2cE8vQTZ2?=
 =?utf-8?B?ZUFhRXYxb2xvaEJYdFp0VDJ2RE9NbEs0T2V5NExyQ0lycUtOYk1DTnk2NDJn?=
 =?utf-8?B?OFUwak10a0grYW9tKzRNeDFaaEl6K214YkMvbTAvVHJIRTBONk1iK1JEOWho?=
 =?utf-8?B?TXFOcEt6MFVxQkZFVEpkdlVzQkJqdFhEU2xkeU9HaFBsNjR1czJuYjdMQnM2?=
 =?utf-8?B?N20xa3B6ZGJJTi8rd3NwMUNUTUJyenNLZ2piV2xKYkdsQkQxY0R0UXQwQVVZ?=
 =?utf-8?B?cXJORTdPNHlXTTlrdGQ3R2Yvem9RNk90V1ErTGtBTGQxaUVSZDQ1VzdwVHky?=
 =?utf-8?B?eVJjR0lKOVQ2WnZzd2wyZ0ZWOVUrQkoxb0RsYVZLckttTlFhc1BQeTNaMDVz?=
 =?utf-8?B?aStqcTFzVHphWGRTSEZXTzNuNkM0MVpRa2JCMlhWc0RTc09RQlBvNlQzVW9W?=
 =?utf-8?B?eU5BY0dsYk1pOGprb0d6SVN0RVpvNUo3ODZuVjlCeWJpOGUzWkhEb2NhbUJs?=
 =?utf-8?B?Yld6dmdEQUpTTUo0ajBIb1Nrempxc2dqSVFISGYvR01FU0dFOU5FNGFJeW56?=
 =?utf-8?B?a0VIeStyRlh6N2pHcmNrSjJwY09hZHRBNHREOG1wbngvK0hsdCtjSDlpSFZM?=
 =?utf-8?B?ZHJ1MUp1d1BPb1FDUXhKTnlRSlZPSUZlT1MwbGxrL1FmVm5PcTJEbmxxTStv?=
 =?utf-8?B?aGR0RGpLcDVXdXZZbVVCQW1RYytmL0JYZEJUZU8zaHlOZnkxRVdUclZjQkIw?=
 =?utf-8?B?bk5nZ2F1UU5wd0t4MzY0ZUdOUFlCSEhBTElwd2hZT2RKblVjV1FYbkdjbGow?=
 =?utf-8?B?eVVNSm00LzRxNlVXRFZPTUFza1d0K2FlUHdiUnJuS29xQ21kTEhGMUdmdVBK?=
 =?utf-8?B?TnovMURXNno5ZnUzMnhPUkErK2xLdUsxKytoTEQ5SGxVN05PYThOQk5iUEpK?=
 =?utf-8?B?TUZiTDJwSjUzeThSTm0yUWlDdmRZbDlGOVhPeGJvVUxZa0NCTkR2TkpBdGxx?=
 =?utf-8?B?Y0kralNEQ01QeG9XZE1obVBQR0ZJQzF4K210cGRQczYvTS95QjN5VlhxY3hS?=
 =?utf-8?B?SVUzRC9Ba3N4ZVJ3cjZTRExtOGZHWkg2Ym5YcWNQNzVpQUhzVHArK3drVXl1?=
 =?utf-8?B?VXRXdE91cXRvdFBsL2Vuc2hyMTFNV3NiOTdzd1A5NDBNR1FYbEY5R1RxN1J2?=
 =?utf-8?B?N2ZzZmpDSDJNYjRMTHlDZUo3bFlWdEw0bTdBWWthOXhJRW5wYlZzalBXaHgy?=
 =?utf-8?B?RWdEZVRRbzd4Sm5nclFyUlFNWmR5RUh1SVhacE94ektWWis0cjBFcWxMa2pI?=
 =?utf-8?Q?4wxTY6wDXw8gSgEzCMUCiQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c6a5d-efc8-443e-7cb5-08de2d288b5e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:15:29.4649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNcGneQr2hTLAUmp/7k/erDrLSp9REMawn4GDoUq7AFIp4k+hFjw7hFk4cwTz8Q2l5Dl8c1Sw8Rn5vF6xw0ZlciwHtQIKCUCLRxguXGcVyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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

On Tue, Nov 25, 2025 at 07:52:18PM -0800, Ashutosh Dixit wrote:
>Exec_queue's are only used for OAR/OAC functionality for OAG unit. Make
>this requirement explicit, which avoids complications in the code for
>other (non-OAG) OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Makes sense,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 75db5530cb557..d63c04e2d4922 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2032,6 +2032,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 		return ret;
>
> 	if (param.exec_queue_id > 0) {
>+		/* An exec_queue is only needed for OAR/OAC functionality on OAG */
>+		if (XE_IOCTL_DBG(oa->xe, param.oa_unit->type != DRM_XE_OA_UNIT_TYPE_OAG))
>+			return -EINVAL;
>+
> 		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
> 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
> 			return -ENOENT;
>-- 
>2.48.1
>
