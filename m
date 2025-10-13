Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D87CCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 05:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CC010E032;
	Mon, 13 Oct 2025 05:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfVdgd4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62D10E032
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 05:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760334289; x=1791870289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=foeaqDONAaY6UxIFPuJ8qNpBdVI3qyAkQ5+aSmi6npU=;
 b=RfVdgd4W1t6AKdJt83tKjdSduVjoLwcAO35CRSh0EJ7nCl2pJ0WLJS/h
 uXm1p9JFreiPOVKqLoczV1yUuKkeOrsfsm0tJIpy/b0Ll+tL8FGIgP+pX
 oVFajbTluLaSMd9afnps0RpQiAiSoCXYxQ90UncVJkkblevWqqMV52ONs
 NRaSFuU661RmXAFDzOx9Cux7W/2EL8zMque5FFFKnQo2loQUrcUcVXxhk
 NPe3wO5Z/rlBTD2hb5YUhtxLAoMRgBmyqOzlmP2+hznG2m4P/f216JeSw
 rQbjKS8/wlfjYy6Luu5SE04MBDAU3ER8s6gTLFqtiG2xW/MRLfTMzZ202 w==;
X-CSE-ConnectionGUID: T/daqedPQiOnN1sp9/SMmQ==
X-CSE-MsgGUID: NmIe5lcIRBW9S0Wjv+WMcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62355491"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62355491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 22:44:49 -0700
X-CSE-ConnectionGUID: VlNXmymaRsytP3iF5uCuew==
X-CSE-MsgGUID: 2CpZXoDdRvqpIyBV2zhQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181462137"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 22:44:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 22:44:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 22:44:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 22:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJEX0yXm55DOWkG7jaZLO/N0ZTH6+ph2AIUqYjOdjdRnBxN1XQh3FwesekuxxFeeKQogwRTGdU36VyLF3WlJbIkLlT8sr67WEA1sEcKav+HTSX2PMSZdV6DKLRM9y0v2v25hZrZ+uHgKWvwSNgJ32AIt62FXSAfHlWSBjx0OQDxfSs6udzwTy0wPyjnN7aghHzobct6VIkI1cLow62AFYzkRNMdEDvo0Ae5d8J1iyTjNgt7Bg30K6RGa50svESI0kGLsWmJuquKGOhM7dogivhMTSUGnQzsZC4v1C+5npzmUFIz7+J/ump5z/DNDPZCyjCxWh/axnEVENhnJJzqZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hftexKgdBy8OV64/S/chbyFRnE/uA6hMsjs1JhAbH48=;
 b=wtYGJIdcUJqGUVio5pPdWGDLTTDF/0eHY6rlva80nWgT6dXWtxHpHmF10L0rc7DO+6kxn1YyPlkdFK0MyljlbRX0421MQQYN6rTs/iCn1oF9CSyVrTvSx2lgtlx/4wMxVuk77f7SobLJh9R3S5jsQx89fD1FoXdj5lzydX0OFu2FvglfTTNjff0ksQp+GQ1Dhz9IunhhbGuOtBz5BYI2Rxgc7YsuF7ouYUtMTnIvCLZUfBPmuGwTwN36LigsUnxWAScJNL+1a/sWLjHAiIkdT0oMesdQJflR4nGO8UtXsNfWBuRH5TJ2HTmtlkUaBrX47LN8Tnl1PhFMHRXB+TkcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 05:44:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 05:44:45 +0000
Message-ID: <09b5c5c6-ddc7-4dbe-9cb9-b82d386e1138@intel.com>
Date: Mon, 13 Oct 2025 11:14:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Sk Anirban
 <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com> <694610a1-6735-4875-978f-c626e9300050@intel.com>
 <94d97911-037c-4d9a-a3e4-9b631b30b9b8@intel.com> <aOlnRjVqIxCOV3oM@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aOlnRjVqIxCOV3oM@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: a3935e1d-d08b-4180-ec07-08de0a1b9d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZ1RkxMR0FEUWtrSkNvcEFBWmZJNHJMaG9FWWFiVFFJRWZZYTBFR29RUE9T?=
 =?utf-8?B?Z3NRTjVqQWpHemE5RFp4UzNYMVVrRy9mVGJKYmJxYTFZa3dBVU9taDFxdDdt?=
 =?utf-8?B?Nm5zcE9XcXNvV0NYYVBNUWlTTU1YU1RNMEVwbXBPQ2pmTmIwTWt6NG1VUDRB?=
 =?utf-8?B?RkZFYk1BeThJUldndUphWHNoWGxHYkM0TENqeGJWblN3MEFYejRTdVcxajJR?=
 =?utf-8?B?OFl5WjFuVkVMNk5ZZmN4WHVlUVRMcE1UaGNZSEdsVk53SGRCSVo3YXkrd2xT?=
 =?utf-8?B?TGw4WURwVVlYdTdFUWljUjQ4YkhxL25BS0tjYTc3NlNSNUFEeUtHWWFiNXdq?=
 =?utf-8?B?eGtLWVRJenphNm0zR2NWd0tzQlY0c0hkaFRyNkQvZWhrVW80Uk1jRldBZXJZ?=
 =?utf-8?B?WWtlK2FPZFlIWTNXQ0M1Y25tUXBxdUM2Nmo0NmhiSGdkN3lRbVFPelZHODVJ?=
 =?utf-8?B?Q1hrbklvUWgvcGxaNzBTc05zQnA5YmZJNGNESldaVFA4eXZ5SElwMnY4cHl0?=
 =?utf-8?B?MU5yREVidmsrUWxROVkyU0s2Zm5jOEZYc0ZiT2Qxa2RIMTlUa0hRSFpxZXRB?=
 =?utf-8?B?OTRoV2h4d1ZuSCsyQXNQWkJ3M1RmbSt6dWZLZ2lNSmRBaGRQaWJ5bnBXbUQw?=
 =?utf-8?B?a3R3a1RYWEQrb3J6NFdqZkszR3U2cVZjZWRtYzZnVUdZajdTbU1zMzBCSU9a?=
 =?utf-8?B?K3pRTVgrZVFwdHBYbjFWdXEyZDBzQXZYR29UNk0xUUtDTElISFZWVGJ5TFFw?=
 =?utf-8?B?QTRObEhVZzJqbkdxeXFvUkxZUG92Rk1MdWFab1J6UGlJRmV1ekp2OGR1d0tw?=
 =?utf-8?B?NFBYRXVsZFJMTFdTSVNQUFR4TEZSQ1ovcDlBelpOYjhiZDRLMHRqaW5mbHlt?=
 =?utf-8?B?eS9UTWhaeUJrT09HYThpK2o5bEcxTFkzbUhvRXRVWU5mcmxZZExaM21EekZo?=
 =?utf-8?B?eDA5UDlSTUJnWTJ1OFppNllTMEUxdnpZV3dqLzRjNHNZMjNWTHExYmpUU3ZH?=
 =?utf-8?B?Q0o1NnBBZjZIWG5uVDJzdm5WTS9pTTBOLyswbDJ4UWVma2JiYlRwakM4OEtF?=
 =?utf-8?B?ZmJpbHRQVFRMTk5ESlNIY2JEcVpieVkxUFFOcFIwUGtrcm9OSVp2d1dGNUh4?=
 =?utf-8?B?L3JINVdZQlRtandBUXBTQWViN1pXeGxva0lVOWY0dkM3MWJKd1dUeUQ0Vzh2?=
 =?utf-8?B?dHZkNFhBWmRrN1RDTlFPbGRPdC8yeFFGOEFiR0t6ekFtaVVjaW5tTnhsVi9k?=
 =?utf-8?B?MFpVRXo3TTNleHNObWtaYml6TGNDNWJYZ1FjNXV3UDBMckQyVmhPU0RvaDJG?=
 =?utf-8?B?TGxFQ3NyUHl6bHJPazlpeXJxb0pCeU1XRm5ERkV3dUg0QWpaQUh0RzFUY09r?=
 =?utf-8?B?Q2QxUmVubmE4K2RsZ0U1a3BSRmpIc2FrZlRHeGdEMzc1TTUvNnhqdENPYXVs?=
 =?utf-8?B?akNpSEw1NkJrcDdlZVUrdWdsVzliWlE4WWV0WWY0VW1ZRUtGVnZkV20xUTNF?=
 =?utf-8?B?OVhnWVJpdXJwYktFUkR3WDcyMkJmK09HTnU0VzBFMHRCTlJ5N2dkNnpvcC9O?=
 =?utf-8?B?bXNlMk9uT0hYdmhPNGNnWVVvL05lK1h2SzVtMFh3TFhrQmFTLzNoSkhqNUtS?=
 =?utf-8?B?RVNqdEtKRG5lRFltVWV5elp5MTI3RStwUTV6Sm1rNXhxSERTZERRTGlqVmk1?=
 =?utf-8?B?akhZNk1SSnJGOTc1aUZQMW10MS9XaHRWQzRlVGUxNmx3SHRROFpFTmtnRTVV?=
 =?utf-8?B?Ty9PMEFBdXoraTAzNnpxWWl1RWF3TVo5MXpXaUtlOUh1Q1FTZGUvT1EwMFNV?=
 =?utf-8?B?c2pjTjFEbEhycGtRdFF1bWN1bGtZMy9mRkVQdHllOUJGOUdQMWhtRllGQm0v?=
 =?utf-8?B?Y3ZsVkhxUXJsVHhrWEZPODE4L0ZZek41WDR1b0puc0EvYlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFGSEZlUlNEa2xOc21Yd0taNlZacXEwa2JYWU4zVlRDQUxoS0thN3NJWitw?=
 =?utf-8?B?TUd2S0hrdEFaOGdRMjFBVkYySHYwSXJrQVliems2N0ZUWGY2TFZlTWJIUU5E?=
 =?utf-8?B?alFic1ZkdkNmV241RnhUaGY0eVhOL2lva3MyUEdwVXhXZGo3OHRuMk9XY2d5?=
 =?utf-8?B?S1E2Ui9CYzF4YXVtYWY3OTdjWjV0Wk1xb0cwSzRyc082amg3aW1GNFJLNTlX?=
 =?utf-8?B?dmtZTGVnd1dFRE5VeUxJRVJBQlRnS3k3YkdZeWppNS94bitSTHZGM2ZRQTZj?=
 =?utf-8?B?VEtFUkdMN1QyNDRJeCs2ZkY1UlE1QjN0bzlBOTZMZkV4QXJXWVNqTmdQMjZv?=
 =?utf-8?B?MVV1aWN6UWpDS2tka0FSaitHMHVhUXJxcEVPM1ROajhGOVJ1SnoxRlVZaG9v?=
 =?utf-8?B?OWcyYmROQVc2UndudmdCOXZiYXE2c1VpNE9oOEhGcFlOQmlnOFM3ajdzSEZZ?=
 =?utf-8?B?SHY5b0Nzd09RQ3hEVzZmUXBlLzlYWERJZ2FTN2wzeDczclhraFF2M0tyeHBB?=
 =?utf-8?B?eDVvV21wTHBjWlh2VGJKamNNSm5Sb1BtSGZ0M1Q5TmlKZVJzbEJqZFJOTW9s?=
 =?utf-8?B?cWxzK2VQb1BQZWFjR1l1WFlKZFJhRXFTa2E1UVRueWZuUVZPYTFyVm84cFhR?=
 =?utf-8?B?TlNzNUdidU1VQ25zcW4rbmk1WGx6M28xUmw1NitaeS81bGRYN3d5SVdVN3pP?=
 =?utf-8?B?YndDRG8wTVNCUzgvcEFlSjVUQjY3Z3pZY0haMGJUTmZrYWcrMFJZUlBnTjdT?=
 =?utf-8?B?TmxBZW9tcmw1WEZxMkVRK0hwVng1aitMcTh5UGcyZ1dtZUc4YVROWmk4Zkhj?=
 =?utf-8?B?U3hOSVJHK2duNFNvK1RIalFwREhBM0Q5U0l0WHBMcUZsZU9HTzVaTzRrS2VG?=
 =?utf-8?B?SXNORk13TitoTkg1K3lTS2c0ZHl2YWh3Rmh2OTZtNmg4NGlnZlZBdFgrT0hK?=
 =?utf-8?B?dkV5NDNRL1JaNmRTNkRiamFkWFN4ZDV0ZjVRV0g4Rkt1dFVOV1pqUDhzTDdJ?=
 =?utf-8?B?RkI5MS9YNzc3YWtIZytXS3lWU2FOV1p3TVphZEt2dTV3dXBldWxuMXhTdlpi?=
 =?utf-8?B?TEdXMkVXNzNUbDlqQ1JMZjNMOStCYUVOYkl0OWZNWXBvY1Z1UVZVSHgxYXRM?=
 =?utf-8?B?MTI3TCtmOWxYT2crbXFaeVJ0eGhPNW9Iaks5OEl0V0xkZmN6N2tJc1BnTHpr?=
 =?utf-8?B?TXBiL2pNWTN4ZE0yNUlnWFd0OHc4OHdYWml2dEpUdnNzMW5xT2hySWgzSHhj?=
 =?utf-8?B?WERjZElYTWQyc0pDWEExaXJFWldFWHNpMThUNUpMcVVzWmdhZTdlUUhza2Ex?=
 =?utf-8?B?bERXZUtzaHNDSnpZWnl3alVRUEUzWXlNd0tBU0tHUVJ0ZTYxd0hXM1orODlF?=
 =?utf-8?B?czJFSG9SK3pPRURPUzkvUE9xNGFOTlBwR1UycUJnTXhZaWFaQ2xxR21ka3B1?=
 =?utf-8?B?Vll4RjdUalZFbjhmWStNbFBiNW1KTzZFbWNxbS9PWjNETzNZWUQySDl5TTZ6?=
 =?utf-8?B?eEpOQUtYL1hETkE4TXJnbFRyRkNnTjVIM3lic1BJS2E4alBvOGZ6aGVpV1pE?=
 =?utf-8?B?THRKSlRCMXZ0VUprK3ZGbUhoTUpaK1M2V3RNUFFhRk1LbXY2ZnVFLzFNNEFr?=
 =?utf-8?B?dDZEdlJlbUUzQ2s4WUxsNkF5QnZIUm9rWC9ObUdhRUxvY3h1eXd0UXVOb1Ar?=
 =?utf-8?B?Mk54YXF0SFppaXhxcWlCVlRveTVTNENzYmU2V0prYkxNbEVtR3F5RHBReW5s?=
 =?utf-8?B?bWxvcE95MGVYUVNTY1FDblZpeS9LTFpDOWR0Wk0wMm40T2duRVZIbllNUGZJ?=
 =?utf-8?B?aWcxTnl4N3dHYjdTa1RjOSt5VzNuS0w2UzJaVi9VNUJFODJwcTJ1QXJYTXpp?=
 =?utf-8?B?TlVoQXNDelBIMGZscjc4dHUwTkoyL2twNmZjclhaWFhpNDlQQ0N3ZUFyTEpo?=
 =?utf-8?B?T0p4eURNUHVteStGYk9aMUllYkdZYmhCYkVBTjliLzVRQklYNFMyT0JTbjJj?=
 =?utf-8?B?UFhIZVlLY1JTcUFjRE43WWg4VFFTVGo0NkpZbWJ4ZFErZjgrckpwVzRhZjNx?=
 =?utf-8?B?SXgvVzRBRDRESGFsM0ZDOG1PM0JiUHRnMnlyekFDWkR3QVM5alVzb2tQU1BE?=
 =?utf-8?B?a21wU2FQeFlaRmxMdURySHpVbSs2bXI1RHB1dS9leWJMaG9NYm9Lek5UYVN6?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3935e1d-d08b-4180-ec07-08de0a1b9d44
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 05:44:45.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urUDM4VawzpJLPDUieYE57eUDKEyL6oLdotWapmXIaatk13zuIasnLyg6PaBMnmbZfvaQziVEIEdnamk8sEYjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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


On 11-10-2025 01:36, Rodrigo Vivi wrote:
> On Fri, Oct 10, 2025 at 10:29:10AM +0530, Nilawar, Badal wrote:
>> On 10-10-2025 02:17, Belgaumkar, Vinay wrote:
>>> On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
>>>> On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
>>>>> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call
>>>>> to ensure
>>>>> current RPe values are used when setting
>>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> index 3c0feb50a1e2..ea1ff96bec32 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
>>>>> *pc, u32 freq)
>>>>>         * Our goal is to have the admin choices respected.
>>>>>         */
>>>>>        pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>>>> -                freq < pc->rpe_freq);
>>>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>>>> I believe this is correct... But wondering if we should entirely
>>>> kill the
>>>> pc->rpe_freq ?!
>>>>
>>>> Vinay, thoughts?
>>> Makes sense. No point caching something that can change based on thermal
>>> conditions.
>> Vinay,
>>
>> Consider a scenario where the user increases the minimum frequency,
>> prompting RPE to adjust accordingly. If the user later lowers the minimum
>> frequency which will be below the RPE value, it will result in
>> IGNORE_EFFICIENT_FREQUENCY being set permanently until the minimum frequency
>> is raised again above RPE. Is it valid behavior or am I missing something?
> This is the expected behavior and the reason for the flag.
> Unless I'm misunderstanding your case here.
>
> The thing is that if we don't set this flag, GuC will always oscilate
> between the RPe and Max... If user is manually request a min that
> is lower then RPe, then it wants the range min-max, not rpe-max.

Agree with this, but the e.g. I mentioned below, with that rpe will be 
ignored permanently.
Potentially unintentionally by someone unfamiliar with how rpe works. 
And at some point of time
rpe will be settled near min but will remain ignored.

>
> What I cannot remember by heart is why we cannot just set that as a policy.
> Perhaps it is because if we do set that, we lose power savings.
>
> Also I can't remember why we don't set when user select a min > rpe.
> Perhaps we do that to have a way to unset this without having to
> introduce a separate file?!
>
> But what I can remember is that this patch here needs to pass the
> igt/tests/xe_gt_freq cleanly. That is our API contract for the
> freq management.

Agree this needed to pass igt cleanly. I am not blocking this.

Thanks,
Badal

>
> I hope this is the case and that it was checked.
>
> Thanks,
> Rodrigo.
>
>> e.g.
>>
>>     min  =  100  ign_rpe = OFF
>>     min  =  200, rpe adjusted to 200+-y%, ign_rpe=OFF
>>     min  = 100  which is < rpe , ign_rpe = ON
>>
>> Thanks,
>> Badal
>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>>          return pc_action_set_param(pc,
>>>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> -- 
>>>>> 2.43.0
>>>>>
