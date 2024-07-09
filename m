Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73497C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0C810E586;
	Tue,  9 Jul 2024 15:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwEGFA4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539310E586
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720537913; x=1752073913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/6Qlh0L3PXLuXBhZIQ0CCb47thCvMFVwnBWQUYondlU=;
 b=VwEGFA4U5gIuBjU7uiRj7ejcilueU4W5U6SXvYDfw/C6J0ftxX3Kuqmy
 r7senbrKxEX7o1E783KllvSJ4nTxPTdbppoJcL5wOI1EFGEo8MzRcOkNh
 BmnM2yLAd8NTlwKMwxp6vostIS4XlPmhj4/4OBBpsqvrTwWAhwXCXTcVO
 G/1dg2Re9IyF+VQbObx+8tox2RRnZooxKEhvo0yGFqckSqHm/v2Dn9zxz
 AmV7khj5m5l++XmQAJgRveWSFEOgGmL2niIhvGd6wBAB1AToWCc9BiTAF
 xz4rcesWey43ClibgApFRh5B0upNx2//dZ3xFjPXUg1oKUKGdfLGWZnxS w==;
X-CSE-ConnectionGUID: vOkNtFC2STqUsYA8KHzGTA==
X-CSE-MsgGUID: FJfRL5DzSGCFqBlbm0Y+IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17907035"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17907035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:11:52 -0700
X-CSE-ConnectionGUID: BtoWQy1CTAaOm3ICk3ImJw==
X-CSE-MsgGUID: kv5x1fl0R9+yCxlDXNwCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="78627153"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 08:11:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 08:11:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 08:11:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 08:11:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFz3iemAa+Qh6q6RlTiu5/W0c8snM/6tT4sjZXeD+5HFXx+0kw9Qo4vVehssuPSwCPUQMbDT+3W5+yM0U2z3iIante6+yo0AURre2lVVGssIun15Pe+1wN6faeRTfTnUm2DAA043hBULFGC32Hh/xSeFkp9Nu1u4QaHZHVf9Guq+Ye4g9f5728Sa42+92YrqFPgjckIBG4AAwkqYGF7MR91wB98Pg+39ZZsvzCIKZdXohQmXedCmni3n8Wv2YAgyILY5m1nzd/i5B/79InrMnyxvLHvqe/HQFI32oXkL2mPEzE5ADaWSjN0XUA82mMHYEDSipJtesafYx6gT65A74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTfqs9sJA6eEXLG9UEXy4YCzqtnW48A5mouevQ2klQo=;
 b=JOFUXyEPJROShyCmsp9GLVXIIxwcW16az0mf6qUkv78djcj4R61jqkI0Vi6dq0WZBeyzcGC7xZrWE/Q+bD1rp5x8xS9A1WsRir/HMAVrABUSfPA93laZsUaiV5T3avyFOyznCtxIcMrOHvKYKG3HVUSy1NgGSQ9+nc4Kq5vqUNPJeeALzYPlzt6gP5GKq/W/hhr7rfxmErLZ0cGQhFCjASSLZfYyLfwIOetRwLrGmeXsEeRAPbOsksO/VBOxxZ0L29Xk5PooGOYa2rtJT9noyMJ85f90Dctc7yGXLwWsslEwS2511LZBf7bOosNRqXor3+R7moNnWnVoZM1x0PWmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 15:11:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 15:11:48 +0000
Date: Tue, 9 Jul 2024 10:11:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <mxnhwrka3iarajprb75wvsbeem3kxv4yxkxujqjgirkyghr3pv@i5cxlljd6j2j>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
 <Zox1iBxWvN7GtG2Z@orsosgc001>
 <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db57548-5c61-47f3-af6f-08dca02973e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nQnN0W/m/WvfTFy7DGyQ7Zc5VzgOdqhHH5rgc24qiPqLO+JhR4KwFWEhpIpU?=
 =?us-ascii?Q?SDZruNtS/9JEJQdh+nu4KgtH4kH/sB2oMTKA/IwdoFNofbJCJI22xZhlv8tf?=
 =?us-ascii?Q?lyWH40QQqRmBUgkAAjkh96kiqUlBxiSZhwTjlfTBhBTZ0gCiMJxWlIcLZ/NI?=
 =?us-ascii?Q?csMAE2lTRTACexORP27FwuxOZQOnfEKou5MjFYfcVvDsmxkiEOJS/hcNbISK?=
 =?us-ascii?Q?YL+Lo0Dh+UHI4Deeujkkprl6cRim07xSKD5MjV9tPmJAZUSyQ0MlVPvcVQeY?=
 =?us-ascii?Q?uBHYBqGKhdWUxNrC3Zptmey6uT1B0T25vYSczrh2RRvxUKEu4JmBTsBCloC1?=
 =?us-ascii?Q?O49vxcquJOF9npOtu+/Cm4z8Wt10gfUbRb02b1c8wiOVHjAe0l73VdBh8reJ?=
 =?us-ascii?Q?AVaaiAeKFZIHOwk0U1q5k/mGtMra3AmbUZshx94nRMrNwXiGdezEsKNg/aCv?=
 =?us-ascii?Q?MFeI1dPAai3w0OGLvl0ohjT3VtrBObv4JIxJDjmo+Nr9IkCK3MMMUsxDcMU1?=
 =?us-ascii?Q?bveUkmAI/iiGXO4EOhZqTyjCLLQwkmajlD+Yu6i3wGe6Fta4cAg4nLplebHx?=
 =?us-ascii?Q?BgoDsJeOnh5bzckCUon63ijMyM2Q+CQ9+wyhlFCNgASk0vW01Ew+PuaPfLxy?=
 =?us-ascii?Q?hDBGB24T+9E9h95wPO109+p4DFp5CMnXv+3cO9EXYO6NbcZm+mlDBLbWa4wZ?=
 =?us-ascii?Q?6zmgvnrhcJ73wu2SuCI/qumE8lEJqsW68g4/A5TEckCG3m/K2UT6lzOrVhkG?=
 =?us-ascii?Q?lCcv5BSAh/8+HrcXauSB8IxcsuGNdbUk6wKyd8IUj4emYfrMeCupcarKBq6W?=
 =?us-ascii?Q?mUhvGPGD0g132CRKdH9JRwQEzwDGYEysXoVhvxl1liHVepeGtmQjecdND1dN?=
 =?us-ascii?Q?TmZCmkbmeXhBYIBnQb2O6tu5S75b53PPhdjciuWUUU2PyBaF8rcpIAHwxWMK?=
 =?us-ascii?Q?E+/OSih0LeeULncTdYDgGKyeUs0EwEuzDjWynqYZIsA23RFpA/iVSG0D+zRh?=
 =?us-ascii?Q?9Pa9FGEL7NZdpWOqI5uVVVK1c0xuahwi8dnE9zNO3ANxsEXp1XN8DjzFm9n9?=
 =?us-ascii?Q?ivZDlrvMLHMqT1Q6twx2XlpAUSw9Mfi8dHufXAAF7qMXF6FrYmYHpPh6jAwa?=
 =?us-ascii?Q?HzlZM1fS2/6DDCkAqfIHPmok4y9InK67IzhzSngi9J8t8YL3xD02fF/g9xEf?=
 =?us-ascii?Q?rQM5/XLpuADf3nBigWjPqF6SgS0ZX5Onsf8mlAPMxiScbbYyqVcBHbe5mbSM?=
 =?us-ascii?Q?kLTBc8lp/CQvAbc7jd3l9/2nOxUID72DRKx49L6CVw0Aas+D9MaSHdH5h8ew?=
 =?us-ascii?Q?Tww+xkGPjUqTRjaPGY3ZpLgRipP4e7Xog6gMos9uukf2mQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7BsaABc8YO0Z7+b9DZqiBsMDFlIBqa6i0S2Y6Soa4c/FBEW7EslkX7gKzQ3?=
 =?us-ascii?Q?LokiRcrppf9Nu03iLa60BfraSbqmGCUuwDIFj1Qj3FtIM3Cmx7hWgrTMKZZf?=
 =?us-ascii?Q?NJMexEpCkcBTlPA7IHlJc+EyLdjK0F/R/sznsjkvHs4uuhLIv/NUn05FykrA?=
 =?us-ascii?Q?GWNgVwqScDLegAfBfU9HV645lbUzVAI0OK9R5C3TlLjQHCZ84g9lRHF2uAqa?=
 =?us-ascii?Q?U1gCaR74GVIyDUwRjUAbh+Ri1ebZ6RET/Cp13KZ7AB2i+d04Q3P9AI1XwK1D?=
 =?us-ascii?Q?DqBIkrSQvoL7TlsAEMcQ2ea6S7FPMqp8Y+i8Lcz0ONWnUFvFXaq8r1nMAbbt?=
 =?us-ascii?Q?H8wTyje4gaMMTQLPYZ6R7ta3K03hKpJIes0XgU9dl/MmR5VOPC71bO2SWvLq?=
 =?us-ascii?Q?T3GoiyS9dt1jl1ZJE0b4097kR+JSB2gGktIsTGUq2dDh/Ooon6suFztL3AGf?=
 =?us-ascii?Q?0LmC6rDWfwsntrTveoicfrXEUl7/IKuL7kNpj1zFyK1rwF2XjDD2M9U7ELtS?=
 =?us-ascii?Q?xmhoomh8c03orHkV847HLheqN+d4EFqKEGDYkYRIyGnoMWyfRUt8YZu/mZkF?=
 =?us-ascii?Q?LM5dTz1gFZDWKRot26K0Fx/GE4uFY/aNVORXM8rh6wkr1MkE9Ldx1IA7KnPI?=
 =?us-ascii?Q?YZhWiZF7wSptz2sPOfTGrYEiwi0FSSdt1rFHm+Ud6gTASowsPnij9nUwTU/c?=
 =?us-ascii?Q?xYY02jfi0x9O3f2B/bs6XQszjBpnGO6Uzy9C8B+CMXaI+jZRoF2fcVdkkMUF?=
 =?us-ascii?Q?jnOZEvim1gsOaN/ab0QxWFLqPMHkRo82V32xzyHqiuPiZQ0qeoB99GtCs/ly?=
 =?us-ascii?Q?L/AiU7SvqRnVg0XeKhFnSUUi6B5ElFmVCL9frBqwZPyj7qfUEe4e8zwDB3Os?=
 =?us-ascii?Q?NWvEv4fHoPeDTPv0ej8t8ypyq8t88v90/c7bhuh/U4334C/wm4wj3TIh8nPB?=
 =?us-ascii?Q?0ebog4Xq95R73/Rscvv+L81HIC/dA4T/NPMHRvU9A4HrxO7z+NRrmBd4a3Dk?=
 =?us-ascii?Q?qLT3/CDQU1yDZjYUzIoJ4cPlzPHb73PXqPb+Ss11whauaSzYp85CR9npVU3u?=
 =?us-ascii?Q?a95wPHl6djvGoFKI+DkmWWLwwyte09IwhlGU7PjnBb/OHVj8vAw2Ws1M8SyS?=
 =?us-ascii?Q?6AM8DpyAUViQ41aHTnPddcFus21oLY4LFePAy3ab2LnO5RfwEqJdgP5jYBU6?=
 =?us-ascii?Q?QUqUxsT3yO9B8PQjBjcJdJtCmeup2Qp1LXXyC2t1DqrYRfIFOFdGdiSqJlC5?=
 =?us-ascii?Q?t6+rRyUyYllPCGCoieCCgHqYuBfVaAMEwyRJUEGpbXWb6o/JTow55x4OmSd9?=
 =?us-ascii?Q?gqkT9O7IbMdvN6+JRLfnwGfpmBXk4WbWPBlU5JPeYjkVnx6OlXWlRyf3+nhZ?=
 =?us-ascii?Q?gOX/HsGLwSQ1ZvU6Ak1z4XaeWQU4hrRXD4l0H0j9U5PPbfIr3JMSuzUUuvch?=
 =?us-ascii?Q?hiRXUDSfQlu3cwsQTKM5Kl7NtL0iu2FOPBKg+NYrbHSHkQl+iOcxbWK2/hi0?=
 =?us-ascii?Q?ioPOg4rSk4ugbaTxNT3FAyPnMtzpy1xXFtq+1mrdI7XWmGoXuSynAwU7UGLj?=
 =?us-ascii?Q?IzzQZInqmMuEI2PQzPpb1a+5UJZdlpEOrZNZ0WWBabUaB5e3cWx398LZmrNI?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db57548-5c61-47f3-af6f-08dca02973e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 15:11:48.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o96M1+oMS8OC0XISXGkuHcq/Phpen+ibFYrAaZO8jWgYF4RtvKXFmCadmvpz/QqVYdQuT2Ago5k8FRAx/RJJ/e5afWYYn44/ac9xuYFXxRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
X-OriginatorOrg: intel.com
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

On Tue, Jul 09, 2024 at 12:28:43AM GMT, Matthew Brost wrote:
>On Mon, Jul 08, 2024 at 04:26:00PM -0700, Umesh Nerlige Ramappa wrote:
>> On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
>> > On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
>> > > Add ref counting for xe_file.
>> > >
>> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > ---
>> > > drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>> > > drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>> > > drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>> > > 3 files changed, 20 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > index babb697652d5..e6eacf1bcce0 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>> > > 	spin_unlock(&xe->clients.lock);
>> > >
>> > > 	file->driver_priv = xef;
>> > > +	kref_init(&xef->refcount);
>> > > +
>> > > 	return 0;
>> > > }
>> > >
>> > > -static void xe_file_destroy(struct xe_file *xef)
>> > > +void xe_file_destroy(struct kref *ref)
>> >
>> > why do you export this?  I don't think anybody should be calling
>> > xe_file_destroy() directly and this function being executed should only
>> > be the outcome of kref being 0. Also, if it's exported, it shouldn't
>> > really have struct kref as argument, but rather a struct xe_file
>> >
>> >
>> > > {
>> > > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>> > > 	struct xe_device *xe = xef->xe;
>> > > 	struct xe_vm *vm;
>> > > 	unsigned long idx;
>> > > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> > > 		xe_exec_queue_put(q);
>> > > 	}
>> > >
>> > > -	xe_file_destroy(xef);
>> > > +	xe_file_put(xef);
>> > > }
>> > >
>> > > static const struct drm_ioctl_desc xe_ioctls[] = {
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > > index bb07f5669dbb..2a8b370b1fda 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>> > > }
>> > >
>> > > void xe_device_declare_wedged(struct xe_device *xe);
>> > > +void xe_file_destroy(struct kref *ref);
>> > > +
>> > > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
>> > > +{
>> > > +	kref_get(&xef->refcount);
>> > > +	return xef;
>> > > +}
>> > > +
>> > > +static inline void xe_file_put(struct xe_file *xef)
>> >
>> > I think if you just make this non-inline, passing file_destroy and
>> > leave it in the same place, it should work.
>>
>> the put is called from xe_exec_queue.c and xe_vm.c also, so passing the
>> destroy may not work.
>>
>> Based on the patterns below, xe_file_put/xe_file_get will need to be moved
>> to xe_device.c and then exported. It looks cleaner, hoping that'w what you
>> mean.
>>
>> In xe_device.h:
>>
>> void xe_file_put(struct xe_file *xef);
>> struct xe_file *xe_file_get(struct xe_file *xef);

yes

>>
>
>My opinion is the way you have it is correct.
>
>Most of Xe is coded this way...
>
>mbrost@lstrano-desk:xe$ grep _get\( *.h | grep inline
>xe_bo.h:static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>xe_device.h:static inline struct xe_file *xe_file_get(struct xe_file *xef)
>xe_exec_queue.h:static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
>xe_lrc.h:static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>xe_sched_job.h:static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
>xe_vm.h:static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>
>I'm kinda confused by what Lucas is suggesting.

just don't make xe_file_destroy() non-static, which would basically
ignore the refcounting. xe_file_destroy() should rather be local to the
.c implementing xe_file_put().


Lucas De Marchi
