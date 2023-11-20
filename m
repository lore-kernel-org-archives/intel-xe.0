Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1F6C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147D010E129;
	Mon, 20 Nov 2023 18:30:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA810E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700505011; x=1732041011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b96JE409u4Csxma0VNyY4hVXDuafJUw2ydeQEtBw998=;
 b=gUXfojzIZ5UumCp5aeuuc2yr1T7hZrAfRj14SrVeM2eQIaTMxw/SVw2X
 FuHMrnidpdld/b+jyTEQwKiv58XWPnKT60eDgTWGntAef8m7CAIGnvJT/
 WbtCnorxouemzEldG8XkOqxzYU2WwvUS+6LlLNj3YIYCl5ea8WzX/wNb9
 ECERHbTSpFtcR3XrJcDW1g8ktwUaN158n9QnKtUqmk2dNEvfpBln5r2Zo
 TmVlSr8MNqwkpQcLgxrh8ky39s54IHAwfQgm7aTGEVcIbGRsiRJDq3xnp
 hKsyybEljMW/q9KscrOAUoZFhOUnvi/Va0jZf0IrzGHgO4LA2wYi2waO0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477885518"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477885518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742800812"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="742800812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 10:30:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 10:30:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 10:30:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 10:30:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9viChtVkeP0AiDF72yuF1/Hq0raQex9Oilf77FdagheGqnvm7a6jp0vBL75lj3luPlh5cSmKp8YjgbqJ5e7KxaTz/gylU2pdTxsnuxTQwkV/dGJfo3bPBK/vAazcsu6n9hVeArW9UhKnLJKVzkjcOZckLsJ1Baf2FZj54/yrC2BAbyNdOlgefI7F6nm5lWTokteUOb/O15tzqUg5VyB73Id8AlIDFIoAUya9RPFic2dUqR7S3eUapCHvfWnsR3UYmEkibyXbxZ6zULQWvjR4i+ry0CO0jZPEXQBsN2cSgLvZh/TarMrcGX9ZwPbvtGczkHiwtAwuvEpoweI1+pxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObnWU2vblc+Xfw2CGiRTgSMq5O+BZEbJyc6Q+8tFndE=;
 b=eFA26iYu/SkE8svz7YQGGDv6YakQUL6MyBek1uye7Rxz3jKcxNtXdjH4E84yZKvT7x4UYPoCqTycmulY89kymxhYviXEs2TKunBGu2fgNFu0g1xr8IeAZTDswXaQgLjFW1gx+vgZIPHQkCozeiZ1uuI2hGJeTp1gtZkAy914ZvO+/qm+K1GBjmbpanOb3qOSVAkpDETJVeacdpC0Zllmtw4hPkiXNJMj340E5uHEyjMQl/53s2JTxhjsnzlLSGEcXu6ccBPh4EkjenT0ZYyGKBfcMwJjYQan9+Zi4cT9qb1olPbVTkCmIyB+rDC+PNzWmmj3jsskEmuZtfT0CN8cTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 18:30:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 18:30:05 +0000
Date: Mon, 20 Nov 2023 12:30:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <zzimqo4mlu4xhpx6u67vt4pgl2lfg6pz6dclkbtxqy4drqdcv5@jsnrsztffu34>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
 <20231117231411.631895-4-lucas.demarchi@intel.com>
 <20231118003135.GF1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231118003135.GF1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 598adea3-d381-41f4-182f-08dbe9f6b79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ID6W5vCrQsG3ZGPB4QEFIMPGSJLaF1LWVYlDNjyeyqZDqii/3VMKN0384LDShc7ngEGbK29iHBlpFoY4uKOtNn+RIM5u5BGzkWy2vAYI0FFSZIQ6emOFE8FKtIYrc+yJ0zcglrxAJyXy/3mpd1he9SYnMOren8Rt3lPsimKPUr9wZNL4XrpHZq2bslvwzU/7plJSAQE7OCzO+oAMlqX8lwdxnNYtx3GroI+NfQOBZv33+51uLYgWn5zihvFO1OKdm+EU6YJw0a/4I+JxHFMRg8J5+T4ZGKhwQRMpCWUfaf9ok/UdDVc1dCQl5GnLxxEcvyl4RCL8p5Ca7w/c4CTCPIh/6B8oLA/mYo41M26TZtTeLaushKZrPuubShMb0FU0iv0oYgKnCTb60eeMCZrig2ko21wjpYrL1xaPo7dUTdk4NrKg1kxUAAWMbblvh7JFue9MKLxqHv4GUa8tuKvGGQL4kMKYZVQRvKeltkOnmscXTQdCaJwz3C4RNJa5qifFs+lIT7ufwovj9efH2ZZo883ewde+xRKF5/B3m99Rri6N51UXvqdiVbTteaAmlLgH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(396003)(136003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66476007)(6636002)(316002)(2906002)(5660300002)(41300700001)(8676002)(6862004)(8936002)(478600001)(66946007)(66556008)(4326008)(82960400001)(38100700002)(33716001)(6486002)(6512007)(9686003)(26005)(83380400001)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wLTEl4XbmpGIHOgFBQ+vqS0GhlzhILAhtzFxtsdMRLgEfzspNDq4VqvDKrtW?=
 =?us-ascii?Q?SXXJu9exIppHSMgdVMQnD1CsxLN6zIB2WRtKxs5w7nNfaqBKxJzsqDgmDdQI?=
 =?us-ascii?Q?zmDhBvzOKg0cBeOyjwWIqS1Q717XM8s+NIVjprpS97w9UMI0zptYsj9Aop2b?=
 =?us-ascii?Q?qELg5Yl3v3bnh/wNcApdumbbNpj3LH7gfOTXqWtnEHobqgIiAQ95nJ9LsnH6?=
 =?us-ascii?Q?VbuolcYlL1CSJKg9XkVcuGXERE/T2hw4bEClHzxuQ3C7ij06glnHOgqU5Kec?=
 =?us-ascii?Q?EyHAyUEp9Fms6hORyYodChD1Tnf7nEtQZ/v+06+Luxi9JszQ048HhMNwyqpH?=
 =?us-ascii?Q?Q3OtGHjikO1Uxod0ZSDvVpAzV1/LavmwIZsFn4rvessIckEkXDIMk8CNETQz?=
 =?us-ascii?Q?zB9Xr0qWuk+iqZY1YrqBfOPQp+ZUnpvs+Y2D78TPhXysSVg5y/JId4MMhuck?=
 =?us-ascii?Q?4fmH+hHYcyEtLI5Iyel5RvrO9usx0PzjiGAFl5cLL1gyJX4qBUxqK76Hmx+b?=
 =?us-ascii?Q?3Eb0LlWOcmvgNtFC5XECclC/e7N8kvEbbZgHsUfVqzMDqlMq+Tt37IjHzzcu?=
 =?us-ascii?Q?xxYsbu6ODS8TncqRvlA3DBcO5zyY893yBPsTbjJFuljT+brwgACYKhF/bOxw?=
 =?us-ascii?Q?AGeTg/IpQkO0JzSfg2u6aRzXAzkrcUut5tGZ76ODJ/IQSSo8W2mHx1bxwVnK?=
 =?us-ascii?Q?gqZE2cSZrvZc7Ha0vslsUChtlff6RksKADS+So2qbZzt/s3WhLLvRM9MMk8N?=
 =?us-ascii?Q?wxantN615Mfr/RIq8zpfdvBYbGjD+MPHMlnvNLbof8iwIPDwl27oELCYDCyB?=
 =?us-ascii?Q?b/Tt5J607ERMNOWUPKulRZZF+SlB31ALixHZjcomN/UQPwnnersOb7AOk6Gv?=
 =?us-ascii?Q?M1uafCIBiDXt9WyX2oMLUBVdpN+BahHQFQ8fEYzfWksWDTqgoNzP0FIrH6Gx?=
 =?us-ascii?Q?K39tPAa3VItwO3PG4vOoW+b2Hj9D0bA90ahWhJq06B8m+AKYhuiC1zT0Raq8?=
 =?us-ascii?Q?rabFcDM4DpDQvB0lS1UBXp20hRsmTF7pCl6ASY2LKC34vX35BbyizzPPA9y0?=
 =?us-ascii?Q?7j4Mom8jCF/GhaEgiz+3Zimn6AAtkxNaFEJ/WZtUcjBRVbK4waJMLxiOmEHG?=
 =?us-ascii?Q?AMBH69BkfMnOiNQG2etgqVPn5cGLiswlWuVetiqTc/E9z9nGv3yRokz2y2Fl?=
 =?us-ascii?Q?uAxcdqFbOk/tyVbwBVfscQzXyr2xs0jWri+mjYWd0g4uXMIav9/Q8jhHFk3b?=
 =?us-ascii?Q?T2mt2naQh5ut8W1oUM4ckcMWscmjPZFHtOxzpicddELh5rAlB7kpBP4po+iH?=
 =?us-ascii?Q?beTJ77/Dmo2v+fumaIeSmCHi6idccQiRoGJVVfQMWLvOmpCJD25fihTYsTHj?=
 =?us-ascii?Q?gB8hykmoAqWqaB1wERg57Qc9tv47P3UqqPQQX7WZ/7M6zpcrLb78m9MGr6Ia?=
 =?us-ascii?Q?c34+Ny+xaWkvuVa5EKnBmGEMxzYqViEoHmLuFpOlm8slgpGhj46/JSGaGMV4?=
 =?us-ascii?Q?ec3DxzBY+jCQQAIldh/3b+b/gH6vJWHreF4u7+HioxockfqzzQT5guzn3MLV?=
 =?us-ascii?Q?+fOXtf0fYfU1ZtMaHjDSZFYXHTAGR0Q/K2u6uffJIz8b+fAOS6Lj5KH2Id1J?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598adea3-d381-41f4-182f-08dbe9f6b79f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 18:30:05.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekQgjeb2TN8LToxJc8SR/4q164wn0bhcGildItedl3L4KxvLNoTypg63pSW3KTO4J0qUgr32CCQax474n8T3mCB6F/StqiPJSEWmb5bAneM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/kunit: Test WAs for MTL and LNL
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 04:31:35PM -0800, Matt Roper wrote:
>On Fri, Nov 17, 2023 at 03:14:11PM -0800, Lucas De Marchi wrote:
>> Now that the kunit infra has proper support for GMD_ID platforms, add a
>> few variants of MTL and LNL.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 34 ++++++++++++++++++++++++++-
>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> index 9185e520af58..458ad725802d 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> @@ -18,6 +18,8 @@ struct platform_test_case {
>>  	const char *name;
>>  	enum xe_platform platform;
>>  	enum xe_subplatform subplatform;
>> +	u32 graphics_verx100;
>> +	u32 media_verx100;
>>  	struct xe_step_info step;
>>  };
>>
>> @@ -38,6 +40,18 @@ struct platform_test_case {
>>  		.step = { .graphics = STEP_ ## graphics_step__ }			\
>>  	}
>>
>> +#define GMDID_CASE(platform__, graphics_verx100__, graphics_step__,		\
>> +		   media_verx100__, media_step__)				\
>> +	{									\
>> +		.name = #platform__ " (g:" #graphics_step__ ", m:" #media_step__ ")",\
>> +		.platform = XE_ ## platform__,					\
>> +		.subplatform = XE_SUBPLATFORM_NONE,				\
>> +		.graphics_verx100 = graphics_verx100__,				\
>> +		.media_verx100 = media_verx100__,				\
>> +		.step = { .graphics = STEP_ ## graphics_step__,			\
>> +			   .media = STEP_ ## media_step__ }			\
>> +	}
>> +
>>  static const struct platform_test_case cases[] = {
>>  	PLATFORM_CASE(TIGERLAKE, B0),
>>  	PLATFORM_CASE(DG1, A0),
>> @@ -63,6 +77,10 @@ static const struct platform_test_case cases[] = {
>>  	PLATFORM_CASE(PVC, B0),
>>  	PLATFORM_CASE(PVC, B1),
>>  	PLATFORM_CASE(PVC, C0),
>> +	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
>> +	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
>> +	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
>> +	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>>  };
>>
>>  static void platform_desc(const struct platform_test_case *t, char *desc)
>> @@ -78,11 +96,24 @@ static int xe_wa_test_init(struct kunit *test)
>>  	struct xe_pci_fake_data data = {
>>  		.platform = param->platform,
>>  		.subplatform = param->subplatform,
>> +		.graphics_verx100 = param->graphics_verx100,
>> +		.media_verx100 = param->media_verx100,
>> +		.graphics_step = param->step.graphics,
>> +		.media_step = param->step.media,
>>  	};
>>  	struct xe_device *xe;
>>  	struct device *dev;
>>  	int ret;
>>
>> +	/*
>> +	 * Make sure graphics/media version are only ever set together - only
>> +	 * GMDID platforms should have that
>> +	 */
>> +	if (param->graphics_verx100) {
>> +		KUNIT_ASSERT_TRUE(test, param->media_verx100);
>> +		KUNIT_ASSERT_TRUE(test, param->step.media > STEP_NONE);
>> +	}
>
>This is true for now (MTL / LNL), but what if a future platform is like
>PVC and doesn't have any media at all?

what I tried to handle here is a wrong use of GMDID_CASE(), but failed
miserably.

>
>It seems like the opposite is more useful to test (if media version is
>set, then make sure graphics is also set) since it seems less likely
>that we'd have a "media only" platform with no graphics.

yeah, maybe as a separate patch...

thanks
Lucas De Marchi

>
>
>Matt
>
>> +
>>  	dev = drm_kunit_helper_alloc_device(test);
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>>
>> @@ -95,7 +126,8 @@ static int xe_wa_test_init(struct kunit *test)
>>  	ret = xe_pci_fake_device_init(xe);
>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>>
>> -	xe->info.step = param->step;
>> +	if (!param->graphics_verx100)
>> +		xe->info.step = param->step;
>>
>>  	/* TODO: init hw engines for engine/LRC WAs */
>>  	xe->drm.dev = dev;
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
