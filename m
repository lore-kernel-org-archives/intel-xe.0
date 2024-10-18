Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4250CD3F29B
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 21:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389A10E9B7;
	Fri, 18 Oct 2024 21:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSTQSRUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341010E9BB
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729286826; x=1760822826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JBUpExiWlx6qXOVPgSqLrnPDFhDBzvYbIMT392L7sPI=;
 b=DSTQSRUiApFCooNOJ7v4nOX9PuBR9jlHcXzSBKUQLssxHKB511ap/h1+
 MsWm/1xbPwI/+fN9GGAwwtjOXScqrebZz+2N8nUFy3G1GWeCv+9dRwmHe
 ICJLrodQeDTyAIlucLaKWQmDVJD2wsrVvirWd6XZj0fZs+ejRPC3mdQid
 h32Yt0zRa4Hm7qCWUAYi3fcqC7YSSlFsBYQ51tmSHmB2YuPU6jRJtWzGz
 g2OKJX5FW1SeZHTS95fs0TnnXd4y4hNQ5V0M87boWnMaifFv/pFGt29sF
 VSkHP2K4uoBskAhSrhwTz/UfTZN41eAfr2qZTFtVnEURVo1tQRkA/hMCs Q==;
X-CSE-ConnectionGUID: VQUsq93LSz6duh4APRR/fA==
X-CSE-MsgGUID: Dv0SESufRUKKAeGtK6mBOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39459907"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="39459907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:27:06 -0700
X-CSE-ConnectionGUID: UXNLGmGWQx2QvzvfNbp8VQ==
X-CSE-MsgGUID: 1p2ZoYR8Q+2xx21f1GjAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79391951"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 14:27:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 14:27:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 14:27:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 14:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6js/zgyQAMClUjVqc1njyWvb4ooK9mQPe91mMlaXBxNFDO0KiRQRh5tOUk84uQ3GnFrkvO7w211Lr25yVE46Fpd/lH+6aEKvIrKH6A0vwdBcQzWB+wugj6fG6l+i89SkPEKFwzhrIBNy21tUxO9QSbQbqok3E97NyHr8MjFTckjn/rNCSMSPTjwxsC8cCiX5fCQLHIMiKy9z3CBDmPxHlxRkjA/Hk8msLp3tu4MS4cQKqiEPF6mneU1D5IJBO7V0PJgTav5rPu58F3eGjbuOboR8BxrOT9oPMI7KJhbKbzHYS95hvRiP7aME6x2p2z2LN1sJXoM0iwMHv7Hsaokog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9iyLl0j9Ocq8pCaY9MemK/0M2krhf6jj0/Z++Eqazs=;
 b=UEcOL/ERMnKjH4FCUd8rl20sx+9b1F+fSFifJ2kQmkFLB8s8WKsXLk6b7ZHEyvDEk91C+daoStKbJXnBBUALioIJxbLosUMNMSaSMLjIu7fcFsvHLIrl5SOj/N/6b3HPZT1+BMhm3cKAo6zc9+iZsAbNDUnH4hjI+dOHQjkuOw9l/G7FAXQhMCMrQ7Sr7P3SsjhETG2+QXrBJ5ZKjJ+QQiPRzMdhSS7ujURej8ZAn1qJfwww+5PWQAjgBuAmDjyGmkF9sMEz6OkUGHF08zpuBfOqspfzNi4AvRDxsoWrRhr3KzIOIZfMD/l0BBnR7uxMXF3eIR63pC/LEFS4qw/nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 21:26:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 21:26:57 +0000
Date: Fri, 18 Oct 2024 14:26:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe/topology: Add a function to find the index
 of the last DSS in a mask
Message-ID: <20241018212654.GB4891@mdroper-desk1.amr.corp.intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a8835bd49e78c13d277e8faec70f4c311c32adf0.1728884074.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a8835bd49e78c13d277e8faec70f4c311c32adf0.1728884074.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 8568d952-df73-4902-79c4-08dcefbb983b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VuzJMbhtJVJNx3xfaVljZ0V1b/6SAb5GJbBLJq4diB86/wojMmyjeUDSQUxz?=
 =?us-ascii?Q?gNhXLPgOH4njL7H/pI4ddPBn44jplTtaVfCKUBpiY5I6T6VnAqXFl5ldBEvn?=
 =?us-ascii?Q?CJUamL2Rqhr/b7v6zf+6KkdTv0xee7kiSgLYkInQHz8Ee5esb2aGzpdjKhOO?=
 =?us-ascii?Q?JNmlodz0633bC6MFAv28q4NM5q851XrJ7fxsgu5PqPv7rltC0qXx/PgeV+J2?=
 =?us-ascii?Q?qU+Ne0MNEdr/4jPFxvyYiYPQtsD1gOc3zp/Ds/C86Pt+QYLfe+nYImH9cAup?=
 =?us-ascii?Q?P0h2ZAJ0Rr8LvDnerZdv4CAjQvS2Pa5OzEhwCDT3DDeL9eZp0VMVCK5pHogK?=
 =?us-ascii?Q?HURA2n3RF58jULfS19ue5jG/XpWR4UUfFDaTUGodcaiYANsq9QUJ1W7wvlGU?=
 =?us-ascii?Q?jbHlPpW1kPY49NC3wjOcddNiHKyeuBrgjwcZbmiTA/rKIl78s+gyWibLTBAk?=
 =?us-ascii?Q?sffAXgEsIkMw3vyfSEP85yo6GSNwcuP+1qh6l6qBuHeVPMX5F1Lr/aPtGbx2?=
 =?us-ascii?Q?jIUw44UnlExUDbr8OhLrWMhPJs7R/FIGWDAlGaRkW7DzprURF4MXeZWwLyfJ?=
 =?us-ascii?Q?WnLjyuQYfQfK4u3qpToRMl2w7OaP/CzK5SV4i25WpC3OurSCYhK8Pdt6PDBO?=
 =?us-ascii?Q?aIsC5TphoL8zVHYrhOWMgsgFQj56sFkEJMga0MtKu6SIVmomg4ZENXH1ln/w?=
 =?us-ascii?Q?mK9SFYBbMHdTADB3xM1hqoYUN8lz+gcyTu42dPXLW6xGutm4pTgr+LjsjVeL?=
 =?us-ascii?Q?MNt0+YJ0Y3YNRnVG/+jX8TyNDHXxenCmXssXPWNt5wkH5XzRGrdBdrcQnts8?=
 =?us-ascii?Q?zuSYas+SBw+12Kzsb38djBftbnHhXkjf9UnOunmwr5w7WyT9l8deUYmodd0O?=
 =?us-ascii?Q?JtwWgdysb7nV9iTWfaG4KIhJLE/lLZv+mhxWkUjqL+/FYMoMhpaQIi9dbuuP?=
 =?us-ascii?Q?oXXF/1fYt2I3fcrZebjKA1MLJ3P4CSk4eEh6+Kw+e7SMIfPqqLgVeEThU6pC?=
 =?us-ascii?Q?WQp4qQdgp45t3AA5CJt9oqTlG3po7NRcEgEuf3RLvjFpJWzVmhfF4/Z+Tink?=
 =?us-ascii?Q?wsIFhJ4cE/hQTcngwUZSqsRs8wolu77YmrkJeghCbw2EzGO1n3r9OR2Kvd+P?=
 =?us-ascii?Q?Qpz1puZqPw8aOJngranuZYfQgxAGF1kETaOIOw01KHSopIoYMaYP17egyUVr?=
 =?us-ascii?Q?vtii0dCIiQi5XxM8a8KnVa7EKH0VHyP13jMF8ft4blWs/XiOhbJDCyC/U1vI?=
 =?us-ascii?Q?no8rsGO7hq4KZ6d3Q8aq1Kq/JOUOcYVZu6nwey5gHH4JUgxY9bF284MGrvmK?=
 =?us-ascii?Q?G5YNWHBV65Meg14ERxeG9DZt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GiQys5J7bj4paxj86MW0Ku6rkMLRg54Oo07TfFnlypmvJ/MQ+HjSjB+R348S?=
 =?us-ascii?Q?wtCVqHMI+rcLfXkAlkStYJOuXEFNwAmyWFBjyyccWvjtqQGjsQIaBzCYNLIK?=
 =?us-ascii?Q?r85OM0+RXBasEbHF/FXpw2SAxt6Uh3uUJm4Da+CQOS3SC4mDXffjdX8efQgk?=
 =?us-ascii?Q?ptCeXqMf4R/lN36+O0K1J3GsG/2I4UIm1KDXY7luHYi9L5fXY7t1+An1vxj9?=
 =?us-ascii?Q?3BdNT/Qrse3n4nIbGPdKM600B4Mx8fMtTtFV7M13955tZu73HW/eLoBTlCbO?=
 =?us-ascii?Q?lk1enaiqsWCJ0UUpp3/YKXbbYxHHZN97D+lJWs6Df33SkFo4d93SWms3Y0/A?=
 =?us-ascii?Q?XoB7s16NJZJ4F3XQBgnnIQWtJ57VMqwxP0U3+JnPeKz5ouZaJR8L4EhIyJhx?=
 =?us-ascii?Q?9QWrchuz1eU9/c4bSLp7riJldpACC89EQExVDAH3MK+iBHG6S7L/nuBKaxcS?=
 =?us-ascii?Q?TTeiLFa0isb0mcwnXCfOE7Nq5Qi/LqirgA/BLDNTqYKI3UCtAIsIpNEkNMLZ?=
 =?us-ascii?Q?cgekPMROTsgCB9riYpNJzD0SGJEEio5DEDXv9i6RtebGkeZQ7R7QqSytj24S?=
 =?us-ascii?Q?JZaG9LWJoDJ7BtxmtFmrjVFy4RNa+KAlcMgaGvRWc4M3W3Ytx2od/YuHoXFJ?=
 =?us-ascii?Q?zZL9efourctuMqxAHW7vhfQMtchXFH57pN3EKX+dM3aE/MmErXsFblS2smEs?=
 =?us-ascii?Q?7zRmfmr8G/YY1zDxoikS+icgV82xImW6bBzCsxjVDR2j1wdh6IeUNdaf7Nhz?=
 =?us-ascii?Q?hEMKDxF1/U3IzbXG7hLCEPYMOtthPs0TioXPtAh6cW/I88ZnligzzwPZ45xU?=
 =?us-ascii?Q?nnNlcrX7MCeCaFPoXLtPmyYssSOtkZ4BYzRNG8L7gJAYigYpRJDk4+l6M4gg?=
 =?us-ascii?Q?6wpadHvGOgOpf+oENbBc4ZbzHyenxLoi+HH7q2fdkV34kowAoP7QdkcrfcxD?=
 =?us-ascii?Q?gBTiL7TOgznI2ruMPQqQqPzbdcNhedWaHJR/8CmXXzX54byID0IDM26n3Pa/?=
 =?us-ascii?Q?81rw/ou9yCzZXg/yAHiiX7QuB7nNTR9UCt3eXHgNpKVVIXzy2EcxkbqPXr+2?=
 =?us-ascii?Q?YMBaKTVxk++4g4XdTrkrb9l3kPt7g4F9NTK6ti9JD0VXxySewMdBozuBr6H8?=
 =?us-ascii?Q?hXOnUzMnjH3D7FJldCKAR3amTt6mZrydPmNbqxggDzKnx130W2mQANpY2xVE?=
 =?us-ascii?Q?zk4ntOJpmx8Jq9sJRdatdn9h2xhb2y5FnW8q0ycAltdGtvG38KXvEjzof0+N?=
 =?us-ascii?Q?Tw2x1r3x5LJ6wtJDvCt14NMSNmncnDs7dno5KJOLHD10dhyUaYtsJ7iGkOew?=
 =?us-ascii?Q?ZV6PgPdDY/wsykK2lNZSiyOLsCEUeCPhhoTuNy807H25bzG29cMj7uePZ6jM?=
 =?us-ascii?Q?XAnI/ZIaruo0HkW25iRJsPfPDCGI/XlVFlf2DnU0m2naAMxUG1QKaHA7ibM3?=
 =?us-ascii?Q?Ya9vsSkOHHZR9aYry9H4PohRX2UfNwxtgQ8bVeAm6wuQYzhq2a5ZX7fQGUOn?=
 =?us-ascii?Q?eMTzB31/AjKDEiFBqlK7RFZZ9i4cQXvoIld/HfD4IL1lCxJv4nm0X1RtfEqO?=
 =?us-ascii?Q?RHilAzWLah6yRFUZGwxXOBgbg5LSWoyhJSGkpaoSE6mw0FBydOLFTRETe5sI?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8568d952-df73-4902-79c4-08dcefbb983b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 21:26:57.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN45j7P2eNI6IkZYuNfZhHNExTA/FO++Lqs0XQN+aZClifHn5Z+rMm3O6zvJAaQ1fQVW/iTy+dS7+iJIQsSwDIjxRSnzi1oNCTEt8siYwGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
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

On Sun, Oct 13, 2024 at 11:00:32PM -0700, Harish Chegondi wrote:
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index df2042db7ee6..1e7476f71906 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -278,6 +278,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
>  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
>  }
>  
> +/*
> + * Used to obtain the index of the last DSS.
> + */

We should probably have a true kerneldoc comment here.  And indicate
what happens if the mask is empty, since it isn't obvious without
looking at the implementation here.

> +unsigned int
> +xe_dss_mask_last_dss(const xe_dss_mask_t mask)

We're not 100% successful, but usually we try to prefix non-static
functions with the same name as the file they're defined in.  So this
would be better as something along the lines of
xe_gt_topology_mask_last_dss .

> +{
> +	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);

Since this is just a 1-liner, it might be fine to just put it in the
header file as a static inline.


Matt

> +}
> +
>  bool xe_dss_mask_empty(const xe_dss_mask_t mask)
>  {
>  	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 746b325bbf6e..7ee022784397 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  unsigned int
>  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
> +unsigned int
> +xe_dss_mask_last_dss(const xe_dss_mask_t mask);
> +
>  bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  
>  bool
> -- 
> 2.45.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
