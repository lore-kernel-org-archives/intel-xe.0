Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7425BFD9E1A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 22:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372EE10E0BE;
	Thu, 26 Feb 2026 22:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UICpiW2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4E10E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772145369; x=1803681369;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6W0gPIY21YGn990yamXMkyLeLx7Tyn+aUk4fD7TkO8=;
 b=UICpiW2Ss5C0Wx4zFf2UXP/7sMZYS4qBBK9rZgsOmQcOtPyO/oF2o4W1
 Gcu8daS6e4v+cuBdsTqDM+lTL6clunM+w7cPJ2YaBuNg0wDWXWx6cskz6
 rX1McSUEoGUYGx3eNl401GgSc12amrH1IMUv1odm4+HgqvjnvOSSBmPlK
 3xt/u3iAUlmlvNENQwivb5guhGoFPQCHFdUYXg8dpvfYZJBxKKVLsRks5
 ukkbXoDfcuYgXaL+MlC4DmbaTDDJsXg5Hk9hZ+gW583g0tmTfxg3hTppI
 1GwHLh6rSFH/lw4NJK+F6Gpz7dRDSv3kMo5R85ZkeRkouOiy1q2g+nyv+ Q==;
X-CSE-ConnectionGUID: g/+W/SnmTce/cKfnxumFrw==
X-CSE-MsgGUID: Ehe2dIbLQ6eaNvCdlSWx0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73131289"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73131289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:36:09 -0800
X-CSE-ConnectionGUID: htpfceoLRTuwzi/0KPuXWw==
X-CSE-MsgGUID: D0xdyMT4ScSNcSzrULWS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221711637"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:36:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:36:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 14:36:08 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:36:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsrgQ7XSBZq53dYrTcUP6oMxZm2fPiB30ax1nmezhYPVRrh4gvT2Yroe3L2ovuZi7OPshTd3fbJW1RAy71xQWnzaxHPZZQtwZnyOL2c7U0LqCStGro7c2XwvEyO27gTWuqI1zJfTYP1HRPUxnJkOEp4raXj5NIlunHKylutga6rgcEZg0cf+r4189NYfUKISW0ntzUDcf1dC5Gb5sVqCDeZNT6XqESUGvurFkUsqRCmE5h+j2XEJYxPc9eA5mt1UxnyPns0OXN2iwNyBgx9h9KPLQgTvcK1xLKiwyd/mdQ58/1OZRf8In6vHZ27fRdYvaCRE6z8WBqa2DjkZFIskYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nLH8fWiMoWKAee2CRiGs8F+osVG/BQGI+s0nthgUTY=;
 b=RbbJw/W+/flnohFBGV78rvjHk77pJtebgjvcf/p5dYaYUaUkgMN7n7KErtdxp1DdeY2c0JGdezhLoKFDAIu+UBVScbaOcrqCYni9e667c9fm6/Xq5lBC0U0X4GYrDhK4luCgtn9uyAif9QnlBuBd3oR5cTzu1PI2/0F41g/lw3QKJa6628KJ6x3gaV2vu1axORcEZPlcN/JxVWY15j47aozmTpTcvC7UeFnGLCt/Lzg9PO5Si1cddFhj8FDzGt1CHRRst5DhjckdrC54by3pqsGKxKX+7VvRrLfXWCt+DyEXoeWIhxgLyq5GXxvUMIyJAXeXCQW2HHWWtrSzJC5nSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 22:36:05 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 22:36:05 +0000
Message-ID: <dff3b591-bc81-4ef9-b706-a027e7993a50@intel.com>
Date: Thu, 26 Feb 2026 14:36:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <matthew.d.roper@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260216135107.3148167-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 8943f0f9-cfc3-4ea3-d18e-08de75876d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: aHt94FOJ7U/+6lPRj+eH6ku8PJgpzLCbp0bh5Fpro1geqcjtQ1/cyUSfh9n41Aw52W3doo+K6ftbyiTAcoV7celjr9b6ESkssT4k+6N4mC6C0SkiVBZOHJVAeyivAKFMT6y2sbMS3AtyFjZD8gEgFGYuD4RW2helAW3bx0fy8RP/8QNkGSgGfW8fKoameCBcndoHdodD1ur3c8CDOtwBYcg7dbGfZAUSFNSK4P/W7iJWPzg7FPt8ljDsFFcd0MVJp6T6ENnZE3PrU+N2w3jko0TBp0cVZU5SFiofDTT996eoqOSqchEm6+NvO0ITQPlcgm62Hg8zrHtgwNm+Lvd8HF9X4BSQBkbRMWwOqT0ZUkvAV+PfIU5T9T3/uDwGC49spMZ2LsY/q1mQT9MyW+pLtLMHpTKhFC2Hj+Oc1zQfFiK/Ghf6VjcMZXwSJBjUh0RhKM7FjYVvgfVWa+BcKyoS4FlK6aVfJ2pqrujIqsY/1MLtoLaMSY0Mg6DNARTMyganzx0q67uN1Bv+eN9PCUmqkzSxJttlJBtOHgBZ/elRSFpb7lUboqWCn7QvmDQSzxtUAY9pvfnuhMVmkpJZmCGo82JhI7YSDaAAFtaJb5FA51cHC5D/KKFYQxkuDeMjhmmIW7XFGqx22NrP4TeTjFl7weolMhIHIx2Dyzvjhh08FAM+nbYNxGfF+WzdN0gjDwHZxoYeWgs5OV1+bCwtV/DAJZsF9/rnfI99dB8abTfpKL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0dTbDhOOHZHRXlVaTBKQ2FoQ0d1TVp5SmdLVHNjTWVkVFRlL24rUXREV1pv?=
 =?utf-8?B?Nm95SS9QeUNBeGZSWk84N2h3ek1wNkE0dmEwaGI3RlRZYm9RcUtLcWdtamZz?=
 =?utf-8?B?eGo2VW9ONklBZjkyalFzYUVjV0Z2cTRIZmN3bUlRN3phRStEYzN4WnJkNXhw?=
 =?utf-8?B?N2kwR25jK1BKdXZ6SWF0aWdvUmFjNWxsOWk5aisxUk95NDd4RnBYaVlqVHQ2?=
 =?utf-8?B?T2dFdWo1RStobGhiZDVoeFgrUXpQTUEybFNLeHNIU1NWK2w1c1Rpc0lHNjY2?=
 =?utf-8?B?bnc0a3V6WVFjTjY4cVIwOEJhL1k2SFNHcjk5dlpac2k3TndJMEQ5MTNhMWRq?=
 =?utf-8?B?QTdteHRHN1UxRUowRDh6VCs5VWYxOTRFTHBUeDJsUTcyTzROR2VhWGwxRFlq?=
 =?utf-8?B?czRRNHdpc25ZNXpVR210RjZlMTd6Vk1OTkRORm56M1AvZGtIdTJ6WUlWKzQ2?=
 =?utf-8?B?Nm1wc0Q5aXdOYmRKWGtLNHFicVdqTEc0WVZYNjlFSFZzOWpwaVpzQkQzaFBy?=
 =?utf-8?B?eDVuMFRNd0NMNmZNWHBzUU5TQ09hVUdHRnh5emdQWmJ0V1ZRdzhYZ3pheEJT?=
 =?utf-8?B?YUNIZURjMTF0NEZuQjJCYk0vazdrUUxJTXpWOWtqNmVFaWh3b2hsK0hOMmR3?=
 =?utf-8?B?UG10RjhpZkNJcmc2dUxzWnlBdjZtdGFWNWZFeERZWW5OVUxNRDJ2MDlhR3Zx?=
 =?utf-8?B?OTlxWG9CSGN3OU81ZWdyQ2dFM2huYW11ZlRvQytIclZqQU8rdVdHWnRVVG1I?=
 =?utf-8?B?SkIxYWNpa0ZzR0NmWWxoYTJQVVRYdFpIKzE3T3BMalB4eHErTlM5NkVQT3o4?=
 =?utf-8?B?dklVQnBVcTJXRm9NUE9kZHFzN0NiRE9KMGJLdjVmenBnd1U4MHRyaDdHcUVi?=
 =?utf-8?B?MkF4RXlCeFh1RVYvNkZiQW9uM3l5RFZzK1hLTm1rQ3FVTnFNakhjV3Z3UFpG?=
 =?utf-8?B?SE44TE4wOE9VeVNQUllYTkM5dGlMcHFWZHE3ajB3SUoybHIrVDRsRTlDWFVS?=
 =?utf-8?B?ODVtNnBua0wrd2F4dGpZaUVJOUMzRGEyb0VQenFmbHY1SzNWN3d5Z1FTR0Y4?=
 =?utf-8?B?NjRGS0ROSFBQaXVZYWdraFA4ZXZDcWwyR1UvMWJvand2ZHNwNGhlWnVlWUlO?=
 =?utf-8?B?YUhTbHBmWFRJSnlaQmkrTFRGYVNvWkl6NUtJZmQ0VUMvdkh5MUp4b3NBWEVl?=
 =?utf-8?B?dlV0WjJIc04zU2E3ZmRhWGpBTElSN0gwKzN1TkNhT2U1YlRwVVphRFBnOUww?=
 =?utf-8?B?SDB3UVI0Q0NjNFZndHpTOEg4cFMxT2syS0xCT1BaL3lIOG12dFNUai9IYzdK?=
 =?utf-8?B?Ym90eHJya1pNMWs1UzdUSmhuWStmMlNmTzhQQmlSelkzMkpaMkx2Ujh1TDhs?=
 =?utf-8?B?dGRTcWNFQUlkdnppZmNWQW94SlpEclQ1RzNUWFRjQithdEpnbGlZK2JmQVRn?=
 =?utf-8?B?L3VxMURENllUL0hIampVdlRRSTEwNHRmK2FkR29BNURvL1RjT3h6c01FOEds?=
 =?utf-8?B?NW53cW9qQ3VoR2YwK004b0NEUzlwbHlRWEkvWEsvbmxMQVM1TlJRK1k0SUJl?=
 =?utf-8?B?dEtpck1OaG5WQ015clVTTy8rMlBPY3k0WGdYNGpGWStYSlFWSXJ5Y3BwQi9p?=
 =?utf-8?B?R0l2UGd5OVExNEdZRGVxeHFMU2FJR2IzaFF6b01Za0xCWTlVRmhVMEs3ajNp?=
 =?utf-8?B?dG02TmpjLzRLL2hKNXRaRXJiYWFiU3JJTGlxSGNBRXV0NWlBVm9UcTkzb1ZX?=
 =?utf-8?B?Y1kybTB1amY3Z2l2d3JEcExXUG5yMnpRRmZCUzlQV0ZXRGtEd3k1QXpUOEhs?=
 =?utf-8?B?QStncXpnTEZHcmJNdG9BQ0pJS3JXa2QzWUF6YW5iMWYyZ0Z3RXhBU2MvT3NL?=
 =?utf-8?B?VWZ1VHBPQ2RzNFc2LzFTZUhBSEVnbzJ2WC85b1B3dnVmaG1aMTNsTEM1S1Yy?=
 =?utf-8?B?YVJlMVJFZUw0N0JlR2VoR0xWajAySWJwd3VxU3VpS2ZBZkVuMjVJSUpJamVS?=
 =?utf-8?B?UWx1c2U3UWFlWU81TlRDcHlmZ3pRcGxOQUdYQklQY3dzVU0rSm54S2FZRFJo?=
 =?utf-8?B?SGhoQXpXK3h0OHNYem91MC9yVjZOWXZEQ3dHdFpyRWp0Q09MdTBybk80eHlu?=
 =?utf-8?B?dkZsaCtmQTBvWkxNNGc0NzJLMTN3aURXL0dBeWwvZS82ZVROZ25UQ1JXQVVT?=
 =?utf-8?B?WHljdGhVV2lWNUprd2pib0hRelB5aW9FYy83NHBIWGtUdmJMbnBvMytmNnpC?=
 =?utf-8?B?cWVNeGczN2oySWx4NENzSnNFM2FVb2NoYmVpMVJ4OXpJZ3N6di92bUEzVTEv?=
 =?utf-8?B?M2ZKTko3Q1VXNVVwZk9jWUJNUlk5OXpkbC9DSVRtSkhqK3RnNTNKNDlxTDRE?=
 =?utf-8?Q?rnonT7mYxUAo35z0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8943f0f9-cfc3-4ea3-d18e-08de75876d62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:36:05.1525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtWmRwuOG/ZaN081TSgmzC8mJ+/RLi92Uh7ldZL/U5DrQqKsg6YHvBhVd0WupneLFqALIN+q60hR0p4rey4nSqqmAm0icXIqFZ0jar/odBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
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


On 2/16/2026 5:51 AM, Nareshkumar Gollakoti wrote:
>   While previously applied only to the BMG G21(Battle image) platform
>   via workaround Wa_14022085890,this 1.2 GHz minimum is now the default
>   for BMG and CRI platforms.
>
>   Setting this frequency floor(1.2GHz) default is critical in multi GPU
>   environment for supporting effective Peer-to-Peer(P2P) transactions.
>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5e5495a39a3c..881054c9cf92 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -860,6 +860,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>   {
>   	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>   	int ret;
> +	struct xe_device *xe = pc_to_xe(pc);
>   
>   	lockdep_assert_held(&pc->freq_lock);
>   
> @@ -885,7 +886,13 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>   	if (pc_get_min_freq(pc) > pc->rp0_freq)
>   		ret = pc_set_min_freq(pc, pc->rp0_freq);
>   
> -	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
> +	/*
> +	 * Setting GT RP min frequency to 1.2GHz by default for
> +	 * all BMG and CRI(For BMG G21 WA do the same).
> +	 */
> +	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
> +	    (xe->info.platform == XE_BATTLEMAGE ||
> +			 xe->info.platform == XE_CRESCENTISLAND))

This will cause power regressions across both the platforms. We should 
limit this only to multiple card systems having peer to peer 
connection/shared buffers as suggested before.

Thanks,

Vinay.

>   		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
>   
>   out:
