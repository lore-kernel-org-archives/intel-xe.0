Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C157FD74951
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 06:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D410EE02;
	Fri, 19 Dec 2025 06:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQVZ0AXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D210EE02
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 06:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766125116; x=1797661116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CwbaMFWALMA73D0LyKn8sV28waLsYgMs70XVm69m69A=;
 b=gQVZ0AXAypss8nSRk8bOs4vN0/Od0ldIuOcQeUh/WXtChUWBajkrGQHH
 t8jpw/nTstoyhZNRICCPKKP3D3gWoyPQm1u3VufFDHXq3LvFaVCujQCSd
 nFg3h87sw29dPGGXNg5i0rjPRJ79R7uiha0lz2mxHdldMRkLHAt7T+UaR
 fAeRVuS5ljAqHpGQtYL5FIDHCw47z6SJZeaW5lDPftw8c1evVGrCN8Aph
 +O9xetFH2WHqh3vAHCi4cF2riNI5Af9XaOlTg90EExz72UVBjZCPme22e
 /i4gzQirA2URWefcQ1O8sMneSD2mh1Urb2kf3TYQ6oIbucLlxYjheKhmE Q==;
X-CSE-ConnectionGUID: vVDyWyFFRxuZRaGFjIHjrg==
X-CSE-MsgGUID: qciWPI8+SMKG93OW92P/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78402586"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78402586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:18:35 -0800
X-CSE-ConnectionGUID: soiHHue9ThOScKo6/cLFqw==
X-CSE-MsgGUID: bM9wXoW3TvOyH2klkwYlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229819211"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:18:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:18:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 22:18:34 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:18:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnqxpbcTFecc1wYQM/yDAvXM6bu3PiecoPVCtbW+/sPKUSUSYYsaOuFYY/nOjcdVsuEgLo3mabpYB1XF0k/wFqq4CI2JOiSYS8R+fwxKmL/LtivDqkmDJZB7bpaZkvUAnbJrhh1erKjQK+vc4ouFsptuQpeJvEc0Isr2OvwhGWzg53tdXUWNTrzQUhWQzkY44BAvx9iQUd/qbOUHDlInXNoG20DSfWcCT4NZ4j/Mwz3371IjZ0iiy2r5uIWV4bopmy2GxfPWU1sQsBgrOhoL/N38NB9uFaE3nie1RDI55nCMeOhdBgtA04gEjBLpPvaofxfGMsO8qtKLBcG8XSooGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEajZpFDw2mq5k3mn+gJjtKydO3cIdpE4E5gd0y0eKk=;
 b=wzJlPLYMCgvNgoBlH5f8HNZzYd/BnhkjPZEI1lU5etcLBd+CT+LbXc8sIwXkmlsz+1EdBrbo4UD2YxZJPXhcMPnV73YEzE0g6WrJzX1z0LlwZIN4MGhzLRCSH3Po31FHr8Kb/qyaMdnFYqXWSi4KpV/BOMOxpbUXvn02zL6ldusHr6y6YTF8ZAz5okvneoMOyr6rlEGchVRT18vDkgdQM2ORTYVDA9NOlfvQyzzBiSwpQTIQlXYgyjQ2/us7cDZLlCCgYP/QmTzYF9udURyinqFNJBpWQlXgoYEr7fYoNq9BNSdROAqPGQZgP56JhM2wcqZ8+HGRgvbVH8WP8Mjkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:18:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:18:32 +0000
Message-ID: <13d08d66-bd7d-462f-a75d-fb821b82cee3@intel.com>
Date: Fri, 19 Dec 2025 11:48:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/soc_remapper: Add system controller config
 for SoC remapper
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anoop.c.vijay@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
 <20251216074159.2788534-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251216074159.2788534-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2c9724-0bdc-46ed-ed03-08de3ec66ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVozeCtDajJ2cThvK2g5bnQraUhnT1ZzSWQzQnJZTEc3R2ZPL1p4S1FMY3hU?=
 =?utf-8?B?ODFJdEJkSkNJMEZPSkZyajkvK255S0pkQStqUUFLWXZMRnJGWHVvbDlFUWhL?=
 =?utf-8?B?VTU1YXhzOXlDOVc0Z0pWcDVRMVBweW9tZEtnaWNkbm5XOHp2dGJNalRtWkNL?=
 =?utf-8?B?NlY4d3h2SDRFVGQzTVpWOUdMTlNRU3pUS2tldExBZGYwTlA0U0pJdHlobUlN?=
 =?utf-8?B?UDlvcVNVb3BOMmszaWlOaHdCbVFRK0pkYW1wU1NUdlZkd3Z5L3ZCL2xybWg2?=
 =?utf-8?B?blN0UmsyOEZyQ1FyTXNyTHB3VmVFdlAxZEZJb0JsbWp3UUY0cGtqczBMVU5M?=
 =?utf-8?B?Wm1kNSs1SlRXM2hlT0dlUTFHYTVSRk9HTElhdXZrb0N3YUhyNHNyTVZZVG4y?=
 =?utf-8?B?dDdKcTdMbWhHSEZaZndQbnVOQUh5d2NYOFBrSnFKeU1zV0x6VzJFbG5UUU8w?=
 =?utf-8?B?N1EraTNPL2ZEUTVjRlhqT1VrcUJ3eFJlM3ZkK2E4cEtWYmt6SXd6cGtSMTR2?=
 =?utf-8?B?MElCaGNjTUh3d1dpUTFZQTQwMk5wS1BFY0crWU1LZGVldzUrRDlJeUJmUnA1?=
 =?utf-8?B?VEZHaUQ0VWs5eU5pVjNNOWVYdFVLUzhERVYrbUVhZVVCOWYzWWNxRHlBQ0Zx?=
 =?utf-8?B?WXE4Z1RrcE5yY3l6L3Z1d2hZK0lpVEYxZ1pxbDhKQmxNSnVpY0JhTE5wUXJx?=
 =?utf-8?B?dmhlVE9scWJNK0RYOGpZV1hSNmRjUVArRVhWU2cwdE42UXZOTjNydjBTQnRS?=
 =?utf-8?B?UUZDQWNaUE1qUFRvMmczOWRzMDN0akVXdHVXT01yLzNUV2pLVzFZdUxIdzRL?=
 =?utf-8?B?SU16dlJLSTZXaFZtR09GOW1weWUvaTQxMUlZMHQrekpJMnpGWldNVUVxNnJx?=
 =?utf-8?B?T3lJQ2wramVjYzVJOGtUWHhrYnF0YWgxK2JZelNPUkNsdWdDZWlITFpxSWta?=
 =?utf-8?B?bXAya2RPRUF6aTNMelc0MlFoTngwb0JiTjhPL1NTMCtUcjgrYkp1MCtMQ1JM?=
 =?utf-8?B?bVZobUQ0M3BwOUhWYXFMQXpEdkNiNys3ZDdjc1pGeEVwSGZaWEVCd1RHaHFx?=
 =?utf-8?B?OXpxYmJxR1owckt4Ym0yMGdKMDlPcGFYQ29mUjZEZitwN0c5OEVrUzVDa21q?=
 =?utf-8?B?dXBEcXZld0U4TzVBQW9XQ0ZKSkIxT0Robzd4cnM2aFBGQnJIOTQ5NDl6T1Vu?=
 =?utf-8?B?OWluelMwL0g5dGxSek1VZ1RnUEhoTFh2OUdYSURxa3FydytzYnFpZmJjakN2?=
 =?utf-8?B?N2djblNZMkdrMWVQMEpQYW1mbHdmblZra0s4QXBoWkNxSVJJdVNXektCZkN5?=
 =?utf-8?B?R29MWEV4Wk1aSlgzVjQzb3hmdnN4OWRqcWxCNzlpYWdoUmJjZjhFWHRJempZ?=
 =?utf-8?B?eUVDV1lBMGo0VHZiR1lGcjdvTE5PT0V6Q2JKdE8zVkZGbGFua1hmMkh0dEpr?=
 =?utf-8?B?b3JodnB0WGxXeU1XK1ZSS0JySnMyVlE5dnM3MWl2Ync3SjFKUEt3ekdSRDc2?=
 =?utf-8?B?MmY1T25BWUlFallmaU9ySk9qN09HVmFCTUF2WGJ3bXVkRDVMMmtCc01naUJ0?=
 =?utf-8?B?Rm9lK2ZJTmkzRzZSWUdTckpibWh4VWh2eDlNTmI5YSttY2JvNWhoWjJQNFZC?=
 =?utf-8?B?V3NESCtPWTkyaEp6c0FMSFBORXo2aGxneE9YaUJtTTgzTnRucEM5K2ZJbEVT?=
 =?utf-8?B?SWY5ZllhWUhJUnFmR3VLSU9NemdZdDhOaElOeXdWVnYvOGpQcENwQ21yQkUw?=
 =?utf-8?B?N2Z5eHF3KzB2TmMwcysxSzI2dmo4SGNKcjgrSFlzWHFUQUk4ejVPRUtvL0U2?=
 =?utf-8?B?VXlLK2krMHltN3gwRDg4b1ptQ0E2TlBhWGVmWXRvcXNkMEROYWZGazY4Kzhw?=
 =?utf-8?B?M1I3dmZyZ1VCbkFwTldIT3lmQ3laR3FvbHV2NUR5K2R0RlNibEtSYVlod0dn?=
 =?utf-8?Q?Z1eo7WF16Qx8TgbSkDDdu6eaZMcLV0Al?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBpN2Q5SmdEZE00bTdLbE9MOWNNYWJodjg5N00wVUN1L1lYTXBUOVNVMWsw?=
 =?utf-8?B?eGl4MGNuZnhTcklRanNiSUZIdFB3bHF5eFo4a0E5YWZmU2dEVmRIU1NWRWNH?=
 =?utf-8?B?R2lnOXl6RUVJL3dxZVlvdGF5ZXBtTDlJUFlIQnB4aUczN1cxbXAyRG1xUGxu?=
 =?utf-8?B?c1o5VkVWVVJ5Y2RycWhtcXR6dXU3YXhBNXhqT2NKb28wWnNEdXBtTGV4K3A3?=
 =?utf-8?B?dnJlRnZpVHp3RzhEMVRuTncvTHpvbDVGTG0yM1poSW81Z1A5S1p1NHVUWldo?=
 =?utf-8?B?R3UxKzhCV0xJbU01WDRxR3NDajFJTlAwclg1MGZBTFBYODdQS1VYY1FNSk40?=
 =?utf-8?B?V3hKY2VVVisyOXMvNjFZUy9DQWY1aE51MFdKZlZVeE5RNnJsc0I1L0tzVEt2?=
 =?utf-8?B?NjFZditzeHdoNjdseGN2dERvNGhEbVJiUFFrWk90TDVmemZsRjBHbjd6STQr?=
 =?utf-8?B?M1lVSnZTd2I5Zy9vNndyNDlVc21hbjVuRC9wUFAyMkR1bU5wbXlES2VzNGo0?=
 =?utf-8?B?U0ZpalY5bFcxS1N1NEVHTUcyOUdhYjE2RlVZOUFTeDFjN2hGbFZnRW95L0da?=
 =?utf-8?B?Q2lkN0YxM3JoR2JqUFRWcHh4NUlHc3AyWFJzeFhyV2xHellqVTNjS3JURkFL?=
 =?utf-8?B?aDNBUW51M2RvRWxkRTdsQkdRNmV0T1NBSnByZ0tjSk5telppbjJjWTh6a3BR?=
 =?utf-8?B?Rjc0QjJrSUhJRTNwWm9MQWdiUjZvK0dOeFAwKzNKaE5GcEtqNWpncnVhSWsy?=
 =?utf-8?B?T1RNQmtoMkRiZlo3a2FoajUyTmovNTBPbTJqa2NzVTAwSGJEdWUxTkd4Wkgy?=
 =?utf-8?B?Tm11WklaTEtaazRta3F1Vm5IZnZrbk4rQmlGT2t3MzIvRUZZamcwcktjaUxG?=
 =?utf-8?B?L3dmeU5HU3V2K2FWbzhKV2hCQVNVUmU4Ym9sOGJiRS84Y1g2ZlJqVkpXS0R4?=
 =?utf-8?B?UmlPZllUdURxWllrdnRaMGtXYTduUVJNeUUyNnBKeTA2R0drSEd2MXNNRjBN?=
 =?utf-8?B?dmFsRzNTWC93L3JNOGRwVllKU1Q2dURKQzRLMWx3UUUrYlRGMzdjeFI5QkVw?=
 =?utf-8?B?d3g1VnZFMVh6NUNWTmtkcENqMWR2b3llVXBuMVVvNUMzWDlOdDlJNXZMaTV3?=
 =?utf-8?B?VVlJcDdHMnlpcFF6WXZWSEoyU1F0WFFDQlErd00zaTJ2KzEvR1FPZ1A0bHh3?=
 =?utf-8?B?ZzlKSmxITFRjTmFCaGFFMUN4T056SHpreCtNUFdoblQ5VUZuTGt3L1JaOE5L?=
 =?utf-8?B?NzgxQ2NkOXNwVk9FSTVYMk0wdWtCaVhKMFFHc3BjNlAxaDRLZGl1VThGN0lZ?=
 =?utf-8?B?UTZMN0RiNGo3Yzd0a0FuWnFtbHBOazFaaXoxbGRiVlQxQjg4dEt4alcrRW1r?=
 =?utf-8?B?WFREVVAyUGkwSFEvVkxzMkxFQzhBamNZUW11eExIbitKZU9WYmZhTzloT2ZW?=
 =?utf-8?B?YkFoUzNsaklISGtPQ3hScWJwbTN4eU1wV21TVFRsZlVpSFVvVEZ6SHhIVXRS?=
 =?utf-8?B?OXJTOGI5eHYwNDRlTHlJSld1TEVrZVpGck53MWo1bithT0ZFUnZFYVNuK1BU?=
 =?utf-8?B?azRxcXZKQmhjZ1JWZnhWWGY4WDdDRmw3cDdGTmUrU2NSOGdHamJKcC9TSHBt?=
 =?utf-8?B?bkd5enltN0EvNTB0TVY5bEhYY3FZMWNZUTZIelpQaWRNaWJmYnl0V1hZNVM1?=
 =?utf-8?B?OG9GeUpLM3pHaHhNSXJnUTE3bWFjZUtDNmV4V0ZxQlZiZDkxUmFEdGZJcE9h?=
 =?utf-8?B?RUxSUFVES00rMjJJZWs3L0R0MTc1ZldIalZsdlN6Z0dlWkdSakZkTndEaU1x?=
 =?utf-8?B?RVAvZG81NFViQ09ZSitoKzBiUDh1azhKR3VxaVVpTnprSlpEZ05PRU1DTGVY?=
 =?utf-8?B?T0JhNDNmclA1V0hmWURnR0trZndRQUs4NjM3dFBpYUVTMXpvZjNPQ3RHVUtH?=
 =?utf-8?B?ajBlWjdJUkJCZnRub011N3lvdkhJRU1RSy92T2xzM1d0R1RPOU1oaituOStN?=
 =?utf-8?B?REFjQkh1ekRCY0F5dHo5V3NlamhnRUowc09mUDZQRE9nd3psN0tpeFJyL1U4?=
 =?utf-8?B?WmYxQXpDWFRXcmJqdkVNdTREdExROW1aamxLQS94QjAreWRROVdRc1FCWFZl?=
 =?utf-8?B?algzQU55WUo4eWRnUUJNbnFUYURnUHdQWHlRWGFxWW1YcVEzeUpVdmR2QmlV?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2c9724-0bdc-46ed-ed03-08de3ec66ec6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:18:31.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8IFOiugKoPafsDNKEVONfRyQuI3q1WcOTT99j10Mer6NyF0PMzJoUO36GEy8Fis3MUrUusly69aIt2ckTJ2ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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


On 16-12-2025 13:12, Umesh Nerlige Ramappa wrote:
> Define system controller config bits and helpers for SoC remapper.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>
> ---
> v2: (Badal)
> - Add kernel doc for function
>
> v3: (Badal)
> - Prevent bad access to SoC remapper
> ---
>   drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h           |  5 +++++
>   drivers/gpu/drm/xe/xe_pci.c                    |  2 ++
>   drivers/gpu/drm/xe/xe_pci_types.h              |  1 +
>   drivers/gpu/drm/xe/xe_soc_remapper.c           | 12 +++++++++++-
>   5 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> index 9edf234227a9..be0eb37e73ad 100644
> --- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -9,5 +9,6 @@
>   
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fc121b236dd9..3b6a46a4e239 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -335,6 +335,8 @@ struct xe_device {
>   		u8 has_range_tlb_inval:1;
>   		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
>   		u8 has_soc_remapper_telem:1;
> +		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
> +		u8 has_soc_remapper_sysctrl:1;
>   		/** @info.has_sriov: Supports SR-IOV */
>   		u8 has_sriov:1;
>   		/** @info.has_usm: Device has unified shared memory support */
> @@ -582,6 +584,9 @@ struct xe_device {
>   
>   		/** @soc_remapper.set_telem_region: Set telemetry index */
>   		void (*set_telem_region)(struct xe_device *xe, u32 index);
> +
> +		/** @soc_remapper.set_sysctrl_region: Set system controller index */
> +		void (*set_sysctrl_region)(struct xe_device *xe, u32 index);
>   	} soc_remapper;
>   
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 555a1c3b3841..b073f264d6b7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -421,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
>   	.has_mbx_power_limits = true,
>   	.has_mert = true,
>   	.has_pre_prod_wa = 1,
> +	.has_soc_remapper_sysctrl = true,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
>   	.max_gt_per_tile = 2,
> @@ -693,6 +694,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>   	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
>   	xe->info.has_pxp = desc->has_pxp;
> +	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>   		desc->has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index e2bd4c81b2a7..5f20f56571d1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -53,6 +53,7 @@ struct xe_device_desc {
>   	u8 has_pre_prod_wa:1;
>   	u8 has_page_reclaim_hw_assist:1;
>   	u8 has_pxp:1;
> +	u8 has_soc_remapper_sysctrl:1;
>   	u8 has_soc_remapper_telem:1;
>   	u8 has_sriov:1;
>   	u8 needs_scratch:1;
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index 1baf5d38e4cd..f894f4899cf3 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -20,6 +20,12 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
>   				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
>   }
>   
> +static void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
> +{
> +	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
> +}
> +
>   /**
>    * xe_soc_remapper_init() - Initialize SoC remapper
>    * @xe: Pointer to xe device.
> @@ -30,7 +36,8 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
>    */
>   int xe_soc_remapper_init(struct xe_device *xe)
>   {
> -	bool has_soc_remapper = xe->info.has_soc_remapper_telem;
> +	bool has_soc_remapper = xe->info.has_soc_remapper_telem ||
> +				xe->info.has_soc_remapper_sysctrl;
>   
>   	if (has_soc_remapper)
>   		spin_lock_init(&xe->soc_remapper.lock);
> @@ -38,5 +45,8 @@ int xe_soc_remapper_init(struct xe_device *xe)
>   	if (xe->info.has_soc_remapper_telem)
>   		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
>   
> +	if (xe->info.has_soc_remapper_sysctrl)
> +		xe->soc_remapper.set_sysctrl_region = xe_soc_remapper_set_sysctrl_region;
> +
>   	return 0;
>   }
