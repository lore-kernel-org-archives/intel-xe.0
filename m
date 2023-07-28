Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B21C04A6A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 18:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49410E747;
	Fri, 28 Jul 2023 18:23:56 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A03410E224
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 18:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690568576; x=1722104576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FXugJQ/nVwY+Cwe+5VAqAB0zpN+1KDN85o6CMi4prBE=;
 b=gsoBC9VMcqjoDrv4g2f9UuPD6Z0/zvjj07sqoQQHdGB1oYOTJmbIrFhP
 bZ7d8gEJBFsqRKj3vVhcQwlEPjT3acl06an/Z2uK0Pn+iUM0rydhCydSo
 MrUcwd111vSiCpSZDm8UZx1D+xv5rCEXFEnMZEb+ykvrxEuwhJVS5qsMk
 excGJfqilLYbOaMHp7+8G7c/7KNcAv8EaDfDApKZuxxvBBcFypm1WpMLw
 J5hPNQqPvAKGSsax4fvrwRjiPYmCC1iKCwVsntvdPXLWyuN86AGSLtltQ
 JdPBM89gqpu3KSd4a9b66TIkjfaaCTsYRPXzjEfcN70RHZvFL6RROcC5E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434942612"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="434942612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 11:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762680952"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="762680952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 11:22:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 11:22:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 11:22:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 11:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOJ/oc7/n+PEAkgvwCUSeo1CRU2Lwu4OhurI90pAk3SR7yOY7pEDFekrl5ExFOaM48T9E6Y5/MTiqGiINgxcvAVJmIOmMw1Mc2W4RQOYcEKhjPGgK3lRNXC69xDzc/IOOh5VN48HjxXO6U7rcMLZZE021ppljXKCZSypUDHLSgGqLBnGGavzp09FtwzCV15nj8fDzJuhzYnVG5bJf5cb/wrTfnOufWru4HNuF1QPgemh/r/ep3nbG7qJigg4omFEU9pD9fan30Dy1Zbt/U9xvTPBHUuLSqMJyL7Hx/2Bpnf/CW45bei9z0pBvVbC76G11VKE1m0DWPIwAhpGysNO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZoA43KC1Lim16Fp9Kl2LYQxTmsaOiNhu0vlX6fldS8=;
 b=Qq5FRqEi8IJpvDmULiSs+Yha9gOqu85VE/QrBZslmwVLzPI/Zx1evpgqXuw+u0E0aE80nBV9D5IzQeEm7trVv4RDkVSvu5eN67GPAdQQh7eYd9M0r+O2rOedCzWTLrSGnMBnRguOyVX9pYjkfEpSb8AaGGcFevhkUiyJK5msH3tS69y08hL2b7GjIjcXHyPoRYvWQsckq6sL8t4COUeOBs7Sr2QcFp2/1hRz6htM/X5qk3dX3qdbjGyH0Jqv/5QQVo+Fauk9cLbLeW/zjU2QUiUzt/ihBT9sjRw1HppiviVax0Jt+Nf1UEMiBHw36+wGB3g0Z4q+Nbc4wvnoWIVU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 18:22:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 18:22:52 +0000
Date: Fri, 28 Jul 2023 14:22:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZMQHddL/uBrHo0LB@intel.com>
References: <20230728175601.2343755-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230728175601.2343755-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 56423bd2-0387-4b30-31f1-08db8f97a5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4kw3XlyMKnjaE9bbNwmnp9eI34r3Dpp2NHV49lbP7AuVMpDDkPXTMfAAPTe9NWYNLUsqvOTTqaAfzE+W6MTqWih/3vYE2xauHfnfhzwbARSpMPJbjdPj6vvPAOtvA39/O2HHcl53a4SQvZoieGViqVfvW1N9CKjk3fhMkySPsmcF309dWAsoun0g7V8UpQc+v3WPhJ5BdnVo0rol402rdQZiIBZnrLnTo65lOZi0sMhVO35CxIG0ic4ett9cGz3bKkLFFLzwC3cKYTDvcbUEgPzyD6QWqFnNGA/KqOjLhltLsXiZhy/sqxy59l0zLN6RPYsbpdUmMU92UCx+xXOFfXDAgcgz9ijLep9fJF7ayVKmV6t6k9otiSI2lHCEuLXBBuch7YXxJuQcPOidVtRfdZH6NuKXElKiov36qGH5zQNtOP/YZqGNtSV4wJsEpKT+eGZeGzDCsWrsMclLFMNlr3DZa9U7UW+8iou9uHwOIkPU9tURJQlBocwCr1XZh6kxxZQ2BOm2puwtpz02/oIVnT9GOmWsLj75tBjr1XOw8QlBoQfoWOg2GvxZqZRZU46
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(37006003)(82960400001)(6506007)(26005)(186003)(478600001)(6486002)(6666004)(66476007)(6636002)(4326008)(2616005)(6512007)(83380400001)(38100700002)(66556008)(66946007)(5660300002)(44832011)(41300700001)(316002)(2906002)(8676002)(8936002)(6862004)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBlCjLjBbKf44o/YGxZ25gyHCWP1Q0lf9gB33RyHPNQRBvsr0HTko0mzlMvS?=
 =?us-ascii?Q?goaF4WrOeNZayCKbqWZMhoTZyjXahZ7yx0bxeFv6soDUqHpwrVI1S+i6qX1V?=
 =?us-ascii?Q?gLo2QwMnmidTadUK4veYSDCj38ov4EJi2k1pLiVgyY/oe+T173SM+YzSr3Fk?=
 =?us-ascii?Q?lXQVcT72zpMpFCodZihtp9m1MALE+5yroV4viIStpGqGvN64asxOdKAoSQ32?=
 =?us-ascii?Q?zBMsvrAA3IJl3ay35+3lhKHdc83ZmMqbYpbKgzW5FdmnXefpgKStAAC++U2K?=
 =?us-ascii?Q?kVma2OUkjHjZhnRFXFHxv3Y8hVZGBbLHIApYaaed28Z484lI07YB6PFPrrHb?=
 =?us-ascii?Q?0NFuUjP50U84h60M5V4jIJ/R1s0uebdvYcynuNgY8K8f3uS+NpiVd5G0Nv1C?=
 =?us-ascii?Q?G30aTPzQ0w840HL1cslygrmmGzfLktd/YaO8y9Ujib4XoETQnuhPgWVA4BnD?=
 =?us-ascii?Q?qViz2t9xM3p8AVW/GzlzX/FHvZXNmKwayGj9tV3N57QeQaVACHdlrHwiYITc?=
 =?us-ascii?Q?j8w+FRRVYJHl6A/KfFttwqWIas9E3U3SiGxXfMFlUOQ9iSwsuqlym+aHcrVb?=
 =?us-ascii?Q?YHUa7WWhvDk6G653kUG3NIDyvysoTjDT3o56bMLPOPlbmZuj7WpdHPeSrWYx?=
 =?us-ascii?Q?EwD4AlHez7SVSrmw4ZadLwF1x6FpNNVMDDdH87XUEFq0PUi5z1sHXPYuaVXO?=
 =?us-ascii?Q?vOlJ4YdC1VQlH+x3jFH+d3xtO8anqdr/xdD1z6/OVHcwC6nFCDI1caBflfRd?=
 =?us-ascii?Q?lQiI1LJrBRFPSmO0dxP+VXkLw7X1gxNEx+gxUO8xGz0lydOb+XvcLlOH3sBP?=
 =?us-ascii?Q?iYVhjDqYrDFSrFPFr5gg2ZHWQRvOsUI0r7i9FezKOBEJQr1GKdMuEfH2FKwf?=
 =?us-ascii?Q?H4/xc+G8A86QM0AfZm3SfcuorO2yzC4fzaKD84cFNJ3jNBF0Y5SwBkhW03Ch?=
 =?us-ascii?Q?io43a7Gy7fLn07DhBwgDwAUJgVMR29Ddy5izUbqkLbXeZxdF5mWWWCfrhxSg?=
 =?us-ascii?Q?aHvH3yeZ30bqmBamppm2L7R/DjtB0L9U04J4ujZrGet1y5kwxqWF0zBXWKgv?=
 =?us-ascii?Q?oIv5SIAy5wlNrZa9oeUzmL8map3t8KQYeLchbHPRvsMoMVGv6kKNES/o7Wat?=
 =?us-ascii?Q?M23WgqNCpgJ84VCUo/d0AQjsBXtdem9Wzl+DQ75s4XjJmFnOuPdJmQZmh5iy?=
 =?us-ascii?Q?vENtKOdZsAHTDdCiccKlvBiCf/DOtQKUG2s/iACZebpfiFybWfyhg9ndijWc?=
 =?us-ascii?Q?aAeyQsOdtAF9MBYepkS6F9vF5ADr9GVPrPLVJLB82M7BzDNjERmqRJN8xLxH?=
 =?us-ascii?Q?8JrZ3Ofeo8iHUp+GgchIGaZoeRrp48s179tYtME562gx9ymFRmLDtEyaRcBx?=
 =?us-ascii?Q?X5/Ba7Up3SOQsNZ+1nFiDYzrrCoAVPtLO1LngTK6URD7cYU4PdsSTGP6d+g0?=
 =?us-ascii?Q?1m8j9oXLmTJ8yMWFgXZkqPYw6GFgdtyyNaEBZZ9EDjt3uJPB30t8YLjSGVzA?=
 =?us-ascii?Q?xgHI1tAm9wO+5Y6m+ZM0Hd1PHzkywJOWCdHokrg1Z7lI4H06wVHKu8Xi1Apc?=
 =?us-ascii?Q?5X/HxRSM+pil4Q0H31BOZrez753gEqAtx6Q29+Wm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56423bd2-0387-4b30-31f1-08db8f97a5a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 18:22:52.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/A4Vri4VX2jN2/3nJCubhqJRQxxjIldCX5gO06vA+q7eHOY3HXKSLK9Tfp+o9wvuWJQ4Qyi26wIjpsCK8Zv+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mtl: Reduce Wa_14018575942 scope to
 the CCS engine
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

On Fri, Jul 28, 2023 at 10:56:02AM -0700, Matt Roper wrote:
> The MTL version of Wa_14018575942 has been updated to suggest only
> applying the register change on the CCS engine.
> 
> Note that DG2 and PVC have a functionally equivalent workaround with
> Wa_18018781329; for now that one is still applying to all engines,
> although we'll keep an eye on it in case it changes to be CCS-specific
> too.

I just noticed there are changes in DG2 recommendation as well.
Please check 14015427992.

In PVC it probably doesn't matter much because no usage on RCS or
media engines...

for this one here anyway:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 497a8c05c715..5cf84a096302 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -238,21 +238,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14018575942"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> -	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
> -			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
> +	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
>  	},
>  	{ XE_RTP_NAME("22016670082"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
>  	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>  	},
>  
> -	/* Xe_LPM+ */
> -	{ XE_RTP_NAME("14018575942"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1300)),
> -	  XE_RTP_ACTIONS(SET(XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
> -			 SET(XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
> -	},
> -
>  	{}
>  };
>  
> -- 
> 2.41.0
> 
