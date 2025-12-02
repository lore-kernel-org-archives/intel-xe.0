Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63691D1267A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DFF10E6F8;
	Tue,  2 Dec 2025 22:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwm9fblm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C82D10E6F7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714289; x=1796250289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gusn5qdDNYZwjc8Vut10ZetO7qnZu+DwiV9TIpzr910=;
 b=kwm9fblmouXL5T6DG0YR23Adt9NCzP8rNK/JbDM2Mup4au5Yl7Hs5zPZ
 I/J1dCYIsCjaEjSddBXy6Q+cPkhVWoZix+OwYF68ebkmpul5QkSU75e2f
 WKQZa2lZq2anEHLL+JhtraYxfxHw8Qdz8nLjKGE7KLk3B3iqHOhBk5OK2
 HSSoXTH+bicymORf39+1lEZ+hCk4c2xJFHyEcoAuHdeQOq3KPpZlyQ+1h
 zOwcS11X2phjuqA7p654UKATyJ6YdDf/Ytci1LtGV18J9iGDY5wyPUa/+
 95PbnGzGlwiem3zb0K0jeh/LVXjFsKnyaLWV9mkJynvVDzqzzvrrIYku0 A==;
X-CSE-ConnectionGUID: Ac3pUEPZT7W7jr4v82HMxw==
X-CSE-MsgGUID: d44yoreWS2yr7/T5xpMI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66418967"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66418967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:24:49 -0800
X-CSE-ConnectionGUID: KZSdSh4PQ4+pc7c6mxgqCQ==
X-CSE-MsgGUID: RVsU+KGfTQGXRmdQUwl2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="231837019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:24:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:24:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:24:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:24:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/mMnDgmpwMFzSksYXLJQkjTf8afXwYXR6Bb1SeA5pJwUvEjLjzqozvGUSaIumfBvWTk6Ceif2r2yM9OQSZRP/iX5jGlYne7vCvx3X10tSVv62FYCDWa4t/elePps0PWCu2pYWDkJFduTFPxe2ka7TYBQmv7kW/Qwvv2fZb9ZGnhx+HIoP0zKjRQkHWbb6eFvIdNM6TJ3yaoiM+wtNbRTN+Q6lGcLWlWZ1eeoWo5yvuy5+hT+lKvYxS7t/UTLW+suT1HXvNlv9KTF2L6pgM0nwsfZYRLMYzyxFy6G0h0TxA3s971TbM4Gf55VaQ8gtZCCkSACC9floebipsRZ5sAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVh3rllKcvGIIl7gBygTYju+3boPy9yd+C7p7gtlXn8=;
 b=jZldMdGQmJN2LzxAyvhal8f9forpK3x1oIRn+BWYFU/5RU57har/EZ2ecs2LGJ1Se3c9+ZdukK99MGWVki+OiMn87OM22NzIFOpg62WIuyhQTkKuQ0jLUiYKKSK58Yo2aHIYYEEW+8/1oNdHfj1gLBGWBK85gUzfgXOrC8F9wicVU/BirRBXRhUeyo4af8wAo7mo1zOS2mjSQ2boqtwUomHe9P6IDnL3t0DNSKgFaUrMFlmh4RI/h/JW4Aqh176+NRD9l5fCQ0xoid6cDSpJbtk3CJnvzB5+AnlrgtIK7R2X0F5qBx2vQGhYQojFeiCzUnNZxiXS3wOH8KYbT3qJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:24:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:24:43 +0000
Date: Tue, 2 Dec 2025 14:24:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v2 02/11] drm/xe: Reset tlb fence timeout on invalid
 seqno received
Message-ID: <aS9nKcC+7QR6hWVI@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-15-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-15-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0241.namprd04.prod.outlook.com
 (2603:10b6:303:88::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e1daba-6a32-495a-1f67-08de31f197c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tLznSjB3Hr4Oei34oi3C6VbPfrnNDcnHbGGrP3q4Psit3el/PGZsmY5ub18X?=
 =?us-ascii?Q?BfRtKjayOpbN9lPf0daZtSRdE4YZXZrs06Shp4L6Av3+PntbbsV+TfchQcj0?=
 =?us-ascii?Q?b497znE69tcIFKehGNeh09MKA4t6ZzFZ9186vj/7UQfv4YZfivtCKGT1oCHX?=
 =?us-ascii?Q?fhwatvsMCNuKIr6q6OJwZa21x9/jqyNcv9mzRiq8jqCxDHndwH1J1fv5++Ya?=
 =?us-ascii?Q?/Ue9hXecHKzeywCfh3NNMyKPcYXnQDgSVDFBhq4eQJ0ZKmdSNL312M3t7Aqj?=
 =?us-ascii?Q?bWL+WFkoY5o/3oSU2fQUyJ3c4ww0MbTHcdVST2DZWGL3AR975A7q3vlrdkf5?=
 =?us-ascii?Q?HF5fiWQtY6XxaAoOKEGeYmlAB5e0C/m4B+iL89Enz5+OXiFqiVHm10e2ToAe?=
 =?us-ascii?Q?jPDRfS3Xas61g4l3QHIvnlCgQvV6qHSWN4LespGEqX4ZoMvSEPBZ+m5j5nQD?=
 =?us-ascii?Q?XxlqvMNr9oGZFXTQDYWVLjenzgRny9gMeGOG/TTz3fhVwbox3/yNN0hROPrC?=
 =?us-ascii?Q?XnPDNaDWi0x0WPVB1PU805pSaL+z1Xv2naa3EF5fVSbhJ+uvFwC99TFFHKaZ?=
 =?us-ascii?Q?teFgEd8KbpvEAWKDnmW7KUlOyqh5v4P5j4WzsxYqIlcmC63grKf09LqIJWcD?=
 =?us-ascii?Q?i0l9Sd+esj/hMAHTjwi5lrHLVKcBdeP9QtJP+nffGX3Vo17YgQxu3t93F9A3?=
 =?us-ascii?Q?DyQ2r/TPNCRroSfJjDIaviRvfGiqrmyuNTpduBIDX341WtA6hHOb3IIX/Ke3?=
 =?us-ascii?Q?ycN8DOMuLSj36de1xMXbnh1HGr9u6LpHocTrBfbHI28WCzffPvaWDtSyayEc?=
 =?us-ascii?Q?qN8wLx73+9DfzM6b0ur+OMfUzu+npvwfocSWgOBEzX/hb5kWVYaS93uxVTBv?=
 =?us-ascii?Q?dNxUxTEfwzGMj8x2lz76Rob5kv8oU9JJ/XO1RHIQrjBHFHaPrtcPkR9bvLwA?=
 =?us-ascii?Q?ba7MWkdEZ97BgozzFTNCaYMciM/zPnmLmpD37C/lGhk45EayKz1U/uMwbFH5?=
 =?us-ascii?Q?+LXW6egDOJirRaNlA+ogx1jB9buF9DN6HFfnESTD7qd3EVRzcTowuhFEZsVC?=
 =?us-ascii?Q?GvGMJWpvChk6ziUf3pcINg1KPqoqN9KwuJQrjVTxI1j0CuwOPO/qZ5WtXCDC?=
 =?us-ascii?Q?eEDfuhqQNVAmRTcSx0S3dlDBQoYWnYTXo+6AaYryOZ6qvAQlvV345pvRbant?=
 =?us-ascii?Q?gWYyfBs3YKKefTlPm8TavaerKTFw/NNM1/XRf0ul8obeTalvZADSLXJnj5jE?=
 =?us-ascii?Q?aPHLF8bb04pf4KwOHQZ0Hn8uH2kcfDozS0suex7pjdsDPX4G0W5dC1KEPEBD?=
 =?us-ascii?Q?dpr571aO4nbkJUCUe8Otgix7aLb/OZdVwNNvs80d+bJ3B+vkc0vH/7JGFe4K?=
 =?us-ascii?Q?KCPAoPEJeS4dv8f+8ktAgl6oMIdBLadVGTDGF1X539tCr7TGotR5G24vBJu5?=
 =?us-ascii?Q?Gi6RK72+7pfOUjmgR/D5egmMM7fesot4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2qK/Wj48VL3kVxxtnQjtCo0LTy+ox9Kna+/YFsfASX45iZQpzYEy/t5pEdrr?=
 =?us-ascii?Q?DKmQ6svulIyDgCbHpr6Zyz0Jaa4+pyVT/wuSv9H+WjrAZT2J5CTaCtegabuK?=
 =?us-ascii?Q?4npanOZgzG62ypzSd/UzctcuWlL9qPqIvSMDW1aE3HkJFcg8beO1HsZ4eVwv?=
 =?us-ascii?Q?5d9/7D8Rocs7xnL/PyWapYili0f2aKBQkKpMuxtkMmHjwEHNpYkMfkiL1Tzt?=
 =?us-ascii?Q?uWC8UG6NgSgSakdisiSAFsRKVyycPhKWnfrsVucvH9Hul2YoiIBwlhr776BH?=
 =?us-ascii?Q?eTcJsWMfu0pKnVpXNbAG9MN6FR9xsRgatOvEEt0RdXCp3ChKOLehM4g7iQu1?=
 =?us-ascii?Q?o6n4meccDsLyb50FfxqJSqBUcppnWDCGEX99RYEWWS1n/2haPX/ELjnGNHFb?=
 =?us-ascii?Q?OQ8/Pz+tdMdpHZtrY2eO6V+hIe36BAzrOyEzelg+YDQnikI0OvJ5EBO/etOC?=
 =?us-ascii?Q?YO66XIC4xFAGtqHgpTNEHim0KW73PNsY5VMpbSbkvQdUn1cane/jTVr2j0Xf?=
 =?us-ascii?Q?GDxlXdWOhBEutrJ2Lpuys87+S6FhFlBXUdhkI0iKyQOWZ1nr9l7Gflegb9Et?=
 =?us-ascii?Q?L68O4xHlSdoVEztU7eU/bLwG5gPJp9mjlZ4MGs/5RAo2jlkfFJoK+jd+aPr0?=
 =?us-ascii?Q?0fx3gv/X958n7+r5x2ZG4dC+UUfSfscXe8V9qqt5iwNUkaDryg56VHa0rYxx?=
 =?us-ascii?Q?DRoLV8PorbzKlc3GRQt1INltOqDuoteRzsuMw6OjinddnJyDjIBVL8tmpxQW?=
 =?us-ascii?Q?SBCdu+nhUufEaaytoUJiNQDrfcCRgNN4w3XJbkPmiKTd0mx3AW0NyA7KTarX?=
 =?us-ascii?Q?nTHtKXdMC1cXgch9UG7jo57ggcgug/0nOvxtWaSP65S+gD62mG/eMdnLAzID?=
 =?us-ascii?Q?UJdEkLhnr5k+zwZda3CVVuTqCOHFrRvvCBU9PPVbCYhEQrMQqrptMNomegUW?=
 =?us-ascii?Q?6J2zkES7JllWTGl/dSaos6a8PaWFVq0uoD2I7TyUABKDdXcuCq/RVdwg7zDq?=
 =?us-ascii?Q?9dwtdgPtfGEsiWakhlyMgCywbhwOL2upAOfHXzN/C18Dc2xOgEtmmOxIsEeh?=
 =?us-ascii?Q?tDFTz79mAU61yGCSxu73uKgdN26t0y9cOsi+2PSX/XWNNDABM7To2znwH9ji?=
 =?us-ascii?Q?cKdymkkv/J7f0J7p6DQvg7Je0YUz2Z43trihalOfWWr5V+Zi/o+aToe8ceyN?=
 =?us-ascii?Q?qfckXLLP6Z9B95YCyzPS9jtvEM4zYM6a/WQRcepH6c8uWlaBc8uMc+OWe9ZJ?=
 =?us-ascii?Q?xGACtJfuia80zmRqhFAKwmo57vexTn0H9ZOVDhshaKEUFsqjZmTkyQRoAXyM?=
 =?us-ascii?Q?PhRGEiOfEeruQR6s2XfXqQ5wUsxB8xw84tCkEq2N/CvkNOQqbZVSk8a0KUAA?=
 =?us-ascii?Q?XbYWktJPNJgZEnoTRjoV3J0uWeJbChKYGYLviY42zktbjlzXuTksA9kIuEA0?=
 =?us-ascii?Q?Be/SthK97ChB859JNuUIaPzCkVHshFtdrHrRP7W3x0L3du0Cu8QqJ55x1FUA?=
 =?us-ascii?Q?XxkpJ9oqsPuE6CK8MZnVHkDQhAgHjU6pr1wDcBmR62jokQHJfLoOPN343er4?=
 =?us-ascii?Q?EbnK7xtMr0I/OzD0x0HPrikSYdQFc3Aya1tuW+F8ciNFMJW9gQtb2HKKDh5N?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e1daba-6a32-495a-1f67-08de31f197c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:24:43.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcy5E6OKHa8nnqORm0eH9u+qxT0DcEYBGiXVL8hQEo48Cx5T/leNfRJlQU+T+kWj19PeSLIfBzXtMh/GsQaGxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
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

On Thu, Nov 27, 2025 at 07:02:03AM +0800, Brian Nguyen wrote:
> TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
> multi-step TLB invalidations, so reset tdr to ensure that action
> won't prematurely trigger when G2H actions are still ongoing.
> 
> v2: Remove lock from xe_tlb_inval_reset_timeout. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

You can probably just squash the first patch into this one, this series
seems more likely merge before my series which added the first patch.

This LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  3 +--
>  drivers/gpu/drm/xe/xe_tlb_inval.c     | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index f10ecfb49735..848d3493df10 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -234,8 +234,7 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(len != 1))
>  		return -EPROTO;
>  
> -	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
> -		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> +	xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..a122fbb9fc4a 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -199,6 +199,20 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
>  	mutex_unlock(&tlb_inval->seqno_lock);
>  }
>  
> +/**
> + * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
> + * @tlb_inval: TLB invalidation client
> + *
> + * Reset the TLB invalidation timeout timer.
> + */
> +static void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
> +{
> +	lockdep_assert_held(&tlb_inval->pending_lock);
> +
> +	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +			 tlb_inval->ops->timeout_delay(tlb_inval));
> +}
> +
>  static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
>  {
>  	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
> @@ -360,6 +374,12 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
>  	 * process_g2h_msg().
>  	 */
>  	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> +	if (seqno == TLB_INVALIDATION_SEQNO_INVALID) {
> +		xe_tlb_inval_reset_timeout(tlb_inval);
> +		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
> +		return;
> +	}
> +
>  	if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
>  		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
>  		return;
> -- 
> 2.52.0
> 
