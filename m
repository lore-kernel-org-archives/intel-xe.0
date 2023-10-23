Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06469C004C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 16:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4C710E05D;
	Mon, 23 Oct 2023 16:12:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5068C10E05D;
 Mon, 23 Oct 2023 16:12:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4A5BCAADFA;
 Mon, 23 Oct 2023 16:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Date: Mon, 23 Oct 2023 16:12:14 -0000
Message-ID: <169807753430.19839.4180840390697998579@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Supporting_RAS_on_XE?=
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

Series: Supporting RAS on XE
URL   : https://patchwork.freedesktop.org/series/125348/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a0a809501 drm/xe: fix pat[2] programming with 2M/1G pages
=== git am output follows ===
Applying: drm/xe: Handle errors from various components.
Applying: drm/xe: Add new helpers to log hardware errrors.
Applying: drm/xe: Log and count the GT hardware errors.
Applying: drm/xe: Support GT hardware error reporting for PVC.
Applying: drm/xe: Support GSC hardware error reporting for PVC.
Applying: drm/xe: Notify userspace about GSC HW errors.
Applying: drm/xe: Support SOC FATAL error handling for PVC.
Applying: drm/xe: Support SOC NONFATAL error handling for PVC.
Applying: drm/xe: Handle MDFI error severity.
Applying: drm/xe: Clear SOC CORRECTABLE error registers.
Applying: drm/xe: Clear all SoC errors post warm reset.


