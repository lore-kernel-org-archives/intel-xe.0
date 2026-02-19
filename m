Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93976E9A058
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DBE10E732;
	Thu, 19 Feb 2026 18:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC8/iW7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6A10E732
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524662; x=1803060662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XYxTdMwCTmqJiCUxhgxiHjWSbnu0i+8n88JHM3zyPZc=;
 b=DC8/iW7/ItPqK0KrUGv/cQoZz+p3sCKM9thWKqYsCSrvTKZLokpZHH4y
 yqJv4OSrXs9Bwf9VD06RwDsGhn4VMUrsWhWv/6ZGJD/K4G086GNJIu/w4
 obfMHnnNWRb1LQL2jPd56ApsAuxJGpgF72VwTy7nyHyyzo7LHfOOfT8BD
 iptzOks53APLKzluejuhmHqv093ODjxKCxw7E9HhSy2zH7Kcm+6z5nJ79
 osO3MLn6P9vexNv1Ma7i8DFdU+xsX8LI7Nv5b0vHCYzlgpWEgpRdO0tue
 8LNZ5GYqkYt6pwD6wDi7rid2b9GtgmBCJLWbhuLf3JfKVpbznrhzmrZnB g==;
X-CSE-ConnectionGUID: r2nXH3FdQVq6hYBA3U/H9Q==
X-CSE-MsgGUID: UBMA6A+XTs6XaHPH0mFbpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76483527"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76483527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:11:02 -0800
X-CSE-ConnectionGUID: Qfb/95leQ1mZrZsQ5CqNSg==
X-CSE-MsgGUID: lmdFeQuaQhKp31R2o2mQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214457491"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:11:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:11:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 10:11:01 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:11:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7613KmwZqZacMbhfPe3uKOIlu2l4hls2tU1smCI0UaOusZKjAwx3JohVapXR9qo5EdPN2NfvSd9Zj067GKqzO/GwvNcE3U7PzgaDn98LkIeuJj6P6QnPDkiv7NLZYcinMo2Yd9sYYgpMn2xF8mcLg4s2DRNLImeInhS+Jq1b/RA3hxKFFTK03PZhqYOAY2i2kTVv/3hTXBfoo0Ar42LHO2bronztYLTAl8whUDmPnfvM0snXdNL50jr9fytqhCjGt2X7QRUn7UsNAG78T6EreFM39OMws6VrZnBfCxBXJzxjrsCHA0dVDuWIbsaknMC5Q3eqypKtzfbKCZNi4ecbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAq1nMw/E1Zc03X4kAurYg3S0L/6uYhO8kP2gcD4TS0=;
 b=wQb+w97MzcVd8RZAFHmjF4VImxqNb6ahs6Jx3M7kjxjUCgH150FHNfdZM6JLiqvm8udCBdwbKOCoHZmVvUoqNQsV9fdd9H8RC1gayoqmiiBIZzy02v7zB0Y1slX6KojEKukkZgSKVpGC/CsttX2a6YjedldXS8ThpwiF5ah1B296CmRv/sGpTXnn4ktGh4oJFa5fwPAGMPg5fK9UuxoHBcmi4j8b2p5EKUsRb6+OFJmt006OzJ6cBB8o4ofdd3qcrEN4Uv1wu7aHOu+QIe40+cHUARmVVEMfw0gZRukTmlQTTvtdrR7LOBiT8/1JeqSjQnyYZ5f/Zr0KpxAevy9QRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:10:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 18:10:58 +0000
Date: Thu, 19 Feb 2026 10:10:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: restrict multi-lrc to VCS/VECS engines
Message-ID: <aZdSMMklBjAbTGae@lstrano-desk.jf.intel.com>
References: <20260218233823.369988-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260218233823.369988-1-x.wang@intel.com>
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: efa5b585-02dc-4c6f-625b-08de6fe23b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?21P13e1rkUXw7qux+eupTRIfK+tmR46lT1a6KniG3XXfHuwpQyAFNX2fgukw?=
 =?us-ascii?Q?CaWb0VPzjP/W+QW4YTEc4D7TmahDF1xyjw53EDF3Ne9fGH1uagSXXOmAue1v?=
 =?us-ascii?Q?RhdhGecRGfIIYnkyeT+s+HhfcxfPty0xJCy2RYE6KjKGi88xAvrRgAJuv1lH?=
 =?us-ascii?Q?3oumlU6NttoHOX4mMfPcRh51XxL0rhROPLE8c1kuFcKc8yddixIp3JFwr/dB?=
 =?us-ascii?Q?2dX21b/EuNdRHj/Nk5ieCAKtaed2YnujS8oxgE0NiCDd0bq5e9kdEOceEKHj?=
 =?us-ascii?Q?x9OXnSgx0p85eEP5L2jtyvkkXOQ8biMxT/ICtuUXuaxqIVOmBYeB+zsRlHj9?=
 =?us-ascii?Q?jF4lIUFeq4E8kslKj42SCM+HqYVwUJTQIujfAWDzfIv390WWE440thmXLJ7b?=
 =?us-ascii?Q?aQ0YBTjIdQIbFNtHlU7CQ4smyy0ATWC67Rl+nKFMffprQmdaMpFh2ht4x1wC?=
 =?us-ascii?Q?iyswA9ZOjxd4edxWQruSYgxXO91LsHTJsucg0u57TCthbgwX80W3ExXGoiOr?=
 =?us-ascii?Q?oEYa7wavK7dAfL0VPnDsjzdjqoZyLMZMV9GWVXq9lR7px9dbaLDKKOMizn/w?=
 =?us-ascii?Q?HXw/YdhrRBHAwwjlWHNfllExtHwV19e7FsnT4ueltkyOYVVG2cuK5Vr+pqmU?=
 =?us-ascii?Q?dPnU9K4f7pgL3BfMKksmzPoUiZA7LT4qpQfUg4/2P/1pbqeO9lnFWHhBa+2A?=
 =?us-ascii?Q?5iFceHrRgF9ZRCbx+DDxO7hjQ6b1dSOPcyuAPoMPga6dEQuDhHMVP8As4NkC?=
 =?us-ascii?Q?kxpqbJyjT2ISMf+tj8ZUVwzUBMINB2siw4mHlLNadSUMyLUmx2XK+4UeNwrr?=
 =?us-ascii?Q?KCeKxwZ+Bk/udwMyHqO9oQqHwFQ+KydD6R1vYzXlppDT/45QZP/6nG1i4T+g?=
 =?us-ascii?Q?Iph0t8/kEa0UvSaiRcBDTCtA5L1Bhuw+mHSNt2ij/PSL1aRG76alVwMWAOjQ?=
 =?us-ascii?Q?dOsNNsyTBvj41rnFUqQb4p4HR9B/uh4BYIiRceF1m+nKaRBrdmeLvclV0LGM?=
 =?us-ascii?Q?NFxHhto4xlyv+UDDVx6p+OJ7H4mzTpM1vJSqqdO77p7X88l0xZkestxfTsBk?=
 =?us-ascii?Q?broYBB/JCpBjNKj1Q3UB24YslWTknwNx3RSPbtYsv83t7qrogXQEfIBPNeJG?=
 =?us-ascii?Q?HigbsoEe8MqP0W0szyF8GbVaFARHrxElYVoQ6g7iX09t6TsLLQMb1aCfSanP?=
 =?us-ascii?Q?/G9MFSivVp+eDoaZrPnAWwatW+GlNLkTkr9OIe2rnZipas3MBCyyd7TY2g10?=
 =?us-ascii?Q?jIhq9tSUv4Asfh0S10d1dV9VknB95CdpfPqDyXMY1gObmi1sLKRL+8/kxkQf?=
 =?us-ascii?Q?sOsbopiDsqxTlBqp/PkFbC0zl7pIufgqDao3fKm/iU9b5hMCOvVvgxfxITLn?=
 =?us-ascii?Q?x/jw5vVg0zVSjrBfhyU9Z7KUvGevaaGnrPGAOKBJNGnCotfxTB9G1a+EGkZh?=
 =?us-ascii?Q?9wvyE6od9fLNCoDwQyYGT7S1vSZMWc+6mBVpcbePOiNFbLRCe0I8oBgQfqQG?=
 =?us-ascii?Q?35nzMtA8q+4To7khBFIkk9veWKn2iam+DLE3y4diofkKlylnpt0hMBIqiZ8Z?=
 =?us-ascii?Q?UJlR25wtSjfZ4qdpRSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ga+uawSQj7PLK5UKDhVjY6pfoeA1qNKxeOhDTnzZtkKmsIdx7ZYeyFAN7YBF?=
 =?us-ascii?Q?vMCsBsbFOKsiUy40xARvBLqb9KW1EzfvV/7lZjpzetGlIXsgcLWwOLbrMXpB?=
 =?us-ascii?Q?vE7Bkl8NIXGKiciDcRmtGVpB/iJnTf82xReiK5X8n1lZgL14uiWYVG88vxKd?=
 =?us-ascii?Q?lQxTRsIii4m89F3bQbFrJn7Zb/lwzZVyId8LVGUSMeTdPsNeKmXH7uHKWw5a?=
 =?us-ascii?Q?r8XN817L9iwsHxvu0wum8xlkvvNfLHdtVwFOyHWJEo30kWWuZ6znAkReVJVN?=
 =?us-ascii?Q?P6kVtMot5vVlB1iUgRTsbjF8Tqu11ajcgAZ3DPYXRVxMWbJ2qDaqkH7ik9JM?=
 =?us-ascii?Q?X3PLeCyO53wnRseKKa0UVJrGNOEw+SMj+VXvzroId545ZTWtGNyLPhoHmMQ/?=
 =?us-ascii?Q?U+HnjEp7mkZuZE2PmiFycL4oKwjm1SMyhHT4aVy98aFZ/nzKZpuA+1/Aw8VV?=
 =?us-ascii?Q?CeMuv9Af5ij/j6bw3jCBnNUIx/YlVKKwidR+1atdbxUbjV8LxcA/NpP2BkwD?=
 =?us-ascii?Q?0rLtYkBktXxkSUdPCeI/a3WYCYjZ7kF1TbJJ0xAkhQxynZ6uQ8HWuMhTLZgR?=
 =?us-ascii?Q?0dLmElBtGhpJXMrnYYTQ+9PpFSDrdjqtJafWF9FZs9TSAS3+hINMy/p/1GKP?=
 =?us-ascii?Q?w9vV2CXgcSli/kCJi+52vPlCOExm800VCpdcneMXGgX5jT9p4TArYK35ESQ8?=
 =?us-ascii?Q?8X6CY0ZjkMSQzSVjSmyaDGRwFJuukW7+7l5fJmG6qzcFMuwvTjIOxDTmFJ4J?=
 =?us-ascii?Q?lae1QAvrvzJ3xevJeaMAJkXE4ON5GVB+lsQSo5MqOnRNJ6v08fykyJt8wfVS?=
 =?us-ascii?Q?Xfl7ia71e5H79XKeYn6y8RTIxmDpqMLISi+QYTSmCPyqV9/saQjsu0N4CjIq?=
 =?us-ascii?Q?GSlswuJ2tiJsbS0k3SPY4IC0/0499zjDchcoh00VN9o+flNF2XBC5Qs5rfoN?=
 =?us-ascii?Q?JalZmKXvvZXAy8UIMa6ieXER4oU/M2wD7gkaO9WGb5kR+Yi59cKmDhqsqts+?=
 =?us-ascii?Q?T2nynTWw/SZrVTkUm2IzCVN22Zemlkm2BctDvc3pu5epb9XkoqTTs1s76iBH?=
 =?us-ascii?Q?/ZDBE62cnQUsldqtuxSdta6uZXT04HEFMYBkHOUsuse6v/+f1V10j1PDb957?=
 =?us-ascii?Q?o/Cb5qe0vvvUTJO6srsU66GcAJBMCQ3REnuE3P5mudMbZDcRgcUpPB6BLRER?=
 =?us-ascii?Q?zIsh7jQW/KwPnYagaFRPKqnFVLwd4FgwXF0vszdqdgtkY9a4MddLmqbVzmt4?=
 =?us-ascii?Q?w6ZNtuAxjFr9By1v/Y9s2bs1/V9qGi8CmnWVCk8LmjMA1mLxbayrOeUgi0aY?=
 =?us-ascii?Q?Mvqa2y+uLogjooEFXkvdk5/JbxuqIM1aSVHLUxETAhWyu/OB2bvfzOWq0yFu?=
 =?us-ascii?Q?n7kwpL5qbDJed9359EdJ/5/kvBfS685dRbp4Ygc9GMPx81VoJujmTDvzhipK?=
 =?us-ascii?Q?xKhH/nJoD02tyRFxftkuqo21ATY3aJPxMXtZonI2DEwG+vnX6YXKFR7Nxx6a?=
 =?us-ascii?Q?leDcOGAFNFVXQyJSCDQhZbFgF6CJ1FeDDdWCJORu9V0NwCYUs8ibZYnpDXfs?=
 =?us-ascii?Q?cv/Oxdc8jGriXnuTuffnpbleJgER3EIcjrOxkV8w0XxlHbwIiarjQI/LnMJH?=
 =?us-ascii?Q?f/iF0hZB6+t0sWQvZLTy5HqU/g5lPPspjcyosv1u7ge2AAw5P3lmGI2Ehl0l?=
 =?us-ascii?Q?mtU0iqoJB+pOBYgec4Vli+ed8QusiSqRsYo2dmJGx/siiMpr+Ugc9sBZYpfh?=
 =?us-ascii?Q?aY+1TE7GpfxdyW0amG191dyjmgfI/8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa5b585-02dc-4c6f-625b-08de6fe23b93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:10:58.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1+QmpGqptoxPZHg59DrKN/ff3KhVGcp6nHsoE5jwwNXPXYpVtjCTMXNshzMHJVUYjRMqvuDpkR2IblgCdEH7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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

On Wed, Feb 18, 2026 at 11:38:23PM +0000, Xin Wang wrote:
> Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
> VIDEO_ENHANCE engines only. This check should have been in place from the
> start, as the driver typically avoids allowing uapi cases that we have
> no userspace consumer for.
> 

This will break IGTs but that is likely fine as long as those are fixed.

> Additionally, the GuC firmware on ModSched platforms no longer supports
> multi-lrc on non-media engines.
> 
> V2:
>  - correct the typo (Shuicheng)
>  - move the check earlier to avoid VM lookup (Shuicheng, Matt)
>  - remove the graphics version check (Matt)
>  - input more details in the commit info (Matt)
> 
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4..36bf570ab221 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1184,6 +1184,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (XE_IOCTL_DBG(xe, !hwe))
>  			return -EINVAL;
>  
> +		/* multi-lrc is only supported on VIDEO_DECODE and VIDEO_ENHANCE engines */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
> +				 eci[0].engine_class != DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
> +				 eci[0].engine_class != DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE))
> +			return -EOPNOTSUPP;

Would it be better to store a multi-lrc enable class mask in xe->info
and populate from xe_device_desc in xe_pci.c?

Matt  

> +
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
>  			return -ENOENT;
> -- 
> 2.43.0
> 
