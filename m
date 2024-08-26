Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73BC5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 10:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177E110E116;
	Mon, 26 Aug 2024 10:39:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4692910E116;
 Mon, 26 Aug 2024 10:39:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_move_the_kernel?=
 =?utf-8?q?_lrc_from_hwe_to_execlist_port_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 10:39:52 -0000
Message-ID: <172466879228.783606.11406966201022665625@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826100655.1719060-1-ilia.levi@intel.com>
In-Reply-To: <20240826100655.1719060-1-ilia.levi@intel.com>
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

Series: drm/xe: move the kernel lrc from hwe to execlist port (rev2)
URL   : https://patchwork.freedesktop.org/series/137638/
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
commit 2d41afb1273826c52f41299dd8dcd5ed062309d5
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Mon Aug 26 13:06:55 2024 +0300

    drm/xe: move the kernel lrc from hwe to execlist port
    
    The kernel lrc is used solely by the execlist infra.
    Move it to the execlist port struct and initialize it only when
    execlists are used.
    
    v2: Rebase, improve error handling readability (Jonathan)
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 3180bea570dadc713d6f1cc50662818d684cfb4a drm-intel
2d41afb12738 drm/xe: move the kernel lrc from hwe to execlist port


