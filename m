Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0499CEACC1
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 13:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649BB10E627;
	Tue,  1 Oct 2024 13:50:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFD210E633;
 Tue,  1 Oct 2024 13:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Restore_ua?=
 =?utf-8?q?pi_for_access_counting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 13:50:11 -0000
Message-ID: <172779061162.1142067.5275276941353025852@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001135432.447074-1-apoorva.singh@intel.com>
In-Reply-To: <20241001135432.447074-1-apoorva.singh@intel.com>
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

Series: drm/xe/uapi: Restore uapi for access counting
URL   : https://patchwork.freedesktop.org/series/139385/
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
commit ae0262fc54b334abefac69d75fbfc3e5e280b101
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Oct 1 19:24:32 2024 +0530

    drm/xe/uapi: Restore uapi for access counting
    
    In order to enable access counters, this must be enabled in LRC for
    the exec_queue. Add basic uAPI to set configuration of access counter
    trigger threshold and granularity.
    
    When access counters are enabled and threshold is hit, the access
    counter handler in xe_gt_pagefault.c will migrate the buffer to that
    to that GT's local VRAM.
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
+ /mt/dim checkpatch f3f61bfc1cddded910b3916aa2c576a14bf62f71 drm-intel
bc13de7cbeb3 drm/xe: Add support for PTE_NC bit
ae0262fc54b3 drm/xe/uapi: Restore uapi for access counting


