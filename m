Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9941FC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CDC10E3CC;
	Tue, 21 Jul 2026 19:16:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CD10E3CC;
 Tue, 21 Jul 2026 19:16:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_Wa=5F140?=
 =?utf-8?q?26539277?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 19:16:08 -0000
Message-ID: <178466136829.212456.3097575324925910010@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
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

Series: drm/xe: Update Wa_14026539277
URL   : https://patchwork.freedesktop.org/series/170845/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 151011197419c6a5b61d0fb63fc4b608ea6c589e
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Jul 21 16:10:21 2026 -0300

    drm/xe: Add up-to-date implementation for Wa_14026539277
    
    Wa_14026539277 is a temporary workaround that targets only A*
    steppings of NVL-P (the platform, not the graphics IP) and requires
    that we avoid using 2-way coherency for device-cacheable memory
    accesses.  For driver-internal usage, we convert those configurations
    to be device-uncached and 1-way-coherent; on the UAPI side, we reject
    VM_BIND calls that are 2-way-coherent and leave it up to userspace to
    select the alternative option that is most appropriate to their usage.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 80b509f6e34a01edfccc01a05e3e7062a934bcf9 drm-intel
07b5fe5d69cb drm/xe: Extract override_has_cached_pt()
70614ed5046f Revert "drm/xe/nvlp: Implement Wa_14026539277"
151011197419 drm/xe: Add up-to-date implementation for Wa_14026539277
-:98: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#98: FILE: drivers/gpu/drm/xe/xe_pat.c:408:
+					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));

total: 0 errors, 1 warnings, 0 checks, 162 lines checked


