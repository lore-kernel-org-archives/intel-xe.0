Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC53C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 20:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360BA10E7ED;
	Tue, 25 Feb 2025 20:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVuqZ1nY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9710E7DF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 20:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740515986; x=1772051986;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aZ1Dg5R3bNvHAwuMga8PiO9y3MJxamWYlMmHG/sJ3DY=;
 b=XVuqZ1nYs9oTFyZwAjJFvnJXy3p7/jNGWe/SwWciBjpaoUm07KpdwNb2
 Dl+5q4Fj/hdk3rLDxZTiCakH/gWl+ZBcaFjMRJS7pC4VLH3FSkWtdgvXU
 jpGcuL496jrtuW/vjPYy9jauKDPUOSaqYDIRyyZ3wXY0lR4c7CmYP37Xv
 AOa+ACUgTVp+D31h0jH2zDsS4w3SGiUODkzy9XcmroxcR6+6sRMGZ/Nmg
 OXbJWcwSR8rC1OQJftTgBeZzMt5z79aOI6EO3nonAN46lHLuTZayYEG9/
 fjm21QzY0QKo2pPAJcO7+KUkj2ukMCWyfY9IFbDNaGJivZFq3jVXPg7We g==;
X-CSE-ConnectionGUID: xT4ZvhMaQk2RhgLEb0SpaA==
X-CSE-MsgGUID: kkyWIBhzQT+4SCQN35sFDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58765148"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58765148"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 12:39:45 -0800
X-CSE-ConnectionGUID: ZrR7680eR0CIwrIeXsYLMw==
X-CSE-MsgGUID: O/P4tYZbQb+Qecy8OaC8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116987459"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 12:39:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 12:39:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 12:39:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 12:39:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TArSTEEdHpPDvEV8aTQZ109Pi/j30byWpSg8yT4O/RX5QDwHRoZ2wxzDRdsL/cET1VEsSYEeLb2gZ2ZaWNRKObHebtzsuPsir9mNiuM8zYGg1prPYOYrr36yIqqG5g0FsaA4W4JUDjc9JZNevlfqWqLnChwPhGIqEocCIbv97muk98T9Du3/e+b2rKwchMH7RfVKvNRF/lcHwdHqb17SCnGP5CNzV/dBswKtCvMPhoJRU02b1NZgPl0UMUfhegbYWhrKqvhFe3VtxHh36omf3ECDIABEvChXY+HV2zh7+H2Zn7+gZOFrW4sMl7MfJah7qAOf2CovDfwrjWP7HcwE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kJ9/QcJDcurkz9gpSBHXqLWijeb4icC3F9cIe0hOTg=;
 b=d9p3DdP2kPljtIFnNov/fpZzl+S95Zzd1fOKjOwZSrBlaByNi7PwVQU/840YSoCbWpMhRN6bQTm44pVe3yrOYQCCzyFr0dBZtaHZTWRS6Fi8bFh2xkGmbitMO4G6EogWIyGRQ+6lUT16wpkfnaMuuZEg2N/RX7Da4IWir8/4Y7/jzh6a1aKKar3vsdfmCilL6Y8vt1aujyZ4E3FnaSKR1TxBG9s3iBv+reFnfdyBQQQRL+5UuZMyPVDZlkZ4s8UWJ5hJqsmjZ/4yJHsmDcjlgghY2fNU2Pk3a9YMTAgeN7nwF9Yk6WgPc8yOFH7RF4cN2eeQ1umSUShLfO3105a65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 20:38:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 20:38:59 +0000
Date: Tue, 25 Feb 2025 12:40:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe: Fix fault mode invalidation with unbind
Message-ID: <Z74qpCDO8xS8A/mH@lstrano-desk.jf.intel.com>
References: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de4d2d6-99e0-4164-aaf8-08dd55dc6ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?K2QRt+MfpvDVVzNFbIwkoTYh23lHqKyy8fJLjvPfUTYEctqUqTSik3U3rY?=
 =?iso-8859-1?Q?Rv/M/FyiIayKKWiAPJbeoytR8bsQXGJyQ4HZsSJtrOTVob5cNOToX9ioCr?=
 =?iso-8859-1?Q?MMI0AiGv6sDkODFYT2rsmzBEF4m80RsccSLFkgUWuxARJxzQ5ui8JuGZVT?=
 =?iso-8859-1?Q?DOtjgotBbZwbqfEFr6J9vLW8UY83b+Rbx2XpID6GMyamqU6DWPoNTwOzGo?=
 =?iso-8859-1?Q?F896UmBaUbXefuDSpRgt2cqFArs4Osc9KXvv9/jp5bIzBv4hIFRLAKoFy3?=
 =?iso-8859-1?Q?+ZKDb7n+iZlJha6bfhKmWbsElGJwgXig8O6cX/w0/Zx404+J55Tm2ZUQus?=
 =?iso-8859-1?Q?ZBViO5Wb+t0cIErRjxAdFF3AizGyiqfvGq6qNpYnzqUuRreo4cB1oDshNr?=
 =?iso-8859-1?Q?MDOJbvb3YZypX5Zpp2i2KWV6TsPuYa0KTqlJSx1181yUg9Wndh3OWoi8Jj?=
 =?iso-8859-1?Q?r3Ldf3F0xiBKK4CO5C/MbiB+2l7KZUUh/Y41JRYzVHeQ32ItsC9CUGpvaj?=
 =?iso-8859-1?Q?eOGLuQJLEpxHtsxyw5HBjHk1YE/cudM10dhaZiN2LPBNwDbMAj10alij/5?=
 =?iso-8859-1?Q?R115lEQ98pHM6Ff9hQq/iukFeHsUTXF9yDUj1YzMtGvoD7JGRed+pugXQS?=
 =?iso-8859-1?Q?a/1jCFbWRkQYSMINA+GSs4hrNmF6QgV5xgOLGuLkh6uj8Dbf4UHS2qZ+i0?=
 =?iso-8859-1?Q?6hJuyY+38uu7UFf10Yz4egvu4xQY2e8+Ged93JjIyYWrqYL9LWqc3mm/2o?=
 =?iso-8859-1?Q?OBEdLXLaRIMgkHbFLcdaPxZpslF6ZDS57+8MCbuLqTJi6UkYLhu8joVNFG?=
 =?iso-8859-1?Q?kBPRjDxO2YkS6coe44K2Tp8XwEHXHaf6kDDeTe1xFyEViYPNZTBllv4z+X?=
 =?iso-8859-1?Q?XY3hpj4z3JWI/TuiJ7g9+4zeExqf3g8LG+MMkpeUBC8zrhR6fMOJVPWSMF?=
 =?iso-8859-1?Q?fz12U5jDrlICQ0tSBx8HIxxEdFuZQj76R/4ivcYBPCpL0AG9Z9Ce0cZuy+?=
 =?iso-8859-1?Q?i4w92s/zz0MU8NWYLc0jVEf3PIEEC2u0U+Wpcq2+61qAFLmjHgJqZ0U6BR?=
 =?iso-8859-1?Q?f6uu9geX97Ps6fLohPXZ/WWfsPH/cV7nHtdNwJK2aAEzt1KyD01w5F5QTa?=
 =?iso-8859-1?Q?e1rn0CwqQkQsjRig5qDvUNH4k5Jas5Wm+7HUn/6YGrhgNhVq17CRpw9nVP?=
 =?iso-8859-1?Q?IRZA1wtZ8A2bezQQhH7PXmlA2Eueuyggl9T5wiTzuizdKLkwheymHKUebB?=
 =?iso-8859-1?Q?FD+UuAHAc5qYP3yG2hjsqmRHZD2T8j9/MRSrhSLOy2rPpjqnYKIgL/AMKu?=
 =?iso-8859-1?Q?zP4PomvGFbJhfjTb5T/G+CZjxhZF8ZmwG3dhzZrfPq9NRcCtkI5iDCmIbS?=
 =?iso-8859-1?Q?3sXp+PeS4Ltu6tvBuSXlBzPXtC1jfBlDgSpuPpk5346U5H7ier+gDf/fuZ?=
 =?iso-8859-1?Q?r8gjChn25gRIEA4h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LuQrWUWClGZBGDGVuRkyfpwG6ZTicst6mcA+7K69JYU0NVlVk8nkVq+q00?=
 =?iso-8859-1?Q?oNquSihWurpPuOrmyAEkDCHdmxivss7KQyTarIy+Y5RMyWwYisfefsW7jH?=
 =?iso-8859-1?Q?tUuX0YATfrbSvLhMcku2Anjqre+fEO9HtB8zUfmej9BMscUZdNcPrpnqhk?=
 =?iso-8859-1?Q?x33SiHr8qCYQ8uomOe4JR5B0a2kdGMQ6X27xvfmBEvDFd0ZVllsFkVM7B1?=
 =?iso-8859-1?Q?1ZSpS1gvw/7Zkp5wVXWCZVk21yxn86d/5JVrgivmNK3I1YsSA9yLHH2ge7?=
 =?iso-8859-1?Q?GDKnpFsJlyzNJKLfEFc/jl4v5yyPYGTGY6acT3GwlGQU1V7NcrYGk8nFMo?=
 =?iso-8859-1?Q?3a7YacTEyAXl/Wrnzpzn36JPdc8ALKpDQ2o4JI+HEKIjyN00sAIQKYnprq?=
 =?iso-8859-1?Q?Ok7AByP9+fTyKzXqC2rjQN/E23UIUEJ6MlGELkj1dP65fJ7lnj54TV6jEr?=
 =?iso-8859-1?Q?cphy6mZ4TbZ4VPNqgeV4JKG4UHx4+ylmH98rqO5RaoCpn2h/VmQ1i5kbw8?=
 =?iso-8859-1?Q?FSdD71xN2t7KsLViUdMUa50MvVrH89lAwZn8y54hIf+dkjVbkjwshBIe8U?=
 =?iso-8859-1?Q?4RhtHvbojHyx/uOnV8LU8yfcMciRmtszAn1aQEgfWrDG56I9qW4eOrkkGu?=
 =?iso-8859-1?Q?6q3d0lUWe1QOzniHZNVt/s39mjKJGtOAyfzPhizKJrUBSLJUKCcSV7VcGt?=
 =?iso-8859-1?Q?aV9vNV6lNwEYaIYQ+FNaDrSdkPw3bqMwDeIAxgjbVze5JpQCFsCPIVSW5/?=
 =?iso-8859-1?Q?frLIuE4BjL+LzefZg6ZEjbSbAIK0pXNJukX7lGYqu0KvkyKP6v6Xj1S5Q/?=
 =?iso-8859-1?Q?LhuFd2gCa2JMlot7CgZFLK4Hpr4gSOkiwgfQxpRzhyk4RpscjOdJHWmo9O?=
 =?iso-8859-1?Q?jNCQ5+yCt0NuXKWAB3CSRmWew/12dCDN21MYE5HREvHrmYskA0PuiA+hJm?=
 =?iso-8859-1?Q?Q0IbixZeGVUgSl6d8UyQAHdQU+8aF6fePbcdH+5MlJSmx7Xmm1S6hcGGSY?=
 =?iso-8859-1?Q?va9O0veh8kx/nV57s3ArjqT23b5qhLZgqIRuDl+I5D0TyoFPhqP6WS7Nqm?=
 =?iso-8859-1?Q?TdDLbtRTmao4gkmQRRwJzsi4ZRFEY2YbpH6fM4eBG0MpDoiVvbhDayWBbv?=
 =?iso-8859-1?Q?nIUL4r/JWYqbc9W6t7J9dZ9a1XBkdnvWPbv0aGxFUitgzVGvtTou3d6OPd?=
 =?iso-8859-1?Q?UQW5YsZUEgAuGO2Sr3WToXqwzPcqsjgjIlRh69l8jxM7SkVF4vYCOlJBpq?=
 =?iso-8859-1?Q?IYmfDUXQonOdFo8NjgHgEj3m4MCWPStsXkLrL6BaFk/OaxJARCXxJQ9vTc?=
 =?iso-8859-1?Q?70g7hBZxfEGaLnHE2FB8FChuSiY/twk5WGW52nGTi5uAsJrV1+oIXs++tK?=
 =?iso-8859-1?Q?rgNGV/M6RGiS93fSOGq/HXmduMGzl8JCn3G1kbmkk6e2317xJDr5iVTFw0?=
 =?iso-8859-1?Q?uqRe0VdbfYIt6RUMgrdFkHC6nmEuyXJFNUxXOJKFV77Yh36VYWN8bxwbG1?=
 =?iso-8859-1?Q?nS4m7vSwwRsoANSwrTkZ1qonwovNyXQXNLDMDXGNbzX1jj5rwScMq5NzvK?=
 =?iso-8859-1?Q?nrbthLD3G1/GGswXfh4r5m5IRZNUfIybsNHiDrs0R59Q1tE2shKN6YVhms?=
 =?iso-8859-1?Q?fK3avPyay8Ui6NG+jGdTGxlZMkv+lHBUR0TkrqWRSRlFrR+xNUHf5dAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de4d2d6-99e0-4164-aaf8-08dd55dc6ebf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 20:38:59.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN+fl4u9BafWFryCaYQGc7htnBfpG1F4VTFNINXUMPOfQUw2gd2B/+VsadXASx/n6kLeKCly5stcp8m2h6E4ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
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

On Tue, Feb 25, 2025 at 02:44:26PM +0100, Thomas Hellström wrote:
> Fix fault mode invalidation racing with unbind leading to the
> PTE zapping potentially traversing an invalid page-table tree.
> Do this by holding the notifier lock across PTE zapping. This
> might transfer any contention waiting on the notifier seqlock
> read side to the notifier lock read side, but that shouldn't be
> a major problem.
> 
> At the same time get rid of the open-coded invalidation in the bind
> code by relying on the notifier even when the vma bind is not
> yet committed.
> 
> Finally let userptr invalidation injections during binding
> unconditionally return -EAGAIN.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 38 +++++++++-----------------------------
>  drivers/gpu/drm/xe/xe_vm.c | 13 +++----------
>  2 files changed, 12 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..e9f90887b30c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1213,42 +1213,22 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  		return 0;
>  
>  	uvma = to_userptr_vma(vma);
> -	notifier_seq = uvma->userptr.notifier_seq;
> +	if (xe_pt_userptr_inject_eagain(uvma))
> +		return -EAGAIN;
>  
> -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> -		return 0;
> +	notifier_seq = uvma->userptr.notifier_seq;
>  
>  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> -				     notifier_seq) &&
> -	    !xe_pt_userptr_inject_eagain(uvma))
> +				     notifier_seq))
>  		return 0;
>  
> -	if (xe_vm_in_fault_mode(vm)) {
> +	if (xe_vm_in_fault_mode(vm))
>  		return -EAGAIN;
> -	} else {
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&uvma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -
> -		if (xe_vm_in_preempt_fence_mode(vm)) {
> -			struct dma_resv_iter cursor;
> -			struct dma_fence *fence;
> -			long err;
> -
> -			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> -					    DMA_RESV_USAGE_BOOKKEEP);
> -			dma_resv_for_each_fence_unlocked(&cursor, fence)
> -				dma_fence_enable_sw_signaling(fence);
> -			dma_resv_iter_end(&cursor);
> -
> -			err = dma_resv_wait_timeout(xe_vm_resv(vm),
> -						    DMA_RESV_USAGE_BOOKKEEP,
> -						    false, MAX_SCHEDULE_TIMEOUT);
> -			XE_WARN_ON(err <= 0);
> -		}
> -	}
>  
> +	/*
> +	 * Just continue the operation since exec or rebind worker
> +	 * will take care of rebinding.
> +	 */

Ah, ok. I see what you mean here by deferring this rebind naturally to
the notifier and moving the error inject eariler. This does look better
and accomplishes the same thing. Looks good to me with an error
injection fix, along with prefetch fix.

Matt 

>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..047f17b230b2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -605,26 +605,18 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	down_write(&vm->userptr.notifier_lock);
>  	mmu_interval_set_seq(mni, cur_seq);
>  
> -	/* No need to stop gpu access if the userptr is not yet bound. */
> -	if (!userptr->initial_bind) {
> -		up_write(&vm->userptr.notifier_lock);
> -		return true;
> -	}
> -
>  	/*
>  	 * Tell exec and rebind worker they need to repin and rebind this
>  	 * userptr.
>  	 */
>  	if (!xe_vm_in_fault_mode(vm) &&
> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
> +	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_move_tail(&userptr->invalidate_link,
>  			       &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  	}
>  
> -	up_write(&vm->userptr.notifier_lock);
> -
>  	/*
>  	 * Preempt fences turn into schedule disables, pipeline these.
>  	 * Note that even in fault mode, we need to wait for binds and
> @@ -642,11 +634,12 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  				    false, MAX_SCHEDULE_TIMEOUT);
>  	XE_WARN_ON(err <= 0);
>  
> -	if (xe_vm_in_fault_mode(vm)) {
> +	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
>  		err = xe_vm_invalidate_vma(vma);
>  		XE_WARN_ON(err);
>  	}
>  
> +	up_write(&vm->userptr.notifier_lock);
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  
>  	return true;
> -- 
> 2.48.1
> 
