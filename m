Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6C6D19523
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 23:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEA410E110;
	Mon, 26 Jan 2026 23:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH0RjrS/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0E210E110
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 23:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769469723; x=1801005723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=teuUO5B/JzIs9Al4q7Q1MZXTCnczppigRGPihDavbMk=;
 b=UH0RjrS/EIsYDssOA6Pw8f1XASKZaP5xnh0GJCTCzOJWah+0XowbIPX3
 bOpXQOo3K3eJNtXLwM8Um3WpmQbgfcPvOoPyO/KvD9ALbwcBzxnlu2bhA
 RU/hskWoAnXyYwDAz4G2EOpLlqCyZY1PMyZAmH0a+vLJku/OyuJYgv8Sy
 w4eldHcQurVLmrKXEYsARx6eauFqOJ9F0NzRp20qpUqNCJWJNKMMfYTtU
 OfTGFq6fxixevKzdljHHnOmPXGzgHYpVKeviQ+AqYbtGIE89unw8K1ndj
 H8OzbrQ8DUH/qVFu2SqaaH9fFSe+Tlt+aL8k8BKZLSRvZyNEELe1YziM7 A==;
X-CSE-ConnectionGUID: TMpIC+lNRi2KuPVwXGlIBQ==
X-CSE-MsgGUID: obMgVsGBTUaLJ/7Lb+X3XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80957252"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="80957252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:21:56 -0800
X-CSE-ConnectionGUID: OAhVWtnrRtK98u+gCQQLUg==
X-CSE-MsgGUID: 78VseY93SHeq59orvRv25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208248670"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:21:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:21:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 15:21:54 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5uGFmmjyOFRiowR0mBldOTWgCSfCtBNYySnPWBCwurTqHQZHzUo7fgETl0qz6Rtj2N02A2RcXwlwhAQobJBtoRYnTIy8Hm3mPY5bmHeuFWc6blY+tVe1LD7ZApGu/6Xdol++7ugjmCYg+Vb5Mwfh+fHrou714MOH5QG4+qutI04A9Fod5J8ZGUbfa5FOVy/4P5CmqjJGs5YCKrhbXwe/gbVgKZjJwoNi5fl2rjMpbEuhrOO340h2B7H/Xc9Ol/UT5tFa5nkN2t5/K//jnd5CDPVmpKng5MV13rXXNWDQg/oEYyPQM6mZIS0FB5klBnjtgMxq6kWaSirSFksq1s2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv7tNqaMualizyG8+HXjpwOUczU40kkCQruUpBcbmeo=;
 b=gMVBq3O6hYcjdTpgpZvh0AXpqznpD5LyauBj6+WH/3xGAHxGz8ILpMzCjWX/CU+LK4yfw//TvoljJABhybX5BX8Iy4vxqXSOaLmdq20ONib9LPYxEZUe3xpVgoTRnMUeD4SxZiP4tjTa3g7IUkdWiFynJpFSXLpgthHlm/CrEsFCmsanEMAXSeJ4dazRwGxgTBN2YQgX5M8aJ/N6nH1cEmwbHP3tthMgA+7kVIAkXsGZkC7qufZNTDMpVDTR5Z2i7qT3gGuV9/S2CgzC4bhcOATzTUFYNlivCrQRDGvOr2hcpb87kVEtjOj/0/rZBQWyH1YzN3aUVSznpWasdo4nVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 23:21:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:21:52 +0000
Message-ID: <0e4d6316-6734-4564-bfa5-6c13085c6824@intel.com>
Date: Tue, 27 Jan 2026 00:21:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix CFI violation in debugfs access.
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: George D Sworo <george.d.sworo@intel.com>
References: <20260126231011.3834087-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260126231011.3834087-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0032.eurprd05.prod.outlook.com
 (2603:10a6:803:1::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0ca239-61e3-452d-6d65-08de5d31affe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHVIK0p1SzkzSGZRVEd5Q1lkbWhGREdFZkR1d3lWYlYxVnFDcDZtZFVHUFY4?=
 =?utf-8?B?TFZ3SkZMUm15OGg2TnlvTE1QdlRNVGNTZlJaU3c2Tjh1NmhNVGNrRHROcmI1?=
 =?utf-8?B?WkphMXRZV3ZIcEpmTnNDa2hwaVFaNXI2RVJTY1psTFc2UUw2QStPWFBFZXhQ?=
 =?utf-8?B?WGpxWTB2UHRmejVsWllHb0tYckFaVXJ0Vkd3SWt4RnovTWxqNFFWZEtHWWly?=
 =?utf-8?B?NkZVTlRjc1JUMW9icE9oZWI1Qkg3U1pCdi93TVBhcGhmbVE4amdwTUxpamNZ?=
 =?utf-8?B?YXdkQW8yelZKNHcwRFpRR09zREVUTWt1VW1zLzJJSCs1dFFuMGZGMTRHN1Vn?=
 =?utf-8?B?UllwdFRxR2g5bHY2THlCM2h4eGIyT3AxVTVjVFhPV1NOM3Y2eElKRTVQc2U1?=
 =?utf-8?B?K1Vya2R5cE04bWpJWUtPek84N1h3WkZzU3F3Q3RJMEU0SytoMmFBd0xhT3Fx?=
 =?utf-8?B?Wm9GR241TzgzUmJ2YUtBSjB0S3FjUVBQS1AyY3N0V2NxVkdrSkphcFB5c1J2?=
 =?utf-8?B?NCtvMW4wKzVqMy9kQUI4VVZTOEt4S2hPMFJjZXJDdkR2b0dJcmZKczB3anFX?=
 =?utf-8?B?b0tNTVZSdEZJdTNtUkZrUkNtMUlQM2gxek5lM29KTmdBZ253YU1wcm12azFw?=
 =?utf-8?B?NVV5Nk5TaVJaU0RWUFZyUGs1QkRxOVk2U3VLMFZNYlNqV20xT1VyaWJjT2pk?=
 =?utf-8?B?T1YrWDUvVGhrNDByR1M5eXJENmdaY2s4SlJiUFRHUmNUeE9McGtXZmZIQjU1?=
 =?utf-8?B?Znl2TFdkckdEK0dWY3dROHBtUkdhZXJ0ZXMzTUNqWkRiSXZWQXRndXFFNllI?=
 =?utf-8?B?K2RZTHpxT045ZVNudXdJRUhYdDlxZ1lkcmJCcGpOcWp2MnNNdk94bWcrcTNn?=
 =?utf-8?B?Yk0xUkFsdlBsVlZDakJXdVUxZEo0M1JRYW9CK053VFh6aDUyQldwN2tGMjZn?=
 =?utf-8?B?TDF1R0FIR1BsZWxiSlpLSGhNT2lPQ3hxN0RSRVJXRHN1UTNBQjgrSE9DZVlO?=
 =?utf-8?B?WEJMajF0a2gzbmxpUFUzNFJSZFN4MEdxN3M5T2RpNjZNblB5cEhla2V5d0cx?=
 =?utf-8?B?aERCcjdOZlJyRGxDQitvNHJmaUtKWExFK3dPUnVNNTAyZ0kvaldnSkovYTV5?=
 =?utf-8?B?amVGN2lERXdWQUFUQm03bS9YVUFLcWo2ZFYxeHBDK1p0OVdIa1RPZnpyQnYv?=
 =?utf-8?B?bmV2UFlEUWVZaUZ1Qmh6a2ltczYvZG9wd3JsUkg0aktpOVdiNnNxZ1ltQiti?=
 =?utf-8?B?aFp5SHdhQmJlYkNLYk1RdUZKUThjRHB2d3VCQ3JNMzZpNE1IcGpXR2RCR2FI?=
 =?utf-8?B?M2d2K3NEZ0lGNkp6VzFMZjVpMi81ckVYdkVCTCthTUo1dGlVWHFOc1dKK2Q3?=
 =?utf-8?B?MmdaREYwaDlwVmN4Y2xTcWxJUENRM0pteFllK2JMV1NLMnlwY040UExCN3BG?=
 =?utf-8?B?KzA3dTZZM0RXc004dUhFNHROS2lYbVlsaDd4OXE4Tzd2eXZFdDRFblBBSVNS?=
 =?utf-8?B?OHRTL0UrLzJnT054QllxazQwV2l5SVJtWFRTWWZ5RzRVNWZrUXdnbkJKY0FN?=
 =?utf-8?B?WXBDT2JFU0hyYWhGNUR5b0NiUVJnVnZySEVoUURHZmxrYWVhbGlRdHpwbkRO?=
 =?utf-8?B?R24xcGpBTHE1TDVmQnEwUThWU0dJMmhHVklyK1VJS2xVNkJKRmtBeDJTZXRD?=
 =?utf-8?B?anNhSWJZTjZNSjdEVVlKTjUyeGlodDFBVHFmdlh3MzRQYjJVZ2EyeitRQU5C?=
 =?utf-8?B?ZGJZTXVtejlIc0IyRGMrVnJpQlpqYzJQQlduaGpxTUpCeSsvTTArUFJTcXdq?=
 =?utf-8?B?WHE5NkRXYWlkTEUxVkhQNXdSVHVaTSszaE52UGFqMENaODZmNk0vZGUrRGpW?=
 =?utf-8?B?bkJpOVhvOVczNXVhQlNROGpBeXFkNGN3alE0YXlJbnh5RVllWG1ZUXhoWi8v?=
 =?utf-8?B?eTVqSnlCTlZRUnQzQm5oRXNmbXdMS1Mrc3FQcURiQWdtWnRnOTRTb21NRVY3?=
 =?utf-8?B?VElMdk5oS1cyZUZncUd0cVlBMW9NWTBmSmlraXRZQ2xrUGl3Z28wanl1VDRS?=
 =?utf-8?B?RGUvMUdUbGpVbXhGZ2JBYTdYN3JTbTFtZlo2WjQ1dWg1b3VpVklSWmhLdS9q?=
 =?utf-8?Q?Zxls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDNtdWlMM3JuTmRkRUpRaDlkdlNYOHdhUU5TV21DQU02OGRDVU95UkR5K21v?=
 =?utf-8?B?T2ZhT1haK1lrdGVyTHZ1OW1ZTnBSdSs5MVdweVU2dzZPWVFvQldqdHZIa2RZ?=
 =?utf-8?B?WFliaVU0TnFRVTc2ekpDelhCZ3ZsVXlnZE1lRE5WTlIxY1pDemkrc0VoUFRS?=
 =?utf-8?B?WlRaYWhXZ0p4L3plYkRDNVlOUnFSdmk5WEFza3FOWUZWazdqOWkrcWlTVk9H?=
 =?utf-8?B?NmpvMEtaTnNnOVlpNFNNR2VRQkZPYk9MYk44aGlXUlNmUVV3TStaOHduOGpP?=
 =?utf-8?B?UGpBVVEyZ3ZMN2k2WlE4L2owYzh1Mmx5aUtEV3VFUFZlSXNqVmFoc013THVs?=
 =?utf-8?B?aGlJM1lyb3NqQVIySTg3dWVCVi9BNjFlVmp6OG9GTjYvd0FNVlJwYWRqUzdl?=
 =?utf-8?B?MWN0Yk8xMStXaG8zeHEzOUl2OXhua1NnVWd1VWhON3UrMWJrVXIyQ1RDeVJK?=
 =?utf-8?B?NTNtWk5Qc3FRYzhNUGtHeUtwN3VWRGgzS1ZZbXVheWVDUmJQOUtQMFZ0Mi9I?=
 =?utf-8?B?SlVuSHAzampQaDRKdkFYMDRnVGFmYktack5nUXdKR3pCT1EyR1BQVG9FbEVv?=
 =?utf-8?B?ZU5NdS94angrNlhQTi9lRTFwcmdXS0JTNnlRUVFORktkQ1NldlJCQUJEM2xI?=
 =?utf-8?B?T1dlbitySXBnSktzK084VWpRdXU4Mi9BSDgxYmRDRC9xbWxKNFFuVC9PR3Ns?=
 =?utf-8?B?alBydDJkWDY1cGc2cUNRNFRvM2Q5Y1JFL3VnL2xVUmNPcjF4bWtrUXA1WjAv?=
 =?utf-8?B?SUlCRTNGN3FnMnhham84OG1OZGR2a3ZRTWRWNUVaZHJLTDVUR2xaQkhNdGpK?=
 =?utf-8?B?YUNpZlVmZGliMXRSQ3RFZk5CRDFwSGxsMUp4ak8yZVZ1dVdyeHdyczk2WWFj?=
 =?utf-8?B?bXJXNk8xaVhqL0UrUHFTclpxR1FHVVVDVENJM01RajgrRk1xT0gwWXE1UCsy?=
 =?utf-8?B?NTRCN0FKN0dOa3VoaHI3N2RDbXd4SzdWUzd6VFZIV0cyNEdYVUlmS203cFN0?=
 =?utf-8?B?cDY3U1dQUzNpQUtuTHZsN2ptdTl4QVBVZmw3ejlqUEF5ZmcrL21ZUk5zNnJV?=
 =?utf-8?B?cTFNNGFnallxV2w0OVFQU0VueDJwbjk5UW5sMitZWS9JK1I0YXNZaUpLYUhB?=
 =?utf-8?B?NWw5d1MzTGxXemIxSmdjZXZKUTY1Q3I3Y1h4cjZXcEEzeGt1MHZlODc5cWpx?=
 =?utf-8?B?NjVVUGNlb2FhcWZPYS91bi9JQnB1QXNaRTZ0ekVYdG9HbXlrSTNpMmR2MERz?=
 =?utf-8?B?RC9McWxOTGNaNnZNN0Y5dG5LQ1ErdlhBSlBkbEdWbnFtZUY2VG5FMXc1MWww?=
 =?utf-8?B?SkRWUmVYWCthSUZyTmd4MG9CMTZOR1BVU3ZCcW9iSVU2bzVtQ1JES09NNzBR?=
 =?utf-8?B?V2Z3Mk53NEhaRUJnL0k2bzJKdWlGV2pCVHBjcUZWZXBaMnVKV0pXTmlEd2ho?=
 =?utf-8?B?OGUwbGdTMHJGWnljVnl4WWVDMUdQTlVNdDRQRGdmb3NYaWY4TmcxUWU3bEJN?=
 =?utf-8?B?VVBnUm5FZ3ZWWFJSdlhZMlp3ZHZCZzlFaEZVaWU2d0VvdTlkaG5uUWVaUWU3?=
 =?utf-8?B?YnBGT2dCZTlXbzJoRTVXNW5zOUd0eWI3RWZwYlFUMWF6NnpXWnNFOFlRQXpS?=
 =?utf-8?B?cmV0WFh0VVNDS2JSRFF1bG1oWHZ3Y3E5WkJKbzZqQ25RVFduanpFRXdoalJy?=
 =?utf-8?B?dzRndXRxNjgzVWNjdUVRcE5WOW55OHhHc3AxWDN3TkJKbE5vTFp5bW4zWFJG?=
 =?utf-8?B?aGJsTTQ3VS9UVzVnTXBsSGhqdWIzcElrWWhiM2gxKzZFUTE0alcvQ0VKUTlO?=
 =?utf-8?B?TXJUdjNNQ0l0Y21aMTRZdVBsMDg2ZXhpaVB4Skh3cDYvWCtmN1NXeEYzTXpQ?=
 =?utf-8?B?RHhLNGdhbzBlY0FJemJvWFJQNEs2TERlcWhLVUJvYXU2clVBQWFnWmJsSk90?=
 =?utf-8?B?RFFhL0kxbjVEM0JJOVF4ZFBiVFlIOHJBaGpSWnpzaTMrSHhTZVUxa3JtemxZ?=
 =?utf-8?B?WTVCd2ZsMzY1cXQzbytlR2F5ck9VdWU1NkR0eVY2RDdiN1BmbVBubG9jZUJq?=
 =?utf-8?B?OVIzdTNWU2tWbm9wS2c3dzdSQS94RWdrdVBQQ2wwV2tuajFmZ2l3bytIOXZ5?=
 =?utf-8?B?M0hKQ3dPWDZvdVN3TkdpamNxY2tFV05tUnl2c0MzTU11bksvVVkzRTVJUVRY?=
 =?utf-8?B?ZEMyenBCaUpLWWN3anZ4V2tvWEFKay8wSHNhdU1uOUIyMlRmL2g2MEhsTzB4?=
 =?utf-8?B?WnFxZ1JMV0NEUFNKR3hsMXVwWkdRQkJKOHRKeVQzTm96byswNFgybjBrNnVl?=
 =?utf-8?B?TkRUMHVZem5YRTJkUmtNOGVMazZac01zaXlDYjBCUWNGNHcxdkVkcjY2d1lk?=
 =?utf-8?Q?Z8deh0/1x4jIIGPs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0ca239-61e3-452d-6d65-08de5d31affe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:21:52.3091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edXbfUqrbLrU7iiyAOu+sOqUYpS+k9zzM4B8Umu6xXHLy7jlJptcXjGibG1tIw8h6b09oJwl7tFMrpWpFRfq0Hvnc+nEOHGg9BJwaczVZXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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



On 1/27/2026 12:10 AM, Daniele Ceraolo Spurio wrote:
> xe_guc_print_info is void-returning, but the function pointer it is
> assigned to expects an int-returning function, leading to the following
> CFI error:
> 
> [  206.873690] CFI failure at guc_debugfs_show+0xa1/0xf0 [xe]
> (target: xe_guc_print_info+0x0/0x370 [xe]; expected type: 0xbe3bc66a)
> 
> Fix this by using a local int-returning function, like we do for the
> other debugfs entries in the same file.

or maybe better option would be to fix the xe_guc_print_info() signature and return int ?
then we will be able to correctly handle this forcewake error there:

        err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
        if (err)
-               return;
+               return err;

> 
> Fixes: e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: George D Sworo <george.d.sworo@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 2f23119686d4..1a4c940ebecb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -74,6 +74,12 @@ static int guc_debugfs_show(struct seq_file *m, void *data)
>  	return print(&gt->uc.guc, &p);
>  }
>  
> +static int guc_info(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	xe_guc_print_info(guc, p);
> +	return 0;
> +}
> +
>  static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	xe_guc_log_print(&guc->log, p);
> @@ -110,7 +116,7 @@ static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
>   * - without access to the PF specific GuC objects
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
> +	{ "guc_info", .show = guc_debugfs_show, .data = guc_info },
>  	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
>  };
>  

