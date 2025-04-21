Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFDAC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 15:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F4710E031;
	Mon, 21 Apr 2025 15:40:30 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D310E031;
 Mon, 21 Apr 2025 15:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Documenta?=
 =?utf-8?q?tion_fixes_wrt_kernel_version?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Apr 2025 15:40:28 -0000
Message-ID: <174525002847.22578.2310720836191860218@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
In-Reply-To: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
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

Series: drm/xe/hwmon: Documentation fixes wrt kernel version
URL   : https://patchwork.freedesktop.org/series/148023/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e556ff8c784cb344c9178a99b7d7ef713dcd47d1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Apr 21 08:15:39 2025 -0700

    drm/xe/hwmon: Fix kernel version documentation for fan speed
    
    Wrong copy and paste from other entries: these are starting to be
    supported with 6.16.
    
    Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
    Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4841
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch dc7f23c4cada96925696c13525cad17bdbc3d33e drm-intel
cfca7eb4cca2 drm/xe/hwmon: Fix kernel version documentation for temperature
e556ff8c784c drm/xe/hwmon: Fix kernel version documentation for fan speed


