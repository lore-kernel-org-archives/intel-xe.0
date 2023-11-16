Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B09C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8926610E5F1;
	Thu, 16 Nov 2023 14:20:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F16C10E5F1;
 Thu, 16 Nov 2023 14:20:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 45304A882E;
 Thu, 16 Nov 2023 14:20:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 16 Nov 2023 14:20:48 -0000
Message-ID: <170014444825.3094.6283876690865994576@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Adding_new_frequency_sysfs_attributes?=
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

Series: Adding new frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/126534/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 33775eb43 drm/xe/guc: Promote guc_to_gt/xe helpers to .h
=== git am output follows ===
.git/rebase-apply/patch:276: trailing whitespace.
static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg) 
.git/rebase-apply/patch:284: trailing whitespace.
void xe_gt_throttle_sysfs_init(struct xe_gt *gt) 
.git/rebase-apply/patch:337: new blank line at EOF.
+
warning: 3 lines add whitespace errors.
Applying: drm/xe: Moving and renaming existing frequency sysfs attributes
Applying: drm/xe: Add memory directory for vram attributes
Applying: drm/xe: Add throttle reasons sysfs attributes
Applying: drm/xe: Add vram frequency sysfs attributes


