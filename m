Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC626606A32C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAKGXLNX;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FUC7Q0b3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D66310F77E;
	Tue, 17 Nov 2026 14:21:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07210F77F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794925288; x=1826461288;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cSE2i21WCufL6JuzA8rSveK6bh70D3QM8X6NzimXIps=;
 b=DAKGXLNXDPeY+RbE+uqyd0zmkVOV66XvftN45tP0nqq4Vuk4QyKOgY/S
 Zo4eIKyHUL1dWQAMfkN4re9grmpp5kvZTW0Hxc1SuVFrLqcpAaey7SMbP
 T67mr7bVzpzWtO3AsA7In9fixr4RcjRK/nUAnMnYPkOw0yLGFpCHNBpHF
 YsIy6qBW7RIgSdh3sFj+gfXfQHGfPQsg6c/YzIEGg38+w3Z0lZJ1ay3d2
 WfSRpTw0FXb1hEKgf+i5VuoaL8u00DZMXpLyaoR5r7pHd5LVVKudJKG18
 o47AX9wA+EUOqgBZ4Got35mV94sLiLAXed1A5F+Yrhq5ynM9vBKgd6l+i g==;
X-CSE-ConnectionGUID: 83NUuU9mSHmBj2vDnvYQ3g==
X-CSE-MsgGUID: zjKrlj1yThy3N30YNiwvLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3611451"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3611451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:21:27 -0800
X-CSE-ConnectionGUID: Yq+/vfSERdi3mQG59T7Seg==
X-CSE-MsgGUID: E/CfsOQiQm+5RV+xa0Lvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9755319"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:21:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 06:21:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 06:21:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 06:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bb1zMQnL6dAXfrgG5SJIFxRpT/AXHjzwdxUwp0m8RxJsgbpzjdQppaabFP9q/KQBBSEFrcgWRY8IKQArVY5fMn9O8RLzwp5mAMroEnqLbb33pM0rSl+EBW/Kwy+fb/eCvx6hDsbDG7mZ/2XRJihgatfAETwva73Mhge0HKDCN4+lU6DEhy82+PaGiDSURmNrbK1hhy6a1H8zTSYizQlyzf34PuJnayPw7CLhJGu04aARRXThNkOP5KMSEklZk6SdFCkKWa55c0SCWNz5j9rSIGZiVd27VkNznbgwU+csfjJtjbfvWs6WzpoohJIgvLdjSnJRZ5z5459z7RBElNIRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uWOswujUt0qXryKjfTxxbxh+TOKspcRHtqLZO62oNg=;
 b=T/FOLm3/AAOQadWQgeioa96v1p7U9mLlzeUT29G7/MjGB+fuy8cZ675lPWTngaPdRWCQetI3VytZ1Jsi3EvIX6qP29z0x39+hdu9uo2Y122w2IQroJuUF2IRYz5KA94KZymvDT3eA6wYQaSnNyD1ZWGxDpb8oEGeFadtbCfGfuxs1iOQJ1YX/phXQcrv8x4QLrqriddm/p/VYO1G/9iHznrZBTtp1FOwGkbMRHsKlcdsKi7WcEDgnbXjJJOQDYwnu+MIRk8JR/88RtfwumYpOJLv3vbFAQmwly2Rxa6KDoRrYcFIy7Nv9aJk4VJwSQj2YY2Gg9oT8CEQKHu1WKurIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uWOswujUt0qXryKjfTxxbxh+TOKspcRHtqLZO62oNg=;
 b=FUC7Q0b35rEGAzmE9gyG7PwN0FCPQm1fxiGZjlg3HJSYmzu3fbNA/TLXpMuL0Oee1oUrkmHc+L1ul8XrDjuo/+15RLv32YTh4Z/RwezdAaO+qqAt8QKx7NweCnS4oIAjr9BMaGwShkgutDPtxWf1qoN68APEMYVeQ9UwrxX0QjE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 17 Nov
 2026 14:21:19 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 14:21:19 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Store GMD_ID as a struct
In-Reply-To: <20261110232328.842758-2-pallavi.mishra@intel.com>
References: <20261110232328.842758-1-pallavi.mishra@intel.com>
 <20261110232328.842758-2-pallavi.mishra@intel.com>
Date: Tue, 17 Nov 2026 11:21:14 -0300
Message-ID: <87se0z7d45.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f88c4c-16ee-4daf-1d92-08df44b60c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|4143699003|261021121427099003|261026121527099003|11063799006|261022105027099003|261102123227099003|261009223027099003|261026140227099003|261021135927099003|261022075727099003|56012099006|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: RsuBLIvJs4CawwZF4VXOsq5qzVuRVhfKIlGM9jXNlCUrTT5KWjgAWjtnsvx83TbDIYUN76EEIP4BABFRRj9d0CIDs+3S/t98amdMO257epFqxOTty6kVGDkXIqCm42Jh2gaGhh5we068IaAiGWnMuVXu1AolezxaOak+r/cKRLWq3uuvKpBDuolsGbCrG5qiBoVcOoW4PPCc8UvYawQmfRe2wBQc2iaSAiVx12ZjHyaMZt3XNmB1aJiTDdJ6ZJQ2jJBezv81ne20iBQds1dsNNMyn+7QNQFNUe12log+UqcwAPbaC8zU2pigw9JvvWpWsTs2ocTuFidqP6oliWAFn4GNg3SulZ5wuz2ELl2k2bCnKkHaKlrpqt/RNBw1MSCfMefOaEWIurt7xlQIquFw9MWcdmCwdXbtBjmgppx0wZrCm3CSG03J3vj6c3yJsT+9hTYsFHiBG1gp4x1wt7sFhpwHJhvBaK2iKEgVZ8QxrVM/AKjjRZYHEL/B/Ue/G2PNQ7P66y7dEOczA/sfamQvHp1GWp98Nxz7AtLXYGYaQtP5A4rywajowWGe3lXRD6FPSfLuElJzpJ8deBHlfz8A5/Fm+zzIIvPSKkva0yvoPj1dHDOH2FCTdL9rM92zZiEzHS6smrknOWWHMiKF8Qu1E2p588n0nnjXfoi5Bp+o6W4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(4143699003)(261021121427099003)(261026121527099003)(11063799006)(261022105027099003)(261102123227099003)(261009223027099003)(261026140227099003)(261021135927099003)(261022075727099003)(56012099006)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3UuKzIkwcgjELLjNnw5u2xm40efrYijEOz24Zbh+fEH8r3XrJtzK/1vQBD96?=
 =?us-ascii?Q?7PEdaUm9QEjt9gL2VtC74wx/r0Mt18lM2lQH8iYY8zxAhUYT0VjPbJXtJGE6?=
 =?us-ascii?Q?qu+56cWJKhxcQj2XLu3n2bSO5vGKr6+UmbpQuDL2BA1PqClPguKGyRru5Sxl?=
 =?us-ascii?Q?gnCQ5OWLBv9/YWe8vTD/G5Xz5UBzcdBAyjjxuqg0N/yW2ePfBZoUBZZRovAv?=
 =?us-ascii?Q?MDmH4XL+r6IIz4+52HZPKFMOE/iLN9EBxgd8aXSWPIMePiVuaykK7bUcGQs8?=
 =?us-ascii?Q?potI9dnUKLMOddfjBv9knxSCSXbuaBwo4cENvG8EwJYpVEeGshMCdmI8By/p?=
 =?us-ascii?Q?rAh0j2qoRMiMKFYHXvHgajT2u6ZJtgczU/QNnV+Rll7BFr/v/kdhFB8UZ0aV?=
 =?us-ascii?Q?CzTdF4Co7uzIgHe+hI+gxe8OpcdadzfxN2yBZNRiXgBg1g5Veyt8ivjs2iqG?=
 =?us-ascii?Q?u4SV8Sycdj3B3HSEsxbZzF9HDb8tHa7c8Xqe8dN3HTbSmKdy7KQr2pHP1kzI?=
 =?us-ascii?Q?Xa62lJkdme6a/GtNSJBJ+BQIEVg/S8yNxW0lHdQYrlHcDwn3LXibKW6wxk78?=
 =?us-ascii?Q?ga9FMufaBfw8+mcjbg2BjaZLk3iThKRxtLq0rFsP17hRh/nBUk6uOJ83gs9W?=
 =?us-ascii?Q?zQl7wI4ZnNtseqG97V3gfy5nLuVe59lMymdeb5DATsGUO7Z/fxUctasqlHDV?=
 =?us-ascii?Q?lS8ti8iI/khjS7mptQHUSvRgPbMnILNoyMt90jV8Ay75fLImKZ5wYIR8SXsP?=
 =?us-ascii?Q?vJKv5sjkGoPzLIQIonl1NL58CV4V8c/MTUECOQWJQ55etevwW3k90N9u8K2p?=
 =?us-ascii?Q?Hppp/naHcA1xHWAJnQm4fk6qq8uPkkIbsGiU8WTumFvicYHUQw38o+94FEaV?=
 =?us-ascii?Q?iReGXt19tSrYtRzshmU/zl/SF4+ssGftjwAaldFEVnxxoVxlJNCuoCF//a9Q?=
 =?us-ascii?Q?uV2fKwybxSsvteerIYyMdz4bciWrMkkkHM6s3zfjw6APtheT0owa1c/BbWmD?=
 =?us-ascii?Q?11bbr/uPQKewdRdt1bOeT2Nn0Zh4S42gbLhqUV7C+YpwfEBEjvyQt9dnhRJT?=
 =?us-ascii?Q?sd05ugo761fsr2g/gd9LyJNxysq8x47mVamI7sJ1w/2fnExix4uwyoMXCRew?=
 =?us-ascii?Q?0y0IsFKTQPWgrq/8f7F/noxub2zuJVQ6D2+2MGIJQBWkiwhyfx3vwei5YxR5?=
 =?us-ascii?Q?wO6NrxpCG61pbnre9r/rKB3PElYFisuAeiCR8wnKOXifUOonsqcJ9p+H/Y3m?=
 =?us-ascii?Q?Ugn0NZmc5MMiO7zqfJbEZINOz7KSwOTmpYqhlnQ2BiZ18HYo0lSgf4/hS4q0?=
 =?us-ascii?Q?bo+AUL20CFInU5KSkJEssK21AsDrDxoIpgEoZwIUro6aYP+IKIvQ9Jbql4fY?=
 =?us-ascii?Q?CFqhkOm11B4ftMrpxIMY6aXnzrQbLFeeOkhNrIvFGCaySS4Hsd+87kLG/6KW?=
 =?us-ascii?Q?ZbsnoyEG3DeT917mX4JKOEp+vGfZN/0P5CRMbq7jtWRqk32aGUAmN55fzJpI?=
 =?us-ascii?Q?3ZJYZG0gbVSvjXE1TuPtu7DBuQ88f5xuBgYBwku/B/0hkE6uIjvM9LzgxyvW?=
 =?us-ascii?Q?LaRn/1FVCflNLO4QfZTC6J0EbPvEIlnuN4HkaekcwMyVYCSiCy4Tms/Rndm4?=
 =?us-ascii?Q?C/OwEIz9da6dR2jjxODrQAKIkRc5y6djlKRVcyalQLpbv4EOXsmHGOq7szxP?=
 =?us-ascii?Q?keuS2PxwcA+unXIV5PFl3RLmNwqGKquUg7g1sLh/kIU7JHr2SdixRKpNKJJp?=
 =?us-ascii?Q?ovjIq7/AMw=3D=3D?=
X-Exchange-RoutingPolicyChecked: gwLi9EVclbuAsAs/R47oep3qrB7nbA+x20CTQPuPZA3FtG+CXdhDPUL8wI48JjV0rvvFdjMBEpGP4JlLN1Z2eKwjyWeSfaJ5RbkGIFvMgmPaJtfgaMYBBGCNpRpP4zvYTg+viUle0jsmqDqpwKKE9vsFMkC41pQsSfrBBMCb88Fj9/nJ+ZVeAehM83y4n822hzYpvb5Z9yNdGBEV5trc11sTh4LJNRdZBwvpgf2fKXAXJhNGhxFQi8XgkOdGhgUUbWsyX1vWUfRU0cjBcS/+Icf0sUuwQ2gbmEdNNdW19IPFcRfhAX+HMBXoD46RkzbLyBMvq6DcN1gDwxuVQNWRFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f88c4c-16ee-4daf-1d92-08df44b60c0e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:21:19.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZopykkPXh3p1Ch/05B9DU2Xq0hwmUeNJoo1NR4IaUCDKEGfk7dhfolJKZ5IJDeAu8JrI1mt7fSUQMXiZoItFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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

Pallavi Mishra <pallavi.mishra@intel.com> writes:

> Replace gt->info.gmdid with struct xe_gmdid so the register value and
> subunit stay together. Read GMD_ID once before GuC upload and use the
> stored subunit instead of another MMIO read. Platforms without the
> register store zero.

I think this commit is doing 2 different things and could arguably be
split: (1) move the read/store of the GMD_ID to an earlier point in the
initialization; (2) use a struct type to represent the GMD_ID.

Note, however, that the following patch moves the read/store to happen
even earlier, making (1) unnecessary.

I think it would be better if we re-organized this into the following
patches:

 (A) "drm/xe: Read GMD_ID only once", which would, similarly to patch
     #2, would do the reading of the GMD_ID values during handle_gmdid()
     and assign to the GT info.  In this same patch, we would also drop
     the extra reads of GMD_ID to use the value in the GT info.

 (B) A follow-up patch to turn the u32 gmdid member into a
     struct.  However, as I mentioned further down, I'm not sure that's
     much better than simply using a u32 value with the correct
     REG_FIELD_GET() calls.

If we follow this suggestion, some of my comments below might not apply
anymore, but I thought it would be still worth sharing those
considerations. :-)

>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c   |  6 +++---
>  drivers/gpu/drm/xe/xe_gt.c       | 21 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
>  drivers/gpu/drm/xe/xe_query.c    | 11 +++++------
>  5 files changed, 43 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 273e2c45fea9..36d659b4eabd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1321,9 +1321,9 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>  		drm_printf(p, "\tType: %s\n",
>  			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
>  		drm_printf(p, "\tIP ver: %u.%u.%u\n",
> -			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
> -			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
> -			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
> +			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid.value),
> +			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid.value),
> +			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid.value));
>  		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 671b87f1b9e9..becc82566457 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -534,6 +534,19 @@ static void dump_pat_on_error(struct xe_gt *gt)
>  	xe_pat_dump(gt, &p);
>  }
>  
> +/*
> + * Store GMD_ID before GuC upload. Main GAMCTRL consumes the stored subunit
> + * field during upload. Pre-MTL platforms do not implement the register, so

I believe the first two sentences are better suited to the call site
than the function definition, since they seem to explain why the function is
called at a speficic point in time.  That said, I think such an
explanation in the commit message should be enough for this case.

The last sentence could be moved to the xe_mmio_read32() call, but I
think it could be rephrased a bit: "Read GMD_ID unconditionally, since
pre-MTL platforms, without the GMD_ID register, will correctly return
zero."

> + * the read returns zero.
> + */
> +static void xe_gt_read_gmdid(struct xe_gt *gt)
> +{
> +	u32 raw = xe_mmio_read32(&gt->mmio, GMD_ID);
> +
> +	gt->info.gmdid.value = raw;
> +	gt->info.gmdid.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, raw);
> +}
> +
>  static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  {
>  	int err;
> @@ -542,6 +555,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	if (!fw_ref.domains)
>  		return -ETIMEDOUT;
>  
> +	xe_gt_read_gmdid(gt);
> +
>  	err = xe_uc_init(&gt->uc);
>  	if (err)
>  		return err;
> @@ -580,12 +595,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	/*
> -	 * Stash hardware-reported version.  Since this register does not exist
> -	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> -	 */
> -	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> -
>  	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
>  		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
>  			CFEG_WMTP_DISABLE);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c00a7c171f80..7bfcd806aac6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -120,6 +120,19 @@ enum xe_steering_type {
>  		 const struct xe_gt * : (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
>  		 struct xe_gt * : gt_to_tile(gt__)->xe)
>  
> +/**
> + * struct xe_gmdid - GMD_ID register contents
> + *
> + * Zero on platforms that do not implement GMD_ID, matching a read of the
> + * unimplemented register.
> + */
> +struct xe_gmdid {
> +	/** @value: GMD_ID register value */
> +	u32 value;
> +	/** @subip: GMD_ID[13:6]; subunit indicator on media version 35, else reserved */
> +	u8 subip;

This is similar to what was proposed in v1 in the sense that we are
adding an extra member (namely "subip"), adding redudant data that would
also be already available in the "value" member.

If we were to create the struct xe_gmdid, I think it should have the
separate members.  Something like:

struct xe_gmdid {
	u32 revid:6;
	u32 subip:8;
	u32 rel:8;
	u32 arch:10;
}

And then use the right REG_FIELD_GET() calls when defining its value
(I believe assigning the register value directly could be problematic
because of endianness issues).

That said, I'm still not sure if this is much better than simply storing
the gmdid value directly as a u32 value and using REG_FIELD_GET()
whenever needed.

Adding maintainers to the discussion here in order to get their
technical input.

> +};
> +
>  /**
>   * struct xe_gt - A "Graphics Technology" unit of the GPU
>   *
> @@ -151,8 +164,8 @@ struct xe_gt {
>  		 * See @user_engines.mask
>  		 */
>  		u64 engine_mask;
> -		/** @info.gmdid: raw GMD_ID value from hardware */
> -		u32 gmdid;
> +		/** @info.gmdid: GMD_ID register contents for this GT */
> +		struct xe_gmdid gmdid;
>  		/**
>  		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
>  		 * multi queue support enabled.
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 300126e6624f..9b060aa2890e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1888,18 +1888,16 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>  	/*
>  	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
>  	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
> -	 * inform the IP version of the subunits.
> +	 * inform the IP version of the subunits. Those bits are stored in
> +	 * gt->info.gmdid.subip and are reserved on other IPs.
>  	 */
>  	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
> -		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
> -		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
> -
> -		if (!subip)
> +		if (!gt->info.gmdid.subip)
>  			return true;
>  
> -		xe_gt_WARN(gt, subip != 1,
> +		xe_gt_WARN(gt, gt->info.gmdid.subip != 1,
>  			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
> -			   subip);
> +			   gt->info.gmdid.subip);
>  
>  		return false;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f595368..ec621be77a18 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -424,12 +424,11 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  			gt_list->gt_list[iter].near_mem_regions;
>  
>  		gt_list->gt_list[iter].ip_ver_major =
> -			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
> -		gt_list->gt_list[iter].ip_ver_minor =
> -			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
> -		gt_list->gt_list[iter].ip_ver_rev =
> -			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
> -
> +				REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid.value);
> +			gt_list->gt_list[iter].ip_ver_minor =
> +				REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid.value);
> +			gt_list->gt_list[iter].ip_ver_rev =
> +				REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid.value);

Indentation issues here?

--
Gustavo Sousa

>  		iter++;
>  	}
>  
> -- 
> 2.43.0
