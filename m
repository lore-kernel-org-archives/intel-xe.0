Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F2CE7A88
	for <intel-xe@archiver.kernel.org>; Sat, 23 Sep 2023 00:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A09A10E097;
	Sat, 23 Sep 2023 00:06:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8484810E097;
 Sat, 23 Sep 2023 00:06:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7CC99A00E8;
 Sat, 23 Sep 2023 00:06:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Sat, 23 Sep 2023 00:06:46 -0000
Message-ID: <169542760650.3502.624609467751766415@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922211323.1672907-2-matthew.d.roper@intel.com>
In-Reply-To: <20230922211323.1672907-2-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Infer_service_copy_functionality_from_engine_list_=28re?=
 =?utf-8?b?djIp?=
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

Series: drm/xe: Infer service copy functionality from engine list (rev2)
URL   : https://patchwork.freedesktop.org/series/124143/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1bbdfa639755cd901f6e6721a03b5417d5850e91
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Sep 22 14:13:24 2023 -0700

    drm/xe: Infer service copy functionality from engine list
    
    The newer MEM_SET / MEM_COPY blitter instructions are available on any
    platform designed with service copy support.  Since the GT's IP
    definition already has the list of (pre-fusing) engines, we can
    determine whether these instructions will be supported without needing
    an extra feature flag.  Deriving this functionality from the engine list
    also fixes an oversight where our Xe2 IP definition was missing this
    feature flag, even though it supports the MEM_SET and MEM_COPY
    instructions.
    
    For clarity, "service copy" is a general term that covers any blitter
    engines that support a limited subset of the overall blitter instruction
    set (in practice this is any non-BCS0 blitter engine).  The "link copy
    engines" introduced on PVC and the "paging copy engine" present in Xe2
    are both instances of service copy engines.
    
    Bspec: 65019
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 16e2c940ef53f81b2c68e16ec39cf5772894a625 drm-intel
1bbdfa639 drm/xe: Infer service copy functionality from engine list
-:72: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#72: FILE: drivers/gpu/drm/xe/xe_migrate.c:880:
+static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 		      u32 size, u32 pitch, bool is_vram)

total: 0 errors, 0 warnings, 1 checks, 84 lines checked


