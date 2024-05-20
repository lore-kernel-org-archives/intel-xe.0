Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42FDC25B78
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 22:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028BC10E141;
	Mon, 20 May 2024 22:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="misOc2Dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758210E141
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716242646; x=1747778646;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yWu6v7n47yVo1sbBezE+Y7Sr3jJhko9g+mWy5RtwLNs=;
 b=misOc2DhzsbJHgAEY8Rne8uyDIQCgrKmoGeU6zQqh6Lh07A0UvGiLIHS
 ChKd1bAPnlMtruB5G1bqMYYHlYlvGO2fJkXJBMx0weba3RRQLgDqKIOjY
 uSbJYtxuQ+/yzuEfuQEkGSUziL4TI/HtHxMr8DaDsPB3wZo9GJxPWuCWe
 mwxwWRnrWbKXFUNupFaPhLMktw3Co8qMaXAgHPnoG85QMt7J0vN/fv1CX
 0nvLk1v2FyNkEI7uLd0OkHTJA4B6x9ZvYgrNUZxpGckDA71uL16E2LttJ
 2c69jBvhKYBd4kRlHc/DA6ZCgL0kK9uhw0yCmHBir/VFVspQqjpDMaXA4 w==;
X-CSE-ConnectionGUID: z02U+eurTzKGn6vw2Ia0jQ==
X-CSE-MsgGUID: /DkJDJJ9QFSNvU0d7MYXvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15348171"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="15348171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 15:04:06 -0700
X-CSE-ConnectionGUID: j8zepcX3SjuOiKjOutAr6w==
X-CSE-MsgGUID: 7oU+CLf/Q9+vQwHPAjwBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="32663083"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 15:04:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 15:04:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 15:04:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 15:04:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 15:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6S6mtsodSsisZf2x/CG7Z3Q7OyxqVBFG08h3V1VfKslEaKq41gu+w6JDcNwR5gYmWSek1p/2GDJGtIvlWSyXcbIlLmhW4QWsckXsjkw/xTsuWzWSOdnq55FFMw3+dW6+9QNrCnlYMg3wkXyRoOBKc3kSph9MCs1rfch4exRCzdiHYPfZL1XV2DCK9irJsOowSbJG1cHW8uOkUyv0qoApnw3JQjRNtunfHCvte8O8Q02cgh4Kn1Kdu1kZofGsAFsxqR5LpvbVucKVe/QW16vE73I2Wg3CId9Jpq1r2OwbM52IkWWGGVZ9MW8Gh+1yS2RDNhDt0LcUDHYcrQbb5NIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/Pl/WSz7QF4q2uAiVFpi2QEkH5f0YCazipy3Rr7J1I=;
 b=NQJMLeFundZWF0+NKshRSDhYOQ7HvkATPge8yQJlOeZtGexKFqZonP2pZYVWRZpcjGpEj0SsXDoQoJ9SzRzTr6Yup17ReYuNuP66Txps4SlAXHH1/CM2VGcvtdMKq31dox0iMbfE/BV6acdK5qDfIGnlvSPKizpIcitBSHeSsAiB4EDvZ1xsXIHAy1tbLdGxEOo17TJ1XYTTLWPN+L4X5MOkVKNDjYZaN9tO0ZoaFUhubxU6KjUPVEvLVeOEoqrgfZx495msTG5nOj+kEuA/YqO4WGX01V0mwplFzBevex+PaPhArjhUjYw7vCFX0gZh1qScdaaOWSwGEicM3g7N4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB6963.namprd11.prod.outlook.com (2603:10b6:930:58::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 22:04:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 22:04:03 +0000
Message-ID: <9444ce88-e86b-4ebc-a549-691b88bb739b@intel.com>
Date: Mon, 20 May 2024 15:04:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Custom GuC initialization if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240520212330.2436-1-michal.wajdeczko@intel.com>
 <20240520212330.2436-3-michal.wajdeczko@intel.com>
 <9139d5f4-c770-4157-bb59-0b2b2288701e@intel.com>
 <6f945b72-6fc7-4e8b-be36-f80996b81f02@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6f945b72-6fc7-4e8b-be36-f80996b81f02@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcf878b-c2dd-41f5-7cdd-08dc7918c279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z21NQUVSVlhNZGlnTFFzeTFESVNKVjNkbitZZnN5cnhmRjBGNDZaaFhPV1B0?=
 =?utf-8?B?RU5LQmRwLys0cWZBVlhtYWs3dEtSM29uN0dJM2k4WHo1blpDNkpaSEhPb05T?=
 =?utf-8?B?STBZWEMwRUUxUjN2bmwrdUlQaXJ5OEdHZWY4U0xQUDdubzJsUDZFU0RWeGlV?=
 =?utf-8?B?QnR0UGwxMzZ2dzhrWWJ4U3lHdUJOS3RZbjlpVzRTOVRwU1N4Q0ZJRFNlRTZ3?=
 =?utf-8?B?V2tNRmtkTkxsREh3M0U1U1BGOTFoZXppdGxSK2ZmdnZpTWJ4V25rZHp6R1Zs?=
 =?utf-8?B?SE0wZ3BKK0tSUzFSSUtDOHZpODhNVGxMams4ZWRzNnljVlZ3cERMSWxoaFRj?=
 =?utf-8?B?Q0lUdGYxOXlUU1lubGlLS01USktIejlIM0h0WFpoM1ZYSlNHdFFIcGZEYy91?=
 =?utf-8?B?N3A4dmcvRGtFUGhaTTBybnh4NVpIT1pqa3pRbXg4Y21PVzBFZ0I3ZWVlZG9P?=
 =?utf-8?B?QUUrQXArSmlVMFZia3dqb05xUFRmeEpLS3ZPV0ZRZWJlLzhwVVlnWEgyVHJK?=
 =?utf-8?B?amNPMVlZbXgyV3NkNEJWb3BZdStLZVU1OGdBeEozczN4alhQZmVoUXJZY1Bw?=
 =?utf-8?B?QTM5UlhEWjVpWjhGc1FKNURvSWk0a3N4aW4yaHVpck1aN3lDNVo4c1hYZWVX?=
 =?utf-8?B?K0xUQktKVDQ2OTBPMmUwUU9BMUcxUTFwTXZYK1VyRjJJQmJwb0hFellnakRV?=
 =?utf-8?B?SVg1VVJheVhjSXF6K3FxM2lhaUljenZvSVo5allTUzNCQUxkVW9JNnFOeUR3?=
 =?utf-8?B?K0pPZk1iTnRhbm5pWTRPZW5yUE92anVyaUJTTHFON3dGZUM3ajBSd1pXUFAx?=
 =?utf-8?B?cEdMR2VFRGVWOW1rNkszNzVMUTdEWFQ4anR1NkpwZHUvQ1g3RS9Jd1BZT2Zu?=
 =?utf-8?B?TzZYV0RmOFRFcWQ4VFNzczRKSXNQcU1lMFZJOEd1VHV3LzVBNlFRQWR2TU41?=
 =?utf-8?B?eXpqN3FYMllja3lCSG1UYjZIQUJsc1BKRUxabkNqUG5DN0JTdzBjVWxGajZj?=
 =?utf-8?B?OWx2emZXSnhja3lyYjRwZnZMOVFBcU9NM0ZJU1ZldHVUUVkxa3BRNk9LYWhC?=
 =?utf-8?B?Szl5aW9XV0VySFE1bW9kQ2JISGh0MDV3aWNOZjdPd1pOSFA5Z0NMNGJzV1Vv?=
 =?utf-8?B?azlpbHoyOW1lbjAwNFQ5VjQ0YjNyVTdDNWdPczhwUjVlL1cyUXZCZEJlUHNQ?=
 =?utf-8?B?V2VuTnk0UWlJQ1lYbGgrNllCM091NG9OSlFubGZValhBYlNxVTAxKzFVZlVT?=
 =?utf-8?B?QWRKUDlnODFIRHdYL24xWGJlMkxFWmttV2ZsWEI2TUZrSGRUVkJHdFV3dG8v?=
 =?utf-8?B?dkFSUW80S1ZoRDNPREpHWEk0VEdOT1l5QWlJaTBUamtudzhUTFU0TEtmbktK?=
 =?utf-8?B?YnpKWC9YMlhvUklLdWlQVkpQQzJvTHlWSjBOMG14WUNpc0xJUnR3UjB5azdn?=
 =?utf-8?B?ZkFQa2pIQ0Jia1RqaWttNGxIWGNpSzFUNCtBazh5U1FOZnB5UkRKSG5kSlht?=
 =?utf-8?B?elVrWGdaaDd5YncxVDdDNFdYbVBKb3ZHaEo2eHNCM3N4WUVJZzRMOE1DalZp?=
 =?utf-8?B?MnlkNjY3bEQxamJpL0pLNUFZNFFKcktYRnZCWXBNZ3dsUGdOU25KMC9PbHg1?=
 =?utf-8?B?eVd4K1ZyRU9FSmIwV25wajIzSTZ5Qks5ZHBwSnBmSjUwaExRc3ljajVkTmFX?=
 =?utf-8?B?U1FkT1hyTzdTeXJoMlB6Q091SUJHazhrdElYZXlIemJPUG9uTnBGVUlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhGbjBySWl5eUZUVFNWanF0bWtjRzVQRVVYOHVBdEI5dThiODF4L3ZpVEhY?=
 =?utf-8?B?ZklxT3VOekZobVNvdVRCNG9aRWRYckJHRzF5NGtqcDVHMHQ0eHlNQVpqSXcv?=
 =?utf-8?B?ZGk0NFE5OVAzR2pxTWRDb3pqUmpZdEp2QWEzUkRidUFSdnI2RGxLWm9YemRv?=
 =?utf-8?B?djNFVU5EZ3dYZEt1eWhoNFJDcEl4R2ppTDZsQW51dHRRbHJMenZvT1pZQ0dK?=
 =?utf-8?B?QXBUWnBncnBETmdkOXZRd09WU3JTekZLbG8wUmlIRjJMUVNIYUJHYzJMN1B3?=
 =?utf-8?B?MG8xUG5OSFROWlI5NkVKbTdOa3BvcWIwT1lTb0l3SDY3WW1zZ3RBUnA1V2RX?=
 =?utf-8?B?TGc0SHhqOW83MzFRS3RrSTVEbXZpMHBEbmFJRUpIRVIyR2hKdllzWnBtUVdU?=
 =?utf-8?B?dGNiMzN5ZjBYOUx1ZXZDWTNFWlpScG13VmczQ2ZYQUdhMktkbkV0U1pNUVB4?=
 =?utf-8?B?dExBYUVOU3JBQUVXS2lxaFlXZUlJUXRVT2JTQ2xuQnpRWWtwb0hMQ3BqZjhL?=
 =?utf-8?B?UEQwdHgrRURMblZvUklCQWl0dTRhSHRZaXNJeHY4cEEzVEMrKzRkTmIycE8w?=
 =?utf-8?B?Y2l2eS9YSXl6bFhjR3ZLdmVXb2U2Q0dTWGtvcVVDbXBOWmJiZE9WS0FpVlFp?=
 =?utf-8?B?Z0Vudng5UE1uK01BaTk0eEZTTndraFhyRW45ckxGZzNQcFNLS2Z6Y1JWT0xa?=
 =?utf-8?B?TXdzTTJ5V3U0NUtyT2NxSkkwS2Y2dDZFa0VaNHM5WW1abXVaV1JFL3Rhd20w?=
 =?utf-8?B?TjgybmJ6N091NG5veW5TdzJ1QURFbnphd1dkamJ0dFQwZTc3YUhXR2Fpdkxx?=
 =?utf-8?B?bVdZOE5mSzR1NExLSDdROW9jbEJibFRVVWRNZjl4NDFZTGJ1bE55R1grVkk4?=
 =?utf-8?B?aEZyZGl2WkI3dXV6SlNsWU0vNnJtS2I1K2dzUXF1VmJlWWxvdEVyTTZOblhv?=
 =?utf-8?B?U2NEL1ZlVFdjK1JJODgvTjFMVTVjSC9uQjRhSjd4b3RkZTUxS1lkR04vNXlL?=
 =?utf-8?B?ekxGMnlzMjhzWHh1cWR3T3Jta3UvRytCTE03T3RlR3RvT3RhdEVEd2I0eEtF?=
 =?utf-8?B?ck11ODBOSGRGY0xyRGZlSjlScUtrREY0RXdaNmsveCtHaDZYSWdIS1RHYWpN?=
 =?utf-8?B?YWJlRVVYdGpmaGcvYkxybTdSZmpDKzB4aHFOUTBWcjg3QmdyQjlrQTFjNXFU?=
 =?utf-8?B?eXdPNWREenR1bHozY1dFNm1POGl0NGh4UGNCYmFSWmhXU2EwTWNseUtWd1NI?=
 =?utf-8?B?ZUVQWVNJTVlPenNQOHJZOUx2cVJvcndzQVZJSTB1bzJwS3lrZU1YY3lYNlUv?=
 =?utf-8?B?MXY0L3E0NXlwUzhoSWt6STNoR0xETUpBdEFYVG9FM1dRYStOWDRiNkR6TFRQ?=
 =?utf-8?B?ZXRwNVp0OUJuMGVuN3l4RjlEOE8zWXlVZC9QYWFrUW1zT2lYOHZYd0JjcnVS?=
 =?utf-8?B?QjhoOC9BcFpCR0VOWTQxSlBjd2d1ZWlVMUhaekRWQW9SMW5EaExZODQ4MkVo?=
 =?utf-8?B?ZStHLzl3WHdUdERON0kvYnBXZGdiWE54bXBiTXQ2SW5sTjVDN2R1V0l3SmZR?=
 =?utf-8?B?eUw5REUvakQzazdxQlcxeXFOOHVpNGF2dldRbFhyUG1FM1VtalBRUGttc3ZW?=
 =?utf-8?B?dk9STndVYmJCcVpsdXUrQTg4Q050SWUwSlNjclZKY2p2KzA4MFRJcVlzTHdB?=
 =?utf-8?B?bGdFL0sybWdGa1hkZHV5N1pkL0pnbmRBQUxkU0hYQi9WUVV3bGFuRlFJSzdq?=
 =?utf-8?B?VmdBUE1sc2dSYXowUnFnREErTGx3NTBUMm5vMWgyeU9SQVRjWEVmb0RLWHc4?=
 =?utf-8?B?Vy9hZnh1Q2xzOU1EZEFxSFp5TFk0SExqNlpqRzVlNlVKN2JCMGdubFJPOEwx?=
 =?utf-8?B?ckt4WXRGUVU3bFRMQUZPd3ZUV1IxZlVnR0lvR3VWU2ZZMVFPdGRPZ1o4YTg0?=
 =?utf-8?B?Zk1odTdTQ1ZGMDJ4YlNTT2liWUlYTjlWU1pxVlVLUll2YkthMzRJcXBSaVRj?=
 =?utf-8?B?OVFtVVBNT2RBRVJJVmJwclNJLzUyemlrWWlLZllnSXJqNk43UEEzUnIrMndC?=
 =?utf-8?B?eE1HVXU4dUpOTmUzdmpyN2FTQmlvbU55QkhGekNORWNlMkFUa2tKV3ZPNjhX?=
 =?utf-8?B?bXhUU0J0QzFuWW9hakZ2MUZuNklaS2JCa2xDZFRoYklKdWxHQi9mMHJqYjBO?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcf878b-c2dd-41f5-7cdd-08dc7918c279
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 22:04:03.0083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6IvgTgNBQRM4kZR5DdQMOyh2nuoaLNu1z+DDFyBrtIk3aItluAfKakzOYfge4ys34EsnhfacBQEFPTixyJa7XoNousDHSucQi+ehWBmbdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

On 5/20/2024 14:50, Michal Wajdeczko wrote:
> On 20.05.2024 23:30, John Harrison wrote:
>> On 5/20/2024 14:23, Michal Wajdeczko wrote:
>>> The GuC firmware is loaded and initialized by the PF driver. Make
>>> sure VF drivers only perform permitted operations. For submission
>>> initialization, use number of GuC context IDs from self config.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
>>>    drivers/gpu/drm/xe/xe_guc.c         | 40 +++++++++++++++++++++++++++++
>>>    3 files changed, 59 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 378dde5ad4f9..bf4dfe301a71 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -408,6 +408,23 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>        return 0;
>>>    }
>>>    +/**
>>> + * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>> + * @gt: the &xe_gt
>>> + *
>>> + * This function is for VF use only.
>>> + *
>>> + * Return: number of GuC context IDs assigned to VF.
>>> + */
>>> +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>> +{
>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major ||
>>> gt->sriov.vf.guc_version.major);
>> I may be going blind but this says 'X || X'? Is the second term supposed
>> to say minor?
> oops, it's me blind (again)
>
>> Is there any need to check past the major version anyway?
>> Xe does not support legacy GuCs from before VF version 1.0.0. So if
>> major is zero, there is a problem.
> this is to make sure that we have completed the GuC handshake (and have
> negotiated major.minor != 0)
Sure, 0.0 is bad but 0.anything is also bad. And anything.0 is valid (if 
major is != 0). So simply asserting major !=0 is sufficient.

John.

>
>> John.
>>
>>> +    xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>> +
>>> +    return gt->sriov.vf.self_config.num_ctxs;
>>> +}
>>> +
>>>    static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32
>>> *minor)
>>>    {
>>>        u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 997cb7541036..d6d37b193d17 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -16,6 +16,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>>    int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>    int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>    +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>> +
>>>    void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct
>>> drm_printer *p);
>>>    void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct
>>> drm_printer *p);
>>>    void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct
>>> drm_printer *p);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 807ad53449e4..cec709a908c3 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -295,6 +295,23 @@ static int xe_guc_realloc_post_hwconfig(struct
>>> xe_guc *guc)
>>>        return 0;
>>>    }
>>>    +static int vf_guc_init(struct xe_guc *guc)
>>> +{
>>> +    int err;
>>> +
>>> +    xe_guc_comm_init_early(guc);
>>> +
>>> +    err = xe_guc_ct_init(&guc->ct);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    err = xe_guc_relay_init(&guc->relay);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    int xe_guc_init(struct xe_guc *guc)
>>>    {
>>>        struct xe_device *xe = guc_to_xe(guc);
>>> @@ -309,6 +326,13 @@ int xe_guc_init(struct xe_guc *guc)
>>>        if (!xe_uc_fw_is_enabled(&guc->fw))
>>>            return 0;
>>>    +    if (IS_SRIOV_VF(xe)) {
>>> +        ret = vf_guc_init(guc);
>>> +        if (ret)
>>> +            goto out;
>>> +        return 0;
>>> +    }
>>> +
>>>        ret = xe_guc_log_init(&guc->log);
>>>        if (ret)
>>>            goto out;
>>> @@ -342,6 +366,19 @@ int xe_guc_init(struct xe_guc *guc)
>>>        return ret;
>>>    }
>>>    +static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>> +{
>>> +    int err;
>>> +
>>> +    err = xe_guc_submit_init(guc,
>>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* XXX xe_guc_db_mgr_init not needed for now */
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    /**
>>>     * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
>>>     * @guc: The GuC object
>>> @@ -352,6 +389,9 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>    {
>>>        int ret;
>>>    +    if (IS_SRIOV_VF(guc_to_xe(guc)))
>>> +        return vf_guc_init_post_hwconfig(guc);
>>> +
>>>        ret = xe_guc_realloc_post_hwconfig(guc);
>>>        if (ret)
>>>            return ret;

