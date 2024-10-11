Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FFD24470
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 17:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB4910EBB2;
	Fri, 11 Oct 2024 17:17:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13B510EBB2;
 Fri, 11 Oct 2024 17:17:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_use_string?=
 =?utf-8?q?_choice_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "R Sundar" <prosunofficial@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 17:17:49 -0000
Message-ID: <172866706991.1241457.15440333071932549117@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007174857.85061-1-prosunofficial@gmail.com>
In-Reply-To: <20241007174857.85061-1-prosunofficial@gmail.com>
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

Series: drm/i915/dp: use string choice helpers
URL   : https://patchwork.freedesktop.org/series/139892/
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
commit 6872540dd5a540c4725c2edfe90f8f9441419edf
Author: R Sundar <prosunofficial@gmail.com>
Date:   Mon Oct 7 23:18:57 2024 +0530

    drm/i915/dp: use string choice helpers
    
    Use str_on_off string helpers for better readability and to fix cocci
    warning.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Julia Lawall <julia.lawall@inria.fr>
    Closes: https://lore.kernel.org/r/202410071252.cWILJzrH-lkp@intel.com/
    Signed-off-by: R Sundar <prosunofficial@gmail.com>
+ /mt/dim checkpatch d2577be8b969257afb5f76964afc16ae4f6f7c07 drm-intel
6872540dd5a5 drm/i915/dp: use string choice helpers
-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#9: 
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


