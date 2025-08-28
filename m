Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C231CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441BC10EAC0;
	Thu, 28 Aug 2025 20:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKJBEZ/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9710EAC8
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756412707; x=1787948707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vRSvqEJEK+JFmWTOl2+Y+KsrGYd2t+jzVQxEhFjWSaQ=;
 b=CKJBEZ/Iuf6webCIQgXbFjKt6137sZiOgN+v9bkJf9O41D8w7s1nDEpS
 wtCe7Pj4Xd7hkQQ7u9SjD6zGgDRk5OunTxf7Qzs5bV7r8YZldu2J9gPfz
 Bq9OF2gE2QTaeVuCW3xTWIybWZMe3nxpvn9qelqXXjyXDaIsbgzOb4mXQ
 mxSBmrRQvz3k51OtsQ025pv4JmlSAR8OovlDOC9vrqNREALCwgSuySQ6V
 MKVS0nkYd8J5/mfc8eDowipuJ1/vX4rcQS7vWaUZjCiG45SaOmU/72NfA
 Iufk2xxoHcKixP8t4URKcObFquk1mdpCVmGkIgysQQggJ8NoiVpzDWZg3 Q==;
X-CSE-ConnectionGUID: N73RNnpiSda7L13OoWyieg==
X-CSE-MsgGUID: UZBneCaDRdWTPvwwV+DO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69289004"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69289004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:25:07 -0700
X-CSE-ConnectionGUID: vnWTjA6gR+aEja6SA2NB1A==
X-CSE-MsgGUID: 64oMUWI6RXOJMkuFRg/qVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169725048"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:25:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:25:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:25:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7Z9zBXCfAGX2ofD+QCSs2B3qc0PR9uzm3Q7qZQacb+cwP3hUNhQaEXxvcPY45nX9i6Gkczy3FutPsklJy8hwuz0mCIsy2JoBKBkFgzwpIqabCSjydU0EVNlOZ1YIVaeb7ORGCa53imUYhiFlMcR+sdEPFcwaCiK2cJDKM1InFDyhnQqXXx3efcJDqub5CU6DnbA1+lbNbCgEzIFgLn65PNFd5kmeNIY2KQy//wqOnJki+d7/mLB0V5yLaYJm8SXB9uR2CHIqtLB/m4WIdV50GrRpwkTvb3xVvIwiQD4FONeWgtRMuTSQzuX2erSjotSUg+unRxSCZ1bskQERHWbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRSvqEJEK+JFmWTOl2+Y+KsrGYd2t+jzVQxEhFjWSaQ=;
 b=UqqHDrmZXDQdiwSrRrXqUQqB/lxucaiNf/sJYMsEZCkhV+CB53EI2pak5Xm+TgRAj/Qm+bzvgiIkJgG/cO2tsoKj8baWgIweEhDb4YyHL5Vuh7MrHflpjw0Cs80MI7JBWH4g6bwE/XA3L76JJglR1G6kkROlgDblNeYu2/RRvIOZnlORybLoZxdKbDuuqooW1t6kIxqHBtVZJmlyyY8eeed1oSc30qTZJZxSksoeaTzu7uc5y0mWB6qMWe/n46aOt0Ab+y8N5QfvFEZRnwjGDt3vqW1urg+FQCR2a+0SJIWKaJ4oqoHP5SKe6/WL58ZYDmwF4BqPDEA2lZFq+T5RrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 20:25:00 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 20:25:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 04/11] drm/xe: Implement xe_pagefault_handler
Thread-Topic: [PATCH 04/11] drm/xe: Implement xe_pagefault_handler
Thread-Index: AQHcBpqUSr1R2WtnVkStWzxdnw+eCrR4pnGA
Date: Thu, 28 Aug 2025 20:24:59 +0000
Message-ID: <be0494a33921cb8deea5c7b3f87d8f77417c84a6.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-5-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB7893:EE_
x-ms-office365-filtering-correlation-id: e9fc982d-59db-452b-df58-08dde670f65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WVpYQnlROTNhclB3QXd6WW5CRmZNYldLNStSaVRRQUhCdysyNEZ3Zi92VFBF?=
 =?utf-8?B?cVNsRVYvOXpUanN2WEpoenRJM0liNFphSjdBRGVOWjVUUEozaEF0LytTMHpt?=
 =?utf-8?B?M1ZtNXgyUnk4b0JMcWlEcWlGRVpGVW11R3c5Q3RxM01CUjZjdlNWa0FwclNh?=
 =?utf-8?B?YzA2YThUTlFHcU9pTEhnVTRhYStrVDF0WFkraDBDcGNIUGpmaE43aU12bkpp?=
 =?utf-8?B?blo4azBLMWU1c2pOUm16K3FjVTlvUmRsNUtKNkxYTXhPbHcvT0I2Z2pxK0N6?=
 =?utf-8?B?Q2I1UXdGR2wyYmZ6NnhFWWwvcmNJK1R6ZFRwNzZZL05mZVJna2tUaks4SENR?=
 =?utf-8?B?enhXU1dHTllPZXJWNis2cjhnSVBvM00xVUJUN1hEc0JaQ0E4TjNJWWNvZVpz?=
 =?utf-8?B?UkdVcVhIcmptWU85OTNHUVk5Ni9VcTRXOVZqM0Q0WWhVMHQ1bnRNSmphUnMz?=
 =?utf-8?B?aE5vYUtrbDNDR20xa1d2dkpSVGtzemdpWlprRlZnNjRialhkeVRmOVpOeDNP?=
 =?utf-8?B?VlZxcGl4T2pmS1RBTU9CaHVUYnBXUE94MDFscnppL04vQityTk1vK1piTlRT?=
 =?utf-8?B?UVErYlVYbCtuNzRyckt5eXRGRVByTGdRSHBERUNpVGdXTktuUlZhZXl6cEda?=
 =?utf-8?B?RTVRZ1FrOGNTY0dVUXczV2NHakl4QTZsWW9mM1lwdVdISU5yVWUwV3phNnQ5?=
 =?utf-8?B?amdveEZReVRhSmZLV2dqcVlkV3dJVjJMUG9LZm9oY3VLVVdJUTIvZ3dlaGpB?=
 =?utf-8?B?enVwZWgrYVBMSXF1dEdHNDlzcGw3c2ZraEtmN3Q5SG83c0wyN0pTVWVRNjhr?=
 =?utf-8?B?YVZMWUhBaWk2TEVZVHh1RDdDWmNiRzZBb2ZlU2NYY3RVd0IweElnb09vbFJL?=
 =?utf-8?B?UkhzemJja1AxZERuSzNvY0RTRW9pWUhKcnlnZG1oZFFPNmQ3VC9FQ1I1ZG1l?=
 =?utf-8?B?b0xnVnhja1ZFdzM1djZlb0pmU0NwSkRWbDRrK0RCZmNNcTdqb284U0ZaTGpI?=
 =?utf-8?B?WmNMU1VpY1FLVmU2YlpwUDVOdkhUMExKNGR0WkNLV0NISUgxNktGb3RxU2F0?=
 =?utf-8?B?QVhPaC8yeVlUSm1tcUNPSGtZUmxHekRGNk9SYmluSS96elE5dFZXL3B0NlQ4?=
 =?utf-8?B?UFdCMll3ZTM1V2N2cWpOblNPbHVRWHhEbEYyUytsU0g0OUpVQStUQzIrTGJz?=
 =?utf-8?B?SmtUU2RVUzN0eFlLSnlHamd2dE5uSnk0MUVHTTNHc2I0MWM4RTNPWGliTFdJ?=
 =?utf-8?B?emV5dWFNcWgveUlDcld5bWRWWFNnVzEydHhjUklkOFFBbmlMTGlPRmtpR01R?=
 =?utf-8?B?Zk5wMmhyZXI0eStVNHpxSnczK01sei9nL0dRNWphWGlITnkxWTRpRzlnVm9s?=
 =?utf-8?B?VnRtL1ZBODRYRGxpOFBqS25TQXNrWGUzdjlzVmp0UEhHZytaOVpOaVpNTXhz?=
 =?utf-8?B?WDdIV0Vwdm15K1hzUWMwcUlzdHZRWk1xZStqeEEyWnpjOUFFRmFLTE5wY2ZH?=
 =?utf-8?B?ZTRWT21OdjBEaW81RGR6MHgxaUl6TEFsL1R3ditJdFdRZHFlanNYS1hmT0Jv?=
 =?utf-8?B?UXBxRG1tQjRDVlpVOUpsQllPWkJLZVg4ZTQ1R1RRZ3V3N01HYSswWXVUeEJ5?=
 =?utf-8?B?UG4vU29UMlJnMDFYSUVIck5SNjA5cnlPRThhS0pYNkVYanNTV1o2Z05lekhQ?=
 =?utf-8?B?UHNvY2RSbUZmVXBVUWdvNG1jbERRSTFYYnlxVUVxa2JPWHJjbUNRQit0R1U4?=
 =?utf-8?B?SUsyZGZDTzgxWDk3ZmYvTEZMSG5sZ3NiYUZ6TzlaY01JQnVzRUM5NVBKK3ln?=
 =?utf-8?B?MmlWTWZ5ZXJ1UUlscENZdnkveGNnOTMrMVpjWHkxd0NFMzgrZkN5NjNvUHNn?=
 =?utf-8?B?Ty9YYW5udE5qY0FYTHpWM2ZuYk8yNXQyUlVkUnV4U1FmaUdWL1gwQUV4RjZN?=
 =?utf-8?B?RHJERjZONklMZ3p6cUJuMXkwU0xoaXRxYm1KV3hqOXNNR08zTzduNm9WRjY0?=
 =?utf-8?Q?3SBYIkGXGcT8juedIHUk7fBpyPk+0k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnkwbDQ5Ym5PODJSZUFXdjBNcExSTEREaW1hQm03QmJLbElyd2VIemxNWXYy?=
 =?utf-8?B?OTh4VVBUakFtU3FHVmwwODBaVFFIOTEvWi9Gelk2K1R1cVROb3NkblY3dFBp?=
 =?utf-8?B?SWI4SlVZQVpsUWlQRW13dEt3WVNWNDNIYVp3eDRQK0o3RlBqWU1XZHVnT1BB?=
 =?utf-8?B?R0c2YnF1bkhWUzFtbEt3ajA3cWhWcEdSUEdPRVhqWGYwTEs5M3pJN1N4aUJo?=
 =?utf-8?B?a2pCUnFuWnJGeTZ0TzdMVHZLOGxnRVRsRzlXdTRMeWVCcUJqdmJhZnRZeGV3?=
 =?utf-8?B?ZEVRTzFFRC90amlYclFlcktjTjU5a1kzSWFpaDZnUHFyTFVQM29HYW1KSTh6?=
 =?utf-8?B?dzRRMWlJclBuOFBzTjJXMXd2ckhoZGFoQUVWUGpoT3lmYzZRTGY1QWc1VC9E?=
 =?utf-8?B?L3YrQzdyakhWMFZlQXFVMXpPcHdlR1RZdkFJSnZkY1R2a0RiV2kwMXc3M1hC?=
 =?utf-8?B?M0xDK3N3aU96ZDVkSWRoT3BLQnZlUCthSlpzSTNEdm1aZVFSZjd0bUErdVpn?=
 =?utf-8?B?RVMwbzc4WXhSK1A1NUcxNjhpSWd4RGgzYWNlVkhvOWFjZ3N5K1pobEkxWEF0?=
 =?utf-8?B?Ym92Ny9sVEJBTi9rd3VzUmVQSjV5aTE0NVMyeFY1WXA4cmN5aDExY0tsc2pP?=
 =?utf-8?B?NHB2dW8wd25BWmQ2SXdCZG0wRlNma0hHN1A0NVkxNGVXcmZ3VjNBekYxeDJW?=
 =?utf-8?B?cFlvd2IrYVp5WCsyL0gvMjg5VGp2ZW1tb2RLQTh0ZWdRMFJabHRoWDB0bjht?=
 =?utf-8?B?YitHblBzakdlcEVTMUI3M2pDWVpSOVc4OGpoMFZhTEdIaDlYODlVeE9vYzFm?=
 =?utf-8?B?Um9EVnlLVmhpRU9Fc0hLc3UzNU14SEhuOERLTk1qTW4zN0ZDcFZKZlZCcW9F?=
 =?utf-8?B?VDNVYjgvb1JFUlNhWit2VVUwSFFvNm5kMkxqTHViKzk4WlVpM2tRYWhKR3Y4?=
 =?utf-8?B?elZsUnViaDUxei92ZEhtcUp5OEw2aVNKMVdXMUxGd2QwWVhaaWo3REZoUEpL?=
 =?utf-8?B?MUNtNTRrbElVemQ2WTVWNkJZODZ4UlYyMDdNNjgyVVRMdlRNQmc4ZTkxUmV5?=
 =?utf-8?B?bVJlY3htUm42UTFRNExPU1haWHpVanBJaXhJVzBJZFp3alh3ZU9lTkd1cmI5?=
 =?utf-8?B?Vi9LSmF1SEhJbUVzTFJmWlY4cnpEOUwxanQvaGV3ZG1BaHJCUTUyNHdiS0hl?=
 =?utf-8?B?bGdHaG1wMlNoZ2UzK3pWU3pReER6R09SWDdGcThFNlArckNCTk5hRU9FaDF4?=
 =?utf-8?B?NngrV3pyWklURkpPc3l1WkEzclZIK0FtWklYdlNFekRHdDBTNTc3eHo0R29z?=
 =?utf-8?B?RUpSblZ0UWdwSlpiUEF1b2d3WlQwTEFtYkxsNWdtRnVCdTRtMlRObmdqUDBN?=
 =?utf-8?B?UzJXYnh5SUpvVWI3NDZLRm5LdjdYUVNDMldmY3E1QVFDS2l5S1o1NnZYWEZL?=
 =?utf-8?B?a3o2QXJhRmdUZmVvWFlNTEdVelM2OXhQbjdJQXR5OVNOcmNzL1ppYWdWK09w?=
 =?utf-8?B?K2dHNGx6SzU1elJaZE1leWcrNFdveC9QelQxaXd6VkdMSkxkT08rMmJ2NzEy?=
 =?utf-8?B?YVBNbXlrbmd5YnFVbVpWeU92dWEwbjBsMVdYNGpsa0M3R2FSdXZPMGdoZ2lT?=
 =?utf-8?B?cy9DTmNSbmxuclNkMkx4RHhua0c0bzhEaVdRSWtWRGdOL0Z3Zmx0cWQ2RVJ2?=
 =?utf-8?B?Ykh4dHdQZzZGamRiRjBTTiswN1gvWDl1dWU3WmpVUG1vWWV1emw2dURGNzFB?=
 =?utf-8?B?azZKN3B4OFloOFdQOEhmSTNsVnBHOGFDNzZ2Uk1CY0ozbVJEblRhVUwwQVRz?=
 =?utf-8?B?S3BoU0RoYXloVnFFbjA1MThkVEFMNzNwbXMzTjNxcTVwM25zNWpJZTcrOHJK?=
 =?utf-8?B?UUdHNFRlaG5zeG1GRmI3eUZLSXJZdCtCWVNwYWJiUW9sWWRMUW82TTNZNlhu?=
 =?utf-8?B?MktRUENBbDJFSkVzay9jUE9kQm91MzM1YnNGVmhWc1NXc1ZnVTM4ODZLL2pt?=
 =?utf-8?B?a3VpbWdpZkhXZkFmMUZGME9vREJKUXNFQkswYUtmZENWSHBMS1JzTjBOWVNZ?=
 =?utf-8?B?alpkbzBxUWJxbWR0Sm42bTU4c2xkaTRCUXhNWmoySUJjR2R6dnU1Z1grYzBk?=
 =?utf-8?B?RWdRWjlhL1JxRnNNVEVpSHBaQVQ2ejFvM0w1bitOazM0SmpESEpSc1ViVC9F?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BABF20163A9258439DAD6623A0CDB2EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fc982d-59db-452b-df58-08dde670f65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 20:25:00.0049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lz9jLJW1iYoFrrT5fBS3cK06G/v+WhAx91f7MFYc9dSPurGEOQYs8F3gJGk2+panp3KQohlBFHmRnR6PeIIy/MUtqgqdtXIGLGi9Wltc5ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDIzOjIyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEVucXVldWUgKGNvcHkpIHRoZSBpbnB1dCBzdHJ1Y3QgeGVfcGFnZWZhdWx0IGludG8gYSBxdWV1
ZSAoaS5lLiwgaW50bwo+IGEKPiBtZW1vcnkgYnVmZmVyKSBhbmQgc2NoZWR1bGUgYSB3b3JrZXIg
dG8gc2VydmljZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1
bHQuYyB8IDMyCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhZ2VmYXVsdC5jCj4gaW5kZXggYWVmMzg5ZTUxNjEyLi45OGJlMzIwM2E5ZGYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gQEAgLTMsNiArMyw4IEBACj4gwqAgKiBDb3B5
cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbgo+IMKgICovCj4gwqAKPiArI2luY2x1ZGUg
PGxpbnV4L2NpcmNfYnVmLmg+Cj4gKwo+IMKgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgo+
IMKgCj4gwqAjaW5jbHVkZSAieGVfZGV2aWNlLmgiCj4gQEAgLTE1Niw2ICsxNTgsMTQgQEAgdm9p
ZCB4ZV9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUsCj4gc3RydWN0IHhlX2d0
ICpndCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9xdWV1
ZV9yZXNldCh4ZSwgZ3QsIHhlLT51c20ucGZfcXVldWUgKwo+IGkpOwo+IMKgfQo+IMKgCj4gK3N0
YXRpYyBib29sIHhlX3BhZ2VmYXVsdF9xdWV1ZV9mdWxsKHN0cnVjdCB4ZV9wYWdlZmF1bHRfcXVl
dWUKPiAqcGZfcXVldWUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBsb2NrZGVwX2Fzc2VydF9oZWxk
KCZwZl9xdWV1ZS0+bG9jayk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBDSVJDX1NQQUNF
KHBmX3F1ZXVlLT5oZWFkLCBwZl9xdWV1ZS0+dGFpbCwgcGZfcXVldWUtCj4gPnNpemUpIDw9Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9lbnRyeV9zaXplKCk7
Cj4gK30KPiArCj4gwqAvKioKPiDCoCAqIHhlX3BhZ2VmYXVsdF9oYW5kbGVyKCkgLSBQYWdlIGZh
dWx0IGhhbmRsZXIKPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlCj4gQEAgLTE2OCw2ICsx
NzgsMjQgQEAgdm9pZCB4ZV9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUsCj4g
c3RydWN0IHhlX2d0ICpndCkKPiDCoCAqLwo+IMKgaW50IHhlX3BhZ2VmYXVsdF9oYW5kbGVyKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfcGFnZWZhdWx0Cj4gKnBmKQo+IMKgewo+IC3C
oMKgwqDCoMKgwqDCoC8qIFRPRE8gLSBpbXBsZW1lbnQgKi8KPiAtwqDCoMKgwqDCoMKgwqByZXR1
cm4gMDsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlICpwZl9xdWV1
ZSA9IHhlLT51c20ucGZfcXVldWUgKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAo
cGYtPmNvbnN1bWVyLmFzaWQgJSBYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlQpOwo+ICvCoMKgwqDC
oMKgwqDCoHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBmdWxsOwo+
ICsKPiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxc2F2ZSgmcGZfcXVldWUtPmxvY2ssIGZs
YWdzKTsKPiArwqDCoMKgwqDCoMKgwqBmdWxsID0geGVfcGFnZWZhdWx0X3F1ZXVlX2Z1bGwocGZf
cXVldWUpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghZnVsbCkgewo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBtZW1jcHkocGZfcXVldWUtPmRhdGEgKyBwZl9xdWV1ZS0+aGVhZCwgcGYs
Cj4gc2l6ZW9mKCpwZikpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1
ZS0+aGVhZCA9IChwZl9xdWV1ZS0+aGVhZCArCj4geGVfcGFnZWZhdWx0X2VudHJ5X3NpemUoKSkg
JQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVl
dWUtPnNpemU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmsoeGUt
PnVzbS5wZl93cSwgJnBmX3F1ZXVlLT53b3JrZXIpOwo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV93YXJuKCZ4ZS0+ZHJtLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJQYWdlRmF1bHQg
UXVldWUgKCVkKSBmdWxsLCBzaG91bGRuJ3QgYmUKPiBwb3NzaWJsZVxuIiwKCkFjdHVhbGx5LCBk
b2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZHJvcCB0aGUgInNob3VsZG4ndCBiZSBwb3NzaWJsZSIgcGFy
dD8KV2UgYWxyZWFkeSBoYXZlIHRoaXMgYXMgYSB3YXJuIGFuZCB3ZSBoYXZlIGEgaGlzdG9yeSBu
b3cgb2YKY2FsY3VsYXRpb25zIGhlcmUuIEl0IGFsc28gY291bGQgYmUgdGhhdCBzb21lIGZ1dHVy
ZSBoYXJkd2FyZSBjaGFuZ2VzCnRoaXMgc29tZWhvdyBhbmQgd2Ugd2FudCB0byBrbm93IHRoYXQg
dGhlIGNhbGN1bGF0aW9uIGlzbid0IHJpZ2h0LCBidXQKdGhhdCB3b3VsZCBiZSBhIGxlZ2l0aW1h
dGUgYnVnIGluIHRoYXQgY2FzZSAoYW5kIGV2ZW4gc28gb24gZXhpc3RpbmcKaGFyZHdhcmUgd2hl
cmUgd2UgaGF2ZSBhIGJ1ZyBpbiB0aGUgY2FsY3VsYXRpb24pLgoKVGhhbmtzLApTdHVhcnQKCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1
bWVyLmFzaWQgJQo+IFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VOVCk7Cj4gK8KgwqDCoMKgwqDCoMKg
fQo+ICvCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBmX3F1ZXVlLT5sb2Nr
LCBmbGFncyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBmdWxsID8gLUVOT1NQQyA6IDA7
Cj4gwqB9Cgo=
