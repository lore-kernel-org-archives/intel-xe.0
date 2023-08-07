Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE9C0015E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 03:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692CB10E1B8;
	Mon,  7 Aug 2023 03:00:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148E410E1B8
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691377200; x=1722913200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kMfdteswiRO+zzYPc0ZcTety5jLyEN34nrzdl476xUk=;
 b=jWGgvT1qW/p9U7MKK+vc6Skq5TqEWTVw6Q+tNK9eaa3zOgtpurY80LRb
 nAhr0zOPYvciMLDL8QzOaR72CrKL9KT7q2/QcwDTB9A+SJTjfx//F+AaH
 /CZReNpydAHtKkRHnwWUpkfqbemBvgf7ZtYlKwxa/8Mqr4qS78Epq5o+i
 wYkfjJbMOoTJVPogzt7YFuiArWqyPzbgGDV7PxK2MrW9/UnN0wQFb5rXC
 Pwk+cbb/YJM5vStILerBUx0GhEnUjoNiUTeeQYqJ+sTxH7sOAfwEGDK35
 MJ6XdJVdIhVwwj85QKtp86eDCLxhWwiXM0yk/YWfwhTYCw04glHTjxitP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="401411099"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="401411099"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2023 19:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707695817"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="707695817"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 06 Aug 2023 19:59:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 19:59:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 19:59:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 19:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ+r/ZPgnRn40BGFCkINPj+/rWhyk/VVKC/Npqb+2QEXdLkQNHkqPEoj30KS1ESbIls2vDqmAMT9m2/HFoBO9ohMEt6hdZoyWtyKhISsFULhSwKyidAniU+i2hRTy0hWMZUh3PMPrIUE5/smWysa7zL0D37JBCUT8zetVvmMIoMAsm7hQ1blSfIlelLdOvnqvw+/tGDF+FTSXOevKKkyE91H/bs60+vUsd+kDn2yZZL2Vs+ARV84aSPPSGoh5ssfbJCn2QPePPTzMaa56hTqrudc4f8mKIrDGGSal8SFenhk0EnQniFxkj8OXl5OmaQnUX20MDOey8pUBMjwNvea1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAJg0pU36cAUbG30zV1MN6iNs83kjdghlg1e0WjmJl4=;
 b=IKlht+ZM8e7kL0xF0xGVwTdeNAZaQXT0HZWlHOpcUCQtRKTRbIDhzMdlD/0C84DfBsq3DnryQ39pnWMHPW3D6HcE4isl9QojoLvGF1t8cZVWOYZfIfuHv6egQHgZkYzlzdqm0MzOtUrdgxJ19n9ZiIV4+VL7xmZhwWNOyHQZZq159qQs8prgh43luPszhH9wfZdX+WM0fegiIkmP7keLcSUBg71e0N+QLcABQ8A2nzxLgx95bgQ2yuAQGUqHEFeuhkTRnUHKZefgbukH8BWQoTFbMJbfiAneOgBJOWs2ny93aVTDqyZl59UphzhEM9sF+vx8QB2+eXW0mR+rRbzNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Mon, 7 Aug
 2023 02:59:56 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a%6]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 02:59:56 +0000
Date: Sun, 6 Aug 2023 19:59:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNBeKVWdWbjvaStC@nvishwa1-DESK>
References: <20230804231709.1065087-1-lucas.demarchi@intel.com>
 <20230804231709.1065087-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230804231709.1065087-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|SJ2PR11MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f81a186-ac2d-4295-5686-08db96f26181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IS3Uunb7mUG3zp+q7Tcv0c4RZSXB5AmTeNjF4l9rI5/VlEiOByAYnmw7wwgtIrix3xVARbmcGUwPJkHonzuRJPfp1Yae+o0xrUziYE8xWJQsfZwOjwMzW3j3yvG6lGs21hgjlz/BKhfyyuzz92imPlW6Iv30Vvq0PhCTFt/uswM6PRNWHcbQ3NZanMyhJrq4I5crjCvCRtXFc9K5mLykfEBx5tkHjQM3T5B6fxkexPyWR1E20pgsEiClLZAjhXq3sE2D5ULoR8Sjium7kF1uOrLoKLdvYn3CIBzLo7RdJqw6KRndU0OT0TMhIewibYVeWmDQyha/o1AO5xgK7da0P8gFtD7nKO7P0wi6rk85z/ciGvAYAFSJR+RkbfIdG8UkaW/CP2T/Tt9zOGkuRtNxPnUK7cO6WUz0D1mX6dr7oNBN6KySI5dUZOWA/3Fm8EjQ871yDFNnAFPfpvy1hyOyUDNu7eR815l96z/Zwq/ScQUBO+0Q9iNOiOScic5YTdc1OeVER73kNhWlNNXYIqrghvh+4kTS4BQNtR5EkEyobFXtoltzkVWObunmX9Vez9XN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(186006)(1800799003)(44832011)(66476007)(66556008)(66946007)(4326008)(6636002)(2906002)(82960400001)(38100700002)(6506007)(83380400001)(33716001)(6512007)(9686003)(86362001)(26005)(478600001)(6486002)(6666004)(4744005)(8676002)(6862004)(8936002)(5660300002)(41300700001)(15650500001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+47kNVSTHY4Trgcc8I2tbjLW1Bx9iamYn2bHEL2nMKaaoVAzMQqO1IeLUli?=
 =?us-ascii?Q?8IoxunkGTwbBfqaqFCEFP5kMMX9hrRNkS0Xr7m2enaRg6wvSMqCRW9oQMLkj?=
 =?us-ascii?Q?hTISHoY4KLUrF99Z8um7lFzSNmMCPDuMY5GmJoyLbLDINOOmrKSJ58vk/qIm?=
 =?us-ascii?Q?bDTvubtwn6m2dxMK6gtyixy5alJ3Hn/9wXXvrXMwzmwWJA+13s9hyAuIshNI?=
 =?us-ascii?Q?Xc98fQnrU7OXgUUQGo91Tjq86F5dLm/zqYDtddNcKqGCUoAtkdxxsrsgYtxH?=
 =?us-ascii?Q?alVztjB+YE8JQcUqK+DsEmeLWPozzv+J4SqFsuGocOuh9pvWB1RrT+yDNTCV?=
 =?us-ascii?Q?URh5Zc7BTQxWtoH7qch7H1re5K/Fvq6qFHi6nSshPUAFQwNa/XHIxNlqsbQI?=
 =?us-ascii?Q?iv9hH/cMR56VsxB8imrqwVOs/tSmvbQ6gW01c4GDg8eMm38uoS+vOL91Gjme?=
 =?us-ascii?Q?0+/7prN1JLumeOV7ZMYigNZGHhMZu2m2UFjGEKXe+ouCtKnHGbFHmqTrJqq6?=
 =?us-ascii?Q?cvVvVJBRoQZDc3JHVcCvg9JoikKDcssj1SVTYfzaG7qomqzZ8d6sjycIurbH?=
 =?us-ascii?Q?O4cYI1jFoQptejKLm/wcGKJqNWNR1482cXZB3o8EJiVZimjnclFf304Vu4Sp?=
 =?us-ascii?Q?0Ta0JWZKdR97LmhIyJqvO3/e+IR2bDScJ0yy1Av6GzBwo1x+OLaHBRcVjsm1?=
 =?us-ascii?Q?YdHQKYd6ZTyK7vriAOHbU0jcTlM9S0OvdqMLHgTrGr9tAExzn7P8ddypf7B/?=
 =?us-ascii?Q?p6pLjgJReQRUM+CHfFz5yUhB0AkEC6Xj8zhJB2UiWgrfXZkzLbHH+3jW1+F0?=
 =?us-ascii?Q?8uW/bFFOChSfgzJksw6imFIuGk+51bay0ED6mAyUkX9tvJPlQcts6GiiB+fR?=
 =?us-ascii?Q?iOfsDcYX08cxwyGo61auJQXBFgXcYsTQkiEIbuAzYdhOKPpVgbaehnCar9Pj?=
 =?us-ascii?Q?CdtRpNC/Zdt58zxot63Jkf3XU4zTrg1N4G+8VJSsTwu2X29itPUACyZthykl?=
 =?us-ascii?Q?+CkOFWGK8E94AsPXgGPVb48oJqZcLoZyq5ngUnwynu2I4oQR4zQB8O5uS5as?=
 =?us-ascii?Q?aggrJcqcmed0Byq4Zyvxw50do9Pk6d9cS2YSPJ+rEn2z2Ck9+hm3IgqHCy+/?=
 =?us-ascii?Q?9UYT+a4LaVPHgf144ATkvY0nVe0Q8lImXpzRm3d1kQW8e3PkoQ/8SO/C9jgG?=
 =?us-ascii?Q?sK5Z2p9IHz4dc0dRo+cJskgJ6r7AKsN8ZJoMNmhJ9dAxnX2QCr12WUBrdNkH?=
 =?us-ascii?Q?OmpWv0NITPFtRNk3oSaBy+tTpx6Jw7DhcLhUbYQ0C/6Un/NJpKN+4mgXvnUy?=
 =?us-ascii?Q?jWv48e0MgfppaJF2Cr5iofJPMhkiODO4+rlDkwhpF/7WiMsFambavyIqH6SH?=
 =?us-ascii?Q?SzrMC2oHKnqeVs1CHd1y/84eIo9N0NJDsFueOmS7bhdb3vI9qzmbqPmLyrGI?=
 =?us-ascii?Q?x7/R2e9nfBq1DhUWvqgM5zsLlbqV5qTUtqnRJTaFyCYA8wKSCLwkx/Tf3+QX?=
 =?us-ascii?Q?gkv4VSROfWYIJOb4DQEuAFayyP66bkUtw3TEsSxRNiAf3jFOYrPkh51YJSCJ?=
 =?us-ascii?Q?GelUmV7W5EI0YMAEejwDtmXSODA7K9cGSOQ0PDaVJ7WeP8ezCS4t8Tb2XJxk?=
 =?us-ascii?Q?dUaZBnm1dl9kLLRcd58+bKg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f81a186-ac2d-4295-5686-08db96f26181
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 02:59:56.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNA/VGSOf7z1Sn2Hyjw+El/yU8+A1vBPrnQiP3UUrYmPGUK9a3xhnfwKFKhZfpqX0jUH8pg7Clgt+5kTDagHjh96W23t/yT+f2IiGdLe0Aa3lktwwHn8R68BzFcqvTny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Update ARL-S DevIDs to the
 latest BSpec
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

On Fri, Aug 04, 2023 at 04:17:09PM -0700, Lucas De Marchi wrote:
>BSpec changed with regard the DevIDs for ARL-S. Update the define
>accordingly.
>
>Bspec: 55420
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> include/drm/xe_pciids.h | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 1263838617d3..43afd973e153 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -199,8 +199,7 @@
> 	MACRO__(0x7DE0, ## __VA_ARGS__)
>
> #define XE_ARL_IDS(MACRO__, ...)		\
>-	MACRO__(0x7D66, ## __VA_ARGS__),	\
>-	MACRO__(0x7D76, ## __VA_ARGS__)
>+	MACRO__(0x7D67, ## __VA_ARGS__)

Looks like there are few other ARL ids as well?

Niranjana

>
> #define XE_MTL_IDS(MACRO__, ...)		\
> 	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
>-- 
>2.40.1
>
