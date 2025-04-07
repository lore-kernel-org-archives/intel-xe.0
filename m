Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CCFC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 14:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7810E4AC;
	Mon,  7 Apr 2025 14:49:44 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300D10E4AC;
 Mon,  7 Apr 2025 14:49:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Program?=
 =?utf-8?q?_double_buffered_LUT_registers_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 14:49:42 -0000
Message-ID: <174403738252.44481.13317347483738446551@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407142359.1398410-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250407142359.1398410-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/xe/display: Program double buffered LUT registers (rev5)
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
commit 28dba834a7757294aea78b9fbdad1774b1b0a871
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Apr 7 19:53:59 2025 +0530

    drm/i915: Disable updating of LUT values during vblank
    
    Do not schedule vblank worker for LUT update if the registers are
    double buffered
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 100ba24787e877cd422caa7d08cb046ef4bb769c drm-intel
03d17860f7a4 drm/i915/dsb: Extract intel_dsb_ins_align()
c85187803828 drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
8e7c52bafe7e drm/i915/dsb: Extract intel_dsb_{head,tail}()
09aa328420e2 drm/i915/dsb: Implement intel_dsb_gosub()
60469eedaf5a drm/i915/dsb: add intel_dsb_gosub_finish()
eef14448b9d2 drm/i915/dsb: Add support for GOSUB interrupt
0e393f2fc9d4 drm/i915: s/dsb_color_vblank/dsb_color
dd8cf57cb48d drm/i915: use GOSUB to program doubled buffered LUT registers
7b3935029402 drm/i915: Program DB LUT registers before vblank
131e5b8fbbb4 drm/i915/color: Do not pre-load LUTs with DB registers
28dba834a775 drm/i915: Disable updating of LUT values during vblank


