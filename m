Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ABBD0EE12
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 16:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32F710EB37;
	Fri, 11 Oct 2024 16:31:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39D10EB32;
 Fri, 11 Oct 2024 16:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ddi=3A_use_strin?=
 =?utf-8?q?g_choice_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "R Sundar" <prosunofficial@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 16:31:41 -0000
Message-ID: <172866430183.1241250.8974120553123284731@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007173300.83902-1-prosunofficial@gmail.com>
In-Reply-To: <20241007173300.83902-1-prosunofficial@gmail.com>
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

Series: drm/i915/ddi: use string choice helpers
URL   : https://patchwork.freedesktop.org/series/139891/
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
commit 79692df24dd997ebd47cb30f6f6860d6cca160e3
Author: R Sundar <prosunofficial@gmail.com>
Date:   Mon Oct 7 23:03:00 2024 +0530

    drm/i915/ddi: use string choice helpers
    
    Use str_enabled_disabled string helpers for better readability and to
    fix cocci warning.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Julia Lawall <julia.lawall@inria.fr>
    Closes: https://lore.kernel.org/r/202410071601.TFpXoqgW-lkp@intel.com/
    Signed-off-by: R Sundar <prosunofficial@gmail.com>
+ /mt/dim checkpatch d2577be8b969257afb5f76964afc16ae4f6f7c07 drm-intel
79692df24dd9 drm/i915/ddi: use string choice helpers
-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#9: 
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


