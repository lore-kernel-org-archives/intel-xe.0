Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C24FD2CDF9
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 00:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9110E33C;
	Wed, 23 Oct 2024 00:25:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5E610E33C;
 Wed, 23 Oct 2024 00:25:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Improvement?=
 =?utf-8?q?s_to_GuC_debugfs_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 00:25:43 -0000
Message-ID: <172964314384.1311842.16237559950506595763@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improvements to GuC debugfs info
URL   : https://patchwork.freedesktop.org/series/140341/
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
commit f6447da78ffd2962d768462925ac054adcee80c8
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Oct 22 17:17:35 2024 -0700

    drm/xe/guc: Separate full CTB content from guc_info debugfs
    
    The guc_info debugfs file is meant to be a quick view of the current
    software state of the GuC interface. Including the full CTN contents
    makes the file as a whole much less human readable and is not
    partiular useful in the general case. So don't pollute the info dump
    with the full buffers. Instead, move those into a separate debugfs
    entry that can be read when that information is actually required.
    
    Also, improve the human readability by adding a few extra blank lines
    to delimt the sections.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
23f554f888ed drm/xe/guc: Capture all available bits of GuC timestamp
f6447da78ffd drm/xe/guc: Separate full CTB content from guc_info debugfs


