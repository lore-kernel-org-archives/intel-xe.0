Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A9FCAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623910E58F;
	Wed, 17 Sep 2025 19:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBP6eNNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652B10E58F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758139138; x=1789675138;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IC5rHKaohIsEo0DHzPYgwq8gsEiekpya7lheYZtA/vQ=;
 b=dBP6eNNKE5ZmNSigHc1WqPLvuaFNLTe5h09/h8HkUobslYG3RMk1QXYP
 i/Yl869+tdZ1W7FyUJ+4aMFN8iQ2N+vzc11BYbdJ4JTmsFTLsfpUbRkCx
 KkM7SNWnpCfhld5Fkg9B7JZP+0xqlx60XcCBZ4FbzgA/0gf1l1B4b7/6H
 tpmPP7xoAgaLQFINzelZP1G8X3aovGAPGPnuOFkrOfwN3hsNZ6qKWEjTc
 UrqR0/rhkLjSIphtke9JS5WrDNBykVvwm7DTLC0F1iHploFqUQzsjeqG7
 s0oQvNw22gmyNTxbEvSV0nGgh/TH1h3P0MSfEPWAPKU/Jiaddx4mzF4kI g==;
X-CSE-ConnectionGUID: QPGvI/C9RBuWmJqYxlbYxQ==
X-CSE-MsgGUID: gwEL+5hiQeGz+OeZ41dLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="70710551"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="70710551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:58:57 -0700
X-CSE-ConnectionGUID: CMzjDb+qQ3+V7KVSWZVu5A==
X-CSE-MsgGUID: w97dpbi1RhyLQuGoon8K6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175747367"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:58:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:58:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:58:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7dcjsfKbvpS40sHwckct9vJzC6ov0GQHMBnYNHcjnUpmGVjnETq7UZPXHr0vtq4he9n7dpdWSlnqwX3f9nJIDG3y3coRPUkkG2ACZUUPH8447HppIoKKqbkRMN9ywDPcWPZZcHs9ZDFLDLr3H+NA2juqYrnSuYMmMSSdiUGrPwXQigZz07KqnAUHTQG52TbhhIgP04LhrUo5khe/MByUBlr08wLUjMiAOIqaTLuoFbqgyFiqixwN298ydZ4kpwaiG0MuGyvuibj6CuU355kzpKEebjLC4S+fZ2qJ016JiB/NgAkrpBj3VnCPMazCSAw7073RU58oJcAZU6hEskAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVxS0RonCnr1ojsqON3dbLOreKc4Ym8/rAioVZwI6zI=;
 b=V0ADCzN00Yjd6GAHL/AQprnoIdnhvCwX9xwNsxv9Y8qkE6fvcnqQcWhtOOZff9vyMqbYT8WthRWXzPJ6OOrOuFQpXxpPxoVsWQHIRxmwY3osmEVHtaxfQ7BrY+Go2aJZ0dg+w9JpXkgHgWoMgvZIK65uV+aTL/gu0N4JCSrMHhqC534fghxL8Zz7zf6jL3UMjqreaBLiUUifHRVKZ27k5D9BT3sNJgEwF8xE2srmzy0A6xFmyxWqsp5g80kD4hxAfoSNkid5NOEgmHWrIyv4w/nS1pKElIZjNY58gmWKzuiql8eTok5ruLUaC1gs/cF8EsuzTTJ7S6OrNUsIISfe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 17 Sep
 2025 19:58:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:58:54 +0000
Message-ID: <a9656a5e-e4c4-40dc-8538-2a84d86256a4@intel.com>
Date: Wed, 17 Sep 2025 21:58:51 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/sysf?=
 =?UTF-8?Q?s=3A_Fix_attributes_registration_on_VFs_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <175804873737.339046.13628726154183583298@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175804873737.339046.13628726154183583298@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 704f5b7f-54a5-4519-f143-08ddf624a182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHl1UmlFWERBVGQwZlMwMk9tcmg0S0c4L1N0eTlidTEzUXUvelNJc2dPY2dT?=
 =?utf-8?B?YXNqZS9EbzZVY25keXlOLzAyKzM2c3g1bjN5MVpYaFpEWUpnK3lVMktESlo4?=
 =?utf-8?B?akxGSStMc3ZYc0hjd2xwQU1lUWpqZXU5ZDhWdEZSVy9EdUd3OGNqQ1hmV0tP?=
 =?utf-8?B?T09BOVZYd0w3MTY2Wm9YTnczVzhyME5ueElLbDFtMmtaYlNKcmRMOVJWUjht?=
 =?utf-8?B?b2VKWTVqbExOVGw2d1FMZWJaK0wvd0kxSXU2ejF4aWJmeTVTSHBVMEZRdTdR?=
 =?utf-8?B?K3dUY09LSGdERnFZdkxRL01IcEJBMDVPYTBKbjBtOTVjYnZLaGtTSThoLzF5?=
 =?utf-8?B?dStSSWhKQWZ0Mm5HYXdhTUMwZlY4MHNac1NGUWRGY3gyenJETzFYWGtYU01Y?=
 =?utf-8?B?bVN2MlpQeEFNNEpEN0IreDNTZ2pqMEJBNmNVaEUraHFBT2s0Y1Z5YTk4QUJH?=
 =?utf-8?B?QzduTWg4RUN3em8wVjdWWEtsTUhzSFltN0FGOUxzUGlOYlVUSmJ6eVZyUFBS?=
 =?utf-8?B?eWU5a2tnUWVIeHVBVmpFSTVaRTdUamdPSDdsK3JMd3NrUjFjRWtmemVNRHRM?=
 =?utf-8?B?YmVRV0RrQ3R1TG5QVkRubnpqNmcvMEQxK0JiT0t6OGcydTV1MG9SVnBLNzh5?=
 =?utf-8?B?bUdIWWRvZFZVbUpVTU8weG1oTndZQTdETUFnRHVXVnpEZ0JlZkkyanJzaE90?=
 =?utf-8?B?WjdUZExySmNrOWF4d0tLa3NJenppUEtwK0x1YzdzTHZNcG5qRE5QUnVtTEly?=
 =?utf-8?B?eklneUxPRVRzNGhvM3g0RXdZaUlldlk3Rk83cU45Qmw5SFVPd1hLMWhSUSt1?=
 =?utf-8?B?OXVVZ0ttYUNHUWpyUXJFRlFQSGpuSHRKcktCOGc0dVc5bi9WTmtGcWJKWnli?=
 =?utf-8?B?NVZFT3puS29Da25qMHQ0YkFTd0NCV3Zyb3lOSnRiTE5YcjdBNU5ETkhidkhM?=
 =?utf-8?B?WlpRejdVMW5rbzRwM3g2cUptTVFwRUNqMGRYNjZoVldldFJFZVA0K3VGKzhn?=
 =?utf-8?B?YzlnZEhrL2dlZzQzMUlLSStDSWRUSFJXWnROZ1NCR3RMTHp3OW1mRkZYV29H?=
 =?utf-8?B?Nnc3djFNbE9VYUxuQkxDdWNzRjJ2SURPbnFoZUNoU1JYV1JkRW1aN1JheDlJ?=
 =?utf-8?B?NnZORU5UdEZ1eHoxZGlDL0hBTE5FeVVNYXBTK3lub3Z0cDdJRXNQNTBZcXly?=
 =?utf-8?B?M0xBSTVoTjdPcDlCRnZraTJOUEZ0MVZwMUoyQ2Q2RGpZdUtqYVRTMkFRZFlm?=
 =?utf-8?B?UHUrWW1sQ0YzQkFvdHFvSEtSdVUxalU1MTROazJxM3JvbThnbFVtUHhkdlJL?=
 =?utf-8?B?ZStHRG14aDZIRTVNOG5ZangrWHRqTkRoYWJYVVhSbjN0N3BhTzJpR1l5Z3Ev?=
 =?utf-8?B?TkQxNnVQZVFhdVlwYTllUGRtOTFpQlhUU1V5M3VIT2JGOHJBWGFtQU45Q0t0?=
 =?utf-8?B?REpndlViVDFyYy9lWXNEY05pSFl1SEhjbXF1NkU3cGM2dmQwN0VHRnRwS01V?=
 =?utf-8?B?c0ZiKzV2L1JrT00rRVA2WVhpNXA1WERrd0hJZXpmSTl2TEVQY3AzSTc1YjF4?=
 =?utf-8?B?SlYzNEZzbzVQOFNqR3E5Y241dERtS1lOYXFVc2E4NEg4ZWdSd21maHovMk5Q?=
 =?utf-8?B?WXA0SEdGUlRPWG4xVkNHRGtncGc3aUQ3QmMxaHE1dUdNMlVWZCtyS1JRU3FM?=
 =?utf-8?B?UlptK3h0VTd5ZlpTdDJoMm9QSHNUK2ZibUMxT3VmWlFQa1BzUGpDZUtDdzFv?=
 =?utf-8?B?K1g1ZW0zU0Z1Y2h2cEpMdmNBTmxHVHkwOWpiVEpRMHluT25OaEV3aVF3RlBN?=
 =?utf-8?B?NlY3SFY1T1ArNmNiNzlSU2c5Vk5JSWxvTGlxRWNDUlovdnVXeERWdFJMUmJ0?=
 =?utf-8?Q?RPFFu9t/auzq8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBuRDU5OCtFbTVFa1FOTFp2ZGw1eUlUY0gzOFYvTTVaQ2lHZFA5NzBac2lI?=
 =?utf-8?B?V3R3K2szNDJTSUxnOUZtRXRuTTFKMkZjbnB6dndYL0N1U0xQS2d2WDBYS2ww?=
 =?utf-8?B?TXE0UFhwSGZLNi9CeVZPaW5FMUNkcWFoNWtWRlhNTG1kL1ZDSXN3anlsRzlE?=
 =?utf-8?B?bXdCWktrUC83bzVXeWw3NEtIc1RsU2VETE55dkVyV21scVhUVXlKRXVlcE9q?=
 =?utf-8?B?cnl0SFRHY0JROTRBalIvdi9xWmZuNE9LR2xqSTdUSXFCRkpNU0F4Z2oyL0w4?=
 =?utf-8?B?NWgyVGRjbUJwdngwTHZqMVlpRUNpcWJmT0RLV2QzOFNFbFlvUTBUb20vNmov?=
 =?utf-8?B?d0ZieEhORS9GWGpyV2tmbWlDZ1RqN09GeGhEY05pQlBDZ0s2cTRIamJjVlNk?=
 =?utf-8?B?QXU1NE5aczU0aGdyL3FsZEJFRVhUeXBtVVdZMXlHL3U3ZkRaaGZVRjRjYjBL?=
 =?utf-8?B?dzhMWWFXMEpaeUZibzdtRWFQdXBCbytBdG0yNXNUdklvQVRiRkFIam9LZWF2?=
 =?utf-8?B?VXV0ditoVzFtbG1BZlN6MHZJUzJJVkRVV0F5emlrUHQ3dUlrd0tXUEFnVDhC?=
 =?utf-8?B?cWRBQlFNVW5wSURqYkk1UnViVUx3bmQ4OFA5RFhZRk9OTmdQQVk1Tm1TNkxT?=
 =?utf-8?B?Zjh5T25aRWg2Y1A0Yi91N1ovRExqRzVvZ1JOQzZUdUN5c2VON205Wm5Pak1N?=
 =?utf-8?B?aURocW9DZ2w1WXFwdE83akpRdkw5RWJyOFpyMTR5ZW5CYm9adWdCdFdzZlVZ?=
 =?utf-8?B?YzlMai8zQjU3UmhPREl0U1N6R2YrSGI3cTBNa2FSeVdmOGRSeVlJY2hONjFl?=
 =?utf-8?B?ZDgzSm4xVytIK1EyOGZoOEJHTGQyUWh2S2lxT2lnaW95eFZDZFB2eTRtVnNS?=
 =?utf-8?B?SUFPcVBYazVUZTZGaENUNlN2dmxtWlJtQzNmSzYzQzZINGRRSHNXeU1vQXM1?=
 =?utf-8?B?ejFNN1pwb05pZjJ1NGNaQ0UyREc5VmkyWGdUTUx4MndNQkZZa1BZZ0ZpVXdt?=
 =?utf-8?B?MUlScTVCMExrdy9DMnh4QUF6dGFVb05NZFp4M002ZnFzVFVsemtZaVJOTm5E?=
 =?utf-8?B?Wk5leVUvUExHM0VncnpwK2tyRC9oYm96RHo3UlV0d3J6NUV6Z1U1WHEwamdm?=
 =?utf-8?B?NzJvdEY0aWFTcm5nV1dmV3hrd2pBaDB1Z1o4cm5ia0wvdVZxVDE2ZzVrczRz?=
 =?utf-8?B?VDRJMjV2TUQ3VncwbFE3SHFOSHA2bGNudHBwQ1hobHkzeGpWVE5PRVlJemFL?=
 =?utf-8?B?VlFrUzkrRStPSnJLcFhzcFFIcGxxQjNqbExWak5JQmY4M1E1ZHJLUmNSR2Fk?=
 =?utf-8?B?ZjZ0TFJycEc5MTlaWEJab2tOTHBEN2NIaTk5K1hjS3IrYWdGVmNHcCtRYm82?=
 =?utf-8?B?bEJLY0F0b0lWZTRIeHloQlVKdkcvb1NCRlAvcERtMG5OTVhlZmx6SDJlZytK?=
 =?utf-8?B?V1llSE9ZRm94VmRrdW9rYXRBazFpNzNSQlB6UmpSVTVFT1hjZlBld0hwOUcy?=
 =?utf-8?B?SUhha0dXT09CWnVYRGlSUmYxR3plam05OWFidzg3TTJFRHZCaGxLSUVEQUh6?=
 =?utf-8?B?aWxHbVlNR3BFVE9nWm9kV216bFJUdEh1RTFHWW1yRG1rbHN2UTEwSXZHdzc3?=
 =?utf-8?B?WFBqaU1lT2dzMG9nUWdDQjBaeEQwc0hxQkpXT2RWYjg4US9rQ0ZVWnJvaGdD?=
 =?utf-8?B?ZmNOaFN1WjY3ajE2MW1MMUU3UnUwaVRpb2pMN0p1VTFRZmRDd1JjVUovdVgz?=
 =?utf-8?B?Ty9uQjQ3MW9lRDQ3WkNpSCtUTDJabzdGSGRqR2hxa0ZXS3hTMTkvODBVL0FI?=
 =?utf-8?B?UmJ4S3BGemxkaWVTV2s4aEZNRE0wTUxYZDFPbHJSUEo1bllUUHB0UHlrU2g4?=
 =?utf-8?B?c3dCQ1J3UndBVEFvQ0RIVWNadGlJeEZHMHZZQzZxUytabDdrZVRMWWpCNkdL?=
 =?utf-8?B?TWp5NzR2bXp5Y3RSTFJYMktLSXJFNmU4c2JxR1hFalJRZVhiQ2UwbnR4bXJz?=
 =?utf-8?B?VGt5R2dWS095Z2N0bE5DZHBma3RYNmhRaVJ4VjVlRCszRitOUHBjc0tTSG5Y?=
 =?utf-8?B?MkFVN1NveDEyTzlxR3Qwbzk0TVBZYXlvV01NYjk4UTQvTGYzYWp3YmY2ZjlL?=
 =?utf-8?B?MjhsTURWcXNnOGFHZklxYnhIMmNrYThMbkk4WFdGNkxwNTN2MFZsU3E1NUZr?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 704f5b7f-54a5-4519-f143-08ddf624a182
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:58:54.7629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cZjAyirgtEH8ekglyQcTo4nXLp7L8YF5JVMW+jvVdgnfYPJayx+FYo0UuUOj9wmI52Hn+hMXWPcsk8MsFGn6puF0lwcz9TEdQ2+yhedkuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
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



On 9/16/2025 8:52 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/sysfs: Fix attributes registration on VFs (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/154534/ <https://patchwork.freedesktop.org/series/154534/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154534v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154534v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-3773-3ac9e8d2d7d36978999286401624d908e7d9ed32_FULL -> xe-pw-154534v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154534v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154534v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154534v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-free:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3773-3ac9e8d2d7d36978999286401624d908e7d9ed32/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-userptr-free.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154534v2/shard-bmg-1/igt@xe_exec_compute_mode@many-execqueues-userptr-free.html>

(xe_exec_compute_mode:5752) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_wait_ufence, file ../lib/xe/xe_ioctl.c:676:
(xe_exec_compute_mode:5752) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_wait_ufence(fd, addr, value, exec_queue, &timeout) == 0
(xe_exec_compute_mode:5752) xe/xe_ioctl-CRITICAL: Last errno: 62, Timer expired
(xe_exec_compute_mode:5752) xe/xe_ioctl-CRITICAL: error: -62 != 0
Subtest many-execqueues-userptr-free failed.

unrelated as series is about sysfs only

