Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F40C4452B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 00:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BC710E27C;
	Wed, 22 Jul 2026 00:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lg/NSbz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9934210E27C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784678457; x=1816214457;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=wfNvllida4XoHhlB5hRswvZwT+5Kom9v/FgtJrbyDto=;
 b=Lg/NSbz1yJQ7i4ayJJd4yom66S2JKqW9d0YHXAt85xu85aohHPvV4+Sz
 A7v0W4zBid6LrP8JYH7sPtUANreeL2DACcWm8EKOyazxqHOavU8HKmtqt
 3axdHePy6/w8SW9sOVgNy6yQEBkHD8rSvNgst75KsT9Bq0u2vEsYxxr/F
 BECnZm8CMMAQGzf6Kc4WOTUd6GqUzCUe/951Bf/jk1SUh7OaAv0In44Lk
 8vxDiNbu5oZX/Eco/LABsSvvNgqIC337WpY0ixXQxgFz6Xv94kPBiUNSD
 +0tRN1mvN2WY/8KEdD1/QEJnX+Wt1J3xZknWh14FliSwPcPGl1gz3KDjq w==;
X-CSE-ConnectionGUID: zYvrXEiWSrij7Ea/xmExeg==
X-CSE-MsgGUID: mQyl9gmMTCGcmNURPvzJFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108088359"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108088359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:00:57 -0700
X-CSE-ConnectionGUID: Yp+0lWRHSnG2m4aJoTYx0A==
X-CSE-MsgGUID: CNd0yhy7Rq6aUzk8mHPBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="257378593"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:00:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 17:00:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 17:00:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 17:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx2hZVRzg9RZDpz2x/fTIvgXxp9vNxDdEsY4Flz8Yv8TI9WO+MeFyotyJhUZB7BzI96VxDbgIKVjyQIv/PcSjycNGnbnTY+t3bMSoWm+dhVVkcYiwnneUTOJ+jn5UsZlIH9Fymz9vI9Bjfkvat/MTJi7G0PIyXpu4DDyIymb0wxZZ/e12SrSt7ZID/GwFieQZfmd45z2z6Ob4BxqxU2bcJR1qfEwdJiFD4qgRrLZEa6jFMOCWgnjcXIVCvsJFgL9oIsSG5W0AMSvH8uaDpP9BkKBWaJFD/8SfQpLZ16BUyPlyvkIh+o1zSVPgXltERez5A1OqhbKBF89wgbI2s56oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prkvQ6dBW+/ingQggCZSkB0kxNt6LwCHymEv4BY0Mpg=;
 b=MxwcWZNIfQepa9dqi3oTYEGWlp5O8qh6g7rfqaotaDQoO4Rv7+6c45qCGNrXDDQV0ZhY/RzweOUNyl7AvWhoCJI5cTtFv0OPAWg+IPTaRwBnZh0tobAG7iM7aAf8yfdELa6O9z/1ugaDwdqarMlTaQ6nkfMyBrkLHo834yKlhIPgtlqK2e+EXGIbN6C6YGFgUvAwWk61Cem4W+vInWSehPKC7A/Kcre+0ROOIUTRzdKMg7/SohwWGqUMkPdQFY96vVma85PyxrPPLOoJKtCi8m9ZUPwobT8PP3ZgTvl3ZBchAVPmO25fw/ESmEjbVo6Xc/7mfFgM/qo5KrTZqVgqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 00:00:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 00:00:44 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
In-Reply-To: <20260721-wa_14026539277-v1-3-09fa102f3084@intel.com>
References: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
 <20260721-wa_14026539277-v1-3-09fa102f3084@intel.com>
Date: Tue, 21 Jul 2026 21:00:40 -0300
Message-ID: <874ihrrizb.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cebf58-ae1f-464d-bc78-08dee78446d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: yKOP+wjR6UPPXnLanktmrdW/WF3YflC/6irKQXCM7DBxKlessRNSIqdshWzHyev1k9Yz6/Q1r9PyR+0ZE5szxhZPxbR8eljMQ9xfPPCSQHfYRD294kopxA9znhV/PWuqnns4WxsUi3VVbQ0XOg0SSjeM5rxqR+28pwpLlJkN1+YL+SPwOO6ogQXGUGW1aMNmXHk2Oot24+OReI1JWQYkNw03rAZth+pY3R0A17nrNrR4rdyMSsf7LnNQKsZ1m/xSpZLtQyHc5RlIQjT0RAGipcVojyDjpAdgNlBOYT7KKXWyJvNn33NCzOVS9R1OHNaPqG8t8pX9Sbo72zPsDMuJQWoTL6J1CWD+/IipvomHJCw7czJJm/JSs9+hXOY0kk2bz1tsoZTIL2Ex4QpewTkZyWceqJBG4mIJDuXgJU2xRjIDp20K5o8vwnSVevVNNY3RcTX1U9gz2CRXSIIGxNcwt7OL8s9sUywKhazlb6c2mrV3Nfg8CDhjSmnEiUxFloF+IJ9Da84rq7yeQa1UoC7TmO0CZ6P+lxMpEopJUvjhHWYp2a6Hn0A58BueHK/DKobRbHOMkbpPw1z0x5spKUTap0ICSj/HMZ5tiSApxIdXWq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gldwN8UfpAVn7X5zl9a+PqEQ7rezCHkDxEuKUGP6B5uw3R8hdTvdY1YcUOvJ?=
 =?us-ascii?Q?wwouil/N7jXWbQOOXPC0ll7Fq5x+Q0ml8/PBOPwmkeowxbjTIzprdYpKH8qd?=
 =?us-ascii?Q?FIiZ/kG8ZxruZIqahKZgLpI8Jhc5q3kkWStMPPQbJsaNHVlPfDfuseC+nFZ9?=
 =?us-ascii?Q?BXo4hHul/TxzzGGOavrrjD4zluBtLaDnpZzC8T1mcNMlJtVUb8JzkeX3L3Er?=
 =?us-ascii?Q?JdDEkqDsoqnp1XtkLo9/MwJj4EyvLfefI+OpYkFAB7WK3cy0DUsZ7D84UhbS?=
 =?us-ascii?Q?1YOMKjBcCqvmhKC3r9k7Kq6Jj7hrcZRaZuQHmS1qYS4vcS6b1YzOTuyMu9PA?=
 =?us-ascii?Q?qmnSmaf3vnDkiiNWrG79I0VTTebbsYYpIk2Ps+UytFmMwGfSQhDg4klvT+/O?=
 =?us-ascii?Q?1RDm4NsZQRDbppUtKMfXLEQLb6EPzV5xsWtirOuLodzAqLj71uuZfrvi8uV9?=
 =?us-ascii?Q?nhF65YYCLICbYhDFH6WkfeKjLVAHdjK88ampfWegrtZQCjTbVFqUC3sjwOzh?=
 =?us-ascii?Q?S0txbmehC6vS7kFzhRAfMFTrGujdD38x9bbCsvaIpSUEs5jKMQR7nZkY1ryT?=
 =?us-ascii?Q?nOlrVxrRmYksFFh/NkaJzx7RVLeZbdC6eCCffk8xOnacV08vX5jf1lECj8F6?=
 =?us-ascii?Q?syQYc1N+4gWS80t1jAjDA3XC+lDkS4ln5R5ykVfPQfgLELm4q3F+/IJFiBds?=
 =?us-ascii?Q?HoqalEicEDnQqvwKm5ELqe0D5SjmJmhLUbBO1kxiM/UinNLzEcwnedGXIy02?=
 =?us-ascii?Q?ZtBbnxpBt0rTTmUehSblYO6qhWWI10ezRzaedRm2JfifxS1vn4eA+d/gIfGi?=
 =?us-ascii?Q?BhIzV9oEM0QFwWh/tMQYg60l9imG/u70GJO42u9yru81pIGpybNS56MBJuGn?=
 =?us-ascii?Q?VmZFVAl4jrtpjcRo9iotbQywAIwY5hrBAcaNwxl8fKmpDCZSzNFKUPJjshaY?=
 =?us-ascii?Q?jorwNPJ0VCzqYPKY6YRq4c0+x5nOUJhy9fPP0M1YfjNT8GxaheOWUYploe5E?=
 =?us-ascii?Q?tHkYdWuIcrGc0hcLVZgNeOqdf5g7ACv30GQgyn/Rg7kvYKKaKNzcryDGZbTS?=
 =?us-ascii?Q?X/Oi5rTYoepRpkNPyBug1ReRR11OA8YTr49CYOhuaadaHLzI3u2dqYXl+kZZ?=
 =?us-ascii?Q?V8bLMt9TBjO2F3oOMVGH5O0mcnjbII26jDSxD+PgghDBQjYc6EcgRgGl9K7f?=
 =?us-ascii?Q?C4OX9uQz7+nS8bH5ZkvpbUh3s/XpDQtrtk9KCOse4xMQa4QLKpPBy0vxKa0v?=
 =?us-ascii?Q?znjisbL0TIwJISPiFjKCc/uUsGvx8PfFP4Z56n209ahy4jVvSEgcLYT3NOOQ?=
 =?us-ascii?Q?wDXA7Ppd0pYX3/j2FHtDRBHErHoYLKoL9YxS+cO0do5lWheoHz8H0TsjtuXw?=
 =?us-ascii?Q?M1HOqeaGqNzYWjLhVbX0HBjzaUVvpBXwNrj1QS/SfJuUwhiTZTKm3aDlpMuI?=
 =?us-ascii?Q?NEHzFtjdnT2f3g2lMRzuKq45zdnR6Bn/nSk8PDaBEO8bRi/c+7Upzee2L0cr?=
 =?us-ascii?Q?wmHwiz9xqjL66qhzNBko3G8pJYK19w7IWvWBkgKvqFC0mLMdtgZSlDxqk8m8?=
 =?us-ascii?Q?puiHwGDHMTvSwmSDFGrqGehHIwEZ3WG5Xl/61RjJ5EPL52/dloD3xbdZ2+om?=
 =?us-ascii?Q?PExIxLW4zKmXnC39HsOCMQcXQw6PXKPWUfTDiFkgMQZrDwTpjlhZ7VX/oJG+?=
 =?us-ascii?Q?jzWRwOgXUqlytq+k8B4iRUb8vJ6nNnD1qyHX5KtTZozpkh86gewwqrN+nZtk?=
 =?us-ascii?Q?GAV0Yt41mw=3D=3D?=
X-Exchange-RoutingPolicyChecked: qfKRC5LKlaMkod+aX6QzQ1B7wM1OaCcX03ZM8Wev3qEhx0RZ7dzYvaWvVMiz5IcFFuCVanBWCtGyXI11T7a4sLqP4qRkvzSMV3sOAIyEjB5GuuU3cPoMaRlAL4cjQMaul1H84tWx72Ff3pRNsuhEEitaTg7mg0hIYRwwQY0vUZZ0vS5Shp6heHpgMUcDGsh896DdEfcrR3iwG91Amm1oqJH250aF9MET730FVw8R61ck5zLd9wv9V4uaa71r3ZapF2+a/6PMglaTGH+lbsnJddiBbP0jLXXp89IXLT9g0altF2m1pycFFuCu5lTNEnnK+OUD0Z8r+28kQiI50q/E2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cebf58-ae1f-464d-bc78-08dee78446d2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 00:00:44.5963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZBiRbVljsnRFIjWclZEauz60rFcblflCBM8s8mlcaOA21Ujvx2lu/YL3PVZokyRzcWwOzCy/hh90e5NUnaCKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Wa_14026539277 is a temporary workaround that targets only A*
> steppings of NVL-P (the platform, not the graphics IP) and requires
> that we avoid using 2-way coherency for device-cacheable memory
> accesses.  For driver-internal usage, we convert those configurations
> to be device-uncached and 1-way-coherent; on the UAPI side, we reject
> VM_BIND calls that are 2-way-coherent and leave it up to userspace to
> select the alternative option that is most appropriate to their usage.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.h               | 10 ++++++
>  drivers/gpu/drm/xe/xe_device.c            |  3 ++
>  drivers/gpu/drm/xe/xe_pat.c               | 55 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm.c                |  5 +++
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  5 files changed, 68 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 7060f66e1d63..10374022f1d2 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>   */
>  u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>  
> +/**
> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
> + * use due to Wa_14026539277?
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: a boolean indicating whether the PAT index is reserved or not.
> + */
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
> +
>  #define xe_cache_pat_idx(xe, cache_mode) ({					\
>  	const struct xe_device *__xedev = (xe);					\
>  	enum xe_cache_level __mode = (cache_mode);				\
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5189419a0593..140dbd97466e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -836,6 +836,9 @@ static void override_has_cached_pt(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> +	if (XE_DEVICE_WA(xe, 14026539277))
> +		xe->info.has_cached_pt = false;
> +
>  	/*
>  	 * Wa_16029380221: The affected GT will always use non-coherent
>  	 * access to page tables, so we must do uncached writes from the
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..334f6ef7e9e8 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -7,6 +7,7 @@
>  
>  #include <uapi/drm/xe_drm.h>
>  
> +#include <generated/xe_device_wa_oob.h>
>  #include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
> @@ -313,6 +314,30 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
>  	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>  }
>  
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
> +{
> +	if (!XE_DEVICE_WA(xe, 14026539277))
> +		return false;
> +
> +	return xe_pat_index_get_l3_policy(xe, pat_index) != XE_L3_POLICY_UC &&
> +	       xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
> +}
> +
> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (XE_DEVICE_WA(xe, 14026539277) && xe_gt_is_main_type(gt)) {
> +		if (REG_FIELD_GET(XE2_L3_POLICY, value) != XE_L3_POLICY_UC &&
> +		    REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
> +			value &= ~XE2_COH_MODE;
> +			value |= REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);

Oops, good catch by Sashiko[1]:

    The commit message states that driver-internal configurations will
    be converted to be "device-uncached and 1-way-coherent". However,
    the code here only modifies the coherency mode to 1-way, leaving the
    L3 policy unmodified.

    Does this need an additional bitwise update to set XE2_L3_POLICY to
    XE_L3_POLICY_UC to match the commit message?

[1] https://sashiko.dev/#/patchset/20260721-wa_14026539277-v1-0-09fa102f3084%40intel.com

--
Gustavo Sousa

> +		}
> +	}
> +
> +	return value;
> +}
> +
>  static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -373,18 +398,22 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
> +		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
>  
> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>  	}
>  
>  	if (xe->pat.pat_ats)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
> +					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
>  
>  	if (pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
>  
>  	if (tr_pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
>  }
>  
>  static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -534,13 +563,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "PAT table: (* = reserved entry)\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
> +		bool rsvd = !xe->pat.table[i].valid ||
> +			    xe_pat_wa_14026539277_reserved(xe, i);
> +
>  		if (xe_gt_is_media_type(gt))
>  			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
>  		xe_pat_index_label(label, sizeof(label), i);
> -		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		xe->pat.ops->entry_dump(p, label, pat, rsvd);
>  	}
>  
>  	/*
> @@ -747,9 +779,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe->pat.table[i].value;
>  
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		if (GRAPHICS_VER(xe) >= 20) {
> +			bool rsvd = !xe->pat.table[i].valid ||
> +				    xe_pat_wa_14026539277_reserved(xe, i);
> +
>  			xe_pat_index_label(label, sizeof(label), i);
> -			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, rsvd);
>  		} else if (xe->info.platform == XE_METEORLAKE) {
>  			xelpg_pat_entry_dump(p, i, pat);
>  		} else if (xe->info.platform == XE_PVC) {
> @@ -764,6 +801,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	if (pta_entry) {
>  		u32 pat = pta_entry->value;
>  
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "Page Table Access:\n");
>  		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
> @@ -771,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	if (tr_pta_entry) {
>  		u32 pat = tr_pta_entry->value;
>  
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "TRTT Page Table Access:\n");
>  		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>  	}
> @@ -778,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	if (xe->pat.pat_ats) {
>  		u32 pat = xe->pat.pat_ats->value;
>  
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "PCIe ATS/PASID:\n");
>  		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57bcf0660eb8..16b937d0e3af 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3699,6 +3699,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  			goto free_bind_ops;
>  		}
>  
> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>  		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>  		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 356b4707dafe..d8dc41851425 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -3,6 +3,7 @@
>  		PLATFORM(PANTHERLAKE)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  14022085890	SUBPLATFORM(BATTLEMAGE, G21)
> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
>  14026633728	PLATFORM(CRESCENTISLAND)
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
>
> -- 
> 2.55.0
