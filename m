Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1DEC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 16:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104F10E720;
	Wed, 26 Mar 2025 16:11:46 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDEC10E720;
 Wed, 26 Mar 2025 16:11:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Switch_?=
 =?utf-8?q?from_drm_to_dev_managed_actions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 16:11:45 -0000
Message-ID: <174300550564.5929.18022275458198266238@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326151929.1495972-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250326151929.1495972-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/migrate: Switch from drm to dev managed actions
URL   : https://patchwork.freedesktop.org/series/146811/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 106844f10652ce019e721e631da3e95996a08a93
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Wed Mar 26 20:49:29 2025 +0530

    drm/xe/migrate: Switch from drm to dev managed actions
    
    Change the scope of the migrate subsystem to be dev managed instead of
    drm managed.
    
    The parent pci struct &device, that the xe struct &drm_device is a part
    of, gets removed when a hot unplug is triggered, which causes the
    underlying iommu group to get destroyed as well.
    
    The migrate subsystem, which handles the lifetime of the page-table tree
    (pt) BO, doesn't get a chance to keep the BO back during the hot unplug,
    as all the references to DRM haven't been put back.
    When all the references to DRM are indeed put back later, the migrate
    subsystem tries to put back the pt BO. Since the underlying iommu group
    has been already destroyed, a kernel NULL ptr dereference takes place
    while attempting to keep back the pt BO.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3914
    Suggested-by: Thomas Hellstrom <thomas.hellstrom@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
106844f10652 drm/xe/migrate: Switch from drm to dev managed actions


