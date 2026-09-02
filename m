Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46923C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E498D10E476;
	Wed,  2 Sep 2026 07:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgqbO+G3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDAD10E476
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788335303; x=1819871303;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0z4WGCdzwGc7z5wnaHsfaxdN3yUdteERorzHim7TDPU=;
 b=FgqbO+G3TICfG5cvpzIIlFieUgk7A5ODsDGOoSoax3Ep+XHFWVk3IhmS
 npsVy4WD/bq9gC+s/fz4giA/9jme5l0NIuc3VrghSw6qmUOdz85sOqkeT
 xn6tCv3iQjj2upZdaovuhyzSdyA4cg7q5DzgjUPWlvu1DQ6xF5aJ3p/pE
 iVb0AEHaWvCdPfFmiuqT/2RVYBgGj91KpZAwYGNu8Mfe9uumYfWHEu+zK
 /+y7XeN+inCtfkrtMK3BChD+YORArX+/3ytV3o6hGILeQy5YCC+WZ3fm9
 3WABQqBI6o0x4jpONHo9QiDcYPrlh971QWxLtDdalRIoCyTBKNW/71UPU g==;
X-CSE-ConnectionGUID: 9/1nSWaHR1ODLmm2thyPSA==
X-CSE-MsgGUID: ujv2bU19Rbmw6qBf1hf9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88907658"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88907658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:48:22 -0700
X-CSE-ConnectionGUID: eSWwXdN8RUmIO7rkcUPd5g==
X-CSE-MsgGUID: tw4gYlwATJG1tedQnf7e3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263187750"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:48:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:48:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:48:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG+NMBL68L0YxMGF+fDZaYCi0KM+O4PPzlN13DfVIAfFjhkoWMtUzwb0MK3vsGJO+Ol+WxohZNaWEUlmynkIGZiuTeOME4IVFdo2hnh7ZyPip86mJaYw9gO44Sc2mzwHDM58c8iaAiTWq94rbh1rL32zhFy0Z8oHgPrDQr/8dHtC8oZmL6E+uHremGMDisT3LO9mXBxyUfFdhSVXGXJBwFjWodCTpdLE03/05w1p8V0DtiFGUzUGEqFqFrsKArTOs/ovlLjTx7ZZk/IA0c5xcnV8wwU8eAADplFxoyVI+PuqejmMKCs9pYLOQ2p6nqIbjAztuOeb/DXuakjjLiXcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GKrZ9MyyNU0OSLeBNksV4pVdRyuryEfcXDtoEKtOLE=;
 b=T0fL56kDwGhW8TheyzcMHHB/t4819H1r0dE5I02/7Fh9a2cW8CAagRq7GoVV/HTy07Zgn8m1IYtFlSwxdz0ncYF0APsOt+zyIs1Nd2HpbBfqdxXqdtd0iJnH0WY0ACF/Ek/lCNgyepi/Oe9D9BaBIQuvSBRpoBBD5SIUhimTzJB7MJGQSZnN+iMUj/2h0+IcY/Z2cnVifhBCg6RCLGiUWNkbvuL3Xj7C77JoAv+oQw+Dh5cagxIeMSz7DnEGx+/RcXaEOLgzUUFntFo3i//cuHl8sKTwuFvBHbI1SdveTtkuiXyR9mVJBkrqlhq3Z1CFsevQDMwkL/Mny+xvsxxQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:48:19 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:48:19 +0000
Message-ID: <60440809-b54b-4f69-956a-9b19f266b28d@intel.com>
Date: Wed, 2 Sep 2026 13:18:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
 <ao73w-lIBkSnYtot@black.igk.intel.com> <ao9KfzpqNkQHWq1P@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ao9KfzpqNkQHWq1P@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8680b6-88d9-4bab-d916-08df08c68de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: sJFmcwSJqTEbMFHFu7dwT5CU8nMrqeenE+RFKlw3pLz6ciFL4inkJjWGQNXL5pPwKclZ9KyPgxC6qKxryS6lOfwLBTKqTgkCT+q3skzrW/G+zuKJnuEwTtDoSNX2DL7zeHtDj3UUTdhRg2U3H9S0DM4wQNu0dHODuCreVDKswU+Btynhz8u1b6ZB5En7rWu+XSbaBbj5xumoo3aclwuvMM1yxxrIy+cqQNXyr8uLh4P849YJuiglIUEnnNkGQuPywrVH7FA4N0OCK2ytJ+L4knxQMgB+AgdLbAeZ9PNlAiuEj+TVUHXfc5NOuFR8j6H7ffScoiOlxwbl0t9hCQEUVDB0yyaIyVf50DcAXCNcR+yG5PWndaRVxyaNIQqZJWRj6oEsBMXF4+WJrzPZLeP4Nn77JGT228dZGcPsaB+ggxFhJmYehg7E+1CUrQYoTFCj1HJNupFEmHZKwxVcHTbEdfOR9p1QLMlNK8JiTqqxct6GC1GHp53CX6UNSXCg5eHn8MQu8zm93266uC8AIIEWfaKv8eaSTZY/X8obdvdROs8Dg0z94BBTIjyJWfE0UnDO4KCKfAZU6h65MmvcX6hgAtyt17otBM71KSZvF4oDBAyJXTA9CpdvXs+AVf8Ovq5Ay0P6+2lQNgFuqonCnOHlxZ2XNfuhqdyGTh8k1ygxJMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZ4T3piVUFGcWE0WmhvRVhqRVVOalNuUmx3TzI4STlWOXcvY0lrV0VFaDgw?=
 =?utf-8?B?UWdhM0pUVmp6Z1U5MXUwMjFiRVl3S3lONzFZVzJqZk84VytZWHdyS2lsc2tL?=
 =?utf-8?B?RHFFQ0dJajN3UEJoNXR4ZlJVWDhVMDNLeStYQktzMEs5RzlwamVGVGo2SGZs?=
 =?utf-8?B?N0E4aUxscnQ4WU4yZmlON1FxcEVPOGVSUjNicmhUbDlUdmJORnQxOGUvVGRG?=
 =?utf-8?B?QVhSSVp4MENUSWtadnJWVUVxMEVxSXdnWStubTNpYVE0L0piVStIUWRiaWVI?=
 =?utf-8?B?TkhSNW9zalE2bENBZDA5Mm9pWXQrVFBqa0lKVnUrMjI0RWhvOENqS0dpeWIx?=
 =?utf-8?B?MmhXM0lZY2RvQ2JoTTZsc1JHZkxkRmNXUjZrM3AxdFQyMVlnQVZkTVFSN0ZZ?=
 =?utf-8?B?VG5wbkZpWXA1R1lqeEdkQWdtYkZpM3ViYWdzVjNCdE8rRHFUYkRpNXJFK0NI?=
 =?utf-8?B?VDN4RUlpTWw0S1FKZDhnYktLdkFOOU82RlhMQnphR1V4RS9DV1JZbEcyZWNT?=
 =?utf-8?B?RW5Vd1U4NVdOMWRkakhiWHJKWFBKeEdLeGhmTFUreEFYc2NuT29SOWdmSjF5?=
 =?utf-8?B?UGpHWlZ3QWYvQkRWZVlabzVoSDBPZFpLNXVMOUdKNkloVGFJSE1yR2ZheXVC?=
 =?utf-8?B?UFBMQm0wdVFsMVhPc3Mxejl4eEM1WVFqbGdQNTVCeUNqaEFJbXlqd1g5UHZI?=
 =?utf-8?B?eTllV2VDS05ObVRkdktYVXhYblIxcHZ3QVJpZE5HYU56a3dqZXlkZW5FTVYw?=
 =?utf-8?B?UHhpYjErdUJSRFpadEJVZXlieUJWdXhZZ3lSaVI1OGRRMGR4cFZCanBzb0Jn?=
 =?utf-8?B?N3ZnYklHSEluZ3B5ekRiSGZOK2JPTXZIMmxkbXpIVUJIaU9haU5Qdlk2Z1dM?=
 =?utf-8?B?dVJpaGJVMy9RenBCZzVtRlFPQkJZc0tCNi9BSWRhWGZ2cFBCeHZDdkFXUkF0?=
 =?utf-8?B?Z1hvVlJnbVNFbWV1VS9aNWlPOTZuOC9FMXc4ZW1Rd3hRSG5WSUpDWko4Z2FQ?=
 =?utf-8?B?MHR1d3YzMit5bXQ1UFJ2QlNiNnpWNGRSNUxkNVFrcWFSUFMveGVjTGRoQUlV?=
 =?utf-8?B?SjZpYWZ1ZzAyNVA2alZGTU1IVGFiMllCSnp2RnZRSXZKR2dwRDlZc1ZPNFpS?=
 =?utf-8?B?VmYxNXl3THRMWG1xZEY4bEhMRXkvM0oybmhSZW9uK0ZXakZKMjNJalhOZzZp?=
 =?utf-8?B?cnhwWDhHeURndlVBRmZkclhaMVd4SDRqQlVtVGdPQVFobTJ0RTNvS0NWVmVY?=
 =?utf-8?B?U1AzWFNNNUFqVW1sNnV3eFRNV1paZE5WMjNhY0YyNFc1Q1Z4elBnL3JQWDV1?=
 =?utf-8?B?bUdqVGN4WFROeVk2ajR5UW50YmloaVRGbWl2MmZlUXNzMVpOcUpOYnBOdjhu?=
 =?utf-8?B?Qnh5TDc0ckNqQUVWOEE1Q056anBSNVYvU1RDa2IrNUlmU3ByN2lZa0sxa1Zz?=
 =?utf-8?B?YTJmcHBLQTZ4VjZjaFZ2MEV2Vm4zajZOR01sRHR5ejhOOEdPUWg4MUN5a0I2?=
 =?utf-8?B?Z2pNUE5IRG5kQWcvUENZdTZFanlzV1FGd3F2NzZBTjExQk9CSDRxQjZZVGdN?=
 =?utf-8?B?QzdqYWtCdCtmdS9uMHZHbm5wN1o2NVJnNVlDM2NVc21BSzZlTk5MN05rZnRU?=
 =?utf-8?B?VVpFN1FDQ2FaalVPOERZT3FDNGVXRzUxZ1RUUGpaZHRBZG1ldCtvb2VmeW9K?=
 =?utf-8?B?Z2dPSi9ZMTF4R0k1ZWxOWmN2NVF0S2lkMFdHcnVtQ2RNL0pDMGFKVHRNclAy?=
 =?utf-8?B?MmxMSFpyYmIwVm1ISWhPWEUvVHVJRG1DTDJscUxORExxMEh0anpIU21RZHVW?=
 =?utf-8?B?NWZLWEZ6SzBFcEVucGxEMnRwOHhLOE4xQU5GeHo4OFhpLzF1L2t0TmkxRytV?=
 =?utf-8?B?eCt6ZDVrb04wVmtoMytkbUkvOXUyMVpkOXN5d0hNc2FoTVVkQStUamRCQlA2?=
 =?utf-8?B?Rk4wRzNwTzJTOVhuYzlPWCtteGN0VmdpNXdzTVVOZE9CYzBEbkpGenNoZzBH?=
 =?utf-8?B?Rlo2VEljMTJ1dnlPYm9YbEx4R1NQaGpuQ1NXN1c1clZjdlhaUnVQbzRzVUpz?=
 =?utf-8?B?bFBIeDdZNU01NjdIV1E2bDRKWXJEN0FXN1YvNzNBdVpjUjJERWZIanBqK1hr?=
 =?utf-8?B?QjZWdm01R2thR2FSQ2pBUmJtVzhMSE1zSXlMekwyTWc0T2lEOXkwandzN0tE?=
 =?utf-8?B?SngyWHB2U05ET29qSE03djdCS2drQkVKRUUyWUtXb2JmTis2TTZqczZOa2Fx?=
 =?utf-8?B?bnR3eG5USklNNFdwamwrZFVPM09FRmdzc20weXRHNVhid2ZybFFQcTFncGJL?=
 =?utf-8?B?MUZrQVBVcUQ0OG9MTWtmb24xS2NzTE1tUGtNRlJKZnV1amt5Rmg2dz09?=
X-Exchange-RoutingPolicyChecked: W0Oja3AxBWG9FzQLLPHjnp2+qms/cKIHKYK2b8+cmKrwA+a8BbzQj8fWPP3copc1lHAZWkB7m9Ay9DiOZYmNXRzzJaPYAEsJFsjsejshI2x4pfmNhc+wZ4lFROmxXr9PoW971nPHU8Y6yKxi0/gBkikmyleVFW2jeYsuTd9ITyCdCH0VOXIuad8sxOLwrhoic4LKT7WY2pwlLuM5SRMw3bIlI2wK4xuVLHwtRg2AQ62asAzTibOzVBbgFKAQzQGjFygDTVYJgabYc2Mhi3hJGLl7BcJmw4CLd3/l93Rbb4xvQou8BBCU+jQfpZE5XsxCJuNbr8AJIU8n/uC1fqlHwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8680b6-88d9-4bab-d916-08df08c68de6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:48:19.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jUypl4jPCOzBYzavfjPP68asAgF7oDHjz4tnuQJ/AtlS67ecfzYSwhgkbqtpl4ZfCwsnDWVTq7SetxqKCRb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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


On 27-08-2026 01:50, Rodrigo Vivi wrote:
> On Wed, Aug 26, 2026 at 04:27:15PM +0200, Raag Jadav wrote:
>> On Tue, Aug 25, 2026 at 12:11:31AM +0530, Karthik Poosa wrote:
>>> Add is_temp_valid() to validate sensor presence.
>> Please utilize the full 75 character space where possible.
>>
>>> A temperature reading of 0xFF on CRI platforms indicates that the
>>> corresponding sensor is not present and should be treated as unavailable.
>>>
>>> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
>>> for unavailable sensors are not exposed during hwmon device registration.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
>>>   1 file changed, 66 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 5284cab6703d..2c4eba4b8f8f 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -813,12 +813,21 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>>   	return ret;
>>>   }
>>>   
>>> +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 value)
>>> +{
>>> +	/* Value of 0xFF indicates unavailable sensor for platforms from CRI. */
>>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> Let's not solve a problem that doesn't exist. This kind of checks create
>> problem in internal repos where the expected platform isn't quite often
>> the last one. If this is needed for multiple platforms, just add a feature
>> flag.
> Well, I know that sometimes I might be over optimistic about it, but
> in general while working with platform enabling I always preferred to
> assume that the next platform would be similar and work on the differences
> and on the errors than have to hunt all the corner cases that were forgotten
> because it was a static if == platform.
>
> We even had a MISSED_CASE macro in i915 for the places that we had a risk
> of being different but that would cause trouble later.
>
> That said, I don't have a strong side in here, but it should be easier to
> have something like.

Agree with Rodrigo. For CRI+ platforms this is expected to be supported, 
so this should be okay.

>>> +		return value != U8_MAX;
>>> +	else
>> Redundant else.
> but on this I agree 100% :)
>
>>> +		return value != 0;
>>> +}
>>> +
>>>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>>   {
>>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>>   	u32 *dword = (u32 *)hwmon->temp.value;
>>> +	int ret, i, count = 0;
>>>   	s32 average = 0;
>>> -	int ret, i;
>>>   
>>>   	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>>> @@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>>>   	}
>>>   
>>> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>>> -		average += hwmon->temp.value[i];
>>> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
>>> +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
>>> +			average += hwmon->temp.value[i];
>>> +			count++;
>>> +		} else {
>>> +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
>>> +				i, hwmon->temp.value[i]);
>>> +		}
>> Rather,
>>
>> 	if (!is_temp_valid())
>> 		continue;
>> 		
>> 	average += ...
>> 	
>> Tidy? ;)
>>
>>> +	}
>>> +
>>> +	if (!count) {
>>> +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");
>> This is a bit misleading as it is exposed as a single channel to the user.
>> I'd rephrase this to something like "Memory temperature not available".
>>
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	average /= count;
>> Blank line please!
>>
>>> +	if (val)
>>> +		*val = average * MILLIDEGREE_PER_DEGREE;
>>>   
>>> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
>>> -	*val = average * MILLIDEGREE_PER_DEGREE;
>>>   	return 0;
>>>   }
>>>   
>>> @@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>>>   		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>>>   
>>>   	data = REG_FIELD_GET(TEMP_MASK, data);
>>> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>>> +	if (!is_temp_valid(hwmon, data)) {
>>> +		drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, val 0x%x\n", data);
>> Same as above, "PCIe temperature not available".
>> I'm also unsure why do we need to log the value?
>>
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	if (val)
>>> +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>>>   
>>>   	return 0;
>>>   }
>>> @@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>   	int vram_id = channel - CHANNEL_VRAM_N;
>>>   	struct xe_reg vram_reg;
>>> +	u32 reg_val;
>>> +	u8 temp;
>>>   
>>>   	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>>> +	if (!xe_reg_is_valid(vram_reg))
>>>   		return false;
>>>   
>>> +	reg_val = xe_mmio_read32(mmio, vram_reg);
>>> +	temp = REG_FIELD_GET(TEMP_MASK, reg_val);
>>> +	if (!is_temp_valid(hwmon, temp)) {
>> Hm, see below[1].
>>
>>> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
>>> +			reg_val);
>>> +		return false;
>>> +	}
>>> +
>>>   	/* Create label only for available vram channel */
>>>   	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>>>   	return true;
>>> @@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>   		case CHANNEL_VRAM:
>>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>>   		case CHANNEL_MCTRL:
>>> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_PCIE:
>>> -			return hwmon->temp.count ? 0444 : 0;
>>> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>   			return (is_vram_ch_available(hwmon, channel) &&
>>>   				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>>> @@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>   		case CHANNEL_VRAM:
>>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>>>   		case CHANNEL_MCTRL:
>>> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_PCIE:
>>> -			return hwmon->temp.count ? 0444 : 0;
>>> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>   			return (is_vram_ch_available(hwmon, channel) &&
>>>   				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>>> @@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>   	case hwmon_temp_label:
>>>   		switch (channel) {
>>>   		case CHANNEL_PKG:
>>> -		case CHANNEL_VRAM:
>>> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>>> -								channel)) ? 0444 : 0;
>>> +		case CHANNEL_VRAM: {
>>> +			struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>> +			struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>> +			u32 reg_val;
>>> +			u8 temp;
>>> +
>>> +			if (!xe_reg_is_valid(reg))
>>> +				return 0;
>>> +
>>> +			reg_val = xe_mmio_read32(mmio, reg);
>>> +			temp = REG_FIELD_GET(TEMP_MASK, reg_val);
>>> +
>>> +			return is_temp_valid(hwmon, temp) ? 0444 : 0;
>> [1] This looks like something similar to what's happening in
>> is_vram_ch_available() and can be consolidated into something like
>> is_vram_temp_valid().
>>
>> Raag
>>
>>> +		}
>>>   		case CHANNEL_MCTRL:
>>> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_PCIE:
>>> -			return hwmon->temp.count ? 0444 : 0;
>>> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>   			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>>   		default:
>>> -- 
>>> 2.25.1
>>>
