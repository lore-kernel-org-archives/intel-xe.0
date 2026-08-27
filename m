Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790AC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1C10E3F5;
	Thu, 27 Aug 2026 12:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFvE7cBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FEA10E3F5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787833722; x=1819369722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Z4QzHBsbfVF6Y08rZ6DApD6oCaBho5xIC9JkNgwxyQ=;
 b=mFvE7cBn8PNJ5EkRBGWYRvl2uxlMe02eNsJJnxSTt22yHJZYx9YrgSNM
 GHSPWPLjdP8QyCu9UnZxBL4iJNHtLlQEAGJN2GKIJy1BMywhx5rRoxa04
 rEJWwdnnCE9PcOK5AvSxLT02v2x+zMxK20dlNLP88t9aCk9eh9NTgUQ7k
 04cmEDDEHvcagdI0zVeC5sJXwLeTPlGsJOpWJXaREXjReWyVP4AKkeoJn
 N+LT1+GjwwZmAl+qHyenr4rzTQqormSgVs43CwrNMcd6WU7ne1IP2YNst
 Vb73J6AdOKNyqIFlZqfWkHR+LIxPh3yD3uRkhy33QQgS4JXoKO6AiLfnj w==;
X-CSE-ConnectionGUID: d23scRsISfyOfxmiQbASMA==
X-CSE-MsgGUID: VTVfBgzXRLSkzJxaFzQ1ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98928755"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98928755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:28:41 -0700
X-CSE-ConnectionGUID: A0RE25edRmu2muluCv6LWg==
X-CSE-MsgGUID: 9Ry83cgOQFap4fpwT5QD6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="261733045"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:28:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:28:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 05:28:41 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xgv4lN42tQG+WFDZbZ9nblxKQ/XpMnDxaNP5OUX+1oSfZRvykZByn6J+Wk9YW3msJEdEAqyaZWze4b1fA1YxWZaytIfFUJXyM5Ylz1gef7yVp/xMBkkvrcAzh4Y4jkvlzh+iOnxFKDumGWHOLy489ynrZCO/15Dd6HjrScErKdh2mdRm2ASelipY5AfJ+PQK9lk0CcA2SjXD/evAqd+gSNyRSY5Muwo8348LE9EYSIqCrc8Ei0STXqoY1b8iNOO44MzbI45p1B1hd8HxPFsTndFZ/zbZRe02B0qQ/+B78CrMJPYijORrhqkgnbLrYePklbhCxomH+I3jZ9RHKeLS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfdxym3ew3s8x1M7mWDo9qfLFbONE8on0XAK45P/O0Y=;
 b=C2tvant0a2Fa2YD2L1tbSU6pdyjs0JGm+WHqeY3/s9TqskRvbqSSJC5f4yeXHjJmlJZTvGVbHKChaLRoTvnpbLiJiJ+CGyK7rWsJ99VigWjeiLjMDFkCrVqBnvodM5nHbte+e1HTvGQCzr8ObSCjjNYuM96kvfl3rdtHWePy2iIoxn+xYCMHAR4FYVUr/HPb3QHdP15hOTudLesLLLtwYWH0dmlbovYLuawQAZqBzkqONNDPUii8SwJejNDEa6lTn+4oslaP6T4H5mkVrJ1ytl9li8pabshdTLrkIXHkXTEFez0R1PGcdclEnlGzreEs2LmvXcabTQJFEfpD6au6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS4PPFD24E991EC.namprd11.prod.outlook.com (2603:10b6:f:fc02::52)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 12:28:38 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 12:28:38 +0000
Date: Thu, 27 Aug 2026 08:28:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
Message-ID: <apAtcSNzTKnNGU9q@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com>
 <ao9T2POk0wXbGf4L@intel.com>
 <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS4PPFD24E991EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e86c37-c5dc-4845-6200-08df0436b87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5bjxqnzPciWDM7EyrPZCahieBiobVv7z/mLvQVW0Bn2hIbhRrgo4EXjw/v6w6QIQqz88y81SGGTRU7DgsJwUerFAlMkloLU+vdxSGiY1aPKkVkmnqJJUu1i7QYhhhAZ938pcbWZDMEcJguferdOKqmyLDSTIanwq9Tlfxh8bFp13gANwKpcDKT4eZslade2ok/wSi8SX25Wuwhnoe4o87fOGyeuemQoKviynFjkAlt5ERIqEavy0UgJjCNB+xGjdnqd/+VQRwR41WXkd/OxkDF00a2zesY9mkIipCopJlO4NEe6cl7yPJHjZVgGJqiZ+fQx8/pxZ2B3t6KvEvD8aWRBV8wl5hTkztQLfqZhuYvcjpDFpgmOQGZv1omYMurKhSiWzjRE3EU721D7DVGRmcHV00BXGV7dfC5qoqGkpHAdKSP5FX19rq+4uxGXRynGdf4BzMarzxPD9WaygmdCAckWAd6d/IoqRz4ysSXdD5UI2Wm2TTPgwQV5VoDiDVg94awVi7KFYbGupmTo0rxFEggbffgCThqs5CzvFPg8rQmzKPWmFu3FaXft2+DvGtCgzMji8Vsx+GC5FVDm3Oq+iyDma7gO1d4KidDGBCqj4fr6HIc1Gcda1R08hsVmjfZl7rzrGpEDHoqDHmG7fJC2/Oz29qVOIHgeOK48DxdfC4ck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/OuCQ/E3P9d7vNm02a9K5fC3+p38VEBtg72WI+v8qOo0XgVAtn49mEafgdcu?=
 =?us-ascii?Q?YNDjkDd9oEHN25wRmOGoKuuIgS0WYYUx7cG7/P9OfpEsAOGAPSHitiH7dqyz?=
 =?us-ascii?Q?U95dqkY/kYt7gkspsRUbyem5PyUjfM5ZVXx9Im2oSdHOohoI/SpzvqiG4fQS?=
 =?us-ascii?Q?J4GUU/ienxmbG1J3Odtbada0lkTcbKrO8Mu21L6mG92jGAZw+AQXiwR85nY8?=
 =?us-ascii?Q?x69zEu0t+YZkiynKRBjHwuw5SdTQl19vNyYz9JnNOO0jRmvZmtSGH3v5CcXu?=
 =?us-ascii?Q?qOwCZ7lU2e7Tk/wUMHS1WnmoFH036RdjfxYvnDZJ0Akcp4OlS8W6C8mYWApR?=
 =?us-ascii?Q?5XJ0qTot0HY2vta8aB2Pk2SZcpJ5sQ9UkbQffZAxPJKTAbz4t3yJq5+i52c0?=
 =?us-ascii?Q?J0nRaQFeBq0TYbglq8mohk0gBuTbrUfOva1UFVflsnSO7RyGVdMFsCOrWEZ5?=
 =?us-ascii?Q?ebMo0z230LZJu9co8DyiPBebNa6MM9DBINSldqnrctP79akPGCT8Kaw7ccdu?=
 =?us-ascii?Q?qEVzXEkkYjNSyauExlXsGIYLnosXiFPmS7OiIIAFaPJjGeSiQDdv6STsLWCN?=
 =?us-ascii?Q?JyoVU9tMl8xMwrNS+9A8wAqZ9zz61QvOz4xtqWfPiWLh5m+HpqJ6ebWEXTze?=
 =?us-ascii?Q?fiSR4PS7rtSoUj+3XyjMoFfwAtchtfrUx1KaZ+GIPhYe1Rf6b+YxpQc8ZjY7?=
 =?us-ascii?Q?GcvYL+2ZAYM5GyG5Ujm+tchHQprrHQVPh52wjyBfAXgTxupWYGoLg81EPq4X?=
 =?us-ascii?Q?pm1QgCHF+kVS7Fq3ZPItnMgo5UuYQV5b6cLZAa0RmY73Ph5BsBcVFMVJReJX?=
 =?us-ascii?Q?PtvwFosAr3XP1nLJRtSw7rKSmccCNw3LcbEPk/60JB3wRvehXSb24/FXeVzO?=
 =?us-ascii?Q?6qxy5jU8GZGuBIYQlCjYoZv78p6I/wPHZMOyRNk8o6UGAbtGAK7S6TePoDLC?=
 =?us-ascii?Q?Sb5qZULFPSfHl9PlffKh5LgFF1K3wmfpANgN4gGvkepSDPEIeJcf88efJW/y?=
 =?us-ascii?Q?k7Tjrn/C98ye6hqJ2i61FY0nhsfuupJR2wC/4geZy5vT5E3P/+USjncDfl82?=
 =?us-ascii?Q?J0K7Xll3ee7gW4gDbHx3yhxhezoWtMH3D32r+GEdto2XC4x2jyMro/Qulwvz?=
 =?us-ascii?Q?jV9BU7EG5SgSVZtohMNtAEmeVpWvwORzxgtreKXXridXJifrix1cdIJmDJJ2?=
 =?us-ascii?Q?dWyYMym4rOEnBDJXkP9Gjz+sgcRSQNKW+yyN7Tf87npkYKfN+ZAO6Zwbt8hU?=
 =?us-ascii?Q?gIzE+JAiQ0090a3unw6CyfQFIFRtUzn7nsp3nMQGd/chH04ZkT1+PstyMMyV?=
 =?us-ascii?Q?ndaF3hRLC+qF4XOSleFGTPo+X5ac38sT3sb8bLaW8t9crLLfgMA2B0LhXD+s?=
 =?us-ascii?Q?Cd0GxcH0jjcx3AHuObP2TJXaE/7a3I/HLWXK+N0EX4qHNhOG/NywKimCBi8C?=
 =?us-ascii?Q?oJy8gHZ9GD7edIfRC8iPkfmK6crVkEPxgydKmBimqkQNnqk1AZReezplyLZ4?=
 =?us-ascii?Q?vYEBwFZN9wC27//pqERZ0FWLzXLgvwp69miaAGGsgJdsrAkCbm2Ir33rmN6V?=
 =?us-ascii?Q?RQsAC+1qeERh9pTRQpWhgkgrIn6VpAjtezhQM/8IA9ZMqu2w5fz8Wo01E/dn?=
 =?us-ascii?Q?MwP7ltm+E/VtO2eEKS4qvfrXrqK8O1CHJBaUpWa/kiL2Cjyg6oUEZjADDOLO?=
 =?us-ascii?Q?g1lwJen6/dH91N7dEb3Pf+g6c1MTkqPNhbd17IgZG+q/7gV7vBC4nB3Mczfd?=
 =?us-ascii?Q?1hQCunsVeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KzxsIIzg47KLnrAiGHxKENxsoKb3fo/kTSlvNpUN+XZLjRVFMZHjSjJMYss996sQ9il+6EEeIV2w3z3ZKicK/dCigyCENXcaXwQY3ZFqGSW33B7wbDkOyARnVf6SVualGg4Rx77vIP6bSujxv/MuT+1EzKSgOPsfR2RZE8eKfhXEEUuprgMnByxFD95LXYcYvZOSUSYD+JY5Z8gHMcgN8kC0uXDZVoHifTLqTQ8ySTLNg4vbjHP5597/kVuBCSQkezos8nKfqMxfNq6uaEC5hjAt0Cs+b8UYcdRrUUfiF7ACWowKze3AIDsV+IThpuCVPWylEnpMrRbby7NVQT7XPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e86c37-c5dc-4845-6200-08df0436b87a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:28:38.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRl+DLHKVFEDth3aRXyvXnBlUfPpFtItNILUI9MeHbgyC6YNDi2koYBkERPH7nulmaMsR0/IL2imx0yxlOEXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD24E991EC
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

On Thu, Aug 27, 2026 at 04:25:48PM +0530, Aravind Iddamsetty wrote:
> 
> On 27-08-2026 02:30, Rodrigo Vivi wrote:
> > On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
> >> On 25-08-2026 19:41, Riana Tauro wrote:
> >>> SAF MHB errors are collected and classifed under Fabric error component
> >>> by System controller. For SAF_MHB errors, if the cause is data
> >>> payload parity error then log and return.
> >>>
> >>> For all other errors and causes, request a Secondary Bus Reset (SBR)
> >>>
> >>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
> >>>   drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
> >>>   2 files changed, 24 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> >>> index d25d25f77531..586dc28a638a 100644
> >>> --- a/drivers/gpu/drm/xe/xe_ras.c
> >>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> >>> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
> >>>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> >>>   }
> >>> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> >>> +{
> >>> +	struct xe_ras_error_product *product = &arr->counter.product;
> >>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> >>> +
> >>> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> >>> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> >>> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> >>> +					"SAF MHB error detected\n");
> >>> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> >>> +	}
> >>> +
> >>> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> >>> +			  "Other errors detected\n");
> >> I think this also should go under recoverable.
> > The point is that at this moment in time we don't know if the reset will
> > indeed be able to recover the device.
> 
> I do not think it is right to say that, for any error we sure for know
> what is the recovery needed. The respective error handler shall perform
> that needed recovery action and anything that is recoverable by a driver
> action is to be categorized under RECOVERABLE CPER severity.
> 
> The case where driver can't recover the device by itself falls into
> FATAL case. Eg: probe failure or wedged cases.

Fair enough. Riana, could you please adjust both patches?
And while at it, please add a note about this in the documentation.

Thanks,
Rodrigo.

> 
> Thanks,
> Aravind.
> > It is a moment where we are handling a global uncorrectable (fatal) error
> > and we will return the reset action in a hope that the PCI subsystem will
> > be able to perform an SBR to save the day and we start everything clean
> > after that.
> >
> > So, I believe this approach is correct here.
> >
> > Aravind, thoughts?
> >
> >> Thanks,
> >> Badal
> >>
> >>> +	return XE_RAS_RECOVERY_ACTION_RESET;
> >>> +}
> >>> +
> >>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> >>>   				      struct xe_sysctrl_event_response *response)
> >>>   {
> >>> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> >>>   			case XE_RAS_COMP_DEVICE_MEMORY:
> >>>   				action = handle_device_memory_errors(xe, arr);
> >>>   				break;
> >>> +			case XE_RAS_COMP_FABRIC:
> >>> +				action = handle_fabric_errors(xe, arr);
> >>> +				break;
> >>>   			default:
> >>>   				/* For any other component, reset */
> >>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> >>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> >>> index 99b2466e2062..73517fd0d415 100644
> >>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> >>> @@ -12,6 +12,10 @@
> >>>   #define XE_RAS_NUM_ERROR_ARR			3
> >>>   /* Error bits in IEH global error status register */
> >>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> >>> +/* Bits 16-31 represent individual SAF MHB unit */
> >>> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> > Riana, please share where I can check to help reviewing these bits.
> >
> > Thanks,
> > Rodrigo.
> >
> >>> +/* Fabric Data payload parity errors */
> >>> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
> >>>   /* Device memory error categories */
> >>>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
> >>>   #define XE_RAS_MEMORY_POISON			BIT(2)
