Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C46CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 09:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645FA10E56E;
	Thu,  7 May 2026 09:21:52 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC2310E56E;
 Thu,  7 May 2026 09:21:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Drop_HPAGE=5FPMD?=
 =?utf-8?q?=5FSIZE_dependency_in_dma=5Fiova=5Ftry=5Falloc_calls?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 09:21:50 -0000
Message-ID: <177814571043.47093.2947173279194332891@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507091606.1067973-1-francois.dugast@intel.com>
In-Reply-To: <20260507091606.1067973-1-francois.dugast@intel.com>
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

Series: drm: Drop HPAGE_PMD_SIZE dependency in dma_iova_try_alloc calls
URL   : https://patchwork.freedesktop.org/series/166117/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d2e26352351dcdd8e75bf750d017d6ff558e141
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu May 7 11:16:06 2026 +0200

    drm: Drop HPAGE_PMD_SIZE dependency in dma_iova_try_alloc calls
    
    The phys argument to dma_iova_try_alloc() is used only to compute
    the sub-granule offset (phys & (granule - 1)). Since HPAGE_PMD_SIZE
    is a power of two larger than any IOMMU granule, this expression
    always evaluates to zero.
    
    Replace the ternary expressions with a plain 0, which is what the
    API documentation recommends for callers doing PAGE_SIZE-aligned
    transfers. This also removes the dependency on HPAGE_PMD_SIZE and
    thus on CONFIG_PGTABLE_HAS_HUGE_LEAVES / HAVE_ARCH_TRANSPARENT_HUGEPAGE,
    fixing build failures on architectures such as arm32 that lack that
    config.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation
    Link: https://lore.kernel.org/intel-xe/c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org/
+ /mt/dim checkpatch 30f8a0629f6924f24369cac9161b1a9741880259 drm-intel
2d2e26352351 drm: Drop HPAGE_PMD_SIZE dependency in dma_iova_try_alloc calls
-:20: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#20: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


