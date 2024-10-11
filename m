Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B39DD0EE19
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 19:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828210EC17;
	Fri, 11 Oct 2024 19:11:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074C10EC17;
 Fri, 11 Oct 2024 19:11:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22perf/core=3A_On?=
 =?utf-8?q?ly_copy-to-user_after_completely_unlocking_all_locks=2C_v3=2E=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 19:11:29 -0000
Message-ID: <172867388952.1241790.12291681125264235709@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011153530.451751-1-lucas.demarchi@intel.com>
In-Reply-To: <20241011153530.451751-1-lucas.demarchi@intel.com>
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

Series: Revert "perf/core: Only copy-to-user after completely unlocking all locks, v3."
URL   : https://patchwork.freedesktop.org/series/139902/
State : success

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
commit 303edb2d1a3d80eb7df2bcb20e35a6ecec2e621f
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Oct 11 10:35:30 2024 -0500

    Revert "perf/core: Only copy-to-user after completely unlocking all locks, v3."
    
    This reverts commit 80e846398c695dc3d0d2eac6da91772ff2aade65.
    
    Let's see what CI says about reverting this 4 ~ 5 years old commit. We
    shouldn't be in the business of changing perf/core in our "for CI" drm
    branch.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch d2577be8b969257afb5f76964afc16ae4f6f7c07 drm-intel
303edb2d1a3d Revert "perf/core: Only copy-to-user after completely unlocking all locks, v3."


