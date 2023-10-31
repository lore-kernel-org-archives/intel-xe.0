Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007C3C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 20:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC75010E5BC;
	Tue, 31 Oct 2023 20:21:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AF9710E5BC;
 Tue, 31 Oct 2023 20:21:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 59525AADD1;
 Tue, 31 Oct 2023 20:21:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 31 Oct 2023 20:21:19 -0000
Message-ID: <169878367936.27659.18287617370441084741@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231031185014.1605381-1-matthew.brost@intel.com>
In-Reply-To: <20231031185014.1605381-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Adjust_tile=5Fpresent_mask_when_skipping_rebinds?=
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

Series: drm/xe: Adjust tile_present mask when skipping rebinds
URL   : https://patchwork.freedesktop.org/series/125826/
State : warning

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
commit eb2662a47c30b3bec482499cb81f96e50c3d2576
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Oct 31 11:50:14 2023 -0700

    drm/xe: Adjust tile_present mask when skipping rebinds
    
    If a rebind is skipped the tile_present mask needs to be updated for the
    newly created vma to properly reflect the state of the vma.
    
    Reported-by: <christoph.manszewski@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 76bba03c4f90371e7b2da536b966a49c68d589b0 drm-intel
eb2662a47 drm/xe: Adjust tile_present mask when skipping rebinds
-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#9: 
Reported-by: <christoph.manszewski@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


