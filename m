Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CCFC369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 19:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17F10E87C;
	Thu,  1 May 2025 19:01:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554710E87C;
 Thu,  1 May 2025 19:01:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_page_fault_?=
 =?utf-8?q?queue_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 May 2025 19:01:21 -0000
Message-ID: <174612608116.33180.6498177248251841838@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250501183220.72097-1-stuart.summers@intel.com>
In-Reply-To: <20250501183220.72097-1-stuart.summers@intel.com>
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

Series: drm/xe: Fix page fault queue calculation
URL   : https://patchwork.freedesktop.org/series/148523/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13a086884648c6681272784c599807a4c7613c37
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu May 1 18:32:20 2025 +0000

    drm/xe: Fix page fault queue calculation
    
    We followed up with the design architects to have a more
    precise calculation for a theoretical maximum number of
    page faults we might expect based on the number of TLBs
    available in the system. Fix the original calculation which
    did not take the number of TLBs into consideration.
    
    Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
    Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 1fcdd40b106599f78a176ba2aca41b76d79f1408 drm-intel
13a086884648 drm/xe: Fix page fault queue calculation


