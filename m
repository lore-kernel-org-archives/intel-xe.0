Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97183CCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 10:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570AE10E05C;
	Wed, 12 Nov 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx3Ty4kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC910E05C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762943264; x=1794479264;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1a+svGYKYc0/q9+0/TNONqDNf4PeiCIu2k9uZZZ9Y0Q=;
 b=Kx3Ty4kjug05C7G8myAkhJkUfPgeMY85caHRimVDVwyZw5JoftHFrjIz
 vl6Ghms3gkhKUScFFJ81uNNfLJcRC/WCSw9fPAkrVF3r49VjV/y/aLK6K
 2en0B3pM8dn8UbYdRe6kFmOYOP2ZoSsFFdoVSFQLk8BkW5hWDTcsNquLP
 8kF8mUNagwW/xZ561JnKeDOHQDJ1/zdn3ssM2LxeiRnFaOQ84vvdy7HWI
 3tb6eF9iOkeANlqx32hmWPOtn4x3CsLg9FM0NUzb709kB3aqJbW3XWvGr
 QOScdtloJwNvQsRXnS5ngkdUvz8MXmSYsayFEAyG9M6/enQI2/0CJM316 w==;
X-CSE-ConnectionGUID: pqLz0+QqTROgR1o/l8WWUA==
X-CSE-MsgGUID: lKEa4U5XRQy9sgn78UdenA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52563057"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="52563057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:27:44 -0800
X-CSE-ConnectionGUID: 2NyueMV9Q6uQbOvQw/el5w==
X-CSE-MsgGUID: svsiooHJQBqYnrGQBFlMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188439785"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:27:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 02:27:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 02:27:43 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 02:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmvWrIn1w0zgenjRG3LzSJlqefba+O8qJazWqOwJIQDiErlYSlIdNsrWBDHaV6L/lcQtVU7AEYdMcnQtv0ELnYGnOvPvr9Xar1YVkE++/XUJG72sERBCrCyx7PX7Yw3up6tYuIN30X+ic0d64HSgOhjjqJeguiZuQKdwRNPOJZ/BJZMvuQIyfIqemehcJkJzA46vhP5DZDRDOKU9NfLJDoV+d1rHZP47n74/+CtG7XSTHPgB0OfycBaO2f0tamWPXCOF1FfFjXKOwzNx6Ygf3++fQxLjjcG7ejm14bwypwdP5scOcehgKvsA6zPOKk1nFJ+tUWDKgr6eyg2jMgMlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjGSvFYXgBbHczJOo/gm8oB7Eo6uoy/LJmqUPode+RE=;
 b=yrOOHmNxQc7zUCv8x1/UjjjdFn3qUK64m18kH3kccbwkyz5Qfy5hjnjSoXivmpJi171yus2FOkX9kdWSLoxTezQ9sfs0kLEX9Yw5RhY25gluBTdBN1HAkAfVdDOc7WRLkXFuasrDbkE1wMnAqbtMFwJZw/i63ceMmpBPuKD2OpEimdtjfFaa7WLxKAGhspW5TkXAuFm2nGuAK5AQIrX8DFUgEbKJ2nFoJJTVlPszUUjTfGxCpqc31UNig4oeiYYWcLHHDfGcjg7IY5NMXLzBOPgpsz/NRCjplejfgFmsAAiheisrI4XgiuFuxmGoL7UmkDgpqQAgnuslhwNPWT9wlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 10:27:36 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3%2]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 10:27:35 +0000
Message-ID: <31ee7d3c-303f-4cdd-a7ef-b1b066e95cb7@intel.com>
Date: Wed, 12 Nov 2025 15:57:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
To: Xin Wang <x.wang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <shuicheng.lin@intel.com>, <alex.zuo@intel.com>, <nitin.r.gote@intel.com>, 
 <matthew.d.roper@intel.com>, <matthew.auld@intel.com>
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
 <7c2ff78a-35f1-413d-8391-81c4b1afe0da@intel.com>
Content-Language: en-US
In-Reply-To: <7c2ff78a-35f1-413d-8391-81c4b1afe0da@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH7PR11MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6508ff-a92f-4785-20ca-08de21d618dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dklUcEh4RXRVNFZKLzNyREU4NTRnQzBMeW90OCtMYnNDKzg0SitXQ2dNZVcv?=
 =?utf-8?B?bkJDK1A3dmMwRVFHdGJNS0xRUkJQSlFoaHU4K2lHeWplY1NpS3AzTUlRcU9J?=
 =?utf-8?B?QnByU3N3a2NpRnp6Y3ZJRk14dGxwNDJpUFhRQ25KS1RHY2dsSzFVa3hHK3JN?=
 =?utf-8?B?cktUY3ZIanBlZ29LV01QWDhmdVNGWnJFbzBVUVJCeWw0UWlZWFdUdWZsQ1Ry?=
 =?utf-8?B?VlFNaUwwM2t0Tm9lWW11Z0JiamJESkhVR3VObWVwL091ZlVLUjgrVEcyMkRs?=
 =?utf-8?B?N2x0SFl1cVBpT3AyUTlETVVsMFR4RDNFUEVBUnFUanFWQ1IvcG9XakZsdkFR?=
 =?utf-8?B?SHloZ2d0eWNFcnZaUUp5VUlFbVB6UDZzUFlNSWlnOHJrdXMzWEkyazlUU3gy?=
 =?utf-8?B?Nk4yakpJQjVmZXZtTm1MN3lTRGFJLzVUSGhBSHZwM3pxZXdubkJTb1EyYm9n?=
 =?utf-8?B?WEZ0QW5KakovUjdLS0c2UkEyWG5aaTY0S3VLcW8rYmMrRDBMSkhkWmVubVZ5?=
 =?utf-8?B?QitHVkYxRDZaUGJJMERRTGVmWXNoWlp0UFpoUFFveFgweG5mUVl5ZDZ1RFBm?=
 =?utf-8?B?R1pQTi9sa3pXalNjenVWNERNZmRNZ0dXNzJ6VHVGUlY5d1FwS0VSMFdWT1dj?=
 =?utf-8?B?ekJrOGxaeXpwMUI1Q1RGRjAyNW15TDNwNGh6Z093MldRcWdLd3pmZXpac3BD?=
 =?utf-8?B?R05wbERKZGVxVVBYZGprMWdIUUM5OXZzb3dUMThlYk4zRGl5dXJtZXlsQ1RV?=
 =?utf-8?B?ejZlSGdPTnh5aE9Pd2ZzTHM1MWNzbUczbkt0RVZabk12OXo4Y2ZIUGNwM1JV?=
 =?utf-8?B?WFlMUVYzd0hZTGVleUEvWDJoSnRjeEx3S0NOdDJ0SVZpSlhpd2pZRnFSUTlC?=
 =?utf-8?B?OXRFMFRzcnBzbmpQcGJ4UVVnU0ZGK0JkdjdnOFJTM2hrYmE1WjVBdStKSnBS?=
 =?utf-8?B?UlZLK2FUbEJXYTZjeEtUbmZLQWxINmRlOFVGZ2xFREUwZlZwSVg4REtaUXVu?=
 =?utf-8?B?dEpHaDJiSy9jZ2RyY2cxNEhUUXQrMVRMKzRPL1ZIVStXdk5tQktqSzVyZ3dB?=
 =?utf-8?B?VExveVpTSnhSMnF0U1A1dlNxR1dFM0ZYb05zb1VxZ3BvdzRKeWZjS2pTb0xm?=
 =?utf-8?B?UEs5WnRsSDI5RFRTZUJZU3drb0pRenF3amhxQ25NdVZ1aUVOaE9tV3JxU0lR?=
 =?utf-8?B?TDJqVEdVQjFuM1VOQzFwdmU5M3ZobFI4cTY2clZXU0ZZZUdua1Z1MkJsbEFF?=
 =?utf-8?B?RUxRVGtaZzJMWUZ6WFhqd1RlNVBiNFJneXdUc0ZsR2YzUERLekpqejBQZEtW?=
 =?utf-8?B?a2oraGtuM3h2S3J5R3ZoVEhzaXNwQ1BWNHVIckRoVHlkUU54ZzNPL2lXTjZn?=
 =?utf-8?B?WC9lRkpROFpFOXBQenlUdWNCZWtWSERzL2lVYW1qYUlHRmxmUmdxNkIyeXVK?=
 =?utf-8?B?bjF5dE9XcDcyeU4ydnRUaEJwY1VXVnd0czFOMmdnZXJodWdsY1BnVDArTzNn?=
 =?utf-8?B?aFhaN1kybU5lOFVBZi9ybUhiWE15bmhwZVU2VUNaZk42T0k1OXFBYWNwMWJY?=
 =?utf-8?B?OG1QV3BxUGFtUnE5Vi91UzZoUzFNMzRIZ2RFU29XS28yMG5BdUdQU3NQTXln?=
 =?utf-8?B?RTJYbWJVdXJIKzRGWXJ5OFRyWUU1NThYc2hHOGR2cE1lU3BpcFMrc3VzNWo5?=
 =?utf-8?B?Z2ttRjMyUElXLytPVDMwVm1WS1djamhRSWxwcXZoNGZuc2NRUGt4dW16Sy9p?=
 =?utf-8?B?dzlNNEt1QkpiWmI2bXZtY0h2S0hxenhGT0UzMjJ2dGZoRVJEMGc0REc0aURH?=
 =?utf-8?B?dkZzRlI0TDIzSEZGTjdVZGdEbzdQSXlLRFBRalc2elF4L1F1eFFLNXBQblRR?=
 =?utf-8?B?ZU1FOW11Z2h6MkZxQk12Qm5vSDlyQmU5YWU4VUxTTzlES05qRlVIOHRscHNX?=
 =?utf-8?Q?HxVtx1is5UC9cBK0zQmqYSaN6itEqzxW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFqU051aDlVQUU1QWJKdjdlYU1QR01SRW51c3NUWGUyeWZBaTFTcXNIa3RV?=
 =?utf-8?B?VmllTytDODJ4YitXZ3NhNnhjdlU2SWc0UFVFZTJjM0hjWUtFQkdXdmNWSkdm?=
 =?utf-8?B?K2swdUVQV01Ra25ZWWNjY3F6aVZHWlJHRGZ2eEFLUC9WZ200dm1Ib3I3YjRZ?=
 =?utf-8?B?Y3FkTmV2WCtzK2oyek9MTXA1UkwvUEtvUGZnb3BNU2NYUmU4dWQ3Y3hMN3lP?=
 =?utf-8?B?R2lFV2Q2ZDFsVDZwOWQvNm01NnZkSVNIcUFubkZTM05SMC9UKzZ3b2p2bi95?=
 =?utf-8?B?TGl5ajVNUjY2b1JEdnlXcEFRbVFhM0lEcUlZa0ZpYUxCS3R4MVE3SC9xWmdH?=
 =?utf-8?B?dUhVcTNwQThWM2x6VHF5WFJqNkxsYU51MHM2NEtGQUlud2ZLbkRvTXhiNkUy?=
 =?utf-8?B?ZUt2ejJnSy9DTE5EUEdSUjlhVTIzSHpDWDcyd0VjbWhqdUZDWUVtOER3Ujg4?=
 =?utf-8?B?dlNPWDk1b0l3UUVRWG1rYTRHTEhyc0xkWXAxLzBwZW4vRklsTEpyaHVNek02?=
 =?utf-8?B?YU9MeGw3MHZNaXhRMWxacFEzTHhTREYzYzZYRWtLcWZ1WVZabFFKWVUxbWZr?=
 =?utf-8?B?ZzVaZUlJdjFMUkM2ZkcxOU90THFnOHhTQWpreUVrb09ZcjdlTmdPZ2srWUdV?=
 =?utf-8?B?ZHkvejNkQjV0Sm9TMExaOEpKKzkyK0tPNi94Ym5OT2RlQnVmVlFMTUl6QmVR?=
 =?utf-8?B?Q0YvTk5WMHQrVjBSUGxXOXRMaStZVFlabDI1dytTM2hzMGFNVlI4M2Frdjla?=
 =?utf-8?B?cmhWM2JXZmF2MmZuWkR3T0wvMjU5R2tISStLaXNMNm1EOXI5RW4zbjN4cCtV?=
 =?utf-8?B?SzA2VFpwNUo5OERjRzQwakVpeDVKaFlXTnNxSDRSUytWdHFSZTR4Wi9PcjQ2?=
 =?utf-8?B?ajljWXkxL0pOZnQreUNQMmhiTmNOT2FEcmJzRTdIWEp3czAxbDRvS0pnZW1w?=
 =?utf-8?B?eWhCWjdYbUNGK00yV2pMUWZPcWpPMWczUUJCVU1sbjlLVFJDYmRtYVEyNGI4?=
 =?utf-8?B?YWVubUVsZmtzbVI3d1R3T3F0Y01YSkhha3BNam45NWJlWWN6MHVNYzdKY3pi?=
 =?utf-8?B?WW5HenM1b090dktBbHMybGtEM0ZEbVRaRC9OOTBkRFpoZFo5em9teVg3SkJQ?=
 =?utf-8?B?Yy9ERjR5SGxKUlJPZ0tFNlg5R1FtR1NwUmF6N1o1R1RNRW1kL0hkYUZvMTZK?=
 =?utf-8?B?c0JxcHlPenRGZWdTNG5RWWZjRlRRQjVqbUZhQnNOTHJlNWdubVdTSjNVZjNz?=
 =?utf-8?B?YmNrTE8yVFFvd1ZyMUFJWlVVK0ZQa3hUT3RTNFFhWlVZaUkycHVVbjhpeWhn?=
 =?utf-8?B?OEU0YjZBMlp4WmlnUlcwNDhPUVVtN1ZTV3hXR1hkQ3hQbk5OZDRIR3JRK280?=
 =?utf-8?B?V1VoeHY4M1VHV2ZOM1oxcUEwSXRGaGxrR1h6ZVRBVC92b2Irb01hblMvZTdv?=
 =?utf-8?B?NW5Lb0JQVUw2TkgzajZsMm1uMjQwdnV1MHJyVjllUzlYYzBPUTFPZVhiNzB6?=
 =?utf-8?B?b1Z3M2ZaT0FWMkUvK3RGWHRiWm9SWHZqaFJzcUxneSsvK1cwRU11OGd5UUZ5?=
 =?utf-8?B?ZlZDVm5rSXVhVUk4YzRVTU5VelFSakpOTS9tdlA4YXcwNlE1bXArY3JKUWpu?=
 =?utf-8?B?aWRwMFdGMkovUDh0ZGg2bm5WcENwanNKdmUzV2hJdzlwZU1qYVp4VG04cnVN?=
 =?utf-8?B?QXhDQXcwMXJJMXhzNm5JUUM4d0dIYWJEOGkvQzNxU2dRNTlqaHg2QW9iNDlB?=
 =?utf-8?B?Rkk3M28wN2J5M1UyQzFZWTBJNERjWmhyTFY4L1l4Z3hUb2VGRE42R2JiM3ZH?=
 =?utf-8?B?eS9OQjZJTS9oajlqaGo1RmR6WWVmNVphMEVHMmNGVit1ek16Q0ZUMDFhRk0w?=
 =?utf-8?B?ZENQYWVDblpCSUR1dDlZazEvbGhYQnF4STFuL2xUVUV0VUxWKzl5emRQRmZC?=
 =?utf-8?B?TVhCTTdkNXBFWWtXMWYzZnRFdGxtMnhpQkw4aVhHaytKYnFpQTBvWkVLYnVW?=
 =?utf-8?B?L2IzMittQ2FOb3RCTXZiU0dpUGlvc3hBbXA5TTVZa2JoZm1pcktBeDk3SWNJ?=
 =?utf-8?B?U01rWmEycUJQNHp4OG5wdFZhM2lPWEpXU2tKSWYyZnlnMDdCdFVYM1Uwb3lT?=
 =?utf-8?B?R3c3dCs4MGRZRzMzNUpCZWJhMkc2cGJsM3BJSksvQ2NldlI1OWQ0a0E4Z1Nx?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6508ff-a92f-4785-20ca-08de21d618dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:27:35.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R004zkmu9fXikBRzJ1yyFiltU67foVlTjgx/EAD72n6Er0QNBLCU65YUc5cFbwBwePSVjpEv4kmZbSTcBCGd8WAR1qAwUXdAhrc3IjnHI3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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


On 12-11-2025 09:45, Yadav, Sanjay Kumar wrote:
>
> On 11-11-2025 03:44, Xin Wang wrote:
>> Add xe_pat_index_get_comp_en() helper function to check whether
>> compression is enabled for a given PAT index by extracting the
>> XE2_COMP_EN bit from the PAT table entry.
>>
>> CC: Nitin Gote <nitin.r.gote@intel.com>
>> CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> CC: Matt Roper <matthew.d.roper@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>
> Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>
> LGTM
>
>> ---
>>   drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
>>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 68171cceea18..1b4d5d3def0f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device 
>> *xe, u16 pat_index)
>>       return xe->pat.table[pat_index].coh_mode;
>>   }
>>   +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
>> +{
>> +    WARN_ON(pat_index >= xe->pat.n_entries);
>> +    return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
>> +}
>> +
>>   static void program_pat(struct xe_gt *gt, const struct 
>> xe_pat_table_entry table[],
>>               int n_entries)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 05dae03a5f54..b8559120989e 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct 
>> drm_printer *p);
>>    */
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>>   +/**
>> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
>> + * the given pat_index.
>> + * @xe: xe device
>> + * @pat_index: The pat_index to query
>> + *
>> + * Return: true if compression is enabled for this pat_index, false 
>> otherwise.
>> + */
>> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>> +
>>   #endif
