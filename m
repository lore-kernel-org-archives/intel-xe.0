Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B5C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 23:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603C110E060;
	Wed,  3 May 2023 23:02:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9402110E060
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 23:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683154963; x=1714690963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o/uqMMYCZe3bHstJL+blv/d7GmrSidI5/hsdbEhTCmg=;
 b=M4hDr7biT1IIC1n9PHSD74onlqW7vFmz0bWJUK5cpQWMpEw/wg6tSPQ6
 RnExujM4CFxzvvab0tMr1e1U400Z1KgphyzmmuMbwKEkCE48/pPrbZ+r2
 04j5k29zhTi3NI4i8j285o9NkAlXdix7q5D9lcIg6yUr+kS/ya2NnsqHB
 kGigdH28/WVOiYOCHPaZKav6r5dmmDyiBHXmM9Sv4eaI7krm+S+6VQTYO
 3CGuEphc3izgthJ49yob8nQrA8kAN91HZPU5HyuO9N9pNU08RK5OkUxux
 CGtxCzsf1r1czrkg6K6xb9UzmXTI1kF+5azvjMI5i8sB0E3P+2JRSCuah Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414248767"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="414248767"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 16:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="696773448"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="696773448"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 03 May 2023 16:02:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 16:02:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 16:02:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 16:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfSGb0alzfqAndsW3j5JjRdoRYbvd5RFzSswR3RWAitEE3bxbVseh67+b3YBVi5iUiy+zrpKgvxTyW/8ZnUtSzJv2Qy/RQVNcCWxhvptAMiiYojJuVuHAmwo9F4Ous/npcFR9mY+AVuntp71iTm6rloLLflzmXPvw+P0ib6BTP9eK312Lr2k64H5ByjBnjDPq14QdJpzSs9SwFRjlRIijvTQMNnQlU7WU8kPWwldOnOnpLEuKt03nim3DU059mikQVb9QJlW0ZJ4UyMEn45fruvzBe4VG1xZ5SeA9dxHdBZIwn8ggbgV++ePDzL5vvYn20rm+InREzPENLGj8XO7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mff0Y0teN3oRwe4GQoHBYww9soU0OMOT3slZriNTtCY=;
 b=X7wE5yo23Ti9xHk8Mi+WkFLvSdyAYrHFk3RPLzagrc6vSAgKLAACfDtfaYDia3Z6iYpLkLMhHDskhA3TB3jRwsWUrbTq/N8GkYDAFZiQRllPNpTOhw0aHSVfYAm1rQaGriWQzvbs6NAny4VguuXpEir9qTjeSpK1CZ2w9z0bhdHSokCUKDBYm112ktMD74cvJVCIVwZTXpkm42YrzLl+cuZZkkmg7bxaVwSOgXViHlVNwfjzzjkafjUq4xgx6e/b7wJtskHhFo9iDG4x9AELv842RYEzRhKinXTn2aWvXZaNbE4vQ9vZBa0ZEAfU/yD7WUJj/W8RpqlLmgovUYYZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Wed, 3 May 2023 23:02:36 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 23:02:36 +0000
Date: Wed, 3 May 2023 16:02:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230503230233.GM10045@mdroper-desk1.amr.corp.intel.com>
References: <20230503163013.50231-1-jose.souza@intel.com>
 <20230503163013.50231-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230503163013.50231-2-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cd1f0e-a867-4b48-6dca-08db4c2a7c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9sSUW+GdJAjVKoqOiWns4cFBwolQx2Mw+5L9wIOJuLORy5+OKh2Kq1Emxe8aKtlfZSGYWcnnSXF9j3lZ1l/NIjIy7QevSfGoXRZqaCthY7CuBFWxqYm8uDzX4bd+pjpZHfmqyDJVNrYJEbl6LLjjt+xhvIg9+utTAWb/+kPZ50QEQA0QDzgGvYFt2Lq2z/TSLo+6cqdKce+hvxYeGIO72/tbDHbFr6eEtmaeR8zkec5AdFfHJ4bzSN8snQ666NwIn18UHRnfNPg4c+66SE3l70vUOw30q9aFLY/u4Mh5YaEu/TWaH/SM0QTponcyBMgBo2NzTl9UIyIzRGFn2+GOqsMfJcZ62+t0tSvqTUEM5P2RV6bhzXwF7eCtGecJcqjkvk4f1wF9EnGYLzYQS0anpTflJjEVqI/awWEUJIyxtG4TB6ihTWEzp+UrSddGE6DXH2CaICle+I3yG53UUSZU8P2um7EP4y2U1APNhxyuhiuaYL7tviXShyo8aoxxT7WT/R82TJ/T4J2aFVJWiZqNJVWoWvPqYvmrerLncjwuE+0scWIgxUnLRXRg7JHljxT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(8936002)(8676002)(6512007)(6862004)(1076003)(26005)(6506007)(2906002)(83380400001)(6666004)(6636002)(4326008)(6486002)(41300700001)(478600001)(316002)(5660300002)(186003)(66476007)(66556008)(66946007)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?La1CYyWb1Wp7P16/VSIbSFO9cWKtpeglgD4S3sOl5MXi8LtWyuBCIyD3Y9?=
 =?iso-8859-1?Q?Y7pbi16kJYsDbNjJWxh+IYCUb58lLsTJH/tPKRVeBaFR9LG2sShddASktf?=
 =?iso-8859-1?Q?0SlKeXEvKHqLnZVoVTvaodAtAAD6/ZTFqkGMIzxDCArDdPU9c5+BmFIfPH?=
 =?iso-8859-1?Q?78qFg6lB5YoisK1cYUAh5NtYkmJpnRnUmMQwx4cXNReDWv9e/5BaO3AHFJ?=
 =?iso-8859-1?Q?6Lbt+bokc8n4C2oH3U4pPnO7Pn9R7UC9VXSy581b4xP9rfBXMVvETXY49J?=
 =?iso-8859-1?Q?7r8Uz6OnzE9SR/k8PCN+KZyPCz91gGk3A4oH3bzU+yHjv+uzPgBvdpeatj?=
 =?iso-8859-1?Q?q9p1HRlm/rJvHTe4DKNzZy9YayH2QCfKR/d3y6wl9bkHOiFHNlFDvxhlBA?=
 =?iso-8859-1?Q?lDXroDHWVyuZW2vWAk4FrNi/3xLcB0aqmA9c67c22ykOVkealSQYhsCEJ5?=
 =?iso-8859-1?Q?k9jeDJycF3CS4LvhavtV+b10RInwrsJYWWgm4fB7nz+Ox1/+43Wgq2sMu/?=
 =?iso-8859-1?Q?znhhRp7ZfSeavs3bzrOsn2RWizCGJ0I7AAktkl3TCp8M59oMt/DqO7Tlqx?=
 =?iso-8859-1?Q?tmhQl7wsvdBVGA0PX5/xBd0SYIJ4u5/uzE1QL/Xf0HAi2Kduh/9OpuR80R?=
 =?iso-8859-1?Q?OInfNcEjh/SW8XklbvygrK+DIeMkpcvOod5AOGfveiXa5sEttYSQPiNCx+?=
 =?iso-8859-1?Q?AxoXfxWUtIgL/E1iLFO5gKNReo9yuTml45VuR0de5kRdtoXAku0EzSBAJD?=
 =?iso-8859-1?Q?8Z+nP1wV8siQIi8JHY7WyZZWhCN2Bv6GW7Bq4CRtXeDJWeLUacEqX22bIo?=
 =?iso-8859-1?Q?JJIQeV69SBvXg0pRJeMOucrUR2lJcQ/8RPfQKYW81v5PauKdFHd2HEljWg?=
 =?iso-8859-1?Q?MFmNe7536rob8nwYD7U0Ns8Y2kBRAsX5F9oGPOPo9ZC2lEfet1bShPfnLz?=
 =?iso-8859-1?Q?afqwmHOquuyLqOAy/MvLjazB5twD6LARt2+rWtkMUfrdJwZ+psNzNbxixO?=
 =?iso-8859-1?Q?sDJDlQN4HMAXAPUI4FP/WkaKbgMmsg2opni4t5E7b2FdKWhKmXURin4W0P?=
 =?iso-8859-1?Q?khLHWJaWceiVN5cbbdMyhgLDPOwr5sDE6Rp2DUOFKjavFvBjV90Q+Dd+zG?=
 =?iso-8859-1?Q?6VRNn6yKGbEeFI2/T5sKUFNHKTct/PmvKAq2wKnSfJwYSjEecmyDOg99IB?=
 =?iso-8859-1?Q?LtpEqVmZfFj91CUv0Gf5yBOqCe2o3UH+E/+tjTkd8xV+Pq6AgQo0L9Dx2g?=
 =?iso-8859-1?Q?lCB+rl+VmoXRtbUL0jnVLtiQ4tg1fcYy3Gr6AJvMFuEIUgsd4FRJildR4v?=
 =?iso-8859-1?Q?zKVNqnXvdZIOy7WXe550NMmOHYZKdwaqyPuYCAhJ1IlHP00vlL8Rl7ZwrU?=
 =?iso-8859-1?Q?X9wegpWIN1wtHIkQXPO9xsolZ/AyDMfbSZ82KHRmFNjyDMKGhbnCgoEnL0?=
 =?iso-8859-1?Q?YPs/F6Bb0n/2/zBr+TZHRmaBLo5q8AfGbBWOuqA9iSkN5F11OgwYBCy7GW?=
 =?iso-8859-1?Q?2tYlZPs+e2XlVTl0JvXVFFbK2yeBxiiHd2eqpRPLjhYmz1I5SjS9/Daep5?=
 =?iso-8859-1?Q?Z93NqpMB5BUk+U/taMDMc78kafCs52ioodoQcTN0UMxZhjWRlPj8Zn7a6O?=
 =?iso-8859-1?Q?utbesA0ybnOqsV7T2TYZA/mFhsDs2NuH4F0MvkylFsEmGh+39aQid2sw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cd1f0e-a867-4b48-6dca-08db4c2a7c2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 23:02:36.0500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5znAqVA3ZvhGkLvp2XJLaF+qF3jCbW/QmmyHnZ5Q4bKYCV62btW30kNPMev8Ff6tPWeNXlY/AF5KG83odkdpuMqGAEATrtEOpWCWTn/n9As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Set default MOCS value for
 copy cs instructions
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

On Wed, May 03, 2023 at 09:30:13AM -0700, José Roberto de Souza wrote:
> copy cs instructions that dont have a explict MOCS field will use this
> default MOCS value.
> 
> This was mainly copied from i915 source code.
> 
> v2:
> - move to xe_hw_engine.c
> - remove BLIT_CCTL auxiliary macros
> - removed MASKED_REG
> 
> v3:
> - rebased
> 
> BSpec: 45807
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 717d560626cec..b0ba56342773a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -58,6 +58,12 @@
>  
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
> +
> +/* Same handling MOCS value handling done in RING_CMD_CCTL */
> +#define BLIT_CCTL(base)				XE_REG((base) + 0x204)
> +#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> +#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d497f0289c372..284b153cd30b5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -277,6 +277,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>  			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> +	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
> +			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>  	const struct xe_rtp_entry engine_was[] = {
>  		/*
>  		 * RING_CMD_CCTL specifies the default MOCS entry that will be
> @@ -295,6 +297,20 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  					   ring_cmd_cctl_val,
>  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/*
> +		 * Some blitter commands do not have a field for MOCS, those
> +		 * commands will use MOCS index pointed by BLIT_CCTL.
> +		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> +		 */
> +		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> +			       ENGINE_CLASS(COPY)),
> +		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> +				 BLIT_CCTL_DST_MOCS_MASK |
> +				 BLIT_CCTL_SRC_MOCS_MASK,
> +				 blit_cctl_val,
> +				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},

Unlike CMD_CCTL, we can't put this one on hwe->reg_sr since the
BLIT_CCTL register is part of the context image (bspec 45584, offset
0x44).  We need to get this one onto hwe->reg_lrc instead so that it
gets applied to the golden context image properly.

Regarding my suggestion last time to make this userspace's
responsibility, I thought about it a bit more and it might be best to
have the kernel always apply the uncached MOCS index.  But upgrading to
WB cache behavior (when running on a platform where it's recommended,
and where userspace wants to opt in) is something we can leave to
userspace to handle.  I.e., we always provide the default, safe behavior
and userspace can decide if/when it makes sense to optimize.


Matt

>  		{}
>  	};
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
