Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D00FD41C0D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 07:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23F610E19B;
	Wed, 13 Nov 2024 07:14:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0910E19B;
 Wed, 13 Nov 2024 07:14:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_handle_flat_ccs?=
 =?utf-8?q?_during_hibernation_on_igpu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 07:14:57 -0000
Message-ID: <173148209796.3432124.7165650882176703774@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112162827.116523-2-matthew.auld@intel.com>
In-Reply-To: <20241112162827.116523-2-matthew.auld@intel.com>
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

Series: drm/xe: handle flat ccs during hibernation on igpu
URL   : https://patchwork.freedesktop.org/series/141226/
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
commit dc3cf2ba937c72431c2569646427b47254146722
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Nov 12 16:28:28 2024 +0000

    drm/xe: handle flat ccs during hibernation on igpu
    
    Starting from LNL, CCS has moved over to flat CCS model where there is
    now dedicated memory reserved for storing compression state. On
    platforms like LNL this reserved memory lives inside graphics stolen
    memory, which is not treated like normal RAM and is therefore skipped by
    the core kernel when creating the hibernation image. Currently if
    something was compressed and we enter hibernation all the corresponding
    CCS state is lost on such HW, resulting in corrupted memory. To fix this
    evict user buffers from TT -> SYSTEM to ensure we take a snapshot of the
    raw CCS state when entering hibernation, where upon resuming we can
    restore the raw CCS state back when next validating the buffer. This has
    been confirmed to fix display corruption on LNL when coming back from
    hibernation.
    
    Fixes: cbdc52c11c9b ("drm/xe/xe2: Support flat ccs")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3409
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 26f5fe99791def93b32e27e79e71dbd0666c117b drm-intel
dc3cf2ba937c drm/xe: handle flat ccs during hibernation on igpu


