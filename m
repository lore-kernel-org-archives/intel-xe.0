Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D560BC678DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 22:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACFB10E171;
	Thu, 17 Aug 2023 22:23:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00E410E224
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692311005; x=1723847005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ppg8JUAAqZhlaCT3Ta8XP4osTjspuPq6citQsjMhzpk=;
 b=ZoK1mPHuGGw1QeLBd+63F1+IzSn324kv4iavfSpJjEhSK5P82zVHOuhX
 QbfnNPK+7v3DKQhVktEudcWG49scfx24v6mp04SG+0Sjrwp22FdAeib2b
 5cb1qdNYGo5ojU3QKI31v9RBIJyaXQfygukAloVJ2E0BNDKiLRG7NG+z4
 jvyXFrACSL2qZkuqy5lC4trJ0OCm0N5E7Dfu/2GIK7+PBNUwApTuIb+w3
 Xz5fJrOHHYHHCD/MQgZCYfBzK1DI0AN7PTXHndCg+SBoGZOz4WRDC22kv
 Sr7vGK3OfkCmoMeN5eFT56LnMRLDXrSVN11ITGoTTqI0O/2kpCu98H8ji w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372933414"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="372933414"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 15:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="804875809"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="804875809"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 15:23:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 15:23:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 15:23:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 15:23:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 15:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZckXm3sOhLadbluv0ycBfkRzd+2A3qzzGehV06JCfhOyXjuJBFVbFaNe0qAZNud8BP4NLp04rZv/iWxcElxBJJAT1FTuXnxa2mJ3OfbrFitHm+222AOP4jOQEdevdlFdYyqCLxPNsERWFpdyTSMqJ7k/s9pwf8fuRSrn/B2THoFgRvqDEwvzS8JNyTNjA721cS8ZEQGvDN/+E4ZZto5LC/j+WMTUul4y71zWLA+EHz5w2BpRVBB2NktaXeiA0PJXV4GSIRFGZgvNU3PkD9lLCGsNIiJOmEPS2YR3WgaPOeroyrx3iv3gQID4SCxbfq8CVNUaFGSQiKVd+VFLaXDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZiSHieXec6e3YrQr87BaVXJ/gfFO6M8PgjNvM3M/NY=;
 b=EuEmrt7t16ZrvodfaYt2GjaBajtoy9I66HYUF8gzPxc4OHxkoIKzMeSABLJ/ZwrNI8SEVjw6BJeCyNrUGK5m6zEzX/XJ8T5ecGEJeh9c3Y7e40p4KKu5md3Rs2yKg9MxsubadpKFHIR54DXY36ZZd8I5AjUmHfBT2P3KmMD2frl8rPeT4ROdEk5iKD04c3wFEgWzEDSpp4NUXFWeEKX/Y0oynF7cubKi9clYAuEzAfIj/1VzKXuVsD4hYrLtGJcCOqeGuYi/OVSupqv4ObC+UIW1lJJ2L9/x0TAB9jsNtfVsZft3dsCxFcrfIXHwoEmi19X5nycsqq0KrpP10eoEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.30; Thu, 17 Aug 2023 22:23:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 22:23:21 +0000
Date: Thu, 17 Aug 2023 15:23:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230817222317.GH3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
 <20230817221707.1602873-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817221707.1602873-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 33348cd2-ea74-4fb5-8daa-08db9f709029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5Zg/cPrAm34K0uOHqYmpq1EFSUnwA/7AzAQDVkdhYOmpFjGWzDUOnQNem6Mfycto9YzaE7NpgWbRsbQ6LeUbXwGNP9UvKNCTjOaD8Dn+j4RoecQJXdbDPqW55XvQld5xsBhPhjzcCIXpPxDEO9sjglfOLv2jLJWI7DHHMMNLdzSlE+2KK2XpO5yfT/Sowux0oBbh34cNmj6vbZbZjwkwWTsd6wazQnBrkqBiQbz2Yntss9zJV47XboJvHxXG8isbfxI5Uj3jX1mrt4npS1bEp7F4mt72W4MvA5YC6EtJlrQZ3BJxh4tY1gYq75Gh88Q26nwfaHuyOCALlqhVgFUYIc6ebJJmddn3PsKd1CwUwK9cJEAicZmAe8LiwQ6OjIvTCscW8573V1QK0EJAWQTNwqgTcwqqci632zXu5gO/Hhpv2Y9wGO2RHaYz1HskVYIXpu2kbifEncmh2dpjSuDxIXh+xU5uufb1XNDblqjZYmE/Gj/lVmS9T341xgbbht2hJ1fknxn2V7kv45iQuLKCf8++ARqFhjMp+bxpHzylCbBZH4c1kzWuYxpQj5Epkuk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(186009)(451199024)(1800799009)(8936002)(478600001)(66556008)(6636002)(38100700002)(66476007)(82960400001)(316002)(66946007)(2906002)(41300700001)(4326008)(6862004)(26005)(8676002)(5660300002)(6512007)(83380400001)(6506007)(1076003)(6486002)(107886003)(6666004)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrRJDt3fXuzyacQSUhyLXjxdYVH79HF1Qf6TtfhAM+agObPUAFipHUxIPC8Z?=
 =?us-ascii?Q?dD7RWcv7gsIipJFIre1tK4lmdRVlUkWuSR54kTow0IASIkYQpWwOVG9/FgAu?=
 =?us-ascii?Q?/09aNLMzONbpK9rs5iC5/GsFDO2wI7CNdLdbWc7Ll1lnbr9sDHEFrzGhpW2z?=
 =?us-ascii?Q?bItlp7NS8zUEh2M/lFdNWohubpCrCC20k+8M1lxVZKiF4AoWj+vNnf02Yqe8?=
 =?us-ascii?Q?xf2ewtMJqf8k9GZ/As0egAWH3JhjMowhXiUIq1e1WqBkTcXgqCgQgPLgpTln?=
 =?us-ascii?Q?PbfhK5R/0ttKPVqIKJlzzAoFO5vQPztS05TMGk3ltzad9FWG8pTZIzuq1zR9?=
 =?us-ascii?Q?dqiKGThIDy7Sjhh8hb59DtOyRempow6zRCmugBXa6i2iE1Jg8Qym5D19riHo?=
 =?us-ascii?Q?7K+URhGwMGqixUkXk6O+tBLlcSf2xmuvP4b5DAtXax36LqrE8eGDRRcEX4hS?=
 =?us-ascii?Q?0C4ZPadnL69upindr/HvfFMcg1ZBHwbV//cgGgfhXpjLSTeWAvQCO6kSmrpb?=
 =?us-ascii?Q?oo60Ag4EzndXHWNSGYt3heYtOZbzDEt+vsUttbej/k9K11m0VgyYXRFFM7Qu?=
 =?us-ascii?Q?bHVATMs/UhQRGLRSs6to05d0LrAJy1n2JqNZJWdkt3uVYwocaYhJElgW5r7+?=
 =?us-ascii?Q?cm4uK0eNciavwSCuzPRd+EN9fr8cnSN0wW35KpnKxs5Tqjz+LLYIOyKVMd48?=
 =?us-ascii?Q?l+mX/y4XS4UGftJdhhfSLFr5SZs8yVd7fSovZxQ34Ksny8gOsScMdSAyHpPO?=
 =?us-ascii?Q?J1q11Xqk8ihgfS/njOWSsHKPIsm++3S3k1vW86HUU2wQjw1Qgu6G64Dp7Wvr?=
 =?us-ascii?Q?iv1PcC9xw6Kd818cg5ikmUPzxAcJydJX1iot2WgPaGsTv/jo0zmFwlCy6aAT?=
 =?us-ascii?Q?q+1MzV5v8lOIRl3AcAwYJJXCY0DCoLMdM/HyHDAz8yk2kLWkxRv6T3OgRULc?=
 =?us-ascii?Q?cWb6fdseXejHS9F9sp4b2Eg+n/25/lfxQRhdnTgZZZOXaV48b3yLCuPZrpk2?=
 =?us-ascii?Q?6mIid1GOw5UyUv6AVy+ZTiY/f61NzoUqv3DQvOPy+C8sTO0c0TgSdytgF6bE?=
 =?us-ascii?Q?RBgfN0SPq/+XMjrwPhdyWxlmJ1ZvxnJ4b2WbkDet8bSSw+KVWWRCDMnuE+vK?=
 =?us-ascii?Q?JURns4xRHMfROxNLb943a+uavNNbfaJq6hBownAEaKWTQyDjz39FvDL/cdwt?=
 =?us-ascii?Q?+jwaG8ril5G3rP4R5KxaORE9tfO+hh9JdwvBim6iT6PebKYNi6IpOaNDZExC?=
 =?us-ascii?Q?1bHHBgduAYKa0t3ASJPhx64YVwxzrOc4uTorgtQ0X5RmZJDR7EmqYekMIhQk?=
 =?us-ascii?Q?W2GP9v2Fl46iHKh0A3zDE9yqX6iwpqITgsJjV2Mz9MBThAAbDcXQMMRg36Pl?=
 =?us-ascii?Q?yddvISJg6BETmEjSklWGBKvGi39KLLifZvC+2euho4rttHKIiZnvLkVHCYOV?=
 =?us-ascii?Q?KKx41OOxLpgtSrDtbWyivfaJU1+clpe5Tzlb6D/oeTDUmHwjhtv9hvfcjy+/?=
 =?us-ascii?Q?LBfkLKV0d+Vt4yQpRKGHpuhD2QLf+8he1Sa/PENbHfW71qk0FkdyN1bpml3f?=
 =?us-ascii?Q?yOuAuTQN20O7Dxb4NhIruGVa9POW7SyNEm6qBsl8C1O5p1X8J676TI7KApnp?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33348cd2-ea74-4fb5-8daa-08db9f709029
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 22:23:21.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvVcOb90VEfMjg2cinmsHvPMsECXG/oMtqsZue4hq0gkiVZnjQZR2Xlyh4u+ZvxszRHmMZl681JJb7/2rfo0Ut8l7Jd9lvWb9e7VKml9Ajs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: enable idle msg and set hysteresis
 for GSCCS
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

On Thu, Aug 17, 2023 at 03:17:07PM -0700, Daniele Ceraolo Spurio wrote:
> On MTL (and only on MTL) the GSCCS defaults with idle messaging
> disabled. This means that, once awoken, the GSCCS will never signal its
> idleness to the GT. To allow the GT to enter the proper low-power state,
> we need therefore to turn idle messaging on. As part of this, we also
> need to set a proper hysteresis value for the engine.
> 
> v2: use MEDIA_VERSION() and CLR() for the RTP rule and action, add reg
> bit define in descending order (Matt)
> 
> Bspec: 71496
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 79873bf64e8d..d57fd855086a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -24,6 +24,10 @@
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> +#define   IDLE_MSG_DISABLE			REG_BIT(0)
> +
> +#define RING_PWRCTX_MAXCNT(base)		XE_REG((base) + 0x54)
> +#define   IDLE_WAIT_TIME			REG_GENMASK(19, 0)
>  
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 81281e9c02eb..24b5226f1433 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -339,6 +339,22 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  					   ring_cmd_cctl_val,
>  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/*
> +		 * To allow the GSC engine to go idle on MTL we need to enable
> +		 * idle messaging and set the hysteresis value (we use 0xA=5us
> +		 * as recommended in spec). On platforms after MTL this is
> +		 * enabled by default.
> +		 */
> +		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
> +		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
> +		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
> +				     IDLE_MSG_DISABLE,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
> +				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
> +					   IDLE_WAIT_TIME,
> +					   0xA,
> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
>  		{}
>  	};
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
