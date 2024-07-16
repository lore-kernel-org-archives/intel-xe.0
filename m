Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FE9C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 07:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CA610E103;
	Tue, 16 Jul 2024 07:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyQ9OWtE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CF610E103
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 07:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721114468; x=1752650468;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M6cu9wvRj479gtmT2z3rKA0vyOjVg4ur/yj3ChqWbYA=;
 b=lyQ9OWtEuZuSFR/aYZpNy2B/xoA8yJm6/0Uqx35EicEK8jFKpsedrnEL
 fl9OQ2H669pENMwuU9xgagbAoOXOtB/HFN6RP4N6MwaUSeTEFzkek4scU
 ocOrcUH2Wown9SeMuoYP6Ib9dyl6bTGB2bcwNJGvA+7ZDvmy4mzoc7DAC
 qUacQTyfH8MZDFxeYbtQcSG8wp4FAKy7UgAewZgG/1AJfEVLrKjddr2Ro
 w+Ee4BVjpnDCPKsJ+AVb4SiZxeqbttZ0DaNo0i6tBNxHtQuGxugEjJ4ss
 9MWyJ3u94Cqt5NLTWewU4hVzRpU3aofcoxPReQgFUhydanztBnWiMzIkv g==;
X-CSE-ConnectionGUID: Vl2f+e0dR/ydMqDdjWtupg==
X-CSE-MsgGUID: /ZeJJf1XTuixfWscUdV1Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="21445349"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="21445349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 00:21:08 -0700
X-CSE-ConnectionGUID: tu0FbM7rQ8WggE6J6RZQAQ==
X-CSE-MsgGUID: x5W8PknGQayuHK9duLXKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="50307212"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 00:21:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 00:21:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 00:21:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 00:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf352oxFFwtuGPbdKgDzEOPl5+oJQ7dpsxrKeV6Xz4miQgLoO9kMKLtYdP2Wtf/6semdb1kDNihZhclcWlaxAU0ayXcH4wjZnz2sC9/hYmEJqy3okhHEdjFCXFhICdArCPCQTJEOvjAiPM4zebiNb8u2zDC98VP+v8sEFGJPvb8TBoSpxeeTCYdQGlb0GKWOJ4ZQpxoCUk3pErw8lnGum0tbmPxGw8NOUn6yiFm2wUP9aH+BSbQ4p8b22BmBGH8UHfe11a1KAbhk3nhPxzdHspgMG+bkE05iqufQiwi8SMhrENM2+7Y3FlO/zOlq2nvxIv82iCxV7TH/5Ttqcp3EhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCw9dMg1rpyO4J5xo5ikoHSsk0ftqlthEX0eGu2umGg=;
 b=SPTY/z8UdZUOl1c8HRvj+SUKvMWgNVH72ZQEd/nrxd8k1ftSkFo/FTG9QbLJp6REl4nwFPgZrHqzWTNQIbUGuj1xpUCyMhYDp/IASbawPjYIg+d1CklrBUzVy/2p7ig/7BjY9urgM3Qp0/zxFydH6KYEAxAuZNKJOH1CWOfuG+FgbsQ+mv8yNeqze8jd24/waJUvN8fWW9umwrqlt4kNKzSiw7/rIzrltHSckf1BjYqeVb2/pYZrDxGmEJ/i8iEhCqSqXWj/9lug6JkF5HXIKfdQVtoOg4a9SATJUX8K0OwyiZYAy1WCU4WN0SLAu/MBgIDj4l6YwY2zykzie8fvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 07:21:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:21:04 +0000
Date: Tue, 16 Jul 2024 07:20:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 3/7] drm/xe/xe2: Introduce identity map for compressed
 pat for vram
Message-ID: <ZpYfM7LOjnjU3YL4@DUT025-TGLU.fm.intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
 <b98a7f3d85f585484a4b6ea7a7fba501b9e42e02.1721091282.git.akshata.jahagirdar@intel.com>
 <ZpYa+2dV9DTH7f8Z@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpYa+2dV9DTH7f8Z@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 76be2eef-590e-4936-45c1-08dca567da91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW1HWkNKSmxkaUE5UU1SSWE4ZG5iOWx1eHlVVXRwQkpOM2E4ampRM0pCUjhK?=
 =?utf-8?B?N2FaSTRMdU5ReW5BKzhVWFo0aHZ0M1lWUXJCUmEwL0dWRTZ2QnlkVEJyb1RS?=
 =?utf-8?B?M2IxNk9Mcy8xdmFoYmFNcDRBZE9NcnV5Uy8wS0IvU3BLTDJibDdYdmJOVFZr?=
 =?utf-8?B?ZDFCY0ppS1JBNXduZnBCcVpWaHcwblRud0EwV3dORkNTa3pVNmZhSW8zNGNj?=
 =?utf-8?B?YUw1YWhLbFlGZFNFdi91Y2pLYnpSQ0pDUFRQQzlmc3g4OG1PYkQxeVpOUHl6?=
 =?utf-8?B?WWVxdDhQQzcyMWlpZGx5ZjlCZHNDVVMxdkxtcFFpVUxXcHQrWklCTThuZ3Bj?=
 =?utf-8?B?TEIwNVFOdytWdngrVE5xSWNUT29yZTRUMW9pSXR1MUxBRFRsZnV1T3lpUUVS?=
 =?utf-8?B?c0JHZDNNcWxPVVJYQ01zNjRkUmJGQXZSakFKbW1NZHZ5VkxFdDVMYUpGb2Q3?=
 =?utf-8?B?eGpEUmVobEZkOVdvK3owYzRXNHh3OWk5K3BYbnYybExuakFsVnZJbHhlU2dN?=
 =?utf-8?B?dW9HWVlsbjVBbkFuZkJMRmdvSTJFb3FlSG1ibjNLU3NvOElWM2RodkwwRmJU?=
 =?utf-8?B?SjEyWllFY29kekFWS1cwMW9LcWxRdnh5NVFlZTdGQ0IySnFPR2hHTTZOaHIz?=
 =?utf-8?B?UTFVSXRTQzgwTFhRQ0Y1dzdOTy95NjRRb2EwV1pwQjVxandiTjdlZ01zSXFH?=
 =?utf-8?B?U3lJVG5pV3UrQ3lWRVRWVnN1bUNJTTNYbkNmbzFFWGNzc0FjTlFZaHUrOXd3?=
 =?utf-8?B?NEVtK2Mxc0R2anQrdGhIQ2UxV2JtZ3g1MzBiakh5bmRNVlFqend5azIwK05J?=
 =?utf-8?B?dFhuMDdEdlpLYVhQQmU3QW9CSXd3dVRqK29nYmVUN2h6WG9Nb0lpRGxUR2dP?=
 =?utf-8?B?L3craENsRzM4S2RmZzdaLy9kVGE3MHJnK2tldmlCTS9kY3NqYnZVVk5hRVlk?=
 =?utf-8?B?SGM5bklwYUpGNGQ1QlEwTXkyVFZFMldxaWdrdFNlcWpnRnZTOERpNGRiVFFa?=
 =?utf-8?B?MkpkcU5aM3BiZ1JwQVVvbWIyQzVUSEhTVHlMTDVvYzZ1aUhJQVFRQUlvbmNT?=
 =?utf-8?B?TkNuTGtNajFDeTJSMzdWZ1ZIcFBLdUUzbHZhRmpReHBtRllnOXJrVDBlNkNB?=
 =?utf-8?B?bHJ4Ri9NMnZsV1hCSFZlMWVOczJDTHE5WFJBaTlLTVN5S0JJTGorbFlKS0hm?=
 =?utf-8?B?TE4vWit5UXdQRXN4L2FtNzdnOFdaditBWllUWERWRFYvMGludmhzYXcyaVFw?=
 =?utf-8?B?YXpXY2Y3Y1pDdjBRakQ5OThRRFV3Q2YyM3JxMnovaEdWUmxnWG4rWEVLL3dN?=
 =?utf-8?B?REZjd0hWUUNJZnlpWVBXWXQyUkJvZlZrc3dDRkRocDJiN2VaNTFLWUp3L04z?=
 =?utf-8?B?NWRVQjE1WlFqUlpZcjIyZytQK0l3b0NjOGFrSWgwSTAyVWI5WmJRU21sQWlh?=
 =?utf-8?B?cjU3ZXgxYjFQeCtOODgyNlZXdUNLOW9nTFRybmZlUm1iL3NGREQ3eW1aYXkz?=
 =?utf-8?B?Ry9EeHEvRGgxQ0w0WGtQalVuamdNcjZjcTlHaDI4VGx4bWx0TjdIQjZpTzBy?=
 =?utf-8?B?dk92S0o1OWo4SkJOdEdWVVlOUG54ZEdjTVFIYUd1V2UzcmxaMjdBRWJWMEFQ?=
 =?utf-8?B?UXFoYkI1b29WTXEzaXlmVXhPaFJFekhIZ1hNUzVQZTFkM1RRWW12bTNwMDVk?=
 =?utf-8?B?VG45MG5KSUVtMVhJTHhlVVBhVk42U0E2aHRnci9KaVp6cjJQSXhLZHNJblJY?=
 =?utf-8?B?eFFwOEpPbXNaZFdIKzRDakV5M1l4Um05czA1ckdMNjhBMEF5S2FpcnNZQ2tF?=
 =?utf-8?B?MGw3dzdjVWRna1hwcmFJQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWorVFZKVEd2MlJWemc4MjNsS1JQZThqNGJrTlB5TjZpRTRBN1hhUk4wdkRW?=
 =?utf-8?B?TDN0c1QrUko3cEEwY1g4dXZqMTNZWnFTVzlBbGVYQTV5K3BKc2N4NGZ0UEwy?=
 =?utf-8?B?bGxKVWxnc0gyUUYvd3JUck1xVnRwbWRBRjlRUjI2eFQ0RURpRmhjdkJBUXNi?=
 =?utf-8?B?dlErOEs3d0J3SG9kM0RxSldFelE3VlFlVW44bmk1Umxjcnl5ZVNONkhkanY2?=
 =?utf-8?B?TERHeG1yTlVlczZEK1RoZDlIcjM1aG16cFcxTUg5YUJjZURxcmZKdjVnR0s1?=
 =?utf-8?B?eVV3N0s0M01Dalk5Z21OR0Q2SThHbnZHU0xRajB3MmRXamMzYnZXc1RYdStM?=
 =?utf-8?B?QUczcVU1VGQ4TG9CUFZ2L2V6Z0FoUzZNWTdMSk9PL3RjUVp0NlBYNllORTJ6?=
 =?utf-8?B?dGl4MlQ1VlVwaXAvbElqMkRTNU9xYzVZcW5pQnMwU2hrK2t4M3BEclZ1Smla?=
 =?utf-8?B?Z0ZyZXdjcndzYWdpQmdKZnUvLy9yTnlSUmtIOEZLVk9xYkl4TTNTNUNUSzFS?=
 =?utf-8?B?dENtY0ZKeE9xVXkzY3FtQWwvNjRXaXJWVkl1dWx6OGVKTDdVaDJuMnN0K3dK?=
 =?utf-8?B?d0RtNTlpQkpZZGs3YkV1YnlXNjljNFo2enpMaUhRYlUvelhER3hEQk4xby9h?=
 =?utf-8?B?Y0dKWCsvNktBR3h3VFVodHliR1hqcUZUamFsNzVyZW1nVHpNb2FGVm9xRGMv?=
 =?utf-8?B?UWJRNXM5QjArOXc2ZzM5OHZ6SnVPK1hnQWdrQWRWZkIxMmwxU1FMeVo4ZWJv?=
 =?utf-8?B?ZDRheHpLZk5TQWJnL3NTdWlnY0VlTXhUcFRXZlk3Uzg1c2VKRzNBY3ljcy9O?=
 =?utf-8?B?cytaT0N3THNINnlVaFpweWRVV01CWjM2bzVxQ0o5eklBOHV0L1NNWjlGanVl?=
 =?utf-8?B?d3BPbU9CMU5sbGVYWG81RDV0NE1jSEllZEVFYVg4dDhibUJkWnJTNm5jZ2ZG?=
 =?utf-8?B?VFdYN0huMHRDb3ppclU0OXBDcEdhUGVtRVRtbkE0K21wUGU4aUdFRW1UOUox?=
 =?utf-8?B?cXprQnYrTUYyaVpiSjE5TjlyL3o2UXp2aVc3L3FyOFRKR2cxUVlYUEtwVkZ0?=
 =?utf-8?B?TTI2bk16TG1tVTVCKzZseXdWT2t1TzZuaU9LUlErY2lJdmlveXJoTmJQeldu?=
 =?utf-8?B?NjRNK1VZdzhEbDJiTnZTS1pZYkx3WlZXb0c3UHpaUlFxdGFmWk9sWi9CQVA5?=
 =?utf-8?B?cGZrOHF6Y3pjY1cxcmFNcndkTjdwV0NIYkswZHVLeE5qODVHSnRMbjkvdlQw?=
 =?utf-8?B?OFF5cUdqU2pqa0hzaXJ0RFVGRWVDVDkvM2JJNXlSclRVR1UvaldtdVBzUXo5?=
 =?utf-8?B?WmttRFU0SVFkRVRNOVBWaGVqQTJ4TUM2RXlLMlpDNkZGbko2S2xUT1ZBdWF2?=
 =?utf-8?B?ZnIxc3RTYVdnRU1RRWxmNmZtUEdnVStMVzNlcmdPdXBXS2Vyd0xHdUVDUmpz?=
 =?utf-8?B?V0loNVRPS3U0QXRPQUYrR3V0ellGK2E2b0R1bkVUUGJpQlVIWE9DSUZhRC9v?=
 =?utf-8?B?Y1ByZGlEVG1oa1BGZlRDQU96dTNvT1lER0FPeTd2M0UzQUw1WVZNZ3Urby9w?=
 =?utf-8?B?VUZJK3VEQVpiSzVnbGRXeVlxbWJSZHgyZVZoUjBxbFowcFk5NmJoWHhmMmc2?=
 =?utf-8?B?WENNN3U0VkpKVnZXNGhldUNKTElVTTFkU0lKZEZTRFBxTFVmL3VSd005dk9n?=
 =?utf-8?B?VkxvRS9sd2dZZzJiY1p4NGI3R0xHOE1hRHo0Q3BqbTlDcXRpcERpZ2hwT3Zo?=
 =?utf-8?B?bHZORXZYZzNuWk5FNHdLcjQwNUJZVWFsR1FhdmNETzRXaVJVOW95TWJyOFVV?=
 =?utf-8?B?ektjUWMzdVRDdkQ2N0NsYk9TN1F3Q3VjcHlBcWdlRU50QkNUNitHcWY5RnVh?=
 =?utf-8?B?RGpobTJSYWR3dnhDRHQzdFlWa3dxNzJjRUtGbkFMRVorNmY0WDVJN3lLWDV1?=
 =?utf-8?B?YkUxdCtIN0taK05keVpqS3JYdkp5YjY5WWJqOWhxcDB5aFlXellHeEFXUnNC?=
 =?utf-8?B?a0FyYW16QmF5WjhHaGdYSDNUbzYyVTQ3aFNmeTNWY09xb0N6Vm1UMEpsekdE?=
 =?utf-8?B?ZUV2TVlHajhtdEJTUEpWV2VCaWNQQ2tMeThEOTVzMEtVSHNwMGhtaEtaRDlR?=
 =?utf-8?B?T0tEekRYakpqdVVxMk1qdW1VU1VzNXYyWnJCSThSdmROdDVDTzdEdTM1MlBF?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be2eef-590e-4936-45c1-08dca567da91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:21:04.7861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwoPAMUS+yq7KhZHce8bNE/hH9Dnv7J95yCSnTPkwRr11ZTD7NtcWKhj1LOXwuK6JMjqMs2OfJ8BCH/20pFxpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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

On Tue, Jul 16, 2024 at 07:02:19AM +0000, Matthew Brost wrote:
> On Tue, Jul 16, 2024 at 01:01:07AM +0000, Akshata Jahagirdar wrote:

Missed a couple things...

> > Xe2+ has unified compression (exactly one compression mode/format),
> > where compression is now controlled via PAT at PTE level.
> > This simplifies KMD operations, as it can now decompress freely
> > without concern for the buffer's original compression format—unlike DG2,
> > which had multiple compression formats and thus required copying the
> > raw CCS state during VRAM eviction. In addition mixed VRAM and system
> > memory buffers were not supported with compression enabled.
> > 
> > On Xe2 dGPU compression is still only supported with VRAM, however we
> > can now support compression with VRAM and system memory buffers,
> > with GPU access being seamless underneath. So long as when doing
> > VRAM -> system memory the KMD uses compressed -> uncompressed,
> > to decompress it. This also allows CPU access to such buffers,
> > assuming that userspace first decompress the corresponding
> > pages being accessed.
> > If the pages are already in system memory then KMD would have already
> > decompressed them. When restoring such buffers with sysmem -> VRAM
> > the KMD can't easily know which pages were originally compressed,
> > so we always use uncompressed -> uncompressed here.
> > With this it also means we can drop all the raw CCS handling on such
> > platforms (including needing to allocate extra CCS storage).
> > 
> > In order to support this we now need to have two different identity
> > mappings for compressed and uncompressed VRAM.
> > In this patch, we set up the additional identity map for the VRAM with
> > compressed pat_index. We then select the appropriate mapping during
> > migration/clear. During eviction (vram->sysmem), we use the mapping
> > from compressed -> uncompressed. During restore (sysmem->vram), we need
> > the mapping from uncompressed -> uncompressed.
> > Therefore, we need to have two different mappings for compressed and
> > uncompressed vram. We set up an additional identity map for the vram
> > with compressed pat_index.
> > We then select the appropriate mapping during migration/clear.
> > 
> > v2: Formatting nits, Updated code to match recent changes in
> >     xe_migrate_prepare_vm(). (Matt)
> > 
> > v3: Move identity map loop to a helper function. (Matt Brost)
> > 
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 123 +++++++++++++++++++-------------
> >  1 file changed, 74 insertions(+), 49 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 85eec95c9bc2..53d3c044d30e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -120,14 +120,67 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> >  	return (slot + 1ULL) << xe_pt_shift(level + 1);
> >  }
> >  
> > -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> > +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
> >  {
> >  	/*
> >  	 * Remove the DPA to get a correct offset into identity table for the
> >  	 * migrate offset
> >  	 */
> > +	u64 identity_offset = 256ULL;

Since we are here, 256 is a magic number used in a couple of places.
Let's add a define for this. e.g.

#define IDENTITY_OFFSET	256ull

> > +
> > +	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> > +		identity_offset = 256ULL +
> > +				  DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> > +
> >  	addr -= xe->mem.vram.dpa_base;
> > -	return addr + (256ULL << xe_pt_shift(2));
> > +	return addr + (identity_offset << xe_pt_shift(2));
> > +}
> > +
> > +static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> > +					u64 map_ofs, u64 vram_offset, u16 pat_index)
> 
> 
> Hate to be pedantic but I'd make adding this function a standalone
> patch.
> 
> > +{
> > +	u64 pos, ofs, flags;
> > +	u64 entry;
> > +	/* XXX: Unclear if this should be usable_size? */
> > +	u64 vram_limit =  xe->mem.vram.actual_physical_size +
> > +		xe->mem.vram.dpa_base;
> > +	u32 level = 2;
> > +
> > +	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
> > +	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> > +					    true, 0);
> > +
> > +	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> > +
> > +	/*
> > +	 * Use 1GB pages when possible, last chunk always use 2M
> > +	 * pages as mixing reserved memory (stolen, WOCPM) with a single
> > +	 * mapping is not allowed on certain platforms.
> > +	 */
> > +	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> > +	     pos += SZ_1G, ofs += 8) {
> > +		if (pos + SZ_1G >= vram_limit) {
> > +			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> > +
> 
> We can't reuse pt31_ofs twice here. Both identiy maps need a dedicated
> PT for 2M entries. So I think the 'pt_ofs' needs to be an argument with
> the first call passing in pt30 and the second passing in pt31.
> 
> Also then this code will have to change to use pt29:
> 
>  163         /* PT31 reserved for 2M identity map */
>  164         pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
>  165         entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
>  166         xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> 
> e.g.
> 
>  163         /* PT30 & PT31 reserved for 2M identity map */
>  164         pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
>  165         entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
>  166         xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> 
> Lastly, I think num_setup will have to 'num_level + 2'.
> 
> You can do the PT shifting conditional if 2nd identify map is needed
> too.
> 
> This one of more complicated parts of the driver so please do not merge
> this without an Ack or RB from me or perhaps Marteen.
> 
> > +			entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> > +							  pat_index);
> > +			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> > +
> > +			flags = vm->pt_ops->pte_encode_addr(xe, 0,
> > +							    pat_index,
> > +							    level - 1,
> > +							    true, 0);
> > +
> > +			for (ofs = pt31_ofs; pos < vram_limit;
> > +			     pos += SZ_2M, ofs += 8)
> > +				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +			break;	/* Ensure pos == vram_limit assert correct */
> > +		}
> > +
> > +		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +	}
> > +
> > +	xe_assert(xe, pos == vram_limit);
> >  }
> >  
> >  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > @@ -214,12 +267,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  	} else {
> >  		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >  
> > -		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> > +		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
> >  
> >  		if (xe->info.has_usm) {
> >  			batch = tile->primary_gt->usm.bb_pool->bo;
> >  			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> > -			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> > +			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
> >  		}
> >  	}
> >  
> > @@ -251,49 +304,21 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  		  | XE_PTE_NULL);
> >  	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
> >  
> > -	/* Identity map the entire vram at 256GiB offset */
> > +	/* Identity map the entire vram for uncompressed pat_index at 256GiB offset */
> >  	if (IS_DGFX(xe)) {
> > -		u64 pos, ofs, flags;
> > -		/* XXX: Unclear if this should be usable_size? */
> > -		u64 vram_limit =  xe->mem.vram.actual_physical_size +
> > -			xe->mem.vram.dpa_base;
> > -
> > -		level = 2;
> > -		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> > -		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> > -						    true, 0);
> > -
> > -		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> > +		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index);
> 
> So this is existing code but it breaks if
> xe->mem.vram.actual_physical_size > 256G, while you
> are here add an assert for xe->mem.vram.actual_physical_size < 256G.
> 

Assert should be '<= 256G'

Or with a define...

'<= IDENTITY_OFFSET * SZ_1G' 

> >  
> >  		/*
> > -		 * Use 1GB pages when possible, last chunk always use 2M
> > -		 * pages as mixing reserved memory (stolen, WOCPM) with a single
> > -		 * mapping is not allowed on certain platforms.
> > +		 * Identity map the entire vram for compressed pat_index for xe2+
> > +		 * if flat ccs is enabled.
> >  		 */
> > -		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> > -		     pos += SZ_1G, ofs += 8) {
> > -			if (pos + SZ_1G >= vram_limit) {
> > -				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> > -
> > -				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> > -								  pat_index);
> > -				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> > -
> > -				flags = vm->pt_ops->pte_encode_addr(xe, 0,
> > -								    pat_index,
> > -								    level - 1,
> > -								    true, 0);
> > -
> > -				for (ofs = pt31_ofs; pos < vram_limit;
> > -				     pos += SZ_2M, ofs += 8)
> > -					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > -				break;	/* Ensure pos == vram_limit assert correct */
> > -			}
> > +		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
> > +			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
> > +			u64 vram_offset = 256 +
> > +				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> 
> With this change, this code breaks if xe->mem.vram.actual_physical_size >
> 128G, add an assert for xe->mem.vram.actual_physical_size < 128G.
> 

Assert should be '<= 128G'

Or with a define...

'<= (IDENTITY_OFFSET / 2) * SZ_1G'

Matt

> At some point we may hit these memory limits so best to protect against
> this.
> 
> Matt
> 
> >
> > -			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset, comp_pat_index);
> >  		}
> > -
> > -		xe_assert(xe, pos == vram_limit);
> >  	}
> >  
> >  	/*
> > @@ -480,7 +505,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
> >  }
> >  
> >  static u32 pte_update_size(struct xe_migrate *m,
> > -			   bool is_vram,
> > +			   bool is_vram, bool is_comp_pte,
> >  			   struct ttm_resource *res,
> >  			   struct xe_res_cursor *cur,
> >  			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
> > @@ -492,7 +517,8 @@ static u32 pte_update_size(struct xe_migrate *m,
> >  	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> >  		/* Offset into identity map. */
> >  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
> > -					      cur->start + vram_region_gpu_offset(res));
> > +					      cur->start + vram_region_gpu_offset(res),
> > +					      is_comp_pte);
> >  		cmds += cmd_size;
> >  	} else {
> >  		/* Clip L0 to available size */
> > @@ -783,17 +809,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  
> >  		src_L0 = min(src_L0, dst_L0);
> >  
> > -		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
> > +		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
> >  					      &src_L0_ofs, &src_L0_pt, 0, 0,
> >  					      avail_pts);
> >  
> > -		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
> > +		batch_size += pte_update_size(m, dst_is_vram, false, dst, &dst_it, &src_L0,
> >  					      &dst_L0_ofs, &dst_L0_pt, 0,
> >  					      avail_pts, avail_pts);
> >  
> >  		if (copy_system_ccs) {
> >  			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > -			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
> > +			batch_size += pte_update_size(m, false, false, NULL, &ccs_it, &ccs_size,
> >  						      &ccs_ofs, &ccs_pt, 0,
> >  						      2 * avail_pts,
> >  						      avail_pts);
> > @@ -1034,14 +1060,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >  
> >  		/* Calculate final sizes and batch size.. */
> >  		batch_size = 2 +
> > -			pte_update_size(m, clear_vram, src, &src_it,
> > +			pte_update_size(m, clear_vram, false, src, &src_it,
> >  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> >  					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> >  					avail_pts);
> >  
> >  		if (xe_migrate_needs_ccs_emit(xe))
> >  			batch_size += EMIT_COPY_CCS_DW;
> > -
> >  		/* Clear commands */
> >  
> >  		if (WARN_ON_ONCE(!clear_L0))
> > @@ -1151,7 +1176,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >  	if (!ppgtt_ofs)
> >  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> >  						xe_bo_addr(update->pt_bo, 0,
> > -							   XE_PAGE_SIZE));
> > +							   XE_PAGE_SIZE), false);
> >  
> >  	do {
> >  		u64 addr = ppgtt_ofs + ofs * 8;
> > -- 
> > 2.34.1
> > 
