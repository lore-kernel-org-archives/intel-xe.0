Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72428C369A2
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 05:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3543E10E2F2;
	Wed,  9 Apr 2025 05:57:35 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EA910E2F2;
 Wed,  9 Apr 2025 05:57:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/vrr=3A_Stop_writ?=
 =?utf-8?q?ing_VRR=5FCTL=5FIGN=5FMAX=5FSHIFT_for_MTL_onwards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 05:57:34 -0000
Message-ID: <174417825413.50961.6933549281127921803@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409054909.968531-1-jouni.hogander@intel.com>
In-Reply-To: <20250409054909.968531-1-jouni.hogander@intel.com>
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

Series: drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards
URL   : https://patchwork.freedesktop.org/series/147443/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9c650e0c90556f084217928cecaca4656d81ecbd
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Apr 9 08:49:09 2025 +0300

    drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards
    
    According to Bspec VRR_CTL_IGN_MAX_SHIFT doesn't exist for MTL and
    onwards. On LunarLake and onwards Bit 30 is "Mask Block PkgC" instead. Stop
    writing the bit for MeteorLake and onwards
    
    v2: "Ignore Max Shift" bit doesn't exist on MeteorLake either
    
    Bspec: 68925
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch a49a4787e6bc70296204f4a6e1b0fed3759938cd drm-intel
9c650e0c9055 drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards


