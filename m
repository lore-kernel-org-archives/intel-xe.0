Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8521C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F29710EB0F;
	Tue,  8 Sep 2026 10:51:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423EA10EB0F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:51:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 656E0601DB;
 Tue,  8 Sep 2026 10:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AD61F00A3A;
 Tue,  8 Sep 2026 10:51:53 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/13] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908104550.1283933-6-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:51:50 +0000
Message-Id: <20260908105154.08AD61F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The memirq_err macro definition is left unused after all its invoca=
tions were replaced by xe_log_err.
--

commit 2b3819cee96cee285cc138829c3bd7c1285facac
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/memirq: Report errors using structured xe_log API
   =20
This commit replaces memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures.

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..32b9f87a10ecf 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -15,6 +15,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_memirq.h"
>  #include "xe_tile_printk.h"
> =20

[Severity: Low]
Does this patch leave behind an unused macro definition?

Looking at drivers/gpu/drm/xe/xe_memirq.c, the memirq_err() macro is still
defined but no longer seems to be used after these replacements:

#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)

Should this macro definition be removed as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908104550.1283=
933-1-dnyaneshwar.bhadane@intel.com?part=3D5
