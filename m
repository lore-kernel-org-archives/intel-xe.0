Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B77C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 08:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6533810E094;
	Tue, 15 Apr 2025 08:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S00ngXha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82310E094
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744707382; x=1776243382;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gp7LSR3ybPvyPz/MuEcd1Lm3bLnAaqVUpDn9ZTw1uiE=;
 b=S00ngXhaLCCn7D05dX2FunHnbMR+3eMISG+tlcqqL1/WIk2Ll1zBS9NW
 O5uah5FDgKYhAzSY4A0vEX8Sp3DrbNJdtU0MPsKQ5rdz6nWT81QOCmYVi
 Sjc1Ot5C2lwArzlnh9ri6oIa5WQfsigxPICbEaSl1nxDKPoPvOzlQv+ms
 mrujZG0kDHQIEBbZdGXdEOWbM6uWSoOEt611ejYijJjOVEOoM1wC0Riyw
 96mqHuh1u/S1QKKzYInJpVId23oZwTmgAf0/BaVcZqznTN1WCz8YTVLr6
 Gh0mE6I6ajYpk8zZzEVzI/X/6shMuRVtjakZCyBXqxt/wG5XQoc7LhFT0 g==;
X-CSE-ConnectionGUID: 4ytdveGnSE2H4htzezEzkw==
X-CSE-MsgGUID: rlIOH9pvS7WNgwPwF3L8SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50031781"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50031781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:56:21 -0700
X-CSE-ConnectionGUID: fU+Jw/U7SRCZDO51ktn9lA==
X-CSE-MsgGUID: EWrnrL8OT/eqd+tGllaJgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135045798"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 01:56:19 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9BA6933BE8;
 Tue, 15 Apr 2025 09:56:18 +0100 (IST)
Message-ID: <fd748af6-e0f6-434d-ba05-8c2a16631533@intel.com>
Date: Tue, 15 Apr 2025 10:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add fault injection for
 xe_hw_engine_class_to_str
To: Sobin Thomas <sobin.thomas@intel.com>, intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
 <20250415064211.2889970-2-sobin.thomas@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250415064211.2889970-2-sobin.thomas@intel.com>
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



On 15.04.2025 08:42, Sobin Thomas wrote:
> - Added fault injection for `xe_hw_engine_class_to_str` to enhance coverage.

what kind of coverage this function really provides?

it returns string pointer so it's likely mostly used in the print()
functions which can handle the NULL

and even if it used for something weird when it's really hard to deal
with NULL string, then IMO simpler option would be to update this helper
function to always return non-null string even for the unknown or missed
class like "unk"

btw, it looks that XE_ENGINE_CLASS_MAX was a) just a bad choice to be
included as an enumerator, and b) only this one could return NULL

> - can be tested with igt@inject-fault-probe-function-xe_hw_engine_class_to_str

don't use bullets and "describe your changes in imperative mood"
see [1]

[1]
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 93241fd0a4ba..56d95635374a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1011,6 +1011,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>  
>  	return NULL;
>  }
> +ALLOW_ERROR_INJECTION(xe_hw_engine_class_to_str, NULL);
>  
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {

