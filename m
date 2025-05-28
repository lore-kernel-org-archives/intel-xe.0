Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE5CC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 05:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE1210E581;
	Wed, 28 May 2025 05:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2818U//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957F910E581
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 05:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748408595; x=1779944595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mXtawfNfuThlNFGjb1dpkDsJ9IbvOQcAVxjh18IZ0x8=;
 b=U2818U//O5mB0tFhAGmyBCGBv7njziam/W9Brv/Pr2sLwmESLTyDLXuj
 o2YcZdI2d7ZmWTOOgNBx15qqB4BKLeYGEpKdI16r2tF7eWs4yxm0852e3
 dPxdQrGmy8cT8gh+r4KUJwXiETd/pYdxJ5apltexh0GBlboAK3f9YI9fs
 KrzAIIvP9w6d5/fivSVzBbtZ9ayO5ssjeM7lGKA3SP5jOdk3XL8c6wN89
 nQf6vmGHFEPR3fBXYHJ4SVmkobm+X1doILCf71g5nrXf8TtfQ0ukmEE1c
 kQ7dnaejNy7sqMvHOb39IJD3k0XbwTjEfT7HsvBU0bTBpy7+zkAY7HUzC w==;
X-CSE-ConnectionGUID: 0x5gXpTeSWq2AXi8CzTU1g==
X-CSE-MsgGUID: 2sdMce6kScCqZQ+qduZglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54069801"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="54069801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:03:14 -0700
X-CSE-ConnectionGUID: AWz6z72GSligSNabu/gi0A==
X-CSE-MsgGUID: udBa2i8qRO6+4sDnWQsU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="147879574"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:03:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 22:03:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 22:03:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 22:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVXbzJP86bQzPs19v3jiZE2IVT4xGT5wQ0COkaQV2By3plSYAcUxInLWjR01Nb5AWVpZ9iZwYvQbhkKFcIHSXmZBGxKe0wHwNVWrodEj6lC8U5WN2pOSG/icLoDwHoo+FFw/wSYVvSptsP1YfBmKL6q0yK/Q8+d5TrqTfpjQxdMKHBBvVXCcZ0W4rx5ltj6kbSy68LfRm5mrGTIoUntKt0GR9vDKtF/hvwdJ2WYYrt2mNbrhd85RF+GOMPqwQXX7BXFRsjSRcUThOvBUN5dnA/EHVr5usEbXQA8hApcJ8MKqzv58ye7Lj6LS1MJdtpn1VHyyYE0v1Wcynp9BYd2Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdJZKsP1oC5hb2WT7ukqpRP+C0gBfUsa0/alc4sxMIc=;
 b=J9OdKbvztfr91AsoVQVfRMFUtvULIQGG75CObCp1XLchkx2wid+DwmvmIx9ML14b2WhijWiqFtc3DeI7bRKjUlb/9B7ARTByhkPLhamkDnZXIz8oR2bk9ZrUyXv3MO9R08ljJZAlLOlShi0wLcFEnXJW8qu/XLIag0+6dP7vtJdM3FOWZ4f1PLlzjmg541vt6QEsK5M1BveetRlimhNboxlCS9WeIX0DHio4s2Bp+y0fwZFpryzB0lLfWJLRDXouj5+Vvgay8lgukuKAGUHM4uPiuM5Z/+WkNQO0qHeTch1Md62M1SMnF7f0loa6e7xwnOqEO2CwVpJDOMnwiYMIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 05:02:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 05:02:55 +0000
Date: Tue, 27 May 2025 22:04:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aDaZWrg+1u7NLX0f@lstrano-desk.jf.intel.com>
References: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
 <20250521141141.17572-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521141141.17572-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: e006f990-dab4-4bf8-2985-08dd9da4e882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGRmSzJwb1YySHd0RklIaWR1dWxJM0tNMUZkVkJUN3JJbnFwUG1TRzFhV3NR?=
 =?utf-8?B?TEpNcVJFbDJOeFVZVDZTUUxpWHljYlhoYnBrVFQrZ2FGeXRZZnRZbklDL1lH?=
 =?utf-8?B?Zk9qNlpPTDlURkdOc0ErOWVtblhCU1Q1UmZ4YUdZRFpEUmpwN1F1Tk0rckgw?=
 =?utf-8?B?WGxEampidlY4YTRsUkxDazZsYTBUU0swQ1h0VUk0SGpJRWxDTk5kaDZWU2pC?=
 =?utf-8?B?czZsNnNrUEdYeHdqT3BPWkd4YnVkYzJtckp0ZEUvUVBOWUdYbzlxa1NVemo5?=
 =?utf-8?B?WmJnTWRoMGE5Sks5enRzOXdZUlMvZVJWVERMRVQwYVdTcjdBMnFZWGppV3VM?=
 =?utf-8?B?a2lVdG1PTU91K25uTjE2VElMdUcxdlJ3bTk2Wk5wOUdOTDA1eis3UE04UUF0?=
 =?utf-8?B?UTU2NVlIZ2UwUlZGQ0RXYU54NUYzRFBtWE95V1U5c3VORnlDZWFVeE1lL05Z?=
 =?utf-8?B?RERPMnFJdng3U2w1UXhiZzZ5UkQ1ZjNzc09YOXlSTTNLSkZhdEU3Z0dkTkov?=
 =?utf-8?B?ekgxMUpLZ21URWRrcFdReGl5eko0NDRYTGVzNTJ1YUp1OTFaRWIrR1k5U09Q?=
 =?utf-8?B?MUFhRVNETmR2NWRkWnZZLy9NRExOcGljaVZiMGY4THhzM3BxamxzQ0ZHN2VY?=
 =?utf-8?B?Kzh4QXU1UUdMaVVpNllPY1hzT0xuajMvQnFMazZOTmZNdXdtN3JQbE9rMW5Q?=
 =?utf-8?B?djdGRUNEOGdTb1h0ekdOZ3ZlamYyRDc4c2pCRUt5VVM3TmNjWTNhZG9PQnE4?=
 =?utf-8?B?QmgvRVhMUmFBTE1xL2JEakFiMWhlaDMvTmQwSTR2Tkh0NzIzYlJubzViZkth?=
 =?utf-8?B?SUxtT0M2b0xlS3ZOK1RqaHJEakpMdytYTzUyVWpCL0RnMDdhakkzTjZKVTg5?=
 =?utf-8?B?blVrVmh4U1hyQkkwelBkU290WlZadzZ3cmRlcG43bTlYL0RNS2NnZTRHWTJK?=
 =?utf-8?B?SEs1ZkNSeU9aWlEvL3U4WUVwWStJNzFEeHp1L0UvSkJzZlN6V0pMYUg4N3Rr?=
 =?utf-8?B?M0xxU3Y1RXRZcU15R1dkWmtQbEdJeVBJTFhOa0V6eTY3Ri9aK2kxTzZzdVds?=
 =?utf-8?B?Zm1jdnpSc2pMVXZtbFQzQ2R2MGJkZnB1a2lLd0tkZnJhY0t4Q1Nuc1ZYcDlS?=
 =?utf-8?B?QzBsVHp4aFgxWlphcjdSTjVBbnNKZGhjZ3puQzZ3d2UvbjFwNXdPTUkzcWVm?=
 =?utf-8?B?aTk0aGdsVmluSGZBUkhpaURYaXJKanM5U2FXZGxDWjV1ZmhwNldldTREcm1a?=
 =?utf-8?B?Y3ZWSEhya0VEZzd2OCtobFp4clk5eDlNNDRJOHhRUFArT0QrREpiQzU5Vzhw?=
 =?utf-8?B?VkJuNVVxM3ErcStyNkN2L0JMSG1YMldFcVVmbGFnVHZSejkrT0ZYcGZMQjhi?=
 =?utf-8?B?Ymd0NVlEM3JONXRMcHQrdW95RDFFVkRpVUh1TWNZMTdsQXF0M1RFZXcwZjhK?=
 =?utf-8?B?bWtrWWg5MzhwYzRERWJkb2F6aTdmMjZmbnRVdWNwWGFVSmFFYkF4Y2c0VWhy?=
 =?utf-8?B?MWlhblppRURGanpkOFNEY3lCRW4vYnZ1dE1NK1RFTzNhODBWd3ZRSm9IR3NU?=
 =?utf-8?B?RlR2REZwZ0ZwOEgwR0MvN2hEckt3aCtrRFdVcVkxVlR5MUM0ZHZWaXNDQm84?=
 =?utf-8?B?MWdiUCtNeEVoZi8zNUllVHNXV2V3eXgvbVFrQzFWWk9veHVKaXh0a2dNQ0FT?=
 =?utf-8?B?RHdud1F1UG10a3dHSmhlRmJoSndyTTJBMVpnNnhrUk8vNmtwRUZWV05GMGow?=
 =?utf-8?B?VC9WblRKdTVOVEZVSDJRMlFmdmJhbmFNLzdkSEZLNHQwVTZ4MlR2MGNGcVRJ?=
 =?utf-8?B?RFFFdzR6WkJTczF5OUM1U2JrcVAzSUFtY3VyeGFXY0c0dktnZDhTZWJ4VmVT?=
 =?utf-8?B?Nms4N1d3TUJ3ZElidkR3NzBROGVabEM4QTFpcjhjTnBCT0c0WU9XYWhHSGtJ?=
 =?utf-8?Q?iml2PUZEtIA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFFjeW9OenZIM2FKQjhrbUZDeUpEZHN5RGJiR3VDdTQ4N3RsSmRPOUp1cWlD?=
 =?utf-8?B?Nm9xSUUwcDkydXNoSTZmbE1ZaWpoTmJ4dGJldllIQ1Rkc2RyUEhXRnZiZHBs?=
 =?utf-8?B?a3B1b2FBck1ySTk0azVFT3pFYmxvSzZqVFhTb1NPVEJlVWxDdmFoZEd3Vloz?=
 =?utf-8?B?cnJqVXVaSzNvb0tFUWtQdCtISjRzNGJDWmhVcWYwaDFEOFBoTWJGZ1A0OS9F?=
 =?utf-8?B?dVpmcTBMaFN5YU1nZXBIbTNEWkxucHFHT3JoajViWGlzNWN2K25VSlFoOEEr?=
 =?utf-8?B?VmlZT0dXc01UQ1QvUUhxejNydWpsaGd5L2Rndk1RWkk1aS95Yk5ONGF5VVFo?=
 =?utf-8?B?b3c5SDZYUi9BbERQckhOU1hqaTF2OExTTWZHVVFJYTJCVjg2bHkvS1RqbU1O?=
 =?utf-8?B?NWVTMTQ0K3MyeUF0Y0NIRUdBNWhDVHA2QUMrN0JrY1JEYUxxL2VaOTNYODJY?=
 =?utf-8?B?U3BYRHRXdVAwaElmaUxHdmNrWHNoclZieU9uN1orWURtdjl6KzIvQi9HK1Rj?=
 =?utf-8?B?WE1LdnVuSmNFMkJTcG5wcitIMG40WW5OZDdWQlpoai9qc29qZ2kxM1poZDZ1?=
 =?utf-8?B?NnE2WjBPVWVVRjdsd2FGRzFncTJpbDhUd1NaeXJBYitoZkNEK1FOTk9ibVl6?=
 =?utf-8?B?anhVUTg0WC8rZnh5bkZBOXNQWjdrZk1PUENqOFFVTURCblozbE1icmdXMHF5?=
 =?utf-8?B?NWVrbEhqNmFIaTRWOWo4NUx3S1ZEem5LY0gyVHJJUzg3a0dhbkVnYXhqQjZl?=
 =?utf-8?B?KzdQQVRuc0VkOS9WVjlFTWNWR0FFS2xCYzZMN09nSUpBMlhIWk1USnMrYU13?=
 =?utf-8?B?d0dtTUJ1SFdnRGQ4d25YOXBlQ3RPQjRSZ1lEMElmNnk4NXVsb0tZVmo4c2h2?=
 =?utf-8?B?bkF2OUJnQ1ZnYXRGR2JTRkQyQWI2aCtQZFRQSDI4K1NNai95STJMdGx0eVdC?=
 =?utf-8?B?blZ1RVFqNVN0SWhjSG8vc2dwaUx3c25JWTNybmlaVnZ1am9kbWRXbnBQa2FV?=
 =?utf-8?B?ZmdxdXY1czQ1blJwV2UwamlERUMvMHRTZVIwYnNRMjdjVWhiU2pOc2NZeEly?=
 =?utf-8?B?bkNwV1l5eTJkcFJhOE1LemtOSTJmN2NGSHJ3cUpUUzR4OTE5N1R1MDhLQmVH?=
 =?utf-8?B?T2hNTU1rZmVhOXpkY3g0K1ZYZ0luRUxSQkt5bWhsQytiTjVDZVphbFhNeFJt?=
 =?utf-8?B?Tk1RbThJeTBQZkxudTQ1TldLOTZWN3NVTTc5d3MzVmtrUi91ekZOcTNkOU16?=
 =?utf-8?B?VEZvRHZWc3NOUlM5MFlUeEZrdGlmSjJ3NkVNOUNUeS9qWUZlaDFIQkRTelZs?=
 =?utf-8?B?bHkrS1lheXhRMVo1UlhwbUYyNE9pSVpxRi83LzF2bjRWQ1piUnpDYkY0d1hi?=
 =?utf-8?B?MmpsQW5sNzVwRElMNnVGN2tTVlZQcG04dlhBaHNQVzFYb3NQbnV0Nzd5TWVV?=
 =?utf-8?B?THVPektNWXdsMHFaV3hlQXFCMnJ5SXdhWSsrdXA4ZHNYNmduRXBBc05VdDRZ?=
 =?utf-8?B?K0E0Slk1WEZpS0ZEanFEN2lYc0Rncnhadis4VmoxUG9oOHQ3anA1VGNOR0o3?=
 =?utf-8?B?SHNoWGp0U1BDQngxbXlWTjVKbWFHNXZNR3Q4L3d2MW02L2xtYnRkRnYxaWJD?=
 =?utf-8?B?emVZY3BqV3BLM21rN25IVHpjUVNSVWthQTE1UGFmcXN6cmlQT3pVYkp6dEN1?=
 =?utf-8?B?dCtzR1Q0NkNpa1RIRkhUNUNoYnNEaFR6WFFHM3VXcG1JQ1lEbmhiZlIzNVQx?=
 =?utf-8?B?dmxTK2hUazAzRmdTc0UwOXV2RHN5NXZPMG16RDgzOXZsbSthT245UWUwZ0dy?=
 =?utf-8?B?NVR3Y0hSbWdXUXc1dVlRTVUybllGTnB6WTZ1ampUSVV4NjdQaC9uZkZEVTk4?=
 =?utf-8?B?OEhvWnE4dXBxdzVMYmVJTVlHR2VVbCtxL2hZaElDRDZLU1RzRUV1M1d1bG1x?=
 =?utf-8?B?TVI5NUV3UmhvaXd1WG96STN5L3c1cFM3TkxrYXBCeUhBM0VvZFZlZUl1VFQy?=
 =?utf-8?B?SDkxc0NtRmxnQm82RmJpUWlBUHpaTzlyUlI5a0kwSDhZaGExUWJVRnhQS3I2?=
 =?utf-8?B?bmY5NXNHZlcrQmdhSXlIN295VHVSWkptUWNUa0thdThVeHN6WlZJK0NKQ0x3?=
 =?utf-8?B?ZE5jeGxnbUEwNWRKN3lPY0I4YzIvUmNXb0xwOFY4Snl6bGlNc3ozVnBQaGFT?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e006f990-dab4-4bf8-2985-08dd9da4e882
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 05:02:55.8852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/lrI8qOmaolZgxISS5FnaKIJr7QcvDjChMZjGK8EQiFOOv3FFB2xOUavrgnndGBJ95upEIxAEpf7HPE9cezFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
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

On Wed, May 21, 2025 at 07:41:40PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c           |  33 ++++++
>  drivers/gpu/drm/xe/xe_bb.h           |   1 +
>  drivers/gpu/drm/xe/xe_bo.c           |  21 ++++
>  drivers/gpu/drm/xe/xe_bo_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 159 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |   8 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  74 +++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |   3 +
>  8 files changed, 302 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..bb10151c68a3 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,39 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx_id)
> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * We need to allocate space for the requested number of dwords,
> +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> +	 * space to accommodate the platform-specific hardware prefetch
> +	 * requirements.
> +	 */
> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));
> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..55d5c458d42a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -15,6 +15,7 @@ struct xe_exec_queue;
>  struct xe_sched_job;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..a26c97850a43 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -933,6 +934,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
>  	} else {
> +		if (IS_SRIOV_VF(xe) &&
> +		    old_mem_type == XE_PL_TT &&
> +		    new_mem->mem_type == XE_PL_SYSTEM &&
> +		    bo->bb_ccs[0])
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
>  					handle_system_ccs);
>  	}
> @@ -964,6 +971,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	xe_pm_runtime_put(xe);
>  
>  out:
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
>  		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
> @@ -973,6 +986,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_SRIOV_VF(xe) && bo->bb_ccs[0])
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		xe_tt_unmap_sg(ttm_bo->ttm);
>  	}
>  
> @@ -1478,9 +1494,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (bo->bb_ccs[0])
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..481b8e0d8ab1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..43de220b3109 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,165 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @dst_bo: If copying between resources created for the same bo, set this to
> + * the same value as @src_bo. If copying between buffer objects, set it to
> + * the buffer object @dst is currently bound to.
> + * @src: The source TTM resource.
> + * @dst: The dst TTM resource.
> + * @copy_only_ccs: If true copy only CCS metadata
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   struct xe_bo *dst_bo,
> +			   struct ttm_resource *src,
> +			   struct ttm_resource *dst,
> +			   bool copy_only_ccs,
> +			   bool read_write)
> +
> +{
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 size = src_bo->size;
> +	struct xe_res_cursor src_it, dst_it, ccs_it;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	u32 src_L0_pt, dst_L0_pt;
> +	u64 src_L0, dst_L0;
> +	int err;
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> +	bool src_is_vram = mem_type_is_vram(src->mem_type);
> +	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> +	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
> +	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
> +	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> +		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> +	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> +	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
> +		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> +
> +	/* Copying CCS between two different BOs is not supported yet. */
> +	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> +		return -EINVAL;
> +
> +	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
> +		return -EINVAL;
> +
> +	if (!src_is_vram)
> +		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +	else
> +		xe_res_first(src, 0, size, &src_it);
> +	if (!dst_is_vram)
> +		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
> +	else
> +		xe_res_first(dst, 0, size, &dst_it);
> +
> +	if (copy_system_ccs)
> +		xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +				&ccs_it);
> +
> +	while (size) {
> +		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
> +		struct xe_bb *bb;
> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +		u32 pte_flags;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
> +
> +		src_L0 = min(src_L0, dst_L0);
> +
> +		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
> +					      &dst_L0_ofs, &dst_L0_pt, 0,
> +					      avail_pts, avail_pts);
> +
> +		if (copy_system_ccs) {
> +			xe_assert(xe, type_device);
> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
> +						      &ccs_ofs, &ccs_pt, 0,
> +						      2 * avail_pts,
> +						      avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		}
> +
> +		/* Add copy commands size here */
> +		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
> +
> +		bb = xe_bb_ccs_new(gt, batch_size, read_write);

Opps, I missed this. Since you have a while (size) loop here multiple
BBs can be created... More on this below.

> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			goto err_ret;
> +		}
> +
> +		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
> +			xe_res_next(&src_it, src_L0);
> +		else
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
> +				 &src_it, src_L0, src);
> +
> +		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
> +			xe_res_next(&dst_it, src_L0);
> +		else
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> +				 &dst_it, src_L0, dst);
> +
> +		if (copy_system_ccs)
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		if (!copy_only_ccs)
> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
> +
> +		if (needs_ccs_emit)
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> +							  dst_L0_ofs,
> +							  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
> +							  src_L0, ccs_ofs, copy_ccs);
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		size -= src_L0;
> +
> +		src_bo->bb_ccs[read_write] = bb;

But you only have storage for 1 BB here, so upon
xe_sriov_vf_ccs_detach_bo we only free / zero out the last saved off BB.

So I think you need two while loops.

1. Calculate the total size of the BB (roughly everything above my first
comment). Then allocate it.

2. Populate the BB (roughly everything below my first comment). Then
save it off.

Matt

> +	}
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..2a2f6c4690fb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   struct xe_bo *dst_bo,
> +			   struct ttm_resource *src,
> +			   struct ttm_resource *dst,
> +			   bool copy_only_ccs,
> +			   bool read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 3ef801a1f117..0e8ff3d4b0c5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "instructions/xe_mi_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -157,3 +158,76 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_migrate *migrate;
> +	bool copy_only_ccs = 1;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	struct xe_bb *bb;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (bb)
> +				xe_sriov_err(xe, "Probable memory leak\n");
> +
> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +			err = xe_migrate_ccs_rw_copy(migrate, bo, bo,
> +						     bo->ttm.resource,
> +						     bo->ttm.resource,
> +						     copy_only_ccs, ctx_id);
> +		}
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	struct xe_bb *bb;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (!bb)
> +				continue;
> +
> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +			xe_bb_free(bb, NULL);
> +			bo->bb_ccs[ctx_id] = NULL;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> -- 
> 2.43.0
> 
