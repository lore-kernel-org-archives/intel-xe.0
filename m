Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AF606A886
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0CW5A/u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3818C10E332;
	Wed, 11 Nov 2026 12:19:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB2B10FB46;
 Wed, 11 Nov 2026 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794399544; x=1825935544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vX2StYKELDoYRdQ0fdulJqDLLF2q61sORMyuW6HsL0U=;
 b=M0CW5A/uljPbyHG6sS+m5SRcKUgkgBQW1BhD7VCxAMEUB7LVpcrYRlDE
 N8QVo5kSGCSlpUD1pioLE79guCTla+D1K4ourXKKuZFGix+Blmcz1wr4O
 REJsFtLOds57qiW1w0h+dFGD0rRYtpcPYv3nQFgAdwEDjV5KVDJfF1wO9
 zWSUTHiBwVejUmfxR/lgo/C8hHesvbP4+6suUBLQXapGS4MnONtfZLy80
 ioLNeRPqd1UwU3h8nRcaLKvzhNC5GAAVQ/3ybAFxbYyiB6rFVQo5VASoZ
 UogBuZY54o4LCowHzNGj4FBx4AZMp9fAQvc0WzkQ8IHxtmlSWLb4Onr9g w==;
X-CSE-ConnectionGUID: nu7brVyHS86WzLGkJXS0MQ==
X-CSE-MsgGUID: Z9WR1337TCurncOEqZtFvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3167314"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3167314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:19:03 -0800
X-CSE-ConnectionGUID: ePnpncWnQmCMXToUc3/vmQ==
X-CSE-MsgGUID: AjhYwidwT0q3UYa1+cXfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8571871"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2026 04:19:02 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: chaitanya.kumar.borah@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: Re: [PATCH] drm/i915/dip: Write the DIP header last with SDP
 transmission lines
Date: Wed, 11 Nov 2026 20:16:53 +0800
Message-ID: <20261111121653.79410-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111103542.4093652-1-chaitanya.kumar.borah@intel.com>
References: <20261111103542.4093652-1-chaitanya.kumar.borah@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaitanya,

On Wed, 11 Nov 2026 16:05:42 +0530, Chaitanya Kumar Borah wrote:
> On platforms with SDP transmission line registers, the packets anchored
> to them are double buffered in the transcoder (TC) clock domain. The packet
> registers are in the core display (CD) clock domain and the whole packet is
> clock crossed on the write of the header (dword 0), so Bspec requires the
> data to be programmed first and the header last.
>
> hsw_write_infoframe() writes the header first, so the packet is crossed
> before its payload is in place and the previous payload keeps being sent.

This is the same change, with the same reasoning (Bspec 75640), as the one
I posted for Xe2+ two weeks ago:

  https://patchwork.freedesktop.org/patch/763779/
  Message-ID: <20261028112423.2445450-1-xiaolu.xie@intel.com>

Yours looks like the better base for that part, as HAS_EMP_AS_SDP_TL also
covers BMG and it has the Fixes: and stable tags, so I'm happy to rebase on
top of it.

[...]

> Alternatives considered:
>  - 6a1712052859 (v7.2): AS SDP on whenever VRR is possible. The PTL
>    report is fixed by reverting it. Narrower than the spec argument, as
>    it only covers v7.2 and later.

Is that PTL report this one?

  https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693

Our patch was written for it: an eDP panel dropping the VSC SDP after some
HDR modesets on PTL, with different VSC ECC registers compared to the
working case. The reporter tested our patch on the affected machine and
commented in the issue that the test passes.

[...]

> +	if (header_last)
> +		intel_de_write(display,
> +			       hsw_dip_data_reg(display, cpu_transcoder, type, 0),
> +			       data[0]);
> +
>  	/* Wa_14013475917 */
>  	if (!(IS_DISPLAY_VER(display, 13, 14) && crtc_state->has_psr &&
>  	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))

There is one more hunk in our patch that yours does not have. Right below
this, hsw_write_infoframe() ORs VSC_DIP_HW_DATA_SW_HEA into VIDEO_DIP_CTL
for the VSC SDP. VSC_SELECT is a two bit field (VSC_SELECT_MASK), so a
stale value is not replaced but merged with the new one, e.g. 1 | 2 results
in 3. We clear the field before setting it, and also clear it in
intel_dp_set_infoframes() when the SDPs get disabled.

Was leaving that out intentional, e.g. because the field is guaranteed to be
clear at that point, or is it something that was missed? If it is needed, I
can send it as a separate patch on top of yours.

Thanks,
Xiao
