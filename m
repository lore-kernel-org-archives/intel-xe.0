Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFAAC77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 22:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526710E221;
	Fri, 14 Apr 2023 22:00:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FFF10E221
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 22:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681509604; x=1713045604;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vFSRVoVFvd7dLQiojDqsLbz2+2gIw8B314lJi41YF60=;
 b=e8zwrx8VmKfBpFaN+AzFO7rfGdvSIe48+5TV+1uQA65vPUqy5XDHXcmP
 NKjOk/CwG69MUMpM8hvX6pDDa5L+mUPbmVKgp7VA7nYlhLX4S/Im0d43A
 J4QFgnJuW26F8ALjKPycgVtKKZtvlR/DJrMfLzv/o4HNXXMUeOT7jnhY2
 VNVsAB1qIJEXwXl+HcosSP1Xr5GlqccrXAF4ybs/OoqVZGwYAQe6VqnMj
 1ndHpI2IAGALDB0Wd1yV0xSn0m7V7rYaKWSgL9g4Ui5F3gC+TtjUQgME0
 A+qpXZ7sQMIqtX54iHbKLZmV88LmLaWcHHHxPON4ckddQMaDeYfCxVpb0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343335573"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="343335573"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 15:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779345673"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="779345673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 15:00:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:59:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 14:59:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 14:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6iqZRHBVzctaJO0qbVD6JZfmyPZdSYyqyeoY67R9uSjQlE7Zz1e6ujLlfKneceBzDpnDwF6075VAKivhIUd2ePLHBB78yvLAj/69fASOkON1ChzbAVfyQ4nnD1z2fuJIckuBqapgbcu3G3q/3l2D1+yTg7ngDBv2xPi++gj3bMxo7wUzOqE1AoqW9Y5djJ+s5mFOfztHJhOKmM6LAMtBWMb38AjZii3ESjQM/hR5FAGAzLLch7uY5OsdLadmJBE2TKOxNRaMePyoQ1rKzqJPev7uTbAH5W2HnjlgIF0jeovzZtO96pUb/MCat2LGWLW324D+2jTaqWPQVwhi9L6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcOV5EnxWAkyn8cMd2wIRUXCVNAZGhsWwWL6koEzcuw=;
 b=L9KVkdGHDOOcQcsj/lfJ+LTQ+A4g46Utp5vu8+q4BQ2B20fxgMI6WBosPpM8BdDlKbrHQgO0Wfs/q8TWQPJSUefQGMlMRzr2L6WyylFZJX3tEqjz9bd65veUdD+LDQDKpMD9ZbW39CT/cZHbE9/26NdzmpTAjUzJS6ZSJrc70CyUnaU6+LZvqDpIZ2seYSZJcJDit4vUPcuwy1LV8vxBpPu+xvlZAEe3H288fJ77367tR1T8E18ZIFzmWRUji+pLY0KY4M+bvI5z5wo38bFhizwZQOgy3JpVxv+HSr9aJyskut8aR8pPxoOkUXnqiS+azTyXLGYqAN4wWnIx+HW9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 21:59:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:59:57 +0000
Date: Fri, 14 Apr 2023 14:59:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <pvlaxodbiqhygobzzr6mlhmd3olalqsevsrqendc2tzds3qvlz@b5paj6w74nyq>
References: <20230414193355.143875-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230414193355.143875-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e3d93e-fe41-4999-5fa3-08db3d3395e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwzGREYT3VrZ/klqtH6SYe6tOYr6dQNKytHuPRvbK3tcf3Ts3+6V+qTn5efSdWLHAWAIBPCkcpN8iDkjU3ZF+rDWAjdU4lXutRcpNXE9vF4CfDVTWS6X8c/dZYqvXJ9t+x5BeFzqQcIqiajakuzibU/4hDNQGEZAxyBH2XljI05MlXqX6yIqZXB+7vNTIMhW+O1fABreo+u1ROCbkRkAnXSsu/ta6OEbLqkuo4mFI/F+hbn2FnxF7lcOGred5jU9wmgkiGnLqp76jc8P64MKgK7NC5KHm5mTh4crkKBEihPKLa/NALKnUGa02ghQw/XiYNRIzSqRtJZgn7bossx41uooWHP26Tr2zXElmX5yZHxllUioFxVVk1YMlePmiv+7p2/B2ZC98r1CxqU1nP225uBTG27eYqP3YLw6R5rU6Q2ZMxHTiQPv2kpBjbsEHK4998B4XmPdZMA3YZwOEXIC6zXtqiILJ/HVVJjE07FmdENtgCR0q9fE9V8/PSCBckaJv/OpozkBoznLPOCFOas9Vv4F0Dz8GuHff5YWwZ/JelLrSe5UI635OhXdb/KKouuH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(316002)(4326008)(38100700002)(82960400001)(66556008)(33716001)(66946007)(66476007)(5660300002)(86362001)(6486002)(41300700001)(107886003)(6636002)(186003)(9686003)(6506007)(6512007)(26005)(2906002)(6862004)(8676002)(8936002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6jPHnrpqfphisVtb9ivBMAVs0OAEd4wSIFfNkI2FyPQbtyAbG3hQEFTi2Q?=
 =?iso-8859-1?Q?PPeMImfDC1bQT15FvtweTmTqRcan7Slv3C6S/1C88Y4yXyxryuJOpyDwAO?=
 =?iso-8859-1?Q?4VySFGFm6zgD49mH18Gy2enba6U8vRIUpOZjg0J+bnu1oTXln035XeVNmD?=
 =?iso-8859-1?Q?pLVVRIkD+mGsNweUYoN/wQE79KLb2EwAGGlkfG3NrKdHNviCKGNZqTdo3z?=
 =?iso-8859-1?Q?l/uznFJG8+K6/J+6Z4+wuOT0tzhEjreAgqDpiZPEA5/pkLQ3yKlkgs0cKN?=
 =?iso-8859-1?Q?g2X1sZ9dsdZ487S8CdJhjKdPjsi+BMByKOAQwZp+fmTEqTtjivLszxlewU?=
 =?iso-8859-1?Q?a8Zk2fQaIzPExfyI/7xehlXWBPl2HPQnlnkQLOO7DDvv+euMit+4UMvYvc?=
 =?iso-8859-1?Q?bPv8uGG3n7VNuXZ3AlBSlL+3sj3/LBqaIamzrRW3WZaWGH4C9xyeFlWt7R?=
 =?iso-8859-1?Q?jBhY6AhC23AaWWQdvAWk6xRiB3o2b6GBj5JkzKBOe+bS9EG1DqVDJuaJIR?=
 =?iso-8859-1?Q?HCnYJK64SSjP3dlPHwGFXZKcK9F9n0mcPXwWdIx/SOTxVw5CXQL5XMwqVD?=
 =?iso-8859-1?Q?l/R+ekg5lekuQ5d/XVNgcZTmYHaUJrMItzXk11tSvUFxbSqlo3VwST1pfE?=
 =?iso-8859-1?Q?8HyiS0NLqRHY1MmyP6XJmGrXm57doeKYS3Mhs+urTygYSn2mO3ko9CeCgT?=
 =?iso-8859-1?Q?orjqsDvLrpu/9F3BjAirz0+ohBXWlzSKO2pEU55xMlOnH7qc52jkBYYTjH?=
 =?iso-8859-1?Q?rAY9T5mEO79mdRq2gG3gwoo0RBSLJgrg8eEXWALlyk+rYFbineUpQOjEt1?=
 =?iso-8859-1?Q?0ckCZr5fWhGhwZOanUidrNV6IkkQ0qLNBIYqRZwXFml/6m8+2yHMHqpWRM?=
 =?iso-8859-1?Q?xe32c2Y4FxokbI6LAcd5f2nPuoL7Y0wvectvXd0us4srmm3TGZ75JblBSk?=
 =?iso-8859-1?Q?1AdHmAgtDoRPmFGvJeBfVkpzh9IbRUh5sqSwvxJmXXVGpLST5fzwBGnEVR?=
 =?iso-8859-1?Q?0GLpsRE5tYlwmPc33Xm0CbHYnKbJJFwcQV74DQZbMoa39y+sBmHTGf2xvM?=
 =?iso-8859-1?Q?7DGmed6SIjXVpnJI3HfRKZUiEropYSlDY9iRBBxxsrDKn9NCfFOY2bau/h?=
 =?iso-8859-1?Q?CK0jtQFdAJhMN2h1UMHy/jefbuADAHTOIv/tAXB7lrT76fi9+qUtiIl1st?=
 =?iso-8859-1?Q?7ghXA4UG/YgBm6wQ0X6Y3kPecJP/WmMAa2m+lELjCGmYH1NpLyGPiOaK8Y?=
 =?iso-8859-1?Q?huk/13C6okYJyZuKhDOThYqkfB575d7gTT2Xdvd8hgaRnKqVFj4EcVycY2?=
 =?iso-8859-1?Q?Dxq7/7kFdawivckOn4xGlCuNjuQl5DMyjOzviYaVY5kXVLKhUqaCR1zeIo?=
 =?iso-8859-1?Q?qgzdnZCD2FEP6/0cCpmEJ7tXA2OaeE28JkfRGbu1IHLb+KTVhTGWFXkJiY?=
 =?iso-8859-1?Q?DBe4hy5wyhBcdVCvWyRS8uDbVyUCnr94FVCcA1XKJTR9s2bsowR0QIIrkh?=
 =?iso-8859-1?Q?aZmDqc60qdPQ+q901n9qcIPdAzGg7Sx4Kz8qAMow7uxFZAZEgpXjzz7L+n?=
 =?iso-8859-1?Q?QF1X1MjBqCYfpTZUewwJ5V+I0psImQTaxcUlzDGGdFZuRVrvbWgfOs2epx?=
 =?iso-8859-1?Q?1I1aCfBYLJYhLFvUUAfFNexNiV1LS40/VxOF5GgY6v7bkuI0jDv2cjTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e3d93e-fe41-4999-5fa3-08db3d3395e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 21:59:57.2734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSaZnoi4kcrQKz3/P8GInRDhQr3RZorLNmHP9qe/3U30P18t+T3+h8TyCRjtKVa58jXTpKDtbm9IcYNiq5ipPj5gX/iahkO/VptG/wCeJUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org,
 lionel.g.landwerlin@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 12:33:55PM -0700, Matt Atwood wrote:
>Force indirect state sampler data to only be in the dynamic state pool,
>which is more convienent for UMD. Behavior change mirrors windows
>behavior.

Better than the last sentence would be something like:

Behavior change mirrors similar change for i915 in commit 16fc9c08f0ec
("drm/i915: disable sampler indirect state in bindless heap").


BSpec: 46052

>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> 2 files changed, 6 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index f174758d8307..b7324aede6b6 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -286,6 +286,7 @@
> #define   ENABLE_SMALLPL			REG_BIT(15)
> #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>
> #define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
> #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 27cf1330facd..5abef45a10fc 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -26,6 +26,11 @@ static const struct xe_rtp_entry gt_tunings[] = {
> 	  XE_RTP_RULES(PLATFORM(DG2)),
> 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
> 	},
>+	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, -1)),

as noted by José, since we have that define let's use it:
XE_RTP_END_VERSION_UNDEFINED

with those changes:
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE,
>+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>+	},
> 	{}
> };
>
>-- 
>2.39.2
>
