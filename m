Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1C6D2069F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 06:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6CF10E68E;
	Wed, 16 Oct 2024 06:20:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04B10E68E;
 Wed, 16 Oct 2024 06:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_mm/hmm=2C_mm/migrate=5Fde?=
 =?utf-8?q?vice=3A_Allow_p2p_access_and_p2p_migration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 06:20:46 -0000
Message-ID: <172905964643.1272209.500341486061228131@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
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

Series: mm/hmm, mm/migrate_device: Allow p2p access and p2p migration (rev2)
URL   : https://patchwork.freedesktop.org/series/139995/
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
commit b74058545e0dabebe267c77fc4b618db9da461f4
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Oct 15 13:13:22 2024 +0200

    mm/hmm, mm/migrate_device: Allow p2p access and p2p migration
    
    Introduce a way for hmm_range_fault() and migrate_vma_setup() to identify
    foreign devices with fast interconnect and thereby allow
    both direct access over the interconnect and p2p migration.
    
    The need for a callback arises because without it, the p2p ability would
    need to be static and determined at dev_pagemap creation time. With
    a callback it can be determined dynamically, and in the migrate case
    the callback could separate out local device pages.
    
    The hmm_range_fault() change has been tested internally, the
    migrate_vma_setup() change hasn't yet.
    
    Seeking early feedback. Any suggestions appreciated.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Jason Gunthorpe <jgg@nvidia.com>
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: DRI-devel <dri-devel@lists.freedesktop.org>
    Cc: Linux Memory Management List <linux-mm@kvack.org>
    Cc: LKML <linux-kernel@vger.kernel.org>
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 01c7b2c084e5c84313f382734c10945b9aa49823 drm-intel
b74058545e0d mm/hmm, mm/migrate_device: Allow p2p access and p2p migration


