Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B112CC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFAB10FE66;
	Mon, 18 Mar 2024 19:44:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941C610FE66;
 Mon, 18 Mar 2024 19:44:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/device=3A_fix_drm?=
 =?utf-8?q?=5FWARN=5FON=28=29_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 19:44:57 -0000
Message-ID: <171079109760.886732.10295037552606381068@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318113708.32938-2-matthew.auld@intel.com>
In-Reply-To: <20240318113708.32938-2-matthew.auld@intel.com>
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

Series: drm/xe/device: fix drm_WARN_ON() check
URL   : https://patchwork.freedesktop.org/series/131259/
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
commit 430a07e01b91b00c1c8b0f92210a988f1eb16ba6
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Mar 18 11:37:09 2024 +0000

    drm/xe/device: fix drm_WARN_ON() check
    
    Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
    index should always be less than.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ce8cc731d53f9197a853b0d00386d7835f2b80e6 drm-intel
430a07e01b91 drm/xe/device: fix drm_WARN_ON() check


