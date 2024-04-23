Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C4EC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D7F10E350;
	Tue, 23 Apr 2024 17:18:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC5710E350;
 Tue, 23 Apr 2024 17:18:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_unexpected_?=
 =?utf-8?q?backmerge_results?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 17:18:08 -0000
Message-ID: <171389268844.1607644.885559288458146930@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix unexpected backmerge results
URL   : https://patchwork.freedesktop.org/series/132774/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 326a727aa07b8e40716eb8696ba3d3944b6faa90
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Apr 23 14:11:14 2024 +0200

    drm/xe: Fix unexpected backmerge results
    
    The recent backmerge from drm-next to drm-xe-next brought with it
    some silent unexpected results. One code snippet was added twice
    and a partial revert was partially reverted. Fix that up to
    reinstate the code as it was before the backmerge.
    
    Fixes: 79790b6818e9 ("Merge drm/drm-next into drm-xe-next")
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch e1dc9638bb47a28181fee1a9a180445ca2a8b9cf drm-intel
326a727aa07b drm/xe: Fix unexpected backmerge results


