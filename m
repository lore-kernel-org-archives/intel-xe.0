Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF81C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 08:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385910E1A6;
	Tue, 25 Mar 2025 08:55:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000E210E17E;
 Tue, 25 Mar 2025 08:55:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Remove_extra_spaces_in_xe=5Fvm=2Ec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 08:55:18 -0000
Message-ID: <174289291899.13.6870475350444709634@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250320211519.632432-1-dev@lankhorst.se>
In-Reply-To: <20250320211519.632432-1-dev@lankhorst.se>
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

Series: series starting with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)
URL   : https://patchwork.freedesktop.org/series/146562/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aed5ae88240826e26cf286a8c3abdd2e561fdefb
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Mar 25 09:10:43 2025 +0100

    drm/xe: Copy cpu_caching when importing DMA-BUF.
    
    Hey,
    
    On 2025-03-21 11:23, Thomas Hellström wrote:
    > Hi, Maarten.
    >
    > On Thu, 2025-03-20 at 22:15 +0100, Maarten Lankhorst wrote:
    >> When testing xe with P2PDMA DMA-BUF import,
    >> VM_BIND was failing because cpu_caching was not set.
    >>
    >> Set cpu_caching if available from another xe driver,
    >> to allow uncached VM_BIND on imported DMA-BUF.
    >>
    >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    >
    > I don't think this is correct, we shouldn't assume anything about
    > imported dma-bufs, really. If we do we might end up in a situation
    > where code works for dma-bufs imported from one device but not from
    > another.
    >
    > I think what we can do is to relax the COH mode check. It only really
    > matters on IGPU. On DGPU, all accesses to system memory is coherent.
    >
    > Next step would perhaps be to assume that on p2p access, a dma-buf is
    > coherently cleared when all KERNEL dma-fences are signaled, but that
    > would require a cross-driver agreement, so in essence allow non-
    > coherent VM_BIND to device memory. This would matter only for IGPU
    > mapping a device p2p.
    >
    > /Thomas
    
    So would something like this work instead?
    
    ----8<----
+ /mt/dim checkpatch c217ee2fc8a5267fa66276423f3f27867480c98e drm-intel
53c605e25d99 drm/xe: Remove extra spaces in xe_vm.c
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
aed5ae882408 drm/xe: Copy cpu_caching when importing DMA-BUF.
-:62: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 15 lines checked


