Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2568FC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 17:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03B10E4A5;
	Thu,  4 May 2023 17:06:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6931A10E4A5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683219959; x=1714755959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cdEYzjIIoPgsSxJyuIJZAtUk0vfmOVN9/9Iqq4OZ7W8=;
 b=PwieAX0rPlimFj8xs7JgJ6IprzkZw76wYtRBIAWxCxl/6Q1LwIsJXjH6
 wG/bwukiERbYbIHJOM2+zvsyxK67m/EKyJ4cKyMXeNOu+SVUmpLKZLF6w
 OKbIgB4at3+aIRO2rYqH4uY5q98GKCGiRz4grvZ/bT81TMAEOuURBO062
 ytQthGQwlPujE7427W2SRyKxTI1lOArNNU8nIxXd6cXR4caAJTOne2poY
 IFklk+hSc9cKY1tHNKHCYcN9Wvv3alBQc4tKel7p4Cc8TkNToKd4RFE58
 hpm1HSau0GLIvtcRzIyCvcS7Pb8iyEOZzuczrn6eAWEkSd6UlPkxisHSR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333400928"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="333400928"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="766655569"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="766655569"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 10:05:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:05:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:05:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 10:05:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 10:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq5aH3oOLLkOo+cKxUJt577PMG09C8zTNoo/ELBD5xaYG0q2lprN4obXG8GOVpDotLZBdv0PAiCWPZzkXKMiKDxq+fXrP1enRTn++jsmMucYfk03xhV0h3UTTjeRtxnn5VyJbuHEhNqnri2iJ4KSao+PBwXJsAVD41Yf2t21l+QxZYdKPDoVjCtoKtsCV9Kgrbyd/ny0aOwoaplmWjyA9h9kpYXNCs1XY3sptzJun+3PxTlT2xqN5YqJO/GuAcuasrdnxt79vto+wts8JW1J0Q5bRuDgWYLhoJ+vYQQsekZBqrqaDr/4FeeSj9B/5M412dV9M1FP7VOtI3h5hRCBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9A7ft4Cu7kXNTwBgvsr/tFK23K5Cnpl5RXHwVq/wGA=;
 b=IXeJ+lDFb0ANqoQVlDu1ksOtP/kgIKA4fbiXyH54djteF3jTDAnpNPfXP0yhf88y4YmiIBKNmMqY/eEIZXPBPa3U0HdGVetZiBhLBqTuOaGm0anFZj+yg/ESSqiUOGd5wLxjNPrvYum2SyqbPQ3s/6v0FJ5cWMszItx8gsdB6NPCI3pzATTvgsUkHjTtjeC2v6M4vZ2I7/DzFei9hE/8AZPsE0gk1Zdr7YIwR56kXLvLWq45ZxzJ0sI0wmHZGKGlA9Y0+lL0YZdzsBI2w9PQyLg5mBAxU6POxC31dtayNryzPr/aqTJKDIa2ZBUD3m6VesHUgiEYjY4HPDnhL6Ukyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Thu, 4 May
 2023 17:05:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 17:05:55 +0000
Date: Thu, 4 May 2023 10:05:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <d6ujzgfyawrgbyotkawj5fn4px2fowwrabuewmnytgh7chl3qo@7ifcyejukwy5>
X-Patchwork-Hint: comment
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-5-lucas.demarchi@intel.com>
 <ZFPaOtchsqsAINOX@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFPaOtchsqsAINOX@rdvivi-mobl4>
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: ac54d279-a5f0-407d-7ae3-08db4cc1d2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHLWHYvK5ibozQlmtx/9i4oRT3dUYWFhnSfvnhtfr1AI5/ufrQugM8IaKnaU16Zdofkq1t238DK6x+WakzGl4UGZfSMVSCbGnO1ZVIh1zlGvkvsM5yER4FZqWon4DQEEKop0hx08k3gByhtINP+1d11hFwNAibqpQx0uBB44HPcy045E2Mj8MZB0Clv7y7+OOm2Ec5z5Ko3bf9ENqXIWfLbSqsT6GAwRiNHh5cggQssh01UScXMOTgYZVuGK2Vj8ewR5m3qGZxwpCvBl7etgxU/ylMqbXjQPy7h6xRrXw2EYWrWE85E+jUakZSI1TRUlqxIqkw9db3y4L+b5zx37x3iXzvg7lC5B4ZaDrenksLCguigvGhqrXGlzDMCKtptqIGikc9XQnRlabT6SWp5ujC+jr+lLgdU8EC8lwxSlNaOBzK7lejsqLGj342uffwQWpDlg/TgVjxrcZxV2a4Yb3mgyGH59KwOgxLLBAiUbMw1VQNF+UOD/CfGH4hN3ApZ2FQPDingGi0H28IPfDj25SmAU1rRZvA09/EmMWZqNdN0KAQtOSZrrSmDt5Je6KXQo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(186003)(9686003)(6666004)(6512007)(6486002)(316002)(478600001)(26005)(6506007)(83380400001)(33716001)(66946007)(66556008)(66476007)(6916009)(4326008)(8936002)(41300700001)(8676002)(2906002)(5660300002)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scmTdLA4LcS5GFtVRzox/Sv1tKxnWov7ve5G6pOJbR0/9IkDgnhWgWmnHuol?=
 =?us-ascii?Q?ON0urDqxK4B78J6w+B9qDyzhOxUpuwuimFJT5GHvieAA788n9Yni3b9++Tis?=
 =?us-ascii?Q?W9VmBadVyC846ALNGbTFxOXyHFCVNw+jibChAfcGwTedsnFmvSto/0QrI4+R?=
 =?us-ascii?Q?WHJoBf0snLkql6Aubt+cJlIFeIEmbcQ4p4lHwSR35q1nc994LFuPV8zRUNLy?=
 =?us-ascii?Q?GBuCofdZYeM9GIRuUpoHYm5C2oVMEH2il8BLsOPzfS4K5T3fF2t0+VLOyRTy?=
 =?us-ascii?Q?h8OL2nXL0TxPIqdFkvmGTGj095agcgEXhC00P+SEvS7vneeWR7saaXeZZ59k?=
 =?us-ascii?Q?kK1oWQhpNfzcoVB3ylyZYYrE5SHhjRgYPJLSeXOue+kCsYvYcqiUSrMTgIWb?=
 =?us-ascii?Q?NQ8NbGKdUHUm2xzESoiVkrz96W6nnxyBy73P6J1ZA+VJTPm6PzAMRVfhAJ+I?=
 =?us-ascii?Q?RnkwhHrNY2hO5aAb8hmKCWxC1HLAdX2GiF2/CMeupTo68s9jmoUVkBssVTIL?=
 =?us-ascii?Q?A8Zwf2a8yoPC0Iy7/x0ZsQHv8h5QF0QLEajFtJviy1JWU3hE6awY6bcPX6Jb?=
 =?us-ascii?Q?I/qO5pkZJWLDijQ41OUIDUO126ujuL/YWLfmWlFTOgsyxv0AwWl/Pucax1/6?=
 =?us-ascii?Q?gWVFAkhkpSdnsFZrtbAB6cZdaeWXt0BN8ASDwv8aTtmrlQCHqiChcFE8JAdf?=
 =?us-ascii?Q?WLGS2fBuiioE4zLnSMBjoZChwYFSBBUWiaPmcr+cANet9bnUUvEheqEPs5um?=
 =?us-ascii?Q?tL+FJCRBP6l6GwhcZS7/084kjV1DwHJO3Wsxt2OxJvAYTagMvUoMA28IaHZ8?=
 =?us-ascii?Q?oKIXpDRJ9mJWhNcCue/ZUNPmwoJ/FYY8WNNdvckHJv5exPBi7UYoWjDTC915?=
 =?us-ascii?Q?A8Vu4tK7DdHwTMtG9d7+uOrD4xRj6n8jqcCAdl1sXPBem7c8bNsEHycw/s2s?=
 =?us-ascii?Q?rXItJraDGnm7DqRiyOll1BaLHEh+P4gKxTkfJpttP/3JSoIGTgKFJhC4olbM?=
 =?us-ascii?Q?NFSN3uMuaQ2SfiDF29ZnTR5sViwoRA0jm9dZOUPA92IPLZDzGIVUP/egRXr9?=
 =?us-ascii?Q?CdWEoZm1dT1Hf7v/XKSNTyx3udwMg9CzFL+ku51iLdO/SGJL6CBOYBVjz+XH?=
 =?us-ascii?Q?TyVAZK4MWSWO0A1GDIjZ38TaMKL/y1KcsSVrw56gSGgF60y6LvqEdlpSkp8N?=
 =?us-ascii?Q?89pknEYyUJdcyOmJp87P4G6/o2hmP3EqhXIDdSrCvwZlz0QfuBY/Sw+yTIF9?=
 =?us-ascii?Q?20i1w1kAKnUHmIkokgPfoMpdCKd/sFo0fuxzfrBaynfyc54TvaFJwj+fXU97?=
 =?us-ascii?Q?DOV59xyz2BP/ut+8BnIZsTm8Cv1b2K/L1VAd754x3pzHawK/4B9NRK/fwJ1v?=
 =?us-ascii?Q?TzvKQ0u+1hjwMOOQoD7pGZHXlgBA7HW5Otkyk8ABjXNB9qQ49n6cm6fHxwnp?=
 =?us-ascii?Q?6RMglu+qFJgBS4Rstm/hUZLI8KbKU9Ura6W2a9/uCwPMiP+CHp3QFvmnH2J7?=
 =?us-ascii?Q?vS8RwQfcfbC91KoxQiLebJ2DB0X9J79H+Xw0/htXDYSA8eNn+7YP2QBbh7gK?=
 =?us-ascii?Q?IdbuF3+1AZjb2cRLQrdJykLy/MSwXxzBYdVZ36TUbOUL+GLLh/5zTlWfh3Sh?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac54d279-a5f0-407d-7ae3-08db4cc1d2a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 17:05:55.0807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klYw8dViO99SOWOUglGNZ0p4+1HFqQhorah6qPzef76KJHuHPgtyUtGxyWSt9roC/cnutaLO7vsnO7ygf8lYDbj0/ADPDxhRjS+SwRczpDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe: Fix Wa_22011802037 annotation
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

On Thu, May 04, 2023 at 12:15:54PM -0400, Rodrigo Vivi wrote:
>On Thu, May 04, 2023 at 12:32:47AM -0700, Lucas De Marchi wrote:
>> It was missing one digit, so not showing up as a proper WA number. Add
>> the missing number and annotate it with a FIXME as there are more to be
>> implemented to consider this WA done: ensure CS is stop before doing a
>> reset, wait for pending.
>>
>> Also, this WA applies to platforms up to graphics version 1270 (with the
>> exception of MTL A*, that are not supported in xe). Fix platform check.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 62b4fcf84acf..f7d32b744247 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -162,9 +162,11 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  		flags |= GUC_WA_DUAL_QUEUE;
>>
>>  	/*
>> -	 * Wa_2201180203
>> +	 * Wa_22011802037:
>
>nice catch!
>
>> FIXME - there's more to be done than simply setting
>> +	 * this flag: make sure each CS is stopped when preparing for GT reset
>> +	 * and wait for pending MI_FW.
>
>ouch, we need this! Or maybe GuC is doing this for us if we we pass the flag?

GuC is not doing it for us, no. This is for driver-initiated GT reset
and it's the driver responsibility to do this.  The prepare_reset hook
afaics is already in place, however the loop over all engines stopping
the CSs and ensuring we wait for the MI_FW are not. And from a quick
look in i915 doesn't seem very trivial amount of code to add in this
series.

>
>>  	 */
>> -	if (GRAPHICS_VER(xe) <= 12)
>> +	if (GRAPHICS_VERx100(xe) < 1270)
>
>We need this in all the platforms including TGL from what I can see...
>Why are you limiting it?

we don't need it on MTL. `GRAPHICS_VERx100(xe) < 1270` includes all
platforms before MTL.

Lucas De Marchi
