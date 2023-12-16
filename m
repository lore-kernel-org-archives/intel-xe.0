Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25106C46CCD
	for <intel-xe@archiver.kernel.org>; Sat, 16 Dec 2023 12:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D1910E089;
	Sat, 16 Dec 2023 12:11:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BD210E089
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Dec 2023 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702728664; x=1734264664;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q8Tafpbh9BzyV+TwPR8U00dBsyIpZLMBdeb+vdBOXBE=;
 b=CsraJmi5rORxsJVIGlnkgdS4SdpDG1QMRo25J8jfsjoC9a4zslnHXJ3c
 j9adg0IG4IJ+dmP4ggvqonFUDiFbg0Zte7IU9h3SwTzzdCldVikYOQ6Ug
 v0ATUEvnc4HlzeWwnszLD4nzOlDA9AtRMO1U9YZjXu+qRu5AUCULc66BQ
 /lu6H6Whww7CTcN2WW3UAlWK6DQt42s+mBsXmQUMr1PeX4jSp90mLALHG
 aFHUWzvJEfCwfFe/Qchx80xixPVBKnRDSiSnV6hTXGJXp36z5w5lnx334
 kl8qz/rBeMRGigsMZlx1AggsHdtyF8WgnFYOFG7nKCDlcnaDUkc7KaZz5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2196147"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2196147"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 04:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="845410521"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; d="scan'208";a="845410521"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 04:11:02 -0800
Received: from [10.249.145.164] (unknown [10.249.145.164])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9ECED38194;
 Sat, 16 Dec 2023 12:11:01 +0000 (GMT)
Message-ID: <d1356030-2ee4-49a7-9886-77b689666b91@intel.com>
Date: Sat, 16 Dec 2023 13:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] drm/xe/kunit: Restore test->priv when done with
 fake xe device
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-7-michal.wajdeczko@intel.com>
 <3sc7ulh6z3t555u33wwxj77gwbmh4jvs3qwo3cn7dbs4vann4i@mjxlz45midfu>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3sc7ulh6z3t555u33wwxj77gwbmh4jvs3qwo3cn7dbs4vann4i@mjxlz45midfu>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 15.12.2023 23:11, Lucas De Marchi wrote:
> On Fri, Dec 15, 2023 at 05:24:58PM +0100, Michal Wajdeczko wrote:
>> Current KUnit implementation does not reset test->priv in case of
>> parametrized tests and that may lead to wrongly treat our output
>> pointer to fake xe_device from first call as input pointer with
>> xe_pci_fake_data on subsequent calls.  Restore test->priv to
>> original value to avoid invalid access.
> 
> but wouldn't each parameterized test pass a different a data?

test->priv prepared by suit.init() should be the same
only test->param_value will change on each param iteration

> 
> not sure I'm following why this is a xe issue. Are you fixing it in xe
> while should be fixed in kunit?

who said I'm not fixing that in kunit ;)

[1]
https://lore.kernel.org/linux-kselftest/20231215151327.1835-1-michal.wajdeczko@intel.com/

Michal

> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> index 6d72dbf06139..fefe79b3b75a 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> @@ -41,6 +41,13 @@ struct xe_device
>> *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
>>
>> +static void kunit_action_restore_priv(void *priv)
>> +{
>> +    struct kunit *test = kunit_get_current_test();
>> +
>> +    test->priv = priv;
>> +}
>> +
>> /**
>>  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a
>> KUnit test.
>>  * @test: the &kunit where this fake &xe_device will be used
>> @@ -74,6 +81,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit
>> *test)
>>     err = xe_pci_fake_device_init(xe);
>>     KUNIT_ASSERT_EQ(test, err, 0);
>>
>> +    err = kunit_add_action_or_reset(test, kunit_action_restore_priv,
>> test->priv);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>>     test->priv = xe;
>>     return 0;
>> }
>> -- 
>> 2.25.1
>>
