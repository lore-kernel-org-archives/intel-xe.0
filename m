Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CD7CF11EC
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 12:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4049810E2CA;
	Thu, 10 Oct 2024 12:51:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB910E8E0;
 Thu, 10 Oct 2024 12:51:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Fix_incorrect_?=
 =?utf-8?q?use_of_kernel-doc_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 12:51:51 -0000
Message-ID: <172856471163.1215103.16280841506909525150@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Fix incorrect use of kernel-doc format
URL   : https://patchwork.freedesktop.org/series/139844/
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
commit 2af68fc4b418701152e91c1d17676826bf0d657a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Oct 10 14:45:45 2024 +0200

    drm/ttm: Fix incorrect use of kernel-doc format
    
    Add a missing colon.
    
    Cc: dri-devel@lists.freedesktop.org
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Closes: https://lore.kernel.org/linux-next/20241010160942.192caf60@canb.auug.org.au/
    Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 8451eadce1bcdb26e01771d636812feae1aa2881 drm-intel
2af68fc4b418 drm/ttm: Fix incorrect use of kernel-doc format


