Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A168C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91810E4FF;
	Wed,  2 Sep 2026 18:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPgAyn+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD4010E4FF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788373325; x=1819909325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SOFx7RsjLUdB38Yt89tK9bB7ah3wMBEPviD9qeLYiws=;
 b=OPgAyn+m699Pfg+ugYnjrUPdCAWMmBxfENL6grKN5vvRlradVfWPV86L
 WNZeXZO0ZUZl74vpQpXUIKHknD3dJxtYxf1CdNwmvmK6ofigHPlt7D598
 hH0n9qa51Bzfpes5l59qlmsbewuyH+/HnGAWELuQ6/nx1r+oY9Ja05aw7
 c0/FhGll5Bf0z4O12OT8aDLJ/qE0twvziHjuTQ2aQzyK3w1pMYWTvQxRk
 fOkwRINvwJ+aQ+VCgam8RcfGW2roPWukJgfa/5TOfjVSecagTt7VkBr5C
 pTO0EU87wgpv1JBwDIgn5cp+RUArUNUiZYWk0x+Js8CIAG7/+PqjLJJyJ g==;
X-CSE-ConnectionGUID: 32kbJXWKSr+v/TAxBdlUrQ==
X-CSE-MsgGUID: FAX9dgzJTSqQXcPlV7fIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106364176"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106364176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:22:04 -0700
X-CSE-ConnectionGUID: tCRIxVEMT5aFFJFIJzTKwA==
X-CSE-MsgGUID: 3AcaNbsUTNG1dzw/3tYtfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="265787024"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:22:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:22:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:22:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ux/MnFDtU46m7ubjfAo0qMrKCc7CuA5vc/YStJdcxtVI90v64wOnK7ijPAOVH0bwASbqubAoxAsLDPEbdi6NQzSRvxT/Lxm7zK6xHQCh/npqgdge9PABFGmHKs9Y2SpOHttsmZPsp6PNGjex7QAVsTgHOnj8dTSverdAiyhu4DhFKQcl5DZl/vo7vMr4hW/Z06D4jrpACVjXKT9NDgxnNA4BGs89208U479gez00f3D9UV6ZGVD++Xzzr/hKrpW2T02rkFIGXEHpb7TJTwnrsO/KUhBAU+zCHr2agRNE/EXDfYdojivgnVLAfo0OH1rSaCUJIt/lfjaTuIYvHaqHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3O4UV3NZ/loD8vrtI2VHjoMJBiUJ2OtanyIqtRCFvA=;
 b=hQWLo4caRy4KT9mR7tN2I70/0lt8MO4/HTGNL+UqpfGpuedTZMnST7fbyz9ebJ+O4wroEOP9vWhdsVwZe+FPfe+5uSGUIa2Jk4qEy5+ZvJ8iSzAVpCnURfdGI2qU/XumI7LGXtNKw17fzra7VduUD+AFSBE5VeOu8f5ENXK8Ws+rSIOURHg8kzkqPQSvEr7iqBxVQle1BagtmrRDZIi1tp3TalrSZSCUydNotB9hIc0k4eCsLFZDBGNras1oGRbfS1qFiS3sjzaUlS9YphjTw6dq6DOZEB1S77aHTz50iYUcHPXE+Z+HNSI5bqI2stfBYRKxBVArwIbjqo41zhousQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:21:59 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:21:59 +0000
Message-ID: <5d4de95b-24ea-4aed-817a-c12e9974d183@intel.com>
Date: Wed, 2 Sep 2026 20:21:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
 <20260901164435.1395260-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901164435.1395260-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::10) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 008826eb-4efe-4fdd-9570-08df091f13f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|6133799003|3023799007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: CXiG0QZwHnBgSg4ZY6TvgFJO0V26ZIxdrAWS3W5pNw06rO10TcI15xUQz6lC595+7YqJSTJ/+SHz7mZ15fKO0JU7Hw5wOpcEEQFsxyfuNyLgG7XwUrzTTTVCjKnUSu42dxz9A5hEBwIxz/ap7mLBy5bBtiFb+Cqt8LbZQmMkH/cgZD5XheKEbI/GMwzLHa9rkdr1LcdFlxHfAq1HM2AMcj18e2tDvG74lWVa8oMfa+SMFuK10Dsnr5JijEmYqK1gtK+ftHSJMLXgwOkq9DfzK1PLNQAV4UmMbnEO01gpH67zhEMqb2gjtvkQBw41o0fhh7MykI2ZiuyEy8WNIYyUsSDIde5CgHn3udlDK90HM/KJjSJhguHusZY70lJewkMrDdp79z1qtkN5GGYsNII0q01j4W3aOUhFon82tqiP6tSgp3QOD2/xe50q/LP9z3cE6N7rX3iLGhL/8JeTqeZzQfU8arg/CuZ5ocum3tzTifFzoJXhkA3cW+Dq5cQDnidrVxrGaBYV0Kt8rtf6Xeu/mdQ4TgzAahrLKt8XIvxTZAUmuxKTlYhMK2MKLW2l9x4rkpyLPJgaTTzpcwfD2OPdlXGQrEMoFhes4IcoZxeRzUpcRb41Bu+hrMXm/Yhpfw5o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1JIZWZlTFB5Nlp5MFBNbmpxVDZCM2hlMzlkUFFMRkFzODZhN3BQLzVJY2NF?=
 =?utf-8?B?MU1zRCtCTlArTUZ1UlcxektxY2Q3eUJ2V3V2bURYaXBEMVlXM1lNWllRc0V1?=
 =?utf-8?B?VnEvZ2x0NUhzMytMclQvYXlhbGZmR3NKN2ROaER3VTFjQUhHT0pta08vTEtO?=
 =?utf-8?B?ak0zNDhsQ3cyM0RtVWtMMGZqVlNqYzR6TysxVXByOE9mcitpTThFTjZYMGZu?=
 =?utf-8?B?RnBxT0ljSTYyK0ZTMUkrRjFGblgzYk9Jai9tT1FKdVEwYkVRUzNyYXZjZEZa?=
 =?utf-8?B?R0hrdE8weUs3dUZlV2UwVGRmRkxhOTZnWGhRUkNvOEJIZTJiTmZGZm93Tlc1?=
 =?utf-8?B?YnY4YmVvTG5QVVUvNkRxQm9GZWhiZmpGNmpKSTRhaWlXWHNvazIreGR5Wkdk?=
 =?utf-8?B?YzFVM3BwQWtVY25oS3VYNE9iM1p1UG10V3BNWFg2QmZzazdrdjM4OGZVdEdX?=
 =?utf-8?B?WnNuQ01hVTVHZHY4UEZsTlVSTzZxc2NtdFNGU2wydUNGeEF4OGJjOTZDa3BD?=
 =?utf-8?B?S3J1U1lIZDVERWU4eWJsQ09jS0xacHNYRTdCVjBqY0lyeFM0QXQ5WHloNExX?=
 =?utf-8?B?N1B4cXlOOGs0SkY1cUtid1hlUnZaYTZYcFZRQzBFS0VBSFErYlYvOGVrdm5W?=
 =?utf-8?B?WmU4MHRSb2JzNFk4REszM2VBVEVsQWdJYkhLaVhnQnc3NDdjL3JEOFR4ZVNO?=
 =?utf-8?B?dy9YT21GTDNaTEV6R2U2d1JoSEdKOGV5UW5oKzR0UENmcnBobVFNZ1dFWUd5?=
 =?utf-8?B?elJaRXNMZjF1cXp1M1BGa1RLU3FHbDRRT0xwelJNaU4zRG04NjR5SXRtdEh3?=
 =?utf-8?B?YkFTRWZXY0RNbEJuVW91eG0yZG1LcG5NeFhiS3ZaeEpmclU5aER3UW5MUmtW?=
 =?utf-8?B?blBWQ08rWkhSNlBwSXF3bGRIZ1Y5U25vaU8xWVFBQmN3eXVTM0RPbDBhaThv?=
 =?utf-8?B?TDFhc0V2dXNYbzl1NWJYZUxDTXM3dWEybUJoSytMb2JGR2o0RzEva2h3WWwz?=
 =?utf-8?B?QUJaS1NOSUh4SSt6WnFDUEIrYmg5UE04bzdyVE5TZjRIU2NrV21yc2gzN255?=
 =?utf-8?B?SkdQeW5GU1hOWktoQlRIb1hjVVJPZTdBbEQ4anMyMm5MMDBrdkp6VWRkbGFD?=
 =?utf-8?B?ZlNVN3VYckNCbXlGYkdHcmk1TXdnN29VQnNBdWVDR3RTMXdGRldNTkF5RWxj?=
 =?utf-8?B?TlRkNEVHQ2E4V1paMFJFY0J4ODZDUmxDQUI4UUV0K3VqNXFFVjJDbjVwKzRZ?=
 =?utf-8?B?cjcyU2VMYXhuRmF2NnUxUCtsS2d5bmhhaytZNUhBRzc2ZUZIVkNxUHJKZ2JQ?=
 =?utf-8?B?VVZJaU9ESjlUN3Q0ZDJVR29FTCtLVlAxcFAvcEd1SUNCWHI3b3BPc3ZhMERG?=
 =?utf-8?B?VVNUTnhLalMrRmdweDJqMG5KTFU1ckd2NEdXNS9zcXp3Sm9mZUxLUVpYempH?=
 =?utf-8?B?SlNzK3pvQWIyUVVYbURQOWFFZi96eVJyby9CYUtRYlFxVTdZM2ZFcXkzSUFU?=
 =?utf-8?B?OFYrek1VQTlabnhvd0pSLzd5cytSZWVyUlNTcFdobUgvODA0ZzFiWTRBdHJY?=
 =?utf-8?B?eVk5M3lpcjFWVkd5MlJhbThyOHhBazJoL2d4WXBTWHBFOEpDalRoQ2ZWYXpt?=
 =?utf-8?B?alpYemVHUkhvVnM2RzVGRnY3TnQ1cno0ZWEwZTdlNUNOaGFCcDBzSXZwY3dB?=
 =?utf-8?B?WlVzeGtmdE5MWk8xZ0RDeVgvZTk5Vm5BZk1JVStJaGRKaDhEdjg4c0kxN0hE?=
 =?utf-8?B?a2V3YXVzaGphVUo3L0ZKVEVrUkNlMzV5Y1VKRmJ6dUFqSmtjbE1FeFZVMms2?=
 =?utf-8?B?NTRxWmw4Y3lON3d4eFlpSWtTSWJkdW1FdFZNYk1aZWpkbkRtU1MvRVBBbGVZ?=
 =?utf-8?B?b1RyZmFlTVFITE9PTG8zbkVEbXBtMytNN0hOVVNpYlBnUzdLb3Q4aFBKQVcv?=
 =?utf-8?B?RlVKcUZMWnpmNjlpeE1ncCtTUUxzRXd4T2loRXJsMW43dzJ6SVdkYjVEam5o?=
 =?utf-8?B?VERVWkdZVjdaaGk5dW5zOGp6dWVEazBjcjI0RGxlRzJRVGg2TFlpT2NxemFO?=
 =?utf-8?B?WFZsMkZJMEVBSG9GcVRaOUZFWkd3cmZqSi8za3pYd1diMmNTdjNwQnpHeTRE?=
 =?utf-8?B?WXdaZ0ZlWG9pdS9RVEVCQmVlVEtSM2JBcXJFYVdJbXZOL1BKcDNpOUIwQzgx?=
 =?utf-8?B?d2tPaTkxSDh1L3ZxWmVLU1VaY3cvNXp0WkU4MUV4RDZPbzI5NUJ2U2I1eHo1?=
 =?utf-8?B?VG9vL3oxbXBTamVYQUV5alh3ckhHazJrK2dlTzdWclpFbEpKL1RNRys1VCtz?=
 =?utf-8?B?QWF1S2NBcGhXa3NHa2RpU3FGLzBqalpHOVZIckgxOTExSGFiVDdiTjFFSUxl?=
 =?utf-8?Q?mEsznunyZUTIlHC4=3D?=
X-Exchange-RoutingPolicyChecked: 1/+076cOJn707ujyuMJHTbXcC2MpoItd55kMQpptOALs5hO6v2MtWRZZN4dMDcvPe2NTc2wzyeV4v0jpPFeEPfwnmnpLP3VY9yW3NZymVUyOkQ3cMRVqZZmpw61rtUZp1gbiaFg7ABOX5dt5wwEenXSb9yNebBMOvmVPs4sVsdK+sLeyKRKKxhEsiSu2WT8BRVBOdNqEWq2d3GinZeY8qEX2QpdXA1OWbuLYH8QsZUINBBLbgetnQ0EwiooDxiTmoVghKOAyVfIJF2i28ytCIVluMc6AcUHxfKiYrAoJ6RkdPwuBspxgQgoJchNIZ4MqG5w6h05yq47BskglRhrSOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 008826eb-4efe-4fdd-9570-08df091f13f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:21:59.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fX6Yw0R97buu6EFHCEH4hh1O7PIfcqcG4JiS2l0t+lh5jik/zdCjrcEF+QrsJ7rILr6PKxtrYGN+6xiubJAa+3MGZdxYB/UzMKWC1m7mP2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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



On 9/1/2026 6:44 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Add GGTT KUnit tests focused on the newly introduced usable and
> shareable pools.
> 
> Cover range initialization for native and PF modes, including partially
> overlapping pools. Exercise allocation direction and conflicts between
> the pools, as well as the unavailable shareable pool and requests
> exceeding pool capacity.
> 
> v2:
>  - Init ggtt.lock with mutex_init() in each test.

nit: keep change log under ---

> 
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/tests/xe_ggtt_test.c | 336 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.c            |   4 +
>  2 files changed, 340 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_test.c b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
> new file mode 100644
> index 000000000000..7d28b97f8afe
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c

for pure kunit tests we should use _kunit.c suffix instead

[1] https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/dev-tools/kunit/style.rst#L188

> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +
> +#define GGTT_TEST_START		SZ_1M
> +
> +static int ggtt_test_init(struct kunit *test)
> +{
> +	xe_kunit_helper_xe_device_test_init(test);
> +	return 0;
> +}

nit: if you are not planning to add custom initialization steps,
just plugin the xe_kunit_helper_xe_device_test_init() directly

> +
> +static void init_native(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = min_t(u64, SZ_1G, accessible);
> +
> +	ggtt.hw_size = usable;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt.start, GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt.hw_size, usable);
> +
> +	drm_mm_takedown(&ggtt.mm);

but maybe this should be done in a cleanup action registered
in the custom ggtt_test_init() ?

> +}
> +
> +static void alloc_usable_pool_high(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *usable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +
> +	mutex_init(&ggtt.lock);

this too

> +	ggtt.hw_size = usable;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
> +
> +	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);

did you run kunit with --raw_output flag?

did you see

	xe_tile_WARN_ON_ONCE(mmio->tile, !mmio->tile->xe->mmio.regs);

as likely GGTT would try some TLB invalidation ...

> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
> +			GGTT_TEST_START + usable - XE_PAGE_SIZE);
> +
> +	ggtt_node_remove(usable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_usable_pool_oversized(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +
> +	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = usable;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
> +
> +	node = xe_ggtt_insert_node(&ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +static void init_shared_pf(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, accessible, accessible);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt.size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, 0);
> +	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
> +
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void init_partial_overlap(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	KUNIT_ASSERT_GT(test, accessible, 0ULL);
> +	KUNIT_ASSERT_GT(test, usable, shareable);
> +
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, accessible - shareable);
> +	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, shareable);
> +	KUNIT_EXPECT_LT(test, ggtt.shareable.start, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
> +
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_usable_pool_low(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *usable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
> +
> +	ggtt_node_remove(usable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_shareable_pool_high(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *shareable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
> +						       XE_PAGE_SIZE,
> +						       XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node),
> +			(u64)XE_PAGE_SIZE);
> +
> +	ggtt_node_remove(shareable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_partial_overlap(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *usable_node, *shareable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
> +						       XE_PAGE_SIZE,
> +						       XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +
> +	ggtt_node_remove(shareable_node);
> +	ggtt_node_remove(usable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_partial_overlap_usable_full(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *usable_node, *shareable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
> +						       shareable,
> +						       XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
> +
> +	ggtt_node_remove(usable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_partial_overlap_shareable_full(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *usable_node, *shareable_node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
> +						       shareable,
> +						       XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
> +
> +	ggtt_node_remove(shareable_node);
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_shareable_pool_unavailable(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = usable;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
> +
> +	node = xe_ggtt_insert_node_shareable(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +
> +static void alloc_shareable_pool_oversized(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt ggtt = { .tile = tile };
> +	struct xe_ggtt_node *node;
> +	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +
> +	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	mutex_init(&ggtt.lock);
> +	ggtt.hw_size = accessible;
> +	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
> +
> +	node = xe_ggtt_insert_node_shareable(&ggtt,
> +					     shareable + XE_PAGE_SIZE,
> +					     XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +
> +	drm_mm_takedown(&ggtt.mm);
> +}
> +#else
> +#define GGTT_PCI_IOV_TEST_SKIP(_name) \
> +	static void _name(struct kunit *test) \
> +	{ \
> +		kunit_skip(test, "requires CONFIG_PCI_IOV"); \
> +	}
> +
> +GGTT_PCI_IOV_TEST_SKIP(init_shared_pf)
> +GGTT_PCI_IOV_TEST_SKIP(init_partial_overlap)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_usable_pool_low)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_high)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_usable_full)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_shareable_full)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_unavailable)
> +GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_oversized)
> +
> +#undef GGTT_PCI_IOV_TEST_SKIP
> +#endif /* CONFIG_PCI_IOV */

instead of defining test stubs, just add separate suite

 +static struct kunit_suite ggtt_iov_suite = {
 +	.name = "xe_ggtt_iov",
 +	.test_cases = ggtt_iov_test_cases,
 +	.init = ggtt_test_init,

under the same if ENABLED(CONFIG_PCI_IOV)

> +
> +static struct kunit_case ggtt_test_cases[] = {
> +	KUNIT_CASE(init_native),
> +	KUNIT_CASE(alloc_usable_pool_high),
> +	KUNIT_CASE(alloc_usable_pool_oversized),
> +	KUNIT_CASE(init_shared_pf),> +	KUNIT_CASE(init_partial_overlap),
> +	KUNIT_CASE(alloc_usable_pool_low),
> +	KUNIT_CASE(alloc_shareable_pool_high),
> +	KUNIT_CASE(alloc_partial_overlap),
> +	KUNIT_CASE(alloc_partial_overlap_usable_full),
> +	KUNIT_CASE(alloc_partial_overlap_shareable_full),
> +	KUNIT_CASE(alloc_shareable_pool_unavailable),
> +	KUNIT_CASE(alloc_shareable_pool_oversized),
> +	{}
> +};
> +
> +static struct kunit_suite ggtt_suite = {
> +	.name = "xe_ggtt",
> +	.test_cases = ggtt_test_cases,
> +	.init = ggtt_test_init,
> +};
> +
> +kunit_test_suites(&ggtt_suite);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7fcd686f9729..19f9c564030b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1397,3 +1397,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
>  {
>  	return node->base.size;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_ggtt_test.c"
> +#endif

