Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A44CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 17:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7510E994;
	Thu,  6 Nov 2025 17:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqj4iSEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0235F10E994
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762449342; x=1793985342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xvy4hu02PnEBkahc3kV+1mG0CWwyw+bZBFA9f4pBHuA=;
 b=bqj4iSEWURG10GGNe3J1FnBLx7czs+tsb5ON1YcD85O1R5qzinucRF5o
 LAl8DXkDbehQ1n7/baE05uQFGm9ZqXuG9SUT6Hevyx5AWWy0Z6R9/QKoy
 RDn35VMbSEcZdue6cmXexaapOtyHXW1ZYmmZ5Rwt0P9Z5QJ0WOQGiyGeR
 2L92UxHyxKRyJFphl2+ZVbIOeNiPHDVMHRKmeezrtw55xFb+XjpAS5LQN
 qqhj0FaGGwYwcAbvCcrMN12M0mwLiRXVJdAWGOl0lhdwK2ZZEqPqajzsV
 rfT9fxwwvi3QdAxLzMLmDMYfw/yKu846GPlaGJDHI4DnWECpRQrddcnBf A==;
X-CSE-ConnectionGUID: ZVY55ypAQkm3pufGDf7aeQ==
X-CSE-MsgGUID: AT71CHHHQ6aUTWwiib7VaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68455895"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="68455895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:15:41 -0800
X-CSE-ConnectionGUID: P2Ra9Q+1Q8mQCgZq2QG29Q==
X-CSE-MsgGUID: M8h9yU+ATEmWOcD3K8czhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187105047"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:15:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:15:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 09:15:40 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBuUPgrF5ixcotRHmZd25aP/ukBAVlSQZbyF/3ql4pF9eFu2AQ2U8BRfh7EZX5pasC+nN7V34M0exCpctBj7MAyAmd5QIFar/UnsX9SnpmCDYSKfOaVEaxwPzvjVW47OrfYuT9TCS7hvootPKKdgbegtUUBsF9096/aaMcien0ZJ0AGSFF0SSviDSInOPxxNVUJJxdk7+8P/BxjmjlDXTKgdP/gB+c0y1GahdxUOqWm0ConlZh/0oSL61sVSQPwUGJ3N+dNvA37wdDOiytJKWUi6uxOpxwp0oQr5iDTZbEqGuIn2UvKj4QKiNfdBQeUpY9i9wJw4S/jbLweHnn1FoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4lrh67JDoqsBVm4UdlgZck2xzjL8+MtR0J4zLnH38g=;
 b=bddG4C40N7IGsR+Z70rps50v+BLudO5Zkg2z9pXLh/ZmrVNm2fRh4rqkFlHKdwahlcU6hHS/tREWfUtuLQ2CRMoCT8WotddyXJO318d4orTrqklBZAdI4ENOTNS5ekIX6ohllBS/IfegU9DvM3JZg6+4QVy4XVNCv5uDa1v+KBuckoZUjLNlZHaMMVsGfDZd72IjaVPPsM1HNx24YGtxKzr7LZJbhOrqvFqZJUNblj0JnqtO6gQZ36pTsOoCbmpQldAzERIbGxxx3noR1SRRqLnjLSY7JnsagREPy+JIkS2SAn1EmzzgwDzubsuuI1y2PydnbGF1rvgfv0WVynmyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:15:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:15:36 +0000
Date: Thu, 6 Nov 2025 11:15:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/remapper: Add lock to serialize access to
 remapper index registers
Message-ID: <bur63c65tuwerzgokwswhvuhunlyjfl4wvf4jf2ssm3uhuda6s@se64rp5zpcxs>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
 <20251105234753.603647-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105234753.603647-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: f956b158-ed90-4f6e-bbb1-08de1d5819cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GMKFio0WUrhopT3oaqVRGOSBK2XBFAlkvEVWLqUSwKTfofh/dhXMQ4HgSQ?=
 =?iso-8859-1?Q?u+Re6bIbfN2yqdIBI8ySBt1mBupC4mXEdFGaq4phOu/gKqEQJC4dqvx8HV?=
 =?iso-8859-1?Q?5OqaafKe2Npzxgo7PuZd6iDUI/NapYNBHxYCVkW0GBeqa7wMhlUTkV4lZK?=
 =?iso-8859-1?Q?ny8eNMbveBkXfpO7VUGL+oG2PJBLbfF+WNpLQginO5OXbAFQX/tCS4OoXA?=
 =?iso-8859-1?Q?950JvDfSeH4F3uMoWHDIKSAoPt/dD9sOsErvAvpIFFEaorg/T8S8dZC7uA?=
 =?iso-8859-1?Q?KRYbYFx8S0m75nJRHarw/LhhCA91x3SuPXDXWkbH4jKlaSzeHvp7bKLc1F?=
 =?iso-8859-1?Q?RvNbSnly/Ect4BIxI+9S+UgwxOwc+nFIUgmlvVWWpSIQfze/NJx7mRSq+1?=
 =?iso-8859-1?Q?YAZZvx8jZTCJl2pUfWCSkaba3n26V+FN1xKLG/J1AOj0qhpIXtW8vo3/N1?=
 =?iso-8859-1?Q?qEQtth4ePkPO6y3J+0PNXhfmmnSPbWYX8sPjvSd3izet19omyU3hruku8H?=
 =?iso-8859-1?Q?z3H02xrHAAi/3txLA/ZHVsPyEvc5wUz8fExheTJi7nSQKvAoraobNLoGpK?=
 =?iso-8859-1?Q?7yUnUQ7YTwqjXR+v6fMX2J3vtqoOMBUC+9PwENZcohA7hdoACSyKRYSJTS?=
 =?iso-8859-1?Q?+JPEWhKfgzBY5FR1HzFzppFvXg5AkmcNAVLkELIvbe8FLws0wRYXA1Cf21?=
 =?iso-8859-1?Q?TCRa8oBO/eNX1Eck3lqfNdgJ9DK8tlYH+XJRVJ5SOlfUkZwSy4TAoYrLVR?=
 =?iso-8859-1?Q?v0ddjB9UdwhfrarDPqXW5uamVfBHp85dVwpFmmyujY+S/KWHuYdmH6gpO3?=
 =?iso-8859-1?Q?306cAzt/OBa+VYLrk5zhUr1jZCT3OsquwySWB1ZTOmVbpw3vlCdCOIj3Rc?=
 =?iso-8859-1?Q?N0fYyV6JSUAHE3u5FmP0ycJS9qQ54OvrphU4StY86+pnPAXcgEaAELPi8R?=
 =?iso-8859-1?Q?bPmpmT9xacDgidnN5C0OdAQSVz6smBFB/W4RmcAVxkYwCHP6rs//SoYsj+?=
 =?iso-8859-1?Q?Qb9a0qappI3KGMAvFKUiOlVgoDbkmvgl13ehk8WrYC5x4rNmQDsvI7g7t8?=
 =?iso-8859-1?Q?dRLgbRVRZdibsIG/dxnn+ZpHs0924e2NH12QB4N2EsUxShmTw3YkwNpJzJ?=
 =?iso-8859-1?Q?Ah32xByK6PrqFoPpexbG16N3B1LnKIEZYQezZ9onNYnG7zl03OPcl+2EMx?=
 =?iso-8859-1?Q?b3NaQRPbE3GheuI3nG91odsdsA+H0iptrx274Pu0A3Td/SFSInYbrnC2W1?=
 =?iso-8859-1?Q?c8yz/eus6yATwKgpfu9SPm1W7n1CLRn9KfZu8uF0fgNtwT+UMRdrV0nAiS?=
 =?iso-8859-1?Q?0nrQ9vPwJU87sLI9FTR5UhA70F9veAo+E1aJeQxDOmN+5k1Vaj1sdVjle3?=
 =?iso-8859-1?Q?Pw4/9Ft67w6kF3OrE76RhIczVD0Fo+lt4NUW1s1hEutIylLPEQ6D4Y90gs?=
 =?iso-8859-1?Q?48I3h0E7YmdPxYvj29+uYHCye1/ogTpjMtWQlHMAn0OU+V30PYw+Pi6LEH?=
 =?iso-8859-1?Q?VCfAXufbbKWu++GeSG3xLV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CaFU6LHHKTUSTzgQ1nHIB3SHFWxHeS+uvSehHd9xA4xDbICkoZKsynLdtM?=
 =?iso-8859-1?Q?5HXwUF7Yk8yB4t/xyOu2DAg6WqIOk/bWsznF9FeVM+MXvdFaxW9TQPjKic?=
 =?iso-8859-1?Q?JI+7qZ59UbA0bY4c4S15zGGwGpzDlIv9eIFzu9p5tgBWNtSF77E5FBKTMw?=
 =?iso-8859-1?Q?coKUFB1raKHYb3o3xloNTHx3vIwogGlBxtA2rDFO0ecnVUhsZaXexXOlf8?=
 =?iso-8859-1?Q?gt5h7SyGff1rkId7PkUo/GPbq9herfRkD2PenRWbsDWI9MHskNA5//Vrpe?=
 =?iso-8859-1?Q?a/34+RTL2jD9EgRH5gpmtJaV4JsOxWBQdWxV7k4DNocwTIlI28kb1eoLqF?=
 =?iso-8859-1?Q?CdmER3bSiGT9QJN1Z9VtkykdGhUYvNQgLsIKdti62kTIIUlJoU43Ebva9w?=
 =?iso-8859-1?Q?qf6Fy5Q/UwwHgQxWoUsrKgbvkaLFlvb/bZ7710/B/kYMr0ezrcs+tgdxC6?=
 =?iso-8859-1?Q?KCioK13BhtfdNFugBdfd0KelA80bEpmEutUtkuTVAuX7EV0NJ+ZL7zpY3+?=
 =?iso-8859-1?Q?17kIUUr34zRWu9Xby5MMSUvLwEiHAqcGMpkxcbKd0ma9LX6ClFGBa1zy05?=
 =?iso-8859-1?Q?IGGznnG1NbftrUHUaEEtSbWhUcvFlAPRp4n5YcB1WJTUpF39Roaldo/GbR?=
 =?iso-8859-1?Q?x0H1o8Yw97V1Zeq/TsbcDBXbwITt8aAxvuaA0kAg5G5m8VNm4eO+QU+XSo?=
 =?iso-8859-1?Q?9eOfZKCjEDlYD/AkY/AeOEx/EfxtjUTgSjp0492htzWshyblnbj8HgHnlv?=
 =?iso-8859-1?Q?dcq5j4xPYSr4jG5diaSNCVHs01IBbaCYMA+929qiKh40CtxRiHDKCGkVfI?=
 =?iso-8859-1?Q?nyrJRbbDSAj/HujicoBbBTrhI0JntbDbFwMv3pFbJ49OGyWd33OO5K+xOP?=
 =?iso-8859-1?Q?s4hgICLD5RJR56g/9NDAqQ5qESkXHNyRdRxcXMwuFZeFd4bJfBPAUvuL+k?=
 =?iso-8859-1?Q?K4hkWZ+JKhVdmLP8v1d06oHdFS+mU2HxnqqF/V5cqoWTrQJJO/si8mMNxV?=
 =?iso-8859-1?Q?z0qiUIJCm1PknqomdjHjFFntXEWlz6W1biFtOYV1et08l8aG7ouAkspJ7E?=
 =?iso-8859-1?Q?idzyJNWWiWxvhrWdNAvF55rH5KJZFA/vJcdgKlNnC/LLaFCVzTHTlwlXEI?=
 =?iso-8859-1?Q?wraUb0InDe5V7lWToVMRuYlMdvU1wFtLcZklLQAidzBY6F0tuY1T5A2ibq?=
 =?iso-8859-1?Q?6HeTMfFdsS01G5FIT/jfZHz6RQU6wHiyVYylIWUfS4senRYLkFaIu/caxx?=
 =?iso-8859-1?Q?xTBUfPxjCY/bxNK3V7W9EtIIxeApr/JpkLWPtT8cL+1WA1gL6rV8x6ukpr?=
 =?iso-8859-1?Q?pUcUnoriRrWrhkBJbO0aHm5yY5vIsd5U7JkFZLOQ/oeJAATTuVYug3BZh5?=
 =?iso-8859-1?Q?a1ftjcNsezws7/dxU2dR7q69RCZvC4lIiWmunv2I+4VpjzS4DwPzKkKsI1?=
 =?iso-8859-1?Q?ObZcrbnNRVoXMRtCnqdrFo6pwul+CQFLYAFDfbZPnRAWbExcY3itVvmZ9L?=
 =?iso-8859-1?Q?hiT1wKj6tgUGBkpBmJY7BNzJP9I7FmH3tRJJn8G6IJ3wmhTMoZ93JVpSSn?=
 =?iso-8859-1?Q?pEb7YBKhaAkoZExmosRMUX+e8FG4xfIC8/AiB2w6IMa6qjhUvwiWDAAzZ/?=
 =?iso-8859-1?Q?JLaRg+hNJkBy2DwYzKfXS4HSlrLWe4RfGqELgOHZSUGFbpP8bPTkSAXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f956b158-ed90-4f6e-bbb1-08de1d5819cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:15:36.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPMP3d31cTgR3oGAO8+cXn/sFY8mWR41wDkJj71axh1WIJjJwZ/qe2tCcxRn0xSDvoDANnS38HFkZWbpeBWzkw24NTF++nwsbENcH5ZXMfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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

On Wed, Nov 05, 2025 at 03:47:56PM -0800, Umesh Nerlige Ramappa wrote:
>The index register provides bit fields for different MMIO ranges that
>may be driven by different child drivers. Add some internal APIs to
>serialize access to the index register.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  2 ++
> drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> drivers/gpu/drm/xe/xe_remapper.c     | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_remapper.h     |  1 +
> 4 files changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 47f5391ad8e9..3c5c5e4184c7 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -59,6 +59,7 @@
> #include "xe_psmi.h"
> #include "xe_pxp.h"
> #include "xe_query.h"
>+#include "xe_remapper.h"
> #include "xe_shrinker.h"
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
>@@ -905,6 +906,7 @@ int xe_device_probe(struct xe_device *xe)
> 		return err;
>
> 	xe_nvm_init(xe);
>+	xe_remapper_init(xe);

don't follow the bad xe_nvm_init() or xe_vsec_init() patterns (in fact,
if you can fix them to have a return code it would be great.

>
> 	err = xe_heci_gsc_init(xe);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index dc17f63f9353..72a251204fe3 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -536,6 +536,12 @@ struct xe_device {
> 		struct mutex lock;
> 	} pmt;
>
>+	/* @remapper: SoC remapper object */
>+	struct {
>+		/* Serialize access to SoC Remapper's index registers */
>+		spinlock_t lock;
>+	} remapper;
>+
> 	/**
> 	 * @pm_callback_task: Track the active task that is running in either
> 	 * the runtime_suspend or runtime_resume callbacks.
>diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
>index 1374fc2f4dda..fc67efcf6709 100644
>--- a/drivers/gpu/drm/xe/xe_remapper.c
>+++ b/drivers/gpu/drm/xe/xe_remapper.c
>@@ -3,14 +3,27 @@
>  * Copyright © 2023-2024 Intel Corporation
>  */
>
>+#include <linux/spinlock.h>
>+
> #include "regs/xe_remapper_regs.h"
> #include "xe_mmio.h"
> #include "xe_remapper.h"
>
> void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
> {
>+	unsigned long flags;
>+
>+	spin_lock_irqsave(&xe->remapper.lock, flags);
>+
> 	xe_mmio_rmw32(xe_root_tile_mmio(xe),
> 		      SG_REMAP_INDEX1,
> 		      SG_REMAP_TELEM_BITS,
> 		      REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
>+
>+	spin_unlock_irqrestore(&xe->remapper.lock, flags);
>+}
>+
>+void xe_remapper_init(struct xe_device *xe)
>+{
>+	spin_lock_init(&xe->remapper.lock);
> }
>diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
>index df6b726a97a7..4deb8ad3c69c 100644
>--- a/drivers/gpu/drm/xe/xe_remapper.h
>+++ b/drivers/gpu/drm/xe/xe_remapper.h
>@@ -10,6 +10,7 @@
>
> #include "xe_device_types.h"
>
>+void xe_remapper_init(struct xe_device *xe);

I think it would make more sense to re-order this: first introduce the
xe_soc_remmapper with only the init. Then the second patch you extract
vsec remapper into xe_soc_remapper with the spinlock already in place.

Lucas De Marchi

> void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
>
> #endif
>-- 
>2.43.0
>
