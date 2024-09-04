Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DCCD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 12:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CD10E7AD;
	Wed,  4 Sep 2024 12:55:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B8B10E7B5;
 Wed,  4 Sep 2024 12:55:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_enable_warnings_on?=
 =?utf-8?q?_unused_static_inlines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 12:55:28 -0000
Message-ID: <172545452805.933211.13157827155800455818@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904123819.3784906-1-jani.nikula@intel.com>
In-Reply-To: <20240904123819.3784906-1-jani.nikula@intel.com>
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

Series: drm: enable warnings on unused static inlines
URL   : https://patchwork.freedesktop.org/series/138205/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c867be1239a3fcb451a5e18f9dcaf7b16cf48941
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 4 15:38:19 2024 +0300

    drm: enable warnings on unused static inlines
    
    We enable most W=1 warnings by default subsystem wide. Also enable
    warnings on unused static inlines when building with clang.
    
    See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
    inline functions for W=1 build").
    
    Cc: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c72d3ffc0308b71024de6f80c3596668991c67ea drm-intel
c867be1239a3 drm: enable warnings on unused static inlines


