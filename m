Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F54FD10F5A
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 14:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2810E012;
	Wed, 26 Nov 2025 14:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8zVs6cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E1710E012
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764167847; x=1795703847;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z8GSzMS4DQXNsVlPR2o2B8allBpPJ0LHSaqvpEpeLSY=;
 b=B8zVs6cL3s/GMmZbmygUWiAIsvHtZ8842mq/CUVZ3n2Yr43jr8Ww0bDP
 wZ0hpKWDyWK2J6RcYawDt/05p0qZLcz/jaRyHiIk9/FMNfpXv5S2v/igs
 7ZxAQu5Q9bzbdKgCkza5tdC4KBO4g30tgu3clEPKzyI2qxYHzzvY/PHWr
 DM4qo4XO5TWWGqB1q2FNBo7ShQA13Ig36Fo3wc9WyOh0d7ldBOnwgndkg
 SE5/c/khQ5u0/RDuIhhJuRujfiVIy1B4nYa3hRGnb9lpeQ+e/65awlzx8
 Xv8Wq6iALqNAJ5k4yxZER5IBrLNyWNtolxH8e4LRPNixxlDdQ2SlcuabA w==;
X-CSE-ConnectionGUID: OE5k77gFQKiWWKyivZeqDg==
X-CSE-MsgGUID: wfb5YJonRRa4/dXxSqA7WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76831051"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="76831051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:37:27 -0800
X-CSE-ConnectionGUID: Ah/J49bdS42dLX+HQ8/fuA==
X-CSE-MsgGUID: fPmbUfiqTbOV+3D+FmkE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192592292"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:37:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:37:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 06:37:26 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayia8yjmM0aklrTK+mX138uStJ4qjLgn/mef7DrizsTemt2S5LitDVKLRKclPgjI8Occvuvbh3SoLc5BdU/9D1cZk1FEJ128ubILlGx22f3SiQWGWJ77htoXi1+JSusdGijJ89U/3ZtC2jNXl0T+QGQ3EFHwUzvFlVC/JVc4qnz8RfIazmMkDI6yjQdrjtigOguGMq5xC4mD0kaOtaMzLQDyn3uF2afG77NpJgWKXIqRuXia6ZG8l3ZNXx7QMBCvxXwSeaH7ljzncXnQykuC9ULAbZdND1ZAyeF+hJlkiEq4gB3xz0JJ5blMyKtAcCuJQCXaC3oohZHcnfhO9T131w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uao3vIya94ecVsLYeqgCAKcRZHqYVZj0rNexWp2dNR0=;
 b=TTX1QcZ/19zzhIA1oh1J2Y8eN1ZBEOfsApDUnRKt8FQvHREY1IPEeEOdsQzyMJecXvNuLf44FLndnTfOgb/yHoOQyWwNLupDtOUtufWfeFDcBP+jdM79BSXKX3rahscAihcBIJQEaC4tVYTyygYN6KqC+hIcsLn3N4E1Q2bnmnTVZc1mdt0jj0sCLTdGsCYu5YiMNI0Z1up+9fle3+1133wwcM+HoSph1Q+spX5rwLNuArbM9u5r9wVZWaLrNoVuNNJqMkLwN9Mjw4RWDGD7RKsrQ3D2vi8JAQd0Eelf1lSPymk84W47Zc/BqeBGpz3nXvZMW9AqUZsIEWGR3T3xCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 14:37:24 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:37:24 +0000
Message-ID: <2ea2e753-4270-42ca-80a5-300437856375@intel.com>
Date: Wed, 26 Nov 2025 15:37:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
 <20251125135422.11244-2-lukasz.laguna@intel.com> <aSXwk4cFBmdYhoo-@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <aSXwk4cFBmdYhoo-@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c2fb38-844a-4d89-5b76-08de2cf95099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTFVazczU2R1T01YaU5LdkVwQ2luMjNQcGtpSzJPY0xNbDBBeFArSTJFbDdN?=
 =?utf-8?B?OGc1bVdMM1pZWUxSTDc4dFVTb2JwcDY3S01DQUc5WEhFUzdnUnQrdmhPWmpJ?=
 =?utf-8?B?aW05TC9CeWUwYWFQdkNDMmdDbnFYSXV6eTRZVmg5K0MvQjVtcjVYcGwzWkJr?=
 =?utf-8?B?RFFaeE9QQW1talQ4WEdnSy9XSHpIaEFRaGVBZDlqZDI5QzBhS0YzYkFFNGR4?=
 =?utf-8?B?ZFQvSmpjaCt6Q1kzNmxZMkcxaDdkMzNKeHY5bU1CMjhleFRtckxuUUUyTWRX?=
 =?utf-8?B?UGloRE85N2t4bno3QXA2eUpDZ2FhcHNSS1RqVDlxUHhFZnVqTWh6d2NrSzBC?=
 =?utf-8?B?eC9KNlIzcTF2V2N6OHBDSmxTMVh0L1JGTWoxNmErV2k2ZmF5a0JnUEZQd3dU?=
 =?utf-8?B?aWtvNGpxcjZCbE54TUw4OGF2VUl4eGJQWHdkcHRIL21WK1BGL2d4ZkpmT0lm?=
 =?utf-8?B?YXE5M0x3STFBUXBVMEc2a0FCYlBYVFBwc05tZzdZdUxKUll5SXFTUDE4aG10?=
 =?utf-8?B?MmFuMXRDZEc3bXJ6WHNXL3VhTWg5ekZEb1RFYXNGTTdQdklOQVV6bW5ObExq?=
 =?utf-8?B?OUlTM0JLWEhrNXc1Rld4NCtYQkdQNHJiN1pYYWtjTjQvd2NiNzBmUUxtWkx0?=
 =?utf-8?B?bXZWWURpcmo0eHRpWXRKTWRWK1YyYmRDTDhkczM0dGE4Z2NnRWZlSW53TUx4?=
 =?utf-8?B?Q2R2T0xGUWFzN28xZjdyQmM0bUdta1E1SUNDTUs3WGxrWC9SYXBCcVdXSlBr?=
 =?utf-8?B?eDBUZHJIOVBjY2UvNTZYU3Y2UkUzcVJvNkZmSTFaZFlPWmRIU09ySFdqY3By?=
 =?utf-8?B?RmZJVUsweUhlaWlQOSt2K2RhN3lSUGNJbzg4eHRPaUxxbVZBa0ZLd0pLR3dY?=
 =?utf-8?B?Q2hUMGxESXJTRGN6aDdvMXQzVE9ZT1hWdHRyWXNwc2hoaDRGVHlvRENDUlZY?=
 =?utf-8?B?aG5VbWF5YjhneGl1Z0pVRFNZdFZpRE42MjJPWjZ4YlRhTnVleWZvNnBvSVQy?=
 =?utf-8?B?cjliSzh3QW5LZzVsSFdjbVJ1dGEzYXlISlEzNUIxZjRVS2RubitFTVFubUk2?=
 =?utf-8?B?QmZKOHRkZ1BpbGEvTmxCNWw5REUwWWZuRDdkeE9veVVJelpNTEdqaHhRMDV1?=
 =?utf-8?B?R2NWMURGVXhMb2U0NWd4UnNVWi9tL2lhU2FwTXczVU1TcGkxaW9ud2FVS0xk?=
 =?utf-8?B?WnRYNzdUaVE0Q2tPMyt3ZU9XMTkxSXFzS0p5YStmZWdjbWR5TzVqandWUmpZ?=
 =?utf-8?B?QVhFTFQzbllXd044bjJPcWx2ZEp4V2IwM05GTmNRT0JDKzRDaU04N1dDU1JM?=
 =?utf-8?B?WjV3UXV1SzFrRnRhRWVrQ0xqVEVoSFFlRnBnNTdXYmViRFBQTCs3U0I3TVZV?=
 =?utf-8?B?VDQ2blJCZ3ZkRmFNbnp4ZDdVRkFBa0JhckVncXR5SHB6YlpYWHV3T0ZOSHAx?=
 =?utf-8?B?cDV2YmxKOUJ4TVRocGZsK2lrTUo2aklObzBnNWswUEVBdmtSa2pUV0NjWmQ5?=
 =?utf-8?B?RmYzYTZDL211cHBnVlpSOExydmZxK1MvOThXUXRoUjdCMjAwQ0l5S0xTTzZD?=
 =?utf-8?B?Sld3bHlYQm4wc2l4VVZSVGhVRjhHSDNubjFkeFp3bWZjdTFxeGd4Q25ka25Q?=
 =?utf-8?B?MWlpWSswREh6Z0p3NmkzTnUxR1FqNlRpbUx6d1FWQlhhVjFuaHJLUXo1YVVV?=
 =?utf-8?B?WG91QWFzdUpDdjZJNDBPbGZRZXdmc3JjZGNTV1kvVlRETkFoUCtrTCtUZEcw?=
 =?utf-8?B?Y285dWV3R3gzR2lHU2RCSnhodmtFQzlwVHlDeU1NeE1FOHd6NE9NSkpZV1E3?=
 =?utf-8?B?Zjh5N1hMSXJQU1hRdm1wN1cvd0NqNm1BMGFMVHcwTEtEUVJwMFBiV29PZWRh?=
 =?utf-8?B?V2xRaUx4Y0licjByNmN1WDc1Njh3aURxVEhZeFN5b2x3VXVjTlBlZ0Nra2p1?=
 =?utf-8?Q?2f0RPtakPsWmYuM3/TrX3LPnBi3KLyJj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3g3dnRFaFBEMndhMzZHYjJQazh2K2FaTllRSVFia0VRTmZUSnVUbmpUMEdS?=
 =?utf-8?B?eFI2Y242Rm9iMzNUZENGbWtEblBxTnNLeEZCOEdpV0xiTHhWRWd0NVozSEpr?=
 =?utf-8?B?VG54SDNXbGR1ejU4dGJjOEVNck5aSTVBYU5iM3ptQ0wwdlpiaFhHUlpsemIy?=
 =?utf-8?B?WW1MRGNxMUdveFhPWmhGR2o3eDRvaXlWOVVTbDY4VWVuVzhEb0R0dmdYUG5y?=
 =?utf-8?B?elpuNFB1QWM1QzlzdVRNMDZtZTBWZE1YWklOKzFkQ0JRSUZjOENxUExFNy9V?=
 =?utf-8?B?Z29WRE5tUTduSVQ0Qm9kSUtyQVBESGhBZWFSRWswczdTVWpqVk1JOWhsOTZ0?=
 =?utf-8?B?MVZ5MEx1U1U4cmlCQlU3RzFTUUVCa29IYUM4NVh6ZnFadUxyQjVGT1djd3B5?=
 =?utf-8?B?YkN6RWlIYTdyc3dkeCtMSndzZEtXNXRJQnloMm9ZRnJWVFNWelJVL0owU1Rr?=
 =?utf-8?B?NEFEdUZjUmE2SVBLRktOcGRyWmVlNnVxQ0cwSWdZUXA3b0hjcDNpL2ZVdSty?=
 =?utf-8?B?aFlGTVNRN3o3TW9FdGFLdHptSmptRHVLaXRTMDJSRFd2cUtWb0dvWjE4Yi8x?=
 =?utf-8?B?MXg0cHpOSUUyZDBVNFREUHRsbUFWakp0OHhUSnRxZlF5T3IvOXB5NmZPRWI4?=
 =?utf-8?B?ZDVzS1VNdk40MS8va0RUNGRZUzhCN0x0emhkRGllUUZBNWJzT201cjdkSklE?=
 =?utf-8?B?aCtBNnZhVVM5Q3pYRTlkOFZaNUwzc0RFcHRUazlBckJFMFpUaWpOR0ZnSXla?=
 =?utf-8?B?dEZPd3pzWXRPa1VJR0FNTlF0b2hGclkrREhseUNBcXB0ZjhXNStIdEwzd2Z3?=
 =?utf-8?B?VloyeDVZWjdHZzdDZGpBcWQrdmx6UFlDa21QckRvVTlBTnZhVDR6YWpyS09s?=
 =?utf-8?B?TUFBR1N4akpRdXM5aGs4alY2cnJEVnZpK0pBdFhzNTJyWlo2aFRPeU1FUCtJ?=
 =?utf-8?B?aE11eW1ZNlJWWllPcmhDczRrKzJWRkNQa0IxMklWakxIOU1QempocmMzRXVY?=
 =?utf-8?B?bmN1RVlhZVJrckxSUG9ydEYyZC9wdHR4cHptRUJyME1TcHA4U0cwMVpBVGZG?=
 =?utf-8?B?Z09CemFHeG11NWgxeFlrNHRLMm5CclNXcERzOGhTblVxVldHSStJSDJNaHRN?=
 =?utf-8?B?UlFlUnpyckJUclN5bjl6bDBQNmkzdkR1aEtsTFpnVDkvYmFIOGVIdXdtampN?=
 =?utf-8?B?T0htWW9PODBWcGZNNU1leExwdWFRRkt4alY4Z1FLVkRxOTVVZHFxK0RvckFz?=
 =?utf-8?B?cEYzK1g5ZEVZeDFoc1lvOTBITDg3MjBHZGYxOW0wS0VyZVMxaVBBLy9IZHVL?=
 =?utf-8?B?K3EzMVJjN1pPeHhPZlpoSm4yVmtndWsxYVhpU09zY2E2RURQOEdZbmlKZ3Zx?=
 =?utf-8?B?YWlqaFM2QWNTRmF6L1ZzMGQ1Z0pCTHd1dGVTeEQrNitzQUlFL3p0UFgvOVdQ?=
 =?utf-8?B?eWdWNzNRWXhMUzlXTmpXb3pLWFhxVi9JUWx5VkRER3VzZUlMSURUNkpTNk9N?=
 =?utf-8?B?SmhRcUNZMnVTZTBZOUpieHNOaHIwcVNRSjZta3AxSk1hYksvSm5SVlpGNjB6?=
 =?utf-8?B?cWMyU3ZMUzh3L2dPd0doNWxxc0laZzBtNVdicGM2RkhsNGh2SlBnQ0NhQm15?=
 =?utf-8?B?czdQVTlWT0pna2w0OHdGa3NNYzIya0h6Q20zRUdmVys0aTNNcjVzdDVERnlr?=
 =?utf-8?B?OVVKZXcrOEV1NDNONG1zeEh0Z1hhNVdYRzJYY3AyMHZPRStpcXd6eHZTUTV2?=
 =?utf-8?B?bnhkOWdzZVhmdTQ4L2NHdlZDZWRoZHpmWVFRZUNNSjFYc0ZOM2Q3anZ3MG9M?=
 =?utf-8?B?cVJKbzZZYzNVdWZSTFlTM201emprV1lheFhLbVg2TzZPZkZRcEZ6dXVnbVZL?=
 =?utf-8?B?K3FvbDVjSEJkOGxvcVF4Y2lWc2hBUkJhVXpPdmJZU1kxWXRQd2dQQVRzZmRx?=
 =?utf-8?B?SkgybjczN01XWjA2ZW44c0xGLzJkdE1PeFAyVHRPRXZOOVZOajNnQWY4NnZj?=
 =?utf-8?B?TXFETVNPVzlwdTYya0Q5OHhCZUZobzZYb20yZU9LTUxKb3FleHRrQWhVU255?=
 =?utf-8?B?QzQ5VU9ZTTFCNkhEbmo5K1BOWFNCcnV4OTZ4S0hBckRmTmFINU1IbTU5RnN6?=
 =?utf-8?Q?QJIdJ08kwqxywHCLUZKZCsDqV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c2fb38-844a-4d89-5b76-08de2cf95099
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:37:24.5264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9BECTv7LBJBurOwCDw4p2LK0CUQDVsUHcuUjC+xZ0ibzTQawQu17TkFFb/OKWNxTImrXAyQ1qaw1mXLTk32NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
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

On 11/25/2025 19:08, Rodrigo Vivi wrote:
> On Tue, Nov 25, 2025 at 02:54:19PM +0100, Lukasz Laguna wrote:
>> Check correctness of the wedged_mode parameter input to ensure only
>> supported values are accepted. Additionally, replace magic numbers with
>> a clearly defined enum.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v10:
>>   - define enum outside of the xe_device struct,
>>   - fix description of module parameter (Michal).
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
>>   drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_device.h       |  2 ++
>>   drivers/gpu/drm/xe/xe_device_types.h | 19 +++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++++-
>>   drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +++--
>>   drivers/gpu/drm/xe/xe_module.c       | 10 +++---
>>   drivers/gpu/drm/xe/xe_module.h       |  2 +-
>>   9 files changed, 88 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 1d5a2a43a9d7..e7cdfb1cda8c 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -265,8 +265,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (wedged_mode > 2)
>> -		return -EINVAL;
>> +	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
>> +	if (ret)
>> +		return ret;
>>   
>>   	if (xe->wedged.mode == wedged_mode)
>>   		return size;
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> Please, while at it, please update its doc block:
>
>   * DOC: Xe Device Wedging

Ah, I missed that it was added. Sure, I'll update it

>
>> index 1197f914ef77..f6216c4f83f9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -760,7 +760,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> -	xe->wedged.mode = xe_modparam.wedged_mode;
>> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
>> +			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
>> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
>> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>>   
>>   	err = xe_device_vram_alloc(xe);
>>   	if (err)
>> @@ -1250,7 +1253,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   
>> -	if (xe->wedged.mode == 0) {
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
>>   		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>>   		return;
>>   	}
>> @@ -1284,3 +1287,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>>   	}
>>   }
>> +
>> +/**
>> + * xe_device_validate_wedged_mode - Check if given mode is supported
>> + * @xe: the &xe_device
>> + * @mode: requested mode to validate
>> + *
>> + * Check whether the provided wedged mode is supported.
>> + *
>> + * Return: 0 if mode is supported, error code otherwise.
>> + */
>> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>> +{
>> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
>> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_wedged_mode_to_string - Convert enum value to string.
>> + * @mode: the &xe_wedged_mode to convert
>> + *
>> + * Returns: wedged mode as a user friendly string.
>> + */
>> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
>> +{
>> +	switch (mode) {
>> +	case XE_WEDGED_MODE_NEVER:
>> +		return "never";
>> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
>> +		return "upon-critical-error";
>> +	case XE_WEDGED_MODE_UPON_ANY_HANG:
>> +		return "upon-any-hang";
>> +	default:
>> +		return "<invalid>";
>> +	}
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 32cc6323b7f6..2fffa88f91b0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -189,6 +189,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>   
>>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>>   void xe_device_declare_wedged(struct xe_device *xe);
>> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
>>   
>>   struct xe_file *xe_file_get(struct xe_file *xef);
>>   void xe_file_put(struct xe_file *xef);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6ce3247d1bd8..81bf4a70b888 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -43,6 +43,23 @@ struct xe_pat_ops;
>>   struct xe_pxp;
>>   struct xe_vram_region;
>>   
>> +/**
>> + * enum xe_wedged_mode - possible wedged modes
>> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
>> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only in
>> + *	case of critical errors. This is the default mode.
>> + * @XE_WEDGED_MODE_UPON_ANY_HANG: Device will be declared wedged on any hang.
>> + *	In this mode, engine resets are disabled.
>> + */
>> +enum xe_wedged_mode {
>> +	XE_WEDGED_MODE_NEVER = 0,
>> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>> +	XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>> +};
>> +
>> +#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>> +#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
>> +
>>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>>   
>>   #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
>> @@ -583,7 +600,7 @@ struct xe_device {
>>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>   		atomic_t flag;
>>   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>> -		int mode;
>> +		enum xe_wedged_mode mode;
>>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>   		unsigned long method;
>>   	} wedged;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index bcb85a1bf26d..466f192b6054 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -451,7 +451,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>>   	ads_blob_write(ads, policies.max_num_work_items,
>>   		       GLOBAL_POLICY_MAX_NUM_WI);
>>   
>> -	if (xe->wedged.mode == 2)
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>>   		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> This mode=2 end-go is not to actually wedge 'upon any hang', but actually
> to avoid resetting the GPU at any hang... like do not try to recover.
>
> I wonder if we should and could make this explicit in the name somehow..
> perhaps upon_any_hang_no_reset_attempt or upon_any_hang_no_recover_attempt...
>
> but no strong opinion in here... just some random thoughts to make this be
> more explicit.

I think it's a good idea. I'll change it to 
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET.

Thanks,
Lukasz

>>   
>>   	ads_blob_write(ads, policies.global_flags, global_flags);
>> @@ -1004,7 +1004,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>>   	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>>   	policies->is_valid = 1;
>> -	if (xe->wedged.mode == 2)
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>>   		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>   	else
>>   		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 0c1fbe97b8bf..45ba0c5308ba 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1889,7 +1889,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>>   		return NULL;
>>   
>>   	xe = gt_to_xe(q->gt);
>> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>> +
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>> +		return NULL;
>> +
>> +	if (!xe_device_uc_enabled(xe))
>> +		return NULL;
>> +
>> +	if (IS_SRIOV_VF(xe))
>>   		return NULL;
>>   
>>   	ss = &xe->devcoredump.snapshot;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 7e0882074a99..4a93a2ff061f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -998,8 +998,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>>   	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>>   				       guc_submit_wedged_fini, guc);
>>   	if (err) {
>> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
>> -			  "Although device is wedged.\n");
>> +		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
>> +			  "Although device is wedged.\n",
>> +			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG));
>>   		return;
>>   	}
>>   
>> @@ -1014,7 +1015,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>>   {
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   
>> -	if (xe->wedged.mode != 2)
>> +	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG)
>>   		return false;
>>   
>>   	if (xe_device_wedged(xe))
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index d08338fc3bc1..cefd00eb7379 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -10,6 +10,7 @@
>>   
>>   #include <drm/drm_module.h>
>>   
>> +#include "xe_device.h"
>>   #include "xe_drv.h"
>>   #include "xe_configfs.h"
>>   #include "xe_hw_fence.h"
>> @@ -29,7 +30,8 @@
>>   #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
>>   #define DEFAULT_MAX_VFS			~0
>>   #define DEFAULT_MAX_VFS_STR		"unlimited"
>> -#define DEFAULT_WEDGED_MODE		1
>> +#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
>> +#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
>>   #define DEFAULT_SVM_NOTIFIER_SIZE	512
>>   
>>   struct xe_modparam xe_modparam = {
>> @@ -88,10 +90,10 @@ MODULE_PARM_DESC(max_vfs,
>>   		 "[default=" DEFAULT_MAX_VFS_STR "])");
>>   #endif
>>   
>> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>>   MODULE_PARM_DESC(wedged_mode,
>> -		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>> -		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>> +		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang "
>> +		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
>>   
>>   static int xe_check_nomodeset(void)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 5a3bfea8b7b4..1c75f38ca393 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -21,7 +21,7 @@ struct xe_modparam {
>>   #ifdef CONFIG_PCI_IOV
>>   	unsigned int max_vfs;
>>   #endif
>> -	int wedged_mode;
>> +	unsigned int wedged_mode;
>>   	u32 svm_notifier_size;
>>   };
>>   
>> -- 
>> 2.40.0
>>
