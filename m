Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F6C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 21:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7910E4D5;
	Mon,  3 Mar 2025 21:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIGOyqlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D280D10E4D5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741036706; x=1772572706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SfgW4WDIpAKpz6Dy4A5o6qS5fjOI8Z3xS0CvnwIlHfs=;
 b=RIGOyqlKuWjAUqcobn1Z2cAZLk8u7qQ+iWIORwc1ShsbC6pG6g4yyzwW
 aS6UjhLTr5s8LRXkf0FfHjSCrRFJVdFFBd8YfgRAcD80Va7yVWK7cLX0T
 dob0PCOnU50Mv+lCH/f3u0WFkZBS9rbAnxj80NlWc/4MWxBWXuUwmzMPZ
 6JPVJ9tYmsnHOlf2nAlCr2JIwZt9UCAaVYA0UqWFNOCJ6oiu73lwfMLp6
 QZyZLKnmGg8QZux+QshgzPAmlamxktwu8g4kh/kEukMbu+pUT+sAqNSuT
 Vat2mlYKpuhfqtzqYRsdbPgQQZpL3B2swTPjoCcbme7hHy0w+HMx+XjEe g==;
X-CSE-ConnectionGUID: Z4x8LCOHQGOtFWaF/Kpqfw==
X-CSE-MsgGUID: RvdK/2NhTl+0RQ5sL8PVxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52568246"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="52568246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 13:18:25 -0800
X-CSE-ConnectionGUID: YN0hR9x2SDWBUSBFK+qZfQ==
X-CSE-MsgGUID: 6Y48rU3zQx2v5ROENGOthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="123173113"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 13:18:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 13:18:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 13:18:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 13:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiefLsxoQTZPw9NAFHzSqUMGur2l1TrDz2RS8s8Xit0BDLYSckgbkXCiCo5K9YFxEFGn8okYYb/7RZZYKELgsA1T3bZu3sT9v5wmiF9CwaRwS969bW5obOcZcWVoakz05PNLs3wnPS5Nj1NznJa7hc2t30Ymvye58f9jIhabYMaTtXxxMCRQrToUpiY8zMvIu9uH/C+LnDEUNBoVPZ3clMK8o6avDjGLpsSnD9AW6B7ulmQ4xJjzsJlfa6HJsQcH2UQQ3Dc/m5QE2isebYJAIZdJlDWf0sO/1jkFDasp6wUblLnIX2dH7u7LpbdfZKMWrOgQKEMVp3FDGWVGxFBp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGymaRfzcqYq+LvHyHS54HNdqf7ndP6G/C7/8WcjH4E=;
 b=y2ilu06ZISP70BRvRZ4m2mGfx+Aaia76JugkxxeNI6a+MC+UqFWVlvDEJzTQEEUdLKOByuva2gxYv8U+Y+dFnyQuhHuX1VtuyetQkCBXztYOGyh2Y3KjSieatnSwQ90i707L2tNSURSnQVrb6qfZ0TnGxOmxl/VaEpPipu5MYjF9z/VJ5PThnL61J0hHkvhEiSJSEQDbaai9yh9N00LjID8uoRX3zHXDL87S9j0HoRB4+hNZbccTNRiWK117Q5nLLRVmR7fviAzYoOMTGqPckr5bKYbgQTSFWJsQQ+opQrzmz2UyAPADgBEUdrbC68aMyh6EC+UvoWKyTXTt6FBFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 21:18:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 21:18:21 +0000
Date: Mon, 3 Mar 2025 13:18:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe: Add MI_LOAD_REGISTER_REG command definition
Message-ID: <20250303211818.GA3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250303173522.1822-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec35910-f68c-4ba2-8d7d-08dd5a98ecb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?73L8C7BHI29qbyRs/vear6YBGUJ9zk6O6e/aZlSe3ttBAePnfMosjJV5rxha?=
 =?us-ascii?Q?in/tw7CYCNmxi6Jj5TZNpVzM4jJHgK+114vZ1qbmi+ysyvpcOjej2GlBlny1?=
 =?us-ascii?Q?7MVWf/DTTIraygemOMYhXHwaGN/k2Vhw+f6NHlhy3b4TMTC/D6LkN6FVJimH?=
 =?us-ascii?Q?QDtr7Aups+LhuBLHGCMrYoP0/FbMey5gNKJBRrtWFlzDpaia6bIY3T87kqNf?=
 =?us-ascii?Q?3fSnEIBYz7bBw+HIdGbIap1rNWjrb4iLkZigJNcpROFMbaqHgDDTCND97QYc?=
 =?us-ascii?Q?KGSy3ycCaYS33L426R071B+BMGU+LyAn3J17vVNAxZ72GOZs3yaRpNlkuVoq?=
 =?us-ascii?Q?bOBPvs1rZCWw2Y5jPWFh7wXYZ6EWXMgZ7on6eVFD2a39eLyBsn6T3WGSO2aA?=
 =?us-ascii?Q?K8vpXaGxtC//7YsHITAjp167oxj36eMIbpkXqq0gp57rjlAAtW0AUocROuCY?=
 =?us-ascii?Q?8UG6UkRKMLDirwHNga7HLgut1YgUQ3LXr+7ftvpk0CeDAx3lhsX2Nr9FVMqV?=
 =?us-ascii?Q?Hw0lSbSwKJJ93QVaw1m67V9oEqLE8Zyne8fNPVYCkJL6ER+9ZPdRGZY0SMmK?=
 =?us-ascii?Q?GV6ZTll8QhV3dhHFjWqHBLhh0o8nWylr0MGCBB0FAIesLdywETBNLb2xcmWv?=
 =?us-ascii?Q?9wFoRpky3urYGPR//jRXwewnq8WRPSBRNzyCduKiaE8U6AQsRErpsm+aUx0/?=
 =?us-ascii?Q?eFt7sh+BzwJ8HHtNdSo6DzaC0fpnlr8FkwDdGZWC5QBvqjEchPs08ICH9WZ4?=
 =?us-ascii?Q?V47S5rtefW7LVu7POLdaJjeFA3sjxkKp4FV8mSrFesO94O4g2dyIDSY5ruBo?=
 =?us-ascii?Q?acUe31h9x1R7bv0okpn+NBB1ItSPQZSzcK/i3zo/7lPr/vPLeMvxk0A6+Ui8?=
 =?us-ascii?Q?PxBj4vg4jxbDCHTsBTnctgWWNIPm64lkNCAC2Vy1fnRQ7qpg9/DAZ1tRxtxZ?=
 =?us-ascii?Q?jVId+FUMATJLnl9mv9DUO4zhyT3Cj0KPkLgmQvDYZ5hevzOmSXKer9GmJGs0?=
 =?us-ascii?Q?tPDIuPiZkt19LpAh6jSVOAOb/vjB5yJDI7e+wCNWcr582wjKzPVi+lzB/81x?=
 =?us-ascii?Q?pGUTNcA0PAvOMqIUK0rqLzeY/0OFYKteqcABst/T72sxlo1A3hA2t0wzNoge?=
 =?us-ascii?Q?8TgrY/H9rTZlLeAPeVOcB3tFYqbRmXu5VGnKRjd7dOUMiS+EP0NyOH3UXu08?=
 =?us-ascii?Q?s1LwrdEFBDzcT/5ZNgAdABLcXCLgPx9NWIPhjuImiuxcvj+GaHNRviXEVL10?=
 =?us-ascii?Q?NAbRxnfXWALFio6mmlTnkkvlGevW6i71lyZ/lgKfkEnQtRCl9lmMsttOKpjt?=
 =?us-ascii?Q?nqbQo55V8qA0948zJ5ndPo7uvMcvD94gi8FOYpHEP2lnmc7NJZs5pFJ9b4Tm?=
 =?us-ascii?Q?HnR5WoLwLs1ny7ZV3w04i8PaXMvP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqFQYbx3DmwiBObum8sU7Wb3VUvpsdEsQ1kqazLzbBjMYiV1da9cLFRGcPSj?=
 =?us-ascii?Q?I3iTCnqlsdYCbAKYGUb35DklxhX8fWt1dtgvEki5TZlAIqi6bVf9WdXrw65k?=
 =?us-ascii?Q?+IFyLck9n4l6XCMNUh8w3jfpBT5g33WoSpQMuWCGzdklrolT/USFr0Sr6qqn?=
 =?us-ascii?Q?yIPwDbwfkXeTSXlTrhkF71BooZXQ0QH6oq66kupsTvbuKY6zKGB4Xz6Obqcr?=
 =?us-ascii?Q?SYYuAM+lK2Q85kdUyGQwUZS2dr7n6GqyzpJTDUHvBLbOfCSCb0tHiu/YzD7N?=
 =?us-ascii?Q?qSPa7QByNq/glK0EMPZzpW8wwFbafD7PF9tvVYwT6/G2XfXfvVNFGZ+whbLP?=
 =?us-ascii?Q?jOU3gNT5rUXPFP8wjybmomfzOo0a1UJlPnn6b5QQIl907NYsAMW8gumYlvjD?=
 =?us-ascii?Q?/VEari0U01WrAEagtvhU9gTG4pINAcu+nig4u4AhqB5GuamXCBVUeSlTw4Yr?=
 =?us-ascii?Q?nI49ymogHHk4Rcv9AYlM6CsMKPZxjPPg2H+LkJzDLzOXPfU387j928xICiG4?=
 =?us-ascii?Q?JYLtTvHLQV7y6POJeBNp1WSbZQ6XhsHK9dEJeamYpF2U5zmdjXjy6wcqVfeJ?=
 =?us-ascii?Q?7aBeSkG3OvSCNnBRYsO9kuv71Vy9ucdam5uD65bWrwKLeL1rDfaf5zkA0+a/?=
 =?us-ascii?Q?tnx9Vy7U5rXe6TMFo8CzdpcLhcWlqd8DL0b8dXTfuk9lVjgSIf3R/HUghKFu?=
 =?us-ascii?Q?t6mcLngebMD6KK8LMuPx0hckkeMNyCqbFRTQoPKeuwA8bYd+xp+/utv8UmYp?=
 =?us-ascii?Q?fDLtF9HKfjZyyYNY7oF7iwfNbIYVsoctIVktbI2add277tiBSEL/n6bgKN+w?=
 =?us-ascii?Q?ksRN7L5gbDVDAaGuZvga/zqVXQzPaqnKzNkXgg2ZypLHZFqz1s1+runO61ej?=
 =?us-ascii?Q?nzmKVv7kV0X42vd2VKLxvjQkmMcAVB4cXiZPyiSIPiy/aPTHJ6u+o66uhcq4?=
 =?us-ascii?Q?+T2ymrn6ceu2N5KaKyMtX9VCqhGQNGx+tEs2+HLpwKAQQyp0QDojaoGhJioH?=
 =?us-ascii?Q?ukBuqxAS7J4vqpkFcnv3FiVKLXAL5K32mbpVx53DR+wr/qrZixbCF5yEfvdm?=
 =?us-ascii?Q?GF3XlkGhiR95qQr0hNYb7U3wL7dV6jVgxSc0LGa8e6UvlQOEl2g2jI2gC6gm?=
 =?us-ascii?Q?q2I6nu9dc1MtOrEVqeDmw5IN41kfw6lz1BspXsFgYSm+T2J0QyRhmKWSKs+r?=
 =?us-ascii?Q?Xpl8ZW2uWeA6v1+XGuC4fIYOKYYIG64Pee9h0KuLjR4zeBCEyOREIUkL2Esd?=
 =?us-ascii?Q?oYdpxiR3xd9OuMnZfV7zEm6e1nWxUccjPdYCDOvQiVHJzpXGkbFGJBT6+brK?=
 =?us-ascii?Q?Rtc4uKXxZJjAh86WXLmRC+G6+vK6AdWNcygv0SQb4ffgROsKq4wL/6SSulwl?=
 =?us-ascii?Q?MWrzL70CrA2EYnenOGtCRx2oybfNkzJePDmQL2VLK68R1HRfvXFMwOyZo5hT?=
 =?us-ascii?Q?kTnQCP3CZCU5iNCB6nSP5eI0osWFcuI0ISa8S6ZERksV7VnKPr5Re/YYnCq6?=
 =?us-ascii?Q?mW87HhNRiKKisTzMAi1bh35ydju5dQ0pXMbWgU+0T++yYNp+ZH/IpUWefMp2?=
 =?us-ascii?Q?KGz57PI7ixMd90q1BaAzSWRrC7tdl55aiXu5kbrc7W/H0ZxT5NR3seL+U93b?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec35910-f68c-4ba2-8d7d-08dd5a98ecb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 21:18:21.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L49dEu7eFhfRk2vj7qvUfxeZyJ3Y1FHkYdfrZJ2B+5Jl0jlzWEkLYaCSizEcI4QIcrcAXVIXB70Y3NuIch/KRm3gzSrSU3T0KympqJRRG4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

On Mon, Mar 03, 2025 at 06:35:18PM +0100, Michal Wajdeczko wrote:
> The MI_LOAD_REGISTER_REG command reads value from a source register
> location and writes that value to a destination register location.
> 
> Bspec: 45730, 60233
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 167fb0f742de..526bad9d4bac 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -61,6 +61,10 @@
>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>  
> +#define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> +#define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
> +#define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> +
>  #define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | XE_INSTR_NUM_DW(5))
>  #define   MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
>  #define   MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
> -- 
> 2.47.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
