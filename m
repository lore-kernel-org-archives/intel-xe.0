Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D5ECD98C5
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 22:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B8810E275;
	Wed, 10 Jun 2026 22:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHm133za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024E110E275;
 Wed, 10 Jun 2026 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781132358; x=1812668358;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=22z12FCqaC4O6kQcaoMZhiri5mvWgFDRmaeh9wYfM1U=;
 b=NHm133zaectnat28obXdv+BBAM9ytFQN0QQikjM44RFV0xPe1gKX9NUh
 5nMOy1H25yOB+EaXkSwkJXZElpZZW5OZNiKhgD5xGZHwaLXgE2h6RqDCx
 X7EVsFyPA2iFBodzaPL9iWkd1KxJ5kK3hMozEkymlm9hbewiQeBcs02CL
 Ju2TATNvgEVg3fAvin48GbndnwpMtqP2lSGk7Ul+AnKsUqHtKlN5oBX+W
 gXLgI+MqRMbLKLBELQLvdASzoBlEd9NHdSaBXZS8/57XGy2pU/G3NdJfo
 GVz0hLtbPnZJoWtqG7iZ5hhFQb2dGW6z4R0E7M4OHebz9rrh7lOyqaSE6 g==;
X-CSE-ConnectionGUID: NEp/GY+jR1mtd8k9xWGRyQ==
X-CSE-MsgGUID: wMW0mn2UQcC7I6WuuVWp7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92614165"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92614165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 15:59:17 -0700
X-CSE-ConnectionGUID: uqxM3epXSwGfpW9K7d1U4g==
X-CSE-MsgGUID: 3KgcIutETHSsj7lSX57iUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="269982114"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 15:59:16 -0700
Date: Thu, 11 Jun 2026 00:59:14 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH v1 0/9] drm/i915/scaler: allocation cleanup
In-Reply-To: <ailcPBpmqJ0wa7--@intel.com>
Message-ID: <0931bff3-d845-62e9-9299-9e182225fc56@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
 <ailcPBpmqJ0wa7--@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-803622898-1781130265=:1544314"
Content-ID: <c6832b7d-23a3-4372-2e70-0abff62f2fdf@intel.com>
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

--8323329-803622898-1781130265=:1544314
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <245b27a7-85d1-aea9-4737-f0b1345f7bfb@intel.com>

On Wed, 10 Jun 2026, Ville Syrjälä wrote:
> On Wed, Jun 10, 2026 at 01:12:08AM +0200, Micha³ Grzelak wrote:
>> Apparently during review of commit 17d70a0760f2 ("drm/i915/casf: Extract
>> scaler_has_casf()") I missed that argument plane_state isn't used
>> anymore. While at it couple other fixes included.
>>
>> This series will almost surely need a better splitting than currently
>> is, but I hope now it is slightly easier to review.
>>
>> BR,
>> Micha³
>>
>>
>> Micha³ Grzelak (9):
>>   drm/i915/scaler: remove unused plane_state argument
>>   drm/i915/scaler: s/i/scaler_id/
>
> Those seem fine.
>
>>   drm/i915/scaler: de-Morgan-ize !scaler_has_casf()
>>   drm/i915/scaler: move independent CASF check
>>   drm/i915/scaler: check CASF before allocation's loop
>>   drm/i915/scaler: inline CASF scaler allocation
>>   drm/i915/scaler: linearize scaler allocation
>>   drm/i915/scaler: move CASF alloc check into
>>     intel_atomic_setup_scaler()
>>   drm/i915/scaler: move CASF alloc check into setup_crtc_scaler()
>
> This looks like it's replacing a simple "does this scale have CASF?"
> check with some kind of more complicated special casing of the CASF
> scaler elsewhere. I don't like it.

Basically this part was my attempt at "remove `continue`s from
allocation loop" following [1], but no idea how to do it without moving
& obscuring the CASF check. Anyways can drop those.

BR,
Micha³

[1] https://lore.kernel.org/intel-gfx/acZezWKFo1QwLAci@intel.com/

>
>>
>>  drivers/gpu/drm/i915/display/skl_scaler.c | 43 ++++++++++++-----------
>>  1 file changed, 22 insertions(+), 21 deletions(-)
>>
>> --
>> 2.45.2
>
> -- 
> Ville Syrjälä
> Intel
>
--8323329-803622898-1781130265=:1544314--
