Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA188C0219E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 06:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541710E194;
	Tue, 11 Feb 2025 06:38:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B35710E41C;
 Tue, 11 Feb 2025 06:38:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_per-engine_?=
 =?utf-8?q?pagefault_and_reset_counts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 06:38:57 -0000
Message-ID: <173925593743.756949.8878170129841931870@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250210193657.96030-1-jonathan.cavitt@intel.com>
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

Series: drm/xe: Add per-engine pagefault and reset counts (rev2)
URL   : https://patchwork.freedesktop.org/series/144623/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cc15f7744cf72b9896a99901c91d831b2c3ca8d4
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Feb 10 19:36:57 2025 +0000

    drm/xe: Add per-engine pagefault and reset counts
    
    Add counters to all engines that count the number of pagefaults and
    engine resets that have been triggered on them.  Report these values
    during an engine reset.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Tomasz Mistat <tomasz.mistat@intel.com>
    CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
    CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 2fc58ab10139895686001c7e1ee247f15226abc4 drm-intel
cc15f7744cf7 drm/xe: Add per-engine pagefault and reset counts


