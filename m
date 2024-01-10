Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696FFC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0210E624;
	Wed, 10 Jan 2024 17:58:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05110E624
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704909502; x=1736445502;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SyPxLP7SJ1k6Oov7tVi7sLLv4GRg1odgmanNXoKV0Og=;
 b=DHLdfe606nupbxd4XaMTklKZ64mIiuDJKZz5yQ7pbqfy983Zx6KhT383
 2tmE24vhljnFpi/z9Hb3Kw6wx3wlj6e2fM5manfDbDb/90iyDTcad44WT
 ZQP8ddaRokMonT7EfvNQm/74++LgP/GrfW6Hl3vL+N+16Ww/eIISnRhr3
 GQJZKL04ZQY5BSnLAs0PlSoYyllR9A3wHznIlPp2ngUzdW8rpcBQLYVxi
 yIAzYWdwFneaHbbOK0Id6JtgQ1fzvJ3//c1NfRaiTb+NcI1US1Wen5flJ
 C5WBnCWVSJsKh65ibnwNw+WwtsggxxNBueaDHRugo60w363ixFpoN9T/0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12087460"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="12087460"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775299744"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775299744"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 09:58:05 -0800
Received: from [10.249.134.210] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.210])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8CA659FA18;
 Wed, 10 Jan 2024 17:58:04 +0000 (GMT)
Message-ID: <fc88c15b-73c1-4fdc-97f9-ef1be85fe378@intel.com>
Date: Wed, 10 Jan 2024 18:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Use proper definitions while processing
 G2H events
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
 <ZZ3oVfxAx6EKHuZR@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZZ3oVfxAx6EKHuZR@DUT025-TGLU.fm.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10.01.2024 01:44, Matthew Brost wrote:
> On Wed, Jan 10, 2024 at 12:00:14AM +0100, Michal Wajdeczko wrote:
>> While dispatching G2H events we should use HXG EVENT definitions,
>> no need to rely on outer CTB layer definitions that forced us to
>> use shifted offsets:
>>
>> 	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
>> vs
>> 	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c29f095aa1b9..9d1d855da229 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -923,18 +923,21 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	return ret;
>>  }
>>  
>> -static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> +static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)
> 
> I can't say I love this change as we pass around ct->msg as an argument

IMO passing ct->msg together with the ct pointer is also questionable

> to bunch of other function and changing this to hxg makes this
> incongruent. Maybe change this patch to assign hxg from the msg first
> and then parse the fields from the hxg variable? Also maybe add a
> msg_to_hxg helper and cleanup all the msg[1] usage in this file too.
> This would make everything consistent.

since I also like consistency, lets start with local variable:

	u32 *hxg = msg_to_hxg(msg);

> 
> Matt
> 
>>  {
>>  	struct xe_device *xe = ct_to_xe(ct);
>>  	struct xe_guc *guc = ct_to_guc(ct);
>> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
>> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
>> +	u32 action, adj_len;
>> +	u32 *payload;
>>  	int ret = 0;
>>  
>> -	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
>> +	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>>  		return 0;
>>  
>> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>> +	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
>> +	adj_len = len - GUC_HXG_EVENT_MSG_MIN_LEN;
>> +
>>  	switch (action) {
>>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>>  		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
>> @@ -1145,7 +1148,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>  	if (unlikely(ret < 0))
>>  		return ret;
>>  
>> -	ret = process_g2h_msg(ct, ct->msg, len);
>> +	ret = process_g2h_msg(ct, ct->msg + GUC_CTB_MSG_MIN_LEN, len - GUC_CTB_MSG_MIN_LEN);
>>  	if (unlikely(ret < 0))
>>  		return ret;
>>  
>>
>> base-commit: 39df1f6b1259816cc42b5f2451ca5092fad340ce
>> -- 
>> 2.25.1
>>
