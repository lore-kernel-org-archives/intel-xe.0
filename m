Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4EC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 13:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467910E034;
	Tue, 25 Apr 2023 13:17:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137FA10E27D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682428631; x=1713964631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+SrSRqfXp0tOfhpjTc2Wc6uOden5ajGkVA99JICuzrk=;
 b=elMPpOWAIY2mMBm6Wlb9TaNE2YToQlYtV5ayjwB0SakjoW8QGaSem2OB
 RS7B+xp85iD8G9LqtD/o7abx4hVyk4lfUACc4V5klqTqXeOeHtWu9pHvo
 XHVM+4BhPrBvdzQmT4uUl/Tnr0DDwp6lugRaKxCeSz9mzjDBmRLunhkj4
 vRjy3IEWocO2Zef7gP1A/9t1q5WVm6H/Vx1AGXexLYmOE7MZn+B2SD7NP
 ESuuXwwr6GRDBnq4V+OUbqeWoXjt9v8L/RTUsap+4R0nZOwxlXwpOEuvn
 RJCUqcnqJVnjeZ2iYxNgtxWOgmtFqeJquffKdKJNEHQRNxghpzo8Lgw57 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412051872"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="412051872"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 06:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="867877395"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="867877395"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 25 Apr 2023 06:17:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 06:17:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 06:17:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 06:17:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDx9lcbvnSqgdncY+9gJe/gydqRJ7qCdHCmfurjilX9L3WA5YAT4iab7ynLKze2QlrXh0912YKIrK/whX2Fk4tF5DD80Tp5WgVL16v+1eNF88/Fc3OnCiuvvHtwYJMIihNAt/PCgFj4uNc6aWmKZjRNIL5J/SvJuSDRxpQdQAiHBj6RFiRSXM58GmM4SLoCBt/TvGbd3+GlphNYo/URkG7RqDsPFJYHKAruKAqWbUPhqg0n6yjQIygciZD+dj1LB1d6t0XWg08TyrOCtrwYfWqj4CWv5f9uVxVjnBpejxI1SLdrdjlKytcyvJqxkmBMKb0ww0xY4lg/HHU+h6Yqtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0pCVLyktDCuw4LLFySt8o8s4PjtA2I2Zre86cjODCs=;
 b=CTnBDTKQb5qe4lunSXWGKPih01hLIebDBVKwTwIUonimt1+UnPaDbJfSG1448NpKjRg5Ms2ma1Tm70xULPf505qGyWxV9XWrfkPzpDIZr53FHxwaLc3JEq7L/8QuwJIPwZoNwghAQFy7/wJ6z4pOVXbxZhYW40MklQtSREwBzXBwZhQPLBBc8OgdZ78FkRcif5vyaMc7JTMrlSHj0u0DX51ICYoIaKhKjQ31vyvHdYRs8Ugs73vHNwsli01HJBszFfkdlwhYzA7LFaI+Fwh765f2xOsFXH7qQo/Y5ZqzcaWaG3vVLEQxlkRziQ3mUcxEXg6fb1cmTv2OWVZ1tqFDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 13:17:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 13:17:07 +0000
Date: Tue, 25 Apr 2023 06:17:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <fk47pjv5rnfsnxac4goeqhwlolffa3wnsyejjn23b2ji2ud6ma@llik644c37ma>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
 <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f3b1b5-bdfa-4657-d315-08db458f5ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FW/6nn+K8Pvu4Msnhft2ZxvrJGJ8RJeRPrE9dCh7H2ZDaLm+swNKxqKnCkklEfyFaxhyZQQJb9StLCRpPZAgS41CgVpMOlqdN+kaEItRMlBssVxXe4kNzITyvQodBPTYNm15ZS6EBB4jSg0yQwcOzVBPNPrf5J0HDNJiOzFftf31dk/T2Qx9Ak3M3a/w2YPyFOI+2gru4eyqE/mDNpmKgyXMzFDwe+Hj4AxE11cZg52p8s+JlgXO66AHxqHU5X+AotrkABODPvKU6e2eOh8PbQSRBwWIZTGXE8L4D34CYkNo+/3x+jXI43NORR9whuicDszDBNhMilRLGhH+u7C3FY4oGIw50RElsubo6tWIEA9ljhsDAWcCDdD1RQORyDqnYMKk47W66cb1LmNggB5H8AZJO4vsub1wAlIC2uXvUwSDzLKDe/OpbjcXKraVWSlmQFzTPcGn3PfY/v8Rt9sI7eCVSGh06zMg49qVIXX7R2N2Xhv+KL6rf9IFGe3tlAAGPAbsKVV2pIz4dwd7kADLLpXrT70W5O/XPfdbKorWJOcy3rjt2zhUmRS9qqvxxfb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(9686003)(186003)(6512007)(6506007)(26005)(316002)(66476007)(66556008)(82960400001)(4326008)(5660300002)(107886003)(66946007)(6486002)(83380400001)(6636002)(54906003)(8676002)(8936002)(6862004)(2906002)(33716001)(86362001)(478600001)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sj/8jpR4h/kUMYZQKs/ydcXkbbvQ7B8+NcFrygJOpKTmYLufl9tQ8TvMJmTP?=
 =?us-ascii?Q?o/SQSORmT0yYWgveVq1pLIP5eAVw0u+OJTECTZAn9AjaVCayKREpPnphnLKr?=
 =?us-ascii?Q?OuNm4VtMdSxVgVAFwsAGCrrb+LxB84yXUgyE7buVSQcFSqxCxM28nTfk+9B+?=
 =?us-ascii?Q?krPO9REASjeMtQheWdR4RVLnNo4PqhGy51sP2Czo25LKfpLI1B0jjRy63+gO?=
 =?us-ascii?Q?/OiCFEYNfr/qWfsGst6ZHvBFei4/4ux/RkrWMXSnYNqfHpa7iFnBBe2vnoS/?=
 =?us-ascii?Q?NxnmK0DVA602esJODzjze1fQaBp/4Z8Mcs0jz4/9NHUpPBS5y0DxDMOVKZYi?=
 =?us-ascii?Q?mqWP06GevgvLktttqFX0YpUEQ8xcobssqqAeoNFQcfcOfOd8tkFy6+myNm1N?=
 =?us-ascii?Q?2U20zOqSSa4k02uS677uE5my97ZKT4MenN1UiJ4peb0PLciWsDlw+seWm60k?=
 =?us-ascii?Q?fPT3ybLAB4amC6AyCBgefhHYY4HPxPZHTs9yLfB24esME4MSMpRV8kh3Fdde?=
 =?us-ascii?Q?pOw1cyHYZLxw9jTj5KDdq463B05YAO38NiG5wI2K8+PBiDGaecptdUrn6JUh?=
 =?us-ascii?Q?aPY0CRFefS8+l6O7L+6UFUPfzQD8rcO3HVqwhjs5E/EHkbt5N1ntg2+yZoU4?=
 =?us-ascii?Q?6vI+hkOeG6hN9xVsxZyMfdBGbTSc5CrpthQIGccj/wELf5XYCEaNrrn+1+yp?=
 =?us-ascii?Q?fFLnV5apw4du5AOrFXHi9x2YSDWx6jiA58YyFIeOWnAXyvTrZ+NF2dioeG4L?=
 =?us-ascii?Q?f+aqL73wzOH+bSdHZpwq7XoPcs8a2gc/s/Vqqzfqgn1dpRUdx3c02UAoFzYP?=
 =?us-ascii?Q?6JMJT3wWQ+ocQMVhsU5iDqV9y706nfuPJ/sqqtZkqBdOd81yWwseMWgg/JTI?=
 =?us-ascii?Q?zdBhHV/xK0nuuonKDST/KNOgO3yiAoYoWyxGlpBQcJGGKEOvM3vfg5a/VjkI?=
 =?us-ascii?Q?NdyKRiZl9jbuev2F0YKIVq/Uk0yN1O4Bicuv4HJGLZFQwS66LpHpnWVXfbXz?=
 =?us-ascii?Q?pWVFH3tgtdNQjpga7EAuZ3mS3HohROjTiUowWShccpKZqRnz6/EEQPp4cUas?=
 =?us-ascii?Q?AnwA9xUTYyiQnpNPQcCPxyhhNwnlNCag2QNfZ0NHBVl39weRuAPeNroMfrtX?=
 =?us-ascii?Q?qI/SZg73Pt6rj4blrzhxYOFTmWUAUnzJ+b62b/PmzylXAPWet7q8TnEFMgzE?=
 =?us-ascii?Q?JoqF2shYzp2rlI/eWoOtxFa4Uo0pamz76oDxKwl3cUBskXY9gglnk7fUjqwT?=
 =?us-ascii?Q?LmXun46LmJvrauYU/7Ml9sihQfmaQNz6rKpnc5TVcQNUDfwjvUgH6GgCEbAY?=
 =?us-ascii?Q?eiy3n6WufNK7nileld+FnR4lrKnx1CW3D+aGrLHMlrzz1/pE1N1vFnuIKTqq?=
 =?us-ascii?Q?d73XN5DbJDvKHUa272YRu/XlAmvFzzpYAamkZmezsw0XRhrLU2BPJ5zJ1U82?=
 =?us-ascii?Q?pYXDWA+FW6J60RQqprywgBSbyk9mjJ3alQU3frixBYTnINRl/OrGzACs0Z/M?=
 =?us-ascii?Q?68FSWpThv7y5wteA4nkTLQAHTUFBb82PLTJ5jOGxfz38Dz71Mx7alXW1BqAi?=
 =?us-ascii?Q?OXd6iwAh4phgEPUmd8elN2t7PflpurhV+rdyj8O2rfKRs8IxPOq5GuKy76y0?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f3b1b5-bdfa-4657-d315-08db458f5ec6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 13:17:07.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eOLnFqsw2LwmjaTQPaA+xzQExJegPtBts/R26gQSpRMRJ6x0o5D6PLqi9F9zL9X7e0lNATjM2ol28GQLlCE8rORaFHmXDh+ux6G2Rgv/nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 01:03:54PM +0200, Michal Wajdeczko wrote:
>
>
>On 22.04.2023 00:32, Lucas De Marchi wrote:
>> The macros for writing the rtp tables have some downsides:
>>
>> 	1) They are fragile, and when making a typo it's hard to know
>> 	   where it's failing for someone not used to them
>> 	2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
>> 	   work because they are defined exactly the same as the ones in
>> 	   kernel.h.
>
>hmm, I wonder why they were defined locally in first place ?
>Can't you always use definitions from kernel.h ?

I didn't want to include kernel.h for the 2 macros it would use
when people are actually trying to reduce the size of kernel.h due to
being kind of what our i915_reg.h became. Also the count args to 12 is
not exactly what we want.

>
>> 	3) They are not compatible with rules/actions with registers
>> 	   passing additional options
>>
>> This new implementation fixes (2) and (3).
>>
>> For (2), prefix everything with "_XE", so there is less chance of
>> clashes. Also, the maximum number of rules and actions is 4, so there is
>> no need to make the helper macros go until 12: reduce that to 5, so if
>> more arguments is passed, the compiler gives an error that there is not
>> definition with _5 suffix.
>
>I'm not convinced that adding local definitions with XE_ prefix that
>mimics functionality already defined in kernel.h is the right way to go

see above

>
>>
>> For (3), change the implementation to concentrate on "pasting a prefix
>> to each argument" rather than the more general "call any macro for each
>> argument". Hopefully this will avoid trying to extending this infra and
>> making it more complex. The new changes to how the arguments are
>> constructed using tuples will allow extending the interface where it's
>> needed: passing additional register fields to allow creating our own
>> xe_reg_t.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>>  1 file changed, 33 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index a3be7c77753a..53650f09efe9 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -22,43 +22,42 @@ struct xe_reg_sr;
>>  /*
>>   * Helper macros - not to be used outside this header.
>>   */
>> -/* This counts to 12. Any more, it will return 13th argument. */
>> -#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
>> -#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
>> +#define _XE_ESC(...) __VA_ARGS__
>> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
>> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>>
>> -#define __CONCAT(a, b) a ## b
>> -#define CONCATENATE(a, b) __CONCAT(a, b)
>> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
>> +#define __XE_CONCAT(a, b) a ## b
>>
>> -#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
>> -#define __CALL_FOR_EACH_2(MACRO_, x, ...)					\
>> -	MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
>> -#define __CALL_FOR_EACH_3(MACRO_, x, ...)					\
>> -	MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
>> -#define __CALL_FOR_EACH_4(MACRO_, x, ...)					\
>> -	MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
>> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
>> +#define __XE_FIRST(x_,...) x_
>> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
>> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>>
>> -#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)					\
>> -	CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
>> -#define CALL_FOR_EACH(MACRO_, x, ...)						\
>> -	_CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x, ##__VA_ARGS__)
>> +#define __XE_PASTE_SEP_COMMA		,
>> +#define __XE_PASTE_SEP_BITWISE_OR		|
>> +#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
>> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
>> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>
>> -#define _XE_RTP_REG(x_)	(x_), XE_RTP_REG_REGULAR
>> -#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
>> +#define _XE_RTP_REG(x_)		(x_), XE_RTP_REG_REGULAR
>> +#define _XE_RTP_MCR_REG(x_)	(x_), XE_RTP_REG_MCR
>>
>>  /*
>>   * Helper macros for concatenating prefix - do not use them directly outside
>>   * this header
>>   */
>> -#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
>> -#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
>> -#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
>> -#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
>> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
>> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
>> +#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
>> +#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
>
>maybe local macros should be defined with full XE_RTP prefix and be
>tailored for your specific RTP usecases:
>
>#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
>#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## _ ## b

these are not to be used throughout the source code. The only difference
I see from this and what I did is the prefix being *XE_RTP_ rather than
*XE_.  Since this is not to be used outside the header, I'm not seeing
much value in make it even longer.

>
>#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_RTP_CONCAT(ACTION, x_)
>#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_RTP_CONCAT(RULE, x_)

this contradicts what you said and following that would make it very
ugly:

#define __XE_RTP_PASTE_XE_RTP_ACTION_(x_)	_XE_RTP_CONCAT(ACTION, x_)
#define __XE_RTP_PASTE_XE_RTP_RULE_(x_)		_XE_RTP_CONCAT(RULE, x_)


Lucas De Marchi

>
>then there will be no complains about overlapping functionality with
>macros from kernel.h
>
>>
>>  /*
>>   * Macros to encode rules to match against platform, IP version, stepping, etc.
>>   * Shouldn't be used directly - see XE_RTP_RULES()
>>   */
>> -
>>  #define _XE_RTP_RULE_PLATFORM(plat__)						\
>>  	{ .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
>>
>> @@ -315,8 +314,8 @@ struct xe_reg_sr;
>>   *		...
>>   *	};
>>   */
>> -#define XE_RTP_ENTRY_FLAG(f1_, ...)						\
>> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
>> +#define XE_RTP_ENTRY_FLAG(...)							\
>> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>>
>>  /**
>>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
>> @@ -338,8 +337,8 @@ struct xe_reg_sr;
>>   *		...
>>   *	};
>>   */
>> -#define XE_RTP_ACTION_FLAG(f1_, ...)						\
>> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
>> +#define XE_RTP_ACTION_FLAG(...)							\
>> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>>
>>  /**
>>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
>> @@ -361,16 +360,15 @@ struct xe_reg_sr;
>>   *		...
>>   *	};
>>   */
>> -#define XE_RTP_RULES(r1, ...)							\
>> -	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
>> +#define XE_RTP_RULES(...)							\
>> +	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
>>  	.rules = (const struct xe_rtp_rule[]) {					\
>> -		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
>> +		__XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))	\
>>  	}
>>
>>  /**
>>   * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
>> - * @a1: Action to take. Last part of XE_RTP_ACTION_*
>> - * @...: Additional rules, defined like @r1
>> + * @...: Actions to be taken
>>   *
>>   * At least one rule is needed and up to 4 are supported. Multiple rules are
>>   * AND'ed together, i.e. all the rules must evaluate to true for the entry to
>> @@ -388,10 +386,10 @@ struct xe_reg_sr;
>>   *		...
>>   *	};
>>   */
>> -#define XE_RTP_ACTIONS(a1, ...)							\
>> -	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
>> +#define XE_RTP_ACTIONS(...)							\
>> +	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
>>  	.actions = (const struct xe_rtp_action[]) {				\
>> -		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
>> +		__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA, (__VA_ARGS__))	\
>>  	}
>>
>>  void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
