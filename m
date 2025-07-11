Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18356C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 17:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99D010E2D5;
	Fri, 11 Jul 2025 17:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoTWZ3dA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110E10E2C6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752255549; x=1783791549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rtdaq+rNHlT7WjunB8SAH/kvZQ9cN+OUKoYI6T/N2QM=;
 b=BoTWZ3dAV2Gla/s00mSBPmb3BVRcakdQO+XCv34UybZIHQhF/aWEt5bx
 7sQAfoqV7ezA2cY44RPguDnuGxpuv2f1iFV8Zmbq4B8raFA4y29Tw+irc
 aSu0ojaDyfxHw/fG4m8iECq73/RocVNCOx0RvcDqHHodde4Z4XaMsvdGJ
 OWdIk3/fjnBulMLCZPverK77dpsb4q0eFOagEwS9crLt8Nu6Q4uIwxvbP
 MI5d1ZM69TBzXdF6m1eJv+5X+5mvJf5kvkVsp5iI4FyS5LXfdSg2hLfXv
 u5o7r50jDAOQmS01mJcz9D7cuVymyLZjXqcp5JrA+AC5gaWJZp2pDshgG A==;
X-CSE-ConnectionGUID: wQTQMER7Sz2ItVQxvZWIcg==
X-CSE-MsgGUID: 9cQ+09kjSP+tGJw6iOGiaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54644123"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54644123"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:39:09 -0700
X-CSE-ConnectionGUID: IngkQmrtQ9ylHf50kPm3IQ==
X-CSE-MsgGUID: u83Ll0k9SeG0XGP20QH4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160972818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:39:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:39:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 10:39:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7lnWEKeLiQceok1sWVXK1Tpcs3iYvaiTOum/oCnl4H1O3RzoNJeX/P6VdOpu1wgo2KkC82VkSwnwfp8fsexqof3GVVR+YIk2LBHEYXRzUvLOFDGSpiB3WIIhwXtUkgX8pKjvF39GIcOapiZTxPzgXz9X/GCKZrv049rUDaGnhRqNVAbVMygUZFVq7KN2WoEkwoeN+7fq19d/hn6cMK6/XHZ9mYuy9tmKes55xhIAE2zdlo1AKY5lexA349jH6jIMCKuwaNaUmhjji0w/iutlMlDSSQ2GZRfCaRmtT9cXATmRFWCOkiRegNVh0Rc0gYmwmsW7hdxXXiJkk3kCYGayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzssYNhDfuI4NyNrRib766ghPoCrm1uo3L/5S/uG5Zw=;
 b=cxayh95rJzJ68PgyH1cEbX0balwaeXYIA6DZGZncyiJhV63DC2xKmaGnOjm+h4CUiIKU/+rsYMrCPADa4QG4OkSRDqUOgff5o4bsGQtsWDzBHmRUMny+eZrYmHbyDKFaKH35wt57bM/cbtWLPLYTd3+55xCionomoSN16QTSrHz457HCcs3BJFT3Aq77CXWRaSMc4yunQ03kAn0Zm2+HxTniAMalUtfBoim0G1N+9AXiOKKzpw5vRREOG7KQrOsnMUXq5QFUMa0PzqhCMxAxroDqYxG8nCmimzRoXJ/cuSQRm+yHKdzuZS/5POfotNtEWhD6YcA5CHLcAeTNIM7m0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 17:38:26 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 17:38:25 +0000
Date: Fri, 11 Jul 2025 10:38:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v4 8/9] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Message-ID: <aHFMD4k-QdoxDLHq@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-9-riana.tauro@intel.com>
 <aHBcfIp4FzeivAdB@unerlige-desk.amr.corp.intel.com>
 <f4f6d2d3-7cf6-471d-b4cf-bdee6aa3284c@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4f6d2d3-7cf6-471d-b4cf-bdee6aa3284c@intel.com>
X-ClientProxiedBy: MW4PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:303:b5::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1cd9bc-c7cd-45bc-4c66-08ddc0a1bd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDYyZTRIUE5DM0tGWkVCcDdrQlBqOWRzYUxJVXRYNUpIbFA3UjV1dEtjZGdr?=
 =?utf-8?B?M0s1MWxPNnFIWlVxK1JHZUFuRDJTTFZNNVMwT05weURXbnVsWGRGWkY3WnVp?=
 =?utf-8?B?UWlIWVRwY0NEVVFFamxWNmFscTlMQjFmZ1pmRVM4ZkxHeXBIUWxvSzFPR3lD?=
 =?utf-8?B?YXkzVGxLYU1qL25JNm5GZTAveVBRRFBJalRGd3Z3aUg0SlFIamNjakJtYkRU?=
 =?utf-8?B?VEdFOEdZSzhYWHU0akxRaEQ0MXBKc3JxU3RlbGw4cWlaeXRudG5CVjhRZDE3?=
 =?utf-8?B?TEZFeTRubVYzb0c4cm9lbW5qdUJEWlhuNjhKVVZ0c3B5OWNLVGNnWisvdzFF?=
 =?utf-8?B?LzRvdVRSWXphZWdvVmZoMTNxRFl0OTVWbkpTckt0bVJtZWpFaUUyVjRkTnpL?=
 =?utf-8?B?VUhzS1NlbmRndFZvUXl3dUZiSEJLdlJtR3J5aDJTTnBScDRPMEdyZjRBa2hy?=
 =?utf-8?B?eFd0aFUvY2kxR0JhdDlRY3lzMklwQXpUVVhKZGhLNU1SWlBRWnAwYy9vbXU0?=
 =?utf-8?B?aTRPWEdKZmNSczlhaXlyWDBKZmZGUUtlN1ZZaEZIdDVSNG5zWlN3NzBWeFcz?=
 =?utf-8?B?bU9FcGZ0TXhqbDdKeUZ2UnBNNFlQV1lQTEFTckVVTzNOMkRiOVdIcGFtWnpw?=
 =?utf-8?B?Z0p4TDFWM0xMcE9VQmxLTXBiRVFsZ0RXOUVEaEpFWGxyZ2tnVFNzalN3MWN4?=
 =?utf-8?B?MFVOZnRlbTI5M2Vwcmo5SGF1cHkxK3VtejZGM2VTWEZ6SUlMNkV1aWRmS1Jm?=
 =?utf-8?B?aHdZenB4KzRnaTlXV3BLbFYzQTZHcmhQSTFEM1NsUWtMY2pKZTlMSGo5Q3Yy?=
 =?utf-8?B?Ly84ZDhVL2VreUNSaWcrVXRnL3B5RXptOUYzdFk4Mmx1cE11bDZZd3dCRHdo?=
 =?utf-8?B?anBuZGVIeVF0ZFgzRjhGYmwyZitQbUx3c2dsK3Y5a0JTV1c2T1R4WEtiUGYv?=
 =?utf-8?B?dnY0OTgzT2dESUxYWTlXMXUzQnBXbUQxVVJSSUpOWFozV1ZaOE9DaTFSRWl6?=
 =?utf-8?B?WjNRdUs1cTFNZmU3Wmx0aHJwMFg3TGw1TU12ZHJnTmc3WnBRa3dPOFQzOFNN?=
 =?utf-8?B?Y3FzWHhlT3U2QmRvWUhYNFJqNGE1bmVVTnVYNXVqakMrZWtZR1NWaDRKVFJ5?=
 =?utf-8?B?UlhhdlVrNHoxRnYwOVhobWdOSUpVMVZVQ0VydFZHSTYrem5ZZGZoaTNvMVgy?=
 =?utf-8?B?a3pUQU1CaTBYS25zRTZIOHFpeXNrdzZwS3dNQ1hKR0N1b1RlUlZxN1hUTGJV?=
 =?utf-8?B?Y0N1Q3duakFBelpGMmkxMUJNQ3FydXBjdlh6M1lkdTJOb0ZZenVBMERhOWRX?=
 =?utf-8?B?YldTRW8zbHJWWHhxNkRCSU5VTk1zZzVBaHlxdiswTmdyUThPaTBhZnp1MHFR?=
 =?utf-8?B?SUowQ3pGVTdncy9Jakg3RjFuRTZyNDJkeUNvdmJuck1ZWTIzbVZRdkVPL3lB?=
 =?utf-8?B?UndFRlFyV3h3VWN2WnJSaUZBblZIeUMxaFBScUhSV1VCVm9CcFhnZHZ4SUdF?=
 =?utf-8?B?Q0RNZkdQS04vL0lXd1pMWmkrLzJIN1B5UVZ5Y1ZpcE54YXhwNjIwbU0zNW1u?=
 =?utf-8?B?T1RtdCtVanJvUE1sVFQrSU5HWnVUWm5lRUg1VnBXQWQ1UUpLV2ZoOXhaSjNJ?=
 =?utf-8?B?WUtiRzhvTjFxbG5sTDBWeUZoeUZub29tV2tJYys4VXlVM0d1bE5sWE4xM1d2?=
 =?utf-8?B?REM4VDBMVGV0ZWY4UmZVYzVJZ0w0ZzdvTGN6TmR3MFZVdkdyN28vdHFNRTl5?=
 =?utf-8?B?WDYyS05RUlJVdGFyUURpWDY1TytkSE9BSFBqWXp6L0JSUnhNb2hNK29zSy9Q?=
 =?utf-8?B?R2tTZVd3Y2hMZFFLM2IyQW4wdnljRWVFRmUzZWRQNHUzMW83UkJjR1R6ZW5j?=
 =?utf-8?B?S3RrV29LeDFXdWI2UjV5N3krMDBjQUg2WXVOb2htOXl4T3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldUVSt2Vm1UN1VDekJMUTFlaXRId3N0Y1BMVVFFR0VNRGgxVmVjMncrUS9j?=
 =?utf-8?B?ejRXMjJkK28yVHdFWWZOdTFzMml1bzNqNkRqMmFnY1VhQnZkY2VEWVFkZzRL?=
 =?utf-8?B?TDBWQWVUcUYxM2hVRlJCUFdWSGFESFVac2sySGNNTVE1VUJJVUFDM3FtVGVE?=
 =?utf-8?B?YjVGMkZqVWxaRmtzZkhJYXpiWnBNajZXVVhxd1VsSVYwQ2p0S2QxaWRabDJa?=
 =?utf-8?B?VHlxVXlHYk1uay9FOENYazgxb09LcnFMSjdaRmxrNEltVjJNSVM1bmM3M3RH?=
 =?utf-8?B?d1FodWdRMXZLai9hbWkyRzk3K3V6V3R6azYrd3lnWHhERHJIUmh3YkJPQkF2?=
 =?utf-8?B?b1hQdG8rdkZmZksyK0RMdEhkVGU1ajY4d1drYWFkOXRnemhqY2pnbkk1Yllt?=
 =?utf-8?B?aWZTYmphWWtLU0Y4Rk9POHd5SkhqT0d0WXp4UEd6UURMK3Noa3dudEJyTnVI?=
 =?utf-8?B?aExPeUZvQllvVmx3TFN4d2JwZ0JGaHhCa251TUkzZTE1azNMVmNDczJkUmdu?=
 =?utf-8?B?cUZGRHlPU2p4SUJINnY4bEw5WWhJZG4vcElXMWlyNFZaUHRCbG5UQTFsc2FK?=
 =?utf-8?B?cnRVWUpxMldiTVdlaXRwZExWR2RjUzAxNEhNdHdPZDROY2xWTExPODVLamZq?=
 =?utf-8?B?T3B2TU1SQnZWM0ovK0dIak56azIvRUZoWFl4NzZONzZGVjQybU1HaU5JZUlS?=
 =?utf-8?B?MDNHQmlRbFY0NWNRcWRDbGxvdEZtVTNLMVF2LzM4SHJwemlGZlNLV1Q4TTg0?=
 =?utf-8?B?ZkduOVFqOUpNS3RWbFB4eExFamxBSTV2NTlVVExCcFJPUmE4Z1p5YmxmVG1Z?=
 =?utf-8?B?Qi90cjNlZjZOcmJvbWVHUngrd0JhVnRwVXVNVFM2T081VGU1dHpiL1JyRUIr?=
 =?utf-8?B?ZW9JRUd1WTM5MzZSUUMxSTh2ckdoTWhOU1l6NXVhMTI5eDRMbk5qMVU1MTBU?=
 =?utf-8?B?RUFyVUxvTCtZcUF0MElPS2NPSU1hZHJ3b0V6eGdKTlRIY3RMdFYvdk5LTlJy?=
 =?utf-8?B?cWNVN1h2L0dsNkxSUXJreEJ6T0g2cjExMVZSakhFU0c0UDFleGh1WUY3REJy?=
 =?utf-8?B?RzJHVzA0UWx0ZXVIRzZBaDllMTNtTnZEdWlVNHVJOUV0MThDb2xIT2RWOFRO?=
 =?utf-8?B?LzdvVWQwYTB0TDlKa3djRVIrMlZNSloyMUFOWjJKdmdYVHNibjhGbkk5SmVC?=
 =?utf-8?B?clljUVZ1SFMxVDMzdlpFemlEZUVoUkVPWHR3eEJ0UXZuL2c3VGRFdUtkcE4w?=
 =?utf-8?B?dE1rME9jaGhhNVowTVQxQ3MvNzJZVXMzdE1NdW52WHdRVzNNRk44a1dQTy85?=
 =?utf-8?B?cG5qWVdFbHFPT1VSRnZIT2s3Z2pjc2c0VzU3RjRIRFVYZjBPWG1DenNYRHR4?=
 =?utf-8?B?dWFJZmdaQll4UVNLWWVpL1NwUnVrOW9jcEFUcHIxNDE2VVZ4ZmJpRGI3KzVv?=
 =?utf-8?B?d1E3N3FLUGVQeFB4M1BXMG9BZW5Vb0NYSm5Zb0tCeW5nV1NHMytmMXBQS2Q4?=
 =?utf-8?B?bURSSXlTWW1ySmNnRVA2RUZZZkFzQ1BDOFRNV3hsQ2h3NWU4SmxoNE5vRVBM?=
 =?utf-8?B?OG1GRVJhSmo1SVhkcDdCdTNlUzBqRUl4R243dkRtUGFPQXgxMlNGdVF0Y0dP?=
 =?utf-8?B?V04rT201VWljbndwcEp4NnBOTDdwZDNpWEdGU3pKTFhTNHdRdlhtYkYxa1Zp?=
 =?utf-8?B?bFYrbWx4SGZpV1FsRnZHZGpIUzBDTlZSMlhoamFUUGQ4NXVpektqS2NtZmtT?=
 =?utf-8?B?UExwQTZiTlNpNzAwNTFuT1I4QWdtWEVnTnZVZVpoMGx4SklxWGs2SlpZY205?=
 =?utf-8?B?WW1BQkgxdU1MUDVjQjV4WTlPT2JjVDZMVHNQNFFWTkJtaGVWeGxQVzVzaXVk?=
 =?utf-8?B?TDd6TzF0N3laMEYzUEpBVkR4Rk1DdW5TaWRqQlN5eFNoaGFiWnF1dnVQNmxp?=
 =?utf-8?B?dWt4L3daVWhYbFc0L05TSWJYVVhKWS9aNzdicEozZ3hqaU5DK1VGTG5GQ25H?=
 =?utf-8?B?Ujd2MWxwV1V2UzJzTnYxOGd4MU5SQVFuNkRMRFBXQkxRWVlQUGFmb1JZRDNn?=
 =?utf-8?B?ZVEwZmxYS0NuNkswUDZKdFRZNi9XM1FBRkRhNGdic3dwR1ExZi9kR3FmQ2Zk?=
 =?utf-8?B?dEZqOVRrUEV4SnhybU9ESWVKWHNZVnM4L3ZuT1lkMFB0RTZvSnBJV3drR0FI?=
 =?utf-8?Q?2UgUycKZfo86pOcRrWhS5LM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1cd9bc-c7cd-45bc-4c66-08ddc0a1bd2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:38:25.4386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daINek9b/u6qXJYP5IpbPEDVIq374Lvgh8WiaAAQiVU7yhLyk7DZ3Fmdlx0D6y2AMyqjoAKjO1vxShGqRqB9hOeIETYeFMUdtXpNp73MQkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

On Fri, Jul 11, 2025 at 11:16:15AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 7/11/2025 6:06 AM, Umesh Nerlige Ramappa wrote:
>>On Wed, Jul 09, 2025 at 04:50:20PM +0530, Riana Tauro wrote:
>>>Add support to handle CSC firmware reported errors. When CSC firmware
>>>errors are encoutered, a error interrupt is received by the GFX device as
>>>a MSI interrupt.
>>>
>>>Device Source control registers indicates the source of the error as CSC
>>>The HEC error status register indicates that the error is firmware 
>>>reported
>>>Depending on the type of error, the error cause is written to the HEC
>>>Firmware error register.
>>>
>>>On encountering such CSC firmware errors, the graphics device is
>>>non-recoverable from driver context. The only way to recover from these
>>>errors is firmware flash. The device is then wedged and userspace is
>>>notified with a drm uevent
>>>
>>>v2: use vendor recovery method with
>>>   runtime survivability (Christian, Rodrigo, Raag)
>>>
>>>v3: move declare wedged to runtime survivability mode (Rodrigo)
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>>>drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>>>drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>>>drivers/gpu/drm/xe/xe_hw_error.c           | 68 +++++++++++++++++++++-
>>>4 files changed, 78 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h 
>>>b/drivers/gpu/drm/ xe/regs/xe_gsc_regs.h
>>>index 9b66cc972a63..180be82672ab 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>>@@ -13,6 +13,8 @@
>>>
>>>/* Definitions of GSC H/W registers, bits, etc */
>>>
>>>+#define BMG_GSC_HECI1_BASE    0x373000
>>>+
>>>#define MTL_GSC_HECI1_BASE    0x00116000
>>>#define MTL_GSC_HECI2_BASE    0x00117000
>>>
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h 
>>>b/drivers/gpu/ drm/xe/regs/xe_hw_error_regs.h
>>>index ed9b81fb28a0..c146b9ef44eb 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>@@ -6,10 +6,15 @@
>>>#ifndef _XE_HW_ERROR_REGS_H_
>>>#define _XE_HW_ERROR_REGS_H_
>>>
>>>+#define HEC_UNCORR_ERR_STATUS(base)                    
>>>XE_REG((base) + 0x118)
>>>+#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>>>+
>>>+#define HEC_UNCORR_FW_ERR_DW0(base)                    
>>>XE_REG((base) + 0x124)
>>>+
>>>#define DEV_ERR_STAT_NONFATAL            0x100178
>>>#define DEV_ERR_STAT_CORRECTABLE        0x10017c
>>>#define DEV_ERR_STAT_REG(x)            XE_REG(_PICK_EVEN((x), \
>>>                                  DEV_ERR_STAT_CORRECTABLE, \
>>>                                  DEV_ERR_STAT_NONFATAL))
>>>-
>>>+#define   XE_CSC_ERROR                BIT(17)
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>>b/drivers/gpu/drm/ xe/xe_device_types.h
>>>index ca300338e8c2..283d5c88758e 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>@@ -241,6 +241,9 @@ struct xe_tile {
>>>    /** @memirq: Memory Based Interrupts. */
>>>    struct xe_memirq memirq;
>>>
>>>+    /** @csc_hw_error_work: worker to report CSC HW errors */
>>>+    struct work_struct csc_hw_error_work;
>>>+
>>>    /** @pcode: tile's PCODE */
>>>    struct {
>>>        /** @pcode.lock: protecting tile's PCODE mailbox data */
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>>b/drivers/gpu/drm/xe/ xe_hw_error.c
>>>index 0f2590839900..7cc9b8a7fa1a 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>@@ -3,12 +3,16 @@
>>> * Copyright © 2025 Intel Corporation
>>> */
>>>
>>>+#include "regs/xe_gsc_regs.h"
>>>#include "regs/xe_hw_error_regs.h"
>>>#include "regs/xe_irq_regs.h"
>>>
>>>#include "xe_device.h"
>>>#include "xe_hw_error.h"
>>>#include "xe_mmio.h"
>>>+#include "xe_survivability_mode.h"
>>>+
>>>+#define  HEC_UNCORR_FW_ERR_BITS 4
>>>
>>>/* Error categories reported by hardware */
>>>enum hardware_error {
>>>@@ -18,6 +22,13 @@ enum hardware_error {
>>>    HARDWARE_ERROR_MAX,
>>>};
>>>
>>>+static const char * const hec_uncorrected_fw_errors[] = {
>>>+    "Fatal",
>>>+    "CSE Disabled",
>>>+    "FD Corruption",
>>>+    "Data Corruption"
>>>+};
>>>+
>>>static const char *hw_error_to_str(const enum hardware_error hw_err)
>>>{
>>>    switch (hw_err) {
>>>@@ -32,6 +43,56 @@ static const char *hw_error_to_str(const enum 
>>>hardware_error hw_err)
>>>    }
>>>}
>>>
>>>+static void csc_hw_error_work(struct work_struct *work)
>>>+{
>>>+    struct xe_tile *tile = container_of(work, typeof(*tile), 
>>>csc_hw_error_work);
>>>+    struct xe_device *xe = tile_to_xe(tile);
>>>+    int ret;
>>>+
>>>+    ret = xe_survivability_mode_runtime_enable(xe);
>>
>>xe_survivability_mode_runtime_enable() returns if it's not BMG, not 
>>dgfx etc., so does it make sense to not even queue the work if those 
>>conditions are not met?
>
>CSC work is only scheduled for BMG in the below handler.
>The bit is not present in prior platforms
>>
>>>+    if (ret)
>>>+        drm_err(&xe->drm, "Failed to enable runtime survivability 
>>>mode\n");
>>>+}
>>>+
>>>+static void csc_hw_error_handler(struct xe_tile *tile, const enum 
>>>hardware_error hw_err)
>>>+{
>>>+    const char *hw_err_str = hw_error_to_str(hw_err);
>>>+    struct xe_device *xe = tile_to_xe(tile);
>>>+    struct xe_mmio *mmio = &tile->mmio;
>>>+    u32 base, err_bit, err_src;
>>>+    unsigned long fw_err;
>>>+
>>>+    if (xe->info.platform != XE_BATTLEMAGE)
>>>+        return;
>>>+
>>>+    /* Not supported in BMG */
>>>+    if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>>>+        return;
>>>+
>>>+    base = BMG_GSC_HECI1_BASE;
>>>+    lockdep_assert_held(&xe->irq.lock);
>>>+    err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>>>+    if (!err_src) {
>>>+        drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported 
>>>HEC_ERR_STATUS_%s blank\n",
>>>+                    tile->id, hw_err_str);
>>>+        return;
>>>+    }
>>>+
>>>+    if (err_src & UNCORR_FW_REPORTED_ERR) {
>>>+        fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>>>+        for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>>>+            drm_err_ratelimited(&xe->drm, HW_ERR
>>>+                        "%s: HEC Uncorrected FW %s error 
>>>reported, bit[%d] is set\n",
>>>+                         hw_err_str, hec_uncorrected_fw_errors[err_bit],
>>>+                         err_bit);
>>>+
>>>+            schedule_work(&tile->csc_hw_error_work);
>>>+        }
>>>+    }
>>>+
>>>+    xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>>>+}
>>>+
>>>static void hw_error_source_handler(struct xe_tile *tile, const 
>>>enum hardware_error hw_err)
>>>{
>>>    const char *hw_err_str = hw_error_to_str(hw_err);
>>>@@ -50,7 +111,8 @@ static void hw_error_source_handler(struct 
>>>xe_tile *tile, const enum hardware_er
>>>        goto unlock;
>>>    }
>>>
>>>-    /* TODO: Process errrors per source */
>>>+    if (err_src & XE_CSC_ERROR)
>>>+        csc_hw_error_handler(tile, hw_err);
>>>
>>>    xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>>
>>>@@ -101,8 +163,12 @@ static void process_hw_errors(struct xe_device *xe)
>>> */
>>>void xe_hw_error_init(struct xe_device *xe)
>>>{
>>>+    struct xe_tile *tile = xe_device_get_root_tile(xe);
>>>+
>>>    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>>        return;
>>>
>>>+    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>
>>Same here, why have a worker if it's not BMG?
>>
>>Also, reiterating a previous comment in another patch - if the 
>>feature can be defined as a has_ struct member in the pci/gt info 
>>that could streamline the checks.
>
>This is only initialization. The queueing is done in the handler.
>If it is supported from a particular platform then it seems unnecessary.
>Should i add a function instead?

No, this is good enough if the worker is queued for supported platform.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Thanks,
>Riana
>
>>
>>Thanks,
>>Umesh
>>
>>>+
>>>    process_hw_errors(xe);
>>>}
>>>-- 
>>>2.47.1
>>>
>
>
