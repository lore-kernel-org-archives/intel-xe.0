Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD9D68B34
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 16:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CE010E821;
	Thu, 14 Nov 2024 16:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC3wEm/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444F10E821
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601391; x=1763137391;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6OWe95fUONtxS745vHfhc78g2gw2/Vwff05vhXgTuqo=;
 b=IC3wEm/aV7Y3nxpgvmE+5CoQMzEDTMZvOopUuTuIU9aykYgM74MBXIl+
 baTLLf7RQKfFhR/JFutqSpDPhISu+t1BrAbeMegvmwZoGhS2W5S1hlML4
 VdCgpCwZeWViRaQ5uoUiVnEOiiCsrorjlhp6g5T9+UFdn3N9JF0TVAmOk
 LaXfjpvKkL6wgzDAtnC9oYYzgfiz7GFOewGyDqZovdh16uhC+6ATFjUIK
 SPDvd6zpkcpF20k2yJQZc3tERXv7tZzJiTVss9JBbt0AgybqPIsTE8S/u
 0HIQveZ6wKPZ0x1FqKAnjAKn0Jd7p3L/ex8Di85EoYSKecde4Bu3cBP9J A==;
X-CSE-ConnectionGUID: +M5FX7p4QnmesgHGfA39bg==
X-CSE-MsgGUID: nySqxyf2Qxm5NkW9e6brrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31533465"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31533465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:23:11 -0800
X-CSE-ConnectionGUID: muuoL52FQBGUma86jTiivQ==
X-CSE-MsgGUID: 5JY6E0LaS6mBhR40euZ9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88379768"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:23:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:23:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:23:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAKxbOmIYhJ/Q77G0Ek5JUJo4GrQxn8hpiBHlTAFTPMJnG+T+eS3/5l0SRDfCDrVGHW1BrxATZ/dK+t5Uuu+GXcpCd2F/+BA0wuLedazkseFe5QIqh7Y45+FLvKjGsldYOI+01TpDydjc2BJ52PbiM2iVdy9u1uQ1iKQnxY3GbrsILTpxbfmvq7jRaqPHZeWHhn9+m2qKyoN0A3Ur/1DkZEJujH0e66wBvRz3BVAFJXDSUCib/r4mchLrZMTXIdt6oSTGIRYFyFpifkhDZ271c/Utwrrz443mfALJiSzHKuMciofCW7CqALQOcUrUdHfAGkAlx5myscfphGTB5Yl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxiNsxq2EFxqGPiYu1XC4zscsmD6fy7tNrwk/qSxiQo=;
 b=nMVS5sDopHJBud+F/0ROcyp4oyjuP01tz78JoWQvBXo42cjVzsGODE7YVmamnEwtfJtz/wCy+q/xGYDAqhSzdi5Um5/OMb1bz/WQhF/3PQ3rSIFZYOA68yBTCJXgW6m+Vz1Z76B3h3qYQq44tuAnpdYa+ZwPEVk0FoXueXaxxGjurFOPDUhrOmE/nX9E41/m196aesHakPgzbUobREcKdJBFi72w8HCejZqcASzPnH6DL2FT+76LOVMXarnxgZ2lK3F2flqddlXSGtKkDYdxKZSCtH1p7IX6QaVwmZkUhrmvECagO75+CkS9V+iTUwdRa+ijWVuTq/EePrAyHVnUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 16:23:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 16:23:06 +0000
Date: Thu, 14 Nov 2024 08:23:03 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <ZzYj53waEWwK/5za@orsosgc001>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: f28df36d-eccf-4511-d348-08dd04c89e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFnWmVaWnptVmRDNVRKOHE4d2xseFhxTWdQYkVpWk53MEdZS0IreU5KQ042?=
 =?utf-8?B?T25lTWlaWDViUHk5THUyM0xOMERaMmtaQ0RUWHRDVDlEMDFOUzZLNFRvTmFy?=
 =?utf-8?B?NEhDTjVoY21WdmhTQmc2eUlnempxZ05la1JqY1hHYWhHRXZxaTc3OUlwOSsw?=
 =?utf-8?B?T0pKSHYyKzc3U0tObTcwTHVEY0d1Q1h6NlNHbVpPcWQvU3JLZ0dmVkxPZjRm?=
 =?utf-8?B?MkRxYUxvQkZUUG12MFIwb2l4UHYrUUZpSFdhRmF0T3RTZTNZUzRLYVNlRXJi?=
 =?utf-8?B?TG1uanVGTGVkUkp0M3JNQzY3YmN0OU15M0w1bzlHcHVPZzE0eklxWkhRY0Vl?=
 =?utf-8?B?QTQzL3h6Q2syZXVBQjVHN1ZFeWZRMHluaXh2bUdsUmdockZ5RVAraFpHOFFL?=
 =?utf-8?B?bFZsRVMveUhYQkFLZHpOU0llM2l5N0lhM0xXbzU3cnJhQTUrTVA1WnZ1WHVx?=
 =?utf-8?B?Ym15ZnJiSmJENnc4eEptQUJubGdmNzY5Sm1tT0d2WW9YRFE0WmNISUp2S0x4?=
 =?utf-8?B?eEJuaVNYSHE0cmVHaXR1clRpQ1ViYlBlTllsSWdDWU5XajZaeGdSZGhHMWFH?=
 =?utf-8?B?STJYK3gwc2FPc0VtakhQNkZ1RkhXbzZYODRzNGRNRDVmQU1DUjBxc3h4U1VL?=
 =?utf-8?B?Vmc3M0xIdXZqRGl6aGxCU0dqNmI0Vkh0KzRnWVM0SXI5ZUxOMG1iTm12RldK?=
 =?utf-8?B?S3ZaQklGdDMzQll2b2o3eWw4amM5VzJWcUpha2dIRVYyUGtjUjBxRithbnMz?=
 =?utf-8?B?aThNSEJkWlZHUjRld25CZ1RDNldQd050WDVMcUtEOGlUOGVpL3QrME5HWWdN?=
 =?utf-8?B?bEV1Ly9HR0lHM3E3dXdHZy9Ob3RsOW9EbzJrRE5VRlMxc01PTmtOejJTTmp3?=
 =?utf-8?B?U1RPRnV4U1hMUzdQRTZvNyszQjhZckU3WmRYRS83ekM4ZzBNNmZHV2kxODBS?=
 =?utf-8?B?MTMvTDhSMkd6ekNiUEhaa1FONENBSnZHSlhwczlUOXV4NTVGaS9VQjhsVTJ4?=
 =?utf-8?B?dElHeENIbUpoc3F1RzA3d3BXMU1SY1pWbXhzL1NiY1FpcWZDc201QnZiNEkz?=
 =?utf-8?B?Q0Q2b1pMbHQwaUFpQjZTZi9BUDFJL2dyR1VuN1Bnb2ZXK3NJL2kwMjZMNTgw?=
 =?utf-8?B?UkF5WXNjNzV0Q09NcHQwUnBPSmdDVlFXM0FRbEFjYjY5N2tTbGlKMzVCS3Jw?=
 =?utf-8?B?TCtTaE5ld3JJQW1yNHkvZXJVWkpJRk5yN1dZMHgvcXlvT1Qyai9iQlRtL2dL?=
 =?utf-8?B?RUJSVjFldnVReFB2Sm9GMVlvQUVXbERNcXpaeEROek0yYytidlJFQjZGejFF?=
 =?utf-8?B?VjA0bkhnQ3ZhVHRmQkNUK1gwOWhtR3R3d1dKUk9RRzBMTVRJQlppVko2bXZY?=
 =?utf-8?B?UkF5dGRSMDBiR2pYektVdU1Cc0YxbFFWODFuN1BLQmxXM0x2UFNUNnljZC9i?=
 =?utf-8?B?aU1jWWVNa2JQUHUydmlwVC9qWFlCWXkvNlluS1F5ekowNG9xK1ZzR205WFJB?=
 =?utf-8?B?THNET3JGeWN3VDBuVVVjeWpobjh5U1pJZndKRms5RDJwYllDakxSQnJEQkhZ?=
 =?utf-8?B?N29NZ0FKWEFnMEVQbXgrUUJIVy9kcU5KaTlGdGZzYXZGbzJLcHgycGdqN3J4?=
 =?utf-8?B?VWdtZmdDTzN2TnlXSHpGWkNvSzFyTTc0MVQ2eVhMWndFN0Z4ZjRtY1RNOUQ3?=
 =?utf-8?B?clAvQ2t3VkVnanVXYVM2TkdLL2U0L3dQVjFFRGRqM2lJUmE5UXo2UzJuZ3px?=
 =?utf-8?Q?1TqfAMbMnEEns71I/t0jwWLunSwfLJG3CnqC9t6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmI3NFU2dmZvdHVjd0p2UHgrTU8zdVRwc01ZTHNuYnhhTjBOZm51U1RuVUNT?=
 =?utf-8?B?RUVJZHVvcTlCclNOQjVoL2N4NHZtVjh2ZnQrcjdRNTNxUUZSOGdMMTJjZ3ZL?=
 =?utf-8?B?WjFrLzZ3WWs0TDd0SzBVempTellqUXJRU0pmNE90b0hGdzY1RmNMallrL2h5?=
 =?utf-8?B?S1d6bXFUR1RWN2xIdzFZY2RUQ1pLZG12OFZoZjdUQ2lLT3lnNzNZdkpVM21u?=
 =?utf-8?B?SEVsK2Y5RmExUkx6alAyM2dIcUU3SExzSGM1QzBJR1phVjQ1aVMzWSsrbTMz?=
 =?utf-8?B?MnhNMkU5eWJCUUZvdWhmdEF5R3FzVkZhMVFyc0hOekFZV2RuRlFWbUFUWENM?=
 =?utf-8?B?OGs4eDhJUGpQVzBiWitzVTR4NDhVVEwwSnovOG5aZk5zTXhRRkE0cWhFWHNE?=
 =?utf-8?B?clFpWnl6dmdBTy84OEFBMnZpZGd2Sk8wM20rYXlWMTJKWGtwUzdEVnhudytT?=
 =?utf-8?B?U2ZheWRvY0RPejNFeXVuTjBReDlzbkZPWFRlRTlRNFNnOXdHNlB1eFBVby93?=
 =?utf-8?B?UWlVYXAyOHVlL2V5WU9lejYzQlhaZ2g5dE9vWGFzWjFuTWdWemVvREt5VnRh?=
 =?utf-8?B?SW0zd2xmb3BEMXRSSWdXc0hzUVk3UE80aU5XMXpJem1aSXYrdnVIVjhFdTcw?=
 =?utf-8?B?bXR4MisvWEZzUGhTMkNPd25OcUd3Q205VjJoTitTekJNeGxGV3BoV0hRcHdz?=
 =?utf-8?B?YlBrMjlZaW5iQ1dzdmJvT20vbU5vOStkVzlBak9DOXJSWkZYVFBpRVV6bHpQ?=
 =?utf-8?B?cmM1ek1maEtBbklOMmN1UUQ1eHVySWlEVWtqMVhqL0FRVjFNMzNRcTB0Q0s0?=
 =?utf-8?B?SlI0MXM4bTFBSG4yQkcxb2hWSHk0UFloRjVKWTh3UGlvZklBN1RjSWozczNj?=
 =?utf-8?B?ajZYeUJ0ckJ3ZEo1SFBZd1p3THZpMEFiZStpVlcrYktXdUcrL29DVE5jQ1Yw?=
 =?utf-8?B?RENPbTYrYTVSWDdxNEZCM2M2SmFmWTdCeGhoWHdhYWlJRXg3T3REb21kMmRk?=
 =?utf-8?B?M3B6MWlSTGIwMmMvdHpXSUs4N3dYUWJyRDJNMWxPcnFGazRzcmtZYUxYMFMx?=
 =?utf-8?B?S0lReDBzZkNpZXBQZW1pMmdsWmVUQzJMZ2VuOFVXTW1YbEVvSTFBWS8rOUVh?=
 =?utf-8?B?bFJJOVRuS2t2UXlCaTVPUXB1TDN1YVRSTEpQbWhCeTR3Ni9xWFZ2alRaYlUw?=
 =?utf-8?B?dFVKRC9UTDNBOStuM1hPQXcrOFkvemNhRmFUT3JocUFSbUVqeHBmNGRQVTBZ?=
 =?utf-8?B?b1dScXE4K3R5MFdGTEtNYnFpQ2p5eThDVDlFWGpGU1MvUjQyQjdibEMzN1ZP?=
 =?utf-8?B?Yll2NHNVY3hiVXgxYW1XbDR3Qms2OTlsbUVUVWlJRVZXSFVKZjdPaVY1N2c1?=
 =?utf-8?B?S3R6TUwvYUtIZ21iZHBKTjN0Y2h0U1pQemhWN0E5K0pkRUxXWGZya0FHSzNa?=
 =?utf-8?B?U3lsQmIxdDZCWUdiYTdsc3RyK084dVRZSXNPWFdIcWdrSXFkSCtIZGNMQjZC?=
 =?utf-8?B?aWNsdXJ5WnNhbFBwd3ZqN1I0NHFGYjZQM1FtMjJzMkwxaGs1RDZlTzhick9N?=
 =?utf-8?B?UElBaERwellVTFUwencwVURxektaUXB2NTVFWmVzOWxOT1VTelFPakE4ZHRE?=
 =?utf-8?B?SEp5ZG9WUXNzakRNNWQwY25jM0NCYUMzamFsa0RaTE55OW5ScU5BMFRycThZ?=
 =?utf-8?B?Y1dhVzBaUkk0YXdvTzNONTVNcnZ5d2cxSThGMVlsV0dkQ1hIUmtTaVJ3d2Yy?=
 =?utf-8?B?djJmdWVSTktVdXMzMzQxcjF5OWVPSlZsbXkrRjkvMFFaYzVBZjVJQ0d3Y2tE?=
 =?utf-8?B?U2ZmdFhqaVdLQ0JscUtnUHBseVJJcXcwc3J3S2xlcDNOdVpaM1lYUTNFTEhQ?=
 =?utf-8?B?RUdZRE5lUjVZREh2bEdQQzE3TTJQaFduVTBlRHdvVWpYY2xyclJTc09KSjRV?=
 =?utf-8?B?OS9VWGUyVXM5RFJuTFJsUEdEd3h4djJ5SzI3cElGWkRRdnNGODJERjJ5QTdJ?=
 =?utf-8?B?dFdWSUZoUng1WWtQRUcwSk1RR0MxQTd5Mm9GT29qditST0Jsd1lYQm5IRGRG?=
 =?utf-8?B?Nm9Ua0hhQ1VLbEx5MkM3WVRzZ2hzZHhLazBFdW5WK2ZlRVh6LzhDN0ZvL2Fj?=
 =?utf-8?B?WnhsMHcxeXV4S1ZkbVEzbFFuWVh2T0lCZDkycXNVckhBRU90SEtiblB1ZGZp?=
 =?utf-8?Q?tBvT6a+/vAtBzxlB6LRlGQA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f28df36d-eccf-4511-d348-08dd04c89e94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:23:05.9653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLDKVAlh7IEpPcoJp67Uj4Sp+OYhpgpHgWV6eU/zWNcPtaVn6dmK8mv7FlrPAKwzgDaXsYG1r8osDsu5pDafqIyBN3SAeCRtHNyGxJX2ezI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

On Sun, Oct 13, 2024 at 11:00:33PM -0700, Harish Chegondi wrote:
>A new hardware feature first introduced in PVC gives capability to
>periodically sample EU stall state and record counts for different stall
>reasons, on a per IP basis, aggregate across all EUs in a subslice and
>record the samples in a buffer in each subslice. Eventually, the aggregated
>data is written out to a buffer in the memory. This feature is also
>supported in XE2 and later architecture GPUs.
>
>Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
>from the user space to do initial setup and obtain a file descriptor for
>the EU stall counter data stream.  Input parameter to the IOCTL is a struct
>drm_xe_observation_param in which observation_type should be set to
>DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
>DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
>drm_xe_ext_set_property structures in which each structure has a pair of
>property and value. The EU stall sampling input properties are defined in
>drm_xe_eu_stall_property_id enum.
>
>With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
>can enable and disable EU stall sampling with the IOCTLs:
>DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
>User space can also call poll() to check for availability of data in the
>buffer. The data can be read with read(). Finally, the file descriptor
>can be closed with close().
>
>Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile         |   1 +
> drivers/gpu/drm/xe/xe_eu_stall.c    | 275 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
> drivers/gpu/drm/xe/xe_observation.c |  14 ++
> include/uapi/drm/xe_drm.h           |  42 +++++
> 5 files changed, 344 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index cb6c625bdef0..bf21feae6950 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> 	xe_device_sysfs.o \
> 	xe_dma_buf.o \
> 	xe_drm_client.o \
>+	xe_eu_stall.o \
> 	xe_exec.o \
> 	xe_execlist.o \
> 	xe_exec_queue.o \
>diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
>new file mode 100644
>index 000000000000..5e4c90f9614d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
>@@ -0,0 +1,275 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <linux/anon_inodes.h>
>+#include <linux/types.h>
>+#include <linux/poll.h>
>+#include <linux/fs.h>
>+
>+#include <uapi/drm/xe_drm.h>
>+
>+#include "xe_macros.h"
>+#include "xe_device.h"
>+#include "xe_eu_stall.h"
>+#include "xe_gt_printk.h"
>+#include "xe_gt_topology.h"
>+#include "xe_observation.h"
>+
>+/**
>+ * struct eu_stall_open_properties
>+ *
>+ * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
>+ * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
>+ * @poll_period: The period in nanoseconds at which the CPU will check for
>+ *		 EU stall data in the buffer.
>+ * @gt: GT on which EU stall data will be captured.
>+ */
>+struct eu_stall_open_properties {
>+	u8 eu_stall_sampling_rate;
>+	u32 event_report_count;
>+	u64 poll_period;
>+	struct xe_gt *gt;
>+};
>+
>+/**
>+ * num_data_rows - Return the number of EU stall data rows of 64B each
>+ *		   for a given data size.
>+ *
>+ * @data_size: EU stall data size
>+ */
>+static inline u32
>+num_data_rows(u32 data_size)
>+{
>+	return (data_size >> 6);
>+}
>+
>+static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
>+					   struct eu_stall_open_properties *props)
>+{
>+	if (value == 0 || value > 7) {
>+		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
>+		return -EINVAL;
>+	}
>+	props->eu_stall_sampling_rate = value;
>+	return 0;
>+}
>+
>+static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
>+					 struct eu_stall_open_properties *props)
>+{
>+	if (value < 100000 /* 100us */) {
>+		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
>+		return -EINVAL;
>+	}
>+	props->poll_period = value;
>+	return 0;
>+}
>+
>+static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
>+						struct eu_stall_open_properties *props)
>+{
>+	if (value == 0) {
>+		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
>+		return -EINVAL;
>+	}
>+	props->event_report_count = (u32)value;
>+	return 0;
>+}
>+
>+static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
>+				   struct eu_stall_open_properties *props)
>+{
>+	props->gt = xe_device_get_gt(xe, (u8)value);
>+	if (!props->gt) {
>+		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
>+		return -EINVAL;
>+	}
>+	return 0;
>+}
>+
>+typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
>+					struct eu_stall_open_properties *props);
>+
>+static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
>+	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
>+	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
>+	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
>+	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
>+};
>+
>+static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
>+					     struct eu_stall_open_properties *props)
>+{
>+	u64 __user *address = u64_to_user_ptr(extension);
>+	struct drm_xe_ext_set_property ext;
>+	int err;
>+	u32 idx;
>+
>+	err = __copy_from_user(&ext, address, sizeof(ext));
>+	if (XE_IOCTL_DBG(xe, err))
>+		return -EFAULT;
>+
>+	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
>+	    XE_IOCTL_DBG(xe, ext.pad))
>+		return -EINVAL;
>+
>+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
>+	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
>+}
>+
>+typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
>+					     struct eu_stall_open_properties *props);
>+static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
>+	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
>+};
>+
>+static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
>+				       struct eu_stall_open_properties *props)
>+{
>+	u64 __user *address = u64_to_user_ptr(extension);
>+	struct drm_xe_user_extension ext;
>+	int err;
>+	u32 idx;
>+
>+	err = __copy_from_user(&ext, address, sizeof(ext));
>+	if (XE_IOCTL_DBG(xe, err))
>+		return -EFAULT;
>+
>+	if (XE_IOCTL_DBG(xe, ext.pad) ||
>+	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
>+		return -EINVAL;
>+
>+	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
>+	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
>+	if (XE_IOCTL_DBG(xe, err))
>+		return err;
>+
>+	if (ext.next_extension)
>+		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
>+ *
>+ * @file: An xe EU stall data stream file
>+ * @buf: destination buffer given by userspace
>+ * @count: the number of bytes userspace wants to read
>+ * @ppos: (inout) file seek position (unused)
>+ *
>+ * Returns: The number of bytes copied or a negative error code on failure.
>+ */
>+static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
>+				       size_t count, loff_t *ppos)
>+{
>+	ssize_t ret = 0;
>+
>+	return ret;
>+}
>+
>+/**
>+ * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
>+ *
>+ * @file: An xe EU stall data stream file
>+ * @wait: Poll table
>+ *
>+ * Returns: Bit mask of returned events.
>+ */
>+static __poll_t
>+xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
>+{
>+	__poll_t ret = 0;
>+
>+	return ret;
>+}
>+
>+/**
>+ * xe_eu_stall_stream_ioctl - support ioctl() usage with xe EU stall data
>+ *								stream fd
>+ * @file: An xe EU stall data stream file
>+ * @cmd: the ioctl request
>+ * @arg: the ioctl data
>+ *
>+ * Returns: zero on success or a negative error code. Returns -EINVAL for
>+ * an unknown ioctl request.
>+ */
>+static long xe_eu_stall_stream_ioctl(struct file *file,
>+				     unsigned int cmd,
>+				     unsigned long arg)
>+{
>+	switch (cmd) {
>+	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
>+		return 0;
>+	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
>+		return 0;
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+/**
>+ * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
>+ *			      stream file.
>+ * @inode: anonymous inode associated with file
>+ * @file: An xe EU stall data stream file
>+ *
>+ * Cleans up any resources associated with an open EU stall data stream file.
>+ */
>+static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
>+{
>+	return 0;
>+}
>+
>+static const struct file_operations fops_eu_stall = {
>+	.owner		= THIS_MODULE,
>+	.llseek		= noop_llseek,
>+	.release	= xe_eu_stall_stream_close,
>+	.poll		= xe_eu_stall_stream_poll,
>+	.read		= xe_eu_stall_stream_read,
>+	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
>+	.compat_ioctl   = xe_eu_stall_stream_ioctl,
>+};
>+
>+static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
>+{
>+	return false;
>+}
>+
>+int xe_eu_stall_stream_open(struct drm_device *dev,
>+			    u64 data,
>+			    struct drm_file *file)
>+{
>+	struct xe_device *xe = to_xe_device(dev);
>+	struct eu_stall_open_properties props;
>+	int ret, stream_fd;
>+
>+	memset(&props, 0, sizeof(struct eu_stall_open_properties));
>+
>+	ret = xe_eu_stall_user_extensions(xe, data, &props);
>+	if (ret)
>+		return ret;
>+
>+	if (!props.gt) {
>+		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
>+		return -EINVAL;
>+	}
>+
>+	if (xe_observation_paranoid && !perfmon_capable()) {
>+		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
>+		return -EACCES;
>+	}
>+
>+	if (!has_eu_stall_sampling_support(xe)) {
>+		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
>+		return -EPERM;
>+	}
>+	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
>+				     NULL, 0);
>+	if (stream_fd < 0)
>+		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
>+
>+	return stream_fd;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
>new file mode 100644
>index 000000000000..70fc89480df2
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
>@@ -0,0 +1,12 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef __XE_EU_STALL_H__
>+#define __XE_EU_STALL_H__
>+
>+int xe_eu_stall_stream_open(struct drm_device *dev,
>+			    u64 data,
>+			    struct drm_file *file);
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
>index 8ec1b84cbb9e..cca661de60ac 100644
>--- a/drivers/gpu/drm/xe/xe_observation.c
>+++ b/drivers/gpu/drm/xe/xe_observation.c
>@@ -9,6 +9,7 @@
> #include <uapi/drm/xe_drm.h>
>
> #include "xe_oa.h"
>+#include "xe_eu_stall.h"
> #include "xe_observation.h"
>
> u32 xe_observation_paranoid = true;
>@@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> 	}
> }
>
>+static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
>+			     struct drm_file *file)
>+{
>+	switch (arg->observation_op) {
>+	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
>+		return xe_eu_stall_stream_open(dev, arg->param, file);
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
> /**
>  * xe_observation_ioctl - The top level observation layer ioctl
>  * @dev: @drm_device
>@@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> 	switch (arg->observation_type) {
> 	case DRM_XE_OBSERVATION_TYPE_OA:
> 		return xe_oa_ioctl(dev, arg, file);
>+	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
>+		return xe_eu_stall_ioctl(dev, arg, file);
> 	default:
> 		return -EINVAL;
> 	}
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index c4182e95a619..50ad6b2e1450 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> enum drm_xe_observation_type {
> 	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> 	DRM_XE_OBSERVATION_TYPE_OA,
>+	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
>+	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> };
>
> /**
>@@ -1696,6 +1698,46 @@ struct drm_xe_oa_stream_info {
> 	__u64 reserved[3];
> };
>
>+/**
>+ * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
>+ *
>+ * These properties are passed to the driver as a chain of
>+ * @drm_xe_ext_set_property structures with @property set to these
>+ * properties' enums and @value set to the corresponding values of these
>+ * properties. @drm_xe_user_extension base.name should be set to
>+ * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
>+ */
>+enum drm_xe_eu_stall_property_id {
>+#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
>+	/**
>+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
>+	 * in multiples of 251 cycles. Valid values are 1 to 7.
>+	 * If the value is 1, sampling interval is 251 cycles.
>+	 * If the value is 7, sampling interval is 7 x 251 cycles.
>+	 */
>+	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,

What is the rate of 251 cycles? If that can be clearly defined, then at 
first glance, I would think it's better to define this in terms of 
frequency. The implementation can decide how to translate that to HW 
configuration.

Regards,
Umesh

>+
>+	/**
>+	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
>+	 * poll period in nanoseconds at which the driver polls
>+	 * for EU stall data in the buffer. Should be at least 100000 ns.
>+	 */
>+	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
>+
>+	/**
>+	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
>+	 * EU stall data rows to be present in the kernel buffer for
>+	 * poll() to set POLLIN (data present).
>+	 */
>+	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
>+
>+	/**
>+	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
>+	 * EU stall data will be captured.
>+	 */
>+	DRM_XE_EU_STALL_PROP_GT_ID,
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.45.1
>
