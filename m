Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C7DFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C431A10E92F;
	Tue,  5 May 2026 04:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mk/uBzij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB3E10E92F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777954624; x=1809490624;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3YZlM0Hn8rvSUcVlXfWeSKyITc4NmHRBsu+dwbt0t2M=;
 b=Mk/uBzij/6OAarQUmWiOWDGa/jPIgZW4eDf7l/82mtfDEOnQ6b0j+u1a
 H6SJNOYrgga58KsBVDRBKt51tZnE4ZhYAEfYb3QykMMjuZE9P6RWs2rkO
 9BGU8meKwvyO25nV6KDrILd/k7jdgM3+tQPfx0LV1JQDp7cLZu6K60/hW
 SI9xVgyGz10gx5WSZJ5SUiTAEgUZA8xsx3y17u/eLkie/HMgGyL8gjd5y
 P8rIhZ8xdzp9S+P4uy93TZMayCZYJWu3FY3vlXAG/hR9I23wqbFEPEHFk
 wOxlC4yOUtyd6Vg951Xn8gUno0N9kRVqDdW8D3ShDL3CTw8t0Gi8jj0Ij Q==;
X-CSE-ConnectionGUID: RV7za/fvRXWXoh/m3NVKFA==
X-CSE-MsgGUID: REYcZanDRW+AXEZk7tFc+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82669569"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="82669569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:17:03 -0700
X-CSE-ConnectionGUID: M65JUIf8QK61YIUttQw1Rw==
X-CSE-MsgGUID: Hx6raGfeTm2rKNAJZtAO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="232562855"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:17:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:17:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:17:02 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCr0G4yCTTLgknSPR3bmZVNIbI7ZO8pNLwzTiG0WabuLtlb0PH2n0pSwKwIyLHKSjpKZiZNAsAGf+AHXJkWYs7+qaorpZncN7RWJEfIN9EaD8ieP8hObf34l7th/xVHAOA8sskrEnSheZyieg2Q1hlAQCHwVs5AOKQBoKjUgi+yAhrn9eJWPLKVrugpYh3fpxhAsLlh3/+GQY9pO3rUv55yG+OuPrR0SMkwyXgYz/DbRl1M0dZq7wL6/U44GkaLZ2Z+13GgeNF4F+ihPaJiwMhlBEnQmnsSG0Aidd1V7k0OHwkMrAlwpqP7DzECZWKAhqtxwnbzT5ztIoGfxyNCCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/03xExiHilDjzBPckTyHvLA1DxkzPUFXerLoGBujXjo=;
 b=DVupr4jzRSaS5UFN92RYZwCs2XGd5zYBlgiWxtBJ2/KPQQUnHZfqmDifx+by0tZdwr4QJx1K1das1bzxAVXDPAlEZ6hkqFJbYpzOP0ZPcFHFBDH5jriyPvtmy55mcZ7/0YtxzK2u4aGQu647nrq9J1g8+ibFoZ+bDj7xOQsQMPVzv/JgGEDbE7Q7gIll7YTb+z6kZBK2iXpkFJdtQNZVCDV7lzgHPFo7a/FLFfInm9JSQLFl/aPK2EXFTexMdVBfvNBwJ869IL9nDSEE9dgTReb+/FxdrCWUn6oA13omTVLqqZPqGxa8gvR8Yx/PeFLv/DL/3pmCZSgVviJSZc7K4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 04:16:56 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:16:56 +0000
Date: Mon, 4 May 2026 21:16:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe/lrc: Refactor out engine id to hwe
 conversion
Message-ID: <aflvNYselsMZwDNs@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-16-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30)
 To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1d7126-eec2-4e2d-88f4-08deaa5d2533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: hQ2pJdb01CC+HxeqBv+JZyz37bQKgsKDcNKIwuwDYySaWpjs55poo6X+TU1zPSS2Xlrmn/0ed2j7quu8SL2BsJ5vQutLFSkJaFf2ZjBjsCVr7Ubb/74Id+2PdjvyhwCArA03sx6eGW/v1/BVMT3HEvd1z6xqf81xF12Fev8N6guzam7YSRGGvzbh+v3NTRm/HoY6vdZOrL1hCWQg3a2hVRaAfraioGJugft56K1UdjP3CdUKYbA9uUlJ/kzSwB2Q45kmROIDuNjCAtEMmuMDLyl+0OgKRbuMSogd5qyfoXawW23o2nzcjFNEeSzvNeBv0eXEJib0oZBjNrI7un62oEHL00nTiZnOgCdU3lgzYh2Io1ACQTTYicqMLNp1CazuAO8Y/l0nx5YjYKOR928BpdpKWzmPhpIC7kvTJ/Fj92Rh1rlBGDbx/EnqbneFwJSD49MFIGd2AygliUpOVmAxYKtolbaGvXL1B+ilAv56WUObvYZNuytXaQUzc1b7Wfk13Y04M2UqFoVwW1KcMWPJJGqjpPjwQIbG+PltHr/gEr+cHh+q/oZ1UjH3CEUY16CibkW/+OvVhJxOE1jktl7v+f2Kh7y9KhusC2KHBVirxv4EPcbPy3jZXCfZRQrBZGzxk6XIU482MNSDiQgSkk4sYJMa9D3L0Exo9KcAEPCOEMmBbGEihrqtYGPjyy3Cv/qC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Oax7sAr4h22/vLpNPLUEdELepvJo9jMJIq1VtieeL/hx86uR7R3Fm0vdj8C?=
 =?us-ascii?Q?LRTJPD+q/np0hNBGAu2Fw2K8FwKWHzXXU1rnI53OjqTqboAnVAYR703I+Bji?=
 =?us-ascii?Q?rDAiCtkmTLtqWfCUtk6eizXJdAPqu1uyrLoQgyG7SRAtAGVeal1anUUXq5sM?=
 =?us-ascii?Q?W9+XC1FlrAm/iojDQk3UDgWeF5ekP+0GiXCREGMKLzL+jejXMundAT8aoPdW?=
 =?us-ascii?Q?vgjZ6CweU2//iDM64swIN7Yf4NXMcl0SgpMB8X0GdArZNGmFIl7RHGYK8481?=
 =?us-ascii?Q?WioSQadXWq5gXrPri2uW9YnatPNLLX6GVDLaEkePbE7CJdRNYTEyMwRzej3Q?=
 =?us-ascii?Q?XuVWxyDRyTxHOu5/yps/65TqxgUdorQChl4t1LUymMBp/52cdShzNEE2kOd7?=
 =?us-ascii?Q?6ZEnjSv3SGXc2snU4Rikte7OYtHY0Pab8mcH/3jW7drJVqgeFgiwMDOx+Kn5?=
 =?us-ascii?Q?u/q7ln0GajCkl8mdWbRcUE+cm1rMMtiiZ1Z6xoULMQx9gjvvyAFZa+ilbjsv?=
 =?us-ascii?Q?+fYh/MiQ1grXMQrn/LkVgEhj7t2p2g7zgeSgCAAykeyWaxv4ysQa8jhaCB6k?=
 =?us-ascii?Q?kmhg19qzkLVY9vofTHKeKRi9qin/uXEs/hSMmAM1CCIMH0fU0qlcYWzGNMwn?=
 =?us-ascii?Q?7MDL8GmeFs4BZC4YzXVAMDRMWkXMJNuw6oB3zI8888e+0rBvsisJScarJ0TT?=
 =?us-ascii?Q?M4nQwvtFBngYg3p65mR1wRWvdpbhNldSVIq+RWe93/vwNEXywZ7EfmeBOzwR?=
 =?us-ascii?Q?2bzJj3bNcWaiuR0j6pJuVtkuyhqoq66q11bCtvxAkOQnfhGj+5rXHGMLgXdQ?=
 =?us-ascii?Q?8VoY5n8cJHcfTIHAs9jKJAttY2zimz8HHSVpT33MHV9L4cRHKufB2EbOBtwC?=
 =?us-ascii?Q?QQRUAQW3KKL9WyW9s1Fv4xpP7YKo7G5zoMWoXPFedRi3ExKaeUVeVu4wxSJ8?=
 =?us-ascii?Q?lWNzSkESiZOyM71YsCOlUyRntnW4Wd9zad99JqQ04QW1dya9rkoXe2ldNxz8?=
 =?us-ascii?Q?wH756suUQqkzAtAlbL7rhs+pifkOXmuwXyxSOiFf9Rmt/L8GvrgyX+RjkZYp?=
 =?us-ascii?Q?A1YviTQTJKu3EwLk/G6np5qCSp7+IKouzjrlA1kTNedPbB54qjfBGavuKO79?=
 =?us-ascii?Q?mjBxuWIDCAJOXFE6m2++hfkJF9iVgjg3apYIp+8CaKxZK3DX6prJ/2vqRBNt?=
 =?us-ascii?Q?g+fDR4qrlbuVM3Q22GEcSmUEL0w/dyP+u64kDFqVTjOT5Mn2p6D3eHLpS2Sz?=
 =?us-ascii?Q?Y+Tj8RlO9CVtgLChZXK/i6gWDJSnoowJEdFU4cAg8ytsfI/agHfv82j0GI4r?=
 =?us-ascii?Q?sBYxuwKlsGUr23spUKICylGed0iuzFhHlVly1ARDZTbmqWThrngByeSP63ua?=
 =?us-ascii?Q?1V7Dq8j3CpZEqTrVf1jb2+hRTqgCr9wp8wLiXspoIv9M+gVSNog0X/L5w8Qf?=
 =?us-ascii?Q?Ls46Q9D11137FE3jkz8Y2+r6m1QtyTaEy0ebFEYjQnccXWzx7C3/efCm3oDo?=
 =?us-ascii?Q?8r+ZrDNQZvc1ZUQ8/iN83WmbaBD+7btyn467GiM5URPvFDc3uIk6SNDr89B7?=
 =?us-ascii?Q?PG9gRLEq6liBe5Fbknx7mfmfleQldhP29Iw49F3N6h9fc7AmwbJ6dPaeSYrn?=
 =?us-ascii?Q?nzqZdkQ+/Ijd+bSVf0YFaxBCRMR5dCr2M/qHtM8jiWm7sikhfK6LUJ7zYB5Y?=
 =?us-ascii?Q?ko6VewfFrqK/DBb2sPxTe2tQgzQ/NZi/Bs5d3kGqwQp34zFxHRjgySqzZeYw?=
 =?us-ascii?Q?O2AxRnB315tlVpeofwpHExpbSzKwPX7k7JH8SjUUbeEVr0iqBiCq?=
X-Exchange-RoutingPolicyChecked: VHpcaVFL7jrMlE8Q/5TeWCnFQv6RNK1s45+CxEYevY4T04GSQUjASb66NG9p9Qk1uC8s1tseJspbLpgDeOnFzxjRiy5gqS6SnhyUvKtGhWJEREEZnMWyS0BFamT4BA1ZHKMBnGMtM1+AP1Kma+7uUbHwjUhl6h5XTtXUva7acGnlrm93eLrkTFXl3bw5kpGWx+G6WBIcd0+c2FnR9O/9JCC/dtJKHsFdhXJLEMWZFkGZvxzR+GJ9xHn2PaKMfv5T+PTMN+MiBPw5uSApU1CSAwcK5rpNOUNUwOGwDhdF8uXrwtREdWtxjr1TBb0CBhKul95JE8VJK7x6Vpz+lTYM4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1d7126-eec2-4e2d-88f4-08deaa5d2533
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:16:56.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWT/tFCITVARMmAZ2HCTfZH+NfdjS6EAwbzaAScTcYK4vr3Z8OD94r92lDFdao3gjSb0cSRN06NbVTcR6iTFWC9zCKhPPAzg52DhgJkMtEscXJ1uHERUzlGEWUKhajtZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

On Fri, May 01, 2026 at 05:53:38PM -0700, Umesh Nerlige Ramappa wrote:
>We need to define more helpers that read engine ID specific register, so
>move that logic outside of get_ctx_timestamp().
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++++++++-----
> 1 file changed, 15 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 2ee52efb9219..92419e5058fd 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2620,17 +2620,27 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> 	kfree(snapshot);
> }
>
>-static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>+static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
> {
> 	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> 	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
>+
>+	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
>+			    "Unexpected engine class:instance %d:%d for utilization\n",
>+			    class, instance))
>+		return NULL;
>+
>+	return hwe;
>+}

Looks good. But the error message doesn't say which function is causing this.
And also it will only print it once though there are multiple paths (scenarios)
to get to here. Probably that is fine as things will be broken anyway if this
happens.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>+
>+static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>+{
> 	struct xe_hw_engine *hwe;
> 	u64 val;
>
>-	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
>-	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
>-			    "Unexpected engine class:instance %d:%d for context utilization\n",
>-			    class, instance))
>+	hwe = engine_id_to_hwe(lrc->gt, engine_id);
>+	if (!hwe)
> 		return -1;
>
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>-- 
>2.43.0
>
