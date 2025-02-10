Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7CDC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D461110E3A9;
	Mon, 10 Feb 2025 18:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZb6KMPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762910E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739213801; x=1770749801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G5Bw3cNcPhsW8YZcY8YOTFXDXbDqVWr7nzzyzzX48oI=;
 b=NZb6KMPMaM/LkUked37Ozlo2F0u2Jj0rQ8dY909pNMZ64N4J+yZoCH+d
 yUdAgeLdSKfhvCIwPlrr5TiL91kSG84YN53Ik7RU1GWKwBHKs07MYyDVP
 +1KehEhir/DMrxuwld0XUOj857dUIr7vFweyI1OFubDe1XgTg24F3NTA+
 /pdltkMmCOpnGut+qq17rTMJ7iWbQe8OR0ytyi0BHWXEn1F5k3BnI6iLa
 1Irq77ZydlUwWlVGr/PsLK1afkYwGH28ndSort4YyvzkjLAILCFNmVXa8
 +11MJHdMc8912tXqQXUAZESPVNVmupHq+Yi2eiZHBgWBZ+X8NDrhdUwg9 g==;
X-CSE-ConnectionGUID: 0gmDz/UbTe+5vItYtNPoXA==
X-CSE-MsgGUID: Vw0mEdViTfuiozYd4e0bPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57348341"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="57348341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:56:29 -0800
X-CSE-ConnectionGUID: D0QONNZuSpOyw6xbwxxHwA==
X-CSE-MsgGUID: dh8BdmKxT+GHTjXzozHJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="143137694"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:56:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:56:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:56:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:56:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLW7OqlsKfCz1XH49iYPPnDzOQgt1zEVO7ARn+HE/6WUugupsdrQINHMGbzKTZ+Ird4sIeLR6pBsuBoT2PCDj5PkL8zdmDAJu+W8tZkCuGGWJCriuvqISE8p+N0FxbjrJYusy0CxIDZx1bLoIFLFgHKLAVBUtm8t1p3e484PsP8E2q6bZg+LY7rx3KLJ2cEOMDxF5NIfTYuUV2V0H+Q0QMWmc7Oty5P+B4tKCA+E5WFXexKIHh4/SSJsbpmHfBZaqmvkbS9qx05oWO9B8tdZDcR+FjWBfNDhseTkGhxjbXW9Acd46PGw3gPCB7KV/YA2fLFDY2zM4Q6LVqkcdDM4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoU7VUTGZ+tTBi5mOvInHbP076d8hUV8JQLt/lp99gs=;
 b=XT5NLDWqrCc1Le2u9Nhr1WgUKlR5s7762l7a4lotdXNwwDI/nDgvX9M1FkLg4AtFJnZFOht0DnBlT5pfGFWdGFr0xPN6d6I378aFbq1vfAGAFZmsWY6gvqcotDUYa3HjGJhLLEHx2/WEBl4e9AxbIygvEGtlusclZx6VW4wGxQqQkBDtBjepCbzUAxDe4Uu7o4x4TWZ5adBfSp/rKxLyib3rwOBEBMyyWmrLp8sMqZIeh6HNyQi5iYAqUIl9716xTGfZo4XAuw3q3GxxAv+0TOazoyUrt1tknucoip9DM+nfgk7O+2mj/ly/fbNfAIMMb22yjNaJMnUvdABeK3TNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 18:56:11 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:56:11 +0000
Message-ID: <fdf6c44e-1a1a-4c61-ba2f-6af82a3ab5c5@intel.com>
Date: Tue, 11 Feb 2025 00:26:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] drm/xe: Cleanup extra calls to
 xe_hw_fence_irq_finish()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-9-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c835e7-df79-4fa4-a74e-08dd4a049613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U05MdnNBbDJhNk13UkFGRUgvLzFOMmZqcWtnUDJQVFMzVkRDSmRNZlJGTm1U?=
 =?utf-8?B?MjU4cWdVY2xzTnVMRmJPK3ZDNjQ3aGIvZUd0MWVwOXg3ZEFpVWtwb2laWXVO?=
 =?utf-8?B?U3lobENaSTFrTTMzUFl6TVl4WU1ZS3lOTHUxWkV6NUQwcG1HZEZtMXRKSFFl?=
 =?utf-8?B?dGNCYXE4ZU9ndjlzQit0Mkw2Z2lRUlhqcHVoTkxBdWE1S1B6d0dJNXBmTWQy?=
 =?utf-8?B?NGpaUS90MDZvbU1yYWdRelJYM29UbjFRVlZPT1ZycUczaERua3FWcEN2a3dR?=
 =?utf-8?B?VjJjNzYrQzBzT2x6cUJBOHppN1dzVmVjdHdZSmlnQ2xhQmJETVdNaWt5SW5J?=
 =?utf-8?B?MldGYUpPQmtYcXpDK21EdFR4QnhBOHFSaE5Yby9oOW5iaG94cnY5S2gwUGFZ?=
 =?utf-8?B?ZnRyTllNNE85VUhQVzkyS09ZeWZIWDVRdW1LSGtoNmNuK0pEeVZRVHJtc1lX?=
 =?utf-8?B?TCtIc1puSklBUGhDbTAzM1p3SWRNaTgwUDQycXF0RUNWb0syZklSRVlkNGZG?=
 =?utf-8?B?RmpsN2FLeURlNjBMNEUrdmhKY21jSHRXL0lxeVJLeTN1ZnhFR2VmUlQ1REts?=
 =?utf-8?B?YlBHOE9rNjcwQ1NkbDFlTlBlTE1ySWw4TjJsUGVablFBL3VyWWNUeXNtUFM4?=
 =?utf-8?B?WUFsVEZSNWh4dVZldklYcnlsQ1RJUWorcE5La2l4U213V3ZYNXM5RFVFcCtH?=
 =?utf-8?B?M0RQSlVYUjhmL0RReXllQVl3UmV0T3NudlFMRWFWZFNyUTB2RHRpTVg1S3hF?=
 =?utf-8?B?bE4xT28xVjg3Z1ZUa1h1TnFmV2JmY1hRTXY2QzllbFFscytER0E2cUZQaXJa?=
 =?utf-8?B?UTRkM3Z4ZlhJQVRKLzhuamFZM29nWnhETkFodjl5VmtwMFRiUHg3K2FRNGlt?=
 =?utf-8?B?c1B3UTgvclNkSDgzT1B3Y2RqRzFSRXdUOEZLdURaVGc3UXZmVmZpV05qaHg1?=
 =?utf-8?B?dmFuN3hUamxLQUdQQlUwNWdsd1QwNkJDWk8yVWxlN3g1ekVHZHRlaWxBby9m?=
 =?utf-8?B?Y2ptMTVIVm0zVVplNG56VVg2SDNFR3JMNkUyVjI0M3RreFN1enBlemlQcURl?=
 =?utf-8?B?V1JZZ2xtazM2OHJKY2VlVXJjVDlmZGl4Vmw2MDN3Y3BCUmFtRFRybDVQZTJE?=
 =?utf-8?B?TWI3b1c1dzlJNktEZ1c2OXdzbWx3Tm9aUXhWN1RoN0oxbERqMVZ4K1BXamFj?=
 =?utf-8?B?UUFSTlBJZituemlHenBNTFVzVFBZOEZUcHJhMHJNK25DbXNRTzdXa01IRkxm?=
 =?utf-8?B?Ky8rNjY5ZnRWQTFvRzhVR0tsNi9MYnNjNWE2RklJa0tmTkVwYUJXLzNUK0tP?=
 =?utf-8?B?VWNjRnJ3dEdQbUVUM0E5clhmcWtSZllHSjZrQUFDNjBKWk1DajhoQ1Jpek5E?=
 =?utf-8?B?ck9iMVlpYWFKOG50TWRyV2lETG5taGJ6REg5L1l6VVhNTklxRVFKUFRSNWxF?=
 =?utf-8?B?ZkZFM3RYRFhtQVBTT2VSeGV2WkxSRGUxenlDZURFUFVQTmthSzJlTzBEZTFj?=
 =?utf-8?B?SnJmY0t4VjhQdDQwLzhyU2lTV3pVU3dLR2VKREhpZkJJTHR3Q1N2aWhsSTE0?=
 =?utf-8?B?WFpPYzU2MUN1QXdmTkM2MHRMK2RVMEh0N2I4OXA0WkNrQVlIV1pGUzFOb0FU?=
 =?utf-8?B?MSt2cngrdkMvMEk0U3BZbEFrVTMxdThuOS9SaWZDRzQ2VVdlSm8rQlp4Z2p2?=
 =?utf-8?B?TVdPWDVzZFBlRDNCemk5c2pKRFF5NnZiWHFyUkRhRWd3U3lCMFFXQ04ydjli?=
 =?utf-8?B?VjdBTTQrQmVMTXF5Vk9ZTFR3S2loUDdNV3BHZmt6NVh2aVJIeU82QUdhWlB2?=
 =?utf-8?B?dUR2TjVObmEzMlY2Q3ZTbFFYcTJZWlVHVUY1ZFNIeUQveVNjbk5xTE9NSWpj?=
 =?utf-8?Q?W6ezHjh/8tJpt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2M3MlpCaURLdzh2SkVOQVZEcHBvS1NPakk0cHB6M1F5emNNQ0xwdmo0Kzh4?=
 =?utf-8?B?dm5teHg1N0Zwa0xOZm5qZWxFeEZtTGNVay92UVdrbUhPSXhob016ZVkxM1BM?=
 =?utf-8?B?dHo1blhMeDJXYXpsRnRiTEFoOE9MZzRLWU52Rk1obk9jMFZWaTRXOGhUL1pp?=
 =?utf-8?B?c2cyRy9OL3ZLNXlsUEY2SjVTUU1IaXBhd05KSnU5aUJTY29KRE9GSEtyZ01B?=
 =?utf-8?B?OVpoT21jQWt3MU16VW0rdC9tVm52MGQ3bE9GeGQ0MFp4K2VRcWoyOTJrci8r?=
 =?utf-8?B?dE1pOUFOUUovUHpzR1BIRGgwZDNOWStvUHVhVGRlVXZHVGRWTDFMWndYQmdu?=
 =?utf-8?B?NW0zNEVJb3hOTWRJeDJjbzVKUXkwczFsTWl6WUc2L0JwVW9sUExrY3NFcmJM?=
 =?utf-8?B?ckJQakRsZ0NUYXdFS08rbWw4VlE2UkllNHdkYXNobkVmdXQ1OWtRajR5alBC?=
 =?utf-8?B?dFVSNGkxcUdsczVlTG1lUGhucmZkdkU3ZkN2bWx2ajQ3V3RMYzE2azhNNlFs?=
 =?utf-8?B?UW1WakY4UzFnWVNDczlaUFFLWXJDSG5oRENnM3hweFoxL1FyTXRrVE83MkRi?=
 =?utf-8?B?TXdFOHNvWlJaKyt0SllQYmJHdytDdnVib204c1FBMFNKeWJocmRGd3hVUXJi?=
 =?utf-8?B?d1pLZHBPUis1dDZHQjVQUzJSc3VpSlc2UVBud2NXTlE3dC9VeVBkZmFOT2hW?=
 =?utf-8?B?UjNUakMzd0xzQXF2SS91R1UzbWtpYUxYeUFvVTNKdGxCeGRTSWUvTWVUK2Rr?=
 =?utf-8?B?Z3BaTmpGUDBMSlp0WUdBWHZIT0xFSG5UQ3djd3FhNWVkUmc2SkRnNFBkcFJj?=
 =?utf-8?B?aGplamJYK2tON2JSbEh2YXAwODdjcFFwazlLVVUyS2lQeWd2am9naEtSekMv?=
 =?utf-8?B?VERNY2JmTFVESlBWWkV2SDBTM1hKV3pDV2hDcUNnRUJmcHJaTWl4V0tnc1ZM?=
 =?utf-8?B?ZUJ0ZWNQNGlnL205T3VLMFpTRkczNFgwL0o1SktXdnVWMUZDT1V1Q1Y3bkd5?=
 =?utf-8?B?d0JHUWVaaHNRNzBmY05FY21wSmpWZUd0MUxZbVFrZlR1M0dkbFNtazg2U0p0?=
 =?utf-8?B?SVlnY0d2WEx3ajNSSytGd214dEd4ekxqeGRwL3pDanY4RXVCM3lReUlTY1Rk?=
 =?utf-8?B?OG9heFA5djBZbTFWYUhKeldVL1R3YUxnWTU5K3YvTTFTRFhtdjkvVEtmTFN5?=
 =?utf-8?B?elphRkpDSHRSbHgzV29mWkQ5UHdzQUlwYUV5YjE0UzVnaDNmd3FHTHdaRisz?=
 =?utf-8?B?bGNobHdMTnI1L3JlcGp4OXV6Z0czNVBOM2dKS0xmTFhNV3h1MmFmK2YrWjMy?=
 =?utf-8?B?cDRaYzZud2dJbmkxM1RweUtMN0hCVG1YbE9pNTc4cmU3K3ZuWEpMU3IxTjJM?=
 =?utf-8?B?N1IvNWtqb1c2VVdtU2RpUjJwd0hoalVsbGx1VXVTY2dQWjJGMTdRN2NiR0t1?=
 =?utf-8?B?SzEwbm1KRFVNMEY5T3lsbEpGakpZNHdXcVA3NHBObjMvRlVHMUV0a3pBeHBI?=
 =?utf-8?B?ZDE0SGc2RlFBZ3RKQjMxcUs2eVVXWHI0cHZUR0JnRWdjcjQ0L0lmNjA5eUV4?=
 =?utf-8?B?a0NRcDd5RVFTSGpVS2svc3FXdGhtVEo1VUphM0JlUGpVc3FqTkxFNGJ6YkRM?=
 =?utf-8?B?RVBlZVRKTWQvQktPNDJVU3NubmhBU3B6MEdIZkRHTXJWQkJQSTlSUm9iVW1D?=
 =?utf-8?B?RVY4VmMyVUxSbjA4QW0ybzlYM2F1TjNPWUVGTEk2VnZoai9NcDVhcWU5WEgv?=
 =?utf-8?B?bVh1QjM0SkN0VVNNMWNodEl3QUdRaUQ1emFYYkY2bnpWSzVObk9pUDBmWWhZ?=
 =?utf-8?B?Rnl2RGFzZ05QVGR0NlAybEdHNHBybm9wdlgwVUl6Qnl0bUh2M0YvTHNqdFFx?=
 =?utf-8?B?UDZaRzNlcUkyU3V1YmdJWU82MzNjeXBENjBGNEU2QnNubDY2eXFRRVpZVmdS?=
 =?utf-8?B?NXNQdi83QndjQlFjNjFqdEhYTGk5YkdMMmpBbmR1ek9zOWZaOFl1QWZ1N2pt?=
 =?utf-8?B?Y2dxbHZjM2V2cU95U3RpVlNSbk9STEIwWG01R3dnK3g5eGg4cVhrM0NFQXgv?=
 =?utf-8?B?aSt0TEhYTk5IbUw4Y3dvV0Q2YmdxVDlmK1VmQUhhaUFUZWxBakl6S1JSOWRC?=
 =?utf-8?B?TFVxQzI3OU1ZTVJKaExZQUxPQnRYZ2RHdHBpTzdid2EwbzFNTTROVWc3M0Zt?=
 =?utf-8?Q?inx5b2kxkoHg/8zW7FxD6c0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c835e7-df79-4fa4-a74e-08dd4a049613
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:56:11.7722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJt5yolJ5vH0BkRpgXPX1kiwrIQ76azXpp73R7xivaBSnkDItk2a+FJdhbanHsnFZP/PYuYC1Pcvl+/aTiBoazGyLjirvg7dIX6NmmW/vAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> Now that xe_gt_remove is handled entirely by xe_gt, it's clear there are
> some extra calls to xe_hw_fence_irq_finish() that aren't necessary.
> Neither all_fw_domain_init() or gt_fw_domain_init() need to do that
> since it's handled by the caller on any error.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c33040278e1aa..bd16ca070dd20 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -389,13 +389,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
>   static int gt_fw_domain_init(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> -	int err, i;
> +	int err;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (!fw_ref) {
> -		err = -ETIMEDOUT;
> -		goto err_hw_fence_irq;
> -	}
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	if (!xe_gt_is_media_type(gt)) {
>   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> @@ -436,9 +434,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   err_force_wake:
>   	dump_pat_on_error(gt);
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -err_hw_fence_irq:
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>   
>   	return err;
>   }
> @@ -446,7 +441,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   static int all_fw_domain_init(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> -	int err, i;
> +	int err;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> @@ -524,8 +519,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   
>   err_force_wake:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	return err;
>   }

