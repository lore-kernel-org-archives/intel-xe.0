Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E5FEB106D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 15:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5910E2A9;
	Tue, 10 Mar 2026 15:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx6h0Fcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3810E1FF;
 Tue, 10 Mar 2026 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773155991; x=1804691991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t0mpfZD9ghiA61gvfNsCWxTjADq9UDNAwEA9lpLiHF4=;
 b=dx6h0FclaRbo77NeTa2oqlxbzFi8LQx48a8lNWOYFKz0q7z2x5bBsNsX
 +gHOFi7Og06ZyVTZ+DtGQFXKMoT7SmoDFE+hVNsEsDxYMu8vwHXdnxMWT
 NfeIAuc4AfI3QiC14rgunkkz2qrnJtoNZIjnHU6MBh8eP5pFLkp5YFUgc
 T0Est5ols4kmUaai880F2Fan13zMDTEqithNjOMTMxv/dCbeHFVy/OfgI
 bvDT2aP9jSjsqA9Z0dKJSAlClBEkOBO+tuh3J6HXLxc0ySo8e/qiIEN2X
 vJQkj1ZFUImiPbwi0Cc/hA0wE9uWDME+R/rw5m/9+DmDoFleK9HbvzOBN w==;
X-CSE-ConnectionGUID: YwSiFTwATF+E4H1jNvFMTQ==
X-CSE-MsgGUID: IQ+Fd5CDTDyjiqttTdwsFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78059674"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78059674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:19:50 -0700
X-CSE-ConnectionGUID: kAPgrrb6Tc6kpxo5u+WHfQ==
X-CSE-MsgGUID: lT61rQ3kRnSZ+wVoGO3qzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220111991"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:19:49 -0700
Date: Tue, 10 Mar 2026 17:19:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] pci: check if VGA decoding was really activated
Message-ID: <abA2kQScB-m2ka3K@intel.com>
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
 <20260307173538.763188-5-Simon.Richter@hogyros.de>
 <abAChDpsUQhpnOcT@intel.com>
 <1a7a9d17-5086-4fdb-83e7-56d5ddaaadbd@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a7a9d17-5086-4fdb-83e7-56d5ddaaadbd@hogyros.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Mar 10, 2026 at 11:08:40PM +0900, Simon Richter wrote:
> Hi,
> 
> On 3/10/26 8:37 PM, Ville Syrjälä wrote:
> 
> > Maybe this should also have a comment or spec quote to explain
> > that it's legal behavior?
> 
> The PCI-to-PCI Bridge Specification version 1.1 has in chapter 4.5 "VGA 
> Support":
> 
>      Bridges are not required to implement the VGA support mechanisms
>      described in the following sections.
> 
> So this has always been optional.
> 
> What is a bit annoying is that I cannot find an explicit sentence 
> allowing the VGAEnable bit to be hardwired to zero in that specification.
> 
> It is explicitly allowed to hardwire the VGASnoopEnable bit to zero if 
> VGA palette snooping is not supported for downstream devices (Table 3-2 
> "Command Register"):
> 
>      Implementation of VGA palette snooping by a bridge is optional. If
>      VGA palette snooping is not supported, this bit must be implemented
>      as read-only with a value of 0
> 
> That is the command register though, not the bridge control register.
> 
> The bridge control register documentation (Table 3-9) does not 
> explicitly say what should be done if VGA support is not available, but 
> the behaviour of the VGAEnable bit is a superset of the VGASnoopEnable 
> bit, and the VGASnoopEnable bit becomes a Don't Care if VGAEnable is 
> set, so "the bit must be hardwired to zero if unsupported" appears to be 
> the only valid interpretation.
> 
> This seems to be the behaviour of all the devices I have available:
> 
>   - IBM PowerNV PCIe root bridge (POWER9)
>   - SiFive VisionFive2 PCIe root bridge (PLDA XpressRich-AXI Ref Design)
> 
> Both read back this bit as zero when written via setpci:
> 
> # setpci -s 0000:00:00.0 BRIDGE_CONTROL
> 0002
> # setpci -s 0000:00:00.0 BRIDGE_CONTROL=0xa
> # setpci -s 0000:00:00.0 BRIDGE_CONTROL
> 0002
> 
> There is also a question in the Altera support forum for their PCIe Root 
> Bridge IP at https://community.altera.com/kb/knowledge-base/-/345837 .

Yeah, looks like the exact explanation was only added in the PCIe
bridge spec. Before that it was somewhat ambiguous.

> 
> > The slightly bigger concern I have is whether we need to unwind
> > the previous steps if this fails? Looks like we don't update
> > vgadev->owns on failure (even though we may have partially
> > enabled things). But since the bridge should never forward any
> > VGA accesses, leaving some extra PCI_COMMAND enable(s) set on
> > the device shouldn't matter in practice.
> 
> I was thinking the same, but because we're going upwards in the 
> hierarchy, the bridges we leave enabled are downstream of the bridge 
> that refused to forward.
> 
> I can add this for completeness though, that should be fairly easy.
> 
> > So I guess this should
> > work even without unwinding. Well, not sure about
> > arch_set_vga_state() since that's 100% magic...
> 
> It's not entirely magic, because after success from arch_set_vga_state() 
> we still go through all the bridges. I believe uv uses it for some kind 
> of paravirtualization.
> 
>     Simon

-- 
Ville Syrjälä
Intel
