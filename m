Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A146CC7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 12:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70E10E6FA;
	Wed, 25 Jun 2025 12:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3+V1n4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282410E6FA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750856144; x=1782392144;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kMXE8gsjtSUAk0zsvw33gssiJ6gylIm3lkSewOyKshI=;
 b=E3+V1n4D50r5Q07JI4F2tKGRZIovL4goBXR8lt7O7PlEbBPObo8aRPCE
 wxhuHZqzYVSm2foS6Qk+49qkEfnVskTkiuwiREcFuiI4rUGJfePbgBdZ3
 hqR5Qp2GU2k3J1f2E5CQjW+LqptMkb+/hgiMn92Ps7lI46uIU8L6MAv2B
 PFf/IV9WEa4BnqbKpPKLoSwzfGBqIlK0wZRCntTBy076h2Bpmhv90poAa
 A2cVNAN1ao1swSeL1X4JlmWniqngznQ6WQG/S8+w+uQgYtB67DyBZUKgV
 fYdyPOxQsJgzYaj07Wft4QE+Td1AVOPFAkPu0wyV37OG0iz3dEE2Uyfis A==;
X-CSE-ConnectionGUID: RIobxE0jQOejbZqbS/NJ7Q==
X-CSE-MsgGUID: 4CCN/PUAQE+OHrCqF+/09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56926614"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56926614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:55:44 -0700
X-CSE-ConnectionGUID: NJ5QgqQlTJWHVz54F7xz3w==
X-CSE-MsgGUID: 47XxJ5sWTpeOnb31R4cyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151975781"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:55:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:55:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:55:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLeZ8nMYZGCGDHlut1KSC+qQEqgyER5ceqImxDy5O1Za30aqNp1d+dzWqUTTvpvLOhF134kBhkE4/BqfuIvIZOcZo2r5bzvazdqZUnyvp6GgGK5I943SWdgvkC5ByCpy/yHWwV+h0duMFz0zlbS5wExicDx56MA94Hi9mDHW4D33jy8rY3lJ3XmJmMYpS4abzKC9X4DfeIrf9vWHp0L9ECYJaelIt3OflSSnVlFGLt2MgZKl/JGvCdrQv5qaYddZQGzC/ynE+HJ4tyi+q62CLktSLwRZgIlDq/PunnVjx5sjY3sagtIM8SfPUgWIAQ0mZ+pom2RoRrfMEW5bTOLDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMXE8gsjtSUAk0zsvw33gssiJ6gylIm3lkSewOyKshI=;
 b=Uun1J0XarttxAbQD0kK+f8bVCFvdZz3TzGvu970P9Av00ze8uHA57TQzCjNEM2aMDjZ+OHTYZg/CXG3c2fGukQS6tHpZyKoNpUwKg2T4/b9Yq/Dfta+77DXKMpRMVU5DKRAr3L7cv6wiQYjQdzpcrMiOO6MLsyrt9pGc5rcwzVA1s/NEXdPEEUoXub5l0ZlOCETFJylK9vzF/vNdIwszl/hhwpA7slyIJNF9fK6DI3J+grE/yPHy85+v23YWyh8Y07gsSbgpjh46HCrmYqy3Gw0pq6Jzxkdfsd8ViDQfuueU+hRiGpu8wwA2Oy7oL7FViagTjTATR13eAGJV6Ihqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 12:55:37 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 12:55:37 +0000
Message-ID: <4826e5e1-1532-4c11-958c-f8256c88cacd@intel.com>
Date: Wed, 25 Jun 2025 15:55:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
 <pnoq7zzi4a7fvagb3yp5ugxaxehoqjqp3mvexyogsydgl4d4si@pynkjo4q5lf4>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <pnoq7zzi4a7fvagb3yp5ugxaxehoqjqp3mvexyogsydgl4d4si@pynkjo4q5lf4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3aca24-6de9-4086-4071-08ddb3e794d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VE5YKzBYZWt3VW1uNGFnd1V3cGxpZU1kK1NaN0tPTlo1N3lYeE9kNGJmckNj?=
 =?utf-8?B?YjR1a0w0STJCVzhpVHE2VVBPaCtDbHpHQUw1eUFKNEF1emdCSlBlbk9RU3dD?=
 =?utf-8?B?Z2VjZUd1azhFT0xhRnVVQWFoc3VzWUpMT01ZN0djSC9QSlNCMWhjL0h2b1I3?=
 =?utf-8?B?ek9kbDVHYUk5T3AxZWxwYlF5SzAzV0dneDJXQ0s0NTFHUEdVSEpObmwzTzN2?=
 =?utf-8?B?ZWorOWhDaDkvSzZpcHl4Mis5SHdtUnZsMmtsVUdiZmJlT1J1Y0pQRVVSVjlK?=
 =?utf-8?B?SVJzQUhjNVROV2dreVVnZ1YwNU05ZzFmcGUyNmdDY0k1a2hGMjNjVldyNE9C?=
 =?utf-8?B?TnB5c1dSRnpYTXNFUVJ0T1lpREdKY2xzcTZjUnNYeU4vajhnWHhoRXhHVUhx?=
 =?utf-8?B?elJkeVRVSW5PdjByZklhVDQ5VXJKTm5kbWYzNDIxT3pBV1BudDl1cVNwRm5S?=
 =?utf-8?B?YkwvT09pakRwQWo0RjhkMzZ0TlZUbXBSMDBCanZmV3VRc3VYMTRWbHlUSVB3?=
 =?utf-8?B?VmlIOU1nQ3FxVzJvSVVIZnBkZi8xRUpQeU1YOUlucXdlWjBVU3VncmQwSFZV?=
 =?utf-8?B?UDFObXFmaUJKdVVyQTdSSVV1dWxuQUQ4RUxOcGRKMFR3V3NMZ3pEdlhMKzdI?=
 =?utf-8?B?L0VVbEd0WG1acXJKL0ZRWU13M0FZcnhUTEZaOVBRZWJmYUNpNHV0eDN4ZXha?=
 =?utf-8?B?WVdBWHhzdElNcHZ1WlN4ZE91Tkp3KzI0SjZUYnpkelI3dUZFS1R5dGN5OGpV?=
 =?utf-8?B?L0RSa0R4RGhhWWlQUEVmTUgxS3lIeTFQa09Jc3lad0xWcHYyQVp3TTc3cEZC?=
 =?utf-8?B?OFVKWVlqVHVMZFk1K0RkWTYwK2FEVlpUN0xOVENXbjJ3YzFja0JIL3ZiS0cx?=
 =?utf-8?B?Zmhtb0xoTE42NHNERk4vcnJzS0hRbjJOMnhYSlBPdGZtMm41TmNBNU1FYWRG?=
 =?utf-8?B?dHNvajRRVFh1YWZDM2xoMUQ4NzVuNXdUc0wzcDhENUQrOVhtMC9rZWU2NWsr?=
 =?utf-8?B?NVowR0ZKcUdEYSsxbmFzcmo5SUZOQVJMS1ZrU3lxdE5DWmo1QmZqc2JCSU4y?=
 =?utf-8?B?WW1BSm1SWG1iLzhmcStRaWVrK3gwMzB3OFhRbG9GSGNjNzVQL1B6bnoxU1JR?=
 =?utf-8?B?bXFONWt0QmtvMUJET2ZQa0piSGtHZFNTNHVxRkxHOWY2cm5BMlJ1aGJ0TnNQ?=
 =?utf-8?B?MVRBbkh1ZUhIRmxXV21BejhQQmhjUDZnTHR1bitscUd4TS9INGk2WnowN0tW?=
 =?utf-8?B?R2gwMnE5MFBPZ3F3U3VKamtjZ0FSaG5zTjlNSTVsRDZ3ZlBQL21QdS9DZEQ4?=
 =?utf-8?B?MmtuS3F1TWJGUWRsR2VyaXAwUnhOTlFFcXF0ZjhPMW1mM1lENFhHMHBHRnln?=
 =?utf-8?B?dXBxQ2VPaGkzMWxEc0ZEOVE4a0l5c1BOR2REUjNqck40THFrSXdNamxJNHY0?=
 =?utf-8?B?ZmRGMmRNRjBZeEZVWlpPaGFpdkhIdHBnbGl5TmR6N3EyQ0U3ZlJNODJFUWFj?=
 =?utf-8?B?d1ZFRXliTWZCcW13d1B2VjFad2ZvOTdzWGUyaVF2Tm5lVlBicXJPdlVSMkNM?=
 =?utf-8?B?TXY5b0pISllzcjZKamY5UFR1dFlOaXNRQTNtVU5mMVJ6cE02RWw1ZWNEa2Za?=
 =?utf-8?B?cWpnemJjNjdjNUtJM1Q2VS92SVFYUGNaSVkyMnZ2bkQ4ekNmN2VjNmYveVk2?=
 =?utf-8?B?K3BDS24rQ3gvRWthMWFDNTZwS01xWVdqbnFGODRzWGxaRnpLTnZZT0RBOFVj?=
 =?utf-8?B?UHRXUnhoRzY2UHdJeDBrS2NXcExUTDZjT1BPVG1xTTdjdmhtMWFBSXdMeStX?=
 =?utf-8?B?Qno1V3J3Q3ZSQnJTbFVRTGdSdkdHcEUzTkVGblFuRXNyT3hXSlVnNDBCaFVK?=
 =?utf-8?B?ZncveGRwb1RnM3p2Y21YalpEam0zQzJ3bW5lMTJaWU5yWjhQaGhQeENWUDF1?=
 =?utf-8?Q?OGRN4FFzCPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJQZUZwZDdxK2lnUzZxd0RHNUZLaXk0Q2JzcVBnWVZsRVZ5Rm9VNHlZd1pL?=
 =?utf-8?B?eXBwUXJDOE5vN0YweEREdVQvSnRmNDM3UjF0a2hwSi81WHFmcHpMeURYelUz?=
 =?utf-8?B?NjRXTTZMQVp0dlZVTnFHQVRHZDFXRjJQeE0zOUlLTytuZlY3MkJYOVgxMmNY?=
 =?utf-8?B?Tys5SmJZQUtUTUVuUDhEN1JieS9OZ2F5ellsZkV0cGtSK09BeHFFTVRnQnE1?=
 =?utf-8?B?Sk0xcEFpZm1LamszVlI1b0V5RWVIK0NVczJRemtoMks4NldtejY3VWFBbGFy?=
 =?utf-8?B?MEM5UXllK0w3bDBBYnFTWUpXajM1REpMaGhua0JFOWZKSHc0ZGtDTnQ2MWJs?=
 =?utf-8?B?Nk81b0pieVFJaXFqMklKL0NMdUxFaklCUE5jQjNJSWtLZ3hCbUZ0cHZoLzFu?=
 =?utf-8?B?a21UYnJuWStGaXBCQkc0cFJPSkdWNklEenF4d0hJbHJiVFRVSVZFeFBLd2FN?=
 =?utf-8?B?aWd6c29udkEzRDlKR1MzN2Jva2xQczFQVkVxVHU1ZlNsYVF3RjNVNWxyV3Zj?=
 =?utf-8?B?dVA0RlM4NzNmNzJMSkI1TXZYTzQ2MlBFQkZRcEJncVFKWm16M2VhQlhobWlX?=
 =?utf-8?B?eWp0cWZvOWRSWUdUZFVBU0JEbnhOcUUxaFdILytYNGo2b3VoSmVVNFJUMVBs?=
 =?utf-8?B?L3VVbVZOL0FlSWRxVUZMOFNpdGYyRkIraW9zRURHczE0d29CanpWK0pDREQ1?=
 =?utf-8?B?TVB4dFhHaFE3a0s2OHpabEVpNXdnQWtKOXNiTzNvLzA0Z01hc2owb1Q1MjhC?=
 =?utf-8?B?VjdpYkFhTWJxSURzTVcxc1Z4MFFvb3dvQUpjcHpZTmZmRm1WMlk1ZFB6UzFN?=
 =?utf-8?B?OWM4U1R2Zjl3QW5VaDBjZlpUWmNzR3NuRlBLV1IveHBUblNMQ3hRL214ajdl?=
 =?utf-8?B?MGJISXoxdkhsa0o4NWJuRzNjZXJTWG9DcXE5cUZOdTFHU3NiV1ErTkR3bHkz?=
 =?utf-8?B?K28wQktZS1pzbW9peGJXS0hJWVhSRUI4SjNxYXdyeTA4R2J0YXlBdVRCa1dW?=
 =?utf-8?B?SDh1REE2UW02OFluWEJZc3BTYlhjK0JIWXZvN1MxcEtWdWY2SWU1clNkSlVm?=
 =?utf-8?B?eUVEUEVjYWx1L3R5MnpTT1ppc3ZKRTY4ZitKcW1lM0FqTGtDVnF5TkpnOTZz?=
 =?utf-8?B?d2RDdDBnU1ZTSElha21SRG5wZ3I3emdUUFZ1ZEJZYS9BSUVFeHJVR21ReER5?=
 =?utf-8?B?aTlMYmVWMXEwTnZpUDk5cjJFQmE0cDlmTlRscGdVWFNrd2YzVFJkWmJQTVZy?=
 =?utf-8?B?NzdjbUR5dkIrN29GcDBwNVI1RmVMZGJwczF4WHBHTE9MamZTdjBkcUtkd3dz?=
 =?utf-8?B?QkNwWVRQbEV1OVU4WStQWG8zNnQ4QWdlM21Wd0E4Q25EbVRnTEZuNFdNSjRv?=
 =?utf-8?B?TXROTTk4WlJDL0VJbXBsdjA0SXp1b25HS0o3Mkk0SjM1VERYdG9kbUtBVU04?=
 =?utf-8?B?VHJKbWVkTE5SYVhXMGgzVFEwRUJWS25WY3JpQmF2VzFESzdleEJpdGxsR1Y4?=
 =?utf-8?B?K2YyQUJ3eW93dkJpUTFGM2hnbjNSRTlXN3A1NDZkVzZiTjUyZG9oS3M5QnBU?=
 =?utf-8?B?dUo3bDcrVFZuRml3WmZHVGJPM290Nmk5V2dHeEt6cWhYMDVMbUZWQVBhZHpI?=
 =?utf-8?B?a2QrYmhCajJ2dlRGVmM3aHNYOVF3RjllcVRhcXAyd1ZkZmpuR1YzaG9qVHJv?=
 =?utf-8?B?RC9CTkUwVmdtbGl4YjhDS3hZOVJwYXFOMTEwOXlHdy9RWVNDNGFBRXZXbXY0?=
 =?utf-8?B?OEdBN1dRTHFyNVFyZVRvZHlHRnlHem0vL0QyVGxsbmx0QTU3SXJJdmZFd1dJ?=
 =?utf-8?B?aVNCT0ZZK25tc21oZFdvTzZtZjIvd2oxNWpocEM2am1OU3lBVmNDdU1qeEJZ?=
 =?utf-8?B?UUl0SjM2MzhRZ3VNdm40YzlibVV2blhNcGNoVXBtWHRTK3drU081ZE9YdHEz?=
 =?utf-8?B?N1puUTVodWFMSE9SNXFQTTRocUUwbGhaTzJUbHNORFlEMG16bFdXK3ExSW9N?=
 =?utf-8?B?Ui9FU005Y0lQZklJUkJQTC90dFNzajZvVlFEQTRSZVU5T2Q5YmRiUC9uSlpr?=
 =?utf-8?B?ZVFBYVVaRFNnUHdoMGcwejBYbVoxQlFpLzFWc0dvVDdUb2NtZzRaZGdocDVZ?=
 =?utf-8?Q?oBCg7SgH+7BQw+h+14UyQFNXJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3aca24-6de9-4086-4071-08ddb3e794d6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:55:37.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTFYAkqLEtnFlXFB/OhuItZgBie/hwhNQB2DgT+lkXAHLGpNtU47iXU2DudTv4h/jajSjlhBr2ITFUK2T02YXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
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

On 25/06/2025 13:32, Dafna Hirschfeld wrote:
> On 24.06.2025 18:52, Ilia Levi wrote:
>> Allow the driver to expose hardware register spaces to userspace
>> through GEM objects with fake mmap offsets. This can be useful
>> for userspace-firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>> v3: Enforce MAP_SHARED (Tejas)
>>    Add fault handler with dummy page (Tejas, Matt Auld)
>>    Store physical address instead of xe_mmio in the GEM object (MattB)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>> drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>> 3 files changed, 228 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6aca4b1a2824..22a567c5f0de 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>
>> #include <drm/drm_device.h>
>> #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> #include <drm/drm_pagemap.h>
>> #include <drm/ttm/ttm_device.h>
>>
>> @@ -162,6 +163,19 @@ struct xe_mmio {
>>     u32 adj_offset;
>> };
>>
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +    /** @base: GEM object base */
>> +    struct drm_gem_object base;
>> +
>> +    /** @phys_addr: The physical address of the exposed MMIO region */
>> +    phys_addr_t phys_addr;
>> +};
>> +
>> /**
>>  * struct xe_tile - hardware tile structure
>>  *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..3298ab0f1fb4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -10,6 +10,7 @@
>> #include <linux/minmax.h>
>> #include <linux/pci.h>
>>
>> +#include <drm/drm_drv.h>
>> #include <drm/drm_managed.h>
>> #include <drm/drm_print.h>
>>
>> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>> {
>>     return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>> }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>> + * Make sure not to expose any sensitive registers.
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +    .open = drm_gem_vm_open,
>> +    .close = drm_gem_vm_close,
>> +    .fault = xe_mmio_gem_vm_fault,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +    .free = xe_mmio_gem_free,
>> +    .mmap = xe_mmio_gem_mmap,
>> +    .vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>> +{
>> +    return container_of(obj, struct xe_mmio_gem, base);
>> +}
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>> +{
>> +    struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +    /*
>> +     * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>> +     * In the future we may want to store the physical address in struct xe_mmio.
>> +     */
>> +    return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>> +        (uintptr_t)(mmio->regs - xe->mmio.regs);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>> +{
>> +    struct xe_device *xe = tile_to_xe(mmio->tile);
>> +    size_t size = mmio->regs_size;
>> +    struct xe_mmio_gem *obj;
>> +    struct drm_gem_object *base;
>> +    phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
>> +    int err;
>
> hi, maybe rename 'err'->'ret' to follow that standard naming for return val. 


Note that the function returns obj, not err. And throughout Xe code there seem to be
plenty of examples that use err, e.g. xe_device_create, xe_bo_pin, xe_exec_queue_create_ioctl etc.
- Ilia


>
>> +
>> +    if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>> +        return ERR_PTR(-EINVAL);
>
> I guess that here when this will really be used, it should check that
> the mmio region is allowed to be exposed to userspace. 


Hmm, what do you mean? I don't think we need any additional security here - xe_mmio_gem_create is an internal API in the driver.
So it is expected that the driver developer will call xe_mmio_gem_create only for allowed regions. The framework does not know
which regions are allowed and which are not.
- Ilia


>
> Thanks,
> Dafna
>
>> +
>> +    obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +    if (!obj)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    base = &obj->base;
>> +    base->funcs = &xe_mmio_gem_funcs;
>> +    obj->phys_addr = phys_addr;
>> +
>> +    drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +    err = drm_gem_create_mmap_offset(base);
>> +    if (err)
>> +        goto free_gem;
>> +
>> +    err = drm_vma_node_allow(&base->vma_node, file);
>> +    if (err)
>> +        goto free_gem;
>> +
>> +    return obj;
>> +
>> +free_gem:
>> +    xe_mmio_gem_free(base);
>> +    return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>> +{
>> +    struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
>> +    drm_gem_object_release(base);
>> +    kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>> +{
>> +    xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>> +{
>> +    if (vma->vm_end - vma->vm_start != base->size)
>> +        return -EINVAL;
>> +
>> +    if ((vma->vm_flags & VM_SHARED) == 0)
>> +        return -EINVAL;
>> +
>> +    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>> +    vma->vm_pgoff = 0;
>> +    vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>> +    vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>> +             VM_DONTCOPY | VM_NORESERVE);
>> +
>> +    /* Defer actual mapping to the fault handler. */
>> +    return 0;
>> +}
>> +
>> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>> +{
>> +    __free_page((struct page *)res);
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>> +{
>> +    struct drm_gem_object *base = vma->vm_private_data;
>> +    struct drm_device *dev = base->dev;
>> +    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    struct page *page;
>> +    unsigned long pfn;
>> +    unsigned long i;
>> +
>> +    page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +    if (!page)
>> +        return VM_FAULT_OOM;
>> +
>> +    if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
>> +        return VM_FAULT_OOM;
>> +
>> +    pfn = page_to_pfn(page);
>> +
>> +    /* Map the entire VMA to the same dummy page */
>> +    for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +        unsigned long addr = vma->vm_start + i;
>> +
>> +        ret = vmf_insert_pfn(vma, addr, pfn);
>> +        if (ret & VM_FAULT_ERROR)
>> +            break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    struct drm_gem_object *base = vma->vm_private_data;
>> +    struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +    struct drm_device *dev = base->dev;
>> +    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    unsigned long i;
>> +    int idx;
>> +
>> +    if (!drm_dev_enter(dev, &idx)) {
>> +        /*
>> +         * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>> +         * This gives the userspace the option to recover instead of crashing.
>> +         * It is assumed the userspace will receive the notification via some
>> +         * other channel (e.g. drm uevent).
>> +         */
>> +        return xe_mmio_gem_vm_fault_dummy_page(vma);
>> +    }
>> +
>> +    for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +        unsigned long addr = vma->vm_start + i;
>> +        unsigned long phys_addr = obj->phys_addr + i;
>> +
>> +        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>> +        if (ret & VM_FAULT_ERROR)
>> +            break;
>> +    }
>> +
>> +    drm_dev_exit(idx);
>> +    return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>
>> #include "xe_gt_types.h"
>>
>> +struct drm_file;
>> struct xe_device;
>> struct xe_reg;
>>
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>     return &xe->tiles[0].mmio;
>> }
>>
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>> #endif
>> -- 
>> 2.43.0
>>

