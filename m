Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE85E77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C15410E1BC;
	Sat, 30 Sep 2023 05:27:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B118110E1BD;
 Sat, 30 Sep 2023 05:27:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AEBE0A00CC;
 Sat, 30 Sep 2023 05:27:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sat, 30 Sep 2023 05:27:38 -0000
Message-ID: <169605165871.19040.3598603608713926262@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
In-Reply-To: <20230929213640.3189912-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe?=
 =?utf-8?q?2=3A_mocs_and_blitter_commands_=28rev3=29?=
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

Series: xe2: mocs and blitter commands (rev3)
URL   : https://patchwork.freedesktop.org/series/124428/
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
commit aeb5fdaa38195563b49c0558372ede2c8316b302
Author: Haridhar Kalvala <haridhar.kalvala@intel.com>
Date:   Fri Sep 29 14:36:40 2023 -0700

    drm/xe/xe2: Update MOCS fields in blitter instructions
    
    Xe2 changes or adds bits for mocs in a few BLT instructions:
    XY_CTRL_SURF_COPY_BLT, XY_FAST_COLOR_BLT, XY_FAST_COPY_BLT, and MEM_SET.
    Modify the code to deal with the new location. Unlike Xe1, the MOCS
    field in those instructions is only the MOCS index and not the
    Structure_MEMORY_OBJECT_CONTROL_STATE anymore. The pxp bit is now
    explicitly documented separately.
    
    Bspec: 57567,57566,57565,57562
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 22fcf2404f56a8e7aea6734298e0b2b265136313 drm-intel
fa640075c drm/xe: Adjust mocs field mask definitions
cb512308f drm/xe: Rename MEM_SET instruction
fd8d30e4f drm/xe/xe2: Set tile y type in XY_FAST_COPY_BLT to Tile4
aeb5fdaa3 drm/xe/xe2: Update MOCS fields in blitter instructions


