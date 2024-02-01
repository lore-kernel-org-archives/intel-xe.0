Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F262C47DDF
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 07:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5265410E598;
	Thu,  1 Feb 2024 07:51:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4010E5A0;
 Thu,  1 Feb 2024 07:51:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/Kconfig=3A_Select_?=
 =?utf-8?q?FB=5FCORE_with_FB=5FIOMEM=5FHELPERS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 01 Feb 2024 07:51:27 -0000
Message-ID: <170677388713.894913.7866870348637094753@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201074754.3336-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240201074754.3336-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/Kconfig: Select FB_CORE with FB_IOMEM_HELPERS
URL   : https://patchwork.freedesktop.org/series/129405/
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
commit 9f21dcf2713bbd0a2edeab83c3cd602fce04e96e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 1 08:47:54 2024 +0100

    drm/xe/Kconfig: Select FB_CORE with FB_IOMEM_HELPERS
    
    FB_IOMEM_HELPERS depends on FB_CORE.
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 drm-intel
9f21dcf27 drm/xe/Kconfig: Select FB_CORE with FB_IOMEM_HELPERS
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44e694958b95', maybe rebased or not pulled?
#11: 
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


