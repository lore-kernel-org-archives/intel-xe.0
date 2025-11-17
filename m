Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123BCEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663E10E051;
	Mon, 17 Nov 2025 22:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJmo9qzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EB210E051
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417990; x=1794953990;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QLmZ3zL+OccjUkOuODYcRyptIlgFKmV9favDYm33X/g=;
 b=lJmo9qzUOvy1+KIzW8ImgSY644zajoUcjNi4hBXTeEFaPTCEnn7Ew2mS
 r3X1F2QcmQM74bWeNh14/miFjcKQMGw3OKhiglh/UjyI8111imR8iV8zI
 MfTo5Y5/NK5LFLainI9bM7UV+zcJ5MuFYf7Qyugv/QWVrsSvuyFdOjaF7
 2IzMSxGmYyPycwORgO0bD2+jUFbrC9mMd268KfLjpsdqPVt0MIXoYybRy
 sm9To/Mru5htMyLJtI6/1ihruG+ZG2wIDeqGrYWJChphOW1veoK5J1H64
 Ts9tDfp91bYHlZxcd4vJ3KPN9Ohzh5xXMa013/rcctf3Zc/SeCkqKVorX g==;
X-CSE-ConnectionGUID: 8PeLu9RJQRarNX71Afrdqg==
X-CSE-MsgGUID: GHlIlft1SCSsRGKidGjj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76782196"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="76782196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:19:50 -0800
X-CSE-ConnectionGUID: ZFI7uS7cQZi3G1sMDqSHmw==
X-CSE-MsgGUID: w/xKoL44RVSCPAktF11pLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190595580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:19:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:19:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:19:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:19:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFNaCrQQN3XpL9w2coK9lHrJV5Bjb8UB4946nandmhfIuBSxxdeEj89JEpvkaiynzwiKXUemyy1zT4tUPox+uR2aAshXPG3jMSEH+kPzetHvhh2XzAeUNQg4xmTgyHOoD9Jedynz/uA/6zZjF27vPs3N0CfHv0nyFyWH1qyN/Gu9DIG7/4nDORPBx/Qzr7/XmLA+ZOH6yYTaDnlwZyf0x3n450AlZrakbttyKY09Ly0VtoMLxvMFiFdUnh3G0iFqBBnlYHbn9L2Zgl/EqZ1H71gdcwhRwfRefbscbwlRKOdB6PdoVpUV8ixoHbr2IynkkUJbWr8of+SepX0auVGymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXUDkbjcZNmKZDjuUZaadz607No1VvGJPBHd7Lbhf34=;
 b=tqi4KuY8I4F7lZbLOCn1V86brdgBflT1WBEvgRyk3tMxicMqP3175QEMiWF8YPBAdIXmPoRkQYdpbJasZzolcpUiXlsExLj2dQ6mH4FsCPQOGNTYkB3SxwNy1vQmP9uj73lKKUPYbhm4DQmN9yuTpKTB2VqBZQUA525hNIj2lcYW5t487I5u6dJhqWVou2sNQVy6X1pNiDTMaRU+yl5aCkhIgvHyx0sw/GxlTuQqbYkIk+jQ7dN7s6Oe6hSzhp4bO2oL8cS8nIZ6jFKqfmrTI2dFje+75A+pbtB2aZbPwjs78xr1ukyBTtCsOzudzaY6hxgvyCgx5Zu0gJRFBjbt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:19:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:19:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-43-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-43-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 14/27] drm/xe: Return forcewake reference type from
 force_wake_get_any_engine()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:19:37 -0300
Message-ID: <176341797751.5989.17001525167474731829@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ca46ad-273a-4180-28bd-08de262767be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDQ0QWxERWE5cmlobjU2WmN3V3AwRnBsK3QwL1dsdTdLRUtuNTgwcTMvSGwv?=
 =?utf-8?B?Q2JRaFRYWDk3cjl2ZjArVnlkbU1HV00zMWhwaWFOaDlKTWduandSMmpZNm9B?=
 =?utf-8?B?K0drbkpLdVpmQ25rRFRyMWwzelJUQ0Y4Y1VveVVZOWtjRGpEOHRjTy9Hb2Jy?=
 =?utf-8?B?bGJxSS9XZTVSTUVZVk45N1NXT1dRdzZmc29jRk1VS2hIWThZSW5kSlRZUm11?=
 =?utf-8?B?ZHpZRzNZVnNrNDdBK0d1Q1dPeE14RThTWW14SGJCM2FqaXZyTGFDTGZtV2hv?=
 =?utf-8?B?ZERzRUZ6Y09XK1VoeEx1WWo3UGNSM0ZzZzlpa2tQdkRYekdZUlZYUC84OVJB?=
 =?utf-8?B?QWVGeFdGVUM0NWVQQ28rUW9MU0xXaU8rT2ZmL0dHTFhOZDBSaXdtSlorUWhB?=
 =?utf-8?B?TUtqN1NMTmlPZkkyZTJ2MEJwa3ZxbUQ2Lzk5cHF2Rkd2N3pqUEhBZW9FZkNy?=
 =?utf-8?B?YmZSL0gvZzJUYU1oQVRKV1J4azV5dWNIYU80elhDcmRxMUU5YkJXOU5GcmYy?=
 =?utf-8?B?eDcxdEo1d01VV2dzZDQ3VmY4NkF0Vks1S3lRRERuVmhBNGk2UGxMWU92WGdN?=
 =?utf-8?B?VlRoUTluZDJYQ2NoMWhvemcwcmloaGhKN0REd3YrRmZiQlZEMmJDYVRlcDUw?=
 =?utf-8?B?SVBkc2ZzUlpxTUFzYjFoMHAwNUN6VEpnVUVZTStuZUNhQXpsOXk5dU1iVm93?=
 =?utf-8?B?azdva2czYUQvVXpiNHhXYnR4a0tmMHduZ205VWVrWHV0dWIxd1JTckpFaEhz?=
 =?utf-8?B?RVQySFdmeGd0TEZjV1JlMDdpdUJNTXRqRkpEd05JdFdjbFBSQXZpOEVZOVVU?=
 =?utf-8?B?T3ZrQllWWEVyVlpMcStSK1J3bU9IWHhHdGJEMC9wMnFyV3UxdmtzMjNJTStN?=
 =?utf-8?B?SS9VVEZabUY5RkRYR2gwWGxRZDgyUzdSODhlSk9XZjNTdUxBM2pTbTJkN2hY?=
 =?utf-8?B?MlprTHRsR3dKTFpWRHRZVWdVbHdyenp5QkE5VktieGd2L3RJOGRXU09CWWdo?=
 =?utf-8?B?ZEZaMi9CZFUvaGFQOWRsNG8ycmpQYVdML1dZM0xkQk9KYXc5ZzU5YnUwb3JI?=
 =?utf-8?B?ZllZZjR3cWRveDMrK2toS0hHajZ1Tmx4M0lMNXlLd3VBYnhyS2tRSndzRGV4?=
 =?utf-8?B?QUxDbXBkVStuVTNWRjZ1SHc4U0lsOENIOFhQU3hRY3dWK2pFTEJrMmxlYkpm?=
 =?utf-8?B?YktIZ1hMclJQaXRzUktCZWFLLzZvbHo3dXlFVDBTYlNBcmVUMWI2L0x3SXdB?=
 =?utf-8?B?aWp6aEdZRnoxSG1xSkFDSm9zNGxtcmNmaGZjMlQzeFpSdTVZWGE5d1NiRlpE?=
 =?utf-8?B?c2pGR0cwaVE1OUZDZVowV3RtbU5ORVR2YTVxRXlvT1Q0MElHbTJKdmpEK0Zq?=
 =?utf-8?B?VWpmRFp1aGFneVpZcTZrcFAxWlZ4RkFoNzNUT0M2Y3FNU2lKWDZyMzl0L1Fx?=
 =?utf-8?B?a0ZDYXVZWDRuZjF2N3NNOWp2Q0o5SkR4U2NrQm9CSUtLQUNGS3VyS1lDdFJD?=
 =?utf-8?B?L2w5UmVuWWg4VWx3a1RhdUxVeEFtaGNlWFdvV1hpdXBTaWsxNGtUT2Z1K3NF?=
 =?utf-8?B?U0lHaFhacUFQVHY3VDFIMHlNdWNCV3RPdDhXVGhIVUlpV2x0bjlEd2lFNGsx?=
 =?utf-8?B?RUVia04yeDdGRThQb0JwazZDZG9pV3J2RG5nSFVDVTJFZWJPQ0FhUDRUYnF1?=
 =?utf-8?B?UUtNRTNkMnU0ODhQM1pqVmZpeGxsYVJ3VlY3a1pXWXhMVWlkNUpKY2dKWXEx?=
 =?utf-8?B?S2hJQUhvZ0Q2enBYZlU4ZnVGK0kvM1NqU3J0SUQzb0pEZnF0WnF3N2FncDFt?=
 =?utf-8?B?S3dFQ05RdXhObzNCZkRqdUN2QnZLTHl0anA3SUZOZ3licnBzSXlXZmE4R2tH?=
 =?utf-8?B?QnNsY01lQ3p2UzQ1Q2NlUllOak5BbUFOaUkwMElmSWJSbi92YmYxWDZnY0ps?=
 =?utf-8?Q?QaCw9cNTXCYwmsocKbDyz7fG5Ugc1arD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnN6bTYwejRqRXcxNHQyQUVEMlRhRUZFdVUvaXhaVXFFVlJOKzBCVFJCNWZI?=
 =?utf-8?B?ZFFYNVlnQTB1RGtqdDdneHEzOWRzaGlqc2lsbnh3YUkwMTN6c2RmR0VoVXZZ?=
 =?utf-8?B?dThCTWdtZkJ0cUFjNXlJS2pTNVpBU094WER3c2RmOUNJUC9VOHh2Q2NDMlJ3?=
 =?utf-8?B?WGc0MGlFdHBoMDlEcmZzckp0QTB4N2ZzNy8xZFhOQjVRQkpESTg3cEcwQVIx?=
 =?utf-8?B?VDFCalJ2czNvT1o3QjllZmhoUUZjcm8vZWtqdmQ1SUdYazVqNHA4aktBTklj?=
 =?utf-8?B?aGlLdlpCalpGcW5kamFnNTlVRzBGdFdGdnJEWU0ra1QrUGVmdGR1U0NoVW9G?=
 =?utf-8?B?VVpZbitCUGtyd3h3VWN5K25KOHgzZk52WldaZ0pUbmh0MjFIUXZYTUdmYWdh?=
 =?utf-8?B?M25FZkZxNm1QaGU5Q2lQMzltNG8ySlV1YTY0MUx3bmRiMFUwQVVadTFlcUZQ?=
 =?utf-8?B?ZUtSS2NmWmljaE1xZXRPOHY4NDZ2WDJkbjNNT2hWVkJyQmY3Y2x3TGlnc0gx?=
 =?utf-8?B?MmNDS3labys3ZDlOdzR5RlpFUEpXQzNNZ1JrUzRtWDNYWmtIU0t5ZFJzRVdX?=
 =?utf-8?B?Q1RuUjh5NEsyZ2dNQnJoRlVOTW1UTXRKR00yaDJQNEZ3N0xOOVdpcWVUTHQ1?=
 =?utf-8?B?dEwyLzdKVWRWQzEyM1RTNW1RMU8vVC9zc20rSnlsak5lMG9aUGRYRWtWRXpL?=
 =?utf-8?B?T0Jwb3p2SVBDK0VyV1VmRldCWFE1WUVrVFB5ZXRmdlJBKzdiQ0FqMFhVcURl?=
 =?utf-8?B?MVRaWTRTcEZ3ZGF0VmtBWDJNQjY0RzhkTTM5L3Z0bzl5cm9TMGc5OEY4ZlFC?=
 =?utf-8?B?Z1NEQThtN2pxaDBVa05ZSU9ReEFxenFXV3dJU25CcjkvOStGclNrdVpuNXBK?=
 =?utf-8?B?NWw3a01GT20yYUVBdDZxcGxVdkhOdE9YenArL3NzTWNXVDFxckJtMHRaOGN2?=
 =?utf-8?B?aHVpYXlEVTlEajhNRVF6cFB2MUpiejdpTlloQnNVbXNnK25UYWdkeVZDRDdo?=
 =?utf-8?B?SklCdFJLWkllNTNTVDRVa3EwRjhCTkRhbG16TnVFQXRxZGVWYWh5QUt4WGNT?=
 =?utf-8?B?azFoaHdjd2xZUkZFZUN2NEdneVZJSTFHbWxIVHVnbVJvdTlnTzlUZll2WTdj?=
 =?utf-8?B?VzRuRXcxeW9Pa255eFhsODdiNzVDcDFTL3J2ODc5TzVkNi9XRE5UNmpTb1NB?=
 =?utf-8?B?Vm03SU5SUEg4emlHbnNnK2g1K3dSaDVtSnNFbTI1OW05SHhTTHRCd0svZzNx?=
 =?utf-8?B?UHN6R01lcFBXb0xLNVMxVDFuSGpvVGVhWDBrc05DL2ZNS0pITWNDbUF2WjA4?=
 =?utf-8?B?UElKWXYyZVBHbzJ1TExHYnNFSm93UWV6Q0txVytZS0hHV28wbERoWTRGclEw?=
 =?utf-8?B?c3k4RkVheFJHMEVkM2lmTWY3OW9OUnJXY3JuRUs3d3lDRlVKaXpmV29oM1Nz?=
 =?utf-8?B?K0tXZEIyMDgrVXEyZnVEejNnNzY0ODM5TDJOUnkzaExiOHlkUEJzWExJaGxX?=
 =?utf-8?B?Tnh1ZU1NZVROdVplb1ZyQS9xR3ZlT09uVHVxZ1gza2lzNXJMQ0VRTndpOGM1?=
 =?utf-8?B?NkdFQW5aWnU0ZUFSZVdkK2FicEVzZU4wSkhlOG5WZ1FWRGZmaGZQL0k5dEp2?=
 =?utf-8?B?YmpqalJ3SkNkRVhpSGhaeTZBWmZiNGhnKzRXNUc3V0ZrL1dhOXNDZm1YTU5N?=
 =?utf-8?B?SG1NTWNXTXpxZEd2NU9lMTZlbDg0cFA4Y0ZVR3N1UXJOcC9URmkrck1zOWNu?=
 =?utf-8?B?RVFlbXVSdDdRTmE2Ylp3V2VVdm5IRDkvT01pUVlmVkJWMzFnVEEvczdHYm1K?=
 =?utf-8?B?R29QcGxMS2ZycUJtREoxYnh5YXRDMm5lQW8vVi9BM1pKdC9hdThpNDVweUcv?=
 =?utf-8?B?RDdCWDgwRmxwRGZubzFrODZOUkFzMUZwZU5VV0hZMHFuR0pFbndjN0l5UkhM?=
 =?utf-8?B?Y0lOdW80VnRhTk5RclZZbUhTeGZ5VDlrSlRQZU95T2QrRVo4M3R1eWNpR1Ri?=
 =?utf-8?B?U2NxV2gvcnNPYjMxZG9ZQ1lEa2R4bzZoN25VeXNvYUk3a2pwc1VKYjNaK2xB?=
 =?utf-8?B?aVFXd1orU0VmbW03bXBNNGFoK3Mvcmk4R0lFYWR6V0N5OENJckkrMTNBSnRo?=
 =?utf-8?B?dDFPTWltR1dnR2RJMkUyQmkyRkEzMlFqWWc3RzlBbTE0alRNb3J1N3ZvN1hh?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ca46ad-273a-4180-28bd-08de262767be
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:19:42.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgYqBRHF3mv0re16bILPG/+Pa7JTZl3C3p/stRfEwW9ugvHVk0CZ5AKJoWko2Lv28qtCNvWtSpg9k9C3WUoo9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

Quoting Matt Roper (2025-11-14 18:43:50-03:00)
>Adjust the signature of force_wake_get_any_engine() such that it returns
>a 'struct xe_force_wake_ref' rather than a boolean success/failure.
>Failure cases are now recognized by inspecting the hardware engine
>returned by reference; a NULL hwe indicates that no engine's forcewake
>could be obtained.
>
>These changes will make it cleaner and easier to incorporate scope-based
>cleanup in force_wake_get_any_engine()'s caller in a future patch.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_drm_client.c | 38 +++++++++++++++---------------
> 1 file changed, 19 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_dr=
m_client.c
>index f931ff9b1ec0..78551832723b 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -285,32 +285,31 @@ static struct xe_hw_engine *any_engine(struct xe_dev=
ice *xe)
>         return NULL;
> }
>=20
>-static bool force_wake_get_any_engine(struct xe_device *xe,
>-                                      struct xe_hw_engine **phwe,
>-                                      unsigned int *pfw_ref)
>+/*
>+ * Pick any engine and grab its forcewake.  On error phwe will be NULL an=
d
>+ * the returned forcewake reference will be invalid.  Callers should chec=
k
>+ * phwe against NULL.
>+ */
>+static struct xe_force_wake_ref force_wake_get_any_engine(struct xe_devic=
e *xe,
>+                                                          struct xe_hw_en=
gine **phwe)
> {
>         enum xe_force_wake_domains domain;
>-        unsigned int fw_ref;
>+        struct xe_force_wake_ref fw_ref =3D {};
>         struct xe_hw_engine *hwe;
>-        struct xe_force_wake *fw;
>+
>+        *phwe =3D NULL;
>=20
>         hwe =3D any_engine(xe);
>         if (!hwe)
>-                return false;
>+                return fw_ref;        /* will be invalid */
>=20
>         domain =3D xe_hw_engine_to_fw_domain(hwe);
>-        fw =3D gt_to_fw(hwe->gt);
>=20
>-        fw_ref =3D xe_force_wake_get(fw, domain);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>-                xe_force_wake_put(fw, fw_ref);
>-                return false;
>-        }
>+        fw_ref =3D xe_force_wake_constructor(gt_to_fw(hwe->gt), domain);
>+        if (xe_force_wake_ref_has_domain(fw_ref.domains, domain))
>+                *phwe =3D hwe;        /* valid forcewake */
>=20
>-        *phwe =3D hwe;
>-        *pfw_ref =3D fw_ref;
>-
>-        return true;
>+        return fw_ref;
> }
>=20
> static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>@@ -322,7 +321,7 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>         struct xe_hw_engine *hwe;
>         struct xe_exec_queue *q;
>         u64 gpu_timestamp;
>-        unsigned int fw_ref;
>+        struct xe_force_wake_ref fw_ref;
>=20
>         /*
>          * RING_TIMESTAMP registers are inaccessible in VF mode.
>@@ -340,7 +339,8 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>                        !atomic_read(&xef->exec_queue.pending_removal));
>=20
>         xe_pm_runtime_get(xe);
>-        if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
>+        fw_ref =3D force_wake_get_any_engine(xe, &hwe);
>+        if (!hwe) {
>                 xe_pm_runtime_put(xe);
>                 return;
>         }
>@@ -360,7 +360,7 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>=20
>         gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
>=20
>-        xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>+        xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
>         xe_pm_runtime_put(xe);
>=20
>         for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
>--=20
>2.51.1
>
