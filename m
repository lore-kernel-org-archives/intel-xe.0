Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABDBC982C3
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355D10EAA4;
	Wed, 16 Sep 2026 13:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKGplh6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7B210EAA4;
 Wed, 16 Sep 2026 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789564944; x=1821100944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I3qbu0ChuR3qfs+DcBQNUWTRg25GtcBlrxiJZpKLqP4=;
 b=GKGplh6PN4H7ixA4Dwlp1biDvMax8xt+TovwwkEYKw2EPLxfhD/AwXEs
 4pWy9HlNn+bhoTYVS6S4Pp7FkoLi5tcCEA3l4lS8fWEcVG1u+KTneZ3Ty
 lY9N6Q3O/cYIlb4htGrgdUNXpAJUUd8T5/vwyRaFJAWNmMPnQWNbhIXoY
 vfz5RAEtj4RXE22U/P5itBxaq83uLlqihvGZ9nlONiXrcHIC+uFXmUBtn
 9pVmoLwKJ44dvjYszzeTl2ivVz4gX9NjTDVQ7SO81ENZtb5Mb1+R8vilL
 LE0tQH/00sbwX7hfJCW2Pdp8tOetWKozjT2b+uwLUiszbIV98PvpfstvX w==;
X-CSE-ConnectionGUID: T2bAP9jGQNyUxA/JHMnS3w==
X-CSE-MsgGUID: 7kTDtHgnS4qYln1srsQvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449034"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:23 -0700
X-CSE-ConnectionGUID: o63CAK1wRFGh3NhXG6JjZA==
X-CSE-MsgGUID: i9Pc32uMTYG1ULtQQcB21A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270059598"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:22:23 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRz1Ig4cQSjS/HbpbmAB7q1xVsR0ATvGSiMKkZTPcdYLOULSdZlX9aURH7fxxRI0KDqo1S6AAcwg6A0ke2c4GkdQoFPo2VnwVmc0zYnWXQSMIlHsvxGoDwekJ0M3lMBj08ms/vg+MWhfSUHVCF5ekzhvKb553L/gNHrmVPcxQvsVCjZ+XmkQtWwFzJm9ykTbHydAcj/19starywlay39JXW3pFQPDLu8zRBAXr+qO5cXR7cDQiHUlTmX6YZlo8Kg1OAl22kjWwsK0uZk3+G/sMF9NC9Z+39axp1s1aiFnzPP3IqhmvjDPVOX/uMuc2Lb0fCSHi1sKk0eHwxoEj01Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/lb6RxT8tqfMUjHb/d5IxQlBimqBaLMSB63ox7jeGI=;
 b=qThCzyF8RSs23QRLln9AIfB03CBSx7fFgbHNYt/e4WKcp/sEN/SoRe84lk4aQ4cZl6dfyTFE1ffwMQyEIL44LwH2B0G+s/jNZD9vWKM5Z1+rIqGsSy3Kcy6Rkh8YWzAvyyAlI9NG3s0QPNyuOk+kb3ojwJnS+4NWKCXkyIzv9u3wMsotFlntZ6KRGFjQNa5tcoM6I+Sp/jBNoE3cwuoZfX7yaqmXnBwLuoDTRx7wj1fFCWY2ogwIvEFQ2Q2wSphDTniPJHR3orMvnbJqrUPu3Lgj8S2ImS9h5cN+9O8+Oy2oqU9fLixe6lj2W4knPeJQBwe2MB0LYKtA2uyEqnnSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:22:19 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:22:19 +0000
Message-ID: <5565335e-ffa8-46b0-b7c4-6c1547c186b9@intel.com>
Date: Wed, 16 Sep 2026 18:52:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] drm/i915: Don't initialize flip queue on pre-LNL
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-4-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0298.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 5896e663-f7ee-4bb2-0cf2-08df13f588ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: KirVahO43UQaVQq0Wq7ARMRIMlRLXTsn7lkCgPa8hQwt/WXPYvraGqdxmaElFBvzYyR4oaJ5aqL04rdWvu+HHBKFN1n94gwxsxNzm8mbiRaNH3DTvwQ6/b2svpcV33uas2KAqumKZ3SnmWsLTMe9z6SQGjED41YcChZ2AKaDAYlaWjl7bsyibwrG/mumoWX6JoSPp2Zh51arvn/gTfvMwa7NQppuj2L7CgPM7Sp1PZ4Ooksqr1uFWBuJyRgACbNV5RN4sxUzLY2nRrD+jMl21Qj2YvsoUxbKLNNw/u7Cyhr3CgBRFx0h9ayCYSt/27M0i1kTQeOnFqDCVpFUKkmlgcFkBT8vJKkp5TRByPXhZGmxG/n7Br+P/xrw/EBwJzFjaY/dbo4DpK2io2c/tTJ2jFIDnmNgUwXteiwRkndT/LaHbwwQzlH4i9DXFIO1S9mXbJwE91b7wLeWScSTd7A5NWXWa5zo5QB+Fc/skVQE3sgceWcoF2r1Ajil1bCXdqiE/gEcUBzwogl98YLjv4skgnujoDqDVGaHvhCcv2f4sMJi8EAGpd4CW6Z9ULtgwu0asY6SKfU0iqOKDHwkwIuekYuZlWHcYaguruHddci4I7Kxomo+zskqmAr5EF3+YOJctZF+37KkMuwxQVZy5YOHP1yHqf+GPHIYst/Hv6G8+LM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhuKzg4dE4xS3JVa04vTVZkajdLbW12S0l3ZnlnbWtYem9nSnN1dXdMcXJ5?=
 =?utf-8?B?L2pUcE9STWkxUVcrOE1WRUtDQXJVTVJPWVdjRXpvWFNjb29yVDUyL1NhdWpr?=
 =?utf-8?B?VFNOcjAzbkllL3dFV0FVTGt2QnRnM2t2YWI2NHdBQ0hRSXhUQS9LRWo4bjlk?=
 =?utf-8?B?bXhTOGlqakQ2ai90KzU3aVRPRVUwalF4aXJQcGxKVGxpUWZlWFcyRTVXNFp1?=
 =?utf-8?B?eDEwWUFtdzRRdlpOZ1hiWVdJcTFqSHNablBQTHNleWFRdTVnUHFyUW1Fd0lm?=
 =?utf-8?B?enZYL3dkOG50d1d3OHN2Q2NOQmhWWHhKcjgwa1JTWUg3OEhldTJnRGF1a2JG?=
 =?utf-8?B?V04wSHh1TElKc000bS9WZ0ZLNi9MNzVId1grREl0L2NQeVZpWFZ6Z2Zaenhz?=
 =?utf-8?B?YXQ4WUF6eTgrdmZJenRQdGVWSHNpY3M5TW1JZkV4T2drZjVFY0VidWxEYW5n?=
 =?utf-8?B?QVd1dDJDTFMrMitwRGtGZFJCd3pVSmZlM042d2NYUWRhZUhUZ0VCOUsvbHNQ?=
 =?utf-8?B?TkZIalhpZC8vQzNDQmhXZHE3SVE3bEs5VWRzOThBR25wYVJHSDVLcE1mZ1ZP?=
 =?utf-8?B?TGExL0x0bHVSR3BvRTJqKytkTVZ0YTAxUXVxZXdqOVVqdFdDbGwyaVl0YkVs?=
 =?utf-8?B?UHVtWkdqekRUM1dDZXRkU0lZZzU3NFliZmJUbXc2Vlp2bk5MU2VPbU9SQ3dH?=
 =?utf-8?B?dGw4OEhzbkxaSmtqMGJMODVHVlB5d2pLNHZNWEo2QWFpMG1ON01Pb3AyQ1hk?=
 =?utf-8?B?YkJWa1M1bU4rSXMzWHIraU9WOU1KenlKbENVTTF3UWtlc3hWcnJ6TmJYVWpx?=
 =?utf-8?B?dGdFeUdBNDVLaHVqVU5tQUJ5SllTRlFuZ2FxMzJRY0NMTFEwTjRKeUIwV3By?=
 =?utf-8?B?cEdseUp5WEkxMmp3S1oxQnhEZUg1WlFqT0hOZ1JhZVQwdmVpR29HUis0TjhS?=
 =?utf-8?B?RGlOd0VLVzdSRkxUOGE0RUZCdldrTEd6OUpmN1FHMitIY1l1OEFQTThXUnhE?=
 =?utf-8?B?UEowUEUxbWhrZitGeWxRNUNCZ3pCQUdrTVlwOUVwN2UvMjdPelF3cWFVV2xi?=
 =?utf-8?B?Z0VML2gwMjZPZEE0c0dzbUQvNjdyTjhIOUNFbGYwamVZZXNjQkpDUWlhWlZo?=
 =?utf-8?B?am0xR01LazN6dVNoSVhYODBRS2hqeCtHaGh3Z3JkWDgvMlVSRkdCODdxdVY1?=
 =?utf-8?B?U2YvS0crYys1YitTYkxpTWZuSFVCNWI2RU9MN3N5Q0lsenZzRUlaemROMU5X?=
 =?utf-8?B?b1lFS3JBWXE4MU52eExqd00wdFlkaVYyMG9iQzQxNlZaYVAwVGtYQk5EamFq?=
 =?utf-8?B?WVRreU55MHQ3MVUwU0FRd0JpUHlCZVZmTHdjY2VtNW50RW0wSGdKeG9yL0xS?=
 =?utf-8?B?TktKUnQ4Y2ZiRWJLdXNnSFhkaGthMDJLTnNyYi84akNUTyt2eVllMFlxbVcw?=
 =?utf-8?B?NkRHMzVMc3BoWktTbVB3Z1FrakNMSzZDWUNlSlMxRWo0Y3ZETVFkbjdXNHN3?=
 =?utf-8?B?eVZWYWlUM2pzYjFFc3YvVHBDSTZqQ3BCWHJrL3VCdGdRZzVxOWRudnp2ckxJ?=
 =?utf-8?B?cGk3bmszNXJKYTNSOU5OZ2U2MHhjUnVJRTJYUFFwT3lmTnpJT2xBM0tZT3pC?=
 =?utf-8?B?WDhUSWRtUEZZMmJsVDgyQ2NpQVRXT29PN3M0cDEyMGt3WjJnbWgxdjNtQjNG?=
 =?utf-8?B?NCs2Q2tJR1B3YUVtTGhnTUpNUmZnTVRHaXViaGZlRU16UjBmRVU5VDBxR2c3?=
 =?utf-8?B?MmZ1Vmp4bkUvVFppekJvcE51QXQ5b1lNcVRPMDl2d1ZMSjYvc2NqRkZhMWNV?=
 =?utf-8?B?dlVoaDQrZ3hYSkozVi9nbFZqb0xtUjFIcFFqWjlGOStQc1JRV3ZmdUMxT0Fy?=
 =?utf-8?B?OU5xSHdVWUNiL2c3K2YzRDY5bEVFMDM5VWJ5Q01EYlFYSk5jRWxjMDhVZGE2?=
 =?utf-8?B?ckNmMG1wR2xqR2UrWG1ZQTBISnZQOWY3eXVPOG5EL0M4czcvTElhZXRteUE0?=
 =?utf-8?B?ZmZESXZTU2tLQjFwbkRQUFQ5Qk5JbS9EakF3UVRKNHo5OHo3dFBmcyt6eXNR?=
 =?utf-8?B?Yy94Vnp6TDNYMDhsblJuZUgrT0wrall4ZkdOUDN3WVFnR2E3aU42c0dFckp6?=
 =?utf-8?B?U3hKc1JSc1lRUHoremxwcDl0bExaYXE2UXJuK2ExcjgxTXVZZk1uQXJsVEZN?=
 =?utf-8?B?MTNGQS9xS1VKWjNJOHFVSlRZYmNDWExteDg0eitQSVdQeE5NK3YxckFON1FF?=
 =?utf-8?B?cmQ2S0dYYTBkZmV3b2JjcGVxTGk4VWs5cmFkZlFXeHlZZE4yVHE4dENPUFFq?=
 =?utf-8?B?NDJJV0NFcHVSdVd4ZW5zdEcrd1JmR2dXVjU2TVJJakZUQWNVb0c0bnNLcW82?=
 =?utf-8?Q?46hzGKRb+6uX1iFU=3D?=
X-Exchange-RoutingPolicyChecked: apm/KUFul5wJPi0PFg5S1smTgzNlTKMP8rCJT/zFiohtyq0ky3+fyNAyfstyQQcif5/OMgBXgoRbvbXu895r6iabjbh3fu8efztzzUnkAtxWMgwGASXk2H4FZldkVbfO3GdDGv2llJUmJL3bYkA0W0jf33uoghcqp7jhQFDx8b+r+7Q+wEpQnuGWSxjybtpeIPYdnDHo7VUxCKd1uWDzLvLMxnMBcsJv8a5/vrlWIX7zTX3zB6cSG7VwaveWmzuhhRzwCCTea2XVVrkazAKH8Hvl9BNJ5ZTFTxdnS4Mi/9F8rY5cLp8znmV/zhyMZKNsBLp2SIJyspEkzvfnp6zekQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5896e663-f7ee-4bb2-0cf2-08df13f588ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:22:19.7719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4dvwykgwBvlQfOSmN49paG/WraZQgZT+EoM2wLzpFDUK+wut90mgEwwHdg2DwwgM8x/bzF/BdLwaM3SfvnH+4NYuk5lA/+W8xKYwRKnr3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We only support flip queue on LNL+. Don't initialize the flip queue
> stuff on pre-LNL to avoid leaving confusing debug messages in dmesg.

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_flipq.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
> index bf278f60bba7..45788234fc83 100644
> --- a/drivers/gpu/drm/i915/display/intel_flipq.c
> +++ b/drivers/gpu/drm/i915/display/intel_flipq.c
> @@ -130,6 +130,9 @@ void intel_flipq_init(struct intel_display *display)
>   {
>   	struct intel_crtc *crtc;
>   
> +	if (DISPLAY_VER(display) < 20)
> +		return;
> +
>   	intel_dmc_wait_fw_load(display);
>   
>   	for_each_intel_crtc(display, crtc)

