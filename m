Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BD1D35668
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 02:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DBC10E60F;
	Wed, 28 Jan 2026 02:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AE8Az3tN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CD110E60F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 02:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769567797; x=1801103797;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EZNO3uobqMUq1d7AsKtcIm8Q9I1Piqxp/k3v8NqNnqU=;
 b=AE8Az3tNWeiExUUbln/Ba5SKw0SCcbF1OF74znA5e6H23sRZ2rbVzgiD
 E7B4pu1Xi4muZqAfpwPnIKLyaip+D//KHZ+TfmxKEJfRuPwWG6CBt7tEj
 XzynZA/k01xQLlek4N306MUGAHOy8MBNlas70IDLYtiV4BlViG0rcUsMk
 3umHpGMNAxtTKtBZ0Ik8URHVp3rhQPy+taxF2QfRN1arsPac9icF8JEoE
 +kA+NnFRaG2rqCuPCixnbLQkCfUqtQ2BqgSYUcjikpmwWp9BNpu0uR2h0
 NBwwKFTS8eVQ+IKArB7MjDpJs/eYn5F4RIAQSFmbI20Gu4BVks4+XGZ/o Q==;
X-CSE-ConnectionGUID: b8oifBwfSXiQCwNEBAV18g==
X-CSE-MsgGUID: cn9QjmmlTg6TmIkjnN0CXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70817351"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70817351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 18:36:37 -0800
X-CSE-ConnectionGUID: BWoqTcz0QAOJtQByg7GcNA==
X-CSE-MsgGUID: wI4cGORrTKe9RCZjN3gbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213101870"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 18:36:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 18:36:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 18:36:35 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 18:36:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q76z5XuyYI3+q4/ihELTzF6u6brXZKZ4ofc4jk9gwiQLWSPAKD2ERtcLOEm1Ez+db7y62OGydHfgbuX+9MxaUS/j9+l85j09eBjJuUI4M3kHTdz4nf5RktR7XsPNocIr1Zid+jew1boorIm95j4vbl79bqGG0d45Qccmgi8hV1ztm1xULGxSuG6oX53VIE3T9BHLFgfhojPE/4pg/fSdjxu2u8VBtZZvLrLZYdEsACcjpz89Zmf9N1qUdaWrIDmo6emMARfmLGm+kaL70hgByMP/EWf2bDDHOnhfdA204MnBHnNWXAUXWhFVHH6aVYj/DzeNCfUcLtejcPInbnYJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBWc4a4tWNjJFjIA+yj9Vle6xTwDPB6/xh2/PQT55c0=;
 b=cvjBLhTBCM1CB3F9207fJaC7M7YH9NfuAhLFALN1Pv55Zx9DRDbN8hXb3Ctai7kQ+sK7TnmuZqNgECCzpGfBoUqipE1hTTPxMr9HUmpw+wMZpF8M3GPiQiuKw9aeQG6Rf9OpO1jfUcim5SWMHwqWoCzuoqbkCvNxOHjk1jMO+OwuRI8G2D+fMWEvbLy5N31W4Xm4GAFyPwJzKtUHRCVpBDjRkYbXQpG3iqy2AL0lG8P9Tb8oPMDmNfPyN5UaEJoouQo8I85OIF4YGEMavTjgfNjyawOQlGcEWD6ZG8b14Rdc/JEOgVEKzYggfNn+7gLqaoZp92gVuvvjHwINL8f8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 02:36:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:36:28 +0000
Message-ID: <2f27b1fc-abac-493d-a758-7dd3d11f1e6d@intel.com>
Date: Wed, 28 Jan 2026 08:06:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/11] drm/i915/vrr: Add helper for PSR to enable
 Frame Change event on trans push
To: <intel-xe@lists.freedesktop.org>
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
 <20260127124120.1069026-5-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260127124120.1069026-5-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c75a94-9ae5-4e50-d558-08de5e16090d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnVGQUxvVWV1Y2xsdEw3RTQrMzBkbGdWWmg1dCtNUW52QkRybTI0Z2RHUXpE?=
 =?utf-8?B?WU82ZFZYY2JrbE9LNmJHRVhOek9tVEpLZ1dWaitSOXZESkZVWWJtNmwvSlQ5?=
 =?utf-8?B?Q3FkRDFxbnZhTWpiK3NRbFZUM3h6QXc5UWN1VkNKaDEzQUUwS3Jwa0lHWk5l?=
 =?utf-8?B?bzB1cCs5OFRpKzZBOERGNUUyTjF1dy93V3ZwZk9lTXpJYWo4aXhSKzN1M0Yz?=
 =?utf-8?B?U3pVK1hwaTZZQlJoajIvWGdIS3hiTStvcjlVbUpIbW1hMXFaQUhiZy9ORFM3?=
 =?utf-8?B?M252aHRXa0lkVzN2SFJ0Z0hqWGs4OEROZTE2NGFMeGNyYkVmaDExYTVaaXNL?=
 =?utf-8?B?VTdneDROZXNwcEcvL0NrRjRyU2oxblBKQmtNMGUwWVRhcFhPRTVvdW4vV1Y4?=
 =?utf-8?B?RmEzbFlLZkx3cVdEYnRRRlhxWkRvRGxvTlVneFJ5dHhBOXRjMnhQMmVOb1Zv?=
 =?utf-8?B?ZlVBOW52a01yUzZKUGNvOFdWZGFLc0lvZUxKbkUzNW0zTkFmQTc1N01Famp3?=
 =?utf-8?B?cU5xMWxobUFBY1hNZ0oxc2NIdGswTnY5Z0t6RVRxUnZqUVA3OFVjcTZva3Bj?=
 =?utf-8?B?SjNwL1l2ZmVMVmx5aDJySDBVeVVBRzZUcUE5RXlQNzBneDh5TW5xai9QRjhy?=
 =?utf-8?B?R3RZSW90ZmJ1T3VYUG1TVVRaVExFR2VmS1J2OE1KY2FIR3lwaTFKbEtUTE9K?=
 =?utf-8?B?cDFoNlcvQWE4Q0hyUDRBbHNRYWFKRGg3UFJzNUt6ZC9MdU5hWnlhSHErYnZi?=
 =?utf-8?B?WGxIZEh4MndVaXNpUEQzQ0pGNDYyOUxXZE5PRTlXOGhWQ1R2c2JKRkxHOWJE?=
 =?utf-8?B?VUpScDRaa3FOOEtmWTdCSkQzT296QW02MXgrWlkwRkxjaGxIRXVMWmJQN1Rp?=
 =?utf-8?B?cU9zRHczTnJVSW11dkRTdFVmRUNGTTkxQXlPdjhhZ0ptMkZyWkt0c2tFQngz?=
 =?utf-8?B?c2Z6SGY2ckEzSlhzdDUvc0FoQ3pueHpsWFJQYTRjTmt4YkhkMCsraEFFanl3?=
 =?utf-8?B?dTlSRElhZ2F0TVZibXVlNVRNbnd5TjhvSDg4ME1WL0VkT3I0SW4zN1RvVmU4?=
 =?utf-8?B?YjY3Vkw3OGp4bDF6WXIwSDJZK2pHWTJWZW1laU5lajk2T2xBODBRNjRqc1RH?=
 =?utf-8?B?TjBEUkZHSTRma2hkVHAxNjNpcGoweUdoUDQyZ0tkcTlYRmhDajNnWmtVWEdx?=
 =?utf-8?B?d2lMSTI1OEp5am9FSDNYK2VoWHlENklHQ1FPdS9VNlYrZ1lQd0ZqZW5iNTZ3?=
 =?utf-8?B?eDJ3b1dHdVBnVnUvTVROVjdIay9BUVhXeExiQzVwYWZPZGU2QjRrTThUV28z?=
 =?utf-8?B?ajZqNE96VnRYSkxueFU2VkZ6K2Fac1E1V0Q4c0tkMEs5RFdOMEU4M1BKcEhn?=
 =?utf-8?B?TVdDOU4xY3UzR1FwamZ3UWh3RGxwaVVEM082b3dBMDIyOFc0TXFZWWNqVFM3?=
 =?utf-8?B?WHB4MnpPV3pabitobkJQQkF2TFl1OEI3UFBuTHAxRVBveUIzNHlpZFFKaEhM?=
 =?utf-8?B?THMrcHZmMTcxYzk4RE5wQWNmVDRtU2pFeDFQeFR1ajU3REdpMGZER0NxaUs2?=
 =?utf-8?B?ZnVLTHluSS9vRjAvMWIyaTBlaVVYbkFKckhMck82NHBEREVpTC9XNHkxMWJ0?=
 =?utf-8?B?ZUdBZ2VSY0tUL2xsOS83TFVKck83T0xHUEZIN2lzK3dESmNzN2t2QmZKdHpH?=
 =?utf-8?B?MDVJMDRyeU81VmdIUlRzSG9PNWV4UlQxWC9ESFhoNkd6L1hNN3FDNWhVQ1JB?=
 =?utf-8?B?ZTNlbU94TmFEclBaOWM5OGFwcU1nYTRqYzBTRUFSc01ua1JCNDNlOFVKWkUz?=
 =?utf-8?B?WVhCdzh0S0tIKytYaXhFZnBuY3l3cEpSUDlobVZjbTNuTUtpbjRTZlRKYU5X?=
 =?utf-8?B?K3Z6MTAwYTZqKzNmOWdHOW5MeW9IbnZsVG1ha2JFWm80aFdlNVhDSjF3aVEv?=
 =?utf-8?B?RDNaS1QzYlNaL2lwaWRPM3YwV0tCSlpCTWdaalpWK3lkQ29IaHVXdFVYcTZz?=
 =?utf-8?B?cEJPUWMvK1BYWWFBd3NmYU5SNTBBc3BVYU1ObThUV3VwNGpxakVCaFUrZWlu?=
 =?utf-8?B?RDA3YzVsdUw2b1dlaXNSY2hXMlY3N3F6MVd0VTZxOXpDNUV2WTQxOWVDNXc5?=
 =?utf-8?Q?ry/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXlWOEk1N2FHQm50eGlqZEsrcXl3OGhYMExUV2dqbXRrNjNuZnBubmNOMmQx?=
 =?utf-8?B?bGw4dndORXhCVTRDU2wyVmg0R0cwYnNXaUwrRW1iYnFNZUtpTnJiQ1Q4NTJ2?=
 =?utf-8?B?MEZJK3VNdFYremQvbDNqUnoyeHdGVUFzUlBHazlTUEtCWU45b29nVmxDVkNO?=
 =?utf-8?B?YzRiT1J3MkpEZGo3RUpxYndxeXArU0E4OGh6dXpwdUpHbGFPc3RUemw3N0U4?=
 =?utf-8?B?YzBRL0tMby9nZ3pMMVRHUElCb1lOK2h3TEhLVTRidkR3Mm04NG9lbjN1TmJG?=
 =?utf-8?B?TUYyVFlnNjZISytVMnpkZDY5WC9vMlVOdGtnUG5UNDl5R3VEUWZOcnE1ZzNv?=
 =?utf-8?B?SmVZcVNwdEYzNS93aTlmNlJxczMxS1RFbGV6cG1LOXdCTFhhYUltMkw2V3Rw?=
 =?utf-8?B?R3YybGZpTm1HcXpPRC9CRVZzSzN4T3ZGcDFZeDZuREVDY0dVUXhGalVPUWV0?=
 =?utf-8?B?a3VSdU5TbUpUcENEaHBQSFJrSnd2aGxIeTU3OXlBaWRyWDFOU0hFM1JhOC9C?=
 =?utf-8?B?eXJuSk1BbTZvY0llOStpVkZ6MGF2Skd6ZE9xUCs3VnlvU0luUURkTXNsQXZh?=
 =?utf-8?B?Mk5FMU0xaWltUW1TZCtTWVRNQnoray9vUmx4b0tSRDBYdXpVczh4TW0vUFlx?=
 =?utf-8?B?aHVnZ2dOOU1LUmVsblluODIzVW1hekRFbEdwY3lxT29CK3VWcHZ5eDJHN0ZS?=
 =?utf-8?B?N3hVQ3I2UExHNlhXWWMrd3pycUV3aEFOVlh1cWVjQnlLd1F2eGNnczhCeFhP?=
 =?utf-8?B?RUY0V1N1MTErV3hHcTRLR25nbmdqTEtsSzdrT3Z0YnlUYnVta3pVQ2YrMEFm?=
 =?utf-8?B?TFRUS1JmK1lSQm9MYktDdjc1RFRoNXdIYlo5ZDJSVnFQdjI4UTl3cnp1bGIy?=
 =?utf-8?B?SzU2TnNMcnZYTDFJR2t5d0dDbytmb1BWd1YrZ1FUVjRZVG9uRHg0UVJzU0pC?=
 =?utf-8?B?UXVHYVBIeHFYdUFhVWlJVEVMMkh6dEhxdE1LMEYrYzdUWldwVHJzSDdQYzE4?=
 =?utf-8?B?VUdrUlloc3pwbG42UXZac0prbXBEOG5qdnQ1N243YzZVQ1VqQjFxZTlGNEpH?=
 =?utf-8?B?V3lTUXluMU9ld215VkpmL0NpMW1rVUJiai9meVdpNHVHNHBpOUNvdnJlTmVG?=
 =?utf-8?B?cDZ4L0laVHNhOC9NQ05TbFF1SEZPVnZCWkhrQjBUUlRNNUNORTNOT2wzNmJq?=
 =?utf-8?B?NEZCcUZnaXErL2FnRUhndUFsOE01bEpkNlZoM2I3RjVzNzk2WlFwTC80akxP?=
 =?utf-8?B?S3FlUm9JY0ppMkdIdE5keVRMNE94aTlTOWJUbFh1d0ZRZU5sV2ZUUUdOOGJP?=
 =?utf-8?B?RkdzcFdOb2ZjZ1h6aTIvTmJwUUgrMExpd1ZXcnhwWE16YXp3SUkvVVl1MFZP?=
 =?utf-8?B?aHl4TnhhbDMxUHB1TWxpaVh0U3huV2JYRUVwOUFMVDBXOUYwTnlnVkhZWlcw?=
 =?utf-8?B?VmtiU0gzYnhSb1QyeGZiUXAvSG9DM2V0LzRUdy8wSk5LU3I4NnlJNFA5M0Fo?=
 =?utf-8?B?bm4xUGhqcGRnK0F0MUZqcXpMbW51a3MzRWhjS1hpR0VIeVQ0MlIzN3hYU2lv?=
 =?utf-8?B?T0tLUWl6YXFITDhBNlAyYkdUOUxxN0hVZlJYZWdPNk02YlRRL0pNbk42NFhC?=
 =?utf-8?B?eTJDRVRzVzdtak90RkpuSDI4bEkreEtKQ1NwdWZOeEtobk5kTVFSeFhvTTd1?=
 =?utf-8?B?bWZxamRLNVFhVExBYUkxclJycThvSzhmNlQxL09VVFBtRHVibkdIcnpTK3dk?=
 =?utf-8?B?dDdDMEdzZlRQZDUyc1RPSUp0UkI3ZGNFMUVyN21IeFZtQmt6cldyNjNqOVA3?=
 =?utf-8?B?L0dEQXR5WWRGMGJwcmtMSlpoQm5UaGQ3R3VTMGdVcHg2bVpZK2ZqR2dsOWxN?=
 =?utf-8?B?a0VkcUtXNFlOaDJUS0RwMnBGaUVUZVVGMmh6RzQ1Um1YWGZtdkd1MU9HT084?=
 =?utf-8?B?cUsxWlI2c1JTSStaYnN2MFhma2gxZGdkY3l4UGp1ek5vd0I3MUVVSGdzcld4?=
 =?utf-8?B?OWJNdUoraU4zaVVxNmJIUWUvT3hLRVlZN1BDc1NmUEY3MzdTdU5HN3NMNFhk?=
 =?utf-8?B?VDhYdVNkUm5RR1FiWGpaU3lCVU4rVXJxZ0ZhLzhkbm12c0Y1dXVPYVdrYy84?=
 =?utf-8?B?Vk05dEtFNzk4Sys2b2lrL0J3YVcvRHlHKzFGVWtjR0UvcEROK254UHY0d294?=
 =?utf-8?B?eEVscnk1U1pSRUhwMFFCZzJhT3V2bW50aStJYkhobmsvR3RXb2wra1UyU25l?=
 =?utf-8?B?eFdzb0s3UFRvRHZRSTlLR1VhY0d0a0FLYWRSWmNmbk5TS05nalY3WHZSSDY5?=
 =?utf-8?B?QVd4THBocjluQ2N2MTZFNUVOcFEvQkFJKzM3bVFZcjFrTVdUQUVNZitSWWR2?=
 =?utf-8?Q?Xk8yI7/8GELf8jeg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c75a94-9ae5-4e50-d558-08de5e16090d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:36:28.1406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLGSMfghRLoKIo9pKUNEWveBe70cvrWwGmXwtFmJvddKXQa7XhGN7+eq/pey44EhXtzf1nxmkk2Uuesskz5nEbFgzLtoDTgPOZTazTMrBzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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


On 1/27/2026 6:11 PM, Jouni Högander wrote:
> Add new helper to enable PSR Frame Change event generation using trans push
> mechanism. This helper is to be used by PSR code on PSR enable.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h | 1 +
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index f26989c74268..66c68e7f3a49 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -973,6 +973,15 @@ void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
>   		intel_vrr_tg_disable(old_crtc_state);
>   }
>   
> +void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +
> +	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder),
> +		       trans_vrr_push(crtc_state, false));
> +}
> +
>   bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state)
>   {
>   	return crtc_state->vrr.flipline &&
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index bedcc8c4bff2..4f16ca4af91f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -33,6 +33,7 @@ void intel_vrr_dcb_increment_flip_count(struct intel_crtc_state *crtc_state,
>   					struct intel_crtc *crtc);
>   bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state);
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
> +void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state);
>   void intel_vrr_get_config(struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmin_vtotal(const struct intel_crtc_state *crtc_state);
