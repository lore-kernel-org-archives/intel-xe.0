Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBCD3B99E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 22:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754E10E220;
	Tue,  9 Dec 2025 22:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKBp3N8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ECB10E220
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765318283; x=1796854283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9BzfF05YD+yaIZL0eNGVeL103WgN3VTakMe/d4Yrufw=;
 b=FKBp3N8Bfkku60ZNDrK5Y35hufUMtVlCNpL8TeXSgiOqK5R+JLBjY9Pv
 IkgEY7ImiHO2x5bmCPy7+SCYp5OpFfy/lhwkZtdFSaBtV0g+8i0FoRYzk
 xQiR7ShgSb9JfodyDF+JnU6wN9cm2NcIeEDIl/EiS4PaT2509SUl9nhKY
 e9A/BHu6N96wUmyma37dlkdeDSXlG6kcyiyWamBjgKx67/irsQYO3Qe7M
 4Rbi4uAEguFlcKOJsFtcbJmiT2inhauaG5IrHoYcjNmZp93KpYzmwHcJT
 k6XPh9Q3yejYFEeC8338AbHcLWSI8whursj+l9RC/v3khkVXx0a8i1STG w==;
X-CSE-ConnectionGUID: ylEXU5HFSPu3S6k2JuWPIQ==
X-CSE-MsgGUID: EpHffIj4SNO3zd9JKE0MjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67172621"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67172621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:11:23 -0800
X-CSE-ConnectionGUID: vLhL9h8xSumB2DmeUjZfnw==
X-CSE-MsgGUID: +nAlDY7wQDGHSAOdbGKt0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="197120618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:11:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:11:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:11:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:11:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8iqzFLY9Sjin4HGXpdj1FQRktjYfXUO6R1T2vAMtQn2I+ZEXvFLh1ehJEHwn7qaoKZrMhBpPoxLyIuUrk02yx26Uh0cZHQVYKsI6C6jO2/qvhEwJtTsS45a2nXCa75C4KQq58VP5OxbB0Ii1jegP3g1D7a6pBml8FOakD4Pb3vxJN9gk77CLxNBJLJEwrueFf8b/fOEVfuOzZxWe00/Mwd0yRW6bWoEdy3ELsdQIAhZOwjyZq8bO2OAx5HUGuP+cjbrYcCcHiXEUV8wO5X7B4OdBLrx0pwT8r7TbJucCEvoIR/MHaY6OtzL+j1LiQhSuG8hrGtoWxxIAxE5cnDVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCfHwBt6kCCLl/zrmco1TQXRifHc+wrcxCGewkBNN9o=;
 b=wyQ4HUfRgGEweHXg+aaAEjsPmntYGjWy5ztZWmFxV9LtW+dGPKfZqSGCvPSXqoMjiemCFbIz25QuwuZ8EvwpIqurCcHu1187LTsLWOzzVI08IPTY2kFftXPyPvk/s9BNlhrY8CaKAag5jKi4xL6vF0IlERMDBltqNl50A/7SMzt50Bnvc7DsfyBl01lQ+mLpHuaX0fppETobtUrXMxtS6XQhO0kO5ehrhrFsMwMWGj9NrI4l/hEf7U6n7zgh1g8W/uv7QxmyvSo+Cl37Go/LKOXwwwqn3UogDxanqn83v2PosXUTA5hSsoVIqqjytrlxRgs8YAVcANq0KgM6QCOaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Tue, 9 Dec
 2025 22:11:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 22:11:19 +0000
Date: Tue, 9 Dec 2025 14:11:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 13/18] drm/xe/multi_queue: Teardown group upon job
 timeout
Message-ID: <aTiehd7eP9dgNDtP@lstrano-desk.jf.intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
 <20251209032055.1539229-33-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209032055.1539229-33-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:303:8d::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e5c417-10b1-4e5e-5c5d-08de376fe124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ULKJWSCpNdFDUnaphLZneRTmCVjdbC6n+W83xPrsNyRIWuZ+HxDHN87VeNvR?=
 =?us-ascii?Q?R9DmPFTOtVnpPQoCTpH+OnxABL96R88w76UvnnPdHcWIlGd8MV+rS140lx8S?=
 =?us-ascii?Q?l/ZIiEapmmL471gvDVJjQLZoqFs8Rb2lrNiFVDismYl6E9LpvvEeHkaqz4FB?=
 =?us-ascii?Q?nfDuCiyHNHyT5ncYCN74vhXuOba9YrkZQvJ//StRl2yP386zOUHZzrAxl4aN?=
 =?us-ascii?Q?Coe3jaVeyBKmr5QF8JZnJ2hqRDCQb3luwgezpJOmY5KjEF1ukyfmTCyK4MF4?=
 =?us-ascii?Q?xLQmNAsJx09C2S335oxI4jbGGayR73HkXwSmneSFyM4WoL1niJI6rPcFjw+7?=
 =?us-ascii?Q?k4gsNHYFr1UOaWqGS/EBfV08dbtQ2tmqSXIKc//hK7MHM0r1YyamvBAIz4we?=
 =?us-ascii?Q?gRYitF9FB2P5QEcQoexVIfWqyQrNP23Z7IP8fh6v1OkPUipY9/Fxdsg7NK/+?=
 =?us-ascii?Q?UJ14CycHZdKPo7hxJccAONY2TmWmWVobifkCGqKOKTMDCcXUEWV6NUGkeUtZ?=
 =?us-ascii?Q?kWWC1ugfsc85SYDaltAPvtbkPQez4hEzVHs6CjQ/euL0LunqT3q8i0NtKBv/?=
 =?us-ascii?Q?fXGSwFUpUpO/2C3bG7mRaQKjYYk4ijVM8/kcLqWD8qXphsYtZcsvSjAp390B?=
 =?us-ascii?Q?ghYz/3TiBMhDFDXevedmQ0zg8DRBmkpBHL1VN4oFxi5UuhkskCfz1txTKy1U?=
 =?us-ascii?Q?oqcFR6jVM0uQmuA9578yv4O+lxCYL/4gbIhWLlEkcOJSrfrnW/igmXNH5kLn?=
 =?us-ascii?Q?7lBzzWK762eixnjwlGtUYYZzZDJ71dC/xynJgL0pSEOvE44qqQjhStmkJc6J?=
 =?us-ascii?Q?Z8u1FGUnXzXFao62EWSpWkRRh/EeOrv6zvW9zPj3S6iDv6DIFU2x87ljqfrU?=
 =?us-ascii?Q?co8WWz0I78IYfyJ88lmhMbN70Wkxd6bY+0+H5aKIiEA/E2JRhRgvc5JI8+Sz?=
 =?us-ascii?Q?5IcVIwH4zwhWa29P31Kh6XWkv7a5UU4CEoTnBef1YbjQHibzauRCtpwydpEL?=
 =?us-ascii?Q?0V0p0YgmkLDp74tqkwnOE9yhGZUJMIDQLDpWyaSxSjArt8UMRLxRTxfHcdLd?=
 =?us-ascii?Q?1HFUyfrUlZI42K6jEoPvmr4f86wNOyPr8kXwsPkkaLkboZ1bojI9QylzPdCP?=
 =?us-ascii?Q?KVZV7LjnIRYXj2Tje+P05DOaRC+g7gFTIDavbuFDsmSVjPOqcf6QF/1D1zfj?=
 =?us-ascii?Q?ocrEd/1FhKdrH3FQEn069tWCStuSl4Oc2LlARZEaYyta2hAQTOnQPa7O4gU9?=
 =?us-ascii?Q?2Ds4/EhXxMrH8tEN13kKXukA+KLKw8iRIVhvam0Ih/rjvbcXWTDkYpZ6wnqV?=
 =?us-ascii?Q?wHjdUvqhfpK2We58DcsfTTrrbrEB4VvQaHx8DXBii16i9jgM7/yVP+n7SMVR?=
 =?us-ascii?Q?m1fslpkEPMrAKPFmUP9t173jexyKsjSHAilEf75DXnEYtOct32TP1CqLnL/v?=
 =?us-ascii?Q?7Cw+W5+yTzzHTkrrSF6qN9czg7WYoUUJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tfMjDNBRxdQ2ZlvadVK33TPWM+d0dHQAbN7KiFhL9kHcD31aUumnmmUs7uiA?=
 =?us-ascii?Q?up6AJK/wKIwdHMi+/w0h2HPVv75j5wshy0Rj3gae2o2+skgCDh31S9QVDbgO?=
 =?us-ascii?Q?uiSffZZXCYVfFUKFMxUhMxvaTj4jRVvPS4qIBaxiJSUKxDON4j+ctV1j7BsC?=
 =?us-ascii?Q?p0dCc+MbrZDjQ4Rm+HVg1JVO7PHOAJN/QBH2lzRxd9/VGjNlknFIbKCX5R3b?=
 =?us-ascii?Q?4szwaPwQzDl7gQZlsm3SiPOWecq/6XqRPf1Lzw0Rn4eG+a/ml8vYTY3xvOUu?=
 =?us-ascii?Q?VoWJsFsgrclKZCm9taOw68rdtac2D2/kkLmBUCT6138fgkkKDq10mnfsaz1I?=
 =?us-ascii?Q?v2I5xm51NbMwiil7bsOEtakUf27/vtDXLmAdBQ2WTNC1/26+tXkDpD3BBOle?=
 =?us-ascii?Q?Zn7h0HnVE/j1QkZQL0qb/I73QDg+zNLDtCdK1RasNJBgwKosfOYJaloSo6cJ?=
 =?us-ascii?Q?c6DwX55WnYvXRO+I/VqzuTcBWrukHPUF2Ij4khnI3Zjm7MeLIrC8wGtOsP2n?=
 =?us-ascii?Q?d2Hwl6DFOo0X1UdMOvPwuIubBtdwZN1YjJzVsQ7F2k4U8iF8Q9Yki6C6MJb7?=
 =?us-ascii?Q?qxNJ46WXEoG3TvDrv6h9miHS4xyjwDEZYDfHq5Ho1nLfHuscfcp/3N185BI3?=
 =?us-ascii?Q?b8VT0eOKOZfe/Rc2OA8LNreqlSIbf5TH2Jbq3PHT+Lj/xmsJqzZ4lPPUKjgN?=
 =?us-ascii?Q?FJ1WlMlh88PFI28KvgVzJSd8A1R5qqPHhJRg73WPBofAR73R2pxjXGqO/BMj?=
 =?us-ascii?Q?vIvPU79mIfjrlpqmxlitIaT/UrCCZHtCIhcyrq4KA2xUa2RtRA+lN3tJy9ak?=
 =?us-ascii?Q?c6rbzHneFLhnTKmGQ0GxNR5hTTPkMAkW5A+i/uUkN4hch8FpoVEqKKI0MvI5?=
 =?us-ascii?Q?wxk6VqfxEaZTnDJcrgOgaUfH1vpBmhjeDYwU70WtMs5FTt8tpYh9seI0qQzD?=
 =?us-ascii?Q?MNF4X/aCs9YK+gaajL42SmOWbC5ZXLGxx9DAWeXhFgWb/ILEOU684xXHg9Sw?=
 =?us-ascii?Q?Erf7C2GEfFS3xsp1mo/2+m1LhDeaIdnRNEq5L5pG3G66qBW89MfP7s3+QE1+?=
 =?us-ascii?Q?QBt9LiYA2PqU2f44j3xyabv4uc4UTAmDQn/kkBLDVxL/3ZrAwpTeA0qp3TvF?=
 =?us-ascii?Q?o5RiL2h+g2seod+yIS4RS4J3G8DVjNcutEA6mpAX8ksU4XUM5AtqHu1u6Zjk?=
 =?us-ascii?Q?lc4l4oMBNFIsG/Ob8ISjvUgsk7qYfzXLoZKPlfx7eDadb5meSdMVon7WTDrY?=
 =?us-ascii?Q?hqJokPyBp+BIv7MKXsASgFBAjnmizzrj6ZOn40dlCXkkFrt6GXawuoA1ey/m?=
 =?us-ascii?Q?PLwqyqGcwLm0SZxPkhI+w7bG4FO6MmGVJ0/gcyzzV/5MVmFByyAuSmeV8tN4?=
 =?us-ascii?Q?hrFTS6PlmQt86c1yid2/kSQRj3fiJ4Rf7hnwLKcE1h3Op+7hflUSD0CalO9C?=
 =?us-ascii?Q?USGYvGWnxlQzTVe1uVGmiqgU/u8mn+54swcY6HNrXwj/GNFooJft+DlTaQIJ?=
 =?us-ascii?Q?v4+En0U6nxXcIsCkfueZInue/jqcaJhXHljR+gNwSqFT5hcXWvz3Et7LgwJ+?=
 =?us-ascii?Q?I6+30as6cIMpM6qUNwtsxJREvlcL/rv2OSM158bQmzBTsvfL9fSSjAFiV7zU?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e5c417-10b1-4e5e-5c5d-08de376fe124
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:11:19.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdMrNodGYWwbmwAjSgMXag+srto2a/xoYXxiIDixhFSRDOeYrDoYDgWHuC/sjLCn2iNu3g10mn4pOFSHDvR53w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

On Mon, Dec 08, 2025 at 07:21:03PM -0800, Niranjana Vishwanathapura wrote:
> Upon a job timeout, teardown the multi-queue group by
> triggering TDR on all queues of the multi-queue group
> and by skipping timeout checks in them.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Same comment as patch #9. With that:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 8a954ee62505..5fc516b0bb77 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -64,6 +64,8 @@ struct xe_exec_queue_group {
>  	struct mutex list_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
> +	/** @banned: Group banned */
> +	bool banned;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 509433f132d0..3d6eda29a819 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -602,6 +602,8 @@ static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
>  	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
>  		     xe_exec_queue_is_multi_queue(q));
>  
> +	/* Group banned, skip timeout check in TDR */
> +	WRITE_ONCE(group->banned, true);
>  	xe_guc_exec_queue_trigger_cleanup(primary);
>  
>  	mutex_lock(&group->list_lock);
> @@ -1485,6 +1487,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		exec_queue_killed_or_banned_or_wedged(q) ||
>  		exec_queue_destroyed(q);
>  
> +	/* Skip timeout check if multi-queue group is banned */
> +	if (xe_exec_queue_is_multi_queue(q) &&
> +	    READ_ONCE(q->multi_queue.group->banned))
> +		skip_timeout_check = true;
> +
>  	/*
>  	 * If devcoredump not captured and GuC capture for the job is not ready
>  	 * do manual capture first and decide later if we need to use it
> @@ -1637,7 +1644,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	xe_sched_add_pending_job(sched, job);
>  	xe_sched_submission_start(sched);
>  
> -	xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_group_trigger_cleanup(q);
>  
>  	/* Mark all outstanding jobs as bad, thus completing them */
>  	spin_lock(&sched->base.job_list_lock);
> -- 
> 2.43.0
> 
