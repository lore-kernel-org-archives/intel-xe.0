Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECEDC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 10:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D85C10E178;
	Thu,  9 May 2024 10:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZReO6Ryb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8F10E178
 for <Intel-Xe@lists.freedesktop.org>; Thu,  9 May 2024 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715249933; x=1746785933;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=184pstfZc6AQumvOaChlD2hlA6tpqpH/pUnLOzDaSn8=;
 b=ZReO6RybILQOt/xcWmxplRGtZi2ITgQg3UK6HVzTTnivTOv6Q4EQUszQ
 Stpw6YxAFqk1F7NrzMC3V5lMn6hbbRLpx9qu25ZoNqQ7ScsAF5m1Aqla5
 gNS8ZeIn4+JjGPfBsFkty8v3RNDE758NEXetneDo2GurFrdJOvE7UslSg
 3zoTrHNTlm3jilFViO3czi9sZf9RaCDTAZvWvR3JsD5Cif5cb7tcfDdnf
 crk98an1Lurwjv+xWHpaQIrvxsB7teciTkHjvV3kmoaQf4OPjRaTynZds
 jXXGwmNT/Jgbf/ulbmwdgttF6pSkq9SnMpJp7XmRObsOYNVpjSf04vyTd A==;
X-CSE-ConnectionGUID: kCQcnG4jRiaZaZsy4lxuRA==
X-CSE-MsgGUID: EF35xly7SHq3i/LZsJ3PCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11029940"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="11029940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:18:52 -0700
X-CSE-ConnectionGUID: /48+hEWmRu6sf83AOvhKyg==
X-CSE-MsgGUID: aVHbA+xcRsSfst/TwsD+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="29176790"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 09 May 2024 03:18:50 -0700
Received: from [10.245.96.165] (unknown [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E34F227BA0;
 Thu,  9 May 2024 11:18:48 +0100 (IST)
Message-ID: <eaf746a4-0bb8-4d98-b48a-786400cb073b@intel.com>
Date: Thu, 9 May 2024 12:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Remove spurious line feed in debug
 print
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240508224927.11341-2-John.C.Harrison@Intel.com>
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



On 09.05.2024 00:49, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Including line feeds at the start of a debug print messes up the
> output when sent to dmesg. The break actually appears between all the
> usefu prefix information and the actual string being printed. In this

typo

> case, each block of data has a very clear start line and an extra
> delimeter is really not necessary. So don't do it.
> 

this was also on my to-fix list,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 0151d29b3c58..ecbf0b116cc3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1435,7 +1435,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
>  
> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
>  
>  		drm_printf(p, "\tg2h outstanding: %d\n",
