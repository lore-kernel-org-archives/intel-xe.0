Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63BEE8B361
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 20:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E03B10E236;
	Tue,  3 Feb 2026 20:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7Ug5Fr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C610E236
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770151247; x=1801687247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FaPCEBtn2duWsyVPFPc20kLLQTbg864U7x2XDk1MsnY=;
 b=d7Ug5Fr6WNmdtv6BXu6l1khzS7QOkl/N1HZHZj4rzDTPotAMBaGZ0paS
 eM49HlgR4xQcaFuJRXKWg5ZdFFqyZNrjr3v2k7iIHCHruORpSJvrmWwYv
 ydR5cUOU6k8aJsWCaERx+JXGL5Ao8d+H3yEFwkVR81MPe+5JOWavPY+yb
 6j9YMn6zzEvPytK5bNbNV3pscXEcaWAzMM6SCgoOmuDyRGrHGogmKdDni
 5hTMJXnkdx1sLKKnrxI41cgKWIjtVWs9Ke8AIfd5X2rVazoUgURMtKDWQ
 qiQpPOmbrljTol13OE0PTW2rmALFzfFPETuOOTi4NpK+wAMZ4uXzsfNQd A==;
X-CSE-ConnectionGUID: /1u4zf6LQpe35Zr71p6o8g==
X-CSE-MsgGUID: g7THm8KLTGmLd8Ikx8CdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71312966"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71312966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:40:46 -0800
X-CSE-ConnectionGUID: BrUbcybJTUmVnATP4DGcLA==
X-CSE-MsgGUID: 0C4bruCSRDaxl7KVMoj3wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214111889"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:40:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:40:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 12:40:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APYulaXUye5MJZIQnhgwHB8MqWildbKmB4Pr29460VyT6sS5ja/R3uyg0BlDYUIKBtYd9iC14J5mjprqmyj7NJbazq48aTtofcxlcmOsCovXu7QKCgg0Ii2k09P5Gb3K9wVtBef+6pWXlapjIBPYXnwhGYlVhFSkLdP0AAyuzgG8yDsoGiiwmIPgWwPra820er4PGgBQxpImAIxAz5vlt1AN9l0cbuxhu9E5DpWCT2lqYNBrwnopePf9zW+sg4YF8DUbCJnEwdDJg36jN+L4mSvbpYxsq3cLXkkGL1Dm3/oDPH0Fuw5OOMPEqQKpjggzh28XPLr/eaCwuy+eljAF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaPCEBtn2duWsyVPFPc20kLLQTbg864U7x2XDk1MsnY=;
 b=rkd+AlhkcmHUp5/KwC6JY+BzjN8J5/XGgHHHCMYKDbnI8akslR+OOHWD2VP/M+dCJosLJZn9Z1CoCI+bcYt3Mhm2dljzPuGaEMbJ2jM1W5trS0EmDWJdeJ/80nzlAstXms+TecUPshM3XVOsG+Ic4BYoTp/l6G6RkkvnytyJ+Q7FocXpR/GYs89qPQGpPvX33mTkaH29kMLc1f6/2mLZBlaKtoLzEcYm81/HNCnKk7P/zohACLDtn2VEY1D+mUAczR/R9u1rBFamN3P60ZhDE0pDry8nqub8dQH4XQ+a2ZTmJ73MlhO0gX04IGWjn9eBfWx0oPNhoYkg0zJj52rs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ5PPFBBB839A03.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Tue, 3 Feb
 2026 20:40:43 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 20:40:42 +0000
Message-ID: <963ee5c5-5542-4db3-995a-f909d197ad28@intel.com>
Date: Tue, 3 Feb 2026 12:40:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Test GuC v70.58.1 for LNL, PTL
To: <intel-xe@lists.freedesktop.org>
References: <20260202204923.2767427-2-julia.filipchuk@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260202204923.2767427-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:303:b4::33) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ5PPFBBB839A03:EE_
X-MS-Office365-Filtering-Correlation-Id: 1114c00f-bb77-4482-e27a-08de63647f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzR3SG9JckRKMENvbTdlMEVsdGdxc1kvcDM4ZlJqOGl0VTl5dm9IUXdCcWVi?=
 =?utf-8?B?QmJ4Tm9mMkVqSHdFUENWazBNWkZpYXhWektoNVdIOVRhVmpibjNwN2poMlYy?=
 =?utf-8?B?QmVLYkk3NTlDNVo4NkVydTJvL1djRVZPSXFTbmFoMGhQbjh5M2ExWEFYRkwr?=
 =?utf-8?B?aVFhZU9vaGFvekxmL0RvV2VQN3hsQzdaekVQdXR1ek1nazFPVE9YejlmVFdp?=
 =?utf-8?B?cGkzSGN5c0pKbW9NU0d5TEpIMXBYZHpWaFFvdEhSZlFmb2dXaDRKUktFVjdX?=
 =?utf-8?B?NXNsemIyTlcwazR5SERBVEJZMmh1ZXM4SmhmN2pGNEtlKzJvNlkwbjdGeEIz?=
 =?utf-8?B?Vm1GNHUvand0Q0k4VW1lZ0pVVmNOY2xRRUVyT1QzcS9nUHEwTU16Yi9saUcy?=
 =?utf-8?B?a0NVdjBvVGxBRUtkN0FDK3dudFhEN25aQnZiWjE4TzVZaHBBSE1tYzBKelJG?=
 =?utf-8?B?RjFZanFYNFRMNXBCZWJ0QlByQ3lrSmZZdmxjQ1l4NVZlYy94dURmSUNZVklP?=
 =?utf-8?B?Qmhndjk0TlBFQVgzUDlOSEhkOEx4SnhPQmRRTnREeEdHY2hRci9rNWR6eDcy?=
 =?utf-8?B?dGJqWGI5S1JZdDc1Nkh1Y3pqNUhyR1AySXBiMVQrY2ltaFdKMXVtZEFoU0x2?=
 =?utf-8?B?akxsSVA1MXJRMVF4bUduZVlXbkl6UmJ0dVZNeTlYR0UxMWc3TDZhZ3V0ZlBj?=
 =?utf-8?B?NnFsWjBqYjNjdFhjcm0rOVpkWnlKZmluNTdoUURvUndDK2hHbDVndzF0bXZj?=
 =?utf-8?B?ZjlxTmw3OWpjK1d1RFp1N1g5dGJ1T0VxMVh0Y1lMR3dIbFRoajVzbmtka2NK?=
 =?utf-8?B?cUxTY1Z0RXJMZGJJenAyeVBtQWdFeVYrNTdFSi9JNURHWTR3c1VtUlZhOG9Y?=
 =?utf-8?B?d1hQVlNKNGdjMlBYZ3VJcmcxMGgrRit0d1hYTTVHOGlPaEJhU2dRTDdyS1VD?=
 =?utf-8?B?cU1hZDVRMk1HSFUraWR4cnZ5ZzN2eVViUUNSWjY3a1hSWmthdjVJNEJiQkFP?=
 =?utf-8?B?SCtCaklZcm1ocWM2T1p6aVdpSzhhS3pQODhacnZjNEgzckZ0SWUydHpqc3Rp?=
 =?utf-8?B?TTZsSTZobGQySTZsb05PSHBZK3dVUkREdU0xYkErN1JUOWdIR1NJQkJodjBq?=
 =?utf-8?B?N3JjZ2JBYmM5ZUJhOUExdVBpaVJpQ3ZPVEFZczhVbHlmSm1FcWphMFNVcFY4?=
 =?utf-8?B?OE1XanRpQ29PelQ2TzVmWnVsaVpkZkFSMmNJazZDYUVSc2tIMEJxc0oxQkJW?=
 =?utf-8?B?Tjk2VzJVV0xzdm9rNlBVd2hUdU40N2FKQmZNTUVCakJkNXAvUTYvS1JzaDVh?=
 =?utf-8?B?Z04rUUV5MzByUGtXaDhUakRxV0FaMVBXVlhteU12RkFQeXVDZHgybG1JYWxq?=
 =?utf-8?B?MUJyR3kxRWJwdCs1VFU1RklTajYxdkp6djFpd0hDY1FscjhFa0FtMVdPZFh0?=
 =?utf-8?B?WXptRFd1SENPak5aMElzYVhoemovMUdBK3FTT3I4Sld1V1M5TDU3Um4rSDVV?=
 =?utf-8?B?QUJrRW15aENtVktxZnpYM2JydWUyTCtvMUMvdEFUOWk3VDF4NVN1TXNJOUxz?=
 =?utf-8?B?eHI1NHhkYmJXQ01GaDhYQjVIbW9mS2lSQzhSS3FDU3RncStMY08xMUg5Y1Yz?=
 =?utf-8?B?aUZsYUljai9OaGE1dDBLREdqdnFNSzRGSGdpd3Z0L1pnSmR5VU9wSWhnOXc1?=
 =?utf-8?B?Vk91bVBJaUNFVU82aHZVK2xYNVh5aFZuSEZabnptYlRqeS9iaHV4U3hrUEta?=
 =?utf-8?B?SmhYbGIrMnBnWnU0YitFWWdaM3E0UytoczE1c0FSdFZWZWtkZW9KemxSbm9Q?=
 =?utf-8?B?OXpWdW9TU09wWHVyVmFEYnF5Q094bVQwWmlHUzQ3cU5UTzEzaTZPWTNEcXh0?=
 =?utf-8?B?VC9NVm1ZcDBiSGVYRHBpK0VTZ08vWHVQbFJuSjRxOHZTZ1VFbERtN2VtTjNZ?=
 =?utf-8?B?aHRVenM2Q1RYeVR2NmVHNThUd3pDbDJUaDhvZUpyb2NVZ20zbjZpZkxCZ2Z2?=
 =?utf-8?B?bDNRRXJ4MDZQNU1TY2VHc25tTSttZDlXR3JFQk1kdW5VS2sxV1RmRnZHaW8z?=
 =?utf-8?B?QWJ5TWIxMnZobFd4WjRVM3M2b0RuNXp1cmZDZ3MvUTh6aERzOStzeEE3RWFO?=
 =?utf-8?Q?Gvvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtMQ3YrbUNrTDh4V1FhMjJHbEszaXJLVXI3WWlhVTJnZ2VyL3d0aGxDa1p0?=
 =?utf-8?B?OUp0c2ZpbmlnWEdmUGJRWGNoRUN2S3lWbVBCMTdPUHpabFJubWh6YnpMbGw2?=
 =?utf-8?B?MHhyQmhPMFdBRlEzVjZOKzhUcnJZK1lhSUV2ZHB2Y2dlWmZqYmlrcUdHRXNL?=
 =?utf-8?B?bXlsWVI1TURweC96RFFrK2JuRUVQNys0Qmh2azgzZ1ZiZDAwYjhVUm9UL3FD?=
 =?utf-8?B?cVFmNFBNNHpFV3VaNk00Y0NQWlE3OWsrREU3dzFURUhiZmhreFc1NlNWc01E?=
 =?utf-8?B?d3BiSENENkVoQUhPcTE0UFVDSTlwclFiQXkvMVZoVTVwMTVkYkJvcWxHWllB?=
 =?utf-8?B?clkxSXJ2RTEvRUZMOS8wc0RlRllBNE0wUEVTODZIVkZSaWo1SFFrQy9zVnZx?=
 =?utf-8?B?M0hQdWNoeVJaUUVmKzQ5dElIMzlyZFhNcWRUcFhXb3A4MkVyTTRGa1RYY3Nn?=
 =?utf-8?B?RWQ0bXFCY3NlY1JMRGMvUmJ4ZmY4TGphRndMWElqU2FlMGJMa1FqSjVuVWdr?=
 =?utf-8?B?OTEvbWk3eVlINndOQnRETFhZUnpGUHJtampQbzdTMWVxeGFZb3ZXSGhkTVNz?=
 =?utf-8?B?VzZieEFlNW9NRTkvc3dtN0RXeG5VOG5BVzR6MTJNZnphTHp6NlZtQVVoN0g3?=
 =?utf-8?B?QXV0NzhuNmpzcWg0WGdKYVRITVFJNmNlZFBXWXVtajJlTm03QnNlZFFpR3VZ?=
 =?utf-8?B?TWlmWGZrMzNhM2FBMlJnSUZ0a0RJQkoxekJ5QjQwa2huNTlPQzRpMExLQlha?=
 =?utf-8?B?am5BTk9Oakd1bDFFQVhJbUJVSHowSDBSSEtzS09yaXNMRy9mNllSbXhpUlFP?=
 =?utf-8?B?L1J2cFpjeFZsU2Fmb2pVOFVjUFNLWlUxRUlhNVRxMmVYb295RXlNd3pmNWp1?=
 =?utf-8?B?MWF2enNPZzhBdWthSlRPWWkyK29QVVlCaTNubXFVdFZQUTZNTWhRN0xrYlBP?=
 =?utf-8?B?Umt4dTdqY05oYnZCNmc1VE9hamhWd2I5alNqUDN1d2V4WHVya3dJd3Bydkpu?=
 =?utf-8?B?WERMUjIyVW93LzU0UmJHOTVGQkdocDFybGsxZzVBVld6NUtEdEpOZWl2QXNu?=
 =?utf-8?B?cUx4SEcybzFmL2ZUWkZjWjh5V0Rqci8yUVUyTzZmR1l4K1dFWnBVUjgrNHBk?=
 =?utf-8?B?c0RaeXJabG44WXdtVXMraWt0UkRQRHFSdFlGOTVJQlRaTXVsenk2RmxrVys2?=
 =?utf-8?B?ZGUvWUttMjdlOUwxWUZ5SnpLOEFJTDVNeG5jb1RCaUxocTJPUUVzc0xmQ1pG?=
 =?utf-8?B?S0ZWNk9Pb0U4a25VaEZYZ1BCZ1VnclZtUzV5MXVldDB5OW5LZkpoUzUxZCt6?=
 =?utf-8?B?Q3hLNHhDbnBJYzVSb2FXNys0M0RHQkhhNllrZHpXTndiYXl6YUxvdkw4WkNv?=
 =?utf-8?B?R2NMV2Fnem5BOTVPZHU3d01ZellhSTd5M1A3YlBLY0NPWXhtd0NxMEhBZloy?=
 =?utf-8?B?SVF4cWZ0dSt2VjNkN3BHU010b3o0eDV6MzFLdkkyaklGd0NvUC93UEF5T2tB?=
 =?utf-8?B?b1A0M0FCZk9QSDlSUVRRdS9vMWliUUJuNGowZVNiNVA3eGtOK2g1Z1hLVGdn?=
 =?utf-8?B?aG9la0E0RmVVM0YvTmd6cFQyU3RUMmlIOTR5MitaMi9ld2VvbnhSakNRV3BQ?=
 =?utf-8?B?OUp5ZVI1OXdJdCs2TGxLWTUySy9GeVhFNzIyVDBGMkREaVI2TVI4U3EzR2lR?=
 =?utf-8?B?YkhHVVhDZTZrUndBckNwamkzS2JnN1M2L3QxL0VlL2dzZnRyL053b2l3cVlK?=
 =?utf-8?B?SUpjT2lwSWFNYkJFMi9oa0N5YVJsRy9CcjVaU01EbVlnYmVpVGxoTHc1aTQ1?=
 =?utf-8?B?ZjlibmNLS3V1TDBKbisyZXRMU2xyQVhFdWpQY0xEOTNoTnA3QUlnZUk2QjBH?=
 =?utf-8?B?TlVqSTJiNG1WQURoTE1pcnVZSDZxR0trQkZ1dlRkYmRybDgwU0Zxc2hZNkJJ?=
 =?utf-8?B?UzBtcjRwRi9XTzgzR2JBdVU1Q0ozcENsVmVYbVVHUFQ4VThSeTB6cWVKbVhq?=
 =?utf-8?B?Z0RQelF4MFdmWmtveWZqNE9UeWV3VzFBMlg5UlcxQWFGNWF5T2hXR0xSdU9O?=
 =?utf-8?B?dU9HR3lQQS9PUXVSNUd4M2tHK09OZWpmWitEREFEbFJiamM0M2JVOTdDRWhE?=
 =?utf-8?B?R2FsdHpJNDdhWEtTbkJLY2x6VlEzeW5EdGdrK0lrV3Q1YU9LTWRqSldFL3hw?=
 =?utf-8?B?Qk1YVC93VGZCVXZtOHJ1b2pweVYycnRmQnVNdWpkM3hFS2s2K2dXdjdOMjhQ?=
 =?utf-8?B?UG1BWnk0QnJmb3VRTUxMMkRTUEttMU5IMzNBeENQU0tlRlZxWFlpUDZtYjlo?=
 =?utf-8?B?b3RQOFpTM2pERDN1bUdrSTNGVy9TN0Q1MDVldzY2aFYxZlpNa25VMzROa2RO?=
 =?utf-8?Q?ISgCiweBhKUrl64Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1114c00f-bb77-4482-e27a-08de63647f91
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:40:42.4732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS9d/rDPIALPgAE6fSRr5OoG7r2bu9pRfJpFwbyU1+YvTLlQFB3eHVt+qGNLYg3xXsv0In/wXLIDCU3Ht0aDHJloq/T53r91YAXdPunG54U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBBB839A03
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

Please disregard this patch.
