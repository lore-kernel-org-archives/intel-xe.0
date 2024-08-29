Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C3BC83F2E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 14:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153D610E6F8;
	Thu, 29 Aug 2024 14:55:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394D210E6F3;
 Thu, 29 Aug 2024 14:55:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe_=26_drm/i915=3A_dr?=
 =?utf-8?q?vdata_usage_changes_follow-up?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 14:55:20 -0000
Message-ID: <172494332022.832174.16821239412298451026@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724942754.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724942754.git.jani.nikula@intel.com>
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

Series: drm/xe & drm/i915: drvdata usage changes follow-up
URL   : https://patchwork.freedesktop.org/series/137966/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7984eb7be26e3060ed9cc643587bdc80ea4444c3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Aug 29 17:47:48 2024 +0300

    drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()
    
    The display code no longer uses kdev_to_i915() or pdev_to_i915()
    helpers. Remove them.
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7ae5f4b6787d6b8a0ca1ab1f3a71d5bb71783fe2 drm-intel
215fe7ba1687 drm/i915 & drm/xe: save struct drm_device to drvdata
5a168ad05fff drm/i915: support struct device and pci_dev in to_intel_display()
7e5f5e9fc4df drm/i915/audio: migrate away from kdev_to_i915()
a6cc52fd2311 drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
a1e0815941c6 drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
7984eb7be26e drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()


