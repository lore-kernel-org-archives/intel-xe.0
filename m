Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECCBC54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 12:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBB10E6DF;
	Mon, 26 Feb 2024 12:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHPsHxDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E6910E6DF
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708949948; x=1740485948;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HcFT2GLmierisZ/1GHpU1Pokv4/7+IWWE4BYsNdslJw=;
 b=NHPsHxDxnCxEddxedLb6z9t/iN2Uqs3KxL2UjE+5A7L9qaQybN8MGjOz
 OSWwuAyP+LE9Xn0TvnjE7oLizHIIoaMsFME8EfPloqk0aKfprJR5Tqgrw
 y2hbwaIWn7gQ2qCg37uO23ZwpBWlwTGbWV7L4TL4pxcGc7Ghen83S4GcB
 xSb31CNZK5HerpoksivBWRz6t6ANJCQUu2ALfC36Q9+ngcGVRECZpzsDg
 gobb1gyK2HjSDd/TSq2xw8RMUf/FNovhnM2ryMLRr+RWjxszre7g4KvUX
 shxx43S3hOtc3DyDpy9DAbpkh4wZ4CyLX87wHNpGI53eatvuboOuQRyA6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3090212"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3090212"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11284160"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:19:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ogabbay@kernel.org, obitton@habana.ai, lucas.demarchi@intel.com, Dafna
 Hirschfeld <dhirschfeld@habana.ai>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] drm/xe: Do not include current dir for
 generated/xe_wa_oob.h
In-Reply-To: <20240221083622.1584492-1-dhirschfeld@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
Date: Mon, 26 Feb 2024 14:19:02 +0200
Message-ID: <87sf1fmn9l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 21 Feb 2024, Dafna Hirschfeld <dhirschfeld@habana.ai> wrote:
> The generated file 'generated/xe_wa_oob.h' is included using:
> "generated/xe_wa_oob.h"
> which first look inside the source code. But the file resides
> in the build directory and should therefore be included using:
> <generated/xe_wa_oob.h>

Is this documented anywhere?

Is "generated" as a name special?

Cc: Masahiro.


BR,
Jani.


>
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> ---
> v2 changes: add newline, change patch title
>
>  drivers/gpu/drm/xe/xe_gsc.c            | 3 ++-
>  drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
>  drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
>  drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
>  drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
>  7 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 0b90fd9ef63a..a61994292c43 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -7,8 +7,9 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include <generated/xe_wa_oob.h>
> +
>  #include "abi/gsc_mkhi_commands_abi.h"
> -#include "generated/xe_wa_oob.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 868208a39829..fa217f5a386e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -7,9 +7,10 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include <generated/xe_wa_oob.h>
> +
>  #include "abi/guc_actions_abi.h"
>  #include "abi/guc_errors_abi.h"
> -#include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3d2438dc86ee..a66fdf2d2991 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -12,7 +12,8 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> -#include "generated/xe_wa_oob.h"
> +#include <generated/xe_wa_oob.h>
> +
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "tests/xe_test.h"
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index d5e9621428ef..c4edffcd4a32 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -5,7 +5,8 @@
>  
>  #include "xe_ring_ops.h"
>  
> -#include "generated/xe_wa_oob.h"
> +#include <generated/xe_wa_oob.h>
> +
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gpu_commands.h"
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 662f1e9bfc65..3107d2a12426 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -11,7 +11,8 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>  
> -#include "generated/xe_wa_oob.h"
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda..efe9a0d300c0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,8 @@
>  #include <linux/mm.h>
>  #include <linux/swap.h>
>  
> +#include <generated/xe_wa_oob.h>
> +
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -34,7 +36,6 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sync.h"
>  #include "xe_trace.h"
> -#include "generated/xe_wa_oob.h"
>  #include "xe_wa.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3299130ba10a..a0264eedd443 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,7 +9,8 @@
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
>  
> -#include "generated/xe_wa_oob.h"
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"

-- 
Jani Nikula, Intel
