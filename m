Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76270C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 07:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B19810E253;
	Tue,  5 Aug 2025 07:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRRgBCfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F01910E253
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754380106; x=1785916106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=nRHNjxTsz1/rf6UGLaHkACwzsdqSbKP/WFP+fhD9Ls4=;
 b=VRRgBCfzh1h1+zf1/2R5FKitU6k8rvK4zhQ0qmvCZprlwH3dezOlZNtZ
 QWjjOyPO4AS3J6Po0CB567Kok6m1z5e11vbhImHsA1v+jPCLZzEuKFVig
 1DaasORgWmT9c+ocQZfyj22HnffnP88eMbLoB1GqnLAWSRb7oygeDagqL
 Tcrqcna7pAbV+SUf7vYD0SwjNIdneFSC2PK5JEBVpopXfIbHdBDw78EeH
 bZ1bBi/DqJ09Us/BMC68koZScaap1sD9tBTkodfLMYGDUAZDLEJqyeo+G
 /3A0zB1PvaQw0ZnGibn6PPqBJAnrOTEjCQdV7b2TPT08sgCrkhbgPMzt9 A==;
X-CSE-ConnectionGUID: 83JGp7MFSUOlhjr8eyvopg==
X-CSE-MsgGUID: yh29PYxmRACCxAdkhcnQkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44254267"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="44254267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:48:26 -0700
X-CSE-ConnectionGUID: b4EhgniLRDCE2jm+M6/VBQ==
X-CSE-MsgGUID: yhwM86f+RlixwMAOS/sBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169685537"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:48:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v4 10/12] drm/i915/display: Add function to configure
 LFPS sending
In-Reply-To: <20250526120512.1702815-11-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
 <20250526120512.1702815-11-jouni.hogander@intel.com>
Date: Tue, 05 Aug 2025 10:48:21 +0300
Message-ID: <7028a2b3d96cc6d4a66886d4d6ee4c74729fef6a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 26 May 2025, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index 91118d115fd3..75caccb65513 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -3225,6 +3225,37 @@ void intel_mtl_pll_enable(struct intel_encoder *en=
coder,
>  		intel_cx0pll_enable(encoder, crtc_state);
>  }
>=20=20
> +/*
> + * According to HAS we need to enable MAC Transmitting LFPS in the "PHY =
Common
> + * Control 0" PIPE register in case of AUX Less ALPM is going to be used=
. This
> + * function is doing that and is called by link retrain sequence.
> + */
> +void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
> +				 const struct intel_crtc_state *crtc_state)

Commenting after the fact:

Please don't combine "intel_" and platform prefixes like "lnl_" or
"mtl_". The file is a mess wrt naming.

BR,
Jani.



--=20
Jani Nikula, Intel
