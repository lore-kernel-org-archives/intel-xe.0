Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBD3C3271F
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 08:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA5B10E0AB;
	Fri,  5 Jul 2024 08:37:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045010E118;
 Fri,  5 Jul 2024 08:37:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_write-back_?=
 =?utf-8?q?caching_mode_for_system_memory_on_DGFX_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 08:37:15 -0000
Message-ID: <172016863525.30303.10406510187818022268@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705083214.307860-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240705083214.307860-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Use write-back caching mode for system memory on DGFX (rev3)
URL   : https://patchwork.freedesktop.org/series/135071/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 41807cf0903f657f7cc6cc182e68c0d5a6bfbf9e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jul 5 10:32:14 2024 +0200

    drm/xe: Use write-back caching mode for system memory on DGFX
    
    The caching mode for buffer objects with VRAM as a possible
    placement was forced to write-combined, regardless of placement.
    
    However, write-combined system memory is expensive to allocate and
    even though it is pooled, the pool is expensive to shrink, since
    it involves global CPU TLB flushes.
    
    Moreover write-combined system memory from TTM is only reliably
    available on x86 and DGFX doesn't have an x86 restriction.
    
    So regardless of the cpu caching mode selected for a bo,
    internally use write-back caching mode for system memory on DGFX.
    
    Coherency is maintained, but user-space clients may perceive a
    difference in cpu access speeds.
    
    v2:
    - Update RB- and Ack tags.
    - Rephrase wording in xe_drm.h (Matt Roper)
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
    Cc: Pallavi Mishra <pallavi.mishra@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Effie Yu <effie.yu@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Jose Souza <jose.souza@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Acked-by: Matthew Auld <matthew.auld@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
    Acked-by: Michal Mrozek <michal.mrozek@intel.com>
    Acked-by: Effie Yu <effie.yu@intel.com> #On chat
+ /mt/dim checkpatch 574db4da2e272fae0b5739ac2e94f7348fa18fff drm-intel
41807cf0903f drm/xe: Use write-back caching mode for system memory on DGFX


