Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E272C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 00:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22910E73B;
	Thu,  1 Aug 2024 00:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNzvUVRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449410E73B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 00:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722471274; x=1754007274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d7auoml1O7hC6wSRzKdFECMUotuGJ7sGbJq85QLmKBY=;
 b=bNzvUVRc3bwh1dlui18U/zNfbM//I0jkIm5wUjPvjVzq51JMTTD9OErx
 dpp8saoYs3pfu3e9HYrNLE0ZlxNguPuW4hiAgT3ixJBl1CkZYFvIaadP0
 8LstYZrhyspHKEd7y9EUHP0ScpLHCk68SfoI92hZ2U6ON+MXrJ4Fpahac
 xDMXfMZNLnM/IVJM99nWiUydd/iYiG98uOzJlN/LRU7r9HSVKeJ8jz3iL
 SQQpbec5QOFocAKhX8VWqG1FU9CDSxUUBgRxuWR0+ICy7Kv/qUR7zsJWm
 WnAWZx2NZaa4l6yKMxMqTz927LKU+GO7+uCYs7FjuZb4YdgT23S9Yz1U3 g==;
X-CSE-ConnectionGUID: iyiziF2CR3Sq16b+62Hgww==
X-CSE-MsgGUID: tdsTSdcKQX6shA8MuRyrQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24154750"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24154750"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 17:14:33 -0700
X-CSE-ConnectionGUID: ScLoNCEPQnCz+cknWQDWqw==
X-CSE-MsgGUID: fQB15MvyQmmD5hEuLtvVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="55637905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 17:14:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 17:14:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 17:14:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 17:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgApIKpbqa8SBnjgoYjnb13bNWiz3AAJJIH6AW/uf5NFHk9ekAAMoskJxcn9GB4Z1CWf+J79itIzS3WMg8Q+uKOnNIPMptvW/iJRlRcymZ+whxq3Lldqf7fb3lBOKSBxWiXGF3JJ1FXN8GTBHLZIvM5juftNbM2gtXbv7t2rpMU/RRwh5+NRAL5WcRREcOg+IKP1XvcB8f+BLe55o+7Iv7b2qpvayM3trCVqPEDPLTlHiiQwSqAN9YGmNSOkPLtZ/eIbW3sPGnQD4mkloA3g49BiyHXWmgOR/JJQlc2qOKCSl+mYSktp0eAkvBR0hTjTnykboTlBxwfFqL4jjFBMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vrak7cWhlS+mQ8j0sR8NN1nc0QE2eFZTUxmgqUs+Sk=;
 b=xSm9naxrJCRBRbJWlsbdoS8ZBh9LZyNj4GCqFobScFOxbs0JxBBJQYMvSe9xPDWR46ifKbnkjzn9l3dQknFrYVkif3mSpLAiz2R16WeLDPElMzpcfJZEQ1YSf4lqXgXedHMRNCk/rBMeu3kWsIMKAEIMzvJhz9KwhiCVePtRv79XOcVwdfXcMmHqu/0ZYcWs0X4r/CGQeYL6+3Xx4ds5/gCsPAGyT+0RgUoKAy8c/InDZM1P3Gv83d7A5vhWbs3tuWVbLb0GlHmuCg6p9qsJR6elmrVHD6U7OI+sSr4HxsLFCRaqg5z892+ojSK+rcMTRmiy568bpRXx6QG3DKigfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 00:14:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 00:14:30 +0000
Date: Thu, 1 Aug 2024 00:13:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/13] drm/xe/hw_engine_group: Introduce
 xe_hw_engine_group
Message-ID: <ZqrTMMbqvvVGDfgI@DUT025-TGLU.fm.intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
 <20240731142349.4101307-2-francois.dugast@intel.com>
 <20240731223507.GG2685051@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731223507.GG2685051@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 338d3342-5aca-452d-344f-08dcb1bee97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?umMYk4gaEYL1KWcJ8euX1dM76qnFxvhlnDMGJ/SrCzRHOqPOjjMvtDcmpY?=
 =?iso-8859-1?Q?vawgkbTJ67i1cvWAhLHTl7LpUg8ga1mTbSGL8j36SiLbLGDtI2TnioN+Xd?=
 =?iso-8859-1?Q?NE9xH3vNTizn5oOizmUHlU/Fu18ENvLb73n7S6kmbyC8EyC0SBDVg7ZkVN?=
 =?iso-8859-1?Q?7Yv2JKsWG+lxRbX5TDFWPweJAGQpzJ5Ml4pI9qzZ2qMTQUERTgvZXgwfpD?=
 =?iso-8859-1?Q?0oaAkyuUBNfrxHSrc3llYb9dQvP0BW+j0UG+yhFSwtV2Dx5j//wDVyZjC6?=
 =?iso-8859-1?Q?y7Gy4xRvyK/rKCsg2LycCb9pUdGMI2YLHV5B7TRrFrKdaWskzd8ExBea5B?=
 =?iso-8859-1?Q?GC+bJFL9d0hpPvDd4M9ufvCVBjS07JGVv741zKcZopjLp0F3B+8LaVlI8j?=
 =?iso-8859-1?Q?Iip5qJFuzFLM0A1Hzki0tD0qtKf+m+QAFlw+Gle88M1rutR9chPuxt1rLn?=
 =?iso-8859-1?Q?cT+UdeDmhv+JbY4mYi7Ef4oPpVatQ4U6jzNgHrqqoZy4L4ikGrX6mYVKF5?=
 =?iso-8859-1?Q?N+OUwoASbrEu8RF9kcDr7/vnGyiKVhdbtraxpllHly5/QVrP+fnp7Keab4?=
 =?iso-8859-1?Q?aU60tWV6n9hdKKCWhC2WoAnqqJ8qycwfL3q6MlQqzGjwrQsQQZemrwC7cp?=
 =?iso-8859-1?Q?hZ97x8IhbdBmieHOkINiYkbJxsuA8Q/5i3G4bfubjxJYbfNfaqeLD5QZwl?=
 =?iso-8859-1?Q?He/gFiGoX5IXt+6NMQQpxckuUt5pKninprdQ7IDYzEhnzDQyxnE86wjTwu?=
 =?iso-8859-1?Q?c0+jwjdhN5jIMW7cE1XAmxHW6reAqqtGNEbmtUwe/HYUBvz3jyNPpWxZ1U?=
 =?iso-8859-1?Q?94IIkLCBuCW780XuQc/FTCIH8vNA0kykyNn8+vDTIzwFnh1RtsMe67ZcUm?=
 =?iso-8859-1?Q?8SbBpws15KBlrrqASsHEPB0bcdtXxaF5VTB0SSdZMZB2vEqWS3eGoJK3rA?=
 =?iso-8859-1?Q?8j1O7pwCWmhqniqRYGyXdzl/1kynlrUbgaiZKd61qwlJ0YnGq4hY4diaVE?=
 =?iso-8859-1?Q?kZimlKEMI150cYLG9CpTdKcNGloohQFvKuc0zkORNBn+jnyRGWeQ4QkZnS?=
 =?iso-8859-1?Q?z+Jcdkxbnk9FayJ6ot1O36TS5cpU1nCis+nshxbcCe9Zq2OC0oXBOtQhME?=
 =?iso-8859-1?Q?GU1Cn8C08kK0VQTuYmi6Cv6AGwL7qNvgsBVW9pOHf252X8C9pGCzy0pObi?=
 =?iso-8859-1?Q?AE0BGUY+VcS4gRwG4qPq0VNhG4wY/VyxKVuCFwdC5gUTtw9df/O1lHd+kn?=
 =?iso-8859-1?Q?qKMzJKq95yuijsrbPPZ3/v3CaKUcl7SoljWIJujSOcimQZm2wDL9W3pL30?=
 =?iso-8859-1?Q?5cYFqicFzFNAPf1aBmVbQZwkGwCWC57QMk/VGTaHseVcZrd+xhR1H+1znD?=
 =?iso-8859-1?Q?HasFov/GYmLwOR2NpL0ljwUu7uDMMPbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Oc36KcBnomv3jrGcnq3ywVhW4steef/m/B2k9c4hDCdXMvZr4h5SPahdT7?=
 =?iso-8859-1?Q?aPWgZrN6c8bYdCwu7U5HatUSc9uAo1LhN3g8GQS9E47QWEHJrz3ML/HWV1?=
 =?iso-8859-1?Q?UKxJ3bbyqCK8pBXmK0Sc2v1IKE4rgF8yeqErOOs3nPBHtNJ/iIJ6Ubn3fc?=
 =?iso-8859-1?Q?xKJ2k/Vd8y4uj6yJVcPDzTPVTeENstg/zaFmZwiGyWCYG34yDD8o28ZXZP?=
 =?iso-8859-1?Q?gu7CAHMelimW2ALkErtsClEiEirAqA5KVoiBLx7uJdpXZBkkImU+h3HK/T?=
 =?iso-8859-1?Q?lPDolCPiBll5euo7WgOLpB5bFrLIWUW09tfVDustxZ6NKKz13/vsLtUHXY?=
 =?iso-8859-1?Q?KSxSOIA6i+i1kDTtwJ6nWWRASJqvuCy/APBMtMqYl/ZI1lrSQ420T7+czR?=
 =?iso-8859-1?Q?BVweb0Vg0R1tRghVWeKemhhnCnyiS7g+OFGeQEdH8XMQBNtEHSN3R1KZzf?=
 =?iso-8859-1?Q?S2aUIxhaMtnbtj4QKyChdkruypbXX69k9t9K0XyMPF3Stry+cuWwmcuAof?=
 =?iso-8859-1?Q?dOP4uLCmwiro8UvycX2pYR9hX+iWkH3YPc7VMuDhdus+3wYw9fPFvxSJM9?=
 =?iso-8859-1?Q?5kJMff54Ny629tSrJ+8cRXwciulsQzPw3D6Xh2JDyrcaavzeGv14Qj5ZbE?=
 =?iso-8859-1?Q?R5mUMsBNCPE/ZnZeyqrjWSp+sIEhvVJfqxrcKFWdErWa9rVyiAVFlFIIIi?=
 =?iso-8859-1?Q?m2qg7ww+2gjHlwZ1AtH15+uxb2yVQl63zEJ0I7dBXOtGNbzJxTSSlYBB7g?=
 =?iso-8859-1?Q?HUmpOofDT88Jj9IkA/5MBG1iTRRgipvFVkl1vMzlifUKIA0WxTdRm8Oteo?=
 =?iso-8859-1?Q?ITsSiMSU5db35qhXft/yGDbrXcVYrNkDpxex8IZNS6/FewKIMjaVsq5v50?=
 =?iso-8859-1?Q?CGH5g1esPUTGqf3TwtMGmm7Kr+p51j3DBSKomo3+pHNQdSx1d7cWNzP1yj?=
 =?iso-8859-1?Q?XBTAGDv+z6Stw2cOIqfNvvyOmmBZgNR7SeULKSnBpERdT0qS1h/OCLJQFl?=
 =?iso-8859-1?Q?RjcHrKMwfQ9FQSPpbJQgPVP4YknrZvuB0r95E2W3XrMWDCUJK171+VaFMH?=
 =?iso-8859-1?Q?z1aVQq64hAqCTCBOeIBLC05En5b1EhkTDmBH5GWZzTVVVZTHFFWVAOvCwD?=
 =?iso-8859-1?Q?oYTX1jg1znsyscXyuODOL4m8hcGQOmHOq3D3uND0XiXzHbfytuCIOJe+T1?=
 =?iso-8859-1?Q?sII3GqhfmWTfKoEvxm/NrXOsFXAfMAnAAYVxxaaWmpyxsf4YO5gp+he7Oa?=
 =?iso-8859-1?Q?qsKlPA5gaJXBUNzHH3gjzz3MNWKu9MsnoDpYrS4Bi77+MWXWEdQvD0IcwN?=
 =?iso-8859-1?Q?mcZ1ez5BHCPNnd6dAtR+l9j+xEiGJZQ1osB0IxGaXD+zvGXKvqpthxTC3q?=
 =?iso-8859-1?Q?nQpW2wJLSVE/uxtSogz5Ty13GfK1reONmp7JAgsR0Vazwm/PZRFz6Ki1rL?=
 =?iso-8859-1?Q?loMB5uyWgxkekFBNP7r45GQxJ8fb+nmf+ay1LHBYqh2pptcteELzgpdJMI?=
 =?iso-8859-1?Q?70kbxZ4/ZjW5sFMMjrHNC9OXmCntXU6LuUbN7ZJ4Ta8R8YlASJjgmh65LW?=
 =?iso-8859-1?Q?5sHd3hjlF9mvPAjxTUbO2N+EAYi9BalZt7O00QUsbERifxJSp9dR+ghO7a?=
 =?iso-8859-1?Q?Hk4re+EouVpQsZihfJ6DUrzFbokXIi9kVM+OKmskHizzi/r8Hoj08eSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338d3342-5aca-452d-344f-08dcb1bee97d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 00:14:29.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNzovAAcMcL/Sn9pCOr30Wt1SQnDTIO7kMcZJfMLFHByaGiwyq2hQYnpGKGm4YVpy0Vd6vPDfk5mxrbu4nUh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6195
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

On Wed, Jul 31, 2024 at 03:35:07PM -0700, Matt Roper wrote:
> On Wed, Jul 31, 2024 at 04:21:35PM +0200, Francois Dugast wrote:
> > A xe_hw_engine_group is a group of hw engines. Two hw engines belong to
> > the same xe_hw_engine_group if one hw engine cannot make progress while
> > the other is stuck on a page fault.
> > 
> > Typically, hw engines of the same group share some resources such as EUs.
> > This depends on the hardware configuration of the platforms.
> 
> How do we determine what the shared resources are for a given platform?
> Are there bspec references that we should be checking to figure out what
> does/doesn't need to be grouped on a given platform?
> 

Eventually, yes I think we should figure this out on per-platform basis.
I think the series as is likely safe on all platforms though. We could
further split this up as an optimization later.

> The EUs shared by the RCS+CCS engines are the obvious ones, but is it
> really true that BCS engines can't make progress while another engine of
> the same type is faulting?  Wouldn't that be a huge problem (since a

The minimum grainularity has to be engine class due to virtual engines
(i.e. logical_mask of exec_queue has more than 1 bit set).

> fault on one BCS engine usually requires that we utilize a different BCS
> engine for the migration operations to resolve the fault)?  Or am I not
> understanding what the groupings represent?
> 
> For VCS/VECS, is the shared resource we're concerned about the SFC?  If
> so, then I'd expect there to be a separate group per SCMI / media slice
> since each one has its own dedicated SFC (and sometimes some of the
> engines aren't even tied to the SFC at all).  Throwing all the media
> engines across all the SCMI's into a single group seems like it would be
> overkill unless there's some other resource that we're concerned about,
> so it would be good to have some more details in the commit message here.
>

This was my suggestion as figured sharing VCS/VECS would be safe, can
optimize later. Also AFIAK in practice, we will never have faulting VM
use anything but BCS, CCS, and RCS with our current UMDs. So sharing
VCS/VECS doesn't have perf penalty at the moment.

Matt B

> 
> Matt
> 
> > 
> > v2: Move to own files, improve error handling (Matt Brost)
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |  1 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  4 +
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 99 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine_group.h       | 16 +++
> >  drivers/gpu/drm/xe/xe_hw_engine_group_types.h | 48 +++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +
> >  6 files changed, 170 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1ff9602a52f6..b67ace7ed204 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -69,6 +69,7 @@ xe-y += xe_bb.o \
> >  	xe_heci_gsc.o \
> >  	xe_hw_engine.o \
> >  	xe_hw_engine_class_sysfs.o \
> > +	xe_hw_engine_group.o \
> >  	xe_hw_fence.o \
> >  	xe_huc.o \
> >  	xe_huc_debugfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 00ace5fcc284..f62992d0497a 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -23,6 +23,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_gt_topology.h"
> > +#include "xe_hw_engine_group.h"
> >  #include "xe_hw_fence.h"
> >  #include "xe_irq.h"
> >  #include "xe_lrc.h"
> > @@ -764,6 +765,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
> >  	}
> >  
> >  	hw_engine_setup_logical_mapping(gt);
> > +	err = xe_hw_engine_setup_groups(gt);
> > +	if (err)
> > +		return err;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > new file mode 100644
> > index 000000000000..7fd10f0780ea
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_hw_engine_group.h"
> > +
> > +static void
> > +hw_engine_group_free(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_hw_engine_group *group = arg;
> > +
> > +	kfree(group);
> > +}
> > +
> > +static struct xe_hw_engine_group *
> > +hw_engine_group_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_hw_engine_group *group;
> > +	int err;
> > +
> > +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> > +	if (!group)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init_rwsem(&group->mode_sem);
> > +	INIT_LIST_HEAD(&group->exec_queue_list);
> > +
> > +	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	return group;
> > +}
> > +
> > +/**
> > + * xe_hw_engine_setup_groups() - Setup the hw engine groups for the gt
> > + * @gt: The gt for which groups are setup
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_hw_engine_setup_groups(struct xe_gt *gt)
> > +{
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	group_rcs_ccs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_rcs_ccs)) {
> > +		err = PTR_ERR(group_rcs_ccs);
> > +		goto err_group_rcs_ccs;
> > +	}
> > +
> > +	group_bcs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_bcs)) {
> > +		err = PTR_ERR(group_bcs);
> > +		goto err_group_bcs;
> > +	}
> > +
> > +	group_vcs_vecs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_vcs_vecs)) {
> > +		err = PTR_ERR(group_vcs_vecs);
> > +		goto err_group_vcs_vecs;
> > +	}
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_COPY:
> > +			hwe->hw_engine_group = group_bcs;
> > +			break;
> > +		case XE_ENGINE_CLASS_RENDER:
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			hwe->hw_engine_group = group_rcs_ccs;
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			hwe->hw_engine_group = group_vcs_vecs;
> > +			break;
> > +		default:
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_group_vcs_vecs:
> > +	kfree(group_vcs_vecs);
> > +err_group_bcs:
> > +	kfree(group_bcs);
> > +err_group_rcs_ccs:
> > +	kfree(group_rcs_ccs);
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > new file mode 100644
> > index 000000000000..c2648f87f7ef
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_HW_ENGINE_GROUP_H_
> > +#define _XE_HW_ENGINE_GROUP_H_
> > +
> > +#include "xe_hw_engine_group_types.h"
> > +
> > +struct drm_device;
> > +struct xe_gt;
> > +
> > +int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > new file mode 100644
> > index 000000000000..b828d85d24cb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_HW_ENGINE_GROUP_TYPES_H_
> > +#define _XE_HW_ENGINE_GROUP_TYPES_H_
> > +
> > +#include "xe_force_wake_types.h"
> > +#include "xe_lrc_types.h"
> > +#include "xe_reg_sr_types.h"
> > +
> > +/**
> > + * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
> > + * engine group
> > + */
> > +enum xe_hw_engine_group_execution_mode {
> > +	EXEC_MODE_LR,
> > +	EXEC_MODE_DMA_FENCE,
> > +};
> > +
> > +/**
> > + * struct xe_hw_engine_group - Hardware engine group
> > + *
> > + * hw engines belong to the same group if they share hardware resources in a way
> > + * that prevents them from making progress when one is stuck on a page fault.
> > + */
> > +struct xe_hw_engine_group {
> > +	/**
> > +	 * @exec_queue_list: list of exec queues attached to this
> > +	 * xe_hw_engine_group
> > +	 */
> > +	struct list_head exec_queue_list;
> > +	/** @resume_work: worker to resume faulting LR exec queues */
> > +	struct work_struct resume_work;
> > +	/** @resume_wq: workqueue to resume faulting LR exec queues */
> > +	struct workqueue_struct *resume_wq;
> > +	/**
> > +	 * @mode_sem: used to protect this group's hardware resources and ensure
> > +	 * mutual exclusion between execution only in faulting LR mode and
> > +	 * execution only in DMA_FENCE mode
> > +	 */
> > +	struct rw_semaphore mode_sem;
> > +	/** @cur_mode: current execution mode of this hw engine group */
> > +	enum xe_hw_engine_group_execution_mode cur_mode;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 70e6434f150d..39f24012d0f4 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -150,6 +150,8 @@ struct xe_hw_engine {
> >  	struct xe_hw_engine_class_intf *eclass;
> >  	/** @oa_unit: oa unit for this hw engine */
> >  	struct xe_oa_unit *oa_unit;
> > +	/** @hw_engine_group: the group of hw engines this one belongs to */
> > +	struct xe_hw_engine_group *hw_engine_group;
> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
