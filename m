Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B6CC021AD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 05:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2C310E8BB;
	Thu, 20 Feb 2025 05:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkW5TNsx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C388B10E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 05:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740030100; x=1771566100;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5nvKfo9eezHBpKutoSKFcL/QL1ujYkn70Soci2DE2YQ=;
 b=nkW5TNsxvTR9zeCUiQTuACx3NyPblbqqXbsyX7eoxnrC6tI1/LI03msW
 HFubCYUPf7NqozULG6Yiurl2UEzXtUcbLleoQHreD8YqMPRzR8aq3MlqS
 P42OqnV9oZTPNx34BuoTpX3lCXhnJz/oeY4ZjySliNWhqU7+w1HnJqjIs
 ce44v3IPF/tWsi9mga/WrhSNR6CYMqEKE/tSnUiFwQbaK7e+6Y235AD2z
 rtRzH+XCrNriwsv0KWc+Z17N2W89kIaG6t7SmHyGoDDzkpcC+nU0OrrsX
 TVXlgz2WXhpVI3C5j+ibgCy9Rv1fvth0waZEfDZJdFP2+4idPX36uga3m w==;
X-CSE-ConnectionGUID: K7fi11xISwSjrABT0WamJw==
X-CSE-MsgGUID: SLsOc5czTYibNeT9udpxyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44712343"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="44712343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 21:41:39 -0800
X-CSE-ConnectionGUID: Hop5IKV3Q6Svhtg+fErjpA==
X-CSE-MsgGUID: f4OkMb63RE2Xa6q3XdOZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152135386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 21:41:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 21:41:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 21:41:38 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 21:41:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPLNmq5/Whgs25G0VNRxzjWABi0VzRlTFqer+5YeRZh02jg+Og0dfHZnyI3sRQevrYrEqUe+LzGGbe7jptVjxupULISIx7Fwgy4uz+xw0hnYF0C0t2n5wAuVX2o7B9LUA2F/QiCqfYmTTLznOwlxv3q25O5yGfMLuTAhCYX8zhJTjkuFpu5sytWKtJuAYZJUeFsXl3p3W8C3WatfJX1PaByfMtdMw76eauuQNM6rx4cXNqn6roF05KWYfU1sruJrbYN99S2ZNw3DdoxHHn589Ahmqb6PX53T0SGNnfEMfutw7LZm1jo/ErdCevvlpjT44U69vQ0zQBfsJpphULYOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aCRPY5vSoWiSe6JD4DE4+qtqVYlSt5qxD3Eldktv+g=;
 b=K9k4jT1xjZdPQK0IYnbgWZd1XCiYFhKVU3+ceElTKUoKCmb9G0hBAzAVvu7MDyG8pvp+9PNg7IOGd5xIPnbqCHc5iE6GnGZIfMzn8N4HNJ2EPkZb9F8AOX/2uWI6/GxpChyv+bv/yOa9U2cBeeR9CR3dVUZtnUXC5ganBlKkybolyTb1ni9A/upCy4TpdSn60BYwCOVRMyrkdo6zo/+6ejCbN3FnK+E9cgY/RpWtgSPVXflW6eNhP6oOhxvJXjAz0WvqM3o5kvZ33GZawkwHe9uTDSyWDJUydDxpYGaPvQGfQyZE/oyvGjEUDAoM79GxeeIFxMABuj5NVPAEcP3tfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Thu, 20 Feb 2025 05:41:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 05:41:36 +0000
Message-ID: <e8538806-06ce-47cf-8fe0-160a364bd43d@intel.com>
Date: Thu, 20 Feb 2025 11:11:30 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
 <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
 <dgd4urucgypp7u6nqgjwacm3exeijvlsvuroq5iyxhk4hguxyc@xiu3pogry77w>
Content-Language: en-US
In-Reply-To: <dgd4urucgypp7u6nqgjwacm3exeijvlsvuroq5iyxhk4hguxyc@xiu3pogry77w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcdf041-056c-4500-be58-08dd51713d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmFtcUJlZW4rN3pDelFDWEgwWVBnckpUTnlDelMrdlVuTnNXNDJVMzZvelk2?=
 =?utf-8?B?R01kcThlRFB2YnNqSzJnREtXMlBvOEFzejZSVjBVek16L0JsL1dVU1I3NjNo?=
 =?utf-8?B?a3Y5cmpqeEsrS1hLaDhEeHdOTmtVL2hseE1yNDFncytta3dwS29oWkJTZDBu?=
 =?utf-8?B?Rzk2dUUvUDkwOW5rUFVQSWhuaU5nNmZYelBIZyt5T1ovWFNzNXZKRTc4SEJn?=
 =?utf-8?B?SEJnUHNiaFBYMXRQTGtQSVR5RGhVZ3AxTWxqaHdxUk1KbWZWcitPbG50WGtp?=
 =?utf-8?B?M2ZDQzhSekF2NTBjZ2h5RHlvL0MxNVFDQ3JhVmo3Vy9STXV1dDFmSkdkOXpM?=
 =?utf-8?B?dzVhTWxMeC9qWENQa1lZZmJEa3VRSkE5MXhQWVpWZW9MWEgwT1pTZDJSOEc0?=
 =?utf-8?B?dTRidEhpMXdXbE41T09lckNTVm9uVU0zNStSTWZyckhoOVU1bU9MOVZhS3Bz?=
 =?utf-8?B?TlhQTWcvOC9WcE5WVUlFbm1ZMDBKTCtnMmVtcWtPZGZyVUkxYm9aeUVCNWRN?=
 =?utf-8?B?bFJZYmozeGhCYnBMN1pPaEYvTmFQcElrVFJtcnRvQmVYZCtuTXZXd3JYV0lk?=
 =?utf-8?B?RGpXcDVRQ2dqSDlIMWV4aldlUDNNb3BGdXpwVmswMERRNmQ0d2dpQTd6eUxy?=
 =?utf-8?B?ayt0bEZXS3A5RWsvVGhNQ2orNzRYUndsMWZqalN3djRiQ3Y5dGpaNUI0ZEFj?=
 =?utf-8?B?VE5yQ1NqQnJSMUhZdURXNm5VSncvZTVTZmg0RWxkVUlKSnV4bExIWTNBR1V4?=
 =?utf-8?B?RXR6cXNaakJ2dWlIODY5bTF2eGNUT3lPOUpOT0FjS3Jsb3JWbnUyNnQ4MmlD?=
 =?utf-8?B?NW5wdFdWL0dCbFp1SHVWRk5iKzU0TjFKelhSK3B0WWJvb0VZOFc5d2NUZWFu?=
 =?utf-8?B?eXNzenRpQkxWR09mRGlEYzdyREtKYmh5dnp1WFJoOWNvWmhCclhwRlE5RTgz?=
 =?utf-8?B?OHcvTWlzc1ZISWhoTFlIY1huSWNKTDZreENoQlZ0M3hUWCs0YlplVnBXM2Z4?=
 =?utf-8?B?SmEySVNwTlZqTWM5cWVUMHI0VEE0NnZuelN0dEorM2pqTTIwL3BnUGNUeitw?=
 =?utf-8?B?UHY4L3FJM2pCcXI2VkpERmh0MmZxZWJEVEFlUFM4Vzg0dGRJMHpnMHFQM2li?=
 =?utf-8?B?QVNGUWx5bWhadVBueko1eEtSamVITWVrZldqd0QxYXVaekFIQXRNdERNcU9x?=
 =?utf-8?B?dnBXOXl6NnBhQVV4UXJTTVc3WmFFa0JqMzh4cGExSUlTUWdsditHVTAwWk5I?=
 =?utf-8?B?a2JMWmNCc1RLUWo3dWcrZjFZU0pHRkFzbFptUWVsQ2xYOWY2bENsVmhIR3lR?=
 =?utf-8?B?UEFsQTdPSHZpOTJEUnhsZUpweStNR2xoR2VyR2ZFa2tVMkFqWDQvSVJ4Slda?=
 =?utf-8?B?bmFvOFpVSUVGMEg1OUxNNzQrejlUcEtib0w1eXp6TjFUT2pwcEY5QUxTZGNK?=
 =?utf-8?B?SG5xY05keTJkdmxjMER0Vzc2NGYrS1RnaWJOaFVPQXpEcVZJYm9HQTd1RVNE?=
 =?utf-8?B?cEdnOFBHNFgzOGZpbnNwc2t3S21qUExjcG1XaDFwRG9udFJTTktuVDdyVFY3?=
 =?utf-8?B?ZGVNSzBoMEg4VnBicjBuVWZ1bm5NVGl3SEVyNUY4MkEvcm9FeDlQVmVkcElx?=
 =?utf-8?B?dFFYbXhaQTRaaGhRQzA1QjlTNjJrM0VxcnZyVGVPNTQ3RExETW1kb1Jnekh6?=
 =?utf-8?B?bVRFcmxEWmZQUStkRlEwUVVkMDE0ZElkNjZDK3dYL1ZQKzlMNVBmWmtqYnMr?=
 =?utf-8?B?UFFGK1RMMGdCRDNYYUR6bkhGTlBCNGJ6U1BiUE12RG04STF1MGNqN2JCQWFG?=
 =?utf-8?B?OGJucUdzVFNKVTRGelhBcUtNd3JXN2tnOGdsUnVnak9mZjhtSFVoN2VyNko5?=
 =?utf-8?Q?1EZGQb/09opDV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXhJVUwzQmMwY1k2M01ZVkZpNXUrOTNsKzFTMFNQc2Z0TDN3UWV2djhTWHMy?=
 =?utf-8?B?ckoxMjB6aUpuOUNIa280WlN1am9weXhNYWdveUxoMGFvODVLL1pVZEhSV0h3?=
 =?utf-8?B?aTNEaGFUQitYK2Y2Y2FudlkvZS9NNDk4b0NlSTY0TjZDU3UzNWN1c3JOMmQr?=
 =?utf-8?B?TzRValNRSDFhaEpBLzBLcUVFZkQzSnhSYms4SVBIeXByY0IyKzRrVmpBc1Zt?=
 =?utf-8?B?aWhFYlFZNTE1endtUWpTL29iVXA0VytRNU5QdG9WcEtCTjdWUGJlOUdBdDND?=
 =?utf-8?B?WjlpcWVkRW1NLy9TMVNuV1pjWGFmZk41SzF3RXVsLy9WTVBBdkMvY0p0bzZS?=
 =?utf-8?B?QjJxNEp2c2xXdFBNbGYwbXAvcTI0cTdmSzR3SGpkbmY0ZGZjMDBIakxxQTQz?=
 =?utf-8?B?NzJPN0xqeFFLeFJ6eXFCbUhlbk43MW9ta1NPTWgwZDB2QzlJWEJTZjdLV2Jp?=
 =?utf-8?B?eHBkYzA3c0lsL0NoWll5czhKWXp6ZGU5ajFQdGV6eU02LzJUM2ltdGNZNlpH?=
 =?utf-8?B?MktFZkVuV3pjbVZQUnJ0S1NhcXE1SG1mZVdqSTdpM2hwOHd1K0NiZUJqMEtN?=
 =?utf-8?B?cGdjaHh3M0l4dUtKcWhseG9vbERCcmFNcDBhWTdnTGxXL1VXM0VkbWhCdTg0?=
 =?utf-8?B?YmR3WW5EbERzSzdraFZSWjF0M3hmb2hvV1ZPUm9CUGVwSXhYV0JuMk5jblJu?=
 =?utf-8?B?YStQZm40bTRscTNQYkZRcm9KbWV5ZnFSbW5mcVBwS2l5VUJTbVhRWFByd1Vu?=
 =?utf-8?B?aSs3SW9ub3RxNHg3Snlsd0J3NGZFamtQRFBGNVZlUjRIOFJGUExtMjRnNUEz?=
 =?utf-8?B?QWw0b2xCL0FTaURuMmZlRGRoc0lmZVBhRjk0azNjd3lMb1NkNTl6QjhUNVFM?=
 =?utf-8?B?N0w5bE5PRXBOeWM4WlMxSmRpN3FwS2hJWE0vbnFKMEJ3ckpBbFhYc2lXemJp?=
 =?utf-8?B?eE9kVkthUDNFVkJ5ZEphcW1xU2IzdjRUYVZVSEQyL1hQZUN3dzhtd0dwd2RS?=
 =?utf-8?B?TG4xd3ZLR1hmcG1RUkYwMWt0cmNaRHljWjEvT1FybU1ZL2RNT2hWTUQwL2FQ?=
 =?utf-8?B?UG9MRVF2QmtBbURHYjdZaURJQmZrYzhaUTFNNjAyMTNBSVJKRFZteFN5Z1NP?=
 =?utf-8?B?cnhEL2hsUFlxSFZhMVJNbDVrTG80S0RDN1Y1OEpZQVRNODNOSENMdDVEQ2lQ?=
 =?utf-8?B?UjA1TThTOStBelZ5S3JLWXpRd053RUhXMTZpWHpKbFFhTWZVZnJvc1djelQx?=
 =?utf-8?B?MjB3MWwrOUpNRzIvZkNRaStyMU5QczllcHQwQnA1b25SYzFUS3d4UmNsTlJz?=
 =?utf-8?B?VTVIbU0zUUJaMFFwZ1ZJR25NQkhsN1VFb3QxWDJBNVROYUMvKy9rQ2ZhSTE3?=
 =?utf-8?B?TTZDY3N0cnhoQTREMmJSNUFEZmNXNWxhMlVsNFh4citxc0NJcklQcEYzY1Bj?=
 =?utf-8?B?eHBwQjh3dDdZQWR1S3pjS0lKSUdpQWdaZkZEOFc5OTQxMkJNem5lVHdxNVJs?=
 =?utf-8?B?QkVMZENIT0s1cVV2MGhTdVZMdDhHN3ZaRFhHTXdheWdmY1ZLZGpHbE8yYUpi?=
 =?utf-8?B?ZW82YTlTdUkwSUY4ZEIyQXRUc01PN0I4RFp0cWs0cDBWTGt3ZTVaeE1pNnpN?=
 =?utf-8?B?QWJERW1xN0x3QThybFNJYzZrTFV2ckNqQjJaVTFYc2grN3hPZHRUd3VqUFlR?=
 =?utf-8?B?TmN3VHZUMkRRMEN5UE5rbFNNL3QxTEU3SHBWUnRVbG5vTzVPaDJFR0MxRlZ0?=
 =?utf-8?B?UmJIWjlIUnlQVXRuL1p3czBkWkJUaW5SdVFZRzArTjFrUWdWRk96R292Umxa?=
 =?utf-8?B?VUVHQnA4RStBbURlS21KVFhMOVhOZUcwa0dHSjJQL3VxVmhQWEVDVENIT3B0?=
 =?utf-8?B?RWZMeEdvWGl4cDNIN0t6OTcxQTNqRkhpS3F0YktVcHNJVVVxaWVqcFYyN0Nz?=
 =?utf-8?B?VkE5SGt1S200MTZZVUVlMVdIVld5VHYyK2QvczkyaHJyNzBQZ0JkU3ZDcVNB?=
 =?utf-8?B?Y2kvUm5RZG5rWUVOU1V1SzFyNjBBc0g4cUVMZ01Eakp3aWhUVWI4Wm5mK2w2?=
 =?utf-8?B?REdQYTlIUjhuYm1zaGgvMGxScjBVRkFoVGoxM0tiUjh2QU53SjdEWlRqcXdE?=
 =?utf-8?Q?Pmt9PZYYmIrN98WOp7+WWHrgl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcdf041-056c-4500-be58-08dd51713d58
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 05:41:36.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bivC5jXYLtXql/5psvZ8EzytzPRylh2s3kIKwNQf8JXPi94H9zLoXuRx3DLLVz7nE6JVP9h6/dH+bMDgMjTFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
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

Hi Lucas

On 2/17/2025 10:58 PM, Lucas De Marchi wrote:
> On Mon, Feb 17, 2025 at 10:56:22AM +0530, Riana Tauro wrote:
>>
>>
>> On 2/15/2025 2:53 AM, Lucas De Marchi wrote:
>>> There's an odd split between xe_pci.c and xe_device.c wrt
>>> xe_survivability: it's initialized by xe_device, but then finalized by
>>> xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
>>> the flow entirely.
>> Hi Lucas
>>
>> device_probe_early has other init calls that return error. And since 
>> this occurs only when pcode probe fails, added it there.
> 
> right, but it's very confusing to have this flow with both xe_pci and
> xe_device playing a different role on init and fini.
> 
>>
>> I hadn't added the fini in the devm_action because of the 
>> pci_set_drvdata.
> 
> which is now fixed as a prep patch in this series.
> 
>>
>> As, the remove function is moved to devm_action. IMO it would be better
>> if survivability_init stays in the err condition of pcode probe 
>> because if someone decides to move pcode_probe to some other function, 
>> it would be intuitive to move this too
> 
> but from entering survivability mode, it would still be after
> xe_device_probe_**early**().
> 
> An **early** error in xe_device probe, by means of having a call
> xe_device_probe_early() means a very fundamental issue with firmware and
> we'd better enter a mode that allows us to recover from that. If the
> call to pcode was moved somewhere else after that, it's mistake that we
> should fail in CI (btw we need a way to do that in CI).

Currently there is no CI for this as it needs a firmware failure. Even 
if module param was added in the future it would still not fail if pcode 
probe was moved.

Maybe can add a comment on top of the survivability_mode_enable in pci layer

> 
> The only thing in between right now is the "wait for lmem", which I
> think is ok to have and still check for the "do we need to enter
> survivability mode and abort the normal probe?" after it.
Yeah this should be okay

Thanks
Riana
> 
> This allows to fix things like mentioned below and make it easier to
> keep it working.
> 
> Lucas De Marchi
> 
>>
>> Thanks
>> Riana
>>>
>>> This also allows to stop ignoring some of the errors. E.g.: if there's
>>> an -ENOMEM, it shouldn't continue as if it survivability had been
>>> enabled.
>>>
>>> One change worth mentioning is that if "wait for lmem" fails, it will
>>> also check the pcode status to decide if it should enter or not in
>>> survivability mode, which it was not doing before. The bit from pcode
>>> for that decision should remain the same after lmem failed
>>> initialization, so it should be fine.
>>>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.c             |  7 +--
>>>  drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
>>>  drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
>>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
>>>  drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
>>>  5 files changed, 48 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index d88c0fddf0680..782ad564d0ba4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -53,7 +53,6 @@
>>>  #include "xe_pxp.h"
>>>  #include "xe_query.h"
>>>  #include "xe_sriov.h"
>>> -#include "xe_survivability_mode.h"
>>>  #include "xe_tile.h"
>>>  #include "xe_ttm_stolen_mgr.h"
>>>  #include "xe_ttm_sys_mgr.h"
>>> @@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
>>>      update_device_info(xe);
>>>      err = xe_pcode_probe_early(xe);
>>> -    if (err) {
>>> -        if (xe_survivability_mode_required(xe))
>>> -            xe_survivability_mode_init(xe);
>>> -
>>> +    if (err)
>>>          return err;
>>> -    }
>>>      err = wait_for_lmem_ready(xe);
>>>      if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/ 
>>> xe_heci_gsc.c
>>> index 06dc78d3a8123..992ee47abcdb7 100644
>>> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
>>> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
>>> @@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>>>          return;
>>>      }
>>> -    if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
>>> +    if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>>>          ret = heci_gsc_irq_setup(xe);
>>>          if (ret)
>>>              goto fail;
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 447eacb355d7c..c18c58447d9fe 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>      if (IS_SRIOV_PF(xe))
>>>          xe_pci_sriov_configure(pdev, 0);
>>> -    if (xe_survivability_mode_enabled(xe))
>>> -        return xe_survivability_mode_remove(xe);
>>> +    if (xe_survivability_mode_is_enabled(xe))
>>> +        return;
>>>      xe_device_remove(xe);
>>>      xe_pm_runtime_fini(xe);
>>> @@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, 
>>> const struct pci_device_id *ent)
>>>      err = xe_device_probe_early(xe);
>>>      /*
>>> -     * In Boot Survivability mode, no drm card is exposed
>>> -     * and driver is loaded with bare minimum to allow
>>> -     * for firmware to be flashed through mei. Return
>>> -     * success if survivability mode is enabled.
>>> +     * In Boot Survivability mode, no drm card is exposed and driver is
>>> +     * loaded with bare minimum to allow for firmware to be flashed 
>>> through
>>> +     * mei. Return success if survivability mode is enabled.
>>>       */
>>>      if (err) {
>>> -        if (xe_survivability_mode_enabled(xe))
>>> +        if (xe_survivability_mode_required(xe) &&
>>> +            xe_survivability_mode_enable(xe))
>>>              return 0;
>>>          return err;
>>> @@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
>>>      struct xe_device *xe = pdev_to_xe_device(pdev);
>>>      int err;
>>> -    if (xe_survivability_mode_enabled(xe))
>>> +    if (xe_survivability_mode_is_enabled(xe))
>>>          return -EBUSY;
>>>      err = xe_pm_suspend(xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/ 
>>> gpu/drm/xe/xe_survivability_mode.c
>>> index 04a341606a7c5..7ba02e085b5b1 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct 
>>> device *dev,
>>>  static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>> -static void enable_survivability_mode(struct pci_dev *pdev)
>>> +static void xe_survivability_mode_fini(void *arg)
>>> +{
>>> +    struct xe_device *xe = arg;
>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +    struct device *dev = &pdev->dev;
>>> +
>>> +    sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>> +    xe_heci_gsc_fini(xe);
>>> +}
>>> +
>>> +static int enable_survivability_mode(struct pci_dev *pdev)
>>>  {
>>>      struct device *dev = &pdev->dev;
>>>      struct xe_device *xe = pdev_to_xe_device(pdev);
>>>      struct xe_survivability *survivability = &xe->survivability;
>>>      int ret = 0;
>>> -    /* set survivability mode */
>>> -    survivability->mode = true;
>>> -    dev_info(dev, "In Survivability Mode\n");
>>> -
>>>      /* create survivability mode sysfs */
>>>      ret = sysfs_create_file(&dev->kobj, 
>>> &dev_attr_survivability_mode.attr);
>>>      if (ret) {
>>>          dev_warn(dev, "Failed to create survivability sysfs files\n");
>>> -        return;
>>> +        return ret;
>>>      }
>>> +    ret = devm_add_action_or_reset(xe->drm.dev,
>>> +                       xe_survivability_mode_fini, xe);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>      xe_heci_gsc_init(xe);
>>>      xe_vsec_init(xe);
>>> +
>>> +    survivability->mode = true;
>>> +    dev_err(dev, "In Survivability Mode\n");
>>> +
>>> +    return 0;
>>>  }
>>>  /**
>>> - * xe_survivability_mode_enabled - check if survivability mode is 
>>> enabled
>>> + * xe_survivability_mode_is_enabled - check if survivability mode is 
>>> enabled
>>>   * @xe: xe device instance
>>>   *
>>>   * Returns true if in survivability mode, false otherwise
>>>   */
>>> -bool xe_survivability_mode_enabled(struct xe_device *xe)
>>> +bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>>>  {
>>> -    struct xe_survivability *survivability = &xe->survivability;
>>> -
>>> -    return survivability->mode;
>>> +    return xe->survivability.mode;
>>>  }
>>>  /**
>>> @@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct 
>>> xe_device *xe)
>>>      data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>>>      survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>> -    return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>>> -        survivability->boot_status == CRITICAL_FAILURE);
>>> +    return survivability->boot_status == NON_CRITICAL_FAILURE ||
>>> +        survivability->boot_status == CRITICAL_FAILURE;
>>>  }
>>>  /**
>>> - * xe_survivability_mode_remove - remove survivability mode
>>> + * xe_survivability_mode_enable - Initialize and enable the 
>>> survivability mode
>>>   * @xe: xe device instance
>>>   *
>>> - * clean up sysfs entries of survivability mode
>>> - */
>>> -void xe_survivability_mode_remove(struct xe_device *xe)
>>> -{
>>> -    struct xe_survivability *survivability = &xe->survivability;
>>> -    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> -    struct device *dev = &pdev->dev;
>>> -
>>> -    sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>> -    xe_heci_gsc_fini(xe);
>>> -    kfree(survivability->info);
>>> -}
>>> -
>>> -/**
>>> - * xe_survivability_mode_init - Initialize the survivability mode
>>> - * @xe: xe device instance
>>> + * Initialize survivability information and enable survivability mode
>>>   *
>>> - * Initializes survivability information and enables survivability mode
>>> + * Return: 0 for success, negative error code otherwise.
>>>   */
>>> -void xe_survivability_mode_init(struct xe_device *xe)
>>> +int xe_survivability_mode_enable(struct xe_device *xe)
>>>  {
>>>      struct xe_survivability *survivability = &xe->survivability;
>>>      struct xe_survivability_info *info;
>>> @@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device 
>>> *xe)
>>>      survivability->size = MAX_SCRATCH_MMIO;
>>> -    info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
>>> +    info = devm_kcalloc(xe->drm.dev, survivability->size, 
>>> sizeof(*info),
>>> +                GFP_KERNEL);
>>>      if (!info)
>>> -        return;
>>> +        return -ENOMEM;
>>>      survivability->info = info;
>>> @@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device 
>>> *xe)
>>>      /* Only log debug information and exit if it is a critical 
>>> failure */
>>>      if (survivability->boot_status == CRITICAL_FAILURE) {
>>>          log_survivability_info(pdev);
>>> -        kfree(survivability->info);
>>> -        return;
>>> +        return -ENXIO;
>>>      }
>>> -    enable_survivability_mode(pdev);
>>> +    return enable_survivability_mode(pdev);
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/ 
>>> gpu/drm/xe/xe_survivability_mode.h
>>> index f530507a22c62..f4df5f9025ce8 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>> @@ -10,9 +10,8 @@
>>>  struct xe_device;
>>> -void xe_survivability_mode_init(struct xe_device *xe);
>>> -void xe_survivability_mode_remove(struct xe_device *xe);
>>> -bool xe_survivability_mode_enabled(struct xe_device *xe);
>>> +int xe_survivability_mode_enable(struct xe_device *xe);
>>> +bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>>>  bool xe_survivability_mode_required(struct xe_device *xe);
>>>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
>>

