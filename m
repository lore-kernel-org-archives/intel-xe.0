Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13505CD4F50
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 18:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B197110E33A;
	Mon, 18 May 2026 18:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfSO1P19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D2210E33A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779129895; x=1810665895;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bOBUlSwXlfWIOuN3LA6gF4ISwDMLsr5vQF2eS1XR2Y4=;
 b=FfSO1P19kNKcWKcXagtZ8q/G9gpOQIatrHRYqhD+wIuYrD1CGhgcG6jh
 9M2+3oNc7SHq3v3ZJI3MVXTVdAjiNuRpRvf75YA03+cXA0AOLh7xRcPpT
 Lb5f2AAIv7Hiqy6FTb/Kh9QkaUA9qqE5RONgdPFC6J+9osrsOqazZkG1J
 PS6sCuKl3BgY5NXW8uyWhcftai9xNZHvS5XayQbbRj41KsYkdrJlXm0CD
 WDqVu0UXHlRBAGNaEkZWxxJDv/aV716neTdf89JXhQy7oD5ywFwkkexd1
 aY2D69TS79OA46/jB9Q1ofuVQFmXt8ti8UV+X+Tv0VjYEezrngMCk3mX9 Q==;
X-CSE-ConnectionGUID: ukEEmmNWRAqHMGSSXuXNQw==
X-CSE-MsgGUID: 9oJ/9wWbQfWMQJt7OXHaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97427005"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="97427005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 11:44:55 -0700
X-CSE-ConnectionGUID: Rui6AHsuTcy+Zb0TiFGiKA==
X-CSE-MsgGUID: rcq/MoyzSuGK5dT66fS4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="241346136"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 11:44:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 11:44:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 11:44:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 11:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp02bDBV9xd4digPV56+2EImi3WVV+aw76K/FBnWeLBhNftbRCeiiNBOGAm/8X8hpB5RuINFMAbFvkL8eg8ssK9gcCcHcwclgmZwfaWg6N1JUbZEb/yv+juLY4uYOvVmolRar8oGAtqXoj6TWOJOFb7IkeWvi5aXGzMPzLh1l+VUZGXfaKpeqa664AS9oRavEmrWTQeaWCbVDaf6DYcO0kuPgwQviEnZDsqzUKSG61JcCoJyQIYBDbBUx84jal2CeW3wpUKpGKTe1LnIzB6dDN6r1BEl9y5w/BtJY7WuGAOroPxl0ngLN5ypRR7ZYBOj6rysKhpJYg1tIHAgvWPE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYdSB6nkztDr4DF1UmRFVTaei0pZWV7a55hZFAACCVE=;
 b=EIUTiwfh/DoyShVRqego73kB7eyPt3yJZ5urARO03fclAk4g48iD+VHMRNQGlzVj1p5ht1BrihiD1+vNdKQUSVnjwaUm2BY6NBWbleQ8Zs1xqFaTYmEP7zyZO73D3oWa3J5wwfVyolRCXb0bPUZk3xTqiS4PJ/73LZafE/OioFo/FJkEbr+nv/M+Pqxz9zmYOZAUgTsUbpF7rF3FWxJs1cfh/Bz/pVg9A4vQZRzK20IvcXO7pJn2rMQkcXL8bP8fEwTjQZvxHuHzpby3Q5j8LiTM+0cIf05k3r0ZARAkoowV8umhS9gjaDkl1UqXJ38i9IR9M6Z/56vPfRtgH3gR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 18:44:46 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 18:44:45 +0000
Date: Mon, 18 May 2026 11:44:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/multi_queue: Fix secondary queue error case
Message-ID: <agteG0ANaDdWmA5P@nvishwa1-desk>
References: <20260515210450.249621-2-niranjana.vishwanathapura@intel.com>
 <8c150600-7773-4644-9c29-83de7db2b96e@intel.com>
 <151f260e-0361-4a0c-bd9e-3c76fc22a347@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <151f260e-0361-4a0c-bd9e-3c76fc22a347@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 04097eb1-810b-4039-a37b-08deb50d880a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 2rMotHcen43KWeOh+Dl5eQbsyDHxk2EQ1JN30s4bFi3upjNM5LYlNFHnSp7dCR6tOlIj73S57hFIcGPsaA9LW1sg+4q+IIbxiSSiqjP9ZqShMTXJuPMnfvbodDvFRhK2324R5+VZ0oOwR6h+HJHHx0jx8+ru2s8REw9adtpBoBNrRAWeehRM8mAMBOCkwsuYvmi/4DHWoRYPoVp2OKPTd8w8fY7tbO+P31ak2Hz4AI3solCbnOOVmZ7SyDCVf506ZMfSEmhE2MFzjSg7JRXR+Ql6OQt2FxgP8k6zgMtSyCAhpyBCzS2eUhAB1CoBEX+ANufZ7KTNtPY5ooZQeOB+M9bnujxodjr0R4+CmSbxxOhjgi6qFdG8+9RNNchor5prQ4zLrnJrWwgx0l8VsNWefte6bsYs2RgW0pZZzoucwJM8GrTsPVNldUDualZ/X9y7ECSs30f4W+XHGUt++rbTNoMKzLBddNwrxnmCTK9hcFaTF+jSP/ueg9i0/YApJTNo4QNaiFt4FUc3bIwIl2+7r/FiYIeOimNHl1BKMX0A/PqmMWSOZuMWBoih04R2eaKx+iwgC/dEb/MlY1rOrbtrUNDkvvZ12H8Jvd/ZtgWGc1UBvQV1/oz0Ko3VhkSF8Lx8awFE0UqwO2zANqI46ZZz4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cfbNdQ0c7/pYYBXCPaWqHJNTCPoNykqQysviLXNxy0h5pseMi10Ft1QMCe?=
 =?iso-8859-1?Q?+0MtFz2a38WTUwtMVmbKuF0RSuxb8BUmkAi70XPswh43fyAUYqm9Ysu5k8?=
 =?iso-8859-1?Q?jmxjnsHThPjwYNhyQn6STMOA92PKPkW+agGxwzGCY7maLMJmjyyDcBVYsa?=
 =?iso-8859-1?Q?z0xsTseWvekV2XjKSH6G+84LP6H65tju5jZzQSrKOZGPH33dMWaFOLFUGR?=
 =?iso-8859-1?Q?IryoeTOLwdEAqoESPxbRe2wbZpRwZU+my1r/GV4gLycbi2xfnvvN0N3/n3?=
 =?iso-8859-1?Q?Xaq8NoB3pFU6AP4uCAUS+6pasLT8VCRPH8TAyNEkFk+GYn3zMXC8M8drFZ?=
 =?iso-8859-1?Q?a+vA1Z5Lw+OxzaS4MRLD6KjyubenLeYYH49rhBV1QJmxFzHZzrvsOkVunG?=
 =?iso-8859-1?Q?WLjIvGceCmQnkol7OUwVR2RADWdQG5/mSnL9mDOSmsPTQEWAqvUQ78NOn8?=
 =?iso-8859-1?Q?u4a61cTvNuHZkdrYWr+/j9aHXOnNr56UTtmUNNQAr+h0Y7WfrXC3dOanPe?=
 =?iso-8859-1?Q?GOr/iJEd4M09Bck3YdjP7WI8eIqxSCkB4+WQkR1rR3o26WeG+00izzsD13?=
 =?iso-8859-1?Q?SUQKs587LHKiiIkhdO58Bm/3vAlAjuaD3+NBz9EFzq9yrPEuchHwgLi5k3?=
 =?iso-8859-1?Q?pjN1CIKCxTg95VAfqoe0asyMNJ9nJhbq8llt+b9ICyuKBlplpq9bElAMEi?=
 =?iso-8859-1?Q?wGYQZRcjiHUSM09jabFOCiyYYFskgZb2mcDn+9mZAR7SoUsrCiqbcqCAJH?=
 =?iso-8859-1?Q?Q1XVOXYDbfQfuSTCOSLuMS4d+hgUPFKelItEFQY55ZLt6fWA/UEojK+f8O?=
 =?iso-8859-1?Q?GC66PXnL0LIFY/KYLe/YaS1bBZ9UQIMAZsRBfMO3pHYEtyy+IvOJVhaLEY?=
 =?iso-8859-1?Q?zd6JH2iUS9IAzUxkJPmbHm/u18PoGm2mw68pG6Qu4y0VLISkRps9oYMzEW?=
 =?iso-8859-1?Q?+tJj16WYqWWw6ScKcAPsX2LDYewNV07E4C6CPH5oFPIutFapxiWeyHzOb/?=
 =?iso-8859-1?Q?Onys3FPZC1skWUJBnMA9yRLNdjgz3Y5cuUinEMcVqvStDZe4M8cir1TWFO?=
 =?iso-8859-1?Q?V+ajY11BT3QUsHZNkhysdyb3seogh56EK/Olrg5UpHiPF9FmZt3Cr2OpGP?=
 =?iso-8859-1?Q?oGvhDGZChBANXBRVtK77sVdFPeHgNLrcve2CSgsPcvePpID00IS+7uY+BW?=
 =?iso-8859-1?Q?533ANioRVixT2w0DJupcoWD72xAPDsM3FfbVyJkI5S9Mc5HJfHUdriaFCx?=
 =?iso-8859-1?Q?HoiY/lo7brnVxLvnL0MVxfupGiuvQ7DdbgJ854CjYmisDD9THckWjIY2fc?=
 =?iso-8859-1?Q?IS7e3gT0I7kJzP/iP13PaiixL6cqO77wtJxTf/ht69foCJEEvu9pZn9IAy?=
 =?iso-8859-1?Q?fHJO9EL1hV3H0NGyZsKJLMapL1BHfgleSg8+l0A58tHzbwZ5WCuKFSN/9v?=
 =?iso-8859-1?Q?dxCQIkprP1Kw3PEHHPqq+1BGNo6IIqBdwki7Wia3AoOj2/1PvH919rgiXW?=
 =?iso-8859-1?Q?QXJ0Wt4ge+KsUwnlS6KKvV87hkbAgPW0hqhjsuib/hzQplWsYuxFFy4VVM?=
 =?iso-8859-1?Q?oyhT2FUf5uDdM2KP0JmBn3KEykxDFA6ZOZaTz0I4SxRPRpRoDkGzydBlgu?=
 =?iso-8859-1?Q?7LB6QBA8f9kHl+T1XS00Zi7pTxb0/0gZw2BpAkdCxFdf5p5tbCmNgPDfLn?=
 =?iso-8859-1?Q?o0XlSDwhYHL/9bq2FW3wYpvTRmVHPH5dzRCYHQAOwIVoyuh1xOSDmqC9hc?=
 =?iso-8859-1?Q?Vh14D4Xil4sF5dNVNY0r55d1wnHj/29xvHBqtcN3rD43ydQy93AEaltRjP?=
 =?iso-8859-1?Q?M7bxDy8Z5QDs9JQqk7Jm5EPHaKp8tEYSyO/WojY1bdyTbRIHDid3?=
X-Exchange-RoutingPolicyChecked: A07F5UfrIu+m1rcCyj4JKsXpnymXUKseNb2hDJj8x5RtCM12QfUbHKBnpv2PBtST3RAIRTgCmpxC99mI4YkQoblfCS3XaDDTMU0gQTC2YV1qNgeU+Fn/dtH6G2IHw48Iu+aV6wxt0Deh3Ug1wzeI5rWNzboRB3aqEHPJwkHeIF9xT9oU3FoCBo4/hlaT5mmZ2qCH64XMCOGfdKEDk75PnVp7U6UPeIxdqLK6k2IMWmif3l0f1URwbc2Mbz3n/YeQJSLcWRtO+4cyQz68tgjffeuiIwu68dpeOhmo4t4/9z5nJpo/SNtYkgA8MXpWMNC8eF3rfPfza0Hqu2J8RJUcXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04097eb1-810b-4039-a37b-08deb50d880a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:44:45.8374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh4ZOZcunbL019/h61bHf3f/IrrwHZY4GaT+wQ9nsMoAEMiIFIoDv/1zertNXhEdNSIofi0TOleo9BA31CR1bpxEhr752mN+bUfKjIANNs3AU/MqezgqCH4gi6UuLQ6Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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

On Mon, May 18, 2026 at 10:15:20AM +0100, Matthew Auld wrote:
>On 18/05/2026 10:01, Matthew Auld wrote:
>>On 15/05/2026 22:04, Niranjana Vishwanathapura wrote:
>>>If xe_lrc_create() fails, the secondary queue added to the
>>>multi-queue group list is not removed before freeing the
>>>queue. Fix error path handling for secondary queues by
>>>removing it from the multi-queue group list at the right
>>>place.
>>>
>>>Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a 
>>>multi queue")
>>>
>>
>>Can drop the newline here. Would be good to also add:
>>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7979
>>Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
>>

Ok, will do.

>>>Cc: stable@vger.kernel.org # v7.0+
>>>Signed-off-by: Niranjana Vishwanathapura 
>>><niranjana.vishwanathapura@intel.com>
>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>Also maybe double check the analysis here: https://sashiko.dev/#/patchset/20260515210450.249621-2-niranjana.vishwanathapura%40intel.com

Ok, I took a look. I think it is not a concern as the initialization failure
path and the timeout handling path the above analysis is talkinb about will
not run concurrently.

Thanks,
Niranjana

>
>>
>>>---
>>>  drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>>b/drivers/gpu/drm/xe/ xe_guc_submit.c
>>>index 4171eff4e8ad..afd8cc7bd231 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>@@ -1665,6 +1665,14 @@ static void guc_exec_queue_fini(struct 
>>>xe_exec_queue *q)
>>>      struct xe_guc_exec_queue *ge = q->guc;
>>>      struct xe_guc *guc = exec_queue_to_guc(q);
>>>+    if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>>+        struct xe_exec_queue_group *group = q->multi_queue.group;
>>>+
>>>+        mutex_lock(&group->list_lock);
>>>+        list_del(&q->multi_queue.link);
>>>+        mutex_unlock(&group->list_lock);
>>>+    }
>>>+
>>>      release_guc_id(guc, q);
>>>      xe_sched_entity_fini(&ge->entity);
>>>      xe_sched_fini(&ge->sched);
>>>@@ -1686,14 +1694,6 @@ static void 
>>>__guc_exec_queue_destroy_async(struct work_struct *w)
>>>      guard(xe_pm_runtime)(guc_to_xe(guc));
>>>      trace_xe_exec_queue_destroy(q);
>>>-    if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>>-        struct xe_exec_queue_group *group = q->multi_queue.group;
>>>-
>>>-        mutex_lock(&group->list_lock);
>>>-        list_del(&q->multi_queue.link);
>>>-        mutex_unlock(&group->list_lock);
>>>-    }
>>>-
>>>      /* Confirm no work left behind accessing device structures */
>>>      cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>
>
