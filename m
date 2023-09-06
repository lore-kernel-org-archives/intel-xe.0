Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68BCEE14D0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 20:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBB110E1E2;
	Wed,  6 Sep 2023 20:55:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB4110E1E2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694033750; x=1725569750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o+N9JwHGEwPkUvV2yXyH8TdlH93UozEvA4YCOmRUhAI=;
 b=n+6RgF5fpQkZ/qzcPshjpZUuwGwzAJSO3R1ytf82kpGQod1+w7miZown
 8QBufqBkqPARfmIEZp1tGba9A/DJkjVCyHEecEah3Z4zi3RzdsMyP1UNH
 L88AKEsL021mlElngf5Y8EkTLOWmyklzHcoemmZ8RvsTpFLmfUzFcIl9x
 nfsecVIx5sh8/wqbYy4PC+DHqkoWfJbVZW2oh76d464YYjUiWkkM4jaFP
 iPrkFs8BpA4WyI/jW3qlufGUtOyZ0VnPeo9XUatBKWbsvI36KgUDPDPsr
 38hxnEoClP41VyRYFZdrdRY7LuBLfn9Q5+cie60i9bmA/1JL0/xG4FnjK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356660922"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="356660922"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:53:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988447053"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="988447053"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 13:53:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 13:53:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 13:53:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 13:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHFzbIWqvLdpdZUNy/tfS1pOPAvW+Fh4cnLy6r4rIpRa8iCjk6ScGcDEa+W3WLZRVBMTiYmNghKu0iVfbpHdFj/cP3SEUUvxiKrmtrHaSOLfa3WQ8U5Rmc+cYr9romhTqQaaZuWOPmAxfb/t5ifCHu2lvH+hD/9B1RxnilfVO44f+XZ3Otr5DLO4E8X9KdkKcR0+Oqy2pPICB/SGVuzAGL1xJWcf98sYxThVRHghieGjNUfnJug/oC7pmqDjo6QWkJQKfhsjfB2oTE2okjDKZTjvmCxHjuRYStb/T7KU7guyO1ndgoW83FRNg7diYxggdXv8BsQVkY4krfzHx8cLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUedkdmmvr5CMB3X7SUWwdhFub3owyleZpfjLEkbc6Q=;
 b=L3tU3ql0rViSptR1bvvNJ8K++bYxZfmgcOl2mlf5ow3RvvOYbLPN0DHdILHhu0I9rkfuolpKgqCyI/j9pc6L8ShzOvolt/wlG/izVMI9zrJRwSk+TBPXSj3R5tm5KdUkosP5pSOiwgMve2Oz5fInuFeiC6k80dsNIcQaotCvwnBZZfR9E6dJqE04sGlz1K32hAAz0ISHCs4UQ0NumvdidnD+jYJi1wXg0Tqa6Y5ckAWkvWat4MupjAY31hcb5WRIoYAZMjRd9MAb0OrGXCdoRjhr5Derds/Y2Z5/bkRkdvtP1BIduzt1l6EV6yo3bOvpkR9jDnpZZvVhg41e1k69cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 20:53:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 20:53:45 +0000
Date: Wed, 6 Sep 2023 13:53:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <drsxakbojvafwujenjthdsljcrfgggva7oipndfjxefzz6prh4@drtiptzyl3is>
References: <20230906193009.1912129-1-lucas.demarchi@intel.com>
 <169403037928.1922.4178883236664989581@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <169403037928.1922.4178883236664989581@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 208fa961-3029-4899-5e40-08dbaf1b5cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/9xvKe6PU+Ld67CusK6h18mI6PyEm7Glg3JHLmaT+vlclJ5WEAV3w+nue4Kt+eAlzJafubPhrJqLE18KvbBkhB0V/yCoy8Y0RESvceAH1sykEm+h4+qRzDtV678tj5SpYOWY4uCLJmcpdTL6fOEHRHwJceZgcoDK4KJW4YZHIC0qyOHszTGYeoVC+Tk1sPkj88NlnTEnOMie6Gf2PqYN5cuvDTTDTCSve+yISOFLbBnTpntmqVlcfky9S2oeFhve0bbyFY8Rkp2KeMskgnfa6c3lBv6gKyzcdYaBgUEWRxvH2zNR0cRhEc59Zg8K7prKHttBS+XPfd1J3xq/3FfhDDTnLe9Rp5zLkBvh4aEwloN4q9Ly2ow5FvOksubZKClqBMeDBe7Jiz9rctTkt44zmYsRW8XPKIfLcpjVp0f6KDbCNdF69R+k3kGTEdKZk8VeAcetq2Gln5RNR+t6btIOCbwn8nTDWfMSw6mUHJhKjrhJQHCSYyNBSjMqiMO/CNS5IzOtTizQVj4Y2rs4yxY1RMi/B6xK3V7OurjLzZDaz03L79trRdM/1dPGuZ0Ox+2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(376002)(346002)(396003)(136003)(186009)(1800799009)(451199024)(8676002)(6506007)(6486002)(9686003)(83380400001)(478600001)(26005)(316002)(6512007)(2906002)(33716001)(6636002)(41300700001)(66476007)(66556008)(66946007)(8936002)(5660300002)(4326008)(6862004)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kN5onoOT+w0HAXC+Cn7m475JsdfqyTlN+euTutaHKQ7G1WHH4xnSLmZL0xIM?=
 =?us-ascii?Q?Ip/ZtYrDLL9yL3wVFSGkMUrTe4fSBqgdeTb55kNPWaFoSp/62pP7g0tAteR8?=
 =?us-ascii?Q?uKNLNcLuuqrwhOUXvohgkTPWL6a2rMCNwhgaIv6NlK2mXPGcMb3p4UpGkpYY?=
 =?us-ascii?Q?Vh6/99Wvs/UqRLhSgcmDvGJMaiAEpvo39wuZnz5f3uPVYnicLHIJnt2obDVN?=
 =?us-ascii?Q?JsfzdDc1A3hWg+cOJNCqEOkrbUi7+Ocddh+NGIBXvnL8CTegsJ4bqoqmacAi?=
 =?us-ascii?Q?s6dhJMEwu0UmvCTh1SAl/uciO7ZV8sYJoOPBOBNYS0i2p7omtIuRuEGuY7Vi?=
 =?us-ascii?Q?ceyHVU4HmDuMAMCwBTGkC6+XJsTnSu+lmjyqT93YRpm+evjQPGyqE0VRPS2F?=
 =?us-ascii?Q?kq/ruRR5YAS2rgEpDvRBVr0erqGw3/DNb2Q4bgP9MATM+U7cfDXJuKo+4gyP?=
 =?us-ascii?Q?jDGcML/y4MW2Ghu6Z9PAsriWEP3/CLamEWWQ53gzb4W8NYdb7WnLUt3aPI8D?=
 =?us-ascii?Q?sLfhvXkVh+TGMrTuh0RMDoYlTkPPf639ltz3HoHLjPVc6JQeTwEqrTlaw0pi?=
 =?us-ascii?Q?1YuY1iO7ZOiMnJAnasERlSYTqpd7AtHW01TXnCYaP9UgrRrtilcqZXJ+wQkZ?=
 =?us-ascii?Q?MeqZ6I5yjQ7BPscMnGflyasSIv2/MiABj0zdQKNVJ8Cfk7CoAWbm51PtwC2X?=
 =?us-ascii?Q?XQbC7hspeiy2YqShux/2UeF6YxMpPWFpZLpBg3mSMeSks9JEVbFMmyVE6uc1?=
 =?us-ascii?Q?FitCDjMjpcRQ3+BF8ViGAGBV9olX0BhMYX3AO3Sknnv6z/W4al4XzwOsc7cA?=
 =?us-ascii?Q?pIbf6fYmPXUZObFJgvuCxhhhmiTRVtT77P69u+GzxwowGU/Oznv6T1X41yz9?=
 =?us-ascii?Q?ZB1H4WSJ6GEazH6o/4dy40FvtImvRlEx15PUYLQsRWOo6uDkTAupuwTgxj/6?=
 =?us-ascii?Q?SI3ytLOgG1pgajQp85jsJqRqfwMwDkK3nIFNdlAyBPPfKypTEM+T+IBcG6yG?=
 =?us-ascii?Q?i+qPppYNMGqK8cbdzuNLIcN4qsRQMOv2AD6Emiz/yqxNi3IVbH6/7rD9ndiX?=
 =?us-ascii?Q?AxiA25a/Nkz0CSnXjKfCQB/1053/SBPP9k3jEoc0eBIEUhWXOkgJRKCGuzIu?=
 =?us-ascii?Q?T+5nJrkOsv1ESeBDKkjxoq9svkIuaPT58+zAmSY7gimAYMyiZW8uTxgUa9V6?=
 =?us-ascii?Q?XdgBCRklKqJRtzmQhaJs0s9bG7bXSMZX0Knu3bZZwgfIPoxQ1XPXQPXxhMpv?=
 =?us-ascii?Q?l3tr2NcnC5fcMEq1ch2gmnaf9vJWctveI49dBwvJTZ14ME13JGWDdLgNELgB?=
 =?us-ascii?Q?YBp1Z+k0BnB2G7VNDpEQzuAoEnSwBtnk81XbqgHM1I5d3dyJI+AM4KwZbSZZ?=
 =?us-ascii?Q?qxDJrhzPHIgw3UfWjHjVDZbK/4tX83dSepsTdJ98580T+CPLcQj2BMsWM82R?=
 =?us-ascii?Q?oA+MjWbxRzWAXWC9IaYEzNnm8NQoW/jgPVPcSZB89JXaGUS3s6fmy0f5hFed?=
 =?us-ascii?Q?SpFhfn3Wn3+v/yzQpWS7N6AGiCm6urWmBXP20NV4V5r1CDAxzsIxN0RQhaPE?=
 =?us-ascii?Q?bFXDzb1oeSzmwDaYzJIEY8hjBVD96y6csuqYwmtrSTFV3nCGZFcagHMK78pe?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 208fa961-3029-4899-5e40-08dbaf1b5cae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 20:53:45.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaYEEkP4SHWlF7i3HQ+bbL0bIpuT2FMNjVUAYgfcoHdzboD4R9EfdUNCIpywctv08MOZrcVEv6+calxrjjotStDsXr8Jmx+AjfMuK8PHQuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pat: Use 0 instead of space on error
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 04:59:39PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-09-06 16:30:09-03:00)
>>Use 0 in format string instead of space so it shows as
>>
>>        [drm] *ERROR* Missing PAT table for platform with graphics version 20.04!
>>
>>instead of
>>
>>        [drm] *ERROR* Missing PAT table for platform with graphics version 20. 4!
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_pat.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>index b56a65779d26..71e0e047fff3 100644
>>--- a/drivers/gpu/drm/xe/xe_pat.c
>>+++ b/drivers/gpu/drm/xe/xe_pat.c
>>@@ -107,7 +107,7 @@ void xe_pat_init(struct xe_gt *gt)
>>                  * raise an error rather than trying to silently inherit the
>>                  * most recent platform's behavior.
>>                  */
>>-                drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
>>+                drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>>                         GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>
>Maybe we should have a standard way of putting versions in formatted strings?
>
>Thinking about something like:
>
>    drm_err(&xe->drm, "Missing PAT table for platform with graphics version " XE_IP_VER_FMT "!\n",
>            XE_IP_VER_FMT_ARGS(GRAPHICS_VERx100(xe)));

I think it's too much of an abstraction that nobody will remember when
moving code around.

>
>The macro names are kinda long though...
>
>Anyways,
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks
Lucas De Marchi

>
>>         }
>> }
>>--
>>2.40.1
>>
