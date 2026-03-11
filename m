Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF3AFD0641
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 07:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24A110E1D2;
	Wed, 11 Mar 2026 07:07:31 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199DF10E1D2;
 Wed, 11 Mar 2026 07:07:31 +0000 (UTC)
Received: from [192.168.10.94] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 21F723F1E0;
 Wed, 11 Mar 2026 08:07:27 +0100 (CET)
Message-ID: <111a669d-7f29-4388-8f44-720645eefeb8@hogyros.de>
Date: Wed, 11 Mar 2026 16:07:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] pci: check if VGA decoding was really activated
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260310202259.GA777598@bhelgaas>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260310202259.GA777598@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 3/11/26 5:22 AM, Bjorn Helgaas wrote:

> Based on this:
> https://lore.kernel.org/all/9f297568-5616-40b6-b401-df1af57d5e14@hogyros.de

> I *guess* this is the critical patch, and together with
> https://patchwork.freedesktop.org/patch/709684/?series=161721&rev=4,
> it fixes an issue?

This patch to notice, and the patch to __vga_tryget() and vga_get() to 
forward the error to i915. Basically there are multiple layers of not 
handling errors in the current code.

rev=4 is the backported patch for 5.3 to 6.19, rev=3 is the relevant 
version, but technically it's doing the same thing.

> Without these two patches, i915 assumes its
> vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO) always succeeds, and
> I guess the problem is that if it *didn't* succeed, i915's subsequent
> ioport accesses may go to the wrong device or to no device at all,
> which might corrupt another device or cause a PCI error?

  - i915 assumes vga_get_uninterruptible() always succeeds.

  - This assumption currently holds because __vga_tryget() assumes that 
pci_set_vga_state() succeeds, and there is no error return to vga_get().

  - That assumption holds because pci_set_vga_state() only reports 
errors from the uv BIOS (or any other platform code) and assumes that 
setting VGAEnable in bridge control always succeeds.

The accesses should not go to the wrong device, because decoding on the 
previously active device has been disabled, either by disabling 
VGAEnable in a bridge above it or by disabling IO decoding for the VGA 
card altogether for the common case where onboard VGA is integrated into 
the mainboard chipset, and there are no bridges between the root and the 
onboard VGA that aren't also parents of the dGPU).

So the result is these go to no device at all.

> We could include the i915 patch in this series.  Wouldn't be a
> problem from the PCI side, I dunno about the DRM side.

The i915 patch (rev=3) is already in drm-intel-next, so it will 
percolate up into 7.0 from there.

If there is a desire to backport the PCI changes, i915 should get the 
backported patch for the older kernel versions as well.

    Simon
