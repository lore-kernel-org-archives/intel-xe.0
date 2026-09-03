Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C55C624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076B10F3B2;
	Thu,  3 Sep 2026 06:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXgI8EuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924A310E391;
 Thu,  3 Sep 2026 06:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788417449; x=1819953449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xnQD4yC3qm6B+1yEFLQjuht7N6v/1Av+NrG7imbaju0=;
 b=mXgI8EuQZHQDk5zF8UY7Vg0kLQlXxSdVJGZWehbBCDqPNmuFsVyTRw87
 ybxYNrdd/JHl4WUhya/IU1KqHNug3phwmDU8ngmp3bCEGGft+k23qusqf
 qSs58fAD6wHxIYZmmYvp7CCFurDnZTOwTIvx8n8wrzwCzom3/fz7ZWNJe
 mMB1ntbur2goPuWwdSASEYSUUq6bsRMGamsMYGfXG/7SaPKHLZHEo/QyG
 WgqjjQOdZM3efev8FgUgNbi62mYl9qbX7toQkOSOKOEqOgm+hkYmcG+ke
 NWbOIpfJ9SsAWbdliqoTJdHbtR07OTtUujJhvxC79ea50dTv1QQvNeqSX A==;
X-CSE-ConnectionGUID: roLPoR8yQTmGW0EX2OTCEw==
X-CSE-MsgGUID: TED/ahMsSliC4rOK28H9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106253561"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106253561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:37:05 -0700
X-CSE-ConnectionGUID: ouACmP/1R8S8D3hnuegmfQ==
X-CSE-MsgGUID: /ok5wKKQTUe4JfS+HF9A6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263452143"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:37:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:37:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:37:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRh3huks05yYY1WSIcSmz7yFOk4/gSnHQZpdpQetNH/cyJitZrRGaL8zx9uyOGROpVyK86XeychuqoWLAySbwOfLldrmLD3PJ/bJhV6orFqx9Am4XPosvaU8Exnkyn3VtekoeQGnjpIZRZsGaJqb9WLYMWe0QjnVp2hVDwUXUfjThTatPGh+aZSVOEHq4R1Pa5RlUMe3VnZTh/IHP4JUVm2TboGQZAKgd8rVghQgtutg/MhYkBeimjbwGwy+q9Yx4fPLLxT3b/jXQvcOvu6ALSwG4Ofa/DUkfHGOI8IV/tl4RhAv6mDxPVbHXqks2yYmQRbq1EZj0UitiKsvCazcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8bKXJ0udbnkIHI7MUzEmwDuDMsw72Uzl/xIkKhz4g=;
 b=f+zs7CBI4i0W+BBWZpCJwu34aiS5cDhtXAzB+C17xDgZqCIIYWexE0ltOS6Hg65+U5Cso/6JPNWurDxDhUmiv0cWp5IRs1vAO+BPaDQNxPu4nJoDgSprlaZfu+xzWfcJhArwBe5egJaxIb0+umn2RbO2IxLw2p/RY+DrIuaCArTfZsI5Fa0nauIenDVkf0S1xW2Q2YnFNjmnUqvK/TBwjVddoSbUL90m8pNI65qqLP9OAVPXwMiCcIhYJtWfYfnz38BfiGk3kjq0+lmKUHilefRg1qPvZJWtuKEU/YW7KE7YnJEtVNjF8KulHIxUnfdJa2g6km0UobcwmXa7A5vRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:36:53 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:36:53 +0000
Message-ID: <1c95a6d3-5731-4dca-8398-69f46627847e@intel.com>
Date: Thu, 3 Sep 2026 12:06:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 3/4] drm/i915/display: Reprogram AS SDP skip frames on
 seamless VRR transitions
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a03ab4-c71b-48fa-fc4b-08df0985bdfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|56012099006|5023799004|11063799006|4143699003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: A0GTcnJFJA66HzYgWmC0xoQAyYTCTK0ObRkPZH5VWiMnJRykznKZ2HmbNAXIM0lcfgM+V96IY5xijuJI8xr3ssr6ogsyshr0h4gOuUpUhT/TT0hxLdC1UuKcSoxeg0lwuV0H80VrPGRvCMKBj/DFS5PPBJJV3+sX/1EjJeR185tj/72ZiRYHT5seCcdCeA4XJwAcV6clXim8csmuFHddDVmusTdQHsQLjqZ/jzOojIJ3h3hLWqX9NAkNEZ/iZwPYcCoriVzW0zJr6zfbLOKLwtcoKqnTUbklVJ2WQu145/eN/dMp1p/xTr2SJBXKlh2C0XQsC3kD87uJSSxjqHLs1RFwvqxDWZtf5ktNmKNKc3l2lq59Fg79cJZIykNT1XGo9QLnkpzBrp3hnO0548vigkfpgW+9ze9ePtQuGe7O26hz5sIRcvmZDl7pqO9gMujfNxrvcKEPskYMUPzJi/svwcHuz2ob5WDtB4HGQ75FRy3sbRDLbixoFqOhLGcmFXmEdJCgVJA4J5g22YJ4AKKSGnWtePLp8VCCBoVlHuAgFLvWIX0fIq3y9d/MTrGjKsBR3s+zqdxWo3XENUm7Z1d1SGJPl1X7McN+5d7tF+zFmkMhy8Vbsv1LOo4inIB1UtBAf+jSGnjt8yAaDxcEydZaVA3U5mzvAsA7RpMOst2So4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eER3QVRBV1VQK2JuZzFDOVVJRzlUV1ZyeE5iNS9zZlBOUnhnVGp4R25JTHRP?=
 =?utf-8?B?dXhvUkRvd2xnU3lqbVc3eVp5dmU2eEI4clFLcDRab0JacGwyUTZ0alpCc2Y4?=
 =?utf-8?B?cVQveVp6MGtQdHQrdHk2SFAyQVlXUm9ja1RUbzJWVll2MnVGNlVpaExFa2Rn?=
 =?utf-8?B?bUJDczVEMzh0YllxQmZ5WXpEM29FMTNuTU9lME9tTHZ0MG93QW9kc1I4V2pY?=
 =?utf-8?B?cUFIZVd3TE5GdXh4KzhkRjl4ay9ySDJ2ZnVZbWlxYVlLblE3UHdQRW56NHVF?=
 =?utf-8?B?SldZMzdJMjd4NTBuMFJHdXBBaXBrSVF1WUJjcmtVZEJXWkxYSXFWNlBvaldj?=
 =?utf-8?B?QmI4TklSWm0wWlJDRjZRUkZLMHloRUZub29pMk4vNFFSUHczTnF3NmtHMEI4?=
 =?utf-8?B?TDlzZ3hncnRCbU1waEJxc2Z3MGVnU3JtL3huV0MwMUJVNTl3ZndZRmg4L0hY?=
 =?utf-8?B?Q3ZsaU1wRkt1VEZKa25tQ2V1TXNobXJJbEZJRWVYaHRwZk96MFppMzZ3Vk1H?=
 =?utf-8?B?UEQ5WlZVckZuYnlSMUhPT3BlYjhVYnd5ZWRyd0NTcGhhbmJxejNJZEg0VFRD?=
 =?utf-8?B?RXI2OW9CSGlyZjZBcDVaRlFVUTdNTTlwV0xKVFY0QmFxU2oxQksvZloreU4z?=
 =?utf-8?B?MUpSalpjVy9WTElaWVFQejdkK1Avam45T2Y0OVdMZUZIU211MVJLbUNldWZj?=
 =?utf-8?B?N1lXZ1dvZzNUNnFwcGVxTlNocTNYZUNlTDNBdldzd1dHc2g0UEFOdDBEdVYw?=
 =?utf-8?B?REdnaTVsMktUNkJvZ21rWGJzN080WEtSSy9WSkFzbTM3OUVHWE1HbFZKSExv?=
 =?utf-8?B?YXBJdlJIT2U4NUFveGZ2b09NcGtDd0ZTYTJIQU81KzNkREYvaXZaem85eWZF?=
 =?utf-8?B?eGx3WXZEM0IrNDhlRGJlTEU3Z3BHUDJUdGkyRElaTjRWSkJINjJVQUV1L1Iv?=
 =?utf-8?B?OGFJR3YwZFNnZzV0YXNENzJMRHgxVW5GLzZrVExCWU1NTGxBVG01bE9jU3Nx?=
 =?utf-8?B?UzBoY0RtOHdYd0R6cE5Qd0pXcTlPN1EyeEhCWVFnSWYvM0JRTFJCRnZyMVJo?=
 =?utf-8?B?QW5MdFJzL0M0S2E2N293VDBFcDVlSEM4dDJyV1JqM1NEcWhveWIvYWF6N0Jy?=
 =?utf-8?B?cXdtNy9DZU5nYmpTdjhVdGFieEUyampQUTJXYktXUlREUVBWQ1piMnIxTDVj?=
 =?utf-8?B?N1ptM2RjY3ZBWkFxdEhYaVFNWGltNTlBOGJGLzhNc1FEeHpIRm91dEZaS01p?=
 =?utf-8?B?WVBXTmNpeFhKU2ZST0M0bGNsdkNRUUpYaFZ4dksrdmJoQkFJS0Q3ZkJuS3dX?=
 =?utf-8?B?VGdDeTRCSEFseWtrbExoYklTUHZlSmlDZXV6aW1wK0Q0OE8rU3ZleG8ybmND?=
 =?utf-8?B?UktJVXNDQmJ6Ti8yTnc5T3A5YnloT0srRm1nQlFrN3hDT2pHZjdsWkN0Y0Fs?=
 =?utf-8?B?ZjI2ckRua0dCeXpRV015WHIreXVvUVk2WnhualovWG5wT1hmU2hFN3FBdTNL?=
 =?utf-8?B?ajUrM1J2YkxpVzZWd3ZDM2JFeDZNanZQQTV2aDVFaDRSY0M1MUZMQk1tOTU4?=
 =?utf-8?B?Z3kyVm5hbUlaQnhIUzlHQ2s3UmpxKzhldmxlZnVDcytIMjFYTG1WR1llQksz?=
 =?utf-8?B?bFU2VjlmOHFsSEs3b2g3K2p6aXZ4SlBQYnd1N1dsZElZdFdhOUliUlVnSXNY?=
 =?utf-8?B?TUNQYVZBQkEvTHdGMysrYUZPbDc0M1djQVR6VUlLcXpQRmRuUUg4TjloUmpF?=
 =?utf-8?B?aWZESEs4dEorUVlBV0MrbEVKR2hpdXRjRWpncGJCd0tXV1NHY0dGZU5jcGJC?=
 =?utf-8?B?MmFtazJzRzFCUmZlcmUraldSdXZ5emJnWC9KRjI4UktET0dGbjFpS2tyd2h0?=
 =?utf-8?B?TTdXdkN2ZXdUU1Z0NWN1eUh0U1NrVXl4Ny9oOE5JVEJ1bkJpWkxKeFQ5OWlp?=
 =?utf-8?B?cXdCYjZMOEI4cFVBOHc0dlJkNTFmalJRK0VnRkdnc0l1cklySWlaODh5RThy?=
 =?utf-8?B?M1RnVG1nNkx6anZxNFpyYmdSUHptYVBlODlRdHVOU3JVM1l6WHdFRjdlbDd5?=
 =?utf-8?B?K1pUTDBHdWdxMmwvYWI1MEVvdmdTWVpTYjFtRTBWNjQzbXhuSm0vZTBXczhO?=
 =?utf-8?B?ck9hSFRDazdRYXZnRHFSeVFqR1FTVDROSGRyNHpoMXVuRWxwcWNWd0x0aDlY?=
 =?utf-8?B?bk1jU0dVckw5dGx1bHRBTVcvMmVyUEd0TzAyTDFybkJtM2lSSHdGaTZKOHFt?=
 =?utf-8?B?NU4xVmV4VVI5U0J1Q1ZOZTZvdzFXbG14c00xN0kxTDBRSzNxU2tLOUU4aXE4?=
 =?utf-8?B?UDROcjVIMUZoeG5lbVlGK3NoVjM0R29weHdJcEo1LzY1OVJjbHZuamFiV29s?=
 =?utf-8?Q?3VZtxYZmcwNMwew4=3D?=
X-Exchange-RoutingPolicyChecked: VLPeS6+HEDUznvTX58+xn7jEyGoBt1KZIV9crsTmyHSRh9x0RThdFR2LYKLr4A6Sb13k+Q+p0uKbXqpj4v1O7S8lsppqzFr9/HkihVy1a8zZGjjtNCxSKkd9wA57UqD9Sx0SjqC4HA2KQLn/YYL/hR+IYQKt66wz0rtngAI7JAeGB1K1oDyaCud4hQfz8jgQusWuAowGaLM12Z0jFZ42uxYa8qvBtABpM5aFF5HBLiCpFD3RpBDOswpxQSTqhkrBxb6l8qK48IddX5UoJzWgAYdYESh/jbKbilGaORhGGpRTjncBSnpBpQ+eOjsjHNW8ZmAu7sK3IMTWxKizL9gYvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a03ab4-c71b-48fa-fc4b-08df0985bdfd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:36:53.3656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD1MjJ70+tlDM+rXYGywiDa36EaJ86BRjvvhuzexUGPJ5rx0yGzI3PGgz4nXS4OI3P71cpaVXBLiaE3KN6lMzshMm68Hg8ohFtwkbvGyxNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

Hi Uma,

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> The AS SDP skip-frame count is written to PR_ALPM_CTL only from
> lnl_alpm_configure(), which runs from intel_psr_enable_locked() on a
> Panel Replay disabled->enabled transition. VRR, however, can be enabled
> and disabled seamlessly - without a modeset and without cycling Panel
> Replay (intel_crtc_vrr_enabling()/disabling() in the pipe update path).
>
> As a result, when a panel comes up with VRR off the non-zero skip count
> is programmed, and when VRR is later turned on seamlessly PR stays
> enabled, lnl_alpm_configure() is not re-invoked, and the stale skip
> count is left in the register. This also leaves the coupled AS SDP
> transmission / DC3CO idle-protocol bits inconsistent with the DC3co
> state, which is recomputed on every commit.
>
> Factor the PR_ALPM_CTL AS SDP programming out of lnl_alpm_configure()
> into intel_alpm_configure_pr_as_sdp() and expose
> intel_alpm_pr_as_sdp_update(), which recomputes those fields for the
> current VRR state. Call it from the seamless VRR enable and disable
> sites (non-modeset only; a modeset re-runs PR enable anyway) so the skip
> counter always matches whether VRR is actively driving the refresh rate.
>
> v2: Fixed Sashiko review comments
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c    | 119 +++++++++++++------
>   drivers/gpu/drm/i915/display/intel_alpm.h    |   1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  18 +++
>   3 files changed, 100 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 0a33a89975bc..c784e77f610b 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -427,6 +427,85 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
>   }
>   
> +/*
> + * Program the AS SDP portion of PR_ALPM_CTL: the transmission position, the
> + * skip-frame counter and the coupled AS SDP transmission / DC3CO idle-protocol
> + * bits. This is a full recompute of those fields (the base value is built from
> + * scratch, not read back), so it can be called both at PR enable time and when
> + * VRR is toggled seamlessly - which changes whether periodic AS SDP is used.
> + *
> + * Caller must hold intel_dp->alpm.lock.
> + */
> +static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +	u32 skip_frames = 0;
> +
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> +
> +	if (crtc_state->link_off_after_as_sdp_when_pr_active)
> +		pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> +
> +	/*
> +	 * Skip frames needs the AS SDP to keep flowing during PR active, so it
> +	 * is mutually exclusive with disabling AS SDP transmission in active and
> +	 * with the DC3CO idle protocol.
> +	 */
> +	if (skip_frames) {
> +		pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	} else {
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> +
> +		if (crtc_state->disable_as_sdp_when_pr_active)
> +			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +
> +		if (intel_display_power_dc3co_allowed(display))
> +			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	}
> +
> +	intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder), pr_alpm_ctl);
> +}
> +
> +/*
> + * VRR can be enabled or disabled seamlessly, i.e. without a modeset and without
> + * cycling Panel Replay, so the AS SDP skip-frame programming done at PR enable
> + * time would otherwise go stale across a VRR toggle. Reprogram it here so the
> + * skip counter (and the coupled bits) matches the new VRR state.
> + */
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_encoder *encoder;
> +
> +	/* AS SDP skip frames field only exists on Xe3p_LPD+ */
> +	if (DISPLAY_VER(display) < 35)
> +		return;
> +
> +	for_each_intel_encoder_mask(display->drm, encoder,
> +				    crtc_state->uapi.encoder_mask) {
> +		struct intel_dp *intel_dp;
> +
> +		if (!intel_encoder_is_dp(encoder))
> +			continue;
> +
> +		intel_dp = enc_to_intel_dp(encoder);
> +
> +		if (!intel_dp->as_sdp_supported ||
> +		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
> +			continue;
> +
> +		mutex_lock(&intel_dp->alpm.lock);
> +		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
> +		mutex_unlock(&intel_dp->alpm.lock);
> +	}
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -449,44 +528,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
>   			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
>   
> -		if (intel_dp->as_sdp_supported) {
> -			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> -			u32 skip_frames = 0;
> -
> -			/*
> -			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
> -			 * periodic AS SDP is a Panel Replay feature that is only
> -			 * used when VRR is not actively driving the refresh rate.
> -			 */
> -			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
> -			    !crtc_state->vrr.enable)
> -				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> -
> -			if (crtc_state->link_off_after_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -
> -			/*
> -			 * Skip frames needs the AS SDP to keep flowing during PR
> -			 * active, so it is mutually exclusive with disabling AS SDP
> -			 * transmission in active and with the DC3CO idle protocol.
> -			 */
> -			if (skip_frames) {
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			} else {
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> -
> -				if (crtc_state->disable_as_sdp_when_pr_active)
> -					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -
> -				if (intel_display_power_dc3co_allowed(display))
> -					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			}
> -
> -			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
> -				       pr_alpm_ctl);
> -		}
> +		if (intel_dp->as_sdp_supported)
> +			intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
>   
>   	} else {
>   		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 328920027f1c..f8f605d94f96 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -36,6 +36,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
>   				 const struct intel_crtc_state *crtc_state);
>   bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   					      const struct intel_crtc_state *crtc_state);
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
>   void intel_alpm_disable(struct intel_dp *intel_dp);
>   bool intel_alpm_get_error(struct intel_dp *intel_dp);
>   void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fc30a455bed3..9151ea6c15ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1232,6 +1232,14 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   		intel_vrr_disable(old_crtc_state);
>   		intel_vrr_dcb_reset(old_crtc_state, crtc);
>   		intel_crtc_update_active_timings(old_crtc_state, false);
> +
> +		/*
> +		 * VRR is being disabled seamlessly (no modeset, Panel Replay
> +		 * stays enabled), so re-apply the AS SDP skip-frame programming
> +		 * for the new (VRR off) state.
> +		 */
> +		if (!intel_crtc_needs_modeset(new_crtc_state))
> +			intel_alpm_pr_as_sdp_update(new_crtc_state);
>   	}
>   
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
> @@ -6971,6 +6979,16 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>   		intel_crtc_update_active_timings(new_crtc_state,
>   						 new_crtc_state->vrr.enable);
>   
> +	/*
> +	 * VRR is being enabled seamlessly (no modeset, Panel Replay stays
> +	 * enabled), so re-apply the AS SDP skip-frame programming for the new
> +	 * (VRR on) state. Done here, outside the vblank-evasion critical section
> +	 * (which runs with interrupts disabled), because it takes alpm.lock.
> +	 */
> +	if (intel_crtc_vrr_enabling(state, crtc) &&
> +	    !intel_crtc_needs_modeset(new_crtc_state))
> +		intel_alpm_pr_as_sdp_update(new_crtc_state);
> +
>   	if (new_crtc_state->vrr.dc_balance.enable)
>   		intel_vrr_dcb_increment_flip_count(new_crtc_state, crtc);
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>   
