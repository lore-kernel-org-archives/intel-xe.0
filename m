Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CBF606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRW0Rojj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215731122BC;
	Thu, 29 Oct 2026 13:26:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC901122BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280389; x=1824816389;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=iqtNcDlgsWhyyTJCQDc8jYD9G9MHGdJRj9Su6c3Yp28=;
 b=hRW0Rojj0QjZ7/8iNWKJG3F7PaKkETI34OubHHCJVbaLSHSEEZlwnIuB
 yS2ZsCOmiplHAtxnskHGMVfB1YXhCX0T5VEruXjejh2J8ccvPmAXbce/j
 v7YNL5GJtThhcitkrbsJ8FQIn4d/M9xSJiziEsH9qNYHi9BYJ0439kb9g
 7+UTOn7quZBzUxAhsifJKXUzk0cYp7cSRzD0rR1wPJ6JVoAmP/pqyoBZM
 BuHpS5efjVvoAJ0F6KFO9AqilpPq/sQF0MtegcwWLaiKX8po7nsPbBQ2i
 /KW7C+G1OU7yW7xGKPt0qsnTQ7jTkwfNXFo5bmYcTkHYNxCVTqf3bZ7q8 w==;
X-CSE-ConnectionGUID: 6jqhLMmvT3i4Jv2/FS24Vg==
X-CSE-MsgGUID: lqPXouK3SCCgkoZT1KtHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2115531"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2115531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:29 -0700
X-CSE-ConnectionGUID: 9J3w0sbVQk28VYeIsFYHfQ==
X-CSE-MsgGUID: xq5s5gk8RpSjnTDuuVWNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5223545"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 06:26:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 06:26:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 06:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISHOWwQ1EyhAYB9qzhWHAxd1Nlv0NmyfELsTQoSwAtIlIZe2J5fhJfEAEPlf3uh2qMR2HFigTv5F1SF4G6gVVAoGO4RuE1rSAC0xonNd8HkPRkMb1yA53ZVPCwkWLH68PKkyX2kOSOT4C+4IKkmJEXJPv3OJPENBS2nkqrm+g1ux0qEBvV6MT3BlsmKJ0KLbV8qEQZmb3SZ6/2DcxBoACJNCwFgdetqoBIuXrL8XPIcl8EkVidu8i2qP2npOuMRT2f7cggZEJiIFQ0RFPhr2/xMC/IV08z0eXgGV0JKiZMW4OgqmhgZeEVG3FvIbVFhH2dj6iyfj4Dmb3T9E3aDkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PKJNW/GfngERy0iYNZ9zDQ2hDrETbqgTwd7RFlf6s0=;
 b=cz/uAnX8pDGEXjmMCX+2zCoOD5JV9zabWoCQpFtM2OQzIZxhETRtv405DQ9Phajt+WRPX6FDsbtO5MxX0k8ZZYMhMCXUgRA0e9NIRs32/TmEExVdVTOuzXtV0p2hrRpfp8OdsEcMI8tZQGJki+bqhKqBexN2h0BNx7Fl7WxxudQYG6QHMYm0atkZuNeiQIuqQUkzY6cGnFdYxB1wCXQbVaCILzcXk+FLE25yqRBKMTmmF4TLonLqJMNyFB3XcyEuFwBgnElqcji213XmEWgNPVJxvNF4KVkcIHhn9Fy8VykTVSieks4WmABt5F2G+QnjZmB42DxGT9qLOtf+pr4stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:26:26 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:26:25 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Store GMD_ID subunit during GT init
In-Reply-To: <SJ5PPFC0624F2CAD01B6A7902A7CD5538B2826E2@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20261028020554.390714-1-pallavi.mishra@intel.com>
 <87ecd9mzbt.fsf@intel.com>
 <SJ5PPFC0624F2CAD01B6A7902A7CD5538B2826E2@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
Date: Thu, 29 Oct 2026 10:26:21 -0300
Message-ID: <87ik2kpria.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8172001f-6b84-485a-d1e7-08df35c03b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|261021123027099003|261021121427099003|56012099006|4143699003|11063799006|261009223027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|261022113327099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: g9++EObeZVghf6HZT86PS5SL0XJj0aTHEwdae3BxsoTBNcyVFbvXqsMdjGmBhhMNzTphvnPNRSP/SXYoXDJhBv50wEiMbc1NAKzHncyFvrteKopUrF7k7yI2OYx7QxcYZ9nxKDB/s6mnkz1N8IvrgQBbDWpRFTfpquj6/9ahc+5FaKAL6PFyoPsEKjSR75Bc3E3IqJfQSCn0zSoLFzFAJkC+/TweRYw/qhD/3iffYPMeKM5ObzcbrKABvwt3uO27gnXkFFFvuybh4bZ2rntX/pjjNMzLI1hrsOlRI2okCXwph2bgNDIpoFBd6hLCfawLkXo6pVapr7MAxexo0g8z13WFXcBH2x7lxqDuvQYfRkj80QfzwRRknEKW+/TvGgE3U2GCD0czdX6Iby/5RdNxmNNFHiKoX++bBaNQajEq/gAp10TR8YgyJfmWE/uj5Z5IxSqhPJhyt0PbrtyooMyGmbsU7ZlaQ0zHjJQm5Ttal0CsPUpwOwYNsY8CpmtGpGyDu2vWX/RrIqqU+AjW2FMHAH1EEbk0QlQ6x/vtOopm2NnKc6ST/J9FbYPF3tjSiKxQWN872hUywVFEDNF9VU94mGFahgdyEnRfbLVa3o3in8E9F0wAiZe10UsmYk8URqNGkiDe5Esf1NomWSNJwCr0VoknCtkG/UYFkYvUn+FmRzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(261021123027099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(261022113327099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQGx364UvIrsaMMPCR1d6SeR2pyxP4FgX2xP1PnDkNfAffoXV+LtTxnhwudl?=
 =?us-ascii?Q?JwjxnyOrW4ksUgkBsYXuFtBMXixjpn7tNA3xeii0sF6NzZPep9n0Uq/bfSAN?=
 =?us-ascii?Q?Yw0FZgv72GL9Ifvejl44h6pN7/48R6JXCfhpzS9VTR+qa2aKJsGvBtYR63n3?=
 =?us-ascii?Q?jMuVnUvbLitogJF3tdEBPP05XzCsC/fHgP4T32GM5nr3c2ObKAgUN8aOl/di?=
 =?us-ascii?Q?0rE5IEhKlLhTLPjoAZe5pyr/6/4+zg2AIt5RbMFhB7ScgC2D5MgqWGNRITkC?=
 =?us-ascii?Q?IuQlbWUnCmEcCJW+VQh3yC0ttXHHad7W8K4lfXzdeKX8jmkiC3TC5Oxf8ib9?=
 =?us-ascii?Q?ni1eg36yZ1DyK+aAqa0MObQA9B9yvY1rddfnLqcD7X9Osl82BHR84YZh9seR?=
 =?us-ascii?Q?wJKh9Y/VGGb+ZXzov7Whhsh97IXoI6QNh5Vdy6so1ZVVBxsJu7Rti4E18LnO?=
 =?us-ascii?Q?vpKPuqlh66xBGVQOqEYjeGjEBLuFX6674JsIc0KQsDvfExWvfdxj6Y/7NG4v?=
 =?us-ascii?Q?b+kbzg8auEY9VO9kB9xM6OD9Bv/sBJLMJ6x3AFdK3TWmmaFFOtCSP89f06I8?=
 =?us-ascii?Q?8Sb9qXEk1YebnGiFKO5eBzR0vOEJH9ZjbrqmtPZz5Dy5Ny6XD1YqauMOevD4?=
 =?us-ascii?Q?c3SgGkPAaLDV+2aqV1S1/3YtDJsGXGwrrWJ2yqZSMXNjERqm2v0q/dhYHQex?=
 =?us-ascii?Q?m8nbi2opb+fbANWJZysdY85KbV6SG/zww2YLCMo/lf/LpG9WMGyq//00Bl6y?=
 =?us-ascii?Q?x0c8baeK4OUCshvhTzYPeD4PBCyT+OIqQ1rDccwhkjxhH2SL3Lklq42MUxPD?=
 =?us-ascii?Q?ss0fj3hIbXcxqMgc2zNbloKs+J++LpsbznSA4LbDxXEcFyzL56PuPtbdrAh4?=
 =?us-ascii?Q?Qz2INVsLw3/N9g7u/YHLe2iMSrsYUeZIMlqGwCcAMnrCxCNwKlwOiZWa4LXh?=
 =?us-ascii?Q?tO67rQsBoxLc0y4kn/8pqXTnap2/qgVxZmi8U/Z8TD3ESnUHrarj5LMw/lBF?=
 =?us-ascii?Q?dA8Ogs1z3z4J0GaE97FV9NaCu3Ojz+FkZRSAE0NosPoJkrZO1RbYie0JvbcY?=
 =?us-ascii?Q?iHaUFnm2rjlr6SWTs08wA7WbUfMdt6zN1L29cYEaBCV/sdXAmI8pIrOTRYwK?=
 =?us-ascii?Q?oSGNvyAl6HSSeCtrljd1CY1vJUx5i1jYGBAUstfxUQDOtxBJRW29wx9c0TKO?=
 =?us-ascii?Q?Vo7/E403RRz/4D5I20IKVnhRjk/3yVCgU9PfQbrFSw8mHIZ7XO3WP7L21JYO?=
 =?us-ascii?Q?c9k7QFvCSz5DDi1NQklSXHelDJ2s2pmMb6w9XsOQscF5FzlBTa2Z3QJOzl8l?=
 =?us-ascii?Q?c0/Bpn5Q4n1KDyG196nuysEyUBAs/SseMyFG74vW8I/BmU3pr5kzAxKF0UQj?=
 =?us-ascii?Q?yB6B1e+KtzlqmKxLgXgCg5r5v/Sca3M3jLicDruN0EeNQAr6H+0vHcmwEm/X?=
 =?us-ascii?Q?weQt5hfUTEatcyphWQp3D35wi9UaAT8mGuAEcQmE2wKZF3yF0WZmiG+AHgOi?=
 =?us-ascii?Q?V9ketUTtiBVelpeFjZXMEOQzAywWhKoF2PwI9T9VSuveEZcfeN3L/ZYxblYu?=
 =?us-ascii?Q?2rCRTYvbU+dN3UWgQkYR2bQAKdJdgM08m+Pbg0lsccgmyuy4UrR2HB7UoFXP?=
 =?us-ascii?Q?3Woii8wZc9SAidIIG2gXPfQTAUNtC/YK+LthxalJG7GWxJ865Yge8ChwNhJ8?=
 =?us-ascii?Q?s4U+rCUUm69+nnLnTSrxjWPy4yXpj6PW3D45tQIyRwjuc4f0GBZ4xiqE1P/J?=
 =?us-ascii?Q?upkCenKSTQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: lOhrARIuMp6wXnXXMNNq6hLUoln5rGBY6DXGLWkgI3rWHfFFaTzOsl3cI/iODtd65mnVGZMzOZPrat1dSTbq3CyrAI9FgDGIEvD70/sy8WHLu9Jz6TqyFc0qEs154qN1suveoT6evmy3ZlPGk5gBnIyFFuZCjYQIqq5cEJ6cN/k+DZRjpp9MXTF2hBvpqawS3c/7goXUQnoHNA5nNvGZYhEg+aMRLGc6cclYmXXJi1+wISgNsyJCV1VFeVabvE0/XN6Evbwvi9EEFDaefNpvA1U1StGQGAnOXjYiV4RmSmlWlgMEZuLokiQpkkdkTxFqeQ7avYVIbWqpWd72uohSgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8172001f-6b84-485a-d1e7-08df35c03b08
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:26:25.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj1XKTOQf80+VGWzBAsMp1kPt7/RFYgP6dTTR6gPWKETQjwqoqJlykPjA++Mj1iGzRzhE2FYy6tEMk0HlvT5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mishra, Pallavi" <pallavi.mishra@intel.com> writes:

>> -----Original Message-----
>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Sent: Wednesday, October 28, 2026 11:53 AM
>> To: Mishra, Pallavi <pallavi.mishra@intel.com>; intel-xe@lists.freedesktop.org;
>> Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/xe: Store GMD_ID subunit during GT init
>> 
>> Pallavi Mishra <pallavi.mishra@intel.com> writes:
>> 
>> > Read GMD_ID during GT forcewake initialization and store both the full
>> > GMD_ID value and the subip field in gt->info.
>> > Keeping the field in gt->info provides a common source for future
>> > users and avoids additional GMD_ID reads.
>> >
>> > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_gt.c       | 20 ++++++++++++++------
>> >  drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
>> >  drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
>> >  3 files changed, 21 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 60d35ada2853..39ae7105aaa0 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -564,6 +564,18 @@ static void dump_pat_on_error(struct xe_gt *gt)
>> >  	xe_pat_dump(gt, &p);
>> >  }
>> >
>> > +/*
>> > + * Store GMD_ID and sub-IP before GuC upload. Main GAMCTRL
>> consumes
>> > +the stored
>> > + * subunit field during upload.
>> > + */
>> > +static void xe_gt_read_gmdid(struct xe_gt *gt) {
>> > +	u32 gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>> > +
>> > +	gt->info.gmdid = gmdid;
>> > +	gt->info.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
>> gmdid);
>> 
>> Why do we want to store a subip field? Shouldn't we simply use
>> REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gt->info.gmdid) when needed
>> instead of adding another field to the struct?
>> 
>> Furthermore, there is some exceptional use case for the "subip" bits on
>> media version 35, but for other IPs they are tagged as reserved.  As such, I
>> think we should limit ourselves to treat those bits as "subip"
>> info only where it makes sense (i.e. the current approach inside
>> xe_guc_using_main_gamctrl_queues()).
>> 
>> --
>> Gustavo Sousa
>
> I agree that with only the current caller this does not buy much over REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gt->info.gmdid).
>
> The intent was to read the subunit once during GT init so later users can share that value instead of each time extracting this. The interpretation would stay limited to the media versions where those bits are defined. Elsewhere they remain reserved.
>
> That said, I am happy to drop the field for now and add it with the next consumer if you would prefer that.

I think it would be better if we made gmdid a struct rather than adding
an extra subip member alongside it.

Bonus points if we have a follow-up patch to stash the GMD_ID value into
probed_info and then use it to initialize the gmdid struct in
xe_info_init() instead of reading the register again during gt
initialization. :-)

--
Gustavo Sousa

>
> - Pallavi
>> 
>> > +}
>> > +
>> >  static int gt_init_with_gt_forcewake(struct xe_gt *gt)  {
>> >  	int err;
>> > @@ -572,6 +584,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>> >  	if (!fw_ref.domains)
>> >  		return -ETIMEDOUT;
>> >
>> > +	xe_gt_read_gmdid(gt);
>> > +
>> >  	err = xe_uc_init(&gt->uc);
>> >  	if (err)
>> >  		return err;
>> > @@ -610,12 +624,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt
>> *gt)
>> >  	if (err)
>> >  		return err;
>> >
>> > -	/*
>> > -	 * Stash hardware-reported version.  Since this register does not exist
>> > -	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>> > -	 */
>> > -	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>> > -
>> >  	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
>> >  		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt-
>> >mmio, XEHP_FUSE4) &
>> >  			CFEG_WMTP_DISABLE);
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> > b/drivers/gpu/drm/xe/xe_gt_types.h
>> > index c00a7c171f80..c67fb0d512b0 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > @@ -153,6 +153,8 @@ struct xe_gt {
>> >  		u64 engine_mask;
>> >  		/** @info.gmdid: raw GMD_ID value from hardware */
>> >  		u32 gmdid;
>> > +		/** @info.subip: GMD_ID subunit field */
>> > +		u8 subip;
>> >  		/**
>> >  		 * @info.multi_queue_engine_class_mask: Bitmask of engine
>> classes with
>> >  		 * multi queue support enabled.
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index b1f4e132fa0c..37d72ce1d589 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -1864,18 +1864,16 @@ bool
>> xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>> >  	/*
>> >  	 * For Xe3p media gt (35), the GuC and the CS subunits may be still
>> Xe3
>> >  	 * that lacks the Main GAMCTRL support. Reserved bits from the
>> GMD_ID
>> > -	 * inform the IP version of the subunits.
>> > +	 * inform the IP version of the subunits. That field is captured once
>> > +	 * at GT init and stored in gt->info.subip.
>> >  	 */
>> >  	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
>> > -		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
>> > -		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
>> val);
>> > -
>> > -		if (!subip)
>> > +		if (!gt->info.subip)
>> >  			return true;
>> >
>> > -		xe_gt_WARN(gt, subip != 1,
>> > +		xe_gt_WARN(gt, gt->info.subip != 1,
>> >  			   "GMD_ID has unknown value in the SUBIP_FLAG
>> field - 0x%x\n",
>> > -			   subip);
>> > +			   gt->info.subip);
>> >
>> >  		return false;
>> >  	}
>> > --
>> > 2.43.0
