Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17276CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9D10E07F;
	Tue,  2 Sep 2025 18:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5ZBXkfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909A610E07F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756839232; x=1788375232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=29dNAxRNo7ZAC162aiB3JbGWI7CWdWxVSUKZ/GjbuRI=;
 b=P5ZBXkfHBEzLzz32b7qZuGfla6bG28PWtsxsLKdeJiKqCXSnwx4eX/k1
 4pgSX4ekQCl0OcMd7GMedz4klnHmQ1mSJvsOn+zJBpww8O3HcTeEbaNK3
 k5YA7PyZme37uqOib4fDsPJSpZrw7/faOho04RFhUE7zkvj0O3nhNCixw
 B0G+ZhDakV+Y8sIzOPGxIeMrML1OUk7A/OvE4NP7GkjFPlkRRkM+RLXm/
 uY0GQRNTGrq53K4g6P8Sj1IsM9CtnzeB5ZLohRLLwo9hhvZYdObE6395x
 FrFhnc5XCokXGAFBz64L3f5Xc71Aj7GisV5q8NO1UgBgMK1QHHYNQCA7e Q==;
X-CSE-ConnectionGUID: dozLeA7LSdyL8UM35DllkA==
X-CSE-MsgGUID: rqhyxEKGQAmoyyykn5fduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62772831"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="62772831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:53:52 -0700
X-CSE-ConnectionGUID: erofNeb2S2+SLjVFvAoTJw==
X-CSE-MsgGUID: m7HoqYxbS/GW1qG496mb4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202267177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:53:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:53:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:53:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3brNmy+xcCzNtFVpbQR4GOvx7qPizNJ9biMeNCCFFfEmu80b/TeUVSzQCERtYfawjVqYM1jIncynXKqoB0i3EN9Fr//fKqwRkfSsTelLi1rJphaHOq8UAytpP3QL0WB2pCLMAvam0ZhuvxBP9UK2xMeWMJg2E5gM4e/VoeFA+sbTIbcpQ4m/TeJjSw8lrGLfSaP1q1YYcZgSupqIMoN/4fa6QYyuikmkFBFe60Z+Au5tN/w2ysjaWAsVyJryPYO6Grh8I4Nz/kiuJLvdS/plylfSfZRVZLnBhWCftfj6IEkkUImg404TvaboBeG/Hac2oFSobq5XZxBDw41tKmZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5rs5+im9uNDL5f8UpHXtDc13Dys4kYyzYwxKIBKOkA=;
 b=b/zboNjwvNz9Yz8YmGZB2kXpXy2QxkTQCTJKry9kADNd1EJq2xV2dhFF0SNj9glBI1Ypn9x+e+lq+8Ohc1pN1wBKs4S3t1j5rqOVXO6OWyVYeocYVegce1n49c8YeLsNrXTRP0YpSUqMTXizmotrITIeyE4UFEaAnPUg/GmNhWrwngAlsd43gdmEzF/m0LpQsv4J1vVHS8fp3U4rTIFMAOBYYCVyZu0CnY3KyZKTt/Kxkdy8jQH1jHO5b7mL9vvfjLP9kJvJ/dLIbyzobHtHxtG+NUb+XJV9PKrp/x6w9e6DctCbzb6aN3J2vL/KUzziGK8Zcr/Uc2m4o4KuGm+f/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:53:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 18:53:41 +0000
Date: Tue, 2 Sep 2025 11:53:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Summers
 Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH v4] drm/xe/guc: Add devm release action to safely tear
 down CT
Message-ID: <aLc9MjCVs0RnW8Bs@lstrano-desk.jf.intel.com>
References: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: f89517f3-5539-4b29-3b36-08ddea52088c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IwQ8muMHjavVQCkmaD3Mk1rMzwc2Z+1uQtEbC7dZ/i10WuhaclPIM0ykF0va?=
 =?us-ascii?Q?FW/34zu7YhDg0fPpi7dhU5U1auv1w5jrgS65vNNq12aS02au7EHPiSpP9Asu?=
 =?us-ascii?Q?ARjtDiooGy2xocEjRfmFpMXqMEbkSjNnhah4X+mLOceXXxsSbJbc4icf/5jx?=
 =?us-ascii?Q?qG0MsOcSF03nh0Pxz7FGuyULOTiBh6VUX+znZv6lcePFSso2/K4Ho1kr6YcA?=
 =?us-ascii?Q?0J1zSnH7iQDJUtf4hGMiZuHBolu4FHfbJsPR4Ih3OfpuUCpU8QJpj3WnKsL7?=
 =?us-ascii?Q?yw8QwIPlrCezhv0tkbty+Vr/CDjH/KkfKvTed7Td4R32EAvqVaMGTuinDkYB?=
 =?us-ascii?Q?ua8hYGX2K54wZmLvNCxg0VuKI51Rc0mm/V/hrTaQjVo582zjr70oaTEDZC8t?=
 =?us-ascii?Q?gIn7wbyk4rj/FdwtqcGM4/U+jBTwn2vFbha/1Z9apRwwpXTrr7YLZMdNcAog?=
 =?us-ascii?Q?eCU5Mc6yg5ty9C/iIyBvNmOC4z1yT+6siuzcFAGgZy6VGWT4klEugZ/Gu7cB?=
 =?us-ascii?Q?2pECeIO/8d6d5Qm9E+BACK+hm+YmjLNmiuQUdo9lOsaXPB55EIUkBdvRG51F?=
 =?us-ascii?Q?oS7Ajp0cG6ZixVof+joSymdOWo7Grz+/EF4t2sK6qoM1QKpjIIPS0e4nW9DW?=
 =?us-ascii?Q?7B+IAlmTPTvBH9SofOTyuj3FkQVIReo6LB5ga1yl0yzSxj3ZteLIQn1yZgHA?=
 =?us-ascii?Q?ba4B6SAQZ12naAAugHn/VXOUAfZ71eGI5F/Yqh9idLOskAmV+NzO6iegwFmz?=
 =?us-ascii?Q?88creIdb0LwPTzkn/wbv6pBIqAQY++Z9B+9fMiCTL7uc9RvN1UnkzACumIb8?=
 =?us-ascii?Q?opAD3f/1J2nwAj4MBIMyHC6aDsVFKtt3gmVX4t7akjCbDbw1F07P0YRk5BOz?=
 =?us-ascii?Q?/j83lRGQUrGy/LDN+bVDY2WMin4CHx9WyEXgXpKaiQsnq3k9ooc1fYyFwIPD?=
 =?us-ascii?Q?Zabc9OicV3xQX2vgiEoOQh4REB7Y+jNeeyjzV6yOp9pTDev1KreV1YPZTSmx?=
 =?us-ascii?Q?xW97Q+Gs9ldjoAgSr0CdaDW5h91FDupcwYmgwq31etQBNJSxIDVy930piZnJ?=
 =?us-ascii?Q?WNACov+7SOKPVoMhuyoNoZ/uY/rNteCDOW/3enA3BYqTxn6KVczHfcRtxEMk?=
 =?us-ascii?Q?A6PkVbnTXS4CKgGSZswYBXmPyMwRDztMMCGxuu3VINusM0ybMGe3B61c+/O2?=
 =?us-ascii?Q?XhIkc6AIHGQIa2MHcrtwFs0Rs48uhKWs2ejb2aSPcwR+EJAqUBg4T2KU148a?=
 =?us-ascii?Q?sz5U5buOsCF5k0ii3Rb1KSRt9kOc1H3LCew+0godjsuKOQRthMLMt2DjvpXp?=
 =?us-ascii?Q?F2p/69J5TDUBOdN6pfzsWxvtqSWV66FnMr+oOVnxPqhjBW6hPjkst2/jp9fh?=
 =?us-ascii?Q?oi+r5wfaX+WU9ukBul+zq305z1OeMfsFoeytTh0NupG2wSxsCMgcG8ZYSXrL?=
 =?us-ascii?Q?0TF2aFK/Q+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?no3VLBUQtU66OUulvxFU2CnddMFgTdGciEdNQ2g5NorMlojYlCc7/hPVccv6?=
 =?us-ascii?Q?six0KIwhGrdbEz3XCQJVfrnKXLhoDjplTKNNGBMjTclzVAOWiCxA3tppKzOQ?=
 =?us-ascii?Q?XF9a/WDPORiTZO9PWPpOygbShLusXcQkEu+/E36ONgl5crQeFYnd073Mhbyv?=
 =?us-ascii?Q?at85uXfPJgULR0V4G81NRNO0t60rupcWW1raY6aLPmPxL2Y/RLUJe29A5XpB?=
 =?us-ascii?Q?6EaMRBvclBfuTgfEiDt8ytd0278ww2eYz4xGLqqqU+M/WEeRkmd+X3spgfvT?=
 =?us-ascii?Q?KTvqPWFSmgV/xHvDlWIJ/xJqGpu16tglY3V+wDOVLDx3TFq/Su9UOxPf4BsK?=
 =?us-ascii?Q?8TeZfkywze16WxWUmylrdFtDsbybdsKTuL/V7JBLn/LDNO9ub6oCnD4Ra+/1?=
 =?us-ascii?Q?GH+YPFcRW1WPm4awB9WtDXDZjVyIvWlAtCLc6xx0mafOJ1T9+UpbLo5YEjbu?=
 =?us-ascii?Q?8u5TmgewDn7JCgERrTcR3z6HF2gIPzg/yzQsGRc+sqLlalflGv+1pHrqeOmX?=
 =?us-ascii?Q?K5vKfJshepof6QZP7EVRLLQ/nuJ+48uJA7Z11GTIFv2Nv7ZVw82uuexRdqdP?=
 =?us-ascii?Q?MjPj979winG0SXK6UoDfRvcarie788c6hG96OOj10o+hv/UY7IuV3n/EO2B/?=
 =?us-ascii?Q?/ZdA2imDV4KGWAZ1Xj2A/QENHGHTkzvNJOKW4AxZ+Ntbg7Fuk3Z8gwv49Fcs?=
 =?us-ascii?Q?UAGZLZBJpE8nc7bvN+L+wM6ggm/JmShYbLcNfcz/c4QW2ceTGKIJ2JkJNXsx?=
 =?us-ascii?Q?Wim+OW731o3ZsE1oeZG+47NEmmpBIE4GTWBP6KX9HNODXyGxLTPz2OyF0OrO?=
 =?us-ascii?Q?kCQuKfESfdBOubcmWwdQqF98/FvoHKcC61PZytXDocKEBw2J/NbKtYvvmze2?=
 =?us-ascii?Q?1rkpLF1tZFHtQstL1gnLJ7zzY3UA96ILG+hPe20Lq+aPCG58SrWG2yFTIBtq?=
 =?us-ascii?Q?STMkguS7qESsGE0Jn/Ky0zugMQPwATW0Qy1fAJRmOFPVH/orb7cUMzKE8dNE?=
 =?us-ascii?Q?kSSUKdjx5GNry2eG6VPOWcCsClZCHFr1xZpkgjMeJuqlMepU9b+fPBSio1ro?=
 =?us-ascii?Q?6uHhelhIOoAj0Av/36zP6OhzbEETxeJneOq3qq28XilGUDm0PU3HaHSY1ChN?=
 =?us-ascii?Q?jDIVf4r9wrWOYQ93veCP3FelQPoviauP1GRsZoUtieImEYymhZriir1Ow2uA?=
 =?us-ascii?Q?oxEF9iwBmRakcEF08yuq6GCB9AWgdVZR3QqqDrutBlXJ8QP+gTOycFLYMxbW?=
 =?us-ascii?Q?JTOToQnShP0S/jEvQVWxWHnWVs2RDXLubPpSglyt0okqECBiKoDqywEFdFxh?=
 =?us-ascii?Q?WobcBQ1t8JctDkLPkbh2wow3+pkndzKhdl+VGXzae/VfGdIIDv+4Ve0zsHKn?=
 =?us-ascii?Q?tHRL0KFt45//i9BkFQCioNxo5f1W0qitqiBTgo69lEFWaYsaJOV15ACZBCFa?=
 =?us-ascii?Q?zbk9UnZSIQBxLR73+k5li0ez6sR+3gXyWApBx8WT+BrXpphhnaPfr4CYYr26?=
 =?us-ascii?Q?+UD/2uOLahk+2cnq0Krp9tQo9WAs6tqmv2KzHOVzZPAJjwHzWvEcSWcUdeF4?=
 =?us-ascii?Q?F8hoFeZoKHTS5JqgznGFVYluORXbst6aRsrrU+moqslQMB0HVgSn/ST6PhGa?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f89517f3-5539-4b29-3b36-08ddea52088c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:53:41.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAKEpQV04vUeRoxbftu+URuHcuHKIbewNMT+OtVN2r74CHoRtENcUuQ/1DPUenQjs9HYL6f2k1gJjenwQBtPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

On Mon, Sep 01, 2025 at 12:55:41PM +0530, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() and
> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
> resource deallocation, preventing the use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V3 -> V4:
> - Fixed review comments (Michal).
> 
> V2 -> V3:
> - Fixed review comments (Michal).
> 
> V1 -> V2:
> - Fixed review comments (Michal & Matt B).
> ---
>  drivers/gpu/drm/xe/xe_guc.c    |  8 +++----
>  drivers/gpu/drm/xe/xe_guc_ct.c | 41 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>  3 files changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180c..b3a6408a5760 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -709,10 +709,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  
> @@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
> +	if (ret)
> +		return ret;
> +
>  	guc_init_params_post_hwconfig(guc);
>  
>  	ret = xe_guc_submit_init(guc, ~0);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 848065a25c44..e431ff73227c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
>  static void safe_mode_worker_func(struct work_struct *w);
>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
> @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +static void guc_action_disable_ct(void *arg)
> +{
> +	struct xe_guc_ct *ct = arg;
> +
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -268,10 +277,40 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  		return PTR_ERR(bo);
>  
>  	ct->bo = bo;
> -	return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
> +/**
> + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
> + * @ct: the &xe_guc_ct
> + *
> + * Allocate a new BO in VRAM and free the previous BO that was allocated
> + * in system memory (SMEM). Applicable only for DGFX products.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int ret;
> +
> +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> +
> +	if (!IS_DGFX(xe))
> +		return 0;

Why are you only doing this on DGFX? I think the CT teardown should be
the same on both iGPU and DGFX.

Matt

> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> +	if (ret)
> +		return ret;
> +
> +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> +}
> +
>  #define desc_read(xe_, guc_ctb__, field_)			\
>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
>  			struct guc_ct_buffer_desc, field_)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..cf41210ab30a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,6 +13,7 @@ struct xe_device;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> -- 
> 2.51.0
> 
