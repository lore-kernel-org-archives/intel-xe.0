Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B2C7619A
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 10:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C39F10E2A0;
	Sun,  2 Apr 2023 10:51:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E800010E2DE
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680432682; x=1711968682;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d9DAU4wI1Zl8lzEA3bUamVa8UMNB9teo6eaJWTxbwno=;
 b=EqYF5f1BX4hUD38zv48T/ekzsO/NZPwwGxwAYNSTnoR+WRJgCDzV7lcz
 0sKLosrzAqcrrQ2x8KFSqYwH8JEa5fJYwQG31NlRHwVqmYGCu6XdaHdMz
 JjDxspBlefuPJKqPTcYgnf9zkY/RxAmTc/akj9bg6TGcscVNNTW9qiS6o
 W6Qwxv6LJeujVr5ZvRnL1isRq88IzW0Hr/X3cXNkDRZo89Ey3WDpTyGCU
 naV6RKFaL4WdM11z1VAZTarwlUMem4XjiozIMdgNdsbZCUCqahRmjP2SN
 j8VZ/LxJN/maDIPE/8fnyz9k1bPZDCOVb8oYQRQ+mN1kaAsGesaiREvUc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404476999"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="404476999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 03:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662894249"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="662894249"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2023 03:51:19 -0700
Received: from [10.249.151.88] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.88])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5865232C8B;
 Sun,  2 Apr 2023 11:51:18 +0100 (IST)
Message-ID: <0beeefc4-478a-cea7-e244-b6a5f53f10c3@intel.com>
Date: Sun, 2 Apr 2023 12:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal@hardline.pl>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
 <20230401085932.g6d3zn5th64hxdya@ldmartin-desk2.lan>
 <eboeoenvzefqll4pb6c7ligtoypwttqwolmztrl7dydcjlxh4v@g5iuj2exe72x>
 <20230402012447.7p6m37l74ao2u2hf@ldmartin-desk2.lan>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230402012447.7p6m37l74ao2u2hf@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 02.04.2023 03:24, Lucas De Marchi wrote:
> On Sat, Apr 01, 2023 at 08:54:18PM +0200, Michał Winiarski wrote:
>> On Sat, Apr 01, 2023 at 01:59:32AM -0700, Lucas De Marchi wrote:
>>> On Fri, Mar 31, 2023 at 07:43:34AM -0600, Lucas De Marchi wrote:
>>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>> > > > Add some basic unit tests for rtp. This is intended to prove the
>>> > > > functionality of the rtp itself, like coalescing entries,
>>> rejecting
>>> > > > non-disjoint values, etc.
>>> > > >
>>> > > > Contrary to the other tests in xe, this is a unit test to test the
>>> > > > sw-side only, so it can be executed on any machine - it doesn't
>>> interact
>>> > > > with the real hardware. For that a mock was provided with the
>>> minimum
>>> > > > initialization needed. Running it produces the following output:
>>> > > >
>>> > > >     $ ./tools/testing/kunit/kunit.py run --raw_output  \
>>> > > >         --kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>>> > > >     ...
>>> > > >     [13:46:14] Starting KUnit Kernel (1/1)...
>>> > > >     KTAP version 1
>>> > > >     1..1
>>> > > >         KTAP version 1
>>> > > >         # Subtest: xe_rtp
>>> > > >         1..3
>>> > > >         ok 1 xe_rtp_process_basic
>>> > > >     [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg
>>> 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>> > > >     [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg
>>> 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>> > > >         ok 2 xe_rtp_process_dup
>>> > > >     [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg
>>> 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>> > > >     [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg
>>> 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>> > > >         ok 3 xe_rtp_process_incompat_types
>>> > > >     # xe_rtp: pass:3 fail:0 skip:0 total:3
>>> > > >     # Totals: pass:3 fail:0 skip:0 total:3
>>> > > >     ok 1 xe_rtp
>>> > > >     [13:46:14] Elapsed time: 6.800s total, 0.002s configuring,
>>> 6.682s building, 0.073s running
>>> > > >
>>> > > > Note that the ERRORs in the kernel log are expected since it's
>>> testing
>>> > > > non-disjoint or incompatible entries.
>>> > > >
>>> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> > > > Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>>> > > > ---
>>> > > > drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>>> > > > drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>>> > > > drivers/gpu/drm/xe/tests/xe_rtp.c      | 201
>>> +++++++++++++++++++++++++
>>> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
>>> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>>> > > > drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>>> > > > 6 files changed, 290 insertions(+), 2 deletions(-)
>>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>> > > >
>>> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>>> b/drivers/gpu/drm/xe/Kconfig.debug
>>> > > > index 93b284cdd0a2..11bb13c73e7b 100644
>>> > > > --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> > > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> > > > @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>>> > > >     depends on DRM_XE && KUNIT && DEBUG_FS
>>> > > >     default KUNIT_ALL_TESTS
>>> > > >     select DRM_EXPORT_FOR_TESTS if m
>>> > > > +    select DRM_KUNIT_TEST_HELPERS
>>> > > >     help
>>> > > >       Choose this option to allow the driver to perform
>>> selftests under
>>> > > >       the kunit framework
>>> > >
>>> > > But now we're mixing proper isolated tests with HW-interacting ones.
>>> > > Can we move the HW-interacting ones to a separate Kconfig which
>>> is not
>>> > > included in .kunitconfig and doesn't set its default value using
>>> > > KUNIT_ALL_TESTS?
>>> >
>>> > I'm not sure moving them to a separate kconfig is good, because that
>>> > would mean people building without one or the other. The only case it
>>> > makes sense to build without the hw-interacting ones would be for when
>>> > we are building for UML.
>>> >
>>> > I want to make sure the kconfig from CI includes both and people can
>>> > run under !UML both of them.
>>> >
>>> > On the positive side for your approach, we'd be moving the
>>> > *HW-interacting* ones to a separate config. This means we can
>>> create the
>>> > split between the true unit tests and the ones just using the kunit
>>> > infrastructure. I will give this a try and see how it looks in the
>>> end.
>>> >
>>> > I've been advocating for a split on a name-basis, calling these unit
>>> > tests as sw_* and the others as hw_*. Then running just the sw ones is
>>> > simply a matter of passing it as argument to kunit.py
>>>
>>> I will leave this for later as I don't want to stall the tests on
>>> something that can be converted later and... this is not making the
>>> situation any worse: actually running this in CI will provide an output
>>> a little more useful than it actually is giving: a skip on all tests.
>>>
>>> I'm almost convinced we can make it work with separate configs as you
>>> suggested, but we will need to sync with CI to make sure it fits
>>> everyody.
>>
>> Sure, just something to keep in mind for the future.
>>
>> And it's not really about architecture (UML or not).
>> .kunitconfig and KUNIT_ALL_TESTS are only relevant for kunit.py users,
>> and so we want to have config for non-HW-interacting tests in
>> .kunitconfig with a default value based on KUNIT_ALL_TESTS. Adding any
>> architecture dependencies here would break kunit.py --arch=X usecase.
>>
>> For HW-interacting tests, we want a completely separate config, that's
>> not part of .kunitconfig and does not have anything to do with
>> KUNIT_ALL_TESTS.
>>
>> This way - kunit.py users won't even notice the skips (unless they build
>> custom config), and for HW, I expect CI to be using a custom kernel
>> config anyway (KUnit one is very unlikely to boot on real hardware), so
> 
> that's why this will need to be synchronized with a change in CI config
> as with the current config we would stop having the hw tests.
> 
>> .kunitconfig and KUNIT_ALL_TESTS don't really matter for HW-interacting
>> tests.
> 
> I agree about .kunitconfig, but if we create a
> CONFIG_DRM_XE_HW_KUNIT_TEST and default it to N instead of
> KUNIT_ALL_TESTS as you propose, CI would stop having those tests in its
> config. Here it's not about .kunitconfig, but the .config CI is using:
> https://gitlab.freedesktop.org/drm/xe/ci/-/blob/main/kernel/kconfig

likely we can workaround that by using

	default Y if DRM_XE_DEBUG

or just explicitly update the CI config to the desired value

> 
> Options:
> 1) CONFIG_DRM_XE_HW_KUNIT_TEST 2) CONFIG_DRM_XE_LIVE_TEST
> 3) CONFIG_DRM_XE_SELFTEST
> 
> The above would be my order of preference, but I don't have a strong
> opinion.

before choosing the name for new config for HW tests from the above
list, we should discuss that in connection with existing config name, as
we plan to use KUNIT in both scenarios, and maybe worth to change both
to clearly indicate our intentions/use case.

here is sample of possible pairs:

a) CONFIG_DRM_XE_KUNIT_TEST
   CONFIG_DRM_XE_HW_KUNIT_TEST

b) CONFIG_DRM_XE_KUNIT_TEST
   CONFIG_DRM_XE_LIVE_TEST

c) CONFIG_DRM_XE_KUNIT_TEST
   CONFIG_DRM_XE_SELFTEST

d) CONFIG_DRM_XE_KUNIT_SELFTESTS
   CONFIG_DRM_XE_KUNIT_LIVETESTS

e) CONFIG_DRM_XE_SELFTESTS
   CONFIG_DRM_XE_LIVETESTS

f) CONFIG_DRM_XE_SW_SELFTESTS
   CONFIG_DRM_XE_HW_SELFTESTS

g) CONFIG_DRM_XE_SW_UNIT_TESTS
   CONFIG_DRM_XE_HW_LIVE_TESTS

...

my vote would go for e) as a good balance

thanks,
Michal

> 
> thanks
> Lucas De Marchi
