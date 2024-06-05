Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A3DC27C50
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 01:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42110E67D;
	Wed,  5 Jun 2024 01:07:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E623F10E665;
 Wed,  5 Jun 2024 01:07:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Ensure_xe=5Fforce=5Fwake?=
 =?utf-8?q?=5Fput_is_always_called_after_xe=5Fforce=5Fwake=5Fget?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 01:07:02 -0000
Message-ID: <171754962294.2266479.10750450950305626897@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604110225.29495-1-nirmoy.das@intel.com>
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
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

Series: Ensure xe_force_wake_put is always called after xe_force_wake_get
URL   : https://patchwork.freedesktop.org/series/134437/
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
commit 27e36d0422974c5d399fedb51d15df6bdcfbc764
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Jun 4 13:02:25 2024 +0200

    drm/xe: Add __must_check for xe_force_wake_get
    
    Return value of xe_force_wake_get()  should not be ignored. So add
    a __must_check attribute. Also add documentation for all related functions.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
b1c5daa081b0 drm/xe/display: Always call xe_force_wake_put/get in pairs
5899b9d41e18 drm/xe/pat: Always call xe_force_wake_put/get in pairs
f2e8caed592b drm/xe/xe_reg_sr: Always call xe_force_wake_put/get in pairs
36f71c9cd5b7 drm/xe/xe_gt: Always call xe_force_wake_put/get in pairs
213648c8182a drm/xe/uc: Always call xe_force_wake_put/get in pairs
2b60a6933f1d drm/xe: Add xe_force_wake_tryget to simplify forcewake handling
18f395ba0f2c drm/xe: Use xe_force_wake_tryget when possible
5a202755c76c drm/xe/client: Check return value of xe_force_wake_get
27e36d042297 drm/xe: Add __must_check for xe_force_wake_get


