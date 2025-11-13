Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE3CD6E41
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 12:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CAB10E057;
	Thu, 13 Nov 2025 12:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mH37+gt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8E10E057
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036828; x=1794572828;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Bq+c43UyfLWhpiJ5CrRrwEHspnvHRfahj5PHR7zKbxE=;
 b=mH37+gt+CuxfmrtxO2mxYNtjz4vBUuafmWBpaAp3B9Hhre+LsdjXJVaV
 o2zLSqzESK9zV5+LPwkZxzeSgbL0z8vJpK6f/TckT2YTXmczbHsz96fT3
 +zEzyl5x2hS1imGV6DAHl6nBmvs9Azecs78pvmBwLvA5YFcmu7j+iqrTW
 3y2NoGT8q5jWFaBrIZFS/DJQHQQ4Np+hDjqnY/iRAPhTWkdnEQPUeaMGj
 /2+CBxc6U+VNlywTMvqu31HcUYJw3L7y5auUfKBIrUx1IWik1JGU3VuWF
 c87cqLPbQVkdYhYLeexyzmwiC2F0BSiXfdLCNA+QwrNg9Ha4rHnIiqCq+ A==;
X-CSE-ConnectionGUID: cr+bd5nMSxypRjUU+i3gRw==
X-CSE-MsgGUID: eYK4qfATTNK7ZJ54EjdlkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65272726"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65272726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:27:08 -0800
X-CSE-ConnectionGUID: P67KI15OQmWiITknC+Jq6A==
X-CSE-MsgGUID: Typ9dzniRLW+YskRmWCd+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220142551"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:27:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:27:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 04:27:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:27:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqeUAHbZBepzcBFyfK+p1tYJq5tiHMI7BnUVuVygCK1DKu2DrRZ/i5eWQgQa9EOX5StwWTRlG5bhawtxp3SYI/XrPpci+g7COp2H4mJU/fDoI4Bc40TyomW8CggkQQu1dw1CKY0oOyU+Ep2ELm3f1c2VMNUd7UwDoEF0tDcnnqrawMVCgfWk4cVSxoBPY22WOVR0V+vDytHjy1DKBYH5in9rVzIkVh/OWnQshAaZ1MNyoPiiqJs0098Hd3dW1uCAQYXfLSXkGXTOyIPq7gCOuqkhqJ4q+61kIJd8twefwMTM7QesjPiFre/dYuLSPrnw+V7RmJjkmpuhqEVt3xsdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjV32y+PHrzxQSwB18NgcRLI2n7SXF52khOwbWEUVIo=;
 b=rZm1deaCc9QS7ijuHDMNITeLjprAAzwNR3xlrzEJkH73hPZmHdBZUIl/fczpwZfnJJdmZC+WUS0uRrFeBIQSmnjmlkqpy+U+lwuhLMmUnFfprEQfTneKzZUpEwn1F3CiL2FzAUIZeiDkdjaqiw2uthvAr9MS98FgpL3mrlnFgXDID6XpjCb7an0mL54uubROcVk7LMpfM2dUZblnLAGH54ESy9DJTkQbrVeNfMYBN7kL5iFiNM44zJoDNmWYIjmpWxvWWJ4jn1moey6c4Xl4d+UchUQCz48pSCyw+GX5uDsiDryKHVyDLyxajcBN6MP58jleGXsPOj1s6l1wGIPgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 12:27:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:27:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-38-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-38-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 06/30] drm/xe/gt: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 09:26:47 -0300
Message-ID: <176303680786.3698.2888966281466967422@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: a07f4558-7c8d-4ffa-9704-08de22aff3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1VseSs0SW1BdHVQT29TcGhFTEVsMTU3TUpyR1VCMEpqOUF1eTJDOVp1ZW9R?=
 =?utf-8?B?UEF1Skh2VjVsQ2w3M0hYMnd4Wk0xRDdEd3hjN2hyNmVwMU1ZZVdia3Y5eFV2?=
 =?utf-8?B?eTlTMnMzV0xnVHU4UVNlV21aZDh5b08xSUlsWFBlVDZiQ01xN0FhZlpKcDM5?=
 =?utf-8?B?M1pZMUZaZzcyVGxvWVlzN3U4eGVnNGsyUnJnWFIwK05GSHZ5T1dPTVRhdG5j?=
 =?utf-8?B?dTZsL2hMTWlUcisyR1pXblRoUFRER1p3ZFFBQllCYmlvNk96akQ4c1N3MUFS?=
 =?utf-8?B?YmpVd1I0VlVYaUNEWFB5S0pmSHdjQzc3K1lqQmU3K21KYk94TFVPZjhZRmg3?=
 =?utf-8?B?cFZjOG9oOFFlVFlva1dZOGQ5WDVOZStreFV0SmNveXFYR0psQk1KNnNLdm9y?=
 =?utf-8?B?cUtNZHovYjZmb01LVTdodGo1YVEvWHRneUU1MGduV3I0NTg5Nzk3Qm5KbDlL?=
 =?utf-8?B?TDlCMHlnSzdFbVNyZ1VwaXl3WGo4UFdqdGFHSjdRVzhYQXVLZWYxUEtLQVFx?=
 =?utf-8?B?VkduWVkxTzRVcE50YlJDSmFERXpGNUI4Q0tjdFNHTVgwT09STlFmWjlTaVZs?=
 =?utf-8?B?UTdkMUppRjZ3cEJUOFJSNkt2bkozWjkvOVJIUVg5S0pjSmhudTJMTkRIQlJJ?=
 =?utf-8?B?aDU4V0JvMklsdXdOb2c1aC96Vlc3NmNndWlDajVRZERpMVhXUEhINHA0S2RO?=
 =?utf-8?B?NW5lUmNFMWthY2RNbysrcExWWFF2dEJRY21mNjI5a210L3VTczY3QkFwaWxn?=
 =?utf-8?B?RFNacm5uVmlvaXliK29xbE1rbHd0L213MEJxVWRxcW9EdXpWck11aG1VUW1u?=
 =?utf-8?B?OGgrL3AzZThiQzN6bStGUytNcVkxQ1ZFbG5ZeFZiTmtJaDBiSXh4bVRuY2Zw?=
 =?utf-8?B?Ky9EYVVDQUV6K3d4SUtQMklJRVZ4Rm4yQm1mc1Vja202bC9iSXc0RmZtU3JL?=
 =?utf-8?B?bnpYTXUxM3IvRWRKZlZqbnVzdVZSYWtRM2hTcmo1TjZ3K1ZzTjhGSlN3R0N1?=
 =?utf-8?B?ZUZCVEsvbmpzbkdLZzZ3RnFmcFM5UzEyanFPZEIwSHhhVGZ4Ky9lZ3NscjJH?=
 =?utf-8?B?WEZ6c3FpbUlYTVV0YktsVkdWaDZrRktsRWs4S2ZlaWFxanQ3a09nU1A5Sndy?=
 =?utf-8?B?dDloci81cFArZTRKUGhHSnRkZWo5dVFJSkpMNEV6V3BVQlBDNllKNDUyZ0Qv?=
 =?utf-8?B?TDQ4dGpNcnE0NmZ2SUdOMDZBVjM1cUhYWXY5QUYrUTMyMHl4MnhQR2dDckE5?=
 =?utf-8?B?YVdyVzJpWkRzYTdBeFVHVTI5cWMrcHhxMFR6TGMvZ2o0b29TVURpMCtNOUY2?=
 =?utf-8?B?NUtXYWFjcWZwMWZHZkdJU2p0T09XTUptSlU2dmdrbGxOMkNRWS9TeVFaTnhl?=
 =?utf-8?B?djU1NFA2U3c1NEVaeS9EWjF4d3Zqbkw4T1NwaUsxV2ptUitnbVpBaWxSQ05H?=
 =?utf-8?B?S3Zma09pVmh3bk1pNndyMzZvWkk4OWlMc2gya2FTWE9FZkF1N0xwbWkydjJE?=
 =?utf-8?B?M2I1Q3VsNTJZR240WStYZnRNVzFQZU5mTjVqdkpYNEttRmNsWnY4Y0N6a3la?=
 =?utf-8?B?eXk1U2pRUDN3SXF1dmJFdXFTNWFCZ2xXb1l0eTdHa0o5c2JZanAyaDBkT2p0?=
 =?utf-8?B?UWIvYWxSRzhDWk8reTRmeWpibVRFVG5ZZTFPNWsya0ZJT1llR1Y0Uy9CcFlw?=
 =?utf-8?B?V1N5dGZvaXNIdWw2M2hTaXBzK2dYejNOQVZPRWt1QmJPa3Vib3BPT0xFeUxh?=
 =?utf-8?B?Wi9GYUppY0JDaWNkck9OdlZiQ3lPWU5abC96cEtyRUlDT3dndjZZekhUR1hV?=
 =?utf-8?B?Z1FudStnNFFzeG55VXltQzk1bVBQWFFUM1Npc1hZVDRBbGNpRWh4TEp3cExJ?=
 =?utf-8?B?V3NoL2c1eHd5YkZtZFAxMVB2V013YXRaZktPUnFJU0N6NTNja0E2dm9QdFY3?=
 =?utf-8?Q?rrisLN5kIRpBfMFrVsjc6tATT2np+ftD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlg5Q29CczhnZHNZeXg2MEUvVHZvZ0hYUFZET3d3Rzh4VjJVdGMxWDRFRG1H?=
 =?utf-8?B?TDUvc0lZeE9UdGNJaUIxb1ZZMm4zT0dNNDZraFdtZFZXd1AvWVBsSXFtM09R?=
 =?utf-8?B?SEdUMC9jeHVGU2hONThBNW5lanpXUjZMcit1cU9iUG1vdFRPaW9kYXc0Y1NC?=
 =?utf-8?B?dXNNbGxRY01COUNLdGRSdXREZzd1MjVlQjhzd0MwVkJzRGR2b2JYZFNkc3VN?=
 =?utf-8?B?MURSS2x5TGthZGczQWVMUkpRTXorTkhhSGdSWU93TTJwUkZSYnlJdVpiSmRs?=
 =?utf-8?B?OW5RM29FSm1vSXQySUhJakZjQ1ZSc3V1a1FnZTBuZzgvU05wdTAwRUt4ZVlV?=
 =?utf-8?B?TTljYlViN0U4R1RQQnpCYUhwZlBUQjIxbkFOSTZlTlhXVEhvVmE5bU9ldnFQ?=
 =?utf-8?B?U3I5ZUU4OVJ6Q2J4MnNRT0VTTVNkRXBLMzlJSmVBbXZjUkNCaGl0ZWxndnNG?=
 =?utf-8?B?Rk1QQTVLMmp4Rk1icUhFN0Q0NHhocmREdU5OWXNYQ29EZVBiZUkvZUhldXUx?=
 =?utf-8?B?a3E1cVZPR1VvcFAwMFllcnVtei9EZXlNMk8rdVViYkNNaE9TWmdyUFZEYzJr?=
 =?utf-8?B?bTV6cGY2T0lCRjZmVFVGK25jRFZ6TjMySldpL2R6V2x5VTZ5YTRZTThEbzg4?=
 =?utf-8?B?L2drVGdDOWdJWnYzYUdRai9VSlp2YU8vTlNCWGlONWp3MjY0RU54UWJEQ3dj?=
 =?utf-8?B?bGlHYkFraUhkRmVHSnVoejZ1ZThHS2kxczROcXBPOWMrdDhlL1oxb1lvY3B6?=
 =?utf-8?B?RERYbnkxQUppZW5DSEFMNUlXT01tVG9tUVc1UVBGTE1KT0UvRHhBOHZ0cGxh?=
 =?utf-8?B?SEtqWFhKTHAwRUkyM1FMOGpOb2Q3K2RPSlZBeVdiRGo0c1lRK29sRHErR1I5?=
 =?utf-8?B?VzFIQ3ZQeVRUZ1l5VEhPTWdRMU1tTjZlYUhva3MvYVFLa01DVHNsNyt1dWk3?=
 =?utf-8?B?SUFvZnR3TXI4RXIwRDB5b0h5ekQ1eEppMEtHTlJuQ3VwbzIyYTVSWFRqQity?=
 =?utf-8?B?Q2FzTzUrRlZYKzJQeG1nYThTVy95WHQ2cGNpakxjbDZiYUlPT2ZuNWxZRTRo?=
 =?utf-8?B?VjBrd0Z3NU9uMC96akdoNnk2ZXJzUFFEVHJPUmtSc3VXczg2RithN0JBd0sy?=
 =?utf-8?B?RVFZelA3RFJ3MnBiQjBKZXNLdnA4VTZNWXJlZk91cXozOGE2bG9wVnJLczZi?=
 =?utf-8?B?OFVubmJQM2RYaFB4MFdUR2FLMmc5dSt0N1lnUHQwdGpzemFONW1yZmpJT2R0?=
 =?utf-8?B?dXdpeEgwNHZDTllYUmQ3bm1EdWZJeXA1Q09YVzBmT2ZpamljcU1KZ0lOd0l3?=
 =?utf-8?B?SEw5dTVqK2hGS1FLTnBSaXV0QmZoKzZraEFQck9Qb2Y2UFpsZk5WZStNNFl2?=
 =?utf-8?B?TW5NQ0dKNGxoZUxXdU1Xb3ZudWxGeGVMOC9CWTVwS3FZN3hWSFJBMVo1d1Vz?=
 =?utf-8?B?NEFMUkc0UGxVaGlSLy9ZZHR6Y1d0VVJCQWtYbWdkc2xaZUFhOUVvNHpkSkow?=
 =?utf-8?B?TVVqWFpvYnZkNndKUUdoZ09xVTdzbmhmS2xzNStNclFYK3JLV0Nud2RDYlFw?=
 =?utf-8?B?MkZzY1UvNVdTSElYVlhReVZOa3ExTXZKaDRyQWpZYTdrMTRuTTRRL0hGc0ZF?=
 =?utf-8?B?N0xuKzNqelVaUmxuQ2kreU0zQWhmSExqVUhYbmV2MkxkbEMzSWY1bXRvbGYz?=
 =?utf-8?B?NHFpWkk2b2RQSWRIN2QyQzJ1dkJKeGE3VGhPNlpUY3JMUGtmZmlKWlo3bHRV?=
 =?utf-8?B?N2YzL09PTCt6M3FGQ0NUeGc5SFMxSzJZTlNubWk1YlJUOWtpSXpOcU9kNjVJ?=
 =?utf-8?B?R0pQUEVhZnUyeUh5TXl0aWl2U3FQdm9FWDErZ0ppZ0hJOEVlbnVzVWZ4SzJF?=
 =?utf-8?B?MFU0SjRzRWxDV3hWRFdzOWVSRndSTEpmdWZJbmhLbHhsbGNvWitCMGNyVWFZ?=
 =?utf-8?B?Sm15cGRndlVOR3NPNU9yRHl4NVBOYTkvcW55RGVKQkt1TWhiNVdCN2RYUk5l?=
 =?utf-8?B?V0d5MkhQQmY0bzFKSHlFNGlEY2dUeE54SEVCbWFQRHBuOWtrTmxWZmFhNWdI?=
 =?utf-8?B?cWdOOS9PdWJYUUJ2RkhmOUlCZC9UN1hsanlscjhHQWtaTFFBK0gvQUl5bERa?=
 =?utf-8?B?WUNSUlB0TThCL0dvcWoxM1NJN0pHTCtaejNUU0lhOUphbzZwazlpUjBGTjdE?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a07f4558-7c8d-4ffa-9704-08de22aff3c6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:27:03.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7JdoTjMC35ESAEkHygN98XwFkXmDFtT0NaiJg25eh8mfOrHccKhX2a02cPJdJu6MkbVeVeuniEYuDsN9F9U2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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

Quoting Matt Roper (2025-11-10 20:20:24-03:00)
>Using scope-based cleanup for forcewake and runtime PM allows us to
>reduce or eliminate some of the goto-based error handling and simplify
>several functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I provided some suggestions below.  With or without them,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt.c | 151 ++++++++++++-------------------------
> 1 file changed, 48 insertions(+), 103 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 6d479948bf21..e81674c40e57 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -103,14 +103,13 @@ void xe_gt_sanitize(struct xe_gt *gt)
>=20
> static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         u32 reg;
>=20
>         if (!XE_GT_WA(gt, 16023588340))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return;
>=20
>         if (xe_gt_is_main_type(gt)) {
>@@ -120,12 +119,10 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *=
gt)
>         }
>=20
>         xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         u32 reg;
>=20
>         if (!XE_GT_WA(gt, 16023588340))
>@@ -134,15 +131,13 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt =
*gt)
>         if (xe_gt_is_media_type(gt))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return;
>=20
>         reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>         reg &=3D ~CG_DIS_CNTLBUS;
>         xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> static void gt_reset_worker(struct work_struct *w);
>@@ -389,7 +384,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>=20
> int xe_gt_init_early(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         int err;
>=20
>         if (IS_SRIOV_PF(gt_to_xe(gt))) {
>@@ -436,13 +430,12 @@ int xe_gt_init_early(struct xe_gt *gt)
>         if (err)
>                 return err;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         xe_gt_mcr_init_early(gt);
>         xe_pat_init(gt);
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>=20
>         return 0;
> }
>@@ -460,16 +453,15 @@ static void dump_pat_on_error(struct xe_gt *gt)
>=20
> static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         int err;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         err =3D xe_uc_init(&gt->uc);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         xe_gt_topology_init(gt);
>         xe_gt_mcr_init(gt);
>@@ -478,7 +470,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>         if (xe_gt_is_main_type(gt)) {
>                 err =3D xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>                 if (err)
>-                        goto err_force_wake;
>+                        return err;
>                 if (IS_SRIOV_PF(gt_to_xe(gt)))
>                         xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>         }
>@@ -492,17 +484,17 @@ static int gt_init_with_gt_forcewake(struct xe_gt *g=
t)
>         err =3D xe_hw_engines_init_early(gt);
>         if (err) {
>                 dump_pat_on_error(gt);
>-                goto err_force_wake;
>+                return err;
>         }
>=20
>         err =3D xe_hw_engine_class_sysfs_init(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         /* Initialize CCS mode sysfs after early initialization of HW eng=
ines */
>         err =3D xe_gt_ccs_mode_sysfs_init(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         /*
>          * Stash hardware-reported version.  Since this register does not=
 exist
>@@ -510,25 +502,16 @@ static int gt_init_with_gt_forcewake(struct xe_gt *g=
t)
>          */
>         gt->info.gmdid =3D xe_mmio_read32(&gt->mmio, GMD_ID);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
>-
>-err_force_wake:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>-        return err;
> }
>=20
> static int gt_init_with_all_forcewake(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         int err;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>-                err =3D -ETIMEDOUT;
>-                goto err_force_wake;
>-        }
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L))
>+                return -ETIMEDOUT;
>=20
>         xe_gt_mcr_set_implicit_defaults(gt);
>         xe_wa_process_gt(gt);
>@@ -537,20 +520,20 @@ static int gt_init_with_all_forcewake(struct xe_gt *=
gt)
>=20
>         err =3D xe_gt_clock_init(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         xe_mocs_init(gt);
>         err =3D xe_execlist_init(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         err =3D xe_hw_engines_init(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         err =3D xe_uc_init_post_hwconfig(&gt->uc);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         if (xe_gt_is_main_type(gt)) {
>                 /*
>@@ -561,10 +544,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *g=
t)
>=20
>                         gt->usm.bb_pool =3D xe_sa_bo_manager_init(gt_to_t=
ile(gt),
>                                                                 IS_DGFX(x=
e) ? SZ_1M : SZ_512K, 16);
>-                        if (IS_ERR(gt->usm.bb_pool)) {
>-                                err =3D PTR_ERR(gt->usm.bb_pool);
>-                                goto err_force_wake;
>-                        }
>+                        if (IS_ERR(gt->usm.bb_pool))
>+                                return PTR_ERR(gt->usm.bb_pool);
>                 }
>         }
>=20
>@@ -573,12 +554,12 @@ static int gt_init_with_all_forcewake(struct xe_gt *=
gt)
>=20
>                 err =3D xe_migrate_init(tile->migrate);
>                 if (err)
>-                        goto err_force_wake;
>+                        return err;
>         }
>=20
>         err =3D xe_uc_load_hw(&gt->uc);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         /* Configure default CCS mode of 1 engine with all resources */
>         if (xe_gt_ccs_mode_enabled(gt)) {
>@@ -592,14 +573,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *g=
t)
>         if (IS_SRIOV_PF(gt_to_xe(gt)))
>                 xe_gt_sriov_pf_init_hw(gt);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>         return 0;
>-
>-err_force_wake:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>-        return err;
> }
>=20
> static void xe_gt_fini(void *arg)
>@@ -819,15 +793,17 @@ static int do_gt_restart(struct xe_gt *gt)
> static void gt_reset_worker(struct work_struct *w)
> {
>         struct xe_gt *gt =3D container_of(w, typeof(*gt), reset.worker);
>-        unsigned int fw_ref;
>         int err;
>=20
>+        /* Drop the existing runtime PM reference when exiting this funct=
ion */

I believe the comment above is kind of already implied. I think I would
prefer to keep the previous comment, i.e.:

    /* Pair with get while enqueueing the work in xe_gt_reset_async() */

, which adds info about where the ref came from.  Hmm, maybe that's
implied as well? Not sure...

>+        guard(xe_pm_runtime_release_only)(gt_to_xe(gt));
>+
>         if (xe_device_wedged(gt_to_xe(gt)))
>-                goto err_pm_put;
>+                return;
>=20
>         /* We only support GT resets with GuC submission */
>         if (!xe_device_uc_enabled(gt_to_xe(gt)))
>-                goto err_pm_put;
>+                return;
>=20
>         xe_gt_info(gt, "reset started\n");
>=20
>@@ -838,8 +814,8 @@ static void gt_reset_worker(struct work_struct *w)
>=20
>         xe_gt_sanitize(gt);
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L)) {
>                 err =3D -ETIMEDOUT;
>                 goto err_out;
>         }
>@@ -863,25 +839,16 @@ static void gt_reset_worker(struct work_struct *w)
>         if (err)
>                 goto err_out;
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>-        /* Pair with get while enqueueing the work in xe_gt_reset_async()=
 */
>-        xe_pm_runtime_put(gt_to_xe(gt));
>-
>         xe_gt_info(gt, "reset done\n");
>=20
>         return;
>=20
> err_out:

Aren't we are violating one of the expectations of cleanup.h here? Quoting
below:

     * Lastly, given that the benefit of cleanup helpers is removal of
     * "goto", and that the "goto" statement can jump between scopes, the
     * expectation is that usage of "goto" and cleanup helpers is never
     * mixed in the same function. I.e. for a given routine, convert all
     * resources that need a "goto" cleanup to scope-based cleanup, or
     * convert none of them.

That said, I do believe this is a bit too restrictive. In simple cases,
like this one, I believe the mix is okay.

>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         XE_WARN_ON(xe_uc_start(&gt->uc));
>=20
> err_fail:
>         xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>         xe_device_declare_wedged(gt_to_xe(gt));
>-
>-err_pm_put:
>-        xe_pm_runtime_put(gt_to_xe(gt));
> }
>=20
> void xe_gt_reset_async(struct xe_gt *gt)
>@@ -902,56 +869,42 @@ void xe_gt_reset_async(struct xe_gt *gt)
>=20
> void xe_gt_suspend_prepare(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>-
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>         xe_uc_suspend_prepare(&gt->uc);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> int xe_gt_suspend(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         int err;
>=20
>         xe_gt_dbg(gt, "suspending\n");
>         xe_gt_sanitize(gt);
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-                goto err_msg;
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L)) {
>+                xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOU=
T));

Since we are touching this part, we could add a more specific message
here. Something like "suspend failed due to force wake error: (%pe)\n".

The same suggestion also applies to xe_gt_resume().

>+                return -ETIMEDOUT;
>+        }
>=20
>         err =3D xe_uc_suspend(&gt->uc);
>-        if (err)
>-                goto err_force_wake;
>+        if (err) {
>+                xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>+                return err;
>+        }
>=20
>         xe_gt_idle_disable_pg(gt);
>=20
>         xe_gt_disable_host_l2_vram(gt);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         xe_gt_dbg(gt, "suspended\n");
>=20
>         return 0;
>-
>-err_msg:
>-        err =3D -ETIMEDOUT;
>-err_force_wake:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>-
>-        return err;
> }
>=20
> void xe_gt_shutdown(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>-
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>         do_gt_reset(gt);
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> /**
>@@ -976,32 +929,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>=20
> int xe_gt_resume(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>         int err;
>=20
>         xe_gt_dbg(gt, "resuming\n");
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-                goto err_msg;
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L)) {
>+                xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT=
));
>+                return -ETIMEDOUT;
>+        }
>=20
>         err =3D do_gt_restart(gt);
>         if (err)
>-                goto err_force_wake;
>+                return err;
>=20
>         xe_gt_idle_enable_pg(gt);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         xe_gt_dbg(gt, "resumed\n");
>=20
>         return 0;
>-
>-err_msg:
>-        err =3D -ETIMEDOUT;
>-err_force_wake:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>-
>-        return err;
> }
>=20
> struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>--=20
>2.51.1
>
