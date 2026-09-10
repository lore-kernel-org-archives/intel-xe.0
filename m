Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A8C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 13:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17E910F1D8;
	Thu, 10 Sep 2026 13:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzWHPIn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8236410F1D8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789047422; x=1820583422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MyjNMdkihtFHYNQ2jHOJSAOhqTt8YiKFI7hs92+Ygn4=;
 b=fzWHPIn8Z6rI/LPVDv6vJn6xCNCj9rB8eTGJCAUVABD+kwPpJR3/fHeM
 Jfg0BcjE6oI6mIfvoG9HQJIjO1xJJFOwK+SYv4V17l0w/nHJLCknLQyLo
 Shxmf+a2DkyxJj4besxiUWo5uTLo1SqzhfSE+1a6r//9Vs8WyZtqmGFCR
 qpZznUZYe2cdJ7EpUOU6M5fYuEbS8J4sC/MdLvRCT9oMxFdozNfqOJF80
 JW4wjGQKIcE2/DqGiBFF4K4n3hb9C3oSEBVMyE2Yd0ff93rDI9UDyX+Yd
 w6um3kDqrfkRMyAhB6+lnu8Q8YKUJFwvVTdXCGLzs/jiwn0pHbR94qxj8 w==;
X-CSE-ConnectionGUID: l83rOLtcTSq4hdNWHX0Ybg==
X-CSE-MsgGUID: FfEKuwxMRquK4mgqSFphTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99828432"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99828432"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:37:02 -0700
X-CSE-ConnectionGUID: iwTF/2qnSleq7ciGAB7zAQ==
X-CSE-MsgGUID: xVMBh5KKQaKaZNS+o45aHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309899562"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:37:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:37:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 06:37:01 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FffHzKz2nK6RwgcF4gme8RwzgUPqqznaqWkKk7jeXIdYd07TDIc9MqR7oZL3ANK03b7AIThElnKZTzpBYHgd6YIoegq+bMZLGVZd2YRMgwiSsJMu0Zk5L1kRvmBY8jhwOkehE13dMw7FWC0A8iRDRSracH+mdNciH5feDgjQ5fpnN/7xbLBq3DgYNJ8d65ruHyFW1iRoUwqr5Uj7nBG+Ivptjy0NSnips80z1VOxtUhHxQiC2rkZg92icA9NWBKBNyvxNiKbKh5pUPtOyPJG4t4dghFZyLsc2wW+xHYxWNyy1faAS2z3JFGW0QE/8ce824XkHfdJplaTU6tKc/K9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYOVYm1BY0qnDoxZXdWZQSSscVAXVN1gnzH5qiUeKxM=;
 b=jsVOREW2oqFFj9Rh3HkaIEu99QALhwmbgAZZg5oE/P1+y6CsnmqhrVOTLhuNpIsP3LeDhMb8w+trrhy//6ns+3axINUA4iS5jXQISFKlHsP7D8olYTtXcUu8zW0B624tfddw8HQm1r7ni5eQXaps12QBtCXjnX3GA3VnIAZ/0oQ2uITEUQjkbBtGvsq++f3Gvk7ozG0t8RQ2Jky7TQyLqnMJluJODAVX71ugP3oUW2CQZw09No+EUTejDo8NHcFeXAv3IY3ZAJjqBjh4LJe5v9hgKIJQVCzr0KOcVnHc3de/nHLbGL07eDXp+VEDpCiYoAcjB3uG8r5pwHWhQlgvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:36:57 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 13:36:57 +0000
Message-ID: <8c69026a-e51b-4540-bc08-f49e1c794049@intel.com>
Date: Thu, 10 Sep 2026 19:06:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/cper: Add Intel specific CPER structures
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-17-badal.nilawar@intel.com>
 <ap_g3dosjbQO5z3R@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ap_g3dosjbQO5z3R@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 65508603-7531-49a0-7e70-08df0f4095b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 1G3P4Mp1oNe4rjLklLUctRdrysE4396OFt9kIVGbQSqbJ8gcA34ySrggZLwaAAsY69sOdtPVGsPSI8dK/jpKtvyDqFc+o6Gewa58EbzaHclJ7QSu8TXginGALDILpUnUU1uazWV2B3HOLZwNF9WseFT/SrySvbmvRH/E6yIKS8GbFsudm3C3CM9MR4+JHd1e6cFA//DzvFgAMq27oBeYsVNE5va3vEP9dUeHCZkMkzvS6VVXNKH/dnW9OmK5pPX+47w3E+OWM2OlTfV/8pkVXHTG1REkXpldFtWpvg16snPUZVOpzvBmXsueUM3VdZgwaeL9rocpjV4fj26PYINzsh6mMaUBZtB/atTX3/DfN7ivxwLTci+vX5fIxWM4/2FVj8YN0KIDLxtzjCHMzr7lplpUGIjbhuv8SPl98ayBrtQ4oy8fRVWQFWN9+3pFPmtHJRwq0o0zH/sMZKdk6mDB1cTRW2pOI4KbCAhB1WLYVHaayvGhjRLwnLONZBDgAsCN3lIqbeKKhell2qCKRxSvkqrXHvaR4qENQeIkXGWDNSuMwzbqOBR0wYnBIcrMzgRvb3cSyQqwJNZpPzzjJyX7yvJDhr4yrZSI7ZyVTlp8KbQj0Z7KwMK4usQ8aD25mmpans1tuVJun+z+cLH0Q/hWTh+r4lqzdkDJZdponzDuRSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVJeXUrYzFadHdxQ2lCZlNCcUUvd0I4eW9FbEtMTnUyZ0FTM1lIa1lFQS9x?=
 =?utf-8?B?cVJDMW9qMU1pVkJXOVdFWlNDaktuL29IOU8vTk9Fc0NEdXFOMEpRTHJJTmI0?=
 =?utf-8?B?aGkvRHFrY3YzMUdLbTNWSUhUcWlDNmNhc3hQRDZUR3l1V0kxVGx3d1UyN1hZ?=
 =?utf-8?B?R3RJaUs4cmFhUGN4WVcvTER1RTBBclpGdWZQbVYrcmJEeU5zWEdnU29USG16?=
 =?utf-8?B?c25JaUd6dmFaTzdtT2REdEhIR2xibm9MQU5yOGNNZjFGUWNEdnF5b2tQT0lZ?=
 =?utf-8?B?TGxkNGlGNDJaa1BuNzBncUt1cWJHR252UnNtSHp2cTdmdE5WQ0RpSUJURFI3?=
 =?utf-8?B?VXg2TlZmQUl5TG1FVzlXc1BULzR5Q1FhVFBrS1FkSVJDbVVMdDRtZ1J3dWkz?=
 =?utf-8?B?OW9tWU5ka3lHU3ZqUkc3UmlHUFhYZFFHM240UzB6SmdyVUxGQ3JRTWdKVkNE?=
 =?utf-8?B?ODNNVEl5eFhCWThvdEdWOXVuMlNGL0pTTjBUVkJ4YmgyNFJMNS9NVUVrT3g4?=
 =?utf-8?B?cTY3N01ObDRwRkJyRy9iSEcvUjQyY09oa2JCdU1zeG9oZTdHdjZobVZwNzEy?=
 =?utf-8?B?WFdhQkxEdERNUE4xRHZYZFNuUkVMaXJ2Mm5NdXRzVjFhQ0lHbEY1WnNqMmxN?=
 =?utf-8?B?UXZsMkw0NnI2RjN6Tms3SmxLRjVnbDRKWTlBMytRNEFCSmRuazhaendqWVRU?=
 =?utf-8?B?SllodEF6ZTBaK1ZISnpGTXRvSEhIOGN1OTd1MzJ1MjlBeU5xeHlVSzJFQmM0?=
 =?utf-8?B?UncvNUM4SFJJVzc3RzQ2aDUxTGlwTnY1c1lOYmg2S0R6QjF2M3lsajN5ckZS?=
 =?utf-8?B?ODF2dlM2cTZPWTRSM25JUHpKeXR5VGs4ZFFHZHJmc0g5TVFYcWMxbmN3NGFT?=
 =?utf-8?B?TlEzUUNKS1I5VEVLNG12cEFVUndvZGNUN0JzYTMxK2ErcnF5SVl5bmQvRUJn?=
 =?utf-8?B?cWNDMkRYK3JFa0dQZzlNNlhqbWM2SSs4ZEF6MGVWV2lhRklGVXFSOE80TlpC?=
 =?utf-8?B?WmxZelZwU3VrdVE3bThIakhNTXZreUxaS3QweTNCenFTUDRwRzBYSUNRaUdu?=
 =?utf-8?B?QlVwTU12N2JCNWhhZENwNWFJUDRKQ0VUWmV2UjhPWEVrRkk2ZStIZ09aSjhk?=
 =?utf-8?B?QnNMNnlIZnpnUCtKb1RCY3NydlE5RVErZzBJYms2Z1lOOU9jYlA0cGtDa1Ja?=
 =?utf-8?B?RHovQXE5R1VYbE9JM0IrdFN4TW95cGRKaUpYdEFBQU80S2IxK0RoU0xoenBl?=
 =?utf-8?B?RUlOQUlTa0JoTHk4YmxwRVJOYnlJUld2UEV5dmd3Wjk1Mk9pS3F0YTFTVlh3?=
 =?utf-8?B?SzVLRDRyZDNFdm41UENEYy9CU25valhHYnBoQzNJWG1Bei9XZGhMM2kxcEQ5?=
 =?utf-8?B?b1grencremVwZFd1enBGOVV1SDltQTFjV1d2Z1haSGRCa3dxb2grZXRWdzVT?=
 =?utf-8?B?dUh6MmJsRi93eGpURDJKN1JYUHMrRWNLREx2WTVMTFFyYjErTU05R1RGanZq?=
 =?utf-8?B?RkNNTVhEYXRwOTd4MWVOMDFub1pWZ080UGM0ZlhtaEo3aHVhVWpiMmUwQ0I0?=
 =?utf-8?B?dEViMHEvZGExT0F5OW1hRjUzVWVMYW5qS0R3S2p4ZjYwTGZXeXkzSXgxTGJp?=
 =?utf-8?B?TUFBMFJsUkd0V295OUs2QlBuRXhGWThWUUx4blZGNEFDd3B6NjB0WVMvQ1BE?=
 =?utf-8?B?QnhuTFhiY2tBVVFQdDcyUUR5Y3NQa0lObWgySGVDckswR3ZKSXNWNStUdVI2?=
 =?utf-8?B?Q2NrUmlPV2lHaCtUVmdWblZxb3k5MjZYZHBLNzJLalE2UElDVktOdUpaTmdD?=
 =?utf-8?B?UGFqYURTdDlQWkJqcEtBbUhFNVBVeFo4TlA1Q05MeklleHhvTjI3UkIyNG10?=
 =?utf-8?B?UTdsNks2QjQxSFNwY0g2REdnblFJL0xlUHk3b0NkbnJRRG9CcXJBRTFQKzkv?=
 =?utf-8?B?UGZ5cXdyb0tQRnBKMjhpeVRsdDFITjlibkN1ZE96K2h2aDdIck9WTkJBeGtS?=
 =?utf-8?B?a1pJaWFDMTdHTTdZTThoMHdFb1MvZGRsVUt0dENYUUJxMmdWdlNFczN6anJv?=
 =?utf-8?B?R0xaS3FsL1d0UDcySWo3a0lFODZ1RXcwZzdscm9hb2ZpSXpnRUdXNjZ6NGtP?=
 =?utf-8?B?MVJnSTkxRklOSXMzeS80OHVaSFE5anY1Ukg4RHl0YUNmZHJyU0RhUFVOZ1Fa?=
 =?utf-8?B?RlMyWWg1QVVBSjIxRWE1L2pxenUzYnlFWndFVmxHRGJhNkxsY0hWa2tMYVV5?=
 =?utf-8?B?QjZKeHBiNFh6UFhrNWxHQkpLdXJtSFZ1RnhUZEdHT1AvRy9xRlNUeGV6WWE4?=
 =?utf-8?B?QVZaSGRnVkEycFhncGlQN1ZpOEUydnVzcE01Ylg5TkZqS2dhaGhTZz09?=
X-Exchange-RoutingPolicyChecked: LzJYA+d1F9z/HGTbkbssGChxejqGZKoZOn2bQlwaaFyO5qmVswUC8Y9q9EqC36Ei476zufpAuMxP3rLdhJMDPT3cQaEFYtnFdlTNPNGKI1GDHJ3sc1ESyNGexEvN6EPlNA3PMW5+PXEAD/15kERtaRMnolkuiTHBECTOmGMz8egztBJJo/HChBfGhQGwx/5a5T0kMcdyb+ki7/aryEBu5HcOvRvCHLGjOlWUb0hMkP9M2YaStW2+5SYMd5gE1JijDyRfLERVWRhYEtacUcxzMh3Q0AKT+AfIbL0lvAX7ezL0wGKPzi7y9VCzKMhiD1qGQpzNFbTWRmoJ3QRvRTRhwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65508603-7531-49a0-7e70-08df0f4095b5
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:36:57.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB+1RjOv7SOSmtMfRubUOuJKEZqBP3yiN5JlaGu6cwTj5rj0rW+oaar3RgUuBI9g8dWYzwChxnsgmVIxk5tKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
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


On 08-09-2026 15:48, Raag Jadav wrote:
> On Sun, Sep 06, 2026 at 10:56:08PM +0530, Badal Nilawar wrote:
>> Define Intel-specific data structures and GUIDs needed to build
>> Intel GPU CPER recoreds
> No standalone structs please! These need to be introduced in the patch
> that use them.

Ok, intent was to keep all the Intel-specific CPER structures in a 
single patch for easier review.

Thanks,
Badal

>
> Raag
>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2: Fixed sashiko warning about bit fields usage
>> ---
>>   drivers/gpu/drm/xe/xe_cper_types.h | 179 +++++++++++++++++++++++++++++
>>   1 file changed, 179 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> new file mode 100644
>> index 000000000000..b81b70501e0e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -0,0 +1,179 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_CPER_TYPES_H_
>> +#define _XE_CPER_TYPES_H_
>> +
>> +#include <linux/cper.h>
>> +#include <linux/types.h>
>> +#include <linux/uuid.h>
>> +
>> +/*
>> + * Validation bits definition for validation_bits in struct
>> + * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
>> + * contains valid data
>> + */
>> +#define XE_CPER_VALID_LOCATION		0x0001
>> +#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
>> +#define XE_CPER_VALID_SIG_ID		0x0004
>> +#define XE_CPER_VALID_PCI_BDF		0x0008
>> +#define XE_CPER_VALID_DRV_VERSION	0x0010
>> +#define XE_CPER_VALID_FW_ID		0x0020
>> +
>> +/*
>> + * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
>> + *
>> + * All values below are generated deterministically by uuid generator.
>> + * Do not hand-edit the byte values.
>> + */
>> +
>> +/* Creator IDs */
>> +#define INTEL_CPER_CREATOR_XEKMD \
>> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
>> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
>> +
>> +#define INTEL_CPER_CREATOR_AMC \
>> +	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
>> +		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
>> +
>> +/* Notification Types */
>> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
>> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>> +
>> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
>> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
>> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
>> +
>> +/* Section Types */
>> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
>> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>> +
>> +#pragma pack(push, 1)
>> +
>> +/**
>> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
>> + *
>> + * Fixed-size header for the Intel GPU error section of a CPER record.
>> + * All multi-byte fields are little-endian; the structure is packed.
>> + */
>> +struct xe_cper_sec_intel_err_hdr {
>> +	/** @error_class: Error classification (type, component, location, cause) */
>> +	union {
>> +		struct {
>> +			/** @error_class.error_type: RAS error severity */
>> +			u8  error_type;
>> +			/** @error_class.error_component: IP block that raised the error */
>> +			u8  error_component;
>> +			/** @error_class.tile: Tile number */
>> +			u8  tile;
>> +			/** @error_class.instance: Instance within the tile */
>> +			u32 instance;
>> +			/** @error_class.cause: Error cause code */
>> +			u32 cause;
>> +			/** @error_class.reserved: Reserved, must be zero */
>> +			u8  reserved;
>> +		} error_class;
>> +		/** @class: Raw byte view of the error class */
>> +		u8 class[12];
>> +	};
>> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
>> +	u64 first_timestamp;
>> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
>> +	u32 sig_id;
>> +	/** @error_count: Number of times this error has been observed */
>> +	u32 error_count;
>> +	/** @validation_bits: Raw u16 view of all valid bits */
>> +	u16 validation_bits;
>> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
>> +	char pci_bdf[16];
>> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
>> +	char drv_version[25];
>> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
>> +	char fw_id[256];
>> +	/** @reserved: Reserved for future use, must be zero */
>> +	u8 reserved[5];
>> +};
>> +
>> +/**
>> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
>> + *
>> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
>> + * is available. The @event_queue flexible array holds @event_queue_count
>> + * packed &xe_intel_priv_event_entry records.
>> + */
>> +struct xe_cper_sec_intel_error_info {
>> +	/** @error_class: Error classification (mirrors the header error_class) */
>> +	union {
>> +		struct {
>> +			u8  error_type;
>> +			u8  error_component;
>> +			u8  tile;
>> +			u32 instance;
>> +			u32 cause;
>> +			u8  reserved;
>> +		} error_class;
>> +		/** @class: Raw byte view of the error class */
>> +		u8 class[12];
>> +	};
>> +	/** @error_count: Total number of errors recorded */
>> +	u32 error_count;
>> +	/** @event_queue_length: Total byte size of the @event_queue array */
>> +	u32 event_queue_length;
>> +	/** @event_queue_count: Number of entries in @event_queue */
>> +	u32 event_queue_count;
>> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
>> +	u8 event_queue[];
>> +};
>> +
>> +/**
>> + * struct xe_intel_priv_event_entry - Single error event in the event queue
>> + *
>> + * Each entry is variable-length; @entry_length gives the byte size of
>> + * @metadata only (not including @entry_length or @timestamp).
>> + */
>> +struct xe_intel_priv_event_entry {
>> +	/** @entry_length: Byte length of the @metadata payload */
>> +	u32 entry_length;
>> +	/** @timestamp: Hardware timestamp of this event */
>> +	u64 timestamp;
>> +	/** @metadata: Event-specific payload bytes */
>> +	u8  metadata[];
>> +};
>> +
>> +/**
>> + * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
>> + *
>> + * Contains the standard CPER record header, section descriptor, and the
>> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
>> + * (with its flexible @event_queue array) is appended dynamically.
>> + */
>> +struct xe_cper_nonstd_record {
>> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
>> +	struct cper_record_header record_hdr;
>> +	/** @section_desc: CPER section descriptor */
>> +	struct cper_section_descriptor section_desc;
>> +	/** @intel_hdr: Intel-specific error section header */
>> +	struct xe_cper_sec_intel_err_hdr intel_hdr;
>> +};
>> +
>> +#pragma pack(pop)
>> +
>> +/**
>> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
>> + *
>> + * Used to resolve the platform_id field in a CPER section descriptor.
>> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
>> + * with name string "platform/8086:<dev_id_hex_lower>".
>> + */
>> +struct xe_platform_id_entry {
>> +	/** @device_id: PCI device ID */
>> +	u16       device_id;
>> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
>> +	guid_t    platform_id;
>> +};
>> +
>> +#endif
>> -- 
>> 2.54.0
>>
