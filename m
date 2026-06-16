Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF4CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 21:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F3D10EB84;
	Tue, 16 Jun 2026 21:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkPOBNBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BF910EB61;
 Tue, 16 Jun 2026 21:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781646539; x=1813182539;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=AX7H8IORXE9pwgOGNlV7s2gi2kbC4vKJ+wjrZzHy1Qs=;
 b=GkPOBNBhy5K27ott0TIs0f4SIC3rPfQpfMT0JewFUrcJVfvAo7TKqWgu
 RpGMJjeMFAuWEblVn4kc7Et5wPdd2ONOOUWJbHdpgmNZ+Gl5O/RoUqASz
 3UXvIjM8JQfL5X6PUwC5kJOteOKHUc0svuEp9RygbiTXMnqVmOJ579fK5
 mUQviJ1U0KvUghrUswhb7NE26Tl9Ts4hooLxVKGYCpxRHjX6xF2S6rmVy
 54pjzrT2X+g98QXAd9f1IuoSJy5yrPC4JqKoqm7aWC4C/p2rnkkbgbt7E
 GHndQ0sD4Dz6PPZpzziGKFu110fhATeYxUO5NrM/3zMz/Yiqr/S4uqr+X A==;
X-CSE-ConnectionGUID: XQmuA9XgSiixn/VG4YSu+g==
X-CSE-MsgGUID: amR7oVuYQ+6MZF817Hu75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93098882"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93098882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:48:59 -0700
X-CSE-ConnectionGUID: BHkKGzNUQMSc6R1zEwMwMA==
X-CSE-MsgGUID: tpd8L0efTEmlZEcz1aI/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247962851"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:48:57 -0700
Date: Tue, 16 Jun 2026 23:48:55 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com, 
 shawn.c.lee@intel.com
Subject: Re: [PATCH v2] drm/i915/display: update to the BW buddy configuration
In-Reply-To: <20260616184131.295013-1-vinod.govindapillai@intel.com>
Message-ID: <6b19d341-f587-3edc-304f-6eda8cdbe3f1@intel.com>
References: <20260616184131.295013-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2010714063-1781646538=:605841"
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

--8323329-2010714063-1781646538=:605841
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

Hi Vinod,

On Tue, 16 Jun 2026, Vinod Govindapillai wrote:
> Bspec has been updated for xe2_lpd+ platforms on how to handle
> the bw buddy prgramming in case no matching memory configuration

typo: *programming

Other than that:
Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> is found w.r.t the current page mask table. The recommendation
> is to keep the default settings for the related registers as it
> is without explicitly disabling the bw buddy.
>
> v2: removed extra explanation
>
> Bspec: 68871
> Suggested-by: Ville Syrjala <ville.syrjala@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_display_power.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 2e51dfcd5dce..3d348c5decee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -1634,9 +1634,12 @@ static void tgl_bw_buddy_init(struct intel_display *display)
> 	if (table[config].page_mask == 0) {
> 		drm_dbg_kms(display->drm,
> 			    "Unknown memory configuration; disabling address buddy logic.\n");
> -		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
> -			intel_de_write(display, BW_BUDDY_CTL(i),
> -				       BW_BUDDY_DISABLE);
> +
> +		if (DISPLAY_VER(display) < 20) {
> +			for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
> +				intel_de_write(display, BW_BUDDY_CTL(i),
> +					       BW_BUDDY_DISABLE);
> +		}
> 	} else {
> 		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask)) {
> 			intel_de_write(display, BW_BUDDY_PAGE_MASK(i),
> -- 
> 2.43.0
>
>
--8323329-2010714063-1781646538=:605841--
