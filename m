Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C409C07CA9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571A10E06E;
	Tue, 28 Nov 2023 21:45:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A9610E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207939; x=1732743939;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m9o9PSRXe+XysBqWgzQrlJlWxF5mS3umJOhZo80NEls=;
 b=aFNcd8sHgpaCKVZ8PxtcrmvL6N3kYPTerZqFR5fwT0AZuj02Cj0XZzIS
 iFdo720PMGnHKWEdIcH/YU5AP9MrLvA4lvxx7b4FJlGeJKPguo3Jy8o4B
 BXwldZBYUhT/MEqNCqsD7tzEkkslDll7s8ktLIRVroVDMSEhHGbqvBhbX
 C/r5DwamSBff5HSA2Lgo/mmIOCIevXzDgN5XrRqd7TAv0mgwz9Zood8v3
 UCR1HeLDsQqS3rIwLXLArfnLZa976s/FMuu23VZBp0zUWtRPjzkNgpveG
 QrigAoavjqlOPyqrAqRzl+CTLH/zrxhHBfJa9uvItKH65ceP8SSwQs5qT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392784831"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="392784831"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1016052965"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1016052965"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 13:45:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:45:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 13:45:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 13:45:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNCuh3qKza5TCAZ+9oTK3Uz1WFTSWcjC/8FNIICmOVB/TVoZWmf+5ahvSPfiDSAksJ7ZoUUSOyZoeGuHeGsc0gNSGYotT3CaBPwknl5TvbsrBB90IVjYpaFaNxmq2YH10tXfPwyKZxGnNN8PFqfliL4GbEfrCw8RSknqGmPCjcrUhVleuX242rj84TG34+hAJqpkyXFW7K7RkX4oaUCKIR3/QOW9RpBWmDpEVvBFS+BzIEWO5dAUOk4NALOH1hf4PQk1g2iHj0UYNhyi3NALT5ZkA05dqkqdTcbQeq/v9Jj3wYGgLMpWp4krG/vL3MYgf/e8VjBeHsIiWLgvp4YWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdtJe584ixnRCyutY3nq94E1Q0y7GkgFqF7q7xa8C0c=;
 b=JLT0nLayep0TtDWTJ1D4xpUVL9xAf8y8qGLBxiT7cuUj0/U5IiB0asOE2rHfiMQ0WfpWFjJmNidyE+uICGJcnEp2OiOwOvyoMekVOiIDpmJkrRNvOnvJlUu/5IRMWf39zHP2k8RQFKrUS5sfAaWLWluQHkVGM3t7+QSMdSQQv7x5tEqf4dREZBR9y7IaUKFO6vYZ1uZT/ac3z7y4quoCGMK4/Bblhs1s29k0Djgp3J02wf+lLY1PuA0SXZ8lOjTN6jUOxDlSY4H1eV6wKL0igoWAfy9SWs2ypkGwk3KCK/BEBE5uVYdQzrNExiJGsYm3pt7GJ5E+HgwXZFRCoWM6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.30; Tue, 28 Nov
 2023 21:45:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 21:45:35 +0000
Date: Tue, 28 Nov 2023 16:45:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZWZffLpJ8Q6Fb02B@intel.com>
References: <20231123180605.112597-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231123180605.112597-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a09bf7-4999-4a7d-e70e-08dbf05b5a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMmReVOcqEY+3/SmZyKy4kk8hhl6kJtdD6BT0SQz992cf+wfJrm3KJDKtl0Wv6tM2rRShMI2iEzgiwrlo6asqKrcWmz23S5av36yas+mDvogeaqqqauHLjmrDy28KF8bKmA1wE7BLQ2YItW3CY5JygBoT0EWeZ/gkpRBqPfhtvokeIKjFICj0KjqzhJTXa3WIkCbDeXBOBZqh6rwWhvBJi+MDrKAzlRzy9eqMSgwe+oQnqOdmQp3ZA6oKt3GRGh0DZQP2kst49AZAUaR1Sr0baHPYUjQrPxKhkn2xGY3oA+q1OyMzoF/MgDa2mz48Y3MI8ZERSn7vvmXXq0klI260NEwQfsSXxowA4UdlNH3Q3d+OM/KGJL+cMihvltAOGnY+mr+o0BeQcRnb7GLgGqNe1eOVxUyFoCxpuzt+ClJhQfemmk8msgisskg2dWx0L4mvnGrWrTTGyGCMSRN3gOUDezB89/PCDcrHvhpgXEEU3cILmxLE2ycJhjTzLFz8ZAf/QXWSPplwMDsJtNV0maBkaGIlwWsW6N+TEjIlhPRpboMcOPdh9tZNXoAqY7BLZEwIzz6UbwABI32c6spxAj+IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(2906002)(44832011)(66556008)(41300700001)(6862004)(4326008)(8936002)(8676002)(6636002)(316002)(37006003)(66946007)(66476007)(6486002)(966005)(2616005)(478600001)(6506007)(36756003)(26005)(6666004)(86362001)(38100700002)(82960400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jASN9L9d8S0b3Ma5OfTZgjuOvpTfP4Tr918Z81yfUUl5aYGt5huuD5zSz/?=
 =?iso-8859-1?Q?RuY2yel/wLdSFBDZnHEFGBvwJfWzKXAWc/jy16U8VUenOVIBpriSTmB6SF?=
 =?iso-8859-1?Q?6JRhgk7jcywwk8c2T1xcPlfYu/baRulQCARuLxGjjwc/u2jWJzRrOnwKTF?=
 =?iso-8859-1?Q?QLOkStP7+RYyzvQUqtxgQjEMDZEs2Z3f0tjBjGQDDsCmwIEACzvjBfXtg0?=
 =?iso-8859-1?Q?d3+3D/lukj2RB5KkdoJvZR4y63kynxsGQvEMUUNW4G6P8QP07Id196jHe7?=
 =?iso-8859-1?Q?ZZekQ75gcVgpjbWdGohw+cusQOC0zPV4Yu5kxc34D87o/fdOGl5szz2QjA?=
 =?iso-8859-1?Q?ozp5+jaznFadnkBWOU4TFfM0pTVRVcvm9OK7jUD2yafiMJD2otSI5Q9Xll?=
 =?iso-8859-1?Q?LW6wLF60zjPKDYCrmbbsLtiNa8pT6bG7a/76aSySfyCQCqLCPXuwfAoLRU?=
 =?iso-8859-1?Q?qEnS0Ur5inmiX/Wj56pxTAjeDr1lfDFpJh21PDDrac5ME/d5r8vOK2Qmbp?=
 =?iso-8859-1?Q?OwWwEotriVga2t+jLOsWQJaErkuA0CR0LuPRy/p6z22gSkQDDLih/ciwVb?=
 =?iso-8859-1?Q?eXhPeApA6wPNzt4U2smO3OWRGRjOle2SPhhelI+AJFYUeKke2j9xghRifF?=
 =?iso-8859-1?Q?8JY3f1+QfkL4558+BkEkbnw94R8nAOny1Fi8E97Zuc5aM+Nh2KGiBHUMMY?=
 =?iso-8859-1?Q?TOzFEhZL1WzRgOXsCisUwNjDuIXdtkSO1NvdDU/ISeaCMXcnXeZIqkunCv?=
 =?iso-8859-1?Q?tTZjMk7SHukom9y+ygncZsE3hYgbMU93s+K8uWV7pwQCM3ilPPb7lybjSD?=
 =?iso-8859-1?Q?aqgreOh98vbl6nmv2HgbkWEdfrFG7x4GoS1zy6MqRPTjURyUI5petAd08v?=
 =?iso-8859-1?Q?gDFoIBrOkUGs4+KGitiSqcS9wlyqUZV/kzWFzCFBPUxnLeKtAz7QEK+R5A?=
 =?iso-8859-1?Q?741rIeGWFXZT492mzfV6gQSu481SxRTZQ0LIgBsmqn09qjJp8XPsTO+tFn?=
 =?iso-8859-1?Q?uzgprHShS/I0WRUysZhXhoJye3+eXGC3+A8OwlKUaE83uGJ6n8pZZW1MoO?=
 =?iso-8859-1?Q?p2Tz622kBpP8VznxibTWOjEaKQthDUKzVzr2ynOpb64mxmnqj2UIhrXu52?=
 =?iso-8859-1?Q?fwuKQNRVZdzGKGQX+DJ0eYI3PYw4RgfBU9XV8jj7IiW6mgJvuKryX8fuNu?=
 =?iso-8859-1?Q?rXyWDMzA5LazLOAnPrAg84tHF23cAmYEUw8esfmw+rVXvX68++8hu8ftRg?=
 =?iso-8859-1?Q?70b8x6aJxUZ+i9hsodNBBgr/KKst6hq5lX0sWzp9FSJKP8AZkRpLxnqo3L?=
 =?iso-8859-1?Q?8Piryf2Mo+ikihEjIVIG1eOQPclg4KZTzf0xOW6Eqc3a06kE+MQl4pM2CJ?=
 =?iso-8859-1?Q?Rwu9Rw3vXwBcR+9A8dXgeIYqcqZBMD1ONZC4GiOhR6dN72t5JPZVrsEjvf?=
 =?iso-8859-1?Q?R95ZV1S9uGvtMJm1QWUDwnUnVcEf7w3fh5kKdjWtXp4f0Xk6MhZaa98IhK?=
 =?iso-8859-1?Q?ldjDmt/h/N9RkdZDRDGUBk/MVr5hFwqdxXBUP95pH8814We/ejjgngmFRH?=
 =?iso-8859-1?Q?TTClbw0jveDhgBMUFNpu+Xy8IAzZqNPooSpDb9x+1myICnmJ4UxcB/8uv7?=
 =?iso-8859-1?Q?O1NdKZl83YKE8tASX07SlFwMBsN/LZ1VGZAjTAst5cAaceb8eBYoPKJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a09bf7-4999-4a7d-e70e-08dbf05b5a5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 21:45:35.4457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZEig10qy5o8wMF2Ed0iI3/bUC212ZqH6Km2jTo6QBWyRPObG4LgZNHOxmn6A61+eKWKi63p4W1sIZUNKTPM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] devcoredump: Add dev_coredump_put()
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

On Thu, Nov 23, 2023 at 10:06:04AM -0800, José Roberto de Souza wrote:
> Add function to remove device coredump, this is useful to release
> resources allocated by device before unload.
> Without this coredump would only be removed after DEVCD_TIMEOUT
> seconds.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

yeap, I also bumped into this a while back, but I was holding the
patch so we send to the right community when we are in tree:

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commit/fd35f04e4317a35c5a92509f30f5399caea7748f

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/devcoredump-removal/?ref_type=heads

> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/base/devcoredump.c  | 21 +++++++++++++++++++++
>  include/linux/devcoredump.h |  5 +++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
> index 91536ee05f144..444bb510b6ef4 100644
> --- a/drivers/base/devcoredump.c
> +++ b/drivers/base/devcoredump.c
> @@ -304,6 +304,27 @@ static ssize_t devcd_read_from_sgtable(char *buffer, loff_t offset,
>  				  offset);
>  }
>  
> +/**
> + * dev_coredump_put - remove device coredump
> + * @dev: the struct device for the crashed device
> + *
> + * If giving device has a coredump this frees data and remove coredump,
> + * otherwise does nothing.
> + * This is useful to release resources allocated by device before unload it.
> + */
> +void dev_coredump_put(struct device *dev)
> +{
> +	struct device *existing;
> +
> +	existing = class_find_device(&devcd_class, NULL, dev,
> +				     devcd_match_failing);
> +	if (existing) {
> +		devcd_free(existing, NULL);
> +		put_device(existing);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(dev_coredump_put);
> +
>  /**
>   * dev_coredumpm - create device coredump with read/free methods
>   * @dev: the struct device for the crashed device
> diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
> index c008169ed2c6f..c8f7eb6cc1915 100644
> --- a/include/linux/devcoredump.h
> +++ b/include/linux/devcoredump.h
> @@ -63,6 +63,8 @@ void dev_coredumpm(struct device *dev, struct module *owner,
>  
>  void dev_coredumpsg(struct device *dev, struct scatterlist *table,
>  		    size_t datalen, gfp_t gfp);
> +
> +void dev_coredump_put(struct device *dev);
>  #else
>  static inline void dev_coredumpv(struct device *dev, void *data,
>  				 size_t datalen, gfp_t gfp)
> @@ -85,6 +87,9 @@ static inline void dev_coredumpsg(struct device *dev, struct scatterlist *table,
>  {
>  	_devcd_free_sgtable(table);
>  }
> +static inline void dev_coredump_put(struct device *dev)
> +{
> +}
>  #endif /* CONFIG_DEV_COREDUMP */
>  
>  #endif /* __DEVCOREDUMP_H */
> -- 
> 2.42.1
> 
