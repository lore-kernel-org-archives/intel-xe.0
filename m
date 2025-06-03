Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87608C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 22:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8CB10E198;
	Tue,  3 Jun 2025 22:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4nTMuCV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909AB10E198
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748991532; x=1780527532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X9vYIDtw2P7gMbFTC4esGRb/oxpvJ4wQeeEfjSgAjYY=;
 b=K4nTMuCVHglwn1VbDyHqjGJ8A7OnbIVk/kIpaAudA0XhEfC8N2fKf3Yu
 +//4uS32oaiZKlnajmoimUrybxiXqDDcGVtWeooGzKvwKAtgtPu7/8god
 v9HGVcr6ZoMGv4KpiEX6UpdD5ewhkb6wpFfbALmqpt6bGn4OmegT7Y2Zm
 Ur6dbYDX4ol7fIR0neAa2IdWg5IhaQGXCPeFVpBT1CVpqlsw3aer8sx7O
 Vk7gYG/enETjG+uFZ1c6opTh6Wa1GeDSyOchBTaD9p6OjH4GFyNarNFAU
 f0s5EfOTwsA5cvecC0upRhnqORSVkNR9subZpKZeiCPQMAQgouzB0j2oG g==;
X-CSE-ConnectionGUID: pWoN0ekXTZ2iSYIF14vqIQ==
X-CSE-MsgGUID: CAAsmRrxRJi/X3DoEC8BiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50910337"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50910337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 15:58:52 -0700
X-CSE-ConnectionGUID: 000V8g1ZQa2mjAoL8fKwbg==
X-CSE-MsgGUID: UNIzrbPxRNS/hW9qf39nAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145974202"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 15:58:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 15:58:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 15:58:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.53)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 15:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4udZlUsU17QWLIvguRgAqfwZy0cnJwgoyv4zxLaJj3LEGjclPjhlG/LcWXsm7czmaBvLYPa48bxyncTVav6s4t/1a6YgpvmyBjsZDvs3ezEbXY1jg2lnzLQwqnwAvob4lRh6guhv6y+QLxLXf/4MaJKtj0OOxMCqBqkcHYyz6G62rdoU51eovrMcIGsaWodtaaUSetGChyrCN/hH8hy3j2BRXz0PXndxVPLoZxdlP9nnoJBDNQYnzdNcSKGwo3KtWJDXtQDS8zuy+0uvIccist3qCb7uWbntV5avLoziGJB45Hlc4jehyR8cFDHRTlSWy1TIoY9/Q6eAotPkMJJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBqsoJNZa81V56Naccqt4XAngjp0lNhO19hMX0Oo5Cc=;
 b=t79h2DH//UObkjN7gJ7WKUQVGyerAx3dwRuHhAeK2W1o5bIpHyU3Ran+YjDXjNu+dSviM2xTwFRJl9eGuJLI/XLlMW3P5ul7t9o/1MQkFSqqzs6yfUi/e8VyQxZ0880XpQ94nlmXwK6/VTgCDP9iS6cCQ3CAuRXJ3KBnAAuHWHYi+LIRL9RGz7/piMTEWrRpjLqQiECUaVITB0oo0N/8F494rKx9aqu06GS3YES1co96gwGj98GL/dpWdLOMemPFhRzVy/t16NQc8OOv8GQYE9IK5/q3aoc+ZCA9ep+TkGzAn8j+NWnn7xNfmY/qNvPq8G1lAxYe1iWsFFrEEx15Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 22:58:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 22:58:49 +0000
Date: Tue, 3 Jun 2025 15:58:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Message-ID: <20250603225846.GE5080@mdroper-desk1.amr.corp.intel.com>
References: <20250512123254.3332629-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250512123254.3332629-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: DM6PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:5:40::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee41f8c-9ce4-43f8-6f23-08dda2f233e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qwPj1nZP82k6j0P/KWUYf2fc90HhrDdOYnxplmd1FW/gti8OhUJoBSw6O/P6?=
 =?us-ascii?Q?ftuTsV0iwX1v51rkkiqFBEEesACOIfBR2yQaZ9gLPYIKA8i546T96c8QubEY?=
 =?us-ascii?Q?R2iN81Pfoeh5iclc4FxwkHl1v+KdwyP7W4Aafhi1Ks4XBluvHL7I7tlvPbB5?=
 =?us-ascii?Q?T46MoFuAqiD5PKuhg9Sylc8mxsesoZXmyDm8qDZ04MNEcuHazaj77M9NpKRj?=
 =?us-ascii?Q?T4hayLPqphRJH4JyQBTAdt59o7NA/mDqKNhRKDyXe4TRTSBf9w9a854ewae5?=
 =?us-ascii?Q?F6lB/eNE73soVUEzQpeB/C1x8EZOpGcLKiECQJphZkILO15DqhVjOVcv4KgU?=
 =?us-ascii?Q?lAP0yPFHQfJi4LWfV9ucUPFBY4FAn+IVdvsp+e5WMDeruJW/6Cjii6c/QKlp?=
 =?us-ascii?Q?rU97PlIAQnOAjJnbhD+x8Z7zZFOCvDitDxckdbKZYuhuXSpv9G4d+SEwH7dJ?=
 =?us-ascii?Q?gOZVOHoE5VufRgLV/nvTeRFFldmKBe7MbABM5UIcaVVLZJIMoKux9aPhLCxA?=
 =?us-ascii?Q?ByxvnoyvmcnTVWP8vq7+7CPFqZCaZmsTV0oWPBbTR2ax5RE+O38ZgCwS/5OQ?=
 =?us-ascii?Q?0CTvrZpOSuR1JJgKYNpUnCNszsiHkfRNvOc3/CDSeKnAqiqW5w0IHsd62VLe?=
 =?us-ascii?Q?AizyBL2mEPZPbVw+h+SuVJ0f1e35ujvFrKCLFl4Qei24tXruEY1R5QTZZp7W?=
 =?us-ascii?Q?e1qzfuCEB0o8FYBbnnM786ChFWR9rnqS3CDJ55238e1/OlF27aB9fKVhGzKy?=
 =?us-ascii?Q?QoHbgYHobAABiWK15LPe9AESz7posTDjHzyhhIIWVZaBGDmtziGt4b8Tn25U?=
 =?us-ascii?Q?CcqNr9Imp4JCpFErmp1RWmm9FKyJOSwSc54lvKJxpv/ZRlhzfJO2C3WhvmsX?=
 =?us-ascii?Q?k2My5uACA7Po+OIkRFVrV3PoQTkdl2gGc1vjeMR4DdyWUE0e/Ykm6xTFVBXF?=
 =?us-ascii?Q?hphtEpNmXawkeqdUIHPlc9gjdY6i3dz0WOGZ4TJn9SsP+fwnTsoLYMgDvYJL?=
 =?us-ascii?Q?L6/6fftIQrTJ3NXldbY72Dbt+ZPqQK+oYfiVWhR2xruHZWG3XP66UHxRbekQ?=
 =?us-ascii?Q?QrIGmAZvj9QAgQIOlb5xpkxNBuMVdmVk2j7aDukLi61cerffwXA/cFuScs99?=
 =?us-ascii?Q?DRn+Jj/Kbv/Eritqt/T6xhx8Zkzh57QJLduqVgWFkyMNP51Ljt9euktj9Kkv?=
 =?us-ascii?Q?3C/pKyUzTPNUJBa5Do06wgTM0DnxjVrfNazJA0RlY0JQqWL8ZOXLPFl1Ui8l?=
 =?us-ascii?Q?ASuN5FYlbX5ChzCf1Yc6DGt9msS5gGYRN3vS5oEq/biVrqCudd4Qs3/WQmpU?=
 =?us-ascii?Q?hTa6prkM0XltXYPW+ND5vo+bp6+fQby3qhbf/sAPQeydcI/Xb8dWwmMb48Q0?=
 =?us-ascii?Q?URb06RUQFc6LkT++UsKxR4Qw73g7AMzg4qB/ejUXLIDQR1SYCE94kBx2ti/v?=
 =?us-ascii?Q?rk4DdLPHWdU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNOTncIxjFUbf1LpD7AWfOjRrCRaGHRogplm62vZXhS7jOJLgL8UHI9FD+vR?=
 =?us-ascii?Q?IWK1Lfbts6OZ3WHp+4Zd0kZJwOF9kjHQb5PiT1BvdacBb6w7Kl7qcrd2Bvs8?=
 =?us-ascii?Q?8uuxkI15ANalUTKfm9uS7Bz5U4tApXiXAZ6nL8pyxRV27DFp/DaaRjCgu95k?=
 =?us-ascii?Q?Ahmabix6zLqIiDjDFafV2rVyhpqjHlaOfDoDn0y0nSkPvulqOEuIJAH4iBG7?=
 =?us-ascii?Q?NRRJVjQCBdAhB8dQ+E9siGm4tkxFpME6FD+Ww2FO275WhrrTqf8BlGo1JM2F?=
 =?us-ascii?Q?B2dEAPuPM3rp2EPFJdRk83P7toxE66XoZ9Wbd8Kcl8mlUkYNRbpVnvN30Sud?=
 =?us-ascii?Q?f1XRAR4ZXXUkI+E43K3yBKLgqBJofYCZFmm62sgPnWIF7GSv0WhC13ynCDzb?=
 =?us-ascii?Q?5tE81XX+8v8glqsyugHYGtctLHIBUt0EQlCfDwH4VSQPrHWlA+OXrbf0Orqf?=
 =?us-ascii?Q?RBdBMtd4lxOJrqYzFGqwb0q+AH4uCIGVi+o0ASeyEgik8/Mle2rAM+m2atqs?=
 =?us-ascii?Q?zAKTradEaX6RWU7yf9O91C9gR45SgiD5t3ZNrPx4v+CqdV7zdWTWO1Xi9U5j?=
 =?us-ascii?Q?NKHMImJEWbriIDB6U1APYjrtZA2E+KXxpMXakII2LExBkB+MdxGR9m6wwBWy?=
 =?us-ascii?Q?OXcsZmw6ROboygfjTFwhrfIqK9n3UnoGjtGgQHLcmAWmxzkR695zWKg682fk?=
 =?us-ascii?Q?8LsD7hD6RpVpZOpdtA26OIGRi8xmH9d1qUrW3Dq4X5f+g3CcpqgN0aeR+11F?=
 =?us-ascii?Q?FWNHxq6HnGE2fFTKEOTEMifTwCVaHKFla5NN73npWsAH/c3/VdU2lykmOj2V?=
 =?us-ascii?Q?2eFPSPpae3r7qahPPjrDDRh/ogqNe9MX4OoyFcZDeKMd1hqCNPn+Dj8oAizD?=
 =?us-ascii?Q?MpN++lSVtsmGeTF/fTxYYFEf/aUyTBMiZv8U0szDXii5LCr2KQvPJJX8UFvZ?=
 =?us-ascii?Q?6HdGMg5Hpe15Kam4bh/RrsAP0e35O5ojYAIw+caAxycT25q6qSEYclAx7xCH?=
 =?us-ascii?Q?Z3KDPp8iRg4WG1I9YmtAQFgodrRfHAaaprPJAQQL+Aym8G60ADGAVvJxzlat?=
 =?us-ascii?Q?2avDjWmFTSUyvp7YHUSdbxSLNjR3NX2zZtnNj16C8In+omTNodPUGDM2K40Y?=
 =?us-ascii?Q?K5juoIg5Fd0p/Otq3aVBsDdIW/1ODsIPyenPRCmjCLklQx6Grlekfd8abhX7?=
 =?us-ascii?Q?SEaLoAdLlBJaXFzZ6v4ZepQAulDRkB51APfs69YiA+lZIRkJceTiEeYkUeXS?=
 =?us-ascii?Q?rIsdmOi5o9rbsR8uvje4ByDpjiREXhN6g5FvcEKGe6LxaEb0Z/4zgrXYpXvQ?=
 =?us-ascii?Q?DtU8H+pbkBHj1PE/0ejZEBjEzfKdzRdv8NumP/s2hZRcKOOr42GxDgRK2A6k?=
 =?us-ascii?Q?lbDeKkC3fwewK4BHRJv4VcH+cpuVayt12V6pDPjbcHCYAKHhyrtzprcXkCkx?=
 =?us-ascii?Q?Trio+JGsn+sSVrDCedPFj7MBXYWZzIxilFjVRtOk1dtj7AV/l4HHiaU2fSsd?=
 =?us-ascii?Q?AJZSyWnsv4zJKjRHbKBuKP4JewDR0VWSRnncZ7QMH0BBJAnYT1cnTmo0M6iC?=
 =?us-ascii?Q?8b1bJwbMYYlkL9jSKlgLXlRnft4KC6BbuUUB1JT4YbEm2Wrdf+hmF1M7ZjnS?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee41f8c-9ce4-43f8-6f23-08dda2f233e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 22:58:49.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrZ3UfMKhA8ew5koOEgIklEB0lkX/6C9XixJ3kTMD7JF5LmAjlym9BByBCQ6mBWBYVujHNDGBP/R5E8k5+AvpnVUifw+3utKLIzsAxcCZe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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

On Mon, May 12, 2025 at 06:02:54PM +0530, Nitin Gote wrote:
> Set DIS_NULL_QUERY bit of RT_CTRL register to disable
> null query for anyhit shader for Xe3 IP.
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi Matt and Gustavo,
> 
> On PTL, Default value of DIS_NULL_QUERY bit of RT_CTRL is '0' only.
> Last time, I have incorrectly read a value.
> So, this change is required as per request.
> 
> Parallely, I will request to update bspec properly with default
> value and also proper entry for tuning.
>  
> Changes in v2:
>   - Use xe3 IP and not ptl in commit title 
>     as this is  not platform specific.(Gustavo Sousa)
>   - Update a commit details properly (Matt)
> 
>  drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 49ddbda7cdef..6f2f3428b12e 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>  	},
> +	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),

I hear a bspec update is pending to document the default values
properly.  But is this truly specific to 30.00 and 30.01?  What about
the 30.03 that's in the process of being enabled right now?  If this is
general programming, then we should really just use
XE_RTP_END_VERSION_UNDEFINED as the upper bound for now; we can replace
that with a real end version if some future platform eventually flips
the default value (or eliminates this register completely).

I'm also still unclear on whether we also need to be doing this on the
Xe2 platforms too or not?  According to the note in the bspec, a value
of "0" for this bit isn't valid from Xe2 onward, so if Xe2 also has the
wrong hardware default, then wouldn't we need to handle it on those
platforms too?


Matt

> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
