Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE4CEFC2A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2610E58E;
	Tue,  8 Oct 2024 16:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja4y9Ogn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DBF10E58E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728403745; x=1759939745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wqVvf7tHwSpMXG8Rxb+25E7HUOhlnjQsa5m1C9t8UXk=;
 b=Ja4y9Ogn4w6X8yYsSYx1Hi3O26RE7VfPvORV1ETp9XsfKjJutwWCHMJA
 xzcz0VzrRD1EOlBF0nZp5/G7dyo0yUKre1c9nR216y5WiggoNMNm2t5eE
 dQ8YI5hcDCovQ34CjHx2IT0ZfEKw8ybUMeGP0nTTqumMxQwZcl+NzAD7Q
 2gNEh7UzlsD65XEeb5I3sdbOPdJCvHFkzDG7bmEq7CcfaLUw8hubqv68c
 JbqlFuHRFkizs6cYy8et5gJpLwUrQ0vRBRJoKwymdh+w6zHj1c02gkGaH
 a9mkTviyVk2HWd9AMPACY5qNZLv6OAecTxogW5IcgtK1pRyO7zgNBvSL3 w==;
X-CSE-ConnectionGUID: p9HaSpA0QKKtJONoRTfGmA==
X-CSE-MsgGUID: w56w7F2uSNuSI5rRDiVGoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27705602"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27705602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:08:26 -0700
X-CSE-ConnectionGUID: 5p1VwkMqQ7634WEWa9RQtw==
X-CSE-MsgGUID: THG6faxjTBC/0tIgyPOujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75443265"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:08:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:08:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:08:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:08:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:08:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYL7vxFfgP6VLSUw2JW0a7IpCT0gINfsLxwrYHWWx3RUNZZxAPc6bQFYibdTXVapDJC1C1xT0uEoUmtYkudNZZdW7DjM2dw7WSysnlHfJLDv837Wvr75GwHmI60IHVCDyeLR4Z/ZnjeKzDbO83nhwkoBLIfKS6z2lKjfVQ6mJBGUVUlsKqkzhDzJqxA6eYHOs3ZgMLaF0UCB5ap2ZGklEowhFMx50xFn7Q+X78p2V1e4MRigcgx7SzSKg3v/VkHhxNyqauBl6Hyd5drWkn33VZEj9+jIVeHdjq0Z3lYull14C3V7UnhssY6f1DJidfcItlmstoSkZ5W/EfF8vMu45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL3dGoKbzccwTRogo91UHTr+BnZaA/8CYngVosaX/Ms=;
 b=fK9mXQLL+HBA0Zt21/Zq+gvwqGqS0hPVmWdWrnJ/w1o3/BYig4SInygF9CDOrEfYdNSlyQGmiCw2TLMdGmu+umUS9Ox8l2Zl1n1/cpnaukNGZ3LaYmS6PKVmNeaZR/TAxXnrS3JvkW/6bIbaFuKZRJD7rAjvaw1vxaOtCn2zKsLbnlVxriAupZWrS3s5VvsAu8GGj70uH/NoUTdrJ0TPKfuzeeBicmIOvpcdHn3XrqbW4yn4FoH0CaQ88MQC2Km2KCTSwXXWaj4s6eDDk6FUIzAGp1HmJ5BVx6LuVC8CClPi20MamufYkbQVlto4Bn0HW7iy/OC3AVs5uvBqh4twhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 16:08:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:08:21 +0000
Date: Tue, 8 Oct 2024 09:08:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/6 v3] Add Xe3 and Panther Lake support
Message-ID: <20241008160818.GS5725@mdroper-desk1.amr.corp.intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd6823a-7d58-4da2-eaf3-08dce7b36e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ww9+PeoWyqGTv4TYcY2Q3v4mIhtBsJJEFbqWN6E08m7MTHV6MhnbqycmOHDt?=
 =?us-ascii?Q?irbcLPJgajNjNjAi550RzFMKjyDzqiE7+1U8U1rQV5Ce5dUKPv3AEH7jO2xC?=
 =?us-ascii?Q?IFL+sWoGidjk7jqwwRr/3rR9favdOrwetqFd6gXA/tCQ5AB3aIDOv87Mc1bv?=
 =?us-ascii?Q?lbsNXEOQw9Fe3r3Erq/J1cNblqE8Pcu9GpQYUxABZewBY79aVvsWOQTzv9Gv?=
 =?us-ascii?Q?2TT3HG6vFCkBnSulWiFErTXkxjxL54gUPqsZavdzGqNP58dr8qIc5/hmBrhy?=
 =?us-ascii?Q?nOlKWz2PlEMKK3dxO4gHznP/zIzwL7hUTLXBKF1o4oKyS/xsoEXVt9SOcpq/?=
 =?us-ascii?Q?gD8kBxNWFZKXvaJiprG+9LeKg5CZlm6NBjXxGBGXyBpZhcDKhmQMRwEBlI26?=
 =?us-ascii?Q?AOhswNMbGA0UbGVFs1hYz41Mp2Cxtd9Xal8DdgQ3qvRvOM4bduDMX6UBWAfK?=
 =?us-ascii?Q?1ty4DUCAeKFjClRafRSJzXRNneor+SCvVOcYwoQIMoJXT90OjbYVtsbDOa6c?=
 =?us-ascii?Q?dDjIC9KYo9UzDMcdzblTgaBdYwd2+5UHWhd6GENvPS4CRC0TGRutWJG3ok0J?=
 =?us-ascii?Q?5TahIg6msAX7OCgvVDRH09PBVYwKXYhCNlcDyF9yANdRnnPcE3lkW/y85W6D?=
 =?us-ascii?Q?K8o4R5oTuWKV0u7LsUqqh06aGojOT13zmvk98H0JLA+IUcIAO8K7ggdOo59Q?=
 =?us-ascii?Q?Py1di60WTH9TBxCILWptVup83SFn9AeTUGeFf+LDfK/GTlO1BLngU0aLnx/I?=
 =?us-ascii?Q?hS97DvEbYwdI4sjOrp4PpGESrPGiuifLp4ePGS2b4NMR3bTmQ3J3IsZ37Ews?=
 =?us-ascii?Q?NsQFbI538eqm1KOZE88OgWd207V3U7ZLXikl98m8pwdAP/iAL1kaBCTOYeM/?=
 =?us-ascii?Q?qKd0boCxmUHO+4ZFtUiBqL8tG6by8AfxxpIDHXh9JKhuVsSDZRhstIZzPdJh?=
 =?us-ascii?Q?TkBswykOt7iJuGDo7TYEkmQvSg3YLkYXW5+aN7M9UwaQsy7FMlos0FAhZtEY?=
 =?us-ascii?Q?x1E+meWiqvrz2+sY45R85pFVcB7ThyZyaS/ckxVnIoBqLDIu2zjRX+zZmuKa?=
 =?us-ascii?Q?RacHh6IPQxd7QelFxlWrzgOJevRP5pK43I3dOnp2azYS8uCBlowx/bKMa4OK?=
 =?us-ascii?Q?/pm1AdjEImSi217XrMzd+8cRBivErc2yoD6dTkO3YV7+6j0HCU9YEyP+8jfs?=
 =?us-ascii?Q?ihD+CXxnBCRein38NgDlJUomOtNitbS/WahrohVn7AZGwdj3zECcJOv5YLGc?=
 =?us-ascii?Q?ZfiW2+eqJnJT6wusWwTwSBl0ef+XShoYbqIgZb8CJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLY/7OVkTouskPj7TROflHD5amu6AA1UHuOa4i7myOZ3kfDQZoZ2vZysB5Lk?=
 =?us-ascii?Q?/o6MqbG/bthtrCsw+JxB9J3d/mLV7XVW9VKLZesXQsmrjn8J7/tujX6vLoln?=
 =?us-ascii?Q?fJRsJwnJNNxaK+NmWcjuNRvhSmW42wYWk6nnTlTmq8Z9szPT1uNxbZTVXhF0?=
 =?us-ascii?Q?t6eOrDXaT+Et/7wpmIpkGtubDf8ulFoOVsLx9fITQ8dm02O4fjJVufEw/eoJ?=
 =?us-ascii?Q?AzzRGOECcWaaerGVr8SFkrz7DjIFqbxC41NxUh0Rdhuf9PwVQGM74m0Ca/pB?=
 =?us-ascii?Q?ooJUec+Z4eTmTtvlUjBHsu0daaZnaYMi1Hz1F8lyT4dwZHBSUdiRVX5Kclhq?=
 =?us-ascii?Q?DOhcsivfem5PZwHB9uWAVHcewJyQcNjmgk7ZrLliKR1cJcNhkdSmKwinuyTg?=
 =?us-ascii?Q?9JsNu/P64cYKv5+Q6lq5ThQJ7s8nZvb6jFBs/f7Ed416ZKOMy5o6dicUzPTT?=
 =?us-ascii?Q?vSFmqTPMq7WpnrVlaaBxiMPjZXl1TiJwzTRvCg4z2l+f2v19vjSZw7VFv6QZ?=
 =?us-ascii?Q?gKdks7WEqc4ySY/OlxXroXId3o0QXJq6Bkcyq0CjBrNfZHtBNeLXfTeKgXLx?=
 =?us-ascii?Q?Tl5PLkq38TMZR0MrU+GHbnsU7ckv5BBxlCQD07Fm0u1PxdawN+0X61KuFmEP?=
 =?us-ascii?Q?AC6mPed6ZdfleovCR9F0X/M491jbrQtKnGfuxwoeRZrYyavGRea35YhYhkUk?=
 =?us-ascii?Q?jgF5J/+NMHm1qMxbEr8ewqwMF9kOPDNqs4xwFKD7JYvg4vQF4YaEp5f9+AME?=
 =?us-ascii?Q?El//CbDc5pDr6FRPONA9m+AeZmZDyupn/8ScVvepXb3C5brSevkUQ1Wv5H/d?=
 =?us-ascii?Q?gk9K9K82UxybVIHQCZTqnE7GxcLq4/942gqaPpvdIwYZ9kJHNTlwhtoky5sv?=
 =?us-ascii?Q?GX5tWZxQ2awM5x0vALJAg21Z7K4MlZ6Z5iebQf9XJxVCrlGb86B7q5oakT+m?=
 =?us-ascii?Q?7keDHq5vwbf8merNBBo+/pnwt2mS7ipF4NjveYciLJDYQgAyT2gG84CbDQeV?=
 =?us-ascii?Q?kecJ0YkNOmxxPOniWJnnipEgzrmT1zJebPtI6Y8zZnWQDUS1jiKWJ7zsH0f6?=
 =?us-ascii?Q?BX09/fLP7ULR/DCHzP9xnCJ7alx4cM1X4olzIF1+IWiJ28/3aau15jYu/tRW?=
 =?us-ascii?Q?XVdjdS3mjqTu+d8yMhdL5TdV2Pk7iHOOiNZSMEf5RcJkI7IysWrAZ4n2cIVl?=
 =?us-ascii?Q?eESAhJl1gpcyZ2z9KT8Mqo3NGODNeoy0MlPDSPCSwtTt7RmHmPMd3+IEuSkJ?=
 =?us-ascii?Q?6LFBafsAKZbVBpGLIsY+VW/oGZG5zDrUq0NkYRDe97Is3O0jzE4zMmZJ5tbq?=
 =?us-ascii?Q?iNqrNDkiHkIw6VDIHDbGCkxVK1nljNMcfwBHEcEo05jiJH7d3mcIptz+fmeY?=
 =?us-ascii?Q?LKo25TrDyJZKbVFoFsU6WybOi5NCxUHaVjgQPuiOCiM9l5NL8iuOtQz/dMDS?=
 =?us-ascii?Q?6ukzH8Jqa0uoLB9gYr4wL8ixrIPg/VVAze5H+jmkJUOdWXOPAuPnCh3swaww?=
 =?us-ascii?Q?PEvEOrxy5nhr1BnxeLH5XfcWLjp5YVC9tMolEfQ18VG0zCxO+qx4ljtAHZ28?=
 =?us-ascii?Q?wfKYGKZF0PsZYTB9nIF4csecR+JMt8+B5/IU09D41C5Q47tadMiU1OMzFhg5?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd6823a-7d58-4da2-eaf3-08dce7b36e26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:08:21.4313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yee4VQ6Abi98wUuzXf0YwPQkWCEm++jOurotCrqhMfYU5D/myuUFWsYtK3rr9G9ebYWTwFqvjXAzOo7vqmF89pFh+zGCHQP+sH26cTyNXaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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

On Mon, Oct 07, 2024 at 06:35:03PM -0700, Matt Atwood wrote:
> Add the basic enabling for Xe3 gt and media and add the Panther Lake
> platform definition. This defines the Xe3 feature flags and initial GT
> workarounds.
> 
> Display support will follow later.
> 
> v2: Drop several patches in favor of a more lightweight approach,
> address feedback on the remainder, reorder.
> 
> v3: reuse xe2_graphics defintion, merge steering entries where
> appropriate, fix mistake in stepping for 2 workarounds.

In the future place use the -v option to git-format-patch when sending
updated revisions.  It looks like you manually added a "v3" to the cover
letter's subject here, but the rest of the patches in this series are
missing the version number.


Matt

> 
> Gustavo Sousa (1):
>   drm/xe/xe3: Add initial set of workarounds
> 
> Haridhar Kalvala (3):
>   drm/xe/xe3: Define Xe3 feature flags
>   drm/xe/ptl: PTL re-uses Xe2 MOCS table
>   drm/xe/ptl: Add PTL platform definition
> 
> Matt Roper (2):
>   drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
>   drm/xe/xe3lpm: Add new "instance0" steering table
> 
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>  drivers/gpu/drm/xe/xe_gt_mcr.c           | 17 +++++++-
>  drivers/gpu/drm/xe/xe_mocs.c             |  1 +
>  drivers/gpu/drm/xe/xe_pat.c              |  2 +-
>  drivers/gpu/drm/xe/xe_pci.c              | 16 +++++++-
>  drivers/gpu/drm/xe/xe_platform_types.h   |  1 +
>  drivers/gpu/drm/xe/xe_wa.c               | 49 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  3 +-
>  include/drm/intel/xe_pciids.h            | 11 ++++++
>  10 files changed, 99 insertions(+), 5 deletions(-)
> 
> -- 
> 2.45.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
