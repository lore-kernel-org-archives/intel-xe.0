Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE33EC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 13:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643FF10E179;
	Thu, 27 Apr 2023 13:16:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE37610E179
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682601369; x=1714137369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1sXawIhLPzB2qttMYZU6rGTQTg6/Q9e0P9wJouzQFlA=;
 b=gPgxTdwE9XW0OpL3DjYdMCzxPQaFuL0qyoLw8bFsPHss+XMj7pTU3Y2K
 23qB2vVsRqX3t761jbp2Pg250/4GjYkf3pesDiTMXZmSYNn1ifpj/PDt5
 k6YsPKJJMLCyxq11hyVmy4CRN4lHDfSZ6jw+KH48XG5zv9cKKrLTC/3kZ
 5Y6WdTqam426yYXflbo8dxAf8elO6xRs0spVL10tSaU7y0wmeMccahact
 VM//vf03bnmjp/jj0+SSTHlDM252tI6EYzwRRedKseAOur5eO9pWnuIZY
 5YEqOArHV4YOScEzdhgGjOFuLIZYPmxsN+8oQtVz1hnaKbaNubiwi+0zT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331694182"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331694182"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 06:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763801354"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="763801354"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 06:06:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 06:06:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 06:06:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 06:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+4nBUx9MuKeGDjeqOdWR84lYiAngcymQdmiF4X2ndg4RgjOMZeftKp+VRj7PhcTqvH/qQFKu5ePdPT/1b3trZco2HgcPCeL5/fC9tk20/gXlhAjSd8tPI5my9u+t2iNECT3VWiAIlcm5sD324XyOZaKIC1dMj2dMiRPtPiLl/b/WseM8cN4zWPPrJby76T5dlatxoBcRDxlhX5jW7HtNwg4XiYRu6k4JUs1y7piczHelkMephWXbso6iKM8EEsUIrvxWVvmdMrQg0n3zLc5/r/o1E5nsqFsvLYINfFh38Pc0QHf+kyP6GVTp+USC2xLD6KXYQvObrlvuislhyfuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yCtuBCUKNYy8qMoh/RKeCEO1MmpN8pVh57qcz5OuZk=;
 b=Qnr5cvtpShfqBupTIMnzVP10d+QqRKIrvFXaNiq9ip6/HI75/0wVoagisvILzF8ShFqVGcrKO19k6Uj79wUTyQPT0D3mIWwk3Amc2bipaCxckUNR6z2Rw6cveSs7jOasGz/SsOvfVbWr5FfantfLZb55jjkjPCmRyVyRnpO3DRf2wyBFORnGQ5BPhphBai9KCJ+hNwHTxD39Vswbhv1e8zJeSSS4lgD/7020oJ/PPSdLZlAaszlf7bUt6eOA+RZzQVcYP1AZfnE/fICzXcI0MrRfH+jmL3TpKrjxVGvNLuf9rVlronaaT5nn59FhBtdNVF41mVajjIJGDVdKBIgQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 27 Apr
 2023 13:06:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 13:06:22 +0000
Date: Thu, 27 Apr 2023 06:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ptsenxvgflgy34zdvchi7lz56udnye3gasw47a6oxo6lslqgdj@rzrh757fpeyn>
References: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ace9af-2849-46b7-5cbb-08db47203320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QHIptnjUuhhjLgdJIXKMZG/1sIOyrpkkGnPfxlVzR55juKJohLKtChpxnm9n4argstukfxEIkdtCD7svEGakheq5cg3wKqQs8Rstwe1hsSi9nHA8FqAKxgSVBoDnjqAwF6U8HqT8vjv6HdV7o1EWhUj7WRtf2eoOOzsohBcq1/5dzYvWJ2DAx9dWyEHGZzh3XWBnJTSZvhOOKHb1b2+XmrlURRqPU33AFSkLZFdXx2PhBLs0ZEb5wc8OgLxibue+Xdpr5fdlBam/44SzgIqD2rOJJJGAVZCA5ksttNKnz7YFhuwUUDcmFmJReHazkCXWaWxEkQaaeCkjFxqULWwwUEexRGEcosGw90DjP/Slyg6Fqo5yR6g4uWBgyNCDlfC40kCB/1W8GUfFKLCA298JKGPi5HmzvrsspXplH7l1Rs0Tj1LBVXz8tjAzeemjU5Q5uRiYlo5rd7EqIZA8gobw7X4nMVv5ymX2LHFO4Jl01eOo/aDY+iwkV5IG5v6rnpBnjqTt/GQVVZdX0Gsd+FWD4I2/37e6LM9DXxLLo8QAZxfWpYRv64Gw2cd7W+z12+u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(41300700001)(478600001)(8676002)(38100700002)(8936002)(82960400001)(4326008)(66556008)(6916009)(66946007)(83380400001)(2906002)(316002)(5660300002)(66476007)(86362001)(186003)(6512007)(9686003)(6506007)(33716001)(26005)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmCulI59B9BGZntJsLgRsS7dYFj6WhUJZf3hZ8y+NEMbqEPMK+VDCzexJUs6?=
 =?us-ascii?Q?LMJcLzhpdoh0xr+oLQcddXnu+q8H1p/W7CMyfkfNCSWHn3l6pru4Q7qm6RDi?=
 =?us-ascii?Q?SYm0yyn1g4X9Qa4tLYMIw7eApck5M+ayhdyFbnZALpL1oyTFzAldmQoAsWkZ?=
 =?us-ascii?Q?gctVlJPvKaVM5AN3YTYiGhrPLhmxAawq+rxfm2s9PB7NK7HQqfeRt9YLI41i?=
 =?us-ascii?Q?7nGrMpPEXRGug09o/Yvsr6HON7lOZb1uUn2PecpB7z/89jcXAi1pl8jVpDUP?=
 =?us-ascii?Q?7bO3LRAWTDtlddI6sGvbFPBKouT2BA0a5qLxRoQQh1FQe2+o3WEjcTOmp5BB?=
 =?us-ascii?Q?hpzUhWcYWrMdVyElxY8DBiE0ykp7pCnpDG702DayOa4Yz+IMKTtekaOjKDpu?=
 =?us-ascii?Q?6VyaUxI9ZYfSpGbEyms++El8pIzYXC7/pcWUmQFd8Ar7/GEQKvbLTQ7lnuaX?=
 =?us-ascii?Q?jvfPWy/qxGjh7wuPPlGREXAs6Y5cQ/8T0UyjPMk5kvq4hRRfC5bLXXUDr7RC?=
 =?us-ascii?Q?B8Vc7iqeLz20LhsTeDoCZiTcqpIjF0ViIKyaP1Cq0ClDB0zJpTGycPwTVT+d?=
 =?us-ascii?Q?Li70n3B6Wx07SiSxCWmOUgSxzj+wekG9o8IXXtRit34KYbWwCmL1tTwFLDf9?=
 =?us-ascii?Q?oUqXZJWwWnZJHhHC+ravgBaU59/AFuhTvj01DFbiGYCkpGx5Kmh1C2fRIGgO?=
 =?us-ascii?Q?9njlRuYRu8S0hwA6Qo10sbu2Gp0Hr9p41cy/iaJ0xP2bMGyZnv6uJazofKET?=
 =?us-ascii?Q?jUGhttllvOJ4HVmK52NDivPd/5HXg8rdoshYcNrBb5nflkbUC/xRdbKKpZdS?=
 =?us-ascii?Q?XgWqbdwvakYsmtufbWMgzlD8l2GsHAE2zDF8i5wBvciQFf6OieLw1C8F6QRJ?=
 =?us-ascii?Q?i5Jzsn/rVJ429wUDe8HprDc/gslYo1V7C4ndVm/61GD/cMM6/soiDDktYepj?=
 =?us-ascii?Q?hhMJEVMMvzwHTAMlfgANC4rieQhdbDHJo5/ffIHZE1zWPsZAj8JvlWxeT4cr?=
 =?us-ascii?Q?7a0QPNoC1VBVz7xAwQ0R9yrNeoUEf54KFxPo1Z6uVyt1t4zoemQE4ki1SuEz?=
 =?us-ascii?Q?8vODuEyGdc57rz5KwIcrDR1alCnjQ/+BBaloJOEwm36gOQI3+wCC8n2+hTW2?=
 =?us-ascii?Q?vxtswR3g8ViY6IfaYurAfJ5QFNlqFhXBkc8tmlo1dtDdtvC9vqoF28NKFi+T?=
 =?us-ascii?Q?zdV6fQPB1zWjq3JSGZAhXvpguzo7ckP/80pQzVupwjJ+WbAxBuDaTBS8L04M?=
 =?us-ascii?Q?PoTwYiemlqsQ4NAiqqg9V+P7n+IEb0yvXBz1dRcNiwLjYv3EWIKbmL7YMzCW?=
 =?us-ascii?Q?09ijkZBP4lG/TBHoY0i+D8BFkuCpN0soRWe/Yc5heasIoxFbN3Gya5e+Hqze?=
 =?us-ascii?Q?z1ILbe2i1xRQz5cUoMhwAvZVOxqOKrAwRyfJcFEL0wdhtr3WGLXlYH1zvnbg?=
 =?us-ascii?Q?Ypepml2HQTM8GE7rwJdfzL4c71HAmuA45D77lW+YujdNzEhOSVqDddKOKbez?=
 =?us-ascii?Q?48Vj8WVcKFowO7BsOfapfN8xfSYl1WZqdNz8Euy7ry6QfU+dq6NNwurJTy4U?=
 =?us-ascii?Q?g0pQYK2WrFz3idC1IuXNTar890dczXSWdYOF0VyvNySMqdQ43iYUPWB8PqfC?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ace9af-2849-46b7-5cbb-08db47203320
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 13:06:22.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLJkqes+xv2fQ4EsrDh7Y2Ry3VRPyDbZ3Z8N50e/lZOMkQYGTYR127t+qPqbm9LehM4CvJVOO9X6X7ohEaNuvUEGfea0nVXCVP52ne/5jp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: destroy clients engine and vm
 xarrays on close
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

On Wed, Apr 12, 2023 at 02:09:23PM +0300, Mika Kuoppala wrote:
>xe_file_close cleanups the xarrays but forgets
>to destroy them causing a memleak in xarray internals.
>Found with kmemleak.
>
>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 45d6e5ff47fd..30415015db4a 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -70,6 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 		xe_engine_put(e);
> 	}
> 	mutex_unlock(&xef->engine.lock);
>+	xa_destroy(&xef->engine.xa);
> 	mutex_destroy(&xef->engine.lock);
> 	device_kill_persistent_engines(xe, xef);
>
>@@ -77,6 +78,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 	xa_for_each(&xef->vm.xa, idx, vm)
> 		xe_vm_close_and_put(vm);
> 	mutex_unlock(&xef->vm.lock);
>+	xa_destroy(&xef->vm.xa);

looks good to me considering the xe_file_open() initialized it. But
shouldn't we print a warning or something on !xa_empty()?

Lucas De Marchi

> 	mutex_destroy(&xef->vm.lock);
>
> 	kfree(xef);
>-- 
>2.34.1
>
