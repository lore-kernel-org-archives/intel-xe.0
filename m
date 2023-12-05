Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1D6C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 11:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CF010E4D9;
	Tue,  5 Dec 2023 11:28:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9695D10E4D9;
 Tue,  5 Dec 2023 11:28:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 398DAAADED;
 Tue,  5 Dec 2023 11:28:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 05 Dec 2023 11:28:28 -0000
Message-ID: <170177570823.24286.639562376791975926@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205095715.7-1-francois.dugast@intel.com>
In-Reply-To: <20231205095715.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_fixup!_drm/xe/uc=3A_Store_firmware_binary_in_system-memory_b?=
 =?utf-8?q?acked_BO?=
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

Series: fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
URL   : https://patchwork.freedesktop.org/series/127349/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ac7b89571 drm/xe/uapi: Kill exec_queue_set_property
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_uc_fw.c:760
error: drivers/gpu/drm/xe/xe_uc_fw.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
Patch failed at 0001 fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


