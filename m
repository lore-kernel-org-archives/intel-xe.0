Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43900D2AB3F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 13:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41DE10E138;
	Tue, 29 Oct 2024 13:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYsfkmTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33310E138
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730208662; x=1761744662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nLCtQzGcgJd0Qu9VPwi+kjuL9sLHVn0vixaucTJRc9o=;
 b=OYsfkmTiy9ZZr/OQ/1DiqKekI2+3pDnVcMYYjynSR4VXDlpuip1s4rkD
 1cQ5EZPSulwmQQ6cx44DcLYtDV0UNh2h+mUmRlRCe/M143TWrS9gnK/Pz
 Z5QtY94JoujcynHOBBUbmeCVC08+cwB65jekb5h9Q9xM5NrMgmATL5vUE
 5oVhB99ec7/KSCAcOASRrUd4x0M5IX+pnYaeBlFBiEY9dKGN7Hz+nj/HI
 0m9NdA/LuOdXh6x+a1u2i09borzTXtKvOWsD/eZdl7f/2PF3o04nJ1smR
 3WqTf6fzrHl79Stx6wkDw7nz3Nxvmvj4WPUxg/PN5ETwuC2OW0Yjv4Bi5 g==;
X-CSE-ConnectionGUID: z3J04u1sQiKldJRGX10tiQ==
X-CSE-MsgGUID: 2P/jrA95RWe+tw5tZeYsXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40464072"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="40464072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 06:31:02 -0700
X-CSE-ConnectionGUID: /9nsEZd/QhmW8kVPn3UpWA==
X-CSE-MsgGUID: 8ZeDD5z9Q6SYEmpl4RenTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81869340"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 06:31:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 06:31:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 06:31:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 06:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg8FVGlSyOqpH4bJW5E3mWcBq3f7Ymi+E/DiuQVVM20KKOxM8W+cBLnWqdShFNpDzt3Mdpj+Uvty6//7Uvvae/xcWVHc2KDRiBttqOgjeFBqqiIXP2PXzcOr6TOjO9dosfINjoXI0rRgxT+hNv5aVIbxhKEM0O8nR2/yID1ifSnX0+R5tGMWkbRlBxyT6dDZMaWKTlkCa8MAnPC+CvOJTdYth8aq3wqgn/K+qzC+jK/RHmww9No015LYf8A0QuaNeUBM/tUWg0S057j+44yPvthYxva9N1kONk6IW5pwmZ6B1x+ewRUU9tpfKIg/ILWM3leu3eNhDH4qt27n3lA8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT8RqDGIv6D5h1y0dpkYoJr55hNetGiXL6IVIuClCxk=;
 b=R2flieyb4qSTE/EhAXPdXKK9E+eIH2KUw74wXLkJglZtz/gv6fsE6qqSH2Er93l9nl0zvlYpVd7biV5/Z+UA6Q3JCE01hfQglDcVVSDdWKZSRYswRDkwlRMOzQ2ONUq/BQfT2ugTTZCaWkPiuX5Ft3xafbTJbhWyzrlfcOjLu4rHuVKB/kJQDSWPltacfG1y3Nih7AMAvtTFy7jQXoR2yw5sM7zVURLMv0NtsPGxa4/EDbqplXk9q2E+kPhrJwpVUohqooOx/TKiMYz7/O3VMJNrFyOpXA9KU969etOprFAyrIdAoKkDE1hacMnr+gTse5u3xQPtgnWNEZuq9ANk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 13:30:55 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 13:30:55 +0000
Date: Tue, 29 Oct 2024 09:30:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
Message-ID: <ZyDjiuhhGqSPLEl_@intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029003224.2257439-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::14) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dfaeca-d0b9-4787-9c51-08dcf81dea72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eBYzItFL725ZoPNw61CMv3DPmGymz6fqUEiRbmtM0HFSNBK0IJgfwoDxmI6c?=
 =?us-ascii?Q?+X+4oe/Ed5QKeKOo1AfimPcHgQPyURZH5QU6iedOPIlU2MqYdoXYEAfzEZBw?=
 =?us-ascii?Q?vWvSnI6GcQVXBUGZpPgoeH3gtqcqRjyADlOVDlVYukSLs9/Q+T6x4Onh/Ap/?=
 =?us-ascii?Q?wT6OKc/1CeMr7LBF4KL5WzyL5J0ERGJfjZjLV7Qxa1K4s8dsYhz3GIaQ9/Za?=
 =?us-ascii?Q?cpMVZ3KpQt+0NCOXyd73+MDwF91FSv8RMShn/JsZ84Tv6dIXWC+48KIHKTJ9?=
 =?us-ascii?Q?n4eAk1JmpIlj1xagNQejKdhKa4+v93qOzzWMjssiF7MnCGPXclCbSbjwbydV?=
 =?us-ascii?Q?Su4wQwDq6hWbMtLiKWjqIYVkxVOJcRT4yusOOSlBzbwrkxrWt/cm2ALyjNYE?=
 =?us-ascii?Q?ZIYLMd9IhrkYQM52mCqbJMxcQhwRimnHmXFfR6zG6TabKhTUyvF3t6KCi1MH?=
 =?us-ascii?Q?9wxlNmHifdofxSUAeEaZj+mmU5VLpueb1n4BovmpJYR+3KN9vI5NaSDadtVz?=
 =?us-ascii?Q?CYvQOWh8vxE6Rbvd90AbI/bhDkdZVW2L0jlE1jRhUnd9rmwQmWWi/HMZ8kab?=
 =?us-ascii?Q?D2si+A5VkwDlvWFERCA6z/Ets7SP1gIPxXylnDvfwl5JPSLxZ9cKVBHB3svF?=
 =?us-ascii?Q?F5Q9KSTN7lT8dVSRCow4eMkJpzZI4Fq2H8IApZ18wdFOInvRlenOsUVBefVm?=
 =?us-ascii?Q?792wVCtPBjr8XH1mg7aEIGmosKW5moBRUIfaxirpVNYxMHTkSNA976UQLYkZ?=
 =?us-ascii?Q?E1wDNjiuhFZKHuF7t+toI/aFx+MQX7JrgLlC+z5i3IXAOW9L93Zuq/FZ0sw0?=
 =?us-ascii?Q?bW69p5fvIVlAjpw5+GPppgcSxmjhLCp129bcRObLB1Ao4AHh3tstSEg5dV9i?=
 =?us-ascii?Q?4XbaAE8+43eduGgSmp1C+a4KmirGTjPKFK18PGG1ne0KVRemvQiIgLzwUzSg?=
 =?us-ascii?Q?qgqgIrmTMPj9ECYmvA3dWGEUEIWqg8zz/dA2IBuYvwL44bwx6QXEXWz9bjWl?=
 =?us-ascii?Q?JX+fW5V3cRMAuU5R+2MMHrxeIsutkzZPWn5ZEMkfvz9eGaD+mXySf6Gtc5/M?=
 =?us-ascii?Q?/9lgXtnjQPwv/fck1WQXqEsd5ZFs+UJCA4kR0oTXskdCH3qh3vrDeNIb9R4N?=
 =?us-ascii?Q?P4Oq+NbDwEEF21mlzvizJBQ2RgsW989gekqiPhy8Wc90DNp6itHOJhWgbTSi?=
 =?us-ascii?Q?TdP48PNOHaQBqVWLO8ry6zBL/d4Y/iIHT9rSY8C82kURsPKkW/W+Mqd9GZAj?=
 =?us-ascii?Q?VxK1jrp8gDXKrHrbbRGPZKObMZJ7sHhRUnQMrTmudka6ZInHY5OaT8dAVkk9?=
 =?us-ascii?Q?xX16gilaG7widw4k1WVQXe+2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZtTAipcrFMXjB/nfbzslqC+qLQi2f/pTS+d0LQLZ36VJXtijk9J5rK3BguK?=
 =?us-ascii?Q?B7y5FwReWXilLRfL4XtAYCXzK7M0p3x+7OztiPNKnXd3QN/nFWMlUBJLf72x?=
 =?us-ascii?Q?lTfQXL3Bbn+6PzscCFKHcYa0X0VjU9Vk3jYhnbnXScObSqg/N6RLk7NNSNme?=
 =?us-ascii?Q?N2vqDtk6YRUDvChCUVVODJoCgepWVdWRcgtVeV/5dRuher0cbdwX++1oQLqq?=
 =?us-ascii?Q?OS96S0Fm9CRfsXh+mcPyF+xIcOkoytpDDlY04EEDHZffHOstuXgJPaqfVp3k?=
 =?us-ascii?Q?9dRbxpQmGNPLTrm4po6OwucxHi25HIU8Ddbvcy2C+xZfkjlMbKua+3/ve/GG?=
 =?us-ascii?Q?Q+dBuzz1lIAJn/4BdiLAioBQqZa4FrE4kIF2pfV6osXNJyzoF4+1Dj6YGwBp?=
 =?us-ascii?Q?7vmmszjZ+dphqkcncNZQjM7VH+1UMSDreDmWFnGR7WnPXPN7aTIAxUSAH21B?=
 =?us-ascii?Q?6gsjTAy2O/YEb3YXH0KMu7KDOSkK11tEFHXUtzXpiR9Ris4cVnh1Xx+wWTwE?=
 =?us-ascii?Q?xiKs5O/BiI1APPti4d+5VhhI1SULsoVbbkjxbJpss66/Yg1iJiPVH30aSvZG?=
 =?us-ascii?Q?RmiQmRM9YiyjDN5T8Wr6hq8ddXa+C/wYTR6VvsQMTVUWBSoigBB/skCbTpEd?=
 =?us-ascii?Q?pB2hTIPvdseNHRoGrbMGV5Kb3ZA/23Nfp8t/b0yjCrg56pi4ouqOVSaDIFvY?=
 =?us-ascii?Q?YiZeZbAjLePjJryzpRG99xIhJccESMOpX3c7ieC54YaDR5iTn5eB66wQk+Ab?=
 =?us-ascii?Q?UNxp6QUMYUAA6xTPTV8o9smLOlFcBOcoXwhPWq2b76fntQZ8s0E7NGVMYMJk?=
 =?us-ascii?Q?bisAZ1NGHWHlqcnte3pPiwrbWNNPJoh/0DU3smjkDRnUiDKc/iASxlsMfUc/?=
 =?us-ascii?Q?RSxH8c48AMqaSMgc44yrz+lKRfO6EG6rZGk5/HLGDGH1Y+ecGc52lPsOmcPw?=
 =?us-ascii?Q?T90KCxDrBC71CFAAMSy107mer1cuFxnm3lgE02OvWWJUSdxbk8coyyx+Zsua?=
 =?us-ascii?Q?pF5HPB8BkLj9/OLCmmVhlTnsQfY5MeOM9+fRk0fcXY92ygTJfjbypb3Bxy3t?=
 =?us-ascii?Q?v3Yj/wlZORWaxCB78CECN3PyZWGmZc4CuPdGGo6gLdoo2HgKHg25ReSlluxf?=
 =?us-ascii?Q?vqPvF/evRj6AtT8BqzDrLzk7xWZ01dto1ed3rwBINpFreDuyA9ES+kddr/Rg?=
 =?us-ascii?Q?o+UMcIuNGtb0EGLxDWhfJkA8FYYsAApyffCFS/pkFWO7TLWRGdSYS2bsDSDq?=
 =?us-ascii?Q?v4aR4iMWaUeokreIlYMPox7fYTK7GcUtgdZ8TQbfhWmUu887MVXzDQeDj7BJ?=
 =?us-ascii?Q?HCS/OusdNpENAVKdW1Fl73sLGe+MR8WO9J4lfcGV8UT/FvlyP7+tV7XrAk3v?=
 =?us-ascii?Q?m5rGlaGBvdd9i7QC35gN2zaC5oSufkUuULaavmt6nkKqYQMczpH9r5aGz/+Y?=
 =?us-ascii?Q?Vfccmy84ohw8C8TjamfvuKLzNELsBaowkzLIws7KaC546O5CURaZV9DMsfV+?=
 =?us-ascii?Q?W85CV03/te+3K1pMYqXi5lOP9ZDRUpNltPpitV/kXED/HO2SWW8Xz3HKgfBQ?=
 =?us-ascii?Q?2vS+boPxTXr3jmJ7YNfQl3EkNdVLxDLXNwimAuGhX5hisVJbrb75AnJ3lD67?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dfaeca-d0b9-4787-9c51-08dcf81dea72
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:30:55.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR9yt7bAW4inP5SHQQ6hItPccY1QdyrEEdi0bcXedjauoIvALegJucxvuvap80hshkHEHM/AKkYDg86U1DOggg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
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

On Mon, Oct 28, 2024 at 05:32:22PM -0700, Matthew Brost wrote:
> Not all BOs need to restored on resume / d3cold exit, add
> XE_BO_FLAG_PINNED_WONTNEED which skips restoring of BOs rather just
> allocates VRAM for the BO. This should slighly speedup resume / d3cold
> exit flows.
> 
> Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as WONTNEED.

What about s/WONTNEED/NORESTORE ?

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      | 24 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_bo.h      |  1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c  |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_pc.c  |  3 ++-
>  drivers/gpu/drm/xe/xe_sa.c      |  3 ++-
>  7 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5b232f2951b1..bd747e53eb9b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -771,7 +771,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		xe_pm_runtime_get_noresume(xe);
>  	}
>  
> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> +	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> +		ttm_bo_move_null(&bo->ttm, new_mem);
> +	} else if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>  		/*
>  		 * Kernel memory that is pinned should only be moved on suspend
>  		 * / resume, some of the pinned memory is required for the
> @@ -891,6 +893,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  	if (WARN_ON(!xe_bo_is_vram(bo)))
>  		return -EINVAL;
>  
> +	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> +		ttm_bo_move_null(&bo->ttm, NULL);
> +		return 0;
> +	}
> +
>  	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
>  	if (ret)
>  		return ret;
> @@ -943,14 +950,16 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  
>  	xe_bo_assert_held(bo);
>  
> -	if (WARN_ON(!bo->ttm.resource))
> -		return -EINVAL;
> -
>  	if (WARN_ON(!xe_bo_is_pinned(bo)))
>  		return -EINVAL;
>  
> -	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> -		return -EINVAL;
> +	if (!(bo->flags & XE_BO_FLAG_PINNED_WONTNEED)) {
> +		if (WARN_ON(!bo->ttm.resource))
> +			return -EINVAL;
> +
> +		if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> +			return -EINVAL;
> +	}
>  
>  	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
>  	if (ret)
> @@ -1692,7 +1701,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
>  	struct xe_bo *bo;
>  	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
>  
> -	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
> +	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
> +				      XE_BO_FLAG_PINNED_WONTNEED);
>  
>  	xe_assert(xe, IS_DGFX(xe));
>  	xe_assert(xe, !(*src)->vmap.is_iomem);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7fa44a0138b0..854ab8624d7a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,6 +39,7 @@
>  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
>  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> +#define XE_BO_FLAG_PINNED_WONTNEED	BIT(18)
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 4e746ae98888..506b26ea7b74 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -418,7 +418,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_WONTNEED);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 1b5d8fb1033a..61641329fa95 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -237,7 +237,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_WONTNEED);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index fead96216243..2a4886f25835 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -261,7 +261,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_WONTNEED);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e8b9faeaef64..751c38c41f26 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1086,7 +1086,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_WONTNEED);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index e055bed7ae55..a31b085d2d9b 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_WONTNEED);
>  	if (IS_ERR(bo)) {
>  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
>  			PTR_ERR(bo));
> -- 
> 2.34.1
> 
