Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C9C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 06:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F631132A8;
	Wed, 29 May 2024 06:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwbyBUHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914C1132A8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716964774; x=1748500774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sTI5mhe0yAtwiFSohE6rg4Yo19YINg+J5rKcZg51MWw=;
 b=kwbyBUHZzn7ug9SgQFEZlRmND5IyBtDk/l/smKlLT+I/E6fbQTLwRDCu
 rXKmMEldJ7iV0GiNt6UAJ1IvoV13FhH0f93zAReF6WvBQukDqABfn5Rul
 WMnV01OqBIjHUoOzpEJ+PQ7uok/VE7OjWHWEZBYqm1WHmh4u//xrRrUZT
 eCfXomgiUI2PHs14biv4E1EhNJSCoJxFAMjpGTp+JNHk8p+MCJa9Q/qP/
 EdTZaDJiIFWNuRoBcenJGBHu+FJbLab1W3ovnKAwDwWngdqeu3EOBLCnV
 49kZapf7pSL3nIKxt0QTJ59i5R7D3SkneB3gsx8/q4r6lMMyfV1uXzIXE w==;
X-CSE-ConnectionGUID: RR6hmFiyTsitX+k5BsRWDA==
X-CSE-MsgGUID: LYkfP8LlTVGPFbUACXr1Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23958915"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="23958915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 23:39:15 -0700
X-CSE-ConnectionGUID: SfwJeScdS9O+ReTF1uw/zA==
X-CSE-MsgGUID: E6lsmYsaTP2cNpQKN4x4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="39770249"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 23:39:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:39:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:39:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 23:39:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 23:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNoFuE56xnJJZniZcAKvY278scCApJqZsOQfuqSO6bGxvedhsNe/ix+iDcpdKeMPwEIizWaF0Ocf10XvcIf3ifOoCi/ZRtDu8nSyaqiyQnxSykwtrWwnOxDMRqUBVCHpn/SDoIr2IRyYL9haXF5EEnN0vqhFhXJvgrDn89RmO9HAj0fcZLGRJ2KrlpfVo2dPG3tUj0ZtBzyn1CJUNICZXedDI+0LyDa4Cen71a7YR3ns7RzQvSLG2e0n21B8DgTENIzFMV57poW0Ff/BITHLkGGNfFMHW1CyiIVUekvEBcSnmehB5S6nBOsYQ/dpPmY6A58ENFiDmXC9zP6+/RVbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC8Jh4EMD7x8fBHrjaDXV3QkjBhxqgJHDRS1NvnJgmg=;
 b=T4I6JM6/l1mVJ3ovhSNQjK0UDFlSAY3x3sTXike1T09t9Y2P2YGH6vKBfKyoIq5pa7iEqY3gWg7W3YmOqw99pUGiHBR/V3FIoqNip7bNbxcbbs4ikIh+m0Ag496T66BI631laV3T3nG0Sb1H4x8Yt0LV8NC9b2nRi9NTHXGYJx6ohLj8ufUMIpC3stfMnPgvs7D9u6LCDp6C3K7rPxw+VubjUqqAJsOd9YQuWwHcWCmZwTDljDOhimgP6CF174EiSus5Nes67PKb4UWJT/Ks/E050LEdlYdaAzPMqbt++zgb9n/jI/MWWzsm0K8+Lb8BR97C9hMyxCpDssUJypmmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 06:39:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 06:39:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Topic: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Index: AQHaraQkIbgiNoBS90KzjpdH8HAyj7GtSzuAgAB9kcA=
Date: Wed, 29 May 2024 06:39:09 +0000
Message-ID: <SJ1PR11MB620437AE652A03AC1C7827D881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB6289:EE_
x-ms-office365-filtering-correlation-id: 1795b4cc-844e-4b15-5e96-08dc7faa0b8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?SeITm3obJUbGiPQ8jbm6UxXFl0wOXQp3Ja4UxGX6r5ZZbDSm/R/j0lYOVgVt?=
 =?us-ascii?Q?hl4/cGm331RwRP+zDytGiojH8XXZAPnpS1M4ZSC+3KaRmqzgfej7qS4myIOP?=
 =?us-ascii?Q?/o/mfPPCj7l7Mx4mnI9YN+L5vIEeYpMkw1KJD/t20xWk7J4FgXZeSH4fxuQu?=
 =?us-ascii?Q?qnOjdwGJtYwgQ5pUUpEJmXt4Ejeba2t8JjGURbyme/q+S2eDnUTLmbP+nnA8?=
 =?us-ascii?Q?YPjc7mRYO3OsDy6PBAW9HQq76XuPDLqzYvPit/MWIeQRfcxRuoCK7MpwNBl2?=
 =?us-ascii?Q?eI3mDVkO/Tq5B2yw8Yh7FCMF9eBTPHThv+HRUnkvsSePs7nvzWX3rI3yaMVc?=
 =?us-ascii?Q?RJ4jwwRTnLwqmoMQRL7TxJ+mzC6KGinlGTP+lyaCNTdcmfZMa395taTeBK3G?=
 =?us-ascii?Q?ZyT7A9Fcb35dkOUzj2Q7sl/Gopej4YOfmBps/mdI31pjHpZn9J2ENTOB8w+J?=
 =?us-ascii?Q?JDttZJ6rn0PL3cxn+ciI8HgCXV5f27X4atVpIvVY5pEnf35iiXo47tj+BVgn?=
 =?us-ascii?Q?GKkc3ruCvGGxXACqfFDfswCTZTm54aNasH55xpkYZ+RLyotHUlC0SXs4x84+?=
 =?us-ascii?Q?Elc+CVtGYbqS6sr+OMinE6vKNrNVsInQF59z3x8bunT+pFlMo5kicUPoHVQR?=
 =?us-ascii?Q?P9UMcBpApZJ+QjAihEYW4+SZplO0TLRHz9Qf/zpwGxqT3GvGQQVDtaQTb4g2?=
 =?us-ascii?Q?C/IhVPmb4SiYgKei059D1LWHbwnwwLFJNNLw58ikMNl+6yYp9QKv9PBd88MH?=
 =?us-ascii?Q?9thwQWW7afbeXhTz6QplbPyPCqXpciC0DXtZUaDI81K/FG1EPjgplokCBZJu?=
 =?us-ascii?Q?msBh4Fl1zeYTiK78zIgQSYXmdQJuVBFqbXqpZ/na8hbFXF+Jp084UuqEc80r?=
 =?us-ascii?Q?a31TqXYULCmEgEtbPmEI+nu+KGC1QVKeAxsIJiVbnlIc/BXPvXg1eTd8ySjy?=
 =?us-ascii?Q?2wLdLFqSKLzvSFLquH/vwgTPNMTu/qA6q/evZF1AQmr1JyNCjrp+l6d86vCY?=
 =?us-ascii?Q?RObInVliwbMsrBuL6HWc1SsEAwYqNuN/s2Kb7RkUClWDOu+eppq9oj+YDyqH?=
 =?us-ascii?Q?YSSE7QwdndwSdXhUM5VkP2T+TdYo5isRqhUyJ2paVBN21lEn+3JTXbhfk7uY?=
 =?us-ascii?Q?S3AJ8CLAjgmRf+v9p2jXv29vAtHxfx4VTJhvDbuRZy6EHXFcmgZpBCJu5DKd?=
 =?us-ascii?Q?1m69ikWqdAfxlwZYvXo51j8sFbGweKo8nBGY0YDX4J1ZjiKnCEFgcfI9npJY?=
 =?us-ascii?Q?09v9NigPJQI5uKiROZdCT7PHJdpfSX2f8chOD5Cd3qsEK5qsxmXy6uGKE5Xo?=
 =?us-ascii?Q?wdy2IOIWbHGkTn4yLPCRVBwfZaCrYtnvNVwuC2Bgzz1uVA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cUb9habvB4OEYA30Sn/hI5Yk5+yce85DXVbdrdGPfPSMsV/xmNNTKefHtL9K?=
 =?us-ascii?Q?uNb146GnsrKoF/XA12yu7rIoCrT03dInj18EPUHPG16OVOFLHSmlzPZZD0kI?=
 =?us-ascii?Q?67RqD+tRFKk4qu+SnIPowwjJi4HJQQXU8r03bWOn8PiRO0qxvIOEIcncTfmT?=
 =?us-ascii?Q?I2CwHtuxrmAz8JfSauXM6lmkkpeARjmOVWtoQ61gAtliXpBSGtMPurVh7yfE?=
 =?us-ascii?Q?y5MYwoAFPOlu0Bpa67XNzF+CdrlC8ENEycJzGR7SlnSpPtWQuxtpW4MLZuYq?=
 =?us-ascii?Q?/HYKkRVvJN5+LFjW6c8EGajx7I//T6pwhLPBRKq2vx9ZZTZX6qdcXCNM54Hf?=
 =?us-ascii?Q?PMgcpwlpooy/v2x28en2iv+pmFjmGhoJVlqFLImINf9YvqqlEMwLMwpDlXUM?=
 =?us-ascii?Q?H9h4gzUTv7KRtDxmNBU76B+GqB7me5cOX9smYT5EQuEnINbO/IUGOIF9kq+1?=
 =?us-ascii?Q?zMpSsxdGFhkW5KllAmL4ZxDuJ7uE3iGIAvXpsd3QhFJPT6goDYsAEFur4cXC?=
 =?us-ascii?Q?xNquSJY6sSqbTL01cbsvtZPCKqJRkAiOqL0K82jaVqLG1iT7Zf2EMd+cEg+V?=
 =?us-ascii?Q?FlvJ0Hnn4f/xgltjtVwnn7fdE5AZVozEcurHBOCSh+3Lcp+uWXDwpLJBaOxT?=
 =?us-ascii?Q?nvUAqtn5CwkheAsgncUvcT+K9EuWprZMCssIUZVrq45DukR96cjg1PrDTn00?=
 =?us-ascii?Q?qyM10FH3/1cnPbkEHFIvTsLC5FDB46jHi5Hvr1p4tnkrSrTNpNuJm7JQ+LrU?=
 =?us-ascii?Q?/5XsPDeJbEPK0yFsQw36vBp5bb9yFu+Ff28Jo2ua0QGI0/+rUByOmQMcFlJj?=
 =?us-ascii?Q?88tj0MVlcP+g5MXK7a3Sg+1MC+73fwbvtG4C9RF/su1brUT0yeGLHqnBsffJ?=
 =?us-ascii?Q?dVw8RclqF7RU4LQnDjJsCb+GMSayprlsxu0T3M3NSyD4omWLvDaUhduhd5p/?=
 =?us-ascii?Q?2gYHcEj/Vmr/7BfW4vbqz7Q8qd7PX9XSPtjzfxqfdyV01Jx4NNG+85TOLoeJ?=
 =?us-ascii?Q?6WRV5BdqtmSuu/SESbtT7Nst84o4NEs4Eugca8QT8wZSXnnGOzzBNHKKXO7D?=
 =?us-ascii?Q?FVzLaE2IoUApDNr9dMsdecRrefNzeZsV6hJX1rMpLc0EHKgDfDr7p9Q8/Qm1?=
 =?us-ascii?Q?9/WrYTDn17P9lFikTtTqqlpFG9A4p5rbHA5flQpDaUYWIE4LeYJH+JtN5AM9?=
 =?us-ascii?Q?CL7iquVGdgwJNgjOltnszvPzZNBMGod3sYGdmGcltITx3cFcsasPY2R44dFd?=
 =?us-ascii?Q?w5taiCsQUEWy6IGNWjlsZYvn70qxu90K4+Qfzw5YFdWr4u906MYyu1+sEOYP?=
 =?us-ascii?Q?DWjBBD79g0ngonxussumtxDOWc08/9+bvCbLiis9DsElG9+sToEytDkM3GiE?=
 =?us-ascii?Q?Ixgl3aEexDuOW/LOrgnQPROCXnJ7zhaltsBju1RcxxhDlwyr+9sTBbh4A9mm?=
 =?us-ascii?Q?cUpsTF6GihDOdFtgf2VO+VeODp9UjEwdukIkf1CJXdamVuSfRR8XbDDCm5Sc?=
 =?us-ascii?Q?er7D4RQuGmiweiD45Am8Mdwc4kl6yyDYVHvpUy3y7vR8IA//yfHOn81eFyMz?=
 =?us-ascii?Q?F6IjDYVSndXqw1bvG7GXTzu8ww40u+S6JjtG4RXx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1795b4cc-844e-4b15-5e96-08dc7faa0b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 06:39:09.4361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulpgvHwF549L6PS3fLw4eGEq2bijwVX2GTQe2E/I4JOkrb8Gqs02yMeEODE+9KculFGDR6g8yrW4By+xOxi8BxEHpNHITbhP0tuhI8+oAGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 29, 2024 4:34 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>=20
> On Fri, May 24, 2024 at 12:02:28PM +0530, Tejas Upadhyay wrote:
> > Wa_15015404425 applies to xe2_lpm all steppings
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index 722fb6dbb72e..07c8a23bd7c2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -42,6 +42,7 @@
> >  #define STOLEN_RESERVED				XE_REG(0x1082c0)
> >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
> 7)
> >
> > +#define MEDIA_DUMMY_REG
> 	XE_REG(0x138000)
>=20
> The workaround description recommended using 0x130030 as the target
> offset.  Is there a reason you're using 0x138000 (which is a real RP_STAT=
E_CAP
> register that you'll probably be clobbering if you write to it)?

Yes, I missed it, while solving checkpatch erros. I will add correct addres=
s back.=20

>=20
> >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> >
> >  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
> >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
> >
> > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +
> > +	if (!(xe->info.platform =3D=3D XE_LUNARLAKE))
> > +		return;
>=20
> This workaround is a bit strange; it's tagged as only applying to Xe2_LPM=
, but
> the description indicates that it actually lies within the SoC fabric.  O=
ur usual
> graphics/media workaround database doesn't always capture SoC
> workarounds very well...have you confirmed that this applies to all SoC
> steppings (which is different from the graphics/media steppings)?
>=20
> > +
> > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) =3D=3D 20) {
>=20
> The description also notes that we need to apply this workaround before
> issuing a "read to Gfx GTTMMADR BAR."  So even though this is tagged as
> Xe2_LPM (probably because they didn't have a good way to express SoC
> details in our usual workaround database), it sounds like this workaround=
 is
> probably needed for any reads through the PCI BAR, not just the ones
> targetting media offsets.  In fact from the description it sounds like it=
 would
> also probably apply to any reads of the GSM through the GTTMMADR BAR as
> well, not just the registers.

Details suggests "These dummy writes are not needed for PCI CFG space acces=
s (those are always NP). ". Also by the way we apply it in all reads which =
are 32bit, its just that we check here media version 2000 is present on SoC=
. As per my understanding we don't need this WA if media 2000 is not presen=
t. Should we correct this understanding?

>=20
> > +		int itr =3D 4;
> > +		/* 4 dummy writes */
> > +		while (itr--)
> > +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> > +	}
> > +}
> > +
> >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt); @@ -479,6 +494,9 @@ u32
> > xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> >  	u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
> >
> > +	/* Wa_15015404425 */
> > +	mmio_flush_pending_writes(gt);
>=20
> There aren't a whole lot of them, but technically 8-bit and 16-bit reads
> probably need this workaround as well.

Ok, I will double check this. I noted this, but I thought it will not be ri=
ght thing to write32 inside read8 and read16, isn't it?

Thanks,
Tejas
>=20
>=20
> Matt
>=20
> > +
> >  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> > addr);  }
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
