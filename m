Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7F7C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 09:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98110E6E3;
	Mon, 25 Mar 2024 09:01:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4029910E6C7;
 Mon, 25 Mar 2024 09:01:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe_=3A_avoid_the_risk?=
 =?utf-8?q?y_function_sprintf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 09:01:41 -0000
Message-ID: <171135730126.1035674.6029619667128491121@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
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

Series: drm/xe : avoid the risky function sprintf
URL   : https://patchwork.freedesktop.org/series/131557/
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
commit 63fc518d7cfbd2d5497f2bb887342e6dd222068f
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Sun Dec 10 05:29:49 2023 +0530

    drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()
    
    sprintf() is deprecated for sysfs, use preferred sysfs_emit() instead.
    
    v2: used sysfs_emit instand of sprintf
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 553abc52013db468864e0e89844b58ef1ab8d214 drm-intel
641ee85b26f1 drm/xe: prefer snprintf over sprintf
63fc518d7cfb drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()


