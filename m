Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FB3C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 17:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43CD10E0C4;
	Mon, 20 Nov 2023 17:02:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93E8910E0C4;
 Mon, 20 Nov 2023 17:01:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8ECE5A0003;
 Mon, 20 Nov 2023 17:01:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Mon, 20 Nov 2023 17:01:59 -0000
Message-ID: <170049971954.29474.15741158501069143172@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_GSC_FW_loading_=28rev3=29?=
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

Series: GSC FW loading (rev3)
URL   : https://patchwork.freedesktop.org/series/125717/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 50846befe drm/xe: Remove GEN[0-9]*_ prefixes
=== git am output follows ===
.git/rebase-apply/patch:85: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:512
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: fixup! drm/xe/guc: Report submission version of GuC firmware
Applying: drm/xe/uc: Rework uC version tracking
Applying: drm/xe/gsc: Introduce GSC FW
Applying: drm/xe/gsc: Parse GSC FW header
Applying: drm/xe/gsc: GSC FW load
Applying: drm/xe/gsc: Implement WA 14015076503
Patch failed at 0006 drm/xe/gsc: Implement WA 14015076503
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


