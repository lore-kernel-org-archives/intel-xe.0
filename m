Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ABEC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B2210E2AD;
	Fri, 31 Mar 2023 22:31:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7A10E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301863; x=1711837863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cmCIYJsdJ5gnQjsuWa0ruobzTLZ0uYFmU86qwXQVhPI=;
 b=eUgqBTesolEbj2xoIAjwou2a6IGLun7bYJftEZRa6FhzoadcenIxudYT
 RpO9OmDd2ujsJI67zec46u+LYxxDkasI3v0urjh8erpKNFAGe5EM6xusv
 p/yREhexPy4Ravf1w2xRkUCj4oxJ/TIgBIDy/U/P7ruAmGjJtLaw5l69L
 y7BiM1wYSjqkT96Z0ta+i/uDUCiL6+GxZKVov15V+Ms8rdzqbyUVfvvrG
 iwrXtAf2cVsLfargqAvb0t2paI7JrELwTQtb64DKjJMATrr8PSFvREk+S
 7k1DVkPPomrs3zjj8PmlJh7w5wMV2RyQJDaV5v8sK3Hd+WZey42TKDmsl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343240153"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="343240153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="715614685"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="715614685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 31 Mar 2023 15:31:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:31:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:31:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWDCwANadvGOAa67lhROR7rBiYI1QTqZvJsQOe9ADJ4A/Nr/FpI8D4H2chNnC9wRRd1xC92UoFYX9z2ei4kDJprmVTZ8REHhERLlkpArRnNN+0xEAh4LD9+MSt4sve35iYkVZq9obxD83xPymp4DE0ox5tKPc5kFWN8ptJH15jU4ZTrY4m8/K0t6M89LstVYGaZXFCWGgJPWh7ymFfX1GPZRTk/mXlqni87CvmCggTJ2+MHvzI5X+0fm26unpwOKCZIGvdtcJTMW9kY0hUftvlmmanSR81cKgba/Pqjw9VJnYI1a8+tbH9ieYJ6mtXfjsw17VmdCJlffG8FmSMSFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLVzSEv72koQtcPD1qC0Fuvi9eojVTbzs9kNSNksUJw=;
 b=lFEpV9KE2jC0SdjpkQDjgljmxY5mBMVNigesWCCWZncnE0YOgwqU+ldvQC+2C04uu97SI+dzUBbgmQNnm16dHTsStii4V+9U/9rYykMpRGNCrSc8AQz4GohDxEicothppNA0z9HcONAp28R+ET1X/z+5OAa4d+6D6sfgqjvDXziHU7rurThw8QIE7eQJGMp8D/79ZI5WqxHUaeTYAjiBBGKlHAsfbcOr7veiS6YVGKXdWWdoxPGW/+guwXrD2/i45hbdeBs9rOEJTdgFO7vI7s4gdXdjxbY2Xj+ckyGNgqUGhy/rb6xjTKCxw+ALsE0WjEvVgMrckiloRYZqY3CU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 22:31:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:31:00 +0000
Date: Fri, 31 Mar 2023 15:30:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331223057.ldxnrhi7fmxtxnhg@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fba314a-8406-4839-8734-08db32379a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YyTfWELxg25KAC8RSE8HWhNKgqq5zDzbbKLPUiq4W1Y3ffVOwpNMUohcPiJkioZWdl2C1pwV8T+fVmswacHpZ3MVw0eneiYY/GNrdAQGNA3Vdhtck2ZS1qN6XXkoIxx6q4kl6iBq8xjqjBIZhRnnNfAN9eu2Z2axNoyPjeViaZs/a0tWOx15CrAHQterYTlqTjg+WDAGRGvNYgeuJGC8Sia6HxKQc4nbM8Fqbfpd4PPbh1O0lsvCmjoQy/8a6N0sJNut/b398cms9EarDudw3iM+j8ZafNXSVHT4c2jwsVbDmdBE0VPFwd3CY+FVUShu1Ew++5eyGAgUqJukAb5Zj4Sd5H+zAnLlLPnIzqyfe4a8Bz7CPuN4BTqd2n16is6dKEcY05bda2vo5LhmNPJMIDczHMyOHos/4WXjcXzJD8/Pg4mPvLXUMA8x8K0nN8wf8clnykpeTczbAlZXMh+ZAAJvw0V6gXoTK/+pGUBvIdooLPPSNblcJP72oXCNw3q9GEuAoA+2vbO3NLvdZbRDhv4CxUbg62es08NVcdTx7D1mCcXChntQ0fKL/3/Ama53
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(66556008)(36756003)(83380400001)(9686003)(186003)(6506007)(6512007)(26005)(1076003)(6666004)(6486002)(478600001)(6636002)(316002)(8676002)(66476007)(4326008)(66946007)(38100700002)(5660300002)(8936002)(6862004)(41300700001)(82960400001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwbLLSW+gNS8elhA8eRzbSOa5Z+nBfQ9tCNTJ+2W1cscy80akLXUJqQoV3fn?=
 =?us-ascii?Q?ovon2QRB989SAvdSn2b0YS0CDqgQZgLN351IXGA+TWMY4zzfy9vcpbnHVNjz?=
 =?us-ascii?Q?+IxDdtg/EUZr9umMsdWdaowhmp/ZALaopkuNZkdOhFs+pR3eAS+eeasvBgQ4?=
 =?us-ascii?Q?7AfGACRQv7cAdxn5mBtb1mV6NPHv4RgQ+adgd7RfJ14swWoybxqEVqmPLo6T?=
 =?us-ascii?Q?jM7pCrRfAsNpY7E1JWw4u5AdeXumAicSsYgZNC7Gu8k6u+UyaX7KAMOJZSAr?=
 =?us-ascii?Q?8XDkWgMIGfp1k9bFsF06BELFPIRUFK29gB4r+nhBirw4g1ZPPhUjgudoEFOv?=
 =?us-ascii?Q?T9DIct+MEBM9ohKPFnEP9Y1QZseWiJdZVgFaDI9Pl8VAou0XDMlqs6pgqVis?=
 =?us-ascii?Q?8ViICDSrw/s1wv9uJ88w8+LVcpZTh2f0sDInSxHXt7IBpGvtAH4lTY6uszbQ?=
 =?us-ascii?Q?L67QKhdi6FuJeUTgtDj9Ku/0jrGU7KRSLFSyYVz789JSQ94ig8gubRoq0H8u?=
 =?us-ascii?Q?VM49a9lu6i6tpivdcYXJvZZNA1SxMxn5+njZa9hMOVZqXIJAgiKctv158QNx?=
 =?us-ascii?Q?ySd7dz2bYJffqfv/I5SuE7+aQOWRq+yY3SEYjzteP9A55KJoIY5OwGinNcpJ?=
 =?us-ascii?Q?yO9WjBNFKtqq8xkQSlCMsVw3ztLl38ZkXr9z8y/6rXe56KNP2wjEtQIVL241?=
 =?us-ascii?Q?ivmigAF8iQr3WbeMQjPylxG4BXVH38HFjmyT3nEtBoNEUzfmhQP95c43tSDQ?=
 =?us-ascii?Q?4VFQZHCTdZpND3xrlXfmcWDUBK9UXegexTaG4RmQSr6WzUCR9BEirkJZMMFe?=
 =?us-ascii?Q?C0b+g8kgOHtre5V0vU+1QDbNWl1Q+IaRx6VvWUIQFTV2R1ctO2pdqKvHH1uN?=
 =?us-ascii?Q?HIxq7wJEt3iBHjAwBe+NJo3Oe9jU/s4/OMVGxjLIbv79eEogHVHzgNt4UKJf?=
 =?us-ascii?Q?EJeDFqB4dODx1SysyXAD+OU6NtErmcgJ0tzeewUHB5ZtUzukNkUknnL5U+iE?=
 =?us-ascii?Q?WZree0HnoT1dIla5zxX3RYsIUyIf2j+zIknsNzdgE0hX9GOGTs6VrFWVD/W7?=
 =?us-ascii?Q?eUFDkLIcbKuqZ8Jgb0YvSG/quPnT1zDLyAC2Bk2O0Q5DCeyifU/y6JM4IZzY?=
 =?us-ascii?Q?nRc8ROwsQCupjp1aCIrWtL7esJxhxi+QA1DDMVf2gVYoIiL9BrDyve2t5WeW?=
 =?us-ascii?Q?qORwCSv02OGWNfPwuIz2T3wk/xVhUOJqtBaCb6OHSVI3DT5a3TbYj7EFcSxD?=
 =?us-ascii?Q?gEI+pvDuO1jHxF6uE7WZcu7+wVR/NT5lBL+TFPw/1ZBB3QMjU31jwEU3Fu1C?=
 =?us-ascii?Q?9Ae3conAwV3s/J6D7lQpbfy3NXqw4PyYTmpyNzH0V98A3BJ9ydhJV4JK9Ku0?=
 =?us-ascii?Q?UnENQwl+HWeOCOam4h95R0wMohqL3MnWsoWTtpEU86fmEBRGbGIzpvLtPOTw?=
 =?us-ascii?Q?amqZjLl7DMebRl5+ub3d5nibhzbCT2CVrTUZ4gNUBmHKFHmd5ZHcfTNISyue?=
 =?us-ascii?Q?ogc7VbU1paKD0WErmAk4VjACcY6tQPFlPyFuVRieTZK5KA5+2ulQx27AZ5vU?=
 =?us-ascii?Q?vKzgiJmsb2tHWp3aJepW5bS4wGCHQPZ07uwxc8mA2fX1B9yIoT4bTAmiv+w+?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fba314a-8406-4839-8734-08db32379a71
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:31:00.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXuS3hqDmtcl2WVr6AR7ePIhIfCL3U1qPSPU0XpTc+2KUciL/9EEsXBHLUdXQSzAV0l15NFmMAlL99Y53B7eoLFOXDd5xqENLT5HLm4kb4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 8/8] drm/xe/irq: Don't clobber display
 interrupts on multi-tile platforms
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

On Thu, Mar 30, 2023 at 11:24:05AM -0700, Matt Roper wrote:
>Although our only multi-tile platform today (PVC) doesn't support
>display, it's possible that some future multi-tile platform will.
>If/when this happens, display interrupts (both traditional display and
>ASLE backlight interrupts raised as a Gunit interrupt) should be
>delivered to the primary tile.  Save away tile0's master_ctl value so
>that it can still be used for display interrupt handling after the GT
>loop.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 02292e60e52c..636653f4e7ad 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -347,7 +347,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
> 	struct xe_gt *gt;
>-	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir;
>+	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
> 	long unsigned int intr_dw[2];
> 	u32 identity[32];
> 	u8 id;
>@@ -381,11 +381,19 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 		if (!xe_gt_is_media_type(gt))
> 			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> 		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+
>+		/*
>+		 * Save primary tile's master interrupt register for display
>+		 * processing below.
>+		 */
>+		if (id == 0)
>+			tile0_master_ctl = master_ctl;
> 	}
>
>-	xe_display_irq_handler(xe, master_ctl);
>+	xe_display_irq_handler(xe, tile0_master_ctl);
>
>-	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
>+	/* Gunit GSE interrupts can trigger display backlight operations */
>+	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
>
> 	dg1_intr_enable(xe, false);
>
>-- 
>2.39.2
>
