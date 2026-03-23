Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441B9F4613E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 22:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30F810E548;
	Mon, 23 Mar 2026 22:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1h1XSH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80B10E505
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774303884; x=1805839884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X8kcSAGwKxX+UR3/SrHRSDhu4ciSYraJssPf3cY20Ho=;
 b=M1h1XSH73kv2w4Vv0b48eVVssgAp64bnrAkGX3VG2F0mN+hmAxL5D+1K
 RPf6l7LJUMqilFrmEgQzhrxRIF+YwlqMcGvfZokoypV3hWvqDGkcg7DhW
 3ygHFMgparYBouInyMy99goUChbFs46uwtfQX80xPhVe7Gaj9giO2RsEb
 ehvd31HyEQp1O9HUTYsb7OcQsISXg8i83ocMNIiH2IJRls9vObbyKvNw9
 nEUfg3OWpOqtzN/Nlu1ZXQsJAFVHat09U6EjlbSSDQKxPAY8kbgIYClJO
 zCJY8BFfupwYQ/uoREgmcy2sg8Kag/5XleTHJyDCPvbeAePMAJl8i2c94 g==;
X-CSE-ConnectionGUID: i4eWMdUQSfmPKLnpkzQqEQ==
X-CSE-MsgGUID: RRdowe89Td21ml6kNJLnxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74332926"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74332926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 15:11:23 -0700
X-CSE-ConnectionGUID: +rSEeZZcSHK1nMf4MqWqlQ==
X-CSE-MsgGUID: oBD6fc/ETAGBkHvlBupjgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228223064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 15:11:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 15:11:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 15:11:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 15:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6vusZgUfxx3oF7KjbZPAbBi28zjVie9JTXxJYFnZUIvpGp8B32WtCLsGH1j8l1PesgT3md8lS6PoDcJo/OCgXvr2OUkXFWvkK4ai8TqqoPp+7PdRe+mgOQffv8Y3PhNMC+92BqvkA/e7nf7jx7J0MhgpJaRFlo/1p2mzCanyoSQ2nR6ddLr5AtiTp38vMeK7Fo1DJPy7LVBDmOgJ+zLjQmDDNIFpmCkC0rGWZvi1cDvlZnWIwv/QTODPtOH24RTMVVPdatPGFwUady+Qm4cGtFs6Uksv4qtC8HBpWdX7Mdxsa5NWxU6Q0wTwKtXI6rCseBmIuXZ1rCwDjuyB3B3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV1LdC0T5avTgEFyKzyf0pYFGA8tOannFOyRWP6GDCY=;
 b=Cfh6CfTc5JNqnnh2By0d6WvgwUiLH4FmXWPB1B7kPLNA9IghzhhYqpl3HwJxKZ58SvlNZpEoKtN+ocviUeG6bKb19sgMaq9pz8tTRDe0ZpBRV50HUO2vpABMNiJy81KgQnGwV2MwOe47/YzMm6zIZhR6A1bFZ2CzlcvzD/s2UJkUlqM59s+n0BvPI+wdr1S4WvZXxe1bLKE8lzSSrVtUHEf9VGwytNO9wVIZ7YspcDAOHgyx1Z2peyt1bpFbf2oms1/Tkn3lmoYEKQaYo06lx/xJ2ATehBBK2gPjuUJ4d80VxkW+Wfo59s+8FGyThmZNK10fL0L3u2j3RK1D5dMt4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 22:11:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 22:11:19 +0000
Date: Mon, 23 Mar 2026 18:11:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 *AuxCCS handling and render compression modifiers
Message-ID: <acG6g7YHbhcnszY9@intel.com>
References: <20260320170222.88625-1-tvrtko.ursulin@igalia.com>
 <177411552592.383330.15034042570807454170@a3b018990fe9>
 <8f60fc5a-d779-47b2-b007-a4cc59e6a338@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f60fc5a-d779-47b2-b007-a4cc59e6a338@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd56b8e-fd56-4356-729f-08de89291c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: quOyGV0WBjx6BBb/iuV0hMRT6GsoMgRPoeO/AEa3uDDWmMPdyHfnH+FKwPKO1hszvd+/JbnL/KOcFi/JEYbfdcUGGLop488tLbl/02Gl55bJZ/ukG0t1gDwtTRDlOVDLnYj00k36fkCcDR1P8E/ob0BbJrk+magDKf9MQi8BR+X4/DixaXYlVf4Z2KOdNdKgOz1LIKR3oUXLPiRDvgD+cj6x09P6Q2lOeT+kJFFyOyzi+xWr1BvxMOI0FKKCJzELpNQS0fOON9G8bHQl/Q3rf8w0x0z6eeU2BPNMbwQp1RFxK70cKYsjU//rhyw2RM73A7mQq6cYep5qIc+dej4kwI3SS8S/BxYw+NHKxe/myoJIgZ7GZ7fN5DLsYRsiZBDhHTYzGNsA+qV+tJX37rbVitStAzkw4HDaihsRkMWgSkhs/fh/AtgCiqqsfzSv3MdUY7T59KYBk9dJbcD+Ay3d1wwYRm1s5c8wvZ7ky3Uo94vu+QF9vVy/mZv9pR2Xuqr4EpOXOlzBsi4X+iiDwG/GadVqCB8n6gfdb+DZ33myoqUsNGOtgVCN8RbqIzpD6Y1yk985usNzEFuPD/UmasXrzMDCu9MfhXADPuprsxXBEirgIfkuLhlNw4CKGdBfGZj+UwAPoPy1S/PHkyssCYTqDuNMJ6dGFeEkdcv8GMwfqFz6MdjaF3IT1nakxWZBwyqF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3gTvd8B7A3D92lIm3FyFnP9dJ41zVuZvPVXj3nTC+U8qnRYFmmrxEBNt9S2v?=
 =?us-ascii?Q?If/sj+LsL6ZGwhE4bLiBxDG2FpMjIGGNW3OwI5hiV6e9w853uK6AOcb4LY6Y?=
 =?us-ascii?Q?s3FG4RHqxpalk1pf2pRR8k+Vj1aMhL7B8pC4Z3E2lfuCfRZHklruadOtmvWp?=
 =?us-ascii?Q?whn4HRMuxvtL9Y87R51A0Qzif37ZjxEeMe6EMuf2fF5iEW5pdVlRdUFLz0Cb?=
 =?us-ascii?Q?4PcGhtiZpsrAgiDnj3n2forcD56UqO7x7rtckRlldQfRb6HqmAPY6euRMbkL?=
 =?us-ascii?Q?27gqFEP0k4hqsuc2HB9nPpqoqeRfpbB6t3Strl12wVU3cmGUldYixHVJ5Ugu?=
 =?us-ascii?Q?6WscU9QZsCkiNW4fYezpqTEbZp8ok9o6yQxeemBWIYxJ0nfiQHiZkBwzI4RN?=
 =?us-ascii?Q?ixfFmeyLlVXZzfwkH6GnoDocoufhhQjkySE4cxnP7JF6UUZsx6j/my0RTPkj?=
 =?us-ascii?Q?DrVHTJXKws7Ih0YOkKGasZ379kP959pOeiN+y8VOFv9BK/aL1thbZvrBRW3u?=
 =?us-ascii?Q?xnjpZlKGflGWkiaTqwgAUh0kqynFIaR/rG+Q3vekO13CR4r+IMlVE/3MJYEc?=
 =?us-ascii?Q?reme4sEhu/z+vjhbJzSGxgQS8vCUGE2jDavboRFkuoFBW2c8Jf/t2dv2N9ZS?=
 =?us-ascii?Q?zEuHXggzGuokUjFjjuFAjk1whhZ4s0jGz0Dk4Vme0DJH/2qGGzJTBx5cUK6k?=
 =?us-ascii?Q?cbMTWntsgu1iQDyWGcbOxYfp/0m08CDAaS3sO1lehTW3V0KGiTyvW5adyxk9?=
 =?us-ascii?Q?q/ifsTftO70zyHPadh1HcBsnoCuJ9YRR5/csDPG/ssaJhSmyt8wzjNl2yH+9?=
 =?us-ascii?Q?UUrTCZIwD8Ru5fkWCjAmRkT3Vn6k1k3I/ojYupD8S5s+dp5CU2wWhpsH+Qx7?=
 =?us-ascii?Q?GtWCf3b8SK7fWNa+fa9nLJt6vfb/F0ttl76s55pjTrkDQAX7ck1gk0IT53yG?=
 =?us-ascii?Q?dRo5+SnHop3dPOYv0u6CWlMrEa/xLMra0z0FZqbNS/o0d1Y6Bo1b5Pb4juJq?=
 =?us-ascii?Q?4d4wmKLEBeSGG4FVMTEnaYnNKHb5B598KtthfgFuNL7hW4WBtsDBRah1/j3S?=
 =?us-ascii?Q?tfFkfh0/niQOKGDDgb94MiaPXMo61LuhL89csxKGgvLWYF2FBmegsJDv2K23?=
 =?us-ascii?Q?wX5AjM83dgoDndJ+xfHj6soRPUsMmBRDGsszrdHD7VLbcet7wOE/EFzznB31?=
 =?us-ascii?Q?1We2Izu9Pa69IzNU0fa10nGLlTjbYH/K5+Xfo6FSaUVXcT9X1swhHJT8kBs1?=
 =?us-ascii?Q?CCPlQLdvqKBa/epKLfz3kCWrroeZDSXFVHIzz5Tx7WXxz6+tvmTAuQn6cJ4N?=
 =?us-ascii?Q?q9IG+PFcqNLpAmiQwgx3NigKIE6HDR3vIolpM3FDt2dKGOcmeBNw7vs0BaXL?=
 =?us-ascii?Q?zY7pvBfmcXNfi9bIlpT1l52syZc9DFfWdkHnzP4fgBszQRUcX9R1NxjF6ydS?=
 =?us-ascii?Q?F0w66Xk4e3r/Yt5rvddqKkQ9HDc8BUd32kISTnle/aJeY5NfmjxFiRUhjLQ2?=
 =?us-ascii?Q?uPgFd8A4DlRwZ3PkgHJppaJBqXdCRU1DtX3bSFQyqUTzmav0JGi+Dgh631H3?=
 =?us-ascii?Q?gCO9Sz6BtGGuRrJBjYFIU4+c5ftyZUXWhHaCj79Idh8orAEljHVQ5YDp4wcl?=
 =?us-ascii?Q?GuhJlP4zR7STnRZnML5n76i21Na/z8SO3i/kkv2ORdmMZeX1yziHp82jhfuA?=
 =?us-ascii?Q?JVr165eNL9vqFbTmNZIgOBBFGsusBE5lAvRQs6iUmsjM8bmJ+laSbtmDyX7w?=
 =?us-ascii?Q?ab6HYr1fag=3D=3D?=
X-Exchange-RoutingPolicyChecked: h1Mt3BGk2MfUvrnTCF/qRm+cGmMWir9tSqLNP6kP1rVBUqjBGL1bBfs5/u/tVXjsmEWkIyW+E5FIFlMWq1xk/2paS1rd6p4k+/+v+6DGBZemmWXvuCZ++kE2dzIEMYKo8tUjW9pH00K4lgJJIOM/BdPiBL+Q8wiedvupEV77vsz1yi2RbmNRlrl1fPuflR3w13CiB8TBDWuBywmUj83LQuf7RTKDSIAr3wp3gjue1MY3u5X05Pebj1j64QLmsW6WWmoDZvULOGGmP90tQ4jlL3ERL/tMH5bthstfi5Db14gEik/OFjNihLzVxXOYvUkg0jaMP1l92AYiBtdilJ7eUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd56b8e-fd56-4356-729f-08de89291c06
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 22:11:19.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYo39lWGRhxwTV14CEP+QseTsdbEaH0YoHCG6piyeXpSIv5bJnysdJCljYvNo8+YivWKIHZbCRFYz8m8qotvMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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

On Mon, Mar 23, 2026 at 09:42:30AM +0000, Tvrtko Ursulin wrote:
> 
> On 21/03/2026 17:52, Patchwork wrote:
> > *Patch Details*
> > *Series:*	*AuxCCS handling and render compression modifiers
> > *URL:*	https://patchwork.freedesktop.org/series/163610/ <https://
> > patchwork.freedesktop.org/series/163610/>
> > *State:*	failure
> > *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
> > index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
> > index.html>
> > 
> > 
> >   CI Bug Log - changes from xe-4753-
> >   f64c2a6453d0e0196f9697b8429bf97b1da1807e_FULL -> xe-pw-163610v1_FULL
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-163610v1_FULL absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-163610v1_FULL, please notify your bug team (I915-ci-
> > infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (2 -> 2)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in xe-
> > pw-163610v1_FULL:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@kms_fbcon_fbt@fbc-suspend:
> > 
> >       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-lnl-3/
> >         igt@kms_fbcon_fbt@fbc-suspend.html> -> INCOMPLETE <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-lnl-7/
> >         igt@kms_fbcon_fbt@fbc-suspend.html>
> 
> There is already an incomplete in the history at
> xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4 so I am pretty sure this
> one is unrelated.
> 
> >   *
> > 
> >     igt@xe_eudebug@basic-vm-access-userptr:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_eudebug@basic-vm-
> >         access-userptr.html> +6 other tests skip
> 
> '/sys/class/drm/card0/device/enable_eudebug' sysfs attribute not found, EU
> DEBUG not supported
> 
> Which is the same as all the history for this test I can see so it is some
> CI confusion that it is flagging this as new.

I agree, let's ignore those.
But I couldn't merge it. It is conflicting when trying to apply on drm-xe-next
or even on drm-tip.

Perhaps worth a rebase or am I missing something?

> 
> Regards,
> 
> Tvrtko
> 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-163610v1_FULL that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@linear-max-
> >         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#7059 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
> >         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-
> >         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2327>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-
> >         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
> >         tests skip
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_bw@connected-linear-
> >         tiling-4-displays-2160x1440p.html> (Intel XE#2314 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
> >         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2894> / Intel XE#7373 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7373>)
> >   *
> > 
> >     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-
> >         displays-1920x1080p.html> (Intel XE#367 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/367> / Intel XE#7354
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>) +1
> >         other test skip
> >   *
> > 
> >     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_ccs@crc-primary-
> >         suspend-yf-tiled-ccs.html> (Intel XE#3432 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2 other
> >         tests skip
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_ccs@random-ccs-
> >         data-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +7 other
> >         tests skip
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-0-50:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#2325 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2325> / Intel
> >         XE#7358 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7358>) +1 other test skip
> >   *
> > 
> >     igt@kms_chamelium_edid@dp-mode-timings:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_chamelium_edid@dp-
> >         mode-timings.html> (Intel XE#2252 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4 other
> >         tests skip
> >   *
> > 
> >     igt@kms_chamelium_sharpness_filter@filter-basic:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
> >         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
> >   *
> > 
> >     igt@kms_content_protection@dp-mst-type-1:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#2390
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> /
> >         Intel XE#6974 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/6974>)
> >   *
> > 
> >     igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html>
> >         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1178> / Intel XE#3304 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3304> / Intel XE#7374 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-random-32x32:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_cursor_crc@cursor-
> >         random-32x32.html> (Intel XE#2320 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3 other
> >         tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> (Intel
> >         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291>) +1 other test skip
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
> >         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
> >         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
> >         varying-size.html> (Intel XE#2291 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2291> / Intel
> >         XE#7343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
> >   *
> > 
> >     igt@kms_dsc@dsc-basic:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html>
> >         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2244>)
> >   *
> > 
> >     igt@kms_feature_discovery@dp-mst:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_feature_discovery@dp-mst.html> (Intel XE#2375 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2375>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
> >         igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> (Intel
> >         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2316>) +6 other tests skip
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3:
> > 
> >       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-
> >         panning@cd-dp2-hdmi-a3.html> (Intel XE#5545 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/5545> / Intel
> >         XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_flip@flip-vs-suspend.html> -> INCOMPLETE <https://intel-
> >         gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
> >         igt@kms_flip@flip-vs-suspend.html> (Intel XE#2049 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
> >         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2597>) +1 other test incomplete
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
> >         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7178> / Intel XE#7351 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-
> >     reflect-x:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-
> >         linear-reflect-x.html> (Intel XE#7179 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html>
> >         (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7061> / Intel XE#7356 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7356>) +4 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_frontbuffer_tracking@fbc-tiling-linear.html> (Intel
> >         XE#4141 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4141>) +7 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2352
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352> /
> >         Intel XE#7399 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7399>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
> >         fullscreen.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2311>) +13 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html>
> >         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2313>) +16 other tests skip
> >   *
> > 
> >     igt@kms_joiner@basic-ultra-joiner:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_joiner@basic-ultra-
> >         joiner.html> (Intel XE#6911 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/6911> / Intel XE#7378 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7378>)
> >   *
> > 
> >     igt@kms_panel_fitting@legacy:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_panel_fitting@legacy.html> (Intel XE#2486 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
> >   *
> > 
> >     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-
> >     clamping:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_plane@pixel-
> >         format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html>
> >         (Intel XE#7283 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7283>) +1 other test skip
> >   *
> > 
> >     igt@kms_plane_multiple@2x-tiling-y:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_plane_multiple@2x-
> >         tiling-y.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/5021> / Intel XE#7377 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
> >   *
> > 
> >     igt@kms_pm_backlight@fade:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_pm_backlight@fade.html> (Intel XE#7376 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7376> / Intel XE#870
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
> >   *
> > 
> >     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-
> >         primary-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other
> >         tests skip
> >   *
> > 
> >     igt@kms_psr2_su@page_flip-xrgb8888:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@kms_psr2_su@page_flip-
> >         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2387> / Intel XE#7429 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
> >   *
> > 
> >     igt@kms_psr@fbc-psr-basic:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_psr@fbc-psr-
> >         basic.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2234> / Intel XE#2850 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6 other
> >         tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel
> >         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7342>)
> >   *
> > 
> >     igt@kms_tv_load_detect@load-detect:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_tv_load_detect@load-
> >         detect.html> (Intel XE#2450 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2450> / Intel XE#5857 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/5857>)
> >   *
> > 
> >     igt@xe_evict@evict-mixed-many-threads-small:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
> >         igt@xe_evict@evict-mixed-many-threads-small.html> -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel
> >         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
> >   *
> > 
> >     igt@xe_evict@evict-small-multi-queue-priority:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_evict@evict-small-
> >         multi-queue-priority.html> (Intel XE#7140 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@xe_exec_basic@multigpu-
> >         many-execqueues-many-vm-null-defer-mmap.html> (Intel XE#2322
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
> >         Intel XE#7372 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7372>) +5 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html>
> >         (Intel XE#7136 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7136>) +7 other tests skip
> >   *
> > 
> >     igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-10/
> >         igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-
> >         priority-smem.html> (Intel XE#6874 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +18 other
> >         tests skip
> >   *
> > 
> >     igt@xe_exec_threads@threads-multi-queue-rebind:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_exec_threads@threads-
> >         multi-queue-rebind.html> (Intel XE#7138 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +5 other
> >         tests skip
> >   *
> > 
> >     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_relay_init.html> -> ABORT <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_relay_init.html> (Intel XE#7578 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7578>)
> >   *
> > 
> >     igt@xe_module_load@load:
> > 
> >       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-1/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-1/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-10/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-10/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-4753-
> >         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
> >         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-7/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-8/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-8/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2457> / Intel
> >         XE#7405 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405>)
> >   *
> > 
> >     igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-
> >         coherency-fail-basic.html> (Intel XE#6964 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1 other test
> >         skip
> >   *
> > 
> >     igt@xe_pat@pat-index-xelp:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_pat@pat-index-
> >         xelp.html> (Intel XE#2245 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2245>)
> >   *
> > 
> >     igt@xe_pm@d3cold-mmap-vram:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-
> >         vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2284> / Intel XE#7370 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
> >   *
> > 
> >     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_pxp@pxp-termination-
> >         key-update-post-suspend.html> (Intel XE#4733 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
> >         XE#7417 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7417>) +1 other test skip
> >   *
> > 
> >     igt@xe_query@multigpu-query-invalid-query:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_query@multigpu-query-
> >         invalid-query.html> (Intel XE#944 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
> >         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2894> / Intel XE#7373 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7373>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
> >         varying-size.html> (Intel XE#2291 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
> >         varying-size.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel
> >         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291> / Intel XE#7343 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7343>) -> PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
> >   *
> > 
> >     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
> >         shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
> >   *
> > 
> >     igt@kms_flip@2x-nonexisting-fb:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-6/igt@kms_flip@2x-nonexisting-fb.html> +2 other tests pass
> >   *
> > 
> >     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> > 
> >       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
> >         igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-
> >         interruptible.html> (Intel XE#5545 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/5545> / Intel
> >         XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/6652>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-163610v1/shard-bmg-2/igt@kms_flip@single-buffer-flip-
> >         vs-dpms-off-vs-modeset-interruptible.html> +1 other test pass
> >   *
> > 
> >     igt@kms_hdr@static-toggle-dpms:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_hdr@static-toggle-dpms.html> (Intel XE#1503 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-2/igt@kms_hdr@static-toggle-dpms.html>
> >   *
> > 
> >     igt@kms_setmode@basic:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
> >         igt@kms_setmode@basic.html> (Intel XE#6361 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-9/igt@kms_setmode@basic.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_vrr@negative-basic:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-2/igt@kms_vrr@negative-basic.html>
> >   *
> > 
> >     igt@xe_evict@evict-beng-mixed-many-threads-small:
> > 
> >       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel
> >         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/6321>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-163610v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-
> >         many-threads-small.html>
> >   *
> > 
> >     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
> > 
> >       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
> >         igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html>
> >         (Intel XE#7578 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7578>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-163610v1/shard-bmg-9/igt@xe_fault_injection@vm-bind-
> >         fail-xe_pt_update_ops_run.html> +1 other test pass
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_content_protection@legacy:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
> >         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel
> >         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3304> / Intel XE#7374 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7374>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_content_protection@suspend-resume:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_content_protection@suspend-resume.html> (Intel XE#6705
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705>) ->
> >         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
> >         shard-bmg-2/igt@kms_content_protection@suspend-resume.html>
> >         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1178> / Intel XE#3304 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3304> / Intel XE#7374 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
> >   *
> > 
> >     igt@kms_content_protection@uevent:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@kms_content_protection@uevent.html> (Intel XE#6707 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/6707> / Intel
> >         XE#7439 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7439>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-panning:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
> >         bmg-2/igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#5545
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
> >         Intel XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/6652>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
> >         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
> >         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
> >         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/4141>) +7 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
> >         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2311>) +11 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2312>) +14 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-
> >         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-163610v1/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) +14 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
> >         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
> >         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2313>) +10 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@sprite-rotation-90:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
> >         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3414
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
> >         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7342>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
> >         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3904
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
> >         Intel XE#7342 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/7342>) +2 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
> >         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
> >         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/7342>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
> >         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
> >         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3414> / Intel XE#3904 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3904> / Intel XE#7342 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e -> xe-
> >     pw-163610v1
> > 
> > IGT_8815: 8815
> > xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e:
> > f64c2a6453d0e0196f9697b8429bf97b1da1807e
> > xe-pw-163610v1: 163610v1
> > 
> 
