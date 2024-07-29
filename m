Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A43C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 14:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DCF10E401;
	Mon, 29 Jul 2024 14:44:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4912810E401;
 Mon, 29 Jul 2024 14:44:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe_=26_drm/i915=3A_dr?=
 =?utf-8?q?vdata_usage_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 14:44:12 -0000
Message-ID: <172226425229.424799.3433889669004589583@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722263308.git.jani.nikula@intel.com>
In-Reply-To: <cover.1722263308.git.jani.nikula@intel.com>
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

Series: drm/xe & drm/i915: drvdata usage changes
URL   : https://patchwork.freedesktop.org/series/136622/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3108b2b40325d672d1987331bc732b8ba13fb1b3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Jul 29 17:30:11 2024 +0300

    drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()
    
    The display code no longer uses kdev_to_i915() or pdev_to_i915()
    helpers. Remove them.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ec9c8ca911f54dec90f736f284b7128668deeb0d drm-intel
2e0477d8ddac drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
a817de2cd301 drm/xe: add kdev_to_xe_device() helper and use it
5606dfaf8d59 drm/xe/tests: fix drvdata usage
2acec605b1ae drm/i915: use pdev_to_i915() instead of pci_get_drvdata() directly
08bfb5172301 drm/i915 & drm/xe: save struct drm_device to drvdata
4b5c44425fdb drm/i915: support struct device and pci_dev in to_intel_display()
52c98f28564e drm/i915/audio: migrate away from kdev_to_i915()
4c50697c7176 drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
529630bf4dfc drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
3108b2b40325 drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()


