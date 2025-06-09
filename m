Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B55C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 20:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288610E1DF;
	Mon,  9 Jun 2025 20:12:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85AB10E1DF;
 Mon,  9 Jun 2025 20:12:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Prune_?=
 =?utf-8?q?modes_for_YUV420?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 20:12:13 -0000
Message-ID: <174949993368.61917.6721291471206499832@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609164548.2878908-1-suraj.kandpal@intel.com>
In-Reply-To: <20250609164548.2878908-1-suraj.kandpal@intel.com>
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

Series: drm/i915/xe3lpd: Prune modes for YUV420
URL   : https://patchwork.freedesktop.org/series/150001/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9f33709234dbb398a59356678ed25e17652a84b2
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Jun 9 22:15:48 2025 +0530

    drm/i915/xe3lpd: Prune modes for YUV420
    
    We only support resolution up to 4k for single pipe when using
    YUV420 format so we prune these modes and restrict the plane size
    at src. This is because pipe scaling will not support YUV420 scaling
    for hwidth > 4096.
    
    --v2
    -Use output format to check [Ville]
    -Add Bspec references
    -Modify commit messge to point to why this is needed
    
    Bspec: 49247, 50441
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
9f33709234db drm/i915/xe3lpd: Prune modes for YUV420


