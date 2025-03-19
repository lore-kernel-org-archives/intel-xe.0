Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD06C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 12:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C810E353;
	Wed, 19 Mar 2025 12:23:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AAC10E355;
 Wed, 19 Mar 2025 12:23:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_sysfs=5Fops_nee?=
 =?utf-8?q?ds_to_be_defined_on_parent_directory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 12:23:03 -0000
Message-ID: <174238698346.53530.11844149538283304985@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250319121349.288844-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: sysfs_ops needs to be defined on parent directory
URL   : https://patchwork.freedesktop.org/series/146486/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d4d30a8706fce591facf2817fe90f603fb33f829
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Mar 19 17:43:49 2025 +0530

    drm/xe: sysfs_ops needs to be defined on parent directory
    
    Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops
    on wrong directory. Sysfs_ops needs to be defined on immediate
    parent directory to be able to called on each attribute set/get.
    
    Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
d4d30a8706fc drm/xe: sysfs_ops needs to be defined on parent directory


