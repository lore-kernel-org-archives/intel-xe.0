Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F2EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AF510E035;
	Mon, 17 Jul 2023 11:28:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CCDD10E236;
 Mon, 17 Jul 2023 11:28:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2E691A7DFB;
 Mon, 17 Jul 2023 11:28:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 17 Jul 2023 11:28:26 -0000
Message-ID: <168959330618.24539.13205964441645141190@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717112502.32379-12-matthew.auld@intel.com>
In-Reply-To: <20230717112502.32379-12-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe=5Fdevice=5Fmem=5Faccess_fixes_and_related_bits_=28rev4=29?=
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

Series: xe_device_mem_access fixes and related bits (rev4)
URL   : https://patchwork.freedesktop.org/series/119213/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 71340f700 drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
=== git am output follows ===
Applying: drm/xe: fix xe_device_mem_access_get() races
Applying: drm/xe/vm: tidy up xe_runtime_pm usage
Applying: drm/xe/debugfs: grab mem_access around forcewake
Applying: drm/xe/guc_pc: add missing mem_access for freq_rpe_show
Applying: drm/xe/mmio: grab mem_access in xe_mmio_ioctl
Applying: drm/xe: ensure correct access_put ordering
Applying: drm/xe: drop xe_device_mem_access_get() from guc_ct_send
Applying: drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
Applying: drm/xe: drop xe_device_mem_access_get() from invalidation_vma
Applying: drm/xe: add lockdep annotation for xe_device_mem_access_get()


