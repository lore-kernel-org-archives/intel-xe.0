Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C81606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDHvnel1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KmjMbQuE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935F11225D;
	Thu, 19 Nov 2026 10:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BE811224A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795083348; x=1826619348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QklFZitbTkgI3f/H1VAxyUSRUnXpNVEcR1jqZUzrN0s=;
 b=EDHvnel1SEZcK3OuDBjj8APnj6WK9gbU2LOUumSxK/Pb3F58b8zQ9DlR
 4RUbblWJmsQuq7jbWZZKYEV+Iyvr5v/Zu61H/g7rXqeag7C5BUxIrqDu4
 w+fNFI2RUxUEAEdtwQjZpqIwVcSpiIT1Vm7M8ns95js90m6uE9LqJaoSf
 IIzPFAOJtKJ58vA2SLkhWVds4ZUXf2kDqCjcsxLYjIkVIraBmmr6dTX7l
 A/4LdKTYK/YwvR76006UURowSF1tPfsezxA48UKTGBwT+2OE/gbqoHsi4
 vcJcljruSu8dW9fsB7s2XSSx4kbP83QXcRnvLTqefFZGNbRMPQUD4EitN Q==;
X-CSE-ConnectionGUID: 5DA17PjZRjOTetqxYs6/Dg==
X-CSE-MsgGUID: tgUOsyW4Qa21SshAw7oTqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3826102"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3826102"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:15:48 -0800
X-CSE-ConnectionGUID: b3XwdmOuQsqbtiJhPEly0w==
X-CSE-MsgGUID: C+FACSO7QdKpkxRjw/FJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="12351125"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:15:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:15:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 02:15:47 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWrB/wdNFl2hGK+5yZqkGE6VpgXojCfCMIdrRsbLy6F7vkRA2u1V23kt191IQdxUVs98K6WSwVuKxtLxtIFr7ROMJ3M8keYAZ3Sl2NQLzz53V8tfYywfEd5lGVy9TmOYlxvKOLDl9PsKCJHwE1fRv29S1MamONCbra6HLyYwImq9Z6lAGlvjg+KzKOoLp5+dyahGZkEeaFhAHWKbb85a0XzF/lgLtXI3witnndWmBvYgM1b3dVV7IcEazAVCn7Qc2JmX8LlvAVHOmRNlQUuT4YZDXxMOMJ6gRMF7y8zSlrCCuRbC8tNt64EKi+k2U67WuFyy4KuTm87hRXBTxEHgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nzWYRSWisCvBKosrduZ66EqAs1U99vlcbO00pbtKrc=;
 b=svPMUwYWKW/2LKOEXbWKnTqUj5DPaR7TJvApFBWcCboFSmMysguixpbIFmNfbjO9eBZWRujmJOcJr6/6rRd7BhH33wCT4DIsUi+ybjo2+n53h4r5GTDv0RXV8Ux3cVMGrSRv5iXuk5CHZIYT3m7QEFbf4JUc1S5XhGhbwVdUFoOa00N6rN1Dhy3B3YRvPTdG8GHEaHnbCagOqv4nHkJcFsZcHqfSzxuw8r/+O17Cl7D7Em86wch+zGHESV+8CVw2r24RPrN3a3rqxpQ1IVfanaTp7DOA48dVW1Ja4DMCEOLthceE5+DkyyQp4w+FuGi1ybbmEXb4+UuDrMaBZ2Qu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nzWYRSWisCvBKosrduZ66EqAs1U99vlcbO00pbtKrc=;
 b=KmjMbQuEAhLpUP24erM18p5UTKEnA0XVc+AS9ztvj8kml+inZ8uin/3byUqV2hfC8eD1k/nh04Jdg4S9Ki0RA0d5Ed8kywmCgLbPN7SJwrSD6YMrXnVyEke5N6nQe0s5NpFPn7JaoZnqTQuqS01+b6O0n+PjQeDUsIn+W39lQwk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA4PR11MB405320.namprd11.prod.outlook.com (2603:10b6:207:14b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 10:15:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Thu, 19 Nov 2026
 10:15:45 +0000
Date: Thu, 19 Nov 2026 11:15:41 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "FNU
 VISHWANATHA" <fnu.vishwanatha@intel.com>
CC: FNU VISHWANATHA <fnu.vishwanatha@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Restore PF config before resuming submission
 after GT reset
Message-ID: <20261119101541.353uulqe2w2j3zx5@intel.com>
References: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
 <20261118235638.295939-1-fnu.vishwanatha@intel.com>
 <f6f0bf18-de0a-4953-af31-d13436121d0b@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6f0bf18-de0a-4953-af31-d13436121d0b@intel.com>
X-ClientProxiedBy: VIVP296CA0111.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA4PR11MB405320:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da5f37b-0aaa-4332-0de3-08df462612e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6J92hD/J9gi0TlvJiu3t+j1GaYZj7MehexlQqIeGdQZJLya43MkJAPTep7Uz2ogxXyyB104VbNT98gcGPGATNm62YZgx2fpqWmZa1OyTmI3kscHpygIlepSvK22I6jnT3DnS51VDXezcAtz6uC1OaZ0i/1XTnNOxD3EWTgbvVzgd0vZapLMgN+JkpN9nXXXRVX9r+jwbupz+0ptlA38AllDPllLOqGw85vBWKe7TTwuPa2wQJrcJEbiPGMzeJB69Yn/4SCFGmx5Ruf5rWTDkG/gK3iais+f4ef/d7UQetzFQ4cMlqdsENTMDGTraiDeqXcPiRNjREvvoG7yQOeuMO/SRTpR2spT/Mi/ZRZp0DmbZwT0TJPD9ccOwtlB8cG6ppkGjf+0L8+rAHDCdJNDUWfAmeloz1hp8wxxrbw6gAQuOM0NMY7kuhulIik5U+FPO+QTyY1uQ7u9nJabsAh+ao1VOjqEGNCPgcKUjs6tBRTFMAdhmB7IRx+dIk5EJiLngmK8oprXveWa+5ZgMN6uBvjZZvughK1OOBA92U3+/aUF3HF98Jn7xYD3mZofm29iV6dP9zTXvYGOYmyP5XIXD+cFUcT7ssxRUADg+Y6MrTDdNITkfgJHYw9QibzU7JIgS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1PRE9Pa00xd2ZGQ3c4SFFHb2NkeHBsTTlWTkNRam9RbktZU2w5MFFZMkhl?=
 =?utf-8?B?M1l4SFcyV2VkM2FuS0szME5mT05JMXRXbVhZcUVOK3o3NGJqZWxsOVVGd1JU?=
 =?utf-8?B?TVFCVmRTYUxreWt6MVA1NWRpUzlZcHNTc2ZDd0VRRjEvSTFrTDdyUjdzYTVO?=
 =?utf-8?B?NlozM3plN1NjYjdFNEdJZGRNYTJKaGJqaXovaW5BdGdjWTgwZzVRaE5ybVFk?=
 =?utf-8?B?MFFJUGpjYWNkREt1VHI1UHc3M1hoTUlSNEhsMkMzbDMwSi8xS2gyMjJEUXc4?=
 =?utf-8?B?OW9pUFY5cEVGa0NVaThKcXdmcy9ydHdyQ0tiNFZiaWh0Umg2b09BQTZ5ejkx?=
 =?utf-8?B?ejQ0TUxoK0pZWmZwT2U3bjA3UzhNUFZENmhqT3c2VTdVZ1BTR3hUd2dtcE5D?=
 =?utf-8?B?MUJCV2VpZEJPblV1REJ5Rm1peGU4UmcyYjlCSG5BcnU3Zm0zWmpWS3U0SkJY?=
 =?utf-8?B?TElVckhkeTdjYWE5b2hQczU2d1FsWlFNMm02bmNyakd2YUQ0UGhDSExzMXd0?=
 =?utf-8?B?d1NPNmNHV3NtQUM1WkFiZkZ2N09oUzFHSHFSQnVOcnJnWG1qWG5IUEY4S2Jj?=
 =?utf-8?B?eGptK2NsTkhvRUhzdXBkZ2tHbk5XZThxZmlPWjU2V0F6WkRuRjVPVUk4M3hp?=
 =?utf-8?B?TFNnUXdKSUFSUXBHWjRMNHYyUjNBb0MwVFJwTml5SDJRZXN4V0dLZm5QaGRZ?=
 =?utf-8?B?RzdIS0tvMW5qWVZmQ2lMYnptMllLR0ZwU014UDI4QnY4NHlGeDE0TFpJdElL?=
 =?utf-8?B?SFFZSGVleGxMR0NkbHRFZm5yUHlScW9IWE04VE9TM3ZzOFJORkFBeTdWU05B?=
 =?utf-8?B?WVdMUHdxSHVrcUgzL3Y5Q2RBSHluNWd3R3VQajhOOG1qSnVORVRMWVBMZHNi?=
 =?utf-8?B?Q3pkQ0plNHhnTUU1UFlBekpDWjU4c2l0a3c1dlBjU01PSFpPbzNCOXlXdnlN?=
 =?utf-8?B?bVZNRFVmUWN5KzJFN1ljWklVT3FXZlYva0hDOWkvV1A0bFkzYXNBWXZnT0Qw?=
 =?utf-8?B?M1BiekVTcVlUR1ExbWxtbkliSGVFdWR2Z2lqMjh6czgraGFBN2tTSlRKMmZx?=
 =?utf-8?B?QjdkRnpMcmZXYmRibXYydlVHLzhJZ0dZd3pIWHJkWmREelhyY3dBcExkalds?=
 =?utf-8?B?bURhUHkySExaVWU5VjBlR0ZOdEM1SkpLU01wUHZWWlhrdHRTdXlsU01ONlpB?=
 =?utf-8?B?RGxHRnFyK1VDeHN1aEpQNkVWc3JRVHpEeWl6N25weDhiOTlHNHhoZ1VnSkg4?=
 =?utf-8?B?b1ZtVWNZYVVKbDFJa3FiMUJrOXhmK2R0c3FZNFVnNTRFMWl4blByemJpdjY1?=
 =?utf-8?B?eFM2Q1VqWVkyWjRGTTg4eEVUaGdFc3Roc05pNWpOU285SG1SQ2t0eER4anNt?=
 =?utf-8?B?SmdBWG94REtBTXRyNGYzSlBBaVVmWXR4RkF1Z2phbVRPV21rL1ZZNS93bmND?=
 =?utf-8?B?c1BTMmszcUp2dytxdGV6dDlIblYyNUVzbDlzNGhlYS9KOGg4eTB1ZmQyc1h4?=
 =?utf-8?B?N3IrNE5HTkRCVTZOb01peXNXdnUzd04rdEVxdm1JOFkvRXNTL0VwUCtCazk3?=
 =?utf-8?B?bm0xVTVZcW9uZmpWMWZBSFh5NDczRnNMZ0lWdXF0WkVkdVVQTGNEMkVNb3NB?=
 =?utf-8?B?dFA4emFMOVBVbGlGVGI3aExJYkQzUDVmWCt1NGJDb3VsSUx1Y09HdkNLdHcz?=
 =?utf-8?B?RllGbkZvMi9EZm96c0JzMEpKYlFqaklpMTNaWU1QZnkxZGxCcmwwbUs5WGg4?=
 =?utf-8?B?RGQ2ZWtIWExFNitZYnBqZDd0bUNoa2VuaENsend2SVBxcUsybnVSdER6cU5w?=
 =?utf-8?B?b0hETUpYOWZ5NjdXaDhIbjRKVU1wZ3ozMDlGWEZhcVQ0SzltV1lMQ3ZuSHhn?=
 =?utf-8?B?d25sMThMbjhiS3lEdTBwWUt2MXdrUlZtOHE0UElXTXpOUnBxRGw5ODRUTjZD?=
 =?utf-8?B?YmhVZGtxZWNmRUlsdW9yK1FPZ1ljRjU5VDZLVDFBVE85dGZyTjF0N21nR1FN?=
 =?utf-8?B?RFJlOWVPRm43OHB2RXdhZlRJN09rZW5nVDhXbGd1djNWMnBxcm1qRjVnei9T?=
 =?utf-8?B?ZDd6bDhXKzJLK0k0dU5qV2pSUzQxWkJUbzJHM0REZ202VE1UVEtnZ0dCOWlH?=
 =?utf-8?B?Q0VBVk5RUTJtVUY3MC9Vb1JSdzc4eGpXdXlVQ0QwVU9sUG1hNlhQTFcyR25W?=
 =?utf-8?B?ODZackMyUERWTU51dDhYaTdjcEFpRGF4VTM1Y1c4bm9LMllBcG5vNVBQdDJK?=
 =?utf-8?B?OGFMN0puQWJZbEx4NXYyQUNmL0k4dWxkVzQ3akpYT1FGbmRzbFdOSGtlaU1M?=
 =?utf-8?B?bWx2YmsrTjA0bHVoQ1g4MTRnYjBFdWZ5YkRwU1AxbEJ1cDY3T1lkeEdBeGQy?=
 =?utf-8?Q?Y2hvIrHLqmqINxA4=3D?=
X-Exchange-RoutingPolicyChecked: M4Smkyp3hlMsyYbiNbDjvBKiKuksI0lateCv/jZ0CIDGQeXE3AcK0SaOhVYAB8i0AXNR+Qz+g0/NtElqtNhvE5GUUN1WvqkAqR0N5R5EJRUelxOGWE2ln2QFEEwy+cr4Eblf3MoI0wOXmjjZkkR4qd8uuNbNBiYx/v35Pi/loa82pDNMpfZh9U4A01WKtjzRBvAlk9rYhJUjNxooYlGsYV9NQ4XjAJmTht2Gyaf8Oo4/gtZKcJe9DN4fLHX8sFzIO4ervqE9D+qGscZIpBKmJ2GuVkk9HZ2EDgcx8nverKd+oWm+PySK6m3jrP3bszxLZgvNzzS3Etc7EQSo/2GCeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da5f37b-0aaa-4332-0de3-08df462612e8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:15:45.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsrFO9K1EUakj3Ukfb3INBXjs5FLEjvFXAxXYPAJbpsLywnDsLsvn/aufaFBkx6OQ7h2qlQ9ryjctH84wMQ7VDewWufo+IrHa48qqdDGaXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB405320
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com> wrote on śro [2026-lis-18 17:23:24 -0800]:
> The GuC should never silently drop submissions, so we might have a GuC bug
> here. Even if the driver is doing the wrong thing, the GuC should at least
> return an error to inform us.
> I'll loop in one of the GuC devs and see if they have any feedback.
> 
> Daniele


> 
> On 11/18/2026 3:56 PM, FNU VISHWANATHA wrote:
> > Adding Daniele and Tomasz to Cc for review, together with Piotr and
> > Matthew. The patch moves the PF configuration restore in do_gt_restart()
> > ahead of xe_uc_start() after a GT reset.
> > 
> > Patchwork: https://patchwork.freedesktop.org/series/178984/
> > 
> > Thanks,
> > Vishwanatha


Hi Vishwanatha,

Thanks for the patch, but I don't think we can take it as is.

xe_gt_sriov_pf_config_restart() takes the PF master mutex. This mutex
is also held during VF LMEM provisioning and sanitization, where we
allocate memory and wait for migrate fences. That is why commit
a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker") moved
this work out of the GT reset path. Calling it again before
xe_uc_start() can deadlock, as described in the Sashiko review.

Also, this pushes the configs before the VGT policies are restored,
but encode_config_sched() expects the policies to be already there.

I'm also not sure about the root cause. The default PF config (no
EQ/PT limits) is the same as what GuC uses in native mode, so it
should not stop dispatch by itself. Could you share more details:
platform, GuC version, were VFs enabled, was a scheduler groups mode
active, and GuC logs from the window after the reset? I agree with
Daniele that we should get GuC team input first.

Thanks,
Piotr
> 

-- 
