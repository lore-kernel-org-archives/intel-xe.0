Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07284105A594
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 12:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8CA10E42E;
	Thu, 12 Mar 2026 12:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOowdmXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2510E42E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773318930; x=1804854930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WudGTL4u6PcqMtwWyBVpNPBKH4I+EAME67oht3wU4qo=;
 b=QOowdmXIS+aHMo7f563ZBZzEiETw970DCyR20YIu4D3e1ZwoTOc1eZtS
 JI/jHobH3Szx0y/+chOZ7p6majiczWe19Ai3CLsU2XyEcnZ2Lpy/qNtBS
 uMyeNns3xB5y3mzIYn15fuBvWi+IdCGFVXp1JJFqgI4K9Noqi1lYvMXrq
 C9njlrx6cUGPS0LD3RXeEMHrcbJpl8Iy/1OlNxpBfFEociOzJjNti4Jo1
 CAE1PTsawmp3Wf0lxmDCXrfFJkQiCl7cYmVgb+bJkTQMaHKvDUwR2MzXv
 Q2Ln8idofXffKOYsnd3EKnUApd475VTx9/gJuGjfs0elgeQ/iNNU8DF2G A==;
X-CSE-ConnectionGUID: LFGKDHWuTzK9/kq1OjDWjQ==
X-CSE-MsgGUID: axoaJavzQN2BesQwbMWWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74375863"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74375863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:35:29 -0700
X-CSE-ConnectionGUID: AHxM3k54T+eMPmWgiYWvow==
X-CSE-MsgGUID: SEwemGKxQCWv1pXvzshAAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="251299933"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:35:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 05:35:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 05:35:29 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 05:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lytqQUrWqaxYEOuL7po1DzIXYRNzZg2YbJ4SWrnCHW6HikndqQDQ35wHPWpwqwjxuah9H9Tm2Uw/H7t77K7FvbyuKLCEGMxYlUrwrY3DaS+B2WXgYdRwDDHxFeCGVkeA+nJ+ObRY3zogTCxbOP1wGW+DcioZkwoV2rYmX5gkZwqFgFXTYuknU9GfQfRSFu+ZBxi7/m6WngEHfD1UZONQbcbkebTAa8ZVlfBOJ2fswx5S/rKaJt5n2rKGfbU3KEx4X4ol5Q60BfICbQUmkJ0HrbOT23Uy45U0jo0x6Zy/Xwojnz6+aicfio/t4a2q5kvnqtGSqn4UPFPjFcF9PptruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFW/4lPptfq5jkaGExhKfcV6CInLEktgbVQs9bjTTTE=;
 b=jfU1ohbGaG9mg4sgP8GvnQ8Qzgi/JsLMoDLelcuxiy3RjsusiyHWhXXxcNoqAK44TEFJadoTxBOiDn6SIV+mXgPohMl/76UknC85qkscszP5OJpKrPzT/sX2mDLdwbpIqAHVzdrUPwihIa5bxO4su7JC5ItUYT0NEO+t0cj+XghWZ8bx3M6vOWsmZfWvunfaO4DnhFSOv21lOjc5SEbyJ9iaxwPJH3C/UbpChJ4tS6O94alyZ8G2lxY+C2jb3QHQ6cLg7VBy9SwXXxt7vZGpVjVvOyPx9WkUuZS63MXLRqjK1LPXX8neB9lxjA+9WnGcxEulbrrF4eddcQ/EG8jteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 12:35:26 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 12:35:26 +0000
Date: Thu, 12 Mar 2026 18:05:18 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/lrc: Fix uninitialized new_ts when capturing
 context timestamp
Message-ID: <abKzBrwfWre4ltl0@soc-5CG1426VCC.clients.intel.com>
References: <20260311104901.2933716-2-umesh.nerlige.ramappa@intel.com>
 <87y0jyvso8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y0jyvso8.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV1PR11MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fec1b82-e906-4ed3-19c3-08de8033d693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: pFwNER0i02EfqoVPgxm6nHBk9EwDF12C4V5Flh0dwlDdrEVFzrhyOabAa8a7ImzPucvBCaiviSp0P/BWIsNgZOXi4p+JIsrdxZRgm4BIcRCamcCdCN4Fxvw+2Px33sT7jPE4uk+nMrAVALy0MDOa/lSvrEodEdBq2pewwxTSr2gROTI0sHYCD7tFk3GHK9EoicQQjteVopSJFS/LIyu4SYN2nONhheo1WvqJk/ZBGABs6vaJQT0OGymJBZ4WamONAbEBvmtU1BZZzK/5T3pJ/dV87BH1L3HpgEPfwRjgxjoN1m9OPLdAx+5r43rK0nyxLaTMVQMXs5ja6qOXP3t7zJ7BtmoPG+VNpcqgCndpGmt+puHwd6miN81NPxZcKGwHHllrJ0h4/yHMX0W13CCKQEQlUzlAO1vSJkJzqb/t8+ckH3FGPQKASDnPb6rigfSaN5lkLuXr/TywzONi904cESkkpnxTF3090HnKFbyzJHCw92CtonDh1/2FazVwpniNUGqhxTRVp+8O/S6SW55d0KJjg45fMQi93bOtYwGW4W41vu/j95YME+dpToa93n9nTx/AoVgJY5MHZLqGN7yGwWzvCNK/+OOmnIDYBhYfP2IX0QZ5flVYPxn5TtqQL/giwevw/lci0dYjyWDLOk48j/wXFK1Yf7MQJZbDYTX4bMUSk/C4He82l+I6eqTqos57jXzSE7Borxjs5voGwNs+VjBCcpZU4DGWSsCg07hdK4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNkampwUmQvd2d6b1dDUmdHM3AwQ2pjT0tUanE1cEc0Z1JtOXBVR2gxdzhv?=
 =?utf-8?B?M1M4dSs5UkEzV2hzcEtzTEI1L2ErOVdNME1mOGtacnJaa3BIalVBOEk5ZitJ?=
 =?utf-8?B?MVF3U0VkenVaa2U4QVNURkRoZHg0bnJnaEkzenVKSmZNMi92VGJHV1RPMkhU?=
 =?utf-8?B?S0Z6ek1tOXozeHpIUjBJdHR3aGI1NGRudDVSUkE0MHJrcUc1elFCejN4ajkw?=
 =?utf-8?B?YnU3U2ZWS3hhTFBvZXVHZnlSN0QzTkpZTDJ5ZFhZT1AzMEZvQnFyRU1JdWJY?=
 =?utf-8?B?ZUNLeUQ1WFRUTnBSeE1lM015TVN2TTV6emRpWlptSWtyMGxDVGRlKzZ0MHpl?=
 =?utf-8?B?NnQwOUh6bUpWU3QyVWNuSjlYVGJ4S2ppMGE4S3orQnZQQ1hzRDNnMmUxNGp4?=
 =?utf-8?B?Q3V2ZlFvUUxxZUNEZ2NDQlVkZkkxa0prRmdwdmkxOE5rd05ER2JXZjBHeGZ6?=
 =?utf-8?B?OVoyYnl1bXNQR25UL1BxZ3Voa2J0NjN0ZUFyd01qVDRlL2R4QzIrc292Vmwy?=
 =?utf-8?B?NHV2WkprNm9lQUdMS0JqdlVZVDQwVmhHUGpRWjF4MU9TZyt6eEZMM0RkMFMy?=
 =?utf-8?B?NGYycWdOV3BJK3IvR2hzQ0NLc1kxMVplT080cmJsb0djRTBjQVAyRDhJb3pM?=
 =?utf-8?B?SENSbXVORnpjaWlpbDJvbGRwaFFSVC9ZR0t0VXpIeXVDdDVZR3hZQUFtb0E4?=
 =?utf-8?B?eWpPMitKc21UT0I0UkcwQTJjQ3UwNXJrK0hTVWVMSWlteUJMZjV0OHk0ZmxD?=
 =?utf-8?B?anJxNksvam1vZ2dEZXB0cS9pTXRnTnhHNTZsbkxqMEVSd2owVDRQTHZSeGxX?=
 =?utf-8?B?djhjdnV3UjhpR3E5QXkzSlhkRGRMQ1k1OEhBNjFxRU9lZURWWFZ1UUhMTHNq?=
 =?utf-8?B?WVowS0NkdUZGY2ZlUm1TL0R5L2IzY0xBUDF6RU1rd3h0UFhlVEhuQzNoSmZu?=
 =?utf-8?B?VWNRUEhrRmtPRnpsbWNZZGFOa0RpNzRrSDFGMndyaVZnV09wWUw3c2pndE9R?=
 =?utf-8?B?bTNZWm1wOGQydnhhL2F1NU80cEJnL1U3em0yQ3RhS011ckREWGFMSUxqSlZo?=
 =?utf-8?B?LytiKzNZOXNUU1FZK2pYV05IY2xlRVQxbTNkOHJlM1ZJSVdmN0crY3Yxc0xT?=
 =?utf-8?B?cEhJcGZndkVmbmdQcEFIcEE0ak5mSzNCNysyTnZtZnpveW8xa3ZLaDhNVXRM?=
 =?utf-8?B?VEluVzdrcUQwMzRud3FZeFFEbVRKV2VvUkxHSS82Tk9wcTB6SUtPdWpuOEp6?=
 =?utf-8?B?c0d0bWRaZUdmV1dwZjM0akxLci8wTHVhVTFmUnc0VHgzaFE0TlpBaVdHdHov?=
 =?utf-8?B?MGN3bGRPQmNzRkdMRlpHRTlqUlFCZXhxVmtpbjAwSWpLVlJ4Z1hvM3g1SEhN?=
 =?utf-8?B?S0lXT1FsS1pGNDd4bys0U0VaWmZtWk9IczVxcnVmV05ya2dqSUlRRG5UMVVT?=
 =?utf-8?B?T2gwYjByUEs5Vkp2SVBrbERKVXZEVDd2N01OUXpuQUpFNnpvckpLZDhGa0kx?=
 =?utf-8?B?S2hWNnRXY1JRd0lnSEdMUmZ1di9ucS96azJKbUw0T3pYOFEzL1BhTzBWVm1H?=
 =?utf-8?B?SVVkWUhrN1FkM0FvVU85bDBhbVJDSngyeEp6RUlsY3dCSEtpcDl4UDBxMExu?=
 =?utf-8?B?d0xiRWUwazZqRUdGdVJ0QUN2ZFNNMytXSStKMzNaV2kwcGg4U3RZMnMxbFVz?=
 =?utf-8?B?N0JjMGZXTzQybGh2ek9BUEwyRU96YnlqRzJwTFRucndoMWhKckVmU2ZmY0Vz?=
 =?utf-8?B?cEdubVFPM0trNEdkdlgvVWNoTTc5SXJhWDhJZVVGZjBkSXRYeERLVDVlTEFH?=
 =?utf-8?B?U2R6VzBBc0FSV0RBNDhTejFqR0hZZWdQa2QrL1laYVJYNEx0L2J3aldCKzBw?=
 =?utf-8?B?ZUxYNkpVUVVLcERscEdNMzRxR2JSRnFIZ01Bdm5POGVrVEF4dWdpamE3Qkgr?=
 =?utf-8?B?RDN4cW04YllCTFRUNmV5a3VvVUdWNTBldG40T24vYUcra2JXL3VHVDBqdVBx?=
 =?utf-8?B?R3RzUlFzeWpJdzFWdlRxL2VEM3Bxek9wc0dNWnA2SWlRelErUXg2Q1d1NHlO?=
 =?utf-8?B?QnY5NjhlbXMxUi9IUm1CUy9LYmxNMXJ0alZqc3p0OVZ0cVRjRU1qM0k5bmNm?=
 =?utf-8?B?K2FpYmV1NDNHL1V3emJ6WmFGQmpWNEt4ams1dlV4SmtEVHcxcXRETndLQmxL?=
 =?utf-8?B?ODYvSHUwWEpGeTRZUnZuTTdkZ2RlcW5qUERxcjdTUjNJdm1DdWNuUWcxNUFq?=
 =?utf-8?B?b3BOQyt2V21NWkk4a1pFZEswUUlQb1FKc2gzNjR5TWpZQlZ3eGNiaTFuYTFh?=
 =?utf-8?B?RUc1bVJJa09wSE5rTmVnMElpUm1GdTZyVVlPNmVOb0h4RWpBUWpOamxoZ1Zh?=
 =?utf-8?Q?DLA7S5yFiqZ4Txcx8tUToelpRpOCIkM/s4R0+?=
X-Exchange-RoutingPolicyChecked: FS3z93uB1nAih4tL9NvE1zz0BZ+Tjy+gV5DwzvCGqyz5j6Aa3yeGOzgualv2HjuUY6jvconDxbyv6Pa4aRVs+bDPGBFHONlIno70JK/CPcOoSQflNCI4oLsbxwl5+vFoHP1FqbS7nOB9a+ipmu+A02inBiqxZTW9tvsokf+s7tazFy9jCdaMqlFraFRBOrK4p7scrvI710zjJ2DNfCMKl2Gb+lye+5bAzhFQQ4wQB56M+GC6EDWCsxs7CvinruoKDavKDwWgI7MeFEKeD9FN7VhBtxHg1KgwzJNXmdLbPgnvcarvdxiIJOC1MvQpTsg1zhvdGniiKbnTWXpgenzYGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fec1b82-e906-4ed3-19c3-08de8033d693
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:26.6281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDrYaR4nzrY1rqymJMfTLcuKwOHMqpnKZ+x9lxJJvO7mfdxM/ug5SSf0aWYSeIYUFzwELRrf7vmSyUnQU6H/KcdFdcSz/E5B77j6Jn0EMZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
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

On Wed, Mar 11, 2026 at 04:43:19PM -0700, Dixit, Ashutosh wrote:
>On Wed, 11 Mar 2026 03:49:02 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Getting engine specific CTX TIMESTAMP register can fail. In that case,
>> if the context is active, new_ts is uninitialized. Fix that case by
>> initializing new_ts to lrc_ts.
>>
>> Flagged by static analysis.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index aa26c71ae34f..9d766ef414ed 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -2563,7 +2563,7 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>>   * @lrc: Pointer to the lrc.
>>   *
>>   * Return latest ctx timestamp. With support for active contexts, the
>> - * calculation may bb slightly racy, so follow a read-again logic to ensure that
>> + * calculation may be slightly racy, so follow a read-again logic to ensure that
>>   * the context is still active before returning the right timestamp.
>>   *
>>   * Returns: New ctx timestamp value
>> @@ -2584,6 +2584,8 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>		engine_id = xe_lrc_engine_id(lrc);
>>		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>>			new_ts = reg_ts;
>> +		else
>> +			new_ts = lrc_ts;
>
>Sorry, don't understand this too well. But looks like here 'lrc_ts ==
>CONTEXT_ACTIVE' which is not a real timestamp value (it's value is 1). So
>can we return that? See also the final 'if' statement in the function.

oh, you are right, it should have been new_ts = lrc->ctx_timestamp, but 
I will recheck this since there was some refactoring that happened here 
in some earlier patches.

Thanks,
Umesh

>
>>
>>		/* read lrc again to ensure context is still active */
>>		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>> --
>> 2.51.0
>>
