Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E7C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 10:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C188C10E0EC;
	Tue, 20 Aug 2024 10:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1zXImex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14210E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724149922; x=1755685922;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1q454dZL9LKfPPFwWGK5uigA996Evz6/GERQnn9eD+Q=;
 b=B1zXImexf2kuOXP7cxxKNd/ziYO6wbnawHTFCGXd3AsS3O5M9w0LYKlG
 cYpRESb0H/6MWcVRtDu8JYcnsz09Z1wZn5CbJObuOekNLtfyiczJ2ze2h
 KrzA87XU3SFzzBBnRkeH/UKX/ITfVNlsJKErq+3jq5jFRvU8xk2GqV0wk
 oDFj5ttaDoe/Dd0Pt+C9ealKEOXUqf63PoRMBTluqUp7mNOkZUWZcYcX2
 NF3x2qLWuUo27u3JGbifZ8TBmMQ+XQ1QdMjHMz/zZ9GqJcn4HVYlHZiTV
 c8F2TybnY6or5i1b39LPtfaijlaR4sPUjO9WDE14za3tFXX1xGewvEROk A==;
X-CSE-ConnectionGUID: ScWPAMysRz2QtNGMHD+zbQ==
X-CSE-MsgGUID: 81mI+OPnRUmvhIuNeSOJLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26306522"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26306522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:32:01 -0700
X-CSE-ConnectionGUID: 8OmhdRosTyaNsDgUdlBIYg==
X-CSE-MsgGUID: N8JjZdJ/RXyCLUxU7+1VkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="61235974"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2024 03:32:00 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D60F028778;
 Tue, 20 Aug 2024 11:31:58 +0100 (IST)
Message-ID: <c267034e-f016-4ac6-adff-e1b634be4c95@intel.com>
Date: Tue, 20 Aug 2024 12:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/xe/tests: Add helpers to call stubs out of
 KUnit context
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-8-michal.wajdeczko@intel.com>
 <ejgtxc727guqh6dl4tfjdqsjlhlbs5nfzvkmsxbtnpaxnu2uvx@rroc2e4sjm7r>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ejgtxc727guqh6dl4tfjdqsjlhlbs5nfzvkmsxbtnpaxnu2uvx@rroc2e4sjm7r>
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



On 19.08.2024 23:52, Lucas De Marchi wrote:
> On Fri, Aug 09, 2024 at 06:51:54PM GMT, Michal Wajdeczko wrote:
>> The KUNIT_STATIC_STUB_REDIRECT() allows to redirect function call but
>> will
>> work only if the caller is in a KUnit context. To allow implementation of
>> the more complex test cases, add helpers that allow calling stubs also
>> out
>> of a KUnit context.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_test.h | 74 ++++++++++++++++++++++++++++++
>> 1 file changed, 74 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_test.h
>> b/drivers/gpu/drm/xe/tests/xe_test.h
>> index b8fa409ce2b1..ffa8fa6c96f0 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_test.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_test.h
>> @@ -54,11 +54,85 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
>>     return priv->id == id ? priv : NULL;
>> }
>>
>> +/**
>> + * XE_TEST_REDIRECT() - Call a function stub if one exists.
>> + * @stub: The pointer to the function stub
>> + * @args: All of the arguments passed to this stub
>> + *
>> + * This is a function prologue which is used to allow calls to the
>> current
>> + * function to be redirected if a KUnit is running. If the stub is
>> NULL or
>> + * the KUnit is not running the function will continue execution as
>> normal.
>> + *
>> + * Unlikely the KUNIT_STATIC_STUB_REDIRECT(), this redirection will work
>> + * even if the caller is not in a KUnit context (like a worker thread).
>> + *
>> + * Example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *    int (*stub)(int n);
>> + *
>> + *    int real_func(int n)
>> + *    {
>> + *        XE_TEST_REDIRECT(stub, n);
>> + *        return n + 1;
>> + *    }
>> + *
>> + *    int replacement_func(int n)
>> + *    {
>> + *        return n + 100;
>> + *    }
>> + *
>> + *    void example_test(struct kunit *test)
>> + *    {
>> + *        stub = replacement_func;
>> + *        KUNIT_EXPECT_EQ(test, real_func(1), 101);
>> + *        KUNIT_EXPECT_EQ(test, real_func(1), 101);
>> + *    }
>> + */
>> +#define XE_TEST_REDIRECT(stub, args...)                            \
> 
> this seems another one that should rather be in the kunit layer, not in
> xe

will try to prepare generic kunit patch, but I was just hoping that we
can have/use something sooner without waiting until it will accepted there

> 
>> +do {                                            \
>> +    typeof(stub) replacement = (stub);                        \
>> +    if (XE_TEST_RUNNING()) {                            \
>> +        if (unlikely(replacement)) {                        \
>> +            pr_info(KUNIT_SUBTEST_INDENT "# %s: calling stub
>> %ps\n",    \
>> +                __func__, replacement);                    \
> 
> KUNIT_STATIC_STUB_REDIRECT() silently calls the stub without pr_info().
> Why does this version need to be extra-verbose?

KUNIT_STATIC_STUB_REDIRECT() only works in kunit context so likely your
test is almost directly exercise that redirection, while here
replacement function will used for any code that executes during the
test, so this will help identify any unexpected redirections

and this extra-verbose 'noise' will not be seen unless your test fails
(unless you will use --raw_output)

> 
> Lucas De Marchi
> 
> 
>> +            return replacement(args);                    \
>> +        }                                    \
>> +    }                                        \
>> +} while (0)
>> +
>> +static inline void __nullify_pointer(void *data)
>> +{
>> +    void **ptr = data;
>> +
>> +    *ptr = NULL;
>> +}
>> +
>> +/**
>> + * XE_TEST_ACTIVATE_STUB() - Setup a function stub.
>> + * @test: Test case that wants to setup a function stub
>> + * @stub: The function stub pointer
>> + * @replacement: The replacement function
>> + *
>> + * This helper setups a function stub with the replacement function.
>> + * It will also automatically restore stub to NULL at the test end.
>> + */
>> +#define XE_TEST_ACTIVATE_STUB(test, stub, replacement)   
>> ({                    \
>> +    typeof(test) __test = (test);                                \
>> +    typeof(stub) *__ptr = &(stub);                                \
>> +    typecheck_pointer(*__ptr);                                \
>> +    *__ptr = (replacement);                                    \
>> +    kunit_info(__test, "activated stub %s with %ps\n",
>> __stringify(stub), *__ptr);        \
>> +    kunit_add_action_or_reset(__test, __nullify_pointer,
>> __ptr);                \
>> +})
>> +
>> #else /* if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST) */
>>
>> #define XE_TEST_DECLARE(x)
>> #define XE_TEST_ONLY(x) 0
>> #define XE_TEST_RUNNING() false
>> +#define XE_TEST_REDIRECT(...) do { } while (0)
>>
>> #define xe_cur_kunit_priv(_id) NULL
>>
>> -- 
>> 2.43.0
>>
