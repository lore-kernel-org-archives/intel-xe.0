Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DC9C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 10:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5578910FA39;
	Fri,  4 Sep 2026 10:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOm/EVtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFC410FA39
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788517904; x=1820053904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wBuukTC0+ma/pwLP+9wpBxXZGKSs64KFNZ1gDL1uzsc=;
 b=gOm/EVtTOyBrQvxd0qvB841D2vLjMlKeFnFPlnFOmp8eDcCXTNlohJBD
 txWOOQMOpuoiYz3EE8qPER4uQY4C1vv1QI63u8F+1FPEIXOtf5HgSHeD7
 r7OzH0zTIeGpa5PmXCBFaLVLDuvToo7p9cF9FXMa2NWI1pNKUrdLZ0RXx
 Agw3tQGrTvPg4G94nqHX9sc1oA2Ivggi4O2iT1I82x/scXhqMmK7huVKW
 9tbrph1lTinm2MdoIG/64mRcYNELAlaN5v5Y3EJ3ujT+9/2MCBvgxVXwd
 xTOnKkX3SFW8dos9/KmEu1uwa67pEJq6lqhgQMdDYJtI1q4QPYu1mrHeQ w==;
X-CSE-ConnectionGUID: rwHoi6eATuuAjoRfx2IuXA==
X-CSE-MsgGUID: up3pJUQYQvqwDLxmSFWqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88864095"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88864095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:31:43 -0700
X-CSE-ConnectionGUID: mjz8yM4OSAWxDpoZGS/KqA==
X-CSE-MsgGUID: r4niEe7eQjmBlfeyxnURBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="271944495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:31:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:31:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 03:31:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZsT7GbTn+VpD/eE7QsmLzbvG7ITpQLYDksH3t43rrmbFdTDhgIYU3Ys4N0bzy36QB2nIZVAJ5b0pWU/L1/89EdJjZkkoc5hlaihmrCT26a3XLhH/BFDLeQNqaK4+31Mf0krA49y32GsZqomMwkMD1pCp+eAMqfVwMDQ9ulfsISu0s9sFujGN0bkLfedbOBaJ0XVFvh+WaqBuWeUETDKm1GeIKD6BQG/wv/U7hSTjYQMGZ9F2IGZ9oTNerd/8mzsvDgwjEGXt4uVsZWYRkq3SceSIIMGfPsRXh50p7NJzk7EXFIVrxjo03yaBnW0Rzz0NIHPjFJE5V/vGmcrGsua7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCdlgp5lgemcmTRakO8rEnWlGhfdKaTrxXem33ZxCSc=;
 b=r2y1nrAAo2vhybs8MAQQeTFiu60jrE6RjDYf+g5ZcwInztYdGSVU9W/mX18IKY5JtfKIioi7HyxxrO1TtfpcT555K7i7IhhQBKcd85Fy930pjoG+8QlAJd9rHN141X+u48xE13jqZhdw1CR6YIiue6GKjTsC+rQgjFIRVNW1o8yVysmyqz2FERTtuepE9X3w+ZP8F+ZNlcCWetJwq5SyERtEcufhasUWwkf+rvSLmp/rptMoD2Xw7AuiwSGF9t6ajC/Ja+HnCsg0U97qWTlGKJv9eUHkZA/2N2AtkyjbVKbKUvqc168qw//lMRiUtyEyESYyEey3ruM08SaVRX9QYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Fri, 4 Sep 2026 10:31:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:31:39 +0000
Message-ID: <e2cd7c18-1943-4c57-bdf3-99ab82e1819f@intel.com>
Date: Fri, 4 Sep 2026 16:01:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-8-riana.tauro@intel.com> <apGlsHhoC9ig7olz@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <apGlsHhoC9ig7olz@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0258.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a01da29-ba9f-4cd5-b9bc-08df0a6fb404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: anQblUBpUlHOPD67j1YSLKxh0LEnrKtKtDwz0LDgQcCPqklNZzPMxeCR/zmEPEmMqono3ca7HE88LUXVl2uTQzAj7aT/K25NRgvaEFFj4afEvRFoWbNfDHAvOVKFKfgNKh+TG/y0A2DSGZXpVw3eOXGoPpqi4eh1lU0nvY7T3afWIcnZD6o1uEm6r5lcE4NfBp+fBZOM37nV+jXgLSgVQS6ZimW/lrzcNjMNoN1Ckn3ERB8xKwVPHRD+Kg2VvrAvN39fPlWWHPJpPZkDsAQWHkptIrcsQfqYPbz+SI6lvlPNTf7U7DpX1gJxAHglzkxeo0AyA28lZYGDiO2uH4jtyTLGVrIoQHBXZvaDTK5XdmIV2wBWiilk6o62SUwOErMR2BjoJ/aSNHm46xqHRGE9WCdgliiuirSoH+/86DguYNHnyPdxc/IxwyZy6W2tt2qGL/wFm2EMMJR6tcZ8eD6g9sdLAXRoMaiYA135kRoyNhoDiGWgtWSipRNGxudGmiwFrLR05UEDh8KbHxqh7y9gNGe10YmBZW+H4J0arOwf6e4MU5hqPzsLdw1W1BfgmnTAfUGNRR3U860EZSiX473AbSIS/isUkOW9scp56LE8r4Pyvhjr1oXzr9raa0QozRkboVSZDatl+Sz5axqDYgIHVXSEd83OE/yFkXZKC7fa74c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVg4YzBPRXhnT24xS25nQUJ6dlFXbWc5K2t3KzJ3NTV3ZnpHUkh6N1BrcklY?=
 =?utf-8?B?U3RtTGhYWTZSSHg5UUllUnZrQmcxd0V3aXRlY1c3ZUtPKytnSTN4ZGE1VjZ1?=
 =?utf-8?B?YTZQOFZvMkxJem9HQ24vTzRRSWFzOVFvSDZsbVExckxHcldUck1iQlJ1OWJa?=
 =?utf-8?B?WmtuUXUzVCsvT01oTyswelFDdkRub1N4bC9DR2RiN0kwRXdKQU1PbmVtZWh5?=
 =?utf-8?B?bTRjN3FadEs5WGg1OFBsNTBMbkFEclBiTGlpREVUNW1MODNwNzY5NzUxWEN2?=
 =?utf-8?B?bGU2T3hXRnJUMXJ0RHVGMVAxZmd0a0h6cy9TVmQ1OFZzWUpNdDZ3c0xSLzMy?=
 =?utf-8?B?YVNTNkFyNG9wMklEWEpxL1dGUFNralF3SExUZ3NZTjh2R2h3SW5NUnpWaGsr?=
 =?utf-8?B?dEh2b3AvenlrUWVScUhWUG9tMElGVCt5Z3ZZbExBMHlnUTd6aDVPWVAzb2ti?=
 =?utf-8?B?TmpEM0lVZjhFZndYR0xHMTVTWWFJV1FZUU5pbmpWTkdhWW5FNVZ4bi9FOXgr?=
 =?utf-8?B?YW4raHRQY2ZSUWIvbnVNSFhkd0RYL3J1Nk5uWnptb0RHVy9ld05SZm00WUpT?=
 =?utf-8?B?bFFHVjYyMVpIcUhhbWlIRGxESUNmU2tiME9iT3V6bHc4U0FPTmRTQWVaZ3k5?=
 =?utf-8?B?cE81TkE2cEliRDlLRmFObUJJaGQ1akNMZG13WTJXTzdkWTB3ZDVaSkMxbTVM?=
 =?utf-8?B?dTFmVFVxcSs1TDBSUGYyVkUzaXJ5MnkvVml1TDhWWk40Y28wdWdaVUszZjZG?=
 =?utf-8?B?QmoxZEZFMXpjQTMrdk1tUVdWZVZCblNrcmxDZjdOQ2w4SnRpL1hWMTRpc0s5?=
 =?utf-8?B?N05rQ3hOZ0xuRG56T0tQNXphK2V3MkVmMWJLc21QdVdFaFhHcU44YlptbGxm?=
 =?utf-8?B?SzVPb2sxSVBLd0p6dVZSc1dPY1YrME1hUUhNSnFJOGdXTTVmRDdNSXNlTk5S?=
 =?utf-8?B?cjBaK1E3QmtLdGo2cnRkRUNpOGNuU2o5WXZRcStxTWE0SzVoOCtSWUF5L0VD?=
 =?utf-8?B?elNDQ1E2N1UxSlh6alJCUjZTRGlvei9vejI4MjU4WDZYdG93ZkRoNWFhSjBK?=
 =?utf-8?B?NFp5MzU5ZUgvTXZ5bDVuNXM4cXFxcndiMGdmOWR4ZjRXd21yVk1FRkM1YW0r?=
 =?utf-8?B?U2loRWN5dkpmSTR6Q0xUck1RODA5SFNTU0dwS0o0dEROUER5MUtxRzZjcDJq?=
 =?utf-8?B?VEJrWHZhbjdYczR5dG5IUXdEZ2tvV3dGaXNrazFWOHluR1Vsem1OTWVhdDFT?=
 =?utf-8?B?ZXNEN2ExUi95VGtERkpWRGFKQ0dMQmJFa1lFa1pUb2ZNSC82NVNCelEzbDZp?=
 =?utf-8?B?SWIxWitmYW5tNTM4ZkcxYzE3NHM5M2cvZERjNnFQZ1lKek5KYWNuSXk1SDJx?=
 =?utf-8?B?Sjh0cjNPQWgzMjhraGZ4cTlBcWlxdFYrWjVMaGUwdGR3ZW91U3Bqdlk3RHJG?=
 =?utf-8?B?K1RYVkJONVhJWGMvWHNqYmZ2TmVjZVpzN0M2WmUwSTRzSEQ2RGhiVUVUM3Yv?=
 =?utf-8?B?OGcvOHlnSzBTdTJzTEFodnFheHMza05oU0F2cU11RGc2ZTdzenpWVGh5VVl0?=
 =?utf-8?B?UzZnenY5TksrUlVkL0tXSUFCcEs3bW1qODR6V3FKT09kN1pqZ2JhbEtYc2lk?=
 =?utf-8?B?bnBhWDZyOWxCTytrUURhRmUyMjdZRERDTU0za1BHbkowQUh0RzRhVlBsZll4?=
 =?utf-8?B?bStEYW0zRXZZQTFBNE56Ukp2aEp2aklEWjg4UUtEajFueUpSZVFPK3dqVmw4?=
 =?utf-8?B?SEtxMmVTTk9qT1p5TFQrNk93dDdBMW1hVlN4UnVnWnp1U0VmWTYxdGoxZS9W?=
 =?utf-8?B?Yk5ScVJ6anNQRlNVMGJQRVZpSFg4TVh6T0grdE5ZQytUajBCYU0xRUlnemNM?=
 =?utf-8?B?eVY2dXZxMUJuZjh1SlBYbHcwQ3hrci8xR2tKZDdmakVvWk5BM1BtRlhBZVEx?=
 =?utf-8?B?TzZBSFVQUmdaekhDblRWbjZUclVrajZWdS8xQk5RQXZlbytqdytObXZRdk0v?=
 =?utf-8?B?MkRPYVNxQ0lsRlVEOXpyUWRld2MwNUxEaVVVWjlmbDl0S0hLQ09qbng1UTdt?=
 =?utf-8?B?bUwxZ3AwRzN1VWpPdDVSTjdMNk9FQTV5azNzaW9Md0pNMFJEMWFGUUhaTkNZ?=
 =?utf-8?B?RjZqYm9sY25JbXB5WWJmZ2ZYbWRUK2dUV2NaSDR5eWV1ZTNnUnNyanI3WERu?=
 =?utf-8?B?N3JEeW9WdGJ5SWx4bGFpTFpXSFRoSTA5SzM0YllMNCtmVmJtZmFZc2lTMXVX?=
 =?utf-8?B?WXlRZmZXMmNtbkFCTk1INUllMEJwUEovakdLUVdBNkw4U1BmMmhCMlRveWNM?=
 =?utf-8?B?bkdVc2RqTXh0RE9CMFA1cHlKVTZEcTlLWmhEY21jQlFVYzVmRkhHZz09?=
X-Exchange-RoutingPolicyChecked: J2Mn/I+IHG141pUhI2rASXx63WK2/LYfPxO0GPqFAee4ZJtx5NiAtirEJsRwpWwAie1dWc8HW4hxhByDyEnFr6bMnans6AS1iUFMUXEvKl8OCfJ0I16ZHQOG1pYALrEccZOSJnuLN+GE/ngWhKWKTpmI23ECZY80ovkzIWNAwHrKqaw5j1lkgn0owQNaP/pBFoFH1Kyyz/WEdV05GilwR+C0FM/adIbnPMK+OAbsW3HhF7nhu8I+gn7cy+x+OQTItMxybC9EqoumBzoOZ3cyFIhG4DYxiX0kLpx2HBpSiiZPO48xYFkTxpajAwSFZShmw/i2CGPzAb/mQhDvSW6nAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a01da29-ba9f-4cd5-b9bc-08df0a6fb404
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:31:38.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b83XVbRN2RoHu3LR8IC3jkrU7Fr/HiQz+KMs4w9m0ARup3VLAcubllzApXFikPvSv51iXMpKGzW6kFXzhLTFGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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


On 28-08-2026 20:43, Rodrigo Vivi wrote:
> On Tue, Aug 25, 2026 at 12:06:16PM +0530, Riana Tauro wrote:
>> Rename ras to drm_ras in xe_device to distinquish drm-ras functionality
>> from device related RAS functionality.
>>
>> No functional changes.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
>>   drivers/gpu/drm/xe/xe_drm_ras.c      | 12 ++++++------
>>   drivers/gpu/drm/xe/xe_hw_error.c     |  6 +++---
>>   3 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 180d450a6deb..1494f3a6c62b 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -550,8 +550,8 @@ struct xe_device {
>>   	/** @pmu: performance monitoring unit */
>>   	struct xe_pmu pmu;
>>   
>> -	/** @ras: RAS structure for device */
>> -	struct xe_drm_ras ras;
>> +	/** @drm_ras: drm-ras structure for device */
>> +	struct xe_drm_ras drm_ras;
> perhaps xe_ras ?!
>
> drm_ras makes me think this is a drm level structure...
>
> but I would keep this as ras and change the ones inside the functions
> if/when/as needed...


This is used for xe_drm_ras.  Wanted to add a different structure for 
caching sysctrl
values for RAS as required in [PATCH 4/5] drm/xe/xe_ras: Add function to 
get maximum pages firmware can store - Riana Tauro 
<https://lore.kernel.org/intel-xe/20260825063615.3697317-11-riana.tauro@intel.com/>.

Will rename the other structure or embed it within (struct xe_drm_ras ras)

Thanks
Riana

>
>>   
>>   	/** @i2c: I2C host controller */
>>   	struct xe_i2c *i2c;
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index 78184b6ea7d4..9f37ae732770 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>>   			       enum drm_xe_ras_error_severity severity,
>>   			       u32 error_id, const char **name, u32 *val)
>>   {
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   
>>   	if (!info || !info[error_id].name)
>> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>>   			       enum drm_xe_ras_error_severity severity,
>>   			       u32 error_id)
>>   {
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   
>>   	if (!info || !info[error_id].name)
>> @@ -110,7 +110,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>   			      const enum drm_xe_ras_error_severity severity)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	const char *device_name;
>>   
>>   	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>> @@ -156,7 +156,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
>>   
>>   static int register_nodes(struct xe_device *xe)
>>   {
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct drm_ras_node *node;
>>   	int i, ret;
>>   
>> @@ -196,7 +196,7 @@ static int register_nodes(struct xe_device *xe)
>>    */
>>   void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
>>   {
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   	struct drm_ras_node *node;
>>   	int ret;
>> @@ -226,7 +226,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>>    */
>>   int xe_drm_ras_init(struct xe_device *xe)
>>   {
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct drm_ras_node *node;
>>   	int err;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5f2abc9485ff..90b73077ef41 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>>   {
>>   	const char *severity_str = error_severity[severity];
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   	const char *name;
>>   
>> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>>   {
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   	struct xe_mmio *mmio = &tile->mmio;
>>   	unsigned long err_stat = 0;
>> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>   	const char *severity_str = error_severity[severity];
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras *ras = &xe->drm_ras;
>>   	struct xe_drm_ras_counter *info = ras->info[severity];
>>   	unsigned long flags, err_src;
>>   	u32 err_bit;
>> -- 
>> 2.47.1
>>
