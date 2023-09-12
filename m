Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4005EE3F3B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 21:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9146410E094;
	Tue, 12 Sep 2023 21:54:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3075D10E094;
 Tue, 12 Sep 2023 21:54:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2DAEDA00E6;
 Tue, 12 Sep 2023 21:54:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 12 Sep 2023 21:54:44 -0000
Message-ID: <169455568418.31793.10128158161843625792@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912195945.7-1-francois.dugast@intel.com>
In-Reply-To: <20230912195945.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Us?=
 =?utf-8?q?e_Xe_assert_macros_instead_of_XE=5FWARN=5FON_macro_=28rev5=29?=
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

Series: Use Xe assert macros instead of XE_WARN_ON macro (rev5)
URL   : https://patchwork.freedesktop.org/series/122906/
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
commit f3ba3cdbfc64efc6d2706361855064bdb1916782
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Sep 12 19:59:45 2023 +0000

    drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
    
    The XE_WARN_ON macro maps to WARN_ON which is not justified
    in many cases where only a simple debug check is needed.
    Replace the use of the XE_WARN_ON macro with the new xe_assert
    macros which relies on drm_*. This takes a struct drm_device
    argument, which is one of the main changes in this commit. The
    other main change is that the condition is reversed, as with
    XE_WARN_ON a message is displayed if the condition is true,
    whereas with xe_assert it is if the condition is false.
    
    v2:
    - Rebase
    - Keep WARN splats in xe_wopcm.c (Matt Roper)
    
    v3:
    - Rebase
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch da184d0771450c366fa6499d42b49eba733a67f8 drm-intel
6ffd2c5c5 drm/xe: Replace XE_WARN_ON with drm_warn when just printing a string
38d4ffc37 drm/xe: Introduce Xe assert macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:40: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#40: 
[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]

-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 177 lines checked
f3ba3cdbf drm/xe: Use Xe assert macros instead of XE_WARN_ON macro


