Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CBBCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD3310E480;
	Thu, 12 Oct 2023 09:46:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13E6010E481;
 Thu, 12 Oct 2023 09:46:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11E6CAADD6;
 Thu, 12 Oct 2023 09:46:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Date: Thu, 12 Oct 2023 09:46:48 -0000
Message-ID: <169710400807.25005.10459929103625227759@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012093446.1332238-1-arun.r.murthy@intel.com>
In-Reply-To: <20231012093446.1332238-1-arun.r.murthy@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_Revert_=22FIXME=3A_drm/i915=3A_xe_?=
 =?utf-8?q?doesn=27t_have_fastboot_module_parameter=22?=
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

Series: series starting with [1/2] Revert "FIXME: drm/i915: xe doesn't have fastboot module parameter"
URL   : https://patchwork.freedesktop.org/series/125045/
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
commit 3f0a60dc86a650d6dc3d0729b2cd199486de47c4
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Oct 12 15:04:46 2023 +0530

    drm/i915: Remove the module parameter 'fastboot'
    
    By default fastboot is enabled on all Display 9+ platforms and disabled
    on older platforms. Its not necessary to retain this as a module
    parameter.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230926091157.635438-1-arun.r.murthy@intel.com
    (cherry picked from commit 58883680a8416661b48a800e5530e2efcea64a4a
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
49ffad7bb Revert "FIXME: drm/i915: xe doesn't have fastboot module parameter"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3c73fdaf8f58b55b0e292fec0929b6502c2b3a3e', maybe rebased or not pulled?
#9: 
This reverts commit 3c73fdaf8f58b55b0e292fec0929b6502c2b3a3e.

-:32: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 16 lines checked
3f0a60dc8 drm/i915: Remove the module parameter 'fastboot'


