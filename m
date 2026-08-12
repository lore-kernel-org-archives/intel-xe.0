Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED91C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 18:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A740710E331;
	Wed, 12 Aug 2026 18:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZ3/5o8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271510E331
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786558068; x=1818094068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NMQ1AzB6kkielxgDIzBcB71wpLAkpHwNFlK8LDu0yl8=;
 b=YZ3/5o8FZ8g5BrtFdsu6Xwlir9F7aHZYmq7O6wvi2+pNzKEP7G3AW+ab
 +obuhjDBzohbY5HNMk+sWPllDr7f5uWT/LZGdZBp/IJ6qv613IF2F3S9F
 tJzaU+KzrE5s9BKt5knEnz99P/ZGU0VkZo9ZdGQ/rICZ0Xg5aNfigrdhW
 CpBlPAqrbybhlCNfQyBqApLF0LKEFleYFMLIBqTX4o6a58su3xsajKVvg
 qFYEbbACMMecwSKNYt+sGo8YD69jyGRPHX6VqR7PQbvZCVPa0w0VChljC
 BPl3aXsEeXYaj34aPDPWvV2rwsU1oMl0s58urS2q32z1jbOsCrVNxItYR A==;
X-CSE-ConnectionGUID: WiQ4Dsq+SWul6/M2ywQ4gA==
X-CSE-MsgGUID: AOaIZ43mTTmKsKm6GR1nBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112665616"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="112665616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 11:07:48 -0700
X-CSE-ConnectionGUID: KI4qyCkvQ0aKe7UEBJlOcQ==
X-CSE-MsgGUID: 6uZWVjLQTfC50bksRJDp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="262403039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 11:07:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:07:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 11:07:48 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:07:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCQewOKf78CGz706nqHYmC6ocOdSYoC/6pAIWcMDskwG6He5G5z6panKQIt9UjUCgxr/I1zJzGP68pmiBBX/9rcCPzbn8YoTuSsHBrsIPP5wZc1o7NSM2veB9YyZZ53DBsjT2U/SbnsSgVddkpzAUjOdChALt3GyUPTY3lDdKIhXsrJ8a8SNT+TH/TuOd+WUr9lBDlAXGqzWSBtjbHlddcm59YlSLx9UfjSt0plNguTKyNkV6x+VX1D8TLy7IYnEO1Lr0NRLZswa98D1xREhLsjJnjXxKpodUDIl23LmfM15aIdCAi641zHIHBhuRHKo3apWV9bAojEqxPaFAny0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBM8turLINFW4X1c19j3AiOybss0Ko6GSns8mnWYXD4=;
 b=mtLjFdwWnnlymuDl7hWMTS5M6oaVjuH9K+8RoVBXu/c5rNS3hLdyyDy0ovn4VgdNd/S94yPS8DhXc0/NM6KUZeuHOrfi/A9cmmLUNdCXEPZzMOvPrysTJ8uIDRzY6KzcfDmQ3GU84sarD4gw7OjLqq4RagWot9VCmtI4JQjaVeuiqpnB9LIgwmhWnSj+/2inhQvu6LNXqJcGWYdCtJw/phy1b4p71JfM0DBOBjqB3CTBBrKglqeoUCo+xaQH65ksJVbLYUoFZ8Agu9ZCz2hjOAA9Ou6clWc6PUE7MAOveyT9erPqcVfxUNxWGhGjYiTFPlHibTAi4lW2frk2ONHQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 18:07:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 18:07:44 +0000
Date: Wed, 12 Aug 2026 11:07:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
Message-ID: <any2bd4cNnfwj0O5@soc-5CG1426VCC.clients.intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
 <a0ba4234-5767-4c63-a0e8-1d05540faf99@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <a0ba4234-5767-4c63-a0e8-1d05540faf99@intel.com>
X-ClientProxiedBy: MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: a75f3f20-ef26-47f9-e3bd-08def89c9b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jM3mltYFRaW0wG2neNyqEPySAujsha610lCGE6s52Qrztz+Z5SxLpKmRXuSc55t3b6KVikrPtfWjYVkYJutlfZrKNbERLnT25cUrrQoRP+HcL7xt45KJfmBj8dDllo6IHi2A0NjAti2EB2uyWK0x1mQBmvE4Hd5E6PRepSzRtg5/vzziqBbHyTfuDch8Dd51raxHkWFzSM8Oh6cr783kgGAHk67Hgf/1fd/2l72l8TTrncGq+7jDW/4TwT40KzEacaqArgS4vb+CUgOyuG3Iocj5+bMGd721vaKdut2mq8jAexT0tlNN4pZTvNvhCmz4Qe2vvRl8nbHtbuLJWpbRTYJf3yRoHtUzqo58RczyDGYFRbMmVvcyGmzaBSgiyYOZfsjtD61B8w2aChMYLB8rG1BjrKceHCuKe+xt5OcG+83bxYwp8JTLbvLw9kR7sQLiObU/lp/DelNWuL2BoL2syTkw6jMTQa3Q6HahUQ2pJMdF44FihYTIOVDYYskpLSuT29iBI2d8XhYQ7b9zx9O3hcyeWes917BCBlEIVvVOAxuAy178M4GQE17ShHv3UYkLM5NzgIAr/XINqVSP8IsDgd+VnbYZT091aZUl0F1XSlQdUf0tkrwJq1hy/gKrqBAx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0ppUUJ3YXVYWmJmRktWK1V3VDM3NzZTa1Vvc09EdkdVZUlGU05qcEZidkxO?=
 =?utf-8?B?VUdacm5BMHptS2tQRmpSNTFQbitJNTdKb2s4VlpTN3h2ZUo1cFNyUlVlNVov?=
 =?utf-8?B?aWV4MjMwNlFYaFZHRkpRc290SzE4MnMyTVdOUmZ2K1RlQjdYbDU5R29zV1Vp?=
 =?utf-8?B?VGlHbCsySVZoaEI1R3pRb2pkUmZ0Z2dRWkFWRGU0TTlDQUtubFFwY3R4Tmsy?=
 =?utf-8?B?a0dOTHJaWi8vUExGMlljdzhtazRObGg2NXFsK1k3aGlIaS9sMVFXbmFWbENp?=
 =?utf-8?B?dS9QN2xjQ3NRMzVmeHp3WC9yS3BWNHNXVUkwRCtYK0ZaUlFsRWFmdkFZbFRh?=
 =?utf-8?B?UUJlMTdXVU1oaDhtaGM3d2JMOGZTUzF6blpTOHFKWXhDOVFkdHBjMEVQQ2Z3?=
 =?utf-8?B?cCt5TGpiaWo3TFc5MTdrcGZLNHBDNElmcG1oRGQ1NHVCUEs1N080OHI4SDdo?=
 =?utf-8?B?T0grVnIvSmF2bDBqZGVlUVc3ajJGRnN6NU1KbWt1SGpMM2RLTUZnc0U3Mm15?=
 =?utf-8?B?TWlSaStwZ3hPdjZGN2xtbXl2Mi9rZmloWXBrekl0QitaRGdOSUl0amQ4akNL?=
 =?utf-8?B?Um1FRnY3b1kwZk1uc08rWWZQcjk2b1dKNzB1RDVlMFEvNHQ4VEp1VTEwTUZR?=
 =?utf-8?B?anFPNlJIYnQwWWRXUkRXODQ2eDZML1JGaWNMSlpiSUovK3RGTnRleDg3UjRH?=
 =?utf-8?B?M0FYSDNzOWdNZ2lVQ1Btd2VnQlYxOHVqNXo0OFMwVTI2Y29qZHJLWm5KMEg3?=
 =?utf-8?B?bkkySFcwaVNaSW5mZGh2Z2hqVzNkdElIWFlMSURzTW41K2dNTlZjMU5QYVow?=
 =?utf-8?B?Q0d0R2RnVXdKaTZOWFhOR05aWWxKMTA3Qm9mc1Jwbk0vQVVQVG8zN0hvOFc5?=
 =?utf-8?B?YVlubWFVNVRRamtFZGxyTU9kK3ZBS2NvL2F0NnJPaFNlNThQYS9IM216UHJ1?=
 =?utf-8?B?U3kzYmYreHp6L0NyWnd0bzBGTVd4cUdVMDNaMVRhQ1Nxby82cHJmM2hrby9P?=
 =?utf-8?B?bURRWjQvOExqb290dWxacTc0ejBPcGJlT3Y3My9COE05U2Rna29UeHdUMERU?=
 =?utf-8?B?MzA3cklJWVJsbHJCcFBrZjZrVHNqWXJoTEtiMTlqdUhvNXJRMDhWaDVTck54?=
 =?utf-8?B?UzkzUWltY0ZwRFQyOC8xYWw3YndZL0ZkOUJUbzF2Mk1wclBOOFQ4bkgxTDFh?=
 =?utf-8?B?SVgzWE1mUFJLcGNvWCs5Q21ta1FJekl4Wk1JV1VDcGtveVZNelhKaVIzMHkx?=
 =?utf-8?B?RkhsOHc2RS8rbVN4TWhZc3doYnNTUTI5N3ZtUU1DSjZhRGRCUjQwK2lRZFlW?=
 =?utf-8?B?bkRDZGpQTTJvUEVhaUVqOEYvdGlzOHBjSzlyckpyWVhBbHVGL1B6U1BVbFQ3?=
 =?utf-8?B?TkYxUUMrZzFoejJydzR6ZmFaYlZRR0xWdmtndDVQTTl1c003ekhCQ01HUEJK?=
 =?utf-8?B?VlEwb2RTSS9JcGlFQXJIcFU0VG1YeFBmSWtHeUVoRXhESnN4cjRHVTlYblV1?=
 =?utf-8?B?QXpLYmZmV2hrMUV6T0tsS1B4M0I5U016QUNGcWpRTlJ5YnpQOXpQS2JGd2tF?=
 =?utf-8?B?ajZycDd2aVlwTmhZdDdjVkU2WWNEQ2Q2MW1ORFZGTklGQVBXUGpNUkQxa0VG?=
 =?utf-8?B?WU11ZXo0eXp2dmNycllTQmJwTTlNQXFZcEZGeUZCWE0yYzdTQmZHY3NBbnFP?=
 =?utf-8?B?ZUlvZnJVUVA3RDdSZC9UakREQlFPVTBNWlhTZUx1ajhJakNYMDQ4WEFtYVJn?=
 =?utf-8?B?TWpkT2lrMzJ4THU0dTNsNEN5c3pZejJZeEpXTWFpMWxhczJGaFdyQ1YwUi9B?=
 =?utf-8?B?cVV4elJtR3pSUWlYZ2VCV2pOcTA5RkJsMFpHSUd3NlpGZWZDaW4zbnR1TXFP?=
 =?utf-8?B?bmdCcEZVMHFCU1oxNDdUV3A3K0Zacm9OMjI2Qytvd1JUcGZUMDhoVjgvR2wr?=
 =?utf-8?B?ay9xRGx1SlJGSVQxbU8xOUdMK0FrQ0E5RmhzL092MjBNYS8vYS9qdW10SnBU?=
 =?utf-8?B?Z1hLNkdZb2dTaTZjQ05oeXk2TWE3dVNhZllEaWFocmFjL2ZiWGh2cUZNNk1v?=
 =?utf-8?B?ZFh0eXdyeUxJZDJFckFoSGR3M1dZeWsxTitSMHZpemxXOVZ6cG9NZUtrOFds?=
 =?utf-8?B?NDVFU2tFREhMY2tqNzB1U0hoTk9keEpUQUZNTGVHVHZGeWtyT0VIWW9SOWp3?=
 =?utf-8?B?MC91cm01WTJ0Y0JXcTFMTG5JaGFPNkVGZWxSaHEweWkzRTFiT3NKbFNzTkx6?=
 =?utf-8?B?VitoOEVVNXBMZU01bzhKWjYyeVJuWVNZZEM0dVYrdnFDMEVLbFBmNkI1ekI2?=
 =?utf-8?B?USs4L0xXREgvQW9DVUNqRkFYV3BSRW9IeFYvMUwvL1pBenNVNEtyQWxMYTZC?=
 =?utf-8?Q?7Ujf0xByfdjoamVtTclybFnumSXC5vPJgU7q9?=
X-Exchange-RoutingPolicyChecked: FyRpbsbieWR5+EEAqjH0cR52yON/fKmRzCmyIP1jCQZvtBhvZdVE/H7wIInmfaca/Y644c3W7CGZ21wf59p13ikKVRl2z47bC+2ZK8JINl0fMzVCYcA6kvktXzvAN7rrzxW4JA5AwODi6tSHgzH63YEkuiswQcxikHqAIOOYrLQyHV8dZ5vaD6Py8ORHiPjGXjAdUG2mr4OS5X3UYKieLSpe38K1q4S8L8/VQuhqf9rkqwEBIUiGt63bIv/MYs/wET6s/9kPosMICaYssKJ4Hcrt/qx2ZrAu4ArwFt2IHVgddorKnv8cmQPdyROa1/MEM2Iibqc9FkNf1ULLSeIi2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a75f3f20-ef26-47f9-e3bd-08def89c9b60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 18:07:44.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+P9o0mkUz9etd6ADZTUUP7tD6N/YpTIc2Z3Ti0Kp0Mnfif8DueKx+S7smD+n/rNFLoKy7+Z6XNMjt8gTaEe/r3ss6ygwrk+yUmqLbPpMAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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

On Wed, Aug 12, 2026 at 07:05:35PM +0530, Nilawar, Badal wrote:
>Hi Umesh,
>
>On 12-08-2026 05:22, Umesh Nerlige Ramappa wrote:
>>Use xe_log_err() to report pcode errors using SIGID.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_pcode.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>index e9125341481b..b35c1a77effd 100644
>>--- a/drivers/gpu/drm/xe/xe_pcode.c
>>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>>@@ -14,6 +14,7 @@
>>  #include "regs/xe_pmt.h"
>>  #include "xe_assert.h"
>>  #include "xe_device.h"
>>+#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pcode_api.h"
>>  #include "xe_pm.h"
>>@@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>  	}
>>  	if (err) {
>>-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>>-			err_decode, err_str);
>>-
>>+		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
>>  		return err_decode;
>>  	}
>>@@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>>  				true, 50 * 1000, true);
>>  	preempt_enable();
>>+	if (!status && ret)
>>+		xe_log_err(tile, PCODE, ret, "Request timed out on retry");
>>+
>>  out:
>>  	mutex_unlock(&tile->pcode.lock);
>>  	return status ? status : ret;
>>@@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>>  		mutex_unlock(&tile->pcode.lock);
>>  	if (ret)
>>-		drm_err(&xe->drm,
>>-			"PCODE initialization timedout after: 3 min\n");
>>+		xe_log_err(xe, PCODE, -ret,
>>+			"Initialization timed out after: %d min\n", timeout_us / 60000000);
>
>Is a SIGID needed here? My understanding is that this failure is 
>translated into survivability mode, at least during probe.
>Also is it correct to log CPER_SEV_RECOVERABLE for this error?

I thought all FW errors should be reported based on this conversation:
https://patchwork.freedesktop.org/patch/744654/?series=171725&rev=1

fwiu, the chain of errors leading to the eventual failure is still 
useful, but not entirely clear on what's needed and what's not.

@Mallesh, thoughts?

Thanks,
Umesh

>
>Thanks,
>Badal
>
>>  	return ret;
>>  }
