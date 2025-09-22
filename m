Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB662CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCAD10E36C;
	Mon, 22 Sep 2025 17:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnQbTw/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBD510E4D0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560867; x=1790096867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0wy0RkWuTANdj3VQiy+NDfRHp63um6xUSE4MwJqpmaA=;
 b=ZnQbTw/6Q3bzLD6mPceXbzEfxmm5eMApIuCIWMRklBhVKmIIi/5t88Ts
 NG1YJQUHQ0ss+Z2N3YeZKPUPNYnzXPmNCB9MEHO3HNNtfgik9WFBJfnq7
 U8Ey0nI38kTcZhUARaXlTQa7uxc5aj+hwDmoExnKz1UJ4pZV2TdYiLsVr
 InPFMWlMQ3Tje0Iu8GVwJB5ac8xgUzw8SEHINRNK3R/OdegShw323ywvd
 74qWsVR3XJ8M7KLtdabqn60vvSA8wMY8h8foQkYFVQdrmtyv+RwJ8GGg7
 D/44SycOSiY3H2sjWUJtbQ+Fu1wXNOkMPWTEc86ltLlQgjWryCT0s7NUY A==;
X-CSE-ConnectionGUID: K3XBqCxMTwy+D6WUfXaN7A==
X-CSE-MsgGUID: c+lVR/oXTLux4INWAIx8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60527402"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60527402"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:47 -0700
X-CSE-ConnectionGUID: AMENoru7RYagm8GtWlaRFA==
X-CSE-MsgGUID: /NH/56HCQNO/3ie6CDR5sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176456887"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuyW5QfQncETI0bi9EiEjLZ205tKsVn+OPmeP613swpbfqIwbjKfI5ytSr9zKeoDe9kcbPIHcp0asa1StoP8J4xglDjRNcHEL/8yHxJSaQA1dxO15ZCTPeP2oyK54/5dLOJlWxUgNuDLiGv8A3citYNwgmw86seqCOhPf4+2wF7Ecb2aNMrlS+W/OpcfVLaCYEZZF3UuVAD/JKYSagjk5i5pqCF5p6/6lak4+XTw62MehRDlYKHruvYKIGilnbpcebgu0WnYQxJyUXwn/5ewnDCZdEj/ysIyPqmC3BZQcQc/DtZ9UCkkXGZ02l3D4iJPnbFKltaiXKGAyyplfe33Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lukvfaN5peGYwdOaGz2K6uSa9T7NbL30MkRmcCbqeB4=;
 b=ntJ4CeGA/S7cHuMoByeAGT2oSxNz9NlGm86TLAiIv6zljYQNI2pkIvgkNhQv9qpJG9XyHx9+JwpJQDgfoL6rUCQ+UVyNvnvcJ1GY5p9N/p+7c0wC+5BFzli8JlPigdxRYRUs7+h0vdA1A6ip+g7nHAEvAbKUj+JYE26sQ6PzhGVzA8+4AHNrgg4E/czpoAPcU5y6KuGIkCqlzfECXLwMs0VvshaZGZ3fPrCeABtSjx7+/sXjgxrPu/aibi0JDkfN6NvtXspOWxNEVc79KXFJ1I+IlzbhyrNP9Y5eK+lcB6GqoDBRIz5F8H5D2h3ubGk1AwXtGvff7YWsFqjZm8e8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 4/5] drm/xe/pf: Force use user VRAM for LMEM provisioning
Date: Mon, 22 Sep 2025 19:07:06 +0200
Message-ID: <20250922170707.1556781-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b1aee7-c45e-4b92-26b7-08ddf9fa8b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEJ0MFIwcVcwMjVKdXNHdzZtVU1SZzlOMXVRT0VLejdCdm10SnUxSzlrRmxP?=
 =?utf-8?B?OUQzNE50cFNaUHJZYU9zSE1lcHIyM2VFK1JqbDRPSTlqNFpGOXM4UjRITmkw?=
 =?utf-8?B?bzh0TElUYU9WcTJwaTZjdHRicDhXU3pxOW82aUhpUDVSNzVBOFFGWkFIRDFB?=
 =?utf-8?B?TkpvL2tIKzFSbFpacVcxOTNIWjJzQUFOR2xpdWRtMlUvSFB0NGJHUTBLYnky?=
 =?utf-8?B?Z2p2N0JyeStWbitsTVdNek1uT0VkRjlMdnF4aWkyMmZjdkljSnRHaFlEeVE5?=
 =?utf-8?B?Sk9iOTBnd3RWZXNNMndldWtJeDZQd2pUMmwxLzdCYVYwd3doQUQ1SDdPSDA5?=
 =?utf-8?B?UTNabEg0ZnM3cE1SbHJkazlGSHJSREdPcjdWU0R0dVBVTklDaFk2QnkrdEg2?=
 =?utf-8?B?NTVzMDZleWROY2RLUHZTZk95aGcvV21ZTVZrVllzcjNqRlA4eG93L0RFSkR6?=
 =?utf-8?B?em5JSHVyZHNRNzFuNHBjTlZrOGdXMTFrcDN1SitlYm1DZzQvUVc2Qms0QmlL?=
 =?utf-8?B?R01CV3NBQmpxdlhCUmZyS1ZqaFRaenUwVGh3NFZxd2haUVVZL0JPdzdSNUtT?=
 =?utf-8?B?dGlhQVRWeEJuZHBPRWNiQUV5NVRkT0Nrc3UyWTFUOS9HTGcwUHZ0WkNjSmxO?=
 =?utf-8?B?ZFppQktzQTJCRWRUdXM4T1lBSUV2VThMSkZZbUVNTEFkaStQQjNvcHpTMTVi?=
 =?utf-8?B?YWRiamNXUEF0QndRT0FPNDh2VlRuWUtqZXpLbkNZNS92RVlSUUhOVVBQRmh4?=
 =?utf-8?B?RUFTdUZoeDhJOVN6d25uYitIMDFnbGIwRlNKNzhyY0NnSWhGRXBPZmRsK0xB?=
 =?utf-8?B?RkIwSjNGSmlIL21aWCtZUnlTWlVzSVNTM3kvcXpKNXpmdkV3SGpHWHMwTER1?=
 =?utf-8?B?RmtuMlFWdUFrblBQdHNkUHp3ZzNOaWVsalcydjBnbkF5Tlc1T0VDUXhIdERr?=
 =?utf-8?B?R1g1Q3A1UFlEZTRvZEpCSHpwVUpaZ1NZZnhrOW1FdEN4czU1R252T2g4cy9O?=
 =?utf-8?B?ZWEyVW5kUm1KNW1hcGVWZ0RiWUdZTUM5R0xQN0Fyc2tacEFyYWxhVVVrajdO?=
 =?utf-8?B?Vkl1c3hTSVFqSW5NYlFvNHNYY2lZT1p6NzFjTFkwMWpJSFFYYk40RjQwV2No?=
 =?utf-8?B?SXJxNnZYVWY5YzFXOEZhM3BVQS9kY0ZrNzJQNmM5MHJRMVVPenVwckhJeGQ3?=
 =?utf-8?B?S1BMa3FXZHMrcmJEcVhRTWFvUjFVZmlndGh1dVl5cmtxN3A1OGY3SnNGNWsx?=
 =?utf-8?B?MnBEZ1pQa0xiSEVGQlNyREx2bXdMTG92UUdzcFAzTHFpNDRCQ09ZUWhnVE9R?=
 =?utf-8?B?U0MvNGZDTUdEN1FmZlg5eGkraEkrNDBHRStUcGtWVGQ5ODhDb3VCMlMxZ1BB?=
 =?utf-8?B?a2N6TmlnbjVRdjA2K3VqckNkeWpoVHJqQlppbjJFY2hsWUdNQTlTdTlVMDAw?=
 =?utf-8?B?R1Q4TGtJd2hYRU9CZEhlMEpoUWV1V2xnbklDRk80V2kvWndWVzY3V2N3TGNI?=
 =?utf-8?B?ZTBaT1NQaG9rR1JDOFB5NTNaZDZ1d1J0Y1pjSFVHaTlXNURKNEQ3SGExdnlx?=
 =?utf-8?B?VXBYTTZ1bHVHN2lReUtqbXZ2bUlCbDY0eVhJbUxNVGlwdTNqbVNMUmNHeWhh?=
 =?utf-8?B?aTVmMFZIaWtYVTVPT0FxenlVc3FOQzBvcGpmTUcrRGkxNjh3aUhEUU1YL3FN?=
 =?utf-8?B?MERQUVJieTlpcm5ud0hTU29NZHUvOWltS2VaMEpqclFiTCsvUVgzcXdSNmtq?=
 =?utf-8?B?V3BPaC94M29SVU9pa2grK1FNR21mNHBpN0J3a1VCQ2FBQ3NkZHd4L0ttNFda?=
 =?utf-8?B?VTF0UkJENENxUTREdmRkRFI0QTJXaUFnZ2Exa1dZUmpiY05iNXlJM0tpRVVB?=
 =?utf-8?B?am5OV2xMVHoxemNmODZxVi9FNmlES2piOWtnVENiWldJMW5BM2FBZVE2c0Zy?=
 =?utf-8?Q?sqjSZg2CF+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG5FRDNpMmdLWFF3MXQxaVppa3VxVkVCVUhBZXMvbWZVcllaQjNjeGJZZGtK?=
 =?utf-8?B?aFYrSFpRR29OUFNTbGl0U203ZUxjcDY2WHFEVXpXbFo1enF0NEVVVkhleFNs?=
 =?utf-8?B?dG84Znd3NFhHM010MFMrVWY0dW5vcTNIVmJ2MnlpNHcweFV4Ui84NXBiTmNN?=
 =?utf-8?B?WUtoNTNqY0drZk5uaGRxdkFZd0RLczdkYnNNMUtmRzdNNkIvcHN1NWd2RG5k?=
 =?utf-8?B?VlJQaEdIQ2xpN0w1c2E4NExOakNIY3psajUxMkg4Yk9qTDYvRkVjZ2hLZ3NX?=
 =?utf-8?B?UlU2bG1BM01QT3NrdjhRdjBEZ1FRSUtZeXBjMFl0a0RseVJ4RGFLM1NvUmxY?=
 =?utf-8?B?NEtubm9NTGNuekZ6dy9YVk1BcGZOUldmMTQxdWlMcElBazlRRXlQeUkrQitm?=
 =?utf-8?B?YnBrZnRUcE1qaGtLSElxNTBEbmtoYjNBYWhpdXRjSUxQbWd0SGw3TWhpTkx1?=
 =?utf-8?B?SnhuMVYvRGpSNG9QckU0am1PSUdCM3NLOHRWMG11U2F6VFd2TGIycURObEtn?=
 =?utf-8?B?ZjlzUVRrTGswUjFFRmt2dCtVRWMxTlF1UG42YW55ek9ad2NjNEI3d2JyV2tH?=
 =?utf-8?B?NjJZbStmM1I4U0grUzRXSThGS3E3UmR1bnhkL0U1U0l0WGpwbHhyWmVVUnZj?=
 =?utf-8?B?U3pzM1ZlTDVVTTJLM3p5ckpTVFFpU0FtZWdHeHVOdUZVY0t6WWVpUXhlNnRa?=
 =?utf-8?B?enMwVXdLZi8yd0htTGVESmJRa01UeGVGTGRMQ3pBWlNqUm5RZ25nN1lKYVpT?=
 =?utf-8?B?T3drUG4yNEJhQUdFWUJZTXBxYzNGbDVicmxQQjBhMEtHZjJlNjd5eHZGNzNZ?=
 =?utf-8?B?Q3RrTVpEZ1N2b0tDUTZIaWVXK29HYjZsUjhDUXFCUlZDVDFCcnZJa0xVd09v?=
 =?utf-8?B?dkUvaStac0tUOW1iNEIrYUs5V25GblpwcURlYlVyWTMxM2owNWdCRkNNV0w2?=
 =?utf-8?B?Yko0RjNGd1NXZmlaWjdmQ25CQWtiTGwrbk5ldFk1Z04rMzY4RXZkaEtkN0ZJ?=
 =?utf-8?B?TWVVSFF5YTlxaTNOeXVZZEtZM2FvKzl3SmVTZmpNL2VXRWZKOXZ2VG1GR0lH?=
 =?utf-8?B?bEJTaVcvTU16R1FuMVBENlU2SUFvUE4zekx1clQ0QVZpMDMrMFRHd3ptd0ZH?=
 =?utf-8?B?UW9RdFJQS0ovTnhIUHg5U0VyUlR5WXdhMnhGbnp2SG5Sc2IrRmtHbDI3bHYw?=
 =?utf-8?B?WlZtWE1KdS90bWtSVHhQZzd3THZrUlNWMDhkRTBmQTcxaVk2MkxaRWxwaTV3?=
 =?utf-8?B?R21FeWl4bDZRNzNnTGVreVl1RG5CdFdLblExZlg4QzFWYmFvdWU0UDV5cit5?=
 =?utf-8?B?Q3FzRHl6T1UyRE0yM2ZRNE9vMkhhZkVUUXFub3grQ3R1MGNnNmJPRkNqWkpn?=
 =?utf-8?B?UVNYRjVFRktQYUNLdjNwbEo0eWFkTFM5R2RQeEIvU3hkRUtnWUpoYjB3N2Iz?=
 =?utf-8?B?aGtRTkJqYUJKejhTN0drVHlhSEJrMWkvVHRvWFdtNDRPZCtJcExFRmJKN3JM?=
 =?utf-8?B?d0EvK2sxb3NnYW90OHNyMjVtTHEycTBqMHNQZXdYYVVHeEorQmUveVpvK3Iv?=
 =?utf-8?B?M0xUVWIzNVBkTkNibllFR0lVVmo2cllCQWd3ZWpuaU5jUG51WG9HWnhkYmdo?=
 =?utf-8?B?NUJleHB4Q3FPT0Q4NGZKZkl3aWdnaUUrWWhrSHRZei8zSEZCUTZLdnVueHZF?=
 =?utf-8?B?a3M3Q0pXQjRBdXFDcnRrQlBKekhjK3hyQUhpRzR0SHZSZ2pWWWpldVZQRFpz?=
 =?utf-8?B?Wi9QUEJRZ0dPNkVvLzkwbkYySFcyZDVJVzFlWXVzZSt4VnJ4WjBHajB4elIw?=
 =?utf-8?B?VkdYTjVmbm03TjJpTFdSSnZMQUkxRXFWT2dvWDY5WGJzUytUQTNHMFltakhh?=
 =?utf-8?B?VmlBV21jbXQwMVBURlAza0F0eWhXMm05a29ULzZFVDZaVlF6clFWdFVPZ3BQ?=
 =?utf-8?B?bGZHUDlTQzE5ZGs5US9OVmRDenBYcWUvREhuSitTM3NJa2V0YXNqMG54ck9r?=
 =?utf-8?B?WW8wOFZuSjVXY0o3VXcwMjhaZzRSTUlHQTIrYXNucnlmTmppYWtrN0VWbUp1?=
 =?utf-8?B?YjYrUjRXN3FUeVVCcjR0Rm1TeURWb3hQK1BoLzFobG5KY1Jzc3IzU2tXNVdk?=
 =?utf-8?B?ZWFXSHk5SkxxZW85Mis3eXZwZ0VSK1VoTG5mYkRaUHYvei9neXV2Z1dFc0dk?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b1aee7-c45e-4b92-26b7-08ddf9fa8b1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:42.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcRNvB9VoQ09Us7ahCywouS4oSvouTBR7vZaOdch9si62oI3GjaOXTIksISdlIdcJayobVeTn9pYiw+ou8TnPeV/2TIBwQ9V9efSljbYtgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The LMEM assigned to VFs should be allocated from the general-purpose
VRAM pool, not from the kernel-reserved region.
Let's force the use of general-purpose VRAM for BOs intended for VFs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6344b5205c08..b2e5c52978e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1484,7 +1484,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					 XE_BO_FLAG_NEEDS_2M |
 					 XE_BO_FLAG_PINNED |
-					 XE_BO_FLAG_PINNED_LATE_RESTORE);
+					 XE_BO_FLAG_PINNED_LATE_RESTORE |
+					 XE_BO_FLAG_FORCE_USER_VRAM);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.34.1

