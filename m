Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829DAC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33ACC10E725;
	Thu, 21 Mar 2024 11:20:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9EA10E725;
 Thu, 21 Mar 2024 11:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_issues_repo?=
 =?utf-8?q?rted_by_static_analysis_tool?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 11:20:00 -0000
Message-ID: <171102000059.939783.2537108803612516355@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
In-Reply-To: <20240321104624.2205317-1-karthik.poosa@intel.com>
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

Series: drm/xe: Fix issues reported by static analysis tool
URL   : https://patchwork.freedesktop.org/series/131417/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab74bcb99ef19175fc1915ba59ddc9dda62ff90f
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Mar 21 16:16:24 2024 +0530

    drm/xe/hwmon: Fix static analysis tool reported issues
    
    Update xe hwmon with fixes for issues reported by static analysis
    tool.
    Fix integer overflow with upcasting.
    Initialize uninitialized variables.
    
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 971a18d8ed1d2022dcd268b5bb27b54bf450baa2 drm-intel
167c1e0d4352 drm/xe: Fix static analysis tool reported errors
ab74bcb99ef1 drm/xe/hwmon: Fix static analysis tool reported issues


