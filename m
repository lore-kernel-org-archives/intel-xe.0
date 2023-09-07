Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED2EEC8734
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1653810E7FF;
	Thu,  7 Sep 2023 14:52:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0260710E7FF;
 Thu,  7 Sep 2023 14:52:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 06480AADE0;
 Thu,  7 Sep 2023 14:52:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Sep 2023 14:52:29 -0000
Message-ID: <169409834902.17900.2116749362702641719@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/drm=5Fexec=2C_drm/drm=5Fkunit=3A_Fix_/_WA_for_uaf_and_lo?=
 =?utf-8?q?ck_alloc_tracking=2E_=28rev2=29?=
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

Series: drm/drm_exec, drm/drm_kunit: Fix / WA for uaf and lock alloc tracking. (rev2)
URL   : https://patchwork.freedesktop.org/series/123273/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: bae46e59a drm/xe/pat: Use 0 instead of space on error
=== git am output follows ===
error: patch failed: drivers/gpu/drm/drm_exec.c:56
error: drivers/gpu/drm/drm_exec.c: patch does not apply
error: patch failed: include/drm/drm_exec.h:51
error: include/drm/drm_exec.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/kunit: Avoid a driver uaf
Applying: drm/tests/drm_exec: Add a test for object freeing within drm_exec_fini()
Applying: drm/drm_exec: Work around a WW mutex lockdep oddity
Patch failed at 0003 drm/drm_exec: Work around a WW mutex lockdep oddity
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


