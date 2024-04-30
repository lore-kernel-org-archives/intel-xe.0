Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25712C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124910FF97;
	Tue, 30 Apr 2024 16:03:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104810FF97;
 Tue, 30 Apr 2024 16:03:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_sysfs_en?=
 =?utf-8?q?tries_on_driver_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 16:03:04 -0000
Message-ID: <171449298426.1793102.1544724456956746151@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
In-Reply-To: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
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

Series: drm/xe: remove sysfs entries on driver unbind
URL   : https://patchwork.freedesktop.org/series/133080/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e75e0f5f9e92e65921a3e614e53524d7f0fe93bb
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Tue Apr 30 17:51:11 2024 +0200

    drm/xe: remove sysfs entries on driver unbind
    
    After unbinding driver from the device, driver is responsible for
    leaving the device in it's initial state, to be ready to bind to another
    driver or to rebind. Particularly device sysfs entries added by the driver
    should disappear. Removing them together with drm device is too late,
    as it's life-time can be prolonged by userspace keeping open drm
    descriptor. Removing them at driver's unbind seems the proper solution.
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 016b4f46551e7a9b3da9607e546b18df2ca31cbc drm-intel
e75e0f5f9e92 drm/xe: remove sysfs entries on driver unbind


