Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B35C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 17:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2D10E087;
	Fri, 19 May 2023 17:28:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3846610E087
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684517298; x=1716053298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g1pFbWUZW9xsHENi30Ok7qAMcJVhB6zTfLCLB6jRSCE=;
 b=IQftFhBBMsv3U4/5EwKi9OlKS5KnMyWYd8IyG9OIA83NHWOSrxdE9c+x
 AcCq5lhOosqmaDSohlAO8r+m8hxd2XWYU4t9C0/9e8Za9AAiZDLLVVnoR
 Vx6VGwlWvd+yjMEj0RLdRCmRVOquiiRV6fy6j1eUJRXY78wBKEtcV0iMI
 u3MfmQ1ulw4aMToObzxTZ3LbNnfSICKrJGEl2/jufgyV0p/mCMUxNM1tw
 UFBlxTNuPmfV6dCMin2YFfYFYXwL40bRkbviFkhl7FhgFwZ7Ja5LtYvy9
 H4NYmNEsqd77cdHtdQQN0dq5mtMCWqKiI7nBc9yG+vjKyq0DzLw5elb55 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="380648916"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="380648916"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 10:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="826843843"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="826843843"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 19 May 2023 10:28:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 10:28:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 10:28:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 10:28:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 10:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcrg7aGGtssG7cPg41V3uv1h8bQnPLYh6MJJSa1KJ3n6n8Ezvj7Ol8yCcwcaNG+OfA6Yy9YA1Oa7moO8s8f43owFKw07zs/qGoasX+kmMVMwmwocCTW2UtWARwvbLvqthZuHBH8xM2WvHlj4Sn11lKIo5Oo2I7w5Xqb7G/kPh+UQYHll0ojVWu4UCtO+1C8ZArkDvCsauqeHFaj9bVzzB+AOF+/m//bH3uAth5U79Ky6locY14bgV4wfFDSW9wR5b6REQVoutXN+DGtptlvfHsmnPxZDVSFs5+GK+b5Y3QttiNnd4NO+mx4wS19ld51I//WpQ+pdU+6qlqP8hSm0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWa9+30zoRudV9vVrARF089lS4BTR9yCYiO8IdXFLnQ=;
 b=SXIR7xDiHX94c0JhNHBoPQuHCquyCuscnC5usZOMpnrr3lMtv7xHe9U9gMMih9qGHrc/3ba4SF8Y28peya7MpXj0R37TeE7A+u9G3SJ6TfGG70LFnLTZXbTx6pGIsdo5rGo//sbXjzaABMJ1GBsMruaE0ql2jyW7gCcXOAuKuIOA1Nern6ERMU22SUGfXH4wqyaolrDF59ZSXjPeRomOxzw6L7doYIk7A72f3dq5qpnCmJ+XEifUxMu9hZy1XE8TwXXN7RGmDFJ5NyHxp4Y6R/G7gD4X1OHAOAj5b9bN5YRzPRDUdgEndu7AcYd2NmGu7JbE3M9I3mwrejyXJkSrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 17:28:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 17:28:07 +0000
Date: Fri, 19 May 2023 10:28:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230519172803.GF10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519165927.1204-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230519165927.1204-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fe0c60-3afd-436d-7678-08db588e68bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rzIT3+S8J9/Gxe+3pyHur7+Jh9JAQr1d7zb+N1wgl6C1bA8V9voFoF3EQRRTNVRWPRYGDNG1P57QYuhdf57k65u11HoTru5ST+iSgQYsETMyltXo0sB9+7E6lSTB9oYcjFC5KeG9MWuAcgIrLWSp8JkIQo7LsHMlFhw8j0Y2zjMrwKigWmwJ5ssvbJhSurZIuq4HwcCpkSeDHHn2oPhpm5GftHYDKvofl9TUIPfB/j4DalyYWN0lthL6sMEB2H4zxxit33cYQQNKUEwlrZQzdIbrnjJ5vRLpOQ6VOJ+J6U3O/RstJPZ1vzff+ykKHXvG/RAiJC6imnQ5F4MmsZsGHYMIkOKw0Icq2QeyZ2iBD60aV7RYgO1zH8Ut+rRfp6UL70lEGRIfy5Mca1LihGiV6mDWfR6yJutS8pjs5lWsFWSFkiY2tvNES+hgVBA78DmmdZmxxck5m0P9g2NL6O5JRfKicvOr3OIUC2mrxNQlCoomwQha+Lq5KFJzfc2EDyyNr3ok2U35+yNLZzdeu6JzyHdiMEZWjeVk/PqNh5RUqyB3x78wmpOi0UpIc7mcS4W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(6636002)(4326008)(66476007)(478600001)(66556008)(66946007)(316002)(33656002)(86362001)(83380400001)(26005)(186003)(6512007)(6506007)(1076003)(107886003)(5660300002)(8676002)(6862004)(2906002)(8936002)(6666004)(6486002)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fIDhJ/1yDwvx9imI0aWjfEVSKfEO2FfNguwoATwOMw/JT9txmoo/ik2D8UIQ?=
 =?us-ascii?Q?WRfQezMTxJ4BBz2MIAvieMxblvgOZOBRJOKKObRFZL6BPla6BvZnz7m6TpIF?=
 =?us-ascii?Q?+/DCucOWgslxmmQNTjsUmnYAJDa2UohBSy6rPUXTZ1vcN35HpMx97e9QonfU?=
 =?us-ascii?Q?gZsfXOKIgXcYBNjDpKfTm9HjfJd80RMYtgHI5i5VMCv4N4HijsTTTcG0RlKk?=
 =?us-ascii?Q?U+L/ELyhQ22hf8Y1PQHacCw9zGEWIckmPqa3OabX6B3jyUEQFczEjy6zcazR?=
 =?us-ascii?Q?UAma7jxpepZmjDtIAalS3cNx7KkhFJoE1jDkr50FiZt4befiYMD44FMYFoV9?=
 =?us-ascii?Q?u11B7gkmEvV5J0RIlOfKXMijnXqPxmb4SDQgsdbGGNjwd4w+VZ75HX/W09OJ?=
 =?us-ascii?Q?F3XmmOh3bQlN/eLo1JELgyTiTCujVecKBACeFhRaQTat0HPOCM5ETxRfh7qk?=
 =?us-ascii?Q?tC4CdOjXGtg/879UPM2PF1+r2pe4xZjqwftPuxHFh72hYRZmfLJZO0X7ZCyG?=
 =?us-ascii?Q?7ZR5zJ0cJBC49d90G8Qgs0l7tmBLhQf3UnHyKrMv8L+l3NE5GSTxxZN5BhYI?=
 =?us-ascii?Q?7hVPpdwW6z2y/zFIHu4P0vYRiJxcl09PqsrkDmpD61qSgGivLPpzHIaai+dB?=
 =?us-ascii?Q?90lEt1FAzPF8HbHhdcJzWuo2tONUgAqh02z1QkqEDj+iLPtQzY8HmS5wu/hc?=
 =?us-ascii?Q?nZgp9y+TbOl11V6oMPsO4k5DK56/eiAxZ7kP2L6/lw4y3OyBEG2B/nZgcNGb?=
 =?us-ascii?Q?Q62t6vMknnV+M6gKOl6kZEGEdPbbReR0IIxW04ZrIUo4qaLjRNqb5rs7szVr?=
 =?us-ascii?Q?3tyzMQHKsWhzUUWIxb/KE5lk592J/okKDuoADKVscmCHzzGvnXJPxFmAxAj2?=
 =?us-ascii?Q?QzncI6hfswT5CFSfvmIFzsOtzzRN4rY4qdvTO+HssFyoLYjsa8RcDRBc3YUX?=
 =?us-ascii?Q?uATC8CHNDYagK2w7Vtz8FsxgvSfnV3U8SWjV4Z5REq3AyAHcCkqdv+tMlTUU?=
 =?us-ascii?Q?BUJyNqaw9qizbuiiEjTCE/bB5ogeTPzWwkSqui62JPvDBMzn3PJINnw+e6bQ?=
 =?us-ascii?Q?19jSsyf7acI6iY6zyVi06UV2fYIfMMUTPpK6WeWGTmKHTpenbh3ifZzE2L2g?=
 =?us-ascii?Q?stvk/OrYO5RoYW+4WRz4WiLw8a7Xzy0g9d23wFWDB+wbNl1tXG0+jRdWhb5b?=
 =?us-ascii?Q?WTbSorVji4Wka61IRqcV1VuIUzRju6unTtHLOx9gPS0pAIFhbrE3ae3Cysra?=
 =?us-ascii?Q?yFK3ffeIoN/w1CgkGECyVI9qfF38s5DaI+kf8Mu0WTnBVUgZdGH+JHMYrALW?=
 =?us-ascii?Q?EaF3iFR4w7FRe6UWbozffzr0fmgmosn2TOYuenWrJoqYvIhdcb1r0IIJX08w?=
 =?us-ascii?Q?mQc0o3oUODM5Eor0jpw00UzyVMtLh6E0j3+UgSPNARgq64Dy8DxAmCph+gYo?=
 =?us-ascii?Q?SDNJFNn8THQshY6EDhx1mzGaX0gADnmcE5v21JnOlVjqAMRWAVMINDvbQxaG?=
 =?us-ascii?Q?UjG8PbI+Z5bPWb6o+NOu5fU8RXPmfHosRfNpJGaBIkqIdQtizyLzFIpmZz7g?=
 =?us-ascii?Q?h/TFe8NKC73bj7GgakbLXTJCzPgu1NNLOxy4cBjPqWq6UTrmtEsHGtRG+vcD?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fe0c60-3afd-436d-7678-08db588e68bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 17:28:07.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0weER0f3egXfv/GPI63Vtjjcle2VD2AJkwdBf61sJBwMGuCjvbW4JUD9rz2Iep8XWic9OLP4WwqIwX83yNnvse5crVs2sXuB5WFzfgiJqjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Reorder GuC interrupt register
 definition
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 06:59:26PM +0200, Michal Wajdeczko wrote:
> We aim to have all definitions sorted by register address.

It seems like there's a lot of things in this header that still don't
follow the convention we're trying to standardize on:
 - A bunch of other registers near the top are still mis-sorted.
 - Some registers are using uppercase hex for the register offsets
   rather than the more widely-used lowercase hex.
 - The definition values are indented different amounts.  I think when
   we started cleaning up these register headers we picked column 49
   (via tabs) as the usual starting point for the values.
 - There's a 'struct guc_doorbell_info' and GUC_NUM_DOORBELLS that don't
   seem to be used anywhere in the driver (and probably wouldn't belong
   in a register header anyway).

Rather than just moving this one register, should we do all of those
updates?


Matt

> 
> Bspec: 49813
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index b4f27cadb68f..f08966c2be20 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -89,7 +89,6 @@
>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> -#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
>  
>  #define GUC_NUM_DOORBELLS			256
>  
> @@ -116,6 +115,8 @@ struct guc_doorbell_info {
>  #define GUC_WD_VECS_IER				XE_REG(0xC558)
>  #define GUC_PM_P24C_IER				XE_REG(0xC55C)
>  
> +#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
> +
>  #define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
>  #define VF_SW_FLAG_COUNT			4
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
