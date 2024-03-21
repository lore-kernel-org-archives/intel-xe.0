Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7A6C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 23:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5E10FE65;
	Thu, 21 Mar 2024 23:55:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAF110FE65;
 Thu, 21 Mar 2024 23:55:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_mips_and_refactor_LRC?=
 =?utf-8?q?_tables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 23:55:49 -0000
Message-ID: <171106534944.940819.11574261513287941014@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321221726.102193-1-lucas.demarchi@intel.com>
In-Reply-To: <20240321221726.102193-1-lucas.demarchi@intel.com>
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

Series: Fix mips and refactor LRC tables
URL   : https://patchwork.freedesktop.org/series/131454/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82eae17a91336869066cb4d319ec78d1174bc2a7
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Mar 21 15:17:26 2024 -0700

    drm/xe: Let set_offsets() get the per-platform offsets
    
    Instead of doing set_offsets(..., get_offsets()), just let the former
    figure out the proper array to use. This makes it easier to bundle the
    array + size and thus avoid the need for a sentinel.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ad4a10c6d0e21df4bd830c20c96b795ae2d03962 drm-intel
2b8ecfef85fc drm/xe: Fix END redefinition
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 81 lines checked
82eae17a9133 drm/xe: Let set_offsets() get the per-platform offsets
-:314: CHECK:LINE_SPACING: Please don't use multiple blank lines
#314: FILE: drivers/gpu/drm/xe/xe_lrc.c:546:
 
+

total: 0 errors, 0 warnings, 1 checks, 299 lines checked


