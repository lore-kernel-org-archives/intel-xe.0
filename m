Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ED6C4707B
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 13:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEDB10E09A;
	Sat, 13 Jan 2024 13:01:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86F10E09A
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705150869; x=1736686869;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JtC/etZo9VmIcerkxN9mtX8eG7pTnOaXc6zDf33Q4FA=;
 b=Ji1bBlXIzaZv+59N1nGfK53ofSUmBgcuKfl+mxdiG8gpGEddpgKPMPl2
 5xREiWFy75L/e/C+8buDDje4xvvPKpSdFndl5B9IoW0wC1ltnsGbRMkcA
 FsXv19Ax3h/s0YoqZHL7+yXH0vUzHSY/jsALEdMv2igLmzMQRtqjAlXM3
 zXchDy8PTDwpzVeb0JovLF1osN3ST0SXF2DqooiPgHLSknGgyC63ZhL7p
 wiQoWbE3gQ6H9JPcnp7rykLfCDQtF30XrKmE9QLEBv8aQqF8/jXb4H9Lp
 dY12bGoAjoOilNnYfj3ZZEs/FfdITXWk4Iv23KImdxEiNSGtIU5zntwy3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430549742"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; d="scan'208";a="430549742"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2024 05:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; d="scan'208";a="31676166"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 13 Jan 2024 05:01:06 -0800
Received: from [10.249.135.156] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.156])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CFA5557BBF;
 Sat, 13 Jan 2024 13:01:05 +0000 (GMT)
Message-ID: <932f978f-0016-4393-93c0-aac32007e3f5@intel.com>
Date: Sat, 13 Jan 2024 14:01:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
 <20240112102554.761-2-michal.wajdeczko@intel.com>
 <ZaHHZNtB4ZEvMWJi@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZaHHZNtB4ZEvMWJi@DUT025-TGLU.fm.intel.com>
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



On 13.01.2024 00:12, Matthew Brost wrote:
> On Fri, Jan 12, 2024 at 11:25:54AM +0100, Michal Wajdeczko wrote:
>> The communication with the GuC firmware is crucial for the driver
>> but unfortunately it has limited documentation.  Add initial
> 
> The first sentence doesn't seem necessary.

can drop while pushing

> 
>> documentation for recently updated xe_guc_ct_send_recv().
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 4ae1a0cd9537..ee5d99456aeb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -785,6 +785,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
>>  }
>>  
>> +/**
>> + * xe_guc_ct_send_recv - Send and receive HXG to the GuC
>> + * @ct: the &xe_guc_ct
>> + * @action: the dword array with `HXG Request`_ message (can't be NULL)
> 
> What's the deal with the _ trailing everwhere? Is this kernel doc link thing?

yes, see [1]

[1]
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-references


> 
> Matt
> 
>> + * @len: length of the `HXG Request`_ message (in dwords, can't be 0)
>> + * @response_buffer: placeholder for the `HXG Response`_ message (can be NULL)
>> + *
>> + * Send a `HXG Request`_ message to the GuC over CT communication channel and
>> + * blocks until GuC replies with a `HXG Response`_ message.
>> + *
>> + * For non-blocking communication with GuC use xe_guc_ct_send().
>> + *
>> + * Note: The size of &response_buffer must be at least GUC_CTB_MAX_DWORDS_.
>> + *
>> + * Return: response length (in dwords) if &response_buffer was not NULL, or
>> + *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
>> + *         a negative error code on failure.
>> + */
>>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  			u32 *response_buffer)
>>  {
>> -- 
>> 2.25.1
>>
