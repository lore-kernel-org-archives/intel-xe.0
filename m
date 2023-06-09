Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951E7C7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 19:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6715110E6DA;
	Fri,  9 Jun 2023 19:12:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59F8210E6DA;
 Fri,  9 Jun 2023 19:12:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 56AE8AADE3;
 Fri,  9 Jun 2023 19:12:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@intel.com>
Date: Fri, 09 Jun 2023 19:12:29 -0000
Message-ID: <168633794935.15973.8509438840935370429@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_stolen_memory_size_calculation?=
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

Series: Fix stolen memory size calculation
URL   : https://patchwork.freedesktop.org/series/119160/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65197c27ce8aa3740275d135ed7de3e13e78c9c6
Author: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Date:   Sat Jun 10 00:22:49 2023 +0530

    drm/xe: Fix stolen memory size calculation
    
    The stolen memory base should be derived from GSMBASE or
    FLAT_CCS_BASE_ADDR when flat ccs is applicable.
    
    Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")
    
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
+ /mt/dim checkpatch e24e730ad5d4c3af599fa4e1e05527120adca322 drm-intel
65197c27c drm/xe: Fix stolen memory size calculation
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'acf067c2f5a5', maybe rebased or not pulled?
#9: 
Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


