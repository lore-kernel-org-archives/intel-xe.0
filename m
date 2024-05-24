Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480BBC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 18:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B6210F5B8;
	Fri, 24 May 2024 18:29:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06CF10F5B8;
 Fri, 24 May 2024 18:29:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Xe_OA_Consolidated_D?=
 =?utf-8?q?iffs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 18:29:54 -0000
Message-ID: <171657539498.2187933.258190991857460988@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524182404.133725-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240524182404.133725-1-ashutosh.dixit@intel.com>
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

Series: Xe OA Consolidated Diffs
URL   : https://patchwork.freedesktop.org/series/134028/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 573842e9ab57 drm-tip: 2024y-05m-24d-13h-04m-26s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/regs/xe_oa_regs.h: does not exist in index
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.c:805
error: drivers/gpu/drm/xe/xe_guc_pc.c: patch does not apply
error: drivers/gpu/drm/xe/xe_oa.c: does not exist in index
error: drivers/gpu/drm/xe/xe_oa_types.h: does not exist in index
error: patch failed: include/uapi/drm/xe_drm.h:1508
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/oa: Combined diff of changes between v13 and v14
Patch failed at 0001 drm/xe/oa: Combined diff of changes between v13 and v14
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


