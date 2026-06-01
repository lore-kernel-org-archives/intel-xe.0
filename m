Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B4CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 11:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B4C113214;
	Mon,  1 Jun 2026 11:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbtzLFLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7F7113214
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780313239; x=1811849239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bJzN2DaXNKAb56qeKybcOAuS4MW4FgjsMqL9Qk5/0NU=;
 b=GbtzLFLXlEErm9V0NCeeYI88Rt5YHIk1IuemadamKlWY6AbbsAZJCFMh
 xlND8PepnTA3lgI9cYuouJoeU0cWx0YTppDE43Dc5+m4VFfUvadcgaN2X
 N0UiW1OA7dfm2B6aV6REGgP1POe4kZPbGeuqxygl6ndMGr4/yk81oBwtZ
 jtAc3SZinHpKk9MCeuUqeGiUxETnyeAxfJ/L9XhMH4a+uZYFsOUW6InVI
 3kGltndmIKKGuQz9+/zPnrqRxXEdL2aWXq3bTDzKNMhPUG7AjnXTmx/Sg
 JdxZmWHoTG9fxgo5Wz7ZgCvhgQC/LBDwe0GWH//ioHMRch4YO/ubIqJJR Q==;
X-CSE-ConnectionGUID: dKMHGC90TMm/R4piGLUo4A==
X-CSE-MsgGUID: qSBy+R6lQjSA1l1VO7qPoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80799974"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80799974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 04:27:19 -0700
X-CSE-ConnectionGUID: Sq4kI4l3Q3aULIf6qGb4hg==
X-CSE-MsgGUID: u2PdugxHQHidSWl0PHkQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="247515027"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 04:27:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 04:27:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 04:27:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 04:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmmv3iLJ30EoKwK9V28RlJWJNqxqPQymWM38SQNrnkqbf1NecSo7exZdygAXvJL7QdO3OO75HQRUyq02LDLx7MeDZevvsAVh+nqAv5CdtmC2eXz1jwXTj8sRlWDj9IGZk/bIrzN8MHqn6lxYVJMc0kP0B8+e/EObKd2Oqc6W4vvdF8YoP1+UTkmbDb66C4xkAdBv9pF9y/7A+2uzun3h0fT0r1PLmVMKAoyK8d04iom9hA3b4aI2sr2wC9KBLCCuUyr3xO7v8q+CodmfyA5nHC5gEaX0qkvgiFN/RBfpuI+2/B5q44k5GSguUHpUvPDSPcMb0XsAtepPoW/qvBUo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX0ZPYY6HQjARUYZ5W2RBeF4PHu7ylCpPcYSpEmgLXU=;
 b=W6MZx857Uv0XIroNwEq1SWe4qcD30rVCGLtypMQDFCiWIxChnqK39PTnA0Pbr6yNNpfmVvy+KX85CVY/OOgpOM8zJOvx1+wz1hjvpB4ZSBNJYu7w9tOLU5fS0/PVE/jM6kcBDEfSEyyihScN3FRxO9yiC6EG7gRLjDGRyjkGA03TzGZGva3tTxlD1T8mMNZXEIu9VRXwSwf8aKpC8nEyBq4TfV2RCSiuHLua/k/kbMVuz+YNoOqHr9Eesqw36R3U2VZVwq69XuPtqr6+PXYAILrf/QAikAPlL1boxHpHS8Fo5OUyTMu6Lmk6Msp3hPFUHRwiwUHk01wuSHRShuWpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 11:27:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 11:27:16 +0000
Message-ID: <3857c423-2ac1-4822-ab49-cd96ae8a41f7@intel.com>
Date: Mon, 1 Jun 2026 13:27:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm/xe: Move xe drm_ras initialization
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Anoop Vijay
 <anoop.c.vijay@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20260601084146.3808639-8-riana.tauro@intel.com>
 <20260601084146.3808639-13-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260601084146.3808639-13-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0221.eurprd08.prod.outlook.com
 (2603:10a6:802:15::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: fad2c21f-b35a-4e3b-5b5b-08debfd0bbc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|4143699003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: I17Ef7710DNeZTvWwxnDphCKfSY5IHBx45OGP9ugYTHLF3tYstkFQMWfp8EtHtv1xZRkMPA0975AfthTWE9xjJ4HEilAxjgGtpVVdHkayzvAP0PqoW6mA0lLrpUNZYkymB7571U56qkYbcJqffqFz2ZuI8sUsqt0n+IKj4RXpV56TUvyH40NRX9usYiQLrnrFRp57/5odCYUmbP8n8mKYS2yct2mfh9Qmc82YTAjFYOHwRAwWx73UUhtIch0pEEsqNqnLVDrp0MBLwbEAMbP+t0Rqd1KYAaejg4wqM4saF06rmrnDA8ySoqCrHdzl2nuIJBQYFoWcNoAAxfU213u2E05zgwzrbt+neIcjEq3iFjQvDa44IIoWkhIAgrDo9cUCIDyJLTdP0nJW2/7AU63vXfWHpYSKTWqBCUrriM69LCSJwji2oI1+ZAbna+0urISMf19X9FPG5g+oAMruCb2jom6h6Zmt6fQYY+c51R8JHblWLCts1ec/W3MBngwU81FdP/j37u+g6mTqa55QHv58qeMNjtDtPIplc+hq5FlkLical9bfrqmSNPSDRudxOwE7+SjY3g61M6LPoDWWWC/hNZWi002WpgXqZ/yGdJ7M2bcKP+SAf2jdBAEKZTY+zvuKGc/TfQJUvzZuMjRw6HIzXnU26t+CJLhVv7uUog5HNXWCPnTzfGn4qFVsjQmFMs+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1ia2R0N1lEdkxYbVhNWldXb1ZoYXFBTDh3ampIN010bngxSEFsRkcybHJL?=
 =?utf-8?B?TFAvTGZUL1hTMnVIeDkxaEVTMmcwbk1Qckk0aHNaUU5Bc2RLNkxBL2JYd3RM?=
 =?utf-8?B?ZWJIZW4xY3BwUlJzUnMyaTVjTVJ5b3JNRXN0UWdRd3RnZUtsU21GSlhSYms2?=
 =?utf-8?B?RVk1ejBBRmE4d0Q0eVBOMy80YlVBZk53YUNLL1A0ZWEwcCt2ZGJ6blpHc2NX?=
 =?utf-8?B?QmUwWWUwUkpka0h0YUpQeU5OV3ByMWFNVFQydmRNRFRHVXJBSFBFQlNzYllv?=
 =?utf-8?B?eEJsV05hQ2J0enhqb3JIN3pZVFp5dVU3amJFNnY1RlZnYk5OSU5NSkE0b1VN?=
 =?utf-8?B?MERxbEdRUC9aQ0lrR3p2UWpwVlFRWjREVzYrY1RsbmcweDZ5bnRSWEdwYUdL?=
 =?utf-8?B?UFFNN0hNZ3pYdXp6bzdXOTlhaE1vaVdaODgzckZ5V0lEMXA4V2xTOTgwdHF5?=
 =?utf-8?B?ajhIWndxRHZCcVlzaFpqYURmQ2JSODIycVJ2VThXMTF6U2VCR3llR1lFNXVz?=
 =?utf-8?B?a3ZmV3llSTFjT3IyeERvbnFPZUVGZDdqbHd0dHRoRlNiWjdROHN2VGhEMlBG?=
 =?utf-8?B?RzBaNlozb2EzMzlkengwRlQ0RmJsZkxwaVBRTVppcEU3ajFmcll1bUxlY1RX?=
 =?utf-8?B?KytDYUVYOGJEeEdZeTJGWHk4UmhvTlNpSVZYenFuMm1RWE9Ia2YvdkYvdnNV?=
 =?utf-8?B?cDhqYWlHc2JxbVllU3pKeTE4dlF4NDFoVnRNdFo0bm9aYzFFQkRwbFlUeW9B?=
 =?utf-8?B?RkM2TzJUcklKK1ZuMHpIUzZycDAvM1g3QmFicmtienA0WTFEWlhJZk9oQ3pr?=
 =?utf-8?B?RmV4dHJoQjdIQTMwbFRlY2tXOHYyZm5kcXFYQ2plbis2Yit1a3E5MStKc1VX?=
 =?utf-8?B?bEhlS3dVNU5LTVRGN2Rhd3N0TkE1eU5McDZrSDh1ZzJLa3JGVEN5WStPeDY2?=
 =?utf-8?B?MVk3NkczNytDZElFcWFNSzlwUUdpQStFQzdRSXVBc3NNYVZldklpZHV2L2dE?=
 =?utf-8?B?cDQ4RUx4ZUVQeG9ObXFMY1hpRU5TZG54N2habVpsVHFVTmQwbHVpMnJuRkdE?=
 =?utf-8?B?ODFEcm5YNUwyZHR0Y0FobDNNa0hxSGUzV2FSVTFRa0hqLzgvbkhoUUM5TWVz?=
 =?utf-8?B?c2NhUE93LzQyNjVIcEtqSk1QZGcxNWVPMUhoZyszY0ZoN0tLOWg3ZnJXaUdy?=
 =?utf-8?B?bDUwSTdGVmNvdlBLTkV2OC9BQi9WcmlQa0lSeDVLTXozZXlUVjh4bFBNc1JL?=
 =?utf-8?B?MkJ3QVNzYVpYZklUMklqbkZTS0s0cURDbFBMVUFYeHRUMkpFR01vYzlQV3My?=
 =?utf-8?B?ZlduSkdOdUlRQ3NaRHA2N25UUTNrMFhZZ0FoaTRGZm9GSkZCTnM0MWJJNjYz?=
 =?utf-8?B?aThkTzdOd1hMOTllQjYydEVCYVJJYzNRSVRCZS9PbXQ5eSsza1c0UGxjUTl6?=
 =?utf-8?B?TWoxMXRBdjk1cEhISWkrM1BPREpkcXN0WVM1V2FmbTAvVjYyUG1lL3BMbjRT?=
 =?utf-8?B?eFFBVjhyRS9sS0oySmtSd0xJKzdUNzYwQTFZWjdkVFdRcDd1ZjlCd0hvQTkr?=
 =?utf-8?B?cUExSVJsN1FEeTVERkkrQ0NDbzBYS3lad3d1M3RPM3FaSXp2WkxRRTE5Z0xw?=
 =?utf-8?B?Tm5ZbVp4Z2pXRzZtZWliUCttTG9GVEpHN2Yyb2k5MzVQcXdaL2luTFpOa0d5?=
 =?utf-8?B?Wmo2V29SbzBRVmFFV2hHbjhTVU5NTkJPeHBDSDF4SE04bzBqNjMwaWdxbHo3?=
 =?utf-8?B?K3JkSWpJQ1haNEh3OEpJVTNnYWxaL2lyaExTc1B6Yk1FbFdHUG5KMWVnc0du?=
 =?utf-8?B?Z0VLc0dOcHNpUnVBVTk4ZUVNWC9YRnF0aFFhMGJUQk04T1Vha1pRc3lVOXlp?=
 =?utf-8?B?ZlNsQUhvK3NPZkRBcGtkNFhxZUlhQng2Ri93ZjJLM3ZFaWdBL09RL2puWVdY?=
 =?utf-8?B?V2VtZ1RTNXJPTlJmNTFPOGFZblIxQTZ2d0tIRUhkQjg3YTBWZkgyZ3hKWFho?=
 =?utf-8?B?WXJUUnFFbWNOUFpWWklRTVZNdGVUM2RmTDAxSVRoM3puUnFrc3hVRFlMd05v?=
 =?utf-8?B?MzJlSVZuM0xTWW05ZytaNU5HNUJLSTR1MVdnQTlqbEYwVXBDTjR4dFNHTmh0?=
 =?utf-8?B?RTVrTnlPT1BRb3d6SmYreXJJVThydVBvNjcxM1FMdjRZcWJUS1Jsck9PeGN1?=
 =?utf-8?B?MTRNQkx0RVhQdlVYaDI1MUdDT2t1akd4Qk51cVZiaTQzemhmd082ZzQ1ajdR?=
 =?utf-8?B?enA3VWVWR3JIMThhOHM1THQ1TU95aFhDeC94Z1hreG5qTHZmM3pKVDhpTUlj?=
 =?utf-8?B?S1p6WEN1ZG5NNTl5eXloQXpzS09SY3NyV3N2WkNHWlIrL2pVU1Y5SVdvL1Nu?=
 =?utf-8?Q?CgKO/d2rZr0EQFm8=3D?=
X-Exchange-RoutingPolicyChecked: XI2f+7oxLGg+/ElllhcBoQVi+X9d7a7lVcqY7YJtB74H0OBt/UzhHk9RA+pzil3QvcZKzPJxFn3TVWGM+mJPux5CURj2jLh1gbkFMB0Y3FjE/tnev6xH+ti10GPM8/iX0R8ICy7pZjMcLOyK6vWUDx22zar+yavvVIQoQSOpXRSbzlzcuSmInknzIsEnZKV14NG5NpPmJa3vIhjn/j7kdsOU7GlW7BOFeX9XrL7kM9VROC8eyz+DzndBDZFdblthucLPr47qHBjvFRx50/Qf/WA1w6Ku9qq4SnQAMOzAe0/0KT7egiB4iTKpvbASJs7hVjttJtPLmDWewefzczybXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fad2c21f-b35a-4e3b-5b5b-08debfd0bbc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:27:16.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHyMje/71Xh92ePLfgTzM76U0VVYv63Lc6HcX4YcSBTnTJ51MrZDx7c1DsVfyQuJ5CQDVtbnP2AA8FQoO63chmxaKVji0XfMasPSavY8o1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
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



On 6/1/2026 10:41 AM, Riana Tauro wrote:
> Move xe drm_ras registration to RAS initialization flow and keep
> hardware error initialization for processing errors reported
> via irq.
> 
> Move soc remapper and system controller initialization
> up in xe_device_probe as RAS initialization depends on both.
> 
> Cc: Anoop Vijay <anoop.c.vijay@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: remove unnecessary log (Raag)
> ---
>  drivers/gpu/drm/xe/xe_device.c   | 19 +++++++++++--------
>  drivers/gpu/drm/xe/xe_hw_error.c | 13 -------------
>  drivers/gpu/drm/xe/xe_ras.c      | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h      |  1 +
>  4 files changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 69498aef3cd9..6e1635e22df4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -988,6 +989,16 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_ras_init(xe);
> +
>  	/*
>  	 * Now that GT is initialized (TTM in particular),
>  	 * we can try to init display, and inherit the initial fb.
> @@ -1028,10 +1039,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_nvm_init(xe);
>  
> -	err = xe_soc_remapper_init(xe);
> -	if (err)
> -		return err;
> -
>  	err = xe_heci_gsc_init(xe);
>  	if (err)
>  		return err;
> @@ -1070,10 +1077,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> -	err = xe_sysctrl_init(xe);
> -	if (err)
> -		goto err_unregister_display;
> -
>  	err = xe_device_sysfs_init(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5135e8e4093f..e0ae6fee2c0e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -516,14 +516,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  	}
>  }
>  
> -static int hw_error_info_init(struct xe_device *xe)
> -{
> -	if (xe->info.platform != XE_PVC)
> -		return 0;
> -
> -	return xe_drm_ras_init(xe);

here

> -}
> -
>  /*
>   * Process hardware errors during boot
>   */
> @@ -550,16 +542,11 @@ static void process_hw_errors(struct xe_device *xe)
>  void xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> -	int ret;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> -	ret = hw_error_info_init(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));

and here, we do care about the error

> -
>  	process_hw_errors(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a7dde9a68a8..6ee1283d68a6 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_device.h"
> +#include "xe_drm_ras.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> @@ -268,3 +269,17 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Register drm_ras nodes
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	xe_drm_ras_init(xe);

but here, we don't, is it really ok to ignore such errors?

> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 637956a33a19..c19c3602db80 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -15,5 +15,6 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response);
>  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
>  int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
> +void xe_ras_init(struct xe_device *xe);
>  
>  #endif

