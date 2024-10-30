Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEB3D6B6C4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 20:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665F10E7D6;
	Wed, 30 Oct 2024 20:01:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFEC10E7D6;
 Wed, 30 Oct 2024 20:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Fuse_?=
 =?utf-8?q?bit_for_power_management_disable_removed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 20:01:07 -0000
Message-ID: <173031846776.1364543.6184381532755704227@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030195507.2753404-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241030195507.2753404-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/display: Fuse bit for power management disable removed
URL   : https://patchwork.freedesktop.org/series/140735/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b52afa838d16f050580951a778b45400f10fe22e
Author: Clint Taylor <clinton.a.taylor@intel.com>
Date:   Wed Oct 30 12:55:07 2024 -0700

    drm/i915/display: Fuse bit for power management disable removed
    
    Starting with display version 13 the fuse bit to disable Display PM has
    been removed.
    
    v2: Bit removed starting with display version 13 (MattR)
    v3: DG2 still uses this fuse bit (MattR)
    
    BSPEC: 50075, 69464
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch c245557007af0a1c23da00c47732ae1dadda7dd3 drm-intel
b52afa838d16 drm/i915/display: Fuse bit for power management disable removed


