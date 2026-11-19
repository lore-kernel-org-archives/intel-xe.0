Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7A606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 05:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ewpat0fw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RD6iCH7F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357E10E508;
	Thu, 19 Nov 2026 05:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0D710E43C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 05:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795065153; x=1826601153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LrxOCopTETQVMSH6DyLZ2X4uj1V/hoTjdM8vFKio0iU=;
 b=ewpat0fwz2G1Qezebs5p792bkFSPFY0Ai8OR0bIkaMEUHrSJHXEpv71S
 1dPb61i6OozNGl3ngnWGu0+6GK5Knb+1pNUOxbj9Eg+/o7BYQfqTDB6B9
 mR9zp0IIPXsD1VRZDwJ6cSAk6GPkeIbV78Tv/lFSYuUktmzBKYbKFxLkJ
 3A8Ifs8d3yR+f6A36ojFOqP2CzWSVVC9uWqo2fS7DQP7ZzE6PEbSjB1B1
 avC6tOJdACc8+YgRWV9HMPcJVdRQkdf3a/cYGP8j5g6i+4/26H3b6QlPA
 U2CEbzAHSypkqc1i5hm5BLOvt+ZiXiH0jQZrBfxy+K6xvOucfP3L/1KaL g==;
X-CSE-ConnectionGUID: z0jSjjtHQgySGu5Ee02eDg==
X-CSE-MsgGUID: lQlsH7IRTmSi4UemsqPmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3928901"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3928901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:12:32 -0800
X-CSE-ConnectionGUID: FfNV/41ETYWJGQs+XQ5aiw==
X-CSE-MsgGUID: 4TkFyE3yRVqtNufVsn0/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10328511"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:12:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:12:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 21:12:31 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:12:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOz+VFXgWTee+x9lh8nT4XxzqXvkf8zg3DJpgWG/K4FGdj3ieJFkftxm9ZLwsMcY325CXUtn8mAIziPUiRNRq3En3aRP96KecrhPsHLlKxBbl/EOtIYPhZu36QTzaiTZ+vTrH1x7aR0Z1c/60wGE0cdpCeibxKoGb7MELwFjF+gw8vaHn+E4alGlZ+hb0L5I0eu+m65agpZoLg+RIFDismKa40SUDk0AUVQG/BboWjzDvHXTrJHXhDO8CVL015XTadTIszHqmlwlsbCInKXOn/X0qqemj2Nu8z/z36fE2UtF813iMtKGcohwMC6A6K+fL9PGGec9vsHJn/FoOp5q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J2WS64fSMUy180dQfR5grkm5SMQZ6O+/Gy97obvG7A=;
 b=wBqyc5PJFD6Dbyvje3VjsY1oQw6daYdmGmBSHbz6041HjU0B369Q4bG/SRYx29Tu0vQG9Obcfce3OUHDLJaANO2/+o5a3hLurJ0tF6tg8XtDsXpsSyyXboWAheqaYkHIt8XSKhzndFF28IGiZkqH4YC5rMz+nH/47IrXD7VyNJnfDZZoYMOzvwssHc7kibokNShZj+DscNJk4L+qwK6/5NETZUATXKVn2TeJqhkrgvrjIWg06stHmjv64Q3RYoOIeob4b/+XENk7XNMTgK6KuYTM3qN3MXTq76bzUKj+AexvAC+bSDC5A2O72szMKAzPYH8oNUzZ+7POEGw04bwoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J2WS64fSMUy180dQfR5grkm5SMQZ6O+/Gy97obvG7A=;
 b=RD6iCH7FSsMKNGFmosGLazpk7Y5JuUoHETm+3VYCkVxk5HH2HfIZn/0l284uIHKc5KO2VjwEQJEeBblEHphAVqSzfA+UZyHpfrure90wQxWCh8zdSk6YP/3K+pmdZQrLTBkkXaHA7TJNTO05v/qt5yzI6v82qx+lxI1R15b8zU8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 05:12:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 05:12:27 +0000
Message-ID: <4abcbc50-5014-4e1a-a22c-4ab9fac32a57@intel.com>
Date: Thu, 19 Nov 2026 10:42:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261118185015.3164387-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261118185015.3164387-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe0edd4-1593-43bc-c23b-08df45fbb43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|261102123227099003|56012099006|11063799006|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7HMu/tilZlVCrDuS2bA/sN/10/mKdwC9emJqZAFlN+vdju8UoFNuHvx3C2X60/5g9opL04N07TxJ3MaaGHGoqokxM/jmhz4l7mwLh6uSCD7IeFSCOELwG/6Ph/zJNJww1ycjQ802iCPBsPXblPaRnqFM0y72aGhAQAB0B59BM4QLNNgXs7Zfx79KAi5Z4GcFqQB0NmSlxPxc8kPL0L+gmXwY/bmlJk+iVZv0OVjYRwk0R2hk+eJMU1pZVEjBcV9SOHRxdHtAPEx6F2l4U4a+hOQN4RZSxzBTGEqruahzFx8eWnkDygl9lyPMFLrkZVoPdrKbArg/yLwqo1zAbDZgcC5zsW7CW/dt6l5zbJhGVbRRZmc08ZdnZGJ1c4m3m//JnRo8AH0sBavsZk6v0+g7IdnSAn7FP46L7nrySuXNbq5V3Wayj8PRhMcA96OA/NeO7kiq6ihJxHMbZg7zilWMQUymAk1MW8UvZsHIELVpQW02Pevo1c9FlRvBRCM+nEBGkOT6pFYaM6wUYEwIXeaI9CbYHxTg4PkpVjObAE0K+Mu9wzMRVi1QrslkA9kxlUq08HBw0TkhN/FJcLJ+a9THVhbPsrfWX0GfrolVEznxCSDcEqqPhRtU+JDK69Bayzn7aW4HXA5gyAghi5NYz58A0ISd6f8M6vCjXbcnZObf4yQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(261102123227099003)(56012099006)(11063799006)(18002099003)(261009223027099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2c5UnZWSEZtb2RoeEZIN2s2N1NiMEllc1Y1ZC8yM2pibVd1WWhEZGhhKy9y?=
 =?utf-8?B?MWxHaEVkRkhxY3diUXNocURWQ2xhOVlFME9pWmNtcllQcll3QXhJVFNGMWM2?=
 =?utf-8?B?dVBCUXdNSjgxMC8zdFVZdlQ0SlB0V2ErWEpHQjZka2dxR25jaGtTV0luTlRV?=
 =?utf-8?B?Z3RxWnZmalhUR3lXTzh3b3Bpd1loYXYxSDdlbEJmMHFvK0dXL0lBWHNJaGhp?=
 =?utf-8?B?QzJXcWlkdE1OTkd6NDhuZFgyNGVtVWcrQUI3bHdRRE5aaUE5cHQ1cFNSbVRK?=
 =?utf-8?B?WGFZKzEvcWthSUl4bFZJaGNHQlBFQTc4SWIrWjl2OWp1ZTRwRzNzNGV0eTd4?=
 =?utf-8?B?dGw1N3poUWdGYnoydUNrK2NGU2JKb1N0K2VuSlZBWG5NYkphMmhRaW1MK0Zu?=
 =?utf-8?B?d29PalJ5ekRFdy9Pc0lFaW5UUVQreFAwOXdwNDRuRm5XdVNEVnlWUFU3VWw0?=
 =?utf-8?B?MU9Bek5BdkRZVk5ZdFByRXNLS0Rub3lCZnozQ2Q5TjZOa1lncDVZK2xhc1Rz?=
 =?utf-8?B?ZkJkRzJsTHliSWI2UXpLS0hJTWxyMjFoVHhuSzFxTk5MZFRMaDBVbFlQeUJs?=
 =?utf-8?B?S3U1ZHAzNzZLRkJ3WHZwaDMvVWZLS2RkV0thT09VcVhxeFlWVEFhUEIrZklE?=
 =?utf-8?B?QWRWMVVRVjN3bHhqRFlwY2tMS1ZnQXdUMmpjNHVucFhxa2xKVFl5eTloNGhR?=
 =?utf-8?B?dTY0SC8vbUJ3a29LQS80QXJhVmtQUjFtS3hqQk45bzRYa3YrakNXTVJKL0Nj?=
 =?utf-8?B?U3Vqc0U4b0Q2Lzd6U3ZtR1hPNkNFRTFWYUo1QnFkQ2U4aVErS0sySUJRU3Rz?=
 =?utf-8?B?Qm13YUFFYWFuNFczSUoyZ3hCVVFZK3ZrU2tRTGdEek1KZCszcUhGemlnaHNH?=
 =?utf-8?B?eFNPdnEyK1RuVVMxZkNXUzVEOUYyOXZscC8vSnBFa3pFRDRlS2lpT3hpTHAv?=
 =?utf-8?B?Z1VZQ2pPQWN6NisvZ1NTSGo2WnpyYTdhQ1RFYndUbFBLbzQvSXV2Q0Rrajcz?=
 =?utf-8?B?ZXkvQzhpa1BzeTJHdFMveitZQnFiSlh0SXpHL0VqSXhabUZ5RUd3ejFFSVlM?=
 =?utf-8?B?Z0xUa0xtTFQ2WCtzaEtmeTE0RE1ZL2IxaDFmSjNjQ1hEUHUyRlhIZno3UG1S?=
 =?utf-8?B?THBOT3B1ZlZ0ejVGVUNqVUs3K1JiODBqSmtJL29EdXRhWlNLVTFWQ0hrWGRK?=
 =?utf-8?B?RldvWlZzT1BueVNEMSt0cytnZzA0NW15QTZYejVFQVdsS0gxOXowUGQ4TFAx?=
 =?utf-8?B?NkVUM0F1WjlpdUdnWmRPeU5NYk1EQzMwRGNJZzdsVHhMcVhGOG1kRGNqdFlr?=
 =?utf-8?B?d3V4RHExTjZPZFpjZHdOY3c3ekJyckJhbUxJcjI2WnZhN24yaTJwVHNiQ3Fz?=
 =?utf-8?B?S1VjTWNaVHpSa3BpSnRtZS90d2UrUUpGU2ZBVTRHaGZub0swRExkVVVtdXZ1?=
 =?utf-8?B?N0JYbHZHVUV2U1UxK2x5aE1wV0h6ZEJLWHBqZ1h3NEZmQkdUVEg1Qm5oMDRS?=
 =?utf-8?B?N3NTL253Qkx5ZVBkRWYyZE8yd3NUZWxITERVRHlZSVpUU0VqYWE0Qmo0QkhY?=
 =?utf-8?B?ME9HMEVvbzRXMWR5UFlYQ3I5MXNuS3J5MjFxSW43S2RtYWlxM0xOZnVjSEMv?=
 =?utf-8?B?R1NBY1NUdzZPYjdrTWFFSzJWSXg0dy9ueGh5bDAvMFRKOGZJQS9zMVZ6bmdz?=
 =?utf-8?B?cFQxa0owMnIzQUYyYUNlU05qVzEwclBwTDEvVTNhL0dGUGRLZEkvSEZNK1E5?=
 =?utf-8?B?T2lNL3ZTZ3NFdXp4K0JCOWxLc2diQ09tTUV6eGEyd1M5eTF6Qi9CMS82Z2xM?=
 =?utf-8?B?cGtyL1pFUVR2dmxkbWtDT2RMTEhnbzBqV2FWd1VaMkFRSzUvMDhqTlZ1U0dY?=
 =?utf-8?B?aThyS213RVdUY3M5Q25xdnNmWDVQNVBDc0l4UXh6cW5XdWJ4dFJsVDBSV3k3?=
 =?utf-8?B?UW05UmljY0x1b2J6SlZMYmhrNFRaS0xLOWgxU25ObjVwM3B3QzBkTURRYkpS?=
 =?utf-8?B?aXMxOGxRcXU5WVNWeG9vNzR4cWJIQTBwY0xlMmpycHV0bUx2cGpGRys0Qndv?=
 =?utf-8?B?OGlQZnRIY1dnS1EwRXhZZ2V4b1VyOW80cXdGWmlsTXZ1eDIvTm5oaG41dUJn?=
 =?utf-8?B?VE02cnNsV2ZXeS9rckNoeUtmcEErV0Fwb3lBVmtZSTc0YUtNbklnblgvVmh4?=
 =?utf-8?B?MWMxNDNQdzhTR3h3R1RSU0RhVUFxR25rZmMwamc2czdUS1N4aEttOHlpbTRM?=
 =?utf-8?B?akJJbmU1SFNjclliSEsvcFVJL05uVlgxcUxJczVFOTZPR0lpYThHaGp1bHZV?=
 =?utf-8?B?VG1taU1GUzZiRnFuUy90dXpDL0drb0l4Rk5YU05SUUIrNEhtQnF6QT09?=
X-Exchange-RoutingPolicyChecked: heEFsmTOk6o9R+0Ykx7F7Hc0se8pC3U2fw14V11xkNmk2Ehinf1vFLG4G4Onl7N92VIMFkWD8GdRHvPJmEB8G+6ckRRS9hdjfLOZjdWM7wmxH1p3sqbfm1hNw9Bhhd6n7h8m+QK0aPuG73hApHxhvN9/EUnIWaAOYoOGBEsY7jZ4CS1ghZS0uI2tq0qIWTgZdkiZpUvBwrQnssz3+T39S+RebUc/k7c6O+Hbh8+Jvly1T7kAUZPN+8M80PwroFY8N/fR1HVtasozD8H3qldMMFRiE5XJmF4zIYiX/GPJ7+/fK4lniE9xhcDeWZOj52o+B+uVq4wVRyQLuDq4F10ISg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe0edd4-1593-43bc-c23b-08df45fbb43d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 05:12:27.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iyfm1z/3wzAkEJ2MLrxdsO1r4CawupfnNEZG5fgZnrM5SSYDv50zq1Bz/0B/0g0GJXYexvRIkBgPkH3bjjFzPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 00:20, Sk Anirban wrote:
> Stop traversing the aux info linked list when an entry references
> itself, preventing an endless loop and soft lockup during probe.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 91a0680e449b..34d39e68ff36 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -172,8 +172,14 @@ static void populate_survivability_info(struct xe_device *xe)
>   	if (reg_value & AUXINFO_SUPPORT) {
>   		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>   		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
> -		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
> +		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id])) {
>   			set_survivability_info(mmio, info, id);
> +			if (REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]) == id) {

Thanks for fixing this. you can add the fixes tag
How about bitmask ? If there is a bug in fw where 3->5 ->3. We would be 
stuck in loop again.


> +				xe_warn(xe, "survivability: %s points to itself, stopping aux info walk\n",
> +					reg_map[id]);
> +				break;
> +			}
> +		}
>   	}
>   }
>   
