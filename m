Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF0BC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 06:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CA310E0A4;
	Thu, 16 Mar 2023 06:46:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B62010E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678949212; x=1710485212;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1u6aO9HunWETuw87h/DzTXotwPHdgz0yz337k6ySGfU=;
 b=lL2lqI6aQomSawZF5NfEaLje5I1Bi4+XuJc2TMsLakW2kJAXPHTabgN8
 lrE4DHTcHfkU4eDq3OalPF8sIL8D3RgR0OWGQlyHCWQ3GPpD2txEcK5GC
 eUM3ia9tSsaUy2jiqKIaIFnAt6MZgtvzhhKH51fFHyDToZpPeY/BNQ0qY
 OPkG/xt7tr/Ys9CvS8VnJWtfA0BOYT52GgeRYNlBXWVBw2b2rrYLeSvjj
 N4EQCGzObtA0SCgvtZ42eA9W9X45Te2LtJTSqnPGPfWdxiI0LVuFJfsBP
 2q8swsUhuudlbi7P3Cuso60C5eks7gB4GK6AcBhaizu87Gl3IEWk4lxlI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337923001"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="337923001"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 23:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712210889"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="712210889"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 23:46:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 23:46:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 23:46:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 23:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL1pcGLe2Cdlsb84EHCGj85iRAh8Cvuhx04cmBMVxhycX1MnPz12k6Gprke7h7Na5KEZRR7nUAI3woBNkRBZGJJq6XkbWxVXgfvSQG3qqHmOhAh18YVd/qipZu+erQhh3To68cyXYTVQcrbE3OMdgCcQflwcErdgkJX/kBYdurL4lWlmxoF8SAy6yzv7EsbLJ/79is+qLf5vMlh87vAFB1q+lWpiyiiDif+Xw9WaiDgrmGzKYRWd+JBoXGYPpahs6xDyLAYJWtRWI2OVRnYaQJUZLpaeREjJgdOzBapI11S13WyOG9GWNqeOfwrouKdhRyI4wccZMi/kenjINB/JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04dZj6XEsj2PC/nHlfziyOE+M4erYRkYOky8Vllleg0=;
 b=EVPnPvhK1zXM43BVe7f0kRT0iv3HRxWsRXnidahNmd7nH2q/k8C/v+matepy3sPiWRSlhx5duLy0gJfgidJ5SCw+QZHGMkDhJdxmQd0gRFuTtvebaq8JIat753qJINQO42VHXimAUV4lopGuzuVecX3aFjAxbdWiX3zZdPv7sVSi7+jnlXO1fRLvYSv+DjSkheV2FKeNFTNfLEjlez65CODZUdra9p7Zv/sgf6cVOkE8xRerBGG7ZP8HMiMsNLPof+q7uWOirdQK6TZIoxFZwN2SWx/6tcy4rcrx4UEwM0AWaHSajVKxE0YW80S36uHiO9JaZg5XixXeupbrsRPo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 06:46:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 16 Mar 2023
 06:46:46 +0000
Date: Wed, 15 Mar 2023 23:46:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
 <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc221ac-e79b-484e-d14e-08db25ea35d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXlXcsdzPP5vOVER0PWAgHdBal8qZcASztovC+PcWCQoEG1mrIFrGoy7Bl6jbRFXLWiS+vJLiLyOTwdE0K4F5aVkQyHTg4QG0qGOWB+oganfEcQCy40TU53LhYKZxr/sCJzOhH5yinotoclaTAtWoqHx3jAZ2m4rKV0rApSiJumOdBB8NC+f8rK953MTcI7tDY2yQNy+b21qXzTDJV9i0i6cAf9FqNRf0WFQR0cF93LV4d+h2H4WqAQPXeQGQ+IZSS+apU5sOaSap7Q5niRAs75GP+kvWw2szVEA2wMquQ+kjiUQNf0rnJRE0SC6vLEWMEHfV6xW0gfwhVkWVYdt400cIcJDvCuAItBKPfpftVFROC8ipFHCGbmHuNvGwDzcOEGpOfk3UyYCCDT6kvB/bkyYqiqgR8tfLAaafrpcv+Vf0msTclldqdftpJBt0oPOZVvYTVPg+F2fkylUkNrUmz03STnA9bVxyRTyoY0GbXhPU3QQl8/CXMEYwtL3CkDakLg8hO+Xc9N1CzQXESwKcnUYO+BtwrXfjhBLNfvYvYUGl9gl1NEUrWT2VX1TDLqhu5WDHn3+eYUHmonvw2MnLg+4AZ+c80svtWVNuHYqTrf4eP3Z0W4GX6N4x4tvp9FmSfJwlYtVZYpnvkUcPw2VRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(36756003)(86362001)(38100700002)(66899018)(82960400001)(41300700001)(2906002)(5660300002)(8936002)(6862004)(478600001)(6512007)(107886003)(4326008)(8676002)(9686003)(1076003)(26005)(83380400001)(6506007)(186003)(316002)(6636002)(66476007)(66556008)(6486002)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AZp/TIL0gHb6ZLwMtHbMbqx0OoTcGd0s/dV+XkNqD2Z5y5yCkOvMiGwZAR?=
 =?iso-8859-1?Q?woCjZITBJ5uQJsTrMo/naJnFRf89E78oCZWudPBAeso/S26Ba3cBxN9z+J?=
 =?iso-8859-1?Q?Nr97hYMDD3pphXfdq0etilZxRMtnDYRueY7vFTn2cVIBPmaCVDP1wttM6v?=
 =?iso-8859-1?Q?YWM+9nSOYDQLqero25SOf0VpGka3QpbhlDj7Qn9Scw47phfu2XvyjxY05I?=
 =?iso-8859-1?Q?tn87EWxXWvfb3u6HAMa1IHYMcYmkmi3xHj1aD1ChBrzMqLWXZ0hn/9Dk6C?=
 =?iso-8859-1?Q?PxiYvYSC/G4b+Q3Q0fAltvPu/yqNix560JdOtNCaAiDt3EnrcBEVejFwxp?=
 =?iso-8859-1?Q?2kzQw/mE2NvFcXZRoWmGhdVfG3MQMN7xJBGyTeQ8BS6MJEZGqZ9xjzjZD5?=
 =?iso-8859-1?Q?r3tLdo0npVNI/sQMJFmN+iG3m5jtWeryxEGiYWpt8UMyhfdoyD0hO9gqtC?=
 =?iso-8859-1?Q?E1oaLYT/mESabeXXVgEltJSRISAmdnU78wKN4yezxwEfShSHNm8o6ZcXbg?=
 =?iso-8859-1?Q?SrMhs7rmFHk0pVCgK5ezIh8cHgJiwygVIgML4vYngzvB9EtPJI3AIWfIeQ?=
 =?iso-8859-1?Q?YBG7HvIx0a2NCHL5Oap93W8ozdN+iqak2uW6DwV9z9nuyhbnYHo/7QjE0T?=
 =?iso-8859-1?Q?xYSlMxomEEmg75D2n51aS+njk6Gtw3sTJhRxaTu6PVuj0LCd0XwuMc1HqO?=
 =?iso-8859-1?Q?5WvuEItt2BcIqibM/N4XsJoEZXdjGJ6rzW6bmI6qU4k1tyax0ooyWA4Xh4?=
 =?iso-8859-1?Q?dI5J2CzYgXg7olul99HareW3n5ryndyvQY3y8UoB3YDPFvrvadenWyR6w6?=
 =?iso-8859-1?Q?HjThbYRcGIrHaKJf46Evjs1qbuCG+eNDK7kUHs0U9vxoAti8k67wxqQuV9?=
 =?iso-8859-1?Q?3PhaovcQctVZe7yZ47U5n0+qH/TjV/BCMnHynV9mR1G5td3GybzVpK0OZj?=
 =?iso-8859-1?Q?A5JmgQ4jIiCoV2qtysnY+KVc4BiB0ZOjK74AgWvoe53hs7E7cdmudqDe9o?=
 =?iso-8859-1?Q?2X987iPcupH+rZbtos0s/Wpe+/1o70txfZkK2aPI0qWRL3apv3Bgmoc/OA?=
 =?iso-8859-1?Q?Zz+CKaNBWvUVfv2SR32kUK5Cm4lod/NIl6/aHXva+oqsBBfrI5tdnYBR7b?=
 =?iso-8859-1?Q?JPde/YpDbQ7+rpwrT5kStpG0sRRsGl3WTo+GshQGmRRyj0cXXN+xUYZZ55?=
 =?iso-8859-1?Q?YTtB90Q00DN/zEhNSt/EOlGvO7sGEtKhDPFn9+BekPQwc/1apwDL1/48wR?=
 =?iso-8859-1?Q?n/SM9kpVUJzyIsmaUAlx64mGRGtdz4VfCdt50g8ytv92+wJeK7ghLi0PnQ?=
 =?iso-8859-1?Q?MaJ24c8oqgXDoYvXC1k06yZeS+0XRJtAAEfX+iSlOQbwVkbUvUExCUGch6?=
 =?iso-8859-1?Q?NAQZjgRXGdo00yefpbbhOcRB3hVF6nGwvO0MBKAU+WDvjw3VAssqpki3Tk?=
 =?iso-8859-1?Q?CqMdJKUwUIfPbyV46x30kNezy31K4Iafgr9H4f9ui9Cu4+T5AxWY25QVxU?=
 =?iso-8859-1?Q?5VBgPKmUeZ7pbmSv5+4FwsUak5441gcGfXuFtaLsnDr6T5trNqfOWvep9C?=
 =?iso-8859-1?Q?+mk5hfhSH24VxQ5DLWjqLj8xCj1EaXFqOhMibcC4pfZ3RHdOfL/d2/0q5c?=
 =?iso-8859-1?Q?eSrch13GyJKP0Grv+VJEG7fuBjLzZRbGL+l+zlt+3qvdr0K54ev1wwPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc221ac-e79b-484e-d14e-08db25ea35d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 06:46:46.0774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fgbemvoRflwtgmGGEb9aKb56RwCbipDkEF2OacIKLp+uhdYOUMd0hjD7QsibSRgGU4WMs1sIkh5BHMGYOcjl2PAg8PBk0XHvVXoy/QrTUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

On Mon, Mar 13, 2023 at 07:18:34PM +0100, Michal Wajdeczko wrote:
>
>
>On 13.03.2023 17:23, Lucas De Marchi wrote:
>> On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>>> Our initial attempt to run Kunit based tests on live devices is hard
>>> to use and will not work well with multiple devices attached.
>>>
>>> Instead of relying on separate test module and duplicating support
>>> for multiple live devices in every test entry point, create new set
>>> of helpers and use test->priv to pass reference of the device under
>>> test (DUT) directly to every test function.
>>>
>>> The same use pattern is supported for both mock and live selftests.
>>>
>>> By using bus_notifier we can start testing each new bound device
>>> separatelly, subject to filtering using dut_filter modparam.
>>>
>>> All test cases can be included directly from .c file, allowing test
>>> code to access and use any private functions.
>>>
>>> As Kunit will attempt to run all suites on module load, including
>>> our new live test suites, we may want to allow to execute them on
>>> any available device. This is controlled by anonymous_dut modparam.
>>>
>>> Support for either mock or live selftests, only one at time, is
>>> controlled by new Kconfig options.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>>> drivers/gpu/drm/xe/Makefile                   |  11 ++
>>> drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>>> .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>>> .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>>> .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>>> .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>>> .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>>> .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>>> drivers/gpu/drm/xe/xe_module.c                |   2 +
>>> 10 files changed, 412 insertions(+)
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>>> b/drivers/gpu/drm/xe/Kconfig.debug
>>> index 93b284cdd0a2..aeba43977dca 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>>
>>>       If in doubt, say "N".
>>>
>>> +config DRM_XE_SELFTESTS_MOCK
>>> +    bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>>> +    depends on DRM_XE && KUNIT
>>> +    default KUNIT_ALL_TESTS
>>> +    help
>>> +        Choose this option to allow the driver to perform mock
>>> +        selftests based on the Kunit framework.
>>> +
>>> +        Recommended for driver developers only.
>>> +        If in doubt, say "N".
>>> +
>>> +config DRM_XE_SELFTESTS_LIVE
>>> +    bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>>
>> why?  I think we should aim to run live tests in *addition* to
>> mock ones.  The mock tests are more testing our SW infra and can be used
>> in a true "unit test" sense. While the live ones are testing the
>> integration with the HW and making sure they work together.
>
>I've added that just to simplify the code logic as I assumed we will be
>running mock tests only in "true kunit" fashion as part of the build.
>
>So then we could avoid mixing mock/live "kunit suites" in single driver
>module, especially that as of today there is no nice support to filter
>out undesired suites from the execution. Thus adding compile time flag
>to only have one category of selftests at time was looking promising.

I'm using this in the patches I'm sending to unit test rtp and wa parts:

	./tools/testing/kunit/kunit.py run --raw_output  \
                 --kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp

>
>So I was using .kunitconfig with
>	CONFIG_DRM_XE_SELFTESTS_MOCK=y
>and normal .config with
>	CONFIG_DRM_XE_SELFTESTS_LIVE=y
>
>>
>> I have changes pending to test some WA and RTP infra we added,
>> regardless of the HW. But I don't want to have to choose either one or
>> the other.
>
>And I guess you still can do that, just it wont be automatically
>compiled out, nor you be able to benefit from the helpers, but they will
>be executed
>
>>
>> Also Cc Thomas as original author of the kunit integration.
>>
>> We also have some overloaded terms that need better explanation:
>> mock, selftest, live.
>
>I reused terms from i915, assumed everyone is familiar with that.
>
>"mock selftest" - a kunit test suite to be run on abstract xe device
>"live selftest" - a kunit test suite to be executed on real xe device

Things I like on the current kunit integration we have in xe:

	1) The ability to move unit test code out to a separate module
	2) Not having a big infra that is xe-only
	3) Share terminology with the rest of drm subsystem

This patch series is basically killing (1) and (3). And for (2) it seems
to be heading another direction.  Looking at the current available
drivers,  I think we should be more like the drm tests and the vc4 tests
rather than the i915 ones.  If we need more helpers we may probably
extend the ones in DRM_KUNIT_TEST_HELPERS

I'd love to hear others' opinions though.

Lucas De Marchi

>
>If you have better suggestions, then you're welcomed
>
>>
>>> +    depends on DRM_XE && KUNIT && EXPERT
>>> +    default n
>>> +    help
>>> +        Choose this option to allow the driver to perform live
>>> +        selftests based on the Kunit framework.
>>> +
>>> +        Recommended for driver developers only.
>>> +        If in doubt, say "N".
>>> +
>>> config DRM_XE_KUNIT_TEST
>>>         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>>>     depends on DRM_XE && KUNIT && DEBUG_FS
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index b94e65c91101..b193af2d9930 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>>     xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>> endif
>>>
>>> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>>> +    selftests/xe_selftests_mock.o \
>>> +
>>> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>>> +    selftests/xe_selftests_auto.o \
>>> +    selftests/xe_selftests_executor.o \
>>> +    selftests/xe_selftests_params.o \
>>> +
>>> +xe-$(CONFIG_KUNIT) += \
>>> +    selftests/xe_selftests_helpers.o \
>>> +
>>> obj-$(CONFIG_DRM_XE) += xe.o
>>> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>>
>>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>> b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>> new file mode 100644
>>> index 000000000000..6b13b998e789
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_SELFTESTS_H_
>>> +#define _XE_SELFTESTS_H_
>>> +
>>> +struct kunit_suite;
>>> +struct kunit;
>>> +
>>> +int xe_selftests_run(const char *dev_name);
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>>> +int init_xe_live_selftest_suite(struct kunit_suite *suite);
>>> +#endif
>>> +
>>> +int init_xe_device_selftest(struct kunit *test);
>>> +void exit_xe_device_selftest(struct kunit *test);
>>> +
>>> +int init_xe_gt_selftest(struct kunit *test);
>>> +void exit_xe_gt_selftest(struct kunit *test);
>>> +
>>> +int init_xe_guc_selftest(struct kunit *test);
>>> +void exit_xe_guc_selftest(struct kunit *test);
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>>> +int xe_selftests_module_init(void);
>>> +void xe_selftests_module_exit(void);
>>> +#else
>>> +static inline int xe_selftests_module_init(void) { return 0; }
>>> +static inline void xe_selftests_module_exit(void) { }
>>> +#endif
>>> +
>>> +#endif /* _XE_SELFTESTS_H_ */
>>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>> b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>> new file mode 100644
>>> index 000000000000..ef98f3599eac
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>> @@ -0,0 +1,46 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/glob.h>
>>> +#include <linux/pci.h>
>>> +
>>> +#include "xe_drv.h"
>>> +#include "selftests/xe_selftests.h"
>>> +#include "selftests/xe_selftests_internal.h"
>>> +
>>> +static int bus_cb(struct notifier_block *nb, unsigned long action,
>>> void *data)
>>> +{
>>> +    struct device *dev = data;
>>> +    struct device_driver *drv = dev->driver;
>>> +
>>> +    if (action != BUS_NOTIFY_BOUND_DRIVER)
>>> +        return 0;
>>> +
>>> +    if (strcmp(DRIVER_NAME, drv->name))
>>> +        return 0;
>>> +
>>> +    /* only matching DUT names will be tested */
>>> +    if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
>>
>> "DUT" name could be avoided and just use what exactly it means.
>> When I see "DUT" I'm wondering... is this the platform name, the pci ID,
>> the pci slot, the device node?
>
>will rename to "dut_name_filter" do the trick ?
>
>or do you want to drop "dut" completely and have "device_name_filter" ?
>but then we would need to add "selftest" or similar word somewhere to
>give context and then full modparam name will no longer be that friendly
>
>Thanks,
>Michal
