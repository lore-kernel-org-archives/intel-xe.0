Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B4C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 15:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE7710E00C;
	Thu, 27 Jun 2024 15:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COHzvkLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474010E00C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719502082; x=1751038082;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=WghLaQmEyC3c5CbY8Bk4M626AA/DUHHuCVAbeni4KHc=;
 b=COHzvkLxJZlSEREGvaBG6h7CjiT9TQfImqSXDNIRObalnKqtetFYadnn
 pi53e4SUTgIFYqyVZm2HRsWmaG4ssM3wBaGvhb4ND6NWrdJF98jQq5Nj/
 5zKghO8Fnk3U5Zv0PbcvE3e+Y6iwlcf0iAYRGZQ2y/DJeBg4JYRfnkUjY
 00f0E6Hy+LMB3vNX+uihOf19LmeG5gy/dCYLe+B38MH+KYDMO/5dHPcDH
 hpompAKoh1XtoJsvwtFyLl4QcBTgqQaf/HVPYr7B1VYtKmaoyVJsKUEen
 DMdyhTSK8U3nkC2GlrAUddq1auGmSihogGnbQtJX6SlKxshRzz6+SaXDY Q==;
X-CSE-ConnectionGUID: RMiDS1tWQvu4JS51gZuRnQ==
X-CSE-MsgGUID: mZ/n4qA2QOu4nrBX16XgyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20403736"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="20403736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 08:28:01 -0700
X-CSE-ConnectionGUID: ZeTsAt2DRH2Z1wcvm3TPbw==
X-CSE-MsgGUID: qkKApjMDSSKG4LbNAlHz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49381152"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 08:28:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 08:28:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 08:28:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 08:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP4DqXwP8rF5VbvTZ6P32WfnmsrCyN/R645WsZbNaWdGWGJx6vexcboi+mmY9RUwtC2YQo+YzaWhl+mLt4Jqd6SNG7qQRrK1mN03dfbu4QnfG02VaiIxKFDznyZ1F30NTYsClxtBJI6Ohw4SPKfqLw7WpEFKrQikqTg1BJntPlC/+22gnB2LfZxNhcAvYOX99OoIoNgs5x9QOkQ0BlrbHZcEaK1FtEozA7t2haBeOx2OgacBoc21McVdOq0xgv6NlIVD1Rv1577w1X6+ssX6yBM+joZyTEQt6PEiGW+zOmDh9oWPs2Y4Zcd5dGbIIx9i0YndUUyd0zgVccs71wzlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WghLaQmEyC3c5CbY8Bk4M626AA/DUHHuCVAbeni4KHc=;
 b=JehvIRGy3A2PkoCNJcgIT7oUy+dhSf3Ou+S6zbD8ycRZt6Ziq6zVH2vI0tqkFXaJEtlp7qF2EFZ5E4nNGMclv9aE4QtIabQSiEqT4j+KzIJ+dYRQKSKoTZZMCeJIBu9KnjYg8iuHSEImgEBNnXIw6Ou0MxwVPdhYv92qah+5tXN0ARNThUQaZpDKjtCnVefc7Qkb8wDSjYQQPHyi+xFwZ445S0GBkVri4NN4Uuk80Ev4dcHmcxoshma4V3wxZf9VNYlw6656aQ0nTdSPRHOm9h7LjIajCnMj3BTzcguHXsHTI3RObT0ThhPa8dzFlHEAvuy+Nd5gfUqcGfgDuo8hrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 15:27:56 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.032; Thu, 27 Jun 2024
 15:27:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Topic: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Index: AQHayAU83xinEb2HGkejtw2Ih/H2gbHagNOAgAAL/gCAARXPgIAADdMAgAAMqoA=
Date: Thu, 27 Jun 2024 15:27:56 +0000
Message-ID: <0a1de6fdf21f6cca1751792fd80cf1639b0c79d2.camel@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
 <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
 <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
In-Reply-To: <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7770:EE_
x-ms-office365-filtering-correlation-id: e31a69cb-d313-4d67-28b2-08dc96bdb814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YnVWNUdHWjdlbFhhMDF5NFFSMWRPNHYrL1JtN0duRVYveWhGc0x5VVN1MTNz?=
 =?utf-8?B?RUNOZGF6aTc5bnVHb0Nvd2FvNm5GTnh6VldsZWxKdXNXYkpUZEtoQWl2WEtn?=
 =?utf-8?B?Skx1OFB0MjRNZ0UzZzQ1Z1hXTTV3eDdzSkRIYklhbHV2L1FSUmVUMHBlQWls?=
 =?utf-8?B?NzlVZTJINjhTSVVpUGpwY25kdVdHdDAzdThCTnd3RFhacHFJT0FQTWRzdTNv?=
 =?utf-8?B?MDhKNmxuc2Z4UlBwdnRwMlJtQTI1Zm1rd0JBa1B1b0lUbUJqV1plenZqUFNX?=
 =?utf-8?B?V0paaUJtam5Md1FjNDdUSjlLekR6VElkTDIvLzlJTEJ5ZHNNT0RQNXRpa1VR?=
 =?utf-8?B?WnVheER0dWVyWm1zV2lwclZ5bTlWWkYyYkt1RjY5Ymx4eHNlTzh1T0xqblJS?=
 =?utf-8?B?QzM2RU5vbFZVMGRJZE9tbVFWdVlqSnExOFhBTkhpRUNTeDNWTWJ1WkdoT0NP?=
 =?utf-8?B?azA0R0JVRUdMaWxNQ1pOOENuWm9mUUN4eXF0Y3ZkYVluWnY3cnBBTld0dk5u?=
 =?utf-8?B?SFFCcit5OVgyTHk1Y3psT1NoK080Q2gxbXk3ZG5NcEZYNFV3eGVsU3lnZ0dL?=
 =?utf-8?B?alJOc3BpdGluVmxpYytKVytNWTBsTi9HaTVmSXVlMmtlekRnMS9TNk1VTDI5?=
 =?utf-8?B?ZGVOOGZjblRCR211alQrT240bTNLQzk2Mm0wVDF3V0g5aVlCRnF0S2p6OWlW?=
 =?utf-8?B?NDhqa0Jncnl6OVA1a3JuM0xGbk1tbDVLSWlrTG9tOXNRbTlWWkhldHJQSmR5?=
 =?utf-8?B?Nkl2RXVIeFpNSHpwaThCRGNCakF2VGJZT0EwS00ySitoK2gwdjBvNEhtUG0w?=
 =?utf-8?B?YXNuRXFaTDYwUDd1YUFuMUdPR3cvOVlsRDZ2SDRwUzF3TTBiZWcweDZJUmYx?=
 =?utf-8?B?Q1dtQWdDdWNOZmZxNHMrTnhLVDJGYS9UelMxZDB1MjNZTUcwdU1FcEdmZ096?=
 =?utf-8?B?YWhKTlpNSTdOZlVqTkhqekVobTZMUmp1U1lLem94b05ZUUlLTTliZTRod1ho?=
 =?utf-8?B?cEZ3T3RhSkF3NlM5cmdnOHJ2em03aTFJTUVWWHY3dnUyS3VwRG9WSm53eUNQ?=
 =?utf-8?B?bko0MjBOcitRTkJ2ZTVJK0I2V0I4QngzeGUzVkx6SkR4SXo4TDEzei83bEQz?=
 =?utf-8?B?U3ZYSXZtYUVHcFZhelpOS1dhdG96ZDkvTm9tam1QTk9MWkwyV0tmNU81MlRh?=
 =?utf-8?B?NGQ0YzhSbkRSMVljUHgrc2pXNlZPRnJnaEticitISnRNczNiT0FLOW1KaEhO?=
 =?utf-8?B?TmZDaXFUSE9rbExXWnp1a3JtTnArWnRaM1BZMlNkQjM4Mm9GcGNnUkhPVDF0?=
 =?utf-8?B?OGczZUg0TTRGVlVMNUJYM1hEazRQUkN4VUVvZGkvb1BnUzB4blVIYWdZejIz?=
 =?utf-8?B?cVljVlB3eUpORU1kSXk1NVVhVzlYb1RORGRFd1pYdThGM0xhSWxTWDNhc0h6?=
 =?utf-8?B?eW5UVmY0dForZzV0SHBiOUFaU3FGNG1iQ1NITkJaQ0l3Yy9VcmZCVVVWWkZL?=
 =?utf-8?B?YVBCcUc1N0huQXQ0Q1Y2MHdQa2pXUlJZZGNVTjkyeE1RaWJZK1I0RjZ2YkNM?=
 =?utf-8?B?VUN4T3VYOHpSQWZhdFgyclVBOXpvNVdCL1ZQaTlYcWdzU1hydU0wZWcvaHll?=
 =?utf-8?B?dUFlSUN0cjdQT1NXaHg1MEc0NGprcTZtOFYvK2lwZTVSSWl4VHlTUGxCd0Fi?=
 =?utf-8?B?TzhQQkRrb3NrU0w2cnZta1hkSis5b3B4bDdtVDF2R0xGcmJpdGVHSUN0MTZY?=
 =?utf-8?B?R3VZMTJqMHozVE9iNURkWlZSd2NhT1RRY0RFaEdtU0VYZUVYeUNXMmRxbWxq?=
 =?utf-8?B?cnhnQ0dOQStqYjF6STBCUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2JsZkhKWnhQOVlxRU51T2Z2V0gwY0YwdTJreHRqVURvWXdWSDg4bHNPVWI5?=
 =?utf-8?B?bnhmRlh4cGdoZXYrSDdBZytiMlRmNVhGT0dFbGZHdFBXT3JyNi9TRFJDZkkx?=
 =?utf-8?B?WjE3cTA5RUVzWHY4SGQrcnYvWWlYWVJSM3N5VmZvZFMyYjlLc3duc0VycXA3?=
 =?utf-8?B?dVRuZ09zd2h2a0ZsSjZZZmFZUGVFMHdHT3RnNUVQT0lQdmc5bmxsanpPalVU?=
 =?utf-8?B?TFU4dFZxT1hwUDRnNEpMMHdnZ2tqbUtIMC9NajhCVWQ4U3hUUFJBWjlwSE9n?=
 =?utf-8?B?WnZCeWRHQVZoSEQ2dzVjVGN4ZDlvdmo4aVBJOTlHVGp6OElsb2JCcUVMaWZO?=
 =?utf-8?B?azdDUGFTVjVCU0RZdDBnTWVwdENNa1kxYi9qZVd0bnJESDZTKzltaDJCKytp?=
 =?utf-8?B?d2xmeXVSWjJHbURqbDViNFMxby9nOEIwTFlLdThJVWFwU3ZJQlJsOCsvL2cr?=
 =?utf-8?B?N3VxVzN6TStsb3RmenJpeHRoZXVHakRYcUxtQllTdHFsekdQUXRpZjhCQkxr?=
 =?utf-8?B?US9LTlRxakRpalRtOWdTeG9vQ0kwQ3dFQzF5MWQ1ZTZ5YW4xQmtTVFd2cmxJ?=
 =?utf-8?B?UVVYdFRCa1dqbW5RRDdiTUh1UG9nTzY0UVpNVzE3S3dJdU51ZFNDVGp5WGti?=
 =?utf-8?B?WW11bFRBb3ZiZGsxSFV0UjBwOHlUcWswTVZKbzJVOUdpV3laSjUrSUsrSyt1?=
 =?utf-8?B?KzZJbG9rU0M1V0tFVlNTWkQrWG8vUzZURWJRdzZBWHp1dFVtVFA1dmx4TTJa?=
 =?utf-8?B?QzVkNVpxTnZqaGk5Z0I3VlpVQjZmN01qNlE4SUlhOVNGaVdRSmZFVjI3QThj?=
 =?utf-8?B?VXFUZ29sd1gwc3hadU1oNWRISW1kZ2dnSkJxbUhCdGVaakxGTjBTVHdoUE5T?=
 =?utf-8?B?WFN5ZXk4dWNPdEJBMldnMW9STWovOGNJSTlUYVpvcE5vRVowQnZBa21xWVRw?=
 =?utf-8?B?ZlhmUDJGelNpZDZJSzNtdFU1THlWYlA0Kzk3ZU0yNTljMVEzamdlSzM2V0RD?=
 =?utf-8?B?aTJ0clVjRkxXblp5ZXppNW5nUENQUm1CV0dyOXhnU3FacWwxVVpaRTZoclVj?=
 =?utf-8?B?bUhNT3ZvT3ZIMUdlRHRJaUdnOEZ0WkNzRHh0UHlpMXRiZlg3V2VCUTZneFB6?=
 =?utf-8?B?RHVpOXNsNHR5VVd4bUhldy9SdDhLbkpHN01VK1ZjQmYycnptV0sxRHlRUFdh?=
 =?utf-8?B?ZWl6S2ptRXBFYmRTRDdxQ0s4dG9vbUlFcjFPYk12UUJGYThITnVXWnZKNElI?=
 =?utf-8?B?Qko4RUYxTjZtTGF0MHB4SFQxZnRrTS9TZFEvbExmNkRVeUtMajc5eE5GRXVF?=
 =?utf-8?B?Z0xER2VZSllseGk4NzZiQkRIWXBkWC9nZWF2NzZVUisva2Z3NEx2N21UYnk4?=
 =?utf-8?B?QUxxVWEzdWIzVTlmVzl6M2RmT0ZtdUkva3piODRWakJMWTIrUGFHRjd1NGJk?=
 =?utf-8?B?SnNoOVhvN3VkdWVDTnpOMnd1a2J4bGJzR2crQ3hlSUhaUE44MVVsN0NUV1ZB?=
 =?utf-8?B?ODMyaFhXNHpzek9BZVRDU0hxMVJhNWdZSlhHdVJrOVFhdGd5QWFDVy9OZnZr?=
 =?utf-8?B?YkRMV3NGemtldHhQUWNHU2N2dHhvb2h0YUUvdEJJWDBUQm9oQ3dYWmRmQjQ2?=
 =?utf-8?B?U3FwbUY0MmExakRKdlhVV1RndHRueUtiZTNKZTdWbGhzaFFpczB6bzlWa2Yz?=
 =?utf-8?B?M1liYkpGL1dFOVloZ0hNREVBNkFBdE1DRnpHZE5xaDBuK2d3b283cUlFcnVh?=
 =?utf-8?B?YVA4ZzQvTytIbHpqaHBRek1sbHVNL1dPMUY4c2FYRnEzd3U5UzNvVG0yV0c2?=
 =?utf-8?B?a0U2cHJOcy9qZWE2a2dxS1FuRkVDU1l0VjgwK2JQaFp1Z3ZWVW1hQU1ZTGFN?=
 =?utf-8?B?UGozZEF5Rm5UWHFkUUttRVZCVUFoSEdvdGlWeVVSNjB3YnBRVXd0U0tLWkhL?=
 =?utf-8?B?T3BaNThMNVNmVHpxOERZSWt2UmRqYmJvNGhHQlNxTzBob0t6VTJZTVdaUDlQ?=
 =?utf-8?B?ZU11bjdQU09zaEVGNzBjRm5HZ1k4TGNCeU85ZWdlWE9zUTFvbVgzME11cFh3?=
 =?utf-8?B?ZnJuOW5XKzRHV3RmellJR2pieC9PRkxCT0ZkNkZIcE9QRmdtd1FPVnc4VHMr?=
 =?utf-8?B?dUFnWGlXVnU5TTBpenhicTJIZU5iOFdLbjZDWTJVR2N5S29NdlhvVTJpQnh0?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3599EF124F0F704F95479D35193B1669@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31a69cb-d313-4d67-28b2-08dc96bdb814
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 15:27:56.0438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlnUfpn7KGpcURzrYpQ1PfAsG5gWjOBvVTImV5M331MLza+pWXLSmZSm68BiOQykIOp1QgRxiFoJyQBuzyDxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
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

T24gVGh1LCAyMDI0LTA2LTI3IGF0IDE2OjQyICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gT24gMjcuMDYuMjAyNCAxNTo1MywgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gT24g
V2VkLCAyMDI0LTA2LTI2IGF0IDIzOjE4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0K
PiA+ID4gDQo+ID4gPiBPbiAyNi4wNi4yMDI0IDIyOjM1LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
PiA+ID4gT24gV2VkLCAyMDI0LTA2LTI2IGF0IDIyOjEyICswMjAwLCBNaWNoYWwgV2FqZGVjemtv
IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSW5jbHVkaW5nIGxpbmUgZmVlZHMgYXQg
dGhlIHN0YXJ0IG9mIGEgZGVidWcgcHJpbnQgbWVzc2VzIHVwIHRoZQ0KPiA+ID4gPiA+IG91dHB1
dCB3aGVuIHNlbnQgdG8gZG1lc2cuIFRoZSBicmVhayBhY3R1YWxseSBhcHBlYXJzIGJldHdlZW4g
YWxsIHRoZQ0KPiA+ID4gPiA+IHVzZWZ1IHByZWZpeCBpbmZvcm1hdGlvbiBhbmQgdGhlIGFjdHVh
bCBzdHJpbmcgYmVpbmcgcHJpbnRlZC4gSW4gdGhpcw0KPiA+ID4gPiA+IGNhc2UsIGVhY2ggYmxv
Y2sgb2YgZGF0YSBoYXMgYSB2ZXJ5IGNsZWFyIHN0YXJ0IGxpbmUgYW5kIGFuIGV4dHJhDQo+ID4g
PiA+ID4gZGVsaW1ldGVyIGlzIHJlYWxseSBub3QgbmVjZXNzYXJ5LiBTbyBkb24ndCBkbyBpdC4N
Cj4gPiA+ID4gDQo+ID4gPiA+IEkgZ3Vlc3MgdGhlIGluZGVudGlvbiB3YXMgdG8gaGF2ZSBvbmUg
YmxhbmsgbGlrZSBiZXR3ZWVuIGd1Y19jdGJfc25hcHNob3RfcHJpbnQoKSAnY21kW1hdJyBsaW5l
cyBhbmQgJ0cySCBDVEIgKGFsbCBzaXplcyBpbiBEVyk6Jy4NCj4gPiA+ID4gSSBhZ3JlZSB3aXRo
IHRoZSBjaGFuZ2UgaWYgeW91IGFkZCBvbmUgbGluZSBicmVha2VyIGluIHRoZSBlbmQgb2YgZ3Vj
X2N0Yl9zbmFwc2hvdF9wcmludCgpLg0KPiA+ID4gDQo+ID4gPiBidXQgJ2NtZFtYWFhdJyBsaW5l
cyBhbHJlYWR5IGhhdmUgYWRkaXRpb25hbCBpbmRlbnQgY29tcGFyZWQgdG8gJ0gyR3xHMkgNCj4g
PiA+IENUQicgaGVhZGVycyBzbyBJTU8gdGhpcyBleHRyYSBzZXBhcmF0aW9uIGxpbmUgc2VlbXMg
dW5uZWNlc3Nhcnk6DQo+ID4gPiANCj4gPiA+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpF
UlJPUiogR1QwOiBUTEIgaW52YWxpZGF0aW9uIHRpbWUnZCBvdXQsDQo+ID4gPiBzZXFubz0yNywg
cmVjdj0yNg0KPiA+ID4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6IEgy
RyBDVEIgKGFsbCBzaXplcyBpbiBEVyk6DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJt
XSAqRVJST1IqIEdUMDogICAgICBzaXplOiAxMDI0DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4x
OiBbZHJtXSAqRVJST1IqIEdUMDogICAgICByZXN2X3NwYWNlOiAwDQo+ID4gPiBbIF0geGUgMDAw
MDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBoZWFkOiAwDQo+ID4gPiBbIF0geGUg
MDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICB0YWlsOiA1NzINCj4gPiA+IFsg
XSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHNwYWNlOiA0NTENCj4g
PiA+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIGJyb2tlbjog
MA0KPiA+ID4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAgICAgaGVh
ZCAobWVtb3J5KTogNTY4DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1Iq
IEdUMDogICAgICB0YWlsIChtZW1vcnkpOiA1NzINCj4gPiA+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6
IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHN0YXR1cyAobWVtb3J5KTogMHgwDQo+ID4gPiBbIF0g
eGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBjbWRbNTY4XTogMHg4MDY3
MDAwMw0KPiA+ID4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAgICAg
Y21kWzU2OV06IDB4MjAwMDcwMDANCj4gPiA+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpF
UlJPUiogR1QwOiAgICAgIGNtZFs1NzBdOiAweDAwMDAwMDFiDQo+ID4gPiBbIF0geGUgMDAwMDo0
ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBjbWRbNTcxXTogMHg4MDAwMDAwMw0KPiA+
ID4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6IEcySCBDVEIgKGFsbCBz
aXplcyBpbiBEVyk6DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdU
MDogICAgICBzaXplOiA0MDk2DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJS
T1IqIEdUMDogICAgICByZXN2X3NwYWNlOiAxMDI0DQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4x
OiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBoZWFkOiAyMTANCj4gPiA+IFsgXSB4ZSAwMDAwOjRk
OjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHRhaWw6IDANCj4gPiA+IFsgXSB4ZSAwMDAw
OjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHNwYWNlOiAzMDY4DQo+ID4gPiBbIF0g
eGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBicm9rZW46IDANCj4gPiA+
IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIGhlYWQgKG1lbW9y
eSk6IDIxMA0KPiA+ID4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAg
ICAgdGFpbCAobWVtb3J5KTogMjEwDQo+ID4gPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAq
RVJST1IqIEdUMDogICAgICBzdGF0dXMgKG1lbW9yeSk6IDB4MA0KPiA+ID4gWyBdIHhlIDAwMDA6
NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAgICAgZzJoIG91dHN0YW5kaW5nOiAxDQo+ID4g
PiANCj4gPiA+IGFuZCBJTU8gcHJpbnRpbmcgZW1wdHkgbGluZXMgaXMganVzdCBhIHdhc3RlIG9m
IHBhcGVyIDspDQo+ID4gDQo+ID4gVGhpcyBzYW1lIGZ1bmN0aW9uIGlzIGNhbGxlZCBkdXJpbmcg
Z3B1IGhhbmcgY2FwdHVyZShkZXZjb3JlZHVtcCkgYW5kIHRoZSBvdXRwdXQgb2YgdGhhdCBmaWxl
IGhhcyBuZXcgbGluZXMgYmV0d2VlbiBzZWN0aW9ucyBmb3IgYmV0dGVyIHJlYWRpbmcuDQo+ID4g
VGhpcyBhIG9sZCBzYW1wbGUgdGhhdCBJIGhhZCBhcm91bmQ6DQo+ID4gDQo+ID4gDQo+ID4gDQo+
ID4gKioqKiBYZSBEZXZpY2UgQ29yZWR1bXAgKioqKg0KPiA+IGtlcm5lbDogNi45LjAtcmM2LXpl
aC14ZSsNCj4gPiBtb2R1bGU6IHhlDQo+ID4gU25hcHNob3QgdGltZTogMTcxNTg3NzQyMC42NDcy
MTEzNzcNCj4gPiBVcHRpbWU6IDcwNjg0LjYwNTk4MjY2NQ0KPiA+IFBDSSBJRDogMHg5YTQ5DQo+
ID4gUENJIHJldmlzaW9uOiAweDAxDQo+ID4gR1QgaWQ6IDANCj4gPiAJVHlwZTogbWFpbg0KPiA+
IAlJUCB2ZXI6IDAuMC4wDQo+ID4gCUNTIHJlZmVyZW5jZSBjbG9jazogMTkyMDAwMDANCj4gPiAN
Cj4gPiAqKioqIEd1QyBDVCAqKioqDQo+ID4gSDJHIENUQiAoYWxsIHNpemVzIGluIERXKToNCj4g
PiAJc2l6ZTogMTAyNA0KPiA+IAlyZXN2X3NwYWNlOiAwDQo+ID4gCWhlYWQ6IDk3OA0KPiA+IAl0
YWlsOiA1OTkNCj4gPiAJc3BhY2U6IDM3OA0KPiA+IAlicm9rZW46IDANCj4gPiAJaGVhZCAobWVt
b3J5KTogNTk5DQo+ID4gCXRhaWwgKG1lbW9yeSk6IDU5OQ0KPiA+IAlzdGF0dXMgKG1lbW9yeSk6
IDB4MA0KPiA+IA0KPiANCj4gYnV0IEcySCBpcyBzdGlsbCBwYXJ0IG9mIHRoZSBDVCwgbm8gbmVl
ZCBmb3IgZXh0cmEgc3BsaXQNCj4gDQo+ID4gRzJIIENUQiAoYWxsIHNpemVzIGluIERXKToNCj4g
PiAJc2l6ZTogNDA5Ng0KPiA+IAlyZXN2X3NwYWNlOiAxMDI0DQo+ID4gCWhlYWQ6IDYyNg0KPiA+
IAl0YWlsOiAwDQo+ID4gCXNwYWNlOiAzMDcxDQo+ID4gCWJyb2tlbjogMA0KPiA+IAloZWFkICht
ZW1vcnkpOiA2MjYNCj4gPiAJdGFpbCAobWVtb3J5KTogNjI2DQo+ID4gCXN0YXR1cyAobWVtb3J5
KTogMHgwDQo+ID4gCWcyaCBvdXRzdGFuZGluZzogMA0KPiA+IA0KPiA+IEd1QyBJRDogOQ0KPiAN
Cj4gaG1tLCBzbyBpdCBsb29rcyB0aGF0IHdlIG5lZWQgdG8gZml4IHR3byBtb3JlIHBsYWNlczoN
Cj4gDQo+IDEpIGluIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X3ByaW50KCkgd2UgbmVlZCB0
byBkcm9wIHNwdXJpb3VzIFxuIGFzDQo+IHdlbGw6DQo+IA0KPiAtIAlkcm1fcHJpbnRmKHAsICJc
bkd1QyBJRDogJWRcbiIsIHNuYXBzaG90LT5ndWMuaWQpOw0KPiArIAlkcm1fcHJpbnRmKHAsICJH
dUMgSUQ6ICVkXG4iLCBzbmFwc2hvdC0+Z3VjLmlkKTsNCj4gDQo+IA0KPiAyKSBpbiB4ZV9kZXZj
b3JlZHVtcF9yZWFkKCkgd2UgbmVlZCB0byBhZGQgcHJvcGVyIGRlY29yYXRpb25zL3NlcGFyYXRp
b24NCj4gbGluZXMgc2luY2UgeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoKSBpcyBu
b3QgcGFydCBvZiAiR3VDIENUIg0KPiANCj4gLSAJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBHdUMg
Q1QgKioqKlxuIik7DQo+ICsgCWRybV9wcmludGYoJnAsICJcbioqKiogR3VDIENUICoqKipcblxu
Iik7DQo+IAl4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LmN0LCAm
cCk7DQo+ICsJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBHdUMgc3VibWlzc2lvbiAqKioqXG5cbiIp
Ow0KPiAJeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90
LmdlLCAmcCk7DQo+IA0KPiBhbmQgbWF5YmUgYWxzbw0KPiANCj4gLSAJZHJtX3ByaW50ZigmcCwg
IioqKiogWGUgRGV2aWNlIENvcmVkdW1wICoqKipcbiIpOw0KPiArIAlkcm1fcHJpbnRmKCZwLCAi
XG4qKioqIFhlIERldmljZSBDb3JlZHVtcCAqKioqXG5cbiIpOw0KPiANCj4gPiAJTmFtZTogcmNz
OQ0KPiA+IAlDbGFzczogMA0KPiA+IAlMb2dpY2FsIG1hc2s6IDB4MQ0KPiA+IAlXaWR0aDogMQ0K
PiA+IAlSZWY6IDQNCj4gPiAJVGltZW91dDogMCAobXMpDQo+ID4gCVRpbWVzbGljZTogMTAwMCAo
dXMpDQo+ID4gCVByZWVtcHQgdGltZW91dDogNjQwMDAwICh1cykNCj4gPiAJSFcgQ29udGV4dCBE
ZXNjOiAweDAxNDgwMDAwDQo+ID4gCUxSQyBIZWFkOiAobWVtb3J5KSAyODANCj4gPiAJTFJDIFRh
aWw6IChpbnRlcm5hbCkgNTUyLCAobWVtb3J5KSA1NTINCj4gPiAJU3RhcnQgc2Vxbm86IChtZW1v
cnkpIC0xMjUNCj4gPiAJU2Vxbm86IChtZW1vcnkpIC0xMjYNCj4gPiAJW0hXU1BdLmxlbmd0aDog
MHgxMDAwDQo+ID4gDQo+ID4gLi4uLg0KPiANCj4gdGhlbiB0aGUgb3V0cHV0IHdpbGwgbG9vayBs
aWtlOg0KPiANCj4gKioqKiBYZSBEZXZpY2UgQ29yZWR1bXAgKioqKg0KPiANCj4ga2VybmVsOiA2
LjkuMC1yYzYtemVoLXhlKw0KPiBtb2R1bGU6IHhlDQo+IFNuYXBzaG90IHRpbWU6IDE3MTU4Nzc0
MjAuNjQ3MjExMzc3DQo+IFVwdGltZTogNzA2ODQuNjA1OTgyNjY1DQo+IFBDSSBJRDogMHg5YTQ5
DQo+IFBDSSByZXZpc2lvbjogMHgwMQ0KPiBHVCBpZDogMA0KPiAJVHlwZTogbWFpbg0KPiAJSVAg
dmVyOiAwLjAuMA0KPiAJQ1MgcmVmZXJlbmNlIGNsb2NrOiAxOTIwMDAwMA0KPiANCj4gKioqKiBH
dUMgQ1QgKioqKg0KPiANCj4gSDJHIENUQiAoYWxsIHNpemVzIGluIERXKToNCj4gCXNpemU6IDEw
MjQNCj4gCXJlc3Zfc3BhY2U6IDANCj4gCWhlYWQ6IDk3OA0KPiAJdGFpbDogNTk5DQo+IAlzcGFj
ZTogMzc4DQo+IAlicm9rZW46IDANCj4gCWhlYWQgKG1lbW9yeSk6IDU5OQ0KPiAJdGFpbCAobWVt
b3J5KTogNTk5DQo+IAlzdGF0dXMgKG1lbW9yeSk6IDB4MA0KPiBHMkggQ1RCIChhbGwgc2l6ZXMg
aW4gRFcpOg0KPiAJc2l6ZTogNDA5Ng0KPiAJcmVzdl9zcGFjZTogMTAyNA0KPiAJaGVhZDogNjI2
DQo+IAl0YWlsOiAwDQo+IAlzcGFjZTogMzA3MQ0KPiAJYnJva2VuOiAwDQo+IAloZWFkIChtZW1v
cnkpOiA2MjYNCj4gCXRhaWwgKG1lbW9yeSk6IDYyNg0KPiAJc3RhdHVzIChtZW1vcnkpOiAweDAN
Cj4gCWcyaCBvdXRzdGFuZGluZzogMA0KPiANCj4gKioqKiBHdUMgc3VibWlzc2lvbiAqKioqDQo+
IA0KPiBHdUMgSUQ6IDkNCj4gCU5hbWU6IHJjczkNCj4gCUNsYXNzOiAwDQo+IAkuLi4NCj4gDQo+
IHdvdWxkIHRoYXQgd29yayBmb3IgeW91Pw0KDQpJbiBteSBvcGluaW9uIHRoaXMgbG9va3Mgd29y
c3QuDQpMZXRzIHNlZSB3aGF0IFJvZHJpZ28gdGhhdCBpbXBsZW1lbnRlZCBtb3N0IG9mIGl0IHRo
aW5rcy4NCg0KPiANCj4gPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50
ZWwuY29tPg0KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwu
d2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2Fq
ZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gPiBjaGVycnktcGlja2VkIGZyb20gWzFdDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81OTgwMjQvP3Nlcmllcz0xMzQ2
OTUmcmV2PTINCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19jdC5jIHwgMiArLQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19j
dC5jDQo+ID4gPiA+ID4gaW5kZXggODczZDFiY2JlZGQ3Li4xMTNlNjM0OGM2YWMgMTAwNjQ0DQo+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiA+ID4gQEAgLTE0ODks
NyArMTQ4OSw3IEBAIHZvaWQgeGVfZ3VjX2N0X3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9ndWNf
Y3Rfc25hcHNob3QgKnNuYXBzaG90LA0KPiA+ID4gPiA+ICAJCWRybV9wdXRzKHAsICJIMkcgQ1RC
IChhbGwgc2l6ZXMgaW4gRFcpOlxuIik7DQo+ID4gPiA+ID4gIAkJZ3VjX2N0Yl9zbmFwc2hvdF9w
cmludCgmc25hcHNob3QtPmgyZywgcCk7DQo+ID4gPiA+ID4gIA0KPiA+ID4gPiA+IC0JCWRybV9w
dXRzKHAsICJcbkcySCBDVEIgKGFsbCBzaXplcyBpbiBEVyk6XG4iKTsNCj4gPiA+ID4gPiArCQlk
cm1fcHV0cyhwLCAiRzJIIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOw0KPiA+ID4gPiA+ICAJ
CWd1Y19jdGJfc25hcHNob3RfcHJpbnQoJnNuYXBzaG90LT5nMmgsIHApOw0KPiA+ID4gPiA+ICAN
Cj4gPiA+ID4gPiAgCQlkcm1fcHJpbnRmKHAsICJcdGcyaCBvdXRzdGFuZGluZzogJWRcbiIsDQo+
ID4gPiA+IA0KPiA+IA0KDQo=
