Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA7EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 18:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C0410E4E2;
	Fri, 30 Jun 2023 18:35:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D33310E4E8;
 Fri, 30 Jun 2023 18:35:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED8D0AADE1;
 Fri, 30 Jun 2023 18:35:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 30 Jun 2023 18:35:29 -0000
Message-ID: <168815012996.24874.4357668693773910825@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630175804.1096370-1-matthew.brost@intel.com>
In-Reply-To: <20230630175804.1096370-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_GPUVA_with_no_uAPI_changes?=
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

Series: GPUVA with no uAPI changes
URL   : https://patchwork.freedesktop.org/series/120089/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3b458784c drm/ttm: fix warning that we shouldn't mix && and ||
=== git am output follows ===
Applying: drm/xe: Ban a VM if rebind worker hits an error
Applying: drm/xe: Add helpers to hide struct xe_vma internals
Applying: maple_tree: Export mas_preallocate
Applying: maple_tree: split up MA_STATE() macro
Applying: drm: manager to keep track of GPUs VA mappings
Applying: drm: debugfs: provide infrastructure to dump a DRM GPU VA space
Applying: drm/xe: Remove __xe_vm_bind forward declaration
Applying: drm/xe: Port Xe to GPUVA
Applying: drm/xe: Avoid doing rebinds


