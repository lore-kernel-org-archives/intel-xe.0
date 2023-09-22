Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D04DE7D0C9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 05:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F4C10E54C;
	Fri, 22 Sep 2023 05:51:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8157D10E54C;
 Fri, 22 Sep 2023 05:51:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7E126A00E6;
 Fri, 22 Sep 2023 05:51:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Fri, 22 Sep 2023 05:51:04 -0000
Message-ID: <169536186451.5196.988243745210809661@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
In-Reply-To: <20230921111434.3051325-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Xe?=
 =?utf-8?q?_runtime_pm_refactoring_=28rev3=29?=
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

Series: Xe runtime pm refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/123834/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdb4bcfd4f1ed4339d417940f4bf014547002f14
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Sep 21 14:14:34 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    Add xe_runtime_pm struct pointer to xe_device for runtime related macros.
    
    v2: Add xe_runtime_pm struct pointer to xe_device
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 drm-intel
4e466656e Revert "FIXME: drm/i915: runtime pm changes"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '742e449ddca435897eec6d9c21d4d2573b77242d', maybe rebased or not pulled?
#9: 
This reverts commit 742e449ddca435897eec6d9c21d4d2573b77242d.

total: 0 errors, 1 warnings, 0 checks, 75 lines checked
e5006e5ac drm/i915: Remove runtime suspended boolean from intel_runtime_pm struct
069aba4f3 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
cdb4bcfd4 fixup! drm/xe/display: Implement display support


