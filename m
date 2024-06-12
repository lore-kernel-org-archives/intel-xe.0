Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284E5C27C77
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 16:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537010E8C0;
	Wed, 12 Jun 2024 16:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDlYT2Dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8643F10E8C0
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718211106; x=1749747106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zh/p2yksYDqaNWdJ4H/FcwzKS1YblYGvqCqC+n7+gaE=;
 b=eDlYT2Dvs+UP+CTGW5cyIR38a6vN9biB5JJHQFeHeo+LlkCNnkmTdQDY
 f9pB7Gd9xHUv6tzDUketTovXGJosy2UGfmF/7pKOIml7cZ2UZMXTw5FWS
 /RTK2tcuAcrbmvhjDgafIcgYKYgB4iPGGeuktBBYN4B3lrw481WJ0qzHS
 foDTjoDbsR4Gxi/sfPoXekt8tPUuF3Pf0RHb7DxeZKIrxNDzdTSsr+mQg
 u4rPV0+g/dDfXdVhBYhYPQmvtGcbpzNBKpnFMAo7W1+3uqbO6/E/xlV6x
 qw/Q4L4bFINYQZBLrQqkeRjzezrMamDhTd9Rkk4igyGVpe8tYXI8JrxJn Q==;
X-CSE-ConnectionGUID: 4QNKzRpAQTCQR2FkImQYsQ==
X-CSE-MsgGUID: Q6+sBrv+TY2rgG8cSdVmXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25668252"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="25668252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 09:51:45 -0700
X-CSE-ConnectionGUID: L1xdlvwoQBmyD19CukKgqg==
X-CSE-MsgGUID: qI7AEI9xQpG2q4DQfPenGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="44788847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 09:51:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 09:51:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 09:51:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 09:51:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 09:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtcUwZWX/F5R8o/EM6YyJ3glFiOIk2/BdrtbqO1eeJ5PmCgmL5DkSiRo+5hi9ny8/m18YPejji5fdVVZJGX/ZL8xr/z077yWImy23ZpN8D3J3UQQK5BjoYjahCVgQhOlzWllp60W/RYTvqbKIg4iJrR9+NzkRa3lSbCOITlcZZ4fvbknPqt+A0+OkJyPuoC6xTVMmrKu+stZBR8WVCTudDk83QJH770oxQ/aS6Lf8ZO8aa3Ax3N+uS21gs7Faj7Vw5RMY3DX6qE/tEM6hl8G8rOEquXicukMwuOcXRuCo5WDVOW0/3Xh3/No1wonWGa+QAGUbZ+S22JY4cEy0MACEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tifoY9phbeJ+0/WKlnZy/y69xZnM0bmWRx5rZM3rBsw=;
 b=Y8n0fPW5fzmNE/42kxJ+7jjTd112bfo0DlP/9hRm4TV3RdpGh2SE2gULerMDhaWwgeF+FZb75WsIKUhrdXObeAGEAJRsefML76NpAZPErCu8aAnyBtZdBzjwSnRc0MV9Qmol+Rh0JVvUgZpA+7fkP7p4aLYN6MnClBMLTW4ImeflvmZUwEQOVmxPZSbdRtMoX05GDGRi7PDfoDZpxaiJWEAFue7G/NWKLF/PF0opOZ5LZHle755uExkWMo+6JcCybky4Vy+x2kv5BcL83Q6js09AAG4jji1DMkvdXEIpRQcTZUqjz3sTsIw8k4BisyGj9OQav37YNwJ6SFq7dW8sDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 16:51:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 16:51:36 +0000
Date: Wed, 12 Jun 2024 09:51:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v6 6/6] drm/xe: Add reg read/write trace
Message-ID: <20240612165133.GA2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
 <20240607182943.3572524-7-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240607182943.3572524-7-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e9ece8-2680-4e67-19a8-08dc8affec47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5y986l0lE1QLvTItC5FU4uXJTAL9uYukhKNpvEuhiVPyUlSezftyspRkvM4?=
 =?us-ascii?Q?/v9shFI2CRSABWYishy2Zuw16BH4h2scBpJYWPgRk4fGAlkDJCo0SBCg9TOt?=
 =?us-ascii?Q?ZbK/tvunGfjdEf+s4sovXPQlMZOqZyegqHNpfdX93F8R/6rbHsw7KCznsHGr?=
 =?us-ascii?Q?8MYmzCXMwi+s3m05AxgFkmQ0/248rO3TLovrWTKpMcQPtl3LqYA3QIE2/wrB?=
 =?us-ascii?Q?5iYKUceDLeb58ui3vQV4pksb6T01mSnwQX/YaUs2gxbcwRiYlAQZxyX7Wd2o?=
 =?us-ascii?Q?tppXYtwdQl0LS6j0RZVrDNawcKPoQ5xvnvL3KJCW+qfz13FKCEXNtV65nIPf?=
 =?us-ascii?Q?r4wDY3gt+GBpZY/2sog4RoWFehXJ3v7zsTXvPZ4HUZux9Tt37vCDgYWtrfJm?=
 =?us-ascii?Q?7CgR3ZxaL5GqlLmnxoS0fPYaiMhia7RrRZPfOniSB3o7pxwkhsdWiCiyMVSj?=
 =?us-ascii?Q?3I5w/8sp8iv1IGDtm4H+9u6AF5C5Al5nf6+y8uhYAWoPDRfNewxS2n/o0aUl?=
 =?us-ascii?Q?H0vn6sAcq2PuvNhp3ttJRdMlwb2snWAEp4jE0iuRpAO2fRvqxysdb0H2GTDM?=
 =?us-ascii?Q?QB+daGoQm+CmxLTCMbStbhEXFyfeGRzq/pak1TC84Mt+BAnmoK0up8rPNU0L?=
 =?us-ascii?Q?MEbJfXkGWWd6YSN1uuNapAPsbxnsWK8gJpMoo9foUbhIEpHygDWgG9P9jrnX?=
 =?us-ascii?Q?37mAjEO3uY1qiL9shO0DAooPMEaVzSGVCXxi5ifQ3f/WF83j2OCx/cIExhao?=
 =?us-ascii?Q?W1Bxzy6u8L9L5whossucFR4K/naD9+oHUS9ZcgUr7Cd79AVJTdkxpNekC1cT?=
 =?us-ascii?Q?vDtZq72K2JE57BMPWHkC2Q+JsSPYz2izXhow+5QoGrpuRaZmVYJqBJidIzde?=
 =?us-ascii?Q?AesTW8H3Q7ks+lNni8Oddh3CPO1BDhd5X2HcRtiRhvLD7+SDJKqvrnXuZOTT?=
 =?us-ascii?Q?8H52PeNmRwOup1XYTohHDrREnJ8y+StNylP45iZDMNscBPXp1mo0Ec6vACRB?=
 =?us-ascii?Q?fdL4leLTEfPdQds9iIN0wT98hiB2ztmFORpHlZnvZd6S3DYwZLFmZhsm372/?=
 =?us-ascii?Q?0TmnvqiDY+S9jTPFwjSWPnq+QDfSzWJcciAzz8Jp51hozObP9zS7n/0i2vdy?=
 =?us-ascii?Q?f7DiAP9zd95EM4NrDtGa4nGiMf8d2hOK1xsqwKq34ht4iP6FAuy1Ix9gu7rQ?=
 =?us-ascii?Q?XBPMDRKR7nW6znBPYWlp3Ag6i7jpsH6NVLQVO11JzZUwdUXHgqVw5c3NqJYy?=
 =?us-ascii?Q?3SujIHZv3XzIEVWkLe8aYCV6w0dU96VW31wRCD8hDfl55/GokXyhP7lQjWND?=
 =?us-ascii?Q?IFiY5D5CSMtofSWLKoPRKWj6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBYdq/tBKPBRS2XXV9sMwM3uq+UMUGgNeLO18YVfVQyq80lXGnKwTuwId2bI?=
 =?us-ascii?Q?nLA7c1l7SaTGEX2rfX1m9BXEB006uI/VKKA3EQmxWXren12OUjvUs71RXrWQ?=
 =?us-ascii?Q?iLcqjDBOmaJp5vzuRBcbtgx692pfDjfl3BI3803E3q3KuFPYF32dieI2tQK0?=
 =?us-ascii?Q?SATt5AFd5wy6NxibqsWcQnJAVUF5R2q1rxRV9SluB7WGCzgwKeTWJ9u3+JvQ?=
 =?us-ascii?Q?2xR0kTFRdHEKvnfNkp5vDdQtp/Sd0gaLuznyPyIUbJ+Mv7c+WRB59EV/nwv7?=
 =?us-ascii?Q?i1DowjV/rBVOT9BBRgH0kpmcP6YMeSRmYWil5qkrrBfimBq+81a0SipAqrUj?=
 =?us-ascii?Q?j052R0zbIdmzScPnoPcG5wN2afqDXcOxcxpk5k+knuKmuNXfypq37oAlyEc4?=
 =?us-ascii?Q?voNdGujAfBvbLr6yesLqRwdRiGNuOyKIjqkiJ+ivkPP06Jiby1ST5UO6X2+C?=
 =?us-ascii?Q?5NiJo4wKvakoXlNk8js72N+CWdSiHsSh1bh4AEBMskDonU5tsQrX/4jF5zHB?=
 =?us-ascii?Q?V98lGwSLy4eUGgdTo0aLK+c5h4YMyxbHgCK9e2EVjadC4l0Qe+CpJVhRWO97?=
 =?us-ascii?Q?zLoS+6xWqF5sa5ZhKjEx6ZAK5ygb/tD8xoJv7A4L+tgrM5lJFbYd/mCe/bOG?=
 =?us-ascii?Q?cge2izHURrqqmt3ojNmWmfrbjKzUb1rEIk7tfr3VxbisEzXCDLvk5BtrjLop?=
 =?us-ascii?Q?XH8SCChFX3P60v6lldnbaKQzWHMlQu/h4aNnNo8RcqW7gT7XtGnBxiCvwevf?=
 =?us-ascii?Q?rfBd9kyPFFRqtBdKQdSFGU50Q8ufGM4r5K3igkYS4OtGebzxdPckqpClyZ91?=
 =?us-ascii?Q?rgMok4iHxBCCNtWY/d8H7uxT9qeUbyxTeeGi/Aims7CJh+H0cD6RigepxiQE?=
 =?us-ascii?Q?irRCAQMdRqXbuTFWmDJdH9sMFq83pqnKeeSFCIuL7ThUmIqxfHW3JmZrdD8Y?=
 =?us-ascii?Q?7zbuVpR4Akke9FKncDeYpGpxVkfv3EE/ZooW212nIqoFmUkM216wwP/KDSMT?=
 =?us-ascii?Q?7B3pudgmeT5GPlyPpzvZ4AZ96loFokEHzaqVoeL4AoozLy7gdOoTxQPeKOAZ?=
 =?us-ascii?Q?TZUyB73lMnysXD003515lJgXP+/bZ6HRTcOmMNE00zvaFPDar+cIXhQLIiC2?=
 =?us-ascii?Q?yL+2ezZAjEQDK+HE8Sy+pi6EKr2JtjRR4n5FDR4aX0jr+FIDfoFi/DRfEbsA?=
 =?us-ascii?Q?6Ed/KCVrcf8vDUUoBuecGpcnZwFS6bJHKkTdokqTnZqJ4x/hB7e39eXrhzGW?=
 =?us-ascii?Q?SIXLA+1zDsPVnUwU1QXTAkRpC+0sSDypEOkhlghgKEgso65luNyBJx1sZkhV?=
 =?us-ascii?Q?V3HbOaTA8XQFf+PtHo7i71PCSvL+DqP0Hu2SefcjikD0qr142yCfjtXgmB3Q?=
 =?us-ascii?Q?C/XZQypueV3KQnsDuAVwoQ+F/EXL6B21FQlksSMfmpdbtQEZZAFg+Y8ZP2kg?=
 =?us-ascii?Q?dJFnIu+NVZDJJuYK6Jw0xfWQ5lm5HTFdRPCve1Fjixn/LBuDvIGB1oWfjPy/?=
 =?us-ascii?Q?ygsE9aGcT1YeH0FCabLdSutkS7N51qAl0atoVAUbaBUnWSpCLT9tvadbXMC/?=
 =?us-ascii?Q?VChIOVrf8Wyej6EvuaLjmV1BjHqhM/OpQ2FAN4d8CHnbJVnQxAg2wKdXL4b0?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e9ece8-2680-4e67-19a8-08dc8affec47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 16:51:36.6773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frzfWem9Sq5CclVb3EI9lz0IYeU2Dm2Ricag2/Qz4D2rmAxT5TMPs/iSMHnpUNFk3YN3nSQWxYDFO1MlMNb5bBb6t7zAaotoEKhnNF9jaOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

On Fri, Jun 07, 2024 at 11:29:43AM -0700, Radhakrishna Sripada wrote:
> This will help debug register read/writes and provides
> a way to trace all the mmio transactions.
> 
> v2: Fix kunit error
> v3: Print devid to help in multi-gpu setup
> v3: rebase and use variable sized variant to display
>     dev name(Gustavo)
> v4: Pass single argument to __asign_str to fix kunit error
> v5: Remove unrelated include xe_tile.h and remove cast in trace
> 
> Reviewd-by: Gustavo Sousa <gustavo.sousa@intel.com>

Fixed the typo here (missing 'e') and series applied to drm-xe-next.
Thanks for the patches and reviews.


Matt

> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c  | 23 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7962eeb9adb7..f92faad4b96d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_macros.h"
>  #include "xe_sriov.h"
> +#include "xe_trace.h"
>  
>  static void tiles_fini(void *arg)
>  {
> @@ -124,16 +125,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u8 val;
>  
> -	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> +
> +	return val;
>  }
>  
>  u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u16 val;
> +
> +	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> -	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +	return val;
>  }
>  
>  void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> @@ -141,6 +150,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> +	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>  	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
> @@ -148,11 +158,16 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 val;
>  
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> -		return xe_gt_sriov_vf_read32(gt, reg);
> +		val = xe_gt_sriov_vf_read32(gt, reg);
> +	else
> +		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +
> +	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> -	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +	return val;
>  }
>  
>  u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 27ba7c416405..09ca1ad057b0 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -346,6 +346,34 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
>  	     TP_ARGS(fence)
>  );
>  
> +TRACE_EVENT(xe_reg_rw,
> +	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
> +
> +	TP_ARGS(gt, write, reg, val, len),
> +
> +	TP_STRUCT__entry(
> +		__string(dev, __dev_name_gt(gt))
> +		__field(u64, val)
> +		__field(u32, reg)
> +		__field(u16, write)
> +		__field(u16, len)
> +		),
> +
> +	TP_fast_assign(
> +		__assign_str(dev);
> +		__entry->val = val;
> +		__entry->reg = reg;
> +		__entry->write = write;
> +		__entry->len = len;
> +		),
> +
> +	TP_printk("dev=%s, %s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
> +		  __get_str(dev), __entry->write ? "write" : "read",
> +		  __entry->reg, __entry->len,
> +		  (u32)(__entry->val & 0xffffffff),
> +		  (u32)(__entry->val >> 32))
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
