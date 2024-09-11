Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFBBEE01EE
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 11:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA30810E99E;
	Wed, 11 Sep 2024 11:05:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B720010E99E;
 Wed, 11 Sep 2024 11:05:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pm=3A_Move_xe=5Frp?=
 =?utf-8?q?m=5Flockmap=5Facquire?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 11:05:47 -0000
Message-ID: <172605274774.984268.10592548769863354317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
In-Reply-To: <20240911093026.643605-1-suraj.kandpal@intel.com>
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

Series: drm/xe/pm: Move xe_rpm_lockmap_acquire
URL   : https://patchwork.freedesktop.org/series/138510/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6d3a4ae813dcba09e8870a5044e66af174916f88
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Sep 11 15:00:25 2024 +0530

    drm/xe/pm: Move xe_rpm_lockmap_acquire
    
    Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
    funtions to avoid cirular locking dependency because of locks
    being taken in intel_fbdev, intel_dp_mst_mgr suspend and resume
    functions.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch d597ef70ea92685a59dbad3cc508a9a14cd61636 drm-intel
6d3a4ae813dc drm/xe/pm: Move xe_rpm_lockmap_acquire
-:7: WARNING:TYPO_SPELLING: 'funtions' may be misspelled - perhaps 'functions'?
#7: 
funtions to avoid cirular locking dependency because of locks
^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 52 lines checked


