Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7633FC83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 22:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6D910E156;
	Wed, 30 Aug 2023 22:55:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3454110E167;
 Wed, 30 Aug 2023 22:55:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3082BAA3D8;
 Wed, 30 Aug 2023 22:55:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 30 Aug 2023 22:55:27 -0000
Message-ID: <169343612719.15234.302327684283637199@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830214719.113454-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230830214719.113454-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm-uapi/xe=5Fdrm=3A_Remove_max=5Fpage=5Fsize_and_align_with?=
 =?utf-8?q?_latest_uapi=2E?=
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

Series: drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.
URL   : https://patchwork.freedesktop.org/series/123082/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4b8fbc13f drm/xe: fix error handling flow when device probing fails
=== git am output follows ===
error: include/drm-uapi/xe_drm.h: does not exist in index
error: tests/xe/xe_query.c: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.
Patch failed at 0001 drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


