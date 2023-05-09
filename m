Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF16C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D39410E0A5;
	Tue,  9 May 2023 13:02:42 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA5F10E0A5
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683637360; x=1715173360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NIeFCYndArNLjz+TDqOb+xSljMCqRo5gxZX8Ea23aqA=;
 b=enh/7uGFUT6ND9hiamdOOwCpjmSDhaFlpPaEcQ9qph/zfQGf1scbh7p1
 BvsL1zOJAS/3dO7TQqC0da9ctu3276L/QCXJaOmS0BOZ2l7KnXVAd3PB3
 xG/jehPTyyj6WkecKRT6wy78yO6Gk+cyMPkBENrkieCoYDufblnybJ8iI
 bZy26js2QOoUGOxJOnDnm5Rm+kwLULjZGK9TnO+DJjtQ13KntQfo0i/GU
 S8Q6+OmtQRb27BNSvVbrapnLMtfIfpBz+1SeGOFEZ64u4BB3g9potr6gj
 YN3/4pZH8vu735zfkjE7Y81/I9dZtHco2WTCgKpM+zuWGJA/1Bk+vx974 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="349951558"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="349951558"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="698891633"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="698891633"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:01:49 -0700
Message-ID: <25d089bb-3055-87e7-4940-c980081e98ba@linux.intel.com>
Date: Tue, 9 May 2023 15:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-13-matthew.brost@intel.com>
 <ZFVRExwzbhsqTvVm@rdvivi-mobl4>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFVRExwzbhsqTvVm@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 12/31] drm/xe/guc: Print doorbell ID in
 GuC engine debugfs entry
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


On 5/5/23 20:55, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:08PM -0700, Matthew Brost wrote:
>> This information is helpful so print it.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@intel.com>

>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 1b6f36b04cd1..880f480c6d5f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2016,6 +2016,8 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
>>   	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
>>   	drm_printf(p, "\tPreempt timeout: %u (us)\n",
>>   		   e->sched_props.preempt_timeout_us);
>> +	drm_printf(p, "\tDoorbell ID: %u\n",
>> +		   e->guc->doorbell_id);
>>   	for (i = 0; i < e->width; ++i ) {
>>   		struct xe_lrc *lrc = e->lrc + i;
>>   
>> -- 
>> 2.34.1
>>
