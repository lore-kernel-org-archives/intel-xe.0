Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A329C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 22:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78510E403;
	Tue, 14 Nov 2023 22:49:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B133A10E403;
 Tue, 14 Nov 2023 22:49:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AF91BA47E9;
 Tue, 14 Nov 2023 22:49:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 14 Nov 2023 22:49:56 -0000
Message-ID: <170000219671.29257.5149611414689970734@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114211233.498338-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231114211233.498338-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Sp?=
 =?utf-8?q?lit_i915-display_and_xe-display_patches?=
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

Series: Split i915-display and xe-display patches
URL   : https://patchwork.freedesktop.org/series/126427/
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
commit 21db7e17b1959fa88f8d7af988d6125dc405089a
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Nov 14 16:12:33 2023 -0500

    fixup! drm/xe/display: Implement display support
+ /mt/dim checkpatch 2fe82053d916d09ffcc92bc27294c9eed4e4804b drm-intel
745e95315 Revert "drm/xe/display: Allow scanout of bos that can be migrated to lmem"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0842f1ee44de01519cb8b7b55716dd87f3b70579', maybe rebased or not pulled?
#7: 
This reverts commit 0842f1ee44de01519cb8b7b55716dd87f3b70579.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:49: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 30 lines checked
ca0240104 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:23: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
21db7e17b fixup! drm/xe/display: Implement display support
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:31: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 19 lines checked


