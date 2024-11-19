Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADA4D62069
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 10:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877810E60F;
	Tue, 19 Nov 2024 10:27:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131410E60F;
 Tue, 19 Nov 2024 10:27:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vram=3A_fix_lpfn_c?=
 =?utf-8?q?heck?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 10:27:20 -0000
Message-ID: <173201204041.270274.17096576004965231887@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119101926.190203-2-matthew.auld@intel.com>
In-Reply-To: <20241119101926.190203-2-matthew.auld@intel.com>
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

Series: drm/xe/vram: fix lpfn check
URL   : https://patchwork.freedesktop.org/series/141543/
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
commit f67944111a86230f07acad655c5eba69f6730fa3
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Nov 19 10:19:27 2024 +0000

    drm/xe/vram: fix lpfn check
    
    Technically we should check the lfpn value and not the place->lpfn, for
    the case where the allocation itself could be as large as the entire
    region and not be range based, which might result in incorrectly doing a
    power-of-two roundup. The allocator itself will already ensure it's
    contiguous underneath for such an allocation. This shouldn't fix any
    current usecase, but never the less came up from some internal testing.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6af9eb4707b2f65024ac9412f3a9d76cc2516a9a drm-intel
f67944111a86 drm/xe/vram: fix lpfn check


