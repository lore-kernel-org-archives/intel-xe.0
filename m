Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3541A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQXWbFvF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E3410E5FE;
	Fri, 23 Oct 2026 10:33:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1C810E5FE;
 Fri, 23 Oct 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792751588; x=1824287588;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7/vSEsL5ZZ8SCumtgXMvgTJHeBi4S7En6ElknstDG5Q=;
 b=iQXWbFvF1aqcICjPu4wHsOpJjc5UBnE8EC3D5/0GMF0+BkCoxeSMbmTm
 ndk7yk76+fVc9DBmh366R3Oub35OLmzDAW3jEPLJaBfLyYz890jgP6eJ9
 p2LpN0vvjmr9XVO8KAnQd5YNaa4qDP+umfrrJTPPJuc7tI73fEWyZHFht
 WY9/S062mR++4lz5yoqFSPFs7iPoLANbW4Y7otLlugCW0g/ADvOC9xtza
 CpNphRqslwl8qrdN3kFnUTztNGnoRa3qLXHKQdDnPSaQAsj1QLa6D3ePp
 YHfmLaqarH6ivcV3PHCRHVfm7OAR2APT8XH84l5h1R+L9g9DqGS+JJrGf w==;
X-CSE-ConnectionGUID: R1hLdHyrTymUI2UZYbVe7A==
X-CSE-MsgGUID: YBCWO2XUShWfZ00d3cx+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1547280"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1547280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:33:07 -0700
X-CSE-ConnectionGUID: o6SBkTXGT9qXjpMqMBWq1w==
X-CSE-MsgGUID: S/XFJaR9SWmp8HkTYwmNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3941473"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:33:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 03:33:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 03:33:06 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 03:33:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nioFlo+ptYWAUVGpz0tplxqD7WMk3FZJoojxxTVUdWu8yCkeU0AVHVeD2WBrMshWWLWOmxS9pyoaD/DkfuPb0G/2ckO+7T9LD1P3bY8MTqnL5m6Ac0hkC7RQgcamLsAKSQrGa+2cIMtzHNstCiOV3SIa4gcD8x0OwcY0cQnEGnk5Xxmyz6vS0+hGOpH6mjZCbt9V+NI6pG92EecZQyZoBh8+wbQaMk7FSWsEZIm1vzBzf+nPeNQClZl+tHKkEfa26pl39gPaJwrkD66OJgIJRsLUrQ9hbEWZxa53+bHR+YlbJWBiKFiaVV1joEkVugELeuYVuxmv6tHiirbsVXlyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/vSEsL5ZZ8SCumtgXMvgTJHeBi4S7En6ElknstDG5Q=;
 b=AEwBIeAABlTs9TGVweXjzgFXBbW9XNqvQnv7kY3pLjaSL8FGf3j+ROMsrNLv3sbm2qoPa1HORQXiZR4GsqCJmKqf1G99WjVE+YoqV1mFw1el2PK5uoveFUN1EWex37ILWs+Jp3uaV9QB7U5WvgW4hZPT7uEzdCK0US/yDXE/tMyC5gg8O14kJIBLjstGdsgyFloJ+Qr1KxYPzD4ly0DeALl7DDnataMsdYiRpjNYwXsnwplkK5CCm/m7KQ48pqFWFx8WrwA9p0mslrLDFh6O13dkF6E4DWN0nkXnkxu1e72kMcm2u3wmPwvvPjgELOg2HnyVX+Hk8orTPEXwZU/d4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Fri, 23 Oct 2026 10:33:03 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 10:33:03 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] drm/i915/psr: Track all joined pipes for
 frontbuffer tracking
Thread-Topic: [PATCH v3 1/9] drm/i915/psr: Track all joined pipes for
 frontbuffer tracking
Thread-Index: AQHdYtVsyFKXvTSdOk2Gqx7ZB8YbSrcK7OWA
Date: Fri, 23 Oct 2026 10:33:03 +0000
Message-ID: <ccb6c35c062ea841356d1109395170187e570179.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-2-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-2-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA3PR11MB7435:EE_
x-ms-office365-filtering-correlation-id: c82faaa6-ec82-4ce5-2dd0-08df30f10498
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|10067099003|261021121427099003|22082099003|38070700021|261021123027099003|4143699003|261009223027099003|11063799006|261022105027099003|56012099006|261022075727099003;
x-microsoft-antispam-message-info: E7Nr+6Kt64vLknSUcmmWV/3+3IsMxAITqhxnbNf1L1AZQjAJiRdnRjM5qRp14Za5JRKz69yoZBkfwOTC9IOdtvzpUQzxwncfgtHzJvjJSVcpf/+I3faGG2Gpp4R2PaHy1dqtXIHRbDAjg3jMbzjlh8KQ7092l5kRgpe0YiU+Cn0oIpk2lz1vJrJPPGCtnwLs/lCEhWitnv7E+1MOrixQyTCGPYmGYoEwx3WMUZX1PoLtgyA4r8j6oLtnklB87sMSA3uz/k7lvrYld6pXMFWQYMpdhKiPrdGb61UAelYWLwCC3zwgUgf+7RMmbvfIf1DLtTCk0jsPqsKfUF0qeCcnyi2Kp5TFW2ZzgBk3WsFDKv/oovkiYfssveHS1QWqIhBOkK3+fPwViRDgq9Dh392wYw8gblTy26vT10TFnBoRstgFMuykNYH35nTWQ2qJxHMaXTec8OjKlIfhPsMYWPl936mTTGExBlsV7HuPH/oKHuUbQuySupcZKlgVwrOUgMcQevHwHhhgUnPHGTo3q01SNHTEZG+ecfzgz3DRMBnd6wLtlWIt0Tupd2jQ0OWED02pEt29SgFOvdkgEsJdYtEll+3CNBgCeDgYFHhlLtrvwNfHhKFAEHwZ1zluItltGjFcL1+4IJpaZL3fBnANsz621Ki8pzhF0bgYbQJaY4xoIqYU37OjVthH16fMKF6Bv+0o7JGgBzB13ufFH4rkeNESS1hKQTlxdtmmrupbVYHZc58=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(261021121427099003)(22082099003)(38070700021)(261021123027099003)(4143699003)(261009223027099003)(11063799006)(261022105027099003)(56012099006)(261022075727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVVxMVMzUGdHVWxQK05Cc0FPcUxtK2Q2ajV3N3VpSE1zOUVjVTUxYXFaaDN4?=
 =?utf-8?B?d2tXbWVtQlIvYTZ1V1ZOdTBRRk01R0JMZ281c1RKTldVSHBnNzFXWC9ZVjJQ?=
 =?utf-8?B?RUF6bGpLMk9jZHQ4blJkMVY3N2Y4ajFnblJXVDM1ZjUyNmxBV3VhZ1E3YTNY?=
 =?utf-8?B?U0pQRkNZaExjSzdGdmFYaWwwbXZPVjIwY0xzaHRjVXVNcHBuRU1jS0o2U1lv?=
 =?utf-8?B?dk5XZ243UFJ3K3VtZW9jUVlHajlQeHhKZnJzeEhOZDIzMEZzaHN1TzllK2hN?=
 =?utf-8?B?VGZSU05mWnJnVkRBNkNkcFBmbXZIYzhEcGRMQlI5c1BuQ0NseFVpSVlacUps?=
 =?utf-8?B?Sm5pb0RkR24yM0REbW1lbE1JSXRlUy9McDdYamVBM2YyUTk4Q2hVc0phZG9x?=
 =?utf-8?B?ck1VYkxhZW82eHo5b1NLd3NXbzRlWnhqYWJQNnFsWTUzQ1BqcDc4aHlUdEhV?=
 =?utf-8?B?MEZQQ1owM2c0TGFSWHhORUdMSTMyM0RlbG5wbk41WHNhSEhlZVEwS0MrYk5l?=
 =?utf-8?B?R0tTNDlNUTFCTVNZTzZaRkxONEpMdTlKYkZlS3NqeUc0WnR2MW8vL0REWjNL?=
 =?utf-8?B?RTFhRGZCR3phQVBXTTFzZ0ZHOG83SHY2RGQ0YmUra1ZyZDNIUFBUOVRDYlI0?=
 =?utf-8?B?TzljWFNtR1ZCWmYrcVZXK0FlUVJaMnNDQXIrWkZKTDF0VHJ3QkpPZEoyVzZB?=
 =?utf-8?B?bzQ4a3h5R1k3cnhtbHZSNnptRlo4MUt1RkpZN21YbHQxQ3c0bExTMk9rczBQ?=
 =?utf-8?B?UjFYOGY2UDRJZ2FHQ2VjL0tIWTBpNE8zWGxOV2JvNzdpZDIrN1cxa3RtUVll?=
 =?utf-8?B?VXN6R3Q3cG9EZTJ5bTU3WlZ1MGNmbWFpRzZkbzdRNWhBSU1BU1lsOWdDTHNw?=
 =?utf-8?B?ekVLUEgycDNhaUcrTEh6TmZob2p6NnFTWWtCNEhNVFhFQkIvQmRRZzFuUmVF?=
 =?utf-8?B?bklib3BEclE0Y1BVV3N2bi85OXFXZHhUd0Zjc05nM1ZZbllMRWJicVBzT3Bj?=
 =?utf-8?B?Q0d3Tjk0MmhYb2tvY3l5TnpPNkJqWGJhS00vYjd0djcxVU9iMTFkWDVwUlJn?=
 =?utf-8?B?QmM4WTRrQjJ5ZzY3c3BhUXErbUdoYmdTak9Kb2EvajJORFNQd3Mwa3NRbUhG?=
 =?utf-8?B?ZFFYc2lhYjZnRXJ4d2N6eThTOTM5c0wwZEtSSHdyS3Q5ODBLblFuYmgrZlZR?=
 =?utf-8?B?bklFNDV2aXNvRWVYaXlaWldZQ0lqdy92a0l4UnR4a2Z1dElTVHFldVBrSFNQ?=
 =?utf-8?B?ZkJHWWdFMEhrUUNaVTBvazMwMkE5ekU5TE9Hek9zVkpBTDYwTysweEdneS9n?=
 =?utf-8?B?WStYdVhZS1pGM2FUWGgrWmxZNzRpdG1jMGR1NE1DYWprdmZhRC9VNFVFTTRY?=
 =?utf-8?B?RFEvbWRFVUd3ZEZXUGVSWmFoVkZjdU1Rbk9qU0NKclFCL0JWMGV2VTNUazN0?=
 =?utf-8?B?RG1EemNJMVNKVWVrS1RmOFNQbWNwVytEMFp1MHR5VjJHOUU3RGRMMUt6eStD?=
 =?utf-8?B?RURlSXpFd2J2Y2FXaUw2UzlVcFYzVUYwU1YxSU1XS1F0elgray9lN3pxcStK?=
 =?utf-8?B?Q0lyUU1OdVZpT1JFVzFWNDZKWTcvbk9KbzBNbzEydFkxOW1Sc1pzc2NYUENj?=
 =?utf-8?B?NDNQOTVZYjR6L2t6cUszdGZqaU5MQ0cyRk0ydU9LRk1DeTErQ001aXVlb2cr?=
 =?utf-8?B?QVd0Y3FZZHpWMFlDZmIrK1lTR1psdGJpaU1qQXdHOE5IMTVla3k3MERDejVG?=
 =?utf-8?B?R0RDY3NlMXJJZHA5WTlreTdUak1JNHFkSEVuNXJjbWlLU01mS1NwUmM0cDdh?=
 =?utf-8?B?L2orSFNoTXREU3RrMldTUC8vZ2l4M0ZnMTlrWEM2NDhxbi94WXZod0xwVlF6?=
 =?utf-8?B?S1RWVUhydHJJVjBiU0JjeVhWOHd1NGxJWmdXeU83YUh2MXAvbWRaenRTK0ZO?=
 =?utf-8?B?U2FHbGtrRmdLTld2bUVOb1oyZU9JaXlkSG5WeWRBTWF4RGoyWXJScEFxdGdL?=
 =?utf-8?B?OWtqNzR1eWRhUE9tdkJ2dElLSXV4dGNwNVhHbkk2VzhXaGY5YUphWHhMNkZJ?=
 =?utf-8?B?SDc5NjZydDRqMFEyeExYbG5PNlRvRFNvZW9oeDJYQ0xJYStxNi8rSXhreENQ?=
 =?utf-8?B?dWFmK0orRUtRSmNlaUgvd1JHN3BLZTk1dVliWmdjbHI1R0cvR2xRNm5jamo0?=
 =?utf-8?B?OHVaZ3pMb3lZYUtFVHhFVWpMUEVXaXlOUDhlYjNKd0RTdjF4UVNaaktjN3Zk?=
 =?utf-8?B?b0J5cGNkVlYwU3A2R3NVOCswR2VZSGxkU21mZElLTUR1WkEzNSt2QjVzRGRn?=
 =?utf-8?B?MlhlOW1yMVVoY2ZnREZuUG43bkhtblkvQWhKWHBubjhiK3pZS1lWdmFGMnJ2?=
 =?utf-8?Q?6QltIir9kXCRZOW0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33EB6221F9B64D49862511FA7EB268CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u/JeKsFhFxBc9eAkuOr44yn9NHz0bpKy++FF4qhW6UMfyBWpbhmZ4QaZY4PplMqcOCTTjxP2GjPcdjRfC3qofUHu5/l7J+by2Ip4XkavjPuiCRF7xjslz1oGPqmeyQ1Fh+K2hHd/Z2m1vPL+a+a+vdKvsBuUl9LUsvrBP28w/Qy+lCSA2WRjU/fO3Tr8Cmoi93UWBqNDy8IxXSTk/sv3LG85QwJwsfV30gJGC5JBMEiyO/NK1Ke8V6laEyawiodi+rdbRb/4yLs+dD/SKe93Ay38za9rj23oOli5VvpFUdciMbBYgv5BhyiqSt7gZDtACOKkW3Cd9NTLq0NzHg/YXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82faaa6-ec82-4ce5-2dd0-08df30f10498
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 10:33:03.1994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5d0BsaJeCVdAJnnF/Rgux/K52eUU49hHehkaSw9u1CVRwfcxj3973DtE7K2MDPg4Dhy9LD8XSwb1g42EulRFD7DQMvp5XdpLQED2J53bGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
cHNyLnBpcGUgaXMgdGhlIGpvaW5lciBwcmltYXJ5IG9ubHksIHNvIGZyb250YnVmZmVyIGJpdHMg
Y29taW5nIGZyb20NCj4gYQ0KPiBzZWNvbmRhcnkgcGlwZSBnZXQgbWFza2VkIG91dCBhbmQgdGhl
IHVwZGF0ZSBnb2VzIHVubm90aWNlZC4gQWRkDQo+IHBzci5waXBlX21hc2sgY292ZXJpbmcgZXZl
cnkgam9pbmVkIHBpcGUgYW5kIHVzZSB0aGF0IGluc3RlYWQuDQo+IA0KPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSwgam9pbmVyIGlzIHN0aWxsIHJlamVjdGVkIGluIGNvbXB1dGVfY29uZmlnKCkuDQo+
IA0KPiB2MjogU3BsaXQgdGhlIGFjdGl2ZV9ub25fcHNyX3BpcGVzIGNoYW5nZSBpbnRvIGl0cyBv
d24gcGF0Y2ggKEpvdW5pKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eu
a2Fob2xhQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmku
aG9nYW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDCoCB8wqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAyNSArKysrKysrKysrKysrKy0tLQ0K
PiAtLQ0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV90eXBlcy5oDQo+IGluZGV4IDhmOWZiMjYwMzYzOGEuLjQ3NTZlNTBhM2I3MDcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV90eXBlcy5oDQo+IEBAIC0xODAyLDYgKzE4MDIsNyBAQCBzdHJ1Y3QgaW50ZWxfcHNyIHsNCj4g
wqAJYm9vbCBlbmFibGVkOw0KPiDCoAlpbnQgcGF1c2VfY291bnRlcjsNCj4gwqAJZW51bSBwaXBl
IHBpcGU7DQo+ICsJdTggcGlwZV9tYXNrOw0KPiDCoAllbnVtIHRyYW5zY29kZXIgdHJhbnNjb2Rl
cjsNCj4gwqAJYm9vbCBhY3RpdmU7DQo+IMKgCXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggNGFlNDdk
MzMwOTZhNi4uMjdjY2NjZGM3MjMxNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+IEBAIC0zNiw2ICszNiw3IEBADQo+IMKgI2luY2x1ZGUgImludGVs
X2N1cnNvcl9yZWdzLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2RkaS5oIg0KPiDCoCNpbmNsdWRl
ICJpbnRlbF9kZS5oIg0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXkuaCINCj4gwqAjaW5jbHVk
ZSAiaW50ZWxfZGlzcGxheV9pcnEuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9yZWdz
LmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfcnBtLmgiDQo+IEBAIC0xODAyLDYgKzE4
MDMsMTkgQEAgc3RhdGljIHZvaWQgcHNyMl9kYzNjb19kaXNhYmxlX3dvcmsoc3RydWN0DQo+IHdv
cmtfc3RydWN0ICp3b3JrKQ0KPiDCoAltdXRleF91bmxvY2soJmludGVsX2RwLT5wc3IubG9jayk7
DQo+IMKgfQ0KPiDCoA0KPiArLyogRnJvbnRidWZmZXIgYml0cyBmb3IgZXZlcnkgcGlwZSBkcml2
aW5nIHRoaXMgUFNSL1BhbmVsIFJlcGxheQ0KPiBpbnN0YW5jZS4gKi8NCj4gK3N0YXRpYyB1bnNp
Z25lZCBpbnQgcHNyX2Zyb250YnVmZmVyX21hc2soc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkN
Cj4gK3sNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3Bs
YXkoaW50ZWxfZHApOw0KPiArCXVuc2lnbmVkIGludCBtYXNrID0gMDsNCj4gKwllbnVtIHBpcGUg
cGlwZTsNCj4gKw0KPiArCWZvcl9lYWNoX3BpcGVfbWFza2VkKGRpc3BsYXksIHBpcGUsIGludGVs
X2RwLT5wc3IucGlwZV9tYXNrKQ0KPiArCQltYXNrIHw9IElOVEVMX0ZST05UQlVGRkVSX0FMTF9N
QVNLKHBpcGUpOw0KPiArDQo+ICsJcmV0dXJuIG1hc2s7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMg
dm9pZA0KPiDCoHBzcjJfZGMzY29fZmx1c2hfbG9ja2VkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxf
ZHAsIHVuc2lnbmVkIGludA0KPiBmcm9udGJ1ZmZlcl9iaXRzKQ0KPiDCoHsNCj4gQEAgLTE4MTcs
OCArMTgzMSw3IEBAIHBzcjJfZGMzY29fZmx1c2hfbG9ja2VkKHN0cnVjdCBpbnRlbF9kcA0KPiAq
aW50ZWxfZHAsIHVuc2lnbmVkIGludCBmcm9udGJ1ZmZlcl9iaXRzDQo+IMKgCSAqIEF0IGV2ZXJ5
IGZyb250YnVmZmVyIGZsdXNoIGZsaXAgZXZlbnQgbW9kaWZpZWQgZGVsYXkgb2YNCj4gZGVsYXll
ZCB3b3JrLA0KPiDCoAkgKiB3aGVuIGRlbGF5ZWQgd29yayBzY2hlZHVsZXMgdGhhdCBtZWFucyBk
aXNwbGF5IGhhcyBiZWVuDQo+IGlkbGUuDQo+IMKgCSAqLw0KPiAtCWlmICghKGZyb250YnVmZmVy
X2JpdHMgJg0KPiAtCcKgwqDCoCBJTlRFTF9GUk9OVEJVRkZFUl9BTExfTUFTSyhpbnRlbF9kcC0+
cHNyLnBpcGUpKSkNCj4gKwlpZiAoIShmcm9udGJ1ZmZlcl9iaXRzICYgcHNyX2Zyb250YnVmZmVy
X21hc2soaW50ZWxfZHApKSkNCj4gwqAJCXJldHVybjsNCj4gwqANCj4gwqAJbW9kX2RlbGF5ZWRf
d29yayhkaXNwbGF5LT53cS51bm9yZGVyZWQsICZpbnRlbF9kcC0NCj4gPnBzci5kYzNjb193b3Jr
LA0KPiBAQCAtMjE3OSw2ICsyMTkyLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfcHNyX2VuYWJsZV9s
b2NrZWQoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gwqAJaW50ZWxfZHAtPnBzci5w
YW5lbF9yZXBsYXlfZW5hYmxlZCA9IGNydGNfc3RhdGUtDQo+ID5oYXNfcGFuZWxfcmVwbGF5Ow0K
PiDCoAlpbnRlbF9kcC0+cHNyLmJ1c3lfZnJvbnRidWZmZXJfYml0cyA9IDA7DQo+IMKgCWludGVs
X2RwLT5wc3IucGlwZSA9IHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+dWFwaS5jcnRjKS0NCj4g
PnBpcGU7DQo+ICsJaW50ZWxfZHAtPnBzci5waXBlX21hc2sgPQ0KPiBpbnRlbF9jcnRjX2pvaW5l
ZF9waXBlX21hc2soY3J0Y19zdGF0ZSk7DQo+IMKgCWludGVsX2RwLT5wc3IudHJhbnNjb2RlciA9
IGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyOw0KPiDCoAkvKiBEQzUvREM2IHJlcXVpcmVzIGF0
IGxlYXN0IDYgaWRsZSBmcmFtZXMgKi8NCj4gwqAJdmFsID0gdXNlY3NfdG9famlmZmllcyhpbnRl
bF9nZXRfZnJhbWVfdGltZV91cyhjcnRjX3N0YXRlKSAqDQo+IDYpOw0KPiBAQCAtMjM5OCw2ICsy
NDEyLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfcHNyX2Rpc2FibGVfbG9ja2VkKHN0cnVjdA0KPiBp
bnRlbF9kcCAqaW50ZWxfZHApDQo+IMKgCWludGVsX2RwLT5wc3IucHNyMl9zZWxfZmV0Y2hfY2Zm
X2VuYWJsZWQgPSBmYWxzZTsNCj4gwqAJaW50ZWxfZHAtPnBzci5hY3RpdmVfbm9uX3Bzcl9waXBl
cyA9IDA7DQo+IMKgCWludGVsX2RwLT5wc3IucGtnX2NfbGF0ZW5jeV91c2VkID0gMDsNCj4gKwlp
bnRlbF9kcC0+cHNyLnBpcGVfbWFzayA9IDA7DQo+IMKgCWNhbmNlbF9kZWxheWVkX3dvcmsoJmlu
dGVsX2RwLT5wc3IuZGMzY29fd29yayk7DQo+IMKgCWludGVsX2RwLT5wc3IuZGMzY29fYWxsb3dl
ZCA9IGZhbHNlOw0KPiDCoH0NCj4gQEAgLTM2MTcsOCArMzYzMiw3IEBAIHZvaWQgaW50ZWxfcHNy
X2ludmFsaWRhdGUoc3RydWN0IGludGVsX2Rpc3BsYXkNCj4gKmRpc3BsYXksDQo+IMKgCQkJY29u
dGludWU7DQo+IMKgCQl9DQo+IMKgDQo+IC0JCXBpcGVfZnJvbnRidWZmZXJfYml0cyAmPQ0KPiAt
CQkJSU5URUxfRlJPTlRCVUZGRVJfQUxMX01BU0soaW50ZWxfZHAtDQo+ID5wc3IucGlwZSk7DQo+
ICsJCXBpcGVfZnJvbnRidWZmZXJfYml0cyAmPQ0KPiBwc3JfZnJvbnRidWZmZXJfbWFzayhpbnRl
bF9kcCk7DQo+IMKgCQlpbnRlbF9kcC0+cHNyLmJ1c3lfZnJvbnRidWZmZXJfYml0cyB8PQ0KPiBw
aXBlX2Zyb250YnVmZmVyX2JpdHM7DQo+IMKgDQo+IMKgCQlpZiAocGlwZV9mcm9udGJ1ZmZlcl9i
aXRzKQ0KPiBAQCAtMzY5OCw4ICszNzEyLDcgQEAgdm9pZCBpbnRlbF9wc3JfZmx1c2goc3RydWN0
IGludGVsX2Rpc3BsYXkNCj4gKmRpc3BsYXksDQo+IMKgCQkJY29udGludWU7DQo+IMKgCQl9DQo+
IMKgDQo+IC0JCXBpcGVfZnJvbnRidWZmZXJfYml0cyAmPQ0KPiAtCQkJSU5URUxfRlJPTlRCVUZG
RVJfQUxMX01BU0soaW50ZWxfZHAtDQo+ID5wc3IucGlwZSk7DQo+ICsJCXBpcGVfZnJvbnRidWZm
ZXJfYml0cyAmPQ0KPiBwc3JfZnJvbnRidWZmZXJfbWFzayhpbnRlbF9kcCk7DQo+IMKgCQlpbnRl
bF9kcC0+cHNyLmJ1c3lfZnJvbnRidWZmZXJfYml0cyAmPQ0KPiB+cGlwZV9mcm9udGJ1ZmZlcl9i
aXRzOw0KPiDCoA0KPiDCoAkJLyoNCg0K
