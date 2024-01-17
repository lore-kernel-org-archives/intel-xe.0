Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90810E908;
	Wed, 17 Jan 2024 23:29:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7910E912
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534156; x=1737070156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dYwPB28PcLaXxa6XJlKNIi2fGesZjUI5ihvO7uojrgo=;
 b=AIau/+ADam5U2cWz/fEnfjFvWiU7q4dTcoRleBRHJB7rpPf5mdICSC46
 zqFVEirq9LcS489qDA0lLJKpFumqGShCgPoeWXoszNYeett2yz/K6yUF+
 VWrNNVkRk6sm3b0DgKghEHjB10JSezX7MOElWZcfcaLo8Dso1X2QmxjsU
 sVdvW+nB5jbc4zqr7y8rGg51Gy97l9N6Njk1fBUyVNSzq32Zwgfx498cw
 5OR7CIbW+zdIf3eMZKqRT0sTSb2TmlYY09xyBxumatq15pjGIfto/cwwh
 j4DVKShArmxr6g3Q0VVKe0mxFdgWvFG13teFkgPIRqx7MPGPw4V5umrr4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="194135"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="194135"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784648077"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="784648077"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:29:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:29:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:29:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:29:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:29:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTnD1eFybkI4pOwKyuQ9O+IIBH/VrGcgSK45cyryZUFbPaOk5FL2b8x7om+M0oKF0LIFquPNEyxvn4xRoDPyHJtxnlFkl7uzpq1hykQfWkHHviIqwx3yvX+7GRz37yUsLuvK44f7ZKFzd3VxOzmQMOy0KqvPMWFJJgb2CuvnirC0MRf+4Gs1CdwnLq3NyrKkSjF6MebdwRfsC2e0vea+FdjWbibnggCHkZ8akq2123fAu0ow6KaiU6OfYy3rBR0eB63kp+zDWqaqVI03aOUJ8VTihdCTOeHAiY8kW5qqX3GQIbUmPD+M8R+M8J77D2SMVD4KOjKhmZaJWfViZbaZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8nF8W/45UwZmFFbAF7PRW8Jdm5qudEErHfGbHqHsEU=;
 b=YEJ7WV2n2xFE65RPMBze5ONTUCzZrPS318F8VqWG1oYjJSZIn2zqG3EcbbLLeIUR9zhHJQM6MBaitF9KL+DmmAEt2WhqnRlTnr+U//5BmkZUTH0XBxN0rNNLhykDcafSDH/e7Ql2kUv46bUTJlzchlTo/g4Yy8j1lyyAlLiCn50C8u+w2MfjIYJt0F2wSdxvxIaHkzzFjbFSzZRWj8B5p6/HrEaOYb1oHmWFk7KMjHvb8zc2BQzscAqqHyZe0WcxPBVzp65ASNiK5noHPV17V3KMKS1ZqyVCaJhsD+Fcz6UnJC06TqRhevszA3bM+9j21i3pYJROzW/ENk393QZbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.24; Wed, 17 Jan
 2024 23:29:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 23:29:02 +0000
Date: Wed, 17 Jan 2024 15:28:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Mark VF accessible global registers
Message-ID: <20240117232857.GM45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: d6eeb13c-6ad0-40f3-80ba-08dc17b41588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVh2QXv89X6TalJBPbpw3z/r8NzMZ69T0HvMnTs6JZpzAOstigyrJgHHnWp9zJRxM4ozgxmV56gBxfwwqFFXLgzJ7glqgLGwYduzVHWMeOT4HirJOqdQLDW9JM9B2hvf5EOCrq5UdtxuKtvRM5Qjp/Z4UHw9GJCEhmcWDqCEko9g+BYqmUshLkI45pwI0A2HW0qEfG8GIe9pbyRFePqmyy4e7m3UrHcRhLKRyiOOx2N+SJ/try1crYysCB+/yBKWU8Gt4Ak6ngWp5ZoRe313FCGqxWOT+6Ubr7xeHa+ls6y30LG5v9yDIicu8DMWceFmefqWyZU5facytd/m5qOOO4ijCJWabd9W522S+CbBLZdM4h7rv6jX3TgQWN1RyQTnQtbfr/sVHKdOouXpA6bnFOE96mMhiUQXRCK8XhUvVKb1r0sCwoEXr9I3hdbh1ULEqOT5sYyd3/vakM5Tk6qwtX1K3kIfF0xbwnBbx0aQg2g1AJxUlQKFMeg5POEm0BHrkXvnL6ugs50OIgarZ8SlUJWZaOmNv7Vrxey0gwr8dl8zw1l01inuca3urSXfSh6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(478600001)(82960400001)(8676002)(4744005)(2906002)(8936002)(5660300002)(6862004)(4326008)(66556008)(66476007)(66946007)(316002)(6636002)(6486002)(26005)(86362001)(6512007)(6506007)(38100700002)(1076003)(33656002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3ssZ3B0TUnBMw+lzvhPiytW/tS/rUN42P0wuOGMVPh/l+oGE0w7V07EF6tL?=
 =?us-ascii?Q?RGSckJHH0NV/CsmdjRdsdB+ous7e+VZKle7zuBJIvuQAm6DRUrP5W86JVpcv?=
 =?us-ascii?Q?EdTB5xLirHHVWkleR6w4687NciIgoCsuNuVAEhJTEFKhGoQzfUhlnboUzBir?=
 =?us-ascii?Q?SlRDHTsScIk7P6Cr3CpEMeQHunmM4UHYhXDzMIP476llhUIdU8C92+qGuSIA?=
 =?us-ascii?Q?iqVwVT+cbXkiG85k4bNB5pbDczX2wYZi/Q8n23Nuf1KTSYQATfviBBolu6Kq?=
 =?us-ascii?Q?IKt7JzwbivI2CGUuirr14srNb205Z0Qvv+mpDHATOzofQmeur4a0hpahCgJC?=
 =?us-ascii?Q?lhJZT/sJDH2SE4w5kdHoGLVul0uLFKbE+3Dy8TDYrGKCAEZ3Zf+1zOHKuZ8A?=
 =?us-ascii?Q?m0G552qkQjr5cR0KmBZ+9B9Xam9YtXYHBiDf+v3BnlDHCGIqqPXejtPwY09h?=
 =?us-ascii?Q?HEs40ItmKdPd7eIKSKQGH+SaxKFek6AU01G7k3e+W0LrVfYzoL24S6Oxt8uJ?=
 =?us-ascii?Q?gVrF/fYIZ/f4bazm0tQNU5mpYjVCr9KWF3g4ViKqodSnK3nnNtWHhrj5p5Tc?=
 =?us-ascii?Q?OJ2gBg2saJNGYV/QMvnvlaTVOvcohg4xTF5k1tYv6K4myTo1bTu2xZHtp221?=
 =?us-ascii?Q?b/WO01hy3Xg7nGAa6lI7WgW/QG8ng7ybej223u6v19F2PKU8JgFsObZxYkP4?=
 =?us-ascii?Q?olf1uBiJwU5mGbDcaG4P7umFjDHI/NTf79oxUaWtlIvlQ+xdUWbHimMPFq2w?=
 =?us-ascii?Q?13uavV72wXcUkbdlB1scI2X7t96v91sozaydE/4lpFxyR5i5XpYxfLKLpsId?=
 =?us-ascii?Q?8Kgv1yEvxPxIJnF/gcCjL/S3SUM2+1dk8DlrkAx0T1tRRo4HDMr04Xg+gvCH?=
 =?us-ascii?Q?kmShOP/Qkiac23rgLMis4a4ZPb0+rec767ekkAmqpqmgYMoKTqjOxipShycx?=
 =?us-ascii?Q?CF3jPbf5oizT5V5La6HIaIcjbh1I3ZmS5CYFPg/0SZazAkfaJKCf23CjT9al?=
 =?us-ascii?Q?rskVSiO3+fEBdF/GFE4+7VkkiBAGFkvC3ir/4pADl8elYd8S8NgXmZtq8EaF?=
 =?us-ascii?Q?hQpz3aNskmJU8RFfVnTxLIsiKjnSnNTfoFL+s2DRBhbSGzEgYYS5pAAbhVrq?=
 =?us-ascii?Q?7iCh+oW1a7Hjlxnxwwy3aJ9UZO6egoaDojwQPJEOVcP1Ze2K05IB1Dubmu6T?=
 =?us-ascii?Q?FAB2Yg2JVpOmsn/otUGSE73oqNAFj8h5yTtkeZxAi4AoS/podPP+q+VLS6zS?=
 =?us-ascii?Q?CQlT++3hfkaA2WV8jb85W8WiesY1SPtcEZIwTAGXfyISnN57hppr9X93WKwz?=
 =?us-ascii?Q?81bZ1HwZGHJxA0flz+cngKHngwOi9uSSVaXzTeQdvAC2VFajz8ktFQUwJaMt?=
 =?us-ascii?Q?6HmFO7lj6BNkU6aasrGSzHS56Bz4qO5Cbq+oRvp1P9FX0OOhDyNNakNXKssY?=
 =?us-ascii?Q?uUsP3WA9vRO+bKBcmB6j0Bg1L0dkZ1nbtd8AO3bGdcwCXohaib9U9hLcHrpE?=
 =?us-ascii?Q?V8zb7bRghgck3fxzME8PYXeHHig00f4n6XGQLQVOMoWLick+bk7xHu2YbvGk?=
 =?us-ascii?Q?0P3LNwfFRDlWILuqSaod+D77+sEHwWNEvG+wGUM7O/i66oUjU0eUtcTsWFUk?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6eeb13c-6ad0-40f3-80ba-08dc17b41588
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:29:01.9249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSGJK0JnuuOjVy8SiyWEhv5hLbTr2txv7vxT+T1DzIY5P0GGmWU6SbIZz8yr+e2KuXXlHHpVWlRvP5ZNRTBRCSpbv9ngluxK91dIxbzr268=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 03:56:15PM +0100, Michal Wajdeczko wrote:
> Only selected registers are available for Virtual Functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 2c214bb9b671..722fb6dbb72e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -57,7 +57,7 @@
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>  
> -#define GFX_MSTR_IRQ				XE_REG(0x190010)
> +#define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   DISPLAY_IRQ				REG_BIT(16)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
