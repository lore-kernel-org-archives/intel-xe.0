Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9361EC02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 00:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB710E22B;
	Fri,  7 Feb 2025 00:59:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF3710E9BF;
 Fri,  7 Feb 2025 00:59:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Cleanup_error_handli?=
 =?utf-8?q?ng_on_probe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 00:59:49 -0000
Message-ID: <173888998943.2324859.15267855451737933033@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Cleanup error handling on probe (rev2)
URL   : https://patchwork.freedesktop.org/series/144211/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f2401c718ce0 drm-tip: 2025y-02m-06d-20h-18m-27s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix xe_display_fini() calls
Applying: drm/xe: Fix error handling in xe_irq_install()
Applying: drm/xe: Fix xe_tile_init_noalloc() error propagation
Applying: drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
Applying: drm/xe: Remove leftover pxp comment
Applying: drm/xe: Add callback support for driver remove
Applying: drm/xe: Cleanup unwind of gt initialization
Applying: drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
Applying: drm/xe: Move oa fini to xe_oa
Applying: drm/xe: Move drm_dev_unplug() out of display function
Applying: drm/xe/oa: Handle errors in xe_oa_register()
Applying: drm/xe: Fail probe if xe_pmu_register() fails
Applying: drm/xe/hwmon: Fix mutex destroy
Applying: drm/xe/hwmon: Stop ignoring errors on probe


