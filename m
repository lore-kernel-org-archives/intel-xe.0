Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440BDD70E1A
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 04:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCBA10ED9C;
	Fri, 29 Nov 2024 04:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsEiJBNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BC410ED9C
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 04:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854939; x=1764390939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rYwEQa372D6WVppSIucmy/E6Z1Iha/09XHy6eTDPHlc=;
 b=AsEiJBNO/q+b5rOD9Amy0OanR/0jQGFr7xTUlLl5BECaSVqXul0SPmPJ
 Ouc6ux3k4JqzxNIiHrAIIT3mglkM6od2Q2XhuRDFvCm/pZrubdbbDLcAq
 4DergnaEhHBSt5Il14WEj7WCZmRCe3/LopXD2f+JwpBWLUaM0G1YcEqv/
 BJ6/7mnV5xP9NwaYww5A4U6BC8TRfBIBjJzM2aKw8rrqEu3ypxqSYatAL
 80NvYNFv2Dr/zSA1GT+EpEk00L2YlD2jRdX7MNdCJe3WCs5qZ6+aw2c29
 bfj2VM1V8fEDWMmD9rTq6mfOXNdo8xG0ftfZDwm9afyPp4aDtvT82JkIW A==;
X-CSE-ConnectionGUID: Z9iTk74oSXax2bChZ3NObg==
X-CSE-MsgGUID: E/5VK4WGQ/ysfR8Zt/atdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33334076"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33334076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:35:39 -0800
X-CSE-ConnectionGUID: f9a7J3ZBSQat5/lxLKxhyA==
X-CSE-MsgGUID: 1M7t3H6yQ7CC0IaDNNd3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="97363501"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 20:35:39 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 20:35:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 20:35:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 20:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgwJpr31FGNAbSoVLjakOkJzc1//9r6IuJGqjKOPulmFLjMZgiQaEBS27g1bnOud1uiJew2Ffv5HD1VM8KHX7W23URsvKbTZ7896BpOG3QwJkRfcgrVr2Z21pUh+2M7OkPLsPmFltfMxx9bNutxijPSCVHKC37k4ZvZUf+wh/1YTyPPBOICtt42tzxEMGHTYhGjmaEu+HzuFV9r/GoGapM6XBPptzpDCwHz0u9l0NZFGx5r2Jx8RvDfZ+kBBB3XxNB8zMNoeTnMJAyaPawGhqkhdTmw9mCaD3pm6P+DqqYvUm/+iIivtN1gMyKfQhs6f9/mZ04OnPX1sE1N5OwmqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYwEQa372D6WVppSIucmy/E6Z1Iha/09XHy6eTDPHlc=;
 b=Y+zK2h55YjAxrEQFsBhgUhRiHCgMkfXEZLi5A/xzP1clZzkzTLVY8h+hyorcQ1W9Kyshbg1buacs2iU1zhwaGPQx9STxai6Hj1TFRZdmpGZL0cQs0QOFT1gKRKcKtdvWfKN094Ua7qRtOzE/ipikb9TttGy9m8kbVAukIATVa13hdcyat6smYx+iIBf2bfnsUzA4IJNSCUqqrU2Vjz4sn9+KE4Kyq96z6Tn7n4c41Muv3v6rnSFAZj8aQtHva702Nqdw3Np2r7/v7jjpyJl4qmwmChilo9dC3CClvecZoeShEm5qswXAA9pk7TxdHRcKwIUAJVzU0ijo/9ZCUh5i8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 04:35:36 +0000
Received: from PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab]) by PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 04:35:36 +0000
From: "Kumar, Shubham" <shubham.kumar@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Cabral,
 Matias A" <matias.a.cabral@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: RE: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Thread-Topic: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall
 sampling
Thread-Index: AQHbHf6LBpf9TKExlkenyX9risvBXbK3JveAgAhbGwCAAT/8AIAAZNuAgAAlJgCAAo2+AIAH4/WAgAImeoA=
Date: Fri, 29 Nov 2024 04:35:36 +0000
Message-ID: <PH8PR11MB810558A1EAD07941F00BAA47E92A2@PH8PR11MB8105.namprd11.prod.outlook.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
 <ZzYj53waEWwK/5za@orsosgc001> <Zz0mUGCKzLXI5Y13@intel.com>
 <851pz5loar.wl-ashutosh.dixit@intel.com> <Zz6HV+/Ya1nOReZE@orsosgc001>
 <85zfltjmv3.wl-ashutosh.dixit@intel.com>
 <85r073jfo9.wl-ashutosh.dixit@intel.com> <Z0dpXQ0JXwtRbqO0@intel.com>
In-Reply-To: <Z0dpXQ0JXwtRbqO0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: harish.chegondi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8105:EE_|SA1PR11MB8521:EE_
x-ms-office365-filtering-correlation-id: f265150e-addf-40a6-b1a1-08dd102f452c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MHBKaHQwZ1pCZDZDUXRmNmlDT2pmL2Q0bkhuQ1VIdDhqQ2tscXIrS1p0Z0JN?=
 =?utf-8?B?OE1qWFZYT1VONGJaNWQ2eW41cXIwdzFsR3hWK0JOYXFJMkxrMUhsRVRLblM1?=
 =?utf-8?B?WC9QMGIwS1hFU1AxNHB6SXM2S0NXSTBJWXFtZUlhakxpNTJVNEl3clNSL0Nq?=
 =?utf-8?B?MXFGb3dpVVVHTHdVRnlTRytkcG16c0NwanpDOWh2Q2FDRlhNbUFSZ3owdFJW?=
 =?utf-8?B?TTAwbUJCVFNNcVZkRXBhUysyTXZPcFhxclVEc254bGxFSGtqVVZIbVlRMUxU?=
 =?utf-8?B?dEZyMUE1Z3hQQVgzNG45MkVKQ1JETWVGQmJjMHprM0l5K3d6cDNTanBPYXNk?=
 =?utf-8?B?dStOSFMrNVFrRVVvdjFMdGQvbmxSWlJSdE1UZmVmVEVhbkJyakxKM1g3RTg5?=
 =?utf-8?B?bXFiTHlPTk1uZFN4YVk5ekU1U3NNeFdiNW4zRnphWTVDMU5VYVBnZmpET3VM?=
 =?utf-8?B?VGdLOTBXYkJaZWg4OGdTM1Rxb1NJOU85OXdjaGNEcStXcW05YWdQOWsyRmMy?=
 =?utf-8?B?elNxZ1F4eUJjTnpGV1lLS2RBN0tSMVkxNVZ4bUZPTDdNVDdGNEY0OHorcTdI?=
 =?utf-8?B?YzJwbDhWMUhVWHFTLzJsTVI0dUh0emVDN3pnczVTblBHc2hndFV2VFJLOGIw?=
 =?utf-8?B?dU0ySlRIS3ZST09VdGlSWXI0RFViQUMvWStENkx6K3ZLR1Z2NXFWOGpHWGpI?=
 =?utf-8?B?bzR4aFRJNDNuUDg5cTNyd1Z1cnV2bHF6OHJxMTIxOHY0S096OWFGaFdYWm5z?=
 =?utf-8?B?eHFhM0ozdTd0QnhPVUVCdjNWNDdsVjZFeXZqUGRkNnVGcGg1U1BHTEtiOUox?=
 =?utf-8?B?eTVPVE9oWlJ1T0lIWnBkNEpmSXQydXZrWkRLSkYwbU9YRXhiSS9sSGlLM2tu?=
 =?utf-8?B?Q0dvaENObzRrVS90d3cvSlU4OUR6UWg0TlUvZCt6clJmelVHY1ByVVBZUWJZ?=
 =?utf-8?B?cWVlTkZidEdDOFk5Y2dzZUZxWWU5ekREVXkzMXNxWDNaeEFkRnpaODB2cWhs?=
 =?utf-8?B?SzFyUGplY1A3NktST3dFTjdQNHYwelhMSDdPbjcwRndhcVpibUJTVmlucDcx?=
 =?utf-8?B?Ym84RWFSUGNmTU9qbDRvK1plY1JGbmJOUVkvUDNLSjhPMkNEcFhsNWZidm9O?=
 =?utf-8?B?a1BBQzRkK0dPOURsZmJ0WnA5OUFUUWFJMHU2SlF0NnEyRUNkdWJGajg1aVZ2?=
 =?utf-8?B?aE92TVh0QVBFMnlxc1F3MTJBY3RtSHdjd3Q5aEkyRU9ibWlncXdnTnY0MFlE?=
 =?utf-8?B?S2ZXQmRxVC9XVlRPT3Q2dWVoazZheE1pWXBjcWplOTBDUXBoYTV5OUhvdy81?=
 =?utf-8?B?MitxRXNQUDZxL0NoODN1Z1Z2bXNtbmtHRzNobFZra3JLa0hXMzg5MFRZQUFJ?=
 =?utf-8?B?d0drOEVHWkNVd2xOdzh5NlFvUjEydGVJVXVveVFDbm9URGgyRVZ2S2pUUXRR?=
 =?utf-8?B?UVVwN2hnUVhYUHdPR0c3cTRIZXBtaEVKTGlLTUtHRC9WUUQ4ZGVSeDBqQ1hK?=
 =?utf-8?B?YVhMUTNNSVVncEJkc1IzOTFrcW5LS24zQjg0dlFsekQxRGhRQmlpR3J5OGxK?=
 =?utf-8?B?ejdPM0VIM0lncDJrVFNpd0ZSVm1WdUdJdEx2NjRNdHBrOE1EUFMxeEpmTmIw?=
 =?utf-8?B?YVlqa2pxNHpwME81NUVMWi9sVElqWEMxNnIxUFBJeDBTbU8zQlExeVZXNS9Z?=
 =?utf-8?B?ZXV6M1lRc1oySUs5VFoxRnIwSFdvOGRvVkp2STBJUldzdE5qenR1K0N5bVRF?=
 =?utf-8?B?Ky9LOThockt3Y3hVYlVtYXc5VVZ1MkFmRTlEOWRUSlQ3Z3ZXc2dsODVCRHh6?=
 =?utf-8?B?UzB5Y1pzRVJsWnNoUVQ2VHVXV3ppTDAzLzB1NkNzL3FTTHVlaDZoeU9CekVC?=
 =?utf-8?B?YVlUY3pRdjR1V3VCNGVYeldRdTJHZmpwNWh5YUlCVHRGUHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8105.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk1iWVhFRlo4cStCU0o5VjBWdi9qa0NaY1FQT1lWblhPazg1amRWVzBtRU9h?=
 =?utf-8?B?S2kwbGFuT2w4YUdFeTV3SHpNZ2VubzlmR3hqMnRKNWR2VlUxdFptV0ljZnlp?=
 =?utf-8?B?RSt6SDhmZ2JBSWpLNGJFQXUvN2hoaFNjODQ1V2gyNHl1NmoxMHpBc2Nab1J1?=
 =?utf-8?B?NE1ZYzV6OXRSVTVKMFVacTgrYjdKTzFrZVh3RGJqVE90OUJCZUhXNUh4bFZ1?=
 =?utf-8?B?SGsxanRtQmphRzU1YmNBcDlHUkZBYVZtSnllWlliR1JuQ1FuaVJub2h3SjZP?=
 =?utf-8?B?Wi95d2hTekU1RWVLaXA1SmlybWY3bUIvSlQ3eENmM0hUQkFRTjQyTG11aVJz?=
 =?utf-8?B?N2M1L3BESTVYQm4yZ0hWS0hxelEyR0ZaeGRhWCsrcXZsNXFVN21oMk8zVWhl?=
 =?utf-8?B?ZE5SVWNFai8vZTZKMFRnYXZOc0FPd3U3Ym1IVVRqMEtmU1BSWCtQbHBrSEx6?=
 =?utf-8?B?UUs2RGFyTkdoYkhLRVNNTTZQV3hVaGxtYS9uUkJrK05PdXM4RjZRTEg5NHNu?=
 =?utf-8?B?R0dVZTZoWmhrK3JQMUcwQ3JhaFI3QVF2MFVIR0xlRDlmUDZXamk2NzBVYlBF?=
 =?utf-8?B?Y1NML2p4eUp4TWlDVHBKYXdkbXYzN2Z5TjVycmx6a3dWcFd5TlNlNmJKNU82?=
 =?utf-8?B?Zkd1YnhjamUzVmFWeWNoZkZNWmpyRVFnUHRsNk4ycDRBL0IzWFpPb2FiUnJW?=
 =?utf-8?B?M1IwWlQ4Z01WL2hYQ2hkblhLM1hnRlI4eW1vK0gyNmxONGg1YXhRcmg3OU15?=
 =?utf-8?B?bm5qblRRVUNJRDlCeXN4dmpOOW9LU1NISWFvQ3ByRGM2ZUZoWkl5d0RCU3hs?=
 =?utf-8?B?TkxySkV3RU5JWTVjaHg2QjIxUE1pRXVnUXRzZElDS3ZaMUxPbTdPdTVSMS95?=
 =?utf-8?B?THpkRnNSQ3h2OU04T3BSS0ovUnhOWDBZRFBWMWt3VmFmS2RGWTgwL2J2MzRW?=
 =?utf-8?B?VUNLWTRoRkxZNUsxZmdBOTdrMXJrVHUxVm94MHFVUE1YUG9yY1NQaDhnUC9Z?=
 =?utf-8?B?d1pUUWZKYlBjT05yY3kyN2xhWjNmNDRFSmJldkFZMTlCaGo1eldiSExoNHEw?=
 =?utf-8?B?S2FMKzA4K3B3RDRwK1l1UUFVY0ZpZkJxTEQvakVtak1QMUdMd1JvQTBsS0Na?=
 =?utf-8?B?amhhM2dhb3ZsQ25iOUhZbWNxZkRhaEtBN3N2cnlvVUtyeTFzUCtxeGZtRUo2?=
 =?utf-8?B?YnlnemZXaFRrUTU1RWpjWGtOY29YRmx6c3JuV1Z4bXpKZGlmR2ZtSWFOKzF3?=
 =?utf-8?B?QTl0OVRuWlJMY3lZVGhNdXpEcS9uTWIxcG4vZE0ycGp3UnBPeVk0dUxvR25I?=
 =?utf-8?B?akd5U25Zd09TUXB6N254ajZ0SFRSbWZkK1RZVVFjYVVKZ01nZVZsbE9yWFZ0?=
 =?utf-8?B?MGs3YmhQQ24yYjcydDVZVDJ2N3F1ancrVTRFUlBiT3hmWHUzSUNwc2hOUlZ1?=
 =?utf-8?B?MGVNTHFFRVNJSkFuMG5sT29STkp6cmtoSGdwOXFuTzRjRm1rUjduZUtSY3Y4?=
 =?utf-8?B?bG5JQ0pwbDg3NllESyttN2JFQUt3TnlCNVBYU2I2REFzM0gwRFl1RTBNZFFh?=
 =?utf-8?B?Sy9aTGhMQkJQdnhlRGJGSVA1aDB2VXpYamhmRnJvbWRkdkVIZTJlS3M4VHNP?=
 =?utf-8?B?T2U3YWduMWVvbk1IRVkveEl5cGNud0hRMW5uVHIrTlYzdDFWQW5sWTNLZEpl?=
 =?utf-8?B?dzJnL011TVdIVzNtazNhWmQrRk9ldkZtRWRha2RDQXJtSitwcEJtK1BJU2NO?=
 =?utf-8?B?Vmk2QjJFZFlhWEp0U2FsdVVUL3k5MkpSWHRMWFp2OXdETnpDZk1JVElZRk52?=
 =?utf-8?B?LzNoSTM4TVhTVmR1QlAwWUZHQ3BxMk9OTjRmODU2SGVvTWt2Wks3Rm1WSHN4?=
 =?utf-8?B?YXdYdTl5S09wT2pWdlBHZERITTRMMEpyT0NnUmZQeG1oTktDM1V5eDJxa0hS?=
 =?utf-8?B?R0dxZ0d5V3ZlRWdOZ3VDNVRNYU5iWW9LVDZDZkk2VXovZ2pEczB5YWkyeFVO?=
 =?utf-8?B?MnFnbGdXKzEwazVqeTNCcmpyQ00rREMvdmNWREJ3THFiM0Q4TmFmdzROQlZq?=
 =?utf-8?B?TW1COHgzYng0RTY5TzRaMFBYSmpRSFpSS2dqZWpHZXlJTWdLYm5ieWpkbm5C?=
 =?utf-8?Q?0PGyi/vdqmn7vZLF9b37CAnDo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f265150e-addf-40a6-b1a1-08dd102f452c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 04:35:36.6335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJcupW18uJuVff10M0yLrxkOJak6ZVYTxRWlkglJuIlVElsM1bFA//EE7wLRGz7vrewT06jD36AlJYwQhkDj1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

SGkgQENoZWdvbmRpLCBIYXJpc2gsDQoNCkZyb20gTDAgVU1EIHNpZGUgd2Ugd291bGQgcHJlZmVy
IHRvIGNhbGN1bGF0ZSB0aGUgc3VwcG9ydGVkIHNhbXBsaW5nIHJhdGVzIGFuZCBwYXNzIGl0IG9u
IHRvIEtNRC4gRm9yIHRoaXMgd2UgbmVlZCBhbiBxdWVyeSB0aGF0IGNhbiBleHBvc2UNCg0KMS4g
U2FtcGxpbmcgY2xvY2sgZ3JhbnVsYXJpdHkgaW4gbmFub3NlY29uZHMgLSBFLmcgMjUxICogZ3B1
Q2xvY2tQZXJpb2ROcw0KDQoyLiBNaW4gYW5kIG1heCBzYW1wbGluZyBpbnB1dCByYXRlcyBzdXBw
b3J0ZWQgLSBbMSwgN10NCg0KVGhhbmtzLA0KU2h1YmhhbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQ2hlZ29uZGksIEhhcmlzaCA8aGFyaXNoLmNoZWdvbmRpQGludGVsLmNv
bT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjgsIDIwMjQgMTI6MTggQU0NClRvOiBEaXhp
dCwgQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCkNjOiBOZXJsaWdlIFJhbWFw
cGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBBdXNtdXMsIEphbWVzIDxqYW1lcy5hdXNtdXNAaW50ZWwuY29t
PjsgRGVncm9vZCwgRmVsaXggSiA8ZmVsaXguai5kZWdyb29kQGludGVsLmNvbT47IFNvdXphLCBK
b3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT47IENhYnJhbCwgTWF0aWFzIEEgPG1hdGlhcy5hLmNh
YnJhbEBpbnRlbC5jb20+OyBSYW5qYW4sIEpvc2h1YSBTYW50aG9zaCA8am9zaHVhLnNhbnRvc2gu
cmFuamFuQGludGVsLmNvbT47IEt1bWFyLCBTaHViaGFtIDxzaHViaGFtLmt1bWFyQGludGVsLmNv
bT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi81XSBkcm0veGUvZXVzdGFsbDogSW50cm9kdWNl
IEFQSSBmb3IgRVUgc3RhbGwgc2FtcGxpbmcNCg0KT24gRnJpLCBOb3YgMjIsIDIwMjQgYXQgMTA6
MTg6MTRBTSAtMDgwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiBPbiBXZWQsIDIwIE5vdiAy
MDI0IDE5OjE4OjI0IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+ID4NCj4gPiBPbiBX
ZWQsIDIwIE5vdiAyMDI0IDE3OjA1OjI3IC0wODAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMjQgYXQgMTE6MDQ6MjhBTSAtMDgw
MCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDE5IE5vdiAyMDI0IDE1
OjU5OjEyIC0wODAwLCBIYXJpc2ggQ2hlZ29uZGkgd3JvdGU6DQo+ID4gPiA+Pg0KPiA+ID4gPj4g
PiA+ICsvKioNCj4gPiA+ID4+ID4gPiArICogZW51bSBkcm1feGVfZXVfc3RhbGxfcHJvcGVydHlf
aWQgLSBFVSBzdGFsbCBzYW1wbGluZyBpbnB1dCBwcm9wZXJ0eSBpZHMuDQo+ID4gPiA+PiA+ID4g
KyAqDQo+ID4gPiA+PiA+ID4gKyAqIFRoZXNlIHByb3BlcnRpZXMgYXJlIHBhc3NlZCB0byB0aGUg
ZHJpdmVyIGFzIGEgY2hhaW4gb2YNCj4gPiA+ID4+ID4gPiArICogQGRybV94ZV9leHRfc2V0X3By
b3BlcnR5IHN0cnVjdHVyZXMgd2l0aCBAcHJvcGVydHkgc2V0IA0KPiA+ID4gPj4gPiA+ICt0byB0
aGVzZQ0KPiA+ID4gPj4gPiA+ICsgKiBwcm9wZXJ0aWVzJyBlbnVtcyBhbmQgQHZhbHVlIHNldCB0
byB0aGUgY29ycmVzcG9uZGluZyANCj4gPiA+ID4+ID4gPiArdmFsdWVzIG9mIHRoZXNlDQo+ID4g
PiA+PiA+ID4gKyAqIHByb3BlcnRpZXMuIEBkcm1feGVfdXNlcl9leHRlbnNpb24gYmFzZS5uYW1l
IHNob3VsZCBiZSANCj4gPiA+ID4+ID4gPiArc2V0IHRvDQo+ID4gPiA+PiA+ID4gKyAqIEBEUk1f
WEVfRVVfU1RBTExfRVhURU5TSU9OX1NFVF9QUk9QRVJUWS4NCj4gPiA+ID4+ID4gPiArICovDQo+
ID4gPiA+PiA+ID4gK2VudW0gZHJtX3hlX2V1X3N0YWxsX3Byb3BlcnR5X2lkIHsNCj4gPiA+ID4+
ID4gPiArI2RlZmluZSBEUk1fWEVfRVVfU1RBTExfRVhURU5TSU9OX1NFVF9QUk9QRVJUWQkJMA0K
PiA+ID4gPj4gPiA+ICsJLyoqDQo+ID4gPiA+PiA+ID4gKwkgKiBARFJNX1hFX0VVX1NUQUxMX1BS
T1BfU0FNUExFX1JBVEU6IFNhbXBsaW5nIHJhdGUNCj4gPiA+ID4+ID4gPiArCSAqIGluIG11bHRp
cGxlcyBvZiAyNTEgY3ljbGVzLiBWYWxpZCB2YWx1ZXMgYXJlIDEgdG8gNy4NCj4gPiA+ID4+ID4g
PiArCSAqIElmIHRoZSB2YWx1ZSBpcyAxLCBzYW1wbGluZyBpbnRlcnZhbCBpcyAyNTEgY3ljbGVz
Lg0KPiA+ID4gPj4gPiA+ICsJICogSWYgdGhlIHZhbHVlIGlzIDcsIHNhbXBsaW5nIGludGVydmFs
IGlzIDcgeCAyNTEgY3ljbGVzLg0KPiA+ID4gPj4gPiA+ICsJICovDQo+ID4gPiA+PiA+ID4gKwlE
Uk1fWEVfRVVfU1RBTExfUFJPUF9TQU1QTEVfUkFURSA9IDEsDQo+ID4gPiA+PiA+DQo+ID4gPiA+
PiA+IFdoYXQgaXMgdGhlIHJhdGUgb2YgMjUxIGN5Y2xlcz8gSWYgdGhhdCBjYW4gYmUgY2xlYXJs
eSANCj4gPiA+ID4+ID4gZGVmaW5lZCwgdGhlbiBhdCBmaXJzdCBnbGFuY2UsIEkgd291bGQgdGhp
bmsgaXQncyBiZXR0ZXIgdG8gDQo+ID4gPiA+PiA+IGRlZmluZSB0aGlzIGluIHRlcm1zIG9mIGZy
ZXF1ZW5jeS4gVGhlIGltcGxlbWVudGF0aW9uIGNhbiANCj4gPiA+ID4+ID4gZGVjaWRlIGhvdyB0
byB0cmFuc2xhdGUgdGhhdCB0byBIVyBjb25maWd1cmF0aW9uLg0KPiA+ID4gPj4gPg0KPiA+ID4g
Pj4gU2luY2UgdGhlIGR1cmF0aW9uIG9mIGEgY3ljbGUgZGVwZW5kcyBvbiB0aGUgR1BVIGNsb2Nr
LCBpdCBjYW4gDQo+ID4gPiA+PiB2ZXJ5IGZyb20gR1BVIHRvIEdQVS4gU28sIGlmIHRoZXJlIGlz
IGFueSB0cmFuc2xhdGlvbiBpbiB0aGUgDQo+ID4gPiA+PiBkcml2ZXIsIGl0IHdpbGwgaGF2ZSB0
byBiZSBkaWZmZXJlbnQgZm9yIGVhY2ggR1BVLiBJIHRoaW5rIA0KPiA+ID4gPj4ga2VlcGluZyB0
aGlzIGlucHV0IGFzIGEgbXVsdGlwbGllciBvZiBjeWNsZXMgbWF5IGJlIG1vcmUgZnV0dXJlIA0K
PiA+ID4gPj4gcHJvb2YgZm9yIHRoZSB1QVBJLiBJIGFtIHRyeWluZyB0byBnZXQgbW9yZSBpbmZv
cm1hdGlvbiBhbmQgZmVlZGJhY2sgZnJvbSB0aGUgdXNlciBzcGFjZSByZWdhcmRpbmcgeW91ciBz
dWdnZXN0aW9uLg0KPiA+ID4gPj4gSWYgaXQgaXMgZmVhc2libGUsIEkgd2lsbCBpbXBsZW1lbnQg
aW4gdjYuDQo+ID4gPiA+DQo+ID4gPiA+IFVtZXNoIGhhcyBhIHBvaW50IGJ1dCBJIHNvcnQgb2Yg
YWdyZWUgd2l0aCBIYXJpc2ggYmVjYXVzZSB0aGlzIA0KPiA+ID4gPiB2YWx1ZSBpcyBkaXJlY3Rs
eSBmZWQgaW50byBhIHJlZ2lzdGVyLiBCdXQgd2UgZG8gbmVlZCBzb21lIGNoYW5nZXM6DQo+ID4g
PiA+DQo+ID4gPiA+IDEuIFRoaXMgMjUxIHZhbHVlIHNob3dpbmcgdXAgaGVyZSBkb2Vzbid0IG1h
a2UgYW55IHNlbnNlIGFuZCBuZWVkcyB0byBnby4NCj4gPiA+ID4gMi4gQWNjb3JkaW5nIHRvIEJz
cGVjIDY0MDM2LCBIVyBzdXBwb3J0cyAiMTI3ICogTiIgc2FtcGxpbmcgcmF0ZXMNCj4gPiA+ID4g
ICAoaW4gdGVybXMgb2YgY3ljbGVzKSwgc28gd2Ugc2hvdWxkIHN1cHBvcnQgdGhvc2UgdG9vLg0K
PiA+ID4gPiAzLiBFdmVuIGhpZ2hlciBzYW1wbGluZyByYXRlcyAoc2F5IDEweCkgYXJlIGJlaW5n
IHByb3Bvc2VkIGZvciB0aGUNCj4gPiA+ID4gICBmdXR1cmUuIFNvIHRoZXNlIHNob3VsZCBhbHNv
IGJlIHN1cHBvcnRlZC4NCj4gPiA+ID4NCj4gPiA+ID4gU28gbXkgcHJvcG9zYWwgaXMgc2ltcGxl
LCBidXQgbGV0J3Mgc2VlIGlmIGl0IGNhbiBiZSBtYWRlIHRvIA0KPiA+ID4gPiB3b3JrLiBUaGUg
dWFwaSB3aWxsIGRpcmVjdGx5IGlucHV0IHRoZSBzYW1wbGluZyByYXRlIGluIG51bWJlciANCj4g
PiA+ID4gb2YgY3ljbGVzIChzbyB0aGUgdmFsdWUgY29taW5nIGluIGlzIHdoYXQgdGhlIEdQVSBm
cmVxIGlzIA0KPiA+ID4gPiBkaXZpZGVkIGJ5KS4gU28gZS5nLiBpZiAiMyAqIDI1MSIgaXMgcmVx
dWlyZWQgIjMgKiAyNTEiIHdpbGwgDQo+ID4gPiA+IGNvbWUgaW4gdGhyb3VnaCB0aGUgdWFwaS4g
SWYgVU1EIHdhbnRzICI3ICogMTI3IiwgdGhleSB3aWxsIHNlbmQgDQo+ID4gPiA+IGluICI3ICog
MTI3Ii4gVGhlIGRyaXZlciB3aWxsIGludGVybmFsbHkgbWFwIHRoaXMgdmFsdWUgaW50byB0aGUg
ImNsb3Nlc3QiIHNhbXBsaW5nIHJhdGUgc3VwcG9ydGVkIGJ5IEhXLg0KPiA+ID4gPg0KPiA+ID4g
PiBJIGFtIGFzc3VtaW5nIHRoYXQgVU1EJ3MgYWxyZWFkeSBrbm93IHdoYXQgc2FtcGxpbmcgcmF0
ZXMgYXJlIA0KPiA+ID4gPiBzdXBwb3J0ZWQgYnkgYSBwYXJ0aWN1bGFyIEhXIHBsYXRmb3JtIHNv
IHRoZXkgY2FuIHNlbmQgaW4gdGhlIA0KPiA+ID4gPiBleGFjdCB2YWx1ZSB0aGV5IG5lZWQuIE90
aGVyd2lzZSB0aGUgZHJpdmVyIGNhbiBhbHdheXMgbWFwIHRoZSANCj4gPiA+ID4gdmFsdWUgc2Vu
dCBieSB1c2Vyc3BhY2UuIFNheSBVTUQgc2VuZHMgYSB2YWx1ZSAxMCwgdGhpcyB3aWxsIGJlIA0K
PiA+ID4gPiBtYXBwZWQgaW50byAiMSAqIDEyNyIgd2hpY2ggaXMgdGhlIGNsb3Nlc3Qgc2FtcGxp
bmcgcmF0ZSBzdXBwb3J0ZWQgdG8gMTAuDQo+ID4gPiA+DQo+ID4gPiA+IFNvIHRoaXMgd2F5IGFs
bCBzYW1wbGluZyByYXRlcyBjYW4gYmUgc3VwcG9ydGVkLiBVTUQganVzdCBzYXlzIEkgDQo+ID4g
PiA+IHdhbnQgYSBzYW1wbGluZyByYXRlIG9mICJHUFVfZnJlcSBkaXZpZGVkIGJ5IDEwIiBhbmQg
dGhleSANCj4gPiA+ID4gYXV0b21hdGljYWxseSBnZXQgd2hhdGV2ZXIgaXMgdGhlIGNsb3Nlc3Qg
YXZhaWxhYmxlLiBUaGV5IA0KPiA+ID4gPiBwcm9iYWJseSBkbyBuZWVkIHRvIGhhdmUgYW4gaWRl
YSBvZiB3aGF0IHJhdGVzIGFyZSBzdXBwb3J0ZWQgb24gDQo+ID4gPiA+IGEgcGFydGljdWxhciBI
VyBwbGF0Zm9ybSwgSSBhbSBhc3N1bWluZyB0aGV5IGhhdmUgdGhpcyANCj4gPiA+ID4gaW5mb3Jt
YXRpb24gZnJvbSBCc3BlYywgc28gdGhleSBjYW4gc2VuZCBpbiBleGFjdCB2YWx1ZXMgaWYgdGhl
eSBrbm93IGFuZCBkcml2ZXIgd2lsbCBiZSBhYmxlIHRvIHNldCB0aGUgZXhhY3QgdmFsdWUgVU1E
IGhhcyBzcGVjaWZpZWQuDQo+IA0KPiBUaGlzIGlzIGFuIGltcG9ydGFudCBwb2ludCBoZXJlLiBD
YW4gd2UgYXNzdW1lIFVNRCdzIGFscmVhZHkga25vdyB0aGUgDQo+IHNhbXBsaW5nIHJhdGVzIGF2
YWlsYWJsZSBvciBub3Q/IEtNRCBjYW4gaGFuZGxlIHdoYXRldmVyIHZhbHVlIFVNRCANCj4gc2Vu
ZHMgaW4gYnV0IFVNRCBzdGlsbCBoYXMgdG8gaGF2ZSBhbiBpZGVhIG9mIHdoYXQgc2FtcGxpbmcg
cmF0ZXMgYXJlIA0KPiBzdXBwb3J0ZWQgYnkgS01ELCB0byBiZSBhYmxlIHRvIHNldCBhbiBhY2Nl
cHRhYmxlIHNhbXBsaW5nIHJhdGUuDQo+IA0KPiBPdGhlcndpc2UsIEtNRCB3aWxsIG5lZWQgdG8g
ZXhwb3NlIHdoYXQgc2FtcGxpbmcgcmF0ZXMgYXJlIHN1cHBvcnRlZCANCj4gdG8gVU1ELiBUaGVy
ZSBzZWVtIHRvIGJlIGEgY291cGxlIG9mIHdheXMgb2YgZG9pbmcgdGhpczoNCj4gDQo+IDEuIEtN
RCBjYW4gZXhwb3NlIHRoZSBhdmFpbGFibGUgc2FtcGxpbmcgcmF0ZXMgaW4gDQo+IGRybV94ZV9x
dWVyeV9ldV9zdGFsbA0KPiANCj4gT3IsDQo+IA0KPiAyLiBUaGUgVU1EIGNhbiBzZXQgdGhlaXIg
c2FtcGxpbmcgcmF0ZSBhbmQgdGhlIGFjdHVhbCBzYW1wbGluZyByYXRlIHNldCBieQ0KPiAgICBL
TUQgZm9yIHRoYXQgc3RyZWFtIGNhbiBleHBvc2VkIHRocm91Z2ggRFJNX1hFX09CU0VSVkFUSU9O
X0lPQ1RMX0lORk8NCj4gICAgaW9jdGwuIElmIFVNRCBkb2Vzbid0IGxpa2UgdGhlIHNhbXBsaW5n
IHJhdGUgc2V0IGJ5IEtNRCB0aGV5IGNhbiBjbG9zZQ0KPiAgICB0aGUgc3RyZWFtIGFuZCByZW9w
ZW4gYSBuZXcgc3RyZWFtLiBCYXNpY2FsbHkgdGhleSB3b3VsZCBuZWVkIHRvIGl0ZXJhdGUNCj4g
ICAgdG8gYXJyaXZlIGF0IGFuIGFjY2VwdGFibGUgc2FtcGxpbmcgcmF0ZS4NCj4gDQo+IE9yLA0K
PiANCj4gMy4gS01EIGRvZXMgbm90aGluZywgYXNzdW1lcyBVTUQncyBrbm93IHRoZSBzYW1wbGlu
ZyByYXRlICJvdXQgb2YgYmFuZCIgdmlhDQo+ICAgIHRoaW5ncyBzdWNoIGFzIEJzcGVjLg0KPiAN
Cj4gSSdtIHRoaW5raW5nIG1heWJlIHNob3VsZCBleHBvc2UgdGhlIG1pbiBhbmQgbWF4IHNhbXBs
aW5nIHJhdGVzIHRocm91Z2ggMS4NCj4gYW5kIFVNRCdzIGNhbiBzZWxlY3Qgc29tZXRoaW5nIGlu
IGJldHdlZW4gYW5kIEtNRCBjYW4gbWFwIHRoYXQgdG8gb25lIA0KPiBvZiB0aGUgc2FtcGxpbmcg
cmF0ZXMgYXZhaWxhYmxlIGluIEhXIGFuZCBtYXliZSBhbHNvIGV4cG9zZSB0aGUgZmluYWwgDQo+
IHNhbXBsaW5nIHJhdGUgdGhyb3VnaCAyLg0KPiANCj4gU28gZS5nLiBmb3Igbm93IG1pbiBhbmQg
bWF4IGV4cG9zZWQgd291bGQgYmUgMSoyNTEgdGhyb3VnaCA3KjI1MSANCj4gKGlnbm9yaW5nIHRo
ZSAxMjcgc3R1ZmYgZm9yIG5vdykuIE1pbi9tYXggbWlnaHQgYmUgbW9yZSBmdXR1cmUgcHJvb2Yg
DQo+IHNpbmNlIEhXIGNoYW5nZXMgdG8gYSBkaWZmZXJlbnQgc2NoZW1lLCByYXRoZXIgdGhhbiBo
YXZlIDcgb3IgMTQgZml4ZWQgDQo+IHNhbXBsaW5nIHJhdGVzIHRoZXkgaGF2ZSBub3cuDQoNCkFz
IG9mIG5vdywgdGhlIGRyaXZlciBzZXRzIGEgbWVkaXVtIHNhbXBsaW5nIHJhdGUgYXMgZGVmYXVs
dCBpZiB0aGUgdXNlciBkb2Vzbid0IHBhc3MgYW55IHNhbXBsaW5nIHJhdGUgdGhyb3VnaCB0aGUg
cHJvcGVydGllcy4gSW4gdGhpcyBwYXRjaCBzZXJpZXMsIDQgaXMgdGhlIGRlZmF1bHQgc2FtcGxp
bmcgcmF0ZSB3aGljaCBpcyB0aGUgbWlkIHBvaW50IGJldHdlZW4gMSwgdGhlIGZhc3Rlc3Qgc2Ft
cGxpbmcgcmF0ZSBhbmQgNywgdGhlIHNsb3dlc3Qgc2FtcGxpbmcgcmF0ZS4gSXQgd291bGQgYmUg
Z29vZCB0byBnZXQgZmVlZGJhY2sgZnJvbSB0aGUgVU1EcyBvbiB3aGljaCBzYW1wbGluZyByYXRl
cyBhcmUgdHlwaWNhbGx5IHVzZWQuIEFzIG9mIG5vdywgTWVzYSBpcyBzZXR0aW5nIHRoZSBzYW1w
bGluZyByYXRlIHRvIHRoZSBmYXN0ZXN0IC0gMS4NCklmIHRoZSBkcml2ZXIgZXhwb3NlcyB0aGUg
bWluIGFuZCBtYXggc2FtcGxpbmcgcmF0ZXMgYW5kIHNldHMgdGhlIG1pZCBwb2ludCBhcyB0aGUg
ZGVmYXVsdCBzYW1wbGluZyByYXRlLCB0aGUgdXNlciBjYW4gb3ZlcnJpZGUgd2l0aCB0aGUgZmFz
dGVzdCBvciB0aGUgc2xvd2VzdCBzYW1wbGluZyByYXRlIG9yIGFueSBvdGhlciByYXRlIGluIGJl
dHdlZW4uDQoNClRoYW5rcw0KSGFyaXNoLg0KPiANCj4gPiA+DQo+ID4gPiBJIGFtIG9rYXkgd2l0
aCB3aGF0ZXZlciBtYWtlcyBzZW5zZSBmcm9tIGEgVU1EIHBlcnNwZWN0aXZlIGFuZCANCj4gPiA+
IHdoYXRldmVyIGNhbiBiZSBleHRlbmRlZCBlYXNpbHkgaW4gZnV0dXJlLiBKdXN0IHRoZSBjeWNs
ZXMgYXMgeW91IA0KPiA+ID4gYXJlIHN1Z2dlc3Rpbmcgc2hvdWxkIGJlIGdvb2QgYXMgd2VsbC4N
Cj4gPg0KPiA+IE15IHN1Z2dlc3Rpb24gaXMganVzdCB0aGUgaW52ZXJzZSBvZiBzYW1wbGluZyBm
cmVxLCBpbiBhIHNlbnNlLCBpLmUuDQo+ID4NCj4gPglldSBzdGFsbCBzYW1wbGluZyBmcmVxID0g
Z3B1IGZyZXEgLyBODQo+ID4NCj4gPiBTbyB3ZSBnZXQgTiB0aHJvdWdoIHRoZSB1YXBpLg0KPiA+
DQo+ID4gPiBKdXN0IGN1cmlvdXMsIHNpbmNlIHRoZSBncHUgZnJlcXVlbmN5IGlzIG1heSB2YXJ5
LCBhbnkgaWRlYSBob3cgDQo+ID4gPiB0aGUgVU1EcyBtYXAgdGhpcyBkYXRhIHRvIHRoZWlyIHRp
bWVsaW5lPw0KPiA+DQo+ID4gTm90ZSB0aGF0IHdlIGFyZSBkZWFsaW5nIHdpdGggdGhlIHNhbXBs
aW5nIGZyZXEgaGVyZSwgdGhlIGZyZXEgYXQgDQo+ID4gd2hpY2ggZXUgc3RhbGwgZGF0YSBpcyBz
YW1wbGVkLCBzYXkgIDEgLyBuICogMjUxIG9yIDEgLyBuICogMTI3IG9mIA0KPiA+IGdwdSBmcmVx
LiBCdXQgeWVzIHNhbXBsaW5nIGZyZXEgY2FuIHZhcnkgd2l0aCBncHUgZnJlcS4NCj4gPg0KPiA+
IEJ1dCBvdGhlcndpc2UgVU1EJ3MgZG9uJ3QgZGVhbCB3aXRoIHRpbWUgdmVyeSBtdWNoLCBvbmx5
IHRoZSBJUCANCj4gPiAoaW5zdHJ1Y3Rpb24gcG9pbnRlcikuIFNvIGUuZy4gZXUgc3RhbGwgZGF0
YSBjb250YWluczogYmFzaWNhbGx5IElQIA0KPiA+IHggd2FzIHN0YWxsZWQgZm9yIHkgY3ljbGVz
IGluIHRoaXMgc25hcHNob3Qvc2FtcGxlLiBTaW5jZSBJUCBpcyANCj4gPiB1bmlxdWUsIGl0IGNh
biBiZSBtYXBwZWQgdG8gYSBsaW5lIG9mIGNvZGUgZm9yIGFuIGV1IGtlcm5lbCBlLmcuDQo+ID4N
Cj4gPiBTbyBJIGd1ZXNzIHRoZXJlIGlzIGFsc28gYW4gYXBwcm94aW1hdGUgbm90aW9uIG9mIHRp
bWUsIHNvIHdoZW4gdGhpcyANCj4gPiBldSBrZXJuZWwgd2FzIHNhbXBsZWQgKG9yIHJhbikgdGhl
IGZpcnN0IHRpbWUsIElQIHggd2FzIHN0YWxsZWQgZm9yIA0KPiA+IHkgY3ljbGVzLCB3aGVuIGl0
IHdhcyBzYW1wbGVkIHRoZSBuZXh0IHRpbWUsIElQIHcgd2FzIHN0YWxsZWQgZm9yIHogDQo+ID4g
Y3ljbGVzLiBTbyB5b3Ugd291bGQgaGF2ZSBhIGtpbmQgb2YgbW92aW5nIHdpbmRvdyBmb3IgdGhl
IHN0YWxsIA0KPiA+IHRpbWVzIGZvciBhIHBhcnRpY3VsYXIgSVAuIFNvIGl0J3MgYmFzZWQgb24g
SVAsIHJhdGhlciB0aGFuIHRpbWUgZGlyZWN0bHkuDQo+ID4NCj4gPiBBdCBsZWFzdCB0aGF0J3Mg
aG93IEkgdGhpbmsgaXQgd29ya3MgOi8NCg==
