Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D298FE94107
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 19:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA3D10E031;
	Fri,  6 Oct 2023 19:23:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84ED10E031
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696620223; x=1728156223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hSAUsDXwbXnesl0bOTtNjOfD+LmY2p5V+Rloc0QSZ6M=;
 b=Mh6zFwHyKFS8jxGPi2tcnt2r/sPAM8+JvxPv++Fl2D8tVVG7g3STT9lV
 fbQEE9MWF0S6pXmvLtXQCu9BjKNfCqHTkA7b5TrBFfdEs6g5DiPRVBLhw
 qU7f9yEJFl+1faxpRsfVPjqGauzJlgm2aXyGFnGACtl3TRhi39ZPuyE9F
 uSrGf8Q/G0Vzx7Sn3CwaEi7ou/kFtonlwUYmZ5PRdY/glV8aqu6r2P6iC
 JzWJb8qWOzsfZy/5JyGP48cumrPWnhTdZZuSdmajoQw1c6zH9+hhsAuxI
 3FbA99JS17mKOLMzEoTSj+RL5p+lD2TrLXxBbOlcsdQC8rIKh9Zqnr3VL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450311020"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450311020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="781756630"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="781756630"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 12:23:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 12:23:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 12:23:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 12:23:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 12:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJTcit4QgU1xowCDlbvnauJsGzdLNk7NncVtIhjCGd4gyiuIMbKBR0Jlrq8E1p2Ycs9MwT+Jb5dMpMfpAn8lxHu9Cec+bNqWlKFu6KC3z+dSbssm21CTXxD0AftAF/6lCvYsawI4m37OIwIK1jkhMvbrXYGNXObeMEgQN945GMrMQxvMRA6/SptnsGw3OLBMaN6AC3b5w7VgSsj4eegdiGEr9My7IO8+Ku3gPV2KAcYEUcacbVCG8ZuR5qXDQT28DUWyKfndXeVck3R0Z7Wxr1UAT+nAq/c3FGnnIPOX14C4RV5DH5+Iab3kdGewhMUs6vnK7eK58BydwWoV0T4q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfHCuHsPORxZCwvIEheewQA7sNyU81mk5UE8WRX6n9M=;
 b=GttV4gPhy4w1+n5AMi161Rm2S+oX9tGayo/ha7mss/F72DEt8/WzfsI/kGBJIrI5E/FkdV9Qu5d1BhHhwhHALp0q8/lcFmjPgF47DLcS8tRswEHbUSnfUMNCTsk5MqvgJ5apfvDiPbMSfgobpZUadze+1/bNTl1dN/Hwa8A0ezO4VC6SAkAvTlE+v0vU8l1c1PC0VLbB95alJoCt1kGf+PKxil5zEdgOxyRWb0vk8r0E2od60I48Hijj0GmrCDHk5e0IZqr4cqety6TtBnomXqA1bHuh/nMFCzI2eRJcjLbwOGNSmkBwkyJ8ZsP/cllLiAEuHvV2Aeth3akNPNWCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 19:23:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 6 Oct 2023
 19:23:36 +0000
Date: Fri, 6 Oct 2023 15:23:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZSBes8qYJB/hv43D@intel.com>
References: <20231006191939.78251-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006191939.78251-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 56077074-23fc-4a27-1e2e-08dbc6a1bc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTWcJcCycAPy4CwWCk7zEFmUYXVTzudvE5pUm/EQNz2NYaU4cBdvf3vnQ3KhEkIp3e8yK5Q71BlSZjGDFi3ELyrY7jyp4TnYBzwPC3+I9HsxLMrasPk8S3G4KIttP9IlaAlViIRvGMYNf+XZjRNHNrMfPhzHq3QcYmJ+4P0rm3QsgN7sU0uNzRYgjppHL7AgDQo1nCoZCbSm1rO5eY8mg6XdWl5F8s6Md3P6M7s5YkQdn4ZpG3reEWO+2o8IvB3zheIQYzutycgeNqeeEclg2VxozfLw7259ABeA2l/4v7Z//aizRVrd62sNZES13qIIAXO8lUxU3J8+rIkxOcVoOGdRfap7SKdVmhgfjVeqLIZs8JrqzHedcH/9EfYDM4APnQU6DQjU70OLQIuRR3K0kkX17aCu4yf1Oa5sqf4gRd/NBQVHBoYvUWkIOOzY1IOBTWA74wk67X48ZIxbZTZyeb5EJJQoB1/uAmrxGNvCZBw1RPKL+tATZcO55P6lgLEYu/J0Puadc28xd5hJ8B2+SZW9L9QLPqMyNbsFt/Ijuu/rZ+p/5lGVYo4JS4E9hZ3D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(6666004)(6506007)(478600001)(6512007)(36756003)(38100700002)(86362001)(82960400001)(2906002)(83380400001)(26005)(2616005)(107886003)(37006003)(5660300002)(44832011)(66556008)(66476007)(41300700001)(316002)(6862004)(66946007)(4326008)(6636002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/i804TbCvWAr1OkM1EFfxKolXW1ARSoZuDhs4zRlgdgIJNHj1JXJGRgnhr?=
 =?iso-8859-1?Q?NCfBcXPl5KXDkVZ0sv+Cg6/5pcGaITWMbdnUQ2BDD/KZw+47RIuRIjqASP?=
 =?iso-8859-1?Q?xhK8EC4CEO3Gef2O9sbo3znHCy1qnp8X9TaBf0WuKVPvHPm9RixG3bHlAm?=
 =?iso-8859-1?Q?b8vUYqnwjLxu8gTWT5PNQDJeFHN24zcqi4oKTrDGdbwTLblU53HwYqjHXk?=
 =?iso-8859-1?Q?hw5sGvSASXpaQSW8kXwrO0tggHn8jQzFggpr6aIuXAVan9uJVLPWqF0TcL?=
 =?iso-8859-1?Q?Utswr3ZFvjUDvel/SakL37xtn3c9ujV4ystSHgRrFfLZQXTSvfDCfx5NTv?=
 =?iso-8859-1?Q?4dq5Wjzqc7vxcKInwF+TwqB3xw5OkLxrJ7mEW8qsGKmyIn9Qm9UJ4sGjir?=
 =?iso-8859-1?Q?k7Dr3hGmhuYMJmSrQuN0tM1Tda4Mwsge6tcvTWK7SBumgN90AskIbULVQa?=
 =?iso-8859-1?Q?otz5KeMc7p/qfXgIyNDBMOvfl9b0qYyytIpTjLxEqs265/JTbERV5CbdZ0?=
 =?iso-8859-1?Q?fH3MsDvW6+ny2AOy22EEoPmtMsQUWPwidPBJIqQ+fMYXSvaUknuVFD9CN/?=
 =?iso-8859-1?Q?GO+Usb96NY8V7grbUTxwbzo6SriCM6PQBWptdi7qH8NRFg+L8vADI0kIHB?=
 =?iso-8859-1?Q?F1wD4/zoke5T7hAJe8GdgBmWqaHl2NguLKKyI2rTEHEM+ZZ4tOP/rzDdFQ?=
 =?iso-8859-1?Q?gJtAujVPhCtxv5iRlxeW5+ueSzXjWs/W2x37iWJEVY18spPACQ0gMtMlVy?=
 =?iso-8859-1?Q?wrVBhuFMZaCx8xL+k268JNizuCF217H3eQgoJfpQuGl4Qbs5SXIgBTOE/n?=
 =?iso-8859-1?Q?+ZOxEPvjNHznGVDnDqGUhwkaqSFn8YfyhYplU5cZegSlB8eu3hmVVdvWhC?=
 =?iso-8859-1?Q?2DpVX4xWiDeaUBngKaAuwr115y+ovS3vrCwZKEk35eIfO7BgeQgXAhcXyQ?=
 =?iso-8859-1?Q?qxnBL7BGgXtGg6dcgiuttYQ88MVHmeLUKPrhfiYm0DCtWR1K2FAvUpZDel?=
 =?iso-8859-1?Q?ItdO2joEC04TFfWaAxtdthoojL9D0lJiBvSVmtBUmccoZBkqohlYYHNZHD?=
 =?iso-8859-1?Q?dO/7ESeBb1CHca2cWrbP9y9NkshZeKVVRHUvpfdOxadNepG1SJDrMgI4HC?=
 =?iso-8859-1?Q?zTOzEp7yNOAByKP7rtV+I3oqG1Qrg+1ziJ994cuHa/ZJBRj92KZMWB3YAE?=
 =?iso-8859-1?Q?ySDIgO4xiRfGv21gSzCI+rElvv5QwQT3Vxgxrg2ajpc+0zfUK2kuqHpKP2?=
 =?iso-8859-1?Q?SkcpX/L/d0xifRrcMkPxF2+P03ceAd2c6RlNDlgvl+h8WXmXUiMlD5J1Hi?=
 =?iso-8859-1?Q?8yMunMmi83WNMppdEevgKzHppi8INesvvD9zkgw1oGvMfZeg6TFyVUvpnK?=
 =?iso-8859-1?Q?o/O75Q2Piv2d/cMUjEATb2C5yEtv+8roqM769NXo0hCGGWRr6NOGJkgYMo?=
 =?iso-8859-1?Q?26CeUJqEqgphQJZnRmBKvLybiUrnAaZA2YWvnf+/yx1qKWe3iJOLHMH72d?=
 =?iso-8859-1?Q?b2eYbP7dTTuSpFzb2ZJsEIs4Wfe5dlKQHF73dJTKJgE6NB/L25BNYLGz4k?=
 =?iso-8859-1?Q?wypnK86N530RKVD3JadrhIzO1Vp/w/+Natjm1C5ymebrZUvW/a5wsx1o2d?=
 =?iso-8859-1?Q?aqD2rSLWhKZ+5H9sWyWhLOJII1kUmWrKGR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56077074-23fc-4a27-1e2e-08dbc6a1bc72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 19:23:36.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7+kKrFnNDrADQYboYdZ9U0s7Buy0RrolCZsqToZKJ50MYP7J0cY+1JcjPRVgHEB3SYYCamftYHxNM292lhjYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add INSTDONE register to devcoredump
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
Cc: intel-xe@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 12:19:39PM -0700, José Roberto de Souza wrote:
> This register contains important information that can help with debug
> of GPU hangs.
> 
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.

indeed a very important missing piece. What about the other INSTDONE
variants?

anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 5 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 35dd4837dd75f..32465e384fc24 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -32,6 +32,7 @@
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index f63c821baeb77..52acfe1d8b6aa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -728,6 +728,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_dma_fadd =
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	snapshot->reg.ring_instdone = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
>  
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -783,10 +784,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
>  		   snapshot->reg.ring_dma_fadd_udw,
>  		   snapshot->reg.ring_dma_fadd);
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.ring_instdone);
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 5d4ee29042407..dc164d51579bd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -221,6 +221,8 @@ struct xe_hw_engine_snapshot {
>  		u32 ipehr;
>  		/** @rcu_mode: RCU_MODE */
>  		u32 rcu_mode;
> +		/** @ring_instdone: RING_INSTDONE */
> +		u32 ring_instdone;
>  	} reg;
>  };
>  
> -- 
> 2.42.0
> 
