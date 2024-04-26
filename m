Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50577C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 14:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078C411247B;
	Fri, 26 Apr 2024 14:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOKP5jJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FD311247B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714142797; x=1745678797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=diseg/jHvSKKsZ/rPnHWBOiV8TwCRl7Xf2z7de+jJ/o=;
 b=hOKP5jJuyJaCjJFU/0ElWgTyhp7ofh8Ppc+zffGNXFzrd3f/brcNdQwk
 DfRuLDvzd2ymPqGBPZ29olVazHADq0U4H0tYxJbbKhl5DQbBMRKjogxSl
 tW+kcf/JkgiwiEc0JA3VzPi2+BudqTxeJBDeSJ91w3l+rc7LTfaqswKJ/
 z71Wj4niWsvTaKi6X3CwgEwuZPXJXl2M+3e9llVqgUE+KhjDL/z0RYHpN
 r7JwpL553NaRReoFAyrHRZ6NO8ksWq1r3in3gsrSNlZV6PfTUyGH+KXRx
 mfmZ6Z/a/Qur88TWm503WJUlXHS/CY2pirajWZAu4F4htV5gs6U+CPavk A==;
X-CSE-ConnectionGUID: vdjq7PtjREuI+iQe4mifgg==
X-CSE-MsgGUID: iS3rljLARy+C8U7Q8jkvhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27335160"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="27335160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 07:46:36 -0700
X-CSE-ConnectionGUID: 8gyexulCS+yKrK0YTTnsPg==
X-CSE-MsgGUID: /0Gx542ySzq429qrkMxmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="56364456"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 07:46:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 07:45:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 07:45:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 07:45:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 07:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht3NB59y9LU+QhdxxE+EKQ4o5+bfIqXpZ9/7+Y/duSqRmmRUOSudoFYm1biyotynlZHGrsT8BKXxgUejdOYIcAHLT9PmTHG/ZgJ1EyVH/PC1kDRKMwJWDgCN1vOnkQbTc4Oi+0UPjPDF5Q58JrEfhI+9GyaFlHTcUc0pTulhbCCL3zmwFR5hD7fjYqaw9tuL3nhgJeZT4r1TrBpqK7UBouysUWGUQcjbzi5vGGtsaYYgi9UdYPM5M5vH3RvtXp8Ay6nWbPbyFHvLRfcUTlXfUaXk8Gy6i6UG4uucGocQH5s+Q53lkVlafM3aHucalOvqU0cAJuF1TXwz4HpYvJiDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plaEjM9RoNUVpXuhDkV6bkkffGKzRlV9qcZetywLSDk=;
 b=fJpgW/6yJvjGOi5V4WWPxrIQp8XUmgo45iL45UxaoNRV1KFT65HZvJUzSMy7kAwBOGyQ++E4Q9hpaNJin9fzyiumB4YZXZOL60ZexlVV6Xp212KMn2WxfRsK5OWL2dtvvaRjBFPIbuIZQ+3ECw55qGAZyoMGT+4VYKJLP2/jpVoNVa0Y+ecbZ4jrvvWUxjSw97nRwNI2JI0QhiMzm9ueqJvCBvJuTDU81Egu+NorAJ79xDWHMery6gxlHOLX8SeFJMAcGHUBjAMHk3cSX4wDzx8g8YBNI0xIOaAuOk62AYYcgrgdeuhm36h+cyYXo/o1baflRUyroX3LhjKDFoDo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 14:45:34 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7519.020; Fri, 26 Apr 2024
 14:45:34 +0000
Message-ID: <fe7b8dc2-ab84-4777-91db-985bd622fab5@intel.com>
Date: Fri, 26 Apr 2024 10:45:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe: Drop useless forcewake get/put
To: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <michal.winiarski@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-3-lucas.demarchi@intel.com>
 <Zis5X3vPeUZqTnvO@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <Zis5X3vPeUZqTnvO@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 791b888d-5edf-4729-7096-08dc65ff8762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUhzL1c0eXg3MUVqa3FCVkxHdzN2eHh3NUZHL2lZU3hkMzRmazdBT2xVT3NO?=
 =?utf-8?B?c2dBME1ZSWlLWE5ZR3dGdW5JR0M4NDRWNmh5aFpGVUpDeFZFbWNSK2poekhY?=
 =?utf-8?B?blVvc3c5LzlUTjRxNHVDenhpR1lFUFpiM2dvSDlTT0JHVE1OWUFhM3pzMUlO?=
 =?utf-8?B?Q3hyS0tDS3piVEE1YkpTa3dmeGdBQTV1bjQ5N1ZDWU9FVDZHbDFwdVoyZjla?=
 =?utf-8?B?b2d6eDA1MXBNd1p4MkpPZlcwSFNjTHdxay9ZZys3TGwyOXhyZGhGTDJ1UDFT?=
 =?utf-8?B?ZEdkQjV6ellkWFFEZHFlT0pjL25qTUdEcHhoVWt6YjJ4NWg2d09ML1FTL3U2?=
 =?utf-8?B?NkRtbzRaamRTTEk0aytnZUoyZmxadlR4dUJBUGE3MVJwM25WS3pHUXNVcklz?=
 =?utf-8?B?d1RVZkVyaHFXOE1xenRHUDhLcFNQNHlLQVlsOVJpOWM1TW9zaXlORDZIOEJk?=
 =?utf-8?B?bC9mWnhEUW8rSXpaRE1MR3BoYTFWaUJRMS84dTgvZWF6c05FTm51VVc0VHRh?=
 =?utf-8?B?VXZFd1JhR25TTjVtTlByZnlxTmU4M3h1ZzVLL3pzQnREYTFJNWh1U1Jhc2R2?=
 =?utf-8?B?Q3ZCSW9MM1hsL3VqRjRiM3AzVFB0ZDE4TXY2UEREb0VLUWR6djc3MjlHUjRx?=
 =?utf-8?B?SVRrb0pYeGZPMTJmQm9nY1ZzZlI5aHFGekhWQzVJODBXb3J0dDFzZElGb1BR?=
 =?utf-8?B?aU05Z3kxYnpoeC9VT1pnMGRJUERhWTNYbzN1T1BIdmdiSngxVS9PWDZnbjM0?=
 =?utf-8?B?cmZBTk4yQmp5UmZEQ2lUS3hNc2NPOGlaa2RRa1lJZTJMbzF5WExYY3hFWVM2?=
 =?utf-8?B?bzZPNXZ5VUljSWJabE56dEtaQWxMRnIybUZXREh0RlEvRWZBTHdHQ2dta3Zh?=
 =?utf-8?B?RE9ydGora1VuQW9wdFVRVmwvN29GRnZPK2xuNSsvc2h1UGZpbEJUSEpxMnBY?=
 =?utf-8?B?dW91VjRRbnNZMmZBOC9QKzVYekUxNmRlZFNCNks1Y0ZoaHlSb1YxMFZHc0d1?=
 =?utf-8?B?a2g1OE1YQjlqL2tCUUsraEhwcjdHWHlRaXNnTlYrTmZNcDdEdVZOeW81ZDIz?=
 =?utf-8?B?Z2NRRnA3NnY4MyswN1A0bEpkeEFyZW1tcTZORDBjbWlib1VqM0ppM2I5YXpM?=
 =?utf-8?B?V25Kb2t1MktVa2ZLV1pJcVlFdWQ5andWU05FRmhDdmNSR0w5eWkxMXhzMVFx?=
 =?utf-8?B?azFmNW1jd3hYU09VYWczeGNIMllvWFNaUm45STJ6UzUwK0lTU2tjemM2SWFB?=
 =?utf-8?B?ZzA2aW5aWTFlK3F4SlFHUDNiOWhhSGl0djJTS2dSUE1zVEc4T2o5aVhHam9a?=
 =?utf-8?B?OUIrVTNycnQ2eU5IbDh0RHFlbk1tRGcrUU9nMWNMTmNqL1F0bDZzbVhjWUpx?=
 =?utf-8?B?RUl6S1V3ZWN1K1VYQVpyRXYxZHJuWXdJRmJpK2t3VWI0S0FXNU5SVXNOU1l2?=
 =?utf-8?B?K08zTFFoNW40bzB5elYrQTZOQ3ZuaWNWNEpiNFN2VTlVRUhIRnUveXp2S1N1?=
 =?utf-8?B?WVlLdXhiUkRjdGFtYzRDSmY3UWpqWG9EZEVCd3RxbktBU1dReHZpcDBTZll0?=
 =?utf-8?B?aTZ6Y1RhekFmdlR0QXlrWWZRRy93eU1QclAwcTZOTWhvVTFyQTV3alBqRmJx?=
 =?utf-8?B?QU1mRVJmaXY2OHVZVkFkamZMb3QwOG12ZEV5T2NrY25qY21jVktacExJZ3Zk?=
 =?utf-8?B?ai9wUXBXZnpRNGZvM0ZnOHI3K1RMVEcwaGZ1Qk5XelpvdzdRRXhxdUdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWZtbGREekh1cGl0THBuZ2kxZE8xbVdEb1BxSUVWa28zbytITVdKTGZwcFlV?=
 =?utf-8?B?UnZETjRnRjl4em9VdzdSQVU3eTdiSVlVVWxnbFVVVkNrRCtpVEVnQkFsOVhF?=
 =?utf-8?B?dW44MCtaRkJxNEF5VGoySlZqM3ZWbWtOdWhtc3pQV2JEVHY5NE5tSmFpYit2?=
 =?utf-8?B?Y3NsbHZueGxiUXB0YVdNNFFDUzlnTXpKNllkd0xNazhWQk9ndy9Vd1d2VGl3?=
 =?utf-8?B?M2hxRDZ4YVJpRnB4UFZ6OTI2RGx0Y1pTTmFvdlNMc05WMmwxRnZ3ZzAvSlNZ?=
 =?utf-8?B?ZW91d3V1M01SMXUzMTdXZnZkTGllYllNOXFwSUZtak9zTE54alU4UnNIZUVG?=
 =?utf-8?B?ZGg1Vkh1YTNTS004RlU2b2hvdGNURHFkMjBOTFN6YXRDT0NEa0xiQS9ZVG5z?=
 =?utf-8?B?ZTFVRktOYnVGTTIyYTBEQWRRcDBDbmloWkNtQUZOTW91emdPUDJuTWd5ZHNE?=
 =?utf-8?B?dDh5R3dBc0dQZXlOYUMzdHdHUzFQSno5blpFYjlVZDhCeE9XS041VGNrR2da?=
 =?utf-8?B?UkpaV1BYelg0Tlp0Z091UForRFZ3RjJFZ0d3TlhQY0tyUnJHR1IwWFRra24r?=
 =?utf-8?B?K1JCbnd2QTNMTFZSM3V6b2NrUUhlZEVMaXh4NXUvZ0N5M3ZTYmxtbkNkd1Fo?=
 =?utf-8?B?V2tvV01vdEhUakMrOTFWWEVTNkJRYWtvQTltU2hiTDY0RUl2aFcxeHlpYkk1?=
 =?utf-8?B?UWVpeHNlSVpwRS80VU9aNGh3ZCtaV1BrQzhwR1dXcjVEcFMvZHk1TVBiZW90?=
 =?utf-8?B?M3dLNGxScFpHWHNRMmZDaTBYVSt1SmZTc3RiWFdtRTJtOVZ1K0NjQWY4TmF1?=
 =?utf-8?B?Wm1EUnV1azhxNWpIYUFFeGNXNGpGVTduUVRMU1NNQkhZMU9oS3pxQ1RvcXVw?=
 =?utf-8?B?VVVtOUdWVlhCV0dIL25JY0tDOUxYcUUxV1doNnhTUkExQ05mWHNQN2VuSW85?=
 =?utf-8?B?L3FNUXBlVHB3WHFNZXVlcnRraEx2NzROZk50SGNsU3ptUHFRS0tSaS9jNHpM?=
 =?utf-8?B?YVhDQ2QyanU5N3NWSjBBbmxIRm5BcWF2WDRIOHpBRHUvcDljZ0UwUklLY0I3?=
 =?utf-8?B?VEVqbzlQbUpGWk1nNFkzaDltRjZ0dXlzQ2NPQWJDejZ3NitjZHR3bWduMnpn?=
 =?utf-8?B?dmpRd1M2V0VpdkdEb1JjRUgrcE1FbDg3bDJHRG1HelowTzJ5UGJsU3NQOEVH?=
 =?utf-8?B?YjZQai93bDdqSGZNZFVGcVF2VzdZVVdxWU5jb3ZzS3RHbjE5RE45dTY3VGp6?=
 =?utf-8?B?ZkcrWlBobnhyTC9TTzhxNWRnRUdacFpyZ3JkL09PcUljNFY3eGFlYW14OU43?=
 =?utf-8?B?VmovUEt5Z2xWSEhBSm81Z3hnNDZxdzBzZTllY242cXVhL3VEZ3BCOURnaEJN?=
 =?utf-8?B?NGg2ZFhMWmRVT1J5U2lWQ04rMi9EcmYvRW5UTUdLWE1mbk8vZld5Ujl6WWty?=
 =?utf-8?B?d2thdDdyTW5IaHFuTE03ZHZoZVB0VGlobU9BUFVWSysyN0U2dXlxKy9DMmRU?=
 =?utf-8?B?c1hrNUtTWTdrYW52S0FOVGFRaFhQd3MrejJVZFpULzlObTN2eFVQNzVkQTRm?=
 =?utf-8?B?dmtLQ3ZSUmFNdGY0ZkxaeUxmeTJuT0o4aXFnVWFnNThkR3VtY1VLQ1FIYnE5?=
 =?utf-8?B?UjdCN3MxNEJOZ0VzOUtKajRKdUFkRldSMTh4RVVLOTRMalNldk9FZmw2eUg0?=
 =?utf-8?B?RkluY3FMNlZlN0hVYldmYzdkNTFjWTdieU83WFZSR1pJbVlCOVl2amZCN0s1?=
 =?utf-8?B?V1JXREZ1VnlSVTJQSVJUdHFoMmd6eTNGTkM2QTZjUXVUVXFIMmdGNnJ5MDhu?=
 =?utf-8?B?UUs4Y3dZVHNoT2pNZHB2U2NhK3BKWkN6M3c3SUdEZGZXbzhkQ21GOUlpUWMz?=
 =?utf-8?B?SWdULzFHdUt2clIwQVQ2ZDFqdjg4TnBnVWU3UnhIWk1EeVJXZG53MEJlUW43?=
 =?utf-8?B?dnF6UmJBVThtVlZBSDlTYkRJdGNKTDZOSWpuTERwR2orcUxiR1phUkZnakVy?=
 =?utf-8?B?dVgyNFNyZHhOaUlEeGh2UmlSZ3g4ZDJCVGxmZHFnUjlMb0Zxa0VGbjhvNnhn?=
 =?utf-8?B?dWZUMHN5SitEQTZCUklkSE1WaDlDTjhjbmtSWGFkcUNId1hhdlkzbzNWd3lC?=
 =?utf-8?Q?zScxlu8R/UPbXrMyZ2Jwt2upW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 791b888d-5edf-4729-7096-08dc65ff8762
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 14:45:34.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTD6SqGAoOvjgoVH76mPCylU7ClDHybnqFoo1NWlIMf9oYJmqhlmhkDrdA7pQY/U8+Npc75ZUDSPF8SDVkBGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

Thanks for drop it.

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2024-04-26 1:19 a.m., Matthew Brost wrote:
> On Thu, Apr 25, 2024 at 11:24:07AM -0700, Lucas De Marchi wrote:
>> Forcewake used to be needed in xe_gt_init_early() since it was calling
>> xe_gt_topology_init(). That call was dropped in commit 4c47049d93b7
>> ("drm/xe/guc: Fix missing topology init"), but the forcewake calls were
>> left behind. Remove them.
>>
>> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 00a22cf2f5b5..805fd0acfc03 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -318,14 +318,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>>   			return err;
>>   	}
>>   
>> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> -	if (err)
>> -		return err;
>> -
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> -	if (err)
>> -		return err;
>> -
>>   	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>>   
>>   	err = xe_wa_init(gt);
>> -- 
>> 2.43.0
>>
