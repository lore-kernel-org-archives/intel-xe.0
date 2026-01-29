Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A625D73EA7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0988E10E19D;
	Thu, 29 Jan 2026 23:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHUqRSnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCE010E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769729357; x=1801265357;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K418G5WXC++4E2nSbbp5lXMnCZ4klFXtxGF+GyrJ/kI=;
 b=cHUqRSnGKTN+HkPOBVAYyo6ZK8ldAd0SumwMIGuHnawvvwqSWilLcC92
 vT604n3DNn2nBdlNIV7JHeUvsBPhj9xfEWd/hnkb7RzdJI/X6So/aRLV4
 Wmeya72LK5iu5WJV6TGcFgDtBmPK8ycjA3+P6XWNnOJ7Sj+gj5cA09WlY
 TmkpluKqf9/CBkv5vxDy1GeeC5Gyvlr+gpbY65++xNEw/KKz3QcV7JD/Q
 Bjd6H+2OnVCK2bXcvlDyv6wj/CvokiQs5z1t15mDL8LCTw7YAR+08sPOv
 0euKPyYVd73F5n7dJf5agiKNzhrAqxZDJxcdyuPPiDZOVoNKdZL7FvjMI g==;
X-CSE-ConnectionGUID: rYouK1QjS6qLiMq03A7DuQ==
X-CSE-MsgGUID: AvZJ2tSoQ0muOee5QJzTOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82350170"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82350170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:29:17 -0800
X-CSE-ConnectionGUID: Lag8fHXiQvOopSlnRv3pxg==
X-CSE-MsgGUID: y1LqooFPSpO1+8sMHchV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213613804"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:29:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:29:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:29:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgMUWKrQ4okvb1h+vN4jF4J0DCRW/DD41tIfIJKyeIalsDg78UAPgvbjpvtkrryhQtEjdwTrJVLpw62fjO2e6DXSdWmPz4qP9OynlNndhHQ8Popc6qjFQj2jgP/SarX3+bss2xwHHW3Z1WM9d4HFH4EaERY0saNSL5Cj0QwXGxUW9iCSi+yZzDcfRjtcNeY0kOxzqaWrGKGRoyGUZQp9ASx2QC8n6ruQxC8pCvnO9338R2ZCrBxp2a6t+Cb2FQDQr9quAeGzsFvpBdTqxN/svmSD7pgreBWtBPzODFhMamXLDFfL8PdaY80xYFQysrcVLzIPxsxx3JwwOEGD3q/cgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D5zQFmyz8UHYa7CG8/8n43iSb2KvRQ/kaeoGvFzRps=;
 b=RhsOhTcQ63vjQryqhK9unKGcxrCj1lSsJqsiTP5+nQxdAKnRhSVkop+Vt6EhaS83YywE55c9cDpwtqxyylMXke/wGxKQ0t76rSlOoRsnkYOqps0oQ3yl0DkhtibzsuZaSvrHUsZhS+SNb9TIIp5pK/7akwYnupjsiCryCqt9/GIsqtsgGXEjBx0upSh6wezVyyiOoCIt5si0cKS0hLoYLt5fH4GLWMjkAoYk0iTHagna39PGCo+tzYx7ArJCi55SXCRPZOU1Mhy2it1AIhSYQ35LjHGH4CNP3dax4M+xBEWaOKw7+IeOohZkFMOR72gI+W+u7qzdTruJMZLLt3apkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB8807.namprd11.prod.outlook.com (2603:10b6:8:255::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 23:29:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:29:14 +0000
Message-ID: <8f41acae-ef4c-4b27-beec-25dcc5271eb1@intel.com>
Date: Fri, 30 Jan 2026 00:29:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
 <20260129225606.412902-8-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129225606.412902-8-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0145.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: 482961a3-0e5e-44ba-af69-08de5f8e36d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzU2a0ZacEJNZFhsUVNOUGFJL3BNOTFlMnUrVElzdmJsM3A0MjQwc1hUSHlU?=
 =?utf-8?B?NFFnUm44SkdUU3NBYkhCZExpSGUwT28zVVF6WVV3MjQyNzdrUE1odTc3cDRE?=
 =?utf-8?B?SUJuTnFSb1djaWEwQUpwRHBsOFkxUkI3Q2Y5QUxzc3ZwMG1kbFB3MHRWTVNW?=
 =?utf-8?B?QjJVelRCZzlFK2JYZk9hN281TEs4SEhMOUUwWWR1S3ptWGV4aFlpQjkyWkJ3?=
 =?utf-8?B?YVV4a0oxMXRDNlE3ZlZXVlhWcXU5by8yd0tSQXhaVGpCN2p3eVdqYU5qVlpX?=
 =?utf-8?B?UkNuL251NkxpbWtlME51NTQ1Wk9uNDRqQzZIR1R2aDNwY1dNQlRiWmJJVERu?=
 =?utf-8?B?STlHQ0FjUE5TY2xlOHRnVDR2NnpKY1dsUi9jRXZLeWgxWjY5WmxUQnlwRURX?=
 =?utf-8?B?c1pxZDB3WFBUYm51UE11c0tEMnFVemxjWS9YR0RhWGFHQllIdkZwT3loR3Yx?=
 =?utf-8?B?akhQSDFUVHRRTmhkVkRRUWZMYnF5MGRjY0xqbUJrWG9xSmltalFPT1NPdHBn?=
 =?utf-8?B?UDQ4ekZsMTFJbloycm5oRWtiajZ6cGt6N0hpQTNQNC9iVzQvZkxWTUdRMS9w?=
 =?utf-8?B?RmtPZkpaZENMS1F2N1htMFpXMjFCa01LblI4QXoxN0RxSGpkS0FYOXRVSkJh?=
 =?utf-8?B?ZFk1Vm82c3ozTDkrTE9pNGN2MlpHcU16eThZYU9wbWY5ZGgyNHYrVXlBMlVI?=
 =?utf-8?B?bnlIbkx1NE5JT3lMRCtDaDJmTmhvRGJXamNJd0ROS1Y4SW1SSnp6bnBuSGVX?=
 =?utf-8?B?UmFmcUZBdVRyeE1kS2Y1andkMk1rRHlYM2FSS09QQ0tld3JaMjFvTU5tV3Ez?=
 =?utf-8?B?UkJvV3hCK0lhUkVqU09QaUFTT0RQUC80a1JCU3Vuc2VjbGxib0JnMWFuUURX?=
 =?utf-8?B?UW1jQlUvNzZsdnlUd2lpLzBwY0lIRm96THpoT1JaaWFLY2w3K0JqMmtiQmd4?=
 =?utf-8?B?NFdPKzVmVVRJN1hVYkRhdkpPK256MFErNFhQdEs3Ti81RDhJOUgrck1KU1Rm?=
 =?utf-8?B?ZjYyKzN2OEl0WDZNdVU2MG41RXZLcFNKRUduZWZlY2kyZzlydWQwbldGZjdP?=
 =?utf-8?B?OHR5eHlrMDdnWEo3UWZPWlI1bUlPclpNQXdYdmtiRVVhRG1FcXlFOXVDY3lN?=
 =?utf-8?B?L1ZPNzF4SHdsYXlxNTExUkhlazh5RmhRbTNUNnU2M3RvalFsY3A0V1Z4dGJ4?=
 =?utf-8?B?Q1VCUzladUltelJOdUFnT2RvRE1sdFdPMmFQaGVRNmUzWDNkZXpHa3o4TEw3?=
 =?utf-8?B?OGlRL1pUNFdyNmtHYk5iNEZ0ZmlHQnVOUG5RQUtCSXhkT3E5UmYxdll3R2Vw?=
 =?utf-8?B?cDhvR0ZkREN5dUF6Q3I1UlVkTkxVRHRWWlM0bzJpWDZNTlVqb2s2WUp0Tmwy?=
 =?utf-8?B?dS9MQ3RsY2liVHdrRy95aU9rdjQ3K0JHVHVob1htKzBSK1lZVC9IczRQc3c5?=
 =?utf-8?B?L0lBMjUwaHVWSVBodVFkR1FPUGt4bm5vQ1NpazdmeW5sZ1pBUmViRGhDenEv?=
 =?utf-8?B?bUlTNUVSV3ZveDNJVXlWUjFSZDJiSVYxNmpOU1N5YU9sMUVtaUNYMm5KVDlK?=
 =?utf-8?B?K2w5V0d4c2VLYjFvOGNPaFNGb2cvZXJ1bVJ0aHpYeDkyZkVkOTh3Y3VnNjQv?=
 =?utf-8?B?ODB5NjY3Ym1UdHJvZWNWcXhvbWZOSlNvek1tRk9zaUpOUG5LRG8yelA0QU9N?=
 =?utf-8?B?ZCs3VzR1TTdnMElhaGZaa1Y1S0VaNjEycW9pdnlBWWZGNTBNSjl1UzVBQmYw?=
 =?utf-8?B?VmhDWENkWXNCZWtBbVBLcXg5b3ZMN1p5blRhR2hPOENTZEFtcDlWRHc4Q0sy?=
 =?utf-8?B?M0x1dW1hZGNGT1Q0ejhVVi9kTFVhVWl0eC92V3JGUGJHRkRBQ0NEOExCaCsz?=
 =?utf-8?B?WEoxMGFxdGs0czZ1cFhxTnlZRzh4YnZyampOR1pKUkU5RHpTeHdPaFZ5Qmln?=
 =?utf-8?B?QnM0cU9pc1BYWFlrTmlhVjVLL1NWaklpb1ZQZWhqcjFiWlUrRmdnNmpqWndE?=
 =?utf-8?B?ck9FRVY3SlBIN3YyTyt0THozb2kydEVwSkJCNjd0a1loaUF2bXF1OWVGNnBU?=
 =?utf-8?B?RGxQbFRTUW54Qy8za3JNeWJlNGlSTHdCQTNkK2U3WEpabWRtUnVVZWRBVm0r?=
 =?utf-8?Q?HoKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRXeFNPdUNIaThFNm9FNWxjUEpwMy82cEg5ZnNKTE5SWVZuTlpEc0xna1F5?=
 =?utf-8?B?Yi9aYzNDYmdIWkpGNGl3ME8zOEh0WFRabW5jcmVPZVRaNDEwdHhJM1M0ai84?=
 =?utf-8?B?MlZwNUswYlorSmROTXRuRUM0L2VDL0tYTHVHcnFBY1o5OWNqOXhnUldrc3lX?=
 =?utf-8?B?STZ1VVVkbTZIbjc0aGlsTytNUktMOWh2ZERyOXlIbHdoYlp5YzdyVVAyc2Fz?=
 =?utf-8?B?RHo1YjlreXFMU0tzR1Y5Tk9iem8wS0dkR1NHbmhFR2pxTWE1L0g3dWovZVlq?=
 =?utf-8?B?d2RsK0dXOUVLUFhFRUNwUDZObFdqK1p1dHNlTEc3UFpNdTIweTFkbHI0OUlJ?=
 =?utf-8?B?b2VkRDdRVktBd09RcVN6dzQwVzc4Qm9UWnZFMWhRNmxXQ2xFWkpJOTFXNTdv?=
 =?utf-8?B?YkN6aDZEZjNnTDFvRGRESmFuTG5jREM3c3VGQmFhUUY1L1d4enE4M3JDNjBh?=
 =?utf-8?B?NEpBc1hSY0RicUNNVjNTbHF5K0kvdjhac08zMU83LzdTTXoyeFkrVWViTTFR?=
 =?utf-8?B?L2tETWxRNVBhSnFPUkdkTTFSczJ0TFlmQTV4VFJLM1hjKzB5anJGakJrZ1V0?=
 =?utf-8?B?MEJxOGhvdlFuSHF5M2phY2hDWHpYRWpjTjczYXcvSFB5dWFDQVI0QVd6OWRQ?=
 =?utf-8?B?ZmErbVEvTGxkSStMcjd2bVNaNHErODJsNzhSSGc4UTVhUndhbms4cVpSN3Nh?=
 =?utf-8?B?aURqVnlKSEhLNXR0YlBxbnEvSHNDRm1DQU40ZXlIdm90cUlMdzdvSllsTjdr?=
 =?utf-8?B?cFVJYXpydUw1RjVBNzBiUVJlWGgwL0dCRXhRMFlwcmFXUHZDblpLTVRxMkpB?=
 =?utf-8?B?REk5bUJGYjJyYVg1aWx5cndKcTV3NUxlWVN5SWNVUFV6YTF2VDBBWmJpRzFU?=
 =?utf-8?B?R0FZOXErejBIZ1hFSGpBa2VsVGNHelNrM2ZtSlE1Y1VyODNYR0RSS3FLejBI?=
 =?utf-8?B?THp5MkxkOTgwKy9qbEZwK2lpYkgrdEpMSnhrTVRIem5LOUVwVFltdE5iVnVZ?=
 =?utf-8?B?SlNTVzhDTUdIU25kenRIdElWNzFKbnVicDVNcEdNQmk4Mk12bkhQZkkrMjFR?=
 =?utf-8?B?ZmNCbW93THlZUXd2ZXpENzBXZmxXM01OYWxaSjIvVHBMYVYydG03NTJpM2VQ?=
 =?utf-8?B?cFg5cDhyL1ZIbTg4VytDc1o5NHhSM09XVzNMblhHT1JQeUZaK0xQL2c1RHZv?=
 =?utf-8?B?QmQ2RkZlRUV6aXN3UU9TaHlqL2ZPeVVvNXkwdnRCMUFQQ2tZZUFTcjdIcm5I?=
 =?utf-8?B?bkNSN05MQkxmWVJXai9XMUlDb3h5WEV3QkZJbjArTWtvYVJxaytkUld4d0ZY?=
 =?utf-8?B?eHBlK1lISEdubDdwOXZ6Mnd6Ukl6YUxRNk5JREZrN2dwVDA3VUhmSHNUTjN6?=
 =?utf-8?B?Q09TUXRHSCtJVW96VXlJeWYycTlUSzVKNXZCdDM0SkorNXhQYW1aT2dyeVM5?=
 =?utf-8?B?azFOQzFDQXBsUElRci9ZbkFhbDF2bGVUMit5blIzem5OWllTSWp3RXl4c2lG?=
 =?utf-8?B?SzhRL0lEUUk3Qk4xS1dTZTBaSktqbHFGUG9BM3g0QnA4eDlSbHlseitUS1dY?=
 =?utf-8?B?ZVVUQ2VYUlBkbHJMclhxOGY1cUtnaGpFUVBWRm5GUTdvREp3V0F5eDBUWUx3?=
 =?utf-8?B?MUNKVnlRY3czQlgvN05JVGhaSWw2dGZ6azlJcnhNaXp5YkVLT3RJWUsxL2ZP?=
 =?utf-8?B?dTUvbktBQ04yZ2crSzBtaWVSSlA3bEYwdysvRW5VTUtDUUthdE14cDZUc1Jj?=
 =?utf-8?B?NGpqei9NTWVrQ0VNUTZqNjdqaG5rRk9aaS9SZ2M5cms0NmxqWnZNWkJqWEh2?=
 =?utf-8?B?ZFNlWWFsaE95Yml2SFltelBYdjVCMHFTUUxjUk9qeTk0Z1JIWkVhdWxIUldq?=
 =?utf-8?B?THdyb25lK0o0VWcyRHRkREoxZy8ra3JISk8rYm5FWHpEQkpLa0QvaUlUZ3dD?=
 =?utf-8?B?dzVtQTU3eHF1bXpkWExjeFkwRmNwb3I2dnM3WnJUSVc5MnVraS90djc2UnFz?=
 =?utf-8?B?SEpyeVV3SFhQZ2Iwa082dENhdDNJdFowOHFLVk56aXF5K284aFkxQ2tjM1F0?=
 =?utf-8?B?alh5QUNwNzFKOXhGS0s0dzU4SC8xVVI1c0FRbWVCaS9YL2kvK3RtRnNMbG44?=
 =?utf-8?B?anhDd3hsbDZBa1lEVUFvRGV1c0JhNS8vK0Z6bWszdkV1N003YVBZSnFZVlA1?=
 =?utf-8?B?eHc5Zm5CaEtMWWhZZWNtV09yRldrRTQzNGVPYmlHOTltMFZVaVVwR0l4b1ln?=
 =?utf-8?B?UGVldXFPYlBNRUx0NkJwM0hEOHo1TU16Q283OFk5bDg1WHdJWW4wUjA1WlRQ?=
 =?utf-8?B?SnFjSUdkdEVQcVBaYXNvWEtkanpQTU54Q3laR3ZtYUUyZ0ZPOGVmVUg5Y2hh?=
 =?utf-8?Q?teITavVireVMDaj0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 482961a3-0e5e-44ba-af69-08de5f8e36d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:29:14.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsewO9j3Rvnf7EZQxj9zOUB3tOHDc6u0dJFTt8/acN437bQCwYBGqL7FQoUfQt/UNt/uoMn94GWNjkjEgxg8zG8HBHy7tQx32HutSxFvZUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8807
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



On 1/29/2026 11:56 PM, Shuicheng Lin wrote:
> Correct the function name in the kerneldoc.
> It is for below warning:
> "Warning: drivers/gpu/drm/xe/xe_tlb_inval_job.c:210 expecting prototype for
> xe_tlb_inval_alloc_dep(). Prototype was for xe_tlb_inval_job_alloc_dep() instead"
> 
> Fixes: 15366239e2130 ("drm/xe: Decouple TLB invalidations from GT")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 6a7bd6315797..01c413a2537e 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -198,7 +198,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
>  }
>  
>  /**
> - * xe_tlb_inval_alloc_dep() - TLB invalidation job alloc dependency
> + * xe_tlb_inval_job_alloc_dep() - TLB invalidation job alloc dependency
>   * @job: TLB invalidation job to alloc dependency for
>   *
>   * Allocate storage for a dependency in the TLB invalidation fence. This

