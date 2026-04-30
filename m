Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB81FCD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833DD10F45D;
	Thu, 30 Apr 2026 20:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k91j2UuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B973210F45D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777581967; x=1809117967;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EBOH5AJnnjOp2l5rEfifDdT0XHD9SDqkcI3vzilZCis=;
 b=k91j2UuCbrHQG9Zv2EKj9VTj/bMYcD9lvhn9GiJnZM8SevI94/Cu8QCf
 CntvzbSCALySHQ+WnUMGjP4xlK2InHDTF9e6hBDpePzHFT529FVddjviY
 pIC3eKmui+G/Mk9iNziCZSvPOXTT/hIVHUXBVvPudq9wCWy4EvxhsrKrg
 qshQn7w0AZRSNqNHxGEfQ789Fe9DXl+BYZIHLCha1ZU7Fmzo8wKv+oQQF
 iR363gGCTxbDH/QK1SDvc1fDYjf080Xni3v1FmuJjN69XtXZNQRKjlik6
 IHTzxjc3UKjOzIhTda41u4DyRqe07aM6paddD7LGhi4Q7j4+L+OP9gTfx Q==;
X-CSE-ConnectionGUID: rpAAfRvETlmFQmQsxcoFfQ==
X-CSE-MsgGUID: OwZbfncbSUKJXgFsRGYqFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104004280"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="104004280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:46:07 -0700
X-CSE-ConnectionGUID: qt5ceMZxTVWWO8QLqDfW1g==
X-CSE-MsgGUID: CjBj0EAgTkGRodyrbwcyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="233650972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:46:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 13:46:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 13:46:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 13:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJes4SzEHNYka4P04ymBEoqaaBlhxsvhSQQ/z1YxS+ZCUTT6wuunapd7FoeAeCgi4FlAksDVNRcoWK1h0xLOHJ6HEPrB466AdEElsAHjpVJ8LM+9PthU1WB4n3I6V2xtEBMwUGymFRRSNjreXZ8l6BS22q66DySq7ccRBNghoq4KqDuGNDAuT+FfId+rKMppydvJ+YYmuJjS55zuajAtS5yC7V5H2kiFkgQinmMYQQWLWRY52CJZ+vm4ZQ6GtcrL2iN95OK1PvWTDsqaT47DVHazi8SFJ6Ex7PqJAkQ4e1eBBEob3ezXWionOe++thIR90IHL4Ip3C8R15FwqTqNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3dLR551/ScMG2kKUfLK51GeoAurw3tXXcyZWoGqlas=;
 b=jwgFdOSRWrom9vy8y350vM/ncGETuuQpBCiNE3TOXh4ZUY4flGLo0znwAUlVgDgIMNkzjKP++PPTnIwCYPdOHOb6lATEadLUYfg/oBQ2Jh0rQyHQq5WULphzOkImkoqT4wToa9U0ObxC4Yi0m3Pj0g5dkB0DwtjbKGKfD804h2D3GKnNXyh+0pmFCFbaCzYZA8ZE5hTSa2iyLQZF1Cu73jXEvgxVVXGH+ht0xZpWtM7iTHZHq7daRo8hLOoDNjHqbX/sPEc9FNyeP4rbukIBbpkzc8GK6CPjHZxY9UXCbYoSfeseq9Hj0Mng8hiU55BMBRqpLm/1kPkBl2EUUq8tcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by IA3PR11MB9276.namprd11.prod.outlook.com (2603:10b6:208:572::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 20:46:04 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 20:46:03 +0000
Message-ID: <02d54168-c180-40c9-a6f4-a4c505c85a66@intel.com>
Date: Thu, 30 Apr 2026 13:46:01 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
 <177754903897.28202.3823689966185391475@5ab824fced77>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177754903897.28202.3823689966185391475@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|IA3PR11MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 63452cf9-a5e6-4942-a1df-08dea6f97ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: F9oFTVl/RJd2DdNkQQ9B1H2D/gtqleUsm3a0q/fauWKDzxGHJ1z6VlwN1SOWv2LNm8GoJIEf1EuWbAN1zUeA3b5u5V+IIybzvmgKNZJUKcfFquPfN5ol1mc3asZqUL4XEYtqF9RI5qPP5ety9uMKxTmjcflZK24FwgVqeYc/0OoLO284Z1pkwC2q0ZPXFjKkldogDt75ABnotm5/THs4cfCUmmPWDATkWslUCHDKJ5zMxFCcnGq7OQjiYt3Y/0ugcUyEp7R5AQ5RYIZtCk/FpKaG3mmt5wDzqq+kj4KmUPBUrRQubyi+gCSFGKle/NEP42FmsKK5UfC4yicWjibhdB3mln2SMsMyr8VXXpmMeYjgR3AZAAIe5gXEdK/C3bvncU1cLI28+C458KZddXpWRBDYBpSZxLYzb5MJFlEdhc/VICNclfSMm2HKhFsXvttzLqr1Rjmv7r3O9XL29zdGN8aAkidrD9DyeSVVKfnGmt4P9b9ZpXDIUOJGflR1uuXMPnDCQTS+OxpgunrfY+WwG8txZQTLwd2/lc0dua8Y+Aqej8L7uGfzlwdSVeEpT7yLCzryhVIsONOTkM0YMlIkC6Svgab4X6iQ7QS2my5ArJ4vjmwoVqHbXuNLAHR7+NPp5h7ArZdLv32VIKV1NFHQcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2RoaEdZM2RuZ0toZ2dha3ROQyt1SmhNUDlLRWFpMWY4TG1CMkZvQldDeXln?=
 =?utf-8?B?aE1TdXk4bE80VU1RTlg1TEYvbHFJUVBqWE5NMERxaFZWR3BUb1BiRUYvN2Fm?=
 =?utf-8?B?SE1QVktqa2hlQmFNaFlCUUN0NUxwSm90b2pjZ2FMTHUvNGJFUXNoa1dsRWVD?=
 =?utf-8?B?R2t4Zjk1Tmk4UEsrMWU1d2VXTU5JL0dFL2p6RW9JU2tJd1RGQ0ZBUFpFd1Vq?=
 =?utf-8?B?RllJSms1Nk41b1BuKzMvL2tMTHE1QTVLai9mZW9MVkdYZU1BZWQ3d2dzaThS?=
 =?utf-8?B?WFEvS0tGU00vWDd1RFZIOXZsL3RaSGd5NmwzSWVMbzRJc1Z1Y1ZoaW1qeDEw?=
 =?utf-8?B?b1NEV2NMNnpZOERoUnNIUlZPU0RzUTREcHNzeW5wbU1ZYi9ENGxaQlVMMnNX?=
 =?utf-8?B?elZjbjVBU0V5cm52SzV2U2UwanFIYXJ5VHRrekJkbGN6S1JoOFpDY3RyMWRW?=
 =?utf-8?B?RWw3MmFqZTV6cmkwUmRLanl2aGNqZGFld3BVNW1mWGJFQmVJd0U2WG9zMHRQ?=
 =?utf-8?B?T0wxMzZPcUdRb0NZWFMzZjV3b0NMZHVDMTBPbHlXNjROZWhYRHhHZXBtV1gr?=
 =?utf-8?B?YkZ6VHdZTkthaGFtcnFkOVkyeXVvQ2FWLzEzRHl0OTNwckdHQi85RXJpQmp2?=
 =?utf-8?B?Y0dpaEpONVBRNDdCbGVRZGkvcFRaamFMeDFyaFhlLzFvTlBWRThHSVZuVmU2?=
 =?utf-8?B?ek4rd1AvZDltbk5SeThvM1V1OHZOd3FGM01QMzg4K1lnaUl5d2hCYlZBdlFm?=
 =?utf-8?B?SU56ZmhxRFdFTGhDZzZEM3VXRjNVZHN6SnFjd0F3TXRQcFZJc0xtK0pLbHha?=
 =?utf-8?B?ckJLWkUvR1BwQ3JUdnFrNWg4MnBta0xOTDQ0SktvZVlqUmZHSlJmd3RXZm9Z?=
 =?utf-8?B?NG81elRBTzZYZi9LNkVlTWp5ZTBDcFVJTWx2ODNaNnlMcDNmWGtCMkc0TmdI?=
 =?utf-8?B?RUErU1kxS1VlcWZVbVk1MlhHNXpFZ25kbStZeC9Pa0lHQlIzSUhQQmJNS0F6?=
 =?utf-8?B?KzE2NEIvMHJXbEhzRExET1pDZHR0QTZLMWtkZGVHb0FRZXVJTHR2Z3p3ZnJB?=
 =?utf-8?B?UmN4RS85U0VENFA3Z0dBaTFXUzdoSlRvL0E1ZG9vaUJ6bnhnazJGaEllbDF5?=
 =?utf-8?B?cjc4TmI0cmRJMDNSZ3lrZG9jVzFwRi9rMUozbmhrdUFkSDZWRmxFN2x2NHFp?=
 =?utf-8?B?ajhsRGtrOFpHeS9yVTJrZ252ekd4TTVXR05BbzA2NG5XL0tablBvLy9mMVds?=
 =?utf-8?B?WHZtTWFTTmU5VElrMGh3d3dia1BMdEJ6T2dDUGh0MytpaFdqbUpTenR2dXcz?=
 =?utf-8?B?WjNyL1F6cHpLeEZKdm1icjJyY3VYV0FlSkNVYnduMTFzNEoxQkllbWRVTVhO?=
 =?utf-8?B?dVZ2Y0ZlT3o4cUVScWQzOW5iK001REQ4YU9OSnpoTVFSakhYNjlaZmgySi82?=
 =?utf-8?B?Z3lubm12T0FWb3Y5WjN5blZtWmNJV1paVHYzdnQyNFZVK1hseWRKT2ZocGhJ?=
 =?utf-8?B?VFZzV2hLWU1yeExGNE15b2pxL3RYTE9JQUZ6Zm1DMGpFWHk1b2JEeXE3STA1?=
 =?utf-8?B?OXBWVWhJMEltdE10VXlDZVhuaitZOFVnMHAyWXl1QWdrU1l5WWhuSjNCOExq?=
 =?utf-8?B?MFppdmNZajJpRXUrWndIV3psa2djektlTWlZdVFJWDg2U2tPMm1raGxPOWFx?=
 =?utf-8?B?eGNBdTI4TzhFelN4Z3ZVdlNXUEpNZmNKM2IvWXg1dW9UU1N5UVdtR1ppZU5C?=
 =?utf-8?B?S3BxcXVBNTJQd1hUSkVCNWl0NWxnYjNnNElMZURNQ2hWZHJvL214YUJINXFu?=
 =?utf-8?B?eWdtdHpkT2NPSllTMG5scmtzQmZoSzJ2ak1jMDZoeVV5dTVkNkk4Zll6ZUt3?=
 =?utf-8?B?ZjU5cDRTbURKWGpVdmppc2Q3YUZNR1FUMERzdUUzSXJ1TklUWGZrTER5SGky?=
 =?utf-8?B?MmJLWXJiaXVsdVZtTEFsOTQzdittVmRMOVp2Mk5XOGFZZTJqait4a2lVM3lD?=
 =?utf-8?B?OG1zMEJJSmcxSlhhU2xjTkl2eTlkMG51YXhJbWEyejY5MFVnRlNFb0gwTzN3?=
 =?utf-8?B?KzhPblpUa0VyaFh5dDZXNllLZ1F4T3h6VkZwZUhyT2dBUkZHeUtlN3NpNUQ4?=
 =?utf-8?B?RE80T1hNMmxGYm1qbDJrRjFsMWM0eVpmeXZZYWYzSlBYemdXT1FDdjJ6d1RE?=
 =?utf-8?B?M2lZbUJPdE8reW1yQVIxZ3k4ektPYmZGVlJLUnFYYzNTa2Yrc1Y0RXYwbGlN?=
 =?utf-8?B?TVdVQ1VvdFpBWmg3amk5andZT2lzcFlOUThIaUppWENaQ2pieU9na2RyQXh0?=
 =?utf-8?B?ZUx5RHgzMWI1MGZMMG1PaTZya1hSbFNBd0ovR05IOENna2dEUm5TMDNHVjdp?=
 =?utf-8?Q?WikGXg4XdWCIraM0=3D?=
X-Exchange-RoutingPolicyChecked: rp0e2DlSoZdgkMXlbcEwqeSeS3Nibg/x/v0u9MnAAwPGemCU6KDOTRgmRkxsBSOtTJAWbRR/85/zeuOWz7UQv7RWeNgye/oEvLRtLbygne1B66hi9NWbGzOV5RJSSMwUDxl64/2fRbRZTKpJORrwl0VAvWNxCjsL1/OAcOrvEOVfuSuIL7B+g3gbZu5mmvwWgU+k/LKZ8FhqxJ9tcctfcov1V+ICBg7YBTGa/bs6HL5crNXvYFicLSxyXRi7NyTeAf2AgS2CKodkkl4mRt+Iwm4E3wEN04hFcadERfOHRg5FK4jhBYZkOxWsLEnZx379buNM7HFrByCmMCr1p3JTRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63452cf9-a5e6-4942-a1df-08dea6f97ea8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:46:03.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWehV3PWkl9+BJWWRmws+QtJqBpyJ2uz3t648oU1T/BjPu1BIfcEwDKXvBZ7PI93VFKS3cQ6+uCOazY0oK8EmZKz5K3+rtt4bjndnisnCs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9276
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

On 4/30/2026 4:37 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev4)
> URL   : https://patchwork.freedesktop.org/series/165457/
> State : failure
> 

...

> #### Possible regressions ####
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v4/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

Test not run on platform.
"Test requirement: intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)"

> 
>   * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
>     - shard-lnl:          NOTRUN -> [SKIP][2] +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v4/shard-lnl-8/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

Test not run on platform.
"Test requirement: intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)"

> 
>   * igt@xe_exec_system_allocator@fault-process-benchmark:
>     - shard-bmg:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed/shard-bmg-9/igt@xe_exec_system_allocator@fault-process-benchmark.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v4/shard-bmg-1/igt@xe_exec_system_allocator@fault-process-benchmark.html
> 
>   * igt@xe_exec_system_allocator@fault-threads-benchmark:
>     - shard-bmg:          NOTRUN -> [TIMEOUT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v4/shard-bmg-4/igt@xe_exec_system_allocator@fault-threads-benchmark.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
>     - shard-bmg:          NOTRUN -> [FAIL][6] +2 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v4/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

All three above issues are unrelated to new GuC firmware.


