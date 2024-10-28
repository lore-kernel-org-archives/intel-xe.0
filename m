Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E9D5B143
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 20:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95D410E074;
	Mon, 28 Oct 2024 20:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae3uQtb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1E410E074
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730145969; x=1761681969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5LUY+BO8sMYXSeJoSQ8WE+13lmG94jftFHvM/MJC+y4=;
 b=ae3uQtb1vUxEAIg0k7plaQqLvGoJ3vskQmu8IbN6fnEAPZjEtAHcbtwH
 XwlLOioLXG3SjlTELZbwH7+bRelmL+iMvPdvzwzu1huBkJQJMJYS5jmjb
 BqC/2PMQxLCSUhssDO2j8QAL5STo8h2bZ7orHKHNpPbqLHNybrQ5mDQGp
 kxb2MnRC7uLyLmkBkhV53D2DOlSooX9I59qJqVYQTQkagJJPbKtbdZ349
 qk60cuWda3NVH3+ZAcPY48Og2riT8A2kwIngw6/P/Xw9UWlGsBMe9zWgc
 Mqjw4yPRTN7T2rVlKwsq5LSwlK2lRCzQP23ADA8WbbtDRMPFfe9sO6geT g==;
X-CSE-ConnectionGUID: R2su5hk6SwebYBsAwvemsw==
X-CSE-MsgGUID: pHe+udxBQ8KVs3/5otiR3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40859665"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40859665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 13:06:08 -0700
X-CSE-ConnectionGUID: 8pCHImjRRdOKQCvF/idmjg==
X-CSE-MsgGUID: sd1ZyHLERSyjgXmf2Rv8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="112538922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 13:06:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 13:06:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 13:06:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 13:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yueRabir2N6Ecvh9efpscBYonLc20AiWQY1NgJS9hOV0U/bMFUT08p8cyArTQYQFKve2e3QuWG3apGrDuqABk+uDysdPE0W+DfP6RsiEn8j2akSYxtr8v9tEVuBIfr30zL9JUxorZSjpwCJYbujI5YgHWDD70j0MW2HWXc+n/vBHsTeotKxydE7PudqEa1l4acITYtjwNYpMHGZeVCNUYCCKUlHPnqt0wvTmNYcnel7G3cCN24D+PziXoNPN3o/gEaakKzeA2qpc1ewy7O0w1HMPMF+PGnGkqehZCo3HsbfadtA84VBnW2AJ45iFdtLwqPEwCskoeeTTi+be3CZVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj8zPv+HEr79i1qBvstIVhFyFLZziVIfQk+fDiKg+3k=;
 b=TKsWmRW0nQS79zR4m1MHLA3nRaTL5kMqauNqd9fwrxBf8ieDc5mBi95VEim90kz9ocuNw5USBQdCULAhB6A12ccmYe1ZYWyz6sBi12mS1L6/OOJqO72msJDM259RhLv8vUa767+qfsAiBKF8VX00qfsliKrGXAju3Uu53C1a30efr9kGMOUGGKf1jYb0vrmap/lygcWZVGE+uU5Qs07gQtwOBig4hGfNnNfUjT+JKasZQ91RJzQrNd5VvleO4uPOoPrHiwH5ED6gB0jSKqyzk6zzBJJj6WR69An6avXpZjKrMKeaplYvIvUyPV3LixdQH14obPbCbUK1hdpTLkC2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 20:06:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:06:00 +0000
Date: Mon, 28 Oct 2024 13:05:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkZVTEw6IHN1Y2Nlc3Mg?=
 =?utf-8?Q?for_drm=2Fi915=2Fxe2lpd?= =?utf-8?Q?=3A?= Update C20 HDMI TMDS
 algorithm to include tx_misc (rev2)
Message-ID: <20241028200556.GT4891@mdroper-desk1.amr.corp.intel.com>
References: <20241023153352.144146-1-gustavo.sousa@intel.com>
 <172976855039.1325996.13907626978322705721@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172976855039.1325996.13907626978322705721@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a36c0a-0e26-4d21-052d-08dcf78bf0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XlSWevnLP72j5F7giHQ0b+F3X3qN48ktVpGS7pjMmnY0TYVVGLipeHOI031h?=
 =?us-ascii?Q?iNDxbn05r2Q7tB7C24sHywVnd5yMj5iBJxUUW2XypmzctXP+fSddntdrPFon?=
 =?us-ascii?Q?HiJstdN636w51Ruaz47UGW2qjS7LEApXZ8I0sKZMmIYfi4z0ENaWJ3+7+Bsy?=
 =?us-ascii?Q?oLPkOmJeAH0nBdP5bJ66897QY5f0x3WsL/n0MyWUIEWUeTMS4MEyV/KmDzTe?=
 =?us-ascii?Q?EnDbTNJvzY1ZejZAd1znxjMK/ma8N6DJej52Cf4kJ+wMVAH+3fZFLhOSkoiq?=
 =?us-ascii?Q?G8VAJaNkWGUk7LF+DwIC03LUnZr3X1IJZd0nUuwY7MtoDuZkfF+gLnEB/dNM?=
 =?us-ascii?Q?sPgLKX4er/KYmnyGLxiFIub9QD4MUBq4bnuDCxx+kEfp/UOh2gDMjfWB8X/i?=
 =?us-ascii?Q?+uFdOCDMk1JGnTkblZS5MGrvbaXCd/L4ux6DO0eC4i2mqO4RA2PIylLh9jRO?=
 =?us-ascii?Q?LL7Ka3kfHBbQ2rWMA2B53lGeC2KXZRlPfPM9mWLSEU8CHEZ+eVsvcGYzpiNj?=
 =?us-ascii?Q?ZFTj7FGnZ97T/kwQXKN9ibKCbZRNe/bwi9bX7T9guK4cUPJ9PJxaRexjmwBN?=
 =?us-ascii?Q?kfVrDdJDWcx+WJ9HtZF3/u4NEUneaZ9yM+1gsR3Gi2D/nurlYB3fldvH7gYs?=
 =?us-ascii?Q?eK7/TV3PBu0FOFTPlXXvkrh/kzijUjUPLwhV3RdrVhbeR+W+KM8BVh1PJSXM?=
 =?us-ascii?Q?J4MO4/2n51JUneMUrebzyQSLkltZx44HiT53o01UJkWKv+et64dIea6EisLy?=
 =?us-ascii?Q?tMsCPLlreOrRup6H1MFKucpVwTFPw/XN5yZWUfSUQrEYikdbJdoW8wBa3sYQ?=
 =?us-ascii?Q?TmvylXwf6dzHLhDr03Kbo/j3b4FRLxkK5RehUnAtFKffv7YBbYDQOioCtEF8?=
 =?us-ascii?Q?PMziNR/Pcxf6wlB6u7/vm9zB4q1hPQ+STsAARHobBQlyE5TaBbc85k9TwShY?=
 =?us-ascii?Q?YSQtSl87rDM8wTF7IEZLpGb8Wn7TQua+RamcijOQBLGKvFDLg13Cb9pJ+SMd?=
 =?us-ascii?Q?hwQEGuNngZ9g9WqTHlR4iTC3VbLyneJj2x5qQD05A/ozvIDki3d9oCOQ86FL?=
 =?us-ascii?Q?jmcCdq1mP+NyrGb7Vhl8IqcAdLEBklnyt+4YP1lA6Oyl/S5GVvWXbk11OrjZ?=
 =?us-ascii?Q?3q23OTeKdQALgwxXhXLJEMMdmcTSe9jneRzly4qS0eTwGayvAniYH3K4y3qK?=
 =?us-ascii?Q?mlHBcaEH4T2A/LmD/QNEu4x9EwUZm594toL57SfTAYUnducdfE8bOX1afgOr?=
 =?us-ascii?Q?7mZmzJh1gErdMLARGTH5A4o1sghe/r6vQYKyr+ZlOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNckMpqWLlqMjG6KAOvqkTvJbvtj64boDWcpxiUYj2ACKJBh2Yij86qR6m3P?=
 =?us-ascii?Q?6ucViRGMcZf4Rd8Wcyhv8vwT/GfhYCP/rHoxxzt7Cu+vjJ1uxMIB8DMLPuZJ?=
 =?us-ascii?Q?3Gy9qAV+1sD15LbCAwF0FVm9zZ/qGsBS0XJkZtmnbLOgTpjIEaCz+hMqYH5/?=
 =?us-ascii?Q?5Advmt45KJywfLAjfFQlb1+poiDSN//1r3sn4mBtM58rfLEuRIR7I9Hm/vnr?=
 =?us-ascii?Q?KTqGgwMY7JIUn2kAsR5gg8qxviw3I7mDcUzyIlW4wKUYTVRm5wDo+/Ovs2xt?=
 =?us-ascii?Q?6ra2cBCTm86KLR7vMcXDPpldktzfkAo+wnwTrhVckqvz7OiJpt8ZGSrv7O6z?=
 =?us-ascii?Q?EZrb5COzKtML36dSJ3r4ZnJgm2ofPG7eH0JvTLMopI/0mtc43ysT0Mp8tOvG?=
 =?us-ascii?Q?tuj16R2xKfbqZb1EGPyrWYVwxNdgmnDqj47BABz2WcZDJwnDN5lQXA6R+VVM?=
 =?us-ascii?Q?P2dA4InZHyKTJpjLea3c9lFMSK3cIyuO0wGG28cvWvpm972wiWj84HDx8dxI?=
 =?us-ascii?Q?ZijUOsGwkZHW9Zl7yMv6U1Z5za20swrmcNi7ArE1pOuGSk0jNE7pvDK8w9b5?=
 =?us-ascii?Q?yuPZFvNqv9BbjdEvwN0hLH02YQHfCMA16FqHK2878zD2GUP/Ivumx3M57iqH?=
 =?us-ascii?Q?VtQph08HktFuO3ORFwAFCRJdJ2D8yYvahQrlHv3H1nyLECgZUxXC2m0CLSTe?=
 =?us-ascii?Q?sb/Brm4cmimuk7QA+iNgVfskINN7aJrdOSPqm+HRG5poP2Q7ylbZuUTMVaBu?=
 =?us-ascii?Q?Xgi28W+QNpVFsMxO/5K+W9XScr8hWPWY8RVsU7/aD4YGCwa8P7DXB9pQfTFs?=
 =?us-ascii?Q?OA2FuDS8AZ651C7xZXjI/JOPZnIYQVkBvYOumUyTJlqMYAKK1enxj2KkNDz8?=
 =?us-ascii?Q?/FkJvKqX2zOE2kzFhpcutsATMMnygQo+9GMnRl8U0L3wVsu4Ci6Hg6gZ7YfB?=
 =?us-ascii?Q?7X9NK5i4zPxDx2Wx8F9Fg9PL2wW7oh/jbeR8QIxXp37y5ATUsQjM7/ngQ0nQ?=
 =?us-ascii?Q?rCfSSo+PeEf3KVGBjMlruNVWx49vdkeNMEpyVAsaBCv2xwYT7tYCAMLINtfA?=
 =?us-ascii?Q?n200Gtuae8+jKie7GcALp0sVwv3phAANrnhezDzO5SvINez6zmzsJ1cVEH8V?=
 =?us-ascii?Q?sU3YPpVOj4PvwsjGpLjSkwKjsPDD3uxACPOg5XJmKsk7oTc0h1BAXtzwkQsa?=
 =?us-ascii?Q?sLbbEVdvWc9l0WLgv6CY0DtUEYUNCkVBvRF/mRtQnvszJ9RZhM3pFoU3p6Rl?=
 =?us-ascii?Q?xAlBheD+g79c+6XZAHGy1P7qeA/sJEgYgB24wDXZyOqDxbwRnpzGZS+UOKdt?=
 =?us-ascii?Q?CyW9yNy9bkjmiNBVK/iDSTbMdNKGljjkpW70ZDAUvGOdyU/1j6nuPLQi/NJx?=
 =?us-ascii?Q?hBG1qdnlk2Nauk2K8AYstyC36vfcvKrNgdXYObmQsTKhFi4MsANykpfoKsRg?=
 =?us-ascii?Q?NuR4ymWAFksGFIFasaR8xAMimRJrycXD1vhe1DA669EmOhuCPLymxdpRpuYx?=
 =?us-ascii?Q?h6obVJtQsamT9yu3AMjuxla9opc4RQdnRogC6VsSnPvXalHuZXUysuai0xsw?=
 =?us-ascii?Q?WZxJGX5RYn+Dq0OTCXUZM3CkTvOirGhGQGbldKB9azKQmSLDUA4R8CZr00F2?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a36c0a-0e26-4d21-052d-08dcf78bf0bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:05:59.3156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkOZm8TQSbic5HGxhv4UldTd52CAFAkfWe7KsSMCQ8xDOWQcJDGrzSqGcck/BcIsYqXjiZBDhW9QgldGogJECnQom7+JXOAo33h8KAcHz1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
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

On Thu, Oct 24, 2024 at 11:15:50AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc (rev2)
> URL   : https://patchwork.freedesktop.org/series/140135/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full -> xe-pw-140135v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

There were some failures reported on the BAT, but those were all
non-display tests and weren't related to the changes here.

Applied to drm-intel-next.  Thanks for the patches and reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full and xe-pw-140135v2_full:
> 
> ### New IGT tests (44) ###
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-userptr:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_threads@threads-hang-rebind-err:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_threads@threads-rebind-err:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_exec_threads@threads-userptr-rebind-err:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_query@query-cs-cycles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@xe_query@query-invalid-cs-cycles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8081 -> IGT_8082
>   * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-pw-140135v2
> 
>   IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
>   xe-pw-140135v2: 140135v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
