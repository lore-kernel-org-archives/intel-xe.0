Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9EDCCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 18:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA9E10E2F3;
	Wed, 25 Sep 2024 18:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMI4rcmk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A1410E2F3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288075; x=1758824075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3mUePVe80lzXhcs9RKehZ0DJk5Adoeubic8+4RjKSf0=;
 b=XMI4rcmkJXsfhfDbZVTG16J5TPKfnrIPNXTg6/7ONXNfY1Efsf57f5jL
 +Zo0b6kGFIA762CEB+qj9CaLRonuf/y8N1z5a9aOdFewM+bnhvps4t6pe
 tDuxSa702EX/CNmefpnb1YBDexX3aNrYuJCI6DHhKfDsqFTR1Q3v65U9a
 7095Gfh2kIXdTvD2t0UM9JQdsEKcc/9PQyIftDqBJjfKPFXN4bHeCjiQO
 HaeCAhiGVmEEwN1mHX+VWVB0aJh1arEYSd5TOxEuQEHijW6WvV1OiuBN3
 vinNbI+YmluUIO5ngXBi5Nde4B78zFd+8wsgkx389DSHZ06TMWdBACgzK A==;
X-CSE-ConnectionGUID: yK9V/pGZSQSeOzt/nwshzQ==
X-CSE-MsgGUID: 4Ckqlz2zSk6U6ocB4TeCWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482258"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="26482258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:14:33 -0700
X-CSE-ConnectionGUID: HTPiKqFNS3eR80H6JnzKgw==
X-CSE-MsgGUID: wzZAXDL8RFSqzaraU6Ma5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="71947276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 11:14:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 11:14:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 11:14:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 11:14:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 11:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awl5Z+fH82OdzUE7HmBWE5LEkuZ73SzhmI3K7N5JokWu434zt8n0/FG8s4fHY3wQ62NGP48ULah8IkjzDUwkVIwL4tQC5VltUcjDazn/76nf5H/uySjpvRV2NhAb9k6YhjfutIpcC7uOlQ3jOC10COr+QCcY8jXG1KOHyNZiKfw8ob19Wxb0oI7mF97SqTxus0b3XuRAlBd7ovbqGTsuDDbIFVx6VC7TdO2sU83FFF7m6IZjKfiNgwVslfo4lqBm/NPtFYSh4dt+kBraBG8OReCdSohKOj1g5x0IbKEF94JsZGgno58fBflxyZx2r1KxHKNRrS/EbLZjkjWUo8jvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mATPI4/VcmkveFCVDHURwXr0ZVed/Uhzzr3EKAlgugQ=;
 b=qvgwpWcWbnNPV0Fyqd2CX21ri/+9IG9fjQazFmtbAa/65irXUqgm/lJkkZykpLLmHLu3pKpH6X1Ah/wB+GL36xWYD7WdnHPuCzuzvkZzWbF5wxzGcMsDBOUHLNr/4Wb1DmoKxjjqvMj3J8hghQJ05/AKkALZiBj6YRTt0+rfhVfNr+mdzPC7/ZmWPOlPCf6isqkfaIx0y7MVx/Ed/Ne2esxplAHlARsR+xdjK3vNzc3o0vGJI2Zcl/rsikCiqDo0G5jZXyH7ZyY9lZPnhF09LviIEqX6YPQUuQSaGK0+tduNQboMrTtHREtHisUHsb2XKAZ1UKdSCgE8ZsdxFs0UFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 18:14:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 18:14:08 +0000
Message-ID: <b7102aa2-4a5a-4928-acf9-0384ad983fb4@intel.com>
Date: Wed, 25 Sep 2024 23:44:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
 <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
 <337515e5-83f8-4969-bc79-f1d380a31330@intel.com>
 <8b045c35-95bc-4977-840e-067c2abbcd10@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <8b045c35-95bc-4977-840e-067c2abbcd10@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: fda462a4-168d-4778-c845-08dcdd8dd915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGJ5T1F0OWFPVGVyOW5QTDJHZXhFZjJHWDA2aGMwc0pjNkxJWVhYN1JEUlhX?=
 =?utf-8?B?RTJZSHBUN0VwcjZLeW9NNEUveFhoVWFrMkdFZ2xFRE1SWTYvSjBoZk5rNURG?=
 =?utf-8?B?OU1wTUxqR1ZFeUN3bldFVFFzcUVyb1E5aDlnMW5CU24xRllsRTlmdTZHSVJz?=
 =?utf-8?B?T0wxT1R1bEJvN1NRYStpOFdKTlFyQnlaZUZxM0hWbm9nTDJVWjVNcC9DOHNq?=
 =?utf-8?B?N1drYjgxenR2c2lvQUkvUGFMcjAzdWJIQVpUTWJDY3hmODZmRUdKd2VpQ2ZX?=
 =?utf-8?B?S1BVT2NQT3hrMFBKeUhYeEx3bUprWXJTTnU2UUdpalRFSUFtTzNQa2oxZDR2?=
 =?utf-8?B?S0V0UmxGRm9ad1lpNXBWUGlDS0JrWEpxaUt5dXpVTVR1V3ptcy94WjZ5SDhw?=
 =?utf-8?B?K0pwdzl3cUF6bWxhNjhFcnBqOVBvOU9UUmc2SXFqRUpjbjhvQ0UrU29qb0pX?=
 =?utf-8?B?SkVzaEJmWERwc0ZybkhxamsvSmw3cm1wM3hNcU1UWDR0ZGFRcEVMSEp4SDY5?=
 =?utf-8?B?aHFNaGZIMDh3OFdUMmxDbHNydjh5ZnhqNEpscTIza3IrQkN5aWgyRzNScGEv?=
 =?utf-8?B?YUhjSWcxZit1eEpKdDBTS3UvQ2tKSDU0OWExeGhZMXJEdUZicHozTlhZOUNK?=
 =?utf-8?B?QVJWYUpONXIxWXdMMWlQS1crbWQxVUduOGhLRElXN3hqUzZWM0JSQzlYRFBR?=
 =?utf-8?B?ckdpL3VJRGdJaVZCSVh2SFZxUVltVlFlbnVFM3RZOVljQk1JNlpqdlVhZnMy?=
 =?utf-8?B?MjdHQ0M5bHVnbkE3YmIzMldiRFlwWEpnTHkwck9RNlZFb3Y4Z3VucklFU3VL?=
 =?utf-8?B?OHFOMWlzNCt2VzVvL1k0WFo2NlBreDJPTnF6WG5SVFcxY2ZvbHNDWUwzVzlR?=
 =?utf-8?B?eEcxUXlzck82eFdzMFVnM3BnVUpvbXJLVVFkM2NWQlVOTnVibVFRTXVwQ012?=
 =?utf-8?B?dk1rVGtDRzh3ZXJBZlF1dkZlNlZGWXMyNXNKbm5SOG40NEpScFFyZXhqQUhJ?=
 =?utf-8?B?cXpXOHJKc3dEQnVGV0VCVnYxcHFwWmkreHBBVUQ3WTIwcFJqc1NSbWJSZlZI?=
 =?utf-8?B?KzZyYllkNWhFcWNzUUp5d09xb213MlZiT1hwTlE3eFVocXVuOUhERnNEUGE5?=
 =?utf-8?B?S1AwVzZ6cjVhZHFvSWhWWDVVSmJVci9keng4ZTBnbkoxei9pU250ZVN0VzRr?=
 =?utf-8?B?ancxcVJBaGtFVStoOFpIcGZBVUFDaTVnS2lXb0J3LzBVdXRib0JXem9kMEVa?=
 =?utf-8?B?cWlHb1RsQXl2bVVvcStxc2p0Mm9IUDljT2lTOUpyTnJ6Wk5sWk05M3BTN1do?=
 =?utf-8?B?WTJwcis0c2lLL0ViWk41R1BrVlRGalE3R1J1V25pR1dEWWxOc0JUeVhtd0tq?=
 =?utf-8?B?Q1cvK2VQOEJncDZqU1N3SktNSWtHMG9oUU9KSkFGZVlEVzh2bGhUaHR6MlZE?=
 =?utf-8?B?b1o0d3BFb2Zib1FMbXhYYnRPL3k4TXJPUTNtTjJldnJIc2ZJK0p2RUkwZDR1?=
 =?utf-8?B?NGd1WXdsTXVRN1ZqTmZkbDBueDRkQmVzQUN2Q0FnSnh5WndRdWlrOEJsSDNu?=
 =?utf-8?B?NFplOG96VHUxcEt6K1NLZHlsMVFzMUloOTRFZEt1eXF4TXFpRnZ2YWd6MEhY?=
 =?utf-8?B?c09zUkFoTHB1NFlWYktnN1A3QmpLcmVTR0FhZTZHNExvQ3E0VXFHTENkbS9x?=
 =?utf-8?B?S1JGNGRWaUtnRDJTYXQ3QTVJNlV6WmFSL0krQTV3d1R3bGxPTUVBWlpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTk5aTI5SG16RjRYbXFnYWtQbC90YVRja3RUOS81MjZwQkdLeUVtSUNDdWFP?=
 =?utf-8?B?OUxTL3VYSk5MSW5aaE5lMXZ5aWxHNW1uQVBTMnlYU3Y1Q1p6OWFQOTg0NFc5?=
 =?utf-8?B?aCtzR1FaYUtkUzhrQzE2cjFWNnkvT0pOc2lEYTJ2RWRMQklrU3h4T0dNTGJD?=
 =?utf-8?B?akpWaGRKYldNVENGRzF6UDJSaTVBRmpSd3I3c3FDcmQ0YnRjTzJYTGN5NEcz?=
 =?utf-8?B?OEwyMGg1dUdBazBLdlZPN2FXQTZtRkh2eCtwQ2xaZ1E3KzBtVU1QU3VaVFJF?=
 =?utf-8?B?bm5rbFQ3aGgzRk9jczVGa2Y0dDJoWUhiNC8xOUZvQi9WU2xKVDUyaHU4SHEz?=
 =?utf-8?B?anF4d200WldBd1E2ZWpTVHRkSEVNMlFJZkRJVEdTU3FDT1FUZlZscjJXTWxh?=
 =?utf-8?B?VXFibXd6eHhqaHF6a083S3YyWUtUVmRXM3hPMzNRaDVDZUx5ZVhFMGZUajBw?=
 =?utf-8?B?KzdsSkRmRDFUQTQ0QjdyWUdkbkl0dVdkMFZHTGhzeDQ1YzViSW9lcnBTRUZt?=
 =?utf-8?B?SkZwdDgwN0dJYWx3N21oTjh1bkhTWG93U2tPenhGMFhPZlJ0ZTRJdmt0RW5Y?=
 =?utf-8?B?dDl5TkRLT3BFZ3lHT3gveDY4VXVQZ1BCYXpRQ2dtWVZKYVJ2WUNKaXYvMmtt?=
 =?utf-8?B?cWpPaFp5ZFMyUkk5K2Z1R2tjTVlZbHY5L056WCtnaHBXQndKemNRWWhrS2Ny?=
 =?utf-8?B?WHFVQUVyYk9XbDlzMXdjSjhrUzJWejZQcmVCKzJWM3A3V3FCcU5WaHV0Wko4?=
 =?utf-8?B?OGc4cHJkb3RscHc1ZG1COENtbWN6clQ1TjBJbG9oZHY2UmhZaXZTdkdNWDl5?=
 =?utf-8?B?VDUrQzZBeVU4MUtPNkpwMjZUNTNILy83S3RLR09iekdYMDViZGRWdWpGN0NX?=
 =?utf-8?B?NEloVXQ1Vi9ubklheEdiaGplSG9HNnRMSzF0eFo4S1hVTGRlaDJZM2hEYThj?=
 =?utf-8?B?SjRYYnd6R3dqYkhGUjhiV3hMc2J6RVBtV0ZKZGNCVHlQcmxqNDVZWkE0dC9w?=
 =?utf-8?B?MzQ0OE1pK2dCM01YSTR0WHJHU2Q4YXBlYzJlOGQ2VU5mNldxcFZGQlNGam9Q?=
 =?utf-8?B?VStkRGsxZlA0VzFmZHRockNYMGVkU0xxSUxiTUVYeHhGczFaYTArc0ZXRWZj?=
 =?utf-8?B?d1BNMnk3SlBkcmUwMTRrdGpnSTFYMDB5VGM3UE9yMkJJSlpwdzhwZ09WVmhz?=
 =?utf-8?B?My80SWVvbUg2THZBeTVrV3l5Ni9ZNHFsYjk3OTVOVWEyZk5KUkdVaXIxaWJK?=
 =?utf-8?B?ZTdZNERjSjY2MW5JK0lpMHhERzcwZ0lUZGJXUVgxVVJTUGIxNmVkWDRhYjVP?=
 =?utf-8?B?cjZzNENJYkQ0eXQzRVZuL2VBOU5sVmI5RjNYMTA3YmtWMFJPL3pra2lsZ0Iv?=
 =?utf-8?B?RDIyYlY1VzIvQUdGWjNkVElRNDlLTDJyU1hSTkd3RC9MQnFwUm1pMVJUbUYr?=
 =?utf-8?B?c0lETGVrMnk4YlJFcVRkUEdLSDNCZm5mMEcrZll6N2puMmthYnhQb2J5UitS?=
 =?utf-8?B?QmxoNXM5aWhNZUpHeXMwS3YreXYxcGY2VDRsR0hhZEJxSE4zS0FPN0FiUG9F?=
 =?utf-8?B?QURxbWlIbndUSTd4bnVKckdjcU51ZWtxSElSNWgwcHpQTmZhcWh2YllNcmlw?=
 =?utf-8?B?VmlWTXMyb0pIUjYwTHBBK2k0VEFuV0RNUCtWVlVINVYzRWJUbkNpcUJhSWVa?=
 =?utf-8?B?Q2F4QmpndENYYks0NEFVdmJzN2t2TkVHb2ZjaHJzYkQ3RmpFMWdpblp0d1Vz?=
 =?utf-8?B?bW1tRTNNUlhGbE8zMEZlTWdYUk9ZT2tEK3VBRzEveElxY0FvRFkxUkFpR3RK?=
 =?utf-8?B?b3FXYmgvRnE2VWF3dTJTbHREaHlpVWx4dVBwTmVmSVJ6V2V6c0ZwOG51MXRt?=
 =?utf-8?B?WmV5RmxHZTRRQjBkQjRIKzVuaXV0YzR6QzgwMkVma1RXQ0JUM1VDbmxsa3pH?=
 =?utf-8?B?WGVIZXIwc2FYZDVRYU1FTENpeW8yMUorZWdQYXZOM3ZzNGdiNkE5dElZTG1i?=
 =?utf-8?B?RmorNlozejRmdk5xNFJscWNKRHdXbENoTVdHREdVM3lsVzVWTXU5d2hvRFAv?=
 =?utf-8?B?SHRNMXlWU0dkOU1LY1BUZzFub2dxd05Mald3ZStVaFZKQzF3Q1crNisyTEVo?=
 =?utf-8?B?S3hzV0NDeXpxbWd5SmU4VkwrK0FhRkgrWUg3UStTOFlMazJuOEhubERIUUE0?=
 =?utf-8?Q?VAbdYFBwqVuXonf5ta+2a/g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda462a4-168d-4778-c845-08dcdd8dd915
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 18:14:08.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvCmwSfvuc30DN/J6EOy9CBD30VfYyAHmv5SOnBDyrFxys5bc9G3s0SQlh7xTbuS4Z59/d/IqBHKaLflMwomdoSTre7N388/E7sD3HVd/ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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



On 25-09-2024 22:50, Michal Wajdeczko wrote:
> 
> 
> On 25.09.2024 18:36, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 25-09-2024 17:31, Michal Wajdeczko wrote:
>>>
>>>
>>> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>> increment the reference count for the domain. This ensures that
>>>> subsequent _get calls do not incorrectly assume the domain is awake. The
>>>> return value is a mask of domains whose reference counts were
>>>> incremented, and these domains need to be released using
>>>> xe_force_wake_put.
>>>>
>>>> The caller needs to compare the return value with the input domains to
>>>> determine the success or failure of the operation and decide whether to
>>>> continue or return accordingly.
>>>>
>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>
>>>> v3
>>>> - Use explicit type for mask (Michal/Badal)
>>>> - Improve kernel-doc (Michal)
>>>> - Use unsigned int instead of abusing enum (Michal)
>>>>
>>>> v5
>>>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>>>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>>>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
>>>>    drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>>    2 files changed, 31 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/
>>>> xe_force_wake.c
>>>> index a64c14757c84..d190aa93be90 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>                         (ffs(tmp__) - 1))) && \
>>>>                         domain__->reg_ctl.addr)
>>>>    -int xe_force_wake_get(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains)
>>>> +/**
>>>> + * xe_force_wake_get() : Increase the domain refcount
>>>> + * @fw: struct xe_force_wake
>>>> + * @domains: forcewake domains to get refcount on
>>>> + *
>>>> + * This function takes references for the input @domains and wakes
>>>> them if
>>>> + * they are asleep.
>>>
>>> nit: likely we should also add the note that one shall call the
>>> xe_force_wake_put() function to decrease refcounts
>>
>> Sure.
>>
>>>
>>>> + *
>>>> + * Return: mask of refcount increased domains.
>>>
>>> do we really need to expose implementation detail to the caller?
>>>
>>> can't we just treat the returned value as opaque data that just needs to
>>> be passed to the matching xe_force_wake_put(fw, ref) call ?
>>>
>>>> If the return value is
>>>> + * equal to the input parameter @domains, the operation is considered
>>>> + * successful.
>>>
>>> sorry, but I'm still little uncomfortable with such approach, due to a
>>> mismatch between input parameter type that is enum xe_force_wake_domains
>>> and return type which is unsigned int, as IMO forcing the user to
>>> compare two different types seems wrong
>>
>> Sure, I understand the thought process behind it. Will a helper to do it
>> is OK. Justifying below for the helper.
>>
>>>
>>> can't we just say that if returned value is zero then no domains were
>>> waken (which would provide definite answer if single domain was
>>> requested) ?
>>
>> I am concerned  about the scenario, where user ends up considering non
>> zero return of FORCEWAKE_ALL as success.
> 
> while user can always do something wrong, note that in above statement
> we didn't say that _all_ requested domains were awake if ref != 0
> 
>>
>> Having multiple success or failure condition for same API, based on
>> input parameter looks bad design to me.
> 
> it's not multiple, in fact it is unified:
> 
> 1) ALL_DOMAINS
> 
> 	ref = xe_force_wake_get(fw, ALL_DOMAINS)
> 	if (!ref)
> 		return -EIO
> 
> 	// explicit check
> 	if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
> 		...
> 
> 	xe_force_wake_put(fw, ref)
> 
> 
> 2a) SINGLE_DOMAIN
> 
> 	ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
> 	if (!ref)
> 		return -EIO
> 
> 	// explicit check
> 	if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
> 		...
> 
> 	xe_force_wake_put(fw, ref)
> 
> 
> and what we did is just optimization for SINGLE_DOMAIN
> 
> 2b) SINGLE_DOMAIN
> 
> 	ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
> 	if (!ref)
> 		return -EIO
> 
> 	BUG_ON(!xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
> 
> 	xe_force_wake_put(fw, ref)
> 
>>
>> ref = xe_force_wake_get(fw, GT)
>> if (ref) -> means success condn
>>
>> whereas
>>
>> ref = xe_force_wake_put(fw, ALL)
>> if (ref) -> doesn't necessarily means successfully awakened all domain.
>>
>> User can very easily interpret it wrongly:
>> ref = xe_force_wake_get(fw, ALL)
>> if(!ref)
>>      error_handling;
>>
>> /* Irrespective of failure or success of xe_force_wake_get code reaches
>> here */
>> do_multiple_operations(); /* Needed all fw domains supported on GT to be
>> awake */
>>
>> xe_force_wake_put(fw, ref);
>>
>> We have use-cases throughout the driver where user relies on success/
>> failure for FORCEWAKE_ALL domains.
> 
> maybe for more consistent API we should have two functions:
> 
> a) pass only if _all_ domains are awake
> 
> 	ref = xe_force_wake_get(fw, ALL_DOMAINS)
> 	if (!ref)
> 		return -EIO
> 
> 	// no need for explicit checks
> 	BUG_ON(!xe_force_wake_is_awake(fw, FOO_DOMAIN))
> 	BUG_ON(!xe_force_wake_is_awake(fw, BAR_DOMAIN))
> 	...
> 
> 	xe_force_wake_put(fw, ref)
> 
> b) fails only if _all_ domains are not awake
> 
> 	ref = xe_force_wake_get(fw, ALL_DOMAINS)
> 	if (!ref)
> 		return -EIO
> 
> 	// must do explicit checks
> 	if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
> 		...
> 
> 	xe_force_wake_put(fw, ref)
>>
>>>
>>> and for the xe_force_wake_get(fw, ALL_DOMAINS) case, we can provide
>>> helper function that will check if specified domain is really awake:
>>>
>>>      ref = xe_force_wake_put(fw, ALL_DOMAIN)
>>>
>>>      if (ref) {
>>>          xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
>>
>>
>> I assume this API is to check whether ref has domain in it or not. Will
>> be good helper to have for such scenarios, Which are currently not there
>> in driver.
> 
> there could be two variants, one that checks fw
> 
> 	xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
> 
> other that checks ref
> 
> 	xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN)
> 
> but the only benefit from the latter is that it could be lightweight as
> otherwise
> 
> 	BUG_ON(xe_force_wake_is_awake(fw, SINGLE_DOMAIN) ^
> 	       xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN))
> 
>>
>>
>>>
>>>          xe_force_wake_put(fw, ref)
>>>      }
>>>
>>
>> I believe a helper to determine success or failure of force_wake_get,
>> instead of caller doing it will streamline all the domains and usecases.
>>
>> int xe_force_wake_get_status(enum domain, unsigned int fw_ref)
>> {
>>    return  (fw_ref == domain) ? 0 : -ETIMEDOUT;
>> }
> 
> I'm not sure we should provide error code, IMO simple bool function will
> better and caller can decide what to do next


-ETIMEDOUT is the actual error code for domain awake acknowledgment 
failure that is why I added it. I am fine with bool and letting caller 
decide.

Thinking more about it, better not to have xe_force_wake_is_awake and 
rely on xe_force_wake_ref_has_domain.
fw->awake_domain is global state and could be awaken from anywhere 
doesn't guarantee it is awaken by current force_wake_get(). Can be a 
misused.

Since you recommended using bool. How about ?

bool xe_force_wake_ref_has_domain(enum domain, unsigned int fw_ref)
{ return (fw_ref & domain == domain) ?  true : false ;
}

works for all scenario:

ref = xe_force_wake_get(fw, SINGLE)
if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure


ref = xe_force_wake_get(fw, ALL)
!xe_force_wake_ref_has_domain(ALL, ref) -> failure

ref = xe_force_wake_get(fw, ALL)
if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure


If you find this to be ok. Will define this helper and use it to check 
status of force_wake_get.

BR
Himal

> 
>>
>> Usecases:
>>
>> A) No error check, just continue in case of failure too.
>>
>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>> do_operations();
>> xe_force_wake_put(fw, ref);
> 
> yep
> 
> and inside do_operations() we can always use xe_force_wake_is_awake to
> check every domain
> 
>>
>> B) error check, abort in case of failure.
>>
>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>> int err = xe_force_wake_get_status(domain, ref);
>> if(err) {
>>       xe_force_wake_put(fw, ref);
>>           return err;
>>          }
>> do_operations();
>> xe_force_wake_put(fw, ref);
> 
> nay, too complicated, better:
> 
> ref = xe_force_wake_get(fw, ALL);
> 
> err = xe_force_wake_is_awake(fw, ALL) ? do_operations() : -EFATAL;
> 
> xe_force_wake_put(fw, ref);
> 
>>
>> c) get all domain, but check specific domain:
>>
>> ref =  xe_force_wake_get(fw, ALL_domain);
>>     if (xe_force_wake_get_status(domain, ref))
>>          dmesg_warn( "unable to awake all requested domain \n");
> 
> IIRC in xe_force_wake_get() there is one WARN already
> 
>>
>>      if (xe_fwref_has_domain(fw, SINGLE_DOMAIN))
>>          do_operations()
>>
>>     xe_force_wake_put(fw, ref);
>>
> 
> so maybe simpler:
> 
> ref = xe_force_wake_get(fw, ALL);
> 
> err = xe_force_wake_is_awake(fw, FOO) ? do_operations() : -EMINOR;
> 
> xe_force_wake_put(fw, ref);
> 
> 
>>>> Otherwise, the operation is considered a failure, and
>>>> + * the caller should handle the failure case, potentially returning
>>>> + * -ETIMEDOUT.
>>>> + */
>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>> +                   enum xe_force_wake_domains domains)
>>>>    {
>>>>        struct xe_gt *gt = fw->gt;
>>>>        struct xe_force_wake_domain *domain;
>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>> +    unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>>>>        unsigned long flags;
>>>> -    int ret = 0;
>>>>          spin_lock_irqsave(&fw->lock, flags);
>>>>        for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>            if (!domain->ref++) {
>>>> -            woken |= BIT(domain->id);
>>>> +            awake_rqst |= BIT(domain->id);
>>>>                domain_wake(gt, domain);
>>>>            }
>>>>        }
>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>> -        ret |= domain_wake_wait(gt, domain);
>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>> +            fw->awake_domains |= BIT(domain->id);
>>>> +        } else {
>>>> +            awake_failed |= BIT(domain->id);
>>>> +            --domain->ref;
>>>> +        }
>>>>        }
>>>> -    fw->awake_domains |= woken;
>>>> +    ret = (domains & ~awake_failed);
>>>>        spin_unlock_irqrestore(&fw->lock, flags);
>>>>    +    xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to
>>>> acknowledgment awake\n",
>>>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>>>> +
>>>>        return ret;
>>>>    }
>>>>    diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/
>>>> xe/xe_force_wake.h
>>>> index a2577672f4e3..6c1ade39139b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>>>                   struct xe_force_wake *fw);
>>>>    void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>                    struct xe_force_wake *fw);
>>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains);
>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>> +                   enum xe_force_wake_domains domains);
>>>>    int xe_force_wake_put(struct xe_force_wake *fw,
>>>>                  enum xe_force_wake_domains domains);
>>>>    
>>>
>>
> 

