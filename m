Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F05606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjNa/l88;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DehQbSdk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C5B10E9E0;
	Thu, 26 Nov 2026 13:48:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7E210E9E0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795700928; x=1827236928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=elVaWKNOb8cujjp7LloQTQOMWhZaOoQVRTrJgOSvWFE=;
 b=NjNa/l88qbpr+8FvqnxUd9rqxWgksU5LIreKe872NSVvkIOYYydcBm4q
 +uh9EnIEcN2LceKKNBNmF1Vxg0EWhp1qwdyThyaaM5Idge+ejKW+X8DPf
 ZWzMGCm/CFblIBob4Mhtlx1FgimwhpjPC7lbWNIhrKKc4M202mHVv6o3y
 k1uMVgbe97LGUjpMAI3Wkv6K7LS7F0+UAT2NnCjZjUwzSEtdCsUDHNYIh
 a2FQy8ddDyezVVwXbqaq9je43TRx9bNJ1Rkf039l9HdXO0pg2mEQ/rR7L
 v64xi8HR4+X5gaVu09bun4v+ElkUHnqNxZxROjLtDKNYPa1Fad0Wk/82s g==;
X-CSE-ConnectionGUID: I1pSvkeYQ5GkTeeFhU0g0Q==
X-CSE-MsgGUID: zHEiTpy9S4+BCEcphr3o1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4516794"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4516794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:48:28 -0800
X-CSE-ConnectionGUID: DHr2ZWv6Sn+S8qUTXfxesw==
X-CSE-MsgGUID: /cmv/gWuQgecY+AMV42LPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12319875"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:48:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:48:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:48:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El3LzrmowMzvQUB0xPK3DWwYyD8emEfAAEuzcd7D8Ke/MqtchfhxU7unFl/kKMjeMCJbSkhWMj8zVEeiZ5Ap3z4ihYPzCxHeSh8qrnceHU+ZjoVcggSQfX06Npr14iYn1RIeTHS25Ks/kTNJyqLbarVMjsi7NqUyxs18/shEDYxUAPUQIuZRmaqlasRoZ9tevuZCk9vOGx0Va77J810eHRHgewURc64zYqKjT4YqJIcAOqV5ip+rv15Pj485JI14EUAtbS9E4/sx0EMQ5IGEa5zrxwXUbojIe+Yd8p7607Y6bwCmyKgfRdAl34NqIpZFVWUNOS9HQxkQMlWnuspCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLaUDDden2ItTs3p1TI7S/CLuFOeS+QiZq0hLA62u4I=;
 b=pYplPS3mSnucZOuqTEWckycGWcnRgcA3bAFFRFaKgZJQYfhUh3XYJxqTZ/9stoO160PesOhcyJq1hjNiZX5YdTw9aV6jg/U+zU3SOjChwhbjh3RzsC9VR6dy2SKu+PJzO24McxKjp+9vohLLD5ynyqBJdVq3gWYrmO06elZGAY9VMD7rYGg0kNbfwpw4+8025MWQ70P5cQcocbmuFN3ym/BLjmcGC2kmh4yqAieg24pC+bk53l4P1cWKPkyOjHK8U19kW3l+KoFQzR2GIplEtpc4iLHkWRuNRM1jzb4GjcSyRdi6GF7luNSvmJKYlpeDvlO5veq5uqbuhil2iqEvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLaUDDden2ItTs3p1TI7S/CLuFOeS+QiZq0hLA62u4I=;
 b=DehQbSdkXl8tL9Kd16Ys809ThyVahMPKB0f9/nGlYHcidrhdAW3M3jutELboVnUMgKvgf8ncIpoKPhM1Z+qnTUZ2YM0nqNzYm48+d8gkmCk6ooSz3NUqC9rgN9BFAoiDvY8p8y7txASSBdFea/DXUT0VIPuv7gWn9FFcthl1Pu4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by CH8PR11MB9507.namprd11.prod.outlook.com
 (2603:10b6:610:2bd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Thu, 26 Nov
 2026 13:48:18 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:48:18 +0000
Message-ID: <81e9eb2b-3eb1-4dfb-a91c-8e7b30efad7b@intel.com>
Date: Thu, 26 Nov 2026 19:18:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] drm/xe/pcode: Add ordered write batch helper
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-4-karthik.poosa@intel.com>
 <awcpB6s_32zyhNBi@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <awcpB6s_32zyhNBi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0322.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::10) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|CH8PR11MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 6912b6c2-34a0-4103-b7c2-08df4bc3ed7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|261009223027099003|22082099003|18002099003|3023799007|10067099003|11063799006|56012099006|5023799004|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: P+Q3AzuG/KbFsnC8UTKWfnv2jQFTGgzFPXWVVI364p7kwQGCNlwIADvBAmMshXM09+BTltZGjx8cy47rO7U1UiXB4i20qLsQNjN2A4RkR7ohrCddYh/EkgIi7OhRt4cq6VgS0b7Bft5teFku46lwerBxTexIZvFDp6i8yOuh2l0hOCzOncZ5PAPxFPqV2izaABDadz1f5juZCo4Okog9riikCE4AwkP1DzrNz//PxzmOBBNgl6i6yEVnCamXWaQ8gpAsXfyU7zkinuEborv3JsiZJDq7CPqW8vGFxphy3AAr6uTxKTjAbqlpJfgbCuPe0yuTJ9Eu1Ojb7X/Nwpk+BbkpZ+i0STI3IqT8CMXMlCzMQAWB/AoeGoXQcWLynFmZZ4u8BhM7qbbhevHd8uNpzSrBNjTU9PNZIGsfoOt9L+v0Ly8Gj94YksT2EXEil9hkoXQS4GP9GkIv3F2bf3XBa6aDz3adl3xPr9p0TyCj13Fuv7LLsVJ52i/o5vxYmTIUSVf0LS4xhL9+ZMIL4N0rlCmbmqLYigMQJp837GxHj8852qN44aK5oB4Muu9DEMmx56GULQdxCjG7vY3G3vYCxZn7+1k4FDLDf/bJemSIQmEV1Huk+omTnPRcjumXwtZqHyPVuS2ZiD3vc8NJH9MZsqFk1tI30QAjvuZwPneLcks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNneTJET0FQVGk5Zlhmd2FUcVIwZTJ5bU5KSmw1U1U1YVFINGFVVWdtTzlB?=
 =?utf-8?B?aEZ2UkV5Wnl4RzhBeDVHZVhRek9vWS9LdW84VFYwbUFaeTIyam02RitNK2ZW?=
 =?utf-8?B?L2Rjc2FPbk8yQ25vbmpYSWlzblEvMy8rMno4d08rN1p2Mk1ESmVBZ1lHZFpZ?=
 =?utf-8?B?d0Y0ams0STNMS2J4ejY1ZjhoQzVRc1dnNWRpM0JGWmpjeDd0SjZENUI1V1NP?=
 =?utf-8?B?RzN6bSt2aDlUS3V5TmtjTTAzSXMrc1NiNVIxbmduR0c4QU1Nd2U1U2pjMUox?=
 =?utf-8?B?SHdtQXh3V00xRWc5RDBPV2NjcFNyRGpBaDNCUk11QW9qT1E1TS9iQTZ1T1pX?=
 =?utf-8?B?YVVKQXVidUc2WEwwQzN4NXJkNWxhS1dzSmZSZitnb1hIbmNUWlB1S3VEemYr?=
 =?utf-8?B?VlBtektkYjRJcjVRZWxkWlZOb0pVcFdkeVR3NnVGRUdFOUJrOUc2WDJUTVox?=
 =?utf-8?B?bUVFNzJjb0hmb2M0UUZLRFFpbjVxSnBzd0Q0azRZME1IZ1N3M1hwZDNFM0g5?=
 =?utf-8?B?WG93UHd1ejJWMEZPc1hXUEFCTmsyWC9VZHVVcXNzV3Jtdm1jc1MvSDNpdnFM?=
 =?utf-8?B?Q2lURnpJbDg2SzZyd1Jqa2QxOHlZNjloZ1BsQng2VWNZTkQvT3JzbFIvZkpT?=
 =?utf-8?B?cFREWXRTRjFmVWVQTTMxTmZnRWF0eWg0ZHBJem8ycklyUkhWdGdMWk4rOEZB?=
 =?utf-8?B?YmlJOG1Ed3E1MzVZZHZUbmVXT0lBQkZnSFhpdGlic2M1VDZ3SkRKT1h6d1lU?=
 =?utf-8?B?eGxuK2QvVS80czErc1gyMWRNY1laQ005bWdqS2ZLVU8vQWpDSzVZb1VwSnIr?=
 =?utf-8?B?ZnF4UkFmaVpQNWVJN3p0b2ttamtEaDZLZkpTd3JHejZLTG1MN2I2MEM5U1c4?=
 =?utf-8?B?Mkx2QVVlR1JzUHFxYjYwRlFMYlJ6enVieEowV0pYZzY4WGpBMmQzL1l5MDBk?=
 =?utf-8?B?NjczRU0rSUtjTnFIT3UyV2tnRU1Db3Y5SGZVeDBiQk15c3JESEdrdWNDSlZv?=
 =?utf-8?B?SFlEZ3RXUjlrU3hxRGhMcTZWZVRhNEJoL3NqQ0ZlS3dMcm1oTWFiajIwc3l1?=
 =?utf-8?B?eVZ1cm1sSUZka1BiVlprZDVtRE9CWW1jNU5McGh4Y2pWU0RPVUJvYUM3cWRF?=
 =?utf-8?B?blI0cWNlL3NxUWE4cDA0azRZSEIvbWpDYXcyQ0tkbjE3aE9YWm4vMzc4enJ3?=
 =?utf-8?B?d2t4Ull1d1UrR05zeGJaNUZ6eDE1WkRQaXhvVlNqTG1ZcGp5WnREWHNaR0g4?=
 =?utf-8?B?dGYxYWtyelJxeFZXYlBrc3dRcFZNN1QvYWtOZzd0aHZQeUdOTjJKeWdDdmFP?=
 =?utf-8?B?UFdxK1k4U0I5dVZZd1Nrai9qenZBVU1ZbFc5S1l2c3dhUUtpZno4eVJ4Ykhi?=
 =?utf-8?B?eTBzQ3ppYWEwY1hibW0rSnN0K3lDYnl5djlPNHU0N2s1ZXY1Rk5TR1laRVlv?=
 =?utf-8?B?bi9iUnQwSkZnOXhMZllHT0xONVk1RW1xeHZ4T250ejJMUTFTSUpmQUJyb2p4?=
 =?utf-8?B?OUh3azJSUWpRd2pscnA3b04yTjhvTFNVajhJTkdvOHJUejhMUnFvamU2OWpn?=
 =?utf-8?B?RUowNHVhZC9COWRqVTdRUFpEQSt5Z05YM290MzVNV3VQUVZEUktrbFpmMjQ4?=
 =?utf-8?B?b0x2WWdLdnA4K0RKamFhYnFNYlQ1SUdSYzg0NjRBUnN3cS9NaHdraFJncmJw?=
 =?utf-8?B?Mzk1VkRIaHZxYWxYK2FWZnVLRW5sdFRsSDlMWUNuMDJYQmZUY25XQnlCNGha?=
 =?utf-8?B?S1B1dGZ4cHZqTERRVTB0TnErK1pobUROeXNyS1lLc1BEeEtBc3Y1cWcwQk1C?=
 =?utf-8?B?VDNPaDZNakFGWkh1K0xqYmJqZkpvVmY2YVpUWWgvRVk5RDZzRGx5c2gxRzZv?=
 =?utf-8?B?YzlhVCsxWTkySHhieFgrbW0yY2R2bStXOVNlN1IzbFh3bkFsSmpBYmdYdlJN?=
 =?utf-8?B?MTI5N1RKTTlNK0pYRlFXcTlhQytVWm91aUFIZVhkTmpSMDVHN2VsU1dwRVlh?=
 =?utf-8?B?TC9kUHpDTThyTzhrV2FZM1Zaa2pzc1RLb0k1TW15U2JyaE16MElScXYrUTBW?=
 =?utf-8?B?bWMrd0t4OUlIa0x5aURWVi8wNjVHdVZyT3FzOTIxbWF2ZU5jVjhFNXRWei8z?=
 =?utf-8?B?ZWdKY0U4YlRWYm1BazdkTTJvV1dxSVV6T041M05OcjlveW80d2hkbEc2NUZZ?=
 =?utf-8?B?M1hkYnQ1Tk1OOWd1bHhHd2RuQlFuN3hSL09GWkJCVmwzenZCWSt3WXpMT1Vt?=
 =?utf-8?B?MlJrNzAxNVd3SmsyQzlYZUc4Wkc4aXVTeVFlOTdVQXF5RE9HZkFrV2hldWhF?=
 =?utf-8?B?MS9jZTE1Mkp5dm5uSENmZG10aUVjL1ByS3VKN0o2RjFMWGJlcGxUdz09?=
X-Exchange-RoutingPolicyChecked: klRTBYiLSttOFGT68kFTyjvO4jjWcHbv/Mc9rtHohb0C0vcm10kPiRLVhBtWhR5e8R6ooTTuNzi0RJxZBi2Q94iMuV/BHOV3ni23mBxX1NSp1Z1xpXHX7dWB+aptbSrUiSNpyE42lrXTB8wBDK823pzKwhfaoZcTF/k29b6c8MhS0eVSldD+NTsu2UrPl2I7so1ZMQh8FXmzk9vnvQNx4CEt31Rd+zMukOIyxFQWZgg+LrH7fdbh3MKMrLvQlED5/mr0cexiA/KMBPYjP+2DgpPysYDGzhq6yjSeigc7pRP93WXgP1sWaBw6lynn1qJwMqboB76MxmVc1gjJBYAHbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6912b6c2-34a0-4103-b7c2-08df4bc3ed7c
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:48:18.7857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrwKGNtnDigbdx2yIPr3sQttLXDWh+rq7z5dQVYiPLiOUqPejXyWGJZkHc+ZsIeYRXvCSQv9iPKKD40MiKJ9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9507
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


On 25-11-2026 23:59, Rodrigo Vivi wrote:
> On Tue, Nov 24, 2026 at 11:18:04AM +0530, Karthik Poosa wrote:
>> Add a pcode helper that issues an ordered sequence of mailbox writes
>> while holding the pcode lock, so no other mailbox command can be
>> interleaved.
>>
>> This will be used to write fan tables atomically with respect to other
>> pcode users.
> The question here is: why do you need this?
> What are the odds of this starving and causing timeouts on other critical paths?
>
> The code below itself is right and I'd give my rv-b, but I'm concern
> about the overall impact and risks, so we need a very clear and sound 'why'.
>
> Thanks,
> Rodrigo.
We added this for use cases where pcode mailbox commands have to be sent 
without any interleaves in between.
For fan table write this is needed, All the fan curve points of a fan 
table, should be written without any interleaving pcode cmd in between.
>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>
>> v2:
>>   - Document partial-failure semantics and lock hold time in kernel-doc.
>>   - Reword commit message.
>>   - Return -EINVAL for an empty batch. (Soham)
>>   - Log the failing batch index, mailbox, data and error. (Soham)
>>   - Add kernel-doc for struct xe_pcode_write.
>>
>>   drivers/gpu/drm/xe/xe_pcode.c | 39 +++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h | 12 +++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 266deecbb100..ab796218e737 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -124,6 +124,45 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_pcode_write_batch - issue pcode writes in order under the mailbox lock
>> + * @tile: tile
>> + * @writes: mailbox/data pairs to write
>> + * @count: number of entries in @writes
>> + *
>> + * Holds the pcode lock across all writes so no other mailbox command can be
>> + * interleaved; the lock may be held for up to @count * PCODE_DEFAULT_TIMEOUT_MS.
>> + * Stops at the first failure; earlier writes are not reverted.
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
>> +			 unsigned int count)
>> +{
>> +	unsigned int i;
>> +	int err = 0;
>> +
>> +	if (!count)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&tile->pcode.lock);
>> +	for (i = 0; i < count; i++) {
>> +		u32 data = writes[i].data;
>> +
>> +		err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFAULT_TIMEOUT_MS,
>> +				       false, false);
>> +		if (err) {
>> +			xe_err(tile_to_xe(tile),
>> +			       "pcode batch write %u/%u failed: mbox 0x%08x data 0x%08x, ret %pe\n",
>> +			       i + 1, count, writes[i].mbox, writes[i].data, ERR_PTR(err));
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&tile->pcode.lock);
>> +
>> +	return err;
>> +}
>> +
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 7e43792b0037..c601a12baba6 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -18,6 +18,16 @@ struct xe_pcode_version {
>>   	u32 engg;
>>   };
>>   
>> +/**
>> + * struct xe_pcode_write - single pcode mailbox write
>> + * @mbox: mailbox command
>> + * @data: value written to PCODE_DATA0
>> + */
>> +struct xe_pcode_write {
>> +	u32 mbox;
>> +	u32 data;
>> +};
>> +
>>   #define PCODE_DEFAULT_TIMEOUT_MS	10
>>   
>>   int xe_pcode_init_early(struct xe_tile *tile);
>> @@ -28,6 +38,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
>>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>   			   int timeout_ms);
>> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
>> +			 unsigned int count);
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>>   			     u32 data1, int timeout);
>>   int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
>> -- 
>> 2.34.1
>>
