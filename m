Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0459AC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 22:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FA010E0D0;
	Fri, 26 May 2023 22:16:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31D810E0D0
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685139373; x=1716675373;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Uwjg9vBJJ/yViO53sDFFFsgFEiyLdMwGZnfQZWXkN+k=;
 b=Bzfbg98xl6Odq2ZZP/yzFyVqfBhLBPK3pTe5Aj3D0251FHKCzhbG0C4+
 YcXf3qzMyrnA6P6uORe/L6TlMGfbNib0d6VJOM8lQkqHYvk9YfwYCrj5P
 S6RQfB4XL73ssGongRJlP9sjds0qen4EIgZ007SWvQ6TWV/2lhmujTA7K
 eVpGVvgeMJVuysUd5cy10uRK6PLgJFVOOhpwqVLMdskY9aZRe6fd8C0k+
 woHiezAx/ncF+1HhNL+40tePoGb8y+zlvPvWuwO65j6qCZyPHui01q6EV
 zqa6z0+gyqnauhsAhm6XqB7Pv48Nk/2oG0ePAOPEiBf9ELM1qKNfem1ju Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351825296"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="351825296"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699547899"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="699547899"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 26 May 2023 15:16:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:16:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:16:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:16:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwYy3JL2zMb2Cs/4+v4SUny5xkeBLYUWej5QeGqyxcKLy7A5RRVsdpHDbMB2u/dlG45QSuJjdSD8KyWfXy0GagRtvAQcPdYjNQoH460dnKUhgI9JhfPk4VJzdpKQTvaeI7VGv9gM2ZA1XlEYXfxubZPE/K7ys+TUg1EnlmAy4EMiBr8FBDY/2HqVvS8TD6uCQedd1xrcNabA/IseBMjQAYbEaEaS01x7dCX7Dz68n+u3wHlTSQN3w5oMcbhi15Msv07Z5ZUwiMUqiStorwYzNF7XPJ1uInzt9CN3eFVSmAb7yusNC4okfRQdf7pQXHDAFMos+nppouCHNRx3n6gNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNQAg3AToNg2nAz4G6+oGQy0OoBUnT5G5GMKCSK5++I=;
 b=IUWGJnpLQ4SMVsBu/sFqA3gcajpgtkriHi3TEfPbtjsk4hFWzC1Nmrqjb9V0QjehCpCgRLgwhYxe/HY4N+lv6y1DTsHbFa/YvFSxXMMES+fHAycRs6pp5bmzpVCuMErPNGt7apTW0sMyWufxTNN22nTSKmXXVmxKzGD8CsAh1AhJYEU5na7ztqosue4QSEGkjxzjS9TxRUqkzJX+NgRjpcEmYIE3TYAZ5Gq8d2zbJxHqg5z6UQRmE2USWw21uLx7gzULocC7X/Jjhka6YlDa7hL+c63E6ZUgUNBezVn373Smkqq8xk7eRXdPqwFt5SEt8RmRja6/XWv1eZ2yt4KZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 22:16:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 22:16:05 +0000
Date: Fri, 26 May 2023 15:16:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <frkkwqvgkcyb5mhsmj3mul2t4hs6lhopqxazd2jeyoxaxowv7b@osxydpaz46af>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-21-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519231827.3572452-21-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 552bfee6-0987-4624-7620-08db5e36cbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsVCGT92M4wa+mqVOSMtOExrrTgA765KQoMyZj7zToc0xyofUUjTPN1OAlDmNSh1r5Mpvrt7G88Hc+/De0L48dJvj8y5+SsDhR1MvAejxnq+okMiXcSERIo43tZ7PwLFatChCBMBRJPPg4JL0pMbMDhn3NEl0QnUa8qonjcofBt0qXjZMVY2LgZ3tAxfa6bRkMif/VUyUbqcCODfwwCfXnRXWJ3yewZg9ke6zI7Rzz/2OW+T0v1I6tPwxB29fottX7V6pLFc76Fs3o3Q0tcXXqOXJLM/EqMS9Z3dDreS+t0XGxA576YGnwAKRa4X4a/JCnyYKVpID4uV5NrxZnKi2GbtMFiQvZ+OD6V3VfCROIDHMCktbb8yHti+ftGalR8jX2EgByjYdqnYTJBUwApuQahG3l7Z4Ey/Vv6n44Vuwk085IqDSqXYRK1R2TRmHyY1MQjMDarbh9DWArV5rwPurqXwpFJsPve37Whakideijob6Ydz97y9bqadW+V5TBKwd6FKKPMTWjAb/0Du9C2ws+J/OLELu/rwhIubx7h1WN7OepHA/zzmN/QKc3JZiK9N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(83380400001)(2906002)(30864003)(186003)(38100700002)(86362001)(82960400001)(6862004)(5660300002)(8936002)(8676002)(6486002)(33716001)(66476007)(66946007)(41300700001)(66556008)(316002)(4326008)(6636002)(478600001)(6666004)(26005)(9686003)(6506007)(66899021)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mM70rsIGg3oxwindYmXmhNzOLdiFQpel6xIex6zM1/qRbrbLbTdTlHWsGW?=
 =?iso-8859-1?Q?9hdWHA4vIkJBVvRDZ7+ufR34eZ/JDdYLW3qS6bsaFloWFT5HoF/J68E8Te?=
 =?iso-8859-1?Q?ERISF7cMei70FeEFTDaU3gYdkjeZA9Zr0B1tA7Pp7KWqi9oEZOKltRCuZD?=
 =?iso-8859-1?Q?6j5+lxkyBWw3fQ9VKk0ADobxBFWhFwuGYsCNiaPJVBbesnvkFkFHhL3TBs?=
 =?iso-8859-1?Q?Xe7cA8gre7gYq2GrILwc5NSe9QXeI2cOBVefHjIeOEYzKRbvNgqvtBV8wo?=
 =?iso-8859-1?Q?tsaXprI+gDmAIBTwQL3DMc0o6hZGodIqUed5+eBMbdJZF8QU21VqxPnfW4?=
 =?iso-8859-1?Q?PVMCcagDS/v6EXJaBY5+NoutimuXfZKA/E9IOrxFKMThLR2z+09CMEz5Dd?=
 =?iso-8859-1?Q?c5fv9evLuG4SPYJzEHH/+wfuPp+pXWhmoXAL35iF2//NxpzQ3tN+z3L/S4?=
 =?iso-8859-1?Q?kdoAd6DSw/oO+LRarBB1Ig4/N5Zbrh2XlOxCCoQebfT0SGlSnmdQqpGTen?=
 =?iso-8859-1?Q?XTJKHpTIR2HbgEmoPm7aAvCFo8JYGmvyUH/eE4G6Qx3aGEkYpYAfs/wMUO?=
 =?iso-8859-1?Q?pdScSlO07kEJYCUwuqRmd9/hpv4L6IE2twP4QrOvPzyy7eOUFg/6g1VfyO?=
 =?iso-8859-1?Q?XbDqumlyHcAKEuwiEobyHw4+/eIRY2jf2Dkz1hIkt8OCB3iZwMu0seoEZ7?=
 =?iso-8859-1?Q?DPVq18Y5iW5DbsEduDsVccdjZKb/DGGnVCHLwV6z6vyRNYFIK6j8No9Lk3?=
 =?iso-8859-1?Q?n3+6/PUD/l4EacXka4mXdemnDXWhRhPGjoJ2i3h8zu8RJWChhtJuL21UPm?=
 =?iso-8859-1?Q?J+3h+pHvtRfgMJ0mAXaIUSIBZGXXITDY/DuybEq8UBuis9ITjPgggajDlc?=
 =?iso-8859-1?Q?K4NCCEFLOK5+spK4AWbJ31pJx7nj99W2Jp++2beFy3ChsJh7Fi4Aq96pYR?=
 =?iso-8859-1?Q?MxzN5uRQoPC88bJyOkjoidcumFxdheatEGUvlaMFbfycOib/Dx5zHPckZ2?=
 =?iso-8859-1?Q?rBD6zfKnUWGbPELYgmbrRzObk4ghMTQ2Gsww9LDXrIsMtBf3llceq2APBE?=
 =?iso-8859-1?Q?9NvS8Ina547SZ+Qcsq7OlIBRpvGOXn4Kt0Xivg56c2qXo+AnfIV50yyQza?=
 =?iso-8859-1?Q?oLiwbg4VrkTmOXL9AUGpGs2R6sWFG08Bc8vscZvp/jdCjauAzB9pjgRzOm?=
 =?iso-8859-1?Q?bV0mTCxLKN5knF9Sw1FANpLcvaLh5upMHu1+V3QmsX68x0AkM9pIRxRGDn?=
 =?iso-8859-1?Q?UC8d4qzNmDrcZsUt7KSuIhEcy3WseAE71vUoRZ+1+Mjzlp76l+H0rzWCki?=
 =?iso-8859-1?Q?56PMHevoE5EPX9Ts4Ou3jApZ1ON1GQhCoFyr6dZ6WRDjQ00m3tP5a/ZYlI?=
 =?iso-8859-1?Q?EZYCE11ItDCo6IXIdz3CnX+lA9irD2jsEGT1lYQ+Izi8fUofK5ZLGqu0lM?=
 =?iso-8859-1?Q?PsMZkNKQtVyakHfut3vSHl3JVa2zxeMAu5DawFTWj/w5IlctkNIV9qwMRY?=
 =?iso-8859-1?Q?cALeMMPC275sOmkQ+Bh0kxeQdcZxSlxlfJDXT6zBGuvMAT++d57z3Y8Pks?=
 =?iso-8859-1?Q?jRb0RaxQ4tNUpKsuEyDOlF3R5EaMsxr6lX8yCRSrztK/fbV6321dul+mW+?=
 =?iso-8859-1?Q?FZwxoODoQ4blWwbR+D060APR3PpDRODvNTNien5JHcvo5DjtZqhpiUyg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552bfee6-0987-4624-7620-08db5e36cbd6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 22:16:04.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okDRmjyOdQEyogZbL3aCTxu7gdWzLFKCFrbMeHWT+gdxxknrzX1IDwcqkHJON+nxrBlK1GPCvZOHJO74NjWhD9Jxo/1UdLB6tFQrhqK6RXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 20/30] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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

On Fri, May 19, 2023 at 04:18:17PM -0700, Matt Roper wrote:
>IRQ delivery and handling needs to be handled on a per-tile basis.  Note
>that this is true even for the "GT interrupts" relating to engines and
>GuCs --- the interrupts relating to both GTs get raised through a single
>set of registers in the tile's sgunit range.
>
>On true multi-tile platforms, interrupts on remote tiles are internally
>forwarded to the root tile; the first thing the top-level interrupt
>handler should do is consult the root tile's instance of
>DG1_MSTR_TILE_INTR to determine which tile(s) had interrupts.  This
>register is also responsible for enabling/disabling top-level reporting
>of any interrupts to the OS.  Although this register technically exists
>on all tiles, it should only be used on the root tile.
>
>The (mis)use of struct xe_gt as a target for MMIO operations in the
>driver makes the code somewhat confusing since we wind up needing a GT
>pointer to handle programming that's unrelated to the GT.  To mitigate
>this confusion, all of the xe_gt structures used solely as an MMIO
>target in interrupt code are renamed to 'mmio' so that it's clear that

I still think it's odd to call an instance of `struct xe_gt` as mmio and
if we decide to create a better abstraction for the mmio, we may have in
future a struct xe_mmio that will clash here. Hence I think it would be
better to call it mmio_gt. But I won´t insist and leave this just as
feedback.

Reviewing this after applying it locally and using --color-words was
much easier


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>the structure being passed does not necessarily relate to any specific
>GT (primary or media) that we might be dealing with interrupts for.
>Reworking the driver's MMIO handling to not be dependent on xe_gt is
>planned as a future patch series.
>
>Note that GT initialization code currently calls xe_gt_irq_postinstall()
>in an attempt to enable the HWE interrupts for the GT being initialized.
>Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
>does a bunch of other stuff unrelated to the GT interrupts (such as
>enabling the top-level device interrupts).  That will be addressed in
>future patches.
>
>v2:
> - Clarify commit message with explanation of why DG1_MSTR_TILE_INTR is
>   only used on the root tile, even though it's an sgunit register that
>   is technically present in each tile's MMIO space.  (Aravind)
> - Also clarify that the xe_gt used as a target for MMIO operations may
>   or may not relate to the GT we're dealing with for interrupts.
>   (Lucas)
>
>Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> drivers/gpu/drm/xe/xe_irq.h |   4 +-
> 3 files changed, 187 insertions(+), 153 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 0abd0d912610..290935e46059 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -304,7 +304,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	gt->info.engine_mask = gt->info.__engine_mask;
>
> 	/* Enables per hw engine IRQs */
>-	xe_gt_irq_postinstall(gt);
>+	xe_gt_irq_postinstall(gt_to_tile(gt));
>
> 	/* Rerun MCR init as we now have hw engine list */
> 	xe_gt_mcr_init(gt);
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 654c34a5b99a..ad2f73b2a031 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -27,60 +27,66 @@
> #define IIR(offset)				XE_REG(offset + 0x8)
> #define IER(offset)				XE_REG(offset + 0xc)
>
>-static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>+static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> {
>-	u32 val = xe_mmio_read32(gt, reg);
>+	u32 val = xe_mmio_read32(mmio, reg);
>
> 	if (val == 0)
> 		return;
>
>-	drm_WARN(&gt_to_xe(gt)->drm, 1,
>+	drm_WARN(&gt_to_xe(mmio)->drm, 1,
> 		 "Interrupt register 0x%x is not zero: 0x%08x\n",
> 		 reg.addr, val);
>-	xe_mmio_write32(gt, reg, 0xffffffff);
>-	xe_mmio_read32(gt, reg);
>-	xe_mmio_write32(gt, reg, 0xffffffff);
>-	xe_mmio_read32(gt, reg);
>+	xe_mmio_write32(mmio, reg, 0xffffffff);
>+	xe_mmio_read32(mmio, reg);
>+	xe_mmio_write32(mmio, reg, 0xffffffff);
>+	xe_mmio_read32(mmio, reg);
> }
>
> /*
>  * Unmask and enable the specified interrupts.  Does not check current state,
>  * so any bits not specified here will become masked and disabled.
>  */
>-static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
>+static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
> {
>+	struct xe_gt *mmio = tile->primary_gt;
>+
> 	/*
> 	 * If we're just enabling an interrupt now, it shouldn't already
> 	 * be raised in the IIR.
> 	 */
>-	assert_iir_is_zero(gt, IIR(irqregs));
>+	assert_iir_is_zero(mmio, IIR(irqregs));
>
>-	xe_mmio_write32(gt, IER(irqregs), bits);
>-	xe_mmio_write32(gt, IMR(irqregs), ~bits);
>+	xe_mmio_write32(mmio, IER(irqregs), bits);
>+	xe_mmio_write32(mmio, IMR(irqregs), ~bits);
>
> 	/* Posting read */
>-	xe_mmio_read32(gt, IMR(irqregs));
>+	xe_mmio_read32(mmio, IMR(irqregs));
> }
>
> /* Mask and disable all interrupts. */
>-static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
>+static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
> {
>-	xe_mmio_write32(gt, IMR(irqregs), ~0);
>+	struct xe_gt *mmio = tile->primary_gt;
>+
>+	xe_mmio_write32(mmio, IMR(irqregs), ~0);
> 	/* Posting read */
>-	xe_mmio_read32(gt, IMR(irqregs));
>+	xe_mmio_read32(mmio, IMR(irqregs));
>
>-	xe_mmio_write32(gt, IER(irqregs), 0);
>+	xe_mmio_write32(mmio, IER(irqregs), 0);
>
> 	/* IIR can theoretically queue up two events. Be paranoid. */
>-	xe_mmio_write32(gt, IIR(irqregs), ~0);
>-	xe_mmio_read32(gt, IIR(irqregs));
>-	xe_mmio_write32(gt, IIR(irqregs), ~0);
>-	xe_mmio_read32(gt, IIR(irqregs));
>+	xe_mmio_write32(mmio, IIR(irqregs), ~0);
>+	xe_mmio_read32(mmio, IIR(irqregs));
>+	xe_mmio_write32(mmio, IIR(irqregs), ~0);
>+	xe_mmio_read32(mmio, IIR(irqregs));
> }
>
>-static u32 xelp_intr_disable(struct xe_gt *gt)
>+static u32 xelp_intr_disable(struct xe_device *xe)
> {
>-	xe_mmio_write32(gt, GFX_MSTR_IRQ, 0);
>+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>+
>+	xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
>
> 	/*
> 	 * Now with master disabled, get a sample of level indications
>@@ -88,36 +94,41 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
> 	 * New indications can and will light up during processing,
> 	 * and will generate new interrupt after enabling master.
> 	 */
>-	return xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+	return xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>
> static u32
>-gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
>+gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
> {
>+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> 	u32 iir;
>
> 	if (!(master_ctl & GU_MISC_IRQ))
> 		return 0;
>
>-	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET));
>+	iir = xe_mmio_read32(mmio, IIR(GU_MISC_IRQ_OFFSET));
> 	if (likely(iir))
>-		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET), iir);
>+		xe_mmio_write32(mmio, IIR(GU_MISC_IRQ_OFFSET), iir);
>
> 	return iir;
> }
>
>-static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
>+static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> {
>-	xe_mmio_write32(gt, GFX_MSTR_IRQ, MASTER_IRQ);
>+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>+
>+	xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
> 	if (stall)
>-		xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>
>-static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void gt_irq_postinstall(struct xe_tile *tile)
> {
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_gt *mmio = tile->primary_gt;
> 	u32 irqs, dmask, smask;
>-	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
>-	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>+	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
>+	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
>
> 	if (xe_device_guc_submission_enabled(xe)) {
> 		irqs = GT_RENDER_USER_INTERRUPT |
>@@ -133,57 +144,57 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 	smask = irqs << 16;
>
> 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
>-	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
>-	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
>+	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>+	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
> 	if (ccs_mask)
>-		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
>+		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>
> 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
>-	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
>+	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>+	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> 	if (bcs_mask & (BIT(1)|BIT(2)))
>-		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> 	if (bcs_mask & (BIT(3)|BIT(4)))
>-		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> 	if (bcs_mask & (BIT(5)|BIT(6)))
>-		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> 	if (bcs_mask & (BIT(7)|BIT(8)))
>-		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>-	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
>-	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
>-	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>+	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
>+	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
>+	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
>+		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
>
> 	/*
> 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
> 	 * is enabled/disabled.
> 	 */
> 	/* TODO: gt->pm_ier, gt->pm_imr */
>-	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
>+	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>+	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>
> 	/* Same thing for GuC interrupts */
>-	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE, 0);
>-	xe_mmio_write32(gt, GUC_SG_INTR_MASK,  ~0);
>+	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
>+	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
> }
>
>-static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> {
> 	/* TODO: PCH */
>
>-	gt_irq_postinstall(xe, gt);
>+	gt_irq_postinstall(tile);
>
>-	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>+	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>
>-	xelp_intr_enable(gt, true);
>+	xelp_intr_enable(xe, true);
> }
>
> static u32
> gt_engine_identity(struct xe_device *xe,
>-		   struct xe_gt *gt,
>+		   struct xe_gt *mmio,
> 		   const unsigned int bank,
> 		   const unsigned int bit)
> {
>@@ -192,7 +203,7 @@ gt_engine_identity(struct xe_device *xe,
>
> 	lockdep_assert_held(&xe->irq.lock);
>
>-	xe_mmio_write32(gt, IIR_REG_SELECTOR(bank), BIT(bit));
>+	xe_mmio_write32(mmio, IIR_REG_SELECTOR(bank), BIT(bit));
>
> 	/*
> 	 * NB: Specs do not specify how long to spin wait,
>@@ -200,7 +211,7 @@ gt_engine_identity(struct xe_device *xe,
> 	 */
> 	timeout_ts = (local_clock() >> 10) + 100;
> 	do {
>-		ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank));
>+		ident = xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
> 	} while (!(ident & INTR_DATA_VALID) &&
> 		 !time_after32(local_clock() >> 10, timeout_ts));
>
>@@ -210,7 +221,7 @@ gt_engine_identity(struct xe_device *xe,
> 		return 0;
> 	}
>
>-	xe_mmio_write32(gt, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
>+	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
>
> 	return ident;
> }
>@@ -232,10 +243,32 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> 	}
> }
>
>-static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>+static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>+				    enum xe_engine_class class,
>+				    unsigned int instance)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+
>+	if (MEDIA_VER(xe) < 13)
>+		return tile->primary_gt;
>+
>+	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>+	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+		return tile->media_gt;
>+
>+	if (class == XE_ENGINE_CLASS_OTHER &&
>+	    instance == OTHER_MEDIA_GUC_INSTANCE)
>+		return tile->media_gt;
>+
>+	return tile->primary_gt;
>+}
>+
>+static void gt_irq_handler(struct xe_tile *tile,
> 			   u32 master_ctl, long unsigned int *intr_dw,
> 			   u32 *identity)
> {
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_gt *mmio = tile->primary_gt;
> 	unsigned int bank, bit;
> 	u16 instance, intr_vec;
> 	enum xe_engine_class class;
>@@ -247,27 +280,26 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 		if (!(master_ctl & GT_DW_IRQ(bank)))
> 			continue;
>
>-		if (!xe_gt_is_media_type(gt)) {
>-			intr_dw[bank] =
>-				xe_mmio_read32(gt, GT_INTR_DW(bank));
>-			for_each_set_bit(bit, intr_dw + bank, 32)
>-				identity[bit] = gt_engine_identity(xe, gt,
>-								   bank, bit);
>-			xe_mmio_write32(gt, GT_INTR_DW(bank),
>-					intr_dw[bank]);
>-		}
>+		intr_dw[bank] = xe_mmio_read32(mmio, GT_INTR_DW(bank));
>+		for_each_set_bit(bit, intr_dw + bank, 32)
>+			identity[bit] = gt_engine_identity(xe, mmio, bank, bit);
>+		xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);
>
> 		for_each_set_bit(bit, intr_dw + bank, 32) {
>+			struct xe_gt *engine_gt;
>+
> 			class = INTR_ENGINE_CLASS(identity[bit]);
> 			instance = INTR_ENGINE_INSTANCE(identity[bit]);
> 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>
>+			engine_gt = pick_engine_gt(tile, class, instance);
>+
> 			if (class == XE_ENGINE_CLASS_OTHER) {
>-				gt_other_irq_handler(gt, instance, intr_vec);
>+				gt_other_irq_handler(engine_gt, instance, intr_vec);
> 				continue;
> 			}
>
>-			hwe = xe_gt_hw_engine(gt, class, instance, false);
>+			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
> 			if (!hwe)
> 				continue;
>
>@@ -285,24 +317,24 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> static irqreturn_t xelp_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
> 	u32 master_ctl, gu_misc_iir;
> 	long unsigned int intr_dw[2];
> 	u32 identity[32];
>
>-	master_ctl = xelp_intr_disable(gt);
>+	master_ctl = xelp_intr_disable(xe);
> 	if (!master_ctl) {
>-		xelp_intr_enable(gt, false);
>+		xelp_intr_enable(xe, false);
> 		return IRQ_NONE;
> 	}
>
>-	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+	gt_irq_handler(tile, master_ctl, intr_dw, identity);
>
> 	xe_display_irq_handler(xe, master_ctl);
>
>-	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
>+	gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>
>-	xelp_intr_enable(gt, false);
>+	xelp_intr_enable(xe, false);
>
> 	xe_display_irq_enable(xe, gu_misc_iir);
>
>@@ -311,38 +343,38 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>
> static u32 dg1_intr_disable(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> 	u32 val;
>
> 	/* First disable interrupts */
>-	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
>+	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
>
> 	/* Get the indication levels and ack the master unit */
>-	val = xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
>+	val = xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> 	if (unlikely(!val))
> 		return 0;
>
>-	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
>+	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
>
> 	return val;
> }
>
> static void dg1_intr_enable(struct xe_device *xe, bool stall)
> {
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>
>-	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
>+	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> 	if (stall)
>-		xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
>+		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> }
>
>-static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> {
>-	gt_irq_postinstall(xe, gt);
>+	gt_irq_postinstall(tile);
>
>-	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>+	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>
>-	if (gt->info.id == XE_GT0)
>+	if (tile->id == 0)
> 		dg1_intr_enable(xe, true);
> }
>
>@@ -354,8 +386,8 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> static irqreturn_t dg1_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
>-	struct xe_gt *gt;
>-	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
>+	struct xe_tile *tile;
>+	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
> 	long unsigned int intr_dw[2];
> 	u32 identity[32];
> 	u8 id;
>@@ -368,12 +400,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 		return IRQ_NONE;
> 	}
>
>-	for_each_gt(gt, xe, id) {
>-		if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id)) == 0)
>+	for_each_tile(tile, xe, id) {
>+		struct xe_gt *mmio = tile->primary_gt;
>+
>+		if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
> 			continue;
>
>-		if (!xe_gt_is_media_type(gt))
>-			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+		master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>
> 		/*
> 		 * We might be in irq handler just when PCIe DPC is initiated
>@@ -381,124 +414,125 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 		 * irq as device is inaccessible.
> 		 */
> 		if (master_ctl == REG_GENMASK(31, 0)) {
>-			dev_dbg(gt_to_xe(gt)->drm.dev,
>+			dev_dbg(tile_to_xe(tile)->drm.dev,
> 				"Ignore this IRQ as device might be in DPC containment.\n");
> 			return IRQ_HANDLED;
> 		}
>
>-		if (!xe_gt_is_media_type(gt))
>-			xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
>-		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>+
>+		gt_irq_handler(tile, master_ctl, intr_dw, identity);
>
> 		/*
>-		 * Save primary tile's master interrupt register for display
>-		 * processing below.
>+		 * Display interrupts (including display backlight operations
>+		 * that get reported as Gunit GSE) would only be hooked up to
>+		 * the primary tile.
> 		 */
>-		if (id == 0)
>-			tile0_master_ctl = master_ctl;
>+		if (id == 0) {
>+			xe_display_irq_handler(xe, master_ctl);
>+			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>+		}
> 	}
>
>-	xe_display_irq_handler(xe, tile0_master_ctl);
>-
>-	/* Gunit GSE interrupts can trigger display backlight operations */
>-	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
>-
> 	dg1_intr_enable(xe, false);
>-
> 	xe_display_irq_enable(xe, gu_misc_iir);
>
> 	return IRQ_HANDLED;
> }
>
>-static void gt_irq_reset(struct xe_gt *gt)
>+static void gt_irq_reset(struct xe_tile *tile)
> {
>-	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
>-	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>+	struct xe_gt *mmio = tile->primary_gt;
>+
>+	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>+						   XE_ENGINE_CLASS_COMPUTE);
>+	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>+						   XE_ENGINE_CLASS_COPY);
>
> 	/* Disable RCS, BCS, VCS and VECS class engines. */
>-	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE,	 0);
>-	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE,	 0);
>+	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>+	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
> 	if (ccs_mask)
>-		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, 0);
>+		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, 0);
>
> 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK,	~0);
>-	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK,	~0);
>+	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK,	~0);
>+	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK,	~0);
> 	if (bcs_mask & (BIT(1)|BIT(2)))
>-		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
>+		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> 	if (bcs_mask & (BIT(3)|BIT(4)))
>-		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
>+		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> 	if (bcs_mask & (BIT(5)|BIT(6)))
>-		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
>+		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> 	if (bcs_mask & (BIT(7)|BIT(8)))
>-		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
>-	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK,	~0);
>-	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK,	~0);
>-	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK,	~0);
>+		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
>+	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK,	~0);
>+	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK,	~0);
>+	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK,	~0);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~0);
>+		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~0);
>+		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
>
>-	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
>-	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,	 0);
>-	xe_mmio_write32(gt, GUC_SG_INTR_MASK,		~0);
>+	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>+	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>+	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
>+	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
> }
>
>-static void xelp_irq_reset(struct xe_gt *gt)
>+static void xelp_irq_reset(struct xe_tile *tile)
> {
>-	xelp_intr_disable(gt);
>+	xelp_intr_disable(tile_to_xe(tile));
>
>-	gt_irq_reset(gt);
>+	gt_irq_reset(tile);
>
>-	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
>-	mask_and_disable(gt, PCU_IRQ_OFFSET);
>+	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>+	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
>-static void dg1_irq_reset(struct xe_gt *gt)
>+static void dg1_irq_reset(struct xe_tile *tile)
> {
>-	if (gt->info.id == 0)
>-		dg1_intr_disable(gt_to_xe(gt));
>+	if (tile->id == 0)
>+		dg1_intr_disable(tile_to_xe(tile));
>
>-	gt_irq_reset(gt);
>+	gt_irq_reset(tile);
>
>-	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
>-	mask_and_disable(gt, PCU_IRQ_OFFSET);
>+	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>+	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
> static void xe_irq_reset(struct xe_device *xe)
> {
>-	struct xe_gt *gt;
>+	struct xe_tile *tile;
> 	u8 id;
>
>-	for_each_gt(gt, xe, id) {
>+	for_each_tile(tile, xe, id) {
> 		if (GRAPHICS_VERx100(xe) >= 1210)
>-			dg1_irq_reset(gt);
>+			dg1_irq_reset(tile);
> 		else
>-			xelp_irq_reset(gt);
>+			xelp_irq_reset(tile);
> 	}
>
> 	xe_display_irq_reset(xe);
> }
>
>-void xe_gt_irq_postinstall(struct xe_gt *gt)
>+void xe_gt_irq_postinstall(struct xe_tile *tile)
> {
>-	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_device *xe = tile_to_xe(tile);
>
> 	if (GRAPHICS_VERx100(xe) >= 1210)
>-		dg1_irq_postinstall(xe, gt);
>+		dg1_irq_postinstall(xe, tile);
> 	else
>-		xelp_irq_postinstall(xe, gt);
>+		xelp_irq_postinstall(xe, tile);
> }
>
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>-	struct xe_gt *gt;
>+	struct xe_tile *tile;
> 	u8 id;
>
>-	for_each_gt(gt, xe, id)
>-		xe_gt_irq_postinstall(gt);
>+	for_each_tile(tile, xe, id)
>+		xe_gt_irq_postinstall(tile);
>
> 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> }
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 34ecf22b32d3..69113c21e1cd 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -7,10 +7,10 @@
> #define _XE_IRQ_H_
>
> struct xe_device;
>-struct xe_gt;
>+struct xe_tile;
>
> int xe_irq_install(struct xe_device *xe);
>-void xe_gt_irq_postinstall(struct xe_gt *gt);
>+void xe_gt_irq_postinstall(struct xe_tile *tile);
> void xe_irq_shutdown(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>-- 
>2.40.0
>
