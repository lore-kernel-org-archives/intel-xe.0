Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE69C71135
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 03:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDC710E0CC;
	Thu, 12 Jun 2025 03:24:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015A210E0CC;
 Thu, 12 Jun 2025 03:24:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_WA_BB_part?=
 =?utf-8?q?_of_LRC_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 03:24:17 -0000
Message-ID: <174969865796.69723.13376466899530464071@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612031925.4009701-1-matthew.brost@intel.com>
In-Reply-To: <20250612031925.4009701-1-matthew.brost@intel.com>
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

Series: drm/xe: Make WA BB part of LRC BO
URL   : https://patchwork.freedesktop.org/series/150127/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8b8a3b9859602a2666975f550851175e66fa272
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jun 11 20:19:25 2025 -0700

    drm/xe: Make WA BB part of LRC BO
    
    No idea why, but without this GuC context switches randomly fail when
    running IGTs in a loop. Need to follow up why this fixes the
    aforementioned issue but can live with a stable driver for now.
    
    Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
    Cc: stable@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b drm-intel
b8b8a3b98596 drm/xe: Make WA BB part of LRC BO


