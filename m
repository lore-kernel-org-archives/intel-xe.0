Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D9CC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 22:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E702610E28C;
	Mon,  6 Jul 2026 22:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNOzpt8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802FD10E28C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783378096; x=1814914096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=242pRGtm0UpaRJE27KFimKvtcfPkVezYygLwwZHXAcQ=;
 b=FNOzpt8uc8bYFHRUQeIRfLS+F0hkYewLDMpWhb13mMmt6Ra1MTJuH1a8
 kdb3NQxicxlHxVpVeXRPoffT29QiNdt8yGvXPCFwogpJ0llIuQRM7DCpV
 gvYe6EskN6g9qmONThd7eP+C8+i5aG7AggjyWuR9e6wHv2LyneV1peIw3
 OSl9kgMRagRZSfyp8ewSh1CjV1h19bdXeW3OyHwUFk2px5jEqLIBDV+lS
 2ZYMSgwZDPnBkPs/0VLY861mbdnZosYhYu3UveP+O5AVEIAvC/UINMF0I
 l/erkGdOgd4CSdsyD3AId2dKWmX3ZWmr7rJucw5SyJRjEVzGNGz5U4isO A==;
X-CSE-ConnectionGUID: O5Cy4v4zR3aIKU7zBlKTrw==
X-CSE-MsgGUID: 9/c7bmONQ4GxKa+y+xwq7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95176196"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="95176196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:48:15 -0700
X-CSE-ConnectionGUID: V+2yJyDKTuyXA477/yMqCQ==
X-CSE-MsgGUID: xhRr8Z4cTfGWF7B8SGR3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="251156516"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:48:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 15:48:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 15:48:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 15:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xv4SQ++10eWb5roNqlYxecEvsci6DrjDf1RHcRxBT3IRuCg9/nJCJv66+CrUXXo4PXJWlMyqSZ3cKIrPtSEz72R21IcgK7cP+dfZRiHIgJwNpAeAHSx9jEFVGWZ8WkShJ1wAi+SY94+HM1S16WSUfBwwbdvsjW7t2Em2wdluukSAGueLccippTgZT2VkBydBZtaXq3XmmBsOqP4vGmwmC+YI3NjtYlRa9fKlhVCc+oX0+WMoHCSPb0XX7h5MxlLvqNmRO+6pW0Lj7sdzpUJdkvyoLu5p+8lBCUzbDxD8x2oLggzhiJisX+OTaDLohObea5G3DC72LR0xRv4cIwT6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIWLqx9cgclJG6ovcXaiB2bRECGgOwcRW0F+dQrq29Y=;
 b=emLGCFOBVoXSbqVya2irOw1JNIVSu1q1TL3+i81ODFXZc2YJYEw10mw5hdUxS9xVX1j3yspLsLfdfSq7EL+CS2/pmPpbSrHzZ0DPttob1ozFMJJeunGE5gE6FoCvW97R1BMH8LiXPiA33I6MA3K2nrbh9NvIgW5Srq1h9HGB1oZyYNeiw5au3ty7Viw/KNbED88ZbJ8iP9qBtMRD48M/V4g8EoCebWBpjOgrFoqmMEi9FAcfash9ifOpm2wOq7bU5uUX5l+cg6qIm7DHJKGge5uXZX1sAusNAGsWOT+Lzd6syHMBjoc63SUIc5vfMnz9gF1E9draghMhgQ2bupYHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 22:48:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 22:48:10 +0000
Message-ID: <61173c7f-5937-4772-9c47-aba57b5868e3@intel.com>
Date: Tue, 7 Jul 2026 00:48:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add sysfs for GT/IA bias
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
 <20260706213636.2743937-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260706213636.2743937-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0310.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c8df8d-4ed6-41be-8ec3-08dedbb0a72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oTBht/zDyautQE5GBiFBLDotJ+CZCm/ZMbMA+LOhZNr+S+0RMYZjEL+VAV4UsNgWY32Mh+OACLBANNyFnqMzk64Nc6F7yxTDgOvLtGTbbCH7ftUC5BlxMlyAeYVUdg0XJCKny/fyjt1A45xqH3rhynK2Z3IUz2OIPAIJi5tLFu8FuaveOwfnpBi+rxXVajD7bjo5zHdlOZU8gq1UgH2xVg3tWfQK+FSXu3rpwr8L77lCn734OZmCEOPd4SUuXbjQyd6eZXxVbbJKWGcBMHxlONhyfp07fHIlGR03Jr+Se9RaO7HbCVJa7g2qCh3Wo6IIZdrNjhH/a5KG+t4Z0ugF6udBfmugixpyFgom0afd20uqKtiM0T+kw4KQOtod0hPhZ87paw/1RE1ISBFV1w7w5qNSisxMz3xcI9+RbsMSgLj3tis3avMdvmJuMluUc178PZEmLJSvChzYT1xY9dcJqDc7YO85EaMx8NOjuEChAgCF23m25N6MWwokcWslMIPNaUmSLYYHu00R3rDT6Pp6wiZ/6NLsPtAlKWgW1L5zeEcmS8LMaxywTSMFP1e+v7qZNicAALxxmdRTbrr/DXV3CA1eYWCeB4ugqoFd2eqfDBuQKypXxrvIJuDlV+xg8GdpjUPflkbpMjs7nStIgowwvyRHHkBhxLAxyXqs3QOnbcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTZZd2NHZ2lXSHAzWUNGazFnVTY5U3RUcDRkeDl3MkVDMEtlK25zaFBLRGxF?=
 =?utf-8?B?UE9FYnZRcWlsQ3lwMUMzcEpncTNBWnpVaVp5T0Z1dHIyOGZEcHNUSXg0d3V4?=
 =?utf-8?B?L1ZpRFpIaVQ4WGlKWlpXcHBNVHoxUVI1MDdsdUlBVER1MWd5Q2hnMjQ2N0Ns?=
 =?utf-8?B?cHE3QW1qVG9Tb1lZdWFvYnRYMkVQKzhuUnF3cERuUzNWR1V6bFhNREVHcTRt?=
 =?utf-8?B?TE5pa2N0VU1CVkVUREpyRUJqR0VXamRZVE5neVlaQlUzZEQ2Q2c1T0JkNWdp?=
 =?utf-8?B?K3UwbkNyODlIZzVxa0dZcXU4VHFDN0Z3dXNOejhja25RZjI4a21veEN4L2RR?=
 =?utf-8?B?Mk1OaHJmY3hPUlFqdmZjSzE3cFlPZGlab1FpVjRtZjNvUnVBdEhqWXFMVVVj?=
 =?utf-8?B?OEdVK3k5cUpsSGtEcGdoanpXVGRaSlRXVFBuMFFzSExvb1lLQ1FIV2dzWWVT?=
 =?utf-8?B?VlVhdldSUUJCbTh6dm9HQkJoUDRDS0p2THlxZ2FDck9hSlkwd1RjMnQzU2th?=
 =?utf-8?B?aUROTzdrM0VRajZsUS9hSld5QzFpTEU2NFV3bXFuUHA5Sjd5RlpBc3FqUGgw?=
 =?utf-8?B?NjhOTDUwNWZvQURXaHp3TWpkRjRuMVl4dE1VTVZqZ0hpMWxLbWorQWJrdU1W?=
 =?utf-8?B?WDRlTlBNMEVLUTA4SVVOeTJWYjNyeXgrOFd6ZUJFd1RMSzM0aEQrOTVRdUZk?=
 =?utf-8?B?L2IvdVZsZHlnVStVVFI5dGV3Q2xZSjhLWWM0OXZxOXU2M2RXSXdLbk54QnJH?=
 =?utf-8?B?ZGdhcnF0VnhJUFpuN1JRTmczRTVRWTRwK0xKVUhtb3VKNVFlQXkzUWNLU2RM?=
 =?utf-8?B?YkNaNnYwZEswYnlMMEZUTU5MRnBidVdZWFp1SzNEcE9jc3hMZWZncWJBK0x0?=
 =?utf-8?B?Mm15bkM3cWJ3SkFyNS9jbHNPV243SktvK2RkZWZMbm9jbVRhZC9LdWxEQzg2?=
 =?utf-8?B?RXh2elFzb3dBbWFwcys1VGpZU1BkVU5UWWhzNE1FK0REZjk1dHpjd2gvdkNH?=
 =?utf-8?B?Q0Y0TnZDZ0pjUWZEa1VQVEhrbDdadW1ROTdPM3VabEkxUHBhcUhwbVV6Rlkz?=
 =?utf-8?B?QTRNVGJtMmRWRW5sQk1KZVF5TVJyYUFhdWhOUlZlL285MERDLzNkQVR6Smlv?=
 =?utf-8?B?ZHhIQXRndWRBZFhWbXQ3U2sycUhoWXRnczZRRURjVk5QRE44ak5ONWtvMEZX?=
 =?utf-8?B?OEQxTXpSanpyOU5sQkFXd2hTcWRwbzhVa25iall6VmdoSXFCNEtXY05lc1pF?=
 =?utf-8?B?Q2tjKzNaM0hDNFB2c1JiY09Fa0luMmZYUk9XMHVobFR5K0FNRmxFUXJVQlFL?=
 =?utf-8?B?aStrNjBKRmVCamd2dVFhS0loM1VPcFJGbmZVbmdjU0hvZU9BMDVia25xUWV4?=
 =?utf-8?B?V1crN2VpaGNVMGhmaG83RTEvNk13RnNoSjIzVGpXbGt2UWhFMG5ycUk4Ylor?=
 =?utf-8?B?RnBJZkxUTS9EY1BObHZIaFVTaW1veUJpc1RCRzdzTGJqVG5wQXF2dHhMa0ht?=
 =?utf-8?B?ZmF0dkxMaXloQ1hzbFpjb2dITUlQL244ZjFldnVoS1I5SzI1NVhDWUcycUtQ?=
 =?utf-8?B?Wk9lN3lWV1RnU0xNemIzZkRkbmU4NW9qUmUvOU9lRWgzVWxiM2VrTnRMbmY3?=
 =?utf-8?B?M1JteHlabkxvdDZoYk4xTERtSkppMVJWYWNicHNZdU0vNkt2ejlaWlo0SzdF?=
 =?utf-8?B?cm1TcGQwWVZZQkhOOHdRS2JnYUJSNHl5Z2JyS05RWERIUWhlMUtaM1lJSXZt?=
 =?utf-8?B?OFpNYkJoM1VLZERyVGt5MWtEOFpad05rZjFBMEhWQlNnTnpwT2thdnJXZ3kv?=
 =?utf-8?B?VkxIV2tOcGVkZHVzTngvaHQ4eWxTa29LWmpUM0J0RlQyMFVDcE8rUUY0eW40?=
 =?utf-8?B?TkZYb2Ivb2ZDcTJZcHVIMWV1MWU3Q1hjTmNFSUF0c1RuNnhGYktqQ0RySWlr?=
 =?utf-8?B?eEhRTTVQNWx0aG1xRUl3THlWOGN6OXBQR0FYR3R6ZmhiQ0ZuQ3hGeHo5ZVlR?=
 =?utf-8?B?bGlxbXlLNGVmWUZsMkViUVl3dUNybEMvYWxuOEJ3K21tWU43V1BROWRON1F1?=
 =?utf-8?B?NkdDRW54aUVVamIvVXVtS2F4aXpVREg5QmRGRm1ibGVQMHdnTU1BanB5YUJz?=
 =?utf-8?B?a0tVcVVmMzM3SitGR3RyUnZGbVBKTHNHLzBoQlBDKzFoMTVNd1I4U2tOaTJy?=
 =?utf-8?B?SThnL1FaOFFJUXVPS21rYUpyUEFGQTRhYTV0bkcwZmNERWVaeUdiUlRLdFBi?=
 =?utf-8?B?U3dXclNCVFBCeGtoaExVQk5kMHk5WEN4MzdSemZrN3FzbERYNytLc3RSMk8w?=
 =?utf-8?B?Y1R0YS9Nenh6bENlVk92K09kMkZjMjNCYkFrMHgrRnlzMGZwMUpBVW1qcG1Y?=
 =?utf-8?Q?j1fn6NnD4JGZ+xcw=3D?=
X-Exchange-RoutingPolicyChecked: fg6jOCU985S/ia+S9heZlC1/IsGSQZvZZrNZ6G1dy1Ow1e128wwqcrViK+A7R6OOJ8U6xt17VC0vBxmtEZcaKRRFXBPlqt+q7G8qdNVEzyXBCqY30+IJZXSBKzQF9C9ppBmRk3Bn/G4AsEgQcXX1eW+eG41TKDcGcMaOdR8f50nGeOfIgYHnT69b34vGXqxV8sPExX7OTHR2D0nW7ZSvHotM1kzsbwLMDi39Sh3oriHwpziiJRXwITWpBegXlQvyXrExEDYmgOzwHluodeFQaQHJ4EtmZEtVoZ6O5jtLt7VLqoC3meM8J5ZT84B8iCpgawpsMuodRR3e8VVD4MIAYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c8df8d-4ed6-41be-8ec3-08dedbb0a72f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 22:48:10.0842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeWAp9752JVNOAfkccMrLcFSCw0pzDLQcijkED1ZmAVcnIUBql1gUrPUCmLz9aqbB8yVlhjrtju/YzZG27dkKDc6y+d497frsE/h7M5oaWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
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



On 7/6/2026 11:36 PM, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
> 
> $ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
> GT Bias: 1.000
> IA Bias: 0.500

"Attributes should be ASCII text files, preferably with only one value per file"

see https://docs.kernel.org/6.10/filesystems/sysfs.html#attributes

> 
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it.
> 
> v2: Decode the bias values (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_freq.c      | 71 ++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..41c5c5f20964 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,8 @@
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
>  
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +
>  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>  /* Common performance limit reason bits - available on all platforms */
>  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index a40dd074106f..08c0be8defd0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -11,10 +11,13 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> +#include <regs/xe_gt_regs.h>

use regular "" include

> +#include "xe_gt.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_pc.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  
>  /**
> @@ -242,6 +245,61 @@ static ssize_t power_profile_store(struct kobject *kobj,
>  }
>  static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>  
> +static ssize_t gt_ia_bias_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
> +			       char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	u32 val;
> +	u32 ia_frac, gt_frac;
> +	u16 ia_raw, gt_raw;
> +	u16 ia_frac_bits, gt_frac_bits;
> +	u16 ia_int, gt_int;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	ia_raw = val & 0xFFFF;
> +	gt_raw = (val >> 16) & 0xFFFF;

use REG_FIELD_GET instead

> +
> +	/* Uppermost bit is integer value */
> +	ia_int = ia_raw >> 15;
> +	gt_int = gt_raw >> 15;
> +
> +	/* Rest are fraction bits */
> +	ia_frac_bits = ia_raw & 0x7FFF;
> +	gt_frac_bits = gt_raw & 0x7FFF;

maybe it is worth to define some Q1.15 helpers?

> +
> +	/* Up to 3 decimal places */
> +	ia_frac = ((uint64_t)(ia_frac_bits * 1000)) / 0x8000;
> +	gt_frac = ((uint64_t)(gt_frac_bits * 1000)) / 0x8000;
> +
> +	return sysfs_emit(buf, "GT Bias: %u.%03u\nIA Bias: %u.%03u\n",
> +			  gt_int, gt_frac, ia_int, ia_frac);
> +}
> +
> +static ssize_t gt_ia_bias_store(struct kobject *kobj,
> +				struct kobj_attribute *attr,
> +				const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &val);

hmm, shouldn't we accept decoded values as we show them?
now it's inconsistent and admin must guess how to encode it properly

> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
> +
>  static const struct attribute *freq_attrs[] = {
>  	&attr_act_freq.attr,
>  	&attr_cur_freq.attr,
> @@ -258,8 +316,13 @@ static const struct attribute *freq_attrs[] = {
>  static void freq_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>  
>  	sysfs_remove_files(kobj, freq_attrs);
> +
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
> +		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
>  	kobject_put(kobj);
>  }
>  
> @@ -289,6 +352,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  		return err;
>  	}
>  
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
> +		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
> +		if (err) {
> +			kobject_put(gt->freq);
> +			return err;
> +		}
> +	}
> +
>  	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>  	if (err)
>  		return err;

