Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C50DFD8FDA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888D10E9DE;
	Thu, 26 Feb 2026 17:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C137E3np";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074E910E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772127377; x=1803663377;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zCg/3ikztX3fpJVEVP/0hAZlCCZm0FgziWtOQPIagw4=;
 b=C137E3npolkjCMvlLkmkxIfxhkCmzG597F3KVF60hGDSx270ponpj3eD
 MHEdBDoa2OILphhQ5iCVDl+2biY+vCLTorAIX+E0HqDf0w19NmuTtZdJf
 QQjdP6yaB5W7fNQM6+cz0zTHjgFvmAQw2TkXSG9kSMOwiYNVuz71ZYJ+p
 ZMBe7wDoXfjDQlyKa0UzYiqanRBurzqg+ewrNfz+x2AAlbiXiVNGkZafx
 t4TKKyUHtHJv/HaMccWTDI4TtmkBJnNJHTnjeemgdFEKCJfvlMT4MwE05
 fCIaaqKhBmGYlfLCssMRZ6AvtsO5flDcSGItzfzzHiLKzOzJJr/fWmH/o Q==;
X-CSE-ConnectionGUID: 1hXAfL1jR7O3msQeRJypRg==
X-CSE-MsgGUID: Zl1PzhLHQ5WpxW3LtLcVrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77068335"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77068335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:36:17 -0800
X-CSE-ConnectionGUID: kmPvC/upSYiIdjpSxREMtw==
X-CSE-MsgGUID: AL/ls6MaRaK7QY+F3+3E5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216541894"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:36:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:36:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:36:01 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:36:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrJgS3nH4bfwQAobGZr5kINmcAj5H4OD/Q14W09bWUULwYg3ChxTq/687Nm7nqWrNI3HXm8Pu0JLMpkQbdy+ScMsEmEUWKyGRm9ll6UowD0PgtwtjicmojOjAJtJBoNqQtzfsFmzanRBV8fV9U/0gosil0oBM+4RMPl/MtVdnCw1EOqRHEkhpO5GuJxfUBHuA+Q/+T6sXJ3khzSm7VSO4AsD6MdJjPzikpM9Ar8WFVGD2hN9/oQXQEPruvaKfw3eATmFgV1XOH6tu9mrgoo24S0tmRPXiy3LaBXo/SaQdp+f0vbNx4ozZPg0UkJAtBAjjvzO8uLH8Ib0m084tPTvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBHP8Ejyx9WjRcvmjTj/50EGaHLcOSZIDU13KrmfCV0=;
 b=GqlLBEliDShMoV61cN20j863DPoBytLcUc1abc/KNGvpm5w6HFUJ57zsmCDd/Vsu2ZDkClZMwOTpPKtq258w50nDelS1YrY2MW3aITv7H/e/9r5NxWXwqnBCRT+zhbNcaJpnetkDyB8Fzvj/xEfVV1d21T56Pwgs1NkEE0e4Hi7mpQ/cXwGhn+2aV0Me4ikrMNSiOFtFxbHJdRupaj772r+Wrk0APB2HCx0PMKVN2C064Ex0rKYBVQlr/tC8rpiKVfBWZeLmQdEe/wa1Y2YphFu8wCgdMmpncPNvtzoOLEllSVaDOn2lf81a6xNXIKpMtpewngl+33loRQxqRa3qZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 17:35:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:35:59 +0000
Date: Thu, 26 Feb 2026 09:35:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aaCEfObwLbCrN/3W@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <aW/vdvCw/3DZwfpt@lstrano-desk.jf.intel.com>
 <ftzvlqcyj74d4bh25mreg64f647jintfteo7apctrnrsjgqbjs@k2ulohn2ycsg>
 <3ropzjiwoal64zajsgyba3nefzmntbvsk6oxp3pv2li4nfobiz@3gsjuhsuhkhn>
 <aXkc+DtEtRWSRAyk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXkc+DtEtRWSRAyk@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:303:84::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4f91c3-fefb-4e2d-39b4-08de755d810a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: C0KcWUlrjIHiUeNxWZBaUIDWBECTtSBbvG+ELz3DwldZJbXaG9qy0A+OcvQRt85a7/tPg4KJZ/4HXMtPHEs7i2exHd4/GE9LlZpRepZaBzomtMu+XYFWv+AhvAqyZ9N2Qf/IAomSt6wkdhCKcNLQ8PIEUrxxeU7fbvLOiRRoSGWaMCgOx6p1HQTLoMwU0sTViADIiD4fZ4wJFPQopJ2LvN8dnwjmRgqeiMVk9OiKSPEDEKsOPD3katPJVPJTfWDQyJ7f2BmVvhwV1QN8iC6QvqG9HoYxRgyd7d2eAw8rWpRn5cTIpx62Pr+BkExF2IXH4nXCEzhIwkCMQApaNrET2Ih0gI2bpjEoIfZQjG3hTKPLA/8SewaE2pmCb2ZoTUddTCBKKDUvQvSr57ljlCHdbZY7wWZX43W6wIi1J/a3WBwUwZsO87qoUOJ+HzvzGdH48Vh9tJjfviLxybj7xrlJADgX4/99Dnx8cl7iM+rKwKl4PSuRf3dVJ6WPiWsa9DEviIAJufcAxpjpLcH/ETswm6FBUu80ZtBUL6s7qY7Xl+Pc08KBTB/QLZJWZXiDs6hmM836Cyt99QzOPSjAcRWRPb9SaZb/LhjP4WhLXytzf13fbAi8xUmgi1AgaZXGs0CldohZ7iFQjgmB7UJ0nl5a41d5VUhgHvULLQKM0+eZFw67IoxbFqYQ3+cBwukAn7Gk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXg2Unl3UExRQ0dCTWhoSUEwbkpLaW5RVVhTbFZZMlU4WHFNRXpVYjlwZUlj?=
 =?utf-8?B?NDRxOGN5aE1EbFFqOFByNXoweTlreW81RTR2UmFPd3JMVnZzT29RaVZKL2pR?=
 =?utf-8?B?cU9CUXRGTTlzTHltdzhKT09QQy9DYnR3RmRGZ2VxL0duRjhrWGVnUDJCWGY0?=
 =?utf-8?B?YjNXbUNVeVFIcjNSV3J0cHdVM0E1alJSSHIzSXNhVEpQUEdKUkJmQjhadGw4?=
 =?utf-8?B?OEtueEJxVEJUUHdaTkNuRXk3Y1BQc01HVWEyQ05iSjdBMVBSMjg1T3FmYllJ?=
 =?utf-8?B?WmJUTmhmTTFYbVZ1VVpCQlBEZ2phRGQxajFzaTZsd0JPd3UzbTRIM2lWeHVH?=
 =?utf-8?B?N1ViZjJxMXlGT0x2NUlxY3ZGRjRXWlJBajlXZXp1OExESnlQZVdtaGl6eGgw?=
 =?utf-8?B?M3VDenhmR1FQZ2NaMmZhRDFWV3Z0K1VuSWtmdk0zVXFYR0Z3MGRQQUlid2RC?=
 =?utf-8?B?Rjl2a3hUR2JWcUtLdnZNcFNZN3RLVndtZHJBOGdoUW8zdDhKS3d2OEtwTkZU?=
 =?utf-8?B?OGczK1pyczY0c3ovSE9HbVVKS1pURWxpc0VrODVyUlhPeXlrSlhHRWZpNWZM?=
 =?utf-8?B?OFBPWnZxT3k0UE93WG0zOEZLenhrSmlMZ0swdTR0THF6UTAxK1JTdDJOWjBi?=
 =?utf-8?B?ZFU5L2RFeHBlM0ppelFkQWVHaFVURGNJVFg2bHV2aWl4MGpBS1B5LzRWVFFi?=
 =?utf-8?B?bEg2ZDNWdHhRZ1FCaWtPR2x6RVFwN2tWWGwrNnlpbVlsMkw2YjdVQ25HSkxo?=
 =?utf-8?B?SnQzbDdBT1dHemxOdFJJVy8wYkNTNTYrcW9OK0MxVHVRVk5pVG13V2tuTkQy?=
 =?utf-8?B?OGRqTi81bjVJTTJhb1FyWGJvOWgxN0xRQXFQc0Ezb2pkTU1CanI5MWNBRnRy?=
 =?utf-8?B?T3JVWUZ2YXorSnJLTTZjZ05HVXo4M2NKMUtGQXRJWHBiTDZLRjF2Vk5CRWpP?=
 =?utf-8?B?OEIrdmJNTVVXK3UrMm0yQlh2MUFJSG1TQjhPKzZ6VXhuUTZhZFNxRHJnVkdn?=
 =?utf-8?B?UHZwQ2t2WXg0UVFqaXNpeU5WZWxyd1FUNHRNU0FqL1VmcHE5S3BER1BEaG9O?=
 =?utf-8?B?NWM3ZjAvWCt5Zkl5TE15R3VzdGJnaU9wZ0lmenR4VWJRbUVEVTJaOFJKd2V2?=
 =?utf-8?B?QUxJMzhkWlF3K3VPM05UWlFVVEp1dWFZMm00S2lHbkNsQU96M0d1ZlpnRHlF?=
 =?utf-8?B?all5aUhhdE5qK3RLZ3gyY1dMMU45QXRGNVRKRzNGOWxFL3JoYi9WOThMbVRF?=
 =?utf-8?B?WGpNQkJaOWpNRGNSa2VMWFRWMHBsZnZsREVMajBhTUhWL25MMi9GOXF5T0t1?=
 =?utf-8?B?UXlQQ2JjWnJrWGdRRkpSYUJLRVduNlFQNGlwMnVHdEk3VThGdlFzY1c0UCtt?=
 =?utf-8?B?OTZkRFA5ejZna25qOGFFb21Vdkw2VlBBU2haTDNrRmJJcCtqdXF2VmMwUDZN?=
 =?utf-8?B?T1FvbFFNcEVBVVlscTBuclZ2SUovNlltRHpMOS9Sd0NVMVVTeUdZSmF1UnR1?=
 =?utf-8?B?WGZzVlorNk1NbCtSY2lhWWVONHFkNjlDMkdnMVgwQUtHYzZaYVc2bm1INDZt?=
 =?utf-8?B?dU5mYlRxVndhcFFZelJZekJnRnUvSS8vWCtrY3kzMmY5RGRJZGFXOVBJQXpG?=
 =?utf-8?B?Kzdia2VEMG5Sc2lMSzduWnNrTnl1S0RVRWM0NGxiTHg5S2VyZ2w4Q3R5eEps?=
 =?utf-8?B?WVhqUEFxVkxPcnFCeTUra25wWXhCZlhoZElxOWIwQ3dqeGJhZEJoNXZWeVJa?=
 =?utf-8?B?WjY4YXB5VlZTYmVOOWgxcmdySm03OFZ2bzR4TktyU1NxMC92cUF6dWNoVUQy?=
 =?utf-8?B?ejZJRjJvOFM1TU1mZUhVR0kwQmFBdzRJTjNxNkhyZitUUWRmM2NKeEhmK2h1?=
 =?utf-8?B?MEt1M2R3MkJKbURUaCtla1JIMVZYWkE5eGNMdFBmRitWditpQkZDSHJrc0d2?=
 =?utf-8?B?dml1NlJ0dENycWpBelJYWjc4SlMrZTEvQSs2SldkOHlHNHAremgxQ1R3bXcv?=
 =?utf-8?B?ZkNuTEwzZ1FqQUc1bDIxUzFoUFY3NlNmOUhEVGx6T2t6QnBBVW9mUldaOFRt?=
 =?utf-8?B?K2JrMFNGdjVUcDlMVjdKeS9CQ2c3d3lKQktQLzYxMFpZMmFGTXlaZUM3YzEz?=
 =?utf-8?B?MGhmcXpXRDFHTWhMRHM4M2xjaVZoTXFHVWcvNTZHTUphZ05UNFFFSlE0KzBz?=
 =?utf-8?B?SEoxaWJObjVYZ0EwU1cycFY5Q01TR2hiMnI3UkZ3aFB3ZDYzTjhSWnJCRXRX?=
 =?utf-8?B?RFY5YWpTVW9yMkhzVzlndmwvR0VvdWRTWHR6dWJsNVlObWx6L3F6ZVIwUHFh?=
 =?utf-8?B?Q09qTVlwNFdJVDdVTmNmZzBGdzJZY2d1aWFlcG82cjFkL2hJYnlNUGhTNnBm?=
 =?utf-8?Q?/nWRBGemk7UjWUmA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4f91c3-fefb-4e2d-39b4-08de755d810a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:35:59.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCNcTwogwYVMKe5PybrxK3baluVfnosPBeZATNAQIrn9ORxcFvccT340fOLylfcfgBMdcVjy5F9wjosH7rrQMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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

On Tue, Jan 27, 2026 at 12:15:52PM -0800, Matthew Brost wrote:
> On Tue, Jan 27, 2026 at 08:20:36AM +0100, Zbigniew Kempczyński wrote:
> > On Thu, Jan 22, 2026 at 09:44:14AM +0100, Zbigniew Kempczyński wrote:
> > > On Tue, Jan 20, 2026 at 01:11:18PM -0800, Matthew Brost wrote:
> > > > On Mon, Jan 19, 2026 at 01:01:34PM +0100, Zbigniew Kempczyński wrote:
> > > > > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > > > > would need to perform a context switch just to signal the fence, which
> > > > > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > > > > after executing the fence signaling instructions.
> > > > > > > > 
> > > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > > > >  1 file changed, 9 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > > > > >  
> > > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > >  
> > > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > > +
> > > > > > > >  	if (job->user_fence.used) {
> > > > > > > >  		i = emit_flush_dw(dw, i);
> > > > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > > >  
> > > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > >  
> > > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > > +
> > > > > > > >  	if (job->user_fence.used) {
> > > > > > > >  		i = emit_flush_dw(dw, i);
> > > > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > > > >  
> > > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > >  
> > > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > > +
> > > > > > > 
> > > > > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > > > > wait for completion, pipe-control is necessary to wait on
> > > > > > > compute-walker).
> > > > > > > 
> > > > > > 
> > > > > > This asynchronous behavior may explain things. Is this a common use
> > > > > > case?
> > > > > 
> > > > > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > > > > not doing this relying on kmd.
> > > > > 
> > > > 
> > > > It would be good confirm this.
> > > > 
> > > > > > 
> > > > > > Also do you know if render engines have similar asynchronous behaviors
> > > > > > or is this specific to compute engines?
> > > > > 
> > > > > I don't know, I think Mesa folks may know the answer.
> > > > >
> > > > 
> > > > Let me ask around about this.
> > > >  
> > > > > > 
> > > > > > Lastly, the i915 disables preemption on both render / compute engines
> > > > > > immediately after the BB before emitting the pipe control. Is this async
> > > > > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > > > > supports? This might explain why the i915 works and Xe does not.
> > 
> > We don't have platforms which supports WMTP in i915 driver. This imo explains why
> > there're no issues observed there. I mean regardless preemption state
> > disabled/enabled all instructions soon or later completes. 
> > 
> > > > > 
> > > > > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > > > > what test is doing has a meaning in this case. First compute-walker
> > > > > submits kernel which loops until it will observe some memory write.
> > > > > Second job executes compute-walker with kernel which does some quick job.
> > > > > But first occupies all EU's so second job can be preempted only when
> > > > > preemption occurs and SIP will be executed. So if we disable preemption
> > > > > immediately we submit compute-walker I think we have no change to enter
> > > > > SIP and switch. Even if I add pipe-control to batch level according
> > > > > to Daniele comment job it is still preemptable and we move pipe-control
> > > > > location from kmd -> batch level..
> > > > 
> > > > Does the test work with a pipe control in the batch? That would be a
> > > > good data point - if let me know how I can change the test I can test
> > > > out too.
> > > 
> > > I'm going to add appropriate pipe-control to pipeline and send the
> > > patch.
> > 
> > This change: https://patchwork.freedesktop.org/series/160484/
> > 
> > along with your patch passes the test.
> > 
> 
> Thanks! Great data point. Now just need to test out Mesa / Compute. I
> suspect they properly insert pipe controls in batches as preemption
> points but need to confirm.
> 

Both Mesa / Compute have completed CI runs with this patch and reported
no regressions.

Can I get an RB on this patch to merge?

Zbigniew - did you ever get the IGT change merged?

Matt

> Matt 
> 
> > --
> > Zbigniew
> > 
> > > 
> > > --
> > > Zbigniew
> > > 
> > > > 
> > > > It is fine the batch preempts, we actually want that. Mid-batch
> > > > preemption is not what we are trying to prevent - we are trying to
> > > > prevent preemption of the fence signaling after the batch is done. As
> > > > long as we don't regress any user applications we can safely make this
> > > > change - it is fine to break IGTs which are not doing the right thing
> > > > wrt to batch programming.
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > --
> > > > > Zbigniew
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > > > 
> > > > > > > --
> > > > > > > Zbigniew
> > > > > > > 
> > > > > > > >  	i = emit_render_cache_flush(job, dw, i);
> > > > > > > >  
> > > > > > > >  	if (job->user_fence.used)
> > > > > > > > -- 
> > > > > > > > 2.34.1
> > > > > > > > 
