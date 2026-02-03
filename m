Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52345E83043
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 03:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C8210E4E6;
	Tue,  3 Feb 2026 03:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WN8AE5zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B350D10E4E6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 03:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090414; x=1801626414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8YaMS37sW1zuAswoKFiQHXU9L9zIBvKHazz8qF7rBLA=;
 b=WN8AE5zqu8ccHJlObuHTvwUBdS1TyM+mqfEIyRar6Z/mKFO2ZeT+kgeJ
 0j7Iyj7O1xHWI2kvqM1BFgJ77dxmdyqN9CLAXTJ2g+1FvpfCQwszygsiJ
 HQV8Lu11//VLSxE89SIxuqQBfdJ1/ZzLkPP1IzVYObpYR44SJezQn/mvI
 dbYkqExvlqnMN8zfy89XYq6QBqVywQnAEkOBuGrzqaK1rnJ5T07Gs4uVT
 WBOHDt0qSIsfkcc2AWouKndnIFSUADQPx60jBJJ9+YcKdgBLq8Dl1t/l3
 ZHwes45KnCs1P3quFQ3M+aQsjVEfH37WuPqyBQ+scLzbohZZHM64VaVXk A==;
X-CSE-ConnectionGUID: 8EuC4nG3QrOSlqW8GXn3qQ==
X-CSE-MsgGUID: 551nAY+uThGWsks3TsMdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71237554"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71237554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:46:54 -0800
X-CSE-ConnectionGUID: r4JR6FqXQqK5m2+v0vmeXw==
X-CSE-MsgGUID: ggHwASskRmSFqzaiL5kdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209479801"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:46:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:46:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 19:46:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:46:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boM4p8VB/0aq3GGwQY1hRckTxJaakTewn/2UYNBonmEzGJbMwXNqamxpfYKx+qKXTL4GL/AljAS08UWv5ByiwReDhqbR6HY3BU+YdZjrbkr2lhRQ3ldkD4V192ijMN7pCiFXjQh3I38rOm9w/Xftd/nw22+gwCz0L3g2mCTE5iGgQ1KdYqWgw0TFWFQ35IcLTNHxKDeTnhigDjMU4/7q5D0tTQKPOzE0t4ji9X6SUNiPgFNcf3ZKfxd+jnF720ejrKz0vYjsVRxJL97GiS3+nFZlp7IBhDncZ7GPDgDqlDL5h67n1rGLfPGB/1WKdAH9lbrNfWEti43rI6UmNtUu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKsT821sW3hW+HyTtptE0v5lNv4I9Lq41aI6X/zX2dA=;
 b=m3+dkZlTqTEZqvgQVcc5VOQ97/VG9s03b0dHQLeALpW/hF9+NuKHs42kIrCzAroYWVx+R1u+Sn5TKG2x1hBAy6wOVH4laz2VtzWaIslflRHC3K8BRKZhZMAGKBxFXuw8XGrmBExRiAuVa84iVA9FI3PvQJmoOdF8to2MsWCtAuHMQ+vqRLl5Ms4e1101XrD630SzF3hNZGJK5/r2fK+pV+nziBI/ZVoDRwx/0MRxqvnGernsp6Zsbwiz360NGJS/yF1dDwMMF9SMTn/MixI2mEbnBr/GKeTzvCbpha7LQ4HXcoxQvy3HwACPtJ7xVBi5MGgZHOQ1Ti14ng4XIFwG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.15; Tue, 3 Feb 2026 03:46:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 03:46:51 +0000
Message-ID: <60274ecc-a93b-46d3-8814-543aba8d2902@intel.com>
Date: Tue, 3 Feb 2026 09:16:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
 <190d1d4b-161d-477a-9c14-d23bbb7d8610@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <190d1d4b-161d-477a-9c14-d23bbb7d8610@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: a77b60d5-abc7-44a1-9594-08de62d6dd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3k4c3BFeTFNUnV4ckVtZmFKZzZYREpNNkNTS29OMmJuZURoYlJXVUxJaWlp?=
 =?utf-8?B?TXpPVE1XcitPVC9BeE54c05sYVVDQlNnS2JoZHNETDRuNTlOeTNvS0JTcit3?=
 =?utf-8?B?NW5pU0tnNmlLTDhUVTZ1dTh0Q202SVB2QW52ckJESnIzb3pncmV4VCt2WUhQ?=
 =?utf-8?B?bWQ4YmpicmNXSlV2VnpMdGxCa29SM2xuYmdJMGF2MW9pTHR1N3M0RHlnOFBR?=
 =?utf-8?B?NlFCdk1zRnFGbkNNUlZ0TGJSNXRMSkJvUXZFTk5la3c1TTBFRlUzVWM2QlRK?=
 =?utf-8?B?QlgrcGVOUG9sbGx2Vmt0cUdBdzBoTjVYOHdxUXVJbHJ5eE5tb3hkenlHVTJh?=
 =?utf-8?B?SHhROWVwSVNLTDFSdWdnYkdHdUoxMmZsaG56Z1lnQTRudVhRSzBtMXd4RWo3?=
 =?utf-8?B?VWtWeUlxR04vWUxiWkEra2hnOThoVHBnNEFIRUR0Z0tRRkpYRitmcVNQMmZG?=
 =?utf-8?B?ekgrMjhpQUkvQ01lMW9DUmZiSHZibXpjVjNBbW8xdi8yUEZzSGMxU1ZtU25m?=
 =?utf-8?B?ckhwNHFHcW5KRk1TUW1vR2lDSU5rTEh6Nm13R1FuTDVvRVFHN3F5V1FWWURY?=
 =?utf-8?B?NlRlT3BxcTNmK1lreGlHMEZ6Z21QY0VCUVZuYVg2RVd0ZUc4RnpmREE4U05M?=
 =?utf-8?B?blJaVW5iZURGNW1WZ1FCYWRXSlhkTHNSZWZkdXIwMTIvSGk1YW1yWkVsTmVo?=
 =?utf-8?B?NjJidzdpYThpcUxxTGhwZG5BcXEyM1pOd0FFK2lOZ2FteWM2ZlJhNkZNTUR1?=
 =?utf-8?B?Q3E1K0ExdlVubXpIOFJUZGJ3TGU1bmNxNEZEQkdtcWp2ZXcyOUhkR1EwVlVU?=
 =?utf-8?B?MnIzenlIUG5SU2lPdjlQZXV4WFVTTXZKM0dVOXFYU3hDWTkyOEtNaWM4alRp?=
 =?utf-8?B?STFsellYbFlYbGc0WEtmUUc1NXdVdGdudWZHSFAzU3ZWRGsyeXBTNG1leGRn?=
 =?utf-8?B?R1VzRHVQemZrUnhqNm5sZ2JycWxZY0VvOHI2dG10b3RhQkF4NVF6RXNGM0Uy?=
 =?utf-8?B?WlUvQWxxYkZobU5xaUFHZ1k0WkZweUN4cHhJYUNnTXdHY2YyQUVnMjV2YTBt?=
 =?utf-8?B?dGxTelNUdzZWdkhxZ2xWZlZVbkdFbllHK1pDMkRIemRPWWJGVklWNUx1bFo5?=
 =?utf-8?B?VVFpc21Yc0RMNzltbnNXWHhFdjVNbGpMLzRBREtyNmsxcmxQdjgwRDBFYjlw?=
 =?utf-8?B?NkxoR1M1MDJESkxkVThnZkI0ck1NcVZtZjN6cHBtWjc2NXY1VEczWUo4c2VQ?=
 =?utf-8?B?bTJSbTdEQkdnVmhZMnZOVDBteThZU1ZqbngyYUd5Z2hJenNSendscjlKVFgz?=
 =?utf-8?B?ekV3WXFweVgrUiszKzhEV0FJd0ZNZllSRFlTeGNUOGRhczRmUnllU3F3TjYv?=
 =?utf-8?B?T3pGdU9yQTBMeFh4MVpVczZ2VXpyaStCdXhmWWxUY21ETDduVERRcUNmVWhN?=
 =?utf-8?B?SGdsNHB3bnc5ZVlnOGkvV0Z4Q2ptK2NMQlFmSzZVci84QlVqTHRwYUM2ODRo?=
 =?utf-8?B?bUtHSWl4aHRRZDI2OEhHY1VPeFM4R1AyYnNoOWN3WjkvOEF1WWNPQnpFTk5J?=
 =?utf-8?B?QVRIeUtONnhlclZYM2k1QjdubXlZTFdyVkpFWGRWMjc5MjhsT0xZTWU4UG02?=
 =?utf-8?B?azlTYXFNbXNmdDZEUWE4NURuTlg4blFRaVdlbHZpa09razAwNkpOR21CZ1Q1?=
 =?utf-8?B?blpyd1dRVXBrdXRpYzlNQlFuK05jTStpYUUyeFhaRFg4OE1UdUd5cDNYYVUz?=
 =?utf-8?B?OUJHQXMxaXJKeUZlOEt2bTREVzlJNWNDWFZqbzBvZGpYS2trdDNPVlAvNGVS?=
 =?utf-8?B?Tnc3alY0dXF5Sm5PVDhlMVJ6TDlLQmV0NEpBakVOWmNaYlFjbFF3K0FqcHhm?=
 =?utf-8?B?OS9lSDhmUEpFVkZDRlYvUDY0L1YvQ1RIT3NDcmhoV0Z0RkZoWDNiU0o4ZkFa?=
 =?utf-8?B?V2dBa3E2WTI4aUF3dk1hbi84NzV0b1NqWEpIdWhaanRZOGJUZ0JLZ3lzNEln?=
 =?utf-8?B?NVR2emsvRGJkMXlnTmR4ZVoweHF5VzhhNCtRR3BnbUk5bVR3bWZzaEh1RCtq?=
 =?utf-8?B?dEY3ZUVUa0ZUeVR1RXdxemE5SlZleFBUTG10NnM4SCtIdkI3V3E5clYyWTZG?=
 =?utf-8?Q?H+Zs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNkOVcyb2orajdmaXA3dThYbnk4VFdOMkdJdG12SlFKL2FpeGQyK0ZlYmZn?=
 =?utf-8?B?N2NicWZEcW5ONVVqZllHMEpyWE1FaHU1bmdkeS8wcS81R2FZOW1PTGV4ekR4?=
 =?utf-8?B?YTFBRHdxWDArZ01qYWVDdy9oTHVRNDNYc21NRytLUjNTVU0wTjRoRWpjckJo?=
 =?utf-8?B?SGxGemsvdko3aStYTVAycDJ0NXh6aDZxRnZsNFJWaEJOa283ZjhqcjA4U0JT?=
 =?utf-8?B?b05Qd2Fpb3NqSzFSWXVVVURRS0JGMWJDUk5CQ0NJRVdCNGwwUDhkbDZQa29D?=
 =?utf-8?B?WjhVUVdQZkY4WDl6UEw0ek5CQzdvY0xqNWRLTnJka1dRWWNIUjZIZ3ZJM0tV?=
 =?utf-8?B?a01RMUJ0NVUrUTk3S2diVUZFRnJjbUN2SlV0SUdPbzFPS29XaFJId1ZLZi9E?=
 =?utf-8?B?VUszNjg0TEpNRmpVRGhHSmY4NnRnTzFDV2ZBMldNS2h6ZWttYTFacGxxV2lj?=
 =?utf-8?B?YjFaNjVvM2ZhKzBDTkJ0ak9DMnhZT0w2Zm44dWhXemRLZzZMN3lGWndBUXJx?=
 =?utf-8?B?N04vTE4xMmh5WGU5bmplZmZRcHZxM2N1V3JzTVQ4K2V1eU1ENDJXZVhPMzln?=
 =?utf-8?B?bmovMDlhcXM3dVdpOXBtOEY2Rnd0bjdWa3NXeEtaVXpxb2pSdDgzQU9hU1NE?=
 =?utf-8?B?a21KYkNtaVM0OGZBVDB0ZGxjOTAvYUhzaXVMaVNZMzZFYW1BQjhhSUJyRWJL?=
 =?utf-8?B?amcyMUZwaGsxQlVvY0d4b3BtN1N5ZjdHQ09TREh5OGl5eEFOa0JLbEJ6QWli?=
 =?utf-8?B?TVJpNzY2SmJwU2Y0c1pDQ0JFdzl5MlA0bXBybS81elZBTzJBME1HUXBHSDVI?=
 =?utf-8?B?SjlJMDI4NE5DQi96NVpIRDIwRGpWK25XaysxVGZMV2pWeXQ5ZldlVUJNYUZI?=
 =?utf-8?B?WnpLU2JYODBqZ0ZBeWhySnQzNWRrcnVVVmp0UmNwNE9TVmlnT2JWc0gzekV1?=
 =?utf-8?B?THpObllhZ283TFBEdmh3YmtzT2kxMHRPWlVFVktVQVFQSThjbWRRRXMyR3BI?=
 =?utf-8?B?dkVoQmRmVWc5MHRJS0RRcUVIdXUzaEpJNXZOVzViNWdSWThTTUlVeEpOWlly?=
 =?utf-8?B?THNJMzJJUkJFZytyQWh0TTAzNVpVVklNS0VZYmVZSGluM3JjVUZBYWlXUTdk?=
 =?utf-8?B?MVorWVozK2IrUG1aUHJPSjcwVUhrT2ZhMC8xUTZmL1JQa2xkdzJmNVJHWmlY?=
 =?utf-8?B?SFBZMTArRE16bzlkbUxlMkRHMmNZejlrVzhxeHpZWGZIQUdlc1VONDJCcHNy?=
 =?utf-8?B?UXNpSFJtb1VSSDJOWjc2NG5IL2ZYR0sxaTlNWm82RmhhdWFxTTR1OG9oMU1k?=
 =?utf-8?B?c0s1UENVL3JVaDJDVWFKcWI2MGFFVXdIQ2tZSXhEeFJXUjVkS0ZoRnIzWkFF?=
 =?utf-8?B?THBwYW9lN3d2QkhiRzg5ZEVFdHI0Mjl0cm9jZGhSRnIzTjhUUnhxRDNPeExC?=
 =?utf-8?B?ejU5VFN4c2hJcEJIdUc4aEV2eW9NeUJEblk3cEVYQ0VBaDhkUVpCNG5tMUJx?=
 =?utf-8?B?ZmlrSzN6ek55OWI4eG55WXVxWjRVWVg1Q1J0ZFh1aDBwbW1IaExxaGIzTnFQ?=
 =?utf-8?B?WkRDeTBqTUI2T2dmaHFkN3VXMUJsT3Nqb3ZXL1VyeUVYTGUzaWVKZVNPSnhW?=
 =?utf-8?B?dHlqV01FOU02Njh2TGxHQU4wOE5lZHFCdTkrWHdHOSt2MC8wUnVFK1Vyck5X?=
 =?utf-8?B?Mlk5Mmh4VHJBZDE4OEhIR2tPc3pIeU1JMGhRd1ZsT1drOFI1SVR6d0Y1aWRC?=
 =?utf-8?B?NEpHRWF1bUt0Q2hlZTBxRGZwU3FiMGJ1ZkFpWlZkcEtMb2ZBdzQvVTBQYWlD?=
 =?utf-8?B?ZHVBOXlSNUV0dTBRNndkRGVaaTlFUE1malhRVFhlYVptcWtqU1FjUnAwU1dF?=
 =?utf-8?B?Vm5ERlNibXlxSnpGK2ZrOXAyOU5wczdGY2tIZDlaWjM5NjQvc29TNzNFRDF0?=
 =?utf-8?B?aHBSeDNLU3VBNDVvTUZQTTlzZk8xWVBPaHVaYTI3b3FsMFUwYWEyTDRhdDBy?=
 =?utf-8?B?cHMxM3BhazlTNzdGL1RVVFRxdy9Rcm4rNkJOQ3drQW9sT21SMCtxb2ZzWTNI?=
 =?utf-8?B?Z3dURlpDMjhka2N1TVh0MkdRcklGc0Jzc2Z3YXFuMVNielFlQzFaVWFkTy9u?=
 =?utf-8?B?YTZHQnF5dVJEU1IxdVhBdUNMZ3ZFTjQzUE9vYXdBOEpITmlUM1djNlZIdWZJ?=
 =?utf-8?B?alUzNXhsekpmNStNVkVscVBORUdGRUloRjFsaExLNlhHS0p3ZThSODZCVVUv?=
 =?utf-8?B?V0gwb2lEU3I3Mk80QWJPUnA3VWhQend6Qk4zSUwvdGk0ZHNHTmN6WjArTzFG?=
 =?utf-8?B?N2hDYVdyK0c3ZWZZU2IrRWptVU1kRGVoTDdyMFpqL3FxZ1hNN0lGQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a77b60d5-abc7-44a1-9594-08de62d6dd2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:46:50.9793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f72js8Jb4cv+fHxqjRvHqF//6uoIxFn05/ljOdOt8pZWmtkbvgzFl9WVvGuyroLSnJ1drGWnSQsiOZnd9azeKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
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



On 2/2/2026 6:49 PM, Nilawar, Badal wrote:
> Added few more comments
> 
> On 29-01-2026 14:39, Nilawar, Badal wrote:
>> Hi Riana,
>>
>> On 22-01-2026 15:36, Riana Tauro wrote:
>>> Add error_detected, mmio_enabled, slot_reset and resume
>>> recovery callbacks to handle PCIe Advanced Error Reporting
>>> (AER) errors.
>>>
>>> For fatal errors, the device is wedged and becomes
>>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>>> error_detected to request a Secondary Bus Reset (SBR).
>>>
>>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>>> error_detected to trigger the mmio_enabled callback. In this callback,
>>> the device is queried to determine the error cause and attempt
>>> recovery based on the error type.
>>>
>>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>>> cleanly removes and reprobe the device to restore functionality.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>>>   5 files changed, 107 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index f6650ec3ab42..5581f2180b5c 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>>       xe_page_reclaim.o \
>>>       xe_pat.o \
>>>       xe_pci.o \
>>> +    xe_pci_error.o \
>>>       xe_pci_rebar.o \
>>>       xe_pcode.o \
>>>       xe_pm.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/ 
>>> xe_device.h
>>> index 58d7d8b2fea3..81480248eeff 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>>> *ttm_to_xe_device(struct ttm_device *ttm)
>>>       return container_of(ttm, struct xe_device, ttm);
>>>   }
>>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>>> +{
>>> +    return atomic_read(&xe->in_recovery);
>>> +}
>>> +
>>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>>> +{
>>> +    atomic_set(&xe->in_recovery, 1);
>>> +}
>>> +
>>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>>> +{
>>> +     atomic_set(&xe->in_recovery, 0);
>>> +}
>>> +
>>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>>                      const struct pci_device_id *ent);
>>>   int xe_device_probe_early(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>>> xe/xe_device_types.h
>>> index 944f909a86ad..2d140463dc5e 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -669,6 +669,9 @@ struct xe_device {
>>>           bool inconsistent_reset;
>>>       } wedged;
>>>   +    /** @in_recovery: Indicates if device is in recovery */
>>> +    atomic_t in_recovery;
>>> +
>>>       /** @bo_device: Struct to control async free of BOs */
>>>       struct xe_bo_dev {
>>>           /** @bo_device.async_free: Free worker */
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index c92cc176f669..e1ee393b7461 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>   };
>>>   #endif
>>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>>> +
>>>   static struct pci_driver xe_pci_driver = {
>>>       .name = DRIVER_NAME,
>>>       .id_table = pciidlist,
>>> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>>>       .remove = xe_pci_remove,
>>>       .shutdown = xe_pci_shutdown,
>>>       .sriov_configure = xe_pci_sriov_configure,
>>> +    .err_handler = &xe_pci_error_handlers,
>>>   #ifdef CONFIG_PM_SLEEP
>>>       .driver.pm = &xe_pm_ops,
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>>> xe_pci_error.c
>>> new file mode 100644
>>> index 000000000000..a3cc01afa179
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -0,0 +1,85 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +#include <drm/drm_drv.h>
>>> +#include <linux/pci.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_pci.h"
>>> +#include "xe_uc.h"
>>> +
>>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +    xe_device_set_in_recovery(xe);
>>> +    xe_device_declare_wedged(xe);
>>> +
>>> +    pci_disable_device(pdev);
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>>> pci_channel_state_t state)
>>> +{
>>> +    dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
>>> +
>>> +    switch (state) {
>>> +    case pci_channel_io_normal:
>>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>>> +    case pci_channel_io_frozen:
>>> +        xe_pci_error_handling(pdev);
>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>> +    case pci_channel_io_perm_failure:
>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>> +    }
>>> +
>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>>> +{
>>> +    dev_err(&pdev->dev, "PCI mmio enabled\n");
>>> +
>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>> +{
>>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver- 
>>> >id_table, pdev);
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +    dev_err(&pdev->dev, "PCI slot reset\n");
>>> +
>>> +    pci_restore_state(pdev);
>> What is the significance of restore state here? In reset path any 
>> where pci_save_state() is happening?
>>> +
>>> +    if (pci_enable_device(pdev)) {
>>> +        dev_err(&pdev->dev,
>>> +            "Cannot re-enable PCI device after reset\n");
>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>> +    }
>>> +
>>> +    /*
>>> +     * Secondary Bus Reset wipes out all device memory
>>> +     * requiring XE KMD to perform a device removal and reprobe.
>>> +     */
>>> +    pdev->driver->remove(pdev);
>>> +    xe_device_clear_in_recovery(xe);
>>> +
>>> +    if (!pdev->driver->probe(pdev, ent))
>>> +        return PCI_ERS_RESULT_RECOVERED;
>>> +
> Instead of invoking xe_pci_remove() and xe_pci_probe() for unbind-bind 
> operations, we can use device_release_driver() followed by device_attach().
> With this approach, the patch "Group all devres to release them on PCIe 
> slot reset" becomes unnecessary.
> 
>      device_release_driver(&pdev->dev);
>      xe_device_clear_in_recovery(xe);
>      ret = device_attach(&pdev->dev);
>      if (ret == 1)
>          return PCI_ERS_RESULT_RECOVERED;
> 
>      return PCI_ERS_RESULT_DISCONNECT;


I tried this before. This causes a deadlock. The device_attach and
release_driver hold a dev lock which is also held by the error handling 
functions.

static int report_slot_reset(struct pci_dev *dev, void *data)
{
....

	device_lock(&dev->dev);


static int __device_attach(struct device *dev, bool allow_async)
{
....

	device_lock(dev);

Thanks
Riana



> 
> Thanks
> Badal
> 
>>> +    return PCI_ERS_RESULT_RECOVERED;
>>
>> Is it correct to return PCI_ERS_RESULT_RECOVERED if driver probe fails?
>>
>> Thanks, Badal
>>
>>> +}
>>> +
>>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>>> +{
>>> +    dev_info(&pdev->dev, "PCI error resume\n");
>>> +}
>>> +
>>> +const struct pci_error_handlers xe_pci_error_handlers = {
>>> +    .error_detected    = xe_pci_error_detected,
>>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>>> +    .slot_reset    = xe_pci_error_slot_reset,
>>> +    .resume        = xe_pci_error_resume,
>>> +};

