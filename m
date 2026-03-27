Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5322A10ED641
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162BB10E15C;
	Fri, 27 Mar 2026 09:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRChGn1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1210E15C;
 Fri, 27 Mar 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774604685; x=1806140685;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=/ASU+3r9MJRKdHMZ03nxSTNCb2M9m7ZyNA3lDaA5fT4=;
 b=MRChGn1FnzgIWQrny9jkrop6vpRFo0Vi70Ltx3BdG6iw87LVlwJJPq1r
 oMFbuVAKlFvVWSIxnk+umkP9S5cGjjWxAB2tcn1+HKZnvGPw8Ksl8ikUG
 qFfNwtPLaLYdLAcX9nw95LdBsnIh38RwR6q9xXw9d1tDFC1G4xa9yxefx
 /DVgkMvWAX2t0iXz4feiskxEt7b6p6zU+lp8rBMDA09t7PxcxYhDUL3qb
 3vwgNm+/5BXnVGn32J2AaQGc2+BRzBo7nmi62FWDh1HTsXXulNzknLXPG
 S05cLfR9anHpPR4gr9TN2k0B4k/EnFxKbravZ/r2L8dp4Qglcz4m1U+eL Q==;
X-CSE-ConnectionGUID: y3n9iRpAQDG6NRWxgBpdpA==
X-CSE-MsgGUID: KGvM5FTKQjCFFjkWfdHj4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101135041"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="101135041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:44:44 -0700
X-CSE-ConnectionGUID: ryLW/m27S3ean4i9b8Iwxg==
X-CSE-MsgGUID: P1YTKZE4R4SeH1856A1qDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="222392757"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:44:44 -0700
Date: Fri, 27 Mar 2026 10:44:41 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 6/9] drm/i915/casf: Constify crtc_state
In-Reply-To: <20260326223139.19116-7-ville.syrjala@linux.intel.com>
Message-ID: <cc853479-50d7-d491-6375-04d08649bc2e@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1945683983-1774604684=:356608"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1945683983-1774604684=:356608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Make the crtc_state const everywhere in the sharpness filter
> code where it doesn't need to be mutated.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1945683983-1774604684=:356608--
