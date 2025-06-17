Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EADC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3C10E06F;
	Tue, 17 Jun 2025 17:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFm7qBUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C487410E06F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750182124; x=1781718124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nmvmjEFCNxRWlAj6qhgcfujsSzQxtCeSzXoVyRD02HQ=;
 b=UFm7qBUw8bw5Cgyp0tilzWDXvgmS7uc9rwa3nmPQYJGJlSdbnRnwVrDH
 1eHbu5CkchggLABBRuQss3JX15i2/4pB3gAA/AxujBoMMqq/gxaGB1RzB
 dLqN0HHhXlpumeAxKo7h60vYY8xWb+4KttfGgyYQL4uoeB4f5efdot+hG
 YDGDjYMIqQbWNTfL5lVbZNL4ZmMdAXXr8Ye2y3iAjG0K0kNKWYb6u7DjD
 LYdpFypl1OFyXg+NlnNlyCvly2zY34V2rToQ6Isrxvxe7BpUoA4UdMMQH
 tIJ0lcLZp8LvOGZILR7NcF2GQk5CeaxxKLhHQI+ugkCG/SdMVeBHIbyAK Q==;
X-CSE-ConnectionGUID: 0H0cssjLTTqLZwl5H9lFYQ==
X-CSE-MsgGUID: ilbQ31deRs6K4WI4Gx5qFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69822195"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="69822195"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:42:04 -0700
X-CSE-ConnectionGUID: sJgda8CUQpif3enFlX3ibg==
X-CSE-MsgGUID: trEevhdMSv2Dxw4kXHHTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149743356"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:42:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:42:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:42:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSzBLKg6MkkdmX6LdQDfQpPRgMMd/hju8/h8ruQ6TkB3x4eEnPATnNiANuSbmbbmxPjsOtnPwAhiB2KCRrTSgBFHWgg7C5Pgg/DdUmPUfGeJ3CKN+Pt9FIYOXNylejCv/JwazRRXfzOdI9U96X7hJQ+saFGVnqKUKPPyklLZbTJeCyg5dVPSxtnkgUSF0yfbiftDOppfMZLO252BxhWvSZaKjUuKjzbTppyLxKitIT5pdL28u/AZs4qHCkOQ/+50L0+zHaTmKduO+b8jFzKh69MLYa0KJLJnWtEKBKJPbajv21aW2SaWzSjjep4asazWGwNZEvSGAlOaWmn86YDBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/3tiCBQ/1DDMomerfxfxfXV6Afd4p9DdJaN6+lwmtc=;
 b=ABloXuUcIJlxaJyxOu3LBmfGGSAO6cdeiVqXug52DjswOq9UJo3zPHLkJmnkxDv9oIHMwmWWxsc7Z0BqDvPQriiSO/gCbbTaiK4jXLIZVv3SCIJnf+ydc0Qfj6oYWN736UCPWxq8xFIGdofKYMeUqy1LHTScvV9yW/CtPO29hMf9UmAbSJNJ3Q6KmXW4O4OTyc0AsG9NsFMYNVlTL4eRhZ1YcP0iXgq0tlXlcnMtV4xycLelA4S5qXQSxeQb5RVHiUp/x0a9BMamGBEJdVxxTWrhEJP+LFppJa25Z9ubtial8k3q3y7WipDNFxp+sg9XezFYMbVbiplODojCr33NxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA3PR11MB9351.namprd11.prod.outlook.com
 (2603:10b6:208:57c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 17:41:46 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Tue, 17 Jun 2025
 17:41:46 +0000
Message-ID: <a5f37fef-4558-445d-94ce-4e9cc055f546@intel.com>
Date: Tue, 17 Jun 2025 23:11:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Add xe_vm_has_valid_gpu_mapping helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250616063024.2059829-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c58bd4-1361-4ee2-372a-08ddadc63b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L29MTTVrQVpMdE8xODlxajB5RkJ4VUs0eUZ2MldIYjJiQkgzMUtxZzZwY05N?=
 =?utf-8?B?cWpnZUErNDI0SUVRUkRROERQOXhIbGRuendUaU1OanBvQTlXeTF1TG9hODZ5?=
 =?utf-8?B?MGdhS3JCa2dNOFc5d0lseWVBL0hMQmE2OVNscXl0aG11R2JSV3lRbERLOTUx?=
 =?utf-8?B?Q3UzUm1ueTNGKzV5dEFpOVlYRXlxQ2RYcm03ZllQVkc0QjBDNks5U0JpRVFt?=
 =?utf-8?B?YWFjMWlMLzdYTmpYd2hGSDNJMkRVRWg4L0diVk5xR3NMc1VvZFlZSCtJdW5W?=
 =?utf-8?B?SVpYYnViM2hQL0lqMURydjBKVGFUVWwxek5EQW1MU245MmRaeDJ4cDY5NkRi?=
 =?utf-8?B?Vk9WbVBsYVNCeWVmNGVMMmJGWFo5c1Y1Vks3ck5saGgzdDlsWGY2NThpczhr?=
 =?utf-8?B?ZGlZdkhlSW9JbThvUzVnQkdXWEVrTlcxNDg0UXpqN3k2ZU5HWjhyU3dZRXA2?=
 =?utf-8?B?eWd5Vk9jVXZ6SmNGQlVkUmRnbG42bUw2ODZVT3JBWlZjd2xiVUNOMUpQWHNC?=
 =?utf-8?B?aWxmREpyTVRhSExpS2JibGdKOXNSdzF5MEF1U3d4UzlHSzN2SXFFamsyREJW?=
 =?utf-8?B?YWdDZGFNWEVEUlJjemtYT0h0WUhqWXRsTUhCR1A4YzNtbklQdFowTnhjemkx?=
 =?utf-8?B?U3Z0Y0xybVcwNDFtZjI1YXk2ZmNGNEt0THFwZnpKektvWHM0QWpiUjhSdE5M?=
 =?utf-8?B?QlZyREk4YVJQTG45WXNNckdYSnFWV0piZjZjdU1YYVFGV3hRVGJCeStlUkxF?=
 =?utf-8?B?c2FrRyt1SEZuMW1Tci9LYURrTzZPUkMxSG5GUjFZa2J3QzZGZ0IzNDZtMlhx?=
 =?utf-8?B?eFNOMXZ4b2RJeWVQdTJMcGJXZkFxUndNQlNmMWQ5dm1zK3ZsNVdmLzU4cVda?=
 =?utf-8?B?a2RBWjFrQnB6MDJGeGszUnJROUdLQVFhVzVDM2VUcUFCczNLSlZDRUNMSWZJ?=
 =?utf-8?B?MEt5RTJkWTJnYk5IR1p5YTZKcG5FSm9LR1R0WU9qT29teUZYaURQRTF1Ukxw?=
 =?utf-8?B?d0NtdVBncVBuUjVjMXZFbTIyRmVEUWlOQWcxT2VxQzdWNzA3Z09ONERsRTlF?=
 =?utf-8?B?U2RuTU9XdUgxKytKTWFlaHcxTUlJNFVOQUZBTGozSlZvZkNQV2ZLdGtaY3lu?=
 =?utf-8?B?aFRrcDJ2YWRqSlUrc015SjZwdkI3bk5YWGhuQWVMWlZiMXVNbWpROXpOcEpY?=
 =?utf-8?B?dTFZQ0RmK3B3SlJNdUlNV2JhcU9vdjVzSHB4ZnlVZVdXTEpBUXNPTU1LdFBy?=
 =?utf-8?B?eXhvZ0R1OXFlSGppZUhaK1c3c3UyY1plR25nbkU5RTlHbzB5S1hHOEJUOFJC?=
 =?utf-8?B?VVFBcHpkOHVDWGxWSUZPM2YvYVptdC9LMkltZmRYTkt5VVFDMC9LZjhOdjIr?=
 =?utf-8?B?amxEY29MUEJHbE5HYzJrNDQ4UFM3dWQ3RzVmWmhOSG55RXhhckRDajFJSkZI?=
 =?utf-8?B?b0JySW1tRUNxaTE2b1I2MTVRZk83enJoc0EzNHJ1aUZyQmpuQnRVVGVwbHhH?=
 =?utf-8?B?L0hWMXR6UUNHbnNJNTZOZUh1OEJ2eWk4UnZLNWVqaU1ZdTg3b1Rncy9WQXNP?=
 =?utf-8?B?U2c1WGRFOGFOVURmbzBGOGo3eVVxUklUVm5jcnk3L2Q4WmFPTHhac3BGa3VY?=
 =?utf-8?B?TDgzN1R3U0dNZ1R2ZmZucDNKQTF5aXdzRUxRUm1UZmUzcXUxSG85eGo1bWRx?=
 =?utf-8?B?MWt6cGxlQXlaT2J5Ykw3QVNOeHNwQnhHYUZaMlkwbmNSVlpybjVWaW10VzU2?=
 =?utf-8?B?VHhSajlIRWF5aHQ0OHJRaW1ualBMMWJKczJGZE53dGpwdzE2MkpXYkpFSmY4?=
 =?utf-8?B?UW9OVUx2UThHbnVXSFE5ZjJleE1CbVNPcWF1RE1NV3RxQ0JBWjRhVkQzMUkx?=
 =?utf-8?B?eC94ZkFCVFhVUmJ0Y3N4TkM3Rnc3R3JsQ1lVQ0N3dFNyNTA1LzFZRWkwdUk0?=
 =?utf-8?Q?xEMhPoxYOZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWtlVVZsVVFHQ0Jza1BWMFVFT0dkcjVTYWdua0pMcGNDN1lLc0o2MmRQTytw?=
 =?utf-8?B?Q0N0dWxwRmsvK1QvaHdDdlFjYThRS2o2dE9GeGMvQitMa2FLVHl3Rys2c1ZP?=
 =?utf-8?B?Mm40akd1dDAwbGtWckxJUzlrWEhXOG1sS1pFTHBqaUFFYUFnVEN5SHNwK1BK?=
 =?utf-8?B?blQ3NGRsZE9INzNQQ3FrOUYrWGZMYitvYTlPZ3ROSXhXSlhvSzhUU1dQazB3?=
 =?utf-8?B?S2pmVWVoTGRmNWtoR0lZcUxoaVVDZ2Q5bFY4aEZObmlYWWVaeDhDektwbUxM?=
 =?utf-8?B?MWVPRXdGYm9heUYrQmlGb25RSGwwbW80UTZkd3IyOWd0ZDFnS3k0QzdBOGV5?=
 =?utf-8?B?R0dJMjUwbk9hc09KQnN5MDJlR0JRSjFxZGxFZkJ2T0E5d2t2emtiNko2aDh2?=
 =?utf-8?B?aHNxbWVuKzBRaW9JV21GSkVjandaSjB4bm1naGNTYmtja2xNMVVFSEF4R2lo?=
 =?utf-8?B?aU1IZTNqbFU1NlZhRE1lUkJDdzBZbjB4WXVERnBFUVY0Y2t1L3djS01VTm9t?=
 =?utf-8?B?VUtQVGhLVnJBTGw4U1Z6ZEhaU3VuYy9ieUNXZGFlY3BlakhFcjFjS092cUla?=
 =?utf-8?B?WXgzU0hJOU5JdXFwNFBsTit1MjVZbWY1azdPaE93eVU0U01xUlV3QjJUMTRW?=
 =?utf-8?B?WStpZjhWWklxUVg2OTJObVZZMTJ0Y3huUEhjMzJVVHRwSFBrd0UxeXZydkkr?=
 =?utf-8?B?UC9YTFYxYUhuL3dSZUt6bU1YZG9pc1dMNXJ2K2J6c0p2RFZjRGhHZVlabWk3?=
 =?utf-8?B?TmFYSkhPN3hjTzJRUWxVMXg3Mmp0OEhDSTRmWjlHc0hzbDN0MHRFeG9KcVFP?=
 =?utf-8?B?VzRtcktUVVY4eUV1SVFydlNkdFRUY0dNUk9oNkRsUy9zNUI1RnNpVXJWQWh3?=
 =?utf-8?B?Z05CMXdLOW15TUE3QVpSNmxXTTg5UjhlaS9lN2lyS2xybG56WTVCSENjcVFN?=
 =?utf-8?B?TnB6MWovS2oxbnFKZ1VqRHM0ZFZyL2FMSUlIRHFsSkdEQ2ZDbTMwd2NZT3p6?=
 =?utf-8?B?RWFTbzlRK3dCa0NiZnpkdDJZS25Zb1hLTTVhMWY4RnA2MFRTdVRaRERCMTF5?=
 =?utf-8?B?eTZ6bWVEditaYkZOdWhDQ3JrUnZmY01yVkRFb0UxZC90UEd4Tnk4azhNWDFP?=
 =?utf-8?B?R1ZYR2dEN2VRRktNN3dIQXM2dVVCVnZ4ODAwRUxhVGNJZmVyblAzejhNMUFC?=
 =?utf-8?B?VXI4VU1LcUcxVVpTQ0JJUlpKSjdjanNrRUthdi9yaDRzaGVraEhCdUwwSjlh?=
 =?utf-8?B?U25jU3psNEdVWnZZbktwTUxJaGFvRnhSSCs4aG1nWFBTSlR4SHJiYWU1WXFU?=
 =?utf-8?B?VzE3K1lGeGlRY2NzcW5TQVA0SGdvNUlDcE85L0hUMlpJaWo4djAyYnlmNnM4?=
 =?utf-8?B?dE9DSmJJdWl0Zm5WWUZDdHJEWjlnT25sNkRFcno4c1JlUzV1VlI5SHJQdFln?=
 =?utf-8?B?SkV1RXM4eS9KVkt3VTFaeWhPSkZ5akxZbURyY1gwWkNGZVl0M1gwbHBkcGRX?=
 =?utf-8?B?UEtXKzM3MWVaU3ZNK0xkYnZkcVR0bncraHhZQWFoZGw5bDBmdlQwazBJSTZx?=
 =?utf-8?B?T1BtTEJXU1htc29kMmt1QmQzaVNBNEt3RWJ4UmtHU1JBR3NMNzVMdkJrZ3g3?=
 =?utf-8?B?ZkpFc1MveWNPSS9MK0xYUkdoUE1LbGNRZkR1aXBNUytWb1lWa0JOQXgyZE1j?=
 =?utf-8?B?WlJpdGlHWGkyeTlXSXRKYkl6RFVFZ0FoK0dDQ1ZhQzB5QWtTNWZvYitoZjBi?=
 =?utf-8?B?UjFiODJnQmZNVmNDT29XZVFPSXg2WUcrc1VpWmpHckFWa0hjUGd6K1F3Wkwz?=
 =?utf-8?B?cm1rVy9rL2U4YVBZeURucEJXemFabWdtWUlPbUJpY0tQWVhlTWhsTDd1bXNB?=
 =?utf-8?B?N1JEUUdqa0VsTW5GM051cVEzbWhTZGtGbkV6MGRYMjlvL2pDQ0d0ejFqb29F?=
 =?utf-8?B?YTNIdTdlRCtRalhySnpVQ1lRejY0cVErSVRHbVhwTmFST1lwamZJQmtwZzBR?=
 =?utf-8?B?dGFrcngxbXlZajNTclRJZTd6VGQxNHVyNjJUU055MUROWmdzaDVIeGhPREE3?=
 =?utf-8?B?dGpha0o1cFY2WExFTSs2bkJNQVN3aVgwVVI2WmNoMUltM01QejhkYUNURWRU?=
 =?utf-8?B?WDNUUmJWaGcxb2VBMHZkemc1Y0pZV3VTUkJrSE91R0lJMTNyT1ZoQnVZTTdt?=
 =?utf-8?Q?UHaZOCPpXQockaObX6suANY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c58bd4-1361-4ee2-372a-08ddadc63b25
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:41:46.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+wPzb8AJIT0TJol3iPEFWZUviUTQCm855CyI0vuhQQaIB/ZicKziqLI1Hp2ClV/YiywMpNH1govVXJSo1GpvlM4i1noXpqXAo/WIRXIrBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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



On 16-06-2025 12:00, Matthew Brost wrote:
> Rather than having multiple READ_ONCE of the tile_* fields and comments
> in code, use helper with kernel doc for single access point and clear
> rules.
> 
> v3:
>   - s/xe_vm_has_valid_gpu_pages/xe_vm_has_valid_gpu_mapping
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-------
>   drivers/gpu/drm/xe/xe_pt.c           |  6 +++---
>   drivers/gpu/drm/xe/xe_svm.c          | 16 +++++++---------
>   drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>   drivers/gpu/drm/xe/xe_vm.h           | 19 +++++++++++++++++++
>   5 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index e2d975b2fddb..3522865c67c9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -69,15 +69,10 @@ static bool access_is_atomic(enum access_type access_type)
>   
>   static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>   {
> -	/*
> -	 * Advisory only check whether the VMA currently has a valid mapping,
> -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> -	 */
> -	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
> -		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
> +	return xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> +					   vma->tile_invalidated);
>   }
>   
> -
>   static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>   		       bool atomic, unsigned int id)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411..9c30111e8786 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2196,7 +2196,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   					   DMA_RESV_USAGE_KERNEL :
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   	}
> -	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>   	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
>   	if (invalidate_on_bind)
>   		WRITE_ONCE(vma->tile_invalidated,
> @@ -2255,7 +2255,7 @@ static void range_present_and_invalidated_tile(struct xe_vm *vm,
>   					       struct xe_svm_range *range,
>   					       u8 tile_id)
>   {
> -	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
> +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>   
>   	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>   
> @@ -2324,7 +2324,7 @@ static void op_commit(struct xe_vm *vm,
>   	}
>   	case DRM_GPUVA_OP_DRIVER:
>   	{
> -		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
> +		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
>   			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
>   		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2fbbd6a604ea..26418e9bdff0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>   	for_each_tile(tile, xe, id)
>   		if (xe_pt_zap_ptes_range(tile, vm, range)) {
>   			tile_mask |= BIT(id);
> -			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
> +			/*
> +			 * WRITE_ONCE pairs with READ_ONCE in
> +			 * xe_vm_has_valid_gpu_mapping()
> +			 */
>   			WRITE_ONCE(range->tile_invalidated,
>   				   range->tile_invalidated | BIT(id));
>   		}
> @@ -605,14 +608,9 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>   				  struct xe_tile *tile,
>   				  bool devmem_only)
>   {
> -	/*
> -	 * Advisory only check whether the range currently has a valid mapping,
> -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
> -	 * xe_svm_range_notifier_event_begin
> -	 */
> -	return ((READ_ONCE(range->tile_present) &
> -		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
> -		(!devmem_only || xe_svm_range_in_vram(range));
> +	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
> +					    range->tile_invalidated) &&
> +		(!devmem_only || xe_svm_range_in_vram(range)));
>   }
>   
>   /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6ef8c4dab647..04d1a43b81e3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3961,7 +3961,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
>   						    xe_vma_end(vma), tile_mask);
>   
> -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> +	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>   	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index acd3fd6c605b..cc332c4ebdf2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -375,6 +375,25 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
>   	return false;
>   }
>   
> +/**
> + * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VMA or SVM range has

Nit the helper is no more in use for VMA in Patch 2.

Rest all looks good to me.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> + * a valid GPU mapping
> + * @tile: The tile which the GPU mapping belongs to
> + * @tile_present: Tile present mask
> + * @tile_invalidated: Tile invalidated mask
> + *
> + * The READ_ONCEs pair with WRITE_ONCEs in either the TLB invalidation paths
> + * (xe_vm.c, xe_svm.c) or the binding paths (xe_pt.c). These are not reliable
> + * without the notifier lock in userptr or SVM cases, and not reliable without
> + * the BO dma-resv lock in the BO case. As such, they should only be used in
> + * opportunistic cases (e.g., skipping a page fault fix or not skipping a TLB
> + * invalidation) where it is harmless.
> + *
> + * Return: True is there are valid GPU pages, False otherwise
> + */
> +#define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
> +	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>   void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
>   #else


