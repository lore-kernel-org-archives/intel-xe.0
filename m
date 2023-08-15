Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6801CC001B0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 22:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090F10E082;
	Tue, 15 Aug 2023 22:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9766110E2A4
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 22:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692140097; x=1723676097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3IPqp7YEt7vGZLeX5nwzwvMWfIL/SdUZGVc+Js0KEPE=;
 b=JqgyUOLFK4APBUTZVEWDHxD8YmUFmAD/A9HYZp6OpDZrj0El/i8M8oWV
 9dCLo6wGFWy4Px8mLRe86xrOcpimVKk66JnEV+2NyPR9UcE7SShetpw4w
 CrSmQy4OqDK2JETbiLvYWs04hlNts7/VdNiArFP6obc6iqOF/Hru9DGil
 d7Rxg59FMjXQACt0BtZZuSwSQlBGkApZZmQ+PFDfs/QtEDTMsyQ90SfBZ
 XdTw3Gi/gDoL+k442jnl5gY50itLW1wH8E8cuaT97teq2h4nw4dT0ERlt
 ze8gilEpqO8s5rV+PVFMqBDfhdkQkfsFvml/Mcxaymkg6To+5QREhr6la A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352723006"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="352723006"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 15:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="710908626"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="710908626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2023 15:54:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 15:54:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 15:54:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 15:54:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 15:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmW2KCShIN4EYIdkwZSX9+IlMIUfCtRL3Y9QDFqmJ2KCHMDBRtL3u+ceBv+DZt0yfyZniAloyZWroEhuigewSnIwAueQUmsOiCF5mK1GXmz988ej7Q/4W6ryW/TBb0S1j9q2mf05dQq/X5LkPsIUI3Zgyc9NWSWKnurwUOx+y0KjgnI66uS0omeN+2HnZGCOgyUXNOxhoK7PjoR+rZ9BJHkC3MqwGrNkOxqas1/PFVbZ6XJ4OldlshfM3GTbowz7INS/JLXg6RJ+YpDJb4YX2G8f8gwflJ2a+ue6bLQzQ50xghGaNJCx6s/CpNL7v93lEyjYCI0ljwXniD/27zA3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8c1Gs5DjOqusekkuayTMuH2RMQG0r7tjwuGvNnG+gKM=;
 b=W10nyv05PCkkNVH0uVofJ8768YL0Bax03MCoZJga7dTDI5gktxMAH6zrTdy4/nNInARQV7k/+0uTAshyK3VYbMrNFCyfwunD6XYtttS5iGhnoUaIfQBtlmYwlyMpg6dAbhBiLBoiruUH00Olm+SxrgOOvVDX/PLB1RvTwIeXy+KOywBoTMKpZ0YactME+fLKUPAVgeL5JlWkW6Xtu9PPlNWYrXU10trve1cIDbQHjD166NVTAbU48xWcZWTNfHlQXyyu7ftKzjz5Hqy1ZJup+BxxG0+sOFSeIl9WClKvgnEO+zMjkOOmxHY/fq/Z3rQpyD6/WVo3IuG9EraEt6xcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 22:54:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 22:54:48 +0000
Date: Tue, 15 Aug 2023 15:54:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20230815225445.GP3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230814150323.874033-1-shekhar.chauhan@intel.com>
 <20230814150553.GK209733@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230814150553.GK209733@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4a5d3f-34df-4cf5-94c8-08db9de2a06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aeyUgbD9L19MODiFPcOeMpDNWN2cvsZ/qFieHyClDCSb+VO1iCQ+EGfJi3N3vwutlcas8RO/cSNdsl+Gz/1ah1f7sEjcm9JjbuUXmcIWqBusOZZoWzkMgcBsrjnSQZ6EtqfhlQCARBM3tdL6Bnm9C+RRK9ZX6/RdWv9SFSk/U3kfcuW9TDUjsYjG3vaxoJhUusQfrG7SHuVGq7YhniCrXSLIvtfx7Q/3mD+6GmOFov5t/IKTafZst/YneJPpKcZOGzhYu7OiVzbgE1WtaXJQkhFgMoIqIIjE8sMOuY9ADceU0jUnW6rGyjYMhn3He6saqLU78BqaP71tJ3ji0QF+ZnH/lNGHAPa3aPNXeG1TclU87ZJyYq8j4pBgC45xrMXLH17Yfcfj8d6V+D5cH+bGzaxS82ktLEtiF+jpdDOFAzN1NC7Xz0jQHD+VVoEI/zPqu5HJwL7s6tqYFMiI1v9H739Bdi4Psf1+afKCcN7R2vg4jL0W5NgDFiWo5w0MmzzIYCDMOhiTyo41lTIcqK9S8DUT8MLWU0aSM+fHomUxYIrzVaCoz6bwi5Pr+N2Cp61a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(478600001)(66899024)(86362001)(6486002)(82960400001)(6506007)(66476007)(5660300002)(66556008)(66946007)(6636002)(316002)(41300700001)(26005)(6666004)(33656002)(38100700002)(83380400001)(1076003)(4326008)(6862004)(2906002)(8936002)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wR962WteEwYf/5XrPYBOW7ios7+wzM/DlC5TcAFYb2nZ2PrQX/4Fl0kkSMUL?=
 =?us-ascii?Q?hOQ7KUx2zdrVE/G98uGPm+FIoC7Fa7OGkpUMTF4F50HexhgwJDMzlutBcSd3?=
 =?us-ascii?Q?O/CGEXaQ2XYyhOUun0Ans6yPOceN5ROWiCC3GnYhaPF4TOXVKhnhDBizU3da?=
 =?us-ascii?Q?ZS+TUTv4J9fPYiG9taLvyGTDNk10CkiRU4IA2Y8skHaEPit5mYxfKXxghBEP?=
 =?us-ascii?Q?Mi6rRItzwgd1Sn+dxvJ9ibW6Hy+Cp5gZXteCaEzo/zH/aLHl9Xrf42CqCTkt?=
 =?us-ascii?Q?jnzk08+y0el/Ii4HOPnY1Uk1639nhuMisq7LuCXlaPbgNO0n/lMtsxCTZbtL?=
 =?us-ascii?Q?tMRAkROTkfhe8LkhJxFQMGJUkizfRlKFA1o90adxE46Qj9LRo8Q1N5Qo7pIv?=
 =?us-ascii?Q?FrIgoY4Lmdw3DRumDvBzf+bCbkL2rv4v8FROMAQLV/CfEjr3mtO8u8G/cRpu?=
 =?us-ascii?Q?k4tZBVvgsW/AtrmZ5L6wAXPNatGiDB90XHMbF0joAjAs2QIK9tPrIgV1UHVg?=
 =?us-ascii?Q?XPokA0gJqEIvZ81KBrUPgyOQkXWQV3ljCuoHn+kb0p39oD2L2SBq78kkN4Bh?=
 =?us-ascii?Q?YpgWjM0qpfLe2T4pve6MsCTpf0pD9a5D8eqNDMzspa2lE09qcTVpA7PSCJQ6?=
 =?us-ascii?Q?Enwg7E171l4BDj8JwOe5b1DMZDDVMja4pBb+IOBRc1wgzH1a/bDdeF6tYkKF?=
 =?us-ascii?Q?LrSlOygafs7o/0dDK29TMVtMNXuVhmsS+sGNr15/Zet/XzxOCTxwSDpJRGe9?=
 =?us-ascii?Q?x/zY1cknI9lajgcwcBOuvfM3Xf045J9TyFw+YPRwm4XrqpnP0D7icMAhx3Ps?=
 =?us-ascii?Q?dlyCQ/tjui6YVwyXF/bLMfoEuOrVKr0yTHz+xVuq4vu1HU6arEZYgPGNCM1c?=
 =?us-ascii?Q?2j/Shu+4AwXceN2tZ9TcdYXiIXKvsTayB98xPHL1pamK12LUA2RVJCHmua0B?=
 =?us-ascii?Q?2NnADLhSam6x0rx4KDFCLHCSCKvCVUqQqXSgBbNo08oTqkMdZaxtBE+j29TO?=
 =?us-ascii?Q?35L9pqg3Oysn9ccqqzeoY/T2gD/PDYq8B1fBx/DgAS/Q01Ok5nPz+RomyFwB?=
 =?us-ascii?Q?0SaAuQQ9A1PVakh9JwSWx7FBhWAuk5Wo0yovMnc2JmEp00WF2/B2StBjWnZs?=
 =?us-ascii?Q?/kpZd1Z/m4779xkJrO8T9fZqga4tkqUlGKPHu9mXYYpPyocTDK4hu8EgWVio?=
 =?us-ascii?Q?+TCVai7l2JrmsnAkMc2PFggGi++CiHg3jY5yVQW3RwqHdRpkgo9RZAo0VdcN?=
 =?us-ascii?Q?pHoylefrdUXSh3NegY3cfTS/jL0vDtw7/jwsjlENrb6KRb8OCwQBCJeMXMoO?=
 =?us-ascii?Q?4aCp1aDR1/z5ewhZejuI4hZPnPTlj6iUZYMLoPSVNXZg3lOnEZr7LV3edvoL?=
 =?us-ascii?Q?8bqHjcNRrDCV04aKb6zetvm1dT/KBFt+oXfK48pPHyGKJpoaqQsyL+ls0DNg?=
 =?us-ascii?Q?9O3dGYKU6HFieeQt5LdQPnQngkxdJcwo3gj8AyB5nuzEBLGzEvIAyihh9485?=
 =?us-ascii?Q?riBIEcqDPUrWWii4VUEmQe7BaE6Bs+LUrYWUFJtFm3qPvS6oveMo9UqqBxVN?=
 =?us-ascii?Q?AAERTnzRj4xDtyCsLdAZdbAOiTLR7Lcg1+oHJhPof+BUwVqTJOJp4IImnMIs?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4a5d3f-34df-4cf5-94c8-08db9de2a06c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 22:54:48.3813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgrHeKIAyM/dX6kfR3rSJMJjzv6mOyjpTzfOyzjvqAHfSN6K/S8erGxGNCzPzOQbtO8AhzDp6Z6YtgSy5822VIrJLHqvuN657PDG+u7B9Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Remove Wa_15010599737
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

On Mon, Aug 14, 2023 at 08:05:53AM -0700, Matt Roper wrote:
> On Mon, Aug 14, 2023 at 08:33:23PM +0530, Shekhar Chauhan wrote:
> > Since this is specific to DirectX, we don't need it on Linux.
> > 
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Too bad the hardware teams didn't do a better job of documenting this so
> that we would have known earlier.
> 

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
> >  drivers/gpu/drm/xe/xe_wa.c           | 4 ----
> >  2 files changed, 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index c93d8f8cd93a..7590990599e6 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -90,9 +90,6 @@
> >  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> >  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> >  
> > -#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
> > -#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> > -
> >  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
> >  #define   TBIMR_FAST_CLIP			REG_BIT(5)
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 5cf84a096302..e2b6e17d7ec4 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -599,10 +599,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
> >  			     SCOREBOARD_STALL_FLUSH_CONTROL))
> >  	},
> > -	{ XE_RTP_NAME("15010599737"),
> > -	  XE_RTP_RULES(PLATFORM(DG2)),
> > -	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> > -	},
> >  	{ XE_RTP_NAME("18019271663"),
> >  	  XE_RTP_RULES(PLATFORM(DG2)),
> >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
