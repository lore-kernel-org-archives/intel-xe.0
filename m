Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF2BC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE91410E08F;
	Tue, 24 Jun 2025 09:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7dX+dkP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3F10E08F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750758381; x=1782294381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CoAG8d120CrOCw0Kh222Gx7ppTU37PgOuBYYWmGMg6k=;
 b=T7dX+dkPwxcAcz31mY0JR2BGS2eoXIEMSIWpvUi7kLo96mnGcWu7uB6h
 xuyF6NyNbNl8Gid2fXNpzu2eDgG8Ng3E69ULMaBPwsluAl7fyHbNvwjt8
 Vr073WLJ2r3v/zfFmhiqgIyM2SWPGJdfV4x9J6EI1fDZJ3xoYUoN1PS2g
 vZaLsmannWG/HDIma53fLYBkh5KwMOPa892CQ/W8P3AEsjWtC1arDhTaO
 lSuk8o2CAcxopNMwTJF0ZH79yuEHvFUxfWn/oWgsOSaQhWpOWim3cceLG
 TzUNOX5T69IEh1mBYij4rsjS8d23W/TAJHCVMTPfXaisKcEcmPV97hqVx w==;
X-CSE-ConnectionGUID: H7IaO557Q8q7HFTGNUaenA==
X-CSE-MsgGUID: 6oKpdzI3TquTlwnI8t42lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56796236"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="56796236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:46:20 -0700
X-CSE-ConnectionGUID: FDPbBufKRIuQINH8quoT+w==
X-CSE-MsgGUID: FXHiYmglRkeT/fWodfxKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="189064161"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 24 Jun 2025 02:46:18 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 57BBE2FC79;
 Tue, 24 Jun 2025 10:46:17 +0100 (IST)
Message-ID: <33d3faf0-40b3-400a-be2c-7366e28b7f94@intel.com>
Date: Tue, 24 Jun 2025 11:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
 <20250624092213.2876711-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250624092213.2876711-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 24.06.2025 11:22, Piórkowski, Piotr wrote:
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 68fe70ce2be3..cd63cdd2dc78 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -145,7 +145,7 @@
>  	const struct xe_tile *__tile = (tile);							\
>  	char __buf[10] __maybe_unused;								\
>  	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> -		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physical_size, 1,	\
>  				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>  })
>  

this assert will cause NPD on !DGFX, likely you need at least this:

__tile->mem.vram ? __tile->mem.vram->actual_physical_size : 0

