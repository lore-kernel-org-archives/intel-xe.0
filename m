Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A8C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 18:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F64710E045;
	Wed, 26 Jul 2023 18:03:46 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709110E045
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690394624; x=1721930624;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d0dtuGAx/2QkhrjcUHSp8h+3tw2O085bF+XuN8ADkr0=;
 b=WcAh1MnkKRPdYbeJBNvXddd9mVecK2wnR4cRfeWxUAH4XoPnUXq1E8mC
 QsKPcjXLVbFoP34zFu8x5+52cqsc61COS4YeSQ1JMpR24Hv9X8+CadliY
 r/iMF2Zl69PLwLp30jJXH4uTezYQuysy6ZJet9MxkH85HU36UQ2QjAms9
 ctvsoj7p+CkXHn0rO3n2pwvBdXKvL6UAmcvevhsAOOy7NBr0pceeF5amn
 6ID9JFnlgxaLtyJvN1KVkyAbxXzeJNkmtyot4qNvGmZ9IhW74KkJ40Cgj
 IIiAEQAtgEvXZ7BV2jqIzh/RjL7cIxZMNtjQeTYQPi1U2wcgUIhp176gp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371704748"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371704748"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 11:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756328247"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="756328247"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 11:03:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 11:03:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 11:03:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 11:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmaUDY8+iU0N3ptylArVpor212u5av58V66ATgxPSYYD9VJ/rvkRxM7IEQvwAWLbCTt7V66aopAZR6fqRqrqF9DSppTtpFxoU4rmXo7+XPbdfGurFr5mVcXulPnLR3GgQvg3MRbNrClHxTMOGT5MK0JTQCxsCzO8fJyM9TWIrLetSmHeemW9PAZ5P593TWn3ENJZpvzVQVIyQUIP9YsDe3ahAts+QdyXy/4GYjP5Mw2FDWwV41I+8I0egU2HNgoQvLcT+DjMf1/n/7oYUsBKKdT/aPkbnFwKFGC3JHWFkOZmewIPqCp+fMRudG+MtWJUiyk3yxpusiyK9nez3FDd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXTN+iJEdHfjSJXVcmMXnS9PfIgfAl7yq5+MzfSWGzM=;
 b=fqbjOiTUppvUZZ7ApgOK76gyw2m4GNi68zWpatfj4Ys8XZT5pXbYkH8DfvN6IUFoksYrjOemskpZ9autxJmgK8EJrMA44YWpxBEz1uM1HPrS0KIplzIdP5FMGvs5x3o98kcdhx9CToxIlid/GUO9INwpJoQv6BAEI500JP/n4Gu/wnhOKMuqIX6/U1UcLDUWmvEDb71P7Kkih/nNp1vwxrxzznMGerCcHKKl+liUwZ7Is1Z0ckXtuVK+Qj+ZzTCx+y36DM30YFncGDZ3kOK9oDm7uy3JR1mc1O2SLyfdiVQfQSji9znVqf65H5q81ZCbzJWmknZtfFES/bL8DmFYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 18:03:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 18:03:25 +0000
Date: Wed, 26 Jul 2023 15:03:20 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <3ymkc4harti7aufezx4bptzvvgm4kllb2kyngpmjo3tcjipdqw@3rq3dn7jujip>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-10-lucas.demarchi@intel.com>
 <20230726170404.GR138014@mdroper-desk1.amr.corp.intel.com>
 <20230726170757.GS138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230726170757.GS138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0018.prod.exchangelabs.com (2603:10b6:a02:80::31)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: a623fcba-caf5-4935-bca1-08db8e029b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDbSr1LfQ4i3nr5DpRTCHDBUZGgxip34rhupJki/RvACx3hDiktChtfd3jR7wZQMQIqhaVTwSzvM+Ujqi/XWha7RtWcAVKwxY5h5L5nyb1S46zjfKF5Yh9bDDV4ogUJzyBErdGKIdQfkbGCwLzXLRMUdh8hqdKAAfgExbITk24HDyxUsmymzTRYO9NxpIaoCD3UQMFkshgqgu07qzBoM3bb32ERGvDC/QBRiZYAcn0c92eg29jVZOrkJ1kldZpOD+hLZdSGPq4BWt1IQclSdOslSPBeHgcqk3hnWCCxWI5z/YDgAkAWF4KjDK7UipmXmmGZjdHakFNcfuRz0z7iILeNVjCRlEKfNDJFSElHb5Wl21fmV3CrCJRLJQyux7X5lHKMY4I7RHz3EfZpwsB0T8EiRTSi9Mqj5j7zI70c6hDmS8JH41N5RUOUtelucwGtv1hsUPDdsqMdpmONZ2JtJkBhqZM8IBz4ZZBjcw3io8jInWsfyKFvgBtB+GzNIUIhdNw4Fk7Yxe3F5IrnfS9SzzM+6AIF3NKe/z+o1+VHWt6pxDO8pA6JoGNb2edd5cFwF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(2906002)(186003)(26005)(6506007)(6862004)(8676002)(82960400001)(8936002)(86362001)(33716001)(9686003)(478600001)(6512007)(6666004)(6486002)(107886003)(6636002)(38100700002)(4326008)(41300700001)(66476007)(66946007)(316002)(66556008)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ja/cECxNVa7+4agY4CdwVX/wzwACa9p3f9VsC0R07ZugVDqz//Q5vc8URR?=
 =?iso-8859-1?Q?SMYDsrsTcRPvUm1TNRlmWRHtAYE/OWifq+qvx2jIpIPMiCTU8Q49NzA2JA?=
 =?iso-8859-1?Q?kA5EByFmFA3chvsEfN7AHmVXW7+hqM/vrXdv/dFYUGIs7EDnQrbOpz1j0c?=
 =?iso-8859-1?Q?8E9xJ7LVfZF8fyyIKK2fqRHqE2f5ON7ONTFTjnn1U9RxN2OC6I7CUjYpBf?=
 =?iso-8859-1?Q?ogy8wFS0NLuTu3n+muxwLE5jjsGR3fSEw41wHWkgG1ysL3FHHuq0h0smJb?=
 =?iso-8859-1?Q?y1H63hUGiJ6QzdcJHa6rYNGzcrwwAC0o5Tz9kM/qayLjiVAt7COof2+o/b?=
 =?iso-8859-1?Q?FoUsyQq/rTBqlwV/1jl0mP2Zka/We7pxH1r+jsganIivq8D7scyUDCiXWh?=
 =?iso-8859-1?Q?tfvzEsGl2gl4Y52+K6Fr8YRFrxo7PQ32o/cJX4P+pse7OGlaCC6V9xEaFc?=
 =?iso-8859-1?Q?g4pgdDqkE7jWLGVzRYdykTo1+kM6ONWqMMb+l78X0jbOg2A5uZ/fG4RRPn?=
 =?iso-8859-1?Q?KFb7B58/IOzq8bnro0nPWZH4Epz0zLjuAMiR2p7uikNfI1rhA9ru9sKNi1?=
 =?iso-8859-1?Q?qcPfJP1YD32ncViVw2MPxdsCQRghWNM4QT5wj/HI/dLAMkqpTMUS33Ig+j?=
 =?iso-8859-1?Q?l+yvRmqwyzP+nP5kudupnJgjBY2UicqgC6toBB9unCsECgsqjTbGV3Go86?=
 =?iso-8859-1?Q?BQxr2oqQL1701YNb2FP4RkrM9z1QgiJGIUvirekoiXRPyl2RSBUNQ62m7b?=
 =?iso-8859-1?Q?maFVejhk0kH9fNYIOE2iYW0hQtgFH/lB/mTDpBqYdaV24gB4AtY2ByizRu?=
 =?iso-8859-1?Q?DYQei3HfeSp3qinQ2l6FtTEGmq+IkYR5JDUw5c0Y9RNlZgDzSN3984DhnA?=
 =?iso-8859-1?Q?uDcE9GlcRUj5GLOUacL8rjNm7B8ygYHDHc/cTEERq9ArFtVfoPrmKvEIJ9?=
 =?iso-8859-1?Q?vWbYS4B9+Oh/EjUpeLE8qwGSPjLHYMr+SNBdKCJm7DEmU+R7+xJXfzD4Oq?=
 =?iso-8859-1?Q?3UI1/BAEjhjwQUJly4DoRTbWWqMWDvquiS9jlJActKRVQA/VFXSwcDLqFA?=
 =?iso-8859-1?Q?LDP7wsznQeZpt3ocp+MFDbzc31VMTz+h2Ngv5nyERieDQj9beYj31btyWw?=
 =?iso-8859-1?Q?aIeGZql5JuDvaMfDWZPyhgSzdJcfo3GlR2oU6XGZtOd9iVfz64niNUzs1L?=
 =?iso-8859-1?Q?7gkMiPaxXk4WsYvDfiZPCW6lA0eIEiRt5C9f+ODhrPO4ecK4tRH+zIzwW6?=
 =?iso-8859-1?Q?l9U4gOTKcV9eRkR/VIYdb5yVEKcPF9FHVGVBmPgZbdGjxlG+rL/8MXktDd?=
 =?iso-8859-1?Q?ODFS1a0GfuMGsjxPZ2ce14LzhjYbDJMr4xcpyfiRt6uzR8RAKWSlpzJlLf?=
 =?iso-8859-1?Q?kspLpxLBg8pLs6XNq1DVZw9mYklYWwIlYBYUP+oLYFzXexZkGEoqaggcJG?=
 =?iso-8859-1?Q?YaVdhsCpCIpgoRpUERKEE7qzTf/QLWj5jKhHFnWA8a3gBc0dztVUBLiGQv?=
 =?iso-8859-1?Q?Q5eWB+VII9SqW9zheX9ijmxk4bSgNsK/0cx6Q1e43GN4ub7HRDtK9IVSFQ?=
 =?iso-8859-1?Q?JaRFS9ikK3jIDqqYlDaW7K4BWGe65BBAgmNFEsk2j1X94QLi0hqJTy2src?=
 =?iso-8859-1?Q?xdZurPwa7PeEU3nYVz/071msxRN6RBCm6LdWM7vJe1GpY8ILVDamOTeg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a623fcba-caf5-4935-bca1-08db8e029b5e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:03:25.4155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oq/7dWoWfcxJtNkvnHyWxACaHS76k0lZ2vQPXgtFS/3r9X+48p9tJlf1tluZl04QQjsr3Hg65PaAIbkDpyfrQM8FMmiHzucn+Z3bavGaEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/10] drm/xe: Carve out top of DSM as
 reserved
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 10:07:57AM -0700, Matt Roper wrote:
>On Wed, Jul 26, 2023 at 10:04:07AM -0700, Matt Roper wrote:
>> On Wed, Jul 26, 2023 at 09:07:07AM -0700, Lucas De Marchi wrote:
>> > Top of DSM contains the WOPCM where kernel driver shouldn't access as
>> > it contains data from other HW agents. Carve it out from the stolen
>> > memory. On a MTL system, the output now matches the expected values:
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> > ---
>> >  drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
>> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
>> >  2 files changed, 10 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > index dbf572d11af0..315f6f8dadf3 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > @@ -84,4 +84,7 @@
>> >  #define DSMBASE					XE_REG(0x1080C0)
>> >  #define   BDSM_MASK				REG_GENMASK64(63, 20)
>> >
>> > +#define STOLEN_RESERVED				XE_REG(0x1082c0)
>> > +#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>> > +
>> >  #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> > index 271b3fba4129..7bba8fff5a5d 100644
>> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> > @@ -89,7 +89,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>> >  static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>> >  {
>> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > -	u32 stolen_size;
>> > +	u32 stolen_size, wopcm_size;
>> >  	u32 ggc, gms;
>> >
>> >  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>> > @@ -124,6 +124,12 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>> >  		return 0;
>> >  	}
>> >
>> > +	/* Carve out the top of DSM as it contains the reserved WOPCM region */
>> > +	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
>> > +				     xe_mmio_read64(xe_root_mmio_gt(xe),
>> > +						    STOLEN_RESERVED));
>> > +	stolen_size -= (1U << wopcm_size) * SZ_1M;
>> > +
>> >  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
>> >  		return 0;
>
>Oh, actually shouldn't we do this WARN check before we slice off the
>WOPCM?  If the GSM + DSM (_including_ WOPCM) is larger than the size of
>the BAR, something is wrong.

as far as I can see, the check is only for: "do we have access to
everything we need"?  So I left it after removing wopcm because we don´t
care about accesing that.

Lucas De Marchi
