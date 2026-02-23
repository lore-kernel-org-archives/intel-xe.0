Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6271CE98E10
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4DD10E2C0;
	Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoZxR++5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88710E2C0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771840651; x=1803376651;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ehCWbNhmnr3S+0mlAnHXJaCyXdG4tioThXDHmrq9L4A=;
 b=aoZxR++5P1aJFH/ue856vHkj0v14bxHjgBsL4cOE+iIuFWQ50LWjWU1l
 jZFQzgVb7Qys7Dx4HSwhuvxeqqWlQ+5/M+sYZOhfR/C3eefk2inxoemzv
 NdzUiW2osBx2tP9DyVwqxWDudjdUJumjf1n7QH1OMb2ojpPUGI/4SYfZY
 p9+MS4yWTniGkOFmqz1jJMShLMugQsU6KndChhxSfdubd5hOu2UJa6ozW
 8OWUxtEMYsIEx8u7eOMJ0DkFPYQaCyjtS/IC4WWOlYwamduLLZLsDePwr
 ZUfkNbOkdFJbTdO1SGKNv+jUrZie7M+4mi+gg2+/AfHgZtSAkR/RuhWmk A==;
X-CSE-ConnectionGUID: LK0ZVH2OSA2gKPXWyFqwoA==
X-CSE-MsgGUID: rxqP0rSUQfKXKWqFVO4txA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90238162"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90238162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:57:30 -0800
X-CSE-ConnectionGUID: ZtaEDdVWRKGNupmx69AWYw==
X-CSE-MsgGUID: KrAII6D+Suq2GhE/Fexz8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219628822"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:57:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:57:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 01:57:30 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:57:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i65ebOAEFtDTB1f85qNEbjxZ6UDMtK6/3L/zhYrhqa7D7p6myfKOauzMNHn3HCWD78XiRTVVFHvdyCEgfgGIhfFUkYY2ZPVvnn17DmJgWodPYlJCzG7alArXqkGqPM0W0M7PNkgPuugIZUNHvhun4WVMxly2Fy0VWqzoasMPDG4Tdoh9g8sECV3wD6fBivt/71Bxv/n1Uvrq/Vy6NxGy3Ks81DnUq5DYfUOlIRtZndqVnxbnlcG1Xq/iuoYNEwnlfieqsyc6xD+/mG+20TIKjvdq3xRvJP3xD2aUnTxA2faulbNYl/FRaFzUR0Z1lHAtuYKFRINCIxt1tQmE9/wjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLrE/sxEtM+6xQyYAUWK3jmGt/RTWw93J3FUk5Tid70=;
 b=RgqC3aXIBfNMRIjw0Q/rVxBcOu2CnbQDyUB8uSWD6B/t98/hBX+bwV9FajBkgmtTO48BjtTYqlHneqoVPTe1IMbnvOAq0ctpt3B70J4KKPAB3gQNpDcdIUyZNijsz6dalOufShKJEFZk275S9ksbcL3xB9iIOSRCkoPA+ndadUWVUBQI4lbY/Tr9ViNtXHhO4yPEvma1kRDnsWAijwY5IRWYN6l7KFvV9dJJBzF45bmAycSJWA2nJvfzrst7/i/PosdnG0f/NBMddXaU5aFGAejF2NquGM8HkLLHyoC7lMWPKWpL6fgni1vpphXbn3+E7OywwZavWSiqTEuf0QOWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:57:27 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:57:27 +0000
Date: Mon, 23 Feb 2026 15:27:21 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/23] drm/xe: Consolidate workaround entries for
 Wa_16021867713
Message-ID: <aZwkgeMIk2zwpT25@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-4-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-4-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea52eee-1fe8-498f-58f5-08de72c1f3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDhreTNaRC9QK3JuN1plVlVsRmIvaVlOemJ3SnlyWXJPVG1obHFaUklVUmN4?=
 =?utf-8?B?bnlRUVpHQzJrakw5b212ZGRaRlFBUTdKeXowZ25aT2Y5UndWdXNOK3V0cXZH?=
 =?utf-8?B?aEMvRDV4OTV6YWJnU3UwRzZFV0FwZEh1ZUdrQlFsd0JwWk9FZmNpT2NadG43?=
 =?utf-8?B?UHJaUWF0YkRnVUpWdDZ4ZlQ2Qkp0OUpaOXBpRmNTS0xEV3NnbWlzcEtxMUtl?=
 =?utf-8?B?RzRTNC9RdllqbjJvaXB3RllyaElDUThRRThnU3hVOFJTekJhZi8xNkFhSkhI?=
 =?utf-8?B?ZmluNFdpbkcvczhLZFplc01WN0dhMUprRWNzUmtISlM0OW5VUG02YmJydnU0?=
 =?utf-8?B?WDliMDVkUm5wWlBnYml4cVZiSW9hY1UzdXJaVUtuSlo2cDZsaFh2VGlaU2lT?=
 =?utf-8?B?RzRKNFZUQUhPbFhZQ0p4NVBOU0R0T1VCd28wNUhXVmRNNGk0N3JZbEh6Y1Vi?=
 =?utf-8?B?UHQyR2J6OUF4L2ltSVdneTJ3eVFjNVBiTGdLTWErQW03UWJheG1JMDNIbzJr?=
 =?utf-8?B?d1NEZjU5MitBVW53MWdZeWQ2RFh1K0R0Zmptc0xpb1VpZVFJWnBjUjlLbmlZ?=
 =?utf-8?B?aWFvVUpoMlNSVGJjS00zVUhaWTQ0RFlQalNFQ2cxZEpjUnhZYUExUk9OVHIw?=
 =?utf-8?B?SjAyWTVPSHVwcjgrbzFkRmNGNytZeGNDV0NqVXpxWXRJTlE1RU5qclgvVFpV?=
 =?utf-8?B?S0RxSmdsck92NTlkbG00WXhQdHI2aEJBbUJxRGt2anVNRHlObHdEc3RFRjlq?=
 =?utf-8?B?Q3Y3K3ZNN0drTy9qMXNMQkUwZDN4dEl4RlJveGxGdVFWYVVibWlESGw2Y3BN?=
 =?utf-8?B?VTZGMXJmRmRFZ25TcTUyTWFBeHVQTWJ0MzJhT05LcllsUVI1WWZVdE1YWUxF?=
 =?utf-8?B?cExxYjFSL3gyUUZmVERTOXBOb1B6NGZZZXl4V3JNbnJLTHlLWjIwNHVGNFhH?=
 =?utf-8?B?WTZ4KzVMNlB3MHAxeERQVVY4MnF3ZUpwTUt0TmFtQjZMNTFtSnkrOGV5Vkxr?=
 =?utf-8?B?UFprb2lNZnZHUXdEdmRFZXZhME5wWTQzK2lSNWtkcTQwMk01T0tnT2VydGl0?=
 =?utf-8?B?VHZZelJVbjl2THQ3WGV5SEM5aFJiMzhrc1VGR1A1RHZUL2tFbWQxWE5wS2ZC?=
 =?utf-8?B?QS9CRGxjbjJtajRCVXpjZTc4eUxzcEc5bEs0R3ZlQmpPaGdQMnZYOXltZmlJ?=
 =?utf-8?B?SkhLaG5TU1Q5R2Jkb0hYUDE1U2I1R2hmVFpPY2xoOVhCRGxkYmN3a1drbXc3?=
 =?utf-8?B?dzFnaVpVZXJNM3NhZXFLbkppOFI3bTNQUkE3WGg4Q1NucTV3YlVaZFZXS25o?=
 =?utf-8?B?RGNXR09xM2V3SGxFOGd5OVorSmxKK1BXRzg0dTFnNitEbWhRdUo2ZFBMMzZL?=
 =?utf-8?B?Mlh5NENvUGZ4VTAyRzBYY0VYWGZ1aW00cWVaTjIydUZYSTUyMlphMzJZM2ZG?=
 =?utf-8?B?bC9WRW1VTUpVYlkvVXFzRUpDTTA4MklUUzhCZmhvTGVuTmt5QkVVWDAvMzgr?=
 =?utf-8?B?bi9JUG00TGU0blVjMzFJYzhDcjF4a1ZBRDduNDhOam5hczhIendOZFlCdnRM?=
 =?utf-8?B?SUVKVTVseXNkR1oyNk5uQTJNazhQWlB2OURVaUFBdzdEMzlaNjJsRjJaYTVq?=
 =?utf-8?B?bVhxbmkzSDJVZHFER3dBdGlYWVBQbjk4N3NITHdveVdqNmlaZnRYU3lIeThx?=
 =?utf-8?B?U0k3SU51azV5Q0xsUGVWUTVSaWUxWDhaTjJ2VlNjQjVWaDhnWm5RdVQwMGow?=
 =?utf-8?B?clgzSEhLaGhzWXRzbnBVRFM1SzAwUkxZTVJqMnYrZWhmTFlTS0R0SGxZZzFu?=
 =?utf-8?B?ODNLeG53MEM4eUYvU0YrYmNJU09SWGVtWUt4d2hYa2RpZ3k3S3pidHlqZExu?=
 =?utf-8?B?OFZnQTd6RnBFQllCNlVoc0dEZXhLUTJhck5HOFJ3VU1lM1BtbjUrWmIySzkw?=
 =?utf-8?B?S0VMb09IdHcyVmJXeFFSS2ppUDAxSWdsend1M09aWTBBR0JwOWxMaXVaOUVR?=
 =?utf-8?B?WkphYzFWNTRGZ0w4QjZ1MXhoaWxCMTlCdzlNd2h0WmNSVUJMeEdGSUx6NWlv?=
 =?utf-8?B?V2U3Qlgvdi9JcnFRV3hoT2ZuS1RCek1sM3A3cm1EeEp6V1BXL292THFZeWs0?=
 =?utf-8?Q?tAas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnFKQ0NyMnBmY0lqZmNFM3g3MEppRDQrM2xNeWwxZHM4Z3R6UDk1Sld1aWto?=
 =?utf-8?B?WTlUQUIydTZXRVVZWnY2REJHSjlKcGtTYktJUVE4WHNoTEJCWW91aHl1Kzdh?=
 =?utf-8?B?Nlg3NCs4RnZSRW1UeFZGM0pxUnVsTnpaN1dKOXFqL2VNZU5QVTIwcUh3aTNF?=
 =?utf-8?B?ZEphdWRaS1pvS0d5V2pvMmp5aEUyQjVnOWJLWXp5d0ptdEtkZlU3MTdPc0l1?=
 =?utf-8?B?c1FkbXdRMlFtQ0tDdG9hMHhrMzF2RXREbW5ISkQyamhCVW83Q1BoQnIzUWRi?=
 =?utf-8?B?U3ZRQitKWmZETFlHeWJ1TFZFTC9uKzJCbWJuUnN4YUZ1dTl4U1ZrQndaUy91?=
 =?utf-8?B?SHIxNVFzd0pTQUhBeVI3N083Q3VHOWI3YUtKQjZmVnNDMjZwZlRYbTUwRnVQ?=
 =?utf-8?B?SDhvaE1lME52MUlwWk9ObUpsWTBrVksvWUowTXVtVlgrSTV1Zi85bDFoZUxW?=
 =?utf-8?B?bXhDWllZVGpiZUhFYkdNdmtnb1NXRThVdWhacWNIb0JDTkdLaW1qYUhCbUV1?=
 =?utf-8?B?U29vWjgwdUpGZURPb0RScXhkcW5JRmZxdUwxQ0phZkdNM2NuSjVleHdVVmlK?=
 =?utf-8?B?WXRSSEVXWGkzRjZWTHBhSW93dDg2elFVWlVTZmZwMi9HdkdscTJQdFpSckFo?=
 =?utf-8?B?SFp4d1NtMExrcXllRVpNR2grK0E2MmdvUkV2dmw0MFlTcU9CN000K2pXMXVY?=
 =?utf-8?B?Njg4byt6MWt0R0U0NGs3MkNhYjYrSVVhbm1ncXRwazVtVnpDbXlFK2ZXSXFp?=
 =?utf-8?B?cysyZVJwdEE4UWc2N2loNVZiSzlXVU52VSsrMDlVTzNtUnJEU2hjTTgrcXNN?=
 =?utf-8?B?OTRLMVRuSWVxS1U2cklEcndNUTNIOFNOZDdnRDZRU2VORHhWYTE4eVJxQ0ht?=
 =?utf-8?B?dWZRNW1QS29ibGdCUlgwZG9ybWNabVdwVHFWQ2tvOTU2V0Jjc2JhY2xOL3lk?=
 =?utf-8?B?NStiWDFFT29ma2hsQ3J0UURPNVNKdFFGVkhDWlVzQUYxOGR2Y3p1aXN3dTR5?=
 =?utf-8?B?QlpHdFhIR0xzTTN5N3pQeDlWS1FYcjh2K0NRSktObUNnSEZpb0tzbE9Hc1Rn?=
 =?utf-8?B?TEoyVzFrSnBFVnAreGhxQmR5NkM0U2dWcVA3TkQ0OFU2b3I0QXhIOE1ibGFp?=
 =?utf-8?B?SjJacWdMQXhaZ3BWS3c4QjhzTUVSZEIybW1iakl6dHRzQnovclNTQzREaUYr?=
 =?utf-8?B?bWl2NU4zTHZpZGdaZzBaRWtzUGZjc3h2dEd4YkxmMHhjc1pJa3Z5ZUYrNSsz?=
 =?utf-8?B?K0ZGZDBZbC9HMDdaV2xHSG8xZEI2aUFSbnNzeGhnYmxxclhLcng3ZTAveUpx?=
 =?utf-8?B?cVZaNDZ2aXR2K05XR0llTEZuNDFvdzBQL1dzbUNuRXBFWWtVRk1mVWxFUEtx?=
 =?utf-8?B?UEEyR3VNNk9LdUFQaTNiMXVxY21sTjBTWTlvSXNXRFEwbzZ5YlJtWGtPQk9U?=
 =?utf-8?B?YlRleFVhUzZRMjk0VDFGMWtkUENDM1d0dHhPMDQvdUpBczV1Zi9iUFRCcDZz?=
 =?utf-8?B?NzE2R1Fuanh0VTBvaEprNGJvekx3RHExTXloMXdncnExSjdUdExpVVZaQ2Fo?=
 =?utf-8?B?TnNEL1dici95ZTVVcXYzTEMyWlBzWEhKZk5BZU1CNTU2SHNFZGlOaGJUWGM4?=
 =?utf-8?B?WVNNZ2xsL25BaHhzdXl3UG13WU04NElXeGRxMzk2R0F4Z2cySTVXSXJuQlBu?=
 =?utf-8?B?SjJQS0drK2FhZnRyT1EyMVdtbVlBSys3dmg5b2RReit4RVFrWnY2VHoyekdo?=
 =?utf-8?B?MFEwZWJob2VEVTVVZ2hzRjdSMS9GRUZMZHYybXM5bXIvYUVBOE43OVE3L2hM?=
 =?utf-8?B?c3JNYXRwM201T0lVbGlseGFWUlkwNFFVZnNKUjZ6RTdjZHNlNmdZRmlhWklp?=
 =?utf-8?B?blV6dFQ1MU05U0RQZG5IT2lTMlhqeksramt2eWRHcUlkc2tONTdJaFJmM2pD?=
 =?utf-8?B?VjFwVVhiVjRwMUJYYVU0RURXdVExcGhRZkZYUHdKc1U2cDZ0YitKclJEcGFs?=
 =?utf-8?B?V0xaenQxMHhOL0JmRHRHUnJoUHNBaXJJV3owVUFFYkcvTUhSaGNpVUh3TlRt?=
 =?utf-8?B?bEE4UGNyT21WUkF2ekhLWkNpc1hRVE9WcjZQUWZMQXlDd21HdWRDMmdIKzBH?=
 =?utf-8?B?NUJTT2p4N0xncWdIWTIyUFg1cytTeStnTk9BcXE3Nk9WZ1hhdGtVOXY0SmtC?=
 =?utf-8?B?VnQvamY0S1NabGxFUHRKcm9TY29HaDlhMzh1S28zZFg3MEl2cUxjQldrVXdT?=
 =?utf-8?B?SHRFYkJIOFB1Zm8yQk84ZWVCNHZtYXYvN3FsUWtnYUV0RlU5eXZmUlBEVjgz?=
 =?utf-8?B?T2Z0cGNRTGJMMHFVWnVsRDM2bmpwRHlTTTE1RnlKUGdjdk03dzNndmNYcldD?=
 =?utf-8?Q?ziIt6I8YXLrzhwmQc4WvJiBW9dPZmgCsrb2Eu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea52eee-1fe8-498f-58f5-08de72c1f3aa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:57:27.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI6X2Xm5A6BAlzsR0VC/wjgr1e6ymWt6wMbb5PtF9lPbYVrN7AfcFiNcQ1aRm42PC5nvTV+mgdeTorRCsPo8TRB06Z//j3VOzALVzoGSSna0DGreUYuGdHbgmWcxbx6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_16021867713 applies to every single media IP from 13.00 to 30.02
> (inclusive).  We can consolidate the multiple per-version entries down
> to a single range entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 38 ++++++++------------------------------
>  1 file changed, 8 insertions(+), 30 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c3d694947bd5d2b178e9da08bb937dc6a171b326..4a8685f2ea985cb67b21bdf8a043ad1dfdfc816d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -131,6 +131,8 @@ __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
>  static const struct xe_rtp_entry_sr gt_was[] = {
> +	/* Workarounds applying over a range of IPs */
> +
>  	{ XE_RTP_NAME("14011060649"),
>  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
>  		       ENGINE_CLASS(VIDEO_DECODE),
> @@ -146,6 +148,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1260)),
>  	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, 3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
>  
>  	/* DG1 */
>  
> @@ -213,12 +221,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe_LPM+ */
>  
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1300),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("22016670082"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1300)),
>  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
> @@ -232,12 +234,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("14019449301"),
>  	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> @@ -262,12 +258,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe2_HPM */
>  
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("14019449301"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> @@ -291,12 +281,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe3_LPM */
>  
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(3000),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("16021865536"),
>  	  XE_RTP_RULES(MEDIA_VERSION(3000),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
> @@ -309,12 +293,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(3002),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("14021486841"),
>  	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
> 
> -- 
> 2.53.0
> 
