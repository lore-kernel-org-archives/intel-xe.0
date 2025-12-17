Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DE2D65C63
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 23:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D05410E2B4;
	Wed, 17 Dec 2025 23:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWVNkRa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEF110E2B4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 23:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766013154; x=1797549154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iW6lzkbH2c9ZKkuywRPW0tiQI1CvO2XgDB58bBBQwpE=;
 b=RWVNkRa1NNdnQWOkscnIJp24OS+pSUEiWVCp88T1rMDTLWQpLFk9+Zl4
 jgwL1nmSUtXPvMSNu+g6bPxquOU26481BYk6eG1fnGDjRL0Eg3H6GQT+T
 K0S1TDrtEoP3xD2OADrJnTJ+C8qJq0AsaKD9WAb1MrOODgDTSp+ajvvkf
 IOLz1mcKMtDWK41FDJQF1rDD4g6fHHaGqZKldkPuf1iAW+Xw3rjMemhj0
 vmgmei0PjwI+dR4hEIRCs7HK1X1aSI8fvaT77hg4ZMJA/oD4c48kDwxqT
 eASKI+bQyS0ef1C2cNQwMPgUDHP/Llo2gYXAb39F8hCUjxPXCQo3wiu44 Q==;
X-CSE-ConnectionGUID: SZaVdHGAR0SXE95uxBEyHA==
X-CSE-MsgGUID: m+H8nrfSTvWDODZWQTaPkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79332418"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79332418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 15:12:34 -0800
X-CSE-ConnectionGUID: Q+2EcQgwT5ivef6tnMYnQQ==
X-CSE-MsgGUID: k9ZYxhf8SA6rtUNQ47MMbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="199242400"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 15:12:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 15:12:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 15:12:33 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 15:12:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaJOidbOqazoEuy5wGs7SE2hUOBwMH5D/gsUmRl+74qjHSK1zFUeiS/1CDm7+EQ0oebTDTh0VaYKjqXAyYYgmG36h7BwLwv17bTg6ZuvNzRvIpiUFHLOd+L5NrVXV4FsGBCO0fESO1E9p3y+ezv9RejZ8N8cJxKcoiSxtb6uhFE7CBSXh9kEd33gPQyz/YfOFvHA17xs/lrEVTBNx1wsfkFwpRclO4ZCJY00RwwfGE3MsWNUio9oUcCBL1ck2U3a2h0FugEsLqxhN98Y6/W3R1C1/KftITih5unmd7/QaL4R4cZDODFx3dXke6v227fxbA3QSmDzYd/x5JpxO+sU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rQbNX5fxgHGw+2J5vIepJoURtrBNdpid6FQ75+WyUk=;
 b=bmvMba5nx05rBKKaTJerp/bVhvkLmxddZ12x1hq3T0zwu1W4qLlEBKj8R+1yL35VMHZ8jZuHHoe0Agtfyoh+ngn4A7Kkt6BvSpJt24n/xmeUqeq7njUTxrbAzjLVqcT1ymBPIqdUVX6i7SyzWQjo02TinDnbEdL8GeEg1Kia49tbffu3Wfl/NTcpHMHcio48316VipVxxb1LUKrS91LW2VXJlaRiSvxpgxclNggEf4cSIH2gyDdOoStdmZSBq7NW8t9YP1x5Oa0vfj5l3g5Id90eRMOmetOJZXr5P8jys2uwfTcWBzC0uwDM7fp38V7Fcr44l+m+i+4m695qqzWmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 23:12:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 23:12:31 +0000
Date: Wed, 17 Dec 2025 15:12:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Message-ID: <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b42f241-b257-45c8-5cee-08de3dc1c14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+4Jo4f+zcmpNgjLAn+dDAPROq/rib0uWV07h3u5Ao+iFVWAkdGZ8h5IUl9vw?=
 =?us-ascii?Q?EsQmstCg9t8gmtNlKhhrjL9wUl41lAP/mpDfvrMJNmA24MyC5H4f2e9kUnRC?=
 =?us-ascii?Q?0RHSNBtexOJjBnQI6ZL2Tj9LKQaLzNCbp4yqnaD/8YzTHiVJMXRWO4KlKSCi?=
 =?us-ascii?Q?XHcDPII7ZVOPFateph+2LZBsXeamvUizkO7xLWRLn87JHZq9L6cAevhvJZ2c?=
 =?us-ascii?Q?wxwz4e+jp2XMBXZbXVdowD8QxKZL5gydCfYqOr047cJRF03FFFYiLHcTjauJ?=
 =?us-ascii?Q?DDMykzZCD+n8CFUMqwx6wj/RVdZ0WtuHH1hN38X5qVOYwrmCd6RmMxjq+QXC?=
 =?us-ascii?Q?c0RLTUzfBZr1pCZA4rD1DHWOQYQhmMb3PeOIcTThA4q/ttj8ymQXNjdgdDZg?=
 =?us-ascii?Q?qe8/ODjzR/NVAlC/IVZgaXDIjcoI19Wi5oDYHnbL6JYFOgdl6PHmx7aDweqn?=
 =?us-ascii?Q?rysNY8d4O3s/ynCJCIAx5p0ykT1vJTuytLwkwof0HXWyMEoHnM0W7zrvTpww?=
 =?us-ascii?Q?j8KuqNKL57pZFZ1WljdxiW2wDdGRcWAczGA0bFBnqmmnnWFVEzeyc7tEnb5l?=
 =?us-ascii?Q?qwrcrJedaP6eVXy56Odwk5Pd1TuVpup2Be7M8rVtmUrBViGB02JF+nFDNVlT?=
 =?us-ascii?Q?HbkXV92nu+k/sAIAbLU+yZTQbtB2ps1Q/EMRbE22XWtucsA0RRs1FBYSYnKt?=
 =?us-ascii?Q?SNnJgw/FMWSOxpRXtG6JxHGNF2SXvMWtzNY2J6MriM0UHIFtxrvmdEgx325Z?=
 =?us-ascii?Q?D0xbLaHXldm/mkLVz2O2ApH10QlMmmxB3fn+kMY/0lK2PFIZuEIO9jn4BA9K?=
 =?us-ascii?Q?hp5o2PAiUl+nSvpU6M/cBcpy+rzmR3BxpJdY42Z2TLhv39WsEaK5eCvm2908?=
 =?us-ascii?Q?5SinfYdDtv47u6Jvt5SBVYe68PTicwg1Uhy7HgS2LTO2Zb3/Gz357UDUGXmU?=
 =?us-ascii?Q?Tkmqu03zlisctR2SycJGkNh63MjHNtpGGpHzzkUP552YvkHDtxKrcl5D+fdd?=
 =?us-ascii?Q?SNz7oYN9/N4Xp3IQhqqs0aRA7RJpif3Di7gomMtvwzoJig/0JqNzOyn1Q6ti?=
 =?us-ascii?Q?u5LPhHoU2xS9eOJ0lx9CR288MgcfJN1HIiVhFs1bzg7riVtXXsoeBK4T23qP?=
 =?us-ascii?Q?EhXDLxrjMKS2boo+c76HTeOIpHqpg64ns7VsaTft8zyyoxO361WQTTA9IvUa?=
 =?us-ascii?Q?5fw7LWyRki1XHiRKcxFgm0Ui3wmc8Kj/IOlv6qTJz3aWlT8d3NRrxfx+PhDn?=
 =?us-ascii?Q?RXEeQdf2Te17l3fxMFEQYRCKby0Usf/ubPN6kpP44CHrFj1ir4aUSNwgu/vg?=
 =?us-ascii?Q?QDUCzCeXm4LqRy4XU+l/KzZb9/sFyfSCoHVSxy1OlkXaGIsBmgXKBsL1ELX8?=
 =?us-ascii?Q?7YApQqXGx6lPK9LqKmxpUFt+G1JY8m5q+bzGS4jggqYgivTqrcDYjkLjKm6h?=
 =?us-ascii?Q?0/NnJ4eBiop7aMsUQ4TtBlTmfljxVfEi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dhvny9Zzde1rhxJOwRQwN6sYhgNKh1eF/qzo3GMml7rIg5LoNLMqsT0E66MS?=
 =?us-ascii?Q?ivsIUXZdMzv/3E+jwEtTpNfBne55pl+GjDf6whjrSq38yFdaWolxHKeWuKUK?=
 =?us-ascii?Q?YQm6oOtR7O/l6EW/OL7RQZ6nrYuPMm1gEnlMeGszwcul2nRWQgOJUtkRpv3g?=
 =?us-ascii?Q?nbsf1dHNiydlx/3bw+rkyWBJwKxfeXn8jOUSnvjf2lQRJrT+bWeQmwGWaL4A?=
 =?us-ascii?Q?XlbEM3iBJTY6C3PPJoB33wWcSHGAQ7gc6w5uuyxPM1Qn51NVZdMgSRLxzKpc?=
 =?us-ascii?Q?k5Sy9dIgYfSCizfUuubCOVSbndYw+KMimubs6QbQqZyU2ttu9+I2A2Ike7Pr?=
 =?us-ascii?Q?xm+nBHWCpUrOd8cj2lpYlW3rwIjtGum0BFA808/SGGa2gMjXEPo0wsVsz5Gi?=
 =?us-ascii?Q?wUJFug6EkYNfBSKBrtfsLuBx+tEzi8dJlThV/OJRFkQO9FEH06JCWwwO4nNn?=
 =?us-ascii?Q?aX5jzRNN/mA+DcyJYDScm9q5lBuW2Y0AGHLx0zEqK8EHYNtGRixsTNQpzKnX?=
 =?us-ascii?Q?xi5yQztRSoKBN592Iw0QE/cqWic63Nwdq+EvAOjE6CGYHr1l4lx6NWPMBA9V?=
 =?us-ascii?Q?h0U3Z3/wcOOibdqpSvsqlz8GPycCetxK473L+EToEKUfwCCaUETdgM98Rv3a?=
 =?us-ascii?Q?Dv/VkK7xRDaqy/nSJBbh2lgShCkFUaXbQp+m63JDhTiYSXj6WFhiG/N6lI6D?=
 =?us-ascii?Q?VbPQiO+huoULtALqHvsWW1sEau/hO7Ly9zmLgTast61OF/7LogFM5tCETIuv?=
 =?us-ascii?Q?eJlTAe4CcZfmV9wJ5UmxUMYt2WsRhLeE1BI5Bc+pf+xfqUym9BasOLFhxuVu?=
 =?us-ascii?Q?M9d4AQWJGEJu9hE+4mZLWtTRXMc6Zy9OcBUMwjZL8QsIQ0ZqE69mX9gVEomq?=
 =?us-ascii?Q?YJPCLoW9d010gRMBhrrVCRdKHu+jAKX3AGf9kJxx3ZdeMap8Zx5474uZoOna?=
 =?us-ascii?Q?X+DF2uR4CMIIhB9UoS0AEFB5Rj6Rp9JktnhzNsNkBceMoVJICEiHNbwyfhgG?=
 =?us-ascii?Q?+mU2NxiVrM0+PdZrsef7S4eW1sOijkBue94fBM0BsuDngxbDmOeGs9m7RKpH?=
 =?us-ascii?Q?P9ErQVvDxDgagOW2wERbIDBEXFHH0//oMyaddkqsr6s8fD5chZ4/0LI1pDiQ?=
 =?us-ascii?Q?+4pP5jOE6tEfpmWuSMQw2tsOEdBFRD3c8opGvXYAbex92mOpMmj/RBynD/+D?=
 =?us-ascii?Q?kyYlLX/6gBAJoxqLYFBAfV2O0tWu/qv40n0oNI1o+GQFjVAzkjGVagqDQHho?=
 =?us-ascii?Q?u9IpMI1uJ552qpC/PyEiDVxUcArdIpB20YwB4tpjqDaBKlP0qviJvb/skyq7?=
 =?us-ascii?Q?5lGGWbPePg0eoOYc0JAiEyWTuIK3Tg0ijyMlwlTJ/D5jmdoMTM1pSuUQhwN1?=
 =?us-ascii?Q?+UGNzKlErwj5iyUfNuiiBbfSyhZBi2sDk4azWMgiGk40X7o8gzJ9ARr0gG74?=
 =?us-ascii?Q?m5z57a1WP22P8ZXFDP1d1OcaWbGij2JEz4HT7LIwOWkC1eZg6Fm8ZHE/1ocD?=
 =?us-ascii?Q?ieN/DZEHx1U2bzw4ZqgH92F8mKyqJwK+Jd76IsJqZbm/RrDTlzTJI+yBJkjM?=
 =?us-ascii?Q?WDgUisv1eI5Ke7TCTJSWTF0Ow7ztvFs3Hxlg1IVskSYymOHqJzeEKCkR2KvK?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b42f241-b257-45c8-5cee-08de3dc1c14d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:12:31.6246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQwhl0P739MYoS64xQgMwp1I7CJYFfJ7Nz8tedCUWnCWPDOnXrnn3EWERvK5aQivuJk6uF7kmOk1IOKvdVZyGdiZJgq/WrdCPDjrJDhYT3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Wed, Dec 17, 2025 at 06:21:43PM +0530, Balasubramani Vivekanandan wrote:
> Prior to lmem init check, driver is waiting for the pcode uncore_init
> status. uncore_init status will be asserted after the complete boot and
> initialization of the SoC by the pcode. uncore_init confirms that lmem
> init and mmio unblock has been already completed.
> It makes no sense to check for lmem init after the pcode uncore_init
> check. So it can be removed.

While I think this should be fine on our current platforms, one thing
that worries me is that we'll bypass xe_pcode_ready() if we ever have a
device that sets skip_pcode in xe_pci.c.  No such device exists today,
but if one shows up in the future it may not be obvious when enabling
the platform that we'd need to add back the GU_CNTL check (or something
equivalent).

A couple thoughts:

 - Maybe we should have an initial patch that drops 'skip_pcode' from
   xe_device_desc since it's not being used today.  If it becomes
   necessary in the future, then we can easily re-add it, and the
   process of doing so may help remind us that we also need to do other
   checks to make sure the device/lmem is fully initialized and ready to
   use.

 - Maybe we should replace wait_for_lmem_ready() with an
   "assert_lmem_ready()" function that will just do a quick sanity check
   on debug builds.

        static void assert_lmem_ready(struct xe_device *xe) {
                if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
                        return;

                xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT);
        }

   That eliminates all the looping/polling logic, but still helps make
   sure we don't miss anything if we ever need to skip the pcode step on
   a future platform (or if the init flows change and our ordering
   assumptions are no longer true).  And since it's an xe_assert() it's
   only active on debug/CI builds and will be compiled out on release
   builds.


Matt

> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 67 +++-------------------------------
>  1 file changed, 5 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..3818d0cccb0e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,7 +8,6 @@
>  #include <linux/aperture.h>
>  #include <linux/delay.h>
>  #include <linux/fault-inject.h>
> -#include <linux/iopoll.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -630,63 +629,6 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> -static int lmem_initializing(struct xe_device *xe)
> -{
> -	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
> -		return 0;
> -
> -	if (signal_pending(current))
> -		return -EINTR;
> -
> -	return 1;
> -}
> -
> -static int wait_for_lmem_ready(struct xe_device *xe)
> -{
> -	const unsigned long TIMEOUT_SEC = 60;
> -	unsigned long prev_jiffies;
> -	int initializing;
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
> -	if (!lmem_initializing(xe))
> -		return 0;
> -
> -	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> -	prev_jiffies = jiffies;
> -
> -	/*
> -	 * The boot firmware initializes local memory and
> -	 * assesses its health. If memory training fails,
> -	 * the punit will have been instructed to keep the GT powered
> -	 * down.we won't be able to communicate with it
> -	 *
> -	 * If the status check is done before punit updates the register,
> -	 * it can lead to the system being unusable.
> -	 * use a timeout and defer the probe to prevent this.
> -	 */
> -	poll_timeout_us(initializing = lmem_initializing(xe),
> -			initializing <= 0,
> -			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
> -	if (initializing < 0)
> -		return initializing;
> -
> -	if (initializing) {
> -		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
> -		return -EPROBE_DEFER;
> -	}
> -
> -	drm_dbg(&xe->drm, "lmem ready after %ums",
> -		jiffies_to_msecs(jiffies - prev_jiffies));
> -
> -	return 0;
> -}
> -ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> -
>  static void vf_update_device_info(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -740,6 +682,11 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> +	/*
> +	 * Check for pcode uncore_init status to confirm if the SoC
> +	 * initialization is complete. Until done, any MMIO or lmem access from
> +	 * the driver will be blocked
> +	 */
>  	err = xe_pcode_probe_early(xe);
>  	if (err || xe_survivability_mode_is_requested(xe)) {
>  		int save_err = err;
> @@ -756,10 +703,6 @@ int xe_device_probe_early(struct xe_device *xe)
>  		return save_err;
>  	}
>  
> -	err = wait_for_lmem_ready(xe);
> -	if (err)
> -		return err;
> -
>  	xe->wedged.mode = xe_modparam.wedged_mode;
>  
>  	err = xe_device_vram_alloc(xe);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
