Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A5C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381110E619;
	Tue,  7 Nov 2023 16:26:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3041310E619
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699374397; x=1730910397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZVEAv4WOf4rCYyeeezvpkdj/lLvDHgTJf4La73Y2H4A=;
 b=Q2AWe6NOK8qAGGZoRoaayf7nfod3N8FxpamUJFvGI1Jl1V7S0ajP8dVU
 fEPWHuQ2ffWB6ltnJ7a5kcrwho/nE/QC7mg6FXeucP7XqQ7WGZ7++x9as
 RrHgvw8vIkNKLUXz4n1If8D4YCM23ZDNZIZ9Z+nJn3G/Ew6rrW7ht/a8u
 x/OjIVNZ8DME5AH1e8L4ZUgiQzqtQCb4LWzwoiOsFysfrq2XVfiEm6vOF
 Mj7SPgibdEpm1DZMjgueryfWRlVFFnUI461Zq0RzmnWddtF2KxQG6INUq
 9aT3UH0PYO6gxz/RH0vEuu5lFidJGAQr6L0UQjYG1ODHB0IN4PC7pOyRS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389350604"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="389350604"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1094204906"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="1094204906"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 08:26:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 08:26:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 08:26:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 08:26:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 08:26:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPZjRSjzEd4lYB/ynFpg+VaXnWVm4XrtSC4YTLhDWys0O/xQ7s4gMtGhzHxT8tWZ+7Gl1PJIPDiD2cbtELXikLaRb19K6sur+07znlTN05eNWzkLjbxB6x+6AMihhANOwp8twRX5L0RWjZH/jfv5ehQVTYChpozvdJxiEKLQ6bD7Pluy8Gnq+St62BJiI0y+PmI7GLcVd8w/V7xGxO3/f2kGqX54ZoqJSSzRG9+NKTqzzWnkHsK4q4GM3h7YhNEIW0zyH6GOimy72UJHbQdp0gVNU9uEE9spJ798Rk3giRdVAXSQ7DEErRb7pRzQeN1pBOCYEfATwqU4WGmb3MDItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBKUnfeYKuvVZbe4Kst0kSyR6eeHo6hrpZD8Z4SIEeI=;
 b=difphPbArMkLB12ZtWdkHGpLs9E44kPIXeRLeoMewau5PrIGyVlG3E+qUWVy/+GaZ+/e7kBcXJpsW9mSqMgsgCIsSiGIyU34VkSjyw4OwFSLlHl5mQKiesA5Sgeau8JCb8CzofubSCw+nGPXStNBTtpsUz+V/K8rSCtggNprIGEuDEd0Z5lxV13kBtow+nrsn4CMS0vUf/ezBQbQzS5PYJAi6X6ZCq65olBLVAA4PsVyS2j2VpiPGaexnZD2Wpw+Kfi2Uid5Z8el60cPuy2FZV8RY802WL6jXmDutaUNOpabUbfVNGmrDoaxGYGBEg8CrTLzmNMQjtcurn3DbqM/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:26:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 16:26:33 +0000
Date: Tue, 7 Nov 2023 10:26:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ml5jtqseizrvthup7uf2hdfnfy47hd6bvmq25e24zs4ev2e5zh@vd3pdlcke53o>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231103143456.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 086cdf27-f488-45dd-27b9-08dbdfae4de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yq9fDRHMf5Idt4OQYBqJEIayiwwaxpHaTDqk3b02aoFBtja7QD6jFwpBUXIanbeAvRvUOYZsux84dlnSsLz2B/9GqbgU+oVF5gVtLjSx4lLnKiZWKmG3KtzoVPXeB+EhQWDxH+dBIVMCsnfpDY17uT9g2wfxN/M6bOrMJbxKbVbvIPX3LDzmXt3rb/Q46KRhUtA7SZhUF35xN/JAj2xDs+XiqqevenARUtfVEj3Akngs2Ct/xBh016BRODXB19u+bXGCJnW9ZrRBjoTik0bPHhPhn24PLB0U0a25vjohJX91jyp10H5WhsP9atIsQalJS/yeGjs3uVoUzGOhGguqRgedXgjZWeD7ox4sWL9ZtziBQSaIfnAsQGaLkykM4a9WQM38vWrNXAU3W6iu/ngEjiH+qUCW/ewurbcaLJcDa6eH/X7nuuPeKo3t3ngkkZsof7zh4CjdLG7qYuqeDHfe4rHrsfZhWsAX5mtKqBXV6Ym6ZgzQc/NusoYTqsDj8hSdyeGh1RKTjRJr/0JXHEmSxzCv30/RdjcWNkzYP6hxgadwB2V1uI4kxQ/kTRMNEkD8ILEFmNJSwaD4k4U3at3XofDL8tFBuN75iEVOUA1KVf+PijIleuHezCWWA7opnBDR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82960400001)(6862004)(83380400001)(33716001)(6636002)(316002)(38100700002)(478600001)(6486002)(6506007)(5660300002)(66476007)(66556008)(6512007)(26005)(66946007)(9686003)(2906002)(4744005)(86362001)(41300700001)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCCxqrq4HUTLvxGP6nVAY7uWbIpsQSmFdlPIQRmueZLepVG7WC2Q/6SLmqIj?=
 =?us-ascii?Q?ozQYch+a7WOS+Rponcc/vORDwHrZPRpLV8/4v9ewf02UHo8uLi+LJWEDn/d+?=
 =?us-ascii?Q?M9iG+CjEyDKXsYPRT/NvrLboPzebpxmpbXj63NisQGmxLiXoZm1l4qIQ4T73?=
 =?us-ascii?Q?9bFCo1aEvjva1CHSq95PhYjZF1xkNJeJTmXoIItKElKgil9jIROo24E7bGhy?=
 =?us-ascii?Q?53sl9BslNJYUuf1kbhXPUDnsbXiE/RpsA1J9Ma6U06otyxLyvUwqbh8MmWFO?=
 =?us-ascii?Q?ScuRmwUgiOlw5kLt5d5q4JX8MHGCu+VYkfSMJWPqcDZMof6Nd4rWKQ0GrDrO?=
 =?us-ascii?Q?sCc1tb8NJxrsRktN5NL5tiAG9jGUL2O/2BA9ORSDqG9Dp5SWrlIpGckLtsKQ?=
 =?us-ascii?Q?2gmUnHYqOOynU35XgM9khO2oZRGarq01ROn1UrPFfKDV7wN7uQrl5uZ6Y7b4?=
 =?us-ascii?Q?P/h2UkZb6HebeEKY8gnX/YPDgONoByuAAJJ2MIRuZMJKTyzTCwVi9UzWM6fO?=
 =?us-ascii?Q?VsEfrOtgV1dQ06wwJLsi5kHZnIYLxAMqstJqHbMTdfWnUfBwrV+a2DaMGYyv?=
 =?us-ascii?Q?LQt+KOFelAu+RQFrlG9UN2DbpXoMnHSOtPhGzW+JWppKFo9WwjAvrrUSATfp?=
 =?us-ascii?Q?XocYBCqTzaiOGnXXXCLykXRJD2E5R4REyy713HrJTvGBHypBujjGmFeEo1ci?=
 =?us-ascii?Q?O1NiiR4ubpXiql+RJIcxOhoPXP6jK0c/ld50Y99n4+cT+lvR5+qL7UJXyq7J?=
 =?us-ascii?Q?SmSBt1bZSm68XJpVE6QZgczoS0VDd/AM0gHb7Wz95DtTAtKMrF8qEM4vfTTU?=
 =?us-ascii?Q?ckY18lOCATD7oDZ+TJt0a38JZJhN0GJl1ooDHtPEaf9va0QDPI5Eirt8m4ct?=
 =?us-ascii?Q?miMTAukDavuH6YteJuH/rMVvz1mbY3lwBdcOUsTetYHikVx07BPC+vIEtR39?=
 =?us-ascii?Q?sv3Wea3I/91ot1F9o88JTYU7TsMOCYCFzQfO7rlXoT4eWNykeiWDG76SWHrZ?=
 =?us-ascii?Q?aAJggxqMvNIEcTHFtP5/uR1Uqx7ZJ7K2dLQz+iET6Kpt9f8OBMchQqlc3Kvg?=
 =?us-ascii?Q?TF5vaoo2sFDj4cKUcEAyCzLTc8dGeY3v2moXO80ZoUeCF0P45m6dBnRJhVYJ?=
 =?us-ascii?Q?16Tp4V2wRPxv6hqUiI5oQVy4ic918wPgBEI1VC7J+fqaWKmZWC4lJhagHY4v?=
 =?us-ascii?Q?xV2OwAJGHYDex05O0UtCgDHVlrPlCb4CEpNGq7sdYE1ObWGjyvFqZFogw9bK?=
 =?us-ascii?Q?ZcukWz3Ii3ETxlRFmcl3uotXxel5oOunP6vR80M8kD3UsIK4S1rdQyMKH51Z?=
 =?us-ascii?Q?yaqjMUoGw8ZXXeWAlZQDcvh/lfTycQGRpuoe/uGFDIPOGuo0mQgJnGkHwTFx?=
 =?us-ascii?Q?dnQffMIBgKYPlDubi2OA4IMVKu9eTew/FhDBQg7gH8ByyJnQmvqwOU0vggMP?=
 =?us-ascii?Q?itNzMbVfVf0Sr8+NOJNVCwLG1XJY3obxJ4sigB7heOoi47iQDFDI7zcpIi3F?=
 =?us-ascii?Q?muoaPhl2jYn/VIQGoIQJ0ATvoabRiuQfO+knUrTAaCRdZy9qNedKHNaYqqmM?=
 =?us-ascii?Q?WfJluBOxfHfyKhLH33nBAa87aWXDyuUGSU2UKB+d/tY8og3PB6lm3QYXezGo?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086cdf27-f488-45dd-27b9-08dbdfae4de4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:26:32.9325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snTFmeeKnFvvsvMM8JVpSMwP8+TlhW3NvKng3kBBQMDGlOaBfG3pH3NvXKrwgDYN9B+ox+CVY1T7ZcziY4HfyUPfrM7pkIOxgcH01sOYFnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/50] fixup! drm/xe: Correlate engine and
 cpu timestamps with better accuracy
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

On Fri, Nov 03, 2023 at 02:34:07PM +0000, Francois Dugast wrote:
>Remove checkpatch warning:
>
>    -:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
>    #126: FILE: drivers/gpu/drm/xe/xe_query.c:108:
>    +query_engine_cycles(struct xe_device *xe,
>    +               struct drm_xe_device_query *query)
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>

not sure why this commit was bundled here... should be a trivial one
pushed asap.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


I needed a commit to test some branch protection rules in gitlab and
used this one. Pushed to drm-xe-next.

Lucas De Marchi
