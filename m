Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A60C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 04:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5A10E6A6;
	Tue, 30 Apr 2024 04:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzthYKm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA14310E6A6
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 04:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714449647; x=1745985647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N3N5Ny1WnOyjtvbDQ/PRaq19WjuF7dQQUt+QNhqmDLM=;
 b=hzthYKm2tprEWfIls27Ozwnlmm1R8raihtVxQHdLPWFq7+SmlOKXw1rw
 0rhMv65vhu3CS1N6e1NEdPSD3XO+U6nzzbjFao8yrxcdxBYGTJkjtwFjh
 bzjBs6erPWgEhSIH+YhdH6t19ekQjGf2mUX+CfUn6se+XgoaHSKReN42l
 3+6RirxPQCrjVWIf53X6yy/pWOCsXmzvHsIRSEoZaeq3LL8B4atktAmTe
 X/xZbWIgZmCVxUOX8xDWKZ1UR2kM+87K964gNw2RJQOA9d3QyzAnvCwEK
 r5dMmWvoUyfvbYQKkg029/c9xVg8z2XtfK8jDsvIDkVNIUvgHwBcfQwqn g==;
X-CSE-ConnectionGUID: mOOMlG4uTG2EcC9I3n3LmA==
X-CSE-MsgGUID: pVAyhad1T/qlaZQRC6nKyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10059649"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10059649"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 21:00:46 -0700
X-CSE-ConnectionGUID: W9a79GZnQ7SeynVV5gqtiw==
X-CSE-MsgGUID: uPqESk9zSCyJGzUqbP/fLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26186443"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 21:00:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 21:00:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 21:00:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 21:00:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 21:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWNOnMEgoB4AiTwY6GgGSUBzbAKhJOeOHHcItediL4s+2tVTAcHBjatZnWiysBA4NyZLZ6ruiKhMxzHd5XCmBCiACJXe4772ZZ2xwstezaozOVQkIL6JcyDOzEEiCHzfIkuWZPqe37E/85UX+PBwCukZ+MpG0mYi3PlhrFvqgLSAdHrCHUo4HMrOxX2TIg0uPbl99Q7o0Ekt7hBp1IUU+MwqrB1iNbuOVFKemUybCOnH/b1Y96GZOXGS4WZdxIO/kPCHMSOTpt3okeXqwwaT8Iqn0ONfp7l3qoKunBVrEmPt9yMlYM0/+FYT6Py04firlCtSPklMCRAHUiOBlISbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g7Nau0NyORX1+Rb9p5BdaO+rAwVJLnuwNjYqkJtjBE=;
 b=XZs5UvDlUcIQD+6Ox2ZGzCr+VPvZ3zYxpw/V8V0M+75tCULkE1Hbp+w4NW/sT0CK88vP4hyYTKvi3NQcWv/aeyX5zLzqA8WPhOVYS5wvOk8K7M8qTWyX6VacsMi4SObN9+/fhD596zPPp3ppXtV0sYRSRqzXH108JUt3JQF1VDs0p9tr0co7YuwocTCn8faCMG9g3JCk6WG8PrKbNVvYftRebbOJ7Y0FzHhjdzrBSGKx2nXsHzpGyLckYZMi03sZRulRgraWRg4JRBcq5GI+JVJ/PxyELkwuXWZTDyPujyBrcaQ9V3TWENgiWz65ojmmzC+BYjrUiC90LuV05U1x0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 04:00:40 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 04:00:40 +0000
Message-ID: <6a835499-8a20-469e-9638-b7b83d19ca9d@intel.com>
Date: Tue, 30 Apr 2024 09:30:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240427135339.3485559-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5c8bd3-7562-4de6-3433-08dc68ca1953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkxFZDZmSzRBVFM2aHQ3MWlHeEszT01maEpLMDNNRHZXVXBBbEE3dU52cTRI?=
 =?utf-8?B?OTJIN1ZPSFZrb05KVGhqcUwwZFdIRzUvanVjTkt5dms5akYrSGxoS2lsS2gv?=
 =?utf-8?B?bGk1SmtWc2FmTC9iTitVVFB2NVk4NytLR3JjWElZcEdzcWI1Y3ZEamMxVVVk?=
 =?utf-8?B?UzV1bWJ0cHBYYS81U0V2eU9UVUl2TlJjZjA0eWFFYkZEQUVzYnRqSWtrYkNE?=
 =?utf-8?B?WHFYbDhzUlUvREkvUWxUUG5jNWloNW5TQWsreVQ4dVBxM25kS1Y5ckhhUlN4?=
 =?utf-8?B?cG1Sd0p6ZTdDSThHTEFta3FiUDI5QkNhZVVxT3doOGpiTmpqNlRwZ3A0WnVJ?=
 =?utf-8?B?N0Q2cjUvVGFmaERPRUhON2xJeHg1NzR5L0xYK3NNMFc5ZWE5SmhZbVBHc2Fv?=
 =?utf-8?B?OWJBa3hkem5OZGZpdGNaM1ZrMEdxWVh4RXpRV0NvVHp1UWZGNElrMFFXd0Zu?=
 =?utf-8?B?akZSZGJmODJ2dFAxVFJ2dDNMSEo1d3drU2VrdXM2WmhxUHE3V3Q3QnpkZm9i?=
 =?utf-8?B?QlRQOENTdFJqMk55UzMvK3ZVa2UyTk5OMEJRWFZzejVnNmg4YUtoVHJ5a1Vy?=
 =?utf-8?B?U2xtYW4rdE43cE1aZ1dkb2NUWDQ3TDRqVlpFVEpxRVR2U3VHZy9neUVUSEpt?=
 =?utf-8?B?dXZZSEdKd1RXTkRYNWFhZkJjWEJ5WnhtbUZZaC9HRENmMEMxVlZiaFlSK1F3?=
 =?utf-8?B?d3hBNXRPY3BGcHNOaFBZb2tGeFVUaEg3TUcyMThFNEZGeWRYc0hpT3ZUOVJw?=
 =?utf-8?B?WW5wMXcweGlZTGFtd3A3SDFNZ1l3bXp2WUcrQVJPUkY4QVljd1ZQbWNNKzNu?=
 =?utf-8?B?c2U3UEpHMmY2RWExQWl2UUc4NThsUlJLaDdDMnJhRll5akpRR3VDK1J3UXJz?=
 =?utf-8?B?NU9uNHdyRm1tYjcrVldrQzJjd3ByMGQ1UWNxbzBOcCtQNUI4elJJL3pQeVNr?=
 =?utf-8?B?cUxDa1dacHdRZFRaL2lCUUlQOUtmcFZkQWVaMWx4aWxyNTZxbXg1WTNKRW1v?=
 =?utf-8?B?blB4dXQyR1M0YmZjWVYyc09zaGJHZTBDNXdsUTQ2ZnJxdmdSNUJrSjBVejhE?=
 =?utf-8?B?bDdjZlFMS1I3QVByRW5yY2J6QkZHb2RrZndRWmZ4Q25sQU5oVzlTckp1NWRv?=
 =?utf-8?B?T2hhZi9takRHbGZ6M2dJSXo1Y2lGWnF3NDlOUEJQYUlkclNZTkpEKzZ4OTFO?=
 =?utf-8?B?cFRTZXllM3BpaFZtenhUc2lFSEhrOHRvR2pyazFEc0wwdUZPQitIU3JEcWZt?=
 =?utf-8?B?Z2xLcnZON2ptMkQ3REpTS1pvWDdJODJxOGJZeTNyQTFqbnlOQkN2Z3lienFP?=
 =?utf-8?B?ckdJclJpVU5wZlFSeXg1djloZmptVzU4cTZVRFFzV3FpZUc4R0VIMXZla1Fh?=
 =?utf-8?B?aVIrR1BiTGpYZzM5aW5senhUMS9NamE3SXNqR3Vla0lxbjNDdmh6eFdvTjgz?=
 =?utf-8?B?SFYrcDFQYml3WXNWV00rc2c3T2JjWXNHcnFWVEd2N093QlBoUUJjK2crei9v?=
 =?utf-8?B?NW9NdjZZYnY1eXFNaG9aMWljYkJxRUVoU0xCblFaUUR2MS91S1BJUGFDcTlu?=
 =?utf-8?B?SzI0YVNRRzNibVM0QThwNzRSa2xFb051eXlKeVhZVnA2ZWFZenUwZG95RW9G?=
 =?utf-8?B?dzFHcWlXanh0dUJ2cVdpRnpzelc1TDFRbXQ5RWtTa2hKYWc2bncwSTBSQUFn?=
 =?utf-8?B?T2d0d0VnakYwbE5XcVJhVlhPU0JsUEJGLzFSd2Yya2VONjBkWElxTEdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUpOV1pkK1NPeUwxZ0Y2bDJBU2hmaGRkVnhkRXhnVXZZRzNML0ZkbHAxK2Iy?=
 =?utf-8?B?WWs0SFFON1llWVQrQ1NhNTBuOXYwd1gzNlNLM1IzTXBGZGFRcHZoWncvZkl6?=
 =?utf-8?B?MDRFSTArcmxoSDU0ZXdINzNXaTJ1RXpZejM3SVhtMmlCWUdiY0M0ZnpzdVk1?=
 =?utf-8?B?YXQ3UDcra3RsNGd2TGlXMzJZTHhPUkxMOFFyZ0lyUVhRTFpsSGhtWFU4Tnkw?=
 =?utf-8?B?ZWFMbmdhZ1NSK3l3UWRJc01ocDY3b2hyb2hrL0dKTUFob3dtWUtLTzFBamFS?=
 =?utf-8?B?QkZRNXMvYlFKMFZGQ3VrVEdhU1Fmd2lhUXVBWERYTDYrRjFJWDVRRmpvTnlO?=
 =?utf-8?B?YnBSQTZxeXA5eXBidHJYK08xWW5IOXN1OHdXSEV3cEVTS25KS0tnVGxJbFJ3?=
 =?utf-8?B?Rnh6T3hsc085dndQMmNFRmV4Z3NLZmlLcENaclZvL0oySDcxUXBUQVY3TzNM?=
 =?utf-8?B?U2s4K2hvQWxoVkMwazZpZExsVjR4TjNsVkg2VXBFZkplMzQ5MW5INVBxOGJv?=
 =?utf-8?B?dVJxelkzL1FyZTVaZmVVcU5abndwSDB6TkRNMGVOYWtXSU9mK3c0YU5GMjF0?=
 =?utf-8?B?Z1pNZTQwUExyT0cvcGVqcjZ3TStUaVJzS256citoRno2OElYWC8ySkw4MDBp?=
 =?utf-8?B?V0lyejRjb1g4WElhT1Y4TmcxU2xBUTM5K3dSZTRkcjdZeDhNMHgwRHFHcDNm?=
 =?utf-8?B?NjdEZWR1bmRMWWUzNjdIdWk2MEVwTW42TFZXd2NPLzJCaFoxTEdlTzVXVk5r?=
 =?utf-8?B?OG1ZMDlWTXZWa0J1enhPcFZrenY2QVhzQUE0U2xqWC93SkhJK2VBT2pKVzAx?=
 =?utf-8?B?NVpHL1JsRlVWY2VkQVQxUG5WUWRkZDlXcGQyWWpWR3lMME5uRk13ZWxNblU2?=
 =?utf-8?B?WEdnSzZMcE91a1E4ZUt3RXBwWWpZR0VXay9sZm04Z1BabkZwUkhjRnhSWncw?=
 =?utf-8?B?SjBieGVDRWl0N3RSOHI4dUVJUVZHdFh6UFYzTTRnVW1wWE5jWThLclFtUXlM?=
 =?utf-8?B?MHg1SHk5N1pvWVVCRTBMbk9MSTZTMFFUVDh4TFllVVNuNmxMakNDdUN1MzFs?=
 =?utf-8?B?SnV0Z0cyNmpXUERLTC82ZHZGcXV0bmtXWW1aMU8rZGFzZjBPWlJ2eW5FcEh0?=
 =?utf-8?B?NVZIVWx5T1hVRndsWWg1TWl5aU1rbTZ2eVlQb0FzNEdzVURZZDZBSnBMQTUx?=
 =?utf-8?B?YThVa0puam4xbWlLd1ZVb3BDaHVhUHV6Y0FFbzJoK3pvdXBISWFGaHBWRWll?=
 =?utf-8?B?bVNTMnNibGxpZUFwRHF6Z0szSWJEaHFhalFmblE4UmhLN3JYcDVrdmc5aERD?=
 =?utf-8?B?dHpMZWs2K3BveHg1RWJ2TnU3QVR5NW9palNIRHVERXhlSk9vcy83dkdTK2E4?=
 =?utf-8?B?QWY2SjhYL2NoY1p6RW42YVk4WTBiR09GVU9IRUNENVh0cU54NDlRUGpGVC9D?=
 =?utf-8?B?YzdkTGRxVXQ1b3diSXM1WStINlBsYWlneFRkVGx2QnBHVlJrUWpCUUp0SE8z?=
 =?utf-8?B?V1MrOGtSenlYejFNa0RNV0VLKzNZbWdnMFN1OHFDUW9Tb2ZWTXRlS3JIWExF?=
 =?utf-8?B?S1crbE1lL3RnRWg4dnVqZDAyNEErZHUzTGdhb0FUdEhtbm05Rm03M21OdUdM?=
 =?utf-8?B?c1N2UzBMSW5iMllTaHhlbm5zY1lYcXhxWDZyL3BQYkV6a09CVVhuZkEwdGxq?=
 =?utf-8?B?UVI5cXpNV3pUL1ZNallxY2MwSUdza0dqcmkrRStxMi9CQ0tuRDBzSDU2eko4?=
 =?utf-8?B?bm5UMnFuNzUxWkFYaXVKVWorWCtJcVowMlFRZlpKOVdRMERlakNjM2VxaTZL?=
 =?utf-8?B?WjlTMlA0dXdxUDVoS2xBU1ZxbjR2SVFqSjFhenM1SmVTWDQ2VHgyWkw3M3R5?=
 =?utf-8?B?K1RMbFpHdEYzVmpHQ3UyWlNTZjJzaVBjbStYN1JObExVQUVxeXFiZmR5eVhZ?=
 =?utf-8?B?bXRJWnZGa01GQUJjZ0QwcXRtMVA5d1h2eDlEaFNCanBUa1c1Z3FvT3FDQnVT?=
 =?utf-8?B?N3F1MTArby9zSWVnNG9yVXZJcDJMVUdQeG0ybHcwc050eFFCS1pDdk1Ed09s?=
 =?utf-8?B?a0cwUURzME1GSUhkeDg4bzBUMnoyK2hPSzJ0UFN6MVJYUXliWXlFT0I5WlpG?=
 =?utf-8?B?L3JBa29uNU9nNFkvYU10RnB1WlNHSW84SkxQMmRqcGlqYjB0V1JNd2w5emFK?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5c8bd3-7562-4de6-3433-08dc68ca1953
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 04:00:40.0097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug78aUlId5oOAlJVzKblpvqvxzQTWeMa/Ref8EFnbSa6KNMifZi8I7VVKiyW7iCbt3CsBxaj7n/NI0scugYwMZSDNbW7Am6XK4FobAepcY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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


On 4/27/2024 19:23, Lucas De Marchi wrote:
> In order to detect duplicate implementations for the same workaround,
> early in the implementation of RTP it was decided to error out even if
> the values set are exactly the same. With the introduction of 18034896535
> in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
> stepping with graphics stepping A1 now gives the following error on
> module load:
>
> 	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
> 	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
> 	masked: yes, mcr: yes): ret=-22
>
> RTP may be improved in the future, but for now simply join the entries
> like done with e.g. "1607297627, 1607030317, 1607186500".
>
> Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_wa.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d9b7fa7a8f0..db7c7c7875c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>   	},
> -	{ XE_RTP_NAME("16021540221"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> -	},
> -	{ XE_RTP_NAME("18034896535"),
> +	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))

-- 
-shekhar

