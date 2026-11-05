Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE3606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FuC/FqE1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65789916;
	Thu,  5 Nov 2026 08:49:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC610E2A2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793868545; x=1825404545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dlcpzqIsksXgxYTjnmyBJOsRa9z3TLs14TV+MCmIWy0=;
 b=FuC/FqE1LTaopwGYtUU00WkTm96jjvHD8n38StHvdng8//o71uEXb2cu
 J9a6qpmcH/ovmLbKdxzYlav7O3MqeWULMDN6bhvlKFaHaPHz6XQp0AyPX
 LIkqvKB4G10yyXNmfWVXc2eznUW8x4iI/H3uNPsNU5L2jYibuPiKftnnu
 /Sg5H/AqZC5cCIsDR3IMf43XZWpgYPKNmXd21VcTsNbRnSVd+PVauFvnW
 alXB5l31sScMueDZrKMxmUIHRON5s0Ucq4GbY/ILUgpBGZKAyS4mX+Yq0
 +KHmFmXfaytH45yrjkM7H2W/5p5yS2gWdhDFfebEHZPCF0ksqfIna20lk w==;
X-CSE-ConnectionGUID: NFUYIYpkQJ+3O3/MdAV0kA==
X-CSE-MsgGUID: +SfkSvwJSAirsK5NzRixFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2677781"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2677781"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:49:04 -0800
X-CSE-ConnectionGUID: CCUSlOvTTsiIo8NTG2iOLg==
X-CSE-MsgGUID: yWIu5zJ5QcaLoP9zvEsTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7290124"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:49:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:49:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 00:49:03 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvv5zjdqC7Mih0QDwhxxEBwcKNqkeP8qQODqzWYgLK3ij0L+7OXncC8xev9/3ppeaPGZmdtmA8Kg9ZMQsnX6QF5oR0m8nHlnC54KUsmt41cKg70PpcwYT32uiSBttVahIE/g+TSvgpZPPHMBPfaPgzF5CorIFttXZQ8Y5EnCqYG8By11dWPtAenXXnnqKXewADuJQfvyewDNz+CJnleCiPCsvTk3Wq0Tz62UTpdP0z5YQmriov7baK8NbhAT4lj5uH5FyI2HAKxHBBE8VWlCypu1BS4VG+utpvnMOgnj3sBjoemFDjpVtUnHCaFNow3xDjOHOM5NCjahWOK5xAmRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7tZAWJuu5AJK6tBDZqEQvZG780EttQrhRSGvBojDZM=;
 b=pUb769oSWtOIxQgkiEhv12lXAKVB4NmpSd0mxeD5f1aesh7MQUOzsiOtgHbYFYYXcGupri0mqy/0oX+o5tukyGnpVoXoydGddMTfgJPEi9b6LxyI4STO40tqUOBiufImIdrd9Ut701gy3HKwvhibQohVNt/tAWoPAqseB6S5I+6NW3xbnaUa/J7a0CalWVxyPndIaIi29uHipQ2ebTAHhBnrs07dUmiYtTqoXIB6YETPse4G99zGw2gD/AKwnejw4V+ZrzsGAD0jusGBViS27OQKadzWLK6KAATC52fhCIg28ioEEq1oWpDovEPWz4UUZtvuPeHLEswOgfMqmdytLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 08:49:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 08:49:00 +0000
Message-ID: <528746a7-917f-4226-8051-0eca152092ce@intel.com>
Date: Thu, 5 Nov 2026 14:18:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/10] drm/xe: Introduce temporary device wedging
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261104074813.1415191-1-raag.jadav@intel.com>
 <20261104074813.1415191-9-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261104074813.1415191-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 899d5d5b-ef0d-43eb-a107-08df3b19a2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|261022105027099003|4143699003|261009221727099003|5023799004|261009223327099003|261022075727099003|261021123027099003|261009223027099003|261009220027099003|261009221227099003|261028144727099003|261026140227099003|261102123227099003|56012099006|261021121427099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: rvml7FO0AEHMjgujwzfFxbjrxGy1MGfU06hgWS40nYDIMuwdaLQWgMhprWcPkEarkmwLBr/FGXl7cwYDi2AH6BIbGlElfqYr0fqJ/gLm8udlRWt4gkw74DP18CWOj6rq2D6eOM8I7hoFdOl/qwisQYjmOTVvyIeKN5oGLzufsbdHeUHotQV73pfUtbnvzMPAKGOPu8fbfwsg3tBVGGHjSbST1gxpZD55Lu+viYxnxBbtIusZZEL24loHozX4iVbHTkvYfv/zoslWhhl/BpCqUDly6tsseNrPvl/gQh6zRWomXCoKyMh9LwgOAvA5fIhz6lnfuki5piJTz0EVqd1nFs0gYMKU1BUaPJ1lk48G7B8PbGp3pPWp4Vk00iBP4Sn1TSkklGOiePl1l0f6FejCitgBVnThBM2TzjrL2BQ6V2BccB7El5uJSUVfCsTDNb4+ZpSLYE/rgU3jjEDd8WqZ198myCmELbGhYnPODUtCtrS38WiV8AHglbOQSFYJxsnH9s/x5V0VvOBUcpIrOZoimVJMW1RLw/XjCdgTGBdnJq/asMuD1bHQoNWiGrhWzWCXLk2ibqnDCg/qFnKEOy28sAxDx7X/1xX6ORitJ+rVxyIlb+sYwr3SOmnwBm2JaJqOpesblf4BXVxYh3oIJnoDWCjy3YdT9vYGKhq0QBy4Kkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(261022105027099003)(4143699003)(261009221727099003)(5023799004)(261009223327099003)(261022075727099003)(261021123027099003)(261009223027099003)(261009220027099003)(261009221227099003)(261028144727099003)(261026140227099003)(261102123227099003)(56012099006)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzNlU1ZTcEx3dlBRVWw3QjkvMnZMTHB6OUMzU2hyS1VuQ1VzSkswUndIVG5k?=
 =?utf-8?B?R3dXUklZcGNHeVNCKzlqakhqS0lybEUrUDZFVVZoUWlZSlR4Qkh0SGE3c3F3?=
 =?utf-8?B?LzlwNkM1alFOcFlxTWFhQXpSN1JINTJwWmRtV3JuR1VRTXZOYnJuMkJUaVdS?=
 =?utf-8?B?ejNWc083eWEyazV0NkFGQ2loM3l6dUliSlNuaGJvSnB4MnI3RGhNOWFZREFG?=
 =?utf-8?B?SWVzSEppVzR2ZXVzT1hVT25mU3RDZTZZUklaRUY2WG1IbFJObjRZYllYTUtY?=
 =?utf-8?B?cUV4RWtyUlkweVk4SVM0Q3duQ3o4ak80UFNJditsWWpVQ2JJaWxMam9BNWNo?=
 =?utf-8?B?L2hBK0dGNkpzT1BMWm91WklHbllYRGsvUWJnQ0VXMmQ3NDcrbmhKajRqb3o5?=
 =?utf-8?B?QnEzSWVGa0pkMGJuZ0xKTW5QQWtPWWJycWFYSnlDb2FmQTJWckpRQnVhSDRI?=
 =?utf-8?B?Q3ZheDEwcEoxZmpFTXdRVkxKVjc5NDZNNE93cTlucFEzR3dkN2hUMkZEWnZ3?=
 =?utf-8?B?cFJGaWVTOGM1N2ZpR1RWQitoanNVcDBCQllsLzVHd096djIrc3NhdGFWQUl4?=
 =?utf-8?B?YlNqSkQwUld1TXJKRXdzTjV1ckJQQkVTUkgxenBqU2NEdFdJeXJuOWJTMnc2?=
 =?utf-8?B?aGN2bHFwK0Q5L2lmQlQ0VHVOdXhxZzlidlB2bHk2dTVQSzhES1NVQmtST2FV?=
 =?utf-8?B?TktCNGxiSTR5cHA3anpTbTRVSk5TV1Z0bVF4dVF0ZXFRWW4ydWxqT0N1Y2V2?=
 =?utf-8?B?ZUZvVFBHMUJGTEg4M3hjRnRKbit1TWNiL1hPSXExdFRCTkdMRUdrOVlqREht?=
 =?utf-8?B?UjMzNytwYnlFVDA2SjdxbGlGT2R3U08xOGh1WURJNGlWRXV2QjMvekVJbTF2?=
 =?utf-8?B?NnhmWmp1T3RBU1lJODVlZkZ2ZUYrRkJvdlRwNUNMQmZsVHIyVUtHMitoNGFN?=
 =?utf-8?B?bFYxRzV6VkUvUi9CSVlmS2VuUFU5Z2FxRDVGNG01R1c0dE81R1NEREdJVVY5?=
 =?utf-8?B?MzB6V3VwU2owZnJ0RXdwRnZGblhHUE5uZ1dueUVKejliTmdvQitKRDYxcVgx?=
 =?utf-8?B?a0taa3BHdE44OEhjcWlaUGQrV094SFkxVlV0V1paZnFEZHAvUkVPTkxiRkZD?=
 =?utf-8?B?VUJ1SnRDY2ZVMHZqWGtXNHgwdStKcWo0YmRiT0lMWDhENVAvcGlrVEhGbWQw?=
 =?utf-8?B?SU9URG14L0M2S2RLYU1ZeTB3OW5FTGNBdUx0RndyRUpiandQZndaVlJROENR?=
 =?utf-8?B?cFNaR0pIbDh6UDIvc3RyR1YzcEZyOHRmYk8vTVR6S2twVUlCTUNqV2ZjVU9i?=
 =?utf-8?B?M2pLU2tlUHp3eUhKL1Yxdmw0WVNqcEdtNGhBcXVzZnQ0aTJweklTcGw5NnBJ?=
 =?utf-8?B?dEMyQ3ZQTkduSWtubldpd2RWZkpvRUxNZWNlak9MNW5JeW85L01oWWdxaEFw?=
 =?utf-8?B?dFNmYmc1RVlPcFdjMUFqcmwxSmVjc0hVamNHclA1dnE5SGwwbEJEWlhZVFhU?=
 =?utf-8?B?TkN5cDVKeXFjWmg2cW1zNCtJakMzUURFRXVVRjFMT2xScUFVL01sMXNBZTZi?=
 =?utf-8?B?cFdNSmE0KzY3TWxNSTVLcElBQUxEakU4TWE5cHZtUXlxSFpnVnlEcDdpT2x6?=
 =?utf-8?B?NmozcHZFVWxwell4dHhGQUUrRGRVVzc1b1prVFk3a3dsZ1ZpTzJ0VXo0YjU4?=
 =?utf-8?B?T2hxd3I4bmE2QTNYaW82MGZGRmliS1RuNDNFdnl5UVRFL1NldWtaUGRwRVZN?=
 =?utf-8?B?SjVhRjdFMlRDS0FUSksvV2dLK2g2V2NtT3RsRHkrYWZQUDJFM2x2K09ORjA5?=
 =?utf-8?B?TFRCUUNaclBaYUlvaFZWZ09BK3ZZTllaWVJEejNuRkFJak1qeXJLeDYwNzlW?=
 =?utf-8?B?T3FxS2pmZ2VCdTU5c20zM3FkTTVpZkJsOTVHYzhJU1lhQ2J4NHV4ZUV0QW5V?=
 =?utf-8?B?dmwyM0hia0lsL3daMXFUa29janBXaXQ1eU5WZXM3QlRFSktTN2pwMW0rZS85?=
 =?utf-8?B?NGZNdi9NVGFGLzBWT0RRS0pySys0ZnlqWFVodm9FRWJUc2ZOSHk0bXY3Ukt3?=
 =?utf-8?B?UDJ5TzlkUnNpRnFwQVJabjVNNXNxb3dQaFFFcUlCQW5VcVkyeGlRcWgxOU9Q?=
 =?utf-8?B?akJpSHNaS05TNFFnc3U1WTlTS3VkbWVDckQ4aEJURUx6WHJrZElDLzZsQVQr?=
 =?utf-8?B?dWMwTWVua1pEdXNnd2E0dzlXTnRNeU5hL3lVUEVuKzVlbDNmcFhIQTY0NGFS?=
 =?utf-8?B?Q0dDQUJINm8rOUxWbEwzYzFuWkFZbURjMjM1TFNQcTVVUzJESEpONTRzOHRj?=
 =?utf-8?B?eFUwMVE3eHJvR2ZEZkE4amt6bVYreEVmR3o0WEtCYW1rdGFucC9QZz09?=
X-Exchange-RoutingPolicyChecked: qrIEjTG6MA4AsSQ0xC2lY1xO3ibW4P1LikyXhQ0bTyCB3Unf0kGZ5isO+MuihWe66r1EJ5YrDClk4BOVle5mU6REMRMa9nIame8Rwzh/ab9/r9+j8PiBZz97CvG4CHBWRahpfexjzJwH3+RUQ49UDLq9MW4GZLnoS2t7QACiAbOna+d8g2x42N26gy2EjhFwCAYlBx6AFdDc1AHqdj8oZDwuuib1Id3aIFTnlPeqr8GuA15M0neG+EdjJQOiA5tTIu7n3TVbIKeObihl+5SQlAtpM4JRQxe3HTPrrSW1OaoBg42gOp0Tn3/WRfkzs8lL8O+7BoBvC2PokCnuSW7srQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 899d5d5b-ef0d-43eb-a107-08df3b19a2b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:49:00.4327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kDPKTLs3lU8FjoReZQ2DloAbJRer/56+JQU+MrigjsWC5XizvGRq6mSR4obI89dSSPRakBt9DWqXFrFJrs2WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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



On 04-11-2026 13:17, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   v9: Redesign to prevent races (Sashiko)
> v10: Spell out temporary device wedging in subject (Lukasz)
> v11: Update GuC CT path to check against permanent wedging (Lukasz, Riana)
>       Put wedge reference only if device is wedged during resume() (Riana)
> v12: s/xe_wedge_not_recoverable/xe_wedged_permanent (Riana)
>       Refine documentation (Riana)
> v13: Prevent PM ref leak on slot reset failure (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_device.c      |  8 ++---
>   drivers/gpu/drm/xe/xe_guc_ct.c      |  6 ++--
>   drivers/gpu/drm/xe/xe_pci.c         |  2 ++
>   drivers/gpu/drm/xe/xe_pci_error.c   | 24 +++++++--------
>   drivers/gpu/drm/xe/xe_wedge.c       | 48 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_wedge.h       | 13 +++++++-
>   drivers/gpu/drm/xe/xe_wedge_types.h | 13 ++++++--
>   7 files changed, 88 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ed23d4f0051a..a487380573f3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,6 +731,10 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (IS_SRIOV_VF(xe))
>   		vf_update_device_info(xe);
>   
> +	err = xe_wedge_init(xe);
> +	if (err)
> +		return err;

Why do we need this? Why not just return if survivability mode is 
enabled in reset_prepare?

> +
>   	/*
>   	 * Check for pcode uncore_init status to confirm if the SoC
>   	 * initialization is complete. Until done, any MMIO or lmem access from
> @@ -763,10 +767,6 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	err = xe_wedge_init(xe);
> -	if (err)
> -		return err;
> -
>   	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 0a1b37fa0efb..5b43ca73f6dd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1162,7 +1162,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	xe_gt_assert(gt, g2h_len || !num_g2h);
>   	lockdep_assert_held(&ct->lock);
>   
> -	if (xe_wedged(ct_to_xe(ct))) {
> +	if (xe_wedged_permanent(ct_to_xe(ct))) {
>   		ret = -ENOTRECOVERABLE;
>   		goto out;
>   	}
> @@ -1591,7 +1591,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (g2h_fence.fail) {
>   		if (g2h_fence.cancel) {
>   			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
> +			ret = xe_wedged_permanent(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>   			goto unlock;
>   		}
>   		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1936,7 +1936,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	lockdep_assert_held(&ct->fast_lock);
>   
>   	/* Keep in sync with g2h_err_is_fatal() */
> -	if (xe_wedged(xe))
> +	if (xe_wedged_permanent(xe))
>   		return -ENOTRECOVERABLE;
>   
>   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3fa842c22a50..664d65149ff5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -39,6 +39,7 @@
>   #include "xe_survivability_mode.h"
>   #include "xe_tile.h"
>   #include "xe_tile_printk.h"
> +#include "xe_wedge.h"
>   
>   enum toggle_d3cold {
>   	D3COLD_DISABLE,
> @@ -1404,6 +1405,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	 */
>   	xe_assert(xe, !IS_SRIOV_VF(xe));
>   	xe_assert(xe, !pci_num_vf(pdev));
> +	xe_assert(xe, !xe_wedged(xe));
>   
>   	flags = memalloc_noreclaim_save();
>   	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 9bf0da3a3d15..46d4150771f1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -21,13 +21,8 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> -	/*
> -	 * Wedge the device to prevent userspace access but do not send the uevent.
> -	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> -	 * pm reference to avoid underflow.
> -	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	/* Wedge the device to prevent userspace access but do not send the uevent. */
> +	xe_wedge_get(xe);
>   
>   	xe_device_set_in_reset(xe);
>   
> @@ -41,10 +36,16 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   
>   static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
>   {
> +	struct xe_device *xe = xe_any_to_xe(pdev);
> +
>   	switch (action) {
>   	case XE_RAS_RECOVERY_ACTION_RECOVERED:
>   		return PCI_ERS_RESULT_RECOVERED;
>   	case XE_RAS_RECOVERY_ACTION_RESET:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
> @@ -71,6 +72,10 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
>   	case pci_channel_io_frozen:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;

Nit: This can be moved to prepare_device_for_reset Thanks Riana
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	default:
> @@ -128,9 +133,6 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   
>   	xe = pdev_to_xe_device(pdev);
>   
> -	/* Wedge the device to prevent I/O operations till the resume callback */
> -	atomic_set(&xe->wedged.flag, 1);
> -
>   	return PCI_ERS_RESULT_RECOVERED;
>   }
>   
> @@ -139,8 +141,6 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
>   	xe_info(xe, "PCI error: resume\n");
> -
> -	atomic_set(&xe->wedged.flag, 0);
>   }
>   
>   const struct pci_error_handlers xe_pci_error_handlers = {
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 2f35937c5e66..8596c1a7e7c0 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_assert.h"
>   #include "xe_defaults.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> @@ -55,6 +56,43 @@
>    *   firmware and restore device to normal operation.
>    */
>   
> +/**
> + * xe_wedge_get() - Acquire wedge reference
> + * @xe: xe device instance
> + *
> + * Get runtime PM reference and block critical path execution.
> + *
> + * Use this for driver internal usecases which require temporarily blocking
> + * userspace access to the device during autonomous recovery, like PCIe FLR
> + * and bus reset. For everything else, use xe_wedge_declare().
> + */
> +void xe_wedge_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	/* We should not be runtime suspending as long as critical paths are blocked */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +/**
> + * xe_wedge_put() - Relinquish wedge reference
> + * @xe: xe device instance
> + *
> + * Restore critical path execution and put runtime PM reference.
> + */
> +void xe_wedge_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
>   static void wedge_work(struct work_struct *work)
>   {
>   	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> @@ -97,11 +135,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
>   		return;
>   	}
>   
> -	if (atomic_xchg(&xe->wedged.flag, 1))
> +	if (atomic_xchg(&xe->wedged.perm, 1))
>   		return;
>   
> +	xe_wedge_get(xe);
>   	xe->needs_flr_on_fini = true;
> -	xe_pm_runtime_get_noresume(xe);
>   
>   	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>   	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> @@ -239,8 +277,10 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
>   
>   	disable_work_sync(&xe->wedged.work);
>   
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> +	if (atomic_read(&xe->wedged.perm))
> +		xe_wedge_put(xe);
> +
> +	xe_assert(xe, !xe_wedged(xe));
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> index 3b5499dfc30d..f2cab855db35 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.h
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -14,11 +14,22 @@
>   
>   static inline bool xe_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged.flag);
> +	return atomic_read(&xe->wedged.ref);
> +}
> +
> +/*
> + * Do not abuse this. Prefer xe_wedged() where possible. Only use this
> + * as a last resort where xe_wedged() is problematic.
> + */
> +static inline bool xe_wedged_permanent(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.perm);
>   }
>   
>   void xe_wedge_declare(struct xe_device *xe, unsigned long method);
>   int xe_wedge_init(struct xe_device *xe);
>   int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
> +void xe_wedge_get(struct xe_device *xe);
> +void xe_wedge_put(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> index e472c5fcbd26..0ca9f30dbda0 100644
> --- a/drivers/gpu/drm/xe/xe_wedge_types.h
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -29,8 +29,17 @@ enum xe_wedged_mode {
>    * struct xe_wedge - Struct to control Wedged States and mode
>    */
>   struct xe_wedge {
> -	/** @flag: Xe device faced a critical error and is now blocked. */
> -	atomic_t flag;
> +	/**
> +	 * @ref: Refcount for wedged device, blocks critical path execution. Used for
> +	 * driver internal usecases which require temporarily blocking userspace access
> +	 * to the device during autonomous recovery, like PCIe FLR and bus reset.
> +	 */
> +	atomic_t ref;
> +	/**
> +	 * @perm: Permanently wedged device, not recoverable. Only to be set when
> +	 * notifying userspace of wedged device through drm wedged uevent.
> +	 */
> +	atomic_t perm;
>   	/** @mode: Mode controlled by kernel parameter and debugfs */
>   	enum xe_wedged_mode mode;
>   	/** @method: Recovery method to be sent in the drm device wedged uevent */
