Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681E6C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 19:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0358F10E0D6;
	Fri, 21 Jun 2024 19:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rp/7MXHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C260510E0D6
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999150; x=1750535150;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JuiLDWMWtETDQ9bcjHRTSz7abPcoEPRoN3iEXPW2fbM=;
 b=Rp/7MXHhvSvrsvVpNmDMcSDTuOZW9KlZEh8WgLfO3DlT/uANJMzgS0nU
 xYXKmR0JlvtKaacvGODiamp+NhDkd5y9QtrNK/6W8mdXa+vXp+6sk/IWg
 J601eHkxhLZMe3luC9MkBS44byKbgtGMP3xGDiuI0XCPG1kanfZ/M6JE6
 8WrIrhahu4Nj63/nJ7qOYAquIhIjYKl0egEb141IKPYriZMZhcrpvv3Ep
 fJpE56BSvSXOdiBwCUI0IrYBQrbomODZWamVr33GX0zqZscTMKYSQD57v
 /pXd2YzN44k9zkIUgubCHD1JxLIzLKkwAHPaVEzsTGHv4z5ZQRxpiSm8d w==;
X-CSE-ConnectionGUID: JDXf7AJcQYKULb6/kkETaA==
X-CSE-MsgGUID: AD60e2c1Rpa6VKppCQPvQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16193471"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16193471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:45:49 -0700
X-CSE-ConnectionGUID: 5J8Fmv6cTsecJQT6TBjjmg==
X-CSE-MsgGUID: VCaWRafBT/qtqg4O0en7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="43366233"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 21 Jun 2024 12:45:47 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4395D284FE;
 Fri, 21 Jun 2024 20:45:45 +0100 (IST)
Message-ID: <508be309-17c8-419a-92b4-91cd06d2cb6b@intel.com>
Date: Fri, 21 Jun 2024 21:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
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



On 21.06.2024 21:09, Ashutosh Dixit wrote:
> Include kernel doc's for 'enum drm_xe_perf_type' to fix kernel doc
> warnings.
> 
> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 93e00be44b2d..d831f277f186 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1379,8 +1379,11 @@ struct drm_xe_wait_user_fence {
>   * enum drm_xe_perf_type - Perf stream types
>   */
>  enum drm_xe_perf_type {
> +	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>  	DRM_XE_PERF_TYPE_OA,
> -	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
> +
> +	/** @__DRM_XE_PERF_TYPE_MAX: Non-ABI */

hmm, I would rather not document it at all, by marking it as:

	/* private: */

see https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#members

> +	__DRM_XE_PERF_TYPE_MAX,
>  };
>  
>  /**
