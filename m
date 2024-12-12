Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 17:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D403110E2EB;
	Thu, 12 Dec 2024 17:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnSAeNBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02810E2EB
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734025327; x=1765561327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3VkK2r5ZXMwP3nFcX2Nhkv05ynTl/8qXNouW3K2NbkQ=;
 b=jnSAeNBceQu+CblM/1yfvVlyGbEDUq41BeTULGk5e5gN46sVEce7KunC
 Dr7UlneJtLJnKFWs1xbsOoWiKYFXp9rLWDEcnCWdr6QaFZkrlVeHrojxP
 Pf1CGlnR+jhIVQm7n6bNzVAzoAq056W8nxm7NPx8HIs0/mozF5BgLZZxf
 kAENwWqYzkDODxbH2fhVpW8xMrOjNox6+piyheXXLyrXlMLQHemmTVRjB
 jGg0DNZh+4aKqK2zChzbMDdS9otKM9LtowppaWs6XjY4ICADJA7HetWCq
 1aDqCHa4R0S5fKpdnSFquBbxrfy/0tiN/raply1Vwd6kzPhWtnVb0wWsF g==;
X-CSE-ConnectionGUID: 07hRS4DmSu+PtS+AAuB4Cg==
X-CSE-MsgGUID: ghqmNn7tRaeZRYk/6ogJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34332123"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34332123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:42:06 -0800
X-CSE-ConnectionGUID: 2Vimcz5rS/mq4e2GLFnEFg==
X-CSE-MsgGUID: 38X9lCPETyufROQFfUxrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119544130"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 09:42:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 09:42:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 09:42:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 09:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsvybeQBYlDmW1KCQgPDPRpwP8PxaOJi+az2XwLD9THMhxRI/Yj8y22wRw2g+h/GCdlQ9OfQcnL/McF6as4vrQY4SYTGYizLc4KbKGajUoKnTmzXo7cT/qvpDWsCclvHSWff82NskUFu4wrU8p57c+m/xGX0XUWBvM3tCXW7odVTI8Tp9mfHOFBquhPDqGM/lp0ajxM/IhuwVcWvN7FQGoargCHWbY2/uJfQRDqHQue0Yoqu3oBWr2UZKncYKBzN3CO9jv+2P8lM8Kmf/kqYqhaxvsyUwYuzeW9rOz5+4JxNjHk8riAtkqJEC6N4p30UqRvkH+8sWZBDaDbdzYD26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VkK2r5ZXMwP3nFcX2Nhkv05ynTl/8qXNouW3K2NbkQ=;
 b=nHszIQZbJbFt6BzNegW9VzS6ZDhx2bH5KR5Eaki7K4B+BMWibXnXj3qfS7BuE11KThZdsECQxgTYFHdhgJL90mziZU8uYpgGIfsKF/eCYSVD88SUepcwaRwYI6CHbrAIU8P3yY8yhpey1VWigNKkNVm50+NVN1FRSsaUfQOPACbAUSMUjyQBf1cTzPGsj5uy99e87czj0+F8pDV0n77iCpProfQcffxUbIMaJtCntuzAvFjxvU8t7VgsnwenC5ioCAfaBOGIamZCXEAbGqrE+K7WoEDaRWnYZTk+7priSH4ysV3h4pThGVhm2HRJhWHXAdWn6fIu7iLH9ExpaxbFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 17:41:41 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 17:41:41 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Thread-Topic: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Thread-Index: AQHbFS2xgmNVJ9Bv002u+5o0Q4TVW7LjT9UA
Date: Thu, 12 Dec 2024 17:41:41 +0000
Message-ID: <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
In-Reply-To: <20241003004611.2323493-5-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: 4e75f98d-8331-49ae-55f7-08dd1ad43d0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGYyK1dBQkdYcFltdFFWT21lOTNVUForVTFzT2FSRW9MekFvSm9pSFFEYWVM?=
 =?utf-8?B?R0pwYndvd0RTRlJvSFFsTkhFVnBDdjlYNUpzZHVSTEd6RWhGQUlVM0lZcVg2?=
 =?utf-8?B?clMrZS9hNVJKUWVyMEFYNFA2OWozZ3dTUUIzdE9OL3BtWmxwdXcxSjNGaTJs?=
 =?utf-8?B?YXYrTHRHS0VkSDhvLzRSK0lCOTNKNXpGQW1NRTRobXA5QTVLck1tWnpwbTFD?=
 =?utf-8?B?SjBvekhGN1RwSkZ6NmgwZkp4bkdWOGRwRytrZ1k3UFl1OWRidFN3VEVHUVN6?=
 =?utf-8?B?S1VseFZzeEk5Z2hLcFBJZEx1RnEycVBVTUVkdVVicExpdlA5NHMwcEI3dkV4?=
 =?utf-8?B?cmwxQlgrcUtpWWJSUWREUmtkdDMzRFdmVGFZUmRzN2xYT3R2WWdzUGFFNllI?=
 =?utf-8?B?TmRRakR2L2IyTWRFd0JxNHgyK2h6VGp2aGZod2xqcFA0RW1RbkhRcXJMNWVv?=
 =?utf-8?B?c1hXN1JPK2pCdEUzVkdyYWFWWUxJcy85TVFoUVN6SW15NnB1TmtoY2JaYzNq?=
 =?utf-8?B?a3ZzZUZrU0k5RnQveDdGZ2FBYWZVOXlUT3oyQ2Rra0crTTNSaFBTUm53Nkxa?=
 =?utf-8?B?Z2pXbjYzTDE4MUMwV2JJYmsvRGhvT1ZEV0E3cGpiMHVKVysyM2k3b2syanVY?=
 =?utf-8?B?ZEUwcWYwcnh2K3FNUHl2N1lpendGcmxPRUplUHFwOG5LUi93WWgyYjFuRG9M?=
 =?utf-8?B?S093elNUUHRweHZtTDhwaGRoc0tvZjA3aDhVMm84aGVGZGRIQ2tScVdaazVN?=
 =?utf-8?B?TVhxV1lMQTcvTGpQWE00aFlPVzF3eDg2Z1JPTEgxUGdjUDRJOGV6R21iS1Zs?=
 =?utf-8?B?NXp3NThXYVZVWUVzdUNDNGVIQWFHYWRvQlJ2VlVqWXY5dmJGcDNJZG8yQ001?=
 =?utf-8?B?RnFlTWpkRThBZHkrNmc1cFJOS2hrSUR6aHhGVkppZUpHbU0vZTduZGtWWUVQ?=
 =?utf-8?B?NnBqelMwMlVva3NSd1llTWUzL3BwK0hUOC9rcGJnWHRwT2NWT2NqOFJQei9R?=
 =?utf-8?B?RFdsQTZqUlNibWhqbHVWYjlINFFEdi9KamtJV0NrUXNnYUlwcVBlZ3U1Umhs?=
 =?utf-8?B?cm5POGJzWVlFNzBqVTZXVStZU1NNNjRMbzRKRjNjMm9FU0E4aGphbFAxWFdN?=
 =?utf-8?B?Uzh3OFQxUjhwOWwxZGNqbFpHWXJLblI1eGlEU1c1K3IydldQRG1PWFQ0ZFVJ?=
 =?utf-8?B?SUNQZC9oaDRoTGhCZStDSnlqUzVKZFNpcWhpK2hkdWJWT2xmdVJqejN1bTkz?=
 =?utf-8?B?TzhlMVFlcjJScE9XTHRKMEpJMW1LaEdqaFJ4L3hmbzdWRngvMTliWEc4OEFF?=
 =?utf-8?B?bjMzdFNhU3RURk5GMk5lN1BtU1AyTDQ1YVMvWGRtUXBiQ1ZVa2JWdCtjUkRI?=
 =?utf-8?B?WnYxSlQwTTEzL01nWXNOVXQ4azdwcE13TmVYaUhlcUNLR2pqMnVNZk85dTRT?=
 =?utf-8?B?MnJQZDNuN0NLTWlidHl5MmdqcUNBc1RsWjluTVo5R2l5Und1bjhzeThCSER1?=
 =?utf-8?B?dm40NmEzUGdMbjgvd1N4S3Vwc0paRElsNHd2SkNUWkNFMFZscFptY01LVGFQ?=
 =?utf-8?B?NW1KQjlFc1NHVEhtMWs3MThzRmxodnpKT0lGWndBVWpvMW9Hd3BZOXNhR1hl?=
 =?utf-8?B?eU1YNFdhT01wMEg0S1NtM3VHcVBRZVcxakxQU3g3ckorakJOWm1JSGs2MFJF?=
 =?utf-8?B?VjFCUW5EVlV5dTZVT2dwTXBJeEl1SkxTRytiY2g1dzIvR252U1RXRkF6Q1gv?=
 =?utf-8?B?V1VRWHVHOXB3RXVVVUh0Qnk2MGJ2blhRUmZWNUhZN3AzazZsRkMrNXZpYllm?=
 =?utf-8?B?V1gvVjE0S2E1MWZSVkt5VW00TGNPUWlJYURxc01tYjdCUTMzNUpQY3FkV3VB?=
 =?utf-8?B?Wkh0TjZPbHA5MDNwcGtRRTdKZlkvL3pUbE9YSUppYWVPZkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3BkMW9EY2RPdGRlSUdoaHhWNVZFYld4SDJlM2FFVGJ0cC92c3EzU0VudHNW?=
 =?utf-8?B?K3JycTNZdGRFT2FWRzVqNDZMcDU4L3pLZ1BMNTNiM1ZLblM5RlY0MVNma0RO?=
 =?utf-8?B?MXM5TjdFYjhSVjVPR3g5b0ltd0xUZU5jVHpnV0xDTjhZTjBTZWhLU21ML1JF?=
 =?utf-8?B?ai9GK0Jtc0I1NDgxQ2J5OE12NVp6Mk9UOC9rNU9SVmtHMFNxZlVvdS8zVmw5?=
 =?utf-8?B?cFU4RFNYWVo3NVRxaGt6YmpJTll5WW5jeXByRy8ybFlyelNVd0ViZUYyQ0l0?=
 =?utf-8?B?SVNCTEpaQWkzSlpRcUJaK1NFaGhPNlo2cEdIdk5QeUNhWmpYN2FHbFp2aEFI?=
 =?utf-8?B?WEVBUXdxUGxUQ3BhOWdmV1licVRxT0REU2s1NDNKY0ZBU05oOTNkUlp6ZGMr?=
 =?utf-8?B?SDZkajhrSmhyS2ZZVVNqek1jck1ESUpLMXBTMUtsR1JGenZidHpOd0dJY3Jm?=
 =?utf-8?B?eTRVNGtKNEUzVm8ya01HSXVDTDREbDJQYjU1OTNzcXMrRTdIaHhWNHpJV0Jj?=
 =?utf-8?B?b3ZLZFBJbUhkVXdlOXdpRDA0Y0FIZUtBNlJwTkxZTXVjR0ZuMk83V1JsbGNF?=
 =?utf-8?B?T2Z6Mkp6SENNRjVBSjJWbnRsOXRPWmU3ZEJ3RjY3TXhiaFMvR0dhV3YrZ3Z0?=
 =?utf-8?B?WXNwN2pvSDFkMm1BNkRNTjZrSEkzSEk1eDF4bTlCUXRJMUZMWmVpQ1d3SW5o?=
 =?utf-8?B?MkkyYXd0cWVzQWdxaEZqUXdnVmV0dkQvOW11QkJJZnRIajAvM0pvb3E2d2NB?=
 =?utf-8?B?Q2N3YktHSzlxWFJlTlVVMFZZRkJFREs3eFkyVVdKWitUR3diVUtob3kzeHR6?=
 =?utf-8?B?NzVpVVZDdDhudmxmTHJpcUhRWjk1T0NMZTNWdHhTWGlYWU9sZ0dVM1pUNysy?=
 =?utf-8?B?d2RIcnkzeEJVMWlQNC84YkxIVGZDTzZnU3UyTUpOYTRlQlVlSmNsUHdBS25N?=
 =?utf-8?B?OFF6MGV4eUc0SGZRVjExN0laRkxydGFHc3lvMm9xUFZqS1FUdTIvUjRsZ1Ix?=
 =?utf-8?B?eEprbCtYTEZZWjFYMGNlaUl5S3lJUG1kZER2Vjl4VDBrMGRMczd3MUQyUkg3?=
 =?utf-8?B?QWV2bm1ENFc1aEZYc3dTOFR5R2tLVDgvNW0wZERpajBhZWZtbldYYk1RS05s?=
 =?utf-8?B?a01tUDQ2WXI0Nm8wTzNSM3RkUHVKWHc1QUtMZ2hxZXdPWWNZVFhWTjRmTjdU?=
 =?utf-8?B?RmIxVFhsWW5CVHMzNFo0Z2xrbldoWXV5QTRXcnZPTExYMmZqdm05TVFHRnp6?=
 =?utf-8?B?c3ZPY1FXSjVPSjU2MTUveElZREVxdE5ucDhsVm9DT1hWSTRXTVNHeWxmenE2?=
 =?utf-8?B?WHdQdjY1dUppTDhnVG5kYmg5aFhXMExvZ2lneDFLY1g4NGVZTFFLNFhGbGY5?=
 =?utf-8?B?R2hkQkxkUlJyUXY4VEJEcFM1MTdXSXN1TjF2bHBiNkNoNzhRRkY1OER0WHhr?=
 =?utf-8?B?WjQyaEVPc2gwSXArQTdOMTIweEpLK0czTDBBTGlCakk5TGR4RXJSdlg0aFVV?=
 =?utf-8?B?SjFsZHpPSmtadUp0Mkc3UlVDejVLcHRxN1dGNU13RjE4TmF1UlhDWUtWYWg1?=
 =?utf-8?B?TVY1VnJwMHh4aXVabDZMajUrelp3Q2ErZEg1TVR3c0U1MWRneU0wQ2paaWlu?=
 =?utf-8?B?aGU3TnIzbnJjUUJ4VUo1R3hQSHFJUUYxUGRJUTlobGxGcXQ5WFNqeG1sZk9k?=
 =?utf-8?B?QjJPU2lxTjJOUU9hbm5aOEMrYmxoME9vMVFtWk8yVW5ORUN2cHNRTThOOWhU?=
 =?utf-8?B?WmR3VW1BNmwyenhQT3g3SVFNZXVKeTlXMEdKb3VCZFFpYnhPRXZNcVFUYXo5?=
 =?utf-8?B?OVhHVTJnZ3dvZFFvdlg0aVZVWVV6MTREQ0ttNlR4ZXhkaFQ3RmhvNlNzdFUr?=
 =?utf-8?B?Sndqa3BsRFJZT3F3ZGFWMG51NFZrOGlSUUloTm1kdEhocCt4NWErcExXNk9Y?=
 =?utf-8?B?aHNtamlGK1BueDRQT1Y3WTg0dzdRbG5TWFpoU2k5VnBENUcyVXlLVGtmL0pF?=
 =?utf-8?B?TDNVeXFMa0t6TFQ2WWd0YTAyaE01ZzlDdFNUbHJ3Mk9yTS9naVNkWVIwaTN5?=
 =?utf-8?B?NEczQnlmdnNKMWtuaCtmVS9VREpoS3dWTERxdTV5WmdSOThUQXArcUxIZW10?=
 =?utf-8?Q?Gk8veCxxbg85M4ZzKGy9tlNW0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AE591E1140EF94EA8FD6AD4CBE7FB5D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e75f98d-8331-49ae-55f7-08dd1ad43d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 17:41:41.5578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCmzGGDXQccsF10rmd6s/CIw40zSlcYEkl2rc/6T1Sicb6o5oEDKehi5OVD7yQEUMCggqSZFUaDOovcjsCb4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

T24gV2VkLCAyMDI0LTEwLTAyIGF0IDE3OjQ2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlcmUgaXMgYSBuZWVkIHRvIGluY2x1ZGUgdGhlIEd1QyBsb2cgYW5kIG90
aGVyIGxhcmdlIGJpbmFyeSBvYmplY3RzDQo+IGluIGNvcmUgZHVtcHMgYW5kIHZpYSBkbWVzZy4g
U28gYWRkIGEgaGVscGVyIGZvciBkdW1waW5nIHRvIGEgcHJpbnRlcg0KPiBmdW5jdGlvbiB2aWEg
Y29udmVyc2lvbiB0byBBU0NJSTg1IGVuY29kaW5nLg0KPiANCj4gQW5vdGhlciBpc3N1ZSB3aXRo
IGR1bXBpbmcgc3VjaCBhIGxhcmdlIGJ1ZmZlciBpcyB0aGF0IGl0IGNhbiBiZSBzbG93LA0KPiBl
c3BlY2lhbGx5IGlmIGR1bXBpbmcgdG8gZG1lc2cgb3ZlciBhIHNlcmlhbCBwb3J0LiBTbyBhZGQg
YSB5aWVsZCB0bw0KPiBwcmV2ZW50IHRoZSAndGFzayBoYXMgYmVlbiBzdHVjayBmb3IgMTIwcycg
a2VybmVsIGhhbmcgY2hlY2sgZmVhdHVyZQ0KPiBmcm9tIGZpcmluZy4NCj4gDQo+IHYyOiBBZGQg
YSBwcmVmaXggdG8gdGhlIG91dHB1dCBzdHJpbmcuIEZpeCBtZW1vcnkgYWxsb2NhdGlvbiBidWcu
DQo+IHYzOiBDb3JyZWN0IGEgc3RyaW5nIHNpemUgY2FsY3VsYXRpb24gYW5kIGNsZWFuIHVwIGEg
ZGVmaW5lIChyZXZpZXcNCj4gZmVlZGJhY2sgZnJvbSBKdWxpYSBGKS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IFJldmll
d2VkLWJ5OiBKdWxpYSBGaWxpcGNodWsgPGp1bGlhLmZpbGlwY2h1a0BpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgfCA4NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
LmggfCAgNiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCAyNjkwZjFkMWNkZTQuLjA4ODRj
NDk5NDJmZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gQEAgLTYs
NiArNiw3IEBADQo+ICAjaW5jbHVkZSAieGVfZGV2Y29yZWR1bXAuaCINCj4gICNpbmNsdWRlICJ4
ZV9kZXZjb3JlZHVtcF90eXBlcy5oIg0KPiAgDQo+ICsjaW5jbHVkZSA8bGludXgvYXNjaWk4NS5o
Pg0KPiAgI2luY2x1ZGUgPGxpbnV4L2RldmNvcmVkdW1wLmg+DQo+ICAjaW5jbHVkZSA8Z2VuZXJh
dGVkL3V0c3JlbGVhc2UuaD4NCj4gIA0KPiBAQCAtMzE1LDMgKzMxNiw4OSBAQCBpbnQgeGVfZGV2
Y29yZWR1bXBfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gIH0NCj4gIA0KPiAgI2VuZGlm
DQo+ICsNCj4gKy8qKg0KPiArICogeGVfcHJpbnRfYmxvYl9hc2NpaTg1IC0gcHJpbnQgYSBCTE9C
IHRvIHNvbWUgdXNlZnVsIGxvY2F0aW9uIGluIEFTQ0lJODUNCj4gKyAqDQo+ICsgKiBUaGUgb3V0
cHV0IGlzIHNwbGl0IHRvIG11bHRpcGxlIGxpbmVzIGJlY2F1c2Ugc29tZSBwcmludCB0YXJnZXRz
LCBlLmcuIGRtZXNnDQo+ICsgKiBjYW5ub3QgaGFuZGxlIGFyYml0cmFyaWx5IGxvbmcgbGluZXMu
IE5vdGUgYWxzbyB0aGF0IHByaW50aW5nIHRvIGRtZXNnIGluDQo+ICsgKiBwaWVjZS1tZWFsIGZh
c2hpb24gaXMgbm90IHBvc3NpYmxlLCBlYWNoIHNlcGFyYXRlIGNhbGwgdG8gZHJtX3B1dHMoKSBo
YXMgYQ0KPiArICogbGluZS1mZWVkIGF1dG9tYXRpY2FsbHkgYWRkZWQhIFRoZXJlZm9yZSwgdGhl
IGVudGlyZSBvdXRwdXQgbGluZSBtdXN0IGJlDQo+ICsgKiBjb25zdHJ1Y3RlZCBpbiBhIGxvY2Fs
IGJ1ZmZlciBmaXJzdCwgdGhlbiBwcmludGVkIGluIG9uZSBhdG9taWMgb3V0cHV0IGNhbGwuDQo+
ICsgKg0KPiArICogVGhlcmUgaXMgYWxzbyBhIHNjaGVkdWxlciB5aWVsZCBjYWxsIHRvIHByZXZl
bnQgdGhlICd0YXNrIGhhcyBiZWVuIHN0dWNrIGZvcg0KPiArICogMTIwcycga2VybmVsIGhhbmcg
Y2hlY2sgZmVhdHVyZSBmcm9tIGZpcmluZyB3aGVuIHByaW50aW5nIHRvIGEgc2xvdyB0YXJnZXQN
Cj4gKyAqIHN1Y2ggYXMgZG1lc2cgb3ZlciBhIHNlcmlhbCBwb3J0Lg0KPiArICoNCj4gKyAqIFRP
RE86IEFkZCBjb21wcmVzc2lvbiBwcmlvciB0byB0aGUgQVNDSUk4NSBlbmNvZGluZyB0byBzaHJp
bmsgaHVnZSBidWZmZXJzIGRvd24uDQo+ICsgKg0KPiArICogQHA6IHRoZSBwcmludGVyIG9iamVj
dCB0byBvdXRwdXQgdG8NCj4gKyAqIEBwcmVmaXg6IG9wdGlvbmFsIHByZWZpeCB0byBhZGQgdG8g
b3V0cHV0IHN0cmluZw0KPiArICogQGJsb2I6IHRoZSBCaW5hcnkgTGFyZ2UgT0JqZWN0IHRvIGR1
bXAgb3V0DQo+ICsgKiBAb2Zmc2V0OiBvZmZzZXQgaW4gYnl0ZXMgdG8gc2tpcCBmcm9tIHRoZSBm
cm9udCBvZiB0aGUgQkxPQiwgbXVzdCBiZSBhIG11bHRpcGxlIG9mIHNpemVvZih1MzIpDQo+ICsg
KiBAc2l6ZTogdGhlIHNpemUgaW4gYnl0ZXMgb2YgdGhlIEJMT0IsIG11c3QgYmUgYSBtdWx0aXBs
ZSBvZiBzaXplb2YodTMyKQ0KPiArICovDQo+ICt2b2lkIHhlX3ByaW50X2Jsb2JfYXNjaWk4NShz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIGNvbnN0IGNoYXIgKnByZWZpeCwNCj4gKwkJCSAgIGNvbnN0
IHZvaWQgKmJsb2IsIHNpemVfdCBvZmZzZXQsIHNpemVfdCBzaXplKQ0KPiArew0KPiArCWNvbnN0
IHUzMiAqYmxvYjMyID0gKGNvbnN0IHUzMiAqKWJsb2I7DQo+ICsJY2hhciBidWZmW0FTQ0lJODVf
QlVGU1pdLCAqbGluZV9idWZmOw0KPiArCXNpemVfdCBsaW5lX3BvcyA9IDA7DQo+ICsNCj4gKyNk
ZWZpbmUgRE1FU0dfTUFYX0xJTkVfTEVOCTgwMA0KPiArI2RlZmluZSBNSU5fU1BBQ0UJCShBU0NJ
STg1X0JVRlNaICsgMikJCS8qIDg1ICsgIlxuXDAiICovDQo+ICsNCj4gKwlpZiAoc2l6ZSAmIDMp
DQo+ICsJCWRybV9wcmludGYocCwgIlNpemUgbm90IHdvcmQgYWxpZ25lZDogJXp1Iiwgc2l6ZSk7
DQo+ICsJaWYgKG9mZnNldCAmIDMpDQo+ICsJCWRybV9wcmludGYocCwgIk9mZnNldCBub3Qgd29y
ZCBhbGlnbmVkOiAlenUiLCBzaXplKTsNCj4gKw0KPiArCWxpbmVfYnVmZiA9IGt6YWxsb2MoRE1F
U0dfTUFYX0xJTkVfTEVOLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoSVNfRVJSX09SX05VTEwobGlu
ZV9idWZmKSkgew0KPiArCQlkcm1fcHJpbnRmKHAsICJGYWlsZWQgdG8gYWxsb2NhdGUgbGluZSBi
dWZmZXI6ICVwZSIsIGxpbmVfYnVmZik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwli
bG9iMzIgKz0gb2Zmc2V0IC8gc2l6ZW9mKCpibG9iMzIpOw0KPiArCXNpemUgLz0gc2l6ZW9mKCpi
bG9iMzIpOw0KPiArDQo+ICsJaWYgKHByZWZpeCkgew0KPiArCQlzdHJzY3B5KGxpbmVfYnVmZiwg
cHJlZml4LCBETUVTR19NQVhfTElORV9MRU4gLSBNSU5fU1BBQ0UgLSAyKTsNCj4gKwkJbGluZV9w
b3MgPSBzdHJsZW4obGluZV9idWZmKTsNCj4gKw0KPiArCQlsaW5lX2J1ZmZbbGluZV9wb3MrK10g
PSAnOic7DQo+ICsJCWxpbmVfYnVmZltsaW5lX3BvcysrXSA9ICcgJzsNCj4gKwl9DQo+ICsNCj4g
Kwl3aGlsZSAoc2l6ZS0tKSB7DQo+ICsJCXUzMiB2YWwgPSAqKGJsb2IzMisrKTsNCj4gKw0KPiAr
CQlzdHJzY3B5KGxpbmVfYnVmZiArIGxpbmVfcG9zLCBhc2NpaTg1X2VuY29kZSh2YWwsIGJ1ZmYp
LA0KPiArCQkJRE1FU0dfTUFYX0xJTkVfTEVOIC0gbGluZV9wb3MpOw0KPiArCQlsaW5lX3BvcyAr
PSBzdHJsZW4obGluZV9idWZmICsgbGluZV9wb3MpOw0KPiArDQo+ICsJCWlmICgobGluZV9wb3Mg
KyBNSU5fU1BBQ0UpID49IERNRVNHX01BWF9MSU5FX0xFTikgew0KPiArCQkJbGluZV9idWZmW2xp
bmVfcG9zKytdID0gJ1xuJzsNCj4gKwkJCWxpbmVfYnVmZltsaW5lX3BvcysrXSA9IDA7DQoNClRo
aXMgYnJlYWtzIGFzY2lpODUgcGFyc2VyIHRoYXQgd2UgaGFkIHVwIHRvIG5vdy4NCkFuZCBJIHRo
aW5rIHRoZXJlIGlzIG5vdCBzYWZlIHdheSB0byBwYXJzZSBpdCBub3csIGhvdyB3b3VsZCB0aGUg
cGFyc2VyIGtub3cgdGhhdCB0aGUgYmxvYiByZWFjaCB0byBlbmQ/DQoNCg0KPiArDQo+ICsJCQlk
cm1fcHV0cyhwLCBsaW5lX2J1ZmYpOw0KPiArDQo+ICsJCQlsaW5lX3BvcyA9IDA7DQo+ICsNCj4g
KwkJCS8qIFByZXZlbnQgJ3N0dWNrIHRocmVhZCcgdGltZSBvdXQgZXJyb3JzICovDQo+ICsJCQlj
b25kX3Jlc2NoZWQoKTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmIChsaW5lX3Bvcykgew0K
PiArCQlsaW5lX2J1ZmZbbGluZV9wb3MrK10gPSAnXG4nOw0KPiArCQlsaW5lX2J1ZmZbbGluZV9w
b3MrK10gPSAwOw0KPiArDQo+ICsJCWRybV9wdXRzKHAsIGxpbmVfYnVmZik7DQo+ICsJfQ0KPiAr
DQo+ICsJa2ZyZWUobGluZV9idWZmKTsNCj4gKw0KPiArI3VuZGVmIE1JTl9TUEFDRQ0KPiArI3Vu
ZGVmIERNRVNHX01BWF9MSU5FX0xFTg0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmNvcmVkdW1wLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1
bXAuaA0KPiBpbmRleCBlMmZhNjVjZTA5MzIuLmE0ZWViYzI4NWZjOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmNvcmVkdW1wLmgNCj4gQEAgLTYsNiArNiw5IEBADQo+ICAjaWZuZGVmIF9Y
RV9ERVZDT1JFRFVNUF9IXw0KPiAgI2RlZmluZSBfWEVfREVWQ09SRURVTVBfSF8NCj4gIA0KPiAr
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gK3N0cnVjdCBkcm1fcHJpbnRlcjsNCj4g
IHN0cnVjdCB4ZV9kZXZpY2U7DQo+ICBzdHJ1Y3QgeGVfc2NoZWRfam9iOw0KPiAgDQo+IEBAIC0y
Myw0ICsyNiw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHhlX2RldmNvcmVkdW1wX2luaXQoc3RydWN0
IHhlX2RldmljZSAqeGUpDQo+ICB9DQo+ICAjZW5kaWYNCj4gIA0KPiArdm9pZCB4ZV9wcmludF9i
bG9iX2FzY2lpODUoc3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpwcmVmaXgsDQo+
ICsJCQkgICBjb25zdCB2b2lkICpibG9iLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSk7DQo+
ICsNCj4gICNlbmRpZg0KDQo=
