Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDA3E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29A010E1E8;
	Wed, 11 Dec 2024 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxqDjsRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1010E1E8
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733940849; x=1765476849;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9SKnqg1B0q7CMRJQSofTDIYgTK9Ames4iubck/Uhxd4=;
 b=JxqDjsRJppB2tDLVax7yzOZijpPPQ5tWFPERpUCfoKj/s2DeVBog5Imb
 MHbbprPRinQn3H0MLRfHrVqhBiK3DsWKH4OqBwk/5SyM22PkqbdbTI09T
 /SDyLRQMkYXSigBCwmt620hHQfxCA3aI+5a/J6SLYTjWBuVJzRxKuqFn0
 Zm8h3YAy7Re6Ql6wKtglGUOat3XBCvapZ1RsNIWWFgxtuC9AsPuaELdpG
 UIniBu9rGqfYbXeYAXnbGw1NRFn9LP6c7gsQxZMAgE8+UQmcMVlK5Vj7H
 fGFMjS3Pp1LC0ll4oR7+/w7kRQRI/QBrZK5Qn4yz6oo88WRb36i1iJQYm w==;
X-CSE-ConnectionGUID: a49EnNErQbe016VEcM4HwA==
X-CSE-MsgGUID: kHGR77UNQx2LvrST4grmvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45717523"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45717523"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:14:06 -0800
X-CSE-ConnectionGUID: leFY1DqsQAKfX/CkgbKY7w==
X-CSE-MsgGUID: IFIrXkDxTNGnGdBdFdA5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="126727973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:13:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:13:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:13:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG9IlRgY7tf/xUppTrBDW09P9Y05+aY8URaTyJh/kW/zhyGT3kTIzRVkt8G0sID1jKJa0qjA9KoxzJoKaA+9FjdIpHpUOaxwDZzlAUOFtBjEEYevvRh7C3em9RHgdKRUoqdo5JGjKDAD8bpOv06zaT2Pd0vi+pam7AwyPizhLlGarew8myk6yiOsMRnbvPg/qz0HpF5ldDd3IKPdFJLpQcKhqHAsELF2w5/EJZS/k9EB3f75IiYmqZniELd9lSH7O2XykcVDzTZ8x/JPgukQrD8vYuXa7/9mA7wmRgnT2GipMErm4lUxJfr1R9furf2V2wQpjj3t6a2g7UMRnEp3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jJ9Q01zVNZqlHbeyB8Fsc4KwsLedUkcn0VQ84DqhUs=;
 b=eJgL0b5nVIQvJZdkGe7YQG/F8yCL7aDG9rnJdv1FGfca87RnWPIFOnN1O8ilzVf4D3HQTLpckltQW9y2e9S8wIPhArg0gPCgr8ABSGiB5WI9AF/GdZjshgZOZjGKV/ikO4XMSgnsJwirriFV3IoOi7BmTfc9riMeYb+5CEN3rTN26Rt97Ekg4GbwNg6Ek+QVyL+5QXxsQ2+w3iJqhczwAMqc5JwPm1C4Q5ysoegiTspslJ/uiNLhpQ4Q52Cs1Zn5IMh8wiM5oFTcg7IUlW/NovzArFZQ8rChcnwyKaWaxLb44cWNbUCg2xemJ/vqq+izcdgyKFi54VqAhXARZHu36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 11 Dec
 2024 18:13:53 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 18:13:53 +0000
Date: Wed, 11 Dec 2024 13:13:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <piotr.piorkowski@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH] drm/xe: Make irq enabled flag atomic
Message-ID: <Z1nWXdfn_azp1KLK@intel.com>
References: <20241210173506.202150-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210173506.202150-1-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: cfefb9f5-6684-4e63-3b2f-08dd1a0f91dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXlPfbcBT/2iXHYmy/uXEM4fekyj1hFNEsuwLWUBoAupgHh6HlSeJViOXjRE?=
 =?us-ascii?Q?9SizivoK3cYgn6hGyvdpZJB3s9A2WycMlAb7NI9q1LnqKhe8n1BBNvVxiv9A?=
 =?us-ascii?Q?+8MTJ3Y9Lm3DCpHvURD6xKJgrQ8rT9rMnsM7V4rjHTSCgbuAF/arLoy+fnCT?=
 =?us-ascii?Q?c4Ed/UrWJNblQbx5+6VxexaKtQ2PzCzlwHVFeM/1jGISVzjE7dJ44FIsaxM5?=
 =?us-ascii?Q?/PeIvWyepA064bDj/syu/5Pnlrzz9kRYWzznE2gubDTY3yJYgWXOv/B7XmAn?=
 =?us-ascii?Q?HecC8zMCIWcOgJFfxhUDepDJLVmlVwodRlLkJiCPTG3VLAVmFQPLTbFsJuYP?=
 =?us-ascii?Q?IDKt37iL+uYr46Wt45c2v+UmPU+Wn4BfySIVhSpiPWaJnCQTd7hCWH04uUpG?=
 =?us-ascii?Q?nKQy+BkS4yEhKulumPPKNVZMAcJSQnf9jFf/+qgs2LK6dd6W7egkwB4i2TOy?=
 =?us-ascii?Q?Wxzvz2fxrIdefW8b632YTDcqyD1R60Sy2/mxNpThu9VGET+FbPX8Y6Yfgxxy?=
 =?us-ascii?Q?zv5r856SPEQ2TKB/9a+AZCryjEZ3WC01svw9PhOsYAmrWweUjXF8N6jb64+L?=
 =?us-ascii?Q?lgBZX9GEuWIQvMmvHFBH8Ww7VmvgBCUEJPfPe3SgckIi1H5qwKOgQKQYW7ya?=
 =?us-ascii?Q?3iI9f12F3RLTEPoLu57d4PilGdUhfgjG97bjwfFligH5UzgyIIhzhONA131Z?=
 =?us-ascii?Q?UZk3O+HH0bCjPYfo/zx+bPDoETSkrM2wvzF2eBODRNveCCcXU9WSOAidxt6i?=
 =?us-ascii?Q?ieC+qzUtBMfSw0XJQH08uADfl+mHKwl8PCV2AEppiRe+fbccDJjbjcyft+hb?=
 =?us-ascii?Q?oRYNqqKcL6ZShE4EaSJjkJaRpa3MpUQkK5oEXU5nH1ZGQWOFoWRORkfSfKKD?=
 =?us-ascii?Q?QArtB1PG/Qsr/DDUR/8zQSbvKshtXL2IHpWG3P8H4WFjUA11+8vjUTECSVG3?=
 =?us-ascii?Q?uEi05NnbYBMdU35fi8R5ORtGVp3uUiHIY4x6QSTORU0mLhUvkSQ4VZ+srAkj?=
 =?us-ascii?Q?vYgd9VVbTNC4iFgshyD5eEHT4sPDvLs3ShVlb4KN99Sr2Qi2amE4NMArxCCt?=
 =?us-ascii?Q?i4VXeC+EwmcRWzqafqFIlpj5t9/R+Tk4MWK4qE94yM0sGsmiYtRMdF3zUgus?=
 =?us-ascii?Q?VMq35ftcO3InPCVRTsG3eoWMm4rwfjxePwkwWt6ffTDXFrnsA5e4K7zytJ+n?=
 =?us-ascii?Q?+1RXlEsjLW16ZPfUqUeajZOj/PGO7JxTOYJyecYm62x51MtOmI8wkZXMu19P?=
 =?us-ascii?Q?69dmSrNmRu22rqwIz/Zej1P3GgbhD4W+LRabbJygkOJcVphwn03shPNpumJT?=
 =?us-ascii?Q?kWhnGD6DI5ni8aB0TcYCYYpV5ijyAIbljo+MwC4fPzwmKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NWdcRFHBQMBRpCvfemRsERk5GudlbcKkXDpuROF4d/1sBtBFPpRst/vF+z/A?=
 =?us-ascii?Q?ezVepBipkJfd+To+QR6PbbfYJpc3pvQjfXzahANpgLl5YNvS6Ums6banNNR0?=
 =?us-ascii?Q?0yhpHZm4jWBDF0Ri0ReHRsV9V+Evk55iRadc5c2KVE4jCTV8ASNuJPkqWdjI?=
 =?us-ascii?Q?93hbNa8Fu44L6/COBV/mXrCXt+BHIZFAuCSJ8R0S7ZNo0eFOw76C46g3zQJ9?=
 =?us-ascii?Q?Pk7wFf3dCR44jyIDVBrKa4x0ukVtHUmNor02X2/M8bcK82043uDL/p6go1XV?=
 =?us-ascii?Q?z9jjgw2gaasl2gS6gu5Sfrk7RaQhiL/l69Bd9lE/yDDhFnqyNkZlGJflXD7b?=
 =?us-ascii?Q?F5xc+28FOAE4c8X4V5ir0RAANO4tZeiXEx5FUAy4sWg2moSLqPY1bcWRtnHP?=
 =?us-ascii?Q?HXx7fOSa/IEFn7eU6K8GxwZ4qP61AaBupA4jn1DqbwRRba+Ktt1nYmUr3zDL?=
 =?us-ascii?Q?mNqB6pW7mqib6oV7ppk4z/DqakyU2AzvL6CwfImBLZOUD6cvbaQt7R0Xh5JN?=
 =?us-ascii?Q?rRlyOcpTArpJIxElCf2kHyncE8DbpCKLLPFKMkMhnackby4F5Nb9rxpuUqku?=
 =?us-ascii?Q?7Co4GTy6n/j+TMeURrxhjEZJ3UtB3Ctd0QdEAyd14i/6XMNqEH8we6B2ILp/?=
 =?us-ascii?Q?x2mc1t/KwQYXOOnxu1/HqDdmJ2xM7sAWDUvFYFZzX/saG3EXrbYUHnpCam8w?=
 =?us-ascii?Q?uS9Kh1f4ZpqyBY+8IW7/h5PVJwDoe4gSTVLi3hGfj+f373wZyB/Wlm9y7IuO?=
 =?us-ascii?Q?z/sZsG5zE7dgBbzg1iqEsIYL/9HlCCkPI9/KPp+ZH36LrIxuZUIOzv6qJMMK?=
 =?us-ascii?Q?aIqWGVz7nIyT3L9Om2YwWFB9Akh34UcLBEuqmavv5wr/VRZskEet/TVbcZ18?=
 =?us-ascii?Q?+kyO5KmHzz2jYoXP8cOIe5tn5P3Gr3eJRdts/gTIl9lfpSmX5BGbwTmie7BE?=
 =?us-ascii?Q?7XJ/2FpPrNk87h1UvebEVXrfVKcX001P2Rg91ntgMJZpduN5ciayjcpzdXYN?=
 =?us-ascii?Q?9CcTC+0Ku9xO5JMQPHVo5PGkYwxpNcQTfCh+IsxAFqMDkpazVU3OgH+5ISDT?=
 =?us-ascii?Q?DdhxeUO+PvZSZIUqxQY8E6k7mlIMkNF02dKsHaUc0DSzrYi5zEO6beRglzok?=
 =?us-ascii?Q?t6i7FooYlWTkVoverT2KYO9yOM3ms9OJItlHxVrvxfpfpuXFxOYenMxQq7K0?=
 =?us-ascii?Q?GUundI9UZdsej/xEowTqRZIDB3+3je04cEmB99yRVaF5obQ92wCi4jsWYvqN?=
 =?us-ascii?Q?9zKFbxhkbxyLE1RtHbTASNBMGlixOwtse+gwzweSy6LUV9roS9rHDOf1jDAv?=
 =?us-ascii?Q?WdHWLO4Gr5cNUUVnjx1ycMNc9enMrg9rpb+0Pjxw4ZgeF+zDff5Gydnm+dOY?=
 =?us-ascii?Q?y6OAjUM/K0FRjSy1UudiiZzkaThY9pveEHJ1q+HF0slcFcRb2mdAbl6G4jrO?=
 =?us-ascii?Q?M2uKLtuFJKten8SdGXh2H/3DjXIcASIt+IgthGyULjfFvN+oGTLBxoL9/V6b?=
 =?us-ascii?Q?YUAZFnTDHANP/D0RYedlf8HIhbjD1/mmBxA0MzrSfdHHqBa7txDHNmb46TqA?=
 =?us-ascii?Q?+t7lFuppnzQXJKmDUKSAyE+dNHq141rsShmFJ5AbaSHC6n/+DyHXq/MuerL4?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfefb9f5-6684-4e63-3b2f-08dd1a0f91dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:13:53.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXWeZ4WgtqeGSgUAKxZyMmqXq5BvL3K9VrOIgwvnITocjAyV+ZwJoAmbY9JXeei0J/vVGi+W2bFHLS3oNi2eVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
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

On Tue, Dec 10, 2024 at 07:35:06PM +0200, Ilia Levi wrote:
> The irq.enabled flag was protected by a spin lock (irq.lock).
> By making it atomic we no longer need to wait for the spin lock in
> irq handlers. This will become especially useful for MSI-X irq
> handlers to prevent lock contention between different interrupts.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon to drm-xe-next. Thanks for the patch

> ---
>  drivers/gpu/drm/xe/display/ext/i915_irq.c | 13 +---------
>  drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
>  3 files changed, 9 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> index a7dbc6554d69..ac4cda2d81c7 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> @@ -53,18 +53,7 @@ void gen2_irq_init(struct intel_uncore *uncore, struct i915_irq_regs regs,
>  
>  bool intel_irqs_enabled(struct xe_device *xe)
>  {
> -	/*
> -	 * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
> -	 * lock its transitions. Because of that, the irq.enabled sometimes
> -	 * is not read with the irq.lock in place.
> -	 * However, the most critical cases like vblank and page flips are
> -	 * properly using the locks.
> -	 * We cannot take the lock in here or run any kind of assert because
> -	 * of i915 inconsistency.
> -	 * But at this point the xe irq is better protected against races,
> -	 * although the full solution would be protecting the i915 side.
> -	 */
> -	return xe->irq.enabled;
> +	return atomic_read(&xe->irq.enabled);
>  }
>  
>  void intel_synchronize_irq(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1373a222f5a5..ace22e35e769 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -347,7 +347,7 @@ struct xe_device {
>  		spinlock_t lock;
>  
>  		/** @irq.enabled: interrupts enabled on this device */
> -		bool enabled;
> +		atomic_t enabled;
>  	} irq;
>  
>  	/** @ttm: ttm device */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7bf7201529ac..1c509e66694d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -348,12 +348,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  	unsigned long intr_dw[2];
>  	u32 identity[32];
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	master_ctl = xelp_intr_disable(xe);
>  	if (!master_ctl) {
> @@ -417,12 +413,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  
>  	/* TODO: This really shouldn't be copied+pasted */
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	master_tile_ctl = dg1_intr_disable(xe);
>  	if (!master_tile_ctl) {
> @@ -644,12 +636,8 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
>  	struct xe_tile *tile;
>  	unsigned int id;
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	for_each_tile(tile, xe, id)
>  		xe_memirq_handler(&tile->memirq);
> @@ -674,10 +662,9 @@ static void irq_uninstall(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
>  
> -	if (!xe->irq.enabled)
> +	if (!atomic_xchg(&xe->irq.enabled, 0))
>  		return;
>  
> -	xe->irq.enabled = false;
>  	xe_irq_reset(xe);
>  
>  	irq = pci_irq_vector(pdev, 0);
> @@ -724,7 +711,7 @@ int xe_irq_install(struct xe_device *xe)
>  		return err;
>  	}
>  
> -	xe->irq.enabled = true;
> +	atomic_set(&xe->irq.enabled, 1);
>  
>  	xe_irq_postinstall(xe);
>  
> @@ -744,9 +731,7 @@ void xe_irq_suspend(struct xe_device *xe)
>  {
>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>  
> -	spin_lock_irq(&xe->irq.lock);
> -	xe->irq.enabled = false; /* no new irqs */
> -	spin_unlock_irq(&xe->irq.lock);
> +	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
>  
>  	synchronize_irq(irq); /* flush irqs */
>  	xe_irq_reset(xe); /* turn irqs off */
> @@ -762,7 +747,7 @@ void xe_irq_resume(struct xe_device *xe)
>  	 * 1. no irq will arrive before the postinstall
>  	 * 2. display is not yet resumed
>  	 */
> -	xe->irq.enabled = true;
> +	atomic_set(&xe->irq.enabled, 1);
>  	xe_irq_reset(xe);
>  	xe_irq_postinstall(xe); /* turn irqs on */
>  
> -- 
> 2.43.2
> 
