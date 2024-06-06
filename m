Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6415C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 12:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B35410E93B;
	Thu,  6 Jun 2024 12:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWLK51Gr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D657910E93B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717678192; x=1749214192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ez2ByGNBXClGudQ+UB/nIc/90v+G4wpuUqaib1h2nbs=;
 b=iWLK51Gr7Ajrko4ExtX5unriFBLKkfKOvbP4DFOY3AmEi0GKHM8mM6aT
 BCXvwUI1oexlS/1+9HHTZ4jvebeDF/ZIdNSjf3U5F+vw256InWf0BVXru
 wTvSIXlMZ76M6kzxU4MnH/bXVCIR2zx8CMP0eVqJLJg9KaG7RAAKoCTw6
 Cu/P5tGj/PySM6UJSAO/8Qvu+C/71xWKl0VgJ1h1qfYWSa7uHpoy3cr+i
 L/C6MTfoD6l4IfICpbCqHV9h3zHCGySoEqFzn8xzxiKZZm6hLw9YcbGMX
 0OieIYj0GyxwMAykB0CpusEkIC1mIr4OxZ4HGO6iUTMQCesXbBJSQiOpT g==;
X-CSE-ConnectionGUID: wtjkv76cSoCm+8GX0vBJxg==
X-CSE-MsgGUID: Bqn11QgUQu+HKdpMYkKEEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14181865"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14181865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:49:51 -0700
X-CSE-ConnectionGUID: vCvySK65QKe+3oJmxiUo4g==
X-CSE-MsgGUID: W85SnaX1SxqxRGDVsXqw3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37965750"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2024 05:49:49 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4B5A272;
 Thu,  6 Jun 2024 13:49:44 +0100 (IST)
Message-ID: <04a2aea6-9aea-44eb-9619-55bf744df85f@intel.com>
Date: Thu, 6 Jun 2024 14:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
 <20240606124133.1353738-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240606124133.1353738-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 06.06.2024 14:41, Himal Prasad Ghimiray wrote:
> xe_force_wake_assert_held() is designed to confirm a particular
> forcewake domain's wakefulness; it doesn't verify the wakefulness of
> multiple domains. Make sure the caller doesn't input multiple domains as
> a parameter, this will ensure caller doesn't use xe_force_wake_assert_held
> with XE_FORCEWAKE_ALL parameter.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..cee8ff039f83 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -32,6 +32,9 @@ static inline void
>  xe_force_wake_assert_held(struct xe_force_wake *fw,
>  			  enum xe_force_wake_domains domain)
>  {
> +	/* Ensure caller is not passing multiple domains */
> +	xe_gt_assert(fw->gt, !(domain & (domain - 1)));

as all enumerators but XE_FORCEWAKE_ALL are defined as BIT then maybe it
is sufficient to just use clear to understand:

	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);

> +
>  	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>  }
>  
