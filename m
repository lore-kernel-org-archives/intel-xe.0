Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EEE606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIPTkOwo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651C810E638;
	Tue, 20 Oct 2026 13:18:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7241810E249;
 Tue, 20 Oct 2026 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792502277; x=1824038277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ek/O7SfjyFAEh0UTHUCS9KIKX0gQnFhQ5/Ybn914bZ0=;
 b=iIPTkOwokSltPhNsEani2tVpIT7HDVrIIw3v86JtQ3SEkaelzEDUJcQo
 DyrZ3tl3MWU/ri53QDWJdNJUH+bVOB/UKmLUoyu7kpO7QCYegbHgAfOWB
 01uI8KKcabgbVyn+kN94z85vBOpeV6es3lEc0M2kjO1BIesb7RkgkBXMH
 ldeTzRDte/lu1F4cvaL8gB584BZgcqB3FBUZGCfJBoGcnlOlZjkP3mkzi
 ehvxYsJjTKCCmLUDPRfmrkecJpRjdb4vJ2dCIkGhYUapztGFxz6F6Aild
 2ZvIwj1cLqi+6TXepK2zWlyZxOtDVCR42tW+Vi6+CHlZMSh+vWIM3jKJ8 A==;
X-CSE-ConnectionGUID: rt4RpNhhRrmHHjJW6+mFLA==
X-CSE-MsgGUID: 3gpd4bP3SgC9lrpXpBcj5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1307269"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1307269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 06:17:57 -0700
X-CSE-ConnectionGUID: Ak+yuzPKSOmN+3w3uxgIXQ==
X-CSE-MsgGUID: jJ3DQvg5Tfe1EmR6Jbtr+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2871106"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 06:17:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:17:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 06:17:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEgJoUH3JLatLFtZqi+pyMoCsRc89wdo4S7fWJjD5WD4d3SAtEH3YE4HRi6mDOZ6meFTkibKaT1j2laRopQhdwNM4Ovd95dTmQCqtbmAj78rRccm/lOsNdLIzZxXuDbhyJz0weA+fWlkxrkIuGhfiliA6HcE2j84oE8fw8G+isFe+Ga3WLwJn/w6ZRdyPzn/UXxWTuReQvjyBBczQKASOqXPvvKoD9mJ0nTRwJK4L6L4WMDgp62tP/3cqLxe+AnNIj34CwzHem1r4xVk8AQAwUpjl6m4SFLpZdPruNsYpTP2gVFATswrD2up3onVHrX95M97ilwQGu78ezRlCjhrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek/O7SfjyFAEh0UTHUCS9KIKX0gQnFhQ5/Ybn914bZ0=;
 b=fQ1aC3FW7A5jxAN3cr23lyjxXEZCZqi/EJ38tFO1W/so/+okhknNbcyDp4uiEyO/D5um+iO+Nje2uxbOAhTGR+oSafuixrdc4vk19m5s8p540HH+BribjID/7NX969jqIgHQzXqWjaP9MKQYqPFwqYD6xfQ8rtrTJA1Gb7MgaL6bm64tFoCB4bWclDcBiFhsiU8b9HY9tg6XqjeQJNHxd8xXDk2XH8Ra9O8VX3jR2bHhv3ittvo2R06RzAWMAWa/GhC+MnreUi4t0LB2RzLIkqnVDn8cbWGvQ1DLlblZKvKjY7cxjmEdFK7HpVSMyDQM6xSHifgGd/p9/eJbvxliJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 13:17:46 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0522.016; Tue, 20 Oct 2026
 13:17:45 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Topic: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Index: AQHdVjbCLSRiLaGB10Sxp/I/rx57u7cGb++AgAAObAA=
Date: Tue, 20 Oct 2026 13:17:45 +0000
Message-ID: <5c29908de89aeee94e81fc510566c03fd73662a4.camel@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
 <20261020122607.925427-1-j@metarealtyinc.ca>
In-Reply-To: <20261020122607.925427-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BL4PR11MB8871:EE_
x-ms-office365-filtering-correlation-id: 1df311f8-3c57-4bc9-da7c-08df2eac8796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 3LU0HNPoinT7lUUTRaZmz0kcNNjXAUzPypnX+Jub40stXFYjyFh9P5nhATdtVDbLfNG5BDPUVqwPxfaH5Q4frCig/eAb80MF/cnzwtWE7HWIoIO38b4d4YQaJ8F44fzqLfNktklglqZBxcwuPa8558AP7LlLc3jXV1zisCcfac0NS+l+OXcxZGFZFU58LHL53ARXcvWgyw+Wi9RNncXXAzW9F9hKLwDXIwjfWj0sl8DwapKR3CK+VeGmrbBcauwD4sCyxJFE8N0y2P9r9WQqb2baVLDEy3maSW4Nyz+SKWh8S7jJI7oabHL1RKLVA5YWOXF17ndrs9S3vDQ3BPPX19Ua0oF8nP1G7kUqljyypm503alKdUfs56EP10UTh/BVdzkATXgWuvsxip9BQYkvODmU6aPxCIRUFIEkofHy3wGBFJIdgTWnLSYiATKHo1BukLF9xNgqXoJnZWExO5+eXIZN/B6qvULiTvg2b0EcOk19NKYV/aPxGS7Jqwris7sVrwdpPdbXhKCNmnTX98EbHC99AorezLGUrhJPb7+lsDj+vlreJ+Fz95DXiA3mQe0JvgCAWhTtMJGBUHm87nDAmunXfvAW7YZBw4wGvdYCR1U0XqbFU1k3dMJHTKFwk5fX6Cx3ndI2CFCWIZskkCpBFNanXTr7gMjep4U4IlM16cg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ti9KM01aUVN1N2pDVHUyam5ZUGs2cHhGbUNXN3ZzakY5a1R4NCtkZVpCbFVO?=
 =?utf-8?B?aERYSkdBTXZMYTVDaklwUWhHakxSMTlOYW1CSXgwL2RDRm40cEUvakJGK0xC?=
 =?utf-8?B?VHk5ZUVxZ0lPemIvKzZqc2hTUG5jUzVlVERUenlCRVEvY1B5OWRmaUNoRVdj?=
 =?utf-8?B?N28wd0VvTGlPcEJydVpQS0pzekN3cFM3UW1DcUhOM3ZTcGhyU1d4L08xUG9I?=
 =?utf-8?B?SlNHTi9IS3A0RmN4Y2tTSWR6V2hVWXliNTlycnMrcm9PaVlCbVF5QlRPTlcx?=
 =?utf-8?B?WFpTb1Ewa1FpUVZuVFpoR2xxVHltRGYzUE5sQjUwU0RsdkdFcFJUZDRJbWVM?=
 =?utf-8?B?QjVzZXhLa01BMkY0NmUxQmJDcS9ZUGVTS0F0Z3M5SGhvNWtKVmN6K004QUZ6?=
 =?utf-8?B?ODBaZDg2cWtYYjBSSlpDbUlnZVduTmVEek9RNzJsY3FwL3M3aUZCd0kxeERD?=
 =?utf-8?B?YlptbkgyOGh4UXZzd3owcmxXNnZTNnI4M3J1Ykxudlh2V3hwdDJvUmlWYjB6?=
 =?utf-8?B?TUROZ1RvbnJQcStpc3gwb2FTUGN4UXo0cUlGRnFaamxPdWw5dTRqU1ZqRWcy?=
 =?utf-8?B?Z3QzZ2pUcWFsTDduZ2xyTUFlZldxQkZad0Z1eUd2aWxzckpwK3pTbzIxU0pP?=
 =?utf-8?B?MnhkQXVYcGN6ajlGVEIzNTRHQlZLMmw2Zk5aaWllTUZsSjFwc0VwK0EvY21I?=
 =?utf-8?B?VHQ1SWZzeUlqTmpzUnZ2bkJNUzFmclBESEJ3eFJDWmhLS3ZPc2l2SDdWK0Vu?=
 =?utf-8?B?MVBHVy9VVXdFSmtkWnc3ajA2NnA2YVRUVy9ERlV4eW1RN05WeVBhRkdNeVNY?=
 =?utf-8?B?cHNOY3JuMy9lVGdrdlRTWmFXZ0hqd0VKem5yb0NYK0FoOXppNGhQTWhNMFJU?=
 =?utf-8?B?L0ZnSC8zMVJwN3ZwVW5iUDlETUhmV2I4RFByRnZXUkNJeWN3VkVnYlp2MDVl?=
 =?utf-8?B?VzVzV1d3YVVWTkZkTWk4MHFHeFY4TFpIVWs0bkRMQ3VXSnVzNWg2T3l6YXU4?=
 =?utf-8?B?dTA2Z2tLaDQrWXluSndCNjdNdUFaNjBJeVFyb09jUWRKbDcvWkFoTkpEeTVH?=
 =?utf-8?B?TXpwaXJvMW5PZXNyRTJSQzJUbk5zOG8zbVNadVVsVm1EbGdNYW9YeXlUbmp0?=
 =?utf-8?B?UUN6bnc0SW5Td1c4Y0s1ajM2OFdjQ3QxL0hqTU9mbjE2ZDhBdXJpRVZuUlF6?=
 =?utf-8?B?eW10K1V6S2ZBdFd5aXQyRUhYY2owMHlRS244UnJxcVh4SndLUXI5VWw5d1FG?=
 =?utf-8?B?anFPMEExeTcrWkg4b0Q0aHRnNmlVeUl0Nmh1M0F0R0dLOWVkN1RYSGZNU2du?=
 =?utf-8?B?ZzdDMksxLzY1d3hJYUlJYlE0MUQxdmNTMjVZbDFlTVhlOXZ0WTVDWFpTajhH?=
 =?utf-8?B?dW5oTTJsTi9BRWpmaEJGYXo2VVNaZ0M5TW1IdjhTRlplVmVkMkh5RlRMSWJr?=
 =?utf-8?B?R1M1SkVTSmtrL21TU2E2alNOS2RHSVRaNENJK0w5L3MvT0JZYnY0c2krWjF6?=
 =?utf-8?B?MmVpcmJoY0Q3VGdNZHVDUFRMeHBESmF1b3EvRGFiTXVtbzJsQ1o1WHQ4MVBR?=
 =?utf-8?B?eFM1Wks2b0IrK0toQ1lFTkxEdVlhcVNXODRyc3RVWWJQZCt3cjNLQkkvNWNJ?=
 =?utf-8?B?Rm5GMEsvKzYwVmd3bFZYK0hrL1hKZW5RaHVJZEhuUW14UHRjQ2ZWU0s3N09u?=
 =?utf-8?B?ZktHTUlBeXpJSTBLa3gvRm9GWWFXOVRpelVnVXZOZDdkNis5d2FGb0R5VkVN?=
 =?utf-8?B?QzB1V2wxUExZVS9uRTQ2K0lib3JXRk1pQ2hTdURIQldCcmZUbi9PS1N4TWVl?=
 =?utf-8?B?SnJmVE5JWFhZZmpaT3lFbFZvakZmTHlUZm92aHNQdmhEMC9sT1BWeDhINVh4?=
 =?utf-8?B?NWMvZGdoampGVVhIQTJvOUpoVjU1WHBhTHo2NFVwc0lzT0JNMy9pQi82b0gy?=
 =?utf-8?B?dVdjTzRtdm0vQTVVcUVkT1JMY2JNbDJIemk4NTZySDdnN09SQk0vR0t6T2hX?=
 =?utf-8?B?c09yWERaNThmZGhndlpSNkI5SSsrbjMrak5IZW1ZS3czMi9rVWxpVDhIZUZO?=
 =?utf-8?B?UWQ5MVZQNi9ZSGhhMnRobG1pazAyL3I2bzA1d0Nad2lhM2tTRmhtZnVaUUor?=
 =?utf-8?B?YzdWb1JBdk5KMll3cTRRNTMxT2h6cmdEcGxTd3ZSZE5LSTFFZFREUldaWHFU?=
 =?utf-8?B?R2hsQkVOaUU1amdzQTU3UCtZdDh6aDRmZ1AwRlNsanZSbHlnQlNJNTU2WnVy?=
 =?utf-8?B?STRFbVJkWXNNVTY3TlR6akRUdkFHb0dlWHEwU1MrL1Z6bFdlS3kxMGlaSWdX?=
 =?utf-8?B?YXNKNWkzWGp3TkpJeFlWYVlXaGhPZ2w2QURqRng5TmdEUnpUM0Q5T29VRi83?=
 =?utf-8?Q?+2Sd4SVkBw4JnpNQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2442DB2DF20F7047953FE8CF7342D68F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J+GFbWtIg3d9WMRbGcgiF7xRsTnEeyAOxuIUoDBDC+YQaTe1UJoR0VYVL+M77vAIcoiQ+fV91SshloMncToBdSwf/C02wK+y0U6JRf4QzubCPUhAx2Fs2WpPsNStMNIXfP5I3/RLjm5uL3MlK82VoTdrzB/Ld9vsQp/+HTHl/4GntuJt8nYbXEHTebVR6O+O4+Sc/KMpfgNtzIVk2kQ0uWfLLvY1HQlIi7DNScVaByU4GYc1Lmumd1Tukwmns6Xv7yd3WM9aZNOudaD499b4bvH09BTP2ietCflobITGKLcQMmWMau2u6jPXewp1BucYnQUWqiaX8Deys85RKOTPYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df311f8-3c57-4bc9-da7c-08df2eac8796
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 13:17:45.3901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCTfiqp4aAKKMITDiQ0/0TX09trYke51VE6FC0zeoxEVR/8oMUnBM74Eq05ViUElU1UTC7Ur1iPojrBJbZ3nZUlwZjBkYpukj35/HfHTdJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTEwLTIwIGF0IDA4OjI2IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBIaSBKb3VuaSwNCj4gDQo+IFNvcnJ5LCBteSBsYXN0IG1haWxzIG1hZGUgdGhhdCB1bmNsZWFy
LiBZb3VyIHBhdGNoIGFsb25lIGRvZXMgZml4IGl0Og0KPiB3aXRoIHRoZSBBUyBTRFAga2VwdCBv
biBpbiBQUiBBY3RpdmUsIFBhbmVsIFJlcGxheSBpcyBzbW9vdGggaGVyZSwNCj4gaW5jbHVkaW5n
IGFmdGVyIHNjcmVlbiBvZmYvb24uIE15IFRlc3RlZC1ieSBzdGFuZHMuDQoNCk9rLCB0aGFuayB5
b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQo+IA0KPiBUaGUgUkZDIHdhcyBvbmx5IGFib3V0
IHBvd2VyOiB3aXRoIHRoZSBBUyBTRFAgYWx3YXlzIG9uIGluIFBSIEFjdGl2ZQ0KPiBJIHNlZSBu
byBEQzUgZW50cmllcyBvbiBhIHN0YXRpYyBzY3JlZW4uIEZhaXIgZW5vdWdoIHRoYXQgaXQgaXMg
bm90DQo+IHVuZGVyc3Rvb2QsIHNvIHBsZWFzZSBkcm9wIGl0LiBJZiBJIGNhbiBzaG93IGEgcmVh
bCBiYXR0ZXJ5IGNvc3QgSQ0KPiB3aWxsIGNvbWUgYmFjayB3aXRoIG51bWJlcnMuDQo+IA0KPiBD
b3VsZCB5b3VyIHBhdGNoIGdvIGluIGFzIGlzPw0KDQpJIHdvdWxkbid0IHVzZSB0aGF0LiBUaGlz
IGRldmljZSBzdGlsbCBoYXMgUFNSMiAod2hpY2ggYWxsb3dzIGRjNikgd2l0aA0KdGhlIHF1aXJr
Lg0KDQpNYXliZSBiZXN0IHRvIGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIGluIA0KaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS93b3JrX2l0ZW1zLzkxMTkNCkJS
LA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEpha2UNCg0KDQo=
