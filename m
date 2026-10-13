Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE664CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885C910E98B;
	Tue, 13 Oct 2026 19:10:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A30310E8DD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918630; x=1823454630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T9mk4FUjLxRwjDiSi838ILPyNpmFy1XgZIcNls+SS74=;
 b=cSLsTjNLyk1kNxJqHPntiKKK44ztuzqXyIZw+nPRS+aMlH477DJeqvWz
 iPdAgXlxuE4awUt6VUXSzU6U4nPMkIiszIcMn8/q4JyH3JWBpDtTFr9C7
 MwHbVPwey0deiB3CminVnjLuUefsWqGySDCReU+2j2UBramKAfrVZ2kVR
 n9CT+KKl104OKb6iXb8EmWW0A5lS1yISiKxTYpSg/Xj1mrX4OaBFHd7qr
 cJWyqt7y++0n4k9+P9ZWoZ1tj+vzrSbYX7hcO6i9gHZzJgr8SfKgIRh1T
 U7T1tEgHdIUY8vMmgVYzkPxYgaqIF+rZUN7hTA29CwVGBzeoJH8KqJhQ2 g==;
X-CSE-ConnectionGUID: AMpu1nR/Qie9egrRn0XXZw==
X-CSE-MsgGUID: iYVpnJaMTzuv1cDCUdcdqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="531854"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="531854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:10:29 -0700
X-CSE-ConnectionGUID: tWrdqBeCT62VOK1+2oLGUg==
X-CSE-MsgGUID: uvTkPBldSlmHhsYQwtfLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1436482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:10:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:10:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:10:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sW6nS5VhAvFBS6BeJpue+3YSZqT8rwjJVI5ufhMKZcR0mwf4jTdw4mZgsA/ZMHePvhRnZdZ6x0i5ujq2r2T9dbF3k4JWRngbR2RIHLIC8iHwfdoXns0/KWHarYdojcp1+anhcpBJzrmZkl7sZzLIts4PYNF6RaO/PqjKJNJUurz68ox3ZjjzpqzPWCr0NBq3uoqz6NM2eh7naPZuyXQAjxnbT+QyL+G4eMJmyUlIHVuwISOo5D9styc2IK4raoIGUts0EuowQ12RrdxrUPl021nJ5tcyChHCToy8QJ6JGuL4d8kwQjwKF0DEYMJOOo4fBkhtE0hw3MZHGck1Md27cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLLYC2ZgMu6DugfVHETd7fB8wP/p6S2Pc3w1CccYFk0=;
 b=uN+q6l2+qYn5Hhf26pIDb+h2LtOCIWHjYKL4uEfQGVmniPVDZ1MuB9NeZ2brOFK3N2LRfNE1VYZTe+EDooqKpgVAeqrUCFLwaF8HtQO1tt4h2nBPvAbIYp0l6hNe6dTB41ZE7VlVTTzfYqA1c/Z24fUb/rgTGiHZ2UbK+hD7uKEw7Xx3wKv/FejNrOPdKIYD7bA9FyQoqeQkbaDNqE5ezXWmNRjJzf5YY9/9Ty4vvqpFj2rl6RL3eiWVjNpvTAqUrWihkbSk2BlsuL7FbhNCjPsh/EvV8o6woJM/HG/GIzDXyECF+w0NAWpKnEMRvDFtW4DW/pWTfY2y+JMV6R6uYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by PH9PR11MB016272.namprd11.prod.outlook.com (2603:10b6:510:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 19:10:25 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:10:24 +0000
Date: Tue, 13 Oct 2026 15:10:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 03/15] drm/xe/configfs: Copy wa_bb out under the configfs
 lock
Message-ID: <as6CERf2ztPG8GnU@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
 <20261005220636.602826-20-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261005220636.602826-20-stuart.summers@intel.com>
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|PH9PR11MB016272:EE_
X-MS-Office365-Filtering-Correlation-Id: de7158d6-85fc-45a9-f3f8-08df295da207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 8+chcVr6eAbpKmpdvc5Z91WrBtQrTAqySg/P7zsXxvO5oDLWZllt7HHLZkXQzPPnF60+8cLwZT+eTJldmoLtcfdPOS6U+9p9txc8FQFo+AgpY47Mnd0112ZBU0CEEuWQdOsD+IGw/L+fEVfm6K26SYYUZrEnAsXHBBQv0I7WpO0NMFBe77FJIc3ehdCc0pvci0OdvrC0B4lFYB5x5gcYf0Kk0mhlgNaf4XXE8acQFzKYaGTX0z1K+R0fo2+439M/XpOxnFq3a0yQUm2277WVYBT3+xKW+POLv63pf9c6zBYq1DJAhSpDc+DtEPX5n5L+4qli3+CsacJ4jp6xEjJ4AshgqpdTtPIhnsebqRnAaf83LlpadVbT8r9lEa25V1IICvIEnfghFMggeZWThkGQ0XM6qXP+i2ZPPbHBXn13+jC+729GiF5343RPZUL6DX+F1ugHd/fbsjilcBymQ9ERTHZXRAF2L5dTg0DsSUAerwDKHErzjfI80vajzY3kkD6lZNMwXAEqsLj6Ms7QwSukGvkK73kfJHm512Wa5261vk9WsV+dFOwCTisT6lNq71wcVogjvhbG5ascJI6+hcWwM9siy4LtIXkHa/+59PVA5OctCqlBbJvd5iwVTAeOUbOnHNycU4jOwzHMsl4WUN54sQ3Udd9hCrZRbbv+7y21lVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dh43bVoN0UbwDSTt28npzj50HAM3997FnIvpjMZ39pGMsGN7NVIzumivaxcO?=
 =?us-ascii?Q?GTEmDSOVz7gzKBWfTYiBMrfBtwFCRElFcHLzUOXlItTA6/xQ/vGZifjiL9BW?=
 =?us-ascii?Q?6ktTSmx/lUGGlCdwM1LMchL04NUY7x27m7LPyo6rfZUvvu8/RYlBXdJDwLU+?=
 =?us-ascii?Q?gaqAnj7uIxEJ9UUwYWJZuwYBlPWGEyP4XZ9J7L1eOnUs3cwWKTDol+l7l9B3?=
 =?us-ascii?Q?aIGlQIFFEMCGT0FVXDwIFCu7aT1PJ+d3a9X2QHO7OX1EslJFsaRiJR59N8zS?=
 =?us-ascii?Q?rGdA/qwYIL+cGQ57pvmS2XKeo3ygf6m0GWJ7r5sH3P1mCKrhWDC5cGt+AGCG?=
 =?us-ascii?Q?ZLy4tWXPG0lqAJPGVoD4OWFFl72Q9aT7qvf7NDi8DoQu071Drx4QFRU1qwdL?=
 =?us-ascii?Q?xZyj6pcsiM4xrkWULRFJQDruGnsfjnGDx4DZBPBuXT6Jv0efUfgzWb8NcBJL?=
 =?us-ascii?Q?tZxsV5xg1gdu6lVOSI4tS9oSp9LAhxo4o9HTBUvrzWH9Ui8mOADV9SPkbbjC?=
 =?us-ascii?Q?gfCyvYBHavrL57kBrru0GAcpQ5bpMzBUE1Ip+6/eJvjkL5EHMChRboOw3qYe?=
 =?us-ascii?Q?NvkX7xC88q3UwJj7vGYY79VxBbJFuFRYxYIjHQgZeIUYyr09cAAlbp9KPAPG?=
 =?us-ascii?Q?1A0rJL90oXvuDuqDaA4Yr9E7kIE5ff1G9/XJA4N5RN7dwYt6C4xUDuQX95+8?=
 =?us-ascii?Q?M3Ha84ADGbh2bEd9448DaK+x7mXXj8M2xP/UDZMa/Dg84TqQxGLZXIoQOd0G?=
 =?us-ascii?Q?grqCr/YtYxxZTav2zHoJOhEQbQQVh3GgY23htMGy+ZvGySp7hWEvtblmm3Ws?=
 =?us-ascii?Q?ckAnKSfep8Fz0+cMVHGBucKQ90RbHtMFzC4dr4Gev41nyBiskD3VvvTiD2/+?=
 =?us-ascii?Q?AVgjHtF9GU4+98taqUmeekrhw58BafQXdszhXmG+YMyKcwzqnKlmgbmAM5Hz?=
 =?us-ascii?Q?jByLaZpEYxgkWvntC06WcECcaTPcn9OmgPXb8Cx/Lfssctau0zF2PXVAcjMz?=
 =?us-ascii?Q?Z4tAKeSumvVurIebcIcn4MUsQIFj+v0UV3iLsOAw3YbvLRPicWniURBPZPfp?=
 =?us-ascii?Q?7LXwjAbHuSR/a1OQyRErBnYxh+KRJTk204xcBZdfPtAUwUdMEC/ukSEhlFZ/?=
 =?us-ascii?Q?QEzF0+f7yx9Ui7p/fkNuB7C+A4wODdRnRyb6sjupWGJwcm+k2t0+4jLdVNMr?=
 =?us-ascii?Q?EQ4+8/l66xY7NtgXEfOYsXrvP0Rxtmany2nsatzXVheuBTeqxo6MQuKF+v7n?=
 =?us-ascii?Q?xBXUrQ40O5zqR/RCNYtjAhU0DZasFIARuOGLFoPAuCJm+axFimcX1jx47G3D?=
 =?us-ascii?Q?l0xTtwjiMNOcMyMHpLE1rB4qdtI3broctbg25L0qJ4nugSMMFGKCnIcOdhjA?=
 =?us-ascii?Q?i1Ch5dNaM+zZutzTX7qMyA+WEZ9UwAaaxkm0sa8hgr38hW7a271Pdbt6Tw7R?=
 =?us-ascii?Q?Ex1ITThDvcvki957OcVdVW/qdysr1JHYUqiW7K5ZSQ2iRta2uYnM1KcfGAkC?=
 =?us-ascii?Q?r7iK2UHDG5/STAtciwTsKZFY0z7S/6GX/ULhdB/YQqmCzw6T2iJvkspEZ+rq?=
 =?us-ascii?Q?rBVVRb14ONx4ADlMlnuvQV/eCPw7hPDcAtqxoSSyx5u2mw+sWMoWvFr2DtDN?=
 =?us-ascii?Q?/z0dWP0xDdXNWmbM9msOtkcMjNKFQHtHrCounN/0tFHwMupdAtTvA2/aml/w?=
 =?us-ascii?Q?2D2ttbG/j0DjxLEnC7C2DZvqaP/2vBVXrD6gXPgaTwIVOrzEe5Ft4O8YWtaa?=
 =?us-ascii?Q?kJc2YjnWPzU5Jd1b8eQGsyzvQMuO2GE=3D?=
X-Exchange-RoutingPolicyChecked: TKvxzBGU6VkcOwG2vDnkHB4Z16p/J5NlLz8HOuMuD+T/XfkBvXXd4H9h5w4x69oN86JKD+oLh8uAK5soxyrreP9AopqFP3ziZ9ohMCpnO0x9ir0up+DdHTz5Yr00Ouw2rCPujKDIDJzdA0AYQ8l22d+TzIFNr3rZhLlcuew05witxgosf16ZcNb7IhlOSsoP/B5t2GXKEy5Lm2HI9TA73CQOEyCjyIDhEiw6YEAwZ61jyO3200tehb4uXC7zUtePEXhi0CE6ulo5xeY4IkOkke3tM0QvacySiz7gAlwLFr2h02KbdW+fQB4kqedg7t3eR1AF0REMyMdk8OQ5O4JCdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: de7158d6-85fc-45a9-f3f8-08df295da207
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:10:24.5419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYWa4eO0cslixi0gQOdSaNcLJWddkUwnD6HNDRRnAEyS8V8akied/8YcMhEmm4jEutmEV01qscRqM4XQvs1zaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB016272
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

On Mon, Oct 05, 2026 at 10:06:39PM +0000, Stuart Summers wrote:
> The ctx_restore_{mid,post}_bb getters handed the caller a pointer into
> storage owned by the configfs group and then dropped both the lock and
> the group reference. A concurrent store can krealloc() that buffer and
> an rmdir can free it outright, leaving the caller in xe_lrc.c to
> memcpy() from freed memory. Copy the batch into a caller supplied
> buffer while the lock is still held instead, which also folds the
> length check the callers were doing into the getters.
> 
> Fixes: 6c6988c5e03d ("drm/xe/lrc: Allow to add user commands on context switch")
> Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

worth resending only these initial reviewed ones without waiting for the rest
so we can propagate the fixes.

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 52 ++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_configfs.h | 24 +++++++--------
>  drivers/gpu/drm/xe/xe_lrc.c      | 38 +++++++----------------
>  3 files changed, 59 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 1c7a096aa046..6e62fdccb4c4 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -1441,25 +1441,34 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
>   * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>   * @pdev: pci device
>   * @class: hw engine class
> - * @cs: pointer to the bb to use - only valid during probe
> + * @cs: destination buffer for the batch, or NULL to only query the length
> + * @max_len: capacity of @cs, in dwords
>   *
> - * Return: Number of dwords used in the mid_ctx_restore setting in configfs
> + * Copy the configured batch into @cs while holding the configfs lock, so the
> + * caller never gets a pointer to storage owned by the configfs group.
> + *
> + * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
> + * -ENOSPC if it does not fit in @max_len
>   */
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -				       enum xe_engine_class class,
> -				       const u32 **cs)
> +ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +					   enum xe_engine_class class,
> +					   u32 *cs, size_t max_len)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u32 len;
> +	ssize_t len;
>  
>  	if (!dev)
>  		return 0;
>  
>  	scoped_guard(mutex, &dev->lock) {
> -		if (cs)
> -			*cs = dev->config.ctx_restore_mid_bb[class].cs;
> -
>  		len = dev->config.ctx_restore_mid_bb[class].len;
> +		if (cs && len) {
> +			if (len > max_len)
> +				len = -ENOSPC;
> +			else
> +				memcpy(cs, dev->config.ctx_restore_mid_bb[class].cs,
> +				       len * sizeof(u32));
> +		}
>  	}
>  	config_group_put(&dev->group);
>  
> @@ -1470,23 +1479,34 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
>   * @pdev: pci device
>   * @class: hw engine class
> - * @cs: pointer to the bb to use - only valid during probe
> + * @cs: destination buffer for the batch, or NULL to only query the length
> + * @max_len: capacity of @cs, in dwords
>   *
> - * Return: Number of dwords used in the post_ctx_restore setting in configfs
> + * Copy the configured batch into @cs while holding the configfs lock, so the
> + * caller never gets a pointer to storage owned by the configfs group.
> + *
> + * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
> + * -ENOSPC if it does not fit in @max_len
>   */
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -					enum xe_engine_class class,
> -					const u32 **cs)
> +ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					    enum xe_engine_class class,
> +					    u32 *cs, size_t max_len)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u32 len;
> +	ssize_t len;
>  
>  	if (!dev)
>  		return 0;
>  
>  	scoped_guard(mutex, &dev->lock) {
> -		*cs = dev->config.ctx_restore_post_bb[class].cs;
>  		len = dev->config.ctx_restore_post_bb[class].len;
> +		if (cs && len) {
> +			if (len > max_len)
> +				len = -ENOSPC;
> +			else
> +				memcpy(cs, dev->config.ctx_restore_post_bb[class].cs,
> +				       len * sizeof(u32));
> +		}
>  	}
>  	config_group_put(&dev->group);
>  
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 10a00d6bbf8f..14e49f23306f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -26,12 +26,12 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>  u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
>  bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -				       enum xe_engine_class class,
> -				       const u32 **cs);
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -					enum xe_engine_class class,
> -					const u32 **cs);
> +ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +					   enum xe_engine_class class,
> +					   u32 *cs, size_t max_len);
> +ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					    enum xe_engine_class class,
> +					    u32 *cs, size_t max_len);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> @@ -48,12 +48,12 @@ static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return f
>  static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
>  static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
>  static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
> -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -						     enum xe_engine_class class,
> -						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -						      enum xe_engine_class class,
> -						      const u32 **cs) { return 0; }
> +static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +							 enum xe_engine_class class,
> +							 u32 *cs, size_t max_len) { return 0; }
> +static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +							  enum xe_engine_class class,
> +							  u32 *cs, size_t max_len) { return 0; }
>  #ifdef CONFIG_PCI_IOV
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index de9a9560ecf3..f751687dc568 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -94,7 +94,7 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  		return true;
>  
>  	if (xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
> -					       class, NULL))
> +					       class, NULL, 0) > 0)
>  		return true;
>  
>  	if (gt->ring_ops[class]->emit_aux_table_inv)
> @@ -1186,17 +1186,12 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  						  bool indirect)
>  {
>  	struct xe_device *xe = gt_to_xe(lrc->gt);
> -	const u32 *user_batch;
> -	u32 *cmd = batch;
> -	u32 count;
> +	ssize_t count;
>  
>  	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
> -						    hwe->class, &user_batch);
> -	if (!count)
> -		return 0;
> -
> -	if (count > max_len)
> -		return -ENOSPC;
> +						    hwe->class, batch, max_len);
> +	if (count <= 0)
> +		return count;
>  
>  	/*
>  	 * This should be used only for tests and validation. Taint the kernel
> @@ -1204,10 +1199,7 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  	 */
>  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>  
> -	memcpy(cmd, user_batch, count * sizeof(u32));
> -	cmd += count;
> -
> -	return cmd - batch;
> +	return count;
>  }
>  
>  static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
> @@ -1216,17 +1208,12 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
>  						 bool indirect)
>  {
>  	struct xe_device *xe = gt_to_xe(lrc->gt);
> -	const u32 *user_batch;
> -	u32 *cmd = batch;
> -	u32 count;
> +	ssize_t count;
>  
>  	count = xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
> -						   hwe->class, &user_batch);
> -	if (!count)
> -		return 0;
> -
> -	if (count > max_len)
> -		return -ENOSPC;
> +						   hwe->class, batch, max_len);
> +	if (count <= 0)
> +		return count;
>  
>  	/*
>  	 * This should be used only for tests and validation. Taint the kernel
> @@ -1234,10 +1221,7 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
>  	 */
>  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>  
> -	memcpy(cmd, user_batch, count * sizeof(u32));
> -	cmd += count;
> -
> -	return cmd - batch;
> +	return count;
>  }
>  
>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
> -- 
> 2.43.0
> 
