Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80391CD4847
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 18:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1939010E1A0;
	Fri, 22 Sep 2023 18:06:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF1210E1A0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695405990; x=1726941990;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GQFTh+vr8uL68Ol2WDulehkF8TIIUC6TS/aEwUELYss=;
 b=mbcKu8JrzPW4OYNsVQmyi16YFa0NoiwdEg1EhxqJHqgEc9zo7JRbM+M3
 N9+kSuwF+88WN9RIPFGeFy9DId1CSrT4Ee2fRmqo0n72POyUbxeWAvZbG
 lc5Du7cUZ/XoOHWv/jDlRr5tXZ4H4BptosbM4wlV+v05V6wCpTj5+fM4v
 LH1wSMKyzJYuW14Y5cJw5IU1dN9h21U4AUR+b5t8N3dSmxV6dzYEYV8+g
 FLb+ozhhrN/mOiR8EnI7xqIwtVLl1PdpvsOwaNjLKZgSfMj1j4hW37Yxk
 4MuBa71opK8EJt52L77VlXrC8sTMAcYzPw4QxggU/fmIQ5QHZoACBuqJ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447384515"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="447384515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 11:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="994642493"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="994642493"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2023 11:06:27 -0700
Received: from [10.249.129.188] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.188])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 78AE932C8B;
 Fri, 22 Sep 2023 19:06:26 +0100 (IST)
Message-ID: <db333141-3d06-69a0-5fc0-2386f2caeb20@intel.com>
Date: Fri, 22 Sep 2023 20:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230922174320.2372617-1-lucas.demarchi@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230922174320.2372617-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Accept a const xe device
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



On 22.09.2023 19:43, Lucas De Marchi wrote:
> Depending on the context, it's preferred to have a const pointer to make
> sure nothing is modified underneath. The assert macros only ever read
> data from xe/tile/gt for printing, so they can be made const by default.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_assert.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 4cbe1b213432..035e6a44afe6 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -86,7 +86,7 @@
>  })
>  #else
>  #define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> -	typecheck(struct xe_device *, xe);							\
> +	typecheck(const struct xe_device *, xe);						\
>  	BUILD_BUG_ON_INVALID(condition);							\
>  })
>  #endif
> @@ -107,7 +107,7 @@
>   */
>  #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
>  #define xe_assert_msg(xe, condition, msg, arg...) ({						\
> -	struct xe_device *__xe = (xe);								\
> +	const struct xe_device *__xe = (xe);							\
>  	__xe_assert_msg(__xe, condition,							\
>  			"platform: %d subplatform: %d\n"					\
>  			"graphics: %s %u.%02u step %s\n"					\
> @@ -145,7 +145,7 @@
>   */
>  #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
>  #define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> -	struct xe_tile *__tile = (tile);							\
> +	const struct xe_tile *__tile = (tile);							\
>  	char __buf[10] __maybe_unused;								\
>  	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
>  		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> @@ -169,7 +169,7 @@
>   */
>  #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
>  #define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> -	struct xe_gt *__gt = (gt);								\
> +	const struct xe_gt *__gt = (gt);							\
>  	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
>  			   __gt->info.id, __gt->info.type, ## arg);				\
>  })
