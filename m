Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DED4EEB562
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 17:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739F10E0B1;
	Fri,  8 Sep 2023 17:44:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAEEE10E0B1;
 Fri,  8 Sep 2023 17:44:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5F67AADDA;
 Fri,  8 Sep 2023 17:44:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 08 Sep 2023 17:44:21 -0000
Message-ID: <169419506165.14896.13698377524236488998@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908144235.33628-1-gustavo.sousa@intel.com>
In-Reply-To: <20230908144235.33628-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Turn_display_finalizers_into_static_functions_=28rev2=29?=
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

Series: Turn display finalizers into static functions (rev2)
URL   : https://patchwork.freedesktop.org/series/123443/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 92bbb0596 drm/xe/uapi: Remove useless max_page_size
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device.c:344
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_display.c:236
error: drivers/gpu/drm/xe/xe_display.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_display.h:14
error: drivers/gpu/drm/xe/xe_display.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: fixup! drm/xe/display: Implement display support
Patch failed at 0001 fixup! drm/xe/display: Implement display support
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


