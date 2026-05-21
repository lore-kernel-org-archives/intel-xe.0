Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0BCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 04:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D103810E1BB;
	Thu, 21 May 2026 04:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo9opsyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71510E1BB
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779339510; x=1810875510;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LpgBCb3xS4jZevRmnCGAB0Rc5GSNJ3fyOuV+FyCLlv4=;
 b=Mo9opsyPr3jrPCP7q3XTD536Whi37qzBkfNKXiyh78JZaFXfzg+4xvoI
 fd9o+yohzta/oHnKB3gvD3O7HvSgZC4v793qC+EsoxKtB44JFjnmJ0cD0
 dl/bkuPxgo9NeEAxUXVK+0/Y9qjjL0egIiosfA03swLirO9K/fZyNCert
 doHBzet9WIlQgCiIC0+f0Knz0/B75sWkyCIQqdvX0zw7d9eyMXx08WhPU
 fLtkK6WX/0oATxIROo4kALLjV2qrgXHLpVQ5ciIC2xYR/XXrl4jID3N1s
 EI40OPMCd42onDmSFyyk2HAEL6wQE1TbuwlOpFzsaOIPYyzIz16BtrFGA A==;
X-CSE-ConnectionGUID: hcfs9oWVS8ew/rzwumOUtw==
X-CSE-MsgGUID: VzpOJVw+QzCQuorOGN2Ttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80233132"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80233132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 21:58:30 -0700
X-CSE-ConnectionGUID: rizdDUkRS72imvdDKDMfUw==
X-CSE-MsgGUID: 334g+/30Rsuu9cfHDC6eyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="239566370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 21:58:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 21:58:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 21:58:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 21:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiGalCluzSAdEuzQUbYB6M9EfOZGnjhMt5or2XoXhljkL3PBKiTjGdLpK5VsFWUbm5s8HQFgKadX5Aa5ASI2j9sev0e2+m3IFRa6GnotH42gO5WoJ0eROmqrGW6G5MnDr3uKyFHEVi/W0ANcSmVlTKq/DbVODPLKVilBd24EszTrq3y8oZ8rMUlNb2vnwVv8bpDGaH23XGQyYJKwcwhHHw+EwKDHYy0Jj6/alhtXSMPSJOHzLRHMslHOWTcHdsxUNhyFWEkUfhUokQKyL6qeE8kSuHbTAxPF5FxGrmGjvqVhPQU6WccdGSwJaShjItDQPZvgMLzydngIih3Bo0X5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1kb9R5kZDyae+AcV8N+cy0HsTFx/FZoy30cx0rQK50=;
 b=N7UriyBeQa/fWAM0nzkbe16B4lzG8bqD6cMMCgpaUgErUQc7KlL4SKmOLeDBP0cDKu5eTjpusL/aB1wPVl0et5BT7labj7y32OcyQeti/ZNqtOlV8rhw0YQjW3Kw8pAA5brWrAJNKeV5e8/mIGbtumlU02c9x320s4Nn8bZd4Ojzl+/GTB2KUSa+v38d/WRSvh/DdxGwWTw6oH76OmngaoZyuIZY0WqJEl6kcYVlqSt03aDRGpuM6Cx7z/S+9PBnBCqOieqeLxybZZqhJoVaLfxp6cJKqIxHP+qfdXBgMUjX75ENNBKWTqzKa5Sy8CTk0a59D8jPfw9xx8toq9kC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 04:58:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 04:58:24 +0000
Message-ID: <6fe6f3e9-6779-4949-acac-3d73a9bca571@intel.com>
Date: Thu, 21 May 2026 10:28:16 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v5 06/14] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-22-riana.tauro@intel.com>
 <agYJDqkslpMvjprk@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <agYJDqkslpMvjprk@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c1d348-1644-4332-54a6-08deb6f5969d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: mwPDhUE3Ir43BFsmKhAlXyhP0TyEW3Y6tFvbQq6K5qXCDjDB24z66RVxj1/eoSuEtY05AcBE48/mIB57ixWQTgEraRHQnFqBVcShk3Aa1d5k4yMTiyvBb/yyOaYqfaDDaog1r2rkzWEfVnh0lvOAz+3tFfMzssa/tR5kw9jbSUG0U4R9mi3DQ5t47xZpN0ZJTJj8oaCkgr5SFxM7W/MFvH26Zl0b50Ca80T8Xn7pMvf+Rhp0+u/fuHl1mDjjDXKKgGZOJl0rxApAdPm7agW5uC29frEfF0Oj2SLs44Zqty0qoE4WknA3zvmSzrZDh1dYvbkoWNt4kKIcRZsDLCvWWWeV5gsqHl0YZ8MxqqB4apDaSI4ZfjoCehGJrpHCJIvz20MJdyoJI/zPnZnEXLT5KxLUNFsMSLUwza/qmhsJhJVKzfd7ejRgVm8JS48niis8QjNKG8nxWVaUof7QeFGvEWPfiA1wlLVaopIJ6IXyRPU7We2FHAae8YHaJH/ORj3RZLgTD+an/343WyBc19YT8GmoIlu9mx6JRKGgxsG9U49i+OtQFLfPlI3SvbZ2j8/KP9f2PmtKOstNOth4XQNyjUO4gXDUbEWD5IQqFDqzw2DqAZDEk37mDsh/YJndmClqvQoLlVFXrDS8gMNmsM6HALLzQYLwuknK66m8UbdBu4k9zHABXojdNWn+Mx0Mbnjf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZ0UTR2aXJ3V05NMFIrYmlVYU10RDVDdHdYR1pmbzVxbktjREJwdmFGNFc4?=
 =?utf-8?B?bzQrdUhoTG5hNGdNc2xvajJaMkltdXM5M0JJRmo3ZnlXL0padlEzZ2g2R2pW?=
 =?utf-8?B?aWJQcTVmUmk1elBXRW9DTEg5ZitBRVN6clRCRER5eUwzcjVaTzh1K2Vxa0RP?=
 =?utf-8?B?QzBLQUpBRjFhK3JpQnc0a1dEd3RpUUQrY1lnZjZqZDNib1BEcnc3UnhzQWtD?=
 =?utf-8?B?Z1REWDIxOVlTQ1RncVlIYmZCSXU5Z3dPSTc4ZlZWN2FsTytscjRkdTBKd0Nr?=
 =?utf-8?B?Ynd5RjRicVZNY0NOUGZtck1nMExnMzM1OXFUemhBTEFVbGZ4ZFdMSWkyRWx3?=
 =?utf-8?B?cFBDU3huQ1N0SW1TWlh5aEJNQ0NrQWMrUlUyOEl0TVh1VURVMVh4bE92cmp0?=
 =?utf-8?B?TUhEZTVnYTNjdjlVa3lmaUVaNVptV1p4UnJYZC9FbFdURGowa3IvWGdmb09L?=
 =?utf-8?B?L210QmkzMkR0SE9rYlROdEMrU0paS3hVSHd4azFWZ09MZno4YW0weHdtRXFM?=
 =?utf-8?B?QUN0MGdQZXIvNW9Jb3p0anF6TmM3d1dZd09rRm52RWVxQThEelk3NWFTWkFh?=
 =?utf-8?B?RmdSMEc3M0szb2c1U0VxMW1EcEYwOE9GMHJxQy9McDhTa2ZyWDBRRExkdUFF?=
 =?utf-8?B?TUdqa3VoR0crb3pxdmoxa2dhWS9sZHdvVWVyRFhCTVRia1BnYWYvN2JpenZ2?=
 =?utf-8?B?YzNFWFJKS2xUandDODFFeFZBTHBTMUJOSUdQZ2NVSkxQbFY0a2FmVDhTem1h?=
 =?utf-8?B?SjRFa1lYcWRpTW5zL2xzVUZLTk9sZ2M2K2ZadjBCamxtRFNwNERVV0Z3RzhM?=
 =?utf-8?B?dGY0dFJ1M0ZiMWVjTlUrRWJTZlIvaE94dVlCMmYzSVhwYms0Q2F2Yy9QWGtw?=
 =?utf-8?B?M1d0RnA4OVE5bzY2QTNwM0lXMytrQzFjM283WEpxbUlXa2pYN1phV0FMZjdI?=
 =?utf-8?B?MDFWOStmcUdYMWxyNnJmbWZWWHliTEh4eFBpTFhUL01CRHVjeTRGb1ZoWWJM?=
 =?utf-8?B?WFZDUlUzcS81TTJOZEgvWVpPaVZtOUJoNy82RVV0enErSU9vRFNWelhKaTJ6?=
 =?utf-8?B?dmRPOEZWQzM4b05oT3pSQW5DTGNoc0JnOVZKTXpnb2JoczZObUZmc2p4YkdH?=
 =?utf-8?B?REpkZS9mUE1PVDdOUzdEMitEY1FIZFJGenZpeXc1d0JIWGRkV3NzRGpiTDRP?=
 =?utf-8?B?enArWUdONlp5Mm44eEFwQ3N3VVRjblhRTWFaM3FuMjdhcE85Wnd5T1ZibGtx?=
 =?utf-8?B?bU9ralc2bjdtbHZ0OFFvcmVhQTA2Z2xnc0tYOEpJQzhEYWtkLyt3OFZwUEo4?=
 =?utf-8?B?SUFzK2JiWTZBZ0Nrcit1VmVEazlDOTVTVUVVNGQvZEJQY0tjZTRseERvL1FE?=
 =?utf-8?B?NklCckVWV2c0eE5Ddlc1UFArbWJuZjBzZC81Y3Z1Y2hsVUd0bmcxajQ1eVFa?=
 =?utf-8?B?bDc5YytzQklESjIxSDI0NnZidlFidEx5OTNVNHFIMVFWS1grLzZNSDBEcTF0?=
 =?utf-8?B?aU9pMS9ES1VXK1pHR0hEc1dvbkxBRWczMk1HTmZGYTc3TVIvK1NZRnhvSDdk?=
 =?utf-8?B?ZExHcVlHL2dxQTBLWHZtZEhWNURrQml3U1N3OFQrUjhHVkdqUUhiOGlURWFR?=
 =?utf-8?B?WlVhckR5TVNBQmwrWHMvUERaYlJuZ3U3V1M3UTl4NUwrUDBFSEJ0S0FGdjZI?=
 =?utf-8?B?enczRWUxQ1hCK1R5dXVzRkJ3alZoK0M2WENKMUxySVdISFo5WHNZajZEL2dW?=
 =?utf-8?B?eGYrakxlMUVMWXgwc1Q5NkwvajVZRGM0R29oUkJJRVhwMkZML3VmS1lyZkd5?=
 =?utf-8?B?TWUyUGF4TzBYMnBpcGhxR3RjTlBHRE5VOHl0SExRR01LdE5BUEdhd09KTldE?=
 =?utf-8?B?OGVjRG56S2dYYXVNMG00OUI1N09oeHdKb2M2UW9UUm5ERTVTaHpsZVRYWFFQ?=
 =?utf-8?B?UkIvMXJqM2hnM0M4M080MlZvYUxUL21KN2JreTZkOHI4U29JTk04ZldDSnJ2?=
 =?utf-8?B?Ykt2SUhIWEVJaVBIUmxzZW9VMUtUVjhuNysxajYxNks3OWJXRG9LeHEzbUEr?=
 =?utf-8?B?TVQyemZRTXFIKzJxSGRLbDFxMEwzNXVXK0luMDVsS2tXaGkyeHNKTnRlVVZk?=
 =?utf-8?B?cmdPVTNmcXpBclB4MmZDSTRjZ08xNG1weXFSc2t5clZZSEkySk03czZiQ2ds?=
 =?utf-8?B?aExxZ25jN3UyQ2toR28veE5OMTU0VFBqWlhCSjNtaUtSU3JNWjUzT004Nzlp?=
 =?utf-8?B?cmF2VVduWnByVEsyN1pmdVA4Qld4eHByZVhqSkFQYXRISkN0RzBYbDdxR0Zj?=
 =?utf-8?B?OE4zcGNQNG52L2M2Nkxxa2hPUGVjQyt0RkFRUFZ5NVZyNUYzMUoxdz09?=
X-Exchange-RoutingPolicyChecked: pRPi1XcYqECbg1gZtTNZ9fsYcgvlCEZYa5CMkD8UmZTGtmlpTIJYaP46lDt2w65lzCCL8IQpn6ZcTgfFCc+eEAXAHhTCCiRppQ9152/KsFQWNUoKpyBBr/Ve0ONyhTEUNmfH548P7LtHS5EGKk+j7svGBpruxRx7njhS4wnLcJ7+cr6Ikx1SQDOgXVfrLDtG3j9m3wUJxo5IokNNUBoJuCypvqDgPMN/NG6NxK0c7JfN8ViOr5mCsY56HhQ62dbS3mAtw8xACo6z1Did1mgmfXtJGWs8rtaPGA3r4G9EX0/Ce1EknWsaq8cl7Tap9tSTgD/9fH9zE3bbWJ09Oj8qiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c1d348-1644-4332-54a6-08deb6f5969d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 04:58:24.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bk28DwntQs2xbMLg8e1ghSxTC7xPHr7LfQK2j93cTduZ4wT+S/ptVW7k2XV/900VhEFh3LwrfdNArewbZC2wsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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


On 5/14/2026 11:10 PM, Raag Jadav wrote:
> On Mon, May 11, 2026 at 10:59:13PM +0530, Riana Tauro wrote:
>> Uncorrectable errors from different endpoints in the device are steered to
>> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
>> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
>> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
>> detection, containment and recovery in the driver.
>>
>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>> Internal Error Severity' set to fatal by default. Set this to
>> non-fatal and unmask the error.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: clear stale uncorrectable internal status in status register
>> (Aravind)
>>
>> v3: abbrevate TLA's (Raag)
>>      add a info message if USP does not support AER
>>
>> v4: add a success log (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>>   drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    |  2 +-
>>   3 files changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 4b45b617a039..200d6bbb1b70 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -62,6 +62,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1048,6 +1049,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	if (err)
>>   		goto err_unregister_display;
>>   
>> +	xe_ras_init(xe);
>> +
>>   	err = xe_device_sysfs_init(xe);
>>   	if (err)
>>   		goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..24642c309967 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   			comp_to_str(component), sev_to_str(severity));
>>   	}
>>   }
>> +
>> +#ifdef CONFIG_PCIEAER
> I think all the PCI stuff should be part of xe_pci_error.c but I'll leave
> it to you all.

xe_pci_error has PCI generic error handlers. However this is not a 
general PCI policy.
This is to enable RAS flows for devices having a sysctrl to steer errors 
as uncorrectable
internal errors. According to me this is more suitable here.

Thanks
Riana


> Raag
>
>> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct pci_dev *vsp, *usp;
>> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
>> +	u16 aer_cap;
>> +
>> +	/*
>> +	 * Device Hierarchy:
>> +	 *
>> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
>> +	 */
>> +	vsp = pci_upstream_bridge(pdev);
>> +	if (!vsp)
>> +		return;
>> +
>> +	usp = pci_upstream_bridge(vsp);
>> +	if (!usp)
>> +		return;
>> +
>> +	aer_cap = usp->aer_cap;
>> +
>> +	if (!aer_cap) {
>> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
>> +	 * Status Register.
>> +	 */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
>> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
>> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
>> +
>> +	/*
>> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
>> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
>> +	 * detection, containment and recovery in the driver.
>> +	 *
>> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
>> +	 * Internal Error Severity' set to fatal by default. Set this to
>> +	 * non-fatal and unmask the error.
>> +	 */
>> +
>> +	/* Initialize Uncorrectable Error Severity Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
>> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
>> +
>> +	/* Initialize Uncorrectable Error Mask Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
>> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
>> +
>> +	pci_save_state(usp);
>> +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
>> +}
>> +#endif
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
>> +		return;
>> +
>> +#ifdef CONFIG_PCIEAER
>> +	aer_unmask_and_downgrade_internal_error(xe);
>> +#endif
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..a88ea0a46766 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
>>   
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response);
>> -
>> +void xe_ras_init(struct xe_device *xe);
>>   #endif
>> -- 
>> 2.47.1
>>
