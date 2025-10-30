Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35EBCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677E210E98B;
	Thu, 30 Oct 2025 13:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDNUwQNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0B10E98B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832217; x=1793368217;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0KcglwIOJEtPFmPY59hXTs22CMiKUf8fBJ3bJ7Lq5hk=;
 b=UDNUwQNKSCBK1YK4vFUp1jlx89ncVGCnUSp3h5cOjZ+yals5Vri1szbI
 pgBBx8YvYoG6kBV9b5Rc54SrgtSH5gpoEjn8YkbB/fUDLNF+ISq2smpVl
 cWCdjNNXjvgUpBy8hyV2AcYJHDUZJh6kXo7YJwCspiHPLmxxy2CO/vm/S
 qCcpokPoQ6Nf/Pc28l89ST+3hW9v2USb7YS0F6xVabRGw/5Rnyk3hOhRH
 h/JytpXnRPfv7jTGDo9bii/sqy+WhkkRT8WgN14r7yanYPk0e/ZNJ9pI9
 Gut2Zycyo9knw5n3I8cRFLrQkbJRuPrZBJGTAeNMA2mViNmgzNDRKoX2h g==;
X-CSE-ConnectionGUID: cPi+HCPTR9WBmYn7woMYsw==
X-CSE-MsgGUID: uHgCQP+nR8eTgTVt3twdLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63177726"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63177726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:50:17 -0700
X-CSE-ConnectionGUID: N0MUrTtpQkGJddpT7/71Ug==
X-CSE-MsgGUID: EYPUX+c9TUGz9ZD+crCXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216809293"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:50:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:50:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:50:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbrBPteiEVwdvdCC/RaL9KzRgC9IxJLrbEs4s796hMqKNYq1JHvRsjq+xwLyjbKGJQyh3G5UdfVCUYWISnMzOMMwq700j0OEFrIr1LSPtyjQOrpEf5AQywpH0F/cjbdJPwckrFGot+iHl/2RtMhtMWhjyLrqtmkRsvDfkfBFTHwCnBIzcXvQ85XoUyn+vJAtoYbR98dP7l/iCtloBrI+WYnQzxOlzrwfv7E12D0Unu4trN2bIsz8bAVq/rZ6nhODGJcs62L9K3aFYYdD4SR1Trr1SsDKaM5U4WesckBv/cY0MCrV9rNDPPIpPoDowtjRD8q6c493j7ydGFDnfDIpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOXq6fRgYJhc+6mSSHXJlIvVmMcEesjFyZpR0zBm4ik=;
 b=AloHmTYNZDky0jKUyj8g3k/t0kncDr4hxq+xXtBNsNmf0NHxnMG2BNvHgS1pam6jAeHXjO53eyE5YQ2xkveY8apZF6Q66a0saOGu3ANtKGC05JKA6pwdgBpEs93c44x6D5KB5l7GsnEmmGYm8EobgVu5EuXMbiQsf4p2VYoHl+ZDqQ6xk5EVr21YfoiokH/GU1F7s9lSWkKMB9fsCpNrfnq9xljN5ozOM13zhMFLSxc84qMsok4mbBxSa0XjFAF3VbxcmMki2LErG1yPZXOdnuBj9+n6qBkNrB7LsbrTCbR9gz1aoYk5VCjVtYtYqfIHLIiHx3d32FZaigzzSH9EYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 13:50:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 13:50:13 +0000
Message-ID: <4fd915b1-01b5-4113-947b-ff93a82e75b4@intel.com>
Date: Thu, 30 Oct 2025 14:50:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] drm/xe/pf: Allow to stop and reset VF using sysfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-17-michal.wajdeczko@intel.com>
 <e4gagt4kem37ogz3ccxzlggznmsveh6pfa44ybghma5zav4swe@edlwn47v2kzt>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e4gagt4kem37ogz3ccxzlggznmsveh6pfa44ybghma5zav4swe@edlwn47v2kzt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0209.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee38792-093e-4fbd-23ea-08de17bb4003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFNaXVGMjlXeFh2UmUrRUpGbUlTR0ZJQ3ZYSW5HMXhqSjRqR0g2UXFoeUlQ?=
 =?utf-8?B?OGRnRHlwanNtYWc4MW9ndDg2WUtoNlZ0WklqdG0rYW9XNjNsY3ZyeXpXTnR2?=
 =?utf-8?B?MmVLclVrRjEwWlJHd053SUlheEViLzdPUTNEUWtCU0J0REJMbGtOMGtMQSty?=
 =?utf-8?B?ZWdUdkExaUZCWWtEazQ3aHFmdlg3NXpqMkxtRFI0M056WHVQN0hyZ2RXR28x?=
 =?utf-8?B?eVhiWDlJYklMQWt0b2grWjFNdzVDSGcwdHRoSXpHNUgveitxUk02Yy9KRjZ6?=
 =?utf-8?B?U0JtWUxOZkpBUEFsaGVwdk11dGNMTzUva043Vnc2WWMzdGtCR0F4UmhHUnFk?=
 =?utf-8?B?ZWN2L0lnWTZ0Snk3MHN3bnF6MGN0cndiTHdIZFRId0RnVzFqTGp0bUVMTm5o?=
 =?utf-8?B?R3Mxc1pLaEhERXBUK0VGdGN6Nm05RDVZQnVZZmkrbjZ4MVhEbWVYT21zT0E2?=
 =?utf-8?B?QkMwZHZVRDgzRXNucng2NHBvam0rTUd2cEJNTzByVXB0SW5oMXRsdld4S3NZ?=
 =?utf-8?B?THRZUFRtUjRER2V2bG02MFBJNkcvVHQvV29IbTA2TTFXL2FDWXBubGl5UXFK?=
 =?utf-8?B?RGxmTUtGdXNqNk53d3lhUHM5SFpKaERYZzU0Z1Y4TmNVWW5PbmFyQ3o4V2dC?=
 =?utf-8?B?a1liQ1BKWlgvNDJCVVVjTU5yaEFBd1kyUUtSSXlRdTlRR3VRL3E4R2xsRnVG?=
 =?utf-8?B?SmpnWWVLUW9WaDJIN2p1RUVsbkh0Q3ZxM2hiMnRUUGlPNjFxZlB3ZlZmcno2?=
 =?utf-8?B?MnBIM2dDRjA4Qk1wanVqSGJhcmRERTVNbmNkWk8rN05zQ1NFdEtJS3ZZT0lx?=
 =?utf-8?B?TDJoSUNaM0h3aFdDenc1T0lFc3NwUFlSV3FrVlEwandGSFMveGJWRnVhZldp?=
 =?utf-8?B?WEpNN2toWE4yZ3A5NWpKYVZzVm9UQlpZZ2hPcFlPUW9GSVc5eVBhWUJiZ3ho?=
 =?utf-8?B?aHFPMkRVU0FrYW9NNWFzODNNTU5wVzV4d1RHRjhoejlLVi9LaW5USmIwMUhD?=
 =?utf-8?B?Vlcrc1JuVlFtMkpSUzRaVFFvMG5aVnVyT2RVY2hKc2xGc2E0cm9rTnlYcXFN?=
 =?utf-8?B?NnorSjBIVlVlbnhQTi9pLzJFT2dQM2FTcHVJL2NZaFBYTW1Ocms0QkFBbnp2?=
 =?utf-8?B?WU1IMVJXYkZwT1VJMzFuSzhNcEw5bDZnajBZQU1SL1lkdWErWmFlaW9Ibk8w?=
 =?utf-8?B?MXZBUWFzZ2lEaDZOMUQ3OHpXV0pvUDRMLzl5WEVnY1FqWUd4WGZoREdITDBF?=
 =?utf-8?B?MW9tUzVheFgvRHN0d2NGZ3hXZEc1VG8rYU1xNzFhNEY2N3E1U0dCV2Yvd1NC?=
 =?utf-8?B?THkxc2dNVjFzeGJ0Z0pkVHh1MWptK0V1R2tzdERmYm5pYzhQQmYxS0R0a3NM?=
 =?utf-8?B?ZVgxU0JlS2ZYNFZuc1NrekVoZmdwajFvZFVzL2FOSWIxOUxVVTQyQVdydENj?=
 =?utf-8?B?SUdNTVpuaFJBQ0ZIdnpPbElJeC83d21rT0FHMDRmNlVzNmtQSzFKM0hjNXVG?=
 =?utf-8?B?bjlickNyOTRGTitqZXp4emI2bzRmV0NITWtwSmt6VzI0K3orc2dscDNqMEl4?=
 =?utf-8?B?SVhCcFRyK0dPczFZbDhxRTRYMFFJTFowaXVIVEsvc1E3bkRWV1FzZkxJQ0Zy?=
 =?utf-8?B?a3dJQXBxT25XOVgyWGVzVlZ5NVVFQm1ob1RFcFNiZ3p5a2dZYzBTZXRYejl2?=
 =?utf-8?B?clVtZWZVWUg5cjFOZFU5czVCL0VYREl6RS9LQnpyQUQ5dzY5Z0RIM1BYa0JF?=
 =?utf-8?B?RnhmS2NZRGN2QWQzcTcwbktsQjJxZXVualRnZGU0L3d5elo0THg0VExWcDZi?=
 =?utf-8?B?WVhaaUtJMnFJWnV4MEM4ZU05dWQxUW41M20xZ2NhMXFWSzhhK0FLUjNaTE9u?=
 =?utf-8?B?UXAxMWJkdFhkakRha0FSNkFtOXJZNlA3V3NSSjJubFZHWW9EdkVYZ0RKMUd0?=
 =?utf-8?Q?VkNY4FF0SkevlwJSxt9bU3FR6JdveHgP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhVa0ZGNk9YRE1vRXFSbWJQd0g0U3lTd3VIZXFGK0ZCelVnckZlMGtlYTFQ?=
 =?utf-8?B?Nm5EZ1FLbFpNUUpMeURVcm1VY29PZzNDNVYxUGFtVlFXeDBka0wrNzY4UHVS?=
 =?utf-8?B?VzYva2tYVHhwekZDSXB4N2MzZWwzaTVWTEFxLzdtais2ZlhXMVFvbzZCZVJK?=
 =?utf-8?B?STZMVGxOeXJnWnhmQkgwOW9wQXN5T1hQUFg0Y09lRXJBcXNOLzBhR2dyK2hB?=
 =?utf-8?B?TThSdlM4N3VRNUpZZzhxS2dJM0pBek44Y094amM5K2hubXA2SmllS1JNK0xF?=
 =?utf-8?B?bnBWTGoza0hGbFpLVWJYSXdwSGMwWUFrRWIrWmx2THhaWWxtaUNoME9XMVNZ?=
 =?utf-8?B?KzAyQStXU0l0NHhFTXV5aXE5aE5MOUZ4RzhRZTBaWWFpQ3Z0eHBlY00xSjdW?=
 =?utf-8?B?eGxTWjlMSGZteWJ0OU96NnorOVhxZXFYZ2J6dElFNkxoVWZEQVU4V1ErdnM2?=
 =?utf-8?B?YzAxaVBlWDZMYVNQTU1wK21PRmVoM1ppV3RVdDFoc2lMK0NTc2pFN3lUT3NR?=
 =?utf-8?B?aGRzT0lyeDNkRHVteHg3eFpUdlBwSG1DWVVYWW1YNnZkbU5lZ1N2VHJITGE5?=
 =?utf-8?B?ek1rVW8vcmFwRndsMkpRZzdmZWZaZzBubDNRMWFJbXprN2VUQzJDdlh1WVZi?=
 =?utf-8?B?TDlTNXZ5Y2VWUEV1L3IwUmVLNEpkamRtcEM5ZVhkMlBsVGkxUlhVbVpLK1BZ?=
 =?utf-8?B?dUx1b1UvSnlQa1JhWTNHV0tvMjhJNUJ4NzUvR2hkZWEyQU15TWxzMGJINng0?=
 =?utf-8?B?UTcybDZWeTMxTnpydmhHWmVGOFlTSGFGMXBDTU14WENOamJseGNwWEhGMmxI?=
 =?utf-8?B?M3QzS2xINlE0TUZTWko4MEpBVmp3elFyRzBBZDh4dFN5TlNreWE0bEdpcTJG?=
 =?utf-8?B?Rzl6ZklRRU5pT1dTWGQxTThmMmxPbExDZnA3N1I0M3NyV1pydFFUN0lJVVA3?=
 =?utf-8?B?NWkxcW41MjA2elQ0bGNNc3hRU0FwWG1wUzgyNWdlS3J2MG82eWx5TXlWQnJO?=
 =?utf-8?B?MXEvRCsvOUg4cWJ6OWkzcVVRMjdOdWJ0QVE4RXNJdno3SS9Icys3bGlLUjF5?=
 =?utf-8?B?RTJoUHpYeG1IZmxaaVNiOWtkUnVSQk1rRDNSaisrVTVsWjlFRHNXd0NFa0NE?=
 =?utf-8?B?b1dVQlFuamdEb3JOc1BMekxDc2xCcU5SNDZ6UlJ6ZHNXaGc2UC9WZUlKVWNR?=
 =?utf-8?B?VFVKaTNnNCtoMHgrV2p1YmQ4R1ZJd2VtQlgvcys4NE1rdkJ5cmtwWlZuT2VV?=
 =?utf-8?B?d29QWG1jTE5sQkUyNHVMTjhreXRNcTdJOWI1Nm9mOE5zMlhyNlhqQlpqSXZ6?=
 =?utf-8?B?czhZSEYrTTBFMmlSTzVVUnUyVFUycDNFMFUxV0twNlZFVnVJb3d0UlVMLzRy?=
 =?utf-8?B?d2Jsa3lVWkIxR3oxdVluOUdvTUdNd0huSzJjZXpKOVRjQ1hRVXFTMngxRCtE?=
 =?utf-8?B?MVFrZmRNSk0vbFpySkVwZkIzSzdjZEFiRGJwdWUzbHpDcitTT1RBbjdyMHNY?=
 =?utf-8?B?Y25UZkd5b3Z2cVVETGpFeWgzRXZmanZ5ak1KalozNnZ3S1RJS0JIQ0hJVCtE?=
 =?utf-8?B?b2Q3RnlLMUFvQWpabm1hUUh4TlpXcUFCRTAxRnRwaHk1YllXUjNiZzI5RWZV?=
 =?utf-8?B?bzNYT3BiM1dlVXcxN1MvU0Y3TWlqRHVuUS9seTFaYzBjM3c0ck1KSjdPeWlN?=
 =?utf-8?B?RGs3QTlyNjBqeGFCeGdwdDBZSXZtK1FSLzA5MDNhNjFFQXRrZ1U2UTBBMlc5?=
 =?utf-8?B?UGNaaUZWZTNMOXk3bEd1b3AxeEN4Q1lPNExydlVodHg1TEpPaXpnTEJ0Tmd6?=
 =?utf-8?B?YmpVRTVpamc0STBxaTZUcWNpT0o1RTR6MXVYMExjOGRwQ25iNlByLzBPRkZV?=
 =?utf-8?B?VXhRTmU5UkU3YjBaVHg5S3RyYnlpRnl3VllCSXVXK0tHSm5Hb2ZCS0pCeUcw?=
 =?utf-8?B?WmJmUGJNVWFtMjBjdWJvcVlKa0R4QWt4eWxXUjYvM2dVMG9NUEVhT0tvdGZE?=
 =?utf-8?B?bHVURHZSVUI3SFdJY1g5OVpVdUU1cVo5Y3lVRmRBNk9TaTJCQm15VHpOSjEv?=
 =?utf-8?B?V0t6ZjNaTHFSYm9VQXBDZTBQOVVPNWNCYzZwWCsrejdELzViMkZ6VGVrSW1k?=
 =?utf-8?B?ZkhhV3AwM2V1eWFjTkpSRXJhblMzZWV3bC8rTnY2R2xxZHlxd0xoVENOWlM2?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee38792-093e-4fbd-23ea-08de17bb4003
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:50:13.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtQBKgi0+qC/c6udh8t9eu6hdFSNEiNbz/CKzyFBLclGBTt9djhT7Fd0ici69zmy14jgrfNcu90YAxBm5p9JfHen6GcW0TCM7okC/tXxjuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
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



On 10/30/2025 2:43 PM, Lucas De Marchi wrote:
> On Tue, Oct 28, 2025 at 06:58:30PM +0100, Michal Wajdeczko wrote:
>> It is expected that VFs activity will be monitored and in some
>> cases admin might want to silence specific VF without killing
>> the VM where it was attached.
>>
>> Add write-only attribute to stop GuC scheduling at VFs level.
>>
>>  /sys/bus/pci/drivers/xe/BDF/
>>  ├── sriov_admin/
>>      ├── vf1/
>>      │   └── stop        [WO] bool
>>      ├── vf2/
>>      │   └── stop        [WO] bool
>>
>> Writing "1" or "y" (or whatever is recognized by the strtobool()
>> function) to this file will trigger the change of the VF state
>> to STOP (GuC will stop servicing the VF). To go back to a READY
>> state (to allow GuC to service this VF again) the VF FLR must be
>> triggered (which can be done by writing 1 to device/reset file).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> v2: drop reset file (Rodrigo, Lucas)
>> ---
>> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
>> 1 file changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> index 360b0ffd9cb4..3a8c488d183c 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> @@ -13,6 +13,7 @@
>> #include "xe_pm.h"
>> #include "xe_sriov.h"
>> #include "xe_sriov_pf.h"
>> +#include "xe_sriov_pf_control.h"
>> #include "xe_sriov_pf_helpers.h"
>> #include "xe_sriov_pf_provision.h"
>> #include "xe_sriov_pf_sysfs.h"
>> @@ -52,6 +53,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>>  *     ├── vf1/
>>  *     │   ├── ...
>>  *     │   ├── device -> ../../../BDF.1
>> + *     │   ├── stop
>>  *     │   └── profile
>>  *     │       ├── exec_quantum_ms
>>  *     │       ├── preempt_timeout_us
>> @@ -291,8 +293,55 @@ static const struct attribute_group profile_vf_attr_group = {
>>     .is_visible = profile_vf_attr_is_visible,
>> };
>>
>> +#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)                    \
>> +                                            \
>> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,    \
>> +                           const char *buf, size_t count)        \
>> +{                                            \
>> +    bool yes;                                    \
>> +    int err;                                    \
>> +                                            \
>> +    if (!vfid)                                    \
>> +        return -EPERM;                                \
>> +                                            \
>> +    err = kstrtobool(buf, &yes);                            \
>> +    if (err)                                    \
>> +        return err;                                \
>> +    if (!yes)                                    \
>> +        return count;                                \
>> +                                            \
>> +    err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);                \
>> +    return err ?: count;                                \
>> +}                                            \
>> +                                            \
>> +static XE_SRIOV_VF_ATTR_WO(NAME)
>> +
>> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
>> +
>> +static struct attribute *control_vf_attrs[] = {
>> +    &xe_sriov_vf_attr_stop.attr,
>> +    NULL
>> +};
>> +
>> +static umode_t control_vf_attr_is_visible(struct kobject *kobj,
>> +                      struct attribute *attr, int index)
>> +{
>> +    struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>> +
>> +    if (vkobj->vfid == PFID)
>> +        return 0;
> 
> I think this will be the case for the entire group, isn't it?
> Should we go ahead and just return SYSFS_GROUP_INVISIBLE so even the dir
> is invisible instead of having an empty dir?

today it can't be empty as at this level there is already a "device"
link and a "profile" dir - both for PF and all VFs.

> 
> Lucas De Marchi
> 
>> +
>> +    return attr->mode;
>> +}
>> +
>> +static const struct attribute_group control_vf_attr_group = {
>> +    .attrs = control_vf_attrs,
>> +    .is_visible = control_vf_attr_is_visible,
>> +};
>> +
>> static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
>>     &profile_vf_attr_group,
>> +    &control_vf_attr_group,
>>     NULL
>> };
>>
>> -- 
>> 2.47.1
>>

