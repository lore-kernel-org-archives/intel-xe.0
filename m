Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D1C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 11:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175C10E8D8;
	Thu, 11 Jan 2024 11:22:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0CE10E8D8;
 Thu, 11 Jan 2024 11:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_display_support?=
 =?utf-8?q?_should_not_depend_on_EXPERT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Thu, 11 Jan 2024 11:22:09 -0000
Message-ID: <170497212931.271298.16781504254126615026@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111104716.3548744-1-jani.nikula@intel.com>
In-Reply-To: <20240111104716.3548744-1-jani.nikula@intel.com>
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

Series: drm/xe: display support should not depend on EXPERT
URL   : https://patchwork.freedesktop.org/series/128648/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9b662af5259f4ddaac4101a7ce4ecdfe606f08b7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jan 11 12:47:16 2024 +0200

    drm/xe: display support should not depend on EXPERT
    
    Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
    presume the idea was only experts should be able to disable it, but the
    effect is the opposite.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 79184e72263e91528195db01783148435c7e4fad drm-intel
9b662af52 drm/xe: display support should not depend on EXPERT
-:11: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#11: 
Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


