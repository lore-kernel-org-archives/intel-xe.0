Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D01DC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EEB10F3A3;
	Fri, 24 Jul 2026 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot9IUjIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AA210F3AF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784894079; x=1816430079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ow+CB3RQYSSoNXUf94CTKJx7w11jtuAWAv/ir3SN3fk=;
 b=Ot9IUjIBbrPK0aR8kVirZHv+1gOidoZWtlvZGd/1VLGNRo0sGFPZykWB
 XYI1rrGGPy+31Mfu9kKoF5qsLjdWQbsn3sSo7cAo1sJsGXPm8Qd0jMuMi
 6gPpzpAfjSIRyEN9009mZlr4XcN5p8lbMTQTUAPeAGP8yQHQKv9g22CE+
 gZMKjRW0pLdgf36vfZxXfpDYdJyXV8kOElgDOmXGkQXajNXtp7Qylzju5
 jH1B/reSNPHIe4Lv9nAhzMhL57F1sWq+xcucXGJoTFqemDazNp2hmxJSq
 6+zb9Dv//IrLaev8vCpqOy5q3hgwaLaXlm/MPPvpZrvlSfZsKfNZhQVzI w==;
X-CSE-ConnectionGUID: 1btxN/QKQXiCacQaJBT0sg==
X-CSE-MsgGUID: PtNZBzzIQuunvULOLYYVAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="97074402"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="97074402"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:54:38 -0700
X-CSE-ConnectionGUID: J3QWLx9cTyaaio6cI2H+6Q==
X-CSE-MsgGUID: TeBfWIqhQFCWmcz3ngDK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="254753530"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:54:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:54:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 04:54:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTeL482eUim/LkV0Zrv0nP9X+USVPOMs41iwyxm9MmEtOOCDR4703OtYP5l3LZLpTfyryOSIIUYWNApkQqZRkjmMcaZoYlzdo0HE4pnNfAMbu50ykog7UWwEZVC6C6tpPaOua9GQpCt7exkvzgRQIwgBykIhOeIkMv0JkKrELvYsD9nlIjSaPmLBLzOQ7e2Xpe+CO7Ec931mhANDU7H3rk3htxZHqh8cy4xhrYXyUnyjwrIZrNFkgLXuQdshVcWamBT1nzLLlVxAeEtDFaQsJ2Dm0ohtwvIZ8z73gOinGP4VkTq44UiKVSeO89bsTVVQ7CNfed0eP92mViwn4JtZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VOcwjHDhAuf+DCzetYmBRVTck7DOOGJw3Us35OJ7V8=;
 b=ws596Dsq1PMng9nC4vR/JyE0gWSdnydZlAAjTCrOsUnJZ+r2lA7tI5p84jsBCl6F4sng0ZJPDMtUJO49jj29iGA9mZxnIZDbszblynFFLyI6xaAFQSBzaBWf3yJcLdss70XfM6SRremQCRwMJ4Yj4+n3CEoo5ekx95OsP3n1Z1GThXwmij5erwwn2NUbVDXrqVScPKMB5yt7EXwky3Ca5cgZpyyakL8CHv5HccAU9y/iaoxN2ylP6W5UkWeDVJ0m8gXFhIfxmsqDZlP3+D8SUQVxd2Xv2bHR7wpX24eN24+AQ5Yv8fdt2cWGqFgbV9qpdzH9QL/SVynXVNJvWSf+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPF76AA2D882.namprd11.prod.outlook.com (2603:10b6:518:1::d30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 11:54:34 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:54:34 +0000
Message-ID: <bfa1d37c-7374-41b0-97a1-8d9b43f96749@intel.com>
Date: Fri, 24 Jul 2026 17:24:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/xe: Use RAS logging for GT fault paths
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <matthew.brost@intel.com>
References: <20260724085703.2540087-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260724085703.2540087-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPF76AA2D882:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfd5b80-29ad-4095-f3ec-08dee97a5409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wRqbIZ70f9CGFHUZyFYr+t/XBILHPadIBCdZJZzkAsAXvn0I/uX51EFc45dJtETCfV2BviOAyVQqQST8QNMQ5XUFF2v+4ixJ54sutNKH6QpWDn7rhTguYP0p3FxmHLY+pwdA1Ggeea8CWk6xSZuSMSIHdYI82vrnhKORRhHZTKjKikG60ybZU0RaGh8cSxjamtLA6vaEIJkC8JR9B9VdiD4otQ5V7b5m2Jvs4c4cxiTj/7K3B0bHaqgeQz+hFRfCx147mF55mBWJGjcXA37hoU4Myogr9A5cRhgzdgY9UDW3i5j9xyVeDfWHg1boc87KOp0SRzXtwOvH5BtIVPwIqumL8F3+8hdHBkuLg7FojZOklDlWFYg3opnh1ddLDVnkmmtjcMJKiWZAPUgWC3+Y3lMhP1vkbMwX2/InqMpf1598MFfbCkbfIwI2dGU6INFTSeunwCJiv/mB92o8JJ7pZ/yYlqx+wQflHgsIkNfKyJbN6LQknpPkFb4rUb+l9/cWqtzd+IVRTN2rNLRaj/GKUCppE+MZnUbA7L1AQouSSg5srwGiyZZ3NIo6CqwoAbqROda0YpDk57SldQqgyJwz6+K44Em+j9Ur1fqX/YRrbjWjI3Auc8Ft8U/Kz78WCdGj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2c5VWlwLzJvd1QvVWo0WE5LU0ZIb3BJVjNSOHJnMWFZaUMyRjlSVURWaEd0?=
 =?utf-8?B?VXJqcUJhVzk4SUZibHBxdnU2bWFoT3FNZWtqRCtQN1lHalo0MVUzOUxrSlYx?=
 =?utf-8?B?L1cxejRlc3Q2UTJVTzlKbng0bGQxZkVESkcrdDkyK09HMlhSNHJFMEZpbFlk?=
 =?utf-8?B?M3lOd1NFOWMrNHVZQko4T3FJT3V1dWVMczAwdUFjWWExNFJqVm9qQVNra3hY?=
 =?utf-8?B?bXlLMUdXWStpSUZYZlV3OXUweTBXN29NQU9KQlR2UjIzazkzenZVQWJsQlBC?=
 =?utf-8?B?d3BBaTE1cFFLQU00WHpLT0p5bG1QSWdZMk5WalZLd0l2bktacWhDMjg2RnhV?=
 =?utf-8?B?YVpJSytyUFV0TEpWZ0FGWUxaZWpBTHcrSEFQOExpeCtiVzRwM1RjNlJ3cVZN?=
 =?utf-8?B?SXFNdkhITkdyK0J6cGMweCtvd2dnV0xXdUN1S1I3MVlZSzF0d1RZb1laWjFJ?=
 =?utf-8?B?QWlQYitIWVhMUFp3SUNGcm1aUk1xeHFQcldqSzFSYkJVUVZzalRvS1RpZG9t?=
 =?utf-8?B?Y0xEQ1VJNmRvS2VSRllENm5YQmhVelA4V3ZnQllKOHAyUUhZM0tnaTk1WlRF?=
 =?utf-8?B?QlQ4NGRlVTRmZm9TdDBwRWVkNENXSXhwVk9kNW1jRy9xUjBXYTlBNmtHYXNT?=
 =?utf-8?B?TEQ3V2NEM09XZXJKMzBlejJjNWxGZHhHTXJWaUxpM01lcHlJTlVCMHNiK2NZ?=
 =?utf-8?B?cEtmMUJjNHVrT0JPV2NybTF1WmVhUVpxbGdDdUEyWkRENm9acUljazI1eDZ0?=
 =?utf-8?B?MmhiZDF2bGloTzFBNEl0WjVpZXpKbHBqNWpxeDJGYVlsZ2p5UTBGbDJWS29r?=
 =?utf-8?B?akZpRVcvei9hTVpUVjlUbWlzTHNDN0F1cTIwN2pNMS84aVZ2M2pZRng5Vlc5?=
 =?utf-8?B?UVpYbzlKSU1ieUpCTmI4dTNuY0ZNZDZZcXY5alUvUHlhWTcyd1FVTDZ4eG5Z?=
 =?utf-8?B?TEZuaHlLTWZ2ZG83d0t2QWR5RmxtV0lmemZRTmR0VE5SaS8xMklqWHQxZnhJ?=
 =?utf-8?B?UFA4aXNFcjk3bkVmaHNWOThlRXpiaytmV2xOMlJVcU5NQjh3eHpjclpBcmxw?=
 =?utf-8?B?Q3FZNSs5UjBLcWlQSDlqdWdmd3R4eTFROWlFVnRMcDhZMjV0UDFnbXBqeDNI?=
 =?utf-8?B?TnN6ZjhscWR4L0Nlbmp5Mzc3R0xsK2h6WHZZaXhyU3YwcjRja0FtcUhRS3p4?=
 =?utf-8?B?MUVjTjRQK0FDWFFQMTlHNXFqWnhLbTZRM0xaZmxMTVIzeUdDVkZpOFloem1j?=
 =?utf-8?B?THNrdEhDZXl0K2dvZHM5Qit5ZExxNDVmQXBtSXpobEJJcjhQSmFHRG1id0lR?=
 =?utf-8?B?Ty9oejl6ZVVVQWpySmFXNjQ5SE12STEzdzJtTERaN3V3VkJlenc0WDQ3U1Ni?=
 =?utf-8?B?ZXd1NUNvQm95WlJhRXlWclhzTWZIUkMwU0NQUC9YcDlpNVE0TEJsMWpDWWt4?=
 =?utf-8?B?OFFWL0s5enhMcy9TMGpBNFMxVTlOanFnTnZGTGt4WVlPNnp3Sm1JRHo5T1E5?=
 =?utf-8?B?WFVrb08xM2dtemg5Q3lhSS80OEhMYzNYcnFvbkRsN1duenBlTlNobDBkbGs5?=
 =?utf-8?B?akljQWVRZERpR1NXbW5CV3pZdlNEMS9QTy9TbTFWMzJVQkFNb0FUckFpNlQ0?=
 =?utf-8?B?dzNZejlTQzhULzAyQnpyM2hhdjFWb0toNXlMSWdkQ3hocTJZSjJ3bDQwT1di?=
 =?utf-8?B?VENJZmRGWHJ5TXdnd1Bob2Q1bXVHejd6dEtod0s5dGpiZGp4d0dOOTN3WlJv?=
 =?utf-8?B?YXVWYW5HU2thNG45UC9xenJlSEVpNldudkhXeUw5OTZ2TTB3cVBYWnlPVXQ5?=
 =?utf-8?B?SDVTN3A3VXlIVnY0QzQrdUw2c0t0ME9IeGVWalp0OTRjczM5NnhSbjZnWStV?=
 =?utf-8?B?cXgyTmR3SVhiY3c0MHZ5TVFoUW05Q0JWbEJCeEJEWlhlZ0wrUlV6Z1UxbERK?=
 =?utf-8?B?YWFQNi80NzNoQ3RBK2orMnphTUpoTENaQ3VqNmFZRk1pNmI3TEg4N2wrTDVi?=
 =?utf-8?B?emVyWVduMThoUXFLSTlFMGUwMzRZUmE2emVaUzRreTFneWNjazlmSDRlby9n?=
 =?utf-8?B?TGdDanIxVDFBTkp5SG1pbFNETUtVLzBUQkIvandnOWVjU0JZRUtDQy9KdnR3?=
 =?utf-8?B?UDRLbXV5U3NjRTdwaVJjdjErNmUxT2h4c05qNThmUTZ4UVdVRW5pZS85cFVp?=
 =?utf-8?B?dm53MEJxTVl2WEJyZExUaXd1VEZRcmc4cG9ZSkdQMHh1bGVpYXoxazBmKy9D?=
 =?utf-8?B?YkhscTFOS0c0T3BMbTZDMEorNTE3ZllzZERwOGpXTUdYTWNFT2U3NEY3SUhW?=
 =?utf-8?B?dWZ2QUh5dVlKZDBHM0xCV1RPaTN3ZEt0RGFwc3Y0c3ZaTGExVGhQU0JQeXR0?=
 =?utf-8?Q?WlhPgzSjG+IlGT48=3D?=
X-Exchange-RoutingPolicyChecked: Cs6qsaYmb3DyH644wTJOUxKC2mdMWektLFr5/ZCIHFd0m804pobZzcLlpPcri6h3LOPibR6EAMMGcuk1B0E34hJ/q7pTJJh2ZzKx/ZhMQXX3Qz/0qrRGfuqAwxfM79fOVldTguzaju5rhx8fsFOjiJEuDNefFZ/Gj1fqHPwesOUuisJO9EWHRpXhMIz5EnCPFUe/US81nyGBMX7z6B+VRUM7Xg147po5weyN6YMpDN1Y9HxYbVJtlmLJg7uv/dwG/yLW3bcW9NG/joGxu7c7CunOa5xB0FrfPuET25I0wzgrD3tfhGWKwpw6qbPEWLU11ATrGG7S5HCqc6t0k30a8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfd5b80-29ad-4095-f3ec-08dee97a5409
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:54:34.0556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZOxwg9/HU20Sg2fFPae1dptSKq/oKbHEX1i/9175OXwGt2Dp8agMOBuvwoXY7WMAmYnhaY8kiI3M6S0SocMNGIXcav5oLMP0DiGr6Im6iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF76AA2D882
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

Hi Arvind,

Please use new approach helper function from the patch series: 
https://patchwork.freedesktop.org/series/171022/

Thanks,

-/Mallesh

On 24-07-2026 02:27 pm, Arvind Yadav wrote:
> This patch is a small follow-up on top of the structured RAS error
> logging infrastructure series:
>
> https://patchwork.freedesktop.org/series/168333/
>
> That series adds SIG_ID based error reporting and the xe_ras_log_*()
> helpers. This patch converts a few existing driver-detected GT fault
> logs to the structured RAS logging path.
>
> Arvind Yadav (1):
>    drm/xe: Use RAS logging for GT fault paths
>
>   drivers/gpu/drm/xe/xe_guc_submit.c | 35 ++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_pagefault.c  | 10 +++++----
>   drivers/gpu/drm/xe/xe_ras_log.h    | 14 ++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c         |  4 +++-
>   4 files changed, 44 insertions(+), 19 deletions(-)
>
