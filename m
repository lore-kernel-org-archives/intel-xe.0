Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B8BC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 14:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEB410E082;
	Wed, 16 Sep 2026 14:04:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774D10E082;
 Wed, 16 Sep 2026 14:04:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/nvm=3A_add_surviva?=
 =?utf-8?q?bilty_partiton_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 14:04:33 -0000
Message-ID: <178956747315.171871.8944070152133776057@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
In-Reply-To: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
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

Series: drm/xe/nvm: add survivabilty partiton (rev2)
URL   : https://patchwork.freedesktop.org/series/170493/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1788f3a6d90ea49236c6690d34a94b5a7b520051
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Wed Sep 16 16:58:16 2026 +0300

    drm/xe/nvm: define survivabilty partition
    
    Define 8M survivability partition for CRI when
    storage is open for write override.
    
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch 3b18c5132fd3bbc7e74490b64d814df76edffd60 drm-intel
b85aa4b8e978 mtd: mtd_intel_dg: add survivability partition
-:30: CHECK:LINE_SPACING: Please don't use multiple blank lines
#30: FILE: drivers/mtd/devices/mtd_intel_dg.c:434:
 
+

total: 0 errors, 0 warnings, 1 checks, 111 lines checked
1788f3a6d90e drm/xe/nvm: define survivabilty partition


