Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68955C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 13:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D3610E861;
	Wed,  3 Jul 2024 13:22:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65110E85E;
 Wed,  3 Jul 2024 13:22:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_VF=5FCAP=5F?=
 =?utf-8?q?REG_for_device_wmb?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 13:22:37 -0000
Message-ID: <172001295790.24496.12748343178152791956@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240702183704.1022-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Use VF_CAP_REG for device wmb
URL   : https://patchwork.freedesktop.org/series/135663/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5004de368e665d898c1049106f33a2a552805d61
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jul 2 20:37:04 2024 +0200

    drm/xe: Use VF_CAP_REG for device wmb
    
    To force a write barrier on the device memory, we write to the
    SOFTWARE_FLAGS_SPR33 register, but this particular register was
    selected because it was one of the writable and unused register.
    
    Since a write barrier should also work if we use the read-only
    register, switch to VF_CAP_REG register that is also marked as
    accessible for VFs.
    
    While at it, add simple kernel-doc for xe_device_wmb() function.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 5ca7296d32d5ea4fd002b6adfe05ffda6d654993 drm-intel
6c4157ac8084 drm/xe: Fix register definition order in xe_regs.h
c41fe2167650 drm/xe: Kill regs/xe_sriov_regs.h
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
5004de368e66 drm/xe: Use VF_CAP_REG for device wmb


