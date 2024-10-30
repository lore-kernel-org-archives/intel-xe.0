Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB87D5CC8C
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 10:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BA610E782;
	Wed, 30 Oct 2024 10:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABxnGGz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7C10E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730284694; x=1761820694;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GtThFuM7nlJOoiVKMVrGA13Qgm+9uNe9iA5b1yrf7d0=;
 b=ABxnGGz0roNryNUaNCfYlnY+NSV7K8cJc/s/3MGJE6JcD0PH7Bfzf2zp
 cuDy+9d0Jd6IzJRrgK3/hXbnmcdbF954nvR+80NgOf+o2vNy5E27PS4jv
 ASAF1bCylvCMIw/O2tVbrjyuBmvpW6cZYvNYfwDrP1R1w0GWHf3bevvx3
 F+xNlcy0vDK4FDEW6TUCBwQtTH26ph6c/ftBTDzHg4SpMyLX02DYiBIB5
 SyjuzHzApCdwfU+Ps31fKuQk3yNvaOBxIn4CNO40LgSPyRfbmsyUVWbx1
 UXiJ3gF3+9r50DzlJFMpZHRrThtTanvHgQIWb5C/UAQS0l/Faw9xkNJXp w==;
X-CSE-ConnectionGUID: oeqgtsRvQzKAwRwsN1zlcA==
X-CSE-MsgGUID: 4k5gUF0wSii9VyioE1FJag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47440926"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47440926"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 03:38:14 -0700
X-CSE-ConnectionGUID: 4fjYCxyASheH/jJiN2hrOg==
X-CSE-MsgGUID: BhEfcsy+QXOhNOmjeOMqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="82378422"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 03:38:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 03:38:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 03:38:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 03:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiOu34fuPJPFqfKRELS5awCOsFjj1KupxogJGf5qfS8GqpOUWvC7YyclFl8fLw1MfERXHdamwYGToWMhsBZQDCC4d1vdmkC+WLg7HjE8OJENnXiKmwL3Tqd2bTetBE/4p5XoB0JvL2ChXCMSK92aud1tIyGgdMZGnK3lF17UYSZqNGXeNREyr69LrpvtlhqUMAo9/x9DLVip/nCCndttRxXh8qzaw6FDEhzxw9nZWEytPmTFt1o5C060ghEzLr9F9Rmcl/EHb4zUJmOJ/QBEDE9Z2Hz3vypfKAz/SAytdzkVsWRYkExq7a09SQL1nkNGLRoEtUGtn18JpY5+0uMxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6K2oQpKyVsfi7Nyfqo6Nb29rJ9aOvwqQwskBsaEOqk=;
 b=w8S+KUO5IaKFznFGVGHMLl7BUzU+iVrXjnJ8ilHiTgx88lMHHKq/ghRI0MqqkzSgaX/r0kjGLbcGI1Cs69RF1IO2nebCtAufIx7pY5rXiiNjVgm+FKGctIXpEoRJObZO2CthCeUC63j7vLcTcYjwxVSp3OO5qcwqtoB8oYQ5aZ1eizefZw+dFg6yYU2alWII+Vgo5F768Su/IOdp/KmQAkI7g5y6SKqoqRLOQ7XNqWffgKPZGA2F3ti9xe65177BvjMWOKjC1mDlfJmzo8dwxMlruYxOAAG/fAnxwjGVFbCeAgf0Szug/RI+1X0FGdPPewEfuUeR7Mi4UTn4al9rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 10:38:06 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 10:38:06 +0000
Message-ID: <3759da25-374b-4eca-b53f-2bd1e578b0fb@intel.com>
Date: Wed, 30 Oct 2024 11:38:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/xe/migrate: Add function for raw copy of VRAM
 and CCS
To: Nirmoy Das <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.winiarski@intel.com>, <michal.wajdeczko@intel.com>
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
 <20241016095745.7477-2-lukasz.laguna@intel.com>
 <205d4111-78cf-41c7-ba92-7fae6fcfdd97@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <205d4111-78cf-41c7-ba92-7fae6fcfdd97@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe861cf-d4a1-4dd9-f87c-08dcf8cef041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhYMlp1UGtKaTNPbDlOYjZiaERoQjFVY3pHMW92Q2pmSmZEZXAyWEZTVmg4?=
 =?utf-8?B?T1dTbnNvRXM4UXJCcXBlUStQY2FBVmpEOGRncmRxa29ERVlRZ3BKUElJQ0RL?=
 =?utf-8?B?VVNNYXRXUHpwWDQ1T0tadmN4VXVxQ3lGZVFuWGUvcVZXUVV4Z0FwNk9Kckp3?=
 =?utf-8?B?ZCtCMjlrR0dLeE9xc0dkNEhGV3ZhMW5GeDhFQmE3T1hFbDNPR0swM2swZkQx?=
 =?utf-8?B?MXNjVGNkR1lhMjQ2RjZOclpTeEpPU3lLQ1p2NXBYblJ1SjBvbndjWDNIK0U1?=
 =?utf-8?B?M1VnWFlIMElMRWx4cllFNWZSVWpOQWxzMTFKNXNYNCt5TWpXbFMyMTdiV2hl?=
 =?utf-8?B?QlhlMjh1VW1rUXA3Q3IzQ3Nzd295SWI3Nkt2N3R3MXFVa3pRUFQweUtOZjRO?=
 =?utf-8?B?Slk0Q1pJMDFycHkrL2VRUnBXdW9lVEtEcmRmZURmRk1PU29EbUNKeEJnMVIy?=
 =?utf-8?B?SEovUXRDVS9yMHhNMWJiUTlhMXRlRjUzMmdOUHFNeVpzd3Q2aHBwREM3bzZZ?=
 =?utf-8?B?elVYMXBtWVE3WStxLysrUHBNMlFHNWNVTzk4Mlc2SllvMWJEYW0wNnBXWkF4?=
 =?utf-8?B?Qmcvd0N1UkxOUmpLOElmcVZGMHc3aTdIZ3p5MnlVazRQalNuMEx6eERUS0VY?=
 =?utf-8?B?a2l0citpUFNRL0o5dzFSWXNJK2N1Y3dTaXhRTlFRSUdjdUFwRVJPdjhmM3hh?=
 =?utf-8?B?MGxYM3l4OTRCSjNySUpHTkl2NHNwTEhJb29ad1ZYZTNvVUpiODdYcFd6L1JM?=
 =?utf-8?B?K0JYNDROY1MvQStzVEZoY0tIYlNBUXVrczdBY2J0b3BaZDdwSXNUYjJxU2lN?=
 =?utf-8?B?cU42M2h6ZVRFVkpid1M0ZHlxV2FqNTdyTUgwOFRrbllsbm1xQTI5UjQ5aDJ2?=
 =?utf-8?B?YzhNSEl2Z293Nk1HOTcxUmNRWmhVOUpKU3ZvdHFBQ3RPS2xiek5pVjFWZVVy?=
 =?utf-8?B?bEVKODFwd0QyNWs2RGJDK0dxM1VxdTBBTmxCR3NaaVQyTitmdjZtdVRKcTlI?=
 =?utf-8?B?dkVTTjVZUGpFRDFQRzdpbU9jaElhWGt4Wld6bEE0KzZ6T09YRTBoMVBUdmhp?=
 =?utf-8?B?akQwK3pQV1VNTzhBN3I0cjNhRlg2RGtOZU00c3ZmUUdsMUpFajVBVHpmTUpJ?=
 =?utf-8?B?YTQxUnFCL1FtZFd6bExnSVNWcGRqYUtsN01LNytIc3JlNlpkeUE5T2x1bGJY?=
 =?utf-8?B?dUtZUnptMjhFZFhZbkxxbmJwTVlrNkhzdGlOckgrVTRXaGFwSWNRcG55NFN2?=
 =?utf-8?B?U2tOMDZQclJOVWZ6dlN2YVVyM2FjZXFuUTZhUXpDWkIzYzF1VlVXZThXSVpt?=
 =?utf-8?B?U1ZmUEg0aFg4Z0pGU3FzbmRwMHBvUklqOGJ1bGloZXIydk1YbWluWGVxdHZJ?=
 =?utf-8?B?MTJmRW5JOEVYNGdNQkxRY0Y1ZTIwaGRqTWI0NStDczduM0h6SE1qRUxURnRB?=
 =?utf-8?B?cTdCeFg4Z2J6YjdwYmFjMVdlRlVxb0dqdTlkZUk0V0gyUjZia3Y0VUdOM0cv?=
 =?utf-8?B?TWVyTTRMbGJMV1hnYVRNeVB6MW5wRlROQ0x3Nms4WURZRDl3TWxRS2RDU1Vz?=
 =?utf-8?B?eXRWMEM1RGtZck44b3gwdCtmcVVXRWRSb2srNEZvdDZ3bGdSZFF2N2xVeFlS?=
 =?utf-8?B?cTFrVXUrYXFNbFB0Z0VOL3dRb3FYN3JhSnRDK0dvZmd3ZWttQnFUNmdEY0Er?=
 =?utf-8?B?S0FBZ1VFQ1N6NTg0T3NIYU8vTGtUcWNjRHdnb2Naa2JKc0NTZENEZHFaMFNl?=
 =?utf-8?Q?7Jo0MBJ5UEWJlliVyPlw54OgCqGRZJ2fRMTTd8H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJMZnM4WVNSdlJ5TFM1ZEVJeU1nanB2SjBLRzJLRXVXQkNGOEkwQ2xDdzNZ?=
 =?utf-8?B?WjR6WjBHOTFFMlFYK0k5ZG5mQ2xQWVBtMHVtM3JlVWJTZldLTFlCMjVPUWxj?=
 =?utf-8?B?bzRZelJOTGE5SWt1cy83K1RBbndqSjV0N0tROThzNWQ4TWVwNCt3OU5RclFQ?=
 =?utf-8?B?NnBVVHhuTkFYc29kY1ZjR2ZGb01aa0I1dlk3WWs1NGVaQWRRVyt4a2FpN2Zi?=
 =?utf-8?B?eGgvL0RicE5iMFFwdlBqVFdmOEt0Rnd1UEszbHMxcDRFK0RLYVhsRmJLM0xq?=
 =?utf-8?B?d1RHNFV4YmNxNXpVNVdCdzdrWkxUYVZqS3doSVpNRnhSTjQ4aml0Z1YxVURt?=
 =?utf-8?B?T2pxanNzRkd5dVRzZVF3TzlHTzNhRWV6R0tmeS9uc3BueFJYUzI5RzJJeW1o?=
 =?utf-8?B?cnluOEs3MWlkTzYrcDBPaXFNVVFPUndid2FxQkxVUFNjRVIrZitjY0g3UCtI?=
 =?utf-8?B?L3FRNzlHZlN6REN3UjQ3VGhic0tGb1duNXpzZitWcVk2WmVoU2IxV2NuKzNl?=
 =?utf-8?B?VTgxb0F2a3hOc3RRcFRZM0loN3J1dDZjN1doYVBHdGRzSkN0L25ONnNTdVc4?=
 =?utf-8?B?VEVkb2YreFpyTlYrZVg1YVJBaHpGK0M3czNaNjZHdDNnUzlBTDBHZFhvRkg3?=
 =?utf-8?B?bmF6NzcydDV6aVlydDZKK1BtVXBRL2IzNEErZjk0ak5KMXlmUUxZYldJM2VP?=
 =?utf-8?B?KzMxeXZTSjVLVzJxNXY5aFFQdkZuUHgzUzdXRUxDb0FEekRwMkJ2SFJLVmRD?=
 =?utf-8?B?U21GZlpadHhUbk9ZcDZIR2dsaVUyQ0lwVmROblNob3dQMWJrOXd0NnNRR1VG?=
 =?utf-8?B?R2czdFRKQlFaYU1oTHBlWkgzU09JUitnOFdScU5kQUtPVjhnK0JIMVpVckZB?=
 =?utf-8?B?VGMvVXVFNDdXMFRNakFTcGRybFZ3QUpEVzFoREgwU1ZvNkIxanMxeVlYVEFK?=
 =?utf-8?B?YUxLRDB5TTZSRHpxNDRuOTdoaGU2LzdxUWlPUUtIL0MzTENrcnlDUFJUMG5K?=
 =?utf-8?B?U0NXeFYxQnBIT25Nb1dobWN3bG05cURUeVZWZkJGVlVJTlJkcGNpZXZGdUYw?=
 =?utf-8?B?OXVFRzYxOTVoMDc4TlpHaUFxNzUvTmlnY3FqaWh0TFZ0MUVRWGN5aDV2bS9Y?=
 =?utf-8?B?eFN1SFh6M2U4eVdLTHovY1AwbC9YWE1TcEdnU0RWNnJZOElhMERCU2F2S2VJ?=
 =?utf-8?B?SUVSSDhLUDVLb0NhZEhGSUFocWRqWWdyeGFNb0tnNEtZTmllcWJJMjE2L3p3?=
 =?utf-8?B?cXNTOC9PdjNLWlZhRXUvTVdEUEh3NTlnL244S1FqZHhERU4wZjZTVkZFYTlI?=
 =?utf-8?B?TDh5elQ2Zk5QUnVaYWRqZnpOOVNtSngxOVBzYXIxOVdJdFFhTXloMTRmYm1H?=
 =?utf-8?B?WjhpU2V1Sjl1VWJVRFdKTUxPVkV4NEZjakpHK3N0L2JpNFB0R2dKTDlCc1JF?=
 =?utf-8?B?VjF1dVdRcTZHVnd4RU5HYkI4OXVRclNiYjZPQWZMMHl0WkM4UGFFa2xLS3Jx?=
 =?utf-8?B?M3JYUDNaeitYZW5zNkJQY05RWXYrckNuaUEybGtwYUlXRHRVWEkzTElacGZB?=
 =?utf-8?B?Z1czMkVkbW93MTBvKzdzNllJWmNudjZxZGJIcDdPcC9DOFhGd0U3M1haVlor?=
 =?utf-8?B?clRpNTF5d2toOUtqQ2VvMXBFamVCbTA4dFp4cE03eXdpTlRZbDJhZ0J5R1Q1?=
 =?utf-8?B?VndEM1o4enJZdFBYRjB5T3lBSmpSN2NJSHVvRzAvamJtRkdQK29OUTZWL0Yy?=
 =?utf-8?B?dHZCNzhWNkswZ1JrRXpIcnB1Q1d2ZmpQMzF3Z0xBQS91RDhJVFI1WElCb2oz?=
 =?utf-8?B?R0JQL2QvWDJQS2VPNFFlLzhDVHlEcGw2dWxEclNzTmcyN2VuVS9aVThiclJB?=
 =?utf-8?B?amJCTzVrR2Y2eWZwQ0pmTEsrMUtEc0M2am5FcUpkU3BqckpwRVU2MFNTVzFs?=
 =?utf-8?B?K2NaMDUzYnNxMUJQL3lLWGJTMVE4WWtHWk4vSjRYWkxVdGd4MUhMaVdDY2pO?=
 =?utf-8?B?NUUvbThFMWhSTjVHdytnZXVWMHdGaE05akt5RTMxRTJjRWdqRUQxMGxTc1dx?=
 =?utf-8?B?QVNTK2tveWFGRzYrcnhLRU1vWjV2QnA0RHp0V0VwalRwd0hrZEZJdGd1eWYx?=
 =?utf-8?B?b2liNE5qU2hLUGFBRzNsUVlwdU9iNU82SFZ4ei9GdHNtV1FzVXVIUHMxUU9t?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe861cf-d4a1-4dd9-f87c-08dcf8cef041
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:38:05.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IHfZ+bHrR6IZOoIymC4ZrSs3lKYlarOZGoPcoFDG+c4k+rLumShwF2wCCslljhTjoNPHiBiYwFXDmn2rnpKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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

On 10/16/2024 14:54, Nirmoy Das wrote:
> Hi Lukasz,
>
> On 10/16/2024 11:57 AM, Lukasz Laguna wrote:
>> Add support for copying chunks of data between VRAM and sysmem objects.
>> Additionally, allow to copy corresponding CCS metadata from or to
>> dedicated buffer object.
>
> Why existing APIs are not enough, this is not very clear here.

Valid point, will extend the description in next revision.

>
>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 208 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_migrate.h |   5 +
>>   2 files changed, 213 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index cfd31ae49cc1..e4770f44582d 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -936,6 +936,214 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   	return fence;
>>   }
>>   
>> +/**
>> + * xe_migrate_raw_vram_copy() - Raw copy of VRAM object and corresponding CCS.
>> + * @vram_bo: The VRAM buffer object.
>> + * @vram_offset: The VRAM offset.
>> + * @sysmem_bo: The sysmem buffer object. If copying only CCS metadata set this
>> + * to NULL.
>> + * @sysmem_offset: The sysmem offset.
>> + * @ccs_bo: The CCS buffer object located in sysmem. If copying of CCS metadata
>> + * is not needed set this to NULL.
>> + * @ccs_offset: The CCS offset.
>> + * @size: The size of VRAM chunk to copy.
>> + * @to_sysmem: True to copy from VRAM to sysmem, false for opposite direction.
>> + *
>> + * Copies the content of buffer object from or to VRAM. If supported and
>> + * needed, it also copies corresponding CCS metadata.
>> + *
>> + * Return: Pointer to a dma_fence representing the last copy batch, or
>> + * an error pointer on failure. If there is a failure, any copy operation
>> + * started by the function call has been synced.
>> + */
>> +struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
>> +					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
>> +					   struct xe_bo *ccs_bo, u64 ccs_offset,
>> +					   u64 size, bool to_sysmem)
>> +{
>> +	struct xe_device *xe = xe_bo_device(vram_bo);
>> +	struct xe_tile *tile = vram_bo->tile;
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	struct xe_migrate *m = tile->migrate;
>> +	struct dma_fence *fence = NULL;
>> +	struct ttm_resource *vram = vram_bo->ttm.resource, *sysmem, *ccs;
>> +	struct xe_res_cursor vram_it, sysmem_it, ccs_it;
>> +	u64 vram_L0_ofs, sysmem_L0_ofs;
>> +	u32 vram_L0_pt, sysmem_L0_pt;
>> +	u64 vram_L0, sysmem_L0;
>> +	bool copy_content = sysmem_bo ? true : false;
>> +	bool copy_ccs = ccs_bo ? true : false;
>> +	int pass = 0;
>> +	int err;
>> +
>> +	if (!copy_content && !copy_ccs)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (!IS_ALIGNED(vram_offset | sysmem_offset | ccs_offset | size, PAGE_SIZE))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (!xe_bo_is_vram(vram_bo))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size))
>> +		return ERR_PTR(-EOVERFLOW);
>> +
>> +	if (copy_content) {
>> +		if (xe_bo_is_vram(sysmem_bo))
>> +			return ERR_PTR(-EINVAL);
>> +		if (range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size))
>> +			return ERR_PTR(-EOVERFLOW);
>> +	}
>> +
>> +	if (copy_ccs) {
>> +		if (xe_bo_is_vram(ccs_bo))
>> +			return ERR_PTR(-EINVAL);
>> +		if (!xe_device_has_flat_ccs(xe))
>> +			return ERR_PTR(-EOPNOTSUPP);
>> +		if (ccs_bo->ttm.base.size < xe_device_ccs_bytes(xe, size))
>> +			return ERR_PTR(-EINVAL);
>> +		if (range_overflows(ccs_offset, (u64)xe_device_ccs_bytes(xe, size),
>> +				    (u64)ccs_bo->ttm.base.size))
>> +			return ERR_PTR(-EOVERFLOW);
>> +	}
>> +
>> +	xe_res_first(vram, vram_offset, size, &vram_it);
>> +
>> +	if (copy_content) {
>> +		sysmem = sysmem_bo->ttm.resource;
>> +		xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
>> +	}
>> +
>> +	if (copy_ccs) {
>> +		ccs = ccs_bo->ttm.resource;
>> +		xe_res_first_sg(xe_bo_sg(ccs_bo), ccs_offset, xe_device_ccs_bytes(xe, size),
>> +				&ccs_it);
>> +	}
>> +
>> +	while (size) {
>> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
>> +		struct xe_sched_job *job;
>> +		struct xe_bb *bb;
>> +		u32 flush_flags = 0;
>> +		u32 update_idx;
>> +		u64 ccs_ofs, ccs_size;
>> +		u32 ccs_pt;
>> +
>> +		bool usm = xe->info.has_usm;
>> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>> +
>> +		vram_L0 = xe_migrate_res_sizes(m, &vram_it);
>> +
>> +		if (copy_content) {
>> +			sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
>> +			vram_L0 = min(vram_L0, sysmem_L0);
>> +		}
>> +
>> +		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
>> +
>> +		batch_size += pte_update_size(m, PTE_UPDATE_FLAG_IS_VRAM, vram, &vram_it, &vram_L0,
>> +					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
>> +		if (copy_content) {
>> +			batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0,
>> +						      &sysmem_L0_ofs, &sysmem_L0_pt, 0, avail_pts,
>> +						      avail_pts);
>> +		}
>> +
>> +		if (copy_ccs) {
>> +			ccs_size = xe_device_ccs_bytes(xe, vram_L0);
>> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
>> +						      &ccs_pt, 0, copy_content ? 2 * avail_pts :
>> +						      avail_pts, avail_pts);
>> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>> +		}
>> +
>> +		batch_size += copy_content ? EMIT_COPY_DW : 0;
>> +		batch_size += copy_ccs ? EMIT_COPY_CCS_DW : 0;
>> +
>> +		bb = xe_bb_new(gt, batch_size, usm);
>> +		if (IS_ERR(bb)) {
>> +			err = PTR_ERR(bb);
>> +			goto err_sync;
>> +		}
>> +
>> +		if (xe_migrate_allow_identity(vram_L0, &vram_it))
>> +			xe_res_next(&vram_it, vram_L0);
>> +		else
>> +			emit_pte(m, bb, vram_L0_pt, true, false, &vram_it, vram_L0, vram);
>> +
>> +		if (copy_content)
>> +			emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
>> +
>> +		if (copy_ccs)
>> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, ccs);
>> +
>> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>> +		update_idx = bb->len;
>> +
>> +		if (copy_content)
>> +			emit_copy(gt, bb, to_sysmem ? vram_L0_ofs : sysmem_L0_ofs, to_sysmem ?
>> +				  sysmem_L0_ofs : vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
>> +
>> +		if (copy_ccs) {
>> +			emit_copy_ccs(gt, bb, to_sysmem ? ccs_ofs : vram_L0_ofs, !to_sysmem,
>> +				      to_sysmem ? vram_L0_ofs : ccs_ofs, to_sysmem, vram_L0);
>> +			flush_flags = to_sysmem ? 0 : MI_FLUSH_DW_CCS;
>> +		}
>> +
>> +		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
>> +						 update_idx);
>> +		if (IS_ERR(job)) {
>> +			err = PTR_ERR(job);
>> +			goto err;
>> +		}
>> +
>> +		xe_sched_job_add_migrate_flush(job, flush_flags);
>> +		if (!fence) {
>> +			err = xe_sched_job_add_deps(job, vram_bo->ttm.base.resv,
>> +						    DMA_RESV_USAGE_BOOKKEEP);
>> +			if (!err && copy_content)
>> +				err = xe_sched_job_add_deps(job, sysmem_bo->ttm.base.resv,
>> +							    DMA_RESV_USAGE_BOOKKEEP);
>> +			if (!err && copy_ccs)
>> +				err = xe_sched_job_add_deps(job, ccs_bo->ttm.base.resv,
>> +							    DMA_RESV_USAGE_BOOKKEEP);
>> +			if (err)
>> +				goto err_job;
>> +		}
>> +
>> +		mutex_lock(&m->job_mutex);
>> +		xe_sched_job_arm(job);
>> +		dma_fence_put(fence);
>> +		fence = dma_fence_get(&job->drm.s_fence->finished);
>> +		xe_sched_job_push(job);
>> +
>> +		dma_fence_put(m->fence);
>> +		m->fence = dma_fence_get(fence);
>> +
>> +		mutex_unlock(&m->job_mutex);
>> +
>> +		xe_bb_free(bb, fence);
>> +		size -= vram_L0;
>> +		continue;
>> +
>> +err_job:
>> +		xe_sched_job_put(job);
>> +err:
>> +		xe_bb_free(bb, NULL);
>> +
>> +err_sync:
>> +		/* Sync partial copy if any. FIXME: under job_mutex? */
>> +		if (fence) {
>> +			dma_fence_wait(fence, false);
>> +			dma_fence_put(fence);
>> +		}
>> +
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return fence;
>> +}
>> +
>>   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>   				 u32 size, u32 pitch)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index 0109866e398a..5cdb26ba6493 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -102,6 +102,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   				  struct ttm_resource *dst,
>>   				  bool copy_only_ccs);
>>   
>> +struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
>> +					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
>> +					   struct xe_bo *ccs_bo, u64 ccs_offset,
>> +					   u64 size, bool to_sysmem);
>> +
>>   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>>   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
>>   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
