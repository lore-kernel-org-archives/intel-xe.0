Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D316C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFF510E5D1;
	Fri, 16 Aug 2024 08:10:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C49F10E5D1;
 Fri, 16 Aug 2024 08:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_NULL_che?=
 =?utf-8?q?ck_of_lrc-=3Ebo_in_xe=5Flrc=5Fsnapshot=5Fcapture=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Singh, Apoorva" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 08:10:16 -0000
Message-ID: <172379581611.652113.1627959184864882834@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816080355.897256-1-apoorva.singh@intel.com>
In-Reply-To: <20240816080355.897256-1-apoorva.singh@intel.com>
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

Series: drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture() (rev2)
URL   : https://patchwork.freedesktop.org/series/137367/
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
commit 6a6be47e672d364f4e8e231f1f7292f2755c6a96
Author: Apoorva Singh <apoorva.singh@intel.com>
Date:   Fri Aug 16 13:33:55 2024 +0530

    drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()
    
    - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
      its already been taken care of in xe_lrc_init().
    
    Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
+ /mt/dim checkpatch 458d8703f0ee799c7d067bcaeb36d5d525a180b3 drm-intel
6a6be47e672d drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()


