Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E281BCD1288
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C010E2E2;
	Fri, 29 Mar 2024 04:47:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677ED892D2;
 Fri, 29 Mar 2024 04:47:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/xe=5Fguc=5Fsubmit=3A_Fix_exec_queue_stop_race_condit?=
 =?utf-8?q?ion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 04:47:20 -0000
Message-ID: <171168764042.1066178.10563975764853948944@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328213358.3506490-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240328213358.3506490-1-jonathan.cavitt@intel.com>
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

Series: series starting with [1/2] drm/xe/xe_guc_submit: Fix exec queue stop race condition
URL   : https://patchwork.freedesktop.org/series/131796/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0635fbec3ce5ae76fc2434836b9a082baaf3efb0
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Thu Mar 28 14:33:58 2024 -0700

    drm/xe/xe_guc_status: Allow lr exec queues to be banned
    
    LR queues currently don't get banned during a GT/GuC reset because they
    lack a job.  Though they don't have a job to detect the reset status of,
    it's still possible to tell when they should be banned by looking at the
    LRC: if the LRC head and tail don't match, then the exec queue should be
    banned and cleaned up.
    
    This also requires swapping the usage of xe_sched_tdr_queue_imm with
    xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
    exec queues.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 98f893b726e1ba5db2680da3f9f53ab2af9780be drm-intel
c6d7bdb19db1 drm/xe/xe_guc_submit: Fix exec queue stop race condition
0635fbec3ce5 drm/xe/xe_guc_status: Allow lr exec queues to be banned


