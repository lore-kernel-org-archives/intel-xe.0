Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A7CC6B2B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446CF10EFA7;
	Thu,  2 Apr 2026 08:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiJGDjhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB4710EFA7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775117911; x=1806653911;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vQDttKbCpGHgjUsCPr1EY0+2SnEX9Ssd0pUIGK4MqaA=;
 b=UiJGDjhWJLhR0tj/DFmz6aSHWJacrnsteu+Hi0/9y6OWIP7zCWnLuTO3
 /6HFksBJ3ytXFJko5fr/Bg528vaTs2xMPJkyPCCuLJrQWCuufaBTMfHm5
 2W/XwtUKV4QvvSi9guqt/bgCKMvg9cwxXMYuvTw5xU8C/tY4bDsPshIEa
 fPEDpDlopunlIO/PUnifc5dmTnFCZQHXUTLAGbdSToXgdZJEMR1yhqFaz
 nLWU6UflGrGkaG6JSrjSWND0nQt/WIupcgNNLJoBdIWOLruZy+G18lvtl
 zs4uRVppWytEPUTJiBnntHxiBoYk/FaWsoordwHPjZb7vohpBuTisIIOu w==;
X-CSE-ConnectionGUID: uM2e4po8QsuleFHKER0GnQ==
X-CSE-MsgGUID: dE/j2fc/Sgacx3jeap4TRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63721589"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="63721589"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:18:31 -0700
X-CSE-ConnectionGUID: ptn3dqkNRCWz1EfYtA35TA==
X-CSE-MsgGUID: GBJ71s55QOmjzJYb+fYZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="228530016"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.32])
 ([10.245.245.32])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:18:29 -0700
Message-ID: <3b7f21be3c0701b0661a3e6f73cc28dc73e710d4.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe/mm: add XE MEM POOL manager with shadow
 support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Date: Thu, 02 Apr 2026 10:18:25 +0200
In-Reply-To: <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Wed, 2026-04-01 at 16:15 +0000, Satyanarayana K V P wrote:
> Add a xe_mem_pool manager to allocate sub-ranges from a BO-backed
> pool
> using drm_mm.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool_manager.
> - Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
> xe_mem_pool_shadow_init() (Michal)
> - Made xe_mm_sa_manager structure private. (Matt)
> - Introduced init flags to initialize allocated pools.
>=20
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset during manager init and insert (Matt)

Hey, Run a kreview using review-prompts with Claude:

> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.c
b/drivers/gpu/drm/xe/xe_mem_pool.c
> new file mode 100644

[ ... ]

> +static void xe_mem_pool_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_mem_pool_manager *pool_manager =3D arg;
> +
> +	drm_mm_takedown(&pool_manager->base);
> +
> +	if (pool_manager->resv_alloc) {
> +		drm_mm_remove_node(pool_manager->resv_alloc);
> +		kfree(pool_manager->resv_alloc);
> +	}

The node removal happens after drm_mm_takedown(), but drm_mm_takedown()
requires the allocator to be clean before it is called.

When XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST is used,
xe_mem_pool_init()
calls xe_mem_pool_init_flags() which inserts a reserved node and stores
it
in pool_manager->resv_alloc.  On device teardown, xe_mem_pool_fini() is
invoked with that node still allocated inside the drm_mm.

drm_mm_takedown() in drivers/gpu/drm/drm_mm.c does:

    void drm_mm_takedown(struct drm_mm *mm)
    {
        if (WARN(!drm_mm_clean(mm),
                 "Memory manager not clean during takedown.\n"))
            show_leaks(mm);
    }

drm_mm_clean() returns list_empty(drm_mm_nodes(mm)), which is false
when
resv_alloc is still inserted.  So the WARN fires on every teardown of a
pool created with BB_END_HIGHEST.

Shouldn't drm_mm_remove_node(pool_manager->resv_alloc) be called before
drm_mm_takedown(), so the allocator is clean at the point of takedown?

[ ... ]

> +/**
> + * xe_mem_pool_remove_node() - Remove a node from the DRM MM
manager.
> + * @node: the DRM MM node to remove.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_remove_node(struct drm_mm_node *node)
> +{
> +	return drm_mm_remove_node(node);
> +}

This isn't a bug, but returning a void expression from a void function
is unusual - the return statement here implies a return value where
there
is none.  The body could just be drm_mm_remove_node(node) without the
return.

