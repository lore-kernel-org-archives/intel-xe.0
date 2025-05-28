Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E1C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5410E1EA;
	Wed, 28 May 2025 09:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1QF6S7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BEA10E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423481; x=1779959481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=48mX9aEg+hVYR3qDDjDQsWyvbxUPwoWHElOCWIE7sb4=;
 b=d1QF6S7y5p7qG2m3xvSVT4m3X9kpJf3f7i3g0+h8oB7UDDan1cJ1thS0
 ot3/guiu/1ALCD8NKvm2Gczi/OOABSrfiuNzM55/JGO7MA+O4kn0+bRS2
 4eEhh3wYWzHL1VYXWVVveB2mVkqlsWnog2A9995m6U3fOk4kFF+AW40N1
 RicIANVu218p1KPG/D9U0E0z60/+93aBdzv14EkgphdjdEKV3Om0MkQ9l
 YOhXEzybmr+9THKkpmd/MQBE/GaqvD1gmrHuSFD++g+14I0iVQgUV1g6n
 ztjnQgOq+IijS2MVMxs0gxk8KdZU2HCKf6zAXvV9nUE5Y3W/ReRG7ufe7 Q==;
X-CSE-ConnectionGUID: oTiG/6YqTPu+Q6CeVIAL7Q==
X-CSE-MsgGUID: e21lHgvoQ5afFWhsGR7rcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50140004"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50140004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:11:19 -0700
X-CSE-ConnectionGUID: VvmKoLh7RpS3npS52HzIvw==
X-CSE-MsgGUID: T/nKYg3YRICCChWCaj6KHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143099008"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:11:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:11:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:11:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw5RRVLAGTbWW0BfPi89zoDyOBGHIWZAN3NLPAU0tGZpFAKVYaZRqgVOE5DHEEUQo6gNM/u9lHhXPfhEMuCbW98yIbqMCeEuyYjv2IjksIBIHLMxYcZ9CrIAPZpFYmzRyjPHULhy3j4sBEY91HdKawuyPttmXoGcBLChQuB0NxGiUvb7UKglhkL3mwVWpmvxYQ3QGjPokvyfsaIPDNM6fzp/OmDyiyw8iDkmc3KNUJiXWBx+B3HkKCsGvm9nEPM7ZApqyD2FNebmEvYmxw9OYXxieH4pLAy0N2kIPpSCkmclpmBrlwtiFcKaXDjZ4aJboM+n0jWLfn5TAzUONHjIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY3gu3UfMdKGTdFb5kgatOHgJ9xOeuncMEKtdaCLMeE=;
 b=CGUNkJKrjXXbwBjq3uUDo9Xbco9oIccRJz5SZXdX+t7fWNFM+ku14HnUdzMHjL+CmBXjXTHpqeKlG5XnReg/3oFz+cNV5nl4bN6wzHd+KpEya7BE2R4hPv7wfBpGdM5ho8/XxxjqGgray5M6aX2iDtqloR4wyhdiofEEkb0qf+E/LVyFi8jVaPdHps9P3hjpWkI+wiCKIY0yohHazAUMZ5sYECj7c5BKpxTesV1w0IyyhvBoDLkf8TMKCDQDImrHqMFWyFn0uMbewAUrdmxc89UFIUZENPzgqYFgq9XNkH+wYQFVNfn84jKR2BPUTGOTKW7TpOUSBe40iNnuxEddhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PPFE9989E69E.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 09:11:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 09:11:17 +0000
Message-ID: <5ba1fe5f-2065-4ba7-a0d3-68a36cfb519a@intel.com>
Date: Wed, 28 May 2025 14:41:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/svm: For atomic operations, continue with page
 fault handling
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527163340.1067968-1-himal.prasad.ghimiray@intel.com>
 <aDX0+qlQ50wxHHqv@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDX0+qlQ50wxHHqv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PPFE9989E69E:EE_
X-MS-Office365-Filtering-Correlation-Id: c2951ce7-506c-4d55-5a2c-08dd9dc79a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGhsSkVmTCtzWXg1M05zcElyVWRGL2NzWUEyd1o3d2YySzJjdVlTaFFsUVY2?=
 =?utf-8?B?eE5tVHZMM0tvQWxYRWVTSCtHVkprSHd2N1Jzc1Fla01TSlltUVJwRy9sMDhF?=
 =?utf-8?B?aGJtRGFla3QzRFo3b1hqT2F4ZXRwcWNVcGpRUkZpQXl6NnZ1OUtYVEdQT3Ew?=
 =?utf-8?B?aVRhcjhzNHQyQUl3dzN4NU5PUFk0TjJvQk50RkhuczNRZ2xWUnR6UGdUL3VP?=
 =?utf-8?B?RU0xWEhydUFFY0M3R1NWTzhsM3RFWUswOWpsSlJuc2Y3R0JWSnovaVljNFlF?=
 =?utf-8?B?SWh2TkVBRklySEVIdU0vZnZBQlhScnlBYWlIV2RpOGRCcndZeDlicERYRVpm?=
 =?utf-8?B?U1pNR2FQQ3hkR3FrcU9SRGtsSFNVMUE1ZitUblFiSW9zOHJvcExsVW90dDhN?=
 =?utf-8?B?eEM3WmVmZ3loV3lCdmkwOTY5a0h0bDJzQVloMlJnS1BQL2lmeG9CcEhBNHpy?=
 =?utf-8?B?Ty9GUzU4Z0JFM1hMSjNiWStZNkg0SC9CYkZLOW04UTJVY1R5bE90RUJWcFdn?=
 =?utf-8?B?YmdaWEluNlptZjJzendNTXBoWUtaMDFOUEZ5amYxbEVwbG5ybGtmdkMzMkxu?=
 =?utf-8?B?NjVUaWk3MTg3WTNhTXpLTVRGenhFZ2V1MTlKcjNyNGRjTHBNbU9BVzBITjdG?=
 =?utf-8?B?RUlCVitpQzVyN3BOTFExRmxpVXB5OGRpWC9HU2k3L2w0RXhVN2ZkMHh6SC9q?=
 =?utf-8?B?TjZScWloUkhxcTZhQnlVSUVXdERSTFBtenZRWlZkdVFtZWFwYStTeU9ESHNZ?=
 =?utf-8?B?blQxdmJSOG9oVzJ6bmdCaklCdGFxYm03ZkwxMWNqYUk2MzZQNWd3REFvZUpI?=
 =?utf-8?B?NHg1UFIvR0hFRlI1bklBQlY2ZzkzV00yeGlxbG0rNlVXaGo2S3pZVTQrVHhQ?=
 =?utf-8?B?cHpkM1AyRW4wazlIMlgzUnVjWGN3R2VOTE5Ja3FvbUJ5STVOTHZVNUd3eHht?=
 =?utf-8?B?ZmdvRUNScTFvQUxMaUxmOEdrS0NFYmpPUENvSDd1RFYzRXpwT0RRNGNuT2Zk?=
 =?utf-8?B?L0FNYU5yOEhVTGR4Y2QraFg3RTNVZm9YemppSnFBbjIrL01wV0Zjc0JMaVdl?=
 =?utf-8?B?V0svMWZ4SGNpeHhranQ2T0JEVk9QdWZLWGhxNFYyMlUvQWhlUW5SZkY5TTdS?=
 =?utf-8?B?Rkg3UkpuelRRc0JZcDQxTmFqcUhBVjBrRnpZVGNXZml5NWtDR0ZkbFlJVFhs?=
 =?utf-8?B?Mk9vczVDalEzUEFSZ0dnQUphbmg4QUUyYUtLRTdvamcwY0xNemNtSWhaQ3dQ?=
 =?utf-8?B?REVhUGRxRCtmQy8vWkdnaVY2aFFpVXBTUzJhV1pSNnhUblZuYnNPeFJxUEdX?=
 =?utf-8?B?ZTEvODVzbVNtN0YxK3drTlkxSXFFVVpSQndhTnZUWk5aSHZZMHZCTjZpWFp4?=
 =?utf-8?B?bDdmdm91UWVGazYxOWYzY3RiTlNsNkJjV0dkc2kwUXlzV1lmOE9FRml6Nksy?=
 =?utf-8?B?Y2ZzTVJwVXJjL0ZGQ090N2lhTWh4Q1cyTzZwakdISTNBbmltR1lSTHU1SlJq?=
 =?utf-8?B?TWF2cE5YaDg5QyszR2MrVURhK09odTVEWVhGSHMxUjRxVW0vYXpmejZiQ2lJ?=
 =?utf-8?B?L3N0UFkwK0VFZVlBdkQwK2tuYnBDdG81QVhpN3dIcW13Z09WOU9Tc09ibXEw?=
 =?utf-8?B?WGJLV3VIVE13YkEyZ0xFSnhDR2FKUmlSbXk3aEkwd1QrVG1VQnFZTVpXQlJX?=
 =?utf-8?B?ajVHdFZKa1dYVmhFQ3c0U1ZLdjZZem5icElwM1JrNkZIaGlibXFmTVpqdm1x?=
 =?utf-8?B?U2ZHRGprdzlMUU9NTGpoUVpTTEppYzZzc1UyRjR0TGQ2T01zTEFkR0lpS1M2?=
 =?utf-8?B?OXZrbkt3cXVNbEFVT3RxcmpPUHdPR3RxRnVpUlRzbEEzZEdpTk1ySkR2SFZj?=
 =?utf-8?B?ajJlZkd6amsxajREZXlKaHhhcXdBSkltYWxPRGFXL3p0dDROMlJRMUtUQlJJ?=
 =?utf-8?Q?IvCCS2PPiAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1p4ZC96OXBReUxRNkNmN2RCOUkwdStpOWVIRXBEbzF5SWQ3clg5ZjM2bG1E?=
 =?utf-8?B?NzdkaW4rY1FlMGZ5R09QaUFzeG5TNTkwME5TU1FFclBFNjhDbkJORS85bE1n?=
 =?utf-8?B?dGRYWEVKSDNlZWVNR2JjdVFmRDcvbTNaRENxd1gyT1NiRnAwRGVVYlZZdTdj?=
 =?utf-8?B?NXF4YVM3STcrZkRYcnR6L2RiSkpwN3VxNk44Wi9lUElIWnVqRFJRanY5bUFj?=
 =?utf-8?B?UklCbDZseitMWGp6V0F1REZ0RWhsWG1uN2NBdzFNaCtYZFdsSHlxUFJRNzB2?=
 =?utf-8?B?Ylc2Yy8zak9BUjJtVXFKOGZrdkRkellKYkZJYWZ0c2NZZll4aTU0NWt5eDRh?=
 =?utf-8?B?YytReEZuZS8zK0NLTXBqaGI1V01IN0dldjY3ZGV3c3lRK3gwb2tkMzBaV1dQ?=
 =?utf-8?B?eVZBNUZyZlJkcEgxeXpBdDlQZWl0TVBXaUxGbjF6dFJEZG9NRC9DVFJXTnBM?=
 =?utf-8?B?SUVXZkdTTEpNQS9GM2U4eVV2WjU2MFkvaGlsRTBLSmgxQ2hUU3hIdklJQXBM?=
 =?utf-8?B?WVJEcTRWVjdzWm5EOGVwQ292a0hINlNHZHlPbTdVZGdrNG9TYm9kaVdyM3BI?=
 =?utf-8?B?akZhNklzeWczUHJMZVB5VzBJdWdGQTB1b0pZUDlvS25GQWhqWE8vRytETmZR?=
 =?utf-8?B?S3pPSDlCSUhwNUgvUFV3cE84eG5NVnhBMVpTZDB5ako1Q2xqaE8vc2J5TjRh?=
 =?utf-8?B?MEJIYnFZUDNUU2p2cDZVckNnU2c1STZIY2dMNmdvL1VOMnRPSHZZWUZHbmEr?=
 =?utf-8?B?L2w5eDJlamxFODdkeGEvNzhldFB3ZWMyYTQwbElOdmRoVUw3T2FUVU5tYytw?=
 =?utf-8?B?aXpQdmFJcHBUdzdxSU8vRGhLbDlONURRMmtqVk5JYkxFdkxmVExDdjNUd1lN?=
 =?utf-8?B?Tks3dS9Ob0NhMXZqdFk5d2ozZUVKL05NRCtLMW5UNytXd3JTYldKNUZwU2Nj?=
 =?utf-8?B?LzJQWktGWUpVMGdhVEJvaUtrRytDcGExbURyMlFPTUJVWmlZQ1RCRXdqTFZt?=
 =?utf-8?B?RG5XUVZVUDRpTlBpNUJ3U2JSSFoxTHhGa3I3ZERObHlFZlNyOG1UT1J0Z2tT?=
 =?utf-8?B?OG9ROTBrdTBwUXB3Q3NaNm9DRFJjc1FKU1RlVVJTSkpTZmFSQWt1Yy81cXNM?=
 =?utf-8?B?NXVtUTFRQ1Z3UW1VV0FSak1YRWREcFB0NHBUdHJJb29OTklTNlI0YlM2WXF6?=
 =?utf-8?B?K3J5RGp0Y2ZiMWRPNHowTDZOOTlSRTJFblpUWUV0T1c3bENtd2JRcVNkVFF1?=
 =?utf-8?B?cFJkanpleFg5TkpURTRsVCtqdmtpV0FLcUNzZndkUDMzdmZZN3VIVWpGM1pk?=
 =?utf-8?B?Q1YxOEU1OG1kcEh1NGNGc0dZZ1hJa3NQcEZIenQzWFp6WDQ3MTIrRFMrOVd6?=
 =?utf-8?B?WGpPNmFJblp3c2Z4OWVMclhRcDhOc0VNSkFpSGlKUlExbjRMbW1RdUo4bUU0?=
 =?utf-8?B?TUljeEJUV1BqeHhVMlhaL1pFQVlMR2NRWkdEYlJkcHlYZzFBTUJUc0ZHTDlk?=
 =?utf-8?B?RDk1MklsQ20vdzIvVG1vUVRHZXhLZks4T0p5TGhLL1BSNE1mMFhra250ZUp2?=
 =?utf-8?B?cFQ0bjY2S04weEVqSDIrNG15eU1sQ3oxNmhZcjlqM0FiaVljTGUrN004VXc5?=
 =?utf-8?B?QU5aWVhpei9iVzZiRmlUMGhwbDZVeUwvZ2V5T1NieVorcWhwdzh6cVQ2ZHdn?=
 =?utf-8?B?UG1KWk0vWUxuTy9mMXo4ckJrSWp4anh2bjFkTmZxaTVUTzVvMEZGZjBwbUxT?=
 =?utf-8?B?SzFxSmpNa1ZiY1R0ZENZNXJwOUdXOXRwRXk4SURzRENjTUR4SmVyT3dUQ2NJ?=
 =?utf-8?B?QkNyWlhGbEhydnozMGdWVkM5MDNLMHNqeldEVjJZT0czem12Rm12WHM2OEJa?=
 =?utf-8?B?b0RjVnE2bnlLUkJkeW15Uzc3KzdXcjRWbnFxMEVabEljSGF0T0ZCTWRvRFZj?=
 =?utf-8?B?bEtaQm94dVkrdnpibTZtUGlkR1N4UlFydDk5NGZibmFaeHBiK1NWZmExVStC?=
 =?utf-8?B?b2JJb0EwbTdBaGw5RGhWL2grdEgxQlpPN2JFM3dtaVMxSWtFaDR5SkNEcjNU?=
 =?utf-8?B?KzNxekgyVklZcWNnR01mamlKMzJldXpzdDVBY0J4QXd6SkVYS2JuNVNkR2Fm?=
 =?utf-8?B?QVBIYU52QjB3dUlMSjN6Nm1iQUNkZkdEbFN1Vm9GZndvM3JJUTYzVndaaFZp?=
 =?utf-8?Q?03GUQuWXaxGtwW+gW/WTx3c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2951ce7-506c-4d55-5a2c-08dd9dc79a02
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:11:16.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX/ok72olRJzddFlFYQ+cdKFggiF2Sgqv6SvsSEu8nMOubvwxgpS2NY56QUdVJippMgFsfxVulh9XSsBNRJOuO9fie5kIHueSAW2CvQbQH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9989E69E
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



On 27-05-2025 22:53, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:03:40PM +0530, Himal Prasad Ghimiray wrote:
>> Ranges might already be valid but lack AE flags in the PTE. Therefore,
> 
> Can you explain how we can get into a situation where the range is valid
> but we haven't set the AE bit in the PTEs?
> 
> Looking at xe_pt.c, xe_atomic_for_vram in particular, we unconditionaly
> set the AE bit for all VRAM allocations. If we get an atomic fault, we
> ensure the range is in VRAM in the xe_svm_range_is_valid check so I
> think the AE bit would always be set here.
> 

Thats true. I broke ctx.dev_mem_only with madvise changes locally due to 
which prefetch in smem and then atomic operations in batch were leading 
to failures. Will address that in next version of madvise series.

This patch is redundant and isn't required.

> Matt
> 
>> continue with rebind of ranges for atomic operations.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 4432685936ed..d42d5df28115 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -884,7 +884,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
>>   		return -EACCES;
>>   
>> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
>> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only) && !atomic)
>>   		return 0;
>>   
>>   	range_debug(range, "PAGE FAULT");
>> -- 
>> 2.34.1
>>

