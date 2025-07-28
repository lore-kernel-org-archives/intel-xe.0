Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84314C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561310E191;
	Mon, 28 Jul 2025 19:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsNBeQfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4C10E191
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732526; x=1785268526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mDnRaQgLTh0Ys872lJBypzUbKLdaw8TaIMtY+RH2z4U=;
 b=WsNBeQfRkScArtbokFh/5Bf9eRq/O4oREysd+DqVwPRoqXB07DdIbjtN
 m+n0hpUNumfLSFDmx1yWRTtRPB0ABtTp1HFHS/h3Qq9DWBHgFd1SKnoet
 VSy5eV6Zn5r6oqpZe1LMMYXvoPiokBZ29PhLKK2LoCaqhY/eFYdn52hqu
 PtlNfiq6TRr22//XXTLLMcNqCVkKtooCxO5fSLxzeTEDgNopZGKXDiJx/
 26JNTZL0xV7MNvA/ViCJVeIK5jnEJObvgel02Oyki2g5z2uX4Y3wLFRve
 DKC0q7OtorxUzWNH7OKQtCxYoeq/L6JUv/eTs/8blFsSQ50bP14/8NaXf A==;
X-CSE-ConnectionGUID: 5dAFPihCTJyasvqBltbs6A==
X-CSE-MsgGUID: WFJNTceOQ/OoacpBr10Iyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58612237"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="58612237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:55:25 -0700
X-CSE-ConnectionGUID: dJ5VwCMmSPeIZ8fnUaPXuw==
X-CSE-MsgGUID: SMOekpOeTzqFbxjNZb6J9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166983770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:55:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:55:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:55:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD96vTgfs/946uoGlEmpA40QvZfJq2FbMj8r07Cu867+CgOVitrs+pXXmLPZpH/Ij+r/wOQ6H8Dz5qe0kZO/T1Qr8c40at0qYBlnrZxcNE+xojjPtFYGdCL6vSmnvhJtGFS8bzGQ8jrsVxeAK+c1tIlcI0hXkrryZJ9RulIycOOWUn9srIvvgeFdrQ5xHiVtgMO4xzVLIBunXuacSrkZ/0WoxCxOtnHqbbXLDuNpOj9JzQHV/R1dhin5ZSC2/EizfvpX0SfBzyfFyziN9IgJFxzLCiV70CI6qrtMZU2WJQSIdqtF8rXeDJv6NmnCS2XWvpqB0sOBCJjErvk3F1TeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICkoXz0DkwIqBJ04oaX7zwkb2NQX33WnVEvURdUkp5g=;
 b=U1WxvvLPmE5bm1Rgy+pNMOSIh6Q+sle0W1eLCzPsFaRAJZmRMQ6ghVy8zNRFV0PaWXvbJj66iw2a3SOAj42znF9j4s6jGCBMZAuf+72kt8/R0K2U6v3rHdtYQdzbed/Fq34pS65Li0Mv+P1G+znjBRmqOlv/w26GRv8NvGzMOFG3gTOXP3nZk5FxiMCYhytbeVUhy5DQJVHcv+7WDgvA5Lrmp9IPCwyiWVq7agR4TkH2H3L9lZsU9e40O4Nj0D7LAgx0eYD3FJzEyVRgPAf5IbqFYDFN+Yj1mtEIUQGkiPCnpODNj0e6H7VIguxLyljjB/ZN00YznwEDSmpB01nbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:54:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:54:41 +0000
Date: Mon, 28 Jul 2025 15:54:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 05/11] drm/xe/configfs: Rename struct xe_config_device
Message-ID: <aIfVfqGZenHMeJaO@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 589c0ae6-211e-4e44-c4f0-08ddce1097a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?19LolteXmVowfifOynDQkUvmSOvEzJGsy1/gPDXAtjSVbF6wlgQDDCiL7dx3?=
 =?us-ascii?Q?jXuOL+kOUkfmMBO5PtTw9VP3UZsrMlu+kByhugyAZwVZMCoCfzU1nWWAt6YO?=
 =?us-ascii?Q?/gO0v0T3nFDwBAC7zTL1A8ORjfZQkShunIez3lkHo79RffrB1f32mv0zEpv4?=
 =?us-ascii?Q?fjw7DJDMHImWXY9sKObLh+MJ6kdI4A8ZELRcwVzsCwBWz3dt6K7xy99OzsUD?=
 =?us-ascii?Q?OrHpxUOKoen1rSvdGrxWMYb9s1lmjdTkfWisaSNr4PEuztz7m8DEfFnJd4Qf?=
 =?us-ascii?Q?xLyRMyrAnRc6qISlZFikQr4q63IOrDWPgfbAz7NDXvpxSOs4is06QTn1/odc?=
 =?us-ascii?Q?tzN0pWpyRjYRijRA0qYSd5x8vjX2P+DSP9rAiBstWOmpfAm1NSTbJYuMKFqO?=
 =?us-ascii?Q?f3mHjZ5ABfTNQO5gKfdLgQQj+TXoV2AX7FNs1bbQObnHX3nOnbZdLMnaN5hP?=
 =?us-ascii?Q?iChUL4bpkuanejG15xV7ksUUivaxzDmJcDmBweg9zuEfRmTDiKqoBH06xt/X?=
 =?us-ascii?Q?HYT84ccG6zCSMmsIJB3kiUcdP5eAJs+xbkN2BM24gy6CYxuNJYC7DHroyQG0?=
 =?us-ascii?Q?iDkdr99sbLxusv8PVpIc26ljHU3RbwEYjHteU3OuZLvGr+w6C7KBvWpxp/qQ?=
 =?us-ascii?Q?viP4nhZPQwB3WOvcRKNm+X8Hi2mlwSKRt3HYHGzCqx29/PyoWWMdyPMirUTh?=
 =?us-ascii?Q?Hyy1RIsKeANFvYrTNCuLZSAVbWDqEs6kmGP6iufIDgYGr19RMMz6cKuEMBV9?=
 =?us-ascii?Q?6N3cEa0x+QQtxA4s8RjSDcLDcBwclHkadQClZwlYRQZkz4+jlrJ6ICZtSLAB?=
 =?us-ascii?Q?hcqMr4nJJr4uRkBWzAiO6B0prITpjmpJkSwfuc2r3ETPh+TbZTBFXFAzujQu?=
 =?us-ascii?Q?630B5ahPaksA9aoX0BxmRRROge9eBmwjYz/qL5NlfjePKiJjNXhlxKMSiyKr?=
 =?us-ascii?Q?qkW7nWgbRu2//7TYy/vlVtZTw+UzOX/KMrEpgN1tmYKAWbfjNsYpmnS2LHLF?=
 =?us-ascii?Q?WD2vOgKNwZpIPyBL4aq/YE3cZlGhbbUNs8SmLkJptG7cDVsjldcdaAv0mSgO?=
 =?us-ascii?Q?JOYOIrGQQRqysXgaN5U06dhYBSg0lXhQrjQEBRiLpZKHL4+7HMEBPdobW70/?=
 =?us-ascii?Q?g12smTz/dO+xWwwRb44O5tbSBYmg44rwfDsSmHl9zydoaOU8eIQTMvKK+NCr?=
 =?us-ascii?Q?O6nwFUZA2omYl2q4L84xGsUsOG7Advnp2hQMfb7nh40iX5UsVwM3YKKUx3no?=
 =?us-ascii?Q?K4/GfM2ytXdT+NRG2/umCkTAi2bMIfn2W72irleK0jQsSbfIQhA4+aYKJsRq?=
 =?us-ascii?Q?D1ULRDUe3Vpk8N8PMM9YbHUnFVxHXOQEcJP+gOssW0U/ck8YznKTjE19EJnr?=
 =?us-ascii?Q?ggBoi72UlULJ4O+h2KwMUeGJPAQA/vAvMDz76STfVC9oGRmxowTJKB+Q8fvi?=
 =?us-ascii?Q?PX1seqVrQQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycfJcxIfQD/BhS56kKuelgbdsGK7Gw0GXe0KXu0v1nI+aR+3LXEaeSvmBS2L?=
 =?us-ascii?Q?/NRjR8515VhTRPp1LOXgCnnCsUJeYtZe8ylb+b45v8T2dX4mx9NMCAnsXBzi?=
 =?us-ascii?Q?a7dg5ZPzt6KK3648XHJ87qo1pbhZ79oIFvfLuQngJxZhU1tOOb0UXghZT47J?=
 =?us-ascii?Q?0uu1PHgnRTMTYoKMRmxSUwMR5JZfSBAiWsfqjxts73Xa2ebPDBzzg8kX5dJs?=
 =?us-ascii?Q?JPc0wO1X7YOV9IE6n6mTr4ETxsEf16JVC1gyI4LqqXa/9iu2F85yT1tEpss3?=
 =?us-ascii?Q?zUpOh8NmLbUw/2gX+fKNZLnSmEb1nPPqBc0GTlekxKjh9zoPZgslyiG7OaeM?=
 =?us-ascii?Q?fK2WY1GzHeiIXFeXyHnWlfUsSg3T0hKdMPxoo+dfixNtXHS2eCTA+e+sb3qR?=
 =?us-ascii?Q?FALHEtewAPyHO/d88Ssvg2GsYi/0K6MX4LuQ0eKEuyzFmCm5KmUzE8c6m2r1?=
 =?us-ascii?Q?VgEJCDzjOBIrht+mQQDzXwKP6UofGE3zkQ8TU1KEkYHbjau8bx0TaXirq+NI?=
 =?us-ascii?Q?8Wugm1QmdQz3/Cl7vECYuGFBkUSGqzw1bm6Tfy+bnf3tQ7UpF0IuliGdWXp5?=
 =?us-ascii?Q?rcJbudoeQb2pq+LnhnETM+9mQnmOlLFHr4357o3ej+hVnbI9Yq40Epr21t5B?=
 =?us-ascii?Q?uanE9UkF28c8FyE73BBOFjA6hV5H7ECJrsS+0qiCahyZegBVvK6nQWL3NjGb?=
 =?us-ascii?Q?2zqjJFLEgH2ZLkTmfOqfRhoyaCDOsEGyLyfR6woHfxxWXK+6+sv/1Kqxp+LW?=
 =?us-ascii?Q?ayenl3gcMB3sU74S70FYpsRAIhmBgNS3E1BjyKxvEvmCVWSkzR+qpuM5ey0b?=
 =?us-ascii?Q?Y26IgAeanU9hl2YmEr/etQ6XcC5KHA/7j7Tl+ebdpjIj9nF+fXoj3Rf19yGU?=
 =?us-ascii?Q?gSBQnxdnKtmpyZwR0v2Xu6qCKuzER9jQEC9jqZ7CLRIYTlOQAgWn3jz+d1Nu?=
 =?us-ascii?Q?ippvekfWv+lFb+TLr7QlvJEZBXsirsDwaqtCNMBuhH/Fe0OOiWmPYgwjq0yS?=
 =?us-ascii?Q?FSnjZkPIUEWhGV+lvlsPCfn8OXcntLBLiyKeJHSPx1NnFXC61ZvGVWgOhQs4?=
 =?us-ascii?Q?VmrvQ+ZUpaMExOzkcR9i8B58uYJGo+EwOw4GQsxMMEZydGDs02aMnCNrC8VK?=
 =?us-ascii?Q?aVo0Ovc7NpWCz0pPS3RchjTKN3gMePTz6uaFP/HEWI/zfDBqT5KYvbyiosMw?=
 =?us-ascii?Q?Z4is3Mgu0WiQSf4RbZKhwa+EL5QOGo3lkK4ljg+ndXGZEUxsVr2ChtqlTdxT?=
 =?us-ascii?Q?OPdFShUxC5SeB+4J1+kK+cKrUX+ufNWUIqHMKMivCKXPeNztWDF6vF0aKF+f?=
 =?us-ascii?Q?ihBhkH/WTdg+/6MKmObB26pkk4Oz+mC4n3k75zOMxHahIAKvLFHTcsch44ku?=
 =?us-ascii?Q?GDkl/SZ59FxZ7bwhV6Dkz0iqtGuLsfa2/HqY/87j3PZRR3cL63Hyo2mGlbDE?=
 =?us-ascii?Q?TQjSa/irp9E5uKeZN8Rm+zoN3mXbbgtUKO0yGY7XTynnZX8irc7IbGHZC2wh?=
 =?us-ascii?Q?RkkVfnAT2Bq9AHxUeZvmPf0rLyr3N5gC2kzAp4N/xUL0BH/ue5Z9YM8tDuSY?=
 =?us-ascii?Q?i5n63SubcvKvBYBzf+aGrfzgTI8t/0qxMu77tDL1v+hCr2Y+Aq1oANO37Zpd?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 589c0ae6-211e-4e44-c4f0-08ddce1097a9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:54:41.8448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk2pLlNrv3Ld+hX/5L+qvhXjruV+eC5CeWlM+mFRVQCxgEijgRT4WEVUSHXkIF+OAm7yIA41d6QzqO8bPG8WEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Sun, Jul 27, 2025 at 07:20:02PM +0200, Michal Wajdeczko wrote:
> Rename it to struct xe_config_group_device to better match its
> purpose. It will also help us to reintroduce in the upcoming patch
> the same struct name but this time to hold only configuration data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index e32517afae58..edd52b8f0543 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -89,7 +89,7 @@
>   * Use xe_configfs.su_mutex (also accessible from group.cg_subsys->su_mutex)
>   * to protect configuration data.
>   */
> -struct xe_config_device {
> +struct xe_config_group_device {
>  	struct config_group group;
>  
>  	bool survivability_mode;
> @@ -114,21 +114,21 @@ static const struct engine_info engine_info[] = {
>  	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>  };
>  
> -static struct xe_config_device *to_xe_config_device(struct config_item *item)
> +static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>  {
> -	return container_of(to_config_group(item), struct xe_config_device, group);
> +	return container_of(to_config_group(item), struct xe_config_group_device, group);
>  }
>  
>  static ssize_t survivability_mode_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
>  	return sprintf(page, "%d\n", dev->survivability_mode);
>  }
>  
>  static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  	bool survivability_mode;
>  	int ret;
>  
> @@ -144,7 +144,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  
>  static ssize_t engines_allowed_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  	char *p = page;
>  
>  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> @@ -199,7 +199,7 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>  static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>  				     size_t len)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  	size_t patternlen, p;
>  	u64 mask, val = 0;
>  
> @@ -236,7 +236,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  
>  static void xe_config_device_release(struct config_item *item)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
>  	kfree(dev);
>  }
> @@ -255,7 +255,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  							const char *name)
>  {
>  	unsigned int domain, bus, slot, function;
> -	struct xe_config_device *dev;
> +	struct xe_config_group_device *dev;
>  	struct pci_dev *pdev;
>  	char canonical[16];
>  	int ret;
> @@ -305,7 +305,7 @@ static struct configfs_subsystem xe_configfs = {
>  	},
>  };
>  
> -static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
> +static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>  {
>  	guard(mutex)(&xe_configfs.su_mutex);
>  	struct config_item *item;
> @@ -314,7 +314,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>  	if (!item)
>  		return NULL;
>  
> -	return to_xe_config_device(item);
> +	return to_xe_config_group_device(item);
>  }
>  
>  /**
> @@ -328,7 +328,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>   */
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct xe_config_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = configfs_find_group(pdev);
>  	bool mode;
>  
>  	if (!dev)
> @@ -349,7 +349,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   */
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct xe_config_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = configfs_find_group(pdev);
>  
>  	if (!dev)
>  		return;
> @@ -371,7 +371,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   */
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>  {
> -	struct xe_config_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = configfs_find_group(pdev);
>  	u64 engines_allowed;
>  
>  	if (!dev)
> -- 
> 2.47.1
> 
