Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C0C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B4810E1CC;
	Wed, 26 Jun 2024 21:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKBUBa9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E24C10E1CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436736; x=1750972736;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2ygx+KaUtyF0QfA6DAnYFeuagiA8C7i82sSMAMXbQSs=;
 b=PKBUBa9Kd+reAdJAGb9ult6BJmCCw2xlRNyXfMAkdMlFTTVC8UdeuB0x
 V8nEGZBmbXaGi9kDInY/7dUltYRScChmWKpNrxL5j3pssRQ0O2UXVFYY+
 w2rZm9xc0wKGXSdRxeK1r/HeBqeh+C3xsYRYSx3LToL+MiqCN0XJc+xgs
 i83SbPUbdAlo7cf+cuB6fcDllsMxITvh62qzUWFMG14kb8OCZgmy/i7e3
 KLMlI4ePiUfec6AqOLEnruy8M97i7h0b6faImvWKT4FdRDHQi6pZWICM8
 R3upmsFwt3gIrBS5+bm7qnbhylTJhxHXhH16DewbTxIQSpARR9iM0yiQ5 A==;
X-CSE-ConnectionGUID: WhUrXe/FS8K7bfHtGcc24g==
X-CSE-MsgGUID: AAaqaoZ7RF2PNjR8BdGMjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="41953352"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="41953352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:18:55 -0700
X-CSE-ConnectionGUID: yvcdjZeESiK3p53E/w3u4w==
X-CSE-MsgGUID: 9V4Cqz5VRtWjv6RRytKvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="67362075"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2024 14:18:52 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 799B02FC42;
 Wed, 26 Jun 2024 22:18:51 +0100 (IST)
Message-ID: <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
Date: Wed, 26 Jun 2024 23:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
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



On 26.06.2024 22:35, Souza, Jose wrote:
> On Wed, 2024-06-26 at 22:12 +0200, Michal Wajdeczko wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Including line feeds at the start of a debug print messes up the
>> output when sent to dmesg. The break actually appears between all the
>> usefu prefix information and the actual string being printed. In this
>> case, each block of data has a very clear start line and an extra
>> delimeter is really not necessary. So don't do it.
> 
> I guess the indention was to have one blank like between guc_ctb_snapshot_print() 'cmd[X]' lines and 'G2H CTB (all sizes in DW):'.
> I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print().

but 'cmd[XXX]' lines already have additional indent compared to 'H2G|G2H
CTB' headers so IMO this extra separation line seems unnecessary:

[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: TLB invalidation time'd out,
seqno=27, recv=26
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: H2G CTB (all sizes in DW):
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 1024
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 572
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 451
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 568
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 572
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[568]: 0x80670003
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[569]: 0x20007000
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[570]: 0x0000001b
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[571]: 0x80000003
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: G2H CTB (all sizes in DW):
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 4096
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 1024
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 210
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 3068
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 210
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 210
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
[ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      g2h outstanding: 1

and IMO printing empty lines is just a waste of paper ;)

> 
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> cherry-picked from [1]
>>
>> [1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 873d1bcbedd7..113e6348c6ac 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
>>  
>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
>>  
>>  		drm_printf(p, "\tg2h outstanding: %d\n",
> 
