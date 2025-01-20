Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08BC02181
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 23:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E377410E4A2;
	Mon, 20 Jan 2025 23:39:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBCE10E4A2;
 Mon, 20 Jan 2025 23:39:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Fix_migratio?=
 =?utf-8?q?n_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 23:39:57 -0000
Message-ID: <173741639791.2361266.10310101692046245026@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120232443.544-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250120232443.544-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix migration initialization
URL   : https://patchwork.freedesktop.org/series/143765/
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
commit 59e603718b34f02cd69d4fcafe1d8fcc89dc56f3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jan 21 00:24:43 2025 +0100

    drm/xe/pf: Fix migration initialization
    
    The migration support only needs to be initialized once, but it
    was incorrectly called from the xe_gt_sriov_pf_init_hw(), which
    is part of the reset flow and may be called multiple times.
    
    Fixes: d86e3737c7ab ("drm/xe/pf: Add functions to save and restore VF GuC state")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch fb87b4e061d1844beaca66c8446cfcf60db99a23 drm-intel
59e603718b34 drm/xe/pf: Fix migration initialization


