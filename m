Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF4AC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 20:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D12710E549;
	Tue, 16 Jan 2024 20:04:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB610E549
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 20:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705435459; x=1736971459;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j7MgD3s6gkIfQ1/xkXrn9idlHQISJ+Cqn4nlF6+wu18=;
 b=i42q+TKzidoppDa99Bw52PDfGnuSenJc+trAw9LBOVys4SZPbIIVDzsa
 UOuIQgGCap6SBfAzCzW6DPuYG/CIxXe2j5b+AparCbaCchI0oKAQ50f1Z
 eMe7N6JKs220V6e6iJIh7WZHaoa7hCsMeHCx25hrWqeyf1jBk4zDd08XD
 UPaw2Q5k2YGIjWhyKh9+0GjN9Z9DEbqVYBJOaBrp+PVSjrQp3y7azSxJL
 AMsHlEL70GMe7fCUJWtgy57DgrOnoZmVOtM0IJhP7gQHF97IChzL/lfQU
 khPhVH5KjSjA8OEVQUamB9vLgM1ugN9toY+DoRXCVNkz+5X3U13t2kMrT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7347045"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7347045"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="903263197"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="903263197"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 12:04:18 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 12:04:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 12:04:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 12:04:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJwLQq9Vc+e8vspgiBunku/itnLi/x8Y1uNHn3rBiB9m5UGhoiT+iUk4uYIyDBTWd/vufNdk7fAlxo0L/LdkWxN7NmFL8xc/T4u6Ct/8Rp8gmJzaKKs7wM+hN67T3rNxPfMJAwQ884PaWw+cA761VGoPF+bFxX3Gj/eo19kzhXjmPnpuI22wirOoB+68OBJ0qTid5Kf5Ubj/JXqwQpP24X8ObaBuTaRdSkm1LI+AJzGRT6q+a/CZP6BYMishQdQtCwcyTdOdNjj1kA5cNuKhumRehmBXFVE1baqBimu62LRuW5PfsrZqQJGeb+OhpDv+YvRwK8JaBk2ZerdM/AowhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIZ3ZokloKPYtWVcY7mNwXO+frZQ+S9TGBkRJvW65GY=;
 b=H0RgfgSs7HNOFcejJIgneqSF6D4Zu1PHaz59O2rrn+oTtG0EfOWExwkSV1rG6t3HtKeJPVziXd8Y0OGQPYwefI9VHc9iuf0X3ciI3v5gSi6iyVvdQwQF+cj2EIFT78XujdvEFUg6u5Rk52KInMPeYCBzC6aCMLZSmGMY1PTMFyEkuQuSP2Zm8uU064DUTlb4j8oriIjbMooxhPAUE4bJJAI03iwuNjwumCW5/xNHTVNax4UbzDtvO8NIz0ABzJ9TP5e9NGDq+yRVDtC15mAvix4RfV8q5CCRE2s07x+lF/xvUTu+hg3hiNG0hhHPJjmoaiy0oi8dnf6V/1zBxdoIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Tue, 16 Jan
 2024 20:04:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 20:04:14 +0000
Message-ID: <bf5627bc-3388-467d-8589-286e816337ef@intel.com>
Date: Wed, 17 Jan 2024 01:34:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/xe/vf: Don't enable hwmon if VF
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-7-michal.wajdeczko@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240112152649.849-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bb1f39-f65f-4d45-3a97-08dc16ce4fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ynr42Y0B4JKVRGGQ8FmJrZMmqpE5zygdBeX65QHBppnKkFpKOfoKsuLG8Xv/h2qexH5TTaQws5bqUojj4HWmkVPCMm/IYeYxMinhZ8pQKWDX9DWWfVADb5uUSGrs9gRiN+dXdlrWVSNd8CnlPx+v3e6Ysj4BkAKTOKaZO3N3UPRbNV9cbQlK/Njf3rs6F5QXJnIM+p7RD9OUPFE2XNYt8H5oww+WVVtJGvZSgUeaDLzOtH6dfCPheGln/JYfC3hNiZCYceOLKktabA73JjyH4KmP1m1L2xZWlSo6RxJSPkLPVKJsZqINSFV1ODgu+NPT1PaXTkDqHNHPyIoXbcOpB4YPFvWveofCEkbyZr4y6PGT+jmMBKYlDD0tYqVURbzG5ztZRaMK5PfZ4ZABpYqs9cuDF6irGeuAJq/1Y59ArbxXauBmUZIalVdHa5TI0klB7xeuTclgittLC0Fgc6flO5Sn6prgvqqorv6Us7esS0wAC8d7VRUKMmk1b4P1w4kQSW59YGSYYVfwmqqwKmvwgdLGbe7vok9f42t0UJd+eKAIy9eox8iCWlVJq6f2fYX217l8kwMmWWLgWFIWJrZJk9Rmb/gGXiITN4CTNOtZnArJYdc1U0JqRxE6igaq82hJeuOeDnBEd2ELTWKXuB6T+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66946007)(6506007)(5660300002)(4744005)(38100700002)(8936002)(2906002)(36756003)(41300700001)(6512007)(478600001)(316002)(6486002)(31696002)(6666004)(2616005)(66476007)(66556008)(82960400001)(8676002)(53546011)(86362001)(83380400001)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FGakJ4VjhxRy9naHFBNDIwVW1UTThQL3JKL0NES3FVSTNpdlFtd0hpNGx3?=
 =?utf-8?B?d1BVRkhPbjQ3aUNOUXlSeHVjUkd2UEg3Q0ErMURCNmYvZ2MxMkViVTRubFVh?=
 =?utf-8?B?d2hqYWZWc01ralhsZ2QxeWsrSUFBU2c0Z2EyRGlQbnMvYUROSk90NUdic3dI?=
 =?utf-8?B?V09XUjNPWUJsc2t2eVNvU0QrQUdvREwyZnQ4R2VBWWpUb3MyV0YyeXlXNU9G?=
 =?utf-8?B?SU9icCtoNWw1amNMVUV0M2JJbkNwTVJZd045ejRidWo2bFVJcnhmNmpsWGdW?=
 =?utf-8?B?UVFvWUNva2lTak1qbHdMLzR6SjRseFY3NWJQQmNaWjZsY1d4ZU9zNXhHdWh5?=
 =?utf-8?B?Nkx1R3drRWxteERXWTFVN1N5Um84eDl2ei9VRU50WmkvckJKZVRYVnFZemN5?=
 =?utf-8?B?c2V3OEVkTDNaNy9XQm1kbVJBVkN2OS92R1lpR2JzNW9GbnM1cTExUEJpbjQx?=
 =?utf-8?B?ck96M2xPOHJmMnkvMXBtYTdKNm9ZR0dnNmVsVjJsdk1VMTlmaGVFaXA1WUg4?=
 =?utf-8?B?SkR1V0o4Y0poblIzOXllQnVJTUVPcTkyZU9lWjA3eXVJaHMraEFYVHkxTDEx?=
 =?utf-8?B?dXhMcDU1Y2pzOVNvemtNK2UwK0FmdEl6R3lJR2NKTXB2cUtNbjZMR1NuSHAw?=
 =?utf-8?B?VUZEYmI0UXRSQ1hlRkZ6aDdJZHNIZlYrQXRJaXdsQlJaakptWTl4dE5RNk9V?=
 =?utf-8?B?REV0QTc0NVNQVG1mTUNTSlNuUXdRZ2xMeWsyNXJnK3pqbUtReEEyMTRCVFdM?=
 =?utf-8?B?eHlpWm5URXEweGV1Wkg0bUZNRG9LN2QrbVo4RXFyU2l2MmFIYmwvbFdPcE9U?=
 =?utf-8?B?VDZRUjRjclRBUytVV3ZTbGNEODF1TDRLUHBodC9aaHhHUmJhRUFzUEIwV3dX?=
 =?utf-8?B?RVY1MFhBa2Rab0wrWjdjdlJXWDNqU2VsekNRSEpJRC9VRWdDQ0RqZzIzMVhm?=
 =?utf-8?B?SVJ6V1dWbC93WDhZdFd1ZVZjbVJ1QU9lNTNkZnBUZ1FRK3lMRThvUkx4RStu?=
 =?utf-8?B?QnhXS1MySFNRZEJyK2xwUlhSVnUwUGJ0V0laeW1qT2FnOWMwdXJ0cHhaK1pC?=
 =?utf-8?B?Q2hGdjV6bG5sMjhodXUvdDN5dGZWd1R6RGp2M0xTTEYwbTl5djRLdVZvc1Iy?=
 =?utf-8?B?M3Q4b2tQaUxrWXhDV1JSTlkrRFpPLzdncCtzYWdPbVdIdjFYdEQveTdiRGk5?=
 =?utf-8?B?SzZWRE43ekhFUU00VVJna0h0ZWsrSFB0Um5GaFlMRzZIOXU1UzBjMzErcGI4?=
 =?utf-8?B?TWMzaG8xcnJaeW1lbEg0TDdrWkpnVDZXOHhNOVJXemN1Z0pqdkVFZUpqZC94?=
 =?utf-8?B?cDdBUVZ6Nkdqdno1UEdIYzBxSGU5ck93L2o0eGcvbk5JSUYwOHZUY2RSWXg1?=
 =?utf-8?B?NlVmM1lmdUY0ZzlXZWtPd0JDQ3BQZ01qd2RqTFhZSldTb01GK3M5K3pPOVQ2?=
 =?utf-8?B?SVA1VHF6UmFoMkJwMUx1QTQ4US9LS2dDWFFCeHVMQnZha1YzQWM3bWZBcVYz?=
 =?utf-8?B?VTRRWkN2dzE2d1hvbnYvL2JaNWhndk0xSGJQdDRXWXNXRitCcWtyTEhNQlls?=
 =?utf-8?B?VVNIbTN5VHMwKzJUeGdLVHFOYm5nckpZcDI1bFllVlNvVTE5RHNLR0crbHE4?=
 =?utf-8?B?NlJ6cjMyMDAzZ1poaTNVZEpRSVFPeWorMGpzSWZ1d3pPMXA4OTFYWm9EeXRa?=
 =?utf-8?B?bEdPWEZ0YmIwUkVpZ0lLeW00OTVDRmxqRVRXMEF3RjRyRFdudmQzdFJYb3BH?=
 =?utf-8?B?VUsyb1packtvMXhTOGh3TkZ4eCs5Y3NUK21zekpQWllPV1NheG5PcGlKaXB1?=
 =?utf-8?B?S2NNNUV3UkFlemNWYkJzM0ZOUzI0eS9iUXN2R05DUDRYZDY0T3crZEhRd2Vj?=
 =?utf-8?B?YXFXcTFQbytpREQ5SGdPRVZjbFlyb3kwTU5ZelhkL2N6UTVVNHJMdy8yUGhH?=
 =?utf-8?B?V3J4SHl3bEluOFFVRGw0L1pleDQyOGN5bUxtMHk0bGQzeENxVzBlZ2xwSmZ0?=
 =?utf-8?B?ajBBMnZ5ZEJZeW9nT2x3enAvWUtzOTNSUUVyZ2JnU25JLzJQM2w1MG9VMDlW?=
 =?utf-8?B?Z2tuZlJnSEpFNUE3ZldZNElaTkRSTzh4OUxNZ1I2Sitnb2ZJbFRjdnhraXdJ?=
 =?utf-8?B?aUY1UWtrbTBGak52RldUemdueloyWWttTTJ3VGhib1dxQ1Q1bTl5cFdCV0xD?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bb1f39-f65f-4d45-3a97-08dc16ce4fc2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 20:04:13.9758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cCS3fnyP3R+IqH+ekt0B2gC1XOv/DNZPXoLZpSoKvZtjUn1duX8hbUmVksOb5nTy/1jxizhRr3Oniv6VStuEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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



On 12-01-2024 20:56, Michal Wajdeczko wrote:
> Registers used by hwmon are not available for VF drivers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 6ef2aa1eae8b..9848bf84b58b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -16,6 +16,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_sriov.h"
>   
>   enum xe_hwmon_reg {
>   	REG_PKG_RAPL_LIMIT,
> @@ -745,6 +746,10 @@ void xe_hwmon_register(struct xe_device *xe)
>   	if (!IS_DGFX(xe))
>   		return;
>   
> +	/* hwmon is not available on VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> +
>   	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>   	if (!hwmon)
>   		return;
