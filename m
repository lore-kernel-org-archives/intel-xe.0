Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF243C27C4F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 22:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E610E3AA;
	Mon, 10 Jun 2024 22:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbft3bMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A3310E38E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718058804; x=1749594804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4L2CMiJdftl7bPOEOMs4aEw9aemJizZRA/cA/z+HsD0=;
 b=kbft3bMgQs33OxLr6S/SkpfBO1kiaRrtRRT/38Et51paSjnopjD/uBGl
 0ZQxhZjWTckE9cXRnM/qpxUrbDeO2D5Q5kJeYNWnmYrDRGHKL82OB/q0h
 WCtQ0/vTqtCl8uHE9zJLMfHG6LCj5kx38eEva5p/J3Vdq5QPxOpcvRION
 NMlLybHxoNvmzVLU0iNHt0ZZPzJ0e0761UEaONbOA5MtaTt7OiWtm7p6b
 5xRaee2hUlZZfQrfkfrNYxDC2uKK/Wj9aH23d1QnS7N/vxTx/v7H2y9jn
 v90CJ6m4KBjMNfzVNNDuHSbpna5kijFwtMIC5vwGND3+p2f9SeJpHEFCB Q==;
X-CSE-ConnectionGUID: hNSEpXtqQYScRsKfzgAI2w==
X-CSE-MsgGUID: 2PDxNW4uRgeZhCSa3fJvLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18598378"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18598378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 15:33:23 -0700
X-CSE-ConnectionGUID: 226vRPBqSV+GmDGb12ZZsQ==
X-CSE-MsgGUID: hYQz1lY0RDqxYdUwn3FxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43639224"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 15:33:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 15:33:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 15:33:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 15:33:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 15:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRBB8bAOo6UWQqu60jDTvwmLucUP7QkNZiu+8LtCR3+Pzc8ZErAy4clM5tjMUj2MJ7sVoLodsWOteOCi1zQXh0PN/YT8dxjLfcJzHxe1wphcFRKTCT9xfo6Fi1/+0riQPadEy6WSP/7F4HJ9teuQpMjlptC0O37fC67vE2NLTTsNm8rCbbJ7EEU9wp9tFU52jY/sl3Q3virCgpsN/+yp7kI2wH1T5UYlcQ0SVxzjT1LXDP6PQ4+UI9ABjdxMN0wx46v2Zaoxvc2RPDWp9ZUX+3l6j9gQuIQerMa12ZIgkBZrCRLthyrXnCBIKnN+yUQhfWJN1GZDygElNFTCYGQjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOuw3A38V7brHBLDlDZMOA0rXWgR97fIdP5RBgBdwhw=;
 b=YZ9I+Nknvus7XbpTY1HpbL/TZOX8QL3QAkjw47IvSMTNSE1AY2ELVSwmextmGTjokft9wdewsElRtYBVj/lJLU2O+qFfJAekVgy+khKG+S67nolOEGmmqWMYomDO4HHefw/pXNkMJa1mC5w2RtFtHoqIdlygyiPPfQJZ0MguVV1SlSacLTwVbawzqGAOftfGg/TJ0eMwHZSrVRSwxyh/i4v+SFDe6NU5nNNp7CqAoHuDJHTx0UenOemhnHirl01nWE7LcnzWSXH7i+ZhJBWjifgbaJJ7okSTYenFYRD58nEXZIPxAH0MxchOCRqd+pRAaDEGT+zhijo9yqrFxzOlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 22:33:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 22:33:19 +0000
Date: Mon, 10 Jun 2024 22:32:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <Zmd/EtqiksBLq6Cz@DUT025-TGLU.fm.intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610203300.182615-2-stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 577accd5-bcd4-4657-87ac-08dc899d540f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M4I8zCjSk6u+Vk+9LncJDrdAtnAegQaUfrtlOVoPtKx13VN1VOrK43Jlc11V?=
 =?us-ascii?Q?9GYjYQ6WkKTEGKhJJyb5s6yq9eQnasqFe2DcRY/ixt4Dn/TDBeXfbtWtFn0a?=
 =?us-ascii?Q?PZTaYNTAiaOHuuIeNKBH+TAgVj0avAo4SJmWAIZuvdUN6r21D5M+gI+ZrEBt?=
 =?us-ascii?Q?dfe5Nzx89kKLlVB9HDtqQiVrccvCZLrUn62p6Ln4RhITQaKUQv9EqBu+sin0?=
 =?us-ascii?Q?znrrk40AA0sBZbNXFE3OTd6s3nIivHqqutMfedaxmxuqnHnieLj1cGSr8D3y?=
 =?us-ascii?Q?19c/GNhUVKO9fg5nY06ZHJWHgfSoHrKyxvjnJjW+R+idvLjW4ULUg5D8FIvX?=
 =?us-ascii?Q?yk+Ete16ut1zkGBtvTmWxVEkv9S3AjMFrnU7OdahsZh8d0xYtLuVb2F5idSY?=
 =?us-ascii?Q?aYjgz8I7qUhOZGj4BySDe5FXa8+Jipsjo8eHwqqLZ1Mz3M91POhrmyTSMdDU?=
 =?us-ascii?Q?xMUAmlB0N6jY8cjncCoHR2QEXmHJzDFSka+yXQgGtpn3YCpejxSYFTgIfosP?=
 =?us-ascii?Q?hvxSZ51Bi5aVTOca29MMlEXhAWFYL0IumjobKkDSiMADcT/hPqepeMZS8r1t?=
 =?us-ascii?Q?rIb77tKxeS11zcvgk/uIdaKGN/mwXSOTzGbRkJvoxQblvl9o8NlMMIEpowMR?=
 =?us-ascii?Q?zi9f60yRbOi+jzZ/F/z+Fs2UV9lZ5YPbkRQffWUWpFZyzPktDZU2kMr1l5+t?=
 =?us-ascii?Q?41lRO4KGrUh0Gx+xqEIVb4TTkusJFo6rX9p/fdX+Gt9Co/qXLcURWZ7hqO5I?=
 =?us-ascii?Q?13RWYbMjVnfWXbTdIXr5DImNkSKVsuqjglqNneT5pDsimp0BHurt4OohiBIr?=
 =?us-ascii?Q?jyjUmwQmCIglJD3aIBb1VMj5zvgipP6aNp7XHSFajLmmI4mCVi2pCtoXwEU8?=
 =?us-ascii?Q?Dq5pc2FfHRYgTwQzN8RT5m/aAiitP+kv0tRD6UXsSetOFPa8pdagzh8mD/Dq?=
 =?us-ascii?Q?epFRDq+DSRZTeNb2wMGvz5/GQAC05q7BIQxKvlTB+66vRQLcEMuzNEvkEL/d?=
 =?us-ascii?Q?Tq/0yWrsW4nTZMIzFhlIXid7lm3syIOrjtmlQ7KDlVDJvVUgW3shwqDF84Ea?=
 =?us-ascii?Q?vjFgEaDl28H+APxE1IViBHtv1BfO8Bv+q8sIb7R+IMbUtDcjOtQ5kBV4cW25?=
 =?us-ascii?Q?UZ88b7jG7TqLTjYrrbQ4OJHlVj2+VRCQXJrVxWhKCmqXeLYCbXzsMOelSC+M?=
 =?us-ascii?Q?Hc9qy0YjODBI6QmwS8CE2Xi3t8y7kvfwznHRxxBLpZ+B22rhNgkpV7BW5pDu?=
 =?us-ascii?Q?uNInfyhinH99HjlFC4gRLT7ce8eCq5+nbh3TR7rcz1dVjGv/YtUcyXzgkEus?=
 =?us-ascii?Q?IitSmEpitj53HF8gREB73kII?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbz/2pf1PrGkuSROsuAEIZFDHhI/zMaQmopzaq5X/BveWeZTrbwIy+EY1oZd?=
 =?us-ascii?Q?rln6esvIaU3RUzYa7OzPiR4tSWHQVHbwCSSF54uGjCBRQoNofiK6a4TXHKhs?=
 =?us-ascii?Q?SMs4DfeoUcuVP5zre0xwKOdhWmug3N/d5gEc+hsq3ilZcJop1c/kPu+Ox8HJ?=
 =?us-ascii?Q?MsFPt5HBPoQ41KwT1Nxjo7JpwyjfEqfVlYNeuwhpM2oqZlOjegUrzMFaT2en?=
 =?us-ascii?Q?7vfZzqRvcKSkmGcgSizMgmuNhsXgV2Vl1M5UYBtbt5+nKrMJ1RH8ZqJlGU16?=
 =?us-ascii?Q?+O3layCvuF6l/Je5vtFCTe2Qc3rRf1VAd4SfrVQHJ2+cdhKWamtJOYwBPi8L?=
 =?us-ascii?Q?7qjY3R/EJcn6lpx7Irz26lM4+MAfd30mayNS4d3UEgO8JIn0xwJBKbz8Fe0V?=
 =?us-ascii?Q?ZRnLp+TmQRoToaEx0wjTHqMUXk8iHIgqTIMoOat5fdzkGmexJIRRKgTldeFS?=
 =?us-ascii?Q?JNkaT+JTYMQSsq3rDXe4LknktBEDPvolHQ3zmb371LHCnLObb3u6n/7mKX2r?=
 =?us-ascii?Q?AGTStvIKl261tD5ajCT6yUgntBuzlxsny/qE6/1/BUHbnOVyOposK9pRxEG8?=
 =?us-ascii?Q?Yr5+R9GfIS/NfAKV4IopPtNtoDI/KAELpWAE5csPeDSmPANiDxJx0GD1Jipe?=
 =?us-ascii?Q?IOqef7Uol3xntdesP2X1JjOsrARvyFfh3oYcz7704UTLnpbaac9y1RQDsjr8?=
 =?us-ascii?Q?frcaltaCcT4uH+If9rFIsheO17YI0DI7U/6p28SRBVFdsD25ne3x9cNnE5ax?=
 =?us-ascii?Q?G8kYhXDkJgDj7S7RFJ8lHXwEiEjVJuEU1tiKNNzi5dNbSP56QPUnYI/z+qRi?=
 =?us-ascii?Q?7+gF/0NGLS2R6N82IIAXWHfDp4LS8puLheZy1XRX5gO2Nl0XwgiKPbSj/GUW?=
 =?us-ascii?Q?M046oxOlAcpS1WNOKJzJZdZxLyxdNlNbEedV/jop68h03mH7AitfRCDVPCjy?=
 =?us-ascii?Q?Tf7vLTAO13usIJbFCf7nXg87AKrb9MOB5E4iBTia0mq06x3HxY9DAUt7mmP3?=
 =?us-ascii?Q?c/GUqyhp4mcFY53roBvErJ0HjhpATtMPCojhLKWS/19uZ+dJ56Mb791b4qJ3?=
 =?us-ascii?Q?Wpk/wA6Iwf/nSUFS0eoPPkUUVG89U9y3mwI85QZTKcUNJagpaXFffuxuRwEx?=
 =?us-ascii?Q?OOK6rN6kaycGzV5jOjiei/zUm1I05jhaXLjpGb/O/i8L9IRnZZDju7tSWKmY?=
 =?us-ascii?Q?L7mOCaZdYTf9RUUMvbIQjYOvh0WJ3UoZCcSYDz02HOo0LlvbjplOb4vIX6bI?=
 =?us-ascii?Q?PG9QKHfpaNPg2KN+867lyBbtR5WG87Yod7WW6CflmemWmwUgPyWRqhxlOH+t?=
 =?us-ascii?Q?ANjZurewWOlf25hIxSS6ZtshSrZhnndTV8XB5zAKSWXqcS8sxhfBWxES2+Fb?=
 =?us-ascii?Q?ETarcZIJwugwICPYo1dgzlrErbLLkfuWIFVHf96sQHbT4kO7Mpxhu7i4SFIe?=
 =?us-ascii?Q?Q0uTFHFRP790pY6ceRYNIiI4egMTVaZWEoc/ul4LDo0EeQjmkkisjJdoIFas?=
 =?us-ascii?Q?X+DXsjoBSxTD3cTuJnKAIzYp7y58SF6+Edb63Q48rsYvvIJjz47MbmDYZuYe?=
 =?us-ascii?Q?N9i05MW7tT0Y65DdyTcPCQcbcGl+QCG9mmP93LixXfYAHsGi2axMr6vQ7njf?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 577accd5-bcd4-4657-87ac-08dc899d540f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 22:33:19.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QgvDnqN8y34na20Ovf1NENokl9U7OiwjcFNwNDkWYg9lVlMJBOJPR0VvFMd5JyM2XW85AZ8PSyyYYNWAT6x0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

On Mon, Jun 10, 2024 at 08:33:00PM +0000, Stuart Summers wrote:
> Currently the page fault queue size is hard coded. However
> the hardware supports faulting for each EU and each CS.
> For some applications running on hardware with a large
> number of EUs and CSs, this can result in an overflow of
> the page fault queue.
> 
> Add a small calculation to determine the page fault queue
> size based on the number of EUs and CSs in the platform as
> detmined by fuses.
> 

This math will also be needed when determining the G2H queue size as
page faults get sunk to that queue first before being copied to this
secondary queue. 

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 49 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h     |  4 +--
>  2 files changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3858c8e0b707..5565732e79e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  			PFD_VIRTUAL_ADDR_LO_SHIFT;
>  
>  		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>  		ret = true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  {
>  	lockdep_assert_held(&pf_queue->lock);
>  
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=

I don't think the <= PF_MSG_LEN_DW is needed.

>  		PF_MSG_LEN_DW;
>  }
>  
> @@ -312,11 +313,6 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	u32 asid;
>  	bool full;
>  
> -	/*
> -	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> -	 */
> -	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> -

So here I'd add:
xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw %PF_QUEUE_NUM_DW);

>  	if (unlikely(len != PF_MSG_LEN_DW))
>  		return -EPROTO;
>  
> @@ -327,7 +323,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	full = pf_queue_full(pf_queue);
>  	if (!full) {
>  		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
> -		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> +		pf_queue->head = (pf_queue->head + len) %
> +			pf_queue->pf_queue_num_dw;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> @@ -382,18 +379,42 @@ static void pf_queue_work_func(struct work_struct *w)
>  
>  static void acc_queue_work_func(struct work_struct *w);
>  
> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> +{
> +	xe_dss_mask_t all_dss;
> +	int num_dss, num_eus;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +				XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +	/* user can issue separate page faults per EU and per CS */
> +	pf_queue->pf_queue_num_dw =
> +		ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);
> +
> +	pf_queue->gt = gt;
> +	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> +
> +	return 0;
> +}
> +
>  int xe_gt_pagefault_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i;
> +	int i, ret = 0;
>  
>  	if (!xe->info.has_usm)
>  		return 0;
>  
>  	for (i = 0; i < NUM_PF_QUEUE; ++i) {
> -		gt->usm.pf_queue[i].gt = gt;
> -		spin_lock_init(&gt->usm.pf_queue[i].lock);
> -		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
> +		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> +		if (ret)
> +			return ret;
>  	}
>  	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>  		gt->usm.acc_queue[i].gt = gt;
> @@ -418,12 +439,16 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>  void xe_gt_pagefault_fini(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	int i;
>  
>  	if (!xe->info.has_usm)
>  		return;
>  
>  	destroy_workqueue(gt->usm.acc_wq);
>  	destroy_workqueue(gt->usm.pf_wq);
> +
> +	for (i = 0; i < NUM_PF_QUEUE; ++i)
> +		kfree(gt->usm.pf_queue[i].data);
>  }
>  
>  void xe_gt_pagefault_reset(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 10a9a9529377..c40b9c1b5fec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -232,9 +232,9 @@ struct xe_gt {
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
>  			struct xe_gt *gt;
> -#define PF_QUEUE_NUM_DW	128
>  			/** @usm.pf_queue.data: data in the page fault queue */
> -			u32 data[PF_QUEUE_NUM_DW];
> +			u32 *data;

Kernel doc.

> +			u32 pf_queue_num_dw;
>  			/**
>  			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
>  			 * moved by worker which processes faults (consumer).
> -- 
> 2.34.1
> 
