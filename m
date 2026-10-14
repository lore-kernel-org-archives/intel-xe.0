Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B13CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 18:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD1310EAAD;
	Wed, 14 Oct 2026 18:17:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4610EAAD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792001822; x=1823537822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MfQ5kenEBd7V1ChRYRUneNR6C4Px26fdirrEjqgSRh4=;
 b=UMnyQ5LQoxH/k55VUgmFk47NBzUrATWkdXliZnIukOyxCUpHwRADdAXe
 TXC5Bflf1WKplmdZM3EQ/JojIZF3kou9msa2IjzgmQdBMXNdVN4BMaCjk
 TLJmCwkzKG6txV1JewY3Wc2zWYK21HdIZcw1TxBkbMUS+J6ZWc+BaeTDw
 34I7JaEL8E87bzmmCjPqWLaxk+JJcV718lDTqbVSyJ6bM4GHDxG6a0kMS
 PQgSUDPjotokxiAwVyDkaAeCW1cjF58mZ4BrtKlT9bHG6pt40o1fqedI9
 jLm/rX2KpDLlQ206Y1KzI/IXbuAf4Wfp5XlM1DAM5a47JZYA8eyXS4qWs Q==;
X-CSE-ConnectionGUID: QAKrtBiVSnSWo4epdhhxaQ==
X-CSE-MsgGUID: 0h7J4NJgTOSBPIcn/PYTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="637003"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="637003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:17:02 -0700
X-CSE-ConnectionGUID: vOaye0uUSUqhajsRFPMsyA==
X-CSE-MsgGUID: kNMxxcCbQ9ybj2B/W5kgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1574910"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:17:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:17:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:17:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODV/KSHcP8WHK5QumDo1ak7B7xCleKFSwUO4yUoLFvH2veVZEZmOlXdDQutW737qCvayrbktU9Gxct0rffCatZugI04hZj5/jNWuFGuctkHSdg9a31sekutgsBrHGqsznBuh7gxEoRVPZNqeYi2WZV76L0n6m5KhA+FHZbgjFmkmhVt05UZQbVNk2EpaFNwBGCI3gBOvWxPPV9XByNWJq/VkAnKSLA/Y+8VkUwnozhRHJhnS28TRulq6kVlGkT9wFHK9KaZp4UohX/ddIKt8fJLCgLZKsv3wcyB3OOaNEGsk901a/xnFWioc2cgw2g8iaWeh+S+SBg1U0ec1QQKv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZv2vidfxurutLk08b7n4xfTPeUwcIAe5/AzJSdqPtE=;
 b=yhkUcMTbReoNY+pA2rrG4PX50WBQrqLN4sHkNJJa82r3P/CEat+LsXnydrR+HEwwvkx3kZGzwwq5K6i163uGxyaW/VXT5g4uceU1SNNXQXk9z5geSHyCmUVvB7iXNll8Kbr7vVj9OBZXLxvkv6Yrb2jW7F+uyStMFJFMZcS3XITC4jHKR1CDRWS6maiDPILgtjSX0UVQVYoIhCDD93kw2/FLr9jG56v2tL4TF/7iLG9GQUtP7YTnzny8YbLbzRHI+zuxd6ZuVKU4zlrZoE/sSolOMm6+MQFM+ZvzXi0ScL3qVoSyMPdh00ckgmO8o0tjAiOdXnvErr+466B1ug0v+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 18:16:52 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:16:52 +0000
Date: Wed, 14 Oct 2026 14:16:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v11 3/3] drm/xe/guc: Add dump_cache to optimize GuC
 CT/Log compression flow
Message-ID: <as_HEHsHR_F1aBgi@intel.com>
References: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
 <20261013222846.308259-8-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013222846.308259-8-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f073ec8-726f-46ec-10c0-08df2a1f5235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|5023799004|56012099006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: VtKxGvcSiIGPO2Tm8m5cMVhyxUay0qln3D8ZmrqsC3QEwJdvl0LPsJfp60KKnjVRpIpBq+AdWHB+8jmLQgqqT4NIWju/TR7agtdKKjUU2y+jSLSrpBO+vLe9Qfxsp40Pjw08JQAziWy5f8o0yXu27iiDjufCyNozbd3oGyaqOOPdwLMEihQcmawV/xeubRM24PGIVNRsFOczEn4zX6mU4e5gFWqOssQ+7n9ckFdB1EknZ+MtccOZdDp7Pi30OUSuGHSapJUebPrMg8sX9Qd+DP47Bb56U74tx6pPvVJ+Y7PCitl90UxR5PzhXJSaIy4qx2xm357U6bFAmbcudQYq85HzSDe7WpsvuJOTdJyGzGYfsmMLsiX6DnP3+PgEaif7wZKgHJqa/FuzwE7fPi+uJyXY7lhCWbzentrWH5iIZ+xBMrAJy3U6mOeLIsH0LZBTX5jzIts/d9PMGAcW0LCeQrka56hVmJbv8yjotT5AlUtC7t9q9vW7dR56jlpeGEDn0/mmsAv2IaG4BtsX51xPDU1hCKeOI2hms83TGW+GBINnhDAMY8RNc2KhXDqpUNs/0C9X/MtaWR1/DkYhHKmIYAtLVXOxquz1fgKd33MBVhCkiDJbgsnBrWjtuZG34r08elEFjG8k3WjpjuaGeMS5030yq36yi6F9NAXtefrdOZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(5023799004)(56012099006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TE8qKCCJYkkfU4GPc/LkYLT29jv1XhgSwBQG3/YRo7DVSYJU3T5f2Cq09da1?=
 =?us-ascii?Q?KrQaN/smj4VwrjtHVkXsa872E8g2Y9LQfZCGsCttJ1K6S5jOiJw8d/y7aBRw?=
 =?us-ascii?Q?Ec2mmISmL3lKHbd5mGIBcb34GXtRYFcZF36Qn2tBY27vgL8aCgM1KNOBn+gp?=
 =?us-ascii?Q?1ftQHHbsatjyOCmF/xphCDob728Vf2xbV1T8xOrL/TSeV8txGf0kqNUWUc6A?=
 =?us-ascii?Q?CGXkoWQKNzjxSCjCd40grmOBbegHKBPuOcjYj+hKyxwJePdEaYMsyu9A0K6B?=
 =?us-ascii?Q?FGHS7GmrDDP7apNkjUi0Bfxf1zJvQaa6Eq83TKNyxd6XxkOE2mtljYKRNe4w?=
 =?us-ascii?Q?O5P1gH/l0WRTS96pG2NXFhDSmNDFq1Jn0FkuAcIhmwU8p+xzfVRWBxlBsuIi?=
 =?us-ascii?Q?7TfBuSCU+YBDHYNQL4f+/af7bVTXbbrT6lmKJW0xDvUOdhWO5yOyz/LGncYS?=
 =?us-ascii?Q?Mg56huzaEa697QEciN2S5fsmdrIqH2H0CBufSpo30VeathW9y0f2dB3DL8Ef?=
 =?us-ascii?Q?jmiUofd5zCp1LTus5PQnbc4xcttW+/RQ5LBKv/aIFcoVplneR4XWLAT+zCip?=
 =?us-ascii?Q?nwgYFnHf94GXrxRcQ3ijA9XYLjzD2Ur+hME2i36cPorD/Z21/F09Vl16B+SO?=
 =?us-ascii?Q?eh+6/VhaxUBL9Wv3eybV9CMKJlKgt4Od1Dx5/V5LAXa/f9wCCSWQfjFKQO3w?=
 =?us-ascii?Q?p63590uM8LqbsYVKUtKM5syfPPEh5o/dqBwqAuZvLtvx5GnR+JMtkIKqnZ6M?=
 =?us-ascii?Q?7Vb7ihB1025vg/EtC3e/ekRnYMoJk97F69fq90dtPq4dfEiXrFytv88wq7hq?=
 =?us-ascii?Q?JI+c0xBS4dDCbXJ7oWpYXUS7rYnCEC6aZr75AXzV9BMk4B1bpt9sFIy4h6uT?=
 =?us-ascii?Q?eEPOk8WfAQoqNuMz4LnFsZiCfG1Q9+q+EYDYvIRgvmN+mX3zWP3OUHe11p5p?=
 =?us-ascii?Q?4SPk/HbqKK2hYbNO0heSyx+p9F8cmdYkS/BHlVEnpnJmTvrsFihjEpTKBv6E?=
 =?us-ascii?Q?hw9IkhAZr6UkIU54cw5/xhP1sSBNPYZH9WaxwdRhtxxHbx42ePHaGrWhdP1o?=
 =?us-ascii?Q?WONbxLwRaHUJosTE7K6hLPi0XkDIkwpY4MjxQe9rBH9aQ/K+Shbnbj7wluf/?=
 =?us-ascii?Q?WcT3PH/inxuQDPB3samhiyiVwQm4x3URsriZAA8x6UKeAIMGg87BiDI7WVve?=
 =?us-ascii?Q?hAseRZc9w9R9yWIheC+VqIW9pIcfFXpn/waYPQ5pqq/3FqvOLeztQc7GyzlQ?=
 =?us-ascii?Q?qAhk7BoaQqDEa3/DvC32hb+T+XJ7IbDz90oC54E4rX0G0yTb3KLasAbJNTZl?=
 =?us-ascii?Q?1LQz5is8ugqGOVS9+lXIe+zTC1JRr513NWZ2bqxraotS84aI8HXH8/7xKL4G?=
 =?us-ascii?Q?lmVN0VzrTCo/mTZKorRiJ1pMPH1nGqVkZmAT3GHxta4JFatK6Kp86/mh48sw?=
 =?us-ascii?Q?KBCfuJyodmlU5Yc0UeQw0UY/0v7wYbLGIQU550ZJrCHg8a/G3lnL4E0jBSm/?=
 =?us-ascii?Q?5Wg2jDseWZtWy5E4o6guXaPNvS6BYzyarwdc3yAycyW1vszXC6sKOT+WYqMt?=
 =?us-ascii?Q?5sSPU48xcopAT7abysKKOMDLpY/zf7SU5FxnJ6PePS5ondp60D8EfIP03cxU?=
 =?us-ascii?Q?Jn7e+Pd/KS4OYCS5lbfngX2hChtqUVWkh1f/KcF/BAkzxO0V6OSxSsmHXrQ5?=
 =?us-ascii?Q?68A+0alfjwJpooqDDFz8b5gU6ubCHni0k2WpwOfowuZd/hcOYu0eUJvcF+0T?=
 =?us-ascii?Q?rfC39mGIhA=3D=3D?=
X-Exchange-RoutingPolicyChecked: fcQ1ZRpFGxAJz4hzXp/hs6rI3KwvFk0XzMnu17AAY0AdNNBP75OwpwPgDdUKngERGFcLC+YE3IbEobDTx2oOQA6v531bh4xNH7FDvLrdI7S6nyZCyFEY621e8QehJcZruIlGtTvoMSnWtvzQ0cggql1RoiV62CWcfniz3V65CV+I/5h+N6hcNysfDSBvolIWinAXBMRgLsjpC2+Ja3JCsxGVQL1W0eFa2hhLfQ2feM2tAAf5Pt8Wjh8R/+0+AURvQ+dnjAvvDD0cSW1vtiVp4tA8CYRy1GkMpEIvW+81kd1KgVry4wrCrZYOPZ946vPNxT6GN4CnVvoHTFslhyobqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f073ec8-726f-46ec-10c0-08df2a1f5235
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:16:52.3541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPXeBB/6NNkb7mc2kyUiXLjqqW6HrSksLPmPtZj2J1lzyY7LAYwOoAUziuqqaq1MgT1M8Ty4qVnI0PNXNrPkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On Tue, Oct 13, 2026 at 03:28:47PM -0700, Alan Previn wrote:
> During xe_devcoredump preparation, __xe_devcoredump_read is invoked
> multiple times, the first time just to get the output size.
> We should avoid time and energy waste of recompressing the
> GuC-log-event buffer and GuC-CT buffers repeatedly.
> 
> Thus, add a dump_cache structure into GuC CT and log snapshot
> structures to attempt and store a first pass at compressing
> these buffers for reuse on subsequent calls to __xe_devcoredump_read.
> 
> Also, ensure any failure of the first compression attempt will still
> fallback to store the raw dump without compression which is also
> required when CONFIG_DRM_XE_COMPRESS_DUMP is not enabled.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Assisted-by: LLM

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c        | 14 +++-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h  |  3 +
>  drivers/gpu/drm/xe/xe_guc_log.c       | 96 +++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_log.h       |  4 +-
>  drivers/gpu/drm/xe/xe_guc_log_types.h | 20 ++++++
>  5 files changed, 112 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 0d2464c72277..e865d50e8b77 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2223,7 +2223,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		if (snapshot->ctb)
>  			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
>  					  &snapshot->ctb, 1,
> -					  snapshot->ctb_size, snapshot->ctb_size);
> +					  snapshot->ctb_size, snapshot->ctb_size,
> +					  &snapshot->dump_cache);
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -2241,6 +2242,7 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>  	if (!snapshot)
>  		return;
>  
> +	xe_guc_dump_cache_fini(&snapshot->dump_cache);
>  	kfree(snapshot->ctb);
>  	kfree(snapshot);
>  }
> @@ -2369,6 +2371,8 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  static void ct_dead_worker_func(struct work_struct *w)
>  {
>  	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
> +	struct xe_guc_log_snapshot *snapshot_log;
> +	struct xe_guc_ct_snapshot *snapshot_ct;
>  
>  	if (!ct->dead.reported) {
>  		ct->dead.reported = true;
> @@ -2377,9 +2381,9 @@ static void ct_dead_worker_func(struct work_struct *w)
>  
>  	spin_lock_irq(&ct->dead.lock);
>  
> -	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
> +	snapshot_log = ct->dead.snapshot_log;
>  	ct->dead.snapshot_log = NULL;
> -	xe_guc_ct_snapshot_free(ct->dead.snapshot_ct);
> +	snapshot_ct = ct->dead.snapshot_ct;
>  	ct->dead.snapshot_ct = NULL;
>  
>  	if (ct->dead.reason & (1 << CT_DEAD_STATE_REARM)) {
> @@ -2389,5 +2393,9 @@ static void ct_dead_worker_func(struct work_struct *w)
>  	}
>  
>  	spin_unlock_irq(&ct->dead.lock);
> +
> +	/* Printing may have vmalloc'ed a compression cache; vfree() can sleep */
> +	xe_guc_log_snapshot_free(snapshot_log);
> +	xe_guc_ct_snapshot_free(snapshot_ct);
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index f88e588af0d3..5e33f9fd4cb0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -14,6 +14,7 @@
>  #include <linux/xarray.h>
>  
>  #include "abi/guc_communication_ctb_abi.h"
> +#include "xe_guc_log_types.h"
>  
>  struct xe_bo;
>  
> @@ -75,6 +76,8 @@ struct xe_guc_ct_snapshot {
>  	size_t ctb_size;
>  	/** @ctb: snapshot of the entire CTB */
>  	void *ctb;
> +	/** @dump_cache: compressed copy of @ctb, built on first print */
> +	struct xe_guc_dump_cache dump_cache;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 47adaf70d5bf..90aeaccea596 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -178,6 +178,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
>  		kfree(snapshot->copy);
>  	}
>  
> +	xe_guc_dump_cache_fini(&snapshot->dump_cache);
>  	kfree(snapshot);
>  }
>  
> @@ -230,10 +231,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> -static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> -					 const char *length_label, const char *data_label,
> -					 void **chunks, int num_chunks,
> -					 size_t chunk_size, size_t total_size)
> +static void xe_guc_compress_blob(struct xe_gt *gt, struct xe_guc_dump_cache *cache,
> +				 void **chunks, int num_chunks,
> +				 size_t chunk_size, size_t total_size)
>  {
>  	zstd_parameters params;
>  	zstd_cstream *cstream;
> @@ -244,6 +244,9 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
>  	char *dst = NULL;
>  	int i;
>  
> +	/* One shot only: every later print replays whatever this pass produced. */
> +	cache->attempted = true;
> +
>  	/*
>  	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
>  	 * (windowLog=18, 256KB window). Passing the full total_size would
> @@ -286,6 +289,17 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
>  		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
>  
>  		while (inbuf.pos < inbuf.size) {
> +			/*
> +			 * zstd only guarantees forward progress while the output
> +			 * buffer has room. zstd_compress_bound() sizes dst so that
> +			 * a single frame always fits, but never risk spinning
> +			 * forever in an error-dump path.
> +			 */
> +			if (outbuf.pos == outbuf.size) {
> +				xe_gt_err(gt, "zstd output buffer exhausted\n");
> +				goto err;
> +			}
> +
>  			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
>  			if (ZSTD_isError(ret)) {
>  				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> @@ -296,30 +310,48 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
>  		remain -= size;
>  	}
>  
> +	/*
> +	 * zstd_end_stream() must be called until it returns 0, otherwise the
> +	 * frame epilogue is missing and no decompressor will accept the result.
> +	 * Running out of output before that happens is a hard error, not a
> +	 * reason to stop.
> +	 */
>  	do {
> +		if (outbuf.pos == outbuf.size) {
> +			xe_gt_err(gt, "zstd output buffer exhausted\n");
> +			goto err;
> +		}
> +
>  		ret = zstd_end_stream(cstream, &outbuf);
>  		if (ZSTD_isError(ret)) {
>  			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
>  				  ZSTD_getErrorName(ret));
>  			goto err;
>  		}
> -	} while (ret > 0 && outbuf.pos < outbuf.size);
> +	} while (ret);
>  
> -	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> -		   length_label, total_size, outbuf.pos);
> -	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> -			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> -	goto out;
> +	cache->data = dst;
> +	cache->size = outbuf.pos;
> +	kvfree(wksp);
> +	return;
>  
>  err:
> -	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> -		   length_label, total_size);
> -out:
>  	kvfree(dst);
>  	kvfree(wksp);
>  }
>  #endif
>  
> +/**
> + * xe_guc_dump_cache_fini - release a dump blob's compression cache
> + * @cache: cache embedded in the snapshot being freed
> + */
> +void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache)
> +{
> +	kvfree(cache->data);
> +	cache->data = NULL;
> +	cache->size = 0;
> +}
> +
>  /**
>   * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
>   * @gt: GT structure for error reporting
> @@ -330,24 +362,46 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
>   * @num_chunks: number of elements in @chunks
>   * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
>   * @total_size: total uncompressed byte count across all chunks
> + * @cache: per-snapshot compression cache, zeroed at capture time
>   *
>   * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
>   * zstd level-3 streaming compression and prints the result via @p using ascii85
>   * encoding. Otherwise, directly prints the uncompressed data.
> - * On failure the function returns without printing the data blob.
> + *
> + * The compressed blob is produced once and kept in @cache, because a snapshot
> + * is printed repeatedly: __xe_devcoredump_read() measures the output before
> + * emitting it, and re-emits it a chunk at a time. Compressing per pass would
> + * let the measured size and the emitted bytes disagree.
> + *
> + * If compression fails the raw data is printed instead, so the dump is never
> + * lost. @cache->attempted latches that decision, so every later pass makes the same
> + * choice and produces byte-identical output.
>   */
>  void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
>  		       const char *length_label, const char *data_label,
>  		       void **chunks, int num_chunks,
> -		       size_t chunk_size, size_t total_size)
> +		       size_t chunk_size, size_t total_size,
> +		       struct xe_guc_dump_cache *cache __maybe_unused)
>  {
> -#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> -	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> -				     chunks, num_chunks, chunk_size, total_size);
> -#else
>  	size_t remain;
>  	int i;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	if (!cache->attempted)
> +		xe_guc_compress_blob(gt, cache, chunks, num_chunks,
> +				     chunk_size, total_size);
> +
> +	if (cache->data) {
> +		drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +			   length_label, total_size, cache->size);
> +		xe_print_blob_ascii85(p, data_label, '\n', cache->data, 0,
> +				      round_up(cache->size, sizeof(u32)));
> +		return;
> +	}
> +
> +	/* Compression failed - fallback to emit the blob uncompressed. */
> +#endif
> +
>  	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
>  
>  	/*
> @@ -366,7 +420,6 @@ void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
>  				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
>  		remain -= size;
>  	}
> -#endif
>  }
>  
>  /**
> @@ -393,7 +446,8 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  
>  	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
>  			  snapshot->copy, snapshot->num_chunks,
> -			  GUC_LOG_CHUNK_SIZE, snapshot->size);
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size,
> +			  &snapshot->dump_cache);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 3e97647ee8b5..bb6415271e5f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -63,7 +63,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  
>  void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
>  		       const char *data_label, void **chunks, int num_chunks,
> -		       size_t chunk_size, size_t total_size);
> +		       size_t chunk_size, size_t total_size,
> +		       struct xe_guc_dump_cache *cache);
> +void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache);
>  
>  void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>  			       struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index 02851b924aa4..a38e9619c95d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -13,6 +13,24 @@
>  
>  struct xe_bo;
>  
> +/**
> + * struct xe_guc_dump_cache - cached compressed copy of a dump blob
> + *
> + * A snapshot is printed more than once: __xe_devcoredump_read() walks it first
> + * with a NULL buffer to measure the output size, then again - once per chunk -
> + * to fill the user buffer. Compressing on every pass would be both wasteful and
> + * unsafe, as any difference between the measured size and the emitted bytes
> + * corrupts the dump. So compress at most once and replay the result.
> + */
> +struct xe_guc_dump_cache {
> +	/** @data: compressed bytes, allocation padded up to a u32 boundary */
> +	char *data;
> +	/** @size: number of valid compressed bytes in @data */
> +	size_t size;
> +	/** @attempted: compression has been attempted; @data is final either way */
> +	bool attempted;
> +};
> +
>  /**
>   * struct xe_guc_log_snapshot:
>   * Capture of the GuC log plus various state useful for decoding the log
> @@ -36,6 +54,8 @@ struct xe_guc_log_snapshot {
>  	struct xe_uc_fw_version ver_want;
>  	/** @path: Path of GuC firmware blob */
>  	const char *path;
> +	/** @dump_cache: compressed copy of @copy, built on first print */
> +	struct xe_guc_dump_cache dump_cache;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
