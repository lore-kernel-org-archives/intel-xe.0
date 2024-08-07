Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80E3C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 17:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A403410E013;
	Wed,  7 Aug 2024 17:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOHzrw2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31C510E013
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723053077; x=1754589077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fmQOkDGMMO7FHwnogajfpr0kpG2nEB00bC4Dc+v15nM=;
 b=aOHzrw2+Z454lluXeqQxxnt2rMon3Bt/RJTlNshAlPTZd2IXHUbqBVJE
 AuFaEsswJdsfF+kXgY6XYH1KQzelFqLj7dE+mnrZab8OZ6jQp1nfvEY4T
 OOybNPEeeONnsm9qUdVIAi80tTe7CT5ZF7VQ2Afx8w23ZWYQLUDoUh9Ta
 AOh9XTsqaj8x4lwz24/ZDSapspPMvzVWsq/uyUSUaVKSnjcHd2x8XEryT
 AS4HOl6xZcSDgQ4eTwMyfp4XLE8+VvWieJjm2ULECYdl0PWwg6F/w3KIE
 3CZeERkvHA6/P4DE55EdfbIgHL6MQwC6UJA9q+U7rgwYNSaUnB5gysRfw w==;
X-CSE-ConnectionGUID: rSXpIuf4TcqB4WLXEQVtsA==
X-CSE-MsgGUID: oUgdNxqzRiurZq2Ej2EHUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32286777"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="32286777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 10:51:16 -0700
X-CSE-ConnectionGUID: GSn7x5FJTsS1VmN/aYbocQ==
X-CSE-MsgGUID: thgeA2n6QdOPUW+OJoXg5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61813042"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 10:51:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 10:51:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 10:51:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 10:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbAT1pLyBX0QkEwr7cZwZdACZME47szlp99qNGP2VGCAJxXGXvvMvuQd4YhNO2z03PHo5e/tT8YcOfQ2efbncDnrh82uoWY7l+BL7551tPa+ZgXl5NPqw3Gi9LuXz6DGfguaYhKjnBX0r8UzT8Jdzx0ZC9gCA5KxsCV5kGnhtnQF2ilrgVJb4W7hvwDFaO/iEZtJU0e/vKD0Qos9JeB9nCwUetPYFSZamGZHUbAQuw4V68mXahbsSZDCimb2Yk7uAPh/KlgFQhrlmcvFMO79TSswJqNnzPo7qQYLTs+t54Y9X4XA6eGj3dr5aYhn3xSm4uRO2sBnjztHWdchP7H1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfGj+22zdvpNmicxSx/XLlN9AnBEDIswuv4tpo5cSa0=;
 b=wctUhiDxmNYrGhbcxGPRtJfmktubDmF3gfpzTfq/BCSV0vxUq4wds3Vve9pMTYuM6Rf01VVqFeGpnckGcwdq9rjsIZw814gb1R8B2JxeCE6CABSY+ELIWrRUpksy0N4IDcUj2xjLno/4gRA+mLIfBaJuIObhnO0cu6uxeje2OIkbfhVhndqxfuaS6RKQIeDy48IeITL/bBF/HhmYB/uLQFuayY7tJMujFZD3nYBBCf3qEcAeBTq3WOdWY20OwUaIkP/Zw8dGSGx4FUz2Ceur4MnOFQVBKawPyAClPMdpSbfA5C7dcymTHpYhi0gMrw133/nN7hTHPMCFZDXpIWGVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 17:51:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 17:51:13 +0000
Date: Wed, 7 Aug 2024 13:51:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <ZrO0C82SU8r0tT7F@intel.com>
References: <20240807134050.2048114-1-riana.tauro@intel.com>
 <20240807134050.2048114-3-riana.tauro@intel.com>
 <c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg>
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b346011-aa6f-4345-7de9-08dcb709870a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lk2mm86OYQ0ZMIXW7stWttTcKR6p7JY3fLdNGYvl0XJ6e1MYoM0NYkGULa21?=
 =?us-ascii?Q?b1h2bj401g4fHGwZOn7/LZU6wV+CP6pFoVwr7K71DslsoGwWoLJ2YUd0Ozzq?=
 =?us-ascii?Q?vjuUtKwpHqM8AELmBW3ZhcTxplatPecrkUz2RkiD/Pjj6eSnX/gcH7YqOhfO?=
 =?us-ascii?Q?OHBmee9ICrUaVdGceeOC4T4zs0pOvRhaNWxoCLu4DJGQGAMC/9WVaBxTHL1n?=
 =?us-ascii?Q?E4k5/JrsSRJ/WajuKnCOaSZ7XRlrLzu9OixMAGgR4sXq23Q2jc2JbdHDuDgb?=
 =?us-ascii?Q?3/Z0Kvt6tVz6MfZVMLgsA7OOKA5coar2nCQn0DNfdRCWz7bHleJPCrnRGu+8?=
 =?us-ascii?Q?t3Uc2Cq6N0mwHkqN3Q+zlhCSh1w9qkLFwHK82C2V0y/Yhd+b5ZieJhSI415x?=
 =?us-ascii?Q?opVZ1vphiLj7qNyRLazJ1sd93IWH334imtFZmuJMMLQ0Jo8klyog+9oKL6m6?=
 =?us-ascii?Q?6MPpPkZM+T+Makfp60m/3//lS2PB2v51VRKnkqHCp66j+3X0+PYAN7q/akpj?=
 =?us-ascii?Q?8i69L7uOh0v5Ec84uinnp493FcruRhjmelHmevurhkVm6H6T2GgQZavaXlfA?=
 =?us-ascii?Q?MutC9cBKo3/dTKXXP/Rqmar0vVpWRHFvVSqQbXxDS3a7GLEhd2/o7cSLb2YE?=
 =?us-ascii?Q?WdISU9AX+Uo8jzpKvMKuND1xsvpHed9DE6kMtgCKsjX3z4DzHs2FVSkYfpAc?=
 =?us-ascii?Q?DCmqH10KyouX0uwY9MmqXtKYRWxZxvvysswSmaB8X06LvzDWnQ1WzhohNBXb?=
 =?us-ascii?Q?YWXbJ9t/reKNQytu1HnTqyUEvtH1eK+b1OBoxJJqI9r5LRJv+RgbpzJ60XWS?=
 =?us-ascii?Q?yxPTD2dSinfijlv2NPcvGpr2l6aXDr3ohsuaVJrfxm86uoEhhAWD/qTaYDhw?=
 =?us-ascii?Q?fxeTFGOS0jzF7otbYmWXboaGjNUzmOVaDGx33TrvCKqwPuF4wUU3k1fmczX8?=
 =?us-ascii?Q?Ajl6cwFgmFxoneqZ8j994iO2WAf1kRD0yoWiJDzCe9uNxFRS1wUJ9paKukCb?=
 =?us-ascii?Q?rBeojCaN9qSFrDdmQ/IGKV1SfVXjH6tGBxqjVDBKCCYFcXS9eVvwn0IDMp/n?=
 =?us-ascii?Q?xSBbRXlEFqFV5gO45AbiBFTLC4wr3Gc4DDZNyZLh+bf7k0emzSoX4RQSuuwu?=
 =?us-ascii?Q?aG4DdQE79M87wnVe24ZSEboA3wU/qyDvBGXcrTkt8zTeHlnSmTLKZi1GQhd0?=
 =?us-ascii?Q?Zw4kdl2xL+dgjBks9y+k4SQ8Nn1OQ5mO/MqDssXgBJtSBJweTivHO1OMz7l/?=
 =?us-ascii?Q?vbTrLEEAJ62uDWwMOu+5bNe0LIwGIUMTk97j1WDBdiTNrx9dHaJcJSOu/lNs?=
 =?us-ascii?Q?SjTxiv9DYAojQi92HPuifBm84zZ96BZ8/9Iz88+KqOiIgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uJTw7LB0DU94djP8jvZDfT5seHqd4SNAmbJe5yM98S9SPQs7HC/c6xxaFBNx?=
 =?us-ascii?Q?KI4YcUgtnwiPBG3D75JcpvyCvaodcOCJjKb1RJ0969b1VgzCPXsu/SNPBYiN?=
 =?us-ascii?Q?+txl0SQNQ+5R9qzLpWVWiY5stiYkM0pthnHq5X1UCDPDtw3zVncOsjNmyOmF?=
 =?us-ascii?Q?DMmcH6xtVEWN9YE6OoaT4QowLKQaB+JUQ90mTpD0mdY0+axP/X5YT7pDIQON?=
 =?us-ascii?Q?ozmFnuZA2SJPaaBFSVmGiMh6olQ1V50oj9H1RaVjzjhnNAsq5y2W1/rKfokt?=
 =?us-ascii?Q?RT3ZORn/t8RklP3NsBPrXgU11BX01u58jlG0QHjzXtgEu8BnbpZKciVSsPFc?=
 =?us-ascii?Q?gjOAcxZ4uOCGocJQnRdEY2n06SRA43A31rnT5veuj7iL2PerpZdYhBuQyAXS?=
 =?us-ascii?Q?ZOzI2rrj+A/iYpOlfScfFvT63skN/SyvJCUbBsmjj8E86tlHieaEPKk4Mf3Z?=
 =?us-ascii?Q?XktiVFdhez0k3d3QzcHsEcLMNg4+6EjD9CoJfcyS7jsLtWcT7+6pwh9FzVb0?=
 =?us-ascii?Q?h0kGBQyce/HnC40yri/eSkEi7mzZACVWfzxGKPdvZbdHZfq/oPh0ogdkAX2+?=
 =?us-ascii?Q?YMPnVgY1j7SWZky1m/P4XNg8/8PiS5Mp0xf1m5GzUISN4DfPqH9IAYGZ6Qh+?=
 =?us-ascii?Q?MymYicLCqnhT9vR6/SGSIWctNNGJV2aTSGtWyrY8HjphGQQYd3zGJOBHEsMU?=
 =?us-ascii?Q?uceKZCZ6VbUvs+GgYoCDhJ1DayHvkpILVB8c+rL7C6LHEfhnpPkBSmI0U3/L?=
 =?us-ascii?Q?BWPHZw9SJc0iCKeWo9sMuR9cbMJeOKpVoGgLTEeN3wnVO2jRaCvjmsj54ejY?=
 =?us-ascii?Q?XJ0noQVCHRFUNf0HIkhb2bahlTCvx+PS30gOH4utJMpXm0qEq/pRrSg14fNQ?=
 =?us-ascii?Q?YFc6oOoDaIksqAsmhrfSQyZ36KRiM8Eh5Vy38BeF5SjpA7Nv4jPilWJILS9q?=
 =?us-ascii?Q?kXoBqnpSNNpliJ/qz90v3SgXykvxwk/HCFpqf7Di1RRZ/LHkqXuv+UtMdI/z?=
 =?us-ascii?Q?BSFB1W2niZ1/sztW3sONsF4UkYVPhaKV2bn9KoqaxjczNqaWI9L4iEcP27pJ?=
 =?us-ascii?Q?90HYkFsmVqbPHPPfiJsvpmJpgtyC1P6Bw/vDef0ls3REk6I3JLBqJZ9ONZab?=
 =?us-ascii?Q?3erm+grjfryYHEwVunfQO7XzqpHZHB2cRahjIuLDrWbMu/zJ32CaMW6Q89hj?=
 =?us-ascii?Q?jxSBW3l5gOIi9o8trgW0afzwvZv2b27PRjoQRSdZNGJWouQKDh+AA2J9rbYF?=
 =?us-ascii?Q?GK3F8jpfGUJxXTO09YIc8p/ZtdVlIogzSrDzd8rAFP2YvCTWLYd1RwtWvkkk?=
 =?us-ascii?Q?6+HnNH4TGsWSkfr3JJtJK3kX7EyFJD6Wv9KIfTTFw66URpVkY5gR+bnFdt6L?=
 =?us-ascii?Q?+ff1BDo0zGfA+X2Xi/k+nAI8ObP5QWoKABsdjtVVgH13VN/iaBugsBFI8X3T?=
 =?us-ascii?Q?5iSVBTfewkTzmXr/eTMflfvSZ1hU0tyLH6IAJFk+Muqxay0gwYBX2y9VkjQa?=
 =?us-ascii?Q?rYBVBesuW8uUrVy67mYyOtW4OlNrURcNieuSwXvbsEXDh5kzIZcP0dumiJrK?=
 =?us-ascii?Q?MH+0/etS6BFdwLotua2BWrn6AtIS2rbe0PQj4LDdLxQgrCeGHcWS9qlZqkYT?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b346011-aa6f-4345-7de9-08dcb709870a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 17:51:13.0201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7F9wogS314JnL+KPbrrL+Hfys9QC/TxGYSxtJHpFy4SXQtaCD3JyEJyvvK5wuDf/q1oUkRYZJe6VyqEYbOAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On Wed, Aug 07, 2024 at 09:59:27AM -0500, Lucas De Marchi wrote:
> On Wed, Aug 07, 2024 at 07:10:50PM GMT, Riana Tauro wrote:
> > Currently GuC is reloaded for both runtime resume and system resume.
> > For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> > is not necessary.
> > 
> > Remove GuC reload from D3Hot path and only enable/disable CTB
> > communication.
> > 
> > v2: rebase
> > 
> > v3: fix commit message
> >    add kernel-doc for gt suspend and resume methods
> >    fix comment
> >    do not split register and enable calls of CT (Michal)
> > 
> > v4: fix commit message
> >    fix comment (Karthik)
> >    split patches
> >    correct kernel-doc (Rodrigo)
> > 
> > v5: do not expose internal function of CT layer (Michal)
> >    remove wait for outstanding g2h as it will be always zero,
> >    use assert instead (Matthew Brost)
> >    use runtime suspend and runtime resume pair for CT layer
> >    (Michal / Matthew Brost)
> > 
> > v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
> >    assert and queue handler if g2h head and tail are
> >    not equal (Matthew Brost)
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++----
> > drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
> > drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> > drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
> > drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
> > drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> > 9 files changed, 136 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 58895ed22f6e..e0b13dc7663b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> > 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > }
> > 
> > -int xe_gt_suspend(struct xe_gt *gt)
> > +/**
> > + * xe_gt_suspend - GT suspend helper
> > + * @gt: GT object
> > + * @runtime: true if this is from runtime suspend
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> > {
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 	int err;
> > 
> > 	xe_gt_dbg(gt, "suspending\n");
> > @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
> > 	if (err)
> > 		goto err_msg;
> > 
> > -	err = xe_uc_suspend(&gt->uc);
> > +	if (runtime && !xe->d3cold.allowed)
> > +		err = xe_uc_runtime_suspend(&gt->uc);
> > +	else
> > +		err = xe_uc_suspend(&gt->uc);
> > +
> > 	if (err)
> > 		goto err_force_wake;
> > 
> > @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> > 	return ret;
> > }
> > 
> > -int xe_gt_resume(struct xe_gt *gt)
> > +/**
> > + * xe_gt_resume - GT resume helper
> > + * @gt: GT object
> > + * @runtime: true if called on runtime resume
> 
> ugh... I find these boolean args way to ugly and error prone. Why can't
> the path we are on simply call the 2 functions and we use a composing
> style rather than "do this", "and that", "and that other thing", "and
> that other too"?

My bad on that. I'm sorry Riana.

> This only leads to dead code in the long run as we
> later realize "oh, nobody call this function with false as argument
> anymore".  And to hard to use APIs as now the caller ends up with

indeed

> 
> xe_gt_do_foo(gt, true, false, true, true) without any indication of what
> those things are for the caller.

yeap!

> A less ugly alternative (but IMO still not ideal) is to use the
> "flags approach", since then at least the caller is passing something
> understandable rather than true/false.  But I think we should usually
> use 2 separate functions and call them where appropriate.

I totally agree!

> 
> Lucas De Marchi
> 
> 
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime)
> > {
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 	int err;
> > 
> > 	xe_gt_dbg(gt, "resuming\n");
> > @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
> > 	if (err)
> > 		goto err_msg;
> > 
> > -	err = do_gt_restart(gt);
> > +	/* GuC is still alive at D3hot, no need to reload it */
> > +	if (runtime && !xe->d3cold.allowed)
> > +		xe_uc_runtime_resume(&gt->uc);
> > +	else
> > +		err = do_gt_restart(gt);
> > +
> > 	if (err)
> > 		goto err_force_wake;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 8b1a5027dcf2..21f27ca23b67 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> > void xe_gt_record_user_engines(struct xe_gt *gt);
> > 
> > void xe_gt_suspend_prepare(struct xe_gt *gt);
> > -int xe_gt_suspend(struct xe_gt *gt);
> > -int xe_gt_resume(struct xe_gt *gt);
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime);
> > void xe_gt_reset_async(struct xe_gt *gt);
> > void xe_gt_sanitize(struct xe_gt *gt);
> > int xe_gt_sanitize_freq(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 85b88532e23f..6758b02dad58 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -883,6 +883,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> > 		err = xe_guc_ct_enable(&guc->ct);
> > 		if (err)
> > 			return err;
> > +	} else {
> > +		xe_guc_ct_runtime_resume(&guc->ct);
> > 	}
> > 
> > 	guc_handle_mmio_msg(guc);
> > @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
> > 	guc->submission_state.enabled = false;
> > }
> > 
> > +/**
> > + * xe_guc_runtime_suspend - GuC runtime suspend
> > + * @guc: GuC object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_guc_runtime_suspend(struct xe_guc *guc)
> > +{
> > +	return xe_guc_ct_runtime_suspend(&guc->ct);
> > +}
> > +
> > +/**
> > + * xe_guc_runtime_resume - GuC runtime resume
> > + * @guc: GuC object
> > + *
> > + * This function enables GuC CTB communication
> > + */
> > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > +{
> > +	/*
> > +	 * Power is not lost when in D3Hot state,
> > +	 * hence it is not necessary to reload GuC
> > +	 * everytime. Only enable interrupts and
> > +	 * CTB communication during resume
> > +	 */
> > +	xe_guc_enable_communication(guc, false);
> > +}
> > +
> > int xe_guc_reset_prepare(struct xe_guc *guc)
> > {
> > 	return xe_guc_submit_reset_prepare(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index 5fcf6f6ef964..56359047d185 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
> > int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
> > int xe_guc_suspend(struct xe_guc *guc);
> > +int xe_guc_runtime_suspend(struct xe_guc *guc);
> > +void xe_guc_runtime_resume(struct xe_guc *guc);
> > void xe_guc_notify(struct xe_guc *guc);
> > int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index beeeb120d1fc..41bdb9437634 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > 	return err;
> > }
> > 
> > +/**
> > + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Mark GuC CT as enabled on runtime resume
> > + */
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> > +{
> > +	struct guc_ctb *g2h = &ct->ctbs.g2h;
> > +
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > +
> > +	/* Assert if g2h head and tail are unequal and queue g2h handler */
> > +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
> > +		queue_work(ct->g2h_wq, &ct->g2h_worker);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Mark GuC CT as disabled on runtime suspend
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> > +{
> > +	/* Assert if there are any outstanding g2h and abort suspend */
> > +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
> > +		return -EBUSY;
> > +
> > +	xe_guc_ct_disable(ct);
> > +
> > +	return 0;
> > +}
> > +
> > static void stop_g2h_handler(struct xe_guc_ct *ct)
> > {
> > 	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 190202fce2d0..0cf9d77feb35 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > 
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> > +
> > struct xe_guc_ct_snapshot *
> > xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> > void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9f3c14fd9f33..c73a728a7450 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > 	xe_display_pm_suspend(xe, false);
> > 
> > 	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, false);
> > 		if (err) {
> > 			xe_display_pm_resume(xe, false);
> > 			goto err;
> > @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
> > 	xe_display_pm_resume(xe, false);
> > 
> > 	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, false);
> > 
> > 	err = xe_bo_restore_user(xe);
> > 	if (err)
> > @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > 	}
> > 
> > 	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, true);
> > 		if (err)
> > 			goto out;
> > 	}
> > @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > 	xe_irq_resume(xe);
> > 
> > 	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, true);
> > 
> > 	if (xe->d3cold.allowed) {
> > 		xe_display_pm_resume(xe, true);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index fa98e9f22631..8e535153cc62 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> > 	return xe_guc_suspend(&uc->guc);
> > }
> > 
> > +/**
> > + * xe_uc_runtime_suspend - uC runtime suspend
> > + * @uc: uC object
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_uc_runtime_suspend(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_runtime_suspend(&uc->guc);
> > +}
> > +
> > +/**
> > + * xe_uc_runtime_resume - uC runtime resume
> > + * @uc: uC object
> > + *
> > + * Called while resuming from D3Hot
> > + */
> > +void xe_uc_runtime_resume(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_runtime_resume(&uc->guc);
> > +}
> > +
> > /**
> >  * xe_uc_remove() - Clean up the UC structures before driver removal
> >  * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 506517c11333..1e223d67086a 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> > int xe_uc_fini_hw(struct xe_uc *uc);
> > void xe_uc_gucrc_disable(struct xe_uc *uc);
> > int xe_uc_reset_prepare(struct xe_uc *uc);
> > +int xe_uc_runtime_suspend(struct xe_uc *uc);
> > +void xe_uc_runtime_resume(struct xe_uc *uc);
> > void xe_uc_stop_prepare(struct xe_uc *uc);
> > void xe_uc_stop(struct xe_uc *uc);
> > int xe_uc_start(struct xe_uc *uc);
> > -- 
> > 2.40.0
> > 
