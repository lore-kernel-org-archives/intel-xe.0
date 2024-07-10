Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004D6C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 07:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FDC10E689;
	Wed, 10 Jul 2024 07:10:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E2010E67F;
 Wed, 10 Jul 2024 07:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Remove_dup?=
 =?utf-8?q?licate_generated/xe=5Fwa=5Foob=2Eh_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jiapeng Chong" <jiapeng.chong@linux.alibaba.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jul 2024 07:10:16 -0000
Message-ID: <172059541695.88440.3548750476650573945@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710054941.44013-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240710054941.44013-1-jiapeng.chong@linux.alibaba.com>
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

Series: drm/xe: Remove duplicate generated/xe_wa_oob.h header
URL   : https://patchwork.freedesktop.org/series/135927/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 91e2dd7ad2a1 drm-tip: 2024y-07m-10d-06h-28m-49s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:11
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Remove duplicate generated/xe_wa_oob.h header
Patch failed at 0001 drm/xe: Remove duplicate generated/xe_wa_oob.h header
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


