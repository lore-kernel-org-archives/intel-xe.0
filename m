Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AA2C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 10:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8422D10E3F6;
	Mon, 17 Aug 2026 10:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgk41Bf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F4710E3F6
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786962055; x=1818498055;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mZAgr7ZiG5sHwYgRds8vMMYGE0gqBzEWEozB7mllio4=;
 b=cgk41Bf+0ui2JFQ1lBBTaaO3kpQKFClJtasp6qV94M51D67/rL21+anf
 1Y5w+M16j6yl8oO4sAPi5wSQc2OKyR5K5se2gy7X5MuIW2p8AF4XYEjSZ
 SO7zQPjHU1xNHzaGdfrnyaJ/uHlMxGPHItv7Jt/tu2msGOrmjr+NJQgrj
 CuIPXmA3C3BdaWN4zKrvEc91s7LXbTa83+LZZsplX8G9W8x0vZvwYrtbq
 6zF4YtI1vGBb6MbQw9sclDyq4bnAyLKpPgZi6D4hMttdLgqYZVIORo2sX
 miHLduXga4XPHpoUczPV/o4HVA/TyJaHF/QzEvIGJ25cuDjLAlQMF4d2y A==;
X-CSE-ConnectionGUID: 1S7A6N0YQMiAKIw4OqgWBQ==
X-CSE-MsgGUID: R2tU7+BhQZ+gMC82CLP/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91111871"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91111871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:20:54 -0700
X-CSE-ConnectionGUID: 3vJQEf6EQ66+n+u4sGjFzA==
X-CSE-MsgGUID: IdgA1E9bTBmtRWib+YX6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="265491369"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:20:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 03:20:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 03:20:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 03:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i86M1yE+VNRmUHD5Fb83bfilsRhjrAEhCBnLLu4bEQCrA3EXfpx3/uHKwh5iAK95ZaQAeFSEjv+DmKgY0Esq9apIR04NYHMXZLU6QlBNDZKHm0gYjNZ/a4FsfZQfVQLLcFdvGwkbCkh9KKuKJq+NoCQGy5/2EUxNpu8b2fekpzPJ1yBtgTXtUo5c454RZlL3M4tLpQM9MMkX2FcPr3gbDhglw5oARhVv5+qwSWUe1OVuMj38nfuaINosshASnPVu2Stx1+uGjRbITTPanGqq3hkpS+EtSIK5yIBcd4QJgob/G/XxGyAvGobrAb9ABm5+MhfGZtGGSqFLC9x+Ndp+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA0og8Ai7wCACGPoEzOVgPVfRAVKpxRzf4gpSQgAlJ0=;
 b=HddZLSq0hjGQMjL1yEhzGO5suyE4yRU/P51CIVIqDUGymc8Cb81FIQiRBtqahTGANdiwEWXUPLjQXAypUN/e5F+ZkiHZTzR3s1wCJQlbGFuGCG29+pktyiyqpKvgAWPO5Tei6n4rTI45UgQq/EymusODYoAlliUTJDCrfkQI2ILOqhu5AouclOAplComLSBgVr2aAVDj9YuRN0EFxGc1otSpXRXg/H+5RPPLVoIRjx5UAjc93vne5CUj4/NTEtPnm5knOzBxgIyHMvnwkLQrcaCZfh+dkY/Llk3SXnrSWmnG+2MZks/4MehE4GUc09+YmnEgnsOgH01dw1vtptpXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:20:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:20:50 +0000
Message-ID: <2fe86f6c-a51a-4f93-8905-82fda0fa2254@intel.com>
Date: Mon, 17 Aug 2026 12:20:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Report GT TDR and VM rebind faults using
 SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260804093648.609728-1-arvind.yadav@intel.com>
 <20260804093648.609728-2-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260804093648.609728-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0159.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: ee156227-dcfd-4b09-113e-08defc493615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2w7hvcdWD9e95Fvjq0TcxEC6AASNi95r2OAURRPucBabTs6A2ZEch7B7DmbrDMkUqleE6yWIQRW/skoRtAw977Usz/Vo+u+jSjOJkCMMBn65pv6fBaPI6SK5oRRZxbkGnEkvzt3R4yhdxzSVKZkh7OXz78uACVyAggd8xS6yiaalZXSEZ1RQKz9NX9QDLB7fW4l5nYW+h7q5dOtATC7kWH90yhoOajv/oCwDE5UJi9gspwrREODLYhTYyq8jJu+5yp3UrrZS7HsU+8zsqfpbHVuPc8eJKfOf39rM6cWPGhm+C855q8A8rlOIxTiaI4rydX9bAsPFosy5sdSJLZH6yictXlS8RGKcDyeXB4J1pWYrROveooLwA56q8/KZ5o3AI20t5OFKajHpwwaPJkNUfrlbHGkMwd/TjGkyz9OF8clvJ0vx8VhDMvWJoPo0WiBRIRFvhNPCOJ2hu8GFh5vNHkMFZFkHNx4IRnvvgbjLfK2/JvfO3x/hhOwohleGYvqUn4lh4tIa2IqSd+jL9XCJKwG4BmXiL0U1PeAatQBUCVwmfGLX1FjvgYAmuiyXu2f4h4Vk2yhycdtvvlS3rM7XKIHP3GXvPeZyBLYyDsMLCIuWrHbU6IN1GkiwROitHVTjR80X1252wLUvyxQj+iOE0rIFj+c2Ma3nhdjhuAqCGEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1Z4bjNtdjZkYVRPdHB4NUFid01EYktUdWNJZmxMTlRQMWdlNHBnc0J4b2Zj?=
 =?utf-8?B?dzllclo3bVpoY2tJTW9JMUViYTY4eGl3WE9kbWx5NDN5V0g1ckZvMVMyb1hG?=
 =?utf-8?B?dm1oU2xFSHIyUmZ0bE92VnlBUTE4L2NaejltZzJnTFhQWkd0VlZla1FqaUhM?=
 =?utf-8?B?d2JqblRGejBzK1NNcnFiZHhRd1duL1JqdHo1Q0xlclcwQzV6d05uN2JTRVZH?=
 =?utf-8?B?WUw2SHRIb3dpaVBMOU93MVppQmt0VG4ySEg0Nm1nOFd5b3dSSHBhTThCTVJu?=
 =?utf-8?B?em44VE5iSlZQZHZEVy9QU0V2dWtGaFRTbFNGZzZMZi9jK2Y0THREbzE1VEU2?=
 =?utf-8?B?WDRLS21yKzFKWUJiRGlsSDgrWjZoaWg2R2JQSVRSMGRVU3Rtd3pyaTZhOG1D?=
 =?utf-8?B?ZHZtdzBCZjdpV2wyRFl6RWpZdGIyZmFnOVFiaEp0QWpFS3BjaXliT3JvRXNa?=
 =?utf-8?B?UmZVbmd6LzVhSVJHQkgwemFwVjRWOXNDVkR3cGZ0SnpVWHlPa3JaMXRyNDNw?=
 =?utf-8?B?OHNRbktOcDYxRmkwTExDZ0o3aVM5c1VlaG13Tzl3L3p6SWptblNnTTcyMU42?=
 =?utf-8?B?OXFrUUhDYWlkellVOE1sNEl1VHJidnY5azB0QTBSTUl5ci94YnJqVHlWMDlP?=
 =?utf-8?B?bmhnUlFtdHE0d042SmZlejFFUUU0d0NHVXJtLzc0blJoWTM2QjJNMStPdUVI?=
 =?utf-8?B?L3pFRXFjZVc2TzcwM2RqWjd4bmRxR2EyYjFqYU5qNG9Bc2JiRUJyN1BXbktE?=
 =?utf-8?B?UlN3WDZQdFFhT1BjOGtKU0RvQzRPWGxyT01ybVQrSnVUeFZGaFVaaS9WZHBa?=
 =?utf-8?B?c0w2aEczY0VqSSsya3lxZHNuUVIrWWc3V3hkTGk0TkFRcjFoTnA0SlM5L0Z4?=
 =?utf-8?B?byswVEZIR2hKSElJVjFJTXJ1bWM1SHlYM3FET3pMTE9SdFc1V3V2a1JBODh6?=
 =?utf-8?B?NGFUVWhTaHkvTjlhMnlIMWx5VGwvUGg0YnNDdm5Pc21yb0lEOTRlalU5QWtw?=
 =?utf-8?B?S09nSGhMZFZJeWRBYi9mVkZBWGRubGg0bXo4NWJNdk5FRFFESlI0UGw1eW5D?=
 =?utf-8?B?MHNWRkhnbitNU2Fucy9ZZlZOQkUzbDNKVUowM21yWkR6aTRkVVFaZmxreDlp?=
 =?utf-8?B?MDV0eVV6c1ZrRkdpUE5ERncyKzAxUUNyRlZRRlZkdmppRTBTU3YrY3JYOThH?=
 =?utf-8?B?WXArSFdCOHBLRXV0MG9XbnF1V2ZhWU4raHZNbjIxQmwzZlVObzJsQVpVay9S?=
 =?utf-8?B?NXdWOWdIaG8wM1V2Z0NydVZVRGhoWjRIeS9sUHFTajRHR3NwdUViV0cyNUxq?=
 =?utf-8?B?S3BkWklKdFhWMmVmUC9HMTFaKzMzZ08zYUo4bTlVRm5sY2ZqdVgwWC9VcG9j?=
 =?utf-8?B?S25rNm5DZlVCUENxK2tMcUk2TEhnVW1HWWMvZGZKWGptbERSaFk5VnZvZmM3?=
 =?utf-8?B?NGp3eXZJUWhNUEJqT09RQ0QzWHhNdFQvWmJ1aUVsY3VwdnREanlMMmNWZVBl?=
 =?utf-8?B?aGVFMmJTaGpWUk81dURPVnVzSTlqYmQ5aUZLeStMU3dmdDhMbWdiS1BtRTNj?=
 =?utf-8?B?OHpaejVDTFU4cVkySVpySUtwOUhuUDFvbDFGZ2pJVnRvUUcxc1pmcFArME1q?=
 =?utf-8?B?a0U1ZGU0VHgrV0xoNUlKc3VCQ0swS0szekZyQUptZWtTVDVUTGF6R1dveWJU?=
 =?utf-8?B?YjUyNTBOVEp3UXptRHF6ZmczVmVTNDgzZHZxbHlVK2FZb0JWT3ZpbWd5QXZz?=
 =?utf-8?B?aXNYM2xWazVnMVg0VERNT1RxZS9JaGs0YmNCVGVoVndhRmpxb2oxMVZabFJZ?=
 =?utf-8?B?YmhhdVg5NWpLOEgyRDZNMlcrL2h5RVNtZk5PQnlsK1g5Vm5PdWZOVVljVFZU?=
 =?utf-8?B?SVN0Qy82QnBvSTlVYUFDZkdRQzRtc29DTWdGODZtVExnQ21pZUp1b2NGalNn?=
 =?utf-8?B?UlBFMFJXdGIwMjJSS3R2ZzZYYkluRURxbCtRbTNmd3h5ZjlobGdyVXpidVdG?=
 =?utf-8?B?cDM3RFI0WW5zMUhIaS9JNTFEQlg3ZTFTdjl5VndBUDlxbUtvdnJWY3I2WkNB?=
 =?utf-8?B?SWRkYjU4emYxMVdvNnhaZW1GMFNKY04wWWdsbzVKVnVtU0pGcUw0cUFIdkR6?=
 =?utf-8?B?c1dXdXRTOC9YM2tjbGNsb3c4dGVoWHBSd1FBck5TbU1RRnBSaVNVQWdoUGUz?=
 =?utf-8?B?L0lYRGhQZVdUc2xVVXV5S29sOHRpN0FIKy9YaS8rMXVwQXJ0bk9wL1FPQ3BS?=
 =?utf-8?B?dVhHcTdlS05aNUd6aUVTKy9rb25VajNKOUEyZjdKanhrT0tBaW9JYmhITEZu?=
 =?utf-8?B?V21MZXltcjIraDIwcG1qa005ak5pUGNhWkJFcGxoNWpBYjFZTFJINzdrYjZh?=
 =?utf-8?Q?3rw5b38KeeCTTKR8=3D?=
X-Exchange-RoutingPolicyChecked: Rg3u2kb+p4W+GhcLmo4JrzIqPXJs1djibDYPA6KJbWeW1fxwXHDCqDjNYX2t1IdwU3K3csKeejv4rs78L4iQHiLJeoxqzn8G7bLNph/Zbr2v+jOyE/9XSeSSJzFZ3b/7jO7VWa93OxxR8p6fV3F7pSZXwUY1zM6QUZJCxVCLBRaR098Hgd9dsUr8xqyvwKkiADMOW0mXhLDZ5VnqvHits4+SCWagsRQdK7TTCZNJS0cd+CF6hsligqoEBVZhCpruUFiMysrqBmwM3zN8Hc+NFLq34WAumUrW+uf55nY/NOp2cd53hpmxNck+fav5MnXXXuRi9DFck/j/oaTBWQeYDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee156227-dcfd-4b09-113e-08defc493615
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:20:50.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyO3YfePKZuGTB8GhQBdqWXKhwmha+aOSi/Th9lcBHoa1lSLHvMYmY3yA89Tam5177z0iIS/WKtDO8A3Trk9Yp8L/j67XAbi81nFfE8z9zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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



On 8/4/2026 11:36 AM, Arvind Yadav wrote:
> Route a few existing GT TDR and VM rebind failure logs through the
> structured SIGID logging helpers.

above is a good candidate for the cover-letter
then IMO there should be separate patches per each new SIGID usage (see
examples in SIGID introduction series)
> 
> Use the GT component for GuC job-timeout checks and engine reset-request
> failure, which reports them with XE_SIGID_GT_TDR. Use XE_SIGID_MEM_FAULT
> for the terminal preempt rebind worker failure, since the VM is killed
> immediately afterwards.
> 
> v2:
>  - Rebased on the latest structured SIGID logging series.
>  - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>    helpers.
>  - Dropped paths already covered by the base SIGID series.

you can keep change log under ---

> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
>  drivers/gpu/drm/xe/xe_vm.c         |  5 ++++-
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8aaed4fd13ea..79bd0e46640f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> @@ -1375,7 +1376,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	u64 running_time_ms;
>  
>  	if (!xe_sched_job_started(job)) {
> -		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
> +		xe_log_err(gt, GT, -ETIMEDOUT,
> +			   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started\n",
>  			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  			   q->guc->id);
>  
> @@ -1390,7 +1392,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  				     xe_sched_job_seqno(job),
>  				     xe_sched_job_lrc_seqno(job), q->guc->id);
>  		else
> -			xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> +			xe_log_err(gt, GT, -ETIMEDOUT,
> +				   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck\n",
>  				   xe_sched_job_seqno(job),
>  				   xe_sched_job_lrc_seqno(job), q->guc->id);

in both above cases you are promoting from warn to err level
is this expected/required ?

if we want to log them with SIGID but not with an error level,
we can use xe_log_err_info() instead

@Matthew, @Rodrigo ?

also, early documentation was suggesting that each SIGID should
be selected based on the source file; now since we have components
are are more relaxed, but still we have to follow some guidelines

@Aravind, @Rodrigo :

is it ok to use GT in the GuC file?
or maybe we should introduce GUCSUBMIT/SUBMISSION component with
associated GT_TDR instead of RUNTIME_FW ?

>  
> @@ -3354,8 +3357,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		  guc_class, instance, reason);
> +	xe_log_err(gt, GT, -EIO,
> +		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
> +		   guc_class, instance, reason);

separate patch ?
>  
>  	xe_gt_reset_async(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9e0176861cb6..7c70ea23045a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -28,6 +28,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> +#include "xe_log.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -591,7 +592,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	}
>  
>  	if (err) {
> -		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> +		xe_log_from_recoverable(vm->xe, XE_SIGID_MEM_FAULT,
> +					XE_LOG_COMPONENT_NONE, ERR_PTR(err), 0,
> +					"Preempt rebind worker failed\n");

separate patch ?

maybe we should just introduce new Xe component named VM *)
and assign it the SIGID MEM_FAULT ?

*) or maybe better VMA to avoid clash with Virtual Machine?

btw, there is also other existing warn that we may want
promote to SIGID:

	"Could not allocate memory for fault!\n"

>  		xe_vm_kill(vm, true);
>  	}
>  	up_write(&vm->lock);

