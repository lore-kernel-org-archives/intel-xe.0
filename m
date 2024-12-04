Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A817E7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 06:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28910EC05;
	Wed,  4 Dec 2024 06:38:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8510EC05;
 Wed,  4 Dec 2024 06:38:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_nvme-pci=3A_don=27t_use_d?=
 =?utf-8?q?ma=5Falloc=5Fnoncontiguous_with_0_merge_boundary?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 06:38:16 -0000
Message-ID: <173329429642.2320591.16125273530557430121@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204060601.1813514-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241204060601.1813514-1-chaitanya.kumar.borah@intel.com>
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

Series: nvme-pci: don't use dma_alloc_noncontiguous with 0 merge boundary
URL   : https://patchwork.freedesktop.org/series/142082/
State : warning

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
commit be4026493a2e47a106eb5f66d5400b0664f251cc
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Dec 4 11:36:01 2024 +0530

    nvme-pci: don't use dma_alloc_noncontiguous with 0 merge boundary
    
    Only call into nvme_alloc_host_mem_single which uses
    dma_alloc_noncontiguous when there is non-null dma merge boundary.
    Without this we'll call into dma_alloc_noncontiguous for device using
    dma-direct, which can work fine as long as the preferred size is below the
    MAX_ORDER of the page allocator, but blows up with a warning if it is
    too large.
    
    Fixes: 63a5c7a4b4c4 ("nvme-pci: use dma_alloc_noncontigous if possible")
    Reported-by: Leon Romanovsky <leon@kernel.org>
    Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13227
    Link: https://lore.kernel.org/linux-nvme/39a67024-2926-4a20-8feb-77dd64ab7c39@kernel.dk/T/#mfef47937b20e33aa3cc63a3af930f8a9f9baf8c2
+ /mt/dim checkpatch 40be916657d26be563dbbd2b618cc398ea9aeb33 drm-intel
be4026493a2e nvme-pci: don't use dma_alloc_noncontiguous with 0 merge boundary
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Leon Romanovsky <leon@kernel.org>
Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>

total: 0 errors, 2 warnings, 0 checks, 15 lines checked


