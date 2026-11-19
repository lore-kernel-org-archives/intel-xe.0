Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B31606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NULmdvUx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OTOyFCGC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D7910EB8A;
	Thu, 19 Nov 2026 16:38:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E631B10EBA2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795106311; x=1826642311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w+ZKtQNecgTSaO7WYNmxpoLewLnn5HrAoDLZMhFNjDE=;
 b=NULmdvUxMPoR+UDkG7/dduvokwZwA3YqFEEsZAfJgWNakMasvsgBQniS
 kpgiUOlFw9tUiivlvvq8CYAT+YcRCBRAGd5HtzJsp377mz4oHyFfKRsCo
 eNyj5T3b1timeKfOkzS39+l1wUzBR1HlBTLg3MxvIur+s3iwUoXxuhvDG
 tOOCx1DqEurVa1CPxeVec6Euz6bHA+1r1SpS+aYhz7xr3ai8zWfwqQK8T
 xwkHUVHfhvYmR/cMslLSUqL/KRukc+gHcmq8Qz2CpijuWy918CVEIG2jq
 8W7RcuGMoqzNQ5f4Mi4LxVBch3YoiPN/szDoogdILcibrH+g5t6UV6422 Q==;
X-CSE-ConnectionGUID: d7Cg/yBVQaCcEtQGQtgfVQ==
X-CSE-MsgGUID: w1Ql2UBmQLy+XyP7YFlAdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848343"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:38:31 -0800
X-CSE-ConnectionGUID: EELwZ7MqRUqHFxNdtFL7YA==
X-CSE-MsgGUID: g+ioucXeRdqhTsB4NoEpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10461125"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:38:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:38:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 08:38:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:38:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpkoBuOQAGfC3kVuPuzusEt5IGUMnfYvlbKqipoo9eV7ct0EVCC5PIlHRKCQenBJhEUML7jOAU378WKJRTXEP8KljnJYKbPR4sAGRjLkpdpHJGMlXk3/BJTvqua7hfsFlyc48itpJAWlVOirSMr2WUat9oIyVv6BAtlCTfER6uHF02SIGAwIrsf8cekmYEmOKqJHy4qE64Mzi9o1nfAvCr4vF5H2+ksA1/PegyFxYr2s56hz6mTc5v8cZ8tDq43DxJZBo7wc/+eJSkXU6HbjZE0Say7kh7SiQNTILw5Obcna6/zsH3u1yCbQRN5ghtfgqRkATaWQ5Ev4fqvwDS+YGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLvDSLhjwulWBlHOwB0um/85VWbHbPksLXAbHVhIdm8=;
 b=k3+5UmMlW2pSmgu46u3Ou9XLoM5DWFQqvF0DKK/B7VNHI63aGvwW2eaQnA5jKXjgXE3gdnIiBkXT4+bi4Ae/CmLhmO367L8IrAVsAl73BIHDxXNyk7FrHJ9dgIIHiReyOZCkufJrZGndb8vLkXyoTC2SFvCto+CIav+pjc++xcsYnWpH9/6CDnXAsMXfiKYGxaQ8fbmF7SHDgMz759e4lHY8wH7J724yag9swMbtAW08PZCKQFltLHO2aZ/fzTrhD3gT1mMLuPzBjHcz2L57mPU5Z9Af+IURVRO7PfweIru/4wlsB2EjsD0X3t0A4nZyF90By7uIrJwwJaA4j/30EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLvDSLhjwulWBlHOwB0um/85VWbHbPksLXAbHVhIdm8=;
 b=OTOyFCGC4hp66JdEOOqQmmgr7BSclKdl2C3+U01M4B/fdwmKDoE+4Muagwyq+L609GObdtk7Nn96Cdoqu1NY61MMeRRVbSq/Xkbzx45W1LK1NyyTllPbp0pQgctoGrQcGRxtugLVclwFqe3YBKw0IOyxmiL49gccYO1vTvS97Po=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS7PR11MB7690.namprd11.prod.outlook.com
 (2603:10b6:8:e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 16:38:23 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:38:23 +0000
Message-ID: <1cabb132-2535-4aa0-b887-43716509ed21@intel.com>
Date: Thu, 19 Nov 2026 22:08:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Add a userptr repin timeout sysfs attribute
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-3-af2e327833a9@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-3-af2e327833a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: a25f30c2-a404-44cc-eb09-08df465b873f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|3023799007|4143699003|5023799004|11063799006|10067099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|56012099006|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: zpAkdBtFi1N3TMNb4Uq3fAS41xQtGhjlXQ8XVmyffE9mggyszoUfqy/OSIx0VoRXC8VHqVPr/DaUVmrCqxOToiuHtWJU3C/gVFL6ZK3l64pFPYGG7VTmvvlVvKVXmBX/h0Qhv3rND8kXCmmaZhJT0pJzXiWHDfGHTBoGuyBzxlMfqttDO8UO4gyjiZVd7TgnoQFJ1jc5AXE34jjBQRhyXLZKV/9tGU7pyFoa9sCTckzBFBi4CdDbmZlmV3XpzjoRZ76lmZyTO8UXogKDS8zTEcQgkRtnVSnLRWY2HfCUly8xa/H9SKvXXsTWt8ATQ06zxWvC+kGFZ6HecMuX4Pxsye/I8RmxBt1NR+jK9AM23wMMVlAUC/EP13Xw0zCzp+t0fN67PCYhcUT7Cp7DIq3/SchtG7GcsoBg7H7uaa4DYDii4wnVdcVN+Efsfg3hHy0vHLjj3FKsRlS65zpuyX4skLNt8Fp7aGn1i0Ef4S391EDPuSH8sbMED/wsOYC54W7CHbnv2NxoWRx919iHHALrbhzXOV1iLeoBLxsLp1y+5SRXVag/TDoDsK6JGwUBjSEd8YbIYvXkW6MZ+qZ29W88x/dnxKwIyZ6hmLj1eN1JgLymOTUwIZaXkAcq3mgn5bGSRIItaSPhKng7ikBUQz2SDhrF4V4ZWNzn7pg2Rn1CwR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(5023799004)(11063799006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tno0azFSNXNSZ2ptcFJ5a2F2VmJnSjc0SVZ6UjBsUDYzVnZxQnRXdmdCc3Rx?=
 =?utf-8?B?SC9tNXVJMS9kT2dFK096RElpalB0NkdmYTZGdFBFaklBNFJKU01wSUtlMEdK?=
 =?utf-8?B?T1pwU3c2SDNvWWwxR3d0TEsvWXRZQTdzUDdpUWxtYnY3VncrNkZ4WmVvSy9S?=
 =?utf-8?B?clVyK0lMMC9ONkFjTlhNbFVtdVVPZVgzcjd2NFlqeUZWRzZDZ1Z1RVAwZEEr?=
 =?utf-8?B?M0x0amh5emxNcFd1V00yWkFONDdwNG15NFA3Q1VXZlBhZ1d5QzMzZGlVQWRB?=
 =?utf-8?B?ekwwZ1FJemZmcStBSGdNRTBPOEIxc2pabXNhSEhMZnlleWFLb0pJZEcxVkRP?=
 =?utf-8?B?QmkzU2FzL284RlludWx0MlJJR2toNXRjekVQUFJoR1dhZXNSVlNLY1oxQ0hZ?=
 =?utf-8?B?RDN2ajVrS3JKRmIvbWZHa1hUMysyZXduRlNURU10UUtSYXg2eklLWHVEMGRn?=
 =?utf-8?B?WHFsa0tmWUE0azRKVGVGUklWcENwbEpIQ0pVWFFaQVIzd3czMWtlY1JmbGxy?=
 =?utf-8?B?dGZUNWpvVGdTem5vZy8rUFJCcTR1SSs2eHhTRFo3M2xJRExyMDRYV09tdHZI?=
 =?utf-8?B?N1ViY0sxeGhaNm16K3B4Q0VUTWhNSXhVa1k1eG5NeDRoeFBIYnhvbWVMZGh2?=
 =?utf-8?B?SHhySUR1dmNjSjdXcEZTaXd1WE9zYzRnMjQ4U29FUTh2R1ZYclBqbzRjL1NR?=
 =?utf-8?B?WGxwdVBuYXlKMmFsc0lvSFU5TTFNVkUyekpLeVdod3E0MzUzVVQ2M2VFaWl6?=
 =?utf-8?B?UFlIZEJDa0xoQ1poQ3RVUGpHbHVaTGRqRStXM2hDWXZ2VUtEb0p4SWRCQnF0?=
 =?utf-8?B?c0JMRGpkc0xORUM1R0l1QVpWcVNHOUhSRlFLUFRDcUpTT1kwUkpGaGdPdmJl?=
 =?utf-8?B?R2JrOFUzUVNXQ3hoZ0E1UUVhaHJWZVVmWUl0SjlFVjlxOXF1bjYyVnBqeW1F?=
 =?utf-8?B?dUo5Y0tlSk1HeXZMSmlCUlVEOTY5WXZpNEs4Q0srT21tQVd1cElNT0lUK21Z?=
 =?utf-8?B?cnFjS0tnd2FsU1pnbmtUWGNraGpmY3ZmQ2Z6eFBpa1JZMzBiRGZwOFRMWkY1?=
 =?utf-8?B?NDMzMzdvWXpRS1JMS1crL1VySjRZYmF3WWxCdlh0L2srQ2o1dkphN2cyT2xu?=
 =?utf-8?B?ZHVxZXJkcnFrTG5XUmsrWlliY3dSSXdKY1ZuaUpSZHgvMkE0cmU3c1JsSTVL?=
 =?utf-8?B?RllETjh0UnJad3dvZnpGNCtFdElWaGJNeGZVTi9ndGZYMlk0WFZMZjFlbHZE?=
 =?utf-8?B?bDkySHdNaVc4RDVJakc0amRLTS9qMUxEaW1yT05nR0k1NUV4cTgvZDE5UDZX?=
 =?utf-8?B?WW5pdHU1ZWRHblpCS1h0aHNtSDExaUNSaXVuNkI3YmVqeXVaZlI0cEJwZmt6?=
 =?utf-8?B?OTZzTWg2RWZWcUg0RDRrV1Zxck16TGI0Snh2V2ZFYldnZ25VWFhNaWtRejRv?=
 =?utf-8?B?eEtDTGM4cDk2Nm9iZno1WnM5TVNWM3NTNkg4ME80MHdXK3VIS1NMaVdGeGV1?=
 =?utf-8?B?bCtGSHBDMTFaS2xqbzZsV0MzY2VOc0JIL2kvZ3Nhc2pyaVNTdHZrQzNIWXoy?=
 =?utf-8?B?aHhNQzFGOGorVEN0Nkw3OWRGdXlLRnluRFBGOEtzRlM4aGRFRmpTbUZQQ1V2?=
 =?utf-8?B?MFp5VTJEbUQ4ckxBNVRBNmhlUENnRG5ZTkFCakc3b3Q4LzQrM05rWW9KaVNr?=
 =?utf-8?B?RlBYQ0pQYng3SERVbkhEVkNFNGErWkovcjhVSXpmdExLT1VZTFVWL2FaVUE3?=
 =?utf-8?B?NEM5UWlIUkhHSGJuZ2FGei9OMk84SGZXbHBBTkp4UGF0L0tEbGpUa1F2ZU5x?=
 =?utf-8?B?b01qeUlhNEI0MVY5ZXY4NnIxcEFYM2RFY1BXbTlwQUUvdDdjM3J5MmpKeGV6?=
 =?utf-8?B?SWZsLzU4dWRpaWtsZDE0TlpnZmliZGpDRmd0T3Q3MHlKNlV4YzRFSDF1VHVW?=
 =?utf-8?B?dVgzdlVMdm56WUorYjMyT3VSRXozbU50eDZ2Tk9WTTdLbUdZK3pRV2pYamJZ?=
 =?utf-8?B?aGZBY3VRVjRBdkI2V2o3T2hGdVl6Zjk0Qkp5MDYrNmMxeldXUkh6c1BwQTJX?=
 =?utf-8?B?WG5Td29ZSUxZVmdOZzFIdmZjNEJFYTc3ZGdqWHIxemlVUUpBTlZleTRMZ3ZW?=
 =?utf-8?B?TTVtSTNVSWU0RDcrNHZiMllwL21VaHBoVTBXcVl3RWxsY280SUZEb0tqN1JS?=
 =?utf-8?B?VWFrR2dyeTlMdi9sMDRRVm1lMkV5bkFNc0gxQTI4bWFTTFFreGtqTXRJejNY?=
 =?utf-8?B?RnhSVUd6UmpuU2dvRFg2Ni9pRExtUWZ6Wk5zUEt2dkw0SmkrWS9BWjU2b21P?=
 =?utf-8?B?aWlZWFI3SWUrbmJHVTE3OVBWZDB4Ynp2enlnWEJWMzArNVc0SWpqUXFXZS9U?=
 =?utf-8?Q?ShHPMcIT8xRIS9RU=3D?=
X-Exchange-RoutingPolicyChecked: GAAxHH2HTuUgF4smGbjCyyST10O5Xv0zAnccSyMQJzFmza0I7YVRxmaAipV8hDrulHSXf37vDxP9v6aXfZrgfbgUQyAKdCUMdZmtKNl9W8EDCnEHFc4cOwopVJ12I1gV4GVEQZcbHHPouUOXxV0eFhThkKCTCMzm3z8YWadsn1V3kmBLzqXwl3VkfZvWrMEycctnO5u/z+/hzcGUbHOXJQKfZVaiKDDNRES0GZ32XMla1O9npcDCU++DKM09/W9NWn4L8wCaEpic1wbHuNVz9M3t7ha1SJdrnaRCOp4iSmmVX0L6/2Qw1jNumZaqvYYdEmy4+HobDqIPro+wQGZRBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a25f30c2-a404-44cc-eb09-08df465b873f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:38:23.6960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah6Ns83Nqel6IQUhcteY0rmqVY9qUE+Ty/0idzyZLsMD7ixR5bTsKahTN2OtcsMV/cnTvPahAWGuTkOUxtkQMuVgRDkLZWMXw0mznCzwOVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 16:44, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Add a per-device sysfs attribute, userptr_repin_timeout_ms, to be used
> to bound the overall time a userptr repin is retried when the CPU
> mappings keep changing during the repin. The default is 100000 ms and
> zero means retry indefinitely. The value can be changed at any time and
> is read each time the timeout is checked.
>
> v2 (Matt):
> - Reject values above INT_MAX (or reaching MAX_JIFFY_OFFSET) with
>    -EINVAL in userptr_repin_timeout_ms_store() so msecs_to_jiffies() does
>    not treat them as an infinite timeout.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  2 ++
>   drivers/gpu/drm/xe/xe_device.h       |  2 ++
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 56 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++
>   4 files changed, 68 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 616e02066ae6..4e54a1b7fc51 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -437,6 +437,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>   	if (err)
>   		return ERR_PTR(err);
>   
> +	xe->userptr_repin_timeout_ms = XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
> +
>   	return xe;
>   }
>   ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 7a7632e2d56b..128fe51bede7 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,8 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>   	return container_of(ttm, struct xe_device, ttm);
>   }
>   
> +#define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT	100000h

Isn't the default too high, if device is connected to no numa node host ?

> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev);
>   int xe_device_init_early(struct xe_device *xe);
>   int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index ff5d25dd867c..52111b4458f4 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -4,7 +4,9 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/jiffies.h>
>   #include <linux/kobject.h>
> +#include <linux/limits.h>
>   #include <linux/pci.h>
>   #include <linux/sysfs.h>
>   
> @@ -38,6 +40,15 @@
>    * reclaimed by the shrinker. Higher values reduce reclaim pressure on
>    * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
>    * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
> + *
> + * userptr_repin_timeout_ms - Report/change the overall time, in
> + * milliseconds, a userptr repin is retried, with all locks dropped between
> + * the attempts, when the CPU mappings keep changing during the repin. The
> + * time is measured from the first repin attempt after an invalidation. When
> + * it expires the repin fails with -EBUSY. Zero means retry indefinitely.
> + * Valid values are 0 to INT_MAX (capped by MAX_JIFFY_OFFSET). The value is
> + * read each time the timeout is checked, so a change takes effect
> + * immediately. Defaults to 100000.
>    */
>   
>   static ssize_t
> @@ -340,6 +351,47 @@ static const struct attribute_group shrinker_attr_group = {
>   	.attrs = shrinker_attrs,
>   };
>   
> +static ssize_t
> +userptr_repin_timeout_ms_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +
> +	return sysfs_emit(buf, "%u\n", READ_ONCE(xe->userptr_repin_timeout_ms));
> +}
> +
> +static ssize_t
> +userptr_repin_timeout_ms_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > INT_MAX || msecs_to_jiffies(val) >= MAX_JIFFY_OFFSET)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(xe->userptr_repin_timeout_ms, val);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(userptr_repin_timeout_ms);
> +
> +static struct attribute *userptr_attrs[] = {
> +	&dev_attr_userptr_repin_timeout_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group userptr_attr_group = {
> +	.attrs = userptr_attrs,
> +};
> +
>   int xe_device_sysfs_init(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -349,6 +401,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_device_add_group(dev, &userptr_attr_group);
> +	if (ret)
> +		return ret;
> +
>   	if (xe->d3cold.capable) {
>   		ret = devm_device_add_group(dev, &vram_attr_group);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f2a31949073..fc80cd2c766e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -437,6 +437,14 @@ struct xe_device {
>   		u16 idx[__XE_CACHE_LEVEL_COUNT];
>   	} pat;
>   
> +	/**
> +	 * @userptr_repin_timeout_ms: Overall time in milliseconds a userptr
> +	 * repin is retried before failing with -EBUSY. Zero means retry
> +	 * indefinitely. Accessed with READ_ONCE() / WRITE_ONCE() and tunable
> +	 * through sysfs.
> +	 */
> +	u32 userptr_repin_timeout_ms;
> +
>   	/** @d3cold: Encapsulate d3cold related stuff */
>   	struct {
>   		/** @d3cold.capable: Indicates if root port is d3cold capable */
>
