Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C3ACCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 17:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1210E002;
	Thu, 23 Oct 2025 17:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsqox/XY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DB710E002
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761239675; x=1792775675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tgJUHEKLRR0eF2ipi+iSoPvYUGHCsPnHKZTWh2vFzyI=;
 b=nsqox/XY0NvN8BF7HOYaOu23UjyCke/54uxkRhLKxRfOdRN2ZX9zOo5L
 ke4GjOHhuDuPzNYQPxMafnzq8ICeBHXuDBl0IppK4Ea4tvbrKIAcxOJ1q
 YnisN3qZZdNYQvO/bVG6dUR9QpIBnv/s7xYBOrvlmorfeC4V9qw8WQM7v
 l7+IDmBEO5YL+oUmRlI1N6eP88SolqpRUiDLWZ0DlXsLO6ZJo52HlTkuv
 BMbH4dIhOwYtTK6/VGUxlR0nwNve8xcWLDAokM9g2ob0KpfnyzjXDvncH
 Ra/TljZpARatlSfBCtHedkqwxSuPRECj6+ru9JAHTt/YQiazLisdR13Ca A==;
X-CSE-ConnectionGUID: oiIPLTE+Tz+crCU1JxACxA==
X-CSE-MsgGUID: DBb8BwupTZ6gqEFfCex/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62628002"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="62628002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:14:35 -0700
X-CSE-ConnectionGUID: caGZVea9QVqGqx5HEaNtPg==
X-CSE-MsgGUID: VScjEEeIQReimJjnrAo31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184984897"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:14:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:14:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 10:14:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sy/+MMx3Bb5MfSNiss4Da5E21AAj78Z+ex0Ds25BOCxGQICH9Vox+9SdL72vF1Dopn5DrGDCQi3IaltdRBL7i1/jZ+XsbifDfcRjhF4bla2nWRdHkcbyyry4mQhBWQOEfI6UC5ZgURlrqof7jE+WFdZZWFKzDdbLSZeYXLKr4syWdC12NAz+ODaSIA8XrYhWoCcZLEllbansWNyhxr33iaMPcT5wslqoU6etUOHVZKlv8+xWExS6h8PuUhD/RiAzVMS6ZYUJ8h3hPpbNojSxWuNPCaAb7tnKM7Nfb88ZEsGdNPe2EbMnxMEkU3NSK7EmwTZJdFkORgTEKZgcYp2YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa7qp4OakKjMH89tCpX0lkIWUdGNlaIjbEhzxoXOkx0=;
 b=p38niO+AOsGcUrEwK3FFJGj68FyXPMZBQE/VrWri+x4pj/wPMTLsI4EGa18/o/nrkrVAATBLPq+G+vuLHa4HOL/wqtXYpvNDo75I4eSQba/Tr9625QLVvh7l7/l4m9O+QNwBR9YPCYLlKjHbfcm1Da0ZzEmUtFJDJf1AQIffLxysCTMAN7H87j//9l6x8IK63BAvOiisi8JgdP2VMUwdV8MoI89+CrZjYHmXB7xsdCLRuZY/QAMRGhVYam0zfnCse+hFC9aK86QTrebr6W+duHBktim+KBraO8A/Zd7lq+jll5CCZ9hJ4VivFHmNUezFYrYzKZh3xUHYMLc0aFhETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 17:14:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 17:14:27 +0000
Date: Thu, 23 Oct 2025 10:14:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v13 05/12] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs
 platforms
Message-ID: <20251023171424.GL1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-6-tvrtko.ursulin@igalia.com>
 <20251022231331.GY5409@mdroper-desk1.amr.corp.intel.com>
 <df97244b-66ba-4ae1-ba81-1018352b7e54@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <df97244b-66ba-4ae1-ba81-1018352b7e54@igalia.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: fa100607-0482-4403-8ec8-08de12579ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4961fQAvnI1L+j/Lm7Tt6grOfEpgBsqcc+9UZvMD613BVSpF9pe/hBXY2tBX?=
 =?us-ascii?Q?c0G3bfEBjPwy5q0rbrlDJGopBBec1n6dw8jA0cw8ThvqxwwIGQ7lArP7nErw?=
 =?us-ascii?Q?rUv/8OXB8lY6Mtg6O35n3L/fHXB14Ujb7v47lRbNO34vf2R6v3iFSHrkBBNs?=
 =?us-ascii?Q?XXBv5tY6tn3uDrY4XwV4JUHyW6zXoySW44C7URb9U6FbSkI39zlX5vBfFxva?=
 =?us-ascii?Q?WIOA9Ry2R3yDnOe7aGr4+bI3GHDO7z1RDyr9sPrXlNCm58IzmQMiBF2Kp+H9?=
 =?us-ascii?Q?jkqExvuRFFTSSWmiiWASO3nkWgrD7GfuNiBwP3H+c8CBkqCdOVYDImlYiBak?=
 =?us-ascii?Q?YhOhnahQqDQHqS/p/rHnQs4tKrtIXX8iKelLlv1RL+69/2JCsDpvTUbDXBfn?=
 =?us-ascii?Q?L6MUY4zIF0h1DgCMwHurfwBPj4E/pqeW1b8m4aZbJF923ElhoxviKsDQIAOk?=
 =?us-ascii?Q?ppuEP5vzmli7fzoPmWL+EjIuu7GlfMeGszB8qtfPozVz0fW+mHLiGSJmGZd3?=
 =?us-ascii?Q?vxhqTHTbCKfmN9kH2fBKA9EUG+o10JayAbSff1TVR/SpimBs9dNRx04MYbbH?=
 =?us-ascii?Q?OWIahcoCeoRSMSe6z7Ld3zzg2H+ELJh4Z3GJc16gSkznlGTg7yuIQv5ErPch?=
 =?us-ascii?Q?fuiPHLlupiJU1f/w6a4cKQ6nOVEHiKXXiVXDUn0X92l80aVIHnJrMiRV4JkQ?=
 =?us-ascii?Q?FnGhY2BLNFPPKvZe5xBTB8qnlFYPDKa0WCfeAh03/XGCPIPoDbzDPGDjXQVe?=
 =?us-ascii?Q?Bc49u/qBsRkr+oW+SuVLLXlQZGN0ZBxZ+oNExtBiRMGuNXTu3nNKlhl/6zai?=
 =?us-ascii?Q?OxFB2+ub2+KXqIp0DPtp+flrWg7K3swVnSLtnzMyHnLLa0ACPCzTgzYywRf6?=
 =?us-ascii?Q?4inw9dmsWW25GNg5Y2pas60qI+ykbKWpueKHlyH4uml2G4rGApZAfU4IDAH7?=
 =?us-ascii?Q?LPcVEWHUJadeLitQBmY4QgIhj7f1I+wspEbvC5i+C7k+5gVByJCzGW5xLdpA?=
 =?us-ascii?Q?trShwGzAVT9mAHBKurS4rYShU1ExuI9QF/bzDmPumRBBtHKJB5GwecefSl26?=
 =?us-ascii?Q?kri9Gz1dzZIPAuV6AujdYNekvkTVTRdEavOMHp9SO732Up1mYXKRhAUkO0Sa?=
 =?us-ascii?Q?5bEy91va8FHLDWHdkIcC3al2QIpZUtopZciac1CMsONVINFZUdcnmzuSKdCG?=
 =?us-ascii?Q?luRAQx78za7iNZLuIMogy/kEqYBI2NKuc33JRGeCSV2RiE4ALhVuIR64Ch4Z?=
 =?us-ascii?Q?cUmkcPsvdDPEFslaN8rX3krRViI0JTSY8ddxWq9Fhdr2krDLUmovMGE7g8Sq?=
 =?us-ascii?Q?0TA93huIGPFVQUDluvSOnnW3bMIGh6PGmum8uyDJSuynCXDsH4MhmehYBHrX?=
 =?us-ascii?Q?Qz+vpGbMACPl+raPpwizistkI4/3BSKmMqZUGlfvE9w+sVSntv2l3uymPteL?=
 =?us-ascii?Q?EUlvZzTm00+vVotKQ0FX2lcBENha3buL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQZhxeDW4Ko9qCfDU9g3hqTEF+Ez/f21ZPPYC5oElUh8JY+OGDe4s9X+czGw?=
 =?us-ascii?Q?GdgYsyshwRWgnt7nkanvmcD8iqvxDg7I/37drDDEKnKTSxZ/USOoX5FtaWhE?=
 =?us-ascii?Q?ympddIg3+xSojtVbU7pUcCSlocapRmPpRw8pwd1Uy+xsCYvuq/U9TODaWEn6?=
 =?us-ascii?Q?NJmT+swqHOOREYiR5U6PSJUTqt5ibYjbs4pqU6W57CGId71Yj2kdPBVMgnOw?=
 =?us-ascii?Q?UKWcXGRpcDBNwTfe5q6MQDnuIhOcJlAGsG96yQRt2HRCootg3Y++nOqWnRRe?=
 =?us-ascii?Q?aT5OniN3fyPiOYTTEmhFV246ddhXhUVWt3bNenCA/gTOJt8v3MjgobU9WEhr?=
 =?us-ascii?Q?iaKS1yX3Gubf4faGw6gPYB/R2Mlfvr7y/H4ECAtDUM6JhuoB1yl6ZuL2XwcD?=
 =?us-ascii?Q?wvwTA3PBMFk5qBUfyvziOiEsidwElwaAEerPjfwjMVuil487jw1w011DM5Cx?=
 =?us-ascii?Q?t2tKNSmMlIgsIID/v9TQSnPymQZeoi2B7zMzv8r0Ty9YkTINuvaqTAzXipIX?=
 =?us-ascii?Q?8l5th8hXx3GaODtL7MIXg6x1WyyQtzjUhik3y08fsb5r8/4nJ9Vs61lRcV8l?=
 =?us-ascii?Q?jHmdWQpP5SVy7fcBQa3NbVOohiL2AUVvNDPk8vz8A3KiAUsmHaM91qg+YVEy?=
 =?us-ascii?Q?bQ6Qzir+qsscg0GFOKyXeYvq9kUMFS63j73RIjwCmbfieqw8/P31d2McWYDC?=
 =?us-ascii?Q?2oe8uxJtAl5kbSqi+pJdB/EPqY1S4nJv2fwCCTcECGvSHJjUuFPVd3oDgxPv?=
 =?us-ascii?Q?vogMXp1O20UgY/DoyhwAkW21nAKBsBIHXItO/K1l4Zo9n+c1ghHTUbEZZwm/?=
 =?us-ascii?Q?7Vn+PzkzpxnqSg8QJWnneaiIOg9ztcrn7Op6X5GG9jj2QJ8HKbehB1yfkQMT?=
 =?us-ascii?Q?73Qc/ZY8bjeTEzwi+TkHLVTEWUJmH8ch2VzrWEDR8pgWLNh3a13yTRXkXx5u?=
 =?us-ascii?Q?g0uU3l0iVtpacwASgBH/ANYjaiLgjjytcSzwlYAZZ7DMie4Veffu5zNrys7u?=
 =?us-ascii?Q?RirsOGOYyD70IgAf5rFV06yRS2vdFe0HACNPIcGflrkXkN4CSBYBUUkTzboH?=
 =?us-ascii?Q?SBXrKwim8Ul0gRbNU0OEPKnlt7Yg9f4UBjkof0f4eoMMgpoCLyD1ib9nEbb0?=
 =?us-ascii?Q?sPzS6jYQDjjHV16KbTYfnQMLzZlvnhC3nySD0g/h3seVgyLQ8r5r+HqMxZpa?=
 =?us-ascii?Q?8fe+1MOFgYIEu4l1pi/H+LSw4fsTvl/uokIipdtI2gE2kPEk9PwqGooKBNJT?=
 =?us-ascii?Q?+ZotDWLPev0nMWp77EGSPEA6lPDedIkoVfsrbmJbalbRCtmfwTI9CH+RU2Nx?=
 =?us-ascii?Q?2p32qJ9aU2ynJVGfmOAY5/l/LKmw/SIyzUI/Psl7lDiWeDdVpvhBSysXNZ6q?=
 =?us-ascii?Q?sN+ImJdgHshbvbQJ7XlEhmbfkKrTT16ElSgiPD2gOchleDTUPbjVRlO6os1e?=
 =?us-ascii?Q?yPrGKdOddh3mqkOFUZi3XnGP8l4FRU1cmLxLm+CQLPj7qYlC1iNEiQkNG+Gc?=
 =?us-ascii?Q?XQesgdQAR/bJeg0ACjzaajnJuCGbLL8JICPSrIVsX04gqr4XrsF54zjUSesU?=
 =?us-ascii?Q?B78ngxpeBUYfHaK9GKGEyObUEq/K3aIan2cE8VqyPJTnzpnCD7hdLVRNi/D8?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa100607-0482-4403-8ec8-08de12579ec4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 17:14:27.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 575sMeudhjGFpxA3A3RCz0qUYSEhgzK+5CeR+X7UbuSWEHKiykEy6E45wlXEIIPMVRkH4wNIrASVUOXb8UOJhBtcxGpzu8WbC301+Vx38rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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

On Thu, Oct 23, 2025 at 08:55:52AM +0100, Tvrtko Ursulin wrote:
> 
> On 23/10/2025 00:13, Matt Roper wrote:
> > On Mon, Oct 20, 2025 at 08:58:23AM +0100, Tvrtko Ursulin wrote:
> > > Emit MI_FLUSH_DW_CCS when invalidating on auxccs platforms.
> > 
> > This is another one that doesn't apply to all platforms.  The
> > MI_FLUSH_DW_CCS flag only exists from DG2 onward (and does not exist on
> > PVC either).  So MTL/ARL are again the only platforms that this should
> > actually apply to.
> > 
> > The bspec doesn't document any other meaning for this bit on the older
> > gen12 platforms, so maybe it's safe to just set it anyway?
> 
> Don't ask a person with not access to the docs. :)
> 
> Essentially you are saying b70df82b4287 ("drm/i915/gt: Enable the CCS_FLUSH
> bit in the pipe control and in the CS") was wrong to set MI_FLUSH_DW_CCS,
> correct? This one is at least not as suspect as the invalidation register
> story, given the other part of this commit is adding a >= 12.70 check, so I
> can easily fix it.

Yeah, in i915 the MI_FLUSH_DW change in that patch should either have
been conditional on graphics version like the PIPE_CONTROL one was, or
gen12_get_aux_inv_reg() should have had a check to ensure that BCS0
returned INVALID_MMIO_REG on pre-MTL platforms.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index 87e467972070..d226d3228199 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -272,6 +272,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
> > >   			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> > >   			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > >   	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
> > > +	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
> > > +			  MI_FLUSH_DW_CCS : 0;
> > >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > >   	*head = lrc->ring.tail;
> > > @@ -281,9 +283,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
> > >   	if (invalidate_tlb) {
> > >   		dw[i++] = preparser_disable(true);
> > >   		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > > -					seqno,
> > > -					MI_INVALIDATE_TLB,
> > > -					dw, i);
> > > +					seqno, MI_INVALIDATE_TLB | flags, dw,
> > > +					i);
> > >   		/* hsdes: 1809175790 */
> > >   		if (aux_ccs) {
> > >   			struct xe_reg reg;
> > > -- 
> > > 2.48.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
