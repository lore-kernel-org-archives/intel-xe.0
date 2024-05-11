Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F57C25B10
	for <intel-xe@archiver.kernel.org>; Sat, 11 May 2024 01:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF50C10E051;
	Sat, 11 May 2024 01:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j073g5Ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C85B10E051
 for <intel-xe@lists.freedesktop.org>; Sat, 11 May 2024 01:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715391808; x=1746927808;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/GcVOVbfivf993yFNte0rRDPdqZHaUsm2hi2AIp8BXE=;
 b=j073g5Ut258TRSGG/Z4MZj7VxkR5E6zZZQsDAtjWKHN6IKDF46aUvz/Q
 r8AAzoKd4HnP64KPi53a+6e9gU0dOpnNClt0Pl1PqPDKT9hSpI0tVDFOI
 bOrDU3ACid+wqqjV/ktcKYgK5kuEtS/+WrNtEU2z/ert1CQlvYlCN992d
 smwmmXm5Gmsycj1oZqLXQ6gWICxcHkBO/RUpan4b5WsQOzetoS3gzLm0F
 J9rep1SJJZKmyOOYXUYveSZfdveCczPgXDrYy6wALZ17thlHkroWSVAKQ
 tvXcBEDSVLF8QO/i8SnI3144D4ULWL56UuTyFd4CM6e41ZyW6sJVMqw1T w==;
X-CSE-ConnectionGUID: k44ZfOxAR7Wm1hWeVd6upw==
X-CSE-MsgGUID: BdqCB7vXS+urYhXKRsi6FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11611984"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; d="scan'208";a="11611984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 18:43:28 -0700
X-CSE-ConnectionGUID: wHGCKthhRU+iAYwmtEcPWg==
X-CSE-MsgGUID: tCyAuEGpTCaB4LhKu1mMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; d="scan'208";a="60965637"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 18:43:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 18:43:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 18:43:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 18:43:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 18:43:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ce1Ue9hvpfTqshqnfBPiNjT1fYorcEscCUKnEg2Gl3Q1GB838K8zMiNczjsmpTE/6fnbwaYmHDAvEn0NDNFO3PlhlWQAVj4k2sP9MvPHvgeNGFx6sjzCZASg/q917lRhfiu9WcP5sPxIt9pg7HWtIFTiTyLdUSuzJsEGqvEEEXoX7d7q3obnqI36hNVd1r6jks7KAJg+x349eSI6beaGJ+0rgouLPOGCUQzJglQ4gOx5Bl+rd8dwRclg2upnoFa6AA3fG4u0ulTuHdPvXLEdJNqsR+fQceXy0mTQH96DIKq4R84uY/CsZi+9qhdj9GM1Ro3DIzeb1uHaVXRxPeL7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GcVOVbfivf993yFNte0rRDPdqZHaUsm2hi2AIp8BXE=;
 b=Paiyui30RWjY0mkcPCfKX02sI8bXT+t0yH/3vFT+/k5pAhFuKbShaj4Mfv/j9eg8pkx8Q2YEcO8z4vQSZljM0vL2iY6w5LTasIqdIvIorgJ6dqPgI7lyWHQQr5AtQdGn4l82vP29kpiG7xaZTJRHuVwSx7AMgUDSa6WHP4+CSWiKO171kfi0suU3kS79BsKIxgMonZWQmeuD9ZSqlllgK4bLVk20FnpBDz8AO5LUNeVTfkIWehISJ5ivjb1YJltFADsfO0JOKrVuEcGoeIjLF1mvPeRpwkLv5njXCi1VblPR0n4hSV/LiKPnkpZ4E5C+eFDycRPPTCXL1PDuhBSYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.46; Sat, 11 May 2024 01:43:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 01:43:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/6] drm/xe/guc: Extract GuC error capture lists
Thread-Topic: [PATCH v8 4/6] drm/xe/guc: Extract GuC error capture lists
Thread-Index: AQHaoCC131agsmLxDU6jXEdGVZ3XlrGRSO+A
Date: Sat, 11 May 2024 01:43:18 +0000
Message-ID: <66f6cab5388fb92fe090427406f1f2807bf10d25.camel@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-5-zhanjun.dong@intel.com>
In-Reply-To: <20240507014736.1057093-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7960:EE_
x-ms-office365-filtering-correlation-id: 68c838cf-14a5-433f-bfd7-08dc715bbbea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?d0J6VENmK2IyU1Jaczc0Ymt1UDh1eE1mbml1N3dJbEkyMUdJa0Fkc1R4cWRX?=
 =?utf-8?B?YngyL2JaL1U2Y1p5RDM5c2FHKzd2aVN1ZDM4MEJWek9RV2tGVW1RRTNGRjFu?=
 =?utf-8?B?RUhQU3hvdnQ3WEVzNTZrRnM4NVpWdHFBN0xRaFZyWmtVQlVzNFlGTlJhMkto?=
 =?utf-8?B?UkpzMmNDUVBFdE1tRzJDcCtzcUIvUVpGZ0h1cnRzZVFNaW9xdDdkRDBuMjJZ?=
 =?utf-8?B?OXhrb082MklZK2ZFUGE3T3QwVUpIY2RmSkw4NmhHOUxOaHY3RG1WQ3NtMWpz?=
 =?utf-8?B?MGtwVnZLMm1yeDNYb0ZTaWNDWkszOGtKZ2ZwdGU3NUlLS2FlQlFzNmUzWTlP?=
 =?utf-8?B?dGx6bGVjYWxSOHhYMW1Ka2ZKT3E5ai9mRG9DWmp2THBiUzFQV1NhOU0rUnpT?=
 =?utf-8?B?RGp2c01vRFdzem5LU1FZdFpsKzdkSUFQdlJKdURnaVpwRmlrVHlvNmQzcjJT?=
 =?utf-8?B?Y2l1dVBlS2JxTDI0N3pMbis4eHZTb0hzNnBhWldXTjJ6TStJOTFKQVJTWFhy?=
 =?utf-8?B?OWkvZUxIY241cmZDVENDaTJpaFJBekVvUHhkeGVmV2ZJMWw1NXlkd2xUYkhF?=
 =?utf-8?B?dzVZeFNJVmowdHR5dFRNMkRFTGFiRlgrUExHbHlGeWREVjYrZmtseDZSZksy?=
 =?utf-8?B?K2ExdWNKQ243U3dMc0kvZHVIaG1DT3ViSWxCbENuMGE5MUprTTdPVUhzYlJI?=
 =?utf-8?B?TWpTYXBoZWk5cEk4bXdXdlR3bVYyVkNuSGxFL2ljZ3EvYmpZSjVkVENWem9i?=
 =?utf-8?B?KzdyTlZkcWhMcGJNMEsyU0Y2NWQzWitVVU9VT2s1RGNPWDFxS0ptTzNQSndT?=
 =?utf-8?B?U1RldHN2d09FSlcyY3lackdvOUxmT3VCWkZvSnlYT0lBSmpEK1o4QWNhTXJQ?=
 =?utf-8?B?TjR1NXptTERhakZyWUVJVEVuNnlRV3VWSGwyU3RYcWhsWllpeVVwSmpTajdG?=
 =?utf-8?B?bWxFaXhPYTAybUxSdjJYWEQ4MTN3bjJocDJwelc4dHNtdnZwa3dYTzYyL3dt?=
 =?utf-8?B?Yml0UXVwcG0zY1h2bzJOdk9uQ0lvckRRNi85Y1NTT1M2T3IzZ2xEanQ1Z0Zv?=
 =?utf-8?B?aGRWT2NqWFFjd3Q2YWdKengvWHZRUFZxN1hBcG52SzlSWEpZU09Eb3ZSZjZO?=
 =?utf-8?B?OWNSc0J1bVV2UHBVZWVqZlY1ZHVzd3hBZ3ZjekRkY00ranJIbDEvNTVQbjEr?=
 =?utf-8?B?Qkh5TmJFbGE4WG9IUzB4MzNUNWkzYWFIUkJmL1NsNHJCYWN1bGdLaXpTLzc2?=
 =?utf-8?B?Y0xLYTU5YktLaWdrbjJYRjFTc3UrdEtwWUV4c3V6NVZ6QmdVL0VhUC83ek9o?=
 =?utf-8?B?QzBaSnJ3Ky9WMmJsZ28ydGM5NFdBQk1hLzZSWXRUUmJDS0NxWE8xM2FGRjNH?=
 =?utf-8?B?MUszRGx6Nm92NTd6YnlCWDhWVUwxY0ZFSmc4YWZidzNFODRDVkh2SGR2T0px?=
 =?utf-8?B?dTNpc0lxeldIdVBMQnBWVWtzVkpGK2dFNUJEcCtNM0pFUi80YjR4b245bjZV?=
 =?utf-8?B?NTBnSVZtS0NMTmV1RXkxTlZWSDNVcCtZVWs5YXNDdWpDaUlReXRXZ3pVWW5V?=
 =?utf-8?B?NTc2VkFjdE5wcmZqSDhjaWhhdndaeDFmQ1BrWEptMXNjd3hmcytZQXliS0Q2?=
 =?utf-8?B?bDdJd0dLMy80cEZndk5PTktRa3VDY04wMkRWTGdyeEVWU1grOWVyTHlQVkJB?=
 =?utf-8?B?anVpaE13UTZjWGIzRE11K1h4SWhKbUh0TGcyWW5YbTNScEJVZWFDYmFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHFMdlpIMmJSQlNETnJtNzdSWDBnUWVoZm9oNzNYeUo0bGNqK2dpcTArdlhD?=
 =?utf-8?B?aWZ6ZlF1aHdXTzJaNU9sVDZlRURGY2haUkhlaHNFVDIyRVJGcTRicW50MERw?=
 =?utf-8?B?QnlNRCs5ZjZGSXp4K1htS2JqMjRjd1pRQVFROUViRklQd2RBNE9UZE5mbXlt?=
 =?utf-8?B?VWdEbitnUFZpTGx4WjhHUDFHMWNNSTk2eVVabnJvNSthKzZaRXIxSXU2SU1L?=
 =?utf-8?B?MWc4elg0OUYrbmhiZDZHVlRDNEpqR0JORko1LzA0Z29nRS9lVnJ2QjNwdXpZ?=
 =?utf-8?B?VWpUSkJWUE9KZ0NCd2VyNEV2S2lsNGNSdFloUTZHY01zcWNHRVgwZk45WHda?=
 =?utf-8?B?SEw2QlpJQ1dqY09SMUp4MFJnRVRoM09kcE40Zi9rWlF4SnFKZnZUNFc2Vkdk?=
 =?utf-8?B?alFFdWdLVGdRZTZHMjcvZG9rUzFXeWxiVXpxSlZqRWZObnJTSlVUdm1uMUQw?=
 =?utf-8?B?Nld2Zmpxa1hVM0tNNHhnMG9JYnlJOXlCbW9YcDdaWU1QZnJmRVV2MmVTc0tU?=
 =?utf-8?B?TDJ2bjVPMDZsN2hiSUlrVjZGeGlMdFVMRzlORVpNbGVuaGRaaEowVjIzbXNp?=
 =?utf-8?B?OU5uNjIxWnpjVEFrVU1VNmpIZEt1a1p1VkgwV0hDZkVOTEs4aCtZSWR5Uldn?=
 =?utf-8?B?bXdxTTA1QVhJTnlTcFdNOC9wVmg1WHJVb0RZUUY1cjkvQUtpS0JNc0E5YUpz?=
 =?utf-8?B?Z01adVpjUk1aZFc2NXFlaGVkRGNOL0xWeU15VG5nL3ZmSkhyRFhGR09xU0du?=
 =?utf-8?B?enBaRmdvanlXRkpTR3gxK0JUQjRTeHQ2cmR3ai9Pa3VqV1kvdXJVU2tqb2Fm?=
 =?utf-8?B?bk5zbjBFTzdRNTFReHBHRWdQbUM5ZzZGbEZzN1Z0Y0FCcjZkWUN5OENFT2pO?=
 =?utf-8?B?SFFtU3Z4cWh0WXUxV3ZVaTlHUXVrU2tldjFUS2xRZVJWRzZYcUVyWjRUUkRN?=
 =?utf-8?B?ZWFZdmhuUW4rRmh2ZjRsNnloVFJkR05Fd3ZaWnp1ZXBoVVlDQUdBMUgzU3hB?=
 =?utf-8?B?UFEyQysrUDU4azExZ0pBY2NOU1RCU2JHRWZ4Q3J6cDFycFEzWGw1SmUvWlU2?=
 =?utf-8?B?cU55ajVUVDBTa25WWjZqdUw0S1BERmlZTXBnK1FlNWxrQW0zSk55Z24wczBH?=
 =?utf-8?B?dFcrb2hXWURuOUE5ckFIT3BGTHdRVGhMMlVxRTJwZCt0KzhJZWRuQ3N1ZUk1?=
 =?utf-8?B?WjVpSHhZbXQzUHVHYnY5WEhML0VDM2pteDJVR3NzbCtlYWl0Y2MwQVVNVjVS?=
 =?utf-8?B?T2NDMHJQNXM1eWRSYk5MeXduMUhiWll3RkxQeGErYmJtMHpUbnQ4Zks5YjNX?=
 =?utf-8?B?UFIzZzhBV2JNdVUzS0hPQ25sVzhWSVFscEJyU3lKczlWMGlxamtDL3d5ejRP?=
 =?utf-8?B?MUVWN2NrMVdTY0xtMUZkdjNNV3NpTm5EZWhLejMvVkJWQUdYS2tUSUlNMEFV?=
 =?utf-8?B?TVFpaC9tZnowZ3BVK0oxWkh4QnBiVHdQVmlOQldiaERSMnpEeFlvTllFWlBD?=
 =?utf-8?B?ZEl5ckpPOVY0MmZTbGNDZkFXdHVMV1J4djYvRTZxcFNGOHkycXM1QU0rbnNp?=
 =?utf-8?B?SURDU1JmWDREdmtDWnRhUmRnWEpPcTBpT2ZVQkJCY1VKL3MzWm9OeWorNnVh?=
 =?utf-8?B?OU11a2tPTmg0eCt6SXhqb1pNN1duUVBuSjBmNTRVZnRqT1lwUHRoSzJBTW14?=
 =?utf-8?B?d1FCbXdhRGpJbjdEdUdyMVZicGMrK1lOd2RYR2d5WE5ORmdUZEtYNXpaQ3Bv?=
 =?utf-8?B?Y2pZUGZzY3ZqODIxcEN5c24zbnBQNkVBNFhIT3d5RVJCVkxCd0FCR1lwZVor?=
 =?utf-8?B?UUhQSCtYdE5vMERVZlh2S2hRQ0ZmY0VuNXFLVDhNM3pXWmZMdUtCUnZ2cENo?=
 =?utf-8?B?MFcrcG9UK3BER3hMcjRQUTh2QWFzNUdHY1FMbko0dlRkMDdKYmtldXE4cGta?=
 =?utf-8?B?R3FMcWFsaG51VDlLTlRYRERqZCtIeTRHMVZSZ09MZHVreW9JVzVZNUZUVGY5?=
 =?utf-8?B?SVhDTk9ZZkczMEF6bHNNWkZWek80WWpDNzY3dnRxNzJQS3JoTnM4eGJhS0lU?=
 =?utf-8?B?MTVBSldCb2tReFFzb2t6eDJ2dTdaZUJ4d2dQSk9GUjdDN00xQzFXanB2K3NX?=
 =?utf-8?B?czIxcmNxWjdzenpkb1dyTERqVDlhWm11OFJBVDJydm9OM1JJN2hWcmE4OHZr?=
 =?utf-8?Q?bpO+9z217RGikvghH2Ow5IE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C80A83BDBFF2F488D5BFDBEA316AD6D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c838cf-14a5-433f-bfd7-08dc715bbbea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2024 01:43:18.8324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umsH2ZnV7uPer0U4AAYDraY8sTT+9OJkk1Mg6L6ddiL3HQUgDRrXXYmxqlEnFgZS8ykmTmyysREUH9dp1yH5eeyiEqq6YOsq1nqt242nD/fuGVUB90NJhY87IDyq4cZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
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

T24gTW9uLCAyMDI0LTA1LTA2IGF0IDE4OjQ3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
VXBvbiB0aGUgRzJIIE5vdGlmeS1FcnItQ2FwdHVyZSBldmVudCwgcGFyc2UgdGhyb3VnaCB0aGUK
PiBHdUMgTG9nIEJ1ZmZlciAoZXJyb3ItY2FwdHVyZS1zdWJyZWdpb24pIGFuZCBnZW5lcmF0ZSBv
bmUgb3IKPiBtb3JlIGNhcHR1cmUtbm9kZXMuIEEgc2luZ2xlIG5vZGUgcmVwcmVzZW50cyBhIHNp
bmdsZSAiZW5naW5lLQo+IGluc3RhbmNlLWNhcHR1cmUtZHVtcCIgYW5kIGNvbnRhaW5zIGF0IGxl
YXN0IDMgcmVnaXN0ZXIgbGlzdHM6Cj4gZ2xvYmFsLCBlbmdpbmUtY2xhc3MgYW5kIGVuZ2luZS1p
bnN0YW5jZS4gQW4gaW50ZXJuYWwgbGluawo+IGxpc3QgaXMgbWFpbnRhaW5lZCB0byBzdG9yZSBv
bmUgb3IgbW9yZSBub2Rlcy4KPiAKPiBCZWNhdXNlIHRoZSBsaW5rLWxpc3Qgbm9kZSBnZW5lcmF0
aW9uIGhhcHBlbiBiZWZvcmUgdGhlIGNhbGwKPiB0byBkZXZjb3JlZHVtcCwgZHVwbGljYXRlIGds
b2JhbCBhbmQgZW5naW5lLWNsYXNzIHJlZ2lzdGVyCj4gbGlzdHMgZm9yIGVhY2ggZW5naW5lLWlu
c3RhbmNlIHJlZ2lzdGVyIGR1bXAgaWYgd2UgZmluZAo+IGRlcGVuZGVudC1lbmdpbmUgcmVzZXRz
IGluIGEgZW5naW5lLWNhcHR1cmUtZ3JvdXAuCj4gCmFsYW46c25pcAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfY2FwdHVyZS5jCj4gaW5kZXggZDJkZjAyNzA4MWI1Li43MWQ3YzRhNTg5MjUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYwo+IEBAIC01MjAsNiArNTIwLDU2MCBAQCBz
dGF0aWMgdm9pZCBjaGVja19ndWNfY2FwdHVyZV9zaXplKHN0cnVjdCB4ZV9ndWMgKmd1YykKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWZmZXJf
c2l6ZSwgc3BhcmVfc2l6ZSwgY2FwdHVyZV9zaXplKTsKPiDCoH0KPiAKYWxhbjpzbmlwCj4gK3N0
YXRpYyBzdHJ1Y3QgX19ndWNfY2FwdHVyZV9wYXJzZWRfb3V0cHV0ICoKPiArZ3VjX2NhcHR1cmVf
Z2V0X3ByZWFsbG9jX25vZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQo+ICt7Cj4gK8KgwqDCoMKgwqDC
oMKgc3RydWN0IF9fZ3VjX2NhcHR1cmVfcGFyc2VkX291dHB1dCAqZm91bmQgPSBOVUxMOwo+ICsK
PiArwqDCoMKgwqDCoMKgwqBpZiAoIWxpc3RfZW1wdHkoJmd1Yy0+Y2FwdHVyZS0+Y2FjaGVsaXN0
KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgX19ndWNfY2FwdHVy
ZV9wYXJzZWRfb3V0cHV0ICpuLCAqbnRtcDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qIGdldCBmaXJzdCBhdmFpbCBub2RlIGZyb20gdGhlIGNhY2hlIGxpc3QgKi8KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKG4s
IG50bXAsICZndWMtPmNhcHR1cmUtPmNhY2hlbGlzdCwgbGluaykgewo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm91bmQgPSBuOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9kZWwoJm4tPmxpbmspOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9IGVsc2Ug
ewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgX19ndWNfY2FwdHVyZV9w
YXJzZWRfb3V0cHV0ICpuLCAqbnRtcDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC8qIHRyYXZlcnNlIGRvd24gYW5kIHN0ZWFsIGJhY2sgdGhlIG9sZGVzdCBub2RlIGFscmVh
ZHkgYWxsb2NhdGVkICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShuLCBudG1wLCAmZ3VjLT5jYXB0dXJlLT5vdXRsaXN0LCBsaW5rKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3VuZCA9
IG47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKGZvdW5kKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9kZWwoJmZvdW5kLT5saW5rKTsKPiArwqDCoMKgwqDCoMKg
wqB9Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGZvdW5kKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBndWNfY2FwdHVyZV9pbml0X25vZGUoZ3VjLCBmb3VuZCk7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoHJldHVybiBmb3VuZDsKPiArfQphbGFuOiBJIG1lbnRpb25lZCB0aGlzIGluIHJldjYs
IHlvdSBjYW5ub3Qgc3RhcnQgcHJlLWFsbG9jYXRlZCBub2RlbGlzdCBhbnl3aGVyZQppbiB0aGlz
IHBhdGNoIHdoZW4geW91IGFyZSBvbmx5IGFsbG9jYXRpbmcgaXQgaW4gcGF0Y2ggNi4gTG9vayBi
YWNrIGF0IG15IHJldiA2CmNvbW1lbnRzIG9uIHRoaXMuIEFsc28sIHRha2UgYSBsb29rIGF0IHRo
ZSBvcmlnaW5hbCBpOTE1IHBhdGNoIG9uIGhvdyB0byBpbXBsZW1lbnQKZ3VjX2NhcHR1cmVfYWxs
b2MvZGVsZXRlX29uZV9ub2RlIHdpdGhvdXQgcHJlYWxsb2NhdGVkIG5vZGVsaXN0OgpodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDc5MDIyLz9zZXJpZXM9MTAxNjA0JnJl
dj0xCihub3RlOiB3YXRjaCBlc3BlY2lhbGx5IGZvciB0aGUgdXNlIG9mIG5ldy0+cmVnaW5mb1tp
XS5yZWdzIHdoaWNoIG5lZWRlZAphZGRpdGlvbmFsIGFsbG9jYXRpb24gc3RlcC4gQWx0ZXJuYXRp
dmVseSB3ZSBjb3VsZCBzcXVhc2ggcGF0Y2ggNCBhbmQgcGF0Y2ggNgp0b2dldGhlciBhbmQgY2hh
bmdlIHBhdGNoIDQncyBjb21tZW50IGJ1dCBub3Qgc3VyZSBpdCBtaWdodCBiZSB0b28gbGFyZ2Ug
YQpwYXRjaCAoY2FuIGRpc2N1c3Mgb2ZmbGluZSkuCgo+ICtzdGF0aWMgaW50Cj4gK2d1Y19jYXB0
dXJlX2V4dHJhY3RfcmVnbGlzdHMoc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QgX19ndWNfY2Fw
dHVyZV9idWZzdGF0ZSAqYnVmKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpn
dCA9IGd1Y190b19ndChndWMpOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBndWNfc3RhdGVfY2Fw
dHVyZV9ncm91cF9oZWFkZXJfdCBnaGRyID0gezB9Owo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBn
dWNfc3RhdGVfY2FwdHVyZV9oZWFkZXJfdCBoZHIgPSB7MH07Cj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IF9fZ3VjX2NhcHR1cmVfcGFyc2VkX291dHB1dCAqbm9kZSA9IE5VTEw7Cj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGd1Y19tbWlvX3JlZyAqcmVncyA9IE5VTEw7Cj4gK8KgwqDCoMKgwqDCoMKg
aW50IGksIG51bWxpc3RzLCBudW1yZWdzLCByZXQgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoGVudW0g
Z3VjX2NhcHR1cmVfdHlwZSBkYXRhdHlwZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZ3VjX21t
aW9fcmVnIHRtcDsKPiArwqDCoMKgwqDCoMKgwqBib29sIGlzX3BhcnRpYWwgPSBmYWxzZTsKYWxh
bjpzbmlwCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghbm9kZSkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbm9kZSA9IGd1Y19j
YXB0dXJlX2dldF9wcmVhbGxvY19ub2RlKGd1Yyk7CmFsYW46IHNlZSBhYm92ZSBjb21tZW50IG9u
IHRoZSB1c2Ugb2YgcHJlYWxsb2Nfbm9kZSAoYXMgcGVyIHJldiA2J3MgY29tbWVudHMpCmFsYW46
c25pcAoKPiArc3RhdGljIHZvaWQgX19ndWNfY2FwdHVyZV9wcm9jZXNzX291dHB1dChzdHJ1Y3Qg
eGVfZ3VjICpndWMpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgYnVmZmVyX3Np
emUsIHJlYWRfb2Zmc2V0LCB3cml0ZV9vZmZzZXQsIGZ1bGxfY291bnQ7Cj4gK8KgwqDCoMKgwqDC
oMKgc3RydWN0IHhlX3VjICp1YyA9IGNvbnRhaW5lcl9vZihndWMsIHR5cGVvZigqdWMpLCBndWMp
Owo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBndWNfbG9nX2J1ZmZlcl9zdGF0ZSBsb2dfYnVmX3N0
YXRlX2xvY2FsOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBndWNfbG9nX2J1ZmZlcl9zdGF0ZSAq
bG9nX2J1Zl9zdGF0ZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgX19ndWNfY2FwdHVyZV9idWZz
dGF0ZSBidWY7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBuZXdfb3ZlcmZsb3c7Cj4gK8KgwqDCoMKg
wqDCoMKgaW50IHJldDsKPiArwqDCoMKgwqDCoMKgwqB1MzIgbG9nX2J1Zl9zdGF0ZV9vZmZzZXQ7
Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIHNyY19kYXRhX29mZnNldDsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgbG9nX2J1Zl9zdGF0ZSA9IChzdHJ1Y3QgZ3VjX2xvZ19idWZmZXJfc3RhdGUgKikoKHVsb25n
KWd1Yy0+bG9nLmJvLT52bWFwLnZhZGRyICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoChzaXplb2Yoc3RydWN0IGd1Y19sb2dfYnVmZmVyX3N0YXRlKSAq
IEdVQ19DQVBUVVJFX0xPR19CVUZGRVIpKTsKYWxhbjogb25jZSBhZ2FpbiwgaSBkb250IHRoaW5r
IHdlIGNhbiB1c2Ugdm1hcC52YWRkciBkaXJlY3RseSB0aGlzIHRoaXMgYW55bW9yZSByaWdodD8K
aSBkb250IHRoaW5rIHdlIHVzZSAibG9nX2J1Zl9zdGF0ZSIgdW50aWwgdGhlIGVuZCBvZiB0aGlz
IGZ1bmN0aW9uIHRvIHNldCB0aGUgbmV3IHJlYWRfcHRyCmFuZCBmbHVzaCBmbGFnLiBXZSBvdWdo
dCB0byB1c2UgeGVfbWFwX3dyIGJlbG93Pwo+ICsKPiArwqDCoMKgwqDCoMKgwqBsb2dfYnVmX3N0
YXRlX29mZnNldCA9IHNpemVvZihzdHJ1Y3QgZ3VjX2xvZ19idWZmZXJfc3RhdGUpICogR1VDX0NB
UFRVUkVfTE9HX0JVRkZFUjsKPiArwqDCoMKgwqDCoMKgwqBzcmNfZGF0YV9vZmZzZXQgPSB4ZV9n
dWNfZ2V0X2xvZ19idWZmZXJfb2Zmc2V0KCZndWMtPmxvZywgR1VDX0NBUFRVUkVfTE9HX0JVRkZF
Uik7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgICogTWFrZSBhIGNv
cHkgb2YgdGhlIHN0YXRlIHN0cnVjdHVyZSwgaW5zaWRlIEd1QyBsb2cgYnVmZmVyCj4gK8KgwqDC
oMKgwqDCoMKgICogKHdoaWNoIGlzIHVuY2FjaGVkIG1hcHBlZCksIG9uIHRoZSBzdGFjayB0byBh
dm9pZCByZWFkaW5nCj4gK8KgwqDCoMKgwqDCoMKgICogZnJvbSBpdCBtdWx0aXBsZSB0aW1lcy4K
PiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqB4ZV9tYXBfbWVtY3B5X2Zyb20o
Z3VjX3RvX3hlKGd1YyksICZsb2dfYnVmX3N0YXRlX2xvY2FsLCAmZ3VjLT5sb2cuYm8tPnZtYXAs
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxv
Z19idWZfc3RhdGVfb2Zmc2V0LCBzaXplb2Yoc3RydWN0IGd1Y19sb2dfYnVmZmVyX3N0YXRlKSk7
CmFsYW46c25pcAoK
