Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28714CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA710E979;
	Thu, 28 Aug 2025 10:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvOTJ+wt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A36A10E97E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376693; x=1787912693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9IOMHwmWtOHU+67w4WF3N6hf4rjAwP6ZpNdVvjBtQ+Y=;
 b=hvOTJ+wtD0s4FtdD6pKOHJC3qkURvolK03f3YfhxSqWOxsiZlGoK/RMj
 SWt9Z2RGocRA0cy9ZFp6C8OM5FxhM2UqpLr26UGxXlA45EfUMSKQxQsYV
 S8J+6w45j2dRNSW5+G7zAWtyx3JZ1cwoE92J5TWz6o3NOr4uZUtKiJR8l
 X4VgaVZzYG2uysmkMY66dbPVTNODOIi5yBO4BknByLYqPhkpJbEG/gXMl
 znO6WeQDjRK2v7ciM2uvurN9qeIRDyXLycw1Je86dplHJ4vhqkjpfT8C8
 0clFeN8LqtMLW086m8d/NnqPRLPTPO0LPN3E3ADDGqQ0HLXqHguYeg5o6 Q==;
X-CSE-ConnectionGUID: mTANb8V7SYG/ojJKUssTIA==
X-CSE-MsgGUID: E+GxgDthRIq28yZJ4EVCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58705223"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58705223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:24:53 -0700
X-CSE-ConnectionGUID: K1/LGWC8Sdy8jBD+qRDBnw==
X-CSE-MsgGUID: xiWBW/9+QyKfw7ES+RosCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200990801"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:24:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:24:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 03:24:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc4aXtFzYNIlNtZ8KuFTtSzvar6vE8Kkb8xGnJwXIEJ2h+223bcFlEV/8kEKvSu5bF0V+E1nsB29ep1zsAYu4siwbDrKz5aqP8L2QsQ2RqhN0nH8UnX6BzPaoJEFpxRxSravVqEJe9pTAoKCvzxtNO/3G0phTui7qu1aUIWt29BhXQlvZbQ0jV+AdMyXiHb2NYUtDohQd7czvhw+aJMIAxXrKhcZVkrK5KOm7pp2b5ZJBUgRdmMvSa1oJTzguPzZsP5lBpejPvlr/fgoRNXB7gM9S7DTJnle3SfPmNs8rFv4WlSw60dNP9uKeajd2PIAfF4/9gs081p53RlfY5B+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2zfUKZt169n2GFiCW1XvlIsO2M5CJRJ3rNSDJv/eIU=;
 b=qsYSydFnVacyQs+/yNPWYLV5jwcmw8jYfPaFIWUOouCXbcO4qPgMKtVxwMQKYf1GXus5kwAp7GbnYOH/f70PDvVqjQTZ/ZuR0Hz9rASih2XO2d92C/vDlAxxWywQ/n1+UomqCbo994DH24pC1RyBAWhRpR6/DqV8fIy519qL7SbohTPxOan44i9V3zH2urwgcyJYtDToKiaIE990f2z2RqUhbGkF7NdQBXJ5BpRYIbjB+d329YTeQwhYvzMnY0CXpFUTrSR/nxif1RCfX5/ZSTp/xppNlWaL0se+ma7nlWepfAJmKapcP9nTRbu6SR0aDZ8aoB28KOXhwflWs9xv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA3PR11MB9228.namprd11.prod.outlook.com
 (2603:10b6:208:57a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 10:24:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 10:24:45 +0000
Message-ID: <05c6ab0f-9806-455f-92c0-aa3c1bb1ad98@intel.com>
Date: Thu, 28 Aug 2025 15:54:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
 <aK9SPl80UTjp5Cvt@lstrano-desk.jf.intel.com>
 <c04c5641-f724-4416-bd6a-08d5a0dcd159@intel.com>
 <on7fswevb2jgayd2oeg5v2eie7tbs7bswkswuhbqngwle3d7ix@m3brk2ovi7fe>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <on7fswevb2jgayd2oeg5v2eie7tbs7bswkswuhbqngwle3d7ix@m3brk2ovi7fe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA3PR11MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7361e0-e90b-4cd6-8064-08dde61d1bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHduSFNaTnVIL0JramZYMmUvRlgwd0xyRVFHaG9yZ3JncmJqQVZPZ0pFVzVS?=
 =?utf-8?B?bE5iaFQzOHhJZTEzSU81TE9xenZLZnZPbWZvVHVva0UxT2xzYnVvSXhSK3dz?=
 =?utf-8?B?VXpGZkJ3NHB6ai9NT3JqUkNvQ1FxSGRyVno2RXlUQUNOem5KdmlBdjR2T3A4?=
 =?utf-8?B?MTJiRjRSMzUyZGp4cTJDVW9SeU1PUmhNOExPZldsdVZxS1JreTJhbkNLUmRk?=
 =?utf-8?B?VUlCS3NPYVBRcFQyRDRUTDNuUER6dDRCdW9FRjBUdW5mMk85dis1VTk0RFVG?=
 =?utf-8?B?VkNFQm82eXVVNVdjSjBVWUNFeS8xUGpGU3lBNFFLa3BVY3dGTFFoK2p5aUdP?=
 =?utf-8?B?NFdnNFFyN2MwMWpHQnhUVDZCRGZwdlZnMXcraGhCZmZHT1lZV1RPc21Yb3JE?=
 =?utf-8?B?eGRIcVVKMDNUZmtGWWJQRHhPdnJUQWVKcDhRVmhWQStvdnFyYzBvVWx0ZnhZ?=
 =?utf-8?B?cjIvek5peXFtUGI5OE9lTUtUSGxpMFkrZTg2V3phcHRPdEVvckFhQVhZSmd4?=
 =?utf-8?B?cTlRQVlBR2NjYnlNd09JcSsvbzhpSFByV3ZxQUg4VHlzaXhWdlFzUEk5Q054?=
 =?utf-8?B?RFF5N2p1cnUrVmtObGRYQTlFaVNhR1ZPdUVMY1hGb2xlTFJ6a3gzTWY4ZXlS?=
 =?utf-8?B?Sy9qYXQyYTR6OU1yb3Vqbk11ZWdYUWhzYW9maUo1akZ5bGllZ2d1ZGljUDBn?=
 =?utf-8?B?dmc4U3VScHQ2ZjJQSWhEV0lMTkxSOFBsQ2dDekZHTGdUU2I1eXpxZHlWcGVj?=
 =?utf-8?B?YzR3RElLcjduWXhiYkNrUWcvTWpHL2N1NTJvQW1RL3NWUkNKazU4UnRoci93?=
 =?utf-8?B?d2h3eUVIYXQ2K2FWbm1RUFp3UnQ1SndPdTk3Q0hpaUIyeTJ5MndQeGpleEpt?=
 =?utf-8?B?SXllRzQ0aFcwWjhqWENrMmhLUTNsQ1JHRDZvV0k3ckdJYWczNnFjV3l5R2JH?=
 =?utf-8?B?NGZjbTZ6SEErZkx5UG5welZTYWd5SlNIZGxZcWp6c0JSNzY5YWxrQzVlLys3?=
 =?utf-8?B?VGFDVDliOWpkckJjZVhISVZ0cE04NU1uS3c4TldGckN6eGZaTHJSdTY0akVE?=
 =?utf-8?B?b3lpVHJVcHBYREphRkxlRWZFOUZEdDhqa3llMXFQckFHYnZFVVk1NDUyWGts?=
 =?utf-8?B?bWY4R1VidGNjakYvNTE2Ti8zVWFOVDFPZE9YQzVvZkJOTzYzV2Ivc0tzQzBn?=
 =?utf-8?B?OWxCVU1EVnB3ZUl2Z3lzYzRmRjJtT2tQVS8rd1Vmb0VUcE1JR0JpZFVDSUth?=
 =?utf-8?B?RUtQS1psdTM5Vi9GSWYvUlBWL2J6NGJ3cFZmVm1tNmM4dFBwVjBPREEyVGpm?=
 =?utf-8?B?ZW5yTlVKOHJYUzloV2l6MkdQRDJsc2pqc0czVlRyaE5YQkgzeG14SUMySVRX?=
 =?utf-8?B?QStGa0IwbUFJTzErUm9CMkYvalpEaFU1SlNnT251eXBOa1krWVNtUFdUdE5K?=
 =?utf-8?B?eURyOU1UK3BTUmdqK1FKNDZReXNSbi9aaXFsSmVNOUJxZlE4WWlXRFR3UkhY?=
 =?utf-8?B?RWMxbG9TbFZBdkN2Rzh3M3h6bktIaCt3WHVoVXJpWmprQ2FoRXg1TG1mSzlx?=
 =?utf-8?B?QjhJUk9YWm9XSDQzY09pTmx2d1dWdkVOYlRGRjJGRElENi9DYXRCYk15TDky?=
 =?utf-8?B?SXVhUFM3MThtc29hblYyZDFCRnlIMm0vQ1RodXlLQzBIbWdUdUl3Y1NWRHBC?=
 =?utf-8?B?MDdpRUx3WXd5ZktaeldNdE9rWEt5VmlWZC9FTnpKSW9TcWhXZlFiVDNpcW9l?=
 =?utf-8?B?eDFoajA3ckRoaUpES2pzWE5jcTcrWGpmQkxPT0Qwc0QvNll2RTJjWCt0NGU4?=
 =?utf-8?B?RERtRWx3K3dYK1VMWWNBWmRSZ3YzdDFHNmtFa2t6RThzVFczK2VvMkgvNUhY?=
 =?utf-8?B?L3p2U3ZwbmNzaDNDZ1k0VUdINTk0MGdEcGJJc3lqN2tsNlJZUXBLSWdMQU5k?=
 =?utf-8?Q?0DIz61eVtUY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtuVTRuWXBXd2VCRzE0OCtTMW5iMHA5bXhTTlFFU2E5cjJQRGJsTkUrRjZG?=
 =?utf-8?B?c0FrQTFkS29pVklqaC96Yk9pSWM0ZVM5amhMYkFtZnhrVStFdVJLcmFjbFVk?=
 =?utf-8?B?TVVQMWphU0FoV1R0OFRoNTIxVXpIVytGMDJUYmttTW5uMFhuODN4TFU1Rlo5?=
 =?utf-8?B?VVNsVzRqSFdCYThQMHVjK1BCZDFPMFdmUE1JaktvdGFaYjNBdlJkWEp1V25K?=
 =?utf-8?B?dFFmb0xCYXpBdWh3N1lHSzJ1cDdGT1pIRGxQLzgxeXJJRFp0eTk0VXFtNnBB?=
 =?utf-8?B?MWozVkx1T1JNeEJKSkZoTUVXaUJkTlRmeGVvUGZXS0l0MlczTTRGSUFpL25z?=
 =?utf-8?B?cGtlUmtVNm5vSUhITXI1WTBtays4U3J6eVRqYjNOWGJOd0FPUUQvNmNSRlZp?=
 =?utf-8?B?d3ZIOVl3aC9Sdk5vMG5Hai90NmFzV1cvdUN4U1IvVy9jaThKSzlqcjBpSVgy?=
 =?utf-8?B?c2lTcHcwMEJwenNUN2l1eGJ4RFVuU09qODU5QmllUm1KQWxMTGtkNElxaHhO?=
 =?utf-8?B?VFNZTUVKWlRxOXVJQ09xQXBRME9WaWpwdU03Z1RVOWh3a01FRUVDSWplOGRM?=
 =?utf-8?B?SUZ2SXZCdExTa1dGMHV3QkxXWkxjNzgwSkYxQUlucVN3em5IMHl0TW13c3d6?=
 =?utf-8?B?ZHl1VkpnM09ITkNsU29ndDlwSzVOdUdvSDJxWW9kUVdwRjZ1enJ6anhqc2Nv?=
 =?utf-8?B?TjA3U0VxRFNaMTdEYkRFOUJldHk3N3B5N2twN3Y5MUhYZktuVXZmWkQxZkpi?=
 =?utf-8?B?TEsxUm81am9MUW9nTFg5YVkzS0JGMjdPa2ZSdytsN1RyYUlWWGdNU2F2SURo?=
 =?utf-8?B?ZEtJZUJLcVNMRUg4Tlg2allhN3luNWdIY041ZnpyQnBZbUdSM1dyMnFrM3M5?=
 =?utf-8?B?a2NvN21ncEozOXZKNW1xK3M4aGJuWGdtRFJ3clg3NDFRY1lkeTdUNXpmeS95?=
 =?utf-8?B?US9SRGk2bEJ4U2t2cUdnd1JvRjZPVnRwTUFhekR2WDBLc29qQlNLclBSK01v?=
 =?utf-8?B?Njg2Sm5EaXZnMkltOWxxSFBkNHlYWXQyKzQvVkRYcjh2NXNKck1HeFR2MWl1?=
 =?utf-8?B?MHRwYVJ6UDRsK0NFTnJsanhYdUdOaE84M0RlYWk0bExlL0FSYjNlOVNpQndl?=
 =?utf-8?B?SUhaVzJqSk54KzAycncyZ05DK2hobjZidW4xV0RFeVlrYUQvbWlYYmdyaUJG?=
 =?utf-8?B?U3hNVzBEUUZWRVV4QmI5eUp3cVloeDI2YUVreDlJYkZkQlIzdktuN1RtS0Zl?=
 =?utf-8?B?QSt4em42REoxdFdlb0FnQkNyL2FnRWFTdW1ZZGdrZ3NnYmJMWGNZTXE4VEk5?=
 =?utf-8?B?TzZQTGIvVmROYjZRajB5TmFSOHJ0OU1pOGFidWwrOHFKWTlIQkxiT1BJWjdO?=
 =?utf-8?B?azdyQS9BQXBPRUEwMTRQR3NNNWk3U0NxUTFFeXhGWDRxSDByVldxT3pBUmV1?=
 =?utf-8?B?TS9UbGNaeFZYYllJV0l5VFpZK200MWU1Z2d3NERoWUZjZ1lXYWh6eEtYdWVM?=
 =?utf-8?B?UTl3a09lbmlDRzVXSVliVjhvS0VjR0JvNkpRdzVCekNZMmZMNzMyRTJJLzJs?=
 =?utf-8?B?a0FvQk91Vkc4ZWViVUZPNHdhNThqQlpZMHQwUEJMQVRCSXFiT0dsdzR0Lytv?=
 =?utf-8?B?TUV2bXNEUGxNbklKb280dkFJYTBCRHgwN21iU0FNMGpZdmhSNXBsTisvcy9R?=
 =?utf-8?B?NzFzWWJqaEJZOUxYOHZwUmI2eHJyNFpQWVJRTFc4U0FiRm5xL1dJZVErTDdL?=
 =?utf-8?B?d0lQTTQzdHRqZTdPeVBadkh1OG5NNzQxL2ZkTFB0ZDV3Tk9zQzY4UDB4QStl?=
 =?utf-8?B?NFlIRzFhblJ2V1FVN2MxZmJxWUlsV2RwaGpEZllyZ3VqenJMNXFBYVI2L3NU?=
 =?utf-8?B?OW50Sk5NdnAvSWlMSjFEQlRDWDJtT0hLQlJsbDJydE42VEhtVXM0UnhUMWF0?=
 =?utf-8?B?N3ByRU1YUDJvVEh2YU83bW53Nk1YMVdHVzBJejJPUXlvck5YaS91dWR5MURS?=
 =?utf-8?B?U05sRDhWcWZCOHVHbTQ3UEp3MEYrdWROdkNlUmExL25hakNvSnhBMElxZldZ?=
 =?utf-8?B?YTFWV3d1VldSQkRZWElkTjhKcjJXTlVhMm81YnNCbjF3a3k4S3crQmNSVjFS?=
 =?utf-8?B?c0RuRy9oR3JKZFNvS3VSemVQTzI0aHhnVmZENjFrZFFrRmZ6bG94Z1BCbjFV?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7361e0-e90b-4cd6-8064-08dde61d1bb4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:24:45.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7DmahHd5LefBFiiGh6DHsn1Mj0RDASucMJMSlhky4Ot5XesiEoGQ2pPh7XTqaMwAEUNgB6CKa4HiGCQDs3jME5CddWJPda3wd+4wJt469E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9228
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



On 28-08-2025 03:14, Lucas De Marchi wrote:
> On Thu, Aug 28, 2025 at 02:12:28AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 28-08-2025 00:15, Matthew Brost wrote:
>>> On Thu, Aug 28, 2025 at 12:31:35AM +0530, Himal Prasad Ghimiray wrote:
>>>> Correct kernel-doc formatting issues in the UAPI definitions for
>>>> madvise and VMA query interfaces to resolve docutils warnings during
>>>> documentation build.
>>>>
>>>> Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count 
>>>> and memory attributes")
>>>> Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>  include/uapi/drm/xe_drm.h | 29 +++++++++++++++++------------
>>>>  1 file changed, 17 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 7dedd45ab995..a164deedae33 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -2006,12 +2006,12 @@ struct drm_xe_query_eu_stall {
>>>>   * .. code-block:: C
>>>>   *
>>>>   * struct drm_xe_madvise madvise = {
>>>> - *          .vm_id = vm_id,
>>>> - *          .start = 0x100000,
>>>> - *          .range = 0x2000,
>>>> - *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>>>> - *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
>>>> - *         };
>>>> + *     .vm_id = vm_id,
>>>> + *     .start = 0x100000,
>>>> + *     .range = 0x2000,
>>>> + *     .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>>>> + *     .atomic_val = DRM_XE_ATOMIC_DEVICE,
>>>> + *     };
>>>>   *
>>>>   * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>>>>   *
>>>> @@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
>>>>           * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>>>>           *
>>>>           * Supported values for @atomic.val:
>>>> -         * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
>>>> -         *   Support both GPU and CPU atomic operations for system 
>>>> allocator
>>>> -         *   Support GPU atomic operations for normal(bo) allocator
>>>> -         * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
>>>> -         * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
>>>> operations
>>>> -         * - DRM_XE_ATOMIC_CPU: Support CPU atomic
>>>> +         * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>>>> +             Support both GPU and CPU atomic operations for system 
>>>> allocator.
>>>> +             Support GPU atomic operations for normal(bo) allocator.
>>>
>>> Missing a couple of * here?
>>
>> sphinx was throwing "WARNING: Unexpected indentation" for multiline 
>> bullet for * usage in other lines apart from first.
>>
>> Removing these * docutil doesn't throw any such warning.
> 
> but it doesn't format it correctly in the output. Trying it locally it
> seems more like this:

Thanks for pointing the formatting issue. I posted new version with 
fixing formatting.

> 
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 7dedd45ab9957..96620916b33ec 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2005,15 +2005,15 @@ struct drm_xe_query_eu_stall {
>    *
>    * .. code-block:: C
>    *
> - * struct drm_xe_madvise madvise = {
> - *          .vm_id = vm_id,
> - *          .start = 0x100000,
> - *          .range = 0x2000,
> - *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> - *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
> - *         };
> + *   struct drm_xe_madvise madvise = {
> + *       .vm_id = vm_id,
> + *       .start = 0x100000,
> + *       .range = 0x2000,
> + *       .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> + *       .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *   };
>    *
> - * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> + *   ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>    *
>    */
>   struct drm_xe_madvise {
> @@ -2073,12 +2073,12 @@ struct drm_xe_madvise {
>            * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>            *
>            * Supported values for @atomic.val:
> -         * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
> -         *   Support both GPU and CPU atomic operations for system 
> allocator
> -         *   Support GPU atomic operations for normal(bo) allocator
> -         * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
> -         * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
> operations
> -         * - DRM_XE_ATOMIC_CPU: Support CPU atomic
> +         *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
> +         *    Support both GPU and CPU atomic operations for system 
> allocator.
> +         *    Support GPU atomic operations for normal(bo) allocator.
> +         *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
> +         *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
> operations.
> +         *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU 
> atomics supported.
>            */
>           struct {
>   #define DRM_XE_ATOMIC_UNDEFINED    0
> @@ -2196,6 +2196,7 @@ struct drm_xe_mem_range_attr {
>    * Example:
>    *
>    * .. code-block:: C
> + *
>    *    struct drm_xe_vm_query_mem_range_attr query = {
>    *         .vm_id = vm_id,
>    *         .start = 0x100000,

