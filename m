Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10872C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76B010E165;
	Wed, 26 Jun 2024 21:35:11 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777E610E165;
 Wed, 26 Jun 2024 21:35:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mcr=3A_Avoid_clobb?=
 =?utf-8?q?ering_DSS_steering?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 21:35:10 -0000
Message-ID: <171943771048.162559.181623992610013008@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626210536.1620176-2-matthew.d.roper@intel.com>
In-Reply-To: <20240626210536.1620176-2-matthew.d.roper@intel.com>
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

Series: drm/xe/mcr: Avoid clobbering DSS steering
URL   : https://patchwork.freedesktop.org/series/135452/
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
commit 09dc01cdea55369858e98573cf9f4d02cfab6e7e
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Jun 26 14:05:37 2024 -0700

    drm/xe/mcr: Avoid clobbering DSS steering
    
    A couple copy/paste mistakes in the code that selects steering targets
    for OADDRM and INSTANCE0 unintentionally clobbered the steering target
    for DSS ranges in some cases.
    
    The OADDRM/INSTANCE0 values were also not assigned as intended, although
    that mistake wound up being harmless since the desired values for those
    specific ranges were '0' which the kzalloc of the GT structure should
    have already taken care of implicitly.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 39235fee2ef6c0933097ee921c86a676dba72ada drm-intel
09dc01cdea55 drm/xe/mcr: Avoid clobbering DSS steering


