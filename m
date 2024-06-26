Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CAC30659
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 20:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3D10E071;
	Wed, 26 Jun 2024 20:19:10 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1377F10E071;
 Wed, 26 Jun 2024 20:19:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Remove_spur?=
 =?utf-8?q?ious_line_feed_in_debug_print?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 20:19:09 -0000
Message-ID: <171943314907.162447.11360450897982323992@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240626201206.1433-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Remove spurious line feed in debug print
URL   : https://patchwork.freedesktop.org/series/135447/
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
commit 6d3c5cbfedc688b8e415449b252fe8d3c5f3ee4d
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Jun 26 22:12:06 2024 +0200

    drm/xe/guc: Remove spurious line feed in debug print
    
    Including line feeds at the start of a debug print messes up the
    output when sent to dmesg. The break actually appears between all the
    usefu prefix information and the actual string being printed. In this
    case, each block of data has a very clear start line and an extra
    delimeter is really not necessary. So don't do it.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 39235fee2ef6c0933097ee921c86a676dba72ada drm-intel
6d3c5cbfedc6 drm/xe/guc: Remove spurious line feed in debug print


