Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B3BC001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 16:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5C610E167;
	Tue, 25 Jul 2023 16:01:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 190B110E167;
 Tue, 25 Jul 2023 16:01:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 154BFAADF1;
 Tue, 25 Jul 2023 16:01:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 25 Jul 2023 16:01:46 -0000
Message-ID: <169030090608.27668.6590746800750490248@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_error_paths_of_=5F=5Fxe=5Fbo=5Fcreate=5Flocked?=
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

Series: drm/xe: Fix error paths of __xe_bo_create_locked
URL   : https://patchwork.freedesktop.org/series/121321/
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
commit 9c8c2fbe06ec53eca35adb48d1bce6eb65d845d4
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Jul 25 17:12:39 2023 +0200

    drm/xe: Fix error paths of __xe_bo_create_locked
    
    ttm_bo_init_reserved() calls the destroy() callback if it fails.
    
    Because of this, __xe_bo_create_locked is required to be responsible
    for freeing the bo even when it's passed in as argument.
    
    Additionally, if the placement check fails, the bo was kept alive.
    Fix it too.
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch c7ed768399f6a4769bc4c18f92605d14201b0793 drm-intel
9c8c2fbe0 drm/xe: Fix error paths of __xe_bo_create_locked
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


