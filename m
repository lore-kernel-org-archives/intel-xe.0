Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE3D12663
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D352310E6B4;
	Tue,  2 Dec 2025 18:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMO2NWdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1110E6C8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764701541; x=1796237541;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2t6KExZ4glV98HWZvaJDh+NYHRqPSCYHdVv+95GV/PQ=;
 b=IMO2NWdO3bXtrm/nkev4II+1qZ8bBgi0cL0oYsxULCDY7HSwy9QDRxV2
 eVur/Zom8la9VrWpp0HlS5UB9dfY5fcPVzMr6h1n3I6NzUBHQDaNIto24
 /x8VBS8XggmG1W/BjEiib6CVCwMXa+6Vbp0/ZQqSCcUmwHu5Lir5Es/sT
 AMGgvXOO3LfPKjE3CqZKpuWtXBjHFATYxHepX8B8d6g3sIop97Y69XLOl
 p4HyOrRcq4nydpONDW0kP9COtsCCOoLvxswS98eOffuUuluaiJGB/nqdg
 qxFv41gZkzGmBGbp9l7yrrZLbcRlHFsTeFMMl0lZ6hKvBaUyd0PhU4fkL g==;
X-CSE-ConnectionGUID: P+528TLRSr2xL0WE+51hWQ==
X-CSE-MsgGUID: 8zSFum9sTxGFrNrjlL0wKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66757143"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66757143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:52:21 -0800
X-CSE-ConnectionGUID: y7X+EfyQQSOeWD2i1LqG0w==
X-CSE-MsgGUID: J6CV9ruGQzi/Ehuv3hLUWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="225409954"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:52:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:52:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:52:20 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL4H0+0EPIDhzIzfhe5GIpb2I4zDkdJSjHYmOIJeQLpzpicLANewgkxyx2n1qL+BfDpTkKMaxl6CIW/uDopENrsEcDccbvqolJSpqKcfDHuzNZvOT6GxeR+0eWkRcMa7na6YDFxZZ0QhNNEBc3PGHemBsgMw3Czbpw2U7/DwSll/QaaXhGOZ2Canhc6wHRMKlHwc1h05OcH0poWTZYZ5yZZsGtYNV278UNQDGOHCE/idmQGCbuIFxPxPE6uUIDYWKChkax0vdPSS+s2zvBKpMQbuteLXhZTIegXMfGyF6BNbWP8cfANhE80F72jUo7e8xsDTN4/2vj1JIce+WhLH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIxw7GUpSbLOiwraxo/2elbLeEjrtW2Y9qEamimTcB0=;
 b=Ys/s1tzA9q1qwDh4eqe4iEotjSJulUZsVHrXJ51YCT1lgVTFUbg4b7wz88cMmKqpmFTUfhSvFcmCssph4u4vd9ztKUd2qqDUocd3q2dkc158IhvmKLWQqUuY93JWj7QJVT09KZk3LO/VgTyau/wFm0V641prH9pLSo5FWXngTjzStQq54SQVt1yr9ikVKaOsAJJ2GD3L1ZkXThtzXWPO0+VwfUAqUZA6jsiyLUwOVpEl9ppalnkiqpWW9v8yvbytcSEwiDl4HQljbNwPMnpg6pnp2F34apSbHh/ivUd5NlC2UvbnowVhVX05Hcru126n6cqxPxB1jfgRjfuek5DBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 18:52:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:52:18 +0000
Date: Tue, 2 Dec 2025 10:52:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 2/9] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
Message-ID: <aS81X3YyZTKunvmL@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-3-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2c5bf3-d8f9-45c8-0eb5-08de31d3eaf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vOqtFdOWrcIDG7Bd4H7A3VgM9Emx+UqSromuwKvUeLVzv37iPNiwJJQREu?=
 =?iso-8859-1?Q?o2VwYmaNzKUJqA5l3AW4MHNy2mlFTbLhRoOUI0PJrCiykdRm9Oq6F9XPvz?=
 =?iso-8859-1?Q?SnnhDutxEcYRUwA0LijfE7rXImEYpri0/MfhoVGpDuoHS/mEu8MuRQghZv?=
 =?iso-8859-1?Q?plRkqasZQ3Be2GDlT9D/R7bYfYHlzZy1eBt47moUCw1hCk2ZGQh91lfBpO?=
 =?iso-8859-1?Q?/3/Pc0oZsIfjO7AvQx6rW4K1BEkwosnwfi/1VFO/ZPrFKP2kBDNE2BGv+L?=
 =?iso-8859-1?Q?xKJjC/xj5Jt3rQJuKYHGcH1660fKQsshQHE0XU5HIm0V98+snlrvYbjdVm?=
 =?iso-8859-1?Q?/pL0La4w1Wuri1N84sXkIjw7Gq2zgUCjvWcAhn2TtQVu/qxZgIchdRWkRI?=
 =?iso-8859-1?Q?bSQSqHJGqNs9ILgT5qKCTbDFMLBvrOSsSmi3AZ//n6Zol7MIDxBBwTcC0m?=
 =?iso-8859-1?Q?ZjCw4x7k68rfXUM9vDgnriuGtNQFMBz8L+T3wsLP006KKMpLcmgXW8yMOf?=
 =?iso-8859-1?Q?TwSdwLPDo6zgzMAPMvFJUrhiLWEwmlraNKbFFomP3uv54TcmIlnN7TEr+8?=
 =?iso-8859-1?Q?2jrcXMuwxt9B8baPA0mRoayiAjnFR00L/qdJcoF5x7Lo3qf+OGNq3m2HB9?=
 =?iso-8859-1?Q?IoTgvUttQKnsbK+cZQyBqbrijWyAhO3/SdJb+UZtFUcILyztjls6fuqrQX?=
 =?iso-8859-1?Q?KPdRy0LYLrd8pJeQca2dQHE09oOm3MmyFoYidiCxWxmzlkiedyT8LT6JGH?=
 =?iso-8859-1?Q?JY4J9dzGCs44iW4fVBYMxM28FOeeBrPXxWBz39pcQI9kG8PpWwU01rKnkP?=
 =?iso-8859-1?Q?Sn3A3imSp7FFAhKzu0xdSq7BqqI/LgFJgA1ZlA2bFEvkfN0LuQyTvGEnEo?=
 =?iso-8859-1?Q?3m3AvyQt0OlCiNWZqzd9L/0gxl4K/dbbhRfuMeNp/O9AzsmgRHdd4uqoZK?=
 =?iso-8859-1?Q?fR9Fb4XsSd1HogrFhjfpg2rQcutrXrU1JlI7xh1HIplBCDMK8xz1ZXS0EW?=
 =?iso-8859-1?Q?pikEl2YHyk5gGVx2H2vlYIl5iJlN+lviKXyCT2Q5PU3Em35WYBgnzIavhR?=
 =?iso-8859-1?Q?thdvSZVw9D0Jb5j53aLUArqVc28Bc1ydcutne0km8YrD5D6S/HYjsvOjxC?=
 =?iso-8859-1?Q?t/plWxR2air5AlWslNy7MWWHbBTSzNSlgFGqvhVFIPbM4RLEYuz1rh3R2W?=
 =?iso-8859-1?Q?5SVDD8DC85tivLKbZH3gu5CN1XjTMdtKj5AAdEM4vCTmmKTns13TO2rr3I?=
 =?iso-8859-1?Q?T7lCkMulpOURjGP4nkS8mknRAIyHiIyHIzHWaJPJqG15W61KIZfLamPtbo?=
 =?iso-8859-1?Q?oYdjN1qRAclvxQCLoKuy1+8qWLyaRTttkwMDMEA3/fWO7ldOm85M6/rpx1?=
 =?iso-8859-1?Q?Fog9zGaIv7WqmFJZ3C16j/Rj7J4JpRRGvcO3r2Y9BaWZ4r+y5EN+87nuQV?=
 =?iso-8859-1?Q?PlzQdp7oU45v0wm+CBXDqUeHJ6+w9JuJxywWOhdZ6q6t7KxfYnOJq1EjJw?=
 =?iso-8859-1?Q?BxWuKgazHOnKt8EeEfyx2K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1dfMEyZxlnDZPNIoRrPcjy9guJWde/1TgOmPH/9V63F5aE4OoUqAQ/glXS?=
 =?iso-8859-1?Q?UaxBrDeWGIBjGWIm1+ladhPZHH0V7gvs1IWQNoXmEfK9SYUGqOHp5dje1X?=
 =?iso-8859-1?Q?wEuK/FHqbQHNBefhSPyZX6jb1pmBG0GlAlX0N7Kb0OZAXVeHbA5lO6q5wd?=
 =?iso-8859-1?Q?rQeTBWLdOWGbYF0cR1cVcI3lvtu7Zo2vT3o741w5xD4VDSaNugi6eRO4Vf?=
 =?iso-8859-1?Q?OmVX5pLKE3dbfG58/bFZ5k3N23SYznwAVCkZL0AldWkYmGxXvX4pgqeSyU?=
 =?iso-8859-1?Q?A44o6L2y554C8FmCyhzT17QMm6AleFWJuBhv1afBtl9x4jt3DGnQ9RQt0O?=
 =?iso-8859-1?Q?XREZBnkLmcxUycj76kHgGUoPypLPHdwMdokWQWAdOksgN1Zq2yEze51MQy?=
 =?iso-8859-1?Q?idJMBUKJsIhWCatr8T2KLS4xc2ccRL8iDMt/Ft98gtsLpGUF4RhfHPX9lC?=
 =?iso-8859-1?Q?5fNbTLg1JmJ8AnWNGozSPxB9vBHVphvMc53Ltzejzc65L/iyFlhRxlE2b6?=
 =?iso-8859-1?Q?zMH/BjS/p07Ro6JQzgyUfeWppittKZHlSk60532tmNVMmzI5AUZ2dymLH9?=
 =?iso-8859-1?Q?ImC9wJrKgrRaDkBeAM8MBnru/2W7tvOi2DSF4Kk89M1EZZEzyY1r9x296U?=
 =?iso-8859-1?Q?LZS9ICJCR76vrKJZir+XuhqsykG9R2JrCK5YO1/YGjtZkWGXMPksEDvIj/?=
 =?iso-8859-1?Q?EIdjG0msHyxyjhuB6juP3qwbToQZjPakT4JPx16Fv7Bxj46uiRgwqQnNfH?=
 =?iso-8859-1?Q?+1sAz6o6ebWhMuICEZgtflpyDUrErpNW27yNxmaSXlqvr/Y0LxM6kNHd/Y?=
 =?iso-8859-1?Q?lYm4D0eP0qEbCTRCFktnfDOffTE4dV3c1PO+nqbI2HdXXC/YOYToohlhfz?=
 =?iso-8859-1?Q?eJwNBAwYJfzjJX1W5pYWHfCb0UIUcDBUr4RN7lzLxHY2FKgkIrkAK/rlaN?=
 =?iso-8859-1?Q?AEdnLS2cDDVq9NPBXgCWxcYp+i/hOysRUeUXsBNpevUyCuZ5YG/AoPMrzP?=
 =?iso-8859-1?Q?wZCUGimxfHOyZ6s0LHGv57AzxVW6xz/aE3TdtrOA7iEHRKlNojSBnyHiie?=
 =?iso-8859-1?Q?L/8c6e7HbdRBHkIjcOxlKfpNN7w+Li51P0Vn2cRosblZM3V2q9+f+smJDT?=
 =?iso-8859-1?Q?NiYr80iLuXcqV7EdKRrISgIWVdXmol4Fm4fBhZj7qnV7eYjMMhEuhum5Re?=
 =?iso-8859-1?Q?bVgb5c2FGNNZYcn/o/EEjFaZbYDdsPA3e0QZlvAFTjvTl8Pn/SnqA8XTfs?=
 =?iso-8859-1?Q?4Zw3KfkrG34uUeTrRZZ+1St/GZSUnCNKUAzE1jos+83G+q9XyRg+zqs4ZV?=
 =?iso-8859-1?Q?RibybE7HnGT4JO4eR8KQkdeSk0LgwwCKC6b4lq9BSKKBj8UhAZrMazzfXR?=
 =?iso-8859-1?Q?E6iMd/A8WvPufCByPr2PrBxAXPveVb8rYA/CS40fybVj0gs84kLEuB/ce7?=
 =?iso-8859-1?Q?ZrnFyWCSnyXaQYn8MZ9wmTl0YyvH4/ySUQ+twxgMvDlIGu9xTXNT5V6Qj2?=
 =?iso-8859-1?Q?DcagM7++UMTgd0g/JgJMnh66/NBT76oxi6psHQxRBAqVA/NZOccVy1GPIP?=
 =?iso-8859-1?Q?RTijG9sgFE3KfoXPxHTERJbAn82kJ0mfvrqAkYI01f1gCS9/FL4KpeqvT+?=
 =?iso-8859-1?Q?9ApYKhwE3lsQn1mUSCG8Bol/tLWGMxy13kF9iqsHJrtNL6cbeCzu00wg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2c5bf3-d8f9-45c8-0eb5-08de31d3eaf6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:52:18.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZccUmz9sbMMNRF6bwDXRAPtyUi+3m9sZT7mOQNqyJyf7AtoNFXUrwZqMYAvh3VORHZWRijcXz+24Ym8/wqi6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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

On Mon, Dec 01, 2025 at 11:20:12AM +0530, Arvind Yadav wrote:
> Add infrastructure for tracking purgeable state of buffer objects.
> This includes:
> 
> Introduce enum xe_madv_purgeable_state with three states:
>    - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>      purged. This is the default state for all BOs.
> 
>    - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>      can be purged by the kernel under memory pressure to reclaim
>      resources. Only non-shared BOs can be marked as DONTNEED.
> 
>    - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>      Accessing a purged BO results in error. Follows i915 semantics
>      where once purged, the BO remains permanently invalid ("once
>      purged, always purged").
> 
> Add atomic_t madv field to struct xe_bo for state tracking
>   of purgeable state across concurrent access paths
> 
> v2: Add xe_bo_is_purged() helper, improve state documentation
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 911d5b90461a..b0a31c77e612 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -85,6 +85,28 @@
>  
>  #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
> +/**
> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> + *
> + * This enum defines the possible purgeable states for a buffer object,
> + * allowing userspace to provide memory usage hints to the kernel for
> + * better memory management under pressure.
> + *
> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
> + * This is the default state.
> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
> + * purged by the kernel under memory pressure.
> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
> + *
> + * Accessing a purged buffer will result in an error. Per i915 semantics,
> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
> + */
> +enum xe_madv_purgeable_state {
> +	XE_MADV_PURGEABLE_WILLNEED,
> +	XE_MADV_PURGEABLE_DONTNEED,
> +	XE_MADV_PURGEABLE_PURGED,
> +};
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -213,6 +235,11 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  	return bo->pxp_key_instance;
>  }
>  
> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> +{

I think you want to assert the BO's dma-resv lock is held here. I
suggest this in patch #5.

> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..57b4dc7012e2 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,9 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/** @madv_purgeable: user space advise on BO purgeability */
> +	atomic_t madv_purgeable;

Does this really need to be atomic? From a grep on the final result, all
critical accesses (ones where functionality would break) are done under
(or should be done under) the BO's dma-resv lock, right? The madvise
reading the attribute is likely the expection where it is ok to just
read this value without the dma-resv lock.

So with that, I'd suggest drop the atomic and also add a helper to set
this value that also asserts the BO's dma-resv lock is held. Use a
WRITE_ONCE which would pair with a READ_ONCE in the madvise attribute
query.

Matt

>  };
>  
>  #endif
> -- 
> 2.43.0
> 
