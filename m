Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB83C54757
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899BA10E4EE;
	Wed, 28 Aug 2024 09:25:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D810E4EE;
 Wed, 28 Aug 2024 09:25:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2hpg=3A_Add_Wa?=
 =?utf-8?q?=5F15016589081?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 09:25:09 -0000
Message-ID: <172483710900.809823.7924689156658421770@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828084016.1699041-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240828084016.1699041-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2hpg: Add Wa_15016589081
URL   : https://patchwork.freedesktop.org/series/137889/
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
commit 0b4a86101a43a54ec8de034401086f6da333df0d
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Aug 28 14:10:16 2024 +0530

    drm/xe/xe2hpg: Add Wa_15016589081
    
    Wa_15016589081 applies to xe2_hpg renderCS
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 drm-intel
0b4a86101a43 drm/xe/xe2hpg: Add Wa_15016589081


