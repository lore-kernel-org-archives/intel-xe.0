Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F5C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 11:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0917810E0DD;
	Thu,  4 May 2023 11:47:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2101E10E0DD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683200843; x=1714736843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qLljpJO9v4q898y+Y6Iw6Fs+QwWD3Gw7Mas8VG6pRMs=;
 b=g8okEwSXmG+JBpVWTUSyuZOW+VyQKFCiw37KZ4AkT3u7Z8IDa5q3JYP+
 gJNgiiIQq/Qjrk3kJq6p2bb/MjTjcmsawloFGo42EgqKvggCvlraDaIg3
 lmjjaLEk5EUJOa6+d+6lkaShK3+4ikolakNYgZnamScFr65gIdRPyXaux
 2t+q1Z/aWafbctodRR59tso1KeC4524uPjLcft3cZGjvrlh2qcAS7f458
 TwHwt3BJtvQ2uN1Hr2qHrFTF2jg6nqxg0/rQvM3t7/TOUPm0ijkS58dDM
 b/HE1LLiVLa35ijrKCRQJBXIbn3b4+uxuvEw5cgboB4sf89GvwiQhWORy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348955284"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348955284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 04:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="696997333"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="696997333"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 04 May 2023 04:47:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 04:47:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 04:47:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 04:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdtLamv/JLwFCWUOI0rPkhVrotnAksBIqohak2K4oDlf/PidDQJkgkump8FQ1FnG01ZMaYJmpog/rCTMZY0UsYTNCg+YmEeDXBiJQIv3THA2AdDo3JfFCa3mPQdMu5QRJkYAeA1xDDvLNNBxowYhH/7M5o9CbixzsV7ssX1S6OznzMjo7G/8KAPQ1yOclvugw2Gpi2jdEB9Xj42TqNxd3sEnffIjjmTRkuRtCgw25CcovkZDyd22CS1viZEAstr4a4DOIJrMKf29PkhvWSrZnTdo/PXrIloRpElnUG0hST0+dLBVARlWKmeL/CCVfp9NItpNtYoxkw1vwWOkHMkHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QglQpltDULA4foEq9zMlmoUCUfR9C+7cpZs6AbAEbjs=;
 b=JCB8RsljcPj6gIksKIUKUkpoFYRBqyR8/Zv+vX41Bcja5bl+1f3LrOENPGK0MZXyoGq1LPVtES1fjnNIT9Juh9RmdY9eTE0ihjwCrKyb58Nytb2s4lGURiXTQwv0JSL1R0GMgpRM4IDA6IL7LqMsLHiyhos0zKHtVtd3qZigk+XqDtgBjvqxeALADWhSDZ04pwrFD2kEeSnUetRcImgTZgU/DDcbUAndBXaXt+zBk0zCtgyWpV+IijrYEFjwqe07E4O3brY7tTcdNOR3uTtlCTnMEzgqlW97cWPoytaqVy5qWgy8wRr1xcoM2VbDcVfIT2vL04JTvohH+xfkbs0Igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 11:47:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 11:47:06 +0000
Message-ID: <6d123507-bc55-c6cd-cce1-0edaaa9987a2@intel.com>
Date: Thu, 4 May 2023 17:16:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-3-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230503064252.830641-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 294721d0-f989-41d7-9dd9-08db4c954815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYXIFCA4yev1wM/uwyxdnUeLM/lGrjyOAQv1zqDy2IY5+T/io4zgBLGvGU7BnGuBugRXbe1UX3Dbs6/gi+Fc46GrE7MrDn60Xos+7lXmvZmFSzPQtDzbyT7pBVyVtPVBXnsJRMIRLQvzl7LqSRP/vhaWsdFyR4elvTfSOh/qc+xx0pxx7o6FSUgYD/2q1WZUQFuyA85gkb6OZ14M4thC2LAfUxPux5hzxNHQ4j+I45exNUxifGVVQHq9ipiwVQMbTnFF6RDZiuCMd0R7lzysVeGAKkNb7+EoZaHy2Ao8bKrWD48U0Zd6WOfkI1ECnILF2vHCmmnnBJ1T0w14lIDIIX3pvRfOLQDZApyiUz9Pq6KWlmFs0mO6SJWVxDGf6tgFwjXrOTDj7jDBMm9XhFo1osAlDxZVlVeRXlb9xkenxWFP1ZBhs5AFB5Cr0DP9sxSOwczuexIzzBM+BvWtiXZEcNtNXYvsBIXZRTWIMg4p0CTgwDnBolRG7mPXfAY3bn2l6ZX6CzImbsiwYf23atxMJrdm1LVp2prKWyA7UlQklv6JoWjGSrK8iG0ZdxW8R1s0TtCG1QcNw4bfxpXg0yrudvC/6HJx7GfLgGVjIsKL3y5eF5iiR/2HCDIKmaeoAompTnh4LU5SydpRFt7LgdBizg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(31686004)(66946007)(66556008)(4326008)(66476007)(83380400001)(38100700002)(6486002)(6512007)(6506007)(26005)(6666004)(2616005)(186003)(53546011)(107886003)(86362001)(31696002)(36756003)(2906002)(41300700001)(316002)(82960400001)(5660300002)(478600001)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTYwY3NaM0JDN1d6dWg1U2dpYkVaSFRHOWFVWFphT0ZsYjd0ZUNaRFU3SnJI?=
 =?utf-8?B?QWpCb0ZuTUtkSmJSNVRlZGR0Slp2UFIzd1Vxakg2djNmU0E2UHZPcWpnZm9m?=
 =?utf-8?B?NHh2UnNKeWpkZ0xkSjg3S05QelAzUmZBb2pFQlNZZGhBV1dTMkRCdGdkRnJh?=
 =?utf-8?B?dXBIL3dBQmVNVExSQkwxMGcyZ0h3S0RtaEJzcGcybU5BeHhkbmE4dndiaEQ2?=
 =?utf-8?B?NWVFQXdsVUhzaVJaaTV6SFRLSlppZkdXTm5YUE9MY2xrcEc2Y0lOeE13Z1d6?=
 =?utf-8?B?R0NLbC8zRmdDMnRIV2hNMVYvNy9vaGZmZ29aMndsYlN0MEJqczFlL0h2dmFX?=
 =?utf-8?B?cTB1K1o5anJwVjZTQUFCVDBrT01CS2NOM3hYTE0vN0pnSi9Tb3JHRlFqTEd5?=
 =?utf-8?B?QlRmS0pqN2tiZ2hraThlaG5vUm8wakJHdkdXZ0JUeldwOUZ1RGZxQ20zeEVR?=
 =?utf-8?B?ekVFSFlMcjdNZFd5SHB5WFdLNE9nQ0ZUSFpKQzYzQmtKakE1MGhCSDhSSU4z?=
 =?utf-8?B?OTAxczJBN3pTQ3Z2ZTZ4L09lVXJhNldYUzNLQlUxanBiSHB1R3c4V0FFbFY5?=
 =?utf-8?B?T2pVZGdRWm5IU1JnTlJRYkk4L2cveU5HUCtmMUJqSm9pRHd0MkMzUDUyOVFh?=
 =?utf-8?B?Z3hMYjEzaU1BRDFQcnlFbmp6RkwxRmJ4S0FsaW5hWVpERlJCNVRicDEwM1RX?=
 =?utf-8?B?UGFxcnJZV240dVVaOUtTQVA4clhOblBKRTZBcUhpaWlIbHZ2S2dUbHE4bWwr?=
 =?utf-8?B?Y21XWDQyRU1FRnpXUzgwT09TbkptMGRRNG5ER2NXeDhQZkZqTGxaTWpHZFhY?=
 =?utf-8?B?Umd5ckRmYjlUSlEra28yenlxSWYwcml2ckYwdnlhUk1kU3Q5dzFxY3F3bFpi?=
 =?utf-8?B?VndQbGJ4YU43YitpbWtXQzlTTDJkZkFZK2tRam9qVUZRYW52MnhLa2JXMkRz?=
 =?utf-8?B?Q3NVVk96encrVUViRlZSU3hYSjNPMHRwNk93Rm5ZeUJFdmc1QWcrQVNGRG1v?=
 =?utf-8?B?dmdxQlhCMmZJSmVQZ1plb1RXNFJQakdpM2hOMnBJVGRWUzY1Ymc4cE1ULzFr?=
 =?utf-8?B?dWthUjZLR293by80NThxS0tTWm0ybmdGbkFRSnVtRkR3TGcyZnhKbzZuVmJN?=
 =?utf-8?B?VjBwTW5laGl1enRURDlZaFZNUDAzcm5MY0hxOTVoSHhaTGZ6Um1NU0toQ0or?=
 =?utf-8?B?aHhQVEUwYVpjNy8yQ2ZQamhOSmlnVGFyMHp6OG9NbkszSUZXdGxvKzhIcVB3?=
 =?utf-8?B?MDM0NWRjdHJ4WElMNGFIYTY1c3FpbXJmTXZjRDJ5eCsvV3FyZVNaYURTSUxO?=
 =?utf-8?B?V2lkV0dOOFEwUmRwNWt3NVViRVI0Vy8vaHg5MkJmK3E3WE9XVS94UTFpUlVt?=
 =?utf-8?B?OWpRY2RQY2M3M1R3ZXo2NHA0TGJKYUpUbE1BMml2SEtnUDVhZmNrWXlCeUhs?=
 =?utf-8?B?TmtLYS9HUlBNN21PVkh4SlNJdGR0NWNGWHI0Y3B3Sk15ZzZqYUtNZkZRbDhG?=
 =?utf-8?B?QSticy92bVhTZnhWaDJrQ3Flb2ZPR0llc2dJMSs0Tko3VTRueXRTUWpFWW1M?=
 =?utf-8?B?UEhmcStCOFQrMnRLaXhhTStGOWhYbjJLS2JSdGlNMk1NSTBobVZNQ2VBdUJH?=
 =?utf-8?B?eG9jemNWRWlsQTlva2NPdTU3TWlTd3AwWEJuTi9ueXhvSXhGTHZTYmEwZzNk?=
 =?utf-8?B?Vzh3cXh1TnB3SFdDV0kzT1FweG85R0loYmpQUGRWRkpGbVJHcW5YN0VjcFh2?=
 =?utf-8?B?MS9ZWTRLNngwMk03OUtqVFpxMXZDaThzb0QrM0hROVdFWFVBTTVaT2lnN1Nn?=
 =?utf-8?B?cmpBOGxZTnZRcVlVUEh0NVp5Tnp4MEFuTnZmcVRTVDgwVHVkUnZiaTdUSXk1?=
 =?utf-8?B?U1QyVEhPSzliQnRKWnJOUjNvN1ZScUJyYTBuMzFCcWh6VXhIUkFING56Y3dw?=
 =?utf-8?B?ZnRHbzMrV09NNEkwaWk2bzNsMllkQkxmUU5oVWcrcElkM2xrKzlaUEozenFt?=
 =?utf-8?B?MnRZUm1vSGl6STVtNENQQ24wN05jbXd2N2JNZERERkJBOStrYzEwV2szWWsr?=
 =?utf-8?B?RVIyNVhId3k3ZTUzSGNVZEhvU0N5SytkajRkcHkwZlBCaUFMV1JDNWtoMnVm?=
 =?utf-8?B?OS9sT0lLWXBJb0VyWnVPVitPS3RVaHhXVnc1Y1g5OE80ekp6VW8xSm1WM1lG?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 294721d0-f989-41d7-9dd9-08db4c954815
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 11:47:05.2458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Mx/jaUo2XRAMGqeTHDYjGTrq+d5SjdUc5pRAQuiXzk+4kLutR7KzojMsEjgsxHEduFh4d1DojlglIL8ey+oLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

On 03-05-2023 12:12, Riana Tauro wrote:
> add rc6_residency in ms instead of rc6 residency counter.
> Handle wrap around for the counter
> The counter can still wrap as it relies on the frequency of
> counter being read
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++-------
>   1 file changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
> index 231bdb45a6b7..a7e97ddd7253 100644
> --- a/drivers/gpu/drm/xe/xe_idle.c
> +++ b/drivers/gpu/drm/xe/xe_idle.c
> @@ -11,6 +11,8 @@
>   #include "xe_idle.h"
>   #include "xe_mmio.h"
>   
> +#define XE_RC6_MULTIPLIER      1280
> +
>   /*
>    * Render-C States:
>    * ================
> @@ -27,8 +29,7 @@
>    *
>    * device/gt#/gpu_idle/rc* *read-only* files:
>    * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> - * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
> - *		    Prone to overflows.
> + * - rc6_residency_ms: Provide the rc6_residency in ms
>    */
>   
>   static struct xe_gt *idle_to_gt(struct xe_idle *idle)
> @@ -51,6 +52,35 @@ static struct kobj_type xe_idle_kobj_type = {
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
>   
> +static u64 rc6_residency_us(struct xe_idle *idle)
> +{
> +	struct xe_gt *gt = idle_to_gt(idle);
> +	u64 cur_residency, delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +	cur_residency = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
GEN6_GT_GFX is punit register so does not fall any of the forcewake 
domain. So the xe_force_wake_get() in the function rc6_residency_ms_show 
can be avoided.
> +
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = idle->prev_rc6_residency;
> +	idle->prev_rc6_residency = cur_residency;
> +
> +	/* RC6 delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to RC6 extended raw driver copy. */
> +	cur_residency = idle->cur_rc6_residency + delta;
> +	idle->cur_rc6_residency = cur_residency;
> +
> +	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
> +}
> +
>   static ssize_t
>   rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>   {
> @@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =
>   __ATTR(rc_status, 0444, rc_status_show, NULL);
>   
>   static ssize_t
> -rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>   {
>   	struct xe_idle *idle = kobj_to_idle(kobj);
>   	struct xe_gt *gt = idle_to_gt(idle);
> -	u32 reg;
>   	ssize_t ret;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>   	if (ret)
>   		goto out;
>   
> -	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> -	ret = sysfs_emit(buf, "%u\n", reg);
> +	ret = sysfs_emit(buf, "%llu\n", DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
>   
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   out:
> @@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>   	return ret;
>   }
>   
> -static const struct kobj_attribute rc6_residency =
> -__ATTR(rc6_residency, 0444, rc6_residency_show, NULL);
> +static const struct kobj_attribute rc6_residency_ms =
> +__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
__ATTR_RO or DEVICE_ATTR_RO would be more appropriate here.

Regards,
Badal
>   
>   static const struct attribute *idle_attrs[] = {
>   	&rc_status.attr,
> -	&rc6_residency.attr,
> +	&rc6_residency_ms.attr,
>   	NULL,
>   };
>   
