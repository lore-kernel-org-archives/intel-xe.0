Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D7DCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 21:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85910E640;
	Fri, 13 Oct 2023 21:11:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DECE10E640
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697231501; x=1728767501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IVa2PCleKIRO7zaf04H6igD+LxOkwtssrLAZJis7+Q8=;
 b=j2dCueTI2kXorZVNd+HRtrEZG0GObblCGhEtE3nZ9sxRzD3+sfrcwqMi
 TDQgjUCLcTBaNlNBPCniHcz4sB9l9sqBSc0CRl9lKYbQ3AsCQH9S4nfjS
 /Cn8jR06ltVq9ZYRbeQEe8u8+P75WKR+f1xkI6TGAgAm5lMnpj4W+bNQ3
 FZEtQbkA4k7cy1V07qP+L24kQQ2wy9QexDIzMQbnV1bCKzrtVN49sjjge
 INRBZrddDvws3DrdClRwhaKYzQXgM2eCASJyfQfAuQZPnszZKG752expf
 T2GxujAoQzcZiLCgVCA0TD5Ws81cqWUhvjjYvez2hqDiVF1aBGLTOGxNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375619459"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="375619459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 14:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928574102"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="928574102"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 14:11:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 14:11:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 14:11:40 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 14:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg7awSTLVTmfYjxlYnT93/NJ2fAOyMtKYeyxUHKiZ/Isvcgg1Z4AqJlt6tnJpnU0hooU4YfXm8MS6pIiUWD0Lv07wgasKnV3yA/F/G0zZH9G7xoP0RqfFMoMDsAx7AxL5yKRNTkgy07d89kaXyrXsWXAMncStTlyMbggEdH2NcGCI773ZIkIuQnadQxlliPnP/RKEzJIfd5rqkrdCJDt+WlZ+/xf8kwksQcxwoB8NAJt5A/6B5TCXbzkqq5pu/y39xq6Zh9jdQ7xITS8D4I64WfrHd/eynbW2JSenx8mxfPgmK4iZVs9+Zkl4n2y2uBtMbds9PDs5xSfRdIVwilYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbfBzOUb16U3JAGBs3zkt5kogKurFl9LGQUyDpu4Zkg=;
 b=Y8IYI+xE5OOgs6sJ3e7KjLA+MGpTPA46Af5o8xeOz69aqqD81l5eUxsBTXFW12PhZrfk9DEWMsCsFeZqE0fn0pcc8nGQvMhCMb0ooTKl44nkcU9nlmM4QMYiOpqYPpudLNNw3Wf8N4WRpoGIV0J3UXYrWG+CWyXtzcCzlHOPIRxgjjAhvfIij8+C/Sk85kUX7TUURaDcMkiMJsrnZnBoUsRD0KEWv83TDaBOj4Rd5lvI5xSi5WJrrEHEqthfzKFD7JYKtgV1wRestvdZsuKCzARaxT152PmF35GHYqd8p9x3LITxFv1CJiP37QIUGbM+5wNCBINenwSzleD3sJmKeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 21:11:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 21:11:33 +0000
Date: Fri, 13 Oct 2023 17:11:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZSmygb7JTOmEBFZj@intel.com>
References: <20231012093446.1332238-1-arun.r.murthy@intel.com>
 <877cns2mg2.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <877cns2mg2.fsf@intel.com>
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 7803760b-49d5-4eff-ee44-08dbcc30f9f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJqtlfM40a01qft1DIp+HOZAcKmiCJwgVohjCIPB5HmLndrWiDwSzZsJl0qRVqqnARzdZNyMXkoEBEnceGOWvKX7i8vl2wEEC3MJE96NkJo99J4Yu6cWVzuA/QQOxuCw2oxySVrAfwRQgqUXZxt88ly5CkqFt33FoWAoghQ0jPHOjtFwTX926nUsW7mACrl+FdirU0KZyOxcCWPA+OQHAyr0GoNgUMFmVrGsLfHX2OcFiMl76CByGnu6rrdeIz0Ppza048tWOcif5xlDzKJ2i5/ORSL/dTyxPZDK5aZCmUy3FFTEGI9gecqCYL29Nw1Vk/kP4xcmRbXJv42vQ1XNt/J5F5Xm6LQ9a27dc+MUN1WnjEZIboZdl/ZNXFs2nneeZGNLDblgGISrxJPs0NJxqXeZjOOZOYuXh5bQVks4FWLBLjkMA+eFqG/BBp/Q3PuU7g6JKr4o0ttW7w5cHghHWVEy7zOCEGHnJO+pVEn/jNgR6sRx2krwNEIs3IFxHB1J9j9HrmLrw5LV8LeU68KjYeTbbUfckMUaLaCJrCMwwk6iH1Y4vDuIEbIBkqjFX4XT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(6666004)(6486002)(478600001)(41300700001)(8936002)(4326008)(5660300002)(6862004)(8676002)(44832011)(316002)(66946007)(66476007)(66556008)(37006003)(6636002)(83380400001)(36756003)(26005)(82960400001)(6506007)(6512007)(2616005)(86362001)(38100700002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFpmXVhHFu8SGDZrw/UA99kKA3epSfGWF9ZkzPIlKy9MqBgHkfS7mre5iQ9O?=
 =?us-ascii?Q?I/mWzM8JnUL8L2k91WfFh5z1BQFs6dx+Ya4KwU6T08H9exuqx4cy/weQA/2C?=
 =?us-ascii?Q?hYpzD0B4XA7e1wqClVAoJsgC9vqnBAeP2KhnKvdGQfixEbP8yH5EqTOEmEQE?=
 =?us-ascii?Q?jNVgbLj9/8hx9XD2wkgzL5l6BIOw7efYlBWE5eRfSlkoSDzc5pKyexFZn/x6?=
 =?us-ascii?Q?xtwoFzOuezSNzUPeTPeHBKCKQFQYZ7FgehdmTXe9tBG23FtHAKVh175OENgu?=
 =?us-ascii?Q?Wu4CzLcWBB0ucACciSIkM+3neocnSyUtYO0VHt3Xqu0GyzITk6Nul64n/3it?=
 =?us-ascii?Q?bH0Y8AbbkNKJwiugvoKjnF0SfekcWM9YNzGmKD5EQdWFyTQAIFCoXnTjL9n2?=
 =?us-ascii?Q?fLQSI12UP80Gx30df/lNbijyxZwsS7RLoHag7Mwgcih5/CQoRXvpbssr/Shb?=
 =?us-ascii?Q?OmEJX2VaKhMVIMHUC+Zn0Wxu73xvD4ddRJxrM7wB5f072ziYW9gkjpOyXKBb?=
 =?us-ascii?Q?w2QpCbpKddjVZVGr5cLF3PBAZIjZMbcwTe79xFmwPRAagjOKWMDpXvWtM5pm?=
 =?us-ascii?Q?wz5StHU5sUzWQhnGGlAxbqIqNh/PtN8HUoFfSyvjSYrXPNSdxVwOe4S1ksZs?=
 =?us-ascii?Q?dyYE+zQcjygEdPjva0TWWSVetW3zeHQGvn+4wa1O8x+7IQCG1vrst95KEY5e?=
 =?us-ascii?Q?MLx8tOv9l5ulleZpRyxxN27pUApq0AK7W76SzLMVXq+2PoXUEojYLNRVShPU?=
 =?us-ascii?Q?hDbN5sgNW+LugeaKzIwAQZUDpM8wqoAddgIEu4H0YwI6zegrzzW/vxgiNIWv?=
 =?us-ascii?Q?d6cGA41mmqD9Kbkk/yP64WEBfGtbbODZJy63OqTJQUnKV+QGD9kIeXX1SBKI?=
 =?us-ascii?Q?HwYLxffa7U7pG6MS27w1x0M1LWRmkFKvNKa5bn+Jy0ieHe/OVjofy1ppkZUP?=
 =?us-ascii?Q?6fDE76oXlr4/NVLDXkdyTd4mlGu8F+Yb2UsTzX3wWPAnqvdfI7QsDGJtomvE?=
 =?us-ascii?Q?iN7erO40k2PbSRfDiqDT4HQo81AKbpeUKuP7dVTjz6VMNCbwuCbieeK3ToHA?=
 =?us-ascii?Q?jo2MQ0M672V2r0Q1nlMaVF6nctIHMKemfmcIuXLdpnpuO8BR9wjGCG2InmD2?=
 =?us-ascii?Q?KGylTNZJvx86wz8TGQOHpv+UXiJ7u7GyhPCYPJRHt1J+lUUtmvfoVDApEwR4?=
 =?us-ascii?Q?2fN/dZYCciI3BgQ69t/6bTikr0ojuCC4cpGhowEhkLAuoFmeLFdW7erTZOsR?=
 =?us-ascii?Q?CALyj0lz+1hn/rV+49E2+PbnGHKehwW6mAzotmjSc/b0nnLpb38fi7NeRRc/?=
 =?us-ascii?Q?58RUfOsB4R8ey1vsx9T7jlsJ8Cfrdy8ohlRK3aau8cMMa5FLzcuoOyTExVnZ?=
 =?us-ascii?Q?WTjJRQOkejM3NqdSLcetvHMujj8Sv64h+3/ICIP95NXMvjh4vR9c+TrwtOS3?=
 =?us-ascii?Q?RAQraDafEe64jgKSOUumc4aGOZ5BHhkYymxI439YfTvuAGHYJTxPUyLyVr0j?=
 =?us-ascii?Q?3DWQOmIDPc1e/Qu5hl/D8sxKlZOY3t7Lg12vtPVnCMNQ+ygE6jiZDLDRm747?=
 =?us-ascii?Q?4jp7CAi1i/PamsRf16uGEmDzMBqygDXpfLYXs0Qc/8mvSJwEF0mAuTfOJcec?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7803760b-49d5-4eff-ee44-08dbcc30f9f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 21:11:33.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqwynUoZK8pd/Fsddz+6F1uEfu5vQ9wZ0GKY55AgaGSVUQ0V8Rgzt8mbrGqjkm7JAVHmnbFqrwtDRES4HY9lHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 12:56:45PM +0300, Jani Nikula wrote:
> On Thu, 12 Oct 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > The modparam fastboot is removed from i915.
> >
> > This reverts commit 3c73fdaf8f58b55b0e292fec0929b6502c2b3a3e.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> on both

pushed, thank you both

> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 4b73db93d23d..e876fa6db285 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -4988,7 +4988,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
> >  
> >  static bool fastboot_enabled(struct drm_i915_private *dev_priv)
> >  {
> > -#ifdef I915
> >  	if (dev_priv->params.fastboot != -1)
> >  		return dev_priv->params.fastboot;
> >  
> > @@ -5002,9 +5001,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
> >  
> >  	/* Disabled by default on all others */
> >  	return false;
> > -#else
> > -	return true;
> > -#endif
> >  }
> >  
> >  bool
> 
> -- 
> Jani Nikula, Intel
