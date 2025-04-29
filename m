Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C022C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 11:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142C10E423;
	Tue, 29 Apr 2025 11:45:35 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9C610E423;
 Tue, 29 Apr 2025 11:45:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/backlight=3A_dro?=
 =?utf-8?q?p_dmesg_suggestion_to_file_bugs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 11:45:35 -0000
Message-ID: <174592713504.24168.4985280538875100412@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429112534.2121656-1-jani.nikula@intel.com>
In-Reply-To: <20250429112534.2121656-1-jani.nikula@intel.com>
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

Series: drm/i915/backlight: drop dmesg suggestion to file bugs
URL   : https://patchwork.freedesktop.org/series/148408/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 04f06a96551196a2da725e9d5258fb7babfe5638
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 29 14:25:34 2025 +0300

    drm/i915/backlight: drop dmesg suggestion to file bugs
    
    Drop the FDO_BUG_URL from the source, and stop suggesting to file bugs
    on DPCD backlight issues. We don't do this anywhere else in display,
    this isn't a special snowflake.
    
    As a consequence, also drop the dependency on i915_utils.h from
    intel_dp_aux_backlight.c.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5752a8bfd947553d8006307e10d1bd5abdfc8039 drm-intel
04f06a965511 drm/i915/backlight: drop dmesg suggestion to file bugs


