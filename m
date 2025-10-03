Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2609CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 19:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082A10E158;
	Fri,  3 Oct 2025 19:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN3fxzww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7110E158
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759520976; x=1791056976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=miHmFPLbrwTDPRbDTmf6ErgmA4dH8/l+L9TFISp2tkI=;
 b=XN3fxzww2GBSuK6nOWdTqB7Bf6rmSGybn/dudQ0nunH9rKEorDVEoVek
 EdADynTQ9KaEgCDONLqbJYZteZEYjAPQ5JhurAJK/eMAM58TkdJkUPz4s
 7MbF19DgY+S9TvPCP9iFmlkiInVN+L0p0A5ovS+GhI9nCqr4jchl5JZ9r
 YL5/WstZGGbJbh0kgPTcLgfWE1e4EVSnMZl+B8GijEu6JsuzviJbclxrt
 T9UPHPHtb7Vn0nIlciA23O6QYlNKnwM+hfty9ZTVDmlkykgQOwAQEXUy3
 ccfWE7yauYLoNvUFVyru1NpPLoAI9tvCaS0hfz8Outx2ooCsCN7/MYGJJ g==;
X-CSE-ConnectionGUID: f+AXflr9QIumhThQdLPE5A==
X-CSE-MsgGUID: J1IFsEvwTc+tfTYxvOciPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61769193"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61769193"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:49:35 -0700
X-CSE-ConnectionGUID: b7Q9HndRRBCnGye7JrZBww==
X-CSE-MsgGUID: 3KAeTCnmT/ax+G4egZJETA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:49:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:49:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 12:49:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:49:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCujZr/e69KBwrZ9Fhq2RZGRjPfOfp8j46ZEHr7gcEIix2St+5kjNaw0W4grFR43nUw7lpGEifOec+cbBZ43QbA1P/pxoyqMFijJ/bsBWC9vBH1DURZXiXoBR+f1Hui2n9LhpGt04wEhOPc7haSv+GTqfYzfJQ/QgAlx1lhWiq2t+zhHIljzF/OatXQZsabl0FYtUk+UUUUf80FbFBu9OwDaqOkJ81b6dBg5hoRhGjJxuUGVHRjjMcHMd1Ep/C7w8s52gUkqWicJx05doKV4AxcpMfeB65MsHHqSRmtFDHnxvNA05SOctqKMqrA3oW9L+fgNYtysi4vQEFgTvf6/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT0tXkpXxMP3fhiCbR8Vv1y4vh670qX45+wx38rdy6w=;
 b=ikkFkCs6lezyWCoP53XgtOSMsQESFBNMKmUspTog8tUp24dfStTr4rVtCo27gnmaSYphzuKe6F/pSSIz/VYrH/FZDb96THDkhT7BkBVOTHyKV+UR6LDWprUIAEHyUSmGfqtnmUBJTqIlh3WLe1UrRGKoJBpg+0j42jl6thEC8oP8yG6oZNb9rw62M7PwqdyF9BC419QM2jgN6fqeAoz/8VDlVGmsyK8rUpsCw6MecTqpGYRLtit0cBtV+i8rvxazbYkxJg2LH98nmbzLB+m+8BWQbOUzmtk80lJwuFBygRYqmZsHHFCULJ2E0eXaOJslN/kYin5zN6DHQTSH04N6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 3 Oct
 2025 19:49:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 19:49:32 +0000
Date: Fri, 3 Oct 2025 12:49:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Message-ID: <aOAoyZGIpkEWXILt@lstrano-desk.jf.intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
 <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
 <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
 <aOAmTW76SjtPpS73@lstrano-desk.jf.intel.com>
 <0e4a67db333a000b722e114ec52b8c8000db32e2.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e4a67db333a000b722e114ec52b8c8000db32e2.camel@intel.com>
X-ClientProxiedBy: MW2PR2101CA0033.namprd21.prod.outlook.com
 (2603:10b6:302:1::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: fd214443-1770-4385-1315-08de02b5f8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ffzEz99Il/NXDXRSM8e2Hll7ZvE8FBoHmSyhNkDIWlUlGwyIrzF5vlzV+O?=
 =?iso-8859-1?Q?hhoq6CQZxGIgSZI8VydfEJ+hB5FsImYGqmeUeufSS/n0eWfFpVhoopBWhM?=
 =?iso-8859-1?Q?ZVNRNL9MhoerZXPk0pGZNa3XVaW8z9a4eXx7hNClN5HlU+w1n5ddHF+axw?=
 =?iso-8859-1?Q?e0T/TAPDp9bJHTIF2lpXXpeQc+/j59CTguKTb5gpLTnRr1zySt8IbcIXpx?=
 =?iso-8859-1?Q?WymQyhtn1zE2hHyVd8ijA1MLDri4u+aYMuRQBY2vR7aGZ7mJ7/svPtKq+9?=
 =?iso-8859-1?Q?w1BRLNsK2zn/PeNn4/ACRy8iFcgdEvC3921amg3kEayEhEKYn6SiMHRfPa?=
 =?iso-8859-1?Q?AbiUzWeGcIdFLhi+AbpcvXfuBNDeEFGnGNAQnY0zF7fC7JAAyuhD8I3JpE?=
 =?iso-8859-1?Q?Rg7Z46qTHoEvymKlwCPS6FxG8QbDr3dagnByhURi9p4l7e3IxlPwrxrS78?=
 =?iso-8859-1?Q?4dGNLd+v7Gw8uAbEli8Icj+Cs5+P20RA9FqDlsw0EmwXzkAGsr2ViEP/60?=
 =?iso-8859-1?Q?s3g8GLfr2OuQllO7diqxow0g+8UXgqDsfzlkDNGiHB4uiSR6sRlEiKX1Sx?=
 =?iso-8859-1?Q?lEIekkpIlH5O/PmhMBTI0FzvQoouUdMMQlXiJQk6/Dr89nziMkCyI78Ald?=
 =?iso-8859-1?Q?wtRKCXuFnHrSmoYLjPloA8wTlKG7Z6rmtes3dbhtzAy0IR38HpJFfXuCUs?=
 =?iso-8859-1?Q?ikKgOITakac1OwTnv3qi0pHBekfcDjcdubwTElthOmcypWgYI5eiEuAsDJ?=
 =?iso-8859-1?Q?n6vT7PyGn4/wYHw10h/Lsjac8WEVZO/GC6g+qAcY/rgbsueRKgzXJG4uy7?=
 =?iso-8859-1?Q?Ij0Nxu17a0onqsD0z6ipABb0Sqm2OcEgICp94qTYajD3iYUxBlxkUahkgi?=
 =?iso-8859-1?Q?0eYIAubI+0wr7yL4+QWejrWzc1l9PMMIjuDS46q37xLvfYfhYgPiOazagG?=
 =?iso-8859-1?Q?HnmDSMf7y0UKhcfaTkhODmiw1/c0r/3QbsN4OTvAJJNmqrxhI9vYwo20mX?=
 =?iso-8859-1?Q?aAP1GN9yPPpbdpY/PEmIriC1Dl0SSAFRWhbALcvnY1iozSujOwyiIRJe6A?=
 =?iso-8859-1?Q?u0W9AxZJEX2RbI3SaCrwzgVFmvrzNpU9XFs9Am1Tckdy4CqQhGWcOQTw0T?=
 =?iso-8859-1?Q?XRmKeIBObIr6M4q4jyubr71K4siuqwzORxtzJKzN01v4mT9DB8DJ4MojVA?=
 =?iso-8859-1?Q?pcsvFsyPC2ABErEhAUYtoL7oX9ZYzPAVAO9I3LEnmLxO3ZY8ZWU1rW5xep?=
 =?iso-8859-1?Q?Jtn3gPUiHwbOKgeWkHxJri/RyaddoyQk17nfX3dKhzQCVaxAEbOCIhu7x4?=
 =?iso-8859-1?Q?cFHdKAfwY0F8tF0LVM+exnJJrHQGNp1xdVXGWw2pXaMuQ8HHEHGBd9dVvt?=
 =?iso-8859-1?Q?ONM7j5FaVEpUojNZVybcvmIVMRzAw+8cXDQ82c+zxyf2mpGw7PQA+pdYHv?=
 =?iso-8859-1?Q?QP9YBUdSA+ZMQtdKR/rEhOWZR1nm/c0Jo2o/f2dW7+xldlXQfWqx58nYR2?=
 =?iso-8859-1?Q?XPdtBNajj1HNIV0tndHhYw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6EM+STI8qnIX/1O4bE4loV/0dmYBXxgOqehCnsTfnQcg9HSOX9RdNVzHCf?=
 =?iso-8859-1?Q?l+hiyANl/LFnfX9scSYbiowMR7e5tCX6sxkVOVSadXZT5aCkdjYv6NRl3W?=
 =?iso-8859-1?Q?kjZ1zQ9sHf6SSSnmEjvYN3scTMa6LBuA6DRrI7rinzBOfypBf0kdaPxvJ5?=
 =?iso-8859-1?Q?k/7Ba8i/V/P6yTIj5rCP62Q0u3RGE8F8IGC76VlkYtSdW3JjdYx28zQjxa?=
 =?iso-8859-1?Q?80LaFLVxlJoWaQka4z80ro7Ci/Xo/16lL6gvKFqylFxxLOE1xY3mI3XQWu?=
 =?iso-8859-1?Q?zyXXbAMeimhsNNPMdAhtMdBGU49A5dsxS0Fqk/oQA2WVpWyc2kCqZk2BhP?=
 =?iso-8859-1?Q?2lZBnPuL+g2WuSXS85W+/jxiL/lH8hnEs4Gbb1LvKZLvxmlmVhobga2J2M?=
 =?iso-8859-1?Q?ODi0H4P0h6KUY8EgS4niZhJgP2BnpJ3REXIZEme/Gp2wbr9Yxah6unWcSF?=
 =?iso-8859-1?Q?gKGDy7rNNRAM8aUsnQuN5RMpLOaPPd5Jf6Agftik5ely6PPkndhz1XSwnL?=
 =?iso-8859-1?Q?SJ7ZeOVXt9xWpNQpwBEpFH7E6agwB2XjscNLRIFhA4BZa9RcEz2Zq6tX6K?=
 =?iso-8859-1?Q?um2AV36igl4vcFy0sTyZXjBaFVj4rOODIj1VtnP5FOqJXIM2dtuW04wsMR?=
 =?iso-8859-1?Q?qSWLN5VcWFGSclbH6OeqR6ONGSZP/TgckqE91CJ6+XdfMWkzRVPp3U80V2?=
 =?iso-8859-1?Q?inYH97MhTmV1Lwp3xl9m02sOEME+i2/8z6tl7jyMN9QQeH2z9x9pPA3tVp?=
 =?iso-8859-1?Q?oJbUYa7CN8elTbLKj0hP0+aRNWvlrThRQaObJXTCr//vvcJShfxQWUgvBY?=
 =?iso-8859-1?Q?8heX5FoARYMaAUuCDLcp8UH9SqEaatBjBJOdhDhBohnn2OVpMTXsViE3hL?=
 =?iso-8859-1?Q?LSJWgy4SOdDBhtJWPlQJheURxRqc0Oir0cIqeVXFZbawfY0nMgOqBCVsBn?=
 =?iso-8859-1?Q?P07sdtLb8A+lQsexblVszvZ8PiJf7DK1ZqJ+n+tvfnFi1LN5W0Ky38GkYs?=
 =?iso-8859-1?Q?PYUKr/QWmwNy7oUN9KLNS9eCW6GZU+TJ0R1Lobv8Y59ktzR6AXgE2FAsd5?=
 =?iso-8859-1?Q?rtjXo0L97HbS6+GdR1FEm2Su+jNrGU9w1U7octuY8RrWoTUrmN3PY9jpsG?=
 =?iso-8859-1?Q?0tWRkXakeTLs4VNd75bduBzn3W5PxdnBBGCbzBkA2MCxkviM4nf3IeWrcs?=
 =?iso-8859-1?Q?My5bRg02rCyY264MQuWuo9kXeRJbSpWcDsJwcGMPsLlitKIDHPF6fKyxGd?=
 =?iso-8859-1?Q?Hv+9zaTTyQP/k1Ik7QQdHqupLkmTqJdbyPoa0Wi07NAhxGoHj/DJojkXG+?=
 =?iso-8859-1?Q?/V7cdyP9Lf7k8pjjSljkx7iqleSfaCEqxRAtRvHJe+VSXYYyGF1vMojz3M?=
 =?iso-8859-1?Q?I5odAual7LMLn0T6hqupTLqCna16NEBN1UVVf9xXM6tkpKmtoj1K5TLtzq?=
 =?iso-8859-1?Q?8qNs4ZP96FcyhHFW3BfDysrjsvmmGNi11PP1pfEYa+YlO5PooN9yA2fd3w?=
 =?iso-8859-1?Q?batl1TRq+XVyPg50Tqsub89fSzhvnA1uFIlTpqPP332/Dv0SmmQJ5y2ZGI?=
 =?iso-8859-1?Q?/bVEKMqudFG492zUc4ThKdSfXmD2EoS++Pfz8UwHyTQRcyrIugbwQKUXZI?=
 =?iso-8859-1?Q?1MgmtqELB8wYencjDH17BQNl4CSRbHm19zVPol7RCGYCrUfdvBmqJBHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd214443-1770-4385-1315-08de02b5f8f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 19:49:32.3185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UR0epVU0V/rgADPVeAOjz/xBMvRbvA3gdLvOGJaGeE5BG1o5tYikI4z2xfC4QTaBir/ivlUkBQ2bqFg0BADS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

On Fri, Oct 03, 2025 at 01:42:26PM -0600, Summers, Stuart wrote:
> On Fri, 2025-10-03 at 12:38 -0700, Matthew Brost wrote:
> > On Fri, Oct 03, 2025 at 12:58:37PM -0600, Summers, Stuart wrote:
> > > On Fri, 2025-10-03 at 11:54 -0700, Matthew Brost wrote:
> > > > On Thu, Oct 02, 2025 at 11:04:44PM +0000, Stuart Summers wrote:
> > > > > In the event the GuC becomes unresponsive during a scheduling
> > > > > disable event, we still want the driver to be able to recover.
> > > > > This patch follows the same methodology we already have in
> > > > > place
> > > > > for TLB invalidation requests, where we send a request to GuC
> > > > > and wait for that invalidation done response. If the response
> > > > > doesn't come back in time we then at least print a message
> > > > > indicating the invalidation failed for some reason.
> > > > > 
> > > > > In this case, we send the schedule disable and the expectation
> > > > > is that GuC will respond with a schedule done response. The KMD
> > > > > then catches that response and in turn sends a context
> > > > > deregistration
> > > > > response. So in the event GuC becomes unresponsive after we
> > > > > send
> > > > > the schedule disable, we actually have two g2h responses that
> > > > > have been reserved but never received.
> > > > > 
> > > > > To handle this, make sure the pending disable event in the
> > > > > exec queue gets cleared (i.e. we received that response from
> > > > > GuC). If it doesn't in a reasonable amount of time, assume
> > > > > GuC is dead: ban the exec queue, queue up a GT reset, and
> > > > > manually call the schedule done handler. Then in the schedule
> > > > > done handler, in turn, check whether the context had been
> > > > > banned. If so, manually call the deregistration done handler
> > > > > to ensure all resources related to that exec queue get
> > > > > cleaned up properly. Without this, if the device becomes
> > > > > wedged after an exec queue has been created, the attached
> > > > > resources like the LRC will not get feed properly resulting
> > > > > in a memory leak.
> > > > > 
> > > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 23
> > > > > ++++++++++++++++++++++-
> > > > >  1 file changed, 22 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 45b72bebfc63..a177d87c8524 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -939,6 +939,9 @@ int xe_guc_read_stopped(struct xe_guc *guc)
> > > > >                 GUC_CONTEXT_##enable_disable,                  
> > > > >     
> > > > >      \
> > > > >         }
> > > > >  
> > > > > +static void handle_sched_done(struct xe_guc *guc, struct
> > > > > xe_exec_queue *q,
> > > > > +                             u32 runnable_state);
> > > > > +
> > > > >  static void disable_scheduling_deregister(struct xe_guc *guc,
> > > > >                                           struct xe_exec_queue
> > > > > *q)
> > > > >  {
> > > > > @@ -974,6 +977,17 @@ static void
> > > > > disable_scheduling_deregister(struct xe_guc *guc,
> > > > >         xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > >                        G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > > > >                        G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > > > > +
> > > > > +       ret = wait_event_timeout(guc->ct.wq,
> > > > > +                                !exec_queue_pending_disable(q)
> > > > > ||
> > > > > +                                xe_guc_read_stopped(guc),
> > > > > +                                HZ * 5);
> > > > 
> > > > This doesn't look right. Deregister is designed to be fully
> > > > async. If
> > > > this flow stops working for whatever reason the GuC is dead and
> > > > eventually somewhere in driver will detect this and trigger a GT
> > > > reset
> > > > which is cleanup all lost H2G.
> > > > 
> > > > > +       if (!ret || xe_guc_read_stopped(guc)) {
> > > > > +               xe_gt_warn(guc_to_gt(guc), "Schedule disable
> > > > > failed
> > > > > to respond");
> > > > > +               set_exec_queue_banned(q);
> > > > > +               handle_sched_done(guc, q, 0);
> > > > > +               xe_gt_reset_async(q->gt);
> > > > > +       }
> > > > >  }
> > > > >  
> > > > >  static void xe_guc_exec_queue_trigger_cleanup(struct
> > > > > xe_exec_queue
> > > > > *q)
> > > > > @@ -2117,6 +2131,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc,
> > > > > u32
> > > > > guc_id)
> > > > >         return q;
> > > > >  }
> > > > >  
> > > > > +static void handle_deregister_done(struct xe_guc *guc, struct
> > > > > xe_exec_queue *q);
> > > > > +
> > > > >  static void deregister_exec_queue(struct xe_guc *guc, struct
> > > > > xe_exec_queue *q)
> > > > >  {
> > > > >         u32 action[] = {
> > > > > @@ -2131,7 +2147,12 @@ static void deregister_exec_queue(struct
> > > > > xe_guc *guc, struct xe_exec_queue *q)
> > > > >  
> > > > >         trace_xe_exec_queue_deregister(q);
> > > > >  
> > > > > -       xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > > > ARRAY_SIZE(action));
> > > > > +       if (exec_queue_banned(q)) {
> > > > > +               handle_deregister_done(guc, q);
> > > > 
> > > > This would leave the GuC with reference to guc_id and subsequent
> > > > reuse
> > > > of the guc_id (i.e., next register) will fall.
> > > 
> > > But again, in this case the GuC is dead and we should be getting
> > > that
> > > reset event you had mentioned above. The issue I'm having is
> > 
> > Banned is a per thing queue and more than likely we wont be doing a
> > GT
> > reset, thus we still need remove references to the queue from the
> > GuC.
> 
> Yeah this makes sense to me. My use of "banned" here was probably not
> ideal.
> 
> > 
> > > specifically around wedge events. Without a GT wedge, we will
> > > normally
> > > go through the GT reset flow and recover like you mentioned. But in
> > > the
> > 
> > No. See above.
> > 
> > > case of a wedge, we don't redo the software part of the reset (i.e.
> > > we
> > > don't reset contexts, etc) per gt_reset():
> > > static int gt_reset(struct xe_gt *gt)
> > > {
> > >         unsigned int fw_ref;
> > >         int err;
> > > 
> > >         if (xe_device_wedged(gt_to_xe(gt)))
> > >                 return -ECANCELED;
> > > 
> > > Maybe instead of banned I can check for banned and wedged here? Or
> > > maybe we should rethink the software reset flow in the event of a
> > > wedge?
> > 
> > The idea with wedged is we leave all hardward state, including the
> > GuC,
> > intacted for inspection. So I think a xe_device_wedged checked here
> > makes sense. This would cover the case where start a queue teardown
> > via
> > a CLEANUP message and mid-flow we wedge the device.
> 
> But hardware state doesn't mean software state. Are you saying when the
> device is wedged we want the memory to all be intact as well? And how
> do we determine when that gets freed? On unbind?

When we wedge a device we take a reference to all queues which perserves
the software queue state and also prevents any queue cleanup flows
regardless of what a user application does. On driver unbind after wedge
we drop wedge reference which should free all memory in the KMD.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > +       } else {
> > > > > +               xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > > > +                                          ARRAY_SIZE(action));
> > > > > +       }
> > > > >  }
> > > > >  
> > > > >  static void handle_sched_done(struct xe_guc *guc, struct
> > > > > xe_exec_queue *q,
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > 
> 
