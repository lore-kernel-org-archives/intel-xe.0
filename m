Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40BD12669
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD9310E6B4;
	Tue,  2 Dec 2025 18:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLiUVMrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2039610E6B8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764700968; x=1796236968;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tC3Ja0epCa5gRcmwGO+ZCGPYBs2KNa2sacyhvEVrQAQ=;
 b=CLiUVMrvAymRSr8IhLpFEeP/fc4nZIsTP3yGI+XJrJoCdUMrtRkGKPG7
 QBQfQpmXjsTD6F/dolhaMHWWBtifQfSZ1UwLstDy88WQSLU4ajK7pQAwU
 KWA4sre60v1zC9+0AXvheATax1lVWmurawPPLPIVJ4wtaozEVh4fU26cI
 5+Zt4ubPmMzp2F8QTXfAwYCH/jZxfi2zxkiE7jxvBtkvobQrNGaPV1V5g
 LMyK0fhoc0do0cmrFA2lenBAIUWbRc/uJ6j/2bHWrpQyj7ZV3D8kL077R
 eoXLFqeLlXCWiNLfFtRoCom4hRVyShZlsEyxs7b0fUl+46PwSOMulkZsQ g==;
X-CSE-ConnectionGUID: MZQBQhWKSqqksIue+Jcu2Q==
X-CSE-MsgGUID: +HD1MgBjTVKpajozAlPRdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65870435"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65870435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:42:48 -0800
X-CSE-ConnectionGUID: uLzmbo3HQWG/W/c4OYS8TQ==
X-CSE-MsgGUID: c50mHBhUSqiUdosW/0TS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199402853"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:42:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:42:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:42:47 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:42:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXERwQITT/BI23aC26coc0fQaxI79dkOvQDY15fSnVgyqIlu8G2+12OC3x7dFTUBawQ7+Y6UkKdt7H5aDVsVaZbmkuWFhct0GTDPSm3Q5M3E2vM/2kqmXakTLKj5Nct74uq1OCtzgNOVw+87QxZ0qOZkoQEP3rxYSitUx4Xo3diB542mk6v/mSdYXd3AcB8A+P00vsAt+31ySt57h2QGPUd4fGqEaYc5FV5GGox0IrX0kE6URPzwJNchSKSL4PQSwF9y5CCiNab7RAhgBfQyML9p8k6TKuP31AlGZaDtGwYjRJ8bdqSiz3x2Dco2bEbM6fmaVXfzQeeDM0iF6koCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rgi28BqgI3RjxSh3GvwrPKpxBwodxlfkSvDn/mi6oE=;
 b=T2V+aol8fxS9+0hv8Wgo6HmkKTBXL4YPoXbVcpBusXUjdYeERtsA4e9RkkCXeDBaeGfBtRsrWzpXtiO+YIg8s92x0O9B2QD0qK/9Cbt7hKp1/Z9il+ESZy2FDyB+Q1zXt9fnUMk80Xqe2+PtRmqNEWzCxoXiIb0aR2hdI3qy950QQqavn1i/QaoJGfjkwQxL7plbvgjG4SCvrV3BIJASBdLYBKqdZbVIDjW2T34gTMU38WqC1vt2GuPgsZbIP6duhdfvarBg5kSAWKcthp6npmKunRIlu7GkbTIM631k82AyyC6PuSRfJeRN9L2jLlu5iMEKtEoIdC6W5FLSTEFn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:42:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:42:45 +0000
Date: Tue, 2 Dec 2025 10:42:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Message-ID: <aS8zH+PBu9yDmRc0@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-6-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-6-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:303:8f::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cceb2df-3375-48c1-a1d3-08de31d2937a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rXL/l04yfmaYoCXVyHB/H4iCOKGQWM0B2SqzFClUPv++X37g/2Or6PvsfT?=
 =?iso-8859-1?Q?arsAVU8jve+1SnNfBfPac9kzuFbfJZWWrJC4BiRDSZu4ri2S90cVVcQhGe?=
 =?iso-8859-1?Q?IrJ/A0v30BMoRKm55PGoF3k3s8fV16emttg80JzUiX8BK0T23cd1hqAlss?=
 =?iso-8859-1?Q?euZuqPa231z3NZeBlPep6Y3s+smGWpNSn20j+580mhrXnm9JFK8QGm+wAK?=
 =?iso-8859-1?Q?/0GlFQ546myoU5STuqiTjOZc4TjcC5onnn2NOJhYuncOrJ5wXDKCx5AcHb?=
 =?iso-8859-1?Q?AUaFWQUQHXoXLpuEEO1FhSErwXKA3lW9N8lChM2Ud6VEGnXTmQeQko1jjl?=
 =?iso-8859-1?Q?BIWEdFmWlsow2UUwHtJi4C62DkiVCMZelLWLM+OKKa6ReJ/LQzkS/MxMF9?=
 =?iso-8859-1?Q?3tZs5sAS7TxxiqPQU22wSAH67AwYYgUUcec/6Bq3T1SmaDinu95ry0iIRb?=
 =?iso-8859-1?Q?npYFCEYy2h42IETkaOSlp6K1ElBfmM/uA4km94rUbd0j00zgC0Sr6PT0Er?=
 =?iso-8859-1?Q?CuRkzSehNsKxBKaC/Rv9dewokWnbDsw7sNHHJr149lCuPOTIkZeGEUrOds?=
 =?iso-8859-1?Q?ou+VZ/Ny6K3JZL5kljK00gGclAV89+ZN0P5iLJ2uqtONge20SBjMy9EVUb?=
 =?iso-8859-1?Q?U1WA4dHRNE7TU9CGJgtFPIIMjz/qVWw1GLICablrs+PN2jVUSiotbLPhOs?=
 =?iso-8859-1?Q?3w0nMSpqyl1gS3qatFTPs2O0PK/ksTs9VuR8Rjg/wkeinr7lVjNV0qjar9?=
 =?iso-8859-1?Q?h24th6Y/ZrcubLP1+cbq6/VbJjI79M1Gp/NmMybn3JZKH/exfjaEF7QMZX?=
 =?iso-8859-1?Q?v+dRG4E5eKl6tJPVh8DLVmywGTSaxGhBal/5e+CBqrdeTQ3jBMVrSVRZvk?=
 =?iso-8859-1?Q?qlgs7+D+nZ6oHEq5/3euUSqrO7iHeQvULnQqkCt90lewQmbBhFmZeweUZ3?=
 =?iso-8859-1?Q?D5TBWtiY2yT23mfiNE2rOwX9hsmjQEIDIFJv6e9mBw5ma+kUrwqmelf6oq?=
 =?iso-8859-1?Q?jOZYJMDJTF8lFpJzWdoOp0vWpCdae5ZQqCd6BuRvpgSw37sPEUQEQYdAJ+?=
 =?iso-8859-1?Q?cdvScp0EBqWnZwNGZWA+c+2wJNr2dlvevN1znmQWeKcOVdSV3mJlKJBLo6?=
 =?iso-8859-1?Q?IEM1RN37/ux0jy9RBpZ+n2+aRBoYUcAXS4kK/PSeyLrMFy+t/U5dSzmJ54?=
 =?iso-8859-1?Q?oeMlgblOhSrcUCHD3nQUCsehLtoXP/vBPnQLDuxoQAMuz1DdFdzSlbqKoG?=
 =?iso-8859-1?Q?SUeb9UMUimxoIhSEiHkpwvaeuicHa4s4eJx83RykBwJyI2FGQbbugfdj7/?=
 =?iso-8859-1?Q?Nlsq9+PlGfCD/Ag7Gk/+F5Um7dEIBbsC4Q3qvGEFeiemfXOSEmjksFuKIP?=
 =?iso-8859-1?Q?hy9RPY6wmHhg/ZiAU/ZIBQHyPSwe2IkzJw6Ra+RsJ2p1fpLxS2V6fojXnk?=
 =?iso-8859-1?Q?zzti3mhMtk7BLZdOWzeTdJN2mpgtuYpIIgckhVUVvMBXD5ECY5XpetI5KA?=
 =?iso-8859-1?Q?EDFMw4ueX9tdJwow2WwCA8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hDOsOf9tyM5UkBPF36VBLxPhbUkyhaV/no9C80lmgUtQJIXKM3b+/e0fER?=
 =?iso-8859-1?Q?D+LAIHUZa/vg+U58JgSTJ7w+l7p9qjirUATXMWNJTU7ES3htm1EBL16bZM?=
 =?iso-8859-1?Q?zdtSgfJ1M0VE7GH0OAC8rUPNU4kirCg70P0zVlVndC/sQa/HN61G+8Icgb?=
 =?iso-8859-1?Q?wvojWxPiOeqXYgDIvYIwY5DpAYiau8jZr0Io8zXVgRcMbTDaFEP1C2IJFY?=
 =?iso-8859-1?Q?OoObcianSXv2rKNWd1DvdjY+Ds5zWeMSqGK3zK7dPSmuXPaB8RYz0/Urnp?=
 =?iso-8859-1?Q?xOqBOHIkXqqGFOsjwyPIxs8evX8NwwoZZ5y0Lb6AVCn7vvm95MckE/SnF5?=
 =?iso-8859-1?Q?Q0pQ3myFCr6indcWk4yD0tcGI+G0MTW54vhc2bTzqefv9HTbduPNrPSuUt?=
 =?iso-8859-1?Q?dr5oqJIHQVRpAHNfWHeVwQf7vQtEa7WSI1KkGP/v+OwzeWfUquduanznim?=
 =?iso-8859-1?Q?m5RYeVzLN46O3VtlAwK3aYy9d2dtUoW3inGtkJQVhxXkXG4QGwKXvNm6Al?=
 =?iso-8859-1?Q?JmkPPMP4aw6eC8nMsZRmYzbeKpmLFgUWHhjGbTVgBy5h5MCztWVss7dL/B?=
 =?iso-8859-1?Q?cFWupQCWwiJKtWMwdv8JBsEAyXOkQunaiEzapDn5RhuyCa5VpWKkx1zr/A?=
 =?iso-8859-1?Q?NW9EPcCzaSfZ1SbzP9XPqkuWx37TQS/t/B5O4F9jMRPFdIvtgSzNKdddp6?=
 =?iso-8859-1?Q?2iDnEmz56k24mTm1UFtxT++9AElmJbPyAKXBXWZV3aQp+BdXjV1vxQp94M?=
 =?iso-8859-1?Q?OcI79d4dcTCFPjYZTyswhClV6GZPlQpwqnEG1kgOTxmYk+plAF4L3vBUhE?=
 =?iso-8859-1?Q?KfB/H+NorjO/ZvXATcR6/VEIw4HOdbDjcffNFMbibJ2SKnj7yDFGayNvLw?=
 =?iso-8859-1?Q?CQ4rM84B3Xl6NreqLkz0tZceY3nlFi93df20aojQxoVxdwDxDHSZKyW2Id?=
 =?iso-8859-1?Q?b4TMss90oPeunsz+uMFIuJ+BjteQDI7vAb0ufaZ3JKVwWFxyrt4tOwNkUl?=
 =?iso-8859-1?Q?nNmtKHLLYiocFozYUpuXf6XfaZ1I3MooqT/ePA8fg9gAJveAKQOj+ZOSwM?=
 =?iso-8859-1?Q?8whllVLSvtRrvY3xycHryl5UVeBFaVmBlqbufEeH0mJHBeVr24QRHlAPmy?=
 =?iso-8859-1?Q?21VcJngtn4Z3jeGBnyhSLQ1G6EO6mgF6jIrwkj/1w9sILSKEAE48Jow3oU?=
 =?iso-8859-1?Q?Ms1MlTW0YNI19T/Rkl8DMLwBzWQbfgKg7o9gMHr1Fx3MeQfFVjNAFYDJAS?=
 =?iso-8859-1?Q?EPsUBGAZMIGeeM1j9e09vYMZol/OsiEaTjbm8SEDgoamWaVTZp7xm0AHp+?=
 =?iso-8859-1?Q?d5yF/y/5z5M4pXTOKnCioWSipXGtFgSKXlYq9xxcSuT9uRqXx16S+H9bFU?=
 =?iso-8859-1?Q?2Srior8U2s4rLE8yhdKPvCjKxsbhMbX+DBcasDodDLgmnRYRgMAEb6JiJf?=
 =?iso-8859-1?Q?bx+VVpf8KKpbcn8medawXEaHgrwuPPVuD18IUNq5jM+nNghBN5gQyouv8N?=
 =?iso-8859-1?Q?KPkwVOCidfbXeV3P9LCDZj/zCpNLpTdmL9R6dAjMEiyga9VvX5pMAK7LPr?=
 =?iso-8859-1?Q?3BY1+BLviKXGKra+fKEW/VmXWC0sK6yGE4yoLxz8CiDZiXbXM43Y08+yZ3?=
 =?iso-8859-1?Q?VE72a1NByZDiVjJHg+Nt98mELHVyQpjRL6JfKAn+6PZ7jYCUN9iXS04g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cceb2df-3375-48c1-a1d3-08de31d2937a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:42:42.2283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +118VPU0rQUtaYKWHWkMh/ghay432npDYFmwP0Ui9gBmOb8N4V8sv2WKuhkuLCA8qPshNYwzX7dtXGAN9rJBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8479
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

On Mon, Dec 01, 2025 at 11:20:15AM +0530, Arvind Yadav wrote:
> Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
> handle access to buffer objects that have been purged.
> 
> When a buffer object is in the `XE_MADV_PURGED` state, its backing
> store has been reclaimed by the kernel. If the CPU attempts to access
> this memory, it is an error that should be reported to the application.
> 
> v2:
>   - Added xe_bo_is_purged(bo) instead of atomic_read.
>   - Avoids leaks and keeps drm_dev_exit() while returning.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f0b3f7a13114..7f5bcf114ed4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1992,6 +1992,16 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  	if (!drm_dev_enter(&xe->drm, &idx))
>  		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
> +	/*
> +	 * BO content is gone. Signal the user process.
> +	 * Once purged, BO remains permanently invalid (i915 semantics).
> +	 * Application must destroy and recreate the BO.
> +	 */
> +	if (xe_bo_is_purged(bo)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out;
> +	}
> +
>  	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
>  	if (ret != VM_FAULT_RETRY)
>  		goto out;
> -- 
> 2.43.0
> 
