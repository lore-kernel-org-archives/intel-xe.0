Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32924C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 09:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0412410E4F7;
	Tue, 30 Jul 2024 09:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFuLlzt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768F10E4F7
 for <Intel-Xe@lists.freedesktop.org>; Tue, 30 Jul 2024 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722330892; x=1753866892;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/7v+6clOWK+Eb4z8j4NqxUuXtPahr2PMXgHmGzhbcW4=;
 b=OFuLlzt6fUdfcv3UXegc2pUEZ0+V9w6wJ6Bt5xmIzAIJGumHFrKeHqAS
 WgAjHRiohU6cjxsdIva91nLdBXTlqDd1PkZ9bQPWJJAd/qzkrSz4tvfUo
 8cwbT6R0S2izDwC/aZXDZZB/p3BUEr1mYtKvrdlgLdNDSrWAkKqQQeSfR
 j8UivON9qjSj81MaO9pJIGIl9f7fRz+snqtE1cbKnxnrMbwmZWsXkVf8f
 3G7Kbp3TUUSm2G+vnrMhebEF1CazysGZtGdzxH3S7ifLHL6jO+mE7AH0t
 uc5ydetozdUcEml0au7URmNMe1NP2ces4DLIsL2XU8borUGCPNrSOemic w==;
X-CSE-ConnectionGUID: B1TonrXqR/SHPUE1+bavRQ==
X-CSE-MsgGUID: DXfNZGCpRYCSBAbRftrWsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23050546"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23050546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:14:49 -0700
X-CSE-ConnectionGUID: 1g2p5KCcReW2xDfN+E4iGw==
X-CSE-MsgGUID: bJbG+4rPR1qHQouh6dGa/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="53940027"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2024 02:14:48 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DF4472816E;
 Tue, 30 Jul 2024 10:14:46 +0100 (IST)
Message-ID: <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
Date: Tue, 30 Jul 2024 11:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org,
 "Souza, Jose" <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240729231753.3101070-2-John.C.Harrison@Intel.com>
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



On 30.07.2024 01:17, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Including line feeds at the start of a debug print messes up the
> output when sent to dmesg. The break actually appears between all the
> usefu

typo

> prefix information and the actual string being printed. In this
> case, each block of data has a very clear start line and an extra
> delimeter is really not necessary. So don't do it.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

there was some discussion about merging this one without a conclusion

[1] https://patchwork.freedesktop.org/patch/601018/?series=135447&rev=1

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index beeeb120d1fc..422c3f5c87d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1515,7 +1515,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
>  
> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
>  
>  		drm_printf(p, "\tg2h outstanding: %d\n",
