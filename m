Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE775CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 20:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994010E92F;
	Mon,  1 Jun 2026 20:17:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395E10E92F;
 Mon,  1 Jun 2026 20:17:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22drm=3A_prevent_?=
 =?utf-8?q?integer_overflows_in_dumb_buffer_creation_helpers=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 20:17:43 -0000
Message-ID: <178034506320.32261.2034243126881150517@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601173619.348486-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260601173619.348486-1-chaitanya.kumar.borah@intel.com>
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

Series: Revert "drm: prevent integer overflows in dumb buffer creation helpers"
URL   : https://patchwork.freedesktop.org/series/167685/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 190070e2b69c7d127cbcaa545463bbd98f89cf26
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Jun 1 23:06:19 2026 +0530

    Revert "drm: prevent integer overflows in dumb buffer creation helpers"
    
    This reverts commit 5ab62dd3687bcc2cc542b99385aabac5c996db6f.
    It causes a regression in Intel CI[1].
    
    [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16308
    
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16326
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 70cada764231ccb4582e920560a93edd210ace01 drm-intel
190070e2b69c Revert "drm: prevent integer overflows in dumb buffer creation helpers"
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16326

-:12: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#12: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16326

total: 0 errors, 2 warnings, 0 checks, 33 lines checked


