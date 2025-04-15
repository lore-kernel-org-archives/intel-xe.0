Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D186C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 16:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223C10E7E0;
	Tue, 15 Apr 2025 16:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkQJ4cDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F37210E7E0
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744733210; x=1776269210;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LJekK4WoHrb7omhKR4zS6eqp6LHKW+KW+CgBnYsD9Ec=;
 b=PkQJ4cDfkHOCsJB3egCEnvYU8jGOIBnvhL/Y7S/yJW0z78sPLi1cDr3V
 kONXRFSshM13bJTe7YdJ3W9QHOyuI3bI1dqIJu7bH56J3Ox2oSkKmhTAg
 H2pFMImAtmBreMZeTwhgqmMoK1X0natZG7YlKYATk9OJyQ0QhBvZN028M
 oaAajZIVDzQJoeDdpeBi/j+4p1Qiz0nvtthVCggybAKYyVvy2CHf15cXS
 XCbIH+yRf/flFS5llF8k/j+6TUV828g8RQG6LRDowg/jzxVPJD9UPNW65
 1S7M32uzWOPB7BpO/qtzt6vvXL/OlRiStoQFm2Vp/oXNg/y7Y+zCUPoff w==;
X-CSE-ConnectionGUID: XpUOXS7ATReOQGN5At9AOw==
X-CSE-MsgGUID: nf+en7OqRpygHkZWC8UD6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57636327"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57636327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 09:05:48 -0700
X-CSE-ConnectionGUID: NMpX1HDLTP+3e25dExXOjA==
X-CSE-MsgGUID: Vy0aaSnGQa6bYOTTdyqfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134947603"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2025 09:05:41 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 17AE332CA8;
 Tue, 15 Apr 2025 17:05:39 +0100 (IST)
Message-ID: <95fed6d0-424c-4ec1-8cff-a76be2e4e51f@intel.com>
Date: Tue, 15 Apr 2025 18:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Introduce fault injection for guc CTB
 send/recv
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
 <20250403120641.7258-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403120641.7258-3-satyanarayana.k.v.p@intel.com>
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



On 03.04.2025 14:06, Satyanarayana K V P wrote:
> Fault can be injected with below steps.
> 
> FAILTYPE=fail_function
> FAILFUNC=xe_guc_ct_send_recv
> 
> echo > /sys/kernel/debug/$FAILTYPE/inject
> echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> 
> echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> echo -1 > /sys/kernel/debug/$FAILTYPE/times
> echo 0 > /sys/kernel/debug/$FAILTYPE/space
> echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 686fe664c20d..4852f08dd370 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1088,6 +1088,7 @@ int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
>  	return guc_ct_send_recv(ct, action, len, response_buffer, false);
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_ct_send_recv, ERRNO);
>  
>  int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 *response_buffer)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

