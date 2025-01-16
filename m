Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB444C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 19:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E93B10E2CC;
	Thu, 16 Jan 2025 19:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csfG/RBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FDD10E2CC
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737054992; x=1768590992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gt6MRHsZVLKe9m3Ifhp+Ug1hWxjNLrt/4E+3leeqTYY=;
 b=csfG/RBD5+jn5bCcm47L26TtUSU2ujNpzLCDlWQ3bn6Xya2hBA4PzMjb
 fFcO1wAhjVxnPiWiWhd8lVB3BXgVDh+p15JK3SBiiZ+AN77Y4pwRZ6SHr
 3ojEKUGQHdGXDiuVlX/wgDjKftE1UmBXOHOGRtPhfFcZTRm7Mw1yn/B92
 8HOhbDoYmUuQC1xjMrWA4iqwqUiFa29kjabfqhDDOslyytO8zi7t5v9lH
 Qjmk4aY7t4V5psoIqMfDV7zjQOQR6lkvt1HDpeu9qAmilk8r33xt7Gl5D
 l+T6x7SzPcRz/EJbNbC2gTMobHLyrWRDkGb94YxrHCU/mRhf+0AFr7xbs g==;
X-CSE-ConnectionGUID: lJD4L5LxQEGwv6D2PKN73Q==
X-CSE-MsgGUID: krdAa5qzTZSvPi9+naTcMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36742912"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="36742912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:16:32 -0800
X-CSE-ConnectionGUID: hk7zdk5MR4WR1nfI6N5gbQ==
X-CSE-MsgGUID: gka/KhfAQ2qxLziB2whauw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110574947"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 11:16:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 11:16:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 11:16:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 11:16:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgPld9FW76Wn5DwCUBGpID/mI8l7C1vNHxUNIUYxHEqBHI4yUVaoM4z8P5vTQFs/JaO2APO+vWmjvNm6OklaFayacJwirOOnHrTaUWw0s/84JuP4bIzzKG+owc9KpSCKYexP1pJ62VuZ3zGNy2jbIyvSwJUfDXGdnUZfsYv9QYQfM0qdbEQLsicslpQbOie77CUscct5uae42bZ19R4S+QDIDSnlLuRvGtNNGhW8IQh4zJ2HrfWHT30HdOkz3HZS02p7a0XpRIi0G6SoVNIcpXYoVBJ0zLMzyOHZWEgrRkjJv4CMeOWQmaP/E92ZpQks/oD+cBhQgor/bGmaOuawPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt6MRHsZVLKe9m3Ifhp+Ug1hWxjNLrt/4E+3leeqTYY=;
 b=B5U9VCUX0sZRO34LS5lJqOrjNtxC6/ExjwxwX0LTZ8UTT+OapVYLQWfjy4up/Pqt7u+N3R+Rw6DD6dkvXxdCDip2u20Fr9NzMVYW7k89l8af2mMB9ac1QjFte1yDvt2LJl82dImDdwLogRm8XED5iRJ/ohpaq1XrIogZ5P/OzUfzR00Xw1NFylBTpUMxXEiHKUQ70pGo6kDnElmyhLiKV+5c3ZUF8XuoKtsHVgCG61TaiR65RaE6i6XHzppv9R0IafsRCAHB5xffV0yKuyJ+YwAbIShmRZWdKxVd34Bqst6WhxtdwjSNlDxYVvRZNypmeJO5LxJMNsaXRNWqoSRNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 19:16:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 19:16:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Refactor max_remote_tiles
Thread-Topic: [PATCH 2/2] drm/xe: Refactor max_remote_tiles
Thread-Index: AQHbaBePEm7pR/2Eq0myMyi+sbfca7MZxhaA
Date: Thu, 16 Jan 2025 19:16:26 +0000
Message-ID: <8326b6f30df9fdfc13c44d4b26d00ea5c0c9dc0f.camel@intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
 <20250116125447.4025927-3-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250116125447.4025927-3-sai.teja.pottumuttu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6860:EE_
x-ms-office365-filtering-correlation-id: d6f734bf-6da6-4380-c485-08dd36624604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aWh3bnlSanRqd2tmWjYrMUdxcjFLcWdheXJUNXFhdUk3RHJ0d2QvL2g1akZJ?=
 =?utf-8?B?b2kxMnZNcWoybXFTQUZDVkdkNzR2SVBsaUNuN3o1SjNFUWppT0NmSVlBK1Q5?=
 =?utf-8?B?dEM4QUQ4OXZhOWJ3OTFnR0FjNkxicmZySHpRUTJ1dVFxdlVuaHZFdlVkN1ZZ?=
 =?utf-8?B?WjQvOGFWazhzZG5ydURWRWZDbVlsWnYzZk5PM3d4RzY1djR6TXVLZ3EvREFn?=
 =?utf-8?B?ejZjR1hUbzlqalZXQTFrV0RuVk0yWUxxWTRtV0IzTmVNVGJpOVFoSEYxajdp?=
 =?utf-8?B?MjJId3VoOTJQd1NRN0tlaFJTOUw2QnUyT1dIcFczaVdReGpVc1BnbExGanli?=
 =?utf-8?B?c1RQdlFoUkFya1loZ1puZnZqT0srZURDNS9sbUhSaDB6Z3ZzWUFDU3JjWnEw?=
 =?utf-8?B?YkNXckFFZk1KanNMaUVUSHp2WjRiQVczcnY4MDQrMVplUTZUYXMvWTJmZ3Rx?=
 =?utf-8?B?bnRpQS8xZWxwMFg4MVRhRE9NMEZTeVU2QnVyTFpjR214RWl3Tnp4STQwOWFL?=
 =?utf-8?B?NzNWUWIzTDNjTHk3VUVlRXM2TFlsenVDNDRManZQMUd0MlBqa0psTDJHWG45?=
 =?utf-8?B?elp5ZUxTa0pEVG1RTG1xKzcxMXgrVTVXWFpYUUF6dWtLYThMc3E3U3BpR3Ji?=
 =?utf-8?B?NThEVnBkQ1gwcnhSb1VteE9nbjFqeG01MkZQNnhxSiszUjd4YWtxeFRqd0pw?=
 =?utf-8?B?OCtvd05HaUl1djFCSlFNSWgyb2lSeElMVERwVmZ6MmE5UzI2eDFPT3J5WThH?=
 =?utf-8?B?TjFBSk55bDMxeWg4TkxobFNvQjlEZ0tSZVgzUUs1WXNhejBOKzdUWnh5Mm9r?=
 =?utf-8?B?d0srNEczbVZwWlQyOTZPTG5wZEtKMmluNStWWGRFZEp5Q2VXWFBwYXdPSEVX?=
 =?utf-8?B?TzBLN1lrM3QxdjFtQWJZWFR6VndhU0dmak5id2tyREwxNzV4dUpWTjk3c3FP?=
 =?utf-8?B?dzl6cFZvVzBndlhFU3FiMktwQlpwRGgrVC9JbXhZbk5qVFdhQVJRVUJVOENm?=
 =?utf-8?B?cmQvZW9ZQVZRNjBTb2hFaXV0OUZ4RXQzU2tDQWZ0ZFVlc1c4bDhseWhNVUJW?=
 =?utf-8?B?ZmhYam5nb3QwRU9HNGJ5T3ZCK1hxT3hZK0g0ejgxajRyZUNvdkRIOFAxRFkz?=
 =?utf-8?B?ZGM3YW5XUS9MdVkvV1djTFlPZEpTUHF3OVkrS3BaUlRIdFpNWGw1QjBQODlM?=
 =?utf-8?B?UVZCNFdEZDhiQ0w3TXRwZnpBYzIydm9QVHBOZGFJaUtVbVhOT1hqdHJvSjlk?=
 =?utf-8?B?UkdxMG9mbHcycktRMk1jT096UkIrVlNiY0J3cUlhb3JUOTdXc1ovM0pxTm13?=
 =?utf-8?B?R0k5OFJOQkxtMDVOSU1TQUpUTUxDbDBoZkZzMUZUNDc3c0trbTRSeHhGMTVn?=
 =?utf-8?B?b1VOak9aWG9va1lXWlJZR3pUTXN0Y3VrNnFTVXc2M1FqalN5b2F2VXlXQ0Jy?=
 =?utf-8?B?UEJPVUFpdTZWbk04WEdFQ2ZaZFBHYTVCc09rZFExQnpCaGh3RnIvY3JYSU5r?=
 =?utf-8?B?QnlvSHZ5OCtrOElOcWVuaElYRXVZS2J5bU0zd1JqMVlQNFgrdzFTMkNjVW0z?=
 =?utf-8?B?djFvcmRsTW41Vm16WGRvMnJ0R0RKRVFCaWZscjg2VkdKb0JCZVVDR0psUitG?=
 =?utf-8?B?Zi9CdWVZVWdCNWdIcTQrTzdLaEJDQ0hvcUhxVG5PSXBWalNBNHF1bXlmMGgx?=
 =?utf-8?B?WEJXcEllS1EwWkhVOCtiS0Zqc29TTWxuQ2R2M0tySGJYNmcwV3pvZjR3a0w4?=
 =?utf-8?B?UWhQanNqRUcrak5yOXNUWVZNWlM2ZnhnOXhzUitiWisyNjVyUzR3YnJJMkla?=
 =?utf-8?B?ZGFoaDZFUkJQN3VlVVhsZmhrTkZuaEdFWjYwWTlsMU1PYzROK2U4T29KZEFW?=
 =?utf-8?B?ZWs2Y1AvZ002SnlkenJtc1cyN2JPT1AwS0YyV3poZmhZMnlNWEo5dDBPVEVa?=
 =?utf-8?Q?0Pcgha+N2cvfNaEiM2kyeLzZOOfJx6Tq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmQwV2dMWm9IcHpqc0MxUWF5Yi92UjBLMEtOeDRCS21JTFRZajZZRkNaNzN1?=
 =?utf-8?B?NE5kbVJCQnk0RUFwdVE4ZmtmT1ZWN3hwVzQyekNETXVSK3doMmtvRHpUV05a?=
 =?utf-8?B?Y2s3ZHpzNnN1UW1MK1l4ZDRNa29KeXRhUE9ZTk5YYzBaWDZqb2l0akhTMitF?=
 =?utf-8?B?ZWxnOVdOK2llY1BtdEdVbXd6REtaSVUyWXRiS2p4eTlvY3R5T0dGcStJcTJR?=
 =?utf-8?B?eXRERlR6UVNST3NHdTdPNnVUVzJ2ZXlwYi9xZmlURGEzRk9tSTQ1ZUNZdTFF?=
 =?utf-8?B?dzJiSVlybXM1ZXVjekdjNmRhSWl6dUtKYkJNUE4ySlo0OXZ2eFdINkxOTHV1?=
 =?utf-8?B?NEpVb0J5dkpySUlGanN2TitoblRNNTRPV0p6REtPeTRJcUFUVGdjQ29hM0xu?=
 =?utf-8?B?dmVobmlrVyt3NDAvc084Mk44bzVqdUlOOTQzeFo5R2xFYkxhaW14bDZZY1Ax?=
 =?utf-8?B?K0UzRVIvbWk1NWRjbHpCVnZTUFlWMStsWi9laVVKYk8vc2FHRW91cEZaWUZh?=
 =?utf-8?B?d1dmNGtscEpiT2lZUlVINXF4YzUzYnorNDVDalBPUTVmWllDMVdCZ2NZWi9R?=
 =?utf-8?B?aEhvWGJwQiswZ1UvVjJrRkl3NlNOTExhV2VKNVorZ25JanVHdHJDTG9kUFBC?=
 =?utf-8?B?bUNnMFF1OGx0dnBTZ1JkMVBreE03a3MrOFFncVRwbk82UlNPNDdJNElmdnJ4?=
 =?utf-8?B?QzhBYUdjWnBqbzdYaThHRW5Xb2JlYnFjQVpjdlVqRHNBTDFmZXc2R1dhREVy?=
 =?utf-8?B?dG1DaGlZY0plbzA1ZWFBUHZ4b1RvdDRldnVMcStxQTlMRXZRTHFrUWFnL2JS?=
 =?utf-8?B?SkVRek5mYnBuNUFlSkhESzdoNGpBeTdNQkxwM2ZHOWcyV3BMVmVqemtrTGZo?=
 =?utf-8?B?SnppYlBJQ0d4YVNjQzJodXNMTXpBSTkyeFNUVnltUGFUSnVqR05XRE9oUkov?=
 =?utf-8?B?S0prRnBrZ25TTTI5SDhpaHVzREJIU0ZVYUFsemtPcUxINnUxOEJGNlYyY3VW?=
 =?utf-8?B?eTN4V1JmZUNzeU5DYkJnQ09nNEpQV3V6QmNGVmdvamNHNEMxaW5UVGhQS0cy?=
 =?utf-8?B?MFg3cFF3VFk2SFB2Q1ZDT2NsK2FVWmVsazVoUXNQUDMyRzYwbVhnM1pkV3dK?=
 =?utf-8?B?aC9KdDM4aTgzdFozczRxWjN3R3JyQXBXWUxnK2g0VW5tMDNHcDlmSW1BU2Vs?=
 =?utf-8?B?THkzU01HVkswNjdQMmZKdzVuTGlaZCtIaUNPM1B3VWtJdzBmYWVvYkN3Z1dt?=
 =?utf-8?B?NzhEVTdUdVorVGdzWkNpcWlXRHl1TzRqb241dXFvMlhzZUZFQVRCOVQxWk95?=
 =?utf-8?B?N3pGaitqTHdEclV5MytCc0NQSWhBdzl0eEkzb2FRbkQrSmFJdlM4TjIzQzlY?=
 =?utf-8?B?ODdGVEMrbHBMQVR2NHluY2ZJTUh5NHdHRDc3UVRZaFpRaWdMZGNwTmFUemxK?=
 =?utf-8?B?Q0dRN1kzcTBpZXlFQUdSNjVLUU94V1pPRTlybHkwUVo3N0NtK1hHUTNsdTFM?=
 =?utf-8?B?YmFqeUozbjh5NmlFVDA0SGlFN2ltM0tXdUlvRE1YZStmd0w4THdDSnVreWxn?=
 =?utf-8?B?VXlUQVFwUjVkYUtpeHF3SDBDcGk4eVVYcnowV2pIdVVnVCtUSXJ4ZmxEbE1S?=
 =?utf-8?B?Sm1jUnZnV2xxckNwelZuYkpjNCs4c0RVZlVUL1YwMk80Z05BdXZCQU4wZDJW?=
 =?utf-8?B?bHlRVHVnQXBhNitKMnZ6bkx3U1R3MnA2dW9RcklnVkszNFhwYlVKbXVpQ3Nk?=
 =?utf-8?B?WnNlUE5tTERDYXBjSTVYZXRvN0ZicXhaNDlNQTZzVDVOR3BtRFQ1cjY0a05h?=
 =?utf-8?B?SzV6UDVmRUJLSWhvRWN6dE1ZYnJlZ21JY3hMRHF2NUpsTmRSVitrb0dzRXRl?=
 =?utf-8?B?R1F0TklWN3BvWkhnRlA5a2ljWGN4STZScW8vbnFDZ2xqZ2dMaEhxL1MwOFFT?=
 =?utf-8?B?OVRnNWtXS21uVk5HK3YxaUhveEJ4bm81R011dnhJWlJGbTBwVFo1RlE2eEFK?=
 =?utf-8?B?eXpUbFlMbGd1SXBrZlBqZnBadk1XWjd3RVlDcW9FMW1lRCtNNlJmTnF1bFdj?=
 =?utf-8?B?d0laSG5QN3FpZlNSVGRvYzczTUtIN2Zwb004NHg5d2J1cVN6a3VYeTVGSEJm?=
 =?utf-8?B?RkVnT0pSNkJ1c0dwRmdCeGFRVE44ZXEyKzhscktIY290QXE3VExIVEtuUmsw?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB6B98F13561DF469F83A53DBEB30661@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f734bf-6da6-4380-c485-08dd36624604
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 19:16:26.5293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odw0DOV7SLz9Ip83DjDt11qtke+caGo1it2dB+GKN8lLGk4pp355mHea8YX06HINndHfd0xMu+XGDI+6xDIiNRJ6u/0bz6xgA0dFsWw+UH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDE4OjI0ICswNTMwLCBTYWkgVGVqYSBQb3R0dW11dHR1IHdy
b3RlOgo+IG1heF9yZW1vdGVfdGlsZXMgaXMgbW9yZSByZWxhdGVkIHRvIHRoZSBwbGF0Zm9ybSB0
aGFuIHRoZSBHVCBJUC4gVGh1cwo+IG1vdmUgaXQgdG8gcGxhdGZvcm0gZGVzY3JpcHRvciBmcm9t
IGdyYXBoaWNzIGRlc2NyaXB0b3IuIE5vdGUgdGhhdAo+IHRoZQo+IEZJWE1FIGlzIG5vIG1vcmUg
cmVxdWlyZWQsIHRodXMgaXQgY2FuIGJlIGRyb3BwZWQuCgpJIHRoaW5rIHdlIHN0aWxsIHdhbnQg
dGhpcyBGSVhNRS4gSGFzIGFueXRoaW5nIGZ1bmRhbWVudGFsbHkgY2hhbmdlZCBpbgp0aGUgZHJp
dmVyIHdydCB0aWxlcyB2cyBndHM/CgpUaGFua3MsClN0dWFydAoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTYWkgVGVqYSBQb3R0dW11dHR1IDxzYWkudGVqYS5wb3R0dW11dHR1QGludGVsLmNvbT4KPiAt
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoCB8IDkgKysrLS0t
LS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmggfCAyIC0tCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMKPiBpbmRleCBmNTljMWFjYWUyM2YuLjdmMTdlNWVhNmVkZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMKPiBAQCAtNTUsNiArNTUsNyBAQCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2Mgewo+IMKg
wqDCoMKgwqDCoMKgwqBlbnVtIHhlX3BsYXRmb3JtIHBsYXRmb3JtOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHU4IGRtYV9tYXNrX3NpemU7Cj4gK8KgwqDCoMKgwqDCoMKgdTggbWF4X3JlbW90ZV90
aWxlczoyOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHU4IHJlcXVpcmVfZm9yY2VfcHJvYmU6MTsK
PiDCoMKgwqDCoMKgwqDCoMKgdTggaXNfZGdmeDoxOwo+IEBAIC0xMzYsNyArMTM3LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjCj4gZ3JhcGhpY3NfeGVocGMgPSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoWEVfSFdfRU5HSU5FX0NDUzIpIHwg
QklUKFhFX0hXX0VOR0lORV9DQ1MzKSwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9IUF9GRUFU
VVJFUywKPiAtwqDCoMKgwqDCoMKgwqAubWF4X3JlbW90ZV90aWxlcyA9IDEsCj4gwqDCoMKgwqDC
oMKgwqDCoC52YV9iaXRzID0gNTcsCj4gwqDCoMKgwqDCoMKgwqDCoC52bV9tYXhfbGV2ZWwgPSA0
LAo+IMKgwqDCoMKgwqDCoMKgwqAudnJhbV9mbGFncyA9IFhFX1ZSQU1fRkxBR1NfTkVFRDY0SywK
PiBAQCAtMzI5LDYgKzMyOSw3IEBAIHN0YXRpYyBjb25zdCBfX21heWJlX3VudXNlZCBzdHJ1Y3Qg
eGVfZGV2aWNlX2Rlc2MKPiBwdmNfZGVzYyA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLmRtYV9tYXNr
X3NpemUgPSA1MiwKPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19kaXNwbGF5ID0gZmFsc2UsCj4gwqDC
oMKgwqDCoMKgwqDCoC5oYXNfaGVjaV9nc2NmaSA9IDEsCj4gK8KgwqDCoMKgwqDCoMKgLm1heF9y
ZW1vdGVfdGlsZXMgPSAxLAo+IMKgwqDCoMKgwqDCoMKgwqAucmVxdWlyZV9mb3JjZV9wcm9iZSA9
IHRydWUsCj4gwqB9Owo+IMKgCj4gQEAgLTYzNSw2ICs2MzYsNyBAQCBzdGF0aWMgaW50IHhlX2lu
Zm9faW5pdF9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlCj4gKnhlLAo+IMKgwqDCoMKgwqDCoMKgwqB4
ZS0+aW5mby5wcm9iZV9kaXNwbGF5ID0gSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RJU1BMQVkp
ICYmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB4ZV9tb2RwYXJhbS5wcm9iZV9kaXNwbGF5ICYmCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNj
LT5oYXNfZGlzcGxheTsKPiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby50aWxlX2NvdW50ID0gMSAr
IGRlc2MtPm1heF9yZW1vdGVfdGlsZXM7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVf
dGlsZV9pbml0X2Vhcmx5KHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKSwgeGUsIDApOwo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IEBAIC03MDYsMTIgKzcwOCw3IEBAIHN0YXRpYyBpbnQg
eGVfaW5mb19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLAo+IMKgwqDCoMKgwqDCoMKgwqAgKiB2
ZXJzaW9uIDEzIG9yIGhpZ2hlciBoYXMgYW4gYWRkaXRpb25hbCBkZWRpY2F0ZWQgbWVkaWEKPiBH
VC7CoCBBbmQKPiDCoMKgwqDCoMKgwqDCoMKgICogZGVwZW5kaW5nIG9uIHRoZSBncmFwaGljcyBJ
UCB0aGVyZSBtYXkgYmUgYWRkaXRpb25hbAo+ICJyZW1vdGUgdGlsZXMuIgo+IMKgwqDCoMKgwqDC
oMKgwqAgKiBBbGwgb2YgdGhlc2UgdG9nZXRoZXIgZGV0ZXJtaW5lIHRoZSBvdmVyYWxsIEdUIGNv
dW50Lgo+IC3CoMKgwqDCoMKgwqDCoCAqCj4gLcKgwqDCoMKgwqDCoMKgICogRklYTUU6ICd0aWxl
X2NvdW50JyBoZXJlIGlzIG1pc25hbWVkIHNpbmNlIHRoZSByZXN0IG9mIHRoZQo+IGRyaXZlcgo+
IC3CoMKgwqDCoMKgwqDCoCAqIHRyZWF0cyBpdCBhcyB0aGUgbnVtYmVyIG9mIEdUcyByYXRoZXIg
dGhhbiBqdXN0IHRoZSBudW1iZXIKPiBvZiB0aWxlcy4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4g
LcKgwqDCoMKgwqDCoMKgeGUtPmluZm8udGlsZV9jb3VudCA9IDEgKyBncmFwaGljc19kZXNjLT5t
YXhfcmVtb3RlX3RpbGVzOwo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfcmVtb3RlX3Rp
bGUodGlsZSwgeGUsIGlkKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQg
ZXJyOwo+IMKgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMu
aAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gaW5kZXggNzQzNzQxNWE1
NGQ1Li5iOTY0MjM4NDQ5NTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aV90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gQEAg
LTE5LDggKzE5LDYgQEAgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2Mgewo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHU2NCBod19lbmdpbmVfbWFzazvCoMKgwqDCoMKgLyogaGFyZHdhcmUgZW5naW5lcyBw
cm92aWRlZCBieQo+IGdyYXBoaWNzIElQICovCj4gwqAKPiAtwqDCoMKgwqDCoMKgwqB1OCBtYXhf
cmVtb3RlX3RpbGVzOjI7Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfYXNpZDoxOwo+IMKg
wqDCoMKgwqDCoMKgwqB1OCBoYXNfYXRvbWljX2VuYWJsZV9wdGVfYml0OjE7Cj4gwqDCoMKgwqDC
oMKgwqDCoHU4IGhhc19mbGF0X2NjczoxOwoK
