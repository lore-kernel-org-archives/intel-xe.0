Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82614C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 21:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B6D10E165;
	Fri, 18 Sep 2026 21:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcZVIqy9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9030A10E165
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789766667; x=1821302667;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4R9x/hlxd30MgG3QdNpVqX5S5AOka57AqINn6PzY80M=;
 b=hcZVIqy9MIxCEfZ78GKRK+7g4A3IxJkgr1Hg/DOg9YikCC8v2/iIUFad
 9p1i/Arz/u7EVn090FxtDbQWwBLruawxmWLX4zFHNGS7UJsJ/2KOsUwmL
 tlxqxEiaXjxBtnE9GjH3ffpOC4zL/oNwD+1w0Pd74H2TueVRmA603lfzD
 vmCOYPG+FP+8RdzJM7u0MnZzC6YpvKUTTfsv42wesnQ71NCNv963q0xJP
 j9pWy+rA9iskB65KogRfAm/dkPot6Es7ygYCqD9RrQiJLrVh71K01LT5j
 2cE9UVHHJN5U4mE24iiQA7GcByUr4yxNbBXnx87Hs2HKk61i3e92aUXZl A==;
X-CSE-ConnectionGUID: 0nxqvK9lRu6jom21ju22CQ==
X-CSE-MsgGUID: DZUcNnHYQ1ajQHPiw9LnRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101649877"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="101649877"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 14:24:26 -0700
X-CSE-ConnectionGUID: y3TQmtWNS4WY4TLG9TSUSQ==
X-CSE-MsgGUID: 3hx4kndvSomP8Rq8Z4pSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="276549690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 14:24:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:24:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 14:24:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCsD4Srt3YGT7waA1vmm7zAwx8UMQzfU4EicE1qDJAsHkAkyzE7Jg/3ojb0rUKAr9rAMXnL3phAfW+4TiF0ZmIP1UA98/NqhPUTqAx2J272J9eZhn2G3WQh5zY0pKnapHDYv3JtgvqRBmJNAW2e/32k57P2pVoBHNMCEDovqOptOuopiKe4yyqRTgvAgD8H9QQ8vI7xTMdRLMMI8a/HZWBsfwCs+CMrGnJIhrCOtpo9n89dG9Rwnrlxzqt1m7K3ks3zdTq9V4vRf81dUTDzb59V/F18xp3iY/qTspkFDlkbyWg0agJXmzSE36ENNMih2ME6y+hPX7l0CsPVGzzwK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a13MleLJuo/JwsEqZgrACX+Y78i1XrUO3vZq+fs4sqU=;
 b=d4HiwKYqybLncZXPTx4MnLT6O6QLmsnze21j26zy04O11s1jKygg1qCvFDWKkXk4XyY86J0+rklt9lvTeWJS2Nh2bAxTEhmJG3X0x+IlJnaNlOIuaG1Ne4KsjK3FyYxvgGqGLT9JB8eYlyVaHM4HzM3GbpCaZyeTDSoVatw5yqDSzN80IUKNAPjR+6KhMfoAOeAu4rHOQqFT5Igf0cHCnxYd9c9gW4VsgdkkeQf/CZNITdilOlYp+ZaZPl0X7c6WBzxMxyPualSP7EqVQAkDp4EYsf9TxzvkF6yq0vD4qc5ycEyJ7+wCn11rp1XkgYWgWsWvKCb8B4AaFUDJAcWp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:24:13 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:24:13 +0000
Date: Fri, 18 Sep 2026 14:24:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 2/4] drm/gpusvm: Add devmem callback to get_pages
Message-ID: <aq2r+zCMr6llqF1J@gsse-cloud1.jf.intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-8-himal.prasad.ghimiray@intel.com>
 <20260916113638.C7C791F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916113638.C7C791F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA4PR11MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f451f53-542b-430c-d78a-08df15cb2fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|18002099003|22082099003|6133799003|10067099003|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 4rfXVNIpRsRoehC38jL5jFgNqTfrJSQNlLucO7xuRxU1laW3nKRKUpimbt1U0KybULY7HO11c0C11d8/yyDzlffotBG8Ynsp/zFzPJsfPR+0xAtLhfaVJXnVHqqeifkXN85vGzSAgQZyJ2mEEECknxSu9Ew3HBmg2Qk7Dflok6RukrC7ooTEWlGO+oGOKrJAWVndVxucRlgvwF0Xh/3/Fj4xaYcfOChanKzzjkR28651910Go9OTrj3SnYPzxmisR6wk6R8ZXl4PESIYIY3Mp0qz+nPmAYShsvQLudh2LNmuNUkmQaTEGXBPnk1MxYYqnDhyTtIrBOzBVU0Eitnz92kx6QlzNharfI3BA3RsnX5pVSLL+E/IrBQQRbPIrFKQ1CDMS7mJ9gW8gs7GBtEI2VOHD6LkaU351wrK/Ap2pMG58bjKvWah7kI19e9h9tuBOQzqsgbjdS8k35I21WOQ282PakX2pv1JcplxHr+4Zf6twNcFWjmhyG4NUbwsuLSkPfMddsHJgyB6fDeCUJq/rLYgADH8asIeQyCpqpV5j4haHNULoiWYFQzE+x8pLK3q8B+ojs/tchS+uvx/xVlyZ+PmGnn9v8uFTMpoHbk3nUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(18002099003)(22082099003)(6133799003)(10067099003)(5023799004)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jXUFCWEkyxwi9749FR8yW7cAt7aCI3+TfA+FGz59Hg03z8DZqQXH66sruY?=
 =?iso-8859-1?Q?Mh9d0E2Sgnp5sDyQiYe0MfW8fXRrUYKf8zCCZP/KiiLb2uGhXhxfLbZHIW?=
 =?iso-8859-1?Q?+1XGYOwSbIrioy8COAQiChqoxjcOr+89uvzdPyWUoRM9K2lXXISLovAN+R?=
 =?iso-8859-1?Q?FrFcVJT0zIlE2cIu//orrLnxpMR53OOntPF5ERxYJwGZVsvR8QBaAFDiZ4?=
 =?iso-8859-1?Q?7C+w+6SEyViBp9GWFOjaATXd7y0olLrbcNUzjS5eTxTVMIHZPqeoWLinhU?=
 =?iso-8859-1?Q?pacifmR6ThMblmdvOKW8kHm7FvxAWf1NIe/88sAWZT4cuDCeQvdyy+hJqr?=
 =?iso-8859-1?Q?r3aZNKkTF2D3owQKRcqVyynXuCqcnduvHQcY/OG+GaG6Dvnzngke7XpmqH?=
 =?iso-8859-1?Q?z59eEvRzl3olC7Rd045uLcuqOaPEPPU6Q/AjSwbr0mKtnPfBZE/9qYbKfV?=
 =?iso-8859-1?Q?ZMQ7mwBkCIWFUEerPojhIlpY2c1nPKWY44KMnG0yuo8c70jI7/+5sB6M3T?=
 =?iso-8859-1?Q?l+1DFEv0lhrJzsdRo9xCAXFziXvVJzSbm2m3VF21ejzf9j/wogX4oYJLUz?=
 =?iso-8859-1?Q?uZKp1CT1Wy+dztc0R58rFHROhFPXhecl9yu16ny4TA+auk8GdmI7koKtwy?=
 =?iso-8859-1?Q?h/2ot1nNDQWjr2ORD246LyEy5s1zHhGDzGRSiMsNoreSRt7Lf9vYyQzCo3?=
 =?iso-8859-1?Q?yZL535Eem+g6h7Mtu3aHMtwu0G/G12OkOlAdZpu1a7uRINu2JNGuoo+Sva?=
 =?iso-8859-1?Q?YE91gDXfciZkEumMA5xrPcXQVRccs1bKyMGv9nsJnKts81oHO0IycAkXke?=
 =?iso-8859-1?Q?6S2AGU62dRUJ+0x8flPqZ7L9650m+xWc4nF0ivE/31TuLr0iVTFqkE3htK?=
 =?iso-8859-1?Q?1FCvgEb+mrmmNg8+9l0o2jJWoe0/db4dn6BUGtDZC0TpC9DKmnPOIbwt3U?=
 =?iso-8859-1?Q?cJDlaiUnbSIAHPMzpvkcyoXF0NG4Fl2pe43akPK26Q5EQHx3yOzH/EyRB+?=
 =?iso-8859-1?Q?Ejv12rLQiWimMZ2ACbUzoPhG1Xop2gGL9G2XlXbZvcOzd9KsSdzp6eE14b?=
 =?iso-8859-1?Q?BRwpMI150e9drsy5UWmLRfKzhqlSKKf6T3Y+0AQgcTrBN05ZPAWUPp6oKq?=
 =?iso-8859-1?Q?crzrM4gx0Y7IQxPQ4IPUA/f+KuqFV2folegsLpP8heCn/RfwBR5HKBJugB?=
 =?iso-8859-1?Q?LwyiyRNc6zLKA0BkIgPrZATWY67MAuB9L5I//i6jPhCqDv+jrKLiHfUbQg?=
 =?iso-8859-1?Q?KqSkXFGLkJ/327ihnaL3u2r9hf+hVZoMkbhFtPoLjDTyZP3LfE9E0HfC6E?=
 =?iso-8859-1?Q?7r0jlPGT1LgjqZ++8cvCGidx4vRFSFpDIf/FLuV7oDgIHsaZFkMKk6QZ8n?=
 =?iso-8859-1?Q?J6grd2q8gDC5JAUyIb7OCdx4Lnsl3ztqmctYrCo0/DDBSF55lEWpC+bHKR?=
 =?iso-8859-1?Q?MHB2+NpQUjw/8wePAIteRH2jfukCeScWSGx616usVaOzU7eT5nmBovt1WR?=
 =?iso-8859-1?Q?bvY31+O5JTq7bxSP8sNhlu3/E9OY5bLLnLqYHsHiBBIQx6oX8NMH0vI3Q3?=
 =?iso-8859-1?Q?zW7CsN1NXNnjQ1HXVJ2P+hGGSfe3wvNi7tC99xmcAlFbBZq0rIQnUlQeif?=
 =?iso-8859-1?Q?ZEAgOsYPEHwQ6NlsGA8cD3p0NkWjWezMcahfTN8dFiNGl1mCS+SgWUShvw?=
 =?iso-8859-1?Q?0+y6gcXR47+zc4vd8bZOnWYPk961vFstXDnXdlXrHlkO490Tu4q9dqP7G2?=
 =?iso-8859-1?Q?w9DkUq0AFxZ4rGtRXRI9bSc6vWkFHMRle/rXzRU8l62KWiJ9tkoxcsnFw5?=
 =?iso-8859-1?Q?sFWB71C3rw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 125+Qekh5QkZsZK8GncjiUHMfQaWPzu8Vuo9/ThC/WR8+rQu5EVeeHvKK2FJrGkzLDMv9avJNMZs5pLDw1gNUZSoWU5czx2zjHlC263ZhezEgL6JqDdRFRd8Zmbap2u8RqpwcHRDkI49KN/VQ1vduXTuMrF1Wv4pjVtNOagc7JHzBHJXryYVmMZLbdzlTq/mvt4gWHCaH2TTE5bmZ5wNW3CGQP6gXUpnJ+0gXSZrmGzaZSrhuzrtWAP0otFUXUwMtXPofm41DKBzmr43Dw1NhEk9KsD80x4CljmVjmReYjuYyU7ELPhAzwW8HuvB/JWBdcEdMc07sl1gyMhay8w5dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f451f53-542b-430c-d78a-08df15cb2fcc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:24:13.6827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdXjyNhEK27fGgRzE5DFQ2HtklYuT1jDJ8QrdrRP2v6ct6aRN7WCRoqrJ/xjGBCYgqoqyZhgXgBWpUyzXuIWpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
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

On Wed, Sep 16, 2026 at 11:36:38AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/gpusvm: Type confusion and memory corruption on foreign device coherent pages
> - [Low] drm/gpusvm: Non-contiguous device memory runs merged when separated by system pages
> --
> 
> commit 26edb821373f785b22418001719e2435aed329fe
> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> drm/gpusvm: Add devmem callback to get_pages
> 
> This patch adds an optional drm_gpusvm_ctx.devmem_fn callback to get_pages.
> The callback is invoked for each contiguous run of pages backed by the same
> device-memory allocation when processing faulted pages under the notifier
> lock.
> 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index b6c9d3a07dc81..6cec70d6f1859 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> [ ... ]
> > +static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
> > +				   unsigned long *pfns,
> > +				   unsigned long npages,
> > +				   const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct drm_pagemap_devmem *last = NULL;
> > +	unsigned int order = 0;
> > +	unsigned long i;
> > +
> > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > +
> > +	for (i = 0; i < npages; i += 1 << order) {
> > +		struct page *page = hmm_pfn_to_page(pfns[i]);
> > +		struct drm_pagemap_devmem *devmem;
> > +
> > +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> > +
> > +		if (!is_device_private_page(page) &&
> > +		    !is_device_coherent_page(page))
> > +			continue;
> 
> [Severity: Low]
> Does this continue statement incorrectly skip resetting the 'last' tracking
> pointer for system pages?
> 
> If a virtual memory range contains a device memory run, followed by system
> memory, and then the same device memory run again, 'last' will retain its
> previous value during the system memory iteration. When the second run of
> device memory is reached, the subsequent 'devmem == last' check will
> evaluate to true, incorrectly skipping the callback for the second run and
> violating the API contract that non-contiguous allocations are reported more
> than once.
> 

I'm not sure what semantics we want here but per kernel doc last should
get reset to NULL on the continue. In practice likely doesn't matter
though but I guess let's adhere to the kernel doc.

> > +
> > +		devmem = drm_pagemap_page_to_devmem(page);
> 
> [Severity: High]
> Can this cause type confusion and memory corruption if the page is a foreign
> device coherent page?
> 
> HMM's hmm_range_fault() does not filter device coherent pages by
> dev_private_owner, so an unprivileged user mapping a device coherent page
> from a foreign driver (e.g., AMDGPU) will pass the
> is_device_coherent_page(page) check above.
> 
> The call to drm_pagemap_page_to_devmem(page) will then blindly cast the
> foreign driver's zone_device_data to a struct drm_pagemap_zdd * and
> dereference it, leading to invalid memory access.

This is probably right for coherent but likely out of scope for this
patch as all GPUSVM is broken here.

I tried to fix this here [1] but Thomas didn't like what I came up with.

Let's maybe throw this one on the backlog of known issues that should be
cleaned up.

Matt

[1] https://patchwork.freedesktop.org/patch/717215/?series=164587&rev=1

> 
> > +		if (devmem == last)
> > +			continue;
> > +
> > +		last = devmem;
> > +		ctx->devmem_fn(devmem);
> > +	}
> > +}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=2
