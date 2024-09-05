Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E303ECD5BC9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 15:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30A10E8FD;
	Thu,  5 Sep 2024 15:06:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395110E8FD;
 Thu,  5 Sep 2024 15:06:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Implement_devic?=
 =?utf-8?q?e_shutdown_to_make_kexec_work=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 15:06:47 -0000
Message-ID: <172554880720.951199.6700876222139502529@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Implement device shutdown to make kexec work.
URL   : https://patchwork.freedesktop.org/series/138270/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0e2006c89822f4040993e2f43c52e28b900b3e90
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Sep 5 17:00:52 2024 +0200

    CI-only: Test if FLR is disabled?
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 883d811c2bfc8544bc5b00bbee84e6b83e20a581 drm-intel
99115deaf72c drm/xe: Fix missing conversion to xe_display_pm_runtime_resume
93f65cfe8eae drm/xe: Remove runtime argument from display s/r functions
-:105: CHECK:LINE_SPACING: Please don't use multiple blank lines
#105: FILE: drivers/gpu/drm/xe/display/xe_display.c:435:
+
+

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
151e207f6105 drm/xe: Wire up device shutdown handler
-:14: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#14: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3500

total: 0 errors, 1 warnings, 0 checks, 162 lines checked
0e2006c89822 CI-only: Test if FLR is disabled?
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


