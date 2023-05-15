Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72916C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 15:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415EC10E21F;
	Mon, 15 May 2023 15:32:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0810E21F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684164748; x=1715700748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UQQT1vgmIltgyMFXIH/MP4+liM4vnWB4jRim7PphCzo=;
 b=YrXrHQKNSwKAENynnfYPKnKcIen6AzAH9eSos9HNGGjvVp+uzuGYAQDH
 0NVgRs85BX9bfEwJCzdSLkr7iJfqVL7uNiXkErthbxFiW8RSm6pQ7Srcv
 t007onxHiTGIwfnGJX78cCePSw8qQdb+BRZQxeiGhRTDVIE4ZMort5EjX
 8AIDd8PC8Hoc3431LPTD4W94rvTjnMtraL7wzhqjjvUh/BmjB8QU8d9wZ
 KYsczGkC7AFDsBDOYAL2nPTgXSj/CUvbc+4/JPsrw1v24QuoB9aajynt/
 YvnckpUUn7f/VL/5UQuqMnO9lZRUZhWKBrsK45jCQiIuIfRYNhQNtmRfi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="335774064"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="335774064"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="825224010"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="825224010"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 15 May 2023 08:32:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 08:32:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 08:32:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 08:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdT/HnZ+/zA/LYmCAHbcCxs9kTm078j19B+J3VgKu8yEy1zM+K75Rx0T1qFBoqHnldEhoSCEfGFHi3wzVitsTWJCWzU7w++chToqu/yKGRzDB5WeimMv3Fnlxu+xNCm3WGr99A33Akx+iwH+lRLQGa8oY7WrPideMuZ84Yf9cz20HQyLj8oiYRpiTcR0DdgghL0Q92qn3otweIFTXH9EnehGphg7XHDQ9gp4kjnejeKj+j05EeyjoZ54ss+gmCFDRSYpYVA5RzEHgV74h02gBU9y65TM78Rsqn2EsHJIG+eM/MVFPFiVdw10o9xGmNsec/kuVRrXj0nWwf3iuwRWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwSE9I4NEa6DtKZvNJlBWLeTy3O2rmgMXKIOW3uLGk8=;
 b=FyNLYjOFDU1tNqZuZYz5gQnFw4OAGGNeFS3kUMk+2UD/PHAgGgPJtp+Fvpdvi4iJVV7dYP0yk15/htQ4ez1lNd3qbAZErSPTGsXBFPN/6M4BrAJzf+V73We08bT+Ku++LYa6/QMlCkDNWdVDvMJJxbXX8WGi40ApBHTx2Dj4CxLCNHh3e3+5fuWGFQtj6E7DJjkeHEHd8QJTjkN+AVzqJPVnnVpIQIZ1j7tDQKiRIbgmAgc5NUl7VzMO4TDqucw29Yj0EPCv7nD1TbpkltI3g9zbXv5onLEGbvO7fEid/Qej1OPHXkdc3zI6m0yZPsbNVUmaSrfN3UtNnrqtb4MjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 15:32:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 15:32:25 +0000
Date: Mon, 15 May 2023 08:32:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <42fhof5tw3wujmyf6lt7k6met56n4u24mh7eh2g5cgfan6o3js@7covwvvx33un>
X-Patchwork-Hint: comment
References: <20230515151548.13-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230515151548.13-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4625ae-158e-4516-e33b-08db55599589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59GMEcVDQH7d3FVL6lecfSouV7wQejyHH5xTfJcd8HBc4FCVaNTntQy4YZ482XlEj106aJt5yi/AxJfyye2qTEfy/v+xT7I8Gq+i310NlJLbe4A5qR3+Si3cnwej6tSTry5kpsUVeNmbkkjqzhGXDs6AsHvVrlqM6ghigbWxrskmrIrVEva7cm7wUkUzicQcV+XgEHeq0bIqV3QlCOCatZd9hlvOYkaMl+Fj3WhBJbTOvY87sCmdsJ0lDQarJDE8WdxKfIV7x5MexfljCMYZcQa/KEDBnMNNMCWqohvuFoFHiJMfAERNA5LhUpWGmN1dyoreIaOgXC285cEDhENKZbWiJdTb+noH4d4aYYe5UXykthDhyzn+wZh0Fcp39d0ZvuJwmPQSWZHbWZ2wJ/UFSdw04hXhKDhzY1fnbWvkgG0Q9RAGsHJ73kd5nKZvUGPtF5pFzHmkn70hPpBDSSAvwc7kBrLxUFxg33PxsDgtbkf9W8lDJ2OBcwRONXrGtGv9zgNAfxkE+6CU7lnItyPsoL9bBSIoTl79Dwg29lHQAxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(86362001)(316002)(66946007)(6636002)(66476007)(4326008)(966005)(66556008)(478600001)(6486002)(33716001)(5660300002)(8676002)(8936002)(6862004)(2906002)(38100700002)(82960400001)(41300700001)(6512007)(186003)(26005)(6506007)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/UpQGgnyWXKZ8bVZ9aJg+id8vMwnVbJ4ciNERfgiMDyB6tmgoB2UVuzR/NzZ?=
 =?us-ascii?Q?P0Ij3AhHj2pE0EpKOdTh+23ycd4zEf/v5QcnDWYcdCNgy7yRPdVu992SVYye?=
 =?us-ascii?Q?ctf7CeWGR9J1G9Bg+Q/z1I8AEL02asoGpVd7R32uSgqJMmUoD7bfxX8stzjA?=
 =?us-ascii?Q?G+ZxIci/Gr+7TDLSoWafw9dejSGtMhOPfYAiClTB0gg6Cb00xYn6089KLFKZ?=
 =?us-ascii?Q?7GOsauj/UGaBdL5uekfzd7Zh/jZwepPQ9x0JLSM8JcSDJoNM4Bctt5UJwew5?=
 =?us-ascii?Q?e/4gg6OvqmqhZ/ImTXMPT7bo+A4uune4y4z36pSpaWraKHjoQ64htv0rPJjV?=
 =?us-ascii?Q?N/mLfqE4WYJoJebMkBHKdRAmuKIoRjgvXTSlA7+etQAWe9dxgoGDLcTjM6rW?=
 =?us-ascii?Q?sM9s/WnWEQOQW2eR1yfCuy82Ae/aD8XeUVdn9IZi7mVUO7wb5MfaTwXvXSwN?=
 =?us-ascii?Q?B3IAPOKa33IwdNhdMNdvWuEaBabWqnPa7LeCjrCDFIUTzkSRF0sC0nDndzCA?=
 =?us-ascii?Q?aJajJY09ThsjehbzLuSXRtI3ErMgS62Rzfv5IqnjM3i0u/ZaP7WamQvUZxcF?=
 =?us-ascii?Q?12WKiWhTB/b7dXZxeeWXR7V29sszDPQqFR+xiKLBeUZ4sXtLS9wxOlGfjqsK?=
 =?us-ascii?Q?Ewu2KDDBJ9z6RydBx26ASW9qdpWGV7xlGbn4QxYBUNRR5IGwMDphPQ65C1i6?=
 =?us-ascii?Q?ieP1SNXkkM+W3PgPBM3ihJyPNu+t6S2YrpLbWUfhfAJjugkXIZ4PLhhhHpMk?=
 =?us-ascii?Q?fkMyK+p05091qb+OwKXCLTckFrqA9OQkLtduEqVwSBiV9fFtWfMRqDUz4HB2?=
 =?us-ascii?Q?oDQnlwPX1S/+byG5XVJtgcE2q35B0wpgtaz9UHZNp+i14+bZyHSFpzcA1x7+?=
 =?us-ascii?Q?nrxyRSSBsg/0MAmaSf2ERXLpyHiK7poiGnfxP/1AUCv1pN26J/sEy64OE0oT?=
 =?us-ascii?Q?XH0eKVqJkWk24OLqcTnApmtf/xc8iVgxtctn627Ju2o3CxLQiosejvdD41Px?=
 =?us-ascii?Q?BSWgtIr541z0haoJhO6a/gO91unaRfPRD5XPUdStOgXseFoZB1zUaIFjEGOS?=
 =?us-ascii?Q?b/wQ6Q+/NcJhBT3OiVgWqxsKUX2NlEVHHIuu2OPRwC9hU2dT4Dzc64wWAFJn?=
 =?us-ascii?Q?GHAqexn0IY5jFc+hH+SvT6O+FyLyQKZowRcsgwPhBOBtIiVDiik1bUf9HWsg?=
 =?us-ascii?Q?ktpytCQL11mP4FcMHjcyG56RVD2VggsQe3YQN5cy11NeBmf8xs/Mg3SC9sFt?=
 =?us-ascii?Q?puWipWGamCbOkyD/ZGGIJWgXnztQ4ABnicBsZZaUt9DHnwWpyY9RUb5SKKhg?=
 =?us-ascii?Q?HI+b+mv2Y5tqU8ywK0WbYLL0wz3o00uCGhsmtY7HpRiyKenT58TgWv8knbik?=
 =?us-ascii?Q?RycidC+q7g0LMgOl0FedxX84f6QMCccwEF9n1ZU1Ass9FFQ5yZKkKrAxx7kG?=
 =?us-ascii?Q?YgzqKfcqHXA9VyTea4xQRuoYk3b8N6eXTybibW51gLn3pXfjemCMZdzxQySy?=
 =?us-ascii?Q?nk7GZt2PT8OC5XcGp4owGkkySGFV+Ean2Y9y9t1opt3nNk/7H4o6POhMTGc+?=
 =?us-ascii?Q?BB1G2kdNBxBsDtWQzywB/dmBZRb1SGN18SvaRCI/lXGR+1Hbxb8rO2bhp5re?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4625ae-158e-4516-e33b-08db55599589
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 15:32:25.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRlItxX0GKf41Jt4N9hB21m72Y4aTOwtYjiGNDqPHl7akqOZaqwBy3gjs2YzddD4jShU3rdKNOMnjWQuXErlr8f00HDABq2+Trq6GRaDEkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Dugast@freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 03:15:48PM +0000, Francois Dugast wrote:
>From: "Dugast, Francois" <francois.dugast@intel.com>
>
>The driver contains code under GPL v2 license and code under MIT license.

that is the wrong reason for dual license

>
>Link: https://www.kernel.org/doc/html/latest/process/license-rules.html
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Signed-off-by: Dugast, Francois <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_module.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 6860586ce7f8..ae37c229a0b7 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -79,4 +79,4 @@ module_exit(xe_exit);
> MODULE_AUTHOR("Intel Corporation");
>
> MODULE_DESCRIPTION(DRIVER_DESC);
>-MODULE_LICENSE("GPL and additional rights");
>+MODULE_LICENSE("Dual MIT/GPL");

The module itself is GPL, like i915:

$ git grep MODULE_LICENSE -- drivers/gpu/drm/i915/
drivers/gpu/drm/i915/gvt/kvmgt.c:MODULE_LICENSE("GPL and additional rights");
drivers/gpu/drm/i915/i915_module.c:MODULE_LICENSE("GPL and additional rights");

GPL can include source files licensed as MIT, but the final license of
the module is still GPL, not dual license. Same thing as from the link
you provided...

	The license described in the COPYING file applies to the kernel
	source as a whole, though individual source files can have a
	different license which is required to be compatible with the
	GPL-2.0

... but applied to the module rather than the whole kernel.

The inverse is not true. You can't license the whole (module) as MIT
since it also contains GPL-licensed files. We could if all the files were
dual-licensed, which is not the case. Since several parts of xe is based
on i915, it'd be a very grey area and license tracking nightmare.

With that, the disclaimer IANAL applies.

Lucas De Marchi

>-- 
>2.34.1
>
