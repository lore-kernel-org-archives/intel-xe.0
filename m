Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDAEC52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 03:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030AE10E4ED;
	Fri, 16 Aug 2024 03:48:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08F610E4ED;
 Fri, 16 Aug 2024 03:48:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_reserved_co?=
 =?utf-8?q?py_engine_for_user_binds_on_faulting_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 03:48:30 -0000
Message-ID: <172378011065.652113.17546907622241801612@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816034033.53837-1-matthew.brost@intel.com>
In-Reply-To: <20240816034033.53837-1-matthew.brost@intel.com>
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

Series: drm/xe: Use reserved copy engine for user binds on faulting devices
URL   : https://patchwork.freedesktop.org/series/137365/
State : success

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
commit f22cd429d4139d65976f4b9db35b604488e9f976
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 15 20:40:33 2024 -0700

    drm/xe: Use reserved copy engine for user binds on faulting devices
    
    User binds map to engines with can fault, faults depend on user binds
    completion, thus we can deadlock. Avoid this by using reserved copy
    engine for user binds on faulting devices.
    
    While we are here, normalize bind queue creation with a helper.
    
    v2:
     - Pass in extensions to bind queue creation (CI)
    v3:
     - s/resevered/reserved (Lucas)
     - Fix NULL hwe check (Jonathan)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a drm-intel
f22cd429d413 drm/xe: Use reserved copy engine for user binds on faulting devices


