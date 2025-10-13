Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FA8CCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 04:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31210E36E;
	Mon, 13 Oct 2025 04:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtlOTYO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C200310E36E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 04:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760330564; x=1791866564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AI5Lv+6SeTJDtxJTLL9pMnF1AWSysvop49EHRJqP/wg=;
 b=ZtlOTYO6cKoANHTIvhnnVdnd5Ge9gsGwL1fHFw34i4i0YOZx737tnTrN
 8ZqR+4RMT5u46abnoKdkdXaPodf5Gwh9VwKyZuyqavc5v/f5Xm4yK/Oi3
 6shMwoMi+/di/TJPNkES16xW1ikUDwSqUeXq9WRadpwJviA9fLIsnCIO8
 ocbydpghn2doQ52OUhVzYj3y1bvi2ZhPqlBTv6ux6Yza683/l4VXjuAPd
 /yfucZPYZZUxhS1UxIhyVS0/qbEVP08O0Soity2sDC9RoTTh2XdQqKP9L
 W0Dlv0a1Q/m5/FOHjFBSEAuu0mzhQo+CClFbKgcLeO6PVCgIsFdevZTNI w==;
X-CSE-ConnectionGUID: vJSG9+lJQJeelwuVwy2/0A==
X-CSE-MsgGUID: gOpW1q0yTpO19LH2e+45zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66289060"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66289060"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 21:42:44 -0700
X-CSE-ConnectionGUID: MVRWuyDFQteu9g3pAdBbYw==
X-CSE-MsgGUID: krVOFqxwSsWobFiOrlU2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="185760735"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 21:42:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 21:42:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 21:42:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 21:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Cvabn4qfXVBjpLl2FXo37lkTvuzXh/C+jqDSskHyxbwrc489xJRx73qD8ZglCVY9/W6AvkXDoMKM8CIX+WvvTPiGT4Zik2i+/PSIIv7F9g7I0GceD9XjRSjFQGi6KlBSrJHnJWlx26ydqGxwyE/VWbYutZl0iObb1syAV5QT1nwBzwwmz91jXUH93pjRYJzz/vbJE3pzkwujA0J5RCp89kHtACDDlj4DAcBUAhrijFyfm4G5OxqzRjRZqUXht9u1GR+mSZCbkvl14KP36HCXNAdSMUN1wQhJ+sKRW0U73VxsNo3nR/S57d2g2fVFwh/pfYbobMIPTdIplu43pfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jAkWgGAxw8CiQVraUTUWBjAynEgFK1ccUG+egFdI/0=;
 b=dhQ+DyS12cOYZidzLSU53cCUd80aHKRN+QSlxyU8qJHbO8+Spt8DFI77XSs/bDRqzz913BXQ2rxPU65zb0DdAsxSUmXyzS4oRekJbSbxMOoXOSFBNCgELEz7SW0Yi6/HgJvt4E+t2soQgoFn7JXvMksie15/keU7cxE1dEpeRHyzbj9daG4dJjZsYYKqOfVwL5iJ4z+ScRu+DxMjRJK/hidS4R4Nn6rF8RqxYZSgV6Xtdkm0c8ppXBxfN7L5AE6BY8Zx3I2gXtNJlkcdUmy1+BPBf2yCd1IJn8ISmwkD6XwzGbl6soGgPc2+UHBlaSRkki5B+10ZlaaeZ1un693rOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 04:42:38 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 04:42:37 +0000
Message-ID: <ef0d04ee-9e57-4db0-994a-e840ce39e4eb@intel.com>
Date: Mon, 13 Oct 2025 10:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com> <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com> <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
 <20251009230638.GF1207432@mdroper-desk1.amr.corp.intel.com>
 <08b2f77e-5db7-44ea-834a-b38739bef4aa@intel.com> <aOla52pB_vhhMm9B@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aOla52pB_vhhMm9B@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM3PPF818092190:EE_
X-MS-Office365-Filtering-Correlation-Id: c97509f3-45c1-42ef-20e6-08de0a12eec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9VUk9PR1kweGRxajhJQTVFR2VJSS9pWlFLVnp4OXZkNzhVVXhrZVVKMDBl?=
 =?utf-8?B?dXhOTE9sTm9tZFVXTGFHT3lYL0QzaFU3SjlCeDROZllNL2xDSlVRajZlZitB?=
 =?utf-8?B?SUJtWTJyZDYxY0l4KzJkdjg1dmI3YW5HYUNSdldmOENKNzg5bHc5Wkl6RUN2?=
 =?utf-8?B?RU90ZTJ5eW45ZXNzdHNubkQ0c3ZNSTBCZUNZaE5VQ0RPbzR2Zkx5Ulk2TU00?=
 =?utf-8?B?VjZCUHdsMHZDSSsvcnRjdi9MR3VIL09NWU1hYzJjT2wwL3BSaUxLK2NGQkQr?=
 =?utf-8?B?N2d5a2FmWFBJYkxVNy9UR0szTSswZlpxd2FzalJRTU5kcHdRUzBXMktXZ0hH?=
 =?utf-8?B?M2FjOGFPRk9nS29kNDJPbVN3MHdWclFYbGpoREROZTVEaVhORHEraG1yUnVr?=
 =?utf-8?B?aGIvbFIydk1QNjFxOGVORTJJeTJxWS95blVaWFNaZ2h2OCs3WHBFVzZMMGZU?=
 =?utf-8?B?U29VeGFMU1Z4VEZ4V29PaUtJR2NVN0NqVFJ1UUhDcSttRXU5ZTFFYVkzcnU2?=
 =?utf-8?B?MllIT2ZJT1RDaDhyUVEzNm5PNWd6Z3lVbXM0OURIemhuOTlaYW9SRHZTZDZP?=
 =?utf-8?B?cUJXVTVMU2ExRGo1eFVQdkEyclN5YzhoeWxnUHl4WVd5MUFZK2J1Q0lrdnBM?=
 =?utf-8?B?ZmJwNmw5YTFrNFI2NXE1WG5uWi9KbU5kMUQzcWF3eGFGTzE4SElscWJsamZm?=
 =?utf-8?B?YzZ6ZzNNS3g0cUJQWFRQMUtvWGw2QW9LSGtjay9TNEt0aENJa0k4Y0IxYjNM?=
 =?utf-8?B?V3VMbzZvUUw5UnBZMEkwdzJRSytWd3JiZTdVSmhnZHpJOWlQeEtNUkZFbWtY?=
 =?utf-8?B?SHNad29yTEtyTU1jVi9rbytxV1hncUkvSWVsK25tRE9aTHEzV3hvUURkRFlN?=
 =?utf-8?B?eWtWdHBrdnlINlJRZE1aZWFGTkxTcE96ZWRnc2dxaWcvTkY0ZTRUVGRwQysr?=
 =?utf-8?B?Zjcrcml5Mm9mQkh2WDljNzhEdklKQXFPWjVuUWxjVUY1enorb3BBeGRiUWh0?=
 =?utf-8?B?UWZGdWFGdmlSQ0ZZS1ExanZqeW1uMlBzQkJ5R0J5RHJ6RjhUV0ZTeXFqdGlh?=
 =?utf-8?B?WHkraUF1aWpRV2oxNUMzRjk0YlFtWDhDTWRBU05XK09IUWFMWUIxaHRaSlBN?=
 =?utf-8?B?VENiQUNPTjFxVDFTR3JFczlIaTI0bEpjRVp0cUtjTmVkOFA2WXJiUDE1T0Ru?=
 =?utf-8?B?VnhmbnV4MVFUL0Jhb3Z4MWZwUXVsVjIxYzZVRzZQMElDOWxtWXVJS1BDOHVy?=
 =?utf-8?B?NlhIc1lSd3Vtb0xaNTUrYnpZeTZMREs5bW1wUEdQUmMwblpyMExZcVlzRFBD?=
 =?utf-8?B?VWNURTFpOHR0Z1oyRUNubXl1cFE2KzQ2cHlSNVBROFlYNk1qM2xlT1ZYMWFy?=
 =?utf-8?B?eEd0eWVTLzAvcjN3aVg0eUk5ZG5FOWo0d2RFaTZTYXFlMXBQUk9mN2d5VzZQ?=
 =?utf-8?B?aGk4MkpsRlFLQjZ0RG5EcVRVUW9qb2lpZExwN0gvSzZHNTd0bys0Z2RiLzNo?=
 =?utf-8?B?VmxaRmpIczBuWHpjVGpLQ0kyM2NvQUV2NHpBUmtINVhlUXA5bENmRnFUZm5S?=
 =?utf-8?B?SW5CM1lTM0VWYkNDODJudXlKR0tqYkl4TS9JSE54TFA2YWxWMk0xSG0zaFI0?=
 =?utf-8?B?c3NsNGt0aVBYVkxYcGwrWlp4cWVrU21FTkR0V2V4ZVI1c1F5ZHdET2pCcnV0?=
 =?utf-8?B?MW5mYTIzWWFwblhTN3pPdEE1OWM0N0s1ajNGbzJCM2lzTU5Ucy9VNEJsYmRa?=
 =?utf-8?B?c0hORklrWHpoM0xYdGVaMDNPNmtRTW42V0tDMnVQTUMzbEU2SkVzMDJ6eDVF?=
 =?utf-8?B?cG10bmdpcDVYN21QbThhYXhoNmc2bktyNU1zbFF3SDJ1MDRqeEtsdHpMRjFB?=
 =?utf-8?B?SXVBTDRNbmV3b2ptVFY4aXBXSGE4T0Jmdmk0ZFhyR0RhUHg1UmZncnY1cDlI?=
 =?utf-8?B?OHE4MFY0UmZJWWJVUmJTNm1XTFE1L0JYQlowL3I2VUc3OVhJaEJoVGU2bkxS?=
 =?utf-8?B?QmdKRUFQK1RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjZVWlNITlkwcTVhWUU5b2dOTitiUUZveDJBZGVQZ2hBNFdkcEFPTUhYc0M3?=
 =?utf-8?B?UGNSTTRpL1dZTEs3bG0rNWZvaVZ1YUNaczNHK3dPL0RCcnN5VzB6a004ZSsz?=
 =?utf-8?B?N0t3cUZnWUVvQU51U2x1WE16NGlac2QrWjJmeVZDWWVWT2NBYmc4UVFrcFBz?=
 =?utf-8?B?bjFlY1VON3F6Ukl1TzQxeWNCdVBsb292THJ2MHpkMjlBYWMxZXBoMmFLODJ1?=
 =?utf-8?B?YVRSZ29MYWE3aUY3UXZod3l2V21kN2ZjcG42bU1Nbk55M1FQMTZyaFhqR0Er?=
 =?utf-8?B?akYycHFsV0o5ak9KdUtmWlhZVTcrMXlEWFBTSnBzc1hvR2gyVE9jQUpLdGZh?=
 =?utf-8?B?empzMzQwK2FvclZmWnJIZm5lTzYxMjFUbjgzTkFDOFcvMFZaZ21qV3FBeU9V?=
 =?utf-8?B?dC9YNkZWRGl2NmxMK3hjZVd1Nm5LcG9zMWE0aDI4b0pEcmQ4ekQ4Wm1udDZq?=
 =?utf-8?B?VmVkYzM5NDY4QjMxUUpRUHIzUnpLMUFOTm9maDd5SFNqNUlLeVF5L2ZISEMr?=
 =?utf-8?B?ejZ3d3EwOFlldjZsYVMraUVab0FsNHhxd2xyK3p6Q0EvNWdIMk5hbWphbzY2?=
 =?utf-8?B?cVZqWmU2TmR0aGNHb2RIdjd1cURnLzhtTUdlNlNEQjRuZVR1Z3hHSnhuemJs?=
 =?utf-8?B?NVE4V2VnaFRJRE9rZkJoWVNLeklGdjBSMVcramsxeVNtN29tUFZ0c1VCeFR1?=
 =?utf-8?B?TnZUM1NKeUtuaUdKSjg2dWVTVDkvUUM2eWxaUnBha3ZIa1pScWhxQm1uNFp5?=
 =?utf-8?B?dSs0UFl1d0c3bFV0U1hWOVU2cFJ5b1RyTHhFV3oyRlFUY20zM2ttRTdYMjVm?=
 =?utf-8?B?ZlF1ZW9HSTJWMU5hTjdsSE90UEVyQklTZVVvNjlISms2eDkyaGZ3TklGRHIz?=
 =?utf-8?B?Z3pvQUtCRlhKSXpOeUllK09jOUxDL3NBSGJWSERkWjFPV3JWcWE1VWV3QzFQ?=
 =?utf-8?B?QU9DVWhzbDE0U1F1NWRQcWJXeERoZWlIYWdWRFZRTG8xVGhBMzR5V2tNOWRU?=
 =?utf-8?B?ZEdXY2ZKMHRBRXVVOXhQd0hxUGlRTXJTU1lzQkpoM3F2cTJnc0MvZ1FNQ1Fu?=
 =?utf-8?B?VG80SzVzSkI1RWxRZHQ4aFhrWjVMTjY4Ukt1cVRnME0yWVRaN3BnUjRIZi9r?=
 =?utf-8?B?SkJRcTZEQ2hkanJvQXZEMnA4N21WK0JVVUJmQStsR1pIejF2L1hHelFzTkVP?=
 =?utf-8?B?OWhxc2VmT016YTRxK2syOE93RlVlSzdnMTErdkl5bmtZeDhIQzl3THoyM0Nv?=
 =?utf-8?B?V2dzeG1jWUpYSWtHTXZFaEpzbXZMY2tMc2NhdXNpbTlRSlRMcG1TSnVTTW1x?=
 =?utf-8?B?SVhoSUdGNU1iNXhKV1NuSE1uSldvaDU4QVB0TjVXbzlJZFZJUWQ1VHdzQ0hE?=
 =?utf-8?B?NDFxcmYySGJzeU1QNGtnOFBIcWxrbGpWMEl0WUxWYVRsOUNJamJoL01pb2lp?=
 =?utf-8?B?dXg2NHc2ZXc3Vk8wdjZGK0owbmlnSmhVbmhxSWNrTzdUYTBMOWpFeCszMmI1?=
 =?utf-8?B?dXZ2ck8zYlVVUGVrZzg3OGlCbkwzQXRNbTBrcmdGclN2U3V0ZTBZTzlraW5y?=
 =?utf-8?B?MSszWlpLWjFKejZnUytsbmVWclVMT0U2MUV2a3lyMWNtSHFpcFRqSktCYlBC?=
 =?utf-8?B?eEtHRXptbmhvWTRSZkdGNFVKRWFsYkZmZ1FYM0ZvUXVPVTd0ejYzUHRGTTZG?=
 =?utf-8?B?ckhIRi93QjVkTy85VVVBTVlZMk0zVUFOendvOXJLQ1JYd3c4OXJ2WElyc21u?=
 =?utf-8?B?Vm9sM1Vyc3puQUd2cStMZnV0ZyswMS9DcUdXdlZhTDZNT0pVRFI5NnlGRHZi?=
 =?utf-8?B?bzVINHcvalVyS2FUWG56QzBWNENxdDdGaDF3QkpyWmJtRDFsTld0N2pNN1JC?=
 =?utf-8?B?UHhQalAxV3RNK0RyRmRZOHd6RFloend1RVVZM0pycDAzTEFDNUdOeVBkLzR0?=
 =?utf-8?B?Vlo2NVppQWMxcUJxdXYxU3BjN3lQaW5iUGhlZnN5c1QvK2RDbGNqaDNXa1Fk?=
 =?utf-8?B?QU5FU1BMQVJFbzY2ejFhQmJ0QXV2MEhHNmFxWDBldjZVNkswQWlnaGN6aHVo?=
 =?utf-8?B?YzEvTWx3bG9kcExyYlh3OENPMUdnYXE4RS9NU1NQTGNqVEwzVElOOGZpa3pp?=
 =?utf-8?B?SlZvYXpnblcxYzd2S2ROZEJmbTg2MEJDOFZVc2ZGOXBsdk1iQ1YwK0NMRlpM?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c97509f3-45c1-42ef-20e6-08de0a12eec0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 04:42:37.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5YN+0/rCf2dinzuXJvGTZtB85xtAuFoZyQUHwgURnSJ2rcs/44T5qre0B3tfAkrdWLDaQ9cguMSGcshdIsx+Wra6tcpLr278s38G1V5buE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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



On 11-10-2025 00:43, Rodrigo Vivi wrote:
> On Fri, Oct 10, 2025 at 02:11:52PM +0530, K V P, Satyanarayana wrote:
>>
>>
>> On 10-10-2025 04:36, Matt Roper wrote:
>>> On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
>>>> On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
>>>>> On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
>>>>>> On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
>>>>>>> On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
>>>>>>>> On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
>>>>>>>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>>>> save/restore while this sequence is being programmed, partial writes may
>>>>>>>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>>>>>>>>> instruction to write the sequence atomically.
>>>>>>>>>
>>>>>>>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>>>>>>>>> 8 dwords instead of 5 dwords.
>>>>>>>>>
>>>>>>>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>>>>>>>>> chunks.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>> V4 -> V5:
>>>>>>>>> - Fixed review comments. (Matt B)
>>>>>>>>>
>>>>>>>>> V3 -> V4:
>>>>>>>>> - Fixed review comments. (Wajdeczko)
>>>>>>>>> - Fix issues reported by patchworks.
>>>>>>>>>
>>>>>>>>> V2 -> V3:
>>>>>>>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>>>>>>>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>>>>>>>>
>>>>>>>>> V1 -> V2:
>>>>>>>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>>>>>>>>     (Auld, Matthew)
>>>>>>>>> - Fix issues reported by patchworks.
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
>>>>>>>>>    1 file changed, 72 insertions(+), 21 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> index c39c3b423d05..b629072956ee 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> @@ -5,7 +5,9 @@
>>>>>>>>>    #include "xe_migrate.h"
>>>>>>>>> +#include <asm/fpu/api.h>
>>>>>>>>>    #include <linux/bitfield.h>
>>>>>>>>> +#include <linux/cpufeature.h>
>>>>>>>>>    #include <linux/sizes.h>
>>>>>>>>>    #include <drm/drm_managed.h>
>>>>>>>>> @@ -33,6 +35,7 @@
>>>>>>>>>    #include "xe_res_cursor.h"
>>>>>>>>>    #include "xe_sa.h"
>>>>>>>>>    #include "xe_sched_job.h"
>>>>>>>>> +#include "xe_sriov_vf_ccs.h"
>>>>>>>>>    #include "xe_sync.h"
>>>>>>>>>    #include "xe_trace_bo.h"
>>>>>>>>>    #include "xe_validation.h"
>>>>>>>>> @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
>>>>>>>>>    	}
>>>>>>>>>    }
>>>>>>>>> -#define EMIT_COPY_CCS_DW 5
>>>>>>>>> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
>>>>>>>>> +{
>>>>>>>>> +#ifdef CONFIG_X86
>>>>>>>>> +	kernel_fpu_begin();
>>>>>>>>> +	if (size == SZ_128) {
>>>>>>>>> +		asm("vmovdqu (%0), %%xmm0\n"
>>>>>>>>> +		    "vmovups %%xmm0,   (%1)\n"
>>>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>>>> +	} else if (size == SZ_256) {
>>>>>>>>> +		asm("vmovdqu (%0), %%ymm0\n"
>>>>>>>>> +		    "vmovups %%ymm0,   (%1)\n"
>>>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>>>> +	}
>>>>>>>>> +	kernel_fpu_end();
>>>>>>>>> +#endif
>>>>>>>>
>>>>>>>> Everything in this patch LGTM but I think we maintainer input to ensure
>>>>>>>> we are breaking some rules about inlined asm code in a driver (no idea
>>>>>>>> if this exists) or if a better place would be somewhere common. Can you
>>>>>>>> ping Lucas, Thomas, or Rodrigo and ask them about this?
>>>>>>>
>>>>>>> Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
>>>>>>>
>>>>>>> But the rule does exist:
>>>>>>> https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
>>>>>>>
>>>>>>> "don’t use inline assembly gratuitously when C can do the job. You can and should
>>>>>>> poke hardware from C when possible"
>>>>>>>
>>>>>>> In this case here, please explain why exactly memcpy with smp_wmb barriers and
>>>>>>> or WRITE_ONCE code combined couldn't solve it.
>>>>>>>
>>>>>>> Also, please explain how exactly vmovdqu guarantees the atomicity promised by
>>>>>>> the commit message. On a quick search here my take is that for this 128 or 256
>>>>>>> bits, atomicity is not guaranteed.
>>>>>>
>>>>>> I don't think cache atomicity is what we're after here—rather, it's vCPU
>>>>>> halting atomicity.
>>>>>>
>>>>>> Consider the following case:
>>>>>> b++ = XY_CTRL_SURF_COPY_BLT;
>>>>>> b++ = addr;
>>>>>>
>>>>>> If the vCPU is halted during the instruction that stores
>>>>>> XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
>>>>>> batch buffer (BB) that is being programmed as part of the VF save. This
>>>>>> will clearly cause the BB to hang due to a page fault on the copy
>>>>>> command.
>>>>>
>>>>> okay, perhaps this is what is getting me confused most
>>>>> what I don't understand in the flow is: why GuC is already
>>>>> executing it or going to execute it while you are going to a halt when
>>>>> writing the command to the buffer?  and not writing to the buffer first
>>>>> and then sending it to the exec queue?
>>>>>
>>>>
>>>> It how this feature was architected, will send over SaS link of the list.
>>>
>>> I'm confused by this too.  At the point we're filling in the
>>> batchbuffer, the GuC isn't aware of the batch at all yet as far as I can
>>> see.  In xe_migrate_copy(), we've called xe_bb_new() to allocate a new
>>> batchbuffer, and then we start calling emit_* functions to poke
>>> instructions into that buffer.  At the point we call
>>> xe_migrate_ccs_copy(), the hardware still isn't aware that this buffer
>>> exists, so it shouldn't be possible for it to start executing.  Only
>>> later on when we eventually create a job for the batchbuffer (after
>>> we've finished emitting all of the commands) should it be possible for
>>> the hardware to start executing this.
>>>
>>> If there's some other *future* changes (not present in the driver today)
>>> that change the design such that we allocate a batchbuffer and tell the
>>> GuC it's free to start executing it, but only fill in the contents after
>>> that point, then that needs to be clearly explained in the commit
>>> message.  But that also sounds like an fundamentally racy design, so I'm
>>> not sure why vCPU would be the only situations we'd be running into
>>> problems.
>>>
>>>
>>> Matt
>>>
>> HI Matt,
>>   Please refer to xe_migrate_ccs_rw_copy() function which just creates BB and
>> it does not submit job. The idea here is that, we have a sub-allocator which
>> is already registered with Guc and the function xe_migrate_ccs_rw_copy() is
>> allocating BBs from the sub-allocator.
>> When the vCPU is paused, GUC automatically submits these BBs to HW. So, we
>> are making sure that the BB always contain valid GPU instructions so that HW
>> will not report any page faults while executing.
>> I will share the SAS for this.
> 
> The SAS sharing doesn't help. Please ensure that this flow is documented
> in the patch itself with some comments. I didn't see this in the last
> version. Also ensure kunit is passing.
I will fix these in the new revision.>
> Thanks,
> Rodrigo.
> 
The complete workflow is documented in 
drivers/gpu/drm/xe/xe_sriov_vf_ccs.c within the source tree. This patch 
covers corner cases identified during the review of the SRIOV 
save/restore feature.

-Satya>
>>
>> -Satya.
>>>>
>>>>>>
>>>>>> If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
>>>>>> then either the GPU entire instruction is written or none of it is. I
>>>>>> believe vCPU halting guarantees that a CPU instruction is either fully
>>>>>> executed or not at all—regardless of how many micro-operations (uOPs) it
>>>>>> decodes into. If this guarantee does not hold, then the entire
>>>>>> architecture of CCS save/restore on PTL is fundamentally broken which is
>>>>>> always possible.
>>>>>
>>>>> Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
>>>>> of the vmovdqu nor vmovups. only before, between, or after them.
>>>>>
>>>>> But is this uncached and/or coherent? isn't there really any possibility that
>>>>> the command finished, but GuC mid-flight executing things aren't still
>>>>> seeing different cachelines?
>>>>>
>>>>
>>>> The GuC won't start executing until vCPU unpause on the save flow.
>>>> Restore flow is bit more tricky as vCPU are live when this happens but
>>>> we can W/A that race in software I think. That part is not in this
>>>> series.
>>>>
>>>>>>
>>>>>>>
>>>>>>> So, imho this patch is introducing a unmaintainable, complex, and fragile code
>>>>>>> that is not even doing what it is claiming to do. But I will be glad if someone
>>>>>>> can challenge this and prove me wrong.
>>>>>>>
>>>>>>
>>>>>> Let me know if the above makes any sense.
>>>>>
>>>>> Okay. But how to handle cases where AVX might not be available? really not needed?
>>>>>
>>>>
>>>> This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
>>>> instructions.
>>>>
>>>> Matt
>>>>
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>> Thanks,
>>>>>>> Rodrigo.
>>>>>>>
>>>>>>>>
>>>>>>>> Matt
>>>>>>>>
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>>>>>>>>> +{
>>>>>>>>> +	u32 instr_size = size * BITS_PER_BYTE;
>>>>>>>>> +
>>>>>>>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>>>>>>>>> +
>>>>>>>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
>>>>>>>>> +		memcpy_vmovdqu(dst, src, instr_size);
>>>>>>>>> +	else
>>>>>>>>> +		memcpy(dst, src, size);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +#define EMIT_COPY_CCS_DW 8
>>>>>>>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>>>    			  u64 dst_ofs, bool dst_is_indirect,
>>>>>>>>>    			  u64 src_ofs, bool src_is_indirect,
>>>>>>>>>    			  u32 size)
>>>>>>>>>    {
>>>>>>>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>>>>>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>>>>>>    	u32 *cs = bb->cs + bb->len;
>>>>>>>>>    	u32 num_ccs_blks;
>>>>>>>>>    	u32 num_pages;
>>>>>>>>>    	u32 ccs_copy_size;
>>>>>>>>>    	u32 mocs;
>>>>>>>>> +	u32 i = 0;
>>>>>>>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
>>>>>>>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>>>>>>> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>>>>>>>>    	}
>>>>>>>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>>>>>>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>>>> -		ccs_copy_size;
>>>>>>>>> -	*cs++ = lower_32_bits(src_ofs);
>>>>>>>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>>>>>>>>> -	*cs++ = lower_32_bits(dst_ofs);
>>>>>>>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>>>>>>>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>>>>>>>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>>>> +		  ccs_copy_size;
>>>>>>>>> +	dw[i++] = lower_32_bits(src_ofs);
>>>>>>>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>>>>>>>>> +	dw[i++] = lower_32_bits(dst_ofs);
>>>>>>>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>>>>>>>> +	/*
>>>>>>>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>>>>>>>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>>>>>>>>> +	 * write the sequence atomically.
>>>>>>>>> +	 */
>>>>>>>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>>>>>>>>> +	cs += EMIT_COPY_CCS_DW;
>>>>>>>>>    	bb->len = cs - bb->cs;
>>>>>>>>>    }
>>>>>>>>> @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>>>>>>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>>>>>>>>    }
>>>>>>>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>>>>>>>>> +/*
>>>>>>>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>>>>>>>>> + * save/restore while this sequence is being issued, partial writes may
>>>>>>>>> + * trigger page faults when saving iGPU CCS metadata. Use
>>>>>>>>> + * emit_atomic() to write the sequence atomically.
>>>>>>>>> + */
>>>>>>>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>>>>>>>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>>>>>>>>    {
>>>>>>>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>>>>>>>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>>>>>>>>> +
>>>>>>>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>>>> +		      MI_FLUSH_IMM_DW | flags;
>>>>>>>>> +	dw[j++] = lower_32_bits(addr);
>>>>>>>>> +	dw[j++] = upper_32_bits(addr);
>>>>>>>>> +	dw[j++] = MI_NOOP;
>>>>>>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>>>> -		  MI_FLUSH_IMM_DW | flags;
>>>>>>>>> -	dw[i++] = lower_32_bits(addr);
>>>>>>>>> -	dw[i++] = upper_32_bits(addr);
>>>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>>>>>>>> -	return i;
>>>>>>>>> +	return i + j;
>>>>>>>>>    }
>>>>>>>>>    /**
>>>>>>>>> @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>>>    	/* Calculate Batch buffer size */
>>>>>>>>>    	batch_size = 0;
>>>>>>>>>    	while (size) {
>>>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>>>    		u64 ccs_ofs, ccs_size;
>>>>>>>>>    		u32 ccs_pt;
>>>>>>>>> @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>>>    	 * sizes here again before copy command is emitted.
>>>>>>>>>    	 */
>>>>>>>>>    	while (size) {
>>>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>>>    		u32 flush_flags = 0;
>>>>>>>>>    		u64 ccs_ofs, ccs_size;
>>>>>>>>>    		u32 ccs_pt;
>>>>>>>>> @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>>>>>>>>    						  src_L0_ofs, dst_is_pltt,
>>>>>>>>>    						  src_L0, ccs_ofs, true);
>>>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>>>    		size -= src_L0;
>>>>>>>>>    	}
>>>>>>>>> -- 
>>>>>>>>> 2.51.0
>>>>>>>>>
>>>
>>

