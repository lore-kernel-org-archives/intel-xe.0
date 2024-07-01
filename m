Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118C1C3065A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 20:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D632110E437;
	Mon,  1 Jul 2024 20:27:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEB10E437;
 Mon,  1 Jul 2024 20:27:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Demote_GuC_?=
 =?utf-8?q?IDs_usage_message_to_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 20:27:24 -0000
Message-ID: <171986564420.3639.8083801053749840792@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701193030.978-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240701193030.978-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Demote GuC IDs usage message to debug
URL   : https://patchwork.freedesktop.org/series/135613/
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
commit 185c52f22faeb29dec015d40d0e3a53265c7ab72
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jul 1 21:30:30 2024 +0200

    drm/xe/guc: Demote GuC IDs usage message to debug
    
    Printing message at INFO level about available GuC IDs is not that
    important, DEBUG level is enough. It will also match message about
    available doorbells:
    
     [ ] xe ... [drm:xe_guc_id_mgr_init [xe]] GT0: using 65535 GuC IDs
     [ ] xe ... [drm:xe_guc_db_mgr_init [xe]] GT0: using 256 doorbells
    
    While at it, use proper "GuC" name.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
185c52f22fae drm/xe/guc: Demote GuC IDs usage message to debug


