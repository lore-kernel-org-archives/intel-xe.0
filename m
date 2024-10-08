Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594DFCEFC35
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251E010E1BA;
	Tue,  8 Oct 2024 17:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bS4xdK5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2257D10E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728408329; x=1759944329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oR+C3D9fQ1fDlwKRjG7JQwyA5nU1jysuQS0jIhQitAc=;
 b=bS4xdK5C4gsrHNKGDrecdjgM2BZrgPAEH7Z1V4MNf09jrX04laW9B28g
 HGjT0RBSNrUSXPxTZTYl08aPi4IK+/a78rXMmDmAOUSUqYoEYzk9G93dt
 7JXbjR+0P/lPwkgBAJZVO8ZcLUVuc25EAMxLGaN6hnESrEylCbpBPOWzl
 s5GQ1uQA4Ql55R+dQXadk1REqipkQz6nF2YihJhJgx1Dk8NoCzPRy62WM
 yfwd1s7M114+PJJc2HPkgqI0rAKQJcXmVtFDVCTUEwgGRXTvi4GOaPpvA
 ISQGAWMiqQ57WyFnyaxdIUyYioA2fDWbgd7cElXq+rOxZtwvACscNfp2X g==;
X-CSE-ConnectionGUID: /iCSIPz8QAaSTPqg1/fa7Q==
X-CSE-MsgGUID: rVuwjvrfRtWLlp2gH9rcfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38283994"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38283994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:25:29 -0700
X-CSE-ConnectionGUID: 95VQ4Yv4Tg+zIWwDGMv+2g==
X-CSE-MsgGUID: 2wVP4DdBQiWr8V0dm4fIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="106741749"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:25:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:25:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:25:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:25:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xj1w2ivW4O508aGLTn4jRF2QV607r0NdYKUnUMHre/DaANhu351lqeAe8cxTS6DOsHAY8G/3H7EbyRBl/vgGM8y4IQEh67zQTLWFB87nrxh7kIIY2U1/Op+scFy857+Q40qIKZfkEKUj6RMuXacyMTEjvrFp9rDLBhMcAyHfgfBJVblT7o0s3f/vY8j+6lWpAfYz8D99JNY6srKAHttFM/vjopRIiQnhruUmeADEOUI3XV7zNAPGdoK05GOYqawmbqZJXvlQYvwEx1Eo4IYlF/+FLhshDE3ZG0iQER/7IInHaJW2HWpC6tXdyd89+S1YRKUz/u5hieBKPM1+dQ+mNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPqVNqU4vsqocEBE75DgQkeZqaWngjXxJQw6RXBOm30=;
 b=yKFjDmXIqopLfE8hgPPP0y20WVgh25hfLaOXxZlGQPXf2ySU7Fm9TMvctz576JEls9S5vYeKRCb48s8QIKnNozKKM440N6A+BUELwnYW+x4BjllQ/kLSvjnczpxExo0Y1nKpdnSa6F/Fm6xIsOZPPPQ/vOaAvha/ppgd0ojvJM3XNt960CwlMvb+poGNx0ACGZH3riUOHVimoKNTYTx/R52nubXuhngvHYGs62jGfJCvIPaTIlD2Ns2IfcT6TgMKeQUIok3T10dCp6Iyuw1f/H1Y4gWEN01APtzKtawFHVzx6sXOV/jZ+AH0BvrRtkI2dD5uyB3YMlSQCZpu6XPd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:24:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 17:24:42 +0000
Date: Tue, 8 Oct 2024 17:24:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 445487f9-a6b6-4f31-4736-08dce7be189c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0njPz9TMcsixQPLLlGI2jPGuKRw9YQwwM3lis2RLnLc6Mc24FFxNNQclTViB?=
 =?us-ascii?Q?o9bgnLHSmlMXOZewz4E4DKMDY1xpzjwPz68zrs1BRKjfeKQb2LCxHn3pQwYa?=
 =?us-ascii?Q?akMfv2X+/IMAbakYqcx8p+PhLtC5uysPN0vVDCOUSAVPx5vLq/YE3uNjuPIb?=
 =?us-ascii?Q?u6CLCqkR3eBLptQvMGTy7zfj4zswaVp2+KWhUfNuWPkFE1oLnEfzrslWfzN2?=
 =?us-ascii?Q?XJnNEfC8GxJ0CFqjb0oh5AvpI9kZQA681LWrsCgnvnAR+aL3a2j1sYlOeRe+?=
 =?us-ascii?Q?orEQdmL7mLvn1H0KbcPPEWHkFhBQU59RkDTmCodm2aptXWQj1TRHB9JXhMq8?=
 =?us-ascii?Q?oHSqs2OFzDcv3lBlRnpdVeJ9H7z66cRFZhEjQV59c8/4jSDowlmVARhsshlt?=
 =?us-ascii?Q?bY4AWFT3wPuhUEiJwwDtHq4OZhsNygsg5UDbplWr2KBt31BKQWwhR5g3WP+v?=
 =?us-ascii?Q?looPmzR8hzH2f61hrhXWDgZfziq9mDogYkVNW2NO15AAkBQIak6ixDdthwN9?=
 =?us-ascii?Q?U6qOGa6odgb5om2jUBYPX8DsvYI2/rrChR/EyntXMqYck6SQmPR+uCfLEmPv?=
 =?us-ascii?Q?YtDH2P8nIUn2TiY5E+XuAFbONy4O79bFUUQgx0Z6Ioh5zXgH/3nRg03lkzMU?=
 =?us-ascii?Q?6Hnkhn2OZaupUmQ5o8WrLm+6rZht9KMVM9xMszOZlhPA/illlkdknWLW1QWU?=
 =?us-ascii?Q?Xj+tKzLuoZYJuZxfsIdYlHait4KF/IB0WcMGrCxJIWBDzfZzhTaBEH57amqw?=
 =?us-ascii?Q?UQ2u6BSAFA0NeuQRe0Q6TnvemRe0Iu65bU+/+xxEZSev4p3x2sQJLfiXepzF?=
 =?us-ascii?Q?SKUfcXNBTk88VEFcJYbcQPnL0uYAW/AXkzmFzVJmxynDiNPseX6mb80cK5Ac?=
 =?us-ascii?Q?35upYF8w6d1qKutS/ti9wpXgkHBmSkP0x0qL1cf9p+x0si42cI1jmheadmf8?=
 =?us-ascii?Q?UfgqgHhgQ9oZrqQgqdbM3LEj6qF5LfS8s3vj0fn9vIN++Yt71CL1wjIqK0+G?=
 =?us-ascii?Q?jNUFiZIIxHPJezzqXoO/tyIat8X++293OVuSaqpNYtRo+pd+wxPjsNAzoes+?=
 =?us-ascii?Q?bhdDdTM23Da2P2bR//wfBOr/ZJaMoDoa1Gii9aMkOWRq506oyx3uP2nFKOLM?=
 =?us-ascii?Q?9BXE+80YxpwSpgX3A2n2kuofG65kDjibV0R5Wyn7D91vSwGNWYR1K2sEW0o0?=
 =?us-ascii?Q?Yubu56jVNO/T/X+ZEj0z28gLUFqvwhhaVwRbGMVny2iFKeDlnnLC4M/fyqlv?=
 =?us-ascii?Q?UXX4KsSdCJhK/MwdiRg+LDn623FiLDSt+GP3ZASCRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZAPBaKaJabsF+98yWunR7s2/gBLxVI2IwN27XHtxEOchqUHoq96kCN/ZMvT8?=
 =?us-ascii?Q?3A7cXJV65mA4Fu0J9wChjF0S3SHecDh50mRY9wc7TnnRYxsd1edQZxegRVYn?=
 =?us-ascii?Q?62yxz2yrB64Fi8NzIb6PRfTtisjJThH/Ixll2WG26Un9jDbx0gcUB4KE3nog?=
 =?us-ascii?Q?Ou2x3nnYfnYrQEW2aKq+WhsgABvR9m9DnIJpCGmb++5cgFuVoeCM8BPyeKUX?=
 =?us-ascii?Q?8Xi/SJx7uv/VKoz1J4pdS/cpJ8KypWhTnRWGNAJjgPoXHYpx6r89732bQHqJ?=
 =?us-ascii?Q?vVDsb14ipqp5WoCX9d1BEWLYqRRi9F9mGcjSFrmfdvBvyxcn3sVuqc1qPg7b?=
 =?us-ascii?Q?SckijmjnCIosY7JtJkZfJepE+i4TuLDkOuuLHytctyaekm1rpryVYdJ1hDsd?=
 =?us-ascii?Q?koVVC16nYR/H2CSxOLichlDaWtUR/C2Pa5v16lZKVCOBtn/KIvc+4yth1Z+k?=
 =?us-ascii?Q?VH/gQfJCmZIBjV9iX/TCClq7n6AmT8kxdXSVzg73Pe7HR+z6fAJ9+/SrlGXL?=
 =?us-ascii?Q?AWyxIA8oUYJA7G4prXQWmPOAQ15wdFFuBTShWj9+UXaz+go5AdWHis7X1oRs?=
 =?us-ascii?Q?qoJzeDESbrp26SXan/HUQ/P6TwBUFYO2op4j+JrPhe2USn4avaODL9EQji+T?=
 =?us-ascii?Q?KJQzlUcQJ+Rf0Oflhw0ohVOyKKp6VS5sWS3KCnkJIzpKfmhNtxE/MsjX3ea3?=
 =?us-ascii?Q?qJziODhb1UB1YirhbbziNQxF/4fyJt6MmhtQHXY63hKIqkSWIa/J5M24os0R?=
 =?us-ascii?Q?RVxXSEQSBehrgMAMBzyAN9B84Jf6rHkTgeMRlozfSGuo7EOEsJMj0S/MbHBX?=
 =?us-ascii?Q?sy8hG5JJdmFGNykAkQzYJyD74kAsF2j+uTz7i7xA/8SYJSarrQWA1zN2VGM/?=
 =?us-ascii?Q?GncNkw1T0p6JWRIX6gxGY6BTUhL6hUURwXpkTmL1BvHq6RVUFSnfboeKkOmd?=
 =?us-ascii?Q?oTL3kw8eh0J56lhOOn+J9yruIYvyod55sAPJ/GUxbBLOaj2AIUm330kSaeFZ?=
 =?us-ascii?Q?PiLm+xai51HlCKnQRKEqhy717x0ilhDTDGyQV2ZPkPN/1d0OCNR14vh581s6?=
 =?us-ascii?Q?ep421PxLsoK+mKj/mIPEhnKGzIaLkapCJTj0RRa4TUxRSwlLgvGSOLgA1u89?=
 =?us-ascii?Q?3Kv+WBEwSGyJdlPwm/48LL+96PtNDC6kksiK9EBnCqKyQe2B6DLvt7XqbzbB?=
 =?us-ascii?Q?646KLy6aTOLQXvFf/fobdpOva9HtD1zJ6OSQ5hcFG9XSLA7nmjsxuilYf7yR?=
 =?us-ascii?Q?xnpvSKPEwYL+ixvmO3sdATombuHw+lWbu9WdUQ0Vf9eyrUs9mvejiOY+ZO2U?=
 =?us-ascii?Q?pQZ0SJnMcvwSM62cEY2wHUQEs/QE6XR1iMehRh/jnyt+w9x6YcB6VY2ICGKm?=
 =?us-ascii?Q?bwVch0fwi/vBREAgoY1tMytue+A3c6jCpZSgw13Ow4OBLxGiJSR8XUEAPBJa?=
 =?us-ascii?Q?qjdxHgY3dRxq8RcGLzliHXB8qtaUss5gqFgkvF/w8kKDdbYqkXztviavR3/y?=
 =?us-ascii?Q?ljat49lpi16HnQkV6v9TDgH2UuEoLG5n2Db+2do9PUL80DhNrxCB8vNWKMqZ?=
 =?us-ascii?Q?8EJX686jiHgDMAfnbWv0dzWcJmG88LqHTTO8wJGQLSUbLsolK9JagbfFzeds?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 445487f9-a6b6-4f31-4736-08dce7be189c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:24:42.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7UhFbYwaTZ0wneyNa5wBqP5xgkUo4WVaiB9wwn4DoK9dzqyeAgRQwyfMZbjVzlouahFBGxNwvRTG3/3Shu1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
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

On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
> On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
> > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > > > Drop the exclusive client count tracking and use the filelist from the
> > > > > drm to track the active clients. This also ensures the clients created
> > > > > internally by the driver won't block changing the ccs mode.
> > > > >
> > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > >
> > > > Is this really fixing anything. As far as I can tell nothing upstream
> > > > opens a file internally (i.e. xe_file_open) is never called directly.
> > > 
> > > should fix this case:
> > > 
> > > 	open()
> > > 	close()
> > > 			<---- race here
> > > 	change_ccs_mode()
> > > 
> > > because the close is not completely sync - the cleanup where the
> > > previous number of clients is decremented is executed too late and
> > > subject to a race fixed here.
> > > 
> > 
> > Ah, ok. But then IMO just move the clients.count decrement to
> > xe_file_close. I try to preach solid locking / layering and this seems
> > to go against this idea.
> 
> why do you want to track the exact same thing in 2 ways, one in drm and
> the other in xe? "Are there clients connected?" is something drm_file
> answer and doesn't need to be duplicated in the individual drivers.
> 

Well layering, making assumptions about the file list means, and not
randomly deciding what we can and can't do with locks we don't own.

> At least it's also used for similar reasons in amdgpu and vmwgfx:
> 
> $ git grep -l -e "->filelist" -- drivers/gpu/drm/
> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> drivers/gpu/drm/drm_client.c
> drivers/gpu/drm/drm_debugfs.c
> drivers/gpu/drm/drm_drv.c
> drivers/gpu/drm/drm_file.c
> drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>

The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
meant to be traversed by drivers there should be an exported iterator
IMO.

Matt

> 
> Lucas De Marchi
