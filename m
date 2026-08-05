Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC7DC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 05:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93810E1A5;
	Wed,  5 Aug 2026 05:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghZVURmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0B910ECBF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 05:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785907528; x=1817443528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wOi4a6+qniMjSqFUDJcv2fiOqtItRIGCc0ayGq+sLkU=;
 b=ghZVURmFw2KTP9wQUMvtrpRIYZ53x28hDjztjfFFh7hdwo/iZlaGTvJD
 GV7Oq83d6iDeOdV5mTxkajaJ0J3IBPg/RabNF3NJ6xMOp7bCoEZLGOsVm
 QSzxiAv5lu7li9a16e4cR+FT2taLzhfZcScf5EjFsh7aNrCzpv7e8sqWl
 Ct/9bg5Ab6jE6yFhlTVS2D1bxP8KOUimacWzzV3qGq4SrbYOuOt+4zQUN
 8LlK0Vg/NARPdnTvLHIkghFGe7Y7jR6bWrdooRLZVA+vcOAvrk+WNobTJ
 tXLrauCkXJiLt3EvmodtfzdkuGTz+lQQVLrViRvIpVas1DTlPYHDSbi7e A==;
X-CSE-ConnectionGUID: Plvi3NIeTgSSOhZyuvBs2g==
X-CSE-MsgGUID: ZoAViWkFQaCDQ/jiCru9Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86330898"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86330898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 22:25:27 -0700
X-CSE-ConnectionGUID: IFyINDJlQBOoGM9RKjAvqQ==
X-CSE-MsgGUID: DEO7+7oQQkSRmP35uBuCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261136949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 22:25:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:25:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 22:25:26 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sso2JPvkN8gk+oMmsgR97UPz6QoVzKdzbpJ7jVwm3MMbSz0jVaTeCm8AgYTS6b9BX7D8115xOFe14PF6iwjeHlxLygeowOwR8oEdgpxPO8nuPn0NG+cTHrx243Rb07dZftfZKw42gk4aNtlk5u/hevKa5wrGa8a+brZI1rUdDxJeutounlk+DGR+NtSnT0iHb4lMI9/Dz0Tr4IZQOszS9ldseSsQfuhgPB2NKNiBeJKU6Uq5uRY5ilAVwyrGYurZfLNmnu6odtaFtO/70X+dM/YUJAt8P+2GNeMII872idgmgbqPZwDUj72xPL4XOHN6RoBfORZJnG+92IgNb/4yEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUUebO0B1YKe2nRLTjc6IzDf18wl64ED/RJmpXj3g50=;
 b=x9wUPbfveA78z94+U4G1yxeAj3muqgBz9Jvo0Oe/LT7+S9sgdKU6UV/Ih1FhQ13euDT7RAANPLU97XJsxO+mcL4crKhXlmjLuzWubVFmZhfJkH0oIczr9HPPRvKE4ox4SheKXvfVieGwK4BQYkbzx/xNV+yvA/Y4O1XewGvtLyJYpOeV/u0qnsX0WIonEmWBEfJhn+r/ExtOO2+/kpBoLU/y/e86J5KQdnJzt2JR5rE9bKWWGxmtnhInSbY2oMoGROJxX7WjeDMprhOwvFmm2Bb4IZy9BLDjtV9Dliy4B7MKozmkOMDEWJdYcOKlbUw+AcNlj6uHIGb09TPGZG9yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 05:25:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Wed, 5 Aug 2026
 05:25:23 +0000
Date: Tue, 4 Aug 2026 22:25:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v9 03/10] drm/xe/gt: Introduce FLR helpers
Message-ID: <anLJQFKYNveJKlpX@gsse-cloud1.jf.intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701083051.450259-4-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f8999b-f82e-4e2b-9f5c-08def2b1f338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 7BbN6thRsQcc3CEzGWCC4IVIcc4WxWBOdnlhf416Zy+QoJ+hhJ5VwM98Y+UFcwMGOlKMSemidWXzrQOgxXuje0gFOwrUWutl1Z/86dDJ4Uzes1NMnTSGDLm7zW6UM7vfoKK0F7Tbz7nLeK2DnZ1l1Ube2MCnTdyTQh633y7IuojwHvqnAiHcCnqrVO2u0Jmoj0W+anptJTdsmf5dkfLFYQptsVYlaypuRSnlxmHV66Z7yiKpmHyi/SvX2tJwTL4M0PoCTPBBs1MEvpdhS0T4MZtqnzJ3qz8wj70DOD9q1L620fdqxAdb/GV4n6P7k8TWDnZkmM7WjCgK7E2cVB1Z+NDo30dTTvBB/XIpBJmoCNh78k83G3gof2np7iEkmmj87cVObhMjnHFwJS1kKvUI8r1XLyHUVeWu6hI1xEGPlwUQierLK5XwI2EDGBzSZqtj6PxthRAWR3rdZWXef8Zvisdq6B5WCtDlO4WpslJfbrT+ImeunQTFXY99N4FUcyIBf6gkEf8R+6t98L0ocBca7WOVpYunK8XSgRd/tKaxpzOq/k96bWges4Tbv/Y1E29W6WlJMhsxsd1ePIkI/p/Rht1BkevW2eG8AW6dN9WcJwoOnmaCt/l2eZV1xlRvgjn/e/vn5nffDsYT8mvXkyeid8uf2lsnugO214STETlA5yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91e0qnXMzv5eueXrUDqGFdnmqHAFmGaicWjCV1P+3Un4iGh9/a00J8C8bo/7?=
 =?us-ascii?Q?1v8hQmysrj9qSGoGM+md7OZHPhBwmn1kqswSk/rRNYqba+p6jCFIjbRSgG1+?=
 =?us-ascii?Q?39TtjiBZ6aSqADNxazkDglBdDpknMmmyH9NtkGS1716fhoPW0/wutE5SdA4Y?=
 =?us-ascii?Q?p+b6G5Pzl6cKSxvfZDSQMZaCrVYSv/1f+53vbJLUJlH56SAojBKjYYlNs+Z+?=
 =?us-ascii?Q?EnJAqO25FTg7tGs+gHiuP7IZJ9wYPp0DQ9ZKGrqscZEjf7bcsUx6Rg+5yAos?=
 =?us-ascii?Q?9RAu2yhG1EyF/5TPnSHKRtPMSah3617+4aVxF70iRgNPkZkuwScTqAHdmClU?=
 =?us-ascii?Q?SZr4K3OqkYK5UQW1A7ipXsdjxvRnfG5m2jCkHIRfDgVXAHE0BiXt4dDirPPB?=
 =?us-ascii?Q?xIRywB6zWtM0cl/lag/IcBbMvzrPHojtbh0bLtxziRgqVsvfWGy1kgg4HIh1?=
 =?us-ascii?Q?b0I6ZSVZf5017i3geFcp+hmJPxN4nUAa0xyGMiGl+5PsbStJf1htPlYmUg8g?=
 =?us-ascii?Q?jrdV6oPbEy9r+LPs9fxaF8YbakdqM5nDbiQEe+ttw2ifIlY2NbDtTR1dl3q+?=
 =?us-ascii?Q?tCayzsG64qvL3C2hBquqXCL7/6/U4VLZ6LQEiqmlA1EBzyk0OEzlEemID8zm?=
 =?us-ascii?Q?1g6SQTjX9WzFCtkdwuTQTJEvHUQx9a20JjN2D1pazU07rCuQ6ACoCzNT4fsc?=
 =?us-ascii?Q?Q+AJlllcrEyXfOExENWgY5b8U6gvzueJpjXFviCCyHmHhW/DLBi0OtvYvuuR?=
 =?us-ascii?Q?4eAsRPall8uzNyzWJRb+O89zQHADqF6ecvx4SoobzfjSC9zYEtZuYyfM3uqW?=
 =?us-ascii?Q?xw5ZWrdOnCW3jT9QS765+KjsgASU265vPfkMrqLrgwF8ps72tJxfqDdSzofG?=
 =?us-ascii?Q?oEr1TxtPPBCPTAumdP7H5wx8ZyuXCPlZkAHmSggPgyaYp2DGIZ2gNlZIzuwP?=
 =?us-ascii?Q?14yOfQ6EMAc9HEzffG3assqOthRzJl4YovfZ81wIoaM70h5d9f8V0pZcSueD?=
 =?us-ascii?Q?EhH5RkHKskT352lryNZsF/Y6KkFb3ETVUm1guCFX/6mBg9jnUS8jAc/JzL2v?=
 =?us-ascii?Q?B4bwk+MJZi3uJhTPhJz5LPtebthvGR5OBNo2gUvQX2GIYMlc2M0zr1BzE7Dk?=
 =?us-ascii?Q?bdVBbcFPlkwGbPNBGKpkyHwKiO4UWSGm67z2Xp1nfFIp5f36RQzmygBw68PM?=
 =?us-ascii?Q?/DZOGqYeCzGtNgJM+b1ovqa+Q710/gg0vSNHWGgV3QZ4MCtTM01UE3+jsPy0?=
 =?us-ascii?Q?9L/g5sTqpYSVMp2APCyz47PypkjfS+BVGHkUADK0LhKsZBZ7WKz9FMYNiDGh?=
 =?us-ascii?Q?wZhvfwsueE0svajyly09+IzNJ4TvnAnFweQNWXRJo2ULPT2oGZMjvrqv5PKI?=
 =?us-ascii?Q?uOAzqQDa0NuUi850TxyWaNcuLJcqO7fWHu7CPMkHBncuajcs0QG9epcTPOaS?=
 =?us-ascii?Q?70OmhvgvEGWX1UxXOFs41VELOVuITtklYlZjOR7noGP/foW5owWgHdW0Ie8k?=
 =?us-ascii?Q?AVAj0PhOCNzef5daQDQjxJ8DvAFH4gEyDBkYTDMqTASPUfHevLF6HtYM7vwb?=
 =?us-ascii?Q?edHntqvLNesSQzgjbHSnmP/1VEZIhxt58MDXj8PpKaB3oVbclBtRuJOVqPS6?=
 =?us-ascii?Q?Vj5Hg/xgfnRx8BWV9lm19JRlvoHct4klrBFV7Mzw+Jv4UCkEDr6euKFhDuWx?=
 =?us-ascii?Q?ZEbjHF7D21H24M94jTVuuU2huHAI27DVGMS0LW6ZF/oL0atOILBRGza2k81A?=
 =?us-ascii?Q?AhHdfmlgaw=3D=3D?=
X-Exchange-RoutingPolicyChecked: o/i2e+d+sf6yfsL7BntMQGsxQhuMD/fE8JMMmMfzfNeTupH4jSv6OBKTDnBqcS9H357c9ES3gr/FDSj28ezPhnk8uNXMl+X4YXHD5O9KNyoV8lCc3uWn/Tn5IPJDh8h+h5LmHYTv0MAWnTYsdPeZkTf2zu9pBxBMDI/9Lh1YtA8xL5//X5lgU/Y+6DPl3SHk8OAPF487zrj86AtjGkLQV9fKwf2bqQp6wW5btJISyXASQwsrHB2vtHHqASgqwOehqqhMZbEVgim1Minf9KLm4D1sg+kGOdk/t0ixc6qibdwhqRu/z7BUJMq0XK7EFXk+HLfr98uD9AiDO9bRUeiPIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f8999b-f82e-4e2b-9f5c-08def2b1f338
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 05:25:23.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nij0zoJu/Atm6X3dmf8z4kXmBXrlvqJlOAwlCxCEy0cuQkHhk2QPsH2Bzmgo+lytiVtlsq5VDSZX7Jj1xKvmyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Wed, Jul 01, 2026 at 01:59:27PM +0530, Raag Jadav wrote:
> In preparation of usecases which require preparing/re-initializing GT and
> all its uCs before/after PCIe FLR, introduce flr_prepare/reinit() helpers.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: Add kernel doc (Matthew Brost)
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> v6: Add IS_DGFX() assert (Daniele)
>     s/flr_done/reinit (Daniele)
> ---
>  drivers/gpu/drm/xe/xe_gsc.c      | 14 +++++++
>  drivers/gpu/drm/xe/xe_gsc.h      |  1 +
>  drivers/gpu/drm/xe/xe_gt.c       | 23 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.h       |  2 +
>  drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h      |  2 +
>  drivers/gpu/drm/xe/xe_huc.c      | 14 +++++++
>  drivers/gpu/drm/xe/xe_huc.h      |  1 +
>  drivers/gpu/drm/xe/xe_uc.c       | 72 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h       |  2 +
>  drivers/gpu/drm/xe/xe_uc_types.h | 14 +++++++
>  11 files changed, 174 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index aab59dc647fb..7d5700624e46 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -549,6 +549,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>  		flush_work(&gsc->work);
>  }
>  
> +/**
> + * xe_gsc_reinit() - Re-initialize GSC after FLR
> + * @gsc: The GSC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gsc_reinit(struct xe_gsc *gsc)
> +{
> +	if (!xe_uc_fw_is_loadable(&gsc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&gsc->fw);
> +}
> +
>  void xe_gsc_stop_prepare(struct xe_gsc *gsc)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index b8b8e0810ad9..ce390bffb163 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -15,6 +15,7 @@ struct xe_hw_engine;
>  
>  int xe_gsc_init(struct xe_gsc *gsc);
>  int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
> +int xe_gsc_reinit(struct xe_gsc *gsc);
>  void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>  void xe_gsc_stop_prepare(struct xe_gsc *gsc);
>  void xe_gsc_load_start(struct xe_gsc *gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..acc28389b0d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -908,6 +908,29 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_flr_prepare() - Prepare GT for FLR
> + * @gt: the GT object
> + *
> + * Prepare all GT uCs for FLR.
> + */
> +void xe_gt_flr_prepare(struct xe_gt *gt)
> +{
> +	xe_gt_sanitize(gt);
> +	xe_uc_flr_prepare(&gt->uc);
> +}
> +
> +/**
> + * xe_gt_reinit() - Re-initialize GT after FLR
> + * @gt: the GT object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_reinit(struct xe_gt *gt)
> +{
> +	return xe_uc_reinit(&gt->uc);
> +}
> +
>  static void gt_reset_worker(struct work_struct *w)
>  {
>  	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..488009b9b938 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -45,8 +45,10 @@ static inline bool xe_fault_inject_gt_reset(void)
>  }
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +void xe_gt_flr_prepare(struct xe_gt *gt);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
> +int xe_gt_reinit(struct xe_gt *gt);
>  void xe_gt_mmio_init(struct xe_gt *gt);
>  void xe_gt_declare_wedged(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..0647c53a63d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1689,6 +1689,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	xe_guc_submit_disable(guc);
>  }
>  
> +/**
> + * xe_guc_flr_prepare() - Prepare GuC for FLR
> + * @guc: The GuC object
> + *
> + * Stop GuC submission and tear down exec queues.
> + */
> +void xe_guc_flr_prepare(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return;
> +
> +	xe_guc_submit_stop(guc);
> +	xe_guc_submit_pause_abort(guc);
> +}
> +
> +/**
> + * xe_guc_reinit() - Re-initialize GuC after FLR
> + * @guc: The GuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_reinit(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&guc->fw);
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 02514914f404..0eea9277439a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -32,10 +32,12 @@
>  struct drm_printer;
>  
>  void xe_guc_comm_init_early(struct xe_guc *guc);
> +void xe_guc_flr_prepare(struct xe_guc *guc);
>  int xe_guc_init_noalloc(struct xe_guc *guc);
>  int xe_guc_init(struct xe_guc *guc);
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc);
>  int xe_guc_post_load_init(struct xe_guc *guc);
> +int xe_guc_reinit(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 57afe21444b1..c73e1acbd091 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
>  	xe_uc_fw_sanitize(&huc->fw);
>  }
>  
> +/**
> + * xe_huc_reinit() - Re-initialize HuC after FLR
> + * @huc: The HuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_huc_reinit(struct xe_huc *huc)
> +{
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&huc->fw);
> +}
> +
>  void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = huc_to_gt(huc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index fa1c45e70443..cb1a770b4a9c 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -19,6 +19,7 @@ enum xe_huc_auth_types {
>  
>  int xe_huc_init(struct xe_huc *huc);
>  int xe_huc_init_post_hwconfig(struct xe_huc *huc);
> +int xe_huc_reinit(struct xe_huc *huc);
>  int xe_huc_upload(struct xe_huc *huc);
>  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
>  bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 75091bde0d50..a9b2442494ec 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc_pc.h"
>  #include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
>  #include "xe_wopcm.h"
> @@ -275,6 +276,77 @@ static void uc_reset_wait(struct xe_uc *uc)
>  		goto again;
>  }
>  
> +static void uc_flr_prepare(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc = flr->uc;
> +
> +	xe_assert(uc_to_xe(uc), xe_device_wedged(uc_to_xe(uc)));
> +
> +	xe_uc_reset_prepare(uc);
> +	xe_guc_flr_prepare(&uc->guc);
> +}
> +
> +static void uc_flr_sanitize(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc = flr->uc;
> +
> +	/* TODO: Sanitize GSC firmware */
> +	xe_assert(uc_to_xe(uc), IS_DGFX(uc_to_xe(uc)));
> +
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);
> +}
> +
> +/**
> + * xe_uc_flr_prepare() - Prepare uCs for FLR
> + * @uc: The uC object
> + *
> + * Tear down pending work and stop all uCs.
> + */
> +void xe_uc_flr_prepare(struct xe_uc *uc)
> +{
> +	struct xe_uc_flr flr = { .uc = uc };
> +	struct xe_gt *gt = uc_to_gt(uc);
> +
> +	/*
> +	 * We'll be tearing down exec queues which signals all fences and frees the
> +	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
> +	 * the scheduler while jobs are still in-flight.
> +	 */
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +}
> +
> +/**
> + * xe_uc_reinit() - Re-initialize uCs after FLR
> + * @uc: The uC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_reinit(struct xe_uc *uc)
> +{
> +	int ret;
> +
> +	ret = xe_guc_reinit(&uc->guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_huc_reinit(&uc->huc);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gsc_reinit(&uc->gsc);
> +}
> +
>  void xe_uc_suspend_prepare(struct xe_uc *uc)
>  {
>  	xe_gsc_wait_for_worker_completion(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 255a54a8f876..e06f7937111f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -8,10 +8,12 @@
>  
>  struct xe_uc;
>  
> +void xe_uc_flr_prepare(struct xe_uc *uc);
>  int xe_uc_init_noalloc(struct xe_uc *uc);
>  int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
> +int xe_uc_reinit(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_runtime_suspend(struct xe_uc *uc);
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 1708379dc834..2b47382f7b3b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -25,4 +25,18 @@ struct xe_uc {
>  	struct xe_wopcm wopcm;
>  };
>  
> +/**
> + * struct xe_uc_flr - uC FLR teardown
> + */
> +struct xe_uc_flr {
> +	/** @uc: uC to schedule FLR worker on */
> +	struct xe_uc *uc;
> +
> +	/**
> +	 * @work: worker for FLR teardown to be done async allowing to safely
> +	 * flush all code paths
> +	 */
> +	struct work_struct work;
> +};
> +
>  #endif
> -- 
> 2.43.0
> 
