Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED8CF9C6E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23EC10E3E7;
	Mon, 23 Sep 2024 12:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwmR5UGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5818110E3E7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727095027; x=1758631027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nbbogmv4Ax10ZX03lQ0SInLiCFi8OFsgiMXIh9weDU0=;
 b=WwmR5UGMseKbV2vgb36M49qWl+R4iv7MqNte8n1FaSVCEvfQUakBEwud
 5aUKRHiEOf10YH6vnKQbm1XqUh7HFNq4ToOip7jiv/snBIfmH4Nb6VERq
 8AJJMFsJrVtD5dlf0XDa6WTx+x1RpW8cjzK9fWIh+ycmfIkHLt4XXxTGz
 V0mHkTcbU4eYkTBCUosTudBOPmrAQE3JHRLMZ4h05wdGDxPqita+HkU9o
 Vh9dul6yKyM61tVtDSXsRxkZyeAXRUj77Prj1lEM9JDjdkqvPb9bF0eDd
 MRco46PXAKd7KoY9H0LdRt0fY1K+LmIcrPh2nyz1poUhihI6uhoGgfW+O Q==;
X-CSE-ConnectionGUID: MGxg+nOeQRq1hXkNQGQ5UA==
X-CSE-MsgGUID: YCsEft7XRsepQoAdGmy77w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26194984"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26194984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:37:06 -0700
X-CSE-ConnectionGUID: iZC6utjKS6Gu3NnLKiENDg==
X-CSE-MsgGUID: JG0v2EhcQKS5k4M8pmMlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71086099"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 05:37:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 05:37:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 05:37:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 05:37:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 05:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQ+cWiUckN6BM6zPqjpNNI2FpPYvUUfT/pS9usTwhN6MqT+s3ErF+gSKGkMybG9x2TfOUwPlIhniA0U4OcdUay0Lfxf/08nRKPcLlyx8fqIm4xBSttYYIgjmuKDTjqXcHmgUjXcBopBIFN6Jufj6Mn6tRTf2Z9fYx7heX5M9DIbP/vBb5K2V2rjA6xBf81s7FQfbZ/LA1OZmS8jrEsWQYllgKLCJ2/5TrvbGS95Yw0fa+4Atz0UrF/4juoA1WA6jGPayx859nXcN3KZ90/A7b7MVLFrAJ9Nrm7M/B9X+/TvIVd7NnXg5fozNvIu7cajXu8FTnNTgx9uutsFuPKG5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXdak3CzpZiVmcI3s38omQQTzEq8QlTxshTXBzTJObc=;
 b=KkvlQrneoBACHuDxlTUN6lrSC9oNCLJw5ni5D0krr4lSgqpedyMca9HRqcWqSRsmLaa6XhvuYv4A+TIY/PFXl2uh1NhoOTo/FH8nRPrrQWCdA0eYmNHKoxYgXTRuwuNBwFNpNY1s9eus6LiOAWqFmsX3734vKZb7j+SfImIJqgOVjNjDdPpTlcX8ffWVPcO6e/MrAVx7z7+Fyzyt+Eu/x/XBXkRv8c2EMMtGHsxOTZt++NvMcVEOGvtEjb1tSTmXxAMCC/PiuaHAJVz0VO9USAHXjGlEXcF4qJMg1RLJkK9xYbS0UwsXR+vnh85WhmdAc1qMMEAqEmeYizE+1gURWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 12:36:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 12:36:58 +0000
Message-ID: <b2046f22-5ac3-4ae8-a81b-28bfc733fa1a@intel.com>
Date: Mon, 23 Sep 2024 18:06:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com> <87v7ytbf9y.fsf@intel.com>
 <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com> <87a5g3an93.fsf@intel.com>
 <276dee6b-4d2d-4ed2-b141-76b311dd269a@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <276dee6b-4d2d-4ed2-b141-76b311dd269a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdd679e-6688-45f5-db70-08dcdbcc69fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M21VbThDVlBNcEdnb2pJdllpK29kRmFSSGZCNUpYZml6NElnSDJKT0V6WkJH?=
 =?utf-8?B?UE1VQnVSNUNBeHpvaHVFU0NuSzFNNFJBS1pYa08zalR5SWtPazBXODVMLzJP?=
 =?utf-8?B?RzFDWTBpUzNkNS9pRGJQRHhTZnMza1hhdEFQYm9uNGt0ekVIN2tKbUp5bUlh?=
 =?utf-8?B?QVBSZm9mMnBjOXBqVmlzMElkcmt0aU5kY2RtRHNrN3l3QU1FODFOUms1VjNR?=
 =?utf-8?B?WHZBa0xHbzU4TnREaXVDNFpzeXNPRTFKMHNwY2lXcWE3bGtLQkFMbC82MnZu?=
 =?utf-8?B?Y1BRazhKWXJNMzBhWFdDWXpDZ3l6SVBickF0WE5SUUxlUjlXN09Wa2g4emd3?=
 =?utf-8?B?L1QvRkdkR01hamJQOTRQNUovYlNRLzBBWm9EcFErYVFCT3hHa0doMWxaQ0lw?=
 =?utf-8?B?anJPSk5ORUtWYXI1SHZyUDJkbWhHRnVVNERGZitYOHVBTlE2a3N1RS9mQ04x?=
 =?utf-8?B?MDRBVkNzNFh0RXN5cUN1cU1VUG1wZDA3R3lubFQ3NXRrQkh3emlwVEY2RjNI?=
 =?utf-8?B?VmlOTHQ0NWI4b1BkZitYelU0QUtOWVFSZGJwbWtPOHI3d0p4TGpGeUpZUnJD?=
 =?utf-8?B?VjVCdysxdS9scTlBRnFWWlkzRElEV1cxTWJBdkMvNFg2T3Q0RDNFN2NYSmpU?=
 =?utf-8?B?a1YvS0pXdFd0N0NBQW5vWDQyWWtEblpVaHZ3c05rd1BvbisyaEZpMFhkbjZm?=
 =?utf-8?B?Wkd4aHdWRldkLzM4N3pnOXJCV3pmcHJYd1J3Rys4UVd6akUycE1Rb2xJNEYw?=
 =?utf-8?B?eGZvZDR0WURYUDdyYkwzeEp2NXlidDU4cGpLWnFTV3FodVhQbElPbzQwa3g4?=
 =?utf-8?B?cUhMRkF6MlFuRVhheWFkekNyRUkxMnVYb3RLNnNDYjBMRUZ2bEd4bkYwRGhp?=
 =?utf-8?B?WG1YMFBPRDNhWkpQMU5peDhxZjZOWHVLdXpJUTFOeDErMWVHRE01cHA5Y1N4?=
 =?utf-8?B?QWVPZi9maVVuTmtGOGJGcTJuVUZsTEMycllvRXhsNGlIL2tJNFZMRzlHWm40?=
 =?utf-8?B?WFpLdnRJZTFXYTQ5WFBGY2VMOTdlcmpQc01mdHpvWDM2by81bXJOMmlSRitw?=
 =?utf-8?B?VFFveXcvazVhUkgvUHp3dHA5MXJOUzRLNEVYM2JTU09iVXJoT3dhbjNyQ2Fv?=
 =?utf-8?B?TUF2cHhEdVdLUlA0dXJBVU52SWRINXhxb2NXdHJ1THdGOHhwVkFxSkMwM2c4?=
 =?utf-8?B?Q08vVXkzZ3lTWlk5c2lDcHpqc2dMWTh4eXozcGdybjRpQmI2djNMd2Y5cm00?=
 =?utf-8?B?ODhocGoxK1VaRXE0OFZWdERCZFg3b2NoZ0EzUVI1VmRTRkJSVlVRcS9ETEdy?=
 =?utf-8?B?M29OSldzbFcyeWxHc0RFaEh6TmtOQ3c3OFByNVBYZXNRTWlBWlJtckJVWlZ3?=
 =?utf-8?B?K0Vsa2tpcnk4S3pxdEw0bDgzaURKcWxEOWNNYm04ZjJkVXVCdmoxWnpCN09D?=
 =?utf-8?B?T2ZDSWwzanh5K0s0ZXVTUmZ2OWFzOGo0cDlTRjdWR1FvWXNELytiWjNlc1I1?=
 =?utf-8?B?SmFReCtwNFJjSGNqRytsNklTRUxUS1dJbmkxaDl3RjdPNHRtOVNHU1krNTZx?=
 =?utf-8?B?RFEzREl0amRwT1JNQjI3STlNSDg2bXhyMkZUcHo3NzM3V3QwSEFmMENRTlBO?=
 =?utf-8?B?UStrdDFFcWI3azk5cGRSRTUvWVZjWTVUdU9OeDE1VENiZjhIWTRyVytrbUVX?=
 =?utf-8?B?VmgvV1FEQzc4ZkNlSjhHdkNHZzE1OTFFZmw3dGFWNmU0ZW1LT0xBeURqNXV6?=
 =?utf-8?B?WEtlb2JhUHErTXpUVm9lVy9RYnBaVDY0aFQ1eVZtS1lBV3psZENLTU9GaGpm?=
 =?utf-8?Q?+JrSMJWYI/4KxfUB3HKymZvLNXPQHmBgZ5L54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1FkdTFTMERsMlhZbDhXUndqdGZWc2c2QWhib1NDV3cyL3dldW5VM0hmWVdu?=
 =?utf-8?B?WDBYUUp4SDZEcktHS3RpWHVYS2t3RGhmdkRjWmc3bEhvK1Jjam1mbVBtcVJ0?=
 =?utf-8?B?SmpzNUFSQ01pbU85OHpEc1RkTTJOOVhibW10TFNESnEza0poYm9DZThMUXVX?=
 =?utf-8?B?bGJPdDhBdGduTVFVMXpUNmo4Wlk1WU1wWTNGaVkyTjZRYThoNFhJYnJqZ3gx?=
 =?utf-8?B?VmR0S0FQNHF6YWxac2lyZHU3N3JDanBNLzNLN294VkxTZGgva2xURzU2OTcx?=
 =?utf-8?B?V0RManFTZkR5bnluVUxoL3VhNGNOY0NsL3dnSk8wT1FjZFBvT2MyUFQ5Mmto?=
 =?utf-8?B?Nms3Q25mVmFIZTRRN05GdlZCZWNvN3JmTERBd3RnRjRnWkJaanFEUTB6RXVV?=
 =?utf-8?B?dW5BVXE1QVVSbHFqTW55Smt1Tm5Hd3ZzdWY0WGoxSVJRNzhFSTlnY3A3dHcv?=
 =?utf-8?B?LzZqbDNJRXNvYTM0Y3dLYXBrcFpQQUNwWnUwTSt3VjJHWE9Ud21NekZyZWlC?=
 =?utf-8?B?bUMrc0xERWFML0tVeFczWUh2cStiNDB6NmRGU2JIeWRnaCtjY1UvdWxvbXVO?=
 =?utf-8?B?ZlZHT0lmRk8ra283YVoyYTU5R2grTlhJeFBnb21PRFFTR1cxREJPMm1MQVUr?=
 =?utf-8?B?dXNBWTJ0eUp6OWg3OUNVOHl1d2I4M3JiWEY1K3NtbkRkYnBuL1h5QlpWbTZs?=
 =?utf-8?B?ZHU4TjlyOXRkb1lER2JKcFZ1NktVWk5nVTRXZGdKK2lBQU5wdHdnUzAyb01i?=
 =?utf-8?B?eXJHM2RJUWluNXZMRXdHUjA5Z0tWTXdmQmZ3dG5zcjFBOXBOYVVTRE1NSGNT?=
 =?utf-8?B?VHE4ZndldmN3ZHNpd0RDNStnZHRzNlhSYXlieWFqdnBrSFhNcVJxa3ZHMWVI?=
 =?utf-8?B?R1M1M3pBZlNxL3EvNUs4Rlp2aDhiSFZEcmFUcE1la3Fabll5a1UvV2RNL3M0?=
 =?utf-8?B?eHI2Mlc4TEE4SklLWFYrdTRyZlI5RFZrY2x1enMxTXFTWmxSclFRNHNzamc1?=
 =?utf-8?B?QU9jakUrMm9xM0IvanVNVDUrN2kzY0gwNjFYM1d2R1VyY045U1gyTkw5VzJx?=
 =?utf-8?B?QVA0eDd4Ym1lWld5akdxUFgzMjVTdTlUTmxqTWladzNTaXBZQkQrZkNEbE1u?=
 =?utf-8?B?Z1NHU2I0T01uRElBSEcvUTlzMWtvNmtDRjBKMU91OGlrYWhDR2pFWVhrbXFt?=
 =?utf-8?B?QkxRNFh1K2xDYzFDQlZieWtTWXg3ZGZneVM4dlJWU2YrYUVEb0V4cFJML1RK?=
 =?utf-8?B?cDZ6MnVKdS9ISzY5RUNmWnd2aFRqNnlCL0NXMDFEc3R0NGhNN216eEVWello?=
 =?utf-8?B?Q0ZNVUMyMloxeEMzWDdTTjlEWGZ3WnNzWWtQK3FtSGFSUEdsYklKZkgyQ1BG?=
 =?utf-8?B?MnFOK1VoVnVtbjhQcFoySkRFVUdLNEpMSXlLcXlobU01aXdlaHlFUnE4Vysz?=
 =?utf-8?B?SlhBQjhObXh5R3dLdlVEcDZXQWt6akxGUE5IazY1UGlKU0hQRzJpMEljMEo1?=
 =?utf-8?B?WXNVR1lSQ0tCUjNIcDNGekVTWFg3Zmk5VnNMSlp2c2lPdEFMNFFlT2lFTnZY?=
 =?utf-8?B?MnFHejhOSjFlb0RzQVE2aWdTdXc2Qkoxa2kya0p1MmRTRDZPeUxiMStmY2Zj?=
 =?utf-8?B?RDRzeXdIS0ZNTlAzYkdIQS9aWlUrUjFhQnJHbitUQnlxREgwN3RieldqSVY0?=
 =?utf-8?B?YkF6UndvYkhSdFRlUXp5R2UzQ2RweWZSc3RXUGQvQmt6NFlxUFp1bXc1bW9a?=
 =?utf-8?B?cnhNMHhuWDI2MVg5Q2xDeG9heERSaTBuZVh1NTBuMVIvSGJnbTQ5MU4ycWN1?=
 =?utf-8?B?V0VIMEpnWHdVaTNFY0tzcVlHRDAyWWg0YkdMNzgrUko0ekthVnVGLzgxRGo3?=
 =?utf-8?B?VXdLelNnaGc5MUliVG9YMDVxc2thUWkzclVvdXp0ekozU1VHZkl5Rmk4QXhW?=
 =?utf-8?B?Y3Zmb2oyYUF0K2FzWjh1b25kakY0cnZYN25EOXQxdFR6aE14dTlsdHN5ZUpz?=
 =?utf-8?B?OVRiVzhMN09mYmJ6ZThkeWVkV0JvZWVCOWtPZEFMODQ1ekE1Z2xHZktlMkJh?=
 =?utf-8?B?NTNzR3pET2o2UHF5eDU0VkEzRFpLbjNIRko4MHhOY0cyM3A2elg5alJXL2xu?=
 =?utf-8?B?bkx3TTIyUjBmNHFDWWZBeWZBZ3JEdGFjL1Y0ZCt6Nlk3bHB5R055aDR1aWVu?=
 =?utf-8?Q?tFhQJEey8RhWVsGoU4aBHsY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdd679e-6688-45f5-db70-08dcdbcc69fe
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 12:36:58.1010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy5S+mNy066afBXX/llPiw2dc74shawHO7SjUAXBo6AdVcrHf5cZJC0tdeV7fxmEjKwIOZc/y4ipQE3SfK4t+yka+EOo3bkGglDwqFsao/g=
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



On 19-09-2024 18:02, Nilawar, Badal wrote:
> 
> 
> On 19-09-2024 17:06, Jani Nikula wrote:
>> On Thu, 19 Sep 2024, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
>>> On 18-09-2024 12:49, Jani Nikula wrote:
>>>> On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad" 
>>>> <himal.prasad.ghimiray@intel.com> wrote:
>>>>> On 18-09-2024 00:20, Matthew Brost wrote:
>>>>>> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>>>>>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>>>>>> Agreed implementation/usage will be same, will use explicit type 
>>>>>>>> for
>>>>>>>> clarity.
>>>>>>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>>>>>>> typedef unsigned long xe_wakeref_t;
>>>>>>>
>>>>>>> I agree with this.
>>>>>>>
>>>>>>
>>>>>> What? Really? I thought it was pretty clear rule in kernel programing
>>>>>> not use typedefs [1]. Reading through conditions acceptable and I 
>>>>>> don't
>>>>>> use anything applies to this series, maybe a) applies but not really
>>>>>> convinced. The example in a) is a pte_t which can likely change 
>>>>>> based on
>>>>>> platform target whereas here we only have one target and see no 
>>>>>> reason
>>>>>> this needs to be opaque.
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>> [1] https://www.kernel.org/doc/html/v4.14/process/coding- 
>>>>>> style.html#typedefs
>>>>>
>>>>>
>>>>> While running checkpatch on my changes, patchwork had also issued a
>>>>> WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the 
>>>>> usage in
>>>>> the Linux kernel tree and found it used in many places, which led 
>>>>> me to
>>>>> assume it was safe. I now realize that I should have been more careful
>>>>> in understanding the context of its usage and referred to the kernel
>>>>> coding guidelines. This was an oversight on my part.
>>>>>
>>>>> Since this doesn’t impact the CI or runtime, I will avoid reverting to
>>>>> unsigned int immediately and will hold off until I receive the other
>>>>> review comments. I will incorporate the changes to revert it in
>>>>> subsequent versions while also addressing the other review comments.
>>>>> Thank you for bringing this to the attention.
>>>>
>>>> If you end up replicating intel_wakeref_t from i915, and go as deep as
>>>> the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
>>>> disguised as an unsigned long. It's a struct ref_tracker * when you 
>>>> have
>>>> certain configs enabled.
>>>>
>>>> You could just use struct ref_tracker * everywhere. It's an opaque type
>>>> to start with.
>>>
>>> The original idea of using typedef for the fw return mask was for the
>>> sake of clarity. However, Matt B pointed that the use of typedef in this
>>> instance is not in accordance with the Linux kernel coding standards.
>>> Additionally, I agree with Matt B that there is no need for the fw
>>> return mask to be opaque; therefore, it is preferable to maintain the
>>> use of unsigned int.
>>
>> I'm not sure it's a hot idea to explicitly state that the return value
>> is a domain mask. The callers shouldn't need to care, should they?
>>
>> For example:
>>
>>   +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   +    if (fw_ref != XE_FORCEWAKE_ALL) {
>>
>> Under what conditions do you expect this to happen? Shouldn't
> 
> If any of the requested domain is not refcounted (not awake) above 
> condition will happen.
> 
>> xe_force_wake_get() flag cases where it couldn't deliver what you asked?
> 
> Internally xe_force_wake_get prints drm_notice when requested domain set 
> ack times out. In the driver currently caller is sometime returning 
> there is domain ack failure.
> 
> usage: where XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL) is used, which looks 
> redundant to me it can be moved inside xe_force_wake_get.

Agreed, the driver should warn, in case of domain ack timeout failure, 
irrespective of whether user wants to continue or not. Will move the 
check inside the forcewake_get itself. Similar to what _put will do in
[v4,02/23] drm/xe: Modify xe_force_wake_put to handle _get returned mask


> 
> case a)
>      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>      XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL)
> 
>      //Here caller doesn't bother about all the domains are awake 
> and     continues
>      func_b()
> 
>      xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains 
> awake by xe_force_wake_get.
> 
> case b)
>      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>      if(fw_ref != XE_FORCEWAKE_ALL) {
>          xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains 
> awake by xe_force_wake_get.
>          return -ETIMEDOUT;
>      }
> 
>      func_b()
> 
>      xe_force_wake_put((gt_to_fw(gt), fw_ref);
> 
> 
> As of now driver have both usages and this patch series caters both.
> 
> Regards,
> Badal
> 
>>
>> BR,
>> Jani.
>>
>>

