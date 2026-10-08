Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D1CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D0A10E840;
	Thu,  8 Oct 2026 13:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YarKxDW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3221F10E832
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791464483; x=1823000483;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a9vH08Yv2Nl2/hFa4JGr++m4uwByPAQyriv9QeDbAdQ=;
 b=YarKxDW1E2EpCb2EU6U4mHR5YvUoFCFPKZFt+XQ+//EQlCgAasXRUju6
 sYFBJZi/h1azWWIPXxJjXF6lE6ejNe0Gkj2FxwYRWJ1bevEYe1WgQTsX3
 zB5aXqVqCHdZmeXQcC47t/Jz5wMNJtLny7e7wOunUWZb/NPfl17A81xgC
 lKaVVUNd/dsSgKAN/gAYJCBGsHkQV48oQ3yainhsommopTPmqAlOficeY
 g3Ffb2ljRjq75cQCAXeoGl3Mo57XOAihn92TTBkiPTfIlc2zbINI9j/oV
 GYoC4VwIIIIDJYR6/JStM5QDpnrJP5sOq9XW//5tHxY7JuRMmw5zG4BNx g==;
X-CSE-ConnectionGUID: hF4Vt6MkSgecyGsVI37XTg==
X-CSE-MsgGUID: wp+lLfrfSCaDlGJt5Lmp4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="254101"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="254101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:01:23 -0700
X-CSE-ConnectionGUID: JiGiFPTGT+OcY/tpXNk3mg==
X-CSE-MsgGUID: FX7h8w+vQya2pNfxfvU4Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="46474"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:01:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:01:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:01:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfZq1WjdmgIc9VWOPAOOLXVkYhuFcmOy4eLACg+APJoQkxBDeFLMiF/0ZtH5mAd3lEglt8Ts5N+/DB+HjL4jkwtTuqawFqmBrJV6eP4Fxi1bfXkEfAqy8A8GLoSFV8sC5HQ5qzSLNPpoNEOEYEn3El0nRUS27b9UiXrxRLGKZ1s2rNvI5n0EbfYuYMJmSZiV6l57p/1L2R4ekiT2owBWHb+Q257w4wgnrmk0bv1Xo45NgcpnAJRuEf9ctUCpVeOhJyd3pANC3SMtoj9J7pAScaILp/j59DOf5bNdof5mgWEi5fcFhbVNtULn8d1s2lyR9+ozkaQavszn+g8gLhEBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi6JvHxCiaeFyCBeq8TKBKYRAGnuxM+LRtnu/+enjwI=;
 b=JuD2ujhCSPXlMv+S/7dci5cn1OhkHRIw2q3m6DSk6t7HDzNZwttH4ZLqeiIpQWOkvMQWxGpLejkT6fakeyHioA10ljhlCMTz4prt2ZdPzboUcXddNIevcXnBI/DZD1r5AtAxFZ4gOLeCpRdoZZl/0C6JfwRNfHq0g54x53R5e2htph9hUZkIAeLpaAlhFUo4S5bZrmTDQEDlqmiAN0frx21ET4Ql4S2f/oKLQog9hXS53rRydDeCQMfGcZ6zsxIFsTGMubdePKym873bBdNlVeYD8Zo3J8Ll0mMFCD7/cNWuCfk7FhhTBo8i7Bdxppy4jZglZfAojAOVdfn2ZsHGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 13:01:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:01:13 +0000
Message-ID: <24e55f60-bcd2-42d0-a4d0-0664fcca2a80@intel.com>
Date: Thu, 8 Oct 2026 18:31:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] drm/xe/hwmon: Report errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-4-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261007211417.2093611-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: aae539a4-bdb7-4eac-7157-08df253c3b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ApB365GjAJfDYtQbCtd7Zh9SBTNWc01VrA3UifAFc2un/OzQBeeebraBOdZ0ciGnevJg/ZKGAQ7ChzeA3T8wK/IxDCBGtRxZIVFV5wgbiq9hwaFChii/BLvk32eI6CALrZ/lnmpDoeVi2Es9uy8m9QctfKyBXE83QexcXkDnU+4wfu0knHPBc4eWj2IulzJ+a83XaeVGz1pes4Ct3vWVPH4YvMenI/j+QUNuvaPSB1xStm1nfp9SyclQ/HDCc73ovI0Gx0hwI18gefJg1VECaRYb9243aqW5NWp7ckhP0qJm5Ah5R4a0tfFutB1oiV3qwPve0JzdKxvCFkFd6HT5xJ6zBMFsArMfeZZY3/pCOldoRQM8f4LYgQtV1H4zDmjLiP+MVP11JTZrxsA/GySB+Tc8Bnm9F/YC0HXFv5NmpH3bfyj0mxEGgVkBVnsA3tQl6cvZQMPd1Hid9+t+rKHqBd7l9EpXjFAjFES0jIUwiBmM8OGGYVNassqCZiZKBENfJ+D7QalQPBPThuxQGMMQejnpIWYp3s18FGjEroVNHyVAeIkqdYHsHg04mpDT1cVjZ9XeNx3AMqsClJDea/nBlR+hPrswxPxsqzAJqgc5VFigI6BV+prEQjSZzZCoG1cimjOw8bHtTCVGUoY+RxbWE0lbGI4z3czEvhZFObbA7cE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklWOG9FMkdGOTJqRkVqUjlHSHNQVTJyazNMTEF6dW5Qdm5UQ0gxKzYxTlJW?=
 =?utf-8?B?L2JNZ0QvcTd5RVZDWldWOEVKM0MxcXNaalZWVlJ6TE9NTUdMQm5qdUk3Mmdq?=
 =?utf-8?B?Nm1kTkptd1FjNDNJWFpzSzNQWitETndweFMxN25kZG1GSkxIWjI1R3AyK1Fm?=
 =?utf-8?B?Mk5XQzk1eEgrRGcrMXlBYkdlRllMU0VBb1FpVit2SmFXYzR3dHVlUU5FSStJ?=
 =?utf-8?B?TVFkNEsyT1ZGT0RHN1JQR0RObTdIcEtBdmFXdkkvQUxNR2pLMExwd1o4eEpP?=
 =?utf-8?B?WTV4WHA1QzRrZEg1bmtydjU2VW1hT0o3bU9CMFJWdm94S1ZTSldlN292L0Uw?=
 =?utf-8?B?eVFhVk0yVGI2a1E4Q2ljNWp3bXRRSVk1NnVjZk5RalQvZGVTbFpzWE5NU0Nm?=
 =?utf-8?B?L1RqckJubC96RzY2bjBGM05XSFRuSjVMd2xhOGFIUjYwWFBiUExRZ2NtNHU4?=
 =?utf-8?B?Zmw2SmI1a0c5TXk0VVVTWkJTajBZMm11OXFPRFkzRkdGUjViRjZjVlhHL0k0?=
 =?utf-8?B?Ui8zazh1dGwyTHpuWkoyRDJ2eS9xcldnNFk4MVozekhJaWlRYzk2eDFZNVY1?=
 =?utf-8?B?dGpsNHQ1RjVhRytuT0hRbGVlZUlTTGI3VHBTK1RZOGR1OWNOOVpFczB6R0p3?=
 =?utf-8?B?SkJHWUJQV3dVbVdYOG02eWxLc0duYXBYRTl2TUFKU1d6ZHFjRXNWRWdwbTg1?=
 =?utf-8?B?d1drM3ZjclYwUGRwVk9TMGF6S2JYb2lWdjJrVnVURFhpU3pMODBGRktFaFpi?=
 =?utf-8?B?YzFxYVNVQmZDdFVQa3pmbnA3azRFN1FWd1FJeDN3V3RoRFozZlFhZXV0V3Bj?=
 =?utf-8?B?cE5LLzc5cjR0bDRSdUJuOGkrUWRKUFdDTVNNWTExNUQ2b0lybjRlWkRTZEFH?=
 =?utf-8?B?Y0RBbGdsY1hkWEVPbzRBMENjMU9KTExKUUlvYlJmVkUxeXpEamVKaUNNcFFQ?=
 =?utf-8?B?bytWdnMzd0lSSnM1N0xqN2xYQnNVQ3hwemFuY3NucFlrU3VkQms4aU9qTHJw?=
 =?utf-8?B?NEVUV1pVNU9PTDJBbENyVVN6OEVBTjNkYnh3SzRFbG0yWElQbmhxRzd3eHk2?=
 =?utf-8?B?dllYWVF1Nml1dmsyaTRyY2V0L3JodnJkMGpsS2RRNmtFdXp3Z1pXeUVRU1Ni?=
 =?utf-8?B?SVJPZjF3YXQ3OXdLZFVpYm5IbGxyM0V0dTdPZTFFbFl1UkRnWmtBaER5MGNU?=
 =?utf-8?B?amJJZ1FzUWZUMVJ6ZEN3cVExemt0NWttemx6YjA1bVFYUWF4YklmTU56VzZM?=
 =?utf-8?B?aTUvZEtoUTd0RE1rS2NERTYwNGtEak9mY1U2amEraW1CSEoxSjhaK1d5R0Er?=
 =?utf-8?B?NWZKT1htM3Q2YnhTR2hWVVRKK0c2ZysxSDdMSlpXNldiaUNqYnFjcjJEUkpo?=
 =?utf-8?B?a0lOVFROZkRXUEJVaGN2aEpNSzNBcmRsY1VYTXA3cWprYlB1NmVOYVY5aDV3?=
 =?utf-8?B?U2Jma09xb3FISzlrcjcyNlhLajdzOFA1dG5rRUdSTzZSM2hLSzdLb2d4Q0lr?=
 =?utf-8?B?aWtSdjFrbVpWS3VGRDQ5MjAzMndpMjhqRFllUGRoWUhkalRHMHIwQTVweFpw?=
 =?utf-8?B?RVFtZDA3OXo4OTdHYzU1aDU3RURmWWNxSzZicVJBRDlaKzhLVmF5bHBmMEJp?=
 =?utf-8?B?dVZPZFpiSnRDVWhUNWZTM0ZjSHR3S0txR2FXQ0d6R0EyaGZuaTFMSjE1U2Fh?=
 =?utf-8?B?dE5EVWVKTmY3VlpqTmlLeU42bXVjZmM1LzVBMHN1UTJacjRmUEVzZmlZNVcy?=
 =?utf-8?B?OG5udFhjOU1ickF1a09mbHRGOHFMQjRSdFpZcE9CSklrbklRd3hLWFdmRG85?=
 =?utf-8?B?M0JIc3BxMEtXbmxaWnJoSmQ0SzVSVEltT0JBRGxjaFc5MjFDL3puL2dvNCtG?=
 =?utf-8?B?VXlrTFlBR2puQ1JZaTQreU1TSmtXTytJdG5nRzBzcmtpVk9JSURmNU55UVNM?=
 =?utf-8?B?WU5yNUZ3OEI3c3FHZ0xWRmR5dGFycEY5aTNOVjFubjFZakZsKzZOSEt0amZO?=
 =?utf-8?B?QmVoNGlIMUgwejkwWmhucndjS21teFdUTnd4UkpQUjQ0alVGWGIramF1SXBn?=
 =?utf-8?B?NmNnWTgwakxTOXlmemtyQnFhN2M4b1FqbGhYZ2lpRXFiQ05vNFJrNFNJeXli?=
 =?utf-8?B?ZDJJVWkyT041Nm9RbVlpbEpLUnRUZTNWLzFqOVBvTHBKUzJLRXRyRFV2Z2w3?=
 =?utf-8?B?clEraXFIajZEWkZZeHYvNjhrdjd1dnJFdGcxd3FaNEF0dDQ1aWxxeDBQMDJT?=
 =?utf-8?B?dmdWcE5peFUyRWx4UTlQRVVWcW9uVUI3ZE8xMnh3VTdQcnlZUWxjakxjZHdV?=
 =?utf-8?B?VHIvMC9nZ1pweG1IbTJSMllMMXlNdnhGRTRUNnRxMnVuK1NDSnVoNXY2eFNW?=
 =?utf-8?Q?7af1mIAioVty2tyQ=3D?=
X-Exchange-RoutingPolicyChecked: tQUc2b0CLbtyUq4YJTcoYALCrExrfMnTDwQL2WbLveZkURzijnEWzPLX52Y7gRJURZuAmSrufXzxcz8/0WPSKd0L0bqwXYJR0crC5kiillTiGo2CLSFku6kGiYfZT4Qy37PcreNp71/JIeuhefmJiCOAAQVLS2jRik1q9wkXNEpw7Mz5Rh1fp76itCJFtgmHLsP/Bz8KfqqTkvKxzUM0GgM3eQXW8cXGQcOJI8s6gRTQVSZzMI0CLU86aIxpI09klwaM0T5pvXobLfBPsAOyjId+y5bvtz4NE+y2y/RBWuHlMK4P9wTUcqFy3oY25et8aFMKubSjwFJ7Q11DjN6bKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: aae539a4-bdb7-4eac-7157-08df253c3b1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:01:13.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQSce21f7wxGYd3/fQrY9p6y3rN0lZv1fl9U0aqXD2+tOqqnWWGw9M5QMx0/ZtcM07v4juzFrDk764P3fltOYjB15tdZ5ctnFjzD1KTYQ38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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


On 08-10-2026 02:44 am, Dnyaneshwar Bhadane wrote:
> Replace drm_err() calls with xe_log_err() using the HWMON component
> tag to enable structured error reporting with SIGID for hardware
> monitor failures:
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
>   - Store error in local variable err (Mallesh)
> ---
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec3..fa5473ed6e7f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -15,6 +15,7 @@
>   #include "regs/xe_pcode_regs.h"
>   #include "xe_device.h"
>   #include "xe_hwmon.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> @@ -558,9 +559,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	if (hwmon->xe->info.has_mbx_power_limits) {
>   		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
>   		if (ret) {
> -			drm_err(&hwmon->xe->drm,
> -				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> -				channel, power_attr, reg_val, ret);
> +			xe_log_err(hwmon->xe, HWMON, ret,
> +				   "Power interval read fail, ch %d, attr %d, val 0x%08x\n",
> +				   channel, power_attr, reg_val);
>   			reg_val = 0;
>   		}
>   	} else {
> @@ -1563,7 +1564,7 @@ int xe_hwmon_register(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
>   	struct xe_hwmon *hwmon;
> -	int ret;
> +	int ret, err;
>   
>   	/* hwmon is available only for dGfx */
>   	if (!IS_DGFX(xe))
> @@ -1594,9 +1595,11 @@ int xe_hwmon_register(struct xe_device *xe)
>   								&hwmon_chip_info,
>   								hwmon_groups);
>   	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		err = PTR_ERR(hwmon->hwmon_dev);
> +		xe_log_err(xe, HWMON, err,
> +			   "Failed to register xe hwmon\n");
>   		xe->hwmon = NULL;
> -		return PTR_ERR(hwmon->hwmon_dev);
> +		return err;
>   	}
>   
>   	return 0;
