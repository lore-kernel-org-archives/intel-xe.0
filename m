Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE7606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cvoww70b;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WEKdsJuS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985131124AB;
	Thu, 26 Nov 2026 14:46:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D5E1124A9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795704367; x=1827240367;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f5VJkBTj/chtVR2kgDlfspOQ0q/fjmsexfG0Drh4S2k=;
 b=cvoww70brZHNXNH4ZulBq3vrZhsYiXO40m/2pIsmVja8EYR/APkb4VBi
 YIEwNyhIwROR0ljWUiUWVM7qkiAU9lzoDBfoDlTZbOPM/qwz/dO9aaZVo
 Cv9QcqorXx3mMVyKl7AArILvq0gNzf5peNfTdk9VbcpdRWseeXEazVyLH
 PrrllGJpv7hDWoLByGtO4ioXtttniACQILdvC/6+cgMxxub5S0N+mcc5n
 7E7kuLUhDd35GpPDUCpraesAKA/RScORcJJcCA/SzgNeYd4kqL1GbuKXj
 PO0HbYRSc4DNYlJQWnOoL5vIIS7ezfCpUMQZZupzlOsIkpB6NtrlYSKmD Q==;
X-CSE-ConnectionGUID: 5OmRCFZGTeGLwVlRf7VNFw==
X-CSE-MsgGUID: akUfJTUuTDaHhCFTCh1pJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4627730"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4627730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:46:06 -0800
X-CSE-ConnectionGUID: 30H/lnK9RT+XoayrVEXf6A==
X-CSE-MsgGUID: 8qPwxjRtTIy03CYvtE1xng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12694404"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:46:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:45:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:45:35 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWMY3xgNKElbUZfGqKKloimH2d5aD4s0Agd2wrDT6h3RAaqiT6n0sH7b29oM9PNxMleg1SiHDUNS5CmUClW8nw4NRliNNjvTmGtfuvxasWZyiNaKuOp2CooBUtQzbil4iEDWYnL/mXJza165B37zbxbhy8Zh6+H9Uw3jBVCH8O0g7HIgrMl3aysF1sxoSH3aUEWNS9uZRj6pt4ZMd5oCczpZKFx2BnrR4ZrURWjY8L8FcSdCrMysRuitZaN+zVts2jQqsmnZRTKhJ1qhRtrlGncrc7fPNPF7nMxvzfoFeKVNJaStuVMrFTS338GWtZNN1kOr2ihZuQJpTmbz1qAlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb7hFs/gqq/Ejum9JvSwX1gx7EJ+7sAeV1UGJvkvyJk=;
 b=OEF3tZhgIvGybeaAFlLxLwkuHeetjgpRlR9kcvJO5qU5oEQVhgn/rXCThWJJmV4MSbNzpI85kFpuyju+KNyRpqRodF6ZEVHDw3QdVldHrYvqHKGhw2UbYx0FZPz1BwLw61BqmOhinjsGf8Fio6zLRXNT7Fa+b6VauJUxiikcrWJzYx50+tLpl5gcKCcSXyo6wROiVrQD7DWn9MmHe4ZflnCiqohxYgqjEqUJKNZySVwVk6OMrQv9gdZhOvptqyy4Gp2hrQXhA46df1GPWF4WzG+YljC20G/Y2qfhAVTyFywbPDn9Q/QwhjsHRi5R/CJFIXyND02oLbgJA4beUDfyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb7hFs/gqq/Ejum9JvSwX1gx7EJ+7sAeV1UGJvkvyJk=;
 b=WEKdsJuSR19Zfn6uBgPN5jC11s063aYRyYKOl+2rnvqNh3t5AGGKk5a+GQI/xl9OdhOJ2uMqgYcoaaliFRygoFK8B7SivCSG3wN6w2QT6kv584Yo17HKFv+h2xphhHWm+wvo+s0DvpWQ4TuqFNPr36zpchnnkow9DMeP7B6ruHY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 EAYPR11MB9947.namprd11.prod.outlook.com (2603:10b6:303:2d9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Thu, 26 Nov 2026 14:45:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:45:28 +0000
Message-ID: <e2c09983-f788-4d5f-80ef-6a274b46d355@intel.com>
Date: Thu, 26 Nov 2026 20:15:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ras: Distinguish between detailed and aggregate
 counters
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261123151727.2115677-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261123151727.2115677-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0268.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|EAYPR11MB9947:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b02b349-bbde-4b54-6825-08df4bcbe95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|261022075727099003|11063799006|261021123027099003|261028144727099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003|261009221227099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: FhEGNTosRq8ZJV/ZIRHuEXc/7eHnveytTcAiZhq30f4RCx7wVEnwaSmrMxlyvBz+h5SUBcOaUp/f8FJfpiMRb+UO5TDqRrTP+4ij0QPDtqgV/12FBaSymkAAuWB3j4uncAujOOo3LBOdVU1Dnal2RtgAIjCowbCX/wNmlFWRnkUAKt2Lb6Xk5dGReSczxERWgvtOkKvXf+nxA/OAYtoQ9rbWOBSyaGzTyv77rtmt0DieFcq+tFi2B9IIzurQI98OZ4G4cLSAQsPv9mWBTWJKFtnd/WzXYbDufMHcLya8FnUuS2j5XCuyPQ+tDRU3eqS1pqeCuGehC8F3zGdlUagLO+2hRWhl0tlLCDrjZDVswMLZQqgaUhVhx3xW36XCohOv/4r7Lm+G5B4QoO01xH0yNTH1fv4xvMlDB/Iq+BQFXjXe+FFuErxIbunlpxZl/aIJo+V1qGQSIGdfS4rRrkgTFpmaggByGGjeA4aA9Dr/Tk6AnVA0bga6t4avugmVSt0sb1ivdRq1uEY0oF88T95BqfEPlcIuqL1Zk7Uz2CEp2fAc8srf7jRODOK4WYZVURIRILA6LS4KY92GRCmfUNkjF/boDwAd5Tsi8GfQr/MhCdaNDQ+O/HKc03Hh9slN6chJ1Jf/l1nJG6e2JGKM8pNs9QjZoDR898stmos70ongUXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(261022075727099003)(11063799006)(261021123027099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009221227099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThibFFHaDAxcTdQL1E5WGh3WGNPSGErUnJDUVRSOUlJSnRLaHpVQmNNWE55?=
 =?utf-8?B?bG42STd6QW9nUjRJTVFONEk1OTYrbml5ZFZuNTlBY0F1MGpJcTZCMnd3d0NS?=
 =?utf-8?B?cFRpWC9TTjkyWlJWZEE2SDgyODd4Y0l6TFN0Q1RKNjc0clY1ZGNEWmNxMUNH?=
 =?utf-8?B?VFN3d3dMOFNpMkdYS21MUC8xd3NXK3RxTW42QkRPVkxPaW9GZGhOeS90TGhz?=
 =?utf-8?B?Nk5KN3Bjak5wWnB1Mnh6ZjZIQ043TUpwS3FzcmM0cWl3UGpPK0xEWWtRWTE4?=
 =?utf-8?B?YzhtR09wSlIvTEhHcDFPQkpKbTNxQnNUa3JkTXNCVWNhUGV4eXVocE9aUHZG?=
 =?utf-8?B?NGJYekVya2kxKzduOWR6TlQ4SHR3Q1ZnMDN5UU01UGswUjh1d0dWQThodmJ4?=
 =?utf-8?B?MExOZ043UjhZemlEamF2a3E2UStqV093SEtzaE8zVStGaWJjdHdvOE9zYTNw?=
 =?utf-8?B?NUhyNnpvYzY2eXBwQlJqQk9YNlhiYTRFUkd3VzI3UFRnSUV4aVdSWHhpYndV?=
 =?utf-8?B?WmhZekMwOWg4eDN2bWhQV2hyK2ZscVk1QXlzY2dEZGY4YWhsUW1FVFBDNzI3?=
 =?utf-8?B?VkQ1VTF6OEd4REo1MDFibm4rTU1iYUt6YjJTSVI2TFdCa3laeWR5Q29GVzgv?=
 =?utf-8?B?ZTVUU0VOaXd5d2pwZGE1czIvSnpCWW1TN2s1YXFac2F6RXJ0OXdYUjJNaEo1?=
 =?utf-8?B?L0NOWDVXcVpOOUE0NVdnY0FkMlpDMTVYRDlhdUJCS3o0cFI2TFJQWFdCRld5?=
 =?utf-8?B?T1IwNkcwY3hEMTVZeEF1WjBQS3M1eHJaeVZCOE9FaHFjclBkbzIxOWxXQjF0?=
 =?utf-8?B?bjAzRDkySUwyRnkrZkp2dFVDVmZQMmdlYmx2aEtDeUdGbVQ5VHN5ZDNFQjIw?=
 =?utf-8?B?MU9LUWN2REpvT01BSk5wVHJUVWxtVDd1S1crYXZ6RlRhY3VoWGFPUE5ndHhC?=
 =?utf-8?B?cE52RlltSDQvRytBNEQvVXg3dENsaWJzMGhyVmFBOFBDMGxZK042Sm1UTDUx?=
 =?utf-8?B?Z0ZtakpyNnVuZjBKQmRUbFZoTS95czhxcG5EOU9GeG5lR0dTL0lIYzFFUklE?=
 =?utf-8?B?M3JWbGs2NDVleHdtR0dnbTdUR1NNV3FPRHBVRkNKalVpNTBNclJGTnh6d1Z5?=
 =?utf-8?B?aHR3MVdzYUc2cVQyMDBWaUhQQnRNQTkwUXhib2IxT1AveWRRbWVIM1Q1UStZ?=
 =?utf-8?B?Ykl1Ymdwc2FtQzhqUEdRTUlwU0hkTGNQM2IxRWxDMkM1RE5wOTVkT2FZZlpU?=
 =?utf-8?B?WHhtaEZHcHFTMVRMNCtFcFZ4bW1MZDFuajhNcWZZb3lmSkpNQ3h5VklqcHA2?=
 =?utf-8?B?OXZvYUsxdlR5V1lkNHBCb2o2WTk0UG1aM1dwZ29xdDJGbnNrZlVIUjVHYjB0?=
 =?utf-8?B?QjhiOWVvTk1hV2M3VnMzTTZTMTUzZDh1ZUhVK1NXa21kOVkzSHJLNkVRNnZI?=
 =?utf-8?B?L1Q1WWk4QldlaVJaeWt0dGxnVnEzNy84aHJ5d0ZOMWxpdUFqNk9nK1dveVZH?=
 =?utf-8?B?YytxK3VUNk1URC9VdVRhYW1aS0dZN3V4SWxrYWJDVzY0N2wzNHVLazlpMVdH?=
 =?utf-8?B?LzVXOHNSd2gyOEJWdGZYNHRWRDVLVmEzdWZ2dXhVU3lmTWg3ZkFwWFpva0lo?=
 =?utf-8?B?L2ZwbDJVcmJWVW1sT2FwVmYvR0NKQm8zUGJILzBjell6UUErMVFmTHFGRXFJ?=
 =?utf-8?B?WkdQcUdDdXpFc1UxYlBaek5QbDlJMkFnMy9nRkt1UERDRkxDY1RhQUlSR2xT?=
 =?utf-8?B?VVhiNjUrQThXSVRjNFFwZnEwem1WWFQ3NEQrdThvM0xpeS81bTBnemRZOXJZ?=
 =?utf-8?B?MTdoOXY4aHVxSEJ2ZW1sc2JuMkUvSWFJKzlBL1VHbEZTVFRWS0kyVnZTelho?=
 =?utf-8?B?MjdFSTBHUGphQWY3bkNBQ0tkLzJYTC85VHVmMEdvclhxbDBwQUpialVIdTVj?=
 =?utf-8?B?Nmhra3kzejhJMjZLclZjRnVRd3FycmN1ZndBK3ZIVjhGTklWVWwwWTBMcml4?=
 =?utf-8?B?TlJtOUwvU2swdzJVQkRGci9tc0VZUWtpRUZLTHp5bDNkMTZPZjYvVXVBa2Qr?=
 =?utf-8?B?WTQ2ZG5XWTVjMDdLVkgra2xNYXNxNFBjZG56K0QxRy8zUGg4YkNOd1Q2d25j?=
 =?utf-8?B?T29XMGR3bmg5SWp1TlBJWnRNM3VxRExhaG9VdE1sbFNTbG1aRk1wdU5tOXly?=
 =?utf-8?B?NkFDaTBkOTBTbk9JckhhbUhXS0RxUDR0VmZPVU1SanZMZllydythalE4aCtv?=
 =?utf-8?B?K2lzQUgyc3ozbzRneGc3bG5wa0pmZGdjendBWGVPWTRQZFdTSnp2bXZtZnNx?=
 =?utf-8?B?Uk1EVWJ5enVKV2FldzB2WllYWk1zN29HdGMrYkhEdFRrZzhOQm5JUT09?=
X-Exchange-RoutingPolicyChecked: lpYw/k9uNguK2s6+t4c8ee/0jHGl0OBrvx3rvad71GYediFKsNVapLdk5cT4CZy3CC/8i3W839tKjfZaGebrQLlGwoG0YUxEaODeRU2Xg1fBmK0bozpyb4tNMnKqTCWS00BhzkFg8Gd7Xua6YKTDdsJ5vNrj75uz9BRxiVssbyh8orHDxzBUO9pCA+/L21GWj6zgXtYoCuswB/m9idxdUyjno+rBDzvbCjCsitphaW24o11b8oDqVCwGYs9arN1n2CFjA+Dn9e6CgtPrL0BPIt+r/0O1r2G1doX4xOSNAErvxxgQMQnLCY3Nczz2Kr+O9w8NTgM4A7Ye8Iwg4Uk7Jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b02b349-bbde-4b54-6825-08df4bcbe95e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:45:27.9539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obDP08HlvPCOOWI3RTBT7I7rne2Ehm7Hv/gXlaGsPJx9OS0mtmckW0PvL2swobKjBXsgqrJzhTNJ9rR422Jixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9947
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


On 23-11-2026 20:47, Raag Jadav wrote:
> xe_ras_get_counter_response() only logs counter value, severity and
> component. Also log the type of counter and info queue support for
> easier debugging.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> v2: Drop BUILD_BUG_ON() (Riana)
>      Log info queue support
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b35c77caeaae..d5c15e17007a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -782,7 +782,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>   {
>   	struct xe_ras_get_counter_request request = {0};
>   	struct xe_sysctrl_mailbox_command command = {0};
> +	const struct xe_ras_error_product product = {0};
>   	struct xe_ras_error_common *common;
> +	bool detailed;
>   	size_t rlen;
>   	int ret;
>   
> @@ -807,9 +809,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>   		return -EBADMSG;
>   
>   	common = &response->counter.common;
> +	detailed = memcmp(&response->counter.product, &product, sizeof(product));
>   
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
> -	       comp_to_str(common->component), sev_to_str(common->severity));
> +	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s %s info queue\n",
> +	       detailed ? "detailed" : "aggregate", response->value, comp_to_str(common->component),
> +	       sev_to_str(common->severity), response->has_info_queue ? "with" : "without");
>   
>   	return 0;
>   }
