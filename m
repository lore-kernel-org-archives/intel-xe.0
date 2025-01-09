Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C20E7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 22:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C010E054;
	Thu,  9 Jan 2025 22:33:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54A10E013;
 Thu,  9 Jan 2025 22:33:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Display_Global_Histo?=
 =?utf-8?q?gram_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 22:33:46 -0000
Message-ID: <173646202605.1756021.14431985713009358198@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
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

Series: Display Global Histogram (rev8)
URL   : https://patchwork.freedesktop.org/series/138867/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: cf64efebee4a drm-tip: 2025y-01m-09d-21h-54m-27s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/drm_crtc.c:939
error: drivers/gpu/drm/drm_crtc.c: patch does not apply
error: patch failed: include/drm/drm_crtc.h:1323
error: include/drm/drm_crtc.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm: Define histogram structures exposed to user
Applying: drm: Define ImageEnhancemenT LUT structures exposed to user
Applying: drm/crtc: Expose API to create drm crtc property for histogram
Patch failed at 0003 drm/crtc: Expose API to create drm crtc property for histogram
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


