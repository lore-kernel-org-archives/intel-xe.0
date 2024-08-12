Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E52C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 11:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C910E0CD;
	Mon, 12 Aug 2024 11:36:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A10310E0CD;
 Mon, 12 Aug 2024 11:36:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Change_?=
 =?utf-8?q?HPD_to_polling_on_runtime_suspend_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 11:36:02 -0000
Message-ID: <172346256216.594790.14414450220670433734@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812103202.3433041-1-arun.r.murthy@intel.com>
In-Reply-To: <20240812103202.3433041-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: Change HPD to polling on runtime suspend (rev3)
URL   : https://patchwork.freedesktop.org/series/137025/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b65796220e4dd6139328243074ce338281191819
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Aug 12 16:02:02 2024 +0530

    drm/xe/display: Change HPD to polling on runtime suspend
    
    HPD is interrupt based and on runtime suspend change it to polling as
    HPD is not a wakeup event. A worker thread is scheduled for doing this
    polling and it keeps polling for HPD live status on an internval of 10s.
    On runtime resume disable polling and fallback to interrupt mechanism.
    
    v2: move poll_enable() to xe_display(Imre)
    v3: removed un-wanted comments (Jani)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 1daf2018001da75c5522669aebdb68ba9a353ea6 drm-intel
b65796220e4d drm/xe/display: Change HPD to polling on runtime suspend


