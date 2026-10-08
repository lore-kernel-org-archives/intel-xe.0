Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C3CA600D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 18:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6910E11E;
	Thu,  8 Oct 2026 18:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDBC8Nm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5187210E11E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791485548; x=1823021548;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jpF21T/B8PLE2CQjARTYxNm8jkGyAzHbZqrXhv5Y0mw=;
 b=KDBC8Nm9rRhZdAwR4K7NXB+nbHfDPyy9E/r7T8Ogz7g9kix3aYIweegX
 wEKD6c68kvIsXNQITSV2lGdus94MhjUw6Ac3soMIT4LrbJr2Lnp6sE7wo
 EuBZKc7g2C+FhiV6ZOuM9lTyb1yQtJK6jyxzrmBhSWqjM1SFJbreVEaDd
 vIHqoST+GUEzSHGY1G8W0LvBMPBFHVucxDjj6fILAwYAvUaMOsgCisNCm
 m3jtGwgUn2r/kaq0+9B1rFnSI0T9+bB+JP59qd71ByxP2/J0gEygnbCfR
 1Q8z9mcdJWaKuK3SKKDqEqt62CxNhtTN93kVyP0hUu2vHJ680q8yqAe1v Q==;
X-CSE-ConnectionGUID: 39KJRQk8T6W0K/AGhFPS7g==
X-CSE-MsgGUID: PISm4MNRTY2qiarWFjXmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="280391"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="280391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 11:52:28 -0700
X-CSE-ConnectionGUID: ENWJSF5UTl6bYLjg8T+u4A==
X-CSE-MsgGUID: gNHOlyWfSBm1azg8B+N8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="118842"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 11:52:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 11:52:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 11:52:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 11:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lStiSlJ4waOmJLDJmfZ5BgDVk5TW7vzpsqM8PnO7MEJ0Gd4tCUGox4PZ6bugXTtUyTh1WxxdJU+ZY6jstwBcdiFERUvfyMb2iLFF9sfJ3wAVkzofVWlD3dzrWl8UINkxNgkbe72xy4TdWyuqpliFv6wxpwXbbhT99hGOz4DS4Z7hzGdR/Ub9wMfpL3tbYbRI38syolpToyo/RrZDojKqOr/Ww983wZhVJSOAP7liPsbCLha/pXcfTFbRJU8emdSywN0rdFmcO1rBmO/0MbX0mP1oftpr/pTE30UQtqpBhpsSOJO24ZUSHNjeyhrtNpkbJg4c/9oNFnb6cGmlwoNMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUDEKi6A4yHe37d92JPpUdpyatfgk/lRmNOI/rSqgrU=;
 b=yztZROxXlP6djiFgarsbddIW/Y5Som050Fz2eh9TU1RE6/MNexmzKkBVlIom+AMK+yoJ7kviKm4qOEtLZ0VTym4SYSLUs0fpg9WoEzN6s7tIhRXm0psn+XntV0ON93KhCoyFFidRifSmq8+f8eUE6CbGWbaa6Q8fUoiSzempgH9UG2HTmnqyhCItU6vPu1J7FsarmMBXHB1SMI93zAeRb7Ai6tTQdNcr/I7eaC8daciUGTQkATqAmXkZLznQF4VBpNf239+4plSVLLYBJU1DvYjHztmI6G+wOIYEyihYuvaBz3Pq+PLMsAJyUUbjslH5MVJoTSSbF+6AZF4RYEogxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 18:52:21 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%2]) with mapi id 15.21.0451.026; Thu, 8 Oct 2026
 18:52:20 +0000
Date: Thu, 8 Oct 2026 11:52:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Add mailbox control state to error
 messages
Message-ID: <asfmXkp+dvsDfZlQ@soc-5CG1426VCC.clients.intel.com>
References: <20261008170710.3584183-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261008170710.3584183-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 9065c9ed-78b4-4ae8-64ac-08df256d484d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|10067099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: j+8ArMbks+eZkIyi0tHuFn7aZnklMQ1rX+a0UZmi71Fszp79xXGsnCAnAi1wSVrTuU2NKbvte2vJT+/zXe3DYIcJQ4HpGClPMtZtyJA+MLPaGvvFN6xysxyhUZXoZOezTFDIJM16SvYFPII1eodnReXdkmZ4yt7vV3DcAqc91lppM2MCt4nNjQfyfqaOveE196w/AdgYS7X9ReDlhiW760Tt+mTI+DHNRu2m1l1Imi/yPLRxm9938qm30KWhUfNHeiTN1ZQIRo8bgO00LjVuVOAfSInrh/wS/1p+NLq7TqEfKpvEZzYxaGXPqRnOFATCwcDBj/FJJKDu8QVG0ThiYLePC+fvDQIFKVNSEnbupsIWjUt89nriHARon64zeBxFkIIehE+kTZTvhFr+oY87RMbDd4DQIkG9sjbrcMUbFu1/vIxul7JtZnKvrsn4EgG+9WPNcN+hswkNQvOU9xBhp7ZAlAnxisRoeRQGY5nylEKdCjhLdBkQvd4waN5zAQzsj5+sZMmY60SDx6fwYOqjX7P0xBxoXDANLH0aGQH6sUnN700mLETLQRad5usrTXIUFbNWHjT591UTmyVajNTOMHpRohsq5TSBHgFEs8As6AhjnrfCHLR5wnNnRgGSOKSxfPIrnaPVEHVNmhvVcZYFCVY55GUbDkOxxTHqA0LqxiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(22082099003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czFxeTFsZ1dGcjVqaVpESUJIUzlpa1V3Sm0wczhpY09LUURlaU8zU0p3QUNt?=
 =?utf-8?B?cFFBUWRTbVRSdkVwRkY3TkVBQ2ZnRlhXVkx3VExabEFuVEFkOUFENzBHeVll?=
 =?utf-8?B?YzZ2SkNNblZaVmtkdEJtbkIwY1VTQitEVXZyZkYyOCtYR2ovTEZuRG9qSDFz?=
 =?utf-8?B?ZkRWWmNGTGJpS3lvR0xnZlBzcDJQWlZDbE5JRVc0U0t6aURzSTNkL3VGeEEr?=
 =?utf-8?B?TEwxNjZHQnZEUHoxOFYvZUpPaTA1ZkVjeUFzdTV4N2k5SkJxMW95VGtRUm5I?=
 =?utf-8?B?cmk3dFRhaDFSbVdQMDJ4Qlp1UWxkWEMyZUtNMy9YUW5LZkh1Y3N5K1FJTWxT?=
 =?utf-8?B?a2R1MzRXeEJRcklwUEV0ZzZFMHJwVnpCYkRTelljSFAxaEJFaUFzcENFWkJu?=
 =?utf-8?B?NjN3QjZUbkR5VVkyNVpTOWJGUllDZmlaWndBRmUyV2hUQnozRDVJRU1uYnNj?=
 =?utf-8?B?OWlMRFErSTN6YUUrWXJSb2FZSXBCSkNWSjMrWGsyRitpOFdxTEtiUDU4TG92?=
 =?utf-8?B?eDhMbjBhMHhMUnRORHh3Zkw1MGxzL2docGxKNVZUVXBVMVBTYUtIZWZ2eFl4?=
 =?utf-8?B?R2VKOHZkU3hpS09RYm1RY2tWKzFMWlJkb0VEL3pzSldNeGR3Qkx0aHQ5eERF?=
 =?utf-8?B?N1pHN2dBMUVNWVphK3hyWU9CNDViK1Q2d2RBeElwT2RhQXhSS3gyTEhwUXVz?=
 =?utf-8?B?LytOS2VTSFR1Ym9KL3NBMW83Skh6RjdNTVArbE9Lelh3bDk4TUsyc3VUZWYv?=
 =?utf-8?B?YUZOeURzR1hqbmtjSE1aNlM3cFVRcldIeFV5OUNtYVdVZ2p0UUdxOC9Tb2Y0?=
 =?utf-8?B?UjZ3ckM3VGlDZElIeVF1dTFBeFUyTkJKT2s3Sm9ZNHhtdzNueTc1Z2RvVjMx?=
 =?utf-8?B?TytSd1dqcEFsRmdULzFGNUkycVdjUXdqRUJNZEUvcVowMTZ5QmFwZnRnN1cy?=
 =?utf-8?B?eHczUDBPcEFxdTFDMStEblNFNkcycFJqeityTk5jSU41bWE4eVJxQ3hIRmN4?=
 =?utf-8?B?eW4vNVNTcmdXN2QrblVkeTBKUExZUEF3aHllMTd6ZmJ4UWpocFNvaVdQdkdL?=
 =?utf-8?B?VkhoVDRuOVhGTVBQSm9LWDI2a0pRMlgrUmo2alkrUnJqaENtZmZvUzY2WHZM?=
 =?utf-8?B?WmRzeTE0bUptZkRqbWxkVkd3dVNBZEhlY0szdU13VElQZ1c2Q2tqQnNjZklY?=
 =?utf-8?B?YTJNbWh3VzYzNWFSRUFxWThTZDltNFFYdWpra0daZkxuMFlRK1FQeDNUM2pX?=
 =?utf-8?B?QWRaL3JnMWJpekI2ZGcvYVdUYzduZHlTTHd2V3NJeXZaRWFtelYwdFVtR2Vx?=
 =?utf-8?B?dVFiaGE0NTI3R3JiTDNzQ3Q5NXFnQmhOcEppMGFVbS9nSEIwYU1TV3JVV3lN?=
 =?utf-8?B?bHZvVm1HYzNvU2RRZ3VBbXVVZzNwUnp2dU1wZGZXUzlkdkJlM3hDQmZrWWZL?=
 =?utf-8?B?Sk4wRWJZU0xka2ZSSnB1V2tPNmYxRmdtLy9JVFZIMXRZN2srMUVNUTNvOS9S?=
 =?utf-8?B?czQ2WkVPaGRqRGF0TUtZYWpwUDExWXlpbjcxVmRPbDgxQnlrSXMrczlkTkxa?=
 =?utf-8?B?d2h1cEtMVi84QTR4QjBrRFQzdTA0WTY3M2t0NlowQmdlWUlKam1Ha3g2OEVH?=
 =?utf-8?B?VTV6RFRRV0cvaEdKb0Jid1Rwd0cwT0ZGWHBHdTBXM2ZEYzNldFY5RHFCZm52?=
 =?utf-8?B?NXpiazQxTDFjMlZqRUpmOXVkNjFET0U5YjhjQ2dBbHg5QUhkdW9jSHVRWng3?=
 =?utf-8?B?cEUxUjBYbXkvRzIydUxJUy9lMmpyUENqV2NtbG9Rajg0WDRiZXBLRGdOTTZF?=
 =?utf-8?B?L2s4Mkx1cVgyWS9ib010dkNId2orZHdKV3RBczVMYWQ0cjdFZXNEajBoOFNM?=
 =?utf-8?B?SW9XY3dxT0gwODNPOE9WRnNtODkzb3lIYWxTN1djU1Q1c2ZBaGgrcXdyMXpj?=
 =?utf-8?B?emJiZktiQ2JXZ3RNaFJPdEQzcTVHNzlma1cyNFQ1ZDBYM0hHcE4wRzVVT0tC?=
 =?utf-8?B?dTBXam42bkRDcFFvTExwUWh2aWNLRC9wOEpsRlRsMU1LZFJOZnU5aHhUVDVP?=
 =?utf-8?B?TzltUE5NdlU2dnlkL2hkVGFjcDFLd0V5U09RTVdVMWlneUVmbXpsK1FpdTYv?=
 =?utf-8?B?TDVEd1VMclhJd0MvMnBwOVJ3S2lKRFZrUTA1d2hkOG0yS0VJc3pDa1BqeXlZ?=
 =?utf-8?B?TGlMRXdnWjJEYVRFdVpnRzZuVDIxR1d2VFBsanVrVW15d1RFdGpkREV1eHZ5?=
 =?utf-8?B?Wlg2eGR5aXFYSjFCVlJ4bzI2SisxeUhWb3liWmJQblAyK0RpOUlZMmxpcVRV?=
 =?utf-8?B?NFprVFZtekJib2pRM21YQWtwZC9peko1b3ZHQnp0YjBuMWd3a1JaTnZId2ZZ?=
 =?utf-8?Q?Diy8uIufhGGtwvuIHI377iobfxwe8RYXyLYxe?=
X-Exchange-RoutingPolicyChecked: BuIkPz0rq0AhuxONB0uxKWCajJZNs1uAxMrWnTCPKtypVWPWnW1mE0hhL3ZTXOK1MQew8ka/3SZF/V49SIgj+oWMnbXHv50MUHOsh99D1hFUWj8FX9umwLmgvPQpScoiCO0zzHTtfsR+srGJfRlshOKRhmk6v7jpZDRtVGg2rd9KfftzqzfqWWpwbd+3SeIKf/q8nGoTqcM6ybOh3pQTgvDxeczqrEPECxq/zaYI9cI5YGQbTiBmE5fo6clhQY83Qts4IYpUDHd4x1krsQ9vrbzQJ6SMoqWn/hYjqRZULkFDjAli830F1x5wAlCIeZjp1OQ++TI3TAbURc5jIJpxBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9065c9ed-78b4-4ae8-64ac-08df256d484d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 18:52:20.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpvbtvzFb6cJLikSsIyYuOVq2Gfbbax1y0JNj3FP1t9U4MFDldzZdr3prowxKY969nvV+tT2rfbooI0kPxQFl39LDxRvIeKZs8c0saW+UjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Thu, Oct 08, 2026 at 10:07:11AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Include decoded mailbox control register information in mailbox
>busy, timeout and firmware error paths to provide additional
>context for failure debugging
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 60 ++++++++++++++++++-------
> 1 file changed, 45 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index 25425e8bb533..31d0d80b1472 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -7,6 +7,7 @@
> #include <linux/cleanup.h>
> #include <linux/minmax.h>
> #include <linux/slab.h>
>+#include <linux/sprintf.h>
> #include <linux/string.h>
>
> #include "regs/xe_sysctrl_regs.h"
>@@ -36,17 +37,28 @@ struct xe_sysctrl_mailbox_msg_hdr {
> 	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>
> static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>-				  unsigned int timeout_ms)
>+				  unsigned int timeout_ms, u32 *out_val)
> {
> 	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>-				  timeout_ms * 1000, NULL, false);
>+				  timeout_ms * 1000, out_val, false);
> }
>
> static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>-				unsigned int timeout_ms)
>+				unsigned int timeout_ms, u32 *out_val)
> {
> 	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>-			      timeout_ms * 1000, NULL, false);
>+			      timeout_ms * 1000, out_val, false);
>+}
>+
>+static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
>+{
>+	scnprintf(buf, size,
>+		  "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
>+		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
>+		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),

REG_FIELD_GET is already doing a (U32), no need to do it here again.

Also move the format string to first line

	scnprintf(buf, size, "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
		  REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
		  REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
		  ctrl_reg);


>+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
>+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
>+		  ctrl_reg);
> }
>
> static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>@@ -128,17 +140,24 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 			       const u8 *mbox_cmd,
> 			       size_t cmd_size, unsigned int timeout_ms)
> {
>+	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
>+		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
> 	struct xe_device *xe = sc_to_xe(sc);
> 	u32 ctrl_reg, total_frames, frame;
> 	size_t bytes_sent, frame_size;
>+	char ctrl_desc[48];
> 	bool phase;
> 	int ret;
>
> 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>
>-	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>+	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> 	if (ret) {
>-		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+		xe_log_err(xe, SYSCTRL, ret,
>+			   "Mailbox busy %#x.%#x %s\n",
>+			   (u32)XE_SYSCTRL_HDR_GROUP_ID(hdr), (u32)XE_SYSCTRL_HDR_COMMAND(hdr),
>+			   ctrl_desc);

same here (no (u32) and format message in first line)

		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy %#x.%#x %s\n",
			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr), ctrl_desc);
> 		return ret;
> 	}
>
>@@ -159,9 +178,13 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>
> 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>
>-		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>+		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> 		if (ret) {
>-			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>+			sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+			xe_log_err(xe, SYSCTRL, ret,
>+				   "Frame %u acknowledgment timeout %#x.%#x %s\n",
>+				   frame, (u32)XE_SYSCTRL_HDR_GROUP_ID(hdr),
>+				   (u32)XE_SYSCTRL_HDR_COMMAND(hdr), ctrl_desc);

same here

Also, Would this print the frame twice? Once as 'frame' and once inside 
ctrl_desc?  It looks like the one in ctrl_desc is the same Frame that you write 
to SYSCTRL_MB_CTRL. If so, you could drop the frame from the message:

			xe_log_err(xe, SYSCTRL, ret, "Frame acknowledgment timeout %#x.%#x %s\n",
				   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
				   ctrl_desc);


> 			return ret;
> 		}
>
>@@ -171,17 +194,23 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 	return 0;
> }
>
>-static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>-				 size_t frame_size, unsigned int timeout_ms,
>+static int sysctrl_process_frame(struct xe_sysctrl *sc,
>+				 const struct xe_sysctrl_mailbox_msg_hdr *req,
>+				 void *out, size_t frame_size, unsigned int timeout_ms,
> 				 bool *done)
> {
> 	u32 curr_frame, total_frames, ctrl_reg;
> 	struct xe_device *xe = sc_to_xe(sc);
>+	char ctrl_desc[48];
> 	int ret;
>
>-	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
>+	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &ctrl_reg);
> 	if (ret) {
>-		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
>+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+		xe_log_err(xe, SYSCTRL, ret,
>+			   "Response frame timeout %#x.%#x %s\n",
>+			   (u32)XE_SYSCTRL_HDR_GROUP_ID(req), (u32)XE_SYSCTRL_HDR_COMMAND(req),
>+			   ctrl_desc);

and here

		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout %#x.%#x %s\n",
			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req), ctrl_desc);

> 		return ret;
> 	}
>
>@@ -219,7 +248,7 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 	while (!done && remain) {
> 		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>
>-		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
>+		ret = sysctrl_process_frame(sc, req, out, frame_size, timeout_ms,
> 					    &done);
> 		if (ret)
> 			return ret;
>@@ -240,8 +269,9 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 	}
>
> 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>-		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
>-			   XE_SYSCTRL_HDR_RESULT(hdr));
>+		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
>+			   (u32)XE_SYSCTRL_HDR_RESULT(hdr),
>+			   (u32)XE_SYSCTRL_HDR_GROUP_ID(req), (u32)XE_SYSCTRL_HDR_COMMAND(req));

		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
			   XE_SYSCTRL_HDR_RESULT(hdr), XE_SYSCTRL_HDR_GROUP_ID(req),
			   XE_SYSCTRL_HDR_COMMAND(req));

OR


		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
			   XE_SYSCTRL_HDR_RESULT(hdr),
			   XE_SYSCTRL_HDR_GROUP_ID(req),
			   XE_SYSCTRL_HDR_COMMAND(req));


Thanks,
Umesh

> 		return -EIO;
> 	}
>
>-- 
>2.43.0
>
