Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6301BC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9E110E193;
	Tue, 27 May 2025 16:08:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A510E193;
 Tue, 27 May 2025 16:08:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dram=3A_dram=5Fi?=
 =?utf-8?q?nfo_refactoring_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 16:08:43 -0000
Message-ID: <174836212396.24795.3027503689069494014@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748337870.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748337870.git.jani.nikula@intel.com>
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

Series: drm/i915/dram: dram_info refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/148703/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a03a7a040e6712b7b1a2806fb4eec4a136ce88ac
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 27 12:25:26 2025 +0300

    drm/i915/dram: allocate struct dram_info dynamically
    
    Allocate struct drm_info dynamically, and convert the struct
    drm_i915_private and struct xe_device dram_info member into a const
    pointer. Move the struct definition to intel_dram.h, and keep it opaque
    to everyone not needing it. This also removes the duplication of the
    struct definition.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b85200adaeff8739c0358088e20a8cbdb4bda851 drm-intel
f492cffe0878 drm/i915/bw: pass struct dram_info pointer around
a5d1fb0ef8b4 drm/i915/dram: add accessor for struct dram_info and use it
6b1d335ba3f6 drm/i915/wm: DG2 doesn't have dram info to look up wm_lv_0_adjust_needed
46b8ed147989 drm/i915/dram: pass struct dram_info pointer around
ab4dc9ccd728 drm/i915/dram: add return value and handling to intel_dram_detect()
a03a7a040e67 drm/i915/dram: allocate struct dram_info dynamically


