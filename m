Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4FD5B176
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 13:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B8510E49D;
	Mon, 15 Dec 2025 13:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJDePeix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447210E49D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765803924; x=1797339924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VGE9dBjIJ4/aMVtfNdkdpXsuDenZo4786glkTAxqg8g=;
 b=GJDePeixKxnGJq0YVVedSGQor6ltFoFPVBeiRA9tIncb9sEwX+LRCqxH
 KtpnopdLSJ+DhyeSycq8yoGU2luvUHD0BUvZ38ZBg/5J43miSkPKnGRnS
 rmimMYAToeEM2/r5RemoJF85FkVIDPLd9pp28JvTjfCPrrW70fgB6qzwl
 Pt0goo/X9YarqARmj+SR5N6g+AQdTl8E05wmokDGyjW/hOPp4tk8MDy5a
 0G/xYFPAqYCAKJoBEb0o33KTDSfVxirVUi3O0n51dKSgq8w1IAcjMa0Oz
 fOpo9FJSabLiVZ6hUq45wvwIR+iI0H+FBWCdc+P3FbsIdqor+lN0X21cT A==;
X-CSE-ConnectionGUID: 6/XxmCd8R/ySXIQMyy1GHw==
X-CSE-MsgGUID: h4PgvXk5TmqV2Q79j67otA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78341153"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78341153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:05:24 -0800
X-CSE-ConnectionGUID: w9tsnZJFQVKgDfDxdV9mBA==
X-CSE-MsgGUID: Yg24IZ7vTMOl6ASmTO8Ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197342869"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:05:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:05:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 05:05:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:05:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALn8YPCemeGm6TEdlEC23abuyO6iPIpYhPTHYekpsnnFpJ5hmJy27FQGgHsb8M678jatrqCBZBRMisIFl0CtUAS50cWu05Cbq+TUDM7A3GOV3UK6/gKuK5ZecdpMejFnvsQfb6w5XUtjcFKq67I4lQBy6bRI4SxfwJj5Qw7IMHBLjZ6HDbt2pYWIEuIbfEBvkxVrDr3Wy1ZD00554f3veKKoTX8H9TH0sZMx0mYhTZaVl0Nwkso31OEX0JLXBa5Iz1nLUzvPb9TBF8cUw58pj6lAeaJLH1dPbesTccGJrFX50cqdVk2TVnrtzxufrJdtIQ/UfmcWcAkqNzWBHMi4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGjJq3/iqpXFATp/MgzsgQX3Mt8R3ErS7pZhf54fOyM=;
 b=Zu99fnvIoAHC3zEe/DRyps/tm7VBaY4LP5D8SqejJ32pWtp7YNUsS9cSzOkmxdi3YdFOJy0dZNAofm8QnLuUXdiM35DkAqH63IWeQ+hlOGdJSooOMs59Kt3g5iEmgrwfSijKYl+ritxWlwxQ1nlW8oA/gEL6ZmbDvsL/ceLKznrGp8uxN1OEKJGekM0X4ybAl6qruUnQffL8Qh6sOtApSCgO/rp29qylM4sn1y1jcKoT9j+GJ7se+2UC9P7icfRMT1/7DsLyMjK/cGNe/A62ko9lG+tdqiGChQ5d02awAebKPc/s6tcF6DymSKkkMhzBK40gm7Ge8Ws3kpeAy/4zRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS4PPF46B98A11D.namprd11.prod.outlook.com (2603:10b6:f:fc02::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Mon, 15 Dec
 2025 13:05:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 13:05:20 +0000
Date: Mon, 15 Dec 2025 14:05:16 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe: Add more GT stats around pagefault mode
 switch flows
Message-ID: <aUAHjCZdTZxECohh@fdugast-desk>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251212182847.1683222-8-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS4PPF46B98A11D:EE_
X-MS-Office365-Filtering-Correlation-Id: d77410ab-d889-4ab8-ab5b-08de3bda99e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BJ+ZB6UF6jMOnJ19iQ6ZW+UIjU/ZAdJ4e6hPPYWP2xC0Bndp/crxC5ou0LUg?=
 =?us-ascii?Q?/wjisSu+ZOD+l352UgFQ5vsWsepxcT+wZDzr5DMwpgbe5cLNEPODn5B9geSD?=
 =?us-ascii?Q?LXB4SGamylc5QF2VbSv7bYJRviikmMzXdpZZ4dG/E2mobCd2P8OKJIvKlG9C?=
 =?us-ascii?Q?EW/kwbLxaVvN73/djT5jqDdfmKqw84kja2oNWP4bZ889rD3M5b88BEuiVIts?=
 =?us-ascii?Q?7ClaDEDqL5Xh3PS/g8IzMo4U89ahkXcfRbBZ/bnoZUCOm2fyJs1dun7Y2lor?=
 =?us-ascii?Q?+xZu3BQP6ADKfTqB/lwZNCwj7Y2N1HE1erhsezkd/QxhS1dQUuwjBqu94COA?=
 =?us-ascii?Q?k7ZtBkDIcZsB1g04x4ewlGQXXbTETs7S1IyKmNyNY2RUrueWSXipSLhycd6O?=
 =?us-ascii?Q?pSIJNHZoRTERh53nXN/K5s9W0OX1n34iIuZVeJoV//ffTXumQmyG12HGA0H0?=
 =?us-ascii?Q?aFQFLH9DUTXdJk3NeB9XTyRIGod3YIAngb7GcQWlLPqxsjIfvTlOr/WaGHaw?=
 =?us-ascii?Q?0tcTQetCrl3/5CajGY/zLyV0smNlD2w9C2RZxvmI+WwpoYtxY67dIFSslPXQ?=
 =?us-ascii?Q?R0sPWjwpWGAX6GswreSWL34/53c2JjRangMmi3zp7NSS5dZUqDwHT95uBmG4?=
 =?us-ascii?Q?DPOeiq5/4gKCblxsK/ogrtHHnSkt6kzVeB+gNQZDzDEDuGpaU3Qr2oAQnFKB?=
 =?us-ascii?Q?15WXN+2HR0XPhREVe4legDZ5blMPzvsJVGEouhUfukw4lxwUcEGAFxMTcICn?=
 =?us-ascii?Q?WXoCFCcJE9Urtm2EhnPfPUjk45DP5HI+Vq4qlS+iEI20kT2C1CwqAFOge9TR?=
 =?us-ascii?Q?3bD8FCzI3sKUgrC7g0m8bmjSDRdQFtmy3MuDj9PU4gNJcVDWxygekm9PRLIN?=
 =?us-ascii?Q?GTkWH9wotzazcESQSWXVHgp7ie9M0bPCiMX1PN8oUxdsdZOiPZHIhZ3TRdtg?=
 =?us-ascii?Q?DLnnowli7OWv2vVm0hHQqnAvgN73HoluxyuK8eXNmvSTjLcH5ngEKmEigWVP?=
 =?us-ascii?Q?0vfdCoaOq/pbzhRT4rTYpTmBEbIPxEWpeUnaaojoJyYP+ppxwo2YEpuG0A53?=
 =?us-ascii?Q?7/TZoAOafzXwxuZcULZIhd+7UaxME0VAB6FCjjM2K9TSNIF2Pvf+TB2Ar62O?=
 =?us-ascii?Q?Q/t268xZewTF68azdhfRTpYAUt64fh0p7sy20YqUTCLSuwIYOOmvVXeR4wBL?=
 =?us-ascii?Q?Vz4399TkW70PMaljkE7Ga9uoBCN/sqkc0bpTHxH+YZlupmMZqbNSmziBuTNM?=
 =?us-ascii?Q?s7gQk12T0aaJxZ00RneDY3pIQVVsAen2e4O/bmz/B38d8XhKpMsde0AG/9YX?=
 =?us-ascii?Q?4YVoQYK6L5+m+MOKMmOeq70QIRyEC7Nf5rtlVqJ9NP0iWj5sUcGfZLmUgxDV?=
 =?us-ascii?Q?Sv+6qRkIEeDDhz1U+97QR++I1FYe7a3SIGgqvk4O4qsLvWMOuEumexEEQBrC?=
 =?us-ascii?Q?ttZqBq9zNNUS+XyiFLxmDzr8HFsMHtKm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VTGP9w1s+fuD4qOyCIWOiw5Pv99CZqiiHjk9uZ5b4jJ62JUUuDk8t17Ki9+F?=
 =?us-ascii?Q?6KKxWTVqxH0HD/Rkr1apqA5RbS779KquRHykBP9ANadYr5NdbdgXRN6vXFbI?=
 =?us-ascii?Q?W+K92P+Je13il1vCTCTqgmk0mtpUiAph2CWLys6yJ/u2y2kHY5GWnRVWBTam?=
 =?us-ascii?Q?S6952tiq3HU3FNH/xlNIeDqClvSt1jH49Bv4QKrOG508Da4T5NfB0Ytggq6d?=
 =?us-ascii?Q?naT9TSJkQPqi7ubMYroZPYCWZ5No0O4gBWLbHAFkOqrlJal30Ar+wlgl9Bmd?=
 =?us-ascii?Q?W2KUnDZ0Fg97gHWVdh3j9hdgQKLyaQ2NgkDSDpCgUMcWBlO78TYADja+ar4z?=
 =?us-ascii?Q?bPYBl276+J7AvgfY9WBLaBRAhz5VUxbNj6D6AC3579of5AHZLgPnXvrSIN9D?=
 =?us-ascii?Q?q0mvWAeDJ/eRDmi2KNyL8hofpNJkggcyiHDsFlzwasxCUj+nIAckUP4egSuo?=
 =?us-ascii?Q?byLMBrkGoKsqTupfQPlSfs270G8eI240epZ/nTciwWiAfNuMEIVL2XNI+5nX?=
 =?us-ascii?Q?pSqQAAqaVrNTZN7Fmm5ROXnwJDyLkVjdhZ+9FeQbmg3D/KFq0mLPooy9ooF5?=
 =?us-ascii?Q?5r03nd0oZF9b8ExFJ7IunXc5C3yAc//FdjzS6it+Y+T5Yo++CU6e4AlsHaHz?=
 =?us-ascii?Q?eQ82QeWqM/f2NbYAIKr4GW8XBXQpABAQ5x01vS+TAwTnVaO7f9WAknZlui49?=
 =?us-ascii?Q?0kdprOVQpRWfEyCRiveUkBiOSdA4RKu40sKmBTwa2seg0IDK7rBgIMFjXLID?=
 =?us-ascii?Q?dbqkglhceRLPTW6+vdiJ16Oh6bAWemPJhW+8y5gkZVCkK/vtPrTcyB99BQ8+?=
 =?us-ascii?Q?qYHbTdrZw45T5x6qA6Y5XWzG0zr5f1k2ukMZ6L9mQQZooyav5dppueJrWFf2?=
 =?us-ascii?Q?h2dB9yPOPlY3btpJ/DXSeOndw1/FMbim+aDoL0bXiml/Q7lJswK/O4OcNLYJ?=
 =?us-ascii?Q?BwHi+a8XjUc+aS9/h/BburnqeOczkUOnBVKfhKWfllmOKXcMX1xrzO772lhI?=
 =?us-ascii?Q?Dw/Igm5Ktaf8wRohrrZZb/A3CoU9NXkJeXkxr0HHLA3wscLiQX4mP1bKq778?=
 =?us-ascii?Q?gt92dSPUslDYBPA0Uha0sds6CKepWJRRPfq3E7u2Plbk4BlB1/kvB+ADky/A?=
 =?us-ascii?Q?kGThr+yNsugf/y1dibRFyrCvEAV8wJv1wPNfS6MIdSZavQQGbOWa0uVr9nM/?=
 =?us-ascii?Q?AeFSDEtTF5FpZRPCvE/Ko5T/U8AZ77HZM4hlNCXgW1L/jxEerBNCBNU7xl/L?=
 =?us-ascii?Q?kxq0WlMjLeF8EEgNvFTg5LVyxR5da8P4iq+NGsq2y2rKB2tIbAZGfp2o1/xd?=
 =?us-ascii?Q?E+5Qn8LaRrtTUkIw27DYIfSdzeAk0BPMRGXlzLwioo/iPh/flZKmZQM+gr41?=
 =?us-ascii?Q?yaegFUkzVXCAHQlxiyzvkRFuj33uumDBMmP0kA9jgfdAvwcJVbPPGwhVZ2pk?=
 =?us-ascii?Q?2eX9sCiunQPwJiP21LoRmw2vUcH5GuLbDP6UBWT28qLmSzfryMTx9yj2MtZy?=
 =?us-ascii?Q?joyyzpeg3015BEaOOc6Dln6OqMeR6C/wAF/7u/vFMFPpH6Ye2qWOaKbe1jzg?=
 =?us-ascii?Q?IaHOCA+7JPOl7U10x5fgjqAu1NGCeAGi1ufqDSUR5zGKikOAbpEElCsCj9dw?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d77410ab-d889-4ab8-ab5b-08de3bda99e8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:05:20.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOt5priSI9nHSf+wcEGWjxT+frCqOgcz+IrPSK85q25BdgCxZ24XVH9yv+f6t2ylCBUlUFvMmR7UYMWoEq9mna4kNYl8M9aRnkwn+rami9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF46B98A11D
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

On Fri, Dec 12, 2025 at 10:28:47AM -0800, Matthew Brost wrote:
> Add GT stats to measure the time spent switching between pagefault mode
> and dma-fence mode. Also add a GT stat to indicate when pagefault
> suspend is skipped because the system is idle. These metrics will help
> profile pagefault workloads while 3D and display are enabled.
> 
> v2:
>  - Use GT stats helper functions (Francois)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 22 +++++++++++++++++++++-
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 714045ad9354..fb2904bd0abd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -68,8 +68,14 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
>  		     "hw_engine_group_suspend_lr_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> +		     "hw_engine_group_skip_lr_queue_count"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
>  		     "hw_engine_group_wait_dma_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +		     "hw_engine_group_suspend_lr_queue_us"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +		     "hw_engine_group_wait_dma_queue_us"),
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index aada5df421e5..b92d013091d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -45,7 +45,10 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_64K_BIND_US,
>  	XE_GT_STATS_ID_SVM_2M_BIND_US,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 022fc0c30d38..9a53021bbfa7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -200,7 +200,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  {
>  	int err;
>  	struct xe_exec_queue *q;
> +	struct xe_gt *gt = NULL;
>  	bool need_resume = false;
> +	ktime_t start = xe_gt_stats_ktime_get();
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -215,10 +217,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			return -EAGAIN;
>  
>  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> -
> +		if (idle_skip_suspend)
> +			xe_gt_stats_incr(q->gt,
> +					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
>  
>  		need_resume |= !idle_skip_suspend;
>  		q->ops->suspend(q);
> +		gt = q->gt;
>  	}
>  
>  	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> @@ -230,6 +235,12 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			return err;
>  	}
>  
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +				 xe_gt_stats_ktime_us_delta(start));
> +	}
> +
>  	if (need_resume)
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
> @@ -250,7 +261,9 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  {
>  	long timeout;
>  	struct xe_exec_queue *q;
> +	struct xe_gt *gt = NULL;
>  	struct dma_fence *fence;
> +	ktime_t start = xe_gt_stats_ktime_get();
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -262,11 +275,18 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
>  		timeout = dma_fence_wait(fence, false);
>  		dma_fence_put(fence);
> +		gt = q->gt;
>  
>  		if (timeout < 0)
>  			return -ETIME;
>  	}
>  
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +				 xe_gt_stats_ktime_us_delta(start));
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
