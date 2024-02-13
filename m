Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33AC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 08:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1BE10E364;
	Tue, 13 Feb 2024 08:52:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7D10E364;
 Tue, 13 Feb 2024 08:52:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_arguments_t?=
 =?utf-8?q?o_drm=5Ferr=5Fprinter=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 08:52:51 -0000
Message-ID: <170781437189.1202360.1561313859679279263@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213084954.878643-1-jani.nikula@intel.com>
In-Reply-To: <20240213084954.878643-1-jani.nikula@intel.com>
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

Series: drm/xe: fix arguments to drm_err_printer()
URL   : https://patchwork.freedesktop.org/series/129819/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4790836b4cfd9abf9588f5114baf865982269837
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 13 10:49:54 2024 +0200

    drm/xe: fix arguments to drm_err_printer()
    
    The commit below changed drm_err_printer() arguments, but failed to
    update all places.
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Closes: https://lore.kernel.org/r/20240213120410.75c45763@canb.auug.org.au
    Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device specific by using drm_err()")
    Cc: Luca Coelho <luciano.coelho@intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e370df7a4fb4125cb8eee1b00ff1592808ed9786 drm-intel
4790836b4 drm/xe: fix arguments to drm_err_printer()
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e0c04c8c40b', maybe rebased or not pulled?
#14: 
Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device specific by using drm_err()")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


