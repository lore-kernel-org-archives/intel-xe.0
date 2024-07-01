Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF6C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 22:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6775510E02C;
	Mon,  1 Jul 2024 22:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIwXttZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848210E02C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719873461; x=1751409461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b1VKaDph6LxPdMgvplQY+GSPCNGR4WMbrcJteCcX42U=;
 b=nIwXttZuZNHNGVA3YzCuhbj9N60oBN5HsjmiCC5eT2EDaPZ0xRfyS0f/
 Lg41CejDaxzrZrmh0y5d6OFWIcatUvGm+tObuLqReFmhdqA/W2RuXkczy
 YWGIaSxRrlbf0/z4Bnamh9QQaIuICv4BKI5jKksSXX1wi5DJdew00BHjk
 GM+tEcj6r5mJ+NE+Y9B7Ff44Gkcju9E8xLjAtUTKVAXlRjhuOQzy/T2BU
 UqctLcxD29SywH0bykrnFB3DCIJiZEfYGBV9XmNbcFehmKvKfoRlWnHQp
 fUSKXUwc+ucuG4/QifjswaSJ0/ywsICYqpmipVC3/n7nMZVxHpVDzH0qn Q==;
X-CSE-ConnectionGUID: u93sSwx1TaqtFcHJxkirNg==
X-CSE-MsgGUID: zQ08zdhsQ46VsFNV6TJpbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="42454182"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="42454182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 15:37:41 -0700
X-CSE-ConnectionGUID: vcWXLZk9S3iZaGWN0OBmAw==
X-CSE-MsgGUID: 5ZKZD9mWS22mAHONEJrOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="50626857"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 15:37:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 15:37:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 15:37:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 15:37:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 15:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqwE+aRaQgYXEiuvUQJBfZXdit57T9GiRXvun1OXHpTn7Qn2zZNX9pp982wkbKwUarnmJfbuMY4/YexSdzsd2zEQbrSjLmP/gwshWZA5HG1PWf/Japwwf0W6afHengo88pahBbYGgHuGjpp59iy7XtRejgbzJiy1UUqLvxgg8IAHwe9QHJKj2JmEKBAy5ww3w76M3pQl00J6TRA2rks5/IhAkKrSkCBmWkxYHVYE4YOm47q8pjsxfxskFC/+lFf/4ugISN0vm9qPu4bSKwVfoi98wh2Fvb9eebntGE1nEbJ076daKUardw1Pq6FchGUQTzHkYzKxKuEnGh4Fq8xKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtJZb/FCLJKQmBNpkPKBfyuWq3SkgMqjMcXEvsbIceI=;
 b=BT2H1rTSduMIQRgoty0AJJD8chqrQIVJU63uDfFLRjI+gF+wVnyup5ZDEGD94UipW6OHHWn56HKMP2aGaY6ee9yWEjzEaYY6chGMiVn2A3pgCd96TipDsEekP3tS8TKlOUFDkANfEpHOMoA7bHZgiCHEf4FvlirzXI7sTNrfIedyXmHc5EzB/ei3ecg7F4Y1UQhJCIRnVcpbo4asHm1ThVGEmVvBZu5uUOUBOKquUtLZ1XfJ6+KujKlXUbvPwFL8aEu9tRHzPPWWfEHR5HZY4Ooqb/A2xWRPWyLXk1x0fLaxbadiUJmNE6tgsNrtBPKmv8Ot3NXme83GkppToy9DDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 22:37:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 22:37:33 +0000
Date: Mon, 1 Jul 2024 15:37:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2lpm: Extend Wa_16021639441
Message-ID: <20240701223730.GF2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bc40eb-509c-42c0-212d-08dc9a1e6611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g/4Svn/+0W1x99cOH9DOfy4i1Mq5MD1SSJpKvivHSO6ySAwQ6wjC5b4T5ypn?=
 =?us-ascii?Q?h5hvJYZiFqeSyBCyEc/lTxG9AB6/9aAA22yhBZq4RS0fstX8K9NVMqri76zX?=
 =?us-ascii?Q?bHbBT5O1ahUCvDu+/5dDGssyqBpsMk6RRS6U86dLry1H0pObBK7K3XpyOlpG?=
 =?us-ascii?Q?Kz9w8EtASD5h5CtI874A21VlKN5odWpRrDaQUMlsU2wJZ7wfs5t1P/EJDRiW?=
 =?us-ascii?Q?CjVRUZ/d94t1QxM7LNozU2nWPm84/Sx5T3fJeCJa9jgBEHDd79NgxHKUEwcf?=
 =?us-ascii?Q?5FPy/R7EZ4xqdJo/cPtypuIdW7khmi00ik6escclwXsmQ+iE4O4xbM84H6+s?=
 =?us-ascii?Q?lBTUsCG0l/x8bo2IkJjFD/IGPYl6B2FwrypCAbZsUUVGjWbu6DYCDYNyQ4Sg?=
 =?us-ascii?Q?7J+4m/EngRZsIoEQ3cVtlFUkg4jtwC0el0hCtjG7FlGwAh60qsD0GWEbIzm9?=
 =?us-ascii?Q?o5bmFR0dZFpQw17JDo8aPrfF9KrjS/z2DBAAgERW6sVNVeRYRfC/95Q12sEE?=
 =?us-ascii?Q?YYPmks+P2FMZhPouiDz89Be3DaWhfFxz9OUhvLRUTgr0WTf4/el4jadLyg1h?=
 =?us-ascii?Q?pvlS/DAX2kAbcUFLlhUc8ltpKmpSN/y4CfyX+e+YFkabuxj8flfoGvJudSR+?=
 =?us-ascii?Q?E/CIrvQrhkYWesCiEchWN3qYPccWKdjop8x/Ws9Ih9b6kGl4fR9Vv9UAeSET?=
 =?us-ascii?Q?z6HleW/naA2s56bgaM+QFLqA4LwQ1HDMQOFZTVMlogQN/7/PFq1dI2MXxmwG?=
 =?us-ascii?Q?kZsMQkIX3KCXGBipbaycH05RbeJgmbMNsfPHDAq9UKHymMwo9UzcaonjWyXA?=
 =?us-ascii?Q?2mM/k2FDixS12MY5erN0kk+x5P+HnPrDRNtHtocOpNgSyrmEamFodY/N/bDT?=
 =?us-ascii?Q?d2PVfESHNhO58Po7DAr5+FCjtUF6XPLEPQiEF6NRoG+mvC0vRoDT/gzjWG0m?=
 =?us-ascii?Q?EEA+BrCV2TT52MqBjISA5hbuBP3zAYVuL8tlZ2mj1rUNbwzDxJZ3/ll3rxn9?=
 =?us-ascii?Q?4hs3oBlSKmXmWbplLFnKgaguoO2hD6ce81p7GbTcsFy/mDWuuekw9ywWDTbi?=
 =?us-ascii?Q?TELwGbG3zysOwN4EPidDbC7yBTTuT7fvSpUKpnr5bDaFVSZBPfsORBITZ1dM?=
 =?us-ascii?Q?NZiTqwW489USIMHLGi0ko84fGG/u5sBgZ+cX6JrmJTKGvJHBGa81Fp8O3oR8?=
 =?us-ascii?Q?8Vy2Hkun3RiX1PBVx8eSk8ssurq0t3uaByUD/qPo5vGVUjuGpmUZOxgqfYvR?=
 =?us-ascii?Q?GG9R8o0CcQFEi2TWg/DhDGQlJnZ72ND6iVtHhI15VQE9uUK+QLfqMbb9xL8y?=
 =?us-ascii?Q?uwlpFiyVpvDJgYMPPP/az0L42JSHqwYuiqBSE5eBPzEyzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwXRvyciBcO5/1Ur1SsTzMYWJFYER65VELoL9wEiAJ/VS60zb8EeJBTwZtEQ?=
 =?us-ascii?Q?S0WUkXuprOcDVBECDjJdpfiqZdzlQxNsgPB1vvt7E7LIL7vvtazjX+SlEkjg?=
 =?us-ascii?Q?SHvL4EKCNZfDg3LfEsXDLG585sJoqk4HmJ7cByt0owvc+O9fU0hms+usH1F7?=
 =?us-ascii?Q?0e4ZMFe2TDUiJwubm1nv5NDzp6ImyTDuEtsxMXTGYypBX/snE2gabXF+UoTw?=
 =?us-ascii?Q?aU4S172JfXFh4sA1tf0oKebBDbYVBqqEkFaQ6Z6oS3Ey6xoADoFaUfwNN0o6?=
 =?us-ascii?Q?qS8p41+E606Zxd1gImQhQw7TspWxlRNasL7872Yz3TFMN/Ff+Y8TPA9m8kbC?=
 =?us-ascii?Q?WsqOKEwwA5ewb/S+LssNkajX1Ub7G57kz4vo2KnW503UWuEJ13TbTmfP7fqM?=
 =?us-ascii?Q?2yaPtXvQfnBCHAIZ+NTZL9ZGxeaqIsowpW9AovEhmBPzJmtj6RGigLVrcqc3?=
 =?us-ascii?Q?kmOM4OXT7mBOyTV3Cl0PX7LI7irNh0ET1C2tFHdB8ExudY+JBQ69ld+nC8qm?=
 =?us-ascii?Q?To/LjiUO9PU6/i5B5APpoU6tiwqKdg69osXIrFZ5OhwCpiesV3BDDf7dZwx8?=
 =?us-ascii?Q?xNOiCQCBuGRHBeL+2lPHaU2i3hNS9cxq1WJg088hS9xjNE+l9T4DAySQ2xPX?=
 =?us-ascii?Q?CXrMJMJTJRSB5gasdrMpoXMmPk+AguOWmKAb7ZN1LrskswfxkLtH6kIRLXj9?=
 =?us-ascii?Q?ngfAwYxmdYm8y3A+Wa7vqGXkefvpEkXVVoSkXa1FWfb5dmO4jzGpx5WSxtIq?=
 =?us-ascii?Q?0YNOrZHcW3FMq5DGV0n4hJ1RPZ4djGcpkOdyM3KQbPPaF0KWSWIlYCIelQpu?=
 =?us-ascii?Q?T/SL4t2DxVANN3lQMFMKyBe03GwdPNq+ldjXYpHm3AVRiRNE2qZKPupaJPe+?=
 =?us-ascii?Q?+Pq0HOjVZGdUqhHanz7BARpCSKlV9PsRQcn369B+TNj2s0shTIBX2krcpuxM?=
 =?us-ascii?Q?E+KSUsq7CZ1NV+hym4u7EpUDQ7NjC48yH0PqRj4cfJ5HUpXn8eONsg98vC8B?=
 =?us-ascii?Q?LVNvbc8RGE8GKomK2vR7JrD7rY1GHwUpb6cQnReVt5mw5QQluJoyKrmq81/M?=
 =?us-ascii?Q?MfkH6XRnodpaEulfmFMh5Wl80s++Jk7KIFbDpv8OVf4UoDnpKrgpwAzjVtoI?=
 =?us-ascii?Q?ukKAwwL2w2TouLO2yUy5ynwxiloou58EdAGMjGMj6TwjKXcmQvR4wC/6ZPrW?=
 =?us-ascii?Q?jR7GZ/FSUEkgGuDlgaWH5OSitWkk5ImfylHHt7paJRdbvuNN2DqbTaglGjWk?=
 =?us-ascii?Q?zdQuo2ikeMoyYfd3tWdYhrZI3R+KdlSU1oqf60+AaLHqpapVFQgQpZUrdzmQ?=
 =?us-ascii?Q?FIBgPpFIbn3kRUKhpHkMaPufUOwpl3YgYDxP/NLwSPhQ5p48+TzN0RlV/V3P?=
 =?us-ascii?Q?g3Katmlq/J0IO5Ym59rckvrRpQ1xoZOeKb9hVrLnJDDI1XSZPvgHBxpTBw/k?=
 =?us-ascii?Q?pC5e4I7nJV+kqYtJ9AAni0qhdeY/aqUp3CI21JeBi2+KH6/ut6be1u9wRXY/?=
 =?us-ascii?Q?kokjoqobAJIFvas7xB8VM7j8Oblq92mTeY3XSBB1GhfVkLKFCXOV6m8ovlvk?=
 =?us-ascii?Q?I/K8K3lFdZIF6XJfZHv2PGBWQvRa/YwiB9tTAlMZ5qFWslTlci5DekhdQAvx?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bc40eb-509c-42c0-212d-08dc9a1e6611
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 22:37:33.3388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSmXfs/ZBEcbQPP2yMHQSL4/Q25SA46+WuAdkzN4frB9PNpjTrCbZB29ueoXykkLXohMClS605S+E3ruMWahkfbgoQMxnnEtewzKrnUT6Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
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

On Mon, Jul 01, 2024 at 11:46:37AM -0700, Ngai-Mint Kwan wrote:
> Wa_16021639441 applies to Xe2_LPM.
> 
> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c7bf0862b231..6c52d9d02b5f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -539,6 +539,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("16021639441"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +
>  	/* Xe2_HPM */
>  
>  	{ XE_RTP_NAME("16021639441"),
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
