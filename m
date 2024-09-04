Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C4ECD4F24
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 20:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825410E056;
	Wed,  4 Sep 2024 20:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC2EOyj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995710E056
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725481654; x=1757017654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2zBPou5Zf3j5QIZ/h3F8F9juTfkrX4avERZvKuR+zn0=;
 b=BC2EOyj6cVgajItYbeizc90enxGHIWCx3uTIpWaM7A5ObinGMvUaBT/E
 poN+t8q/WKFLpZFSoetWIrcXvWwyaX70UG3NB+geOcs8Kl/Oyr0Jfci/S
 khAqlciipiFX/D6lFzJrkFQt2qOrbBwUD9mgy1EPrYM+EJnC7Km2VsR+W
 j4CqBEj7pA7lrJyg8HhCIM8L6CoFwxO5+BdwedJXYGYiqPDBDFxWOpgaL
 xVhQQdI6O8UVUboJfZtDYAFF06up21uJ2AR5tbqnyRGhDcjvqrkUSkKpB
 wqjZ3MHxUbqgXRJ81nsYL/QtM5rsXhc8w/R2B6JRPSsmexqNeTRkFKapX w==;
X-CSE-ConnectionGUID: mkOhl+t2T9OwHaqf6t5VBQ==
X-CSE-MsgGUID: NTubvYL+Q5i/N8Kg+U/jAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24361531"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24361531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 13:27:33 -0700
X-CSE-ConnectionGUID: v4xIcustQkWnoJzSrd6ibw==
X-CSE-MsgGUID: V0UkR1/lQkSGR9/Hkr7jlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="66132251"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 13:27:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 13:27:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 13:27:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 13:27:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 13:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouXewOgPWblWYm74qpSEWLJgwYENFWqV62jBoWxizGLEh9aJYgPvlVB+roHwJ9sx4x24xBt1Tnz3G5ED1c0fowQV5CxPSdw3YhCuczB77DPrcAOItI3LJOc9lJfbwPIfPzdkwObWYtJITsjfH9Y2rZFVQlvArY6SyF4NqWFBU1Y0bcdmBFA9fbrussGMWcwQXjvFilWI2Uhkj2xXdn6a4TU+mdjdiZ6oXtaKshr5Emx2hZbRCBcSTKvD7eFbWHXBB7jzctOAVx4BBdbW/wyGJH+/PnTPjAeNTT9eTRd8E9Uf4jku6TBuRhROvv5QG7pjw9u1OZayTmJuCwrZC3yJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dztm1uC90BkX3xAUz2nvy0LQKfkywpWxR9vCDG3KMAM=;
 b=rUrJUdPBf4qLDfFyUFBRYX9I7iypGWWY9Y5zLT2+IyRvY5kkOg/og4XJ8jxMv7O5ZtQdDDChAt4iAxmAEJr8WAZag84oT5lvoyZr7miQfjsVwIzLN/Aav3voMkHSs4ATPLtOGyx2dMR8MdfQ9n6Paq2gYvLCSWQDCrxbsph4Kz2pSNRrkVyE62jnralLtZqaTIAihS8toI/Kh1Qb/JT/NFd7rsd/N+iXg2+0z8JliujKPI0JgiTCekYHSolHlg1bnHoU5uiVg7B+4IYTTgXoMlIXPsoV3p8oEwaH76v+J1dBpAzwztv7I0GA4a/q50gMa6+cEAc1zJ5m+1yWJWs5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 20:27:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 20:27:27 +0000
Date: Wed, 4 Sep 2024 20:25:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Suppress missing outer rpm protection warning
Message-ID: <ZtjCP37hNudUpL8C@DUT025-TGLU.fm.intel.com>
References: <20240904165116.22829-1-rodrigo.vivi@intel.com>
 <CH0PR11MB5444C7A17B3B4943ABC55C46E59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444C7A17B3B4943ABC55C46E59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edd0369-000e-455e-b0c0-08dccd1ffe07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+OBzbR1tSzkXPA2iBV4Es15C+QX0xW+BUMdjhlZJi47hNqoeO5lB9lKiI0KI?=
 =?us-ascii?Q?ZVunGmF79dr7Ut026zqlrqtRWSXSpkRKBda/aqpTpo2L1t2rI/EDiQjV4XtP?=
 =?us-ascii?Q?eEPml1SmhXwAnYi2MSDga77ZBOMAZXTqPOgqOCniFDqZrHtLgGFY9biG939o?=
 =?us-ascii?Q?hgyyeYmR/Xv7iIT+NRQwGThlNGyjLVZ5lWrAfln53SyRbivDmygGbMfPcuJQ?=
 =?us-ascii?Q?jeFd6ZH4BL3oVMDBKcW/2bqQRl6doHYPuM8LY67Tdhz39afVL1EqXxeg53Gh?=
 =?us-ascii?Q?vZHc/AWU5DbuV+K17yDKK+cdSufXtCqe+SMw53H0vVdBwnIZRJAVQAhykqjI?=
 =?us-ascii?Q?ZM8wDk65RZ2yaKh9f7WRf29sGJnmFVUy6HaKnZGkYsjg2ElzXnPV7zhQnXgj?=
 =?us-ascii?Q?XpkBDQpDot9cxrb/se9d+/T05aj9EhPXPudYPFAUafXzysQXGaM7xLekKiAv?=
 =?us-ascii?Q?xyt244MXKXtUel3rwh5aXniUyjC0EBXV+tglHdX/zbbXOzlMbf9kkRijYFTf?=
 =?us-ascii?Q?ajOR5G18AWw5F6ofYep17y733GO5Dtu5SbbZaQi4iSbmQRRhAhBoOWKJECLl?=
 =?us-ascii?Q?5XTetISKFes4MXf+5Akkpkl4XU31OQQYj3vZMLRvMT6bnradFoR8b4/T96pA?=
 =?us-ascii?Q?93I4mzQLpIv+7nWnZ69uxXYr9+9vAhh94FzpqTcyiJDFqKgZ15kqbk8F+lYx?=
 =?us-ascii?Q?YsjAK6/rWXAcjSRN1feyW/VxWfAWCwxq/UQ/neO0Jbt3aVTS6fA5WwKHZtsx?=
 =?us-ascii?Q?p5UD7ALgSxveEu2hzeoEJSZenCfkmrXHIWjIBIxqoWOXMLdcBdBI370LvkBg?=
 =?us-ascii?Q?0H+zuSseeKQqd2eyuJgt1AQSXvG8wI6GNIrzu4J/Bbvc+3CKjS9dRc8KkBGC?=
 =?us-ascii?Q?FuzqIAcO6JnWshmmHFPOR5wqZApmy5G1Ak8FUK6sXzULi3hKPH+hAsPCCK99?=
 =?us-ascii?Q?ruQR1/oVEqkSeMaozwgKdCW6pouElRfTd4YcANTTSRvBtpsC0v1DNnqKbb1/?=
 =?us-ascii?Q?cYEW+rRGlogb90DENgGizM5dIanyFSciGYIBsKAAf7HiLVGC093WBa8QW56f?=
 =?us-ascii?Q?kgGKZXvJ6dKV6VqG4PBEQU1pQr+MMw7YgvkP1D8ikIso4prXK3BzMW1kg16d?=
 =?us-ascii?Q?4PG7SszgfClU3lxPn9KTPdZQsmaTUI0BYiNsayTlyXCj5wzY7qfXKbg3EYM2?=
 =?us-ascii?Q?CfSXGfNBSASH3hXkR32bre16qHYhscCoQX1sksfXmWwj/7a7pqcH6tnbp1fE?=
 =?us-ascii?Q?kJ7lE/+FqTmctMilZLqcPN/VYR+N7l/G2suAx8wp00AejB1vY3HRRqJRJfLD?=
 =?us-ascii?Q?Onf/Xil5Wg4dKBRzp957VBJ933Dp4yHprqf6E/zRvzwprA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fQxiAxKN4gpFjvwzUJfNCo06H8DixjKnIooGUXr+ykPgRG8a8x9T2FPvOyQD?=
 =?us-ascii?Q?pLrfFLNretay/1s7AmJxSLjw1Moi4liOhGTDEEUHuNj6cDi4gDdFdZux/1nS?=
 =?us-ascii?Q?hU5ANMGqS5oXrNpMypuiAExJRS7JXcF/pTq1E7PbFSE301G624w5gTJXyhXy?=
 =?us-ascii?Q?clrxo84MJ+hwtUVgp8JKEFl9GWGjrJzwqc7kNdLvGefP/76X7HZJbYf06NWU?=
 =?us-ascii?Q?mW6IYGq51AJtj9ZTZNZ4bVMHCr2aeYtZx0IOAtwx+YMa1KVF3qURfuO3c/9S?=
 =?us-ascii?Q?4k7gEuUH9u0vF0ab3MH+Moi0OAWyCuorOs8jMRrkDCOEXVm2StEhY5fil8OW?=
 =?us-ascii?Q?lSFEMTUjZLM9yfps0zr6ZBEWlJefzmLObiiIBcJ9mMeXwjw4pq0zIPC+K5dJ?=
 =?us-ascii?Q?9uDH4/Ff+GUBi3v3pgi85Uz6SVIUJCyyEoYirdt486cr70TVQsqonZ0jNTAM?=
 =?us-ascii?Q?1CU6w0AWivJsSRMdJGNDPbIxobc6p2Fb99oIhPFe/2R349OuWdhWfWu2q4BK?=
 =?us-ascii?Q?RcBprePrWGe7RHIa1inVeJyF+oeXa0Tsb2DpONQCOoLjIGd252Vk9yMN9+hP?=
 =?us-ascii?Q?kQijuPOVmnS/XozvhU0XUfcpAMqcyX/yzVqXi3arA4XYnC5iFEHMnPj+UTIm?=
 =?us-ascii?Q?TGuV2PFPb5j2fvp0cIYmz+mAOm5U4AaM5CpOXz1GvXWCfYY16/FEn/Be2mnf?=
 =?us-ascii?Q?aEItHr5trtSQq3RcgHn28npTDRiChR7Wm+nYg/N5WvcXjMevvof2qlAO4LQg?=
 =?us-ascii?Q?SnKbLVueyxl1CACiBLgBs8IeajSYVqbv1ex9e8x2WYdA9Jnh+DcrhpLkJH82?=
 =?us-ascii?Q?nqOLC23sNKjLRVl8Oeu6UHoUFsWaUPN7q+Hzxhw3PXQ+RBdPWmR37miFEz0R?=
 =?us-ascii?Q?EGKuqlwMUFz5s79Wqg4u9JBkoAZRZWJP8MAkSvkVOhmZjctGAxG7Sz23CY9d?=
 =?us-ascii?Q?/o5VK/LCMeab5o9UY97eNQ1OvaNYPGIhP2zX2pAnkUYT2MyZKqOi3Fn98lzH?=
 =?us-ascii?Q?SkoyKHZCqk9A26j79QkYYbRk+mHpt5ksss1uogI1Lap4MtJDkBb2jwiRwZ/4?=
 =?us-ascii?Q?ElApibsRvj+jr0avB/AIou1as22GtETQS68zBzaZNFsdE/4rgm/DeHyWZlyO?=
 =?us-ascii?Q?xIVNLz6GbA7k+3ETIRV6uM5l//cI1ZoSxkR0LUnfoHMYUZx1u9GBv1+iEoIy?=
 =?us-ascii?Q?laCIGNmfF1OecEUaz3kmm5czYeFPbgchy9ALQ8mFcigg3CotDMk890lkaoBe?=
 =?us-ascii?Q?N13FwOILS12LGqRDCa8ipJHceUFi655oFgQ0G3ktYX1PE4BxVKjKk8A7Z0MS?=
 =?us-ascii?Q?2PGVKO4oM13NYjaSjxQsaM2kA8GYdHUPlpiS2McySWBjdGzI2EU6EwjFaCxp?=
 =?us-ascii?Q?9e1Pu7vs8ba26pjP13P3wxs+Nz8tDpjDIbUjtIuLkcqnq2BCTxItWHSCA8sZ?=
 =?us-ascii?Q?XnAFHITdBEE2kYJYIW3nbXdgdTHpu/PLwOvl/qtv1S4jQ/kzv0ts/9hzQKQo?=
 =?us-ascii?Q?rm6SQEBu4qOtn434lQGIsinc+FtwUPJexS4K95lviQoHE1AOLB/E877RrCeC?=
 =?us-ascii?Q?T/MEiJl7bIVK05u3F+Fi5D4P2CpNawp1rEEi+U+bvIBx8qgxifRLMKszz+7R?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edd0369-000e-455e-b0c0-08dccd1ffe07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 20:27:27.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5d2r1u9Km/9rPCcqG2Lv9y0K40JeAf0vG8cslhMSP82H8CWfzY3Qq1mdg9JWyoj9aP9SdlClrQNCziNQo5bKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com
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

On Wed, Sep 04, 2024 at 11:26:47AM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo Vivi
> Sent: Wednesday, September 4, 2024 9:51 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH] drm/xe: Suppress missing outer rpm protection warning
> > 
> > Do not raise a WARN if we are likely within suspending or resuming
> > path. This is likely this false positive:
> > 
> > rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
> > console:              xe_bo_evict_all (called from suspend)
> > xe_sched_job_create:  dev=0000:03:00.0, ...
> > xe_sched_job_exec:    dev=0000:03:00.0, ...
> > xe_pm_runtime_put:    dev=0000:03:00.0, ...
> > xe_sched_job_run:     dev=0000:03:00.0, ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > console:              xe 0000:03:00.0: [drm] Missing outer runtime
> >                                                      PM protection
> > console:               xe_guc_ct_send+0x15/0x50 [xe]
> > console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> > [snip]
> > console:               drm_sched_run_job_work+0x649/0xc20
> > 
> > At this point, BOs are getting evicted from VRAM with rpm
> > usage-counter = 2, but rpm status = SUSPENDING.
> > 
> > The xe->pm_callback_task won't be equal 'current' because this call is
> > coming from a work queue.
> > 
> > So, pm_runtime_get_if_active() will be called and return 0 because rpm
> > status != ACTIVE (but equal SUSPENDING or RESUMING).
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index da68cd689a96..352f9d593496 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -588,6 +588,18 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> >  	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
> >  }
> >  
> > +/*
> > + * Very unreliable! Should only be used to suppress the false positive case
> > + * in the missing outer rpm protection warning.
> > + */
> > +static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> > +{
> > +	struct device *dev = xe->drm.dev;
> > +
> > +	return dev->power.runtime_status == RPM_SUSPENDING ||
> > +		dev->power.runtime_status == RPM_RESUMING;
> > +}
> > +
> >  /**
> >   * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
> >   * @xe: xe device instance
> > @@ -604,7 +616,8 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
> >  
> >  	ref = xe_pm_runtime_get_if_in_use(xe);
> >  
> > -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> > +	if (drm_WARN(&xe->drm, !ref && !xe_pm_suspending_or_resuming(xe),
> > +		     "Missing outer runtime PM protection\n"))
> 
> I don't know for certain, but I think we want to run pm_runtime_get_noresume if
> xe_pm_runtime_get_if_in_use fails, regardless of the pm suspend/resume status.
> Something like:
> 
> """
> 	if (!ret) {
> 		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> 			"Missing outer runtime PM protection\n");
> 		pm_runtime_get_noresume(xe->drm.dev);
> 	}

This suggestion looks correct to me.

Matt

> """
> 
> I at least think it's worth double-checking.
> Otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  		pm_runtime_get_noresume(xe->drm.dev);
> >  }
> >  
> > -- 
> > 2.46.0
> > 
> > 
