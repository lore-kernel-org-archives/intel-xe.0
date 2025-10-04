Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D2CCAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 16:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3610E232;
	Sat,  4 Oct 2025 16:26:10 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5610E232;
 Sat,  4 Oct 2025 16:26:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Make_the_lat?=
 =?utf-8?q?e-initialization_really_late_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Oct 2025 16:26:08 -0000
Message-ID: <175959516900.5717.10574075137563903957@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251004162008.1782-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251004162008.1782-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Make the late-initialization really late (rev2)
URL   : https://patchwork.freedesktop.org/series/155402/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66d23b4347e6a2605660722792d2adbb78b29650
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Oct 4 18:20:08 2025 +0200

    drm/xe/pf: Make the late-initialization really late
    
    While the late PF per-GT initialization is done quite late in the
    single GT initialization flow, in case of multi-GT platforms, it
    may still be done before other GT early initialization. That leads
    to some issues during unwind, when there are cross-GT dependencies,
    like resource cleanup that is shared by both GTs, but the other GT
    may already be sanitized or disabled.
    
    The following errors could be observed when trying to unload the PF
    driver with some LMEM/VRAM already provisioned for few VFs:
    
     [ ] xe 0000:03:00.0: DEVRES REL ffff88814708f240 fini_config (16 bytes)
     [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=1 pte=0x0
     [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
     [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=53a470000
     [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=53a4b0000
     [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
     [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
     [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=2 pte=0x0
     [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
     [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=539b70000
     [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=539bf0000
     [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
     [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
    
    Move all PF per-GT late initialization to the already defined late
    SR-IOV initialization function to allow proper order of the cleanup
    actions.
    
    While around, format all PF function stubs as one-liners, like many
    other stubs are defined in the Xe driver.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch af95880a54d743a43dd2d575764e0807a89da01f drm-intel
66d23b4347e6 drm/xe/pf: Make the late-initialization really late
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=1 pte=0x0

total: 0 errors, 1 warnings, 0 checks, 72 lines checked


