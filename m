Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C1FF8873
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DFC10E401;
	Wed, 29 Apr 2026 20:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST7A445y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286E010E401
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777495441; x=1809031441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1vzb5TFKqlKh1p9PHZid/h14zRuWnJ2UX//fPG+cBiM=;
 b=ST7A445y51Hy3Jg/+kRn5zY28hH4ikqOQTF3KkUjEqdMlMKJ+5KySaWI
 JIvgnRT4QnMZ47vWNp5Z7Jz9/cGge8LlqpWf/1Bm5s1ZrvpXd2thJnEb6
 NZbMgMj8dr+uTjHwswogP8u9f7HacM3qjUdR0m4cyEIQcfweSADsTz99u
 Wu6Rkan4D2b6h9rAHb00kl3qn/sea6/DF+INXISkTVk9EHir6vmk2skRb
 8CJL6f11ngNbO5GGBBdhVny91P0MYooebZJLGYLK0dPl9Y/WYJCQiuRZw
 BqKtubNFT+vbO2Ftuam6Vv19wegjn3Cgu7XzjebtDKQUzm1rHxbXnXR1d g==;
X-CSE-ConnectionGUID: CRL24bW+RxSnZf6Iafum7g==
X-CSE-MsgGUID: PkRe25CRT5qpIsp8luI5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89526602"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89526602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:44:01 -0700
X-CSE-ConnectionGUID: +li6v8azSQiD88d/VciuVw==
X-CSE-MsgGUID: 7bHWQ+klQny24I0aePe7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233532800"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:44:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:44:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:44:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3gA/bF3LZG76img2xJwO/3MnzBjjJQthZ2Dg7Wt+YGHnxKmAMMxp73RQtkF25pD+lANUUfU71/PIW7e83KXABRMVWsVTSw3jin/PAJG5q3SO+nGyg981bllzIxRfKrS8yJb3dZvGg8s9h95fv42lRBEUJ5TElPvZ0Vcphkj9sBtsUOQ8n3aHIsw4JxsSolL0aC4y4JZMfDZpN0SEbShQg5Hfmi1imgcQ1O9PPj3UnU2OhcMqmMjyQExMWwguBFleIbTPdi5Hu9PjBaN52SPwcCBRDTDTmBgl7CLS2jhUUpEnYDxPrHuJDjSGFBmyzA8n5HP6tozWoJfy1e0yyRwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck2mo2mhWg251bWb8knssi9YAol2QaRY2aB/B4tk5Tw=;
 b=fQPFdW/zwIYu8akZcbsjzsAB/XZjX7QFx3wDvLS6HQL8kgkSCwzxpe3z8rnjndaq6KbObkS6SfbzYQyRFSaLyV7R+sgUQn9h60TVyd6xJvTpUCDQK2vbRM0ikf/lDRAo8+MYEH/Pb3Ww1XFmCNgt3ipFl8F7iSA99m/yBbZWevOefJMVJOkIeTinHM7LCJDyNaJC9RPQAf0AyeF0mcq5C94lGmGUw639NcUKoGZJ3BuL1yGsSuyO/vI+E5AM2JwCUS/i2ICuapWMvE1Lh5/Ag+E676Aw49Lvmft2D95/huTJk5HuDX+O0Q82fn1bY8mRclaph9PLF3+Z30fz49jD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:43:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:43:54 +0000
Message-ID: <4975abb3-990b-462a-8eef-a376a6c14aad@intel.com>
Date: Wed, 29 Apr 2026 22:43:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>
References: <20260429192259.4009211-1-shuicheng.lin@intel.com>
 <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: eb39e16e-7171-405b-3c44-08dea630070a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WQPe9ETb/tLn7riRgTbp9ATh9K1q6d0puh3AIxLVdFMA8o2jTTNjpVLfhA3ZgHUOBseKDXOz1h1nvJgcFhb9QOTO3YdB/Y5gDA/9BY3PT+9oMYxrtY0P13CgnO5ZAVa/DWk9BEFJ7FE5UiYC1HrrXZneukjRaXSZcM74VCLULFR9HUB6XIQA0sa5OdhCNmTNuV5JRfEx9ybKnhQWgs+uDlX2evTVDYGl8oOkmVnCaJYJOKkmClsg9XoUMMbgCnaXl3C0dCmaiDVsab5D04wIX7ULdROpRdd7XEolM4m6lal+nevO8sI7AY9amZ6vUIkTHeuMuK7RbzBKYev6sWkumWPZqCJ3sm75fmy9jK8UGmyXTHgJN6e74t368faF33fnvQnRV22fCLnEPMeZW6vg4e2ixFPGaiuhP8heuvm489sdMPND0VWlrP9MkFLgGoBqsq20LsqIkJQy2jAUNJHzIsGjOC8DNlVS8WjbQXm1MSC6jSjbiMWLfyzEe5TsBrHUm/JSOeDhuaE6T0VmmWP7baQoYP4BfFCI4VL0oGNfAy8D4EvR0rERZf3JWE2Y2EkZIogSvT1p4GS6vvCAKzYVf/4U3fxNiSyCIqb6VOHoToU3vZG5eRvE+roNiczS044YWKgf625SMmw0Sqzt28my/q1em4rC/5yQMH60B4qIETcXI1O7QjaUTkF+ywNAI9jOBakqtaRIsKI5BSyjSGJP+CynVnwOcy6U8BqkulmYrAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxrcmYwcEZIMHJaTS9wM1ZQcE0weWNXMVV4djYzTjQyYmNodHpOd0xjMFJD?=
 =?utf-8?B?STU2VXQ2Z1IzRncvaWsrZ1dPOUhodFY1Q1lsVXY4RmZlRWhKZmhqbi9hTDc0?=
 =?utf-8?B?U1grQ1VSb2N6YjJvK2RRcXl4emkzZmZTYTZMT2oxaFljc21JeGRHREEwMEZU?=
 =?utf-8?B?ei9nbHRTZjg3MXF1WEY4VnlmM0pKZDRiUDVuOXNUQm1RaktGT0NYTnlVVVRs?=
 =?utf-8?B?cDJKMGpiU3MxVWhsME5iVExQWUR2SFlBTFRGTDhUdUc1Z09zQi9KRVRFamJx?=
 =?utf-8?B?eHA3Z3YwWGhrZWUxaldCQk5vSStnZ0lxS0t4akoyRDRWWkhTVkw4RFdzVjk1?=
 =?utf-8?B?MURhMFBJZW1BUlpmM3U0MDNuRVNJaWNNK2tqSjFmSElWbGxwQTZNUWZ5ZmJQ?=
 =?utf-8?B?WTltSTBOSjRoU1I1QkdyV3NwT0tOWlJKcnBGMWpHbkgwcXhIWGFTWExPenhK?=
 =?utf-8?B?c1k4SmhKQk05b2xaSVF1Uk1mT3RDbXRMSGpKbWlPTXNjUUE2M0hEeWpjbjRm?=
 =?utf-8?B?SUt5YlpNeXBvYnVPdDMzYUpsM0xnSjJPby9zY2dvSkVVNytkYXhISGZJb3NW?=
 =?utf-8?B?ZTJCaWpuczg0a09YVDFsSHJGVHdiU1hYc003RFV3TlBnek1yeGMrWi9zTEdL?=
 =?utf-8?B?bGc5cWt0U3E4VHJQaG9mOXpEcmtKNi9UYlVzblBpZ1hNdGt0dGRLZlluSDhI?=
 =?utf-8?B?ZStoUk9TWWN5cVlKeFBncmsrTVFid2Y1N3owd2dIQkEzeEtTZ28wS0JIamlJ?=
 =?utf-8?B?MmFNd2V0cTVYZFNCWHRGVFl5Qm5UVkpvY2t2RENvQml6Q3o4c0plTDM3K3N4?=
 =?utf-8?B?VXlIY1ZpOElmMVJlYWNqS1FYVmVDN2ZOSFZ5ZlY2WjN3aEFiRDJRUG5Nbzha?=
 =?utf-8?B?Q0ZxSXRYNHU5eDVjdGQvOStmT256dmw4aC9FbzFGeDZ4NjZKdW5hZHdrSTJP?=
 =?utf-8?B?Y0VVdk5VRjJGLzF3Ylg4S01GTDN3elhicmZnd2F1cnB0MFRtZ3RKZVhKTmxx?=
 =?utf-8?B?U0k4Q1N1ajhzY0NRSmgweGNHci9XekRYb2JQRU56c0ZIb1o4TitZUWVlTmtt?=
 =?utf-8?B?ZkF0UTlmOEpyaWFYZlhvS0p3ODdSZUlEbFRHeFVVUFdHMG9Oa2xLTVMvd1JY?=
 =?utf-8?B?b3RIdlBESVZoSGZPeVZtVk1zVDBLRzhyaWRFZVg3WlFhRlY2T2haaGVBdHFv?=
 =?utf-8?B?dlFWanlvdFlDck5DdFd1RTM3OFVqejJyWHhPSHRqak54T0VXV1dCYmc1RUpa?=
 =?utf-8?B?SWdhQWtESmttTDlhSlhadEd1bU85blJOOVZxRzZvUE01Z2tNUzh0TXZDUVEr?=
 =?utf-8?B?cEZqTnBTenlkNE03RklHdWwzMStNUVRlczExQXlDTk0ra2dPUUtpWXg4b0NU?=
 =?utf-8?B?cGN5Sk1tSmNJeFNvR2YvcUxvM1g5Sy9JUnd3VFBZaWF6TkJXSVlVM0o1VU55?=
 =?utf-8?B?Z0FDeFFhYzdVaEtIcHZHNEVqby9ONmZ6bk80Ry9TL1l2WFZCeVZQdGJ2RXVD?=
 =?utf-8?B?MVBJYnlHT0E1RUFudEh6QVlTVC9nTzU0MDJNTnFmeGw2WGo4VGpFazNqTExK?=
 =?utf-8?B?Mm1kREVhSUc3WWhtVHBrd2RhUHdIVUFMYXprSGx0bmFTK2ZpbGEyTzJjVjRE?=
 =?utf-8?B?d1JPTWI2S2NtRDAzN0tGcDNXTFJESHEveHJsakk2NGRUdUdsTVJzdFhJSzRo?=
 =?utf-8?B?ODFHYlVnb2lBS2d1S1AvS1NveFdYaGxIQjUrZXZHWDFaWSs2aE5RbFRFZDAv?=
 =?utf-8?B?RzBJUmpiL00xYzBmRm1mangwMUYyRXJQdVp2eUdXbHhNeDl4M2JKM2xnRWNF?=
 =?utf-8?B?UHBqUEtOZXdUNi9PSXh0Vno5QWtyN1NIRHNka0YzRk1ZTng0SVBDeTdrbGJn?=
 =?utf-8?B?Z3ZhSjZxWXpDREtvTDFoQTZrMk80bk0vUTJEVHJGWnkrZUVtQ09zZXZYamxY?=
 =?utf-8?B?bUpabEVnNDJnSEZBakJZQmZsakFPWEVTKzYwa2RUSlZCRU13ZVFvN1ptTi9F?=
 =?utf-8?B?T0pPTmh4L0IyZTY5OTlVbU9iaVg2U1hiaWV1enA0V1BJYXFCTVhCK1ZDS3Ex?=
 =?utf-8?B?NEQzdU51eUJpSnVLandRMkEydmZkcmttWVBhdkVXdkt5T2dDc1RxVUg4aUxW?=
 =?utf-8?B?MCtZZVpsT3AwVkgwdzZlZ1NleXpjaGdJNVN2UkNYZ0RaQzdhV2hVQ1NjZSt0?=
 =?utf-8?B?SnhOV09HQ2NuU003VGRBM29vZEJtemo0NXcxYzc0VURzUlZhRnE2cHpmMGVI?=
 =?utf-8?B?TDNSRVdJNDVncm5XbzB6eU5RRFVWSWVOcjluUDQxeUZaMlExSTUxN1FjSzFt?=
 =?utf-8?B?WWxjL2xMYmR3dXhIQW50NnRqcEJ4QmxEaTVyNjZyUTJlQy9zM3I4RzNKLzJS?=
 =?utf-8?Q?1GIhtFfoCRfsdixg=3D?=
X-Exchange-RoutingPolicyChecked: YsQKgrq8E/BCe7YfBdjgM+qt2776Upo1k1LyyAjZjpfVMVC9Kawgtw/MSvoYpPaTTFaOT2QqKeE3B38DzcFzB/CAf7lRwMhC9s83ARqocBrcSh0SoL6TeXKX+kjuAaS3mC1az15+CMy2XMJVa+b0TiAqyNeVN1OHqeUcxWmIpi3b3ssF/1wb8rFgBOKiKgZyPBo4QSAnr42/8ORT8zQ5dD9jSWFewSQO3H/qfnXvBJkytTbYlpfdndC9ojaF6xiw1zmUIA7KJfuQR3LGZ5UPoxSpGpROI/Hi3CfSheABd7ht8zZF2sMT66UYkD7hYffdAkVa0GNzCUq5KuiQhkRZxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb39e16e-7171-405b-3c44-08dea630070a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 20:43:54.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtQ0s2FncuBLkx+FIdDWskU2XP0MOeZVOTTgRVzBRpaQPFn9WxIoXj80U/b1u788eezG5xJJpMinAA4H0fYpMsqnh4o53w/NMHZg4BSFDiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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



On 4/29/2026 10:25 PM, Summers, Stuart wrote:
> On Wed, 2026-04-29 at 19:22 +0000, Shuicheng Lin wrote:
>> pf_migration_mmio_save() and pf_migration_mmio_restore() initialize a
>> local VF-specific MMIO view via xe_mmio_init_vf_view() but then pass
>> &gt->mmio (the PF base) to all xe_mmio_read32()/xe_mmio_write32()
>> calls instead of the local &mmio. This causes the PF own SW flag
>> registers to be saved/restored rather than the target VF registers,
>> silently corrupting migration state.
>>
>> Use the VF MMIO view for all register accesses, matching the correct
>> pattern used in pf_clear_vf_scratch_regs().
>>
>> Fixes: b7c1b990f719 ("drm/xe/pf: Handle MMIO migration data as part
>> of PF control")
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> index 87a164efcc33..01fe03b9efe8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> @@ -385,10 +385,10 @@ static int pf_migration_mmio_save(struct xe_gt
>> *gt, unsigned int vfid, void *buf
>>  
>>         if (xe_gt_is_media_type(gt))
>>                 for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>> -                       regs[n] = xe_mmio_read32(&gt->mmio,
>> MED_VF_SW_FLAG(n));
>> +                       regs[n] = xe_mmio_read32(&mmio,
>> MED_VF_SW_FLAG(n));
> 
> Good to get feedback from Michal Wa/Michal Wi here, but I don't see any
> usage of these MMIOs from the VF in the driver. Are these even exposed
> to the VF? This seems unsafe from what I can see...

see xe_guc_mmio_send_recv()

> 
> Can you show the error you are seeing specifically?

it might be hard to catch the VF driver in the middle of the
MMIO communication, which usually is done only during probe

> 
> Thanks,
> Stuart
> 
>>         else
>>                 for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>> -                       regs[n] = xe_mmio_read32(&gt->mmio,
>> VF_SW_FLAG(n));
>> +                       regs[n] = xe_mmio_read32(&mmio,
>> VF_SW_FLAG(n));
>>  
>>         return 0;
>>  }
>> @@ -407,10 +407,10 @@ static int pf_migration_mmio_restore(struct
>> xe_gt *gt, unsigned int vfid,
>>  
>>         if (xe_gt_is_media_type(gt))
>>                 for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>> -                       xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n),
>> regs[n]);
>> +                       xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n),
>> regs[n]);
>>         else
>>                 for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>> -                       xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n),
>> regs[n]);
>> +                       xe_mmio_write32(&mmio, VF_SW_FLAG(n),
>> regs[n]);
>>  
>>         return 0;
>>  }
> 

