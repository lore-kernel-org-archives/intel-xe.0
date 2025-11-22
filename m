Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBACFC522
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 18:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED75510E0AB;
	Sat, 22 Nov 2025 18:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdZPbZ2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A2910E0AB
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763837471; x=1795373471;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMhLrzX9hjhViotvSChhx5ZnoLsUXj2+4483/Kf1sak=;
 b=QdZPbZ2cFoTBKEc6G5fAek4R+7bni1IpXaGC+wQAiIqL+SV5YSHEsFt5
 +qCZGxebYMcfs/1zO4D07yJ71vbOmoQ8TXQ7Q3KbwqswkgXX58jn91Vww
 XpTBdaSjrVEYwizulWOxL9LnBYJKteNjgE1OVVTy6QzutpEdK/J1wu0B7
 XOEsuAsyoZYRcZk/dX9dVIcoP2iQLd6eAOYml+QEcnaoVtZpiStrVC0Hv
 Pug7uSPzN//1Hd6jCO0GMuro7jjXVo3UcrEqctHwZo0VvYpNE6iQm0RFH
 SZNTyrbhxXgFv9zZPftAIiXnrwEurYMIaWAmqLCzfL3MUw9V1GztoejEt w==;
X-CSE-ConnectionGUID: TXMdFYoJQCOhuxAZ0oSJmg==
X-CSE-MsgGUID: ZJPv6aonRjC5LembrTE+1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69756625"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="69756625"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:51:11 -0800
X-CSE-ConnectionGUID: tvBQ4KipSuOfXiB+JH+XMQ==
X-CSE-MsgGUID: 5t6qCDoxRFWk2KbGm/vJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196436838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:51:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:51:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:51:10 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/HDjKzzjpYPUhQFxwM5ilW7usTEvHQUA6QRlx8jzVwSQ4DEvspiYhwpEn6ByeimBlJ8kDOoESXRtYZK/avR/NxHhWAmsQZuGf8H6EU9ZZaxEFOZuzEwy+4Bd59RdNa6YClpVqne4BJFoDr1XwreXB/amvx3zSjTGmBzyoneBfdQ3BtxaoU2VRzmt4rgY3FjiDBe7voFP9KF96ny3qVbCEywycf62r3paM/og7//NEebc7uBFg0KqSoxf5aGFjgW/0c9c80O8xWRcdlK5fVuKyJjXDRTjUItO2yxUozI5DIssWf6+MotnIoSVOPyPXYU/DwdfzWSeFicGQCDNKH99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5x+PtzTG//1munJxAEXE0QYMrPvIq7rs3mK5Tv5tiM=;
 b=vwiIxpULQgGBjhek9KEVyazPkwBwtJPDn2OvSPecY/piZXjwMHkWkBHYCYAMpjiWctSDdRA4Y6L2rpSXMO/UF+50YKNAIj20dJV8/U/LEQJTXBorX7LjiHDW7JCL+O9rwkWAkRXyxSpHHr8F34Z32LwKvMqac0Jj2YxzLGJT8bpbVsQ7hnDWOM67SGEHlWzWdiCVGguOQzaioigDdiuymii4JDycc+nWQeTQyngKI5ZMS5hVx6kii+4sUNzmsq9O0tlTBLkrBfBqpV441rlJ9wFf1+z+lPfCTUD+u0YzuPMpRnbbA/s2y3pdardmae/PI+7UtEvU3oI1rB9sIsiAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 18:51:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:51:08 +0000
Message-ID: <fafda0d3-463b-4c1d-afe1-4b84871ee8ed@intel.com>
Date: Sat, 22 Nov 2025 19:51:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-8-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251122045803.3616201-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: d8caf9f1-82a4-4647-20cd-08de29f818e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXJJSEVSSDQyb0F5eFJJbTZGUHBNVFhLV0xBcTRUdGdlcFpWT3dGL0N4MVNS?=
 =?utf-8?B?emozNjA1STlBNlhTSFFFSUt0elFXYkxRZEhmdktPRUdIUWhDVHNQN1pwTytQ?=
 =?utf-8?B?M0NjUCtqL1NMTTZ3azY1dVRWZTVJN2dsenQ2NXp2RkJldGNraGN0aXQ4d1RU?=
 =?utf-8?B?cEhvbjhxRTQyOEhXT0MvdUtDSzdQb3pITEZRbWIyNmJ2THhRVFdsbVhsZmdr?=
 =?utf-8?B?cG5YbDA0ZldUYUhPc2IzanlVNjl5eVFRMGI3SW92WnhzMUNRUThRbHVRbUdq?=
 =?utf-8?B?aFF0WEhmVnRtdjI2MXNxSFU2VVhxY01HLzBaektoanNBN2pBTjNJb09GR0tx?=
 =?utf-8?B?NzUzVEM3SEFzWHZlTXhSVnBvaXBTZStidEs2TkRhdEpWbFJSeTh6NFhEcnhy?=
 =?utf-8?B?MStNZDc0ZUcralpqRzZZZDc4RThzeS9teE05SXhEWEJ5ZHdkNUlJLzcxVGQw?=
 =?utf-8?B?OEtnVm5Hak9OeHBOTTFtRWFqQjNXZGFEaEFxZERzeHNjLzhiNHJqajhPWkox?=
 =?utf-8?B?UkJ0aG41YzQ3RS9pZk5wWXA3QkthUFRESTJ1SWdSby9zcFpqYTZKVzNCdjMw?=
 =?utf-8?B?dW0zYmFPbk55ekJyNVJUdGtXaWpTQmEvZGtHOFEzZC80MWlabDZZUEcvTGNx?=
 =?utf-8?B?cktJdWtjSjNBOTVXS3JOK2ZRZytyRm14S1VVV29iSXVOVXRKc2FmckJOaTFZ?=
 =?utf-8?B?SURsQ2h5TENEUjBzY0ZqN3FDbytBbzRwNVYrLzRxZGVkRnRWN1Z2ZHM5cC9D?=
 =?utf-8?B?ZGQ5WVYxWXN5Ni9FdW9sQkdIZzltWFRXL1ZJR0tNUlpIVUlzRGRzMDJ6WW5W?=
 =?utf-8?B?VHdFZnNHK0ZlaDFoMG5Fa3h0RXJjZStNdkM2cVRFUEZtc2NzakFVZWhUSkdD?=
 =?utf-8?B?WmNSZjhqem1nNDZVRXU4V3ZIc010Q2RPZWM1M1BEcUE0TTY4YlMzbHpybG9G?=
 =?utf-8?B?ckUxWGlwaWsxb1dOMXpHZmg1MHV0T1krUyticUlyOU1lM3Z4SUFESXQ1RjdH?=
 =?utf-8?B?cGJ5T255S2Zja1cvUlhlTmY3dmZuUE94ZHZtSUVabTNKNlo0RDBBK1MzNnJS?=
 =?utf-8?B?NXNNa2xJczR3bmNvd3lrVnVLdnh4Z0l0Ykk5UG5ueG1UV3drOVpNZUJNZVc3?=
 =?utf-8?B?MzZGdTQvUlFTSXlCSkV2UDJmOEVhbkhzemI1T1UrbEp1UGVoUnF3SmxIRkY4?=
 =?utf-8?B?Q3J5SlVQTDFrZFNqbk96YmVvRGRJcWNjSWU0dTNjZnpQck1oUnVRWVVaMTBs?=
 =?utf-8?B?OFREOWJkcjJVVHJPUGtOM1lrVUVSODhwcTVxZUxwbFVSaCtqOFdMZklTMmd3?=
 =?utf-8?B?UGFlUU0rdEdEUVFtSUxwNXFFcEtHcDBjbFIyRHN5SlRzVmUvRlcySTJZRkEr?=
 =?utf-8?B?N1lCOXZ1TWRJTU1GOGlsZjJmR2JzdEVBSG9UR285STNEVUVNQWZKdXE1UU5n?=
 =?utf-8?B?aFd2VHZ2amxYWHlYcnBmLyt6OStSOVVjd09JYlR1dGZaRDBYNUZzU3ZkSW5P?=
 =?utf-8?B?M3RxU0xtUlh5eVRJZ2U0aGhwY2RDbTlKSUx4d01ESkdTVDVQcXdPWWgwcm80?=
 =?utf-8?B?SXRVRU9lY1ZIUnR5VGQxaFplaGpIbEtnZEpuQ2dnNHZPSFBydDNGVUx6ZzNa?=
 =?utf-8?B?dG9ETkpEaThtbTRMYnVtNlp3enBka3ZMMFEzRFJ0bGlHa2JwZVlYeGR5NzZ5?=
 =?utf-8?B?cnhSM1BpWTRtaE5kNzZTdmdCNWxFQUk4dXo1ZFdZaTdibyt5QXpHMk44b0xi?=
 =?utf-8?B?QlpRaTFVNjR4UlY4czFLay9SWDJsY0YxQmpIV1J5ZjZSS2hqK2g3YUlzcFhV?=
 =?utf-8?B?cFVza2RGTHVleGZCZkV4M1ZvcTdGZU9FbkY1alpnMGVQZlVOV24yRm56RHdB?=
 =?utf-8?B?Qkp1a2EvclhaVVExaXo1bWhpcmpYOTFVWlUwc241SkQybWV0cXd4NVJZSzVD?=
 =?utf-8?Q?EDBrK+bL/7O1dC7N378s1YRo3oZbrRh/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VhR05HcXg1ZHBuMU4yNk40eGhYam5aeS9yck8ra0tJVzNxZmNId0tsc0Rm?=
 =?utf-8?B?djVndXRDNmg0dzl6VzJFREY4ODFJWjJRaHhTQm1LN2RYMnF0ZDh3OFNyY0k3?=
 =?utf-8?B?cmxNc3daZWNUeEJLdUN2MXBqWXhPcnRPeTU4NVdXekJ1bEp0RDZVTUFUOVhu?=
 =?utf-8?B?ZnBVUlNoVzAyQy9tMUUwVjU3V255WlJzSlM2cDRWQjQ1Yk5IK2wwcFlma2Nj?=
 =?utf-8?B?Rk1jcTg5eXkvYzU2ZzVPcG40aEJYVk9rMUU1d01BZ00yL0dhSm1hbi94bkNB?=
 =?utf-8?B?ODByNVVrTFNUdEY0U2kyM1pHMVVyVlMwd1JlKzh1YXE4dGtJTU1iNWhoMEFh?=
 =?utf-8?B?VS9EejBMNmJjTXJBU3hwOU5oRWpFRWh2UTc4RVZtT2RVRUVuTlZwUmdSeVZh?=
 =?utf-8?B?WTR1cVlCRFhiNEd1V090N2h1QzVScC9hTnNkQ3UwSnVZL2RJRWVqYUYxYzRz?=
 =?utf-8?B?QXNtMng1TFhNcE9HZDBwdnVHOHZGT203RE9nNTV5akJlQU05akg2TDZzVDBJ?=
 =?utf-8?B?VDJKQkhtQjVRNG82U3Q3ZGl3VGFkZUFLNWhIbldmc0dkOWZYVWV3RC9TUFdy?=
 =?utf-8?B?c3RiQ3NWQWx2aGxkY1F0L3pKVGxMUzl3YTZCcUxHUmp0b2ZqaFV2eGpGY2pY?=
 =?utf-8?B?V0htTGVKakF1ZDk3RkczWENKVDFMSHhQQW5uNDNGc0xuckRuK1pobnVsVnVj?=
 =?utf-8?B?UURYVEM3ZGdzbDFQZkVya3BDNDNmU2VuMmFtdjJkem81Qk4wbmxXUi9xWUg0?=
 =?utf-8?B?TDUwNzVHSS9pc2Zpd01GNGNPS2tqRWNsL09oSXJSMFVVb1JqREJGbTl5Rllt?=
 =?utf-8?B?bEpuK2lxbWl3eGNSSWtNMnF4S0JoNmxhT1V2ZVZHU3oyaHpvTUEvRlNnazI4?=
 =?utf-8?B?aDdjUHd0TzgwcTdVNHUyc3BQR2ZNMG1sSHN0RzhYMDc2OXBETHEybXZhbndJ?=
 =?utf-8?B?Rmh4M21PZXVJNkNnME1ZSVJUQ2hqLzVLY1ZUM0lOK2JteEdwOUJCZGE5OTBw?=
 =?utf-8?B?V2thNUhOYjZiUy9OcC9LZkNZa2xzRXlzeTlRRGhMdkJZbWtvaFp5LzB4N2pB?=
 =?utf-8?B?K3RNRW1MSlkvZTVJQlQvbXY2K0oydm0yYWZJK3hDbEVISkw4NzRFMWtrRVY0?=
 =?utf-8?B?TkhDOGk2aUVRUEI1RjVyZGxOWnNPNlN2cE5WaGdqblhOSXlrd2JQZytjWjFC?=
 =?utf-8?B?TFY2cnRJMXRybW5TYXZvekxZbjE4QWZDcnk5WEc3dDBaekZyM3hqQlA3ODhp?=
 =?utf-8?B?endGL3hhdXRTYlg2ZTNHYndJMWJOTkljenFQNU1BREFueTlQV3ZDdGNpTm1V?=
 =?utf-8?B?S2Zsb245WXZsOUh4VStFaVk0K1BTbGY1bFR5NDhJWlIwaFZEWThxNWtqa2w5?=
 =?utf-8?B?YjlPMWhZbWRGdlhiaVBSdUlhV2RqQ2xlcERzTTNOZlRpSmZlYllEK2RGa0Zo?=
 =?utf-8?B?Z0h5bU9HZ0tablQ2bGlHT3BKUzJHNnBrQW43aTlDYU93dmRleTlyMTFNT2hx?=
 =?utf-8?B?UGVESGFmYnp0YmlqSnU4VUkvWTY4RFh3S1pTNFVqb29obStMNHMvZlk0ak1n?=
 =?utf-8?B?My84VmZjQ0VIS1A5VGJ2RDRxaVJhVkhUVFJUMjViZTEvL0pYTjlpRlUrSGIx?=
 =?utf-8?B?Z3N3MlNhY005RFFseS9kMkNwbGViZFBPdGQrb2hlT3FNT0pLT29nUnB3NUJ0?=
 =?utf-8?B?S2liLytDZnB1UmdYUUswRTR4aHVOWk1BUzhNMlhTQStFVU1GYVdNNFNGcE82?=
 =?utf-8?B?WUd3ZG14MXJXL2JOZktVcm9JSzhkTXB0eWd0cm9SempkNmx3QVpQS2loM0Yx?=
 =?utf-8?B?Zzd5Tm5USkpaNXZMc09kQ1Q3NjFhVnoyWGFIZ2crbWIzVGw3TER5Ymw2eWNH?=
 =?utf-8?B?VXZhbmJNS3BDTzBIa0tSSmFmOHl5dWlxUWtGaFQ5czgwVVZNUkVCbm8xMEli?=
 =?utf-8?B?OU5rOXR0c2lkODZGMnQ4anBXRHlLdXZYL1RoczdlRG9ocXFUcWxTQXBhYVp6?=
 =?utf-8?B?R0JmRlFEVjVSaDkwaTNWVjNuYXV0cFZpVzhkdVdNYVNBRFJ5djUzc242Q3NZ?=
 =?utf-8?B?TzRLMzh1UjF2dG0xU1J3dmJkMUY1cW9rVWlWYlA0L2R3cjUrSGdYVzk1Z0pm?=
 =?utf-8?B?dlg4ZlU1QjYvY0pnajM3T01TSXNhUGFqZ1lscDJxNmhUazg3dnVnQUYreVpP?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8caf9f1-82a4-4647-20cd-08de29f818e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:51:08.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teFxmXBr9uNmJFUQ562G01TEhHLM3R6CpO+y8G2v4kK0Z1fKg1kH6HjDNAYjhYlszr3nfU2TG+5ZVA5GNagIEk5c8No/ehVlsra7Wefn4NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
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



On 11/22/2025 5:58 AM, Anoop, Vijay wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> SoC remapper is used to map different HW functions in the SoC to their
> respective drivers. Initialize SoC remapper during driver load.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_soc_remapper.c | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_soc_remapper.h | 15 +++++++++++++++
>  5 files changed, 42 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1a3aa041820d..7ebfbf9051bf 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> +	xe_soc_remapper.o \

please keep .o in alphabetical order

>  	xe_ring_ops.o \
>  	xe_rtp.o \
>  	xe_sa.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..f15489c100af 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_soc_remapper.h"

please keep includes in alphabetical order

>  #include "xe_shrinker.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
> @@ -906,6 +907,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_nvm_init(xe);
>  
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_heci_gsc_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0b2fa7c56d38..4d23b75bc728 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -552,6 +552,12 @@ struct xe_device {
>  		struct mutex lock;
>  	} pmt;
>  
> +	/* @soc_remapper: SoC remapper object */

use proper kernel-doc format

	/** @soc_remapper: ...

> +	struct {
> +		/* Serialize access to SoC Remapper's index registers */

use proper kernel-doc format

		/** @soc_remapper.lock: ...

> +		spinlock_t lock;
> +	} soc_remapper;
> +
>  	/**
>  	 * @pm_callback_task: Track the active task that is running in either
>  	 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> new file mode 100644
> index 000000000000..f5a02abd6ab1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/spinlock.h>

likely not need, try instead:

   #include "xe_device_types.h"

> +
> +#include "xe_soc_remapper.h"
> +
> +int xe_soc_remapper_init(struct xe_device *xe)
> +{
> +	spin_lock_init(&xe->soc_remapper.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> new file mode 100644
> index 000000000000..3cfd44f1fd74
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SOC_REMAPPER_H_
> +#define _XE_SOC_REMAPPER_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_device_types.h"

we don't need full include here, use forward declaration instead:

struct xe_device;

> +
> +int xe_soc_remapper_init(struct xe_device *xe);
> +
> +#endif

