Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F8AC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110B910E971;
	Wed, 15 Mar 2023 15:58:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D65010E971;
 Wed, 15 Mar 2023 15:58:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 24EADAADF0;
 Wed, 15 Mar 2023 15:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 15 Mar 2023 15:58:40 -0000
Message-ID: <167889592014.19838.2071744339367207974@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Cpu_page-table_updates_and_fixes_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Cpu page-table updates and fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/115079/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 879867553e592c84b7ce6ac0a226e7d9b964dfcd
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Tue Mar 14 17:49:02 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Wed Mar 15 06:41:33 2023 -0700

    drm/xe: Silence kernel-doc warnings related to display
    
    Add a "private:" comment to the part of the struct that is not expected
    to be documented, the one with display-related fields. This silence the
    following warnings:
    
            $ find drivers/gpu/drm/xe -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'  |  xargs ./scripts/kernel-doc -Werror  -none
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_type' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_id' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'wm_lv_0_adjust_needed' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_channels' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'symmetric_memory' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'type' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_qgv_points' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_psf_gv_points' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'dram_info' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'runtime_pm' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'sb_lock' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'skl_preferred_vco_freq' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'max_dotclk_freq' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'hti_state' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'snps_phy_failed_calibration' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'modeset_restore_state' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'global_obj_list' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'de_irq_mask' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display_irqs_enabled' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'enabled_irq_mask' not described in 'xe_device'
            drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'params' not described in 'xe_device'
            22 warnings as Errors
    
    Fixes: 19026b7eb521 ("drm/xe: Remove i915 header dependency when building without display")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://lore.kernel.org/r/20230315004902.2622613-1-lucas.demarchi@intel.com
=== git am output follows ===
.git/rebase-apply/patch:52: trailing whitespace.
			
warning: 1 line adds whitespace errors.
Applying: drm/xe: Use a define to set initial seqno for fences
Applying: drm/xe/migrate: Update cpu page-table updates
Applying: drm/xe/tests: Support CPU page-table updates in the migrate test
Applying: drm/xe: Introduce xe_engine_is_idle()
Applying: drm/xe: Use a small negative initial seqno
Applying: drm/xe/tests: Test both CPU- and GPU page-table updates with the migrate test
Applying: drm/xe/vm: Defer vm rebind until next exec if nothing to execute


