Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC3D10F995C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 18:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD2910E6BF;
	Wed,  8 Apr 2026 18:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFJ556ja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4510D10E6BF
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775672483; x=1807208483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0K7Osu0e6cvw24pyMtjdE4MlNnvLssbZ/a5O1luOSj0=;
 b=UFJ556jarHB/mi7eLfS+EL8m4YzknbDNokWkwVLkkxGxyqb+8jjq1eCy
 7Hcxg28UNCYysAyt1pAMGMSpnS8JXaKPhowpKBOUjeehV5J7LSeGbxUiz
 V15OHhyflYCKc90pJvWEVjob2BSVT4I8ccESuXCjPQ/QW6RufFsTRWysy
 Tu36LiKgGMTc/b4DLCt4XwdLZJiAXb0+eMDCCCdlZwYotGi6WaPqi60Gb
 ZzWL1H1zP75fN6e+A+PL4/8GNUl1g7mpIWTdSJjcTH2JTu+zYPyVf1+jE
 60GdAaJHASmBzcAwGZlYhmvNHmotvuGfEemdtjovKAYY+LVKe62t5Rd5B Q==;
X-CSE-ConnectionGUID: Phv/5+jQRCGVaMXstFnn3Q==
X-CSE-MsgGUID: rZSWMcaIQ6C1Bc15YqS38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76547260"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76547260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 11:21:22 -0700
X-CSE-ConnectionGUID: NRV50S5tQAa+0fOBrpX0BQ==
X-CSE-MsgGUID: OwMQNHQ7S+inBpupqtIMsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="266520467"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 11:21:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 11:21:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 11:21:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 11:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHy6TY5X/n6Lu6dwqKnqiaGivhh3b/wrUGCtp25LlN9bl4nMcskVa/0uGpe3SVKp/AicBTmJDCrSMsNTkMnBffV1jH3btuo7HLFCUJwoi8bnYZs18jZzCAwjqKKI7X+O0DA8Yy0vQFT4mDSS4e7tWO1vRaaOsJNx+89MGLYAYfnviWbgmCKsBuxWfHaPxMOHYxPPlqCMVPcc4OsyNPSdjS9XPUcuIqynk968086FqKOn95mUX829kc4RcIZM8AfQltOA0V4HpgEUZJXU710vs97apym07kV7ZjAQE4M+PWDd9VYZIBvqMmizfV8PfUKUMi8YTnrIZLNjTwnsCWUUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uSDm8bRJLFu4JJuhDmLBNbXgZFq6jGMprRbCTkjT8g=;
 b=CJuT2cvNuszF0qOmMqOhqZgA3sLAD41KYTSUCgHjm+l9Ax07dEQcvusmoC3F7Wl4GAkpQLXzBTxxyqBvU3SCHqzZxNmSw/PViOiNk/WXwHckXzj2U1nLZG3Lojaxf3kbg+x9h+rb/wBYmoVZHosSHolF4BvSnvHLTQZLjKOSE9DpecrdBunseBRhXU+K31kd7vKLLR+MVD5jmG8fWM2JBi2Di3Jh7UU9f1iMcOAs0B2Rrab/ywB4UGMbmBI/RHrvw4J1oXjdlhTtFHTg+qNatx30AL6uYPXmi32G+YcFl5+HEUo3D2IEi5KTLMP/qlBS+TKghEmSkC+pNWeMix7rng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ5PPF0D019E8BF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::809) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 18:21:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 18:21:17 +0000
Date: Wed, 8 Apr 2026 11:21:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <adaclWS7g9Ek5qZ3@soc-5CG1426VCC.clients.intel.com>
References: <20260407030219.444060-1-ashutosh.dixit@intel.com>
 <20260407030219.444060-2-ashutosh.dixit@intel.com>
 <adWJ94RCOcgtFpTk@soc-5CG1426VCC.clients.intel.com>
 <87o6jtzcv1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o6jtzcv1.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ5PPF0D019E8BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 025d4880-6e37-4c29-03bd-08de959ba011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: GFgjYT07RQ0j12vWuwsuRH24CS9cipheBMHnF94LqXkxKpKnE6o9eZZZmuPAimKefa/p5hjsBnAfbuERnDQoU4Z8Hldwhl4CFh4KgVV7vjY72JA9AUtuOq33seSEYxkTGuIsnH6nRTPWUdsbu+bteZeNuuIN2L18x8D9uTdtiix62ijQ/vRgfoIsmyaI681aUKfOM4ZpPglysl5FeagjSThb/YEbrrmcyw5Kq8ts/M3GjLV03O4SmauX637XWzZYg0M+jljrYGfkxENw0MEv9/99eU5fxEVJl3iXRjmDjSlbB4nLGv5E7xdu3tbynpA9dVCOUkPktkazUrwTMx7b0LPZkPtxJ7AP+BxU6fWgcvN0wN4WY0338itNmZ6MQCxU2ewQprKwVqe3RC2p+b0K8qNg3UXIn7Ixwatn2KIbHi1uf8XLCDAwuHhJdH0ptJ0UjmbGzFvfSRnBiEOvrm5/cZIHaCRCpcik7TAjeL01BNupTPfKL4nICGkm0hSCW2gC1oFG8Oto3Yy1Wk6bXGtMweIU7U/6qL5xA2EPLIDiqnIvCUOa6Qy7j2fqIOz83XXJdbm1nSV324S+5mQixaFWjpePtHY7kJ71dT9AiEsER9lxyy1/5htl0eiGCVZcPImYZEjoDhMfNX0lU1wbllHmNzv61ppR6xBL49MfE35SaLo8dxHKYOletdZ8qIXBYNxNRw2tQKx97gHnDkIRRNXPq13uk2L6ce1gC2/+15ldkcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZngyU2ZOKzZhbm1qUTRzejNHekd2aG5GbmV0UlBQOVFOamV5dnh3ODBGb1FL?=
 =?utf-8?B?dGpMdHFDWXY3Y2plT2pYQjI0Mm5jcmhUMTgxY3FTVmF6SGx3azYwbkIxVVd3?=
 =?utf-8?B?ZjQwa1E3OCtESi96WHJrYWFDZU95WnRGS3pDS09Kdi9FYlRROFBnaHk1TGdC?=
 =?utf-8?B?ZTBzL0o3d1JxTm1pbGFVWmh1SDhvNTAzRWZjUVlrcjIzSU1QUm9VSy9RV2FH?=
 =?utf-8?B?UDRtb24xdDZpZ1BMUGh0R3FTT3hQWm5GUDl4K3NZWmJRek5Ya2x5RTNjTzds?=
 =?utf-8?B?MUxPYUp6RWoxNEdtTS9ZSThJYVZrenJqbzVwUk5NTGJuNENOTkFnYmhZMUdT?=
 =?utf-8?B?c3V4QW40aFZ2bnFRdnRVYmo3V2lFd1BFOFdpUnZqSitFdjhBd3BGeVVabENX?=
 =?utf-8?B?VVlVNWhOY1NEaXpTdUk0eGpzdGZ3VEw4ZWxBR21yRTNKaWhvUi8vTW5aZ3ow?=
 =?utf-8?B?SXpBcXZiZkREbFA0KzFTN3NCV0I0dUNPV1p3OXhXSUhnVm0raysrM2YyMGsy?=
 =?utf-8?B?VVBtSGtUemZQZElVK0N5UFFhb0ZPWDM4ZU1OU2kzai9DK2h4Vy8zOEVFYkx4?=
 =?utf-8?B?SU92TC9XTEFUaXQrWG0zTWFHUzhQcnA5T2taaGJrdzlNRFpJY2N2YTJ4VTNC?=
 =?utf-8?B?OWNNSGExTTE2bHUraGh1WDNXV2Q2dWhaRkxkbmhiSWZEdFYyMkxzM3RSQ213?=
 =?utf-8?B?dkRRNFFzVVFabmRuRWFRd2RaQjhDVUNNeG11bDh1TTZnV1pkU3QvZmxPbFJw?=
 =?utf-8?B?dE5CcDhxUXdOVjc3UExJcjQwMy9PMXFhZnVoNWV2RXJqN2U1VXBvY29YM1Fs?=
 =?utf-8?B?Uk9ZMU44NGRsVlNmWXZ3dGNCMDIvSlBacUFMT2VYMkI1cUFzS2hZM0JuS3Rx?=
 =?utf-8?B?MlFWT3VBQjg1SjV0bEtaMWtTQk1DZ05sZHVrTmd0Ty9wMkluUlJSK0FnNXFY?=
 =?utf-8?B?cEN3VzhLWjJOaWExT3pDS1k4amJsOFRjM2k2YS9KSXd6SVdvaTBmY2VOQk9q?=
 =?utf-8?B?RXhmaVRUZlR5UE93U2dCcUcyR0RpUlEwQXRDdnZuMU94bTVXWTNsclNVeEJX?=
 =?utf-8?B?aHVFcUVnQmpsRkw5aFlVZE5XbWtCT1BkdEtRL1FXMHk4ZUVLdUJFZExsa3hG?=
 =?utf-8?B?cHhkTmdPSTVZMXIwTGtnTG9jV0FtWkg3RUQ4T1VRSWJGVHVxamF5WE96REho?=
 =?utf-8?B?NjlzUEdRUFNrVnJBVjMyc0J4ZnY0ZzVvZ1NVT3o5bkFUblhWQTF3SkpwNThp?=
 =?utf-8?B?UEEycm1iRUhUSTVXbVhUUUN0bHdvbSsxSWtULzlaVzEwMG0yb21xWVYraUF4?=
 =?utf-8?B?dDJFRzM3eUlXN0VtUHFENkNEa09Ic0Q4WWtSanZiQmhVYThsR1dxMHAwanBF?=
 =?utf-8?B?NFFhMzBwL2hCVTJCcjEyVkFiaUVreHhsYWFwUVAvTW1tR3NLbm13eWdoS1ow?=
 =?utf-8?B?NGJwY3BnbU1ZOWtheWJFNFMwMzlvUmhJRWtBMkRtQlRQWkhpMmFlUnV4WkNT?=
 =?utf-8?B?RmQ3NHBiSFdUTTh2cjRUS3A1NnlIMDZPeHA1V0xKRjRHUlJ4cW9ZcEhXbXQz?=
 =?utf-8?B?U1VWS2k5alQrNW4wZ2toc2F4Zkh2SUpUK3YrK2xTSjlJRHY4d2VtYjNzUngy?=
 =?utf-8?B?Qk41RDhhTzZZWTVEbmR1Q0lwUWdnVjQyVFZJZks0NXhhTFovUzMybVZMNjVh?=
 =?utf-8?B?MWZIckMwQXdvdS93MDVFdXp0SHZ0dTBqWFQzOGgwQldUak41R01qb3A0VVJh?=
 =?utf-8?B?Y3FyZWdRWitwQkxOZDhWUVhYcjNSZGdIblpvd1N2UXdMTE4xLzY4YlpxcFdu?=
 =?utf-8?B?Yjd2bmhLamw4NnlGbHArS3d5amRyQ3YwR2xTNjZncW9USFdqQ24zSHN0TGVw?=
 =?utf-8?B?VWUydGJwLy9oSlg1NU1NTkZ4RS9KRGJEYldSOHZiOFZlNnNWUUo4QVBXNFRI?=
 =?utf-8?B?VTIwNTRmaU8zdmJSaHR4aU5EQWMzZ1BncTluVDhsV0lVUzVHc3JOWFR5YVlZ?=
 =?utf-8?B?aks2MjE4aFpHU3JFRVFtY2tiajB3THhFQ0lDeE1ZZHNFeUhtS0cxdktIRzNh?=
 =?utf-8?B?TitUN1daM1hYbnppQUlJazNJQzQ5dHh0aGdBSDhBdUNEZ2lwMTBVcVJwdnhT?=
 =?utf-8?B?TDMxS3dGMVdLTk9FSThHU2RLSTROYW1ydDZtZWN1ZnEyaXFrUjZNZjMrN1hB?=
 =?utf-8?B?b3BWZjdtS3VIOEdxQ3BickNwZmRZNjVRSm14ekNqbWw3YlIzQUJ4N1BWL1JE?=
 =?utf-8?B?TjkvWnB4b21UWjljdVI3QzV6UFVCYzNGNFhXT1dQT05kejkvN3p3R1Z5aUJv?=
 =?utf-8?B?cUNPekhlelF4QjdSUVVLdHVVNFZsWUY1NEw3Sm9wV1l0dVVhNXZhRFJ5ZUp3?=
 =?utf-8?Q?5o01+dv89HxcFVnfoD78q1DM1fdefArtUwUfq?=
X-Exchange-RoutingPolicyChecked: fEMYOhTpgPdZsNsQnbcsbBa+KexpM8LoHzGYOXfgEVUqnDv5tFZaZZlPUdvjgvD4KIuV/FzjTDfzVxwUPAfCUYH4mEtnoDYPXNJupUzxF604Bv5Z/qKla0H2RHj56O9Axw6wCF8rA5albqY3uuxZ3QSrjXlikeOiB+YMMlKVqhXgnF/YAZG0iKUVxNaEDb/G/HMDbczb9Skqjg4cEd5CcasBlegFcJCEjjb2ap3s3OtJTB1qa1M3A5BA7DllT8/peLY34c5qLCSK1RbV0vryrbR0CkSSJwKUHwm64yuKXDH/QAEMgqCQlYYCyaXdOr+Un2T4a/ZuoV+iSf95IE66LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 025d4880-6e37-4c29-03bd-08de959ba011
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:21:17.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Fw/9PqpsEiA940Cjm2XS4OVmELt0twmeq6QDeMzO46RvLT9IQqRFX2Xbr74B1CyI58mKY5Ql8rXub8y5NO/B6t55dG5EueGAJ+uLC/IuCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D019E8BF
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

On Wed, Apr 08, 2026 at 08:32:50AM -0700, Dixit, Ashutosh wrote:
>On Tue, 07 Apr 2026 15:49:27 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Mon, Apr 06, 2026 at 08:02:17PM -0700, Ashutosh Dixit wrote:
>> > @@ -311,30 +317,37 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
>> >	return HRTIMER_RESTART;
>> > }
>> >
>> > +static inline unsigned long
>> > +xe_oa_copy_to_user(void __user *dst, const struct iosys_map *src, size_t src_offset, size_t len)
>> > +{
>> > +	if (src->is_iomem)
>> > +		return copy_to_user(dst, src->vaddr_iomem + src_offset, len);
>>
>> I think this requires xe_map_memcpy_from for the iomem case.
>>
>> > +	else
>> > +		return copy_to_user(dst, src->vaddr + src_offset, len);
>> > +}
>> > +
>
>Yes, you have certainly spotted the iffy part of this patch. However, this
>situation is not that simple:
>
>* xe_map_memcpy_from or iosys_map_memcpy_from copies from iomem to kernel
>  memory (potentially using special accessors for iomem), not to user
>  memory
>
>* copy_to_user copies from kernel memory to user memory (using special
>  checks), not from iomem
>
>So in the kernel we don't have functions which copy directly from iomem to
>user memory. That is, functions like iosys_map_copy_to_user() or
>copy_to_user_from_iomem() do not exist, because they would need to combine
>iomem access and copy_to_user (likely copy_to_user will need to be
>rewritten with iomem accessors, if such a function were to be
>implemented). There may be a reason why such functions don't exist in the
>kernel.
>
>Another way might be to copy from iomem to kernel memory and from kernel to
>user memory (that is have both iosys_map_memcpy_from and copy_to_user
>calls), but this would entail an extra copy into a bounce buffer in kernel
>memory. Something like this:
>
>static inline unsigned long
>xe_oa_copy_to_user(void __user *dst, const struct iosys_map *src, size_t src_offset, size_t len)
>{
>	void *tmp = kmalloc(len, GFP_KERNEL); // kmalloc or statically allocated tmp buffer
>
>	xe_map_memcpy_from(xe, tmp, src, src_offset, len); // extra copy
>
>	return copy_to_user(dst, tmp, len);
>}

I did notice that there wasn't anything like copy_from_iomem_to_user. I 
was imagining you could copy over 32-bit iomem words into the user 
buffer using the iosys_map accessors. That should be possible and would 
avoid an intermediate buffer.

>
>In our case, xe_map_memcpy_from or iosys_map_memcpy_from are basically a
>memcpy (because vram bar is ioremapped, special accessors for iomem are not
>needed).

Hmm, then why even have this patch :). fwiu, you are accessing the OA 
buffer using iosys_map accessors in this patch. It should work without 
it because of the above statement.

If we go the iosys_map route, then let's do it consistently. If not, we 
should just drop this patch. I would lean into reading 32bit words into 
the user buffer.

Regards,
Umesh

>Therefore, to avoid the extra copy, I decided to drop the iomem
>access part (since the copy_to_user part cannot be dropped). Hence I end up
>with the xe_oa_copy_to_user() above. The function was tested on BMG with OA
>buffer in vram and works as expected.
>
>I did think about renaming the above function xe_map_copy_to_user() and
>moving it to xe_map.h, so that is possible. But since there are no other
>users (and none are expected) at this point of xe_map_copy_to_user() apart
>from OA because of this workaround (other observation stream buffers are in
>system memory, not vram), I left the function as specific to OA.
>
>Let me know what you think. Thanks.
