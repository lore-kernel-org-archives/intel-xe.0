Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25A7C3DA63
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 05:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496510E0CA;
	Fri, 26 Jul 2024 05:26:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B3910E0CA;
 Fri, 26 Jul 2024 05:26:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Faster_devcored?=
 =?utf-8?q?ump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 05:26:02 -0000
Message-ID: <172197156255.384703.9941820597449445964@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726052101.2069493-1-matthew.brost@intel.com>
In-Reply-To: <20240726052101.2069493-1-matthew.brost@intel.com>
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

Series: drm/xe: Faster devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/136545/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c955cb2161af35d5c30f55b77f6ab239f3153687
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 25 22:21:01 2024 -0700

    drm/xe: Faster devcoredump
    
    The current algorithm to read out devcoredump is O(N*N) where N is the
    size of coredump due to usage of the drm_coredump_printer in
    xe_devcoredump_read. Switch to a O(N) algorithm which prints the
    devcoredump into a readable format in snapshot work and update
    xe_devcoredump_read to memcpy from the readable format directly.
    
    v2:
     - Fix double free on devcoredump removal (Testing)
     - Set read_data_size after snap work flush
     - Adjust remaining in iterator upon realloc (Testing)
     - Set read_data upon realloc (Testing)
    
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch edd84625d093bb52bfb1c0c6feb12cff308d81b7 drm-intel
c955cb2161af drm/xe: Faster devcoredump


