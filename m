Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D06DC25B79
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 13:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033210E357;
	Thu, 23 May 2024 13:46:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726E810E357;
 Thu, 23 May 2024 13:46:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_amd=2C_i915=2C_xe=3A_drop?=
 =?utf-8?q?_redundant_warnings_from_driver_makefiles?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 13:46:06 -0000
Message-ID: <171647196646.2169849.1986072924916128230@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716471145.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716471145.git.jani.nikula@intel.com>
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

Series: amd, i915, xe: drop redundant warnings from driver makefiles
URL   : https://patchwork.freedesktop.org/series/133966/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9625a7334f8eec22059cea481a2473fea126906b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu May 23 16:37:07 2024 +0300

    drm/amdgpu: drop redundant W=1 warnings from Makefile
    
    Since commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
    across the subsystem"), most of the extra warnings in the driver
    Makefile are redundant. Remove them.
    
    Note that -Wmissing-declarations and -Wmissing-prototypes are always
    enabled by default in scripts/Makefile.extrawarn.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8e768c3e813ab5519a85997b622edc9a2f79c083 drm-intel
0949418cd03e drm/i915: drop redundant W=1 warnings from Makefile
17b11e62e6a8 drm/xe: drop redundant W=1 warnings from Makefile
9625a7334f8e drm/amdgpu: drop redundant W=1 warnings from Makefile


