Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B56D15D96
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 14:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29310E52C;
	Mon, 21 Oct 2024 14:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2Hmq9NP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5219110E52A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729519716; x=1761055716;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdNjwJ9JUG0Cf3hY/ZaAZa7UKqesPJKKhX7tRjAtrmg=;
 b=j2Hmq9NPYWLGIkX+J33yrABuUOWwtpkN9Bmkm7BUHEQq6Vh9HqeRLq6a
 7jddf+K21Mp5QEsO1EKbYdb6LBDJ6BkW0W2GSf4OQtsRrCSlb0TDqljhm
 6yMxUQDVTjyTV8uHzOF/zhTg6NOxbdALrQFq7zKN1Za7i1Wcus41DHgLS
 ayXWv5BE08qqQCYbSRL4CuLKXFzKtta6lxwsbpM84usG2Ar1M2bd3v2SI
 CmddUSjWaueY1BBF5F0bZAvZRo03HVkmwu92Ljho8J3Co3rPl+4iYsJSN
 04KuXdlxB7wIQcNDkkZv/cxxRn45eQLYqL2VFJEvk3kBP4ztzKNXRYexW g==;
X-CSE-ConnectionGUID: cpz1IeL2T9aN9LyGV9Cq0Q==
X-CSE-MsgGUID: nmX8xSQRQwyvYAiw1LbUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28883658"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28883658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 07:08:36 -0700
X-CSE-ConnectionGUID: pVozb1QTTPKT0l16ter2VA==
X-CSE-MsgGUID: HZ32mLjjQIaLTgIIESM7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="116975854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 07:08:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 07:08:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 07:08:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 07:08:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 07:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ot6i90PLgvWBt3GDnfLHpm677UxmG9/3x0Q3dHaGbNwnBIJR3Ep+FmbzOCN5VJASTms+kkCMg2aWmF0AGPfHcwj10f15a0V+9rfgnrl1MEMzmY7vCMcGLAuhjInpdFM5q1yzLFdBnuj0HQPaRYKGsrJzolOYXKbG9ghrvvaxBqhgt++gxD6TmUkPTOeDpRSklLvduVu348Huda4gzXo0o5OVsPShXad4UwH2rENdKea5K/o+k397cDyP58qIVSWpGS4uCQ0LxBegKodXoMQZe1Dbv7R6UqpG+2A4pejX39WbSk8oS1MDZ1X7rnoxCOjDXBWzCKgh9TsYs5g4kBvzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJT8p0uL7BCX8pqIyqFQZFmPX0W+h1sApsJcsv4lT24=;
 b=l7RIqivWnJ/Jaq6fsswjkP3zpVyiYOJy9jIRH+Mm05cM0jHAGY/q2KhJVfFAvtQhbVIjVcW1PIPBNx+AtVw5HuLi9rkmZj5J3whUsZa+9bDgqo4uDTj/RLG+NSycWhfVrDXv2PaYKIu5dIL55/lFUsoPXfM8fGNjXSQL8e6Yeyk2fgJTMivvASM383XRe0DuWrcu0tYSmGg+qhvWJTEt4zgYc+nGeGssOrwHbKcvvaM0+qhugfeifmV8OP2YwFJXkv0ymXhTJUFG1WjICvTMimEVqCF8ost1916fuSH0bEmI/4pYWIpUycXsY30btw4Ep0Hhn7+UXt1vEhk1HrPotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ2PR11MB8369.namprd11.prod.outlook.com (2603:10b6:a03:53d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 21 Oct
 2024 14:08:32 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 14:08:32 +0000
Message-ID: <af48833c-4eab-40ef-a952-ea6145d8e16a@intel.com>
Date: Mon, 21 Oct 2024 16:08:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: Kick ufence immediately when possible
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>
References: <20241017094237.279327-1-nirmoy.das@intel.com>
 <87zfmxy6u0.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <87zfmxy6u0.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ2PR11MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: f701b7bb-b7cd-48fd-cbbb-08dcf1d9d838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVlnQUx1d2w1M0hVbkUxL0VCRG8wWm5wZnplWURpVm1OOElpOFpVYzY0cDU1?=
 =?utf-8?B?NHNIK0E4eGhzNVdJNTVPbkllQ0ZxK2U1cUc4cDBoSEpHQVVRMHFWMis2UnZm?=
 =?utf-8?B?Y09vcFVweFhhRkVjNjJlWm1MOXZEdHBoT1ZJdHA5eVFkTWZ4SUxxMEsrSUV4?=
 =?utf-8?B?WklvTVZlUXdtNC9IbEN6bHlSWEdFZEFEQVVMVWNFSkI5ZiszdGF5dHNXRUxE?=
 =?utf-8?B?Vi9wRG02QXZxNnIyQ1Z0MjNsa0NQUHU1Z1gvUUVwVkEweGlTRlZMVEo4VWFK?=
 =?utf-8?B?Y1ZVYmxKVkVoL2FXYWxCWk96bEVPZVVTK29Ra1NyRnNZcHl1cnJlaU1VNmc2?=
 =?utf-8?B?b1UwTC93ZXBNbUVUajE1c1QyS1ZoVXFtOWc1Kzk2VmMwZU8vVVlZTXA2anUz?=
 =?utf-8?B?VmxaK1FJS1VYRkdkK3VTb1FmMFJnVXBjOHdrcHlqN0NxWFhpMjQvM2x1anQy?=
 =?utf-8?B?OWx2ekdybG1xSzVDS090UzV4QUVJMlM1elhFNWxldE9Cbnd2cWxQRUxYZUdz?=
 =?utf-8?B?MjhFd0lmY2N5QjIvMzJrVk9jL2VWNzdnakVOem9NTFJjUWNZU0JCbzhPekJP?=
 =?utf-8?B?MFNCM1FYODlSQzJPald0c3hHQ0doc3cwV2hQS3p6WWVKRTR1bVc0OFBoZ09B?=
 =?utf-8?B?MXVEU3pUQlhTbUVOeWRDblBJTkI3a3YvN3Z6N1NJLzVLdHVnRUJJZWpldi9W?=
 =?utf-8?B?K2lnc3FWMEsrRkpKWlQrUndRaThEZFNPL0lnTk9ZTFdqNFlFZ3JIR2plMFgr?=
 =?utf-8?B?aGxBV293Mnp5aE1JOXpVWjNvWWFObHRkdERZNCtHcWJMdjUzM0FMYzVmMXYr?=
 =?utf-8?B?Zy92SFZWOGdHUkdkUTJ2WWR1Q3NvVU0xOXRjRjMza1NlOUNNTzhmM0t0SE9H?=
 =?utf-8?B?ZnFxZVd6SUVKNm9XVkZJSjMzQ2t6ZVNPTmZMTVQydUsybXpWRUVld3g4TUNH?=
 =?utf-8?B?V1JDV2xzcmdZQU94OEVHSWM5VTNpaUpjWHFuZHFJVDZYVjgrZFZMbHJJTDUw?=
 =?utf-8?B?Yis4OVlLSFE2SDNxbWJPQXhma25aNjZ4dEdHTmRaT3Q4dmcwVFRyeGxoa042?=
 =?utf-8?B?aXh5TWZrT3RvSTVwelYzZ3dFM2c1Z2RmYThwMitML1FsWDNBRzAvR3lmbmY0?=
 =?utf-8?B?SGNEQXloekdzSHNQeVFHN1d4T3ZzaDNFQnhzWXI3UnRxR1ZVWTBETVRJa1lB?=
 =?utf-8?B?RUYzdTV5dmJYOGdKRFdFSUk2UUovcWg1SVZ0cVhMaW8rK2VyY2dHM3ZFNmdn?=
 =?utf-8?B?OFllMmtEQ1NVOXhZL1dxTVBLeHMyRExqbkZ3MVJ4QzVESXUxV0Y0eGVOdGdh?=
 =?utf-8?B?c0lyUCtSaEtoajhRUGYxWjZvMkdYUW5JQUNIUmJOcHZxN09kdGVsVDl6SVkr?=
 =?utf-8?B?dnU1OXRqanBGaGY4UzNZQ0sxTzluRzdOTXNuS29Qdk9aZUdpTFFtYURDYnRS?=
 =?utf-8?B?dkZ0YUtseEUxUzZQNGFUT2JXekJobTNOSHlNV0dCRHQ5NFNjT3ZsT1pudTdn?=
 =?utf-8?B?OXdGaW1MS2dZYjlVbTlVRlJ3a1VsZVp1T0E5bCsvWktsb2Y1SEU5bXQyOG9D?=
 =?utf-8?B?VksyQmc2N2hMQVgrT0UvdXIxVXRHcit5c1FqVXhsZ3cxSUcxbDJKWEUyL3ht?=
 =?utf-8?B?c2VoQXB4Y0FDaXFwUlFnUGhyTS92VCs4TkFZcHVxaXJwWldsekRqRmhlR1JQ?=
 =?utf-8?Q?LaZE1CAcPu/c74aM6fJt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnZNZ241NGdNRG5xeEYxRlNMZW45Rmt0V1FRMGpVSDNLRy8vODRuWUI5dm5X?=
 =?utf-8?B?YndQOWZSWE1RMXFGSjV4cFdZcGl3MXJSNEJXMld3TFR6WUY1R01QZUhPVWYx?=
 =?utf-8?B?bS84aWNQMGkwZVRuTHhrckUrSk5UdGUrSW15ZFFmOHBQMi9YWnVsLzlncS8y?=
 =?utf-8?B?SDFHMGxhenA5YVpuRGlIWHpBZXord0dmZUxGK2pWaU1KYkp3dUgwdVJvUzQy?=
 =?utf-8?B?ejBPeGdIUTBKRWRiQmxrSW11TG5rMXdIZFRIaVVTTCtnVklqVndlRzdXRUJy?=
 =?utf-8?B?RTZ6R3E5MC9IRFY3R3VOTGdld2ZiaTNoSUpGQjk0blZ5Uk9URWM5anhGMkJH?=
 =?utf-8?B?dUZqM0s4T2lPVWg1d0RGc05SZTNvQWYrc3dHR1JPMzJrelFvZUtrVlJkcmEr?=
 =?utf-8?B?dVRqbHl2NUhGZ1RIYmk1cENmZy81VzVoZ0laS2VvQVJYUnJFSkcrMUJTMVRQ?=
 =?utf-8?B?bExKT1NGTHZrK3A2RzRHdDhzY3BiOUhvbUFubXZFWXA5N21xSy9qSm9HTXNh?=
 =?utf-8?B?bGdOV2NZelo0QmliZTFrTUZGd3FQQ2RtMjZuOUJKUWdBTzNWdVBMNjlQOTJN?=
 =?utf-8?B?QnFCZXR1MTVsSGQwTGF5UWx6N2hEanFTR2pJZWt0eWM2em56Z1JmQ3Q0aUxx?=
 =?utf-8?B?bGNhRStrQXpKaG1aUk9lNVpidGxSbTlCNU5qLzZVb05ZendocWtndFBENkJE?=
 =?utf-8?B?a29zeWRETDhYMjZxRFVZNGYrMHdXSnRteVFzWlF3aUQybm05a3JTN1c2d21E?=
 =?utf-8?B?eDRGZlkwTEppWjhMQXNxNzFQN0V5bEpUOG4rcWtURFBjbGdxRWc5ZUdrdSt2?=
 =?utf-8?B?T1hhcGtJamtGV2o0U0FTRG5MY3BQTlU1QUNDWDdBZGZWUzJDVWJlUy9XZzNy?=
 =?utf-8?B?TmlyTzltUnN1S3B3ZUFvM2NtM3V4eTFicUtMdUxHKzhtWEtsMThjUUltNmt2?=
 =?utf-8?B?Y2p3R0laRkFLUmdNRFkybVIwc201UnR4TDNNditpQ0gxMGlOZ05kbGZqQStr?=
 =?utf-8?B?TzdkODA4ZnlnS2RoZjJTMW9CdUJmLzRTWktGREtqN2xqZjdBWXNkOFZuY0d5?=
 =?utf-8?B?UVdvKzg1bXA5alVlQWdrYml6dXNrRGpvSFM4UDBJa3NBb3RDbGFEM2J0ZDRL?=
 =?utf-8?B?ZHY1YVM3MFc1d2FZaU1UZDk3ZWJpQ2pqWHdlbUtOLzFQcGpIaTBOR081UGQ2?=
 =?utf-8?B?U1ZRRyswOU5naU9QTUhySS9TSXZCQmpCQVkvZXVQOEYzWTdYWXlyQ1NYbnRW?=
 =?utf-8?B?SzFwV0NUOXRCRE1sckh0QmJ2ZGExTDUxU3dLbUkvNWQwVTFoczcyR05zUXFw?=
 =?utf-8?B?UEkvUEh1eW1MM2xWMFZNWHhOb2Y5cDIwUlVpZUQ5NDkwdStmVU81TS9Hbk1K?=
 =?utf-8?B?OVpHQXdkZStwZHhFcE41MzRsaUZoOGs0Z2NtZGEwRmpKWndDQlBOYVhZOWYv?=
 =?utf-8?B?VDdBbFpra3NaSzU0U1p4Z1BCMnJUS2V6SlBIRFJOL2ZDZyt2N2pDbTdqZ0ht?=
 =?utf-8?B?ejRkbmY5RVN0SFBxcDBHL2tCYkVXV0g5NHpkYmN5WmxUTE9qeXFyZDYvampl?=
 =?utf-8?B?blFqSjlUT0w5RTJ4dkJVSDhWN3VRaDVUWTd4L0FnYzVMQnhNd2IrRVdrdEM3?=
 =?utf-8?B?T3pyV1VmR0ZJNTBJbW9pdlVjSHJxNmRBL0dmWTNlejljQkJYeStxV0dpcGJr?=
 =?utf-8?B?N3NWRllXMjNvMnd1VjFvcXVPc2FjQUh3MVdjdENTc3ZJY1dpYkRUeEkzMTAw?=
 =?utf-8?B?bGc5T2poNEZiYndCajJYRUtjc041SEZwbzFhY1pnNWdTRXlCMVU1VGdaT2hG?=
 =?utf-8?B?aUJzQ1VzcUtkQUlpUDg2SE03K1pndnVxcmJBTERmMmM2R012dEdVczJjbGov?=
 =?utf-8?B?YVl0bGhXMG1CZkZsTm1YUE5ubjBLdHZMZFJXM1VMd2pQcVJiOGNLNGNjakM3?=
 =?utf-8?B?cmVadFE1dks3N3VVWk5ycW5WWFQzdnNEYXFJSXBzK1pua2lkcDcvWTFOYnhq?=
 =?utf-8?B?b29aQWZYMUVzaW54d25OaU9MSWMxaXNBZ1pSa0owTEU4M0tyaFRwRDJCQnVD?=
 =?utf-8?B?RUxCVXVhVmcxVzNzcXdsMXFnM0huUm5TQWVRa25CM25ocDVCTTkrZ3BoOTNG?=
 =?utf-8?Q?443elx/OgFkIMAwur30rIavXk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f701b7bb-b7cd-48fd-cbbb-08dcf1d9d838
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 14:08:32.0883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRqw4sf+9YkDN94k8JMwCfmnnsG2X3X1WKgyO05zAWqYgloGjnKtEKOXVDHCdTq7+eq4chKe0rm5/tFPhBl3DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8369
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


On 10/21/2024 2:32 PM, Jani Nikula wrote:
> On Thu, 17 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> If the backing fence is signaled then signal ufence soon with
>> system_wq. This should reduce load from the xe ordered_wq and also
>> won't block signaling a ufence which doesn't require any serialization.
>>
>> v2: fix system_wq typo
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> gc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index c6cf227ead40..1a7907293088 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
>>  	user_fence_put(ufence);
>>  }
>>  
>> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
>> +			bool signaled)
>>  {
>>  	INIT_WORK(&ufence->worker, user_fence_worker);
>> -	queue_work(ufence->xe->ordered_wq, &ufence->worker);
>> +	if (signaled)
>> +		queue_work(system_wq, &ufence->worker);
> Just sayin, that's the same as schedule_work(&ufence->worker);


Thanks Jani, I wasn't aware of this. I will use that next time.

For the latest rev, I am not using system_wq any more but using Xe's unordered workqueue

hoping that would be faster at scheduling than  the system workqueue.


Regards,

Nirmoy

>
>> +	else
>> +		queue_work(ufence->xe->ordered_wq, &ufence->worker);
>>  	dma_fence_put(fence);
>>  }
>>  
>> @@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>  {
>>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>>  
>> -	kick_ufence(ufence, fence);
>> +	kick_ufence(ufence, fence, false);
>>  }
>>  
>>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>> @@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>  					     user_fence_cb);
>>  		if (err == -ENOENT) {
>> -			kick_ufence(sync->ufence, fence);
>> +			kick_ufence(sync->ufence, fence, true);
>>  		} else if (err) {
>>  			XE_WARN_ON("failed to add user fence");
>>  			user_fence_put(sync->ufence);
