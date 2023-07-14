Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF7EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57AC10E88E;
	Fri, 14 Jul 2023 14:24:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C896710E88E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689344651; x=1720880651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2hI2jTUXeYuuhQkPKEwiU38fCQtKnWk4NQCJLsT5Qhw=;
 b=b+hwQaxD3Zt0hVHMstXQFu7u9BZiYXcP0LNXgB4yXyuTeTG82jN0DwQN
 NSrYM+sQj6I21erG4GvyFK6oSPmKPRmIt5dvc/PGLdeJBv5ODrynxXp7P
 u/aX6OsA4TIphFQE3R/MCGFoZjW8pzcTyOHvME2Zij7RyJHmN4Ch4N7Gy
 mDetKg5QTlI+QX7v/PuZDs4yQ4BSlRbIj5C1495a3f6xyDXFuJC0eL33K
 U/BGZy0+KIxwWQRUNkQaJEG/UI4aGx46xo/8lsGImSRbN/JfWOD4L1Hmu
 xIrmcvBnShXB62YCAIk7GqrNlDYfx1KnoNiqr40cE2PQpxkZKWBPnW33N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="350354608"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="350354608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="716351066"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="716351066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 07:24:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:24:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:24:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLooK+FN1/PfE7dZP3rRdh5ejZebZKCQJDc2/omGcsU4aua26fgqwseIUzBsCWmkfEgRlqXvYD1fhw+U65p4j7Fw5T/GCogAaUBYFRnAZhQDR07XUJO0fO9RUgX87dNGNa8ui5WP0EAxUGhVSWJdo18EeUzrrojLJRh22r0PypfucdTbelA8PK7ADNb0wN/SMCMxPpgu+sjSgOrsd1M9K9VLglp1lGQkPAmNM06gYAhAj2Yh3//XMLgUrWhtwcnD10bA2wAMyqhgRmEqBvyQc6hpVNhebJbyki6usweySig1kG6yEgMnfG9EmNXSEuw5aMNRauTTwXw1fl551cjA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7kiwHT+aZ5+GuTGEVBBwQlhHzMLn9qBYjtlXli7UVk=;
 b=dvoLmxG+vaYYihH35SAP9S9mmA+T5cO6GZCw/Rl6kkySSjJadaDqGNcgk4BpWKArA0RTXoim7p3r6DYKmxKmn1rfUI11ZHY6f9H5JpsTFHkQ0tvvWK+b5nWOMhnNlKMgC4j2ruHXGw+q3CZAKr+UNKbK85QJxyWLUR+ZYnjcjCYcMmgXNGv0hJsNJZD3sF+rxGUm23Ey/mzw2k46LUby48yh/sG2t5PhOwEU6REvO4x9IEMsULXhjC2h76TafneJFGpPhwJbsv+M6QCiFs4Be+g3kfF7N4o/uJMwLddB0kMJGgLPVO/Fwd+m56quw0+VM7eEZZkvB09h9QWzJD4PjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:24:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:24:08 +0000
Date: Fri, 14 Jul 2023 14:23:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFaVs+5A4l4Vcqd@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-8-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: bb96d64e-f0e6-4515-2b48-08db8475fc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcI/yccED2PEnvCaR0Kx5EPwFR00sLY/N1jVRmph9bx+8wNI4qupdFfG/qMLz7XkhXMISKJksR+S5+oisQbdDpQW6lDYaXifxD/2vW15azWMmIC8iV7tegq0KlcUp43tfjuEoPFIYJ0wPbscXZohW9n8uW8LwgD90ST1mShYCf0xoZ8K1vRxKMeINAxtj6W8mBSbnKKIQpPlcta9cJTZin1CX1r61MAYjvOoMoPHqmfO2SREphlUB5K/gBpzksQe2F474xuWxDeWkUuor4xYCzEg/suB+lOuPupIVYVaC4a9af/5nVJ1suwcASgSlMW/BJHMvNJiuzLtP47NAz/trFgcIwQF2Rapbkbn07OtyNd7JnhLumnWzSjE4cys9m2SsHG0FLSs4dye8CP1za/LcOmoMy2PwL8lNE9x/IrMEfAyLtHZH+ZqcTLfDkOLuL4MeCLup0brE1tCGd5EYVuNrAAaLjFwxJfnG3ItRZwRuv2nTxncB7wi1TaHr1236yTtPb1BWYm2l7UuKGIgv7PTAbFHEqBFqdDHvTHZkCj/bOcmsPu670EpgvGiYizU1k8rwV/qQCj1odrXAycFXwuZpCL/5sDum6NYtpj3wZKvl2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199021)(82960400001)(478600001)(9686003)(6512007)(26005)(6506007)(6666004)(6486002)(8676002)(8936002)(44832011)(83380400001)(6862004)(5660300002)(316002)(41300700001)(33716001)(86362001)(2906002)(186003)(4326008)(38100700002)(66556008)(66476007)(6636002)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oVdhf6DvPm0zm2zoMIiXcMSGIXXQAwCxLQuu+PciW1MIJsmBelVbIfDM5zU4?=
 =?us-ascii?Q?3N4P4ZgedF8b4WJXp1l2qL4L+xULTIgHIzaCOtMHU5DTFMs0JIe/FnrLHFBa?=
 =?us-ascii?Q?C1SjlTad5uUrsj/M7h6RGdDZ79Re78ISQxb0+3Pl9KqZ0KZdk2bPkzcMsJBK?=
 =?us-ascii?Q?hMGIb7yf0RDgLkICBXtmMwEuibeK8dv4/6o7OHLmiOUsE0ep+KkdFtY0fTC9?=
 =?us-ascii?Q?FY0EruT6cQyR6VvwZQzO0bmVvFSTkMVqREB8fykqXF9ZQundutH7wwVsVaB8?=
 =?us-ascii?Q?h3D72ePySyHC4e+caPh3OUrhif3IQf1iQFf9vLJfa73wJuLO1VIgVAMZkZAo?=
 =?us-ascii?Q?zT9ABCbflwZ0qVoQ22Ma8TQmfHf1nKCErdixiIGi28bQCI2+8q7zl6yLz1D6?=
 =?us-ascii?Q?KoZDCkWR70A6dQTIU+qy3mHn//ItIkcyRRn8Lz4R4u5hVqoJYdkrnHcLdJjc?=
 =?us-ascii?Q?dD2Ho2oyRnLeoxmryCex+w3ifdeUWx9912SCwKB7Wy5rXaJfiNFreUDrj4NP?=
 =?us-ascii?Q?W+nfVEvMs6lN2zvcNyUg1XgSbH6PkOKsE12FT4wI01YxMpBRR3uooQW/9/bE?=
 =?us-ascii?Q?Oj/JFUvcWBJgaa3EPcoQcM0WrmQBSqVcqoh+kQl8RuI2TfwWtLOkZeUpCfeF?=
 =?us-ascii?Q?AX6Vc9MSSEDUG0ggp3PszXt00LNjxN3gKRDZHG1cG5T2IL93jaI5Ld7i1Gl5?=
 =?us-ascii?Q?lsr37CUMTUhv7l5oZImFjI84g0nZPKjOn8ewv++Cfz92R848y8SCnV51+PjK?=
 =?us-ascii?Q?1NPOpQsqXqyaaZKEDtKip4gLFrPi6yG1yevOXdk2wErqwOzJ7VamiO3LIa/g?=
 =?us-ascii?Q?TXoh6wwGVyM5Wb+L9HoPEpJzzzdszpHgnZLa6XbYGoCiq7DzRr0BPyRzLrqV?=
 =?us-ascii?Q?v+nL3R7DwzZinM7P3Ttci7gB/7i4nsojnGm+wEbF1Nt3BQfcuqyP7hOTTdMD?=
 =?us-ascii?Q?b2udsc8A0I0brZSvkU7MhHh8GiYtr+HqezddFAai2vqvcwQw3SYg1bVKl24c?=
 =?us-ascii?Q?6bBPhnvAqHX9nsnA5xhXl2CbUuBwbUwLol8+25VYM2MSFoOngeYkTgEH45WK?=
 =?us-ascii?Q?fHiaMlL5PgGUBUFYMg4AA/gQry0Bav6TSfD/XigGAxFTLzGNs76uMgu6lxca?=
 =?us-ascii?Q?CGObc3uprmKCDees6LMUALXUVVUAgOd49fH2JkOHHElr5TQPLfbxRTT4Az7S?=
 =?us-ascii?Q?ldVJr/KIxxtKHLF5pSjhtA5Dt4dQ2OyrXffWPgpHpcEd32lDjA1I0ZmSUAJ1?=
 =?us-ascii?Q?2eU1rKCmiXj5ehJUyWFAOcHwR0T5DvXQcw5nx5116tvHSRmzSiA5ALWfmHbl?=
 =?us-ascii?Q?QLl/aqmVIluwv1lpt+ktHApv0HIC8lg98DiJBR5cSv5sohXkGM9kKDHU68K7?=
 =?us-ascii?Q?kZWipae/4EvRK5EgX9G2ANxx3v3ofVTS+9cVTJMZd5/4l2Foh1MXs6RAh2/w?=
 =?us-ascii?Q?hcwafOM0KLjdxNfyi7ZKa3afcX7f9Ht9jD2KGVQL/EyuiVWSt+SeAoU58YAG?=
 =?us-ascii?Q?ul79XMK+Ei/2WAce58iKNcrS3/Lzk2R8y+fHUXBCDFrIBbfFkAHWHihfrPrD?=
 =?us-ascii?Q?sz4m0ul5IdScX8zTsEsfPQkEikZVKOrcz7lbmBkaqDKOyvpUYlScRqk69zLf?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb96d64e-f0e6-4515-2b48-08db8475fc51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:24:08.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+3TBAItOMLeZk0H3vSb6//TmHozJR1ycSkoHSZUzBCV5wOjFHzezJcbZIXQC0tYvLNeQKYqAASvjBcjQ3NShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Fix typos
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

On Thu, Jul 13, 2023 at 03:06:11PM +0000, Francois Dugast wrote:
> Fix minor issues: remove extra ';' and s/Initialise/Initialize/.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8245bbc58770..ce8b35dcbc51 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -200,7 +200,7 @@ static void guc_init_params(struct xe_guc *guc)
>  }
>  
>  /*
> - * Initialise the GuC parameter block before starting the firmware
> + * Initialize the GuC parameter block before starting the firmware
>   * transfer. These parameters are read by the firmware on startup
>   * and cannot be changed thereafter.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..29bf8614c7dd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3352,7 +3352,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	XE_BUG_ON(!ww);
>  
>  	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> +	tv_vm.bo = xe_vm_ttm_bo(vm);
>  	list_add_tail(&tv_vm.head, &objs);
>  
>  	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> -- 
> 2.34.1
> 
