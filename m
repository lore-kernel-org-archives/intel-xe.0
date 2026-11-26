Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C3606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=je38dmXT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EynSi530
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1AD112259;
	Thu, 26 Nov 2026 09:40:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03A0112259
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686019; x=1827222019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p1Ap86V+Lo9gtRIiFV0Yy5qZL6GlzdZeoeaBxSicvLQ=;
 b=je38dmXTvFDf74p8XVITHOrH8UARbiZRlWVQnIuY1d6vNVj65sTyBa5K
 k10UERTWH99AV1I6GVAURA7z2S7xC1SKe1V63w/ZTRF3GugP4Od7YdF91
 MntCnYV9oCvxB28YFqJlTvI5wQs6b8vUzEELsHINdC2Lj1+ObQovz9JyF
 qTRDKoGKOrhU19JClkgRiiJYFV62xZe8y/Mw0E4URySQk0NXwdTgR7p07
 rBOHHKE96Xjemvf4tELKL4tzvymjkrZIPOWtjJV82kN/ADcz7v+PbBWbi
 Lkp+ha8feWv8E6JdbMzg70z8kN+Mt1LfOmP0Pf9qIYQyHDM6hmaKpdML7 g==;
X-CSE-ConnectionGUID: kz6F+3ciTm2KPFV62/YCdA==
X-CSE-MsgGUID: sC248w1gT1Wx9kiWoiwnvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4587802"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4587802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:40:19 -0800
X-CSE-ConnectionGUID: wkPrNDoJSM6gP83rtFKhWA==
X-CSE-MsgGUID: 2QnPFKZHRuS0ciaxPRZ0nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12416520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:40:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:40:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:40:18 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT9lv46o2N4qZBgPtCM5gdb71mNHubKetHhDOkbRNH5KFe6dsU9+qEYdHwPPE1YZ8S6OraWRV/7QrmgsBAP+R6TrFvqJTpeR9kzTq4FCQHDOyUE6iDMqsfQgAVyTGG1SP0D7y0z3wK9nsh6la4UUGJkMPbBKa0ITGeSR5B9GjaqcV5u8PFLnUscFrxy+Zj5QnOO6yYScIGhP8yW806MaFizKkvBtyJG0OoGl1eMH653mXicUZC/K3G2rJYHSIc8gRvqFPEPctFkDYLr3m6V/nZcGSaOoJZE74BQhsbGK6sit9rLPyJTZbZ8H9a492NSCoq6dSaZ0LFlv+9AEiwdH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxFcSOJRUgHepkws12EPMkEUigFa8VarEI0QwH+NQpM=;
 b=MNjPauTiBogHunAaVGLZ1XTTM9WzvJHagamjLd+r+GBiWEbN0SwovBFFBJpmbs+gnCW5ZkqYVMF97OAKtPPDdHsmfHze05fMV+0qkSi+KqpueCQ+y6gbUIm68oeZHvusq68CHteVWgWCoWJcd2EpfTkH1QjBzmvVpsaJybgdriqbtWAlSaP5OlYHwRS3p7ZstlRfG9oPq120UwYzhWV94MMLHT27R9+dRcj2uYcUvtSJ6UN/Pcb20w62gDE5nQHmiACqQJihA9HldzKyUtUpghcXkMN58P0YYiOH78peNsJseX+bS083thlVmUilYkDX1Fx507dOPa+GXpNsKD0VgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxFcSOJRUgHepkws12EPMkEUigFa8VarEI0QwH+NQpM=;
 b=EynSi530aucu+Y3CmJkaLe8akFr+XoaFtH8245qzbsjh46KhtuloWlePoTRval4yeqnWe3saZLFyC7CW5N3SkxgOMd1s1uu8GvDs8SCttA5ofOUjuZQ/0/rG3GUFP2yvGeE6UDhdpkHQmRqcUGYsHiCjdqoripNDZTkC/fDJTek=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:40:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:40:16 +0000
Message-ID: <776cd78c-27d6-4f4c-b351-851b7d384a42@intel.com>
Date: Thu, 26 Nov 2026 15:10:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Skip offline queue processing after
 device unplug
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-8-riana.tauro@intel.com>
 <awf7DtksUhNVbRDa@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <awf7DtksUhNVbRDa@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: c113e9fa-be9c-4848-6c47-08df4ba146ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: NPsHclz5PX5txDK1ArVvrAlTD0+4h47P9h0qLulUcEkG7jMk9zp929z9ORM8nZ/vR7UyAIKWr6yTkZdUmP4cfCMzOx/QBaGlmNlsIcXjaJwc5+cxEfDHurNJHAbyiLkSY8KWfWKEhKFJ0tkeJwsA3fRA2SaYuhIiIWdKrPKY7iHpX0DRM1GtGrRzSM0JTjRwp1igNiGSrXEmtOwKKNJc5h8fEuPQw7vWNhKf/WqgwciwV3oqzgyrfKkOS1wIYX/1fjJZ4XNVcRZkdamJDxzKXpmB39DXv/kXg/VciBnck5Y4+S2+fCoyEdLGj65bfqdinTe5EHuHsZPagHiUge+tgeP1z4QOTIFzwC8/AqMz6hQLVYYANYqglSMtMdnrCiJyvtjo29S/U71baAK2IM9bRE15qajWzqBeQOdKczUwEUe+wEPwY+M8BWQx2gAyHTX9Nhxp0SGpN+oopqUlI7aw/odtzILhLkIQuuhk8HR1yQRDet/b8eM1BWBmgeyRanh7uLJjly7wYcEymqhtCxqBuK//8Cyqg+JinSEwBtHvqLx/gFX4HQ8QPKbRwrBMrDIDUtHv939Jow4H4L/RtOqoaCR7nzSm7q9Z6fUMyn3worl+68t8QF+TGyuHTV7Fc6u5ecBKGHk9hgNYH9LD37/uuo6t1Xoe5LFAFGdG4UnUSCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjdFYkwrTGRaaGJEckZucnpHRnJTL2w3Sk1VU1UvSTh3MDRDTG9KclhjdUlY?=
 =?utf-8?B?WWZueHhvNlRTRjFVaDBWQWVqNVlKZkVNK2J5RjNrZmc1bk0zWktDYy9qZUZQ?=
 =?utf-8?B?Q0M2ZHVyWVYzeEF0M2c5V2xFTjNWVjl1eGxrWkx1clQrTnY0RExiY0NTSzZ4?=
 =?utf-8?B?VUkrU2o5cFNoMjJIdTJvbVBGS3lZWHNKb2oyWTF0WU5HR0c4ejJUWCtlMjlH?=
 =?utf-8?B?NUxyODI0YmQ5NVRKY0prZVRiTFBGNmtkcDZ6b1V1dUFCUXV3Um1LVm1ENXdZ?=
 =?utf-8?B?by8veWNQazViMExUckRtcTVYM09ibk4xZ1JSbjlZNEc5TEdKejIwZEFXWGZj?=
 =?utf-8?B?SGhxWXREbm9YMmRrRWtYTU8wVElGOWVQQmdxOUowSmFoNStEQzVZMzEyTDAv?=
 =?utf-8?B?dDgvdEtDeUlqdHdqR2IzUFEyYTFITERhS1Y4UVNoV212RkZ0bjBOeW1KcXNr?=
 =?utf-8?B?aXhweFk0M21sZkVXdnlWTmY4eGdNUldINWRobW9IU2owM2xiMEltdm00dkhu?=
 =?utf-8?B?MkxONnRYT2wwZXJsNWllL2t2NytLQXVYNlNFdE4rZjlPRXJVank2Tk5oL0FX?=
 =?utf-8?B?M1FKOWlDN0N6K2hCMFcwcFE1VGJhNUQvNXZvYTRXdTd0TExzS3NqNGlLQjZr?=
 =?utf-8?B?cEsxRFdOa3VHcHp6TjFJeGxtOWJ2ejd0OEY5cWRWWnprcGNkb0dhQUNFOHo5?=
 =?utf-8?B?bmxVeEhzcVgyQjZLdmtoUklqZmdQbXYvdVhyQjY3Ylo5eHhPTjdrSlVsbzlZ?=
 =?utf-8?B?T3BZMlBSWmdGWVpFVEZKODBMTzBRcllWazh5V3Z1UVBaSUtZSG4zY3QyVWYv?=
 =?utf-8?B?UFFnRUN5RldrVWt3cE0rRUUwZ2JUYUtQdEhLZmxYVEZpMGNISStmS1hhRWt4?=
 =?utf-8?B?Q0lTanN5YUhlMThzN1lVQzlHNDNUbFFXUUVWdjRZYWUzeVFnWWxxM0ZZZ2ts?=
 =?utf-8?B?ejhibEpLenNXd2xEZlIrNGRPbFhsWUlFWStWV3NIRVFGSjRyUlVSaHRHdHUx?=
 =?utf-8?B?RFJ2UXJqSmxaeHRCa21DSFhUWkJ5TEdaYk1qNzRzSHVrRlN6eGd0emU4U1Jx?=
 =?utf-8?B?Ujhwa1BBakoxR2pkNkZabW93Wndlc3VVRXkzQXM4ZFNJVk1ybnZBeGx0Q3hO?=
 =?utf-8?B?UFFKd0V6OUlUazJLUE9EZU9CRzR4d2EyS0Jab05jYWJONTVaaUdMYU5ZaXRk?=
 =?utf-8?B?dVNxYnVaemk4K3UzMEZOOUk1WVVuUGhvdGpaS2k2U2dSSW8rTlovNkNSdExp?=
 =?utf-8?B?NlJMVkczK1BpaUlvRjFpdy9JVitJTmFwQjRTTzJ5VFB1SWhleGFGTXVVQW5W?=
 =?utf-8?B?dGdBU0F5djFwWlNaMFJsUTVmRGYyRmZQR1VTcXQvV0FIVDE5cytpMEh0b0Rj?=
 =?utf-8?B?VDAwZGxjbm83REFLM3NxNlUvL3NnRm53SXcvb1FiVmRIdmpDeS9VSUpXMTNZ?=
 =?utf-8?B?YmdNd1dXU2hpZm96T00vcVpSV2VnVVRvMVBSdm95bzJheXIvMU1henhlM0Z5?=
 =?utf-8?B?Y0N3NHZ2emV0SFRNR2o1RXBxZGFnMGV6K1B5SU5EUzlFYlFrQ2FUOFBaclJR?=
 =?utf-8?B?WDAvUEMrUGZWNDFuU2wzc3JuWkJMcTBvc2ZLYjZNeUYyb3hRUlJFc09jV2h0?=
 =?utf-8?B?bnRVR3dua1RmVE9kanlKWTBjbk5CVC9jME1NbU1FQUhpU2xPZzdQTzZaL2Nn?=
 =?utf-8?B?djZ6ZU1mNy9VemdnRFlmNmZhcS9SdzczSFNhT1I2aTRINm9lQlNrS0FlN0pG?=
 =?utf-8?B?U015Y3FneC9DVUQ0eEVCd0FabnVzRXgzZnZxdEJBcWVqckg5eW1GT0FNVTl6?=
 =?utf-8?B?TkVIK2Y1UnRRamRjSzRVWTFnSDRKSkd0NS9xZlRFZEh4TWg4aHVWY1hVUHpZ?=
 =?utf-8?B?RHdodUdsY3FsZDQ5blAzSENVdXNucmZNVHNPWkVKeVpQcEtvZWVhdTVtVG5D?=
 =?utf-8?B?T0xEYkpQemNDRitBYWVLcHllTVZHdXByZ3NiRHhNTVhSeUw1M3VVRHJyWFli?=
 =?utf-8?B?RmNFL1FGeElVakJTQkxJOG4ya3g4YzdXWmNTVXIza3RIZk9FczNWamZmSHdS?=
 =?utf-8?B?dGhzakJoenBsL0d1KzFRM05ORTdCU2JwNDdGRldDQzFaRWVIcVArWWczL2RS?=
 =?utf-8?B?UEhZeEsyVElZRVVkSHEwQXdYZ0FPUWFjbXU5NDlIeEdEbDRHNFZmM0tEbGEw?=
 =?utf-8?B?NWRrODJHVzJmSGUyZEh3UUY0QzhUNUdhQU02WGUzRVRpNkVuQVdVTjRVSCtE?=
 =?utf-8?B?WXBldEJ6UDRGRDlPSTFmQ2ZxZlZRamNHdnYvSFJneFM2cmk3bVJRcU1KNDlH?=
 =?utf-8?B?aEFPRXdwNnlCTVRDbHVubEdHNU9hUEtCRmdtWmhjNG01QUZWTjRGUT09?=
X-Exchange-RoutingPolicyChecked: Rjwj5BD93G+nsPA1r1+rTT0DdO2SMB045bygtLqmFv0n7Z/OUXwr9msZ7RdinBkiu9N7tIqHDnf7ioljGXz7+VtUGnvPYT49vzupq8Od3oJ3gkypKAlCTWNLAtNIcKi2KfbWlqP2emGGpX5OBexoyVknh9teF9N09NPAcnlqemZjISR/LbcBKThuNZ5gVzwGZuwtE6DMy1uEoBslVvBhGphLr1B8LVgPXyN6JezfDgeN4FZikfaFXSGcGQoS+R3UkqVWRhUgI+zVCRlZz0lmmPxZ1NFhT6xgp2T1csWOBoVtULjeInX8K1/zZIRMEnG4WAxeIO3bAXjp1rHlDB5/nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c113e9fa-be9c-4848-6c47-08df4ba146ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:40:16.3551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOohggtEq/Aoa0PXm4fWdHHby8jOhBHOmD9caMb0V1kFunIMHZI+LXqyD90rtO+BIFj3hMLjcjJM40eG6vcRjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-11-2026 14:55, Raag Jadav wrote:
> On Thu, Nov 26, 2026 at 02:05:20PM +0530, Riana Tauro wrote:
>> The system controller worker can drain the offline queue at runtime.
>> During teardown, devres runs ras_fini() before sysctrl_fini(), so the
>> worker can still run after the offlined pages XArray is destroyed:
>>
>>    CPU0 (teardown)                 CPU1 (sysctrl worker)
>>    ras_fini()
>>      xa_destroy()
>>                                    xe_ras_get_offline_queue()
>>                                      ...
>>                                        xa_store()
>>    sysctrl_fini()
>>      disable_work_sync()
>>
>> Wrap xe_ras_get_offline_queue() in drm_dev_enter()/drm_dev_exit().
>> drm_dev_unplug() runs before devres teardown and waits for in-flight
>> sections, so no queue processing runs after ras_fini().
> Considering the current state of affairs, this is going to become more
> and more difficult to manage. Rather, introduce a ordered workqueue as
> part if xe_ras state and schedule both sysctrl and hw_error work on it.

Thanks for the review. yeah makes sense. Will do that.

Riana

>
> Raag
