Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28975C36014
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 06:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676F10E4F8;
	Tue,  1 Apr 2025 06:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZaukN3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE16B10E4F5
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 06:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743488346; x=1775024346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C8TUNj8qUe9KTajGehibM+SARBjyBiN+BbY/UpKkSgI=;
 b=fZaukN3sdFPCLJsraNKo/CU3gmBRj7Ef3SaRiVraYM8P4SKU7SDvgiYo
 Lmb/IHHHh0AK5eaHrKiu/gZheYIXR5koTSe38XZbpWIV7ssRux7R6P6nr
 81sVQlm6LrDCVZ699/9kQGKSPrQt0HKs56gOS6behBwwc+jNi0dkl9SmV
 psFhqz6mUNa+xGb3yjYlSC524Xp+ss/02hXGT32KN9Qz0tHieo5i89hGo
 upwxtoTj8qE8TTA/BdS8CIEMjogNP7cqBsxs4k9OBLE2fwT0O8SgTKiVC
 6OJoNlBuMx7krCdr2B5Z7mEKSKPoK51uWFCU76yC9LbEPoidqs//2Dzz3 A==;
X-CSE-ConnectionGUID: HARTbZgARpaLEiHAxGRjjQ==
X-CSE-MsgGUID: PM/rgiCPRQuij0f8R5iZsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56159949"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="56159949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:19:06 -0700
X-CSE-ConnectionGUID: toN8P8c7QJKs5YpMX1qQKg==
X-CSE-MsgGUID: aVPLiSYrT6y6I1B7hbcC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126048528"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:19:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 23:19:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 23:19:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 23:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McpyuBaDGvhX7Xhil9gT4dGatAGnZpGkI+DxDXr5mnO9su6e7udYzZWy8/q/29zEMVivcLvMrWBVb6mQ+J9TwK8jE+fmSBUPk+rvRvm3vJpqG3Fs7yF2kOxItPQLInVAxMHSwSQCVaTp915i+2UWglpwHWm+Q7FMAZlrszvVjRQMc+mQZQDAyhU2rl81A92cMaJchUU5Mly2iLlAAT1AN3hlRXoV5rOCBcJ7WkL/Dk7566h0Kgey78sDJ0fA4np/fL/y7LGrNRnfJW8dQOpqN5Suen7pT+XgZ96Fww8tuJLqCvSG0rJp6+G7jCGjQetjsPXszpJG6pSJN5Mx0lf6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLs1q/igkEfs6RArNdfuIZb/EtGqm+zfMyDkw36f4jQ=;
 b=OKGKbiysfcX1XJNLC4zXYZmTnx9lOnrgGWYFv5NQ0Ewx/O9qsqMQyP90VP9mpknf9E9HIBJrN/F7dFEXwhpz/x4yVxB2rFUGYeV6z5w4lbc2hXgiKOyOQLTvuR4XdKykITleRGEnNV3Bwp7Ri9q2QYBE9pmD2NWPMIKqFTB2ihraCpvf9iRl87gffjFhP8Zk0/Qk/9fdI49BnEFr9isW50P6caE6SRlq9Gr/Do/+iMfoFIOdtOvSMkkF6nIyEFTdYM5+JCVUMXtNLmNE8VZn3WcdujBDEofGcSp3BTulM2LS7VWWsOXjm8YUUl13ISIjzZcGnoSv3oZCcNbIjTfDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:19:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:19:00 +0000
Message-ID: <cf183155-8df0-4f62-8e95-ec001ce01bb5@intel.com>
Date: Tue, 1 Apr 2025 11:48:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add configfs support for survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@linux.intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
 <Z-r40FFDDRVzI7wb@intel.com>
 <t33j6tcubwtq6r4wuhmz2p6s2wwpqsv7bye7ilzwf7r3vwpt2p@bop726wytsvs>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <t33j6tcubwtq6r4wuhmz2p6s2wwpqsv7bye7ilzwf7r3vwpt2p@bop726wytsvs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: c39a17a2-4b50-448a-9c1d-08dd70e517c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDBJOUt3QytKVkJMWHpUOXZMTFB0c2tZRXl0a0hNTUxuMWpvVFZpL2lneTg4?=
 =?utf-8?B?Y09TYm1BRVJLS2ZkZTdJakFtQ2VpKzVDQW9XQ0RuZFBycGRPQWMrRERWc3lO?=
 =?utf-8?B?WjZwaDNhY1l0dzRGL3hoT0RGalVuY2Rjbjg5T0E1NUFuazZGTWdMNGVrZjd6?=
 =?utf-8?B?VU5vOXQzaTJ1RUtvcUNvY2lwYnd5b3kzaC9CSlFQak4xTWRUdEdmYzAyTFV0?=
 =?utf-8?B?V08wMXdmbVc4ZDdjWXByWWI2WWlLc25sajc4QXFtbE5zdW5IeG9kZTErVDdy?=
 =?utf-8?B?aUYyQmhWUE5zL3BkY2pqeU14SGVmUHB6MVNGaUZPNVB5QjJVYmltaEtMampU?=
 =?utf-8?B?QWxYNXViR2NSOUJwcmpVc1Z2SEVMMjFZM0NaRjhudVRGRXpvZy9Zd1NMWDR4?=
 =?utf-8?B?RnpxZGJYVUxqc0djZVFxLzRwNVZubHgrdmdzMm9DOHhkdVZLSFFwVG5Nd1d1?=
 =?utf-8?B?ZExDZDlIM0VlQUx4L0JXYlZvNXNGNXVtbmwvRmVDbEsxS0MxeHVDRkJKeXNW?=
 =?utf-8?B?SHpXdjFYTzZ2OTJFRDBib1NHdGxsQ3FpVCtoczVveWh5RE16L3piTVNPK05z?=
 =?utf-8?B?bFA4d2xpdnRDY0k1eFRIclNpWGZpNnJIbGdrU0VtYTdjOTlreEk1eEFjWnBU?=
 =?utf-8?B?cVhwMytQdXlvbTltYjJUWWMwd08xVEJZNkY2U2p0UEVDVWN1UFplNHU0MkZn?=
 =?utf-8?B?VnR6V09IWGZheHdnQUtNNE9wQnA2Z2MzdS9sT1UyZ0Eya3NjekVVTlNDeXZM?=
 =?utf-8?B?TkRjMG1udk0yMkZMYWtuK1JYVFVKTnNIOThDd2lVcVdPSDZ6SDBZL3FJU3E4?=
 =?utf-8?B?anFrOW00WndTV2ZIaDExZ1drRzZSVUF5akZXeUpGOHpFMWJLc0t3c3dENDNl?=
 =?utf-8?B?T2Z5Q1dPUlZ6dDIvV3FLbm5FU1F1M1dBeURTYjNNemlJNHZVZnRUL1JCSHh5?=
 =?utf-8?B?Q09pRzAxWFlUYnAvU0lQOVh2K0VmM3VpNERkTllrU2xUUTlxSG9GMTlZVk1N?=
 =?utf-8?B?aUIvMTVXK1A3eklwN0pBYmZoVFkrNlZKTEZyTS90YTZGQVFiclZIM1hQYW1m?=
 =?utf-8?B?aWJYTVQvY3A2S014aVVrdVgzRGQvYWRUQkJTa01RNEYrb1JJZzZpSjlXNkZk?=
 =?utf-8?B?MC9rQVo4SkM3MHdVMEtTUU9YTHVuTHZPcjRNS1p1czJjdTFQOFVlT09YaUkz?=
 =?utf-8?B?TVNSSG1jQ0FEcDlTdFNpRjJyLzBrL3VxOXpNSVFLM1cyL2V0ZjNwLzRQeUhJ?=
 =?utf-8?B?RGtpNXJWZzhkNVNtWjlwUkhzd3VYa0FOVUZER09LUU11Zkx2UG9UZXI0WDFT?=
 =?utf-8?B?VHowblU3cVE1SGhJYm5wcUpoVmZtOWJObmc5ZjhpazRWcElGWEdsdURDUDVz?=
 =?utf-8?B?TXdDdUl4UEdxTjBEZThxOVpWeHVhMnU5cTFwckhzVFAzL3liRmVxZGZ1cDNK?=
 =?utf-8?B?ZTNKS0k4N2huVndLMUFxVE1NMzFndThuWHFwR3RodXlMWGxibzYyaDZIc0ZT?=
 =?utf-8?B?VysxdWNKZ0Q3UjFEdWk2dERqbE1TbkJyKzRaVGdIQWZMYjdWeU0rQkVIa1Zq?=
 =?utf-8?B?T1VOZXJ6UmFBVWI0d3pqNXI1Ti92STRtYlBJSHRveTRpQUVPdjNOMXZqMm9Q?=
 =?utf-8?B?M2YwdXhPTkpSaEpHZGIxTTlVdjM0WGFwMDRoRnRNVVV3TXVQakF2N21Hb2cy?=
 =?utf-8?B?S2g0WmcyZVhKc1ZscEZDUkV3aUJLR3NoY2RPUDVGRGdPMk5UU1JDNlNvZm95?=
 =?utf-8?B?MDRjL1N3N3FEZ3B0UmxxTlFhVEs0Q09zcitOSGlaSTNQWlJuamgxOXZQRExK?=
 =?utf-8?B?bG5YV1FXQU5aMm0yWVRhbUV4clJxbWtnYjV1SmFDaGExbEJvbXV2L21kMzBs?=
 =?utf-8?B?RkoraDRHZ0tMUzdKM015M0hWTnNNV2lLVHk5b045SWxUMzlDZThkWUs1cG0w?=
 =?utf-8?Q?PCR0xJhk7Fg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clByWGdvMXRoUmFtQVFKRU5sN3dYaldkSlZMVXBtS0wxZHI1S3JOaXF6ZHNV?=
 =?utf-8?B?cTh6V3pHaVVpUnV3ajJ3UjMxWXhINml5dHZQemN4cVVsL3MzTlN2VkQ5eWV4?=
 =?utf-8?B?RXN2VGEzYWNlWXBUY2VGR0hBQncyOHFMQXZEU1ZHZnJuYzNVSkdqNFdlSXZP?=
 =?utf-8?B?NFJsTHZYeE1Uelo4SjRFMlJ1QzlMbVFtK2ZxNEZ3TnJRbU1EcnFBdURNOEVN?=
 =?utf-8?B?SklWSXhwczk1SGRqOEdNTkZHalc4c3JlOGpGSnZ1OFpCUmJmb0VsTUNlTG1l?=
 =?utf-8?B?a05iUUZEZVVxY1VDU053am54cWZTWnNSRVAwNWV4UlJjS094Q3FTakt0OE5Q?=
 =?utf-8?B?M0d6bmJaSCtuNTFybzYyaVg5L0Fid2RtaG1YU2NjN2hjTXZvRVMraFNYMTN1?=
 =?utf-8?B?MXdqK2ZRQkUzWnRhbHhEVEpmY3ZnOUdyYW1uREtQeDFqL1p6WFJxZktvZ1B5?=
 =?utf-8?B?bzV2cXkrck9IVGN2OTF2VGRXNUlYajBiZjg0czIwRXFBUW9UNm84aysrZ0hD?=
 =?utf-8?B?WGl1a1pyeXJDa1YzQy8xejRkVjdZa0xUSWJwY1EzZEJGdGI4RGZTMTJZN2Vi?=
 =?utf-8?B?OFBvUEJnRC9DK2YyU1k1VGxtaGJFZHkxV0JiQWlEVkRQdm4vZzFGSXhkbUxU?=
 =?utf-8?B?QkpUbUZMM3loV1ZkZ05TVkxkbFFPZGpTbFpZTEw5QnJCaU94dnphWUdoUllO?=
 =?utf-8?B?WHZmdktwc0ZMNTJrWHIvc2xyemRNd0E5b09HTDFFTWxHMlJVWTZvejIvZDI0?=
 =?utf-8?B?cGJGa2VLWmVXNzhxVVpxYW0xN2xNcW1Kd01UOVB0cmlyZitaNFpTOUV0OWYx?=
 =?utf-8?B?KzhacjVKUVBxTkJXak5BUDRGSklSMXZ6WUQ5YXZvcUE0THN4Zk9YbDF0ZEZ6?=
 =?utf-8?B?QzF1TUlBdlQ1cEduS2dsUXhWMDFGMys3cFBMd0NKbUQvRElDd3BHUUh0N1BM?=
 =?utf-8?B?djVKam5Xa2hVSTJzL2lVNkIrODFXY3VkMUNxb1REbHE4WWhXcHFBWU1vWmlM?=
 =?utf-8?B?alZtdmtGRHEwenpOOXJaaG90d0hMUmJST25WNW84YWpQRXM2Q1FpL0J0MGhv?=
 =?utf-8?B?aTZhK3NPdmN2aWdrMWxWOGVHaUE4TGd5bk1rMWdhUndwWC9KSkZxVThSaG55?=
 =?utf-8?B?ZUhiRURKbjJ5b2pBaFNqZmkrZEZ4UktkU21CdjdpK1FVajdEbWdIOU9oQ2NG?=
 =?utf-8?B?ZDNlZmhFV0VzYXVpR1k2Mi85K1VBT3RwUXFsc0phU1ZqaFJCN1JzbkYzN1hL?=
 =?utf-8?B?WHlXOHM4aENTMEJjbG1BWDRWVDhkelRDTGhGdzJsV0FLUXlJM0NGRFExMmRZ?=
 =?utf-8?B?a1gyeUxKZ1dIVVozQjlsU1grTGRGVVRPRFJQQXBabnRuWDlXY1FNT3hpdHVs?=
 =?utf-8?B?ejdLTVZDeXYxNXBUVGM5NzlFS1dycjVEU3QrOEJXN1pXQzM3QjBzUHBRT2JU?=
 =?utf-8?B?MUcxNGhodnhtUnZXWlVnOGlKbUhOeXBJcDFzaHNQQ3AxMjc4RFZOUUQ3VGEx?=
 =?utf-8?B?M0thSE85K0xiNVoyRStCZWkyTnJpZHR0dmxDcWVGUVpURFNuaSt4T3JEUjVD?=
 =?utf-8?B?L1NVd2hyUjNXU1ZwcEtQVDJ2dGdicFo5L01YNTJXaVNzeENucXZGT05aZG9X?=
 =?utf-8?B?MTFzdWtTYUpiTGpwWXhjOFpxV00zQ2Rrd0FlcXgzU0p2bnBHMUhNT2pGN0xq?=
 =?utf-8?B?NTUzMkVjNlp4Z3lTYUcrOXBHaTNNWTVrc0M3d2ljM3JQV3dIby9LdUdhSEQv?=
 =?utf-8?B?Q2hZM2JtWHp3UHdTTzVxcElOUWZocy9pMUxiTzYrZWlIM0EvSEtURkpaUW1l?=
 =?utf-8?B?czZNWFNNRGU4azM1OUUvYlRHMHdvekMrUTdJN293c0ZKeStyejdYSXg2SjZO?=
 =?utf-8?B?c2dicUVoME9MeGNrUlZVZEE4THJ2YktYRS8zSUxIcVJsMmxWK3RudThkdWl1?=
 =?utf-8?B?cG9iTjk3ZE9qWGRuZEtDKzRxSFdZWkxmcUtxbnhkT0VTWXMwUWRCaDNDSnFD?=
 =?utf-8?B?bVR5ZDV1NEVUWm94MU04QXR4ZDJlZnpTdk11Wk9IczZyQlRVNjFSbXZOTjVS?=
 =?utf-8?B?N3U1dS9zZTV1a050Y0gwR3N0ZUVBUVRVRHFmbk5PdUFBWVNBRm5OVmJjMEow?=
 =?utf-8?Q?Vq935dKjcZ5/SDCrV+SyDCfbo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c39a17a2-4b50-448a-9c1d-08dd70e517c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:19:00.8745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nw62WvFnS2sva/TgL57maJtnl62yT47HGgCpvixi5lmD4JudDQJKb1XzaenlZjGz7lpz7l6wUrHNQGHX8bqvwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
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

Hi Lucas

On 4/1/2025 3:15 AM, Lucas De Marchi wrote:
> On Mon, Mar 31, 2025 at 04:19:28PM -0400, Rodrigo Vivi wrote:
>> On Thu, Mar 27, 2025 at 09:40:39AM -0500, Lucas De Marchi wrote:
>>> On Thu, Mar 27, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
>>> > This series proposes to expose attributes via xe configfs
>>> > subsystem. Xe registers a configfs subsystem named 'xe'.
>>> > Userspace can then create directories for the devices they
>>> > want to configure and set appropriate attributes
>>> >
>>> > This is done by
>>> >
>>> > mount -t configfs none /config
>>> > mkdir /config/xe/0000:03:00.0
>>> >
>>>
>>> If we need a new version or to document anywhere in our docs, I'd add a
>>> comment here:
>>>
>>> # If driver is already bound, unbind it as this configuration
>>> # applies only when probing it
>>>
>>> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>>> > echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>>> >
>>> > This is an alternative to introducing module param that causes
>>> > all the connected and supported GPU cards to enter survivability mode.
>>> > Manually entering survivability mode is useful when pcode does not
>>> > report failure, in field repairs and validation
>>> >
>>> > Rev2: use config_groups (Lucas)
>>>
>>> Awesome. I have some other work pending that will make use of
>>> it. I will play with these patches soon.
>>
>> I really liked this new flow and I was giving it a try here right now.
>>
>> However it didn't work. It didn't take me to the survivability mode,
>> but also, I cannot unload the xe after creating this configfs file:
>>
>> sudo remove /sys/kernel/config/xe/0000\:0*
>> rm: cannot remove '0000:00:02.0/survivability_mode': Operation not 
>> permitted
>> rm: cannot remove '0000:03:00.0/survivability_mode': Operation not 
>> permitted
> 
> humn... testing on a bmg, it works:
> 
>      # # first of all, make sure autoprobe doesn't do what we don't
>      # # want:
>      # echo 0  > /sys/bus/pci/drivers_autoprobe
> 
>      # # load module and set the configuration
>      # modprobe xe
>      # mkdir /sys/kernel/config/xe/0000:03:00.0
>      # echo 1 > /sys/kernel/config/xe/0000\:03\:00.0/survivability_mode
> 
>      # # bind the driver and check it enters survivability mode
>      # echo 0000:03:00.0 > /sys/module/xe/drivers/pci\:xe/bind
>      # dmesg | tail -n1
>      [ 1994.807063] xe 0000:03:00.0: In Survivability Mode
>      # cat  /sys/bus/pci/drivers/xe/0000\:03\:00.0/survivability_mode 
>      Capability Info: 0x138320 - 0x2001ae06
>      Postcode Info: 0x138324 - 0x0
>      Overflow Info: 0x138328 - 0x0
>      Auxiliary Info 0: 0x13832c - 0x0
> 
> Unbind first and test we can remove the configuration for next bind:
> 
>      # echo 0000:03:00.0 > /sys/module/xe/drivers/pci\:xe/unbind
>      # tree /sys/kernel/config/xe
>      /sys/kernel/config/xe
>      └── 0000:03:00.0
>          └── survivability_mode
>      # rmdir /sys/kernel/config/xe/0000:03:00.0/
>      # tree /sys/kernel/config/xe
>      /sys/kernel/config/xe
> 
> Remove module:
>      # modprobe -r xe
> 
> 
> What doesn't work:
> 
>      1) Remove the module without unbinding. This is already the case
>      2) Remove the module without unbinding first
Do you mean removing directory?>
> For (2) it's basicaly: when you create a configfs connection, configfs
> increments the module's refcount. You have to remove them first.
yeah it takes a refcount and i think subsystem register fails if that's 
not taken. haven't tried >
> For my surprise, it's possible to remove the config after binding -
> there's no error. 
When i was trying, even with config_item reference is taken, it had 
allowed rmdir. drop_item is void and cannot return a error but didn't 
search further as survivability mode didn't require a reference.

Thanks
Riana> I need to double check if this wouldn't create some
> UAF depending on how we use the config, but for survivability purposes,
> I don't think it has an issue with that single bool.
> 
> Lucas De Marchi
> 
>>
>> Tried to unbind and had the same failure.
>>
>> then with the configfs there we cannot remove the module:
>> $ sudo rmmod xe
>> rmmod: ERROR: Module xe is in use
> 
> what's the `lsmod | grep xe` output?
> 
> You should always be able to unbind. There's nothing the driver can do
> that would block the unbind. After unbind, you should rmdir every dir in
> /sys/kernel/config/xe/*. Note that it's not an rm -r since you can't
> remove the inner configuration files, only the directory that is the
> "connection" between configfs and the driver. You also can't remove the
> xe dir (as it's owned by the module, not the connection to the device),
> only  the dirs under it.
> 
> Lucas De Marchi
> 
> 
>>
>>
>> So, it looks we have some stuff to adjust here before we can move 
>> further,
>> but so far things are looking promising indeed
>>
>>>
>>> thanks
>>> Lucas De Marchi

