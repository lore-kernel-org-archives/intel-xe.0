Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C91C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 14:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3FD10E8B0;
	Fri,  1 Dec 2023 14:02:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D309110E8B1;
 Fri,  1 Dec 2023 14:02:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE1E4AADEB;
 Fri,  1 Dec 2023 14:02:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 01 Dec 2023 14:02:12 -0000
Message-ID: <170143933271.19689.823827615648118056@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231201134133.3356433-1-jouni.hogander@intel.com>
In-Reply-To: <20231201134133.3356433-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_FIXME=3A_drm/i915/display=3A_Remaining_changes_to_make_xe_?=
 =?utf-8?q?compile?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
URL   : https://patchwork.freedesktop.org/series/127193/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 23efb56232a70ed039ae36203fe9f90fc8a54a78
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Dec 1 15:41:33 2023 +0200

    fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
    
    Remove bunch of unnecessary changes from the hack patch.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a8b405ffc0326c79abf737389d99c290648f381d drm-intel
23efb5623 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile


