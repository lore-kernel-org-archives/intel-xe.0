Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C1CCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F40A10E302;
	Thu, 16 Oct 2025 14:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1FtNfPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F8F10E302
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625043; x=1792161043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cMONxX8tTMNi1zmd3g0JPmM16Zd6KzTvaPorg1HlKMA=;
 b=J1FtNfPB4bD7ysQPj71IsDd5hJUerf/StQx+mLOyCqI5woweTnJqrPT4
 CCHnaSM5LNueIow9T5R0XDqaUN9ncj4Opz+cm1eZ2bX5KYZKe8NkmijxZ
 HTPPEuB6mAOY2qJ1u1/IxIvVtZ0wRFpxMUQurz2+Ho/m2UmTNC5FcJfCP
 +lZXZ1avHCY9cY84tJUXW6mJXOBs9Bzcr4KcKLP5TqtDt9kg4EkU8ZBJR
 GfKgaRj7vv5MzHQtPP0o3Xw/s5Ilm/pGFPrxKJ3UqdnblUc9TP+92EOIS
 6Dot4F6y31CF5rXBQBqM92NyxxEhRWAdCyJyTQ8SSmL6cTz22xBB7/04O w==;
X-CSE-ConnectionGUID: VIEB2T2qTZysZ3MZs1fFIw==
X-CSE-MsgGUID: ax7s9D20SbCFG1fpi//tLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62719122"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62719122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:30:42 -0700
X-CSE-ConnectionGUID: RP2YmzlBR4KWe7/W5a9cuA==
X-CSE-MsgGUID: f2wyoPX1TOSIEbRAZXbrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186869253"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:30:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:30:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:30:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:30:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpgThWT+QA9lI7RXwl0nT6ucd5ejfUhZFR3iMdiS5jf6Jr+CT3+J1zU7TvgVz/vgu3T+eEOzrVQFdJ4QEE6dEF7r4lF3apmqrBVrnbZqAtlVRFrl9GeeNAQbEf79NFsCW85b6W9O+tHa5CdJF0Ni2WY3E3qnOVU0pq5ZBo6bcdVt7CsYcHGRQY2J+1SzEQSyXuypQ2ZAV1YlNPR/mfvtxLjoO+FnMOXYxgu7NNOgr+BQ0nkldgmkg2Pg+v8vz0fIXKOuudF+/yvekLle+lCwmdGhfGoSiEuUBPVDD2nQYbmvqQ6koyppaeZucw5KXDJ8DG2VWdWySoCa045WvyiqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G+8WkROI4yHsD5iUvrfxgji0IAos9GhIqJNOkHZLiU=;
 b=Lo/zlKL+Ik23x7Sf7P1PloI+bKHe/scGczyW00M2vANudFp8iyBz6Eu5gQaBLXv1h1T1/GwCmTG8FjmsX3RZEj/+80O7f06oNMT7NLo8pkFt+71gsSGpTi3vz5Ehls69q8V3B2gJA118sOdKkQdUu278hBls9cgvU5FjOeprgNsP+l41P/3dFz98rxrKQc7ZymxDQ/HxEMrIFuZI4seyK/k4gh6HUjU9KpqaNpGt66muFb+EUOCfM7IfCHuXsKR5ZckwK/+TtNPswJrRyorso2YUJ1GFc5QI3tqYVmPber/uBcG2OUM8K2UflHnFwEiQTunjIr5CDE83w9pVBCFwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS4PPF4B1ECA5EA.namprd11.prod.outlook.com (2603:10b6:f:fc02::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 14:30:39 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 14:30:39 +0000
Date: Thu, 16 Oct 2025 20:00:32 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 21/22] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <aPEBiG3TlCvqDi2Y@bvivekan-mobl1>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-21-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-21-b9189b3056a2@intel.com>
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS4PPF4B1ECA5EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c4e596-26f1-4173-9180-08de0cc09438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXZjL3FLQ09MRENBbWVQMDNqa0hxSWZNM1NDY2YvU3ZwTDZRWXRwMm5ENFJU?=
 =?utf-8?B?NU5NcndGYnZZYWZSVFBzSFBtZDY5Y3lVanJvRUVRUXNMK3E4VHk4U054aWtM?=
 =?utf-8?B?cDg1Sm1IdDFKWVdENzJLa2EzaVpxYkZwMndaYSt5dU9ZanU1RGxzUlRwVWZB?=
 =?utf-8?B?ZS9FVitJVjBJV3dNTVZpZktjWldGbmg4TlVpeGt4QlNQcWZGVnNqRWtHbVFL?=
 =?utf-8?B?eDcyZFlXT0oybFpwOEloTlc5NTNlek1KNFJPY0tjMC9oc0VId3doSTFuUUEv?=
 =?utf-8?B?RFBnUGRNcmFFTnNJUXdIWHhvem9yelVyQlJyeDJtWUpsT0lCZlJta3gyUWJj?=
 =?utf-8?B?QnJ4RmdBNmJqZWJKZlZIaWJlbitidGJDOE9Gc1pISmZ4akFUTHZ3cWhzdVhB?=
 =?utf-8?B?YndjN0tGa3F2K0Vkc29zTnQ1cGtZOWFOWmxHdzFweXpGRk5uN3ZGeGJZcElQ?=
 =?utf-8?B?dWtVZHZjWVBpOW0zd2lRS2JsR09ZNENZbC9ITVlzUE5tajJGUk5WMWJwQ3dw?=
 =?utf-8?B?NUlOT2krSUVqZ3kyVXV5cXRON01LRlp0ZmNWdW9TcWloY2lNNGtLekJtSXNz?=
 =?utf-8?B?cDVJZG5hcEJiYlBBZ2prWS9JTWFpQVFUWVlTeFY4ZE1PMW54TW1reUFaRUlJ?=
 =?utf-8?B?a1loODB6L3VwMGpkaVNBUjE5LzFOSzlib0pVSDV2VnJvWi9tTVlRN1o5akFE?=
 =?utf-8?B?dzVTSUsxc0t6ODZvNVRWc05aak1kV3NESlZiT2JzWTc3SzA3Z2h6eDlCdzVv?=
 =?utf-8?B?NDFGQjVMeTZGZ3pubzRoUmxqcmZrc2ZKTFAxdUtPT1l6dzVDWDFmVzhIbGp4?=
 =?utf-8?B?eDRONXBZWXArYmRNbzZITTlHanI0L2Z0TFQ5bGxyakJ3YVhMRkJ2ZW9QdmR1?=
 =?utf-8?B?MGJ2MWlVNFRyVENPM20rdVVvOUo4QnEyYnUvaUVTb2N0dkJHUk9EbGxtZkNp?=
 =?utf-8?B?Rm84L3dmZ0dOd2RaeDVCN0RsR2hMU01XSHNnNS9ma3preEZtSEM4M25JckFH?=
 =?utf-8?B?MkQwNWNFWGV6VGRDK0V3SVJSYUZlUmV3STJEUVcwQ3ZSUkJmakUremZLaUpa?=
 =?utf-8?B?UUFTVU9nSitwM0cveHd3N05QWHRBendsQkpZZWpxRGpDREpVUnVEczZoZ3Y3?=
 =?utf-8?B?NWVHWWVYc3JRQ1Izd1B1b2czN0NKU1RoSkVSZVJMVXpsOVcvQThwL2ZJRStO?=
 =?utf-8?B?ZUxMbnlmY0FWdEFvdlVISFZEcXNzNTZVRWtkeStkSGNRb0p3RnZzV1ZRZ0pr?=
 =?utf-8?B?SmU4QmVMR2JESUtlZlBJcm9BTG0yVHdQTzUweGc2bzJtMWZOTnVyb1JVQVh6?=
 =?utf-8?B?OStJVzBhUGMvOU9aVWM4Rk5YWmJXaitwakFJNlJFZGN3TzlpOEVYVGh1TndG?=
 =?utf-8?B?UFUrZnNrMm9VclVGNEFKWENSRGRyQ29NVFljMXgweVU3TGtUTUx2TnhFL29F?=
 =?utf-8?B?SjFhSHppS3UwZkZZWTJyN3JYbDJoMldvL3hTVk4zd0xFQStpa3Q0cmRGUXg5?=
 =?utf-8?B?aXNjOFJ5dW1hb29CZXpOT2h2aEtaMFB5QnYyditONE5Vbks1UmpvVit0dXZL?=
 =?utf-8?B?dnFrWDIyc0NTV0N3M2JvOXJpV1MwUnd3emx4YXluZWpUNjY3eWlQRHJjRVYr?=
 =?utf-8?B?d29ONVVEUWlBaDM4MW12MU1hb2VRd0hQUWNFbDEzNVZMWTRISlc5NkpHdzV4?=
 =?utf-8?B?SmxZdXlpdTJWQTVjZEJxSi9IOTQ5eUU4TmdMdlRKY0JVZnNMMXEyYjJ4MFhx?=
 =?utf-8?B?MmVhcDcya1FiK1NiNTA4N1NIbjRpSms5OCthZk1kclJmOEdIUE1IZW4zaGZX?=
 =?utf-8?B?MnluVkhuZnJ3MUJLQmFEOHpEcDE1aWxPUlVkRERhSllxQ1R5NjlxZ1EyYkF4?=
 =?utf-8?B?dXJVTzlaTUQ1UDJWUHVSdkNUTkFxcC9tRSsxUklvdllSNEZxZUVVSVprUGpR?=
 =?utf-8?Q?RPo5osORS9SQZzFyX3eUvLYk3aTy59ii?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BxZ2tBdSszVGFlOXdrRjREcUg1SVExcUdOYXg5cUVXVE5YSzVGTGViSXpG?=
 =?utf-8?B?dUZVZ0lQS1FDR09ObWhlbER2TzVNN1hsR0NmNzl0ekZlZUF6ak5WRTM1T2J2?=
 =?utf-8?B?cjd4Mm8xU1RrRHExdU5iSEdJNncvYzB5M1dVbFZKdmpuY0VMdWs2Vm9kOW8v?=
 =?utf-8?B?L01aKzBveC9YbDRZQUhJdmE1RGtnUG5JNnZkSTR4Y2dGTitpaGF1NWJLeElY?=
 =?utf-8?B?Y3UrR0xxN0Q4YnhURFppaHg0V0dqZjRCV2Q0YStDb0tzVFNKak5XRkE0QzlV?=
 =?utf-8?B?NTZSSlJMSi83TkV4ZW1RRVlYc0N5d1hrSzdoc3cwTjlsL0JZY3MxNzcxWjR1?=
 =?utf-8?B?d3VaMlc0ejNFV01rdG1WeEhmSTJ4WSszR005eVdvSWlYa0ZueHE3aXRveWpT?=
 =?utf-8?B?eTJhMEMvb2lNQmFSZldKMWkrUDRZM01obWpWbXNJcEhaajBTQ3F6MFVzSitt?=
 =?utf-8?B?eVgvQUF0amI3Skw5eFg4SkVsUy9ndFN5WGZkWEszWDFiWUVLK3QwKytEeDNu?=
 =?utf-8?B?M2RxT1RKaVYxL1czWGtUNzZlejVMVGlHQ3ZqWDhyV1pITys3OVdsanVPSVd4?=
 =?utf-8?B?SUVJNGtWYldCeUREK0x2UmFNTGI5QmlSM1haNGtYZlpyRlo2ZG9vNXg2YVBn?=
 =?utf-8?B?UlJ3TysweWZFM3NOdjduM05JYUZLalpjYytzeXFNd1ZZYWl6QWtpUnFrcjZ1?=
 =?utf-8?B?VkhvR1BOcC9xVFdqd2t6SDdBT1VYOE95RU10Q0dwTFFtRyt1cm5aaGhNZ3Jj?=
 =?utf-8?B?b0RPc0pjdFBwVUcwREEzYjBncFgxMnJpWHgydjVYdmt4Tm5DVk9VTSsrZWNY?=
 =?utf-8?B?M3FKNlRrR1RVNHlVcHB0YSt3Z0UvemJxYkFVek5xOXhpWXUrYmJvQVhKOGFV?=
 =?utf-8?B?ODREcGJKYXNaOHZQM3RDUy9ZdWdtbUhLVzF5dWptV1ZNVS9nVnVLNUY0WnFp?=
 =?utf-8?B?MzZ0Y3FMQ0FaT2JEWU9MbXNuN0FTenlMbDIrRnlIOVJhWjNDMDVuYWZ5bDB1?=
 =?utf-8?B?ZXVXQmYxS1RmUW9qMlk4VHp6djY3OG43TW5hU1ppNkVhTmczdjI5V1ZWUThj?=
 =?utf-8?B?WkxnaG1CdGFLRnk3L2FiZUN1UzFVZXl4ZkpiTld6eU1oUTM3TUlScEk2Njh3?=
 =?utf-8?B?VmdiVkRIMkpLWlRqdVp0OFFlNTJBM09aYUFJM1gyWjJNcW9wK24vNGpGV3Jw?=
 =?utf-8?B?VE8yenBPVXFXQmdydDJTS1dZQnlWUWtkaGM2cHhvT1dtUnB0U1d3RzRtTzV4?=
 =?utf-8?B?OVhPbzVNUmtqdUMrc1lHbkd5SmNuTm93amhBbDQvbUdyeFVTUDU1d3JKZEZF?=
 =?utf-8?B?MEQ0NE92MTB5WjFtSjBaN3NNaHQ4am1xUFFPVHcrd2gzVmJsL1lIQ2FGNmFY?=
 =?utf-8?B?VDN1S3ZSWi9GSG1Pa2tpelFTNmtzNTExOGhmbEY2VHc5eGFIYWlxa2tucXFQ?=
 =?utf-8?B?NnhXazhOelZrMXZUcDJ6TWlQMFhSQmNpVHBIZU9MNHBKVStLbkxFNnhMU2p6?=
 =?utf-8?B?cm9MSGtxbDN1QmtQSUNqNHBWdWV4aUxFM0VicXFPcG5UcjVZRll0bjR1RGF3?=
 =?utf-8?B?Y0RGU1dOWk9SajRxd0pqZ3c4VUo5VVBMdithSFhLNlVLRHpnNkNUc0RhNEdR?=
 =?utf-8?B?bXQ1a2tMMmIyRFdaRm0rdjdOa3hkNWd6WEIxMjFTaWtERmhKNklTbFY3MVZx?=
 =?utf-8?B?RjBKckhBU2I3cXQ1aVozcnFDSHZsUXdKYWwvSmhDd2g2eDVURWZyNHFvcm0z?=
 =?utf-8?B?NjZhVHJSV3pXeHExUGU4QjVFVWZLaytkcWF3WjdUNjJLTkZTcFRwdnVZTXhu?=
 =?utf-8?B?UFU2NEExZDFSVDIyY3ROTStCbUJUMVNtTjRlSE5acmhXb2lWQkJlZm1uRXNp?=
 =?utf-8?B?Z0RUK0x1VFJtZ3FZUHNpS1FacGVXTTIvNTRMSDR3eE9CNk5GUERaNkZaVXph?=
 =?utf-8?B?Mng2dyswNjdlRFlIWWdDQk9KK1BnZnAwR2RIVVZab1lvNktTYlFDL3hrdll3?=
 =?utf-8?B?cGZRb1pkWjNLTG5IK2Z3Q2xSYS94NzBuN0N2TEtUVnAxQTVqSXZlcE9jRFIr?=
 =?utf-8?B?bXlNbXIvVTBpMGwwU1B1c05HN1hNZEd4RzV1aXFYTWk3RmlQQlI4S2JmbDZ5?=
 =?utf-8?B?dWk3MzR5RlpUUWRRZ2ZBOGE4S210a3N4MVlNNUVyQUdnL3BSNmVaQ2NtZjVr?=
 =?utf-8?Q?oFFwzzCPmMTQRU5Crl4HAWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c4e596-26f1-4173-9180-08de0cc09438
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:30:39.6817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPaT8qPuXwzLsVA3kaljZf7Xn8W4QiTcvFAGNvQ0FviASLbw7DbeZv2k4V+LMM9eNoygvrmE9IJhenzQv6+yxQsAzwpoSdyD77GCq1YhgZxgOdr8RWOSrz/ws6cq3ZQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4B1ECA5EA
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

On 15.10.2025 15:06, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> column than the Xe2/Xe3 tables since compression is not supported.
> There's also no "WT" entry (which we wouldn't have used on a platform
> without display anyway).
> 
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 6e48ff84ad0a0..7649b554942aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>  
> +/*
> + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> + * option for compression.  Also note that the "L3" and "L4" register fields
> + * actually control L2 and L3 cache respectively on this platform.
> + */
> +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> +	/* 11..22 are reserved; leave set to all 0's */
> +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
> +};
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >= xe->pat.n_entries);
> @@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  	.dump = xe2_dump,
>  };
>  
> +static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
> +	u32 pat;
> +	int i;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	/*
> +	 * Also print PTA_MODE, which describes how the hardware accesses
> +	 * PPGTT entries.
> +	 */
> +	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> +
> +	drm_printf(p, "Page Table Access:\n");
> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat);

< Resending what was already sent to v1 by mistake. >

For completeness, we can print the _PTA_ATS register also.
Outside that, patch LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
> +}
> +
> +static const struct xe_pat_ops xe3p_xpc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +	.program_media = program_pat,
> +	.dump = xe3p_xpc_dump,
> +};
> +
>  void xe_pat_init_early(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		xe->pat.ops = &xe3p_xpc_pat_ops;
> +		xe->pat.table = xe3p_xpc_pat_table;
> +		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
> +		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
> +		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
> +		xe->pat.idx[XE_CACHE_WB] = 2;
> +	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>  		xe->pat.ops = &xe2_pat_ops;
>  		xe->pat.table = xe2_pat_table;
>  		xe->pat.pat_ats = &xe2_pat_ats;
> 
> -- 
> 2.51.0
> 
