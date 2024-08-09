Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F12CC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 10:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7410E8A7;
	Fri,  9 Aug 2024 10:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahDPfX2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7442510E8A7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723199577; x=1754735577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2hMbv9gjpez+XJGAmFNB6aRT2xMTkOS/kvZ5ffW0zZI=;
 b=ahDPfX2EZYdheJk87i28BD0+dh78twxBOt7XuOn6MhBJb/ZZculjJ5mb
 RkCvh96BmlbksGRqn+YE0R5guUyltYP6yd92yElF/HD0HXz/OadwpngjZ
 CdjpyeaoV737hvlwoUEffv8fVPxs+xEU77h0P9RPa2KptUG+X5f9MZaqM
 n2auEt9RU7owl7LLg/i68oFyqkvCdabtT6SX4bAXeLyKcGCnQXNXSKQWy
 Xy2F+M81Z+c73pknAefiOfJkdYcgFQVDe5Pz0Od61hC1JoHt0D8c4YCLi
 pmTnrQeVT+G0dNA1qv4nF3zWd/HGmxSkYTh3zZiSlu5fCZKYVELDHI3dE Q==;
X-CSE-ConnectionGUID: FzxhuEl5TU+8TuMY/Gea7g==
X-CSE-MsgGUID: 5Z/FWiC8T8KCzsVFv3snJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38874243"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="38874243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:32:56 -0700
X-CSE-ConnectionGUID: 5tjntXGAT66DZq1gPO/RwA==
X-CSE-MsgGUID: xpiY37B9RAyZwx8pmtTGNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="80766790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 03:32:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 03:32:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 03:32:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 03:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXneP7nPme4IupXs7M/QrqNTaWvaD09ja2gHIVa8baLDZFN40t8dDw7yJBKbVe3QEw9wh6MQhjcEoQa09UrH0ymCyE98N9KzcNu51eTEwhvz8Nw1V7wQDhapyfwqZtlgiz53Ozf9TIAtFZNpw+e2ax/HiHbigdrsw0zHKZEalNz3yvSV3ktPQEaJLlIRK9q54QI4E4gPwbmwna9jResHP0CD2M0Dc5pYq2hN5LwyKv6kLsuQdhQrmtWWb/64Ijm74blTIUKfoOoTK88Od4desNe1UZNw+8VDVeiKl2f0hAJUDS5Vvkj5j1xB3ZYslWzgjVInippQ4BZH/28LnQgaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hMbv9gjpez+XJGAmFNB6aRT2xMTkOS/kvZ5ffW0zZI=;
 b=jpZxBaCbstU4SlfCQQw6WJetsGW04nwzWd6n05Uqv3gYpvbhJj1uKSmxfe2+66Pmu4nsl038MPY574gXlK4NnxefvzwFN507mV/FmOEr5AtCFSnqHd61SaUaWy9YIFChcNrXf7PKK7DrD2LPHEfP3JgR9QuFYv9m/RGDwRAjnsf7TSM781974SMzXOG37ONfwMvn0TLnc3fgah5aURpEDNMjNcQ9hl6ipXjI0KxBQpLRjFmkyPMTi97QFbMrpLoVxTvBtL6lAotXd9kmNmB2m6hfTAoz+d9eC6nBCHWdfPATjBLLRXWn9ucPlQJe9pS7f4l31f+3e+22I4FSomsmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Fri, 9 Aug 2024 10:32:54 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 10:32:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Topic: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Index: AQHa6XUSM5dvDthrZ0WoognIGtqYVrIdxbwAgADbCgCAAARwQIAAAwgAgAATkoA=
Date: Fri, 9 Aug 2024 10:32:54 +0000
Message-ID: <DS7PR11MB6197DEEC423A987596C626D881BA2@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
 <20240808092826.585276-2-tejas.upadhyay@intel.com>
 <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
 <4a41b168-10de-432f-8535-a719d321823a@intel.com>
 <DS7PR11MB6197AD5C4DD4595F464E765C81BA2@DS7PR11MB6197.namprd11.prod.outlook.com>
 <2bd3e553-6319-4f9a-844f-d08528e4c331@intel.com>
In-Reply-To: <2bd3e553-6319-4f9a-844f-d08528e4c331@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|DM6PR11MB4724:EE_
x-ms-office365-filtering-correlation-id: bd339646-bb47-4e4c-3d48-08dcb85ea099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Smd4aHBvUXY0THU4eTgyUDY2MUNsdHZHYWZnSEtjODlsMXJpbUlocjRNelll?=
 =?utf-8?B?Y3l2RlM2T3d1bFNjcEpMaTloYzk3dk1RaGpNYlFDamd0T2lmRGI3VzNwSFFk?=
 =?utf-8?B?RjVOTmdhdHlmSi9lbmNrUEsySzkvbUVCMjNIOUpIVEhTYW44TFBaNmJDM3gw?=
 =?utf-8?B?TTBHN3JiSjBYUFhMTVNiNldOWVpEdStzc3V5ZzRyakw5UGMyeVBqYVZXM3Y1?=
 =?utf-8?B?NklxMkF1Nk81eW9OY3BzcTQyNHZvYk5STFFFWU8vOFA5Zmw0cEpHeHQrdkg1?=
 =?utf-8?B?bUZLdDRObDlVZ3dyOUxtLzZVSXpBMkRLajNXQVRmOEtXamE0TlpKb055T3B3?=
 =?utf-8?B?bHBUTjkvNkdEbkFBa1hKQmlyTk0xa3p1TGlQazVwRHN0Q0lsVWZ1bVM2VFZ3?=
 =?utf-8?B?OXNMdVpDRnZBdXN3STFuclcwTXhmcVJEVU9zRXBRekpaSlBRcEY5NSs3VHNw?=
 =?utf-8?B?cnJnZmZqbTdoaWs4cWl3c2xUUHVweTlEK0tzSzlQRXltTzNzaHhIUXpmQi9R?=
 =?utf-8?B?YlBYRmQyN3NEZ0FkYzkvTGdBd3JxcnpNajdzUU1YRmlJUE0xcWh2QnI5cEpu?=
 =?utf-8?B?SmcwbGM4NTVGQ3VsdmhQOEt6RzlxMU9nRXk3enJvT3l2ekNzQmF6TXcyZUVK?=
 =?utf-8?B?blV3clhmczBicW12WnFNVkJLRmpqS2dHZ1JGMkw2MnFvMTdyK1M4ZVFseVlW?=
 =?utf-8?B?K0Fzajc3blV3Nll1R3FtMlhablc3YzF4cUdhTm40MVpxVTNTaFJYbkhjbVNJ?=
 =?utf-8?B?elgzNU9WWXVSWVhJeXdqR0hZRmdSaXpUYVR4Z1pPK2RSTFl0Z1NoTG96bVVG?=
 =?utf-8?B?bVUrd0FmbTRKWWMrRjNvWFdBbE9IWktnVDRpZjZZcktNNUdtS3VoZHl6T2Y3?=
 =?utf-8?B?aDI4RHJuN0o0ZFkvTGtScnltTlgzcnpCWFFHckZsbWtsajNoU3dBOWZTRDBG?=
 =?utf-8?B?cVZqU0N6Y1VwMWtvWkt1cTZlRE5Bc0xzRXJSMUhCNGJQUzRSQzI1TUtQY29m?=
 =?utf-8?B?azMxempVQ09HVzFoWlZKVVlNVlRseEFRTnRpSlRGUTZ2dkxZL0xUMEIyY3kv?=
 =?utf-8?B?dFg0c01zUWtvZ245WVdaZ2laRE9iOE10R3kwSndRemlxZklObHg4ODdhV0RQ?=
 =?utf-8?B?Ym5WdGlLaHVHMEdZZnBXS1kxS2J2TWxlN2VXUXNyQnVnblhYcnRqWGk2YXhp?=
 =?utf-8?B?TjU2Zmg4K1JCcjRKN2FLTWJwcHFPTmpreGVBTFNwQjFmRDRMRkFmWk5jTlky?=
 =?utf-8?B?bHgvb1UwVmxONTlZVUVHOG5HOGZPYjEyczNTczNaQW1OSXQ3M204YlJpL3dj?=
 =?utf-8?B?WGtWcXNWYTNGb1lxdFVzUWVkR3NXUk5XdVI3bkFmZVJkK09TS2dpOFNNT3Rr?=
 =?utf-8?B?MUV3WDczYWRLZG1VaEgwVjFWN1dITXMva2d6K2RiOGhBR05oTm9kNmlqVXhs?=
 =?utf-8?B?L3dEMmZwVU5KVmpmYVdpV3RrYUtOVms1TTFhT2pyZk5sa1lzOFBwTUpLa0ZV?=
 =?utf-8?B?aDlpT0pxaXU5ZHFKT25hdXk4aEMzODZ5Zmw0cEZFNjB6ajR1M1dHcDduZTl2?=
 =?utf-8?B?Wkc1NDVLaTNyeVFKNElGSmxWQWhpRFlaNkFkNG1UVjlsaklRM216Z1I5USt5?=
 =?utf-8?B?MmdNRzJZWHA0WXdCRVd1dzhjMFJMVUdvMzI5TFc2VEthblp6WWxwS1Z5TTZE?=
 =?utf-8?B?NHQ4NFZENXBrZ056TEN3Z25CYzNVREVrdzJYR2I0K2RZMjlEWkoxa0VYV09s?=
 =?utf-8?B?aXhJbnMrbVpMTGV6eVNDVXhHd0xiN2hxY1ZNcmNJazQrc3daMWVLSVlxU0Z1?=
 =?utf-8?B?ZWdab1V2VnIwc1lWQjNZU2VCc0hHcTJvc1h1OHFPNkJQYThZTk0wY3I5TU9X?=
 =?utf-8?B?ZFgzQUR1VE1QVnBDdTQ4NTVqV0lPb3BXMjBSY1hkdzV0Y2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2xIUVN3cXJoN2EwV0h2Z0J6Q0RRZkpCMWM0UVpJU0RuZUxYS2hDZC9LcWQr?=
 =?utf-8?B?QkwrNjlqbWUzVWVXU01KdGc1ODFQUHpTSC9YUFdrNEZhZHFLOG91YytFRFRl?=
 =?utf-8?B?YXZzOTBVUTVwOVNFdGliSWNvUnJWRWNYZ3ZHS1BqaWdwREpIVm5qR2h6V0pz?=
 =?utf-8?B?S05mWkRtUG9GM0NiVU1VQjc5cUJDMXdSaG9JVk5wcFkxblp6ZERKdjZDaWQ0?=
 =?utf-8?B?UkR6ekFNRmp4T1ZFMC84Qi9DQlJTYUR3YmFReWRTOXd6NURnZUcrNkhyTXBn?=
 =?utf-8?B?aXJsRmV0cUQyK2ppRFVwSDJ1Z1pmNUJvQU5yWUY5TzRnbUJNcGF5cXFNcEtz?=
 =?utf-8?B?ZjZVODJTV1htVHQ0cUNZL0VweXc0SXVzSGFmY0g2OXV0QjNmcWVGVmtVcmJm?=
 =?utf-8?B?MWpUTW4rQm9qUWNoenZ0dDZBeHlNTDcwVnBqZStESDNORkthZ2IrYWtCYSsw?=
 =?utf-8?B?K0pLeTNiNDk5d3gzdUVwRURNd3A5dXlPejRLeUlBczErcVg0Sit6ci9CTmM0?=
 =?utf-8?B?ZmdUL2FqMnFiUlVab2VyNXRTRkJtK3N0N1VVZ3VYSm5Qc1k4NHpQdXNPc1Fn?=
 =?utf-8?B?d0RJQnZJdStxMktCemVxeS8wNkt5eUFjUlVyT3FPdDhjYW5zNFZXTGhEMkJn?=
 =?utf-8?B?OXQxQjBxb3A4Y1hiL0hPT0VXc2xLdXo1VjljMXhxaUhXNm5Ib2VNSWRscXpv?=
 =?utf-8?B?M0Q1NWp2OUViVVVtZDdFdUtpeXgrd1grTEdtR0NpREUyc0tkMzlnc1NVQ2dz?=
 =?utf-8?B?ODJWUnBXeE1tNThLLzY4dHlteXFSSWVRNHhDWWI2UHFoeThmMFpZK2E4Szg4?=
 =?utf-8?B?U1F3SXB4UjNrMm83WTBuei9peFUyVW9NZkd1RXNmN0J3MFRHenNpb2VDVisy?=
 =?utf-8?B?M3hyK0hBdGZpMk5qbVFJUE8vbkNoRlUwVDdJQzJSV0wxdlEwcjhTZVRpRFdl?=
 =?utf-8?B?TG1vOXdnVzFiQTJody9pME9VUlRCclYwODRxUXNDdDJoai9iRmc4a08zYVlR?=
 =?utf-8?B?czhiNElJQllyQjdrNHlwejdMTE9uWXFUU0NOTTFiV3VFZTNzcTkyZGJXT3cx?=
 =?utf-8?B?WWFoem42N3ROY1NRbG42MkZZVEFvMTVPRGJTeVNReTNFVUp1VkxiTWF5N1J0?=
 =?utf-8?B?bUVhY2JwQmtwTWlYL2JMcnpiQjQwYW5jVk9YUGF1OTdSb0hDem1rTEFlei9a?=
 =?utf-8?B?YVVFb3JXd1hwR3E4cGNwMUJPOHRiNGcxTHUvdnFYUlhyaTRDZFk5Nlk0TElG?=
 =?utf-8?B?Z1EwSnYyTEZWQmNKaUFnWHNpU3QwdkVyQk5DdFRBZ1FZTXdsNStIRjc2aW9q?=
 =?utf-8?B?ZUpaQWpzRE1HZHRSTzN4MjE1T0VVanljWXFEZ1poUkFwTHZ6QXdvYkdqMjF3?=
 =?utf-8?B?TjUxOC9aSEF1eVVFYytPT3Y3b2w2WEhkZ1NpVS94VnVNT1FPTENCOE5IWjRi?=
 =?utf-8?B?THdvc0JiWjNYMzRMNWNGTGFJY2pzTXBCU2hlQ1FvQVJSdm5zZHlDYnBXN3hy?=
 =?utf-8?B?b0hzRnVBSkR5YThaRDgzVUNyaU0rTWloYitISDRqWHRrUDVBNWJqa1BRQUtS?=
 =?utf-8?B?TS91WFIvYW1jSWh2Y2xTaEZldDZxSnJ0QXBxMWFKelpPK3FibnpBcFNkSFpa?=
 =?utf-8?B?cCtvUUcwRUtwdHh5S0cxZVV5ZVluQTgzSkMxV3FLT3U3OFNMQUE4dmxkak1X?=
 =?utf-8?B?N20yczFRTXdEZE1IU1ZWbGNGeDZyRzc0Q2V2NWozZzJwYXkrK041am80Vit1?=
 =?utf-8?B?eEF5elo1TllSOGpGKzZWRW81ZVp2eGZveHNGd0Fqc1RDdUZVY2ZWRk8yNGFk?=
 =?utf-8?B?VWRqZ1NGT0xXdnpQV3R3VXFRM1dQaHNkVXRoMnI0SDd3MDZKbHRqdjBXSUNY?=
 =?utf-8?B?SlNFTEVpeUpvK3hzazV3V3lMdnFQaDNjN1o2d1hxWmpFS2ZjUUswZ29jRTk3?=
 =?utf-8?B?VWs4OXQrYWNTdExYNkFkdnVRbWxoWW8wUGdFVFlRUUJyZmg5NVVDMkZ4VWNQ?=
 =?utf-8?B?NTJhRDJ6czlPTlJwVzNWSVJ4TWEwL2NOWFFvYTZUQUVrZkpLVmN5WWVPZTlW?=
 =?utf-8?B?SzdVU2gwN2RPM3orTEdiYU0zMmtVbHVHMWIrVm1kRWZJZGo0RFNJSU5wZTdX?=
 =?utf-8?Q?RQRuqGrDg9C4CfkSeZMXZ2HsS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd339646-bb47-4e4c-3d48-08dcb85ea099
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 10:32:54.0269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxkMg+kOoAQ6ttrtFyjwCJyCcR0YEiaoW0ck+yej6rE93cxUT/84Ymo9J4D7BsQuUN09MQUdHOqP3ukvV7UL+XAiIOQBV2fPMlcSeZLvdeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAy
OjUyIFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47
IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMNCj4gPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRybS94ZTog
SW5pdCBNQ1IgYmVmb3JlIGFueSBtY3IgcmVnaXN0ZXIgcmVhZA0KPiANCj4gT24gMDkvMDgvMjAy
NCAxMDoxMSwgVXBhZGh5YXksIFRlamFzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAyOjI1IFBNDQo+
ID4+IFRvOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgVXBh
ZGh5YXksIFRlamFzDQo+ID4+IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMNCj4gPj4gPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRy
bS94ZTogSW5pdCBNQ1IgYmVmb3JlIGFueSBtY3IgcmVnaXN0ZXINCj4gPj4gcmVhZA0KPiA+Pg0K
PiA+PiBPbiAwOC8wOC8yMDI0IDIwOjUxLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+Pj4gT24gVGh1
LCBBdWcgMDgsIDIwMjQgYXQgMDI6NTg6MjVQTSArMDUzMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6
DQo+ID4+Pj4gZW5hYmxlIGhvc3QgbDIgVlJBTSBpcyBleGFtcGxlIHdoZXJlIE1DUiByZWdpc3Rl
ciBpcyBnZXR0aW5nIHJlYWQNCj4gPj4+PiBiZWZvcmUgZnVsbHkgTUNSIGluaXQgaXMgZG9uZS4g
TGV0cyBtb3ZlDQo+ID4+Pg0KPiA+Pj4gImlzIGV4YW1wbGUiIG1ha2VzIGl0IHNvdW5kIGxpa2Ug
dGhpcyBpcyBqdXN0IG9uZSBvZiBtdWx0aXBsZSBwbGFjZXMNCj4gPj4+IHdoZXJlIHdlJ3JlIGlu
Y29ycmVjdGx5IHVzaW5nIE1DUiByZWdpc3RlcnMgYmVmb3JlIE1DUiBoYW5kbGluZyBpcw0KPiA+
Pj4gaW5pdGlhbGl6ZWQuICBJZiB0aGVyZSBhcmUgaW5kZWVkIG90aGVyIGNhc2VzLCB0aGVuIEkn
ZCBleHBlY3QgdG8NCj4gPj4+IHNlZSBtb3JlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgbWFraW5n
IG90aGVyIGNoYW5nZXMgYXMgd2VsbC4NCj4gPj4+DQo+ID4+PiBBbHNvLCB0aGUgdGl0bGUgc2Vl
bXMgc2xpZ2h0bHkgbWlzbGVhZGluZyBhcyB3ZWxsOyBpdCBtYWtlcyBpdCBzb3VuZA0KPiA+Pj4g
bGlrZSB3ZSdyZSBjaGFuZ2luZyB3aGVyZSB3ZSBkbyB0aGUgTUNSIGluaXQgKHdoaWNoIHdvdWxk
IHJ1biBpbnRvDQo+ID4+PiBvdGhlciBjaGlja2VuLWFuZC1lZ2cgcHJvYmxlbXMgd2l0aCB0b3Bv
bG9neSBhbmQgR3VDIGluaXQpLCBidXQgaW4NCj4gPj4+IHJlYWxpdHkgd2UncmUganVzdCBtb3Zp
bmcgdGhlIEwyIHRoaW5nIGZvciBXYV8xNjAyMzU4ODM0MCBhIGJpdA0KPiA+Pj4gbGF0ZXIgaW4g
dGhlIGluaXQgcHJvY2Vzcywgc28gaXQgbWlnaHQgYmUgYmVzdCB0byBmb2N1cyB0aGUgd29yZGlu
ZyBvbiB0aGF0Lg0KPiA+Pj4NCj4gPj4+ICAgRnJvbSBhIHF1aWNrIHNraW0gb2YgV2FfMTYwMjM1
ODgzNDAgaXQganVzdCBzYXlzIHRoYXQgd2UgbmVlZCB0bw0KPiA+Pj4gZG8gdGhpcyBhcyBwYXJ0
IG9mIGluaXRpYWxpemF0aW9uIChhbmQgR1QgcmVzZXQpIHdpdGhvdXQgcmVhbGx5DQo+ID4+PiBz
cGVjaWZ5aW5nIGFueSBzcGVjaWZpYyBvcmRlcmluZyB3aXRoIHJlc3BlY3QgdG8gb3RoZXINCj4g
Pj4+IGluaXRpYWxpemF0aW9uIHRhc2tzLiAgSWYgSSByZW1lbWJlciB0aGlzIHdvcmthcm91bmQg
Y29ycmVjdGx5IGl0J3MNCj4gPj4+IHByb2JhYmx5IHNvbWV0aGluZyB0aGF0IHdlIHdhbnQgdG8g
ZG8gYmVmb3JlIHdlIHN0YXJ0IGhhdmluZyBhIGJ1bmNoDQo+ID4+PiBvZiBDUFUgd3JpdGVzIHRv
IHRoZSBMTUVNQkFSLiAgSSB0aGluayB0aGVyZSBhcmUgc29tZSBDUFUgLT4gVlJBTQ0KPiA+Pj4g
d3JpdGVzIGR1cmluZyBHdUMgaW5pdGlhbGl6YXRpb24gKGUuZy4sIHRoZSBHdUMgQURTKSwgYnV0
IG1heWJlIG5vdA0KPiA+Pj4gZW5vdWdoIHRvIHJlcXVpcmUgZG9pbmcgdGhpcyB3b3JrYXJvdW5k
IGVhcmxpZXI7IHdlIHNob3VsZCBwcm9iYWJseQ0KPiA+Pj4gdGVzdCB0aGlzIGNhcmVmdWxseSBh
bmQvb3IgZG91YmxlIGNoZWNrIHdpdGggdGhlIGFyY2hpdGVjdHMgb24NCj4gPj4+IHdoZXRoZXIg
dGhleSB0aGluayB0aGlzIHdvdWxkIGJlIGEgY29uY2Vybi4gIEkga25vdyB0aGUgcmVhbGx5IGhl
YXZ5DQo+ID4+PiBDUFUgLT4gTE1FTUJBUiB0cmFmZmljIHdvdWxkIHByb2JhYmx5IGNvbWUgbGF0
ZXIgb25jZSB3ZSBpbml0aWFsaXplDQo+ID4+PiBkaXNwbGF5IGFuZCB0aGUgZmJjb24gc3RhcnRz
IHdyaXRpbmcgdG8gdGhlIGZiZGV2IGZyYW1lYnVmZmVyLCBzbw0KPiA+Pj4gdGhlIG5ldyBwbGFj
ZW1lbnQgaXMgc3RpbGwgZWFybHkgZW5vdWdoIHRvIGF2b2lkIHRob3NlIGF0IGxlYXN0Lg0KPiA+
Pg0KPiA+PiBZZWFoLCBpdCBzZWVtZWQgcmVhc29uYWJsZSB0byBlbmFibGUgdGhlIGhvc3QgbDIg
Y2FjaGluZyBiZWZvcmUgd2UNCj4gPj4gc3RhcnRlZCB0b3VjaGluZyB2cmFtIGZyb20gdGhlIGhv
c3QuIEkgZG9uJ3QgcmVjYWxsIGlmIGl0IHdhcyB0aGlzDQo+ID4+IHZlcnNpb24gb2YgdGhlIFdB
IG9yIHRoZSBvbmUgdGhhdCBkaWQgdGhlIHRpbWVyIHJlZyB3cml0ZSB0aGluZywgYnV0DQo+ID4+
IEkgZG8gc2VlbSB0byByZW1lbWJlciB0aGUgcGxhY2VtZW50IGJlaW5nIHNlbnNpdGl2ZSBldmVu
IGR1cmluZw0KPiA+PiBtb2R1bGUgbG9hZCAoSUlSQyBndF9pbml0IHZzIGd0X2luaXRfZWFybHkp
LCB3aGVyZSBpZiBkb25lIHRvbyBsYXRlDQo+ID4+IChndF9pbml0KSB5b3Ugd291bGQgc29tZXRp
bWVzIHN0aWxsIGdldCB0aGUgaXNzdWUgd2l0aCB0aGUgcmVnaXN0ZXINCj4gPj4gcmVhZCB0aW1p
bmcgb3V0IGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlci4gQnV0IGluIHhlX2d0X2luaXRfaHdjb25m
aWcNCj4gcGVyaGFwcyBub3QgYW4gaXNzdWUsIHNpbmNlIGl0IGlzIHN0aWxsIHF1aXRlIGVhcmx5
Lg0KPiA+DQo+ID4gU2hvdWxkIHdlIGdldCB0aGlzIGV4dGVuc2l2ZWx5IHRlc3RlZCBvbiBCTUcg
YnkgdmFsaWRhdGlvbiBiZWZvcmUgZ29pbmcNCj4gYWhlYWQ/DQo+IA0KPiBNYXliZSBqdXN0IHJl
cGVhdGVkIG1vZHVsZSBsb2FkL3VubG9hZCBhIGh1bmRyZWQgdGltZXMgb3Igc28gaW4gYSBsb29w
IG9uDQo+IEJNRz8NCg0KWWVzIHRoYXQgaXMgZ29vZCBpZGVhLiBJIHdpbGwgdGVzdCBhbmQgcmVw
b3J0Lg0KDQpUaGFua3MsDQpUZWphcw0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBUZWphcw0K
PiA+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBNYXR0DQo+ID4+Pg0KPiA+Pj4+IGVuYWJsZSBob3N0
IGwyIFZSQU0gYWZ0ZXIgTUNSIGluaXQuDQo+ID4+Pj4NCj4gPj4+PiBWMShMdWNhcyk6DQo+ID4+
Pj4gICAgLSBSZW9yZGVyIHBhdGNoIGFuZCByZW9yZGVyIGZsb3cgb2YgTDIgVlJBTSBlbmFibGUN
Cj4gPj4+Pg0KPiA+Pj4+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVs
LmNvbT4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5
YXlAaW50ZWwuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndC5jIHwgMiArLQ0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5jDQo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBpbmRleCA1
ODg5NWVkMjJmNmUuLjIzOGM3ZDEwNTNmMA0KPiA+Pj4+IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0LmMNCj4gPj4+PiBAQCAtNTU3LDcgKzU1Nyw2IEBAIGludCB4ZV9ndF9pbml0X2h3Y29u
ZmlnKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4+Pj4NCj4gPj4+PiAgICAJeGVfZ3RfbWNyX2luaXRf
ZWFybHkoZ3QpOw0KPiA+Pj4+ICAgIAl4ZV9wYXRfaW5pdChndCk7DQo+ID4+Pj4gLQl4ZV9ndF9l
bmFibGVfaG9zdF9sMl92cmFtKGd0KTsNCj4gPj4+Pg0KPiA+Pj4+ICAgIAllcnIgPSB4ZV91Y19p
bml0KCZndC0+dWMpOw0KPiA+Pj4+ICAgIAlpZiAoZXJyKQ0KPiA+Pj4+IEBAIC01NjksNiArNTY4
LDcgQEAgaW50IHhlX2d0X2luaXRfaHdjb25maWcoc3RydWN0IHhlX2d0ICpndCkNCj4gPj4+Pg0K
PiA+Pj4+ICAgIAl4ZV9ndF90b3BvbG9neV9pbml0KGd0KTsNCj4gPj4+PiAgICAJeGVfZ3RfbWNy
X2luaXQoZ3QpOw0KPiA+Pj4+ICsJeGVfZ3RfZW5hYmxlX2hvc3RfbDJfdnJhbShndCk7DQo+ID4+
Pj4NCj4gPj4+PiAgICBvdXRfZnc6DQo+ID4+Pj4gICAgCXhlX2ZvcmNlX3dha2VfcHV0KGd0X3Rv
X2Z3KGd0KSwgWEVfRldfR1QpOw0KPiA+Pj4+IC0tDQo+ID4+Pj4gMi4yNS4xDQo+ID4+Pj4NCj4g
Pj4+DQo=
