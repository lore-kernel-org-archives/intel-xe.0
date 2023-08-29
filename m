Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C5C83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 18:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53310E11F;
	Tue, 29 Aug 2023 18:46:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073410E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693334791; x=1724870791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oqnu/j8CMvWsoderQxSJGvdFBKUJq3+ajg4bMIWMEWE=;
 b=Ibrw1UIHmv26Ktg/ruP6f71QyRb8u7xQ5mje+WrHIpXDiSfiJY1yIDxy
 YLoFw+OWToV5UIrYpYKj1ddVsXJP3zrdeAHw/6KaePEsHOy1gjF/nVfIO
 ENJD1gkK5elMznlD254dL6nYcoO0YXtgcHSGL02OtB5nkpKTRxvJWLJJ8
 DcL6VsbFLUNVq7wdz2OGBC0l2B/fnJdLD+aC7mOG8eBQMnqVAsMpWPYFu
 90b5+++gWEHZg3+Un2b11oELQO5iKK3493J6wvAm8+fk/wKBtxRVPNycM
 oYy3BbJn5Gek8MCAAzwOH3q39bupc4yhYyqX2MyHgLsUY6DTYH4dsAKRE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378168741"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="378168741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 11:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912517613"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="912517613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 11:46:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 11:46:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 11:46:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 11:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kht6y6LwrImdniynoHQx4P7nQ2+IWh3SdWjvwV1jU6p3GmByVnBB7Nc0eTejnMy/gSu+afexTfXiLm9wE0wytzCJzSQ9iApYurIL95ro5MgLzZj5Y0gFr4XTm6bn/3DyxZAn/JfqCUgKNAagjmzIQpbr+1uvqanSMKYnwMh2+U0nivohap5oT8tbDxp+6KtzKQpWWBHUHA4HHwoZIRz1qfYcdRNp9FW18gxXgWxtIqpTbfDUnuGE6weIcqgQjTl0FErmwMapOwnznBDwVHY25JrD8jpoVz/9xhpDp/4QD4NYmb1gHw6WlA0vQNsjHAjhou6GPjZ6V1DWT5VTGqxG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzdlTCyjBcoMjl5kisJ5mFm6xnhj3wvT6M93bQZy+uM=;
 b=Wt1x4aJIFIwg8XHJqv2mCPyFjjAs6QdAztAd5oSW1qr3EKqRpCX4A5mSlEmexdh25oRl6p7To2GKng6dZw+CQHEFGF3FmrZ9FzzbWDOpKRKTrC/dJHWeFox7FGay7jHFTBFCK6gURUHdPhw3k1izmpfTbHfGOu00HJX1ry7F2snQqHWIxjxF+qekNo72NYtITlCB+TLSDi4ZX1TT99FOtcsQkuHF9bloZnx+3N3NZxs8tEZ+UeEILpME64/4es1rA4K/g0ULQecJmphSDDtqbJt2LIx31vKqMCK3jeAlEeqGnRnbeu9AoWXFVIeTGBehgeK+9niryO+bILN3s04Ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.18; Tue, 29 Aug 2023 18:46:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 18:46:27 +0000
Date: Tue, 29 Aug 2023 11:46:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230829184623.GK1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829162840.73444-9-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1ba45a-be25-4254-3a2e-08dba8c03ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enAZKFFMoAQacQvXcq88BIGLhlI/Gosni2SK66+KyzpJkLrhmK6DrlW/i7QVHkJRU7oBH3gRCXe/SJj1zKzKeSt9U3rUhxHaVLM7GlDZ9t/2VVnJ7sOR1+hW6PZb/Bnazc4gNY+fM2Z55eaZ0lXntCxCC5pI+KmyjHnXGX/IPqpBzZsDHp4eDsFCeTJGCfXpe5/0/kGXRzPyCpyDF7kot2oAXhUxK915mRSoNbs1IpqLALxh3QKpoOo3gZjUCuKkv7v6UT3KHhFvE6fQ6mScswtanRhgoL4ZKwqGOakYSzKRKpuJAYo04IzGsUEUmpzD5yVtCwQFNdwNlh89SNVy0gmAB0fCaXaB9EbvprozpxizuIhh9YHnI1bM2tz95aGEsABI5bRFpwy7Tu2LHUB98aQ9q7cmZIXsmZhlOiT0K5MWvtYStX5Kk/0dIEH1mOIcwo/psak9ynst8gXzs881fjBbj1VRnBorYk3MKGOtvzlUxoiuuddURCrChr+4/pegfpusTuOUCa2ltnFqOCBkc9goRu0ptvfdysMOl0jcD5xCEZmcvq0fcmks0GBoFMKo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(186009)(1800799009)(451199024)(6512007)(38100700002)(6506007)(6486002)(1076003)(107886003)(86362001)(82960400001)(6666004)(478600001)(26005)(4326008)(6862004)(8676002)(8936002)(5660300002)(316002)(6636002)(66946007)(33656002)(66556008)(66476007)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQjlgfsx7noe/nGpMrYMjrOraYT+EdH5eKpuXkV3YdHmTueooDpiVNkaUOa5?=
 =?us-ascii?Q?sSO2rOxpKqLiu7JbYQ4R5PhiXBV/8luot+enIMf3RbMJaWlvlyQNuEalWXht?=
 =?us-ascii?Q?GCghuwgmtTVLMAJmrW19RzXlWOlUPiw7DCzuOE7ggg586P6HLsXrBHo++Io9?=
 =?us-ascii?Q?b3QN0ID9NKzFPPktfuDc/dTwaJc1C5kDzxzdIeLa9oV+KGV6nSWLoBlUmwqS?=
 =?us-ascii?Q?Hkx53PrUmzJonAJDnyV/Q95jzeznBHmtwU/CCZxZ46QDk6cFZoQ1qAIN0Zhk?=
 =?us-ascii?Q?bgNMoVqfIs41OLprWWw2pNTpTYtj+bKcJIyWWSA2b/zw056OceX66I3/wqye?=
 =?us-ascii?Q?lL0pgUZF0caZBwOxY9wJC77HqQDbQGDkkwJalSoIk7/uaCwxu8cUwFRrlQq8?=
 =?us-ascii?Q?asAQc5YF2objc3mfOo/r4ud5Yox9NHUCX039VTU+5k14VGisLk4cTW2HSRTZ?=
 =?us-ascii?Q?tFIVpk1w8kA78IaXe5aPoNMIvBNZQAt1YFq6FA1rMiOOCHll+1f6ybw2CBHe?=
 =?us-ascii?Q?yZPBHrlSbvfujzinLlTwy0jWzvF6lm6Gp2e8XDtD9/sZ8d4DtNTXsM3Ez0df?=
 =?us-ascii?Q?LXSqDYP4bWAevBA6PoXFoXB67L3iB3eoKN3GtEKt25/QgcQwCXGRTXwspcgJ?=
 =?us-ascii?Q?np5WK1RmybwsWzDsVl/dbLgJyM7sGABrwy9IKXEBdjN8+IJFKlTIHy8atEOq?=
 =?us-ascii?Q?d//G0UesdXNyQnpMNpJwcQJIRIqCfH65iY+YfgNvqlYpy4jBWyyOdMXxbiCj?=
 =?us-ascii?Q?MUCaCRvH4w50tMt/YAyrTVcWA3ooCPBqh0Yosm7NHAQGA9QOKiLwv9INqZKZ?=
 =?us-ascii?Q?UJZ4lLT00IyTlZSBKoEeSS/P9o03b5Waea+glxpRRYkbY2zi5wvlcC5ewv/z?=
 =?us-ascii?Q?+RTEowkoMXDvuT93emfY15zJbt+LaBa12pHORIf9qyhjChESV5FX/0F2x7Dz?=
 =?us-ascii?Q?WbxWANIwIXwZeafLYQnMtrM6leLrNf7YpuZQtLEKQTXFF6A3EaiznETk5xaL?=
 =?us-ascii?Q?F5ckAGOQbQlmDwJOwsAhXcNRXPyUTc51fRCf1gxCja+NGRwJZHoXGA3HxwSo?=
 =?us-ascii?Q?ma31pf51OtlZHYArv3CN77Hwv8gN8THWo1wfHM51z6xHpeYyygGZ6wukGY+Q?=
 =?us-ascii?Q?quEcA6YkPE8XULhRejyWDWdqvSHP/27wbSsQVHivSymMXFfYEPZHHJZd7IK7?=
 =?us-ascii?Q?8GA0QVN4j55mReqbAP7g14BH3Y0gvFMFPgX+FXjl+D/gpEk0Hoa52PfFP8HS?=
 =?us-ascii?Q?r5j5/ONWb0cqPfal4Un6KaYU/vRC+tcTz4FJpq4N/4Qx6niZcCNV53Akp3qw?=
 =?us-ascii?Q?FsgVCXaV9mGSX1Kqgde027mGAxCAqsls6cH6zN8DHz/xuVHaqKWIG905t7iB?=
 =?us-ascii?Q?CqcCVhP7A2InwJbOnyULcHwPWHDRJ/VUK2hQZUkeaOXUSzWYkEgFM7cQzWDA?=
 =?us-ascii?Q?KMhDIXvRikRPqSR8e9g42sdqA30n5HjoEuEwUkrbY7er2/x6b7fznfutn40O?=
 =?us-ascii?Q?WIUCefYLMccSX5Ndm2BExtHG0pzdMBFuuCKMkqE8BafpkcUVrXJFOJ9BfESX?=
 =?us-ascii?Q?cMg6Gv7yrLyhUsZTIUwK9/lSjmtn700kMJI1tztnQDnny2KHiKsTpffigvp8?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1ba45a-be25-4254-3a2e-08dba8c03ff4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 18:46:26.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EUeqEw6IWHxM19FdF4HXDO9QTSa55VdgGj1xklxES/LhTBZqv5f2H7KF5T37yRzKD0j7CytN8YhIJK999d7JQVPhsw+rpzuebhgUZ6eZpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe: fix has_llc on rkl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:43PM +0100, Matthew Auld wrote:
> Matches i915. Assumption going forward is that non-llc + igpu is only a
> thing on MTL+ which should have explicit coherency pat_index settings
> for COH_NONE, 1WAY and 2WAY.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7fb00ea410a6..791107dec045 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -240,6 +240,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.media = &media_xem,
>  	PLATFORM(XE_ROCKETLAKE),
>  	.has_display = true,
> +	.has_llc = true,
>  	.require_force_probe = true,
>  };
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
