Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90DAC52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 10:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D5410E3A7;
	Wed, 14 Aug 2024 10:55:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3965110E3A7;
 Wed, 14 Aug 2024 10:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_NULL_check_?=
 =?utf-8?q?before_deferencing_pointer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 10:55:11 -0000
Message-ID: <172363291122.632575.10851815596119319047@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814101750.857665-1-apoorva.singh@intel.com>
In-Reply-To: <20240814101750.857665-1-apoorva.singh@intel.com>
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

Series: drm/xe: Add NULL check before deferencing pointer
URL   : https://patchwork.freedesktop.org/series/137289/
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
commit 4781a93a11a5eb0f358c9e50454a4bca46f13850
Author: Apoorva Singh <apoorva.singh@intel.com>
Date:   Wed Aug 14 15:47:50 2024 +0530

    drm/xe: Add NULL check before deferencing pointer
    
    - Add NULL check before deferencing of lrc->bo in
      xe_lrc_snapshot_capture()
    
    Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
+ /mt/dim checkpatch 95179e2efd2e2f61d5453d323fdb6e136fc15df6 drm-intel
4781a93a11a5 drm/xe: Add NULL check before deferencing pointer


