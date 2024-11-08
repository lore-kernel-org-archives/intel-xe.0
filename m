Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2074D64072
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 18:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DBB10E277;
	Fri,  8 Nov 2024 18:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzFMGj2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190710E277
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731089441; x=1762625441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lL90Y5vvvc1AZWdYS9t7ReGnT5W6sLSVPjIgjJnLZP4=;
 b=VzFMGj2LV52D9oaGlQmHY9iE/3FnK3nh8P2jVTwUdpvaOLlj/uyxnaY1
 19DZwCmIpFWI3aa/me1W45CnZHNbbBh+B9creJwIpx5QOzh0suwZ3A/RN
 aw+9CdVxJtDgfxh3dscj2XrIDp4kYa8JNJghzf4tnRKWpc9Pf3Clm6mWZ
 d3pPl0wLZACxDLVMPoyI2zagvDWoxZsU54D2MRhn+lBzynAyvSkoR8EXx
 f8cGaSLiBevHU/nhxJTHBp+fYE6vD1KkI1kY1/dHUr3bBKZhDN8uv2x7+
 K+uWn3JbsOLpgx9scdZWbsVCXN63bqjMrRnPpBrlUDxi5f1MLQ9VtAzAX A==;
X-CSE-ConnectionGUID: L3jhdb80Qsech8l4FfWWkQ==
X-CSE-MsgGUID: fwjnchPgRpqvMt0A+6kYfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41596769"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41596769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 10:10:40 -0800
X-CSE-ConnectionGUID: D9u5Sk7AQgyD+CCpJt7KTw==
X-CSE-MsgGUID: Vj9fvwFyRuWsRlEme/l+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="108963368"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 10:10:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 10:10:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 10:10:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 10:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uliw7gY+RRoJdunOp79j8SPa3qgWVovX+eGBVcodRuIMa9TfcE5XHlX5N7GINmnrnMGqqEot0BTSEPpvSoS9/+6NC7Rt90VRWmi3HnyuQmKembHW0Xptc8Y5FcC4eI8jFY5mt1pFsv31MdasJeAceuULz3OQF1urI6IlAnA+9mvWZIWJNB7ud11ka1K2tvsTbldGmk5hGwgH+xG+HUvwZuL1WpmGvQ1s6mRr8L2iFnMiBjokSUY7QEnu9Maq2Zfru+8Vj/nO+1tAsFqf3HX1wtCZcxHTZQNhY/N/m37JQWKCv5odW8aJM5gGmJ+3xGCNETvGHoZjS0BeQOVScFwDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1pr+AughVy3N/2OS0bfGZ9qcKz0glZDOh4KbBDoNtU=;
 b=XxyqGdYD2hW8fwtF4wyNrPHmdvCUhFxuXQaomln+CyICNxGCMrcvKhhUSw/qX0QFdBqKmAInFX8Cx2S/i9pJ/tB7lUsVF6XS51o1CCcq8U6Ln2Oi+egNDXw6ZY5qrjDvj55xRpkLaNc7vSkvZEWe5OZKakL1qPOqBkjkaPaKZmFUcQ9490uyNsDIOPmHQAJBhtPCEap17sV0p+7s+JludWfAPaBlL79wHCUCqsjl025lpcYzUXkRl/lS3Pb5umdWol67uIEW3kxCWgCTHuuQA+3oEpk33uSMJX9Xph8jyaxthg7sW4RFL4+s935TzsiOBTELXHTT7A2poYWr96ZqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 18:10:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 18:10:34 +0000
Date: Fri, 8 Nov 2024 12:10:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
Message-ID: <ksp4ideuvyl2az5oxbuj5v3wqizuarbxst6nwl3bxdgkixe64b@gn2nstrqo2er>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
 <20241108053318.3483678-4-lucas.demarchi@intel.com>
 <CH0PR11MB5444C31DF9750D8C0C9C5863E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444C31DF9750D8C0C9C5863E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cd2f01-b0c0-4c3c-13b3-08dd0020a3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ts50SpAY2NXvjso6P6AJfnbyOw+i/C02vbQVmsibSFfpqKhxAkoYSPgAfMm?=
 =?us-ascii?Q?jycdd7boBCmcsXbQWiav7fgS9sGxiSGeBLLmmkBW/gTvGs7m8f9HM+78qkja?=
 =?us-ascii?Q?8kgUYNDmyNICVw7iA7Fx/jFZRPcmEaxFyv72AH5uHDNuz6XVTkq4FJfz4hMy?=
 =?us-ascii?Q?hipbjDoJ2w3I1k/Hz0Vm2YxmNAainLI5OkWujrQKt/nI0kRaKOZ6X0LR6xk+?=
 =?us-ascii?Q?JLr6l3q1AxeTUIXg52DPGr3S7gk3hxPwsi3mXYn+ovbTWnHmyusZ5MAo77AW?=
 =?us-ascii?Q?uyOkoAVsVbgJq/wTiapZ7jYowq0ULcsox1D9wR8bbWYuux/H10w8dQWrkQWR?=
 =?us-ascii?Q?BOFhWVJbtfUNvrUkpPxy3EqDV9JP6sUn2Erq0UO0y4bM4aY4hiYg8VGwRuca?=
 =?us-ascii?Q?KqpJaa7zIUid75poABGK1fqJRjBk8hP2XZuvML93ZZltgKq9+d75TkLr0ch9?=
 =?us-ascii?Q?CBneZ6ql2B+IHqZaLFaF/EwvwyrpbTMr4aqdguEO6D5WGOsm0oDOIf6i2z0R?=
 =?us-ascii?Q?+zpYWelWWs5exnZrXbQjH5pHXRQTGKU3UkRqcKJUplkMvkFL9NH27qtmiqCz?=
 =?us-ascii?Q?F7rUWBZlmw0v/zkaDy5LKBNKWstiI/ErdbYHkYirlPLSOjeBw0e8R71ksXvS?=
 =?us-ascii?Q?oTLrPCX1800lNIRJFxvazTa0vKNzjhzQlJh2aH+wkbA6gUbEJZs5vpz4pKIq?=
 =?us-ascii?Q?dZJronZWckKss90607xw8NTu7OMsCF6STYRV7I7DFZQOqV8JxbfjGE603I7A?=
 =?us-ascii?Q?RwFFf55lHoc7pMXFhaDGkb1Kuzz5Zy2D/TG97UZlqvxzZ7VdRELRanLw6Eb3?=
 =?us-ascii?Q?QtlAONCKukkwpshdzVZsZJfRFDZhJYP+Rf21DahWECUYm1lAy5PMy5sU/r2e?=
 =?us-ascii?Q?JFOpBiP4Hsp0Z6SM9fcmTEm0vht+HlYAYIwOm4LcFEU9c7hD/DlGM9A3yFk3?=
 =?us-ascii?Q?z1xUDtksgEf3+Fv7XlYuyITn2/ybR69i3xP11KjGz8xOLaI5V3hAxd5xpzc5?=
 =?us-ascii?Q?uWgvRWpCMQ5ExA3NqGgBEJQeeqzC/ugddOfnQ4wo3DoKBFAUgnZrYv/aAgOa?=
 =?us-ascii?Q?vCgiB/+WsgDLTqnVNRzIEqBNxN6EpkKJF+aJhg9Njjv+vIKIeutH+RFSlEac?=
 =?us-ascii?Q?tnY5nmdASRLNqGOTg0OiM9Ar7HPU8vtWoU7PN0lRha7GCd4zPyxWI6i9R+hN?=
 =?us-ascii?Q?XghQ+ctMkmxa5cfwQpM0mqJHVAONXB0RMGTDbAOTJqDZu14aOIYrmuj3G2Zb?=
 =?us-ascii?Q?M13w/y7+s/8le6IkgE5PgqSbnzaw92jdmpmyEmIkHRAjql2H32xSEzxtyrMg?=
 =?us-ascii?Q?t3H2y8JZJV/BXv0k8Hgl9WQL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JAZZXOiVv3lXu8wXFY0+4bxHNC2lGauGOhLlyH4gFz/njPIg6y/rGaLBz47Q?=
 =?us-ascii?Q?0nQ/tt1a209gBaIgaDI/9pMWVF5WuS8jAOyC0pD2qk+vOOTDdzpPTipDdQ2V?=
 =?us-ascii?Q?afFcRlnOUVkORi8AWXEYFzMHjEr7Pvyg0rNytbsUJaL0aNsljXG5+avOvswk?=
 =?us-ascii?Q?PYioArXXM46ymh2cSbPsURZI66EXtdjL0WlEG1Fy/6PuJsu1CCvm6/MKPpxg?=
 =?us-ascii?Q?EzDkklarhjuxHBp2u2/HH5WrxDG7+rwOEsdCZ8fb9fV/bci2j7xonYH4HCxl?=
 =?us-ascii?Q?zq6WtuUEtDoqckoltgwMUrH+/SSppStAO3HO8jMkAVF50IkSQnBko5IapplA?=
 =?us-ascii?Q?2IHKbrBZ+Hd4ktTbi+xzHJt2W7ArFV/8dVDqljjGfJVgto+cpbiKfflnWZtA?=
 =?us-ascii?Q?FVrk9TahPBm1R1AndFsGAy8LgF16BkfRVLA42/O2e7I36i5wGrdzVpJp9/Ih?=
 =?us-ascii?Q?HyW8mbbbClH0IgNBd4GID9WtXRc+UeoII78pn9DOjpdwVSCKVQkL6hoMJUDv?=
 =?us-ascii?Q?z6P7EcukE6t66xuXY1vQw+Zes+MwnsmJ6SUVQDiqvMZNQNgJj2W83QuZbCUa?=
 =?us-ascii?Q?iTf9R4lGQgpxhxIuq1qc8o65c1sOXozVQmUlYFAbNOS3yZ4CtfF1UQI2IMrS?=
 =?us-ascii?Q?xpaNvsnaVTgrLjXEoj4ucPREcmi+rQ65Bv0vUs3J9UsAIMyHLlmNRcmI5W5t?=
 =?us-ascii?Q?lwixlahVOih1rEW5VMhdwjs8f+Bh15eOyuMT7kjXjcZyHpMF0rO+0nCVCjf2?=
 =?us-ascii?Q?e5JKsWin2KgxOAGJ4Hxun1z635zS1I7R5JWGJjygxUIpJifRYM4BSxpjyzqc?=
 =?us-ascii?Q?F8xSbtc94j9uZPbdTWxRcEURXtOiXDPoAsDgJUGQpanmxvhL4JcIqICEOeGA?=
 =?us-ascii?Q?CQah5gJI3ocjXxdgQrXYk0WYDlEDXcttPUFAGcnIW3txF/zzD4Eq+fZqJ8kA?=
 =?us-ascii?Q?7OHbOZvTty+yaH3SxVZrJlfcZcDBGQ0yxu2U3otPHwDkzq7ARrKKlbtl6HFu?=
 =?us-ascii?Q?SNH8Dxa+H+UjT/jc0szHNmbrf4EdAKf7ISuYsz3+ds2aQzbLTyRCLLUzYaFj?=
 =?us-ascii?Q?IGZ1MAG9XLnjcO8Zb32h8V3vRkAj1yvsTR2Bly/IigXSzwpoRM2tjESvQgQS?=
 =?us-ascii?Q?Pva+gDxY1Lw9AQOSp2mdsShCorw8YQg/1rKFO+USIVUFNUrKKWksWNd1zyzB?=
 =?us-ascii?Q?dknkD3b7ST5RrMnYObW7SXwzM64GCGr+kX51AdZQxTCDLaRK1IgWNuiyy2Oe?=
 =?us-ascii?Q?7SA0WLI25EnydH4uFKZMAi4B/zYxLsrrvo/eqzX324k13tARJ3iFz7coAy8L?=
 =?us-ascii?Q?ER56SixAgb/pCUDhrL0w/EZs4rn4uZqqENdfKpWwuIJOWDVm3tWLzVVCqusE?=
 =?us-ascii?Q?nsqTdwXyJ1BFRZgW2+lFF4xGA7a7TTzZj+RWnE7J4VFpvRNIvf+SCnQ7C7d7?=
 =?us-ascii?Q?ndz//3fKeyqv5fEYy9pzl7Kz9jYEqUWWzO1OmN2t8lGH79Gy048dm1UAvJBs?=
 =?us-ascii?Q?0br7iHqn1P1Vx2NBQdw74UCzh+Wu6KgfQvTRSzYd9CzYaEnyXCWT8kZlOf/H?=
 =?us-ascii?Q?G0yBfA1fbspkR4TdOJKDDQSW8AXZSumyS9ppZx20OvkaaaY2Q+ElxSFWQZZV?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cd2f01-b0c0-4c3c-13b3-08dd0020a3ba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 18:10:34.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMGPbRsMv4A5a2w4M4gJ1cqdk1Pmt+XObIT8ntG0Rqtie8jD2bYQ3SDC4ldpo7JRzQJenKwFcE0H10fPFomiKXHKMNR7fm7BJOfPxkZWNfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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

On Fri, Nov 08, 2024 at 03:26:35PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Thursday, November 7, 2024 9:33 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
>>
>> Cache the hwe used to read the timestamp so it doesn't need to be done
>> every time it's read.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I have some notes, but nothing worth blocking on.
>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

still not fully convinced about doing this when there's almost 0
performance impact. I will keep this out for now and measure things
again later with more time.


>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  2 ++
>>  drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
>>  drivers/gpu/drm/xe/xe_drm_client.c   | 10 ++++++++++
>>  drivers/gpu/drm/xe/xe_drm_client.h   |  2 ++
>>  4 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 0e2dd691bdae9..9668a60e3aeae 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -759,6 +759,8 @@ int xe_device_probe(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>
>> +	xe_drm_client_init(xe);
>> +
>>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>
>>  err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index fffbb7d1c40b4..f13b738ce77a8 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -34,6 +34,7 @@
>>
>>  struct xe_ggtt;
>>  struct xe_pat_ops;
>> +struct xe_hw_engine;
>>
>>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>>
>> @@ -509,6 +510,10 @@ struct xe_device {
>>  		int mode;
>>  	} wedged;
>>
>> +	struct {
>> +		struct xe_hw_engine *hwe;
>> +	} drm_client;
>> +
>>  #ifdef TEST_VM_OPS_ERROR
>>  	/**
>>  	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 298a587da7f17..125ee18ab9f1f 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -274,6 +274,9 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
>>  	struct xe_gt *gt;
>>  	unsigned long gt_id;
>>
>> +	if (xe->drm_client.hwe)
>> +		return xe->drm_client.hwe;
>> +
>>  	for_each_gt(gt, xe, gt_id) {
>>  		struct xe_hw_engine *hwe = xe_gt_any_hw_engine(gt);
>>
>> @@ -394,4 +397,11 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>  	show_meminfo(p, file);
>>  	show_run_ticks(p, file);
>>  }
>> +
>> +void xe_drm_client_init(struct xe_device *xe)
>> +{
>> +	xe->drm_client.hwe = NULL;
>> +	xe->drm_client.hwe = any_engine(xe);
>
>Two thoughts:
>
>1.
>I wonder if it would make sense for us to set xe->drm_client.hwe in any_engine, instead
>of as a separate assignment?  So, here we would call:
>
>"""
>void xe_drm_client_init(struct xe_device *xe)
>{
>	xe->drm_client.hwe = NULL;
>	any_engine(xe);

yes, that's possible but surprising for a function that in theory should
just lookup.


>}
>"""
>
>Then, in any_engine:
>
>"""
>static struct xe_hw_engine *any_engine(struct xe_device *xe)
>{
>	struct xe_gt *gt;
>	unsigned long gt_id;
>
>	if (xe->drm_client.hwe)
>		return xe->drm_client.hwe;
>
>	for_each_gt(gt, xe, gt_id) {
>		struct xe_hw_engine *hwe = xe_gt_any_hw_engine(gt);
>
>		if (hwe) {
>			xe->drm_client.hwe = hwe;
>			return hwe;
>		}
>	}
>
>	return NULL;
>}
>"""
>
>I can see why we might want to avoid doing something like this, but it's just a thought.

As said above, I will keep this out for now and think about improvements
here later. I've used both patterns in the past. Not decided here.

Lucas De Marchi

>
>2.
>I understand why drm_client.hwe needs to be assigned twice here (to avoid unassigned
>data comparison in any_engine call), but it still looks a bit strange at a glance.  It might
>almost make sense to restructure the xe->drm_client structure to have a separate "found"
>Boolean that can be set here:
>
>"""
>	struct {
>		bool found;
>		struct xe_hw_engine *hwe;
>	} drm_client;
>"""
>
>Then, in any_engine:
>
>"""
>	unsigned long gt_id;
>
>	if (xe->drm_client.found)
>		return xe->drm_client.hwe;
>
>...
>"""
>
>And finally, in xe_drm_client_init:
>
>"""
>void xe_drm_client_init(struct xe_device *xe)
>{
>	xe->drm_client.found = false;
>...
>"""
>
>-Jonathan Cavitt
>
>> +}
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
>> index a9649aa360110..5609fbd682650 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.h
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
>> @@ -16,6 +16,7 @@
>>  struct drm_file;
>>  struct drm_printer;
>>  struct xe_bo;
>> +struct xe_device;
>>
>>  struct xe_drm_client {
>>  	struct kref kref;
>> @@ -48,6 +49,7 @@ static inline void xe_drm_client_put(struct xe_drm_client *client)
>>  	kref_put(&client->kref, __xe_drm_client_free);
>>  }
>>
>> +void xe_drm_client_init(struct xe_device *xe);
>>  struct xe_drm_client *xe_drm_client_alloc(void);
>>  static inline struct xe_drm_client *
>>  xe_drm_client_get(struct xe_drm_client *client);
>> --
>> 2.47.0
>>
>>
