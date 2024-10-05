Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B4CF8869
	for <intel-xe@archiver.kernel.org>; Sat,  5 Oct 2024 03:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBC410E03A;
	Sat,  5 Oct 2024 03:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7XRI65u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2710E03A
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Oct 2024 03:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728100121; x=1759636121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=arI+wA6X+TThXzdRVc/x9L0FdxewmST7OJhnTmbghzU=;
 b=V7XRI65u9nVWZ6y3Bsrb2WBDHfJb6HU4wPYTFlk+8ySPBVckxZw+WyJB
 peoCpj0NXrg94qeo9E3NRWkVn+hnDoYZo6jsvIHP42HwFXpxvuzfeqkOT
 lBwntic9UVtTVUD+kDTeqRJQWElDqWJNcHJbLrZq3cD0TYPCGHdfC674q
 IhygqnqlGSFLI0fyDxD3rqemPWGPqHL0MEpnHYLv/d4BslUiJ1U4UCJTH
 h76ypu3aln3P7txSRJ6OOvXlfgQuUyWvDvPlwL8x+/0ymSzhnIQt6W2BZ
 ZI6YazEu/s41jZ0kuvpY3Q5u9tklnehxCoJf0YCiQe9nBDcMz+wbKPytY A==;
X-CSE-ConnectionGUID: Y8Y6EhIiSHOAwWeGPHjZyA==
X-CSE-MsgGUID: O88keK4XRYm7aGe/xKjkvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49858783"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="49858783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 20:48:40 -0700
X-CSE-ConnectionGUID: iGVswYFnQv+PcbQ7rls2Cg==
X-CSE-MsgGUID: l3UsJKS8SQu3MZa1mOATxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="74724000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 20:48:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 20:48:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 20:48:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 20:48:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFygnbbCR6i8kIMbGJYaBRXbsw4LDrzu0rK/r5CFC/JYZdxdGZxyCDMrp+qY1RMTERuKz9J7lW2/3Q+tq//35MlaLYElXOrlBfLRoio9faf6S7Fr27JxcIbZJzgbBnXhUpVJtLu9OXGiW6PpGGis+ocIbo/FdaoOMGLuv6N0yQBbxFJjHW2BoGOMLVLz38LNuMD16f0R66//E7sMAwOeFBdtNdzL4wQhsZ/gsaeEPe7iVukgGn6NuZQTavjVVxo/kDgtxnhPlwoGx+XKQX9c7FgxN9UrpVJKsa3I003o1PdOuHVbHXKMR9Njh2j3dDaObT89xBl65bJxaFF9fJax+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUdC6rhBPxaBjGtie8AnkXzYg9zUqbSSj65UrEaZ/9g=;
 b=SfNjPKIPKHuZSdSyBY7CIB98GtFl7FYvCqW82ptucbfrg062y9y6zlcrPFEfCzn2FfM49fKGExdhRpT+NHDeJKR3QuBKkWHQ1RGWgfZmGyEf+T4DG4L8qukemd89WprfNCv3BuxCljJuAevwzjAUbDCSno42vFZXgm0Cmb7opM1qiUyKFI+ar/XLj6kE35aXenU1naojxGKGjeTBORi/kFR1qTeZrqcGwk0X4+BMhBcOvfIICyWqRyH373FVGG9dpocrKQX6ZegUP5jt7mDURDUDLsT0L+2jhgAATtGRjMLMTUO8MEnmTcCtXUT06Rh2wIA/j5ScSKlukipZkgkj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Sat, 5 Oct
 2024 03:48:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Sat, 5 Oct 2024
 03:48:32 +0000
Date: Sat, 5 Oct 2024 03:48:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZwC3AvPkmaxNVBIX@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: c473e893-382b-48f1-6a5f-08dce4f094ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kvee9C/ToNuvwsbcf+f46JSopgzidzazgk6cC1olyJmHekOLxow71qIuFnHt?=
 =?us-ascii?Q?cw72YSUy0djamyfeYUN7+StMH1WjRd4CpxVNLbifpcmz25xXIGlyrT8QcMek?=
 =?us-ascii?Q?CMFuYuOjk+WfcfUHITcV1Z2OYhtmKoqn3mY10XrvKG5K3S9JyvuDH8SdzBrx?=
 =?us-ascii?Q?v94kKKaHJbAh8jH1ggqcbgqYNnGdpy8DwhN2/jgzVYGmFlHAdwojxfzVGE2k?=
 =?us-ascii?Q?ZZr/HG1Rp1SxIp3KxpSAMRzFcEjNJOMUe8vya/G7dwLEAzewaCq1eGxihUky?=
 =?us-ascii?Q?HrkJyyzTMt+ZG91aKoXMdPZ0Wn/4uXAQGgJHsypo1mCgKPUimmpVnZHJ7+Ge?=
 =?us-ascii?Q?Aw84FUmAZmqQZYrrKQEYB1+G3mxB40TqQThClVLhc9Asduv5uz5pxqodUSWq?=
 =?us-ascii?Q?0TZYBYffaLBXvk3xwpBtMF9fX96lvWBn3yjFdu/2Y6bcs/OZB3IzqjysmBiE?=
 =?us-ascii?Q?wcO3u+EbAgJm2UrloUa3Z/olIllz7+RNU0oZsJ+7bpau2j4yjGBklm6oun43?=
 =?us-ascii?Q?LctRR5G0uAvemUQ4TK4dPAM7rOx5sejJQeOrkpoCSZi0EQJaE9N90vSv7H10?=
 =?us-ascii?Q?257BZ0Lyr45JcpYThY4lS91q9/Mx06ALnsIw3oHySIavHin24oqy86WNDo1A?=
 =?us-ascii?Q?xfGUlpGHirS7HipnXgW7VvntX76+V7E0K6lxHgKOnXyXoNz6wcSllYegC5Tz?=
 =?us-ascii?Q?EbqXIjQWYk97Oi60MJ4MWhjaUxPc7iIMDJnb4G6ZjR+3JAADwcf1UuBJ9b2R?=
 =?us-ascii?Q?dagBen9+clR8MNbveLO5jSN9lF4LBC2WoCRb7LzuoLi/iNr1sT3M6zdlYzDA?=
 =?us-ascii?Q?awC8nMdYTnPjGLaniTmCVEqxoJECFP2q16KHYCpV4w8tuwscEY7F/CjI94Ke?=
 =?us-ascii?Q?WA4k8x+SSbtT2O/g5CBg69/DA1PSyxJo8Z1ANKGgCD3cvQV3/xZwi4FcAxV8?=
 =?us-ascii?Q?MCSCnRimnCJv5TXyCXawMXJ1XDP5qs8P5F6r9P56EoaBKspDgnA7ZRtUZTOW?=
 =?us-ascii?Q?uUMRdACuA575R3lLZGhD1fO3ZhAVmD3/BW0dj7O2OPLrqYpoQggDWlzdtATc?=
 =?us-ascii?Q?wvoSeune5VB8wzK7ZY7hjbXJTH5h+Bq6fgqDqiTLn7yBa/DNd3EmHswOJ8Fq?=
 =?us-ascii?Q?t2n0Ro1V4S8jqC5IJ2wLTltmU0g9Cay0xPeTYLAZ4SIMFnABfJea8lP7fo+t?=
 =?us-ascii?Q?q4htr+SZU+ZJff3MxuX2foCvjWZ1tcRF6bgcODh7lJxguPyOOOuS7gvTHgp/?=
 =?us-ascii?Q?U0MkbAUI3GfJElXYHm3oFFqDhhnMbknnFWv+wwWlWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HnjyOqw1VOD7t5qxKQI9c0z4LnZYqdXc7Yt7sDgu6V4m1NKzQe1feuMS6Mnt?=
 =?us-ascii?Q?rbdh1NQLKyXd58urxYUth2Q6cGjN7iNPxizxYDeIGGPfRpKMnDg4HiXRAnOM?=
 =?us-ascii?Q?17jfzE29t9MrI01JBMLl+ucKHAFUR1he76WvECzUvxNxV2v8XUf9V85NKold?=
 =?us-ascii?Q?dhZJl7n5qw60bP/Yt6/8M8jIThkZRivY/DwDgZaZBVxqAWeolGDKCz7+WQ6C?=
 =?us-ascii?Q?YGP5chtai0FmngqwrqOKZHaC0t97jhHeZkuVQNP3+Up6lDLVbBcAJtoBgY7Q?=
 =?us-ascii?Q?OeyLrc8kX6gjLk3YABOlWcO9H9qna0DIZ1Bsv7hDXW0bra08d6DVcm3CKsuw?=
 =?us-ascii?Q?Sac8+Tg0M+uEhtbhrrU4F5y24KITfa7xh/HJoquJB1qiqd2FuJNsmey/u0hQ?=
 =?us-ascii?Q?Dbj44L15NtpWeNw/F9u+s4OOuUGekDkuivLZu7dOpUS2EYWtkG+6fJ2wkeLR?=
 =?us-ascii?Q?lAnSY15/oip68aMrrnlrEXkWs+pnBwovg3PhTHApVsS9wIZ0cm64gKuq+TTV?=
 =?us-ascii?Q?YS+DDAL4ALNsNWz0fmYOjZgOEGj+kb3SB/xgpoRsbuGAsWzrCSa+NojKwb7J?=
 =?us-ascii?Q?xtj8XZ0FM1vm37AH0JYLufBpJF6n/HUAUYk46I/lZ1EV8XImhKfok+iql4Yb?=
 =?us-ascii?Q?AX496qzHYyPIqWu5ZlZCFUgrzWLjVucVVZO1+z75n5kfo2TPeUbEedeJIG76?=
 =?us-ascii?Q?k20yQd7xbLzNysW2Dsktlsx4AlFfy5eU+RgtLi+IBYDGihkqMXS//gKL9A2W?=
 =?us-ascii?Q?5DQyfhXORspBYTky+Od4bgtZ4jjGsdUEbX4M3B5NC2PopYOCASz7rFXR1hCK?=
 =?us-ascii?Q?aRjk1Ho1CiLJU0Zvug5QLQYeL6Lbv/RxGk9FTl6QvrP1qRCINrfgPHVBhhXk?=
 =?us-ascii?Q?1zLPGAnTcnBQcqf5iueAv3S8Qd2w5/B/EcFnh6advJDv+PTZIu1mSk7m9wsk?=
 =?us-ascii?Q?TpgbNmmHmOJ5XXyX9us24I2rbm1IXAkOx00bKCUaQ4ay54nCoDMSNyypkmgC?=
 =?us-ascii?Q?sWHbTGU4ePtWyrYTzm6LnyHWjKqZt0t3CUpKBGb2GGMLS0B8Cn0TFJNPV1sC?=
 =?us-ascii?Q?SDDiZuOB/hiUc6Hk6YYomlirFEBRS9xElEr85+8IPhndMsautUPOHBgupEA+?=
 =?us-ascii?Q?FHaw+KaBOv1veMT+CVqFJM9LnWiOrCUin7hRSontE+gi/IXwPBObeOsZVYwv?=
 =?us-ascii?Q?yxvW5NoX5/J88niFcNh+sUQzrHKjMM65dG9hLdjaunT+xO+JWDTliY9GH6md?=
 =?us-ascii?Q?DYZrOyrC//qObEFaJJWM3zKQ10wutzUvOtsPJydoheqW5AtJv3/KrJEqFbag?=
 =?us-ascii?Q?+WLckCtiiG0XQOMmcRMjJuyNK3+dg+RfwXrLLiKzbJtyInOREK6KqAXG7uBa?=
 =?us-ascii?Q?1MXIcEdpysbOJ5Z70AAzD/OBYDduzHTignx4u3wJuplEUSBXOUqwRe/S5aVu?=
 =?us-ascii?Q?hyzYTaEWAYhA1TJXECHHJfO3l/D+BcgYmaOTKYt7QefUfY4pdOx9llpiwP5c?=
 =?us-ascii?Q?aI6nPJf6PhXQxzvvwpmwPnoBsKFQz+VP2/o9k7HHCExCi9Lpb0/Q4EtLsv9T?=
 =?us-ascii?Q?buplfgPNgpFP8tpbmaELGWkJcb0wPkGppO2ruZIhlKSmDVg8BQopI6oVLwWI?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c473e893-382b-48f1-6a5f-08dce4f094ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2024 03:48:32.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yq2/kfhOvavFLULU9L+f3cLQzsH0+V3gtDOqLJlDHnqzMNtLEP+9MgYIKPAx30rtMWGpTlc36Yl13g7hycWEHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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

On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
> 
> v2: pin pages vs notifier, move to vm.c (Matthew)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index edad6d533d0b..b09d7414cfe3 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>  		return ret;
>  	}
>  
> -	return -EINVAL;
> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>  }
>  
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a836dfc5a86f..5f891e76993b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write)

Nit:

s/xe_uvma_access/xe_vm_uvma_access/

Matt

> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct xe_res_cursor cur = {};
> +	int cur_len, ret = 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {
> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> +
> +		cur_len = min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +	}
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..99b9a9b011de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write);
> -- 
> 2.34.1
> 
