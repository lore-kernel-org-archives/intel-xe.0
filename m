Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E73ECDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 04:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA1E888D9;
	Tue, 17 Oct 2023 04:12:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9401D10E058;
 Tue, 17 Oct 2023 04:12:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E9AAAADF5;
 Tue, 17 Oct 2023 04:12:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 17 Oct 2023 04:12:15 -0000
Message-ID: <169751593555.14377.6781945279623576168@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Supporting_RAS_on_XE_=28rev5=29?=
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

Series: Supporting RAS on XE (rev5)
URL   : https://patchwork.freedesktop.org/series/122257/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 9471d9e9e drm/xe/debugfs: Include GFXPIPE commands in LRC dump
=== git am output follows ===
Applying: drm/xe: Handle errors from various components.
Applying: drm/xe: Log and count the GT hardware errors.
Applying: drm/xe: Support GT hardware error reporting for PVC.
Applying: drm/xe: Support GSC hardware error reporting for PVC.
Applying: drm/xe: Notify userspace about GSC HW errors.
Applying: drm/xe: Support SOC FATAL error handling for PVC.
Applying: drm/xe: Support SOC NONFATAL error handling for PVC.
Applying: drm/xe: Handle MDFI error severity.
Applying: drm/xe: Clear SOC CORRECTABLE error registers.
Applying: drm/xe: Clear all SoC errors post warm reset.


