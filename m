Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC800EE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9951D10E080;
	Wed, 23 Aug 2023 11:43:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D89BE10E080;
 Wed, 23 Aug 2023 11:43:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D490EAADE1;
 Wed, 23 Aug 2023 11:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Wed, 23 Aug 2023 11:43:27 -0000
Message-ID: <169279100786.16626.15309450184875183919@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Add_Wa=5F16017236439_=28rev3=29?=
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

Series: drm/xe/pvc: Add Wa_16017236439 (rev3)
URL   : https://patchwork.freedesktop.org/series/121028/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c5be261f4d93187f0579e96c0e3cf3008fe3e4dc
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed Aug 23 04:40:40 2023 -0700

    drm/xe/pvc: Use fast copy engines as migrate engine on PVC
    
    Some copy hardware engine instances are faster than others on PVC.
    Use a virtual engine of these plus the reserved instance for the migrate
    engine on PVC. The idea being if a fast instance is available it will be
    used and the throughput of kernel copies, clears, and pagefault
    servicing will be higher.
    
    v2: Use OOB WA, use all copy engines if no WA is required
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 3a964d06598874329aab6f8db7fd52840135d568 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


