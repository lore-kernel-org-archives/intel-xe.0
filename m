Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F55D1266D
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 03:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B010E0AB;
	Wed,  3 Dec 2025 03:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3tp0VtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0AA10E0AB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 03:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764734056; x=1796270056;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W5P1z9dGXSylTeQqzoHe6CaRyOVvYK/koOlhTQ57alA=;
 b=F3tp0VtR19mIPVEQJkVPNbL6vvKYjNMPmciqpvYppQ46+Prw3+/+JkVA
 WCC+fSFz6GTQYgxVH/BKeNOq5aDcuPgKGC94BKE0LH+xS6isdcZUVKpQZ
 rIEqb3fCxiaWYxS8ekmjKuGOGwh8lRj3cmnPKBGs+aSn6V9Wu3ZOsrQvp
 /p9R5BkfvoKpLrt7N0oCcmFkt9eVAIPELcZp7vKEr3+mgA9KCJKfP1WGQ
 nPNxgrCwx6NmmkHcZxtdo2/MO/FRtiI7bP19Imy7H8t1xTNXHsqB4g1gU
 MlMjaBvJz7ioDANnAQtLNKORHmYi8HK/dwDhflGYc6B1KppKrOuIWwHTZ w==;
X-CSE-ConnectionGUID: Wo1bwyBCQNW9DI/sb1MWrg==
X-CSE-MsgGUID: dbnse0ODQceacYYHoMUwjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78064635"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78064635"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:54:16 -0800
X-CSE-ConnectionGUID: 5/l5oDWJQq+Ep2eeZ+JrkQ==
X-CSE-MsgGUID: QDHr6ZpyT0CBq2EI3/I3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194661840"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:54:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:54:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 19:54:15 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:54:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLJjNdGnTO9O4QU69LQdmguf4oHbE00VPWkuQXPTGI1TB0Zq/aAnEdOik6GinsQlCp4rB4f/aewxUMTAWkQ77Rr1YWyOsbxab5nkNm57hdA4VbPsgS5Xg4Ged+qycGA5S82y2L71XXfcrgj2xVOgVIfuYQ6p1IhPMgVh3W+KLsi8A31QPSyy31QMhowlBb0KGSfkoC77N1GjVCc0UobwgavyXv7+eLTQcTLAFCTCkmWKww0Kymx/qtga5pmSqhlMIjPbCLZoyFARBVcJNZXEtGJZr5K4xc77ZfseEBxeFnCj4sOZkL3322z+ErUkWPUHbN7c0OpMbXiugLDtOIrXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZmZgd3yZ6PE9mTLvpkuGSBisPxF56VRiVhug+EDKQM=;
 b=FteIdlBzuyLDuQCLhgfFvEv/e9bukyMi2bLd5l9WzsxWo3759ODudzoCTWRbTvPZxagkAzyZHsYxFSqxVL5ANwdgrDXCzQE4Ik7hL9jx5DiXeRyN+KcF149yUw2iViVhAB3Tcuz7kp36I7i4oc1Rgv0I2TKRb5A8os11VM5wEBeaJplGOAQstorP+cnYg8amKjHvnmaLnnnW5Jbrsy8Pb5QzeX3S6+qtuPmrZr50+x+Znrhk26n4bTbP3XdSOuztMP7jVyUt8boozaKx7Sl/CSmlErvZi0VD9Wd/fpt+YwoCksq7fKir+RtYwF2zaKwbrgSYm191GbHe/pPIkOkeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:54:13 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 03:54:12 +0000
Message-ID: <4f523323-970c-48f6-a841-485e9046e5e5@intel.com>
Date: Wed, 3 Dec 2025 09:24:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 8/9] drm/xe/uapi: Add UAPI for purgeable bo state to
 madvise query response
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-9-arvind.yadav@intel.com>
 <aS83dKXLLHvvSHas@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS83dKXLLHvvSHas@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|PH7PR11MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 33604a29-9da4-43e3-8cbd-08de321f9e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFpOSUtDZGZPeGdzNUhrQ2VTQXkyUGtjaGVkSjBXMUlFY29HcjRUQkp4OHRE?=
 =?utf-8?B?R2E3UHJPTjA0azh6bXpOdWR2SGdiT0F4bjdzNTI3R1lEU3RhbXNENHBGanlG?=
 =?utf-8?B?YUdUaEE0NW5lTVFsbWcxTjU0dW80ODh0eVN2M3ljVEt0QVgzWk54OFNCMGFY?=
 =?utf-8?B?bTBwbjdOTkJxb2c2RTFpYTVQSFJwU3d0bDkxQm5SOU4xMHNLUjk3aERnTzFQ?=
 =?utf-8?B?ZzRxNm9DbnNQaktoTzlCTDMxdVhOVENLRlZCTnJsaXIwQ2hYMkxzRFlKWTIx?=
 =?utf-8?B?NVo3ZlF0ekJ0aWVuK203M2VDNzR0d0VBR0t2Zjlmd3BLeUZ0V3NtaHkzS2dS?=
 =?utf-8?B?QUJsOVI0UjdNUkFEbDNzUU5rREwvTVYzUTlSa3J0Y1dOZDl0RE1WeHI0OHhU?=
 =?utf-8?B?NGhUVjZ2UHBkYmExSzBRMWF0T3lkMWczdEZhb2tzY29xeFdaREJIeFJHY1dK?=
 =?utf-8?B?M2VrSHM5aXhJaDJ6OWloaERiWVc5QThPYTlTVldpQUVqVzJ4bS80dWlwYk9K?=
 =?utf-8?B?Zng4ZXlKNUY3dzlsSFZNbVdTRVFkYXg1aGl3ZTE2V0swMStTUXFzVWJ1Qjlt?=
 =?utf-8?B?VFNxZVhMWGZGOTZMQ1RFWkpRQndFRWZWYlUzTzQyckJIMms2VE1keUNEMjZj?=
 =?utf-8?B?N0RVeGZLUHpqZC90VlZpc3hDQWVFZTgvTGd4cmZUSlFvTGcwSkp0alZTdUZW?=
 =?utf-8?B?Qkp0dkt4cENBN2NweFp3VE1kd05hdS9OcDZvNHpVNGZ4KzU2ZHBLZTc0a1Z2?=
 =?utf-8?B?WVFjQ05sZ2dDQytRS3Z0ZHhJR0FPbVNtbHU2SFFROHpVcXhENXZMVDVZZGdP?=
 =?utf-8?B?YklYbU9wM1g0ZC9iLzd1Y25ZbEhFT3hlQmNZb1d2d1ZyakdoSjVodm9jMDVu?=
 =?utf-8?B?M3ZkM2pPVkdIUnBzYWprMHdyNCszQlMwQjA4aWJOcnVqa2lOZ0xxaGM0dkZh?=
 =?utf-8?B?cHliTmEwMDFGN2swaVRxS1VmVGpRM3RNaGd4L0ZoWHhPYlYvL0lNa2JpaWxU?=
 =?utf-8?B?SDByb3FyR2VlcThXK3lzc2hjTGZhaS96TkhNaktpd2J3SzlSaU56QitJUm04?=
 =?utf-8?B?bk91dXQ0NXNranhBUDdwa2RUc29FQUU0bVdTMm1jUmNINzIxUDdFUjAvdnI3?=
 =?utf-8?B?RWhleG4yUkc0SlJKekhlU0V3UVZvT0dVd1JGT2gwNFdGSWNwVFd2SEdrbURM?=
 =?utf-8?B?NkhkaDJaTXkyZ0VFN0hxQU01Ri8yNVJRYzJpNFJWQ1NTdzdET0FnUmhoRHpD?=
 =?utf-8?B?L0p4Q1pDZzBXeUprdWwxeGZxTHdXZHo5bXFMbGdDQ3pkV1p0UHdSdGJYc0c5?=
 =?utf-8?B?YW42SVJvanpzcXYySS9IQzZ5SGd1d0ZxZk9TUFRpdDZJOUFTeFl4UG4yQWR3?=
 =?utf-8?B?WWRkMzJoZmk4TDFiY0plQW92TjErN1ZQS0tKbFFXTDBJMWs5bVdBdjVHYURj?=
 =?utf-8?B?WWpEdXNSNWJ6eGFIaVZBcC9nZWNRZjgrb2pPcXI0OERoYTBrMnZ6UklibVpi?=
 =?utf-8?B?cE0xWndKOWYwdTdRTUQ0ZHcxNEFaNS9pMEhJR2docisrSlZmVkdwd21yZFBi?=
 =?utf-8?B?OWppMTZYSFQwbzcrdGFJM0FIL2w2QlpSZjRadXBzaHI4a3RjM1hsTVRqSFZL?=
 =?utf-8?B?RkxpYU82cC9NREJwMVhoQ1hiZzk4UVZjVDJvT3YyWmJUK3pLcndaYy9JWWRM?=
 =?utf-8?B?T21aLy9nN25jMUdPZWNDcGxmWFk2TUJBUWR0TGkwV0lYb0dTMzB3S24rN0Zn?=
 =?utf-8?B?MzBvVDAxOU01TERUYVNTZDYvQWpWVW83TmtXYWhkcW5UL3Y0M1lhRFNMS2pn?=
 =?utf-8?B?VkJIbk9JYVVmMUp5MVNlRHN3MFdORjdDN3lQaVQxZWtJcFlKYXhTUnhVUjcw?=
 =?utf-8?B?Ung4bldBMW14R2d4NDdtYUxpakpZcC94MFlYR1VTeE1nRjdJTHRIMGROamQv?=
 =?utf-8?Q?j3xdtmBkUqEOyDSRnNEmN3/DRIjBqFhE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNodHY1bkU5N0lwMzcyQXVxc2pVaWNzeTF4Z3ZaRG5jODFiSXRyUXdwQzBY?=
 =?utf-8?B?OCtScTF6VHg2aTdTcksrNWpGRUpQcUVoYTRRYXB4OURKU256NVJTb3Z2SkFr?=
 =?utf-8?B?RTUzQjRVbldqamNpS1hoTS9oY1FNR0xMTnpJelVFenJiSU8rOUIvajZqUU5F?=
 =?utf-8?B?ZWkwRGpObDFpQmN2aU1sK2tHOXZxTmZUL1U0ZmpSUDNzaEtzbjYyeGhTeFpR?=
 =?utf-8?B?TUt1dUN0SDN5d01qVkRXSnRGOFhBSzd5emhYb3BEQzlSc3dWTjdIOThNZE5q?=
 =?utf-8?B?RnpHaVZ3aFpVdllJSERzTzlZdWlYNFdTdDRDT2h1MFJqWVZtV0MzS3cvU0l2?=
 =?utf-8?B?SjhFcHZwbHorU0h6aTZMZ3ozOXh2akVVRUZ5UGVjUlhHR3lxT3dPa2ZjV3JN?=
 =?utf-8?B?RE0wSW9aWjRmU2ZuQXhFbzV0cTUrdHNORVdrVjRqMWM2M1lDNHI0ZWlBdmNV?=
 =?utf-8?B?ZVZHTXRWb0d3YzJvcVB1OE5OaXJySUl3ZnlMdmJpd1pldHdrYmlEWE5GSkYv?=
 =?utf-8?B?YzFuZWpOeVpzRC96d01OUHJjakQ4ZS90RlhiSnZsVWhmOS8rVlcyYlZqQ0s5?=
 =?utf-8?B?NDNjTzZScDBxYnptVWdaSENXbHNpdWU2KzJPSVJoRVAzOWpEM013N3VSRGJB?=
 =?utf-8?B?ZG5zMHQvMzRlanFSUG50MWhjcnVDS1lGTnlLWUpDWXh3bEVvdmQ4Q09WUUoy?=
 =?utf-8?B?WGZaNGtDTDVDdWhqYjhJVW1NdEF4d2ozV2UxMk9kZjU3SE9WTUpQbU1tZkR0?=
 =?utf-8?B?bHlJUkRTVUhYNlZNd3NGYmd4TzkyQVpWSG80cHFGaFQvUVA4OWVIV1ZRWEh6?=
 =?utf-8?B?VWgwOVZYQnlHNGtQaWZvdGxqeWhhQnVQR0Q3NnB6dWg5ZWxqS1RkZFdNU1ZN?=
 =?utf-8?B?MW1qTFkycThRaHdHU1pKemNwR2dSMEJ2ancyd1dDTHdGaGFrZ3c5SGdJYnA5?=
 =?utf-8?B?cXpQZGpBdG9XTk9aZVVoTTRJcWtNdERoN3lrY2l5QVNNZEVjQ0g2cGdwcVJS?=
 =?utf-8?B?ck4zVXhEN2x5OTdIOFNFNHNPUHF4UUlRZEQxVVpEK1JIWHhCaGZteDU5MlI0?=
 =?utf-8?B?YzI2WmpLWHpyU0xSeWE2TEVLaWhwLzFEa2xFaldYQ2hVcUZzNDRGdmsvS0lt?=
 =?utf-8?B?MFVlSDhqZGlaQlFicnJEU3FCdFBIemNweHpTbkV1dHZtdGg4TjJFVjh1czc3?=
 =?utf-8?B?V0w5OWlVZkx6Tm1iaGgxdmU3b3lTUGp6TGpxcVlIK1JPSjRxQ0t1STFsRGR1?=
 =?utf-8?B?K3ZQMWZPMmcwODU0TTFtaUNvaHVZdGxjY2JHbTJuRkZDZHgycCtPTmk5STY4?=
 =?utf-8?B?aldHZjVkY1IwMVJjaG8wSkxJd1ZUN3FtTU5Yb1FOdVdnQ0hydjNQUEdDOUNY?=
 =?utf-8?B?RGVyZE9ieUVOMkFxaDQ1Nmd6d3VCbkN3NnQwQTJkbThLaTk3K1RKQzRxeDdp?=
 =?utf-8?B?Vy9mbXFIWXFXOFUzNXpPWGh3M3B3Y0pvRVRsSXExaTNnbDFhSnBObkhmRWlO?=
 =?utf-8?B?dXFJclNlbVBDSThmZzdxUy84dzIyb0lqRW1TTGQwd2NrNVRzSzlWUTlqSFZ5?=
 =?utf-8?B?WEY1RktqOVhrMFN6MnVDMWlKamxMV0dONko5UWMwNTF0Zk51ZThmVW1sZ1Vn?=
 =?utf-8?B?SmxsYkFtc0hVVFBXeTFpWjV5VStGOWJaMVNyS0F6NGFrcHYrYlJYNVVJWXNB?=
 =?utf-8?B?M05TcnkzWDlpenpFVXp2Nlo3MllUaWlkTVRqdU8yS0l4c0ZlRTE0WCsvLzRT?=
 =?utf-8?B?bU5hY0g4aWRNT0lmaDVSS0lCeFMweXUxUEhTK1pNbFJJdktjT05INmZ0emJG?=
 =?utf-8?B?TjRvTUpOV1RnOEJKMkdiendDbVhiOUc1M2RtcWF0bXdYQjRHQS9Nd0JhSTNa?=
 =?utf-8?B?TnZWUVZJZ0haN2t6VG12QTA2Z3NWbWF2QWdKN1Bib1hvYWdyckpweGF1b2Zm?=
 =?utf-8?B?TUlJSEIvY2tRZGxOZmRQRHl3VlZFZ1BJTmNLWWJaTmRHOFYrdUlrNWRiU3k3?=
 =?utf-8?B?NmQ4ZCtUNUtUMExuZHhTNUYzL3JmS1ovVERVdU84UHZQQkt1akEzZUtDZHNi?=
 =?utf-8?B?MW50NXRrdkR3M2c1VDlJMUlncENtdXFMYnJsNnhMSUxhb0ZCVE44ZFh4QkFw?=
 =?utf-8?Q?uJ0BTzy0BwQFfW1YQeVFdD70r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33604a29-9da4-43e3-8cbd-08de321f9e89
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:54:12.6861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mywuoq1IaNIqY3dGLlOd1Ukw9ZvcdMf7t/HxuK47AOxFLf+2jQXvRxwbAqYYSBmFYaWcKtRnt5ypy3ZIM/k+1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
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


On 03-12-2025 00:31, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:18AM +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Complete the purgeable buffer object UAPI by adding the response
>> structure to drm_xe_mem_range_attr for querying current purgeable
>> state of buffer objects within a memory range.
>>
>> This allows userspace to determine the current state of BOs:
>> - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): BO actively needed, has backing store
>> - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): BO eligible for purging, still has backing
>> - DRM_XE_VMA_PURGEABLE_STATE_PURGED (2): BO purged, backing store freed (read-only)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 02d63938d16f..8f289a2849ff 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2147,10 +2147,14 @@ struct drm_xe_madvise {
>>   		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
>>   		 *    currently needed. Kernel may purge it under memory pressure.
>>   		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_PURGED: Read-only state indicating
>> +		 *    the BO purge state.
> This is tricky one. Since the value of purgable state can immediately
> change after getting populated, is there any value in reporting this to
> user space? My guess is no. So with that, I'd probably remove this uAPI.


Noted. I will drop this patch along with next following patch both.

~Arvind

>
> Matt
>
>>   		 */
>>   		struct {
>>   #define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>>   #define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
>>   			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>>   			__u32 val;
>>   			/**
>> @@ -2224,6 +2228,15 @@ struct drm_xe_mem_range_attr {
>>   		__u32 reserved;
>>   	} pat_index;
>>   
>> +	/** @purge_state_val: Purgeable state configuration */
>> +	struct {
>> +		/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +		__u32 val;
>> +
>> +		/** @purge_state_val.reserved: Reserved */
>> +		__u32 reserved;
>> +	} purge_state_val;
>> +
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
>>   };
>> -- 
>> 2.43.0
>>
