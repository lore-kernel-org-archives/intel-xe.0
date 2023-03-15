Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EEAC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 00:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDDE10E120;
	Wed, 15 Mar 2023 00:18:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0FE10E120
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 00:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678839499; x=1710375499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hThggDtv9BVq04AOQkio5TZRHjlv8QzEoPS3F1OAvnw=;
 b=cbgYa/kmb4BIm8QayIO1Xq0TJaP38O/Z7AG1CzcUSVlnJIJX0T2DmU/C
 h/g3yzGLY9r1YAy93EVtrs7gWK8J5AoG3/Gt+GwoEre8BIbX+RmvFs1WI
 dltMD+kcSXXCm7m1lzP8mgdOP3vkLDkgUIgbUbEdWhbow9l1gyt/+d5mR
 wlHd6WfcP2f/Qgf/COZrPI/tMd1Is7JoXgJ9c6a7Re1gci0p8NdXjsIK3
 A4cwdjLSsL5o7b8L8vbf+ZNP3RJkWymbtgXKZxGGseQCBJ3AWjdQWK+uH
 jfnZ44tAsvtldpy55v4DUxCqwqzrLw00nIlEICwRWKKNuKYd95cJfIgBH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365251177"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="365251177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 17:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629272910"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="629272910"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 17:18:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 17:18:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 17:18:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 17:18:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 17:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHmtwLm3tXON60luIHcv9rke4LtptAqHboJD6MygmhVC1lMrs48PVKfURgFD42SLJsh9G2DmEJiNEx6jIBcVar6w3Tb0HlL2QJUe+vZujCR/ddOaK9yrVNR9IypRBxcWvCr77PK8ivWu3z7Qx7484es6R5CmfoDnF9fFRq1y/Xp0TV4uxrHAV+jt2IqKvafAU+L5PZ6eoWBW5XM/wDStztHDnPqxZsReQqDKseDGRPat+vpzTtUglP9yA4FvyimYAV5P2g3Lf1EZonQnF8oQTwCiIvlS4moNvq4YG1MSIcgdhxQYeCVFj3PImVuDTK3H+hY2WFNXn+lpCfKIn58I7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT3oQc5tO03O8J7NIMvqNzlXzATA4ZXmyD2zTw79qIM=;
 b=jqInWDY4UYcop0L3KtBuLugdXHBAH+vchgy15AThMB4vIApBkSynYLrIfX1TJCwMhhPU55Q0UbjAwzERZox71INaomTsonWjgqQc1rVhNScow42WbfllfjzXbUO4h5zNZyyCmwyWQivtGN+OVtRtFY2Iypz2Idi+23bIXJgaWY5ldzneFq2pzq58y8+Bq1qtSds9yJoVAmhms09Jh7573DHEi/UfjtUkrVqw+ajgh8kDpc55A4kKOtW4fK951h/uBW9NqWS0BznNE4sXARFLAwDyOKiFOY2CvPszzK6d9qUwRHfMQDBQbpBGfH5Iglq5ODE7jiSVCtX9L7fXPzRuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5526.namprd11.prod.outlook.com (2603:10b6:208:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 00:18:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 15 Mar 2023
 00:18:15 +0000
Date: Tue, 14 Mar 2023 17:18:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230315001813.7n6y35bhn3qhfpsf@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: afb1e91a-ddaa-4af1-0fd6-08db24eac567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpWbykjp977beNQafGzqi8H2n00UhEbDtwChsrNj2fE06PP9lH2cTDi1nOMxuzzUgWw5HSjAw9qNtjwGS7uA3V9Bsj458xuHZYdf95VVAJceDC8oPvKfok1/4d25iBo6/HeB7YUDrFjnWc/14uvVnZscggNmbsaA13vlntnkeku1+6h5/sGEILIRWPMayVouwSkEeyGgIb8eoegiFk0PG0TlM6hvAA40uZ6nJY8S1Bss3LYg1a+YR64yEpCKatMu/tQEJt6sceGVR/XOaoO9VwzT6uGg3z53YIyNz9axwz9fHhlVot5Yz9F7k4SZK4CyPHXGRRfDFZPpQkaNyiDkTdCTcF7VpdCh9KFI+faWc5vq0IxQqiSoDbLvD1RmYrfdHfbMNnivIIIc31kIcJIP/VdUV8ynQps6Y1eUtWBI63ubhzqLbpflOYQKPyv3baGohsPE2jUvMkiRefzY84aOfttEvE3JWYbKrPoRNI9Ds6ky6ObOgfx99lk1rAot6xHzN1bd5aXvvLI9pMTOIy9+TtJo4ujdb078IEBOQ+K5/hNjg/lSZW96CtmBh8zIvXhmaFzpSIYAjP8jLJFXnO9VUBu28t9QmScZuMrNADIKbSUmd0JXHAEIa0YBXkgB/6feihKgpJDwi/vpEmNqBExLSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(66946007)(478600001)(66556008)(6636002)(66476007)(4326008)(316002)(41300700001)(8936002)(2906002)(5660300002)(6862004)(6486002)(86362001)(8676002)(82960400001)(26005)(186003)(6512007)(1076003)(6506007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6cTqrUxdmPRS0sjrB0zIq+EUKL6B4bgM9IejynsfWoTVOKizvQqPz3Vv0jjX?=
 =?us-ascii?Q?4NbsrCNEDjGyfeGZrcKT6lr5gVRF1RWYztixbE7MfDLoO2N/7YdOblcJ7yOL?=
 =?us-ascii?Q?+QGexWbOl0rgFpJlWjMv7Zr/CQxSIffzeH2v3tzCi30U52TF29qxMsIT9IiE?=
 =?us-ascii?Q?7zqPh7jXp+RWk9w6/0VvTQg1pCWQVbSriWTG0QvuDQ/SsRdm0Dgnmk72dUAh?=
 =?us-ascii?Q?8wYCkfwjB1OLGNTQmmGq4+7uYgMAGjIcWiL7sjvAxhIqRHRgtlhdNGcmlnZN?=
 =?us-ascii?Q?P7x+hU309A68lRhUv56AAOrfcf/wDPQ3oldbJNgAexUr/8TD1RP4uQGcxi3s?=
 =?us-ascii?Q?f3pNkKFRQGS8gDrNAfIKMcY9gkEt9zxaeeAH+M/Kd+AS0+fkqCoVHBNPAcu3?=
 =?us-ascii?Q?cCW2xXCKI+JsKrc2IXajHAxoRRoBz9wgJhQ9Z1Bsi80uM8+bYvSycZq2xtj6?=
 =?us-ascii?Q?Uo5VY5YtdpMfGnWRypC3OYTHz7dNg79GQu2fIiaqIHQpE362VsWSv9634wKE?=
 =?us-ascii?Q?8cp96t0FGG+v1HK9PLWvUqxfJqYDsAQpOzZAVjhtPRYi9kmOePl3kK6Q12VQ?=
 =?us-ascii?Q?rYbc0sAxxYaKP50ZoFTCny8ILXcldCgPJLKZCHuzvHmmmm3RHBgAtskkJlYd?=
 =?us-ascii?Q?8J3hzDhI+JzXJ22uF6ITI4Wah/ogR9GyqfgUUc15VEoACim96t3I+jSTMeA+?=
 =?us-ascii?Q?lLUYUYI4iE0ehCYni8Rg+yeR0vki6QjgT8UavkX2Vu4d2k4bFHww3Aqv39pU?=
 =?us-ascii?Q?etcJHz6l+sUTqNIch6+bFebpo/Y2FExGcgwHXQ6zPy5lcPtFUgsRYgp7kdjI?=
 =?us-ascii?Q?mYeP2V/8pDAKGSi367mcG7FIp7OC04tvQo7fgG7LL9ZVtnHzc5vZHZLoRISB?=
 =?us-ascii?Q?twMdavYoMNs1GmUj5QYgTGf5GHx+KxPnK8Nvl/XyeCQb4maiR4n0hjY2tVkF?=
 =?us-ascii?Q?/C2nH2MTbfp5OAz3s8TgFKAz8uO1Z6Q/urjtXNJghAx+qjeyM/e+uNFhjwvX?=
 =?us-ascii?Q?Uw8hkrBvbnCOkyWlGpy6GtLTvZzTPTfAzBp4QWOs1oJ0BouO3O5EA4ZWwfE5?=
 =?us-ascii?Q?sDjIqvglSwkzKm6xScgjAfTF9TIeliF9O+lzsd2GODWPQZHAI9vsLsUemsKB?=
 =?us-ascii?Q?MNORZqQv6rS8NWdyQQdTBLYfmSEpzAgS7mmcILkueEIxw5N9yK7IzD7MVu1R?=
 =?us-ascii?Q?JUUbOgGI/z6BvVB8RsPWy8PLaiPg4SfojmVpDKYsb6lI+DFwZ5bkxV7VTrM9?=
 =?us-ascii?Q?t+EruM5Hqm9o3MthIxqPjBgDzQJwm6HCSNz53Hqpa7gmPeziQiWL3qpmUcH/?=
 =?us-ascii?Q?Nq30frNWEiA21X3oCDmNmSA1vH5KkEdTyBmYEEPK88rUKv330lHNN7BMFlBo?=
 =?us-ascii?Q?DUqyEBnPg0tIqbzwqJyzFGJ6fZ+vkLepVp0EttDG5MwlA+hFYed7HQS68U0V?=
 =?us-ascii?Q?gjcXiizjb8nJMq8bMpQMFj9nTf6UT0o7ccHHhIrmkZUdoegFeVg5b33Fsck3?=
 =?us-ascii?Q?w6N8IN/Yda8b9crPPnBADyvZHojP464cLAYyZ2J7gXm65oYFFOT3UbCHkUiA?=
 =?us-ascii?Q?7CZH7RcztkbGLU1N/WZLlCBBbigK8K1reV6koeuQdbEZVAbf5QiDMQRCQ1tQ?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb1e91a-ddaa-4af1-0fd6-08db24eac567
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 00:18:15.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNZLeEkHOlcdxnBACfcZnV2TxGzG0CUnmWUOyFybOXZlOOIWlSsE/P9BJt24oc8dPA7835IJ4knjOCNo9b302pJvahxWX4qYgSPpntJ5EiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5526
X-OriginatorOrg: intel.com
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:23:48AM -0700, Lucas De Marchi wrote:
>On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>>Our initial attempt to run Kunit based tests on live devices is hard
>>to use and will not work well with multiple devices attached.
>>
>>Instead of relying on separate test module and duplicating support
>>for multiple live devices in every test entry point, create new set
>>of helpers and use test->priv to pass reference of the device under
>>test (DUT) directly to every test function.
>>
>>The same use pattern is supported for both mock and live selftests.
>>
>>By using bus_notifier we can start testing each new bound device
>>separatelly, subject to filtering using dut_filter modparam.
>>
>>All test cases can be included directly from .c file, allowing test
>>code to access and use any private functions.
>>
>>As Kunit will attempt to run all suites on module load, including
>>our new live test suites, we may want to allow to execute them on
>>any available device. This is controlled by anonymous_dut modparam.
>>
>>Support for either mock or live selftests, only one at time, is
>>controlled by new Kconfig options.
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>---
>>drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>>drivers/gpu/drm/xe/Makefile                   |  11 ++
>>drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>>.../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>>.../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>>.../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>>.../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>>.../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>>.../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>>drivers/gpu/drm/xe/xe_module.c                |   2 +
>>10 files changed, 412 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>>create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>
>>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>>index 93b284cdd0a2..aeba43977dca 100644
>>--- a/drivers/gpu/drm/xe/Kconfig.debug
>>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>>@@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>
>>	  If in doubt, say "N".
>>
>>+config DRM_XE_SELFTESTS_MOCK
>>+	bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>>+	depends on DRM_XE && KUNIT
>>+	default KUNIT_ALL_TESTS
>>+	help
>>+		Choose this option to allow the driver to perform mock
>>+		selftests based on the Kunit framework.
>>+
>>+		Recommended for driver developers only.
>>+		If in doubt, say "N".
>>+
>>+config DRM_XE_SELFTESTS_LIVE
>>+	bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>
>why?  I think we should aim to run live tests in *addition* to
>mock ones.  The mock tests are more testing our SW infra and can be used
>in a true "unit test" sense. While the live ones are testing the
>integration with the HW and making sure they work together.

on a similar note, I'd avoid grouping tests as "mock".  Any test
runnable under UML is a mock test and is testing the SW behavior.
 From a kunit perspective I think it's the live ones, interacting with
the real hardware that are the exception and can be grouped as "live"
tests.

Lucas De Marchi
