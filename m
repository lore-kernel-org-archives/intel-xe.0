Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E6CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609D710EE99;
	Tue,  9 Apr 2024 20:07:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19735889BE;
 Tue,  9 Apr 2024 20:07:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_devcoredump=3A_Add_dev=5Fcoredump=5Fput=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 20:07:21 -0000
Message-ID: <171269324110.1303388.3772883751224803290@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409200206.108452-1-jose.souza@intel.com>
In-Reply-To: <20240409200206.108452-1-jose.souza@intel.com>
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

Series: series starting with [v4,1/2] devcoredump: Add dev_coredump_put()
URL   : https://patchwork.freedesktop.org/series/132228/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ec99b44fdb843a1a8b50b6b7c6f289b71b82845
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Apr 9 13:02:06 2024 -0700

    drm/xe: Remove devcoredump during driver release
    
    This will remove devcoredump from file system and free its resources
    during driver unload.
    
    This fix the driver unload after gpu hang happened, otherwise this
    it would report that Xe KMD is still in use and it would leave the
    kernel in a state that Xe KMD can't be unload without a reboot.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 7be27f645de2f00384b862d2812a90675e8392fa drm-intel
732fe02e9d87 devcoredump: Add dev_coredump_put()
-:76: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#76: FILE: include/linux/devcoredump.h:90:
 }
+static inline void dev_coredump_put(struct device *dev)

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
4ec99b44fdb8 drm/xe: Remove devcoredump during driver release


