Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94466C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 06:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F78010E17E;
	Thu, 10 Jul 2025 06:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWhpPgvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A8810E17E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752127200; x=1783663200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U32j9M5haREKb7rSigk0PTK28BoZNEpUanC+XpwmwTY=;
 b=dWhpPgvgQI+fmEyOMDYvRvQNetH8VMddq9TzmgC6S3e4jELKok9y9Hao
 WAEwY2rfYKxUue2w5vt2F9cg5gggipHIG5WFXXcDgkRl44+oZi0jI5j0k
 vJUK5uC+dhDdZXGUFbbRfFJuTUiRvTWEAKVU2Vs3rnjiikZKsojc71hfz
 LBjgXs/AGBZQDB1hmvpUm9rHgVHvVOppy2e29SR7wQxEWK+r3TvdpvPB4
 NxueAhxWh5Dy15bMiwHMWt9a0hUD5ZDbmXYuxwIn7e9r4Q70bxHmBXoKj
 6eFeIIzTOre3JIm9YUjEIPH+TgXrmIlJfttdhtX9TDLPvxsVBajnLImSq Q==;
X-CSE-ConnectionGUID: 2fYMKf4pT0eqSWirPQPzog==
X-CSE-MsgGUID: yrkMEKw4QBa9HUrB3RYpCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79836171"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="79836171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 23:00:00 -0700
X-CSE-ConnectionGUID: ky8QEF23SeyTF9dSrURq4g==
X-CSE-MsgGUID: pjwPRPRBQvS0VgZi9o1jPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="156310644"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 23:00:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:59:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 22:59:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBLDeUQXN0mbYw6ULOvidrW23UWZ0yoWKXoOfSt/XaSfbiUbbAXXwEJ4YAA6gD6P0ef6bZMdiXa6JbstxZbznTB++IbTZDZegbttLORWS5+mIvlAZBADOWljiSzdWve2vS426hOSgvB07X5uw96s3g3eGIItib73j+oESTOzEobMuwsKGoeEa8r1S0I7vQTP/ULM3Xj9i8NQsNHi9GM3Io2EkbUlBeoijIKapqVbpvleiLbm66/MxZKRKHD3vj7WcaTTxK95QdYEdWjO+/27B4//raN3wVClEEsk0ShfSjRY+aapKN16yvWtt+9sE0mZVfYkSLERAReDdr4l+95oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giQoIGTlRWKAo2Er6N0mn6oy0AwGXPYjwTI/pAMAF7Q=;
 b=wRLyaDyoIlAOrXyTrwp5qFsy6mjeCIr23y5J5Q+k/ZdY0yIbQuKof6ZqgpHQM6Py/w7HFT7XOjVSHJ+HxHvN3ybN3IRS7xxwXx9FICuzauKvT2+Qf7cf/ZcanrsAWVcini8RmH2drcQR2Q7W1f4KjLid5AaW5+W9YfCKSBzK9obOSqKibTxH8eCGN7DQkyKKmgdCrqFVznpYhHT1KGhFmHQcOZLzhn415t3RrYVE4aIrwsRO41ZuERGKvUcWUooZ8lNbjFdNvjypW6IFcfP3WtcOZlMmISyJp02+q6aGHFqCvTmjfDz9ZLpTgrbxR0mLFRWQvyicqut2ja21vy7e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Thu, 10 Jul 2025 05:59:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:59:52 +0000
Message-ID: <e2880cff-fcc8-4c9c-9ff2-e446327fbcb8@intel.com>
Date: Thu, 10 Jul 2025 11:29:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-6-riana.tauro@intel.com>
 <aG7-7Lqw79Y8azK1@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aG7-7Lqw79Y8azK1@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c345d2b-26bf-4193-c4ab-08ddbf76fc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3JnS3RDK1g4UUt5cGJkWWhxM2FjNWlKNmpMUjgzNE15YWh1cWpBOFY2emRV?=
 =?utf-8?B?RG9tTC8xV3lLSGhITDdCeno3dS9CbnNGU3IrenBIWW1VOWNvVFNacUZONTMw?=
 =?utf-8?B?eGh1cUxQSWEyNWdGZ3RaMEJxcHJVdXo3QStZMG1USnZEbVBpMG1DWHV2dVNm?=
 =?utf-8?B?eWZSdTQwNmpCdGFvTVdxZzBscEM0WkV6dVpCNFhXUFQzeW5laVowb1F0VzZL?=
 =?utf-8?B?djdjYW5CTXpNd0pmRnY3RUhQTDFxamZUNkIvQ3dnQ1J2cXluR3lxdXFvWk5Z?=
 =?utf-8?B?eXBJT1h3QU9XVzZmeDZENTRtNmxwS3ZlZ3Q4YjVvSTRnS01EajRmempRTWRH?=
 =?utf-8?B?RGppdnR4YzVPRi9UbFRsUnp0VzRQM3dGK0taMVA4clMxQVYzcUtqUTJmT3BC?=
 =?utf-8?B?VDBvVzhyVzlvYWEwZnIwWlJzbVBNLzlsS3BJTFZYeCtIMENuZE1YRWo2eGo0?=
 =?utf-8?B?a2d4RmQ0bkJRSVZqVHYydy9rOWlKczNLRWRGWk1tSXRCZUdPbk9PNVpad1d5?=
 =?utf-8?B?bUdVMUNxaHY3N1BwRHp4bkJsV200bS9kWmJHVmtZUjBCeVZqU0RlLzdub085?=
 =?utf-8?B?Y0N5RTZ6MnprVFVyNVlFM0tMTFY2NURGM3pNSWtZM1VVWHJEbE55V1FLUjRK?=
 =?utf-8?B?VWxxUmVPekxMN1c3VW9DQlduZkJ2bVhFNUgrd1V3TVY3SjNQTnhCbUJXR1Rs?=
 =?utf-8?B?MVRqKzVudWpzZjY4R2VTU3BDRmVLZlRIY2hLZkgwT2VkUldjWXVCWTJVMzhK?=
 =?utf-8?B?KzVMcWw4ZFhhbTdFTi9FTkxVM2NvY1oxWUliRG82WkQybDBEbWJNL2ZFcmRH?=
 =?utf-8?B?VVVlUHBwT0UwY09vWFZQOXZCblZLOURHaXNidzBFSjFOcVBvSU1vbms5VGdL?=
 =?utf-8?B?SGpLQW9xc1haVjAwdGM5YkV1a0ZiU3h1ZlcwTm9sY1ordTdjaVA2S1JWblRt?=
 =?utf-8?B?VTNQTlhzclg2VDVtankzaWthU0NpeEx2Z1ZFUHIrN2JqTFpkNGtaWU5NVVpa?=
 =?utf-8?B?V2JmTG5PNk4wbE9NVitrQ0E5U2xIcmd0R1ZNS0FoR0ZENmxZRlRKRkovRGhE?=
 =?utf-8?B?RjJJUXlxa0xHZm5oL2ROUGpLZmRIM2hLa0Zuc0ZOSkx2bFlGWWJaSFZjYjVz?=
 =?utf-8?B?YTVNNGpKWXZmK09HSmkwcVNHQ3liMCt6Qk80QUlzMjJNODJvaHFxZXhGckhX?=
 =?utf-8?B?K0ZJdmlHblFCRDZsOExjNXpQdjIvWGUwcEhrNENxWk5rYW1MVUlsb0p1eFhD?=
 =?utf-8?B?L0lST3FPWFdMcFRSbFh0aE4vVDZTc3M3UGVWdEJtRFVpMnROUGE5K2hHL2Jo?=
 =?utf-8?B?eU5mRmhJZFlYUERpTXVGOExmNlRxWkZMZnErT2YrZWhyTm84ZGFDcTFIN1JF?=
 =?utf-8?B?d2NhQUVOM1RmZ0xUQUZvdlpiZyt4SVVNb0dCUUNNSkRucW5ESW11ZzhwTUdr?=
 =?utf-8?B?YjIwWG45c2pmaDBWVlRPUjAycnNaT2VKa2pYeE0xcWFERlI5U2VJbGRkUjky?=
 =?utf-8?B?QVFhT3BNbEV4L3hJQUcxdlZxdUpkTGhKdFpOUDJNc29IRzBOaGdLNkpjSkJB?=
 =?utf-8?B?b255QjBQajB3bUN2TUswRExLdVJKQW80MnBrTDFIWE9YYnRMZjF2YXM5OUMw?=
 =?utf-8?B?QU9oN3c0MEU0L2FHelhGM1VpUG1KMXhORE8vZjJJcisrZ3ZTdlBNMXlpMEVl?=
 =?utf-8?B?TElhS213VlFKeWdpYlZDN2o0aDRSeHVSWGd6TGJvSjN4QUptcWgwajN2VE1G?=
 =?utf-8?B?NjlmUU1pd01QSjJ3V1k0OGY1OHVrbjJ0UlZDQXhqM1JCU09WaUhRQVhFeW91?=
 =?utf-8?B?YWFUOXRaQVpTQTBWekxGekdLdkQ4ZFUwZ0pBc2xDdTUzNjZGSkJrTFZDcDZs?=
 =?utf-8?B?MGN6eUthd2NEMWhXU1Q5eXNtSWxUN2N5dG4zNjlRWUJzZU51Y3QwRVFOUEhO?=
 =?utf-8?Q?6Vk4eUFbxy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnE1aCs4SXNmOUtPeGZzanN5R05OVWVpNDJHdUsxNVZ3bjNCNS90Tm5QckFP?=
 =?utf-8?B?UGh0dEVLbU5GVkk0L204d2FOUTJzOUREQ2hDRkExZUJvU0ZlRFRoazNURjJS?=
 =?utf-8?B?UUFQRU12V2ZmcEF3NDFTSi9kbVJFZ3kxaE5lOXhmMnp0UmRLSkxmSzk1SUZj?=
 =?utf-8?B?WVg1T0dXWUVoMFk4YUV2YnpIdUVmRFBOZ2dxUW9nOHRZNDVUWWVkVHBiMlo1?=
 =?utf-8?B?eGd6dVpvWXRpQmxNa0NqTzUwdEF0Z2VFb3FRLzRQUjNhZ3NuKytLZXNQNkFq?=
 =?utf-8?B?Q0dlRVhrQW9ZZnQrbXlGTWdQR3JjaDlSZnhUcURLeU5WZVJCVUVlcDNCVjFj?=
 =?utf-8?B?WE5NaXJXNDRQNURKYVg5dDBLaCt4bHQzek54VlRvdE9DWjMrODlXV0xzL0lO?=
 =?utf-8?B?bEJaQkU4Q3RUQThQdGp1ZWY5U2lZaTVGYUY4eml5OWdqSXNRMWFUQWRGNVNW?=
 =?utf-8?B?OGU4L0h0M05PaU5qVUZ1T2hteHl6c1NJcVpjcy9qbTNHdlo0SzJrcGZKNDZF?=
 =?utf-8?B?eW53TExLQmZBQ3dTZ1UwdGlkcWdlNmh0d2I2N0M3azNiNUQyUlFVdk9MQTJm?=
 =?utf-8?B?S1pHeXdvTi9WMXc5allMRzZvbWJxNHVvSm10cUhFbzV1ODE2dzN3UUdxSHJ6?=
 =?utf-8?B?VXdvaGRNcWlqOHNtaE5LWVVzOGZkMXp0U0cyYVNwNEFkUi94WVllSEhJQU5r?=
 =?utf-8?B?UWh0cXB5MUN0ZzBKR0EvZi8zTU1GVWUwYWl5cjlzV245QkJ1RjlPK3ExeTds?=
 =?utf-8?B?MGp2UjhrT2l4ZmJQNmtBZExCekJJUkYzS2p2QlVwYWtQZmMvMjNZT1lIUXNL?=
 =?utf-8?B?eVg4djZxeWt3cTNYcHh6SzlaeDY4MWUxNHBEdjJ2WlgyZG5ZVjJoalNuTlBm?=
 =?utf-8?B?REFzRDBqUXp0YUtVZGVpbEx3blRMTFRqSmxOWTAyTDRtUkpLK0JoY3VSSlVi?=
 =?utf-8?B?NUprYVFxSlp6UXJSSFpFTXMvWlpsSUw2dUJxRFBvN21HK1llMk9YdU0rRit1?=
 =?utf-8?B?ajZmMTlJSFVJWllPOXlyM2tTQXRCV3YwYnM0NnRRYXR4ZTVuMmtLdC9OUU84?=
 =?utf-8?B?QkdaRnpIcFdHSlYzSnltcWhiV0FIVDdQV3REWmorRUVjT3NJbmlNS083ZFpj?=
 =?utf-8?B?ZHpOT3RRQVc3SHB6dUkwWTlPZ3FUWXp1dTc5Ui9Bcyt1c2hpekJvSFkxQ2M4?=
 =?utf-8?B?aGhHYXRxdSs5Z2JBc3JadHJaaUZrdkd0WVA5UU1OdXlhQ0tOTXVDWUEyUjlV?=
 =?utf-8?B?d2k0OHd0Mk5ncVpSYnc3QXYyQ2lKSWk2UDUzaVd4WGx4elFFSDhvOHE1dnpN?=
 =?utf-8?B?Sk9uUm9oU3o5UHJJV1o3dm9BVHlvNEdTRkNva3ZXWHZPamRGOWNoZjZFWHVD?=
 =?utf-8?B?QmNOQjBkTE9NOFMwZnpNSlhVd1ptL3dsajVuOC8yZkdTck1PTG9GSngzOU1p?=
 =?utf-8?B?K1AyMXVUQ00xbGx4UGt6RnVUMmFkTE84eXYwWExtSDlMVFJ6Q3BZaUZFamdR?=
 =?utf-8?B?WUNkNlFFdmNZamNYUndKUFdDUDBZMTRoK0wrd2tQQ1M4dGN6d0g5TDFROWlC?=
 =?utf-8?B?djBlaTd5dkZ6MEt1bWNKVWJMd21jcDU5Ukt2VndkS1JwbUxkc2VEaDdtWm83?=
 =?utf-8?B?NUZvYlpZbUVRMzhoSHhQN2NNMDFjVTBIcXdQVDEzM0MvVFBpM3pobWJkY0Fr?=
 =?utf-8?B?UDA3dDNrMmpqNmNaUWN3VnlxS0YreXFYbEQ2OGdjSlU2NWV5R3VHUHNaMXBK?=
 =?utf-8?B?YitjTlVQV0J1SUdjd2JYaDhFeElLR0VnM0tSZzNJdVpsQzlSUG50ZXRsTFVL?=
 =?utf-8?B?bERKdGl1aGZNdFpVZGxrMitFZlJON2lWckhEcVV5WWRnVmxrd1FaMHN0TVV4?=
 =?utf-8?B?WFdzWG1MSXJ5VTRUSmR1dTZqMjUzOUxFNUdwaGtMV0lzR3FHMDlCNmNpSEFT?=
 =?utf-8?B?KzBmVURsQ0xuOW4wNE5WQ2x5WVdRbG51UHE5dTBuS1ZmUU92ZkZteVVTajJr?=
 =?utf-8?B?TkxBaC9UTDl2c3hnS2lpVm5nVzBDLzNHSzNQT25Qck5mbC9HdEt2T0JNb1M4?=
 =?utf-8?B?elM4VFhOcUNMSTdaT01YKytOYituRFVKRjRCdEl2cm9RazQxL0tkWWNxbVYx?=
 =?utf-8?Q?ON6I8AGUPuCOknlkIOe47kpaq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c345d2b-26bf-4193-c4ab-08ddbf76fc62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:59:51.9450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zljaIyJ9zx2oU8KRC7Q7gYaWRzW8rWvmqnd0p+EqyIaIT9lL5ex3y8FjPjSZg8Xn/UhZEIIOiKfTqDVEZnhrmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
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

Hi Umesh

On 7/10/2025 5:14 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Jul 09, 2025 at 04:50:17PM +0530, Riana Tauro wrote:
>> Certain runtime firmware errors can cause the device to be in a unusable
>> state requiring a firmware flash to restore normal operation.
>> Runtime Survivability Mode indicates firmware flash is necessary by
>> wedging the device and exposing survivability mode sysfs.
>>
>> The below sysfs is an indication that device is in survivability mode
>>
>> /sys/bus/pci/devices/<device>/survivability_mode
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_survivability_mode.c    | 42 ++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
>> .../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
>> 3 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ 
>> drm/xe/xe_survivability_mode.c
>> index fefb027b1c84..ca1cfa13525a 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -137,7 +137,8 @@ static ssize_t survivability_mode_show(struct 
>> device *dev,
>>     struct xe_survivability_info *info = survivability->info;
>>     int index = 0, count = 0;
>>
>> -    count += sysfs_emit_at(buff, count, "Survivability mode type: 
>> Boot\n");
>> +    count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
>> +                   survivability->type ? "Runtime" : "Boot");
>>
>>     if (!check_boot_failure(xe))
>>         return count;
>> @@ -288,6 +289,45 @@ bool xe_survivability_mode_is_requested(struct 
>> xe_device *xe)
>>     return check_boot_failure(xe);
>> }
>>
>> +/**
>> + * xe_survivability_mode_runtime_enable - Initialize and enable 
>> runtime survivability mode
>> + * @xe: xe device instance
>> + *
>> + * Initialize survivability information and enable runtime 
>> survivability mode.
>> + * Runtime survivability mode is enabled when certain errors cause 
>> the device to be
>> + * in non-recoverable state. The device is declared wedged with the 
>> appropriate
>> + * recovery method and survivability mode sysfs exposed to userspace
>> + *
>> + * Return: 0 if runtime survivability mode is enabled or not 
>> requested, negative error
> 
> is the "not requested" still applicable here?

Copied it from boot survivability. Not applicable, will remove this

> 
> 
>> + * code otherwise.
>> + */
>> +int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>> +{
>> +    struct xe_survivability *survivability = &xe->survivability;
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    int ret;
>> +
>> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < 
>> XE_BATTLEMAGE) {
> 
> Do you think this condition can be better handled with a 
> has_runtime_survivability for platforms that support it?

Was used once so added it here. Can be split out to a different function

> 
>> +        dev_err(&pdev->dev, "Runtime Survivability Mode not 
>> supported\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = init_survivability_mode(xe);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = create_survivability_sysfs(pdev);
>> +    if (ret)
>> +        dev_err(&pdev->dev, "Failed to create survivability mode 
>> sysfs\n");
> 
> You do not return ret in the above if condition. Is that intenational?

yeah this is intentional. The device has to be wedged since it is not 
usable on such errors even without the sysfs.

Thanks
Riana

> 
> Regards,
> Umesh
> 
>> +
>> +    survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>> +    xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>> +    xe_device_declare_wedged(xe);
>> +
>> +    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>> +    return 0;
>> +}
>> +
>> /**
>>  * xe_survivability_mode_boot_enable - Initialize and enable boot 
>> survivability mode
>>  * @xe: xe device instance
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/ 
>> drm/xe/xe_survivability_mode.h
>> index f6ee283ea5e8..1cc94226aa82 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -11,6 +11,7 @@
>> struct xe_device;
>>
>> int xe_survivability_mode_boot_enable(struct xe_device *xe);
>> +int xe_survivability_mode_runtime_enable(struct xe_device *xe);
>> bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
>> bool xe_survivability_mode_is_requested(struct xe_device *xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/ 
>> drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index 5dce393498da..cd65a5d167c9 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -11,6 +11,7 @@
>>
>> enum xe_survivability_type {
>>     XE_SURVIVABILITY_TYPE_BOOT,
>> +    XE_SURVIVABILITY_TYPE_RUNTIME,
>> };
>>
>> struct xe_survivability_info {
>> -- 
>> 2.47.1
>>


