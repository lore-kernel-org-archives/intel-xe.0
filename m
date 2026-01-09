Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2098AD277C2
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 22:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D453110E0BA;
	Fri,  9 Jan 2026 22:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOle2Lf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF5B10E0BA
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767999543; x=1799535543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bPOLEd97BZINOwxfDS4gKxZP3qULTJal8RKy1tbVmEg=;
 b=nOle2Lf7gRxNdrjQiVfCiATp0J0QPwVsgXMY/sXXo62S6A+8USKkP7oV
 Dff3OKy/IesxxeXJJ6uPNKzitjztzSpVdlxM3gcduAp+6KeUtcvLFfNQv
 QgzcsgL4LrSzNzpQkPVqIFgu9xTWuV6E2ezLEYDHUY1Eh/Op5iQHa54+i
 0IaQKVRQZOd04NaB1+gu+1/R4fuYsS2P+1Hzp93y0KbEq2hQ3Y0oRW/77
 lkOVHc97DhqNDlPzLFDWIfMPPyIWtGvjx4L1DgSULLg95V8ZIYG3qfdFm
 T9CeC77nKAsYXfAvJdISVH24E8u61Th2gJy1smNtCeV0gf0bRe+IhHQGr Q==;
X-CSE-ConnectionGUID: LSubh92tQcS3eVZIJdNdQw==
X-CSE-MsgGUID: oUTTN1mkRmanxgsNyElW1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86966183"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="86966183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 14:59:02 -0800
X-CSE-ConnectionGUID: JxhdxnhoRBep9HBhLnQX9Q==
X-CSE-MsgGUID: PSzMHHsNSNqT0EpjRP2tWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="226933160"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 14:59:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 14:59:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 14:59:01 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 14:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pw9zHuPreuboukCb7Usd8jipScuJHmUUce6U8ibjY0xIGPELdq2WT5czANaAGeF6qrNjQmJPi9iv79YVLvtZEPsWg4digWmy4OkqH3/gzuG3bfHTodrisxb2cPMO/DAAx+BHoSmaT5NpZN06+DuCocAIVk6HpQCVrPaiDcC1yvRDvayf55VO7vt7Eix0PuLurzsbRksfnxlbEBRwYcePK+sQmZjrkffKWVTD0ZVj2MiikM3r1SSYbqLMaLyHgTjJQn0SibBuG1zw9UOOdwW1WNjVG/RDfDnE9JJkC7CpTfRWMXXS9n0CfCnCFGP1deT/ZRT9Wy0CLlD5enKhPIw42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8Y1Mhd2hB/d/o1L6+uySGLPjv7ZneWeObXDKZZ2MmA=;
 b=MwiRhTlcNUS2RdfS2gpuUC6QhSFw8MUgvx987nu0bGlkQ7sSQ4/2TIooQwykWOTHLe7ttN3hFWtQL92Fio0psX+UKybIv3fCwWYvjs1kBdNc1j5EyLq/y8YhpHEflygLeNCaxBi5hU5ggJJc8owGCxjc5ksDQLbNjZ+1gBBQTbfhNrT+8vWhqDRbcoWnysjz2o3unC7aDOPuHyx+zCRwNNjJTyviqCBZqbddZPeoe7Bvkgzu2ED0hDUVl0LoEHxRfqXJlhXnXn0Pw8uCM7C4/+rBPjk/AWwS24HNqgNuOT7faPD6He1W5fqptnFlvQjRdeOJt2vS3vaQHJjTjEIT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 22:58:58 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 22:58:58 +0000
Date: Fri, 9 Jan 2026 14:58:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Xin Wang <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe?= =?utf-8?Q?=3A?= Allow compressible surfaces to
 be 1-way coherent (rev6)
Message-ID: <20260109225855.GB458797@mdroper-desk1.amr.corp.intel.com>
References: <20260109093007.546784-1-x.wang@intel.com>
 <176796495575.141391.7613992815827343804@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176796495575.141391.7613992815827343804@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CH3PR11MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: e598ca2e-30b2-42e7-5afe-08de4fd2ac02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PwIFupdu54GxCsmwm0HC6PIF0DbjevzvC6jRiwQz49nSzQfwy61bz3sbTKL7?=
 =?us-ascii?Q?lpk57u8INXibU03Fw04CP4a1+e8/Z/Mw8TVnUETfGZzkLLrh/BIL1Pwr5qWm?=
 =?us-ascii?Q?FcmmTSLBeMBpRWHoEcfoMFZhL6fG2cM12JDPSknZtPwbKvlvOsPYu8hy4EJu?=
 =?us-ascii?Q?IS7Ir+EAjSc3VaOryXsNvbVxxqPHkgKv1yv81ZytcEpjsmg2Pj47c2emNPqR?=
 =?us-ascii?Q?8h0Vt92exC2OFfnbztk5lOlLIJtAEd7sYg3aNoZKERCw9F77DZXcQySu9gW8?=
 =?us-ascii?Q?+G1g1OqrQqYcccHLpI7uCWQvMrPnCRTcd9T9ffBj6hW0ZZ9ItdK6vScRC8is?=
 =?us-ascii?Q?u9qWZoLrWfW2tcf+JbXYRz4VIj62qZBf26LSAAJ2Gzm5qv4OZNbe8AADzf+4?=
 =?us-ascii?Q?LZy5Q/sZHZ3MAh5ijxcyzMEyUKzhJSoP412ThgWbt7oVVLB4ulcbWdnZ7Iyd?=
 =?us-ascii?Q?5F5BtE8bpK0QtZKpNJkxUUIk3lDHJyL0EERLhTUOVoTbt1UkoBjaH4gERjPj?=
 =?us-ascii?Q?BnToY65qLObzpOJQ1ADCAKxOofqDStcz4CUzQcSTnEQe735et2KUuJKRZjSd?=
 =?us-ascii?Q?x0eMA5I87qv072dt9SQnL8bGtxWdwpkHSGDTjNt/7pVLJoRBIivK5dSdVZwZ?=
 =?us-ascii?Q?wORRdiTS3DNLD2Hk4an0zicHFZA8j65OJwLY9TF8cNIRMXieVP0bnVM3swJT?=
 =?us-ascii?Q?ej7XPpBbIZjsR4WTm4fpSIeraaPIQEYobJjevanq/A89RfLrlIm7RgPwf9Ya?=
 =?us-ascii?Q?DpSZ3IJOpdpil31PHEjwuASKx1cSVpLXrhctRdERts2+4qTgcqikgXWwPoiJ?=
 =?us-ascii?Q?gPNh6CXAS/21alwnstTbF2exyXRDGVZIEb3XVF9a/qWyNlA1zYTzAK5yC45P?=
 =?us-ascii?Q?F4n7paSVLlyXEFIx2fFjBRV+ZPZ5gnWsHqhvuBg/PEV1xW7LhdckWIw3XLwL?=
 =?us-ascii?Q?M4QIiVtA8PJvwVaV7KlBZbxSq0XE9xclrxjjHm/BvrMx29SOLSq2yIucDgTM?=
 =?us-ascii?Q?Y2DIVgLmlhMQN9kuMocU4eKtqBZafuKETr67RsSXkvgS/6k6LaMpnEGZlxwL?=
 =?us-ascii?Q?Sgl3Yjy/bUB3VtLwqScBFiN5naMHbpj89vTHKbUukz8b8dogq8iXOqkuf17/?=
 =?us-ascii?Q?h2ukqlF/8M9BE9SMUn+WtEt+3uD0hUuHQLZPtgeCr1iiUzTFlVdebZJ+9lGm?=
 =?us-ascii?Q?ow74re4L5Pb2UssBbHqjEFtDVlc/2NyJqsbscXlfZDecqG/dlsLScGDQCSxP?=
 =?us-ascii?Q?xkxW1H0SJ0K85EAsPfgAk14XmusoJH+ZmUi3TmHGLEED86vypUK5scab+Jjg?=
 =?us-ascii?Q?BLK67PK1/qV899GrkfuRFe0x+B5JoRqIDPXZSEhp9G8UcbOOXLlX2fkO5ywB?=
 =?us-ascii?Q?+c0vzNQ6b24vApq0Lp8yMojz0WBbjZdp9SIuhsviI2QfRS+CSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wD/etfS/QTXn08fx9wx7NSilXlC3cdhTVeC4TGFr0RqMJYruUrPR8lqNXxOc?=
 =?us-ascii?Q?Fj2NFav4aULufoC68LuuZcqNdAQB/duO05NhoKet2iVzkV6L7B8mhsriyX2j?=
 =?us-ascii?Q?DKAXNrOzcTvqbsl1YD06yRnLRPIYaJvdyuaadi2Q85ceSUIk8AenbXjYATR1?=
 =?us-ascii?Q?GltZ5f4SwJtklKyCObhIHXZ5+PBvIsxPLa6QD+rurKZBIqB1dqF1hTyaTcn8?=
 =?us-ascii?Q?PiIgoKm5QcwG5GDI/BxleG0mSiLOrwblDcXNE/91FG4AQe/w1ciz1geNfAQ+?=
 =?us-ascii?Q?VkYEYh/s+b46el7W8NRt2xFoQjA12YD0qkrWERX9NunNdbeEge6YCi/v7oEY?=
 =?us-ascii?Q?guZkAsdhh6fFDWlJg6XwZmrZ8XDz+AgHSeDaTV6EYy5iIdbQyvB4Cl6vkhgR?=
 =?us-ascii?Q?QIbxww+QupisiAc+o62W8d6cOyDTxcdUj5q2DKBAeoNDZtW9iLxKL9IdJ9t+?=
 =?us-ascii?Q?md7ja+ymv3+UGGAh2l0qy2U5C4YOGLKo9qUUOm+xWMWKhmkG262t+pGbUCt7?=
 =?us-ascii?Q?VkUzGFM9dM5VTgrDtXS322rxd4kYsg6552ZleFKI0CovyGdM1WbgPju/+1Zy?=
 =?us-ascii?Q?KhSiyq/k94e4Ac2ez5MeNNXyZRtGXAKPZBWUVnWcUAHOxpZVprI1Zu6qLd4y?=
 =?us-ascii?Q?IRRR1sFolG01Qy2KfZ+FnljuSV/HGgXfVuhnJsnMkMRJnGLqxgvxA6zuxKy4?=
 =?us-ascii?Q?oqAljm16r7MWckme9or7Dbzzt3guvgBQUW+ybTXc9AZh1eL+g1i/tpUauuGN?=
 =?us-ascii?Q?rY5olDvn4uCnTUS66K1Mb7n7qe83WlH0muXM9SfKS/e8KRe/4mL+xuSxkgBp?=
 =?us-ascii?Q?YbgFo18DdjJ/XfgmQRed7QCbJbuMtFpR6W+o8yVfaJNGjhCjE6yLDYpZZoFl?=
 =?us-ascii?Q?ULwvyXeSe/GDqtGaQiyOjhG9/RkB/IsAUYN0QFI+4sWXFKvUk+Or1YAf+3hm?=
 =?us-ascii?Q?KOo3uF2qtQ1p0K5ep/YL5CWuGDsEV7GrUJnonjq+g6owpjV8+3HKvir/H2vi?=
 =?us-ascii?Q?yZ121ndsu1+H1GVorE88o2pWS0w1KQyy389ht/opmLoZCSMFM0OJhgAQ/sfk?=
 =?us-ascii?Q?bDUE7VpE5R4N3dKfYNDwL1PDj362njKsw9Of5ieKxKC3mHE/n4tYb1FLxhDV?=
 =?us-ascii?Q?/46HyPvItmqXaffmnp2OA35lrWAQjkNHrxh6Ywbc1SA8sTXs4L6GnIBevZyI?=
 =?us-ascii?Q?MPfyIw8laPISeB6h5qzI2LAgxhsT0wRdfbIkP3vum3o6yUnmKTnF9QsoSxc0?=
 =?us-ascii?Q?OF6/0ISiMHhz3TBDUPjPrB6zn+sku5LP7ISVPhBP9ITF+MTl0mX9X5ZJX2s3?=
 =?us-ascii?Q?VWj8A6Wb2+4tWbG8j6AuodSDOR9evp2Qi1VluEorUg8FDvQzwDB2u/g+LsEK?=
 =?us-ascii?Q?Tp8OmmAbgqYHAPEgbJAr+6y6SQQXyRWompYj1c7NjPkJ98bLiUfu7ELMlq9y?=
 =?us-ascii?Q?oP/Nnmzj8/GG5Z7p4udmBKOjsPZgyqXDl1Nhp2KQvvvAyeNvt3fk36tDT1Is?=
 =?us-ascii?Q?JYuZtZx9bwrV/hxFyI92MikQ8u5mm6eHAWZULLqEmrcMxH3/eHdSLK6gQe/5?=
 =?us-ascii?Q?22nkfZfvz0L8CpccBC8QxF5YH3pCZZQyQge5iCQCBIPrW9BxrUSgiQg6nkme?=
 =?us-ascii?Q?Bu7hg338mbEmuOlu9fc8zR9/O65pAv0nXYkxmCYJE+wwxJP2v3gTp41NbKj2?=
 =?us-ascii?Q?Xt7i0psrt2V9gFK5wL5DLHqQEIEX7WmDY7NNrYMYMrpGacJU/3ZsCWLkAQbx?=
 =?us-ascii?Q?Twz0HjyW83ic2VCzbpf8UNaPgSTVGbQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e598ca2e-30b2-42e7-5afe-08de4fd2ac02
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 22:58:58.3236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqWv0x9hiuGDwgDPXVqZUvzNFLJIX2+jFqzDfXwP5a1Z+qVNxNDjehgUiMYop98ujQFKZ1tXDgqMx1oIIwUCzEIH7HwJARpO5cj4YU3v4fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

On Fri, Jan 09, 2026 at 01:22:35PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev6)
> URL   : https://patchwork.freedesktop.org/series/157036/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317_FULL -> xe-pw-157036v6_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157036v6_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +11 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#367]) +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +14 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2724])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +12 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6507])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2390])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2341])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#6747]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2286])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1508])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2244]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][20] ([Intel XE#5208])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][21] ([Intel XE#5545])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][22] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2293]) +5 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4141]) +18 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2352])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +35 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2350])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +39 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3544])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6911])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2925])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2393]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6886]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3309])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2505])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#2387]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#2234])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6503])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1729])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2509])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#4459]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1499])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4837]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4837] / [Intel XE#6665]) +8 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2322]) +8 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6874]) +35 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5007])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4943]) +29 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6703]) +93 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2459] / [Intel XE#2596])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6964]) +5 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2427] / [Intel XE#6953])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2284])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5742])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pxp@pxp-optout:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4733]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_pxp@pxp-optout.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#944]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][63] ([Intel XE#301]) -> [PASS][64] +1 other test pass
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:
>     - shard-bmg:          [ABORT][65] ([Intel XE#6740]) -> [PASS][66] +1 other test pass
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][67] ([Intel XE#2142]) -> [PASS][68] +1 other test pass
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][69] ([Intel XE#6321]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [SKIP][81], [PASS][82], [PASS][83], [PASS][84]) ([Intel XE#2457]) -> ([PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-1/igt@xe_module_load@load.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-9/igt@xe_module_load@load.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-9/igt@xe_module_load@load.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-9/igt@xe_module_load@load.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-3/igt@xe_module_load@load.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-3/igt@xe_module_load@load.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-3/igt@xe_module_load@load.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-10/igt@xe_module_load@load.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-10/igt@xe_module_load@load.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-10/igt@xe_module_load@load.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-10/igt@xe_module_load@load.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-2/igt@xe_module_load@load.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-2/igt@xe_module_load@load.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317/shard-bmg-1/igt@xe_module_load@load.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_module_load@load.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-3/igt@xe_module_load@load.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-3/igt@xe_module_load@load.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_module_load@load.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_module_load@load.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-9/igt@xe_module_load@load.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-9/igt@xe_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-10/igt@xe_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-2/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/shard-bmg-1/igt@xe_module_load@load.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317 -> xe-pw-157036v6
> 
>   IGT_8693: 8693
>   xe-4355-8c03c66faa101a552d780d9e9ec0cdcc0f80e317: 8c03c66faa101a552d780d9e9ec0cdcc0f80e317
>   xe-pw-157036v6: 157036v6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v6/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
