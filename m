Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4DDCD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959B410EF2E;
	Wed, 13 May 2026 15:18:58 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4E10EF2E;
 Wed, 13 May 2026 15:18:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_driver_core=3A_remove_sof?=
 =?utf-8?q?tware_node_from_platform_devices_on_device_release_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 15:18:57 -0000
Message-ID: <177868553715.67815.14803125318728470829@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
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

Series: driver core: remove software node from platform devices on device release (rev2)
URL   : https://patchwork.freedesktop.org/series/166515/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8db20e3838dfc27ca2ea634a923958a53289b7a8
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date:   Tue May 12 13:59:29 2026 +0200

    driver core: platform: tests: add test cases for correct swnode removal
    
    Extend the kunit module for platform devices with test cases verifying
    that the same software node can be added to platform devices repeatedly.
    
    Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+ /mt/dim checkpatch 21b42374be17d486baf9392b56377afde67a778d drm-intel
921f5129398c platform/surface: gpe: use platform_device_register_full()
ae2249d5543d driver core: platform: make the swnode check stricter
05309a0ef27e driver core: platform: provide platform_device_add_software_node()
849c3c5b03df drm/xe/i2c: use platform_device_add_software_node()
5de8593ad646 driver core: platform: remove software node on release()
0c3aac4dcdb6 kunit: provide kunit_software_node_register()
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
8db20e3838df driver core: platform: tests: add test cases for correct swnode removal


