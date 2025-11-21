Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48361CFC50F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 23:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6710E0AC;
	Fri, 21 Nov 2025 23:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBRqV08Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739E110E0AC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763766498; x=1795302498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OFm0urPNNGskMac12aH/ev3MT+rfNMmzRR3gs2nIF7M=;
 b=EBRqV08YSwCEccjH1mbGFpwVYq9cTWjqjysHVtrnA3L2H56l2g+7FRcB
 97vYQsY8orvwxw2ephlIWQDbjj0EN26V7OEJ6saHWJ8N1Lb/Guuei+Y/g
 WNXmnE9lJQujlC4NW77PR9egnDZ3XkZyME8OgwpxtCkjgU+PYo49f+CGe
 98aXyogKJIS4fxO1sBPXH+CWv+xsF6eyrZ6AeX8zu3gu9n/97gEiPaYga
 1V6QTxiXHKHYHiqm+wbVW47LMiMxd1xE2DoY317NWcflTxAWHwT03/LW5
 H2EdbDVGJn5bGFjfMexgtYHpPwrEtW6/1RTYEXA4jZoeB8IaW9x6IQv9f g==;
X-CSE-ConnectionGUID: NfaGEKfxSdmgbGhsEtCWsw==
X-CSE-MsgGUID: 2mqcAzCcRaGUGiVPDqLZvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65750593"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65750593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:08:18 -0800
X-CSE-ConnectionGUID: ZsfIV6pjRiaCPgcxIafmxw==
X-CSE-MsgGUID: XxR2dYagQxSMM5w1O5YerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196950394"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:08:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:08:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 15:08:17 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJXkzVpt5SolFo0sWbwN5JknrtWjh+pdVHajT+ZzP+SK9CVdwbCOAfPp6+Qs8n4Epduwk7JvlEBAHyzx0qWkivBDWQtsmPaVjceVGQH7Eg2WbEGVvX1zioHVw7PzeMn5gWqAWf3LhiLJnsEiJBQ2dKlxf7OqbXXytzIGXDsTdDEUiktfQdQ5Cxbumdz+RLEB9nt6IBbp3tFKFpGfSBS06666eX1a4LbiRVOxmTor0xpjRXXGfbK/T6+NnYKFX1+GmfpzkBTBSIsFjKVovfmX/AN6RrIMFsvgPolLty+dBuzHM1EOEY+Y5DiqyyXWB3U7TPOFvFjrddKr7Yc35cI4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uve+DtZMkPr6bdFDhoP1IluGiPEaPo+s6In7HhkPMbY=;
 b=U4YRIWwWcHzgq6mqQ4e9Ybe4rKW9Mt/TQvpRmNvq1oq1WFkJbzJqk9Acpau/rKeUj3H9D5FKFML0QUaq+0ghFgvcPPiQof3PP9HQfNw9cZYGF2cjvkpL5XGTz9lBhnjmpmIm1K6e4zmLD8CHzMlWCXyoEv5ZG0ips4ViPXrZSo4Rohah59IP6SVU6v7gXKulda6Euy+b/WtLqiq37ug55McsaBYMi7jhru8QoSIJhpJmsV/YTDgiTt5TPcofjnz3v/Lg8Z/Ire+WD7b5oZFZ8MExfWmBzIEXBRZ842x4jmaqajuXFQP055aLUAiTstpB3aT/ap4wdXv+C6T9TmfkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 23:08:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 23:08:15 +0000
Date: Fri, 21 Nov 2025 15:08:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/18] drm/xe/multi_queue: Reset GT upon CGP_SYNC
 failure
Message-ID: <aSDw3EL7xcLd/MrI@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-32-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-32-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6e604c-463a-4979-e193-08de2952d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SiOf/71SJdpGe67isYCpMZ+JeKMISQQ6uBXZwOCFnJIO25PUqNpGKK/KTSt+?=
 =?us-ascii?Q?8kiszj+KtAhc/o3jicgxQcyQMSDhAQ3kOFXsACVMcVe0UaB5XPqutaRj5NOx?=
 =?us-ascii?Q?3bm34U9w2LvoP3y58cF98Cra/Y87RWDyuwFj1Fi7y/wa2Tj+9Q6ill2FPUmo?=
 =?us-ascii?Q?AhMlM/XGDP2mniXoLOCCjgPnsuTH9wfc7NuT1cKftkDGmWGKQ84qk7P1+fvu?=
 =?us-ascii?Q?Fwu5xeGx6eDvnY83NmilEFPbizue4SUypYZQeOnaI2S7DqtznTcYWlQYti1T?=
 =?us-ascii?Q?MZRxfd1UbBoACJ4RIoNJcpJ14gRv13tEv9A2TQEkOFnWmVJffsuqvSitXtrw?=
 =?us-ascii?Q?aje4wbZf+uJSVXuua2QZWIYz1+uvkh+EAeg4PT+BmZwnb60zvj7H4E04BUmY?=
 =?us-ascii?Q?4eDWmi0CV40K3cfX8wJtktWOfYoIW5xn84MMw7K8jZ9oAqvg+nTa+BlIv2nP?=
 =?us-ascii?Q?ZsvMzZtdLF7nkT6kz/BqQUp3AumxqXv+2BzcP84qCB411oicdQyTpbYL3aeN?=
 =?us-ascii?Q?13bfYYzKLNWJCsrMtH9PKnRCkpN1n+QSQdCUmvGewGKtiTGoaW//C++EzqOO?=
 =?us-ascii?Q?ZTEdsKeFge2DWunMMcbDqtz5GXgxlQJiKf7dMuaaGl51KEfvYWnrmRqV2XSB?=
 =?us-ascii?Q?p/OwY4wNKADoPYcLQ1a7ZN5c8sO7bxCnKeGuAhE66gz/+/YghgBA7l85XPDQ?=
 =?us-ascii?Q?bPfkEFwXNpXWGCTy+8jOaFAmecPRPWQ/FC4YFnKb7ecUdRXV71sxXPUXtVUJ?=
 =?us-ascii?Q?Aneeb4sgiZ78aDvYi2PLDU0kAdA1wr4UlVzgpxltv4IOMu3oJKaGWCniQB9a?=
 =?us-ascii?Q?htLwvgGRWvH4dX+Qf02gzXhBQwsuGFrYr5W+StVTCwwNuzbD/aR0UAQ8Iroq?=
 =?us-ascii?Q?EM6lv9l0LqiJ32OQSrL0ENmE9FxvLOAhccE9fZ54K1fBpplXMUvMf7k79m2v?=
 =?us-ascii?Q?a6V+Vo691QaGSXWYGkFkXE4w+G6Wr8K0OpuQZKIpUnxMfc3wwS24/YlO5JsZ?=
 =?us-ascii?Q?gHqdP3cRj8iokK3JhneyTuZDw8WhqNZbLwDm2GQWRkR5DVktrzS325y8aJj5?=
 =?us-ascii?Q?gqn+caW17Yc2RUrcagTvjuDgArOHMFNbNL8Z0PwIN7CGEp4xGRJY2NxPKFNz?=
 =?us-ascii?Q?AplZqu6u5aI305ZzNpoZ+aiqt47afDYL9jnZBlSXqpMxLcU3RgXyxg6HChZF?=
 =?us-ascii?Q?wyX0bsLGF5v5vJS+rQrPu+HqT0SI2DYpzxTqSD0yqpnT3CAD1vShXf9gsvyg?=
 =?us-ascii?Q?zvVsnTjLG1kCFjOs42qkXi1z0pAmW86VFt3CFjW6QXu4Fu8uu1DXRWcwasLp?=
 =?us-ascii?Q?jfRkxcHTf8c+Ph5fJP2iFzaLJxbJAQkChoAOZOo2KXrgxganqaB8vEwt0dkB?=
 =?us-ascii?Q?QC5M8ejX1+FyN9Dk0FfCne7QwuDGFRCAFIV1oSx6XgZ+6xkxaBQsWn4qZR2x?=
 =?us-ascii?Q?q69uopfdLwh5bSXF9IyYmDayp1USAe8f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nepqoJj6IlXpMIp6icmTYC92zIEuObPNsuuezEBnubKZL+0DwGmqjI+ytONE?=
 =?us-ascii?Q?wNx/ioiJknyTvXAp+lCbd++/Axxf1s5V/C4hLnDsHkzvS+TZZL9s6eaZYFsP?=
 =?us-ascii?Q?EcMVWBQt/S9lIj5OhVsYjCFm0MxzIvr1HFN5YozcDDlQ3EnqmeQAiAZGRH3F?=
 =?us-ascii?Q?JjgeRXjAaeQo4sipk/QvuZRZ0D3vzP8YaA7v1mp0aREseR6Ofaho5mIH4Yza?=
 =?us-ascii?Q?4QChr1Jk719jvxRNpKIxOzkugfD94CLSb+ZWBQRN80e4blXff35r+4Jf1MJk?=
 =?us-ascii?Q?fjyRAptBHSC8QdNfmvZpFyX/Ay16A28fu6oTNpdi3QkoRZtTIxdHI3c4LD0+?=
 =?us-ascii?Q?MQbpzQrfUqP14KQ1pyfW2PYyejCmZJUpqFy5rXe18SSS7MorzZkUznPf0G7D?=
 =?us-ascii?Q?mvm0xoKeyc1PHzou/Tb3on+o8UR58y734Wi4Mi6EK3s8XDLZp7BpznzcfDpc?=
 =?us-ascii?Q?ErjZOLDdy3Iww+ZtjwGcdomBKlPerK3IG8nUG0noCRhwzcPXoMlOgpLn5DqY?=
 =?us-ascii?Q?Q88sexGRIzQBbueo8kA76Cn5pUxhOj7E0ztbzqfVlI5v/Irtpjf2KuOeVD2p?=
 =?us-ascii?Q?U1nABeDRGNAk1Z9rXjhULI469+uQmkvj3iVLXffD879VP9is411oRXpbMLIT?=
 =?us-ascii?Q?SIli8kAQ71o4+MrO5Mvpe+/vmhsaqytCyAvWD+qaDLBZf0iWnLSC/vHwqLy6?=
 =?us-ascii?Q?Gn3lqhntneyss9aW2L9Y20lop0tHRONhFBVrbNaa+cwgaFHgsBwyw9GX4/VI?=
 =?us-ascii?Q?7mLItc6XD1fS7rp+OdSRRFbC4iztSTD9b5J4uabO12gJ9ByPf9SUoDPO5pv9?=
 =?us-ascii?Q?adg/xd9JBjAuFeQfNpyvoG0VU7wpHrt1OIOP81ED+IxZ6EAdz+js06q2pd/c?=
 =?us-ascii?Q?7qqrGqMJnmWk2FC52tMBtE/cOfmUXOUwccPGqsy42qgKWWdcJOpPuM6QfnhR?=
 =?us-ascii?Q?5S4ofjus9BS7KtGde4duKmdQe1Ng4VDFCIOQ9ZthM3XaPsMtfWgvMrMF4NSt?=
 =?us-ascii?Q?TSwr3/kXJknFJ9/B9uu+N5TzLi5+A4afCqi0nYfKEX/eb9jVz2Q7TIYkByu2?=
 =?us-ascii?Q?6KNd6EfUVHUer5SP0ruKhE6DbgfeWl7j0bHXv/JPAlH2KRnR0fxf3Kuw86AL?=
 =?us-ascii?Q?eqFGYlbsWZmN4I5Uf+7Tw4XgYHt5asGZbmq+hxC9p8PwywjI+BgrwamaG+y4?=
 =?us-ascii?Q?mw2fJDkwpy02gIdj9yN9v6s4m5UMDvPw0yPF1pOMyPFCR0mSTzPv4qwartX9?=
 =?us-ascii?Q?Q+D2oQRThipzxwbVHHhnb3rcrTtEBYBiQyrGr+W8qFsq2CZh+Z/E+ytRl56/?=
 =?us-ascii?Q?izkOlrtvrRhQ6ouU+hqz2hTlTakQf4X632Cn7/rsk6sAijjm3P9YtNo3qIQA?=
 =?us-ascii?Q?ol/kMOg7K3xWT0udb6+NmDqMvHeRKdZiB6wEGeQ6YImVrEePskPtI0uq9DIg?=
 =?us-ascii?Q?mLYJJL5nnNOTPTNtyWv2aucj7bugoeOLPtkKh/kKYkOjTjmCm8sYdCwfwzKD?=
 =?us-ascii?Q?K2aHDdGR0MWByALurm+WSHA4Xw4oY1vA2HsZT2WUxRfMOmDBn8jemd+h0HT/?=
 =?us-ascii?Q?cyEYQhSQ0LoE4RnqBzcmdb2NvGcXlrs142FbKwdso5WVRyKu++xdJqJYY9G9?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6e604c-463a-4979-e193-08de2952d99f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 23:08:14.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2psNfUKG0p6+F+bCPeTZoaHBR0GNIjjJ8Jz5fPdf8D9YZg15CBohRfYl7OrZyRSOCaQkl5SLa1qpXRzZmbhUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

On Thu, Nov 20, 2025 at 07:51:46PM -0800, Niranjana Vishwanathapura wrote:
> If GuC doesn't response to CGP_SYNC message, trigger
> GT reset and cleanup of all the queues of the multi
> queue group.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 87a33c06fe26..932be1e5001e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -593,6 +593,23 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  		xe_sched_tdr_queue_imm(&q->guc->sched);
>  }
>  
> +static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_exec_queue *eq;
> +
> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> +		     xe_exec_queue_is_multi_queue(q));
> +
> +	xe_guc_exec_queue_trigger_cleanup(primary);
> +
> +	mutex_lock(&group->list_lock);
> +	list_for_each_entry(eq, &group->list, multi_queue.link)
> +		xe_guc_exec_queue_trigger_cleanup(eq);
> +	mutex_unlock(&group->list_lock);
> +}
> +
>  static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	if (xe_exec_queue_is_multi_queue(q)) {
> @@ -618,6 +635,23 @@ static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
>  	}
>  }
>  
> +static void set_exec_queue_group_banned(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_exec_queue *eq;
> +
> +	/* Ban all queues of the multi-queue group */
> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> +		     xe_exec_queue_is_multi_queue(q));
> +	set_exec_queue_banned(primary);
> +
> +	mutex_lock(&group->list_lock);
> +	list_for_each_entry(eq, &group->list, multi_queue.link)
> +		set_exec_queue_banned(eq);
> +	mutex_unlock(&group->list_lock);
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -675,7 +709,11 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  				 !READ_ONCE(group->sync_pending) ||
>  				 xe_guc_read_stopped(guc), HZ);
>  	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
> +		/* CGP_SYNC failed. Reset gt, cleanup the group */
>  		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
> +		set_exec_queue_group_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_guc_exec_queue_group_trigger_cleanup(q);
>  		return;
>  	}
>  
> -- 
> 2.43.0
> 
