Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51038606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Oct 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ik8FtX7S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9910E147;
	Sat, 31 Oct 2026 13:52:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782C10E04D;
 Sat, 31 Oct 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793454767; x=1824990767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4B+hTX8UGDtvas5tJqe1CjeUhiQgWRdHQN9LjmPWZac=;
 b=Ik8FtX7SeFwDfUeaZeT91kde4k/ADPCaNuUyS/5RMENvDGyCWaE+6cTW
 s2QjTCZ8Y0rKJ1YUypVXX7jDXSXYfLblxqWomw+FDsWYXs0PN9cFRLOFQ
 Msg+kKGQFofSib0AkiLc/IwSxID0ce7gOIqQj6pBeD3Rdgk/SCZWM4mr4
 zYk+ki2dmzHfA1gDMjW3Ps70RMylRsF/pmilm6Y/OhDUnre4OeM0yPXJj
 Ib1xwCmWyEuYyyZ0OS4o+XeXr/ueQIHqoMjLfZYKJ4iBgO3tDHgbuZzpk
 cxLO8j6S+Wlc9TSgEZNX/joMe2NBYZZGOS9E8GM6yA6iYn/wBN2azEVRE Q==;
X-CSE-ConnectionGUID: txU0RKobSpi2Cu7lK+O76w==
X-CSE-MsgGUID: 8lcx04a9RjeGkovFJe5bdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2194784"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2194784"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2026 06:52:47 -0700
X-CSE-ConnectionGUID: XFtNzyY4QDuHPACmetUiqw==
X-CSE-MsgGUID: B4CKKrNLS/yDszw5SHS/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7503063"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa013.fm.intel.com with ESMTP; 31 Oct 2026 06:52:45 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@linux.intel.com, ankit.k.nautiyal@intel.com,
 imre.deak@intel.com, Xiao Lu <xiaolu.xie@intel.com>
Subject: Re: [PATCH] drm/i915/display: Write the DIP header last on Xe2+ and
 reset VSC_SELECT
Date: Sat, 31 Oct 2026 21:50:32 +0800
Message-ID: <20261031135032.189852-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028112423.2445450-1-xiaolu.xie@intel.com>
References: <20261028112423.2445450-1-xiaolu.xie@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 19:24:23 +0800, Xiao Lu wrote:
> On Xe2_LPD and later the video DIP data registers are located in the
> core display clock domain, while the packets that are anchored to a
> transmission line register get double buffered in the transcoder clock
> domain. The hardware clock crosses the whole packet to the transcoder
> clock domain on the write of the packet header (dword 0), hence bspec
> requires programming all the data bytes of such packets first and the
> header last. On PTL the VSC SDP is anchored to the transmission line
> (EMP_AS_SDP_TL) when the AS SDP is enabled, and bspec recommends using
> the same order for all the video DIPs, so that the programming doesn't
> depend on how a given packet is double buffered.
>
> hsw_write_infoframe() writes the header first, so the clock crossing
> triggered by the header write happens before the data of the packet has
> been updated. Write the header last on display version 20+.
>
> Also, VSC_SELECT in VIDEO_DIP_CTL is a two bit field selecting whether
> the header and the data of the VSC SDP come from the hardware or from
> the software, but hsw_write_infoframe() ORs the wanted value into
> whatever the register already contained, so a stale setting is not
> replaced (e.g. 1 | 2 results in 3). Clear the field before setting it,
> and clear it as well when the SDPs get disabled in
> intel_dp_set_infoframes(), so that a stale setting left behind by an
> earlier user doesn't carry over.
>
> This is meant to address the VSC SDP being dropped by an eDP panel on
> PTL after some HDR modesets, where the VSC ECC registers differ from
> the working case.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693
> Bspec: 75640
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
>
> [diff snipped]

Hi Jouni,

Gentle ping, this has not had any review yet. I am asking you since you
made the latest logic changes in hsw_write_infoframe(): 54599011b756
(psr: no workarounds with panel replay) and bac2d7d8e64b (VSC_SELECT).

It looks like the driver does not follow the HW behavior in Bspec 75640,
so please give it some attention. On Xe2_LPD+ the packet is clock crossed
on the write of dword 0, so the data must be written first and the header
last, but hsw_write_infoframe() writes the header first. VSC_SELECT is
also ORed into a stale value (1 | 2 == 3); the patch clears it first. On
PTL an eDP panel drops the VSC SDP after some HDR modesets:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693

Looking forward to the discussion, and please excuse me if our
understanding is wrong.

Thanks,
Xiao Lu
