Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B74C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF9610E21A;
	Thu, 15 Feb 2024 07:04:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398110E259;
 Thu, 15 Feb 2024 07:04:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_support_for_getting_EDID_o?=
 =?utf-8?q?ver_ACPI_to_DRM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 07:04:48 -0000
Message-ID: <170798068834.12.11448201534956780806@8e613ede5ea5>
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
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
This is probably due to unsatisfied dependencies.
Missing: CONFIG_DRM=y, CONFIG_DRM_FBDEV_EMULATION=y, # CONFIG_DRM_XE_DISPLAY is not set, CONFIG_DRM_XE_KUNIT_TEST=y, CONFIG_DRM_KMS_HELPER=y, CONFIG_DRM_XE=y
Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".
[07:04:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


