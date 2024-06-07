Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8865C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 11:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E0F10EBEF;
	Fri,  7 Jun 2024 11:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjI/wH0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A610EBEF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717759388; x=1749295388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JbONgrXgyWt4Buv2Llwu5wua3cfG/4h2898ekiAgbpI=;
 b=PjI/wH0eqTDCxRhhSNrP0qoeyS2i8NPSmE3Y6rX7K9dLRn/qt7VAlU8R
 mfD48vizIHBKDWL4FSPoSRjJsRCfGeOIiCMhsQ4qMJsNfvzgJWuv5e182
 xRZrNiN5YaNmjlxxAnM3Q+sF6Vp/I+CAWLbi96LuFZyU+zQTrhKVtMchw
 HeC1Vv0j1f+kMvPsnEjiDP7UTQOoX9/VSU/z/k1alSAM8bnqxrEJcDpYc
 pc5FdeI5uNFYHPVnXwwn3pEzJD51O9X3IfUvjD1UAvYQ2AGLmZyL1h+og
 XEEpIYG8pkuoGF5SpGVDr7dmRWYs3w6AVTkx1kQCofu5z2ERxImVNL3Aw w==;
X-CSE-ConnectionGUID: Gol0eaC8TPG3qxc81wSYEQ==
X-CSE-MsgGUID: 4anoc53iT3iHks5zoEZFmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25578579"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="25578579"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:23:07 -0700
X-CSE-ConnectionGUID: madV9jVVRGWOS8RE78PWDA==
X-CSE-MsgGUID: KB95By5vRYyQg6Ue2Gnrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="43220741"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 07 Jun 2024 04:23:05 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 24D7027BBD;
 Fri,  7 Jun 2024 12:23:03 +0100 (IST)
Message-ID: <39637904-5d38-4f91-b528-9c235c2b8782@intel.com>
Date: Fri, 7 Jun 2024 13:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
 <20240607052213.1391082-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240607052213.1391082-2-himal.prasad.ghimiray@intel.com>
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



On 07.06.2024 07:22, Himal Prasad Ghimiray wrote:
> xe_force_wake_assert_held() is designed to confirm a particular
> forcewake domain's wakefulness; it doesn't verify the wakefulness of
> multiple domains. Make sure the caller doesn't input multiple
> domains(XE_FORCEWAKE_ALL) as a parameter.

maybe we should also copy above commit message as description of the
below helper ? but still, assert provides some level of guideline, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> v2
> - use domain != XE_FORCEWAKE_ALL (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..651ea1e62c63 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -32,6 +32,7 @@ static inline void
>  xe_force_wake_assert_held(struct xe_force_wake *fw,
>  			  enum xe_force_wake_domains domain)
>  {
> +	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
>  	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>  }
>  
