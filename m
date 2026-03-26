Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F9210A88EF
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501BF10E034;
	Thu, 26 Mar 2026 17:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+ipYRFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC9F10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 17:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774546740; x=1806082740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q5dEcy/kPa8j0w6/vSalq0KOkKArtZOcGWmMSYMTy+8=;
 b=c+ipYRFjL2h0RbzLRpFrnHRLxXQSsncZj0g/uIuy1hbzB7hPz46AghXH
 iv66F6YX3HmFkzsBN/vTCeLaPfn6ME4ZaoMnEGDCSrRQRbaHN673o6MLX
 LxawyjP0aB/fFQoVNt8ZER4F2AqV9YFWWGmMbr0jyF8TTxF4MDUhntVdN
 XSoH/ZALpQG3U0jooElevyxkuZZreoztTAu/bS9KsrWDudA5t4EpKFuQa
 BpmGoH+VR1ylkBDaMtk/wNgJJuAu0+j4vebI9FutVRlbXzJc60sBPwqgh
 X4/6hNhzfcEToWHt7j4PtgTyipc5G+fRfMeCufon/dP4fMmPBX38Tvnan A==;
X-CSE-ConnectionGUID: VZEt2S6uSUKyd3+RYpVJQw==
X-CSE-MsgGUID: gTSBB+P6TE+93tCYSxq+vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78211290"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78211290"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:38:56 -0700
X-CSE-ConnectionGUID: 6i5KaYXJSUKqlYoRZhGt2Q==
X-CSE-MsgGUID: IbaltyxHSquNxSnofFqacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225075938"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:38:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:38:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 10:38:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OboFQWXlnYkZXOdSEm7Wnq/Z2XmwTQqN1qDMag8D1vTWH5l3pmCFVynsppH31hU6ZabaItEArHb/4D0umAotxfzUQ7b/m7EhTAxq6Ha/7+OtFNsX6B2hZctdeoi33JuCQNhCHNe3CXKFNfi8W0goP7Fqu7hadUFMObgqJGrRZcI4aNBlfuZTrwcY6yezME2pAaBOKx90Hp4OqLgKLk5VAE7r6XXa/pL1nOx5nas2vcedSEiuIqBwwjRBZtrY5pvKAdddtmahWgQ8F/InbqLYh05wE0GDEsw2ZMM4hAoR9YBH+Y9U3t3IXZ1CBqNKa1kEH01Gsy2QLnY3U5FylP4Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1/9/8trCJT8bVTp88pYBQCktS/e30iZAPqh3gzhXMQ=;
 b=InEmoH/QyXLNAlrdkZZ+h5ga5dp5qEl+idlPGlHtH0SlBdUnezgr86qc1bhEQs/clabcyF5SdDfV3YU5aOHTB0Lt8LXjnhgA3SCvkya18hPK2nQuGb38OZPcAj+zviZQ+W45+1SB9CJxTXqo8OtgFQEWHMGAL7UAO/mMwKjtmpxX0F4AtH14NTM93y9weG5d854R6r1ypY5s94gqx/Imux0od0mOJhWuEu3rQtutICZ4hApC0Ayv+Lxy14+JLtTmjsnHEDcbARcZ0pC4Vwxrcrh1Qxg8vzGh3KDEdQw7BcON0kn9QlPfOMyw6sNlzl0AQW+2lMTHbJtOg16Ge6NbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 17:38:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 17:38:51 +0000
Date: Thu, 26 Mar 2026 10:38:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Message-ID: <acVvKLirUu1jAnOv@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-15-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325120030.510480-15-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0369.namprd04.prod.outlook.com
 (2603:10b6:303:81::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b0247b-6eff-45c9-3d73-08de8b5e8b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ssF//EmYXMdTtd0Y/YVoKUp6U52G4GVTZlEF0uwdfHiMPX7/JEaiBq1JXXf6Ie2PuB6nicwd4E+vC7vAQtjI53nhzbrEO5YUDotdhpIG34Ha73wtZpbtrZ07Jx8xf4AZfc+/KWAPYdpWedFWjF364EX2VnvcePDeygoyXpS33Bnqr22OWwBTV0SxFm8BsG1Jv/WkThiXE/hz3ntIBpPxJZf96dY0U+xjthVFeAa+huOup+5yysX/IDaDqg9qEp4R9p8UJFybA5nrXPjdAGhxKvO0/JtOG6xsrwSYNu765pwN418HwcathuacIqG8xcTPbP8ObjQcNgYs9ZMNyHnsaG1HE1y8vlReJeUz2TH0mS5ZD/wdCAUnszI6JtxLG167pGZrTC7w7RY7+9MzeeIDL1BwU6WvFUdkqO3vWgdHSZTieYQm8Hmmn/hKXBIjQ5r7/JZGdBzKUPENZRvy4prpfXiF3lQkDsgyKJN1s90hDLAsQ0ylGV0+WygmUrvs9hctU/jD79bRhEHuNVnUCRqvr6A9b9D70tGZ6SCfKtSpidtsZi6uKENaEyRjM38aIvlAYIVnUOC5DxBYRQaBo857PpK+UKpS8Ydw2whSXgDWGdz1/RYxUlzG5zSStQIFHG+XJWcqB/uQGJUgyDKmAfe33IbKqr/lMUeVBP56etljz1EjFSrzJUs37AOaPIrvUAH6Wt6A2cAiNuTCu6QvF0qVo+F4VG3qy9W1LVgF+QTULSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZ3T0dYYWJlbHdEUU1tbGdXWmd6aXpDWnlmMkZIb0xtLzgxZlRIYXcwSkE1?=
 =?utf-8?B?ZStLWXJWNk91STlOajNPQ2lpK2ZmbmlELzlRdW5CM0JFVzJWSUVxRkdWZ01z?=
 =?utf-8?B?eUhTVXRZMjlBdmxjYUg3WXpVUXhMbHRrc2FocGlUajB0SjFlWUgxWDdJQXpx?=
 =?utf-8?B?cStLbnVVS1d6RURqVmlIWi8rWU8zTXVjbWFNUEJROHVYNHNhWGpzekU0elRj?=
 =?utf-8?B?QjJtMTE2aGpsR0tyWndlYnpXRXJXb0ZqZzFJYnpxUG95czFGZThhV0pjQWJN?=
 =?utf-8?B?U1hacTlKVFNidWtFSitHbjF0Qmo1RU1hdGwzN052enduL0RNeTM1M2VoZm1l?=
 =?utf-8?B?bDlFcmxRUHZ0M0Vjc0FKd0ZmZm44b1c4Q1lRb3VkSGY4SlcrOUV1cHNFNkpO?=
 =?utf-8?B?VUVWcXl6NStqNkd6SnpYV3RNZC95VzVlRnVSSC96NmRmRWFQN2tCUFJubGIv?=
 =?utf-8?B?bnJMV2toNjllNWV0VVBaOHJtOGpDVHUrNm1kWER6SHR3MVNxSG43ZmlnNDBa?=
 =?utf-8?B?OVNtbnFTb0NzdGMycUVrT3lkZkxXTFIzWHJxaU9HWHNCanE1a0ltMTdFMmNv?=
 =?utf-8?B?ejhkbHczZkQ0OVQrY1ZjWWRrWGhmcGs0NmxaY2p2ZGorajRkT2Rkend4a2JM?=
 =?utf-8?B?eityNm5GYWZUZ1dPUmJqc08zY2tOOXJQSlI3UkFYWlBYcUV1c2xYcEhvV2Q4?=
 =?utf-8?B?TjlYRGd3MzAxREVoOEV3eUVwaGJSUVRCWHlBYUJ2MjZVQXgxK0xSUFhrUWxr?=
 =?utf-8?B?VHhMZjFwTnFpQ0IreDczb0E3QzJxSjBJdk9PcFpRaXA3L0ZHVUNMVjRnWkVM?=
 =?utf-8?B?b0NCQTN5YzlXb1ZSdythc0dNNWlFU0JERGlVSmYybkVhbEhzSTJCNDFqUldJ?=
 =?utf-8?B?bWUrU0FxQ1ZkWWh3V0U2KzhXaVFDVlNHd3UxR2sxdVdqeElPS1UzYTNsZVJQ?=
 =?utf-8?B?SW1YakR5NHo4azMxbUhUNnc3RGxpWWd5TFVldlpBQWNkVDM1cFpsd1doVlhq?=
 =?utf-8?B?ZHQ1aHJ3b0c0QzB6TVFKODZDbngrdHN3Rnp5MjFTampuS1dDQnZmVTJVc216?=
 =?utf-8?B?KzhhMkw0LzN3bW9YVU1TV2JkSVU1L1JObnkxYjN0ajE4WG5iVk1QdndQb2x6?=
 =?utf-8?B?NnBWZ2creXRtRDlRc0NsQ1hERnNIK1lVT3crellFak0wcldRcERtTCs3VEI4?=
 =?utf-8?B?VjdDVVNnZ2JUWitmRVJLakJ0dFBaSWorWU43cVBpNW0yUU1mRXQ5WVJndW9m?=
 =?utf-8?B?SUVXZzFpSDVPQTVkazc4cUFheE9EdVpMQldHN3NZbVZKai9mMDNDOU9MY1RU?=
 =?utf-8?B?cmtSNWhYUDFlNE5BdGRSdHZXSzE1QlNkWVZNZFFiYlU3ODZVT3ByRWFZbk9p?=
 =?utf-8?B?VDRqMndwZFQvNFNVR1Q4cDRjZlZreGhQaWhmUDZQdy84Qm1zbmNMRnVKYXEw?=
 =?utf-8?B?Y2dLUjRiMndhYkpubFJJQmFQL0c0Mk9oQWp6MjVhN1V5NndSaWNWOHI5T3Fu?=
 =?utf-8?B?bmxZS3ZlZ3FCeGwxK1RXcm4wOVZ2a2gxbElMWkZvY1Z6QVZHUWFlQi9sUGVJ?=
 =?utf-8?B?SDZTVG9zNEkvWWZETktPOVZsTGxUeVAzUXlLamdRM1lqZXN3K3pJanNFbXZZ?=
 =?utf-8?B?aHozVFhQN1NPOGtTSnRmRDhPY3RLUmFGSVBNZlozSGxNbnFrSUVFVGtRRnpu?=
 =?utf-8?B?bHNESnpRc3U0Z0dIMHlFQ0hnbFNjZHB4SVhQcHBacTkzME1ob3ErNWFGdThq?=
 =?utf-8?B?bXJUU0h6NXFZSDBHZFJ4YXBWalZhTWNsamk2VlFFdk1VQTZPVWhyTElXN0RO?=
 =?utf-8?B?ZVB4UEs5VkJwUThWS0ZLSnFIdm5ETGw3aURQdGdoR1pYMzhNaEJhTDlPY2FT?=
 =?utf-8?B?N0YxNnRUeEJSOStpWGxnS2tYK2U0RDhFb0dwY0M4bkE4RVFCWEhYeHJ0cmRB?=
 =?utf-8?B?bmkxRzNJbkVYL3o3Qm9Ja0hZNkdaRWhtRG8vaUlRelBqUGs4RkdEMHpHRUto?=
 =?utf-8?B?R2hIelRzSzBTQkdmbTZyOGJhczV6UEVtaXBybnY2NGliZWdSeWFKazdIOHor?=
 =?utf-8?B?QjBnMW10QXNNUHFGaFk3U20vTlpQUXV1VW1rZUY5U0tuTXZsSGdWemJackxL?=
 =?utf-8?B?MmVaenJMTlljR0ZqeW9JK25vQldocVBTdG5rWTNkYzE0d1Mxd0F3ZFVleEpt?=
 =?utf-8?B?UDVGMERHZUNzU0lvMWZweExDcytlUGVjZmFDTGRGRjN1TytRQzlNUmVrNDVa?=
 =?utf-8?B?dFN4U2JsVGg3K1dIbWNrOTNJVHNQdVprNEg0aUFkaU5WU0pQUVRrR09aNng2?=
 =?utf-8?B?T1pWVzJwNmZUdHFzT0x2TGFSSVc4bDluYmNFMkdPMk1xL1ROeGdXT0JTNWMv?=
 =?utf-8?Q?+6cNjqCUuq8Avitx2gFyZAmYAU8aqbZjCKe10?=
X-Exchange-RoutingPolicyChecked: u+RBrk9h5Lfof4oNTo2xxI8qQ6GscdDhvlSG6bAryL8EWn1gENIt9VTtuSX/St/Ehf5YVU9zNJ/fxD0KZTs810mGLrsAam//v5mjgAtAfS+S2rTigs1lgCpu9CvxdP9/kLuljjpGoGV4hoYALGkoUsEAnsYWdHB19SmE2Y25xagte43MhXfCaafNarDBi6vXHt7FmK+zN2f5BAVQiGGu7JoomMmaNZ/O2pdlW9Ex9lW0ltDlcFdW3GHGpGD2uLfewwxuJmGFNEHMxJ/auoRqi6DWe42Qcs9YjQIO8NvYoc9uIxrXbqzxhD5uzIQNyi6YDUAPpXtF60hHOxlC/6oJAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b0247b-6eff-45c9-3d73-08de8b5e8b42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:38:51.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juUpV35tk0qHwlQlmD4sp3nhK3NQWnrlrtZkpxeJ2cgRKzojCGmgYD/QxSL1+flkuOLD/H74I1g/nSzIfkSVAV60XvmdrU96gwMz2+HnH1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

On Wed, Mar 25, 2026 at 05:00:33AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add resume handling for System Controller to support system (S3/S4) and
>runtime power management transitions.
>
>On resume, restore SoC remapper configuration and mailbox interface to
>re‑establish communication with firmware.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v10: (Riana, Umesh)
>- Added sysctrl suspend/resume handling
>
>v11: (Badal)
>- Remove explicit SoC remapper disable on suspend
>
>v12: (Badal)
>- Drop empty sysctrl suspend handler
>---
> drivers/gpu/drm/xe/xe_pm.c      |  6 ++++++
> drivers/gpu/drm/xe/xe_sysctrl.c | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
> 3 files changed, 29 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 01185f10a883..d4672eb07476 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -26,6 +26,7 @@
> #include "xe_pcode.h"
> #include "xe_pxp.h"
> #include "xe_sriov_vf_ccs.h"
>+#include "xe_sysctrl.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
> #include "xe_wa.h"
>@@ -259,6 +260,8 @@ int xe_pm_resume(struct xe_device *xe)
>
> 	xe_i2c_pm_resume(xe, true);
>
>+	xe_sysctrl_pm_resume(xe);
>+
> 	xe_irq_resume(xe);
>
> 	for_each_gt(gt, xe, id) {
>@@ -670,6 +673,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>
> 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>
>+	if (xe->d3cold.allowed)
>+		xe_sysctrl_pm_resume(xe);
>+
> 	xe_irq_resume(xe);
>
> 	for_each_gt(gt, xe, id) {
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 84e3b70043a1..96a961d470ef 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -82,3 +82,25 @@ int xe_sysctrl_init(struct xe_device *xe)
>
> 	return 0;
> }
>+
>+/**
>+ * xe_sysctrl_pm_resume() - System Controller resume handler
>+ * @xe: xe device instance
>+ *
>+ * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
>+ * Restores SoC remapper configuration and reinitializes mailbox interface.
>+ */
>+void xe_sysctrl_pm_resume(struct xe_device *xe)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+
>+	if (!xe->info.has_sysctrl)
>+		return;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return;

Same here - drop the VF check once you modify has_sysctrl in 
xe_info_init().

Umesh

>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	xe_sysctrl_mailbox_init(sc);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index d5d8735038ae..f3b0f3716b2f 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -17,5 +17,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> }
>
> int xe_sysctrl_init(struct xe_device *xe);
>+void xe_sysctrl_pm_resume(struct xe_device *xe);
>
> #endif
>-- 
>2.43.0
>
