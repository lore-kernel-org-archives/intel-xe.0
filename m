Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F23CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 23:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF6710F0D9;
	Wed, 13 May 2026 23:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+h7SgQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A310F0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 23:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778715283; x=1810251283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OJiEbSCczdsMv40ULYwprPqxhf0StEjnWPUw7RaxZsc=;
 b=b+h7SgQLefvnswVED0xR06kev6291Wg509bU+2pROj2sGGctohkLRTBS
 L6+X0aYYYVhsvpV6oM54ZAV6sC/BCKBWeSlQsbVEvH27e8A2IHTYZWAEW
 fcLQpsELIg4eqJuwtSbtYgJtBhxQvlpbRoN5+NJqNDi6b+m6+ZSTwmMXS
 /GebgrC5AskHOfeJryy2qx1mm4QohAp/7f6mqWbgUnf++r+L+uWBDD6hU
 g6SVueqmj79FK5UjuLN27gN9ZjCSB3aiV9jOio3FR30Q5XBzZSIcap9Wi
 uoVd3eu82wz+R7nfAMTwmhE3eSNd3xX0Lg3miI0d3DGygjUXge9pjgjXL g==;
X-CSE-ConnectionGUID: PM0BGdZwTMmm6ACbaA9vGQ==
X-CSE-MsgGUID: 7JmtC2rESZ6Yf/LrJMQE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79684423"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79684423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:34:42 -0700
X-CSE-ConnectionGUID: SMOkGg/4SrSTsiVrrKBRLg==
X-CSE-MsgGUID: YpJEfsFbSWeCURxVhl1YBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="243184959"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:34:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:34:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 16:34:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:34:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCO9xhYDeRuFifIVfj9ldTvurgCXtkrCKWRpSdaLCh8CNQVJ3RIZKdSaD5wNtr3GIyoM+wA6ifSUYDIhg+i91VS7SixW8oZ6c+cWgKyfYwT7UFk15VqfhhiQZLXlRQi5jpRgTB/74UTrFL9iMnyLUK8i61TcRPvDDlntpU67tBJTaHb2oqpni+F/0FkLD7wTPGkSb/5Cy+hulWjVcCKUwzhPJuNtP4S6JYaqNBqTshWaRFqJe6kUG4AB03/hBSnqBhFcr9RamLG4DmDlhAs0fM9FJrMTkoO5hlQ638jTDFc4ZqnWvSKaCgJdVZec21zvOyRM2eQavgbQMI+Mh3vAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ENE8Qsm2Ehl2Qf8qgwLYL/s+fEc+o//gRHyA0wgnq8=;
 b=CYJLXJt2BMZ5btw2VFE4y5fcVCLOpdGz5Ay7hD1o79UFyjy8PNCmy6uv21B9sJY+RQfVBdgR4znYQyptVoiUrvxdh3BPXFW5S/Gt8i3T2zMCj3a2IYV26XJ9UA1Wlf+jWpM3hfVmSfxHLGFkrdsd+k6sE72G2lq5bB4yD6bLIpjPXnUpo8UmMd3J4txnUdjvkoHtO3+DPxe+TOul3pP4Dd6ckz7+zFkMixHDBVmkvmsRmk+S7OsboLWc5XZfmjCL1tohaM60cxUIAY+caCHPhEI8A7r3e5j/7ehjZyvcKskjqpSG7wPr6o8yNXgPC2EjXMaGP4HSTlcRzsn0jeyNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:34:37 +0000
Date: Wed, 13 May 2026 16:34:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Implement a structured parser for
 rule matching
Message-ID: <20260513233435.GH2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ea3e8f-1c31-4709-769d-08deb148325e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: d01zw1c2hIlnMcH1ekZ98MkK/z5kl6/z46Hu6+ij4bePQ0xD0iMx8XoHC8V6ONUG0Aq9ioNi8B9DAiFEz0UDL8PX+BR1aZG/UkzcTMRR5dMblTGg8teqJxf8PiqBx+e7mFDFK3XRZESwOC7VPj2j7p3YczedM96gcWLcH9PDuE6JxiLobY+jEmk5ZCbrqlhXQrnIK1PQ5TEsskt3o1a0oJsjlkWV62lnjFEu08f3f9Mc+4KuqnlXddIwPdDIr6zy1/W/Gpt+8nDHpHtg4YOxGqFnZAnlcMZGjqEcoorePXiZv+4wzufhbbi4NivxZGglQAUrzzStXG10ppCiFyVzbbSyjIZYkBe+u4l602pXkGzgvkWDuPZ3djJSAOsVl+G3YSf6xToM8l63FxNu2noOelL2xtMwo2+L1ElaD7EsWMReKku1Dq2nUfPO5+70ZdBramaMSWyCNVpAcN/EFM/Wxcxcn9bHfljr+ylcNdcUbragGSNZg8bVIs7WW4javIykdKnZIYbJhIL40/zsstSJ0u1CqahYGGElN/354SbBuKlrdP+HupvsB/TEdVB2rblqnLUjnGVPmE+eU5UAdJ/HPV8GilG2qlp4sMiuzGWhsD4RJmClA9t+bQZxETQGC5wNSxds9vy5V91FQk5Dm/y+Hzxb1IlIwEz0sCdUbcxckfhTmHgJE22etBLhGWATdoba
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0SGObjMoJSzhNTylANURdjgzYMoMj/ugEnj2DJ/9OCF1ROdo8vdO60/ny1V6?=
 =?us-ascii?Q?Z/R11BcztSoLI9lelerAVVNmvXeARlHty1MUXR2bL9StSDZx50utGkOBe0Qx?=
 =?us-ascii?Q?ee81jxLdO90XozmJLkqqtf+RLJ3jpcd4P4ZNsv3cdFm1FddJJB/D13DS9G3W?=
 =?us-ascii?Q?wd2SXaYXO5YSXVhigXovE+jvJ1ImYAe23b8FdE4KuQQo1Y/w+hASbTDPgcDq?=
 =?us-ascii?Q?zTQyahk1r/M2iYAEGRjFaaGxM4PkD+N3cEjzN/OElJHP0MtCSNmJvWWqMIyO?=
 =?us-ascii?Q?tgL0O/a9Cd0bD/1j+QSI4gSNtIQSJkWBZG7dQ3zTnEio+dccdRSlN5x/1tTu?=
 =?us-ascii?Q?us1I9DkwSZnAG2zrRR6poFdsQ03nVNGocgQFuFLD0u2L6qLGeD2zzOdA4ha3?=
 =?us-ascii?Q?kmW8Kw8HqSOuT9uuzee+e2FgknZfhLzynGIE1VEqYTIGnqZ8/Sz+FDI8cK6H?=
 =?us-ascii?Q?0UIBsn6rirSG7vGZpFfhC7O70VBurGTKF1T/QRPOo3Jdmt7mCJej7vvvpE3g?=
 =?us-ascii?Q?lJZuPhzKDE5f3Tn6hsmQk/t6eqgqj0mj5YzjpoY6zBVDUn7H6VceyD4j5JRz?=
 =?us-ascii?Q?VMOdz+9IrXagIpUhJnO0KdsR/Ps7K8CgW1uLXjcx2bKXfgGz2fUKbloQzfd2?=
 =?us-ascii?Q?p/8Gq/wCJOAyL+29FPwZgsPNnT3Kpq3HnmrXegNXoL2wjgNZEj0fKUX3mlOx?=
 =?us-ascii?Q?BhM1YslYiO7Gt/xCp9H+iJGPVXBOb9cnYMK105jHTbchxwBxl2yZ9C4xD9mX?=
 =?us-ascii?Q?+i/4kizvGRrWzoBqaerGD7MySXt15bzr/GZbFiR7JRsB7wVdsuN1BGncCqQb?=
 =?us-ascii?Q?Sn/gUNlqADuG44o5IJJ18gUULtO+YM6tXShiO5OO8n5f1Dc7pKrRHHbtjQwT?=
 =?us-ascii?Q?G04rL+n2voJmeiEENHfKFV/XwA0ZABITfSwvTgIGYzmskOM4D63yZXhvCM7n?=
 =?us-ascii?Q?QZnlhwKbYWLe6br0WHkc0HVhhCY6nUabMkUupBVAcyCCgCS5/R/m670Y6djJ?=
 =?us-ascii?Q?7ZlsX/BonRkz9gBcCh1f8xG/YmWVxXlB/jk1cRn7rgJg+dmK7SThm9dZov1V?=
 =?us-ascii?Q?BjWiWv6Cx83ROZHnc2ITls4lfwgg4FyXOBI7scQ9Ny3WTTgoWyei/w/f3F0p?=
 =?us-ascii?Q?1czhaIqB9sBBE3Sb0UrGRGOCNxVNvXN1h942iuE/WPB1EtP8dHoOet6DU6Ey?=
 =?us-ascii?Q?rAbfDrFOEZJEobdJr5pRMxIfJSaFy6NW/UmEYT1ejPQZH/UAPuuRo22qO3o3?=
 =?us-ascii?Q?mYuZey0yUGBJywM76jLwvGeZYp0OdxuVwqynUloaHANUHWq9MTq4JcUrQl/3?=
 =?us-ascii?Q?lBmOb/yPf3q9Lyz10snxnzHR3XxqY+5ckN4FJ35PNXYZOXSOIKl5DorI0F+y?=
 =?us-ascii?Q?r99MwxBiqp6Yq7SKS++L4AFPe8CtrgAF5HxQMEeOtU7eIDi0AmT9yom26QQm?=
 =?us-ascii?Q?lasmSRcWK58O8PD8tWxjGQhkZDIMkpXY34zMW31J39O6j+hlHjHY0SIdvW4G?=
 =?us-ascii?Q?ejsgnkXArLfWVNtLCaoLBKDy/8EsRJcEqU2zfyosjimWz+th+qbEL/nQtafP?=
 =?us-ascii?Q?MSPIp1rs4eBuMULZSawDvDDtjmP93anhN5VaC6qjsUo3UIqau5oQrXQjBFxI?=
 =?us-ascii?Q?REix+z+zJN0Req7koIRVjN+rYNE38SV554n7iBsl5anv7hpJp4BL8wZEiGsj?=
 =?us-ascii?Q?EyoY5oJg7MfWOWGAQjW4B3mUx8+7Ceqaf05bmbkDa15tmTIRp3Lyt51Tjt+F?=
 =?us-ascii?Q?vLhIq9D4Z8EESZmdTOCY36yA2xQuu+s=3D?=
X-Exchange-RoutingPolicyChecked: gctmsm3IP2KUHP/Wo4jwu2dFl8lciMWtgCjB2MLYBqRg096nBeaBlHv2Jtl7zq6itWINa6zuTDsoRGbLpDCoZq5VC2pOUVvRCtxrN5Aw5UFOyOYZ0tE9TNgDfAcDl0JYuVdBe+MeBX5DSugcBjB5pCuZkXEDMuuywKsV1OK2H4nDvh6O5QFWsH7VoPNaP5WOztCQ4duHLaTfzmgM917P8CK93RMMu8ymyqKlWKxQkukaxGPUpvVumNy0ZTRVBsL2ZKSweJ9JnBx2zM9AjHo+cRQCBAOzLBd2nFNPLwXEwSSXJ+UWvqy3p5/U0Iliitf3B5f6l2L0wOwfsHENwTfvAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ea3e8f-1c31-4709-769d-08deb148325e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:37.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtRyFvN2CQSWO7nJkTM8t5wvXQ1B9YRsgsHcBiYWd2Ltiq1RR0xRTufqgHVdPBebYR6o4uJmkpHGBGga1qnl5IRmQ2aiBtlq6zRZQbgh0a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
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

On Thu, Apr 30, 2026 at 05:20:08PM -0300, Gustavo Sousa wrote:
> The current unwritten grammar for RTP rules is as follows:
> 
>           rules = disjunction;
>     disjunction = conjunction { "OR" conjunction };
>     conjunction = single_rule { single_rule }
>                               /* AND operator is implicit */;
>     single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
>                      FUNC(...), etc ?;

We should probably add this grammar BNF to the DOC: section at the top
of the file too.  Then it won't be "unwritten" anymore.  :-)

> 
> While rule_matches() currently works for the grammar above, it doesn't
> easily resemble it.  Let's replace it with an implementation that is
> structured in a way to resemble the grammar.
> 
> Such a new implementation, although a bit more verbose, is arguably
> easier to reason about and to adapt to any extension we do to the
> grammer in the future.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Aside adding the kerneldoc, this looks good to me.  It will definitely
make it easier to define and implement additions to the grammar in the
future, if necessary.


Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
>  1 file changed, 88 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 976a2e1f5592..dec9d94e6fb0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -30,11 +30,28 @@ static bool has_samedia(const struct xe_device *xe)
>  	return xe->info.media_verx100 >= 1300;
>  }
>  
> -static bool rule_match_item(const struct xe_device *xe,
> -			    struct xe_gt *gt,
> -			    struct xe_hw_engine *hwe,
> -			    const struct xe_rtp_rule *r)
> +struct rule_match_ctx {
> +	const struct xe_device *xe;
> +	struct xe_gt *gt;
> +	struct xe_hw_engine *hwe;
> +	const struct xe_rtp_rule *rules;
> +	const unsigned int n_rules;
> +	unsigned int head;
> +	int err;
> +};
> +
> +static bool rule_is_item(const struct xe_rtp_rule *r)
> +{
> +	return r->match_type != XE_RTP_MATCH_OR;
> +}
> +
> +static bool rule_match_item(struct rule_match_ctx *match_ctx)
>  {
> +	const struct xe_device *xe = match_ctx->xe;
> +	struct xe_gt *gt = match_ctx->gt;
> +	struct xe_hw_engine *hwe = match_ctx->hwe;
> +	const struct xe_rtp_rule *r = &match_ctx->rules[match_ctx->head];
> +
>  	switch (r->match_type) {
>  	case XE_RTP_MATCH_PLATFORM:
>  		return xe->info.platform == r->platform;
> @@ -120,6 +137,63 @@ static bool rule_match_item(const struct xe_device *xe,
>  	}
>  }
>  
> +/*
> + * Match a conjunctive set of rules (rules joined by an implicit "AND").
> + *
> + * Once one item evaluates to false, the remaining items are not evaluated
> + * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
> + * errors.
> + */
> +static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
> +{
> +	bool match = true;
> +	unsigned int count = 0;
> +
> +	while (match_ctx->head < match_ctx->n_rules &&
> +	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
> +		if (!parse_only)
> +			match = rule_match_item(match_ctx);
> +
> +		if (!match)
> +			parse_only = true;
> +
> +		match_ctx->head++;
> +		count++;
> +	}
> +
> +	if (drm_WARN_ON(&match_ctx->xe->drm, !count)) {
> +		match_ctx->err = -EINVAL;
> +
> +		if (!parse_only)
> +			match = false;
> +	}
> +
> +	return match;
> +}
> +
> +/*
> + * Match a disjunctive set of rules (subset of rules joined by
> + * "XE_RTP_MATCH_OR").
> + *
> + * Once one subset evaluates to true, the remaining items are not evaluated
> + * anymore. Nevetheless, all rules are consumed to allow detecting syntax
> + * errors.
> + */
> +static bool rule_match_or(struct rule_match_ctx *match_ctx)
> +{
> +	bool match = rule_match_and(match_ctx, false);
> +
> +	while (match_ctx->head < match_ctx->n_rules &&
> +	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
> +		/* Consume XE_RTP_MATCH_OR. */
> +		match_ctx->head++;
> +
> +		match = rule_match_and(match_ctx, match);
> +	}
> +
> +	return match;
> +}
> +
>  static bool rule_matches_with_err(const struct xe_device *xe,
>  				  struct xe_gt *gt,
>  				  struct xe_hw_engine *hwe,
> @@ -127,55 +201,19 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  				  unsigned int n_rules,
>  				  int *err)
>  {
> -	const struct xe_rtp_rule *r;
> -	unsigned int i, rcount = 0;
> -	bool short_circuit_or = false;
> +	struct rule_match_ctx match_ctx = {
> +		.xe = xe,
> +		.gt = gt,
> +		.hwe = hwe,
> +		.rules = rules,
> +		.n_rules = n_rules,
> +	};
> +	bool match = rule_match_or(&match_ctx);
>  
>  	if (err)
> -		*err = 0;
> -
> -	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> -		if (r->match_type == XE_RTP_MATCH_OR) {
> -			if (drm_WARN_ON(&xe->drm, !rcount)) {
> -				if (err)
> -					*err = -EINVAL;
> -				continue;
> -			}
> -
> -			/*
> -			 * This is only reached if a complete conjunction of
> -			 * rules passed, in which case we short-circuit rule
> -			 * evaluation, but still keep parsing to find any syntax
> -			 * errors.
> -			 */
> -			short_circuit_or = true;
> -			rcount = 0;
> -			continue;
> -		}
> -
> -		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
> -			rcount++;
> -		} else {
> -			/*
> -			 * Advance rules until we find XE_RTP_MATCH_OR to check
> -			 * if there's another set of conditions to check
> -			 */
> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
> -				;
> -
> -			if (i >= n_rules)
> -				return false;
> -
> -			rcount = 0;
> -		}
> -	}
> -
> -	if (drm_WARN_ON(&xe->drm, !rcount)) {
> -		if (err)
> -			*err = -EINVAL;
> -	}
> +		*err = match_ctx.err;
>  
> -	return short_circuit_or || rcount;
> +	return match;
>  }
>  
>  static bool rule_matches(const struct xe_device *xe,
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
