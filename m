Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E29CCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 12:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6610E195;
	Tue,  7 Oct 2025 12:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB0JVvBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0E410E195
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759841601; x=1791377601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mjjBMJPIAk41CfPQ5NrT2f1wQUyyjNuzTnNzvXHq5yw=;
 b=FB0JVvBC+YJ4n8VpPpFPo2+F9hOsf68+L3RdsF9g7X2X/PNPz6rDdoZa
 UeuXPEOBiJLVKREdYsyXX1P892v0XoFallUadiEDYmLJ6Jeg3jd8Ddp+E
 3GwMROlsndhmIBFGZvH/dPOIuoez+dQsv3qvVmmNbDP6K+iwlpJ8gL2F/
 959bYOUiHii1dOTTRKDPH5oUmBD6Eh9vgutNAHDrw0I5b06WexvHhzwvj
 K/ref4FLiQekpFSLXiCNeew2oYyOCq6j+SHgsCfOr64u9ZXmdH8XovEQD
 wpOkACiYsILtW+3mLYgmb5/cwuPs88VqwFcF+YF4yEEOTySC3ryAE5pTB A==;
X-CSE-ConnectionGUID: lqS8uc4ATEq8OHKodjgkZg==
X-CSE-MsgGUID: SJeKxzINTqGiTXotypdhFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64638371"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64638371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 05:53:20 -0700
X-CSE-ConnectionGUID: ZMSTXgB+Sp2NnPUnX2S72g==
X-CSE-MsgGUID: iksUC/v2QlGtJUA+KEFTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180574865"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 05:53:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 05:53:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 05:53:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 05:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2wR2Usc6JpfAkfBx7wTvj4PRU76CWBt6Hgr+F98XPK0OnqkRUaroM1DLWFhlxGq4YXYOABp1kKO0lDVdudLD4s7TsLqxNT3JkDQTXzA34CsUPqSjZsr+6IEOTErbnHjxrHP2kkIiKv8zVRE5gMKKngJfeKqH7lkwgSM2/MJ5OrlxFVK4qyDDqY/H0Cn583X0maA/sMlHSgSP6c4YvF3Kse6JlffTBSgWdmVg7sC51talLjjk0hQpV6JS+Qe0W4LRbxqja+4iRTM2o4MpiKdOnVLYA3tiKdLPGhTRRqNy9afzG0xNc2snMvLZjreV8t2xSTQcgUYjaMPcNxN5iQU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlfn14bTIq+7v05wzZqNtOYOpAY99ZYkwQj35EMcpA4=;
 b=PQmgNGfV6bd74CcXu1LwwSWPPqCadzjheZS1WyIMOYll5pYPskgFFoisYfzy2y/HG4OySAq2zsnTTW2FvmNJPV+629+AhMMdCST6PACPJMwszvWbBVD3E8DrOgCbGQqySbbdaF/AQCCXXEPvUfdvkM44CCGizsT8rdcF3YNo08vtspekl95HIkn4BYwnoFGj5bDIgysKvE3MvIY0ihuAHrILLrOGPSAfLH00crBaX0KTQpr23JHWas5MyJV8W50TZxGjKfyR2IhY+szHV6ffKcb33gtrHF93/B2TRXd+Gyb/f4ukAHKpUlN7hdPq5PKQU3C5g4HrkbzQem+VqVnTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 12:53:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 12:53:11 +0000
Date: Tue, 7 Oct 2025 05:53:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 11/32] drm/xe: Move GGTT lock init to alloc
Message-ID: <aOUNNFAx2in/HIwo@lstrano-desk.jf.intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
 <20251007112641.2669655-12-matthew.brost@intel.com>
 <f5d2328f-8069-406b-bda8-1d98803fa568@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f5d2328f-8069-406b-bda8-1d98803fa568@intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe46fab-2a0c-487d-edf2-08de05a07887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VDpN60F1dQv7cO5xOOD4/e/vwzEdek46RJlTyOIj0ZRMrYKC/yqUCbmLyTMs?=
 =?us-ascii?Q?OLO1vwAmASAIS1UOBPZndVYGkTEQ1GAqpuDVtTL6jDEnFKcHNHJ/DbjUThQk?=
 =?us-ascii?Q?SqAQ1OmE3DbEor+F8vuCvS+L5TfsvE/+Aha2rvPHu/y6l4oOtbdeS1elCtUt?=
 =?us-ascii?Q?0QbexB78E+y+xzFRzm34RFunP6IGitN84TVfL5UUZY11zKu0gHc+WdPpk0UL?=
 =?us-ascii?Q?9XAThQmwHQ0PbS+q3f1n0F33GsaEYU0Gdh8o71T2UCEWplx2VdXHi8DACGTD?=
 =?us-ascii?Q?0yi04Gm3S9jBvGhf1EVwxGMQ4Q3QhY+s3RMX9z5wVhRnNkz+7BwfFw/XiZv7?=
 =?us-ascii?Q?0gjH6ZbtdOZVnEYjof54TWK6ioOwtf3n9wYMKq13ugGYWSYLioWlS2c/8hfR?=
 =?us-ascii?Q?mJhRI5rNKBXcCifOXZMybmwMkcaHwiG8oE2u09WBNQb3/X8nmwNGWj07NU5Z?=
 =?us-ascii?Q?tWna7mIdI+1mUvIpdUPDAEEIYk+IBs0MqazpSrseE5IEu97a+RzfjntTV0lL?=
 =?us-ascii?Q?FWG3plDuCpv2nLq3DFEM8BefoehkestzwWw8d84BAQ8ERHLwFLoGC4CTmcgE?=
 =?us-ascii?Q?j4GB5WfiP0EiInvnOZXF1ntPQFootdjzIoEGoBfqletJA3o6aE5gyxWTVW7N?=
 =?us-ascii?Q?8VoLFDdZfcAv2v9VldWNEe0VnmpMOeP2N31C2mbPHiH0H4J+D60oYQ+5EBlZ?=
 =?us-ascii?Q?Q3CvTcj9woPc54z8QR8gP9zZNx/+a0+SZ5HYNdYtG3q/GyAEfP18nSP9LURx?=
 =?us-ascii?Q?HDbNEcA4S+04oOvq1g8ccBvJEmuHw2n6gp1f3V8s8sRzHmC6dQU9v6LiuyWg?=
 =?us-ascii?Q?CTDBdI/+UGZduohp5GCa63UskjbX/KicX8WqHBLG17bolgEQF2f1SUewiiqN?=
 =?us-ascii?Q?e/kiWYGPb6dyoe+B20G5c9nq53VJL29PwnyYp6TLvZ2QgpsaLzgW9kc2934V?=
 =?us-ascii?Q?YnxJE9oTrjr3G1owMcXjk/9dCdpVuT4gx67Z34WEDh7YqBmNNvemq4lkKslH?=
 =?us-ascii?Q?IShE8OFuxlK2MHuExN19TUSWCK/Y0/rdOUcs7M/oJPrzGI1peWj6xYCxGSxm?=
 =?us-ascii?Q?YGcncTWSKV0ki6a5k7QTaWb52SC+j8s7IpreYht1gNGP4MqfQnPPfHAxdO/n?=
 =?us-ascii?Q?vxXok0QELGhN1mXrUfDd/5uEkELovudso1PgPjU5PoL6lJxQ0D1zyAeBiaBJ?=
 =?us-ascii?Q?caKsUBAP8skrjxzwjZFe3637Qi4kTL5IPr3FTRqCcagFy492COfl00jRRips?=
 =?us-ascii?Q?1cRAq/EwO4UcGFZyKhxnqaTAAtZLpeQ8JzKug+CPK3jEsatIc/AMJ+u2DIbU?=
 =?us-ascii?Q?OEJRNAB+UTH3yUxSTV7UT6xvotzaBBazUGnGq/76MMz++AuCB4DdmZv0ds3L?=
 =?us-ascii?Q?+YBkB4T0+oyiSpQiLLELk+OMH7Fk2XsfxETCf7wZ2kS66+oW+7pzbrxx924a?=
 =?us-ascii?Q?bEWP0T6LAq/1wCIEUVHWij0whMWGaDa6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w+2q+nGNg5rhugYM9X4B0hmvGsbOA8XsMWdPaLZKqbXp1HOKMqBTijYISpmD?=
 =?us-ascii?Q?MzYQy6ygSw3kWXVo+jSzxZgFlWW15BqBx44sM56O8hkebI3AkYG1cgVOFM5k?=
 =?us-ascii?Q?llniwRBYc+8m6kDjDtg07MzelTxw8eRIwDmnJbF/EkoQbSwdjkYjxvmemIGo?=
 =?us-ascii?Q?9w/2vh4hDwMacqFOkrn/kut3G2jBbxCvOOQb2jiHVbXqdsB0f/GhFIoUxrbk?=
 =?us-ascii?Q?xikDuib/6TCKTdMLNn37NwtAbJTVXJMWKiwRe1xLmZrtnvITj/GiknPpggm0?=
 =?us-ascii?Q?RSNwzCIu5MIeiTjSQ9MTpHLvZ97YPEBOXXOFGYzojpSdOX4fbIkSIgN51pda?=
 =?us-ascii?Q?SwXHWk/WmKKFvaN6MiIgTg5dkEHZaVJvfEokP+tCNwYL+Qm6S4aFnvZbajsC?=
 =?us-ascii?Q?PfzI6K1F0cDqcRSOdBFuU62CFvErmZ7E5/YE2dxqktjFQ9bbGQX1W2l5ZuLS?=
 =?us-ascii?Q?lRJNxu7axgXzJ2kIVvZRe+shvGqIzKbUz3pYSofJGiaVoNWpYjkYImOSL/qg?=
 =?us-ascii?Q?4BZAXurMYvzzMoIYla3JK9rrjiWppdfN8QVLa54r7WarGU6cW+ru5PjjpKpn?=
 =?us-ascii?Q?Ad6gyleJu/oXhKRPO8Shbzo8SweALH/ZYUfuQUsFD43LB3bW9l07+iWQQidL?=
 =?us-ascii?Q?3MDImUuNvvJyt/NdlP8ZAoHsHvXOZKMEYkZ+Gz4gEt2n4meDuB/fC+eBU4ur?=
 =?us-ascii?Q?A2esyUGzyPPq3jWfsN0AUJTYPju8XAGwXURFnkk7gu/aJMkz7m55HeRPV52m?=
 =?us-ascii?Q?CQ1jWyJtbLKCPMRwVq4D8KU194xkdNSuFwgJ3smp41YvDfw3d8Cq1VMN+1Sh?=
 =?us-ascii?Q?OXw5WswUqIUafnRv0LfirPdzc/Lb9NXaZFashMhiBHij1HhSEYmnW3u9Cfnm?=
 =?us-ascii?Q?9Ywc5fl1Aq1nJJqlc+FPlHbGoK+vt1u7ovoGoWeIUC/l/cO8h8oKbdlx++fP?=
 =?us-ascii?Q?OptwxYBgRHZJ+mldIN6TTEp/cM9r5mQMv/tR17xk2eHz0A75GtstneW/QOP5?=
 =?us-ascii?Q?ChgunCwmk0F2EXbduWOCMZmb2s3aZBopIsZLSCwKUTHeKjSO2Zfg34sZaZnm?=
 =?us-ascii?Q?ts+qloSFcb/dyxxFgYgUu3/Y1grx1hgqOqAaezrFIu6xQTdxpLP0iZZS9Stw?=
 =?us-ascii?Q?u+zgvL1EKUSaqF1PXpLfJBuBMdz3xCanEoMj8G4VXHGZlXZE9c1Sv0ctKcPg?=
 =?us-ascii?Q?EqSiUwAkPrNHqGDM9PXGs2tFuJUfLyF4EO81uDEg6XHGYHZIa3/m+I2Qw29d?=
 =?us-ascii?Q?rysW09q6ZWEZ05FRkx8cnndlaHFuDQOj2l0KESuPdTz/VHwd96ea9xiMussd?=
 =?us-ascii?Q?GSe1VfPyac367/U5i2Ciw10Lx8YjkMK4aEI6qQvKFWCbTRBZOGtcpAuLhPuK?=
 =?us-ascii?Q?QXGF8/q2OB3v/owrsrzO4/iA4rvAHObgHnJfe6PD8r3b/7KZM3Rl/ryMRjO4?=
 =?us-ascii?Q?CxJHumJt72LQ0cSEQIHlxCfRyhw7uMUMEwFX6Gi7N5f6hwQjJD+HLR6eK55e?=
 =?us-ascii?Q?ew0MT9UY3+83ZtEDWvoBZUmWoJdIPADhY7z9C/hxJYU9mQntRq9qfqs8Zcz7?=
 =?us-ascii?Q?rH/yqvfj4Qs6ZGBpNRkil6bgbLSkN4un6gC9c/RfWwA1kaooZpahUoY41DS8?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe46fab-2a0c-487d-edf2-08de05a07887
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 12:53:11.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdOswVZ/l/VirJRJagOcMMT9V0w2zS3o0p8he+BIkXfC0Fct8Jq9ChtubLxQ5LsEL869iVwCCB92sx7y/uSjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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

On Tue, Oct 07, 2025 at 01:47:27PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/7/2025 1:26 PM, Matthew Brost wrote:
> > The GGTT lock is needed very early during GT initialization for a VF;
> > move the GGTT lock initialization to the allocation phase.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 36 ++++++++++++++++++++++--------------
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 7fdd0a97a628..f7717057cd14 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -159,6 +159,16 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> >  	}
> >  }
> >  
> > +static void primelockdep(struct xe_ggtt *ggtt)
> > +{
> > +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> > +		return;
> > +
> > +	fs_reclaim_acquire(GFP_KERNEL);
> > +	might_lock(&ggtt->lock);
> > +	fs_reclaim_release(GFP_KERNEL);
> > +}
> > +
> >  /**
> >   * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile
> >   * @tile: &xe_tile
> > @@ -170,8 +180,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> >  struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
> >  {
> >  	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
> > -	if (ggtt)
> > +
> > +	if (ggtt) {
> > +		int err;
> > +
> >  		ggtt->tile = tile;
> > +
> > +		err = drmm_mutex_init(&tile_to_xe(tile)->drm, &ggtt->lock);
> > +		if (err)
> > +			ggtt = NULL;
> > +		else
> > +			primelockdep(ggtt);
> > +	}
> > +
> 
> all this looks over-complicated and against the rule to exit early on error, so maybe:
> 
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_ggtt *ggtt;
> 
> 	ggtt = drmm_kzalloc(&xe->drm, sizeof(*ggtt), GFP_KERNEL);
> 	if (!ggtt)
> 		return NULL;
> 	if (drmm_mutex_init(&xe->drm, &ggtt->lock))
> 		return NULL;
> 	if (IS_ENABLED(CONFIG_LOCKDEP))
> 		primelockdep(ggtt);
> 
> 	ggtt->tile = tile;	
> 

Sure, I have CI issue so I need to respin this series now.

Matt

> >  	return ggtt;
> >  }
> >  
> > @@ -180,7 +201,6 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
> >  	struct xe_ggtt *ggtt = arg;
> >  
> >  	destroy_workqueue(ggtt->wq);
> > -	mutex_destroy(&ggtt->lock);
> >  	drm_mm_takedown(&ggtt->mm);
> >  }
> >  
> > @@ -198,16 +218,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
> >  }
> >  #endif
> >  
> > -static void primelockdep(struct xe_ggtt *ggtt)
> > -{
> > -	if (!IS_ENABLED(CONFIG_LOCKDEP))
> > -		return;
> > -
> > -	fs_reclaim_acquire(GFP_KERNEL);
> > -	might_lock(&ggtt->lock);
> > -	fs_reclaim_release(GFP_KERNEL);
> > -}
> > -
> >  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
> >  	.pte_encode_flags = xelp_ggtt_pte_flags,
> >  	.ggtt_set_pte = xe_ggtt_set_pte,
> > @@ -227,8 +237,6 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> >  {
> >  	drm_mm_init(&ggtt->mm, reserved,
> >  		    ggtt->size - reserved);
> > -	mutex_init(&ggtt->lock);
> > -	primelockdep(ggtt);
> >  }
> >  
> >  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
> 
