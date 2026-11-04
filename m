Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0043606A332
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njYXusLE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4610FAEE;
	Wed,  4 Nov 2026 10:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D7310FAEE
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793787983; x=1825323983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c4RVmcwFoz2DEclj9/DTujKMxc2+REOPArEukpzgjrc=;
 b=njYXusLEzRHM5qE3FV0YLgbNosWeyqYdxHBpG3jrIUABr+UUTSpaGGdA
 mTre39Jwa7nd8Ivkpe90e4d5voBqOfjtwSyWpji3E08DD++dvoCTgWJYU
 gv13ZWk8xoHuXFHWY13L2HLq84LkcFEoSJLOqD0/ZH9d7U/I0ZAEP7kPW
 64Zfl2hNqPgZMBy7QaQ24oFpEFxd5JzYFkFk7QrbQKXGpFauXjYUm9AR3
 votrKuegs0hN/gYp+4NHslmkCQ86G1kw5rNIPP0NNixaRxCewGnQRl4hL
 tZnDOgmG8KZpoITyJ6UspsNghFlrgCgquJWsL5xfe9Rp+1x7g8igsiCby g==;
X-CSE-ConnectionGUID: HW8wWj7BQeGvFKdyBCmFbg==
X-CSE-MsgGUID: 9W19bEzWQH2ui2wS8nZibg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2571956"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2571956"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:26:22 -0800
X-CSE-ConnectionGUID: 1PE0ZeNMSV+J0BSDMpwVxg==
X-CSE-MsgGUID: yVrEcShdSsi4moS1flYlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6786740"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 02:26:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id AEB1F99; Wed, 04 Nov 2026 11:26:19 +0100 (CET)
Date: Wed, 4 Nov 2026 11:26:19 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rodolfo Semprevivo <rodolfo@semprevivo.ch>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: Panther Lake UCSI: PPM =?utf-8?Q?force?=
 =?utf-8?Q?s_DP_alt_mode_pin_assignment_D_=282_lanes=29_for_C=2FE-only_par?=
 =?utf-8?Q?tner=2C_no_4K60_=28was=3A_=5BBUG=5D_Type-C_Subsystem_xHCI_=2880?=
 =?utf-8?Q?86=3Ae331=2C_Panther_Lake=29_=E2=80=94_repeate?= =?utf-8?Q?d?= err
 -71 / port reset failures under sustained DP+HID load)
Message-ID: <ausISwWb3qeTkSDh@black.igk.intel.com>
References: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
 <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>
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

On Fri, Oct 23, 2026 at 10:27:32PM +0200, Rodolfo Semprevivo wrote:
> Hi,
> 
> follow-up to my report below, with a corrected analysis. The xHCI was
> the wrong suspect: the -71 errors come from the monitor's internal USB
> 2.0 hub, which sits on the standalone xHCI (8086:e37d, 00:14.0), not on
> 8086:e331. They only appear because the monitor resets when the DP link
> fails.
> 
> Root cause: on the left TB4 port the PPM/EC configures DP alt mode with
> pin assignment D (2 lanes), although the monitor only advertises C and E:
> 
>   port0-partner.0: svid ff01, active yes, vdo 0x00140045
>   displayport/pin_assignment: C E   (nothing selected)
>   displayport/configuration: [USB] sink
>   xe: Port D/TC#1: TC port mode reset (disconnected -> dp-alt) pin
> assignment: D max lanes: 2
>   xe: [LTTPR 1] Link Training passed at link rate = 540000, lane count = 2
> 
> 2x HBR2 is not enough for 3840x2160@60 (594 MHz), so the picture drops
> regardless of bpc/HDR. Lower resolutions at 60 Hz work. This also
> explains why the dGPU route via the MUX failed identically: the lane
> split is decided by the firmware, not by the GPU driver.
> 
> For comparison, an Alder Lake ASUS GU603ZW on the same kernel, with the
> same monitor and cable:
> 
>   i915: Port D/TC#1: ... pin assignment: C max lanes: 4
>   i915: Link Training passed at link rate = 540000, lane count = 4
> 
> and 4K60 is stable.
> 
> Linux cannot correct this. Writes to pin_assignment/configuration fail
> with EOPNOTSUPP:
> 
>   typec_displayport port0-partner.0: firmware doesn't support alternate mode
> overriding
>   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
> 
> So this looks like a firmware issue (reported to ASUS as well).
> Questions:
> 1. Is the PPM choosing pin assignment D for a partner that does not
>    advertise D a known issue on Panther Lake?

I have not heard of this particular problem before.

> 2. Should Linux warn about it (partner VDO lacks D but FIA reports D),
>    or avoid the resulting 2-lane DSC mode?

You tell me. If you think that this would be useful, prepare the patch
for it.

> System: ASUS ROG Zephyrus G16 GU606AX (Panther Lake, Core Ultra 9 386H),
> BIOS GU606AX.304, kernel 7.3.0-4 (CachyOS), monitor ASUS ProArt
> PA169CDV. Bug report: https://paste.cachyos.org/p/83e1bcf.log
> Full drm.debug log available on request.

Thanks,

-- 
heikki
