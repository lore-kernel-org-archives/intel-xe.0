Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49239C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760310E1A9;
	Wed, 22 May 2024 17:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMnFIA46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF06410E1C7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397282; x=1747933282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rmzaLuAShXNZvD/dQCz1UjiDVR1kWrtrVx8hxnPAusI=;
 b=WMnFIA464EcUwmEAwzIOa9CDiSFUTZJa2i4Ifd6smedjyrxQITXSsAAL
 yMZSTh12NW514AggXUrf1GqiR3l8pVOh2k6vMi5DTGvVncqGffCCsU2mq
 EEhyn9/uznLyXAv/UpmZ8diRQ1s89TlSuUsWngcvUXH+xTQyi90KBM6sN
 0STqM0hPTHj87a+pNJo2Rzs1U6cHTXbjdNJJRvBIt29G+TRl1/T0zLeDx
 7pkePDvyzN958KpMPKb0l9Ptz1PXjymS2b+Mvyr/9prcyXFFGBvuJW/ZF
 VlMFJzk6g08dkIFn4UGxtawRYNmG0U78yHiJsAD37ziOIQGXpJVg0KLTB A==;
X-CSE-ConnectionGUID: Rf4V1cWaRJWh6g5WRFznHg==
X-CSE-MsgGUID: HHpzbjkTTiSyPtn9h1rxEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12783276"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12783276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:22 -0700
X-CSE-ConnectionGUID: cGqFmOSHR2OtoGy9Sgpg4A==
X-CSE-MsgGUID: me5CmHvmQeW9YcaYIBtA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33479204"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMEvTrN0u5U2CiP0K8bADNjpYvalRe2Ldk6LSUJa1wmW33gVIm4/ExlWDz5jA9hOXvNxoWAzlA18LTnoGIqiWtnZwnFkxOejnmOgP4x0XUQ/i9zQK6JfX0zbBSrCsmXWH7/acHhQ/wcQU+Vw6Q31w2gNBdXrirRBoJ7wLLb3t22wY58+oJyF7tRMSOMnMEzLxsInL23fr+cALC7Wl5+sKhgV9AdPT2r16UoLKexL2hmgnrmpH5O20mlUFbyeEo30Dm9iRq6oOloibfXcAqyNz2v/QcCKLZYLE2VmoIbtToZihSAp9eZ4ZNVrC910RhxdA3Q9jQ0BnJ92+/z6PQVuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE2eQAlmBgORX6eC9eZBlDgAs9B82atc+XyWm0PlssI=;
 b=UT2RrG4dDuvwqkNtfORXFWt22rBJ3MrC2fgiJnmtutOTh9PoZNY36dATiWa0ZqjrZ+rdAIbqhMTYFQxF8ts2gLZNv560KpY3EpstCJhB/B//VLw3IKwJrhtSTfEVZluhWDrzrlnsx7H5TNlE9vkAcm+Tl4rwzbRLkkzrz6qu4f/C+93wFTsPsA6k20YJgD0fG4F6ACcGv5qjJZpLovMNLvn8/w272Y8gTA3eO2xz0Glx/kSGOU/sZyvL0gc/m7p9pkUG8AMrq4CJplKR03bnZ6N1ot0IjdElWlifaj88yWKUvg3//jv/vRuXrRjVRj0gbpQ7OXXTqkawhHGfVhzC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI 3/7] drm/xe: Relax runtime pm protection during execution
Date: Wed, 22 May 2024 13:01:01 -0400
Message-ID: <20240522170105.327472-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bdc610-5843-4b7c-d46a-08dc7a80cba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFE3N0V5N0pSaGh4ZUMwbEJiUitsZ3paMzNBbzJCdDlRR3c3cDk0K1M5SG9k?=
 =?utf-8?B?dnlRRnMvek5KZEVNdlVMSFpYN0JTS05sei9jWUhEU0R4ckx3ak8zREJYMWgy?=
 =?utf-8?B?V3ZFWXJhVENKYlJFQm54cmVLRUxaelE4WVYycHBXc3dRUU9GN3ZlMFNOS2FT?=
 =?utf-8?B?UWI4eUplSnM2MzIvRGx2dVhhelh4eVNVT0xjQi9QNDFFdkhteTIxK3RZL3R1?=
 =?utf-8?B?ZG4vL0dxL2w2cmd1ZloydGJNS3BEUmdERGxtckt2OVdFUnVib3AwQnpINkxV?=
 =?utf-8?B?c2xwbmNTajFTWHg5MFk4c2U1NmV6OE5iK0UwYnBHM1B3VTZreC9VUTRYREo1?=
 =?utf-8?B?aFpWK25xMVlWeFhIR1pHakw3SkZDY1ZKb2gxVXVOM1VScjVqS0xiaEZhaDZT?=
 =?utf-8?B?dWZZZjV0MmlnaWRnZGxudFNpMWgxc2k5UG1rdnNLZ3JWM1dYL0lmQS9qdWpG?=
 =?utf-8?B?TjBqVTZXNENiaHo0SzNHZlM5eWJDZ0czaGlBZFlIdEsrT0pHVnZoRU9RWnkr?=
 =?utf-8?B?MjJkVHFKNGQ4dGdLU0hURDQ0RkFzdCtiNVRnS0RFZVBNRVQwbi96ZlVGNFB6?=
 =?utf-8?B?WGpRdC9xKzBiNUJCczMxdE1TVFUwOGo4d2g1cll4dzluQWVQWnJIZDB3U0Jy?=
 =?utf-8?B?T1NWbnJuU1A3cGx5UjFhVVE2dlRxVktocEUvc1l0MVA2ckZwQXdZZ2I3MzRq?=
 =?utf-8?B?WjNYL0krWk1qUGxZaUkwRnEzL2VSVkIxeWZOU3ZFQ2NxZ2paZjNzR3orL0tp?=
 =?utf-8?B?emZHVk1YNmZ0NlJiZjRlalFBbWVLYWRiWkloWS9qVlYwbThTU3NNK0psTkQx?=
 =?utf-8?B?cGMxSkdlQ0x2c2MyRXJMblpTNG4wem5kNlpwNmVkYU1PWFVPU1BTeTlUTUtx?=
 =?utf-8?B?elRhODJtOEVCaHNicVZRTFJqaUM2aGtEdW1zT0JxOGVqQVFHZXpFSmZHT1N4?=
 =?utf-8?B?bmVNck9TQ2w2Qm1mWUtqV2w2OVhJbTQ1NUdGMm5lU0xtMzM5aTZMNzNWcHVG?=
 =?utf-8?B?ZVFCbjdZeVJ0eXIxMXNJV0xsdVJOdmVnT1ZsTmFCN0FhenRRQm5OTEFvbE9n?=
 =?utf-8?B?bmxkNUwxemdzdHp6TFBoQXo1OWNidkI1eDhQNnl2RmJ0Z09DWS8vcDVpTWdm?=
 =?utf-8?B?TUQ0ZjlGdnNkMkd1SkxFVTVoUDNKUFF2Q0cvMHF5N2pRTjM1b0l6aCtYbUVD?=
 =?utf-8?B?aUl4UFg2dk1zS3NyNTBqYkNmTDVBTVp6ci9hak10NXVaaTRBbmltcVR2SE1s?=
 =?utf-8?B?K0F4ays4Y1JObTVYbmUwakc2MFordmJmSE9BWkFEUXh5NnU3SzlLQzR0VkU0?=
 =?utf-8?B?MXlhTzl1NnRtNDM5VDFSWlN0VlZyTnRkY1BPbDNuaGwwNW5YQldtS0lmdEMx?=
 =?utf-8?B?dVZvMDN3TmUzNXYrQ3o1SWZvN0NsRUdXcUxlWXFUUFNUZXFNYjJ4bVVrcno4?=
 =?utf-8?B?WldDUmk2ZG9ZZitES09jclh2SnIxRDdtRGwzRUlPWnZ3VnlLQkdwVllRQU5h?=
 =?utf-8?B?RFgvYzdUejAyTWIydWlkSWJEMndXTmN1OElqUHFJNnpGZ3hvUm5lT2tDZEpJ?=
 =?utf-8?B?aUE0NXlySlh0QnFHTmlpcDNGWHVSYXpteENoRWl6Q3lMdS96ek5LN3lPaTBa?=
 =?utf-8?B?OGM3em1SdXdjd09XNHo5eWpaNmJQQ08wTUZXTUdMQ052WjIzUktLTEtpcWZO?=
 =?utf-8?B?bnVSQjJGc2xreG1NZzBLVFhkTE1IeGJzTnBNOVRWTUNUbVAwRWxiNWlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnYveit3U0NPRzN4NDk2NnBVbEFWOFptUkZpM3p5dTh2aXZ6NnJxVjJQQjE3?=
 =?utf-8?B?azl6alYxOFVRZWQ2Y012ZjROWXRxLytsNGcyODhjNlNqdzhHdFJVVXVpc3k0?=
 =?utf-8?B?bEI2MmVmUU82ZWhONWhaZTduWUdzR0pIamhteEJoVkE0WjkzMEZZRGF6OFdk?=
 =?utf-8?B?Tm9NWnM3MkZhWlZnelI2S1IxMklFRTVsNXozc0Z4L25FQ1h5M3N0eW1Tb1Z2?=
 =?utf-8?B?MU5Ha0pUUjFObCt6SE1MaGFMek0wQVlPYlNzeFo0RVQvdlZ0Sm42bXZuZmw2?=
 =?utf-8?B?REFwRWVFVTJabTJ6dnJUbGNJOGUxc3k5K0k2UEVEU0pmSXVNV2NIMGh3L243?=
 =?utf-8?B?WHM3L1lvNVA1RVdKNWFOT213aU5zSjAyaVpnaXc2RHR1U01HU1pxSTlITzFE?=
 =?utf-8?B?dnE3VTg0N3VPUXA3bGZ4VGZ1bnZpK3owbXVLTjd3OUU3UVhDaU9EWEIrUkY0?=
 =?utf-8?B?VXpHZjlVRm5PajNwTXJnQUZGNVpRMjBORjZZYk93eElMcFg0Z01zaGJmTkha?=
 =?utf-8?B?eERkNlEwRnY1Y2tPQXBpcUdxaWxseFV1R1NnaUlNcTJOODVnWDVEU2dYUDhy?=
 =?utf-8?B?ak9SL3g5QWhmVy95OWVZalN4YkpmdXlCQUZHZXc0Z1RPWGhtcXE4WUdIVDkw?=
 =?utf-8?B?M21SRW5yNlNxaWdkc2lkelFoL0RQb1ZLNkQ0ZjlXb2VOZ0lyWVlScHptQ040?=
 =?utf-8?B?SitFTkp1YUg1Y3JXZFYrTmRRcDdHR3hHZUVrTFBFN0Zod29KRU9iMzJqWjBa?=
 =?utf-8?B?UDFKd1k3YnNwM05VUTBEY0k5aDNOOU5nR21hMUtQaEFGZ1MvdUh6aTl1Qm9z?=
 =?utf-8?B?NEpQWG5sbDBJQ0Jtb2VzQm9GN3pDc09zd29kR3NaaGdvaHAyMWtyRENLYUlV?=
 =?utf-8?B?QUhlSnJVbFYvR3RVZkFuQVh0UUhZRG1vRG40cWUvVTI3VVoyZ3pFcjAwcEp5?=
 =?utf-8?B?Z1k2S1hjdW1xalppaGpWWmFCOEJaenozS2JrRlBGWmo0VVpOMUw0aWJPOEZP?=
 =?utf-8?B?dm53TUNEODNLQ0RJZWhubnRudWwva3JCVWl3STdoazlNMzZkREtNMzh2MWIx?=
 =?utf-8?B?cllVMjdLWGNTT2VNaWpDc1JGUloxWUxXWXBYcHl4ZTNqQy9WcjBURklnOUht?=
 =?utf-8?B?ZTZVOXI4L1hFN01lTFRHV0JZQmYxblZQRlBmM3Eyc1VSbS9IeEVqSVJaRnRT?=
 =?utf-8?B?dGJvdTdDbExod3d3OTc2aVJPNHJOWFZMcGREUldkV2Vpd3d0eDQwTzVtb1Vs?=
 =?utf-8?B?RVJqU252VFNCTWYrSVA4dVAvbE10M040Rnp1bWlQaFZydkJubThVaXVDNDZH?=
 =?utf-8?B?WnlqTkp1ZmRPYlVsMVROTEoraURtVFBZZlErZzRYOFdCQlVzMVYwZklLR01V?=
 =?utf-8?B?aFYvbU5yeCtUN2VDYk9xZEovaHRTUnJCRDBmNEtCbzZ4dXJabjh6V1B1Z1Er?=
 =?utf-8?B?U0xrZ3E2V1pqQk4yUWNQTmtxZExNR0U1OXZyLzJsU0grbDErWGVPRG9RTGxu?=
 =?utf-8?B?ZU5QbEU0SVRIM1g1U3RlRGcwVml0ZVU4M3lOWDljcjlrQjRiZVFsem5DdWkv?=
 =?utf-8?B?M1dyaTRWL0k5T3AxbEJ0RDJTNEZYT2FuNVc3c1h5M0lXMFNoVVNXOU41TU5O?=
 =?utf-8?B?dUZuVE5wOEdEUjJUZkhhcXZKYUVLRE5VRnNFbnZUOUhibndsYzVJaGFzR2dk?=
 =?utf-8?B?WlBvb3ROQVIyWEYyQ09IaU10YUN5UEE3Rk9pVVRqNlVoeldNeVpIOUx3bXpF?=
 =?utf-8?B?cDlRSTBleWVRMXdmNFZKU3hwN20xcEQwc25RcDlmOEYyRGFHUHNCMDFwZ1lk?=
 =?utf-8?B?K2hvZGtRQ2pYOEtIMWZsMGduWXg2bHVoT0V6QmxPbXZXS2NSTUkvTmlHdmhZ?=
 =?utf-8?B?OThWa25XQ1V3bTlKY1FYVFp2SlJieXFmTGwrZDRxcDZlNHNWZmhhQlpoTGlT?=
 =?utf-8?B?NVRoYUNOM2dZNmVBMWpUZUY2ZGRtTVhZRG5lOW42VjlRQUxMc1E4ZlFqMUgw?=
 =?utf-8?B?SkJNKzJHQnlrdUJ6cDZXQ21yMUlTVEZLMTcyRDNaQlBWOUZSUEtjcTNJd24v?=
 =?utf-8?B?WmgxandGdjNiNVYvTUE2cWZGSEpRbFNUMklzQkJPWG95YjFFSm9XZGU5RkdC?=
 =?utf-8?B?bEpqODU5Uzh4K3c1Q1N6a2VSRXljcjRaMkxJZGRRWlR4U1dhYXp6UDd4VWJP?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bdc610-5843-4b7c-d46a-08dc7a80cba0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:17.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u85ko87YQtDq0FwBf2tRu7929UGa3gudDnfMBAJKn4HVA/Nxs2Dmqdx7/OjmH4yTqcAOdai3y9yUvxj+zZF/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Limit the protection only during moments of actual job execution,
and introduce protection for guc submit fini, which is currently
unprotected due to the absence of exec_queue life protection.

In the regular use case scenario, user space will create an
exec queue, and keep it alive to reuse that until it is done
with that kind of workload.

For the regular desktop cases, it means that the exec_queue
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Cc: Matthew Brost <matthew.brost@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 --------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
 drivers/gpu/drm/xe/xe_sched_job.c  | 10 +++-------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fa6dc996eca8..0fd61fb4d104 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -106,7 +106,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -119,17 +118,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_get_noresume(xe);
-
 	return 0;
 
 err_lrc:
@@ -216,8 +204,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b041b7676c08..b5823a676ac2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -1088,6 +1089,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
@@ -1098,6 +1100,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
+	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..a4e030f5e019 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -158,11 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_get_noresume(job_to_xe(job));
-	xe_device_assert_mem_access(job_to_xe(job));
-
+	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
 
@@ -191,13 +187,13 @@ void xe_sched_job_destroy(struct kref *ref)
 {
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
+	struct xe_device *xe = job_to_xe(job);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	xe_pm_runtime_put(xe);
 }
 
 void xe_sched_job_set_error(struct xe_sched_job *job, int error)
-- 
2.44.0

