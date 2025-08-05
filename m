Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09ABC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 04:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4810E10A;
	Tue,  5 Aug 2025 04:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oG4jWkM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A921110E10A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754366439; x=1785902439;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+wtEhZar787yJLDJndBq5riyLtZrsVJpwW1ev66SQus=;
 b=oG4jWkM70ZWxF7An2/r5acyVMLHuE6SZCnmsdAX7h2TPwhawEAVUKG0A
 3Au73qmzCe2+XJlmVRNHRfH+P7cKaCPI18j4z4+7hmxohT7mJWw5cwgYd
 cXoAHHlRCrDZ7XQsP3FNmc/7QKjGEEcN3sR7PTdJ0sXV0YJ6va5xXbkYc
 RgWxNQrKVUI62ssuBdvo0NmGnIDpq1LyV9o1wJ+43p04du2VBR1oC81xO
 k36zEkWM/0keuyV07SjZI34e8QHS/Aji7f9lWN4QwnhZvwitYnMjmMU1A
 6QG0HbvvqG3YqvBkli1UAZCbpGM1lNtE8eH3ghz+8TNg7EqFdWebmEihq w==;
X-CSE-ConnectionGUID: lL72M5BdSyqmpWMngO9AKw==
X-CSE-MsgGUID: 5iLBvBuaRle/cZ3Mqvg6sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68016857"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="68016857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:00:38 -0700
X-CSE-ConnectionGUID: WLUtwYjMTFadj3CgUIQnWg==
X-CSE-MsgGUID: 2QYNh5sbSR695uZwGctaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168613628"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:00:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 21:00:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 21:00:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 21:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGFPBztrhUFi84EnrLPQaHtUrfFa488VBh71ucQVcGwE9qFHawzBvHY01AH9dGEDPNE2ZsX6qcoGkjlgchXMI9q9Woac8U+PFJgskesWfWUo8jKkua1K0jVMhsXfpO62lktzKhuDfmWLFNlO+MV9WmiCgKF/JIp4OGApGokyEvFOaZfptK0HV4WkGleSCRi9+gWWgazYI8pwf3qRc/kaeMCRY/2V00LaLPOhPLr3nzwUx3XA3v4Xs4p0/S3aQwX2+q7qfqyNzFrY85UH12FM0I7vhU9G7MZZWPkTGmd6uOt5PDPcrgjsuLTHiBZvnU4uRKFuZWj3VuVOjyaU477ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjUtnGDzfR6bKQkVNMcM5jjtY82JmT/lDUTVWyaOcEU=;
 b=bSENi0pwQQ289IaYWoMEymTrC4xBevRvN1RCUzxJinbTXD+L7207fWJirCotNpxTTbt4e+NyecVOf5vg60VCmghXXACGRymuiZQAT889Bsf+DjWegO3D4Zr0BCU1SH2N/uiqMh8QT374dwF/O0Lc4vkneeAPh7LKeGF+IBkhImiA8q1b2wip9AyOVdv/6LOxnpmC9S2KgY5HWrHMHBGocUYIXvPdExMwmrea5jCdN4q9YMdPqXIkA6YjtqerFuMOUBAMSnADNbKjtROlLbDeV6yb5cJJcLfrHsD15yZNRd6v+jMHoG2sQgrJ0XG0SzHwcY/ymZgJKazhv1zvxyDRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Tue, 5 Aug
 2025 04:00:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 04:00:30 +0000
Date: Mon, 4 Aug 2025 21:00:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 11/25] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aJGB1Y+zqGtlOQoa@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9fb8f4-3ef8-4c92-e0c6-08ddd3d49e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nv8pMcAVPMQuvm/Xj+7wa3AM45/bfxPV6mpXZ4ixuzzP07dNR6KTLYMaeKaH?=
 =?us-ascii?Q?Vz58qPbhomTlDGtnSY2Vjr40D5bLd2IMbaSD9bWkwUk6LS83TCMiZ+mxasBL?=
 =?us-ascii?Q?266/NYnEQ9SVxVgx385TzPLxJPbWiiVodFJQqAInWLtOX1yQw9+g1xiEcO9V?=
 =?us-ascii?Q?9p2jprAEW2wwgHZnqAQOzWeBUhR/gKDdkXvO6LbexGtNss02T0nB3nM779hK?=
 =?us-ascii?Q?ZrdIaUt9Til4e7hvnUCtZiczvp41PkT1N7mExXinh46NKoFxhBZ+pZWApWHN?=
 =?us-ascii?Q?jjI4JIdoFI4tZmgBnmah3JQ5hnQSgNiyVwRf7cfrR6C3vJY3evqhiH6OHx+Q?=
 =?us-ascii?Q?a9VP6GAuEjiuxi1V/dIpNgwXg+W5QPuDA9MBKhOKRC4cVy0IekFtJ9PfOZfW?=
 =?us-ascii?Q?tPMHNOYEksArUyoWy28VNIBSU/62N2/zh/zh3oLa+nFbfnhHFj6lUN5yXR57?=
 =?us-ascii?Q?7KaBmS9R/jQkJF98UDrSJ+wyjj5ctl6LdtD/iEZo3HbKjpDt13xQ+ImwKvB7?=
 =?us-ascii?Q?h51zgHoOCgvZ4EUsO64b8JcmW05pVtbtP2P3LTjAMsJYDZZTswL+iHH1NJj+?=
 =?us-ascii?Q?Vdr7ThgIHPJ0zCnASZb0wrelrAyzg7wE7Fi8s2mco1zAKdszjx1wIVSqqNut?=
 =?us-ascii?Q?wZPx+E6JYl4mQtY8zoLEbJpf6MBIFe9c2tQDR0CimRomf06lBbQV/AhQ+x2s?=
 =?us-ascii?Q?28tpvdGe15FNhMhvAM6EmUxSRFLADl19izxwh4OnWAVb/X8blJWeC6qSgAIz?=
 =?us-ascii?Q?y/qjaVLek40MNHfQpsjM61LKSks4ejfF2neZEJtAg5UwH/cLF0FiS0//N6+8?=
 =?us-ascii?Q?lqs/PXjxvEibA9ywSdVnWWufOkmRddvm5j0Fb8l4vMaVFVJYaFZAL7m1Pe90?=
 =?us-ascii?Q?4+3o6OPTIYtHp3SiTuwvTdkyFLhmb0DOl874q2+9g/vNmU4n2YoG6qTbrzdI?=
 =?us-ascii?Q?KLGdE6ASukDcs53nkkUFJoa0WcTYHpUWHLER0x+i60qmNxiGq8zgRHcXSFUp?=
 =?us-ascii?Q?ygPgcJMzl7AfurBk/8iD3gCdeunetQgd8FxSUwr6Xu2g6VMLjFIB9iZzxDcA?=
 =?us-ascii?Q?0w1YkXGmM7BZ+wG//ji6AGFp7nWWjCGfbg7mR9pJfMAPl4OUJW7zjORnADNs?=
 =?us-ascii?Q?Q+6AZRgYR4VTcPLZV1EL647kDzUCxBlZBSSn0XyDtxwz6W0jYJpTFQqWEYQc?=
 =?us-ascii?Q?psAaXqciRe+aqJtpQP7N1z5NZGCpIsUnPc+WNLS1Xu+oELFucqXlIJj+mYwT?=
 =?us-ascii?Q?TwhwndDF7jTnf2oOry3EFRw8MP00mEfM7UZnOAh/1P3ZNzBx42TxVmAW7uFj?=
 =?us-ascii?Q?ZheS3cM53oFCwiDU/Vdr8bQgMFZDN8BShIGRr6j2YQOVJKav4EPIQlIJ/crd?=
 =?us-ascii?Q?GTb1eHldHhmDQBukzIm504/Tt0lB4JtyN7Uq7p0ltxEIfJKQYq74H9W4DH+M?=
 =?us-ascii?Q?FaaA27mFFqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FHOOfb9Cy9swE5K6vgHS3VReV59tqd2Wsnk2jh2AtRPxsGPMDvRnUwizeQ4b?=
 =?us-ascii?Q?rcumCs5xU3cpjMlg6U58rtfaPOMEl0Ct8l/zqSk2S3bjCXcSqDy1GILeH9vC?=
 =?us-ascii?Q?0q/t6bZQLCpNSNqdnjFRR1lv8vVBAin5VgA5vYKomAYEGzDdX9V3AfhA8iui?=
 =?us-ascii?Q?qQ1uqLWoiW9E5RVOCAKjvzkXYmobsR6VELX/EhUUjpKAlN2IohcK5hykFwkp?=
 =?us-ascii?Q?hUVJ61BVaRR/qyO/ambRgwKBzARWWJ9pEYPAnalMfJP/7GjKEY8V2UtQq4EK?=
 =?us-ascii?Q?AA5KnOdUJ7oYTe3vToDw2Ay4Y+sbsvABjH6hpuRufmNrWc7idJW8zIdBgJEH?=
 =?us-ascii?Q?H/9nYyoC/x3B6eb9oPmj9rRTPt4M83HOBU6zfVc/1b5cs2rH9GA7zqhscqnb?=
 =?us-ascii?Q?KNsWUFaYKw3tjX/CrDXYBWnBGkcI5d9cmZ/3u6tcecK9yTm90+lhf7YHskRu?=
 =?us-ascii?Q?Mk0Ev+XAPUViU42Vbg5jRU+8CfR/DgDYS3SrawKnJAEU7NEEKiyLgGdkuqC2?=
 =?us-ascii?Q?/eg6HIf0vCjr7sN67K2YbCT55r1N2j2inRfuKSzuw6Mq2phHcZn/2Ua7TaSt?=
 =?us-ascii?Q?ri9U2SIGv3WayFYXZfqjZcYPojcrjFy5I+ihvE40TrWGzsEHS57DK5GqAHfW?=
 =?us-ascii?Q?b5q1GQ/IGoOzzZdiX6xSx2+o7z/eiam4YZgjZ7rMowOWSctj2gkQ94eV7yMq?=
 =?us-ascii?Q?5sEJRle3iHDnX//zk018roym70BRS4hQS4MUB1u+31+zrv13lzNapo8HbKws?=
 =?us-ascii?Q?fjFd6MKdBdc2i+CwBrr86y4gE7tLQynOd0gSnY/KhDEByn1uYUq+EIDQTOHW?=
 =?us-ascii?Q?tVPW1ufS40CRBY+TTM6O0Pvcg8FZ1naufT3m1LZDt4eMxyon+ETsTPoY25gR?=
 =?us-ascii?Q?khrR7hn3KGazfzq4Yr2i6P8Avz7TcM792ySnpTquW6igctvLiKSa+FoTD4Og?=
 =?us-ascii?Q?5EJZqFqhPyEY4xdX41chQYRl+xqfr6i0dGTUWRQl9IsmSHpklr18FWFE3HvV?=
 =?us-ascii?Q?jTfyhLHHoIxWGf/FZTyJtI7/db1U/Gwe0WgcM+df0MqvyfZK12WpAsE11Txn?=
 =?us-ascii?Q?YZe3MEko2ztf2Mtl6/4hM9QgNghcQFI6RQoX3n04IpWB55C+c1TPWon8K4TV?=
 =?us-ascii?Q?Jw3TGxl1up93NYJaNKpO+UO2jjgZYhQljErHFgxxwstQlEYkoYDiX9KigC+L?=
 =?us-ascii?Q?DD1TM30RZhZ7pIVhmeu8HHZVc5prmz1XbqV1S1cOydLNGYA0N+7ePLg8Z2D6?=
 =?us-ascii?Q?Ualu6/U2+by9nu/TH0BLf+c3AI0/sm656zVLOl/fJkj0wjORJlx9QW6zXJ4u?=
 =?us-ascii?Q?f1XvdvEcb5Sd1A0wNKl20/zmzuwqxclsfVZ5BMT9BF/OEH+4y1HrRvLlAbse?=
 =?us-ascii?Q?bqDxbqpJkdYHmaRP+FLMW3lAaO50gmXoqLhBYgTvm0v4sV5dabOZgxB2BQwZ?=
 =?us-ascii?Q?Pb/enx2YuF09KmwISpyjahZlbKgeie9UzF2vkKBLKkvuPSGvSWvlrtWx5OtU?=
 =?us-ascii?Q?OK84O/Lr0qsbr4kWg4nxfWZ9T+578VEbS1A8ybC65Y1CmdCMS5hw6SEFBtSB?=
 =?us-ascii?Q?YE9u5jhrj17XNSXF/MCm4vYAUNLD4bAktyoYYTb6wLhtv9JWDZNXQAotFCVU?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9fb8f4-3ef8-4c92-e0c6-08ddd3d49e6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 04:00:30.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUZi3DH6dlevTD2VQmAmkK2c+4UwpypCbs6Rg/yOXjjV1ZTuKOsjcwIu4J9vXIrtAS8sORmzzsth4N9LdG75vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Wed, Jul 30, 2025 at 06:30:36PM +0530, Himal Prasad Ghimiray wrote:
> In the case of the MADVISE ioctl, if the start or end addresses fall
> within a VMA and existing SVM ranges are present, remove the existing
> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> unmapping of old one.
> 
> v2 (Matthew Brost)
> - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
> - Rename the function
> 
> v3
> - Fix doc
> 
> v4
> - check if range is already in garbage collector (Matthew Brost)
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..c2a5eda504bb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -919,6 +919,41 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
> + * @vm: The VM
> + * @start: start addr
> + * @end: end addr
> + *
> + * This function UNMAPS svm ranges if start or end address are inside them.
> + */
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> +			if (start > drm_gpusvm_range_start(range) ||
> +			    end < drm_gpusvm_range_end(range)) {
> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> +				drm_gpusvm_range_get(range);
> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> +				if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
> +					spin_lock(&vm->svm.garbage_collector.lock);
> +					list_del(&to_xe_range(range)->garbage_collector_link);
> +					spin_unlock(&vm->svm.garbage_collector.lock);
> +				}
> +				drm_gpusvm_range_put(range);
> +			}
> +		}
> +	}
> +}
> +
>  /**
>   * xe_svm_bo_evict() - SVM evict BO to system memory
>   * @bo: BO to evict
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index da9a69ea0bb1..754d56b4d255 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -90,6 +90,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -303,6 +305,11 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>  	return ULONG_MAX;
>  }
>  
> +static inline
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 62230283c384..d039779412b3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2669,8 +2669,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				end = op->base.remap.next->va.addr;
>  
>  			if (xe_vma_is_cpu_addr_mirror(old) &&
> -			    xe_svm_has_mapping(vm, start, end))
> -				return -EBUSY;
> +			    xe_svm_has_mapping(vm, start, end)) {
> +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
> +					xe_svm_unmap_address_range(vm, start, end);
> +				else
> +					return -EBUSY;
> +			}
>  
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
> -- 
> 2.34.1
> 
