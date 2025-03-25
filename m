Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93746C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 08:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429F610E4FB;
	Tue, 25 Mar 2025 08:10:58 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A6510E4FB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 08:10:57 +0000 (UTC)
Message-ID: <e7411f27-f8f8-43f1-b36c-c44424fd693d@lankhorst.se>
Date: Tue, 25 Mar 2025 09:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 2/2] drm/xe: Copy cpu_caching when importing DMA-BUF.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250320211519.632432-1-dev@lankhorst.se>
 <20250320211519.632432-2-dev@lankhorst.se>
 <60417daf928897560acf961ad0e14b51e170e676.camel@linux.intel.com>
Content-Language: en-US
In-Reply-To: <60417daf928897560acf961ad0e14b51e170e676.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fed4b97d1882d..fb15de880ae21 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2990,12 +2990,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
 			return -EINVAL;
 		}
-	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
+	} else if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) && coh_mode == XE_COH_NONE)) {
 		/*
 		 * Imported dma-buf from a different device should
 		 * require 1way or 2way coherency since we don't know
 		 * how it was mapped on the CPU. Just assume is it
 		 * potentially cached on CPU side.
+		 *
+		 * On a discrete GPU, all access to system memory is coherent.
 		 */
 		return -EINVAL;
 	}

