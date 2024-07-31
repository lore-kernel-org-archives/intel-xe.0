Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F35C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 22:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79E10E2C2;
	Wed, 31 Jul 2024 22:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHhtW/xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D210E2C2
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722465327; x=1754001327;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3RwotGu34TIYMPaiL3PFr8dIHm69vNjX1QxQIMybsW4=;
 b=bHhtW/xtHan2trY13byp3Vs7rqtHPnZHbpJELNrgmg2f2AHFmv5vAxMg
 zKxi2CneEAxFxmFsvc0vl3txTj0kJ+dcos5yzdQQPgRE2t4k733CNdTfY
 wL+OUm18PjmBtOSwP/9ziMNqwEjwJ49aqE1PXmMvBc0LIG+K3+mP/J0eG
 Bw8o0cIR1N6gXkKxQuKx++nkDyeHyNuHtQ3VLSSWkX4t6zewq+VSp6e6O
 62CA4gso2k922TneFHHBpw6vp+c2y1nDWJwIwaiPv7KPyTG2ZJecmcoiQ
 JqwOrFFqDrVtigl3GXqwcOtXbyVGeSV3cE8I/Qx7LSSZxFv5gO8mPDBoE A==;
X-CSE-ConnectionGUID: IS29D1D/SveT9NOaT2SJ8Q==
X-CSE-MsgGUID: F1dTa0tgTsGynzmJ69C4iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37851165"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37851165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 15:35:15 -0700
X-CSE-ConnectionGUID: 9AulF8qjSdCJ4/LKKq24xg==
X-CSE-MsgGUID: 1sy6Fl2VQBm1myePGTgiUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85440828"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 15:35:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 15:35:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 15:35:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 15:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSX/yX/7lcC0e0G6jxYdxP4j7UWzNp4gIC3RF/POIr8er7WPy3ti5W+C0nv/InAc/29bK3Pi3h7zjn/e+R12uNPHvTldaO4h+pJr8JjPE7uik1nMYYsRVaZZKMdUoI/InG3RGeswMdiCnZAIdQRHpodBftg/ZiWjg4JCj3UTT2iN14S6PZvR8uXX4Spllk2/SJRcmQvr9+0aEhzgbq5o7r6RT4T78NgLRsxXGR/C0kUDqq8kAEpea5S61zCiaAfjAmjaqLzq4ZN4isXrFVN2PwST5zlx3GHSQVJNJMn04Jlt+oM8qw4vbweOndSqJ5O5/7cc5iq6Z+hdS9PBkKUDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBEHJNp+Mcc9gD97cVaajOfnzmXYx2jiXTZl2sMWguM=;
 b=HvCXIwDKaSQSYknJQajVPKZEk5IcbYpiJYc6moWwneT6UwPt55P0O8V1c1KzkeR5m0rkZlnS3d+ZGvl1RTpCw2NBmx4g2SK1Wzg+KgZjfNwvDxXb84UW2KvUxgrkuLE1FiFLsqLJ0heUNTqKfVIH1fsKX3ogqpd/IAEcoddTghTgPlQTj1qrJFsvL3rAUYjaQ0Cau3iPvqth9etP1ehqbnDN8UBOmGij9tTuY09fRpGh+nBGig8qpkLiFoD7Qc0cWZyC4L7gVdeA3E+N832G0da76o0ZehthmKAT3zqzB5HVFnLqsZjLIaHOykiKCOnjVXPUAO61dERXt8A1f7Z4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Wed, 31 Jul
 2024 22:35:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 22:35:10 +0000
Date: Wed, 31 Jul 2024 15:35:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 01/13] drm/xe/hw_engine_group: Introduce
 xe_hw_engine_group
Message-ID: <20240731223507.GG2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
 <20240731142349.4101307-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731142349.4101307-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 490bb4ce-e61e-43ca-e95a-08dcb1b10977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?r2bj63g83VIHTFUFZMxn58RNi1/VIC7kWAl9098SJ6HoCBvTUP/1cCOCw0?=
 =?iso-8859-1?Q?LYnsW+DW9cFDYW9UNjlIGokaCWymRHEFOX27WQWbdm8RyNcu1seypHNkRB?=
 =?iso-8859-1?Q?IlpfvlPDL3FaqN1SFoNgQycZnHLST3go30kCgInXWEszT9g+EVnmMk/Id4?=
 =?iso-8859-1?Q?xmBB53lTeI2fM1ohL+StcPR2BhRnhWueTSgdsv0aL44QtcEO46g8o1BPpg?=
 =?iso-8859-1?Q?Krie9GQ14dG2+HjtKXXg6Hh2Kc/KPxUH0eBaZ0d/AMgIr8UYmXiHyCaYAj?=
 =?iso-8859-1?Q?gZB0922oA53mCuDT+TSiJh6YIuaozMrIZDZrExFFYrzmurJH9jeVqtQEVG?=
 =?iso-8859-1?Q?WsdSP1EsGPSHjv4RFD3VwSnqFYvIfDRxZexoAFmkvT0ZToL+XzwDI5/53c?=
 =?iso-8859-1?Q?elAsLIZUh6IQGx1orBd7uElViqGlhgqkp5FSKzWXAE+/SpNBXTLyP1Qkwr?=
 =?iso-8859-1?Q?mPOH1daK4XsRkIZOsB/8koLCImBn3teTVn/66fwLZIjfU8US2A0qHBb6F8?=
 =?iso-8859-1?Q?qfGp/ULiVkTUKCf5e+brOVL7gqNsMvBpBtOMuFBCJMXF3OmBDLuP5Rz3Jf?=
 =?iso-8859-1?Q?IA1bQ5vXMe/4ewDUthocR6NLk2JclFnu3RAsz7bD5d3JMiC9DrnFRVd9h9?=
 =?iso-8859-1?Q?w/hfFnNgKi5ULOCYUzhkgc6MlWmDaU16xyK66JLzD3WrYsvDjDWx90TXsf?=
 =?iso-8859-1?Q?aNLCF0uS7cD7TTlTgHsaDndhZesFM0BrzVYL8OdWwfE4FXjGS7PyRurTIo?=
 =?iso-8859-1?Q?owooQcMZhHs5T8tw2PXEbtwQ8ek7ZTkXTQtQY6Xk3PTOEXlVptVv8ZPs2+?=
 =?iso-8859-1?Q?oP3mhSN++B7viIQMVj5PpiojijMEm+ZNO1BcXv2Mct+zrqnEFdsbLQHA2M?=
 =?iso-8859-1?Q?QL9yGRqlmnvSvaKiS2n9C+Iif3X9gLYF8FmXWJMfEL0jB8n0831WN7fNxI?=
 =?iso-8859-1?Q?JipZL+vSHKxo8eUCZ9P2q4/KbpYu3fOFLeETTXCFpxt5cr+AfL1QF1pvsm?=
 =?iso-8859-1?Q?hIJweMXFuIfQ91gPdN9UvJerCEvGPm0spfVz8lOMoc8DRLY6qbx4MI1N8p?=
 =?iso-8859-1?Q?FQe09PVD/CCY2WVZ/6VvtsjmszbgTX895/v6Rsc4VXvBMh4A0KIN5MSyas?=
 =?iso-8859-1?Q?CPhmjYv9eUTF2LtWBDSE7OWfrDgsCFwcFNtQATQKGWE6gSkwxJh+pyYFDG?=
 =?iso-8859-1?Q?x8fc0EdwhxJu0OhtDIZx3zQdoqcSXHh3MO4CozQ+XtWwiJc6ITaAoVg/NF?=
 =?iso-8859-1?Q?za8qOFul/4TvfAPU4HxGKgDvdkD3FQYANp15nhSnMFFfxdRKR2RHocRtfH?=
 =?iso-8859-1?Q?ynK40dhrvhpCpuQICIWjlKhGmxtULXQHcfPz4d+uEstanSTiZzMoYQdlKs?=
 =?iso-8859-1?Q?TGXhrHx+Rm32j5dVcmM8BqXOtOVIyvzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bDVXIJzFKKYwO02guqDnWC8k/jwbHLyIdQTqQUU5rGjqXQAsMvIiNEMvYV?=
 =?iso-8859-1?Q?ND1inM2r2w0y9/1LDSk8G4zDi9qgLj7w0tOB2yiytw+5nQWOeyBXq/pnPe?=
 =?iso-8859-1?Q?MXj/k/X1UnPnR0S8N5nCaUSXoPepVTLs4pWWvLrSDlTVtpkyD5zE5ChJax?=
 =?iso-8859-1?Q?glYtTdRpr2o4IfXxntbQdVRn1RHLmyvK3WduN425X2Hq22BvtI+041kDjl?=
 =?iso-8859-1?Q?Pri8ElokM952nvrbMDHG00UNeN4U4p6HwxzgokRlYW10cZBdIepxOnrlJI?=
 =?iso-8859-1?Q?YfEiJX0i6cB75HgJivENVQX54QYCQuwLyrLFhnS8t18FHVw4J1WntspPNu?=
 =?iso-8859-1?Q?KyefqA/Pg0IkkxIDFNvM+qrpNvCx3ShuLEbMtF+Dxa+uXSZknHvLZBjK19?=
 =?iso-8859-1?Q?kobSjK/yJIxsx6FfNwccYpqXldzLvAPG+NjT4WQpc27aTNKV+CPfWsFkrP?=
 =?iso-8859-1?Q?MCVVG4Mq75MGDiUKUkJ9Lu+/xhM2dD/Nn7uK95TS4w0OHfDv/6mLYc2Oka?=
 =?iso-8859-1?Q?a6s5rLHg4j+o6HpYoXHy5B9zqzlwyJQLXPjrRnpi91CdCyR7fk++px4YF+?=
 =?iso-8859-1?Q?6wUzPAw4kLM8Vvkq+Y2HQRafCxL99hqF+PDbxH3SLQSa1QXDNTlsZUx3NE?=
 =?iso-8859-1?Q?+/VfKU+z9jYwOwZtjEHMKRVCd8HAqevh4dkkSFfHAlZLWYdODkj+rn1u4k?=
 =?iso-8859-1?Q?ZtqiROC3aQz7ca4NZPUvFea795hWzBC9BnyTe81aaRog/hu+zVSnfv/vZw?=
 =?iso-8859-1?Q?XE1Kf0ZfJLUPWOu+JohOtSRhZnU3uM+2xd2E84HApKDb8p1xJIi19RPRzp?=
 =?iso-8859-1?Q?eSIxdyYNv+tkB+4kSk1vz6PSdwAds5gxsGyCeFPVelWuN0aM6zkinvMVpr?=
 =?iso-8859-1?Q?Z3hv0KIbeyggLqvclAxusCvYesrpPXauis4OOWU7Cg0nHlsQC4B2jhFP2e?=
 =?iso-8859-1?Q?qpogZWi/61iVrKF8gGIo9L1RbAXiFeZsFy4xNVy/YV391BRYoEUbopJkaN?=
 =?iso-8859-1?Q?uMz8EN4iO++TrnzJuzAhDzY93iMVGbaTbpuFuy/xe8U+9ohoT+t5/Nu9fD?=
 =?iso-8859-1?Q?JLEhcOUPAp42xnH59CGwwa2pYifoVIhvJ2E/025o1BpooXuThC5BazAOs4?=
 =?iso-8859-1?Q?fBe4ThrALS447O1Ao1PYO/cZSzKa/NyhC5a2qbkszr7WTVghQhD7yqjAT7?=
 =?iso-8859-1?Q?3C8/LAqsBN0FmLob7jGVJCePbhn5n5nG4aQmgeR564BHlCce/ZL1v308DL?=
 =?iso-8859-1?Q?cZ2gs/o4besFIDjcDRxjfRSPUXyXxS6FphwgL6FHw4FemwU30ESxAT9C+X?=
 =?iso-8859-1?Q?PmJRi0djlpCkTMIvYlRbBzFS2NQ2O7xk0NPQd9tqDlYyHKVebyUqiXHL45?=
 =?iso-8859-1?Q?YJm2MCXijtTLkmbHUahr5rMz/IgZZs8NKh8Ixdba6SX6lifDlWT8r6XNKX?=
 =?iso-8859-1?Q?ZPIuVNLDr4hMF89lMfsytn42j8Ke3D96JovC/O7WClsEDK1O5g0PzM1IKq?=
 =?iso-8859-1?Q?xVuHa3ZpjwPqGorhqENC4YmJmwg8CWAF6eg5x0Wd+xKQs/ZQZqqAu/1fzy?=
 =?iso-8859-1?Q?Fy0CFfZ9wnzvmTZ0vQPjMlQMnGomfkFMR3ro2HvLKtlrNFAUyiN3E3IjqH?=
 =?iso-8859-1?Q?Zg+NNQ5qtTZFmxwh+IE/SctiV2zMqqTLNLUWdpo4v7fIZKoKJOVIBYDA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490bb4ce-e61e-43ca-e95a-08dcb1b10977
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 22:35:10.7367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AffFRtbVWKeSgoxRw/eS1SF135vO5X6WXCHnyqvKwZRE1VLsKPP+8Er47Ttnp/dgCM7FDo+7tjeoGudW6eROzZRQtf0+tcue0p/ZzST5aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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

On Wed, Jul 31, 2024 at 04:21:35PM +0200, Francois Dugast wrote:
> A xe_hw_engine_group is a group of hw engines. Two hw engines belong to
> the same xe_hw_engine_group if one hw engine cannot make progress while
> the other is stuck on a page fault.
> 
> Typically, hw engines of the same group share some resources such as EUs.
> This depends on the hardware configuration of the platforms.

How do we determine what the shared resources are for a given platform?
Are there bspec references that we should be checking to figure out what
does/doesn't need to be grouped on a given platform?

The EUs shared by the RCS+CCS engines are the obvious ones, but is it
really true that BCS engines can't make progress while another engine of
the same type is faulting?  Wouldn't that be a huge problem (since a
fault on one BCS engine usually requires that we utilize a different BCS
engine for the migration operations to resolve the fault)?  Or am I not
understanding what the groupings represent?

For VCS/VECS, is the shared resource we're concerned about the SFC?  If
so, then I'd expect there to be a separate group per SCMI / media slice
since each one has its own dedicated SFC (and sometimes some of the
engines aren't even tied to the SFC at all).  Throwing all the media
engines across all the SCMI's into a single group seems like it would be
overkill unless there's some other resource that we're concerned about,
so it would be good to have some more details in the commit message here.


Matt

> 
> v2: Move to own files, improve error handling (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c             |  4 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 99 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h       | 16 +++
>  drivers/gpu/drm/xe/xe_hw_engine_group_types.h | 48 +++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +
>  6 files changed, 170 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b67ace7ed204 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -69,6 +69,7 @@ xe-y += xe_bb.o \
>  	xe_heci_gsc.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
> +	xe_hw_engine_group.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
>  	xe_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 00ace5fcc284..f62992d0497a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -764,6 +765,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  	}
>  
>  	hw_engine_setup_logical_mapping(gt);
> +	err = xe_hw_engine_setup_groups(gt);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> new file mode 100644
> index 000000000000..7fd10f0780ea
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_hw_engine_group.h"
> +
> +static void
> +hw_engine_group_free(struct drm_device *drm, void *arg)
> +{
> +	struct xe_hw_engine_group *group = arg;
> +
> +	kfree(group);
> +}
> +
> +static struct xe_hw_engine_group *
> +hw_engine_group_alloc(struct xe_device *xe)
> +{
> +	struct xe_hw_engine_group *group;
> +	int err;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init_rwsem(&group->mode_sem);
> +	INIT_LIST_HEAD(&group->exec_queue_list);
> +
> +	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return group;
> +}
> +
> +/**
> + * xe_hw_engine_setup_groups() - Setup the hw engine groups for the gt
> + * @gt: The gt for which groups are setup
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_hw_engine_setup_groups(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	group_rcs_ccs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_rcs_ccs)) {
> +		err = PTR_ERR(group_rcs_ccs);
> +		goto err_group_rcs_ccs;
> +	}
> +
> +	group_bcs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_bcs)) {
> +		err = PTR_ERR(group_bcs);
> +		goto err_group_bcs;
> +	}
> +
> +	group_vcs_vecs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_vcs_vecs)) {
> +		err = PTR_ERR(group_vcs_vecs);
> +		goto err_group_vcs_vecs;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_COPY:
> +			hwe->hw_engine_group = group_bcs;
> +			break;
> +		case XE_ENGINE_CLASS_RENDER:
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			hwe->hw_engine_group = group_rcs_ccs;
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			hwe->hw_engine_group = group_vcs_vecs;
> +			break;
> +		default:
> +		}
> +	}
> +
> +	return 0;
> +
> +err_group_vcs_vecs:
> +	kfree(group_vcs_vecs);
> +err_group_bcs:
> +	kfree(group_bcs);
> +err_group_rcs_ccs:
> +	kfree(group_rcs_ccs);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> new file mode 100644
> index 000000000000..c2648f87f7ef
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_HW_ENGINE_GROUP_H_
> +#define _XE_HW_ENGINE_GROUP_H_
> +
> +#include "xe_hw_engine_group_types.h"
> +
> +struct drm_device;
> +struct xe_gt;
> +
> +int xe_hw_engine_setup_groups(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> new file mode 100644
> index 000000000000..b828d85d24cb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_HW_ENGINE_GROUP_TYPES_H_
> +#define _XE_HW_ENGINE_GROUP_TYPES_H_
> +
> +#include "xe_force_wake_types.h"
> +#include "xe_lrc_types.h"
> +#include "xe_reg_sr_types.h"
> +
> +/**
> + * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
> + * engine group
> + */
> +enum xe_hw_engine_group_execution_mode {
> +	EXEC_MODE_LR,
> +	EXEC_MODE_DMA_FENCE,
> +};
> +
> +/**
> + * struct xe_hw_engine_group - Hardware engine group
> + *
> + * hw engines belong to the same group if they share hardware resources in a way
> + * that prevents them from making progress when one is stuck on a page fault.
> + */
> +struct xe_hw_engine_group {
> +	/**
> +	 * @exec_queue_list: list of exec queues attached to this
> +	 * xe_hw_engine_group
> +	 */
> +	struct list_head exec_queue_list;
> +	/** @resume_work: worker to resume faulting LR exec queues */
> +	struct work_struct resume_work;
> +	/** @resume_wq: workqueue to resume faulting LR exec queues */
> +	struct workqueue_struct *resume_wq;
> +	/**
> +	 * @mode_sem: used to protect this group's hardware resources and ensure
> +	 * mutual exclusion between execution only in faulting LR mode and
> +	 * execution only in DMA_FENCE mode
> +	 */
> +	struct rw_semaphore mode_sem;
> +	/** @cur_mode: current execution mode of this hw engine group */
> +	enum xe_hw_engine_group_execution_mode cur_mode;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 70e6434f150d..39f24012d0f4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -150,6 +150,8 @@ struct xe_hw_engine {
>  	struct xe_hw_engine_class_intf *eclass;
>  	/** @oa_unit: oa unit for this hw engine */
>  	struct xe_oa_unit *oa_unit;
> +	/** @hw_engine_group: the group of hw engines this one belongs to */
> +	struct xe_hw_engine_group *hw_engine_group;
>  };
>  
>  /**
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
