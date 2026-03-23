Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FD1D58CDC
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 07:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752F910E2D7;
	Mon, 23 Mar 2026 07:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEemMsPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426010E070
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774249219; x=1805785219;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vmz5iBj64sdR4loT8Ved/FHnJ/8acf/pgqtoxzUYBeM=;
 b=EEemMsPBAcxEitmgSwECgsSROWHeNH/LDE5OS9JV+30U8MdkuSXgqcFT
 toxyE3R18J7+ZCn3Ui6SKcKZ71/ScBaMW24zOaPf3nDpMDamtRm3tFmsC
 s6bYWw8xj6yADN1RBw05tE0bZeqOtkrENwy/IYvpnFQYNTkx9tZavnLDv
 yxfCfHnaxszVyRC6j7EzBU/iIEdanwbqj3U6ERzPdLPHtJb0umBxibhPe
 7OFoIYIaeN3OgAFE63WF5iVmJNy0UiPcKRA7Re2IWIXd/msln2dACZ7uY
 3MXvUWOuBPtfgRSmZk/b1L65t92PNZc73/naBeim19Co14+kZMj6WjiNY A==;
X-CSE-ConnectionGUID: 0TWZbGUyRsCbd03ntn1qwA==
X-CSE-MsgGUID: QxjiCSTuR0ekr32u+ykkDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97861703"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="97861703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:00:19 -0700
X-CSE-ConnectionGUID: WqPS8C7jTCmRKxIakWJD3A==
X-CSE-MsgGUID: xhYq6JhQSm+cakIZXk7a7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="246967903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:00:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:00:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:00:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfAB6Y8wzn5y+L1UfOpdxd43KLi3lUUYAF2QzYHb8wXit6aBRCYMtdpoXvGJooLI6OQBGM9AEuN6W6CCphBYsgn25RQGNWODvY23rmlWBaUNZpRzeWbLhZxDr1kBN0V1AGd95N3QxZ339G0NoFpwoSNnqcq5Ga4yCz/bpJQwiBL7SgenkuuVwqtmLC+vEkCO9dolTRIJOeuynF5l50iy1+ahM1Dz+OuZpQifezCpNfjuIr51DUKkiSoI67Wq+NIbmBtLAJQuiw75UYR5tMBGCvZriMzFTe4mNg09CcQreUOSDpWN6STJyvqoYCrhGBJt/ZZfitnQfglD2r2iAXaV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHU/0LKYJtZCPG3TqHiepbTSBlhXuDIUcgphKt9lDXU=;
 b=PZklJ+3s6iO+NGLIMLDUGFwCMs/KWF+Pl9OFk12Gj/Q3FY/rnh/QqpgLRCL2F//VegQhvJtQgYOM3xaZWGNcoJ6eMqNvVgmiiyKv/850jNLru5FaQOGWIwcDeZyhsa3k7q1FUU9kArC1aha0l8nT/QdLY0+NHL4xg6FX3H/j4+zmignaT39hFr0Gz+5I/8vkl0IzCsHHfWiPTJWnfIN8QJWYUgixBnkm1l/F0ZtmQjqbtRM7TqZsAHMYrVuM2LCdsMBu/q1CoAPgx+njFZpHNrp7sQ2bUoPRkv9hgHJX5JSPxAuaMabqy80xTmC9ARkgPJWb911hLw4krGHyFvd4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 07:00:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 07:00:16 +0000
Date: Mon, 23 Mar 2026 00:00:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Message-ID: <acDk/TVG9xY2FEPs@lstrano-desk.jf.intel.com>
References: <20260304233728.926378-1-matthew.brost@intel.com>
 <140f8047a6c5d798dce8c2970d6c47e4033b3e19.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <140f8047a6c5d798dce8c2970d6c47e4033b3e19.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0121.namprd04.prod.outlook.com
 (2603:10b6:303:84::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d46a45-9fe6-4423-37a1-08de88a9d675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: pzV6e0yv/0/79aPRk7a7/soPG0pkiOnqR5cpLD2iN9kUyhMTcMjZjiytQNpDK4ZDiSJT4v4JMC+pjVENgddIjSptnjknlIBxcqZf7VQuwAYBgFp2J+FzQXJKsV4gAhFP9rvCAWaC77/ao5cPKOkPWSz+NWOonK0aUTMMB9vTbwopY84mmO9ZxhuSDT5v3FlPZ7c7y9zj9eEdDeXlOHV8VZpRzuJY8TLBRPAENqCFCXClK9LgLwqsTBeIPf+4/BbBM8ZKKBEcKmsvSxXofl4hybXjPt5vhL+E019j5ZAMFrHRSfp0UkVgUTc8j6RKrCb0+vg1mFyomJQPxQEW1nOAS4Ds1PwcTTHbqLKUclZ40sfHu0S47vAe0byhUN5KeUNqL70Hi+cog+ZZ0D5UBlIxaOOQqQwUhuYz9j4vKvlwCgbdrJ4L1OTvO5L1BBExdER1UoiwW+WACUHVH3RouyIAOwp3FSQbeAffNMi1p8f08sWS8j0rD+Yd8gBru80maCa3pPCyqsuercwJk+sUTos1r+XZ0M2Ry6xVfCQPdXkBP1N3gCv9s7c5yjLfegKze3DAd+bizl8AOef2/VKBj8DJqGQ6HMWoaIT87JSBTVVhw9k0zOQ96FdRxunaXP/NS6iXqjT4PT3xy2JLg1NXy/wylktqLjVRwd2aOtPBJ+AijQFRLVXarKGA/StGe2VRINIo0tXUNsbhUqYbeVP4XmCmvEEsRSjmqxpGUZuC21q0tF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRSOXlQVmQvL1lpOTgxeHJhZUEydDR2aUlvYTlRLzFYNmVFOGtRc0NMbSsy?=
 =?utf-8?B?bzdZbE1taFlScUZOOGRoMnN1eEUybXlDT2hEL25HalBnZm1BTmt3YnEwa0pK?=
 =?utf-8?B?ZC9uSlh4anZBbjhmQjZlRm9qV2F1a3Y1T29BYzRqZEpEV1JicWZ3TncyODVW?=
 =?utf-8?B?ZjBNNnk0YXdmenhxMWpaTi9Rb04rcFVqOGVjUzc0cXYxMkpuNENqNUFFQzNx?=
 =?utf-8?B?Ny8rOU80MU9UVlU5WFNvZ0hGZkNPTk85QUo5NktDSlhHZnNQYmxaQjZ2RHd5?=
 =?utf-8?B?MVNFaG9MOEdKYkthR1lkVWY0cDhqeWlNeFNjNWNaWUVRY1hMOTQ2UFhJZFlK?=
 =?utf-8?B?L2RvKzd1dVF6SlZ1Uk9wRnU3bzBkQVUyQW11Mm9NTEtSbkljbHBYVUwvRzdM?=
 =?utf-8?B?VmhBb2s4TGlacURuaEJyL3ZLdDYzNUM0K1crTzM4d2pyV1F0UnV1VDl3ZUFl?=
 =?utf-8?B?MnFPNUZxRE82dWxleG5maklUaWxMYXh5bEYyM0NaVHJWa1ZOQWp4OHYvMWdz?=
 =?utf-8?B?eU1lcVBCY1d5QnRvY3VMb2hwcEhBelVkckZ0Wk5rYXlOTzg1WGlMNUl5cTFm?=
 =?utf-8?B?UVoyMjNTV0tWZm5KQnNWQVFOUVZwUXJyaVJ1akRsay9yN1dKNmxGMDZjcGlk?=
 =?utf-8?B?cUd2b3YvRjdybTVDQi9qdEZwSnNGVVcxeHM3cnA4NXNGSnJmMFYyVXg1RnJP?=
 =?utf-8?B?R2pDZko2emJvTm9GNjhWYlh1MWtjNklORy9YcUtOTmgrZ2hHTU9EekxLTEQ0?=
 =?utf-8?B?aGU1UnB3YTFsRmdnUElTMG9GMHUyVnVnMWV1RDE5RnhQWWhJcTIzZTNMTktY?=
 =?utf-8?B?ZmJpbXlJclN0RHh4S0hDcFMxSVB3bEZseWlzQVJKSjF6OWduTFJWbmYyb2xC?=
 =?utf-8?B?TnVwWkd2b2t6Ry9GakoyQW5hWWdYdU4ySjZuazUvdjNZb1hmMFF1WnRxK3Yr?=
 =?utf-8?B?Z2JIb0ZTeHIwazk3RlZKSWR2cjNWVytSZnNqeDNLOVpUbkUxV09oa2RTdXd4?=
 =?utf-8?B?VERSZjVBbW5Yc2d4UElKTk8wZXVnVHAyTWt1TjNwZnk3Z0k2VDNYRXJWbzZX?=
 =?utf-8?B?VjZ2dUZpbWpobkF0bXcyVUcyNEw3RU5Wd3JaTUk4TGxGNE9kWmowVzFLR0s2?=
 =?utf-8?B?YWt3eFFaUndpemlBRzFrUDc3cks4TU5qRWo0K1JGSFF3bWZaQ3I3cFlMUmh5?=
 =?utf-8?B?NHhUU281MUhVZzVDUFIrZWUrbkpObTdxa2RkZ0t6ZWt2ZGUzUkdJMWZzTkdm?=
 =?utf-8?B?bUNPdXBtOGdFNHk0YnJVWVNKemU4bWVraTB3OWY2YTUyY3RiS05TVklJbVpV?=
 =?utf-8?B?dkMwQUJtdXZzcG1QSFJFNnpTbHNZb1huc0t3bjh3U24vZGNURDBDSEU4anN5?=
 =?utf-8?B?VU94N3F2NEpWRVJSVjYxSDRJR3A4a1Y4V1o0TGo2UUdJbkp6K0Rmc21wZ3p6?=
 =?utf-8?B?emkzdjhYYU9Ed0trYUlZa3JrcG9FTGFQK3BqcVlFR3UxQVgzaU84WEViTTE4?=
 =?utf-8?B?d2dKOWpzK2VwenVremJnUkVBREtncS9qSkNGbVhnVS9UZHJDYVp4SGk2R3Nk?=
 =?utf-8?B?Y2pXMTc1djdsUmRBMDR6cG41R3RuWDZCMTF4NHRLNUJqSmVGTnQvTzZtQzla?=
 =?utf-8?B?T29QYzZ4dUhrYm55dmNqYURrQ21mUFp4dE9tREJZOWhlOG1GTWhyZjlwZ3NV?=
 =?utf-8?B?MHFueXk1dDRzcWpJSWVjWXN3MDh4d1MxNUoxREJoSHlnVDhoYjRTdkRCVFZI?=
 =?utf-8?B?ekZldnlIVm1nOWY3UDE5NmlmWXMzL3M3aHlEays1NHFIYTNkMkpzeG5yZnhQ?=
 =?utf-8?B?RlJYWlJQSGJKeWlmemh3N3BBRU1qNUNVTGxCT2pGY2hNS0ZndEZKVzFMNlhQ?=
 =?utf-8?B?V1l2TXVadnd0cklvY0dNZm5QUTllWkd4SE53Q3F1NjdQVC80YVh5b2VoUUly?=
 =?utf-8?B?NVBPZ0lIZm43aXNDaEZXaGVQZWE5K2hnV3duTGtDWkIyV3ZGWjVtYk1NRWNS?=
 =?utf-8?B?WEpTWnc0WURpckluamcrZEdpcld6RGRrZFFxYUdFTzhPczRybHBzYmtRZy82?=
 =?utf-8?B?am9pYzNidHlrM3d6cHZGeTBtY2JZazBTRU5DUTM3ZDhkWC8vZVlOQ2lkTWUr?=
 =?utf-8?B?bFFEUDFoTk14ekNmVlpTcno1Y2dLeXoxNUxvRmdRaG1pMklDTnNhbUFEbldT?=
 =?utf-8?B?a3Y2emFiSGFhOW9veDZDOGpXMXEzUllBd2FVNEZVOXZVOXNseTArcU93QU1o?=
 =?utf-8?B?Yk8yRTdGelVuNWRQMHZZdFNQUDVQaWY5TW9kSGdjVTJJQTYydjg0cHFNV2hI?=
 =?utf-8?B?cWZ0UjlROFk4TGV4UXJJajY2WW1jWTEvcU5JNFRZVDlnWTdmZXluUT09?=
X-Exchange-RoutingPolicyChecked: jgGYE/pC9X9t8NyKSWh0GIH1SdGSKnRsACn4dRKgZWqBLyYTv68Fi8Ol2xi18jQZwe1PBgbg+78uV6IkdfqoeWIk6jCfRNtvtkTbHY4w+UjioBehvI+zA3XyvYQ7G1646LNA+9jHO10vcQKr2Rr7s5S5dvR17bs9rt6NoJO2BWDRqOvWqmCqmjkNhGyqu1R0mdSzlvfar+KMKdu8ZpcJaEmQ9HDLymRcnlEKdi4VJEouoxh8Ezv7ThTTVJjPMyjSu8vdiVEDqr31z4va6Suer0NIRjypL3HrGLY3IqvWBuRPxJuM1dE8alJbsvuClvZNvbqMbwxjpRi1qfotz6JlYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d46a45-9fe6-4423-37a1-08de88a9d675
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:00:16.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5teiq6xz1NFmdqCptC7PvJvIscPVyPh3UMn6G1vVIKKa2UXXotGFR9mkpvoStT1YEgz8XOZAGwqQnFArkyg1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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

On Fri, Mar 20, 2026 at 02:06:51PM +0100, Thomas Hellström wrote:
> On Wed, 2026-03-04 at 15:37 -0800, Matthew Brost wrote:
> > If no exec queues from a VM are mapped on the media GT, issuing a
> > PPGTT TLB invalidation for that GT requires an rc6 wake which is
> > expensive.
> > 
> > Skip the media GT TLB invalidation when the VM has no exec queues
> > mapped on it. If TLB invalidations are already in-flight on that GT
> > we can't break fence ordering, so issue a dummy GGTT invalidation
> > instead to maintain seqno ordering.
> > 
> > This optimization is particularly impactful for SVM workloads which
> > may or may not use the media GT. Average TLB invalidation time drops
> > from ~75us to ~18us in such benchmarks.
> > 
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Can we make this gt type agnostic so that regardless of gt type,
> we skip tlb invalidations if there are no active exec-queues?
> 

Maybe? My concern was that the primary GT flushes caches, which may or
may not always be necessary. Regardless, CI and local reproductions
suggest something in this patch isn’t 100% correct. I’ll need to debug
it.

Matt

> /Thomas
> 
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 43
> > +++++++++++++++++++++++++--
> >  1 file changed, 41 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index ced58f46f846..20c34469d9a5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -205,14 +205,53 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >  				     struct drm_suballoc *prl_sa)
> >  {
> >  	struct xe_guc *guc = tlb_inval->private;
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	struct xe_vm *vm;
> > +	int err = 0, id = guc_to_gt(guc)->info.id;
> >  
> >  	lockdep_assert_held(&tlb_inval->seqno_lock);
> >  
> >  	if (guc_to_xe(guc)->info.force_execlist)
> >  		return -ECANCELED;
> >  
> > -	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > -				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> > +	if (!xe_gt_is_media_type(gt))
> > +		return send_tlb_inval_ppgtt(guc, seqno, start, end,
> > asid,
> > +					   
> > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > +					    prl_sa);
> > +
> > +	/* Try to skip media GT TLB invalidations */
> > +
> > +	vm = xe_device_asid_to_vm(xe, asid);
> > +	if (IS_ERR(vm))
> > +		return PTR_ERR(vm);
> > +
> > +	down_read(&vm->exec_queues.lock);
> > +
> > +	if (!vm->exec_queues.count[id]) {
> > +		/*
> > +		 * We can't break fence ordering for TLB
> > invalidation jobs, if
> > +		 * TLB invalidations are inflight issue a dummy
> > invalidation to
> > +		 * maintain ordering. Nor can we move safely the
> > seqno_recv when
> > +		 * returning -ECANCELED if TLB invalidations are in
> > flight. Use
> > +		 * GGTT invalidation as dummy invalidation given
> > ASID
> > +		 * invalidations are unsupported here.
> > +		 */
> > +		if (xe_tlb_inval_idle(tlb_inval))
> > +			err = -ECANCELED;
> > +		else
> > +			err = send_tlb_inval_ggtt(tlb_inval, seqno);
> > +		goto err_unlock;
> > +	}
> > +
> > +	err = send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > +				   XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> > +
> > +err_unlock:
> > +	up_read(&vm->exec_queues.lock);
> > +	xe_vm_put(vm);
> > +
> > +	return err;
> >  }
> >  
> >  static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
