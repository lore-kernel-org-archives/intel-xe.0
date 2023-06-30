Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C89EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 15:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63FC10E49C;
	Fri, 30 Jun 2023 15:47:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0383710E49C;
 Fri, 30 Jun 2023 15:47:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0025BAADE1;
 Fri, 30 Jun 2023 15:47:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 30 Jun 2023 15:47:44 -0000
Message-ID: <168814006499.24874.10804128969130386557@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630154523.355519-2-matthew.auld@intel.com>
In-Reply-To: <20230630154523.355519-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_handle_TLB_invalidations_from_CT_fast-path?=
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

Series: drm/xe: handle TLB invalidations from CT fast-path
URL   : https://patchwork.freedesktop.org/series/120074/
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
commit 4f510871ecca60c598879e7394d5952449779d6a
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Jun 30 16:45:24 2023 +0100

    drm/xe: handle TLB invalidations from CT fast-path
    
    In various test cases that put the system under a heavy load, we can
    sometimes see errors with missed TLB invalidations. In such cases we see
    the interrupt arrive for the invalidation from the GuC, however the
    actual processing of the completion is pushed onto a workqueue and
    handled with all the other CT stuff, which might take longer than
    expected. Since we expect TLB invalidations to complete within a
    reasonable amount of time (at most ~250ms), and they do seem pretty
    critical, allow handling directly from the CT fast-path.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3b458784c9645681eea7611e571e1ee752bb2bc0 drm-intel
4f510871e drm/xe: handle TLB invalidations from CT fast-path
-:15: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' instead
#15: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297

-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320

-:17: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' instead
#17: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449

total: 0 errors, 3 warnings, 0 checks, 172 lines checked


