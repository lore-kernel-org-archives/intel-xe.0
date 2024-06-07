Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5887AC27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 08:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352510EB8F;
	Fri,  7 Jun 2024 08:15:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76410EB8E;
 Fri,  7 Jun 2024 08:15:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915_=26_drm/xe=3A_dr?=
 =?utf-8?q?op_ACPI=5FBUTTON?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 08:15:27 -0000
Message-ID: <171774812732.25680.16128745436402374836@a6498e030952>
X-Patchwork-Hint: ignore
References: <cover.1717747542.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717747542.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: drop ACPI_BUTTON
URL   : https://patchwork.freedesktop.org/series/134595/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5dd4318b50ffe8cf03cbe075d09f9ccc032ff435
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jun 7 11:07:07 2024 +0300

    drm/xe: do not select ACPI_BUTTON
    
    The xe driver has never needed ACPI button. Selecting the kconfig is
    just copy-paste from i915, which no longer needs it either. Stop
    selecting ACPI_BUTTON.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Closes: https://lore.kernel.org/r/ZmGsJsXhHcPV48XJ@intel.com
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch aa33501e41f1050f51632c38f57765d267b3fa09 drm-intel
e7bfc11a45de drm/i915: do not select ACPI_BUTTON
5dd4318b50ff drm/xe: do not select ACPI_BUTTON


