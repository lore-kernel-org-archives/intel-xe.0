Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E5F0182F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123910E288;
	Fri,  6 Mar 2026 13:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZgHaf4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437210E288
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772804405; x=1804340405;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lw1FiL+piSEWWGMAvdSeHQJeIVawEF/5NMEQrLYAdRQ=;
 b=UZgHaf4IFJDWN2EqmrxiN6Wq3/ssMya43mhAkokym993NClYbROdAbwh
 rdmJXV5CCQcdLD249fd8xYY9SKHE8Y06eaQWj4F4eyUvHmXFiWCuCB6V8
 FJpkvBaOWwBx/1a+r4XCHoJ3iiKbpIyAPumhOhfvHyehd1tVXNvKuGe4w
 CZ0v+QK95wN50/uh5mLW2BAsY8NWHMxaoAqmtGkKdVALTk4Ozra3VIZuu
 lq2PJW3XQL7QTRgsFLsXbRNNIYVIYGNaUOaf4C1p3s06UUyyqF7Kuhhtr
 6fRtGc1UBTfBb2UUVGXeZQicmvZK8yeV+/Gw3D/nPCX6LftkC6xap6TqG w==;
X-CSE-ConnectionGUID: 86QK27hnSCObXAhnflJ6Qg==
X-CSE-MsgGUID: 6fcmRiRVQ1qwKPKkHQ+kcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74099541"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="74099541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:40:04 -0800
X-CSE-ConnectionGUID: o/iq0YJ5RyWVSbWzYJcBog==
X-CSE-MsgGUID: 1JXC4h5JTTWJtTrS2xx8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223708650"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:40:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 05:40:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 05:40:02 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 05:40:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jcs6Ll6lcEvIIGo5sPj42zjWrwFo+oMxXxJNI/OP1Z7VQXEzORTxNk5fSxXzKVyOByDlp97JoF9r5aKF1v3fmoFfE6Rd9U5Ug2PYES6l/H086RHhFGFysA/8jT3LELzNVOb7ALuwLCoCUykpMk89vDzouipWOwtrwqPE1ZX3X0qZ2BKfkg7p8goYkXXe5Njng/SA/tM32g6DmP/E7rJj8arfnx1OX/267BMhWbvCWXrE47DjnVtp1LbL6k+CMjYqhkAGuCnoXB2XEMFWllf9uOg/YhfLKcKLhp0Hkj+KJvP0rp+cuTGnWc4u1pfBxlEJc94kThmN7RRiYRqU/DGZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFvEPt7mTtr/SntcRvFszISXQ/Yk//+naUWTcSDALl8=;
 b=WNjoJj2Szi5FViKA/J3mPdx0LnkvfyWrt/8A2lxiMx+Xb1RoHQbcrJfHsa0Ptmwgspx7h3oPBM5Kq1p2Hkj/itF55SUAzxtWqfTP/CzGpakhMfsYzPQmFnwK+WQZhs0C/nSZn+X64Y0sY/05prAvnX6hZXmc2NroqmlKdTo8ZyDr/upO3NshiN2z/fk/kjc1nPPdaFvX2sYR+1JJ7NkIcarui2MuQNBWJccmFduZEvtN4pb5fo7uOmrw4MOqbYJ882st8JZI0UEl6y2UR9OXtNeL+CRR/rdvD1TAunP8LLy2ELz++Azc8SoSFXWtPeHzAAdo7hMUbX+G2LIfl1gOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 13:39:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9678.016; Fri, 6 Mar 2026
 13:39:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/rtp: Add support for matching platform-level
 stepping
In-Reply-To: <20260306005358.GW52346@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
 <20260305222256.GS4694@mdroper-desk1.amr.corp.intel.com>
 <20260306005358.GW52346@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 6 Mar 2026 10:39:49 -0300
Message-ID: <871phxxeje.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: ef74e23c-abb1-4fde-fbac-08de7b85d935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: j6DbiBelEqnnvEKxP5w4p0L4/ji+UU++vRw6ChbP2bXqyE/yLPzmXNaWGF74U1hA6q2TUKKOFZ7A7pvWugDcpB0hpPvAjgXyh8NVjOuklLVaKoaO146T3lHjEJUv/QbhzurK03ggJvP0OkwZonXGZ2mHov3JWP//cPdF9o4RXVSDewDf5bgrLW3Xjj2XZYR7s2YucXGizvejuAhRtxDpaHorIzRWNeup4Q+1hIdyra2/ZQrljVlLhavnD/TZZGIiZ3zKAb8rCCj+G1nBQDfXCLlwmX/Vlu1Wzx2PPM369QmG2VmW7ZxPq85RiWFgw8jlnACF2dTMUBanp0JedhLJKr4tOubPw5bGTBkJsw2qLkO2tNxsD1YfurYhHogWuxssUKPDH2pdjkK44Faq1OrQEK1B7s8b5tLUb2XF/mkCgTkoEiSMGMxsfD3OLGuA1SDDwKz0/T0MAOS/7hxcBDCGfscU5uiVkVvI6p/WkTVhem8myfAU+8ksJJas4DiVObzoPqjT7YZeGCGaTIWS9axCPfabqb2hP1pOxwfFhzQYsxstDqS5nJ12yME38fJ7SdtPuDDJel8lIXG+Gsmd+nwS0GURLMP5ENZXcWxlzwrjIRpPJwiUGomEkKjCPoky5L9hvj9qSFqpyo/Se28cPJI2bL4EmNoJ6rHqKVia4FyOuwkH2XAWVzPw8yyOYcFM2V9F8o35/btUIMiU6FSNp/c7CE6AAHemybH+S7fSwnmiGew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iu6tZC1qcc5ZkOtsROrCoNfNKsxrlhpndPF5O4vjwEJzqe1lWYjIGwjqZLkd?=
 =?us-ascii?Q?2EhCRc+gIanYrhSeXKsrYXbuxb2zwKfOvx36VaMY/GQ9ZvovSfGc++0UkbCN?=
 =?us-ascii?Q?LJd4SY9+uBdsmoOM4aKgHMn6RnK9F5jRX/Rl6ARD76w6X0ZbmkwOczNHiIbu?=
 =?us-ascii?Q?HqpKQbuzeuYSojIj5AUpd16v3UxNxFO7eCa8MhjNIYTlX1lKRYy0veNMEE1l?=
 =?us-ascii?Q?oba6rzTRtVzKm7sEQagKsfiUvq5m24fl5N7WYz+1I8xVtg+Z3ZIOfG9QTnU0?=
 =?us-ascii?Q?dRt6Q39iwWoGeSl7SybSppM97gPscv+4U/PfzYNwHyjvrBXHhquPUmIpb9ht?=
 =?us-ascii?Q?Q0K9RcfqmnJzDtSinZmppsUF4SzY+dsMjaESWDbtZeE4U1Dtl3mmoGToevVh?=
 =?us-ascii?Q?SkyXQp5ayNkiUrPvJOOCRGVVQ8tv9RSEm1bIoYsFGCuH35cWnZltW5WCH2/H?=
 =?us-ascii?Q?UFXsCEk1amObzEf9DLRB+aEOpfVBQf2uriSrDa0JW+53E4vqgUh8OxhOKeoa?=
 =?us-ascii?Q?Bexe6rRVFkwOY/d92bkeXFM+0jAu3Du3g3I7ZKZbt6ul675Sg1gBzHk8Ye99?=
 =?us-ascii?Q?lgHwcElP9o4ABo7/KHEj+uq9HccfnCkQtbgTKOZk0b687D30hEhjrtnf+gbu?=
 =?us-ascii?Q?TBK7aRQoP4K53SZpRD7f3azgzRqECNKRyo7aKzTdK/U8LQcOdBrzzfkbMhS3?=
 =?us-ascii?Q?QaUddWJz3vIR6nEMUTWOKEvdDwWvDL6Cf/tfqbBZ5yl7prRkaXFo6Kd5JUgE?=
 =?us-ascii?Q?tewsqdzK04m4qNYAjIw1i3DW4rrkjozwQuiyj3eSX+JUXGR3jjVP7F+BWerK?=
 =?us-ascii?Q?YDe9pVJOFRscQZ2srUSPvLDLv9DB3UGhnuUXOdv8W2fHppkFug9GrUlBX4dG?=
 =?us-ascii?Q?2jooTpWoUbQDNX/ZrRygwLpVn1aJMMgmLEmji2vBeGu8ihFSK0WbKhvftuVO?=
 =?us-ascii?Q?xj8ynPwitAlYYykZ0LozH49pWLKsAsux18BTj+Wd4XAcc5njfgM9G/NE8h0S?=
 =?us-ascii?Q?L4CWMygbq8yLaMLNg1os4k74PrJ7hESzLZKGHYceIbuTfpxNgwMSdKk6aoMR?=
 =?us-ascii?Q?xIdHKcCpXEQaI7fligdV4LnyiHl88S/N6fathPWQUCT9d8ghOoMvJbiWZSUa?=
 =?us-ascii?Q?B1Bi1wU5bGIs+eOtBZIiQmk047kxJ5egU93HO5MzaGguRN4jGi2pOipNkgse?=
 =?us-ascii?Q?8Xs6kpShgCstTvXzDMwC0CvQZI+HRpadaLjWzMz8O+z+IVeZGhBdafzf+zcX?=
 =?us-ascii?Q?xKJ4Gw4gmqNGDJnhjj+RKArxb5IESNmXUP3wStdZEMiQA9MShvdhZPwZL8kj?=
 =?us-ascii?Q?berOBEj+b3pdDt6EvDyCw3WeKoucTU9eggb5iHFgW/tPTdvvldY+IMvuIYjP?=
 =?us-ascii?Q?Bhw54aCw3CDuNhAbWeD63kCWFrXS+9dWbMf/b14V2n+u9yysmKDrYdcJHa0R?=
 =?us-ascii?Q?yMlS/H6+YuTl465ujscqslvaiA35VktipTaJsmGBiABPA852+i9JqFYE8Hqy?=
 =?us-ascii?Q?GxEOSkP/qjDyMoReuMWKfInj0ZO2WGnsXklktlGEDiNnbdwsXn3LaPYNNilA?=
 =?us-ascii?Q?5XGQmM9wLikX8K9cXGhxW30k2dlAtz5/Awv+QGB4dMx9BauJXwe+3RwNdPGP?=
 =?us-ascii?Q?WKqeCqrCHIdBYI8UKJaTelwemuX11ni4sj82MAgNwjbh+p5URhC40BKE2ii0?=
 =?us-ascii?Q?vLzax+msTfU9OKnyKdqzGuxq7k0CBGUwL79VZbhH/kHRqENTrf4a83rRavtl?=
 =?us-ascii?Q?mFo4NO47oQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: pRsLJ0NtGVR7eTCBV+FjUtsycyi+kwK5+lqJN98y3lNl2WL5xsGUSM82bkS1RongXFZLYb2yMcXoM9aYTgIevQUyZtdV8JHvcBKkp7Ae6sbZzksnXBLAheR5HY6zZ3rLAMTueaVfczCc/l9TZwZgEMyiTyMcfLBTdE0B+Vl8+mz3I05GJr1KWISNPZaI9VD+NScPVvTeEuwmkV0x0nKddjzQnu7cKUPLVy259jmCANsjvVZoZzEIbfdbOalCLReUjEOXGtAbguQ3XO1JJcDjDvOS7spi4zqq49xoo2wLOb8K0vvf5Xg4lZRzJbrqXNrwNp2StJxQLm2d/uOdMIhZPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef74e23c-abb1-4fde-fbac-08de7b85d935
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:39:53.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CngBibwWyIW4twVFgC5V6l2YgZXnGC46MLBWHPJIbkv+m5+u5Gc+tOk3wyonB7tJ5OuePhM8v94UIfydiBDkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Thu, Mar 05, 2026 at 02:22:56PM -0800, Matt Roper wrote:
>> On Thu, Mar 05, 2026 at 09:02:31AM -0300, Gustavo Sousa wrote:
>> > Add support for matching platform-level stepping, which will be used for
>> > an upcoming NVL-P workaround.
>> > 
>> > As support for reading platform-level stepping information is added only
>> > as needed in the driver, add a warning when the rule finds a STEP_NONE
>> > value, which is an indication that the driver is missing such a support.
>> > 
>> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
>> >  drivers/gpu/drm/xe/xe_rtp.h       | 20 ++++++++++++++++++++
>> >  drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
>> >  3 files changed, 28 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> > index 7bfdc6795ce6..991f218f1cc3 100644
>> > --- a/drivers/gpu/drm/xe/xe_rtp.c
>> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> > @@ -55,6 +55,13 @@ static bool rule_matches(const struct xe_device *xe,
>> >  			match = xe->info.platform == r->platform &&
>> >  				xe->info.subplatform == r->subplatform;
>> >  			break;
>> > +		case XE_RTP_MATCH_PLATFORM_STEP:
>> > +			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
>> > +				return false;
>> > +
>> > +			match = xe->info.step.platform >= r->step_start &&
>> > +				xe->info.step.platform < r->step_end;
>> > +			break;
>> >  		case XE_RTP_MATCH_GRAPHICS_VERSION:
>> >  			if (drm_WARN_ON(&xe->drm, !gt))
>> >  				return false;
>> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> > index be4195264286..7d6daa7eb1e4 100644
>> > --- a/drivers/gpu/drm/xe/xe_rtp.h
>> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> > @@ -35,6 +35,10 @@ struct xe_reg_sr;
>> >  	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
>> >  	  .platform = plat__, .subplatform = sub__ }
>> >  
>> > +#define _XE_RTP_RULE_PLATFORM_STEP(start__, end__)				\
>> > +	{ .match_type = XE_RTP_MATCH_PLATFORM_STEP,				\
>> > +	  .step_start = start__, .step_end = end__ }
>> > +
>> >  #define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
>> >  	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
>> >  	  .step_start = start__, .step_end = end__ }
>> > @@ -66,6 +70,22 @@ struct xe_reg_sr;
>> >  #define XE_RTP_RULE_SUBPLATFORM(plat_, sub_)					\
>> >  	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
>> >  
>> > +/**
>> > + * XE_RTP_RULE_PLATFORM_STEP - Create rule matching platform-level stepping
>> > + * @start_: First stepping matching the rule
>> > + * @end_: First stepping that does not match the rule
>> > + *
>> > + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
>> > + * on the left, exclusive on the right.
>> > + *
>> > + * You need to make sure that proper support for reading platform-level stepping
>> > + * information is present for the target platform before using this rule.
>> > + *
>> > + * Refer to XE_RTP_RULES() for expected usage.
>> > + */
>> > +#define XE_RTP_RULE_PLATFORM_STEP(start_, end_)					\
>> > +	_XE_RTP_RULE_PLATFORM_STEP(STEP_##start_, STEP_##end_)
>> 
>> To use this effectively someone will need to pair this with another rule
>> like
>> 
>>         PLATFORM(NOVALAKE_P), PLATFORM_STEP(A2, C1)
>> 
>> and using PLATFORM_STEP() by itself without a corresponding PLATFORM()
>> or SUBPLATFORM() would be a bug.  Maybe we should just make
>> PLATFORM_STEP a rule that takes the platform as well as the stepping
>> range so that it's impossible for anyone to ever use PLATFORM_STEP
>> without tying it to a specific platform?  And also make a corresponding
>> SUBPLATFORM_STEP() rule for cases where that's relevant.  E.g.,
>> 
>>         PLATFORM_STEP(NOVALAKE_P, A2, C1)
>> 
>> or
>> 
>>         SUBPLATFORM_STEP(BATTLEMAGE, BATTLEMAGE_G21, A0, B0)
>> 
>> We'd need to update the union in struct xe_rtp_rule, but the size of the
>> union shouldn't increase.
>> 
>> What do you think?
>
> Anyway, consider this feedback optional.  I think it's fine to land
> as-is if you want.
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks!

Yep, your suggestion makes sense.  I would say that the same argument
applies to GRAPHICS_STEP and MEDIA_STEP, right?  In other words, e.g. it
doesn't make much sense to use GRAPHICS_STEP without also using
GRAPHICS_VERSION.

So we can probably go ahead with merging this as-is and then have a
follow-up series handle stepping-matching macros in a way to always
require the relevant higher-level info (i.e. platform, subplatform,
graphics version or media version)?

--
Gustavo Sousa

>
>> 
>> 
>> Matt
>> 
>> > +
>> >  /**
>> >   * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
>> >   * @start_: First stepping matching the rule
>> > diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> > index 6ba7f226c227..166251615be1 100644
>> > --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> > @@ -41,6 +41,7 @@ struct xe_rtp_action {
>> >  enum {
>> >  	XE_RTP_MATCH_PLATFORM,
>> >  	XE_RTP_MATCH_SUBPLATFORM,
>> > +	XE_RTP_MATCH_PLATFORM_STEP,
>> >  	XE_RTP_MATCH_GRAPHICS_VERSION,
>> >  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
>> >  	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
>> > 
>> > -- 
>> > 2.52.0
>> > 
>> 
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
