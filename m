Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F97CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858710E687;
	Tue,  4 Nov 2025 22:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igTLr5ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4660810E687
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762296540; x=1793832540;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A2x5+MBUedjufeRdlqE7Nwuj6MYFMwwcXxWnMl2y/nY=;
 b=igTLr5llMJuzJdtOwNauYoyPIda+/2Tay3z+iLMOZdtRJFzHbNu0vll6
 Hr8b3WRF5NLg95QAwGUxrD/nOopl2tzJs7hynQXvJ0scF8f0Ud2wgcukw
 4VPoyC4iN0rPpur2Qt+jm6f8Uu4l0zK0OidYqcW/4rfIjVN8P2n3p+Kpc
 661w2Ky7L9dbiIUEavr/7FsSwRrIz2/6+gEWEvZYpWMSHOJ4mZKtewrb+
 jpciTGr7VF9AjGcS4BarH0TZ7vmCyelDj+YxV++5wyHX6OU9uUcv/RB2/
 ZykrL7ALaTWMd+ryG1PBj46sx+STO9RJ4brP4hTtCqCfm6vncQkqh6bdE g==;
X-CSE-ConnectionGUID: RXJjixT/Q6eD5xZIharnlQ==
X-CSE-MsgGUID: U37iRbjhQSara7U+ZsremQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64435133"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64435133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:49:00 -0800
X-CSE-ConnectionGUID: vh2hkGGfR2qQ4zRqKyo58w==
X-CSE-MsgGUID: LGr1MfnERZq+gr85qw4Nag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187132337"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:48:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:48:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 14:48:59 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLBeq7XplLg/lHS92e7587HWcT9WIYkoCrri7bopc0PlqpfEISFVxKGruRiaHciV0GRF/AlWr+O4PCWcp/Oge7WeKncrYI/jFBMlRcpycHVY9JaljWN50bllzUULiyun7kVM2IaUubky5Titer/NERQUFtbNNMZRz2aBg+LTJJtB852qSjLvTcXc28bEzljtQveURvvEBfhGNGsRA9cjLYi5I7NJ/jeDFkHfmbxmAWfdL9YvY0UcgTazJnh71ZG3XtG8WPZhVaS1Ktyxix3yisOkDyzNBVTKrsvd7ipA2BitUK/Act/b6n9kVmV+k+e48L1GzaCGFZB2VYMSS3Ba2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wn/ykdQM9vuepTJkCzAGxPfqoRk1WRj+HLXgaTV8KTs=;
 b=phRmsZJ9zr77S202SCOBg8Rm0PsxvhjlK4DqtH/Juouk/CTI0hRn21fSCTP1n3L1GuysUant73bSlb1hxArBiGQi0+8LVuIeV7EJyn4wZ7L0D6jfYEsa0k27zk8Hhm0uOZZzyykUNHN42hJi+ko1xq/EZLk51MQkjizbvOFV1QjyvcggHPMCTe2YQyKTgmtzp4+PBLmoYNmfAuZCfjvNG/AqYOdma2MCrrynpcG2BeQGA5encYQWpNrhLWxrLB5hYKGh3dOfGDsMuVpWDRqEJ2GWog4YTdoDapupC1Bi1vrkZURDComXT+l7jZMaJXO1C6Ye5Almzo4qRL8d5rC7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 22:48:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 22:48:54 +0000
Date: Tue, 4 Nov 2025 14:48:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 06/16] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aQqC04Dy4uGItSlw@lstrano-desk.jf.intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104185150.246345-7-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 034adc52-0192-4e68-706a-08de1bf45478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9Kwi/DpLDYjupDHhTSzsIXIlMF5qpx93/1utV1pqcBP//gMp+NjzA4huKCC?=
 =?us-ascii?Q?Om5agIiUq6zS46q9R7KSIO+uQFko9cXDHW8VWvINpb1xA/dsQS+PZQ+g+ygL?=
 =?us-ascii?Q?uYdV1GJiPCBI25C+CXaiZc/Zo9h4CIjB1y/WC32KmI8hgEOisckHHdimRQqG?=
 =?us-ascii?Q?6dyEtYuwSNGQC01jaD/F+OtPEYSIR4WVMqc4Pr1oGX8xUXnCunRDHIBHfila?=
 =?us-ascii?Q?Sa5hsj2q5Sx9NUku+brAKahnBPZzP6WD3ZbCEnSa1JhoV68lJDDwDu1ilHV+?=
 =?us-ascii?Q?KmTHO8vOYuo0kb1n2/8yTpMy/x5muKMoHADbFgfGUk9z7VvDt4qnLdKckrUP?=
 =?us-ascii?Q?aJ4xBr/yhGHPyp871a6aFhLYQzRfSn7bSGIWS/WZ19PvOkH3P7DnO03htbaA?=
 =?us-ascii?Q?AzAuUM4wybRQvl2RuxQwrQZlb23pbUOVuQigeoGbUkb3OAEMq1hqQg3jqaaL?=
 =?us-ascii?Q?VtGKGI35K41mk0RS0TbB61bxmFCLo7xYMMVloQchPsTWT40RkD0i8aSHr3lD?=
 =?us-ascii?Q?bFOvvlVnLwNfUjFoYxTBzQDy0OTsn7qXhC83Jt8unhQHYVlGxghf214ogHy3?=
 =?us-ascii?Q?uIOkBMRq0ymy57ZJHwH3DC93F+wshMCHkK/vmEE2LdqHa8faMrA39pGwsaW/?=
 =?us-ascii?Q?jGVJvWsXDI2+8GHnQNYPNgjITPO3EZ04dVpccubNxiHFxnZL+gNeY0+0OW0T?=
 =?us-ascii?Q?hOTvkYyR0DGFiXJpFDWRVb7yOWfAoxuYdj1S30Cmp5MyR5qlzDISsHUZM37e?=
 =?us-ascii?Q?EMedXBrkoQqKjNt8U64OOBMxGthTlxyuOFOwtZTtvTuMI66PDuyqVN5DtcF1?=
 =?us-ascii?Q?2Ns9QKFV8Eoaq9Yfi37bRmxI8SPgTPp/m95PXhiRgHq4EBTVEHdstn2DCNEp?=
 =?us-ascii?Q?/NIzHr8FSZbHJEkIynKTI+ecQV0OIS+4w/M3OAC7Xf0ZKLPVRiZgh/n/BwXe?=
 =?us-ascii?Q?sLLayVu8nWe5yEfTSJTvgXvK5IbJALN2emmy9hopPGkmNOYmF0Q8WACoytMH?=
 =?us-ascii?Q?jECqVHy41hHg9+THyRq5hiXQf+DuTgiWpnrI3NBRF8R6LYrH8elt4qA1FgxS?=
 =?us-ascii?Q?5qjlJpSkV7F2SKH+cZGfEYZU3AkSky5UOJ6eYkgQTY7DSOHmWsk2ED+iaP+o?=
 =?us-ascii?Q?xP70KJKXmKq2/hHPp0SOD5iTIDktRPubkF0VA7jWRmkkn/WYzgA/v7mBdVpb?=
 =?us-ascii?Q?2p4LLZ5rVWpNCQZ/PIUEAqCSx/6Ux3Ken5Xsllx6oXOJc66fBX5iLthKv5zb?=
 =?us-ascii?Q?u26DPiLpmLxjQvp5667MvUNbjfvybq9XhloKBmc0+j90sPt68ePbE5f2Cat0?=
 =?us-ascii?Q?UTsqQhCg59cxf2BSk9tlZjSnGjH0zOK5H1OuQfdBDd28Ntvf1K23CYXg12/8?=
 =?us-ascii?Q?JN0wG8xAALslLOerSj0DtHA6mJrIaJpinPywoXOT5oai4paBBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BLViXmoMpIHfcX32lX0l+7AXqZsZj3ecQKo4C8DjGqwwsbKmGFw83tOMxG+v?=
 =?us-ascii?Q?SfW8ak+eRF+rg6aY9zkdqCQPmHMNvLFSa8b7ft+LdGg3cSTdtAfyxQ1w+KIC?=
 =?us-ascii?Q?+tcd7Lk5mkwqlqbanLJUXBEeUiTX6C8miiHjnEll71D+NlPKivS2F3nbpiJf?=
 =?us-ascii?Q?4lcc7Qtc18Y+AeWbJLVEeyt9rfwWRVd1s8l9xMSikETbcbswKMrTTMFIES4C?=
 =?us-ascii?Q?RvxWqiYa+5cznoCUQ2lwtlHR4dxErUZ88hJWZ6fp+idI2aMBBYzdp0JAtivp?=
 =?us-ascii?Q?5eQAdgBsxd2IbqUxoW+2a2W2e4/F1CySFZyMuLHkvHEWtUwjz+rhRv4g/y9Z?=
 =?us-ascii?Q?DquZUD7osU5LnO4WWSMjodJ7P9gS6HLAk5YnP6F4L5goryHv8aYvngsj20oH?=
 =?us-ascii?Q?1kkl0I5oEpZmcvviOVFNP9IRr7o22FvFiyUuh5Xt/NgzMNpdpSttpuHbCvF8?=
 =?us-ascii?Q?ecvORraPEY+/zfLKR6uEHVbgpMq9P6ujeKwDMDWCXg3zc1C2XA+hrP8T4hd2?=
 =?us-ascii?Q?0MdnO0MeW07mz096ELXWifuVEMbRa2LfWvMgonT1u3nxwH5OVHVw4peofjHi?=
 =?us-ascii?Q?noYSbRNekwqiw8XLiBkshwdkzfvwiC5tO5pEMOs6JhFAe8cJF8m2+JLZGOB4?=
 =?us-ascii?Q?sqQqx2QWIyMiBKAshOOX21PO57uPW/4lSlpfKxyxTz9zLc4T7i9lInEnKHLp?=
 =?us-ascii?Q?9BB9rFnUdKYfRv7vBml8J2AdHDky0K6yhwrFkCzscZOD3dyXTeFVKbeyaMiw?=
 =?us-ascii?Q?3wNNtJaL0CQE4IQ1I6dex+q8ErpiigVhKfbiyMet8+2mCtECmbP3ioFob6Lt?=
 =?us-ascii?Q?F25az5CYDX161sbRSP0mRXEAFgvUby+rMCRZWorID1FK1EpfVKecAYm8nTxZ?=
 =?us-ascii?Q?rN/P07ZjNrh/3s4I5gj5HhWOpkWUgW+hBcgK/L5mUuu91MYyGjlxG3fpLou7?=
 =?us-ascii?Q?ot0jV9uNLOVvuDB+s5NRNpnkdMX8/JWRTMJgtRnVwAC0+7P/hWMYM54ydTO9?=
 =?us-ascii?Q?lFtsHp3C7TM8Pcb0HvnIECU6prjcJjuifHCvYZB/kpeiwQ4+WlPKXk7PEcoe?=
 =?us-ascii?Q?dqFB/XOyJCd0f8Dta+yI5xtXRzoWrwrjBBW/2ie7amrvC45mLp0V24huhmW4?=
 =?us-ascii?Q?LJylnRWw/GgFgnvXfjgIddNOu/d+uiq8La1ZeP0dzIsCuxz8MgS6Qs6U8OG5?=
 =?us-ascii?Q?bEJGIrTLYDAwe1igKbiAErx8zmhiTWBzscqEgHW7dHdr5dzz4fq7uUUDD9UE?=
 =?us-ascii?Q?+1FUzvICQsYtmDquZCUsuTBdJe0un8s8yJ8UqOVUmitPK12LYkQbBK/3wzap?=
 =?us-ascii?Q?cYNI/VyFhT8phpR54QGSKKaqCqUGldBNjKj7FKiUURmG8ijca7RJswmzeFKS?=
 =?us-ascii?Q?eUJjPjEpVHx00PWbhKOPWbdiCV0geknt/Onc1xvITLhfhMRF6LYTS0ILnvif?=
 =?us-ascii?Q?xqlCYgXCP3llGLISVc0wcds3zdDHCYQnenBUkzCWptV0GypLYKhd6IA2DWYY?=
 =?us-ascii?Q?srjbvoI7nhGazFE9Thg3ivbx5M8WcGo9nxRx5qlI+5f6NIvO2YRW7Hnpo14S?=
 =?us-ascii?Q?samOGXGUeOgDWCzuftYAkzq9z0T5VBxdP+9Jt9Zuha+HBLaAp/khb+Bgswgr?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 034adc52-0192-4e68-706a-08de1bf45478
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:48:53.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE+TLsXXX64LITqK+ftnBoCOD/0X1wY/q1eCnDlsI9tKAtrGsNzosfdv/24FD89p58I76g4bzmsGvTQlqQOLpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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

On Tue, Nov 04, 2025 at 10:51:40AM -0800, Niranjana Vishwanathapura wrote:
> This patch adds support for exec_queue set_property ioctl.
> It is derived from the original work which is part of
> https://patchwork.freedesktop.org/series/112188/
> 
> Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> property can be dynamically set.
> 
> v2: Check for and update kernel-doc which property this ioctl
>     supports (Matt Brost)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c | 35 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9f2f19dc1fd3..391b2f9a2846 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -209,6 +209,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d36d018d7ba0..c96cc085e8e8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -762,6 +762,41 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  							exec_queue_set_multi_queue_priority,
>  };
>  
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> +				     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_exec_queue_set_property *args = data;
> +	struct xe_exec_queue *q;
> +	int ret;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->property !=
> +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +		return -EINVAL;
> +
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
> +	idx = array_index_nospec(args->property,
> +				 ARRAY_SIZE(exec_queue_set_property_funcs));
> +	ret = exec_queue_set_property_funcs[idx](xe, q, args->value);
> +	if (XE_IOCTL_DBG(xe, ret))
> +		goto err_post_lookup;
> +
> +	xe_exec_queue_put(q);
> +	return 0;
> +
> + err_post_lookup:
> +	xe_exec_queue_put(q);
> +	return ret;
> +}
> +
>  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
>  {
>  	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index e6daa40003f2..ffcc1feb879e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file);
>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  				     struct drm_file *file);
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> +				     struct drm_file *file);
>  enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>  
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 6734ef7fada1..d5162a3a89db 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -106,6 +106,7 @@ extern "C" {
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -123,6 +124,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
> +#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2286,6 +2288,30 @@ struct drm_xe_vm_query_mem_range_attr {
>  
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_set_property - exec queue set property
> + *
> + * Sets execution queue properties dynamically.
> + * Currently only %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> + * property can be dynamically set.
> + */
> +struct drm_xe_exec_queue_set_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @exec_queue_id: Exec queue ID */
> +	__u32 exec_queue_id;
> +
> +	/** @property: property to set */
> +	__u32 property;
> +
> +	/** @value: property value */
> +	__u64 value;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.43.0
> 
