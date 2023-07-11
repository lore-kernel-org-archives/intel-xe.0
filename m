Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC49EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 16:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069610E3FF;
	Tue, 11 Jul 2023 16:49:39 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865910E3FC
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689094176; x=1720630176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dXmCob2PdLykTFcLp0vCrG74NhYSSbE5u1Rd4kaVCoQ=;
 b=Xd3JZVj9VRo1Arw3mZd5fCnLc00Wd2KOlpwBI8vVmv3V0AUIiqmrx5Uz
 pG4cCq4z9nSDcTsgS4d5IEabGNo5JqyoqPRlCTeVwfrlRCeyN1mTSARIA
 n8+vBVqbxuE0Ep9TDuUBZLjJWcCpQae4Iu1vs1/YMjJ7CC80GYV3Spk2a
 P5js1WLFbP68Wp32nUWVlrd7jaJgdp2/11bq8y6faPzSSIMJtPjnm92w8
 LlzCVkcXiZJ95Cv/VMaTbluS9npXElp4qL711CEgbVlgQ+t5u5z+TOWYc
 EZ4fZi/0wF5Xg2nIZDpgBByj3sAd7hZ5UYkpxDyvxlEZtehdFUmwHAgYi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367255274"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="367255274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 09:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1051863471"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="1051863471"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 09:49:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 09:49:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 09:49:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 09:49:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 09:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYehv6sDbOowys8jhb6DPM7hJUy18DxAdg510aPKfABK6o2HZyGzNX2pgD8TEAN86EM/DEJm1k0Pgw6RRMDtHxVpUqEZYsSVne5WVnHQ7TjlZJEZHa+J4kD/49wjoWB120Kuauzz4Vwmg2dmmhil0InxRzdHK4RPEdBX8JlNYuk8pXj8uqtW/j3mHTKhO734JuDB3bHe92NcIZ940ljae9I/croLzDYzinJbW3jZfjRFBMREei9Y0ULDGp0O7OWzDMxYphKpJZmfkdqxK8auMVcvFJHU4YvvC9RjrUs5hWFUi5NYRgL/fURE+YjlnqWwWB3v3a+5B4WUAkYewPJOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZLnM+ahr1Xmz4GJAS8P5vWEuYiG+FTh7JOSBXOcO9M=;
 b=T9+VZD8gqs0i3DhEb17FbTP6Vgh706gqeY+T6lDJrbwDEebk+yc8nG/7QjGM5P3hj5Az7Km7fshF9//zhImK00/mOgN3JPEung7Pgnxu1jAiSVx1Y8UmsPCViEAkiQQU19nYqWSWwb8QYMsR+ecCDg9cRVDN5rxXUKLtD/QGNHl6LxbiFrn5sVacZcTYgOW+10PpauzjoilVtTH2SUgkvrgJ0B4Gq9a8fjQIdePlT+bkHZRP+ZkDMXH+TX21rmxo+Vze/h73t+sAuq1V8bT4PdYR0XDS1AL9jJ3ctAyDWrr+QACHDIQ9Dwaur08lITa5OYTFEJK1X6l5uA2iCMzEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 16:49:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 16:49:19 +0000
Date: Tue, 11 Jul 2023 16:48:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZK2H4OcUb1TY82x7@DUT025-TGLU.fm.intel.com>
References: <20230624014137.11358-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230624014137.11358-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cff5dea-88b6-4c45-247a-08db822ec573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5rdC9+y/Trj74QIcW2qQXiwNDNzz0X8UE3zzKFGyo2JftZHg54VMFrWpuWIEM4Mo0qsovBikKVNRjEstWCt/XaJBnN5JbDiQr0pc+M46UzbbecUGmWhvCdjAxfMcTIMbNKS/A3HI+pQ+xVuw/O6lThzwf2xKzTN9UPkMdR+2WsDQifE+UTegBIjlX9Do4DF7K03nUYydm3S0tpwBNkbKLVN7nsBM4uq85WLAEXMYsEY65HKrJuqFFNBcLYVSSsIYbpxUCou8t3sp0cIiwznMe5mYkJu0PLxsqKJGPJI9d8patyKsiscTvoEpJ80ZPBPSyD0J0f+E3xwkdv4irARnpb2rqiqkHPPBbI3+mYkWX8sX771N4g9rlXrGiQthsNz8ltJI0I3LPZwsZAVVO+5wJcBPVU/ZWdKm/Y+QCMagtMdvGk8jGJFPuXB03miYuqZccku890btuJHmOGpI5RLYVP0rpN8iufRhwi21V1kRYOA/CeddHoQ0YX9iEDHFycam9+halzCRAh2AgHzABypH0hxtGgYYPNwcj2sBP73W0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(26005)(6506007)(186003)(966005)(6512007)(316002)(2906002)(41300700001)(38100700002)(82960400001)(66946007)(66476007)(66556008)(4326008)(6636002)(44832011)(86362001)(8936002)(8676002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfbMONKIheiLrXkDdctN+ybaoo8XnbVWLddhyIFkpuDQAkqiyDtqHXomygxW?=
 =?us-ascii?Q?kSbUB8lc43a91sbj8qAaCrYWoS4y5nO2pWlT2S6AEZuxwb246quvt8QE2HuE?=
 =?us-ascii?Q?MEDgUzZwM2CRkK1K+ETnEmJK2kSPlTjqi96vecJ9Ffy4jVhhkN06HUoCzK49?=
 =?us-ascii?Q?JZDTzFXL0kGiTbUCBVzj0KYelcIrtSRQYQY6a21AFg9I5MAfhFyjMvWXISgx?=
 =?us-ascii?Q?5h3J1eUcgR3EO/7NIF9MNrW/4ajYledbR0JXI4q3e9JSrdSio3RQBzDFHOaI?=
 =?us-ascii?Q?D0zhB7ql9OVbsYeje3rgS3Czz4wMbf3ugx3NrO4u55Awd44ZQoQiGs0Vy2R8?=
 =?us-ascii?Q?Rn+KCTCFiG++5S2wgP+Sltxya7rqq5ZfZLPOVdFYmb3b0oTZPGOBxampJPvp?=
 =?us-ascii?Q?wJoAiL+jKNHghHQ6F2ukyu7U3muBcnb065srBrpJ8ybqN8gNECpAAmkroww+?=
 =?us-ascii?Q?S926iQbsU2Rozq2erft/TfakUVsU5W+ffb7SPgh54hf7PbyrDyRTtLJPidmr?=
 =?us-ascii?Q?HOrg24XivyOrsGqZ3cWyNNdF33egSJ+TWzX7zfZFIa2wMKQO9b5RzXAeWmzr?=
 =?us-ascii?Q?A79o0GdKofkt8UQfoHLT5wT5J912DrnJc1W8jrAAG5Qru28bjoWQmuXi7sn1?=
 =?us-ascii?Q?ThpflGoTXXDi8doMo8wIxhQyceHdwGTQFMGOh1kuUmr2VID3b70zK5b4I8Mb?=
 =?us-ascii?Q?oVgmKu3yQBlnwQWJa3alxPg6MAQxOzI2IjH5Lmqp+h/5N3ihlPH+zvCl2MU1?=
 =?us-ascii?Q?x/GKxHckKmI9MsY87NabMDbHLAQLEhQeKgWxbwxrHO9ASTxgMAQSFM6bnfH9?=
 =?us-ascii?Q?0yMSL+99yMl1kX6r29Y/pYk9grm4A3y+tc9hV2jYoT6FPpnCCPanjX3mBMNu?=
 =?us-ascii?Q?DAKrEVwU9AkndFh47nNTurDwTUiq5dw5LIZw+AlrG52dibhzyMfhk8rCCHnW?=
 =?us-ascii?Q?Qt2NC6iRbLALK4YcYQ5cta5nP5YEe/XhKS+TYCVirzeo8I9i8ZP68sHKeXNI?=
 =?us-ascii?Q?vFGOrfJn+ySH+0i0NohLPbnsDXaqKovau5kM1khc7UDhYiD/gvLQGG9BDo0r?=
 =?us-ascii?Q?jfPphsa+/Wi8k7nAd0KoEcV4IlK49hU6yCsqARkikvAn0puOt2ruTCiHazRr?=
 =?us-ascii?Q?c3ZeGnOJvu5c+/hJRLKQc7l0GGjXP3sUku3c94XeJXGlwdfthhRlMVzKrT+r?=
 =?us-ascii?Q?WW/QWDicZSXwWc9AgUc8hKAkQAIBiZ0nDLJMQTyJ7uiFqHvkQP5/LBziNyTy?=
 =?us-ascii?Q?bJ4Cf/zIjZfJZ6nCqjnzD8aI+QLTJebJtAU/gqZdXym/h48swMZoRheODa3Q?=
 =?us-ascii?Q?yyo+mIRJJJImy89FtVKCGzywHwAOIJAtClzPpdJ2LYjTTFloT1OspVvx5Cxu?=
 =?us-ascii?Q?rAuPdVaalu2/CP0ZjezOcdYTMRfY58NgUAFXpZhb2rrAxejE+lvFuEgFgIXw?=
 =?us-ascii?Q?GcxzCuUFqcEIvDm2LUsCEEFhe+BzJ/blPfSboAZ7HK4YSmRKoEjgOSJSwvz6?=
 =?us-ascii?Q?cd7ICGDF43aIYH/FqHst44Qj6ox8RkJ4L0EK63dZlS4U9crStccjsKibGmsM?=
 =?us-ascii?Q?SCt47hBBgiWnwFbKXDU0xAFEFYAk1AppoyxSJrYlFRvNbp9cW1fDOvcb5Uxh?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cff5dea-88b6-4c45-247a-08db822ec573
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:49:19.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZadGFWDIpCQX2r1//ywu6GJ/IQNkzPcaaPSykpnOQscI9GVATxX7pzWITvy3HIt3z0YgTs7ZtnTYKjjk5HZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe/pvc: Force even num engines to use 64B
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

On Fri, Jun 23, 2023 at 06:41:37PM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires that we update BCS_SWCTRL
> (via indirect context batch buffer) to set 64B
> transfers when running on an even-numbered BCS
> engine and 256B on an odd-numbered BCS engine.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Can you include the include a version of thia patch in the series?
https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2

IMO it makes sense to merge both of these at the same time.

Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 8 +++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 79873bf64e8d..af3cfc696692 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -59,6 +59,9 @@
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define BCS_ENGINE_SWCTL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> +#define BCS_ENGINE_SWCTL_DISABLE_256B		REG_BIT(2)
> +
>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5eaa9bed9d12..341877acf05d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -518,6 +518,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
> +		       FUNC(xe_rtp_match_even_instance)),
> +	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),
> +			     BCS_ENGINE_SWCTL_DISABLE_256B,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
> +	},
>  
>  	/* Xe_LPG */
>  	{ XE_RTP_NAME("14017856879"),
> @@ -525,7 +532,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
>  	},
> -
>  	{}
>  };
>  
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
