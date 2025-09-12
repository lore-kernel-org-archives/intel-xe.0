Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED97CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 22:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B491B10ECE7;
	Fri, 12 Sep 2025 22:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzZn9ZSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537E10ECE7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757716007; x=1789252007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N6SW8WnuEQdeEgawmOd0PhCKshwr11FmDhnIaimtA24=;
 b=nzZn9ZSkQZd9L4wWgDlE+jH5iRiAf4QAeBWlPDHz+fQiX6vmiD8beJdp
 6Syt1Eb744QyP3txu8Aj7EqDVEUR5IAWIwCtjpRmz9agWnKL4SLHYNH2U
 B7U06Y6MttF5Xv1BDWsI/06jfy5Tb7IXReVNNYOSlMzVBU1oMCExyeZ0Q
 70Jp9oR70VZjc+WYZS44wy9wXO3JzlJn+QPx4I0c5p3Bp9fzMBhdDB3Ls
 aYU84gKkoagVKF4u2g6doh5Bb0dSNZPVa/mjy88zXRARp6ZSSahA+BWpU
 g0xYEXpTX6jaizPMgbab8/khzN+r0A0W9wuSXjUSkAnNIT7EtO6CyrNq6 w==;
X-CSE-ConnectionGUID: qoGajTkpTR69gGjIRtTXEA==
X-CSE-MsgGUID: 5FthCSkhT3Cci+ZStVcBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="85497871"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="85497871"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 15:26:46 -0700
X-CSE-ConnectionGUID: lCbktELySBuU8bSeJweDFg==
X-CSE-MsgGUID: KkBnIvqLRKKLYsJ9PUi+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="178435494"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 15:26:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 15:26:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 15:26:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 15:26:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjGikmMIIBUj0BZYTQTUvJm8DeyJMiSk3vr147RCmqZNw0SuFGmv416n+Crw9v/NOfhHtZIJGggLq88BdgpCdh50K+dMJKqCGtTpWI4/2gC+QFtZyfsRGZvdY0v5ZduPqxAh8Oi4qxTjqQqqkf5MPq+HG/PMESwzdYPuysSU/oZudo8+DFh9sN/CUBefYGIKku9Fnq37jrbmrES2JduYsaWtHnOWe5L6GxHLOJZ2xli8iCcuk8J/bTtmjPfmQk8RTYjsmDgGePOb1MF1J+9QQ3JqjC/5NgQ56I+gTV4epivmzfhr7lS2B56YeGcPSUngXm8OXsIzOR/mfiOAiqYP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6SW8WnuEQdeEgawmOd0PhCKshwr11FmDhnIaimtA24=;
 b=XWN4MReJQ2KU4JZ7Qkr6+kOInBzgjk5H3H84TjimC+tPLgHcEpaVn7OWDqtNNf+d6GJyZFadb1PomVbjdnBRlVbTlDJyfp1ult+wL/yh02u21JAOqBaeWMCcB/56Og2+vAEFBUa0ImDNKgB9hVtL4Q6BKDYp+TeAPD+rABfSohnqoD2LsE2Soe7G7qT9rFGHm7m7lHbWN7C8qMgYzI3Ka7io98CF58jKQzXdMwVOBBU+W8P9e/ut2jMtdIaLoIU95ItfjTLlAHzqldiKJnboQrQtdaBqLZL1p9cLtdsPMKHQbbPOyf1wsuILACPX6DhicUpUtkbFefXyr4/Q7GU2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 22:26:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 22:26:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: lkp <lkp@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Use ARRAY_SIZE in guc_waklv_init()
Thread-Topic: [PATCH] drm/xe: Use ARRAY_SIZE in guc_waklv_init()
Thread-Index: AQHcJDFug4Hs4IA8q0Wc6iI6IIgp9LSQH++w
Date: Fri, 12 Sep 2025 22:26:41 +0000
Message-ID: <CH0PR11MB544452050E283B7798E326A0E508A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250912-guc-ads-array-size-v1-1-a6555392a1f8@intel.com>
In-Reply-To: <20250912-guc-ads-array-size-v1-1-a6555392a1f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL3PR11MB6313:EE_
x-ms-office365-filtering-correlation-id: 0e4aa50a-e916-40ae-b0e7-08ddf24b72cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?YzBMQXQyWExpdk5PdHJsSlhtYWgzMlEveUNBVlFFeFhzeHV4b1VOSFpKK3h3?=
 =?utf-8?B?WVVOcHFrZGdMcUZFTE1TUlljS3RtTmJZdzQyTUFkNkxUSU9sbHppZVRKUnRQ?=
 =?utf-8?B?L0dyMGhuYnRTL0MyQzhaQ3JzWEtQVi9hYTR4NWRYNFFHZ1ZmOUVPbDQ4TzBF?=
 =?utf-8?B?bXBnYjI2VmJuR25OcXZhc0EycXdiU2o4ZjdDb0tzaThPRkNYTTZaVHBKeTFn?=
 =?utf-8?B?TXFoekk2cWJjK1JBUkZMSmFsWjcrS1BnTk9BNDc1SnpzL2FUTERFWGorcUwz?=
 =?utf-8?B?TVhwMlFrb1MrMHUyZkx6TFlPcURmY0phcmlwTHlPNFh0MEV4UUVYM2Rtb0Jw?=
 =?utf-8?B?ampJNTNNY0ppMHVOdE0rb25EN2UrYm5lNDhiNXN0Mnl4Tmd0TCszemlxQVZR?=
 =?utf-8?B?MDR6YWVOQ0w2NzU4MzlieWRJUjgzWE1ybVVsWGFqcU1VOGRwa0ZNM0JwMlph?=
 =?utf-8?B?anhmSkdBMERlMFZUU0pidTJ1MkwzYXA2eGNXVklKTk9kU1lqMmoyVXNUZ0Jm?=
 =?utf-8?B?Q1o4ZmhyZHFzOWY0dUp0aVp5YktRc3BySk9GTUVZL0cvSC9hVW1zdEVDSDVJ?=
 =?utf-8?B?cGZFd2xsZ0RYd3VKa3A1Nk5IY0dXZFp3a0I2cWRjemUzS2JmT2xrQzhTbVE4?=
 =?utf-8?B?QnRiTzJPK3V2WHZOdGpWTit2TGVGZU5HL3JBZ3lodUdRVHNELy9wTUlYWkNm?=
 =?utf-8?B?ekh1eHpIY3ZpVmcrN044blJiUTZsYVFReThVcERLM0JHN0VsSkVyaDlHR1pI?=
 =?utf-8?B?UDc5UkNhMDJLTVh0RmxvYkhROEtYalI3SEluSE0xRmpFdW9yQkZXb2pGUkdk?=
 =?utf-8?B?QXlMVFFEL0taOHNZNitqM0VmSVErSmlIUzd5UGQ5QUI3Ri8vYytjR2tqbXo1?=
 =?utf-8?B?NnBGWUdscnpHb3N4TU8vV3VYV2l4QUdIRm0rUUhGVkpNUVYvVFpUMFp2TTVr?=
 =?utf-8?B?QzRnZ1ZWZUpkZEpVYzZRSHVUMm9jOCs1OUFlRzJscWdtUjQvQmZSZENKSmJE?=
 =?utf-8?B?ZVBBWlZuVHJUNUpUY3A3N09ZM3FaU1hnTVdUVGcxVGN4UnRrSUtTSUxzRytP?=
 =?utf-8?B?K1RQT0EyRDdaU0Q5dGtNSXBpZWZNbVMzTWRyUk42S0JTRkpzTlptYkVzU1k2?=
 =?utf-8?B?MjJEQXJoUEY5cldVcDlCYXJOaEtxT2NjdGNhTkJkSFF6VkpXRUtGT3dybjdR?=
 =?utf-8?B?RWxxUkJXb3ZNOWlSMFArSy9ZdzYzWmpzRUpCUEUwVE1WdlhUZzFlMkE3RlR3?=
 =?utf-8?B?cVZXdkJOMnlaRExDVFBYNmZjYUdyRDBBZXg3eFB1dDhiOG1ZZW5IVjBya2Uw?=
 =?utf-8?B?QXdWcVBjT08zbW56K01seWRJemNYVjdMZDMxcWNqeEp5YjJwRkw1b2tDUXBQ?=
 =?utf-8?B?TXY3QTZ1b1Nvc1dqd1Z3KytiaEYrd3RMREZqdGlvQm9jcE5TakpsWkdoL0g2?=
 =?utf-8?B?ZXJPVGhRaUJhS1lSVVM5MFJwUmNacHpXNXZMc2pKZWpzejVlbjQ3QmV2VXFE?=
 =?utf-8?B?WkFubXJCVU5Jb2YrbUhvazRsWUNYQnVpM09XdUFSQ2ZvbGJHRGpmek9xZnRx?=
 =?utf-8?B?NDRxSGl2MjNSdUgrZVJTVkEycTRwQmc0NHFyeTIyUGpFY0ZHTTVucFZqbGlr?=
 =?utf-8?B?N2RKcjN5aUJoSWRnREpCSnFpRGZtWFRhdUFkWFQrSi9CZ2ZOaER0bTdqZ1py?=
 =?utf-8?B?UlN1Y1FLSk9JeWIvc2lmRGM0aFphbHRhSGxiajY0VmdhU3MxZ0RkRFBrM2Iv?=
 =?utf-8?B?SndtMlREam1BbDZQbzNLd3FLNm1PeWNYenVVMWgwSHNSUEFrSTNLRHdsK09T?=
 =?utf-8?B?UHQvSDJqQ0lianJ5QkU3bEJzRTV1VlFuajhOTXNaR2JrVEU0ZERpR05GdjFa?=
 =?utf-8?B?TXJXbnl4T1Y1OG9NQnhTQ3FiWXFSTTRUeVlPVDhUd081cHdsWHI1dHJXdi8z?=
 =?utf-8?Q?/UU0fchdo4M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eElTTVY2ZGtWR1RWczRFZzVkMjdkdVh2T3pCUmpBTGw0b1FEUkhHQVhPdEVM?=
 =?utf-8?B?cUJpRHRtYnA1MXNVcmE4d0thTGo4MzNuVnZXRm1vSzN3WDhTMUx1VUF4Sjdi?=
 =?utf-8?B?ZE1GQ1NiU3FGYVdnVVBPNCt0RUtqczBBTE9OQWJ5UU5qa3pQS1FXZVY4MC92?=
 =?utf-8?B?Tk1memxJemYzOXRDaVluZEM0SWU4Y3R6QzVsUy9rNi9BSXRsVTQyR3k5U3pC?=
 =?utf-8?B?TG43ZytEd1VkT001Z1QzRDZzeExLbm9sU3AxVk1Nb1prampQQlp4VG5mRG5C?=
 =?utf-8?B?cTQzbVNOeWZkcU11Mmx5SkozbTJZbDhzU1NKU21Ec3RJOEZQRThjam5Ib1Jr?=
 =?utf-8?B?ektnaGE4MmFSRGNIMFJjTURUdDNQaTFuUXZHYnloMk1uVURKN2RyTENrQVNP?=
 =?utf-8?B?clJvS09pRDU4MGxCQ2NQNjV5U0lJa2hwUVIxL3k5T1B0OWY5by9VSTc5Ni84?=
 =?utf-8?B?UktadWc5TEpkd2FHM010cVZMRkg3a3d6Y3BZSFExQ0RPRlNGMDg5VFpuTGtv?=
 =?utf-8?B?WW9BUWd4am5ibDBzdEVnc2ZqbzNLVFUwL2hzdDhhemsxZ1o1UTRERGZic2pi?=
 =?utf-8?B?R3lzbzJjTE9idlgxMEYyYkk0ZTRtRFdOZVFJS0RIa1hZQU5LODVWazViWVNh?=
 =?utf-8?B?ZUc1Q254YnJjNUN0U0FldHQ4S1JLRGVhQmdMT0R6SkdrcFZYVTd3VTFheVht?=
 =?utf-8?B?VUNHV1ErMkhwSHlDODNSMVNETFJuQ3FzZmxHclgrU0N0T3RTUmNpcnRPU0FV?=
 =?utf-8?B?SmcvcGZFcFpoaWpCYUY2Tis1Zzg3ZmpwVUpIdzZCUEcrK01vdWNhZmFLTVBr?=
 =?utf-8?B?cEtPdU5zVGVWbHNpcDNIYWhseityV2ZqZmhRelRmV2hMK1ZFTXJ1Z296YkJ1?=
 =?utf-8?B?SHYyeWVUMGVEQ1RsOTIrTXhWUHZBYjYwUmtOQWxHMm4ydEJiR2g2bGFhQ0Mx?=
 =?utf-8?B?cTF6NStqMnZBK1hxc2dQWFA0UHMvMmFzZk1MMzRCQWFlU1hqbHAyalRvY0dC?=
 =?utf-8?B?QVBiZ2ZvNEFLdjBIcW9UdzE4NWlsZ2RTU3d1bkcwOURWQkFtNkZiQkNuYWcx?=
 =?utf-8?B?THNMSGN6L2pNQ3F3a21GSDIreXJOVlNUeE5Mblg2UjZjNTlkLzNCeGZ3bHUr?=
 =?utf-8?B?NFlacGNJMXVHNEZ1bVNmMWlJZkYxS0pYSkpodWxnb1lGSXhYUERYbkF1b2lN?=
 =?utf-8?B?c0hXSGFvMGsramlvMmFKWm9VY09Wa09IMUlRckpNaVZCZkl2Qys4Y0RVZ2Ey?=
 =?utf-8?B?YldQTEduZ1NhTDVUV05iVGJKRzhWUDFhYVczSHhJNTVOQm9VRjMyaFpnZWVF?=
 =?utf-8?B?L2tMYkMwOE5JRWVEYVhvSEZWcVpBRlE0OXhGZ0V6YjRycHVjalVIYkdtUEY4?=
 =?utf-8?B?M1FRVXJSLzRhUDVoU3cyOEZETk9OVjdmaVF4S3lVNWdWQXZLUFFsQ0Y4Ylpk?=
 =?utf-8?B?ZFE2UzZxOENVcnExZDNtQ3hmVDZFOWlzalg5cEtIQmg4N3RUcFM4b3hBNkJj?=
 =?utf-8?B?YXF3WlExS29xZDh2SmxCYXVzcVNCZGxqalkxeSswZHhuTjcxWnlUTkNUaXAx?=
 =?utf-8?B?ZVB0SmVMS2xZc0xHMENPNzQxeEgyR3pGclBPMzNpN1J1K2VxdGpMN2dYaVR3?=
 =?utf-8?B?ekppbm9NdnN1VWhwUkhFQnJOWDB1Ky8zeUJ3Rm0rV2FRRUM4K2MrWi8rT0J4?=
 =?utf-8?B?bnNRTXEvUGRtNGY1ZGNibTVaTnVqU2JhSXQwZjIrcmY5Uk1WNkROc005bWIz?=
 =?utf-8?B?bTRGVC9MdzZkUXNlRlZwaDFvbDZiZDM2SkM3SVJjWWJxQ1ZrMlBOeXB3eTk2?=
 =?utf-8?B?M2pIWjlZb04xSkFOTWJEb3JGeUg2OXJsSTdTREQwcHphOTZKZzdNMGl2bzNV?=
 =?utf-8?B?UEdGSGFRaUFhcEZsYzNxMHZPWFZKQW1YNmkrT0NLRjFRVTMzMldZVE0wektI?=
 =?utf-8?B?eC9xSVJvcHhNTDJvVTNhazVGSmVtY2tqK3d1U3BWU1lNa3Y0RUJ4dUtpanVZ?=
 =?utf-8?B?WVJHdVhCLzB4dFdaY215aCtPVkp4Ry9jSVN5Tm82VndUNlNkekJmOGt5MVNL?=
 =?utf-8?B?KzBweGtWZ1U5R2NwcGtSWHpZOHl2U0xwejBucm1NZnFZRFdSY1NGbWhuZ3lD?=
 =?utf-8?B?bHVadXBadENKL3JsWVZDMzNLWTJCdVloSWlTcDdHV3BHYmZtM0IvM0ZYYysv?=
 =?utf-8?Q?1Y3MLiOai747yxBwsUXAQKpn/glg2Ir9hhrm/2UMu7dK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4aa50a-e916-40ae-b0e7-08ddf24b72cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 22:26:41.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmp19onIk+RzmuJk4D081Swg7aW8hMypCQtb0p1Z33GkNmmYtkpIPHiuEFtgDwKhgX722cFnxhTgiKv0e77fwd1Kb7zE83b/U8zz/F7YdqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMiwgMjAyNSAz
OjA2IFBNDQpUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGUgTWFyY2hp
LCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgQ2F2aXR0LCBKb25hdGhhbiA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT47IGxrcCA8bGtwQGludGVsLmNvbT4NClN1YmplY3Q6IFtQ
QVRDSF0gZHJtL3hlOiBVc2UgQVJSQVlfU0laRSBpbiBndWNfd2FrbHZfaW5pdCgpDQo+IA0KPiBQ
cmVmZXIgdXNpbmcgQVJSQVlfU0laRSB3aGVyZSBuZWVkZWQgYW5kIGp1c3QgcGFzc2luZyAxIGlu
c3RlYWQgb2YNCj4gY2FsY3VsYXRpbmcgdGhlIHNpemUgb2Ygb25lIGVsZW1lbnQuDQo+IA0KPiBD
YzogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MDgxMzAxNTguZW9nZUJaUVQtbGtw
QGludGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+DQoNCkkgc2VlIG5vIHJlYXNvbiB0byBibG9jay9kZWxheSB0aGlzOg0K
UmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4N
Ci1Kb25hdGhhbiBDYXZpdHQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
YWRzLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19h
ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gaW5kZXggNTYzMTcyMmYz
NGY1My4uNThlMGIwMjk0YTViYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19hZHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+IEBA
IC0zMzksNyArMzM5LDcgQEAgc3RhdGljIHZvaWQgZ3VjX3dha2x2X2luaXQoc3RydWN0IHhlX2d1
Y19hZHMgKmFkcykNCj4gIAlpZiAoWEVfR1RfV0EoZ3QsIDEzMDExNjQ1NjUyKSkgew0KPiAgCQl1
MzIgZGF0YSA9IDB4QzQwOw0KPiAgDQo+IC0JCWd1Y193YWtsdl9lbmFibGUoYWRzLCAmZGF0YSwg
c2l6ZW9mKGRhdGEpIC8gc2l6ZW9mKHUzMiksICZvZmZzZXQsICZyZW1haW4sDQo+ICsJCWd1Y193
YWtsdl9lbmFibGUoYWRzLCAmZGF0YSwgMSwgJm9mZnNldCwgJnJlbWFpbiwNCj4gIAkJCQkgR1VD
X1dBX0tMVl9OUF9SRF9XUklURV9UT19DTEVBUl9SQ1NNX0FUX0NHUF9MQVRFX1JFU1RPUkUpOw0K
PiAgCX0NCj4gIA0KPiBAQCAtMzU1LDcgKzM1NSw3IEBAIHN0YXRpYyB2b2lkIGd1Y193YWtsdl9p
bml0KHN0cnVjdCB4ZV9ndWNfYWRzICphZHMpDQo+ICAJCQkweDAsDQo+ICAJCQkweEYsDQo+ICAJ
CX07DQo+IC0JCWd1Y193YWtsdl9lbmFibGUoYWRzLCBkYXRhLCBzaXplb2YoZGF0YSkgLyBzaXpl
b2YodTMyKSwgJm9mZnNldCwgJnJlbWFpbiwNCj4gKwkJZ3VjX3dha2x2X2VuYWJsZShhZHMsIGRh
dGEsIEFSUkFZX1NJWkUoZGF0YSksICZvZmZzZXQsICZyZW1haW4sDQo+ICAJCQkJIEdVQ19XQV9L
TFZfUkVTVE9SRV9VTlNBVkVEX01FRElBX0NPTlRST0xfUkVHKTsNCj4gIAl9DQo+ICANCj4gDQo+
IA0KPiANCj4gDQo=
