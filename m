Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CB0D5B841
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3592E10E63A;
	Mon, 15 Dec 2025 15:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ML5PiGak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73C10E63A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765813833; x=1797349833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CKSRGp13IEvE03ouWepu7FhF4FCgOdoXinebT8RVxP4=;
 b=ML5PiGakMqm0aBu6G4z1SRpe4IGHalN/hcvo6xPmREjQtZI3bxqGne2t
 Ab4ZNc59k1vXlf669kAXqcSeA36QsbQWnl4cTFh51R043DeBLAppeH8W2
 Bb70jGR5i+mqjOret/jnrbxM73OgDQ/ByFh8rhs1a68NlAUaQkyJApZgs
 5TTRnfFUwfd2chDvaPpAIOlGijC57qIe7li0gsE10cbJ2gRYxZPVXsFa8
 BSqgXau5Str4sVry6YkoSmTYl4xQZiAitXaR3NBaKs/eozpG08IU16RlS
 Ve5zfu5LUiHiA2NbeB7wlLj3frxdhPtxrAR6IQnxZz9lBV44EkypyGL13 A==;
X-CSE-ConnectionGUID: YDco8N/hRsmKKA9jAl+OIQ==
X-CSE-MsgGUID: Osv2+KWKRuGFuTfWNCZ2zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67788423"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67788423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:50:33 -0800
X-CSE-ConnectionGUID: NHpkA2MqT3qqUrvm6grJGQ==
X-CSE-MsgGUID: AnqbgRTeS5mfZbgslpHfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202668349"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:50:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:50:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 07:50:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:50:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsukzCNA0wOAzRROunMl8Nvl8LiqiAnLs0NO2gC21t5qAl+700KcWAYagp/zNu59jtuR/J7/HDk2ROgzQBT7v/74UZmJFSqxwxy9wE324ra6iFaNkIkHD1i2P6OIXD7d6rSDKkrEiWyss9p7rNchXUGlcYpD8orwljyqCXBNXfTTkhByja/tp8jBvgI65281FmEmTIhLf7elypOe1U/oKo083YVmqju9NgNryAWiszgQ2AltsKF1Dzl3kX+U3MBTXUWmhaBFi/gWln1nYJmLPhfrqZhhNO82AaB0ohtvdjxMLA1jU+EqB2ZFA66c0bzAzowv5BoIOrY0O4ZD6eapIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETOC9c7VRD2vii6yG3cq9nJE2yAEzTtu5IKxtx+8N40=;
 b=yIg15i6c8NacX7IqrUrk02o8vwBLJpZqbz424QKA6bUvbNHfYvSLcgCP9FWSsxiX7BJL+fuZ/ob72z0rbfertDejAilrtFkB1klWQihgQOxCe/Z76bMiij48iK9lZmqmCtWbccTmYhoXcmJ9Ia8ZQ0zcRnvUacAt1T59Gikph//RvuqiVzao4Vb2rqLyt1j0osmqv9BxBTzlLkRq+tI2CNCh2ZskuvvO2OmPXXmQS7LjpNx2CiBTGYekPT4WTUz9U8XeGNJKmXAno7ZkESdh1OVI1REiE+Lr/F5pEmQK6aRNEwoNb8hyjWLqz4Z3m4ggbD/kTx3IvkT8srlrLIgUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:50:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:50:30 +0000
Message-ID: <856a11ed-7962-45ba-b88b-d24a2f6105e7@intel.com>
Date: Mon, 15 Dec 2025 16:50:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe: Introduce IF_ARGS macro utility
To: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
 <20251215143739.196336-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251215143739.196336-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0130.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: de317ed0-b911-439b-fcc4-08de3bf1acb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODM5NWZMU1k2OCtYMjdRcWp3QnNlSU5KQkpaZ3MxcHJVeU1uaWMxRmRHSWhD?=
 =?utf-8?B?NmxpTE4wbUpMaEpYdzhvMTk3TmsxazMvZHB3T05zV2RQYnRWS3krVDhzc0tj?=
 =?utf-8?B?RmtIb1E5b3ZBanEwVHFLeGZtVmU4ZDQzUkxWYlN3dldMOTlBSWs0TXJva3Uy?=
 =?utf-8?B?WTV2V0hUVFdyVkFuZXltUVB6bmMvTWFuU2tQSVFLY0wvMlV4QWQ1MHFuUGVa?=
 =?utf-8?B?TlM0Zm9RWFpFa1pTdGNQb2MzTEJBYWtLUHhJeVArZmZ6c3hDSi9raXRkU1ZE?=
 =?utf-8?B?RzlJdjdzbm9DcGtBcGhtTTd4dmdZWDVaM1Yzd0NJd3Q4Q1VhN0FDY2RhdTJS?=
 =?utf-8?B?ZHVMNENtbW1XKythc0NlT2pFNE1tOFlrU3gxdjllMzBRTlVpUVBLTERIeDRl?=
 =?utf-8?B?OFJYaUltOW5EVVdlYjZMWlpJdHRvMm9HVjNaSjloTHNic3hsdk83T2ZHb0JL?=
 =?utf-8?B?QmV6THdmRnR1eUdRWjNzN2c3T3RaaU9ZbW16ajltemhsTmh2bmo5NHVlKzlK?=
 =?utf-8?B?T3JiUStyQVowdE9zTGVEZWdaL0VFUCtnWi9PU3FKZjBWNnRHZCt0SE94SFYx?=
 =?utf-8?B?aCtGdUdxclAxWHBIR3AxRTNCMWh3SGVYOFdqR2licm4wSUZVTUYyTkFOWVR6?=
 =?utf-8?B?cXp6MG1vQUdGNkNtbTIyQVB1RDEyMmdCU1ozRW1xSXo1bmlYMlZZdktXTjQz?=
 =?utf-8?B?YjR3bGtnSlduc3hnOFUyRW1RM2JvOXlDRGg4MTY5UzRka1lRM3IwRWY2dVht?=
 =?utf-8?B?YUtTb1RXaXhlbENMRFV2S3orOUFmSGJCUkk3UERIM1hySWRTQkFtdFZ1S2xL?=
 =?utf-8?B?TmdTTEJKL3hUempETDh2UTNSL0I1UC8xR1FjVkN3c0drYmxJc1FMbVpSTjIw?=
 =?utf-8?B?cWNHU292OE1BR1ZvRWloSFB5TjVXNDZWRmlRWnFodWZqZmhpUFhpNVJlS0FP?=
 =?utf-8?B?ZUx3aTJMZGNJa1J1MTlDNE9aakRPWUVwd2ZmRjVCZDBqZkhvYnNBbVNRbWhY?=
 =?utf-8?B?bnRLWFpyeDg4TVEwaHo2ZWdmRHBqSlkyL1pScXdvNURadm5aVWYxWDNaU0p3?=
 =?utf-8?B?SEQrWmpWY01hSW5CRFMyLzYxbDdsMW5PbzF5dTlxWko4M1hLWmo3MTI5c0hx?=
 =?utf-8?B?RHNyRHVsaytjYXdWNzlOdkdOSWQxb1l2dWVXWlRnSVBPUmFnZTN4TXRqbEw0?=
 =?utf-8?B?RmRMZ0d1NS9DZ1hkSkh2cXlseSsxK3RYYzQ2a2JRcjZjU3h2V2ZnWVdWei9S?=
 =?utf-8?B?RkdJRWpRWDRreFJzeEx2V1EwVUpMRDdmays5K25LY2xEQVFRV1h1VkNrTlBK?=
 =?utf-8?B?U3JEN3hoejdmVE1MdTZBT1ZjT2dBTHNtaHRWOWZENER4Y2kzcE9JZStiWmd0?=
 =?utf-8?B?cDNUc1NCNFJTWXFSai9XNmZJd0ttVlN6RlBXNEY0azB0U2lKODkxMVVBRzND?=
 =?utf-8?B?UDI0VXFqSEpxc0xFMXc3cTA3eXNZOUJnMWhobjI0aGFVbzFWMlZ5d0ErSDR1?=
 =?utf-8?B?ZHpJSUJKaHczbk8rWWU3TXZTY2p0cktzYXFTTE9uMzhJdGloSmJTTXU2VG0r?=
 =?utf-8?B?K0pIZjRMV1dhV0JuN3hId2syK2lKM0xEemVITEFDdUpiRS9RdXZwL1FuVkpi?=
 =?utf-8?B?ZzFZZngyV0doeTJwTEV0b2wvcS9CVzVsRlpVbjZvbllrYkFMRnBwdGtkRFRh?=
 =?utf-8?B?NmZkZEladWdaelhUVWRQVW1aZmdzMjBIaFJhUE1xWllhc3I2dUM3bU9BU21k?=
 =?utf-8?B?R2VYcHdac0lSMHlhU210MFJYNkpYKzdsSVFBaklJcUxwYlAxWFdnUlJkTFFI?=
 =?utf-8?B?NHI1Sk1Xa1dJZExYaFlxbGV2UFdydGRhbnI0WDV4VW5Bd0RuVW54UjNKejJj?=
 =?utf-8?B?RU1MSFZrRzZkb1BrOHljUGVjWU1XTmhGVytObjR4dFBNTXlhNVdLNWVnTW9B?=
 =?utf-8?B?aENOV2NSUmliSy9zUHc1YkE2TUIzMDZqUCt1ZkJ4VlVsVzhNeW1NSUptTk9l?=
 =?utf-8?B?V3hGbmRzcG13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnM2NGxKN2RSZi9jTkpyMG1XNlgzVEswaGo5SkRmZGVwMmZuTk1WK3QwRFRD?=
 =?utf-8?B?d2pwYmlmN0JjaTJ4VGpLK1ZSU2JPcnhNZnhTTnc5MnpvUVRYNDNBekQ0eE1P?=
 =?utf-8?B?Z2xmMHdaZnBuczhWaXZEQUZMMWVXWm9XcUdmTzZ6bUVlc1g4THpjWXp1TFBG?=
 =?utf-8?B?TnY3T2VaRG01Z1FCWkszdUxMakpjTitOenZFZ0NBY1FsYk5zU3dzYkdpOXpF?=
 =?utf-8?B?eXJQVk4zRnBvdEJQMDJRN202cDFkQmp4QXI1dFp1dnZGNldUZm9waTZVV1Fy?=
 =?utf-8?B?V1o5NnlOalRCSjJ4WnVhYmpYNURyMXRUZS9ocnBxaXE0eGUxN2RKNXBXVVdw?=
 =?utf-8?B?a0VVU00zWjI1UzJrNXhWSEhjSFFra0JwbHVINVlwbUJ1Qm5IcWZidWZleEQy?=
 =?utf-8?B?bWJ3bG1NTDYvQnpLdlFib3hRdWpGMGpIMWlkemNsR2Vycm1FMHJ0eW5qSEtw?=
 =?utf-8?B?VUkwV2ZTZldORk5Fc0hoNVllTVdTeU13b29CNDN5eENjVWVEczc5OG1VOE5k?=
 =?utf-8?B?bzJvYjJjL1crN1ZkRGxOMGJFNGYwd0VOUGpPRWtBVHo2R0dZZEc4amFONjZ4?=
 =?utf-8?B?K3piWFBJNmdlODFjYS9HTFNtK3hQMjI4N29Pc3VsRWJKdjltWFhuODRud3RC?=
 =?utf-8?B?LzRKUHpaMWZUdXFnN3I1V0VZcUhoeG1PczUwRWtvRmVNcVhUL2hORitJRHJS?=
 =?utf-8?B?VDViaWFtTFo0dW0xbDBvMlJJNGlYWkpnc0IvQmtTc2h1TktTenZzaHRrVVpw?=
 =?utf-8?B?VGVHYnp1eGtnVWx6KzdnalhZVGlPbXNTak1rRzFZRGFBT1g3ZnhYQUhTVlFt?=
 =?utf-8?B?SXU1TVc5RFl6M1EzbXFPRjAvVlBidXRYS1lhTWxEWGcyR2VmWUgxYlA2Snkz?=
 =?utf-8?B?UlRKNk4vUzVpL09DTGtzN09rN1JhemZWNTJXUnduK0N3ZG5jaUVQMFFZL1Y2?=
 =?utf-8?B?LzhRa25xWUhYamkvSnZoRFJRa2xINWY2dVNySUVra0kwWVFiR3BFdEdubjBS?=
 =?utf-8?B?N3E3TTA3Rm5CdVBZbnd1NldzTnpWQklXNVVybVE5b28rZUM1S2RuR0lUSVc0?=
 =?utf-8?B?ajlNdzdXbjZCc1FGeXdmSmRWRXREVVdkR1VLcENnbFdpL2V4WFprdjRNT05k?=
 =?utf-8?B?N3RzdittTEF1MFVmSXh0VzFMeEU1RXZweGcrUVNiejhNdlF0dUo3djRRZW9s?=
 =?utf-8?B?SEFwekxKWFhhTVBIOHM5ZndsOHg4WFJGVFBaaHJFQy9FTGF0Z2FNMVV5ZGxj?=
 =?utf-8?B?TldDblA4M0w1ZDhGLzBnR2lTM0xpbXpsbzlyQXNad2hWdnNOdnB3QTl0b2Uy?=
 =?utf-8?B?eXdSTXdvMlN6bkVNWnFuU3JpWlQ0di9XS2gzNWZ4QTFoZCtISXQzSTh4Zk4v?=
 =?utf-8?B?L0RJNUdmQzBlcWdWTlFDTGh2bFlkVm52b3k2VVNobXZ2cWVGbUpaTjk3VExT?=
 =?utf-8?B?MFl6WlozVGFoaWF3OWZScC9JU2d1SFNuYWdleDJZQzRwY0U3YmlrNTVyeStK?=
 =?utf-8?B?aFUyTVlyVnJHMTJmS3FFRUVJWUErc1VWTGxSWWExT2tJZHVKbTBObWsyQkI2?=
 =?utf-8?B?TmxBam0xVFFENXRUTUlqWlNCMWw5ZFNiUzV2KzFGRUZWdGJqTUFXL1doTnQv?=
 =?utf-8?B?UmJxZ3N3YUZqM1psTXI4VTVIWnNaQ0M1ZUtacnJ5eU9oSndNbVJ6TmU2KzZC?=
 =?utf-8?B?d00vQTJwa0JoZHU5cERySzFHUmRSZVFHR2JSZ2dIZXM0OXJqZGc0YWtJUitC?=
 =?utf-8?B?U1h4QlZMS3h4VTljMzRnYkl6cUZIUU15eWdTR0oxSW5qZi9sV0R3OWxrRVp0?=
 =?utf-8?B?VEx6aG05ekdvclhOM0VPRWIxVUt1RnVhQ3pxQU5BVGRJazUzVEdHTmlaUFpH?=
 =?utf-8?B?NndqVTFDNkF1ZEk5VWp3OHR2RjVBUzI1cmRCN0VmZFYvaGt4MlExWlF6aW9k?=
 =?utf-8?B?QThiV0dja0VmNENJcy9jK0EycDZpTE9tWEpieFVkNDZhdklHc1I5VVB0MEcx?=
 =?utf-8?B?MkttSDdEYTB5c2Q1cXZLK1VBblVRME5YYUZqWHhqdW5Zbi9kcjZmWnpaVWY0?=
 =?utf-8?B?dGVmZ25vOFRZZUF0Z2RmQnhvRU5OWHd1ZlYxYW9NNlhUZktMcVNVQThoN01G?=
 =?utf-8?B?LzhCWTRreWZYZ2MvR0pBZERlWUlnYlN5bDNKcUgrZTJIUVBiK1l4QnN6TVo5?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de317ed0-b911-439b-fcc4-08de3bf1acb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:50:30.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfYq1p6OAigdWRip9p5mtemevyJv3X+hYBPFzOIb+zT0Ysx6/TOR1/nX3Ex9Hl6UC9e8XvG4GcM2Z9ysH2+HBR198zajwd8/B7RFLbpWLWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
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



On 12/15/2025 3:37 PM, Michal Wajdeczko wrote:
> We want to extend our macro-based KLV list definitions with new
> information about the version from which given KLV is supported.
> Add utility IF_ARGS macro that can be used in code generators to
> emit different code based on the presence of additional arguments.
> 
> Introduce macro itself and extend our kunit tests to cover it.
> We will use this macro in next patch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
> v2: fix typo
> ---
>  drivers/gpu/drm/xe/tests/xe_args_test.c | 53 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_args.h            | 18 +++++++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
> index f3fb23aa5d2e..d11ea610f67a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_args_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
> @@ -78,6 +78,24 @@ static void pick_arg_example(struct kunit *test)
>  #undef buz
>  }
>  
> +static void if_args_example(struct kunit *test)
> +{
> +	enum { Z = 1, Q };
> +
> +#define foo	X, Y
> +#define bar	IF_ARGS(Z, Q, foo)
> +#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
> +
> +	KUNIT_EXPECT_EQ(test, bar, Z);
> +	KUNIT_EXPECT_EQ(test, buz, Q);
> +	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
> +	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
> +
> +#undef foo
> +#undef bar
> +#undef buz
> +}
> +
>  static void sep_comma_example(struct kunit *test)
>  {
>  #define foo(f)	f(X) f(Y) f(Z) f(Q)
> @@ -198,6 +216,39 @@ static void last_arg_test(struct kunit *test)
>  	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
>  }
>  
> +static void if_args_test(struct kunit *test)
> +{
> +	bool with_args = true;
> +	bool no_args = false;
> +	enum { X = 100 };
> +
> +	KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
> +	KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
> +
> +	KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
> +	KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
> +
> +	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
> +	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(no, no, NO_ARGS)), "no");
> +
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), X);
> +	KUNIT_EXPECT_EQ(test,
> +			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), -1);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			CALL_ARGS(COUNT_ARGS,
> +				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), 4);
> +	KUNIT_EXPECT_EQ(test,
> +			CALL_ARGS(COUNT_ARGS,
> +				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), 12);
> +}
> +
>  static struct kunit_case args_tests[] = {
>  	KUNIT_CASE(count_args_test),
>  	KUNIT_CASE(call_args_example),
> @@ -209,6 +260,8 @@ static struct kunit_case args_tests[] = {
>  	KUNIT_CASE(last_arg_example),
>  	KUNIT_CASE(last_arg_test),
>  	KUNIT_CASE(pick_arg_example),
> +	KUNIT_CASE(if_args_example),
> +	KUNIT_CASE(if_args_test),
>  	KUNIT_CASE(sep_comma_example),
>  	{}
>  };
> diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
> index 4dbc7e53c624..657203852036 100644
> --- a/drivers/gpu/drm/xe/xe_args.h
> +++ b/drivers/gpu/drm/xe/xe_args.h
> @@ -121,6 +121,24 @@
>  #define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
>  #define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
>  
> +/**
> + * IF_ARGS() - Make selection based on optional argument list.
> + * @then: token to return if arguments are present
> + * @else: token to return if arguments are empty
> + * @...: arguments to check (optional)
> + *
> + * This macro allows to select a token based on the presence of the argument list.
> + *
> + * Example:
> + *
> + *	#define foo	X, Y
> + *	#define bar	IF_ARGS(Z, Q, foo)
> + *	#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
> + *
> + *	With above definitions bar expands to Z while buz expands to Q.
> + */
> +#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)

for the record,

gcc supports __VA_OPT__ from version 8 (while min requirement for kernel is 8.1)
and clang supports __VA_OPT__ from version 12 (min requirement is 15.0.0)

[1] https://docs.kernel.org/process/changes.html
[2] https://gcc.gnu.org/projects/c-status.html
[3] https://clang.llvm.org/c_status.html

+ maintainers

> +
>  /**
>   * ARGS_SEP_COMMA - Definition of a comma character.
>   *

