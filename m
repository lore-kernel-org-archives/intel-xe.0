Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D989BD74EF5
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 16:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21889B48;
	Fri, 23 Jan 2026 16:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvNUAgsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3275F89B48
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769184572; x=1800720572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=crgTQDcSjAfncdYP6yS2lutUy05Xx4jiQJjcUNMXkWU=;
 b=RvNUAgsn1N2y1BhcQP9oMPAtnU7/AvV5FHlOmo+dqJIsSxR0951RAvCG
 10Gem1+VznJXG5b2sWBFDa6ThCYdTpcIbRziw5yUMUTaPCnkq/FeUEC3u
 SQs9O/IO8XFhdkAOSKMiXy4lyRy8ckYsrRvYSE988NpG8OexT3ThMvqab
 7bCyDlqveX+TAJ427T7dE5u+Rcd9ZOzmoFltFNg4XzliDvy93omg7MtqY
 gfpfhIE2+qdTct57MDpUmuDB9fNJcApHX26uIpENxNkOsNzG4QTU1XM1j
 da/Io4gJluoLLLJCX051jX+6H4HEcaXfgyxKFNwkiIJTYAdBJtGodhgVL Q==;
X-CSE-ConnectionGUID: +7tD3+YgRF2xlb8io7wD/Q==
X-CSE-MsgGUID: 0Xh3CCrHSJ++lpja3mVm8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70527986"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70527986"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 08:09:31 -0800
X-CSE-ConnectionGUID: iy/NKG0nRfalX93OIKbLvA==
X-CSE-MsgGUID: cDWTk1IFR+agRPxqX+0mJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207085413"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 08:09:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 08:09:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 08:09:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 08:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i85501MZJEKeod8wIWWadqTAet4CRBwXh5rkMuBjPu4aQueB0OPEfvOOj/cm+v6+kkd3tMx+WELGXHs6QTV+Qysb2xCHvlJnrM7HXkvy27hHcLrsZOjn5pgQUt4Z3tyzBGKkL29c/X7lKocdVJzbMEuFnDBpZwgVRyzNUWF3klpLG6GJPDbeK51DAaxbTuzHDZM5eGhrmZpzL0+YEYmA1pCyrWCqRWl/SI9BkEhWrdVOZSTgIjW2svbCGm32dE6QMx4dcJnAqTgi2qzFEx17/zKBhgcW6Q2vayN60OPIFJCdFPu7/YXjq6JE/XLVvzg3yFG58K/9+0s3Yyw6hUW9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crgTQDcSjAfncdYP6yS2lutUy05Xx4jiQJjcUNMXkWU=;
 b=t6/qZD8MKaAI+PICqhpE5uBL1MyYXXk4GqhgmXOjZkdyg/fqdbaRBgeNab/8hIuhTQC5pkYzuERXZYLoZ/QG4idTz6VYOd0j0eITrCuSiAu3rLxx76nMdrf20Whx+ms2YUGAGXlIousDq4Yai8FuyLuA/s+MEX58/0QRj3qlTOFTmwZerkSu6dP8Nv6fU1E8KwJH5jBxdUSPOMnsMd/r4wUGPa2aqIA0QdJCj/YLPlWLNsGUxrxrK7CCdEb1l4mW+pnE0mNDwdl7CH3aJjieW1MQeiZUesISKAH1Rnt2bvlaVl2RSWxrySUkgvlVyztO5qKdRKLIHUJM/pTraizZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:09:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 16:09:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Mail problems for Lucas De Marchi?
Thread-Topic: Mail problems for Lucas De Marchi?
Thread-Index: AQHcjH5CauTt9XNMe0+y3APygkuo+7Vf6/mA
Date: Fri, 23 Jan 2026 16:09:26 +0000
Message-ID: <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
In-Reply-To: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8423:EE_
x-ms-office365-filtering-correlation-id: 50976d38-29d0-4134-c1fc-08de5a99c7fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MGFyZHd4MGI2TjNpOXFFZTd2YWN2RjIzelNGSzcvaStLTzRCN2xpMFFrZ0dR?=
 =?utf-8?B?NXpzY3ZVL2R1ektoeGVkMzhvSDJUWHVKTWFJb1hmUjEraEhNNEpTYjkzcDJD?=
 =?utf-8?B?NXFzM1JHY2MyRGNsd0x1ZW9WdTk2MDhzSzFCejNhUCtoWTFzcmNPbjRSTE52?=
 =?utf-8?B?bGhoazlZOUVpK2pnU3BJVng5ZXlsN2VwZ1BsRnUyVnd3YjBpd3NhMEpHcXhK?=
 =?utf-8?B?SGdQWU5jcFd1V1UvdndFVURHMjUrYlZOcWszOXhvd0Zzc3drYnF1a1FqZUdR?=
 =?utf-8?B?OXoyeThDbVVrbXN5L2V5aDQ4Vi9na0NkeGNwS3FWOVRzQjNRdVhObGZBS1p5?=
 =?utf-8?B?YWU2ZkdZUHJaSVZLMG9DZWNudlJZckVKUmRsZHZBdVpLY01xdUNDNkdTTEJD?=
 =?utf-8?B?TFVBTHJzMUNlaytxcHJzeVF3YkZJL3FjNWN5ZHR0dENNTUlweVFmdUhVN1d2?=
 =?utf-8?B?aC9xYmVrNlpQdERjYTBOVDhkTnA0NzVGRDJZNXMvam1pVFRreVJyVktTUXZj?=
 =?utf-8?B?SGV5dnRNS2xSQjhFRWlOWlg0Z2s0K3N3cSt2cktXQXZINWlSamZEZkJkbjQ4?=
 =?utf-8?B?TFJwYkg3OUp3RFltYjg2cCtyVjlQSWtySmdWUkVlMU8yVVlaNndjMTZrYkp6?=
 =?utf-8?B?bEl5eDFFdTNCbTNISTRLTUdZNHMvUGlZUTV4MStSNTJYRmdsNmxreEdmT0dH?=
 =?utf-8?B?ZERNK3ZvNzE4ZEpNVUZtREUxV3hEMDhPMUlMQjhSNGFxSHp0Z1NtQWJNMnM4?=
 =?utf-8?B?ak9SSUtpeDFCdHlHSjZ4bHRpUzNVbnF0STFuVGNMN2xVTWZPMWlMMGZ4bC9T?=
 =?utf-8?B?Uy8xdk50VnZhaWJWWWJvQk02TWJoNjlOMjFZSzU5aXNZa1ZXaVpsNG1vdnhj?=
 =?utf-8?B?cDN4NUkraEIyUDFpWTVEOVlYYStWVldqMlZSUXl2Wm56Vk16ZWdTaklvWWpj?=
 =?utf-8?B?ZEUxdVdjbU9sbU1WcVVETC9vUzdPY2wydnVneTNIcy9NQVp1Nno2V25aRis4?=
 =?utf-8?B?SEc2V2hIM2ZyOWhESXA3MDUreWhBR0d5OHZsWnc5dTRVUmlWcDZpZWY3RVAr?=
 =?utf-8?B?OWUyVTVyYUV6L29PRzQwSzRRWDdoMSsweklMQ2MvczdscTd4d3FDY095dnBW?=
 =?utf-8?B?UEZHL2hvZlNwVDIwbTFXM0l3S21kUlZ1dXN6VmJBSmFtMWNLLzJMWUx2bHhC?=
 =?utf-8?B?Z1FoQWZyZ3B1YU1YSGVIN0ZSTDV5Z25sUEQra09PblArQ29uYWsxM2lRb1d6?=
 =?utf-8?B?ZWRrUzJKY3dXMWdXc21yMGdCZi90TFRSSG5hRWhJZENvWnk0MXdRbVowbnor?=
 =?utf-8?B?VzZPNjkzang1U1VVOEl5YWFxMWZsNG5pblFPdndmTmpzeXJrR0tDd2pEc2V2?=
 =?utf-8?B?SnN6STRXcThvLzF4ZVRvZmxKNk13Nzl5S1JtUkQ3OS9FVWYwa09nbTFXZ00w?=
 =?utf-8?B?OThIVGRkaHBacFE4d3FVVmcwMDRwVnhaY2Y5U0VYZlcxeFlJNk1IaHQvWGxJ?=
 =?utf-8?B?VzVyby9sRG9kb3U1NFErZ0hmVWdhNGxHcXJYQmhrZ1N3cXNxTk5tT1V0SWtO?=
 =?utf-8?B?cjZ1WHJrMjJnMFJlRHJvaVRLYlVSQU9JdkpYSkFERkNQWnZXOFR4amhDY0tY?=
 =?utf-8?B?WitWSVZZOVFNbVEwSDJYSVoyVlRJOTlwRjV2N2drdnljaVRRVGV1bys5T2Ur?=
 =?utf-8?B?c0JMY09sN05IQWRjb3V6L25EOHZrbUdOOXFicHNTUFQ5Tis3UUdhYjAyQ214?=
 =?utf-8?B?THFtcC9qQ0hZbzVlSzdaQ1ZwZG5lSWhBcGFPY2xKYkhlc0RYQ3JVREN5SW9D?=
 =?utf-8?B?NUZ0TnV4V0ZWRUQxNndoN0QvbW1ZUWlSc0REcEpLS1o1WlhQckJxaHBiZUwz?=
 =?utf-8?B?bDRibTNnSFd1dFRaaUlpbFlldnh1VnFQcE9vZGJkK1hSZGNTRlZDNVhVNzBM?=
 =?utf-8?B?VFhnZk9WbHNycm9ETlZqUTlQVUw5SGRlT1ZoS0kxM2gwa01DcHErektZNG9P?=
 =?utf-8?B?ZWNDYml3VmFiakNUSVFYV0pHWHJBVjRsb05WS0k4RnQ4emg3KzJSTU11VGFz?=
 =?utf-8?B?MlorWWMva2pxOWNkYTl0R0x2bzFteWZROTlKSGdjMEtNQnJ3anFnQnhqVmhG?=
 =?utf-8?Q?GWyhGzptuwcj423+Uco0/15YT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0MxYzlEcmVHNDhXTVl3d0t3QzBRS1lVelArdFR3YkJwVW1PQ0lvczExSDZW?=
 =?utf-8?B?My9INjMvbmtKcS9DR1FhaW5kV1phT2NKNXZmbkFYTnBWRE5JVG9UOHIvNUpt?=
 =?utf-8?B?TUY3cVExWFp5bDg0SXZ5a2pMUFJTdVB5OFN3TXcxUUxobVBzdFh5UzBubHpn?=
 =?utf-8?B?VkNGTWxEM29DbVlHdmcvZ3oxNTFUSUtMaytnVmxDNEpXWHBpc2EvZkdUZVFJ?=
 =?utf-8?B?WVpwblVBbzBBRU5LV1VNOGZxYkxnbTNrSG41MWdpbVJBbDc5SDlOcS9WWFJJ?=
 =?utf-8?B?YjBnc1phVkVlVk45OWNzekRzMmF1T2JXZXREZkxhWTF2NUp4MGJJS0dlRkZw?=
 =?utf-8?B?NUZoL09qVHlBdzVtRndiclBCaXYwT0ZEVFc1WHNvZ0twRUJkME1NTnBBRXZx?=
 =?utf-8?B?WUxMVnJvWmlvTzNPVHRCWUJWRW5vZFcwd0xHNUozOFJNdnc0Skl1Rm92di94?=
 =?utf-8?B?RDByT1pRcm1Hc0c4MjFJUWJrazhaSGJiVCtralk3UUJtQlNBQ2paakpRL3pU?=
 =?utf-8?B?bnJnTk1jV2taN3BsL1V5TnZjUnc4cjNBL3BuSXJ3cmlTbUYrVzVyZmdnUnFL?=
 =?utf-8?B?dGxlMWZObHBtR08zUnhwa3lLWFlKb0x4YlgxdEVRU3JIUFIyeE00OXpWbjBN?=
 =?utf-8?B?emljVVhJQ0ZJN1Z6UmpuRHNrb1lzckx6b01taG1ESUtoaXV5L1FQYjlib2Jm?=
 =?utf-8?B?WXBXanZnc2dTUjRQVUM0Y0E1MjkvMXQyU2tOTFk5S1M2MWc3Q3VJRWtLbE9W?=
 =?utf-8?B?aWRKUlVjOTRxcTZkSGhpQ2hwTG1OK1B2bnJQSDRMaVpESWFrdUw1S3VHdEkx?=
 =?utf-8?B?UUs2RHdTN3pkQUJiNDZvNENQREJaZmxHWXNtdG5KZUF6VDNlNmJoVGM1TTZO?=
 =?utf-8?B?TTJ0N3VkZTQ2ZktvWDRCNFVnQkxZQTBnV2lwVFF4bWRDY2kyYURkUGlnaE0x?=
 =?utf-8?B?WVlFbVA4cU43Tk11cmlRTVBncWcxS3hzOVZrbWZ2cjlEZnJrb1UxcVlQNlRL?=
 =?utf-8?B?aG95dlYyb0p6aXl4OUhGc1hkWCt6dGV5TzNmSzlQTW5DNlJxeUNrMjRWNnRG?=
 =?utf-8?B?bWs4cGM0bnNjeXdqUDZiM2RoNkdlN0FIbkQ5WGF1WEFXZ3ZoQ2Z2bEdRVnRy?=
 =?utf-8?B?TEs1M2UyM3dxaWozYzM5c1N5em5tSU5RbDJXYnNxRGtOS3lXL0YyWDBNRlpG?=
 =?utf-8?B?Q1hidEl3Q0RhMjg0bDhNRHZqMDgrL0JiR2JyVmNSR1VYNFh3bURLSW41REEw?=
 =?utf-8?B?U1JtRmdlbm1mTi9PLzRJdVA4aTRUcUp6K3pNTkdYWnhzVHJ5V3RuTFhYUjVC?=
 =?utf-8?B?RzZydlFHcmkvNk91ZTJwdndhQS9uUmdyOUIxeE5QcURPcFBpM0pCZEdvdk4w?=
 =?utf-8?B?dTNERVBnS0x6dU8zdVk4MHpmMW5NeDVLeDJuNDlueUlWalNMc0lPRXNqSk8y?=
 =?utf-8?B?eTVzMk5TbTVRcW94VVNhQTI2T0E4aTRHWkN4QUdENXVHZXF1RjRNTmN6TGNt?=
 =?utf-8?B?b1d3amxHWkZndHhnMWVyWXFlREEwUkpmSHh2SW5PWjl3aEN4UGd3VzErajlk?=
 =?utf-8?B?L3pqUGhVbTBMdUIvVCtLdXFONDhxdGlETW1rK2ZsWVFTcEtvWkJqenU1ZjdG?=
 =?utf-8?B?U1JLNHZ3UXVIODBxM2xwTlYvMThsS1FoVS9yWjE2QVRDdDJaRHJuNXA1SG9z?=
 =?utf-8?B?NlB3dDFLazdMZE1sK2VzWUQ4N21ablJUNFc2bEpOTE13VkJ1RGRXSW8xd3Nh?=
 =?utf-8?B?aG04R29FekxHSHExQkUwM1R1azBBZTY2Z0swVmFFZk9xVlRZNGxmSzQrdkVV?=
 =?utf-8?B?UDQrVW9paWZpVVJJZnBPbFVlVXl0U2RaeEFDaWtHbG53aDdjUmVpcUs2TllU?=
 =?utf-8?B?MEJXL0VhMTlOS3B4TExYODJlUWdNbDJqb0ZianhWRlBnN1J1WkpjRDFDVHI2?=
 =?utf-8?B?TVJ1MjVuV3JHc0ZjRU9kYnpLbmI5VjVnNyt4WjQ0eXFLclZJYnRVZWhEZGxw?=
 =?utf-8?B?Y1dkTjFtWVcvOHliN3g4M0cvQkFPQUMya0RBRXBGNkxacjlieVNsaXp2QStW?=
 =?utf-8?B?dStuTU5ySElwV0w2Rnd5RldYTzA2RVlCY3pwM0dHMzhKV2gvQVdIenFmSG1z?=
 =?utf-8?B?QjVDUjdmNDhsV3pZOUNrV1hzejVHZlRQRFhrUWtSZ1pySXV1TXQvb2c5WFZS?=
 =?utf-8?B?d2pTdnpXSnN4anBSdXN2U2MwNzUxR1d4ZVBkOXNsL0wrR0ZOa3lYeEJnVDMv?=
 =?utf-8?B?NXNDcGxwS2RKMUlSOGY2QlQxeThUMjJ6OEdReWZJZW1IbDVLbGp3bDYyQXJ2?=
 =?utf-8?B?MFVZMU1yNkRBMGowYUFRb2JPajQ0UnRrM05lTHJQdndRR3MvejhvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E6A6441CACA7142B05A8BF49C050CAC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50976d38-29d0-4134-c1fc-08de5a99c7fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 16:09:26.3767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFsIbyIEcH8ojmAPamnHuRxpUG5zLbk1Xb5O5DJsDwkD/LSvoI36pKZnAO7XBsrhMi2LQckGgFBf7GmmthF4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

SGUgbGVmdCBJbnRlbA0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvaW50
ZWwtZ2Z4LzIwMjUtTm92ZW1iZXIvMzgxODM1Lmh0bWwNCg0KDQpPbiBGcmksIDIwMjYtMDEtMjMg
YXQgMTU6MzcgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpLA0KPiANCj4gV2hlbiBhdHRl
bXB0aW5nIHRvIHJlcG9ydCBhbiBpc3N1ZSBpbiAtbmV4dCBJIGdvdDoNCj4gDQo+IDxsdWNhcy5k
ZW1hcmNoaUBpbnRlbC5jb20+OiBob3N0DQo+IG1nYW1haWwuZWdsYi5pbnRlbC5jb21bMTkyLjE5
OC4xNjMuMTZdIHNhaWQ6DQo+IMKgwqDCoCA1NTAgIzUuMS4wIEFkZHJlc3MgcmVqZWN0ZWQuIChp
biByZXBseSB0byBSQ1BUIFRPIGNvbW1hbmQpDQo+IA0KPiBUaGF0IGFwcGVhcnMgdG8gYmUgYSBj
dXJyZW50IGFkZHJlc3MgaW4gTUFJTlRBSU5FUlMsIGFuZCBpcyBhIGNvbnRhY3QNCj4gbGlzdGVk
IGZvciB0aGUgZHJtLXhlIHRyZWUgaW4gLW5leHQuwqAgQXJlIHRoZXJlIGFueSB1cGRhdGVzIG5l
ZWRlZD8NCj4gDQo+IFRoYW5rcywNCj4gTWFyaw0K
