Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A7FA3748
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 11:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2BD10ECF9;
	Fri, 13 Sep 2024 11:59:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3285610ECF9;
 Fri, 13 Sep 2024 11:59:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Re-enable_DSB?=
 =?utf-8?q?=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 11:59:34 -0000
Message-ID: <172622877420.996315.4640540057097619328@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913114754.7956-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240913114754.7956-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Re-enable DSB.
URL   : https://patchwork.freedesktop.org/series/138645/
State : success

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
commit bc2c0a589fbfca50a2da84288a3637cba102fbae
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Fri Sep 13 13:47:54 2024 +0200

    drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
    
    This reverts commit c27f010aa1884276ee5dae72034d84987060c769.
    
    After fix from [1] dsb timeout issue is not reproducible on local testing
    with xe driver. Checking CI result to confirm and not for review.
    
    [1] https://patchwork.freedesktop.org/series/130783/
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20240708055630.4058818-1-animesh.manna@intel.com
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch ceffbbae8df33f194ae06e0174dfb0a7d726b2f7 drm-intel
869f7d204352 drm/xe: Fix DSB buffer coherency
bc2c0a589fbf drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"


