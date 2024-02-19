Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFBC48260
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 04:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C9010E078;
	Mon, 19 Feb 2024 04:31:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA6410E0D1;
 Mon, 19 Feb 2024 04:31:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Disable_compact?=
 =?utf-8?q?_64k_PDEs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Feb 2024 04:31:34 -0000
Message-ID: <170831709464.89173.14647099333078520275@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219042844.3589412-1-matthew.brost@intel.com>
In-Reply-To: <20240219042844.3589412-1-matthew.brost@intel.com>
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

Series: drm/xe: Disable compact 64k PDEs
URL   : https://patchwork.freedesktop.org/series/130060/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 406e95959c653dd00bbaea35a2d392cfaa3f9aa0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Feb 18 20:28:44 2024 -0800

    drm/xe: Disable compact 64k PDEs
    
    Feature does not seem to be working...
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cb7db7997fcacd6792fd2fd6e9e93309a408587a drm-intel
406e95959 drm/xe: Disable compact 64k PDEs
-:27: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#27: FILE: drivers/gpu/drm/xe/xe_pt.c:552:
+#if 0

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


