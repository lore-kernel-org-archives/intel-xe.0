Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA04C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 00:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508F210E284;
	Tue, 27 Aug 2024 00:58:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3C10E284;
 Tue, 27 Aug 2024 00:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Replace_xe=5Fde?=
 =?utf-8?q?vice=5Fwmb_by_wmb?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 00:58:40 -0000
Message-ID: <172472032008.786053.4733227922208563860@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
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

Series: drm/xe: Replace xe_device_wmb by wmb
URL   : https://patchwork.freedesktop.org/series/137818/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ec9011583c4c7a56167fddf2488c4cd8d24a6d1
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Aug 26 16:41:00 2024 -0700

    drm/xe: Replace xe_device_wmb by wmb
    
    CI ONLY for now
    
    In xe_device_wmb(), it is not clear what the purpose of register write
    following wmb() is. Replace xe_device_wmb() with just wmb() to see if we
    see any failures in CI.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 0f7dbe16a23882ef9c928d9650ea0613925e710b drm-intel
0ec9011583c4 drm/xe: Replace xe_device_wmb by wmb
-:65: WARNING:MEMORY_BARRIER: memory barrier without comment
#65: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:599:
+	wmb();

-:78: WARNING:MEMORY_BARRIER: memory barrier without comment
#78: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:702:
+	wmb();

-:91: WARNING:MEMORY_BARRIER: memory barrier without comment
#91: FILE: drivers/gpu/drm/xe/xe_migrate.c:1301:
+	wmb();

-:104: WARNING:MEMORY_BARRIER: memory barrier without comment
#104: FILE: drivers/gpu/drm/xe/xe_vm.c:3190:
+			wmb();

total: 0 errors, 4 warnings, 0 checks, 64 lines checked


