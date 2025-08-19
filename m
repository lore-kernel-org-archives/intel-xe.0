Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEDFCA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 14:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0533B10E60B;
	Tue, 19 Aug 2025 14:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVNKfILx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909710E60B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755612492; x=1787148492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PyGf2Rl7BnV7HPFHFLXue/7gFxZywblq5LdPw2HdpKg=;
 b=kVNKfILxFzljfBoEMvmVXrAKQOTn0a77ez8gjBc/cjaT9LFFRgrM/2u4
 WD32GdIOE5pP8Fx4KNqyrUsPhdi0bj77+fatGfbsX61Q06vAF/cKYBbgG
 14WKh+DkcVM8EIrNRz5DCPmvbdVySOyFYYaIMPJuS01L2VuOqYrcd+9GR
 oM9dF59MK15sUcJwpdDEqkiHUQkOcmI9/Ov17cwaJKyBPYoHJCHGH2h7w
 VcpDPcWMc+8d8HvGsZZfgTv3AmD2adRRJCvi8Oyk9AypsxPyAtue1gc4Z
 bhf9CcOtGrmdvQd9MzVu5bEaN8bigRzdl4q3gSWFirhwEz5NgMODVoy64 w==;
X-CSE-ConnectionGUID: mVCNiFMgTuWfKfe1lA/2hw==
X-CSE-MsgGUID: rs/Tk8sCRB2Y7g5ufuF3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57569809"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57569809"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:08:11 -0700
X-CSE-ConnectionGUID: 8hpg7hwATpKhpVe9iyjLRg==
X-CSE-MsgGUID: nCKD17cpRUaWJvNqUCz2Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168263630"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:08:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 07:08:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 07:08:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 07:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/hQ32WzheNUxVf1lEBwQiNzkhVKzUQRdOVQgBz0YbdlDU6hZjb8KPfi6FiWWorL6EYZdlxSlhj7KTrcUfQBCVx1EFBDRs/mzq/T8ObSmbS3dB3lRMDvT6qNvP4aMMxValPj6IZ9lduynA1ueab+2ohFLy4Bynf/8Qc6Dkj0Rq6dQ+v8vRwRa+HEd5jRC7qbAsKNTo36G0cjxOCz0Ket6QUqdrc5LBReYecItJNvqtpjdkpobTuRuPr6jSAbeQiHs3sm72m/qOxij7CnD3cJsqB6oXcK1tJjXTQYsdwx3KCmMB8xDwG9gxEh6P4Fgs5LdXgpmgnDn3S9K9fVlmlveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMfKXioeOgX/jQnn1PfZwnFL+/e9ysfAuzMjL+/Y+5M=;
 b=HHqIh9RBXhSjfcgFuGpuA6hDFxvQMNHI1VsRfu9mtbv4e4lF6PjRqMhMVL8aIoxn9ViG0QIpWAd2PUMgZ5ZSBUate7k36j9Y/E2fhAYx/MiM4yoCYq7xynTOF94RWQmQpXXPTRDNJwCRQUvIy2iwnwppfm+hIuC+4MF2UwOeauKerTkHwuN+0qq44ZAGz0FWN4LOBUnhnNAFT7R/Kuh/9UwbxuJWbVZFr0eJ40tG0oRy9WErOFdOKEZTTnmXDZjfp3jmxW1DxWFa5JkFT0IPtI1J1viTHEes7iZCqaBN504K6CxZ1AY9dWjTCEqBrIq9zhsLvKrG+2Mym9bVE3uxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 14:08:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 14:08:03 +0000
Date: Tue, 19 Aug 2025 09:08:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tapani.palli@intel.com>
Subject: Re: [PATCH] drm/xe/tuning: Apply "Disable NULL query for Anyhit
 Shader" to Xe2
Message-ID: <3nkoieccnnovh4lbcwu4g3lmce4hbdnhiwe3m6pwk3ztrmmm3t@7whopshriaj7>
References: <20250819061151.1272622-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250819061151.1272622-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 221b52fa-86b1-4223-06ec-08dddf29cfad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?glh0EU2UD0M5/OvdnDPBs7kfAQjCqptpu5RSlyO4tRuDWolE6jEASybnpUOr?=
 =?us-ascii?Q?ZduQ34Lj1+zitTf/2cbLBBacwB2GGKkX+DdaMdvaf2JIBzlGZt1tJiuv3QXJ?=
 =?us-ascii?Q?jnj9hsNCXp9nCi5rfhF+5Zv9PULrnckNIxq/HG+A0BTX8nlhEJVgbYGDqYBQ?=
 =?us-ascii?Q?AbGHcoWH8mZhvzGOVgx96G86Fsj4Zfnw4zd+k/4+eKHWeYmEal3vYttqyNsP?=
 =?us-ascii?Q?kyIKHZ66zz4QCIPpQBg40UhWNiYQMS8yyoaY5J/5qleMFEuAu4LQKuA6UagO?=
 =?us-ascii?Q?RynqAjZj9+Mz1Wpf9XLQEHMOm5ki0FGuZh0Y7KuE5xs+K+ftsr7DkKHTfoup?=
 =?us-ascii?Q?3E5k6XQzWlhL2r8Xa+GaMJU2roRxWbomf1XFRZNXXwQj8Ire/Oa2SsU+3M7X?=
 =?us-ascii?Q?SV7hlZ+WHxBFO6A1M3u5R/TxwATw/rPz+LK7ixDEnkGsCz1ivdP/q2TpRu25?=
 =?us-ascii?Q?sd+5KVF+nt7P2W6lY2HGIsLKtPkl8R8N/bEl4EI28t+NCRxrmWCyQdy4+X83?=
 =?us-ascii?Q?qz/70LECRir69uI+4Qch8XszPrlhtQIcXhwbnII1cjfBRmpwdEOH4aoqvuLU?=
 =?us-ascii?Q?heJ81r23X4dd24BMX3JmQ2pM5rA2cHsnI8F/6WWECv1ymKkSJoFJS5R6r+vi?=
 =?us-ascii?Q?jleJAYexFPIo0jsz93GUScr/sKYOmeq7hjpo+kraIFUIoT76L0tqAc87ijcn?=
 =?us-ascii?Q?2P3t1mxTZlL1LauVqYot6NGvd9Rzdg8YF0rdtRns1EIKwASlKY0Er3t2Pn/Z?=
 =?us-ascii?Q?QL8BSH6pLF8/VjuEWDWL6CITpv2eBYwTak1FYXAPYUzWacBMUVbEUnbl5Gy6?=
 =?us-ascii?Q?YdlMBqAMJ9XWw4wE4D5fkQdIUQve/gR2QayayPblspkWOE98GFm/dp0PA/x9?=
 =?us-ascii?Q?CjpVnOfIs/yiB87AnoIEJv/S6ZdAqPa+er6hEMBZ9MtdQx+4CHX15SBLCdTo?=
 =?us-ascii?Q?yq7AcuVyCIo/1DM5qY92WOlazWG5bsjjSFepFU8ErhTanuRW2xRj3srcFC3k?=
 =?us-ascii?Q?9D+xKbKtk6TKwId1Xs/cJfR66jAoE04YoxzUGpc+zokpXsLm40ILPJKleQIt?=
 =?us-ascii?Q?TG1gnPWw5gVfrrDVOI2x3I5NO1n8sygXMa2lLPrPac/+RsKGy1oCK+v6qg9O?=
 =?us-ascii?Q?d53s8G/uJl5Xm9lU680oxhnj04pcZcGcLSzXgJURqXMj7vkSWY3AnCCQugnQ?=
 =?us-ascii?Q?aK9whY8mSUNqJ1urynMUwzVr/YTJ5WpLLzz8w59enF6Xtv6MeapzQSN/Uuo/?=
 =?us-ascii?Q?2AYiXgmMwGxWFyKyKjtf0z1iGhK0dbmFPqUyhY9ABJDeJT6m/OVvC8fm7oiv?=
 =?us-ascii?Q?jwZEv81tpWAdtw/20cTRDvCqgnksbfdB8w8e0ESgEgSCostMIyMS0Q3CwJUg?=
 =?us-ascii?Q?6EQvqjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/0l6GMzJJzdtCfzB2j29tXQeLFv1nZfy/Bieu/cTYL7cphWJ0tuPe9AhWoXU?=
 =?us-ascii?Q?tHzxC8mgAyd6uJ10SBpDN4bngHJDhH6py1rulw3Q86MGDJMReDpht0C2N65U?=
 =?us-ascii?Q?IqRLKhnAUOb6YE9Grh9dISSzDrw+PpBUbgnJ2cxbH/ZfK3INcPpQ3RwQ33La?=
 =?us-ascii?Q?UVZBh0MEDD4sWnl0iNoCblaoDAxrMh9j0K4y3eWSo+YuMFxNSm6iv7xzVKAX?=
 =?us-ascii?Q?aUr2n26ZBwLEWtJp3xQ7JYclaECLai2VCxzYTr8YNiO01mVo8OE8nky4kvGH?=
 =?us-ascii?Q?NmH5gWlTJoWxAl1LeOZCcnsgvHVFDv2w8d5629Rug0BwzLt8MBOpDdMSfN1Y?=
 =?us-ascii?Q?NIhpuelJQZcLK1J/yFHb27g6RhQLlBg+d9/0fRCCYz+OdfpbSiv5JWuzpS/R?=
 =?us-ascii?Q?L1iXf/48aLjr7hatANfypM6l8YB3EaeFQtuFdcCeeypuT7EH5t0uPav/37U7?=
 =?us-ascii?Q?mp+2QaAlsaS+Bg/BWhAbK3WCYQEORh7uEnn6jTKgGAKwVrxEXeqO5bo83i4c?=
 =?us-ascii?Q?3ICXCVsde5BCouKY7t9ZaXCma9gu6rLd174zmApTqaL4Ulx+X2wdi1c5v79G?=
 =?us-ascii?Q?zE6TV63NmP7Bm///Jg9wxc69s7uuBgsQVTCm0u7WPyHw5EeBTJLuqRpHjCfg?=
 =?us-ascii?Q?zWivFARaWxa6rrMhwyo3V5LC1uKWz5GFGfbXREVh4VJ5XDPlxOY3+BO/hng1?=
 =?us-ascii?Q?pZoM8HWX8RM31lUu97Z8i4ukvnz6+9vc+Jm9A2oLw6FhKdV44lhvdPH7aUXF?=
 =?us-ascii?Q?/HLCG81NMT+i+e5ScN22JdNBY7UvNuwJio4uxTX6HGi7Ey0V/C6KxeQYLM3x?=
 =?us-ascii?Q?6FcfeVNNIs6IGPT2KbsecVIPCIiTB1/cDYkzhFGen/ZBYjPwObrAQSHXBH3+?=
 =?us-ascii?Q?G0r/Esweps4pDSuWioGo1rPbNU67RRVN9ZZGeoBjV0X36OozoCU+aCqOoKun?=
 =?us-ascii?Q?6Gb+7vQeSiUOu3DATW3la5R9hioVcvBVVKGsuEmGTW/frGGwMGeBZjdu3Wim?=
 =?us-ascii?Q?cHsT1j8Exx6X3W8nYXr4Si+/APDkGddtwPKUdk4DAXQktkp6MBv2Fg5I75h5?=
 =?us-ascii?Q?rqZnd4DMIa70XcsPJRB/LcdoSLrMHOHB42lqxSJjhz9bClznr370JMrVQOdn?=
 =?us-ascii?Q?1ptl1UsEWj7At3J2kmlLu8LwujhkdvqT54JwSxPAlRBEwyVRsPzRaR+ZhF/6?=
 =?us-ascii?Q?H2EH0dWaolx1SV6ycD0A32SPDym2g1CK+LMjjrIUtq6ENgm2mZg9liPo31bx?=
 =?us-ascii?Q?su5J5pCiixA/ruByoP7l2SzYvarCAv841qIGZUkVpfj7SegQ1Jy9p38CB8L0?=
 =?us-ascii?Q?gS+Q4yu/N5VYpWdEif2kIzf9IG1UrCJCgvWfbxUtmOrkerFmmnoJJ/vP4tgj?=
 =?us-ascii?Q?fD/LM7ILcwzh2xXbVupHUrq82J7p4cvuF2GAy3sG6nQXyWRJAEvkpDPC16CD?=
 =?us-ascii?Q?ob2auZhf4e/gUzQdSqrIq/e8upjkCj0PiTJmVgclvQk7z+jmNwWj++SOxhot?=
 =?us-ascii?Q?NEhRVWe+U4mjWE7f4u1oy3QBl4VvMLlroUg3wpFkv4flhFVyFm/7dA5NE04A?=
 =?us-ascii?Q?WdePm5tfDqIrCeru2e1S0QYtcvSLd/9CEvFxEk7Uc0QhyD67nzBDXa6PBA8T?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 221b52fa-86b1-4223-06ec-08dddf29cfad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:08:03.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIwazLd0ARlUHPLwBxYge9+5F6WKuXzQNp3r9LJH/eRhx2kI4kerW6Es+2Gsa82U79ofDclhbPDmsrwAK83XrhrsRtUbqOe5MTjW2D32t04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
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

On Tue, Aug 19, 2025 at 11:41:51AM +0530, Nitin Gote wrote:
>Extend the "Disable NULL query for Anyhit Shader" tuning to Xe2
>(graphics version 2000+) platforms, in addition to Xe3.
>
>This sets the DIS_NULL_QUERY bit in RT_CTRL to disable null query
>for Anyhit shaders on both Xe2 and Xe3.

This needs a few more details to help anyone using this commit. I can
add this paragraph while applying:

	This is a change in behavior that can regress a userspace not
	prepared for it. However it's not feasible to change dynamically
	the option per client or per exec queue via an opt-in flag. Mesa
	is already prepared for that and it got propagated to their
	stable versions. Even if it was possible, at this point adding a
	flag would mean mesa would also need to propagate such a flag to
	their stable versions, otherwise the previous fix would not be
	used.

	Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35044

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


>
>Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>---
> drivers/gpu/drm/xe/xe_tuning.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 828b45b24c23..a524170a04d0 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -99,7 +99,7 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> 	},
> 	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> 	},
>-- 
>2.25.1
>
