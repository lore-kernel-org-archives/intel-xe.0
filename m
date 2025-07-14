Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD4BC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 21:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254310E0CA;
	Mon, 14 Jul 2025 21:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNClL9oJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714410E0CA
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 21:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752529469; x=1784065469;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nv5RdJt8QC3lPVDa/LIeSMTmNEQCH48RCkq9CqBMm18=;
 b=HNClL9oJpw/gRpE4Ecqr7am0rE/S6ZbsJR/fQ25SAynIawZx7qefaKpC
 dxJNVjkXRPleb1s/vsJmgemTE2mcTNbc+2rXw0F5IW1KnhvJiNoMh9Tj3
 UZjh9b5wPUXJAbI/aR8zBeAHRI2i7lK8LnR4K6qYUmEOfPqmx8TuIN+eZ
 nhGoOXBxocKELdR+q8RhFtseM3RF4MdNdQg1nzYiiDJBc98MNLI6yip8v
 J2cNptuJ7yoK+XUVNSdU41eJlTSKpcddD0DivgX6+covUw6OosyKxvjiM
 MDq2Yh1cpb0jtw81g5756FwSwgNpJKPQjZhjdjizMladkJGmPrO3867FC Q==;
X-CSE-ConnectionGUID: 8VFzTHtxRhebCYn+Ur9Dlw==
X-CSE-MsgGUID: 1NeNQBzjSmCjftpYoaBLow==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58541371"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="58541371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:44:29 -0700
X-CSE-ConnectionGUID: +NdTVq7BQJ6jyJYIdc4w8Q==
X-CSE-MsgGUID: tzUVsJ0cTgq5NvAkcIg1BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157547850"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:44:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 14:44:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 14:44:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 14:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMJMJ/GONEofcJ+t7ZxOYX9aq1Z62q279+uZebKK30pVlsu8SoIS0+ay2eVwminfUkJvuv565bUJta5uPqyTZEcAViJpK0mXMNQaP0Y7WiQ3Cj6/6BOEppIJaUTVeiecRk7PCZ3Rb76EqZGsaOEmXvCFpYQnRjyggWXEPPUW8EFYVWLDIS5qvEHfRlJidpmtb7fEKg00nex4Cb2Qj5dxOwR8OLm0+TmR6dEkeKFEJT/kBlYbVnNXeS43g+cB3rLU+3aOw8kxVR0NUiuuXuitJnWZHCGQTo7qp5gGoTYVM0VcrbioxomumPUwpFv97tUIYOptIoCbhFbrnm6c4BJI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd2aAgifTgILusSQqpUYQeFVpw3GYLe/SBnEmBz58oE=;
 b=eQp2aSUMo2B57PYoVwi095vN8ali5fFASP+btYUCECZprJyYu+XRuy+oZEBoUBCSM2MtQc4nSu5hxnisERIOWFhifTE726VjqAX6kz2ddiNMq3IVTqwByNNQWiq8OC5mILPkhK9FFHflshQmPQZJ68q152tWf+DjxLQhvFtm6EL7AsSkMICIMF6ZPN8GcinP7qwCuhionVCFWcoBkz9YXUhQcyGUYapLyuF0WSVJV3bHaoAle24rrRlcn7mm+ZY8v0dZDqZRAy6iubkVQR0dCddZ3NJXXOgBvXl9xU6/yelD+nqoj0XcyTfYa0YwrrwLDSS+zUVQOVcejg1LnTkzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 21:44:25 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 21:44:25 +0000
Message-ID: <c0ee7555-e58d-45a5-8e86-b7391e534c13@intel.com>
Date: Mon, 14 Jul 2025 17:44:20 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 1/6] drm/xe/guc: Add log init config abi definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-2-zhanjun.dong@intel.com>
 <dcdb889f-34fb-4ac0-adf3-b28803fd854f@intel.com>
 <d65a39d2-cd0a-4e00-b4c5-a72ba662b271@intel.com>
Content-Language: en-US
In-Reply-To: <d65a39d2-cd0a-4e00-b4c5-a72ba662b271@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:303:2b::19) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e205222-d94d-4da2-2c77-08ddc31f9a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2pPRlFobkFwNXB1M3hPSnFzdVNwMGc4NnE4TEJscVlVTnZqS3dmRjhBN1ZI?=
 =?utf-8?B?ZlBHUjI3VlNvTXYzZ1NXc2g5UWkyMXhBTlo0TEcwZmdnS1JpYzdueEhwOTdZ?=
 =?utf-8?B?U3Q1eTVlUHp3S0Rsekp0WnNyRnQvdHRDeG5ONVhGM01LN1dwVENITmlIcFpv?=
 =?utf-8?B?cG1ncitkQk5tOGtEdXZSdjUwNDZOSnhaUllEbERNQk5sOS9EdGFhb1BaM3JH?=
 =?utf-8?B?ZnUxQUwzL3BSRnJBYXkvd04yMENOd1FxT1VTcXRsNzhpbm1aaVJzdlVrVEho?=
 =?utf-8?B?Y3d3WDNESFNneXpvSk5NaXkwWVJoNXBCUGtRR01vVWFmVTJBZXI1Ukp2MW12?=
 =?utf-8?B?L0RveWovem9xTHNQY00xTkt1dFRBcUpiTUIvV1dHL0lvNnJCdWZmZUFoQkhJ?=
 =?utf-8?B?cU1vMVpranhraStSL2tNMHQwMEtSYlZLdEw5T2JFbXE4ZndRRmtFYXZjM2FS?=
 =?utf-8?B?RnZ3RU81cXRHb1BiRWEzWVg1Q0F5RU13cXRobXZnekd6aDdkdTZiNTNYU2Fq?=
 =?utf-8?B?K2tQbHYvZTU5ZEM3WVI2TlZLTDBjRWJvWTRZK2VCeXN2Q0VxczFNOGxLdXc2?=
 =?utf-8?B?WEsxVzZSc2xYTXpGUzNER2dPenNNKzRTTG1qWnlpNVJzZVJjOWRDbkV1UEJ5?=
 =?utf-8?B?RDhXRy9mSjk2WWw5a3dnMEExbHZzUkZ5RjVVR2pVeGwxWmZsMWpQbzlvVHhm?=
 =?utf-8?B?dU53MFVwd0lpbGxvYWZzYjhkMkZmb1BNeGZTL1JPb1ZlcWNXdWpSeFpjMkJ3?=
 =?utf-8?B?TWVhbmJ1aC8valVuQnJWYlNjbnNYRS85OVJSWWpHTUdFczZsSEZ4SG9SVDFC?=
 =?utf-8?B?YTZISmVWL3FNcG5wRnF4bFJQYWlQV1R1RmZwcXJIb2F0QXJaTEhoYXdhbmVt?=
 =?utf-8?B?WVpuYWF6THkvY0tLenRzYnpJVng1eDFaOVRKYVZkK2tMRXVDd0hMWnZuUFhv?=
 =?utf-8?B?R2FiVTQ1NFlNRzZFVzNodVFrMTRUZmd2VVFBbmRIVGE3VXArTDQ1cEpFK1lm?=
 =?utf-8?B?SDRSdDRpMFNESVZsaDdvOXZINUg4Qk5ZeWRiTXVQbHBIQjlTTDJUMks1VzFo?=
 =?utf-8?B?bWRLTExrYXNxR25VTEdOT2pSYUFCemQzRmhsUlpCVVU1RDVFSkpaV2pOd244?=
 =?utf-8?B?Z2o2QzFYSnBHMTV5YWpmT0hVOE1NTzZRK0ljU2c2cWVPaEFncGwwYTZub21n?=
 =?utf-8?B?U3VLaWgxVlc2MGsrd2JUQWhXSUltTEYwZm5QdVo4a0toVG5zQlFqOXlpY1lJ?=
 =?utf-8?B?OUlvd1dBbTFXNzFBZkpNaFZiSllDSC8rT3BtVWIzT2x6TzVmazlPaGtBRXIx?=
 =?utf-8?B?OVhkRnpGSGlrWmVVR1Z5ZUx0eG9qWWFvZy9VWnNYRnNkRXNCczFSaVJmNnJK?=
 =?utf-8?B?c0lTT2ZlYVdSZnFsZU9WZ3F5cit0WXBQODlSUDVYOWJKNWdndTBSRG5BZVp2?=
 =?utf-8?B?WWFmOVJkdCtsaXFMQ0tuVWhlK0VyUEdTaVU5TU9PNHlRejNqTW9jOGIzZ04x?=
 =?utf-8?B?ZmM0ZllBSnB5VUdRaTduQUUxaXQyOGRyQTVvVDZBSlJ4UW5ZcTRQcnNMN25l?=
 =?utf-8?B?NXF4VVhMbC9vR2s1ZDI5SEpSUEhzR003OGhzVzFQY2IwV0xZaXlQdHZTUnBa?=
 =?utf-8?B?Zk1SQjhWRkdNWDVSUDF6Umc3ckpnaExtU2RLV21JYlJ5SWRsdFF0N1ZMUE5y?=
 =?utf-8?B?S2Ura1UvYmF5SWViZS91LzR6YU9VVVMxN2N1L1llUk9ycTJOV3hVMExkUjRZ?=
 =?utf-8?B?b1k0NUxaSUVoK2huZ1JaS2dCZUhjU0thOUgxTjgvZ1EvSlp1bVFSeVo2dGdU?=
 =?utf-8?B?bUZzUCtucWU4UFRMVFlLQm8xTE5NbmJlWVNqK2tZTDdONkVscnNIbTdOYkZS?=
 =?utf-8?B?L0F6SHY5UGVFWHl1eXBKa3BXbFBGOUtnaTJOMytoUHpRZ2lIQUdSa3RISkxY?=
 =?utf-8?Q?MCOyolrYeS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2lnMVlqQ0M3Zk1BZnp0TWJORFhEcG00Q28vZStpUENLYitOL2crSk1xUURG?=
 =?utf-8?B?cjY1ZWFwSmMwbm9WZDAvRVdVWVBib1JzSXNZZEk4cG1xWUQ5bHRpMDQyVXVY?=
 =?utf-8?B?QmVkbSsvSHRXTnlBWjRyM0ZBdERteDU0ZkdaNG9hczg2dCtVamdqT2sxRzZG?=
 =?utf-8?B?QVkrTG51NmlhanJ5aUZQekpjbURlWDJUYWxiNGpQTWNCL2hmY3I2M2pDSjJP?=
 =?utf-8?B?bkQ3dTV3M0tubnBqZGZmSHY5VEc4TFVWZjE1U3RKQ2x5Y1BXbUphaFB3ZldU?=
 =?utf-8?B?TytlMU54MHlLTlZLQXpPeGJvQmZQbC9VSUljdHF3cFJVR1dlTi9IdEwxZFBt?=
 =?utf-8?B?SHRHSElTSGtKeXcwb3I3M1lINUt5ZVpiemV6Y0NDaFpHNndQZ0pjVUpjQ0sz?=
 =?utf-8?B?OGtXeVc1ekFFZnJWY3BVMHY5NW9vdHNTUUREYzAveit0RHR2Tkl5U2tvdFJD?=
 =?utf-8?B?M2hjZCtMZW10eWdxaW1IeDhkSWlhNkdPU051aTgrdVRjeUJ6eE5HRWEvMklF?=
 =?utf-8?B?cDN4d1NkTkVwU0IyUmU4Zy8wZXVjWlo3ZHdTeDkwS0FtWDBJVU96aDJWcm9C?=
 =?utf-8?B?VzNwSlhtMzJDbGhmb0kzeFE5OVlUcUZVRlZkQVBSektxU2Z1cEZHVjNyeWlW?=
 =?utf-8?B?eDNKUHhKMFVDZVhWTW5IMitMOFl4bXRhWFl5V2N0NEk1ekpLbXMwbktDWXE0?=
 =?utf-8?B?cFV3RjQ3bjAzS0kxcjg0WG4rT2RIWHZ5ZXNDclh2M0FZK0pqTWU0TE9IWUoz?=
 =?utf-8?B?RGJtTFlZVTlJRlF6L0RRb05uYVFGUnZRQWdIckl3THFhajZHc1FnU1FuVURj?=
 =?utf-8?B?bFFUQzNTSEdGVkJrTWNGL0VxMkF1bkoza2RkbFNKODA4MU4ycGRTZ3VCMk9a?=
 =?utf-8?B?azBlNlhYYjJ2QXMxcUUzZGVLRjROYnN1c2NpNFV4ZGVQNGNOelE4VmJoUU5G?=
 =?utf-8?B?U1RnMDJnL1ZIbXNJcW1KckVDRlgweTZkZ2EwZWdOelN3c2lub3ZrWjFDNEFZ?=
 =?utf-8?B?SWNtcWdrUGMzT3hLZi9ZTExVRmc1eXNZUVA2ek1QRTRLYUVTWVBocVRzWWdr?=
 =?utf-8?B?SFEyZ2FVVDBkTjVjNkU0cHFvWjFoMEtxbG8zbXhjVGxOdWVTSnZjNlRXUEkv?=
 =?utf-8?B?TW1iZDBteXE0OXFaeVZkbW5hRUJidVpDVXVKc0o1amZJQ1hWbkpSNkE0bExh?=
 =?utf-8?B?RVlVbHVUVW1QTU9pdmFyQnNZNy9TL1ZUenphWEJMSGV5b1liZ2FrSGZvYmZ0?=
 =?utf-8?B?Q2VxdWZrUlNZa1pQSU10djAvYWhRSDc1VlphUGlUS3NIYXJYNU5EMlpzckw3?=
 =?utf-8?B?TEZ3Uk1COEM5Zm9rRWMyT0g2MUxGbkx6Ui8zYkkwVnhEZmNaYndoTUVuOXdV?=
 =?utf-8?B?V25zZlVnTjRSS013SFArNE1CY1RPUENoeTlWdjMrdnZTa0NoVk1iTVFYcEtv?=
 =?utf-8?B?SHhXajVkRjRob3B2ckxOanp0NDUxaHVMZ3Z3d0hPVS9zQ2tmYXZTb0JPbzRL?=
 =?utf-8?B?WEgwclRWMm5TM3UrZWthL2YwbUlZN1dCZEtJZldEVE9sTk1EM1RaNzlSL1Qw?=
 =?utf-8?B?cTJUbm94cG1mM1YyQThGSkJEZ2RXaU8yUnFtZ0xQVnlRSW5tYklrMElvdmtF?=
 =?utf-8?B?RkRDWGo4VTdLNlFDNEE5eDRYU0xONmg2TWhnNG16ZTVERmFIYkxRQU5PcXRo?=
 =?utf-8?B?bkJxOVFnazgzMG15SjQvWURNcURrQXJGN2oyQXhqUjQvR2YzakhwemlORjlJ?=
 =?utf-8?B?WG1kRDUwMWpMeXNIY3p3OGF5MngrZjVLZXNRZVhadFVRMnhtaG01aHRvdG5C?=
 =?utf-8?B?bU9hVUtlYTVKUkRaN0ViM043YTIwN2pIcjI1NExvZGI2SmN4QTNwL2p2Q0pU?=
 =?utf-8?B?VWpic3VhZVBESk9NTHpMeHlrQmo3enpYeWVMMm5pbjNqZTRGSVJyNlN3ZlVv?=
 =?utf-8?B?OENCYXN0a0RpZi8vTFh2eHo3UVdhNGVwVWZDekNJZ0JIVHhxMnIvaGUwbDBy?=
 =?utf-8?B?dHdvK0RZSnNqZEhiakRXTmRPQ3lBTk9hSHI2RFNlSlBBU3YzS1BpVU41M0Fa?=
 =?utf-8?B?bkpVSmdueEdXdnp3c2dsZldBYlhYNGVkV3hsQjhzL3NDelZVSVo1emxpV25p?=
 =?utf-8?B?Qm5LR3NnREdOQUZocXF4ZGxCK2tqVHlMcFFJalJxTnB6Nm9ncDNhNGNra0t0?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e205222-d94d-4da2-2c77-08ddc31f9a24
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:44:25.5658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jEZY7Fhr3f2Tib4MujhizRTgyANQ3WWPQr7njC0PF3cyyOgBwzNGuismhDQzyInMMQRYti51kc+ri4f2a4UQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-06-28 8:32 a.m., Michal Wajdeczko wrote:
> 
> 
> On 28.06.2025 14:19, Michal Wajdeczko wrote:
>>
>>
>> On 23.04.2025 23:58, Zhanjun Dong wrote:
>>> Add GuC log init config (LIC) ABI definitions.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_log_lic_abi.h | 117 +++++++++++++++++++++++
>>
>> since LIC already refers to LOG (LOG-init-config) then maybe names
>> should follow GUC_LIC naming? here: guc_lic_abi.h
Sure

>>>   1 file changed, 117 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
>>> new file mode 100644
>>> index 000000000000..48302bfcab2b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
>>> @@ -0,0 +1,117 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _ABI_GUC_LOG_LIC_ABI_H_
>>> +#define _ABI_GUC_LOG_LIC_ABI_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
>>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
>>
>> are above definitions really related to the LIC?
Right, that's not part of ABI, should be moved out

>>
>>> +
>>> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
>>
>> move closer to guc_log_init_config
>>
>>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
>>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
>>
>> move closer to guc_lic_format_version and make them 1u and 0u
>>
>>> +
>>> +/** enum guc_log_lic_type - Log Init Config KLV IDs. */
>>
>> if those are really KLVs, not TLVs as wrongly(?) described once in the
Let me find out, and I will get back to you once got confirmed.

>> spec, then maybe this enum shall be named as guc_log_lic_klv_id with:
>>
>> GUC_LOG_LIC_KLV_GUC_SW_VERSION
>> GUC_LOG_LIC_KLV_GUC_DEVICE_ID
>> GUC_LOG_LIC_KLV_TSC_FREQUENCY
>> GUC_LOG_LIC_KLV_GMD_ID

If it is KLV and since LIC already refers to LOG (LOG-init-config), it 
could be:
GUC_LIC_KLV_GUC_SW_VERSION
GUC_LIC_KLV_GUC_DEVICE_ID
GUC_LIC_KLV_TSC_FREQUENCY
GUC_LIC_KLV_GMD_ID

If it is TLV, then it would be:
GUC_LIC_TYPE_xxx

>>
>>> +enum guc_log_lic_type {
>>> +	/**
>>> +	 * @GUC_LOG_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
>>> +	 * is a 32 bit number represented by guc_sw_version.
>>> +	 */
>>> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
>>> +	/**
>>> +	 * @GUC_LOG_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
>>> +	 * bit.
>>> +	 */
>>> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>>> +	/**
>>> +	 * @GUC_LOG_LIC_TYPE_TSC_FREQUENCY : GuC timestamp counter
>>> +	 * frequency. Value is a 32 bit number representing frequency in
>>> +	 * kilohertz. This timestamp is utilized in log entries, timer and
>>
>> s/kilohertz/kHz
>>
>>> +	 * for engine utilization tracking.
>>> +	 */
>>> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
>>> +	/**
>>> +	 * @GUC_LOG_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
>>> +	 * representing graphics, media and display HW architecture IDs.
>>> +	 */
>>> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
>>> +	/**
>>> +	 * @GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
>>> +	 * Value is 32 bits.
>>> +	 */
>>> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
>>> +};
>>> +
>>> +/**
>>> + * struct guc_sw_version - This structure describes the full version of a
>>> + * software component.
>>> + */
>>> +struct guc_sw_version {
>>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>>> +	u32 dw0;
>>> +	/*  Patch version */
>>> +#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
>>> +	/*  Minor version */
>>> +#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
>>> +	/*  Major version */
>>> +#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
>>> +	/*  Branch ID */
>>> +#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)
>>
>> drop useless comments (patch major ...
sure
 >>
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct guc_lic_format_version - Log Init Config Structure Version.
>>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>>> + * than 1.12)
>>> + */
>>> +struct guc_lic_format_version {
>>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>>> +	u32 dw0;
>>> +	/*
>>> +	 *  Log-Init-Config structure minor version. Must be
>>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
>>> +	 */
>>> +#define GUC_LIC_FORMAT_VERSION_MINOR_VERSION		GENMASK(15, 0)
>>> +	/*
>>> +	 *  Log-Init-Config structure major version. Must be
>>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
>>> +	 */
>>> +#define GUC_LIC_FORMAT_VERSION_MAJOR_VERSION		GENMASK(31, 16)
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct guc_log_init_config - GuC Log-Init-Config structure.
>>> + * This is populated by the GUC at log init time and is located in the log
>>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>>> + * buffer states plus this structure must not exceed 4KB
>>> + */
>>> +struct guc_log_init_config {
> 
> missed to add - there is a lot of inconsistency in the naming (likely
> due to a spec):
> 
> guc_log_init_config
>          ^no lic
> 
> guc_lic_format_version
>     ^no log
> 
> guc_log_lic_type
> 
> GUC_LOG_INIT_CONFIG_LIC_MAGIC
>          ^full name  ^
>                      ^then lic again
> GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
>          ^full name, no lic

> so maybe:
> 
> guc_log_lic_buffer
> guc_log_lic_version
> guc_log_lic_klv_id
> 
> GUC_LOG_LIC_MAGIC
> GUC_LOG_LIC_VERSION_MINOR

As discussed above, since LIC already refers to LOG (LOG-init-config),
I will do
s/_log_lic/_lic
s/_log_init_config_lic/_lic
s/_log_init_config/_lic

> 
> maybe the spec needs some tuning/updates?

Agree, I will clean up all inconsistency in this series, and will work 
with other team to arrange further cleanup on spec

> 
>>> +	/**
>>> +	 * @magic: A magic number set by GuC to identify that this
>>> +	 * structure contains valid information: magic = 0x8086900D.
>>
>> nit: you may want to add reference to GUC_LOG_INIT_CONFIG_LIC_MAGIC
>>
>>> +	 * Used to verify the information in this structure is valid.
>>> +	 */
>>> +	u32 magic;
>>
>> maybe GUC_LOG_INIT_CONFIG_LIC_MAGIC definition can be put here?
>>
>>> +	/**
>>> +	 * @ver: The version of the this structure. Detail description
>>> +	 * is guc_lic_format_version
>>
>> drop 'Detail ...' since this struct is documented>>
>>> +	 */
>>> +	struct guc_lic_format_version ver;
>>
>> this could be named in full 'version'

suresure>>
>>> +	/** @dw_size: Number of Dws the `data` array contains. */
>>> +	u32 dw_size;
>>> +	/**
>>> +	 * @data: Array of dwords representing a list of LIC KLVs of
>>> +	 * type guc_klv_generic with keys represented by guc_log_lic_type
>>> +	 */
>>> +	u32 data[] __counted_by(dw_size);
>>> +} __packed;
>>> +
>>> +#endif
>>
> 

