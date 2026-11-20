Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523FA606A339
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cIIGtF+K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D960112AF3;
	Fri, 20 Nov 2026 17:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D48112AF3;
 Fri, 20 Nov 2026 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795195424; x=1826731424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DaI5IUT1/pysBtu57cpOhK7kpdG7b5THNuCJTBS3inI=;
 b=cIIGtF+K5olJTXR7jmRL7h7IWxatY1O5DTnY0ASuGESlYZUY4njf/VXB
 CGBCMEAqQy56jKgI+sQaJzoWTqxSa03FnHb2qNwLmhVjskWhDTMCFrNBD
 a77l1ZqR4cLZpT9BNwdgO89P759qHC5A+7f/TqRAHfCOko+JYjsjumR+7
 gcnRQQ+gaSbBKZCxE5fPNS1TD07hLKwJl8RP3kGQuRh2gswyPX+1CZqmT
 DZP2/teYPYJpm+iYSN+VflpMxD1ZPQhfQjs/mLE/VJ0tp1lBXHW/Fmz80
 7A/MTtLBRKv0cWw82UnYFXnmj/SdcNVPg1ZWAFS+iYNir9Ubzx0BgN9Fw A==;
X-CSE-ConnectionGUID: hLDls1hbS467TOkAsl1SFQ==
X-CSE-MsgGUID: 4S8X5uhQQ9OZhk5uagRsmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4087886"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4087886"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:23:44 -0800
X-CSE-ConnectionGUID: nUO0y/G2S6Ka9edB9ObFNQ==
X-CSE-MsgGUID: 1K3MmZgXTgauuVtUkXYX+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12456557"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:23:40 -0800
Date: Fri, 20 Nov 2026 19:23:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: jouni.hogander@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 rodrigo.vivi@intel.com, animesh.manna@intel.com,
 uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Message-ID: <awCCGeCxHToY8tsI@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com>
 <20261120163416.66175-1-j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120163416.66175-1-j@metarealtyinc.ca>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 11:34:16AM -0500, Jake Steinman wrote:
> Hi Ville,
> 
> On Fri, Nov 20, 2026 at 05:03:08PM +0200, Ville Syrjälä wrote:
> > Is this some weird hardware quirk of ours? I don't see what vblank
> > interrupts (purely an internal thing to the display engine) have to
> > do with the external panel receiving SDPs.
> 
> The panel doesn't care about vblank interrupts. What it needs is the AS
> SDP while frames are being updated. With the AS SDP suspended in PR
> Active it judders, and with it sent all the time it's smooth but
> DC5/DC6 is blocked.
> 
> Vblank enable is only used as the "frames are being updated" signal.
> Userspace holds a vblank reference while it flips, and Panel Replay
> already holds DC_OFF for that window, so sending the AS SDP then costs
> no DC residency. It is suspended again before DC_OFF is dropped.

Vblanks being on during flips all completely accidental. Userspace
asking for the vblank counter ahead of a flip is not mandatory.
The temporary vblank reference that query grabs also gets dropped
immediately, and if the flip isn't actually committed during the
same frame as the query the vblank interrupt will also have been
turned off by the time the flip hits the hardware.

With the DSB/flipq paths we don't hold any in-driver reference
to the vblank, and the only reason the mmio path does so is
because we're using the vblank interrupt for the completion. If
we had a better interrupt for the mmio path we wouldn't need the
vblank reference there either.

We should also be looking for a way to have userspace not do the
vblank query, or make the vblank query correct without actually
enabling vblank interrupts. Turning on vblank interrupts requires
us to turn the hardware on possibly earlier than necessary, which
will waste power. Without the vblank interrupt getting enabled
we could let the hw sleep until it actually needs to wake up for
the actual flip. Though I don't really have an answer how to get
an accurate vblank count for the query without turning some
hardware on at least.

> 
> Jouni can say whether the internal confirmation explains why the panel
> needs it. From my side I only know it's this sink (LG, OUI 00:22:b9)
> on two Dell models.
> 
> Thanks,
> Jake

-- 
Ville Syrjälä
Intel
