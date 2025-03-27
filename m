Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F88C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 20:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8410E169;
	Thu, 27 Mar 2025 20:27:36 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B35D10E169;
 Thu, 27 Mar 2025 20:27:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Use_drm=5Fi?=
 =?utf-8?q?nfo_for_hwconfig_missing_message_in_execlist_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 20:27:35 -0000
Message-ID: <174310725524.12748.9226077635052283252@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327202201.15169-1-stuart.summers@intel.com>
In-Reply-To: <20250327202201.15169-1-stuart.summers@intel.com>
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

Series: drm/xe/guc: Use drm_info for hwconfig missing message in execlist mode
URL   : https://patchwork.freedesktop.org/series/146892/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0a58042f936339f349623090b359fcb4e69feb10
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu Mar 27 20:22:01 2025 +0000

    drm/xe/guc: Use drm_info for hwconfig missing message in execlist mode
    
    When running in execlist mode we are explicitly not loading
    the GuC firmware and the GuC is needed to provide the hwconfig
    values. Currently we are printing an error message any time
    we see the hwconfig couldn't be obtained for some reason which
    is breaking the execlist specific CI.
    
    Keep the error message for normal GuC based load, but when
    the module is loaded with force_execlist=1, change this to
    an info print.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d drm-intel
0a58042f9363 drm/xe/guc: Use drm_info for hwconfig missing message in execlist mode
-:31: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#31: FILE: drivers/gpu/drm/xe/xe_gt_mcr.c:350:
+			"GT%u: Slice/Subslice counts missing from hwconfig table; using typical fallback values\n";

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


