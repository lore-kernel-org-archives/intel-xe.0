Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C34C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 21:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC0A10E6AB;
	Tue,  7 Nov 2023 21:01:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3198210E6AB;
 Tue,  7 Nov 2023 21:01:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2F67EA0169;
 Tue,  7 Nov 2023 21:01:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Tue, 07 Nov 2023 21:01:20 -0000
Message-ID: <169939088019.21169.12301721755940601486@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107203032.20115-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231107203032.20115-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv6=2C1/2=5D_Revert_=22FIXME=3A_drm/i915?=
 =?utf-8?q?=3A_xe_dpt_integration=22?=
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

Series: series starting with [v6,1/2] Revert "FIXME: drm/i915: xe dpt integration"
URL   : https://patchwork.freedesktop.org/series/126094/
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
commit 2e554943702ee2c597f9ac7d0291f83b73f6eb52
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Nov 7 22:30:32 2023 +0200

    drm/i915: xe dpt integration
    
    Abstract i915 and Xe dpt related differences. Create
    intel_dpt_common.c where common dpt code go into.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 3b0bded07ef9f00e6120c6856e86e3faf897191f drm-intel
a62d19df0 Revert "FIXME: drm/i915: xe dpt integration"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e417510409165b44ad59bfdbc59cd90316e91dc1', maybe rebased or not pulled?
#6: 
This reverts commit e417510409165b44ad59bfdbc59cd90316e91dc1.

total: 0 errors, 1 warnings, 0 checks, 158 lines checked
2e5549437 drm/i915: xe dpt integration
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:139: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#139: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 215 lines checked


