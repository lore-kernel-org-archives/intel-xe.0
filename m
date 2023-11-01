Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3EEC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995D010E738;
	Wed,  1 Nov 2023 15:58:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFA9010E738;
 Wed,  1 Nov 2023 15:58:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BD524ACC21;
 Wed,  1 Nov 2023 15:58:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 01 Nov 2023 15:58:22 -0000
Message-ID: <169885430277.29320.1999735649453654894@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231101151528.1840900-1-lucas.demarchi@intel.com>
In-Reply-To: <20231101151528.1840900-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/i915/lnl=3A_Extend_C10/C20_phy?=
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

Series: series starting with [1/3] drm/i915/lnl: Extend C10/C20 phy
URL   : https://patchwork.freedesktop.org/series/125857/
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
commit bd4863866ad69ee3e519558477679470336c5dd8
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Nov 1 08:15:28 2023 -0700

    fixup! drm/xe/display: Implement display support
+ /mt/dim checkpatch 49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0 drm-intel
ac85f1eef drm/i915/lnl: Extend C10/C20 phy
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e388ae97e225', maybe rebased or not pulled?
#10: 
This reverts the change in commit e388ae97e225 ("drm/i915/display:

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
a0eed618a drm/i915/lnl: Fix check for TC phy
bd4863866 fixup! drm/xe/display: Implement display support
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:18: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked


