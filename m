Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEC0E810D0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8276510E4E5;
	Wed, 27 Sep 2023 11:43:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBB0F10E4E4;
 Wed, 27 Sep 2023 11:43:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E3A47AADDD;
 Wed, 27 Sep 2023 11:43:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 27 Sep 2023 11:43:07 -0000
Message-ID: <169581498792.20758.16899295260347714543@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Supporting_CSC_and_SOC_HARDWARE_ERROR_HANDLING_on_PVC?=
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

Series: Supporting CSC and SOC HARDWARE ERROR HANDLING on PVC
URL   : https://patchwork.freedesktop.org/series/124331/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc8ec3c56 drm/xe: Add Wa_18028616096
=== git am output follows ===
Applying: drm/xe: Handle errors from various components.
Applying: drm/xe: Log and count the GT hardware errors.
Applying: drm/xe: Support GT hardware error reporting for PVC.
Applying: drm/xe: Process fatal hardware errors.
Applying: drm/xe: Support GSC hardware error reporting for PVC.
Applying: drm/xe: Notify userspace about GSC HW errors.
Applying: drm/xe: Support SOC FATAL error handling for PVC.
Applying: drm/xe: Support SOC NONFATAL error handling for PVC.
Applying: drm/xe: Handle MDFI error severity.
Applying: drm/xe: Clear SOC CORRECTABLE error registers.
Applying: drm/xe: Clear all SoC errors post warm reset.


