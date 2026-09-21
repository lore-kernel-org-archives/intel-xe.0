Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99982C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 14:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CC310E815;
	Mon, 21 Sep 2026 14:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPHXJSnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542410E815
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001947; x=1821537947;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oWjLC0M0mCOdZZDK876zVLW8KPyBPf4H6RV5wBtgx4A=;
 b=HPHXJSnjgJYPGFv+E/UtFFbtOQ8RtWS6weq/kh7rYkOiFOGsKx2o3Y2G
 RHZCYPVJ6xOS0J5+gtJn1dZxh/JAedAfTAusS0Nk4+AAkHsobvJG/fegm
 wTG1g4K2Fe3yVuKRr3cxXg68kMAPNh38QkcRoIv1TppPZkkec/xAUBeay
 dyeX5+t+DFz0AoFMt6pU/xkUPd9S4QyZbNEz1K0oKTC/V+7dmcNjXRdwu
 6TL5AvDpGXLF2Rb4kNdWCkcrNfLkbthlQnAlmNBxYWWn+RhbhzSi9XkJq
 WGXnJy46FyxffQMVvqmMrImFPkuAFUXc9725V4F9D3kaBSFZPeGSCKJoK A==;
X-CSE-ConnectionGUID: ZQf8/yYeRY+670ZS5pzUZA==
X-CSE-MsgGUID: L029nQ1AR5K43fbBvAkORg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89443646"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89443646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:45:46 -0700
X-CSE-ConnectionGUID: tMYyjwluQJOxDGCxE/B44A==
X-CSE-MsgGUID: pfx7uV8uTruI3SXuhcrHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271199823"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:45:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:45:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:45:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypJvR0a4JFQRHvbLA7gtvJMAO1/QdlmaCTTk2JNtk8IAxkMkzw7ljlQnmA9kHfJf/9Ta/p1Kg0k3oBhJpKR3MXtMCL0EjWEVVFWD7hjvHzCiAwS8FydKZ9sDb9dJavmRv2VHaV1Z15ymGGij0ssE4fiNad50kgxB7pVzo+G1RLk4YTklK1HOjAisIfpTNE554KIxZm7ZfJ0lKfjmydtKkIqVbHZA5GkGeawaVZm/29uhbXsYIaw5im2FuMY7NzZtfRsnbJzn2XjT8DBklQJ17M78zoqh1jeG5O0s0Z0KscoVXq38WfbRWPqYY8xeuM3OkqDuAYngUnGw1We/v/amBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BErGvM6vCk02KTreXlBrK6nuCSf6k2BDzpl1V6VvvRg=;
 b=t8dap/vFQ0nljHrRjeygcRFhF0sEOW0Xvlx+iTeTpYOEuEhWhq872HuApTVWVN3HPW5ImfsMeKd5Utr0HW7/zRhmxY3q4Zy6Iv++M6v6pn1yJM5tNcWRBdtfuCJW537faLBHGZ6HADV+pGnsZyXS/x1q+kW88QQJnR1raxy8OJokhHZUpn4teE06YunE3HaEiPUW6MzZq500K3WKs9iyPOBSDpzqsL+9GVdaXgxSaWmPDwEWlHqkqH1Z/yLcy1nad6dSW/wuOfJgpOVDrApW+rJ0scpOiYmf2UkZ0tk3HVDjzTPlGXKUXJwuRciVZ5OWUZv9ca3roPIzJ8iiAKk/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:45:39 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Mon, 21 Sep 2026
 14:45:38 +0000
Message-ID: <08702f46-6fd8-4dc8-acfd-d516cf3d447d@intel.com>
Date: Mon, 21 Sep 2026 16:45:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/10] drm/xe/ggtt: Add KUnit stub for
 xe_ggtt_shift_nodes()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
 <20260921092101.1243989-21-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921092101.1243989-21-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:802:2::37) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS4PR11MB134916:EE_
X-MS-Office365-Filtering-Correlation-Id: b30877cb-6435-4fff-0d93-08df17ef00a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: quCvw2cM66TwmfvtXtoSUZ4J90TCMaYxPdPogLCwwcKSzN03x5L/V3c2uFXdiUtpvufQJC/QIUV+DpJKKCTzK3byVWpBafCZXc7yF1F1akmPWNFli05wRSdAcorTrHGLzPIocZbhyamCNKYCWMRh98Lh4rL26SepP53+wavbLxPi25Y8uPIkUYtW7Vw66RsqPX+2GprYzEzftu1STwC5GbEP2DjpT8/irjKTdCRYX2+gfjOlv+9ZT+AjZiBv2QgbAKRzefeWa7GmJ2sH8LV/SwsR7anZYNxvLdjCTk5A56+KiT+g5E6IxNensEEFoAbYp46gbfARS8pe4PFXkfMca5f8P3lbLK7WoJlGrKy8gZ1W+qJziDblLClWbolnJn4WOOVDGxNgOMet3H1stPO5XHNoluxoDoR8nc+anriw/7HUVeCWzRtMGS2uMytaS5wGHyjP9k88YsvV7tLbCX1jOnfbQIvZURwWSZ05+Y+3QQbne8Ghgc+QKRZJUnN4veD0ZnQ9jSymwG9cFMUrMmuKkEMkE9DLZAjBZinzqLDhphidomjQPwW8al7XyqxZEsYdj1jORepsOSi5bAL86Nmo4UYPxKShmj6LQDDBVIxkZUryUPqI8HZJCQg7u4hKTpoT5r3ifQH/2SdFp1lFd1bQVqlnbgqqHgNko8s4gN1bcC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpmV3BRM21XemdEb1dCeGlMYW14WVdPYWJDMnNYNzhkVFBHOFRTUTRhb0lD?=
 =?utf-8?B?RDFCRWhDVEt0R3RRVzA0SkpObEU3ZTR0dGVUalIyeDZtRnFuY1lnWGpjYU5I?=
 =?utf-8?B?VW9IM2JPRXZnR1cvUExwV280Vm1FVmtRNU5QTkI3MkQyMVFOdG85bTZ2eTNU?=
 =?utf-8?B?NzBBZnJTeU5CbWsrUHJjT0NuYVgvUXBEVE5hSzltNk5oMTQ5NXlCNnhET296?=
 =?utf-8?B?MVB3QmptVlhLSEIxMWZ5d1Y4eUUva1NQVU8wc1ZPZGVDMi8wYmhFdjlqVTIx?=
 =?utf-8?B?N0trVmNpZi9GYTlUeUQ0WWw1ekxsOU5Pd3JFT1hvLzZ1WHNkcXFQK01YTFI4?=
 =?utf-8?B?Rm5KemJscmFjd0RLZEpwdWR0TEt1dEs1a0JDNzdiK2NiakFvSnlBaEFDdzhw?=
 =?utf-8?B?YXc1Z0ViZjNrelNrZ3l3YlE5SU15NGRybEFCZUxKaUh2M1kzVThiZXdUcVc0?=
 =?utf-8?B?Y3BOcVR4ZTE1bnNXdGdSRjJQWmJNeEZ4cUFSNERzb0hjdHpYWkE1R0NCcjA5?=
 =?utf-8?B?anZkaUhUbmtJM1ZJRE1wSHYrYzkyd1ljNWFEb2VDdHJ4UElTbjNyY2VobzlI?=
 =?utf-8?B?RGJjclVOV25oa0F1dGpPRTByRWFuSHZ1ZnRrN0t6TnRSczFRai8rZ1RrUWRT?=
 =?utf-8?B?Wk9qWVZBVWpTUktOM2FNb01KcytEdFFjbWU3QUhjMGxjOXJGeXMyRU1INUR1?=
 =?utf-8?B?bmtzS3czQzJlUkIvME41TXphb284WWFLVHpuUTZlZ3hoVXpsY0FiNk1ZNXhu?=
 =?utf-8?B?cWFBTVJnREJkRmZrN0prcUFkT3NaR0dMa01HdGVSMFNmaWdva0RtZHRhak16?=
 =?utf-8?B?aWtWaTRyS0x0Z3FyaTlvdjcvMEFpS01NMTk4VmdqSEREMDN5ek85RUpvZThY?=
 =?utf-8?B?cTZpUnhCbmxwWEFsOUhaUkJoWXdrNUtjazhIMU9NT2pHSm9LTFRsTmozVjVj?=
 =?utf-8?B?MUZkdlhCZE9YY0tkRzg1UW5RMW9rK09NUmJ6dmtOOFhOMnhmU2I2L0ZDbktF?=
 =?utf-8?B?VzZmMEZxY1Rlc0hLUUN1NkRNd2t5UC9oTlZ4d0NhN29KVzBCSU92dE1nblc0?=
 =?utf-8?B?QllwejN6R3JrOFZjdUIxV3pQQ0V6b3BJd0d6L1NJcTVhMzVnUEY3ejZYWGFS?=
 =?utf-8?B?S1J6ODdFK2NYTmhFTHpvZGdKdTVNakNkODV0OVlKcnNtN1NzdFJNNU5jYmJm?=
 =?utf-8?B?Zk9ZY0xUaDg5NVlGYTZFeDRXY0JnbnpRSjN1dDdxSGJmeWJPNk9KcE94QWN1?=
 =?utf-8?B?SUxXWTBsaDVLM1BUcE1mbms0TllwUFpEQXZGc3hud1Ixc0JsRDJZN2wzRWxX?=
 =?utf-8?B?ckF5Zy9pQVovOTlGTTVuaExXRFFOUHBGVzcyNVpqSHM4UTJRYi83QzRoelVj?=
 =?utf-8?B?eEwzZzBhc3NQTEpNN2I1djMvWnNPNnBOeDI3V0k3MmdueGJQVmRmc0VkcllP?=
 =?utf-8?B?LzB0bkgrN0d4akc3dWplZXJ3THI3SjBpemFnSzlIWGczQ21Dd3M5WW1Ra0gy?=
 =?utf-8?B?RzV5Mml0Z3plSDBxQ3lkVnpmZmdZd0E4QXdUYm5PSUVtRC9KN0tKVXl3Y2t6?=
 =?utf-8?B?bytmL2poUkFISHdONnVBZDR4K3FxaURxL3J0S0ExRWh6Yk02b283ei8yTENP?=
 =?utf-8?B?VlY4UnBYQUkrR0VNYmdBYTJrWFRiSG9wWjhIWkFXdHJTMHc3dy9Tdnoyd3Vu?=
 =?utf-8?B?eS93dVNyRE9aeUdPNjUzdlNNTlc5S200WXh6aVFCWk9MbFpVOU15c2Z6Rk1k?=
 =?utf-8?B?Yi9uUkN1QzFvaHFZWUEvNE4rREsrQ1dwb2VaY1N2dkpxTDgyUFJFS0dSQXly?=
 =?utf-8?B?OXp3dzg3YU9kbVVCNWFtTmdEQ3JMb2dHV2VNV0JTRHZWWFhZemxVYURVdzZy?=
 =?utf-8?B?UExaV2QvSlFieTRPOXpMUGJoalk2Z0Z0Q0NMa09EZE5zSXppeEh0U3UxbnJV?=
 =?utf-8?B?VXF2a2liSEJnT2ZPdVl4VWE2UVlSY3dUbDkrdksvT2lFVm5DQWFTYmVtMXZw?=
 =?utf-8?B?Rm16bWNmaHYzQ05pa3JvTmlQU0MxWTY0blVDbFpmRmI0N1c4ZVR4SFVSdGU5?=
 =?utf-8?B?QWZ6aXNKTE56cDFOczJPNnZCUmQxMDFaYmMva1ByeWd4NkVNMmsrWDIvOTVh?=
 =?utf-8?B?YjRaZUx3enQ0cHJYRit0U1dlaUdyT3NXNW5lM1AzZVZ2Rm51NTFlcjk4OGpz?=
 =?utf-8?B?RXpyNmZNaTZYRkVZZjdhVVg3UElXK3p1bHluWWxPWFl0ZTc0QnB6SjJKYjN6?=
 =?utf-8?B?cXVSQzZWWFZ5RFhnNlpPS3gxNGtBcjViTGRpZDRZTG5aNVNVSFhpMGdNMW9n?=
 =?utf-8?B?ZkJ6dEIzak1hdmVBS1VPMk4zaGJmc1U4Z3hVQkxNemZDT0dQYm1McnQ2clZX?=
 =?utf-8?Q?eUPjqt2xcdNfaQ0E=3D?=
X-Exchange-RoutingPolicyChecked: VhVHqjCxse+Zbx7dBqnSUR5rd4ixSsc5cf7EW7eYfZJNJK0z1UrxfD6Mms7l4FOHpb8vSp7z9XulnRNpSw3F3vKsSMvPuSr7NYyT976SaMRv4m+6jRJfjEiWFk8F2eicIlPh6hTm/0tQUceh0x9xRi+KK8UNMuDG5OKLOyORrK58Dwkn2rXJUx6RN082NGR3xu4aji2CecZe9mS9Ny8rZi+S0A0egox3hA7s04OBZYHjoacv5FBz29Bw3Zm3VAc5nYXcz2kJyBOCpfCOazKz8eBB0PcKMvtIFVGbyLbqd+QophaW0oRJ1WnQY4ClpBKcDwhwZkHmqvwJHm1DGeAUvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b30877cb-6435-4fff-0d93-08df17ef00a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:45:38.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2ds9zHms9u4cYE393ZbECdcR9iKpK1gzUCiNQL0lqy8XOOtZ1NCCnDKhVDX0XqQWwXedIKWnD8SMCIxozaQuw6sUGWI3oZNhTdvimIq3gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB134916
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



On 9/21/2026 11:21 AM, Satyanarayana K V P wrote:
> Allow to replace xe_ggtt_shift_nodes() with a stub so that VF GGTT
> provisioning can be exercised on the fake xe device, which has no real
> struct xe_ggtt instance.

hmm, but we do have xe_ggtt_init_kunit(), maybe you missed something else?

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2557e51bb7cc..082a6bbef01c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ggtt.h"
>  
> +#include <kunit/static_stub.h>
>  #include <kunit/visibility.h>
>  #include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> @@ -654,6 +655,8 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>   */
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_ggtt_shift_nodes, ggtt, new_start);
> +
>  	guard(mutex)(&ggtt->lock);
>  
>  	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));

