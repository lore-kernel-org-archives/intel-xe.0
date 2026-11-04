Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E9606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AhO6jzuX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB710E0FB;
	Wed,  4 Nov 2026 10:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1A110E0FB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793788729; x=1825324729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sk733MxrEqHST2eeYc5Z7CUPfpE3kko5NlKZ9keeGwI=;
 b=AhO6jzuXxw6Z9oh5KEUJ2FEq10ozPluK5RtIuO+UyCRERF3kXims7P/h
 8+pY2aO+q6ZTn+aNPLIZVa2ihFR3aKheRxmAtKoLEmWa/WzeI98xH+APb
 S+kFv1vUn32L/3r5dCjYyAn+Zsqx1y7I7eZvhY+JDKFeueH2olo07Awm7
 sQN7O0if5Q/Lr5NVjWKq07nobM+LGtwL5f8vTPnv9yVE0h2TUoYHICGj4
 0fBeSeWVoqBIjWRBxNSKjt5A0wn916aLMKnHA++1flI0TC9gtEaBGYn5C
 Jt2DIR0VxX8xqQDhXP64oe4gMk+TD6XxVG4lfuBHPu9VAxLoj9LAUo6k4 g==;
X-CSE-ConnectionGUID: iGupGbJbTnmOM0ojWfRgeA==
X-CSE-MsgGUID: 5uzcasxlTEyMaYAi5LTrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2413017"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; d="scan'208,217";a="2413017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:38:48 -0800
X-CSE-ConnectionGUID: 8oT9cs9IQT65h2fthBc/wg==
X-CSE-MsgGUID: ivZLviqsRpS4Iu3XhoRY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; d="scan'208,217";a="6569156"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:38:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:38:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 02:38:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2Ptsv0ZGcYdMfvoww4jSJfHSExcmWWPbY7fZ8t4iKB6OapDvXTsf89jzwyFv622F7lfnTGi3gGBHskt+kZUo9U5/dHCdinKrGUmZNfoipnp2do4zAfcSIdd7oUDoJkBc5cYx2wMvbex/s8ZZwiFBN5MutaTc32evAMRSlkkN2oC85yiaMgkhpocl2Wcxf0+VN2cWAOqrn+MWPZpBBuVepRtWQlGiJBLBAWSrAQCaNaS/zmxOUxj55ARYyekH7PIeZQf9KnumKXWpQIb9D/IC1n6UpbPXARljll1pio0Ta23XpfaNKBADXLELUqQ5E4/bQ7PI3DLjUW5Wo+e7u8ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83DI+BAnWFbJNPCurCpHDQ0vMVKjy1p5rkJ9RsnjWg4=;
 b=brtZM5SoGFIp6oiOEPCcoB+MDRnO+f+l/90BzTVBlFStR+sFWsH9GujPCae+sKX4mpkRULq2/0c6OJ59duu/4Ih3Knp2hAHZ7hlUwTvDc7G7Ksa8VqFawtF3NnKPOBpwiSu9MrNaF/u5arXjIIywb+d6XHM2t7++g+WB3+3siAHuG1TB4NY6tpoYBzlABn8o0/rULh9LXmprrvzKltzDqEHVZr4tPHoEh9FI/s67SPF7IPliY4RYNNTjxgp3gA89lDMtE5v5GlLEZ50FQxwn0/f6DizI2YrH3avvEstwiZIXo7n5r8hKHOPCjqDlxrOVCQykr7pTSFiTB+bHgP4Fqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:38:45 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 10:38:45 +0000
Content-Type: multipart/alternative;
 boundary="------------uIylC3VIksnTydhHv6pOem0c"
Message-ID: <bcfd49c0-2e5e-4df6-a021-6a30da264ddf@intel.com>
Date: Wed, 4 Nov 2026 16:08:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe: Add support for wa_14028434957
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-15-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261103060929.1586783-15-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0254.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::9) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: d3380620-c2ee-4e4d-92e9-08df3a5fcd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|22082099003|8096899003|56012099006|261022105027099003|11063799006|261021123027099003|261028144727099003|261026121527099003|261102123227099003|261022075727099003|4143699003|261009220027099003|261021121427099003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|261026140227099003|261022113327099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: D9kEyD8I9f9cKokzq2kjOf+TM7IPDlpfgppf1//14jv+dwod7Z7jDQtvHqoy2ZK3G6JUXKxfK42WQT/xH89B3IdLc4vrgubj5i3t4lJdwHupqsWX0oDY823/MRXHH9eiPsFERm2Vs0TvV+ZHGijG2XAwG8c5cqbQ6ZcmhJbLfyHB4W7ughQDjWlgqr0OBXn/xnlm9UY68685ZecUtgVNbWy072cKk0WzDFRb/CiB+gdePXzvrt7jOvmZpQF+jM1VJcIiQ1oLQx9V8cTfqYsJgC5QBk8whrPmq16HrbrShkVuPXsZsIy8Nkp5jum8dLYq/BFT/ZoGdFMGLA6LSDTQ69m6Vb4yjbLovE0GpWE7gCwMdM4yx0TMzmrSfzTIXsuWsLZCpyFzR/wPYO3A/aK/5qVy4oroDi9uFA0lfWis5ajqK5sWifNjZonEL/VmPPSSq9/LRgDRsAQa17QGJbi+qv0C2shl3b16feHgCVrFhEJGo65sPKxC85MSRrRlu1g4m3Zt8FX8Lj17CXNZ7HLBlv+CmJs3XEssNiM6R69V9Y4oS7Wjn9ahgjlen/HnF/fumL2h1fyoK4FLt70d7e/fD4xzFaKM7clvcClmldHLHe8HfHZkD+YFvN3eSBdCw8SFd9BxKY1F7nwjApRJaFkF2rGlg1VFeFUEqZhYCroVYvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(8096899003)(56012099006)(261022105027099003)(11063799006)(261021123027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(4143699003)(261009220027099003)(261021121427099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(261026140227099003)(261022113327099003)(260925021911599003)(260925022911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9hUmcveEJmSkVWUjMydnV4QmZIbHR4UGpSUyt5Unp1WkZablBnMXdKMzhv?=
 =?utf-8?B?b0dSWmlWY1JLUERTOG8yZnY4YUdzbkJBMmxzVHJUNU1uUk5PZjlYVmR4U1ZY?=
 =?utf-8?B?VmFGU3d6Z2JpZ3BuMU80enhlVEtuSnZiK21SM1BxMU52N1BuRWhsQ3NKWFJU?=
 =?utf-8?B?RGRwcmVNdytDc0tmM3RxeDZPZGNxYWJLQXZJa1MwMGszQ3QyVTFXR2VIK1gw?=
 =?utf-8?B?Z2JXR3NNRHRhdDlRUnpXdGEyMzhUdjRjL0g1RzhLSDBRZHRXRmhRSDlpVGRi?=
 =?utf-8?B?SkhycjlPb2paSHVXTEJVMmpkTXR3OWRUdVRuR1FBWWI2a1VFbTFQYkNoakZu?=
 =?utf-8?B?alBUUFl3S1BSWTQ2UU5LbUUyN1dRS2NnRmRSL3pvc2pYcGZuYUY2a3pyUDZR?=
 =?utf-8?B?NURKUkNyODhrS3U3SlI3aFZmYzdiTkxadUFXRlRPUkhpcXIxY3lVK1o1NlFL?=
 =?utf-8?B?YmROTjZBQUNNZmJ3MnU3eWc0b2FHelFmOG1wWXp0YUhmS0dWTEZSTnZSMnlm?=
 =?utf-8?B?dGQzcC9DbURuQ1J1OFR2TFBkeVpkRXJ1ZHJuOHJoSTZqeTUzWGljVjhudEN0?=
 =?utf-8?B?NS9FU0dJYXpzN0Fyakt1TE5tL3d4ZklTQndNZnBidzB5azE3YVNWOU1Ub0tm?=
 =?utf-8?B?ZzhRU1RialdlTExRTFF4MjVWWndBVVo3QzQzYUN0SG1uVGF5Y2UweEJDTTJM?=
 =?utf-8?B?WlkzdWRsbmdCdGlxc3hqYmtnMlJZOWFmcFdxY2M2UExtZVpRY3dVNWRkZVRX?=
 =?utf-8?B?b3VMUlUvVXMrTVYrVXhWOGxJUldubVdZWGE2TWNxbm9GWlNMTHU3UHBOMkls?=
 =?utf-8?B?U0lFYWcxeXBFaXB6M2FMeXNzVnkrTlQ3emVqRmJHKzNnNVlkdmJtSWx1MGRE?=
 =?utf-8?B?L25ESnUwS1BmVGNGNzNuTStSSWtYcFlGQXBsWk10dER3SEJlanV5SEE3Q1Vq?=
 =?utf-8?B?Tmc5K24vYVF2eGdSdlJsRy9tUUsydEQ0Z05BTDBKSmNvNWNPQ0J2T0kvcnR4?=
 =?utf-8?B?eUEyWFl6YXBoV3dqMEVKRW5FOXpPOHdvQ0xCcTNBaXpLVVRrdURQeVEvLzgw?=
 =?utf-8?B?SDN0dDE2N0ozV3V6U1c0QnFCVTdad0RrRjhHWHIwVU1xN1g1dEJzdjNmelg4?=
 =?utf-8?B?NnJPck92c05BbnJHTnVxZ2I5aTJ3K1FUcnUrd0hWUVhtRUc4SEdIdGlWVjNk?=
 =?utf-8?B?VzNDb3dBa00rdWxVS21sVFdrbWlnbEs4QlRkSjB1YnQvdmlhOUMrYnpLSEIr?=
 =?utf-8?B?a2djTXlHY0VMN1hlMGc3dE56Z09yZlZzZnRzdURkZko0T3cyZExjdHA2cnRS?=
 =?utf-8?B?QS9KL3FJaGpNZ1FXVDdWOFgyRERraGhmbm9LUmo2OTBQSWlKZEt4M202QzdB?=
 =?utf-8?B?UVpEUHdFMGlnYnpQTkkwOWN4TzVnSzZFd3JSekszeEtaZkhHMEhobTRoenpE?=
 =?utf-8?B?TGFsZThaYStPQjB6VzhOZ1djWmZpUEErNU94dWdHTE1oWWdqN2djNTNqTVNX?=
 =?utf-8?B?RmUrdlBHVXBWekQzL3ZhUjNNaFlIaUJjbSt1dHZQSmsvRkVMSjZiZGVTbVoz?=
 =?utf-8?B?ZXBwVFk0TlltWVhJVVFXaEIzODZJdTFCNjJmQXAxTHcwaDN1M1pIcXczZDBx?=
 =?utf-8?B?UGhhc2hsOHgzdS96VElnT3dERG5oM09lWXNnZXR3K3JxOFl2RmJpdG1zWVBy?=
 =?utf-8?B?ZnBmNTVRY3FWYUIyUFVNQzRlbG9WTU4xUktZK1dRalpNU2tUODRBUnFqSTZY?=
 =?utf-8?B?UmtmRnFSNyt5aHRHT3NBQjdWQVlINVZsSE1VOXU4bUJoaHpFWDVvaDlPQ0lR?=
 =?utf-8?B?RGhUbFp0TERSZDBMNnZXcVNDUUR5cmJvcEUvOTZLTlpQTmcrdEk3eWVqdjBw?=
 =?utf-8?B?eWU0Z2dJY093cVZQdUZUTVBQOEpRNEpnN2syYlU0MVBSNnFmNldEZ1R4QTV2?=
 =?utf-8?B?bXRzaHBIUWg3SGJoMHZyUjdZeGszVFVWWVVIeWhtemY5ckxCNGxjcmtuZmZi?=
 =?utf-8?B?dWVsYjRhbFo0RnBSMEVJbHlQK2FNeVVQMUMrUXZxSkFzTlhJckdCa2RuSThH?=
 =?utf-8?B?TDlXTW5MUGxBNC9lVXFHdGt0b3FndWlXWk10SGYrcGVLZWcvVmVMWG1tb0d2?=
 =?utf-8?B?TTByelo5WVYvMjBlajZ0RFhBZXRwSmRodTZySnNZQzY4Zmh0ZUYvd3VoWEpW?=
 =?utf-8?B?aXVWYVJnVklpanNYaUt2TXN4RUhwVWxmR1ZqeG5xL0xvMkpaK29RQkFMR3pL?=
 =?utf-8?B?aGpxRmJSaVBpdVNwdGNxOU5MNWFZeWN5L3dLdFNkWUVJakVZR1hhK2xmYWxS?=
 =?utf-8?B?RWl5ZDJEVTJhcnNGbmJEVVBmMVE3MFNha283MlFxdUhLbFlBQUlSZFkyYnZz?=
 =?utf-8?Q?f3ODN4SaG8iNkOy4=3D?=
X-Exchange-RoutingPolicyChecked: wmNpsze6/eJ9CgxKgURYZ0WPE1yP7s+O0dT/NqxbG3l006C0SAHUFuydN5AHugmPfG2xsd+lig2H94JCtO/jzXuPzn8hcPxjbAi+UKb0F+xLkUOEF+ZCGoquID6DBF6h0Gju9BGX85mzZq5VP2ZjyewPq2bqHqYxJD2X10uO/lEJUB+f8a6X1+gjajdtjHAXhY0vwf6TePGbRekyiQ0fzlqOcrBx3S8+y9kX4Rb9I+jL6JoXH0U153/B+xioRMsf6g0ORMzv/DqCLPIJJWTT6rTLmUfiGNEMkAmvnlGy54Z4wKPQC7Eygcm8iIBCM9TUAC3465Un2VGodlY/xKPBNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3380620-c2ee-4e4d-92e9-08df3a5fcd32
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:38:45.2481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: by6/CzgEoMytBf9y+ImBIOSOW1vDwRKgI3RpqSVGlCulreCWWGVvqMOH/K2B5g8SPnO+5pmHw1t3TsmMsroJvryQhM1W/KdYZoFMpzAFoOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------uIylC3VIksnTydhHv6pOem0c
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 03-11-2026 11:39 am, Riana Tauro wrote:
> Add support for wa_14028434957 on platform CRI.
>
> Non-fatal device errors are reported via a direct IRQ, while fatal
> device errors are downgraded to non-fatal uncorrectable internal
> errors and reported via AER.
>
> Add support to process and log non-fatal errors routed via the direct
> IRQ path. Most non-fatal errors require no reset, except double-bit
> ECC errors affecting a critical BO, for which the device is wedged
> with a bus reset as the recovery action.
>
> For uncorrectable internal errors reported via AER, request a
> secondary bus reset to recover. To avoid a race between the two
> paths, if non-fatal error processing is in progress when an
> uncorrectable internal error occurs, flush and disable the worker
> to prevent further processing, since a reset is
> imminent.
>
> Cc: Andi Shyti<andi.shyti@linux.intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: use platform instead of graphics version (Gustavo)
>      combine patches (Tejas, Mallesh)
>      remove 1sec delayed worker (Andi)
> ---
>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>   drivers/gpu/drm/xe/xe_hw_error.c          | 31 ++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pci_error.c         | 12 ++++++++-
>   drivers/gpu/drm/xe/xe_ras.c               | 21 +++++++++++++--
>   4 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 356b4707dafe..3a8ef8abafc5 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -6,3 +6,4 @@
>   14026633728	PLATFORM(CRESCENTISLAND)
>   14026746987	PLATFORM(CRESCENTISLAND)
>   14026779378	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 39ff1e8cc156..2ab49ffdf49f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/bitmap.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
>   #include "regs/xe_irq_regs.h"
> @@ -15,7 +17,11 @@
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
> +#include "xe_wedge.h"
> +
>   
>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>   #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
> +	/* Skip hw error processing if device is already wedged */
> +	if (xe_wedged(xe))
> +		return;
> +
>   	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/*
> +		 * Skip handling if an uncorrectable internal error is reported as
> +		 * reset is imminent
> +		 */
> +		if (xe_ras_is_aer_internal_error(xe))
> +			return;

How are we dealing with aer_internal_error variable where on AER path we 
are setting true and reading same variable on different worker thread, 
for example if

we have four tiles then four worker threads are running in parallel.

> +
> +		xe_ras_process_errors(xe);

hmm, we need to handle return of xe_ras_process_error() right?

Thanks

-/Mallesh

> +		return;
> +	}
> +
>   	xe_survivability_mode_runtime_enable(xe);
>   }
>   
> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   		return;
>   
>   	/*
> -	 * Hardware errors are reported through System Controller on the platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> -	 * here for those platforms.
> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.
>   	 */
>   	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
> +		schedule_work(&tile->hw_error_work);
>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 4ade392b47be..c27fd22e28ac 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -5,14 +5,18 @@
>   
>   #include <linux/pci.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_hw_error.h"
>   #include "xe_log.h"
>   #include "xe_pci.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   static void prepare_device_for_reset(struct pci_dev *pdev)
> @@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> -	if (is_aer_internal_error(pdev))
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>   		xe_ras_set_aer_internal_error(xe);
> +		xe_hw_error_work_disable(xe);
> +	}
>   
>   	switch (state) {
>   	case pci_channel_io_normal:
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 58a0b5fa676d..1809c3c893de 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/bitfield.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_assert.h"
>   #include "xe_bo.h"
>   #include "xe_configfs.h"
> @@ -23,6 +25,7 @@
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   /* Any non-null entry marks the page as offlined by firmware */
> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>   			    "Double-bit ECC error detected at sw address 0x%llx\n",
>   			    info->sw_address);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>   			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
>   		break;
>   	default:
>   		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
> -	/* Default action */
> +	/* Default action for PCIe bus errors */
>   	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
> +	/*
> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
> +	 * internal error. Set the default action to reset.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>   				  NULL, 0, &response, sizeof(response));
>   
--------------uIylC3VIksnTydhHv6pOem0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-11-2026 11:39 am, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261103060929.1586783-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support for wa_14028434957 on platform CRI.

Non-fatal device errors are reported via a direct IRQ, while fatal
device errors are downgraded to non-fatal uncorrectable internal
errors and reported via AER.

Add support to process and log non-fatal errors routed via the direct
IRQ path. Most non-fatal errors require no reset, except double-bit
ECC errors affecting a critical BO, for which the device is wedged
with a bus reset as the recovery action.

For uncorrectable internal errors reported via AER, request a
secondary bus reset to recover. To avoid a race between the two
paths, if non-fatal error processing is in progress when an
uncorrectable internal error occurs, flush and disable the worker
to prevent further processing, since a reset is
imminent.

Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: use platform instead of graphics version (Gustavo)
    combine patches (Tejas, Mallesh)
    remove 1sec delayed worker (Andi)
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c          | 31 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pci_error.c         | 12 ++++++++-
 drivers/gpu/drm/xe/xe_ras.c               | 21 +++++++++++++--
 4 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 356b4707dafe..3a8ef8abafc5 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -6,3 +6,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028434957	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 39ff1e8cc156..2ab49ffdf49f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include &lt;linux/bitmap.h&gt;
 
+#include &lt;generated/xe_device_wa_oob.h&gt;
+
 #include &quot;regs/xe_gsc_regs.h&quot;
 #include &quot;regs/xe_hw_error_regs.h&quot;
 #include &quot;regs/xe_irq_regs.h&quot;
@@ -15,7 +17,11 @@
 #include &quot;xe_hw_error.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_ras.h&quot;
 #include &quot;xe_survivability_mode.h&quot;
+#include &quot;xe_wa.h&quot;
+#include &quot;xe_wedge.h&quot;
+
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
@@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	/* Skip hw error processing if device is already wedged */
+	if (xe_wedged(xe))
+		return;
+
 	guard(xe_pm_runtime)(xe);
+
+	if (xe-&gt;info.has_sysctrl &amp;&amp; XE_DEVICE_WA(xe, 14028434957)) {
+		/*
+		 * Skip handling if an uncorrectable internal error is reported as
+		 * reset is imminent
+		 */
+		if (xe_ras_is_aer_internal_error(xe))
+			return;</pre>
    </blockquote>
    <p>How are we dealing with&nbsp;aer_internal_error variable where on AER
      path we are setting true and reading same variable on different
      worker thread, for example if</p>
    <p>we have four tiles then four worker threads are running in
      parallel.</p>
    <blockquote type="cite" cite="mid:20261103060929.1586783-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+		xe_ras_process_errors(xe);</pre>
    </blockquote>
    <p>hmm, we need to handle return of&nbsp;<span style="white-space: pre-wrap">xe_ras_process_error() right?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks</span></p>
    <p><span style="white-space: pre-wrap">-/Mallesh</span></p>
    <blockquote type="cite" cite="mid:20261103060929.1586783-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return;
+	}
+
 	xe_survivability_mode_runtime_enable(xe);
 }
 
@@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		return;
 
 	/*
-	 * Hardware errors are reported through System Controller on the platforms that
-	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
-	 * here for those platforms.
+	 * Non-fatal errors are routed as a direct IRQ on platforms that support
+	 * system controller.
 	 */
 	if (xe-&gt;info.has_sysctrl) {
-		drm_err_ratelimited(&amp;xe-&gt;drm, HW_ERR &quot;Invalid error routing\n&quot;);
+		drm_err_ratelimited(&amp;xe-&gt;drm, HW_ERR &quot;Non-fatal %s reported\n&quot;, severity_str);
+		schedule_work(&amp;tile-&gt;hw_error_work);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 4ade392b47be..c27fd22e28ac 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -5,14 +5,18 @@
 
 #include &lt;linux/pci.h&gt;
 
+#include &lt;generated/xe_device_wa_oob.h&gt;
+
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt.h&quot;
+#include &quot;xe_hw_error.h&quot;
 #include &quot;xe_log.h&quot;
 #include &quot;xe_pci.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_printk.h&quot;
 #include &quot;xe_ras.h&quot;
 #include &quot;xe_survivability_mode.h&quot;
+#include &quot;xe_wa.h&quot;
 #include &quot;xe_wedge.h&quot;
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
@@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
-	if (is_aer_internal_error(pdev))
+	/*
+	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
+	 * flush and disable the worker to prevent further processing, as a reset is imminent.
+	 */
+	if (XE_DEVICE_WA(xe, 14028434957) &amp;&amp; is_aer_internal_error(pdev)) {
 		xe_ras_set_aer_internal_error(xe);
+		xe_hw_error_work_disable(xe);
+	}
 
 	switch (state) {
 	case pci_channel_io_normal:
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 58a0b5fa676d..1809c3c893de 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,6 +5,8 @@
 
 #include &lt;linux/bitfield.h&gt;
 
+#include &lt;generated/xe_device_wa_oob.h&gt;
+
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_configfs.h&quot;
@@ -23,6 +25,7 @@
 #include &quot;xe_sysctrl_mailbox.h&quot;
 #include &quot;xe_sysctrl_mailbox_types.h&quot;
 #include &quot;xe_ttm_vram_mgr.h&quot;
+#include &quot;xe_wa.h&quot;
 #include &quot;xe_wedge.h&quot;
 
 /* Any non-null entry marks the page as offlined by firmware */
@@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 			    DEVICE_MEMORY, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
 			    &quot;Double-bit ECC error detected at sw address 0x%llx\n&quot;,
 			    info-&gt;sw_address);
-		if (ret)
+		/*
+		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
+		 * Wedge the device with a bus reset for errors that require SBR to recover.
+		 * TODO: Trigger SBR using pci_reset_bus
+		 */
+		if (ret) {
+			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
 			return XE_RAS_RECOVERY_ACTION_RESET;
+		}
 		break;
 	default:
 		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
@@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 		return XE_RAS_RECOVERY_ACTION_RECOVERED;
 
 	BUILD_BUG_ON(BITS_PER_TYPE(sent) &lt; XE_RAS_COMP_MAX);
-	/* Default action */
+	/* Default action for PCIe bus errors */
 	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
 
+	/*
+	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
+	 * internal error. Set the default action to reset.
+	 */
+	if (XE_DEVICE_WA(xe, 14028434957) &amp;&amp; xe_ras_is_aer_internal_error(xe))
+		final_action = XE_RAS_RECOVERY_ACTION_RESET;
+
 	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
 				  NULL, 0, &amp;response, sizeof(response));
 
</pre>
    </blockquote>
  </body>
</html>

--------------uIylC3VIksnTydhHv6pOem0c--
