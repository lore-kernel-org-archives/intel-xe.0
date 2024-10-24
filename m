Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9668DD10380
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 21:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6130B10E040;
	Thu, 24 Oct 2024 21:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRvWfgxM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB1310E040
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 21:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729805294; x=1761341294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5n0VW5bIkIFjXjzXg469MYxc6apNDKXi5WxpHGYZ1qc=;
 b=LRvWfgxMCudPE7G/JgFjMf9TVeg6RtVCe+zT9TzejRbt84Ndqe1Kk10Y
 nqbFRRam+UfLnqgySonCIy7rQE/t59GFW6k0Ktv3r77U0SOudElOmxwq8
 9+sBIneJff0Wg1l5NIP7hl4ej8JFAphOUGmNgbV4hTZMyfniNueu9Qyvf
 8l/SfosEiQnUBIzaRZfJjfWS4MYHLqzBqBFTP/wxTxSttLtrzG0JuXThn
 HTHIkDK38WN+Ssd1xsNTNG7Qso1d7r3T1dEKHmJqdXNiHgPvcRDgwrQR6
 UnIGNOTFob1Q2cjiScH4xr11AwDR8VJMrH5m8i7vOU9KT7vPIaRXvYNMF g==;
X-CSE-ConnectionGUID: KMV15WodTMmJrx+FUkD39Q==
X-CSE-MsgGUID: E+4kX+wxQIW9BbvzYb6/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17092993"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="17092993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 14:28:10 -0700
X-CSE-ConnectionGUID: tp7YSeWARv2P9BiDLKwLrw==
X-CSE-MsgGUID: N30KQ0uwQQKxu5K/0cnTzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85490597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 14:28:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 14:28:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 14:28:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 14:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLErf1SnN0Yiw+qTUCTGp75TfO5jiGyzQp6cixIsUqJTrYKWisaoYBCWkt0a9CwqDdbhRU0lSlY0Hika8HGBRWPGXoA0SX29Pi/ueiF4O0QsjnpZCgOYMsZbPl+AlCHyP2S0Crm4WCfjeq+h0GTQzd/PkWxJpI10zw00rdw6NMGam96KSate3JkRKu/HNs8rKOT6f9nDpAEz8oMNQ9r3IONgblz10V1v0bsmaB/S6pvh9InsMBZDoaddD99vhQCZ0J1sz7teJoL04AlN76GGl3B+N2L8BLrqsNo9KSdimrN0A6+WUIQwK11CFOn9m9hICjXfjzre4tpVRNiy1K5BTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV46h5v6Ok34IUtTkfet+LSOmSnKHAvCuJC2CsXTLSk=;
 b=P6HQc5MwrbxjU3TyCUPT9v7iT4OLxdw/0FLWGPBdozXg0tEaEisgA9fxB2cWRZ0xBssyUQS8tT3EUcuvW6YhKuy6UH8O6h1MhUK1uyO0k1mdikKYLwcesMh7+wm4UMeC8MtdMzWU6A46hMjjIWl+n9n6MnJ7Z0nhh8MEN9sx5iILWsvlB+zF6NpfH1nmg0UeLMKhCaIWhgKS/mWIJJV1ouTli9IHTGKzzD9+QjLODDvmXyN010UI/H3w2kw6GVbvV5EEexirz8V99HhJijEv6oVC+J2p4LVIF93gg0OYRksQKjA/WFUYgfyK/jvFFnUOLdz7H4uk2i5o/tsdVVduAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH2PR11MB8814.namprd11.prod.outlook.com (2603:10b6:610:281::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 21:28:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Thu, 24 Oct 2024
 21:28:02 +0000
Message-ID: <3bcdbf60-0de9-4873-b6e4-836f8e2e3816@intel.com>
Date: Thu, 24 Oct 2024 14:27:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Capture all available bits of GuC
 timestamp
To: Matt Roper <matthew.d.roper@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
 <20241024002554.1983101-2-John.C.Harrison@Intel.com>
 <20241024211229.GN5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241024211229.GN5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH2PR11MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: ccff5dca-ae32-4c0e-4dc9-08dcf472bd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWExU0RlY1FzekVXV3lLbDhZUXluVGJ1REw3cnRFcFl3MGwwM0pVOFc5NU1r?=
 =?utf-8?B?MlNNMEszNEgyOEVlTkwveDFrZS82TkYxMEhqaW9kSjIzTnBLcFNHQjRpbmli?=
 =?utf-8?B?OUdRL0FURkxCVksvYVBiUy85QU1qaFhlR08vajhNQ3NwdnZFcGFWc1E5L1lp?=
 =?utf-8?B?eVkyK3QzdVFWQmtqbm9NZmIxN1pGRENHVlNDcllnLzlESGtyYjJVZlFNeFBF?=
 =?utf-8?B?Y0kvZUVmbTBsUlNRbzVoWXF1RXV3dG1abFJDSjN3M2xkWjNHbUUyS2U3TWpj?=
 =?utf-8?B?T3JpODBYZ3VWemV2RkVzeVVpWG9nbWpBOWpUc3NXWVA0bURPNjZ5eTZ0ZGlJ?=
 =?utf-8?B?ZElQYTh0ZG4vMXZ0Z2hOL2owNTd6THBZS2E3M2NqQWZMYTJYYTREWnpVeWFD?=
 =?utf-8?B?TFM2RkRLaEJwc0psREV3Sk5OSG9SWm9rU3JSNWNGWlRtbjRKbzBQZlZINjJE?=
 =?utf-8?B?ZnQ3ZGpua29Gb05nY3JRYm0vQnNlWk9OYStXRGtLMFpQNEw1VmJTajBmQmt6?=
 =?utf-8?B?bklXY3ZBa0hFQXNPY0tKVHcvdXVpOWVENTJ3a0FRV3Nvb0cxTGRrWmgxNVkr?=
 =?utf-8?B?cnlXejQ0NlRRMkFsdUdyWG54RGZrYVBldldDUTNZT2JmOVovbWMxeVhCbFFh?=
 =?utf-8?B?L1VSMnQxa2VaRmx1TGUrdkIwSDZsbEVTV2VKZHR6SkkvUU5LdWhOUi9OTWZl?=
 =?utf-8?B?WktWSHY3VFpLMGYzR2k4ZW5xVUUxWkJsVmNaRVREWVRidzIxUFlBamhWU0xO?=
 =?utf-8?B?c210K1M1RUNSaFJNTVc0cG9uSWI5Mm9ISmtzeVltZEdhS1lIYjA4MVlHNGx0?=
 =?utf-8?B?ZkVpYXRWT25GWVRyaklYbm9kUEx6bWc5Vi8vYURJSG9QY281NjNlemxCallj?=
 =?utf-8?B?WUVzN250MGZFbVRQZXNGNmJCVzBTQUJTV1k5SlZORVVaZXY3bnBzY2cvMkxI?=
 =?utf-8?B?cnkvUUdwRmg5QnY2NGhJUUxSeWNrVEhyMmg4M0ViK0ZEZUZQWEEwaGhISUZO?=
 =?utf-8?B?RzIvMVpVNG9MN0p1d1R4SVN6SXgzR2t6eTlOMTI4dHFIaHJLUnhkS2NPcFNZ?=
 =?utf-8?B?WVhkNjdpaXBYbVJwajFYUGpodWxvaFZBT0lmV2MvNzdSVEM3R3psMVYxVUp0?=
 =?utf-8?B?TkVBR2xYamJrOGVrVTc2UDh1VlhXWWJTYnNZams5NHc1Y0hOZGtDNmZNSU0w?=
 =?utf-8?B?TnlkcG5pVGxxekRYMi95SE0yVFFoRmhTYjVlNWJJNDZLb0FjR0RHbHZBZWg5?=
 =?utf-8?B?ZWZQdFZ1N2g0WGtiVkNLU0hxdkRNL1dMcFY0UklPQm5KZ1VqQkx0UGxUeGdz?=
 =?utf-8?B?Wi9sRTlsbFk3eEJ3WW1DdzUyNTZlL0dJUEVDU0ZPRGttZmZLanRqVzNQSDBG?=
 =?utf-8?B?b2Q2YkgrSWVMaFQwNE0ydW1hcXhlampFMHd3akhSQXQ0SWRlRnh4V29uekpi?=
 =?utf-8?B?bEJId09rUkkrTzFvalZhRVRRV1g1bi9NQnNvcEw0QXVOQWJxNmJoMmI3UDhG?=
 =?utf-8?B?MlVlTGExL3BpWFVKaXl6SFNnOG1hWjlOem5rZ2Y4WjFRbk9lSkVWZVdwem96?=
 =?utf-8?B?U1BiUSs5RG9EUkpRK1A0YWNFWi9QUHVWNmk0OWxKdDR6dUl5SUJGb2NRRjFM?=
 =?utf-8?B?VXh0M3FBWHNZU0ZlSnp6TkVTZ2hRcWpMWkRYUmxDMHl3SmRPMU9vaEwyS3Bl?=
 =?utf-8?B?dTUxNGRTQjd5Mzk1bndPaCtOUDhRTWhiNTV6SHZITkNsOUFpbHkrQWk4TzRS?=
 =?utf-8?Q?+/Wgo1YUSb7USHQXeA/y1PKt9IJrE9gEG27cBWI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZ5cGREQnU3WGk3QWx6alR3Njc5OTBEQmtRS2hVUUM2RG1KUENUSkw3UHlO?=
 =?utf-8?B?NUF4eEM2MTd3cFFCaVUwTEFRRnJhdlZHL3hCYUsvZ1BNNHZYalNqU3JrS2Fz?=
 =?utf-8?B?NVdlMmh4akRBN1FyS00wUm5QeWczaTJoSkQ0cEhKTHE4ZFlRMXdCQ291MEhD?=
 =?utf-8?B?SlJUejhMc0FMK2pEK2RlajFrUFVDcExqMTF1dWNSaUlHd2N3MFVNbVcxR3k3?=
 =?utf-8?B?WlljWFlUbnIzSmhRSFZRYzJIL1ZNQUF5NmhCTU5wQ29nYmJzWExkejdXcXg0?=
 =?utf-8?B?R1JybE1TVCtUNDcvU2N4TTJIbVBnbEF2TmtPQjk3c1Bqd0w0Y2hGanAwUG5n?=
 =?utf-8?B?WjFqVURaTTM5WnFDKzd3OTJYdGFoS3BLdmVJYXNLMzl6MmVZNk4yTXMvbzUw?=
 =?utf-8?B?OC9udXdrMU9BWWhpenhXTkxrNnk0alJsajlqMDN2dmd1QzNUTmxXY0dqMExS?=
 =?utf-8?B?M1RIQmN2emp3aUlvNkd4MEdSZ0Z3cWE5Y25mbmdhNGRKaXV5a2ZBeTdSd2JO?=
 =?utf-8?B?b2RrN3Q0dXF4Y1FzQy9TREZQMk52b3kzUS9LSmtZNDVtSFlWTXNoN1RkT3Uw?=
 =?utf-8?B?WUFSdDUxcGNMMHZSRncvTjhUdmhPUmp2bkttdC9uK0dYcFRZMjVHODRPVStS?=
 =?utf-8?B?d1JBUiszTnBLaE9GZ09reEh0RmdBeDFaMTgrYmhJY2xSVVlkb1lHSnRMZExy?=
 =?utf-8?B?cWsrWktWaytuc010aEVMaHBCNTNGUStoa0JPUHlPcUptdXN4b0dzSHRjWnVE?=
 =?utf-8?B?a1FGL3RaZ2pHTUgxTGFJSldtOHpXL1lESFM5VzdlaDd0ZWVXVG1yejNYM0Zw?=
 =?utf-8?B?bTZlbFV2V3V4TXlzUm1mekNSUFBxN3ZyRlg4M2dOQXZPWmZoNXFDK1lNYnFv?=
 =?utf-8?B?Q0JxcDBtVGVSUTBnTXBEQjV4RVlickxOQmlKaDdCTEhwUS9tVFlUNVF1bW9N?=
 =?utf-8?B?cU9OenFHK2JPY3V2OGdHRDlBTGhvbEtnUmNTMkFYYVVuYjRPM213YUhmQkxk?=
 =?utf-8?B?S0FLaUI4REdkSGpzbUFDZlVESzFUTVV3Y0tJQzBlTnlGMjNvSFJLOXA3eHZt?=
 =?utf-8?B?dUFNVVRGZ09yOC9TTDhCZHptTGJXMllDNU1nTkFKaXEzaXN1ZUsxSmY3TGdD?=
 =?utf-8?B?azhlUlM5N09sSFI5YzBJTHZHQXhEYnRKUFlKMkdONkROaFl4b3lTRXRWNEg5?=
 =?utf-8?B?d2l2bXM4Um8zN2dWb05OalplZVJ4eHNYVEQ5OUN0L21MS1dUSGYzRkNSV1Y1?=
 =?utf-8?B?MUNsTWdWeStQcGV1SnZNUVgrbDNQT0lGQjFHQjJvSmtCcjlSYUNPUWUrQXJ0?=
 =?utf-8?B?d2dJalg5OXhIZlNYd21RTTgxSG9reHVxdjBFQVdRNENUM2UxNzEwcWFsSFBC?=
 =?utf-8?B?aXluTStMUm1xZmtsK0V2WXlJYUJQSlNjM0ZhM1ZQQ1l4TkhtMERZVzBkT2J5?=
 =?utf-8?B?dEJEcHlDUnBrUTVhNXBwQ1JPdERLeHdqVzVQQ1RJcDExTlJoQWk4cStDVGU3?=
 =?utf-8?B?QkdVN3dvbFNXdmQ4MHVVanpNWmdOcy9meUxNR0h1QjYxcnA0WFl4eGpPam9m?=
 =?utf-8?B?LzRVN3RTMXlqbWlWV2VKMU9Tbk4wckFiUmhqMTFFS1NpWWExc0NTQWEveDJO?=
 =?utf-8?B?ZkRaZDIvUGMwbHg3UndCNU9EKzE4UEs2aThaek05NHJkWml0cGEwNnhvWmI0?=
 =?utf-8?B?QmlnWXRoaGZzbmlvcDY2VUI0akhicEZtekZyVDUyRGR4SG9KZ3hQTTI3dlNY?=
 =?utf-8?B?bzlDUzVUYSt6OHlQbElLOG1ET0kwdUFwcmMxSWhVRmZYZkpVMklabCtNRVZ4?=
 =?utf-8?B?a1RPcmQ5YThTd3BHUnB0TG5Jczdna2tFNXkwT2ZFbnZqQmdaM1V5d0xzYzI4?=
 =?utf-8?B?cnI4eis0WFZmTHpTcVRONGx3NnlZeS9ybFZZbEE0aW5XeVRrUGczN3hZSWFs?=
 =?utf-8?B?Nmh2N050cWVBTk9Tc0hIODNqNTIyRVBQajdFMzJGV0JJaGpCZC9vTHJWNWcy?=
 =?utf-8?B?alBmdjRPbHFKdjgweUtzb09oeGdhZXFxUm50UzhBdVpObUwyRjVWWjd4QmtB?=
 =?utf-8?B?SkhWTjhhS3ZmMHpxckx1dnFIQ3hOQjNwZjBhUnUrL1h2Yk9UNVYydHBsajd4?=
 =?utf-8?B?Y0hsdWd3ZldyU3NSekk2eXU5dzdLT0FvY1c1TGlSQzhmVzVzcDVqRTBlanRZ?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccff5dca-ae32-4c0e-4dc9-08dcf472bd96
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:28:02.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEMRyfjhyHdeG/uFjVaQMgY1NIEx/RKlE62gwe/mrfc7AIY4Ug2tk5gSvzS/VMqq3jj8TV5ulblJerLgShLbDaEd9ecViDsClF5Eb1jmj4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8814
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

On 10/24/2024 14:12, Matt Roper wrote:
> On Wed, Oct 23, 2024 at 05:25:53PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The extra bits are not hugely useful because the GuC log only uses
>> 32bit time stamps. But they exist so might as well provide them.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 6 +++---
>>   drivers/gpu/drm/xe/xe_guc_log_types.h | 2 +-
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index b27b73680c12..2118f7dec287 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -84,7 +84,8 @@
>>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>> -#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>> +#define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>> +#define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
> Do we actually need this change if we're not using _HI directly
> anywhere?
Define need?

It makes it obvious that the register read is correct in doing a 64_2x32 
operation. Otherwise, it can look like a bug that we are reading beyond 
the valid register definition. So while it might not be required from a 
compilation point of view, I think it is useful from a code readability 
point of view.

John.

>
>
> Matt
>
>>   
>>   #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>   #define   GUC_SEND_TRIGGER			REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index fead96216243..df4cfb698cdb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -171,9 +171,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref) {
>> -		snapshot->stamp = ~0;
>> +		snapshot->stamp = ~0ULL;
>>   	} else {
>> -		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
>> +		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
>>   		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	}
>>   	snapshot->ktime = ktime_get_boottime_ns();
>> @@ -205,7 +205,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
>>   		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
>>   	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
>> -	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
>> +	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>>   	drm_printf(p, "Log level: %u\n", snapshot->level);
>>   
>>   	remain = snapshot->size;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 4d57f8322efc..b3d5c72ac752 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -27,7 +27,7 @@ struct xe_guc_log_snapshot {
>>   	/** @ktime: Kernel time the snapshot was taken */
>>   	u64 ktime;
>>   	/** @stamp: GuC timestamp at which the snapshot was taken */
>> -	u32 stamp;
>> +	u64 stamp;
>>   	/** @level: GuC log verbosity level */
>>   	u32 level;
>>   	/** @ver_found: GuC firmware version */
>> -- 
>> 2.47.0
>>

