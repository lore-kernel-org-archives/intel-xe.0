Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5337DD277CA
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031E810E23C;
	Sat, 10 Jan 2026 00:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHx2opRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176F610E23C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768004005; x=1799540005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mlo/kp25ter43UoAE4mQMgUPhdTSf4qIr1y+nw/YV4k=;
 b=eHx2opRQEUmaeoNnXFfeQ8b8/rK9OZX26luO/m+WxGa3dML2P3UbxAG+
 4bawBdzwseZ5JVjXMCt8tAj40ByNPZZwOn/CUHon9IfroxaJ8xvXRi/QW
 8E92gNi78WZ2MvdMcl+sgTjr2jyHpiwlzyedYmOp/fpneyJvjKbt+xN+0
 u4rp1e40CvqaCbXfh39t/dXw/reRs4QL+yiML30flzRkJ61Bho7Ow9rGK
 xscYov2MLU/MdMbJbeBxqMXXMEYlqjiJW/0P9rpl0MXoQQCdlKioV5A+s
 +GbxaLweqr844cwMj+vjOHslREgIsHFK3cSxrcu7ji0JwhmIBCzNthDj6 w==;
X-CSE-ConnectionGUID: aQofTmxTTBaZOzov/URF+A==
X-CSE-MsgGUID: 5j71KhikSSmg+S3NfLwlPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94859223"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="94859223"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:13:25 -0800
X-CSE-ConnectionGUID: LMsSyFW4S7Cie6RLRD1bRg==
X-CSE-MsgGUID: XdgWQQhrSsemLFnojsLGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203215258"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:13:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:13:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:13:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWmuvgxH62a9WL8AZLILX3nKdqwEohYZ6H2UEBaj5lHiZ3a8spQULDPletrHeSgSTWEpUYwULclHMyILBmpzguOYpCI0wTXNb8i8JnxYAExZpNdaUHId3OhUwQmcjizktLQL1zUZDk0HJZFKLwy5J7ZFbS/hUBHYq17jOnGiUuxLm8UqhD26Vm90bLDxyGYMb5RwYKVlu5sA3z/uvRZ/0f9ZNT8IRigDDF4hIHp88dJHSVbMBtP1shHHKCvOQR6Tg4sFCdM1+4dF7V3Bh9EPZvLmV420dpd8iSEZVHBXGvgkJnGwuAnbQwCcwvTnYsve6DWvTfz/lAht6MezF6ZGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5j2Pa/vGaw1ynKkfQpcYZBlYc6/7oPgfVad3ZcD1FQ=;
 b=MiEqBC69nu3g4F94XLUBlA/SgI8ngmEUZeIpF0nkxNlUH9kLgwEWTXXTtcBf6XqVoe1/ghGe0kBoYHxCOgF14IeT7kfbKY5h0avWA3r2cdJkkN63iMG54yqfZPe7G41ITecucvn2vpH/xIUJ5PLhMGheckbJtIYB80Qt9yPpB91sK4Y+fJY25Azts10pZNlvRbr25JnuWagFwWZooOw+QBbbfCWk6nRnOXy5YE10rDg92QEX9JJkbi5HFEBUbEUYBC/JZlrKkmZRAjesKHJloef1k3sgxp5Fe64fhzDPLCzoJoCME/CSqN2cWud0J2g6r2/B1MzaySGOsrlXutrrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:13:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:13:22 +0000
Date: Fri, 9 Jan 2026 16:13:19 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Message-ID: <aWGZnzuJPxSdS5H9@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108120548.1015154-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d218c6-09e3-4604-57cd-08de4fdd10ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk1OZE9MaHhnMk9tN0s5ZFNBam1ZOEoyam9JdXEyYTlhZmpsLzlDbzQ2UW5i?=
 =?utf-8?B?UVRYK250NzJwSUJHSWZHOHdpTERIekVUNExkcm1VRkpWUThEeU5NRXEzQVRi?=
 =?utf-8?B?MVNwTUlSM3BkaGRvVHhZL2VicGVWdGN3MXVsT2I3VElWVmVYVzM4bEp3a2Zs?=
 =?utf-8?B?VlgzaHprWGdPdHFRZ2htdEwwdkpjVWNLVU4zemU2cmVyWjh6UGNjWU0ydldL?=
 =?utf-8?B?T3cvb1BMeUZrcXMvTkI4Wmc2RWJsRWxLZTRMT1lpRFFJYXNKTlVtcENPN2xT?=
 =?utf-8?B?b2MzSklFTW1IV1dmNnNjQUVRRmY3NG00VjNvTkFOY1ZpK2xnWCt1c0gwRFc1?=
 =?utf-8?B?VUVrVjhtSXQ0bUlOZEk4czZSQm9ldEpDWm1VeERTK2pLbkNGR2hWcDVKU09L?=
 =?utf-8?B?WnRrUm5GZjBjYVNHcXBGVEs4bEl2eGRyZHB3MmU4SGhHbm9TMUhWaUtsTU9m?=
 =?utf-8?B?WFNxelhPam8rNmNENmJiQlhFajBaZWFhY21hd0swMVdWMGZxYlRTOHRUdEZi?=
 =?utf-8?B?OUxBK3Q5dnlWRnFRcVpMOXBoeUJUUVp6YXJ6elVGQTI5UVdsWGF6cmdPRFVZ?=
 =?utf-8?B?TURxemRJRVJqOVhocHR1OU5UOGtpenUxMWhadGxRNDQxT0MwOXV3NDgwaDJM?=
 =?utf-8?B?ZDFGVkkvWndaczZRNU5vRU1qL1JHekIrVTgzeVYxSTB0aVgwaEdHbjRUTHdo?=
 =?utf-8?B?V0xxbXhWZ0s0eW1lU1J3SHI4aHdjeFZsNlVMeUxQc2g4cEZkUW91YWVoa2dh?=
 =?utf-8?B?M0daQWNjL1JpUkx5UElvbzlaL01yMHJIWDEyNGViQ0xIMnZPSGR2a05LQ0JZ?=
 =?utf-8?B?SGltU3UveW9iTmpjN0gyMnVESFF6REJVaXh4TysyeUhBeEhqcndCc1JTNXNa?=
 =?utf-8?B?VUUzZVJ4cEprSVhYKzQ5T3FxU1ZabHBZaEJsYmZ5U29yMHRnUHZtTHRJb2R0?=
 =?utf-8?B?azZPRUM3V3p5SFRRV2VzR2hkSWFEVUs0VmNUSmpUZG55TzRuSFQ4ZC85TTRw?=
 =?utf-8?B?MUJZYmFMWlNoVTk1Mm5ObmdJK2hWSUdkV1ZzWkgzQnB5OUt2RjNmR24zMkZm?=
 =?utf-8?B?dEdwaTdaRWQ5cVhYR051YW1OK3J5M3NBeXlTTnhTNTc5U2FlNDRHU2NwT3lM?=
 =?utf-8?B?Y0FxZHJKaURyVU5MR2tLeXp6V1NCQ0prdWNMY3RYNnNnV0FuZWwwbjFBTjR3?=
 =?utf-8?B?OVVrNlh6RXMzSlFqeHowR0Z6SjBRcnFFQmo4K2JIdk1jbEpyTncwbEJveFZX?=
 =?utf-8?B?eHB2R29GUEd5R1ZkaTc0dVY3WllXeVVubmdqbUVEYTZhSk02ZFRUcngrb1ha?=
 =?utf-8?B?L3BWNkFXd0xmUEcxYVl4NjRtMEJYQ3VsUTVidUdQd09WTmIvYkcxODhpa2hw?=
 =?utf-8?B?djBldURjRlNyMFFYVi90dUcwRVZrNEJiNTJDTEdNUFpvc3F1eTB2YmdmU3Yr?=
 =?utf-8?B?enFSeXB0dDNuc1Bvd0pkSktnUkFYNzJLQnN1OHJDRzNMZm5MZHQyWDVrMXFt?=
 =?utf-8?B?KzhjU2lzdkZ2K2hpcDNFT2QvaGtwM2lCd29lb3ZxamV4aWZOQ2t5NlE4Rzlm?=
 =?utf-8?B?cTR1SjNSSjNhd29RMEdRVGM0UnFHbG9UZHJjcFhKY2taSnhhNEs3NjRIbzcx?=
 =?utf-8?B?ZlpVbmFVejFUMlB6aTBmaGpCWFdTRURUZmxnS3R1cTN0RmdoQ1JWU25NQWJD?=
 =?utf-8?B?VVNNVTVOSS84WW5hVWpRNGdkT2JzYW4wNXBMK1ZwUUJyblFYWTh3RGhVOHJJ?=
 =?utf-8?B?YWc3RWdnV1ZQVzJ4bW9DaDBEZ05RRStVV3R4Wkx3ZGZEcUhvb3RYcC9OaWpD?=
 =?utf-8?B?QTFGYjRYU05rWU4vcW5Vd2ZicHB6UXlMUjdPczYvVy9NL1BiZ1dMb2EybWtJ?=
 =?utf-8?B?UGw0OXpURzdPN2FBNXhGMW9rR3hKTExUSlpiUUtrejVKTnJVdDhMSldWSzJ6?=
 =?utf-8?Q?MjswxHevyAwUVoSE+12U3PYp2C0Fu4wA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2htdU15V2N6U1hkY3BZUjRNbDZ5WEJJQmpLaGF3ZDdXdy9GNnY4T3BSZVY3?=
 =?utf-8?B?OVRyRlZZL0F2VURaMk9jRXlQaEk1UWpwMjRGTkVocGFWMlNycE00bmp3akJ2?=
 =?utf-8?B?UEEvTDBjTW1mallFT1dmbFBVbVQ1Q1FJUTlBa015LzN2S3l1OGprU1A3Mzdp?=
 =?utf-8?B?eitvY1h2eFlGYTdEQ3BkMUE4N2o1MVlvZlV0NlNPcVhLYW1wLzZwOEFmRTFn?=
 =?utf-8?B?MjlUbkNMaGovdkJ3VUxBVTBPSGMvelAyVGZzU2wzQ05WTDQrM3hYZDM4S01x?=
 =?utf-8?B?aFM4QXhWMExnZml5VGgrazU0T3k4ajZEd0I3NkxrTjJMTlAydENvWXJaMk9O?=
 =?utf-8?B?dy9pTDg2Rzltem9PdEJJc2JhNkgxSFZ0V2NyY3lUQ3k3L2lpN1JPc2REakp1?=
 =?utf-8?B?SXVybGlzcnNlU3ErZWJ0ZEhRYmFIU083V0VHSGZjSFljVDJjQUFxQTYzT09X?=
 =?utf-8?B?WTg2TGFZQnpJeHQvc2tZbDJ1V2kxcnBocC9yYVNKUjEvc2R4T1lDSE1CMWI1?=
 =?utf-8?B?T3RhejdWODhDaWZqLzk5bjlTYXp2akNpanRONUZ0cGh5V2NvV3FBcXZjdGlS?=
 =?utf-8?B?d2M0dlYxSTBpdGdBR0tMTVpOdjk2dE9ZTjM0c0xZVzNvMmY4TEtuZzdnWjU3?=
 =?utf-8?B?TjRpQ1pJUjNuSUNUYm8wZmFKSjNxUlU1dU5aMHRnT0ZxVkdJb1V6RXREMjJR?=
 =?utf-8?B?SHRwNERiQnBmM1ZhamczNUUxeTdPNG14Yi85SEIxUm5jeEFjL3RoR0RSa2xO?=
 =?utf-8?B?S0l4SjRFTjI4OVNtM1FjQjBzT1Z5Sm9UemhqSFJnd1RXRWVyVjNIR2haakVB?=
 =?utf-8?B?b2hRS25EQnhIRTBrMGtsQnJnOGRZdy80ZmNsck1KdEdzK0NxRWtxY1lNYnpS?=
 =?utf-8?B?V3VET1lUOUpsZmpqQmYrRjRVTlhkb3ZUbHpZOG1xYWRXcm1pQXVpcStVcy9N?=
 =?utf-8?B?M2JPajdzWHYxODczRDI2L2NFRXJWU0lZOGdUdWQxWmdpWWsxaTZ2aVVqNlpy?=
 =?utf-8?B?Y3NkSlpuNytDQ0pjQUFyQ1pEWFJDZ044NlZqdXdmaWNHU2dmSmlaQjJGWTBn?=
 =?utf-8?B?STcrOTFIQ2s1cGRjY2haZ2FCSm1hOFNSdlBIMjdrcnBlTCtZaWVrOW5Oby9J?=
 =?utf-8?B?RDlTTzZvYUVoMWhwSnJob1pZRm5XN3VxZVZPbVY4L01zV2ZzOFBpbks4LzJh?=
 =?utf-8?B?Wjd1ZFV5UWZXZkthR3hTbWc5Z3c1Z25FRVlod2JHK2pLMGloeTZINm4wYlps?=
 =?utf-8?B?TDJTQzZWM0MrUmp6VUMvNlV5R09DY0VFSG8vMjJaMWhLaEQ1VGw1Wm1YUzlX?=
 =?utf-8?B?MC9qaCtoa2xIYkhUWVJGeHNyY1ZSUTYrblYzQmVFTU5uMzlMNSsrbVV6R3A1?=
 =?utf-8?B?Y2tjZGJYRStZd0pQbFdld1ZCNEFQSGZxUkFFdVJQek1uS0tvdlh3Y0YrdlZp?=
 =?utf-8?B?eFRDc3JoWEtRY1Q5ME5VVDlsWmRZU1dsa2Yvczg2SitFMVFIdGJUYjBGbUxw?=
 =?utf-8?B?UVJQUTlnZWw5blhPVlJrdmp5YnBjdDNHODROb3RlRjFsbDRabVpybTREVUpp?=
 =?utf-8?B?Qm1MMFlVMWZSMU04M2JlUGpER3U0SWdsU0JHWERLbk5nWXhTckFMNDU5SEN4?=
 =?utf-8?B?RVZJTE1KVVZENldPdFZNOExhR2drT1ZDNDcrQW9Ud3grY0NhRjllTEIxQUY2?=
 =?utf-8?B?b25SNWh1QTlPaUx2cFpaZVIvQ0hXVUxzZlZTT2dpUkxNclpRRExQNjB5em1h?=
 =?utf-8?B?L0dlaHZiL1ViWGpJKy9wSytycUFiS3RPRmlITVFSQXRiN2RsZU90YTliWGo2?=
 =?utf-8?B?bzNTN0FQb0JacXBOdStZODM1RGRrZjJpRDUxUnZRY1E4cnVFNmVPVWxodSts?=
 =?utf-8?B?OFp0OTVNUUN6dDJza2tHOHkwVmZHb2tLa0VudnlpS0NpRDRQdzdOeHQxMEpl?=
 =?utf-8?B?Z3A1NERPTWZtMFVFVXZPS3N2UVlUdncwbmZhMUxHOWgwOG9hL09RV0hCMjI3?=
 =?utf-8?B?YmNxZ0xLbStEZGloYWxQSEFzcHUyczJLVlNNS2FEeEUveEhyd2ZyM0h3MGNU?=
 =?utf-8?B?cG0zdWN4YzVaZjFLbWtDQUVscEoySzVjR05UbE5Ha2t3cFc5VkQwMGxBSTlN?=
 =?utf-8?B?MEp4eS9sNWpUaFgvUHpYTWJhb2dGbnZ3OWVzVGFqZmlYaFZsRWdONDZzVlZF?=
 =?utf-8?B?MUliSjN2VWVXa2gwRnA5NjFabU5KdjQ1UXRkWWU2d3QwS2RNRTNUUXkzVWVt?=
 =?utf-8?B?NFcxVVJJK2RnU09Gd2wzOXJUdGtrV2hMdlltWDZ3bVZuZnZkTHhnZExKNUk5?=
 =?utf-8?B?VzV4ZkVUdzl1MGxvekNDWTAwSE1NUVpKUDYyK1IySURyU3RsOE91S1pMUkNw?=
 =?utf-8?Q?nDOpWeGfM35v5fDZVDKTkiJV5VAIwmSVb3baJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d218c6-09e3-4604-57cd-08de4fdd10ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:13:22.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DnFvo/Nq2/DoZhJpyQQqbamDaRFyD6ri0mVilX8Onkh4HqQ5WY3XJuWNSGekZIQ0J60FMHQITviDpx80Ndxf3Eru7GXaUpG6VvZaxguNtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Thu, Jan 08, 2026 at 04:05:52AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add top-level System Controller initialization and cleanup:
>- SOC remapper region configuration
>- Mailbox initialization
>- Resource cleanup on driver unload
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_sysctrl.c | 70 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h | 13 ++++++
> 2 files changed, 83 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..8daab7703247
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,70 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+/**
>+ * DOC: System Controller (sysctrl)
>+ *
>+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
>+ * responsible for managing various low-level platform functions. Communication
>+ * between the driver and the System Controller occurs via a mailbox interface,
>+ * enabling the exchange of commands and responses.
>+ *
>+ * This module provides initialization routines and helper functions to interact
>+ * with the System Controller through the mailbox.
>+ */
>+
>+static void xe_sysctrl_fini(void *arg)
>+{
>+	struct xe_device *xe = arg;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init - Initialize System Controller subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for System Controller initialization, called from xe_device_probe.
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	if (!xe->soc_remapper.set_sysctrl_region)
>+		return -ENODEV;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
>+	if (ret)
>+		return ret;
>+
>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_init(sc);
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..ee7826fe4c98
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+struct xe_device;
>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif /* _XE_SYSCTRL_H_ */
>-- 
>2.43.0
>
