Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA9606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmKYlHJI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181B9112532;
	Thu, 19 Nov 2026 15:25:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB9011251A;
 Thu, 19 Nov 2026 15:25:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0AFEF43F9F;
 Thu, 19 Nov 2026 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79FC1F000C6;
 Thu, 19 Nov 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795101899;
 bh=5NnTdAnw6oBwz99E8mfT0K7YRIrjWwDTh66iRAJZyNY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jmKYlHJIMIoGlAd/3MpXWl1+dRsscyxFkNgSCqMR9QEM4k+X+up3zBv5d9vqY4p6a
 R1AqmOIbKYciWK1hFF0/eeRT4Lwh0Hae/TdhmjxJiW2HLbrNKsgMj0ASQ4S60+LOE1
 MG0xWxlsVI2DVFWNIZLaMjAJtasoW7dUFQ5XyMhurgUWxBAcWt0FvWiwxHFEAvb018
 0VPZ3TH8QhNXYSdJaI6lQ2CcVL/eTpmRr9bLD2Y9bOsDZPblEOLLphvgI2FC0cnaGk
 pZHY1Ub37AT1bhi5Mh7+URZy8FnlfpqR47GcyTpmQEsnjD/5K6rHYZUxms3WG4wj2p
 eXpgCY9mtDavw==
Message-ID: <sashiko-outbox-223379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915: drop unnecessary display/ includes
To: "Jani Nikula" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119151644.4097956-1-jani.nikula@intel.com>
References: <20261119151644.4097956-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:24:59 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915: build failure in intel_uncore_init_mmio() due to
  missing header
--

commit 7bc6738060c0255c4ddc88b8481bd154e455c1f4
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915: drop unnecessary display/ includes

This commit removes display/intel_crtc.h from i915_initial_plane.c and
display/intel_display_core.h from intel_uncore.c.

> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index e360e4f9d9a2d..925c52f4494b0 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -27,7 +27,6 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> =20
> -#include "display/intel_display_core.h"
>  #include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_regs.h"

[Severity: High]
Does removing display/intel_display_core.h break the build in
intel_uncore_init_mmio()?

drivers/gpu/drm/i915/intel_uncore.c:intel_uncore_init_mmio() {
    ...
	if (HAS_FPGA_DBG_UNCLAIMED(display))
		uncore->flags |=3D UNCORE_HAS_FPGA_DBG_UNCLAIMED;
    ...
}

HAS_FPGA_DBG_UNCLAIMED() is defined in display/intel_display_device.h (which
was previously pulled in via display/intel_display_core.h) and dereferences
struct intel_display, which is defined in display/intel_display_core.h.
Without that header, compiling intel_uncore.c fails with an implicit
declaration error for HAS_FPGA_DBG_UNCLAIMED().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119151644.4097=
956-1-jani.nikula@intel.com?part=3D1
