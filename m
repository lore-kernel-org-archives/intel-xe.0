Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5096C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1F610E0DA;
	Tue,  1 Apr 2025 14:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHP5yyD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7985D10E0DA
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743516315; x=1775052315;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bUNLBcYOu9xKUb5SHu64S/fQ50p1eqd7otfLxN+4ZIQ=;
 b=aHP5yyD4ZkhMklV8iU0e7PjJqT3FrFmC7DfL+KaO+5uDfEcfNx7gyihl
 YU34bF034NskGNZ4r0lPJ4hDL/thZT7ykfhCQtawP4lbQA3DHoc53YLua
 hgA3QW4EBArR7bXJXGzzRVpHULzOsVAMTZ6JVzyNUxLHC1hBjiQsLL7D6
 HGYajrK8ruZLoUFvSCAfGuJ8MUO8rrRFYsNgCZjn23kkdD1DIJknFxi5C
 gVaUZOv45niwtC0r/mLHBGzxJBKxEOzA2UIx92v42xZBoq1tp8yI4sbON
 TvuSoNYy9q1dMZtpP3Zvc3ZXfTi7HCK6UXl/7t1J3JAuexzuuJBAqmrbc Q==;
X-CSE-ConnectionGUID: Tth44mZzSbiiMeewQy/BzA==
X-CSE-MsgGUID: E06Hgt8iTY2Kl5nlWPioXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48633376"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="48633376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:04:57 -0700
X-CSE-ConnectionGUID: MqA7S5RrRE+I5AslRys0/Q==
X-CSE-MsgGUID: UM27hxJOT4uhVWLZu704pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="149569269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 07:04:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 07:04:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 07:04:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 07:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+XqeKrBN4SlysG74kH57H3Si4KVUjgxw2GzxwFcvcvhQMg0/lbRwWzgYM23AYl+VpoA5zlo8E/KdmSOigjcLge55lQ1KUTKEASmNeyqq840TqsLZgsuKc9q671Nd3qrJvp1ZfIxAumesrvMi37gFd8tBjLnCQxPouYA1FhoMUfp7sGXM8TTnwlmdipH8LIl7lhjtKw+wL5GtePKMNkTxTM0uGM8JQMjRM9OLqD0qljF7fEzdxL7bM3HEIX3TiY0PDD2fsvC9x57b+UU1HLGZ8XnWSTSSeum88jzlg95PeXILFXa4Xb175sOucnV4EltP8VdZUgFpcKq6uKKLVR93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9EFZ0jal17xASj3l4A7eZTUeCuRAr69fQK1YBcnPVw=;
 b=XmohmteAFfEXnp5ruthotuweR0Etw28T8H6A74oSsM/ynFw564L3T5DcwAD5PkokQctUkHQeKDiEWpxHiM65NRFffXEw0fvYndqpBEVZDLdce9T9/DKpWNRC4Bb2ydAyOnIrZSq4cHFzfJWJI6ufkNpUKZZPAfswhTrdc+fNtJCh4QE5gWVw7fpAABGsHSdtjPx8HWmPvTAY8IitB74KR9Mt2sxlExELPcrSXgUatmy4lc7oJ1lQO30Nu85+VO+lmENw+eodhWwT4Y0gJDMN8j0K6bmF+7Eif/3xz4Fx8RCM012B2RLbnbqfFMl4IexlvAtXsactYYPgCpyGQnXHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 14:04:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 14:04:52 +0000
Date: Tue, 1 Apr 2025 09:04:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe: Make the PT code handle placement per PTE
 rather than per vma / range
Message-ID: <h6z3pcx7errntezllfrspghjzgwmuf3canitiwnn4zee73nv6p@ihwof6y7jlgb>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
 <x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj>
 <5bf94f57b3d2bed5af7585b95b0bb67480cdbb3f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bf94f57b3d2bed5af7585b95b0bb67480cdbb3f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7662783f-788a-4545-e2a5-08dd71262c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?a+niLV4pAcIOSfc/4+v2oXJtclVsrLyrc/s8GbEy09epxO5RtTUAmpB6mG?=
 =?iso-8859-1?Q?8Prwyf9L2yb6bDBsHA/Ag9KbdcbkxsJIr0f1d8KghAGiD2Oskh4i6SpuGH?=
 =?iso-8859-1?Q?v03OCTMLrAogCg29iAlwJdnvWnXzUmJIZcg1wJrlIGJTd93R8TNGnFhKD1?=
 =?iso-8859-1?Q?OzTE+CWZdmZBwrhECJeoNAN0wq8bkCfsd+YPnwd50kT25BScs7ojnvba/N?=
 =?iso-8859-1?Q?98ZlWWA3EVagm/2BZqGoIGazTBTGjFEmgYswfvjyWRNBalpFm9aay6CKZd?=
 =?iso-8859-1?Q?l9piYrj7eib+hs71eeyXc4oYDlz8oDpL5llpr9gnhWZk3sV/VfSw+r92y4?=
 =?iso-8859-1?Q?sjKqsEIS1y96R3LpoF9kVNE8hwhEyTueVN7P8QPNUGlojVLJr/9nNg7h6Z?=
 =?iso-8859-1?Q?HUI6ob46U0LGNdbYVB5RnDMprS78CMkTKewzh18tuc09V8RGMClaNnR4Km?=
 =?iso-8859-1?Q?G6g7swqBFWTZsCqnE0gM62KzvFlKYrPXnzTWnaj2o7ixUquFB2eGaylvRG?=
 =?iso-8859-1?Q?LQ8jNvJKvMEjvWNBwGaj9dpwlpPvRdTAoBm04hmO5tdGbGjKjzh7GGWLDU?=
 =?iso-8859-1?Q?UzseHJhXskbC2q6ATUxMfMsqgRSLIuG+wBPYcFOKjBU7dsHAPaAQHmqC5X?=
 =?iso-8859-1?Q?4yV27hVEpbxZORhAI51XRcPksXhNR1JZmbyHdeLFnWNJq0kTZdZQTnvxJ9?=
 =?iso-8859-1?Q?AkrEOHzCO75z1zIy6oZRl2kNVEZPW7h2v9tzKmF96kKlBydoxaK3C/CRES?=
 =?iso-8859-1?Q?6u4QT1JeQ3sEZ52sR2rmmKpG8Wqo8t4jVSsaiuNjxNdZRWhyUk67zdmEws?=
 =?iso-8859-1?Q?jC5OiWl9DwEmrXAIcrilxBzmiXfXc5bsiSYflxFj2t0YfSPcp1EDV3JjHx?=
 =?iso-8859-1?Q?fXafnGtcn/LKZBtogSvyGvRtV9GLcVYHHLccH0YQts+2i1xg5AT5UmP4CC?=
 =?iso-8859-1?Q?BsixSjpLbrFsrt8I6DjwSII2Dux6dAjfxHTw69icycdqwuIRwuaVMgqqIl?=
 =?iso-8859-1?Q?61HcQq4UJjPdE1WAYN9RBnYK+MVbY0SE7Z9+3WcsLfco/Qd/E4GJU4GBTe?=
 =?iso-8859-1?Q?wh+hjRD124VNMC4Z32RyOhKEqnGD8F24jvgCCYCfoRd0Ii10JhQgtm42mB?=
 =?iso-8859-1?Q?EJ3eCCV0gPcuYwEu/FPbwh2vC8NSZZ3H+BQIqZrSiFu6JGIiVlxMY7t33d?=
 =?iso-8859-1?Q?kBxtWvLV1IGLY0r7/dpl2EaiDZTs1vtGij3M7T1iClr+LLGqgIMPhMEMvc?=
 =?iso-8859-1?Q?o8ccuWHyfiZDAO/Eg97j7ZDFR+3DmbliCeyD9riHpQAFPg94b80MqSZswk?=
 =?iso-8859-1?Q?EKvaoICsrb0pb1HPsE0RlIp2cK+Rwjn1wh/ocmGxl9l+qsyvlzLOo+xFSI?=
 =?iso-8859-1?Q?AqharT6akvGq91G8Xdz3M/JjHne4rIzh8HFztMQ23ykRh38QFFiB8Dw+WF?=
 =?iso-8859-1?Q?FuCrIcTuWgsfLfIy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YHYuDg76mUEASlDZagjrDBID25bst6m4Ecer3QXv0l4CSLm1WAzPhltIMK?=
 =?iso-8859-1?Q?UifLP1Uf4qlCQtc9ZRjyEFz+IwDX/2LaQtZy5gF/K54s401YGhxNJkcdsj?=
 =?iso-8859-1?Q?LPKJY7ECDG/YLwJeoo5t+YjwuM15rNGslvKn1KcK+lSzfyuU26y6/yHAC9?=
 =?iso-8859-1?Q?HFypIAe9RO2nxtG0CJ9zmThFvqMO0k6ixo5KGO2RdJIfWYNPH3w4sowaK6?=
 =?iso-8859-1?Q?gEOBLbkxXjltzHlP85k+eGo15WNSzGcacByVRNNKgnXHTlqcXShCm121zZ?=
 =?iso-8859-1?Q?5RsQmEV5Hhf4AB+dQ7Cw0zQjQcWJAbqkfoSy/TomKzRG6/CGsDb3ICq7pN?=
 =?iso-8859-1?Q?1DfsGZYUN8/V+aQ5W3r7R51+G4S8/UL9TQ0TkyI1crAQzT7S1k0tfDG0xv?=
 =?iso-8859-1?Q?byrzB4fUo2XCeLhPehgJMMUZpaAH8qC6mNWVxmDCWomeSy2cnkfA43OG2h?=
 =?iso-8859-1?Q?cjzo59KfAu0mJXU9odAo9W7RYH1JXeVc3tjjeGskJFAxkmw3P9LlflntRJ?=
 =?iso-8859-1?Q?gCxaMEILM1aSCIV6DL7BbrsicM5qBhmvNXO547aXK/RhnSmYvAmFjyxWuL?=
 =?iso-8859-1?Q?pQP9e08wyRB2UU5cqW8je+xo1S66npftP4esYhK3bjS4XRt1nVRUyoYwvA?=
 =?iso-8859-1?Q?VxbWfw5hkh0E7z2CcEB4YufLD+l2mFCkVXnY4x630ivvecODFX2k/Sh2mL?=
 =?iso-8859-1?Q?tqusM5npUyB1yXIRmFf04qzV+rJK14l4tcQVPMqMm74NlZBJxY6vP7uJdS?=
 =?iso-8859-1?Q?sxCo3NUWmJtVaSiXVCmMLJtbRCQTV4y/E7sXoMa7B5o5MBVODlBQ0jLDBR?=
 =?iso-8859-1?Q?BZzSUi/v891E9+d1Vb0dUo0aTcw/AH+bTanQZO+9uffccfEYHXJp5sq9JL?=
 =?iso-8859-1?Q?WCNdf7lXo2jf4byKpqbpMILkIMIEwtM4TN74qP3oOZe1A+MvYjEWeU8eUj?=
 =?iso-8859-1?Q?yj0OttUem4q6hy8CDxXHZgWgFrkLfxGXZAAgVbMu86m9oiFY2hotB2ceTN?=
 =?iso-8859-1?Q?hYn+yg4Hl3kCm8SRsywwE2+PyoeyCA++Z/Q/+IZX9fJ3LLML8PmPBfXtzc?=
 =?iso-8859-1?Q?Tq6Y4X0bqludIKLUHQC4BMv0amALKlRqC++NnzaAunK9cdgRMxglJtPi72?=
 =?iso-8859-1?Q?4njWe6YuGgSsN3wiCSqI/0mpfY/E+w/pHpUR+5U67V86CO314WLpgV1tKu?=
 =?iso-8859-1?Q?I2VVaQK9zo6Ns9vexXXmYYhvXguY/whioUsaAfYC8ZcrgaVeXyBd+jpdkQ?=
 =?iso-8859-1?Q?7lbV4HQLkRjlusRzuybwn2DyQ7kG09hx01rNumSooM/j6pqdksKWC0j+vQ?=
 =?iso-8859-1?Q?I+W6nkzFgaXudkLtz20NIyWTeq8PCin+p8EilfKlzgX2nOJnpB7I/710j5?=
 =?iso-8859-1?Q?oukrqV66Tv2pKofgCsH7C4DkI0k9xz6l76Gc2NJIp9L4neYpIfBduTKm6h?=
 =?iso-8859-1?Q?yXq9qjyZP8fDqY35RBLSwCRNRU1G+Xn3jJQfldhSI9RymAgBSzdKxgNgyJ?=
 =?iso-8859-1?Q?HWEAx2+cisoqqp/BjH4eWVmhTu/ZOGKpRRCXJ/tvnGkOvzhUTvBeyJEY6J?=
 =?iso-8859-1?Q?PTU2Ymoppd20PAhqOYUR5s2JGVvEl+pRCZXE6Aoebp/eVX3VCBrTxpcDuA?=
 =?iso-8859-1?Q?rHIBv7QZjznL3Xs4Y6spJJLgbzt0zXGWsOv2rvURRjiLGeVoK/mXgMhA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7662783f-788a-4545-e2a5-08dd71262c40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:04:52.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4ze/ggrBfvYnNeNR+2xFiceb8mBRnwcFFv6OpcP+M0LJTYmO+0+HK4Pr6LedsHVO23AJSWGnkIVAFD8OirrV4KhTXcYQE2mmVrK2OYF+6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
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

On Tue, Apr 01, 2025 at 01:55:39PM +0200, Thomas Hellström wrote:
>Hi, Lucas, Thanks for noticing. See inline.
>
>
>On Mon, 2025-03-31 at 10:55 -0500, Lucas De Marchi wrote:
>> On Wed, Mar 26, 2025 at 09:05:51AM +0100, Thomas Hellström wrote:
>> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
>> > b/drivers/gpu/drm/xe/xe_pt.c
>> > index 9e719535a3bb..82ae159feed1 100644
>> > --- a/drivers/gpu/drm/xe/xe_pt.c
>> > +++ b/drivers/gpu/drm/xe/xe_pt.c
>> > @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
>> > 	struct xe_vm *vm;
>> > 	/** @tile: The tile we're building for. */
>> > 	struct xe_tile *tile;
>> > -	/** @default_pte: PTE flag only template. No address is
>> > associated */
>> > -	u64 default_pte;
>> > +	/** @default_pte: PTE flag only template for VRAM. No
>> > address is associated */
>>
>> 		     ^
>> > +	u64 default_vram_pte;
>>
>> 		    ^
>>
>> doc is wrong here. This would fix that for this patch:
>>
>> // diff --git a/drivers/gpu/drm/xe/xe_pt.c
>> b/drivers/gpu/drm/xe/xe_pt.c
>> // index 82ae159feed12..91ad347c8c7bf 100644
>> // --- a/drivers/gpu/drm/xe/xe_pt.c
>> // +++ b/drivers/gpu/drm/xe/xe_pt.c
>> // @@ -278,9 +278,9 @@ struct xe_pt_stage_bind_walk {
>> //         struct xe_vm *vm;
>> //         /** @tile: The tile we're building for. */
>> //         struct xe_tile *tile;
>> // -       /** @default_pte: PTE flag only template for VRAM. No
>> address is associated */
>> // +       /** @default_vram_pte: PTE flag only template for VRAM. No
>> address is associated */
>> //         u64 default_vram_pte;
>> // -       /** @default_pte: PTE flag only template for VRAM. No
>> address is associated */
>> // +       /** @default_system_pte: PTE flag only template for
>> system. No address is associated */
>> //         u64 default_system_pte;
>> //         /** @dma_offset: DMA offset to add to the PTE. */
>> //         u64 dma_offset;
>>
>>
>> However I was surprised that we didn't get any error in our CI.Hooks.
>>
>>
>> It looks like this entire struct is not in our docs at all:
>> https://docs.kernel.org/gpu/xe/xe_mm.html#pagetable-building
>>
>> Should we add a
>>
>> /**
>>   * struct xe_pt_stage_bind_walk - ...
>>   */
>>
>> so it's visible? Or if it's internal detail from
>> drivers/gpu/drm/xe/xe_pt.c maybe we could drop the kernel-doc,
>> leaving
>> them as "/*" comments instead?
>
>I think it's worth having it kerneldoc'ed. I'll submit a patch for that
>+ the fixes above unless you have it already in the pipe.

no, I don't. If we are documenting this, I wouldn't trust me to write it
:).

thanks
Lucas De Marchi
