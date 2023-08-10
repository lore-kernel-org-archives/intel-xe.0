Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D57C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 21:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FFF10E5AE;
	Thu, 10 Aug 2023 21:43:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340FE10E5AE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691703781; x=1723239781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mWJjX0JaqXFpoi5Hfv7/Y5iI4Pj9TdiXDLTI6ljGKxI=;
 b=fH+m+y4tiilvQ6cG0a9UOLtgneO8oWBigx4lVAI4VXbHGRRVtsmmHs/8
 dixcM8UNpRILvUQCdj5T8+mgecMVypNDfA1rQVqqGOB97fbpWi331P4fj
 /oub1YJlRv5dU3aaI82kZ2q57kGZTfqchvNAIiudicAl6SJS2LX+EEVRb
 C8uSer0wngl++OAc/tcUVPcl5z9WNY3enLrxVzmxgPTvGtsXfLj+8tQZJ
 lSBC80X1UwMb6goV+lFR9txFbo5LS2KSZy3d/cohZLAF4E8czfwi8iTEK
 NQ0uiJv7jS+DDKGE0g/+9eivuHrco1vO92jVa7aOCoBRzeMX+hzdeChmt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351134865"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="351134865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 14:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="682266501"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="682266501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 10 Aug 2023 14:41:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 14:41:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 14:41:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 14:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXXwSpGd+qEb+ljr9IpOOryC+6fKRlE/17KlSgEv6UVD3H2QG9BTUqJFnddX++Ihj4+Ff2nx97hJUPO6pkw/O7S/I0ukENis0WtI0Z9J8QV5fQWE9f9KgB/X/sVZ9TihXoWwRUtnTLlQ2h07jOQYlJBdN1xxitA4GyTbPRmWOns/m7L+4RN+x13PdaXO7UlXX3/dZ/kqVc+6uPWfGvmOQO3Fb9k1I8eZlgycY8ddyP1euJjey88c3AGT49zcnfHCZsM6D3L+2l9pReb2pAdg34iDzgXV2FC1MdGSehy+aNzgoYAAD5nIXeQdXUlI4uaatcFxq+C1CUB3nQqEvXdxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2aBfO9klrpJmmZ8mVjhQv+YEUDLBL490wQn2N9m87U=;
 b=fqIePUh9YXuK2gUJAXa9G6mzP4RCgWKNOswiqU9ivaiCF+EcFBvGJ2C8Dwotpr6FLK5a0rHhuRH+7tFBWrQCCYiVB8bQucIvqsWeYzI/TZmS5KWWbT9M1f6abgRu/VzM/Wur02sVNoKsmfZo01BulwzzJSQGNZ83PLRksE1Grnu49pER7yYVLz39xOAsW1d4n2dO7JQzhM5Yo6b4Sds1fgkkJjie8+1iphM9UF48XH5Nb38YXDr5iZxDRk7g6g6e+/RVbtY5hVWGCKyrBKQ+fTOvXAFPr8E4Q6Uq4bDb38VhEZhEwMl7pzR/M0uEqp3vevZjESdxBjg92zdbf6lYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 21:41:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 21:41:08 +0000
Date: Thu, 10 Aug 2023 17:41:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZNVZb3H4uBHtU9K7@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
 <169161122546.10297.4625741320570358620@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169161122546.10297.4625741320570358620@emeril.freedesktop.org>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a0e756-7bca-430d-bdc9-08db99ea81d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xpyFSoFTj8+gEVQU7do3gxQvkdxerLmwulTFHCDLYVSlDHYsEeW6RedrKgIVyeiDF89qoeOXNegbhmBcJNd7XtSYCYVIyPKzAin4h6uWWz2J6L+xNYDIBEEpTbPEflfc+QcF/nepLVner5dBNdS4nuZe6xi0QeFBdfELuK9GEHx15In8LxLkpvAotR4QPZxOYRSO5JONVNsODLln7rnktRgo/KdNpb97MxToQE4vHJm4EnylSIFEvaR4bAMmt9wDcsDRwpRpUrIl/r9UjdOLo0ca7Z2zkAy+6D8YP6ErQd1EeAS48mzszbaye4zF4VB2IWWqRs4fuY1i8QgiWhOiJqJ5L1o9svoRzZlZ+XwQO8B/9kEb6kMSbDv+qsJ/etDf+hZr7ZJBLEv/TlOY4eW0c+CWn4prdq2l64xaPUGVxMXLnUEChs3zi2Ls2ehjvXlLgyu6qU2zNTHIIl7Wv576nnZUkF1ngpbek/+Awca+eH/fyUKfRgQ2z6ijytHkkBoxkrM/g8vMTMq2xcfv4Uti7UaBrGUebBGLdSw+kua/sJW39Ct5/bESJYO5rmHUrPrvj/lC1pjf1uBhCz7j7r07A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(186006)(1800799006)(26005)(6506007)(36756003)(6512007)(6666004)(6486002)(83380400001)(2616005)(86362001)(82960400001)(38100700002)(107886003)(316002)(4326008)(41300700001)(6916009)(66946007)(66476007)(66556008)(8936002)(44832011)(5660300002)(2906002)(4744005)(966005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rpvELmepeVIeKlgpPdKdFmdvKJEZXddxYqrcWy3cevVjO3Vo2yMoE5GP04QX?=
 =?us-ascii?Q?vjFGDZqR/6k1p3Myw+I0W1ebY5vu4Hneo51gx/gx6d5QcZllOSr5ptYA44xn?=
 =?us-ascii?Q?M6/e1imLuYewT0qke/JPfLSbNW8GychGoWg2QiJMwNsiCvmlUR6O0DGkM8iU?=
 =?us-ascii?Q?kmGkCQf4gOeLIMMcUaOJ5ckSsr1JX5kjDjheQCAM95qhfjQukw/YPtRnYikA?=
 =?us-ascii?Q?tuXYqwzKBtxZnv3fPGR2aLRNX6O7b9KUkrjthG/8teB5hmfTIV9+4LdVKwte?=
 =?us-ascii?Q?I5E/svsuM2bn0pxoSl2BRaNZ2fMNatalfi6HqBBFDtd2bple0GbuQugaHDtk?=
 =?us-ascii?Q?Db3nSU6RoJQcsXF1N/qndYWY7a6T9EjiPKNSDqVXLeBWZo1ZSnRSsJDlIPRb?=
 =?us-ascii?Q?Ad8ICSkb1UfFaoMwOvDvLOqRrvsMXnf3zg8bfT5WiFXg1HYCdgPICRMVzjuu?=
 =?us-ascii?Q?t/kFOgMtAP2F/d7H5bZtwOBMNtqV+dnSaeo7ub8tQLS/jHZT5KzGIwSN+CIe?=
 =?us-ascii?Q?2+JG90PO2ha3krZ4To9Q/HNsj6fAXy+lAAJ4tYqqrFUJiGpbcKCHXm8bKnre?=
 =?us-ascii?Q?QOmyNQ9OJUJ+5+MD1VxJypINLt3IBjIr5qjLTeUFVBwZMT5yyAdVWlWCWYNC?=
 =?us-ascii?Q?7Qi8Agt8f9990N3BuWFA9mZCDXOCG7ASMkbrHziTjtCdpNuPHRYzD/mAGZgc?=
 =?us-ascii?Q?hPyvaoEKaywAgrDKDhRav0EiT4FV8hoDlRbH7lfwx1JsF8XIgASpTO+CPcXP?=
 =?us-ascii?Q?1Ch+EXoLirLa0lxWqCO177L/QnHKi62/PnCUp45xphDJ3n1PhaeGtJ2j6asb?=
 =?us-ascii?Q?pQUU2GlkZfKykWdSpYDlLl+EtV7iz1DCiNsnqeVlHpCVnx20Lk4ci0LcU5LE?=
 =?us-ascii?Q?VXwMqo0CMAhsT75XaHBLyO0NQ7fFuMbt8GdLwrTJCIk7cIQ2Zqvvi7VzhdcU?=
 =?us-ascii?Q?Ry1LP2RA4JKmsDHOj9IsBTX9fkDRrwzr0RcAmDCwGnAcN9MXiY4cSRuPhFq+?=
 =?us-ascii?Q?WTk2EfBqb0xMpFiA7NWfJtVDoENXytJGpESZSW0fvk+2RXx7tXmfNdkLSt06?=
 =?us-ascii?Q?CdhGKvTkzPeorUExNPWR0C+zIQplj686941YxrQ+eRUwV2cKZ9Pxzt6cfIIB?=
 =?us-ascii?Q?EPoz2F9XeT+uyga9yN+X9CYThT8JkFILh9eaErKh5pS5pGG/HrwYvCSrP73j?=
 =?us-ascii?Q?UBfzJhbkStKaeM9yFSYYvneKFu24VcSrVCMLOomJ2klnZAJIsRi3kChvyJN+?=
 =?us-ascii?Q?j27NdhLhW2vPQ/u6egR6MdzP4BAcMwcGi77l+M9DgBkQ+4HHHo16u9yGRQW+?=
 =?us-ascii?Q?z7wKSn2HDX6G7aGrKwNJVc4N1QReG6nJ4VyZVZVdzgJ5zN65AqEhoxONixLs?=
 =?us-ascii?Q?63hLZMuhcBvtFWWZPC6p5B4etuaA8BYSJUN8PByLNBqRkmv2BXL96xlIgNaa?=
 =?us-ascii?Q?dVNIqWhD4BQe802oCqoW94cVIB4y0ofzntnGv5YOTqTTQuEhfTdKHLlQNNqZ?=
 =?us-ascii?Q?YS07fxzoNbZM5PJlL/Qr9IuDIFF5PS+pvYSQPIaLJL8aWqw/kEaot4rdCyWW?=
 =?us-ascii?Q?ih9nTx/lV2lyGMvzac5dvPcFwEiLc1S+qidI7gEtthh2D5AR0pVdvbsTBYgj?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a0e756-7bca-430d-bdc9-08db99ea81d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 21:41:08.6271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4HwQL4tEYtsXPFxUq723Jm0HLJPw0Fcmg0mkiVtK2KjisySx6I+TnYSoGGHebJA/XDePVvpO0Jauc/FB3vdfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5Bv2=2C1/9=5D__drm/i915/display=3A_add_I915_condit?=
 =?utf-8?q?ional_build_to_g4x=5Fhdmi=2Eh?=
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 08:00:25PM -0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>    Series: series starting with [v2,1/9] drm/i915/display: add I915             
>            conditional build to g4x_hdmi.h                                      
>    URL:    [1]https://patchwork.freedesktop.org/series/122242/                  
>    State:  failure                                                              
>                                                                                 
>    Participating hosts:                                                         
>    bat-pvc-2                                                                    
>    bat-atsm-2                                                                   
>    bat-dg2-oem2                                                                 
>    bat-adlp-7                                                                   
>    Missing hosts results[1]:                                                    

maybe it broke the build without CONFIG_DRM_XE_DISPLAY?

>    bat-pvc-2                                                                    
>    Results: [2]xe-pw-122242v1                                                   
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/122242/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122242v1/index.html
