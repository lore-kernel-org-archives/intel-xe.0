Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6147C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 21:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581F010E21A;
	Wed, 19 Apr 2023 21:24:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6710E21A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681939474; x=1713475474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bEXi7Y3yS1ZobbYBfLmECk+XifEh4MAn7Mr+CcwfDDg=;
 b=AZEsIIZ4M7USUHOz9OMglsdqK757HzVja8Z47ENLGEzSR1bxbe1wXifS
 jZ30KEoSpnbRgNXDAkhHOPUda2EuIlv0eMR9pgbnk0xCbZ9bhVm2+q0W+
 mYjq5vwjL2A0XVsEoD3EUK6hQkN5m+I2RGbLUvbU5n1frGr/8YBNYcX+E
 +/T6s4cLHvsLsHLahEDx3QueSBLUNs3NowWU04pj0pxrvTFRQAedrAxQR
 uF8bkLP8KTwQwD4W3pznggxCQXFQpBjCP3MOEScI1VjEG29qUMw89UuGU
 umt02x4Ec5eJqWBOZzMvLOxXlx4GpreFtkeo1yOfvzv7tGatfXYUy+cCf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347421292"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347421292"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815757793"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="815757793"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 14:24:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 14:24:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 14:24:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 14:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2mj6edLIPyh1ukXVjJfJrNoEBTT7XFUQiU9iT9GWlEz38fu2SyGcUUiQpcYApiBq6XlY9Jq+xNsGJEPPAydbyVoNZB5qT33/m3tPKCvbcALNpax3dN4XMXFb13HdiNy5VOV+Y/yX5k02oDD2L8coJEx1kFh9dTnD70SXhDSVMrw92wbZrqvXoWBaKTaK5cd1iK/KDQE1Ed0/jFYt8KgKwkk2Ti7+jSf4TORDCrMUBPlrIsBBg7d2eB5pSOQN7eFY0C8cf3m9WIhnqyysrNlTLRXFjB4LDg3iUURIk0KkuuEZWLjH86MhR+lm+b8pu3QGBglinhbhOBI6ah/kk6PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH+rQfyWlt+WkBcxzf4IjpadBFeDUudZdc854qJOvpY=;
 b=BLtbZutdm3wHVl4yZ+UD+FmGeo/Q/j4m4QvErydRR6LdFTmYM+D/NSqhmF2M1Pc/3ormW51eYNVXV89Ne4Vp1DGKiV0GuWU1Ms9IS6T6K7f5wv9xcZ6VV2z4M9093pWCJ2PjtGuYrujAdHLfz2t5MLrFM4b/MNn5BNkjSm6Ziqerp7xLGxaiJ1ibf3r17o+ewtLZKm4v8+Kh8aa6UrowkjjZSKxUl0tp3vxCUacng1MF1lwlSodEPDfWh0bEoqzVoopLfysDfW9PlQqAFpdhza31v8IaR480lrc6gQKRvilU36pnKQdUIPSAjTKjE6cQpSoWJlyVpmAW22CI8GpxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 21:24:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 21:24:31 +0000
Date: Wed, 19 Apr 2023 14:24:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <pyrnhophbtmz4wh6wjcch3rqb3qelqpmlagi43annzkwfjy5nj@c3x3yo32rllu>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <87y1mnwt2i.fsf@intel.com>
 <20230419201359.GW4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419201359.GW4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 32069dfa-1f67-45a1-177b-08db411c76f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ayhI3sL1Ml0y+hvSsehcPRm0dJVQvRgVwGzPzuqgDpvwcxcunA2bSdDND4BQMtZ6mnVayftzJFa1au2lI1WaCjtnBfURSC709viBe4N5oJNIQ0ZfVoQzV+koI12BomleNNE0AT65fA0MqRl/NEdjzqHihw6q9d5AIMX3z2cspYReQjd4qe3FSkXm4mS2fwMkct7JpTgS6XSpGPzP1JuxhOeTp7PgdAjQ/vl/3I+y6a9Y0BLOzftuqqtq8n7DA5QHnuAEd20WLGcdpZphJImkrKD0voz9rzY79upB98qd37zS9KtuBIfI3G87LGZt2rvWX4yd7Oz823gEa28PrxPOWsnql2L90LlwjCRu4g19qaXzsjOEGuSimpujePlYxOkF+nupySMDn3NoVxiT2Gz6AZF9zQavcSrtWP/wuPiEV03rYLFBM5hSVTfNOwoQHkBgsp04wPngABWvM5YgCMiIdy5nhsbkEkC4gD0P0mI40XmCiLMkGCwPzwFMP7yPW5n5p01hltSoHciMvluw7c2jwLPW7e78Vwv/ij6dcqvXtoOA2pn75Hm2I63VvGznEKUB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199021)(186003)(6506007)(9686003)(6512007)(26005)(6486002)(5660300002)(41300700001)(4326008)(2906002)(316002)(66556008)(66476007)(6636002)(66946007)(8676002)(8936002)(54906003)(82960400001)(478600001)(6862004)(38100700002)(86362001)(33716001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4eMp9jiljM3FQQS71+1exH9N40zJs4TgBbnFkCzGs+92GneruWnJUnsfB7H0?=
 =?us-ascii?Q?ckPxsQcEJvvIfJhYCoekAvHOqBdGLYJPtgJsZYvaom4ZmPEEEi9ZmVx3WXvG?=
 =?us-ascii?Q?J1K7F3HD3RnIpg/EfjZSWPcv4RGtxxNTjaUsvi4NJcDgWVtSukXlH25ZECc4?=
 =?us-ascii?Q?VizypuSuQKROELRByH65y+OqDMIbXi/GkztB8QYp3rw+b3+8IW5woJXO/bku?=
 =?us-ascii?Q?MK/C+C0YhfP1AMU01WMWkDoZTOIn4/ty6k+JwfkWy4qS4q+EmXgz1uqC2Azk?=
 =?us-ascii?Q?GWUT1Oe+qF5Dd1YZaxd1DtMrhf9o4VjgY/Hxu7E4DkU9mYQgCsCf6ISE3YGy?=
 =?us-ascii?Q?5oEIrVHEicghh9/fRCoWo6l5VI89p8jY1uwmY45N/W9MpqNaIEvEKZmF15bi?=
 =?us-ascii?Q?540LFc7Iv5yGH2ASOowIQBDk285Rt37h3KZ8pvjhOeLQn7BIE/R8zr94THAz?=
 =?us-ascii?Q?JMjzJG/fLJhbytjpEVzBmqDyFpdnks9kjSuILgum9pbtcxzyDS9z2DVvMMVS?=
 =?us-ascii?Q?N+wE4jZy0R+jVMSY7QPMUaGTR8GIrlmjNgZU1xQFE841hDv2erw77ua+ily0?=
 =?us-ascii?Q?ZeHKXEVfaShwbLmTjAI2rwSCZZGJaF6oooSKc5qAfsoOBVOQWsUzh1OQl6L2?=
 =?us-ascii?Q?46Wp3xdLNtAkUh2llF4jFfNHEJPBA7Jb3n0dogUK9FxGU5vxRrLMytfN2eii?=
 =?us-ascii?Q?C90PLzaStcxyl9hn81g/xiPBMNgkwNCv6gczkXYDKh+yFmM86lpOTT2Gt/A7?=
 =?us-ascii?Q?M0qJHKBwOpFnGqal+YalbV1ZbsK8so9scEQ6QymJv8gMJM7Pv/icKS+MrlPg?=
 =?us-ascii?Q?+KosTbasuYx9azNwbdOwkQBagPv18BtM6PWAVhx1f2kfJso12qUnhXlCCSoU?=
 =?us-ascii?Q?j7gq8J25DQnKCpZMRNxfIp4S6m9OmvdXCex3q4PNOu91VR+fwD/9iYf4M9oG?=
 =?us-ascii?Q?qRC9UClubHkxgmCvp9VLmtr1OU1W3PpAgnVo7UxC03fV7TIkkqDeZWljfbCL?=
 =?us-ascii?Q?YYFp+l66U1vGqKDVYHX2rhT3ktTXNXePyFK1dBwxF/JBVPmYnOCLjjwkWiUN?=
 =?us-ascii?Q?abo84+hmvHBL/HEjRDDwRmFmwE562uLkCzJUAKeWgzpLCvsHZbfrnV977QrE?=
 =?us-ascii?Q?maLd8W97YUhqOYd+twMCn1z5TYwsmUt/ORBLRn+P9lGKcLaxOpbhY0LMeD0j?=
 =?us-ascii?Q?xv++5cdu+TCmzqFrwMyDcyl5YZB+EDb9lBAJV+/DPC7F+eRbMqld0spsINZS?=
 =?us-ascii?Q?Dza1AtKjuEXaNvKGVwSijBSRfr1BNJXQaNMcQjnX9vdC359ZJzV5H8AVqmAA?=
 =?us-ascii?Q?SuKS8nh+r/EXXm/k+9hOgGh3VjYxWAbbgQK6G8b8Rg7bE3B17MiYYdwqW+ei?=
 =?us-ascii?Q?KaMeVBAK2CuLz0eOseRf2vPDFCKPbghXlSLaTHrj1EEBZPl2gP7hI1Kzk8ri?=
 =?us-ascii?Q?2oubtZWHrRO0LmOYXRFCYnxoX5mX980XPQBRbcmorQob90Nj6RZDwKV6To5j?=
 =?us-ascii?Q?oiBSb+ePzCm/KySxuUbCQcX0vmuAL+7GJxz97jIlIRdwaelROIvIpTGOD5Qy?=
 =?us-ascii?Q?81ESNNy2VUfX8vqFP3N00p12DKQP7LFLUEWdLTHn5BnXx3gpyTsZp2UG7l+r?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32069dfa-1f67-45a1-177b-08db411c76f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:24:31.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAiQNLrTv2xNmx6oj+XsdDsvPi2re/lJlK1EjzhEjryN2RB34Wc4ps7LykPdIFMFor5b7fKsi7JU4P9h8oOt4zwJiFm8LW9jGM3ov/pEgh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 01:13:59PM -0700, Matt Roper wrote:
>On Wed, Apr 19, 2023 at 10:49:41PM +0300, Jani Nikula wrote:
>> On Wed, 19 Apr 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
>> > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>> >> Stop using i915 types for register our own xe_reg_t. Differently from
>> >> i915, this will keep under this will keep under the register definition
>> >> the knowledge for the different types of registers. For now, the "flags"
>> >> are mcr and masked, although only the former is being used.
>> >>
>> >> Most of the driver is agnostic to the register differences. Convert the
>> >> few places that care about that, namely xe_gt_mcr.c, to take the generic
>> >> type and warn if the wrong register is used.
>> >
>> > The disadvantage of this approach is that we don't get the nice
>> > type-checking that we have in i915 to catch register misuse at build
>> > time.  Instead we wind up with a bunch of run-time checks that only tell
>> > you that you used the wrong register semantics after the fact.  Wouldn't
>> > it be better to keep the strict types and let the compiler find mistakes
>> > for us at build time?
>> >
>> > The only real problem with using strict types is that there are a few
>> > places where the driver is just trying to refer to registers/offsets
>> > without actually accessing them (e.g., whitelists, OA register groups,
>> > etc.) and the strict typing makes it harder to provide a heterogeneous
>> > list of those registers.  But I still feel the benefits of compile-time
>> > checking outweighs the extra complexity we wind up with in a handful of
>> > places.
>>
>> The history of i915_reg_t is that there were subtle bugs where the
>> arguments to the register write call were accidentally swapped, they
>> went unnoticed, and needed lengthy debugging to finally figure out.
>>
>> This can happen with xe_mmio_write32().
>>
>> Strong typing for i915_reg_t has positive score 9 on Rusty's API Design
>> Manifesto [1].
>
>Exactly.  That's why I think we should stick with the strong typing for
>MCR vs non-MCR as well, rather than just adding a bunch of runtime
>assertions.  It sounds like the proposal here would only earn a score of
>5 by that website's metrics, whereas we have a 9 in i915.

I'd say it's a "false 9" for i915: I detailed in the other thread how we
trigger bugs with the false impression of safety.  For the bugs I fixed
regarding the misuse of MCR had nothing to to with the type: it was
either because register was declared wrongly or the runtime check showed
up. Examples (git log --grep MCR --author=lucas.demarchi@intel.com to
get some):

	abac0c5d9e0cbb7acad3affbf3a1ec00b4bb1a58
	2bb891af095ef287aee454bef930d75565361fea
	6a8b2e4984f73f8d00c8c16b87a8b115d34088e4

With the masked vs non-masked in i915 we get a straight 3(?) or 2(?). Not
sure documentation and spec stand for the same thing there.

Lucas De Marchi
