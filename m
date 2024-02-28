Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60971C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 17:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA2110E22E;
	Wed, 28 Feb 2024 17:04:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EA110E22E;
 Wed, 28 Feb 2024 17:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/4=5D_devcoredump=3A_Add_dev=5Fcoredump=5Fput=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 17:04:49 -0000
Message-ID: <170913988956.374648.13501626900866191169@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228165709.82089-1-jose.souza@intel.com>
In-Reply-To: <20240228165709.82089-1-jose.souza@intel.com>
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

Series: series starting with [v2,1/4] devcoredump: Add dev_coredump_put()
URL   : https://patchwork.freedesktop.org/series/130518/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 738a3ca47abbe0dd31761a63f004fce31abbb602
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed Feb 28 08:57:09 2024 -0800

    drm/xe: Increase devcoredump timeout
    
    5 minutes is too short for a regular user to search and understand
    what he needs to do to report capture devcoredump and report a bug to
    us, so here increasing this timeout to 1 hour.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 3bdccc6629ee909a167daedd6a8b75f6967ab726 drm-intel
9d3b8a90c9c2 devcoredump: Add dev_coredump_put()
-:75: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#75: FILE: include/linux/devcoredump.h:90:
 }
+static inline void dev_coredump_put(struct device *dev)

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
78c6e4d20b09 devcoredump: Add dev_coredumpm_timeout()
daf6a2541553 drm/xe: Remove devcoredump during driver release
-:62: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#62: FILE: drivers/gpu/drm/xe/xe_devcoredump.h:19:
 }
+static inline int xe_devcoredump_init(struct xe_device *xe)

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
738a3ca47abb drm/xe: Increase devcoredump timeout


