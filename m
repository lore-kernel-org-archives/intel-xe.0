Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF36FEED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 19:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9F10E06D;
	Thu, 12 Sep 2024 19:24:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEA110E06D;
 Thu, 12 Sep 2024 19:24:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_xe=5Fforce=5Fwak?=
 =?utf-8?q?e=5Fget=28=29_failure_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 19:24:19 -0000
Message-ID: <172616905918.993418.8511283917446087969@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev2)
URL   : https://patchwork.freedesktop.org/series/137982/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9fd27ed0883c drm-tip: 2024y-09m-12d-16h-22m-36s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Error handling in xe_force_wake_get()
Applying: drm/xe: Modify xe_force_wake_put to handle _get returned mask
Applying: drm/xe/device: Update handling of xe_force_wake_get return
Applying: drm/xe/hdcp: Update handling of xe_force_wake_get return
Applying: drm/xe/gsc: Update handling of xe_force_wake_get return
Applying: drm/xe/gt: Update handling of xe_force_wake_get return
Applying: drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
Applying: drm/xe/devcoredump: Update handling of xe_force_wake_get return
Applying: drm/xe/tests/mocs: Update xe_force_wake_get() return handling
Applying: drm/xe/mocs: Update handling of xe_force_wake_get return
Applying: drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
Applying: drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
Applying: drm/xe/guc: Update handling of xe_force_wake_get return
Applying: drm/xe/huc: Update handling of xe_force_wake_get return
Applying: drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
Applying: drm/xe/pat: Update handling of xe_force_wake_get return
Applying: drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
Applying: drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
Applying: drm/xe/query: Update handling of xe_force_wake_get return
Applying: drm/xe/vram: Update handling of xe_force_wake_get return
Applying: drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
Applying: drm/xe: Ensure __must_check for xe_force_wake_get() return
Applying: drm/xe: Change return type to void for xe_force_wake_put


