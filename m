Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C97C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D610E483;
	Wed, 26 Jul 2023 14:23:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EFE10E480;
 Wed, 26 Jul 2023 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690381413; x=1721917413;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TjJ1o0KwXoFYnQPgNLX5xq6XiNX3nM2n6buEHIW5RnE=;
 b=KsiOT5Fe29VxdyOpytixIncZM4ftMnkKl2Na5M8zy+taGc9qE08UN5Zo
 jT3GSLKP+OovyuAhf931DEiW7z/nLfTisb7lp8a3Hc+h7Nmf2u6pyK42n
 9URQia+f1s3EWdWs/1YClTl/cYlIsYAK2wP0PlrJGOEwlCgUSJn/momOO
 oKv7rgdPb8yPrkLx7/zLkBjOg0lUSN91re8y90NmKOP3Yp55r7GWMVDlR
 sSOuQ4Mf+JgHzj6nXC5mG5yZKhtKTvlMCZYnAzqa4TE6Frj8cNGEaMgCs
 6OeVF2F/C/7mT+sb9ti1ddKEDjpaSMwjWkwq9he2CIeUTgsW23/0YHaqL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371640258"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371640258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756263637"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="756263637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 07:23:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:23:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:23:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:23:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5OA/h83ZDJDV9BnEzKbpXl3wvhQPAxFpWxE3MW3Ne8awDE0w8+kQaeOXKcV7HZ6XRx85ft/c2uQ4jKK81OPmg04RmUuKQzFDwy33IpYy/MPU8I9JoUexu+zmwWEtx3U2WSl2LvYciaXjKL5r7IqpL5OhYmKesNuh7DgIn8HoNrzUuZoIsuWTrAtY9kpDclR46EuMOp98ftzVKSdQx7nZ9ml7EhYDiVF9qkbAGz4XnpN84WOwLAXGeeDtAgSYcofWVJaEYgEaE1Kt5ln0/re4JUxIjsd+vaMXbYzXMtq23XIQJN/7G3672AY0yb3FJ5oXn4qpHMLPM1KrH4qjvszqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3HgaUpAaVxULhe78PesXviUkcWv2LdWbkBMdS7StbA=;
 b=aS7Al90Dpd5/IXMWtJ5Pphii5ggoKTrhorck1jXyxsuUQUjYsugAKrWkxFb9in58FEu5ABckdpNMpptPU9TsTmhzUJGHO+unV75AZpTKADeMQ5YTsk9mjsiH34kDcgIFTAnZqxvSevPax8xNQltHPmZZIHrmT4e6sfGy7ptNaJhtcv/S5aLMfQGm0wX88ybGT9Dilg0lYTtDQemb7oc4quURoAIc9gs7gYbS9c2vNKqS8Nt7GOZRrcu3JHW2kRKgXEPm+BiIhTiY8M0khQoUawYQbUB91pn6UEQELtJUgjt33UG4I8pUExy1HvRF5wtFotIiLLCkFkj4TILYYuKQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:23:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:23:30 +0000
Date: Wed, 26 Jul 2023 10:23:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Matthew
 Auld" <matthew.auld@intel.com>
Message-ID: <ZMEsXUB9GlF/djiq@intel.com>
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
 <20230725205626.346256-2-rodrigo.vivi@intel.com>
 <20230726101431.o53pbvurkpouv2mm@kamilkon-desk1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726101431.o53pbvurkpouv2mm@kamilkon-desk1>
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5105c7-6ffc-4cf7-4d8a-08db8de3e264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNcF9IOOykPA5139nlIgKlJAc91umxO0oNJ/oOChe6jPAMYMW3nORzz9NinNXXBHXKaCcuUO42WltJHBMqOA+Urce11SHGhXO2BdfTF3Z7y2sSI5pFGsRnq/Urzj6eWe/ExzY75S2U1SW0GtXh6wl8H0RfQODCNDq8vGQr6meaZWFYT6D8SvhulUs0iFZErtNIEjp2QBd2Cqothek8iDUD3C6xm76goY8/Tidi+y7J01zE2KSQaU/x25vFXJrbCu2ziWnhdlqCcId6uGt5Ky/y5wEog6VcZLkM/fVqwmyqXvSyVsoDI5QgvGzqfOmLRSJhO83a5n0V5K9HXZTcaDUVsgbubi2zneTAb+joYIrGZqf4gO7kAeUmunokmPcli+5LcYuCJ0i2EP8S5ymG34xmTXtHPJzvFCW+0Ov677uUjLT2WLFRM4W3SLpKttDiHm4ThnYKnZMBScgJRBmzjy1NdDPGmbuiIvV2bKE+PBONKcAgFoPahKHNn/5/mr1u0gTT7r99Z1r0bGskByasGnnYYPb0Y0kKRbxarNWQLckWMnExL/0DLl1wuxrV+viR2O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(6486002)(6512007)(6666004)(110136005)(478600001)(66476007)(2616005)(53546011)(26005)(186003)(6506007)(2906002)(66556008)(66946007)(6636002)(316002)(8936002)(44832011)(5660300002)(8676002)(41300700001)(82960400001)(38100700002)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlOY7xox8OOd2omyi8X5jIpRYshaVjgKyvwWO94sBXzuBYXFXHM8RaG8XpE9?=
 =?us-ascii?Q?6SpVVAWdHVypCu7kQNzHmnQyab79KwD8xyiOCO8muqnFMbYRPTw27u2yt0fG?=
 =?us-ascii?Q?ygWufp/eVxsWbfcx6A+gZ1DbTo8fa00uTmVDD6gnM6XXlxE3ZoFwo5bVS9bA?=
 =?us-ascii?Q?+1om9xvYLwk+aH+No3lrLlm0bNMhwCrEr6FGA54w549q1CwNRYtM1Yq/eqhL?=
 =?us-ascii?Q?3ZdJIKrKO2tq934ZlrgBGHtX/1eek2Z+xKzzONMgnoUuI14g9BjvBoOOzLZT?=
 =?us-ascii?Q?18+p5NmaR+ttCH31lhr3DFF7jvrJYE9P5Yw7RHoIu0mJMgtiZeZHGX5ZGnef?=
 =?us-ascii?Q?/iBA32jcUV3uJP3LX0cgDbIeAZSJO8ZudbGtO/eaPkJDKkVfxmDUWWKRx8LN?=
 =?us-ascii?Q?SnAZazg+44uKZX3K+MenoQ/xaypjtIgOZXtFa+ANm8CuksX6HZkSxkYsuawS?=
 =?us-ascii?Q?ZSe+2Ii88Y8Z1ICpxMr80zRlB58nIN0veVpa02hN0nLL3lqmYPNh+p14b4/l?=
 =?us-ascii?Q?dLrvJq8VKws/tZu3lB7XOBl01nk+M4tQDBA5MHOSCJHuZ6uAkA0ca8XD7iQv?=
 =?us-ascii?Q?4jO1fofmjU09WVfhEmBHVAuGSdqES9Y/x/b3JEGBAXle+ZVQSHJMc6ee+QKj?=
 =?us-ascii?Q?kxxEqanmVs1TsLSgcdNAHAXUMLhou6wB6xNI0BxteL3CB8wDA3mA0fmQ96GH?=
 =?us-ascii?Q?gvbsq2qMbIL3Q7TR7TkJpkDDQ5P2MFmVEJ/EUB8n2be4NiCp/JAn+LH418to?=
 =?us-ascii?Q?rEfIU68Akaxyn2dklzZg341SIoEUQc28hkyNpvjOq4+Gr0UC07T1YHLCSE5N?=
 =?us-ascii?Q?Tzqpqu+NOT1XBjI4ITO8enjGOxEvM1M03/UURq9pE+po/ZyDgPhxd4EH+qEO?=
 =?us-ascii?Q?jFuZ8o5shOu6TvheIqS1M8JiQNUN7IRkK80ynFSc937zufcwnMg1cgiv8aBQ?=
 =?us-ascii?Q?ebjlpt++8kXZAIiSJgQQVgO6kXaTqpW6ylDCKfXOC49V+pJBoWcNZ9urA48R?=
 =?us-ascii?Q?w1y2A2rcuKEn15drwK98+bVfnWbeU0Db1Ggx004gqSJo1UqBhuXHqcpbqvt0?=
 =?us-ascii?Q?FgCzRSacg5i7PgjL6eYCOwKvO+WajNF4+6j9Z1XI/vht7P3Da1yxwmo/4NPv?=
 =?us-ascii?Q?7V33SdQCggcrJ1ZzrUIl0Yrm9UXyKHQpjYpCGs90bmNiaKNKNRqJhGRGYoeV?=
 =?us-ascii?Q?1PIkT3iceXJXxnAxRaPj3HOLCcgqj3ZjkzKQfKXzBD066GwQSJ7L/RaKuCXB?=
 =?us-ascii?Q?aXHfQpdOJAXMYJ+0ayJgBaWxEY7eLIhTvHlGsAZPMPF6MZkFCPVZk3dor9po?=
 =?us-ascii?Q?+Gg5SWWhrxCU2pllREWbxHZvFPEUCD+qBpy/uJ7zuFHxB6dum4MaEYuJjAWx?=
 =?us-ascii?Q?3/tOtE/OOgTGpdTTFVUV3BUzp8BRSHXRTJEBA6NlUQQA/c8zVpyF5bQO6gfs?=
 =?us-ascii?Q?HbyewhCp8hH+cgxbDi+d2M3PGq8RB8ixn7hlMDt+RUsL2sPudTUvhtVzyQ9J?=
 =?us-ascii?Q?nTcWCb4CSId/foYT+iXM9ZPRLL2dyGwJI91HMwRZzpKw8jC+QZ6M3LwChQC3?=
 =?us-ascii?Q?ioJ9g3/KiT1rQdQfuxITMyy6NldkGX9R8fXE8Qm+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5105c7-6ffc-4cf7-4d8a-08db8de3e264
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:23:30.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFXFExo8yrlHqFRXEkkDEGTl0SCSHbZFPJeQyMxJ0nzMDeUo2AUk8ORQ36MKPoYXMBeo26QcSmcQgQfBFJZnJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 2/2] xe_debugfs: Remove
 guc_enable check.
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

On Wed, Jul 26, 2023 at 12:14:31PM +0200, Kamil Konieczny wrote:
> Hi Rodrigo,
> 
> On 2023-07-25 at 16:56:25 -0400, Rodrigo Vivi wrote:
> > drm-xe-next commit "drm/xe: Invert guc vs execlists parameters and info.")
> > inverted the param to expose the status of the non-default config.
> > 
> > And commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
> > entirely removed the query check.
> > 
> > So, let's simply stop doing this debugfs check here.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> I am sorry, please drop my reply for 1/2 because separate 2/2 patch
> break incremental compile, so merge all this into one commit.
> 
> With that you can add my r-b tag.

Thank you both for the reviews. I squashed both patches together and pushed.

> 
> Regards,
> Kamil
> 
> > ---
> >  tests/xe/xe_debugfs.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> > index 5e16a71a0..5434d4645 100644
> > --- a/tests/xe/xe_debugfs.c
> > +++ b/tests/xe/xe_debugfs.c
> > @@ -104,10 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
> >  
> >  	igt_assert(igt_debugfs_search(fd, "info", reference));
> >  
> > -	sprintf(reference, "enable_guc %s", config->info[XE_QUERY_CONFIG_FLAGS] &
> > -		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "yes" : "no");
> > -	igt_assert(igt_debugfs_search(fd, "info", reference));
> > -
> >  	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
> >  	igt_assert(igt_debugfs_search(fd, "info", reference));
> >  
> > -- 
> > 2.41.0
> > 
