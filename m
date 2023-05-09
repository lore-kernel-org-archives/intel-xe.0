Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE8C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 12:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D6710E087;
	Tue,  9 May 2023 12:49:53 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B6610E087
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683636591; x=1715172591;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xcj9h3Z3zBZtgqgrHvhaNx5ukzxR50Ep1dCsE8iTrfI=;
 b=f6a9Io1FdPW1T8Vhqh2Cq/PMFvOe2MqnQ7CI1uIYon+y1/p7TrlHrmpS
 fCOtF8myucXhRykn0MMcKSLnoWYIry3rV9urov+NShW3haKB1sxOPLxtb
 ICMSJn9wxdnJiI9qyxw0+zBkQ5i5O6r5mgSeGGrCVaa4H550mPuvZnbD3
 2ARhipoKenTfWI0pzp1E1IjLn5u8tTUqHWoF5aFMu10w9PimIH7RToklP
 UTbgbpNZ9B4Xvy+NOu0nRui4mJ6C4AlID00ERmb3xS5Lhyh6fmyxAemzd
 14XD391cODujcVLsl0hIo86Nil7IIltdpzTVtkLwVKGfMJDU3kC/0QOde A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330275515"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="330275515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945259495"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="945259495"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:49:48 -0700
Message-ID: <bbf4605d-4eca-c638-9a42-e3bddf2dddc6@linux.intel.com>
Date: Tue, 9 May 2023 14:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-10-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 09/31] drm/xe/guc: Read HXG fields from
 DW1 of G2H response
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


On 5/2/23 02:17, Matthew Brost wrote:
> The HXG fields are DW1 not DW0, fix this.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9055ff133a7c..6abf1dee95af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -782,13 +782,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>   		g2h_fence->fail = true;
>   		g2h_fence->error =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
>   		g2h_fence->hint =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
>   	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		g2h_fence->retry = true;
>   		g2h_fence->reason =
> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
> +			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
>   	} else if (g2h_fence->response_buffer) {
>   		g2h_fence->response_len = response_len;
>   		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
