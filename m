Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5FC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 12:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6BD10EAAC;
	Wed, 17 Jul 2024 12:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXVBbCNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A65C10EAAC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721219337; x=1752755337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hWVmAGEPox/1PXeUaIYNrnKDXgVafsdJeJWp1ZumgHA=;
 b=WXVBbCNbecbE3XHvpFoS98+BJwQy5i1MKHs8+O+bG9+nSLRAza6aqsjY
 z3j89rOx6ClA+lhggR1RgvhyEYd+N9+HPOeQ8tphdJMjE491XCaTRS0YG
 EBSSaydaER3j+6WAeFoodExeuodZERTo5WvjR0pqReoyBQ8NfyJbvbfpF
 3JrPahitCKhEfgkZHLr1f5hZffNvTTODUgHx6Qd+ULj9qXVhTGbDD5hkS
 x2g+v7tvfvQdJIiiP/Zpa1zIaGzE42EzVgwTYOpzok79WNY2w0BkrrJy8
 G0BS17GECN8fs9+suls1D9EMiHKfqLcxqWlLRDz4OA5i/2HCI7staaeZB g==;
X-CSE-ConnectionGUID: w8FWsk86R1+GsuK84tFPlA==
X-CSE-MsgGUID: 8YWy4rpNT96NOPOsTm2BKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29386414"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29386414"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:28:56 -0700
X-CSE-ConnectionGUID: Vy4xT+N3RA6pGOsexKvBlw==
X-CSE-MsgGUID: mLUynbSNTve1Eum8P0N75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54698505"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 05:28:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:28:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 05:28:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 05:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQYJ603HcX8+eg2bI/QiGK1qP/l2iUiN+wtkuV9gd6lSKXVZLzcAyCi0JQiqlIB6su1NZzRwDJ3K4+FRYQ91OTCjl5MwpcQ9Wrch9N9YpIKI7mvMaaRBEoZr98pBZ2kL2WEp3uFvFbfL7cu0kSD9ZEWNDjkt0JpzdVWUSfOthdY71EhQXCcA1dYCA32dGHgBQhsZ2mBVfL9CHbmeWJJcWnXQjrlEM3cn26vBOwgn9IZUO8lBKBxhWjxbDp899/nw+0d6NJho3pcbGMn9d1i2Et3pFzPew9M1YU2bIWtwstq5rFs4HgF4xou7uI2PSw3O8a1nFs86KCMye/VjQT8jbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7zSE+6se9A7hh6ru9Zat1bHXD0G291yOgBLCFWn17g=;
 b=RCChvzah/rLqjN4B2/q57cWh0UjgPz0vd7fGKWJ09odJs23EdXrZMJBAytcWp7kpM9qxQP3q/GIpei9HIVk31XuT9m9Fp3xBS4mJGSHLN3cgBw58+Psp8MR0hoGl30yxCXMM7EHJ7Blhw1U6PF4aRStDW2geTclLxC5VuNi7cR3rsCU4C/vRArUz5JYq88zUTWF+Zps8GxkLtUoqy1AfM0aktJ0mOxQJWOmm0tNlv8qxgBPKdO7lHSUVf+joGptbvWfYQiEs4VSyUrR04w060iEAcBBPwWv+bS87uU6/YEZGpqXagIi8K1TWYpd/1s1NfGKKn+U/jcda+mGh2wajHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 12:28:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 12:28:53 +0000
Date: Wed, 17 Jul 2024 12:28:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 8/8] drm/xe/migrate: Parameterize ccs and bo data
 clear in xe_migrate_clear()
Message-ID: <Zpe400axUhGEfIrE@DUT025-TGLU.fm.intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
 <2d4fb2f3bbbd38180b878f00775c9df5a5017b2a.1721193361.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2d4fb2f3bbbd38180b878f00775c9df5a5017b2a.1721193361.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: e089926f-d39e-4e16-69f8-08dca65c04e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qv81RGbxyqF2urK4j14GFxsjvSLAyLJbYRNEzICC3IXp+lW0wUh+32dhvA/A?=
 =?us-ascii?Q?i6C9RbzYy2jZH28e6Z/xzUTneaVxBfA8qtvUVZWa3PjO7TW6/eV8vti02N/7?=
 =?us-ascii?Q?pxbMuBmBtUWdywlJJI7mLpffqBX8o6S777BllzyJ5cc8Fwo2oI7l8i+Kk22M?=
 =?us-ascii?Q?xrjNjdKO8q4kzktCJika5GrkwQnTf3Rjmi0L4bNkGuyeCJomCuchBoQQML6X?=
 =?us-ascii?Q?EypYmvaWn63toUtY3bBl9QAihO5vrxbYlu1YtK68KC7fccXPHi3+hopUxQd5?=
 =?us-ascii?Q?0Geplkpt7U8Cd0XOzwM6fclxVKxFuj3BTPyGQTnbDkwCVm06+aNpMAp3QUjE?=
 =?us-ascii?Q?7EolWFGp1BxZYkYC5MwU0jHKvuNiNV19PHcaL+dY0Jcdk8PeGvrLLVUIxeln?=
 =?us-ascii?Q?wr+7dBi5Ldr7KHRLJU28Zh7baELNn9Rc9oVOfmzWQNJSU5Q+WuNZkYUMikSO?=
 =?us-ascii?Q?7l7LJhqEGK+JpceOTLaNe/ft8ezItB7TVbZqJgkf/WGzkxS9MJouAoo1Dqvj?=
 =?us-ascii?Q?Lhe1AgeahZbiZRQiF7RgjrWx8blbVzsC4Q0/MaGPmbI66rQyi9mBfkxknoE/?=
 =?us-ascii?Q?8fDCf9CkbGn6+t4nrtn26x1YxKpM3JLIhmYuNBFLy8o4UzRso51oaKDFa90A?=
 =?us-ascii?Q?OkCCgYKrLeALBMPIlqLKrL+77F/hg0BinF5xOj69E0S6z2MPOSbb5tt7WNgj?=
 =?us-ascii?Q?pvOdEB8Sn9oYY7YfShOSaM4GmoPg7xnV5J/8MfznHB9FUUW9p0PH4f0Lm9uu?=
 =?us-ascii?Q?xWHfBRitk1bbCfL4KQ0fV1/pW6pXa7LduOCsbWG145JqgtmqMODocYsev91Y?=
 =?us-ascii?Q?TD/Ulo7XqHTd07rlbBtTd9MAFuj7+XflvMc7aB1I8zeF3jXrAhHinLQXymqb?=
 =?us-ascii?Q?C177lsmsOkqPsfCi5B5HCfPUcwwkEKGRtzld1RkfqQ34oUiwXvT76Zj5UJyX?=
 =?us-ascii?Q?qlZP5lrFUNfgILbStJRIJm0c3XTpkSMuoaCvd6pwJqsLRPHFOneBD1U9z9pS?=
 =?us-ascii?Q?Y826EFtdweZ/ljopeEL0rFAgR0upmjFsyeMib2WNyHb2ojF3yxMBNOHwQ4P/?=
 =?us-ascii?Q?0zCvKiNsml0NpUQ9s0TESTgUWiwcLCZ3jdMrjZc6d8NUgOzQr1Hf4swZjXT6?=
 =?us-ascii?Q?a11PMg/4gqJXaQhwGKaunn5gYEra9broS/np8KBZiAuP13nEZUA+K+XgVbd5?=
 =?us-ascii?Q?mn7KYS6f+umK8eQ6otfzcPL44Tf1cS9YUKvWQVRuaw/duyCf67EYwfmtDdeB?=
 =?us-ascii?Q?9ACKv1evQ/ISUP0x1RKIrZLeh9kdgRqxSPIdBh5sK/0w//o15QuUHXnz59Mm?=
 =?us-ascii?Q?pOozWTYPQX9st2IKCL2sjnY04jliMyZrkV6niNijTOGUOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEE3/uPi3es6yxPz9HNO+IlMTGPhEDZCAUqtf2I+WyDUY6PP92wcBQbLXYaF?=
 =?us-ascii?Q?DipuKFDkYz2MBW440ahiVjd0srA+AgjlIoWagsGpLHH1uLzvEhBYsXAVqWa+?=
 =?us-ascii?Q?XJV7QnOaoOn7J2o8MJrTK7QJ1DwCzKzeNRCQRcoi8KYGcvI3Cyb5QPOKBms7?=
 =?us-ascii?Q?9etqjPprqb8lshUz/SnLANMC7VnJEgwmSVJ5lw+Im4Z1nvPm75r6hRhuX7qz?=
 =?us-ascii?Q?WXcDr6z1nkm2TRVNuHToqXtmfNzZNpNGOo/E8D1yKggiQSyLAjfMOtNdF/jv?=
 =?us-ascii?Q?p3uSt8x7hrTz09YqvY3IrJGTCyAH48vSfEVhwn4LOgA3rEvqWluTRNG6HVmr?=
 =?us-ascii?Q?ATRsi5yU9hqb+UKb328xxWAMfwjs75YdKKjR9HyuRQ2LrIKanLyM3B8KtyKj?=
 =?us-ascii?Q?2rfu54rXualRD4zppgnJ1s++uP095CH3v2YG7xdiQulWMESMrZIx4/vcMwZq?=
 =?us-ascii?Q?X2vly5EbUy2kl+GSVy50mlAJGjLjYzvKP04cVxgQVUEyg/SebgTaHA84qsCF?=
 =?us-ascii?Q?pO9M8rs+9I/LB7LoxPgniDpk9zqL4nVPJHt55Un+73EfSQz9WMqW+aQLMI/n?=
 =?us-ascii?Q?FPEgeNsEcxmtg15rkv5aM0gI+XePhgpOs36IvPtwGIegfYe59ugmF/XT72Fo?=
 =?us-ascii?Q?4XEQTI1r2tMTer53cmA48tbU9IrjLHpP15SuHcp97m3bLCicSIhJsNOci+F8?=
 =?us-ascii?Q?8getx+vUiKP2S48QuzIRgVZ1zQthfa79BD/3O/BNaQOPYU4xrdNgzb/edLYI?=
 =?us-ascii?Q?C908C19/Bp8WIUJuH4U5VUecz3Bk8bzKFTCCCRAz8GjKtfTqfSXRL5M4m2n8?=
 =?us-ascii?Q?bKFPxzD2BrFKFry/BOeQormqLIx7NRf3bJcHEqVLA1ADNtrAp7ia8CfcLXyA?=
 =?us-ascii?Q?VuebwuTYVQ8xLFjhxus+s3DI8tAxU+Efq1vgYQ98SsOAV/1NkS8jv761xKRE?=
 =?us-ascii?Q?Ii/y/nRD/9H6TI0yrLn4gAE7iBKuxpiSycuNqwLypV2tg0ed15lq432608Vh?=
 =?us-ascii?Q?2S+2empIoBWklSsgG4Kqw4fNjcE4wDVXJYdqVmEVWN7GTn6puuKB08URivfs?=
 =?us-ascii?Q?ccbbB59JKSDeetCRF4ag5DDXFBl8xOtWoHwzBEeACe+g1IqBcAhEHhw2Y4rP?=
 =?us-ascii?Q?9p+e1/1QcE5oUhedCuKnp6oIcUQaDymbDxAQdQ+LC2+0KhzapmxbAOiVgjig?=
 =?us-ascii?Q?szE0bNtWRUVQrTtk35AoAona8VBfeSGuwKXv92UaW/CdWx0l628ps0rYdkx7?=
 =?us-ascii?Q?bjwU6dGmAlxN7ZOUfgnmrlVzBgpzP23xHrNLQYBXxqoSJIsyZAKUUkt6cc6C?=
 =?us-ascii?Q?WhN10J7yjYag0nasaeYqbC+BJrdSL/VUaxF2+ZWRjrt0wbG9Vn+uJHSFBW96?=
 =?us-ascii?Q?KmZNR6XPuyGESVHU8wnAAUamkLeKjkxpAGZLO3IbtazhhQRIgPDrFXaK5bPM?=
 =?us-ascii?Q?eeFn7AQIc+aEGzqqukHT7ZmoipLWzYy517+gjHlbLW/8SSU8xXi2vsXQI5b8?=
 =?us-ascii?Q?YT8jjirkrUUAdCKFaIWcRtHqlUttGvJlIcd7mWIEKxy84Gxoof/X8W1lrmB6?=
 =?us-ascii?Q?+o1oRe8vJ3dJ/Co/6cmDkjGlY2XKDjHrpt5E/60Ur23koGj51dELBZAsi1al?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e089926f-d39e-4e16-69f8-08dca65c04e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 12:28:53.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuwrDFKmd8qEjEyUVKTop9FKs//+Rzk1XLSlzSl+iDMY4TXZnW1qdt67FWqjKNZ2FeSJHtHbLZEnjIshP+InUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
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

On Wed, Jul 17, 2024 at 05:21:33AM +0000, Akshata Jahagirdar wrote:
> Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
> layers can utilize. This patch will be used later on when doing bo data
> clear for igfx as well.
> 
> v2: Moved 2 bool arguments to a flag argument
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  8 +++----
>  drivers/gpu/drm/xe/xe_bo.c            | 10 +++++++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 32 ++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
>  5 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index e2e0ea24757a..c6db62a07276 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>  
>  	/* Optionally clear bo *and* CCS data in VRAM. */
>  	if (clear) {
> -		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
> +		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
> +					 BIT(2) | BIT(3));

Use defines everywhere. e.g. s/BIT(2)/CLEAR_BO_DATA_FLAG

>  		if (IS_ERR(fence)) {
>  			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>  			return PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 4929af88e75c..ac52bc4d2c51 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  	}
>  
>  	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
> -	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
> +	fence = xe_migrate_clear(m, remote, remote->ttm.resource, BIT(2) | BIT(3));
>  	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
>  				 "Clearing remote small bo", test)) {
>  		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
> @@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	kunit_info(test, "Clearing small buffer object\n");
>  	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>  	expected = 0;
> -	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
> +	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, BIT(2) | BIT(3));
>  	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
>  		goto out;
>  
> @@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	kunit_info(test, "Clearing big buffer object\n");
>  	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>  	expected = 0;
> -	fence = xe_migrate_clear(m, big, big->ttm.resource);
> +	fence = xe_migrate_clear(m, big, big->ttm.resource, BIT(2) | BIT(3));
>  	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
>  		goto out;
>  
> @@ -598,7 +598,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>  
>  	kunit_info(test, "Clear vram buffer object\n");
>  	expected = 0x0000000000000000;
> -	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
> +	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource, BIT(2) | BIT(3));
>  	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>  		return;
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..22b16a0006c5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			}
>  		}
>  	} else {
> -		if (move_lacks_source)
> -			fence = xe_migrate_clear(migrate, bo, new_mem);
> +		if (move_lacks_source) {
> +			u32 clear_flags = mem_type_is_vram(new_mem->mem_type) ?
> +						BIT(2) : 0;
> +			clear_flags |= mem_type_is_vram(new_mem->mem_type) || handle_system_ccs ?
> +						BIT(3) : 0;
> +			fence = xe_migrate_clear(migrate, bo, new_mem,
> +						 clear_flags);
> +		}
>  		else
>  			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>  						new_mem, handle_system_ccs);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index efd64af4f8cd..da06b434b9eb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -518,15 +518,15 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
>  
>  static u32 pte_update_size(struct xe_migrate *m,
> -			   u32 flags,
> +			   u32 pte_flags,

Looks unrelated.

>  			   struct ttm_resource *res,
>  			   struct xe_res_cursor *cur,
>  			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
>  			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
>  {
>  	u32 cmds = 0;
> -	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
> -	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
> +	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & pte_flags;
> +	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & pte_flags;
>  
>  	*L0_pt = pt_ofs;
>  	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> @@ -1032,14 +1032,19 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				     is_vram);
>  }
>  
> +#define CLEAR_BO_DATA_FLAG	BIT(2)
> +#define CLEAR_CCS_DATA_FLAG	BIT(3)
> +

BIT(0), BIT(1)

Also since this is a public function, define these in xe_migrate.h.

Since public define, probably normalize too (see xe_bo.h XE_BO_FLAG_*).

So...

s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_BO_DATA
s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_CCS_DATA

>  /**
>   * xe_migrate_clear() - Copy content of TTM resources.
>   * @m: The migration context.
>   * @bo: The buffer object @dst is currently bound to.
>   * @dst: The dst TTM resource to be cleared.
> + * @flags: flags to clear_bo_data and ccs metadata

Mismatch variable names flags & clear_flags. CI hooks is complaining about this.

>   *
> - * Clear the contents of @dst to zero. On flat CCS devices,
> - * the CCS metadata is cleared to zero as well on VRAM destinations.
> + * Clear the contents of @dst to zero when clear_bo_data_flag is set.
> + * On flat CCS devices, the CCS metadata is cleared to zero with clear_ccs_flag.
> + * Set both, clear_bo_data_flag and clear_ccs_flag to clear bo as well as CCS metadata
>   * TODO: Eliminate the @bo argument.
>   *
>   * Return: Pointer to a dma_fence representing the last clear batch, or
> @@ -1048,18 +1053,23 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   */
>  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct xe_bo *bo,
> -				   struct ttm_resource *dst)
> +				   struct ttm_resource *dst,
> +				   u32 clear_flags)
>  {
>  	bool clear_vram = mem_type_is_vram(dst->mem_type);
> +	bool clear_bo_data = CLEAR_BO_DATA_FLAG & clear_flags;
> +	bool clear_ccs = CLEAR_CCS_DATA_FLAG & clear_flags;
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;

I'm not familar enough with this code to know if this change is correct...

I'd check with Matt Auld or Thomas (but he is out for 3 more weeks),
don't feel comfortable RBing this one as I'm unfamilar.

>  	struct dma_fence *fence = NULL;
>  	u64 size = bo->size;
>  	struct xe_res_cursor src_it;
>  	struct ttm_resource *src = dst;
>  	int err;
>  
> +	if (WARN_ON(!clear_bo_data && !clear_ccs))
> +		return NULL;
> +
>  	if (!clear_vram)
>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>  	else
> @@ -1085,7 +1095,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		batch_size = 2 +
>  			pte_update_size(m, pte_flags, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> +					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
>  					avail_pts);
>  
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -1107,13 +1117,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>  			xe_res_next(&src_it, clear_L0);
>  		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
>  				 &src_it, clear_L0, dst);
>  
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		if (!clear_system_ccs)
> +		if (clear_bo_data)
>  			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>  
>  		if (xe_migrate_needs_ccs_emit(xe)) {
> @@ -1172,7 +1182,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		return ERR_PTR(err);
>  	}
>  
> -	if (clear_system_ccs)
> +	if (clear_ccs)
>  		bo->ccs_cleared = true;
>  
>  	return fence;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 453e0ecf5034..0d19bfe02a23 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -104,7 +104,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct xe_bo *bo,
> -				   struct ttm_resource *dst);
> +				   struct ttm_resource *dst,
> +				   u32 clear_flags);
>  
>  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>  
> -- 
> 2.34.1
> 
