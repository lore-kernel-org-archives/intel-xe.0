Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE9DC7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 10:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1C710E678;
	Fri,  9 Jun 2023 10:07:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77DF310E678;
 Fri,  9 Jun 2023 10:07:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 74CC3AA01E;
 Fri,  9 Jun 2023 10:07:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 09 Jun 2023 10:07:56 -0000
Message-ID: <168630527647.15972.18110468973162821863@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Im?=
 =?utf-8?q?plement_missing_invalidations_and_flushes_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Implement missing invalidations and flushes (rev2)
URL   : https://patchwork.freedesktop.org/series/119124/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 97af4f21a5486f5beac7709956ea5260d5972cbe
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 9 10:58:40 2023 +0200

    drm/xe: Emit a render cache flush after each rcs/ccs batch
    
    We need to flush render caches before fence signalling, where we might
    release the memory for reuse. We can't rely on userspace doing this,
    so flush render caches after the batch, but before user fence- and
    dma_fence signalling.
    
    Copy the cache flush from i915, but omit PIPE_CONTROL_FLUSH_L3, since it
    should be implied by the other flushes. Also omit
    PIPE_CONTROL_TLB_INVALIDATE since there should be no apparent need to
    invalidate TLB after batch completion.
    
    v2:
    - Update Makefile for OOB WA.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Tested-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com> #1
    Reported-by: José Roberto de Souza <jose.souza@intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
a39c0a095 drm/xe: Invalidate TLB also on bind if in scratch page mode
97af4f21a drm/xe: Emit a render cache flush after each rcs/ccs batch


