Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675DEC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 15:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9410E0A1;
	Tue,  8 Aug 2023 15:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607310E0A1
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691507159; x=1723043159;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=w5FiN89YPhJD6pY1nYa6x0PkXfZ2uVqWP0ju7RBNbeQ=;
 b=ZbTngsbpVR5vUdNtzB1mS/pGl4FbLyp8IFMGZjJxOD36R9EL65Lv9aHr
 uN/Sj436W9CZ3Mc44H8MR4gUVZHLAQzL+k0btejYd9tZR4XFMQTZPtlrU
 x4xJzGkb6a3w6bDx/RQF8jKJk6xVZNBr6CkoWZGwSwzaf35hoGxUoD7Ii
 b4SaxiIZXqB+rTgjZbwVqZjrgnfAkwW74sU/8PsAL5EgwyIHvfrmHdqQ3
 ttOyVJACg3MUH6YlsnXKDe1vZrXBGzcABr5fHvyZWXaLk8c2i+GU1XgZ7
 h7vHxXAnZ2ndmuSU3PTxisDQ69vAeXWeTKFKRqo04agQj6mS6EY3zw0se w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351152904"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="351152904"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 08:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708283171"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="708283171"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 08:04:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
In-Reply-To: <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
Date: Tue, 08 Aug 2023 18:04:20 +0300
Message-ID: <87y1ilshhn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
>>As we are moving away from the controversial XE_BUG_ON macro,
>>relying just on WARN_ON or drm_err does not cover the cases
>>where we want to annotate functions with additional detailed
>>debug checks to assert that all prerequisites are satisfied,
>>without paying footprint or performance penalty on non-debug
>>builds, where all misuses introduced during code integration
>>were already fixed.
>>
>>Introduce family of xe_ASSERT macros that try to follow classic
>>assert() utility and can be compiled out on non-debug builds.
>>
>>Macros are based on drm_WARN, but unlikely to origin, disallow
>>use in expressions since we will compile that code out.
>>
>>As we are operating on the xe pointers, we can print additional
>>information about the device, like tile or GT identifier, that
>>is not available from generic WARN report:
>>
>>[ ] xe 0000:00:02.0: [drm] Assertion `true =3D=3D false` failed!
>>    platform: 1 subplatform: 1
>>    graphics: Xe_LP 12.0 step B0
>>    media: Xe_M 12.0 step B0
>>    display: enabled step D0
>>    tile: 0 VRAM 0 B
>>    GT: 0 type 1
>>
>>[ ] xe 0000:b3:00.0: [drm] Assertion `true =3D=3D false` failed!
>>    platform: 7 subplatform: 3
>>    graphics: Xe_HPG 12.55 step A1
>>    media: Xe_HPM 12.55 step A1
>>    display: disabled step **
>>    tile: 0 VRAM 14.0 GiB
>>    GT: 0 type 1
>>
>>[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_de=
vice_probe+0x374/0x520 [xe]
>>[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>[ ] Call Trace:
>>[ ]  ? __warn+0x7b/0x160
>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>[ ]  ? report_bug+0x1c3/0x1d0
>>[ ]  ? handle_bug+0x42/0x70
>>[ ]  ? exc_invalid_op+0x14/0x70
>>[ ]  ? asm_exc_invalid_op+0x16/0x20
>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>[ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>[ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>[ ]  pci_device_probe+0x9e/0x160
>>[ ]  really_probe+0x19d/0x400
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>Cc: Oded Gabbay <ogabbay@kernel.org>
>>Cc: Jani Nikula <jani.nikula@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Matthew Brost <matthew.brost@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>> 1 file changed, 160 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>
>>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_asser=
t.h
>>new file mode 100644
>>index 000000000000..7ea295b7091c
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_assert.h
>>@@ -0,0 +1,160 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright =C2=A9 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef __XE_ASSERT_H__
>>+#define __XE_ASSERT_H__
>>+
>>+#include <linux/string_helpers.h>
>>+#include <drm/drm_print.h>
>>+#include "xe_device_types.h"
>>+#include "xe_step.h"
>>+
>>+/**
>>+ * DOC: Xe ASSERTs
>>+ *
>>+ * While Xe driver aims to be simpler than legacy i915 driver it is still
>>+ * complex enough that some changes introduced while adding new function=
ality
>>+ * could break the existing code.
>>+ *
>>+ * Adding &drm_WARN or &drm_err to catch unwanted programming usage coul=
d lead
>>+ * to undesired increased driver footprint and may impact production dri=
ver
>>+ * performance as this additional code will be always present.
>>+ *
>>+ * To allow annotate functions with additional detailed debug checks to =
assert
>>+ * that all prerequisites are satisfied, without worrying about footprin=
t or
>>+ * performance penalty on production builds where all potential misuses
>>+ * introduced during code integration were already fixed, we introduce f=
amily
>>+ * of ASSERT macros that try to follow classic assert() utility and can =
be
>>+ * compiled out on non-debug builds:
>>+ *
>>+ *  * &xe_ASSERT
>
> pass by comment, not really checking anything else here... Why are we
> mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
> like is done for other macros.

I think it comes from drm_WARN, but yeah, could be XE_ASSERT.

>
> Lucas De Marchi

--=20
Jani Nikula, Intel Open Source Graphics Center
