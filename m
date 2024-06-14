Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABD2C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 14:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192BF10E22E;
	Fri, 14 Jun 2024 14:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtLHSwWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D510E22E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718377062; x=1749913062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EElKhHiwi/q4k1GvD4ULK3m/wqkXTwKO1CPiSKisQ64=;
 b=EtLHSwWmJgNjYcGlXS7D42Dw4Nu5j8qOTsGWwOCye+QEKreJY0V1gtZn
 6UVp20YBIUVf3eaDFVdgfdk2G4M8/kId40PNCjhUk5HaXSbisrDzbRpB4
 UMo35efqXAvtXrYxTrl31ePxxWKqxU6qjUJ51//NyDOthQMjPSRR8G0wo
 W2GT8DbuDslAiSCatWNM996d+pTxZCAL7BpyngdCnsh7uPvBHvxAXk/OS
 c3Xrnul32FyE20QOo8eG1Yt6iKj+AnvR+3U1amAvmZd3GF07dPuf2+f7u
 0zsIimh5M1FlCjTQgorIoRPpMNjjbYK0UXxxjGI0khGrqdFqlqiKOysmb g==;
X-CSE-ConnectionGUID: la3q20JeRL6K42syi1QiJg==
X-CSE-MsgGUID: KXrTxgSpTym4IT2qPJKlKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15234121"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15234121"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 07:57:41 -0700
X-CSE-ConnectionGUID: x7EEXZg0RKS9YzaPPMy6oA==
X-CSE-MsgGUID: 6L8gWUQeTuy9A2CrqiIQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40625028"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 07:57:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 07:57:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 07:57:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 07:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCSeAsG6VHZvjlRi9/ggOUIKcMUg9HF6KV94eQHmt20SfUEmtzxSmGJrODlI32ChqmrDvXyfzjAljAiCRmVMFwblvpxbrolJrCmkKnIT0YYC6txlB35Qa2zMFPcYPETYPlJgq9a/7bKMaXSAnsAUut6aK5Al9JHzKwietywmfvoKKdtcMUUQgt3MfWZJ/hCS+T7TLwJ+1AVwzE2c6vnHqX8xPStROaTsyZ6n+YGUsBS1YLVeSO84uZRzYb3Z6ynqZ8xjROo+DFoDc2B4lNBR6VA8eqPIRAweiRjmMdcMRiBm2W7B5TNaiQ6ApSXoplP1zy296GRHCQXQ1wMkooMi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1OBFqRakj90FzaQ90ROv+l6/IYmItjWI9p9znnvrSY=;
 b=dHQyDgBZifsJwVbs8EtW0+wZv0Km9Rp/hu5lLRlD+7sUgn9oAAijCBQ3GkWbmU4jqVL8OuachNRJprYMJq9/5D/S8hj5JvAurQIMSDlLQSTNtQTE17uLk5VvW1bJSBTvyFTW6+OXPpETd4zudw11jhEXSU5pT+ZbPyuNwh/6IVl3xhRasvA4Xl3WAImDO189yAF20ME4Si1scaXi9eRtyS7p+z5lYGYpn2s/5vsmTu1ymoSXE7vr7DFnFaT4NrEgcPqaq2E173F/rHoTPfcDi7hdffJEK6xNoKK+hVI10RdgHdRuyu6inBvnceC+Hmz7RpCQicCGZF3mNOtsV0DEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 14:57:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 14:57:38 +0000
Date: Fri, 14 Jun 2024 09:57:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <ashutosh.dixit@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <krishnaiah.bommu@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v9 1/2] drm/xe: Get GT clock to nanosecs
Message-ID: <7sbb7c26czyr2oq7s7ctr4e2pzjlfho6zcdwu6ubxcctewnapm@5q25tblkbvmq>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240613100411.1579218-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 416f8d21-39e2-4242-3bee-08dc8c825534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2+3a7idtaNbzehG4go/+8IUpzyAx9Y3tWm7mSZhXC5GrQFn9D3wkBTECzAUR?=
 =?us-ascii?Q?8igJ93nIoiD7ZwWGQZEqM+WazVpVsAN3hJJO3HmXkYqOyYiOrpHY969KWVXB?=
 =?us-ascii?Q?2qVVVn6HuwxjBGzHiFTXjVSgqDifHcwv3wQidnxQW5sQ7UwZHsCW8LY+QubB?=
 =?us-ascii?Q?WdrnlD4GCa+RTjI3woFtvKbQntClsRTzaZO9Bm/rDRANqPdmesyUCHW9EAzC?=
 =?us-ascii?Q?z/wxlcc9VmdVB7KBaR7BKXx29ezuOICKle1rCrDwwb+k+all6VByqKA0GlVN?=
 =?us-ascii?Q?SFHGMXN1qR+sMPZPaMFzKQNL4J2JBk2Tip/bk757RULPN3rZv04Fc7dtGUC5?=
 =?us-ascii?Q?GHyHnu1RgpTpUaATRRSw9ogpfvZFBEiLh2iQUmF0zSUOOZyQ7HPPcL31Dvpv?=
 =?us-ascii?Q?97h0+8QU2Bi/eUBMv/cXc5nlPXLMHGUWRk6O5l3S7fGUmAinDNzIXkDBziZw?=
 =?us-ascii?Q?0/B55AbvSXgQlo1PBfo1F9Ook7Mm7D+ZQHPnYJZwWvS50ZsYFF0u3mtF5GE5?=
 =?us-ascii?Q?nMUqMVLVQcsQ53YP8sYOOrOuXL0A2wOJHNzMq1TJiWG8BiIgK7jWJI7DDXGg?=
 =?us-ascii?Q?R2iC2nEI3sKR8TxvAwcvqKNNDlEHpo/0/8yb1l8tNiovagwSufwstH9FN85w?=
 =?us-ascii?Q?d490n3kuXf3hqsl8nYenFOZRJE90AlAYbMkpIOtkUksuioqFtF91gR37omGQ?=
 =?us-ascii?Q?4ezp+NXZiK1H+eMuz2C2ylgZBYVTbULo2q6Mbowj1iUVkSEIWd9RMuD6yXZ7?=
 =?us-ascii?Q?tKgvic+p/pKU+ApDyQzqfmUWfQdJFkC8lLCRZ6EuNq2MsomPo1xNavCiIDp/?=
 =?us-ascii?Q?GQK2KdQWYJkQin8YyabFNvNdqAvKhHKC95islBCvhIVx685CXybzinQu96CQ?=
 =?us-ascii?Q?h1TvphoLW5MaDPTt36eHkp5D+q7Y+1Bx6L66VEWMoKyzwKp6jorng8RfHi/x?=
 =?us-ascii?Q?wIiVdDb9sUv4efn77jPDGKHUzi2gfhLZbGBZSvX1U8MV4v1ZwDSVVVz5Y/Yk?=
 =?us-ascii?Q?RFSy7BldmsPlNgt7L52XfmZimWeduVWAyA8o1/LPB0CizTC3oA/aYv2YqhNu?=
 =?us-ascii?Q?lbt/C3xfswnFAadgIzpVgSLB8WoFSJB2jJtIjdKe7WDj/iZ0czcGxc+NBoMi?=
 =?us-ascii?Q?QuDK0ywhRu3Ofk5irUyCbxmc0tZZPPy25Tqus9c7PjvFkYfVEJHwmiPWP08V?=
 =?us-ascii?Q?zB9zaivq7QOmb3P6mTt/9MIIVGWkKMjC69K1Y378CjdyJReYSuhACxIMDDyJ?=
 =?us-ascii?Q?AWoZparHdDuIEfK5gocz6E9ph/7b+5M+nKHxm5WDkjoV9n/F6nnkRpx0ammK?=
 =?us-ascii?Q?buGY3uy1h+MnnUY+lGvZqYNX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iVx4WoVTE4A3vT8yLvsUGUDArkG1jG2jfPS4KGcqjj/WCqSFmpIeQanIgLYJ?=
 =?us-ascii?Q?XLw9B1Zo2bGuFa3upXfFah9zq6EOkuP0n5EG2pD73A/VOMf29FUoGpBfIxzB?=
 =?us-ascii?Q?ir4WNjoD6amKwubCV+/s5IHaIDgUXnZKd4dVLdc/QElBzf++L9PXHdaRubRd?=
 =?us-ascii?Q?ZBe2+zWBJ9FwNZV/9XyYnj/W9Lf26mfvH9qcee++brbzZu31mWhwfEf8T6WH?=
 =?us-ascii?Q?BFQgMJi4WVfRRjkygzDxZ/GKyU2woPHPofeFTbwOzLraNGbpajsjk+fVStrC?=
 =?us-ascii?Q?o2l8PfVRcatzKSkUmnKlAXSXZHIQvP+LZgvK332AXkXaM6ZRJ3LbOw/TdU2z?=
 =?us-ascii?Q?QxLJ94DX/fKmHN6C4qkI8Ved+/arRuEOg8jdS2J1jS8/RzDUi4QLEzUtk6AE?=
 =?us-ascii?Q?yvAgnZ97pt6Feyl58mr6Xz6PXtovMGeJHo68mM+mZQ9qWrLqHM78H/jzGDq6?=
 =?us-ascii?Q?K2xbd1yk/IRLEhozx/F74YBXqRmBHmwBQKJ/s1rF07O6gK6rRXM90Twoz+uQ?=
 =?us-ascii?Q?uA51FWFXxkh35Uj2cmAAAtHPItbr7vjTcbJ+JZQdY4R1W8Qx8Xk2H7WVhLrc?=
 =?us-ascii?Q?EEW8woQsSP7ZagQLz5IHzOwInxPJ+0FW+TK774rIjgIEBxfgvQLM1zdWboO8?=
 =?us-ascii?Q?oY2A/tbvFRdd5dLLUusYNz63K3ZhY2jEw45FFbNUjS1kw2rw0yIVX+IkA2Ha?=
 =?us-ascii?Q?S/kRPwoEIuQbeZMHFhKjkuZXi5BLJMM0cFDpZfu5kDLIwjTZ9+8/7V1VwRzs?=
 =?us-ascii?Q?nF1eAjbmXcBo+b4svqa15zrlqlCIHUfxainNu6n8hg1Xp3+H/EtFW0cPGzbZ?=
 =?us-ascii?Q?JX3FcKsJqHnDvlQopN2U1uL0mhuD/NvWkIneGOcpOvM8W/KekPazUJKSZVEm?=
 =?us-ascii?Q?I0Q7Fxl56OQXic59hsiTd3rYUEKkcEb1nooUHoKQ88sjXvftFHHo6uf2LYEX?=
 =?us-ascii?Q?SjO7g0qxgvp4rQDynYYpJZzg9PXNHchIOleIo/lKdSBGcByInlfPB+1WxsAC?=
 =?us-ascii?Q?0Z7eTAh7+1o20RuVfGclYhMkgifvEPS19EIx18lab4Ajbk21c/fntlAY3XKt?=
 =?us-ascii?Q?VFD2U/PUbq6dJeN9xcszUydcDBT2V+GixGAhmkFpirblu7/ZdBFuhKybOoBM?=
 =?us-ascii?Q?p9Ds55RUmEy/WH21wnGV53NI/rcWemzjYi2nwbbetxNBqBI/VNfnPFd+Ve+B?=
 =?us-ascii?Q?oF32jv55oZ0Rlz7eOc6fxiQN8rcpELoZtSHv1Yb/uWbH0jVKYNaW1GObfTRW?=
 =?us-ascii?Q?PKNxMlzPFGwE5gheTpw/tN4MqSgA9Op9yx/dB5x7X24fWo6wGEXejO06cZlC?=
 =?us-ascii?Q?vhTYpYjaMUGybgccZ7gahWmlIiwJdl6C40u/gHBZ3Gg+YSx0VUZfeSz4uXvT?=
 =?us-ascii?Q?wUnBZtTTAFDWMz7vAa7RKZ3S83IMDmNyc9QT9jkxugZ8cjmCdI/UpEe5fwHJ?=
 =?us-ascii?Q?Rr6FFET/JMrUfIRG0tv3318uCbNl+uIe1Sr3EwC161j/qsx2vE0Qc3RqKCFQ?=
 =?us-ascii?Q?e9rbCGJBatxm906QDMQFbnZVT3dmrrykh+1FZu56te+tp+KtKy0dqLk8Ircr?=
 =?us-ascii?Q?RCty4x+MjaDid5oDfkqxA/jtdqaitAjCo1bDEjPSlonkI9j/nJK/CDClbr20?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f8d21-39e2-4242-3bee-08dc8c825534
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 14:57:38.5832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeDIU6/ERKy12edM68GH1m7o/JILLGnuTEKXcOOcQkyvI7sfRrnfxPrblV9M3NYqopzbIsRruNsYJSThotjm+18w5J3oH2sE3SiAQk2ocIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
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

On Thu, Jun 13, 2024 at 03:34:10PM GMT, Riana Tauro wrote:
>From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>
>Helper to convert GT clock cycles to nanoseconds.
>
>v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)
>v3: rename xe_gt_clock_interval_to_ns to xe_gt_clock_cycles_to_ns
>v4: rebase
>v5: add doc
>
>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_clock.c | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_gt_clock.h |  2 +-
> 2 files changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>index 86c2d62b4bdc..17bd8851ef3c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_clock.c
>+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>@@ -99,3 +99,16 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
> {
> 	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
> }
>+
>+/**
>+ * xe_gt_clock_cycles_to_ns - Convert sampled GT clock ticks to nsec
>+ *
>+ * @gt: GT instance
>+ * @count: count of GT clock ticks
>+ *
>+ * Returns: time in nsec
>+ */
>+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
>+{
>+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);

other than the changed unit (nsec vs msec), this is the same as the function above,
no reason for a different function name.

nit:  we should be using the longer nsec/msec/sec convention rather than
ns/ms as it makes less ambiguous in code, matches other macros/functions.

Suggestion:

s/xe_gt_clock_interval_to_ms/xe_gt_clock_cycles_to_msec/ and make it use
DIV_ROUND_CLOSEST_ULL.

s/xe_gt_clock_cycles_to_ns/xe_gt_clock_cycles_to_nsec/.

+Matt Brost to ack

Lucas De Marchi
