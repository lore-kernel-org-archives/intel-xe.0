Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9498AC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 17:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A410E037;
	Thu,  7 Aug 2025 17:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiflob8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76710E037
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754588465; x=1786124465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zivXjri6apX00m6R4AIPx3CnO6UIIrxul4gQHDLyBl8=;
 b=kiflob8Qmvyt1ngJjxWUz4BQQY1OclOIP0bzB5eIq6WNDbVW81gC8+Kk
 V1rxuvD4dPur7NukhhXf3OP+gYp7tsBsWYlrsR2ayXNACgzkVqUa+5Mgh
 TRz8bB7Bk294zX78uNVb1q0CkTm+nk0mXHNjjLTt5AKfb4ZfjQuk8GuBn
 U6BkzlR05qOo2huusnwU0PP6qIYhCuXFzulBJ6v8fusStQ3oE2K5XsgLk
 hLYo8EsHfc6k7c6B44D7TDvTvJXPHuVis8pxklxBtXUX+V1ymwL/1EA5N
 ixp3bcZM0LTWtFOjS89yHsc9AdvA8xLDIHc0f/5Z0j5S1up98mphdflL4 w==;
X-CSE-ConnectionGUID: BMQCqygVTU+gvIYkAyATYA==
X-CSE-MsgGUID: rF8TzIrbT/WknQoIF8JYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56807696"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56807696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:41:03 -0700
X-CSE-ConnectionGUID: ZZSL5GlwSo27AbOP7cRdCA==
X-CSE-MsgGUID: 4FyB64RcTBSqonONTldKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164637302"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:41:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:41:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 10:41:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+0+DmGxESwIRVKGAWMWRuvpt3zF2p78wfzEcYTcCgM4v+mQQHZ7jTJd/IwLfCmNA/Rz9+ylxaq+WsYYJR8TXdxBMT8Zjcegyt66S9R6LBp+c6l0727EN5Nl77MijTIqAe8gtq9jYjN4XsZI2uAdxvx6w4oIXvKr+FYyRHpfot84I4B9d2zjxpMmNws38o9JkfBhgZBOB7s6YE2R0cD+FUDYP7yndm+XqWF2P7ARcc70JE6BjCxLtd5OevUl6++Vrb5emmnuacYEfOj20SoK7O4t9bc1/u8nh7/EHheLN4Se2tw5Wg1qz9pnTJB83tHlOLgmVxYT4TTVykMVtbAGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekO9q55G+jucPxd83eAMTZlfx0S89mH9JGqF97WJJ0M=;
 b=XA83LPYxsSrZrK8eNSoU529wxp87AtAe6xMlM8RThC4MVdzdCrprLVhdCDIaAlMQxYz7s+5aBJBbT7q4MRYccTt5283hOqIh5SxkUWrJLffohAmUz4SKzeG/EsKHJEBIe14XpJCiDvzY6Z6pnM8zUcB00SJ9luAPr/7omz98y33f5Nc3DXYbQMZOUiK8H2TvkZjm3O9Mf8e5HbaSoqcWbysdnq2BaUayniYlegFyJGAArdmwS5qaf/BwfRViiKKPsLnnqUu5S1e/k0c9LD2NUJYpV/KRFFd2JrV1rbTjDJ0bXL8Dn4fd1LqSDZ14WpeT0+mCQOePm8gyygVZO59dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.16; Thu, 7 Aug 2025 17:40:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 17:40:59 +0000
Date: Thu, 7 Aug 2025 10:40:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Message-ID: <aJTlKKvEimK2N48x@lstrano-desk.jf.intel.com>
References: <20250806222404.30333-1-stuart.summers@intel.com>
 <20250806222404.30333-2-stuart.summers@intel.com>
 <eacb4ffdb6b18bf912d6101496c8da156b6c139f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eacb4ffdb6b18bf912d6101496c8da156b6c139f.camel@intel.com>
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 866635da-aa19-4a8d-a109-08ddd5d9924a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VGm7HS4uDT2UAuhyf52pdWzxHoMuSuwJsqB2zsORdeb68mLjxsQ8GslTQg?=
 =?iso-8859-1?Q?cHDrCOsC8WwsRA+86Gs6SIyOVPSjWvQMAnC4JXkvRwKv/n9U5vcmMKZ+Fb?=
 =?iso-8859-1?Q?EhKh3M8aAGu7oh65yFG9judFAMABz1ZpOE58KmubTuApLVDIWl8uIfeL1A?=
 =?iso-8859-1?Q?x3v4b9Hj1/sNnTh5ep93LqESdg8WXEV2SRf7Q+sfhM49gbv3arzu3+Pd8L?=
 =?iso-8859-1?Q?iRGJJrh3vCi7LSAPLnYhtI+hjzbhTercHRpb+A8B3SA/nQaMZSEwF7k3ok?=
 =?iso-8859-1?Q?pqBp2Jiu0S8UIBTLvrQ5v167aSsvmfABo0CFdY3FVDsldCHsBDypql2xfy?=
 =?iso-8859-1?Q?9LNZpdm6GtCvo7UoNVSxk6yeotRl61/IkXHG2oc6/438zwh2Ugx2qXmuTJ?=
 =?iso-8859-1?Q?G9E1fI/Be9ewYvQxDLfok0nWgcAR1kB1XR8injmJefL5pZOyoEUPZ120kp?=
 =?iso-8859-1?Q?bN/zhQXwjK4Fd6lRi5bBTwsrgaD1KPbu9hLgsuqkDho35bGDCASQm7Pejn?=
 =?iso-8859-1?Q?itTL0IxIkUQ2neCpnrPaGbsmK/N38pR/RtZEkC4YTMaMDwzPsM41TCp9xu?=
 =?iso-8859-1?Q?HiUfOsZV1XdW60nkZ1c9Sm756JYYZWYOsAf6YtpgR7WsyAGG4eTYGUkWMh?=
 =?iso-8859-1?Q?hp5S6CjA6unCBTCbg758H68lXT126vKz3ezm++XGaGtDduflW58jFoeaF/?=
 =?iso-8859-1?Q?DcEQWeD5hFIwuuVC5emZSvBXKNqg038/R2F7ZQkFOPXEg+FcTDqjzlO7zJ?=
 =?iso-8859-1?Q?w690qTaau+eHIW45fcKSDjsH+oG66+ibWqQNCAxJ5rJccF+XqgWxpl6A/d?=
 =?iso-8859-1?Q?b2e0TdaKo9rq1Wma7PzmF2KRGiNRGz1Ky/b+F/SRKnXZnOk1FkNgyQ4qYA?=
 =?iso-8859-1?Q?PoY4stll2S4d75/KI9jq3MyfwVUECvpfsvGi82osdkc1PUwrY0xE+Qfakg?=
 =?iso-8859-1?Q?rKNdSvoCGXa1D3z8DFI7Gq6i6wej9cm8+uBHtrm+cQQ+33Y7pS23hsoOJZ?=
 =?iso-8859-1?Q?5c/6NNFLxQn8jwxFWf19C1h5D0OCUjVnYSQk3L0Wn1mPCi3Rr0vc/G7t2f?=
 =?iso-8859-1?Q?PweKnPLT3gPHnXarGz5LQ6Y4U1YAtsSRKmMTKYOr6xPEcsod1cWEEqU3Z4?=
 =?iso-8859-1?Q?QYgED6nXh9ST5fdIpI0sV9Saz6o3iQ9t3TzCERhwTEaAIFcmKT04oTDMuE?=
 =?iso-8859-1?Q?YvoDlP/zcvffeyXWg5tVw8lJQ/Js7N7NMURX+3HC5R/5Cxkca1vvFK+zGB?=
 =?iso-8859-1?Q?pLbBA6R/npQav8rl+ienkwKGixcdAjZSQsRilEieXtIfIZb4EU5KVDskUr?=
 =?iso-8859-1?Q?b0/t/MUApg8XjmNQ+e6+SmLqdGNXFZHgPcdbQyZ0mOY3EZ7zGVj2o+Icau?=
 =?iso-8859-1?Q?2NAeGxxu4Jgzt9CA974dulfe79vm0FkfhHni5pDoEXhz/w2SNe5DFpwkQc?=
 =?iso-8859-1?Q?UQJ3MQrSQMCuRbogNj5bLuUbfMD/D3V7ojyy2dfmX2mBU3bkdi9Duh4q5A?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MLGi4wxDVFSMKbGc3zwW2LbRklHvs14IP76iWQujWL4QZ4ob1p22A6iRHw?=
 =?iso-8859-1?Q?WETpGOM3DU0rLTksAJrPWWGAbPTHAjq7KDnurjhMq3yybcYn9g6/14854V?=
 =?iso-8859-1?Q?kzZyuc8buF7osjljbeDHFOjzNZcFNz8zIKR8G/BuN9Pdk/NSRDXLmzk2sF?=
 =?iso-8859-1?Q?bcLh/TV205H6omt6VXw9xrHUhjP+Yjmnth5IAYEF9mqknwzJ1/S5a2/B0J?=
 =?iso-8859-1?Q?F0syE6Gzus84Yo83B+520kZXjBLIB5gQeFrDKR8CKrQ1WsXBSlF7IX8n9t?=
 =?iso-8859-1?Q?DVYbJw5B8ScXbfHNKbu3khe6oUPRJKs6BLfkP8R+mzK2+XGFMKIbzHYfWc?=
 =?iso-8859-1?Q?qFkQ/V9hlDKAgLjraQkniQhOygOWtKYmcakW8U9UT2lgAoHELqf2d9RJsF?=
 =?iso-8859-1?Q?WFmjNLR4t/7Mn5vO64BA7UiVDpkEESB9RgV2LJBL3BkYL2pAiWrqcPv5Uc?=
 =?iso-8859-1?Q?o01LlNEuDVGbQlPvQDAagdhW3P0y6mTLmu/uYM8gZYUyBR7Z20hbf/1Lgq?=
 =?iso-8859-1?Q?sxJKdrl8sUkfDtdUxQJpHSfRv2CMSFW9NycgtOmUJEOqNEgSi5TIgEADUF?=
 =?iso-8859-1?Q?674CtqY3JGJwFrqkPWvvFIHae4iCRganogZS7NSSf8TEtHsDlt0Frdovt+?=
 =?iso-8859-1?Q?KTGhWJ/JbxgJyj8htvCQts8IBPGyMpOuczL0lg4yiW6waBbHDhvwG3xZgX?=
 =?iso-8859-1?Q?plxpLyqgdxIk+iO3OEDBqUQdpTwGA/MgC3KHhnSBB3desfywW2KVtcN6nL?=
 =?iso-8859-1?Q?1FyWIzLINNnndlUgctEwFYFFC83GKH0wsBTd2N3KqsisZTwLrZV8iey6PC?=
 =?iso-8859-1?Q?TeAuDwW3stvInnl5cj7poSSIwd+X8HvbeRH4ZLZIDBbuNV7Yk9i9Ja1rgy?=
 =?iso-8859-1?Q?poTPU+ZsZeIcySYUvTef56GFrqHIvsghrQaC5kyUcU/4B4a3aAjpWGmkux?=
 =?iso-8859-1?Q?KlPIlNqoRUcVge++plnAoLnI5gZF6cznTmU99CGGBXJJ6OJQBGOvRaAf1E?=
 =?iso-8859-1?Q?YFJypTM1c/Gj/apXxJ8b/btWB5/4YVZCjbH0p/S+2ipfrG0T3AxHk8F8QY?=
 =?iso-8859-1?Q?XzlgqOQCV2tJ/0aO5E6l9M/mTi37Po3nExrcHlEwhnK485/KK6B77MWkXC?=
 =?iso-8859-1?Q?ovRQLG5JCy2JUtQCFo7Ai6FHCId1fj0FyGake5TtRH9ReUEVyHbn2jO3Qm?=
 =?iso-8859-1?Q?mqVqW79z2YtZ3sSUVIBqFvFCcQRtfKwXE77GzoCwLl24znS7eaY7v8cXLT?=
 =?iso-8859-1?Q?jvicYwOIJRHMubtOZuAETfqteR+cAwHngGpalCy94YwpKp2CvHOc+q64sJ?=
 =?iso-8859-1?Q?AuO+e/FyxTlD2tgaZOabBQO1K15P/QdmUXQaAjHOZF4lbqxXWpIj0JA2xz?=
 =?iso-8859-1?Q?PChtbqA1/OXr/Hw3gI27zOTZb6EWtla1GyGyR4SdkXn9te2lP5nwAvqxgP?=
 =?iso-8859-1?Q?hihiHwSYxycxRz6+FaR8JV89VpuYJMhYOP9Vcxd1GK3jlQ4C8j+ak0c1aE?=
 =?iso-8859-1?Q?RPCVyT4hpSv6lHPiE2YjvFk5ddp8gRgOv5KRB7UcXQNt/o8i3p9fxic8le?=
 =?iso-8859-1?Q?tg7MCyfwuHJdL3WUOk/a8pxG1FDEOa83e+ubS/QD+P8DXjQR7BswasoyEx?=
 =?iso-8859-1?Q?mWKmlMXry9PtaY74Ka1LVdEMmH+4oGcoqnJ2r/lu9zfQnX/8bJhP5/Gg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866635da-aa19-4a8d-a109-08ddd5d9924a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 17:40:59.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxs7cVBnBULyniHWRtUrKKDzdTu/7TAIEeadM39Sh42ULy3WX60JB7DIxJB75Ensr+j+Z3wPubKeyaug/tCbVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
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

On Thu, Aug 07, 2025 at 11:10:38AM -0600, Summers, Stuart wrote:
> Mi Matt,
> 
> Any thoughts here?
> 

A lock to protect the seqno assignment and calling xe_guc_ct_send or in
the final result a backend op is needed. From seqno assignment, issue
needs to be atomic or issues could get reordered breaking how we signal
fences. ofc we could fix that part a I think a mutex here is easiest way
to go.

Matt 

> Thanks,
> Stuart
> 
> On Wed, 2025-08-06 at 22:23 +0000, stuartsummers wrote:
> > We already have a lock tracking the fences/sequence numbers
> > here (pending_lock). And the GuC CT code already has an
> > implicit version of this lock in the ct_send routine.
> > Prepare the way for future optimizations in TLB invalidation
> > flow by moving the mutex lock down into the GuC CT send
> > routine rather than in the upper TLB invalidation layer.
> > 
> > Signed-off-by: stuartsummers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 02f0bb92d6e0..230f30161395 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -158,7 +158,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt
> > *gt)
> >          * appear.
> >          */
> >  
> > -       mutex_lock(&gt->uc.guc.ct.lock);
> >         spin_lock_irq(&gt->tlb_invalidation.pending_lock);
> >         cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
> >         /*
> > @@ -178,7 +177,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt
> > *gt)
> >                                  &gt-
> > >tlb_invalidation.pending_fences, link)
> >                 invalidation_fence_signal(gt_to_xe(gt), fence);
> >         spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> > -       mutex_unlock(&gt->uc.guc.ct.lock);
> >  }
> >  
> >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> > @@ -211,13 +209,12 @@ static int send_tlb_invalidation(struct xe_guc
> > *guc,
> >          * need to be updated.
> >          */
> >  
> > -       mutex_lock(&guc->ct.lock);
> >         seqno = gt->tlb_invalidation.seqno;
> >         fence->seqno = seqno;
> >         trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
> >         action[1] = seqno;
> > -       ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> > -                                   G2H_LEN_DW_TLB_INVALIDATE, 1);
> > +       ret = xe_guc_ct_send(&guc->ct, action, len,
> > +                            G2H_LEN_DW_TLB_INVALIDATE, 1);
> >         if (!ret) {
> >                 spin_lock_irq(&gt->tlb_invalidation.pending_lock);
> >                 /*
> > @@ -248,7 +245,6 @@ static int send_tlb_invalidation(struct xe_guc
> > *guc,
> >                 if (!gt->tlb_invalidation.seqno)
> >                         gt->tlb_invalidation.seqno = 1;
> >         }
> > -       mutex_unlock(&guc->ct.lock);
> >         xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> >  
> >         return ret;
> 
