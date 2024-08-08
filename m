Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE6C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 15:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C4910E775;
	Thu,  8 Aug 2024 15:21:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E8510E775;
 Thu,  8 Aug 2024 15:21:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe_=26_drm/i915=3A_dr?=
 =?utf-8?q?vdata_usage_changes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 15:21:56 -0000
Message-ID: <172313051632.550184.977642779753804502@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1723129920.git.jani.nikula@intel.com>
In-Reply-To: <cover.1723129920.git.jani.nikula@intel.com>
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

Series: drm/xe & drm/i915: drvdata usage changes (rev2)
URL   : https://patchwork.freedesktop.org/series/136622/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79d711d0dcbcf48f73319542e1e05c722c272752
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Aug 8 18:15:55 2024 +0300

    drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()
    
    The display code no longer uses kdev_to_i915() or pdev_to_i915()
    helpers. Remove them.
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9 drm-intel
d39a59e3c6b6 drm/xe/tests: remove unused leftover xe_call_for_each_device()
bce353f119e3 drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
cec96313e490 drm/xe: add kdev_to_xe_device() helper and use it
ab15e9370590 drm/i915: use pdev_to_i915() instead of pci_get_drvdata() directly
e22b7078b8dc drm/i915 & drm/xe: save struct drm_device to drvdata
f1ad668336e0 drm/i915: support struct device and pci_dev in to_intel_display()
7481f9f2e723 drm/i915/audio: migrate away from kdev_to_i915()
3f94c4f9f040 drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
9f3223aff09a drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
79d711d0dcbc drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()


