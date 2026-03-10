Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C8EB1050
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 11:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE9010E251;
	Tue, 10 Mar 2026 11:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri3tZu3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9036610E251;
 Tue, 10 Mar 2026 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773142666; x=1804678666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zK5Jh59GAbn4En/eW1Dtts2Spbt7++8xZNGEZnpVOOM=;
 b=Ri3tZu3eUjs6bNn9PZMgPuyixKTvMbSslsDfY72TVBhQaVwz4Y6kuoeq
 nimB5frTJ/wLhr8qLwU53HkwigdKscBoya8Y6QpdcdjaYCzHInAPumZSN
 cQCx+in9+Z6VZb+pd7FQkyuBTPY1aWgjI6l68kWrqjBk0abWKfr9GFoCH
 8idBKqE+HYxqJIXsDDhbYC+a1wX+abTFGheuZWP114W5d00+y8rIlf9Rn
 sJcgFvqWUmSWN3hMXF0HI6w/IWhFGwy2Y6ni5OVYOHxjf6OUqKhpfwjgX
 mKkeNcEzf7zeV7mW8sdriYxYhUTZPtLYKRPwccQfsWNXVC8bOKA0J9FhO A==;
X-CSE-ConnectionGUID: j2G+xLuQQL6bHqMQ2OVNDA==
X-CSE-MsgGUID: RAHj3Bn6T1+DY8Gx6oWD7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85662784"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85662784"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:37:46 -0700
X-CSE-ConnectionGUID: WKFysl9bQC2xmFKIChwLoQ==
X-CSE-MsgGUID: CHngzzXkTCCp14kBfXf1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243099015"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:37:43 -0700
Date: Tue, 10 Mar 2026 13:37:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] pci: check if VGA decoding was really activated
Message-ID: <abAChDpsUQhpnOcT@intel.com>
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
 <20260307173538.763188-5-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260307173538.763188-5-Simon.Richter@hogyros.de>
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

On Sun, Mar 08, 2026 at 02:35:37AM +0900, Simon Richter wrote:
> PCI bridges are allowed to refuse activating VGA decoding, by simply
> ignoring attempts to set the bit that enables it, so after setting the bit,
> read it back to verify.
> 
> One example of such a bridge is the root bridge in IBM PowerNV, but this is
> also useful for GPU passthrough into virtual machines, where it is
> difficult to set up routing for legacy IO through IOMMU.
> 
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  drivers/pci/pci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8479c2e1f74f..e60b948f8576 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6197,6 +6197,12 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>  				cmd &= ~PCI_BRIDGE_CTL_VGA;
>  			pci_write_config_word(bridge, PCI_BRIDGE_CONTROL,
>  					      cmd);
> +			if (decode) {
> +				pci_read_config_word(bridge, PCI_BRIDGE_CONTROL,
> +						     &cmd);
> +				if(!(cmd & PCI_BRIDGE_CTL_VGA))
> +					return -EIO;
> +			}

Maybe this should also have a comment or spec quote to explain
that it's legal behavior?

The slightly bigger concern I have is whether we need to unwind
the previous steps if this fails? Looks like we don't update
vgadev->owns on failure (even though we may have partially
enabled things). But since the bridge should never forward any
VGA accesses, leaving some extra PCI_COMMAND enable(s) set on
the device shouldn't matter in practice. So I guess this should
work even without unwinding. Well, not sure about 
arch_set_vga_state() since that's 100% magic...

>  		}
>  		bus = bus->parent;
>  	}
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
