Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1244EC3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 11:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52510E66F;
	Tue,  8 Apr 2025 11:21:35 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBBE10E671;
 Tue,  8 Apr 2025 11:21:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Program?=
 =?utf-8?q?_double_buffered_LUT_registers_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 11:21:35 -0000
Message-ID: <174411129512.47097.14787204769935895185@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/xe/display: Program double buffered LUT registers (rev6)
URL   : https://patchwork.freedesktop.org/series/142436/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a917e24f50093ee3e34a1ee3fb7e23f332c03596
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue Apr 8 16:30:22 2025 +0530

    drm/i915: Disable updating of LUT values during vblank
    
    Do not schedule vblank worker for LUT update if the registers are
    double buffered
    
    v2: Do not schedule the worker at all (Ville)
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 0f84e82ac3f6cd63b0359d2fe67829b407643d7c drm-intel
94b63078008b drm/i915/dsb: Extract intel_dsb_ins_align()
c04ada16e95c drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
efc533b68428 drm/i915/dsb: Extract intel_dsb_{head,tail}()
07531acda0fd drm/i915/dsb: Implement intel_dsb_gosub()
e5c660c03bef drm/i915/dsb: add intel_dsb_gosub_finish()
083238be999d drm/i915/dsb: Add support for GOSUB interrupt
91b053dfdf61 drm/i915: s/dsb_color_vblank/dsb_color
e3ab90e894d6 drm/i915: use GOSUB to program doubled buffered LUT registers
4565c8c7b659 drm/i915: Program DB LUT registers before vblank
af58a9faa480 drm/i915/color: Do not pre-load LUTs with DB registers
a917e24f5009 drm/i915: Disable updating of LUT values during vblank


