Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F281D59D6A
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 20:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEAA10E17B;
	Mon, 25 Nov 2024 20:23:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D102510E17B;
 Mon, 25 Nov 2024 20:23:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Update_xe2=5Fgr?=
 =?utf-8?q?aphics_name_string?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 20:23:57 -0000
Message-ID: <173256623787.2965213.14571524116689979650@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125194838.1190599-2-matthew.d.roper@intel.com>
In-Reply-To: <20241125194838.1190599-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Update xe2_graphics name string
URL   : https://patchwork.freedesktop.org/series/141769/
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
commit 9f8cdf51cbe6f4a671cd7120f01947684866c035
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Nov 25 11:48:39 2024 -0800

    drm/xe: Update xe2_graphics name string
    
    Since both Xe2 and Xe3 platforms currently use the same set of graphics
    IP feature flags, we associate the "graphics_xe2" structure with both IPs.
    Update the name string on that IP structure to clarify this and avoid
    confusion as Xe3 platforms start going into public CI.
    
    Fixes: 800d75bf20ae ("drm/xe/xe3: Define Xe3 feature flags")
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 6510562075d8541c218e72188f9ef339f8ba371f drm-intel
9f8cdf51cbe6 drm/xe: Update xe2_graphics name string


