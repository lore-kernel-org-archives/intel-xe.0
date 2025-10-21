Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20258CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE45A10E315;
	Tue, 21 Oct 2025 21:11:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEB510E315;
 Tue, 21 Oct 2025 21:11:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Make_sched?=
 =?utf-8?q?=5Fif=5Fidle_debugfs_attribute_write-only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 21:11:12 -0000
Message-ID: <176108107244.37900.5057406712140182052@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021210549.2114-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251021210549.2114-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Make sched_if_idle debugfs attribute write-only
URL   : https://patchwork.freedesktop.org/series/156282/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78dcc2f59be60feef3cce2bbdd23c2f5f21ee283
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Oct 21 23:05:46 2025 +0200

    drm/xe/pf: Make sched_if_idle debugfs attribute write-only
    
    The meaning of the SCHED_IF_IDLE KLV has changed since GuC 70.12.0.
    While it still controls the GuC scheduling parameter, it's no longer
    just a flag, as it also, or foremostly, changes all VFs' scheduling
    priorities to LOW (sched_if_idle=0) or NORMAL (sched_if_idle=1).
    
    Thus reading back the value of sched_if_idle flag from the PF is now
    meaningless, as any outcome of previously applied policy change can
    be obsoleted, since individual VFs priorites can be changed by using
    dedicated SCHED_PRIORITY KLV parameter.
    
    Make sched_if_idle debugfs attribute write-only to avoid misuse.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
78dcc2f59be6 drm/xe/pf: Make sched_if_idle debugfs attribute write-only
-:37: WARNING:MACRO_ARG_UNUSED: Argument 'FORMAT' is not used in function-like macro
#37: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:116:
+#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT, TEST...)	\
 										\
 static int POLICY##_set(void *data, u64 val)					\
 {										\

total: 0 errors, 1 warnings, 0 checks, 48 lines checked


