Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A7DC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 07:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20EF10E7D9;
	Thu,  3 Jul 2025 07:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6xq0xmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD20810E7D8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751527403; x=1783063403;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nwZVKbzz97puBA49neKO2h3YzE8dRsyHy0vf/u5GrRI=;
 b=N6xq0xmJL5uTqWe4qNdR0Vgeps6ebWTm+loekd3ESootNmM4JvUa5oNq
 bAPk0OxTQtjrJjMZ0/DKCFNMQh9wXAxqkM7rlHKXYQleW8ze07mWaze7k
 VCaPiYwV8/TTTzM4GS8ILbThh/b5gjCJ5keBbbaEpO4q/TXdHBPluTywh
 NUtv9SEj2X/5xrRAcS8+gxkaJI0jHxke0ryTxnRpkLdNKWaAFLDDqsttb
 /UoeIhab2/kONz1692Gn1zWURaH1LcZpNYvdtWyV3FDJV475wVRw9OY0G
 6RpMl/ebDXV2pJrxsgImgokv2WHlUmDx1OUuwsl9Ybxj2PKBN58YaBNwT w==;
X-CSE-ConnectionGUID: 3fwKAprxSRe2ydcVf2+EAQ==
X-CSE-MsgGUID: JF7uobkIQcK4oyxCYUmP5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="56461518"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="56461518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:23:23 -0700
X-CSE-ConnectionGUID: mvIAsHLOSM2mU269Kwb76A==
X-CSE-MsgGUID: WQV9T0HBQDmK6Dkk+eRWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154646065"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:23:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 00:23:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 00:23:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 00:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8zuLu6nxCa+v9xBDDkC9Qgm8zgUchGF2z3DTtSeOGRaeSTHucdfvMumvyV4knZegC7iS3rK60IdS3rXngSWQguR5Wv7Y5HIXecdLTOdI2pbt7pkGfq6+g35vvfWmMqFjRegZiBIJLX1SfebA/xRogjs3DbOrqkA1m7wpTsm0nl6NIepDjmYkihWrOk9S8FdiryDyATN8F3AScyITGccGdUV+U2LFpdpvbL+wiWn3xRM9A4lNgH6N2hhYf5BBvt4JkSXmpVOZVo1ZEnwhx0mduwo7CX5S8Qw31FSxti8FhGB+HdNC/nlraT0aj0JKPods1UzlCLfhnxq4lDxWODpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKF6y1sRnA6A9zVt2fKvwIaRYznoWdvUuLNkM2L7dVs=;
 b=ekEdSmQPCplbq6DIHttFUWHgMcziFmgAmx2sc43GYVuR9K9neD5yQ4ZXOh9rF9eAE61rb1AbB6+uk/HXLYjcWAZoaN0RQMfR3qo7BaqA0CyE+WbsmUMQyGK1vFKsGoLA9hPQK70Gr6GM/RPBOyhMlZHmklyvcJB8DIDLtH1KrHWG31DDkruHaf/Bys7lx6XQ1RiaI2Mk6z1IMZc1rna0rpRB+WBl43xirxnOx9QryuSgjaKu1/75RCtxT9ckQ9Y7EuRN2QekF91PB0K4AvjcnwORGvfw9RbAFBwYpUat47fqpauZtk8M7B3O9ryqEtu7yUhrR8aRP92yc/eJ0xMpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 07:22:51 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 07:22:51 +0000
Date: Thu, 3 Jul 2025 09:22:38 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allocate PF queue size on pow2 boundary
Message-ID: <aGYvvju-a3xoh2bM@fdugast-desk>
References: <20250702213511.3226167-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702213511.3226167-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c4f2f9-cca3-425a-6685-08ddba026b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tWzVjJ7z2TmHu+p9IWj0dVzT+JTXis7mVJXXX+4jBZPxj5ZZSqWCtdxQBS1E?=
 =?us-ascii?Q?LX00/4E8RoQY1vX8b5kozyoKmlFjCtV+AcwnIVzzOIG89y2N6bc17Si16Ry1?=
 =?us-ascii?Q?mk58cVNTklbbxSJnCakKOcUl1Q2VPMj2pVd5uve5MOqN2TaqARiDleyODMwS?=
 =?us-ascii?Q?eBI8iaIg+TMg9qLnJBsxCvcFuS7MO2TzC4vNHdYLJLrKcHzbAIj2AeC9xs+P?=
 =?us-ascii?Q?zadwbFnq52Yv5wNkCt+6jT2eb/Mq+jwd3o7OZpaUco7RQsnuzOl0kC/V8A/M?=
 =?us-ascii?Q?Eg3nxSuPMIy8CqVAnrTErIucaVnrYrqss1l6qrSCue4wfz6EvaC0JbiV8rPW?=
 =?us-ascii?Q?glef91gjwNwF0sjtUgjpDsMsNZApI6f6eRNPCpoKtTQxnfo42Ki4AE/lbszX?=
 =?us-ascii?Q?bXQzawrPEDkiLobAxApIwgNrgeutAmJs45mZovGRc77vEPaBqnfbYpkzHaSB?=
 =?us-ascii?Q?OAqtekhs0aoJ8hAp/1PBFaluMy5jqqaIBt8ZlDLstnvD+e7bAkbazFvnzluo?=
 =?us-ascii?Q?atp1kGRQvBsKiwZxnCssPdEZ1QQyNChQDGi59ZXbOLE36bNPFzlyF7gWO//2?=
 =?us-ascii?Q?MjNnFMK3qSflxZ8KATsdiIJhNZ45nBWLZbjnPHjUb7Vi3CLILAvpOH+e9o5/?=
 =?us-ascii?Q?x5eHR1yjKtQOt/NCPlgmcK8s7RxIdAmiP+TtoHmBCpzzzXjcdmRgkmqQUdJv?=
 =?us-ascii?Q?gcVBJuagl65aWC2GsOcuqUrrZ0tCQQ9Dyqx52hrw+7+ByVjoX0h2OSW7iGA4?=
 =?us-ascii?Q?UoYwI/zRvppmOYtBxAJ0Kc7WWRXpmJsP+A54srG1A32fimujsHASbM9y4Z4d?=
 =?us-ascii?Q?BUY36gsZeXmKI9rhu3+nZ1XrMJf46PK4d+EmE+Z9ke0YAkXYyMMCZi8r+Dls?=
 =?us-ascii?Q?28r5y4nczKHaS5j3Zb/JJrehgIzIk9hM+ggzxwnk84JuzSQ+6YwWwqkEXKiW?=
 =?us-ascii?Q?QIiCGD53SJfKhCxCDeyD/hpQ3Q8ot7MZMoeOqH76iAdSwY6RUlbBervOnml+?=
 =?us-ascii?Q?TcwKgqxrVd4qd0mpbd0xyqDF+nzBzXNV8sSbhG1ef4RHwl9Hce4kDS/RzfaB?=
 =?us-ascii?Q?Ic3ENMgXFpQN20c+5TgefYNfAEhD7tWgEvZWscBM/vhXNdx1phGPq1egza9L?=
 =?us-ascii?Q?Y4miLB5B37EENboCKUSX7BFtZilj+Vw3bp60eswzYKE+qMr8YnCOt5gK1ed5?=
 =?us-ascii?Q?fTxe74gl3xeGV3qoAlziwKO805LYYBKVIDoTT4VAlk0iO/EW2WV8+W8qTXhy?=
 =?us-ascii?Q?RjwdxoTNExVCLExt0f2XEwtSxuW5D+PkUAVdoIgWpCy+5oc0ro7j/X6OKYmn?=
 =?us-ascii?Q?/4bu+dneTvITmtojO4sVzCizmrpwYdm7+12gQVY+1RpkCVgvEcCpCAL0Aw9q?=
 =?us-ascii?Q?i7h9WuDX87iu+WqIVUQ3gDZqBoyd2PAUA7rLFTVcWe8uIqT4uQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQWryfe/uuW2q/0iEkUUZqQv9y2GMLI+WdhAEOaoF0XyfSdq1tfERL9Hgr9D?=
 =?us-ascii?Q?9VB+NTPT2+67my5zBaXtfM7BVtfwmYlmyqNO47QdrbVStgKabweQ+Ob27CoC?=
 =?us-ascii?Q?LVZWMtjS+ETbztPVaNea4vsP4AmJHqLcM8e6Rja9maHFgUHX82zqf1t7sT0g?=
 =?us-ascii?Q?xTIenw815LeS95FjRjU997YkX/+fsTSVMsnugYcBkT+G8xM5xz4BkjvoWEts?=
 =?us-ascii?Q?xg/EOzHh2cOfxFogsKOxkwGkouXfYNhQUwz4C9IYw+C8fCxN//yyNGapCFCY?=
 =?us-ascii?Q?DQesRRjGkbyGc1jCbFQYbBx/k6ZH7zF9R8yO847M56JvVNBT/V8a8Beaa0Rm?=
 =?us-ascii?Q?0v5Y/nE+icqw8qISfX6Tv0YJTvLZvtFovrkNLgCNkeUoNBptP16+/vC3sdbv?=
 =?us-ascii?Q?79uUfxc0HRTZVlZx7+WCTdz8seXHhKyNDIao69N/Wg3QxLRqW5mBghyfi0c7?=
 =?us-ascii?Q?nYn/2gQ+SsrfzexJ82ptGqFKBEBm54mANoDbdvCX2xRaWh4uMpvu7R3tnQC5?=
 =?us-ascii?Q?rFeH5tUpaYvZoPkkhA6wkyG5tGcDXwMlYvibHh7NY51daeolnnacPDPOZLMf?=
 =?us-ascii?Q?ZqHz3s8fBgAOPLr4rE3weKvMLC31YD6f0Var50Jn2aoJyzGdRw1ffvqnzlZL?=
 =?us-ascii?Q?zqUqkqubwuA7s3llY9pm8kmZB89YAaEML9MOa/C/nXm+ftZm1W91+5vV9+VC?=
 =?us-ascii?Q?kxV9RdpPylvzFA+TYHQSAwnBCQkQ7NdQ1xxNa4d5I2DcxZ6v43N2Hw2gpzw5?=
 =?us-ascii?Q?j393MwGh77oCDTYhv+PllXr7pRw6q7RrApxlbkCjD7zY180DGEkbLk8K/9g+?=
 =?us-ascii?Q?vGNLbjAHl1BUQiv8oV6nJ+UdVg4LAfb9th5DZHG3kDlpcj2mmh1ENfvZP4qw?=
 =?us-ascii?Q?iB/m29DHnofrS8dVFC6ZgQ4MXdZo/7fEYSgM+JSq8p+sS4MYFK3dpt/+BLh2?=
 =?us-ascii?Q?SD/Jq2daGhX1se7Jf6kN6MqOaklTzRIrIW5weh0FUwnLgQjxDJMup6cPj9TH?=
 =?us-ascii?Q?Y0IMqE3fp5rklYL3dBfcWLQhPMFpBXg+2vNA/UV3p51rQHe7UpuT4gwPOdWh?=
 =?us-ascii?Q?7k4zffHzrX5ign8QMpPaisucP32QEBTs+x9xN5CX91rvRP+Rne8FhFd7vzV6?=
 =?us-ascii?Q?uYd+aevuy0HrYqFc2WqG5hsVpiHmprxscFpJVtJTqnGsjA3jm9N0ddjQElwx?=
 =?us-ascii?Q?2M4XswEUYBzr1cxPZ41II1fBTvGK47nu1TVEDZSa554O8Tbf7ZGGSDyy3jUw?=
 =?us-ascii?Q?VHBMxe9uC9BjD1dDW/FaQXmtm8GXcWGVfYXvRKsOOWT3ILACy1bg3cNdveCb?=
 =?us-ascii?Q?Oonz3SClJxj+hKWaMxcCXFd7toIQAw/elKX6BBG0doRu8EJL3rvA+ZKbzwtN?=
 =?us-ascii?Q?6qiq/pMhZ8mFnCkWQL8uhDBa5nv4EPN5RFTuKIA8m9tzJ8wDowadq+HCEVIH?=
 =?us-ascii?Q?+pZhasoqw/cUtMyN3+Mf+7JvazvoUVW3eLOFyIfldLFceB4WTSxbFMjemcgy?=
 =?us-ascii?Q?oTz1pPRsUNoOQmumqKG+dQ/wCK6vnAvOQ84x9wmCTMS7/b3PWydamY3PieKZ?=
 =?us-ascii?Q?PRTD3uTxuWdx/huEItfJZcqL4gSvXjplGDvn4W9Z+ZHsREkSbELA3uFe1Xsj?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c4f2f9-cca3-425a-6685-08ddba026b75
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:22:51.3260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vODAKC7E0JPGR/I2PKBtls16D45gM2lNwJXFSu3xV9MEFKXW1/M2lFXJo4jAR594Di67ZC04HYcLEtjhX6dB7Z95nxtP0lK1IFwz2Wg4jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Wed, Jul 02, 2025 at 02:35:11PM -0700, Matthew Brost wrote:
> CIRC_SPACE does not work unless the size argument is a power of 2,
> allocate PF queue size on power of 2 boundary.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This solves the issue I was seeing, thanks.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3522865c67c9..5a75d56d8558 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -419,6 +419,7 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>  #define PF_MULTIPLIER	8
>  	pf_queue->num_dw =
>  		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> +	pf_queue->num_dw = roundup_pow_of_two(pf_queue->num_dw);
>  #undef PF_MULTIPLIER
>  
>  	pf_queue->gt = gt;
> -- 
> 2.34.1
> 
