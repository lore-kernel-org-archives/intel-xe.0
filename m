Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E922C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 14:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EFB10EE24;
	Fri, 24 May 2024 14:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZb+rdY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605A710EE24
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716560808; x=1748096808;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RSmzKPYvQ4Of/Puyn43Wv6wB+0Gd3BPoZF3jHBZYI5o=;
 b=aZb+rdY/r3IqwPWQ1LPxv+p5H3QDl41i8xapva+GiPZ0l9xLGVkcOf8P
 S5n4v92BZeI1FvW4Rda9JKAbykbATyiXQ3HXkRce38uucDYz0WJfBikCI
 amD5C/YryZSs8cMzs6Qa8h0iq94VJORoTD0H/LZ8ivyt1z7hu95rXxLMl
 x3fG75XcAy+oR5do6iRVS2eLaCAHb2FJbcmwbEAIu/YuOcSJQzte/OfAM
 Nr0ZYtVjzv5Rgc/M+9KZQTmx47olbFcO2esdtKIjgnMoVGZaw0V8pkZ9k
 YBX7UKeERPPlWn7V3xzsEAriYmICyqrj/Qukh6zVMCzrvnAo6iH+ahMp4 w==;
X-CSE-ConnectionGUID: IdSc7klBRuy50ybeMPrUhA==
X-CSE-MsgGUID: y8AyOMSZRA2FfiJANiAoXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12767555"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12767555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:26:47 -0700
X-CSE-ConnectionGUID: gcJsR+IjTL6umEbku64s/A==
X-CSE-MsgGUID: dZicD+lfQuyhxcEauMor9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34532412"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:26:46 -0700
Message-ID: <fa111202-bd70-4ec2-bdb5-ac11786693f6@intel.com>
Date: Fri, 24 May 2024 16:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: allow unaligned start and size xe_res_cursor
 parameters
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18.04.2024 16:03, Andrzej Hajda wrote:
> xe_res_cursor code does not depend on the alignment. On the other side
> unaligned accesses are useful from pread/pwrite point of view.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Gently ping.

Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_res_cursor.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 0a306963aa8e..655af89b31a9 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -157,8 +157,6 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>   				   struct xe_res_cursor *cur)
>   {
>   	XE_WARN_ON(!sg);
> -	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
> -		   !IS_ALIGNED(size, PAGE_SIZE));
>   	cur->node = NULL;
>   	cur->start = start;
>   	cur->remaining = size;
> 
> ---
> base-commit: f9116f658a6217b101e3b4e89f845775b6fb05d9
> change-id: 20240418-xe_res_cursor-no-align-a3bd26482244
> 
> Best regards,

