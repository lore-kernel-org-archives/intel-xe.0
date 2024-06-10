Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5866C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 19:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3AE10E134;
	Mon, 10 Jun 2024 19:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCb3Iyh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8710E134
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718049080; x=1749585080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JIAgFeW0FdT4LBHSNKLP5qAF4bpc7o+gXcanWMoUx0w=;
 b=WCb3Iyh1pdHqjoLk97qmlVYqXWA/ug0rleZGkde4ZKteOx9zcfJd2W5W
 5ppYIgIs0NjaZDI2kNVs+mCjsBXvh5tWAR+tGbasfWRatfOTTtvuFHqj5
 oFVcqmAbkqcGO5ZZAC2umN2/U/0eTjgSBCORZ/wUZfnFlCxexbUlRUn5l
 RMJ0G/mAhSE0eROlMWolHCy5IYlfAiiWBQksC2BdanStVdTpTA1FmsAmW
 VqyD9zw9p9v6X6xr2DPpAtnb8hI1BFjkk/lO5J9vgtDZlomTwy1tRw3o5
 08qPAkKU6Fx87cUI2mbDyB2zJ4a6mWZPIS/Pv0W+F6572EXwoV+6yxv9P A==;
X-CSE-ConnectionGUID: lMOnYj8oQee2v945eeERBA==
X-CSE-MsgGUID: vlAtCbr/QweQv5OCdjW7mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18558548"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18558548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:51:20 -0700
X-CSE-ConnectionGUID: 1mVRGLy8TouMvCfw+4EZrQ==
X-CSE-MsgGUID: 8UwOGVZ5Rdy8vrNsjYRgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44300221"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:51:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:51:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:51:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8+HgI5sXQMBA+a728F8aoNPopRtVKId9G202kz5k4vUqv5baaDsLcTOw/fEJvjT/QeitBuyjYuuGhkbjPK9izAnzem9bkyUfJthov/7CByTwO6TwJ5MXi+Jq19pO7chWoWe/1375gE9EXILEaYMV4ajG644eg3NysiwBUSryok0dfn4sNjW9+oH4a5LyG/YoJmSJbqq6V2RSsMho+ELnKAPTVF4TyIKS7qNiBvgv+Q3hpa6EeX5x2QiOEVPg03/JRTtV76zwEvm1yZIZTXL0TvaXT1EVbsRsPF/5EEDt0FxDCiEfolYXL/7eka939vT4UqfAUDcl0SpQIj8OVhucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGv1w3SOBQWdZt1XtOXLc8bAzEDnTPjEeXF0RLA+7Vw=;
 b=JwYuupsoXGZETkk6lR4n/WX2ZB3tHOP1yKeoygtI0BHbBfMn22F2qSXqAdPwJvFFuH21D0OiudV5OvnGC2ZvChhi530LbsdZ/G0AuKA+lObXtwj5xtkyaI8mATccC9NzBHXhleAM3fIWi1BlgkW7p0HKmxfhthR1rmvd0+QcE8UnP9z34B6tquZ7hl0sv68nwBdPMlGeGshqbXEsciXRFje2md7Q5QGzNWoaz0obD6ksUOJztG9bOpWuzIRMIA6eoYcxhJUL0x8WgF0DIv7vDevMEnom+kTOBNkBH8d2Jp3k7/s4XM0vHP/s7fwu9mFNyl1jRKcAHRqVk4U0BEbq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:51:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:51:11 +0000
Date: Mon, 10 Jun 2024 15:51:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Combine common force-wake code into helpers
Message-ID: <ZmdZLT2mznd6XCIo@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
 <20240610183757.1812-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610183757.1812-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: ae570c3b-5f11-47bc-5069-08dc8986ad6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kib/ETz+ICpk6tGOw0t2rfwMwowqSyP1cBHa2ZbHzV+Ccd99p8tbDPhu1SF6?=
 =?us-ascii?Q?Zh6dVjzGeHL1Pygk54EL2bwcdZxrv04FMunZ2nWvydp+Dhp0cg29ptbDNtFX?=
 =?us-ascii?Q?FD3Xw9dfKM7CJn3Fa9cr4FcdMELkNCXI+tESShO8EdV0IcVkpGNqhVTqp2TM?=
 =?us-ascii?Q?pO9JZ4sJu5na8Ylbc7BTtF35zSoT1RkJpg3nwBFGsgWwd4M+wPfBZPABfB0g?=
 =?us-ascii?Q?nC9IbEfTXzopfbHj+2khDfSHa+wkbPWF0HsJ74nq6kawBGd8o9H6oEhxNJCt?=
 =?us-ascii?Q?NE196e5xrRs4vJ7F70zG5PCgC2i5qZW3qXKvr74tnIKYK9ueq5GIi7C0+8DB?=
 =?us-ascii?Q?VYSGOhVwZgXBIrw891T8ETif2L4dEqbMMV+N5dxN7D4bQ9seTf5rX/x5MH03?=
 =?us-ascii?Q?NWOx9nXBfUAd8yuxOKV7Ypy7MSIJL+ExGv2l8LBvZizlfL4RBpHaPOB1mIB/?=
 =?us-ascii?Q?qbFeQLTEgsfGXXOzrOZ5rFDRE1Gl5CWw0eG1sdLi5zaApzvGSqMXQVs+nqF7?=
 =?us-ascii?Q?Rri+W13AhALfFHKP5YVGu5fZyCz132E5YEUq/DTv2g7pBm/IPHq4MQqAJyBH?=
 =?us-ascii?Q?614HxlBE2PNDB/19KbkwDjy7k3xEOl6VJ/biniYJcmYGJc1fAKW4ljLWZDYN?=
 =?us-ascii?Q?2I2PLUiO7lzFrkxhTt50sRNEBG5Lf1OkUtRBydFl3saTIxQLtz6DmEO6c+8e?=
 =?us-ascii?Q?I1eDYMjucYAmPTqceiZB7nd87NljNTwCh5yXlC3xm3h0ZY4nJDp0AJb7vXGr?=
 =?us-ascii?Q?7nG0XqtBDfUPc5EMgKZuOx06ErclCDJy17fK/CKlUzOGSa4cpr+SQwD+CIdS?=
 =?us-ascii?Q?bxxa+/ELsyUcHwqTg6YSi7dLnxpnlDQ2DOoVpr78RmURO364ibcLcnj/1mgB?=
 =?us-ascii?Q?qW/p/NCamg6ETTeAfkqac7j0GnGHOGXQYp66DC39XwVivUYRFO01tJ7GwMXU?=
 =?us-ascii?Q?HhvQIPimQzHL+uKOFbyyqrqO6eTNZX9Rp/jq9w4RvSwiG43WtCAZDdQ/fn4H?=
 =?us-ascii?Q?kab++DthTV0M0NAVkTSXTbbOC6WtNQi5qaPa9Wp+xVtuYZAJywqVDV+jZGQn?=
 =?us-ascii?Q?yfDo/NSi9IgrUFO/7jgFZ/NWi0JCYhunGpx3D+vv062xmmSAYAjpaX1X9zUW?=
 =?us-ascii?Q?vYbCjRfihB9eaJ99yBfm/2DiWiCnpyfnt643w2zQB0LZ+HD7x+Fo61uMSTdi?=
 =?us-ascii?Q?j5iYF2mTnm37qb/zqS3bV2P2niEezxqAtzWixaMgitlHlBholY3B1auhMp3y?=
 =?us-ascii?Q?zLkvyc4J630c0CrmtCNfTJjh9mPzbHpbCEQK2A6U0eKOgIVLYNHuHfG9CaDD?=
 =?us-ascii?Q?DsGQGlndG1HwNBWs+JFLyV3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmSEQjFdE0ktJoYQ/0yqckXJwhRJWTBBZ9gQ+cYLnqC3CMSezzMOcd+DVEt0?=
 =?us-ascii?Q?AGNB9fxhdeoPJ3KLmINfxIq/5YtAMfeMFgte/aBCMpfUMppeHYIAieqEq8Mn?=
 =?us-ascii?Q?nKCxe2zDN90ZQmgRSb5CFbt1atKInfNfYPNnc1tiGiJKeC3WqqjfEzURP3X4?=
 =?us-ascii?Q?/1Pkp5qCYL5noCFU4WnPNUbfWIdI5baUH39hgn3pEFkTCd6gBXGIraVd8ob7?=
 =?us-ascii?Q?E98IUfqv0Z0PLem3U8hMP7T+GOmUdGQW5ms6ThU3IWH3DqUoAVE3m2bJKc7k?=
 =?us-ascii?Q?LgeU4iQyddHXR7ksmcqHJZBJj9psxBN9Kt3eJYCjrblbNdHxOJErH2fWd0xA?=
 =?us-ascii?Q?iDEf5mmydmJggGKrk2FBn7mm1tTjiu/R6ze6a8UJ4hmoAJau8sjLvGxqVWbB?=
 =?us-ascii?Q?aIucggymhs6MUeOg9EABgiP2R/HlNgeb5Ooo8KZseE/aEL0//Aj9kDm18lWf?=
 =?us-ascii?Q?mS779rnSWjrCo47NoLQnwVUXqsE+rh4sesZ3Xrkonuyk+1mH2yLHiQayfqRX?=
 =?us-ascii?Q?VpOnLvitrmUmT6Ueqd2+NH/ZZ3bmXfSsUxVljG0sVNLidrbapDySQUr2K6dx?=
 =?us-ascii?Q?WW6+uqCSziH9y/orrzqCPCNa7z3PXYoG9p2vfXd07ICxLiOwlqQgE99jkFyL?=
 =?us-ascii?Q?ANMFgqZ6KsXMHPNhv5vL7iRaQNwmvAqELBkkMEnoSuIM7i7P0y8ZYCNug+nc?=
 =?us-ascii?Q?+GQvDmicRKkblQnliBmyw5SMMRwruTEhE41MSllikXcbmRq+BgTMW7/gZcR3?=
 =?us-ascii?Q?JzMSyr1+HtYbQihQG/0D/6z1qdW0W7pmt/PkDEY4cVPcWcnZ0FTxEBMU9dWZ?=
 =?us-ascii?Q?DUgO1jW0phFjCJOwu7wSHhBkP6H8ybEDpldXtSY2vPoy7j1hPC5f12g/l6j3?=
 =?us-ascii?Q?M6JinSRF1BilpGkFxsw5KIbpqQGtfGWrcupz3c3iDjiHgznMIVxFgA08RnTl?=
 =?us-ascii?Q?zk0BENsbJ6Z/pjhalltgvu2JRPAF39KBQETcwKcNKC2e9mZNxWSg0l66nGkk?=
 =?us-ascii?Q?R00Dksd1LLLOZoLHciFIN1c0zFXqa6t71v+pVUKLsp0+5TzivhKy7pId9efN?=
 =?us-ascii?Q?vnPidySiGney2X+fg+fiWB85p0AeR9/pUiaAODe6IGXK4I1JZsL4eKI1yW+C?=
 =?us-ascii?Q?AwdcM1hy9ISxYcBAf0AgFTjI4YRyPGr9+i6HzJEWXGrxk+uluHxqH2fNljTE?=
 =?us-ascii?Q?g7ApcMp9Tw7O2TDwRdBfwDX1NSA2QZsKzMEKG6p0jRjlj7J3qYpBvqOBsUlo?=
 =?us-ascii?Q?cvJUs8LkbDOy/oY1+uuBHlnyA6l6qK+BgkT9EwJUqNVF0pLkrb6QLKgW0zd3?=
 =?us-ascii?Q?wMNMfCgtc5viLOSRCOUDQBabetMXU2tuPS761FHuKGBcxGCICCIOaK/Vb8J5?=
 =?us-ascii?Q?/7GKNKUZy1/SKaL1mpB5fm3B+APd9+z8inGZXVc0fnYugB7ecyZWR1tclaMZ?=
 =?us-ascii?Q?na5D5kr6spc4uqUYC+DBOSuZnX9Sz+MpCrFUjOkyj168xckMj6HOR4fXX5Nf?=
 =?us-ascii?Q?spo+wKDZZHdir+9Iz/MhLjye/RH1psyDO2uL4085jI1+2Cm86BNungKuVp+0?=
 =?us-ascii?Q?9UkMX58XOPENKbSxrQpb5kD2HR4OR8VlNNhG1mTT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae570c3b-5f11-47bc-5069-08dc8986ad6f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:51:10.9938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4tcMF1DWYrkHAdtCwqYlnCRBgPqyqWwneht1jsC0mZjQ00FPfSj1ajybMa2HLss7JaZ8fYl7JD6UxYcU6Tzrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

On Mon, Jun 10, 2024 at 08:37:56PM +0200, Michal Wajdeczko wrote:
> The code of 'control' and 'wait' force-wake operations are very
> similar for both 'wake' and 'sleep' cases. Add helpers to maximize
> code reuse.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 55 ++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a1d97cce3d56..b0baa9094418 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -20,6 +20,11 @@ static struct xe_gt *fw_to_gt(struct xe_force_wake *fw)
>  	return fw->gt;
>  }
>  
> +static inline const char *str_wake_sleep(bool v)
> +{
> +	return v ? "wake" : "sleep";

probably better with s/v/wake ?!

but up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> +}
> +
>  static void domain_init(struct xe_force_wake_domain *domain,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
> @@ -94,47 +99,47 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    FORCEWAKE_ACK_GSC);
>  }
>  
> +static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
> +{
> +	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
> +}
> +
> +static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> +			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			     domain->reg_ack.addr, value);
> +
> +	return ret;
> +}
> +
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  {
> -	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
> +	__domain_ctl(gt, domain, true);
>  }
>  
>  static int domain_wake_wait(struct xe_gt *gt,
>  			    struct xe_force_wake_domain *domain)
>  {
> -	u32 value;
> -	int ret;
> -
> -	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> -			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			     &value, true);
> -	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
> -			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> -
> -	return ret;
> +	return __domain_wait(gt, domain, true);
>  }
>  
>  static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  {
> -	xe_mmio_write32(gt, domain->reg_ctl, domain->mask);
> +	__domain_ctl(gt, domain, false);
>  }
>  
>  static int domain_sleep_wait(struct xe_gt *gt,
>  			     struct xe_force_wake_domain *domain)
>  {
> -	u32 value;
> -	int ret;
> -
> -	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> -			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			     &value, true);
> -
> -	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
> -			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> -
> -	return ret;
> +	return __domain_wait(gt, domain, false);
>  }
>  
>  #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> -- 
> 2.43.0
> 
