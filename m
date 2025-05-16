Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26F0C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C810EB53;
	Fri, 16 May 2025 17:51:39 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE7A10EB53;
 Fri, 16 May 2025 17:51:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bo=3A_optimise_CCS?=
 =?utf-8?q?_case_for_WB_pages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 17:51:39 -0000
Message-ID: <174741789903.89658.1324141801666676392@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516153810.223530-2-matthew.auld@intel.com>
In-Reply-To: <20250516153810.223530-2-matthew.auld@intel.com>
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

Series: drm/xe/bo: optimise CCS case for WB pages
URL   : https://patchwork.freedesktop.org/series/149122/
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
commit 61a85bd4a2382fc4f4403464ac4a9f07530a7503
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri May 16 16:38:11 2025 +0100

    drm/xe/bo: optimise CCS case for WB pages
    
    Dealing with CCS state is significant on LNL+, where we end up clearing
    the compression state on every page alloc using the blitter for user
    buffers, including also saving and restoring it when moving between
    domains, plus we need to alloc extra pages to hold the raw CCS state for
    the save step.
    
    However all compression PAT modes, on platforms like LNL, also require
    coh_none, meaning that only WC memory can use compression in the first
    place. With this we can be sneaky and completely ignore CCS for WB
    buffers, which is likely the common case anyway. This would then skip
    all blitter moves/clears between sys <-> tt and then also means we can
    drop the extra CCS pages.
    
    This should be safe since there is no way to interact with the
    compression state (potentially uncleared) without using a PAT enabled
    index (which is rejected at bind), including if trying to be malicious
    and copy the raw CCS state from userpace, which should give back all
    zeroes if the src surface (indirect) is lacking compressed PAT index.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9c0f4c692985eaa0b88ed12a16ec197e83707501 drm-intel
61a85bd4a238 drm/xe/bo: optimise CCS case for WB pages


