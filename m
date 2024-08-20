Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86188C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 10:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1A710E6D4;
	Tue, 20 Aug 2024 10:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE4IThXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C810E6D1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724149435; x=1755685435;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pbBsyVsP8Pq7a6Kxe8nUZvLhgJcKiyqKOOLNDPsc0g4=;
 b=jE4IThXA59TuYz7w6zw5e3AdbyotPte6UkfSGoX2PbhUFhXT1dl0zCDl
 198JXE+rWTrbn9o3i4npgdx9zoU7FLbzaSWpCtjtOibUSgLbvpRJkPbSU
 0GrF1P9C2NvyHGVLFOYR+oTsSfaA8lJjRgPWTJxOGb76lAQj4K2BKRNS/
 IjhDjtW/boQI3xNAGJPQLDVRhWTsGMXvDnX63co8L0+Lm3kohAVImOVLP
 UYxZha6qRcKpD+ldMV6XfJ9bVI5IhkRkkG5bR2pb52Ti1pZL0YzOGaXEQ
 n0ffh6KD1cDNRbG5I/ywomi0O88A7/cdXFsM5nDCnwfAjZXYboeHfdDrE A==;
X-CSE-ConnectionGUID: 89KvxztIQMKJX3UG3RnAYw==
X-CSE-MsgGUID: EPAoo4cWQMujq+O6Sd/Z5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22603801"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22603801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:23:48 -0700
X-CSE-ConnectionGUID: 3MmALU4eT5q9hzvrNZLyEw==
X-CSE-MsgGUID: CgrTnT2bS6+RaJR5ozTW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64867858"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 03:23:45 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4D01E28778;
 Tue, 20 Aug 2024 11:23:44 +0100 (IST)
Message-ID: <c79f9e25-6c72-42a1-82bf-7e5ff9911866@intel.com>
Date: Tue, 20 Aug 2024 12:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/xe/tests: Allow deferred function call during
 KUnit test
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-6-michal.wajdeczko@intel.com>
 <7x7kzxucmjabvmoxb2x33qcp7gzrvn7ga2gg5vtlrpipntq5rr@pdahgmswbk3w>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <7x7kzxucmjabvmoxb2x33qcp7gzrvn7ga2gg5vtlrpipntq5rr@pdahgmswbk3w>
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



On 19.08.2024 23:38, Lucas De Marchi wrote:
> On Fri, Aug 09, 2024 at 06:51:52PM GMT, Michal Wajdeczko wrote:
>> For some advanced test cases we might want to simulate external
>> activity that will stimulate function under test. Add set of
>> helper functions to implement such requirement. Usage example:
>>
>>  static void foo(struct xe_device *xe)
>>  {
>>      WRITE_ONCE(xe->foo, 1);
>>  }
>>
>>  static void foo_test(struct kunit *test)
>>  {
>>      struct xe_device *xe = test->priv;
>>
>>      xe_kunit_helper_delayed_call(test, HZ / 2, foo, xe);
>>
>>      KUNIT_EXPECT_EQ(test, 0, READ_ONCE(xe->foo));
>>      schedule_timeout_uninterruptible(HZ);
>>      KUNIT_EXPECT_EQ(test, 1, READ_ONCE(xe->foo));
>>  }
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 148 ++++++++++++++++++++
>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  38 +++++
>> 2 files changed, 186 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> index bc5156966ce9..8fe1a0918b32 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> @@ -127,3 +127,151 @@ int
>> xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>>     return 0;
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>> +
>> +struct xe_kunit_call {
>> +    struct delayed_work work;
>> +    struct kunit *test;
>> +    struct {
>> +        int (*int_gt)(struct xe_gt *gt);
>> +        int (*int_gt_uint)(struct xe_gt *gt, unsigned int n);
>> +        void (*void_gt)(struct xe_gt *gt);
>> +        void (*void_gt_uint)(struct xe_gt *gt, unsigned int n);
>> +        void (*void_xe)(struct xe_device *xe);
> 
> I think the only reason why you're adding this in xe is because you are
> using xe-specific types. This could rather be done generically by
> always using int delayed_func(void *data). Then you can simply add it to
> kunit and get it reviewed there.

while some generic functionality could be always extracted and moved to
the kunit, for easier use in Xe tests likely we will still need some
wrappers with xe-specific types, so do we really always need to start
with trying enhance generic kunit first and then wait for acceptance
until we can use such extension in our test code?

IMO this could be in parallel, so in kunit review we can point how this
is already being used..

anyway, will try to split that feature into 'generic' and 'xe'

> 
> Also thinking that the example you added in the commit message is likely
> suggesting the wrong type of test, that a) sleep too much and b) tend to
> be noisy

only tests longer than 2s are considered SLOW ;)

and HZ was just picked to have an example small

and you will not see any noise if test PASSES

> 
> Lucas De Marchi
> 
>> +    } func;
>> +    struct {
>> +        struct xe_device *xe;
>> +        struct xe_gt *gt;
>> +        unsigned int n;
>> +    } args;
>> +};
>> +
>> +static void call_work_func(struct work_struct *work)
>> +{
>> +    struct xe_kunit_call *call = container_of(work, typeof(*call),
>> work.work);
>> +
>> +    if (call->func.void_xe) {
>> +        kunit_info(call->test, "calling %ps(xe)\n", call->func.void_xe);
>> +        call->func.void_xe(call->args.xe);
>> +        kunit_info(call->test, "%ps(xe) completed\n",
>> call->func.void_xe);
>> +    } else if (call->func.void_gt) {
>> +        kunit_info(call->test, "%ps(gt)\n", call->func.void_gt);
>> +        call->func.void_gt(call->args.gt);
>> +        kunit_info(call->test, "%ps(gt) completed\n",
>> call->func.void_gt);
>> +    } else if (call->func.int_gt_uint) {
>> +        int ret;
>> +
>> +        kunit_info(call->test, "calling %ps(gt,%u)\n",
>> +               call->func.int_gt_uint, call->args.n);
>> +        ret = call->func.int_gt_uint(call->args.gt, call->args.n);
>> +        if (ret < 0) {
>> +            kunit_info(call->test, "%ps(gt,%u) reported error %pe\n",
>> +                   call->func.int_gt_uint, call->args.n, ERR_PTR(ret));
>> +        } else {
>> +            kunit_info(call->test, "%ps(gt,%u) returned %d\n",
>> +                   call->func.int_gt_uint, call->args.n, ret);
>> +        }
>> +    }
>> +}
>> +
>> +static struct xe_kunit_call *prepare_call(struct kunit *test)
>> +{
>> +    struct xe_kunit_call *call;
>> +
>> +    call = kunit_kzalloc(test, sizeof(*call), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, call);
>> +
>> +    INIT_DELAYED_WORK(&call->work, call_work_func);
>> +    call->test = test;
>> +
>> +    return call;
>> +}
>> +
>> +KUNIT_DEFINE_ACTION_WRAPPER(cancel_call, cancel_delayed_work_sync,
>> struct delayed_work *);
>> +
>> +static void queue_call(struct kunit *test, struct xe_kunit_call
>> *call, unsigned long delay)
>> +{
>> +    queue_delayed_work(system_wq, &call->work, delay);
>> +    KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
>> cancel_call, &call->work));
>> +}
>> +
>> +/**
>> + * xe_kunit_helper_delayed_call_void_xe_device - Queue a function
>> call during KUnit test
>> + * @test: the &kunit test case
>> + * @delay: number of jiffies to wait before queueing
>> + * @func: the &xe_device function to call
>> + * @xe: the &xe_device argument
>> + *
>> + * This function uses KUNIT_ASSERT to detect any failures.
>> + */
>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>> +                         unsigned long delay,
>> +                         void (*func)(struct xe_device *xe),
>> +                         struct xe_device *xe)
>> +{
>> +    struct xe_kunit_call *call = prepare_call(test);
>> +
>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>> +    KUNIT_ASSERT_NOT_NULL(test, xe);
>> +
>> +    call->func.void_xe = func;
>> +    call->args.xe = xe;
>> +
>> +    return queue_call(test, call, delay);
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_device);
>> +
>> +/**
>> + * xe_kunit_helper_delayed_call_void_xe_gt - Queue a function call
>> during KUnit test
>> + * @test: the &kunit test case
>> + * @delay: number of jiffies to wait before queueing
>> + * @func: the &xe_gt function to call
>> + * @gt: the &xe_gt function argument
>> + *
>> + * This function uses KUNIT_ASSERT to detect any failures.
>> + */
>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>> +                         unsigned long delay,
>> +                         void (*func)(struct xe_gt *gt),
>> +                         struct xe_gt *gt)
>> +{
>> +    struct xe_kunit_call *call = prepare_call(test);
>> +
>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>> +
>> +    call->func.void_gt = func;
>> +    call->args.gt = gt;
>> +
>> +    return queue_call(test, call, delay);
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_gt);
>> +
>> +/**
>> + * xe_kunit_helper_delayed_call_int_xe_gt_uint - Queue a function
>> call during KUnit test
>> + * @test: the &kunit test case
>> + * @delay: number of jiffies to wait before queueing
>> + * @func: the &xe_gt function to call
>> + * @gt: the &xe_gt function argument
>> + * @n: the function argument
>> + *
>> + * This function uses KUNIT_ASSERT to detect any failures.
>> + */
>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>> +                         unsigned long delay,
>> +                         int (*func)(struct xe_gt *gt,
>> +                                 unsigned int vfid),
>> +                         struct xe_gt *gt,
>> +                         unsigned int n)
>> +{
>> +    struct xe_kunit_call *call = prepare_call(test);
>> +
>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>> +
>> +    call->func.int_gt_uint = func;
>> +    call->args.gt = gt;
>> +    call->args.n = n;
>> +
>> +    return queue_call(test, call, delay);
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_int_xe_gt_uint);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> index 83665f7b1254..ec5287947ee4 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> @@ -9,6 +9,7 @@
>> struct device;
>> struct kunit;
>> struct xe_device;
>> +struct xe_gt;
>>
>> struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>                           struct device *dev);
>> @@ -16,4 +17,41 @@ int xe_kunit_helper_xe_device_test_init(struct
>> kunit *test);
>>
>> int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>>
>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>> +                         unsigned long delay,
>> +                         void (*func)(struct xe_device *xe),
>> +                         struct xe_device *xe);
>> +
>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>> +                         unsigned long delay,
>> +                         void (*func)(struct xe_gt *gt),
>> +                         struct xe_gt *gt);
>> +
>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>> +                         unsigned long delay,
>> +                         int (*func)(struct xe_gt *gt,
>> +                                 unsigned int vfid),
>> +                         struct xe_gt *gt,
>> +                         unsigned int n);
>> +
>> +/**
>> + * xe_kunit_helper_delayed_call - Queue a function call during KUnit
>> test
>> + * @test: the &kunit test case
>> + * @delay: number of jiffies to wait before queueing
>> + * @func: the &xe_device or &xe_gt function to call
>> + * @args: the &xe_device or &xe_gt and other function arguments
>> + *
>> + * This is a helper macro that compiles into dedicated function call
>> based on
>> + * the provided argument types.
>> + */
>> +#define xe_kunit_helper_delayed_call(test, delay, func, args...)    \
>> +    _Generic(func,                            \
>> +         void (*)(struct xe_device *) :                \
>> +            xe_kunit_helper_delayed_call_void_xe_device,    \
>> +         void (*)(struct xe_gt *) :                \
>> +            xe_kunit_helper_delayed_call_void_xe_gt,    \
>> +         int (*)(struct xe_gt *, unsigned int) :        \
>> +            xe_kunit_helper_delayed_call_int_xe_gt_uint    \
>> +    )(test, delay, func, args)
>> +
>> #endif
>> -- 
>> 2.43.0
>>
