Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4893C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 17:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16C010E2C9;
	Wed, 15 Mar 2023 17:14:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB510E2C9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678900472; x=1710436472;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9o4gQhr38U+shlS0ZdAG6hs67CD9tvf/d0iBd/k3x0k=;
 b=eyDAzjrU+RXnvdU7GJ5QXqmJtVd+AjhXCL76bf5I68nEAEm3hHplwr1l
 Q1TIBJTUWlrcGNfcMSd/qpZVI9TpM8t7L4dbn4+0zfsNxmakIyLDQ02X/
 80dai/QD40xPZiJ6xxfs0IxI0hVYCALjapAel6k4zWBdeAnTl0N/scIjJ
 q6gJG6Hy7V3POW/sX8i5XHkavFPXcSGOOiPRhv2KRSM21wJSszy2GM+1w
 xjOtBOu4tr7/CT1oqTsE3mis2PC8oeWqi+GuE+UvARcHJPdHUu/fa4A1y
 0kEMAclFXk44i5+/IinLPhkEs22+aFFstsLVBqWNDWypXr/2iWxknVWc5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321614624"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321614624"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 10:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="768588572"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="768588572"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 10:14:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 10:14:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 10:14:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 10:14:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 10:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf/5z6GQWqDN4ZordmPAE0igdilLzSUByexhyyp5Pz1Fjm60/t2OqpenI0CBWRIGP3CyRhkSSXZtUxUASiZsBCVVE1KWICvusjVF4UBgsd1Ca4yu6KmG+KEWxLAIfBd9lN5vRj9TYkRu7L2f0p1iM3MVqF9Hr1LcDuQqBdZSQqh6yw94fZooskzvtewmWjRISH8lu0GrLWcp7RWcLHMDSUq3IrdhRupjND0Uo3XBKYCUDCpj/FU2VJURd5Kx/1TieUAxSFHwwN3HRTeZBeVo5MGiUxpdJ9LqjLNqwxlyNBPn4g7SfyLh7lbPV5VKC7D8ybTVAMHjBj9p+QLUS27VCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Usap8J/OAXXXnXxFdOi/gLzBTNeGQBsD3HN42RlGb0=;
 b=fTrc77BoeLDTcwzRWt3WRWWyXFp21cqii+3HTe96/j9hRYRWAhvjGh+wpddqTSWDXgbwg5wSQ+qxsd2qdqyIXSTSnq1icjNNCfthTKjEDBYNDJyr0jrfp9uDtAvyb7+UcKk8qw+I17sUjQmQlW95Ams0hboe7kMWvZT9wScdJjnw+AA0vgqWNB0G0e4aDk4OcR14XwXjZhqy8wF5e90Lmte7h9EFuQ5Razn0EGeMCgYBXuE0LQvYGW0KoT81fAmh1d2y+qXPr+UCeEDb0SByyWri2rAksBbM/R7I+obfWvbrdIBmTbGBQECUaLv+xCXhYLaCujMbd944lus5+1gtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 17:14:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 15 Mar 2023
 17:14:27 +0000
Date: Wed, 15 Mar 2023 10:14:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230315171424.qtkj3gp3tetokeaq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230310081338.3275583-1-mauro.chehab@linux.intel.com>
 <20230315071145.27b77c86@maurocar-mobl2>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315071145.27b77c86@maurocar-mobl2>
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: f140346f-42d4-47de-288e-08db2578bb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaw/dZF6I5A2JARjFoEXn2oX8vl1vBaE5D9WKBVi+ncWOvRDJQp/h4XVGyJ85J8LlXwjy4o/lBdBjl2xUt9u3hPhLzbhWoVCONsjY41EnlXd1om8aslnvbQWr+43gIaUgJSQt2ojh445v4X9ZqFZgJzPUAZ+wsplOChbhouexoTd8X61qHhJuoW7yuPa221AkutCl5ktNUlJ6hgz0JZYpT6BEcbFhRQhfw3SJq4Sb938R7rR9k7rjY6cjYU5IdgJE9iZKo4aW87Z9xZQcgRgvzqNgogyN+HiURhwpBI7uqp05vEWhuDLNx8ebKx5AsTxY7ayATe032MsSbk1ivj6EyUup9gzz0mWYZQhtPnfg54ySB2keC5RU0tLeWUbEmFMKmMv6nPVnBbSJPc1L/mdcq0ntOA8YTPFnUSSgPp8PM8oZnEbh9hkZm676m3W/nqkvP9EfKPBlBybdd8XYnmiBvn+T/sGaWu4UF0g37T/UY529ZPFnR1oTb3FFRLUWxkeYww218NcTSHlAiIDhrkoYhopoVPfVqvyvlUfBagAM8Lo0QBqD9atYRRpmmSEw9Q0ZDem8KdTKf0w6aFzuPoii0dkQIbakH2W/cEHwcMwTnOOymKSosMJ0BnZq74ZSUF7amkmVAvAink10Bd1H7q5NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(8676002)(8936002)(66556008)(66946007)(6916009)(4326008)(316002)(186003)(9686003)(41300700001)(478600001)(5660300002)(66476007)(2906002)(6486002)(6666004)(82960400001)(1076003)(6512007)(26005)(6506007)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MfrkRtcKVZzjWmdXD9ccUR8TIxlw4ilWuQDWhFX/AfmcP6gnk+7WShLriR?=
 =?iso-8859-1?Q?JzNC5ekGHSoUecsd6TsGWU+ByfC6+H+WZiTNReOdZQN2CTLNZeACPEmSwe?=
 =?iso-8859-1?Q?ChO6qYD298xlDoqDMsMGVlDav4FP20MlZpw2KN0fJAlDa7xNNsqvqmavAS?=
 =?iso-8859-1?Q?DQ901QI7pHS2yJXzlVMcwgdszE8joQtSftWOw9iGtgIDDW/SclpjpZepp7?=
 =?iso-8859-1?Q?gFEXRDEPVujSXnS3ivYw7W+zyVIiNev8dRj1wtMgSS8hFurB80qcCBPr/Y?=
 =?iso-8859-1?Q?ZNSu3xAFjFopLQ7bubq+RoRpeoPoIHVKOj5Foc9SBGaMtbmi2LQGINdNEd?=
 =?iso-8859-1?Q?4APzsrbQKWIq4eCPpLMwfM3ANNEaxMgAFl9izeDZB3tLck9f1uQ8wMkjs/?=
 =?iso-8859-1?Q?tIlLziosPBourOp36GXyoNSDknfMD12LyHhli6YBy94DXGJAlpDCwWkEA3?=
 =?iso-8859-1?Q?5Oi8GbCRbQLGg34DFT+pXRCsP1ByCSpKe2uwhZfyRPmBDoFrc/p7Lr62MJ?=
 =?iso-8859-1?Q?+Iy63MLL5jkNSzVyM8KhmITob7KcGTb1hrTilXakw2WfKZVG3xXufA7egq?=
 =?iso-8859-1?Q?+5qnKyFFUG7er8DqgsUJdAXLgCCGcPvcq6RXLvSaFw4vxBfp+n0sDq7NTz?=
 =?iso-8859-1?Q?q6BT7Aciy7ChRXDpYm/cmPL+0eA7N/ha7I/TBMkpZ9snWdsjI1V7rGw436?=
 =?iso-8859-1?Q?ebuLb1vcQ+UXuGpFNW1KDsOcromyV8oXyG6YTIoVUzLhXLIKsPt+swSNlv?=
 =?iso-8859-1?Q?4JSp0olWIXazDGqcAkcZDXVvGOpm0a7NaSudnlwHWyXukakHKKb2Ltt+bT?=
 =?iso-8859-1?Q?avoBXlpDv/Mr8X2rJVoh/NQFIOwOYv6YmXjtG1NNq+t1RSesEJJmYjdVPT?=
 =?iso-8859-1?Q?J0+nJbsth0rnfl+xF5sAN0SNW0thnruAddpunbKUwPDNlUo30v6iIPzGvc?=
 =?iso-8859-1?Q?gx83D0oub9uMmC0aDks+Qd2jxw15MaE86XWnmfPqFv1Zsb9xIWnQAPOu/+?=
 =?iso-8859-1?Q?ebN2x3c4SLgD+8xWPVZoplsr9KOG3rtFd8uE557bBTYVMS4AWCgldrlDRg?=
 =?iso-8859-1?Q?0HuSBt0ivfCTGjpnRHz37dGIgG1a/L7bVlS+CYGgXUxLyVBl5t7x9Ns9uh?=
 =?iso-8859-1?Q?xcsNeEyj+/c8TkOvVSp+Bmkvwv55I3kvDsRHgv0xxdfI4aof1TfcNn7QQH?=
 =?iso-8859-1?Q?47UopnNpDaN7H58Xitp53GQKupssw9bz2yqRJZ62gYmsNopM6vV7+oSYEZ?=
 =?iso-8859-1?Q?R6lD10sFecL0Ts3tFPjUtEY5S6Bi9/tEPvIzvqSE67kyrsnlqyhf6m2LTv?=
 =?iso-8859-1?Q?IZQxtA4TWkSrdxYP3ysW8t90fHhvxgsDmsrF75eboip3jcPel4RArdyBqN?=
 =?iso-8859-1?Q?iLexeB7SIINOvBKPu72VPLlhkjbqf9onyMw0HQY+AzeFVlMReAd2BiAkHx?=
 =?iso-8859-1?Q?uOT8PKLkd+RlW3Xv1xfaBtAcAfYaiyyqFHwFPrZLfkx7XvXa5fcPYmSDiY?=
 =?iso-8859-1?Q?SFMQl8N2vTBLGZVj375o6yO9MJpLrJzAxoPoTcrumshvtX4rvIOj8dMtDs?=
 =?iso-8859-1?Q?BItAJsDE2g8eIRvC/VRx2UOtV/GyZo4BM2O3n2bDu0TWACcGCsqQUp+u9z?=
 =?iso-8859-1?Q?Bs01oXVNuLCMUN1UaHfWMj8nFqvhdGbuatXrSDrfdFcJSKeq0nmjC99A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f140346f-42d4-47de-288e-08db2578bb3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 17:14:27.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pha/pZWpIMDFw/HqmOQbJOQKzxZ8XqeJtKWKAr+dj4Jfl3TEnD4tOoLfvX2iy4sGInaaR9F1m/yGCLjWHBHC/VpvZjr0Uok9PaFx15Fd79c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

On Wed, Mar 15, 2023 at 07:11:45AM +0100, Mauro Carvalho Chehab wrote:
>On Fri, 10 Mar 2023 09:13:39 +0100
>Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
>
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> The GuC/HuC firmware files used by Xe drivers are the same as
>> used by i915. Use the already-known location to find those
>> firmware files, for a couple of reasons:
>>
>> 1. Avoid having the same firmware placed on two different
>>    places on MODULE_FIRMWARE(), if both 915 and xe drivers
>>    are compiled;
>>
>> 2. Having firmware files located on different locations may end
>>    creating bigger initramfs, as the same files will be copied
>>    twice my mkinitrd/dracut/...;
>
>Heh, it turns that it may not even be placing the firmware at the right
>place, if someone does a symlink for /lib/firmware/xe pointing to
>/lib/firmware/i915 (or vice versa), depending on what's implemented
>at the mkinitrd logic.
>
>I found this on /usr/share/initramfs-tools/hook-functions:
>
>        # We don't need to replicate a chain of links completely;
>        # just link directly to the ultimate target
>        link_target="$(readlink -f "${src}")" || return $(($? + 1))
>
>So, basically, using Ubuntu's default mkinitrd package, if
>/lib/firmware/xe is a symlink, instead of storing
>/lib/firmware/xe/bxt_dmc_ver1_07.bin, it will actually store
>/lib/firmware/i915/bxt_dmc_ver1_07.bin at the initramfs, which
>will cause crashes if the Xe driver is not blacklisted.

storing /lib/firmware/i915/bxt_dmc_ver1_07.bin in the initramfs is
actually the correct thing to do as this is what our module is currently
asking for:

	$ modinfo -F firmware build64/drivers/gpu/drm/xe/xe.ko
	xe/tgl_huc_7.9.3.bin
	xe/dg1_huc_7.9.3.bin
	xe/tgl_guc_70.bin
	xe/dg1_guc_70.bin
	xe/dg2_guc_70.bin
	xe/pvc_guc_70.bin
	xe/tgl_guc_70.bin
	xe/adlp_guc_70.bin
	xe/mtl_guc_70.bin
	i915/bxt_dmc_ver1_07.bin
	i915/skl_dmc_ver1_27.bin
	i915/kbl_dmc_ver1_04.bin
	i915/glk_dmc_ver1_04.bin
	i915/icl_dmc_ver1_09.bin
	i915/tgl_dmc_ver2_12.bin
	i915/rkl_dmc_ver2_03.bin
	i915/dg1_dmc_ver2_02.bin
	i915/adls_dmc_ver2_01.bin
	i915/adlp_dmc_ver2_16.bin
	i915/dg2_dmc_ver2_08.bin

And i915 is also using those dmc files.
Note that for this item here, the duplicate firmware blobs (if you also
have i915 built) are the guc/huc ones, not DMC.

I still agree with the change here as it's expected these old platforms
are primarily supported by the i915 driver and we don't need the
firmware files to be in an xe directory.

Lucas De Marchi
