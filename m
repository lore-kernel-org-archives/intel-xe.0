Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7812C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7A288284;
	Fri, 14 Aug 2026 13:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1OaX4Ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9450E88284
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786714014; x=1818250014;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+AD8O0L6sj2O7YDBSy9TUWgg5nXGbvLT4BLKEilSjZo=;
 b=E1OaX4Mafv7RWSd81P0r4MG0pz8JM1ZTzbMfpJno/O+52TfxOFuNemOZ
 /j/wD95kE37JFW/X1lUtnXHJU/+vTLtqMp2EbQfzlZEX8+I887+cwkDWa
 WXMpdsWbhD7VfqLQ3GuLCsBB56l64H/Cslf7ljDb7p02DdQdqECTenBg5
 N91CyNmS95JBhNLbzg549zwRmbkUmdMUs7gkg5XEVIlv76gA+ZXwA5p5x
 XETg3toiHYv9ooHtzBrvwFCUPIPxAtivqiRkia9qxgtUARlt905BGOZET
 oKBrjCLX5+RhF8Xpr2q3ItChaQfz+ersUjecPAYSNcTfMSK0/ibKXQyfM Q==;
X-CSE-ConnectionGUID: FrE/Ok/CQxmrDA2MlAwfrQ==
X-CSE-MsgGUID: Hlu4V/KtSjG6A8hu/CXJrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97636682"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97636682"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:26:54 -0700
X-CSE-ConnectionGUID: GgKDjp5qTJqlEFGHFYFqQA==
X-CSE-MsgGUID: HcEUft+ZSs2F7j26DS50RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268081822"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:26:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:26:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:26:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBjKvIpuLSapNKOrBztcFcBSmBxfFc7H4+Ic2ziHir4qO/axRNj0NPokYQ7m4J3JQt+eb4g6VbZKBNs3jbK4e+w9Z95glvURk1b4eZQT3KaulEeanBg+ZtST9AMh49my+myeXS2FiOVIkWtcvb+7Wt7WRSrBo98qimZsGOiZjYgdsckXG96cKOdWGazbwYx6prPY3NPFslgIxnYXDAQbwYjx4M7KviLLd64RqR4Fa4S30K6+PBvhffHj75pZ7eXV6sG1yRctANR7dhVlMHTdsQeZfuvEdNkykt5LlaPaMi8jz1S7LTRcUIlWejxcBE5bCo8qHSdfnAl04j/jBsbQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGuymGAH0nqYsjJJgtoeeA8UC9uf4G+7Pdpvecz4tgw=;
 b=C8PzrSxhv28AzCc5umbJq0HdcPT6TX5rYXeVvoFR9gj8b0ivRWNEwuAT7aNTa5rOIZ3SwqN1cZDGe+LkcKWjsjNZYqEyCn8dWb/H34tBobrsGheUEVaL/5h77Tj9KoYCXe/5Ch1VbgG5R0aX5PdTcJ05qoaY6POGx9lkSelgp998AQinFZ/KoGleHbEuBFZUN0qZZ5ypmvxs8o4j8rJhaOnbfEA7WSa3teKsCw8v6Q6DUeDk1ofn4Eoc3MZ2V6SzA9d3O1zlblpH5yFaknsQxRBc4gFHKNlBKDtjb4FfmD1YfPoP9RsDUqJ/PgBMwhz5kZE9lk8vrhfXQUNQfuPOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:26:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:26:42 +0000
Message-ID: <cc891f59-c8db-41ac-86d0-089bb8749150@intel.com>
Date: Fri, 14 Aug 2026 15:26:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
 <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
 <68b5e0a0-03f9-43e8-aa10-2ef1e79d52df@intel.com>
 <c0da31db-2026-49b6-9d3d-46c295564e6b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <c0da31db-2026-49b6-9d3d-46c295564e6b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0037.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2e490f-7042-47c1-2020-08defa07ad8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0pszZIjYw7iMhH8yAe5cbsUx9zQbvMvYMXFOaZBEQ9RpvuBzvXWOCzfyJXpG8eEwbQpIJxczFlvZPmq7aetWJKfhT/zwd1hSdM4r5nppq1IE2fvuEwxi+GzgS9CWDyGbMn38GUHE0Vulh7okSXT3QxMlFHhgQ33GycT0+zZ9tVCOegxGZnqbvovHbJRNE9wUdpxn7q3qGL9nvMXSe5QItyYWEUUZ487LaCW8d3eOMrfxVUzjGq6cysbAj0/kc4yPqf9i0DUskT/TCqMXjz+5IAk3tftifoUnxyxEQP2Fh13IipFOpPAT0Axo3mbq/vuyrcWNkYSFcQ/KWLbAkPG4fLQFIdw+t0tAnlFmTVpTK4vFWishWpHkwHAGiVuKad6ylWu5HjJyRwguvkNZDjSSCtBgSrChxTIZsN2+D+tUpOXcY6Ldf3GF/04lKJXAmEj2EH9GZ4feGtlj0zpyzmB6INXrFcRlz97+jy25zkfNoq89fNl0HnNrvveORV4VK1+aiyZRWTQRs/25deVv9AT1V3DcvXWsPX0XWPNg1eqUYqFPXgApLWRIpzfP8IjfI4oEhzIs8RwyvFDR6V6/w67aIeW0JjsNjABnPiOTl50CdLNwwDUXKwFz84XaJpXG7s/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2RUQVIwVldPWHFXNm1LaTFwREMzWmhFY29FSys2U3k2Yk4xbmhWOVNjUUQ0?=
 =?utf-8?B?V3dmYTBnaVM5Q0E4QXFhR2NzOVFGRlZleGhKRXFQdTRMdXdYaEwvcjkvTU5p?=
 =?utf-8?B?b1gwQjBDVlRYN25ZWUY2T29VRE9hWFJVMW0zdGtCRFpNcjBhbUVDM0RqRHA0?=
 =?utf-8?B?UUNqdlNkQ0JXdFBTb0YwTWszTlB5cEhSUENDSG1SUkRsenVzOWthOVF6SmVx?=
 =?utf-8?B?K1l0MzBPNzBOREovTjZPSjd5azFlU0llYkV4djdRN0ZvM2ZSV1crUEtHMDFU?=
 =?utf-8?B?dmtiRlkwMmZkNjNsNkJkTXdRdjNmbndCR3lwOWxwZ2VET0hxTmQzbFFmZGdv?=
 =?utf-8?B?aUhNdGNWa2dQYkcwSWFYTGkzWkJYblo5dGNEbHNLNFE0VE03Z2RqWDIrbjRn?=
 =?utf-8?B?M25GT1hPLzN3UkIyQXIySjgvcWZmSDBFZlc0THRoWHl4alFCcFIzMU5sZ2xC?=
 =?utf-8?B?dENiU0VXZFBnQjF4cWgzSmE4LzVwUEprNG5lYUJkT3dmeHlsSDFoQ2pHZEhH?=
 =?utf-8?B?bWdMRTBFYUdHVllERnBMcDFiVFdLR0t4T2V3T1dBU2p3dm9xZTNlcnNZNjk4?=
 =?utf-8?B?ZGFGb3M2SHBqQ2s3UWRwc25iMzdXVDZJKzRDOElyOW9DU2RORmRvUEFpbGV0?=
 =?utf-8?B?NnpPQVBCNTV4RTVQMmJ2MTgrY1J3TTdBa2ZUbVZoRE1mRGtYOWVWUER1MUds?=
 =?utf-8?B?OHF0YnFwZGhEK1hQQTZ2cDdwVFVvY1NaUVJaVEJNa1cydDFod3BaVTFPK3p0?=
 =?utf-8?B?ZmdNZnIzQ0NxcHFLaDhKZzdodWg5OExva0JxdGg0UGNxUzVja0tZV0NiQllL?=
 =?utf-8?B?bHpoelpaOWI4MjFRc0RmWUJ1OUZoTGI4WW9tVkZCZ0VZOW5uNEVvSEdTcEE3?=
 =?utf-8?B?V1RPQTJqRVdjaVhSUllkWW8rUG9Ra0xBWHluR2tiQjRqdlFDYUk2QlJuYk1i?=
 =?utf-8?B?Y1lXamlZWUF6RWUxS2pWQnZubzMyYi9FVjFVMVk1OTZTdWpOeWxLTHFXL0xI?=
 =?utf-8?B?WkNrQ0c1Vy9kSk5jMWtua3d4K3liMTVxT1hCa2hiUFF1TkxhekZ4WlMzZTR4?=
 =?utf-8?B?OWhReDZXK1R3aEpGYVIvZWx0czdvNXBJQ1FURXNMT3JBUittQnVYczNlYThU?=
 =?utf-8?B?VzR1MVpIZllNNjhwZlE3N3R4ekgwL2l5N0hwVi9raERFK04zQXNGSHVGU0dm?=
 =?utf-8?B?cE5CdmlMalBSUithNHVLRzFvdXo5VytwUkRNVFlranpUbEtMNUhJOEtpQXdy?=
 =?utf-8?B?VnUxejFlTUtBWkc2Q1RNdmp0RDVRSE83NHhYSUdXdnduRDJEcmpLT2lXa0xB?=
 =?utf-8?B?VkxHZ2NWam1DejNLWWFzeU9kMm94TWRIM2hISDdsTHlRelQxWWJIL2FBaWho?=
 =?utf-8?B?UlE3TTdCWWZLVzgzbUR4Q0d2bjVPN2hQbjhQOVFGQmFtMzU0NjJ3a1cydkw3?=
 =?utf-8?B?ZUROek9qTkw1cjJBNjVJNk9zcWlWS2NNUlF2dUkvU3FvN2cvQ01LNGhESDFi?=
 =?utf-8?B?dWt4UW5XTDZzZFpRckR3RlRQYUM0NzRwRnVMQ1pWTXZoQnd5WTdEUHZMUVZH?=
 =?utf-8?B?NjN6U3Fsd1ovWVp6YS9NMmp6WkRQU2ZvNllheDFWNk9sRHdCaTJoOVRSdGFW?=
 =?utf-8?B?eFVpOGI5aEQvd1RraEljY2cxemFqVHJWSHNZRFVjT3dLdllRQjhRSmk1dHJ5?=
 =?utf-8?B?TUozbjhVN1ZkNDZYNm5WSVFuQjNmZ3U3ZVZlK1Zuc1VvY0xLQStZQWJqZzFY?=
 =?utf-8?B?RUs5VmVsWERHSU5sTVhwRXF4N1VEUUxweGJwdCtqYzNWNFpxbkhrSEFTaFJu?=
 =?utf-8?B?Yjc5WlBoelhlRWZUUHRqbmE2RmRxK003dW5tM1JVTTdTOXd3eGdpSHRQMmNp?=
 =?utf-8?B?eDdNL2hBQTJHNnRRemlrbDIwTHJZbWE0Z3hYby9DNXZYd1pDNEZ5SnoxMzZK?=
 =?utf-8?B?cTJQNitxRjQyT3BPZWhrZWdqQXlWWkZFUStxaHd6Z3ZodjlsZUNTN2UwNzZn?=
 =?utf-8?B?TVNsQ3VWemEyc3JvM3o3TVFlM21FemZiOVg2cUVPcVZHS2NnZzdzaDhIbVR4?=
 =?utf-8?B?WUhNdXdFN250M1pxZTFuMlZCaWZLTms5NUNiTVl0K3UzT0hmY1p5WEZCTGts?=
 =?utf-8?B?M3pSblAvN3MyK1JNVzUzTHoreXBSUnFxTEpGR3NSUnNsMUhRUEpWR0hsZnZM?=
 =?utf-8?B?UForeHRKalJaSndKeGgvNEQ4cmZySTdGWVN6aFl4OTJWTDNUWDhYeUIvNVpL?=
 =?utf-8?B?UmtGRnNJQnhNekJUb1U3dldpWGVsRjN6M3R4Q011a2xOVWNCeTVuck94Zk5y?=
 =?utf-8?B?TzNmZTZsUittbElOS3ZUdURGK290Z1RpUC9WQkVaeCtNK0dscDkxZytVengz?=
 =?utf-8?Q?E7Wmg5ur2L3yhpIs=3D?=
X-Exchange-RoutingPolicyChecked: LZM0ivA9J183LzWXKyZxgcUTIj95GUjJefRc5s4AhZo73x+5PylROkjMa7bFt+St4VSv6/nmtcaCYj5XTYopACQT9p/TOoiBVnauB/PeVvSvrOJ1cH0rR6KChw2ajBD2IK1NEvhoPkAkiFGFQWD0/VA3/zSjq19My8WDyJ499HpzK6zgnq4ioY+bRDrGtn2dmB0BqSD1Tvyt9HNblot1WkhNV72RjwaLTnZmP29hDTrmt8nS55T2Tr3ihsc+O/pSQRMloBgUUSUyi1tkWZMFq3j67PkM/cA28rdBHH6FZNgiY7bF6NFAwOhIK5JnJdFXOneKVzIazM5ZDbY+9HrHdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2e490f-7042-47c1-2020-08defa07ad8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:26:41.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkD85moz48V31GzQe+bUEJe1exEAxGUUM2TW9pj35vBbNydGxjGBMggmalo7ZA58Fud0w4dgEQySMfWL25MYOBXTz0IPWWxH57ptzvfmXa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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



On 8/14/2026 12:27 PM, Tauro, Riana wrote:
> 
> On 14-08-2026 15:48, Michal Wajdeczko wrote:
>>
>> On 8/14/2026 9:06 AM, Tauro, Riana wrote:
>>>
>>> On 13-08-2026 18:16, Michal Wajdeczko wrote:
>>>> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> index ebd288986c11..5d3315ac735c 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> @@ -18,6 +18,7 @@
>>>>>>    #include "xe_mmio.h"
>>>>>>    #include "xe_nvm.h"
>>>>>>    #include "xe_pcode_api.h"
>>>>>> +#include "xe_printk.h"
>>>>>>    #include "xe_vsec.h"
>>>>>>      /**
>>>>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>>        struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>>          if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>>>>> -        dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>>>>> +        xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>>>>            return;
>>>>>>        }
>>>>>>    @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>>        create_survivability_sysfs(pdev);
>>>>>>          survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>>>> -    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>>>> +    xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>>> This should be xe_log_err
>> do you want to include any specific errno here (like -ESTALE)
>> or just use 0 to do not include it in the message?
> 
> Can we skip errorno for now based on comment in the last patch?

ok

> @Rodrigo I was thinking we could add the detailed error information from scratch registers here
> in a future patch but will need to come up with some format
> Let me know your thoughts?

btw, is this something more than what the log_survivability_info()
is currently doing ? we log that with SIGID already (but not
always)

> 
>> asking now, as I don't want to respin the whole series
>> after I make a wrong decision based on dice roll
>>
>> having an extra errno in the dmesg/CPER along with SIGID will
>> likely help us write better documentation with resolutions
> 
> 
> For survivability, UMD's need to check sysfs always before taking a decision
> of recovery as we have multiple recovery methods.

btw, there is a chance that sysfs creation will fail.
maybe in such case we should unconditionally call
log_survivability_info() to collect all info at
least in the dmesg?

> We cannot have generic recovery documentation based on error no here.

it looks that providing valuable resolution based just on
the SIGID alone will be even more challenging ;)

> 
> Thanks
> Riana
> 
> 
>>
>>>>>>          xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>>>>        xe_device_declare_wedged(xe);
>>>>>> -    dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>>> +
>>>>>> +    xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>>>>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
>>> Same here.
>> ditto
>>
>>>>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
>>>> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>>>>
>>>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>>>
>>>> @Riana, @Rodrigo, @Aravind ?
>>>>
>>>> I need a decider here
>>>>
>>>>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>>>>
>>>>> however we need to create separate refactor patch for that in future.
>>> Why do we need error no here? It should be 0.
>>>
>>> Thanks
>>> Riana
>>>
>>>
>>>>>
>>>>> With above changes:
>>>>>
>>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>
>>>>>> +    xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>>>>> +        xe->info.platform_name);
>>>>>>    }
>>>>>>      static void log_survivability_info(struct xe_device *xe)

