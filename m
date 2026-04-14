Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C27F34C51
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 04:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86610E09C;
	Tue, 14 Apr 2026 04:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdaBbOJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ACF10E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 04:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776141024; x=1807677024;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N8D7t/za/+OxwNEHP5BA5X65GW74EcpZqxih7l5HSAE=;
 b=FdaBbOJS0lPCWEZWmBN1K+X5i9Jr/uvSIAeqqsi3h0ha2ESBfuHKduqI
 jGe2pA6m8tDPiiyDEwJzEPGKPM8oDZHaiFdiQNdOfvq/VDP3ZXKKzf0fk
 RmD4C97zyrw620fmsL7O3Cz4iX+on9diHIz0ZNKOq8sr6HWLlQQHD80i5
 09kjlOzooELhnSBGnM7H2eHm2zJCixB62iuHmTArsn4zRK+STeCv6PyNP
 ADpZe/AiI3xTBpanrqH6881oIR091a0u/Hldl87DrS0UIGTiYSOBTEiIj
 8GVnxu90VM9h1CIbkmL5844kPNhjoLnyWm0n0xDluEhsstcHPZb3nK+68 w==;
X-CSE-ConnectionGUID: VU/5NbCZTpmyagUxey9Cnw==
X-CSE-MsgGUID: 9pos+0FxRXiU8bpQNjF7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76968807"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="76968807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:30:23 -0700
X-CSE-ConnectionGUID: O4IcP2MiQLebpsl1kvrsPA==
X-CSE-MsgGUID: ghAjjsTkTlWNDcKLjzYNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="226807966"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:30:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:30:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 21:30:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX67YtcCvfggXUQHDDicF8taL5OT4L1Eu47g5X/7ZEA3nDTkkKJTkX5tJl9VT0EXNAI7aEkDlHhuKcZglvv5qjocOMs/hkxdVXxW8vn1zwTbN69UWG+whOdqSQUxJR6kMrHPKhcyhH9ZdYrKJbEVHA0wxpQ8eqP9GMcyW/7e1duBvYTbsLclVMeoEf0OfwM7wNYFmQ/RdHb+z4UJtZIXN71KV25dQSeZXmD7zYQ9F58itP+/LwIaodsHeLXHY0mnCt+kk7QOOVoshiqtADahCfZNoM0/nyynQ6NcA03/37wEesoXTuRhkLarlPBsJ+B1ALaqGCbzKWUBR0dydbjikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6yiSJ23SgyXgmI7S3tXrY92CAALxs4pwMFVqTRTjbU=;
 b=F+GmzQXMYEHyaoHCqipRQURm1Fyar1mlxJXic321R2yYfmcReDJdu/BKetHWCTorm1uoV1eK9xMgREm/zCjNAcef4DdZOOv/qpSWJho+dOZx/g5reTvsGaZQNZl/YSqGdnLycmTRS9UZG9lH7RUSTQiLClEaw4dkSh2fy8j4hk8B9s/KIsk2n6Bv/rU5BnuHPfCvLBCq6DhuqN8cgPTprX3vI/fSuNqTFTgkWbGg28AjYhh3Cp0sBWsGAYoUR13IN9MMylAvC/72bJ+YFbaDmt2xNv/ElcEfpCLeU0UyXfdb8m9HHVvnF5cpQj2bNjG3uOG86hDBwbSgv86BkHHdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 04:30:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 04:30:20 +0000
Message-ID: <cbcfe35d-6796-410d-921d-0d4d9b3564a0@intel.com>
Date: Tue, 14 Apr 2026 10:00:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
 <adn-n0TPOeXAG8IU@black.igk.intel.com>
 <DM4PR11MB5456648D71E87DC8D522DFE4EA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DM4PR11MB5456648D71E87DC8D522DFE4EA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b2825b-4fcb-4484-b11e-08de99de8952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: YfWfZZZl9iwOLja/97FXnnqX2F8+FCNuWxJ1dB+bzlQVZSOfa/8C9GT7TJOT2K6MNdBnXf2eeXKAvyTuAPR14MdeAjtgczHmbE5/MR2Iv5BG0fsh+btr/mWwsVr4gcnalDfOgsYq9dH7DyUTiPIwVcDypu3JFuq4Gifcsa71y4lKUmHA/tuF6RJJIZZ01RnFyETXwBFyG/iFcog/sXy/e9HVMi48rFLd7nsGvr/uOvYcP8TeJES/oSpatXgF/hU7MBzU1vWSm/ByX3rBLqnkNinLHx4OZGUasfhmkLPHXPf+O9ErIF55kMYAypQUUQkBpSfS1U8gkOjf72EyzteoBDVUuiCydMXXINpsjzeCmQp4hDU2cs0KeeK/zSltdcJwFyDLPpEmSmKXqRfC0dKdrImMeNRPO5HV3f3nqlUskvRX7n+KVf8hlQ0yo9q4f9yNyyw4Ha11WQQyqWI3HRRxel94/oC3VyyUqYJ+pockUxhhofxjMwD6x2K9V8VJj01xzsZqq5YDXjJtLvmCfKgK+QIegcRoHrKU3jSjK3uDAkvwUD/jIVbkf7aC/cjiTx4oHCkKzsNR4p+AzxnRUr9oD75zqsaU/nHrJVTTr/DmutQ2DZDhT9jUz/XJWYQ34ndgwU81PszAuM4x3eAsa7Z1d9mBj7BwWy6fQUOxkJHummwIP3eTuDg+wHW6hfo5L37HQvwaQb/AAHuD/NRe5o/DaiXXtvMT4pskEPdUwpf7/uY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFZNMkV1VGJjdlhpVTFHWjhtKzM1TTBrMDJvem1SRzNlcm5WSHpjY0NvK052?=
 =?utf-8?B?SG8vU1RuZ0NXL2hTZlhuVS92MGdSTWhMTnZmZ2k4MmxwSHBUZWhkZ2hySXpD?=
 =?utf-8?B?VUE1RmE4T1FyVThRYWFHbEJkQlREMWRDRk5ycEZGeWZZaXVESFNLZW12MWZT?=
 =?utf-8?B?QzN3U0IzYTFld3RHelF3OWlVMlpzY2lHQXRML1krQzdkSFd0ZnZ3UTlQK3hJ?=
 =?utf-8?B?Z3RRc2MwRUswTHpQaGszMjEwOUZDd3R3UWNFMXhFcTQyNUJ0REg2NFR6TFN5?=
 =?utf-8?B?L1BEbUFtUjlKOUwzYzJ0Qk5aYVFUSjJWVXIzdDJObm8vckp4MEJsTGNGYVVS?=
 =?utf-8?B?Y0lUb01udlZ0R3l6L2NiRk83cGZOSCt2R05mcDhxSW1KM0J5bUwzM0Y4MGhj?=
 =?utf-8?B?Zmp5cnpWRExLLytmbHZxMElxa1NpT2tWWkxlaVBtUjI0NnhtRDRzbVdneGtk?=
 =?utf-8?B?aU1aeCt0OUlob3RBZlRxQytjWUdSbDU3Q2ZxR0MvTDR1MXZCQXdBcGkxNzdI?=
 =?utf-8?B?N2pHMGkvbFN1QmJPajdrOHpmdy93SDBHODhoZXdKeG1RT1g3Zk5rdDcyZXhK?=
 =?utf-8?B?ZmJBUFlSL2F2cUxocnJVMjlIMllpaE9kTzQ5QnBFMlRSRElrWWl4Z1VuaFdS?=
 =?utf-8?B?aVJVeGRKTXk0NjJoVHpJd2dURGFrVnNTRlZ4SnVnVCtJU0o4VTlDaFpPVHNs?=
 =?utf-8?B?ZXdxVFB5bHplK1hKSWJXV2xqcXc1TkFaZlo4T2p0b0wyeFgydy9KOUlnR3Zo?=
 =?utf-8?B?TVNycWp2VXRKeW5aRnNSYWpYR2pPSjFoc3V0b2ZBNVhlWnRmRG9jeUI0TVhp?=
 =?utf-8?B?WFEreUNvMXVpTnQvUEYvaVArR041QkFab1JJSUlIMmJIeGNYWHlCK0lSYytt?=
 =?utf-8?B?a09BMDd2bEExYVpFemF3bitMWVYzTnVqczNKb3BpODFZSVhkdGtXbXBQd0Jk?=
 =?utf-8?B?dXN2TjZsUHdUNGhRQVQ0eW1qeXZIQW5NMEh3T084MmtmMmJsMTh5MVZ3VGVa?=
 =?utf-8?B?ZzF6dDZCaEl3UGN0aG9hTXk0cE1zUDBNUlhYbDNQNWZJZ2w3U0pPVlZXcGFs?=
 =?utf-8?B?UlJXZ0M1dFkwNmpCcWYvY1RPUTV4UEFGYjNMSzRYNzZkbmZaNkFGdGRLQ242?=
 =?utf-8?B?SEVBM2EwYkFQZEs2Z3Qyc01ERlRud01yWWIyVVR6SVl3UUF6RVJEcHE4aDlr?=
 =?utf-8?B?UVA5dm1PRTRvRE5Yb2J0MGljQnQ1TElBRHFnQlpaTjJDbHJ1Z3Y1b3h3Zzds?=
 =?utf-8?B?aUc1QzJsYlN6NU9VRDBuMHZjVUdGenlJT2R3SDdTY05Rald4dXNnTzIvYUhG?=
 =?utf-8?B?V2lnUmJDbTFMQWtkWHNrWXBrcSthay9uM3Qwa1BWSHZmcXVNUU5uTHdJelhr?=
 =?utf-8?B?L2hMTytBWVVOOHEvTC8yaU5zclJQa1pJd1BjenFCeGltSEJzd3M0WVgwdzFs?=
 =?utf-8?B?RWNuZHhnN1VGYmJiMDJDQkV6bXpZTlVsRHM3d3dlQWRPT2oxekNJUjRqWUlQ?=
 =?utf-8?B?bGJjOHZrdENCUWJXdW94M1JZUkJ1Z2dTdlIvcmQvYnVnenhseTAvTFVlMjE3?=
 =?utf-8?B?cSt6YWN4aXMrVndvb25CRklGN3pJSlZVeFlmVzFSYm5ncEFSamxjVk5DMWtN?=
 =?utf-8?B?c0ppdmJZQzRWZFdKaStjYlZaZ2JXcU5KYVQrckRJa21iS0dTS3MyenN5QjRD?=
 =?utf-8?B?VElrYXdQOVFYSTZGMk1lbXlrWXgrRWZqQVF6TTJzdDQvdUJiVjF6T3BVMWRZ?=
 =?utf-8?B?ZFV4SGFxMjUwOWpsUDM1Z1ZRRldHaVNONkF1aTNZWWZqSC9yTkxWRDVNa1hn?=
 =?utf-8?B?REoxWXpVRFRPbys3MUh0OTZlaUlkSEdCVFRncEszN0pxUzRXdEQwMm5IZk1j?=
 =?utf-8?B?S09GL2w4Z3I4S1gyaHFncDFUaHU2d2dabkRoZkxHajIwL2dzZktaekNMSUNO?=
 =?utf-8?B?MmlaeHNoUUJzM0U2VDZtRG5GaHp0anhISWwzWW5mbUlpc0tKcEVPV28rRDg2?=
 =?utf-8?B?Q0hyRGFrUXFYSkFGTXg4aGw1enF0U2xqRVVhUVN2T1NnbFc0ak5kL0FpK1Vt?=
 =?utf-8?B?YzZVT1JPZUNSVVQ3UVUwcGFjcjJlSFJXSnBmN2dlMk5mWStsYWxrYVJTa3N3?=
 =?utf-8?B?RnIvQkhaODN5ZVJMZm5QbzNhTVZzT2NyNDcrSndiS1BGSjRsczN4b1V1eU94?=
 =?utf-8?B?M0FqRnNrUnZXUWNKRHVlSjBSWUoyL01XYXl5NjN2VTEwT2Nrd1ZLWC9WQ296?=
 =?utf-8?B?L2xST0JMWmpINGt1d29odHJ2SmJFRytkSG50S0UwdTNHUkFzZUJYK3lZekp2?=
 =?utf-8?B?ZWJIa0dzVktTZUY1R3NWVEhHcjNtbm05aUVpR0V2TEphelloUzVXQT09?=
X-Exchange-RoutingPolicyChecked: fJ+N74kUOE22+RoWVisz09V+tANzEjJH834ioPc2l2tR0c51nhPx3gPq7ZK+uscMmVr4dyS2+gkMNWuMlTSmYN79nTjAlQfTNKWQmKDFejVH48kx5/uBrVRyaFyE0+KwiRt93s07xrFzcpPUxkT64ZzPUOQnON12cC0tg8teerGmL0DnrxX8Fj9PSDrnert1g4BwFJbN17roWCScB7/oJEKPhDdXap9naU1EeZMhrYniEt3PxYyj1RrGCfw4jlGNGQhvzmQZHt++LkNOICKWH/oJ49x7jUxdncZERmjAkI/eNItwmaQaB9QwIF9/AuAi2wLT3GkfOet1jUzfSa7Vtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b2825b-4fcb-4484-b11e-08de99de8952
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:30:20.2123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWoteykuMZvXw3gZNR2v7bFp3ZZIsMe+Po531HHwjR/xmoQ5C7On7OmbwPcBwEdaD4r6l20TYbwRc0T9Dy0uiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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


On 4/14/2026 6:00 AM, Lin, Shuicheng wrote:
> On Sat, Apr 11, 2026 12:56 AM Raag Jadav wrote:
>> On Tue, Apr 07, 2026 at 10:59:12PM +0000, Shuicheng Lin wrote:
>>> Fix two issues in register_nodes():
>>>
>>> 1. When the loop fails mid-way, previously registered nodes are not
>>>     cleaned up. Add goto-based error unwinding that walks backwards
>>>     through completed iterations.
>> Did you check with the author if this is expected behaviour?
> Author is in the Cc list.
>
>>> 2. When allocate_and_copy_counters() fails, assign_node_params()
>>>     leaves ras->info[severity] as an ERR_PTR and returns. The caller
>>>     then passes that ERR_PTR to kfree() via cleanup_node_param(),
>>>     causing an invalid free. Fix by making assign_node_params()
>>>     self-contained on error: NULL out the stale ERR_PTR and free
>>>     device_name before returning.
>> Can this be rather fixed using a local pointer?
> Yes, a local pointer could make the code simpler.
> As author will have new series, I would leave author to refine it.
> Thanks.
>

I did not mean that. I meant all the small cosmetic changes (Patch 2 in 
the series) can be part of any
bigger change.

Thanks
Riana

>
> Shuicheng
>
>> Raag
>>
>>> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Assisted-by: Claude:claude-opus-4.6
>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++--------
>> -
>>>   1 file changed, 22 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
>>> b/drivers/gpu/drm/xe/xe_drm_ras.c index e07dc23a155e..802e4bcb731c
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>>> @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe,
>> struct drm_ras_node *node,
>>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   	struct xe_drm_ras *ras = &xe->ras;
>>>   	const char *device_name;
>>> +	int ret;
>>>
>>>   	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>>>   				pci_domain_nr(pdev->bus), pdev->bus-
>>> number, @@ -89,8 +90,11 @@
>>> static int assign_node_params(struct xe_device *xe, struct drm_ras_node
>> *node,
>>>   	node->priv = xe;
>>>
>>>   	ras->info[severity] = allocate_and_copy_counters(xe);
>>> -	if (IS_ERR(ras->info[severity]))
>>> -		return PTR_ERR(ras->info[severity]);
>>> +	if (IS_ERR(ras->info[severity])) {
>>> +		ret = PTR_ERR(ras->info[severity]);
>>> +		ras->info[severity] = NULL;
>>> +		goto err_free_name;
>>> +	}
>>>
>>>   	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>>>   		node->query_error_counter =
>> query_correctable_error_counter; @@
>>> -98,6 +102,11 @@ static int assign_node_params(struct xe_device *xe,
>> struct drm_ras_node *node,
>>>   		node->query_error_counter =
>> query_uncorrectable_error_counter;
>>>   	return 0;
>>> +
>>> +err_free_name:
>>> +	kfree(device_name);
>>> +	node->device_name = NULL;
>>> +	return ret;
>>>   }
>>>
>>>   static void cleanup_node_param(struct xe_drm_ras *ras, const enum
>>> drm_xe_ras_error_severity severity) @@ -114,26 +123,30 @@ static void
>>> cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_err
>>> static int register_nodes(struct xe_device *xe)  {
>>>   	struct xe_drm_ras *ras = &xe->ras;
>>> -	int i;
>>> +	int i, ret;
>>>
>>>   	for_each_error_severity(i) {
>>>   		struct drm_ras_node *node = &ras->node[i];
>>> -		int ret;
>>>
>>>   		ret = assign_node_params(xe, node, i);
>>> -		if (ret) {
>>> -			cleanup_node_param(ras, i);
>>> -			return ret;
>>> -		}
>>> +		if (ret)
>>> +			goto err_unwind;
>>>
>>>   		ret = drm_ras_node_register(node);
>>>   		if (ret) {
>>>   			cleanup_node_param(ras, i);
>>> -			return ret;
>>> +			goto err_unwind;
>>>   		}
>>>   	}
>>>
>>>   	return 0;
>>> +
>>> +err_unwind:
>>> +	while (i--) {
>>> +		drm_ras_node_unregister(&ras->node[i]);
>>> +		cleanup_node_param(ras, i);
>>> +	}
>>> +	return ret;
>>>   }
>>>
>>>   static void xe_drm_ras_unregister_nodes(struct drm_device *device,
>>> void *arg)
>>> --
>>> 2.43.0
>>>
