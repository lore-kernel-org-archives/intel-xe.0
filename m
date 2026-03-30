Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B8E10F3DCD
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 14:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930C10E78F;
	Mon, 30 Mar 2026 14:24:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7610E78F;
 Mon, 30 Mar 2026 14:23:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_fi?=
 =?utf-8?q?nish_switching_to_common_step=2Eh_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 14:23:58 -0000
Message-ID: <177488063840.412829.919350359361169076@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774875688.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774875688.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: finish switching to common step.h header
URL   : https://patchwork.freedesktop.org/series/164085/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6ba6e2c0e6e9b2b6b16f363ded99812e79b6e57d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Mar 30 16:02:36 2026 +0300

    drm/i915/display: switch to including common step file directly
    
    Instead of using the proxy intel_step.h in display, just include the
    common step file directly where needed. This allows us to remove the
    compat intel_step.h header.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8c24b61314434b46cbe4da73f10bce90b0ea45d6 drm-intel
59f811d7e592 drm/xe/step: switch to the shared step definitions with i915
5e71c5184812 drm/xe/step: switch from enum xe_step to intel_step naming
6ba6e2c0e6e9 drm/i915/display: switch to including common step file directly
-:272: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#272: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 181 lines checked


