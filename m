Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B9C02199
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 12:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B0410EAFF;
	Fri,  7 Feb 2025 12:43:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00E410EAF0;
 Fri,  7 Feb 2025 12:43:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_move_hdc?=
 =?utf-8?q?p_debugfs_to_intel=5Fhdcp=2Ec=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 12:43:16 -0000
Message-ID: <173893219690.2638528.1434604186654338223@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738924826.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738924826.git.jani.nikula@intel.com>
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

Series: drm/i915/hdcp: move hdcp debugfs to intel_hdcp.c, cleanups
URL   : https://patchwork.freedesktop.org/series/144492/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcffab506860133af1781322b205373d943e3cb8
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 7 12:58:38 2025 +0200

    drm/i915/hdcp: Make some functions static
    
    With the debugfs implementation moved next to the implementation, we no
    longer need to expose some of the functions. Make them static.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a05904055d959d068edd472132e9e4939888832d drm-intel
8e76663aecd8 drm/i915/hdcp: Move HDCP debugfs to intel_hdcp.c
ec1b098849bb drm/i915/hdcp: rename intel_connector to connector
9f20b8ee46e3 drm/i915/hdcp: Convert platform checks to use display->platform
fcffab506860 drm/i915/hdcp: Make some functions static


