Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F00AC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 19:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8B910E2A2;
	Thu,  4 May 2023 19:31:36 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46D510E2A2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683228693; x=1714764693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pTkPEPvH0j6lsrhfThS1PYaekRcPenGBQs0zpFmceYE=;
 b=RDmcmtDKBAvEldPHlW4yiNpRSEtRGujtp8DStFqC5+vkZD3Y+3XDMXl5
 cbik6Z9e6JPMXnhMCpnSNO5MRYKtWfRMYSOzgyKsPZ9v+Gt4gXTjD7994
 KDgeNB3G/2ygnbkThYItAywE3XpTWJwQUOyCfIi7jZerEdecWL9ONanHJ
 GGoQ1/qYKN8Mxp75P9vDYe/SY9Uw958gN0xH50ir5qu8P7/3h3Yy120om
 FacbxPHvEPlLrnWU/b8OfFIg96liyQoM72kwOF6sonBdZ2Cg1pkK7MXCs
 RbRt6A/HBU2z9TDBRiDPerO8QReHhQ7Sqjx8RPx3II65P6iYtT+VxrQTu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412250549"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="412250549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 12:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727706229"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="727706229"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 04 May 2023 12:30:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 12:30:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 12:30:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 12:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4yrLNHKdd9eP/vSKZEdrbFXa5b3m0C0ASD1bt0theQ0jh5VWeuAddOrIePRRqBmkNCcwD/V7HTtOlbxRFA13nzldAE6BGqu0gPe3H77xwbN3UIOz7MavjkW2ELaDpSBYFYZoHcSrRucafkdoYqSouak3pQ8YhmXCuA0c2io47apkAr+u0kFPyih5mYau+HwaOhjSd2jzUHLOwHj5KO/NLGRVe/Z5ZxFSqBkxDrQBn+aY3T00p7DqJhxfAMZCW8PBlFHcXvUe0Lphgy/F73m+0IfPyWOGVAnFrHHrNUbr3MfCCZqt91BSCjGTJHuupz23pNVNSGjt4nkacarbz4Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xibIbLQlZpXQ5Q4kmk6ONarFbuLtWrLNkjpJzyQwyIY=;
 b=BJkpL20RzCZYwauAVJNLtdgpPDbPQlMbHIRNrOxuZx5XWBLe2hA8PuoLX7f5dXIVXYcPsH37xjONSab7tRX5iQm4YAzKcSVSztT9iryUUFoVg+7tWqNLMz1dZ7adPqMONAxUszUm9vWaEtazCHLC5qCmHZtCHrjMFCglrhbNSeJLPuzDHfl4NNe00fMPnKaXaPPG/zCGYW5GbzgUHBTZRQjS1XWEA+phODNlhIJhbTA1KWRbDmfJicciKxYMjWKPs5OOvq+vNMIpU7/jdRlL7ormwpEv2ooc7ECtHaOGNh37glOQUEp2Y3LOTxibG+AbllyyCyXNNCXH5kZ8rQGf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 19:30:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 19:30:31 +0000
Date: Thu, 4 May 2023 12:30:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <dikz4xlzc6awvlu6rol2slga2nernci2zmhrnsz5qpksgi4br2@locnvrubd734>
X-Patchwork-Hint: comment
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-8-lucas.demarchi@intel.com>
 <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db084ac-a361-4e92-9e00-08db4cd605e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXIckmtT/te1XkeNsZs9a8GQqr9jLQGjEDeKXRBEmO9aWYFu16puCu4DNW4CSO2iZTkmDtEVys2nh+/0FKlRB3lSRzgTl6wFteishfNh+Rt5dgTq511C4WVxlqXnhUfNoKYINuzdkuNxfopNZgNjEQimoe4B+0/CkwhvZpVHXCrgeD8LVUIVzWMTmV45j92WXIuXydpyMlErKYSpinYzTV3Mwtchsq6R30bJ5m/oE5IB6FH3OGN5bdSoPYOIlgmtAsLcMfvEqlGo67S+LzDhMd5G6aFBgMlfpHj88YcVYrNkOJKyUBmMyzQHxnLhXQNjzXZnKrXH/UW801Sg7inC0CtYrEt54v0sL29h1lxw1ka+NaHLoazBWVmT14l/3+QiV7MbmEqWAj5x+0JP0PHB+OYh07Vo1pjAn9LT/vY2NMpHcDUB++mLSARgrsP/eEOZnOt967dPPlcIPG5YPakfA0Vua8F1COBJZR8rno2ww1I05F7uXv5mPypvpDSsRkMzglNGoUaspifFukuAUsmg6d/hW3T48e5KzN+lwvUGPT6BhIs7LzR5BvHrFgNMxhCU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(8936002)(4326008)(66476007)(6636002)(66946007)(66556008)(316002)(41300700001)(8676002)(2906002)(6862004)(5660300002)(33716001)(38100700002)(9686003)(86362001)(82960400001)(26005)(6666004)(6512007)(6506007)(6486002)(83380400001)(186003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqrZ3e2Mm41NCPyCNQS5NbXP8F4QqOSL+XmyuhqbWrgPjYQAar3rJvbpanyo?=
 =?us-ascii?Q?E3iUoEk56WwMhn31Arusz5D7dD9zNkMfSgOcb4VnA38bSiOrn++QzeBMJZ36?=
 =?us-ascii?Q?oVIZ/pgQacIWTgzNRr+BpDyHpGJuZROcEU3fX9Q0Z/CoqYQs7++/7LWoemB5?=
 =?us-ascii?Q?iRpYtODvrWXsYytdafvI6CY+Sk3cntozJr7F+ETJqZWB3dN2JxqgeVFSDRQ3?=
 =?us-ascii?Q?4bJSQcU7V8N7sp9C8tf4boC5g+9AfnA8MKbmXcJq+6EO53Ep+/1ZcjLA+w/e?=
 =?us-ascii?Q?W0su0pB+ndFOss8NqARo9HQDzRMUFxNwQLhj/XR71X9JyGSbniCjifbi3uTL?=
 =?us-ascii?Q?DcT2yRaEUgpdQnikHR6K2O0LhiSk2aY9jIekq37oR47rP68SmAetcOqLj2g4?=
 =?us-ascii?Q?hxCVT5qIxQaPdQDU1mR+k6TuZcWxw6QrAO8o1qMpM4zYcMW1FR11uAP+Y+t2?=
 =?us-ascii?Q?/YgMKlzY2iyEWxf/fSTCA+T88VP2SdwQpGFt2DanDs4KVOE6rRN3dta2TwIO?=
 =?us-ascii?Q?PGIXk3u9BspUA9fQm1CxxpHCK1tRxxZb3guxGS0+qDHqt0WhJDgfqhfgo1Es?=
 =?us-ascii?Q?+T3Ooo6DaVAFdycuRP9sl55vHjvdqqMe9U9rad0CtOt+m1wzJecZku38CJmj?=
 =?us-ascii?Q?QZxG5zU+FU23RHr7nr6pexAf293ybk7/e5+A78qhiIfra8pxu3JUxNrLUlko?=
 =?us-ascii?Q?OHuDHsJ4Fte/03mYKNqkpg3Vk6Ve/OORnfZmm7uPTnEegDgB44hlYypBvuzl?=
 =?us-ascii?Q?jWU3SIoTimg7qCE9A3eFbOdbfHqYWZKo0i2CVWS7d5IbYWQors4eWcmjQbVe?=
 =?us-ascii?Q?QuAfFHP5NeR3berGefkJ1GRHiq62ojTUTbmnzBade4bW0meFqzPMLurssxpF?=
 =?us-ascii?Q?KQov+sxpEIi2z/W5oS8YoE4lEqlOFKoARoNDZJ+fUOwCOhW2oUY4DasfVT76?=
 =?us-ascii?Q?Hk9PcU+ZrXoNddJXVkwPgZJXM+bSxEJuf/rK5z1oNMgTkljg46G1r4XB64vQ?=
 =?us-ascii?Q?G6F2SCQxSMed3gOh3iUtsd+UyOgdmvrzQm25eeOQDoaQkjBWNpI3vppb35Pp?=
 =?us-ascii?Q?Q8gHfJWBauxGKClRju4TSj4pSkBOFnwDW2jQe/LmY8PKVNU4kz4RP0dZ/mux?=
 =?us-ascii?Q?UcbUK3+QeibKmQdAe6Ravs+AnZX3U5a3kmwym63leFsoqexKrV0wYzkP27m4?=
 =?us-ascii?Q?DyYNexqglJsbnABe1xhK7SRbYkKIJR3ep0kMHSrNdiid5p5LG7A0yDVOCRYt?=
 =?us-ascii?Q?y2CtDl/4pGpf+4VDVMv77bhINBVBFs4v5fc/HSRNj9Lo81sq69b5ZQwJ4oIS?=
 =?us-ascii?Q?Pxts1OIflyrVd5ojmcCaGhHoVAeasdKzQVW3MM6w1Cl7PKZ2KyTRmFjz0QWf?=
 =?us-ascii?Q?H+BEJL6PnJ/7/dN+SErq3jcc1z3x7/nW4LBpfder8cDKkvp6HlM237yYF16m?=
 =?us-ascii?Q?WJTOnNgnhCMDXS0f8f8sMX7sK/l7A1TroN+jgSzd6iC/nrCuSgh9NtgBIDXD?=
 =?us-ascii?Q?lRL96V1WNJcvpmaDdJkCnV7i7P5YmWEIbqvh6tZA0NMelcmT83Po2OHgczGo?=
 =?us-ascii?Q?4TfPP/Ab1J2bkkDHIMCh2hk5j8a71muRRQGgRyuE2dq7in4FB2aeI2yl1Uf+?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db084ac-a361-4e92-9e00-08db4cd605e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 19:30:31.2501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qjb42apPdbHXwt4IZEQ6G9LrWLytijR9vylkNI9E74d8iM8UeuB5D/j1DGYFclFRDog24LpgtJ3riVl4I0+vitp98DyNCiD1371D8NJNHnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 03:30:48PM +0000, Jose Souza wrote:
>On Thu, 2023-05-04 at 00:32 -0700, Lucas De Marchi wrote:
>> Let xe_guc.c start using XE_WA() for workarounds. One workaround
>> couldn't be converted due to no support for function hook checks.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 40 +++++++++++++------------------------
>>  1 file changed, 14 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index f7d32b744247..eea5ed015282 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -19,7 +19,9 @@
>>  #include "xe_guc_submit.h"
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>> +#include "xe_rtp.h"
>>  #include "xe_uc_fw.h"
>> +#include "xe_wa.h"
>>  #include "xe_wopcm.h"
>>
>>  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
>> @@ -136,29 +138,22 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	u32 flags = 0;
>>
>> -	/* Wa_22012773006:gen11,gen12 < XeHP */
>> -	if (GRAPHICS_VER(xe) >= 11 &&
>> -	    GRAPHICS_VERx100(xe) < 1250)
>> +	if (XE_WA(xe, "22012773006", GRAPHICS_VERSION_RANGE(1100, 1250)))
>>  		flags |= GUC_WA_POLLCS;
>
>Just a suggestion but would be better to have the workaround rule defined somewhere else and here only have 'if (XE_WA(xe, "22012773006"))'.
>
>
>Mesa now has something like that.
>We have a Python script that generates a JSON file with workaround data from the workaround database API.
>During build time, another Python script generates the intel_wa.c file using the information in JSON, setting a bit for each workaround that applies
>to each platform.
>In runtime it get the bit field with the workarounds that applies to running platform on given stepping.

that is one of the alternatives I shared in the RFC. There are
some issues with such approach though:

1) The condition is in a totally different place tha have to be checked
    to follow the code flow.

    The upside is that if the same condition needs to be checked again in
    multiple places for these OOB workarounds, the condition doesn't
    need to be repeated

2) Not possible to encode conditions that are not platform-centric or
that needs to be decided in runtime (e.g. if an engine is fused off or
not)

>In code Mesa we have 'if (intel_needs_workaround(devinfo, 14015055625))', Xe kmd would probably need additional checks like 'if (engine == BLIT &&
>XE_WA(xe, "xxxxxx"))'.

yeah... that maybe solves the issue (2) above. We'd need to leave the
non-platform checks to each callers. And maybe follow the same pattern
for the gt/engine/lrc workarounds.

>
>This solve the problem we have were workarounds are left enabled in platforms that already have a HW fix for it.

not sure how that solves this issue though. We mark the stepping in
which the workaround are supposedly fixed.

>
>Not sure if such think would be acceptable in Linux, just sharing what Mesa have done.

Generating code to be built is done in a few places in the kernel
I already suggested doing that for the register definitions, but
there are always push back.  I will take a look at this again.

Thanks
Lucas De Marchi

>
>>
>> -	/* Wa_16011759253 */
>> -	/* Wa_22011383443 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
>> +	if (XE_WA(xe, "16011759253, 22011383443",
>> +		  SUBPLATFORM(DG2, G10), STEP(A0, B0)))
>>  		flags |= GUC_WA_GAM_CREDITS;
>>
>> -	/* Wa_14014475959 */
>> -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
>> -	    xe->info.platform == XE_DG2)
>> +	if (XE_WA(xe, "14014475959[mtl]", PLATFORM(METEORLAKE), STEP(A0, B0)) ||
>> +	    XE_WA(xe, "14014475959[dg2]", PLATFORM(DG2)))
>>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>>
>>  	/*
>> -	 * Wa_14012197797
>> -	 * Wa_22011391025
>> -	 *
>>  	 * The same WA bit is used for both and 22011391025 is applicable to
>>  	 * all DG2.
>>  	 */
>> -	if (xe->info.platform == XE_DG2)
>> +	if (XE_WA(xe, "14012197797, 22011391025", PLATFORM(DG2)))
>>  		flags |= GUC_WA_DUAL_QUEUE;
>>
>>  	/*
>> @@ -169,27 +164,20 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	if (GRAPHICS_VERx100(xe) < 1270)
>>  		flags |= GUC_WA_PRE_PARSER;
>>
>> -	/* Wa_16011777198 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> -				STEP_B0))
>> +	if (XE_WA(xe, "16011777198[dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
>> +	    XE_WA(xe, "16011777198[dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, B0)))
>>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>>
>> -	/*
>> -	 * Wa_22012727170
>> -	 * Wa_22012727685
>> -	 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> -				STEP_FOREVER))
>> +	if (XE_WA(xe, "22012727170, 22012727685 [dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
>> +	    XE_WA(xe, "22012727170, 22012727685 [dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)))
>>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>>
>>  	/* Wa_16015675438, Wa_18020744125 */
>> +	/* FIXME: currently there is no support for gt checks in XE_WA() */
>>  	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>>
>> -	/* Wa_1509372804 */
>> -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
>> +	if (XE_WA(xe, "1509372804", PLATFORM(PVC), STEP(B0, C0)))
>>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>
>>  	return flags;
>
