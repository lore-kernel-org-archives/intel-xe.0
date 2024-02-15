Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267A9C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC06010E156;
	Thu, 15 Feb 2024 07:04:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3D10E20C;
 Thu, 15 Feb 2024 07:04:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_gett?=
 =?utf-8?q?ing_EDID_over_ACPI_to_DRM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 07:04:16 -0000
Message-ID: <170798065614.12.2824477145936868287@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240214215756.6530-1-mario.limonciello@amd.com>
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
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

Series: Add support for getting EDID over ACPI to DRM
URL   : https://patchwork.freedesktop.org/series/129917/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 16b37f41e drm-tip: 2024y-02m-15d-01h-46m-22s UTC integration manifest
=== git am output follows ===
Applying: drm: Stop using `select ACPI_VIDEO` in all drivers
Applying: drm: Stop using `select BACKLIGHT_CLASS_DEVICE`
Applying: drm: Add support to get EDID from ACPI
Applying: drm/amd: Fetch the EDID from _DDC if available for eDP
Applying: drm/nouveau: Use drm_edid_read_acpi() helper


