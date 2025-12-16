Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA790D609B1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 15:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB3A10E243;
	Tue, 16 Dec 2025 15:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e335fslb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748B10E243
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765899826; x=1797435826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c0ES4Z6F8I7AjFFUg655gzuhMDrPq9dFz2Ip3V9QF+w=;
 b=e335fslbjAN+DbOoJPTtmPBww36jKoQfPC3SNx7pJ1npn/D7OFJdyWiS
 1oxSpwT5/SdZPnldN/lQeyD/Ioz40d2Nywl+1zrDOAoXQ2bWBzDmk7sC4
 kky7MSyMVr74Nh8kMU9bOxHkbkXBVoFuLpjnoWCiNHs+GMzA1mYoLrIcj
 EbDr2mgbsksZ8B19vBHPRO8JUh+cJQ3nbQc2TYArPNhpbm9COicABqXB9
 knKymekdkbqqZfPI6VM2VpkdG94iIbr20Kq/mwbPynuKtRqNShMS8P45X
 wJVK4QaA5inEmkYFrSCwxiUb99DFwct3G/qT/AaEypVR60DNoGVk2oU6C A==;
X-CSE-ConnectionGUID: 0mVZOUHYTIShXnvzCGaxYw==
X-CSE-MsgGUID: pFFitNqbTomN2/kkgoGrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71676596"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="71676596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:43:46 -0800
X-CSE-ConnectionGUID: LTMaruVvShaJdOO44KY3SQ==
X-CSE-MsgGUID: nr00C9vWRBS2RQqodEMTpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198859283"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:43:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 07:43:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 07:43:45 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 07:43:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCJBcM+/v0KnizBqFwATunkM+J+Qs90jpeicnI4xdMobzf8juTVNvn01ZnCwqFv0v0m+377JEW9wul0vkGXFjCM4WSLOjHf7EaKbYCfSMBE6LSPNkW/gc9P1Nsz7OnOBXA81LMLDlgbtBHErK2ppEStuTLSYaZ3VmRCayA4rWsZyLNIslrBxplC2QTZW0MF41xF2KwdcJ+9QChve29wp9pxo1Ldp55MRUnBc9SBfXseC6gGWXmfj/uI+3NfEHi64Ds0yzzgZtfTnhaENJw3nmL2jw6QwPCFSqo8hL7KuHOCXfLomZu484acWBwD1I/4rFMqYaLVQAXOZFoX0lkDdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsUqSBhNlf8rHWr9UBbGWhMrhnjWPWrTw5wsewI5EwI=;
 b=l6FOpb+XcT6l7/3dbBYLP/+yDA4qnvshGixCLipkUxNdYcnLvzgh9+OCCtyP7iLw8H3B+BNopRvCGlZ1rQ/MPxaPtODjwhxn3xNuuySBznAP2iVkAbQ2vvKDYwenN0aUkZTHIRVjt9F8jBKRevOgSuI1hMYxKObga1YE3IPPR5xFIsBJjFfOcZoO1blnjeKIXqiOmoyCGDoHBj/zz9x1L75P11ziwCBWmIZYmimVSgdP7wb4VmRA2CgFwZbTM6ZjH+Z9a0cVmFoe1UtGk8aViVwtUBjvtFGaJXn6WlvCYxpW/MZxzx97+JnyoOiqP0AVQsMz1rYs9BglFRCVHEfqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:43:39 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 15:43:39 +0000
Date: Tue, 16 Dec 2025 10:43:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Message-ID: <aUF-Jt1F9qHJSwaW@intel.com>
References: <20251210174412.71084-2-jonathan.cavitt@intel.com>
 <aUBFmxDVaCHKn8Eo@intel.com>
 <CH0PR11MB54444EE0367FE3902378C680E5ADA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54444EE0367FE3902378C680E5ADA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: cb98bcd2-ad19-47bf-3802-08de3cb9e16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6uCApDJTay5ANnZd+V9F/j1/3j9JqQN979mxggaaBe+7QkgO5DBbHAra9d7j?=
 =?us-ascii?Q?K1JN1MKjvHurNEfIaDg0H8p6uHkIZAlmiNxo/2Kvrf/ASYC9FUPtmblhK4wN?=
 =?us-ascii?Q?ak+703eTnBH9WKQC8qPhWgmlI2HPkRixWXBy74WIALVfjuCO2iQU4d5aM/Tc?=
 =?us-ascii?Q?xTi8ZPpiSf4Mjb8SLuGF7lee8/zdfTHcnThv4XUhNN+MVGFR+p5VQoBiLGM6?=
 =?us-ascii?Q?Feb9/hRDW9suJUsBl6832XvdxNSeBdChfzkP67LA/U7XBhCRHpnvAQYj10pH?=
 =?us-ascii?Q?eFXFO1zseNLew5iinou67qAdKSD1tPsXYROqbD2RUmUB1Fo8v/46VBB74Zzu?=
 =?us-ascii?Q?CTIkt8MiG9dWoPvL6I1bK3PmMZncyUYTTs3Wmt+L26xHu7dcL5NF27MvGa6Y?=
 =?us-ascii?Q?5MY80wp1mZG3lx+3R2kPnF8GG2A5/NpSxFjZWQARWIFnIdzf0gtN0GSVoCTu?=
 =?us-ascii?Q?DHfYAGmKx8BEM/VyH0qnj9ijAswgEVhI4lNaJu+gJDX+IZuO+mHJIyRwQ1iC?=
 =?us-ascii?Q?+oDtE5+o6c0ROL1LibEplH1w4CFHht/9Qlz2xxjOClGZ6hVzeYohtZrgYM/F?=
 =?us-ascii?Q?D6lNu0vAYtpztypito8veOu05dDe3EqWRT7ozFidEuQdSRu2DOrSZDa/nxgL?=
 =?us-ascii?Q?wrT9G/2EvRepdHn88ojKqS4HJ7GbZcEIG6aHDkzUeGCdc4RqjExYLSgQve6q?=
 =?us-ascii?Q?EOvG6r0jeJs4bikqJvEgseS63Wy2f9zMZAMUcsXt+lckZifRF0UdBs7eJlZ/?=
 =?us-ascii?Q?DjAAfr/UgztHH22YQOMW/zWah7iltxBVpGGSu+FWsU5B0lk6wxf/px8XShNS?=
 =?us-ascii?Q?h+P62nY2c44WsMYPRfuqYy62vMn/haBElZfjxmreYA5qiGHvezRmj50PYTBG?=
 =?us-ascii?Q?A6TK6OW43ATovuQRoy5u7dvYgSBPdfPmtHGpHC2P6v6QzuVkD+IoIdfGzyJg?=
 =?us-ascii?Q?5/O9qDHYOECR25WH0GcfcWKJzBeWgiLnAdbZwFi+dKVY9iEtITO4RVeP1TUQ?=
 =?us-ascii?Q?/CxTnqAz/waMR0+ifLHrLvh/0J7MROgrZykJhSMUao4GmM08yfrz/T5CMOn1?=
 =?us-ascii?Q?jmS1lvTAFqdVfdl6Ok6UtVC2aHfFFrrqbHcntvU7hs4Nfa0C9pbXhQVg3XVf?=
 =?us-ascii?Q?3yPPXNW1osb2Fc/Zjm89WeVaEmpQMEzEwQYcKLXmbFgDbRQOqXvGZaf2fvPQ?=
 =?us-ascii?Q?DhKziB8UeQVO2zaghvty8yKVW3MMIbkPZcZ9We3+8MhM6kOw7ta2ZxlX5JOi?=
 =?us-ascii?Q?qLh23jTJ/tXM4Vqw3BgOpOIuvD95uDyMDO4L7DRRMVg7McJhI9UsdF9Mcoz1?=
 =?us-ascii?Q?Aj6M7ClOA86XCxSAVAmtoSuwYy0uF1LgCd4OH4VMd/R14zYsMqEdK65v2SS0?=
 =?us-ascii?Q?JI1xsfOSFBLmENTaDkDe53bmVSTxxaTS83RHAcb8Tntjp8TJDmGZRNDLK3C5?=
 =?us-ascii?Q?rQyHHEvsM+YFd5f07BPo9Le1e7xbCFDz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIeDtriik94uloQQDNeBz36Dx8edYoh4NiPpb0xOOIf5X1WW3F3a62w65+iv?=
 =?us-ascii?Q?WvasjISHKSNYORrkCJd6hWzP3a1uiprNMOlsfqvQy+4Oq5fKAuaiEt7HBgqV?=
 =?us-ascii?Q?pECp0zhAkiNWxwjivk5RPD4IYx8M9S9mi6ZtbpFEyOQzly2AGtW5GPFFHM/D?=
 =?us-ascii?Q?casBIhSzGsab7cKYWL71J5oDgnb2QN751UqSLfyh5pFOKXmQdONPKbc5dYwO?=
 =?us-ascii?Q?TfTApqxcyK8dM+VXfgwuEjqwZqWiXBpacOMX9pcERPSsoNztxiSmG+4Ugnmn?=
 =?us-ascii?Q?pqI+MXySPJZAl51m8pvfNN0ACtewv1qSb3w9fWIEfS2U+GNac8HRdHViVY2f?=
 =?us-ascii?Q?ZtXFloPnBK9kAZzVywTTCSNZNq8PnnNuPtL9cxNUkcJ2sJSby+5LUqjMI+ub?=
 =?us-ascii?Q?5f/ZOFMTKHgOXKW/7aOl0zBfRnLOMWZJQPSqjETjdBeCulnE+QK2D0kzKeh8?=
 =?us-ascii?Q?rcVnk+95o+XDYInVaMqCVgz9nuU3yOx+TTJLsUX2zW0uG9DJPfjSEmJY0hA4?=
 =?us-ascii?Q?XWK2ytwaDAmk0p5bbj43PRh1cNEjosmQVjNxYMHAryjEqAkkF5JCwa+DJkkA?=
 =?us-ascii?Q?eWM+jv24VGnrUKQDvIutNpG9++XaRfnpXso/Ryz1B8Klim5mvDVYGAwwBEkP?=
 =?us-ascii?Q?YW7EKgvUsnH25wMCq/wz2BwW0nMT/V18DCxLh6tbBb+svGOWe5Qsm4z6MX2Y?=
 =?us-ascii?Q?uZzZSLroofrKypd5JzMAMBpTV3wg4fQNh7Ec4Tv2SmEXCJpFN+NgVPRU/1lo?=
 =?us-ascii?Q?XV1iy5+yidBoKsQAz1WlSZT6FWy32Vp7ytkQJZUewl6DaSbKeam2tirScug6?=
 =?us-ascii?Q?dE5hmQhH9wwLQrSl8faXv6bwOvJUBLUdI6ZTinh6OIaWfdk6+Zg9SdicCAKh?=
 =?us-ascii?Q?n3qb3mXW3y0KurvuQV9nOgfDQzOElbPRvMPCSntUFCcdgUU7NoQ6oG7xMw8g?=
 =?us-ascii?Q?MEIQJfbQSGJwsS39v7Z0qcTyHBJuMwS9+i+rpZeyFYrSWQqnK6jq5B+nlfJT?=
 =?us-ascii?Q?WrS9vyfkovdUpfAzjsCUT1IhhBFGr6aRkSNwdZOgiLRXed+5FA/5yVAOK2uW?=
 =?us-ascii?Q?Jy6mTZM99ic0MwNfwTC8p0DyXjMDlsOr+OCm0qjkQHhwSCceMQ1CeNmO2JQ1?=
 =?us-ascii?Q?712WaF0dArP5eqog8VIG9zUZuDS02ZSZuMd8rlOk+aUUFsPgZsEvqzAVjaKP?=
 =?us-ascii?Q?f19y78TEBGgmXVgS78wtM5bjnaQgMnYAdGQROH0ouKFuqwexMnVNWfe5/lat?=
 =?us-ascii?Q?PZ8PhxE68B/X9/tAbLoOH3IIzD2tuLifQNexwVtElBuohDWPL8TCkfYX+szJ?=
 =?us-ascii?Q?zmQ8jLtSa+9Ki/z8oGWa4YodhMyEQanS5bRr/4BVUlE5XLYADpIlF/4f6q8J?=
 =?us-ascii?Q?AX1qgSaXKGeT40foBQaQxEwt7jTbPorannZckSbh0yuCV6icbdcS4UdOdidP?=
 =?us-ascii?Q?LIx3IklY/+fxbF9cnik1naK1pvaDnrBPcM1MukrGNu8um0uTcTrMqR4xoIUt?=
 =?us-ascii?Q?4jp/8qqOnSK8F6L60LnGMkoJOgn4Z4Dg0UFlSG9OuveHRIqIAvo66V6s35DM?=
 =?us-ascii?Q?Sx378ZW//yV+/xH09c1VRSnh7u5jTvCZeNNpIHjG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb98bcd2-ad19-47bf-3802-08de3cb9e16e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:43:38.5419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htFQePslMghmccQmogalMCbK224Een6pL5Io9l3fg/Hk96WYO1BVvT9GmoJMT9eqYqwvTW2HkiLJ4jZZX5/svQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

On Mon, Dec 15, 2025 at 01:00:21PM -0500, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Monday, December 15, 2025 9:30 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write optimization breaks
> > 
> > On Wed, Dec 10, 2025 at 05:44:13PM +0000, Jonathan Cavitt wrote:
> > > Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
> > > g2h_fence->done values to prevent the compiler from ignoring these
> > > necessary operations.
> > > 
> > > v2: (Matt Brost)
> > > - Add Fixes tags
> > > - Add comments
> > > 
> > > Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
> > > Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")
> > 
> > I really doubt that a 4 line patch is fixing 4 different patches...
> > I believe the important thing here is to identify the original patch
> > that introduced the wrong concept, not all individual patches that latest
> > touched that line...
> > 
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
> > >  drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
> > >  2 files changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 648f0f523abb..4ee628fe34b9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
> > >  {
> > >  	g2h_fence->cancel = true;
> > >  	g2h_fence->fail = true;
> > > -	g2h_fence->done = true;
> > > +
> > > +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> > > +	WRITE_ONCE(g2h_fence->done, true);
> 
> 
> The function g2h_fence_cancel was introduced in its entirety by
> 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
> and did not exist in any other form before then.
> 
> You could argue that setting g2h_fence->done this was had precedent
> from the initial Xe commit, but as this function did not exist before commit
> 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT"),
> it would be difficult to argue the change to this function fixes anything prior.
> 
> 
> > >  }
> > >  
> > >  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> > > @@ -527,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
> > >  	if (ct->g2h_outstanding)
> > >  		xe_pm_runtime_put(ct_to_xe(ct));
> > >  	ct->g2h_outstanding = 0;
> > > -	ct->state = state;
> > > +
> > > +	/*
> > > +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> > > +	 * xe_guc_ct_enabled.
> > > +	 */
> > > +	WRITE_ONCE(ct->state, state);
> 
> 
> The function guc_ct_change_state was introduced in commit
> dc75d03716fe ("drm/xe/guc: Add more GuC CT states").
> 
> This patch also introduced the ct->state flag, replacing the previous
> ct->enabled Boolean.  So, this concept did not exist before then.
> 
> 
> > >  
> > >  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> > >  		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
> > > @@ -1496,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  
> > >  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> > >  
> > > -	g2h_fence->done = true;
> > > +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> > > +	WRITE_ONCE(g2h_fence->done, true);
> 
> 
> This section of parse_g2h_response has been untouched since the initial
> Xe commit
> dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs").
> 
> 
> > >  	smp_mb();
> > >  
> > >  	wake_up_all(&ct->g2h_fence_wq);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 5599939f8fe1..8d318b094f33 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
> > >  
> > >  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
> > >  {
> > > -	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> > > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> > > +	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
> 
> 
> xe_guc_ct_initialized was added as a part of the patch
> 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure").
> 
> One could argue that this function was added with precedent
> set by the patch
> dc75d03716fe ("drm/xe/guc: Add more GuC CT states"),
> which also introduced the XE_GUC_CT_STATE_NOT_INITIALIZED
> flag.  However, as this function did not exist prior to
> 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure"),
> it would be difficult to argue that the change made to this function
> fixed any commits prior to its existence.
> 
> 
> > >  }
> > >  
> > >  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > >  {
> > > -	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> > > +	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
> 
> 
> The function xe_guc_ct_enabled was introduced in the patch
> dc75d03716fe ("drm/xe/guc: Add more GuC CT states").

All these explanation makes total sense. Thanks for that.
But now it is clear to me that it deserves 4 different commits.
Each line fixing one patch on separate patches.

> 
> -Jonathan Cavitt
> 
> 
> > >  }
> > >  
> > >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > > -- 
> > > 2.43.0
> > > 
> > 
