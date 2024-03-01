Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A83C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E612010E6B8;
	Fri,  1 Mar 2024 18:11:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A510E6B8;
 Fri,  1 Mar 2024 18:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Fix_display_runtime=5Fpm_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 18:11:01 -0000
Message-ID: <170931666194.453024.16171804449865445167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301180526.643505-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240301180526.643505-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: Fix display runtime_pm handling
URL   : https://patchwork.freedesktop.org/series/130625/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4fb9ff4b061f2dac3338f3c397f9234562cfed41
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Mar 1 13:05:25 2024 -0500

    drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
    
    With mem_access going away and pm_runtime getting called instead,
    we need to protect these against recursions.
    
    The put is asynchronous so there's no need to block it. However, for a
    proper balance, we need to ensure that the references are taken and
    restored regardless of the flow. So, let's convert them all to void and
    use some direct linux/pm_runtime functions.
    
    v2: Rebased and update commit message (Matt).
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5f60548dd58e2ad93005c933fd2633d98db60de4 drm-intel
b36d9ddc508e drm/xe: Fix display runtime_pm handling
483c2adb1b45 drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
4fb9ff4b061f drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion


