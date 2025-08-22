Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D8CA0EFA
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 02:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A8F10EA4A;
	Fri, 22 Aug 2025 02:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeA4pfOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF7E10EA4A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 02:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755829322; x=1787365322;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=axWmcmgvT00LV6QHepLrvdEi2YIhUIQ7LPxW+9BZOps=;
 b=XeA4pfOgB8a01LCsk1lSags6BFmpIu7juSa6nTIm/bBHL1FYrAfg6bDu
 RPw5OkpZWZdwAW5iQpot1kZ52oPNnbQU8DZXKfHCfJfIGvzbcPR/0qkO9
 mIBmU7s3vjlGWy6C3Amr+pyjbYfrYcsfDofAJZAkcFmmAQ3V7ucNsSS+E
 aY4/EklMYLfO+DX9CSquh/HqS7dk60aYcIMaOPFv+TQfnE1EACQtbCSa3
 zyqmTlJBCLo6tx4xZq19ZU+xVYKhS4W1E0KnKGWl+7q9xeLBoQQjlXTu7
 YZkljy6TefHzQJqv5QnsY2g1pY2fDE5u0xMXKXaSI72V3lgTedFj/zHDm A==;
X-CSE-ConnectionGUID: P6Uw+h54Tjiv+7f2cJXdpQ==
X-CSE-MsgGUID: i1i2TUU2QAaqz1ON2DfHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61966583"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61966583"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 19:22:01 -0700
X-CSE-ConnectionGUID: 4vVk5wKsQe+GZai1kjgV8g==
X-CSE-MsgGUID: k+I1xJEmSaaxh9hp52Tp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169391825"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 19:22:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 19:22:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 19:22:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 19:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVqOwRAU9poyEjiB4eDprsFn5iqtiL6/OrftJi7AXoIV38oFftDTnpKsQEDO4wYVUUGjhfPsWETLZAxZ5kDRFSd+AN+8SxxVnMhbgXk3Va7uGI7OQHngonA7Q+rhk3wLss4vHXEG79NiCypaK3GWIlXzlOhYPITsc9OIrhmZ7M8hlexKbMksR4pgPKt9z4uniEyIXETqp7uEoXLkP00LL9E2ngKwV+hd93os/2qws1gvg2BbJdp+R7rsTAbzNLamoWJDUU9tz/P+jyaZuQrEUIr+vZzofydoenXdZJmQmjQvwWcjxrKfw8chza7kBZI8H9ehWXvdSvUMMymaiaF2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIWAqCdtpd7jkIGsFDCmI0EDEW0Aw74YW0asA3kYrEE=;
 b=Ye0Ad/+6Urxk3Nip8g8imEZrs3KbFO3yNgQ9271lVTqnuteTgNTeCjqwvdsceyTZfh8tVtOyzoyTZj2ko9MKGsaRiu5gFvKUhDWMeYGtWmMvWec7WItpCxGuDErJIHdr9Ktw4irHtYrZXXjXpSDl8Le0eESzYNfgkSbcduXAUX2HM+h7wOSBtt4fenOvfREy30GW7s7t+Y3Y4H1R6Zle4fZAcMXQKlJrhthEXQZX2qjXAO2umRRwACFBzSZ/5zOwBjJfkdsXkM+v3vvPKf6GJIVeljH67VH13ZarWEjjHQ5DZKOd/JXVvd1vOwZ+LO4w9cKDfolCzOv/wXUHmppVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 02:21:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 02:21:56 +0000
Date: Thu, 21 Aug 2025 19:21:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Message-ID: <aKfUQvfrpv8kFAWz@lstrano-desk.jf.intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
 <20250820233057.83894-3-stuart.summers@intel.com>
 <aKeZ+JZ3j6hm1vR1@lstrano-desk.jf.intel.com>
 <ea0fcf8ee5cc8eb3f78836538e5fa9517a580077.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea0fcf8ee5cc8eb3f78836538e5fa9517a580077.camel@intel.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 61056189-6d2e-471d-b028-08dde122aa5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R+L84nZa+8obMqbbdDoB9Y8uYWlBQ6J1PTMOdI3yqVrzpgfh+T21bw5mWr?=
 =?iso-8859-1?Q?sn+lAbdqR6zA6B20OAFjYI0gheJB1GM2VYiCTt07vRKFfWeO1mYe51GrnJ?=
 =?iso-8859-1?Q?2NaspY8/JpN11Dsl72fxhuHx6PHhiOB40/3BGjRVD3Lh9GqHPIdj0g59cn?=
 =?iso-8859-1?Q?tHLm30MA9HUexdMV3eKN5nSG2IvhDv1lpOvPyswclx33F7SnYbpCRhDPxF?=
 =?iso-8859-1?Q?rQie7jKZKV6TOR6WEFJu27TWqROWMGizQZcqJ1Be+DiQBu6cKUCttsblDD?=
 =?iso-8859-1?Q?0HX9hn9vq/wOrHIrKMtRicrjm8LWxQfTqKhh7mvDaCKiiny1eCZGh9d54r?=
 =?iso-8859-1?Q?YqXV6OgnsC3Rn5aryXWzRYxD3X8y7qflLI+Kame1+HHygKl6VdAz8buBtZ?=
 =?iso-8859-1?Q?NB9m6ggSUPcneWF9XsR4495TeTcNdqILkaeXvqanUxPN/2DRRoUlSmNaGt?=
 =?iso-8859-1?Q?Nc6qJM6ikvV4z33TRlrtDyO5dbnUGiQHN+g2ZC6jIebdMBdN7TzcKtRhAs?=
 =?iso-8859-1?Q?brhOudqINEcZNbqvTfxirp/vUtRI3R2vPbcKXAztd4gFXJMBYEZzGLRXao?=
 =?iso-8859-1?Q?ljoa9GXsWmx5dKTypMwMH79njEQ8BQSgM6ow8VEfuHg3JPBlOklYriwglE?=
 =?iso-8859-1?Q?tzIb0ahV8GRKJO5WQCSgV5ut1hYS2LjIq9H9L2Cvz+8BnCK0LPH9PCGMdw?=
 =?iso-8859-1?Q?vQQdGoC+56mgsMmlJpAssE+gS6MQhlWIAR+yrNU6NdHJZoShG9G0RXVZIK?=
 =?iso-8859-1?Q?ul4ZuHmdKZ7zGoyy16vEF9owAsx+fQooqMlXPv4M7ajqJnETE9Q8VYDWlG?=
 =?iso-8859-1?Q?NbHA48aVn9NMpDkamo1vTxXZnsc2iBB3KT3RD3dcD0ITwXReaXYGmFL7jT?=
 =?iso-8859-1?Q?iQC7kfeqvKP/5IRJSMfE4mVMDyc9b1DGbVbWUykHiGDLUv2toFYWKt6r1i?=
 =?iso-8859-1?Q?QqbbLnI/0U5+CRFsnTAmCh4KZ2P97mBaWY9BjiI08mkGWurHpgS9SGuZzF?=
 =?iso-8859-1?Q?uRImqUULkCdATm3bsAThNsPQ17EBTtP6bDyDz5RdQOUEiV+AEYMjZnaQvz?=
 =?iso-8859-1?Q?S9xS6HdRE2iNsLUMI64kLj4iwrvgoV2sE4Bx7Yeq7ino/7rNLvFujvt1MB?=
 =?iso-8859-1?Q?QKJpaR8Be7TtoDmPPalWd0+EK9M855yq6bKfH3vTI92yx7Ru9KDrmyyx1S?=
 =?iso-8859-1?Q?voFsmWkWsajk5m22/HHbYPvqOmWEc7gfPtv2p14HypOaIZXEmEErXbqZSL?=
 =?iso-8859-1?Q?63qMvPY8ioSTwo4eD+kmgITn753fi1D3i3vz5rStcqTZHwqzqfzAwQ7owA?=
 =?iso-8859-1?Q?haWpmPbThQES4QIMTrjBJaBB077S+IRrT/paGj00WHvJJzV+1Cp3fJixNd?=
 =?iso-8859-1?Q?RhD00I4ggmK85pSpb/7vYq8iaQx/dFOHjEto0bmiqQhdqp2iPVBuYQBuB7?=
 =?iso-8859-1?Q?bg4N6kJrbrpNPOKqAyr4pjBh37CLuvCN79Ps/+ruSqdIC3X4YNMIFgHa5f?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8ZmhEEVRWQoNr4/idXQt1ku7wXAxyBxoxE+Tz5aU8o2gJiuYy3xFTLhcoc?=
 =?iso-8859-1?Q?D7HqibTy4Ra2C+sB/zS6ZTIGHBgz+q54u47ArrVW+1dttH1ianU8se+tjh?=
 =?iso-8859-1?Q?F3w2pP3G5JfA+ZqIPMRHyiug/ibfDKqpIfCKP3m0mSHvFqUVW4rlp8COIO?=
 =?iso-8859-1?Q?MAgvEIBbUE8T9oWGT59xZIuqzX3X9BW00rkMWCyx0GPbLdDel1egtPkZN8?=
 =?iso-8859-1?Q?Ik1tuoGI3n+Pxn/mJyl01jxIalNA7dZyxJr74I0iQraUX61WCOgvkImqTB?=
 =?iso-8859-1?Q?pED5QjPbYfQM52R69uO3/GoEGLdjXkC9Im956+/8vNFx6sq+2fC9V/YcC1?=
 =?iso-8859-1?Q?5mP2nIqDf7TPxXLVZjvlSzqLgIgt+k/uNKS6tYwHiByYp01b/3TOZErAo1?=
 =?iso-8859-1?Q?GSZqaSk28vpELPbs+1acw8A8XPubdctesOQpkbZyEBz4SLWg8KDMlFTZEZ?=
 =?iso-8859-1?Q?KzFVjtiGDqvwRyDFwq9UwRXgI7A1asZxlA4Zmoyr/YTR+JFNmVhKKCB2gH?=
 =?iso-8859-1?Q?zIlt7CHU6tKdwbAAhSSRpz242KbrmGlsTcALbsofYyRttNkRiKNWL7M0QZ?=
 =?iso-8859-1?Q?i/lO2mVwNE3W2TZNnsv+cF9W/UR8rt+OQAQnEfMADSv8JJsGeq6Es3fzpT?=
 =?iso-8859-1?Q?wS5wED7S8ANb0VTlleNzG9dJE3l3/tgTIcA1AvNHLfN3He22wPjSwxw3mU?=
 =?iso-8859-1?Q?em7lCFY0pn5OMUqQJlDjxdl1vi3HBl9gYFV8uLByA3n63Xdy9N4DLxLovR?=
 =?iso-8859-1?Q?3ubA3AC8rQ1uzNLQq3M0lTaA1wwooEtnkAu69d3bLf/Rz3M+bH0WkL8jKS?=
 =?iso-8859-1?Q?6OzSxLnNJR2GYmtN5hxglVaHyZwbgQcWL1z5M8u5yJbzccOmEZghRHtfPu?=
 =?iso-8859-1?Q?8GtgPlU7/lTmtvdHe32jpJ9ioZHOyD2VIfaPEWWj9/IxN63jRJjjM8An82?=
 =?iso-8859-1?Q?sOMvBKl1Zl6UC4d6oytdVQVGHP2rAWK2o55MhRYH+XnLPMHjbkIUgeiA8W?=
 =?iso-8859-1?Q?+HrikhG23Esq5VQnTcgUIyj+wj0ANidjNeB2nc81sPGQyCGHsh7k6HmtCb?=
 =?iso-8859-1?Q?N7OkJU+cEO2cRgh+RdEMN9PYTvqhXn8q5Nkdn+0TZznw4UNZh/qL4TNZBt?=
 =?iso-8859-1?Q?TLpNo7vctyd7qhaAi1YMPiygULERcJhDmHcc+Drqq9aCrGsDlIdaeF3Uah?=
 =?iso-8859-1?Q?zJ4/h7pUOQZGzDndwOcD+gOB9IQOi9bnPuDqfbDitC0e3ZbyO6JjeLhio4?=
 =?iso-8859-1?Q?ADES5GdBzDlKmnOOOUzgt4iljxT3KcO44Wz2osvtfTD3FEHFhSlCems3Og?=
 =?iso-8859-1?Q?rwSW1IxB/4z+Bvn93DSQAewsyUK2hgGObsM7K+o6kxAHTBM/UWau/PXrKW?=
 =?iso-8859-1?Q?bFnd+H5NmtyctRXG3RsW1S2zAvqWQE/kFjdBfraGREREGT+YH2CQJBtAg5?=
 =?iso-8859-1?Q?imiBcms5fAkwrITfADb4jqQdLS8I04ec7b1rAQACpctYSq+QMTS8UCqLlR?=
 =?iso-8859-1?Q?Mb6ZIRHnY30WH6fM5ddYIMN7XthA15DE3UgzvfJ32P85SNDyClWZjK4LXW?=
 =?iso-8859-1?Q?M6/wi4rb6EX1dnzBFEgKJkX5ocgrCVspT7LXRUyFRGipOdncEjpDh3NikH?=
 =?iso-8859-1?Q?meOolpm9Aatkewnqa31kWDj/Zp42klX7zgtYydpTIld2yVBeoQ33SwqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61056189-6d2e-471d-b028-08dde122aa5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:21:56.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZK6vT9inzsLSLLKUdTARobFzJLPZO5AbCrv88hmzDzeVLSg8rRpFCuQxQU9/R1NDIm4XtYQz1MEmxI44D/1BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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

On Thu, Aug 21, 2025 at 05:34:53PM -0600, Summers, Stuart wrote:
> On Thu, 2025-08-21 at 15:13 -0700, Matthew Brost wrote:
> > On Wed, Aug 20, 2025 at 11:30:50PM +0000, Stuart Summers wrote:
> > > There is a small window of time during the driver teardown where
> > > the TLB invalidation fence->gt is set to NULL but an invalidation
> > > worker is still alive. This won't cause an issue currently because
> > > the tlb_invalidation structure itself is still present. However as
> > > part of a future refactor, we are looking to split that structure
> > > out. To be safe, go ahead and cancel any outstanding TLB
> > > invalidation
> > > fence worker thread on _fini() since at that time we are already
> > > tearing down the driverworker thread on _fini() since at that time
> > > we
> > > are already tearing down the driver and don't need to continue
> > > monitoring this.
> > > 
> > > Add a new _fini() routine on the GT TLB invalidation
> > > side to handle this worker cleanup on driver teardown.
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c                  |  2 ++
> > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 21
> > > +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
> > >  3 files changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > b/drivers/gpu/drm/xe/xe_gt.c
> > > index a3397f04abcc..bbf3f4da7f54 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -69,6 +69,8 @@ static void gt_fini(struct drm_device *drm, void
> > > *arg)
> > >  {
> > >         struct xe_gt *gt = arg;
> > >  
> > > +       xe_gt_tlb_invalidation_fini(gt);
> > > +
> > >         destroy_workqueue(gt->ordered_wq);
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index 75854b963d66..170f6c97268f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -188,6 +188,27 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt
> > > *gt)
> > >         mutex_unlock(&gt->tlb_invalidation.seqno_lock);
> > >  }
> > >  
> > > +/**
> > > + *
> > > + * xe_gt_tlb_invalidation_fini - Clean up GT TLB invalidation
> > > state
> > > + *
> > > + * Cancel pending fence workers and clean up any additional
> > > + * GT TLB invalidation state.
> > > + */
> > > +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt)
> > > +{
> > > +       /*
> > > +        * At this point, we expect any outstanding TLB
> > > transactions
> > > +        * to still signal through the normal channels of
> > > interrupts
> > > +        * or MMIO polling updates, etc. There could be some
> > > workers
> > > +        * triggered as a result of timeouts in those channels,
> > > though,
> > > +        * that we want to make sure get cleaned up during an
> > > unbind.
> > > +        * So here, cancel the delayed work, but let the normal
> > > fence
> > > +        * signaling handle the rest.
> > > +        */
> > 
> > You should assert this is true then, e.g., the pending list is empty.
> 
> The problem is this seems a little racey. I don't think we can

Hmm, I wouldn't think racing here would be possible. Trying to reason
how that would be possible and can't think of a scenario.

> guarantee that the responses are back from GuC by the time we hit this
> _fini() routine.
> 

If this truly is racy, we cannot risk fences not signaling as that could
lead to very bad things (e.g., reclaim waiting a on fence which never
signals). I think we will need to walk all pending fences and signal
these.

> > 
> > I haven't checked but later in the series when we move this to an
> > embedded struct, is the fini owned by tlb_inval layer (i.e., it has
> > its
> > own drmm or devm fini handler)? That would be a better placement IMO.
> 
> Oh sorry I should have been more clear in the cover letter. Yes I am
> doing that, but I thought it best to fix this independently first. At
> the time this series starts, we don't have a good place to inject a new
> drmm fini handler. I modify this path later in this series to do
> exactly that (remove the call from gt_fini() and add it to a new
> tlb_fini() that gets called via the drm layer).
>

+1

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > +       cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
> > > +}
> > > +
> > >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int
> > > seqno)
> > >  {
> > >         int seqno_recv = READ_ONCE(gt-
> > > >tlb_invalidation.seqno_recv);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > index f7f0f2eaf4b5..3e4cff3922d6 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > @@ -16,6 +16,7 @@ struct xe_vm;
> > >  struct xe_vma;
> > >  
> > >  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> > > +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt);
> > >  
> > >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> > >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> > > -- 
> > > 2.34.1
> > > 
> 
