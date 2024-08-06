Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A569C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 09:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277B10E010;
	Tue,  6 Aug 2024 09:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eB/fg7cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D2F10E010
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722936094; x=1754472094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qWQfZA1qXYfkvl46cMNGq038UxIAns2OR7p68Cs2ito=;
 b=eB/fg7cuol2ftv+UFTs8AuaMRRapxmQ9um/Dqohfv0ikYAec2eH8n3WN
 vNVDk6gQ5+dC+KjRjGf/2Hj1x2WGePKynDGdWFetG4+yCo4Ca0N15vqC7
 Oer8v1lFYYL9RQg+hmdJsS0uIb2p08cwLbjTuAmbX+U0BvRwSPVTe7s3K
 YEEPzY45Kc2RzXz2vaRh/EqicSI2QY6OmKTwflgEEDjNF1LNLbpma5Jfc
 ONQlxEoFc4Z1TD1tzz1OHSv0g9aprMazL3n5N0KfBmdZOS4EYwAHuNMWg
 4ZAcWy9QL4hK39GeJQ3kXkutTxsH2519kXWR+xgLZQmNP2eRqI9xOabqB A==;
X-CSE-ConnectionGUID: 6HvnIwqcTWiXmRnBIwUJKA==
X-CSE-MsgGUID: 2JKf/6zvRF+87+c0vmZYuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20817410"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20817410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 02:21:34 -0700
X-CSE-ConnectionGUID: 4vrl6FiERoiwfIy/1V//4Q==
X-CSE-MsgGUID: DPxLElV2SiyxzLp6cLbLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56385570"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2024 02:21:32 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7433C2F1E;
 Tue,  6 Aug 2024 10:21:31 +0100 (IST)
Message-ID: <7b0a9a05-3a98-4ec7-9c21-f9743602b16a@intel.com>
Date: Tue, 6 Aug 2024 11:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 matthew.d.roper@intel.com
References: <20240729102942.937680-1-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240729102942.937680-1-riana.tauro@intel.com>
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



On 29.07.2024 12:29, Riana Tauro wrote:
> Coarse Powergating is a power saving technique where Render and Media
> can be power-gated independently irrespective of the rest of the GT.
> 
> For debug purposes, it is useful to expose the powergating information.
> 
> v2: move to debugfs
>     add details to commit message
>     add per-slice status for media
>     define reg bits in descending order (Matt Roper)
> 
> v3: fix return statement
>     fix kernel-doc
>     use loop for media slices
>     use helper function for status (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---

...

> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>  	return gt_to_xe(gt);
>  }
>  
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}
> +

+ @Rodrigo

this helper was pushed to for-next/hardening branch [1], we might want
to cherry-pick it now instead of defining a local copy in our tree to
avoid build breaks later

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b

