Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EA7C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 14:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0610E125;
	Fri, 17 Mar 2023 14:29:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DA610E125
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679063381; x=1710599381;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DPTQ7S4C2TFAMWLZ4/x5GTKADn0qt7jGwJ8JTge48Rg=;
 b=cX+LfGrQf8VhvmOBBoGxjGKXyVfuBFZoylFf9Q7fXD5R52mvk8Ujc+iO
 dmtZrMxuXDRqVVHRIZxVWl5TbsqbcgyudlwwU1J0Y90wC/OYfD/365HMC
 6aP6WU8S2a0FrsFQUze7HWyB30ULAO34AhB2PUJUVelbGg2blzA3o1psI
 z/zyYsCfL8L3eHDsrvisuhduXEheBhqCrkZCf3mpX77TCGLlvvuJW885M
 Xc6NFw+JMLU3l7zzclG31aA4BjIdkE1CDOzPW4IeQ4Ivaqk24W3ZMwpmu
 46SJrHlE9inFrFcOr9PZbxHPAIwg5sEZwDhTWIfHV0PRtUWBQMcAWa/lu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339809372"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="339809372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 07:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854456061"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="854456061"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 07:29:39 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.25.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DFD91580AFF;
 Fri, 17 Mar 2023 07:29:38 -0700 (PDT)
Date: Fri, 17 Mar 2023 15:29:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230317152936.2ca5ae1a@maurocar-mobl2>
In-Reply-To: <b411541a-b357-14f7-e193-f8cbb2e31b4a@linux.intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
 <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
 <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
 <b411541a-b357-14f7-e193-f8cbb2e31b4a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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

On Fri, 17 Mar 2023 08:20:46 +0100
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Hi,
>=20
> On 3/16/23 07:46, Lucas De Marchi wrote:
> > On Mon, Mar 13, 2023 at 07:18:34PM +0100, Michal Wajdeczko wrote: =20
> >>
> >>
> >> On 13.03.2023 17:23, Lucas De Marchi wrote: =20
> >>> On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote: =20
> >>>> Our initial attempt to run Kunit based tests on live devices is hard
> >>>> to use and will not work well with multiple devices attached.
> >>>>
> >>>> Instead of relying on separate test module and duplicating support
> >>>> for multiple live devices in every test entry point, create new set
> >>>> of helpers and use test->priv to pass reference of the device under
> >>>> test (DUT) directly to every test function.
> >>>>
> >>>> The same use pattern is supported for both mock and live selftests.
> >>>>
> >>>> By using bus_notifier we can start testing each new bound device
> >>>> separatelly, subject to filtering using dut_filter modparam.
> >>>>
> >>>> All test cases can be included directly from .c file, allowing test
> >>>> code to access and use any private functions.
> >>>>
> >>>> As Kunit will attempt to run all suites on module load, including
> >>>> our new live test suites, we may want to allow to execute them on
> >>>> any available device. This is controlled by anonymous_dut modparam.
> >>>>
> >>>> Support for either mock or live selftests, only one at time, is
> >>>> controlled by new Kconfig options.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> ---
> >>>> drivers/gpu/drm/xe/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++++
> >>>> drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 11 ++
> >>>> drivers/gpu/drm/xe/selftests/xe_selftests.h=C2=A0=C2=A0 |=C2=A0 35 +=
+++++
> >>>> .../gpu/drm/xe/selftests/xe_selftests_auto.c=C2=A0 |=C2=A0 46 +++++++
> >>>> .../drm/xe/selftests/xe_selftests_executor.c=C2=A0 | 118 +++++++++++=
+++++++
> >>>> .../drm/xe/selftests/xe_selftests_helpers.c=C2=A0=C2=A0 | 101 ++++++=
+++++++++
> >>>> .../drm/xe/selftests/xe_selftests_internal.h=C2=A0 |=C2=A0 22 ++++
> >>>> .../gpu/drm/xe/selftests/xe_selftests_mock.c=C2=A0 |=C2=A0 32 +++++
> >>>> .../drm/xe/selftests/xe_selftests_params.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++++
> >>>> drivers/gpu/drm/xe/xe_module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> >>>> 10 files changed, 412 insertions(+)
> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
> >>>> create mode 100644=20
> >>>> drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers=
.c
> >>>> create mode 100644=20
> >>>> drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
> >>>> b/drivers/gpu/drm/xe/Kconfig.debug
> >>>> index 93b284cdd0a2..aeba43977dca 100644
> >>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
> >>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> >>>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> >>>>
> >>>> +config DRM_XE_SELFTESTS_MOCK
> >>>> +=C2=A0=C2=A0=C2=A0 bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
> >>>> +=C2=A0=C2=A0=C2=A0 depends on DRM_XE && KUNIT
> >>>> +=C2=A0=C2=A0=C2=A0 default KUNIT_ALL_TESTS
> >>>> +=C2=A0=C2=A0=C2=A0 help
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option to al=
low the driver to perform mock
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 selftests based on the K=
unit framework.
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Recommended for driver d=
evelopers only.
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> >>>> +
> >>>> +config DRM_XE_SELFTESTS_LIVE
> >>>> +=C2=A0=C2=A0=C2=A0 bool "Live selftests for Xe" if !DRM_XE_SELFTEST=
S_MOCK =20
> >>>
> >>> why?=C2=A0 I think we should aim to run live tests in *addition* to
> >>> mock ones.=C2=A0 The mock tests are more testing our SW infra and can=
 be=20
> >>> used
> >>> in a true "unit test" sense. While the live ones are testing the
> >>> integration with the HW and making sure they work together. =20
> >>
> >> I've added that just to simplify the code logic as I assumed we will be
> >> running mock tests only in "true kunit" fashion as part of the build.
> >>
> >> So then we could avoid mixing mock/live "kunit suites" in single driver
> >> module, especially that as of today there is no nice support to filter
> >> out undesired suites from the execution. Thus adding compile time flag
> >> to only have one category of selftests at time was looking promising. =
=20
> >
> > I'm using this in the patches I'm sending to unit test rtp and wa parts:
> >
> > =C2=A0=C2=A0=C2=A0=C2=A0./tools/testing/kunit/kunit.py run --raw_output=
=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 --kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
> > =20
> >>
> >> So I was using .kunitconfig with
> >> =C2=A0=C2=A0=C2=A0=C2=A0CONFIG_DRM_XE_SELFTESTS_MOCK=3Dy
> >> and normal .config with
> >> =C2=A0=C2=A0=C2=A0=C2=A0CONFIG_DRM_XE_SELFTESTS_LIVE=3Dy
> >> =20
> >>>
> >>> I have changes pending to test some WA and RTP infra we added,
> >>> regardless of the HW. But I don't want to have to choose either one or
> >>> the other. =20
> >>
> >> And I guess you still can do that, just it wont be automatically
> >> compiled out, nor you be able to benefit from the helpers, but they wi=
ll
> >> be executed
> >> =20
> >>>
> >>> Also Cc Thomas as original author of the kunit integration.
> >>>
> >>> We also have some overloaded terms that need better explanation:
> >>> mock, selftest, live. =20
> >>
> >> I reused terms from i915, assumed everyone is familiar with that.
> >>
> >> "mock selftest" - a kunit test suite to be run on abstract xe device
> >> "live selftest" - a kunit test suite to be executed on real xe device =
=20
> >
> > Things I like on the current kunit integration we have in xe:
> >
> > =C2=A0=C2=A0=C2=A0=C2=A01) The ability to move unit test code out to a =
separate module
> > =C2=A0=C2=A0=C2=A0=C2=A02) Not having a big infra that is xe-only
> > =C2=A0=C2=A0=C2=A0=C2=A03) Share terminology with the rest of drm subsy=
stem
> >
> > This patch series is basically killing (1) and (3). And for (2) it seems
> > to be heading another direction.=C2=A0 Looking at the current available
> > drivers,=C2=A0 I think we should be more like the drm tests and the vc4=
 tests
> > rather than the i915 ones.=C2=A0 If we need more helpers we may probably
> > extend the ones in DRM_KUNIT_TEST_HELPERS
> >
> > I'd love to hear others' opinions though. =20
>=20
> I basically agree with Lucas here. Some points:
>=20
>   * For mock selftests IMO we don't need anything on top of what we
>     already have, except perhaps consolidate initialization of a mock
>     device as a helper each test can optionally use.=C2=A0 I think, thoug=
h,
>     that Mauro's suggestion of coalescing multiple mock tests together
>     in a single separate kernel module with multiple test suites to
>     avoid too many separate kernel module might be worth considering if
>     needed.

IMO there's one important feature here that it is missing upstream:
support for filtering out KUnit tests.

Yet, the patch is adding it inside Xe. The right solution is, IMO, to
add support as much as possible inside the KUnit core and having
additional variables inside the module(s) implementing KUnit to setup
such filters.

This is more important for live selftests, but having this also for
mock won't hurt

>   * For live selftests it seems like where the big disconnect is. I
>     still believe that we should have separate modules, and depending on
>     how the IGT runner end up working have enough information in that
>     module for IGT to execute the tests with the --run-subtest and
>     --dynamic-subtest options.

KUnit patch series is currently in rev. 5. It sounds almost ready for
being merged. In any case, to properly support dynamic subtests, we
need filtering capabilities. Once the filters get added, having multiple
test suites on the same module or on different modules won't make any
difference for IGT.

Regards,
Mauro
