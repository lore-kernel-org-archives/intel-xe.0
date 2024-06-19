Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805E2C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 20:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE25810E153;
	Wed, 19 Jun 2024 20:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxs/wpZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4812210E153
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718827504; x=1750363504;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zb2AAU/T/lFufTgV4cDs+Zd/Ur8jnWzM5tJuxz90Ik8=;
 b=mxs/wpZPp8Zgwo2MffiZvk5hnlkmlQsNlX3mhreSW6pjBrDZFiBHQ/Z3
 VkkOmiFwLsoS4UngeeiZ2IvZ4kcBZEvbHYi4TVQ8e/lxi+nD/M4fSVy+0
 z//VJV4QHpVcf4hU3v+9LVhWNVoteBP/RmlO3/HczSgZ2SKEirYRrUHqi
 HPWE2cKseOy6qICZL474ceZS3UVYDrkxkcX/ur6KKfGeRaf5avP07wwSb
 uxPgCGUjJIledPtWoL1U2HePlMIfDIjBnibzXt+QC2vG28Yat/0kiijRI
 UBJogxjSVdpQoC1hjwJ9pgcrQy6rq54HPatuCeOM5C370d7PJWO+KprSy Q==;
X-CSE-ConnectionGUID: 0wpJ63gcRWGjnLGV0kEENw==
X-CSE-MsgGUID: CMmiELGKTqq0VdnadA/94A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15656563"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15656563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 13:05:04 -0700
X-CSE-ConnectionGUID: OaPZK88OQi+hq/mwJRVLxQ==
X-CSE-MsgGUID: INkLLu5SRHG+WqcRo4hVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42477278"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 13:05:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 13:05:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 13:05:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 13:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOykWj4iFHHbiYcuRnBktQbryagMBtuCUNCh4yw7PbYehExH5lkzQ6Ki3lwYIXbDUs3LGSO1ka4SjlLDUWi1YgxXDRHAezM3wjP0JyHs8rqur1j2hJv7jgxRMQN2BRP/TDIktL6idJvBsoI2WkMfyE/+rPVF+Wrv0SwA3V4OI+ToTOSEJnFXrvvNzqgs/I4QpR3NAhsOH4Q34Gp8bvTdtOry6NdPBpbbr/13IcR88foLqm4hrVJslWkiYzn7+uYLDZS+vFRcmHm7VVKd5NxOLUN4T+tZ6V57DojoAdYTJ2FMl4kPFt+NHOLRpm4nLE8Y0ed25TP3xYBxWyZ0rjd/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awm0yfFk5l0DvhdJCMt8ES2mUgq4x5XuK9/mjblv0go=;
 b=RsYPqOgaPKHG7LqMBm1dmhek5Cks0ISUQHdTFb5MIl0UvhBfBPBiX4+zzojtGmBDdT/xCEG8CLEpQ/4pxhssXSgWuaT2jlEvXhIat7LEwc6H/gNWWoUknLx6PlQxmNmRso/610tqKnwxNo1rKiGe4g99SeHZAnDhzB79i650l+CDnyo0dGth97Ihr5Yt1w3xsb04H1G4gcYRel1UijCM//JFPzrlOu0+CqWAhyP29B+pZMwPYxBOYXKpMaVP6+u+mKYwlMrR4HK7t7ft3y22gOR2xzB8IdzQGd8lbIhjB0A0YZXIV2S+v0zFZaZR6URF5GuNLA/VSpB+vvozOtF/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 20:05:00 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 20:04:59 +0000
Message-ID: <1ae38ea5-f95b-48b2-b7f9-a98b1e8be3b7@intel.com>
Date: Wed, 19 Jun 2024 16:04:56 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v9 4/4] drm/xe/guc: Extract GuC capture lists to register
 snapshot
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-5-zhanjun.dong@intel.com>
 <16fc6a09-dc8f-49ff-a0a3-6abf49a81c94@intel.com>
Content-Language: en-US
In-Reply-To: <16fc6a09-dc8f-49ff-a0a3-6abf49a81c94@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 246a4fd9-fc8c-4b75-ca77-08dc909b1936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJsSGJsMGVHRHhaaFBQRGZFRFNNenVoVDdSVlhlRnFjbVF1dWJPN1Y4RDFK?=
 =?utf-8?B?b1JvQlRSWHBNVEk5UWxxTTB1QlNwTWVuYU5XWmN1aEp2cUM3K0tnVDJ0ektC?=
 =?utf-8?B?ODViZzNvU3FjUDRSaFk1V24wMXVrY0lvNkEvYU0rSzVyK2xOcnFNNGM4a1Ju?=
 =?utf-8?B?V0FIN2xYeVRvVzF6NnhDSXB1Z0VqMjdReStoeDRhV0JyWG1ZYkNwQmNpSlQ5?=
 =?utf-8?B?bXZOUjIzaXBUcFZHUlhqcWtaamlORjVlV0NBUjcyRXRDOVhpWWxtRGcxYmJD?=
 =?utf-8?B?MUNqVXlVRndBajhEVC9EczRJcnpURUIrVC9TeEFLeS9wVTB3cmhidmE0TkdN?=
 =?utf-8?B?TGJpeVpJNVNFQk5HUUxvNk1KOWZZcHNzNlVYd011RWRIOWlBQmh1UjhHRVVa?=
 =?utf-8?B?aEVuYVFyV1FISjVlTzhTcHR5K2wwQkJnaEtwdjJCVDh1dEF3NnpWOUhrWWZV?=
 =?utf-8?B?S0ZROFVhVk1LTEZubEtzaWV6OEhXZ042WlVNRXplTUdIck1TcUFKR0llMzgv?=
 =?utf-8?B?Rm5vd1pkLzRVSXBJRCtyWVBWa0lFQ0tabDNSZU10V2kvTjArb3BGUDFyN1VM?=
 =?utf-8?B?eER3YURmbEVDamF0UFRmWmM5ODkzZEY5Qzd4bkcyazVyQzJXUXRocjY5cVNz?=
 =?utf-8?B?bGNnY3dxREwzYmo1c3gvQlFkbERNUlJnY0syNXFnR25kcCtOUyt2OWJMUWJK?=
 =?utf-8?B?aFhaZWFqNktPNlJSSWdpcjI2WkZOazIvRlpjRzhFeExjdDFpWVF6TlpoTVBU?=
 =?utf-8?B?cXd4Zmt3SHpsNExlTVdIaVRJM1FzRjJPTUE0dlQzL28yOGR1cG5saWQySlBZ?=
 =?utf-8?B?N3ZheVZZMUVJYno0b0R1cHYyOHpSd2dtY3N0UHRDSEFYMHloS0xJVzgzWmU5?=
 =?utf-8?B?NXhrQ0kyRjdQOGQ5SnpNeEVlTnlVNjMzcnBZbFk0TlRnT0RjVHo1YnpCYk1O?=
 =?utf-8?B?aXQzd3k1aE0vTnBYangzVERwRmtpcyt0VnpYQzVyckp5SVI5VEVraFdFOUhW?=
 =?utf-8?B?Z053cGE0WlpFcmNRZzlMT1pkMGlEVTlmVEFFRjVBeVpCU0twTmZlSHUwaTNo?=
 =?utf-8?B?bzh3SzVoUk8vZ0hXT0xEZUV1WlhoT3VjNXdROVhsNnFGWlBOU3czcWhzQXpq?=
 =?utf-8?B?MlA0cUN4Yzc4TkxZMU1WK1N2dm9qWXFyZk1VY2lQVnNiWnc0NjVITWtDTGZ3?=
 =?utf-8?B?a2NSTkNyeUZYWDJvaFpqKzNoS29YTzgvVDRYMWliaEIrMkFacXEvR05Wdy9p?=
 =?utf-8?B?QlJLWlp1MmpqK1RoZEE1QjZLcXhYT2w0cGY5aUpXNzBJOTdDUUtITzN3Und0?=
 =?utf-8?B?Z2luc0J5S2ZsNlZ3UlJzalBkTnIvNXVaQW5rZWVKMEQrSlFVY1VkeXdtdWl0?=
 =?utf-8?B?MTZ5ODlBenkxM3VBUU5uRGlVbW5aMjZ0U1JDZE4zZ29NTnlXUmpsSElyL0JD?=
 =?utf-8?B?M1B2WnNTd01qVHIxdmFVcVRGUGMwdXFLT2NWZW5XZDlFWVBVU2JjUm5IS21n?=
 =?utf-8?B?ejY2VkRRVGljVjJ0bXFITmVqeVdLQXp2citOY0I3OGZkN0piN2hlT0NlN0tO?=
 =?utf-8?B?WWgvZVFXR1FGbVZKVjJQMW5KY2pxekU5Lzg5L2d6ZklLQkJ3cjdxNHFZbEVQ?=
 =?utf-8?B?MnozT0ExZUFpYnFTZk1WZGlXNmQ0T3NrMWpjNUhQaFIyYTFqMk5zR3ZnYnFl?=
 =?utf-8?B?VFNIWHNnb1F5L0RkLzhyUWN2UUFZK0RFMGhwTENwUFVpTTlyYVZINTBmM0xE?=
 =?utf-8?Q?X/i467NwThSwF5kVIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1FaM2t3eFpBRGZxZUpvT2pOUUZMZDVMVlEyVUREc1lPaHhQek9NUHYxZ1lE?=
 =?utf-8?B?aUJFZ3FwUTYrNjJoUHNXRzAzWjlFREQ2SERjUVFSS0tMZTNyQkoxbkJHS3ZY?=
 =?utf-8?B?ODV6dTV0RnNmeVRNNmJOR3RuM3ZwSC9zb2k4WFhUUmNaSTdrUzdmQzJLeTBJ?=
 =?utf-8?B?RU5pRExMdXFPZVJ6U0ZsVWVjWDhNVkpzTjM5TFdrTkljdlpnN1NpOW83Tkw0?=
 =?utf-8?B?UTB4Zld5ajN1MFJJTG1DblVhSTg1TzdObFlFeEF5Z21OWitrWVdKbVU5R1N2?=
 =?utf-8?B?R1JmbHhGTm9hVDBVVEtNMVRuQlprTitkbzZUNUJBRzZsSFJFc3NVWVFWSnJG?=
 =?utf-8?B?elFjd2dDdWI5SGVvTDRGSnZOblVidnhLOUI0bVI2Q0JXZndzR3kyOUZQZG9G?=
 =?utf-8?B?a2Z5RWVkV3hXQmxyaVVYK2ZBT3dlRmtLRmFYSnNFNUFScVhBUGpkeGdXTHlS?=
 =?utf-8?B?bERvTUlzOTlxQ0d2czJZYi9TR0NYSlloQi9oWnIvcVVMU3l3a0htY0ZSZ0ds?=
 =?utf-8?B?RGNaUXoxbHljRXBBZEdoQldMT1drSERSNVU4NmErTzl2cmFUemNZaHJ1aVJy?=
 =?utf-8?B?OFlaL08zWk1HWTRwdGxPVlJvUkxIMTRuQ3NTRGpVNTRFaVdzYWZITEVPRUs5?=
 =?utf-8?B?V0xicStpbnpjZHRHRXJNV0lHSDhXeWxaQlYwc1A5QVJuZWlGUWpFcmZpQ0lR?=
 =?utf-8?B?T3pMeTlYRkJhN3JpZU93UVZYQkxaOTZnU1Z2ZTRmUHMzL3ZMZlc3bHkxUVRr?=
 =?utf-8?B?a0xUbnBsaXdQY1RKMXI5M1B0T0VmUHh0cDcwaGJoRVAzUE9kU0RHWUltc0RO?=
 =?utf-8?B?WldiNG1pQk1zRGVETFNhQkw5T0VDVFRwTWRqdkJBLy95cmU2K012d3lRVmJ6?=
 =?utf-8?B?NENpbVl3ZnVBVlpDWFVwRUNseTA3VnFLTGxiWFl1S1UrU3NFd0FNd3RudFZm?=
 =?utf-8?B?ZWNUYjVrZ21SZURKSm1UeUVIdzJhcEg5L2FUM01EUDZsYkxvNmRXTEg1MW1S?=
 =?utf-8?B?d0xVSkg0ZlpuREZ4K0xxcG8rRTgyVFpOU05maUFtdk5FeVlOanZwcTdYUnEv?=
 =?utf-8?B?THU1b2lnclZEWC9PQjdSY08rbFNsNTVUbEJYa0EwbGRaRnNSelF2WE5RSENG?=
 =?utf-8?B?Y0RRbXVLamhLMm0vTmprWmhFdU1NNm96UjVOaURjY1l6QWRFYTR0RVd6TDNI?=
 =?utf-8?B?UTdERWdEYno1a1dRYkFSMDM4R2l4dVpFb2pRK3I1UzRzTVdqZkpzUlVUcjNX?=
 =?utf-8?B?djROa2VRS2pCZ0t1TkJVTDlDeXhZYUVWV1d6MG5wKzhDZC9zeHlJcENHcVVQ?=
 =?utf-8?B?bkJOdEVaOVpwVmdvOTlKZlMwb1ZaTXZ1UTBCdVdJTzV3SVI3aFJDTjBFQzNp?=
 =?utf-8?B?Mm5na1VpdnQxUzhEbS9WUTdSSjlqdTlrOWxWQWQvMHRGYzRrbUJzNXk1Mjk0?=
 =?utf-8?B?a2dqbDhVcnYzODlZQTY5Z00rTUFsbTNTeHk0VHE0dDFWQkEwOUYreGJ2c243?=
 =?utf-8?B?Z2dmYU9pWEpLYjRoRjZYamRTckZieFlrWTBGWUpwbk12VFdLajE3NWhaZEdE?=
 =?utf-8?B?L2NFZUVLdk9zOGU0ck9oMVc3V0wzVmpaVVQxR2JqUStxV3M5UEF0YVFFMzVO?=
 =?utf-8?B?WnpoZnR3Z1lLdStjNEt1Q29vS3dub250NW9nU2xTd2lhRS9GbHl0NjF5eFh2?=
 =?utf-8?B?SENtZytKdmp5dzJ3VmdsT3UyNUlCYUtIZkNOdlhlVHBEQTFuQjZ2Q0VHdldr?=
 =?utf-8?B?MjJrNVlFOFVTMFBmMVhLdS81Q3pZQVQ4Tm9SQkFUQkN1Sk5SMHVjS3J5V3RW?=
 =?utf-8?B?czY5NWoxTUVaaWpJck9TZy9IRTVWejRReUp0K2JXeW93SHpSdkdMenlmWTM4?=
 =?utf-8?B?cUJLMnNHTG82d2gyKzJILzhLRGxZQ1JnTXpFbjhmK3ZZODk4bkR2eGhIVG5G?=
 =?utf-8?B?ZGVKNmxSdTRja1lLQlBYU3JRMDFwbDNWSElkREtXdWNORkJGUThSWi96ZWgy?=
 =?utf-8?B?VzFsd0xUMTl0UGFWYlZ5aEY0bWZ6eVl5aUl5dEdTTDVmNW44UkhzSUVJTVZ2?=
 =?utf-8?B?dDY4TVN0Rk1tSEtPMHBnRXZlcXlWaUJNQ2JWTVFJeEdUYmZVNzFWYVo0cUdU?=
 =?utf-8?B?OEVyWmdlQUpueFhXQlBsenVjLzFqWEE4eHV0Qkd5aE15S05aL2dwMHNWZVNE?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246a4fd9-fc8c-4b75-ca77-08dc909b1936
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 20:04:59.8374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H65P4QFVevPagX5aZpkGfUMrowMORAiz4LUxpWMJF5gSlqbDnMMKs1prxU9onrEaxvF7IIpnHQLSs78xsJjPEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

Please see my comments inline below.

Zhanjun

On 2024-06-14 8:31 a.m., Michal Wajdeczko wrote:
...
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index ddfa855458ab..e1afda9070f4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -59,6 +59,29 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>>   	}
>>   }
>>   
>> +static inline u16 xe_guc_class_to_capture_class(uint class)
>> +{
>> +	switch (class) {
>> +	case GUC_RENDER_CLASS:
>> +	case GUC_COMPUTE_CLASS:
>> +		return GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE;
>> +	case GUC_GSC_OTHER_CLASS:
>> +		return GUC_CAPTURE_LIST_CLASS_GSC_OTHER;
>> +	case GUC_VIDEO_CLASS:
>> +	case GUC_VIDEOENHANCE_CLASS:
>> +	case GUC_BLITTER_CLASS:
>> +		return class;
>> +	default:
>> +		XE_WARN_ON(class);
>> +		return -1;
> 
> it doesn't look like a safe value nor that you handle it correctly

The converted class ID will be used to find the match class in the list 
and NOT be used as index of array, so the -1 for search is safe.

> 
>> +	}
>> +}
>> +
>> +static inline u16 xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
>> +{
>> +	return xe_guc_class_to_capture_class(xe_guc_class_to_capture_class(class));
> 
> are you sure this is correct ?
Oops, that's a bug. Thanks for point out.

...

>> +	/* Update the state of log buffer err-cap state */
>> +	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
>> +		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, read_ptr), u32,
>> +		  write_offset);
>> +	/* Clear the flush_to_file from local first, the local was loaded by above
>> +	 * xe_map_memcpy_from.
>> +	 */
>> +	log_buf_state_local.flush_to_file = 0;
>> +	/* Then write out the "updated local" through xe_map_wr() */
>> +	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
>> +		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, flags), u32,
>> +		  log_buf_state_local.flags);
>> +	__guc_capture_flushlog_complete(guc);
>> +}
>> +
> 
> public functions require kernel-doc
> 
>> +void xe_guc_capture_process(struct xe_guc *guc)
>> +{
>> +	if (guc->capture)
>> +		__guc_capture_process_output(guc);
>> +}
Will add

...

>>   	trace_xe_exec_queue_reset(q);
>>   
>>   	/*
>> @@ -1715,6 +1728,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	return 0;
>>   }
>>   
> 
> missing kerne-doc
Will add

> 
>> +int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 
> maybe this should be defined as xe_guc_capture_msg_handler() and placed
> in xe_guc_capture.c as it doesn't look that it needs anything from
> xe_guc_submit.c code
> 
>> +{
>> +	u32 status;
>> +
>> +	if (unlikely(len != 1)) {
> 
> magic "1"
Will changed to a macro define
> 
>> +		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
>> +		return -EPROTO;
>> +	}
>> +
>> +	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
>> +	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
>> +		xe_gt_warn(guc_to_gt(guc), "G2H-Error capture no space");
> 
> btw, is there anything to capture if GuC reported 'NOSPACE' ?

We have the gt_warn to warn it in dmesg, let user know what happens.
The next guc_capture_process will try to process whatever received.

...
