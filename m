Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FFFC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 03:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC610E694;
	Tue, 30 Apr 2024 03:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBqFEeZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0910E694
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714449535; x=1745985535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Y7ZnaxK446SElG4w+hNeXSvnNDifo2Rhr6oer78+GoU=;
 b=JBqFEeZTzpASRhT41ZNcTkJpeQuqXpeOzC9760XnFR+4cVzWDWXe0d8W
 XqQqz6EaxPrEwWowXk38pUjK5/NWNdRn7v0xuBx1vf144LIkPOLltwzpW
 GxvNt90pdbNh/skAy/p8ZuSTx8WE6iycVuZ6ak455D88V7PyOT4Vu2SAG
 +HUEasQBDhkRFnyXyQ39kQZDLvSob7P20d4/HkpY6vZRUNYiUxTVxJeeZ
 bl9ho0snHGC4kcaL2w1TXGC1Mf1UVHVvulks5mAyOtNl+fR8y2eAwydvu
 yH97w5o4SQocYF0iI/qlee+QzIjBVuuJHYFNmgE/USbejVXmhEJjNDoIG A==;
X-CSE-ConnectionGUID: LPpd/lXqQrGD3mQJNV24dQ==
X-CSE-MsgGUID: VqXxx4jYTUOoq7ApjPQi+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35524439"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208,217";a="35524439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 20:58:54 -0700
X-CSE-ConnectionGUID: +F/jLZ3kSr25WeUa9X66/w==
X-CSE-MsgGUID: fVcYIztnQr6KrkKC9BjuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208,217";a="31131594"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 20:58:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 20:58:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 20:58:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 20:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5EOUD7I271gAh2OPAJUFo9LT6V1ErTaQxgtzk8i63GrF0YL/+itfobwDzMEq9GLaCG4yRBYqVIRVItwtoxkiilWJ0e0weI/+M5nICOun/zeRlmNaV78K54U+42I/PHZ0L5Dq/ruxTtqDpV0FuZj7NoqrweHYm7vj+ncup97NbAX+2NtoMfPtTS94DgvIjm0OVs9myM+/vzUmOO242tOrrJ02jvu08EsdNPYRCcYzOdGszhTU0eV7NBIkgFDzXtw0CEMAB6heYXIkUzocH3veOnjAfpLqZHlMs+VO8mVHajBDWtjsPvTXGr9bb48zmYeuIZHjO2DD3f26u5RQNtXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqIWDMvKtM+QyIdPD+GBmKIzC+rmvOP3008WSP/pBCE=;
 b=SK+BJAq7MztVURotalR/eGlhlNu2FiBcYPw95lmQglSKBKTIiBHR1VgN4E1aWSvyLB54eivaJM3EI9RnmjDkcqrRCFAOisj6NZPdkxNtasnxNyGp8p6rZO5saa/DaShhbljpC9U/nUO0fZDybZuZzspCfLP+753ks4U65pO6U9dMMuITpuY6N9k2aKn9uGhONldmzjWjFHpS7DA3IrFGtIwMZz7PHnC+Wyu9TR6BJA9WKSu/jkC11be4t+EQOHbnmzg4udV/Fiwpp3GuH4AMT0CsQKV/GVtDJCY5SA0yI8WYxvtuGSgiFZhjPEErPK7gdFtTIUjoH7H3PSnMR5M1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 03:58:52 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 03:58:45 +0000
Content-Type: multipart/alternative;
 boundary="------------dOSfNQTSe7Za1zDNJUAnssjm"
Message-ID: <475cfa17-283d-466d-901b-5fc480447114@intel.com>
Date: Tue, 30 Apr 2024 09:28:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
 <9aa151c5-de86-4ac3-a874-894f2f780c95@intel.com>
 <a3c4pszai2ysc74yod3yj7ulridwqrztotyu6lrtm3n2f3ghgu@y6lh66mlz2xe>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <a3c4pszai2ysc74yod3yj7ulridwqrztotyu6lrtm3n2f3ghgu@y6lh66mlz2xe>
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 602fb4af-a274-4768-1ac0-08dc68c9d4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDZ4UmkwNmVzbUo1Y3pycVdLd1d2ZXhtT1N0RUQ4UENrbEFiWHc1NW0rb3J3?=
 =?utf-8?B?d2x6eitDVkFOcVlzelYzeDZ1MlQrNnFBcEUrRS8zNGlXZ1lMZXlUUDFjQzdN?=
 =?utf-8?B?KzhGWU9jS20wZkdvcW1xa3VqWG1kV25CanJxV1dTeXRzb1pON3ZFZ3ROM3ZM?=
 =?utf-8?B?T1VpNnJwR1R6YU1LYStwTHl0MUFYYWcrQTlZYnkveGRSWVp2SmgzNXZQSEVL?=
 =?utf-8?B?ZzFGd0Q1Y1MzVDduclFHYkdPZm5IOE1ZVGRiRi9KOUFHdFd3U0RsN250TWlt?=
 =?utf-8?B?MDZ4MjZWUlBDbi9aeS9lM2syeWJ6OCtyZXFZbkFwU2tBcFAvVXNaY2hBM3lv?=
 =?utf-8?B?dC9TVHlHbWFGSWRIbkJtRDQ4UW9BM1JKTWRHa3dmaGJIa0tyQ0NKTUdUQUxY?=
 =?utf-8?B?dWpubEI1cGRZM3RtNUQ3VGtvM3N0Y2JWVnJNd0xja25hWHIydWRsajgyWW9M?=
 =?utf-8?B?RlZRZG1ZMTRGZHdxN0pMemErNWozQUFGejlpRytQVWpuVnpUL3ViUE5SWk5z?=
 =?utf-8?B?RUxDc1hXMGFRa0hTemYxWWlsa043VEVPM3YzT05QNHZQQ3lsTy9rUzNnOG9L?=
 =?utf-8?B?L016QmNZd0Zod0ppOVBrVVBVVmZoVFpnQTJRUU92dk1ONUZvSzk1UjZpcnBQ?=
 =?utf-8?B?anhsSU1IT25OWEVBMlVXcEVGRnR3SjNvYjhoaUxnVVRmcTcwdzcyVncyb1lB?=
 =?utf-8?B?OHhmQndhQVA2RXZSZ0dlSysvM0xyRVk1endBN0Y4WE5tWS85cmZ2RElNTG9s?=
 =?utf-8?B?L3lkblZnRktlMmVGNDVVRmVGSGd6Tmw2Y3pwenUvaExpTDhYQWV0VzZnRXJG?=
 =?utf-8?B?elV4TE0rcEZVMGFuVXoyOElpVHNQd1BZaGlBdk9SejJDREU3VHo0V01CZXBO?=
 =?utf-8?B?ajI2TUtyaW5talptZlJGYXZpcHlFQVIxdlJOOVlzcFpHMlE4cVQ0a2kwRHZ5?=
 =?utf-8?B?NU1xT0oxaFVrTng5UDhONFR5NC9nUnZsY0wrU2ZKaDNyY3pST01qeGJRb3Zh?=
 =?utf-8?B?M2RXczRxK3pBOVdsQkQ2QmMybmtITG9DWFV5c3VqTk1QYlB1WjhTR2dOTXRx?=
 =?utf-8?B?cUQyeVhNY1E1RFB6b0pLYnZBZzBMdENEdFlLYWlYbEU4blN1M1JBcnJtZk9Z?=
 =?utf-8?B?ZFduRmxsakFsemNHNHc1ZHJ6V2l5R2dMVTNhY2ljY3JRZDAyLytHY3BtM3pM?=
 =?utf-8?B?RUhBcFF0MlQwQk1EcTZSOW1kUzJmNVhLWHlPNkZPSHY2SVhyU256YVJWRi92?=
 =?utf-8?B?UVVqSno1UXpUYWFZSVQ4eisrMCtTeDg3OWlIVjBIanlrdXM4SVgyM0ZmSWIz?=
 =?utf-8?B?ZDBTZERyZWU3OXhNZEJTaHUwd29ERTk2NHhxSXNGRGxUZGxGYWE2alJ4UDlt?=
 =?utf-8?B?bEkrdzJBdldJbTFGT1dyMk1WK0U5QjdpeFNlMTQ4eVdHcm83S3k3dVEzdFQ1?=
 =?utf-8?B?dUEyeHlmL2F3UFlwTFBIeGljL0pYekVpWmRhMk1EY0JLcWVvYzNYUG02bXlx?=
 =?utf-8?B?NDZ5Y1ozaXNneEZWN0I1KzVQZ0RNb2ZvTXlrZmZZZkxzd3U4bWt4Z3B2eEJ1?=
 =?utf-8?B?S2ViMENtdHB6bUFlcTBBQUdQM3E1NWsxRWlQN1JMUDFvZGpCU0NUY3JoVVJD?=
 =?utf-8?B?NkZvaGhwOHFPeFNnSVRxbURoY2s0SndraU1CQUVYOUN0NzN6SDhITk5RVXZW?=
 =?utf-8?B?WEtCNzZ2L2dRV01NVEVnV3dwK201ZTc0RXNqVmJIb3FNOW9XK0ZnV2xRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEhxcTd1a0hGKzlUWGYzWUhKTzhYTGVvaFdHOERwaFpZZUhBN1p0aFJvbXlW?=
 =?utf-8?B?L2tLUXJNZ2NLc2pRa2NpUlgrcVJERml4eitVWkttSnZMTnFGa3JxQjZTbWFH?=
 =?utf-8?B?OSt1NndWRmRQb1VldmtQYXFNek81MFRYalpkSmRxU3FRL1RuRGhQYm5jbnBv?=
 =?utf-8?B?S0d0ditUMElvZEFvS0ZqQ29ESzhTTlRXYTh1WDBJa25ZazN0Z1cyNXdQQkg2?=
 =?utf-8?B?Ym1YWGI0VHFMOWk1N3Y4eHlicmtyOGlZWkdEOW96NHpBeGdaS0p1ckd5T1Jt?=
 =?utf-8?B?QmM2WnhzSzM0VTc4R1IzenR0STZlQXFJVGRIaEFOZUxEVFlIMEZJYmZvWW5x?=
 =?utf-8?B?VVR5OEpJK3gxVXlENytOaUlqTEFSTDBlcnRwNW0yS1dpaitLcEM0dU11czhZ?=
 =?utf-8?B?OFIzRjhxSHdMZ2thNGtZb0pCZ1JrVTh6a0NxOUZETGYzcnRiYTRWMnYwaGJB?=
 =?utf-8?B?K2ZWTTRuU0NhRW9MVC9DYjE2ZkcycGZmSWRWSkFpMXE5b3JleUlzTzN2dmVN?=
 =?utf-8?B?Z3JtZzBjOVVGSjUrN0plc3AvdEU0dS9FY1hiZ0ZpdGcxUCs3cmc3R1lqMjdJ?=
 =?utf-8?B?RytMSi8yaUF0bzZVUXVWWWlYeDRtU0ZrN1JQcyt6Nmx3VzlYZThwK3lGd2h3?=
 =?utf-8?B?TGNPMnk3cGw1MWg4NzZ1SmVCSG1iZGlDOVZxQUdpUGtsdHpGcUZyL0lsazlx?=
 =?utf-8?B?VGhhQmhQZUZpRU84bUt6ZHQyTFRsMTdnSmlhTU1aMHdQNk41Vy9TL1d1aW9a?=
 =?utf-8?B?VDF1S3Nmdm1NR3ByQ05mb094c28wcGpqajh5VDd0eHVJaldPQnZwVmlseWZY?=
 =?utf-8?B?WmxKVnlrd1Fjb3hVUUN2QjRuNDBobDZORGI4ZGhMS0pxWURsWTJWRnNXbDFC?=
 =?utf-8?B?MkczUG1IWDIyQzI4aUNkM0NvMFBRMDdnbHZWb0ZlMnRKTVpJMTd4MFN1bzZD?=
 =?utf-8?B?ZUJzTTlpVlExNnZSMlU5Y01LZjlUQmhGNXY4djBCNGl6MUJMdHJFZ01FbkJV?=
 =?utf-8?B?dm1WU1ZpWi9VYUkvY2lBWGJCZWtqZTRQdUJUOUt0OFpxR3c1cCtOVTI5c1g4?=
 =?utf-8?B?cDcvVFF0d3VuQmdJTmdjN0JrMkxOaHRYNjN2Zk83Z0tQbWtqcHFwYXJoU0pH?=
 =?utf-8?B?WllhaThjSlBBUzFSb0M3QTVCWUJiUkMxSXNJekdFZEQrTWZSeGkxai9EZHZJ?=
 =?utf-8?B?aWt1WEFnTlJRZ3JMYkMvQitEbk11bUxCQ0diZkhTTEN6amJaQlN0M0ppcGtI?=
 =?utf-8?B?S3JzSWw2STFYZExDQTlkQ0ZKOWtYZ1FmYmFBa2VjZE5ZaDdwUXdua0JENU0r?=
 =?utf-8?B?SjBIRkRNMFhHYVA4eWNMR3h1Yk5qOUlKRndDQ1Bia3FDNEhwUnJxbFRvbjA0?=
 =?utf-8?B?eWR6aWhTSFM5L3hUN2xZSDlxT21BUXlJNlI5RzlQd21sQmkrU0xrZUh4bWN4?=
 =?utf-8?B?NEkvMkZveFZTZHM4bWVqYkIzWDZCdlc5Mk5IWkR6ZkdYV3pXQUR0MXl5WTBn?=
 =?utf-8?B?cWdoMVNEOGY5cEN1TFF1RlBwL1d2L2RUSE5ROUFhd3Nhc3lZdnk3TllHMGhp?=
 =?utf-8?B?U0k2cWxVdzBpM3dNS1ZiaDI1SVBXdFYzOUs2S0tvdU5Jd2RCeEZDS1gyTW4x?=
 =?utf-8?B?elVFQ0hycXNLcDJmTWoyQmk1Nnk3em1wYURDZkFhRlB5ajZNNDc1VGo4TVpP?=
 =?utf-8?B?WkJGZnpPL1pwRWdVdmJ6RFY0NitxMmtaa2VwSlRQNUtwYmpXQUpYcUhmM09o?=
 =?utf-8?B?U1A5YXlDV1hrWlVjVGtGdjdnNXc2UUxKYXEyWlJkWTByak5FQ3B2TXJ3SVZ3?=
 =?utf-8?B?NzhJaFI0ckhMUFRjbUl4QjlGbVNWYi9xN2VON1NTbzFFcEJwWTdUOTF2RkJ0?=
 =?utf-8?B?K0FvQXF1Y3FjZDhGRWlrRDhoQzhjam43RloyTjJXNVpDQmZIUTZseXNxZlJQ?=
 =?utf-8?B?M3hHakhRMCt0VHVxbUQ0TUt1dEZKTzBCWittTVBYVS9YNXVWMVFVUEFwTkhG?=
 =?utf-8?B?MXh6NzBVSXlBcFhQb0QzYUNLUkhZUHltenBlODVja1pyUzNnN2s3OUZtcTY4?=
 =?utf-8?B?OU5XaFlRbHF6Qk8rclcvQWFBbmJvRUl4UUpqRnBvdEx5V0k1R0YwVGd5NFVw?=
 =?utf-8?B?dGhTNlczbDIybFlNeHlpaHpXVklSeHRPbUdWYmtRd2ZLNjN4MWQ4WGRLZ3Jz?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 602fb4af-a274-4768-1ac0-08dc68c9d4de
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 03:58:45.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBwonGT28hJGu8npIQtUroUtYFDaz29ldey2OMbsexxOalFURoWP2WeK7LHBd6qxGYvZYMCohAJmZN+SKtYXuWMpWLciXskVetqMaFdeeN0=
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

--------------dOSfNQTSe7Za1zDNJUAnssjm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/29/2024 18:42, Lucas De Marchi wrote:
> On Mon, Apr 29, 2024 at 09:14:30AM GMT, Chauhan, Shekhar wrote:
>>
>> On 4/27/2024 19:23, Lucas De Marchi wrote:
>>> In order to detect duplicate implementations for the same workaround,
>>> early in the implementation of RTP it was decided to error out even if
>>> the values set are exactly the same. With the introduction of 
>>> 18034896535
>>> in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
>>> stepping with graphics stepping A1 now gives the following error on
>>> module load:
>>>
>>>     xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
>>>     discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
>>>     masked: yes, mcr: yes): ret=-22
>>>
>>> RTP may be improved in the future, but for now simply join the entries
>>> like done with e.g. "1607297627, 1607030317, 1607186500".
>>>
>>> Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
>>> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_wa.c | 7 +------
>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>> index 9d9b7fa7a8f0..db7c7c7875c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> @@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr 
>>> engine_was[] = {
>>>        XE_RTP_RULES(GRAPHICS_VERSION(2004), 
>>> FUNC(xe_rtp_match_first_render_or_compute)),
>>>        XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>>>      },
>>> -    { XE_RTP_NAME("16021540221"),
>>> -      XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>>> -               FUNC(xe_rtp_match_first_render_or_compute)),
>>> -      XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>> -    },
>>> -    { XE_RTP_NAME("18034896535"),
>>> +    { XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: 
>>> GRAPHICS_STEP(A0, B0) */
>>>        XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>>
>> w/a 16021540221 is applicable to only Steppings A0 to B0 (B0 not 
>> inclusive). With your change, I think the w/a will be applied to all 
>> the steppings. Wouldn't this be incorrect? Please provide some guidance.
>
> both 18034896535 and 16021540221 have the same action:
>
>     SET(ROW_CHICKEN4, DISABLE_TDL_PUSH)
>
> In other words, 18034896535 applies to a superset of platforms
> 16021540221 applies to. So even when we remove support for steppings A*,
> we want to keep the WA (possibly removing the comment about 16021540221
> and renaming it).

Okay, this makes sense. Thanks.

/-shekhar/

>
> Lucas De Marchi
>
>>
>>> FUNC(xe_rtp_match_first_render_or_compute)),
>>>        XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>
>> -- 
>> -shekhar
>>
-- 
-shekhar

--------------dOSfNQTSe7Za1zDNJUAnssjm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/29/2024 18:42, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a3c4pszai2ysc74yod3yj7ulridwqrztotyu6lrtm3n2f3ghgu@y6lh66mlz2xe">On
      Mon, Apr 29, 2024 at 09:14:30AM GMT, Chauhan, Shekhar wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 4/27/2024 19:23, Lucas De Marchi wrote:
        <br>
        <blockquote type="cite">In order to detect duplicate
          implementations for the same workaround,
          <br>
          early in the implementation of RTP it was decided to error out
          even if
          <br>
          the values set are exactly the same. With the introduction of
          18034896535
          <br>
          in commit 74671d23ca18 (&quot;drm/xe/xe2: Add workaround
          18034896535&quot;), LNL
          <br>
          stepping with graphics stepping A1 now gives the following
          error on
          <br>
          module load:
          <br>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;discarding save-restore reg e48c (clear: 00000200, set:
          00000200,\
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;masked: yes, mcr: yes): ret=-22
          <br>
          <br>
          RTP may be improved in the future, but for now simply join the
          entries
          <br>
          like done with e.g. &quot;1607297627, 1607030317, 1607186500&quot;.
          <br>
          <br>
          Fixes: 74671d23ca18 (&quot;drm/xe/xe2: Add workaround 18034896535&quot;)
          <br>
          Cc: Bommu Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
          <br>
          Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
          <br>
          Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
          <br>
          Signed-off-by: Lucas De Marchi
          <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp;drivers/gpu/drm/xe/xe_wa.c | 7 +------
          <br>
          &nbsp;1 file changed, 1 insertion(+), 6 deletions(-)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_wa.c
          b/drivers/gpu/drm/xe/xe_wa.c
          <br>
          index 9d9b7fa7a8f0..db7c7c7875c5 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_wa.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_wa.c
          <br>
          @@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr
          engine_was[] = {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_RULES(GRAPHICS_VERSION(2004),
          FUNC(xe_rtp_match_first_render_or_compute)),
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_ACTIONS(SET(ROW_CHICKEN3,
          XE2_EUPEND_CHK_FLUSH_DIS))
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp; },
          <br>
          -&nbsp;&nbsp;&nbsp; { XE_RTP_NAME(&quot;16021540221&quot;),
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0,
          B0),
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FUNC(xe_rtp_match_first_render_or_compute)),
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
          <br>
          -&nbsp;&nbsp;&nbsp; },
          <br>
          -&nbsp;&nbsp;&nbsp; { XE_RTP_NAME(&quot;18034896535&quot;),
          <br>
          +&nbsp;&nbsp;&nbsp; { XE_RTP_NAME(&quot;18034896535, 16021540221&quot;), /*
          16021540221: GRAPHICS_STEP(A0, B0) */
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
          <br>
        </blockquote>
        <br>
        w/a 16021540221 is applicable to only Steppings A0 to B0 (B0 not
        inclusive). With your change, I think the w/a will be applied to
        all the steppings. Wouldn't this be incorrect? Please provide
        some guidance.
        <br>
      </blockquote>
      <br>
      both 18034896535 and 16021540221 have the same action:
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;SET(ROW_CHICKEN4, DISABLE_TDL_PUSH)
      <br>
      <br>
      In other words, 18034896535 applies to a superset of platforms
      <br>
      16021540221 applies to. So even when we remove support for
      steppings A*,
      <br>
      we want to keep the WA (possibly removing the comment about
      16021540221
      <br>
      and renaming it).
      <br>
    </blockquote>
    <p>Okay, this makes sense. Thanks. <br>
    </p>
    <p><i>-shekhar</i><br>
    </p>
    <blockquote type="cite" cite="mid:a3c4pszai2ysc74yod3yj7ulridwqrztotyu6lrtm3n2f3ghgu@y6lh66mlz2xe">
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          FUNC(xe_rtp_match_first_render_or_compute)),
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
          <br>
        </blockquote>
        <br>
        --&nbsp;<br>
        -shekhar
        <br>
        <br>
      </blockquote>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------dOSfNQTSe7Za1zDNJUAnssjm--
