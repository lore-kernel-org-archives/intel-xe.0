Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A831C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 09:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8D510E1BB;
	Mon,  8 May 2023 09:20:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283410E1BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683537652; x=1715073652;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1szgPpM5heoURi6qMR+oZRRyOobX7TEF7Zi4tzN0QyU=;
 b=J5oibhGXZfUwgwM29Q4PFL/VoBDVVEcMu+ImuYg4cmUR+cBq0wo7kR5l
 xNczDj6NnwGtgIY0ayIJEebQOgxz9azr2O+kh0/tHJbLYwYVmKVurZe2M
 DdcvAsJYCzilKljpqW6HAdTuvuF0evKqtDTiJI4UxLzdO+ftT5mzF7/IJ
 zVod8NPF43DIHhZyW6xvvmksQ5HCOpn6P8S/w9nVmf7XaXkoGQLwyB3gR
 9Zw22DNYldUIqQJbziCE84FShAdGx/I9BELCK9PcF2/QU1hQsCnY/eClw
 8vhSVCzq0ZmW5h+9MyuDsX3mKQ5zYEuv/NAWRj/FMIS8KogICeQwkXVQo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435916741"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="435916741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="729010429"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="729010429"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 02:20:49 -0700
Received: from [10.249.140.9] (mwajdecz-MOBL.ger.corp.intel.com [10.249.140.9])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 96E6C284DA;
 Mon,  8 May 2023 10:20:48 +0100 (IST)
Message-ID: <e705b751-163a-72bf-259c-137861d8d774@intel.com>
Date: Mon, 8 May 2023 11:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
To: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-11-matthew.brost@intel.com>
 <ZFVQfRnwEAOFiosk@rdvivi-mobl4> <ZFhMGOBuFUznJPk1@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZFhMGOBuFUznJPk1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 10/31] drm/xe/guc: Return the lower part
 of blocking H2G message
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



On 08.05.2023 03:10, Matthew Brost wrote:
> On Fri, May 05, 2023 at 02:52:45PM -0400, Rodrigo Vivi wrote:
>> On Mon, May 01, 2023 at 05:17:06PM -0700, Matthew Brost wrote:
>>> The upper layers may need this data, an example of this is allocating
>>> DIST doorbell.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
>>>  drivers/gpu/drm/xe/xe_guc_pc.c | 6 ++++--
>>>  drivers/gpu/drm/xe/xe_huc.c    | 2 +-
>>>  3 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 6abf1dee95af..60b69fcfac9f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -25,6 +25,7 @@
>>>  struct g2h_fence {
>>>  	u32 *response_buffer;
>>>  	u32 seqno;
>>> +	u32 status;

if purpose of this field is to hold data from the success reply, then
why it is called as misleading 'status' ?

in our spec we call it 'data0' see [1]

[1] https://www.kernel.org/doc/html/latest/gpu/i915.html?#hxg-response

>>>  	u16 response_len;
>>>  	u16 error;
>>>  	u16 hint;

btw, is there any true benefit to decompose HXG replies into these
fields in g2h_fence ? done/retry/fail modes are mutually exclusive,
while separate flags here can't guarantee that


>>> @@ -727,7 +728,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>  		ret = -EIO;
>>>  	}
>>>  
>>> -	return ret > 0 ? 0 : ret;
>>> +	return ret > 0 ? g2h_fence.status : ret;
>>
>> The problem I see here is how the upper level could differentiate
>> between and error and a status.
>>
> 
> g2h_fence.status is 16 (can't be negative), so 0 or greater is a good
> return.

to be precise, data0 from the success reply is 28-bit (see [1] above)

you probably mixed that with 16-bit error from failure reply (see [2])

[2] https://www.kernel.org/doc/html/latest/gpu/i915.html?#hxg-failure

> 
>> should we convert the functions to have an &status argument passed in?

it is not 'status'

>>
> 
> I like it the way it is but don't really care either way. I'll change
> this if you like.

HXG spec allows reply messages longer than 1dw (1dw = HXG header only)
thus if we claim support for such use case, as we do accept
response_buffer, then we should return actual length of the received
reply, rather than just data0, to allow caller parse flex size replies:

 * Return: Non-negative response length (in dwords) or
 *         a negative error code on failure.

but since majority, if not all, of our currently defined H2G defines
just data0, without extra data1, data2, ... then for such cases we
should rather provide separate wrapper that will make sure reply size is
exactly 1 (header only) and return extracted data0 from it.

and since data0 is just 28-bit we can still use single return value
documented as:

 * Return: Non-negative data0 from the success response or
 *         a negative error code on failure.

(as I still hope proper documentation will be prepared for core
functions near term, when it's most desired)

> 
> Matt 
> 
>>>  }
>>>  
>>>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>> @@ -793,6 +794,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>  		g2h_fence->response_len = response_len;
>>>  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
>>>  		       response_len * sizeof(u32));
>>> +	} else {
>>> +		g2h_fence->status =
>>> +			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
>>>  	}
>>>  
>>>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 72d460d5323b..3d2ea723a4a7 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -204,11 +204,13 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>>>  
>>>  	/* Blocking here to ensure the results are ready before reading them */
>>>  	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>>> -	if (ret)
>>> +	if (ret < 0) {

since almost all H2G expects data0 == 0 on success, this fix shouldn't
be necessary, unless you are hiding other issue ... which in this case
is lack of proper initialization of the 'status/data0' field in
g2h_fence_init()

and btw, long term we should likely be better prepared for more
unexpected replies from the GuC, including non-zero data0 replies ...
but that should be another patch anyway

>>>  		drm_err(&pc_to_xe(pc)->drm,
>>>  			"GuC PC query task state failed: %pe", ERR_PTR(ret));
>>> +		return ret;
>>> +	}
>>>  
>>> -	return ret;
>>> +	return 0;
>>>  }
>>>  
>>>  static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>> index 55dcaab34ea4..9c48c3075410 100644
>>> --- a/drivers/gpu/drm/xe/xe_huc.c
>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>>> @@ -39,7 +39,7 @@ int xe_huc_init(struct xe_huc *huc)
>>>  
>>>  	huc->fw.type = XE_UC_FW_TYPE_HUC;
>>>  	ret = xe_uc_fw_init(&huc->fw);
>>> -	if (ret)
>>> +	if (ret < 0)

ditto

>>>  		goto out;
>>>  
>>>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>> -- 
>>> 2.34.1
>>>

