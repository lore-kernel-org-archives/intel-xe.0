Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E4EC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 17:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2308610EB2E;
	Fri, 21 Jun 2024 17:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMhpcWMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245A210EB2E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718989632; x=1750525632;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6X8nKhymHvB+SZKkrfz/5TruHkBZZ5aR0DBpEAIpTFw=;
 b=KMhpcWMQUMBU9F6QITsboV/82ilipZ5f7jQjhogjIwyOrOvIxvkMkylX
 6msFxmlmFQkX93LyOv05/JGuDXWElHEbQzye/u6Seap3DI4yTxK+hzt43
 nk4qaRlqykrs+Ggic36rZ3nHLqZOAHnaZ+h4FnZfRk8XFJ2OSfRA8kQWR
 8Ul7FxgKaPzFAsHhiYnqZtBdW+TifhzR93WPhKZRMqOHYHZehdqY/kGs4
 h+cJ+4CDz73ljjNHoty1SSOCi6PsToACNMBjKtzWStiQnRaVDT8PrTpg+
 bWbEj3GHCW0qCvHbx+aQBS+EjOZjvPh6UIKS0AOJW9MLNSHeGWlhhkAqR Q==;
X-CSE-ConnectionGUID: 3LSpqfb5TeGAHQh0YmGfXw==
X-CSE-MsgGUID: 3Fc28b4JTrOJqL72T9AErQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16176168"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16176168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:07:11 -0700
X-CSE-ConnectionGUID: L7YeCoFbSFC9XRsOfEcH7g==
X-CSE-MsgGUID: YcICpdgmQoCW8l/YPjbwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47830678"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 10:07:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 10:07:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 10:07:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 10:07:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 10:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGMYlF6upvpH98w4PgbAFrMaPvW6cbP6zy7Pyx8eTS73w7Aa4tJvuUksRdq1o+gxbDaNzqJPxIWJaAbPPZFbe3qjAXyWwooHACPNlegwq/u2qjJTsZG4pxQAHJJsdbRPPPOmjRs1eVyOk5MT7IegHL3WC1bM7/UQijXdX01qJC5R4nMK+JFqVDV7hZVLdoQpPoEDRFZb8ADUstq3M6J7mPfTuXa+K3lzqyYeZnx7161PyXe1qLXbDLkvR1p+ZBHtgFz6civNC7Gx656nkMX8GxxeyWTCk14/S2b1uGtsprFXWgssy7PpFSUUWGtq35Zse7cLHJOWxkiIINn/Sr8ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pucw8DeGTNzTMaQVZ7MFPg4cszkb6VWOTEeaOmZyxD8=;
 b=kYHO0Fkn01xokARkrzOe0ZIF8O+nUIitrJc72ZHqES89y6Td3dC6nK6kbrMXD0Jib5oE3NfNichy9u55xaWqgI7xivMa2LcuEDeCoCqV4wnMdg/ktQDdbImdmXzStrJgTdO9oJN0tRecbagU5fg1TPqUTmJ7YBZMfSkXuaj2DJnjSkfBx2sDPnJyw3W63T9ujuNl+2hQ146VOhhcnLYRs37cmXF5Qb6tRYtCJ3xUP9tm6/ab0w0HTrTXvpkfMQW1+CkgLsP+GO/pEGPOuwrPYlhuzSWP++c9LXipGfs4rWlbzYxB8xKUzJbAYhPIhhXjNjk114KO1GIVRBT7fakf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 17:07:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Fri, 21 Jun 2024
 17:07:06 +0000
Date: Fri, 21 Jun 2024 17:06:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <ZnWzFiOpoNKn7Ppk@DUT025-TGLU.fm.intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
 <20240618171509.3336601-5-matthew.brost@intel.com>
 <cc8cd054-361c-44a9-93e4-c4a48d33f139@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc8cd054-361c-44a9-93e4-c4a48d33f139@intel.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d50e8d6-b9a3-4eec-8aa0-08dc921493e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WX823Ew4+T0x3SOEbI0EUdp19MpQKovEkkeu2Qhs2yRVM07hY+r8p+1VgK?=
 =?iso-8859-1?Q?EnMGF9uhFa3BrFuOSu8i95oeuj7NofyC3xvEL0zj/F0E69jneItCyDTbHj?=
 =?iso-8859-1?Q?PHwYHfIpzVyHoGkfGTje6UgEZnbdHKheop3hP06fjcVkrYZMH7P7Yt7yBn?=
 =?iso-8859-1?Q?ANyx3UCOOEV7dzaJfhHFSdwIJdWbGyRholntf2pGV7F7iVTv4V4jaEdLRf?=
 =?iso-8859-1?Q?TwkYaM7GJ6VdbdnLdQ8iH881h0C3Km3bojRXW9bseuz1ZawoOvmvc8bmW+?=
 =?iso-8859-1?Q?bpngT65e64vdahc2fehh2x0byqDJDlZuFfo+pXYBe8ekR9h3uOtfYdfxiN?=
 =?iso-8859-1?Q?pFrbMK+Vh05DyB5y1ISUbXHeT+XE2C0ErZvAzUY7AbBxSPlWf4EoVBV0dt?=
 =?iso-8859-1?Q?uZaWE9zx5D5QNmbEcs/sKspjIdjFoMWpdmhQ7jpRsG9NlKDEWuVbnUYQdS?=
 =?iso-8859-1?Q?bB4XkGSLM8krqwE7pjCP9biM3rONr+Zl45sfiAheDnBeGYD5ic9QynJjyT?=
 =?iso-8859-1?Q?XmuSwJ+nb2E0aHUVk3kIdzq9/HbYSb7v8Wlp8upF6ENzyG6Lz1LbNuU4So?=
 =?iso-8859-1?Q?HUMXi+3gvxDsd7/mkKpXPrvLdD60Ssarbxsec1wlsQj+J9eYE4d45VlwBU?=
 =?iso-8859-1?Q?5cP1NXtaiG+i8hglR+jUDveQt3NOXn7BGH5kKeBSnMR74mCtKk0scKigEE?=
 =?iso-8859-1?Q?JjA+1o1SJbVl/pbegKYR4u0qUKnqsxHBaGZYw6lxQTO13BqHZNoGgAYGZm?=
 =?iso-8859-1?Q?CKBijPREXmqnmf30aUbvdAF5/8aN29Q8GPQSTmcPeGNBXnnRNWjmFvZE18?=
 =?iso-8859-1?Q?3ITVgEi+VTEbR1La3zm479nSpdU/IW56IV0VRZHWJJ4uUZaStHxJ/aDm0l?=
 =?iso-8859-1?Q?V1J65vOVTy3o2gGfeKFYT4shOu/w9El9cS5kXg33Z/5+QDTkX+ibVfwCV6?=
 =?iso-8859-1?Q?kKlrOcRyCeq3A2fpBKNqejPWl/508rVpaB6JHzBJgSGnMnZyzbGYfOJumr?=
 =?iso-8859-1?Q?NMePApkKWJMHl8Ibma7oA3eCTei9W67Gyinw+fL+0rmJQQbOyFoTURhNYI?=
 =?iso-8859-1?Q?k3O17yZhpbt5vV/yx9RyLwIPFLYYWzg2QBHGQWIFNp/AbNjfoVroxgnyEt?=
 =?iso-8859-1?Q?zqXAVLGeGI/wDl9Yr4cXKuZq2QURQoudmvsE4+TNCSadjA3zq5FmwUS6nB?=
 =?iso-8859-1?Q?+y1dLiTMzZO5BhRcugFj9zLJYEjSeILn4yosx/77b/VgdSqkHPYgXguxfH?=
 =?iso-8859-1?Q?paRw9jO/OjADN0Uh24Nge+xd4ySXcn1O4vakWRrSEVW55kH86+XKaRHEX5?=
 =?iso-8859-1?Q?5K7BZmmw6eHpdII3MLxfE7SnHu3D4ne97mpQ7dE9cqWeWRwP/R1Hc4DGld?=
 =?iso-8859-1?Q?RDbF9FjdlX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fNZbP9WH4VliA27i5iI8HRsUdAyNG0Vi5OTJkl/rHY88IUeY/ewP/3o2Zy?=
 =?iso-8859-1?Q?ubFuuDZQupf1XNGKZq0ara4v8zDy248rY7TqaIa8dwoBwDH6gBDUnomkmp?=
 =?iso-8859-1?Q?VjeXwneotS2e5cEbhxiadGRhdP1biR3PtjknCUndTQ5jLlgnyilyS+WYI3?=
 =?iso-8859-1?Q?wsKJ2xymPSv1XWkDzkS+QcfFNk3I2FQrwxnWZLDfsKaEuFTkuaEw3DEHii?=
 =?iso-8859-1?Q?0AeX+B1ednVy9ZLBQ/WpEEqnsvD+V1J2EFjqA+xidryLOt79jV2Olr9/wS?=
 =?iso-8859-1?Q?8JGRT3AbvDpSo6IXH/tspMtR/cN4fVPdH22aPGK4OegDBMzbY8moB6GP+n?=
 =?iso-8859-1?Q?Pq9AejTbbuVBnvioMKUD8CjHqza2WC2KENGIC4j3alYGzS/IpOx6TM3omt?=
 =?iso-8859-1?Q?J5I1tHgzxs4pzqxZIZ+3uB81CucmhWAO63iP3EzlhxDirKWAea0aK3aUot?=
 =?iso-8859-1?Q?+CkQoLHkru7nfsEhuxOISJK0QLtxiJYvVPWrc4wiHb4Ca5ziBhTuOOQ5wC?=
 =?iso-8859-1?Q?XqQJ+Hw+PvazLzeyij92PQ0HO/0WkD6O/QsgEOYLCurh6serUloIKQN62B?=
 =?iso-8859-1?Q?1bpjaaoZaAH4ybVwPdj/7r250WR3oDaeyswxk/6LpEUP5SzBbG9FZnszNf?=
 =?iso-8859-1?Q?2FyTkhJCsnBuxNLH+SMBSrGLE1OaH1a3pRasAjRrcmlyOYhvoo2lwuWRW0?=
 =?iso-8859-1?Q?XnjLbXSe2X9RF2xX3Osi8XaLb2naMTiG9h3z0cgl7rvdqrd+ta2ynRJIrK?=
 =?iso-8859-1?Q?57nw4KgjqfuN9XQFSvBR/p0q2aL1OgwbPjFFMuecJtE2/9dArpgo3xPyv6?=
 =?iso-8859-1?Q?l6ABSgSRU9k/5ThWCVV+7A1GCEYyqsU7ofpmIrbu3SXWZ/S0WT8xdPrp6B?=
 =?iso-8859-1?Q?YE1cWyD1G79lD1GJiRrISKqdPVLuKeoh8FMtIjt4sU8/SxnegYEY+svYYc?=
 =?iso-8859-1?Q?Xz2lBYSAGJIB1MA/lAOYIYgl/9e+2fPXMLIi7gFIzpKI+6sljf6PyEmQaW?=
 =?iso-8859-1?Q?4slnYhLA/RJ4MI9tP7FiIXF4qQL8mfgRm5hD/73hWRZdnSe/2iZunzEkcS?=
 =?iso-8859-1?Q?GYsMlgOEkqCvUAKVk3Eb1aZgWlIRGFHTzkvLUM69Qt+cUuJFYAE/9iyxuF?=
 =?iso-8859-1?Q?IRkfrauhSvFrW9o1OMpTDcByg3vGu4V9f/ClVD3Av85UVmnEk9oV70FvAg?=
 =?iso-8859-1?Q?0gCinJq52vo180t9QF5dvEBJoVsF6pXoxEpHnox2ZV0/UDMMunaFj5Hgk+?=
 =?iso-8859-1?Q?YYzPxZB38V7WedKdwkxy97jXk99Eq5yfTyQw10w5IJXUk3O6msTGJ5W+t2?=
 =?iso-8859-1?Q?NkO1gWHkBIivYuqRWVb7z+wnkxPkx8gV0EYfc07ln6xy+amglNcIKdLSid?=
 =?iso-8859-1?Q?u1xO1hJ+ABK/kxpfV4fV4HIgWv6qPm0QiJBlJTm0ZnVL3opVr4crHwmLMM?=
 =?iso-8859-1?Q?JgFOW2gacvYPw16+xFdklxFyO5XqsuEx7rjqJac3ySdn12hns9RR56Sr8N?=
 =?iso-8859-1?Q?2DR98cRAJhtHprRSZJfVAxSEa8ph2D+YPCAm+pD+2+mkpmXijHMUwvDyVe?=
 =?iso-8859-1?Q?OwfXDpOP1YB8dX0XLyKMElZJ01Wtxe3JtsadMBFS+Wco4TJ53lx6cppMhP?=
 =?iso-8859-1?Q?rEO1kVqgllX47eBsWxfvbFTzfWLGdkNplwA4x+PUZGSfz3NHAntqph+Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d50e8d6-b9a3-4eec-8aa0-08dc921493e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 17:07:06.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utH73nGayGpvI8XlM55SgnhoEk+Ax/sLTGZvYTok22jPf/ughi0jxaTUHAZQDHyLa/5fzGsm+mH4nNIQDP7vaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

On Fri, Jun 21, 2024 at 04:23:59PM +0100, Matthew Auld wrote:
> On 18/06/2024 18:15, Matthew Brost wrote:
> > This aligns with the uAPI of an array of binds or single bind that
> > results in multiple GPUVA ops to be considered a single atomic
> > operations.
> > 
> > The implemenation is roughly:
> > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > - each xe_vma_op resolves to 0-3 PT ops
> > - xe_vma_ops creates a single job
> > - if at any point during binding a failure occurs, xe_vma_ops contains
> >    the information necessary unwind the PT and VMA (GPUVA) state
> > 
> > v2:
> >   - add missing dma-resv slot reservation (CI, testing)
> > v4:
> >   - Fix TLB invalidation (Paulo)
> >   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> 
> <snip>
> 
> > +
> > +static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> > +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +			   struct xe_vma *vma)
> > +{
> > +	u32 current_op = pt_update_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > +	struct llist_head *deferred = &pt_update_ops->deferred;
> > +	int err;
> >   	xe_bo_assert_held(xe_vma_bo(vma));
> > -	xe_vm_assert_held(vm);
> >   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > -	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> > -	       xe_vma_start(vma), xe_vma_end(vma), q);
> > -
> > -	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> > -	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
> > +	       "Preparing bind, with range [%llx...%llx)\n",
> > +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> > -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> > -	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> > -				   num_entries);
> > +	pt_op->vma = NULL;
> > +	pt_op->bind = true;
> > +	pt_op->rebind = BIT(tile->id) & vma->tile_present;
> > -	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> > -	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > -		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> > +	err = vma_reserve_fences(tile_to_xe(tile), vma);
> >   	if (err)
> > -		return ERR_PTR(err);
> > +		return err;
> > -	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -	if (!ifence)
> > -		return ERR_PTR(-ENOMEM);
> > +	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > +				 &pt_op->num_entries);
> > +	if (!err) {
> > +		xe_tile_assert(tile, pt_op->num_entries <=
> > +			       ARRAY_SIZE(pt_op->entries));
> > +		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > +					pt_op->num_entries, true);
> > -	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > -	if (!rfence) {
> > -		kfree(ifence);
> > -		return ERR_PTR(-ENOMEM);
> > +		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> > +		++pt_update_ops->current_op;
> > +		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> > +
> > +
> > +		/*
> > +		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> > +		 * cached PTEs point to freed memory. on LR vms this is done
> 
> s/on/On/
> 

Yep.

> > +		 * automatically when the context is re-enabled by the rebind worker,
> > +		 * or in fault mode it was invalidated on PTE zapping.
> > +		 *
> > +		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
> > +		 * PTE is already cached in the TLB so it needs to be invalidated.
> > +		 * on !LR VMs this is done in the ring ops preceding a batch, but on
> 
> ditto
> 

Yep.

> > +		 * non-faulting LR, in particular on user-space batch buffer chaining,
> > +		 * it needs to be done here.
> > +		 */
> > +		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > +		     xe_vm_in_preempt_fence_mode(vm)))
> > +			pt_update_ops->needs_invalidation = true;
> > +		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > +			/* We bump also if batch_invalidate_tlb is true */
> > +			vm->tlb_flush_seqno++;
> > +
> > +		/* FIXME: Don't commit right away */
> > +		vma->tile_staged |= BIT(tile->id);
> > +		pt_op->vma = vma;
> > +		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
> > +				  pt_op->rebind, deferred);
> >   	}
> > +	return err;
> > +}
> > +
> > +static int unbind_op_prepare(struct xe_tile *tile,
> > +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +			     struct xe_vma *vma)
> > +{
> > +	u32 current_op = pt_update_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > +	struct llist_head *deferred = &pt_update_ops->deferred;
> > +	int err;
> > +
> > +	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
> > +		return 0;
> > +
> > +	xe_bo_assert_held(xe_vma_bo(vma));
> > +
> > +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > +	       "Preparing unbind, with range [%llx...%llx)\n",
> > +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> > +
> >   	/*
> > -	 * Even if we were already evicted and unbind to destroy, we need to
> > -	 * clear again here. The eviction may have updated pagetables at a
> > -	 * lower level, because it needs to be more conservative.
> > +	 * Wait for invalidation to complete. Can corrupt internal page table
> > +	 * state if an invalidation is running while preparing an unbind.
> >   	 */
> > -	fence = xe_migrate_update_pgtables(tile->migrate,
> > -					   vm, NULL, q ? q :
> > -					   vm->q[tile->id],
> > -					   entries, num_entries,
> > -					   syncs, num_syncs,
> > -					   &unbind_pt_update.base);
> > -	if (!IS_ERR(fence)) {
> > -		int err;
> > -
> > -		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> > -					    &xe_range_fence_kfree_ops,
> > -					    unbind_pt_update.base.start,
> > -					    unbind_pt_update.base.last, fence);
> > -		if (err)
> > -			dma_fence_wait(fence, false);
> > +	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
> > +		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
> > -		/* TLB invalidation must be done before signaling unbind */
> > -		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> > -					      xe_vma_start(vma),
> > -					      xe_vma_end(vma),
> > -					      xe_vma_vm(vma)->usm.asid);
> > -		if (err) {
> > -			dma_fence_put(fence);
> > -			kfree(ifence);
> > -			return ERR_PTR(err);
> > +	pt_op->vma = vma;
> > +	pt_op->bind = false;
> > +	pt_op->rebind = false;
> > +
> > +	err = vma_reserve_fences(tile_to_xe(tile), vma);
> > +	if (err)
> > +		return err;
> > +
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
> > +
> > +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > +				pt_op->num_entries, false);
> > +	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> > +	++pt_update_ops->current_op;
> > +	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> > +	pt_update_ops->needs_invalidation = true;
> > +
> > +	/* FIXME: Don't commit right away */
> > +	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
> > +			    deferred);
> > +
> > +	return 0;
> > +}
> > +
> > +static int op_prepare(struct xe_vm *vm,
> > +		      struct xe_tile *tile,
> > +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +		      struct xe_vma_op *op)
> > +{
> > +	int err = 0;
> > +
> > +	xe_vm_assert_held(vm);
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > +			break;
> > +
> > +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> > +		pt_update_ops->wait_vm_kernel = true;
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		err = unbind_op_prepare(tile, pt_update_ops,
> > +					gpuva_to_vma(op->base.remap.unmap->va));
> > +
> > +		if (!err && op->remap.prev) {
> > +			err = bind_op_prepare(vm, tile, pt_update_ops,
> > +					      op->remap.prev);
> > +			pt_update_ops->wait_vm_bookkeep = true;
> >   		}
> > -		fence = &ifence->base.base;
> > +		if (!err && op->remap.next) {
> > +			err = bind_op_prepare(vm, tile, pt_update_ops,
> > +					      op->remap.next);
> > +			pt_update_ops->wait_vm_bookkeep = true;
> > +		}
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		err = unbind_op_prepare(tile, pt_update_ops,
> > +					gpuva_to_vma(op->base.unmap.va));
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		err = bind_op_prepare(vm, tile, pt_update_ops,
> > +				      gpuva_to_vma(op->base.prefetch.va));
> > +		pt_update_ops->wait_vm_kernel = true;
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > -		/* add shared fence now for pagetable delayed destroy */
> > -		dma_resv_add_fence(xe_vm_resv(vm), fence,
> > -				   DMA_RESV_USAGE_BOOKKEEP);
> > +	return err;
> > +}
> > -		/* This fence will be installed by caller when doing eviction */
> > -		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > -			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> > -					   DMA_RESV_USAGE_BOOKKEEP);
> > -		xe_pt_commit_unbind(vma, entries, num_entries,
> > -				    unbind_pt_update.locked ? &deferred : NULL);
> > -		vma->tile_present &= ~BIT(tile->id);
> > -	} else {
> > -		kfree(rfence);
> > -		kfree(ifence);
> > +static void
> > +xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
> > +{
> > +	init_llist_head(&pt_update_ops->deferred);
> > +	pt_update_ops->start = ~0x0ull;
> > +	pt_update_ops->last = 0x0ull;
> > +}
> > +
> > +/**
> > + * xe_pt_update_ops_prepare() - Prepare PT update operations
> > + * @tile: Tile of PT update operations
> > + * @vops: VMA operationa
> > + *
> > + * Prepare PT update operations which includes updating internal PT state,
> > + * allocate memory for page tables, populate page table being pruned in, and
> > + * create PT update operations for leaf insertion / removal.
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> > +{
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&vops->pt_update_ops[tile->id];
> > +	struct xe_vma_op *op;
> > +	int err;
> > +
> > +	lockdep_assert_held(&vops->vm->lock);
> > +	xe_vm_assert_held(vops->vm);
> > +
> > +	xe_pt_update_ops_init(pt_update_ops);
> > +
> > +	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> > +				      tile_to_xe(tile)->info.tile_count);
> > +	if (err)
> > +		return err;
> > +
> > +	list_for_each_entry(op, &vops->list, link) {
> > +		err = op_prepare(vops->vm, tile, pt_update_ops, op);
> > +
> > +		if (err)
> > +			return err;
> >   	}
> > -	if (!vma->tile_present)
> > -		list_del_init(&vma->combined_links.rebind);
> > +	xe_tile_assert(tile, pt_update_ops->current_op <=
> > +		       pt_update_ops->num_ops);
> > +
> > +	return 0;
> > +}
> > +
> > +static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> > +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +			   struct xe_vma *vma, struct dma_fence *fence)
> > +{
> > +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> > +				   pt_update_ops->wait_vm_bookkeep ?
> > +				   DMA_RESV_USAGE_KERNEL :
> > +				   DMA_RESV_USAGE_BOOKKEEP);
> > +	vma->tile_present |= BIT(tile->id);
> > +	vma->tile_staged &= ~BIT(tile->id);
> > +	if (xe_vma_is_userptr(vma)) {
> > +		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > +		to_userptr_vma(vma)->userptr.initial_bind = true;
> > +	}
> > -	if (unbind_pt_update.locked) {
> > -		xe_tile_assert(tile, xe_vma_is_userptr(vma));
> > +	/*
> > +	 * Kick rebind worker if this bind triggers preempt fences and not in
> > +	 * the rebind worker
> > +	 */
> > +	if (pt_update_ops->wait_vm_bookkeep &&
> > +	    xe_vm_in_preempt_fence_mode(vm) &&
> > +	    !current->mm)
> > +		xe_vm_queue_rebind_worker(vm);
> > +}
> > +
> > +static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> > +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +			     struct xe_vma *vma, struct dma_fence *fence)
> > +{
> > +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> > +				   pt_update_ops->wait_vm_bookkeep ?
> > +				   DMA_RESV_USAGE_KERNEL :
> > +				   DMA_RESV_USAGE_BOOKKEEP);
> > +	vma->tile_present &= ~BIT(tile->id);
> > +	if (!vma->tile_present) {
> > +		list_del_init(&vma->combined_links.rebind);
> > +		if (xe_vma_is_userptr(vma)) {
> > +			lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > -		if (!vma->tile_present) {
> >   			spin_lock(&vm->userptr.invalidated_lock);
> >   			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
> >   			spin_unlock(&vm->userptr.invalidated_lock);
> >   		}
> > -		up_read(&vm->userptr.notifier_lock);
> > -		xe_bo_put_commit(&deferred);
> >   	}
> > +}
> > +
> > +static void op_commit(struct xe_vm *vm,
> > +		      struct xe_tile *tile,
> > +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +		      struct xe_vma_op *op, struct dma_fence *fence)
> > +{
> > +	xe_vm_assert_held(vm);
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > +			break;
> > +
> > +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		unbind_op_commit(vm, tile, pt_update_ops,
> > +				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> > +
> > +		if (op->remap.prev)
> > +			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> > +				       fence);
> > +		if (op->remap.next)
> > +			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> > +				       fence);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		unbind_op_commit(vm, tile, pt_update_ops,
> > +				 gpuva_to_vma(op->base.unmap.va), fence);
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		bind_op_commit(vm, tile, pt_update_ops,
> > +			       gpuva_to_vma(op->base.prefetch.va), fence);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +}
> > +
> > +static const struct xe_migrate_pt_update_ops migrate_ops = {
> > +	.populate = xe_vm_populate_pgtable,
> > +	.clear = xe_migrate_clear_pgtable_callback,
> > +	.pre_commit = xe_pt_pre_commit,
> > +};
> > +
> > +static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> > +	.populate = xe_vm_populate_pgtable,
> > +	.clear = xe_migrate_clear_pgtable_callback,
> > +	.pre_commit = xe_pt_userptr_pre_commit,
> > +};
> > +
> > +/**
> > + * xe_pt_update_ops_run() - Run PT update operations
> > + * @tile: Tile of PT update operations
> > + * @vops: VMA operationa
> > + *
> > + * Run PT update operations which includes committing internal PT state changes,
> > + * creating job for PT update operations for leaf insertion / removal, and
> > + * installing job fence in various places.
> > +  *
> > + * Return: fence on success, negative ERR_PTR on error.
> > + */
> > +struct dma_fence *
> > +xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > +{
> > +	struct xe_vm *vm = vops->vm;
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&vops->pt_update_ops[tile->id];
> > +	struct dma_fence *fence;
> > +	struct invalidation_fence *ifence = NULL;
> > +	struct xe_range_fence *rfence;
> > +	struct xe_vma_op *op;
> > +	int err = 0;
> > +	struct xe_migrate_pt_update update = {
> > +		.ops = pt_update_ops->needs_userptr_lock ?
> > +			&userptr_migrate_ops :
> > +			&migrate_ops,
> > +		.vops = vops,
> > +		.tile_id = tile->id
> 
> Nit: I think needs a comma here.
> 

Yep.

> > +	};
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	xe_vm_assert_held(vm);
> > +
> > +	if (!pt_update_ops->current_op) {
> > +		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
> > +
> > +		return dma_fence_get_stub();
> > +	}
> > +
> > +	if (pt_update_ops->needs_invalidation) {
> > +		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > +		if (!ifence)
> > +			return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > +	if (!rfence) {
> > +		err = -ENOMEM;
> > +		goto free_ifence;
> > +	}
> > +
> > +	fence = xe_migrate_update_pgtables(tile->migrate, &update);
> > +	if (IS_ERR(fence)) {
> > +		err = PTR_ERR(fence);
> > +		goto free_rfence;
> > +	}
> > +
> > +	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> > +				    &xe_range_fence_kfree_ops,
> > +				    pt_update_ops->start,
> > +				    pt_update_ops->last, fence);
> > +	if (err)
> > +		dma_fence_wait(fence, false);
> 
> Could maybe set err back to zero or don't set it? Just so we don't leave any
> possible booby traps later?
> 

Good idea. Will fix.

Matt

> <snip>
