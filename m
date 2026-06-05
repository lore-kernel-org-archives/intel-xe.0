Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3151CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39664112C74;
	Fri,  5 Jun 2026 23:47:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D34112C74;
 Fri,  5 Jun 2026 23:47:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_per_exec_queue_MSI?=
 =?utf-8?q?-X_vector_assignment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 23:47:42 -0000
Message-ID: <178070326202.49942.10249683676971670223@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605232108.674580-14-stuart.summers@intel.com>
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
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

Series: Enable per exec queue MSI-X vector assignment
URL   : https://patchwork.freedesktop.org/series/167990/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit abd1bc1bc702d9d727c63d70862c4a0bc1c45d13
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Fri Jun 5 23:21:19 2026 +0000

    drm/xe/memirq: Enable compute walker post-sync interrupt
    
    Commit 2ddedd4b7b7c ("drm/xe/memirq: Enable GT_MI_USER_INTERRUPT only")
    narrowed the MEMIRQ enable mask to GT_MI_USER_INTERRUPT only. Add
    the interrupt enable bit for the compute walker post sync interrupt
    as well to allow those to go through.
    
    Additionally, the compute walker post sync interrupt vector offset
    in the LRC register is currently incorrect. Fix that here.
    
    Bspec: 62346, 72547
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: Copilot:claude-sonnet-4.6
+ /mt/dim checkpatch f5cb6d0bd86baaed2c093b772ddc3870429aba08 drm-intel
2e8c016f124b drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
205c9371b039 drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
b46922b18642 drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
d4e65334af87 drm/xe: Assign dedicated MSI-X vectors to exec queues
bf262e7a4b5b drm/xe: Add configfs max_msix_vecs attribute
8ee303fa10dd drm/xe: Change MSI-X assignment failure to drm_dbg
fc52aea64445 drm/xe: Remove memirq status and source checks for engine interrupts
2c8f9af482ce drm/xe: Add per-exec-queue user fence wait queue
e3e7d0767bdf drm/xe: Track all exec queues in a device-level ufence list
646849d94c0d drm/xe: Hook up per queue thread wake to the unique MSI-X vector allocation
21b95375d83c drm/xe: Enable per-queue ufence wake in ioctl and wake function
-:53: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#53: FILE: drivers/gpu/drm/xe/xe_wait_user_fence.c:76:
+	 * so callers that don't specify a queue fall through to the broadcast.

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
abd1bc1bc702 drm/xe/memirq: Enable compute walker post-sync interrupt


