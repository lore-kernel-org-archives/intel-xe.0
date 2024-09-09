Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B1AECE579
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A7310E567;
	Mon,  9 Sep 2024 12:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea1AVXY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A433F10E568
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725885501; x=1757421501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lol3D9pcbIFt4HIsmfBXWAGnnAplU2Rl4G+uC5AR6uM=;
 b=ea1AVXY8Us6Xy/uS0z0Q1I8AtCVPcbfw7TIqYOVQFGmUsHE3WxqANdCl
 7KRWZgdn+Utg73SL5A0JrrYAAlN/pW4sFW5yayObVG/GmHU4KIafrul5S
 FMeS9kRjBfshFdG6NVsQRqPhKC0uhh/6iG0Ei4IqmoKvEZC8d+LZiKDXc
 elartj82zUFTDJm/Z62dl3QV4d/RSu6FxR/gleAldCnuvhMItQKc6fsY/
 fEAzASP8XPClqPpFPwUKxG2wXEL+sqvF5y0C0eV95Otx3Q4j0+DorPi9X
 MixDk4RMsXn/Hd/vaMgp/zjJt1YYEN8zIZDilinD0cC3zP9VG5uw2Iw7f A==;
X-CSE-ConnectionGUID: VhzrRjExTd23/Yc6xR92Kg==
X-CSE-MsgGUID: AVhrwuspQdyDJtacCAleAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24077508"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24077508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:38:20 -0700
X-CSE-ConnectionGUID: ZJyQYHsJQESIw4Y/piTQqQ==
X-CSE-MsgGUID: bm4WoAVgSrKFl8i/bMaBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="97466368"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 05:38:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 05:38:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 05:38:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 05:38:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 05:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRLwi9FEddLJUpqH+A+dWT/TVpV8Z2tb9KkUPI9JPn7HRydV8nPkQMIp4hTSAABeQ8WMEolySUAxWFMZft8jJsMqZS6z3AUa0D1m7ZJPETDw4ERTqxLZZhjxuqvw3F0PfZ9Wr9nrwN/hERUc+XvqawItndXgAFcM6Qv6IsnsbuFHIpaGaEKv/RUOljiYSdmiXbEOqlX0UTlRIfLlYZIhBLad7wecGZ+MOX3zm3WrQxOUKoGVwNf8LvhZE8TTW0xeAd1xCNIOL5zPhcPeyq0jCD6KTiXj7cz2JAp6McygJ1/PvPg0GELwcymeCYGThL/7LVY202RnpVFFGitFwyZBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQPHgUKCPMNSmvvlU7Lsda3fZEM9jazXpn9S9qJm23M=;
 b=F+MOLcxjBoVFF7C1UPf97MgljR/3zHVdFKOs+dz8GSDukoi6oeOIOURCWFx4+Hiq7D7wd4F3U1TsNr7ieK/hd6gRGIjtRE3h+fgyIlsoCuNVFz4iHLfrXfhtBRTfh0UPnAL+r6uka7Mit1Si8ikjks9x20f5XwHEUYCq7VUlip7/9A48LPVdAMpP5LGlsxr29V9VZ5tyQ+nAB2MVDOqMfgZ9PYUDWzBc69qm/RvDeXDlrC4VAYzC7h3VmnxvlQ5hKC2rem5F6QXGEjqswnSXtadK9sGuO968JCGIBZGUmWl7hJOdnzog0lKE4shkWUay3N79HDZ1262sS1yiMrXHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Mon, 9 Sep 2024 12:38:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 12:38:16 +0000
Message-ID: <3371ff33-b300-4aa3-bce0-516c36f3e3c9@intel.com>
Date: Mon, 9 Sep 2024 18:08:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com> <874j6pm3wk.fsf@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <874j6pm3wk.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: eec02877-1b77-4ae5-cfdf-08dcd0cc46fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzJ1SVl3dytnc2wwdXNsVFNmZmJURjk1dzZFbUVEbVk1VzVWQWlZRlFzbUsr?=
 =?utf-8?B?Nnh6dVFhN0FiKzMzanRvSkd1bll0Nk5qUzdmYjdLaXNwYVU4dWhNNFN0aHN2?=
 =?utf-8?B?UTROcG8yWGNGYVRSdEVGY0JxRVVwa0h1dzhBRGdxaUwzOUp2SmZ0RDBvcHZ2?=
 =?utf-8?B?YzgxTTlXcWpIRDZIYzVTTWVScGVpaERLVjU3TGFoSXhDT3ZRMmtSVEdkUnlM?=
 =?utf-8?B?MU1jcURJTjlmdTBhUTAzOTJZT2QrUHdFeVU3eUljWHhONDRZcnFCMFdid3Rz?=
 =?utf-8?B?a2pxcE9JN0p2STlpUUdiNCs3N25XN0E3L2F5N3dNNHJkU3JoREw0c3hrc1Rx?=
 =?utf-8?B?SlBubzBjUlhIYjJFbkxqSEVYa2VPczBubk9vb0tHV05FMmppTm1INldIWWE4?=
 =?utf-8?B?RE1GSVJzUnMrbVcrSVBKdjNrVVR2R2Z4bWh5WWxHRFZxa0RXZ0JNNnFFNnFF?=
 =?utf-8?B?Uk5LbXJDQXVvYmZwRityV3BRaUVXMU40ZUlXQnVqbHpDbmJWcUZCZ2p0OEgy?=
 =?utf-8?B?aWZodzErL0MrVDZTWlVPVnF4ZEJUbzJVVHVjUmh3Ymh3bDhWTndhUDI1bXdj?=
 =?utf-8?B?bit2TEZ3dXYwOUw1WlJsK2dyQWtrSFlDR01sc1Q2SHN1M0FEUTBpbWx6cjJi?=
 =?utf-8?B?MmE0dHdYVXBjUzRaT3RZazlKanVNQzRoRjBaQ0o3ejlBbjAyUnd5aERMQVc1?=
 =?utf-8?B?WDhqR0cyMmdLTExLc2FVZDcrNDl1UjNaL3g1ZmxJVWw4Nms5cC83aDd3cFJN?=
 =?utf-8?B?VGZaZXRKVmI4QkNZYURiNG9uZjhSc21YWE5obFU5QXo3bDl3K1dKVXEzQmpk?=
 =?utf-8?B?VFhuN1VVcVloQWNJOFpqY3lmNXpQQ3NCYzI5U0FxWldqQVVLWmdGcHA2dk5D?=
 =?utf-8?B?eVVMZUZZTDh6Ui9JRzdIUnBGbUdaQ3pOekxuUEMybjhLeXU4UW81d0Q4QndU?=
 =?utf-8?B?R0dvdTg4dXdGU1B5Mk5RNUZWRTRNNHppVHRtdzVRVzhJQ0o5REtxeUdKUEIr?=
 =?utf-8?B?aGlFTlBQUytVQy84a3M0SUQ4UWkvcmVIY3FEQ3Z2QmhqU0k3VlNqRmFNWDh5?=
 =?utf-8?B?T2U1Z0tWcTBsT0VzZEhwM0FybTVweE1kSzl1M1JneFdmd1BTL2tpaEpSYmhp?=
 =?utf-8?B?cXQ3a3BXdUUwZ2pMLzVySkFBU3pJcUUrRUVwWTZ6YzlNeGhYdkpveU40RXp1?=
 =?utf-8?B?KzE0eGtwRFh5ZkdTTmFJMWRBc0doVXVvTGRub1M2blhwMTNJYzJYZUZYejhl?=
 =?utf-8?B?ODMyM1poZnh4VkV3Mk1kWm5McnlHelJqMTRqM0F0ZHVXT0ptWWtJVEUvL1V6?=
 =?utf-8?B?UDg0amcrOS9OdGRXQm9aYkRnaDAzemdNOUxLdWgyOFMvZE5VYjJMSzFzTUVP?=
 =?utf-8?B?QkEyaVIzZ2RVZXU0Y1IrL0NMR3ZBSnRScTlUN2lzSjdUbHpUYTBBTHY4Y1VL?=
 =?utf-8?B?aTNlbHhDeGxWbk9OcU9waytQRlUrdEFVRWgxeE9YQ1JVajcvMDZYOStyblNs?=
 =?utf-8?B?TWJYZ2M3VjNESUlUbkMvMERudXJtN1VBcHJES0NOcmRhUGVTS29PU0dERElK?=
 =?utf-8?B?TmEreG40QkNndDRCaUxZc2xETFphN1ErUlhaRU5RclEwb2NtM05FVnRCTHBI?=
 =?utf-8?B?cVdLY05WMHFCa0FBclR0d05vNjJNRGlacWZXd3dFc3lGejZzTklPTG5EQ1BK?=
 =?utf-8?B?bk1ZbkZCN3VCMW9IbFRVSkhpU0YxUWovTGpnK2liS25RU1YvbUcvVjNOUmFs?=
 =?utf-8?Q?GSw2r3vHxMAb6oi/YE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWFkbGFhQkJNM1pwRStDR3ZDbFYyOVJ2TWtzM2tUWW9iZ0hLRk5rTUJ0TUpm?=
 =?utf-8?B?Vm12MGlDMVZMaUpzRUFucE91TDNFeUo5WFgyS3lmZEplK0NvQy8vUUFIUFJ6?=
 =?utf-8?B?N25HQmhGQllHZ3JhdEZ5emcvYW96WW5YYXdnYzl0T0M4U2J2bEx3SWxhLzNp?=
 =?utf-8?B?S2wvN2FUYTBoNmxyejczN2tjYThSMldWTmMxZTk1UUVuY3dQQ2xaZnREUEps?=
 =?utf-8?B?UG5JMEtRR1luUUdGNENiM2FtME9aWi8yNzMzTVlBYjVmYjlCalp5RU1YQ1Vp?=
 =?utf-8?B?eVphRmpJdDRtK1krbVVnUnE4K2t4VGYrQmJtVmRXWEJDOHQwRmJjR1NaUjRp?=
 =?utf-8?B?RkFUNFFDMmVnQUVrRm9sZmFQQnFaSmhMSUlzRDNhcmZ2UlJJWFpORHp6NHpD?=
 =?utf-8?B?U3Bic1Q1ai91VVlvZHV5c3BnSGF0UDBmcmZsZXdXZS9nSW44SDdtU09QSU1V?=
 =?utf-8?B?cjZkeTlvdzlsOFBNMlJ3WnA4TzdPVVBxRHNwMzNnd1NRZzNVckIvOWwvY3dz?=
 =?utf-8?B?U3NTUUMwMFRaWkI5Z01abFExVGZLV2JkMHpmaWk5Z21lckM0eEJYNG5ReE9z?=
 =?utf-8?B?QTFrRS9DRXZiczhHS2RuZzBDVnNLZTVIRS8rWitoSG15UUFET0VZdEg0T0pT?=
 =?utf-8?B?eXpLTW1FdW9xcFVMVmpmc0pZV2ZWMTZiZU54WGo3cEh0djhTbFZma1M0Sjdu?=
 =?utf-8?B?YUhvdlpyanhGNzZ3OGZrS2VsNWJCZ0txWUk4T0VBelJNaFFzM2E3OFVTN0ZZ?=
 =?utf-8?B?eEswc003OUFYbXFTakJNYnpkRXVQM0E4djFINEJXdllwMzh5ZlMzT0FHV2x5?=
 =?utf-8?B?MlBvdUw4QzBEQkh5cXVTZkVKcjlkbGs1aS9PS1Q3TGVKcENUNVliSHFYR2lT?=
 =?utf-8?B?RkoyVkRoSDNRZXliNERrMllhS2hackFVLzlZRUJrSHpaWmhlcUFVdTBseTVE?=
 =?utf-8?B?UEtZcy9OTmFneVNvTEdNRHdFUTV0dEVzdTBGdSs0azV4akZOVk1ML0cxYUlC?=
 =?utf-8?B?ZEpjMmo3Mmd1WEdXZ3Jtckc0cHJwQytHSlRmZVY5c2lmMGhnRnFsd25SK2xI?=
 =?utf-8?B?bEJ0VTYxa2kyVkk3MnJDYVRveFpEK0d5aHRVN3dOMVkzNzBxZGlqQjVFWjRY?=
 =?utf-8?B?bXpnSzJBazFCcWM0eGdWeWt1SjVTYUVLQ3E2NlhxcUFINDB6dVVMeUMyWVdo?=
 =?utf-8?B?UkczT0VkK1dxMVpCNUtXTTYybjJhTFVwOS9qREFTejJkbVdHSVBRVy83U2hF?=
 =?utf-8?B?NmFJZGlqVDZJdW1DOEFlc0lVYU45d0pmNEpKdDQyak1zUE9xanA1ZzdaR0Vu?=
 =?utf-8?B?NlMxSUlMd2VIRnA0STQ2ZGYzUEVUYm5lSHpMdjdmRVY2dzhjbEM1Nk1aSnIz?=
 =?utf-8?B?R0ExN0FLMFpYTTQrVDRtUjdoVitwRkpYWHZCY0l0ejB4dmhFbW9wVTJDaUZN?=
 =?utf-8?B?Q0t1WW5xVDJUcHZIc2pnak50TzB5WFlYVnZuNXE1cmRNQmFNVm5VcjRDTWdS?=
 =?utf-8?B?SkprQmppQVpPUzF1MStPVDZtRDR4UFF3RDI3NTRjM0E1VG1yTWhHRFY2RnVF?=
 =?utf-8?B?L2VQa2JIcEFpYlozcUQzenRLQTFCYXU0aHUzbXIzOTB5MFhiZFppcU9JZjZP?=
 =?utf-8?B?Qm8zR29VSWhrdG5KeEZqazJuRWFwN0dadG81QzlXQTFGMWVURHY1SDZzN3ZG?=
 =?utf-8?B?UDJsWGMvM3RldzVxOHVJL2hPNmlkaXd1Qk1LRWdHc0hhWXUwVkR5Q3d2UU9v?=
 =?utf-8?B?T0UzU2toNFpPYndTVGQ5U0dHbTZmK1hxdTRPMVNFZW02cFR4dkNFUDZxVEtG?=
 =?utf-8?B?QkZpTlNncDIzSjNWM3MrSE02MEc5MG93aVAzSXAzWExVOVJJRVlXdUcxaHU1?=
 =?utf-8?B?MElFTXRiekhRRS9SRlhocGZ1Q3RyTHJaS2Y5bEJSUGExb3lwbFk3ZG9DMFpi?=
 =?utf-8?B?L1dUZGJzandhUEZVc3l6Vmk4VHBsTHBhYnBza2RsSmpIZGcxNXF6by9wV0Jx?=
 =?utf-8?B?blhLeDZ0RmRqN0N3S280eTViTTBScHhlT0U3ZGYyTzU5THdFclVjRU9PU1Mv?=
 =?utf-8?B?YlFrdTQ1N0hseitud3F4NnAra1hSejU5Q3RxYUtoVGtNSDlPVE9kMmpaaURN?=
 =?utf-8?Q?sWqSK1bENt1S9gAAGQsz/QGvq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eec02877-1b77-4ae5-cfdf-08dcd0cc46fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 12:38:16.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x16E29IFo0EYc9PocQbr+lwZk2kEZI5FInejunmingoRmMoU7htlq3JJqpEn9UrAW4+hLWDm7gb4bi8GLIkRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
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

Hi Jani

On 9/9/2024 5:32 PM, Jani Nikula wrote:
> On Fri, 06 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
>> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 3924f9f3d0a5..85a35ed153a3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>   	return gt_to_xe(gt);
>>   }
>>   
>> +static inline const char *str_up_down(bool v)
>> +{
>> +	return v ? "up" : "down";
>> +}
> 
> Please don't add functions with names that are obviously going to have
> name collisions with core kernel headers. This now conflicts in
> linux-next [1]. Please rename until we can merge the real str_up_down()
> from upstream to drm-xe-next.
> 
> Also, please don't use static inline in .c files. Just let the compiler
> do its thing.
This was suggested in a review comment to have a local copy till the 
function lands in the tree

https://patchwork.freedesktop.org/patch/605708/?series=136477&rev=1

Will remove this and use the function once its merged to drm-xe-next.

Thanks
Riana
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
> 
> 
