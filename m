Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C84E73164
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 13:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8206310E2B2;
	Mon,  2 Feb 2026 13:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUWpFF6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50D610E2B2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770038388; x=1801574388;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JUcFnCCc84uEeaZ8tl0xZX1ELyzFabGsP0vQrdAfDmA=;
 b=jUWpFF6NWKznlslWAl94ohL7irm7UwqqFMW4HIbRUw1D8Qj2ohSpGKCK
 o+86qO2krVz4UbmuKOmQlLcCaFuCFrrzruok9TlB/wMw4Y6jqywN8CQpn
 BRKMmqM2pTIulcHMBQ5NyKmI0+n2hLc2x5dxeDweeqmRjglnUJo2gvNEw
 m0n+64kIdwKDNTS2eJRmjQoPargCJrjJftD23mwlbWOcrmap5vOLma/m3
 yBQa/5qy+z24scfOC9bV9HCHo395/a3BV7uLv8sw3v4KgC+E6el7B2w5X
 e5D5aflOO/0B2mM9fsFbXwOpMrsZIm+rvJV6f2D0MN3XwC7854y8V9YvH A==;
X-CSE-ConnectionGUID: h7/D7GWIS4KIq5qW8eSpHw==
X-CSE-MsgGUID: e1iC2UAiT1WpNGhphF6sbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82302657"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82302657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:19:47 -0800
X-CSE-ConnectionGUID: 0n/vRuV0ST6vn414C7QKpQ==
X-CSE-MsgGUID: Iod0skF/ThygKE8oznpg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209676902"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:19:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 05:19:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 05:19:47 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 05:19:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY5wNgdqXRCgi6RuJJHWjcHwx1iw5ZTUsEhwzc42e7Q6/5mTrrg23UZRVF3jw008J9W3q0POP3oFWH4Qr+6ERgCTX/fT2gWFT7WZukZ6xwO9xZgUqxoOHt9+HEr7k96W6Uwcpq10FTmrLQA6W5wZ2Tc+zVTeMs8LpBCV9OGnZEmSfRxwlEV2Sv6nFHoNfRVMOdWRfNmAVMR2Td2MJ38b9B+bhYpzLXQ4+xXwU9biVOpVEoq5RNvF4alK4ScZbP91J2nwhMdbtgNM+NFJ7czUlBBCByBVmtXoqtpgpBXMBAcmiV1O2RzrPf2RT9ebd2hIHRKUKZxyQHQJfrM+DhsoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNnIk+EI6B7Pnuz6PJY32cs0+XitfB9gHLE/fJ9UDL8=;
 b=JCUNyUznu/EPmYnprJTaNntXd2k65Kkc7GndQjc6Fc6lAnsI6+MVVjcVe6zrhHaYgpp4M/I4jQ4ekQiLuizyrFfC9vDdQ6Y8R/vyelWxyZh0X2Jtc0+39Y5Zx79jHvLcM9YFMQRMAXoMuFob5v78l6sCzZ2mereDDzX4R0qcHliN/wI2EtjoMu+J6nbmgeniA+iV/SsA5IkLxa9YKOppy9yubB2VOHIRAWxKMnttkqlW0Tcjfjs2qfYTFkyBP3gDmwmkJRZFOYaH+L4ZSc1gK7JiwIcCeBYkAytPwtJIMBrAcC8U/odDCN41Xd1nImmC7Pq4kXAiUXkPB642iZc+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:19:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Mon, 2 Feb 2026
 13:19:44 +0000
Message-ID: <190d1d4b-161d-477a-9c14-d23bbb7d8610@intel.com>
Date: Mon, 2 Feb 2026 18:49:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
Content-Language: en-US
In-Reply-To: <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 85235ff4-cdd8-4fec-848d-08de625dbab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVzSkZqU1lybHNra1orWjRNTWlhaElwNGFnVTBBeDBpcHpEL1h4RHJQdmph?=
 =?utf-8?B?cDZQK3RsLzlpODJyZktEcHBPSlJFc0YzRE1VU3lOYllqR3Y4OTc0VElRVklC?=
 =?utf-8?B?L3VsK0FUbG4zMnV0MGlma2tWS2Z2L0k4ck1Rek9WZWJmdU04em1UOUFTSDFs?=
 =?utf-8?B?SWJpY3dWMW1VZENLNm94WEFNNE1NQU5kdW1lWXJVMU5TSCtIT1FkOGNvbnkx?=
 =?utf-8?B?K25lY25lbm4vcDh3R2dpcjRPelczVFYzeUx4b1FMcWN3NWlsMVZoaWR4TVNC?=
 =?utf-8?B?bEJMbTRvTXhCMU4xQVNpWGp2djc5U2owUUlVMVk4RVlMeDVvWWp6ZjVadGN6?=
 =?utf-8?B?R3FqeHoyQk15LzZpNzdVWStleHR4alg5UmdjbjFYNHpyaGdLblFiVS8yRGxu?=
 =?utf-8?B?NUlTcFpJQkFFdTVkOTYxeVdVc3JaQmxZUFp2c2l5R1VuZEFXSnA0SFdmRENu?=
 =?utf-8?B?V1NrUWx6Z0pjdW1SSG05ZW5hRENnMUtSdmFIRkdRYWFyQnUvTTY2dHNwTHdK?=
 =?utf-8?B?TFp0NStBTkU1MHNmMm9QOUFkcU5zWUkvRjFrKzJQWUo0eFZRbDNHSFBhc2Na?=
 =?utf-8?B?M1RJV2R3Szl5S09OcC9JdW82aUpOODRxVHBqV09DeXhUT3JNNkF4R0lqeENs?=
 =?utf-8?B?ajB2d3kvNTlrdkc2cnhrbnk1NG1nWnFIcU0zWnpkY3dOM0RhWkxHaUd0dGJX?=
 =?utf-8?B?eGFKMEFqN2hKcXpleVRCeDFnRHpOUjFmSkI4T0JMSjRyRlI1TE9ySGs4WDdq?=
 =?utf-8?B?NWpvbm5QdDZZTlF5YVg5VU9ISHhrOXJFSnI4Y0VEZUh5TDRWRDF5aWthVDgr?=
 =?utf-8?B?TDEyRm1YRXJGenJQUllEQ3NFNGZRejhvWWJrOWtOLzNaOUw0MFU2b1dJUWdj?=
 =?utf-8?B?YVArWkIwdmVBUk5STTdKZktTZW9LN2hHTVZKWUF6QkZudWIyeDNpNTJoZTBH?=
 =?utf-8?B?VldxUlBxaDR5ZVNJZEU1cGRQckxRblcySEpVWEZaek1FMTlaK2drWG5OV2No?=
 =?utf-8?B?U2JlMHFYSmY1RTZxbVZxM3MwMjRnek5sS2hnS1hwSXVna1h3MExxVUUyOXFO?=
 =?utf-8?B?NE9Ub01OQVBvQXo2RFZXTEUzTzB4SnFUVlM1aEY0OEpkSENpdjc5WjY0VGVz?=
 =?utf-8?B?aW83ZTM0L2lwL0Q1aFdOdTBsNTBoWWtZVjZSZUhSb3p3SUp1VWtaUS82WVRH?=
 =?utf-8?B?S0xza0Q0b2FxYnNmalJGdmpERUp5VXZkWVM2aUJKaXM4MnVGQ3ZJZmp0Y2JS?=
 =?utf-8?B?S1RJcEhHOGhsTGFLOEx6Z3JDbXpONTRiOCttM1ZmYzlLRUx5d0s5U3hkTHFx?=
 =?utf-8?B?eUZnNmxaTUZncnJ5N3p6YUhDcWozVWhIc0hjL2Jtektqd0FWWkptSlQ0TmNZ?=
 =?utf-8?B?aFhEQ2pxY2FXSnI4cEFOS3VoUGw2WHZoc0w3dVV2aG0wQ0dIY1c3S0hRQWZk?=
 =?utf-8?B?QXo4SHZRbHRjUjdxYVFIc0oxdTFIa2t5ajZmSytQZnpYTFlORE1tWVFSS2pS?=
 =?utf-8?B?U3ZsSk83OTVQemlvek9OS0x0R1RtRUZJVHNYeUVsSXNmNWg5TGVDeWhhOTB2?=
 =?utf-8?B?RDJqOU5CMUdrMXVDd2tkajVMWTlDM1RPZ3ZzUVljTDQwU2hzVUdIbXFuYmJw?=
 =?utf-8?B?WHV6SWJKY2t2eG5iUkhZbnVxaEYreVJGVDNwYnhtR0RsekNEdUFFWlNJT3Az?=
 =?utf-8?B?RWpsWFpZc3hoOCtKNXNsbDU3cGhGVDRwM1E2eDl3TmkxWjFuOWpDY1FuaE9z?=
 =?utf-8?B?VU1CN2pqSS9KVitzSkVWL1NRVCttOEc4Mm9uQXpCNzhDNFFLWm8wcTBFeG4v?=
 =?utf-8?B?MkFqMU1HZXdVVHBBVzBxOUp4b1hRb1ZrcXdqdERuRkx2K3NMKy9saktGcGJ3?=
 =?utf-8?B?QkgvSVNXYzlLQWFPdC9ML3V0MkdKU3M3NHd5K1pwUHRXQlZ3bTZYcjUyM0Ji?=
 =?utf-8?B?SlRHZm41OStPcjVhWE5sZkVuQlgwQVFHVFhFcUMrRzhDVE9qNGwrRllxaWVi?=
 =?utf-8?B?UWI1dUp6ZXN4bWFXdmYyTzg2K1BRQmVTY0paS1p2cDF0WXZpS1lLaGkrVGVp?=
 =?utf-8?B?bGt6QmJObk03WXVwemZOdjlwSU9XRGJGblBRZXdZYk5ubUp3WTJLNXAybGFp?=
 =?utf-8?Q?zEpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVh2emFJaGJJMmU4KzNiSG9TVVZaTWxiZXhSNmE4YTcrV2tqTTZLRDVpNjE0?=
 =?utf-8?B?MU82bGE2NlZsMzFoTFRmelFna3N3dG9qbkk3d215ejMvb1ZRQ2J4T1pXWUFw?=
 =?utf-8?B?QWdvNmtFVkwrb0txMk8rdEJ1ektlZVc5ajM0Tm1pR2FDSjlqaEdrVVlkcThY?=
 =?utf-8?B?SlNVOGxzWmtLaGloMW52STZUb1JiRUxHRnZ2dS9QU3dEd1BNaW1wK3Zmc2Q1?=
 =?utf-8?B?bGxLbU1ZYWVZWFFFVXBxZWlSTUFERG15NUQ3dXhLSGtudVRZaDRjTXZyNVpL?=
 =?utf-8?B?SXlPaUkwempzaWlaL0xvajBQWklKcHNKbFJ0K1hMRmV1V08xaVQ0V3d0QTBO?=
 =?utf-8?B?YlllN2Zxc2JxVGZyTGtpOXIrVFlJMDI2NW80eTYraHFNdXMwUGl2ZEJxWlhj?=
 =?utf-8?B?QSt4anBkU3dPVUoyRzZLSUYyZWZERmtGcjU2QjFaQTNPbzZyWGEwanJmKy9S?=
 =?utf-8?B?ajNrMVBOanIwSkswTnBRbStVbkU3SXZtT1cyZCtCTzlkeUczZHBWa1pPbHM2?=
 =?utf-8?B?U3Jxd1R1OTVZOS9sRjhPTjdteG95SHhhK2lWV3k0MEgxYmhZdWJDTFprRDZB?=
 =?utf-8?B?ZnRMMW9rNUlBQm85VUQ5ZlErbkJzMjFRYzltc05ZTk1yNGNwTE9Sc1k2NTk3?=
 =?utf-8?B?RVZIUkFDOUx4TTJmY21CTG56RFY1Z2hmdjkzbTNPWEVYUlo3VWpkYUJZSHhM?=
 =?utf-8?B?RGZGaUFkaGM1MlUxd3Q4VlNUdHhIaG9reldEWHg1d1RZZnFBZVRzWnBDOElZ?=
 =?utf-8?B?Qm5vdnRjWkc1aWUxd2FvVS9uUmVrRmxBMkU2QW9ySWVOWHIvU01mY3lqMkpK?=
 =?utf-8?B?TUpjVmxWM28rcVJuc2xoa25Pekw1TStVL1hLTnFYVVR1ZFFOZkN0bkN5WDRD?=
 =?utf-8?B?Tm93eG5Qc0s3anNicGxYY0hWclgrRGYyOWVkRWFZazV6aFRiSFpyNHFqdnF6?=
 =?utf-8?B?Y2wyaWxRdjVJa3V3dE5WNU51QzMzWlhYeGtyTEE4SS9iK3dRUFBNTG5yeWVK?=
 =?utf-8?B?Q1I0QlJEcUVpWkdTQUQ3QWlFeTlCUmVnNEN2d0lLM251b0xtRzFudldqcTM0?=
 =?utf-8?B?SzR1eTEvVE9FZ2FNN0VQTXJlbitOT0pXZSs0ZHpuZWRJRkJPSmhpbnlCelVt?=
 =?utf-8?B?VDhTNnFCUGhUcFNNSlVjNFRyRFVLQjVDM3pLNUdyVUJsN20vb0NKaTFBR1ov?=
 =?utf-8?B?dEpocHJZd0FRK1k3cW15UTRCS2svYmY1RmNGZUtkQTlpa0ZqcFE2SEFvSDFw?=
 =?utf-8?B?ZmgxeWVTSnE2WHM3L1BKZ1NTYW5CQ3lSRzNCTG4xWDl4bHZvU0g2UDVPdFgw?=
 =?utf-8?B?b1dRSzRuUE1GS0tLcm42aW5VZXh5eS9aVEhjbjFUUnlKUnNrb1dnZ3lZYkFi?=
 =?utf-8?B?UzhmTldDTzBBN0UvMS8xd0dJRnB0VUYrenFqQStpQnZUZmJkZHN1MmNsRW9y?=
 =?utf-8?B?VWJBQTluRWxWRXF2YWUvNjB3WUl6WXdMeTN5ZWo4QWVJMjlvZytQaVVtVGlQ?=
 =?utf-8?B?d2l5eFRlcEdTUVR4T1hvdnNsbVB4SVp3VllOZHphN1RkV2w1NzRmMU04Yjly?=
 =?utf-8?B?UXZCZjFpNWs2NEE5UEh3TkQza2ZMZ0JtamF3VGxUYm9YRVdwb2NGaHpoMEUv?=
 =?utf-8?B?d3BVMnNjdHZCWlpSMDFqNkVqeldJQ0JvUFNESXFNNC8vaW5PS09PY3J1NVRM?=
 =?utf-8?B?WE5saU5BOWs3OGtWNWJDTzY5MTJ3Mk0weDFzV1RtNnRkNFQ0NnhUYVArSnVY?=
 =?utf-8?B?ZGhob0JONmRGNG9ZQ0RnaWZlVEFjMTMvb3p6M2RIMXZISnI2eko0SyszMU8z?=
 =?utf-8?B?SVoxWEFwcTFma0xiY09UZVF5NnBVU3YvZzZTdEtkb0NZZHpiODJMRWNWSWY1?=
 =?utf-8?B?cHVvUzFGQWs0Z0lUczByNjZnaFdUSXBLR2lkWVZacSsxQVkzV3F1QmR6eW51?=
 =?utf-8?B?ZTAwVU0yL2kwZ2h5WGw5cVRLNDhJTzVhK2I0MFZvb1RHRTRmTVpqc2pSZE90?=
 =?utf-8?B?VWNYcGJJVGFGNkhTKzZBMnBzTkQxWXJpSEFaSmdYWGo1UTV6eFZhTGJSaUJQ?=
 =?utf-8?B?ZDFBQ3N1eUE4NzJXckMwdG0zZlVUSHJTUWJ6TjRYRXRhYWtCdkRPdm96Nloy?=
 =?utf-8?B?RHlRd28yOWtCSzY2K2JrbU1TdnhMQ0w4ZHB6QXVHb2QrZi9rdjRqbDFzWndH?=
 =?utf-8?B?OWJ4bmkxSUV6QUZWUi9qYWVKYmdiRCtuOVdwVzJGN3gwazB3cVlWcDF6andk?=
 =?utf-8?B?T3pJZk01T2kwaVNVRklwaVFIU0I2UVE5SUIxa016N3NlUlZaWDhCQkNJQTFR?=
 =?utf-8?B?VVkwRWRzb2tZNUR6Z0VXVzc3YkVTR3QzTzRPQnllTDVMeWg4b0ZuZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85235ff4-cdd8-4fec-848d-08de625dbab9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:19:44.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+n4QnTLYOWLnnwGTUHg2CyzkU0otPA2jp/9E+iuvYz6LNy7VYuBePR8CTWmKwOxycsI3yXGv3iWWjViBI+CQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
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

Added few more comments

On 29-01-2026 14:39, Nilawar, Badal wrote:
> Hi Riana,
>
> On 22-01-2026 15:36, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>>   5 files changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f6650ec3ab42..5581f2180b5c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>       xe_page_reclaim.o \
>>       xe_pat.o \
>>       xe_pci.o \
>> +    xe_pci_error.o \
>>       xe_pci_rebar.o \
>>       xe_pcode.o \
>>       xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 58d7d8b2fea3..81480248eeff 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>> *ttm_to_xe_device(struct ttm_device *ttm)
>>       return container_of(ttm, struct xe_device, ttm);
>>   }
>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +    return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +     atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>                      const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 944f909a86ad..2d140463dc5e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -669,6 +669,9 @@ struct xe_device {
>>           bool inconsistent_reset;
>>       } wedged;
>>   +    /** @in_recovery: Indicates if device is in recovery */
>> +    atomic_t in_recovery;
>> +
>>       /** @bo_device: Struct to control async free of BOs */
>>       struct xe_bo_dev {
>>           /** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c92cc176f669..e1ee393b7461 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>       .name = DRIVER_NAME,
>>       .id_table = pciidlist,
>> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>>       .remove = xe_pci_remove,
>>       .shutdown = xe_pci_shutdown,
>>       .sriov_configure = xe_pci_sriov_configure,
>> +    .err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>       .driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>> b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..a3cc01afa179
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <drm/drm_drv.h>
>> +#include <linux/pci.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    xe_device_set_in_recovery(xe);
>> +    xe_device_declare_wedged(xe);
>> +
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>> +{
>> +    dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
>> +
>> +    switch (state) {
>> +    case pci_channel_io_normal:
>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>> +    case pci_channel_io_frozen:
>> +        xe_pci_error_handling(pdev);
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +    case pci_channel_io_perm_failure:
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +    dev_err(&pdev->dev, "PCI mmio enabled\n");
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = 
>> pci_match_id(pdev->driver->id_table, pdev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    dev_err(&pdev->dev, "PCI slot reset\n");
>> +
>> +    pci_restore_state(pdev);
> What is the significance of restore state here? In reset path any 
> where pci_save_state() is happening?
>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    /*
>> +     * Secondary Bus Reset wipes out all device memory
>> +     * requiring XE KMD to perform a device removal and reprobe.
>> +     */
>> +    pdev->driver->remove(pdev);
>> +    xe_device_clear_in_recovery(xe);
>> +
>> +    if (!pdev->driver->probe(pdev, ent))
>> +        return PCI_ERS_RESULT_RECOVERED;
>> +
Instead of invoking xe_pci_remove() and xe_pci_probe() for unbind-bind 
operations, we can use device_release_driver() followed by device_attach().
With this approach, the patch "Group all devres to release them on PCIe 
slot reset" becomes unnecessary.

     device_release_driver(&pdev->dev);
     xe_device_clear_in_recovery(xe);
     ret = device_attach(&pdev->dev);
     if (ret == 1)
         return PCI_ERS_RESULT_RECOVERED;

     return PCI_ERS_RESULT_DISCONNECT;

Thanks
Badal

>> +    return PCI_ERS_RESULT_RECOVERED;
>
> Is it correct to return PCI_ERS_RESULT_RECOVERED if driver probe fails?
>
> Thanks, Badal
>
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +    dev_info(&pdev->dev, "PCI error resume\n");
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +    .error_detected    = xe_pci_error_detected,
>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>> +    .slot_reset    = xe_pci_error_slot_reset,
>> +    .resume        = xe_pci_error_resume,
>> +};
