Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8834EEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 15:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4AA88EFF;
	Wed, 28 Jun 2023 15:52:59 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A988EFF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687967577; x=1719503577;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UQqP3v1ukno6HXx9Y3+S6yx9Jqwex0T23alRUcFDJsA=;
 b=fKHzhZuiyAWVYeAoiz7CbK2rOMvnqcZosqI6cs3akvEaL5c9JZlhMOkZ
 /szKddvbFyymcQMlvQkZVAHYJtg0vpY4xQ0fHFt7bKbT0Hn3M1+REEOsm
 BYH7vACzLs+sKao88kh3ykPout7dtFqaHlAAWep7pznWFBRcXEX9cU59Q
 HdIuCnVmXKoUxvWEa0Dzv5a8bMREhUh4txtsj3gKC0QsltCyKY85rihSc
 HqUq/5mfdHUgyxAvJom/SNswNOwFZ8buUCsDg6eHSYm+S157xCumHO+SS
 E3+lhwkXuL1+TwvBmw7XF9ytKEWZrAjCqGq67nhYhSU2F4umJHYokcVq4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="341466719"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="341466719"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 08:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="806963298"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="806963298"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2023 08:52:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 08:52:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 08:52:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 08:52:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UttYqDk+5Ns532JyrdIG/4Wk9aLghziZ8z+dfBdM78j8A59ji2+bYquEkaAJaByhBiap2hyhN+cVadFF3GzsDIKU7cphYisIvs1XeOM4T637JGB37tjddtz0Qjw/VDLyu9E2EeCGkZrDRb7hzgE6jIAFuiEFXkwYIaQzxPYTfqGPKOgz/b1LhiLNmI76AP6JhR5TiJQChmgAo412WTc+6wJ0DCTtGpvVEgNn1dVKYt+QcSK20o8jEfuAzn0bYGMghGkDJhlI2O6Co/6tVOsOFdKQJXiDZXmY4abZ5ndN/GfTDh3rlaIX0cI6GbF/KbTK6NOaSIS4fHdXx5r4AT7szQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLrgudWKv+rKZ4xznccOjfBEDA/Gv499rZIPuxOrhBw=;
 b=nUE9kQf5VYYPGeBuy3yjUasCV+a41rl9rabWtXvc5bol0teO2qasUzBKKT65rD1bAzb9qo0GbpyYiwJjnfyb9OZWdLhP4dc6JZiPFkTyXBFObV4C++2RBSSfU1AmkpkYnWHiyDbP/FWwFt2+cd+/GtRqkFS50T0q34nMxGRPjDdpba9WXZ/ymzJmV2ErX1OlN4wNsPbXFS0CeNiSCkHuUgwCScuvrVchn1niBAYW3oGCwdID1nQRBeY44xSnkzuFPm+N8qmizkSfeIjGywNN7YuE6IMQhjjmpegb2Or0vYDdMssjjzrgASXdL2bbCJKHNW4ZKpX0BMb8yN5X6n9c5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6286.namprd11.prod.outlook.com (2603:10b6:8:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Wed, 28 Jun 2023 15:52:40 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 15:52:40 +0000
Message-ID: <5fc1e012-77af-0dbc-12c7-a92552b920f7@intel.com>
Date: Wed, 28 Jun 2023 21:22:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: <intel-xe@lists.freedesktop.org>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-4-badal.nilawar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230627183043.2024530-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f4687f-496d-44e8-f857-08db77efb3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vcxJKmiJBN2+5Jf4oY3ZtvP5vu7IW2M8gq4zsC4o9VCjiX8eQho3/7L8q1LpXy/BKW6o2LcCIO6E9aHkwygt7/bLEcRDXENjh0g3sjD2DYxRlezzojZkgTCgt21rcfINgqJ3MmCa1xxjfVvmr/lhmBvpSWDpcEiiyXnDYP6VSkUtIlQe/KN4dVWkCIxC/ZTnUhixkOYVPelBXQtUI0sRIIn69NsN69kSZbWn2pPPA4ZDgnx+J9o600HPWB8yASEPzcTREQqCDAtb4WR/1ZmalCwqUfcGMuxWLn25QWpAdKJx6872GuTV1EvE6mUNLpL8OK+Ru4If0nCN62biSH1abkynMv3eVagsatnu5E8XLy0AKE/FsYqh8iTBhj6lMbc3fwZytrQidVqxTc0Nu4GzWnYpIcccjl1ZgoYORAUjeCtSOAG36lSmjgRF6iQ0AF7JJOKB3A8R6eYVEHa2DASynXVsVKUMDn0UZNCbc3rAMXHvH7p1NIz2JzJN0djOPbA548tX80oimsgrWdFdA1cxNxsV+ce4NJsrEOH8RHib7+JqDPjj7iLRfeybWwfhr7oY6Xk9/QugUhg9/0ygCFRf4ug9kvAkAM7s0KooTG+A2zBM2ZMUVvxxtoqUy20G7kEj/5/bd5WUndst1kBOVoZydA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(31686004)(53546011)(6512007)(36756003)(66556008)(6916009)(8936002)(66946007)(8676002)(41300700001)(66476007)(86362001)(316002)(38100700002)(82960400001)(31696002)(5660300002)(186003)(6506007)(2906002)(26005)(6486002)(83380400001)(6666004)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXp5eUpvSDRvWW9ydFoyNUV1ZUVPM2NGbFNjSG1YeXlVMUJVcDM4VmFFR0U0?=
 =?utf-8?B?OWl4aHhtS2NaN3pGMVkxTU1zTFNrWmFmWGE5L3pFN2xuMFRqQkV6OFNNdG1m?=
 =?utf-8?B?MW1mSlo2TVBVQnk5TlRFZnRSYmVMc3REc1lvT3J3WXQzZUg3aFRrUEx3M3VQ?=
 =?utf-8?B?S1FXUGdLckVxaFB6bU9VZmhqb1QrazVoZUloMnlEZlpQNUc5N1I5TDhudXVh?=
 =?utf-8?B?cjdaVmhYQWp3U2VGWHp5eDc5NWRTMEdBdmIyV1lIejZhRHZMa1d0d3lSaW1K?=
 =?utf-8?B?dHRiOURSakFiSlY3d3lkSCtFb3VBajNNZS9rbjY2SWROcjdHRmlmaU52Rmhj?=
 =?utf-8?B?Yk5kMURnbzB5aklTZ1NWMDFrUUFRa3BJdnNDOFRiWXVjQzA5T1Y1RG1DSW14?=
 =?utf-8?B?OHhONS9uWGIzZVZDS1BORmZOUVBNTnJNMjB6dU4rMm1McUFlSGRXbWh3NEli?=
 =?utf-8?B?MDJkb20xMXIvSTlnWTQ2TStTMUJrcXg0RGZXUjVYTHE5SHJOMjkvenc3QlAv?=
 =?utf-8?B?aW1TYjhqRXRNOWZyR1l0ZlBJeWZWK3lnZ1dER09GTW9OZWVOcnFMbVBLRk85?=
 =?utf-8?B?RTBxeVdpekpvNGdqQnh3aEV4aENQdm5KQW1IM0lsYi9EMTdBYkhaTGE5K2ht?=
 =?utf-8?B?UDNQNGk3c1p3ek9OdUtRam9sKytuMFJleVJ1VnFRK1ByTnVmeGcydEVLa0Ry?=
 =?utf-8?B?VVJpem9EeFc0WTZldXRzZVdWeDhaSHJxekhlS3lHbUttWGU2U21xb3Q4MkZh?=
 =?utf-8?B?cGJROFVJczgxTXJMLzMwaW51N1dsdTF6bm1ja2dpZWNhdnRBVlBGa2sxR2hH?=
 =?utf-8?B?a0ZlZDVWcFRiVkY1RzY1YkdGMDZkWUI2N3NFQ0E2eU5EZDBxS2JsTVEyaHB0?=
 =?utf-8?B?SXR1N21KcityWkVjbkp2RjVmVDl1R3N2aEx5MUdmb2VsUHpjdWRFUjFlTTla?=
 =?utf-8?B?NHVFVERHUVRHT2xlaWY3cDAvMGZGOFdYQm5pU1BHMGI2VG9JVW02a2tueTZM?=
 =?utf-8?B?dlpSQlV6MEZlWDdsTUttY3VQT0d2a0g1TTZhQWxzOGVtNzNEOGhaeEhRTUR6?=
 =?utf-8?B?MHllNkJKSUY3OW5DdVFhMXlyTUM4Zk5zRytWN0JaVWd5NHNkNDlaOEx0cTAr?=
 =?utf-8?B?ZTU1TGxwN2xOVHpGUVRUVXBKaS9zUXQ5dEIzSkE4NEF5Y0lOcy90TloweWFC?=
 =?utf-8?B?VUMrUlpFVXFFWTNmeEsyU2ZvNVJXTERpN3c1UVg4cWg4OXhQUUM4WldQY3ZV?=
 =?utf-8?B?NDVGSVJOSDJPU1l1b0N6ZDFVNFVYOUFSM1MzNlYyUTFxb0RESWZSNXhmTmR0?=
 =?utf-8?B?ZE5TVUlzRFkzYmZLTWpmNzMvczFWOXJJOVNMSmhBVEZ5SEFTRzRzVU5uT2tP?=
 =?utf-8?B?RURpa0tPUENaVVZxRFlFL1UxVjVJWkxTNTM0Y1VacFpDWmZZK0ppQW9KbTdF?=
 =?utf-8?B?TTUzZlBRbUdqU0dMUFRlQVpYcW4zZGF2YjRoTldZc205WkR1VHJGVmtvaHF3?=
 =?utf-8?B?NDBmOTEvYXkrR3RNeG9YMGpocjhCY3lpRGxXZTg4Mkp4QzN6ZVlpNGx4RVBu?=
 =?utf-8?B?V2VtRXhBTkE2TjQvYmJjbTJuUTN3UlVtM2VlYlcwTTBlNkt3dmxQSk1DeDAx?=
 =?utf-8?B?YmNnWE9IWW9GWTh5U3YxendIWmhjZnk2NUxZcnFQM3V2cDRpWkZPcnVmTTNN?=
 =?utf-8?B?Yk01Y2g5R3VGenhQbW80end3Nml5NlNpSUQ1Nnp1Z2hTQm1MTk12S3YxSWk3?=
 =?utf-8?B?SVgyTE40bFhzdnVLZUZLcVcwR3lPeEt4NE9rZlNtc1JFaUdSc2ZEMkVqYzE1?=
 =?utf-8?B?RWl6cG9ycG9MTm15Tzh4cUlYZmd6Q2ZYVXExcXhCTDdkbktSWkNuYVFxNXFI?=
 =?utf-8?B?OEVWbnFnYUxPOElXMk1JY2tGeCtyRlNDWVY3UnorQWhqRnhJQitoNlZNYktF?=
 =?utf-8?B?aGtrRVdmb3IrZmVaN3l3NEFFL05wZ24xYXdmMFRRUkFqN3lvbVd2Sy9ia2lH?=
 =?utf-8?B?NWwwWFdHRDZNY28rMXVPWXJCZjYyRC9mb1VtU0ZueTE3Q0RTZDhnaEJCOVVp?=
 =?utf-8?B?TGtyRnVtSFRWUGpheGxCem1EaHRsdVZPcWcxZkN0Wkdrb0NWQmxxN3JrR2py?=
 =?utf-8?B?clhUN3VxcGsrVmFSMEp6RnNQUklCRGFQeEpNZlBwYVhsNEZ2dlpBa2RaNG5r?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f4687f-496d-44e8-f857-08db77efb3b4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 15:52:40.2460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AKJ93ANnnfGR6bDzOhwu/SVoNdUL4b8ARuWtwdXW4pCg2A4OjJvJyoegJe3LMRXxEOJ4146YeRkhG4W91sWVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6286
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/hwmon: Expose card reactive
 critical power
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



On 28-06-2023 00:00, Badal Nilawar wrote:
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> This is port from i915 hwmon.
> 
> v2: Move PCODE_MBOX macro to pcode file (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 106 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>   4 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index ff3465195870..bee1d62bfddb 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		July 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		July 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a4fba29d5d5a..7068120d9200 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -11,6 +11,9 @@
>   #include "xe_hwmon.h"
>   #include "xe_mmio.h"
>   #include "xe_gt.h"
> +#include "i915_drv.h"
This need to be removed to avoid failure reported by ci.hook. Will fix 
this in next revision.
../drivers/gpu/drm/xe/xe_hwmon.c:16:10: fatal error: i915_drv.h: No such 
file or directory
    16 | #include "i915_drv.h"
       |          ^~~~~~~~~~~~
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   
>   enum hwm_reg_name {
>   	pkg_rapl_limit,
> @@ -27,8 +30,10 @@ enum hwm_reg_operation {
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - power  - microwatts
> + * - curr   - milliamperes
>    */
>   #define SF_POWER	1000000
> +#define SF_CURR		1000
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
> @@ -232,14 +237,35 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
>   }
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	NULL
>   };
>   
> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> +static int hwm_pcode_read_i1(struct xe_gt *gt, u32 *uval)
> +{
> +	/* Avoid ILLEGAL_SUBCOMMAND "mailbox access failed" warning in snb_pcode_read */
> +	if (IS_DG2(gt_to_xe(gt)))
Will replace IS_DG2 with xe->info.platform == XE_DG2 in next revision.

Regards,
Badal
> +		return -ENXIO;
> +
> +	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> +			     uval, 0);
> +}
> +
> +static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
> +{
> +	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> +			      uval);
> +}
> +
>   static umode_t
>   hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   {
>   	u32 reg_val;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -248,6 +274,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   	case hwmon_power_rated_max:
>   		return process_hwmon_reg(ddat, pkg_power_sku,
>   					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   	default:
>   		return 0;
>   	}
> @@ -256,11 +285,23 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   static int
>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   {
> +	int ret;
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return hwm_power_max_read(ddat, val);
>   	case hwmon_power_rated_max:
>   		return hwm_power_rated_max_read(ddat, val);
> +	case hwmon_power_crit:
> +		ret = hwm_pcode_read_i1(ddat->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (!(uval & POWER_SETUP_I1_WATTS))
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -269,9 +310,14 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   static int
>   hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   {
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return hwm_power_max_write(ddat, val);
> +	case hwmon_power_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> +		return hwm_pcode_write_i1(ddat->gt, uval);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -327,6 +373,55 @@ void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
>   	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>   }
>   
> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		ret = hwm_pcode_read_i1(ddat->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (uval & POWER_SETUP_I1_WATTS)
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_CURR, POWER_SETUP_I1_SHIFT);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> +		return hwm_pcode_write_i1(ddat->gt, uval);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -340,6 +435,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_power:
>   		ret = hwm_power_is_visible(ddat, attr, channel);
>   		break;
> +	case hwmon_curr:
> +		ret = hwm_curr_is_visible(ddat, attr);
> +		break;
>   	default:
>   		ret = 0;
>   	}
> @@ -362,6 +460,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_power:
>   		ret = hwm_power_read(ddat, attr, channel, val);
>   		break;
> +	case hwmon_curr:
> +		ret = hwm_curr_read(ddat, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -385,6 +486,9 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_power:
>   		ret = hwm_power_write(ddat, attr, channel, val);
>   		break;
> +	case hwmon_curr:
> +		ret = hwm_curr_write(ddat, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 3b4aa8c1a3ba..08cb1d047cba 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -22,4 +22,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>   		     u32 reply_mask, u32 reply, int timeout_ms);
>   
> +#define PCODE_MBOX(mbcmd, param1, param2)\
> +	(FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
> +	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
> +	| FIELD_PREP(PCODE_MB_PARAM2, param2))
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..5935cfe30204 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,13 @@
>   #define     DGFX_GET_INIT_STATUS	0x0
>   #define     DGFX_INIT_STATUS_COMPLETE	0x1
>   
> +#define   PCODE_POWER_SETUP			0x7C
> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
> +#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
