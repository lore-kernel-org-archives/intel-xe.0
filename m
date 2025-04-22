Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459DC369CB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 09:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B5910E552;
	Tue, 22 Apr 2025 09:22:51 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20AA10E552;
 Tue, 22 Apr 2025 09:22:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Ensur?=
 =?utf-8?q?e_enough_lines_between_delayed_VBlank_and_VBlank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 09:22:49 -0000
Message-ID: <174531376992.24783.3162205517205668032@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422091746.529878-1-jouni.hogander@intel.com>
In-Reply-To: <20250422091746.529878-1-jouni.hogander@intel.com>
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

Series: drm/i915/display: Ensure enough lines between delayed VBlank and VBlank (rev2)
URL   : https://patchwork.freedesktop.org/series/147935/
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
commit 74fd22d59cbb4beb6bf464eec444e549e5c5e4bd
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Apr 22 12:17:46 2025 +0300

    drm/i915/display: Ensure enough lines between delayed VBlank and VBlank
    
    To deterministically capture the transition of the state machine going from
    SRDOFFACK to IDLE, the delayed V. Blank should be at least one line after
    the non-delayed V. Blank.
    
    Ensure this by following instructions from Bspec.
    
    v2: apply limits only when needed (VRR TG vs. Legacy TG)
    
    Bspec: 69897
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 07a9e9039f712f604032443a9bd9af283d524acc drm-intel
74fd22d59cbb drm/i915/display: Ensure enough lines between delayed VBlank and VBlank


