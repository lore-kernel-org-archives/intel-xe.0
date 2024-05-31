Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27837C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 17:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE4310E054;
	Fri, 31 May 2024 17:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExCKpah6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2611410E054
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717176564; x=1748712564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=97VnzyZxRG7wX6DsGTV4bWz11Ms4CiUcIJmFl5zMETU=;
 b=ExCKpah6xe4Xf9jLDQfjwA+o28YI6GTSZkh6KCakL2UaGM0dhbF1Ajoa
 PNGAa2j20VioZlXAMg88J3k2MAp7f7RtqnnwsBlTgU9OT9jvg2yfC3e1R
 7iVtA8h/UQMMORqDHPz1+Num56Ru2w8x4n39+NGvj5EkV9lHnsLh7V+KV
 ZVJdWOvx6Du7vigm0wb62YIzsDQkD86F+mlfo7dW5ox7cJSsJVU5j09Vh
 v9YiOx7D0a2SQq50CPDuUYq7VDASvtBXsCWA6XMTORnjBQk0MK0BFtCUs
 5i9UMP1zbzvlmyxK8eGtrW3Q6ev6n7AkPSAwqXSgMqOVcR+9HTz4o981W g==;
X-CSE-ConnectionGUID: b4SdvBJERf6WJAezIrUSEw==
X-CSE-MsgGUID: KRmjXGKDS62DzVO5VEDXEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13853759"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13853759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:29:24 -0700
X-CSE-ConnectionGUID: 7TzP2q+eSxOIoRtZR8WeYg==
X-CSE-MsgGUID: 4xoGhXPySUekb6+7b3PoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="40673744"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 10:29:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 10:29:23 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 10:29:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 10:29:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 10:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD7oQRpZZ9mc6KjWX3+x/NF9Mvdn66nDr81CM0G4Xd7U9dcydg112PGorN2p+bUTG+7xnkVF3FvdteHh6K2C7Yyq/6apHRbh64BhwHa4RE/KUGktsOmrcDTqfukK4jYIxDwZnLgog+L6nUBXI6R2An+Ky5ZmJ2od5h5nG7f+XOqLS/pTBHSCOdveiwPX/Av3+hEx1oJdYhoDlANDOslOk5tZ/5v6/SOC0kTJWugOrEfIs1dWo2PajUen6GR5h9tpd+uXFvtE/rM5G6+swsdMPKdR1XJDBbj7P/hPG4AAMUZwnKL0WLvQBXmkjTODceCHPv8RLCJo9ZYNUWCGH0t3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Swb006fsG2u51JNnyzQw54VWz3oWd1pLcvaHowllo9A=;
 b=ITUv0o/BkzBxHsr9Jd5gsfQqoqKesA0qQbYkWTkjiTw3mM8C7sb7XLeorLJftjm8W0y8NM0SilNxnl1Z9au/Hc/H7IXjqJBXrISE27o4oHQzcJieE7UlX8sGHbxsosOu8VoBVQEUnjTFUQer9UvTuq8Bqx8/fnmO809hRMYa0JDX68zff+KSvsXT0XfJZkZwoFKgYMTIbkisLBCBSvTXShpPcKEDfaNbOvwch2wn9+KFfeWJxq7mqoOknzf5snFsaVbVsd55xT40EbdAupNhtyIAm6XwXFLonRMf51xRPNw1b5vS5xhK1qnRLtW+CiozH4V4ldm1+ZpsgU+i/j3F2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4856.namprd11.prod.outlook.com (2603:10b6:510:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 17:29:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 17:29:19 +0000
Date: Fri, 31 May 2024 10:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V4] drm/xe/xe2lpm: Add permanent Wa_14020756599
Message-ID: <20240531172916.GW4990@mdroper-desk1.amr.corp.intel.com>
References: <20240531110022.551477-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240531110022.551477-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 90230944-7b2a-4b90-3722-08dc819733da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HVaKjHJQ44DABwSdbm1ohVlNI22Seeuaailu3aP25nUUuHirkMBgA0kXRF0+?=
 =?us-ascii?Q?cbL0+DZugIPezl9a5kkKmksF8f/tBtnBo3Ns9TcPZsyxBSCDDaOs0mwLYoGQ?=
 =?us-ascii?Q?r+IdwuLzhNfYPIO9uFhFQwNzDUrEEnareAC5eYgl6qr7TWF+QZLImRV4ySxR?=
 =?us-ascii?Q?I8PPNeHNDHIUQMY00rJSFoQ7Y5M02g8qLf33lGUCMJuWuCBtQpaZv3oA1D2S?=
 =?us-ascii?Q?bPm/pT4D8trHbV6/K5P0XyH2vawM2u657E7vAPqr7bZoBCUAHax8fsFBGdp/?=
 =?us-ascii?Q?sN5kGo3MpM+QHme2Eb5VzfFtqqG46Y6zP0NX7lif1RQ5AKGchwfF0EesN6We?=
 =?us-ascii?Q?Py58Jhqef+dDAtRBIDsww8ExaPqgOorlheXxvcoPsMpc8IqtLcygeFl7Z6gN?=
 =?us-ascii?Q?FvSXwAJpzzpNxT/5El5VHNOtjUcixV5VEd1PH7MG0t3tBLKoDKCnLBgkeeEi?=
 =?us-ascii?Q?4PnimwitOmS7fYVBi4Q9hGZN9h8hALCr5++IvJ7Ptjf+SLrrWIXkGKGo1X+p?=
 =?us-ascii?Q?GPwc3gcV6WDMBJo/W/8kzB82Ap7sVy4HBc2OlhDvFSmdt0jS1f9FPOu+NCod?=
 =?us-ascii?Q?ywxoRtrJzJzQozzXcHTWLeZ3duwqscT1VCfW/DKQb1+SiKI5TwVsE6WfL/N/?=
 =?us-ascii?Q?/yVyFtsMOhS2eWbTplQgiOjZfllJFpNSE17j26niSJIbE7D0XwiaOAKv5ON7?=
 =?us-ascii?Q?uoH9qA1DtUrx4SawWjDklfipsRhkTOdQtzdg2mRj9E99/KyDm4q+E+vVnxrE?=
 =?us-ascii?Q?/KNyucNI+mK07bNiqKUM4t3u7+gQHU7aVi8yGSmCN41J3aj2HxMu1RsVan0I?=
 =?us-ascii?Q?3eWUmBV0fczMhg/b1vTODbfQp9ehnOcB9eVPG8o/ZzzGcAzGbl7rZRudtX7/?=
 =?us-ascii?Q?PZ8PRU85taiPThvuldMupw7+CI9iYVQZYUkln0BolBDXsUM0Lr9rr8pjKK6R?=
 =?us-ascii?Q?a9Vu744MOxgdrSCTCXhNjUjwO8VwiC67psJO4J464oCHsrntjG7gFQUo+gfl?=
 =?us-ascii?Q?gQU0aOnQlVoyNXTgkDuXta+a74nW+Ptu/rwjAaOaqZ2ncPxDNpgcwHbynpia?=
 =?us-ascii?Q?pOkFRIvqTTKVfBpqNjeuWE6KvyCVNaduQSxmVdyo5d9FkUGdT5A7pBxVcLnb?=
 =?us-ascii?Q?Yy4xh/sCeGLN2emhn5Yij0WJp90Lu9LNvjf9EoagtFAIo1UXpDqmL6j0RrVl?=
 =?us-ascii?Q?9i0l4TRDyOkMP/wRVmzrMNnUIwJekAK1t66+NfpdP+t5vum1KRdMve8FTpgz?=
 =?us-ascii?Q?kqdwDJjLJAJ69rWLpFyThAkBbGEbbN6jqBghvf8Ilg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0SWILN/vnMK7LOSAE3mov6qPMhiYaM9UVlA0BxVTFZGLwg7wc72my8xU9q/8?=
 =?us-ascii?Q?X/jirk3LCmrhtZ875MPcgWQOofXgH1osH/DyEUaRF1db5veLQdZVnW/0u1ZA?=
 =?us-ascii?Q?LxXek8qckWmGhkQoHk+cgKjULToXD1ZehRd/ow+j4a/8H9GsJofdi4KDM0Cl?=
 =?us-ascii?Q?v7iJbJs1fOFeh0Qvag4jp6ts6Hg0RKx4q8I8FgrDW9WPoyK+ckapKq9pm746?=
 =?us-ascii?Q?yi6pxUrGsffMi/TmDMbBRlyGmInrqArlkwQXTODsA1lEGwPwvjYFSpBsy6ux?=
 =?us-ascii?Q?Bc5uA9BhwQ5ckz5Le8UnC/Df+3eqHcMwieOEWzLp1viWlKyXxglwW9kGFOr8?=
 =?us-ascii?Q?JoeC4On6KO+izjiM7Apzouo5Fr8zBWC2iGP6wfZe6vC1KvNkZw05PQmJ9D50?=
 =?us-ascii?Q?SZqvoyi/IDWDpEY8P8il/i+ZLpeWgIuwM8130jZ9Er1H/dYoT9wc/30dusYD?=
 =?us-ascii?Q?VEIensXePoU0I5hk1J2gyvN/aRAIE8GQwpVR2QbS1Z0VDe34GJ+PbK6RwwR7?=
 =?us-ascii?Q?JS9sFJU3zNDJnS899Hn2xbswNv7GZWQ/UWWmgBM0jvHC4KmP3gk1+74tRJP1?=
 =?us-ascii?Q?gVUhgd5DXCtEVUJsP4a1jut8Ro649ITtV4T32ZYN5TtF09PZIQFXeKQDUGr+?=
 =?us-ascii?Q?WiZEjJRtz2zvyI7Co4UwgOQtJzV/WDVKxQXip+pONjX+Rt1pevtDcTSDHUhA?=
 =?us-ascii?Q?rvNGn/trfhohNGQPcy1Sdqas8KWnCSkb37KfmNwO+AkgypfHh0eLulCscTMO?=
 =?us-ascii?Q?drT/s8it683cqlfX338yn7rR9M/x139kA9zcA+ouYG028rDjsA7s9JjWna+x?=
 =?us-ascii?Q?tN/w1x8ushEoSNsea7w4dauWw0INSHqBTv4TH/5jGi6D/a1CkUZQKdMYhEhB?=
 =?us-ascii?Q?9MoCc4FBorwRwdw9qtgcl12oJi6L13asn73782BFTq0TRCa3sWUB30eKQ9Nd?=
 =?us-ascii?Q?ipcOJOfQAlYuovhRmGSZFpe/0Qz2LG/2jticpd6OIU8cqxQBzberPd06QeIk?=
 =?us-ascii?Q?0YxmPhI9CTn05XGGkH8bqpPGYyMJnDifNgQ428z37Mdd2XFLYJ7fJldAbCAL?=
 =?us-ascii?Q?Sc/Obl22HHIPHK4PWQ3/xzGhp1ByAvXPi7l1v7LgP3GHZkj4Nhp/NAsblDRf?=
 =?us-ascii?Q?UaLo5IUCBD2/50UNWTHdLx1O859PYE4aLnuQssP1S1Ge0iwFaefwzepr7hgb?=
 =?us-ascii?Q?8qsxBLZ4Q5fRY+yLjYE9cuBRZgFfy9eAq2CCaGxJi3veqclPYJWFHDIuowU3?=
 =?us-ascii?Q?+mHnhnHlJUiavcaz6tEjT3xIFHLCQeVUhtKy6aOU1m3msVqu6plLBWBHG53k?=
 =?us-ascii?Q?5bXH/Im25nYWKjf5+mhvYnQ83RihLxEkGPBkrLwsQwVktm58Tkd+kDzulLDd?=
 =?us-ascii?Q?oYLRZKS1IONYbBWLHf0Ner/WJch+OADEpHwFF5dXG8lQRHHPe7wxAn/rdsjX?=
 =?us-ascii?Q?8XNtbuh2odTt9oMCuuCBNtHRMaNlLpcVsHHH3poR3N1xbEVXc/fbiFrsx4ID?=
 =?us-ascii?Q?Qg8rgCy5PFgDdbmaDqpqAyuVHCTgoST+DWtpML6jwRrvUKeoOAgjqJgWIYhj?=
 =?us-ascii?Q?0Gg+RYUcxRtA2wAy9M3s5eVUWFBo3/3h6fnTx0PbbL4nMTN9fVW1v65+1xIp?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90230944-7b2a-4b90-3722-08dc819733da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 17:29:19.1500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84a6M9u27rj7V2dvEps0iJbe2zsBSrb8OY55q+1k4eE2GoMiX8RW4oeR7NZkFaVO/a6hY27eMyMBjnI33bBRZMRtxVGVbka0f/RfPLWphSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4856
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

On Fri, May 31, 2024 at 04:30:22PM +0530, Tejas Upadhyay wrote:
> For xe2_lpm Wa_14020756599 is applied to all steppings and
> when RCS is present on graphics GT.
> 
> V4:
>   - Make it part of lrc wa
>   - Check for RCS as rtp rule
> V3(MattR):
>   - Rename rtp api name
>   - Use MEDIA_VERx100
> V2:
>   - Remove engine filter video decode
>   - Fix typo GRAPHICS/MEDIA/s - Himal
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_rtp.h | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_wa.c  |  7 +++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index fb44cc7521d8..01c32a932780 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -323,3 +323,9 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  
>  	return dss >= dss_per_gslice;
>  }
> +
> +bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
> +				 const struct xe_hw_engine *hwe)
> +{
> +	return (gt_to_xe(gt))->info.media_verx100 == 2000;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 337b1ef1959c..24ee0e4cdf1b 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -427,4 +427,14 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  					 const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_when_media2000 - Match when media GT version 2000
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if media GT version 2000, false otherwise.
> + */

You might want to add a bit more detail to the comment explaining that
the reason to use this instead of MEDIA_VER() is because there are (very
rare) cases where we need to apply a workaround on the primary GT
according to the version of the media GT.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
> +				 const struct xe_hw_engine *hwe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 64bc595fc727..321ea100a491 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -701,6 +701,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("14020756599"),
> +	  XE_RTP_RULES(ENGINE_CLASS(RENDER), FUNC(xe_rtp_match_when_media2000)),
> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
