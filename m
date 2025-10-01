Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B5FCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 16:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165C610E6F7;
	Wed,  1 Oct 2025 16:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJdsy9Jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1192110E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759337194; x=1790873194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RCurGyk+3LREmw0z9GPXC4sQzl7T53Eu20jBG1aKFQY=;
 b=DJdsy9JbOciE96KpJeZoIxFnzPMXo4ZpU6vjnqRNl9txYfFkOWFFGIwD
 9EK/dQ2x2FOuKdLXwGsRUM9OQiVhK/JGoElwb+2keCqjRBAOcSAvAC4Dq
 pBtALmzqe5LG5fOKcQGn99YNq1RFNoIHQJKct+i0GMYxqyMk8oAOOC0IG
 EmJDkUJiKNLHNjgIfgjQT92NaLjllpuBLU/2HpwEZfeZsCzuT+oS8FTHj
 ir5IMOV3Sy7NvG8DyUfU/mqxKPx2CGNRJB2y6/exvKzbiMVWecdtgePg8
 s4T4luWlck5eqQdC9gEQW70L71aY70IMkH9YPpMimUi61ccQyzBpLnHBq w==;
X-CSE-ConnectionGUID: kDOodsPrT/ehl0iE+qy68Q==
X-CSE-MsgGUID: czKAmKcFRSqL6XJIB7gfIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61655379"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61655379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:46:34 -0700
X-CSE-ConnectionGUID: yBkTYN+IQ/Cmo8eiMiaNSA==
X-CSE-MsgGUID: WM1UkR1mSM68J5ff9soYtQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:46:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:46:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 09:46:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOCOazLiDrruXv7XB5Kg/tV+SJLw4no3os4+HBEyI7csmgH651Z6EnrbopyMpqYxqowUAFElgygo415Bx+0tpDm/cbsadnbvM2WvrENqPy4QslCuHF6kSGfVtBM6cu7fSFNmioXwyHBnmJjwNpilm3ZRC6kLon0N02+NZElB3oYkdjoctlcUvrFi+BoZFUPlnQ+xaxBRHBS39ln+cflgfCOqLzYzRe4RmwVKPvTvITKa4/ifhXzfKb4uFlWPtsOeTPwIwV3dTeIx7FQ1nENWoEE+hPaZVrKS9L0FgPT/JlYC03GlfFOLmKTxCKgUpmULVjvE9wKikKRjfRZzgDfH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qCu0oqKAv/YRW2TYq3bLtYnX2H0j3r4xZqjJvbkCpg=;
 b=LlnEQs/MrH8DeAcBrRmQlRiqvS/fBxVDKwipB/cE1KCxmNQW8FIhHeWaH3DjeGMFRaqWTSkJp0XWuRgKPAJA109EwvpH5cd42w0Kr3/v/xkCQElJqouzq2ldjIRSFwCYxfea99WwVPj93gaa9TNDSFBadt9wozJr4xVchTpnEcexS7JWKPxMJTpYUEF0gn4xSYkGk2nWWJpUAbwM70QRJYVsFg+rBrjolZmhIadxCQ60Zvs5TC9esJxjY4ulZY8FdqqdjUOAcvojW7jWA0LihByVETA305FzV9taRDilEZseZYwGihTp3WWsWqOoGSYWlOYAIzYPdKhPO0IvurpK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:46:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 16:46:25 +0000
Message-ID: <6659c13b-666a-4a57-8a31-f123f9ce932c@intel.com>
Date: Wed, 1 Oct 2025 09:46:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/gt: Introduce runtime suspend/resume
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
References: <20250904091439.2279352-1-raag.jadav@intel.com>
 <20250904091439.2279352-3-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250904091439.2279352-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c58580-3fb9-42b8-86ba-08de010a0f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUlMWU9nNERXeWVtbFJhUWJzeDlocW43WVpwMEVMWUl0aG9tSVV4WFMxYm1B?=
 =?utf-8?B?SmQvZDFoRGl4S3h4SHJGZ09EY0p5bzFCc1NrN1I3R05UMTUvK2JSSHZiMnl5?=
 =?utf-8?B?bnZvTU94djdBVHJRRmlZN09UcU5acndkc2luZ0hqcmRUQldRcU13YUNpek9I?=
 =?utf-8?B?YUVROVc1SUV1MkZ4N2dQUE5lM2E2Y1hyWktQK3RLWDhoNVAvdFl6N3F2d1Q0?=
 =?utf-8?B?TnFGUEExQW9YMkU1cHZ6ZC9SaHBDSnNReEJVbGw0NFlRV3dEdlFsZHE3TWFK?=
 =?utf-8?B?ZHYycXhwQVk1cVRGSFpPOEsxUlJoSWMzVmpEMXZJN0pLdmNhbUJpck1NSWVy?=
 =?utf-8?B?UEFIelNOQkVXa1g0bThpQVZ5VjE2YnNpTmJWamlLSzJPRnp2b01XVHFWdkZ6?=
 =?utf-8?B?akdWZjlSZE4yMHVTeTEvc2RxZDIyMEpJanZnWEhkM0dCZnd6Qy9ocnI5WFlP?=
 =?utf-8?B?QURrRUR5eG8xWHdDRTV6ZzNRNFBQU2IwL1ExUjR5S0kzcy9mOWh6WFphWVVn?=
 =?utf-8?B?cnI4dGxOUzFzbHZiazFhZTdhQmY2ZHptVnpNOG5FemZkMWsyWWROdFNLVy9T?=
 =?utf-8?B?R2FWckFMNUZ6WG9oZmZIRG9jZVpjWXFxM3ZYNkYyendSVjNrdlVUb2xEdzlh?=
 =?utf-8?B?eFZMTEg3d3ozUzEvYndJZUVmMEpPRTQ2RFNQY0kraEw1b0p1ZXE3SjNTRUpN?=
 =?utf-8?B?S0wvYjNsTHp3c2pVT2NrenV6MXl2YWRDamVvZjA2dEY3ZWluUVUwZThOZWFY?=
 =?utf-8?B?WkpnNUwvR0paT0dnVnNWbnhWNGhwOEtjTjlnYUFYZlQ0R1FNUktMU1pMWkNU?=
 =?utf-8?B?ODVNMEhKakFFY3Z6cXZYRmdPUFRCM1Z4bWY1Ny9OSVpLYTdaZ2h5T0t4UW0x?=
 =?utf-8?B?cHpCV3JiWFBRMFA2N09ST3g1OE9TbkM2QnhmMTcwZnk2dkxqdjVkM21oRVNl?=
 =?utf-8?B?UlRtM08xQldKNS9XOG1zeEI5c21lYUpXMXdJMk9WMW1kTm00Umh6NVg5bDZM?=
 =?utf-8?B?d2dCQXpnOTN2MXpWc3l1ak93ZFR1WmR4NjZ5cUxPa2tZVnlIOUN5VEl3Z3NL?=
 =?utf-8?B?VFVtOGxYdzFpNElHVDljbW84Vm52M0YxVzBtODdXMzYzQnVjNTh5WXNBYTdo?=
 =?utf-8?B?bWNoUGlHc3R3emsyVXFXN1d4dWZFbVRpYTBXT0xKKzdzMnhxUkpDVDRKQ0xs?=
 =?utf-8?B?QzJTVi9BcmZoa2h1Sm9jZWhPUzJ0QmVMQlVudU0wajhhQVNRMU1DRHVTNWVD?=
 =?utf-8?B?MnNDUG1Sd1NyZWFJWXZTRnVWQnR6Mk8xNlVEVEdXWjQxeVhtblFObWh5MVk2?=
 =?utf-8?B?dWxVWFQ5S1JnOWdKOW1QUlVYVGpTV0xNd1laU3dCajhhT3Z3ckVlby9iVHdk?=
 =?utf-8?B?b2l6S1NtU1liOTYrQzI5K3ZYSVRsSzJmdmZ4NmN1bXkvenhQNE42Yk1sUmRh?=
 =?utf-8?B?bmdLTG5YOWhJbU9uY1d2VjEybFdyTVVHNXNFeUR1MTh3WkR1R3phY2lObm0y?=
 =?utf-8?B?Z1k1VkRQTU5MUjY1ZEV4ajFHRG1FTitnUXN2a244L0RxN1VHaUZVcTBmUTA2?=
 =?utf-8?B?MEM0WDRxL2JacS9JZm90aHRnamdyTFNZZVdnUWhUYmVQR2tweHp2M0gyWU5t?=
 =?utf-8?B?Ylo1aUIrM3dmdEQxdTlYdXlHdnVMR3FTNC90emRhb2RvNDJ0R1RnQ2J4b1Vk?=
 =?utf-8?B?bHhVMG1XazBlMUhpYUJGeUpKWHc1SW5ob25jdXVocG4yczhxVmRvSUZ5ZFhE?=
 =?utf-8?B?eUYwV2ljWFAvamYvNkRKeS9SekdEblpmKzZ6am5HWEtEQzBkekVBTlh2eVNl?=
 =?utf-8?B?QnBoazFsYWV0L3hMWCtmVndDOVJ3dGsxMEpRbDJZczBwdk9PODd4bVBvQjhV?=
 =?utf-8?B?eGpKYkJHZXY1UmFJQ05ndmZ6SFA4NUNDeFlPRU5NOFZ6V2xMQUVLaSs5Yk9E?=
 =?utf-8?Q?usoA7GwwxcKTHArtqVUrPaAZVge7TIr5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUp5ZGVYZU9kb2hmSnpFNmZrUENwYWdRWnpUM002TzFSSURPUUxDOGxIOEJ4?=
 =?utf-8?B?WVBDanFNSjROWUQ2OGxNZ2tkNkVyMjNLYTBtYUFSZkE4cDBtNlpWdWJFME4w?=
 =?utf-8?B?KzF5Vy9melFGc3M5SFcwVjlmdEdYVzBXU1hnV2lWQVZRK2NISm55UGJBWnl4?=
 =?utf-8?B?VDZZS2w5ZFVXdm1FTk1XWDNNOWRKblR2a3dOYXpYQlpZcmhTOVNoQWJ5NlJr?=
 =?utf-8?B?cG1xVTBxK1dLcGZBbnZRM3k4dytiOHJKOWVnNHNOL0hZUXo4NG9iVUgvK3BZ?=
 =?utf-8?B?ODNCUUdUeVpnL0t5STZTTUVvbjRXaW1pbFZEdTEwN011TEFWa0pGMUNnbENN?=
 =?utf-8?B?ZXE2aHEybFZMY0FyUzV2MDJHNzhMNE5TZlZnaDRZZ3pLdEJjL1dsNWI0Rnh6?=
 =?utf-8?B?Zmt4YkFoWFJlcTlYcms3RkI0Z1NLeVlEVmZwTUVobGxNbllBeVdMaXExN1Mz?=
 =?utf-8?B?Vm5CaEJoWEhqM200SytaWHg3OGlJRVZkK0FlUHI0K0NnSXhGSXFmWndJYkwv?=
 =?utf-8?B?SEUwZnc1Q0l1cUZMWTFxdFFFNkFXNlRqVGFkSEJVM3FLMzZib05oTXpJL25a?=
 =?utf-8?B?S3MrYVRYZ2NoMGpFbFFrMW9lR3cyTEZHbXhxcmJSZ0ppZTdRL3FpaEl0ZGNo?=
 =?utf-8?B?RVN2Z3o3bERLY29PbGQvZTdNVWJyVWUrdGtEcDg2QnlYT0lOdUdBZm5JT2t4?=
 =?utf-8?B?UFJrQnNnRlFuMkE2U1RKSldPdjY3UE5RM0x2NEFUL3lzaDZ0bHQzTTY2UzZo?=
 =?utf-8?B?Q28vUS9sblVQSzdYaDBtczU3NDFxR3VLbTRuNzMvdkVrT05qczA3UDBER2xz?=
 =?utf-8?B?ckJHbGpuZWRJMWhKYjliY1c5UUMrYnlWOUJEZjdrdXYwRC94UG50QWFRdWtV?=
 =?utf-8?B?M29iTmpONlEvQlBXR3hVSjZIQk9sTDRwUEJ4eHhrUFIxVGxCem1NbGtYeHk0?=
 =?utf-8?B?eXlZLzk0Wk5YMDF6VGU4Qk5VcUV2eEQzY3Uxa0Myb2E0b0U1aFVSVlFrSU52?=
 =?utf-8?B?UDBlb3RibFprbDBtSGJoQUVnL1pQRWhHMkxZVFd0eHpnY2RFcCtyRnNFeUxD?=
 =?utf-8?B?MXozcDRObmlvdnBqSVU3aW1WWnNVS3gwRjhKWmJMbjBnK1pKVDZjdU8zajVn?=
 =?utf-8?B?NzNsM1dja2tacFM3Vy9uYmk4am9mdVVVT1NjRTZmTmNBWjNpUVp0KzBmVlpB?=
 =?utf-8?B?S2xJajQ1VEtkY1E5RkExdzdLOGpMNWl0bitrTGtkaUpiMnhrUm10cHcxRTdl?=
 =?utf-8?B?YkRlZVA4Q0tqNU9SeFVDNnV3KytJUHU0ZFpSWnJ5TFl5UStmVCtUWElIa29y?=
 =?utf-8?B?NVN3MXRmdTVUbTRueEo5SkR0SGZrSGJjS3pJZDVyM0srcXFWdk03Snk2VkdG?=
 =?utf-8?B?STdpWEx1ajhqM3FFaVIrUjhydFo2akI3Rm9lb3crTmlING5EK2Q0c20xaGhN?=
 =?utf-8?B?Y3llbHNSZ09SMGdiRVRiOUpYSkFDNThyYktpYkkzRjg4MkVUVnhWc2NCaEI1?=
 =?utf-8?B?NmVUNUpGTE8wQVpibG8rcnMvVGxaZjFzTFRVTVovYjVraTAwT3p3c3BWNXBR?=
 =?utf-8?B?b3U1Rm8rOEVjOHpVd21Edms4VGp2S2hERXpoMUovd3lRNHNScE11bmpoZDk5?=
 =?utf-8?B?VXAzYXk1YWdCOE5HV0c1RDVmUjZEN21mblhGQTZQVW1DYzVTcGpxdE9XV0RE?=
 =?utf-8?B?ZnJacGZvZ2tOZFJMc0hiWUdQbUE2OGFzVjhUaFkxVys1bXNub1phNzRNeVJF?=
 =?utf-8?B?bTlYajNMZE9yUDZIU1RsUFVRL3dZblZyelUwRzlPSU9idDE2dm1SN3YzQU04?=
 =?utf-8?B?aXhBdXcxY3Ard2hPWS8zblkwZWRxUHdJTElUYnNLSzJWOFREVVJZbDZob1l1?=
 =?utf-8?B?Zi9xN0VkYmYvZlVXTERVSWJSZXA5eEpqSnBmZzBWNWh5R2pZUHJnampyRGRa?=
 =?utf-8?B?Z3FsVjZCYUxnb2ZHN0NHMTNQQWNudC9heWxrbmZOOW9PY1FpMmdjelJmUW82?=
 =?utf-8?B?U2JpR1hqNEJrcUwrNmtINU1Gc0hlcEVuZEFNUThHTDA3aFlObkc0VGErWFpy?=
 =?utf-8?B?QXMzaE52SXRhUTRwUlpPNm53QUxnVnZVTFVmMWpQNVRKMlBYOXdoTlVvVk9j?=
 =?utf-8?B?anhQbjdGaWd3VG91bFo3OVgxSDBHU0pGUlFxUjE2czJBMEpPN3Q0eS92dlky?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c58580-3fb9-42b8-86ba-08de010a0f06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 16:46:24.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoLi/LyIsgVGAS6uYvPkDnO/TAcDwmFfr9BeN/vamQxkw8XWsEMWVquurvjpurZdUN82JC/Q53QWdHoHNkSeFpoVUCWSlD/6qECr11nhHjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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



On 9/4/2025 2:14 AM, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full GT re-initialization. Introduce runtime helpers for GT
> which greatly reduce suspend/resume delay.
>
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>      Use runtime naming for guc helpers (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>      Use runtime naming for ct helpers (Michal)
> v4: Fix tags (Rodrigo)
>
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c     | 58 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c    | 29 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>   drivers/gpu/drm/xe/xe_guc_ct.c | 27 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>   drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>   drivers/gpu/drm/xe/xe_uc.c     | 29 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>   9 files changed, 156 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34505a6d93ed..7ff0dfab0854 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -943,6 +943,35 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	return err;
>   }
>   
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);

The full suspend also calls

     xe_gt_idle_disable_pg(gt);

and

     xe_gt_disable_host_l2_vram(gt);

Not sure if the first one is needed, but the host_l2_vram workaround 
seems to be applicable to the runtime scenario as well (although maybe 
we just need the resume side of it?)

> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>   void xe_gt_shutdown(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> @@ -1002,6 +1031,35 @@ int xe_gt_resume(struct xe_gt *gt)
>   	return err;
>   }
>   
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>   				     enum xe_engine_class class,
>   				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..3f793230e78a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -51,6 +51,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fd82eef8f372..c750f564a856 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1626,6 +1626,35 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	}
>   }
>   
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	guc->submission_state.enabled = false;

We now have xe_guc_submit_disable() to set this

> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	guc_enable_irq(guc);

I don't think that this is a valid function to call in a VF (but will 
leave the final judgement to Michal).

> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	guc->submission_state.enabled = true;

xe_guc_submit_enable() here. That one also sends an H2G to set scheduler 
policies, but it shouldn't be a problem to re-send that here (but please 
test that).

Daniele

> +	xe_guc_submit_unpause(guc);
> +}
> +
>   void xe_guc_stop(struct xe_guc *guc)
>   {
>   	xe_guc_ct_stop(&guc->ct);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..e3736300ffd8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>   int xe_guc_enable_communication(struct xe_guc *guc);
>   int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>   int xe_guc_suspend(struct xe_guc *guc);
>   void xe_guc_notify(struct xe_guc *guc);
>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f2b2db780e53..1ee0b3aba9d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -520,6 +520,17 @@ void xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	ct_enter_safe_mode(ct);
>   }
>   
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Runtime resume GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_enable(ct);
> +}
> +
>   /**
>    * xe_guc_ct_register() - Register GuC CT
>    * @ct: the &xe_guc_ct
> @@ -610,6 +621,22 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>   	stop_g2h_handler(ct);
>   }
>   
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Runtime suspend GuC CT and set it to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(ct);
> +}
> +
>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>   {
>   	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index c821517e87d0..8bc34a0a78e2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>   void xe_guc_ct_enable(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>   int xe_guc_ct_register(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4b54cd34cff..df61876fda87 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -498,7 +498,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>   		if (err)
>   			goto out_resume;
>   	}
> @@ -540,10 +540,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_rpm_lockmap_acquire(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>   	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
> @@ -564,7 +564,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>   
>   	xe_display_pm_runtime_resume(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..d99b8a795690 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
>   #include "xe_uc_fw.h"
> @@ -301,6 +302,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>   /**
>    * xe_uc_declare_wedged() - Declare UC wedged
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
>   void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);

