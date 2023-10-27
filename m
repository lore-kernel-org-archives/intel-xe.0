Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26056C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 09:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC66610E969;
	Fri, 27 Oct 2023 09:45:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D26F10E969;
 Fri, 27 Oct 2023 09:45:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5B559A0093;
 Fri, 27 Oct 2023 09:45:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Fri, 27 Oct 2023 09:45:46 -0000
Message-ID: <169839994636.19711.207912356105735012@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027-xe-ups-driver_flr-v4-1-5a169a54624c@intel.com>
In-Reply-To: <20231027-xe-ups-driver_flr-v4-1-5a169a54624c@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_implement_driver_initiated_function-reset_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: implement driver initiated function-reset (rev3)
URL   : https://patchwork.freedesktop.org/series/124976/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b1f5a5de31736cf91e97481a6f5958290b10976d
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Fri Oct 27 11:42:55 2023 +0200

    drm/xe: implement driver initiated function-reset
    
    Driver initiated function-reset (FLR) is the highest level of reset
    that we can trigger from within the driver. In contrast to PCI FLR it
    doesn't require re-enumeration of PCI BAR. It can be useful in case
    GT fails to reset. It is also the only way to trigger GSC reset from
    the driver and can be used in future addition of GSC support.
    
    v2:
      - use regs from xe_regs.h
      - move the flag to xe.mmio
      - call flr only on root gt
      - use BIOS protection check
      - copy/paste comments from i915
    v3:
      - flr code moved to xe_device.c
    v4:
      - needs_flr_on_fini moved to xe_device
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 76d7314ce7ceb58ee595a0ae1ba45bc99b9e277d drm-intel
b1f5a5de3 drm/xe: implement driver initiated function-reset


