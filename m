Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC07C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 23:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7A310E033;
	Tue, 31 Oct 2023 23:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1A10E033
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 23:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698794460; x=1730330460;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sQtMKOLJmSL4oTn1DBHcZvlDn8JeZ5c7neIq3BcH+Gk=;
 b=BC7G3iBTZaK0mwWBfVYLE3muxhCXCM6D623RrOub4AbkbQi7sEpK55bF
 q1JtG+EUQC6c5Nz0mOAjWPwOz41cifiF24h8R7/QwrXQf0zfKNXlS7t/7
 3QzwFcbDyQkUmvfisUnHmJaBIu3PWVe083IY+zfcGio4ZnVLL2bZApgnI
 Kwk3/spsfl8WuQmvJjVfYTQNDoNf6vIVNVEfcC45Prm8Fpv+M0nqlTQW+
 Q8OQTC3tVPRe7W+J/JjMjiF3JLPSA7CCD82I3ib/Ixl/2VKUmv56C4Zm6
 n6PQbGDyzdJwNFAaQ3TT6ZhmQESULV6Nycv8AlYVG0DK5/+jouZ5beMBs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454863994"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="454863994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 16:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="2003348"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2023 16:20:57 -0700
Received: from [10.249.131.156] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.131.156])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6B9C84213B;
 Tue, 31 Oct 2023 23:20:56 +0000 (GMT)
Message-ID: <37b80d33-48bd-479a-b92c-df467c8e3fe4@intel.com>
Date: Wed, 1 Nov 2023 00:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231023221122.1025441-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231023221122.1025441-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Return the lower part of
 blocking H2G message
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



On 24.10.2023 00:11, Matthew Brost wrote:
> The upper layers may need this data, an example of this is allocating
> DIST doorbell.
> 
> v2 (Michal): Drop change of checking the return value.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8b686c8b3339..092a9563f80a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -26,6 +26,7 @@
>  struct g2h_fence {
>  	u32 *response_buffer;
>  	u32 seqno;
> +	u32 status;

this name might be misleading, as in response message we don't expect
'status', but rather generic 'data' from GUC_HXG_RESPONSE_MSG_0_DATA0

>  	u16 response_len;
>  	u16 error;
>  	u16 hint;
> @@ -749,7 +750,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		ret = -EIO;
>  	}
>  
> -	return ret > 0 ? 0 : ret;
> +	return ret > 0 ? g2h_fence.status : ret;

while this helps for cases when all returned data is in data0, and
likely caller didn't even provide buffer for the response, but it still
wont solve the problems with flexible size G2H responses, as caller, who
had provided buffer for the response, still doesn't know how many dwords
were copied into it

can we have similar logic as in i915 where we return response_len if
there was buffer provided, and response_data if not ?

>  }
>  
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -815,6 +816,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		g2h_fence->response_len = response_len;
>  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
>  		       response_len * sizeof(u32));
> +	} else {
> +		g2h_fence->status =
> +			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
>  	}
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
