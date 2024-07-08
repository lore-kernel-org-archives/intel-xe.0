Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72DBC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E2810E324;
	Mon,  8 Jul 2024 21:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nE2jFgrP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553910E324
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474826; x=1752010826;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2QUjlaHU+6hmntlvEEVMAGtrm4JcaK8p0yl3PKjjknE=;
 b=nE2jFgrPIz/BFJXp4XMbyD6w5a4ScmY7DAtJlbZAZBandgHuMJyWeul1
 zXBqoyc+jMRZQ64Ri4Rs3bUmpi1cIp+wrFgbCE7DTPwh45wmoRaDgzX0K
 Lojrl4vT6esDizcchIqAxGTmLwsQ3V6DgGLncjhj4WvvvPJoO4+A8B7CP
 Bn3AEr6Riwo4xPd5CjK5aDjFEqhqcGpFPnAR4IEJGpr5meEfT0agHFP0C
 AT7A8bGNa+VB6IC858qvlqGjMMEOLrtuA/QvYKNGGZls7qeINYR3E7bti
 /ZEbAau9fMO/TVyvU1lyNUcHA8Py+6FB+0YqJ6H2m9xTn3slRvjxknaSz w==;
X-CSE-ConnectionGUID: IlOoS1tTR3ybKkLOozBaHA==
X-CSE-MsgGUID: v0qqEhFETeWzD7kx4prSqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21512565"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="21512565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:40:26 -0700
X-CSE-ConnectionGUID: +lpUTMjQRhSrgYNr/DvQeQ==
X-CSE-MsgGUID: Uj5vUxmTQoWi2PCy2ZfNhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52044676"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:40:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:40:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:40:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE0CyfZFpqCNLm85Z5ZFIhLUCeBAxROP7KXQ4XkzWbDkX4ZFrVzsHzAxBlO789erazO9E9OkHqSfR3gQ3+VlcF26QnRldz8QyD5AT70WGkkBgNGOm2eg4Q+dyIcctw2GB9NVu1BKbhGy8wNdsZtkJvjNq8bsJjxnyINbKKK8jDX/lGtiBZ/iNpeOp9dF6E9ByMvyJqoqQTrCOkadcLdyA1YM8WMbPPn5FK15JbXQpqWw44h9t+3cX/rIzR0tVTdhdvjM1IQEf2qCWpjvB1Sgg2ozqc7FIraz3S77Ei3VfwFsqDoskrECLu7FjNE/s6eA0eXzlwIKqIwDXAWLlKkuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sKJUsAqe8LloLGUfQIxKQefoaYem+iIMGpFSuAsmvQ=;
 b=fX7Nn3uESgJZFJZ7Fkdezg6WzhkliIURf9IcCjg6mRC2SPdrsQXS37rha/nGoUMQYvU7hZ2pcFL7vGZUY0TJE1wGQZPaKto496lNGC4Z9CnfWhlW8xcTzFPGIWy+2tYDDSO7mHXsp/qGbhFBJ21Dw+iqKS5KnPI2cFNrLGw8fKUw3b7PvJG+Qvh+aRT7rusVG+/G57c8y7vlFVh96X4MxWporxohjPwrJn6Ci8xwj3Y7Sb8vp7ApdzxDKXZsLl0UxiEvdgcdQqY+GynKcg2RlnYE9WK4jLaz7F4wi/Uv5pKT0akn6PIXYDjFtKn1IIcItNH3WRSio0T7H3Qn0yPeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 21:40:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 21:40:22 +0000
Date: Mon, 8 Jul 2024 21:39:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop trace_xe_hw_fence_free
Message-ID: <Zoxcm6gSL0wGUHpW@DUT025-TGLU.fm.intel.com>
References: <20240708211008.956384-1-matthew.brost@intel.com>
 <ZoxbZxhZs6_KbMZQ@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoxbZxhZs6_KbMZQ@intel.com>
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a5d89d-dada-4de5-3c82-08dc9f96920b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?q+I/WuuGK+K+1DqBTBdmoNQgp66qILbUH+UFuHYcDZ3iiU/QA7Jr2qPzgz?=
 =?iso-8859-1?Q?lCY6CUhslqwDQNxYVFTGLj+UO6Kg/XVcZ6IOavnhpn+179DL4gEALY7GD3?=
 =?iso-8859-1?Q?7KsxqN9ZRBwQSoDkq2xJE4XANu9RTQtTsimGSBbK2hHGII5hrJa70MBwJQ?=
 =?iso-8859-1?Q?2GJH343vfKpGcVz5WniKowc3A614BrA2QK1U3H6FfzBOCDadUjtmuPTaeQ?=
 =?iso-8859-1?Q?JZ8rKeoQbXcRAjB7IP5l2gj55waZEa/Fmv34hwz3ckjignMlWJoaKXCexP?=
 =?iso-8859-1?Q?ASJPGmXje9eV0dZwRbLcL8mK8FM7SDzF9LLiup1AmVUAB2G1bnQJiD2Uy9?=
 =?iso-8859-1?Q?2ggNeJZNUEY1GeAjluW7PUvMNsoyHrN4ERfeiNh/08LCbbasJeiqzLsThn?=
 =?iso-8859-1?Q?kfceoCibaSZY66Rb3RQnDwftGn2XY5DtBWxEV4iyMJWzI2YQctVDEX1cp2?=
 =?iso-8859-1?Q?cm6D/Q+RiawL4m9gdMPH/90lSzxHiCzQ5noLmJIyt0VgXotwxCSt1K7iXy?=
 =?iso-8859-1?Q?G03mJJru1iV4CnPRcA6g47I3Xq0TxdOQCr4CtD1164lJPORYu1q9J76Dj+?=
 =?iso-8859-1?Q?Tuik81o49BT/1vXOHLnzNoJT35CR82LHyAuUKaohqkGqwOXMDE/WaAbSkr?=
 =?iso-8859-1?Q?iT58WZQVIorZo+WM+XPJo/FtNUpgPnJBUwAsS0FtEg7knsyaVijWfAjUQG?=
 =?iso-8859-1?Q?8RNyQC2N3yLqpTLhuooPPmC2i1MsSGkxfA6UUO53tqayf3QfbFyxEGCmu1?=
 =?iso-8859-1?Q?neWd8GxmQcP5tgtqE1XiasTQINdHL9S6yiIUBgqY2LxLVMoMZtlF3eOSUx?=
 =?iso-8859-1?Q?3sRynDWLcqpC+/TsQ/Mndp3UoYAFs85zWQY9M9n3uirvixNLiJ68EHUZHz?=
 =?iso-8859-1?Q?4yF20lJgn+fsYaxXNtCqUhadm8v7IqLldqsWHfrfw9HCycRsHtsosiwayj?=
 =?iso-8859-1?Q?clDUCIB9dSd9ifdfUjDgJpx6tCLoYENZDlXeKlulK/w53JbJ8FUpX8t1Hz?=
 =?iso-8859-1?Q?Tm5kaFlAN3Bbx1ZaOblrj3izhJOklqduTQe44eclYcJGv0C3goTTEd617C?=
 =?iso-8859-1?Q?Xl9fcVenlKyafTTHCHxkH661fx/36yNwE3f7OFyttYAvg/jcNfCA1++Q63?=
 =?iso-8859-1?Q?XmLv/+aacFDCxUqUKaRfpO8JFVakM4ntucYtv4tocPH2HPF7PR4+/6V4Gp?=
 =?iso-8859-1?Q?VV0RGR19F5DPPd3YJmKs1Xgw45Q2S6AlAyByGNTUUcmlAp64LaljuZLI3Z?=
 =?iso-8859-1?Q?Odpe6OdG9L7oHSZdixuKK4lI6UjkouR756sRKyWwisI8Jgk1fX2JDCjO8o?=
 =?iso-8859-1?Q?mBkKLf2bjaQdb0z8igCIFKLhd7vl/7vYB716LBd/VtX1T8I2SY9aPv3cSc?=
 =?iso-8859-1?Q?q0SDJ8COpCdKuualG/skHpii6c5IhzxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zzmv7tRkullLK6ZEZhhVjufM4YVK2qu9xFZtKv1hb9uwONIkciC1uxZlHs?=
 =?iso-8859-1?Q?47Gfc2hJqeGl1kKXTJBG8n3qcg6ASnQ4tDXIlehp9hbZ6S/FKQs6avvOyF?=
 =?iso-8859-1?Q?BYXvBLLpEKeNd4mJvEyBWdtO8MI/A0dh4jUKl0mfqsTUasXOQKwdqJyg3Z?=
 =?iso-8859-1?Q?X1S8tXYixvKS7g7MXTpesMs/XVtCi5GP3NvrfQZaQHekXR+86s68X+AfA6?=
 =?iso-8859-1?Q?1k/4xqzpSLKTOVKLwi1r31iqSe0cZzl74MHdsmRYH+7qLTQF9wAvDNHU7h?=
 =?iso-8859-1?Q?RmleXkIwf+hndOSYWHa6uSKRGr6fuIjgC26R61KgFLpkcOtp1P+di2eWAc?=
 =?iso-8859-1?Q?r4JVsurvuv4CWZURiIl9sbm2fPxSh8z2REsLHax/5/VmXTz0ShTDJyfdmx?=
 =?iso-8859-1?Q?85SzPQzXY0dA2Ii1etVYMQb1UpshtZ77a1uzC7jCw/b9/jPbuam+WfKQM5?=
 =?iso-8859-1?Q?iCI1alZe0SLmbm49VRhtCOp5YJdPcLn4eP94sEFCYlJ94vsC0bGF87c6gT?=
 =?iso-8859-1?Q?dFli2XwCpqWMJp1s7PPjkp33ZR9ae62vfnRn7XX3zuN3mAucDi4Y1pLn/c?=
 =?iso-8859-1?Q?tZk6ilV2eNirl7Bdx/8RyICA2q3AM90HjjQ6aU1itLw2gc+LMQVpKv5tX5?=
 =?iso-8859-1?Q?7qiixka8LCQ+A4Jtd/HutAZt2fpeQy/GZNtwAt1407nChbj8GFCZa7OYXy?=
 =?iso-8859-1?Q?od6UBa9xmhYqKada+V8VwJfglWQO6zgubnpQ1yGPSxJEDIazXorTyPIekU?=
 =?iso-8859-1?Q?0j9FsF8LKV7ZCWjfw0uqAkWgXYmBJ/5xDtdOEGmyYk2OABo2ikDCP8Y8Gl?=
 =?iso-8859-1?Q?UDzf/bfg5MR9x5lIAsmrXm3kkOXjbm2o0ZzS7S/95zx44591SjrrRJLy7H?=
 =?iso-8859-1?Q?OaezHxKEVDnnWlBimNembgxhdfU4komV4Dkd7y9uFUgDyGl27TJMRX/SMp?=
 =?iso-8859-1?Q?WeL5tLM/KO4htBJ3qpduxJ3ijAjRhG4AKuDFLtFn+G0bYazjkySo5mvOuI?=
 =?iso-8859-1?Q?XBvQhagsa4XWPpFtRDmI/1i+0YT5icizjdOi2GI+3pasC3mEsrAxoXVSyH?=
 =?iso-8859-1?Q?Wt6cX5x0u8j9zeF52qEm3vzR9SnDpHOgkDpDZwvXA1hHV4iADJLqW4mV8R?=
 =?iso-8859-1?Q?uv/5CJrQfbchnD3WvQS9ifzRP6FqeF2C+0lppmhWRBoRta8ccQRaWUoHWT?=
 =?iso-8859-1?Q?AyPzEQU+DCKaslUSc9lizCwu0i4bfOrxbmaHavAmeSIX3Xu6BXX9VeCO+s?=
 =?iso-8859-1?Q?zTUkdsdSlNfS9gKWuiNaV+EZtITOK6+/nLn1VN3T6H9/Jyj4Exq2ofZPlx?=
 =?iso-8859-1?Q?rVVhYENTDoTmSYhdmN6Y1zpxZIlcbqjLwLegC6kA66X1aIX+w9p6+kpEBn?=
 =?iso-8859-1?Q?GyGz3Zgidu0N3c/2r12VAK4hjcnoQYD6jlSWMamWYYe3ZIcnbMQPJ92UJY?=
 =?iso-8859-1?Q?IDM1KaUvbSg4Lk0hkrAxKGe7fC9PIra4vPI7tNu6+CMIuswL94hvA6ZuxQ?=
 =?iso-8859-1?Q?X3JvjA9GKtjwk65Tv2DDIsRhbSabt9imVnjrZGZrucyoS5w6ARB4drFsic?=
 =?iso-8859-1?Q?sjpXPgwmK2Fj7KivZN2MbjVLBrEklhYYlV9Afxt/gNvGMdDfW5ZMyJhMYj?=
 =?iso-8859-1?Q?6oxnkT/1AaUIw/3Oh3LVpLopdM8pO8aXdvNtTLNxmO8T/fMWNC+mqjcw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a5d89d-dada-4de5-3c82-08dc9f96920b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:40:22.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL88aeZbtrX6/GDhumKybyc/rB+ZRoEwn4A/7EKS0TlY+U0bJasTIqVCTm3OMUHRd932t4Ar+3bPozFX4ZWefw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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

On Mon, Jul 08, 2024 at 05:34:31PM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 08, 2024 at 02:10:08PM -0700, Matthew Brost wrote:
> > fence->ctx may be stale memory when trace_xe_hw_fence_free is called
> > resuling UAF bug when deriving the device name. This tracepoint is not
> > all that useful, so just drop it.
> 
> the placement of it seems strange anyway, but if it is not useful,
> let's indeed drop it.
> 

Yes, the lifetime of fence can outlive anything it is attached to (in
this case the LRCs hw fence ctx) as the fence cleanup is quite lazy in
places (e.g. in syncobjs, dma-resvs, etc...) where it can be installed.

I think the only reason I added this in the first place was very early
in the driver coding I had ref counting problems where xe_hw_fences were
getting leaked and used ftrace to debug that issue. We have this correct
now so not all that useful. I'd rather have the device id in hw fence
tracepoints and I'd rather not special case this tracepoint to not try
to get the device id.

Matt 

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
> > Fixes: 501c4255c409 ("drm/xe/trace: Print device_id in xe_trace events")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hw_fence.c | 1 -
> >  drivers/gpu/drm/xe/xe_trace.h    | 5 -----
> >  2 files changed, 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> > index 35c0063a831a..45a9789cf501 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > @@ -187,7 +187,6 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
> >  {
> >  	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
> >  
> > -	trace_xe_hw_fence_free(fence);
> >  	XE_WARN_ON(!list_empty(&fence->irq_link));
> >  	call_rcu(&dma_fence->rcu, fence_free);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 09ca1ad057b0..baba14fb1e32 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -341,11 +341,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
> >  	     TP_ARGS(fence)
> >  );
> >  
> > -DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
> > -	     TP_PROTO(struct xe_hw_fence *fence),
> > -	     TP_ARGS(fence)
> > -);
> > -
> >  TRACE_EVENT(xe_reg_rw,
> >  	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
> >  
> > -- 
> > 2.34.1
> > 
