Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C303AD729E7
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 16:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD1F10E2AF;
	Fri, 29 Nov 2024 16:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8c+9xLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8830710E2AF
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732896327; x=1764432327;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LQM+cjy9eHaWTbNFUiZSsrh2ub6kGePA6GgWOU/tKgk=;
 b=N8c+9xLEuT4p5tY0WFOyxXPR4cxtZh/YJ+dkPNQEen6zbzcAXPxCBL+3
 A1tZ4npvtKPwUmqxeZA7hUPZuqhVpYHUm2FfUWoniM8Hi3ow9GtKTXJMD
 kpiq1ps0YdvwT6FQMv8Iu45qGnAulJsxuvev+EcielUDm89v04gg76lKQ
 4nNlYp/fDd43jLyoZ9YPMBNGifYYosd5S5MlKsU6RjL2UgwZoga3eVB6f
 Cu9l1Tk98sMqD1BYh4F31xsDmHDhUwk/WSAy9O7QDyqsZaA5lt9l4M2rp
 HmJSD3B21weYsM0GhaQcwdEYC9t6H81PXWQNBYTmzQWZ64d/1Z9ZJ1swD Q==;
X-CSE-ConnectionGUID: jurHQgJhQJGk5y/O8RsAZw==
X-CSE-MsgGUID: 7LEOFGw1RwOEV4kxa/5qmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44186342"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="44186342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:05:27 -0800
X-CSE-ConnectionGUID: I2NaRNSsQhavvxB7ptbLdg==
X-CSE-MsgGUID: /5vqfiynT8GolnrmpOvH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="92623870"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2024 08:05:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 29 Nov 2024 08:05:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Nov 2024 08:05:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 29 Nov 2024 08:05:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpkiBku0+i0FN87W7WBssFQMB27VkBm2qfl2/9LyFQskpdcrSiCA/aiCMP2aZbt4vzK3sUFXdKFupNkf5rSmdjqg8Eypf75O654eMCmQXjSTDOEj8vP/9gVK2WZUuzmQGirijryU4uiCtDJ0mcUcSSbXlMm5WINCT0VXpHBez9CIGipKMuSvKg43DJVvTa9ZWi/1yaorllkavcWPmsk7TfETUcAYASUn/JHH4LCIkxxgT5bPUiOS7kcKjPBgFejoOh2hhY8BvLKd4ByRVp3KjVGx/nSBhl/Anuy3eTQc3IAErB3tBhRWCgx+TRmjReb1BmJg9az73ujegMIW1nPnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQM+cjy9eHaWTbNFUiZSsrh2ub6kGePA6GgWOU/tKgk=;
 b=bUtvgt92mTzrM+B5glFrXvk6p4B/qW8b0J5s43zImKLxeT4F6AINbtYsBeKuqnwQ5oJ0rGvVdmgXa1c3sPQDqBTJg5LHaBT40kU+KWaEYtEzkE0UuAWlSmkZs4IKzirXVlWFV/f6d5JMLCOIsCwDpMwFM0vT91PvNZysC5RTC0scDlcYr78Se7keIyufkhNxYw8pfeC+3OvFE6ad0l57yyr/5klQUpc1HKcZelAJhS99C5E3l+rpHfgF/71OJ3+RbBsWWe1u19UCbKHI0FHkeOww5/58LCfK0RrYpGEzomEtqJy3xMYn668/ZuTFzDzqGBCxFSppUGjV/tOrrdflVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 16:05:22 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%6]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 16:05:21 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: unlock object in an error condition
Thread-Topic: [PATCH] drm/xe: unlock object in an error condition
Thread-Index: AQHbQdtmn1tUKuD/U0qlMMJW8aa3XbLN8BuAgAB82cA=
Date: Fri, 29 Nov 2024 16:05:21 +0000
Message-ID: <BYAPR11MB3159C54EC6F552119712AECF922A2@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20241128213408.1821171-1-oak.zeng@intel.com>
 <665583917e387e1cebc18a9c88fd8dd4f199f752.camel@linux.intel.com>
In-Reply-To: <665583917e387e1cebc18a9c88fd8dd4f199f752.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|IA1PR11MB6539:EE_
x-ms-office365-filtering-correlation-id: 02915812-993f-4404-ccf5-08dd108fa085
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVl1WXMySlRBOE1XUDQxMU53QXdHaUJNU0xHOXMxRjhTMmI1NWxibFVhQmZr?=
 =?utf-8?B?YjMwMm1IalprdEZSN0ZQaWdqTTRsWXNMQnJFZ3VBVEVOMVphOCt2Vkd5UWl3?=
 =?utf-8?B?QkxncmxtVmlWa21JTEk1VnU3RVp5QVJLUEU3U1JENXpDd3JScmc3ZEgwdUwr?=
 =?utf-8?B?K1RzWDlQN3lXdWp6Y3Nqc3MzcndxUUtPWCtpS1NHTWE2Q0VFc0ZHMVRCdHpN?=
 =?utf-8?B?ak1EVUdrMEN3Rmk1Uk1hLy9xeklaNHNKMlNGL1pQR0ZGOFlWdE9YUVZRSm80?=
 =?utf-8?B?SjdCVUYyZVhSL21peTRON2pDbnNCczVFRjh3WDVQM0FEUjN1c0FWcDJESGZt?=
 =?utf-8?B?T25aQmF0V1hFOGZiTEI1VWFqakMyMVJrenNhTkV0bUNHY01WbFV2aS9ibGhT?=
 =?utf-8?B?Sk5ESlp5RDRpQWdYUFcxeVMwS3lpaDNGeXUvbGNEUFRQV0FPaTFnaFlNQ043?=
 =?utf-8?B?S0lOSTVVSWZIYklFYXlYM2pieGFZQTNPUmtObGxVV3gyTUhzVzZKNHRHTmU5?=
 =?utf-8?B?MzQ4MWJVTW14Sno1UnF0WlFTOENyZWcxZnRGdEpYYk04V3Z5RXN6bnpFQmlG?=
 =?utf-8?B?a21FZTl5MHlscEYxS2pmeGhrcXNrK0g4NHYwMGJnalg2ZE4zS2dVNjZoYVhl?=
 =?utf-8?B?SkFTQ1lzT1RVTmNlNFdyaWpESVdhYllXNmZiK0VQTlcwNWhkVzZWVTNWU1RE?=
 =?utf-8?B?QTkvRzNuMlBlY2VrTm5yQkE2dDhwRFAxR1hOSmk5M2RJVWVERUVSNU5hbzVK?=
 =?utf-8?B?Y3gyK0JyUmVnOE9nRGN0bnQ3eHNRd29BbWt5ZStIUUZ5Q0NkL3BuOTBKamhH?=
 =?utf-8?B?SEZLTkh6R0dzbGdFV3EySWY3VTgrcUF2R1Q4R2E1ZUZBV3BzWlFEVll4aFVm?=
 =?utf-8?B?aEtIRnY3WWp6dDRibmZEMkJlNEhSaVFZS1NzVVdPZ3I0NzFVeC9vKzNZVlEx?=
 =?utf-8?B?bHV5a0xkdFFnT0czTVVHQmpTOWs4RXBPNkQzTlFlZ2dWZUVtdVhhNGZaY2JH?=
 =?utf-8?B?ZjBOY2RuTmtjeStEQldCT2lwandCSFhVaVliWFRBZEtFRnQ2SmtNU3dRcEVh?=
 =?utf-8?B?T2k5T0ZUblI2NFV0aFg1Umptcm1HUDAyUHhwZG5hZWg5czdObFpiSVR2ZmlI?=
 =?utf-8?B?RTFZL1hHbWpEY0NFOG1NY0hBTDY0Ry8xK1phUnlJRkkxS3BpNTU3SWFrTzRP?=
 =?utf-8?B?TXBTbnVMVldQTm5Va24vd3NwY3ZoQnBGVElaZFh2WDNSRUFnUTduSTRuYllC?=
 =?utf-8?B?K3VZTHA3dzJyM2lVNFljY3MrSHhxWmpzUmpJZ3ZGbVNOQlFOclg3SEdNcXFF?=
 =?utf-8?B?SmdyYjNJd0NiS3hxSWN0cmNWalhDS0FkdU9BK0VDZHpqZURsTk5BTlljNGdN?=
 =?utf-8?B?NndWK3VQRFVjcGtXbTdYaTRVN0NucnpBQi9rU2hLVzZQcTM5Q2pPenhVbG9k?=
 =?utf-8?B?TXo5SzcrVC9Zd25EVVRUNUtCTUJsYmsxM1ZhNUlHOHdmcnpDSGdRYVNGOXVz?=
 =?utf-8?B?NzNIa2ZTWGRMc2oxUEtTY0gyUUMvN3VqK2I4VGZROHJZdFhMWDF6SXF1VFl5?=
 =?utf-8?B?RSsvWW9ZYzNvSms4OGx0eWcxeTZUTFJnZDdtVG9vdW8xbEw1dE5UY2gvMlJ0?=
 =?utf-8?B?RGFEbURHMStXejhnYUhnaE4rQTI4bHlybjNYKzZ5Tk9lZHF5SEpHL2xDNDJB?=
 =?utf-8?B?dVVrR3lNOG1yZVZuSnU5YmhEc2pSbysyNGpaZlprSXJ0WG5HelZlYVJEQ0ta?=
 =?utf-8?B?enFGTGpDUFhCWnYzLzUwMjBmY3dTL250eEN1Z3RpVFBuYjdMcWE5Vy9MZzNa?=
 =?utf-8?B?UkQ0U0R6bGNSTjlzOVp1TTBtKzZaWkZHaXJZenl5cUU4U1dPTWkvREZMUEtK?=
 =?utf-8?B?d1BYZ0dUSTN3b3pZZGJvL2xyaGxqVlZDZHlodDUwb0VVdXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2pFbFFiWUsvQWwwMHdmSkF1R2FDQTBacjB5UVhsUGUyWHMvRVUxYmNvY2VJ?=
 =?utf-8?B?SWs1dklhODRNUG1zV3RVMnlUYzc5emJKUVZ1SkhEbjUwQTQ4Z1JwZk5ROTZY?=
 =?utf-8?B?eXNqNFVhR3hBZnNGQUpQc2twRkM1c2FaUEZsV21BbTE2RmsyMXVtekVaS1Zs?=
 =?utf-8?B?alFhMHVlM21oT09ld0dRcGdrNWhNUC93UzdyYTNYN1hyNjRneGlBZmkwQnZN?=
 =?utf-8?B?S2U5cmswREE3aU9lemFWd0V0bnQvSGVzVEw5MmYyWmNRanp0bDN0ZXVrVjI5?=
 =?utf-8?B?NE9KRm5NRFoxTitxS1YrQi9Xd2d1Szg3cjFwc0tTblhSdnhiM1h0VVl6R29v?=
 =?utf-8?B?NXBaMlRNQzUzMDQwWk1JYnRnQ2p2azFxUG9UckZCcDJsbnNVTnU0dTVxNlVL?=
 =?utf-8?B?QkJHWGEzbHA1N2FqSFh1b2cvdTVZQVdIK1lmUEJEeUNJNmhoby9TUGlYQW0v?=
 =?utf-8?B?RFdoU2tmUHM3VnA1RlNzblRXQi84aXBmSDBDKzNMRFJYODRDL2tEZDRnYlZm?=
 =?utf-8?B?ZDBVVTBGd2NJeUlCMlR3ekpQRUUvN09IZlpQRWNDSlJaQUxhcGkvWGQzcWF1?=
 =?utf-8?B?SHpsUERyTHREWTgrK0RFV1FCU1FzZzhmdHY0OXhoOWdRQVJURFhXUWlGY2tP?=
 =?utf-8?B?NDA5cndadE43T2xOSk1rQnhBMVFXQVNjS3NLRUg4ci9aN3BrQmtJNU9yazk2?=
 =?utf-8?B?N01DM20yUEJJYnZRTGtSWWlnQVp5UTJ4WHBwWi9MWDM1ci8yb0dHNkpFcHR0?=
 =?utf-8?B?OUJTa1M0VGN3cG05UW1ubmhnRW40ZE4rOFVVRXVIemhBb3A4WXl6dnozU1p1?=
 =?utf-8?B?ZjVySGJGRDVGWUVvUEFqYUZZOEVFbS9zNzNoWndEN1A4YjNqdXcxbFVlMWpQ?=
 =?utf-8?B?ZXkzdkREQVhxYndQU0tMMFd4WEx3RU54R3cwUGVvRnBLekFYQ0ZQU1VMYmxp?=
 =?utf-8?B?NGNJZFRWaWkzSGorc2JRbE1FOEExSjgrRDVTVkp3WisrQWUwZHp3dVdOSm1l?=
 =?utf-8?B?amFOSzZGR1lGOE5jTlA0SGZ1QkY5WUhXTThNU01rbFRQYnlkWDdTQXlOa2Vj?=
 =?utf-8?B?MEUrQmxWR2NNWVZQMVVUVGpiN0xRd3BTM3Y4cldPVVNxK0VRVThFRXYyNDZP?=
 =?utf-8?B?VFpVR2NDZ0Ywb09JRUc2aHM1VVo2Y3hFdTZOZ2NXNGlGWGRNNmtWTENZekNk?=
 =?utf-8?B?QlhlOGFRejZNVXFjY1VELy9LMENIQWMyajNmbXJ6bkYxYjFqcldwVlNVbmVZ?=
 =?utf-8?B?VERtY0szODhISDBGT09hbFNkSG0xL1NFV0YwL3l5RnFRR05sTFRrTmd5Y0RW?=
 =?utf-8?B?ZFc0L0JDVzQxUDZRSWFlWEkwdnRRU3FiczRYa1VGNUs0Y3FsaXB1WEo4TkNF?=
 =?utf-8?B?WGx2RmJGSXExaHJhcU5sSVFqeDRKVFBXeXlSd0dFWFlYVkcwaVpFV3dNbW5y?=
 =?utf-8?B?aTJrRkVWcktvdk5ON2ozbWFXaVhjNjVYZjBDYXZhaWF1L1dpZmQrYlVNS0xZ?=
 =?utf-8?B?eUZ3c0dxOHdKYVhRWjZoNHdzUldNRFZ1ajFIUjVvM3J6TWFSNEhkRmdPNFdj?=
 =?utf-8?B?YmE1d1VmWVNBZEloRHIvNHlQbXRYelYvK1lNcmRvd01qWEdqUUVhc3VIb3Nk?=
 =?utf-8?B?WHIvVW8zS0ZhZW4rdTI2V3gwcmJXRW5yN1NyZ2pCSUNheXZzN3dPOXE1Wnkw?=
 =?utf-8?B?WjZYU3ZMTzYvT0ZOcXRhK0NVRGRMbnlZTDYrMHF0NzlETk4vdHhDbDdzZkk3?=
 =?utf-8?B?UVVxYUpINjFuR0NxdHdVcXVidTNOZHZNWjhpR2hjeG43WThNV1dDNFdBVVRL?=
 =?utf-8?B?UXQ5WEVtYWpJMld1ZlAvSDJnOHRoTXdLTkVWOEt3ejBPcFIyZ2tKZE9JaDRr?=
 =?utf-8?B?M1pUcGM2S0VZLzIwbjJER0s0eFJsZTJKRDhoZTg2RU9LamtmOVFMSkt2bXlR?=
 =?utf-8?B?WDFZQ3FzazRFdDRMZFVtcTlCdnlHTy9aK251K3NUMHlqYkVvYW9MRkc4YW9m?=
 =?utf-8?B?WTVBMlhoazdnV0g3SUVWZUdOZTNHdlBsUi9hT0JSV1daa2t6dnNmZGJQVnVl?=
 =?utf-8?B?UStzVWJETHJyWU5BK2UwVGswRXExcVE1THRmWDMzakdZeEc5NmJ3c2dRdVFH?=
 =?utf-8?Q?VN7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02915812-993f-4404-ccf5-08dd108fa085
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 16:05:21.5618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0Zy41+Y0Vr9gydzD5xyvcdfW7r6ZRHcmhlc+tFnehaj+lSqcxsYLeWv6gtjpaysZwE+4e3drtEInFmxPlq0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBOb3ZlbWJlciAy
OSwgMjAyNCAzOjM3IEFNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
eGU6IHVubG9jayBvYmplY3QgaW4gYW4gZXJyb3IgY29uZGl0aW9uDQo+IA0KPiBIaSwgT2FrLA0K
PiANCj4gDQo+IE9uIFRodSwgMjAyNC0xMS0yOCBhdCAxNjozNCAtMDUwMCwgT2FrIFplbmcgd3Jv
dGU6DQo+ID4gSW4geGVfZ2VtX2ZhdWx0LCB3ZSByZXNlcnZlZCBhIGJ1ZmZlciBvYmplY3QgYnV0
IGRpZG4ndCB1bnJlc2VydmUNCj4gPiBpdCB1bmRlciBhbiBlcnJvciBjb25kaXRpb24uIFVucmVz
ZXJ2ZSBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDMgKyst
DQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IGluZGV4IGY1MWQ4NjUxMWNiOWUuLjYzNGExYjU0
Y2E2MGQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IEBAIC0xMjg2LDcgKzEyODYsNyBA
QCBzdGF0aWMgdm1fZmF1bHRfdCB4ZV9nZW1fZmF1bHQoc3RydWN0DQo+IHZtX2ZhdWx0DQo+ID4g
KnZtZikNCj4gPiDCoAl9DQo+ID4NCj4gPiDCoAlpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYm
ICEodm1mLT5mbGFncyAmDQo+ID4gRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKQ0KPiA+IC0JCWdv
dG8gb3V0Ow0KPiA+ICsJCWdvdG8gdW5sb2NrOw0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgbm90IGNv
cnJlY3QuIE9uIGZhdWx0IHJldHJpZXMsIHRoZSBkbWFfcmVzdiBsb2NrIGFuZCB0aGUNCj4gbW1h
cCBsb2NrIGlzIGFscmVhZHkgZHJvcHBlZCBieSB0aGUgdHRtIGhlbHBlcnMuIFRoaXMgd2VpcmQN
Cj4gY29uc3RydWN0DQo+IGlzIHRvIGFsbG93IHdhaXQgZm9yIGlvIG91dHNpZGUgd2lkZSBsb2Nr
cywgYW5kIHRoZW4gcmVzdGFydCB0aGUgZmF1bHQuDQoNCkkgc2VlLiBUaGFua3MgZm9yIHRoZSBl
eHBsYW5hdGlvbi4gDQoNCk9haw0KDQo+IA0KPiBTbyB0aGlzIHBhdGNoIGNhbiBiZSBkcm9wcGVk
Lg0KPiANCj4gVGhhbmtzLA0KPiBUaG9tYXMNCj4gDQo+IA0KPiANCj4gDQo+ID4gwqAJLyoNCj4g
PiDCoAkgKiB0dG1fYm9fdm1fcmVzZXJ2ZSgpIGFscmVhZHkgaGFzIGRtYV9yZXN2X2xvY2suDQo+
ID4gwqAJICovDQo+ID4gQEAgLTEyOTcsNiArMTI5Nyw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHhl
X2dlbV9mYXVsdChzdHJ1Y3QNCj4gdm1fZmF1bHQNCj4gPiAqdm1mKQ0KPiA+IMKgCQltdXRleF91
bmxvY2soJnhlLQ0KPiA+bWVtX2FjY2Vzcy52cmFtX3VzZXJmYXVsdC5sb2NrKTsNCj4gPiDCoAl9
DQo+ID4NCj4gPiArdW5sb2NrOg0KPiA+IMKgCWRtYV9yZXN2X3VubG9jayh0Ym8tPmJhc2UucmVz
dik7DQo+ID4gwqBvdXQ6DQo+ID4gwqAJaWYgKG5lZWRzX3JwbSkNCg0K
