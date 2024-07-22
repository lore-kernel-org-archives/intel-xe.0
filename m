Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56978C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 17:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E1D10E0C5;
	Mon, 22 Jul 2024 17:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkkK97mP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DDC10E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721670526; x=1753206526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rJlyn24X0X4682fqC7oLwR7czJu0a7xOvdXYgYxz82s=;
 b=KkkK97mPqIqesG0NIq2zFGiBxdYzAMnGUWOw9CLB44AisJzMUbKse5mA
 igxbS2+ZM0EhE1dy2wec6GInwwF4UIkWjBmPHBP104uMg1/Is0dcjKyYU
 VdRYQAolzIpZVUqGZQMDUci74UC4Lrfq5EpIBAz/v1KGRH5e0mGQjvUeX
 m202YQyPW5RHTuxWPHgApJAzAv4Uc7amvxNTNyevKcDzt/oHzP5Smu1i+
 JFj/7UeCbcCKIFm3waAi9DPzcrwgyXJ/n4Dx3USgYyHIBTDY85vMXyFE3
 H9B0TuU1XB38kZVR4XV8m1i38kz37l6XaGuw39DKSFxkVX8qoEbudn/Ut Q==;
X-CSE-ConnectionGUID: cWsLkwnNSaalxsXKsa0z7w==
X-CSE-MsgGUID: 3dwdD2kaR7aRN28BCI5/dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41779679"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="41779679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 10:48:45 -0700
X-CSE-ConnectionGUID: kQbLd5RvTCmpigOjmAbR1Q==
X-CSE-MsgGUID: FGLvZMSCR0KiC5UDYF7cHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="75160341"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 10:48:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 10:48:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 10:48:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 10:48:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 10:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G29Ha3JmzX5QFW3bhLEneYr4az8/S3rQWW7IEUm/zTSfU+8hWbWMLSxHObRAkom37j1DLgiQWM51ciHTK5Vm5XEu+DMHMWIaGQj0w6iJ8sCwUHPCyMKMoJV/OkEsiwhBrNjopoFJdhMasMnTm2O8vZxn4Tmvbb/2o8tT7JpPIlhIpM/OjBsdeJHDN/3eZ9e9CCZVM8D3fs2y9j990+f8bDMMcb0+ti2RgevlBh2arkzf0xYQNqkA1cht4b1cujjHCcYlBaO2c4jh0MF35o2hsuA7n115U4860/Ip5rJwgSdsT7a4JlEdJGd6Ao3bqLSzWt5PlxYpLkx9KUHQNrCWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4IxxbDPixRq+nyc43QyuEXo4M7P8TlzpL43e1gjbJ4=;
 b=Yd+psW4ILDy+vENth53q+38k84hc1rR9FWAerF4LEbLNBF6/le5jRmp6JUHLPguLmF3Ng634Rd0mp5ghLVP1abZznc+vB2ncNMIjq6p3fQmLaIg1r7Kb01pqd1D4h6X8+azjd3K8OCcwfQbcGzXSO6uJUwrwK0Fa2MslNZEzCHzB15bHDcj549q789rPJP2qhym+sEvJkiO39ezyVmyyJ49Hc6txnPD2IxXlet+hyqKJPcJr/D8ALYrZuhV3Z0WObmqh6xpRYoWP0VLZG89knEvP6EWgq6lhQqduQ8nhaoG5bBlbsGbKUN7MIfM9yuXQuOGF5MaLPPFkC2nxk5Fg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 22 Jul
 2024 17:48:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Mon, 22 Jul 2024
 17:48:37 +0000
Date: Mon, 22 Jul 2024 17:47:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zp6bPEteuu+Jl9OO@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <ZphRcXT8IkwUWBOW@DUT025-TGLU.fm.intel.com>
 <Zp4Y9ZHA51INVtr1@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zp4Y9ZHA51INVtr1@fdugast-desk>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: b3daccdc-138e-470f-3458-08dcaa7683d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JaBBd6geOcWQ75gNb4ETVoj3Qelb2Mi9PSrlhHuG9+ViMLwOWSdB+/XDPh7Y?=
 =?us-ascii?Q?pGJPDKygt+bMq6fMrb0dWXTeliAwNQPdt1RPTX6cW/RuJgzCpHvk+nHElyhN?=
 =?us-ascii?Q?Hp1Xvv1D3+64VA7mYA4ipx2HOeEXgiZDDeyjI+lgSbYkIw31k222GnvteIuP?=
 =?us-ascii?Q?6ym78OKwBfhvjzOtgKNpuf40dqEdVTscs1y5Hc04ARWeFp2dTJjRKZ8dC8jD?=
 =?us-ascii?Q?fUOsApXB+glyNIPSjbARWBSyXlSMmG3gjv4BqkAlhx4+t5TzxruppVTtq5FC?=
 =?us-ascii?Q?vO+XfzUbyTM/o2gsNp0yOWHxOe81FEhPSCh9KWAtKFQkoKGToOZYxXAcGqmY?=
 =?us-ascii?Q?eKww4KpUP1uCnUkmbYT6Sm8+6xwBFnfYlUg8bxpjeMUlYLAC68VriRHQKvjI?=
 =?us-ascii?Q?W1W3Ra2W9VybVGFDpYw7sXkt5PrdtN9ZyFRu1fJPPF2KqE0CHHM5cLM3cnw6?=
 =?us-ascii?Q?dTXB7qaZMWMpFZBYp7xM6NkWfOlzejBBo2NgCgHebUnwkvVBWaWgZ2ZKDKVb?=
 =?us-ascii?Q?dTp6oWfl6MbiLbq5v+W3y/N+VCsxd02it9/BZeErn/gtjokg+o0PHUeJgwQl?=
 =?us-ascii?Q?I2n2Z0LYM9yRcAcTMgSdIiDLIUMY+zTBdk3aUBhEqrVsHiCTI0ymae6qrVhc?=
 =?us-ascii?Q?f0Dp8BMp2pMFJyaGir2UUzS3NMRTgfWWXOpNbqlC+i/RKp7dICe5EnJ/jBR/?=
 =?us-ascii?Q?KLD4Cf8xEDsgHe12pzlWbLDxYZS9nxHRxvYJ/Jv8RRKQlq+jvsK1SH0xY9uG?=
 =?us-ascii?Q?/b4oXPhVeW2d79xk9tH8aaEd1UdDUPjZsYhKa3C/lciGApqmNx4oP7qzPeGo?=
 =?us-ascii?Q?/WaH7wEoHq2Zvxw/v9yF7gWea3o+90lBcMY5rWMN7v3p4wRdwXQPJbGdwlui?=
 =?us-ascii?Q?YNZxjl4D3q3ehRNGuI2PhYpayqpe9/N9nAx+c6fhcOWhPYLNFFUM/eF+oLzJ?=
 =?us-ascii?Q?j5qTdbfRHB0CyF4Jb2b/hVeZEmjq+Vs4BPY0hNYUZnHrSzuXtnz4YayQZ3Bp?=
 =?us-ascii?Q?Kh+CzoMxFgi+L7xEcJ2hRALwlY6FGCOlhEy5ZKRYyzObhMrrsW5VqqTTvBHe?=
 =?us-ascii?Q?YFlgdO/D/OjipG13rxJd/n7quP+sr9G/cxRqL8zhWRcaOR8ByGbxsO5FAy6A?=
 =?us-ascii?Q?whtA/H+pbLADj02rQr84eD4oAMIwavWWsdg3va4KzLjpwp8Z8uUeenTABDTN?=
 =?us-ascii?Q?Vkw9BW93AEuqf0BoQbu2OuKiIdIbe770duxWOufx3hQFLMuJx5jXwL2Hi00r?=
 =?us-ascii?Q?GhXyZ0bByy9lXcAiXHX+v7TpxUuR1R4ahpRiXSCQM3oXCZRVka5Q5XJNfa9c?=
 =?us-ascii?Q?YZfrrUo5tQbwv562gy+0n6nvIKkXyT6V21acfRv1VzbvGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqeeFiPvCC7GOpdQW8351/ZXU6kBy0kSV5BdXl+NYnNOAl94PxfSC8QLTB27?=
 =?us-ascii?Q?kWpPLi4QjiH8zt4ojj7pnOtWOdcCQglKtuCL/EP/z7MR1Nc3cPCFXiqVYn0x?=
 =?us-ascii?Q?odL6McbR68ln1YEd160eQfjD9qgwxIZLtZV/BSIpC3+4Ql7R+7I6x26nB5dq?=
 =?us-ascii?Q?Kqg3kfg+qm/dclCqHCjHgGUjHpiVpelMyLHSUkjxI7IWha05QHWvOsRyBTG4?=
 =?us-ascii?Q?waN74/kVHFh42HKClWPCgmRomDNDfyrgGDPSS2VOyr7v5zvdJ27F8/26cEBD?=
 =?us-ascii?Q?wnNy4yYYHXB1GPRaeyxNq+8G1ixyn+a4EhAJ+RaO5MZSxvFskmv/YSly0KDY?=
 =?us-ascii?Q?F7PuqHkCxUt5MLdrqcdzo+Bk9TOzAo/uQMtxqS1Ce3r6ahLtWTkWsrRYCoWV?=
 =?us-ascii?Q?aJFAEwAmm1RypPSmL6pobEeJpNThcYp63x3BJr6PhgLA2d4Yz+YhB6N5giRT?=
 =?us-ascii?Q?7yAPQq87FDkkR1gLkByKio7fux8mpE/C5PbWv2G6//g/Ale3p4EvZHZYS3zn?=
 =?us-ascii?Q?cyywpdQNEG/9q+QKLIwrFroXpK91TdwEmw/eKxgDdH9f1+1/iq+w9Il3bMdh?=
 =?us-ascii?Q?UtTGORMh1x35Cevf+2uNf/ovDXn7JVfgPd6rpKLCemvaUygr8cr6wTXOoRLn?=
 =?us-ascii?Q?Wwf/io5l9TJi1XttwKz4KBq6fnxgteSNXfcMeJ/qtI59c6rZt61sE+M2xfJp?=
 =?us-ascii?Q?T4SHGghNF0JCrs3piDu+eaMtJ7pZpdm/leyuO2a2yLbM+qCvCZC/N9H3xtyj?=
 =?us-ascii?Q?i5xCmItCi/G6rKyPdC8j7+8c5S854SbWdPO5yRa9NDDQc/9vOA98uzd0S0AF?=
 =?us-ascii?Q?zkDnnh7nrOgVLYuy8Z+RDr4DY8Vduc2vvch5RsotXjbHCDGTcoVqriEZjUyW?=
 =?us-ascii?Q?ITyjYsn/N77QhSBRQYQiLcAPisXrTsUeO71Xa3pNpuzXtoVk/F2p1L9eH9FK?=
 =?us-ascii?Q?q8DfXhATWDRUh8uFCjSz+G6wq6nbSWbfifHjaGjB0G5WV4Lu++yw8k69lu33?=
 =?us-ascii?Q?ku/zbU2XlqJKzyhnDsAsPcUt1qzSlf1aT3eybranZ48Bza5optYTwsel5YUF?=
 =?us-ascii?Q?rYH0458e3VYmfgWVYpVhwBO/58UE3L/bzoZ/cqflgQTzB/O2OKdnTupgi5qH?=
 =?us-ascii?Q?x4IejNcI3+YCvUJ5l8P2QlqelS3UNI2Zg6uwFm+6917b+WjKBK+okDcqlJIk?=
 =?us-ascii?Q?GbF3OC0s8tTIjoV9r23tmISbyjqfvF2FSbeG6sfwkHfoN4PebenhJuqqZzxg?=
 =?us-ascii?Q?qdwcUd50Qjrpv2de+QhgMzCRYZXc5u3I4ro7qHK5VCIpewDJxgp5D8/z2d2Z?=
 =?us-ascii?Q?iwkznVe1xVdTEzUiTdWnfnQG3rkrObqrP1Ii6O8JmWDXDQlc7Rj0kxxQi6lZ?=
 =?us-ascii?Q?9ZIQ0zFj+EvRGlxylAnltzsL4FRztfBauUYPLZVVwDCHPLNbVGz7abZ+PhVa?=
 =?us-ascii?Q?ON9T258afvbOYuxh3JcIZqb80gyt4ZHspOs9zz9isQQgq5LI3mW1xKgyblWK?=
 =?us-ascii?Q?cQIaQTQLC9nX/MXnVFj/kn3pOBZAdB+9S3VgGMhEecxVsfxTdCPLZyeR4bMf?=
 =?us-ascii?Q?KhRYvFXILPsyF3ZzOaa6lQebSMaMd1sRH+F5C5Mhu7FPzQeoOcQ4CrZGBEjA?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3daccdc-138e-470f-3458-08dcaa7683d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 17:48:37.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gz6XKC1/0C1LVBlY7y8p2klcv1inyi1Mlu8tj0mTclW1Cc8hC4IWzlF2F6a8h7H45iu3MIFsi4pJxM8ykGFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Mon, Jul 22, 2024 at 10:31:49AM +0200, Francois Dugast wrote:
> On Wed, Jul 17, 2024 at 11:19:13PM +0000, Matthew Brost wrote:
> > On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > > Add helpers to safely add and delete the exec queues attached to a hw
> > > engine group, and make use them at the time of creation and destruction
> > > of the exec queues. Keeping track of them is required to control the
> > > execution mode of the hw engine group.
> > > 
> > 
> > Ugh, missed one thing.
> > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
> > >  3 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0ba37835849b..645423a63434 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> > >  			xe_exec_queue_put(eq);
> > >  	}
> > >  
> > > +	if (q->vm)
> > > +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > > +
> > >  	q->ops->fini(q);
> > >  }
> > >  
> > > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >  			if (XE_IOCTL_DBG(xe, err))
> > >  				goto put_exec_queue;
> > >  		}
> > > +
> > > +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> > > +		if (err)
> > > +			goto put_exec_queue;
> > >  	}
> > >  
> > >  	mutex_lock(&xef->exec_queue.lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index f8df85d25617..4dcc885a55c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> > >  {
> > >  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> > >  }
> > > +
> > > +/**
> > > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > > +{
> > > +	int err;
> > > +
> > > +	err = down_write_killable(&group->mode_sem);
> > > +	if (err)
> > > +		return err;
> > > +
> > 
> > You need to ensure exec queue in fault mode as in the suspend state if
> > the group is in dma_fence mode:
> > 
> > if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> > 	q->suspend();
> > 	q->suspend_wait();
> > 	queue_work(resume);
> > }
> 
> This happens later in the series when switching execution mode to EXEC_MODE_DMA_FENCE
> at the time of job submission. But this function here is called at the time of exec
> queue creation, am I missing a path where the exec queue would be executing before
> a job submission happens?
> 

Oh, yea I guess if always switch modes in the exec IOCTL is this
probably wouldn't be needed. It would be needed resume worker is just
kicked in the exec IOCTL.

Conceptually I think it probably best to make all the queues in the
group in the same state though. Having mixed state just seems like a
good way to get into trouble.

Matt

> Francois
> 
> > 
> > Matt
> > 
> > > +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> > > +	up_write(&group->mode_sem);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > > +{
> > > +	int err;
> > > +
> > > +	err = down_write_killable(&group->mode_sem);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (!list_empty(&group->exec_queue_list))
> > > +		list_del(&q->hw_engine_group_link);
> > > +	up_write(&group->mode_sem);
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -9,6 +9,7 @@
> > >  #include "xe_hw_engine_types.h"
> > >  
> > >  struct drm_printer;
> > > +struct xe_exec_queue;
> > >  
> > >  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > >  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
> > >  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> > >  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> > >  
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > > +
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
