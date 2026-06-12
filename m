Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E607CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 19:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D5B10EB21;
	Fri, 12 Jun 2026 19:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjpxJtfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19F210EB21
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781292705; x=1812828705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qqC/uAUtUfNpFBP80736ylpa8y8ZR3tF3sS6ZH+zx2Y=;
 b=GjpxJtfeSx0ijGKSscZaPeUH+GXRUuDh6k/4bzlQ/ElAXyIAdsQfWxcp
 ShpDBNQUsORh4nNc4dobvmtY14uyh5COjSwgQkMVrLdcUT3dhRYYWsnIR
 OdDKy76YZoB5dtCRvVMrdGk87MS3J5fTwbe/24DPOGJvXAjElsiPDoFs3
 34lFQtPjm+JrQKyfC6CqKfhcT5+u3RpRt15ps+xTfhz6OAiRsvixvc8d5
 zVjblnNieLuO1eLDdGYaTQX6zIy+rQC2F9vFQ6OOFrgsN/6yeogASyPC9
 X6yvehW3hr+3UmlyxlnK1yMc5hWgBDFQbFZ8mo9bhxQaMbZ37mxcbdtr0 A==;
X-CSE-ConnectionGUID: Dxfn/9C3SkebsqKggA5xfw==
X-CSE-MsgGUID: vfcE/f7KSfi3rbSFdrq5Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93624866"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="93624866"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:31:44 -0700
X-CSE-ConnectionGUID: Aa/a3TPASQ20nzSabjNSGA==
X-CSE-MsgGUID: D9OP/QdmRQWn3Cl/FAdkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="252002122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:31:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:31:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 12:31:43 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XerwPyJWoyy+mSu/8PvDmC86iPc/70p1ZSkQUx+Y5x1NjmeX5Lld2ByrO/BLXoXcXrWmxnD7qbSPYNEwj8Ww0f5t9WBDDrzPrrzu+NHHjkss857JRdL/tHKDJpI++bOxix7lOBxoEkdVa6m5r1u9mpqo4Xg6lIvrkKBMWB0sf+b9qTP1RCZuC9m1NPrqJH8hKo9DcZUJ9mv1/g0aSD+Nb3+Lg8zo3AOkWpvTAUJ6O7aXxd/f2lnbhRlhzXdylSm3NpO2uynG0C1TZM6TAOvUKaHK5b6DYpHDqaAqvMpkDjf2gyl5gQc4RkPkfh2yzX5iAqJ86mUR/hF1zN7noLzSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2JrBPa9xXJaBY1u4QZYILduDMFXRQcKFTGl8EIj1wM=;
 b=PsMI9RMkOCtviU16KFVC54+wEWeA30rv0ciRpsg+HkoGN4Rzq9dgqiTqMKdx+RYI8Z/UpUuoqcjT4/oUwuvKI28xi/hO97sTgGdWjZA05tHGTHMt6ElMYw9FwVsO0vIZ7pgIjx2eA+Xx8yYKOHJB2jaLnxviN9vJJRLIrCXHu/Q5J8/TaeK8BTKkaqijMuZwsoXGkfFG9IZzw+hqd46y/JWuCflIlcjd7u6YtAZZVcEsn3E5gHs2SPoKBMK/V1Yvb5fNlUrkReFiYpXHzUzeDZN8AB15RLH1T2DTwMdLBlZ5mIxP1SNaLsBz2BRn/mVJFdXcG80wPFN2SMGW7x2BmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 19:31:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:31:35 +0000
Date: Fri, 12 Jun 2026 12:31:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/9] drm/xe/rtp: Save OA nonpriv registers to register
 save/restore lists
Message-ID: <aixelUZQmO1ShXbo@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 329a68ed-1823-4760-d369-08dec8b9370a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J4yAjJvB3KerNWfvUj1eEdAHH4YLenGuM4tA5kGFiBCfkNfIY6HOcgph8Y/DNxbQYrJYDUHsye+Y8KcHdHaL1cWUFFbG+5phlwmK+9X0wvXk1nHlvtNeBhZg+4bXr3a/ybvP0ZM2iv9CNXKidoOoGu5K+mF2H4+oNKuGLPYNkAwJfqSiw/0+PVxPt8Yv/j4/TirJxODOBaEUb0SIGVHpO8wYAfAQRK4cJczsLz0GBDBDwT7vYOu5IvQN1fyY0S0IbaC+4y+pIi0fpekrtdYgn1TYHs0cgHyI4OKrls90lP0BaSNBY0oCjfkZSN4OM4k+Zog+/UznIESmhpVL45Fz1xQYWUQ3OYNVRPQXp/YsLEArnf3MlVNq40TSThQNTUyvkiIJVUShQFHBrARjC1DAV+skcF5TGA6x7oK/83NiISdJrouvPB1JB9fyZ/btfr+Z7y/0os8qlaqxC7afFMoSO+65jT7LD1ap34chsxoNedKMT3ynBoRUNcKWlTNjFSOjAuSKvG7OAx0fL5ijBQ+fpufVxn8TJAyudn5rruaM0Cr7xGA94xsCKL934OkI11E0feNOMidoemCJFbEyve+KgRZhHeaVSL4Z8+EEBwmPeyKmxLxMspToX7cxg0++A7GNLhI/LTwdB4/9DePat421fhwAVVZHZfVmT+R1WL+878u9l1ynq4j9Qpnsk95z5q64
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdOVysxZkttc3M1NldtdUEyS0lUcTBHdDY1c203ZVpnb3cxaWFIMGJkNWNu?=
 =?utf-8?B?NlhoMFBqem5ZVFd3NzA0OEZOaWJwdy9VQ0Q1WlRLclJBeFFMbWRVNSt4Mllm?=
 =?utf-8?B?SEMvWkw1ZVNEeUZLM2JUN0FMWGwwWnhsRUVwdmQzbTVHN29PYmJvZ1AxZTM4?=
 =?utf-8?B?STBaZUgwVWNCeDd0TWFlSU5Yb0NOMTVZY2c4Si9wUzhaWTE4VE00Z0R1eVkv?=
 =?utf-8?B?MXd0Q1lkcm9JZGxJUkM3S3FGeHljQTRHM28rTmNMWU1qK2pKN1dnMSsvWDNV?=
 =?utf-8?B?ZEQyUHFlZDVSYlN0RHNDT1ljdjBuckVyakdrd1BteVJSTVhNL3M3UEJFeVhG?=
 =?utf-8?B?SHQ2K2IwRG04RDdCR3RlOHE5dE9Lbi9zSnpzUUlUVlJVcGd6ZElGeDkvajlF?=
 =?utf-8?B?ZTR2RGw1aTl5Rk1ycWhnQmx6M2NPT0JMbVRHMmNSWWFkOXkzRjZaNy9naDBJ?=
 =?utf-8?B?YVJmSEFZVDVza3pSditrVWVvN1pjN1NKYXdPZUFvWG55Zm1TVUdyWmRsQlRQ?=
 =?utf-8?B?b3JVTWt2Y3NtUkNYWExINWZheXp6Z3pvakhTMzh0UHZWNnhZYjlVOExLSnAw?=
 =?utf-8?B?TjZnclZtYktHOWlTWmFuaklqUVllRHhPMHJ4dUJwRnBXOWRwZnN5eWRYL1J0?=
 =?utf-8?B?UmtBcGlaeVBWdXhXSGRDdDE3YXJFRitYRXhvdnBlVkQxWDlEYk1OTEVtenJw?=
 =?utf-8?B?ZWRIS0JuU2lJZFdrRjd0YnVxaE9aMGI2M3g3aTlzTDZZaEM5Q0UrOHkzc3E4?=
 =?utf-8?B?NjJMMnBqR1IvZUZOc3N3a0VyUFVIT0MreFcwTHFjZGRiUVltYmF3aXk5Tnp1?=
 =?utf-8?B?VkxUcCt3ZmtWMFdLOFgxT0xEa1lKaktQZnlpOGhvT3FyREhTbGtrbmV3ZnBC?=
 =?utf-8?B?ZnR5ZjRUaHA4SFhFTG16U0pycWh4eC9WbzVVb3dFcFhqL1FJbldvbkhoMUhX?=
 =?utf-8?B?c0lyMXovMzNEQVY2bDR4eWtlMlpkZm5hY3dQeEJ4MGt6Z1lOWExlUXUyYkxk?=
 =?utf-8?B?RFJobWEyTitDcHdSV0ZQMWhnUFhtb1MwMERCMGZacm8wY2JvVWsyOHFTWlVw?=
 =?utf-8?B?WXI0RlBWQ3N1WFBkeVlqMVRxUmtVMHlCN1pPOW10Y3FTbWp0TEpPTXBoL3A4?=
 =?utf-8?B?QjNGSGdDN0dwWVZoZ2Y3Q1hmVWtlTDU4SExxbE00NlBQZHM0RXpHT0NMeWdE?=
 =?utf-8?B?U3A2Zi96VUQ2NmlrK3hVa08wSlFQOHIrOWUxdnZMTHltMmw2Rm5aWU1UaEtR?=
 =?utf-8?B?VStPRHJ0ZzlhWmhUNS9uSTh0WC96d254R3pLV0N5Uk8zT3JkbElSeEU3azFl?=
 =?utf-8?B?UzFMTmNJeHU1V1NZMmlVcmtLaXQ5WjRUVXl5UGdnblNUR2p2aFJ3UFFkby9I?=
 =?utf-8?B?MitDOVNHejVjOHh0QjJYU0pJY01QUUFKSUZEdkllejVCdVErNEN3U3ViOGdN?=
 =?utf-8?B?T2RBR2paa09KeHZHMlowUklnb0pqc0tIN2g1RmYvSC85Q1pQL2UrcWFzV1BH?=
 =?utf-8?B?NHdJVUpyem1QT2lwbVRwVDQ2RHhIbndjRUJibTlBd013RVRwTlpoaGxpUzFS?=
 =?utf-8?B?eHM0UTcwVU4xOENpZzd3WGtLazVkenhzMTk0OE1ieG1jcVBCSW11dlJIdkhr?=
 =?utf-8?B?VUFzazYzQlpvVTRQaVdDbzZtQnZXd1c1VXZpbktUYm0wcXZWRitCUmxSeHlw?=
 =?utf-8?B?d2ZZYTltZ3M0V1ZXRDUraEhielVIKzJzczY0d3dNOWJxQ0dERVZaVWF0Wmxr?=
 =?utf-8?B?YW5oVkRTSC9KWktESENvM2xWbXR1Z2I2WEFLTGNNaTdqVWc5RlZZVFdFWmp2?=
 =?utf-8?B?R2QvWCt3TnZSbUwxZjJnSkxWTE1DaE1zSEsyQ0dZd29rUElRdG56MjYyWkVi?=
 =?utf-8?B?KzMzcGQ1bWcvZUhZNElhR2MzWXN6aWFZZitZUXdYZlJHOHFmQ3ZHZ1ArZnBa?=
 =?utf-8?B?SmQzL0EvMlRGRDIxMXhtUjVXWHlEOC92aTBGeWY0OGdmTk5EQ1RPWXprUWdW?=
 =?utf-8?B?U3AwenFNVFlSb2NHSkd5QnYrWGowWmNBaGZyemoxaUdXTmZsbENrR0ZZRnJn?=
 =?utf-8?B?K3pna25qbG4rSkxYcy9xM2xaWENDZnYrMklXVWp4TFFjMGFiUTBmS2VCTUUw?=
 =?utf-8?B?NE1jNkxqUXVhTy9Md3BuVDFLRnFabVl3bVlaeHI4ejNGUTdWcU5HR20wTnow?=
 =?utf-8?B?MUhQeWZzU0hYTkJrRXhBampRWFluVnhVTFdHcG5XdnA1c1ZqTGg3QndyT242?=
 =?utf-8?B?K1c4Smd5Zk5iZExGbTZ5Z3cyb1dibTgxUk5VejFWS0JLSHUwUW5IcHQ3eW53?=
 =?utf-8?B?TWh4QzJSdit1U0ZvdW41MFJTMkNWNHZzN1YwYnJwVnhMZkg1Y2JTZEpYdUJN?=
 =?utf-8?Q?p3fGmGcs5maC7eYw=3D?=
X-Exchange-RoutingPolicyChecked: q1kmZm7TMBVCmiQr67P62IzT0imrJtVy3mD76TyUlCkXAse6dUI/FRPuBtxaNN47hty7fD88y3xTGovrMRxmYSzMcs0etNepYz+DGiOk8zst2RlNwlayDLms79UhLpOKWtch25vn93unygbTCW/QrBoN/IzQc9wTUjtTJE9pN0zxgHGN781OK96e9M19BcNGGP5EYxPbBwCd9YIz3MzzifQyEhQcOG99zq3U1eiijdEDH+aQFgYMqpA7zPAqTXUMuC65iOXKuUS4S4uQpNGZVuTVVlbwguyRCt6uRSbePd7VkRNwoGyL6SgBgXBO5++6w2mPkKoonXK/QlPYqw5asA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 329a68ed-1823-4760-d369-08dec8b9370a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:31:35.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WGdLiiCce7FGzCUH0ZnJbHwIP9rglLAKDhU8xgWX0lrJRtVTC4I/VOHudCcc382mkHqFlfzS6gTjpvivrE3ADAvMsv7Cn7TvyabLhmtmAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

On Mon, Jun 08, 2026 at 03:36:20PM -0700, Ashutosh Dixit wrote:
>Now we can save OA whitelisting nonpriv registers to register save/restore
>lists. OA nonpriv registers are saved to both hwe->oa_sr as well as
>hwe->reg_sr.
>
>During probe, resume and gt-reset flows KMD will apply hwe->reg_sr,
>ensuring OA registers are de-whitelisted after these events. For
>engine-reset, hwe->reg_sr is registered with GuC and GuC will apply these
>registers, ensuring OA registers are de-whitelisted after engine resets.
>
>hwe->oa_sr is used for whitelisting or de-whitelisting OA registers during
>OA operation, by toggling the 'deny' bit on oa stream open/close.
>
>v2: Provide more details in commit message (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 0c01e289dc4bc..3925331348bff 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -216,6 +216,18 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
>
> 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
>+
>+	/*
>+	 * Save oa nonpriv registers to hwe->oa_sr, from which oa registers are whitelisted
>+	 * or de-whitelisted, by toggling the 'deny' bit on oa stream open/close
>+	 */
>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->oa_sr, first_oa_slot);
>+
>+	/*
>+	 * Also save oa nonpriv registers to hwe->reg_sr, to ensure oa registers are not
>+	 * whitelisted by default after probe, gt reset, resume and engine reset
>+	 */
>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, first_oa_slot);

Hmm, this messes up my assumption that hwe->nonpriv_slots can be hidden 
inside hwe since you expect to apply the whitelists to the same slot in 
oa_sr and reg_sr. I don't see a real value add in using 
hwe->nonpriv_slot then. You can drop it. Sorry.

Umesh


> }
>
> /**
>-- 
>2.54.0
>
