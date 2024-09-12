Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B444EED60A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 14:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4565910E0F0;
	Thu, 12 Sep 2024 14:09:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533E710E0F0;
 Thu, 12 Sep 2024 14:09:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/guc=3A_Add_Gu?=
 =?utf-8?q?C_based_register_capture_for_error_capture_=28rev19=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 14:09:55 -0000
Message-ID: <172615019533.992113.14241631106792854462@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912134654.161754-1-zhanjun.dong@intel.com>
In-Reply-To: <20240912134654.161754-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev19)
URL   : https://patchwork.freedesktop.org/series/128077/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5c43f7fc693a drm-tip: 2024y-09m-12d-10h-31m-18s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_hw_engine.c:909
error: drivers/gpu/drm/xe/xe_hw_engine.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config advice.mergeConflict false"
Applying: drm/xe/guc: Prepare GuC register list and update ADS size for error capture
Applying: drm/xe/guc: Add XE_LP steered register lists
Applying: drm/xe/guc: Add capture size check in GuC log buffer
Applying: drm/xe/guc: Extract GuC error capture lists
Applying: drm/xe/guc: Plumb GuC-capture into dev coredump
Patch failed at 0005 drm/xe/guc: Plumb GuC-capture into dev coredump


