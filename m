Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B6CDB46B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45795893ED;
	Wed, 11 Oct 2023 17:22:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AB4710E169;
 Wed, 11 Oct 2023 17:22:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 943A4A3ECB;
 Wed, 11 Oct 2023 17:22:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Wed, 11 Oct 2023 17:22:24 -0000
Message-ID: <169704494460.26515.13451388971770964166@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011133119.1257132-1-andrzej.hajda@intel.com>
In-Reply-To: <20231011133119.1257132-1-andrzej.hajda@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_implement_driver_initiated_function-reset?=
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

Series: drm/xe: implement driver initiated function-reset
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
commit 0b9c4e95c871b61c494447a21dbac4f167f41b76
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Wed Oct 11 15:31:18 2023 +0200

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
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 81cbfcc83d65c3c69866f356cb83497a47f9d297 drm-intel
0b9c4e95c drm/xe: implement driver initiated function-reset


