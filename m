Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B385CCEFC21
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5126610E20B;
	Tue,  8 Oct 2024 16:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7N81h2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1F710E20B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728404263; x=1759940263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ROrukDwd+6hm86bKyUhlSVbfs1cGrrQ2hSp7P6WB8/s=;
 b=K7N81h2/AOLFJqbDO513LcMch2+FV0gg/UaDd45NRoYJKUf2wX7yRNrb
 /0B/Mj2bFgKwo6ol3yRmzygtHP2B+DDs9Uy/Ver2ky0pMQmbmzbajX1rB
 0m0vAJGGMfjKJ2R8NNm7hE4VDmeKUviXXh/aGQqTsbifiE137fgclc8aF
 0EF5tbg1h+XB7vbBxi4pqeygSCbGBFlWTGfeE93MiVWI5TviFilTvFwBU
 ODfBwsWahZEN8e8vUtbQC3tJV+SHC56fsSrToYLFeLxxbakWkwRTjlELn
 NpkhIkm9/+wMfFM3RSRZEXI5zI0y8+RZ2N52SiQFugcyXCwg8zKhJemf7 A==;
X-CSE-ConnectionGUID: iRUEZrUCTj6brN6Lq4yKWg==
X-CSE-MsgGUID: lOJiaKAJQ3SN/RmS+FEC+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50151041"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="50151041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:17:42 -0700
X-CSE-ConnectionGUID: OO0E3bcNQJuD+zc66re2Wg==
X-CSE-MsgGUID: e/lD6kaITK2mC1ywQlxNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76148176"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:17:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:17:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:17:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:17:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhR/EAaoNMm173DgKe7kG+Iih+fZBVxEGLw90m8yhgJfzn8pTDAXYU9olPveqdwsiuMJ4YiLzUqn+uLCAUnuoQkVrw98Mzrzmp9xGqnmp5eAsDx5ThY7qlzbqYhXxcMLZWaLXlEbqHK2HmeyDEwmcWo9bULtjsoWFQz6G1H+ox6j0SmDjFM3NkhLbZZj0xs1AQ9OJSw2j4ak/6+pPb4O/fXs0x6x60Y0LqE4Fls8AjxT3lfDODH9rLl0DTSZx6RkRX/cRehEiCxGsBfIy2i118SpMtGn53LF5gBI3HigAOLwvDzCk5NzJbBovefXbL6FzqvTQRmUhRREzXAaLS2+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jus/vqZ4B+JIp/8wxruA+iOKMiU2s3jKR2pCEoTcGqo=;
 b=CeM0hKZ+mLFiJLCfyCCBYrM0NO/LB1MOQ+qIGtIaywpiwS2RJavdg5CyDA68GS7bGJpzI7ft0n7o4yV0bgtJthBn5/1VqePa7zFx2BFBM0p6r9bL8URbqPcYK7dQ5OgBXkpZqNVZj5A8WdWex2nGFWIjOmwv3ba7tjp/OFgdLeGPIMDguntnUJIOhoCRNYhJGvMUe0F+MOEg5/FtYpoKFJ9k8Ki+Rlo0DZCQFhK+OxOYM/3hm7tJ/GB8NHK5s+GIZxRsc4KtLQNIoMQeicCg6dzivVdCjDXJjOKGqJVkTxLl2FQxpOVHufbxEKi2867OcNbYl0sZH4Cslq30O4v5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 16:17:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:17:38 +0000
Date: Tue, 8 Oct 2024 09:17:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 3/6] drm/xe/xe3: Add initial set of workarounds
Message-ID: <20241008161735.GH4891@mdroper-desk1.amr.corp.intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008013509.61233-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: ffebffdd-e716-4310-af6c-08dce7b4b9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xrK4ONZvdIdxTV+TixhnmiIo89uzDAlp7OB9jVCoSuh5aUHo+99u+j5YisOe?=
 =?us-ascii?Q?dQMN4lGQfMB3XwQ84eoexavvs0vgMoON0766vMuduvQ3c/0YbOOPhYcNKXBW?=
 =?us-ascii?Q?YIVy+F2xpebVSm4Z90vI8nhSy9UXSyQwH/tyD5HXozglpFpPElcIpEoxvImK?=
 =?us-ascii?Q?xIHvkBPz7mi9riFRdd16QEiFy7Yb/5ESuIkfDOLk5zbWbU1LGSwyI0jNdteY?=
 =?us-ascii?Q?ThDXsUNSd38IlEj4G7FB7xNFZNqSXqCh0CXcQQ21W23HxUIg86tNgXXCt+Oe?=
 =?us-ascii?Q?PK9Mb9XilJVtoQksarAaPzE1TEJUWqIvXmF4xyGPqZ7smwPPQt+Ym8h5yHkA?=
 =?us-ascii?Q?fBYoOjqrdzaITs7xpVPEB7iWIJy3TH5klEGAT1K6GlsWs7SrUcpBWPMmx827?=
 =?us-ascii?Q?L19rIPjBOioPiBBvdkBvJ15dUJlf5Yew16W0uOoCF7PmVSx5lJunvL44FIcd?=
 =?us-ascii?Q?Xf1E67eLB3UCLpSKFeKPmahiCh2JPS9gLqeTVL0W9rVrYAEKFsL8DmBr590c?=
 =?us-ascii?Q?Hwk+dEu5fSwuZ4i4fKumBP8mrVcuVnYgj6hoxigh0RnKO/J+YTjoSzTAUyio?=
 =?us-ascii?Q?gX+l1YAri411m4kLwfpadCTcfclxxN/MYZP3IFRbqrdW4fiUhRqPTpeHi3Wx?=
 =?us-ascii?Q?8GeOcHO0qjCies/7vv1JMqOj6WQNQgs3Swk7qWjdBRCVmSGBFwXcSnyM7y6d?=
 =?us-ascii?Q?2O5NNNHWwy786QtLl7jlkKV7CSsTYysWZXIRB27k696xByMP35uYOXyRia1c?=
 =?us-ascii?Q?zqnz/rqVCZHHiLXNKv3u6YCpP/VPgE5A/8PHWNpS/288TwiXtM457xWEdGpo?=
 =?us-ascii?Q?sRUI+IoC/hBGsUUPC5brbOnY8YoLs7sQCSYdoAuSi5So8t4qxOtQ5N6caI8E?=
 =?us-ascii?Q?tF0fawt0oTIGmSL1aNiffrNreXndnhQCrCrbqOImtjd7P4FArrHVEPaRRxcn?=
 =?us-ascii?Q?77vjtKqFmuPXVeLjCf2YNI0jj5RViEcTYsKV0Wq8Nrcls+uEDikAK6so32dJ?=
 =?us-ascii?Q?mNyY2agfh9jljgfem5WpHVYDmJeaT/o06i8K8ghnesJfZzFrMuHxbJG8iyAF?=
 =?us-ascii?Q?7somfWpaJZcfNqTAxi6Emr3yC1zBJiuxOyDyeqsnaU9v4fZ9nryLnDpSjsLJ?=
 =?us-ascii?Q?aT8yClpylo+L54CM60QZt/NPERxQcq5B6dac0UxOaSx1KMTO9W8LsYqq5SND?=
 =?us-ascii?Q?lVO+f9rFJL2BxFfK5HUxheU50cQ0aDZ1uBjr3ifrliNccN9nEbh+cOsf82By?=
 =?us-ascii?Q?1IOiIDEjB0PJYqgIeFzNllmyusJvUP9Y+LiyBoOfKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pvom0CsX3CNtAdiMfkh7uClxj8Zv+eui4TPgoYIfiovS5HTo4pTdDwutKHA?=
 =?us-ascii?Q?UnlsBefFQMr80PqbOGOlwYEzJ5/76XoNeCgv3j5gxjU/L5V9yI77taOA+Ddd?=
 =?us-ascii?Q?USnMAskZlfwo4Bw2eHdRYXXvxNwy22nfskcUO5wsNqtDOvq5ogRQpHaXQD3r?=
 =?us-ascii?Q?iVHoKjT+ID3hWtO8vF6AX+ZC3d5OCw+vU4EISAZREP7FrdiLO/f7GLqEpyNs?=
 =?us-ascii?Q?/kvp1YBMWiw+gh4/PpfvBc2yQtOh/YUYtHK8tJ58yTDkNIdEOA99xmLdiWhn?=
 =?us-ascii?Q?PLCqHBI+CftIzZbTncOMNsUSR/LJETIR775u1SDMcNLN1oxy4JwAw8+YEky5?=
 =?us-ascii?Q?Ya2giE9ekI42BeWRK0rUe79PfR0vDINKDOxHYE7Juj9kV8h9mMox+Hah1/UW?=
 =?us-ascii?Q?vI2uU0uaQT6jTSucGhT3uMJ0KJXqX4M4SSUwd+umuW6AGLliIPrxaeAVE8Xe?=
 =?us-ascii?Q?ZTnBu25e9bBbbwCQvO88DT6SiBjZzbMMFiajtoRxTd634OpevuDGpv60NwTJ?=
 =?us-ascii?Q?5wiNdYmyhkb52JzTAzrfivWbz3Z24r7PGelUBLPtdg/Zxsm8p4Qd/RF+U2WP?=
 =?us-ascii?Q?I9qGext/TWGDDAIH1Rpn19VMGkkUl9B8DuO3HVBU4DuvEnXpfNcKDH14/7Zn?=
 =?us-ascii?Q?JVIQA7qztzxmgqyrJ3F9S0n0qBqggDeBDYX5r25fu/xCs4vt7G3UZuiPtCIC?=
 =?us-ascii?Q?LEXqRDMPrEJrrMZRpQHMVEc+KJWN2Wnc5Ja2VDbHOaiI2zG9bXMqbuqF3Acr?=
 =?us-ascii?Q?yMixROd2XuB95pXd2C1wFoEmQhDLEiCLHLdLChqhM9AHfhrkfUQ+o66XE0Ph?=
 =?us-ascii?Q?3RYJyRnkVFrFp+mIKJi27Kb5INK9VwQaZ6OcZYEsbHI7fSZ4j3y2tPxGwL52?=
 =?us-ascii?Q?UdzdtgvvXtOsdLu7q8aPCzqD3QGDAiCzNCQgWEz2RdVpysJ3CUS/S7y9Kl2q?=
 =?us-ascii?Q?X6R9yVnUg9DyE0r8aSdAGX6mJLpBhL2HRbk4PUu3XL68dbvRsgsa3iAsqiTp?=
 =?us-ascii?Q?8Q7OHr1so/2OmosmsxEyM3pmCDXu97/XQ4eu7HNO+L09Qw1lCEqBSvUZx1JS?=
 =?us-ascii?Q?nh3PtLDShAycvcz68mNM/za1uX8CmvUzVjMAe3IllvusQcWamrtD5v4NGVTt?=
 =?us-ascii?Q?3J0TSJBtc2EMHpxKrveGniZuMgjRGI/9/VMHKNcKfS4+DOMy1NSzUNEdtLjS?=
 =?us-ascii?Q?5jH5mDsf2tcQ6YFxNNKSSkxFIX2oT0xZfhyYM0dyBGiOrB1IXcAJtSjIZnr5?=
 =?us-ascii?Q?yjAbPXJagYGuDRr3blAy8OqOUrP52QjtwsxX2f3AzyOd+EVvZt2pZQTfXYHj?=
 =?us-ascii?Q?x86VrgXi2b/rlxZzfXZ/l7+7Gk8T9QXxy4m40CwtGbma0RkLRvToR+FWUmo2?=
 =?us-ascii?Q?DbK0rFHSuvv1T6I8SJMD1t3omdfzxJIhwldYKj4iCYZG8+qYmtBNA+Fh+l9Y?=
 =?us-ascii?Q?GtJlTBTbEtW8+BE4Q1TcHkJdcOUqUSjS+DqFaZWq0kWiMAELYnKpdAt0m2PH?=
 =?us-ascii?Q?Apsjn/7E/kooveiEBDMFdXoCc4IPI6tRTWuF6LG3y7r1Dy953jLGsD562Myt?=
 =?us-ascii?Q?ZIFu+yTpA8xN+WhLF6mWMXibJI8cOG/cpN2TVtdCbuuYWlO866jG/myosgsV?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffebffdd-e716-4310-af6c-08dce7b4b9fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:17:38.1194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBujUfqjEf8nNkqTKkn67W9ZD/d8w9nL2BqZ3TBH+vQ5kdE+/BIeuGivgE0dpG6g6IElHy8yAxSOTWcHNtDyJ0SHqTdoVitliev1hbsALRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

On Mon, Oct 07, 2024 at 06:35:06PM -0700, Matt Atwood wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Implement the initial set of workarounds for Xe3 IPs.
> 
> v2: correct steppings for 14021490052, 22019338487
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>  drivers/gpu/drm/xe/xe_wa.c               | 52 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>  4 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..7c78496e6213 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -186,6 +186,7 @@
>  
>  #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
>  
>  #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index fb80042cbe0d..ac5a9ae94eb1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,9 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> +#define UNSLCGCTL9454				XE_REG(0x9454)
> +#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
> +
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 94ea76b098ed..a47f43166651 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021871409"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
> +	},
> +
> +	/* Xe3_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14021486841"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> @@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
> +
>  	{}
>  };
>  
> @@ -656,8 +691,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	/* Xe2_LPG */
>  
>  	{ XE_RTP_NAME("16020518922"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(FF_MODE,
>  			     DIS_TE_AUTOSTRIP |
>  			     DIS_MESH_PARTIAL_AUTOSTRIP |
> @@ -703,7 +737,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
>  	{ XE_RTP_NAME("14021490052"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), GRAPHICS_STEP(A0, B0)),

As noted on the previous revision of this patch, this change is
incorrect.


Matt

>  	  XE_RTP_ACTIONS(SET(FF_MODE,
>  			     DIS_MESH_PARTIAL_AUTOSTRIP |
>  			     DIS_MESH_AUTOSTRIP),
> @@ -739,6 +773,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  
> +	/* Xe3_LPG */
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca5060146..51d7208d7681 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,6 +33,7 @@
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
> +		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.45.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
