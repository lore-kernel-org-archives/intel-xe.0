Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61316E9B265
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2512510E5A0;
	Tue, 24 Feb 2026 13:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkyRUg3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED4610E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941284; x=1803477284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CoYUuWpTT+LxYx5cWy5sddV5m4n9L3NUAIJrYNo8FYM=;
 b=lkyRUg3qO4oSw9b8SCzjvA5+gP3CtRFWdTfDly8rHlKaBelidOB9Ztbp
 SfNFaR3xLrKyW0ujEDymh5e1risdJw8ZFrx7vd1lWiqfkw87i+ybjguKe
 uM/ZzLi3pSxuZcXKJHsiXFeRGLtEdS2w2i3IBsW7fhjCy3dZZKJV/7qTQ
 2sfXCgCbEtyN0hB9AQCNrdN2b8n1SVTCrzAF+lK5y2Kw1cw8/sQs95B3F
 S3QPfET7mmhkYuMF02Uz6FwhFzDvQON41sqYnFhaJwh1orh2tLYNPSIFG
 W5xY6w9WB6W2hLzZOSpc3rxj4bu+TVcS/1O9N0SsE+Q1nEaLMCcyGB1cP A==;
X-CSE-ConnectionGUID: OiwZMvL7QPqbngjAaPTyUw==
X-CSE-MsgGUID: fALD8q0tQtOiGPJCltAZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83277675"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83277675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:54:43 -0800
X-CSE-ConnectionGUID: 949rviQ9Toe92xLPyBCTpg==
X-CSE-MsgGUID: ZAKGeyhgQTG5LTYaK0f66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213716680"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:54:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 05:54:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 05:54:42 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 05:54:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDopKBaFUnembAD/dSYf34KG0qn3jxi0k95ZIeYBhaiOufxoj02Po42MsWuPeyNPxqgSPgmqSYIhY5+rjE28Vn6k57PJm6h1W8cVZBRSHvOzYluG06XYa5Pldk8BrQih9+uhlO9QREODSKLeCPCK+tgkT5UJJW8BG2qB//VZUrAK8qnsF/apsckyRVJ8L/zhjO20DQHk+JQVIW/6rk2/renXnLjRYEZl+b3qX8St1Xwv7jaXW+3PKKuW+68oAvgjLL5iHOS4l21mBGDcB//yFv+OyAJBf0CeB6ZcoHaQZEZbq0yyhq7vKFgTWWvZXFT/BoVz3IPPacDuUzWKLqGzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoYUuWpTT+LxYx5cWy5sddV5m4n9L3NUAIJrYNo8FYM=;
 b=LtFH1oVxDbGBI8g/QuxaUQJt4JJR1MNPxvXZRUw5pnARrW8YGsl15XB42jJW1N/pa4nSSjrnJcerkTnQMdc7Bi/Irv6TIxBvt/hsjHoigmH+WjtAW16usvXVCTEjcLz0Ff7OCq0NpTXMtbbyMq8dnXJKvfRZwNU79bFr63+65nB8uPbN5H8MjeFUyYO4KHXKxg0uWPB2nTTE8o6t9LGKveeqiGJqKqvIs9quCFbstUoGR/QspBjub5NjREtauk4EudD30KCnZVDy+EHChthgltuv+Xt+UeQSH4IriaVpd20o232wqVRSqVci8NIbBomNf+g1cwgC4wdNo3+AZO3jBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 13:54:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:54:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Subject: RE: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Topic: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Index: AQHcpYFJxYlYrKp4OUuCTu5s1qhlLrWR3YYAgAAA8wA=
Date: Tue, 24 Feb 2026 13:54:38 +0000
Message-ID: <SJ1PR11MB6204275709D0270F9B4C7E3C8174A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
 <20260224113147.1656939-9-tejas.upadhyay@intel.com>
 <cb539bba-fbcc-457a-9c6e-f2200b02949d@intel.com>
In-Reply-To: <cb539bba-fbcc-457a-9c6e-f2200b02949d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW6PR11MB8368:EE_
x-ms-office365-filtering-correlation-id: a258d462-a7a1-4da0-f9ed-08de73ac408c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?V0wyclRKRHUyQ2UyRm5NYXVZS2JTMnlMZlBIcGlvZTV2UkFhUTNnTXJydGRT?=
 =?utf-8?B?Wk1pTTQrU3ptbW9mNWxJMnprNVFOYjNYVDU1OTB4WjBMWStXME1zaDQ0K3Ev?=
 =?utf-8?B?UHNzWWhJL21BbWN5R3dVTktOWEI4WnRoNjRtU2dWWlNZQzM1Skd3cFBGcU5E?=
 =?utf-8?B?N1VhRm54U1VScGNaS0psV2dNWE5nY3ZiSmZJU2s3NzV3OUR2dTc4aWFqbjJq?=
 =?utf-8?B?Wk9JY2ZabFVkdHZPTmk5bXlySkJaUnI0NkRjMGFqMXljNmN3RVhnWUJybXdI?=
 =?utf-8?B?bjRSbW40TzJFTm15TW1lUHBHZkFwRjlaTWFvWUZ4T1FOUVZ6WWJydFhVQkFY?=
 =?utf-8?B?eEF4UWFJVVZZVjdlOXVUVnZaOTZWdTBjZkhRUmdzYzJvYXIydWhvVGdWWDBk?=
 =?utf-8?B?QWZkMjkvUHBRY1kzNWxhWk1WU2pWV3NNYkZ6Y214MC9xaTh5MzViUW5yTDFr?=
 =?utf-8?B?eEpuRzZ0UUFVWjJzSTljb3BjOEY5YTFKMU0yRWV2YUlXWEV6aVlwWXh1bVFC?=
 =?utf-8?B?eUc2VlRRckx3MWliYlVVd0FSemF1RFdhU1V0M0Q5T01ZUVhIRXBQUThUVHo1?=
 =?utf-8?B?NVgvc2NBNGhnZmFxWm5zL2lGWFJlZ2hnM05QM2I3Z3hqOCtmbVhVWVhOMUZT?=
 =?utf-8?B?bE1UTEowb1BuWkxsdlRvb3ZpQ2ZMOHJEUW5mMUNvdGtJeGsxYjYrdkg3K1d3?=
 =?utf-8?B?RlpRQ2dsRmhEeC9MaG9La0dJWmtqeHF6ZXM5cWZybmw1QXd5dHFlczFDMHpQ?=
 =?utf-8?B?R243T1dMckp3NGMvVWhXbWxaeWlwb0EwTVVyQ2FaUmk0Mm9SRHJvZ2txaEVy?=
 =?utf-8?B?bTVSRmU4bGdvRTFEZ0d3SmtyakhLRUhtbDJnWEt4U21vbE9FclVmSElHdkRp?=
 =?utf-8?B?aFhlMmxDbGIxT1kxSjdwU053OS9iWWFaRFdkTnZ4S2RBV2dhK0dWVnhPaHZQ?=
 =?utf-8?B?SDYwVEVvY0NFVmw5V0wrdExOc0JBUGx1d3R1dUZpWXNHK3FleGpVcDNPa09t?=
 =?utf-8?B?QnRjbW9uMzNWSkNiRFpDdEZtK00zc3NnOUZFYmNnTnFWa29sdlBXOG5ka241?=
 =?utf-8?B?RjVYZ2MrVGlLRVVReU1GVnhyam0zRXFTL0JKUDVacEZpREIvdnJnbjZsNUFW?=
 =?utf-8?B?STZJeXR2Z21BdjR0c0V5Z1NZT1dvSjF5UFR6NEJqMUlmd2h2N1RQSnp3RHdl?=
 =?utf-8?B?aSt3bkNSY3BpUWs0akNHcHpwUEtJM3ZqQWJXNkV4RlRveGptaFNObXQ0SlB3?=
 =?utf-8?B?MGoxNnhJQVoveVE0T1VFa0JjMUJsZ3pud0F4TGxVVzNCVmEvdFNuNDFYZXFB?=
 =?utf-8?B?UXgzWTVIRGV1d3ltWU5SSkR4QzlwZndZOEVxcG1lcmY0eEJJR2U2amNKaGVq?=
 =?utf-8?B?UWVSYU5SRXVRNkxTcUNRQ0tocHpsRTVpTm9GSXUwTXEyT2p1YjVOQWVSMURy?=
 =?utf-8?B?TVp1dDRVOVg5WXpHcmFFcVhsKzJRaGQycDgzc2QrMDZjTFZSaTJMSGYrcE03?=
 =?utf-8?B?MmJlR0Q4UmJiTXNxRWdpMGJ2NUxudngzK2kxMFdpRjJ3NTN6clZZc3V5WVkx?=
 =?utf-8?B?TkdaWFRPUFRCUkIwa1VTRG9LUHFVaUhFYytxLzF5bEoxM213Vm5EcFdhaWpP?=
 =?utf-8?B?SkJHUkIwYUc3c3ZvVHhCZ1J4MzVjQ2RISGNYVGNvNXk3ckpnckpsQjhCd1lo?=
 =?utf-8?B?TnM4TzRvNldHUzhKWElsc0Vya1J4SUljd2VrZlh5SkVKMkliLzNhbkF1QkU5?=
 =?utf-8?B?OGd2ZUdpakpRN0pZYnVzdjdRbmNWZ2c0S2xMazV5OGhHUTFlcC9FSDN5SVcw?=
 =?utf-8?B?ZHFHa1FQNzB2QnlxTlFmVDJORzh6cVJ4TmxFcXgwanVxSmhzbG1IZDBTanly?=
 =?utf-8?B?aGQ3azFueEVSOFV3MkY3cUd6Y1JzMTlSLzNNWXhOU2QrOHVwcEY0Mlk2RWdY?=
 =?utf-8?B?bFJCb3R3VmVsaGxVSG4vNHA5VWhKeXdrV2JOSU5zRm9haHcwd1gybHMxSS8y?=
 =?utf-8?B?NFVLa0t0RE11Wi8xSXRsWU1YOWRyZGRCTCt2OEVOWm8rNU9oR3dyNjdGbTBp?=
 =?utf-8?B?NjBaZy9iY1dzT1FjR2h4VUl1SGhoWFJic3VMS3IwdUJKWitVUHBKVk9xVjdz?=
 =?utf-8?B?WTdUR1phWXQ5TERmYWo0L2pzWmNBSFpnWXNmUTNXYzRINmtVc0ZVMTlML01T?=
 =?utf-8?Q?xxrDFzvMqGW2PSzNYskRH7w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T25CSDNCTHRQK3hKT0RHQ1grR0MyZDNiTENGVlFybmNvdW1ZOXpUVTRWdFBu?=
 =?utf-8?B?djVCdlhzRDFBVXVrdisyVTZsZUJWbXNQZVFRSittdDRzaWd2Q3ZzdTZGVDkz?=
 =?utf-8?B?NnN6ejgrVG9jNUI5WW9pSjBpd1FlWVZGTk16YllQekdoVFFVZXUzdkwzZ0dp?=
 =?utf-8?B?MEEvZTNxVWZEeDF6bmhMUTB2bjViMFlheGJ5TXVGV1RZb2wvT1E4elZnUE54?=
 =?utf-8?B?dy9BQlFSaEVFSEd5V3dGSzF3UTNrZUFMbThNT3ZkVmtNcjVMSkhzMHFOTXls?=
 =?utf-8?B?N2pnY1JnTkJHM1NXUGlacVU0T1dKK3N1VnNPU2xmRUkrVVEzT1BoVWVIQnk4?=
 =?utf-8?B?bExFZStWYWRGNEN3bnNJa3RZUWkzeGx4NlY1akpNTytXYU01ZE9MMzlvUW5V?=
 =?utf-8?B?VnJpc1JkUndKT1hNa1VCeVVGc0wyaUlSYnpnYlRjUHF6dDBKMmw1N1FUVmla?=
 =?utf-8?B?ZnVkbi96bFhkT2swS1dPbS9ieDVuSFZaMnhDQm1sclFYdmU4THZONGlqNmUx?=
 =?utf-8?B?c3NNSFlFeVcrRzgvbnd0dHl6cmZqYWVsVDNaR1EzK212WnpVSHBoR2tqd0xM?=
 =?utf-8?B?OXVINkZlVFM0bVBzYVhPc3oyTlZFMTVTRlM3RVA5azJOM3ltS3BsNksrTEZp?=
 =?utf-8?B?eDQ2Y2ZPQWJxZEZ0UW5FK3Roa25pYllOQ3FsZk84NEhkRFRmRUhEbFNIV3hr?=
 =?utf-8?B?d0pSZXpIM1RQQzFTOGd4S2dvMU53Yzg5dGVFbEFIKzN4VUJZejl6cERLckdj?=
 =?utf-8?B?M3hINDU5NnJ0a2NyN3J0Uk5QQzlzdTNHUXNSVGN5RkYyZ0xLOWRYV3U4Y3lR?=
 =?utf-8?B?Ty9scSt4dzZoNTRpOUpndGM2OEFPVm85UmF4SFdSUmdQM21yRmdxZ2oyV2NL?=
 =?utf-8?B?L1hVSkorQW10MjJkRExBWkRrOU1HSDdrbjNQM21XSVpuQmZ6b09NZlBXNUVa?=
 =?utf-8?B?SkpqblZnSEpnN0p6aktzL0Nyb25EU3hSeTBTdjZpUzJkR3ptV0dKZlVFRTlR?=
 =?utf-8?B?cCsrYjlLb0pYaEFrU3p4dVVOV3FKL2ZuVkVBREl6NExXZVQ3RzRmWElqdVZL?=
 =?utf-8?B?Mi9LYjRDU2d5dkRqMUt3Nm81elpUK0hUUlVrYjBIbEtRNDFZTnJsaW80TUE4?=
 =?utf-8?B?dCtpbitKQS8wK2hnVnZ0V3JzaVNwMmZ5dktHSW9RSEg4R1hMaVFmRUpNODlL?=
 =?utf-8?B?ZjIzeHFWZnMwWmYxMEZyaWFJOURZTWorWlhyUno5dzhLY1RETHZtTzNHN05y?=
 =?utf-8?B?SnYvTUhOTmY0cUlaeDhaYmlrdHhxUDNidjJoQWZmb2NzZ1RDeUYrMEduWU9D?=
 =?utf-8?B?cXRNSUpuUnNWYm14VFpjcDJydnBVZ1NVRUxEQW1sTWh0N1pIOHA4Z28za0ZF?=
 =?utf-8?B?c2lpK2EvNVI1dWs3TlpIMkV4ejBoUEpXUy9wcHB2WXZobmRFOVJKY0FiMm55?=
 =?utf-8?B?UFRabUtSYTAxUWpRS1VHejltZlVwdTV1OGlHTXdYNXZJUTdlTlBlOHZiYkxs?=
 =?utf-8?B?NENWOGt2MkdKUnU4dklZQU5MeS96Q1QvSlYwb0FCdkFZdE0zU3Ixd2FQYnV2?=
 =?utf-8?B?bElqWFdDNEozR015OUMrRm1xZVZPNEw3WTNETVhBeDVmckg3bzA2bVBPNHR3?=
 =?utf-8?B?cUF6dzVVZmN5RzNqSERFcFdrV2t5YU5yZkFBYnE1bEc2OHM2ZDdISTJTTDlq?=
 =?utf-8?B?c0tCU3E1Ulo3c25pRjE0UEpJQ3l3d09CeUZDTWFXb21HNEQvMStVeGg3dTdF?=
 =?utf-8?B?amVucjZNbmlQSlQ3dXFKN211cjNOeEdockw3THBVOFBwMU9ZTFFmTkpQajJu?=
 =?utf-8?B?YzFZN1dVOXEwYVdSa2xOUmdKVWt6S2pCWHZqaEFJMVJSek1MWmdtSDdTOTc1?=
 =?utf-8?B?NGdzR3YwOTZIY3daQkNLYXhETXBXa3dZbW11eGRwWGhuRi9VZkxRdGcvSFZU?=
 =?utf-8?B?VTAxRStkd1M2TnI3YWxEcENVczhXY1o4bk9Ia2sralR2a3RESXNRWTZScmlF?=
 =?utf-8?B?c0szSm5GS2N2L29YVzhjbDBSTys3aVdjaVg5Y2xuaXNISG1VSW4yb0RqY3B1?=
 =?utf-8?B?T2Vvajl6T1Z3Z3grb1czUzdoM1BjQTFWSHNjd2kwRWYzUERlVXhiYzJHQmhZ?=
 =?utf-8?B?L1R5OHdqR3B1Z3pYazZZNjBhVy9UbVVIOXJYOTBzaDVseHVnSnp5elNtNkQv?=
 =?utf-8?B?STJ0ZHdwQ1JtcnJIOFNLU2F5d056WmNzdFY2eHlPVVBtckQrcHdBQ2NZUCtK?=
 =?utf-8?B?Q3Rqdko4SzNsZFZmU0RhOFg3WGtVZDduOHRWUTFPUmU2Y0pRbU1qYlRGam9T?=
 =?utf-8?B?Vno3eU5kSGZyNWhMK3BmT0FwdHM5VnpEdFFacm90WjR0UWlMcHlSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a258d462-a7a1-4da0-f9ed-08de73ac408c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 13:54:38.7243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fh6TqfrWwQMhbEecoMiY+avurA8Z3HwliVbG8nc/CwHVJy+zThlFpf/Rb1RrOkqM2dAevltqO5j3+F721QqQ/qLleMimjEGTZnx74LpX4eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMjQgRmVicnVhcnkgMjAyNiAxOToxOQ0K
PiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0N
Cj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDMvNF0gZHJtL3hlL3hlM3BfbHBn
OiBFbmFibGUgTDIgZmx1c2ggb3B0aW1pemF0aW9uDQo+IGZlYXR1cmUNCj4gDQo+IE9uIDI0LzAy
LzIwMjYgMTE6MzEsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IFdoZW4gc2V0LCB0aGUgTDIg
Zmx1c2ggb3B0aW1pemF0aW9uIGZlYXR1cmUgd2lsbCBjb250cm9sIHdoZXRoZXIgTDIgaXMNCj4g
PiBpbiBQZXJzaXN0ZW50IG9yIFRyYW5zaWVudCBtb2RlIHRocm91Z2ggbW9uaXRvcmluZyBvZiBt
ZWRpYSBhY3Rpdml0eS4NCj4gPg0KPiA+IFRvIGVuYWJsZSBMMiBmbHVzaCBvcHRpbWl6YXRpb24g
aW5jbHVkZSBuZXcgZmVhdHVyZSBmbGFnDQo+ID4gR1VDX0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQg
Zm9yIE5vdmFsYWtlIHBsYXRmb3JtcyB3aGVuIG1lZGlhIHR5cGUgaXMNCj4gPiBkZXRlY3RlZC4N
Cj4gPg0KPiA+IEFsc28sIHJlc3RyaWN0IHVzZXJwdHIsIHN2bSBhbmQgZG1hYnVmIG1hcHBpbmdz
IHRvIGJlIGVpdGhlciAyV0FZIG9yDQo+ID4gWEErMVdBWQ0KPiANCj4gU2hvdWxkIHdlIGFsc28g
dXBkYXRlIHRoZSB1YXBpIGhlYWRlciBrZXJuZWwtZG9jIHRvIGRvY3VtZW50L3JlZmxlY3QgdGhp
cywNCj4gc2luY2UgdGhpcyBpcyBhIG5ldyB1YXBpIGNvbnRyYWN0PyBBbHNvIHdpdGggdGhhdCB3
ZSBuZWVkIHRoZSB1c3VhbCBVTUQgQ2MsDQo+IGp1c3QgdG8gbWFrZSBzdXJlIHdlIGFyZSBvbiB0
aGUgc2FtZSBwYWdlLg0KDQpTdXJlIGFkZGluZyBNaWNoYWwgYW5kIEpvc2UuDQoNCj4gDQo+IEFs
c28gaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBzcGxpdCB0aGUgdWFwaSBzdHVmZiBvdXQgYW5kIGV4
bGljaXR5IGxhYmVsDQo+IHdpdGg6ICJkcm0veGUvdWFwaToiLCBvciByZWxhYmVsIHRoaXMgY29t
bWl0IHdpdGggInVhcGkiIHNvbWV3aGVyZSBpbiB0aGUNCj4gY29tbWl0IHRpdGxlPw0KDQpJbiBh
IHdheSByaWdodCwgd2UgYXJlIGNoYW5naW5nIHRoZSBleHBlY3RhdGlvbiBmb3IgVUFQSSBzbyBj
YW4gYmUgc3BsaXQgYW5kIGxhYmVsbGVkLiBJIHdpbGwgc2VlIHdoYXQgaXMgYmVzdCBmaXQsIHNw
bGl0IG9yIHJlbmFtZSB0byBjb21taXQuDQoNClRlamFzDQo+IA0KPiA+DQo+ID4gVjMoTWF0dEEp
OiBjaGVjayB2YWxpZCBvcCBhbmQgcGF0X2luZGV4IHZhbHVlDQo+ID4gVjIoTWF0dEEpOiB2YWxp
ZGF0ZSBkbWEtYnVmIGJvcyBhbmQgbWFkdmlzZSBwYXQtaW5kZXgNCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ICA+IC0t
LT4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgICAgICAgIHwgIDMgKysrDQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaCAgIHwgIDEgKw0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICB8ICA4ICsrKysrKysrDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfdm1fbWFkdmlzZS5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiAgIDQgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWMuYw0KPiA+IGluZGV4IGNiYmI0ZDY2NWI4Zi4uOTdjMzNjM2RkNTIwIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYw0KPiA+IEBAIC05OCw2ICs5OCw5IEBAIHN0YXRpYyB1MzIgZ3VjX2N0bF9m
ZWF0dXJlX2ZsYWdzKHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiAgIAlpZiAoeGVfZ3VjX3VzaW5n
X21haW5fZ2FtY3RybF9xdWV1ZXMoZ3VjKSkNCj4gPiAgIAkJZmxhZ3MgfD0gR1VDX0NUTF9NQUlO
X0dBTUNUUkxfUVVFVUVTOw0KPiA+DQo+ID4gKwlpZiAoR1JBUEhJQ1NfVkVSKHhlKSA+PSAzNSAm
JiAhSVNfREdGWCh4ZSkgJiYNCj4geGVfZ3RfaXNfbWVkaWFfdHlwZShndWNfdG9fZ3QoZ3VjKSkp
DQo+ID4gKwkJZmxhZ3MgfD0gR1VDX0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQ7DQo+ICA+ICs+ICAg
CXJldHVybiBmbGFnczsNCj4gPiAgIH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19m
d2lmLmgNCj4gPiBpbmRleCBhMzNlYTI4OGI5MDcuLjM5ZmY3YjNlOTYwYiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfZndpZi5oDQo+ID4gQEAgLTY3LDYgKzY3LDcgQEAgc3RydWN0IGd1
Y191cGRhdGVfZXhlY19xdWV1ZV9wb2xpY3kgew0KPiA+ICAgI2RlZmluZSAgIEdVQ19DVExfRU5B
QkxFX1BTTUlfTE9HR0lORwlCSVQoNykNCj4gPiAgICNkZWZpbmUgICBHVUNfQ1RMX01BSU5fR0FN
Q1RSTF9RVUVVRVMJQklUKDkpDQo+ID4gICAjZGVmaW5lICAgR1VDX0NUTF9ESVNBQkxFX1NDSEVE
VUxFUglCSVQoMTQpDQo+ID4gKyNkZWZpbmUgICBHVUNfQ1RMX0VOQUJMRV9MMkZMVVNIX09QVAlC
SVQoMTUpDQo+ID4NCj4gPiAgICNkZWZpbmUgR1VDX0NUTF9ERUJVRwkJCTMNCj4gPiAgICNkZWZp
bmUgICBHVUNfTE9HX1ZFUkJPU0lUWQkJUkVHX0dFTk1BU0soMSwgMCkNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
Yw0KPiA+IGluZGV4IGMwNmZkMjUwZTAzNy4uODA5Yzg2OGI4ZWExIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtLmMNCj4gPiBAQCAtMzQ3NCw2ICszNDc0LDEwIEBAIHN0YXRpYyBpbnQgdm1fYmluZF9p
b2N0bF9jaGVja19hcmdzKHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfdm0gKnZt
LA0KPiA+ICAgCQkJCSBvcCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUikgfHwN
Cj4gPiAgIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgY29oX21vZGUgPT0gWEVfQ09IX05PTkUgJiYN
Cj4gPiAgIAkJCQkgb3AgPT0NCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQVFIpIHx8DQo+
ID4gKwkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgeGVfZGV2aWNlX2lzX2wyX2ZsdXNoX29wdGltaXpl
ZCh4ZSkgJiYNCj4gPiArCQkJCSAob3AgPT0NCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQ
VFIgfHwNCj4gPiArCQkJCSAgaXNfY3B1X2FkZHJfbWlycm9yKSAmJg0KPiA+ICsJCQkJIChwYXRf
aW5kZXggIT0gMTkgfHwgY29oX21vZGUgIT0NCj4gWEVfQ09IXzJXQVkpKSB8fA0KPiA+ICAgCQkg
ICAgWEVfSU9DVExfREJHKHhlLCBjb21wX2VuICYmDQo+ID4gICAJCQkJIG9wID09DQo+IERSTV9Y
RV9WTV9CSU5EX09QX01BUF9VU0VSUFRSKSB8fA0KPiA+ICAgCQkgICAgWEVfSU9DVExfREJHKHhl
LCBvcCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUiAmJiBAQA0KPiA+IC0zNjA4
LDYgKzM2MTIsMTAgQEAgc3RhdGljIGludCB4ZV92bV9iaW5kX2lvY3RsX3ZhbGlkYXRlX2JvKHN0
cnVjdA0KPiB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfYm8gKmJvLA0KPiA+ICAgCWlmIChYRV9J
T0NUTF9EQkcoeGUsIGJvLT50dG0uYmFzZS5pbXBvcnRfYXR0YWNoICYmIGNvbXBfZW4pKQ0KPiA+
ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYm8t
PnR0bS5iYXNlLmltcG9ydF9hdHRhY2ggJiYNCj4geGVfZGV2aWNlX2lzX2wyX2ZsdXNoX29wdGlt
aXplZCh4ZSkgJiYNCj4gPiArCQkJIChwYXRfaW5kZXggIT0gMTkgfHwgY29oX21vZGUgIT0gWEVf
Q09IXzJXQVkpKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gICAJLyogSWYg
YSBCTyBpcyBwcm90ZWN0ZWQgaXQgY2FuIG9ubHkgYmUgbWFwcGVkIGlmIHRoZSBrZXkgaXMgc3Rp
bGwgdmFsaWQgKi8NCj4gPiAgIAlpZiAoKGJpbmRfZmxhZ3MgJiBEUk1fWEVfVk1fQklORF9GTEFH
X0NIRUNLX1BYUCkgJiYNCj4geGVfYm9faXNfcHJvdGVjdGVkKGJvKSAmJg0KPiA+ICAgCSAgICBv
cCAhPSBEUk1fWEVfVk1fQklORF9PUF9VTk1BUCAmJiBvcCAhPQ0KPiA+IERSTV9YRV9WTV9CSU5E
X09QX1VOTUFQX0FMTCkgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
X21hZHZpc2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYw0KPiA+
IGluZGV4IDFhMWFkOGMwN2Q0OS4uZTY2OWU1Nzg2MThiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm1fbWFkdmlzZS5jDQo+ID4gQEAgLTQxMSw2ICs0MTEsNyBAQCBpbnQgeGVfdm1fbWFk
dmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiB2b2lkICpkYXRhLCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbA0KPiA+ICAgCXN0cnVjdCB4ZV92bWFzX2luX21hZHZpc2VfcmFuZ2UgbWFk
dmlzZV9yYW5nZSA9IHsuYWRkciA9IGFyZ3MtDQo+ID5zdGFydCwNCj4gPiAgIAkJCQkJCQkgLnJh
bmdlID0gIGFyZ3MtPnJhbmdlLA0KPiB9Ow0KPiA+ICAgCXN0cnVjdCB4ZV9tYWR2aXNlX2RldGFp
bHMgZGV0YWlsczsNCj4gPiArCXUxNiBwYXRfaW5kZXgsIGNvaF9tb2RlOw0KPiA+ICAgCXN0cnVj
dCB4ZV92bSAqdm07DQo+ID4gICAJc3RydWN0IGRybV9leGVjIGV4ZWM7DQo+ID4gICAJaW50IGVy
ciwgYXR0cl90eXBlOw0KPiA+IEBAIC00NDcsNiArNDQ4LDE3IEBAIGludCB4ZV92bV9tYWR2aXNl
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1f
ZmlsZSAqZmlsDQo+ID4gICAJaWYgKGVyciB8fCAhbWFkdmlzZV9yYW5nZS5udW1fdm1hcykNCj4g
PiAgIAkJZ290byBtYWR2X2Zpbmk7DQo+ID4NCj4gPiArCWlmIChhcmdzLT50eXBlID09IERSTV9Y
RV9NRU1fUkFOR0VfQVRUUl9QQVQpIHsNCj4gPiArCQlwYXRfaW5kZXggPSBhcnJheV9pbmRleF9u
b3NwZWMoYXJncy0+cGF0X2luZGV4LnZhbCwgeGUtDQo+ID5wYXQubl9lbnRyaWVzKTsNCj4gPiAr
CQljb2hfbW9kZSA9IHhlX3BhdF9pbmRleF9nZXRfY29oX21vZGUoeGUsIHBhdF9pbmRleCk7DQo+
ID4gKwkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgbWFkdmlzZV9yYW5nZS5oYXNfc3ZtX3VzZXJwdHJf
dm1hcw0KPiAmJg0KPiA+ICsJCQkJIHhlX2RldmljZV9pc19sMl9mbHVzaF9vcHRpbWl6ZWQoeGUp
ICYmDQo+ID4gKwkJCQkgKHBhdF9pbmRleCAhPSAxOSB8fCBjb2hfbW9kZSAhPQ0KPiBYRV9DT0hf
MldBWSkpKSB7DQo+ID4gKwkJCWVyciA9IC1FSU5WQUw7DQo+ID4gKwkJCWdvdG8gbWFkdl9maW5p
Ow0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gICAJaWYgKG1hZHZpc2VfcmFuZ2UuaGFz
X2JvX3ZtYXMpIHsNCj4gPiAgIAkJaWYgKGFyZ3MtPnR5cGUgPT0gRFJNX1hFX01FTV9SQU5HRV9B
VFRSX0FUT01JQykgew0KPiA+ICAgCQkJaWYgKCFjaGVja19ib19hcmdzX2FyZV9zYW5lKHZtLA0K
PiBtYWR2aXNlX3JhbmdlLnZtYXMsIEBAIC00NjQsNg0KPiA+ICs0NzYsMTcgQEAgaW50IHhlX3Zt
X21hZHZpc2VfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gPiBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbA0KPiA+DQo+ID4gICAJCQkJaWYgKCFibykNCj4gPiAgIAkJCQkJ
Y29udGludWU7DQo+ID4gKw0KPiA+ICsJCQkJaWYgKGFyZ3MtPnR5cGUgPT0NCj4gRFJNX1hFX01F
TV9SQU5HRV9BVFRSX1BBVCkgew0KPiA+ICsJCQkJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGJvLQ0K
PiA+dHRtLmJhc2UuaW1wb3J0X2F0dGFjaCAmJg0KPiA+ICsNCj4geGVfZGV2aWNlX2lzX2wyX2Zs
dXNoX29wdGltaXplZCh4ZSkgJiYNCj4gPiArCQkJCQkJCSAocGF0X2luZGV4ICE9IDE5IHx8DQo+
ID4gKwkJCQkJCQkgIGNvaF9tb2RlICE9DQo+IFhFX0NPSF8yV0FZKSkpIHsNCj4gPiArCQkJCQkJ
ZXJyID0gLUVJTlZBTDsNCj4gPiArCQkJCQkJZ290byBlcnJfZmluaTsNCj4gPiArCQkJCQl9DQo+
ID4gKwkJCQl9DQo+ID4gKw0KPiA+ICAgCQkJCWVyciA9IGRybV9leGVjX2xvY2tfb2JqKCZleGVj
LCAmYm8tDQo+ID50dG0uYmFzZSk7DQo+ID4gICAJCQkJZHJtX2V4ZWNfcmV0cnlfb25fY29udGVu
dGlvbigmZXhlYyk7DQo+ID4gICAJCQkJaWYgKGVycikNCg0K
