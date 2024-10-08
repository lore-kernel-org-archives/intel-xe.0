Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC05CEFC22
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 15:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CAA10E0F2;
	Tue,  8 Oct 2024 15:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEsf2QL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1810E0F2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728400428; x=1759936428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KTyaoY9E9XewZpaY1DOWxqA3YHkJEzK+hyNUjTu7jPo=;
 b=CEsf2QL7Hx2cNWnVqEG6tug0u2vd7clB0zV2/haUKtfnsughWwC7caKH
 cPu/pQsxCgn4bXBy7P4fMniElFBEBaUXegy7dzBBrwBg0sS6p33CQwAV6
 BP2uCVdxETvkFXCNDX33TmPRpVrA+Hm7fTdtRCbzhjEei/g884gVjEM9N
 ORREkgGx7FzzN9IZTbW43Kd4cSZvu3YZKjUFW3XbwHUZPUoyX0Pc/I0lD
 tF1ENv2nuQxBpiaWq1oLo63SxpQWpdXCnx66KD+u6sy1d6xnw7uVvO+3Z
 J1eplMIN78K+zIVWZfMJeW9IrjqH62jsHoqMwdsDOUbxnd+uHwjzstJ2R g==;
X-CSE-ConnectionGUID: J5SjVgImRueSKd6q5N7yew==
X-CSE-MsgGUID: C8PkrUQ7SYSgj6kfzH7GSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27729513"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27729513"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 08:13:27 -0700
X-CSE-ConnectionGUID: bVWldbHKRiOzd9i2l/YHGw==
X-CSE-MsgGUID: vXjVjpUaTDuUwL30MnbjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="99200363"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 08:13:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:13:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:13:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 08:13:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 08:13:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO9+BUP7szslLCZB9JAU8Z6hXeEgxJn2EyXYmpjBA+J/RKV4hE/WR8KP2/KsupUcUQzHW/b9Odlb8X84iI6QiTwvb2tYn9NfXwiH/5I6hiA5vDbwxxny7okGQXBDsOvQtI5utM0THVttfvgS/57dgErlh0kamAZv9JSlFhd1qVdqqgdhueff4zZtB4J3e5PCdYx2bZK3NMEL2zP0wf+TiLTsfH91Fq1/KjWMeUJ1W4HAN/iJEmPayrjEI5y1rGvUTYw5W6xGFvQ1e/QVMcLHklFpgSQ8tjnaRNYeJl8eIxyLUWOhYmuUOegeZALh+KhgfeAEt3DPZsrHRINH7w7/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhIKh8Vyn//IF4XUg3S51xBSSIDILrUusxw3UEr0kCc=;
 b=DC75bHhsfxBHopABWlYrh+4xNqqdN1B+27kqyb07MYPiNLz8nGB5rKIdwuFlpG0TXrtCf5tUTLevjhz+mh5dJsFTEdQUgLN61tzQaabc7kuxntz2mfRm6zxNfqy+LA1oL+/VvMaNua8kEeMRPWUBXE5rvwO7gUI+Y+dAt3IAaP0IX9+cCZupZsaKVU3fHpoExUqSvqCy/Mt8nYo10n+/STceSl45K4WbEVOohzYWm4kGFs17WBv6ae3pMJxfp9QcJxIMK23Z9CEqcJ2DmdrU2hW3sGnVpPiXUYa105FdR8BdrDaSzJjBtIMr0evHQdsbyAzKWr5a8kDD8adE5U2dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 15:13:20 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 15:13:20 +0000
Message-ID: <314a34d6-b955-457b-951f-18720bcf8672@intel.com>
Date: Tue, 8 Oct 2024 20:43:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/26] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-5-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fe5552-7337-4c8c-f3bf-08dce7abbe66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODJjZFhEeEh6VmNyWVBRaEJBYkRDTnlKYW1JdnhKOHFnb2N1dXhiclZreW5j?=
 =?utf-8?B?SzMrRGp0Tzg4RThPNzhrWjJvWmVOV254WUdaSXpKdXdDSWtDb0l0Lys4SkV4?=
 =?utf-8?B?c1VzbkUrWW1BdGdOYVppQ1dDMXJ4OVRjK3FUNk1rem5rOFJ3aFVzSExFQW5Y?=
 =?utf-8?B?VGY0ZnJGaFRETTFNQnl4bVhadnBRWEFvQzdkWXBLUVkwR3VEazVQa2NBZktq?=
 =?utf-8?B?UmNRNUY4OUNnZ3NUVG0zaExZQkl0U29VbWxsc2x1WHV3ZVNwQUxRYzcySmM3?=
 =?utf-8?B?eWZLQ05yaHBKSHdsQU1aMW93V09sQWxOR1NWNWpadlQyOW13Mzc4dnRvZEly?=
 =?utf-8?B?NUxCN0E5c1c0QTVQdmMvRlV4ekhUV0xNMFpCSGtVY3ZzU1dlS0VQSy9YNHhn?=
 =?utf-8?B?MFpsVGxNR3Z2VlE0SUduQStVUE84aGZkcDNPclpMTlh5UFluR3Q5NDd5WVlG?=
 =?utf-8?B?Umk4MEFRWnFBOTcyQ0ExVTd3dzd2ZG04VzdvT2JYM1lsVHdVbW51L0ZWWkhZ?=
 =?utf-8?B?dWNHUEh6clJwWnAzU2lOaVJWSzlYV1cxRFBjQjRXa0FKY0taVjFtOU9uRkVv?=
 =?utf-8?B?YUxyekxJUVJtcXhXUzYvVG9RdVVaMnM1MGdENzhxT2NIWFNNV1p3ZTQ5Z2s2?=
 =?utf-8?B?ZTZseW1GWGluVXFqYk1aNmtCQUQxbUNhaFdjTnhOcGlrQmF3eXd2SjNPZU92?=
 =?utf-8?B?NXNTYVJzYXpHOHFJUURZeE9MVXBzZzdnSFF3UnVjeUM5Yko1Y1BpS2dUVlk4?=
 =?utf-8?B?cTE5Y1Z6a3BrZnZBSTBEcGZ5aVY5Zy95ejdjQlVTQ2lXNmM4TE1aSEJsblF1?=
 =?utf-8?B?SUUrb1FlUCsvellIcVFQQjIvSU4rbUFwM3RmSDB3dkIwaEJNeFlxTzYwUWsz?=
 =?utf-8?B?UitzYTNXTkk0NkFTSnpMb1h6VUxxSWpkVXB1bjF2MmNoaEt2YXlib0dFZWg4?=
 =?utf-8?B?RVZjeWQ0QnpQT3VlQ2E2Z2NPWE9laDk5VklBcGFkdmVOSG1hSHJwdG9QaS9v?=
 =?utf-8?B?K3EydC9vbnRTS1JLUkdycEYySEgzQUFQQktvRTZ5UmNJNGdVTXc4Vm9MZTR6?=
 =?utf-8?B?VVhmN1YraVMvOWJscW9OMFJVQmprN04wdWttc2d3bkNtZG9JWWh4a3YrNHIy?=
 =?utf-8?B?VUppV1kxL3NkelI2ZGdKYXBuRjZzdXNWSGtpVW8rL3BoSVFiRkx2VjhtblFJ?=
 =?utf-8?B?ck5WUG5ja1loUjQ2OVJtRnljSjdRMzk2NHhVbXM2WlhEN1ZxVjYzQnNaYmEz?=
 =?utf-8?B?QVFmdXAxei9nWkYzWllBMldMTlFoVWN6eFI4VEtVcmlyNEg3U0hxTWJ3a2tE?=
 =?utf-8?B?TVBIQ3gwZ3JjdEp3SFhlSTJlQlZXSHB4eVdpMDJKZldpOEhUaDdGaml5QVVM?=
 =?utf-8?B?YlN4UG5scHNuVFpMVXVKQmhuYkxPNFU2YmFadDc4OWhINmdFcWV6eUlhUUd1?=
 =?utf-8?B?YzNpY1JJU3I4UDZyYXllZjVib1ZDejRqTTdPUGdPZDBUemY2V3ArMFBWbFBO?=
 =?utf-8?B?d2ZSZFh5dkNGd21WZE1DMTRBZ1VYRlBoN0R3b1d4YXdLdUJja2JiN20zbndk?=
 =?utf-8?B?Y1E0VThGTTMwRHcrV1cyUFA3Z2xTYWgyRlRsRTNMMWhNQnVZQkRROUx1V3NE?=
 =?utf-8?B?WTdoRkhOT1JIQlMxQUJYRkMyRmJuT250L3NGWGg2ckFMaktFTWN1Vk9JVHhE?=
 =?utf-8?B?RGl3WVNYV3ZZVUZJUjNiVWgreTJGUlFlWUZ5eHZWblozT21yOVBPc0ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tBajBBZjJRNGhXZ3NMTEJCb0FRV2o3NThmbGtUZUlyd3cxQk5YMTZxUHIx?=
 =?utf-8?B?Q2lpUnc5ZURzUExSb0oxSDRpRitaNmRla2kvWVMxd3BSVDdEdzc4UDdRdyto?=
 =?utf-8?B?NW1mQ2JMdWVrcnV3N0J2QkVadHpPeWJsUkZ3QklNbDZ1Znl1Zm1kN0doTXZr?=
 =?utf-8?B?TVhhZjdyczFKODhjNjFMZE45NEY2NTgrRzFPeFVkSmt2bHR6TTZrN1R1NzY4?=
 =?utf-8?B?cTBxMXZ0SkxiL09MaU9mMUZ4OXB0a3I4RUcxYncvVllWVnhTbEtvMGVkcVZw?=
 =?utf-8?B?SHFYaG96ZlpXODdDb3JpMnhPWU9PRlpqbVlFQlp2WWJPRnh5YjdTck5ETnUv?=
 =?utf-8?B?VTJJMmF1ay9TeVhwYno1cGNlZ3ZIWUdJMCszRUlTeXZtSUVNRGQ2RkVtTUxP?=
 =?utf-8?B?YUZDbXJ4Qmx5b3NzdGo2ZHNINVhPckl4L2kwNmNDZlJ3dnZaV3pHWGNIY0Z4?=
 =?utf-8?B?Q204T3ZvT252bVNZaUY0UzRXakxBM3Z1NHBYZXdpREVyTzc1QWhCWUo2WWZB?=
 =?utf-8?B?Z3NRaStWdUpHMnlaZ21WWEFhN1Q4RTdGWHhkS09MZHo3YWUrVDZBK3poRTBy?=
 =?utf-8?B?dmNGN0xSQnFvdXAwYjJMd2VaOXJZUFpWQTJtMHRIZUp4MFdjL2N4czE2V2Vw?=
 =?utf-8?B?UFFiU3ByamdRTkZMTWc5WVhQekF0SzhzUmNoZzl1eWY2eUdNcTNpbDcrbWds?=
 =?utf-8?B?c1lQRzJmYkgxRDVNTVpMVk9aRVRoRnkzaGcrbVBDZmVhaHcxaXFwOWNXWnND?=
 =?utf-8?B?OUZJMW43WEZLTGZyZFdkM1NUM3ZOWGw4ZFdzZGJjR0FsOVlNUGQwaU5VN2dm?=
 =?utf-8?B?R1VhQkIwM3hPejNRNXZWbkZMMEE3aVB2M01YeklkUk5lc2lRd2U3ZU13cnc1?=
 =?utf-8?B?cW9tQWUxaG1lMkx0amZzeC9tQjc4cnNHNHFIb0RnWUN0eS83c1B6M3ZvTG45?=
 =?utf-8?B?dlE5ZlFTM1JtWEswQ1E3enZDelozQmtIMzV3djNtWWlSUzRwWmk3MWtSdzA4?=
 =?utf-8?B?eWtHM2cyOUVCKzhkVVdKT0JNaGZsb2FGQUVveGtybzFoS2JSVzB3ZnphcVYw?=
 =?utf-8?B?am1SQkFuSTdtRlVrTVBlRFZHK25hb21tRE5FV2ovaC9KOVBqbjROWndUeDFF?=
 =?utf-8?B?V1pIRktjcnJpc0s2T3NFUUJWQTI3MENmeVl4WHhWUXF0dUc0MHFiMmZuMFdQ?=
 =?utf-8?B?RXlGd3FMM29tWnZWQVF2NXBPK2g0bDJCejVFTFZvbVdoYTR4VENWR2EzbnlE?=
 =?utf-8?B?Wm9VTk1jWVRNeVBoUXhudDQxTGsrMEJBTmlobVcvQXhsdTFoeWcrRjFJOWdl?=
 =?utf-8?B?bzF6WXRoajk4NEdzdU9RVGU5N1lsYmdFUnhHZU1rcldHYjBjeVNJbzlsYnYx?=
 =?utf-8?B?OXhCbjN5OUtYVkRDdXYvZ2EyTmF5c0lhZ1NFbEVwb0xnQ2lMWWE5L3NCQ2Vo?=
 =?utf-8?B?ZUwzTUFFamwxSmRGbnErQXR0QjdYb20wYk5ZamhrVXNZNVo3M0xUajMrMnJx?=
 =?utf-8?B?K1RCMlB6Q1VEVkhLS1czZi8xdW1La1QyeHhJK0xvWGtReS96dW1oYlowc0Jn?=
 =?utf-8?B?YUhyQnQyQkpKTXBmeUw0UnRmU0tuRWVyczZqWmRHQWk1aGw5MUhrcDRQNngz?=
 =?utf-8?B?bm85OHZoMVo5ckFhM3FIYi93QW83cGFyTld4bjJVSkdFU3I4TGtjR2xOenJY?=
 =?utf-8?B?V3BVS1RxekJSTDl2bmZ4UDRqSjJFSWE4T0xZS29BNDc2bk9ER0hRQk5xM2Vj?=
 =?utf-8?B?U3g5T1dyQm90V21rZVJsU0RsdlFpU3YrOE5tNFFpbWk0QXZ3aVg4ZVIrajM3?=
 =?utf-8?B?ZGlLUSs3anBBVG4vbzVSNGxnck9nQzQ0NW1ZWDkrOVhjTVdZb25zd3M5YzdB?=
 =?utf-8?B?UGIybHNvWXRDT25NZ0lzSzdnaDdrbW5vVEtlNkkzb1VSc3pHTThHNFhWNWlw?=
 =?utf-8?B?b3JjNXhub280Y1RwQkFjWkM4S3IyUTBRVU5raEJ5dWlPTUQvQ2VIbTVHSFJ5?=
 =?utf-8?B?cnYvT0dwdXo2ZmUzODZ1RVN2L2ZYY05xRnAvWG9TeGl6N0IrcUorc1lKSEQv?=
 =?utf-8?B?Qjl0LzhDMWIzT21iS2M4eVRDRHZ6ckpTdzh6c0V6ZGtOOGkvYWxod3BtWkxV?=
 =?utf-8?B?cXhrSU5aV01BVHZNcGpsbXRwVVhWRlV1TWQrRkR6MEVEblFzRzJVbnpBWHdI?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fe5552-7337-4c8c-f3bf-08dce7abbe66
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 15:13:20.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx0gg6sGfnpZbX9Z6JoLIVw41bTu8pOCHjL94Zph5Nku3f7cQ7YjlNGj3vPRBTRfXFq7/pgP8qA+T+uZxCY/dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a forcewake domain awake
> request, do not increment the reference count for the domain. This
> ensures that subsequent _get calls do not incorrectly assume the domain
> is awake. The return value is a mask of domains that got refcounted,
> and these domains need to be provided for subsequent xe_force_wake_put
> call.
> 
> While at it, add simple kernel-doc for xe_force_wake_get()
> 
> v3
> - Use explicit type for mask (Michal/Badal)
> - Improve kernel-doc (Michal)
> - Use unsigned int instead of abusing enum (Michal)
> 
> v5
> - Use unsigned int for return (MattB/Badal/Rodrigo)
> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
> 
> v6
> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
> actually refcounted domains in return. (Michal)
> - Modify commit message and warn message (Badal)
> - Remove unnecessary information in kernel-doc (Michal)
> 
> v7
> - Add assert condition for valid input domains (Badal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c       | 53 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_force_wake.h       |  4 +-
>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>   3 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index ac0419da7173..bfba276c48ac 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -154,29 +154,62 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   					 (ffs(tmp__) - 1))) && \
>   					 domain__->reg_ctl.addr)
>   
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +/**
> + * xe_force_wake_get() : Increase the domain refcount
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * This function takes references for the input @domains and wakes them if
> + * they are asleep.If requested domain is XE_FORCEWAKE_ALL then only
> + * applicable/initialized domains will be considered for refcount and it is
> + * a caller responsibilty to check returned ref if it includes any specific
> + * domain by using xe_force_wake_ref_has_domain() function. caller must call
> + * xe_force_wake_put() function to decrease incremented refcounts.
> + *
> + * Return: opaque reference to woken domains or zero if none of requested
> + * domains were awake.
> + */
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
> +	unsigned int tmp, ref_rqst;
>   	unsigned long flags;
> -	int ret = 0;
> +
> +	xe_gt_assert(gt, is_power_of_2(domains) && domains <= XE_FORCEWAKE_ALL);
> +
> +	if (domains != XE_FORCEWAKE_ALL) {
> +		xe_gt_assert(gt, fw->initialized_domains & domains);
> +		ref_rqst = domains;

Patch looks good to me. Please feel free to retain my RB.

Regards,
Badal

> +	} else {
> +		ref_rqst = fw->initialized_domains;
> +	}
>   
>   	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>   		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>   			domain_wake(gt, domain);
>   		}
> +		ref_incr |= BIT(domain->id);
>   	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);
> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0) {
> +			fw->awake_domains |= BIT(domain->id);
> +		} else {
> +			awake_failed |= BIT(domain->id);
> +			--domain->ref;
> +		}
>   	}
> -	fw->awake_domains |= woken;
> +	ref_incr &= ~awake_failed;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret;
> +	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
> +		   str_plural(hweight_long(awake_failed)), awake_failed);
> +
> +	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;
>   }
>   
>   int xe_force_wake_put(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 1608a55edc84..75fa1a19797c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>   			   struct xe_force_wake *fw);
>   void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains);
>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains);
>   
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index fde17dc3d01e..899fbbcb3ea9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>   	XE_FW_MEDIA_VEBOX2	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>   	XE_FW_MEDIA_VEBOX3	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>   	XE_FW_GSC		= BIT(XE_FW_DOMAIN_ID_GSC),
> -	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT) - 1
> +	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>   };
>   
>   /**

