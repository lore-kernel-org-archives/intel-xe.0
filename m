Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D661C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 13:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1F710E54D;
	Wed, 15 Nov 2023 13:20:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 654F710E54D;
 Wed, 15 Nov 2023 13:20:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6361AA3ECB;
 Wed, 15 Nov 2023 13:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Wed, 15 Nov 2023 13:20:56 -0000
Message-ID: <170005445640.647.11803870518428165807@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231115073804.1861-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe=3A_Add_device_flag_to_indic?=
 =?utf-8?q?ate_SR-IOV_support_=28rev2=29?=
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

Series: series starting with [1/3] drm/xe: Add device flag to indicate SR-IOV support (rev2)
URL   : https://patchwork.freedesktop.org/series/126445/
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
commit a03e1579fe57e7ef9b46979bf71423764f786180
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Nov 15 08:38:04 2023 +0100

    drm/xe: Print virtualization mode during probe
    
    We already print some basic information about the device, add
    virtualization information, until we expose that elsewhere.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 14d1d786caacdb3438d07ab86fabf2e36c8151cc drm-intel
7aeb927f3 drm/xe: Add device flag to indicate SR-IOV support
6846f0bcb drm/xe: Prepare for running in different SR-IOV modes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe' - possible side-effects?
#185: FILE: drivers/gpu/drm/xe/xe_sriov.h:40:
+#define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))

-:219: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#219: FILE: drivers/gpu/drm/xe/xe_sriov_types.h:26:
+};
+static_assert(XE_SRIOV_MODE_NONE);

total: 0 errors, 1 warnings, 2 checks, 168 lines checked
a03e1579f drm/xe: Print virtualization mode during probe


