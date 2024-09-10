Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FA0EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAB10E8C8;
	Tue, 10 Sep 2024 18:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NG1BSTh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB710E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991698; x=1757527698;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HmmfSfNDHM41VCduQVQ0TNupClCjPmWsRNDKpHW2I/w=;
 b=NG1BSTh8POffPvt8uPYljrM2MGuVbWsUbYU4Ojo3sFGJhtUxnOshPpKC
 ymA3H3zg0cawlHbpSbpLlWF+Y0LYIe0hNJadaT7jRt2uTd0ZOH1M1C0ih
 WBNkEDhw2wkk/etkAu88ceSoiuuFh//QNFCusUM9l7GIJdyO3qm43oR7g
 ZYGvLWiQe5xuTfcjE1bF85yumi6GGtmKgUM75bbkVF7m2oSqKc4wfX1Bv
 qIlg7sXfu4PZuYRQhByJgLn1nzxkHI/JU9pG3IgWHRTS8J6FwLNlP+XAs
 bCTVjXAPwUyRCPDbv9tYctmn0AogIQ9zTJzgiZ/7+oDT+i1jFlXbxb1f9 w==;
X-CSE-ConnectionGUID: ZuRHyO5sQVaG6Cmf7stgJw==
X-CSE-MsgGUID: T/PbIz+fSz2GT5GIxOABMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42236582"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42236582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:08:17 -0700
X-CSE-ConnectionGUID: 9SBef+YLTWu7Pz/xZrCSgQ==
X-CSE-MsgGUID: QwCVhT9TRUC8bI5004WIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90387430"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:08:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:08:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:08:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haDE9f1/8/ryUo/0lZD16ilwmB3Ki2FiApHVK7/cvz5OOsgil/tPo9V08uI7WLAGBX5SIunEYKoj9bBMrT38QMIa9rs85osNSPVkLTRA38ZTNA6mwN0YOHdjUMfjAr7JIu0ud7NHyzffJ/dpiqJFAYdXkE1UflGLFd3yfxV/Ahz9Flbx5LC8+KUN3LaZRljG52gb9maru6yDrORu5VcSSM1V8CKXHNdL2fIgQdRrSN/NrvtEphqQquUeM/IxPRZlb+4aXlotjMekiD2lgrcovpwy2eYmVWbNJz7T/FeSG+XY4N5J0G9XknrEYwmfNqYWZYAVz/kpcekb558FI+CH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAVmoHPDspcTztZTP9uaCJYObHFuhi3nVvJuyqoeHQI=;
 b=wc5opXj4ChLoA6xYnxYvy4f3uP5wkHXfM2mlRbvgQbx79EoBBsIZ+iBpgLsn/l9Tku7cd8K9etU+U9QvXndppZuVTpzOjw2q+z/sLvBFfmCctDF44i3emSfTIa1NOqAIgYoL1Rf+T1b1UwF6jsXIxxiX43UefLpaVdfNWiJMLQ7NH7EHCWZODS21Kq/HMeJQUpUWuRgEZK5yXaUrvAGKbYXywMSzo9dIoerbBpaC0cZIHCAt8aisb12D0luF1UpzTaVjZ0LIhUpRYA7M3Ya4lVFIaLeZ9Wkl6C7dQ2xEyijLmF8+BxXKOMhXq4gSbqHbc6wQJBFR8mjgj1Ety7xMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:08:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:08:11 +0000
Date: Tue, 10 Sep 2024 14:08:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 23/43] drm/xe/gsc: Convert register access to use
 xe_mmio
Message-ID: <ZuCLCA956pZA9Z6P@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-68-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-68-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ae3ca8-da17-4c13-90dc-08dcd1c387e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bcp6ONGT3yu2UC4avz64wDAOldMWa6JUHWcdPEY5HIwoUntUqAO7IjXZXCTF?=
 =?us-ascii?Q?KMBrtWgnU1pMGnS91XuFhOc7T3ViSmgVUDCyyPT0oYLWRQj3925YOPGTV39X?=
 =?us-ascii?Q?6wLB0GBcbh2D1E5Nr89WR600o8bEBAoa+uWfBmZNAzA1HoKG4XuCaloFUNU6?=
 =?us-ascii?Q?apUXmeO7Hi9qblREOE4ji5vvhaSen7AlCrFlS/qldhoTNH9kzYd2YpoQgkA2?=
 =?us-ascii?Q?Dfg1omZ2dM/qGfAd0Oj5U/4EwkNN6WIVlkKv9mLb+iozN+gRQEO7PRWbytkI?=
 =?us-ascii?Q?Fm7BGm7z2T0EZKTtK1yindlmaPgOJR9IHY2RpHmLlKMDXLuw8og9CIC5EUhB?=
 =?us-ascii?Q?zEZwd8w5lf6x2V4hCFvNJGSz5pUZk4Sz+N2BgFd74CA/Hb/oW/y/DrTO0s8J?=
 =?us-ascii?Q?JXeya2HXTjSD/w5FyzfpMV/WkoXKAqXffxvwskLpvLNUOy2AEEGyG6/GUjNx?=
 =?us-ascii?Q?W2JG0Hsodl612vSynTrRSiZFfNS1P/bUKjuRFYaHu12yhxKA8WNWA4NYevX8?=
 =?us-ascii?Q?+ehKO2auRZK1jqTHwaXDQKMxFqwQ+JNqjNoC/YMaUjSkXJWXXCkW2OCvoJIJ?=
 =?us-ascii?Q?xu0tb+knz2bdE/UTiCIxyU3QTfCklVkUSxzoebhcpf65MaJU1Z7ifs29jLio?=
 =?us-ascii?Q?6/B3fuu5EGtQGE/6R0Cu4NoUJA6BJ35KANH9ktiDKIb3luVwMAd5/Vu67/r9?=
 =?us-ascii?Q?ttbCi9jzu2swgY2ZCl68elBdWvrvwbHlZaGK4afkk99Qdm02uVFk8X/6DdwR?=
 =?us-ascii?Q?GWDMetuzUuMX8w2FjeZQ0+WtvFAn9pjxgzGt5CN3fVeNdHLx38pqkpkRjnFT?=
 =?us-ascii?Q?Wo03vTMTtd7VIl+sfXqe3g9Aj7SNE4pTm+BVOr5eq5K0fCadhP7O0ogeX25Q?=
 =?us-ascii?Q?VF9+OF9Lkpo15BkS7lY3hahn3tOOBO2ocs4nKq1o/KLn3VoZ2HEkx85Isxxt?=
 =?us-ascii?Q?ntsmofq0aSHNiJz7NO+j8fAzEatfUWqa112qZV5IHsJgQwZLEYgja0yU+61h?=
 =?us-ascii?Q?EOwZJ9a0BOGlKOBEiBwKvfayEaXB89mlYvD5NE0oHrYTGS2+FskbcyRA6GsX?=
 =?us-ascii?Q?pMPYgnUQwQHgV4lcf1ey0Kd2fFmicMzeXoR3wkruAwkpiWAAE9353W5aDOw7?=
 =?us-ascii?Q?l11wFGZSbqNx73dW6WM7K/Uk6GfF0/PzW7e6ml+fqBpCJEMm+4M63ClCSpwk?=
 =?us-ascii?Q?d1/TlG8Os3OsoA/9O7uOyshdggYarb+hV2zi4/EwOmLobju3F7j1toB3uaUE?=
 =?us-ascii?Q?LfRbwsQQgOMhW0jCoQ6BtSK/u/AUs3sLLifGRfCYCgPFMZTR3I1lIBedrt+v?=
 =?us-ascii?Q?a6SvzGSWjW/jipX9SeMaErxaR620KOslW3v6HhYhIbsrxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8dSVnB/qnizx4Sdqc5ppm8qi9IwGCc1RfZgcJ6tdOW3vtbwETy236d7okBh?=
 =?us-ascii?Q?M5k16Ti2qnLE51FU0IyL5y1pMP3HSYhl92e1Q1bDEghRqS5BdLo6lfBP1IGD?=
 =?us-ascii?Q?CtMMt8MVATWV9Jybg8SFRxcsL84mvHnuiZt1A/z2APInBNGbnJAz8tyFw6n9?=
 =?us-ascii?Q?rd8GTb5osH+2XkfmoxC64mvvglqCeU7Fe7R47BkxMS0ozKZqw+59VEYgJ1Mf?=
 =?us-ascii?Q?Y7KRUYobveGIryjZtjNu60NDxUo1f1q65u64/GeGY2M2/ZlwZuPKzSET0nhm?=
 =?us-ascii?Q?sGSVv8z7ieZY2kKJ10jsXLlyWzFxjzPoebtT+cF4GAGcjs29AnhO0J1tG3Ju?=
 =?us-ascii?Q?zO5VnTfkFz8mXyc7855eKMtTy6GSZ3qHxKBJ67UB4lESWcOftfsCCaZKkv26?=
 =?us-ascii?Q?eH2mGZI1awte7Z2oRwhh5Ers3z9TC5+HS9afZOzyWFUS86eKLNFIfeaaCP8O?=
 =?us-ascii?Q?4uESBApGB/p47Ap+Jt/Sj7YDfughx688ZOiczatxQg/IyoEXj26DwRCLbRLa?=
 =?us-ascii?Q?sVuz3zjAHeOAiyP0GamA4H/bybnVRgPZeH642bqH5lgb0kwUALEl8acXImEc?=
 =?us-ascii?Q?m/a4fRRvUF0S2+XpobzoBCMu/+X6t3CoQjiqE6tdrwW2xN66Fa8NkRrCeCmU?=
 =?us-ascii?Q?vpOX1GKFqDI1dkjcjtQuLqhWJxcQOT6bKD9028VGCONIhL+Kt6XR3YXQyY6K?=
 =?us-ascii?Q?ndQmlTrtTVhouzQdU6xsI/J41ewGCZjXXE7ma4JXjEkm378aY04bBKlaQIqq?=
 =?us-ascii?Q?DAO8x9oTw5ioM2ao3K0AVsV2d/uqqRMtKuni/ZrgV6mLkDmraXHVy20TMgyR?=
 =?us-ascii?Q?1Uxg4mz+TDvgvLaEHGHQhiGgnGFf/NQNfrbO0fwIPZdIRp5zd09CWLz7nRah?=
 =?us-ascii?Q?7Rvj3EGtA85WgemuNXp3Ky4uuilct5K20QpxL41gtozTaHXTxC5PIPx3lD0c?=
 =?us-ascii?Q?6xgwPsqUnh57c4qyMBQdxDjs2n3e9cj9XQWraJN+WuWPQ5H032HqnfWmOSaN?=
 =?us-ascii?Q?Mlnv02HfJN/GxQqXqmJ9+Ha9M5MLzaLS0ON+simY8t8vz6WPD0SUH9AYKFj6?=
 =?us-ascii?Q?yCG5i6AGozQXMGcpgk2v5xuVSg+N7lREGBIY2foFp7j2r9lAr0kSIJuSkdK9?=
 =?us-ascii?Q?VJyJiyInGtu7RE56zueWHrQUTbCQ9aH03S8Y7JFGG1fkzk/uXYwu/4BhHAg2?=
 =?us-ascii?Q?BNQfMogaSyQQhBBbOyItxc2VY4abHqQnBpL3qcMjTAIU3x8kaNfW428dDNkL?=
 =?us-ascii?Q?Bpk8tK9eOSMwct1rob1HAJ00kTepLM+YUtRXHdmvXDxSzHqJ0BPsHYVwfYQB?=
 =?us-ascii?Q?CmuBSY/EO0G3oVDVdWhSfKpkINdSgYzGHcDNiuS/6DEa+ufoh581vuvn52DM?=
 =?us-ascii?Q?sAsc8WGb+UOLimnz7z8wi34optsjpYWivoYmMGdzIVQRwUnFIe5S7/rbRxBL?=
 =?us-ascii?Q?cRRL/yznfH2FB7PhyKRe97PfrFjc93NKN0ymqipEZUtA4cF4goRc0pH/i/hZ?=
 =?us-ascii?Q?WG8vef07LMMuAPAIeXAa1POPEr9yP57gRYkMnR4ai2hZ+nS7KSxjfwRnqF58?=
 =?us-ascii?Q?loHskOg/mFYwAQeL/IG1Jx9sJRvRDw9gB3g1cxkQuND0Nmuq7DNiK6mQnbx2?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ae3ca8-da17-4c13-90dc-08dcd1c387e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:08:11.4218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aghDtCwGbvG5jjKCTgH4BnVnZpecsRYuNgLVn3uP5uNMWxUzRbYjHL0KbnEO9TTSSRKHuLJI+UjXwV2lMJAvmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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

On Fri, Sep 06, 2024 at 05:08:12PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gsc.c       | 23 ++++++++++++-----------
>  drivers/gpu/drm/xe/xe_gsc_proxy.c |  4 ++--
>  2 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 6fbea70d3d36..9cb326af5931 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -179,7 +179,7 @@ static int query_compatibility_version(struct xe_gsc *gsc)
>  
>  static int gsc_fw_is_loaded(struct xe_gt *gt)
>  {
> -	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
> +	return xe_mmio_read32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
>  			      HECI1_FWSTS1_INIT_COMPLETE;
>  }
>  
> @@ -190,7 +190,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
>  	 * executed by the GSCCS. To account for possible submission delays or
>  	 * other issues, we use a 500ms timeout in the wait here.
>  	 */
> -	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
> +	return xe_mmio_wait32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
>  			      HECI1_FWSTS1_INIT_COMPLETE,
>  			      HECI1_FWSTS1_INIT_COMPLETE,
>  			      500 * USEC_PER_MSEC, NULL, false);
> @@ -330,7 +330,7 @@ static int gsc_er_complete(struct xe_gt *gt)
>  	 * so in that scenario we're always guaranteed to find the correct
>  	 * value.
>  	 */
> -	er_status = xe_mmio_read32(gt, GSCI_TIMER_STATUS) & GSCI_TIMER_STATUS_VALUE;
> +	er_status = xe_mmio_read32(&gt->mmio, GSCI_TIMER_STATUS) & GSCI_TIMER_STATUS_VALUE;
>  
>  	if (er_status == GSCI_TIMER_STATUS_TIMER_EXPIRED) {
>  		/*
> @@ -581,11 +581,11 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
>  	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
>  		return;
>  
> -	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
> +	xe_mmio_rmw32(&gt->mmio, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
>  
>  	if (prep) {
>  		/* make sure the reset bit is clear when writing the CSR reg */
> -		xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
> +		xe_mmio_rmw32(&gt->mmio, HECI_H_CSR(MTL_GSC_HECI2_BASE),
>  			      HECI_H_CSR_RST, HECI_H_CSR_IG);
>  		msleep(200);
>  	}
> @@ -599,6 +599,7 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
>  void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	int err;
>  
>  	xe_uc_fw_print(&gsc->fw, p);
> @@ -613,12 +614,12 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  		return;
>  
>  	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
> -			xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
> -			xe_mmio_read32(gt, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
> -			xe_mmio_read32(gt, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
> -			xe_mmio_read32(gt, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
> -			xe_mmio_read32(gt, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
> -			xe_mmio_read32(gt, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
> +			xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
> +			xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
> +			xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
> +			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
> +			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
> +			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 2d6ea8c01445..6d89c22ae811 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -65,7 +65,7 @@ gsc_to_gt(struct xe_gsc *gsc)
>  bool xe_gsc_proxy_init_done(struct xe_gsc *gsc)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
> -	u32 fwsts1 = xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE));
> +	u32 fwsts1 = xe_mmio_read32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE));
>  
>  	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE, fwsts1) ==
>  	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
> @@ -78,7 +78,7 @@ static void __gsc_proxy_irq_rmw(struct xe_gsc *gsc, u32 clr, u32 set)
>  	/* make sure we never accidentally write the RST bit */
>  	clr |= HECI_H_CSR_RST;
>  
> -	xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE), clr, set);
> +	xe_mmio_rmw32(&gt->mmio, HECI_H_CSR(MTL_GSC_HECI2_BASE), clr, set);
>  }
>  
>  static void gsc_proxy_irq_clear(struct xe_gsc *gsc)
> -- 
> 2.45.2
> 
