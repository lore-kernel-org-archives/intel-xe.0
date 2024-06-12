Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D52C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 23:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A2E10E0BF;
	Wed, 12 Jun 2024 23:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoHKchfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403CA10E0BF
 for <Intel-Xe@lists.freedesktop.org>; Wed, 12 Jun 2024 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718236362; x=1749772362;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=O4KoM/rF2T5TS+5vtKTY05GE9VLwlos7Pk8ZSm1M0MI=;
 b=eoHKchfhutFsoh+8hpAj1MhHd09G1dHK7EvX2MmUNTr3zlwJ1c0ucZb7
 OTeLhTy2au5N3H0Mb8YdB2tozCqzr83TI8NTid2M3sZS5AH7JSk4AV5cM
 nIjnQT+AbquFk0ICt4XQK/2vXO47B8zT1DKt6jGjEIxqtw4Jf37upEpDP
 vYbHRF6tSI2OTbncnFeZrO3/jPzQg5sXcSu9l7UN2YMw4Is6u/D135f0x
 VKgwOavGnsKZpmlaLvKnyWR3/wnodHAL7pifDSBCuDhMexGiVXFeOfkr3
 l+x/lhlvT15qsurQyl71W+ySWmTVxgW0vAeUWm0r/kGgYkR6lthXz8egO g==;
X-CSE-ConnectionGUID: ETjveirURQaOu5ryURYY3A==
X-CSE-MsgGUID: sqxhgJcxRaSnHHJZVF7CUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18853065"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18853065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 16:52:41 -0700
X-CSE-ConnectionGUID: nekvisRkRmOHqCDjClLbgA==
X-CSE-MsgGUID: 7pEJx5+QTMCFxTzNCHRUlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44852489"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 16:52:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 16:52:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 16:52:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 16:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8Iq9Re4Ebd017d3SvCoSKjbetbMW+xJxzlDFW/RF41h7G5Pv6RU0WTmTVV/oXAekwJK8JO+lcWm7XEc+bEvyB9bzRwV724lBL4DUnBFIi/tpRY3TARO0DBWhwVOtbS5nspIeZrAKpiXfvtmX9i7nMIkffACm7cftm/maM0YH1MgJcDirPf0nM3OOPlXTQYRKuaHy5A4DM7O+AA4WlZkEd3t//V3UPXmvoVRdOae+Qo1OxiJXX2/aSs64Wn6KVWHrU8qTI/BgHd/qIAJYb8axdVXqlOJVSxOTOruaZ9zVIO2+HW0pbzgGevxCwXIeMU7j6zmKO3mkqb2j6YNJtn7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFev3bzRy+VKjqg4OpnhGEC7MfwlHqSkO8/qcNQ7YVo=;
 b=Riv5xuuQ1wTi0Ls3xvWN/tkKiC3SVbDsbgOFA2eCOwLXlc/oJYaaTqz9gWtnsQYELRXN1rRr98TpCDTVY/mSNv/lxE8l3f5ybAMGIB7iJEUqQDuSLdUJ/eZ1aZ/2au4rciIdil5TJTw3auiKpC47/xjqGRfMY7vpMVLg/eFGct+iRjgnj7G9v7PUE9hxKgODjOpMJrGnfZWkZDcSGHgtkUuNIJn1bdnF//T+A+CGs1nCeeQtyb6qxjh5kNqlejq74ldM9Fsay8lOol5DwgPGCpjniMrELzsrXJYDNYEcouh28BMuh40T4MXZ36lr7nnUVpmGewoXfL5Pl4Bp5PrIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 23:52:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 23:52:32 +0000
Message-ID: <7dd22bd8-1550-43f1-82b6-83200a46e2da@intel.com>
Date: Wed, 12 Jun 2024 16:52:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/xe/guc: Use a two stage dump for GuC logs and
 add more info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
 <20240611012028.2305024-4-John.C.Harrison@Intel.com>
 <5fc7f334-0f3d-4180-93fa-d40a1c98064c@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5fc7f334-0f3d-4180-93fa-d40a1c98064c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b923cb6-b66a-4a77-3892-08dc8b3ab9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGsxbC90RnYzMzFLdy9mUXUxa3J5UHJwem9RMTZnTUN0UHFLdUJCNlgyNUx3?=
 =?utf-8?B?RkZvYlAzamhxMTFIV1Q3RDZkbEYzT1phRFBGVUpodHczdXFqUXBOa294K0h1?=
 =?utf-8?B?aGdxV3pLcjQrZm8zeFE3RHBvV2huaE1UeWRDTHM4QThBajZBUVY4RDhYSU9s?=
 =?utf-8?B?L2RyUm9pRnZyL3dtM05GSDBDaWVCSCtKRllyLy9iL255ZE1tcFBSbGN4ZDJt?=
 =?utf-8?B?MkN0elJsOXNQN1pOTU9RUEZIM2J4ZzVDSGt6YkI0SHpKVEc0dGZyckdteGZq?=
 =?utf-8?B?YVpucVhNOE41YWpwNmRuOHlqdVBCZXNUdHFia3J6azcyRGxtSUxBR2RUTXJW?=
 =?utf-8?B?cW1qUHo3cys4SkFjbVVOOWYyOUFQdm82dGlqdkVuK3ZiaUtMbk1UQUdCQ0Vn?=
 =?utf-8?B?cHpKVkhmc3FJT3cxM085ZHdhTy95T1NZS2s2c1A2VVN0dkdDRFpIdjdVNXlm?=
 =?utf-8?B?bnVpQmNXWFR0SlYzY0F1WjNjNXZ2YjZNcHptNC90NWhvM3JrSTRjUFc5UTFs?=
 =?utf-8?B?cUhZVGpROUl5eFhBQndFQS9mYkhyNnpBYjlKMy8yYkdLT2NTMmI5a1Rac2ZS?=
 =?utf-8?B?TE1oWERXVExiZndLWUN4dHZHWGxsZG1GTzA3WkRMQ29DUDJVZmRiSlZhR0Ru?=
 =?utf-8?B?bDBXd2lHYTNhQm5KZEFHb2VmcU41U3lzdi9iZnVtOTNSc3ZTZmp1RU9KWHJC?=
 =?utf-8?B?TzE3djc0UHFuSmNDRk80VVNDNHZBbFd1bTRYVEZsYjlLOFB3aTBCYksxOTNZ?=
 =?utf-8?B?QmNNMFBMb1lLR2dmcTdSRVRaV2toeFpPcGNkaytIRkV4V0MyUDlKVFNpR0tl?=
 =?utf-8?B?KzlOcDdLOTNMcm10b01mY3VPVDdxeGVJZXpseGdUa2hVOG1sQzRnaWg4Ry9E?=
 =?utf-8?B?N2VqMzdkMm1HSkhQT082bjArcXhZTms3NzhnczhXZitZWE1ta0RWbjQ3VzJt?=
 =?utf-8?B?MWxFUk1sTGxkMGlxNDI1V0t1MGtnWElGYlM2WC9leGl0Q3dhcWhIYXZrWnZa?=
 =?utf-8?B?U1B2TEhnZm5wUCs0aGtuaThZeDN0Q2NTYmQzSXFqbThpL0J4MHdqdlBjQ0hq?=
 =?utf-8?B?ZUViT1ljSCtFRkF5cTBMZ2lLUHlRVm5FaFkza0ZaUm1JSUNYeWtHMEE1YlFw?=
 =?utf-8?B?WHhramt3T0t0ektETzBISGZ6cjF3NThYcWtHZWZQWE52MWo5RjdxaWkyTEJi?=
 =?utf-8?B?NGhaYzYyWVpUdlNRaWVsU0VoV3I5WXdjdjJHeHJXZmRKTTVqRVBXUi9lVWhK?=
 =?utf-8?B?aDBidkNLRGFFVm93Y2pvbUhOUFMyVURqclNpdnNyNGRrQnB1cEdPVjB3ZVV3?=
 =?utf-8?B?cjlORzdBejFYRVgrV1Ezd1g0V0ZuMU5nTmI1NDc1ZisyZFU2eW15ZkpCWjQr?=
 =?utf-8?B?UE5ESC9tdFF6ODdWTU8zNy9sa2NVd0w1b1pWWEJyNjBaVm9XN3F5SERYVjVG?=
 =?utf-8?B?bXBTNVVZSGpFcGVKckNpWExCODZNc2RGRlJtSjRmRC9hRExCeld6dk9GMHFR?=
 =?utf-8?B?dzV5RTlaSUo1YmJ3ZnRKSmRmL3RLTUFWRWFpRE9oZkw1N3RiakdpZG9HTkhu?=
 =?utf-8?B?dVZrbENVRGQxcXNmbjV4Y3p5M2Q5YVRBNVdYVnoza1pQYmhIRlIxekFOcXRP?=
 =?utf-8?B?NzZLSWlzVEx6ZCsyNG5JRUs5RmFtK1ZjN3RKVVlGMnFFQlE2bWlMT0xLemRt?=
 =?utf-8?B?dmNhTWpjYUZacUJCYTYzOWIwRVp4VDZzMWxBS1NpWHBGOE9DNmZYMHhHL1VI?=
 =?utf-8?Q?VnGr/W1LyIdnrVngiWnDIfPHffIXxdhOtvwVmBC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRFbXhBb3NOMnFtTmwvUExXUUVMaWREV2t5Qk0yc0o4ZXZVdGlWdXNiREU2?=
 =?utf-8?B?SGVCOXV5Zk44cmQ3cGhWclY2NmV3NmQxamtwdllPa0Y5TWtNbkh5a3VmL3h3?=
 =?utf-8?B?dmhjL2gyTTJGNWVWazhDUHhuaTRCOG15NmQvOTd2aHFxWi9GRWsxR3BiVG1F?=
 =?utf-8?B?SitwVnhtTUNWNm5wWFRwbkVVZzhRbFJMOGRaQVBkSkhPbDMyNEx3U24yNllL?=
 =?utf-8?B?YWZrRFBmSVF0ejBRM3gyTXU0Z2VTSVUrb2ZaR3Z5T2lrZnI0dkZuRk1MV21H?=
 =?utf-8?B?akI1Y1lSbHVaU3FRNXdBcWVIOFhvbW8vMmNGMHdjWTFSNTV3Z3o1ZUFoNEhK?=
 =?utf-8?B?Q2swTHNNZGE1R3cwUEl1dWJ0eVFBSVV5Mk4rYzlYU0dvRFZBSUxMaXdSOFpj?=
 =?utf-8?B?aGRxMjR4NGRuZGJMSk9YWnlqWmdRZVpTRTNEbDZMd0hlYTRGUy9UMkdseVFR?=
 =?utf-8?B?YmdVTUE1bHA4a0F4VElWdlgzWVZuNHhJaDRITU4wVHIvam0vMndiNzVHTy9m?=
 =?utf-8?B?UGVSUUx2NkRCUnBpVVk1ak1JWlExN2x4MkZhSjI0Mmc4cm9ybXBKV1VHRG9H?=
 =?utf-8?B?bFhHekRkd0lMbUtwRmpXRGpqZE5kczF6OVJ0djljY0NvUjJ5NkdzNEg0dmdv?=
 =?utf-8?B?UUdFN2tVeFc4QVd4OHNjd2ZyVFVicUI1ZXFnbGJqVDFPYmVsOVNVQ2c3MXM0?=
 =?utf-8?B?eHpYZkk3VnBzRG43MEcxSnZhRklXK1lYWTFSb3BpcTFsM3Vmc2RoOWZUUlRR?=
 =?utf-8?B?bVN5aStzZENuVUFaVGtoL1ZmL3A1RVFycTNock5RZjI3ajQ5QmJKdncrdUlR?=
 =?utf-8?B?QmtRTzUzK3VwNlJacUkyOTY4QllMQURCS0pVNmV2YTZhQVMva042ckgwNGxi?=
 =?utf-8?B?ZWQvdHZONFBoQWZtaU1Zb3J4N25iSUxJeWN1SkNmcFk4RXdQSk9uOHhzeVVn?=
 =?utf-8?B?TTNCd1RGT2FaWFF2YmovTzYxVVI4QzZ5UVZaN0dRSSsxZGZiNFk0NFpJWHFz?=
 =?utf-8?B?THQ3SzhrQ29IcndFZTBQaFNjTzVxc1FRd2REOWhabHE0VmJBVjY1dHJtbEd5?=
 =?utf-8?B?RXZRNkRoc25PK3dlWEhCTGdTdXdPV1BDRFd1cVFHM2NHSExLRzN1Q3ZzdTRh?=
 =?utf-8?B?S2lsdE5yd2lLVFhlSURkd1FWeU1CSFZPdXk2Z1c5cmVtbXd5Wmg5OHp4SXRW?=
 =?utf-8?B?Q0dZZzBqYmdtdHBKMlpDWWZRdFFnNXRtL09mRlh4VDlCK0FXREdiM28wTmJM?=
 =?utf-8?B?WVJsblpOUVdYYlhuQTExeW5oektYbjlYbmhSZStFN3dZazhLV3ZSUDE3a1l0?=
 =?utf-8?B?bWZ4MVg0Wi9NMjhyMDMwcThRZExTN215VXBTUGRJV1l5a0hrbXF2SmNyR0Ur?=
 =?utf-8?B?MEcrSW1XQzNhVlVEcXpsSEFKNFV6WStNUDFEVmtibGZzQ0RVR0ltVkg0c0JB?=
 =?utf-8?B?dllqSU55S1Zndk5PWmtTai9TOWpsL3FRdUJ3Yno2MDFpZGMwNW5qaFBhakw1?=
 =?utf-8?B?MjZCazE1bUkyT1RjeUVSUmFOR0lOMDJHbkhNWWkxRVpSb3RFV0hXOG56ZU4x?=
 =?utf-8?B?RjVXeVFHUWZseHJOTS9hSnA3OFhZTFVVUEljb21oa1lmMnVvT00ycjE2QURw?=
 =?utf-8?B?MjBRRUViclN5ZHFCN3ZaRHBBekRoK2Z3RzZyaFNKTS9vWjZxOU9xTnB2V3FY?=
 =?utf-8?B?cTcyN1dpVjRpSm5FUXNaclJuU0t5WktHNEkwNWI2NGJQbUJEVWYxRnFITHll?=
 =?utf-8?B?cU5JVFBOTkFKK21tQ2lnV2VONDk1bzd1TXFBNWNPVGQrb0JKQzFIZlllamVz?=
 =?utf-8?B?QkNQcFljZ3N3QTcvZktIenZlUHp0S3hkZW44U052anp3UXEzd1FiNFJvb0pU?=
 =?utf-8?B?NTlrNDZaYit0OHVtSnAxc3ZHdkdHRkNjMDkrR3lKWEwxSnovUHE5eDJBL3pT?=
 =?utf-8?B?RkR2MEwrQjhOaFZQNWo3SFB6T1J2ZHBXUlhVbTNRTU1jQkFoYnNpTnIyYktU?=
 =?utf-8?B?Sng2eG1sOEhJSHErR2hKbHl5Znl1YlBxQXIxY0FtdXdpTWVBaE03MDVDUVlO?=
 =?utf-8?B?NktNSmV4TzBlTUM5Q0FCcThjbERPUHJ1OWVPenZGZWwxQllVeklmMzJOc3pD?=
 =?utf-8?B?OXpmVTEyaG9Oa0tnQkNBbmo0MnhRSW5xM2cwZy9sRW5ISExoU2hsMExodG1r?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b923cb6-b66a-4a77-3892-08dc8b3ab9dd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 23:52:32.3992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVB+GJUvWXLEAvGhvt9h8irM1SCBkatNJH2OqkIaoWiq2eGu67qi9E6VBKT8IaB5f5uGGuWBQQuJwXzd23ouztNTyxpJwelDpDrjuGtycgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
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

On 6/11/2024 15:49, Michal Wajdeczko wrote:
>
> On 11.06.2024 03:20, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Split the GuC log dump into a two stage snapshot and print mechanism.
>> This allows the log to be captured at the point of an error (which may
>> be in a resticted context) and then dump it out later (from a regular
> typo
>
>> context such as a worker function or a sysfs file handler).
>>
>> Also add a bunch of other useful pieces of information that can help
>> (or are fundamentally required!) to decode and parse the log.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 150 ++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_log.h       |   6 ++
>>   drivers/gpu/drm/xe/xe_guc_log_types.h |  29 +++++
>>   4 files changed, 155 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index a5fd14307f94..b27b73680c12 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -84,6 +84,7 @@
>>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>>   
>>   #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>   #define   GUC_SEND_TRIGGER			REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a35309926271..a35d3cc0c369 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,12 +7,20 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +static struct xe_guc *
>> +log_to_guc(struct xe_guc_log *log)
> any reason why to split signature into two lines?
Because the similar log_to_gt underneath was done that way so I figured 
it would be best to match that. And no, I don't know why that (or indeed 
the same in many other files) is done that way but it does appear to be 
the common convention.

>
>> +{
>> +	return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -108,62 +116,142 @@ static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
>>   
>>   #define GUC_LOG_CHUNK_SIZE	SZ_2M
>>   
>> -void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
> no kernel-doc
>
>> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>>   {
>> -	struct xe_device *xe = log_to_xe(log);
>> -	size_t size, remain;
>> -	void **copy;
>> -	int num_chunks, i;
>> +	struct xe_guc_log_snapshot *snapshot;
>> +	size_t remain;
>> +	int i;
>>   
>> -	xe_assert(xe, log->bo);
>> +	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
>> +	if (!snapshot)
>> +		return NULL;
>>   
>>   	/*
>>   	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
>>   	 * Also, can't use vmalloc as might be called from atomic context. So need
>>   	 * to break the buffer up into smaller chunks that can be allocated.
>>   	 */
>> -	size = log->bo->size;
>> -	num_chunks = (size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
>> +	snapshot->size = log->bo->size;
>> +	snapshot->num_chunks = (snapshot->size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
>>   
>> -	copy = kcalloc(num_chunks, sizeof(*copy), atomic ? GFP_ATOMIC : GFP_KERNEL);
>> -	if (!copy) {
>> -		drm_printf(p, "Failed to allocate array x%d", num_chunks);
>> -		return;
>> -	}
>> +	snapshot->copy = kcalloc(snapshot->num_chunks, sizeof(*snapshot->copy),
>> +				 atomic ? GFP_ATOMIC : GFP_KERNEL);
>> +	if (!snapshot->copy)
>> +		goto fail_snap;
>>   
>> -	remain = size;
>> -	for (i = 0; i < num_chunks; i++) {
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>>   		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>   
>> -		copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>> -		if (!copy[i]) {
>> -			drm_printf(p, "Failed to allocate %ld at chunk %d of %d",
>> -				   size, i, num_chunks);
>> -			goto out;
>> -		}
>> +		snapshot->copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>> +		if (!snapshot->copy[i])
>> +			goto fail_copy;
>>   		remain -= size;
>>   	}
>>   
>> -	remain = size;
>> -	for (i = 0; i < num_chunks; i++) {
>> +	return snapshot;
>> +
>> +fail_copy:
>> +	for (i = 0; i < snapshot->num_chunks; i++)
>> +		kfree(snapshot->copy[i]);
>> +	kfree(snapshot->copy);
>> +fail_snap:
>> +	kfree(snapshot);
>> +	return NULL;
>> +}
>> +
>> +void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
>> +{
>> +	int i;
>> +
>> +	if (!snapshot)
>> +		return;
>> +
>> +	if (!snapshot->copy) {
>> +		for (i = 0; i < snapshot->num_chunks; i++)
>> +			kfree(snapshot->copy[i]);
>> +		kfree(snapshot->copy);
>> +	}
>> +
>> +	kfree(snapshot);
>> +}
>> +
>> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>> +	struct xe_device *xe = log_to_xe(log);
>> +	struct xe_guc *guc = log_to_guc(log);
>> +	struct xe_gt *gt = log_to_gt(log);
>> +	size_t remain;
>> +	int i;
>> +
>> +	if (!log->bo) {
>> +		xe_gt_err(gt, "GuC log not allocated!\n");
>> +		return NULL;
>> +	}
>> +
>> +	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
>> +	if (!snapshot) {
>> +		xe_gt_err(gt, "GuC log snapshot not allocated!\n");
>> +		return NULL;
>> +	}
>> +
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>>   		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>   
>> -		xe_map_memcpy_from(xe, copy[i], &log->bo->vmap, i * GUC_LOG_CHUNK_SIZE, size);
>> +		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
>> +				   i * GUC_LOG_CHUNK_SIZE, size);
>>   		remain -= size;
>>   	}
>>   
>> -	remain = size;
>> -	for (i = 0; i < num_chunks; i++) {
>> +	snapshot->ktime = ktime_get_boottime_ns();
>> +	snapshot->stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>> +	snapshot->ref_clk = gt->info.reference_clock;
>> +	snapshot->level = log->level;
>> +	snapshot->ver_found = guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>> +	snapshot->ver_want = guc->fw.versions.wanted;
>> +	snapshot->path = guc->fw.path;
> shouldn't we use kstrdup() instead ?
The firmware path is always a static string. It is either an actual 
static const thing from the compiled in table or it has come from the 
kernel command line as a module parameter. Either way, it is not going 
to change or disappear for the lifetime of the Xe module. So no reason 
to waste memory duplicating it.

>
>> +
>> +	return snapshot;
>> +}
>> +
>> +void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
>> +			       struct drm_printer *p, bool atomic)
>> +{
>> +	size_t remain;
>> +	int i;
>> +
>> +	if (!snapshot) {
>> +		drm_printf(p, "GuC log snapshot not allocated!\n");
>> +		return;
>> +	}
>> +
>> +	drm_printf(p, "GuC version %u.%u.%u (wanted %u.%u.%u)\n",
>> +		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
>> +		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
>> +	drm_printf(p, "GuC firmware: %s\n", snapshot->path);
>> +	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
>> +	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
>> +	drm_printf(p, "CS timestamp frequency: %u Hz\n", snapshot->ref_clk);
>> +	drm_printf(p, "Log level: %u\n", snapshot->level);
>> +
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>>   		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>   
>> -		xe_hexdump_blob(xe, copy[i], size, p, atomic);
>> +		xe_hexdump_blob(xe, snapshot->copy[i], size, p, atomic);
> we really should get rid of xe in xe_hexdump_blob
I'm not seeing why but that can be done as a follow up patch if you 
really think it is necessary. Personally, I'd rather spend the effort on 
completely removing it and going with compressed ASCII encoded blobs in 
devcoredump.

>
>>   		remain -= size;
>>   	}
>> +}
>> +
>> +void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>>   
>> -out:
>> -	for (i = 0; i < num_chunks; i++)
>> -		kfree(copy[i]);
>> -	kfree(copy);
>> +	snapshot = xe_guc_log_snapshot_capture(log, atomic);
>> +	xe_guc_log_snapshot_print(log_to_xe(log), snapshot, p, atomic);
>> +	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 5149b492c3b8..6e4d0b369c19 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -9,6 +9,7 @@
>>   #include "xe_guc_log_types.h"
>>   
>>   struct drm_printer;
>> +struct xe_device;
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
>>   #define CRASH_BUFFER_SIZE       SZ_1M
>> @@ -38,6 +39,11 @@ struct drm_printer;
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
>> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic);
>> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>> +void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
>> +			       struct drm_printer *p, bool atomic);
>> +void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>>   
>>   static inline u32
>>   xe_guc_log_get_level(struct xe_guc_log *log)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..e3a6a44c2f18 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -8,8 +8,37 @@
>>   
>>   #include <linux/types.h>
>>   
>> +#include "xe_uc_fw_types.h"
>> +
>>   struct xe_bo;
>>   
>> +/**
>> + * struct xe_guc_log_snapshot:
>> + * Capture of the GuC log plus various state useful for decoding the log
>> + */
>> +struct xe_guc_log_snapshot {
>> +	/** @size: Size in bytes of the @copy allocation */
>> +	size_t size;
>> +	/** @copy: Host memory copy of the log buffer for later dumping, split into chunks */
>> +	void **copy;
>> +	/** @num_chunks: Number of chunks withint @copy */
> typo
>
>> +	int num_chunks;
>> +	/** @ktime: Kernel time the snapshot was taken */
>> +	u64 ktime;
>> +	/** @stamp: GuC timestamp at which the snapshot was taken */
>> +	u32 stamp;
>> +	/** @ref_clk: GuC timestamp frequency */
>> +	u32 ref_clk;
>> +	/** @level: GuC log verbosity level */
>> +	u32 level;
>> +	/** @ver_found: GuC firmware version */
>> +	struct xe_uc_fw_version ver_found;
> didn't you mention that platform and/or revision is also mandatory to
> correctly decode GuC log ?
Yeah, but the platform is not really a GuC related thing. So putting 
that inside a GuC specific structure seems even more wrong.

>
>> +	/** @ver_want: GuC firmware version that driver expected */
>> +	struct xe_uc_fw_version ver_want;
> I'm still not convinced that it's relevant to the actual GuC log what
> driver wanted to use - this should be part of the GuC snapshot instead
>
>> +	/** @path: Path of GuC firmware blob */
>> +	const char *path;
> ditto
When the snapshot moves into the devcoredump, then all of this gets 
moved into a GuC specific structure within the core dump. But for now, 
there is no GuC snapshot. So therefore, they are here. As already 
stated, this is all stop gap measures until the proper solution is 
implemented.

John.

>
>> +};
>> +
>>   /**
>>    * struct xe_guc_log - GuC log
>>    */

