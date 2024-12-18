Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAB1E77183
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 03:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1C10E637;
	Wed, 18 Dec 2024 03:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8182hKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF6010E637
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 03:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734491309; x=1766027309;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sszmcte3tM7MbgyRqh3DXTbyhu2L4BUPfD+aYwpUnLw=;
 b=C8182hKoylcF9CfnFU6eov4dXZ1ii6JnWifO2OI1FZLyUBUhwdwcHgB6
 hHEHKn6WxYRjI4wAwYwVuA6r81vNIgH/qT+ca4uB5qyUG+bvyULnJWOIK
 Ked7jP7JZqMK8rg6ZalWdDq8JKK5wadQkyjjM4VlqcBnT7NtsMAn/apoH
 yUqM0dtafmmAiHlQPSnni96crd2zkhxBQ32BOt4su2g2vy+GMxIsGIaOd
 IrweqS6tmxCJpYvg98OzQMR79mM0lCFiGI98kjhD+oVKslC2F6WSWQb/G
 GUzj5fu0PYkxUEC2r8RpSVp/q3WHk67ibQgcPsa44ittR/Xu47sjTVmNs Q==;
X-CSE-ConnectionGUID: Ok6yurMAQ2SvydNzDLelkg==
X-CSE-MsgGUID: KvITFnyQRiOx3TxccexW9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35078031"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35078031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 19:08:29 -0800
X-CSE-ConnectionGUID: DsbRQOxvQKCbP77XrT7Pdg==
X-CSE-MsgGUID: 84yigBc3T4uZO6guWJ6lTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102723630"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 19:08:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 19:08:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 19:08:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 19:08:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2f0QsnaRrGq5QKKWF745UWAulQlFzAlvBkkMEGzPvZqN86YXDj890/bmNj5LshJ3c4YvJPKMMMvCr2EjjXVY7zxod5jOyYV2NWrCjJnQWyJfdfxumpbqFV0OMW/Lu7x2iKkrCDZeXW5LL9XZTKsl6rJAZxPkhhbaCQr3pJh4nYBc6aZXL5g5ZIsK/8QHZYbpfhSpxLQV6hYrMckvcix4P3mt2dQNTklopGZHd5gJswhVhLev5bmexY8Ci+EO3qeJBNS9j96JcO0363s2bNvbKq6j72XZpCOnmFHUB4rnDdMVCJR57TFSh2t5Dcsz78L4HJ6en8wuSK58NkhDv5ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU27bSh0YxK+8pft5yDRVWXc1hscPJoCJpJvZPyegm4=;
 b=guJ4d3EqP0Sh4mkEySonMx4B0LHfnzePtglkkuvjYiEglaf3cXPVewc9kKYL8NHfkXE8IXbuTVCV4MUgcX3KmKRuw5AJtrzB9Do08eqty0EQray28OijRsUmrU6pwC0t5Zu+srVUB2OM3TDAysj4A6N4BaGXgkLEFDmC19plGmuBJSkGaEgAuJmY30pHexcLiKqLQL350PRBKrmNnquFjmCiJuBhlQyTtB8wHsnGosuDSAgQAMdmcclOlAIGgL0fRo3HTExsC75D+oPOMtE8vReQbeU4JqRG4LeSszKe/z5F1rrnWsIkr1h8t8eDhTAIVPEZA7nB/2nCBgPAF3nt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 03:08:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 03:08:25 +0000
Date: Tue, 17 Dec 2024 19:09:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Print vm parameter in xe_vma trace
Message-ID: <Z2I81cwU60ZhaRi4@lstrano-desk.jf.intel.com>
References: <20241217231420.2361302-1-oak.zeng@intel.com>
 <20241217231420.2361302-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217231420.2361302-4-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 077f0cae-6704-4e71-e8e9-08dd1f113d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bom2J14GBx6AGksvFP9evXmrgqjPhS6DQxyaDDSEg5OpzI42KwVbyRzNnel3?=
 =?us-ascii?Q?zRgZrvLdkNmepdXHWQ+Z+TyoX2rg5vn8IXl6i+Sd88lgwflGO/GN6ZhrESCm?=
 =?us-ascii?Q?IMHRvImXO4w3WhGDzG/42jwBoZUUBSlS4nf4WEJWAaOdm66ggK5Z0auWjbFO?=
 =?us-ascii?Q?GRmxQfAEsUmaWOyB75cEAvJOpqcNWevEdEcQv0X1VwiO2aNCxJsxZEHYLghd?=
 =?us-ascii?Q?qzB9HSjTH6wBIVXfedKYqOvVz3Nl4bpLmBD38+RhTiakINx4/Md9Z4Yc3gIR?=
 =?us-ascii?Q?VZSsSWpsa5/Xn8lOTcNKCCX4AvMMfcF53r+zJNf3vl0lILQmF1MZ3JZYYh4Y?=
 =?us-ascii?Q?TTPRDUESb6srIjLOwGplGzyftE0juzm6VbacVg1DoWFABenhTWWLdCymMDCO?=
 =?us-ascii?Q?sL3B3640obeT8lvtricJfFIdGierTCTU6phzluwHGpVxzoBR2ULIliKkS+uC?=
 =?us-ascii?Q?Gqwz7mNeg8pji3MKKPtZ506xtJNJbD7MDtAOsiat4sDOQWVgkK0nD8Hdz6ta?=
 =?us-ascii?Q?Cj52YMjzipP9zeGTjFUviApVEFq+3z/GVKhpFVgRreTI2K6kRnH3AUNnh3ZC?=
 =?us-ascii?Q?tTEK4fMZUrA5cOM3LkWvYQxmJz7k/wjt4lwwWrzojzMUJN5FoxCWOhHrVw0A?=
 =?us-ascii?Q?DQqQVwqDzduSepV/VTtaHZsLi2a8yQplrAR7wm1DareD13vK+TMuDNhvK3ri?=
 =?us-ascii?Q?mo9qIY2k7HMvkPLCM4x4D21OU+DKFTXROaLcgROaJhkTF5Gh2HuoW+Z497BP?=
 =?us-ascii?Q?NBl/myyZhGrT5K/hV8pqnWcu526NZpZJB4J6OJIDsG/H0lOUN9AFn6Op7mv3?=
 =?us-ascii?Q?odM2rbKshapdqfyQXWcUP0ikq2q5PRH6n5h7XBwCy9r7fTiTZIde0OY7oDSC?=
 =?us-ascii?Q?QRzprxmuI6xR3vdrVHM64crqrGKwKdLV+t7t3dsHH2eMlKEPsjnBIUOLXj6e?=
 =?us-ascii?Q?iv30OHWt22kc6q1beMuVF9Yg3f6T0sLnpgaB+ft2J3ioUcyfedQvYvDMcIU0?=
 =?us-ascii?Q?+VUdxE5/ZIicIkT/+ydnYQ5KqgIuSS/dM5HrtlKYaq5VBAvSYXrcWwS36493?=
 =?us-ascii?Q?QkoueL6yQS6/LkSV3/3+Hcw9nXYJ8CyeumRrhKiyjF6dQZmQDlml4Ez/Jo4T?=
 =?us-ascii?Q?AhavrsvZldxrOeYg0b/cTUT8ebtAuDOgbwHIfA5iTwc4PhN+0twKeA1dGTJY?=
 =?us-ascii?Q?9KbgMOtFmtunZc4bYgS8tHImvmcvF18bo3//D6lWXeGcIvYw1o4nHHv6X9Mb?=
 =?us-ascii?Q?/LaVw2PHXYpdjaSwahkXDMjQruR3ZxgAILQUJaGJeY6mndB5hzL5RP2Sqc7/?=
 =?us-ascii?Q?D+s1W37FUR/7AHlrT5deP0r/qIbJ5/c03cr5fJj+pgzC4kXdIIiNqNxdeHLI?=
 =?us-ascii?Q?UyRPlpYLL4EUyqdrtGEnNBc5gmSz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCg5UKtBQWoEWh3bgAhEUgwm4Qktj/Pa1UKZteBchFE250xi8uoijuc+EX70?=
 =?us-ascii?Q?VRwhGuETy2jH9QyHPmAWvGvewvW96722mWaSjO92e3pr7uiycd0Ogmc4qxga?=
 =?us-ascii?Q?5ebCfftdsn6KFrYk4+lJ+QmGQRW1DQSmgSN28dF4sjo0gyk/OiKBUHB9H7mz?=
 =?us-ascii?Q?sALjMiGC6O6bhZCMH9r86PRuutQ5+pPVToF6j8YiSofrYEOFyC2R/adkEfiK?=
 =?us-ascii?Q?JhvQZlf0UkyzQxCFGv1TdIewTSiEmHL13CKQbo2H8u+QYZoHmnyl4DOtdj0B?=
 =?us-ascii?Q?NbuFScoYZfy22+5q9tQBXSQR+RIzrqsWj9zvfLEKDyuXNZWec/bOC44HF51S?=
 =?us-ascii?Q?tFpuN9MCSp+UynDTqt5TMb+Q5XOOJKPnzLdJ1To6iHVt+y3Y5A2U9l86WXUN?=
 =?us-ascii?Q?jcMc2wlQxqXNATS8NEKQaopssE/EoGxnCRIZEsuqRWYTjy9TsEW8yErYD+Ep?=
 =?us-ascii?Q?YI2tqCj3oVpVGPWccqy3qnGh8euZUigPH4MYaeAECzv+qAfqFFUvido4M0uH?=
 =?us-ascii?Q?k/IDPCJ6zSy/i24qqEv0IKAWQLFDaTgsD7nEUIsxHkWZcqfw+BXAfWfX41Bd?=
 =?us-ascii?Q?pi5ErY/j8fByf6UYO0VStqEsp9Kl+BA4hUa8t78W5lgTcmKOvLdAM7I38yoz?=
 =?us-ascii?Q?ZnbQKkXUqsgOTXj4j85I6i6L8yCdJrSgYhYiwoqFoeeaHeuN4XVrjbeLkDKt?=
 =?us-ascii?Q?9dawJSm7aa5qsdzoRRWEtIbPbXmjwRu3xnltuxn1Z74ArcYbSvkz8Tv3LMZG?=
 =?us-ascii?Q?vLSZOcfm2OBhagTWZIYA9UiWmcmgR4mx3h5APqlUX9J6PKpZ8gzphTV3Jbk8?=
 =?us-ascii?Q?ZFJxBhLWYHVyuWq1sTVI6IdUmXkSeILz5BaHOsoBW8dfWMupIj6YEwnWEHbp?=
 =?us-ascii?Q?BsZe79TQA8xLSbdkY86yKs57G+Vp4N7x0LC5SeZRgsEUGl8kuo5fffuXFP/5?=
 =?us-ascii?Q?+wnQ/gdm3Ck4ntxIyiY0QbIVAjsyHtou/yQm/RpoDbdn3mhOutlwL5yFHlMI?=
 =?us-ascii?Q?YcVGimqykN+DVRZdqwq8MFVV98xR8RvxajsuuoO0deZWiYaTk2ukk5oa9/fP?=
 =?us-ascii?Q?0idxCbiXDmGmjqM+7aIfdlqprgbz5pIAGMAP3Zr68I4/jt13NVX3konbEIHx?=
 =?us-ascii?Q?yIWUSFZ5DefWtf0643nwhHKmreMHrb9xnOg4JbpvEHNzvTFNcDiD7pC6v4pD?=
 =?us-ascii?Q?2lBxdlM5euOyX4S93pOvJvLsBc3w+yeaRJseUQ+nyIx4MLdGHi4RSPLrcYKO?=
 =?us-ascii?Q?4bP3X4b3gg62YPUP3HfEZUTu0KikIZ6cgwdjjt2Vqs3TD5+8UCxKXMyqKn8t?=
 =?us-ascii?Q?p8XvxNItPWCyt+ASOXZsgO1ACdB0Va0jMat5VqrQKOKvTnLbdZ9gO7FqdsIb?=
 =?us-ascii?Q?ecrxwxKrJM5Kz+EXV8JE1QKz7P33Ulb5vWC+6uZeAc2Gv81fJwX6PzCIRsp+?=
 =?us-ascii?Q?u3i4dJnSAst6pvO4p3Nj6olWwKCsf9L0vrOBXZXlFRNr/8K6BUkbjsqWgmaJ?=
 =?us-ascii?Q?YhL9k6ComDpbw77FDa+NwEYng8mEeCdnWMMDcpkTMLmxFltf54/IKEnMew9R?=
 =?us-ascii?Q?vHrMS/BsEG96KZd5PVTKE4zaedL8GrMVZuwKkPlt45NvbJrmT513ds3eDwfI?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 077f0cae-6704-4e71-e8e9-08dd1f113d02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 03:08:25.6499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Zv+j30jJKDHiMawswuUhjyD6uuqfAAaUwQLjtK6jLK8BIZ/yA3eeaLMObdDErNjrXXFWyDeD5AjHVrXkTTc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
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

On Tue, Dec 17, 2024 at 06:14:20PM -0500, Oak Zeng wrote:
> Print the vm that the vma belongs to in the vma trace.
> 

Again maybe say why this useful. e.g., To correlate VMA operations to
the VM.

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

With better commit:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index a46f7cfd92c6f..ce4d0d7e81017 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -92,6 +92,7 @@ DECLARE_EVENT_CLASS(xe_vma,
>  		    TP_STRUCT__entry(
>  			     __string(dev, __dev_name_vma(vma))
>  			     __field(struct xe_vma *, vma)
> +			     __field(struct xe_vm *, vm)
>  			     __field(u32, asid)
>  			     __field(u64, start)
>  			     __field(u64, end)
> @@ -101,14 +102,16 @@ DECLARE_EVENT_CLASS(xe_vma,
>  		    TP_fast_assign(
>  			   __assign_str(dev);
>  			   __entry->vma = vma;
> +			   __entry->vm = xe_vma_vm(vma);
>  			   __entry->asid = xe_vma_vm(vma)->usm.asid;
>  			   __entry->start = xe_vma_start(vma);
>  			   __entry->end = xe_vma_end(vma) - 1;
>  			   __entry->ptr = xe_vma_userptr(vma);
>  			   ),
>  
> -		    TP_printk("dev=%s, vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
> -			      __get_str(dev), __entry->vma, __entry->asid, __entry->start,
> +		    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx",
> +			      __get_str(dev), __entry->vma, __entry->vm,
> +			      __entry->asid, __entry->start,
>  			      __entry->end, __entry->ptr)
>  )
>  
> -- 
> 2.26.3
> 
