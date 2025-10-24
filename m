Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03568CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620610E1FA;
	Fri, 24 Oct 2025 18:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBSBGoln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334D810E1FA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761332130; x=1792868130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/6Kpfn2ou/mHKbMbn9adE5NBVp6g8TCxB64qOw96UPw=;
 b=UBSBGolnd9puTOSYZyAFViNCSBJHDaW1FAF7nmJHxIipOyWH/KT59hyT
 y7OuIQlBvLZYRrrXksDZtuWd1vscQxUWqUQN6CgpwCPewvLSoUivlrfj4
 +PQt7gRt3v4v4CWPgflk6GrbY8Q8HBNodXVBcQJDG2s7+6b2zma0v5M0F
 keHTX4FGRy4wlLiNoa95bGmdLtG9Egf4Qfso7i8+d9aB0WJOK7H/PnxwG
 3NbZY6HbpPc3FPBTTLc6+xCWkIZhI8Q6JkcycM5Gdwo4+IJpZqK7v2D1G
 TJa7vvFGh5pzxVPu1vQXMon2zuwikSzl2xYZv7sG78VwvfCgncSJXPvXA Q==;
X-CSE-ConnectionGUID: S9WxrEZOTAqDqmyizEKp7Q==
X-CSE-MsgGUID: 4803KjF9Q6uKJhK6LiFfNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88987070"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="88987070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:55:29 -0700
X-CSE-ConnectionGUID: z9tGusu7Sn+hct7RUj3lSw==
X-CSE-MsgGUID: biJN1HVESCWJgjQsmWI6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="221703051"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:55:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 11:55:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 11:55:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 11:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4xm4T++c3OQfNy5eMVMlGsgnfZ4FzPB5CGPaAjNfog7ix0G9uC/XtKl+uxfCwO+dHalXo/3JbWIerRHJSgp/1ZWOGlbueNe+iVY77f3KfwzyilFV7UwSCCKPQN56dT40gZ4V9NJgWHgmvJT75EqgjwHhXO9yBSl4OPJ9Ka5ultle21slA/A0IWogbNIXqADjq9jRSD/bFjRd+nW0AWOTHPh4KiyDK0LfzQScMda+kVsV5HaHnlum01oRsxRAjt0iqsHH/ih3DtdH04RoBIUvyz8VJFmQWiUNpfLf59//4SeRqdQryVhjdqzUWQpwPKnUrUhz6G1WGF6YAhb1lRE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Kpfn2ou/mHKbMbn9adE5NBVp6g8TCxB64qOw96UPw=;
 b=PbkEnPphszJoflDH5UK578x2Gt+Wk0NLmu7x5yRI7fqUMnTezgzXl+uht8jMYKuzT2XQxLTnFsiX7lLQpL/32HJvapeg/OGSu6wUUGBk47qYWJSVeuyvYMhabtSD2k1aPW5ZhE5oeVok2iXKrClTmaOheUptQyoBC5Pb4yD908HCHdNBAK70aPP7SGihJnvu1jWsh2H7f1oOAXQqFXy+IfLBB4CZPtuMLZMEZqOEf7CiODHLEwu4LyPGuAwn3VDYCkl246d8ngPBdpfA5YcU3WZr2sTbqnlSDZAPQ2NnnxRcdq3pD4NB2FtxpkYiMfgVf5/oPQGYYr0IhLa0eOAeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:55:24 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 18:55:23 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v2 2/7] drm/xe: Implement xe_pagefault_init
Thread-Topic: [PATCH v2 2/7] drm/xe: Implement xe_pagefault_init
Thread-Index: AQHcRRCn/coIj0CKQkSqTXmons0QTbTRpV4A
Date: Fri, 24 Oct 2025 18:55:23 +0000
Message-ID: <d9b8836901d89e7eaf1026ada6dd4e5c8e83a57d.camel@intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
 <20251024180414.1379284-3-matthew.brost@intel.com>
In-Reply-To: <20251024180414.1379284-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7245:EE_
x-ms-office365-filtering-correlation-id: 4eb5c2f5-aa05-4ed3-5bfe-08de132ee358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UzQ1ZDdsMERCMkt2YTErcytPZFBwelFYZjBoTXQvYVBWQnV4WVp4SGxyS3p1?=
 =?utf-8?B?NkVKN3lKdXVlZWpmb1JMQzJFTCtNVGE3RkIxdkFtMFNHUXFzeHFlV0ROcWV1?=
 =?utf-8?B?anFEOHlUM1RCZXVqU3AycCt6S2pIY2h4ZDZhdUQxb245a2trZGdnZmF0WlU2?=
 =?utf-8?B?SG1meGdKQWU0YkUwclhnKzRxWHhwTjBWeUNlaDlJNkRJaVdPZVBQa2VCRlBE?=
 =?utf-8?B?ODRLdTlTb0Rud0x2NHFGaG0wcEtGYjZ3UEpuK0lnQWJjdHp1QTFOdFdoU0s0?=
 =?utf-8?B?TDdjTFI3ZWNJU29rY2tzSUc5Z082MHFKSVgxb0F2dk9vT0pQc2xGYVlod0Zv?=
 =?utf-8?B?OGs1MmtBSTR3WlE0Sm5DaXJOYlh5eEtPNFpzS1EvNk9hUjkxRzRRMDNxL1oz?=
 =?utf-8?B?ZDJKMm9aVzg1MWpDdTJ4ZFJHaFdQaUdWK0ViTjFpUmFQYllJVERjRHYxQWdu?=
 =?utf-8?B?UFFwaXA5cXZNVEdPa1QrZnBDc0YyNllCQ2hFQk5ValFhbEpQY0FPenlQV2xJ?=
 =?utf-8?B?cnJHN2tsRzdFWU9JdkpBdnk3UEV6dzJwM0tiTkxJRzZRN1ZuR2pVZjNsQTNP?=
 =?utf-8?B?RitTblB3VFJWQStLeC9zNmlVMWp0cEtsbnV5N2crQ3RDeXcrdmRyRFdGK3FQ?=
 =?utf-8?B?d3YwRW9sRGdZQVRXckxGNDBCYXBsTU9DUmQzWFhBeU56L2JTeVJRaFFTeUlK?=
 =?utf-8?B?T09lZUhYbVhZUXdTV0lTUmlDRU1aWjFjaFRxOHQ3aDgrUGd5QkFoMWV1QTVL?=
 =?utf-8?B?MkFNUHMybXlrT2dnOHE3Qk80NDJKRDZFN0tFZVl5VjlzY0xsTElWa2svK1l6?=
 =?utf-8?B?dEMzUkljbzRoalkwMjBUZHhiMWxKc0dSOEZnTnJiODlHNjZjM3NFK3MxMUFU?=
 =?utf-8?B?NFlabHNLWVp3ZHEwWU0vQllFMmFsczdmRHU3eWQyZWFWUTgvQnB1NXNZVTI0?=
 =?utf-8?B?eHY2K0dlZGJ6WHFwYmxjUEZXaCtxSE5zQVdiQTM2WWRhYkJmVTEyTm1SZ1JZ?=
 =?utf-8?B?QWdPVjY0TC92b2FwREpVWXpRazlGNFQrL1c3N1pQMEZUYUNjeVRSVG5YdjBM?=
 =?utf-8?B?cExKQjdkMGFTRmFPMkRqVWN4VW1VLzg5L2ZiZDQvakdGUzl6cHE2R3RaN3FF?=
 =?utf-8?B?Uk0vZVhXNWI4c2dsNHZjU2YwcUdmVXp1dlBYR2t5NFRjeXZ3eFI0aW90Nmta?=
 =?utf-8?B?TGhqSW1LcllCeWVSekJvTlhCWFYzZFVPcDIrdjlOcjQzVnhwOWpwcGVlSllv?=
 =?utf-8?B?UlBXWVZ0ZFdlcGdrREttb1J0SGkxSHVXbWlBRzFJVWJZMnpqQ1BqczN1WEsx?=
 =?utf-8?B?R3BxOW9veGhCemZpVFpQclFGMEV4eHpWT2d0TVFzSUwzTjFpRFU4MXE4Tnkv?=
 =?utf-8?B?TUcwTlhmeWZycHdrQkhoT25zQXNzYlU2NTM1L2xqVm5VT2xWQVpPVmJSRmFI?=
 =?utf-8?B?cWs2enRmTlRFS2dVazhwQjZSNEg0MXJmdHJhRW1Uai9naUFiNS9qMHRiRTN1?=
 =?utf-8?B?ajFEbWplMDk4ZEpUemxxRmhqenY4cEJaNDFpQzA2RXljZ3VUcVh6MWxBaW9M?=
 =?utf-8?B?SElRUnFways2b24zWjNENGxHenVhd0x2cHZiOWh4RktOYTdGVTl0Q2laNUxQ?=
 =?utf-8?B?d1FteWp3ellvRlptcGNBUUFXUlVINjBzOFJNbnAycThLczdDcHMrRWJLT0NN?=
 =?utf-8?B?TXo3emNGenNuUkJramxiVml0bmdDcUFBb0pOY0c0VHkrWnNReDBLSzZLM0tj?=
 =?utf-8?B?bXR3S3dRczZaTmdTL0MzWUR6U0l5L2FEdm9xam9HMjhac29mSUdKOWJhZjF1?=
 =?utf-8?B?NEpiVDE4eGlFOVdTNzdXakRockFidTluNjBlOGk0K2tTTXZuUFpYY3lIQVNI?=
 =?utf-8?B?WVdncjk2cWkwZFE1ek9rak0yM0NkYkpFaUI1Z2E0QzUwRVJvam5ZSmtwNDBi?=
 =?utf-8?B?UzZxQlc4TEE3cXJZNy8ybmZyaStJQ1NuWVNVS3J6cW5VSnVTUCtyejZIS0ls?=
 =?utf-8?B?WFZsZFJXZHBTZ2VtVDRKME84OWFQdG5WQ1k5b0hQN3ZqMnI1ejY4d1Y4N21z?=
 =?utf-8?Q?wiDzLq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDV6bVUxcVdqMUE1MXNmTGpiTWV2OEpqY2hIelJRbUdTNzExMGN4a2RVOHRW?=
 =?utf-8?B?Sk05TFFObXlsOHFtSFBzSUFrSk1YRi9wVk9Oejg3SC9kT2d0R2NFSXMxcWxz?=
 =?utf-8?B?MGhVU1FMdnVnd3J5ay9oYTlXNnRES3ZVWlE2c3g4VTAxMGNpMWw4SEtSUmxS?=
 =?utf-8?B?M3ZCc09ONlJGWlQ2VmFYczA1Ym40RXpVWnVRa3R4V25nbWZkR2EwdEM5ZEJ2?=
 =?utf-8?B?Sit2WWVmUFF0dUlUYytlcDBremZSQ0VwbTZvL1RxVmJJS0ovLy95emFvK0RH?=
 =?utf-8?B?R0hJTTNuT0VGajNKMEFZM2padE1tL05BbEtFYVBLVzFMMEh6OUpRUDdBL2VC?=
 =?utf-8?B?RDJwQVRZaFBlY0VtdDdpYmlmb3lxTDhvbjZSelBJZDdtNzNqVmg5eDh6aXpU?=
 =?utf-8?B?Ny93clZCSk9HajBWVU9GNmNEUjJLcGJpQ1MwbkpDdjVYb3UrdzltODBzUDI0?=
 =?utf-8?B?cXVOaUVzTG92TnBCS0Q2MG54Z2taRXBUWmo4U1E3d3RyTGZxT1g0UmdCbkxa?=
 =?utf-8?B?d2tLcVphZHdhZDBsSFBDOEZuWU5MWittRmNyUDJIU0ZOQ2ZtYWwvQng3VnVn?=
 =?utf-8?B?dTdyanJkUHVjUVRRWXI2QisrTWNqK2Z5cCtWTFBDQXRxZWx2ZlVodXp5OVk5?=
 =?utf-8?B?ZnF4Z0JmZHRLbENJNGIxSlZSTUg1QnVPaHdMVm1SeEhrSEszemVSZXFOcGor?=
 =?utf-8?B?T1oxMnYrUEpvdVdLVWNINkU2TU01R3ZMMVV3am1pWG5WN2NpN0FrVjRjNmtT?=
 =?utf-8?B?YnZ6cmJSam55MTNVaFJ4dkZMajllM0dwVTF2SFdFOWFLN1ArU2xLUldZMlBB?=
 =?utf-8?B?V3MxK2FuaHJCR3RoYVdvRVJjdWZ3WWpjSzdIeUw2cXA3YlU1RDJwWXZ2M2t1?=
 =?utf-8?B?Y0FnTEpubG02MlFLRVdVUzN1ZXZCamxBSnljek9VRUxvU3ZFNVZtbythNzYy?=
 =?utf-8?B?Qk5xN3RvdzI0SE04UnBBQUxVL1ZCN3J6ODMxdFZHbTluQittV2svY2p4aGN0?=
 =?utf-8?B?WWVVZ1o5azAxclN1SnZGL3BXUFFnWFFUUEZhb2tCVktXb3VZT1VCaUphWU80?=
 =?utf-8?B?ZWZMYlhPK2lZd2lsbVFQa2owOXliOXhhaUdWQ0c4YnpOWkdydkVCYnQveGJk?=
 =?utf-8?B?NEZqVDhzZVhpSDQrd2xQeDlSaVJVQTdMTGgzMDhoWnd4WUwvWHJjaXN5WU1J?=
 =?utf-8?B?VXZnUDc2MkM3VTRreU50eDRvUDc2QzhWMS8yUkhhZitXemx5STUzRWpqZ055?=
 =?utf-8?B?U1B1b0RUWXJTMVVqTFdBd2NRV0RMd2J0WFR2ak90SGVsK21NK1Y3anpNUWxn?=
 =?utf-8?B?MnRZSUtGZ0ZTZCszMENmbVdoanh6NWJuNkNnTWRPRFpSeHVEK2VrUFpWT2o4?=
 =?utf-8?B?Nm15aWdsZGtpTUJrZFEybzhrL0JmVmxuTGMvSnlpeGpWWW5Qa09IS0prQTFp?=
 =?utf-8?B?THEzNXJxS0hNZHR1Qk4zcUwrUzF4TTU1eXoxYnNEbTF5RlVkTTUwWUdCWlhE?=
 =?utf-8?B?NFVWZFppbnVOdmdPZ2JTYkg4Q2NMTjlPMllUVzVBOU5hOVBVRER0RTAxTWla?=
 =?utf-8?B?eUdWUi9TY1MrejZFT3VvcGJQSUxmeFh6YzcxVjA2dnlTVkNlZTFFMkYxd0JZ?=
 =?utf-8?B?eXk3bmJRTlJCTS9lZDdzRGRJNkVzc3Z4Vk1mTU9RRURoMkU2T0dLSDQ1ZmU1?=
 =?utf-8?B?Y1lVK3cwUzBmNC9kQjUwWkNQMXIzdTZNVzNFcXpxYXdWaCs3ZEVRdEdTb3dM?=
 =?utf-8?B?cURDM1JoMWlIQ3lXL2E1eThxMGI5MkhOSXkyRlR0M0JuUEFGQ3d3Y2s4aXlo?=
 =?utf-8?B?azZsdlVDZmJJSFUrdFpwUmI3dHFqN1U0bFg0ZEJZZ24rNFpzK0lEbXVTVFVF?=
 =?utf-8?B?Nms1WEN5U0FFRW9CUWIyQTVOZEZqYjlla0RhWWhUU1FwVkNlY0VONmVjMmRr?=
 =?utf-8?B?bDlmN2ZaN1k1dWJ4OFFjMU51U1A4cXdDWi9FRDFKcUgrVWtubEZPd2djZWtE?=
 =?utf-8?B?UW9FaUkwWHQ1dGxXWVhzWkFvb25nYkthZXlsbkhJYXpnZldobjRWbXRQU0ZJ?=
 =?utf-8?B?OVZSR29vTkxieExoUVl1Mk4zWnkwOC93dEozZ3J3LzQycmw2MmJyZ0ZQRkVD?=
 =?utf-8?B?L3Y1YmxmSm05VEFxektiN3prdHJkRWVqLzJ3eDlRMTd1MUlSZEdSTVVmaVRV?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F78C91F6FAFEBA47B2A8EA317247C4FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb5c2f5-aa05-4ed3-5bfe-08de132ee358
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 18:55:23.6360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Fz51K7WR+N0McqNuRKfaaIhgaJwe2BUOIN3PEjr9AsGB7rhnPmP+Wwjb1lfIlRgebHKfivO9gQ/wH6Y6BwtG09MsCvs4jSAITSy4RYMlsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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

T24gRnJpLCAyMDI1LTEwLTI0IGF0IDExOjA0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IENyZWF0ZSBwYWdlZmF1bHQgcXVldWVzIGFuZCBpbml0aWFsaXplIHRoZW0uCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gCj4gLS0t
Cj4gdjI6Cj4gwqAtIEZpeCBrZXJuZWwgZG9jICsgYWRkIGNvbW1lbnQgZm9yIG51bWJlciBQRiBx
dWV1ZSAoRnJhbmNvaXMpCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPC
oMKgwqDCoMKgwqAgfMKgIDUgKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaCB8IDExICsrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuY8KgwqDC
oCB8IDkzCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IMKgMyBmaWxlcyBjaGFuZ2Vk
LCAxMDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmMKPiBpbmRleCA1ZjZhNDEyYjU3MWMuLmY0MjYxYTQ2MWRkYiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlLmMKPiBAQCAtNTIsNiArNTIsNyBAQAo+IMKgI2luY2x1ZGUgInhlX252bS5oIgo+
IMKgI2luY2x1ZGUgInhlX29hLmgiCj4gwqAjaW5jbHVkZSAieGVfb2JzZXJ2YXRpb24uaCIKPiAr
I2luY2x1ZGUgInhlX3BhZ2VmYXVsdC5oIgo+IMKgI2luY2x1ZGUgInhlX3BhdC5oIgo+IMKgI2lu
Y2x1ZGUgInhlX3Bjb2RlLmgiCj4gwqAjaW5jbHVkZSAieGVfcG0uaCIKPiBAQCAtOTA0LDYgKzkw
NSwxMCBAQCBpbnQgeGVfZGV2aWNlX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoZXJyKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIGVycjsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGVyciA9IHhlX3BhZ2VmYXVsdF9pbml0KHhl
KTsKCkJlZm9yZSB3ZSB3ZXJlIGNhbGxpbmcgdGhpcyB3aXRoIHRoZSBHVCBpbml0LiBTaG91bGQg
d2UgbW92ZSB0aGlzIGFib3ZlCnRoZXJlPyBPciBvdGhlcndpc2Ugd2h5IGlzIHRoaXMgbGF0ZXI/
Cgo+ICvCoMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiBlcnI7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9udm1faW5pdCh4ZSk7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfaGVjaV9nc2NfaW5pdCh4ZSk7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gaW5kZXggNmE2MmI1MjBmNWI1Li5hNTc4Nzgx
Y2MyOGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gQEAgLTE4LDYg
KzE4LDcgQEAKPiDCoCNpbmNsdWRlICJ4ZV9sbXR0X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVf
bWVtaXJxX3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfb2FfdHlwZXMuaCIKPiArI2luY2x1ZGUg
InhlX3BhZ2VmYXVsdF90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5cGVzLmgi
Cj4gwqAjaW5jbHVkZSAieGVfcG11X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcHRfdHlwZXMu
aCIKPiBAQCAtNDE4LDYgKzQxOSwxNiBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBuZXh0X2FzaWQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKiogQHVzbS5sb2NrOiBwcm90ZWN0cyBVTSBzdGF0ZSAqLwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHJ3X3NlbWFwaG9yZSBsb2NrOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5wZl93cTogcGFnZSBmYXVsdCB3
b3JrIHF1ZXVlLCB1bmJvdW5kLCBoaWdoCj4gcHJpb3JpdHkgKi8KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKnBmX3dxOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBXZSBwaWNrIDQgaGVyZSBiZWNhdXNlLCBpbiB0aGUgY3VycmVudAo+IGltcGxlbWVudGF0
aW9uLCBpdAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB5aWVsZHMgdGhlIGJl
c3QgYmFuZHdpZHRoIHV0aWxpemF0aW9uIG9mIHRoZQo+IGtlcm5lbCBwYWdpbmcKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZW5naW5lLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKi8KPiArI2RlZmluZSBYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlTCoMKgwqDC
oMKgwqDCoDQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEB1c20ucGZfcXVl
dWU6IFBhZ2UgZmF1bHQgcXVldWVzICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCB4ZV9wYWdlZmF1bHRfcXVldWUKPiBwZl9xdWV1ZVtYRV9QQUdFRkFVTFRfUVVFVUVf
Q09VTlRdOwo+IMKgwqDCoMKgwqDCoMKgwqB9IHVzbTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAv
KiogQHBpbm5lZDogcGlubmVkIEJPIHN0YXRlICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVs
dC5jCj4gaW5kZXggZDUwOWE4MGNiMWYzLi5lYTM4MTM3MDQyNDIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhZ2VmYXVsdC5jCj4gQEAgLTMsNiArMywxMCBAQAo+IMKgICogQ29weXJpZ2h0IMKpIDIw
MjUgSW50ZWwgQ29ycG9yYXRpb24KPiDCoCAqLwo+IMKgCj4gKyNpbmNsdWRlIDxkcm0vZHJtX21h
bmFnZWQuaD4KPiArCj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCIKPiArI2luY2x1ZGUgInhlX2d0
X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcGFnZWZhdWx0LmgiCj4gwqAjaW5jbHVkZSAieGVf
cGFnZWZhdWx0X3R5cGVzLmgiCj4gwqAKPiBAQCAtMjEsNiArMjUsNzEgQEAKPiDCoCAqIHhlX3Bh
Z2VmYXVsdC5jIGltcGxlbWVudHMgdGhlIGNvbnN1bWVyIGxheWVyLgo+IMKgICovCj4gwqAKPiAr
c3RhdGljIGludCB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSh2b2lkKQo+ICt7Cj4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIHJvdW5kdXBfcG93X29mX3R3byhzaXplb2Yoc3RydWN0IHhlX3BhZ2VmYXVs
dCkpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCB4ZV9wYWdlZmF1bHRfcXVldWVfd29yayhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKncpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqAvKiBUT0RPOiBJbXBsZW1l
bnQgKi8KPiArfQo+ICsKPiArc3RhdGljIGludCB4ZV9wYWdlZmF1bHRfcXVldWVfaW5pdChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9wYWdlZmF1bHRfcXVldWUK
PiAqcGZfcXVldWUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0Owo+ICvC
oMKgwqDCoMKgwqDCoGludCB0b3RhbF9udW1fZXVzID0gMDsKPiArwqDCoMKgwqDCoMKgwqB1OCBp
ZDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kc3NfbWFza190IGFsbF9kc3M7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCBudW1fZHNzLCBudW1fZXVzOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYml0bWFwX29yKGFsbF9kc3MsIGd0LT5mdXNlX3Rv
cG8uZ19kc3NfbWFzaywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGd0LT5mdXNlX3RvcG8uY19kc3NfbWFzaywKPiBYRV9NQVhfRFNTX0ZVU0VfQklU
Uyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudW1fZHNzID0gYml0bWFw
X3dlaWdodChhbGxfZHNzLAo+IFhFX01BWF9EU1NfRlVTRV9CSVRTKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgbnVtX2V1cyA9IGJpdG1hcF93ZWlnaHQoZ3QtCj4gPmZ1c2VfdG9w
by5ldV9tYXNrX3Blcl9kc3MsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX01BWF9FVV9GVVNF
X0JJVFMpICoKPiBudW1fZHNzOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dG90YWxfbnVtX2V1cyArPSBudW1fZXVzOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDC
oMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB0b3RhbF9udW1fZXVzKTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiB1c2VyIGNhbiBpc3N1ZSBzZXBhcmF0ZSBwYWdlIGZh
dWx0cyBwZXIgRVUgYW5kIHBlciBDUwo+ICvCoMKgwqDCoMKgwqDCoCAqCj4gK8KgwqDCoMKgwqDC
oMKgICogWFhYOiBNdWx0aXBsaWVyIHJlcXVpcmVkIGFzIGNvbXB1dGUgVU1EIGFyZSBnZXR0aW5n
IFBGCj4gcXVldWUgZXJyb3JzCj4gK8KgwqDCoMKgwqDCoMKgICogd2l0aG91dCBpdC4gRm9sbG93
IG9uIHdoeSB0aGlzIG11bHRpcGxpZXIgaXMgcmVxdWlyZWQuCj4gK8KgwqDCoMKgwqDCoMKgICov
Cj4gKyNkZWZpbmUgUEZfTVVMVElQTElFUsKgwqA4Cj4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUt
PnNpemUgPSAodG90YWxfbnVtX2V1cyArIFhFX05VTV9IV19FTkdJTkVTKSAqCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9lbnRyeV9zaXplKCkgKiBQRl9NVUxU
SVBMSUVSOwo+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5zaXplID0gcm91bmR1cF9wb3dfb2Zf
dHdvKHBmX3F1ZXVlLT5zaXplKTsKPiArI3VuZGVmIFBGX01VTFRJUExJRVIKPiArCj4gK8KgwqDC
oMKgwqDCoMKgZHJtX2RiZygmeGUtPmRybSwgInhlX3BhZ2VmYXVsdF9lbnRyeV9zaXplPSVkLAo+
IHRvdGFsX251bV9ldXM9JWQsIHBmX3F1ZXVlLT5zaXplPSV1IiwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGVfcGFnZWZhdWx0X2VudHJ5X3NpemUoKSwgdG90YWxfbnVtX2V1cywg
cGZfcXVldWUtCj4gPnNpemUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+ZGF0YSA9
IGRldm1fa3phbGxvYyh4ZS0+ZHJtLmRldiwgcGZfcXVldWUtPnNpemUsCj4gR0ZQX0tFUk5FTCk7
CgpXaHkgZGV2bSBoZXJlIGluc3RlYWQgb2YgZHJtbT8gSSBzZWUgd2UncmUgdXNpbmcgZHJtbSBm
b3IgdGhpbmdzIGxpa2UKdGhlIG11dGV4IGluaXQgaW4geGVfZGV2Y29yZWR1bXBfaW5pdCgpIHdo
aWNoIGhhcHBlbnMgYmVmb3JlIHRoaXMuCgpUaGFua3MsClN0dWFydAoKPiArwqDCoMKgwqDCoMKg
wqBpZiAoIXBmX3F1ZXVlLT5kYXRhKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVOT01FTTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJnBmX3F1
ZXVlLT5sb2NrKTsKPiArwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJnBmX3F1ZXVlLT53b3JrZXIs
IHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7
Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHhlX3BhZ2VmYXVsdF9maW5pKHZvaWQgKmFyZykKPiAr
ewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gYXJnOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1ZSh4ZS0+dXNtLnBmX3dxKTsKPiArfQo+ICsKPiDC
oC8qKgo+IMKgICogeGVfcGFnZWZhdWx0X2luaXQoKSAtIFBhZ2UgZmF1bHQgaW5pdAo+IMKgICog
QHhlOiB4ZSBkZXZpY2UgaW5zdGFuY2UKPiBAQCAtMzEsOCArMTAwLDI4IEBACj4gwqAgKi8KPiDC
oGludCB4ZV9wYWdlZmF1bHRfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiDCoHsKPiAtwqDC
oMKgwqDCoMKgwqAvKiBUT0RPIC0gaW1wbGVtZW50ICovCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVyciwgaTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYg
KCF4ZS0+aW5mby5oYXNfdXNtKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gMDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgeGUtPnVzbS5wZl93cSA9IGFsbG9jX3dvcmtxdWV1
ZSgieGVfcGFnZV9mYXVsdF93b3JrX3F1ZXVlIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgV1Ff
VU5CT1VORCB8IFdRX0hJR0hQUkksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1BBR0VGQVVM
VF9RVUVVRV9DT1VOVCk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+dXNtLnBmX3dxKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VOVDsgKytpKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX3BhZ2VmYXVsdF9xdWV1
ZV9pbml0KHhlLCB4ZS0+dXNtLnBmX3F1ZXVlICsKPiBpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKGVycikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdvdG8gZXJyX291dDsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoeGUtPmRybS5kZXYsCj4g
eGVfcGFnZWZhdWx0X2ZpbmksIHhlKTsKPiArCj4gK2Vycl9vdXQ6Cj4gK8KgwqDCoMKgwqDCoMKg
ZGVzdHJveV93b3JrcXVldWUoeGUtPnVzbS5wZl93cSk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IGVycjsKPiDCoH0KPiDCoAo+IMKgLyoqCgo=
