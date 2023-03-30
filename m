Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552ADC761A6
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 15:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1113C10EED9;
	Thu, 30 Mar 2023 15:38:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C860D10EED1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190692; x=1711726692;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=psy7zpZbzOI95wcNzvHaAvbizkWSmFwF9R/flFrUx9k=;
 b=jbxn6ksYOpiFUHZBkCs7X2N+bgSByAYa7TViXg+pZ9RqDlrWV+OkMmXh
 GwMZ0B77iePhwjCY8Mf4Im2d2BwSIxfs9B151blQgPMtUgwcMSqgAl+at
 aJdcuuUHZ1NZOeg9FUq4C2mY5BRyGEZp0UfK1/HrGoslr5D4V12y/AutX
 PiJj7jYskEvjmBk3KuUPlteBabPy3FdGubUQt9Yfbwl8o+3oRVRi/744o
 A0d8cM+C/9yA+1B7XwVJaA4L+ILcqBbk1xjh3xmfiUus2ppAQp+0np+j7
 UyY2A928Ata61BppcyX2RehBDORHrLJ7SyMigg4FRySAto4LmKWtwJIyY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325154749"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="325154749"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="717353326"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="717353326"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 08:38:10 -0700
Received: from [10.249.150.240] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.240])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 08403365BD;
 Thu, 30 Mar 2023 16:38:09 +0100 (IST)
Message-ID: <10c2bc38-176b-5e7a-baf6-7233831eb201@intel.com>
Date: Thu, 30 Mar 2023 17:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230328210920.2110910-1-matthew.brost@intel.com>
 <20230328210920.2110910-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230328210920.2110910-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/guc: Read HXG fields from DW1 of
 G2H response
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



On 28.03.2023 23:09, Matthew Brost wrote:
> The HXG fields are DW1 not DW0, fix this.

the problem is (was) that some of new Xe CTB code is not correctly
distinguishing between the CTB message (transport layer) and HXG message
(payload of CTB, actual H2G/G2H message)

note that all HXG actions definitions describe HXG messages that start
at DW0 (hence MSG_0, MSG_1 and so on)

thus using:

	FIELD_GET(GUC_HXG_xxx_MSG_0_yyy, msg[1]);

seems just wrong and better to be replaced with:

	FIELD_GET(GUC_HXG_xxx_MSG_0_yyy, hxg[0]);

where:

	u32 *hxg = ctb_msg + GUC_CTB_MSG_MIN_LEN;

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..e5ed9022a0a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -783,13 +783,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
>  		g2h_fence->error =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
>  		g2h_fence->hint =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
>  	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>  		g2h_fence->retry = true;
>  		g2h_fence->reason =
> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
> +			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
>  	} else if (g2h_fence->response_buffer) {
>  		g2h_fence->response_len = response_len;
>  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
