Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73DCC021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 15:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02C610E72F;
	Tue, 25 Feb 2025 15:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/3vfLkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24110E71B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740496145; x=1772032145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TgvhfsLdf5eQsEcRtPZIVY0v59gsVRm7qLNo+0faNYg=;
 b=i/3vfLkBbAatkG3QPZ8/THkFF8auaKanuTgPaLlv8Glht6c5UCCnBNtQ
 BpGAAstjf2usRiFnQBMzu1rd78G78oft/SqF+xhwzATuW+N/DrqrzeQxY
 92dsM/o10BaLBUj92R+oEcQFbyoAkY/wbuFZzlhsCjtVbOvW0H3Y4hZEa
 kkDyukvN2hptlMEh1+ry8kYGrJz8S0MFcBq5LLLaHeVl3Z+AG4EujVVpe
 DQkhLRJchVV76zZfykMfYsCJW2Bnko41eQdBEI2FiE3+TgdzB7HRFHKju
 C5cuqe2AGd7BZYz1I/zBRXXmUeBVR6yxhnLyRhFyL9AIoriAMv6lrWLrV g==;
X-CSE-ConnectionGUID: CBG+bV/NTA6T1Bfwl5EFwA==
X-CSE-MsgGUID: 4zrdI+cgSVqRuOsEXhrJNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40490190"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40490190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:09:04 -0800
X-CSE-ConnectionGUID: rYyUhy4QQjmMyK6hsrjKdw==
X-CSE-MsgGUID: 2AAAbZ1ZTFW83IA46Xd1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116901800"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 25 Feb 2025 07:09:02 -0800
Received: from [10.245.80.192] (unknown [10.245.80.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5192E2FC42;
 Tue, 25 Feb 2025 15:09:01 +0000 (GMT)
Message-ID: <03c26d55-286b-43b9-9f08-a1379d5a7bda@intel.com>
Date: Tue, 25 Feb 2025 16:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/kunit: Update RTP tests with SR-IOV rules
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-5-michal.wajdeczko@intel.com>
 <20250224225528.GD4460@mdroper-desk1.amr.corp.intel.com>
 <b415f920-0766-4a53-b97d-f5579ad3d04b@intel.com>
 <20250225031001.GH4460@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250225031001.GH4460@mdroper-desk1.amr.corp.intel.com>
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



On 25.02.2025 04:10, Matt Roper wrote:
> On Tue, Feb 25, 2025 at 12:41:09AM +0100, Michal Wajdeczko wrote:
>>
>>
>> On 24.02.2025 23:55, Matt Roper wrote:
>>> On Mon, Feb 24, 2025 at 04:06:59PM +0100, Michal Wajdeczko wrote:
>>>> Add more test cases that verifies use of RTP SRIOV() rules in
>>>> driver running as native, PF and VF mode.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
>>>>  1 file changed, 111 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> index 36a3b5420fef..b21474df933e 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> @@ -45,6 +45,8 @@ struct rtp_to_sr_test_case {
>>>>  struct rtp_test_case {
>>>>  	const char *name;
>>>>  	unsigned long expected_active;
>>>> +	unsigned long expected_active_pf;
>>>> +	unsigned long expected_active_vf;
>>>>  	const struct xe_rtp_entry *entries;
>>>>  };
>>>>  
>>>> @@ -469,6 +471,89 @@ static const struct rtp_test_case rtp_cases[] = {
>>>>  	},
>>>>  };
>>>>  
>>>> +static const struct rtp_test_case sriov_cases[] = {
>>>> +	{
>>>> +		.name = "non_vf",
>>>> +		.expected_active = BIT(0) | BIT(1),
>>>> +		.expected_active_pf = BIT(0) | BIT(1),
>>>> +		.expected_active_vf = 0,
>>>> +		.entries = (const struct xe_rtp_entry[]) {
>>>> +			{ XE_RTP_NAME("and"),
>>>> +			  XE_RTP_RULES(FUNC(match_yes)),
>>>> +			},
>>>> +			{ XE_RTP_NAME("or"),
>>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>>>> +				       FUNC(match_yes)),
>>>> +			},
>>>> +			{}
>>>> +		},
>>>> +	},
>>>> +	{
>>>> +		.name = "vf_ready",
>>>> +		.expected_active = BIT(0) | BIT(1),
>>>> +		.expected_active_pf = BIT(0) | BIT(1),
>>>> +		.expected_active_vf = BIT(0) | BIT(1),
>>>> +		.entries = (const struct xe_rtp_entry[]) {
>>>> +			{ XE_RTP_NAME("and"),
>>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_READY)),
>>>> +			},
>>>> +			{ XE_RTP_NAME("or"),
>>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>>>> +				       FUNC(match_yes), SRIOV(VF_READY)),
>>>> +			},
>>>> +			{}
>>>> +		},
>>>> +	},
>>>> +	{
>>>> +		.name = "vf_only",
>>>> +		.expected_active = 0,
>>>> +		.expected_active_pf = 0,
>>>> +		.expected_active_vf = BIT(0) | BIT(1),
>>>> +		.entries = (const struct xe_rtp_entry[]) {
>>>> +			{ XE_RTP_NAME("and"),
>>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_ONLY)),
>>>> +			},
>>>> +			{ XE_RTP_NAME("or"),
>>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>>>> +				       FUNC(match_yes), SRIOV(VF_ONLY)),
>>>> +			},
>>>> +			{}
>>>> +		},
>>>> +	},
>>>> +	{
>>>> +		.name = "pf_only",
>>>> +		.expected_active = 0,
>>>> +		.expected_active_pf = BIT(0) | BIT(1),
>>>> +		.expected_active_vf = 0,
>>>> +		.entries = (const struct xe_rtp_entry[]) {
>>>> +			{ XE_RTP_NAME("and"),
>>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(PF_ONLY)),
>>>> +			},
>>>> +			{ XE_RTP_NAME("or"),
>>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>>>> +				       FUNC(match_yes), SRIOV(PF_ONLY)),
>>>> +			},
>>>> +			{}
>>>> +		},
>>>> +	},
>>>> +	{
>>>> +		.name = "sriov_only",
>>>> +		.expected_active = 0,
>>>> +		.expected_active_pf = BIT(0) | BIT(1),
>>>> +		.expected_active_vf = BIT(0) | BIT(1),
>>>> +		.entries = (const struct xe_rtp_entry[]) {
>>>> +			{ XE_RTP_NAME("and"),
>>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(ONLY)),
>>>> +			},
>>>> +			{ XE_RTP_NAME("or"),
>>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>>>> +				       FUNC(match_yes), SRIOV(ONLY)),
>>>> +			},
>>>> +			{}
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>>  static void xe_rtp_process_tests(struct kunit *test)
>>>>  {
>>>>  	const struct rtp_test_case *param = test->param_value;
>>>> @@ -483,7 +568,28 @@ static void xe_rtp_process_tests(struct kunit *test)
>>>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>>>>  	xe_rtp_process(&ctx, param->entries);
>>>>  
>>>> -	KUNIT_EXPECT_EQ(test, active, param->expected_active);
>>>> +	if (IS_SRIOV_PF(xe))
>>>
>>> The xe here is a mock device (from drm_kunit_helper_alloc_device).
>>> Won't these SRIOV tests require something extra in
>>> xe_pci_fake_device_init() to ever be SRIOV-enabled?  Or am I overlooking
>>> something?
>>
>> yes ;)
>>
>> see xe_rtp_process_tests_{pf,vf} below, where we convert mock xe to be
>> PF or VF by explicitly altering xe->sriov.__mode
> 
> Oops, yeah.  Somehow I completely overlooked that part.
> 
> I'm not sure if we'll ever need to add more entries to xe_rtp_tests[],
> but should we switch the mode back to native at the end of those
> functions to prevent any subsequent tests from inheriting unexpected VF
> behavior?

no

every test case in the rtp test suite is getting its own freshly
allocated xe instance, see:

xe_rtp_test_init(test)
{
...
  xe = xe_kunit_helper_alloc_xe_device(test, dev)
...
  test->priv = xe
}

> 
> 
> Matt
> 
>>
>>>
>>>
>>> Matt
>>>
>>>
>>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_pf);
>>>> +	else if (IS_SRIOV_VF(xe))
>>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_vf);
>>>> +	else
>>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active);
>>>> +}
>>>> +
>>>> +static void xe_rtp_process_tests_pf(struct kunit *test)
>>>> +{
>>>> +	struct xe_device *xe = test->priv;
>>>> +
>>>> +	xe->sriov.__mode = XE_SRIOV_MODE_PF;
>>>> +	xe_rtp_process_tests(test);
>>>> +}
>>>> +
>>>> +static void xe_rtp_process_tests_vf(struct kunit *test)
>>>> +{
>>>> +	struct xe_device *xe = test->priv;
>>>> +
>>>> +	xe->sriov.__mode = XE_SRIOV_MODE_VF;
>>>> +	xe_rtp_process_tests(test);
>>>>  }
>>>>  
>>>>  static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
>>>> @@ -499,6 +605,7 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
>>>>  }
>>>>  
>>>>  KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
>>>> +KUNIT_ARRAY_PARAM(sriov, sriov_cases, rtp_desc);
>>>>  
>>>>  static int xe_rtp_test_init(struct kunit *test)
>>>>  {
>>>> @@ -533,6 +640,9 @@ static void xe_rtp_test_exit(struct kunit *test)
>>>>  static struct kunit_case xe_rtp_tests[] = {
>>>>  	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
>>>>  	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests, sriov_gen_params),
>>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_pf, sriov_gen_params),
>>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_vf, sriov_gen_params),
>>>>  	{}
>>>>  };
>>>>  
>>>> -- 
>>>> 2.47.1
>>>>
>>>
>>
> 

