Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E912C48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 05:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC3010EB28;
	Mon,  5 Feb 2024 05:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NR4oDlBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086010EB28
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 05:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707109653; x=1738645653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wOU+xtQppZ+p5tCsRrNTDFPPqbxdZecuKk7SR9uRBp8=;
 b=NR4oDlBg/51mgMNHjh21cWdMBMNuwLXTeRX87T6U4q1Z/66yA2aPx9gQ
 D8zYoPCZioGrBRDe2iHt4P0VDSmPeIJqo4ZzHhj56dRcSHQT2EMo+RqGq
 wuvKYltL9wtiEDMIjnvNqelAAmf/L8bBSSJ/c+gTNA1/omk/PPjA/dS11
 YSnvD5ZCJIKFmbU5cSee0HpyeRdMxQAv74BVQksi8Ja74S28jvU6SUxg4
 QTWzaCELhPVuAnYXY24KKt05t9T1jJ14AFq6Y7/pdLqMyZJ1QItOGVWv0
 cSHJHmmKtTBdamN2ymOM27vxzcGXuX93915Kh1eaV0QvCKiY2xD79J5K0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4268907"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4268907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 21:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="619258"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2024 21:07:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 21:07:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 21:07:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 21:07:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 21:07:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN3KV5aW8hqLzA1FDI33IYFeIoJQH92XH/LeM7TU/JIBq5PxGwaTwBj+XDQA5vfNYXJ/iG11ePmLD2r0cCBByMsJNgIriJOT5xPNppRVXHojUcIbcPVh9dQJCDjshrZ7Lo9CRgf+Dyvc6RTP13CWMYtYxuCythQrJbodB7VYYHNYTHeA26qrt72gAV4xUS0ALWO4YP+JuxPw0ie15HXXGG7n832zYr5efLs5cmNyEhxmiJTiiLVcKQ1Jk4H//c7rCvfo4FNFfICRzj8jIcP+LifQZHTLDS3CAeTOGKZVVd9GxaCu0fbCEWBrMVl4MxOjfYCXCB844BlnyzFiNGkhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hX3hhJNhEXUW51KbQy2/qv+ei1CYCpqjMtbouwKYsQ=;
 b=gURVVYuQhMZV8pVtTIl89EZJ+5tfN1XhK94INlyUqrYxo5DQWwlOKaRWE89SW3EFL+h1Fy6XtLE/hRCfJSP0/22eb1K+5vbhWTAyamR/rUD1hFYndUiwYcmkWediLQ6U55BdLrJBQgw2729agHzHZ7W+vh2WtFIg+LzVrht5vDB5/eKWSdH8vCuS52+IEeq2Z0yXh6xUBiEgzBpyg6VLhbztFZ5X3KykovS1NmycAbXAHXf5b6WqpMXMYNh7aAqVEvLYbw0l3YVL2329kUfDo28Z3C0EXNrjX6rkINOSS7xqPS6rsD6xc5sonuNfEf0kc2xk/EuordoajQcTR6kb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH0PR11MB5361.namprd11.prod.outlook.com (2603:10b6:610:b8::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.34; Mon, 5 Feb 2024 05:07:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8676:39c3:f7b0:808e]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8676:39c3:f7b0:808e%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 05:07:28 +0000
Message-ID: <df3a3233-fc30-47bb-b7f9-716f0ee0ac65@intel.com>
Date: Mon, 5 Feb 2024 10:37:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Drop redundant newline in name
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>
References: <20240202225623.3225443-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240202225623.3225443-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH0PR11MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b07f63-b4c7-4e0f-260e-08dc26085971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GSp1q4CSAFW8nJsO5IUTyyhE2NpuBSEmweBl3iI/AJ5WcP4L3dfOCsG+B0YNL25M730i3P0K/2JL9mp4Ii5iRe6BRaMP3hDOaiv06XQscGTR8Ffif17RYwNzlzAC2m8yt4ZiH1C7lssmtBsH7Hz1dwpYEFO+IrVu0LxnGV0BKQZe660ZzUWVl6FOXZ2yF/BZ12IVw9+/AJSdwFC4I70yMFN8lAabhXV/eXPadFUh0IyWf1BZWJCK3S3Rfq+DHldi9L/s/rK2ktRAfwM7fhAlIxfZ1J0EM4npxpEz+3Npjf2T9cQ0+uMumtSa7WQvY8L5Kc9XO6F2HZnSuoHmXj/3MslOGfWFrvpBupHIz+/aQhW5vpWwGONAOmTdTXTdLBnTwLzG56O/vQDSkDh4dK4p5/QfmUiF1pTyQZUMFIqLGDZp79+s+9zsubJAkz/qZqwAxFkpcFkTSeNfW2odmqtOlbS7JbCJuMqPFtOsVNvptgL1ucw62NMWY4cCBg2epWlJBYNyXZhdm3zx7xxhQV6U0PUFfr+oeUJpx/nt3X0ZzRaxAgEtNBU++I+sLcCnNB8aQltul8TO5BgyfCBuWuBNPdicVZcdoKb0FE9KwzGhlLnpAxZdNUT0nkRWJ6+JKZOznQe6vnqGGavuxnrl0rkLgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(36756003)(6512007)(53546011)(6486002)(478600001)(107886003)(31696002)(2616005)(82960400001)(41300700001)(26005)(83380400001)(2906002)(66556008)(316002)(4326008)(38100700002)(66946007)(66476007)(5660300002)(6506007)(6666004)(44832011)(86362001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWUvYXpnTnZlOTRjYlFYTzg2dFRoZ1RrSXhVU3dDTVNpRGZldy9nbjBYTDd1?=
 =?utf-8?B?ZGpCN2RqRnF2d0w3NjMwTVVvQkhQZmhxTXBsZEUxZ1hORWtFNVVoM3JwQjJh?=
 =?utf-8?B?bjRyMnlPeG5wdGlHRXcvbFY1Yk4zS0EwbldmTDJkYnJpUUF2TXhZK0F1Y2dG?=
 =?utf-8?B?bWRUYmZRQVRSUGFiM2xwT3RmbDlwQnpRem5LcFhVRllkVmN4ajdYR05kR1E0?=
 =?utf-8?B?NHUzdzh4K2FUVHV4czA0YTk2cnBnTCtpdkEvT0hIRlVjdUhEZVp6amRhMXVs?=
 =?utf-8?B?ZklNNnZwaEw5T2hRbUlPM1RsVFhBRlYrZloyQ0hza2FOVGVPMmlVZTRPZWts?=
 =?utf-8?B?cllUeDV2YVJkNGlrdkRHMG1ETXdCUXVYUU0rSERnTVlNOHdYUE5TelpkdTNx?=
 =?utf-8?B?TmR0WW9LT2pvMXVrR29OSFErZlBrYjJyTDZtNis4SW96cGtLSG5sRmZSSWZY?=
 =?utf-8?B?V3RGZnRjcjZrUDZyZWVQdlRLRVNCWWswZ0pmVnRSeU5vajJyb3VEWVgvM0FT?=
 =?utf-8?B?cm1CTmUrOVRNUU5BaTdWWTg2QlVJVWYwdUJnemJwWUx3dlF2VStSazBMQ05P?=
 =?utf-8?B?dE03SWlvZ2ZERWpNS1RYa25pYmxSakdBMkZPRWdxVklJT0dpRkcvVFB1VUN1?=
 =?utf-8?B?TXZuYkwyNkRSNmpaMDIrdFpUTVRidkQ1RkkzNVlyTXhGb2s1dlRNQ2djbGJZ?=
 =?utf-8?B?NHk1R2hmQTNZMlJLL2ZSYzZ1NVV1MWNaOGFtbXZHZlVGRGhyV0kvVG5VTGpL?=
 =?utf-8?B?UU0yWUZZNXpTbXo4SUVRYStzck1RaEdXanVtN0RIcFJyQ2tHbjhoaG5MVlhQ?=
 =?utf-8?B?VEdacFgxRGFSMUtIWGpROFl3a2tCQVdzdEdXVXlsU296MVJCbGx6OElGWFpP?=
 =?utf-8?B?ekNHcEpzOTROaUViK2pYSkxUTm5QYjlVRVZxTE5TY2RvZWhPS0F6Njl6Mkdi?=
 =?utf-8?B?Z29nUXJseERBaDdsM1N4bDJ1ZHF0RDIwWE1HbEFPcXloR3Q0RStqRDkrdlJU?=
 =?utf-8?B?UFZsOCtCQjl4ZmlXaDE2UWNwSVZ1MjIzcEQvS1A1WVY4aHBYMHI2UEJkZ3cx?=
 =?utf-8?B?QnVFNkpSbnJoNjNxRFZIbUZPcXBVREFoWFVXYyt0ZC9GTldsaUYwNExuMmZz?=
 =?utf-8?B?NUNEUWQ5RXRDSjVrMnVhKzFSbU5MZEJTYnN2dnMwZHkzRDY4MEZhbEIrYzg5?=
 =?utf-8?B?dm55ZmJYRmFBd0NQTmZwMWRjYXA2bERJQTRxNm00R3FOV3JiNFJ2NFhpVEty?=
 =?utf-8?B?L01nQzIzNDRrdy9OTjh1eTRPMWluNmpOT0N1SXdTYm42Q0xUc3crZEo3Umcz?=
 =?utf-8?B?QzFrUWtTdzBCNG9nTk5Vdld2OWJOWHRvQUx2MVo3UElFV1FyQ3AwZEJmK1dj?=
 =?utf-8?B?ODhTaTRxb3JzNGZjcEE2d0VVOHVJcnljeWJxR0gvVUJ4SjdrTXN2dHVpTTBz?=
 =?utf-8?B?OUhMZDh5V04rZm1jcWdWVGRWd1dUK0lNY2E4aEFDU3M4a0F2QUhCSWMyaDRl?=
 =?utf-8?B?M2Q4MkFxZWMyUUNwbmpvbWZPdW9pbklGekU0KzFtYlJXNmhwOXJPL2ZoSGs0?=
 =?utf-8?B?TjAzUnBkakwyWmxEbHJYNEZiTTUvWWxoNlErZHljTkNLMmtRajdOaWVQSlpl?=
 =?utf-8?B?OVBsSFc2K1ZMaDd6QnhvYnRtdlJheDRpMVV5YjZuZERhZkdDRDZHR3k3cDhV?=
 =?utf-8?B?L1pmangvcFdyUTBva0xHTlRNU1VwVFU4S3lvZWRPc04yM1FMaVYxNTVPWEVL?=
 =?utf-8?B?SXJtWTdLQ3V6UzlZMTh0aCt0SlJzTFBZQXdFSXdPWXJHRkJCU2MrNkErcHNM?=
 =?utf-8?B?ODEwQmkzN0twTnh0RW5sZnlEOTh0b0RWUXR2UFpsWkRadzU2RmJrOXBhKzdF?=
 =?utf-8?B?ZVR0N0RVbUlCdzZTV0NxeWFuWWpqZmhnQzZEZEZ0aFdxNS9IM3FUT3B6NkRv?=
 =?utf-8?B?NGFKazJqYURsVmhyMDJNc05nV2dVTkFadEQzamZhWU5tWjdsNjdUZnpDaWtK?=
 =?utf-8?B?SllEMVljS0x6ZSttbUZSZkNoRFIrbUlGUktoMnhPRlhUMzMwTWVKZ2xIVUlp?=
 =?utf-8?B?SmdqQUliZWMyZzkxQWtEOVZFMVVDUUZ3c1RHZG9IdmVCMCtJZGZyWmhpaUJu?=
 =?utf-8?Q?ktpg/4XVcV5W8o4JrljEgMzBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b07f63-b4c7-4e0f-260e-08dc26085971
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 05:07:28.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlrhiCfD1iOCRPZtfdugaaZzcdfqY4zrMXMtRJe/ZMXLF2KDupvJoNhDfqO7blZ/UdkhrP8BMiDts+kFMz9UMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5361
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



On 2/3/2024 4:26 AM, Ashutosh Dixit wrote:
> Newline in name is redunant and produces an unnecessary empty line during
                     ^typo
> 'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
> stringify the argument to avoid potential vulnerability")'.
Should this be fixes?
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
With the above comments
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 9358f73368896..9fcae65b64699 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -145,10 +145,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>   	}
>   
>   	if (xe_gt_is_media_type(gt)) {
> -		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
> +		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
>   		gtidle->idle_residency = xe_guc_pc_mc6_residency;
>   	} else {
> -		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
>   		gtidle->idle_residency = xe_guc_pc_rc6_residency;
>   	}
>   
