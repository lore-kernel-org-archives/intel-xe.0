Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A3C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 12:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9310E8B2;
	Thu, 27 Mar 2025 12:29:54 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421BE10E8B2;
 Thu, 27 Mar 2025 12:29:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hw=5Fengine=3A_def?=
 =?utf-8?q?ine_sysfs=5Fops_on_all_directories?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 12:29:53 -0000
Message-ID: <174307859327.11461.5342043601066100816@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327122647.886637-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250327122647.886637-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/hw_engine: define sysfs_ops on all directories
URL   : https://patchwork.freedesktop.org/series/146863/
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
commit a41467a55fbd28afc93d027822355a5d62307726
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Mar 27 17:56:47 2025 +0530

    drm/xe/hw_engine: define sysfs_ops on all directories
    
    Sysfs_ops needs to be defined on all directories which
    can have attr files with set/get method. Add sysfs_ops
    to even those directories which is currently empty but
    would have attr files with set/get method in future.
    Leave .default with default sysfs_ops as it will never
    have setter method.
    
    V2(Himal/Rodrigo):
     - use single sysfs_ops for all dir and attr with set/get
     - add default ops as ./default does not need runtime pm at all
    
    Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def drm-intel
a41467a55fbd drm/xe/hw_engine: define sysfs_ops on all directories


