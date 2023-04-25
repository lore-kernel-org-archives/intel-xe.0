Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD05C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 11:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4516D10E27B;
	Tue, 25 Apr 2023 11:04:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136F10E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682420638; x=1713956638;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ogN+49gPVbrSjI/UA2Iqw+VpB6bzLKu+YF7f1DgVS1E=;
 b=O2sGyg6KzwQfCxBKh/Sb0CJichBbZQz/i8sQ4cx+mqkntOpxRLlErCnh
 LFUg+aZxLuWVRVlbRFz8ccRXTHWk7GRYvN3H+xNJDSDgNGhv4eLw8U6gC
 e7KFDq5q3LqfVMwbHy013rEb7X/wDzUPmGBSyg8jAc7RQ+9Vb8t7g5PRe
 qGGnuLVN87G9R8RuyixdLlbtNFB1JnbK3W81Fm9kijgHfKdzvRSh93csD
 qo/DJKUirEV1vPzVFrRwQoZtODZRjoeY50uyzMustHIYQeIpu7HrvuDiJ
 z2gbLxQxQQosJOCuguhBHqmu9AQzmWPvnBxEBxUjmoq5tgrCvd/ufy0+t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330944509"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="330944509"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 04:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782810204"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="782810204"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2023 04:03:55 -0700
Received: from [10.249.137.10] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.137.10])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 46AF537E3C;
 Tue, 25 Apr 2023 12:03:55 +0100 (IST)
Message-ID: <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
Date: Tue, 25 Apr 2023 13:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230421223258.128781-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 22.04.2023 00:32, Lucas De Marchi wrote:
> The macros for writing the rtp tables have some downsides:
> 
> 	1) They are fragile, and when making a typo it's hard to know
> 	   where it's failing for someone not used to them
> 	2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
> 	   work because they are defined exactly the same as the ones in
> 	   kernel.h.

hmm, I wonder why they were defined locally in first place ?
Can't you always use definitions from kernel.h ?

> 	3) They are not compatible with rules/actions with registers
> 	   passing additional options
> 
> This new implementation fixes (2) and (3).
> 
> For (2), prefix everything with "_XE", so there is less chance of
> clashes. Also, the maximum number of rules and actions is 4, so there is
> no need to make the helper macros go until 12: reduce that to 5, so if
> more arguments is passed, the compiler gives an error that there is not
> definition with _5 suffix.

I'm not convinced that adding local definitions with XE_ prefix that
mimics functionality already defined in kernel.h is the right way to go

> 
> For (3), change the implementation to concentrate on "pasting a prefix
> to each argument" rather than the more general "call any macro for each
> argument". Hopefully this will avoid trying to extending this infra and
> making it more complex. The new changes to how the arguments are
> constructed using tuples will allow extending the interface where it's
> needed: passing additional register fields to allow creating our own
> xe_reg_t.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index a3be7c77753a..53650f09efe9 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -22,43 +22,42 @@ struct xe_reg_sr;
>  /*
>   * Helper macros - not to be used outside this header.
>   */
> -/* This counts to 12. Any more, it will return 13th argument. */
> -#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
> -#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> +#define _XE_ESC(...) __VA_ARGS__
> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>  
> -#define __CONCAT(a, b) a ## b
> -#define CONCATENATE(a, b) __CONCAT(a, b)
> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> +#define __XE_CONCAT(a, b) a ## b
>  
> -#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
> -#define __CALL_FOR_EACH_2(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
> -#define __CALL_FOR_EACH_3(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
> -#define __CALL_FOR_EACH_4(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> +#define __XE_FIRST(x_,...) x_
> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>  
> -#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)					\
> -	CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
> -#define CALL_FOR_EACH(MACRO_, x, ...)						\
> -	_CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x, ##__VA_ARGS__)
> +#define __XE_PASTE_SEP_COMMA		,
> +#define __XE_PASTE_SEP_BITWISE_OR		|
> +#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  
> -#define _XE_RTP_REG(x_)	(x_), XE_RTP_REG_REGULAR
> -#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
> +#define _XE_RTP_REG(x_)		(x_), XE_RTP_REG_REGULAR
> +#define _XE_RTP_MCR_REG(x_)	(x_), XE_RTP_REG_MCR
>  
>  /*
>   * Helper macros for concatenating prefix - do not use them directly outside
>   * this header
>   */
> -#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
> -#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
> -#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
> -#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> +#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)

maybe local macros should be defined with full XE_RTP prefix and be
tailored for your specific RTP usecases:

#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## _ ## b

#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_RTP_CONCAT(ACTION, x_)
#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_RTP_CONCAT(RULE, x_)

then there will be no complains about overlapping functionality with
macros from kernel.h

>  
>  /*
>   * Macros to encode rules to match against platform, IP version, stepping, etc.
>   * Shouldn't be used directly - see XE_RTP_RULES()
>   */
> -
>  #define _XE_RTP_RULE_PLATFORM(plat__)						\
>  	{ .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
>  
> @@ -315,8 +314,8 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ENTRY_FLAG(f1_, ...)						\
> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
> +#define XE_RTP_ENTRY_FLAG(...)							\
> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>  
>  /**
>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
> @@ -338,8 +337,8 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ACTION_FLAG(f1_, ...)						\
> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
> +#define XE_RTP_ACTION_FLAG(...)							\
> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>  
>  /**
>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
> @@ -361,16 +360,15 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_RULES(r1, ...)							\
> -	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
> +#define XE_RTP_RULES(...)							\
> +	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
>  	.rules = (const struct xe_rtp_rule[]) {					\
> -		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
> +		__XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))	\
>  	}
>  
>  /**
>   * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
> - * @a1: Action to take. Last part of XE_RTP_ACTION_*
> - * @...: Additional rules, defined like @r1
> + * @...: Actions to be taken
>   *
>   * At least one rule is needed and up to 4 are supported. Multiple rules are
>   * AND'ed together, i.e. all the rules must evaluate to true for the entry to
> @@ -388,10 +386,10 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ACTIONS(a1, ...)							\
> -	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
> +#define XE_RTP_ACTIONS(...)							\
> +	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
>  	.actions = (const struct xe_rtp_action[]) {				\
> -		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
> +		__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA, (__VA_ARGS__))	\
>  	}
>  
>  void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
