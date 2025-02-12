Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023EFC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 21:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA2210E99B;
	Wed, 12 Feb 2025 21:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlbXGhnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF7510E99B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739395709; x=1770931709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E8VYOnNyLK3kKOAvHtA42h/tZG15F6tFJKlakxnyCWw=;
 b=jlbXGhnjpb00y0IvS58sOFklWKo5qe+vmPi+CalOZMY2iF5tyXYmkcyH
 BXjzYWIeR5LDCNRyaW2hg8C2HMNaB7YqRckaVEzYFl25UZtyh4lT1XFwz
 yCxzzfcUUmbqvo0CAuGiDH8I6YU1dyTkVnFxiG9G6yU8xqzEUe0xFlnPc
 q7G0U2djP4q5DpiLliC8nYSDTVLDGwcrjfxsUxc5wfOgEB/WiFZNuq6E9
 /9Sb3+gjIYW5KPTYJwwqzWR/P4vzdsyNYw08ydsSazsqR+ezLFMi71m9f
 mIUBBqmMUnNzVQMEy0SxXYPPp0e9BoWrBN7fXWMNd7IL0LqwMB2pUWuVg g==;
X-CSE-ConnectionGUID: qWuE+BPvSaa58RcvEd8xhw==
X-CSE-MsgGUID: ulLiiJNUTU69gMPnkM4BCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43732387"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="43732387"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 13:28:28 -0800
X-CSE-ConnectionGUID: ag8d53b6QmyVUxRnsD8H9g==
X-CSE-MsgGUID: P89yHYQ7SDivWXqk/5FcBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143886724"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 13:28:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 13:28:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 13:28:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 13:28:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkOVhATOY2FjYHBz9xxWk8wsgxT6H/X2dVN5NHoO32kKLlqUiJIbL9z4mHwYr2x9BnCvoIZbIjRnC8WNoe2OZ/uPays8z3tdoIruMpmD+JgIpCit6tmaQ/XzhXfNFqsSQZWAEYWD8cgW+kkj7soU+PxT5VBOehVPym0A+rBGZurpCT1WUHSbnocMWYYCBaacETUBurW6PD/ilwoXRYdvDpVEjKRS9oPUdXR/iE4aDrB0dd1zMj/J1DIftRMrehdhjYChIx3qKl5FCXyiVU5QJ0ligzuyH8tvL6RwuRpn0hkWUhrV2PTW1SIXn1KGXfOy7ZXQSJSw4l5d2FZOS9hqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHr74I9eTqeffx6Hi9AmCVp6qqNIzEeTHTv1XHY+3gg=;
 b=YeS2P6DMM4fRmKMS1vj9T8+2oHaKj0V5OZQTerWfVBcyPtpFbGO1DV2w/CFBqAAXVFO2WX4f17C4po3VvGeN56lVVILcRbLJcjZc7Y4x7rUOCDtNUl6ba0NQYIEw01zHG0dpx3QQFhWdGFKR6JL+JVHTSGwWyiRkhA7gIIAEUXJ/yYGwxhs6NyChEH/XF/fi01PsNp64hAYvjEZT3oq+sTVyXrGcbZY/7sooJo3aDRQqtHpdOncEPv5g/hp93Yt2bpM1EZVm6PXWUWZNRrhcTidOtbrttvr29pCmNtm2GFbCUERWSVXmoC6sehBqeEZulxwR69xyWkclCl6qDVb2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 21:28:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 21:28:17 +0000
Date: Wed, 12 Feb 2025 15:28:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <qdimi2zm224r52wjzof7y7fgvmli5lq2nb7ho55qdru3jlawzr@chxmjs5vs63x>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
 <Z60QWgI68CS8TflK@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z60QWgI68CS8TflK@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:303:83::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ef94c9-4012-4a4b-a25a-08dd4bac2a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UicLrz+JsZRmz6tlCRQnXvv2NAVgeCNFajVczqOJAuBKaDbw/oEboLYews++?=
 =?us-ascii?Q?Y/9+xYU9T/0hswYTx4G50Vcp6N1Fj30zzfKqZRFT5DlPeuVSyhbG6SH1JHxV?=
 =?us-ascii?Q?o4cueMkYIKXrPCQqTljoSXCUS+s6W49INUR7AcVPj1LB7OvU+XpaW+8ifFyV?=
 =?us-ascii?Q?52ys09015JiGSmyhKJ96mrClm0jqq4zekhZDewfkh2HgVYckzilYbx3mLl+m?=
 =?us-ascii?Q?sO2zWqtipyIagZN8yvKZWGrJIsMxBvwIy75SPX3GXFV+6Uxi8KjHSFBF03Fd?=
 =?us-ascii?Q?mjNH1wj+7BJpLoWFaqjg8uR7inEsOhL1jrAP4cyh1HZhwLi1JnUgswRO9ilA?=
 =?us-ascii?Q?2TAhVnGQPuYtkYYIEozFEcEMDmyS6h1Cu6auMMG93qA7zP5/VXbhMYJJD8Ti?=
 =?us-ascii?Q?M/3eXeJ9Zyf1nyaCbyxuz/MnqkfMl0dGOunTVuG/lxtHXTK96qXAR3V0ybx8?=
 =?us-ascii?Q?PFTFEo91opCw65YQaZ3KgvyfSFCZGq2U3MTc2bjThMhz2deELgE9+DSxn3ua?=
 =?us-ascii?Q?AlHjIjxfnkxiJ415mIyG4WnravvvVZM3suroLcRUev0epUkYkA4Mj4TMen8a?=
 =?us-ascii?Q?QKGRMtlY6FCatYc/Rw+36AmiDf3SL67jcwk8ecFsTTsBEEKkSYbwbKRxzqwL?=
 =?us-ascii?Q?mRymINoVaUDX+zsWf5LijpmzpVv9ET2PSTXpFhzinJ7tbgbTr1srg1FTbpMg?=
 =?us-ascii?Q?ZcsdoaGen9IX45idbDFnq+jNYGKFqfFvjU0GopxuJmni3juQ2YsIXpBlT6WB?=
 =?us-ascii?Q?KwMlCyQCMpBzEbQbayUNx2llEHmksshWJk1zE9JcKWVSFvJnMi7Dwt6uykJ2?=
 =?us-ascii?Q?x09BE3DCb2Ymd8x7+hAsHjcdfzpcLnu26h5KfhkuPN50XperuQFlrATvSeeR?=
 =?us-ascii?Q?+Gv+I4p34kouFSnURcnGkcnmbAddR3dgcBxMMsa48Vg4+XwmKCUYFEPVagZs?=
 =?us-ascii?Q?6+GhoOD/ddqwgMSW1mo88zD5YL7SVSkeokn+mZxY+aRo1QcdU/bffOYEb2Bh?=
 =?us-ascii?Q?9baeAYwjQakuYUsHNvQcktBQuRv+ahi5phrypoh88Ew0dOtCsZ0ygh5UgnRH?=
 =?us-ascii?Q?pIjjt5Q3DZGP6mCtbu6HbU6acqN8vCGdRKGoLvr81aiXwUpFES74CUYATEvS?=
 =?us-ascii?Q?YdnOLT51T77gcwX1OE5r5Frn9I7pmfOQQZDQD2L8800KIpBYCm0Skv1L4LcN?=
 =?us-ascii?Q?EEvwGQgtG3N3vM61LBvsnhJrr7B7x5da2Cy4DmXODRMKRKy4mUUn98Degt4o?=
 =?us-ascii?Q?hgZxPgip2A55E6MIpIqtTSzr284SHIhr3xtXYSuev5Uzt18gVdexFC/eGIwE?=
 =?us-ascii?Q?5c7GEjUyToo7TN+wfOGHRzigcS3O35K/cIeiaOsS6btJR1zGjFtPtpLNx8uq?=
 =?us-ascii?Q?y2z3AVDzu0Lw4kigiEjmMZE5/Ddq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2/Tyl7TToUQEb1eG83iTS35PDKibqUB3OKSlEes7sfC6eiZXYfR2zZnlgdku?=
 =?us-ascii?Q?Z3B0Vy2Gvpc4lxSFIM9o+QNkwvko+gtgwL3dGff9l+zTXhb4kkLfOiWQneuS?=
 =?us-ascii?Q?Yd2WPilVCVVx1vPk6xLxLx1XqiTkrEz90cMBdMSvG2UxW6no4ldPd1eNd8dV?=
 =?us-ascii?Q?ZbakehqxEWtm3CJ2Up5rrnJT2DZ+IVzNw7HvDscs75Lvc17wlTXNsPFDq/l4?=
 =?us-ascii?Q?eaVIXaVHI0Rk6A0MKPYySe5Zax4qYbz0GlqyZurxVpIzXT3sDyT4jEZ/FzGO?=
 =?us-ascii?Q?LjtUtIXijYJ3DHqFF1LRtJUysY5KqCuEDq5Wm2rFp0uMjddDRo5N6fVd4me3?=
 =?us-ascii?Q?V+Cy9luX3VJpAYotthNWT0A4Nmw0lH3i2QabJVu86z4zSs+5RrjQqHl4gOrE?=
 =?us-ascii?Q?Hn1kVjXvLvC5SyAp7NxansfgoiEsEbdTou2G1AAZ8z+V+Cw/VTd+mcjhq2At?=
 =?us-ascii?Q?0YTWWpRpjgWktWm7z0gA9XTX5w3tu/oxeqVE771X0k14VVWhKFpD8vHgpXWV?=
 =?us-ascii?Q?7bymaNhM+VNMTfYRHggcWGpcZSX06PEQJjooWYKhEBw2w+7Bs+nO8ooFJMwY?=
 =?us-ascii?Q?AjLn7jzULPvHJiIRkipRtf3THkZ3UKEUbpP8o2MRgIRG4ERDKQtM06skQBY0?=
 =?us-ascii?Q?S5QzpMdVtXEXfSaM1zI5zwWVuoAQ13dLSPqaUAhsLPpX/mDiNs2ph4Z0DzcF?=
 =?us-ascii?Q?Mj1HQcVuI/xmoy8xxvWUnajVSNmns4LDkqGXao3gRtyHjCVmOUWCGgXRWfoR?=
 =?us-ascii?Q?SSJSL3XuzHxdSX6oiyvFP5ELCjEAnttV8PLivIrhFX6Vw2cjKC7IEDc2GuVy?=
 =?us-ascii?Q?g9brpM2l9Ldh8KNiscsgz2CTAsgpocws8hbOFsTnH9igS1ucSbsFcYOQ5V/+?=
 =?us-ascii?Q?dmd7WZyksIdYefQoEWa80LKQ1yxnB3rjSHA5PswGVQoUR8Fk0XwR6SHIEIk4?=
 =?us-ascii?Q?oG8tf3GHQnPlvF1s+zwGkpevbBho2qSGrZ7fr2iyMG7qXq7noFl0BrchuvGJ?=
 =?us-ascii?Q?nFL06N5J2NssWvKpuc0V964Ey2I5SyPf0+v5KYFjCD9OdH5rx5SmvpTjs5ym?=
 =?us-ascii?Q?W+6KlpLDpyduM2Dlj/HF4290DmXh80Q/YJfuWqD06cwi9C9LOsXkAdW3RwoR?=
 =?us-ascii?Q?dFfUczlY+olfdIJwx9vaGNwyAIiIR0R3ouu/pw8FRgbIgagvX+6stUPDU9gb?=
 =?us-ascii?Q?Qiu48iJcrtw44uuQJSzDnpEI8ojkYGViYLohS1EfnbQ9iI6w7VjsylTF44gc?=
 =?us-ascii?Q?ANioQSRJefc3k9rr3EsIlizw5CoHdNyU7O3B9I7IiSe7KR7yzLflNOTq2Qpd?=
 =?us-ascii?Q?cmhaRJBm3M41Y5zTLQScvOJROrcWjJ6OF1uRenoD7arCAjPD8qCbP9m9WCft?=
 =?us-ascii?Q?DJU4tVqSyZAv+kMmEAM/i6g4l4dLziW/p1H2WXPrdoYLBaM8bL0vuWe0/cPC?=
 =?us-ascii?Q?CtFNOg1mmWElRv4wLX+oiWUovlB8MhIdkxhkTmOYVCUV4Ow9IGWC46N92cI1?=
 =?us-ascii?Q?K5n2xiWNEK3qC9VGV/gtzNqJx4cazy/PfPKiagn1Ptrxb5qLYxBvFbd4gxrm?=
 =?us-ascii?Q?qm7nMCq84FHOGlip4wIu5XuZPRM/Ok82DLir0oQEUKxM+xDvZ61uZEz8dtSQ?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef94c9-4012-4a4b-a25a-08dd4bac2a99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 21:28:17.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ojsNbLK9BDxrsRpgpDSUPd6WrymEDCNwtJrVfsKZGWawEeDqSz5R8mQuQymlEm5A5LKXEA42OBdu/hAybs7berwI4UDK0GhIpj2XvpRbIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Wed, Feb 12, 2025 at 11:19:22PM +0200, Raag Jadav wrote:
>On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
>> xe device probe uses devm cleanup in most places. However there are a
>> few cases where this is not possible: when the driver interacts with
>> component add/del. In that case, the resource group would be cleanup
>> while the entire device resources are in the process of cleanup.  One
>> example is the xe_gsc_proxy and display using that to interact with mei
>> and audio.
>>
>> Add a callback-based remove so the exception doesn't make the probe
>> use multiple error handling styles.
>>
>> v2: Change internal API to mimic the devm API. This will make it easier
>>     to migrate in future when devm can be used.
>
>Which means we'd like to go back to devm action someday, or is that even
>possible? Assuming it is, and still worth it, why not try to do that
>instead?

 From the cover letter:
	I have other changes on top of these that will make devm compatible.
	That will need some drivers/base/ changes though, so it's probably good
	to do it in parallel.

 From my reply to Rodrigo:
	The devm part is here:
	https://lore.kernel.org/dri-devel/20250212200542.515493-1-lucas.demarchi@intel.com/

	In the end I could simplify it much more than I thought and what is
	required on devres side is just one patch, 2 lines diff. Hopefully I
	didn't simplify it too much. Let's see. If that one is accepted through
	intel-xe tree, then we may even drop this first patch and go straight
	with that solution.

	...

	I will wait some feedback on that other series to see how we are going
	to proceed. If we keep this patch, then I will update this doc.

I hope this clarifies,

thanks
Lucas De Marchi

>
>Raag
