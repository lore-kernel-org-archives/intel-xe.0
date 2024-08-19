Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B782C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 17:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6010E345;
	Mon, 19 Aug 2024 17:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjLJR0TS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC1C10E345
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089946; x=1755625946;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0RSgbhzFESZjX3715l/0fuAegJsAd3Jur6euU/5a/3w=;
 b=NjLJR0TS8PmaSHlk7mUtG67McQSLDxVepHyADmaym64ZvFTMxmD9u2GI
 tZEwoPrhf7HJowN5M+Q2yAtaknr91qIWNHGCyYZaWWoVfT3sLTXZHj25i
 RsYzuTY+aEm+CiXt/LU4L8apqRRivI0Hyu69kLdccrKpnITUUzULMY/cN
 MCb1351gnC0bFbwzjJIwKFZ6CzD4JbOo5mFbPG3KwQHg6znW7V3EhULGH
 T9pn2/AYDWIBawLGHEhUuy9H7iYxS5ZH128MRwOFJC8SxXJ3QSIqyR4GT
 Ibxm3qYy12cLaW+RW8xq7ukIkXhXJjmGRNJej24lkq+TrS1qIc1OltR6r A==;
X-CSE-ConnectionGUID: aTcoAA5oSDyzrwoSBRFKnQ==
X-CSE-MsgGUID: xSIkQpycRR6+Lw7uI/pi9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26151533"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26151533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:52:26 -0700
X-CSE-ConnectionGUID: 8/ZAwEhkQcGiBhRxulOhDQ==
X-CSE-MsgGUID: exRG2TusSSGtWE4ty+Z7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64841809"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2024 10:52:24 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B3D222FC5B;
 Mon, 19 Aug 2024 18:52:23 +0100 (IST)
Message-ID: <d81d2034-695c-489d-bac5-026105a1c6ee@intel.com>
Date: Mon, 19 Aug 2024 19:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/xe/pf: Improve VF control
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-5-michal.wajdeczko@intel.com>
 <20240816130604.4c2b4rn2afkcuigr@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240816130604.4c2b4rn2afkcuigr@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 16.08.2024 15:06, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:51 +0200]:
>> Our initial VF control implementation was focused on providing
>> a very minimal support for the VF_STATE_NOTIFY events just to
>> meet GuC requirements, without tracking a VF state or doing any
>> expected actions (like cleanup in case of the FLR notification).
>>
>> Try to improve this by defining set of VF state machines, each
>> responsible for processing one activity (PAUSE, RESUME, STOP or
>> FLR). All required steps defined by the VF state machine are then
>> executed by the PF worker from the dedicated workqueue.
>>
>> Any external requests or notifications simply try to transition
>> between the states to trigger a work and then wait for that work
>> to finish. Some predefined default timeouts are used to avoid
>> changing existing API calls, but it should be easy to extend the
>> control API to also accept specific timeout values.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1203 ++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
>>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  107 ++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
>>  5 files changed, 1310 insertions(+), 15 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
>>
> 
> 
> <snip>
> 
>> @@ -284,3 +1295,165 @@ int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>>  
>>  	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
>>  }
>> +
>> +static bool pf_process_vf_machine(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	if (pf_exit_vf_flr_send_start(gt, vfid))
>> +		return true;
>> +
>> +	if (pf_exit_vf_flr_send_start(gt, vfid))
>> +		return true;
> 
> 
> hmmm... Should we call out this function twice here ? 

no, it's a typo (and one more, also harmless, later on)

> 
> 
> 
> Thanks,
> Piotr
> 
>> -- 
>> 2.43.0
>>
> 
