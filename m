Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9131C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 17:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5CF10E04D;
	Fri, 28 Aug 2026 17:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDqMUTwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F371210F45A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787938318; x=1819474318;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KiJR/eF55OLbUw/eMGF2Kd+GNeDt4MprJD6mKgixdCI=;
 b=BDqMUTwaHrSLmprVsdL9nE3XcX6C6PJoQPgpcNrX4i4ZisJLKOp5EqOA
 ZinSQyEUsIMjjcGF6rGuxzysxBg+n8OnUeby8IJT33EBrO8jKdDAudQj4
 9VzAJ1aMw6vRoFuxtQxOV12qSu7QiJHnyIVKno5Ul6vuCs3tS/bn5Wnzi
 m35c4EZfaoXzZqKxda1ugfR0DmReXlcYbGIaZzBN6J8M7xCcmGTTfXC3d
 riRXD0lPpqx4wqhKhoNdEQ8Yq+VDzR5BHDarNkqmhaTJnDTY0mFxSLm8n
 ZWa6QYAIxIzgDnvmQOvTr3B0faF86gR2m6R1poZrwrsdqXhlZLXmzPa+c Q==;
X-CSE-ConnectionGUID: MA7tLO8rTC+nfG6iBEs4Gg==
X-CSE-MsgGUID: Y+cwYxzTTOCE35vBynf9kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88476219"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88476219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:31:57 -0700
X-CSE-ConnectionGUID: rSrJIvbvQc+OFR4GHXfDfw==
X-CSE-MsgGUID: X5q03WtqSrWKVqMSBbVyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="272433860"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:31:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 10:31:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 10:31:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 10:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHiXJJlOpsj+KrcU20VU9TvJaQjNsY3ZdHmD9jwcw9JdCSf7EQUYMAKMz0ue80eVZ/ab6s2dcOzsthcLkNGe9hiAsj3t7wQ4cVxtcxly+BpbgATwu75xz8NDTRET7sxtHJOd3GFTl47NdXl2MxrIVqXleYW/R4TgEXCGov4Qj8LlsSpn7UsMO91ZVgPSWJ0yn38AT4hlgljAW9JYeDFg3RYhT/3Xvj3D+BBZJCR3DDgL+j7JkB8vGPbJ8xbL7NhozbZGYzIk9hrnM5hsslt9/Zn9Cc60ujbJqQnAn21AH1nm+iUYbmMMTy62ggoH7d5treFkUaV/o+GMB6pte9iULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2qBJzdukeBMbtrHXHWMBiVZnhSD5Fm+CueemgB6c1A=;
 b=XPuhfkLTvBN7VesDZbLy2+JWOdhOAw1GFPdbVpjl+5PPHep7pstu42cOYHERwqaiZfo2LyM4bm132xDN2H45XGBntunSEeV4omdWTBLrXY6O/qjrWNFvL4chy6KS+kIaqEXFZXdjDAB6jR+W9yMYizfyQ4g6J1cis7voIExBLmBFwX9Ex+6FTnUX2l7D1bsCzgwTBrotIwoa/SwcYc6zp5H0TEcUkK3W8B3M0OtqXAkaic5o1VoUCc8DWgZJvwwzWnxQQbSni1Lo+zK/Up2vuHWiFNKbWRtl2XtYh3+lKjbR9wVpT6N1agtIIqC34D+OpDSRCCe+UxuFp8GWF+NX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 17:31:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 17:31:53 +0000
Date: Fri, 28 Aug 2026 10:31:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, 
 "Brost, Matthew" <matthew.brost@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 05/10] drm/xe: Move debug configfs entries to
 xe_configfs_debug.c
Message-ID: <20260828173151.GE422236@mdroper-desk1.amr.corp.intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-17-stuart.summers@intel.com>
 <20260821221838.GH681121@mdroper-desk1.amr.corp.intel.com>
 <2c3c62987d33808c4a37376cc53472ccdfbe0b2e.camel@intel.com>
 <ao9YqO-G7cwCbCFL@intel.com>
 <2e4a2074d202c3f833cff188adc7bdc0377fa429.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e4a2074d202c3f833cff188adc7bdc0377fa429.camel@intel.com>
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a990ed2-0012-4fec-dce9-08df052a4039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|6133799003|11063799006|56012099006|18002099003|5023799004|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 0gOTbH/oHsIOvmNjTvXSTc3XezBWob64O23lL/Jj8qePvmqwwH1OdCv4QBbw8FZoQQgOF4JUZF0sMrHo/vsXO+fCPklkKCeUT2XTHb3NVJITo9l3QOcvONrTW0mG/3qT/mzuBueWZRUkvVTZ7nlabPNkU1oq1gDByg2ETkD9dsbGTD4G2oAdnUOeIyVOrIugRiQCeGIp8Fp7P6g4Jmvhhkh5bwrNeio3dxkHuoZ0x6NEVeduPbP3rEpk9JTJjXPVd5nYYBjuvJweiGQ4my6eqMSuVDMVNQwIxGlV1sRJ+SSsTDwrAewGam7xNo0ZAAlcVzi2FL8IXzozD41B/HoXVluXisnjiGUlMx0ye/IFb7s2r7WZD37K8Bidb6PqyMjDMkYaXiQ4Y1WjDdfFF6EzihAxfqGSTaZWQfofpKfpCnPM+zoqae+hLimzjyyz7uMWkKkLdigMB+phd1vINtb8ocphsVLzbnIMr6dJCNvCf2JcTVcACO+oKiZZg1tpbe5IlOciKMlL3Lm0Yfzh6+yt9uOQQfF06RNnp2SlHRR5Yz2fraQfyGT/cmX2TduIBMHOuuebg7miR+0OYW7HPtErJxqtk36ML6RHKeqQA8673MSDhBccsYwazbg5RURXOEtJI8AiuyyJa7oDX01Iu1NcSXXGfm1YU+xsYy4ElhXm5PE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003)(5023799004)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0Q3WWdGQVV6dkViandJQzI2VnJueUFONFJkR3RNb0NtdDg4eUxrRmd3YkdI?=
 =?utf-8?B?bHFwQkh2dmpQblV3Nk40bUNGazMwNmg3Q3EvK29TT3Y5NkVvTnE5ZmVqbXBm?=
 =?utf-8?B?dTR0bTE5c0hhWnlBQXJuUWcrOU1qM3FCMlIwVGd2eHVrUXZHMVlXWmRhM3Ri?=
 =?utf-8?B?WWxkSzR4Nm9CR1YrQklHWnFYNkZUclg1WDQraldYeXc4Qys0MHJhMFM1bzBC?=
 =?utf-8?B?YkJPY01aVUJsc2dmN1R2dk9PdDBaK1ZQMHdISHBJQU1hdWtPbFg5Y3g5NVdP?=
 =?utf-8?B?QVNqQ0Z2WUhMTS9Scmw5bDROcUZWYitrWDkwMmVPUzgwaTlvMFJVV0czeTkx?=
 =?utf-8?B?YnR3anZzZG10ajNZTWl0WTBvVnN2emtCbG5hTXVCMmxYcDM1SDJMa2pjVzdn?=
 =?utf-8?B?S25NK2dNRFVWK281bDQ1NlE3MlI5Z3hXQTVEdmE0TzVTVkZ6ZDg3NFIzNFQ2?=
 =?utf-8?B?b3FWV0R0MlRvbDV4NUpRZUhEOTI0K2YrMDBNYUFORnJMYklid1J1NVhuTUNk?=
 =?utf-8?B?dlJXWk5CS1dWdVBCVFZsWkU0bEZYZzRsQzE3WHBXZHcwRnBHOVJqdlA4QjBi?=
 =?utf-8?B?VU9kU1REbW1HNWhJZ1N0VUF4d0ZleUJ5UGh6RkdKeDNzRkZuNXpSMUEwRnpQ?=
 =?utf-8?B?SmRtTE0xYWVWSFBuUTNDSXI3VlpabER5WWMrYkVqZzhwd0Y4TnVwaG1UMW9Z?=
 =?utf-8?B?bmloYy9PQjEvZDhCWU9tVmRvdTFpblFSNWVldFg1TmhnQ1lSRDcxSWVNbzZT?=
 =?utf-8?B?ZGFrMDdNa3daT1gxYlRVOTlZaXZISW1qZ1dNUC9iN1U2UFVDK1VxTFQ0eEdY?=
 =?utf-8?B?ai9hR1hWYTlZZGJ5a2NmeWJrRGozSWw4by9pVm9mN1pqQU1aTVE3My9vNitw?=
 =?utf-8?B?eEYrcVYyRzdQUlJPWnFHaGIxNkN4MHlOTE50Sy82MmlqSXBDN2dPSGErcFc0?=
 =?utf-8?B?akNuaE5YNmxWWDFRR05Pb0NKbkllVnFCSHhEc2FjYnRQNjdYb0Rnb09TNXM1?=
 =?utf-8?B?UlQ5UEE2Mm5JTHJsQkFTNlBybmpHY1VNdkNTVXpOMmsrT2pETnVxZndoSWdL?=
 =?utf-8?B?TmhqazFXeEFHbFdFV08veGpzRnJlTFJvVWpIc1dIbEtIRmt0ZEhDTnBVdThY?=
 =?utf-8?B?ZzRSZGxhNGQ3Z1ZKUE1RZVZlQ1c3WU5DVFZyUUpFUlBjRmlsRkxXUC9HRXpL?=
 =?utf-8?B?UzBQRGpSek1naUFXK0tIdmhZT241WmVjSDFiN3VjTk9BYVhPYkU1Uit4TGV5?=
 =?utf-8?B?REw4N1BLcmRoR1l2OWUxV3JVdTJMNTVWSzBaU1o2eFUrbzNwUFlxaVpUVmRL?=
 =?utf-8?B?Z3lmSVhZL0tJc3BDWmV6VDY3MUhNaUdhUmxlY3g1UXhqNHpBdzVnWnRYSzQx?=
 =?utf-8?B?UWk3NlFCTmVlT1dzN3RVdFRBanVvTHFWeDN0MWNJR1VkUkVtb01rSUlOcWc5?=
 =?utf-8?B?R0dva2g5Zk5zMkZwcE8wdjJIWHM3YUhjQWJXV1pNdVVCa3FVempLejZkYUFw?=
 =?utf-8?B?NU5BRDc4TXRIdXA4TVNpMlRtV0cwaG1xTUQrZndaQ29KZmVKYVNFdm1WUDVE?=
 =?utf-8?B?QytGODNNb3I5ZjlDcy9jdmJSNTk4N21FbVBEbjRGZklHck1saUtQZGhIanU1?=
 =?utf-8?B?M3I3TzZERWh4QWtEbWN0QjJIaEtUdUNSenl5TWxQcElWdFRTR2ZXUnIrTUpw?=
 =?utf-8?B?VUhoNW5kUm5hYU5TL3RHMVZJT09oT2pxTGlpN3RxQ3VDb01qcnpEcTR5cTRG?=
 =?utf-8?B?c1pSWkRRa3VWWmpkS1Z2WlVzcGc3OTNyS0lQU0NGV2I1b0g1Zlk0NTl0ejBH?=
 =?utf-8?B?WWlDRS9wd0cyWXQzYjd1VVJFZExseFRjUG5NdG9PaE45Nk1uVWlISWpYNmQ1?=
 =?utf-8?B?Z2U1eEg2L015aExhajdjNkMyQUd1ajV6aHE1QUJENTZtUSs2TnU5N3JzUncr?=
 =?utf-8?B?OHZlcEVVbUVCRDMwcTkzenNEbHllZXptS2tGUmZ3WE1weVFiNzRGeWlPbVNF?=
 =?utf-8?B?NUtsemRCZXNJZ3JYS1Uxb3dtU0prb2ZaUXJrdDI2ZHZpWHZvQnlldXM3dmpV?=
 =?utf-8?B?czMxYmJCN1NWMCtRWmVOU3p1WTZaeVJvZ3NXTzVwZWZGa3BVUnprZnpNT2Fu?=
 =?utf-8?B?MUNOWDBNZ1lHSGEvaVVmemsxSWJCK2x5czNlSkpSVUdDZHMwSWE4RzNZMWVp?=
 =?utf-8?B?UTBXSlp1K2c1YU5rNWM5OTFrZHIxcmtJTTFDck0xTldhQ1JUSFd1Slc4ZjFw?=
 =?utf-8?B?YWxRMEFqeDlid1hWREU5OXNpSGp6djVJSlduNWlQUys0RXJUaWhhSXNPWUtn?=
 =?utf-8?B?U0YrNVFMNmV0SGtvakhsSmtKVXFPeFI4SWlibHRsWElDOVQvL1FDMEtUeDRq?=
 =?utf-8?Q?4lAcZX8WnlGhev7U=3D?=
X-Exchange-RoutingPolicyChecked: 4w5gByVvlfT3dkBhFZjP8Eh7GLlY3/IaLHaYebd923Oo035sqUTPFIgfCpD7mLiNiNCB8KUoBnrKcCxS1fy/dVn0cy+wCh53Sfhm1rIOHOMzyk2OILRZ3dDu5loUwx5rk24MIzjB0lgBBxkisYT8kUvNEh4L4KHO7kQXu9rB9hML3gdP09IDeAURmC/uIMdBdP0OplKeei5zqKWC/FRR482ag/niXNjBJVp1ww9OTkcfOADQ5AQJY025oYfcdVorep7rb2xMvs82hBmPf+SFOisHyPeHzbtFE6AAbG2zk+KLySt872xg131I6XQDixk+S4RgL+zkWa/HSIVkIqNltw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a990ed2-0012-4fec-dce9-08df052a4039
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 17:31:53.7018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FA69zK8WLOZZgJgDUpizRU6L1ljAL0HX/4xLkfQXOvBEV/s6r10mhsBuDqC+U2zLYQrzR//ZokqH/eY4KpmQzp/iZSa4t/2Z1jiUjNm3+tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
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

On Fri, Aug 28, 2026 at 09:34:48AM -0700, Summers, Stuart wrote:
> On Wed, 2026-08-26 at 17:20 -0400, Rodrigo Vivi wrote:
> > On Mon, Aug 24, 2026 at 08:28:59PM +0000, Summers, Stuart wrote:
> > > On Fri, 2026-08-21 at 15:18 -0700, Matt Roper wrote:
> > > > On Thu, Aug 20, 2026 at 09:06:44PM +0000, Stuart Summers wrote:
> > > > > Move the debug specific configfs attributes into the new
> > > > > xe_configfs_debug.c file under a new debug configfs
> > > > > subdirectory.
> > > > > Ensure these are wrapped in CONFIG_DRM_XE_DEBUG to allow finer
> > > > > grained
> > > > > debug changes outside of more ABI specific configfs entries.
> > > > > 
> > > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > > Assisted-by: Copilot:claude-sonnet-4.6,claude-sonnet-5,claude-
> > > > > opus-
> > > > > 5
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_configfs.c           | 991 ++-----------
> > > > > ----
> > > > > ----
> > > > >  drivers/gpu/drm/xe/xe_configfs.h           |  88 +-
> > > > >  drivers/gpu/drm/xe/xe_configfs_debug.c     | 956
> > > > > ++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_configfs_debug.h     |  39 +-
> > > > >  drivers/gpu/drm/xe/xe_configfs_types.h     |  18 +-
> > > > >  drivers/gpu/drm/xe/xe_guc.c                |   1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_ads.c            |   1 +
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.c          |   1 +
> > > > >  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
> > > > >  drivers/gpu/drm/xe/xe_pci.c                |   1 +
> > > > >  drivers/gpu/drm/xe/xe_psmi.c               |   1 +
> > > > >  drivers/gpu/drm/xe/xe_rtp.c                |   1 +
> > > > >  drivers/gpu/drm/xe/xe_survivability_mode.c |   1 +
> > > > >  13 files changed, 1134 insertions(+), 966 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > index 33aea1150c86..111aacce8a84 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > @@ -6,17 +6,14 @@
> > > > >  #include <linux/bitops.h>
> > > > >  #include <linux/configfs.h>
> > > > >  #include <linux/cleanup.h>
> > > > > -#include <linux/find.h>
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/pci.h>
> > > > >  #include <linux/string.h>
> > > > >  
> > > > > -#include "instructions/xe_mi_commands.h"
> > > > >  #include "xe_configfs.h"
> > > > >  #include "xe_configfs_debug.h"
> > > > >  #include "xe_defaults.h"
> > > > > -#include "xe_gt_types.h"
> > > > >  #include "xe_module.h"
> > > > >  
> > > > >  /**
> > > > > @@ -50,16 +47,9 @@
> > > > >   *
> > > > >   *     /sys/kernel/config/xe/
> > > > >   *     ├── 0000:00:02.0
> > > > > - *     │   └── ...
> > > > > - *     ├── 0000:00:02.1
> > > > > - *     │   └── ...
> > > > > - *     :
> > > > > - *     └── 0000:03:00.0
> > > > > - *         ├── engines_allowed
> > > > > - *         ├── gt_types_allowed
> > > > > - *         ├── enable_multi_queue
> > > > > - *         ├── enable_psmi
> > > > > - *         └── survivability_mode
> > > > > + *     │   └── ...
> > > > > + *     └── 0000:00:02.1
> > > > > + *         └── ...
> > > > >   *
> > > > >   * After configuring the attributes as per next section, the
> > > > > device can be
> > > > >   * probed with::
> > > > > @@ -71,157 +61,6 @@
> > > > >   * Configure Attributes
> > > > >   * ====================
> > > > >   *
> > > > > -
> > > > > - * Context restore BB
> > > > > - * ------------------
> > > > > - *
> > > > > - * Allow to execute a batch buffer during any context
> > > > > switches.
> > > > > When the
> > > > > - * GPU is restoring the context, it executes additional
> > > > > commands.
> > > > > It's useful
> > > > > - * for testing additional workarounds and validating certain
> > > > > HW
> > > > > behaviors: it's
> > > > > - * not intended for normal execution and will taint the kernel
> > > > > with TAINT_TEST
> > > > > - * when used.
> > > > > - *
> > > > > - * The syntax allows to pass straight instructions to be
> > > > > executed
> > > > > by the engine
> > > > > - * in a batch buffer or set specific registers.
> > > > > - *
> > > > > - * #. Generic instruction::
> > > > > - *
> > > > > - *     <engine-class> cmd <instr> [[dword0] [dword1] [...]]
> > > > > - *
> > > > > - * #. Simple register setting::
> > > > > - *
> > > > > - *     <engine-class> reg <address> <value>
> > > > > - *
> > > > > - * Commands are saved per engine class: all instances of that
> > > > > class will execute
> > > > > - * those commands during context switch. The instruction,
> > > > > dword
> > > > > arguments,
> > > > > - * addresses and values are in hex format like in the examples
> > > > > below.
> > > > > - *
> > > > > - * #. Execute a LRI command to write 0xDEADBEEF to register
> > > > > 0x4f10
> > > > > after the
> > > > > - *    normal context restore::
> > > > > - *
> > > > > - *     # echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> > > > > - *             >
> > > > > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> > > > > - *
> > > > > - * #. Execute a LRI command to write 0xDEADBEEF to register
> > > > > 0x4f10
> > > > > at the
> > > > > - *    beginning of the context restore::
> > > > > - *
> > > > > - *     # echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> > > > > - *             >
> > > > > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> > > > > -
> > > > > - * #. Load certain values in a couple of registers (it can be
> > > > > used
> > > > > as a simpler
> > > > > - *    alternative to the `cmd`) action::
> > > > > - *
> > > > > - *     # cat >
> > > > > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> > > > > - *     rcs reg 4F100 DEADBEEF
> > > > > - *     rcs reg 4F104 FFFFFFFF
> > > > > - *     EOF
> > > > > - *
> > > > > - *    .. note::
> > > > > - *
> > > > > - *       When using multiple lines, make sure to use a command
> > > > > that is
> > > > > - *       implemented with a single write syscall, like
> > > > > HEREDOC.
> > > > > - *
> > > > > - * Currently this is implemented only for post and mid context
> > > > > restore and
> > > > > - * these attributes can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > > - * Allowed engines:
> > > > > - * ----------------
> > > > > - *
> > > > > - * Allow only a set of engine(s) to be available, disabling
> > > > > the
> > > > > other engines
> > > > > - * even if they are available in hardware. This is applied
> > > > > after
> > > > > HW fuses are
> > > > > - * considered on each tile. Examples:
> > > > > - *
> > > > > - * Allow only one render and one copy engines, nothing else::
> > > > > - *
> > > > > - *     # echo 'rcs0,bcs0' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> > > > > - *
> > > > > - * Allow only compute engines and first copy engine::
> > > > > - *
> > > > > - *     # echo 'ccs*,bcs0' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> > > > > - *
> > > > > - * Note that the engine names are the per-GT hardware names.
> > > > > On
> > > > > multi-tile
> > > > > - * platforms, writing ``rcs0,bcs0`` to this file would allow
> > > > > the
> > > > > first render
> > > > > - * and copy engines on each tile.
> > > > > - *
> > > > > - * The requested configuration may not be supported by the
> > > > > platform and driver
> > > > > - * may fail to probe. For example: if at least one copy engine
> > > > > is
> > > > > expected to be
> > > > > - * available for migrations, but it's disabled. This is
> > > > > intended
> > > > > for debugging
> > > > > - * purposes only.
> > > > > - *
> > > > > - * This attribute can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > > - * Allowed GT types:
> > > > > - * -----------------
> > > > > - *
> > > > > - * Allow only specific types of GTs to be detected and
> > > > > initialized
> > > > > by the
> > > > > - * driver.  Any combination of GT types can be
> > > > > enabled/disabled,
> > > > > although
> > > > > - * some settings will cause the device to fail to probe.
> > > > > - *
> > > > > - * Writes support both comma- and newline-separated input
> > > > > format.
> > > > > Reads
> > > > > - * will always return one GT type per line. "primary" and
> > > > > "media"
> > > > > are the
> > > > > - * GT type names supported by this interface.
> > > > > - *
> > > > > - * This attribute can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > > - * Examples:
> > > > > - *
> > > > > - * Allow both primary and media GTs to be initialized and
> > > > > used. 
> > > > > This matches
> > > > > - * the driver's default behavior::
> > > > > - *
> > > > > - *     # echo 'primary,media' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > > > > - *
> > > > > - * Allow only the primary GT of each tile to be initialized
> > > > > and
> > > > > used,
> > > > > - * effectively disabling the media GT if it exists on the
> > > > > platform::
> > > > > - *
> > > > > - *     # echo 'primary' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > > > > - *
> > > > > - * Allow only the media GT of each tile to be initialized and
> > > > > used,
> > > > > - * effectively disabling the primary GT.  **This configuration
> > > > > will cause
> > > > > - * device probe failure on all current platforms, but may be
> > > > > allowed on
> > > > > - * igpu platforms in the future**::
> > > > > - *
> > > > > - *     # echo 'media' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > > > > - *
> > > > > - * Disable all GTs.  Only other GPU IP (such as display) is
> > > > > potentially usable.
> > > > > - * **This configuration will cause device probe failure on all
> > > > > current
> > > > > - * platforms, but may be allowed on igpu platforms in the
> > > > > future**::
> > > > > - *
> > > > > - *     # echo '' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > > > > - *
> > > > > - * Enable multi-queue
> > > > > - * ------------------
> > > > > - *
> > > > > - * Multi-queue support on the device is enabled by default
> > > > > where
> > > > > the
> > > > > - * hardware supports it. Writing 0 force-disables multi-queue
> > > > > support:
> > > > > - * multi-queue exec-queue group creation via ioctl is refused,
> > > > > and
> > > > > the
> > > > > - * GuC feature is disabled::
> > > > > - *
> > > > > - *     # echo 0 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
> > > > > - *
> > > > > - * This attribute can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > > - * PSMI
> > > > > - * ----
> > > > > - *
> > > > > - * Enable extra debugging capabilities to trace engine
> > > > > execution.
> > > > > Only useful
> > > > > - * during early platform enabling and requires additional
> > > > > hardware
> > > > > connected.
> > > > > - * Once it's enabled, additionals WAs are added and runtime
> > > > > configuration is
> > > > > - * done via debugfs. Example to enable it::
> > > > > - *
> > > > > - *     # echo 1 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> > > > > - *
> > > > > - * This attribute can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > > - * Survivability mode:
> > > > > - * -------------------
> > > > > - *
> > > > > - * Enable survivability mode on supported cards. This setting
> > > > > only
> > > > > takes
> > > > > - * effect when probing the device. Example to enable it::
> > > > 
> > > > I didn't review the code movement in this patch in depth, but the
> > > > one
> > > > thing that I'm uncertain about is whether survivability mode
> > > > should
> > > > have
> > > > been swept up in this move.  My understanding is that unlike the
> > > > other
> > > > options which are meant for developers hacking on the driver,
> > > > configurable survivability mode is a true production feature
> > > > intended
> > > > for end users to get the minimal driver support necessary to deal
> > > > with a
> > > > bad firmware flash, failing hardware, etc.  I know there are
> > > > cases
> > > > where
> > > > the driver can auto-detect the need to enter survivability mode
> > > > without
> > > > the configfs interface (i.e., various RAS error reports and
> > > > such),
> > > > but I
> > > > thought manual entry through configfs was still something users
> > > > may
> > > > need
> > > > in some cases?  If so that would mean we should keep this
> > > > available
> > > > even
> > > > when the debug options aren't compiled in.
> > > > 
> > > > +Cc Riana in case my understanding is off.
> > > 
> > > Yeah would appreciate feedback there Riana. My understanding of
> > > survivability mode is we want this to allow us to continue
> > > operation
> > > for a while to debug issues when the hardware is severely
> > > misbehaving.
> > > This isn't a normal customer use case.
> > 
> > I'm not Riana, but I can answer to this! :)
> > 
> > Survivability is needed in final production builds.
> > 
> > We had cases in the field where any kind of probe (succeeded, failed,
> > not-attempted) would put the device in a state where FW could not be
> > flashed.
> > 
> > So this fallback option where user selects survivability and get a
> > minimal
> > probe where FW can be flashed is needed.
> 
> So I get the reasoning there. Why can't we do this as part of a debug
> build though? If we get to a point where the IFWI is in such a bad
> state that it can brick the card, this really is a debug scenario
> anyway IMO. Or is this more about orchestration and auto-update
> capability that we want for a normal data center user?

No, this is for end-user production settings.  For example a random home
user flashing the latest firmware onto their gaming card who gets hit
with a power outage in the middle and winds up with the GPU in a bricked
state.  After that they can still use configfs to put the device into
survivability mode and use the appropriate tools to recover the device
and re-flash the firmware properly.  That user is likely using whatever
production kernel came with their distro and may not have the knowledge
or desire to re-build a debug kernel to fix the system.  They're not
trying to debug anything and want the recovery process to be as quick
and simple as possible.

In a datacenter settings it's probably even more critical to not require
a debug kernel.  If a host containing lots of GPUs has one single GPU
get bricked, they don't want to take down the entire system (including
all the other GPUs that are functioning fine) and reboot into a debug
kernel to reflash/recover that one GPU.  They want to be able to just
bind that single device in recovery mode, do whatever is necessary to
recovery it, and then re-bind the device normally without interfering
with all the other work happening on the system.

> 
> > 
> > Also, another possible usage of this is around upcoming in-field test
> > and in field repair cases.
> > 
> > So, survivability is one... But also I'm thinking about others as
> > well in here.
> > PSMI for instance, are we sure that PSMI folks don't plug PSMI in
> > production
> > builds at all when debugging some images that they cannot control?
> 
> Again, IMO it is perfectly reasonable to expect someone using PSMI to
> be also using a debug kernel. We will almost certainly want to have the
> extra debug capability on the kernel side as well as the hardware side
> in these types of debugs.

PSMI can never be used in production; it's fused off on all external,
production hardware, so it can only ever be used on pre-production
hardware that never leaves Intel.  So PSMI definitely makes sense to
keep in the 'debug' bucket in my opinion.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > > 
> > > My thought longer term here is we'd turn this into a bit map that
> > > allowed various hardware or software isolation configurations.
> > > We'll
> > > also have the per-feature configfs entries, but the survivability
> > > mode
> > > could be used to easily isolate based on a higher level isolation
> > > scheme that doesn't require the person debugging to fully
> > > understand
> > > all the different underlying features being disabled if that makes
> > > sense.
> > > 
> > > The flip side of this could be that we really want to require users
> > > to
> > > be more surgical about how they enable/disable different features.
> > > In
> > > that case, I'd argue we really should drop survivability mode
> > > completely and turn it into an "enable_punit" and various other
> > > related
> > > configurations.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > > - *
> > > > > - *     # echo 1 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> > > > > - *
> > > > > - * This attribute can only be set before binding to the
> > > > > device.
> > > > > - *
> > > > >   * Max SR-IOV Virtual Functions
> > > > >   * ----------------------------
> > > > >   *
> > > > > @@ -256,12 +95,16 @@
> > > > >   *     # rmdir /sys/kernel/config/xe/0000:03:00.0/
> > > > >   */
> > > > >  
> > > > > -static const struct xe_config_device device_defaults = {
> > > > > -       .engines_allowed = U64_MAX,
> > > > > -       .gt_types_allowed = U64_MAX,
> > > > > -       .enable_multi_queue = true,
> > > > > -       .enable_psmi = false,
> > > > > -       .survivability_mode = false,
> > > > > +const struct xe_config_device xe_configfs_device_defaults = {
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +       .debug = {
> > > > > +               .engines_allowed = U64_MAX,
> > > > > +               .gt_types_allowed = U64_MAX,
> > > > > +               .enable_multi_queue = true,
> > > > > +               .enable_psmi = false,
> > > > > +               .survivability_mode = false,
> > > > > +       },
> > > > > +#endif
> > > > >         .sriov = {
> > > > >                 .max_vfs = XE_DEFAULT_MAX_VFS,
> > > > >                 .admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> > > > > @@ -270,50 +113,22 @@ static const struct xe_config_device
> > > > > device_defaults = {
> > > > >  
> > > > >  static void set_device_defaults(struct xe_config_device
> > > > > *config)
> > > > >  {
> > > > > -       *config = device_defaults;
> > > > > +       *config = xe_configfs_device_defaults;
> > > > >  #ifdef CONFIG_PCI_IOV
> > > > >         config->sriov.max_vfs = xe_modparam.max_vfs;
> > > > >  #endif
> > > > >  }
> > > > >  
> > > > > -struct engine_info {
> > > > > -       const char *cls;
> > > > > -       u64 mask;
> > > > > -       enum xe_engine_class engine_class;
> > > > > -};
> > > > > -
> > > > > -/* Some helpful macros to aid on the sizing of buffer
> > > > > allocation
> > > > > when parsing */
> > > > > -#define MAX_ENGINE_CLASS_CHARS 5
> > > > > -#define MAX_ENGINE_INSTANCE_CHARS 2
> > > > > -
> > > > > -static const struct engine_info engine_info[] = {
> > > > > -       { .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_RENDER },
> > > > > -       { .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_COPY },
> > > > > -       { .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> > > > > -       { .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
> > > > > -       { .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_COMPUTE },
> > > > > -       { .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_OTHER },
> > > > > -};
> > > > > -
> > > > > -static const struct {
> > > > > -       const char *name;
> > > > > -       enum xe_gt_type type;
> > > > > -} gt_types[] = {
> > > > > -       { .name = "primary", .type = XE_GT_TYPE_MAIN },
> > > > > -       { .name = "media", .type = XE_GT_TYPE_MEDIA },
> > > > > -};
> > > > > -
> > > > > -static struct xe_config_group_device
> > > > > *to_xe_config_group_device(struct config_item *item)
> > > > > -{
> > > > > -       return container_of(to_config_group(item), struct
> > > > > xe_config_group_device, group);
> > > > > -}
> > > > > -
> > > > > -static struct xe_config_device *to_xe_config_device(struct
> > > > > config_item *item)
> > > > > -{
> > > > > -       return &to_xe_config_group_device(item)->config;
> > > > > -}
> > > > > -
> > > > > -static bool is_bound(struct xe_config_group_device *dev)
> > > > > +/**
> > > > > + * xe_configfs_is_bound - check whether the matching pci
> > > > > device is
> > > > > bound
> > > > > + * @dev: configfs group device
> > > > > + *
> > > > > + * Caller must hold @dev->lock.
> > > > > + *
> > > > > + * Return: true if the matching pci_dev is already bound to a
> > > > > driver,
> > > > > + *     false otherwise.
> > > > > + */
> > > > > +bool xe_configfs_is_bound(struct xe_config_group_device *dev)
> > > > >  {
> > > > >         unsigned int domain, bus, slot, function;
> > > > >         struct pci_dev *pdev;
> > > > > @@ -338,698 +153,13 @@ static bool is_bound(struct
> > > > > xe_config_group_device *dev)
> > > > >         return ret;
> > > > >  }
> > > > >  
> > > > > -static struct xe_config_group_device
> > > > > *find_xe_config_group_device(struct pci_dev *pdev);
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_ctx_restore_mid_bb - get configfs
> > > > > ctx_restore_mid_bb setting
> > > > > - * @pdev: pci device
> > > > > - * @class: hw engine class
> > > > > - * @cs: pointer to the bb to use - only valid during probe
> > > > > - *
> > > > > - * Return: Number of dwords used in the mid_ctx_restore
> > > > > setting in
> > > > > configfs
> > > > > - */
> > > > > -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > > > -                                      enum xe_engine_class
> > > > > class,
> > > > > -                                      const u32 **cs)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       u32 len;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return 0;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock) {
> > > > > -               if (cs)
> > > > > -                       *cs = dev-
> > > > > > config.ctx_restore_mid_bb[class].cs;
> > > > > -
> > > > > -               len = dev-
> > > > > >config.ctx_restore_mid_bb[class].len;
> > > > > -       }
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_ctx_restore_post_bb - get configfs
> > > > > ctx_restore_post_bb setting
> > > > > - * @pdev: pci device
> > > > > - * @class: hw engine class
> > > > > - * @cs: pointer to the bb to use - only valid during probe
> > > > > - *
> > > > > - * Return: Number of dwords used in the post_ctx_restore
> > > > > setting
> > > > > in configfs
> > > > > - */
> > > > > -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > > > -                                       enum xe_engine_class
> > > > > class,
> > > > > -                                       const u32 **cs)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       u32 len;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return 0;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock) {
> > > > > -               *cs = dev-
> > > > > >config.ctx_restore_post_bb[class].cs;
> > > > > -               len = dev-
> > > > > >config.ctx_restore_post_bb[class].len;
> > > > > -       }
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -static bool wa_bb_read_advance(bool dereference, char **p,
> > > > > -                              const char *append, size_t len,
> > > > > -                              size_t *max_size)
> > > > > -{
> > > > > -       if (dereference) {
> > > > > -               if (len >= *max_size)
> > > > > -                       return false;
> > > > > -               *max_size -= len;
> > > > > -               if (append)
> > > > > -                       memcpy(*p, append, len);
> > > > > -       }
> > > > > -
> > > > > -       *p += len;
> > > > > -
> > > > > -       return true;
> > > > > -}
> > > > > -
> > > > > -static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> > > > > -                         struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX],
> > > > > -                         char *data, size_t sz)
> > > > > -{
> > > > > -       char *p = data;
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -
> > > > > -       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > -               enum xe_engine_class ec =
> > > > > engine_info[i].engine_class;
> > > > > -               size_t len;
> > > > > -
> > > > > -               if (!wa_bb[ec].len)
> > > > > -                       continue;
> > > > > -
> > > > > -               len = snprintf(p, sz, "%s:",
> > > > > engine_info[i].cls);
> > > > > -               if (!wa_bb_read_advance(data, &p, NULL, len,
> > > > > &sz))
> > > > > -                       return -ENOBUFS;
> > > > > -
> > > > > -               for (size_t j = 0; j < wa_bb[ec].len; j++) {
> > > > > -                       len = snprintf(p, sz, " %08x",
> > > > > wa_bb[ec].cs[j]);
> > > > > -                       if (!wa_bb_read_advance(data, &p, NULL,
> > > > > len, &sz))
> > > > > -                               return -ENOBUFS;
> > > > > -               }
> > > > > -
> > > > > -               if (!wa_bb_read_advance(data, &p, "\n", 1,
> > > > > &sz))
> > > > > -                       return -ENOBUFS;
> > > > > -       }
> > > > > -
> > > > > -       if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> > > > > -               return -ENOBUFS;
> > > > > -
> > > > > -       /* Reserve one more to match check for '\0' */
> > > > > -       if (!data)
> > > > > -               p++;
> > > > > -
> > > > > -       return p - data;
> > > > > -}
> > > > > -
> > > > > -static ssize_t ctx_restore_mid_bb_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -
> > > > > -       return wa_bb_show(dev, dev->config.ctx_restore_mid_bb,
> > > > > page, SZ_4K);
> > > > > -}
> > > > > -
> > > > > -static ssize_t ctx_restore_post_bb_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -
> > > > > -       return wa_bb_show(dev, dev->config.ctx_restore_post_bb,
> > > > > page, SZ_4K);
> > > > > -}
> > > > > -
> > > > > -static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
> > > > > -{
> > > > > -       if (wa_bb->cs)
> > > > > -               wa_bb->cs[wa_bb->len] = val;
> > > > > -
> > > > > -       wa_bb->len++;
> > > > > -}
> > > > > -
> > > > > -static ssize_t parse_hex(const char *line, u32 *pval)
> > > > > -{
> > > > > -       char numstr[12];
> > > > > -       const char *p;
> > > > > -       ssize_t numlen;
> > > > > -
> > > > > -       p = line + strspn(line, " \t");
> > > > > -       if (!*p || *p == '\n')
> > > > > -               return 0;
> > > > > -
> > > > > -       numlen = strcspn(p, " \t\n");
> > > > > -       if (!numlen || numlen >= sizeof(numstr) - 1)
> > > > > -               return -EINVAL;
> > > > > -
> > > > > -       memcpy(numstr, p, numlen);
> > > > > -       numstr[numlen] = '\0';
> > > > > -       p += numlen;
> > > > > -
> > > > > -       if (kstrtou32(numstr, 16, pval))
> > > > > -               return -EINVAL;
> > > > > -
> > > > > -       return p - line;
> > > > > -}
> > > > > -
> > > > > -static int parse_engine(const char *s, const char *end_chars,
> > > > > u64
> > > > > *mask,
> > > > > -                       const struct engine_info **pinfo);
> > > > > -
> > > > > -/*
> > > > > - * Parse lines with the format
> > > > > - *
> > > > > - *     <engine-class> cmd <u32> <u32...>
> > > > > - *     <engine-class> reg <u32_addr> <u32_val>
> > > > > - *
> > > > > - * and optionally save them in @wa_bb[i].cs is non-NULL.
> > > > > - *
> > > > > - * Return the number of dwords parsed.
> > > > > - */
> > > > > -static ssize_t parse_wa_bb_lines(const char *lines,
> > > > > -                                struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX])
> > > > > -{
> > > > > -       ssize_t dwords = 0, ret;
> > > > > -       const char *p;
> > > > > -
> > > > > -       for (p = lines; *p; p++) {
> > > > > -               const struct engine_info *info = NULL;
> > > > > -               u32 val, val2;
> > > > > -
> > > > > -               /* Also allow empty lines */
> > > > > -               p += strspn(p, " \t\n");
> > > > > -               if (!*p)
> > > > > -                       break;
> > > > > -
> > > > > -               ret = parse_engine(p, " \t\n", NULL, &info);
> > > > > -               if (ret < 0)
> > > > > -                       return ret;
> > > > > -
> > > > > -               p += ret;
> > > > > -               p += strspn(p, " \t");
> > > > > -
> > > > > -               if (str_has_prefix(p, "cmd")) {
> > > > > -                       for (p += strlen("cmd"); *p;) {
> > > > > -                               ret = parse_hex(p, &val);
> > > > > -                               if (ret < 0)
> > > > > -                                       return -EINVAL;
> > > > > -                               if (!ret)
> > > > > -                                       break;
> > > > > -
> > > > > -                               p += ret;
> > > > > -                               dwords++;
> > > > > -                               wa_bb_append(&wa_bb[info-
> > > > > > engine_class], val);
> > > > > -                       }
> > > > > -               } else if (str_has_prefix(p, "reg")) {
> > > > > -                       p += strlen("reg");
> > > > > -                       ret = parse_hex(p, &val);
> > > > > -                       if (ret <= 0)
> > > > > -                               return -EINVAL;
> > > > > -
> > > > > -                       p += ret;
> > > > > -                       ret = parse_hex(p, &val2);
> > > > > -                       if (ret <= 0)
> > > > > -                               return -EINVAL;
> > > > > -
> > > > > -                       p += ret;
> > > > > -                       dwords += 3;
> > > > > -                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > -                                    MI_LOAD_REGISTER_IMM |
> > > > > MI_LRI_NUM_REGS(1));
> > > > > -                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > val);
> > > > > -                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > val2);
> > > > > -               } else {
> > > > > -                       return -EINVAL;
> > > > > -               }
> > > > > -       }
> > > > > -
> > > > > -       return dwords;
> > > > > -}
> > > > > -
> > > > > -static ssize_t wa_bb_store(struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX],
> > > > > -                          struct xe_config_group_device *dev,
> > > > > -                          const char *page, size_t len)
> > > > > -{
> > > > > -       /* tmp_wa_bb must match wa_bb's size */
> > > > > -       struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
> > > > > -       ssize_t count, class;
> > > > > -       u32 *tmp;
> > > > > -
> > > > > -       /* 1. Count dwords - wa_bb[i].cs is NULL for all
> > > > > classes */
> > > > > -       count = parse_wa_bb_lines(page, tmp_wa_bb);
> > > > > -       if (count < 0)
> > > > > -               return count;
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       /*
> > > > > -        * 2. Allocate a u32 array and set the pointers to the
> > > > > right positions
> > > > > -        * according to the length of each class' wa_bb
> > > > > -        */
> > > > > -       tmp = krealloc(wa_bb[0].cs, count * sizeof(u32),
> > > > > GFP_KERNEL);
> > > > > -       if (!tmp)
> > > > > -               return -ENOMEM;
> > > > > -
> > > > > -       if (!count) {
> > > > > -               memset(wa_bb, 0, sizeof(tmp_wa_bb));
> > > > > -               return len;
> > > > > -       }
> > > > > -
> > > > > -       for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX;
> > > > > ++class) {
> > > > > -               tmp_wa_bb[class].cs = tmp + count;
> > > > > -               count += tmp_wa_bb[class].len;
> > > > > -               tmp_wa_bb[class].len = 0;
> > > > > -       }
> > > > > -
> > > > > -       /* 3. Parse wa_bb lines again, this time saving the
> > > > > values
> > > > > */
> > > > > -       count = parse_wa_bb_lines(page, tmp_wa_bb);
> > > > > -       if (count < 0)
> > > > > -               return count;
> > > > > -
> > > > > -       memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -static ssize_t ctx_restore_mid_bb_store(struct config_item
> > > > > *item,
> > > > > -                                       const char *data,
> > > > > size_t
> > > > > sz)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -
> > > > > -       return wa_bb_store(dev->config.ctx_restore_mid_bb, dev,
> > > > > data, sz);
> > > > > -}
> > > > > -
> > > > > -static ssize_t ctx_restore_post_bb_store(struct config_item
> > > > > *item,
> > > > > -                                        const char *data,
> > > > > size_t
> > > > > sz)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -
> > > > > -       return wa_bb_store(dev->config.ctx_restore_post_bb,
> > > > > dev,
> > > > > data, sz);
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_engines_allowed - get engine allowed mask
> > > > > from
> > > > > configfs
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: engine mask with allowed engines set in configfs
> > > > > - */
> > > > > -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       u64 engines_allowed;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return device_defaults.engines_allowed;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock)
> > > > > -               engines_allowed = dev->config.engines_allowed;
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return engines_allowed;
> > > > > -}
> > > > > -
> > > > > -static ssize_t engines_allowed_show(struct config_item *item,
> > > > > char
> > > > > *page)
> > > > > -{
> > > > > -       struct xe_config_device *dev =
> > > > > to_xe_config_device(item);
> > > > > -       char *p = page;
> > > > > -
> > > > > -       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > -               u64 mask = engine_info[i].mask;
> > > > > -
> > > > > -               if ((dev->engines_allowed & mask) == mask) {
> > > > > -                       p += sprintf(p, "%s*\n",
> > > > > engine_info[i].cls);
> > > > > -               } else if (mask & dev->engines_allowed) {
> > > > > -                       u16 bit0 = __ffs64(mask), bit;
> > > > > -
> > > > > -                       mask &= dev->engines_allowed;
> > > > > -
> > > > > -                       for_each_set_bit(bit, (const unsigned
> > > > > long
> > > > > *)&mask, 64)
> > > > > -                               p += sprintf(p, "%s%u\n",
> > > > > engine_info[i].cls,
> > > > > -                                            bit - bit0);
> > > > > -               }
> > > > > -       }
> > > > > -
> > > > > -       return p - page;
> > > > > -}
> > > > > -
> > > > > -/*
> > > > > - * Lookup engine_info. If @mask is not NULL, reduce the mask
> > > > > according to the
> > > > > - * instance in @pattern.
> > > > > - *
> > > > > - * Examples of inputs:
> > > > > - * - lookup_engine_info("rcs0", &mask): return "rcs" entry
> > > > > from
> > > > > @engine_info and
> > > > > - *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> > > > > - * - lookup_engine_info("rcs*", &mask): return "rcs" entry
> > > > > from
> > > > > @engine_info and
> > > > > - *   mask == XE_HW_ENGINE_RCS_MASK
> > > > > - * - lookup_engine_info("rcs", NULL): return "rcs" entry from
> > > > > @engine_info
> > > > > - */
> > > > > -static const struct engine_info *lookup_engine_info(const char
> > > > > *pattern, u64 *mask)
> > > > > -{
> > > > > -       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > -               u8 instance;
> > > > > -               u16 bit;
> > > > > -
> > > > > -               if (!str_has_prefix(pattern,
> > > > > engine_info[i].cls))
> > > > > -                       continue;
> > > > > -
> > > > > -               pattern += strlen(engine_info[i].cls);
> > > > > -               if (!mask)
> > > > > -                       return *pattern ? NULL :
> > > > > &engine_info[i];
> > > > > -
> > > > > -               if (!strcmp(pattern, "*")) {
> > > > > -                       *mask = engine_info[i].mask;
> > > > > -                       return &engine_info[i];
> > > > > -               }
> > > > > -
> > > > > -               if (kstrtou8(pattern, 10, &instance))
> > > > > -                       return NULL;
> > > > > -
> > > > > -               bit = __ffs64(engine_info[i].mask) + instance;
> > > > > -               if (bit >= fls64(engine_info[i].mask))
> > > > > -                       return NULL;
> > > > > -
> > > > > -               *mask = BIT_ULL(bit);
> > > > > -               return &engine_info[i];
> > > > > -       }
> > > > > -
> > > > > -       return NULL;
> > > > > -}
> > > > > -
> > > > > -static int parse_engine(const char *s, const char *end_chars,
> > > > > u64
> > > > > *mask,
> > > > > -                       const struct engine_info **pinfo)
> > > > > -{
> > > > > -       char buf[MAX_ENGINE_CLASS_CHARS +
> > > > > MAX_ENGINE_INSTANCE_CHARS
> > > > > + 1];
> > > > > -       const struct engine_info *info;
> > > > > -       size_t len;
> > > > > -
> > > > > -       len = strcspn(s, end_chars);
> > > > > -       if (len >= sizeof(buf))
> > > > > -               return -EINVAL;
> > > > > -
> > > > > -       memcpy(buf, s, len);
> > > > > -       buf[len] = '\0';
> > > > > -
> > > > > -       info = lookup_engine_info(buf, mask);
> > > > > -       if (!info)
> > > > > -               return -ENOENT;
> > > > > -
> > > > > -       if (pinfo)
> > > > > -               *pinfo = info;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -static ssize_t engines_allowed_store(struct config_item *item,
> > > > > const char *page,
> > > > > -                                    size_t len)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -       ssize_t patternlen, p;
> > > > > -       u64 mask, val = 0;
> > > > > -
> > > > > -       for (p = 0; p < len; p += patternlen + 1) {
> > > > > -               patternlen = parse_engine(page + p, ",\n",
> > > > > &mask,
> > > > > NULL);
> > > > > -               if (patternlen < 0)
> > > > > -                       return -EINVAL;
> > > > > -
> > > > > -               val |= mask;
> > > > > -       }
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       dev->config.engines_allowed = val;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -static u64 get_gt_types_allowed(struct pci_dev *pdev)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       u64 mask;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return device_defaults.gt_types_allowed;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock)
> > > > > -               mask = dev->config.gt_types_allowed;
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return mask;
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_primary_gt_allowed - determine whether primary
> > > > > GTs
> > > > > are supported
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: True if primary GTs are enabled, false if they have
> > > > > been disabled via
> > > > > - *     configfs.
> > > > > - */
> > > > > -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> > > > > -{
> > > > > -       return get_gt_types_allowed(pdev) &
> > > > > BIT_ULL(XE_GT_TYPE_MAIN);
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_media_gt_allowed - determine whether media GTs
> > > > > are
> > > > > supported
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: True if the media GTs are enabled, false if they
> > > > > have
> > > > > been disabled
> > > > > - *     via configfs.
> > > > > - */
> > > > > -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> > > > > -{
> > > > > -       return get_gt_types_allowed(pdev) &
> > > > > BIT_ULL(XE_GT_TYPE_MEDIA);
> > > > > -}
> > > > > -
> > > > > -static ssize_t gt_types_allowed_show(struct config_item *item,
> > > > > char *page)
> > > > > -{
> > > > > -       struct xe_config_device *dev =
> > > > > to_xe_config_device(item);
> > > > > -       char *p = page;
> > > > > -
> > > > > -       for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> > > > > -               if (dev->gt_types_allowed &
> > > > > BIT_ULL(gt_types[i].type))
> > > > > -                       p += sprintf(p, "%s\n",
> > > > > gt_types[i].name);
> > > > > -
> > > > > -       return p - page;
> > > > > -}
> > > > > -
> > > > > -static ssize_t gt_types_allowed_store(struct config_item
> > > > > *item,
> > > > > const char *page,
> > > > > -                                     size_t len)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -       char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> > > > > -       char *p = buf;
> > > > > -       u64 typemask = 0;
> > > > > -
> > > > > -       if (!buf)
> > > > > -               return -ENOMEM;
> > > > > -
> > > > > -       while (p) {
> > > > > -               char *typename = strsep(&p, ",\n");
> > > > > -               bool matched = false;
> > > > > -
> > > > > -               if (typename[0] == '\0')
> > > > > -                       continue;
> > > > > -
> > > > > -               for (size_t i = 0; i < ARRAY_SIZE(gt_types);
> > > > > i++) {
> > > > > -                       if (strcmp(typename, gt_types[i].name)
> > > > > ==
> > > > > 0) {
> > > > > -                               typemask |=
> > > > > BIT(gt_types[i].type);
> > > > > -                               matched = true;
> > > > > -                               break;
> > > > > -                       }
> > > > > -               }
> > > > > -
> > > > > -               if (!matched)
> > > > > -                       return -EINVAL;
> > > > > -       }
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       dev->config.gt_types_allowed = typemask;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_enable_multi_queue - get configfs
> > > > > enable_multi_queue setting
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: true if multi-queue is enabled for this device (the
> > > > > default),
> > > > > - * false if it has been force-disabled via configfs.
> > > > > - */
> > > > > -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       bool ret;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return true;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock)
> > > > > -               ret = dev->config.enable_multi_queue;
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return ret;
> > > > > -}
> > > > > -
> > > > > -static ssize_t enable_multi_queue_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > -{
> > > > > -       struct xe_config_device *dev =
> > > > > to_xe_config_device(item);
> > > > > -
> > > > > -       return sprintf(page, "%d\n", dev->enable_multi_queue);
> > > > > -}
> > > > > -
> > > > > -static ssize_t enable_multi_queue_store(struct config_item
> > > > > *item,
> > > > > const char *page,
> > > > > -                                       size_t len)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -       bool val;
> > > > > -       int ret;
> > > > > -
> > > > > -       ret = kstrtobool(page, &val);
> > > > > -       if (ret)
> > > > > -               return ret;
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       dev->config.enable_multi_queue = val;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_psmi_enabled - get configfs enable_psmi
> > > > > setting
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: enable_psmi setting in configfs
> > > > > - */
> > > > > -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       bool ret;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return false;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock)
> > > > > -               ret = dev->config.enable_psmi;
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return ret;
> > > > > -}
> > > > > -
> > > > > -static ssize_t enable_psmi_show(struct config_item *item, char
> > > > > *page)
> > > > > -{
> > > > > -       struct xe_config_device *dev =
> > > > > to_xe_config_device(item);
> > > > > -
> > > > > -       return sprintf(page, "%d\n", dev->enable_psmi);
> > > > > -}
> > > > > -
> > > > > -static ssize_t enable_psmi_store(struct config_item *item,
> > > > > const
> > > > > char *page, size_t len)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -       bool val;
> > > > > -       int ret;
> > > > > -
> > > > > -       ret = kstrtobool(page, &val);
> > > > > -       if (ret)
> > > > > -               return ret;
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       dev->config.enable_psmi = val;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -/**
> > > > > - * xe_configfs_get_survivability_mode - get configfs
> > > > > survivability
> > > > > mode attribute
> > > > > - * @pdev: pci device
> > > > > - *
> > > > > - * Return: survivability_mode attribute in configfs
> > > > > - */
> > > > > -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > -       bool mode;
> > > > > -
> > > > > -       if (!dev)
> > > > > -               return device_defaults.survivability_mode;
> > > > > -
> > > > > -       scoped_guard(mutex, &dev->lock)
> > > > > -               mode = dev->config.survivability_mode;
> > > > > -       config_group_put(&dev->group);
> > > > > -
> > > > > -       return mode;
> > > > > -}
> > > > > -
> > > > > -static ssize_t survivability_mode_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > -{
> > > > > -       struct xe_config_device *dev =
> > > > > to_xe_config_device(item);
> > > > > -
> > > > > -       return sprintf(page, "%d\n", dev->survivability_mode);
> > > > > -}
> > > > > -
> > > > > -static ssize_t survivability_mode_store(struct config_item
> > > > > *item,
> > > > > const char *page, size_t len)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -       bool survivability_mode;
> > > > > -       int ret;
> > > > > -
> > > > > -       ret = kstrtobool(page, &survivability_mode);
> > > > > -       if (ret)
> > > > > -               return ret;
> > > > > -
> > > > > -       guard(mutex)(&dev->lock);
> > > > > -       if (is_bound(dev))
> > > > > -               return -EBUSY;
> > > > > -
> > > > > -       dev->config.survivability_mode = survivability_mode;
> > > > > -
> > > > > -       return len;
> > > > > -}
> > > > > -
> > > > > -CONFIGFS_ATTR(, ctx_restore_mid_bb);
> > > > > -CONFIGFS_ATTR(, ctx_restore_post_bb);
> > > > > -CONFIGFS_ATTR(, engines_allowed);
> > > > > -CONFIGFS_ATTR(, gt_types_allowed);
> > > > > -CONFIGFS_ATTR(, enable_multi_queue);
> > > > > -CONFIGFS_ATTR(, enable_psmi);
> > > > > -CONFIGFS_ATTR(, survivability_mode);
> > > > > -
> > > > > -static struct configfs_attribute *xe_config_device_attrs[] = {
> > > > > -       &attr_ctx_restore_mid_bb,
> > > > > -       &attr_ctx_restore_post_bb,
> > > > > -       &attr_engines_allowed,
> > > > > -       &attr_gt_types_allowed,
> > > > > -       &attr_enable_multi_queue,
> > > > > -       &attr_enable_psmi,
> > > > > -       &attr_survivability_mode,
> > > > > -       NULL,
> > > > > -};
> > > > > -
> > > > >  static void xe_config_device_release(struct config_item *item)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_to_group_device(item);
> > > > >  
> > > > >         mutex_destroy(&dev->lock);
> > > > >  
> > > > > -       kfree(dev->config.ctx_restore_mid_bb[0].cs);
> > > > > -       kfree(dev->config.ctx_restore_post_bb[0].cs);
> > > > > +       xe_configfs_debug_release_config(&dev->config);
> > > > >         kfree(dev);
> > > > >  }
> > > > >  
> > > > > @@ -1037,33 +167,14 @@ static struct configfs_item_operations
> > > > > xe_config_device_ops = {
> > > > >         .release        = xe_config_device_release,
> > > > >  };
> > > > >  
> > > > > -static bool xe_config_device_is_visible(struct config_item
> > > > > *item,
> > > > > -                                       struct
> > > > > configfs_attribute
> > > > > *attr, int n)
> > > > > -{
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item);
> > > > > -
> > > > > -       if (attr == &attr_survivability_mode) {
> > > > > -               if (!dev->desc->is_dgfx || dev->desc->platform
> > > > > <
> > > > > XE_BATTLEMAGE)
> > > > > -                       return false;
> > > > > -       }
> > > > > -
> > > > > -       return true;
> > > > > -}
> > > > > -
> > > > > -static struct configfs_group_operations
> > > > > xe_config_device_group_ops
> > > > > = {
> > > > > -       .is_visible     = xe_config_device_is_visible,
> > > > > -};
> > > > > -
> > > > >  static const struct config_item_type xe_config_device_type = {
> > > > >         .ct_item_ops    = &xe_config_device_ops,
> > > > > -       .ct_group_ops   = &xe_config_device_group_ops,
> > > > > -       .ct_attrs       = xe_config_device_attrs,
> > > > >         .ct_owner       = THIS_MODULE,
> > > > >  };
> > > > >  
> > > > >  static ssize_t sriov_max_vfs_show(struct config_item *item,
> > > > > char
> > > > > *page)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item->ci_parent);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > >  
> > > > >         guard(mutex)(&dev->lock);
> > > > >  
> > > > > @@ -1075,13 +186,13 @@ static ssize_t sriov_max_vfs_show(struct
> > > > > config_item *item, char *page)
> > > > >  
> > > > >  static ssize_t sriov_max_vfs_store(struct config_item *item,
> > > > > const
> > > > > char *page, size_t len)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item->ci_parent);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > >         unsigned int max_vfs;
> > > > >         int ret;
> > > > >  
> > > > >         guard(mutex)(&dev->lock);
> > > > >  
> > > > > -       if (is_bound(dev))
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > >                 return -EBUSY;
> > > > >  
> > > > >         ret = kstrtouint(page, 0, &max_vfs);
> > > > > @@ -1097,7 +208,7 @@ static ssize_t sriov_max_vfs_store(struct
> > > > > config_item *item, const char *page, s
> > > > >  
> > > > >  static ssize_t sriov_admin_only_pf_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item->ci_parent);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > >  
> > > > >         guard(mutex)(&dev->lock);
> > > > >  
> > > > > @@ -1106,13 +217,13 @@ static ssize_t
> > > > > sriov_admin_only_pf_show(struct config_item *item, char *page)
> > > > >  
> > > > >  static ssize_t sriov_admin_only_pf_store(struct config_item
> > > > > *item,
> > > > > const char *page, size_t len)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item->ci_parent);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > >         bool admin_only_pf;
> > > > >         int ret;
> > > > >  
> > > > >         guard(mutex)(&dev->lock);
> > > > >  
> > > > > -       if (is_bound(dev))
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > >                 return -EBUSY;
> > > > >  
> > > > >         ret = kstrtobool(page, &admin_only_pf);
> > > > > @@ -1135,7 +246,7 @@ static struct configfs_attribute
> > > > > *xe_config_sriov_attrs[] = {
> > > > >  static bool xe_config_sriov_is_visible(struct config_item
> > > > > *item,
> > > > >                                        struct
> > > > > configfs_attribute
> > > > > *attr, int n)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > to_xe_config_group_device(item->ci_parent);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > >  
> > > > >         if (attr == &sriov_attr_max_vfs && dev->mode !=
> > > > > XE_SRIOV_MODE_PF)
> > > > >                 return false;
> > > > > @@ -1271,7 +382,17 @@ static struct configfs_subsystem
> > > > > xe_configfs
> > > > > = {
> > > > >         },
> > > > >  };
> > > > >  
> > > > > -static struct xe_config_group_device
> > > > > *find_xe_config_group_device(struct pci_dev *pdev)
> > > > > +/**
> > > > > + * xe_configfs_find_group_device() - Find a configfs group by
> > > > > PCI
> > > > > device.
> > > > > + * @pdev: the &pci_dev to look up
> > > > > + *
> > > > > + * Searches the configfs subsystem for a group whose name
> > > > > matches
> > > > > @pdev.
> > > > > + * If found, the returned group has an elevated reference
> > > > > count;
> > > > > the caller
> > > > > + * must call config_group_put() when done.
> > > > > + *
> > > > > + * Return: pointer to the matching &xe_config_group_device, or
> > > > > NULL.
> > > > > + */
> > > > > +struct xe_config_group_device
> > > > > *xe_configfs_find_group_device(struct pci_dev *pdev)
> > > > >  {
> > > > >         struct config_item *item;
> > > > >  
> > > > > @@ -1282,23 +403,25 @@ static struct xe_config_group_device
> > > > > *find_xe_config_group_device(struct pci_dev
> > > > >         if (!item)
> > > > >                 return NULL;
> > > > >  
> > > > > -       return to_xe_config_group_device(item);
> > > > > +       return xe_configfs_to_group_device(item);
> > > > >  }
> > > > >  
> > > > >  static void dump_custom_dev_config(struct pci_dev *pdev,
> > > > >                                    struct
> > > > > xe_config_group_device
> > > > > *dev)
> > > > >  {
> > > > >  #define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
> > > > > -               if (dev->config.attr_ != device_defaults.attr_)
> > > > > \
> > > > > +               if (dev->config.attr_ !=
> > > > > xe_configfs_device_defaults.attr_) \
> > > > >                         pci_info(pdev, "configfs: "
> > > > > __stringify(attr_) " = " fmt_ "\n", \
> > > > >                                  dev->config.attr_); \
> > > > >         } while (0)
> > > > >  
> > > > > -       PRI_CUSTOM_ATTR("%llx", engines_allowed);
> > > > > -       PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> > > > > -       PRI_CUSTOM_ATTR("%d", enable_multi_queue);
> > > > > -       PRI_CUSTOM_ATTR("%d", enable_psmi);
> > > > > -       PRI_CUSTOM_ATTR("%d", survivability_mode);
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +       PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
> > > > > +       PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
> > > > > +       PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
> > > > > +       PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
> > > > > +       PRI_CUSTOM_ATTR("%d", debug.survivability_mode);
> > > > > +#endif
> > > > >         PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
> > > > >  
> > > > >  #undef PRI_CUSTOM_ATTR
> > > > > @@ -1313,13 +436,13 @@ static void
> > > > > dump_custom_dev_config(struct
> > > > > pci_dev *pdev,
> > > > >   */
> > > > >  void xe_configfs_check_device(struct pci_dev *pdev)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_find_group_device(pdev);
> > > > >  
> > > > >         if (!dev)
> > > > >                 return;
> > > > >  
> > > > >         /* memcmp here is safe as both are zero-initialized */
> > > > > -       if (memcmp(&dev->config, &device_defaults, sizeof(dev-
> > > > > > config))) {
> > > > > +       if (memcmp(&dev->config, &xe_configfs_device_defaults,
> > > > > sizeof(dev->config))) {
> > > > >                 pci_info(pdev, "Found custom settings in
> > > > > configfs\n");
> > > > >                 dump_custom_dev_config(pdev, dev);
> > > > >         }
> > > > > @@ -1341,7 +464,7 @@ void xe_configfs_check_device(struct
> > > > > pci_dev
> > > > > *pdev)
> > > > >   */
> > > > >  bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_find_group_device(pdev);
> > > > >         bool admin_only_pf;
> > > > >  
> > > > >         if (!dev)
> > > > > @@ -1366,7 +489,7 @@ bool xe_configfs_admin_only_pf(struct
> > > > > pci_dev
> > > > > *pdev)
> > > > >   */
> > > > >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> > > > >  {
> > > > > -       struct xe_config_group_device *dev =
> > > > > find_xe_config_group_device(pdev);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_find_group_device(pdev);
> > > > >         unsigned int max_vfs;
> > > > >  
> > > > >         if (!dev)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> > > > > b/drivers/gpu/drm/xe/xe_configfs.h
> > > > > index 7db2f46291fa..a2dc0a7cc7b5 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > > > @@ -12,24 +12,76 @@
> > > > >  #include "xe_defaults.h"
> > > > >  #include "xe_module.h"
> > > > >  
> > > > > +struct config_item;
> > > > >  struct pci_dev;
> > > > > +struct xe_config_group_device;
> > > > > +
> > > > > +extern const struct xe_config_device
> > > > > xe_configfs_device_defaults;
> > > > >  
> > > > >  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> > > > > +/**
> > > > > + * xe_configfs_to_group_device() - Cast a config_item to
> > > > > &xe_config_group_device.
> > > > > + * @item: the &config_item embedded in the device group
> > > > > + *
> > > > > + * The @item must be the top-level device group's cg_item, not
> > > > > a
> > > > > subgroup item.
> > > > > + * Use xe_configfs_subgroup_to_group_device() for subgroup
> > > > > show/store callbacks.
> > > > > + *
> > > > > + * Return: pointer to the enclosing &xe_config_group_device.
> > > > > + */
> > > > > +static inline struct xe_config_group_device *
> > > > > +xe_configfs_to_group_device(struct config_item *item)
> > > > > +{
> > > > > +       return container_of(to_config_group(item), struct
> > > > > xe_config_group_device, group);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_to_device() - Cast a config_item to
> > > > > &xe_config_device.
> > > > > + * @item: the &config_item embedded in the device group
> > > > > + *
> > > > > + * Convenience wrapper around xe_configfs_to_group_device().
> > > > > + *
> > > > > + * Return: pointer to the &xe_config_device nested in the
> > > > > group.
> > > > > + */
> > > > > +static inline struct xe_config_device
> > > > > *xe_configfs_to_device(struct config_item *item)
> > > > > +{
> > > > > +       return &xe_configfs_to_group_device(item)->config;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_subgroup_to_group_device() - Cast a subgroup
> > > > > item
> > > > > to &xe_config_group_device.
> > > > > + * @item: the &config_item of a subgroup (e.g. sriov or debug)
> > > > > + *
> > > > > + * In configfs, show/store callbacks for a subgroup's
> > > > > attributes
> > > > > receive the
> > > > > + * subgroup's cg_item, whose parent is the device group's
> > > > > cg_item.
> > > > > + * This helper walks up one level to return the enclosing
> > > > > device
> > > > > group.
> > > > > + *
> > > > > + * Return: pointer to the enclosing &xe_config_group_device.
> > > > > + */
> > > > > +static inline struct xe_config_group_device *
> > > > > +xe_configfs_subgroup_to_group_device(struct config_item *item)
> > > > > +{
> > > > > +       return xe_configfs_to_group_device(item->ci_parent);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_subgroup_to_device() - Cast a subgroup item to
> > > > > &xe_config_device.
> > > > > + * @item: the &config_item of a subgroup (e.g. sriov or debug)
> > > > > + *
> > > > > + * Convenience wrapper for a subgroup item to get the
> > > > > &xe_config_device.
> > > > > + *
> > > > > + * Return: pointer to the &xe_config_device nested in the
> > > > > parent
> > > > > device group.
> > > > > + */
> > > > > +static inline struct xe_config_device *
> > > > > +xe_configfs_subgroup_to_device(struct config_item *item)
> > > > > +{
> > > > > +       return xe_configfs_to_device(item->ci_parent);
> > > > > +}
> > > > > +
> > > > > +bool xe_configfs_is_bound(struct xe_config_group_device *dev);
> > > > > +struct xe_config_group_device
> > > > > *xe_configfs_find_group_device(struct pci_dev *pdev);
> > > > >  int xe_configfs_init(void);
> > > > >  void xe_configfs_exit(void);
> > > > >  void xe_configfs_check_device(struct pci_dev *pdev);
> > > > > -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > > > -                                      enum xe_engine_class
> > > > > class,
> > > > > -                                      const u32 **cs);
> > > > > -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > > > -                                       enum xe_engine_class
> > > > > class,
> > > > > -                                       const u32 **cs);
> > > > > -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > > > > -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> > > > > -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> > > > > -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> > > > > -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > > > > -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > > > >  #ifdef CONFIG_PCI_IOV
> > > > >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> > > > >  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> > > > > @@ -38,18 +90,6 @@ bool xe_configfs_admin_only_pf(struct
> > > > > pci_dev
> > > > > *pdev);
> > > > >  static inline int xe_configfs_init(void) { return 0; }
> > > > >  static inline void xe_configfs_exit(void) { }
> > > > >  static inline void xe_configfs_check_device(struct pci_dev
> > > > > *pdev)
> > > > > { }
> > > > > -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct
> > > > > pci_dev *pdev,
> > > > > -                                                    enum
> > > > > xe_engine_class class,
> > > > > -                                                    const u32
> > > > > **cs) { return 0; }
> > > > > -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct
> > > > > pci_dev *pdev,
> > > > > -                                                     enum
> > > > > xe_engine_class class,
> > > > > -                                                     const u32
> > > > > **cs) { return 0; }
> > > > > -static inline u64 xe_configfs_get_engines_allowed(struct
> > > > > pci_dev
> > > > > *pdev) { return U64_MAX; }
> > > > > -static inline bool xe_configfs_primary_gt_allowed(struct
> > > > > pci_dev
> > > > > *pdev) { return true; }
> > > > > -static inline bool xe_configfs_media_gt_allowed(struct pci_dev
> > > > > *pdev) { return true; }
> > > > > -static inline bool xe_configfs_get_enable_multi_queue(struct
> > > > > pci_dev *pdev) { return true; }
> > > > > -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev
> > > > > *pdev) { return false; }
> > > > > -static inline bool xe_configfs_get_survivability_mode(struct
> > > > > pci_dev *pdev) { return false; }
> > > > >  #ifdef CONFIG_PCI_IOV
> > > > >  static inline unsigned int xe_configfs_get_max_vfs(struct
> > > > > pci_dev
> > > > > *pdev)
> > > > >  {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > index 45617282cec5..b2667573efbe 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > @@ -3,12 +3,968 @@
> > > > >   * Copyright © 2026 Intel Corporation
> > > > >   */
> > > > >  
> > > > > +#include <linux/bitops.h>
> > > > >  #include <linux/configfs.h>
> > > > >  #include <linux/module.h>
> > > > > +#include <linux/cleanup.h>
> > > > > +#include <linux/find.h>
> > > > > +#include <linux/pci.h>
> > > > > +#include <linux/string.h>
> > > > >  
> > > > > +#include "abi/guc_log_abi.h"
> > > > > +#include "instructions/xe_mi_commands.h"
> > > > > +#include "xe_configfs.h"
> > > > >  #include "xe_configfs_debug.h"
> > > > >  #include "xe_configfs_types.h"
> > > > > +#include "xe_gt_types.h"
> > > > > +#include "xe_hw_engine_types.h"
> > > > > +#include "xe_pci_types.h"
> > > > > +
> > > > > +/**
> > > > > + * DOC: Xe Configfs Debug Attributes
> > > > > + *
> > > > > + * Overview
> > > > > + * ========
> > > > > + *
> > > > > + * The following configfs attributes are only available when
> > > > > the
> > > > > kernel is
> > > > > + * built with ``CONFIG_DRM_XE_DEBUG=y``. They appear under the
> > > > > ``debug/``
> > > > > + * subdirectory of each xe configfs device. They are intended
> > > > > for
> > > > > hardware
> > > > > + * and driver debugging and are not stable ABI. Using them is
> > > > > "at
> > > > > your own
> > > > > + * risk".
> > > > > + *
> > > > > + * See the top-level ``Xe Configfs`` documentation in
> > > > > ``xe_configfs.c``
> > > > > + * for how to create, probe and remove configfs devices. Once
> > > > > a
> > > > > device
> > > > > + * directory exists, the driver populates it with a ``debug/``
> > > > > subdirectory
> > > > > + * containing the entries described below::
> > > > > + *
> > > > > + *     /sys/kernel/config/xe/
> > > > > + *     └── 0000:03:00.0
> > > > > + *         └── debug/
> > > > > + *             ├── ctx_restore_mid_bb
> > > > > + *             ├── ctx_restore_post_bb
> > > > > + *             ├── engines_allowed
> > > > > + *             ├── gt_types_allowed
> > > > > + *             ├── enable_multi_queue
> > > > > + *             ├── enable_psmi
> > > > > + *             └── survivability_mode
> > > > > + *
> > > > > + * Configure Attributes
> > > > > + * ====================
> > > > > + *
> > > > > + * Context restore BB
> > > > > + * ------------------
> > > > > + *
> > > > > + * Allow to execute a batch buffer during any context
> > > > > switches.
> > > > > When the
> > > > > + * GPU is restoring the context, it executes additional
> > > > > commands.
> > > > > It's useful
> > > > > + * for testing additional workarounds and validating certain
> > > > > HW
> > > > > behaviors: it's
> > > > > + * not intended for normal execution and will taint the kernel
> > > > > with TAINT_TEST
> > > > > + * when used.
> > > > > + *
> > > > > + * The syntax allows to pass straight instructions to be
> > > > > executed
> > > > > by the engine
> > > > > + * in a batch buffer or set specific registers.
> > > > > + *
> > > > > + * #. Generic instruction::
> > > > > + *
> > > > > + *     <engine-class> cmd <instr> [[dword0] [dword1] [...]]
> > > > > + *
> > > > > + * #. Simple register setting::
> > > > > + *
> > > > > + *     <engine-class> reg <address> <value>
> > > > > + *
> > > > > + * Commands are saved per engine class: all instances of that
> > > > > class will execute
> > > > > + * those commands during context switch. The instruction,
> > > > > dword
> > > > > arguments,
> > > > > + * addresses and values are in hex format like in the examples
> > > > > below.
> > > > > + *
> > > > > + * #. Execute a LRI command to write 0xDEADBEEF to register
> > > > > 0x4f10
> > > > > after the
> > > > > + *    normal context restore::
> > > > > + *
> > > > > + *     # echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> > > > > + *             >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb
> > > > > + *
> > > > > + * #. Execute a LRI command to write 0xDEADBEEF to register
> > > > > 0x4f10
> > > > > at the
> > > > > + *    beginning of the context restore::
> > > > > + *
> > > > > + *     # echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> > > > > + *             >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_mid_bb
> > > > > + *
> > > > > + * #. Load certain values in a couple of registers (it can be
> > > > > used
> > > > > as a simpler
> > > > > + *    alternative to the `cmd`) action::
> > > > > + *
> > > > > + *     # cat >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb
> > > > > <<EOF
> > > > > + *     rcs reg 4F100 DEADBEEF
> > > > > + *     rcs reg 4F104 FFFFFFFF
> > > > > + *     EOF
> > > > > + *
> > > > > + *    .. note::
> > > > > + *
> > > > > + *       When using multiple lines, make sure to use a command
> > > > > that is
> > > > > + *       implemented with a single write syscall, like
> > > > > HEREDOC.
> > > > > + *
> > > > > + * Currently this is implemented only for post and mid context
> > > > > restore and
> > > > > + * these attributes can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + * Allowed engines:
> > > > > + * ----------------
> > > > > + *
> > > > > + * Allow only a set of engine(s) to be available, disabling
> > > > > the
> > > > > other engines
> > > > > + * even if they are available in hardware. This is applied
> > > > > after
> > > > > HW fuses are
> > > > > + * considered on each tile. Examples:
> > > > > + *
> > > > > + * Allow only one render and one copy engines, nothing else::
> > > > > + *
> > > > > + *     # echo 'rcs0,bcs0' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
> > > > > + *
> > > > > + * Allow only compute engines and first copy engine::
> > > > > + *
> > > > > + *     # echo 'ccs*,bcs0' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
> > > > > + *
> > > > > + * Note that the engine names are the per-GT hardware names.
> > > > > On
> > > > > multi-tile
> > > > > + * platforms, writing ``rcs0,bcs0`` to this file would allow
> > > > > the
> > > > > first render
> > > > > + * and copy engines on each tile.
> > > > > + *
> > > > > + * The requested configuration may not be supported by the
> > > > > platform and driver
> > > > > + * may fail to probe. For example: if at least one copy engine
> > > > > is
> > > > > expected to be
> > > > > + * available for migrations, but it's disabled. This is
> > > > > intended
> > > > > for debugging
> > > > > + * purposes only.
> > > > > + *
> > > > > + * This attribute can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + * Allowed GT types:
> > > > > + * -----------------
> > > > > + *
> > > > > + * Allow only specific types of GTs to be detected and
> > > > > initialized
> > > > > by the
> > > > > + * driver.  Any combination of GT types can be
> > > > > enabled/disabled,
> > > > > although
> > > > > + * some settings will cause the device to fail to probe.
> > > > > + *
> > > > > + * Writes support both comma- and newline-separated input
> > > > > format.
> > > > > Reads
> > > > > + * will always return one GT type per line. "primary" and
> > > > > "media"
> > > > > are the
> > > > > + * GT type names supported by this interface.
> > > > > + *
> > > > > + * This attribute can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + * Examples:
> > > > > + *
> > > > > + * Allow both primary and media GTs to be initialized and
> > > > > used. 
> > > > > This matches
> > > > > + * the driver's default behavior::
> > > > > + *
> > > > > + *     # echo 'primary,media' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> > > > > + *
> > > > > + * Allow only the primary GT of each tile to be initialized
> > > > > and
> > > > > used,
> > > > > + * effectively disabling the media GT if it exists on the
> > > > > platform::
> > > > > + *
> > > > > + *     # echo 'primary' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> > > > > + *
> > > > > + * Allow only the media GT of each tile to be initialized and
> > > > > used,
> > > > > + * effectively disabling the primary GT.  **This configuration
> > > > > will cause
> > > > > + * device probe failure on all current platforms, but may be
> > > > > allowed on
> > > > > + * igpu platforms in the future**::
> > > > > + *
> > > > > + *     # echo 'media' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> > > > > + *
> > > > > + * Disable all GTs.  Only other GPU IP (such as display) is
> > > > > potentially usable.
> > > > > + * **This configuration will cause device probe failure on all
> > > > > current
> > > > > + * platforms, but may be allowed on igpu platforms in the
> > > > > future**::
> > > > > + *
> > > > > + *     # echo '' >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> > > > > + *
> > > > > + * Enable multi-queue
> > > > > + * ------------------
> > > > > + *
> > > > > + * Multi-queue support on the device is enabled by default
> > > > > where
> > > > > the
> > > > > + * hardware supports it. Writing 0 force-disables multi-queue
> > > > > support:
> > > > > + * multi-queue exec-queue group creation via ioctl is refused,
> > > > > and
> > > > > the
> > > > > + * GuC feature is disabled::
> > > > > + *
> > > > > + *     # echo 0 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/enable_multi_queue
> > > > > + *
> > > > > + * This attribute can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + * PSMI
> > > > > + * ----
> > > > > + *
> > > > > + * Enable extra debugging capabilities to trace engine
> > > > > execution.
> > > > > Only useful
> > > > > + * during early platform enabling and requires additional
> > > > > hardware
> > > > > connected.
> > > > > + * Once it's enabled, additionals WAs are added and runtime
> > > > > configuration is
> > > > > + * done via debugfs. Example to enable it::
> > > > > + *
> > > > > + *     # echo 1 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/enable_psmi
> > > > > + *
> > > > > + * This attribute can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + * Survivability mode:
> > > > > + * -------------------
> > > > > + *
> > > > > + * Enable survivability mode on supported cards. This setting
> > > > > only
> > > > > takes
> > > > > + * effect when probing the device. Example to enable it::
> > > > > + *
> > > > > + *     # echo 1 >
> > > > > /sys/kernel/config/xe/0000:03:00.0/debug/survivability_mode
> > > > > + *
> > > > > + * This attribute can only be set before binding to the
> > > > > device.
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +struct engine_info {
> > > > > +       const char *cls;
> > > > > +       u64 mask;
> > > > > +       enum xe_engine_class engine_class;
> > > > > +};
> > > > > +
> > > > > +/* Some helpful macros to aid on the sizing of buffer
> > > > > allocation
> > > > > when parsing */
> > > > > +#define MAX_ENGINE_CLASS_CHARS 5
> > > > > +#define MAX_ENGINE_INSTANCE_CHARS 2
> > > > > +
> > > > > +static const struct engine_info engine_info[] = {
> > > > > +       { .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_RENDER },
> > > > > +       { .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_COPY },
> > > > > +       { .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> > > > > +       { .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
> > > > > +       { .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_COMPUTE },
> > > > > +       { .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK,
> > > > > .engine_class = XE_ENGINE_CLASS_OTHER },
> > > > > +};
> > > > > +
> > > > > +static const struct {
> > > > > +       const char *name;
> > > > > +       enum xe_gt_type type;
> > > > > +} gt_types[] = {
> > > > > +       { .name = "primary", .type = XE_GT_TYPE_MAIN },
> > > > > +       { .name = "media", .type = XE_GT_TYPE_MEDIA },
> > > > > +};
> > > > > +
> > > > > +static struct xe_config_group_device *find_device(struct
> > > > > pci_dev
> > > > > *pdev)
> > > > > +{
> > > > > +       return xe_configfs_find_group_device(pdev);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_ctx_restore_mid_bb - get configfs
> > > > > ctx_restore_mid_bb setting
> > > > > + * @pdev: pci device
> > > > > + * @class: hw engine class
> > > > > + * @cs: pointer to the bb to use - only valid during probe
> > > > > + *
> > > > > + * Return: Number of dwords used in the mid_ctx_restore
> > > > > setting in
> > > > > configfs
> > > > > + */
> > > > > +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > > > +                                      enum xe_engine_class
> > > > > class,
> > > > > +                                      const u32 **cs)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       u32 len;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return 0;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock) {
> > > > > +               if (cs)
> > > > > +                       *cs = dev-
> > > > > > config.debug.ctx_restore_mid_bb[class].cs;
> > > > > +
> > > > > +               len = dev-
> > > > > > config.debug.ctx_restore_mid_bb[class].len;
> > > > > +       }
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_ctx_restore_post_bb - get configfs
> > > > > ctx_restore_post_bb setting
> > > > > + * @pdev: pci device
> > > > > + * @class: hw engine class
> > > > > + * @cs: pointer to the bb to use - only valid during probe
> > > > > + *
> > > > > + * Return: Number of dwords used in the post_ctx_restore
> > > > > setting
> > > > > in configfs
> > > > > + */
> > > > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > > > +                                       enum xe_engine_class
> > > > > class,
> > > > > +                                       const u32 **cs)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       u32 len;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return 0;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock) {
> > > > > +               *cs = dev-
> > > > > > config.debug.ctx_restore_post_bb[class].cs;
> > > > > +               len = dev-
> > > > > > config.debug.ctx_restore_post_bb[class].len;
> > > > > +       }
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +static bool wa_bb_read_advance(bool dereference, char **p,
> > > > > +                              const char *append, size_t len,
> > > > > +                              size_t *max_size)
> > > > > +{
> > > > > +       if (dereference) {
> > > > > +               if (len >= *max_size)
> > > > > +                       return false;
> > > > > +               *max_size -= len;
> > > > > +               if (append)
> > > > > +                       memcpy(*p, append, len);
> > > > > +       }
> > > > > +
> > > > > +       *p += len;
> > > > > +
> > > > > +       return true;
> > > > > +}
> > > > > +
> > > > > +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> > > > > +                         struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX],
> > > > > +                         char *data, size_t sz)
> > > > > +{
> > > > > +       char *p = data;
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +
> > > > > +       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > +               enum xe_engine_class ec =
> > > > > engine_info[i].engine_class;
> > > > > +               size_t len;
> > > > > +
> > > > > +               if (!wa_bb[ec].len)
> > > > > +                       continue;
> > > > > +
> > > > > +               len = snprintf(p, sz, "%s:",
> > > > > engine_info[i].cls);
> > > > > +               if (!wa_bb_read_advance(data, &p, NULL, len,
> > > > > &sz))
> > > > > +                       return -ENOBUFS;
> > > > > +
> > > > > +               for (size_t j = 0; j < wa_bb[ec].len; j++) {
> > > > > +                       len = snprintf(p, sz, " %08x",
> > > > > wa_bb[ec].cs[j]);
> > > > > +                       if (!wa_bb_read_advance(data, &p, NULL,
> > > > > len, &sz))
> > > > > +                               return -ENOBUFS;
> > > > > +               }
> > > > > +
> > > > > +               if (!wa_bb_read_advance(data, &p, "\n", 1,
> > > > > &sz))
> > > > > +                       return -ENOBUFS;
> > > > > +       }
> > > > > +
> > > > > +       if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> > > > > +               return -ENOBUFS;
> > > > > +
> > > > > +       /* Reserve one more to match check for '\0' */
> > > > > +       if (!data)
> > > > > +               p++;
> > > > > +
> > > > > +       return p - data;
> > > > > +}
> > > > > +
> > > > > +static ssize_t ctx_restore_mid_bb_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +
> > > > > +       return wa_bb_show(dev, dev-
> > > > > > config.debug.ctx_restore_mid_bb, page, SZ_4K);
> > > > > +}
> > > > > +
> > > > > +static ssize_t ctx_restore_post_bb_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +
> > > > > +       return wa_bb_show(dev, dev-
> > > > > > config.debug.ctx_restore_post_bb, page, SZ_4K);
> > > > > +}
> > > > > +
> > > > > +static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
> > > > > +{
> > > > > +       if (wa_bb->cs)
> > > > > +               wa_bb->cs[wa_bb->len] = val;
> > > > > +
> > > > > +       wa_bb->len++;
> > > > > +}
> > > > > +
> > > > > +static ssize_t parse_hex(const char *line, u32 *pval)
> > > > > +{
> > > > > +       char numstr[12];
> > > > > +       const char *p;
> > > > > +       ssize_t numlen;
> > > > > +
> > > > > +       p = line + strspn(line, " \t");
> > > > > +       if (!*p || *p == '\n')
> > > > > +               return 0;
> > > > > +
> > > > > +       numlen = strcspn(p, " \t\n");
> > > > > +       if (!numlen || numlen >= sizeof(numstr) - 1)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       memcpy(numstr, p, numlen);
> > > > > +       numstr[numlen] = '\0';
> > > > > +       p += numlen;
> > > > > +
> > > > > +       if (kstrtou32(numstr, 16, pval))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       return p - line;
> > > > > +}
> > > > > +
> > > > > +static int parse_engine(const char *s, const char *end_chars,
> > > > > u64
> > > > > *mask,
> > > > > +                       const struct engine_info **pinfo);
> > > > > +
> > > > > +/*
> > > > > + * Parse lines with the format
> > > > > + *
> > > > > + *     <engine-class> cmd <u32> <u32...>
> > > > > + *     <engine-class> reg <u32_addr> <u32_val>
> > > > > + *
> > > > > + * and optionally save them in @wa_bb[i].cs is non-NULL.
> > > > > + *
> > > > > + * Return the number of dwords parsed.
> > > > > + */
> > > > > +static ssize_t parse_wa_bb_lines(const char *lines,
> > > > > +                                struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX])
> > > > > +{
> > > > > +       ssize_t dwords = 0, ret;
> > > > > +       const char *p;
> > > > > +
> > > > > +       for (p = lines; *p; p++) {
> > > > > +               const struct engine_info *info = NULL;
> > > > > +               u32 val, val2;
> > > > > +
> > > > > +               /* Also allow empty lines */
> > > > > +               p += strspn(p, " \t\n");
> > > > > +               if (!*p)
> > > > > +                       break;
> > > > > +
> > > > > +               ret = parse_engine(p, " \t\n", NULL, &info);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > > +
> > > > > +               p += ret;
> > > > > +               p += strspn(p, " \t");
> > > > > +
> > > > > +               if (str_has_prefix(p, "cmd")) {
> > > > > +                       for (p += strlen("cmd"); *p;) {
> > > > > +                               ret = parse_hex(p, &val);
> > > > > +                               if (ret < 0)
> > > > > +                                       return -EINVAL;
> > > > > +                               if (!ret)
> > > > > +                                       break;
> > > > > +
> > > > > +                               p += ret;
> > > > > +                               dwords++;
> > > > > +                               wa_bb_append(&wa_bb[info-
> > > > > > engine_class], val);
> > > > > +                       }
> > > > > +               } else if (str_has_prefix(p, "reg")) {
> > > > > +                       p += strlen("reg");
> > > > > +                       ret = parse_hex(p, &val);
> > > > > +                       if (ret <= 0)
> > > > > +                               return -EINVAL;
> > > > > +
> > > > > +                       p += ret;
> > > > > +                       ret = parse_hex(p, &val2);
> > > > > +                       if (ret <= 0)
> > > > > +                               return -EINVAL;
> > > > > +
> > > > > +                       p += ret;
> > > > > +                       dwords += 3;
> > > > > +                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > +                                    MI_LOAD_REGISTER_IMM |
> > > > > MI_LRI_NUM_REGS(1));
> > > > > +                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > val);
> > > > > +                       wa_bb_append(&wa_bb[info-
> > > > > >engine_class],
> > > > > val2);
> > > > > +               } else {
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       return dwords;
> > > > > +}
> > > > > +
> > > > > +static ssize_t wa_bb_store(struct wa_bb wa_bb[static
> > > > > XE_ENGINE_CLASS_MAX],
> > > > > +                          struct xe_config_group_device *dev,
> > > > > +                          const char *page, size_t len)
> > > > > +{
> > > > > +       /* tmp_wa_bb must match wa_bb's size */
> > > > > +       struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
> > > > > +       ssize_t count, class;
> > > > > +       u32 *tmp;
> > > > > +
> > > > > +       /* 1. Count dwords - wa_bb[i].cs is NULL for all
> > > > > classes */
> > > > > +       count = parse_wa_bb_lines(page, tmp_wa_bb);
> > > > > +       if (count < 0)
> > > > > +               return count;
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       /*
> > > > > +        * 2. Allocate a u32 array and set the pointers to the
> > > > > right positions
> > > > > +        * according to the length of each class' wa_bb
> > > > > +        */
> > > > > +       tmp = krealloc(wa_bb[0].cs, count * sizeof(u32),
> > > > > GFP_KERNEL);
> > > > > +       if (!tmp)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       if (!count) {
> > > > > +               memset(wa_bb, 0, sizeof(tmp_wa_bb));
> > > > > +               return len;
> > > > > +       }
> > > > > +
> > > > > +       for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX;
> > > > > ++class) {
> > > > > +               tmp_wa_bb[class].cs = tmp + count;
> > > > > +               count += tmp_wa_bb[class].len;
> > > > > +               tmp_wa_bb[class].len = 0;
> > > > > +       }
> > > > > +
> > > > > +       /* 3. Parse wa_bb lines again, this time saving the
> > > > > values
> > > > > */
> > > > > +       count = parse_wa_bb_lines(page, tmp_wa_bb);
> > > > > +       if (count < 0) {
> > > > > +               kfree(tmp);
> > > > > +               memset(wa_bb, 0, sizeof(tmp_wa_bb));
> > > > > +               return count;
> > > > > +       }
> > > > > +
> > > > > +       memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +static ssize_t ctx_restore_mid_bb_store(struct config_item
> > > > > *item,
> > > > > +                                       const char *data,
> > > > > size_t
> > > > > sz)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +
> > > > > +       return wa_bb_store(dev-
> > > > > >config.debug.ctx_restore_mid_bb,
> > > > > dev, data, sz);
> > > > > +}
> > > > > +
> > > > > +static ssize_t ctx_restore_post_bb_store(struct config_item
> > > > > *item,
> > > > > +                                        const char *data,
> > > > > size_t
> > > > > sz)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +
> > > > > +       return wa_bb_store(dev-
> > > > > >config.debug.ctx_restore_post_bb,
> > > > > dev, data, sz);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_engines_allowed - get engine allowed mask
> > > > > from
> > > > > configfs
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: engine mask with allowed engines set in configfs
> > > > > + */
> > > > > +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       u64 engines_allowed;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return
> > > > > xe_configfs_device_defaults.debug.engines_allowed;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock)
> > > > > +               engines_allowed = dev-
> > > > > > config.debug.engines_allowed;
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return engines_allowed;
> > > > > +}
> > > > > +
> > > > > +static ssize_t engines_allowed_show(struct config_item *item,
> > > > > char
> > > > > *page)
> > > > > +{
> > > > > +       struct xe_config_device *dev =
> > > > > xe_configfs_subgroup_to_device(item);
> > > > > +       char *p = page;
> > > > > +
> > > > > +       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > +               u64 mask = engine_info[i].mask;
> > > > > +
> > > > > +               if ((dev->debug.engines_allowed & mask) ==
> > > > > mask) {
> > > > > +                       p += sprintf(p, "%s*\n",
> > > > > engine_info[i].cls);
> > > > > +               } else if (mask & dev->debug.engines_allowed) {
> > > > > +                       u16 bit0 = __ffs64(mask), bit;
> > > > > +
> > > > > +                       mask &= dev->debug.engines_allowed;
> > > > > +
> > > > > +                       for_each_set_bit(bit, (const unsigned
> > > > > long
> > > > > *)&mask, 64)
> > > > > +                               p += sprintf(p, "%s%u\n",
> > > > > engine_info[i].cls,
> > > > > +                                            bit - bit0);
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       return p - page;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * Lookup engine_info. If @mask is not NULL, reduce the mask
> > > > > according to the
> > > > > + * instance in @pattern.
> > > > > + *
> > > > > + * Examples of inputs:
> > > > > + * - lookup_engine_info("rcs0", &mask): return "rcs" entry
> > > > > from
> > > > > @engine_info and
> > > > > + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> > > > > + * - lookup_engine_info("rcs*", &mask): return "rcs" entry
> > > > > from
> > > > > @engine_info and
> > > > > + *   mask == XE_HW_ENGINE_RCS_MASK
> > > > > + * - lookup_engine_info("rcs", NULL): return "rcs" entry from
> > > > > @engine_info
> > > > > + */
> > > > > +static const struct engine_info *lookup_engine_info(const char
> > > > > *pattern, u64 *mask)
> > > > > +{
> > > > > +       for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > > > +               u8 instance;
> > > > > +               u16 bit;
> > > > > +
> > > > > +               if (!str_has_prefix(pattern,
> > > > > engine_info[i].cls))
> > > > > +                       continue;
> > > > > +
> > > > > +               pattern += strlen(engine_info[i].cls);
> > > > > +               if (!mask)
> > > > > +                       return *pattern ? NULL :
> > > > > &engine_info[i];
> > > > > +
> > > > > +               if (!strcmp(pattern, "*")) {
> > > > > +                       *mask = engine_info[i].mask;
> > > > > +                       return &engine_info[i];
> > > > > +               }
> > > > > +
> > > > > +               if (kstrtou8(pattern, 10, &instance))
> > > > > +                       return NULL;
> > > > > +
> > > > > +               bit = __ffs64(engine_info[i].mask) + instance;
> > > > > +               if (bit >= fls64(engine_info[i].mask))
> > > > > +                       return NULL;
> > > > > +
> > > > > +               *mask = BIT_ULL(bit);
> > > > > +               return &engine_info[i];
> > > > > +       }
> > > > > +
> > > > > +       return NULL;
> > > > > +}
> > > > > +
> > > > > +static int parse_engine(const char *s, const char *end_chars,
> > > > > u64
> > > > > *mask,
> > > > > +                       const struct engine_info **pinfo)
> > > > > +{
> > > > > +       char buf[MAX_ENGINE_CLASS_CHARS +
> > > > > MAX_ENGINE_INSTANCE_CHARS
> > > > > + 1];
> > > > > +       const struct engine_info *info;
> > > > > +       size_t len;
> > > > > +
> > > > > +       len = strcspn(s, end_chars);
> > > > > +       if (len >= sizeof(buf))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       memcpy(buf, s, len);
> > > > > +       buf[len] = '\0';
> > > > > +
> > > > > +       info = lookup_engine_info(buf, mask);
> > > > > +       if (!info)
> > > > > +               return -ENOENT;
> > > > > +
> > > > > +       if (pinfo)
> > > > > +               *pinfo = info;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +static ssize_t engines_allowed_store(struct config_item *item,
> > > > > const char *page,
> > > > > +                                    size_t len)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +       ssize_t patternlen, p;
> > > > > +       u64 mask, val = 0;
> > > > > +
> > > > > +       for (p = 0; p < len; p += patternlen + 1) {
> > > > > +               patternlen = parse_engine(page + p, ",\n",
> > > > > &mask,
> > > > > NULL);
> > > > > +               if (patternlen < 0)
> > > > > +                       return -EINVAL;
> > > > > +
> > > > > +               val |= mask;
> > > > > +       }
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       dev->config.debug.engines_allowed = val;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +static u64 get_gt_types_allowed(struct pci_dev *pdev)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       u64 mask;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return
> > > > > xe_configfs_device_defaults.debug.gt_types_allowed;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock)
> > > > > +               mask = dev->config.debug.gt_types_allowed;
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return mask;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_primary_gt_allowed - determine whether primary
> > > > > GTs
> > > > > are supported
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: True if primary GTs are enabled, false if they have
> > > > > been disabled via
> > > > > + *     configfs.
> > > > > + */
> > > > > +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> > > > > +{
> > > > > +       return get_gt_types_allowed(pdev) &
> > > > > BIT_ULL(XE_GT_TYPE_MAIN);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_media_gt_allowed - determine whether media GTs
> > > > > are
> > > > > supported
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: True if the media GTs are enabled, false if they
> > > > > have
> > > > > been disabled
> > > > > + *     via configfs.
> > > > > + */
> > > > > +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> > > > > +{
> > > > > +       return get_gt_types_allowed(pdev) &
> > > > > BIT_ULL(XE_GT_TYPE_MEDIA);
> > > > > +}
> > > > > +
> > > > > +static ssize_t gt_types_allowed_show(struct config_item *item,
> > > > > char *page)
> > > > > +{
> > > > > +       struct xe_config_device *dev =
> > > > > xe_configfs_subgroup_to_device(item);
> > > > > +       char *p = page;
> > > > > +
> > > > > +       for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> > > > > +               if (dev->debug.gt_types_allowed &
> > > > > BIT_ULL(gt_types[i].type))
> > > > > +                       p += sprintf(p, "%s\n",
> > > > > gt_types[i].name);
> > > > > +
> > > > > +       return p - page;
> > > > > +}
> > > > > +
> > > > > +static ssize_t gt_types_allowed_store(struct config_item
> > > > > *item,
> > > > > const char *page,
> > > > > +                                     size_t len)
> > > > > +{
> > > > > +       char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +       u64 typemask = 0;
> > > > > +       char *p = buf;
> > > > > +
> > > > > +       if (!buf)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       while (p) {
> > > > > +               char *typename = strsep(&p, ",\n");
> > > > > +               bool matched = false;
> > > > > +
> > > > > +               if (typename[0] == '\0')
> > > > > +                       continue;
> > > > > +
> > > > > +               for (size_t i = 0; i < ARRAY_SIZE(gt_types);
> > > > > i++) {
> > > > > +                       if (strcmp(typename, gt_types[i].name)
> > > > > ==
> > > > > 0) {
> > > > > +                               typemask |=
> > > > > BIT(gt_types[i].type);
> > > > > +                               matched = true;
> > > > > +                               break;
> > > > > +                       }
> > > > > +               }
> > > > > +
> > > > > +               if (!matched)
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       dev->config.debug.gt_types_allowed = typemask;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_enable_multi_queue - get configfs
> > > > > enable_multi_queue setting
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: true if multi-queue is enabled for this device (the
> > > > > default),
> > > > > + * false if it has been force-disabled via configfs.
> > > > > + */
> > > > > +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       bool ret;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return
> > > > > xe_configfs_device_defaults.debug.enable_multi_queue;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock)
> > > > > +               ret = dev->config.debug.enable_multi_queue;
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +static ssize_t enable_multi_queue_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > +{
> > > > > +       struct xe_config_device *dev =
> > > > > xe_configfs_subgroup_to_device(item);
> > > > > +
> > > > > +       return sprintf(page, "%d\n", dev-
> > > > > > debug.enable_multi_queue);
> > > > > +}
> > > > > +
> > > > > +static ssize_t enable_multi_queue_store(struct config_item
> > > > > *item,
> > > > > const char *page, size_t len)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +       bool val;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret = kstrtobool(page, &val);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       dev->config.debug.enable_multi_queue = val;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_psmi_enabled - get configfs enable_psmi
> > > > > setting
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: enable_psmi setting in configfs
> > > > > + */
> > > > > +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       bool ret;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return false;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock)
> > > > > +               ret = dev->config.debug.enable_psmi;
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +static ssize_t enable_psmi_show(struct config_item *item, char
> > > > > *page)
> > > > > +{
> > > > > +       struct xe_config_device *dev =
> > > > > xe_configfs_subgroup_to_device(item);
> > > > > +
> > > > > +       return sprintf(page, "%d\n", dev->debug.enable_psmi);
> > > > > +}
> > > > > +
> > > > > +static ssize_t enable_psmi_store(struct config_item *item,
> > > > > const
> > > > > char *page, size_t len)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +       bool val;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret = kstrtobool(page, &val);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       dev->config.debug.enable_psmi = val;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_get_survivability_mode - get configfs
> > > > > survivability
> > > > > mode attribute
> > > > > + * @pdev: pci device
> > > > > + *
> > > > > + * Return: survivability_mode attribute in configfs
> > > > > + */
> > > > > +bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev = find_device(pdev);
> > > > > +       bool mode;
> > > > > +
> > > > > +       if (!dev)
> > > > > +               return
> > > > > xe_configfs_device_defaults.debug.survivability_mode;
> > > > > +
> > > > > +       scoped_guard(mutex, &dev->lock)
> > > > > +               mode = dev->config.debug.survivability_mode;
> > > > > +       config_group_put(&dev->group);
> > > > > +
> > > > > +       return mode;
> > > > > +}
> > > > > +
> > > > > +static ssize_t survivability_mode_show(struct config_item
> > > > > *item,
> > > > > char *page)
> > > > > +{
> > > > > +       struct xe_config_device *dev =
> > > > > xe_configfs_subgroup_to_device(item);
> > > > > +
> > > > > +       return sprintf(page, "%d\n", dev-
> > > > > > debug.survivability_mode);
> > > > > +}
> > > > > +
> > > > > +static ssize_t survivability_mode_store(struct config_item
> > > > > *item,
> > > > > const char *page, size_t len)
> > > > > +{
> > > > > +       struct xe_config_group_device *dev =
> > > > > xe_configfs_subgroup_to_group_device(item);
> > > > > +       bool survivability_mode;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret = kstrtobool(page, &survivability_mode);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       guard(mutex)(&dev->lock);
> > > > > +       if (xe_configfs_is_bound(dev))
> > > > > +               return -EBUSY;
> > > > > +
> > > > > +       dev->config.debug.survivability_mode =
> > > > > survivability_mode;
> > > > > +
> > > > > +       return len;
> > > > > +}
> > > > > +
> > > > > +CONFIGFS_ATTR(, ctx_restore_mid_bb);
> > > > > +CONFIGFS_ATTR(, ctx_restore_post_bb);
> > > > > +CONFIGFS_ATTR(, engines_allowed);
> > > > > +CONFIGFS_ATTR(, gt_types_allowed);
> > > > > +CONFIGFS_ATTR(, enable_multi_queue);
> > > > > +CONFIGFS_ATTR(, enable_psmi);
> > > > > +CONFIGFS_ATTR(, survivability_mode);
> > > > > +
> > > > > +static struct configfs_attribute *xe_configfs_debug_attrs[] =
> > > > > {
> > > > > +       &attr_ctx_restore_mid_bb,
> > > > > +       &attr_ctx_restore_post_bb,
> > > > > +       &attr_engines_allowed,
> > > > > +       &attr_gt_types_allowed,
> > > > > +       &attr_enable_multi_queue,
> > > > > +       &attr_enable_psmi,
> > > > > +       &attr_survivability_mode,
> > > > > +       NULL,
> > > > > +};
> > > > > +
> > > > > +/*
> > > > > + * Per-parameter visibility predicates.
> > > > > + *
> > > > > + * XE_PARAM_VISIBLE_ALWAYS - attribute is always shown.
> > > > > + * XE_PARAM_VISIBLE_SURVIVABILITY - only shown on dGFX
> > > > > platforms
> > > > > > = Battlemage.
> > > > > + *
> > > > > + * These macros are only evaluated here, where the platform
> > > > > descriptor is
> > > > > + * reachable. xe_configfs_debug_params.h treats them as opaque
> > > > > tokens.
> > > > > + */
> > > > > +#define XE_PARAM_VISIBLE_ALWAYS(_item) \
> > > > > +       (true)
> > > > > +#define XE_PARAM_VISIBLE_SURVIVABILITY(_item) \
> > > > > +       (xe_configfs_subgroup_to_group_device(_item)->desc-
> > > > > >is_dgfx
> > > > > && \
> > > > > +        xe_configfs_subgroup_to_group_device(_item)->desc-
> > > > > > platform >= XE_BATTLEMAGE)
> > > > > +
> > > > > +static bool xe_configfs_debug_is_visible(struct config_item
> > > > > *item,
> > > > > +                                        struct
> > > > > configfs_attribute
> > > > > *attr, int n)
> > > > > +{
> > > > > +       if (attr == &attr_survivability_mode) {
> > > > > +               struct xe_config_group_device *dev =
> > > > > +                       xe_configfs_to_group_device(item-
> > > > > > ci_parent);
> > > > > +
> > > > > +               return dev->desc->is_dgfx && dev->desc-
> > > > > >platform >=
> > > > > XE_BATTLEMAGE;
> > > > > +       }
> > > > > +
> > > > > +       return true;
> > > > > +}
> > > > > +
> > > > > +static struct configfs_group_operations
> > > > > xe_configfs_debug_group_ops = {
> > > > > +       .is_visible     = xe_configfs_debug_is_visible,
> > > > > +};
> > > > >  
> > > > >  const struct config_item_type xe_configfs_debug_type = {
> > > > > +       .ct_attrs       = xe_configfs_debug_attrs,
> > > > > +       .ct_group_ops   = &xe_configfs_debug_group_ops,
> > > > >         .ct_owner       = THIS_MODULE,
> > > > >  };
> > > > > +
> > > > > +/**
> > > > > + * xe_configfs_debug_release_config - release debug-specific
> > > > > config resources
> > > > > + * @config: xe config device structure
> > > > > + *
> > > > > + * Frees any memory allocated for debug configfs parameters.
> > > > > + */
> > > > > +void xe_configfs_debug_release_config(struct xe_config_device
> > > > > *config)
> > > > > +{
> > > > > +       kfree(config->debug.ctx_restore_mid_bb[0].cs);
> > > > > +       kfree(config->debug.ctx_restore_post_bb[0].cs);
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > index 5f938450aed2..4a027ea2082d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > @@ -5,9 +5,46 @@
> > > > >  #ifndef _XE_CONFIGFS_DEBUG_H_
> > > > >  #define _XE_CONFIGFS_DEBUG_H_
> > > > >  
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +#include "xe_hw_engine_types.h"
> > > > > +
> > > > > +struct pci_dev;
> > > > > +struct xe_config_device;
> > > > > +
> > > > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
> > > > > IS_ENABLED(CONFIG_CONFIGFS_FS)
> > > > > -struct config_item_type;
> > > > >  extern const struct config_item_type xe_configfs_debug_type;
> > > > > +void xe_configfs_debug_release_config(struct xe_config_device
> > > > > *config);
> > > > > +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > > > +                                      enum xe_engine_class
> > > > > class,
> > > > > +                                      const u32 **cs);
> > > > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > > > +                                       enum xe_engine_class
> > > > > class,
> > > > > +                                       const u32 **cs);
> > > > > +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > > > > +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> > > > > +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> > > > > +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> > > > > +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > > > > +bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > > > > +#else
> > > > > +/*
> > > > > + * Dummy values here are not used since these function
> > > > > accesses
> > > > > are always
> > > > > + * wrapped in CONFIG_DRM_XE_DEBUG.
> > > > > + */
> > > > > +static inline void xe_configfs_debug_release_config(struct
> > > > > xe_config_device *config) { }
> > > > > +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct
> > > > > pci_dev *pdev,
> > > > > +                                                    enum
> > > > > xe_engine_class class,
> > > > > +                                                    const u32
> > > > > **cs) { return 0; }
> > > > > +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct
> > > > > pci_dev *pdev,
> > > > > +                                                     enum
> > > > > xe_engine_class class,
> > > > > +                                                     const u32
> > > > > **cs) { return 0; }
> > > > > +static inline u64 xe_configfs_get_engines_allowed(struct
> > > > > pci_dev
> > > > > *pdev) { return U64_MAX; }
> > > > > +static inline bool xe_configfs_primary_gt_allowed(struct
> > > > > pci_dev
> > > > > *pdev) { return true; }
> > > > > +static inline bool xe_configfs_media_gt_allowed(struct pci_dev
> > > > > *pdev) { return true; }
> > > > > +static inline bool xe_configfs_get_enable_multi_queue(struct
> > > > > pci_dev *pdev) { return true; }
> > > > > +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev
> > > > > *pdev) { return false; }
> > > > > +static inline bool xe_configfs_get_survivability_mode(struct
> > > > > pci_dev *pdev) { return false; }
> > > > >  #endif
> > > > >  
> > > > >  #endif /* _XE_CONFIGFS_DEBUG_H_ */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > index e22b9424f719..6e8ba6f85fad 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > @@ -32,13 +32,17 @@ struct xe_config_group_device {
> > > > >          * type, entries are sorted alphabetically.
> > > > >          */
> > > > >         struct xe_config_device {
> > > > > -               struct wa_bb
> > > > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > > > > -               struct wa_bb
> > > > > ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> > > > > -               u64 engines_allowed;
> > > > > -               u64 gt_types_allowed;
> > > > > -               bool enable_multi_queue;
> > > > > -               bool enable_psmi;
> > > > > -               bool survivability_mode;
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +               struct {
> > > > > +                       struct wa_bb
> > > > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > > > > +                       struct wa_bb
> > > > > ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> > > > > +                       u64 engines_allowed;
> > > > > +                       u64 gt_types_allowed;
> > > > > +                       bool enable_multi_queue;
> > > > > +                       bool enable_psmi;
> > > > > +                       bool survivability_mode;
> > > > > +               } debug;
> > > > > +#endif
> > > > >                 struct {
> > > > >                         unsigned int max_vfs;
> > > > >                         bool admin_only_pf;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > > > > b/drivers/gpu/drm/xe/xe_guc.c
> > > > > index c7f8bbd4cb92..bf7ca8f9d773 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > @@ -19,6 +19,7 @@
> > > > >  #include "regs/xe_irq_regs.h"
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_force_wake.h"
> > > > >  #include "xe_gt.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > > b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > > index ff8eee3831aa..9a6895377c17 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > > @@ -17,6 +17,7 @@
> > > > >  #include "regs/xe_guc_regs.h"
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_gt.h"
> > > > >  #include "xe_gt_ccs_mode.h"
> > > > >  #include "xe_gt_mcr.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > index 010499766fce..f4740de7f57b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include "xe_assert.h"
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_execlist.h"
> > > > >  #include "xe_force_wake.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > index 35b4e8289b5f..449cdd1e2513 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > @@ -19,6 +19,7 @@
> > > > >  #include "xe_bb.h"
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_drm_client.h"
> > > > >  #include "xe_exec_queue.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > > > b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index ab4da1d9a9f1..fd3eae45dacf 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -19,6 +19,7 @@
> > > > >  #include "regs/xe_gt_regs.h"
> > > > >  #include "regs/xe_regs.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_drv.h"
> > > > >  #include "xe_gt.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_psmi.c
> > > > > b/drivers/gpu/drm/xe/xe_psmi.c
> > > > > index 899b01f72ba3..59af3d145418 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_psmi.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_psmi.c
> > > > > @@ -8,6 +8,7 @@
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_device_types.h"
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_psmi.h"
> > > > >  
> > > > >  /*
> > > > > diff --git a/drivers/gpu/drm/xe/xe_rtp.c
> > > > > b/drivers/gpu/drm/xe/xe_rtp.c
> > > > > index 6a8d6ea68f25..62068189320f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > > > > @@ -10,6 +10,7 @@
> > > > >  #include <uapi/drm/xe_drm.h>
> > > > >  
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_gt.h"
> > > > >  #include "xe_gt_topology.h"
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > index 45d44ebe288b..1238fd018d61 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > @@ -11,6 +11,7 @@
> > > > >  #include <linux/sysfs.h>
> > > > >  
> > > > >  #include "xe_configfs.h"
> > > > > +#include "xe_configfs_debug.h"
> > > > >  #include "xe_device.h"
> > > > >  #include "xe_heci_gsc.h"
> > > > >  #include "xe_i2c.h"
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > > 
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
