Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F7606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eR4sOg5P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483FF10E215;
	Tue, 20 Oct 2026 19:13:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3B110E215
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792523610; x=1824059610;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b/5+hMtTKUBwqv7ZCpfr60t54Clp8YjOwzt8TiNU6CM=;
 b=eR4sOg5Pu3FKBrYVtg31Fp6RCmj2OUb9yeuGq7C1ObxGyB7T3pXInDCF
 Q0rMHPTYR101vrNqh+6lhxjIsyzJcBfWdhP/Lbwd0qEjyMvT+dc9pAr8J
 Yr/sabCtJNSAuL4jxr0yksg2GHvxkNT2cBIHQXpoGdCdqNLSgUub/HiY5
 PlN04AMRFhzD8dV6cZAvctXtTCfzhgVHHEzuuJbA8t9J2Gw/35fuMbFC1
 p+SDfafTz76CcMppblEQ5O85IHm1HWvNnkivFWvnJJGJKuE2SgHw07osL
 zZXz+tdJ2M4YCP7BsLj69Evwpo9SwRft/3DyRfFAbLRXedcC+GMWbO0iz g==;
X-CSE-ConnectionGUID: r8pXnbMtT5qRVi+RM4yTFQ==
X-CSE-MsgGUID: iwoLh8kZR56kaxPCz/8UKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1117407"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1117407"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:13:29 -0700
X-CSE-ConnectionGUID: CJCtNTh9QP2SOFqcw2w4RQ==
X-CSE-MsgGUID: MMr/B0gTS2mDTyBG08UaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2901187"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:13:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 12:13:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 12:13:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 12:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UboXR+pg/bb9hVPSUhkZlLNBec5cj5aDWHOHAbHDlVdYrH7oZt/7uJYTXYjI9EcBB4AOVvsNYJTAX4C+jvocXM9gDUhvlAv3nc5RdS871AOIaLnk/8k0iILa0gQ0vzVsrtV0YNEtvQbQ7jOtE9ys8ncs7YCMvhSeXm+xqyU/kS+kzSjviAb4rWbwd3Jew395uRN05vsh2cBuDf59kOEozdB8h9TnRnFwOU4Ih1uAYdgP2+NcwRV1HSYWDFrb3yY4Z654T6DFKvE5oM4YcTTvrY7TcU7UBlaR2I5d/fnFTnXC7d2R3W+G41ydqRS8r+3A63v/r6uDQWA2jieksYA5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0h8wdlA9BhX6I0K4UdLtQ461AQLRKV5bSglWXtdwrg=;
 b=yzQYU9UWHxQhGqyASCkm42QfDSSb6n7veBJQPjvA/CmghrKY8VPAXgXckwWZR0dYSz0PsrGJukpz1HNrYOOmt3G+aaPAZ67XMmvsO+Kw0J2my3EguxnCZGUL1YUtD+8oZm3SQMRYj4BFwysummUNHt8C6ghdaAkkfY2rh0XuXwD37lmBQZWBu+MoGZqM1WuJG6EE5vjksNM5KsypcLB22YmTsgcQhNut0V3lzQEsViFXcCLztAmXRkKQ+3p/fT+7AtPrFFDyzfu5LyUCE3Gt91bjrpATCTOtyBczTQUQwWmIw1wrS4VLeYPEdyoub4eqTldk2XCn8UylH4oSmeis9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV0PR11MB712971.namprd11.prod.outlook.com (2603:10b6:408:604::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 19:13:19 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 19:13:19 +0000
Date: Tue, 20 Oct 2026 12:13:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED
 madvise state
Message-ID: <ate9TVShDPYAF2L/@gsse-cloud1.jf.intel.com>
References: <20261020165137.765886-1-matthew.brost@intel.com>
 <bd07d276ef1a575fc8bdcd37e1dd80552fb52a69.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd07d276ef1a575fc8bdcd37e1dd80552fb52a69.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV0PR11MB712971:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dc1e8f-bbb2-4d78-845b-08df2ede339e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|5023799004|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uK9mmgDDXfbvlmhT0AQspC3jPjVYXjsFS5p3lojzJBfRzoCP55ruaG0LNLA23DXaAhYQ43BQ7BV6usg+PeUIowjL2yKySZBiQGbO4IodCU0+o1FbNan5VDxtVFgm5v3+Dzp06QcsxifAuFfbbB871rDN/Z/7xHrn0pAUWvXrtOo8WcWhRxbJKte/eWo9A4oJqpmSY3+lB79dHrbWTLaWxDf3w5v21cCl0/UhAp6sEdWITp9nYNo65dbMcA1LyTv2aeEm8wihFTyOhWDyf8+VAUp2iScVuNPyxL8ZzTtKK6aVD3psDZ3GNQmNDUMh/ZUOkrF5VuJIeWXdTzw32LPTXink4AzueO8NH+Au3ngZWN8xtHbVqaQO01aZ8rvCbaUwVpKJmnFFr1cnrjRcuyJL2xxrmbcrdyL245NebEuO26QsmqvFL8BY8Yj7Gdl6k8spLHTaYQCZS8lmc2j9ybchLTOMM/d1OedSKHp1OgQfJKiL8fxow3DNRwBJtmlchdzvSaeBW2ho82vJYYCOr7/5lSnFuR6nw1ND727WqLC6wspTrEPEGkQW055ynI3G+6Klw9bGR5Kuwtm5Qx9423rH1SEvOb9rFvMvVb1WxkjNUBGi6yKlL248Km0il3u/37AOh28u70sQJgvIEPl0EGL7bmBF0/iDV03bqLYMIuiSVSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(5023799004)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VkKmfrUJbouKIcsL7KRECMSihyKLL7GjtPMN7SzRKs10VTcEjByjuPEJjD?=
 =?iso-8859-1?Q?grLfz+LhvAwX0/TWFctK5fDDcVe5vm5dPL8SBw203GbCxfpHlYkGAspHcJ?=
 =?iso-8859-1?Q?jqgIWIJCEO4+nkYwlMB1f8QHViKvBodV2KcRl85kdQ1Pn4NRUvgDcpd9Ib?=
 =?iso-8859-1?Q?RGVVg3sH5xIdrm+669Dc3HTibKq7LxeyiK6eYPoygSYsRwxbSzlYnL/lWf?=
 =?iso-8859-1?Q?yULEKz/pD3AHD1CZg5ETJFvGYGD+b5dLH0GRFHmIThRG5qdf2aKYkBmzj0?=
 =?iso-8859-1?Q?1iB5W/wKG4Lsto3geKpO6Xkphu5xWTRD3ZdK55/0mNTQubTGHzQ52KB6yF?=
 =?iso-8859-1?Q?yROTvkD/NhLBC0vHxOrgevc9Xnib+ym1EzSPly+ix5UQBIx1+jJTbldeMG?=
 =?iso-8859-1?Q?ovtoz5cWT4U/7RByl0Y6liP1+7bOxfcGqHFh63Zo3oFi0dcjky9dgki5Nv?=
 =?iso-8859-1?Q?wnq6a+j81wRXqva4lOKP10H/QXWlsmiXS5dPB9gY0PO7sAXB6cG/6cO47w?=
 =?iso-8859-1?Q?/BQUqo4yCQNAhwZ4WLi1hF1uAD2uzAdUKezdTbcmtV5nhgmRv5RR8I6gCX?=
 =?iso-8859-1?Q?vzykVvrGzccvtxkRjKtQJcesovshwlWF1eXCmfzAjN+OJt/mbCaIpoyFou?=
 =?iso-8859-1?Q?JP2qUg5SKH2GMugcLfZ2OmDhc39JwXJWUiUZkO4o7rUEUaxKndun1+NxwQ?=
 =?iso-8859-1?Q?JUb5MRufe/DDLUDALbH34eYZyNoRVyz0FnmYKG6tBOKFmTfXm1ecoyPaS9?=
 =?iso-8859-1?Q?QS91fl3Wrl4lrkBUBt0N9aI7r/JaUPg+vVeJlsbb6bptczE1opH2gO8cQ7?=
 =?iso-8859-1?Q?bf3xcepzy10YMQGNI3iCbINV/krK2DcAHickqYxAh25e6DohmYX6ApgBHC?=
 =?iso-8859-1?Q?SZX3OuH34a7wspprRrehDZRVe34DnorPPpU56mE0DOIDfSn/vLDxgjkMDk?=
 =?iso-8859-1?Q?oSowQr29SepfqIDI+M9HGS6fMtMhOeT+xwGdBPhUGeIqBNzPABWsk2+qDA?=
 =?iso-8859-1?Q?OS86G07nlsibsWCUwwPKMxlx1PVsIa+h34maRp08znP6Ct+U+qQgPQmcd+?=
 =?iso-8859-1?Q?tyILuCo5vRKqNui9HQ+6RuTY+bd7d0naEK+85V8UxjUDBpMTisoWVpAZ4r?=
 =?iso-8859-1?Q?cYT3BanstN+ydEUEGxUSGHzLyOP6xha8SihEqSIhrf9Gglv2TY+Enam61Y?=
 =?iso-8859-1?Q?dfo9VwQGGGmXYK+xu4CxVkri5VHFh0dz3cy+NBZHsXrMfT2YVj7y3Bijd9?=
 =?iso-8859-1?Q?DXx7nu8di9877OaUA6+hJf4EJJ3GdeoWVZzcTyHX+E9/GCpsDDz9fZs1CI?=
 =?iso-8859-1?Q?ETe8aovTtzuE2w/nkfXggBSOUfI7qEY0gM7sE0rSj/UH2Fm1ipXo/Ko7Z2?=
 =?iso-8859-1?Q?5J+ic75RY0eFrUpXBBU7CkqOZMxdNQ1niUmsw2B/W+0UuazUW+RDX7yzYU?=
 =?iso-8859-1?Q?EeYuqr5Swpg72W6HAZgQ3qOyzoodaATt0K7pOlxCruYlMb3VYq4R8YWw7U?=
 =?iso-8859-1?Q?jP1orPjsmJj+cRgy6U6fnvHTe8rBhlo8Sux/wdd47hHUgmI6wvJ3+B8lYg?=
 =?iso-8859-1?Q?QIl/gZ+Bfm2qGOjmxx05Bksb2SXpC4WNLVqhOjwxyo/6OX0e9kcEIbC+8W?=
 =?iso-8859-1?Q?bFOrCZfQVpvwob9hUOqMcS6h3gZd38gKIgSAMRCaRYedzVqYIHn6w2xagm?=
 =?iso-8859-1?Q?oXBggoGR3dFtRkdkQTCfICJ7ir5CL1u1/N1hRZLcvCObwpjypXjhkWuQtn?=
 =?iso-8859-1?Q?O7QdzzdpoYM52/t1I09dOGJZqNF44m2PwKbwsQO2iJcXB+nBqqo4dIQp1I?=
 =?iso-8859-1?Q?oQn4kUL14Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: v1ofhks7ujxGHs8G7+L00jImmStsraEh0UyEGYds3WZR3/OeQOsnJ63Yair74pJQWHEf3MKB509YRi8RdkiW+ZTTuEiZQmkLI8hepDBiIx920PMxWqFfQYOAPr5U6pKWtElzsFpQmHBaw84xRiH6TR7fxaF4LYd9w7PVrKy46l5G9by3C52OAEH1ihWUvevIRsqBtGw9/7dRO1tfKCp5F+/xEjrdHpZCKyOIiwX5hiSuhpaUjpIA1d1xE5xR3r7qV8kjQXjNxnFcesbQHVwN5aZp2EA7LbGvzLfHLZRjMegtlYZ8VaLGqyOTwiFdmxV1CEznchTCHCWm6a6nWGqfqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dc1e8f-bbb2-4d78-845b-08df2ede339e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:13:19.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVKb9ohxGG0fNDQs0g4+NfuZWci5GwvdDD17M8gVxxzjXIAV0HeII1McxkB239bOPQKM7Dx0VqCGtUuz5Py5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB712971
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 09:00:09PM +0200, Thomas Hellström wrote:
> On Tue, 2026-10-20 at 09:51 -0700, Matthew Brost wrote:
> > The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as DONTNEED,
> > signalling that its contents are not needed right now and may be
> > discarded under memory pressure (see madvise_purgeable() in
> > xe_vm_madvise.c), or restore it back to WILLNEED. This is a stronger,
> > explicit signal than a plain unbind: userspace has told us the BO is
> > not
> > just unused for now, but that it is actively fine to lose the data.
> > There is no reason to keep such a BO competing for LRU space with
> > actively used buffers, and conversely, once userspace marks it
> > WILLNEED
> > again it is back in active use and should be reprioritized
> > accordingly.
> > 
> > Give xe two TTM LRU priority bands and tie them to that state:
> > XE_BO_PRIORITY_LOW for DONTNEED BOs and XE_BO_PRIORITY_NORMAL for
> > everything else. Since the TTM LRU is walked in ascending priority
> > order, DONTNEED BOs become the first candidates for eviction and
> > shrinking. The transition is driven from xe_bo_set_purgeable_state(),
> > the single point through which a BO's aggregate purgeable state
> > actually
> > moves between WILLNEED and DONTNEED (PURGED is terminal and left at
> > XE_BO_PRIORITY_LOW).
> > 
> > Changing bo->ttm.priority cannot be done by a plain store: private,
> > user
> > BOs have bo->ttm.bulk_move set to their VM's LRU bulk-move range,
> > which
> > tracks a contiguous [first, last] run of resources per (mem_type,
> > priority) bucket. Writing the priority while the BO is still attached
> > would leave the resource linked in the old priority's bucket while
> > the
> > bulk-move code looks it up under the new one, corrupting both. Add
> > xe_bo_update_ttm_priority(), which temporarily detaches the BO from
> > its
> > bulk-move range, updates the priority with a plain non-bulk LRU
> > update,
> > and reattaches it into the new priority's bucket.
> > xe_bo_set_purgeable_state() is always called with the BO's dma-resv
> > held, so this is safe.
> > 
> > With DONTNEED BOs now clustered at XE_BO_PRIORITY_LOW, the shrinker's
> > purge pass no longer needs to walk each memory type's whole LRU:
> > nothing
> > beyond XE_BO_PRIORITY_LOW can possibly be purgeable, so continuing
> > past
> > it just wastes time trylocking BOs that can never be purged in this
> > pass. Break out of the per-mem_type LRU walk in __xe_shrinker_walk()
> > once a BO's priority rises above XE_BO_PRIORITY_LOW during the purge
> > pass. Behavior of the non-purge (regular shrink) pass is unchanged.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 46
> > ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_bo_types.h |  8 +++++-
> >  drivers/gpu/drm/xe/xe_shrinker.c |  3 +++
> >  3 files changed, 56 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6d2ac986e98a..b723addf071d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1086,6 +1086,38 @@ static void
> > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> >  	}
> >  }
> >  
> > +/*
> > + * Change @bo's TTM LRU priority to @priority. @bo's dma-resv must
> > be held.
> > + *
> > + * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move
> > set to their
> > + * VM's LRU bulk-move range (see xe_bo_create_user()), which tracks
> > a
> > + * contiguous [first, last] run of resources per (mem_type,
> > priority) bucket.
> > + * Writing bo->ttm.priority while the BO is still attached to that
> > range would
> > + * leave the resource linked in the old priority's bucket while the
> > bulk-move
> > + * code looks it up under the new one, corrupting both buckets.
> > Temporarily
> > + * detaching the BO from its bulk-move range moves it with a plain,
> > non-bulk
> > + * LRU update instead, and reattaching afterwards re-inserts it into
> > the new
> > + * priority's bucket.
> > + */
> > +static void xe_bo_update_ttm_priority(struct xe_bo *bo, int
> > priority)
> > +{
> > +	struct ttm_lru_bulk_move *bulk = bo->ttm.bulk_move;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (bo->ttm.priority == priority)
> > +		return;
> 
> Hm, what about (pseudo code)
> 
> spin_lock(lru_lock);
> bo->ttm.priority = priority;
> ttm_bo_move_to_lru_tail(&bo->ttm);
> spin_unlock(lru_lock);
> 
> If that works, we could also shorten the comment a bit.
> 

This doesn't work. IIRC this explodes in TTM, hence the way this coded.

> > +
> > +	if (bulk)
> > +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > +
> > +	bo->ttm.priority = priority;
> > +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +
> > +	if (bulk)
> > +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > +}
> > +
> >  /**
> >   * xe_bo_set_purgeable_state() - Set BO purgeable state with
> > validation
> >   * @bo: Buffer object
> > @@ -1095,6 +1127,13 @@ static void
> > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> >   * transitions. Once a BO is PURGED, it cannot transition to any
> > other state.
> >   * Invalid transitions are caught with xe_assert(). Shrinker page
> > accounting
> >   * is updated automatically.
> > + *
> > + * A WILLNEED -> DONTNEED transition also lowers the BO's TTM LRU
> > priority to
> > + * XE_BO_PRIORITY_LOW: userspace has signaled it does not need these
> > contents
> > + * again soon, so make it one of the first buffers considered for
> > + * eviction/shrinking. The shrinker's purge pass relies on this
> > clustering to
> > + * bound its LRU walk. Conversely, a DONTNEED -> WILLNEED transition
> > restores
> > + * XE_BO_PRIORITY_NORMAL, since the BO is back in active use.
> 
> Is it possible to make this comment less verbose and focus on what the
> function is doing. Perhaps we could put the LRU priorities and what the
> shrinker relies on in a separate DOC section?
>

Ok, let me adjust this.

Matt
 
> 
> 
> Thanks,
> Thomas
> 
> 
> 
> 
> >   */
> >  void xe_bo_set_purgeable_state(struct xe_bo *bo,
> >  			       enum xe_madv_purgeable_state
> > new_state)
> > @@ -1112,6 +1151,13 @@ void xe_bo_set_purgeable_state(struct xe_bo
> > *bo,
> >  	xe_assert(xe, !(bo->purgeable.state ==
> > XE_MADV_PURGEABLE_PURGED &&
> >  			new_state != XE_MADV_PURGEABLE_PURGED));
> >  
> > +	if (new_state == XE_MADV_PURGEABLE_DONTNEED &&
> > +	    bo->purgeable.state == XE_MADV_PURGEABLE_WILLNEED)
> > +		xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
> > +	else if (new_state == XE_MADV_PURGEABLE_WILLNEED &&
> > +		 bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED)
> > +		xe_bo_update_ttm_priority(bo,
> > XE_BO_PRIORITY_NORMAL);
> > +
> >  	bo->purgeable.state = new_state;
> >  	xe_bo_set_purgeable_shrinker(bo, new_state);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 8ec4a01a0092..0265fb314c77 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -24,7 +24,13 @@ struct xe_exec_queue;
> >  
> >  #define XE_BO_MAX_PLACEMENTS	3
> >  
> > -/* TODO: To be selected with VM_MADVISE */
> > +/*
> > + * TTM LRU priority bands. The LRU is walked in ascending priority
> > order, so
> > + * XE_BO_PRIORITY_LOW objects are the first candidates for eviction
> > and
> > + * shrinking. BOs advised DONTNEED through DRM_XE_MADVISE live at
> > + * XE_BO_PRIORITY_LOW, everything else at XE_BO_PRIORITY_NORMAL.
> > + */
> > +#define	XE_BO_PRIORITY_LOW	0
> >  #define	XE_BO_PRIORITY_NORMAL	1
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 772dab9b3ed7..c86455ea08d1 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -133,6 +133,9 @@ static int __xe_shrinker_walk(struct xe_shrinker
> > *shrinker,
> >  		}
> >  
> >  		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> > &arg, ttm_bo) {
> > +			if (flags.purge && ttm_bo->priority >
> > XE_BO_PRIORITY_LOW)
> > +				break;
> > +
> >  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> >  				continue;
> >  
