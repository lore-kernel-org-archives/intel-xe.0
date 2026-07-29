Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405E7C54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 07:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02C089220;
	Wed, 29 Jul 2026 07:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwZ3eowF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC7389220
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785311904; x=1816847904;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mtHrDWDpssdR5odiI4X8fvDp+sMyy/31PJI1RXX46ss=;
 b=WwZ3eowF7VKJmcT10h+qzRccDvm7wpY/l0C4ngVpJR6um1qMzirHjjNQ
 bnTnGMoAaIzV0Xji5Lk1l1uBbJbEuPIWgNCj6n6UCeni4MXTDfNnm4pHR
 /S9JuQ3SOExTgLLPXt3vpW3v/Uz08vZLbtU47rNJahbUUjChKEUQexrAa
 lXUDxaqPOyF+GOHD/daAJZ0K7D606/G4jCsQ1Dz58DeK0e9JHUkKdtO8c
 0fyyp3Wxc7aFI1BaOXE+oEFtx+E7gs2G9ZcPC/2myS6vdAHU4C0D1877w
 pEZ6NYMha3wNhUk3XUZBLoWZ5hn8wlZ0+NkHQRPQgJItUlSdlAgXKf7VD Q==;
X-CSE-ConnectionGUID: lDOBFQTIRsi7owFicsc1/A==
X-CSE-MsgGUID: t9Fu9dHySlyFW2QBl6YhxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84888457"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="84888457"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:58:24 -0700
X-CSE-ConnectionGUID: 6HiSEOS/QBGsQJpNTy3m6g==
X-CSE-MsgGUID: YiIek8BFR065ISOAKnOJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="259354457"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.212])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:58:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 01/22] drm/xe: Introduce xe_any helpers
In-Reply-To: <20260728161039.579-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-2-michal.wajdeczko@intel.com>
Date: Wed, 29 Jul 2026 10:58:18 +0300
Message-ID: <c935a430689cdf8d9114b022cd89730b8d884048@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> In upcoming patches we want to define macros that will work with
> either xe_device or xe_tile or xe_gt pointers. To make them work
> and to allow compiler optimizations, introduce set of helpers
> that will return either expected pointer type or NULL or make
> necessary conversions to/from the struct xe/device/pci_dev.

I'm obviously biased, but I think the style I used for
to_intel_display() in intel_display_types.h is cleaner.

BR,
Jani.


>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: add include (Sashiko) and const support (Mallesh)
>     reuse existing to_xe() helpers (Michal)
> ---
>  drivers/gpu/drm/xe/xe_any.h | 112 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_any.h
>
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..a2b1e42fbc5c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ANY_H_
> +#define _XE_ANY_H_
> +
> +#include "xe_device.h"
> +
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 type * : (any),						\
> +		 const type * : (any),						\
> +		 default : NULL)
> +
> +/**
> + * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
> + * @any: any pointer
> + *
> + * Return: the @xe_gt pointer or NULL.
> + */
> +#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
> +
> +/**
> + * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
> + * @any: any pointer
> + *
> + * Return: the @xe_tile pointer or NULL.
> + */
> +#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
> +
> +/**
> + * xe_any_if_xe() - Get the pointer only if it is &xe_device.
> + * @any: any pointer
> + *
> + * Return: the @xe_device pointer or NULL.
> + */
> +#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
> +
> +/**
> + * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
> + * @any: any pointer
> + *
> + * Return: the @pci_dev pointer or NULL.
> + */
> +#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
> +
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)								\
> +	_Generic((any),									\
> +		 struct xe_device * : (any),						\
> +		 const struct xe_device * : (any),					\
> +		 struct xe_tile * : tile_to_xe((struct xe_tile *)(any)),		\
> +		 const struct xe_tile * : tile_to_xe((const struct xe_tile *)(any)),	\
> +		 struct xe_gt * : gt_to_xe((struct xe_gt *)(any)),			\
> +		 const struct xe_gt * : gt_to_xe((const struct xe_gt *)(any)),		\
> +		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),		\
> +		 struct device * : kdev_to_xe_device((struct device *)(any)))
> +
> +/**
> + * xe_any_to_dev() - Obtain the &device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 struct device * : (any),					\
> +		 default : xe_any_to_xe(any)->drm.dev)
> +
> +/**
> + * xe_any_to_pdev() - Obtain the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 struct pci_dev * : (any),					\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
> +
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if nor applicable/availabl=
e.
> + */
> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 struct xe_gt * : ((struct xe_gt *)(any))->info.id,		\
> +		 const struct xe_gt * : ((const struct xe_gt *)(any))->info.id,	\
> +		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
> +		 const struct xe_tile * : ((const struct xe_tile *)(any))->id,	\
> +		 struct xe_device * : 0,					\
> +		 const struct xe_device * : 0,					\
> +		 struct pci_dev * : 0,						\
> +		 struct device * : 0)
> +
> +#endif

--=20
Jani Nikula, Intel
