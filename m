Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19293C369A4
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 18:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5310E72B;
	Wed,  9 Apr 2025 18:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlBNQy8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E5D10E727
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744223173; x=1775759173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bhxLu2MoOBNWRq/ZtdOOFtAD77z8dJ+EicVYn9CSF04=;
 b=KlBNQy8rt0FuOVnVaZj/TSeulSlVhwx8IiAMXMynrGF+5n7FbCO3IbgL
 E4CuF3mcHHc118WJFxXBeBxXQg7sMVM3qIGoiQtBbENmj4h3KTwccenjn
 mNeGXG3riJn7phwcMzYWUZWj8QFnQYk8Z+e7chalY7Km/+M8Lyp+629JF
 vIc/jSnG7j4XbuiZ+qyDIrptlUZfRye7HD982/7/yOcVO09sGbBobZ++S
 k9OPZVUl1LiRPL5h5b1svUf+m8sf6zA0HKtjL+7vd05G/LnoV7xh1cIPj
 oFu7yjD9jh+qm7Yipf9cuxSr+4Q7mDtpDYBEZ24daaDON+JdnQevwWSIL Q==;
X-CSE-ConnectionGUID: nMuZeDGPSxC+b3PoIBlmSw==
X-CSE-MsgGUID: pai41Tp+RIajbWy+ECQC4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49378707"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="49378707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 11:26:13 -0700
X-CSE-ConnectionGUID: +tNbspG/RkCa6UStmhs6QA==
X-CSE-MsgGUID: lwVvw+BLTnGXRNjfI+XJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="129018038"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 11:26:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 11:26:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 11:26:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 11:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCbfxT7jZvSNinTPteIy4QNgqD52ax9oNsd+6/nNQ5ePwNm0aazDyeX8M1QTD7biHtmv/iRX8ZohXFbs5b40/ZR4wcrwToPKKDk5nsNZzuj5OaYXxM0pC5cU5LCmq/2U+S1QhQMZPFDondwV0+gxfxMYFdTK7tkpolcXuFUnjBmE2M2VgqjLW6ji3pA7JxLWj4cXKNLbM8+cOrulI1xCO3iD/1MyaKIchl8OOawrjDSO4yQ0XWwCfTIjCPjawQyR5fFUo7EWrjS6MfhY0TJ6/ASP42YfyyqlD7uRxjgublJx4oIlGPE4hSmEnR6kQaJsRirXxI2Sw+QK8iElfwADrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPum/TmuAvA8VCgJrHHDtqHbUSXJTw73R+ZAo53/3uA=;
 b=ZCYNLCxdDTKDNQHBW2ozEl1VNj+Ar6kE35jhVRSsJhirCd51UQ62936UYEekxzmTn9ZTcFNKbG1OW+1F6YBpzHCIjud28WT8BewGaOR83i7kPqYhuI8+nQiNudVueqMSWFtIKm0Xl8xgBPHygelpWIBAPHBEpT/AZ03VeCEGJBxCa5D7jUqZRNhyDIi6/mLI59lceUlU7Ihs5u07y487xhauAxGs3tjSRzbW3QIdVEYGSpgHxKuvwzyTUHGwwVOiIOqXYeei9BuOTNFoYGNQIOaDz9G9XYNw8OD30AbabUIvYaG3aICaxzXRjYcgPtlEwP157xWWLaacdGtK8Sjeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 18:25:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 18:25:42 +0000
Message-ID: <bae1c24f-e2c6-4f17-ae17-97c48184506f@intel.com>
Date: Wed, 9 Apr 2025 11:25:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ptl: Extend Wa_13011645652
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250409001013.382830-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250409001013.382830-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf55bee-fbbf-4a27-80e5-08dd7793ef73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wmp5bmEzdlg4NjZ1dWt2NVhSRG4rTkJCMzJYcU9haDMvRVdsemU0dndBQzdD?=
 =?utf-8?B?VFNqbjk2MlUvWW1idTlhd3FtakFSWVBCeGpqOXcxUWxXYTNHcXFpQVNra2Rw?=
 =?utf-8?B?REF2UzBHZ3kxd0F3cnBzYmRIc0NvU2FWWXE3Wkx5YzFVdW50QkJNNWJGNk9S?=
 =?utf-8?B?Nm5xVTZuRTJmOHRQUVJPZGl1YUk0SVJmcS9kSmJuLzNQYm9IRWZ6VXNzTkNw?=
 =?utf-8?B?a2xHTFFZOWFUcVMwZDRKLzhtd1JXSldwQ1RtQUhuVmNOenNOdFNsVTR6Vndw?=
 =?utf-8?B?c0RMNWlqb08rMllkdXphVFhOVXJuMzdZcExDOVVVMk82dG5UdnAwZTlNTGNn?=
 =?utf-8?B?Vzd0S25zNWNpUzA2YVk2TnRWY0kzc3JzS0hjcmpPUFRIcWY1ekpzd0dWakE2?=
 =?utf-8?B?aGUwQ3JLTDlCa3o4bEdybTQvZDNsSXEwVkhLMmVRellvMDAyOXhGaHFZTkFU?=
 =?utf-8?B?Wm1SYjBGQ3RFSFZyeDAwTGNCaFc2TURISGFtL3hsUEpoVUFnV25FSVVDbTRB?=
 =?utf-8?B?ODVsYmV6aWZDaTY4YnZSdFhyN0JjY3hKYXdNUmdpdWFlNkhTSE45a0NFN1Bk?=
 =?utf-8?B?Q2NJTGlmMWt6TmJQbVBXMzVOT0RJUFVkelNHSkM5U1ZoYVBpUUhwSG1YV0pD?=
 =?utf-8?B?SEtXQnVZZERNMDhtcjBLYkluSkovVkhkQVExUmQzZ2JwSXJ6V0JvZ3FYZjgr?=
 =?utf-8?B?RTZPRjNyMWsrZkMwdVZ4YUt5Q2IzNEJJOW1NSVZHbm1PVncyZkR4c2N5OUxl?=
 =?utf-8?B?ei96eEFjQ2MrZXlxTmpWWUYzL25qTWZKU2xOSkU0L1daQmI5RmxSb3pTeTVn?=
 =?utf-8?B?UTZoL3czbS8rSjZTRHVWRzJsenUrM2xIRUp5M1ViQ3VmVDlwdGQwbElweXZr?=
 =?utf-8?B?aE1JOU1mSXd4UGxjbFY5MVI3K3grY09vTU8xQVRlazNxekdmdVVTUzFneVhR?=
 =?utf-8?B?d05jcXZJTndNNUxoRFdDbWdib1FGMi8vYnZFTUxNUnZqMUJKc0JxV1dlcWJr?=
 =?utf-8?B?UGR4U3AvZ3BRL1llQzl5M0htZ2pGb3RNNlBuYTQrbCt3YklJMWxBalU0VCs5?=
 =?utf-8?B?cnpFNGtyOXRZbk01b1JhR3cxUHovc3hZd1RSVjVXa0VTRVRNS0k5L2trb0x3?=
 =?utf-8?B?S3RTaFVwSDlnNG1OeFJWUm05eU12cjROaUVZalB0OFZPWkh3Tnk1SllKZUlL?=
 =?utf-8?B?K0lnbExoUFZldUMzYmo3TjdNL2Jva21STDJScHU3OC9VZGF0NmhhTzhCRENv?=
 =?utf-8?B?QmFuYXhGY1lZcjd3cU5iL2dacUIvN0pZYy9QQ0NkTzlsQ3A4NldXSmNqU0lh?=
 =?utf-8?B?UUVVbk1JLzYvZDJMWUlaZXZ0ODlSQTJuY3ZmMDJQMWNFUWFXT25IMExqbG50?=
 =?utf-8?B?aXFMQUQ3K1NLNFVpSEQ5VlU2VmUvampRdWdXUFV2amkrdDRmMHQ2R0JKWk4x?=
 =?utf-8?B?QUNtaDVweXFkRGF5SjVsVDJZWE5QaXUyNFZtcHVpNHk2cDJQR0xUQjV4cHlt?=
 =?utf-8?B?cndnQXhTR1pxeTU4UERmRHdYaGxZbUxXK2tOWVBaV1A5eTI3M2JNelRXcDFJ?=
 =?utf-8?B?RGRQWlNQakk4bk5iN0o5SmVhMGorU1NQVlkwbjRNYTdmaGtmelIyTzhTdnE5?=
 =?utf-8?B?NXVVekpucWlacjVHNU03bWNKci84TlNXUnErUHEwdXpwaFpIVTRreHRKcDNZ?=
 =?utf-8?B?Yk5LWFRXVVFaTC9aL0JYd05wV3BFMi9rWGo4R2piR1F0aVBZdWkxeTJndDJz?=
 =?utf-8?B?eHVOWUZmTm93QXBDMDNacE9RbnNDRkFKQjBWQnBncFJqNjk1YU5mcUtYWDYz?=
 =?utf-8?B?VkRvczQrRlM4eEFPUDBXNEg2dThWWDJVay8wTFFybC8ra1k4QmkyelhJeDF3?=
 =?utf-8?B?TlY2MVprUEFzYzJWU25nbHVjQTFLS1dCWXJwL2p0aWlkQlFLZ0hjWFFScnJF?=
 =?utf-8?Q?wXr79MsjarM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xMOHJhTzBHdnlEYS92NnN6andzVDdqbkgrTnZZeTg1cGo1ZjRWZFNibFJy?=
 =?utf-8?B?UmF2cXFJRFhBQ0dpS1V6Q2FEWHI2TWplZ1QrWS9ZS2JSRTdWM2lvb3phOVoz?=
 =?utf-8?B?M1I1WWpaRTRBUmZWOXNhRlo3K0RBb3FMc2pnM0pCcTdWL1drNXA2MHVpY2tH?=
 =?utf-8?B?R0NuWHFKQzdyVGErczZVQUdlcmh1NURpbktISm16MENqcEFFdGJ6YUIvUXdJ?=
 =?utf-8?B?SlE3SUZtZ0xsaVhjRVJKcm8vRkkvM1BjZlZjTlVSK2RpUUNycnpsZ0t0QTJJ?=
 =?utf-8?B?WDdVbG5IaHgvY01JblNjZkFLVHRQZUVEb2V3YWFHYUxXR3dhZUk4ZGEvSlNw?=
 =?utf-8?B?MWV5Z2xZcm9ENk1CZnVRbElrcUlZU3pEMHdDckNwY1V2WTVOZFJNMHg5Sm1G?=
 =?utf-8?B?VVRPdnNTMEdmOTRER0JHbmVROXFVamdxaitlNUhlcVA0ODBiUTFWM1F6VC9C?=
 =?utf-8?B?VmNxUDRUbG15ZWIvejkzUUwxdWpUTkYvdWpERDVlYkcvc2tvZytVWEErZ3hK?=
 =?utf-8?B?UXl4eFRXWktjeG84NkI3eFhJSVJEZDZiVjEwbTZ5UlNuZGhleGhjUkhUZ1Bk?=
 =?utf-8?B?MnArRjJHcy9ObjlVSDNTYnFYKzQyYVNveXE5czlkODl0MWcyU2hZTC9OWFdO?=
 =?utf-8?B?cjlzSUV1dnZKLytEL05ZMGlYY1Q0eXhxM3FGQnFrRVV6NGdCdkIyWVFwckdv?=
 =?utf-8?B?MVAvT1IzTGRaK2pLT05YTDcwM1hMeWJoOUlTblgyN2RSNDVsTnZlZTVsZUEz?=
 =?utf-8?B?ck1tNlNTbElaMG5KNURNNlRqUVNxZW8yUzlNdGpNcW5JTGhIT3YycmFPUkM3?=
 =?utf-8?B?Y1ZOUTZYMzZKRUxsdXNpV0pIRE51NXp5UmRDMGsycG1oVllZRENoa2RpWldt?=
 =?utf-8?B?enJ4OGpuR2JaMHZsSkMzYTdMMkVSR3B4UFY4NXpUSWd3ZEZ2Z3pNQ0ZwUEQx?=
 =?utf-8?B?a1Z6Y01pVlBSTFNicjE5RFFFelBlTUVTYzRKK0dDTmFQV0VHTmhCWktmbFEy?=
 =?utf-8?B?azRDaTAySGhrbDdXb045VG1HdkU5ZDFTOW84MC9YbW56QmxLTEFMQjI3UG5E?=
 =?utf-8?B?SWRucjcyUk1OUkdvYUg1UGxiTUhIODM3VUxybXRNR2xIVFlZOG4yVmtnTVg0?=
 =?utf-8?B?aDAzVWVrdE8zM3dpck9iVEdNMm1pWUkrNUttdlZrbWtTcFRVVlNmeVBsYVB1?=
 =?utf-8?B?Z0QvWFF0dVdnM0lreEJNTVd0c1pnMXAvNDRvbmN1VzNVeUxzazl4b2ZDTmN2?=
 =?utf-8?B?d1lBVEsvVWg4VDNQaG1DSlIvS3grTXRFV2pFbHQwT0RaSm5qR3F4ZWlsaGZx?=
 =?utf-8?B?ZklBNTNtSjk5cFJ6dzNiZDlsL3Z4cWozZ0g4czYvUGVUTHRyNGdDQ2ZzT2NS?=
 =?utf-8?B?SWx0V0lMUy80bFhHaWZ1M1JydlFyZFp2UW9xYnJINmV1cTJOcG1ZeXozTWtW?=
 =?utf-8?B?WDBnd0MxUS9xVjR5N1VyVzc5dkNEQlEyL3R5WHUwaW83OVFvY2VrTmczZVVX?=
 =?utf-8?B?QzZMeGJ3UzhmS2o3MlFVSVZMT0J5VkdWdTBkaUsyQ0Y0SjBPallXQXNQbDZv?=
 =?utf-8?B?bmtIdyt2VHQ5ZkJmM21JNjJ4bG0rdXc1cFp6bUFWMFp0TjU1bWIvSkRqQWVi?=
 =?utf-8?B?NVBKZzRNcHhQNHVScys0NmJxL1VDa3V2L2E1ZHA1a2oxbmNadFlNQXdBR3F6?=
 =?utf-8?B?OHE4cHJlM2FTbmtKSllNTXhpOG1rRFlrMHpRWGdNUzF1RndicUdtbGZmWFdH?=
 =?utf-8?B?bnFYcDJJckl4VkJTQlg3RmFha0hnSkxrZWNKRjZ3eEVjNlNjYWRLYVFFc3FO?=
 =?utf-8?B?Z0tyVHRKVjNha3MwNmpTSWYvRG4wRXhwRkdXRzJGeXZOQnRTejVkak4rMTVG?=
 =?utf-8?B?eVRrRlhQRTBuVnlqK3h3cDVZZHB4a0pOZmM5MVlQLzJDa3JLcXp3d3lCa2lC?=
 =?utf-8?B?cVlaa084RUl6YUxhQlQzcUdiRGVFeHVuU24vVHFHOElGdFRrc2lickowcXhN?=
 =?utf-8?B?ZkhOMnVMUHh6YytodjBpYXRKNHNudSsxcEliUWhEcGtrTXhLQUN6RTNaZ1RL?=
 =?utf-8?B?eDNhWU1PYm8rSFMwelNJK1BBVU1ZTjRSc2J0MFc0R0VzOEdPRytrcVlKTUhu?=
 =?utf-8?B?K1BML0pkNGJXUjdZMEs4OUx0NWliMEhtdnhjY25Pdjk1aWY0Q2JxTi81ZFRj?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf55bee-fbbf-4a27-80e5-08dd7793ef73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 18:25:42.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06a8/N6v9D+OoGIeqFSkHC9ZhMNHaCGPcFIxkr4vi30+KbjJNM/gC5xjdlP68ETjS7Bhu7liUzVRnwMt39vi33IaQ6vvyoctHWQfkr3Rnv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
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


On 4/8/2025 5:10 PM, Vinay Belgaumkar wrote:
> Wa_13011645652 is applicable to PTL A-step as well.

This patch is not needed.

Thanks,

Vinay.

>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9b9e176992a8..48491f8af746 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -29,7 +29,7 @@
>   16022287689	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   13011645652	GRAPHICS_VERSION(2004)
> -		GRAPHICS_VERSION(3001)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
>   14022293748	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
