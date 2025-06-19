Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2967C7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 02:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4DD10E5D9;
	Thu, 19 Jun 2025 02:41:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508A710E1AF;
 Thu, 19 Jun 2025 02:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe=5Flate=5Fbin?=
 =?utf-8?q?d_squash_for_CI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Jun 2025 02:41:01 -0000
Message-ID: <175030086132.93835.4770767943248604902@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250619023839.2934459-1-badal.nilawar@intel.com>
In-Reply-To: <20250619023839.2934459-1-badal.nilawar@intel.com>
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

Series: drm/xe: xe_late_bind squash for CI (rev3)
URL   : https://patchwork.freedesktop.org/series/150059/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da394a59a7bc1ab8caa2afe60c969628d14c0d1a
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Thu Jun 19 08:08:39 2025 +0530

    drm/xe: xe_late_bind squash for CI
    
    Do not review
    
    Link: https://lore.kernel.org/intel-xe/20250618190007.2932322-1-badal.nilawar@intel.com
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 0cd8ffca03164a8a9686dbab2a21fae671161e58 drm-intel
da394a59a7bc drm/xe: xe_late_bind squash for CI
-:149: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#149: 
new file mode 100644

-:1273: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Alexander Usyskin <alexander.usyskin@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 1147 lines checked


