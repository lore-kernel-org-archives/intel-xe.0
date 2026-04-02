Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D8CC6B2B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48910F18F;
	Thu,  2 Apr 2026 08:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiRj4a49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36C410F18F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775118108; x=1806654108;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0feQz4lkUhcRHFzkFIYOkoVIrxj3pfiS33HRX3FX/do=;
 b=DiRj4a49qUY8uo/CwlbkBKoudr5WGdNiU9Ifn9sBR3MQiIfufPlEuWPD
 M7PnVri5w92b9NWtUAHYD6ENEHFZQMvjHN8L9yRzSP1egmsaL42FQzvtS
 nWeyItI7eQk5vVGR78AgM7GxcWMARB4PcgPEyoBIuQ2A+ho5lJ0IWcA4j
 0hXVyA/JQm27jHXimhPzkJPr0FX34UmQEWVJ7RiJX3LLNg6U9GmbWfolW
 p9IwshH2RiUf/gpPaqtN8c8wnsYtT5JoIesuITIRnNwjmGyT7yhh2CMNq
 OLia9amr73VibNJRN5rBoKz5fxMGyOM0x0NzrK6mjs+gv2rfNWZI3dCGB w==;
X-CSE-ConnectionGUID: e3oAoKUrQpa81yOvuw5rGg==
X-CSE-MsgGUID: ZrVg0tf8Tyq6hqTKSgAl+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76230655"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76230655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:21:47 -0700
X-CSE-ConnectionGUID: oCXdqYC1SFqUEHooCWVbpg==
X-CSE-MsgGUID: RaAgs0cXSaWNy/y6kusYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227182116"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.32])
 ([10.245.245.32])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:21:45 -0700
Message-ID: <f3b1ae54cdc45f9569b965b4f302d6cdc679dd8e.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe/mm: Add batch buffer allocation functions
 for xe_mem_pool manager
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Date: Thu, 02 Apr 2026 10:21:41 +0200
In-Reply-To: <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
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
> New APIs xe_pool_bb_alloc(), xe_pool_bb_insert() and
> xe_pool_bb_free() are created to manage allocations from the
> xe_mem_pool manager.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool.
>=20
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset from xe_drm_mm_bb_insert() (Matt).
> ---

Claude's kreview:

> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c

[ ... ]

> +/**
> + * xe_pool_bb_alloc() - Allocate a new batch buffer structure for
drm_mm
> + *
> + * Allocates a new xe_pool_bb structure for use with xe_pool memory
> + * management.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_mem_pool_bb *xe_pool_bb_alloc(void)

The kerneldoc says "Allocates a new xe_pool_bb structure" but the
returned type is struct xe_mem_pool_bb. The type xe_pool_bb does not
exist. Should the description read "xe_mem_pool_bb structure"?

> +/**
> + * xe_pool_bb_insert() - Initialize a batch buffer and insert a hole
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: drm_mm manager to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the
specified
> + * drm_mm manager.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
> +		      struct xe_mem_pool_manager *bb_pool, u32 dwords)

The one-line description says "insert a hole", but in drm_mm
terminology a hole is available free space. This function calls
xe_mem_pool_insert_node() which calls drm_mm_insert_node() to
allocate a node from within a hole. Should the description say
"insert a node" instead of "insert a hole"?

Also, xe_mem_pool_insert_node() and xe_mem_pool_remove_node() have
no internal locking. The current caller in xe_migrate.c wraps both
xe_pool_bb_insert() and xe_pool_bb_free() inside:

    scoped_guard(mutex, xe_mem_pool_bo_swap_guard(bb_pool)) {

but neither function documents this requirement. Would it make sense
to add a locking precondition to the kerneldoc of both functions,
similar to the _locked suffix convention used elsewhere in this file?

> +/**
> + * xe_pool_bb_free() - Free a batch buffer allocated with drm_mm
> + * @bb: Batch buffer structure to free
> + */
> +void xe_pool_bb_free(struct xe_mem_pool_bb *bb)

Same locking question as xe_pool_bb_insert() above --
drm_mm_remove_node()
requires external locking and the caller holds swap_guard, but this
is not documented here.

Also, this isn't a bug, but the new functions are named xe_pool_bb_*
while the type they operate on is struct xe_mem_pool_bb and the
manager type is struct xe_mem_pool_manager. The existing infrastructure
uses the xe_mem_pool_ prefix consistently. Would
xe_mem_pool_bb_alloc(),
xe_mem_pool_bb_insert(), and xe_mem_pool_bb_free() be more consistent
with the rest of the subsystem?

/Thomas
