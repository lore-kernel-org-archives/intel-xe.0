Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0313606A90B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bf0nUeGC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4D310E6B1;
	Mon,  2 Nov 2026 17:37:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BCB10E6B1
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793641061; x=1825177061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8OfgHHzua/8I7+i6ZrAsSXZ0ojXPQA2vQUS8HvqZ7qg=;
 b=bf0nUeGCFG6AKy6qn1SwuNkA8wktIkdjqH2hf9b09UiDzQCAG+oV6y/7
 vBfnji781xklTYasBwHJE39T6jctfmKgae7ol2SApufN18HeaMamtieew
 HXKX5s/l3ThucvJY40LPzABgMfg9f/1Bg//tSxX7CSyFSrNBWtteZxHc7
 5hXY0KJNgWFSC+KiPRP2FH7F3HYYBWVekKSSqS321uuZmYmaDRDIKMXer
 /940pQHt5nxKuPjG9k1z4fmxk29kfBz2UjezAEetEUEEZDzsW6A7CiydX
 U7er+UdcamwswEL6DW60Cu18fSmk8m2pARgyIPuMrKkfTKk3d7rf5e7jS A==;
X-CSE-ConnectionGUID: FRNdZBWMShKkR8VTnd4Tsg==
X-CSE-MsgGUID: RuF3vfMsTsSwRGEz5tBZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2356226"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2356226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:37:41 -0800
X-CSE-ConnectionGUID: zcsQlOjWTieRXPiTtH1CtA==
X-CSE-MsgGUID: 4sjX7FZ0Txaa2UfQC5OaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6516764"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:37:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 09:37:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 09:37:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 09:37:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpBtzQ5Uh2oTGqRcklXXF9pVHo8Vh5v3TxS/tZHSykNzWNcQm7IFRy+mAjeb1gKoP5t8JYBDdzt6a+ok0Kq0CcOF1QOqjVQrCDq8cvxxuCIxCfy7qze/aijlMBqJ7c+Bu7juwiLXbFzPhYr1ZJoWWoS7/RE1G3UurWtsSoMFkkBrw36tevc7rLXxmJBGGWOmk/lUs6GxWzHxFOG9sceDSePSWd62mtMUCAwUecFrWJsC1Kkb4+xbYyfM9nvqCSfoLdKT+dv/7ybKFwZ7/3beaN/LLcRfJjsa9OK9QsKByJ69XCelltRRuorYU5SlZY39Qr5jf1Oteu9qd5xRYPmsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC8KxmtDljjx5tEAbEyubM3OpmH37Z1CD/8BmV5A7Fk=;
 b=oc8jcN/0XNNiMYmPSJJQB2leNbtgW1fPSABxGmC19NF2RHeGCvt/U3lwuUGppw1L0YiXLdlcYWnLijkTsFXzJIs7yGvI5RInWNudDs54LIih3mp7VDmrFJ5ZXKv1jZYVSmquxSgYpPfXdPXAbIX27eIUyiXBf4voNcCur5AZjY5Y1wig520d0n9AvUpWk/9H+ZOLexHEOGp2JxmMFToPUWngc7uIlu8/dlcBSWdnnLbTmEq6opFnySzw5pgbgiIrGn6oAHsuMTkgQG1E9+6+UWiFLqK3bf+QwupjdHvMNtIVlH+KByf1/v+Qji2LiUP1FhNr/gPzxHHW86d9p7mQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH3PPF632600ADB.namprd11.prod.outlook.com (2603:10b6:518:1::d27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:37:37 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:37:37 +0000
Message-ID: <755f0052-08b9-4de4-b7db-39fb4943ab22@intel.com>
Date: Mon, 2 Nov 2026 09:37:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] drm/xe/xe_late_bind_fw: Enable late binding
 support for CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261102172527.2794537-8-badal.nilawar@intel.com>
 <20261102172527.2794537-13-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261102172527.2794537-13-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH3PPF632600ADB:EE_
X-MS-Office365-Filtering-Correlation-Id: 184fb604-b306-4c3c-3fc3-08df3907fc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|261022113327099003|261021123027099003|261021121427099003|4143699003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: iRSFS1NA9aXc8K7QyKyoxf9BXeEiVvV8Un18nKirPWr7tEzDjdMtlnfQvHHcNW0hdA7LT8ItPhA8e647yZ6nwkdYug8cHzft8aYTJyAUbYMeKsUsbxWr2MMA4J1QKynRPSSbcjg0FWaNwTW8m0oVH3JVzIhNX72guytgGMxngdGGnQ9isJIdCBRrjc3hKNBHL3Kz2Hzk/WED8MN9AypCynpqLnoYzVazkvA1tsYnAov/I2TikRyyCNLZAUfLBs1v2uHn9Xu547yqAe7Pzw0Dp74SnwCS+bDlp2TWpBRFYDao8AXXxxCUO7TsDyU/meoOpQ5ym8fqRRYn0nKVTnd0I4pSuYM+nCn+GGMQJlMv92mSbqIrPOYjoJmYnkkguFPj/2DycR5ocCwhyysOr4CjCl2IDSV/+8r+qtd87x1Wtn6sbzlH9008/jY3PUwjLD9nyH81O5cU3x2rynbaoso5H8oqV2SdUB3807Tjl/TYP8mYnyS6mlHuqQMGmhExhUgRwGgQtPdCLjyiGoVxI8kx1pU2k4Jq8n6PAici7qUGruhhi2fnIHDxVNCU9nzE3ikXFemGB1aZD7KICZjPZlDhpBUChvqQq0YvBDXZnAU2ziU+Vnc1+luEl3iZYqgonSEbOCN9wmDHiMVqhumqQ4VYBQ+jD6xinyc68hD+lS52Gzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261022113327099003)(261021123027099003)(261021121427099003)(4143699003)(11063799006)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzR5MlZMZ0V4eUd0ekxsdWs5SDMzMUpmNDQzdzRseXlmSEVkOC83cnlHMWpM?=
 =?utf-8?B?cDhvT2xXdDhQTDF0azk1REdiWm9pekp6R1JtVU43YjhHWjlTb1kvYmszZHF0?=
 =?utf-8?B?ekgremx6YUpkVHg2UzMyWmdtZmV0bnp1MmUyUVk4VCsxTWdkdC9GakhhSk9V?=
 =?utf-8?B?dTczY2s4SGlNQ1F5VU8vOTc3ZlVJUUVPWXh0ZGg5Vk1BVnlYS2l2OEo0ZUNo?=
 =?utf-8?B?K1VkNGt4dGhwQVAveldob09iVUM4L3pScXIyeWhXR1kza3hBcDgvWm9DeFR5?=
 =?utf-8?B?UmFKWFdXZ0ZENGVYczJsMWd6RHByTGN3dS92NTFaa1B4WW9aV3ZGNWE2ajI3?=
 =?utf-8?B?Vy9XeEw2UHZPUFFVSjFKOG5EMmgwY0ZOM1lwZ3Z4TSthNHdaQ1JzR1hoQ0s5?=
 =?utf-8?B?M1ArSndmMEIwYTBKb1ZZL1kxbzM3bllWVU5MKzBFSlF5TG5EVTN0SHFUM0ww?=
 =?utf-8?B?REtUTlZRbHZHNDE5dTA3RUQyYzZHY1BMRFF5aGRGY3l2Q3JiV2wraU1JTGRJ?=
 =?utf-8?B?TXhPZDJPbm5MejFVNmhpcTNPbjVDQVQvaW13VUkwOW9jV211VWt2Z25Yajlt?=
 =?utf-8?B?Rk1qcHAxa3NDb1cxbzBncDB2UFQwTWo2QS9KZ2VMRm9SOUg2dmVabEVZRnYy?=
 =?utf-8?B?akdrNE56cWtnNmRuZ2xhTnVvbzY1S2N2eVVnY0hMSm00cVd5RWNVWVluWTV0?=
 =?utf-8?B?QVNQU2ZRRy9hekNRdTl2Y3ZVMzUza0JSSCtORHRJZ2FiZ1l5VUJJSUpHVXVk?=
 =?utf-8?B?TG9HK09HRm9nV1QvWUU5cmJJSDBMbG5ydkpVcG01VVJ0bVZjcXVtQlFzNWl6?=
 =?utf-8?B?M2NvL2JSbzFXR3JhWDlMZlloZmNyb0lSZDBheXI0K3NlYVJaL1lqVXhobFM1?=
 =?utf-8?B?MVk1Z0hNZGxOb2tRbytKS2NWd1VjeEhlZWtPdUZ3cGFTc2RVYU9jT2tsYUdS?=
 =?utf-8?B?V3hKUTEyT0RzTmcwZjh6YW5rOFdGcFB1N2hmclVyS3FQR0VNU1dSOTdtNGlj?=
 =?utf-8?B?VVJBL3pybm5GWi8xeHR1azhzdkhaY2E4V0xHQ0NHb3IxQzFLR05jWXhGeHBx?=
 =?utf-8?B?UUFyTERBaWo3UmEzWWFxODYzUklkSVhLK3czbTZJUnRlSUVBVjZERVYvSTUw?=
 =?utf-8?B?RC9lUGxzTG5CTEorN0VoRFNodllSTGRUdTljaml6SHNrWXU0MjNjS3EzWitY?=
 =?utf-8?B?ZVZiUnFJVUZJNk02VGJPc0x2V0NmYXpZN3ovMmpsWGlmSGFwWHFiTXd6MHVv?=
 =?utf-8?B?Z1RWNGRSdkpyQTQxdkRydkphZEp3cVhSWERJZkRUbXpwV3dQMGdnajRTQXpZ?=
 =?utf-8?B?OVVoNnNVdXJqZEE2dlljR3dqUWVFL2JldHpkTFBvUlVqNVQ5K2xERk9FblRt?=
 =?utf-8?B?LytUc1hwS0VkeTErS2VSanYyRnJSMUE5UVYzdVAybWNQNC9TOS9wWHYwSUxP?=
 =?utf-8?B?a2FCclJ1QVk3Zlg3cktQV1hRWlRjOVR5b0NEQnF3YmhFQmIrUlhJUE80dTh3?=
 =?utf-8?B?RjhPOVlRSWFOeHQ2TldBK0JDNkFRWDhNSXNOd25LOTEyZjNvYUx0QlhBVnRR?=
 =?utf-8?B?VDF2cnNnZkozVzZsUnZZYkNtakE0cGZmZFRSL0tjd2YwSitVODZpSjkvb2hm?=
 =?utf-8?B?QmZsWWkrYU1FY0t3TStWMFE1VFQrenNwallwdnFmM0YzK0l5d212bExqN09t?=
 =?utf-8?B?UkN0VmZnVm4vbnl2YUFJRnMwN0tVMmlXYXA2RWhLRDZjWldWMU1US2VnSDM2?=
 =?utf-8?B?RVlIdGg1bkk0dkRRMHcyd1RpZlZBdmFUVGtxV3lVRmRNbG5kdkVwd2hRa05x?=
 =?utf-8?B?ZlQzSFA2SjVObG1WcllvaWE1SUFXcWdpS3NHNHhZcnJyNHgwc3htMFZiZk9E?=
 =?utf-8?B?TWRtZ0JRMFJyUVlkR3NzYVNKcDREdHZwOXh3bkNnWWlINXlIZXpDc1BLZW5F?=
 =?utf-8?B?RHpkY3V1UWNkTlVLODBlcUUwMWpvZXJuay9oUmZ0TGhLelIzRVZPZ0NHTTd0?=
 =?utf-8?B?VDMrYUtCUGJOUDA3OW55V2RwS0d4WDJZOVgyZjRCOGdEQnBsRmRKd0dMcWph?=
 =?utf-8?B?WFJ5SDU3aEU5ZmJSK3R0bWVIK1hGenlNeWExSDlmeFpUc0JSdnlWUDgwaXo2?=
 =?utf-8?B?SHk1NGxKMitLaTVEM0JqQnFmN2tUUHk3OGgzZUpvenhMbUNQRTRwN0tVd3ds?=
 =?utf-8?B?bkt3bm5NOGI1NHJmeWIzYm5jbVFteWRuS0VBRGw1a00rNkx2RFJrM2FlWklj?=
 =?utf-8?B?WEV3QnQxRzJQWHduMnZ6aTJ6OGZpTlE3VXBPVTA1UkNDOGNIVURWcXNMTEJJ?=
 =?utf-8?B?S2RYblA0WjYvNkhOSnhtVUxhcXZESmFEdExZZFkwaFcwQTlGS1NRUTdLSUR2?=
 =?utf-8?Q?N/llJ5NZSwf/rd/w=3D?=
X-Exchange-RoutingPolicyChecked: c0Ii6RpV9KTA/tBd90FaSR96iDdepOh22SQomdyxZFcHIKamltRUPSc49dgCQlDRX82tF2hy5PX03mHDjlDyVxEPFsxnqlZ1pYldWd2bdqSxXRcOHJ8kQYXByABZtF8A2HDDI9YfY8pSvd3qn3tPjCvp5cFnC8qBYj8ALtnsfQZkWbbds0h69zqcF2iCdn4mNN8j06ZPRN8o6tKhdfu/duQ6YN4mh2Y2BW+oiyXZwZDf8qjbp8N+9W8pPrjNRAkzOuJH//vezGawW2deb2XlTsGFZkb48EMm4SOzkiKmFnhxDhfP4tgROtr1wH9Bst9QrIQ0lswz/n43+Yw/PHWwvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 184fb604-b306-4c3c-3fc3-08df3907fc8e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:37:37.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dkf2gFAMC29MlB9lhEXmgtpclpOCU017UUfiBaB24lzvsuwRuXs4L/NaAEWEMPFa2EXptbI5zYdLbc5ZLXCf6hhMZ58iAokqxmlcXNDICTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF632600ADB
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



On 11/2/2026 9:25 AM, Badal Nilawar wrote:
> Enable late binding support for CRI.
>
> V2: Add CONFIG_INTEL_MEI_CSC check (Sashiko)
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Usually if a patch has a significant enough change, we mark the existing 
review with a version number to signify that the review was done on that 
rev and that the new changes are not reviewed.

> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 15 ++++++++++++++-
>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index c4f81fb1dff1..d3a5f09dcd58 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -484,6 +484,19 @@ static void xe_late_bind_remove(void *arg)
>   	}
>   }
>   
> +static bool late_bind_mei_enabled(struct xe_device *xe)
> +{
> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB))
> +		return false;
> +
> +	/* MEI exposed as xe auxiliary device */
> +	if (xe->info.has_heci_gscfi || xe->info.has_heci_cscfi)
I think that here we should check for just xe->info.has_heci_cscfi, 
since CSC is what LB goes through. It doesn't make much of a functional 
difference since we don't have a LB platform with has_heci_gscfi being 
true, but IMO it's still worth fixing for correctness.
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		return IS_ENABLED(CONFIG_INTEL_MEI_GSC);
> +
> +	/* Standalone MEI PCI function */
> +	return IS_ENABLED(CONFIG_INTEL_MEI_CSC);
> +}
> +
>   /**
>    * xe_late_bind_init() - add xe mei late binding component
>    * @late_bind: pointer to late bind structure.
> @@ -498,7 +511,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   	if (!xe->info.late_bind_mask)
>   		return 0;
>   
> -	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> +	if (!late_bind_mei_enabled(xe)) {
>   		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
>   		return 0;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3e6f8f936235..ba23ec60477b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc = {
>   	.has_sriov = true,
>   	.has_sysctrl = true,
>   	.has_temp_sentinel = true,
> +	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
> +			  BIT(XE_LB_FW_OCODE),
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.require_force_probe = true,

