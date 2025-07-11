Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E50C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 14:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499E10E292;
	Fri, 11 Jul 2025 14:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnImByUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA910E292
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752244962; x=1783780962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yqx+crEdDSx2i523IvWbh0nz61A1hrP52Jmk29Noedg=;
 b=BnImByUbHK/23rrPgxPY03FRWtdw1LH9URj9Gx3Jfc5A+Fr007D/e7jj
 rvwHY9Vc/G+apzQFKaL+FxJSx1iaojnslorQui1SK8+tAT6u7oL4zq3ga
 DzDbhzlKKX7cNkVwTe+iWskQUHy/6/JTjSaQgESJgSfF4HdcAuLceejFK
 jPQe8OdzoKrZzNMOu14ZPe+ULECxh9KpGarUosF3g+3XWEupQC9SuqrRx
 5BHS+7iE2TMzvISP5BX1643YXMO/k9uj0+UUHrYGD4gtpkqXE/pu7l3J7
 FDJYNveo+Bg49YfO97z9jgbY6oOMb3ZJd0MzbnNv7IPmueNMOFlhfws2A A==;
X-CSE-ConnectionGUID: 2Id+klcMQeSrnW/lVoyulA==
X-CSE-MsgGUID: 8Zbty1IzSXKmOq8Z5Xmq2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54260481"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54260481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 07:42:42 -0700
X-CSE-ConnectionGUID: 4vEHqigTTFSe5UlWGb5Wrw==
X-CSE-MsgGUID: yMeDPDdhQAe0V1O9cG1bNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="160685798"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 07:42:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 07:42:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 07:42:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 07:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+2jvR8jfXXonqAktm51hv8XtE2re//i0rAUQyNGeFD0O0olZU+dFchtqTtTjfLes/pLqyFRmeGtT1gOonsH+ZIne2cmzfSr3spmoeJ2hDz3oDOXPCgQAM+pGSGtb9gvHUPof9aQLJOQQl3ymhuWNHmN9QZTXwVNn1D5rNPQODkF5VdGms+Jz4DnYuwhBGr1K4aJflqmjyclB0KDAcl21JLau8ZOJwzHF1edZzl19CD0NQE1iEmhf36Graxz4yQ6+WKO92xlEji0qB1OV3j3K+yKl6lCgS4TJGbmemoTQf8d5tf/UeQItNBd7OdELOAjNniWGIvlWyQ8P0DGAcilVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqx+crEdDSx2i523IvWbh0nz61A1hrP52Jmk29Noedg=;
 b=fItKTwLNJz1Pk75le9QEuJw8zATE3QOVip+AvMwwPANwVVQ/MJV9VaHzus4b1mTgffmuKrr3LtTgk/djYktHZUn+Gr/JIF3+JJsNgoDUUDP1A/luejVczwd7+kJvepSicRCbC0pT8omGhxQ+EKqKjkddwWoc3z1JC98UQgyrjclad8QDTcxOTZWgxy2/4iKfoVYJH0cOtr1ILiCO6WajVZ2bNlPtu2dLXmUz0BVRhkpNKgGevbSRJF+GIrBe4+3YZV1m5VpaYa1Ud+k3lMurLLv0mpcnS8qFLutwlqmjWQodSRxwLEg21KMZvzJGmcD6O7X03KZdqM5XY2+1GSTyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Fri, 11 Jul 2025 14:42:31 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 14:42:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Wang, 
 X" <x.wang@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Update register definitions in LRC layout header
Thread-Topic: [PATCH] drm/xe: Update register definitions in LRC layout header
Thread-Index: AQHb8iqK/FyKt5F6uEe5B4+is27KIrQs/7kA
Date: Fri, 11 Jul 2025 14:42:31 +0000
Message-ID: <8282f94db67f326d63f7d089b28a94aa28c139ba.camel@intel.com>
References: <20250711060924.7373-1-x.wang@intel.com>
In-Reply-To: <20250711060924.7373-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: eec21a75-65b7-4d5a-e24e-08ddc0892ab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2NMR2NsNENpRjhSRUpHKzZYTXRUZ3p4RFlzTlI0aEpMVHUzNXkyN2w5YXlx?=
 =?utf-8?B?QTdHYnlYTTE1NnN2b1ZOa2Uwb2tpRWFqVzV3TytMcTBNRWZqanh3SFpEMzhE?=
 =?utf-8?B?dW11YnZTV1J4S3lIQnhOZ0Y0c2E5SUtYRGpkZDkxLzhGTjBKWWE1RTUzV1BD?=
 =?utf-8?B?Um9nbE5zVkFjRUgvTDhYd2JJMzJyb3g0THZaT1d5ODMrdFFkWWJVUnJBbit2?=
 =?utf-8?B?SGRDWUxvcmt0dUQxdWY4U3NOaEY4S3BLQ1hkcXRHbUYxYWxLWHZmMUFZMGRT?=
 =?utf-8?B?eWtlY0dBOWtSUGZ6bkswVllqTnNUaFlDcjFuUGxYVFZwUm9NZTNkV2t5SlBR?=
 =?utf-8?B?NWF6M29JSlJEbG5qUU1rbHkxZFhVZlVEZUFUZlc1SGVtb3VyNm1TT3BuNk9P?=
 =?utf-8?B?VXNnclUwU3dWMWFXQ2pzVG1iTlV1dXlrcWFscEN4K3pIWDMrYVozblhITmV6?=
 =?utf-8?B?T0FObHZGZzV5ajFSTmR4dTI0dGJGVlVIdWpDRG1wd3hnL0psN1JtS1ljaEli?=
 =?utf-8?B?aWU0eUpFdmpFZkdza20rNXFGcjhaVjAwK0h6TEdad1Rhc3UveTNyOTRzZEJy?=
 =?utf-8?B?bTlvcDdqcW5PY3FBVHNLZ0lKQXlJSFU3b21WeWRxMEp2V1NURklFUVp3Ukl2?=
 =?utf-8?B?T3dqWWl2RXJ3MTMrNzhaQ1FnRmVQdkZYVmtaWDdKbzQ0YVNEaGFwajBCaTBx?=
 =?utf-8?B?bjljdk9hK3llMmZ5ajdxZFYxb3hGeWRYbGhmOENCdVFEaTBkeVBpb2lYMmFT?=
 =?utf-8?B?cE1Cc0RrZFVPdGZabzdvOG5qTWhuM250bFpEODFyUGluVDRZNXo2STNIMUNv?=
 =?utf-8?B?UFQvclhmMHpLRXFyV1czNmZGZXllVGJXa1ZlelE0cmNqWStkYThYNXlDNWxy?=
 =?utf-8?B?SmVKOUdDU0hzY3R6NFZ4UWdPUFM2UllSLytaS25QdVMvZWhKUURoc25TMGdQ?=
 =?utf-8?B?WXBLMUdUaWg1Zk93OFBHaDF3ekhDcjQ3MCtsWi9kOHpNY21QL29JVE16Rlpz?=
 =?utf-8?B?UmFhcVlxNUxKN0xvK0V3Qk9lc0ZieDRncHNtelBIcVVSVWlwalVwRk8zaU1I?=
 =?utf-8?B?Q0tBbnVUK2RMRFZvbmdMNWF0empIRlhnWEY1cTFaYlVCTzJvYW92QjFPYTBk?=
 =?utf-8?B?OC9jakZIRFhabUVSVVg2VWtzaitjMS8rcUE3cXNyL1dXcmNJb0g1MGxZTW5F?=
 =?utf-8?B?SktoZDY5dWxLTENoQk9OK0xsMmFqNSs5UkROcXUzZVNHbm8yWWdMZFFvdU8x?=
 =?utf-8?B?ZERObG9FNGZGYW5BWFpTQjljV2JYcFU4YWpCRTlQR2dPdWdkaElyZmZxNWw0?=
 =?utf-8?B?R1g2TW1BdUNnVDBYaFdTQ3dIN2xJTVVZTk5xY0NyZ0RvMjRmbjdlK0hrNE9l?=
 =?utf-8?B?QmVha2ZvMHVZYWlGRU5uTEx5VU0rWksvSVB3cFJ3b1VqcjQ1THJ5WGl6Vng3?=
 =?utf-8?B?eFVYMVA3dnJJOG1zbExNQUR2MEszZ044R3YxZzFoT3lrN3g4dEJFbmRvUDIr?=
 =?utf-8?B?cXhVZTJEL3JxZ240STBDb1hqSGFOcktJM3FmUHNUZTV5dy9rK05rUVdQcUwv?=
 =?utf-8?B?S1Z0MUcvVGdidDJYOTdBREpXWGQ0T25SOUQ3S09oUEYwUE8yODErWGk2ckVp?=
 =?utf-8?B?WDlHNFJ0cVdDZWJaU0YxU0YxRmVCSElKS3NCS3o5SlN3S1NsT0RrYjNMZEo1?=
 =?utf-8?B?aWxKL2ZBem1YUkxZUURRV3A0ZTNGT2NCeW8yUTRnRVFPSHdVWjZpT0FNQUQy?=
 =?utf-8?B?MkJDTXl3ZWIweGhDYmFFbDJPQ1NwYUNKeHpjOWI1T0FqaHpTTFBwQThEeHFM?=
 =?utf-8?B?T2hjbmhzc09Ub2F1cUM5OWRnZXZvWWhTZ0FXa1NFSjMxREJwQ3RacVpWSEhq?=
 =?utf-8?B?a3hJM0ZOdjBGVHE1YzNXL1hMbUlyYzBKWFpSU2xaNGdOaHlxem1PM0JqV0ll?=
 =?utf-8?B?V0k3NjVaMjJkZmZ3dE04WTMzL0ErTCt5R0tSVDcrMmpZT2toWU5RNU93eGFQ?=
 =?utf-8?B?VkFYYjl3NFJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGttWC9HUGJqa1dsWWRxSjZoTGczZWJ1NTcwdTdJYWc0ZWFJdTF0c1FlRGo2?=
 =?utf-8?B?Wkt5Nk5OSTdwc0hqbndrZTBEWS9hYko4UzMrMTZ1bHZPeTU3RVM2T0dGU3Uy?=
 =?utf-8?B?bzM2VmY2UWs5WE1taHR4WUZsck1EM3g2MU5Qa3VqaFc5SGIrV0xKV2YvLzB0?=
 =?utf-8?B?UVEzdFMyTThYK05Bc0N0R28zSUJ1ZXA1K0JhdnZ6cWo4MVRKU29qM1MvLy9E?=
 =?utf-8?B?UFA1QnowK1hHbFBiRitYdFJkd3BmT1RIL1dOMGE3RG1uTmh6RkV0NTdKaDJH?=
 =?utf-8?B?dkVmNEk2czJEUmVxNmlaaEdaNW5yYS9CaGlZeHZYQ1B4ZVRVMDZmeEtjbTNO?=
 =?utf-8?B?V205d2hIZU9pdktwQXIzNVB0V2NkUGNNeS8yL0pDYlhQeGt3WmR2RXExYVEy?=
 =?utf-8?B?Ty9lVjMyWElOdnJaU2pabHN1RVNSRXR1V1ZTTHhRZTl2bk5WbnNCSGYyb3NN?=
 =?utf-8?B?QTRncXhCMUs5alMzQXUxRWRSaUE0d0ZUU1lPd2N0emN1NlJRaUhSRE1MYXpD?=
 =?utf-8?B?TUlNbC93SFErMDBVU3VNeGdmY25qaStMUi9QSjNURkhvelJ5MkYvZVpRM1Ra?=
 =?utf-8?B?WUZGd3RMU2lsVUFoeXBQVkYyNmlNUnFQeW0zQ3dLWGFJRk9BTFJTUmFGUGpC?=
 =?utf-8?B?QTNiaFJDSUt4RzBGZUVHSVNmeDh0N3oxOWg4Nnc5UTFaV1RQUXZidktlRVhC?=
 =?utf-8?B?dFZaQUQ2czNtWC80YStGWldjS1ZTUjI5a0IrRm1tVTZqTTc5VXBxUkU1cmY2?=
 =?utf-8?B?YjRETk9sd2YyMVRvN2lHZ1BpbWM3MFEyT2FmU0Nyd0p0T2JBZXJLWWF5V1I1?=
 =?utf-8?B?ZXEyZE9LRGpVVU1sM21PKzR2a1AzU1ByczhJQUtFWlc4cWlWem9nTnl5YWdG?=
 =?utf-8?B?VEl2SE1MTEVZSnk4eHNpcGFnbngxdXBRNE9RdzFRNnMzQ2dTbGNGWDhBZk1C?=
 =?utf-8?B?QXBCRy9XQWFyMjJxV0I5eURnTVlmdCsyQjlvRStNWE03SExqRzZ5MW1QZkRR?=
 =?utf-8?B?Nk03b0FDWVRLZU9kUDRoUmREUE5jZHFZTW1XWGNaSmZuMVhyUHV6T2xUU1RS?=
 =?utf-8?B?RVVRVDgxZjFzN2lCK0hXeDQvK2NkaCtJd0kxaGpFb3VPbVZYa2wvT3VKTE5R?=
 =?utf-8?B?SGowaDhURFBGelErMDVlQjc1ZEJBbXdWVnZZYTNxbjk3YXMxMFhKa0c5ZWdS?=
 =?utf-8?B?S0MyNUs5Y0VOM0l4dGVuZFg0cDEzQk9wNGVWWkNBblk4dmlTN29oVU55L1Fp?=
 =?utf-8?B?NG9pV0pTVnh0UkhzMnV4S3VoQSt6M3pvcWNVZWVHZ3p1TTh0MUhxSk03cDkr?=
 =?utf-8?B?QVlsZ1V4bC9LdXV5cnE0dUduTjB2Y2FJOGNCN2hmMWxZcTZ4R0VGY05XUTR6?=
 =?utf-8?B?UEcxMUhFelRvc3o1ZHRKSElaQ3FINnJqaXZUc05hWEJVZHJDelpZbW1iQTJm?=
 =?utf-8?B?eVRUMEhpUXlibEJRMzRpWmRMTkJDWC9UMDZrMnViNlB4SFpIU0Qrb2JNckZw?=
 =?utf-8?B?WSt1eUdhK3hINTVKTHZKblRhV211bHZvVFZTV21CR3N3dnBlelJtcElKNHpL?=
 =?utf-8?B?MkZ0N1Btck1SWHAyS3k2a3dDZlVUelNhdHFhWjFMc2kyeGZKT0hQQ0xnR3N4?=
 =?utf-8?B?aXlnVElEYTRFaGxxTEZ3WjNwZjVJbFo3TGRRRXVkT0VrL3VuK2gvSjFpRDcz?=
 =?utf-8?B?cVI5K3V1QVppVXdEeG9NY3E0aTQyKzJEVHlBV050dTRpNDFFaUg1YnlUNWxX?=
 =?utf-8?B?VFFWUzdyQktLM21jUU9UZHJhNnZzY2NtRlRMTHNhSWljS3c1U0dBWVEzTko1?=
 =?utf-8?B?MDF2OXp5NVdnd0NUNlRwWkZpQWt0Rnl0ZTNiUjZmMW00T3hxNEpKRUx1YTNk?=
 =?utf-8?B?eTFRZGs4MklpSXpNK2RVNXQ4WkpnaTArU0FtTTkweW9JeTZFYUplYThybFRt?=
 =?utf-8?B?Yi83dWdxaUIzelFpbjQ5ZGlKZGgvRnRuNHRzWjZhdTVmclhhNDVtdmI1WnZ3?=
 =?utf-8?B?OHRmbW5PSzZXTCswNGxsMHBUejJyWWN2My9iU1BrOGM0NWV5dzk4Sy9YRGJB?=
 =?utf-8?B?ZjhkQVhxWGdCY3Y3R0JZM000M1ZnYVI4YjB0bUFzaWdHSGg4elhRTStldjRB?=
 =?utf-8?B?c0JXeVBtbm5hVmxteFBEUDQxc3cvb05ENS9Tb2dPWE00NTBZQ3EvR0wzSXNB?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81D7DBEAF034014BB7410491089427B9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec21a75-65b7-4d5a-e24e-08ddc0892ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 14:42:31.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5tkhiDPmuNEjp655EodWrIl61e/sk++33cdQnvoKFhCiW67RQocTLvLPxP+g9z0W3CaUPljXixZckIrwqEFWx8dtAcae9rJkPmmRtmjRKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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

T24gRnJpLCAyMDI1LTA3LTExIGF0IDA2OjA5ICswMDAwLCBYaW4gV2FuZyB3cm90ZToKPiBVcGRh
dGUgdGhlIHJlZ2lzdGVyIGRlZmluaXRpb25zIGluIHhlX2xyY19sYXlvdXQuaCB0byBhbGlnbiB3
aXRoIHRoZQo+IG9mZmljaWFsIGhhcmR3YXJlIHNwZWNpZmljYXRpb24gKEJzcGVjKSB0ZXJtaW5v
bG9neS4gU3BlY2lmaWNhbGx5Ogo+IAo+IC0gcmVuYW1lIFBWQ19DVFhfQUNDX0NUUl9USE9MRCB0
byBDVFhfQUNDX0NUUl9USE9MRAo+IC0gcmVuYW1lIFBWQ19DVFhfQVNJRCB0byBDVFhfQVNJRAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdAaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfbHJjX2xheW91dC5oIHwgMiArKwo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArLS0tLQo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2xyY19sYXlvdXQuaAo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfbHJjX2xheW91dC5oCj4gaW5kZXggOTk0YWY1OTFh
MmU4Li5lNGNiMWE0ODdhMzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfbHJjX2xheW91dC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfbHJjX2xh
eW91dC5oCj4gQEAgLTE1LDYgKzE1LDggQEAKPiDCoCNkZWZpbmUgQ1RYX1RJTUVTVEFNUMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDIyICsgMSkKPiDCoCNkZWZpbmUgQ1RY
X1RJTUVTVEFNUF9VRFfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4MjQgKyAxKQo+IMKg
I2RlZmluZSBDVFhfSU5ESVJFQ1RfUklOR19TVEFURcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgKDB4MjYgKyAxKQo+ICsjZGVmaW5lIENUWF9BQ0NfQ1RSX1RIT0xEwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCgweDJhICsgMSkKPiArI2RlZmluZSBDVFhfQVNJRMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgyZSArIDEpCj4gwqAjZGVmaW5l
IENUWF9QRFAwX1VEV8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4MzAg
KyAxKQo+IMKgI2RlZmluZSBDVFhfUERQMF9MRFfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCgweDMyICsgMSkKPiDCoAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbHJjLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IGluZGV4IGQyYWQ4
ZmU3MzdlYi4uNDUyYmNmYTZjYzZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9scmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IEBAIC0xMDMxLDkg
KzEwMzEsNiBAQCBzdGF0aWMgaW50IHNldHVwX3dhX2JiKHN0cnVjdCB4ZV9scmMgKmxyYywKPiBz
dHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PU1BD
Owo+IMKgfQo+IMKgCj4gLSNkZWZpbmUgUFZDX0NUWF9BU0lEwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCgweDJlICsgMSkKPiAtI2RlZmluZSBQVkNfQ1RYX0FDQ19DVFJfVEhPTETCoMKgKDB4MmEgKyAx
KQo+IC0KPiDCoHN0YXRpYyBpbnQgeGVfbHJjX2luaXQoc3RydWN0IHhlX2xyYyAqbHJjLCBzdHJ1
Y3QgeGVfaHdfZW5naW5lICpod2UsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IHhlX3ZtICp2bSwgdTMyIHJpbmdfc2l6ZSwgdTE2IG1zaXhfdmVj
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiBpbml0
X2ZsYWdzKQo+IEBAIC0xMTQ5LDcgKzExNDYsNyBAQCBzdGF0aWMgaW50IHhlX2xyY19pbml0KHN0
cnVjdCB4ZV9scmMgKmxyYywKPiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9scmNfd3JpdGVfY3R4X3JlZyhscmMsIENUWF9USU1F
U1RBTVBfVURXLCAwKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8uaGFzX2Fz
aWQgJiYgdm0pCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2xyY193cml0ZV9j
dHhfcmVnKGxyYywgUFZDX0NUWF9BU0lELCB2bS0KPiA+dXNtLmFzaWQpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9scmNfd3JpdGVfY3R4X3JlZyhscmMsIENUWF9BU0lELCB2
bS0+dXNtLmFzaWQpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGxyYy0+ZGVzYyA9IExSQ19WQUxJ
RDsKPiDCoMKgwqDCoMKgwqDCoMKgbHJjLT5kZXNjIHw9IEZJRUxEX1BSRVAoTFJDX0FERFJFU1NJ
TkdfTU9ERSwKPiBMUkNfTEVHQUNZXzY0Ql9DT05URVhUKTsKCg==
