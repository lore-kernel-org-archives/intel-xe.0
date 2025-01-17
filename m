Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1DFC02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 16:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59810EB26;
	Fri, 17 Jan 2025 16:23:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DEA10EB39;
 Fri, 17 Jan 2025 16:23:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/dp=3A_Fix_non-disp?=
 =?utf-8?q?lay_builds_with_DP_tunnelling_incorrectly_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 16:23:45 -0000
Message-ID: <173713102561.787814.5739414869403104380@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117153843.1312303-1-imre.deak@intel.com>
In-Reply-To: <20250117153843.1312303-1-imre.deak@intel.com>
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

Series: drm/xe/dp: Fix non-display builds with DP tunnelling incorrectly enabled
URL   : https://patchwork.freedesktop.org/series/143677/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c217dcba41e5566690925104409856b910f1c072
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Jan 17 17:38:43 2025 +0200

    drm/xe/dp: Fix non-display builds with DP tunnelling incorrectly enabled
    
    Code for the DP tunnelling functionality in the xe driver can be
    built only if the display code is also built, adjust the kconfig
    dependency accordingly.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Fixes: 73900dce57e4 ("drm/xe/dp: Enable DP tunneling")
    Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 9033a16532f74ae36c48d729d0855a6e189039df drm-intel
c217dcba41e5 drm/xe/dp: Fix non-display builds with DP tunnelling incorrectly enabled
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


