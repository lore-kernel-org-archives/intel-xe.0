Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F4CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E110FD1E;
	Fri, 29 May 2026 11:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AulypjHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C74D10FD1E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052607; x=1811588607;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=TS4pdeeCd+9g1AV6ZxMczaRnN+95UPr5k94DpKfNk+w=;
 b=AulypjHe8PnE+HrT8M/+eRfhb6FP+pjnLczgYxrLGsMQ5nlvjSklIxkn
 VQVDfLY7bWYA3yDwmdk9jKn2Llhd5ovZ7XbkqKID2McJVV4KWOau+k0XM
 0zpIVyWHcDwsacjHsW8GTcFA74uCLa07VpdtRtbcyEhJB9gejBXfzdLb6
 DJFv86MNvNxAyKhTCJOFg8eQU+KMlb0G+USq0vjm4+tjSg9I3ROnoDS1H
 RPKyKvWH0I0bAxqKJO13B2xhTp+KM0bGanHUYce6RYA0L6hzKQq3g4g0m
 0Jn5OTgVD3XgbkSqSdRmdFoVKHERlsihdbM84JT+sAgWhb6dCa78EueDM Q==;
X-CSE-ConnectionGUID: c2INxS/+QIOE8y8kHB3+6w==
X-CSE-MsgGUID: tbGDNUCXSa2xPh1vmYebcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="81086899"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208,217";a="81086899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:03:27 -0700
X-CSE-ConnectionGUID: mENhcw3jTUyEFWeEGxcAtw==
X-CSE-MsgGUID: qgdtMd3CR5CAoln07u18BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
 d="scan'208,217";a="242922831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:03:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 04:03:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 04:03:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 04:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2SzlbqeQ/sy4D/SKouvQlsslVn+ALK7Iw6Uy9ZdL4dPpLglYo6KcUIMgnjdFymeUQdxRIL0V5Uy5GPXNYAiVn/LV6Frt3vO3jXoLAUhwKTVKS6Jb089Z+NhueYCw1s4MbARyfOb78Hp95rclAvtvljuX5fS51wP5Iy+Rj+Nk1HdOtfRoiwt5QeXWRsQQQ9JHIIewkGVUza3N3yoP2LDkRAUd+SWSBE1OUH4ZKRYGfdocsrLn78H4XZqiokD6PUIQgESgzvWCrLz65cA59frLDOTwsEfT0879WjxjpSCdlFvH6kFkYAULh3LfAYKQAjqyda81wQaq1WxjT8Aau8nCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdZP78lZlV9KajKoEHpxIHq/YHAw6AdBM/nqI9tFOlQ=;
 b=cY54RbqsKgC1fvyjQ+epS8P5lK3sMBo+GDvBIciYWEd1BvwAZ1GdXKqbO5JJwI5ZM/MmHakAi/CSyYwxmnXFto7OLrnJj0PwrEFXxXtVy05Od90ZMnEVgbkxTGKuTlIZ4JPHB1hlYXCWlx7m3KaZp55k/tCOb70qeknIGsXAMCeboJf9DHa4PJMdXqWUIcBSuT15jAnQlJc11T9hincwU8Ssn3kTTCLERqXiF01XsuOPGdnDPPwsyJLoiRyJtHsUgvE8xkiQ6AjLmsfiE0FqNQbqlp0RrdnYaswftqOsLgbxcWJaYTmY17ZuA+A/UqxkHprnicUNqLxveKwQLs64jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV0PR11MB9789.namprd11.prod.outlook.com (2603:10b6:408:385::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 11:03:09 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 11:03:09 +0000
Content-Type: multipart/alternative;
 boundary="------------iOKtBLvjJOIV0t9jD4eJQND1"
Message-ID: <b8b8f05e-4bfb-403f-832d-af8baba22fe3@intel.com>
Date: Fri, 29 May 2026 16:32:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/15] drm/xe/xe_drm_client: Skip run_ticks fdinfo
 during device reset
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-23-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260525100619.3155663-23-riana.tauro@intel.com>
X-ClientProxiedBy: MA1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::29) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV0PR11MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: aae62d1a-823c-4c49-3333-08debd71de10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: kvqNBCJRgggBLdD8n9dnpElrOoBk3K6U0yO2PShGyASjiF7gC0FOn2v1YImmgSlzUYPXe23oBOz4Dbs69IB1MOmrc6CwW9ixHwLHh+BJH0q1KnQweerufMcpEnpLEE/Zsjn3IG+KDp1SMFQVv0WoWoSVLIsXis5uoB+gLmIpX7siZlaA1zPsNJI1A0TBoktO0v7SGt20KdoO+Pif7STg5MKMpNLk2wq5gPYD6XNaqGkw//WLO+jR2fBt2rpe10L3AjekVHAQD6JMFOyU8IZTXK5J9uULJA0KNj+dxwkKmc3WFxj6/GoDp+0vRH8HXOP1SsQXaR2VVePiUua9xWlKRQ01L/rsl/D9LjpOkfewXytKFfqZxnfSCt452p4zzgaD/cnwSWH/ulGyYy+2YcFLu+vz5Fi/jPdAMfe1ntCbfLU9r2KYG5SWRPTSY/aM6olNlxK9UvGCMM0P/rJkl/VdCCPhGXyUavbk+n9DKevwofQm+LgpwapCaM+dUYluylgjQ4sCqTkbqGoIk055RCM9BlJ+bG5yNm87Kdbr8+EHZgiTob9HSEAPOE7Fz7wh+ynkZgPV23IcsyN+OcuqtiB5osBRRmxOIt/ZpHdS9HhVxeO5QHSn1+SFRjK84pixWVtgm3rEEZHjyf5Xmaoj3nwrGGW5pXYdHRn48CARTsq1td/qcnPKj2jq030i79OptepxSZmu9uW47/yaTYbwums3iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpXZFJHZE5DZkFjZDhNbklXT0hBc0tJNktBNUxoaEw5K0FGYjF6NXdjV3ZK?=
 =?utf-8?B?bWZySXpXR1VaSndpT2lkTUZKZXNsOWh0QldMWWsvMkdHVmtVZlJJY3VNUkpx?=
 =?utf-8?B?YlFiazY3RUdoQmdJVElSMUxScmVKRFhLSDdUQWc3blJCR3dXV3FLKzZMYmlK?=
 =?utf-8?B?dFF1Z0s1K0hPSnRZQ1BOcmx3djRPcjYxUkRNcGVjNWY0VSs5RDMyVzB5amlC?=
 =?utf-8?B?SWpMdFpYYzBtcHNZZjlOOElYU3Q0bmsvZkRjczdvbit3RTBlMEdSQTN3L0pv?=
 =?utf-8?B?aHVQME1OMW9uTXZmSGhYZzNSTEVxeGpHMGpKQ3dhK3Z0S2t2R3RxdkphQUlS?=
 =?utf-8?B?UU1wUkpCMU04TmpsUy9jMEtWeDErd3BLY3JJZlFtZitXTG4weHhhcGdiSDB2?=
 =?utf-8?B?KzYzY2c5RXZMeUFzRnlWZFNRSXBRSGo5RW11ak1DREM3cDdrVU5UZk9oakxm?=
 =?utf-8?B?OHV0QXVPMDJDZDRBQk51QmJkaXRRZ3NrOW9XWXJ4S3JwT1RoMkZyL2psa2ti?=
 =?utf-8?B?MXZ0VVFES3hHR1VGMnhRSHFLL0RFTW90ajJYU2h0czFPejNkb1BRNnZUWTlx?=
 =?utf-8?B?WEMwREgvUjJxUERyS2lBenNtYVRFVUtNbU5oT1U5Y0Zrd3VxK2t5RzFNdGUy?=
 =?utf-8?B?VzNIWGg3bWxZM091SGJJMkVBTmoxSmlQaTVkaUNROE0zSUZUWjRUSkE4SGlx?=
 =?utf-8?B?ZW11WDlFN3VQMTQyVUd6cTFzcldTMnJVK0c2WlFKWnlwVHJOaGRFUVBDMXFG?=
 =?utf-8?B?bitkZUFudUQ2ZlNRMmQ4VGJlbnc1bzNBOHZqdnhQSGNpSFJpQ1dqMUxacVpZ?=
 =?utf-8?B?MHlTNzNXNlluYklOb08wMzVhLzZrb0dTWlJqUERmY0JLdE1MNTBERGNsSFRo?=
 =?utf-8?B?a2JEajZRMThwT2NwLzkrc0JGdHU5aC91ejVicFR4MmtoZ3Jsb1JjanN4T01X?=
 =?utf-8?B?T3J5anpFcXdHY1ZaWE9wWmdXbzJOTVUxbmVUWWhlMmRtMkZGR2V0OFk1RzJG?=
 =?utf-8?B?Sm12a3EyNU81VHA2Tm5VQWtYcGV1Wml2MW5BYkNPTFliMUtKbFAyMG5iWFZm?=
 =?utf-8?B?K3VOc29DajhtNHQ4OWNvcGxoMm4yY0d0RGVoQUFjT1ptUm5lZnlGcFRvUG9p?=
 =?utf-8?B?K21uR21EOWVveGp3RW1jVEJvaWhmV1V2LyswYWFVNzRSdzk5YUtiZ2RyS3FQ?=
 =?utf-8?B?bjdURjdzdVAxbFZFVGY1K2hvaFM5dDZta3VKaklqd0FZOUZmekpuU0xFdUZx?=
 =?utf-8?B?K01ZTWhNb0U3YVpIYm92WDUzTzViMW5UOVFkaHU1Qzl3WFEzSWVTUGFia3gw?=
 =?utf-8?B?VmcwSUFDN2I2SkRFZXhYLytUWDY2b1ppQWk2SzV3RWdNc29hc2IxMzNDdjFB?=
 =?utf-8?B?c1NrTm1raHdWWUxUOHVUdzdZTDF1clpHMWhOeGN6VUZNK0pidlJxeXlSVHQ4?=
 =?utf-8?B?enIrWWlFVjlRMTBiMEdldExhMVZYd2RJVU54ZjQ4OFZMckVpdFB5VUg5L0Nm?=
 =?utf-8?B?TjZLekd5dmhrSHVkd2QzYmVZcHpyaU10UWJyZnJOVkxlU2N0Wi8xOUp0TXNk?=
 =?utf-8?B?OHl2bm1yS3J3akJQMlkxMElGaWM1ei91OVZWZlBXT3RPTytnZTk2a2hkK1BQ?=
 =?utf-8?B?aDVidDJmcjlTZWtSek9IaSttZGlJcTlubUZGOVIzSlJwd0tiMFl1ZEx2bS8r?=
 =?utf-8?B?ZVdMUVIzVS9qZlZXdHFVcmQwVGU0LytOWUJsWHpzcFFaVGpLenRLb2VPTDgy?=
 =?utf-8?B?RXdreE40VkllYUxZaERIQWdONDFlbEpxV2dYZlpwUWo3YWdkMlFlRjF3clV0?=
 =?utf-8?B?akgvd0VvVkZjS0ZQdDRxMEs1UG9Ka29TdWpYVUNZamYwVGN3ZDVPdE1POUxv?=
 =?utf-8?B?aFhlYWxpUXp0ZmlYWHU3aUVzeG5WazlrZGExZ1J0SWZSNE5rZDVlaEV0aXVI?=
 =?utf-8?B?YVBWQTZNOVRtYXlqSnRJMDRmbnpXdWt6RUIwYU1SSGcvWjBEaHVMV2tiS1FK?=
 =?utf-8?B?QmJIVjFlVlV6RGx6R1lNMzNFdnhwbWsxQ2x5R0RFQjVoSGhkM1NBQXJrUzJW?=
 =?utf-8?B?U1VtZml2UWM4bGxEdk9xN2xLKzhFT1AwWXdZVzVKYUxyREM5YkZuUHk1WW9a?=
 =?utf-8?B?MzIwUTByanVITy94bGlzdzhYM0FoTFZGOHdzMkNFTldPRGZzN0l5UWZITVh6?=
 =?utf-8?B?cUdRc042RlN1ZWhiUG1rWlhyKzQ0QWJucXZScDAxaUliRS9FVy96U001aUpF?=
 =?utf-8?B?dlBPWW9wNWthN3k3ZXB1K1RpWkwrMU8rMXRITnl6NlI4OHcwOGt5eVFlZElF?=
 =?utf-8?B?NFBYbmlua2NRbVRFaWx2Z0pnYlVGK0luN3oyamphWnczNG93M0kvMUhwRU9M?=
 =?utf-8?Q?F99ocrj7Okgrp4X0=3D?=
X-Exchange-RoutingPolicyChecked: VDqWA0xMYP0sKYKvv2BdQbKiMyS2pL1QKbn4XTazhBqpv6MKkZ7Um/dGlzO1UO7LWIgBAe9OTn0fcYuzDp4AWBJlvHU+65feFkBusQrSmlUEWzsx2zS84G0PixLp65kWYCBeY9eGmt/cg7RZLE4ECWtpku+wylzZvXM4hKvvPP+i6B4GCv62DnxbSI9cufrdlSownNpxnVXEGruiEpkKKFNMM6LRC3EP7SkTj0rXaG/h4mbn+pS/nnvQ14b+8m5V7RVk8HB+WS9+bo27DZgJ30G1r0CfVWZnRohaCBHeMQBz5LAuOdv14xTQRvHdrP+DW6A5nHNNRac24EecpiODLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: aae62d1a-823c-4c49-3333-08debd71de10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 11:03:09.2099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUwe4fz5t49W7lPCSO6k8eAJgds8ZzPVY3jL9tbaOCB+L/596SRcYU+VxXp5vI6tC8Qh19aZH0g57z/afY73IpMVYvt8vp+YHOWY7rm4HEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9789
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

--------------iOKtBLvjJOIV0t9jD4eJQND1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 25-05-2026 03:36 pm, Riana Tauro wrote:
> When a user process crashes, systemd-coredump reads /proc/<pid>/fdinfo
> for every open file descriptor. If the process has the Xe file
> descriptor open, this triggers the fdinfo callback. fdinfo callback
> reads the timestamp mmio registers by acquiring a forcewake.
>
> When an AER is triggered and SBR is requested, xe device quiesces and
> wedges the device that causes the user application to abort.
> systemd-coredump then tries to acquire forcewake but MMIO is unreliable
> when SBR is in flight causing spurious failures.
>
> [ 1593.570091] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: Force wake domain 1: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
> [ 1593.570218] ------------[ cut here ]------------
> [ 1593.570220] xe 0000:03:00.0: [drm] Tile0: GT0: Forcewake domain 0x2 failed to acknowledge awake request
> [ 1593.570224] WARNING: drivers/gpu/drm/xe/xe_force_wake.c:206 at xe_force_wake_get+0xe6d/0x1f20 [xe], CPU#5: systemd-coredum/9237
> [ 1593.570916] RIP: 0010:xe_force_wake_get+0xe7e/0x1f20 [xe]
> ...
> [ 1593.571082] Call Trace:
> [ 1593.571084]  <TASK>
> [ 1593.571087]  ? __pfx_rpm_resume+0x10/0x10
> [ 1593.571095]  ? mark_held_locks+0x4d/0x90
> [ 1593.571104]  ? __pfx_xe_force_wake_get+0x10/0x10 [xe]
> [ 1593.571220]  ? __pm_runtime_resume+0x85/0x130
> [ 1593.571225]  ? xe_pm_runtime_get+0xfd/0x2e0 [xe]
> [ 1593.571379]  show_run_ticks.isra.0+0x31b/0xa50 [xe]
> [ 1593.571497]  ? __pfx_show_run_ticks.isra.0+0x10/0x10 [xe]
> [ 1593.571619]  xe_drm_client_fdinfo+0xde/0x120 [xe]
>
> Check if device is in reset to skip MMIO access during SBR.
>
> Cc: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 84b66147bf49..266ffb60412c 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -326,8 +326,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   	 * RING_TIMESTAMP registers are inaccessible in VF mode.
>   	 * Without drm-total-cycles-*, other keys provide little value.
>   	 * Show all or none of the optional "run_ticks" keys in this case.
> +	 *
> +	 * Skip also during PCI error handling when a reset is in progress, since MMIO is
> +	 * unreliable. Attempting to read RING_TIMESTAMP registers would return 0xFFFFFFFF,
> +	 * causing spurious errors.
>   	 */

When MMIO is unreliable, try to acquire forcewake, It's forcewake 
register which return 0xFFFFFFFF right?

Thanks,

-/Mallesh

> -	if (IS_SRIOV_VF(xe))
> +	if (IS_SRIOV_VF(xe) || xe_device_is_in_reset(xe))
>   		return;
>   
>   	/*
--------------iOKtBLvjJOIV0t9jD4eJQND1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-05-2026 03:36 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260525100619.3155663-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">When a user process crashes, systemd-coredump reads /proc/&lt;pid&gt;/fdinfo
for every open file descriptor. If the process has the Xe file
descriptor open, this triggers the fdinfo callback. fdinfo callback
reads the timestamp mmio registers by acquiring a forcewake.

When an AER is triggered and SBR is requested, xe device quiesces and
wedges the device that causes the user application to abort.
systemd-coredump then tries to acquire forcewake but MMIO is unreliable
when SBR is in flight causing spurious failures.

[ 1593.570091] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: Force wake domain 1: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
[ 1593.570218] ------------[ cut here ]------------
[ 1593.570220] xe 0000:03:00.0: [drm] Tile0: GT0: Forcewake domain 0x2 failed to acknowledge awake request
[ 1593.570224] WARNING: drivers/gpu/drm/xe/xe_force_wake.c:206 at xe_force_wake_get+0xe6d/0x1f20 [xe], CPU#5: systemd-coredum/9237
[ 1593.570916] RIP: 0010:xe_force_wake_get+0xe7e/0x1f20 [xe]
...
[ 1593.571082] Call Trace:
[ 1593.571084]  &lt;TASK&gt;
[ 1593.571087]  ? __pfx_rpm_resume+0x10/0x10
[ 1593.571095]  ? mark_held_locks+0x4d/0x90
[ 1593.571104]  ? __pfx_xe_force_wake_get+0x10/0x10 [xe]
[ 1593.571220]  ? __pm_runtime_resume+0x85/0x130
[ 1593.571225]  ? xe_pm_runtime_get+0xfd/0x2e0 [xe]
[ 1593.571379]  show_run_ticks.isra.0+0x31b/0xa50 [xe]
[ 1593.571497]  ? __pfx_show_run_ticks.isra.0+0x10/0x10 [xe]
[ 1593.571619]  xe_drm_client_fdinfo+0xde/0x120 [xe]

Check if device is in reset to skip MMIO access during SBR.

Cc: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..266ffb60412c 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -326,8 +326,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
 	 * Without drm-total-cycles-*, other keys provide little value.
 	 * Show all or none of the optional &quot;run_ticks&quot; keys in this case.
+	 *
+	 * Skip also during PCI error handling when a reset is in progress, since MMIO is
+	 * unreliable. Attempting to read RING_TIMESTAMP registers would return 0xFFFFFFFF,
+	 * causing spurious errors.
 	 */</pre>
    </blockquote>
    <p>When MMIO is unreliable, try to acquire forcewake, It's forcewake
      register which return&nbsp;<span style="white-space: pre-wrap">0xFFFFFFFF</span>&nbsp;right?</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260525100619.3155663-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe) || xe_device_is_in_reset(xe))
 		return;
 
 	/*
</pre>
    </blockquote>
  </body>
</html>

--------------iOKtBLvjJOIV0t9jD4eJQND1--
