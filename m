Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791D3C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 05:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8E10E0EF;
	Thu,  8 Feb 2024 05:38:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B9210E0ED;
 Thu,  8 Feb 2024 05:38:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Xe_OA_Consolidated_D?=
 =?utf-8?q?iffs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 05:38:55 -0000
Message-ID: <170737073543.1088349.13345122559893096559@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208053518.3783805-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240208053518.3783805-1-ashutosh.dixit@intel.com>
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

Series: Xe OA Consolidated Diffs (rev2)
URL   : https://patchwork.freedesktop.org/series/128993/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a942be9b4 drm-tip: 2024y-02m-08d-00h-15m-57s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/xe_oa.c: does not exist in index
error: patch failed: drivers/gpu/drm/xe/xe_query.c:566
error: drivers/gpu/drm/xe/xe_query.c: patch does not apply
error: patch failed: include/uapi/drm/xe_drm.h:1385
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/oa: Combined diff of changes between v8 and v9
Patch failed at 0001 drm/xe/oa: Combined diff of changes between v8 and v9
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


