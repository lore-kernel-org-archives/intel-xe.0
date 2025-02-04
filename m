Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B13FC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 23:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A0710E714;
	Tue,  4 Feb 2025 23:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mu7scu3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18810E715
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 23:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738712764; x=1770248764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bo7PoGdCt8xsaD0lHHIMvulPT3O7gE/sssamj5KtqyQ=;
 b=Mu7scu3YLhiD8934MvVfrSl4sKLZHw+Lfd3/jhhYr1wsfWWMypP/94Lg
 ukOG92ZEl3fQ0nruybUJeA33u4uMWRlPBK7Y+WX6T3uom+s9OmodEegYh
 eRr8sH4Xl5g1O44H85nR2eNRMoc0GMvh4BL4RkYJeeneocfXpM3gh4lWj
 p4xiwE4niI30atyUTG5cRrEoWqFkBCdFXX7Mou9iHoKTl/CCg05PUnW8y
 ksGdJsklml4Bhul9jUK6r9OJQJGM1e6dMIhtQZE3ikcb7BPhW+Uk7vFXk
 S4vvP+rrxlwpZboBtiEckA9gqKpiW5xngGIiKH6PuiwtnnMdq3H0MROea Q==;
X-CSE-ConnectionGUID: Z1MRziKcTFqypu+qTqWj7A==
X-CSE-MsgGUID: TkB2K3s8SzS9OISWxaXM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43011029"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="43011029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 15:46:04 -0800
X-CSE-ConnectionGUID: o0AeV74rTrSjLkMaN+SgZg==
X-CSE-MsgGUID: e7aDNqZGS+ae9y1QthTObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115777013"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 15:46:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 15:46:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 15:46:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 15:46:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkv9SCU23LmRQs40aygFW0w5vMMH0xZcKmpI2uT0XIgNKm1EN3kGgAl7tRz7l8KpM/U7RdeF3nT09YyZ5ieTtXmKUNfGrgPRIl5C82a2RFCTYJC0+QNTQHs81szInw3C1DxvjXIvRCmUQmrL1mI2+ZlRZJod/c4N/KiHDvipBgv2Xm7xG+2kK186woymWbfwwCSzmRY0AcSPFN9OVZAznAfp/5TbmOs8jqqaShLErsaxrGSScEY08VaDl4BDg5F6KDHSUpTYzTVSSG3VdKD7m6u8UvTSdvsBGZk8btns316zI6Dnga2VgU2eGBPwuaCPBmD3y0YgsOICK/+u/KFe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sag5o2Vg6h+U8iGVTBrT4UZLc3Q35MNhUZLpW/SsE8=;
 b=vAMZ7ZmDIrVmNZzy6ZWZ+wVvYLaRgFicD59GzYWskySbri+g2gEVaEvnc+KwNB67Boo+cDU6wEWtNLRCStCQMZ6GLO5kCisQF6cglAUs8XHXvLaNe7S2DMuYrsipIoH0Xu26UdJi317KQj5hh3rRzrnPjHeJN8RfGb1lSbadRxskDcEph6WBDIHP2Iec5SY/XAyZemAhrLgb9YvVb6wP6Kk6qscuBRcoQxJVIsbCblr0DLLA4mx/B7JR3iYw3+fwAtJyKay8zbxiTTeWmKyw5zLGSM1pxe8l70bj5yvuTq6VU+DEtV7yUQGCOMzQUVD18JWgu8tmLUIpdeA7G2R3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 23:45:59 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 23:45:59 +0000
Date: Tue, 4 Feb 2025 18:45:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6Kms_pJxvKJpoL5@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH3PR11MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 9564fe44-047e-451b-3143-08dd45761350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?frKsdDPLDXyfPXc9/iN098P67MXegzB+jZOFp7Bot82WK1Gr0/3HieOmpX3D?=
 =?us-ascii?Q?TYK5SGrVZoOQONlK3sPmCMwHBqTE5NF+4ghVzdHWBd3kksPZ5ihZH4Zt6XTw?=
 =?us-ascii?Q?8d5v+c42MGqiLDAdz7fKd4PMQfWa33HqMyVBVVaBTk6TvJY29zm5cXH0DvzI?=
 =?us-ascii?Q?+ebsGrVrqKVsb0PUY35XcSAIxXuQcfTLR9v2JPAxp5fg4kND6fcEsdHi71t4?=
 =?us-ascii?Q?qeOYhdXVWvgo23AjDNfWu8D0HhPBgU0YCVxZ467CrNaCltzJA23j2duOUDJd?=
 =?us-ascii?Q?OHTwE0FHFoS82AOZsHTk9m9nO2O2S6iDlMoZHEeUkFOTVrMvQzeRUjruCcUl?=
 =?us-ascii?Q?1mOBxvxtPIIgaAGMIx1zTs96XTvhgHvLTwE1A/jd640p84on6k3vQEWvpBfb?=
 =?us-ascii?Q?/M+Zu8XenT36xlg/klJnRU2z/HhosUbNLuus+nJhpdj3ckoIMpQ2AWl8oMOK?=
 =?us-ascii?Q?XyyI63fMWWqVgRsnJSvoCKJMsSzI6RpZXxWkXBNyfn7Av4dE4Zrv0fKUkJC6?=
 =?us-ascii?Q?rHQO3I7vtTyiZxNdG54xyTnPgGy7NCCHYJ+KmCaE2/G25H4Vx11HxjdN6Ey0?=
 =?us-ascii?Q?nP7hVfWNfRrA9ePNtJ4mWI8k+wMyVUoWNHwTI2HmvO0k/Wjq+UNzqt1HYGQi?=
 =?us-ascii?Q?aqDol/WZKHkoKAXCSIheplqPnP4IQSdZHH9v00Ck0ozLZ7uvmlvxUL9zx6/c?=
 =?us-ascii?Q?GH0s1oHf75sTsR6N9khRTOi22i1Eft5Gcu5dnVjZYgQmMUi7iGg/zqJQ6dJT?=
 =?us-ascii?Q?Xlax+QnHym7knpgvybbl+ZOOSQPEimPelTbjHI4Pg/PDuSLgu4RZU2T4RnyR?=
 =?us-ascii?Q?DI3DoK3Fo9G/s2lxZZHU5AoQajaPDS+UHlTfjSYR7qJsb3tIN8tkha6BcoCz?=
 =?us-ascii?Q?ltYDGyC9KGpJ8oAVgW2JJSdrvLtAsEQJU2ka+55Wx6frKyV78AWMrNykR/Xm?=
 =?us-ascii?Q?esd2fHwppC8eb8/818VsSJtvC8rTeN5dkuCc/UWN34QLWUgurxWhPVt/IGHa?=
 =?us-ascii?Q?PKp48kWwC7VW25oIvQNgDjEzn2Re20HfDEpqRoceMi2gezocZOJitLL80put?=
 =?us-ascii?Q?Td9ead9JnPixP8tk9ZdfJGv9rIz8MENrKxNLwAqx3XgAZF3YcGgtbNSBVr/N?=
 =?us-ascii?Q?IwX1I91sqg5LYixVUDqZtRoNNWQWnvA3Chcw1c7kGejyz6EeX4YrzbitZkb5?=
 =?us-ascii?Q?PTHkvii2uz6gjgHS4aJb47ERWToEzP0WSIkoVZI+7vOOXgIvv2PRgjPafxnu?=
 =?us-ascii?Q?Cjp2W/IUtaw/c5np4Oi1xU0PRMdUsHCe/1kg+BXolvW7mLqZhRcbjTuxlV8C?=
 =?us-ascii?Q?aBOYGSCTtXwTw/rLCRTPXnt5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bcDThiskSe7g8Yky78znrojY9DhLJakgXqan6a6dYgJ47168g9TeA4++0oU+?=
 =?us-ascii?Q?IKJwTPo2V5p3ypajyoHYuf2nEW8YuVlFuj2CQ/4tE6WObhjxHn9AJ+DVerPe?=
 =?us-ascii?Q?FfNTp1jOtQXXulJG6KghewybbkNcbEPTvknuOqSOHt/JpVpKVTnbs8QiBSTf?=
 =?us-ascii?Q?DqaxxiS8q1D6ud2YiQUSPDubL7rWMNxHmPLUajaYPLpatadyQLVApiWSiT+X?=
 =?us-ascii?Q?t4I0jlYI9Xnx37uJnBlRleo958TtrlK2/4DdJfQqOHA2R87to14W4k3g+ipn?=
 =?us-ascii?Q?O+0vQ6xgSxUa3nnYcVGGFaCUwZjEYt2FAaspqjFdzLFU+wZHFrVqZZYT8d2l?=
 =?us-ascii?Q?xgQIe/SfuQtgN2nUYsgJ76XRvrnQtMxb7WJgcfZXOVc4L7VGvwxdA8KWUXwH?=
 =?us-ascii?Q?fUwVufzgHFXheG2n246o79bQTAksov7lLp40X/EuIW9fXxu2KBD1dVc4xRFM?=
 =?us-ascii?Q?nX7TOrbTxfddl4gbOBeeaKVFMOmveLnoVLFIwvq0FJ9DLTYYtbHX+m8T6qE1?=
 =?us-ascii?Q?thjNDUmInF8Epeen8Xo301ZV66VxrLZJYCNTXJ7J9XMlowZADi04PQnn6zGn?=
 =?us-ascii?Q?2vRPr5sYC8ebvMZrH7+vERaJwpPTHBxgf6A2cuCBj+2EFeEqhDc3nRnmTBI+?=
 =?us-ascii?Q?XOc2vmzJCjdghQNpPym7+uOdUqwkUuNtREnFqGAu5FUrXHks7LWhEIE+bcCZ?=
 =?us-ascii?Q?oNoXBLwKClkBkTG1sPC5SBtHbBH4Qo8NFAXvDwZYRaLEkSBgrBgAWNYTTkec?=
 =?us-ascii?Q?KXZgf9I8HzJ4wiuc7aOtOU+FM0PtHFYlkOp5wLRtQcXzY1lpVgfh7rK94V5k?=
 =?us-ascii?Q?TM9mNfFAXZV+eiW0G2z/G+t5K4ywbnPtxe8b5kX3C8BbCpj4hSf4/iPZgJtq?=
 =?us-ascii?Q?FDxV4xlFehENoC1LxcQisc02lTCQ/jMYEfhH6DOw63gg6KD+R0WmwlRx2GKN?=
 =?us-ascii?Q?6Mg7Rvz8cd/9wZCF09wb4ZCdM6+EVo9zR9xO5oxytHbT6Ej38J2bgpXv1Deo?=
 =?us-ascii?Q?LFvwzb87Q7dADFdST1H6EXVLoXYu8ALSlQvIqlOtTjLM/HusdvrQW6X7kPhK?=
 =?us-ascii?Q?LbeUDT/W8RIRlBgtcY5bgZpQ+/sCWCbQrXg1ZSjLzovZX7myjfXBP89wDKAR?=
 =?us-ascii?Q?C0em23/J+hNc/OeHMx0Ja3t3gXpRdkVcPGFY2Wfu0E453Ha2O8ocI235jV8W?=
 =?us-ascii?Q?Cpn/J6MULbdiFYezHoCv/03EDlzAOyu0WVGQhIGPiAishnAhD1QGLgorXUwk?=
 =?us-ascii?Q?E/8Uh0dW792V+FYdz6LU6VGq217hCmBxHvJj7dH5vnLaoCzYZxEqPwlOLbqk?=
 =?us-ascii?Q?U5HpnyJ4S1jAYcIWoiFRjxy7GbIJHJfjSbwgsfVs0Uggt8Qm+rwbsJ8z240s?=
 =?us-ascii?Q?cYRSlyzb9Tk5it43KNGzcgC8Hj17S/TOvZtruSb1ScBQ/e2G9PCtE4dDv9nh?=
 =?us-ascii?Q?R63a6sY0PGto6r2ablDneCL6A5iSsrOK/s/LlfAYK4i73NFSEigxG3w5fdR3?=
 =?us-ascii?Q?nTgmbogs77E70Mn+0q4hUn95RatlOOkNWhovWZ+hO/w1bMwZAF5lzm1wqlJb?=
 =?us-ascii?Q?2u6jFjD0g31VMLUDm+VT4FySlOHLVGfSkBQidSb/g3fSYsnRWRUdwQ1gsByV?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9564fe44-047e-451b-3143-08dd45761350
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:45:59.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTNQ7m0uUivrqh/vKr4S3rTDfWqij2SsUOwQ2jA9b43+NgRvfFC4c3rCFReOQgiY+q78aJqY3D87OoTu6gbpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
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

On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
> 
> 
> On 2/1/2025 12:07 PM, Raag Jadav wrote:
> > On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
> > > On 31-01-2025 11:15, Raag Jadav wrote:
> > > > Add hwmon support for temp2_input and temp3_input attributes, which will
> > > 
> > > Add hwmon support for temp2_input and temp3_input attributes for supported platforms
> > > 
> > > > expose package and vram temperature in millidegree Celsius. With this in
> > > > place we can monitor temperature using lm-sensors tool.
> > > 
> > > With these changes, package and vram temperatures can be monitored using lm-sensors tool.
> > 
> > That's pretty much what it already says, doesn't it?
> > 
> > > > v2: Reuse existing channels (Badal, Karthik)
> > > Add a new channel for VRAM temperature, channel 3.
> > > > 
> > > > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > > > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> > > > ---
> > > >    .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > >    drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > >    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > >    drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
> > > >    4 files changed, 81 insertions(+)
> > > > 
> > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > index d792a56f59ac..9bce281314df 100644
> > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> > > >    Description:	RO. Package current voltage in millivolt.
> > > >    		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > +Date:		March 2025
> > > 
> > > January 2025,
> > > 
> > > February 2025, if there is a next revision after v2
> > > 
> > > > +KernelVersion:	6.14
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. Package temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> > > > +Date:		March 2025
> > > 
> > > January 2025
> > > 
> > > February 2025, if there is a next revision after v2
> > 
> > Something to follow: https://hansen.beer/~dave/phb/
> > 
> > > > +KernelVersion:	6.14
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. VRAM temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > index 519dd1067a19..f5e5234857c1 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > @@ -34,6 +34,9 @@
> > > >    #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > > TEMP_MASK -> TEMPERATURE_MASK
> > 
> > This is consistent with other GENMASK() macros here.
> > 
> > > >    #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > >    #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> > > >    #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > @@ -21,6 +21,8 @@
> > > >    #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> > > >    #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> > > >    #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> > > >    #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> > > >    #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> > > >    #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > index fde56dad3ab7..7f327e334212 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > @@ -6,6 +6,7 @@
> > > >    #include <linux/hwmon-sysfs.h>
> > > >    #include <linux/hwmon.h>
> > > >    #include <linux/types.h>
> > > > +#include <linux/units.h>
> > > >    #include <drm/drm_managed.h>
> > > >    #include "regs/xe_gt_regs.h"
> > > > @@ -20,6 +21,7 @@
> > > >    #include "xe_pm.h"
> > > >    enum xe_hwmon_reg {
> > > > +	REG_TEMP,
> > > 
> > > Any specific reason for adding this at the beginning of enum ?
> > 
> > This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
> > 
> > > Generally addition is at the end for any new enums.
> > > 
> > > >    	REG_PKG_RAPL_LIMIT,
> > > >    	REG_PKG_POWER_SKU,
> > > >    	REG_PKG_POWER_SKU_UNIT,
> > > > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
> > > >    enum xe_hwmon_channel {
> > > >    	CHANNEL_CARD,
> > > >    	CHANNEL_PKG,
> > > > +	CHANNEL_VRAM,
> > > >    	CHANNEL_MAX,
> > > >    };
> > > > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> > > >    	struct xe_device *xe = hwmon->xe;
> > > >    	switch (hwmon_reg) {
> > > > +	case REG_TEMP:
> > > > +		if (xe->info.platform == XE_BATTLEMAGE) {
> > > > +			if (channel == CHANNEL_PKG)
> > > > +				return BMG_PACKAGE_TEMPERATURE;
> > > > +			else if (channel == CHANNEL_VRAM)
> > > > +				return BMG_VRAM_TEMPERATURE;
> > > > +		} else if (xe->info.platform == XE_DG2) {
> > > > +			if (channel == CHANNEL_PKG)
> > > > +				return PCU_CR_PACKAGE_TEMPERATURE;
> > > > +			else if (channel == CHANNEL_VRAM)
> > > > +				return BMG_VRAM_TEMPERATURE;
> > > 
> > > This doesn't look good.
> > > 
> > > Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
> > > xe/regs/xe_mchbar_regs.h ?
> > 
> > It's not mchbar register.
> 
> add it under the same file without the bmg prefix.
> 
> The other registers are platform specific and have the prefix.
> This is common and can have the PCU prefix

No, but the point of the xe_mchbar_reg itself is to only
include registers that are from the mchbar.

Although the code here looks strange and misaligned, the
registers are well aligned and its right place.

> 
> Thanks
> Riana
> > 
> > > > +		}
> > > > +		break;
> > > >    	case REG_PKG_RAPL_LIMIT:
> > > >    		if (xe->info.platform == XE_BATTLEMAGE) {
> > > >    			if (channel == CHANNEL_PKG)
> > > > @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
> > > >    };
> > > >    static const struct hwmon_channel_info * const hwmon_info[] = {
> > > > +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> > > > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> > > >    	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> > > >    			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> > > >    	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> > > > @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
> > > >    	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
> > > >    }
> > > > +static umode_t
> > > > +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > > +{
> > > > +	switch (attr) {
> > > > +	case hwmon_temp_input:
> > > > +	case hwmon_temp_label:
> > > > +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> > > > +	default:
> > > > +		return 0;
> > > > +	}
> > > > +}
> > > > +
> > > > +static int
> > > > +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > > > +{
> > > > +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > > > +	u64 reg_val;
> > > > +
> > > > +	switch (attr) {
> > > > +	case hwmon_temp_input:
> > > > +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> > > > +
> > > > +		/* HW register value is in degrees Celsius, convert to millidegrees. */
> > > > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > > > +		return 0;
> > > > +	default:
> > > > +		return -EOPNOTSUPP;
> > > Can you add debug log, printing the unsupported attr ?
> > 
> > We don't have it for others, anything special about this one?
> > 
> > Raag
> 
