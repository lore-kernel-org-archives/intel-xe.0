Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEFDC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8EA10E0F3;
	Tue, 19 Dec 2023 16:26:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC210E0F3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703003180; x=1734539180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xuXZYIKwq3mdbm8x2kCFa/5s0l3sRKYy7pqgJBPlh6E=;
 b=Y2JNX7gd5tLv4+4Cz7rXVnVC2Czz2EN4w9BRlWu+IBmBAnzu8dyGMTZO
 b0O00rWgyl1Kc7G8sRyMxDDRGymUeeqrxYvAK++ZFxoe3GvqOijlZQhT2
 7JNbbIqP8wt10c/VRbmbMp2J2r5EvNa6QqCvQAl6YrRjyhVBBqmRQ+Ufa
 k/IYdKwvi9Ari4Vcb2PtNk0XPec5pdkqf7BluxxM0UVMGbkU9O5PDjmvn
 cNOgfP2JeeTCOcYr6ln9Ls0xJFiOoIWvCJxLooB2sRfZW+fmsXY9d2Kim
 l05PqS7H/I9LIWrfPX9VCV0WrsCZbXBsXuUuzIGOBQIsAch7m3cSfr4sG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9057140"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9057140"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866690064"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="866690064"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 08:26:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:26:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 08:26:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 08:26:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gClOdfOUAks5OJ46Y0WK09a7dZJCFGsyiF2SI6OdEP1+GXOpMlHJX7KcDKWh1fR27yRJtM19crckrgmbSRzScH8VKwytQSmUNXcQoWKexBdKW7Cp35hAdghoXoGLMNll6m+0a2GNS+qs7e8wi2y/vywLndhvNVq8FJarrlZAFQYOZkrhYDPwIK3RBiZFoNzh2JzUTWhXZfPY17uwo6rkG5RFDaGsgVlPPA1c/niNWzLlX0idnO+6D4N4Dc0DfsbM276oId2Fl8GtASKfKe3xc97XiRYEeI1iAEnujYBgTapvs6ia0Bh4qcifIeA7uIYBvw8EeVnpi8xAQKZNR0pDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVoSvj9yRjBl2imbhdU/RJneouRPT/6/Bm27f7BAGHA=;
 b=PXScjTZ2dqijCDoOw5QO4iM44bCrKq4RgF/I+rhlFdw+q8fPtwMhnPB6zGhXp270RPT7uUwcwYSob/d7hT4Gfw1Wo6G3QryJhVGDOKB3fRgsS9907K4sFHt+kF2eDCoDUmkxkmEUq4g1A5glkDF66kzGKZtPsiFYb/VPpNR+VhRJXZiQzY3G8B1/73Nf57sj+TMwyXiBT9FD22Y8c59hoEaVjyeibQ3otly2rokIIm5H4DpXX5K6S5sGKQgoZrP42kpMuGqk4uSz1ab5Evdyt5bAaT/4lwSP7yOnbblp3G8s+3ySP/DTdS6vMo8bsLn+D3hf3GNMcOSQMMWvXjO+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:26:14 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 16:26:14 +0000
Date: Tue, 19 Dec 2023 08:26:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZYHEHDMRyNW9et5o@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-8-ashutosh.dixit@intel.com>
 <875y0uvqvm.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <875y0uvqvm.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 50db54ae-1320-43b4-09a4-08dc00af382e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/tjUIxOMRliqnJywzHMN7UOep2VxPZO8NH7zTMxZUpcfcQQqTHevmeEH1nZL1Uw9KPfiNi3TtRikXzl3kjQoFoQKJ8vyTyc+O0w3YO1RV5dHtcp8Gxkz8Sfay3LBSGBGXWyznOJPkjpqz2i7LELV4m9S9xs6Ls3dw4ELEEVG336aKYW2lxjkNyB8AamUbwK2fcqLHtoG03LBvSH8UDSIE/XvN6b5p9B9Uf3wcbNSr5DjAPxFSqH/xsgbKhdm14U3OP03kTabR55eD3++dnSORXN0uyYJquev/AeSk9CDxL6QZlP3R6IyuAlBmJ4k2qu0iccBjtRpUONEWgUZt07QWhoVQaQpKA3GvZuRNs/CiNkvemZUVwRefFWF65EFsOFSEiiuwn7u/wlP2nBq6tWE0BympFkMwax2R87jXERPpnPeBTWvLp9olLy6ZGYy8rDxkkfpVMTjkqZ3VBCZeabDsAxVyDICQdmpvvuM1jVRj/Dcx4Ab1tdbWvWEme3lfKhtpGfhcnG6dghjlEfxGJ7lKa+uKTMAgPYkNk4Y+B+dXP5M7moF6wEpa6XPib3VpGF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(33716001)(8936002)(38100700002)(5660300002)(6862004)(2906002)(4326008)(8676002)(6666004)(6512007)(9686003)(6636002)(66556008)(83380400001)(316002)(66946007)(66476007)(6486002)(54906003)(41300700001)(82960400001)(26005)(86362001)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnROdVVRV2MyNnNuekZKcDBPNGRFU2pGQ05Oc09XckpwYUVCWUdZc1Rpc1hl?=
 =?utf-8?B?cjh4N1dlcytnVjBycmtyNnlnNnJmTXVPZTF5WlU5VU0wcEdFU0FCTG1xVkJD?=
 =?utf-8?B?aFlabjlWOUFCanJORER3a0lOL1dSSlh1b2FKNloxbEhEMnVMVWp3NHAxTllD?=
 =?utf-8?B?NFlzOEliUlpkbUg2bTRwd3k1c09rS0syU2FJZjVQM0lYeGNMSFU5QzZkLzZn?=
 =?utf-8?B?Y2x3T0QxdGQ0aXlXak1Ea2RIVmZhdkRvMXRHeVp3QnVSNUNWcThvYXU1TEVi?=
 =?utf-8?B?WXJDUjRkSk1oZm1OQi9IVGRoNWJnbTNjZEFaaDFkSnQwRlV1QnF6OUNXUUhy?=
 =?utf-8?B?ZWhQSENKRHd2Z3BMaFdyNnllRWk4TG90VVpNS3R5elVFZFhjLzNDN0RsQXZJ?=
 =?utf-8?B?aDBFUTFmc2tnZlZ4Z0tNem84U2R4WXY2cFFramJYcGNJMGU1bzQ1eFlLR1lN?=
 =?utf-8?B?VWx4NEVXZHFwMSt1T0JnOVp2eXIzbnBkRU9jY0poUFNMaDlTWnFuV3ZmVEpr?=
 =?utf-8?B?NUpzZmFVNHcxUks5VjJjNGcwNVc4QytnaXpucEdXTUd3djdVeTFXVmdxMjBl?=
 =?utf-8?B?VlByNGt3Y1M0MUtsbUNMeDFieTlwWktOU3laTXZXWFdpZjNZSG9kazEvTngx?=
 =?utf-8?B?V1dFVWU3aFgrZVhuZzlrdldvbGtQV1ltZDJhY1h0akMyWGQ4dTlLc2xQVGtj?=
 =?utf-8?B?ZFliUFlTSHpmQmNsRHFNL0NqYm56MUZFYmxQNllwUFJLb0Znai9MNnA2aHhT?=
 =?utf-8?B?MXJVTDdBc2tEMWJRMytsVlVuK3NGdllja053SGJ5Y0JBZWJQQWZaVzVJQ2Iz?=
 =?utf-8?B?RWFxdXNMemFkblV3SUhENHpLM1hKeGs3b05nZEl4TDJETm00MDFVZ2J4Nm5M?=
 =?utf-8?B?Q1l0QndPSE1qWmZ1d3FTbWZ0T0FyZWJIK3FCL0U4dE9MWnowSVlOaHRXQ2lR?=
 =?utf-8?B?aGlLUk5MRnhKKzBRU2pqV0NaNWdKcGNRL1hVYnMwVkpKaDZFUkY4VzBLeUNk?=
 =?utf-8?B?U1JzRVlMU3NGbWRYRVdGbnhRdGFBKzV3UkNONkoya04rZ3BGZXZQbG5OcG9l?=
 =?utf-8?B?UjZlTnV4ZEdGanNFK3JDMlV6aStUa2FjcmsrUGI2UGxiNUx6R2tnWWthT3k0?=
 =?utf-8?B?NnRURXpYTEh3eFEzL0d2Qjd4Rmw2bTRrZGk1U3RORE1yaWVRcjRBWXFWMzEy?=
 =?utf-8?B?U0FKbGFkNzVQSzZYeitUZGhoZE84c2xiLzhBWjVYVCt6emRxdERyUUhrZjFT?=
 =?utf-8?B?RHk3b3drUGlJM2FHUDBlc3VTaW1iZWVxNHhwOEtoajBJVmdsT0pYazlRY0Fu?=
 =?utf-8?B?UVovazh2Sit2T3hVVkFlR2o4cFFjZVlHdHpoNUppMVZHcTdTcEQrbWU1MkUv?=
 =?utf-8?B?anUrTDBWczVlaUsxbDc3d2I2ZW9mREZnL2o0UXgzcFdoQlpzRFlTZkNLSUZs?=
 =?utf-8?B?RDd6eDBzMlV3azAzdmtjNFpORjdRWCtBZHdIS0R0cko2dkdqUVFYV2Y0UjVH?=
 =?utf-8?B?d2MySTVKRzdyUXFmcUVscmRhZEJJY2NGV053M0hjMm5zTnRZV3cxRDROUk5K?=
 =?utf-8?B?aDU0UVpqaGdBZU1od2JqM3lEazFHNWdndmFqSUwvdGJtbWE1NkZZM01sTzNp?=
 =?utf-8?B?a3NYbHFwcEFNbFBqRTZnZTFlamxaTC96bmdQaGxyRmpHTXdzei9tRlVXSWQx?=
 =?utf-8?B?RnpaNXJidSsweWdMSW1FRG5wN1BNV3BQb3hwZTYvN1NvNWVYWFJmTU1UUGxI?=
 =?utf-8?B?UWxaMzR0cUJLVjlVMVVaSi95SkphTzA3czkrUUl1MGdqeDN4ZFlvUUVBQnFK?=
 =?utf-8?B?a1YwVDZ5SldIQ29RQkc3K1QxdVA0Z2NURzNRK0NmNEMwWlhlS214cEZDdGZH?=
 =?utf-8?B?d3lyeDVFSE1zNDBJV1pOaW9TUmROanB6ZTJURUJvYkV0bGhCMTlTc2dxZ2x5?=
 =?utf-8?B?dk5qemx0aUV1S3Z6cW9BQUlRQkhkeWFtcThFRXMyTUFma0lYek4xZ0F0V0hW?=
 =?utf-8?B?YjVZM1lVNVUrV2J5WFhWcktmMkVwOWFQeU9qY3BEUE5Yb3dEMWNrbzdhU0lz?=
 =?utf-8?B?MFV0ZzJJcjJuc2JmZ2x3ZFhuV3h4ZDQ1dWY1b09tTjZsazRQb2EweGVQellX?=
 =?utf-8?B?RGJURXg2SUtFRFNrWS9SWFRpSkQ0QlVMZFV6dnVLT01nWEwvWTR1cWh6aTFP?=
 =?utf-8?Q?8xtEFgNNq34DD4KtR1Zcij0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50db54ae-1320-43b4-09a4-08dc00af382e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:26:14.3498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOpKRPMPEJee4Ch4J/sdhOmy1fpnFn31Vt/wd5cwDtE5bj69K/iGyHB0CdwIwVFG0v9kBCqclD8+uMbhJkiibywydx28kkmqGiUNLyuqOFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, gzadicario@habana.ai,
 intel-xe@lists.freedesktop.org, Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 06:59:57PM -0800, Dixit, Ashutosh wrote:
>On Thu, 07 Dec 2023 22:43:19 -0800, Ashutosh Dixit wrote:
>>
>> +	/**
>> +	 * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
>> +	 * directly applied to returned OA fd. DISABLED opens the OA stream in a
>> +	 * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>> +	 */
>> +	DRM_XE_OA_PROPERTY_OPEN_FLAGS,
>> +#define DRM_XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>> +#define DRM_XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
>> +#define DRM_XE_OA_FLAG_DISABLED		(1 << 2)
>
>I am wondering why these flags should be part of this uapi:
>
>* O_CLOEXEC and O_NONBLOCK can be set on the returned stream fd using fcntl
>  (see man 2 fcntl)

I think the O_CLOEXEC was used so that a fork doesn't carry over the fd 
to the child. For the OA use case, we want to prevent that.  However, 
these flags don't really need to be passed separately. They can be flags 
in the stream open property.

Umesh

>* DRM_XE_OA_FLAG_DISABLED can just be a stream open property, doesn't 
>need
>  to be a fd flag.
>
>Comments?


>
>Thanks.
>--
>Ashutosh
