Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1E606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=akdXfmcB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79410E599;
	Wed, 28 Oct 2026 18:46:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D3E10E599
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793213179; x=1824749179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=tj5rhDdvzwG8xT7XPqMlMQs4JddZKPQGB74702YImPo=;
 b=akdXfmcB09taXgQz0PKoQzSFetFroa22cZL0WcCNQ7Ht+C2iGWzHgO6V
 qri4pdLPT9tDvVj3GXwq9j9jgH69BoPlQgYOdTSwWwZBBg4R64ygqPynb
 O34Yrjzxv6uMzcReKt9L+Tbr5GXaoua9Ij0UTXb8vWWfpU6YsshQJy8UV
 TlcFRdQLL6+gLOY1fv/Y9Z5YqnOoBRctzsnd/OBoPXisuRg9XG4WzSVuR
 v9ualy5A5GeS0SoDLvOkb5d5FYs7YKCticzD1uT1l+QKrIEH/mE725iT1
 nQjKE8AUkYoqvrJoRWm6mZQ/33uhaUNf7p6Cg22DSKrarVqv2OLKycUMr g==;
X-CSE-ConnectionGUID: uyPPwmoUTMC4H5ORQjqdPQ==
X-CSE-MsgGUID: u0dB7+zhT2Spu0MYGULFWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1831947"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,217";a="1831947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:46:18 -0700
X-CSE-ConnectionGUID: s6HS7UGyTJSdqugVlTp46Q==
X-CSE-MsgGUID: 0z5rtCFgTX+UiYS+zdw3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,217";a="4945682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:46:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:46:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:46:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4NAm4411Rgbj/RK1ZXJ/BHX1xm00j7yJBd/O6zGXOyW/tpKxJB+dVLdmX7I7goCMUDScAjHtDfInnREe38Dw9RMnvYUDyL2WdeISpeNgWOtqEqSnV2iwvw1xcFMfnYYH2gJ/+74m0mteB/C+n4GVrMzx2Ihp4k9MeqdZJ43mJfH3C3JlsBzK//8+JrfzxsLDUYE17ZJ+q5BW87yOyZB7HpnN/WQVeVr9P9RuNhvjRMMaeWxS7nrswj19pn2xt/9iJ6usmMyb8McYULwB0MgmDEdkflE4G76NvUfE33Q4+fhHiNjEYGlwYNja1pzY4bywmeSgs/3vmXhsiyxxbp76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlnDlau2043qlikFdAYnyln/1LX9x25jxcKo0TI4LqE=;
 b=vwSenlZqy7enHMZAg/rjv3CauBykT9SozHbZm7Zp3tDPED5Qj8l+aI/DvurX6mnFJMWa6o7BG2pUkLtYYM1IT+MOkUW57gHtZGkrgz2lThYV/8DSjpZsMF/jpfWOst/5FDNjMHqR1U9zvgPzh7x5OYWbLt9wUzRcDC18wYT/UadVp3a4O+lqCK+ve/6fUcPlGNkrnvm6Imi8T/CJwvwvKeuanmuQkQZnzs+1L/RpskHajEixm/U8sFbB0IWUzgHNArwZUmmzSRtyao+J02htMJbz3/0VofKZf5e1WnBYEPAsr3QKwePfWxVG0XgFWKuoDf7ElD2IhZybjk8zKp6cNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 18:46:14 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 18:46:14 +0000
Content-Type: multipart/alternative;
 boundary="------------jlCfj6gnLzXKbSXLaRO5xeaJ"
Message-ID: <244e9d47-794d-4290-9bdf-d6c83a6f0fbe@intel.com>
Date: Thu, 29 Oct 2026 00:16:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-2-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4927b6-01e0-4ed6-f880-08df3523be01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021121427099003|261022113327099003|261022075727099003|261021123027099003|10067099003|8096899003|56012099006|261028144727099003|261026140227099003|6133799003|18002099003|22082099003|261026121527099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: tmYiSbh+OpTcr8glFbJPP6NdtC6THfwUQbNnXxsH0FpagRcUBPMQvbaZaKuZNIj+pgS/6D6zgBK4lsYfcEn9dW6C958xl88ov3SJAwJClWcuMOEPZ0t99dD5ApXcdX/jMTt8KZSvI4Abd79mP19WO7jidQkmGxcdpevmgeAYg4FgGzvcXixAL4dpk3hFVdqdt7rgHjoe2iJUwBd3Pb2BIo7jq/FhUONb9NTQx/Py9OO1InW2p0rVNX6j0BZzk6KSaCiRfdW1bBUq0VTKyJon/Y77oHf18YD+Uvv0LGI9GTt4nevAY/fh/i8Xk0avYcoyBL7HJF9lXGdjXs4muEYbWD+sxt3phLzBwLOAIHlNw18rLVv8IVRM838TarV+/yIIU82LCwPXYdBGfNWlBf+Aj3XcbnfSZSLxRZta0ECjy/b2EXW9aiCGPK9JcZxkv4cfOTZXuche9p2DVZFjshxhhn6VxiZ82XHfBqCrgsZSaaPM9vg58sycfxkBRKmmMG9IC1yE7DLojPb9DXJ7d5szl+l7uqGg/87RlSlKftWIHaVwjvy3aIFE1zPbkkn+0lJ63ZDwM+UNvX27atMvNWg7Ori7zuzswlncyR9xsnsAg6cuusB7W+7D+euVacLKpGURw3p+K+uO4cQ54D8jm557h+OiXczGWcVtJ6+cztIn4PM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261021123027099003)(10067099003)(8096899003)(56012099006)(261028144727099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(261026121527099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzU1OVhudUYvcFlFUForL1hnbUY4QklrWFE1cTJHNERHbXpRMWcvTUNLemVK?=
 =?utf-8?B?dmNUaXFXZ1A0azJlKy9UajNzKzFrU25yQ2VIamhHTXEwR0krbWhEU1BKNHpM?=
 =?utf-8?B?Qms0THpNQ2lBR0xJdDd1TGJGZlhwRTNzL2ZhZjhjR2hRWmVnZmJpZ0dCSU1Z?=
 =?utf-8?B?ZUFDdmNOYkNHN3JURnhCbm9ReXJFKzZHbmk5dE8xTnRwT2pVRGZFdUNGUlJi?=
 =?utf-8?B?UktJR1JrbE04MktaVXR5TGpGcmszdHJwYmRBeWk0YTQ2T1gvQXMvbXVSTnZR?=
 =?utf-8?B?VEFpRm1ITWhnOGJydUhsVFlhL1BBNGhhSzZrUkF5Wnd3dVFzcWc2UW1mcXRV?=
 =?utf-8?B?RmhiemFWY0g0UXFNR05pMy9VSTBYeGk2L2UvcEw3dk80dkhFbGZRVnVkUEUy?=
 =?utf-8?B?V3BtVkxaaWJhVVRReHlnRjUvL1IvUm9rMURyMnBKY1JLUVAvUVZEOEh4MVg5?=
 =?utf-8?B?ZFJGY3drZzUrNHFkMTVySnVjNlZleDkreDZqalFQa1F3WkJzVUN3Ukt0VVJC?=
 =?utf-8?B?dEdPb1NOVU5JL2dxczVzZXF4Y1dpR01SQm83S0tWdy9ScEtSYU13M0ZsTDYz?=
 =?utf-8?B?eFROaUJuU0NnR0d3TEdmYUE5dDBUNXhCVEVuTCtyamMzVGs5ckp1cEh6YTBU?=
 =?utf-8?B?THk5ajJKVkMyWkVicERmL3A2emtvRENGVG04eUdqOTZJTnZiZkhvVWtZZE9S?=
 =?utf-8?B?M0YzTy9ZUG9ob25hdkcweGhmMDNTTzRmTk9iaWpteVM1QnRaeWx2c2RXMEV6?=
 =?utf-8?B?VkJ1Rnd2aHg2OXRXakUybFVJbnFTUUtDVExmMnlOS25QNi9idVVpbzg1UGZ1?=
 =?utf-8?B?cklnRGt4S21TRjBRVjl5VDc3UTdNcU9Rd1FzM21rM2xPTmhvM0tzRDA5TDZJ?=
 =?utf-8?B?dlF6R3VXWlBCZjNjN3ViWFlsOHpjdG14VXlSWGd1aFJ5aFZCSXRoM2c5NHoz?=
 =?utf-8?B?YkVVSkNxMzFUd1RwSTBraENFZE1sRzloS2EwQ1FHM3lGZHk1Y0xXQVZzWHZa?=
 =?utf-8?B?dkQwM1gvUGFXR3d4ckc1NUFDMjZuT3FEYzdLU0lVRlUzZG1tVTdhMFU4TFow?=
 =?utf-8?B?cVhETy9YZytScHJFMXFzVnJ4bzVFNS9Tdmd1Z2R5RXhRYUJBTjhNRWJuMlFZ?=
 =?utf-8?B?YVppV1Fpakx3enQ2bTFFVlVmM0dVRSt2T3VKSXdOYlpjWDhmMWFrQ1p2cTVE?=
 =?utf-8?B?cUtkSVVXKzZHNWdLWFhxR2pjV2xjS3VzVkJYSCtudUN4bnp0MGZ2REtKQTlH?=
 =?utf-8?B?a001OXc4RWUrNmdpTlQ4TmNGZEpIZXl2WnNpdEtEM09pd2M2bGxyZmdpSjJq?=
 =?utf-8?B?VTRzNlJrSUdpWEZJUXlHdWI1WVQwSlFiRE1PWmF6R05CaXl0N1NKMUdGRUdq?=
 =?utf-8?B?TVg3Vyt6L2dQbmRTTG5mTWhCbGVHcmxVaGYyNzIwbUZTUndGN2hkempBb3l3?=
 =?utf-8?B?U3JWUXdITFdpVVFkUnBjQlNMVHpHY3NWRDNQS001Tkt6ejJWZmlKaUZPRUo5?=
 =?utf-8?B?MG5jZURGMUJFOEhEbjl3SkJaYTc4K3pXWFMyQVlGVm9TM096OUY1WnozUHlR?=
 =?utf-8?B?Qmk4YSt5clNQK092ZWVGSGNhaDlVaUY5NWhkWGo0Q21kODJ6YjdNdEorS0Nk?=
 =?utf-8?B?dGxTcWRpYnFLbDhSSXhuUnhaYk9NN0Y0cE9BdHRGam5sUDNBYW9INDQ3NUR3?=
 =?utf-8?B?bXZpUm5EWXJRZVE1SFdBK05MSlYycnlLZHkzVGUzRU5sbjk0L0gwZmxtUGFl?=
 =?utf-8?B?Z0tvK0V0RGpoUkNWWkh5KzhJNXFjMDVqNGFWMjloU3RMa0R6bE96amExdmh5?=
 =?utf-8?B?SllIQklHVkJ2S3BxU2psTnpkOXJFd1FWMzh4M3M5U2tXTGtpYzNYUFM2SlE3?=
 =?utf-8?B?b0Q5OXV3VEVxcjQxN2wwTkVmUTlVVU9CUHJOQWVWVnkxZTBFL1gzbmpjMFBz?=
 =?utf-8?B?VytRbjBuUm9JLzBFM3ErZ2dMMTJaayt1bDFaVE5EQWhGUnJ6MTNXZ2hkbm5w?=
 =?utf-8?B?YkI3MzFVV3dNQ05YMUNQWjhudmozejhjY2oya01ENUNtY1JaM1R5TmR3N1NS?=
 =?utf-8?B?RFBrWm92TE5EdWdjNVAvYURnWXAzekpMYVEwTlI1cXE0ZkhCaGdDenpveUxZ?=
 =?utf-8?B?di81SUZnY3VON3RZdGRtYzJrN1pLbWV1UEVreWxLelJOcmhNQnVhVUU1TDg1?=
 =?utf-8?B?MUVxNmVKeXl6TU1kS20vby9UZmhPNVZ2M2pxYllFeDJSejdmZGcyMisyKzBk?=
 =?utf-8?B?ZllqODNDQ2pTSCtUc0xlbVl0NmZrRUR6dGljL1pWQjhadHE3SXA2UytvSEU3?=
 =?utf-8?B?WjUwYmdLYzE2ZXlEaVNob1JCSXdJMTk1S3VJb3FVSENRM0hzM1FNbTZyUzVB?=
 =?utf-8?Q?1n+NB+uTqx+/bVr4=3D?=
X-Exchange-RoutingPolicyChecked: XtN8uVrluVPX2zfmuk6CIc9eQHhLPWEm0IUPc3VPZ4b+jsF/ewjbVhwWRXtaccCQuFdCDB3RyjFied7qDbSsUMeTQwGZR9sx1tDO7GsAZSjeL1BDANeOz9ekJKbCT0viT6tcNGZiHXcDMweS0tYayCsHLdB8VVkMyjIFghNKSmPOmRNDi6Rwtj9Fc6of7VecCF1BcZynVGYfIdQp0B8kIuaXDF8UVrgjfMWOLd37LM3vVSaNvem7q/RqypIGkd5Sstx5Syoo5zfoI8jRlkNnqzqDpkV7vJ6d5v/uEDUIuSs6qiXVof+kzdKmqlanJ4f5gWsesrwruA1nXzLKMXEECQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4927b6-01e0-4ed6-f880-08df3523be01
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:46:13.9375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0XWQqka6EMke5Kqs9/8oCkOF4hjaSzIyDVBjR1J1O2YupKN0Pixwr2dcw4rZhxU4R5tN/iMsNGwZQGwWEHFaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

--------------jlCfj6gnLzXKbSXLaRO5xeaJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Initialize Xe hwmon fan-control support by detecting fan count,
> reading stock fan control points and min PWM.
>
> v2:
>   - Avoid user table initialization during probe. (Badal)
>   - Move unused code to appropriate patches.
>   - Use xe helpers for dmesg logs.
>
> v3:
>   - Rebase.
>   - Refine a few debug log messages and comments.
>   - Update xe_hwmon_read_fan_control_info() to return on any stock table
>     read failures.
>   - Avoid returning when num_fans is 0 in
>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>     initialization is not skipped.
>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as default
>     timeout itself is now 10ms.
>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>   - Rename fan_control_point_count to point_count in struct fan_table.
>   - Resolve kgdoc warnings.
>   - Add valid check for stock table fan point count.
>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
>     fans. This avoids assuming contiguous fan indices and allows masks with
>     gaps to be represented correctly in the hwmon interface.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>   2 files changed, 157 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..f2bd20f8b0a2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -21,6 +21,7 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   #include "regs/xe_pmt.h"
>   
> @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum fan_table_type {
> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
> +	STOCK_FAN_TABLE,
> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
> +	USER_FAN_TABLE,
> +	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
> +	FAN_TABLE_MAX,
> +};
> +
> +/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
If this macro is called from any function having no local variable named 
hwmon it will break. Should it take hwmon as an argument ?
> +
> +/* Maximum number of fan control points supported by each fan. */
> +#define MAX_FAN_CONTROL_POINTS	(10)
> +
> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
Cast to u32 ? shifting the signed enum into bit 31 could lead to UB.
> +						((POINT_NUM) & REG_GENMASK(30, 0)))
> +
>   /**
> - * struct xe_hwmon_fan_info - to cache previous fan reading
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
> + *
> + * Each fan keeps the latest tachometer sampling state along with two fan
> + * tables: the stock table discovered from firmware and the user table managed
> + * by hwmon sysfs writes.
>    */
>   struct xe_hwmon_fan_info {
>   	/** @reg_val_prev: previous fan reg val */
>   	u32 reg_val_prev;
>   	/** @time_prev: previous timestamp */
>   	u64 time_prev;
> +	/** @fan_table: fan control tables */
> +	struct fan_table {
> +		/** @point_count: number of fan control points */
> +		u8 point_count;
> +		/** @fcp: array of fan control points */
> +		struct fan_control_point {
> +			/** @temp: temperature in degree celsius */
> +			u8 temp;
> +			/** @speed: fan speed in percentage */
> +			u8 speed;
> +		} fcp[MAX_FAN_CONTROL_POINTS];
> +	} fan_table[FAN_TABLE_MAX];
> +	/** @min_pwm: minimum fan PWM */
> +	u32 min_pwm;
>   };
>   
>   /**
> @@ -193,6 +231,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fan_enable_mask: bitmask of available fans */
> +	u32 fan_enable_mask;
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>   	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
> +					   u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
Nit: blank line after variable declaration
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
> +				     uval, NULL);
> +}
> +
> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
> +{
> +	int ret;
>   
>   	/* Platforms that don't return correct value */
> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> -		*uval = 2;
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		hwmon->fan_enable_mask = GENMASK(1, 0);
>   		return 0;
>   	}
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
> +					      &hwmon->fan_enable_mask);
> +	if (ret) {
> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
> +	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
> +		xe_warn(hwmon->xe, "fan enable mask exceeds maximum supported fans\n");
Reset the mask to 0 so IS_FAN_ENABLED() stays false in case fan mask 
exceeds FAN_MAX.
> +		return -EINVAL;
> +	}
> +
> +	xe_info(hwmon->xe, "Number of fans detected: %u\n",
> +		hweight32(hwmon->fan_enable_mask));
> +	return 0;
> +}
> +
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int point;
> +	int fan;
> +	int ret;
> +
> +	for (fan = 0; fan < FAN_MAX; fan++) {
> +		u32 stock_fcp_count = 0;
> +
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +
> +		if (!IS_FAN_ENABLED(fan))
> +			continue;
> +
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +						      fan, &stock_fcp_count);
> +		if (ret) {
> +			xe_err(hwmon->xe,
> +			       "failed to read fan %d stock table point count, ret=%d\n",
> +			       fan, ret);
Why not continue for the rest of the fans marking the current one ?
> +			return ret;
> +		}
> +
> +		if (!stock_fcp_count || stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
> +			xe_warn(hwmon->xe,
> +				"fan %d stock table point count %u is invalid\n",
> +				fan, stock_fcp_count);
Ditto.
> +			return -EINVAL;
> +		}
> +
> +		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
> +		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan,
> +		       fi->fan_table[STOCK_FAN_TABLE].point_count);
> +
> +		/* Cache the stock fan table for later use. */
> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].point_count;
> +		     point++) {
> +			u32 fcp = 0;
> +
> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);

nit: u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);

Regards,
Soham
> +			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +								  FSC_READ_FAN_TABLE, fan),
> +					    &fcp, NULL);
> +			if (ret) {
> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
> +				       fan, point, ret);
> +				fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
> +				return ret;
> +			}
> +
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u\n",
> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
> +		}
> +
> +		/* Read minimum fan PWM */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> +						      &fi->min_pwm);
> +		if (ret)
> +			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
> +		else
> +			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +	}
> +	return 0;
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> -	u32 uval = 0;
> -
>   	if (!hwmon->xe->info.has_fan_control)
>   		return 0;
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> -			return 0;
> -
> -		return channel < uval ? 0444 : 0;
> +		return IS_FAN_ENABLED(channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> -	for (channel = 0; channel < FAN_MAX; channel++)
> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +	if (hwmon->xe->info.has_fan_control) {
> +		xe_hwmon_get_fan_enable_mask(hwmon);
> +
> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +		for (channel = 0; channel < FAN_MAX; channel++)
> +			if (IS_FAN_ENABLED(channel))
> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   
> +		/* Fan control tables initialization */
> +		if (xe_hwmon_read_fan_control_info(hwmon))
> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
> +	}
>   	return xe_hwmon_init_temp_info(hwmon);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 00c4fc7d0124..0349b24a8259 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -83,6 +83,11 @@
>   
>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_FAN_TABLE			0x7
> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
> +#define     FSC_READ_FAN_MIN_PWM		0x8
>   
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */
--------------jlCfj6gnLzXKbSXLaRO5xeaJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Karthik,</p>
    <div class="moz-cite-prefix">On 16-10-2026 00:37, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Initialize Xe hwmon fan-control support by detecting fan count,
reading stock fan control points and min PWM.

v2:
 - Avoid user table initialization during probe. (Badal)
 - Move unused code to appropriate patches.
 - Use xe helpers for dmesg logs.

v3:
 - Rebase.
 - Refine a few debug log messages and comments.
 - Update xe_hwmon_read_fan_control_info() to return on any stock table
   read failures.
 - Avoid returning when num_fans is 0 in
   xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
   initialization is not skipped.
 - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as default
   timeout itself is now 10ms.
 - Use xe_pcode_read() instead of xe_pcode_read_timeout().
 - Rename fan_control_point_count to point_count in struct fan_table.
 - Resolve kgdoc warnings.
 - Add valid check for stock table fan point count.
 - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
   fans. This avoids assuming contiguous fan indices and allows masks with
   gaps to be represented correctly in the hwmon interface.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
 2 files changed, 157 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42acfeb8818c..f2bd20f8b0a2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -21,6 +21,7 @@
 #include &quot;xe_pcode_api.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;regs/xe_pmt.h&quot;
 
@@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
+#define IS_FAN_ENABLED(fan) (hwmon-&gt;fan_enable_mask &amp; BIT(fan))</pre>
    </blockquote>
    If this macro is called from any function having no local variable
    named&nbsp;<span style="white-space: pre-wrap">hwmon</span>&nbsp;it will
    break. Should it take hwmon as an argument ?
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+/* Maximum number of fan control points supported by each fan. */
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) &lt;&lt; 31) | \</pre>
    </blockquote>
    Cast to u32 ? shifting the signed enum into bit 31 could lead to UB.
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+						((POINT_NUM) &amp; REG_GENMASK(30, 0)))
+
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * struct xe_hwmon_fan_info - cached fan telemetry and control state
+ *
+ * Each fan keeps the latest tachometer sampling state along with two fan
+ * tables: the stock table discovered from firmware and the user table managed
+ * by hwmon sysfs writes.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @point_count: number of fan control points */
+		u8 point_count;
+		/** @fcp: array of fan control points */
+		struct fan_control_point {
+			/** @temp: temperature in degree celsius */
+			u8 temp;
+			/** @speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+	} fan_table[FAN_TABLE_MAX];
+	/** @min_pwm: minimum fan PWM */
+	u32 min_pwm;
 };
 
 /**
@@ -193,6 +231,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @fan_enable_mask: bitmask of available fans */
+	u32 fan_enable_mask;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
@@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval &amp; POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);</pre>
    </blockquote>
    Nit: blank line after variable declaration
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL);
+}
+
+static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
+{
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2 &amp;&amp; subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2) {
+		hwmon-&gt;fan_enable_mask = GENMASK(1, 0);
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
+					      &amp;hwmon-&gt;fan_enable_mask);
+	if (ret) {
+		xe_warn(hwmon-&gt;xe, &quot;failed to read number of fans, ret=%d\n&quot;, ret);
+		return ret;
+	}
+
+	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
+	if (hwmon-&gt;fan_enable_mask &amp; ~GENMASK(FAN_MAX - 1, 0)) {
+		xe_warn(hwmon-&gt;xe, &quot;fan enable mask exceeds maximum supported fans\n&quot;);</pre>
    </blockquote>
    Reset the mask to 0 so IS_FAN_ENABLED() stays false in case&nbsp;<span style="white-space: pre-wrap">fan mask exceeds FAN_MAX.</span>
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -EINVAL;
+	}
+
+	xe_info(hwmon-&gt;xe, &quot;Number of fans detected: %u\n&quot;,
+		hweight32(hwmon-&gt;fan_enable_mask));
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	int point;
+	int fan;
+	int ret;
+
+	for (fan = 0; fan &lt; FAN_MAX; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
+
+		if (!IS_FAN_ENABLED(fan))
+			continue;
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &amp;stock_fcp_count);
+		if (ret) {
+			xe_err(hwmon-&gt;xe,
+			       &quot;failed to read fan %d stock table point count, ret=%d\n&quot;,
+			       fan, ret);</pre>
    </blockquote>
    Why not continue for the rest of the fans marking the current one ?
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			return ret;
+		}
+
+		if (!stock_fcp_count || stock_fcp_count &gt; MAX_FAN_CONTROL_POINTS) {
+			xe_warn(hwmon-&gt;xe,
+				&quot;fan %d stock table point count %u is invalid\n&quot;,
+				fan, stock_fcp_count);</pre>
    </blockquote>
    Ditto.
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			return -EINVAL;
+		}
+
+		fi-&gt;fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d stock table point count is %u\n&quot;, fan,
+		       fi-&gt;fan_table[STOCK_FAN_TABLE].point_count);
+
+		/* Cache the stock fan table for later use. */
+		for (point = 0; point &lt; fi-&gt;fan_table[STOCK_FAN_TABLE].point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);</pre>
    </blockquote>
    <p>nit:&nbsp;<span style="white-space: pre-wrap">u32 fcp = </span><span style="white-space: pre-wrap">FCP_INDEX(STOCK_FAN_TABLE, point);</span></p>
    Regards,<br>
    Soham
    <blockquote type="cite" cite="mid:20261015190751.1268916-2-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
+								  FSC_READ_FAN_TABLE, fan),
+					    &amp;fcp, NULL);
+			if (ret) {
+				xe_err(hwmon-&gt;xe, &quot;failed to read fan %d stock point %d, ret=%d\n&quot;,
+				       fan, point, ret);
+				fi-&gt;fan_table[STOCK_FAN_TABLE].point_count = 0;
+				return ret;
+			}
+
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon-&gt;xe, &quot;fan %d stock point %d: temp %u C, speed %u\n&quot;,
+			       fan, point, fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+			       fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &amp;fi-&gt;min_pwm);
+		if (ret)
+			xe_warn(hwmon-&gt;xe, &quot;fan %d min pwm unavailable, ret=%d\n&quot;, fan, ret);
+		else
+			xe_dbg(hwmon-&gt;xe, &quot;fan %d min PWM %u\n&quot;, fan, fi-&gt;min_pwm);
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
 	if (!hwmon-&gt;xe-&gt;info.has_fan_control)
 		return 0;
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &amp;uval))
-			return 0;
-
-		return channel &lt; uval ? 0444 : 0;
+		return IS_FAN_ENABLED(channel) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &amp;energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel &lt; FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+	if (hwmon-&gt;xe-&gt;info.has_fan_control) {
+		xe_hwmon_get_fan_enable_mask(hwmon);
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel &lt; FAN_MAX; channel++)
+			if (IS_FAN_ENABLED(channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
 
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon-&gt;xe, &quot;Fan control tables are not available\n&quot;);
+	}
 	return xe_hwmon_init_temp_info(hwmon);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 00c4fc7d0124..0349b24a8259 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -83,6 +83,11 @@
 
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_READ_FAN_MIN_PWM		0x8
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
</pre>
    </blockquote>
  </body>
</html>

--------------jlCfj6gnLzXKbSXLaRO5xeaJ--
