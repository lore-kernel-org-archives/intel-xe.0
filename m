Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D887C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883410E156;
	Thu, 15 Feb 2024 07:04:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA610E21A;
 Thu, 15 Feb 2024 07:04:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_getting_E?=
 =?utf-8?q?DID_over_ACPI_to_DRM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 07:04:40 -0000
Message-ID: <170798068086.12.7904885312550924909@8e613ede5ea5>
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

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78f7616ab9408e7f24f3c83952a1daa766d962cd
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Wed Feb 14 15:57:56 2024 -0600

    drm/nouveau: Use drm_edid_read_acpi() helper
    
    Rather than inventing a wrapper to acpi_video_get_edid() use the
    one provided by drm. This fixes two problems:
    1. A memory leak that the memory provided by the ACPI call was
       never freed.
    2. Validation of the BIOS provided blob.
    
    Convert the usage in nouveau_connector_detect_lvds() to use
    struct drm_edid at the same time.
    
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
+ /mt/dim checkpatch 16b37f41eb6fd6e98de452231506d68635fdf0c5 drm-intel
795875288 drm: Stop using `select ACPI_VIDEO` in all drivers
121829c45 drm: Stop using `select BACKLIGHT_CLASS_DEVICE`
4d4d4968c drm: Add support to get EDID from ACPI
af47a128d drm/amd: Fetch the EDID from _DDC if available for eDP
78f7616ab drm/nouveau: Use drm_edid_read_acpi() helper


