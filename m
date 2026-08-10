Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C81C5AD7B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542910E797;
	Mon, 10 Aug 2026 10:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivsxGVwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC5B10E797
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786358084; x=1817894084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aR4KJOhwXecDQ1nNFuQAv/6AXWWMgAHZLs91PV0gfAs=;
 b=ivsxGVwpn0KlLiKeYReWUK96mCqua6xCaB2oRClWdSys6g+GrZ/9IWr7
 gWd74HVSlBw4RXxGoHIj5K26ybmY8XPCULvcLNd6AJn8Um8bT165QDSc2
 MY6e5lXV+Dj57af9XJaBg3b7D3+nBJgA7s5op6/LBDJFxQfSn2+sdA4ZF
 gwmsHOi8HgD/ogwV/C7wKXjlirlW7Yo1tucv9iM3zh3rHA7vRyb8hVr9B
 JJRj6bAdlL+FcOuAF0rDJoS6FnuM7HRpFAmqlBgKJ5cfQWicWJnrhLZnw
 Zb/xbtDJYFszgAl/1Ai2Au0Dlz/EZqd9EaMBONf0KmKxi9q8ex1RCGvlb g==;
X-CSE-ConnectionGUID: y0hxHZe8QnCvYWMb5E8jLw==
X-CSE-MsgGUID: qgUgJ0FRSvCNKgIaBc7mvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104401096"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="104401096"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:34:43 -0700
X-CSE-ConnectionGUID: wyXGMXEITb2Jx/QkkqDtIQ==
X-CSE-MsgGUID: Bp2jts8DSH6sdcIk0LsQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="267253134"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:34:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 03:34:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 03:34:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 03:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlfJtrdWWnHJiepNXHu3EcQ+pfHa9Y1vnk/8tDiV8WWL9nPrppkqmDY1YUlc3Rs1638+RmHlxLO7Ah4w/eUAL3uuKBJ6K5w/Hy9pO44g8xpuijWmeFA62Pxp2Hvraf9CiJVlu051V5HzZ1glDhm/uyg1SOfukzenLYUwSIOYYj79vxAKnUAtL2gh93ZDFMB/LzoaZL0oYIjbPJatrgWmGwy7i6jdXyLntxgA8JKFqBumJnbta9AWmshfpAKK/FIPK4K4mPd5g5ouu5pWccZ0+MGcwkoMORqodKmFvMfbeBlJr/oX207gfrBZc+cp/K7hpIgm1d0dPLRifEy64RO6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7ZtfeplTZkk+LEqBbikBy07p/GXZTuhnNMiq5QN0vA=;
 b=fQAz7Dyzpa76vcQr57dgpaQpOJTbENaQwxlrxFD6BiXY48YJmyt1E3nKDJ2l4aoVejNixm+JU3SjcX4RDK8RnC+o/IHpHAp/6MGMDfkrNVu8KZviUGgX+h45qJ3yDAcdWMzRFHCVRt9a0qYkc3lGV0cWg6Lzv+JID0jFp4r6w6Kqjhw4s4fqKjd/m1RLEZMAcYpX8L9wffaP5WoL0X0wI/UnruTklYRFLTNQTVdI9b/F7/ap8vb6D9fTuXKb9GCfFXPRpnQzVrE9k2bCAj6fD9pPxDGTOd9ktyP8xO78HEUoQ40M/WvBOiuKWUxt4MdgUcaNUNAeldta/gB3KwnF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Mon, 10 Aug 2026 10:34:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0292.018; Mon, 10 Aug 2026
 10:34:39 +0000
Message-ID: <786a4a10-04e6-45a3-9ab0-5c51cb327a47@intel.com>
Date: Mon, 10 Aug 2026 16:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260803080823.1166925-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260803080823.1166925-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a45230-9f15-4b25-c5e3-08def6cafb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: t+ThwuTP2FeaIMJgrRakuq+msolG+fd9SynQeaOUf5EQ1fFbRRT1n37rhgZOJ/FFyx9ySkrJ7oqf3sUjwzdoE7o67zTP+pZPaethBHCuf2kUD9W1mYHmAX3F9IxUPGzSTGvDj/yAJmCCFv0BG5kgIywua1xXP3SiCgVtOP2jcvInrPS5nLgt/9u9wjEsX/2dl1MdQQ946jyD/AsMwgLrKkz7YgesHZJKMHODLfJ48b9/bPxoe13iX+WZqGquUYJKWgwh+WqtEJwCbPIUCPJ4zdRXfJFo35tDNKnLRLZUaAAF6bGIUnR+KZy3lcxFYEHYjm80y8wYJZMV2DUI3q3B5o2Xfb4xjs1qsw7IN75OsQ1VudCX8q7IolHMmtKkg+UqbQ2bAcvkN4KKJ4bKIMCx3+Cv3k3rojBoSzkEvQ2VsH4lmE0UPzViyeuaLM5kR0uCoALHyc+PYUxXdfvvF5BJ+1eLCDJLg0nUsKSU8tj7U6wEob9WprQ/Q6cXDr0/zvAw0c1hVD3e1ehqpRCAQS8xir2AWLl11ao+C21e2cmLhA70Y3E6x6QICYyU5LmVlmMR87MdpfcwzwOQ5oQNHSeTfFqqvWLPK9CNP8tG8RRoNOhL/YH3rMiY6+MpcahpOF3EvjT/7blLLy+Nf43Bke9F9wxF45G2FBHcxcTz3FGfYRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFRVi9OQlJJMCsyOC80UUY3WG9MTkhZbXpUZFlVN0FHREtGTWlKUWZuNllx?=
 =?utf-8?B?Y3Z4Q0dtMC9MRnd3WC9EY0R3eEFUNlNZVDRXWTdidHpORy9jVEJwNk15SE5y?=
 =?utf-8?B?akkwaEVqYU9uUXA0UkI3a3YyMEEya0Fsalhid1RXR3d3d2VSUjFZRlMvS05S?=
 =?utf-8?B?bWVkZnhUVXBJSkFVOTVVWmFVSGRjTTVHNkZ0VFRmVHRtTWdEbjFwcnB0WFZn?=
 =?utf-8?B?YnZwQjU3eHZROFRhQzREdDNhSWgvRTBSYVhoN0ovWnJOYmg3SDQ5eFYybUVJ?=
 =?utf-8?B?U3RZZmpmS1QzL2FrRVRJbzBUakdMQVRWZVQ2NStkOVlSK3hoYzFXUCsxeXlh?=
 =?utf-8?B?L0FSeEVJYWlwZEFQWXd4UUF6MnpUbVZBa1VXeXVmZ3J0aVhvOWdWb1Iyb1NP?=
 =?utf-8?B?N3BmZEM4dGR3ZlNBQkFHK25FL2xMMUNod1VhYUIyY1hOYzFvVExaMjAvSVRh?=
 =?utf-8?B?MFRSOU9vUXIrU2J5MjFMK1UzN1l5Y1oweFBvdU0vbVhRRHlVVDlDL096VW00?=
 =?utf-8?B?Z1d2L1lPeVNQbFR4dWFLeHgrOXhaUmhjM2c2NDVWcml2cjdsd2ovb3RjaTFL?=
 =?utf-8?B?WjQ4NmNZZUZ6b1VJbVI3VU1ubW16M2RYVXZ6cmhKQnMvbFp4Q0hkT2Fwa3Zi?=
 =?utf-8?B?dFRhYkhUdGdxOVZtUjJHTEZQckVSQjEzbDhwVi90WDlobjhqU2lrOFczM1dk?=
 =?utf-8?B?ZTNNa3ZQbGNXTnIxZHREUUFpNHJCS2NOOEJ2RGxacC9sTG9NYUlIenloYzZ0?=
 =?utf-8?B?T2pHRXVrTmFWc2ZhNDNMME1CMHVOOGY3SDNQSTlUR3hUL013L1YrZHgwdnRh?=
 =?utf-8?B?SWNwQUxUcTQyMFpHVmlhd0lSMWxMZkdJUWRUcGZoZUMvZ1dzcDJYYUFmeERp?=
 =?utf-8?B?cEFHQlBlODFQVjlTa0F3U3RGZ1F0b1RFaEY4Q0tPVmdvSFovNVZUcGQ0WVA0?=
 =?utf-8?B?ZjZjbmNoeHVHK295aDNXOFM5N0hkeGZUOS9Rd0VIYUVmRFBkaDVnWGZ0NUJG?=
 =?utf-8?B?TWF5bzlQMGMwaDRzdVZRN0NVVFdMYnRrNEZEbDhydjRYdkp1SFNoTkh2b1BI?=
 =?utf-8?B?d3FQRVpDazRnanZTbzF2QkpUZWZMdGVKY2JTaXl6dE9aQ0JQRktvK0xmUXV1?=
 =?utf-8?B?UkJ2WFdIK2ZGa1k2UzRGTDBKdW9uSkxwUDl1aE1qSzkxTkVacmpZMkxtZkI4?=
 =?utf-8?B?ZXdqZmNhc2V0TVd4WjVJVHd2QVJVRmZuSlhzalVocDY3R0x2alFUajlGRkIy?=
 =?utf-8?B?ZTVocEFTWnV6bkJObFFWVTVDRm5HSWNrOVFVRFQwWjk2NFpXbUloa0VWODFY?=
 =?utf-8?B?OFoyd2VScUtBOTFEd2llQXgyYmFGWm1oekRTMzNiU2tTeDhIcHhrd0F2WlFC?=
 =?utf-8?B?YVpHS1VFRE1taEkrZFQ5TDd5MWFZbVNDTmxsWEQzYXdQQjUvTFczZWh4VGwz?=
 =?utf-8?B?RCs5eS92cDYrdnE2ejRsMmh3OTVLNTFBM05mUDZKYmlZSEdUWVVYOTlDVytG?=
 =?utf-8?B?ekl2Q2FYdGNFRlhYeGttbldjZW1HOFpodmRqNW96RHJIcytjSllpWDBmK3JB?=
 =?utf-8?B?NGVudjdjYUxIQW9xZ0h4eGFZdklMNnNCRk9EeUErVWpGeUdycTc3SzdpWnEw?=
 =?utf-8?B?MWszL3NnemdZeXgyOVJ6Vng3c2pqS2x4WExtRjU2bWcxRGRwQnpBMFhRUU9O?=
 =?utf-8?B?WVBGUmg4VHpiSFNTVHBzWmFadDcxdlg0OW9qVk0rKzMvbWx3MVhsenZqTlZH?=
 =?utf-8?B?dW5XWFJ6NHhaQUxpNW9tVFI0SUVwZnlXcnZmc0s1Vk1BL2VJcWRuMTgyRmw4?=
 =?utf-8?B?TFpLNkRwS2lTeDFJdWk5ckF0Wmk1YUxJQVVwR1h4OWNUeVkrUWozK2ExTkx3?=
 =?utf-8?B?UXNra1ZLWHpBY3ZZSU5mUVJGdXh4c3BQV2hwd3N5STBwK2ozNm5ibVZmeWli?=
 =?utf-8?B?UkUxbnpQdzU3aUNGdi9qUHcyWGxmb2J2aWZqdmhEenM5VlV2QVM3cG1wd3lY?=
 =?utf-8?B?TW9xbmRrMTYxYXpjRjE5Q1doNUtLRkNHY0FvVVg4T1Y5WTkyVi9GUHJvOWQ5?=
 =?utf-8?B?dDJBT3VxaVc5ajBYTzJaTHNWTFdlMCtTSC9MSVF0NjBKekgyQmw4c1lsWDc0?=
 =?utf-8?B?NnpVY3liakozNk1OWG1OcFJ0WjA1cVgzWVBDZHlIL2RNdEF5MHVSM1YveUtZ?=
 =?utf-8?B?V0hUZ3VLTVZDTDhocGpPMXpWZCs4TlJwWUkvYXJaRStpeUJBSXQwYjRoamU4?=
 =?utf-8?B?OU5uWE8rOE1hS1dxS3BRS1hVRjhIaEhxbEhQMWR5ZURVb0pXUjF2NytJK2Nw?=
 =?utf-8?B?K1FHd1dTVkx4bDhMUkRuR25FSXFINXFIeU15WjFFL295THlUZUdjQT09?=
X-Exchange-RoutingPolicyChecked: Dtdm2LnH/QsakZ5N8pjOdd1BMUKQRhfRLaBUkQUx8m4IG40wo7pXWoRFYFwBC0Yvkowf6IAgOzZTEOgtLD6ZsjSlBV8qCwQpJGMdC4MlZcKXAVUwp5vr6sxFktI/YL/jXy+8lNkaRbpfIFdgY167Mw933MaJnwcTNZz32z6BTQncImfuS5dfs69RlnzjyNt9hNjxhmtk3+XcqVXENwk6I13x7g5GaCwCI/6O/4Ld3XvwVEwpnKEntaBaVA8WQot39Hzv/C/VVx9zJeUf8jYZRICccR2ad3fNIAPSmooWLapE2UVW4Nr+gICaGa5YMc0GFil/wPzrOJhfpwfqDOr1Jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a45230-9f15-4b25-c5e3-08def6cafb2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:34:39.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwobdIP1h2b5eeIuPbqdR+k0jYG0p3uugaK8vIfFheD2XhvbPmP4ZftIGY+O0VZUDLq0ICKOek8t0hLg1Zn+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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


On 03-08-2026 13:38, Raag Jadav wrote:
> has_drm_ras flag is meant to facilitate drm_ras feature. Move it to the
> correct layer where it belogs.

typo..

>
> Fixes: 63dfab5786ca ("drm/xe/xe_ras: Add drm_ras feature flag")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

With that fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks
Riana

> ---
>   drivers/gpu/drm/xe/xe_drm_ras.c | 3 +++
>   drivers/gpu/drm/xe/xe_ras.c     | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 4afa2ad98300..a23cfb49361b 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -233,6 +233,9 @@ int xe_drm_ras_init(struct xe_device *xe)
>   	struct drm_ras_node *node;
>   	int err;
>   
> +	if (!xe->info.has_drm_ras)
> +		return 0;
> +
>   	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
>   	if (!node)
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 28123f08e513..f7af4da8172c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -816,9 +816,6 @@ void xe_ras_init(struct xe_device *xe)
>   {
>   	int ret;
>   
> -	if (!xe->info.has_drm_ras)
> -		return;
> -
>   	xe_drm_ras_init(xe);
>   
>   	if (!xe->info.has_sysctrl)
