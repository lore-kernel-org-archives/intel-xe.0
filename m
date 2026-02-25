Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EDBF55431
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 00:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B0310E012;
	Wed, 25 Feb 2026 00:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnxNf9YF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC3F10E012
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 00:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771979068; x=1803515068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YWHNjeTNShVbqi9TrSqxMe97dDeNnN62yGvQ1UuI05k=;
 b=bnxNf9YFU5wzt3C9hlertN9Tlf7SKhpPNgpNK0OPvcr9CPXJb9/rZJ6s
 05rCWmNlnaJCJVwiFgbPMrOMkw3DbqnR6Kvy1EAZBoamJRT2D1xrIqR3d
 T1ary6i4qohipwX4/zLuDYDM7+REU4WYaIpKmE9vqW/1NHGJs7yFQCXbO
 btpr37kh2vq7zh8jA7pb1DtHOBhCplrhu1LRhW43xGpEZKCguazsTehel
 3dQ0l5w57ZsGSm4xmggK+VqZiKCtci3vpAAFvTNkV7iTzMLUczxN23fuE
 SAYeSSJ/gf2eWQk2cUt3pBn1Akb73Cj0niIB2EqNxNQFPU+69Tgf3bGR7 Q==;
X-CSE-ConnectionGUID: 6F4H9DLUQBmOGv7zh3GWCw==
X-CSE-MsgGUID: bmWsnCGkSDqHjC5t2Fj4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90590566"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="90590566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 16:24:28 -0800
X-CSE-ConnectionGUID: PU6VQ13rTYaB0BvjJ2Ns0Q==
X-CSE-MsgGUID: JMkAI3EGQqWucDy3H87uNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="243931430"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 16:24:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 16:24:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 16:24:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 16:24:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvRtCXO58jAgo4oNZ2Q0qdlyUlJ+cLdjOCUSgqkjLIV9fmJnA5f3IIIEhmM4DXonRHMARVZK6tVR+zMQ9EdHzd7TRQYz4Axfa0XQCGwu+6m/CWDEk+isauZ1SJiTOSs0AOivILu5NmGWFvUnNAN/02pIOE32aTE0crTVdLhn+CO35K9Kmy/W0pog9/I2MZja0ywAaPz5jS0hvveRRi+3f5Nbzu9s3qtf2LukEuBP+liVT9MvAThyDYS+SgZRDtHGc6Jfk+qwhyRV0xmmZonjG7A2tfK6KGe9/guvCMLKMEMxpDW6X4yODMOyPHSkLucLkksZo4vKctsrMiP9dDueMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJELgsz1HEq6OZhXapLnSVuqfMjHK9ozQphfJ0z/UXM=;
 b=sn0eHKCDtq28bGxDxHLLBaJCHlncoxgX9NTnKXK1UzFwHC3o0deYQyJFDvQ4TG5aJ/QjAOAeBE/4tSQd8nP0Mburz41lQLlK1V2E99hT6dPNiYVA9FaiUfKCie86IzvBIdlA9Bz5a+8m18JAgo7Q7cgQ9naeGqlC8SKoc6El6uQLVR4JYGIl4cFPyWl4ldmz/LUs4rCIhUg8D/V0pFbb6qKKBwZYK2kEcBBX87DUH+X/ONoOFRa/QG1Nm7RxkSD9umZdFvs5YZSC7I0SKa/784awfeDd/INdb52j6tjeG4j61Iz++ZblqzCHYrlh+uvuHG/d82m0+OJ+hKA7/Ui52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9202.namprd11.prod.outlook.com (2603:10b6:208:56e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Wed, 25 Feb
 2026 00:24:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 00:24:20 +0000
Date: Tue, 24 Feb 2026 16:24:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Message-ID: <20260225002417.GO4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224203616.365912-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224203616.365912-1-stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cadafe-7430-4447-fcbd-08de740437d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s5V2hodTMTRtsUT5uqEzDql/LvQNDflHS4VwYGxSJ3lQIIZ1JIW3uqf5fApG?=
 =?us-ascii?Q?4k+7aoKl+LSbtgwWY7cScCev7evwpiHmAd34KvtbOUw92WAsk7wfIhmhzxag?=
 =?us-ascii?Q?gf1jYFYZAccTNBsUD8i4H0n5PXZ9zDWnujb9Z7EZ3xURJZ/BaYEW2r8V+NGY?=
 =?us-ascii?Q?F7PYKln3vslBC03HFm8BOjrrT+E68M7Q8fpOH3+Gept8UQAOwadjc2E+lcCm?=
 =?us-ascii?Q?zo1vpZAn2Fsvkjex97bG2gqNY4zttn6f8wQRLHi91dhYfnbJn3X+0UXwBTV/?=
 =?us-ascii?Q?tkh8BQ9H2OlHfjNQqT9gXXTdtQ8qfuESTTetgOHR95jLP4cYaY7YpLd44+fQ?=
 =?us-ascii?Q?s9BCes8VODFZApwzjUMPW5/A4CJKW6oA/orYoCz5PaIGBeBIo4eVQUybU3mb?=
 =?us-ascii?Q?pli1hrsX8kFxkR2AxIqaxhXqxJh5vC9RZpgCNUFIBeIH403htseEnunVjJFl?=
 =?us-ascii?Q?z0E+Vx7dCv3p00156VtYbluOIq8018iv6jBf4Y1Odsle7hBhKPGi9/tH5wvE?=
 =?us-ascii?Q?0r3KUNn5PuKAL+1sMFNpRAYOxm5cSNTI3Eou+eXATExO38zWP/Yzh6DiaEzr?=
 =?us-ascii?Q?J1frSS2Ff0fiKP1sBVu8wvYSjGbDf48bPkyP0sN6CcK9guBfk6nm739Mnubp?=
 =?us-ascii?Q?+d8s9g1wftQ9z2cnsnDuSJC+Lh1sxvwJ7ujai9UZsydq47AotNJX8aRCO6RI?=
 =?us-ascii?Q?eF9dP+v65PD/361g4QvML7i/czPFozgCXE9zH6bdnqMCtSwQUUOrm1z0s23l?=
 =?us-ascii?Q?iWoEWPcVYA7gkDfw8j04t+8nTdj94+fgWpiAH9mB81pJ4fDwqzbBQ8avpWxz?=
 =?us-ascii?Q?bPX+JtXF5yNHvFGjd6Vfx4Du4XjmJ1e1k4X7b1WC1Wi7VGTLjPHfu7CpdsV/?=
 =?us-ascii?Q?cRzTQOs6tKEyIJJbmZ4nACWu9DAgoxfw0tUaJUxX6VuHurnZthg0BEHtUFYF?=
 =?us-ascii?Q?4lrTI1NTVhZH4GmM9N+CYWmQiw55EvNrKA536QEhgXcGvpKQXyG8fJssaeai?=
 =?us-ascii?Q?qxljZAe0FiHV0l14L18XuO8wiVTjS4wjud6Sk1HMJIEgCkoU0Y32LHJF3hU9?=
 =?us-ascii?Q?/NUbrkT4IkdX7FOWKD84S4ceAqIi7cetybaRgSQe0i4wbDimYntzyXG2gkzr?=
 =?us-ascii?Q?cKcuJklPEFhoa31Xt+27tCK3tuZSgN3x+PaSeOTCm1QnF1xDD9nD6fU4ZXR9?=
 =?us-ascii?Q?OkliG9a5WG489iM7RiEmo2FE4K+zEIrOwZlrq8X7HTDI9fyI0JO65LE01xAl?=
 =?us-ascii?Q?QVEQ9qYN+YdENSRZ8gIcrFvGvHvbsD8kQ5WdsDXr+sN0JpPJgW68KT51lYMq?=
 =?us-ascii?Q?FirzL8GWSe9Nd+cxyCxooj55b1TEylxt3GNKyjU71hkU3XBOEhJV7hvLo6w3?=
 =?us-ascii?Q?QuexrhZSc8oz0QlrAl5yKf/vXA0zRm2tjgXCkIETFwx1dqRoSHZY7ujiTnWK?=
 =?us-ascii?Q?hhDrvf48egcFnCGMwevg/dZu5ES42W1liOcTcJJAEAO1ukhB0ugvevvImZs2?=
 =?us-ascii?Q?W7yY9RIE+hKqWtn4/s4Ub79ts7JRSzMDGMrwF01axqC2V0KWGK/FgafSYf6W?=
 =?us-ascii?Q?63sZ2QmZ8OR7cUauIdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMrORmXvMijxp4Mo5Zeb1XLcYihh3C5DkHgoGV6NRMNJbPATPLJAgCaTGXru?=
 =?us-ascii?Q?LPRUSRTdrFwWsWx69o3NAaiBXjbi/oQON5VwTaDoqpK/lSg8Bxa3Q0RNbnRD?=
 =?us-ascii?Q?hCkLy9QawNLrLZTJQ/G2/k+JgouvZeAFIAhqa27zBLJguBF+aBfEl1XMcGp7?=
 =?us-ascii?Q?QDGmzWukGF2e+cRnYL/WoWA5VmYOUT4TJi1z/rExrbHtJLT9z38CLwAt+IMn?=
 =?us-ascii?Q?A4AgSgyGzekEIzmBENeP0IISNkqXIdYrLErP9iu3ngxMU0fjwnGQuX/a4oVS?=
 =?us-ascii?Q?bFzOitCo1cPzoXdXyLp2mTw2E7m10+YZAJVFU18MHgxCl4g3TaM8MH0aNSIA?=
 =?us-ascii?Q?RNo4K2CnYBsZ9HlptG7HSr6iR8sLWXgQztWU5pCdK27Y89mejZDbXbYiosRi?=
 =?us-ascii?Q?Epj7m7yEUyBYBB/eWVgQIXa4jWkclESTKcj2kI7ezRBlmPKwghcgyutNZ4EO?=
 =?us-ascii?Q?iu6EDKk2T0dT5f8H/Q0reyepiXK9f5KRYgVx6GDtv03hxP//+CgkSkWgZ0xW?=
 =?us-ascii?Q?2k0VC2khUPdlqtHNCWVZ4XXYG4SeCGg+ssr/+QU5fg/c2T4S8/gexE9AwaY9?=
 =?us-ascii?Q?3SeKUwuNdbJGvLx+G6cq2BmMoQ2jcQQOyj55iIDqkTuXa+wyCvnjdDa919VQ?=
 =?us-ascii?Q?NZtye3pee/6azuTU07RfpkEvzYEOiaJ4tZtkRIgvjrkbDKkCSbmbxBIuHwH1?=
 =?us-ascii?Q?Wj8nO73c5/csIzaaIQpQx24t8b1t0xOE8xWegN7yA8mo0JrJPNcCLor+N3xN?=
 =?us-ascii?Q?ORPMZr1DiPjoJM6U9u2p0HqoZ20X6Ljm02IrxQ7s4ZtBeQ/SzWWH8+CfCBgh?=
 =?us-ascii?Q?H2AMP8Yg5bg2xuaQyN2fROYjVnPMeRLHI0tteGY88tKdKvqp1GZZwrzUtZVa?=
 =?us-ascii?Q?cor54c1PpStTLI7K47ZB2sEK/P5CIJ2aOOfdbJSU2Zc+g61cOda+vPKKHTYe?=
 =?us-ascii?Q?8hTuSvd5pEUhMwWB0u1nPRbbsYQfjsXD8Xu0+Sv5dOlESJvRSfSpPh4Z7omK?=
 =?us-ascii?Q?5P0OgIx3TPNeFE+UqwBooVsgitX1dHwjpCH16hinAuizc+bg7rN56FgsaOxF?=
 =?us-ascii?Q?72Ky4RaZ8FOUwXk74S+AVkNr4rf+rwiu4vQtSa/uZZIfCifIFpXYuPoR8zC4?=
 =?us-ascii?Q?5DQ0BMTsMwh/IupAVneEYBLVt34C/Hw8PgF8Y5gdTgdIfwOA+gB5Kvtdcr+w?=
 =?us-ascii?Q?+aHolzRJZxkOgC/E07QaYrk8koxNpfXUXVnmSVvGUrfxB8iO6mMsHnUS75vW?=
 =?us-ascii?Q?RtsWM9mvLmg2m/x/TXXOUTxlFkwWhHB/D0PGfe3Mxe8VCGqoKfEyvURsNckm?=
 =?us-ascii?Q?wYOkcGvfosCX0BzqcSKVKWMuQaWoe7MfI9aMQrio1Jja1oLV2fJZufm7uIOS?=
 =?us-ascii?Q?TDJh5cTcoJPYw/kG5ct7KvDZe5xXiJCCfZQMeY8Oqp6unDj39VQpFQbaNoBj?=
 =?us-ascii?Q?QijzZCNJyn2/OTKqcGhC6Qcf18YYxqabRP166eSmwgdHwXcsBUIBhN2vORJS?=
 =?us-ascii?Q?kPrbjQ2xyyKpUp2wLESNVqKFEiKm+sSEgHcYE2ZbrAEX6lMy/ECDdggG0scr?=
 =?us-ascii?Q?cGscmmaY8FHY1mqPnv5/Bk11HdXyk50NOHDXDq6suYtsFB7szV2vcJoE3KDf?=
 =?us-ascii?Q?md5V8QNytRBQuNmyBuCyANRm/jnfok7Qi6+fnTCHGPfKDLqhO4xASC82lswA?=
 =?us-ascii?Q?Y/YL/9yaqzQIYEchHglcoXPcpbzL63e86T7lZ2Mc7R2EAl4DY8vA9cytS96v?=
 =?us-ascii?Q?lMbjy3GQnRtq0ahixALvW6kCjPXCa2U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cadafe-7430-4447-fcbd-08de740437d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 00:24:20.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSNHpeakp0iTV2/9V1WD6KiI803FmrF8LHDcQbSntZx0qbiCPLW5+eKiBDp5Wht40pz48N5Pj/GPaqWKOyzbEIdChTrP5siLExyMT3j81wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9202
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

On Tue, Feb 24, 2026 at 08:36:16PM +0000, Stuart Summers wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC provides the ability to gather logs through a hardware interface
> called NPK. For certain debugging scenarios this can be advantageous
> over getting logs from memory (or in addition to).
> 
> Add a hook for this alternate debugging mode via a modparam similar
> to what is used for GuC log level. This translates into a parameter
> passed to GuC during load time.

In general we're not really supposed to be adding new module parameters
to the driver.  Some existing parameters are grandfathered-in because
they were added during early driver development before we really had
better ways of configuring things.  But when possible we should probably
be looking more at per-device solutions like configfs these days.  It's
a bit more involved to use, but that's especially okay (maybe even
desirable) for something like this that is only useful for low-level
debugging and isn't actually usable or useful for end users on
production hardware.


Matt

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_defaults.h | 1 +
>  drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
>  drivers/gpu/drm/xe/xe_module.c   | 4 ++++
>  drivers/gpu/drm/xe/xe_module.h   | 1 +
>  4 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index 5d5d41d067c5..194500fb0ab2 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -12,6 +12,7 @@
>  #else
>  #define XE_DEFAULT_GUC_LOG_LEVEL		1
>  #endif
> +#define XE_DEFAULT_GUC_LOG_TARGET		0
>  
>  #define XE_DEFAULT_PROBE_DISPLAY		true
>  #define XE_DEFAULT_VRAM_BAR_SIZE		0
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 54d2fc780127..10bf63c20a14 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -79,7 +79,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>  	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>  		flags |= GUC_LOG_DISABLED;
>  	else
> -		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
> +				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +
> +	if (xe_modparam.guc_log_target)
> +		flags |= FIELD_PREP(GUC_LOG_DESTINATION,
> +				    xe_modparam.guc_log_target);
>  
>  	return flags;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 903d3b433421..1a8127e508e4 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -23,6 +23,7 @@
>  struct xe_modparam xe_modparam = {
>  	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
>  	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
> +	.guc_log_target =	XE_DEFAULT_GUC_LOG_TARGET,
>  	.force_probe =		XE_DEFAULT_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs =		XE_DEFAULT_MAX_VFS,
> @@ -51,6 +52,9 @@ module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
>  		 "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
>  
> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
> +
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
>  		 "GuC firmware path to use instead of the default one");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 79cb9639c0f3..bab43dbacaa0 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -14,6 +14,7 @@ struct xe_modparam {
>  	bool probe_display;
>  	int force_vram_bar_size;
>  	int guc_log_level;
> +	int guc_log_target;
>  	char *guc_firmware_path;
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
