Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35A5C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210110E41E;
	Mon,  8 Jul 2024 21:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI/jg2RB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E71110E41E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474478; x=1752010478;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=us0u5l4z43SoduL1qdSmcl3iSVjn7FRspfUntCUtGyA=;
 b=FI/jg2RBoKSWNWsObvXG5aM5HXK4t5hu1dtv1aWZFsa/sam1oJ4dJh8a
 zPr0nUG6M+kPq8wmdvvx+JiuLnzOqomc7AmqAWvSHidclP8XFRfslvMai
 dB7EgTIVvcnR3xi8pNu7yuY6w9gH7CxpO223noeyLsz+F/z0i8KZZtAxS
 4cK6fQL1APWbd1eeMUkoBQK4mozYbJYJVAv+c1nQARSbqkPaYdBNrbh+b
 2eTh7TxIcGb7EFuLV2PUIEofi2GD6pmArqYds/kypvLjw27R4f0r6Xc+L
 2RjfAJco8De1cG9fK4Of4G87wnhku1gdXOJjjcerLDmZxo/8n7mN6VWLs w==;
X-CSE-ConnectionGUID: OZ2296bPR/yu+jWVIGiCTQ==
X-CSE-MsgGUID: +mw9MDQCQ3umPmQyyD5Mzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29093711"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29093711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:34:38 -0700
X-CSE-ConnectionGUID: A4cUjj2FRe2+6yAcQgwlXg==
X-CSE-MsgGUID: RY08GaYmRG+hh55LEZreCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47398424"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:34:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:34:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:34:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:34:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEgoMoo9HGRVXwzcGb8FAYXKPxgQVd8V4gEzhiBq9KtyEjvkZZldGuRcGmm6ROaXYB9ajEuX97MaDc7PRn5jaUV1L8hylP1+zdnrlr85f1Sc0fmMH2uMeKbrbZ/iGgsY9j4XDBsXRWlHFFkIHXzKxHkqX4Zd03isBSfcjQoNvbqauM7gDk+ajONAgEFU1Ci6UQdAEXcLrjEkem1Nz/+jNxsviMxKUzWqJmZmEpcdSjZ2dk1i8d3kWrPArcm3KHtdWHWvHfZSekahMXuadacy2TQUF3F0GFXyNyxmKounSJtEK9OvCaDxRrEKxUa06PJtnkPJb7OT5zNl6/1AXCIOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u/wtzxTaA0Sx2iXpwn2JHOwFI/V2PXbwNpyiBpiTl4=;
 b=O6VJ67KvVFB5KXEsgQ65zU+qxNa9+TktNxsQ/yasXmSoS7+lI1c9rAc3o98T9CR0Bx614U8CL+/ng70zEFFvOsUB7tLHeaZdD2Im16OvW3HOC0qRxcXPvvrNn2UrV/VmibkWKt6BLOfzajE2ILHGYaZFRtFqquJlqce69TXcA13VITD4ul/C8qB1goR3xqdoulbbBgnZt0iVhkDzkYgQ+8r+i/SMBAs1tzUjXpdlxpkXSbisDKaZn1Ll6o6g5QDDQ7gV0zaEquDsCPR7kUdZF9oid0i0sYbbK89iKpUjaDheQqDuCQmOKDdogMBIUU0DnH33+I/EK5SLj6Bfuqjtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 21:34:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 21:34:34 +0000
Date: Mon, 8 Jul 2024 17:34:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop trace_xe_hw_fence_free
Message-ID: <ZoxbZxhZs6_KbMZQ@intel.com>
References: <20240708211008.956384-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708211008.956384-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5570d06f-1d40-4933-aee7-08dc9f95c275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tvcP7M950CnNgvlh2WQNXLu+06fKDPEKx1bAIkc9fATY3wbw/xE3NemBew?=
 =?iso-8859-1?Q?PG18yPxDoGzjiZzUq3oaCkT2NWGHbGM253beGs1G1STCtRW7qTsbVmrD1b?=
 =?iso-8859-1?Q?7Eg3Z0Laol5Z3hEWRZbYymBPHsieK1ZogFXVkiIWUUG/ktj1LA9wU14QXg?=
 =?iso-8859-1?Q?IDdsCbLD9/n4/dBn/JjFXrWiQacNEMxhTZYXxYVcnZ174xnDiuDERqAIIQ?=
 =?iso-8859-1?Q?GGdXCwzOxoENcxVPQxb5q73uY/VVS/5B+Li2rjXIx9+eOlW9cBikgjhGkl?=
 =?iso-8859-1?Q?qRoCvR/wdmUeNv/kdvyLQaTjCKV0Cc2LblEQnW5pAUt4MD8Q54+t23d9jw?=
 =?iso-8859-1?Q?0wslH9QDjNvmCkEgLuK+F7/94Qrv7voboltD/Z2FGuSAWPHXa1u+BIrVm2?=
 =?iso-8859-1?Q?1BGV7xWwV5xIzM86YDGm6eZdgK+NqmDN8/RLdKbJoNnmrmoD/yfS20q3XF?=
 =?iso-8859-1?Q?JehvQ9b/4RmnzXaxrS4ZUqZhehg2JbrOZCI2bLjSy1vPEMFaMZwcyGQ2yN?=
 =?iso-8859-1?Q?nhX2I++S1RztNkeWXGjbSDzub8y86kYrBJNaBNiBAsZB/fbVGcGdVL3mzb?=
 =?iso-8859-1?Q?pQ+xe1v6PEB03j+LugSbzjTeUVW4T/WXLsA360odLqi5dP0JAWD1QHZmuz?=
 =?iso-8859-1?Q?+G7Gfq0CPefQLtrMe9oV0Rbzvcn2Xx5BxW6IEGdMsfFnWqSy9OEvpaxndz?=
 =?iso-8859-1?Q?TPA70QIxhwz5if14FHbQjbdul3VhrRepfYXai/+ab9Wj0I94mf5UNyhK6A?=
 =?iso-8859-1?Q?piAA2TClsVp8UOngiU6bFfx7Sv5QFMfLjhHeyMVp5LNOKaVzJP5QcKfj2i?=
 =?iso-8859-1?Q?bxh1r5rbeClOX/y/CGhuJfogznK0M7n3gBpkd+tXZX+iNfHW/WJ6To7tQ0?=
 =?iso-8859-1?Q?ZmMAA2bKO+/rDArI1+PzQiLsOTdgM/+2TmK3UUo8LlhgIwlFTVhnhYEctI?=
 =?iso-8859-1?Q?jriVD3ZRc20yHlQG7DU3aZ1auruNx9t48SyM1C6axirTtWWTAzvgMneewC?=
 =?iso-8859-1?Q?tAZnIAg1vUFrPPZ3SEnU5O23plYD06XroJCv04BPm7L+/ohDigpZ1cnYyC?=
 =?iso-8859-1?Q?bXhFquf7+I5pcFrpQwoFMqG77nw23Ku84yk2zmCGp3USY+JAQ9sErytGWt?=
 =?iso-8859-1?Q?ICUTbj62SOKR5ivXyZnoIcBR20+Zw4frPRImulB4gSeXf36O2rNNy0zl/h?=
 =?iso-8859-1?Q?kDiyU5LNQABKB23SioRuVW96kJxdYYx90hcP4QkIoen46an/xnstBbwUh0?=
 =?iso-8859-1?Q?39655AKc+axUqcq7uPeyRhBhRwe67cwaHvAKu4SoN9k7EOt2pvKeaiUNHb?=
 =?iso-8859-1?Q?dWUBowVX685Ev9zL3yvRTmVbVAdMqsPmp+A63J4yw08kdG2Ww5lzOjnAjf?=
 =?iso-8859-1?Q?wfjcEXm6mJ89DpvWhxG5kA/k+f5/m6+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/4EEFfEd2vik5apqw431rW/L6rRTd57SepMmufNBM74vYpV7kiOn0s3xK3?=
 =?iso-8859-1?Q?+YTpVfNZT+YOvSnI2YNvdxnDB70o+yvcwSSwqOWSlL5W69sQsLpQZ+Be1l?=
 =?iso-8859-1?Q?/hj0wTo6zTBa4ngcDrX1MOTuvaXU3cVHld6zMaLU8GEcCbGio9Ox6DiI7f?=
 =?iso-8859-1?Q?cieg8eKNVbv9ChgWpr9GMPD0FupVnQlZxe+XRqd9G1Gl30/gS9K2qJtGov?=
 =?iso-8859-1?Q?9q1qYUjKR5Dh8RJ/NVoX0/ratnkJIWNETjjIoTgbpZ89j6lhLBqX7D62QB?=
 =?iso-8859-1?Q?+ybBsELSAQRETN7RKA7O7PQxDcMDyYiEZrtlPVFi3NMrsaQj+jliLgc9wX?=
 =?iso-8859-1?Q?F65vDQz5SF3w4GbfvQV270/DDvDZ9DYoqxCguIU8f3PHTkVkyA0C56kXkO?=
 =?iso-8859-1?Q?1SvguXbLr8iLjoVVfAmRpfdAoR4R88w1DyOkmRrAyLFU4je3GNi/nv3q2q?=
 =?iso-8859-1?Q?3gadOwbtoxajMhyqgqeIAdJgFpZcgvWrSDkTTZ8ji6U6yQ/ztYwO0H3z1b?=
 =?iso-8859-1?Q?SIll4fFiOktx9WH7XcKEcDrony7E2XjivZ8xYnyWqSh4at66m1/FMY7nnD?=
 =?iso-8859-1?Q?tK0RpPiVLpvk0AsEUMXDHGJdSeuLviieihFI06fkBHeOrXFD2rY6j4HaeN?=
 =?iso-8859-1?Q?nwn+xKWPpdj8+tKbqJEGPsKc1SCptQa4UvCTX7Qo7u3APfqWkzlYR/EvcI?=
 =?iso-8859-1?Q?xIWasnZ49NX580NDYuU+D+a+FfmaaAuRwzFjD2nF68zU+BFm4iMsRv97nI?=
 =?iso-8859-1?Q?IFO3Uz7hx+Gg3Rx+Kp3MJSqPFTqk5mExfqbmeiZGIKkwJ/qHKJzfX1+3PX?=
 =?iso-8859-1?Q?ewkbzG7gzLmOWEDDjyITAme0L5LZJZSkrPp6w34rbtYNzJUUAAze5RqHSs?=
 =?iso-8859-1?Q?SPWsABjpf4wApGm6gtLQ2ICoXGA+er6Oi5d5wtjxhxoHKJQTDKipBUGsV1?=
 =?iso-8859-1?Q?B9q6Q2X47T82xvOzjb7846FgPbNxCOQ1ps778EV3NYruzYp2+3UG+vuaER?=
 =?iso-8859-1?Q?UL8VyfgJTPZh6seZ0xBXGEbL7PlCWJ87CTK7kCr8rb84lBnegZe4XPRv8Y?=
 =?iso-8859-1?Q?/HDj8mB0a0hxnKYfG61zJt6Q1Mi0eURio6nQWjqgFAT2wFGmZzruLNq1Br?=
 =?iso-8859-1?Q?VoCh9Kae3P6bzQEeUumunREymEqTs+x5pMu9OjN+50TSSlW8D4lMt09Y+/?=
 =?iso-8859-1?Q?FDiSgAgANNlifnZNEBQ8i/CTM4BSiGyHiiRQ4Hn5lMR/BgTQW2YNEWA3yC?=
 =?iso-8859-1?Q?cIRwIfraZoWL2qHa9t57Gt3iiepP96wSEdDciGb7TJOxfPTb1kGI1/eC1p?=
 =?iso-8859-1?Q?vCWBkLAPunUdCmY1MD7XtxktTsLCHlSZ1WdqgJQ6HIpUorPnyQYAvscfTB?=
 =?iso-8859-1?Q?s8jyLAGiVCXSaV4dR1z15vFScOMoMhr97O6zoerzm5sDZIuxPLmsMRYyrL?=
 =?iso-8859-1?Q?n2JX/bHD8+QqKOghqCLEOoPgxbl6l1AZAakObX5iJapVwMrbJe7FCWCQin?=
 =?iso-8859-1?Q?28fcRqHXvVidZfgfktHIo3RxVD0u8QFe0aCYu3kEcOn3MAIqWQ0pCz79sC?=
 =?iso-8859-1?Q?VnJY0qz9LYh/0LdvsgFNeTE7tHJ3ePstZ/ADlNSHxZDFv6ODk5Gzinr584?=
 =?iso-8859-1?Q?7sibkJjNEWwki2dmfxyrf0jm9jYTek5jCR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5570d06f-1d40-4933-aee7-08dc9f95c275
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:34:34.4685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2C9ICPDQldJgdGSvTTCBDHSUj/XDdINFm8koyK9oXt1UiMCpSBlOJoZ7BYt6SxoWlluD25OY9+XFLNKDCcWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

On Mon, Jul 08, 2024 at 02:10:08PM -0700, Matthew Brost wrote:
> fence->ctx may be stale memory when trace_xe_hw_fence_free is called
> resuling UAF bug when deriving the device name. This tracepoint is not
> all that useful, so just drop it.

the placement of it seems strange anyway, but if it is not useful,
let's indeed drop it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: 501c4255c409 ("drm/xe/trace: Print device_id in xe_trace events")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 1 -
>  drivers/gpu/drm/xe/xe_trace.h    | 5 -----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index 35c0063a831a..45a9789cf501 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -187,7 +187,6 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
>  {
>  	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
>  
> -	trace_xe_hw_fence_free(fence);
>  	XE_WARN_ON(!list_empty(&fence->irq_link));
>  	call_rcu(&dma_fence->rcu, fence_free);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 09ca1ad057b0..baba14fb1e32 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -341,11 +341,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
> -	     TP_PROTO(struct xe_hw_fence *fence),
> -	     TP_ARGS(fence)
> -);
> -
>  TRACE_EVENT(xe_reg_rw,
>  	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
>  
> -- 
> 2.34.1
> 
