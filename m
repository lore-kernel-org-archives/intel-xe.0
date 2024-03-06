Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB1CC54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 20:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0711353F;
	Wed,  6 Mar 2024 20:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTbH8+cJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D782511353F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 20:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709758431; x=1741294431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TQ4FdkmQFR1ZFLq7EsW0P4DtAQSnqQhpTYRp3ZwOKa8=;
 b=QTbH8+cJkeezhs80u3VhMBc7N4Pwg/Bd1Jo/RM0Kny8SHebwQu2frgK+
 gIdLtfZW9gYKuo+j+tGRQZa17RKwCUaeRvWrzbPbEAtW9K4JkzEBfTdbJ
 fisgG1D1cwIqxeFm1T5P9aNn8pxuLjAFEbd9urbACAngU7CxbBtqYrgch
 /oI+7nSAdyYSvT7RRAacJnSNDlA9727Zwig72zE3wEGnd8pYOmjRX03t2
 EZg7KTilzMG6XXgxTLm3REByymTm6qQJfW+1nVvVrvur/qx9qSzYIi9YC
 GKbcgSn9ukS3kiMOabCTi/lKE7FZbk+tJSAA/lO/iHvk7Hkd+ZSzPQSrU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21848167"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21848167"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 12:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="33022981"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 12:53:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 12:53:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 12:53:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 12:53:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYFWWKffOO5fX75c4rJ8K4Hpyx3DpZjnCSU3Gk4GUPgMEWrzebkES+GMsSJminG6NXpNmXc3Wf7jsFpbWtWY7TxZ28sjRpk2/y26EtpwF5xiv2HxAy/EM1O5PWfT2Sr87s+rfOcF8ypxlAKpBAFdziLe4h5rBxiQcBeStZikessIkv3sQKNiUFRb6KMvAnUa3nVHEbUxL5ILFHVLF1xkLsVU6WUzMT8TeomC/z8SWxcDOrA46ZSGeNQALk2ZHKSH1qNHp2GWL8UW4XHssyZjZv0wwoZMlHNnWa8Kl3vVoLcrESXA1GozZIkaaodsT3nGHsX7WOxcdhiG6My4qjtzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5G/wZGcBzLdzOg8Dvcpb4gWFQ6o/cBDH4mK4hOljCc=;
 b=E95kDn0PdltshB8FKEZ5p83eiXPIXzDCz2Oy7mHy8hsIno9OuRDi59l0DogI2bvyFos4AN+7ZCDFZOGG5RCycS5DrolldE1R4VNqjBsURM3oN1rfxMqodJFlJmqyOWayMDw01fgs8uUxMbC58jKcjhX5No6GqZ5kWwaXhAkC5XYn4Vh1Nm91Y2NlNXFT2Y21F1x/hDreNrXcwU2HAyO8LN4JVSN30R6LBO/M0pbI52xUzKrVF7j5tSNY3+B1L0KWG6sCriMHSj5OtTBCHTB2Zx8xK7qyd2ghmB3HWO9t/ndTj0BIsEbjh4f8JCGXCiuEvAYSGNJFL/D60eAtPvTobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 20:53:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 20:53:44 +0000
Date: Wed, 6 Mar 2024 12:53:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Return immediately on tile_init failure
Message-ID: <20240306205341.GA718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306203110.146387-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306203110.146387-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 672700cc-9508-4f84-3c59-08dc3e1f82d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFJh1p16JRozio4wMgSY9bAhhzO2LfqkqLy6UaqXblwHJdTZN4hBdF/zRd2g0iKd8BcIDaKPRlxaYIxypD3IYGld1MAzQJzGdxFYUVLv+Xs67F01FcllI8eqcCbMK//Qd/4AH/FCp9Unn0GAqibXmp59t9YRF0LrSubaibapPDsXt5xKLxDfMf7JDE1PEm/E8fmdKDZp+eMqEcVV7ovmwMQA3FshPtsOKSkFAE0zXGDAMsYzbYraQYjaYz0XbNa+oj0i39u1j3dEpS93l7VvUDj4sXwot+4YZdr92gkgNEo6YKdrCIF1WcjIX7m7xuWFR/rQnv4EfxfNZr18+1tSchXJjPElhi0G8jC5pZV2/yiVNB47BUMravfyxEHT/rKONqtkJ8aaiKizStEQAyAa2+WaN9wY0XaEkRR/NZLMSaSHNV4Vqxq9Ad+fxX4M0y9m9EEh76ti1QEy0qwlVsJX/XFUQNeNwadrNXalOcR9kNpxRWMP+I0W2U7UTqUZ2a5fe5LN8fSzmsy7g8QJQM/KlsYl0RXih+mUhorfCB+0Lb6oY9nozvqNYnZRW3679yEx2/u8/2NK8hCkwcG771MdHXADQ8Gr1CZpI2fzQs78pu2xYDFSB/tWswm3evRTWF5wq4KV3EHGzkGTvUTmCh+RIsLJ2JwqUKNFJrMPTrlQiEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lslMGN4FRymVDMaZD0DqYg8FRbCBoUDthpdaXKuYMEUTc6KMMCPz0JDKzhvX?=
 =?us-ascii?Q?Go2YokB9lBHj4Jm2AWqG6QG62RR4Jsj74crfRhZ11Xn/pvxQPM8XOZVg+tGH?=
 =?us-ascii?Q?mGRZE+kF7OA3JW/BUhtyWpVW7xgIiwawbYRbt6nCTiC/eh3M9kN5m30mLORx?=
 =?us-ascii?Q?ul6PodpH3HDD67kMZ8jb48Y2p2nMNYZEWmiuVNSUORtWerC1XMJbxOWFqP7j?=
 =?us-ascii?Q?5IMmEWotTert4fsnSJyvZg9XHi0e3hNvJ4oT0EwOF7lIjbkSBW+S9FcAiJAH?=
 =?us-ascii?Q?Cwka4KwlzQqCiG2zgRbwk2OfkoPPkBKiu68WNLrdKhRucvkNA9W2i21jn4k8?=
 =?us-ascii?Q?A1dmDqQcWToeJypz0TID7RzmnIM+i9Y/7TxtxVynt55+WcnBVWYCs8j0puf9?=
 =?us-ascii?Q?KtkTR50HoA4luKWiRIxEgGGTnh9G8nki/gQqb811FK0Xeah9zMXYL5+lZm3C?=
 =?us-ascii?Q?qRY1dOczuDsvZ2MAAoxaZ1p7zjbUANdC8Tz8CCE41fvlLpCXKYcSIo9jAfMj?=
 =?us-ascii?Q?NyL0CaamUjQ7hNyuCPBOkIKT7amIYIA/h3qHysDMh9GUUYnQ84PhZufjdDnV?=
 =?us-ascii?Q?Omhv5Br+WsblWC2EhQ5pqtz50+DK3StBECwtvmfsnEuZD1Dk1DfNwmQYHG2C?=
 =?us-ascii?Q?YR6N5ZUZg11OcnrZSfnF5lOyfLO5QbBvEs7t6DUdT06Ote6qcdYbSYOPJyNi?=
 =?us-ascii?Q?CvsJBWuHc3timdP5a6UogZtGb6az/dQbngvGwejCyWryPkNA1XCAgQclbxWj?=
 =?us-ascii?Q?iMcyany9zM051PkJbkjLM6Ba27kdNggQ9ZyZm2z8DGN4M02ZPC+324swg8Tp?=
 =?us-ascii?Q?YbWBif52YY8WZW6qh1BxGDKJEoC7lLxQltvjCd3h6pO6hLOuTmAoDpST861p?=
 =?us-ascii?Q?/8ngs2FE1Mfh+rx5jfYQudBqUNwTtr2i9fuGfRw5b4iwof4dNDTC0hXEXBmW?=
 =?us-ascii?Q?8XWMZ+9u5IPUgCplwyY3D/HabgLGMlfMqiF399+sQCRGCg4Kc579vfx/xvJt?=
 =?us-ascii?Q?0XEhDnFcuChccLyDApB4OtB4pIuqSWNPP5rfY+Q6TY/QeFwuAxM6AAxL21k4?=
 =?us-ascii?Q?u7GgcHsfwh+uYjlHBudaT3p8lSpZfyGKx5w8XfuNWu/BeJLJJybg+E/Li8PW?=
 =?us-ascii?Q?2oiKRYaPwUavhBBgXfQlhRsmefkoTwCwkmUy7FhLN5/yh+34p9QYRsJWF6eI?=
 =?us-ascii?Q?v9I4FW83jIWWYBpqPgfj8CAYobSzq5Sru0rqlio8CCn4R0gF4OsfEJMCEpUh?=
 =?us-ascii?Q?sEZxKmZMCFUc0e//Ru1Oy9a2Nv3y46m9NhTSjXtez3I2K/gHlZtZR2Q1ABol?=
 =?us-ascii?Q?Nh8WxGcMzN84qrHHqJlovCd6yegvOokwO+tWyhdEpkcr3fNKSF2d1RcmpHk4?=
 =?us-ascii?Q?z+Qbz3X0vEESJSXeBxfA64yp6iZyyg4MIzgjbJQSrwLl/apvBwMkVr9qdW0K?=
 =?us-ascii?Q?dTMpDEEijmKQOOQTIddayp39eFBQPFEY93HtiVRXpS+xMm9myoA5XWbiPioC?=
 =?us-ascii?Q?wp4bvN6ocUHS2jnN/qpTvPh33MJBNFCnnXfaO/M5HJpqE3EmTo17blgYr793?=
 =?us-ascii?Q?U6aYQ0qwFXVxdfJOiVSkmVXQCb6zBuYjKfSUNKIkBujiCBWEagvAdiqFhfz6?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 672700cc-9508-4f84-3c59-08dc3e1f82d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:53:44.1286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmgF7f03hYh0M/p6nwSYoglbMRK2XG8RL3TuTjyBVB4PF1aYmpaJVDgYJIoLQ9ETeI90rHGq978juWBbHv98fLOLRMJOvuPi6jTc92tpVlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
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

On Wed, Mar 06, 2024 at 03:31:10PM -0500, Rodrigo Vivi wrote:
> There's no reason to proceed with applying workaround and initing
> sysfs if we are going to abort the probe upon failure.
> 
> Fixes: 876611c2b756 ("drm/xe: Memory allocations are tile-based, not GT-based")

Should this actually be

Fixes: e5a845fd8fa4 ("drm/xe: Add sysfs entry for tile")

instead?  The commit you cited here was already returning immediately as
expected, but the sysfs commit started adding additional steps in the
middle.

Anyway,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 044c20881de7..0650b2fa75ef 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -167,9 +167,10 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  		goto err_mem_access;
>  
>  	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
> -	if (IS_ERR(tile->mem.kernel_bb_pool))
> +	if (IS_ERR(tile->mem.kernel_bb_pool)) {
>  		err = PTR_ERR(tile->mem.kernel_bb_pool);
> -
> +		goto err_mem_access;
> +	}
>  	xe_wa_apply_tile_workarounds(tile);
>  
>  	xe_tile_sysfs_init(tile);
> -- 
> 2.43.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
