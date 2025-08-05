Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE61C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 05:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724410E24D;
	Tue,  5 Aug 2025 05:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQKOhqCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678310E24D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754371115; x=1785907115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HQo04mH5csAPNc1XtZcho0GUhIOhaAzJF/P4OaLDCrc=;
 b=DQKOhqCGNkGx9/TLRo2lzCSLWC5lq+JQhFARQp0ZBVCVnj1/5lfWX2tY
 4b07LtyVFDd+6bbdNxfIIZqP8TquJxRsLyy/kuMvWBcR9iPuYr3mlzF8x
 YYRAOYbGDXzvWA16MkBrII49JuDsJkrkmsJRwkUlWkgjYaDtgPcO3UK/C
 /s6zx35otbnkGsjFs+pz9nHbjTwebvenaJe0mQi5Hhvfd2RPpI2WS6x2N
 saPDnqlOtWQIM3WufCdc1Bx9LweTRi6tJnUJEoFPsEp1AUIl9AFkyWi9F
 Lxaq7ArEE5lKpC5Q3OGy0jQjNKTeGTwc3hDWn5e8aHyaxzzoPdPdyLoyb w==;
X-CSE-ConnectionGUID: +9j/hX3xRkCRk7zAhYPJew==
X-CSE-MsgGUID: f9vaqIYQRPucuM1FuU/iZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56791198"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56791198"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 22:15:42 -0700
X-CSE-ConnectionGUID: PZnCulwFTsG0xlCGPlcXnA==
X-CSE-MsgGUID: gW4yVVmMSI+02RqRjwKPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201544856"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 22:15:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 22:15:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 22:15:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 22:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+Do+3deAcOMgtBS9YBNx7ibxLL8AslLmyC2uh1FPheIPusonQLj8HGoVpWTomNmb8vAp4xN5ZdiAX7eddhFGfQhx7RRGenXx/Lf0qWyIXw0Zla4/gorbw8lTfPd4hsEa2CpliWhpVM+tw0NIlibS/oC3aWLhQ8ytjIDXuwkD5dum6UpvrxBN2+SxfvIlz43+b++8gSW5XQLKBWxAEcp4x/uq+yyxzi2XfSKs0lBWUrVouZ4PGtebyzzhIvzmWTd9fIMhmpTITO5FCLQNyE4/2ZZF4hwqv8zpZg7RlsQayQDsVg03LXK6W5KZvH8axUxK3+XWsiZPM89bTYF++CEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYFgN0GdGAQk9kEGHUfTvUX15jjxNZVspM85ivh/nY8=;
 b=XWdUfcE52912r9G0q3pTrfRM3kHiwz88o8EodFbpgrVXPXayh5HShejyQJxEJaN/OdCcymRKNg/9fXPejq2sXXvATTLIgILDiN83icBkSbZV9+Uzwrb4tay99U6DrwKKA/Tm5xlc5UOBeGJeeczuTKLiouVjJYGkYngVrJ7y+0+7369eKLJh3ueoNFo3ekmvqPRvi1FEV3GnUjlErmwDNTiGga17EZ6qJi9dX6W3y6WHSJuJthrikqgWYM5HRk64RnZII1bjvoVTxaXtqybcc3TpmkYuYXhP0brdhwHWhuQf1Zcar4hX41z0O+QZwACd8U/hLV7VJfFSOZH3muPiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.21; Tue, 5 Aug 2025 05:15:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 05:15:39 +0000
Message-ID: <76a0403e-c80a-4ce3-a5bd-2cc9ee7d6f82@intel.com>
Date: Tue, 5 Aug 2025 10:45:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add SW clamp for power limits writes
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250731193607.3067834-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250731193607.3067834-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0b42dc-2301-49c5-5e26-08ddd3df1e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXl4cEJHY28yOWxpL0Z4dGJ4NURoU1djTkV2L2dSQTM3OUZWdDBnRHZ2ajBM?=
 =?utf-8?B?QzZ3ckJaanphRlpROXFFdVhaOTNvcVcyb3ZxWWZjQ2lzQ093L3ljeVJVanZL?=
 =?utf-8?B?bkJnY2dHbE1mV21wSVM0a2E1RGxXcml2S1RSd2p4Q3I0aWNMWnUyVHdUNzMy?=
 =?utf-8?B?UEFsZEw2U0pZc1R5Mkk2ODNQd3QwcHlITERDaFRXNitEVVV2L1AvRzBnenJo?=
 =?utf-8?B?UE1WVkZEbng4aGwyVkVrZENINk5jNHRvTkl2NG5xekxQdmExMElPWEp5UXJT?=
 =?utf-8?B?NlRuMDhhaDJvMnc2aWU2aElxRFNSVjZoREVobVdZekRQZ1BjWEtMeWVSTnJn?=
 =?utf-8?B?bTVsSFpoUDJaSkw3Nm1YczlTWmhrWU9udkJ0RjcrK1poZkdqeEZYbkdaMHpi?=
 =?utf-8?B?UkMzcVJ4MkZ4UjFGWVVra1hHZ0JJOHV5WGdNRUxFY3YvS1RnckE1RkJOTTBk?=
 =?utf-8?B?OGpRbWRjRExOczRmRGprelhtMndMTFRwM3RRRWxWTEROT0srM3lxOU5VNXlD?=
 =?utf-8?B?MGZXNDg3UGJiT0oyZytQekR1dytMQnp1ZDlyMSs1ZWhaNm5NemtCRXh3S0RB?=
 =?utf-8?B?ZXNITmJXQ3RzZXJ1aDRhNVk4UHlLT3NJNDBUQ1VlaER2dHM5R3h0Vk5JQ3Nn?=
 =?utf-8?B?UDQ2SXVxVEF4NlRubEFXQmZmRDZCdDR5S0Y4MmZjZWlQZVBpME9FMVBSbXJ3?=
 =?utf-8?B?ZnhqRlRPdGhMQktIaVp3VmhVRHdjenZ5NUtYVnFoamdFMjhKTDM3bGlPTldt?=
 =?utf-8?B?ZUxrM0k2ZFFGMUFkekY1eDg2TzkxbFY1Wi9mQWQyTEdHUlptSEYrZy9hRTZp?=
 =?utf-8?B?elV2VnZKMm1lSTNmM21Ga2tZQnFaZTZjblU0Z0NZZG9iK2ZGUnYrWTVMTE8z?=
 =?utf-8?B?RTZ0Rkt0djNXSitxMUNFQjJiRTVvUHArV3M5SktBbXJjV0pMdWU5ckJEMm53?=
 =?utf-8?B?ZGNyRTlZUHYya1JMc2tiSjlmNnQzNlcyVXFrTGlGNlR3R1pUMXYvUHZpckpw?=
 =?utf-8?B?b1FEWFNMSmR1Z2QzWjdUWWZjQnd6dWJNVGRaWk1YM1l2WkhqOVZXdWRhR3FV?=
 =?utf-8?B?THhROEcyNS9vZVdNN05NMDN0eHdyd00xQnp4UnNkT1dnTFZkY0dvQzRIY1Bp?=
 =?utf-8?B?WXFLWUEyaEdrcTRvSkhKaEZQdHU4NlBsMThRNlRsV1NyOFZZZVgvZUJpeDBy?=
 =?utf-8?B?N0puWFlHQXIxWVVpS1ZtbVlVMldad2Jub1R2R1k4TlVIOG1FUlJ5YVdZVUFT?=
 =?utf-8?B?eThxc2RFdm5wT3lsbXFIUEJocUp4b2ZscEVnWUM5VHVhUG5XK0twN1NsdnN3?=
 =?utf-8?B?R3NFM1BTTTJYNFNrMmhIaGt2elVmZk1XbWVkbkJDQlJlYUVJcU1NclBtUmxI?=
 =?utf-8?B?TVE3cUh4cU5Fb3BSY1pMV2xjQm1IdFJ3cmUwMHpLenNjeFF5VDdZb3FTWjEr?=
 =?utf-8?B?cFpYZWZrTkY4UHNuL09DRkVTc01MWldIczdrdURwQ3BUeFBQMTI2R2dnODM5?=
 =?utf-8?B?djVzRHYyd0lvMjNqM0RQUnJDMDduMUlUYWpzRFdIdTBBQUNvbDUxcWoreWNu?=
 =?utf-8?B?S0dMZzU1NWpNd2ljTFlXMytVanV2Wkw3emF1VjNweWRhY25vOFFFVGsrNG5y?=
 =?utf-8?B?bkpaenBKbW1DSDZvMVpuWTN6RmMxNDVxTHhGSVREc2daelF2QzNLMEVEN1pU?=
 =?utf-8?B?L1lOamdvekgzTWY4YSthdEFSb1c1am5PYzZ5a09jcFhUcTVEZFZObmtRNEUy?=
 =?utf-8?B?SGl3Z214NlBRUGF2V0c1TmU0elUvTCt3M0hRSmxBZkN1RCtYSEszYnpmK1hY?=
 =?utf-8?B?a1NQMzZHMnNJc1MvVmN1TzhhM1FuOFU2RUdlT2N4bHEwVVNxT3FEYWRXS2Y4?=
 =?utf-8?B?RFgrbEhXNHNoZ21xanppRHVYRTRiQVplRFg4ZG1YRm1LdVlndmlGRENMa1ky?=
 =?utf-8?Q?rulmHpe469I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDIzRWorNndNOEZIeGJuaWp6TUVqQUU0M1hBU25yVmhJZXJYZ0hIUi9xTXcz?=
 =?utf-8?B?ZzhPbGFseXJ6MWs3aG1saHFTV2JyUGhwdTZZTElseUFnVlpsYTdodW55bEpi?=
 =?utf-8?B?bGhIZE9BVm8xcTZQOERtZDZhcUNBSnJHMTVUVXYyMndNdVVub2NsTm5yMXdI?=
 =?utf-8?B?NEltNkVyWERDTXRNYytHS1lzTDR5MkVRRDQwVWJjWUlxVWJFWGdTcWRMbktw?=
 =?utf-8?B?Z3pEZFRpbDBlTXd5ODdNak1GbVBDdlhjYkV4ajRJWnNaV0NSNE92RmdlakRi?=
 =?utf-8?B?dVNpYjN2WjlCRjVtRGMyRzdzYzM0b0FqUVdtS3BId3RlcjlsZGhVdGxYVnVB?=
 =?utf-8?B?Y3N2Y2JqY2hFK3VnMllzT2todlM1cGFkRDhuRWEwQjhNVmY0UnR1cnd0cVFG?=
 =?utf-8?B?YTVEMHJ0bmtWWFByYnlJbWV1V244d1BkTWdWV09iS2RoTVpmZVdBeEtWWmtZ?=
 =?utf-8?B?c1VsUDZBTldESGdaSlNvRVJnK2dKZDV6c2VYa0JlYXdCTUZpOURMaXJHY091?=
 =?utf-8?B?d1BZY3V5V3dDbGJwcmlPUmNtcEkxRDIxUVBoSTIvVDhuTkZjbXZsbnl0U3Bv?=
 =?utf-8?B?QzFHWStaL0Z2UktDaVliZHo2Yzd4dFlSMzlZZU50Q01tZnQ1TVFyWFdkNGJE?=
 =?utf-8?B?bWE2bmtyTk5HaHlORzFBWU1Nald6bkJkWjRTd1M5MFFkSW85Y1EreWpBWmRE?=
 =?utf-8?B?bUQ3Z2FRbGx4b3NCdnBHQzZ0Z1J6RG81d3ZkYjIrWGUwbVpaekl1V0xSckpD?=
 =?utf-8?B?eXZiczY0UkV3bkVJRlVncUw0SXVsVkw4RHo5K3UyVFB2SkZqV20wUkhLL1Bi?=
 =?utf-8?B?VnVXZWFMRlZPYXFJT01Zdm1zbEJCamM1SjM4UWNxOS84UG4vVmtBaGM0Y2ZF?=
 =?utf-8?B?NzRadEJnRyt0em10WGdIeEZkVVRwUW8rVEdhMndtdDg4K1JjT0FoYitETlZs?=
 =?utf-8?B?S0ZtWXZVUlNzc3oxUFNhTDRMU3BYanE0cW1tQjJKLzFITHhKaFB0dFBEL21L?=
 =?utf-8?B?a2ptZlVoOThPK0lFNHVBcWJLa200M2ZZbi9MNEhIakFPUCtMWEJWcmZlM3po?=
 =?utf-8?B?MlFTODBLTkNQRXJJNE9TZkI0WVhrb1QyK1ZacjFtTjZoNzdlZ0xuUFZQaTRr?=
 =?utf-8?B?VFNlK3hwQjQzSmJRNG5xSXh1VXV0UTRwdHNudTQ4SjF1ZFllVWtmVVlMdUtD?=
 =?utf-8?B?UnB1bEVqaWdmT0h0Y21ZQndkZmk5NzJVdytwa0t3bVZBRnNUeEFRTmlCUHFk?=
 =?utf-8?B?R05RRjZmREQ5bENVYXFTdm45aXVoT2lheGpvc0FGdlhuYk1wUEhTekJJdmpK?=
 =?utf-8?B?emtJWVRzWUM4SFBabVhLeG44M3ZNQkNldTdiTHVBNjZGKzVEaXYzU2YyU0xU?=
 =?utf-8?B?L0d1dysrV2xWTityVmxkUVNpSk9BaVpVclBvNGxmV2M2T293alViODhQbzZO?=
 =?utf-8?B?aS9JaVc4SXVCV3dXSm5pTEs0S0tRMHE1Nk10c2ZFZ3dNTm1ZWHJmOElGZ1ZV?=
 =?utf-8?B?cFl1ZlVPSFc0elRMb2M5VXR2dUl0MUpKdjBNRzdKQ2RlMTlLekhJdHJBOWp3?=
 =?utf-8?B?VkxmeXhqZThZMTNZUWNSR1hOd3NWdlFJclVuRUc3bG5URFNoUlc2Vjd6cWQ2?=
 =?utf-8?B?VjJpM0gxWDhaRlg1L1Y1RTgya3J2bDZ6YmtuUm9lVXQxbGtEa3JkRzFjVzhV?=
 =?utf-8?B?Wis3RXlDclBzSk56YkZ3L2tiTThBRVRjQmxkVHdmWTVzWnJqc2F3TmY0cDBQ?=
 =?utf-8?B?cjJEYzZ3SDFZRUFkeUs5QXA3U2cyU0l1WFp5dlp4bjNZY1krejFhbEdpTHFS?=
 =?utf-8?B?bTIvZGYzemRNd3VUcmNCeUsvWDAzb0gvSEFXRDBydHVGOW9GYTJud2lKVXIx?=
 =?utf-8?B?cXBUWnBTQXhhWkRteHBTcHlsU1liWVc1TFJDNzBNeHpTTkJBYmdJajFtT000?=
 =?utf-8?B?QTlwTjlQWVQxVCtDNlppdDBXMWJpS0tUeDUxMVVyQzlBc2UwdVFlcmJQZ0FQ?=
 =?utf-8?B?WWxvWW9PWGZtcXFlYzRRYnBXN3J5RlpQWG9uaVRKSG1oZTdVNFR0bXpzSjlK?=
 =?utf-8?B?WjhNWHNVUFBablVISWxhc2JvYTk2SExKSnEvK2NwalR4VVZ1TjFrUEVKUDBC?=
 =?utf-8?Q?IE0tymsZ9EpK/pbXkMpBeAP3Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0b42dc-2301-49c5-5e26-08ddd3df1e2b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 05:15:39.5290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knSt0S9fmJir54Owy1JWhbthjlSoNk4bnYdxbNlXhbWFv6K6sG0wIFxnT01cPxE1+BJRy7CZc7EGDu/GzKeVAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
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

Hi Karthik

On 8/1/2025 1:06 AM, Karthik Poosa wrote:
> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
> powerX_max, to the maximum supported by the pcode mailbox
> when sysfs-provided values exceed this limit.
> Although the pcode already performs clamping, values beyond the pcode
> mailbox's supported range get truncated, leading to incorrect
> critical power settings.
> This patch ensures proper clamping to prevent such truncation.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..6f56f9192c6b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -356,6 +356,15 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   		goto unlock;
>   	}
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
> +	 * max supported value, clamp it to the command's max (U12.3 format) to avoid
> +	 * truncation during reg_val calculation below and ensure the valid power limit is sent for
> +	 * pcode which would clamp it to card-supported value.
> +	 */

Split into two sentences

> +	if (value > (((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER))

Follow same format in both checks. Use a local variable for readability 
and add a log
> +		value = (((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER);
> +
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>   
> @@ -739,9 +748,22 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>   {
>   	int ret;
>   	u32 uval;
> +	unsigned long max_crit_power_curr = 0;

u64 should be enough ?

Thanks
Riana >
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd POWER_SETUP_SUBCOMMAND_WRITE_I1
> +	 * max supported value, clamp it to the command's max (U10.6 format) to avoid
> +	 * truncation during uval calculation below and ensure the valid power limit is sent for
> +	 * pcode which would clamp it to card-supported value.
> +	 */
> +	max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> POWER_SETUP_I1_SHIFT) * scale_factor;
> +	if (value > max_crit_power_curr) {
> +		value = max_crit_power_curr;
> +		drm_dbg(&hwmon->xe->drm,
> +			"Clamping critical power/curr to max supported\n");
> +	}
>   	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
>   	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
>   

