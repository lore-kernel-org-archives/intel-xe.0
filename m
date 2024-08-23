Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9C4C5321D
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 21:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4167410E04C;
	Fri, 23 Aug 2024 21:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt7G2fCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BAD10E04C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 21:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724448154; x=1755984154;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7Tpk0NQnxWXBOr4vIJCgsSHDGXZQjLL8EjN1hWlNIX8=;
 b=kt7G2fCkAjt1gaBZgemXZ1x1AyJ6mH6AIK42QHYcjiHsSEaQOQJMSWvW
 qUmXgJ0e5y0/pmKu1GQ4cB59UVMLLlqtz40gF28/mFa5Q7d8LUPEzZlZq
 5uSbf3UjW0dWKLegqVsxe616+fMc3Es2XCG4FQUiZccxIASO8/iriyD/o
 R2RPvhWxRwcZFrkHWg1+Pf/F4/4/Z30HnFTaNLrQyXUnWEX8eWhTlnAc3
 TmxD8joh0BI2w5NGUSdNpgszDdN/L7zFpyWRs9qfwjLgeN9Set9w5PgGi
 o1MRLv9xoR+ooN7HWFZPJAcl6znJy54dDo12nswcX+9AdI9md8wi5olcc Q==;
X-CSE-ConnectionGUID: D6xdSwZSREGcMj+IrJflbA==
X-CSE-MsgGUID: HWfNvdx0Tcio6cXDFh0xcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22827866"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="22827866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 14:22:29 -0700
X-CSE-ConnectionGUID: 7KuyH4QiR2qArN8ZolS6kA==
X-CSE-MsgGUID: 0aBIY6iNQi2Wa2sh9czFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="61912480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 14:22:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 14:22:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 14:22:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 14:22:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 14:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhG7JEv6JGF/jBC7r4yin2U9Es6uENdDqouPI7ZeiOZn7DJTV/EXErGb9UjIJg2buaAvTYuN5ljbsE8WHZrRUvXJXjKAuKyboYfwnnFnFP/RY01aUAHkuzDZf7cJBcd5Qo4u2nMoimW8uQc2tdITd+DeXDDwCwDmslLFrM9pmQ+7FrTJMLG/o1xOKgLVqrSEb1I/SPGQq7+j5ZRSYMDfqQWu5/d0Ebbu24dGBslZEx+rFq+4ACOPaIYG6pAB7Ohx0lUXcS+A2PKNuv2MJFfTzQ1aHEtQJ1TWWTJdtQ8TZGL0rxUXG/WrXVW2oA1irwIk6PQWcsUBXlEcqHkIIeh9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tpk0NQnxWXBOr4vIJCgsSHDGXZQjLL8EjN1hWlNIX8=;
 b=BBCoqoPlQC9Fn+kl3yvTe/FwlRgL1Pml1HchK8wjgtwoFY58bTs1egIGGd4UHslkXHjVo+OMB3wsxTljpQLpsnNOtnidhsf1+aM7XWDSTI4NjPdV68d9FOH1FB4pFxZ7ewVpA3w685iUAv3CHgbWaG9DVRQW4U84pBkP1xDpOCU048K8VRd8fmvPixbAyZDZ+LtF3hkZUx1eQn0z2qJrYAl9xTsNDZVVW6sIydjbA9qYm0L8SaKI/+iPf/0R9b6COgNsSLtWDLZQHhtf3Hxxv6vNrF2sJYs0ylOxRw2GciaGF/gojsRPB/QRM3BBD3R2PXB/O6HnE2OuPaUZoX7isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 23 Aug
 2024 21:22:19 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 21:22:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Cabral, Matias A"
 <matias.a.cabral@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>, "Kumar, Shubham" <shubham.kumar@intel.com>,
 "Ausmus, James" <james.ausmus@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa0L7jLk5Pn9W4/0+8hkrEd96MvLIquGGAgAeoyoCAAcmYgIABeM0A
Date: Fri, 23 Aug 2024 21:22:19 +0000
Message-ID: <3cab72ee68db99761ad07c6b8d8127b7d84ee77f.camel@intel.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87frqwyxsc.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|SJ2PR11MB7456:EE_
x-ms-office365-filtering-correlation-id: 1be2861d-d38e-434a-d580-08dcc3b9ab80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enZBZXZBaWZTeWZHRlp2TkdZWjFYZHRYVkFSUGROUFRGenFBYlJyRkRnNTI2?=
 =?utf-8?B?dmEwWmlVWFB6N3BiU0MxdnZlN211SUZ0TUJoRU9ydG15RFN5OUJXK0pYeUh1?=
 =?utf-8?B?cHdhV05XZldyOW9LWE1IQkZvK2Z3RXFmKzhVZ2ZtYnpmWFVBbnVRMzI5Wmt4?=
 =?utf-8?B?eWJsTG02MjR0WVg0TWZvSGFQU0NyZTBwNzd3WWZqVkJpcm9sclJ1b3JWQ05V?=
 =?utf-8?B?dXF3ZVZEU3RVVnN6V0N3RVRQUXBYZEY4djNKNXdMck05UU0vOG1pNlBYZXky?=
 =?utf-8?B?T2VyN1pza0RYNnAwYUJwWE1WSDVMYjNtMDB1eHZWT3lPZThqM1lrcVR6SGR3?=
 =?utf-8?B?NWxjQVJ5dC85ZGozL0RrU1RDQy9wTXhPbXRNc0xLVnRXbzRlYW1semFiQjQv?=
 =?utf-8?B?d2xjZm91WksvZTN6bW8veW5XTUFucEpUajI3WXovZk02NlY0VUdDTkFxQjRm?=
 =?utf-8?B?c2ZtWC9VcHl4cTRuSVJ4blhjT2FTNzZvUHNBQnpoNWhhN0pINEptNE1tSHhV?=
 =?utf-8?B?U0s5NnFCcDVDcy8yd0swQU1RM2dZR0pILzdvUUxWdGlNLzVpRGJ6bW9Nb2t5?=
 =?utf-8?B?OTR2STd2NStQSThLaEFrQmhnTjBZektjaXMxazZ6cWJUaGRuSDFaN2NDUU9q?=
 =?utf-8?B?SzQxUnBIZ1VZOXBPNjExdmQybTZiK00vckQ2ZFB3UHhJVVFjNjRSRlI2Y2Np?=
 =?utf-8?B?Q2Q0Q2MyWUQwZlF1dkRjK05PWUFEeHczcjM5L3lkcTJ1TXdMak1xb2tpR281?=
 =?utf-8?B?ZXhXWjgxbnhZcEd4TkNDWFFzb1FkWU5DSmhjb3F5dkpuWEsxUEZ0ZXRvaVBS?=
 =?utf-8?B?ZGh4TFJienZzaVdVaXV2czVPc3B3RWhSMGJHVTV2dTVXTmlvMmsyay81Vmpm?=
 =?utf-8?B?UDgrWmZDeUxqNXpaN01CZUJxTkx3WWk5N3VuQllsSnpZZU03WjJtNzhRaWxW?=
 =?utf-8?B?SGVtSEp6REQ2OEhzeWVaT1NyUnFJUjAzWnFUV29qTDI0ME1Ya0FBb2FtMkhk?=
 =?utf-8?B?WDVkRW56b0NsZWlFZXBIWTB5VzB0KzZlcll3RWhHdkYrNGx6OFhvLytteFNO?=
 =?utf-8?B?SDMyRmJvSi9DbjJwMWtEdGFlMWo0dzhJazh5MkpleVFnUGtOalVYZ1VEQlhy?=
 =?utf-8?B?NFo0NGJtUjJUZjkyYStnTXlxUHNUSEE3a3ZCV09FanY3eE42R1NoRmRPSWtu?=
 =?utf-8?B?eEVHVDY1RjVZemF3eVFRaDZCck9FeURrdHFVNE9uNU9iTlRYU3dDaXZBd0lZ?=
 =?utf-8?B?b2xKeVpoV1hlOXdmZ1U2U0t5REZVQlhjTGtnWVBPR1NRZ1k4UzVUWS8zTGtI?=
 =?utf-8?B?amVMUFZWZFNGOFJmMmFRWmIzZlhpWlkvaDdWcUpwbFRZR2p0S1RrSjI2SE1P?=
 =?utf-8?B?VjM1Wlp5c29XWGxHMURIL255RTNmdUFWNEl2bnBaeS9mODNQa1l1ckIyYUZI?=
 =?utf-8?B?Z2o5MkRubVk2U1FMdlhySEx4L05WUWhGVUVQVWtnV2dTVW5kbkR4cDg0eFYr?=
 =?utf-8?B?MlNTVENlSjhmUEdNNENmblRyVk4xUEMvQ01xTXROdU5RY3BhWWQ1YkJNWDB1?=
 =?utf-8?B?cThQc2VPQXlIcDMySHdjYU1RVHd4RzRPcEZwUnZHajk2THI5cDgrdXlkbTdM?=
 =?utf-8?B?b05ZdjBNUnJTeG8rSmdSdzBvaElvc003NUpXMS9OcjB2RCtOWGM5VTdUM1h1?=
 =?utf-8?B?blorQmJPdVNVTWJWdUFocVRJZDdPVTBjbllxdUxWN0ttaUg0WkRrd0pzODNs?=
 =?utf-8?B?d0dEUFhhTk9hd1AxNVdDWWYyVHJlMmxQZTBOcTFPcGtMRnJIS05VS3c2d2xI?=
 =?utf-8?Q?zo3OsLMfyFrJtu7HjcYcfZuyDFONJFyEYACxY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXl2UE9rUmxQRERZS1B0eUpJTGJndHhKTlI5bCtyL3UyTUhubW9zd3NNWjNv?=
 =?utf-8?B?c09pMXU3Z1BITjZnZXJjYnNvYzFpR3pMTStRYzNvbzhQam50d2pBMUxkYjdV?=
 =?utf-8?B?WXVqU1pMcjhERmlzQWtHb3pZbFZ5ekd1OE9pR0xseHI2bXdEV0RnTTFqVU1V?=
 =?utf-8?B?cFdPRmZYUjhUWGthZG9ITjRFL2FqbGViMWtFRUFjRlMwNE96V0VQSW5wek5H?=
 =?utf-8?B?ZnYxajRZRVVDTnl3M0ZYOVpiZkJ6Rm5kbWNpOUtMM2ZMVjRWb3kwV1N1NjNy?=
 =?utf-8?B?cEliM0xtcUJvZXVJKyttZ0ZrQjRaRHdWVTZCd3VTU0NyYjVaeUsrZnlpbGxE?=
 =?utf-8?B?YnArS2xhL2JtOURqT2E5WkZiWGFjRGQ2c1FBcUM3bWFmQVRaMnVqUVV0V2ZZ?=
 =?utf-8?B?WDErT0piUC9sZmNKMlJuK0llQkJyZXhDTDIvL0RtUmN1OFA4UXJQRHVObnIz?=
 =?utf-8?B?MUMwM2kvMkNEOHVBb0FNcFFxMkVMU2xDcFduRUtzelpMZ1ZtQlRWTU5Kc2h2?=
 =?utf-8?B?WkZmQjRmenVVeXNndXZVYWdvZ1M4R3lIUjUvVUxZQ0U0R3ZvbTZ4bXlwcDRD?=
 =?utf-8?B?b0FGeXQyLzhQM3BGR0ZPREtsYk53a2ZNbitGV0xOTjJ6NndPa0R3SzFOaTNU?=
 =?utf-8?B?SHZaTVZpK01pOEx3Q3I4TDMva00vbTNORUdnZkxWclk2bTJsUzc5YWVhOTZj?=
 =?utf-8?B?WUdRb09MZXEwRE9KaVpnbGJaNjhVbkQ5bnRNRm1nK29Xb3JSNWlvMzRrQU92?=
 =?utf-8?B?U2VFNVcvbDVlZThqZm9QVU56NXMwTC9TbWNrMDNYRmc4bE1LQ29DNm9kZ1V3?=
 =?utf-8?B?elljZEdYQm1rNUpLRXV4YkZuU3NCTUVDVTBwVTdGeXFRdlVqc1k3TURkN2dF?=
 =?utf-8?B?ZXJpTXBXdmRVeDBOanN2Y3pDV0MwaUwxK2o1MVRscVBlTEpFL0hlenpUUjFR?=
 =?utf-8?B?RVlyOEFDeHVob3F2aEQ2Q3E1U20wREZIK2txVmp3SkQ2a2lxcWg5L2xwUmRM?=
 =?utf-8?B?VzhYODZuUmdJRDRDdzcvQ0p6WkNsb0thZ2NkOXlkTHV0NXYxZXNGYVQ3VUFX?=
 =?utf-8?B?RmpCdGlIZThSazlnclIxSDl0YnMwd05hb1ZsaVRVbktzYUh0K1p3MHRqc3Rr?=
 =?utf-8?B?VUdWVVN4MnlOUFU3RGhiL0ZCLzV1VUluSDdmVy84ZmlQUjBlWTVYSEhOUmtv?=
 =?utf-8?B?TlUyS1JPVTRna1EySVNrWlNMdEFNUnF6bXZmWS8vdW9Ob3hRSis3Y0JrSHE0?=
 =?utf-8?B?czFUcUNFdmI5QUxodlZzMDhsa1hkMUpBeFREK1AxeFFsU2txSzRmTVN1OXQz?=
 =?utf-8?B?NEZhVFlFWEM3cVBtT3dVN3JmSzB1Y1prZDV0QVAyaUZDMTZ6RGxHdVRzcDhq?=
 =?utf-8?B?bHlVWGhEQWJIaVRRcmNJTlNKOHdBeWJxc3FsaktmdTl5bmI0ZW9VelRRditD?=
 =?utf-8?B?b0tHZ21kUko4a1NNNWhSd3MycjNKYW5sNlhtdkt4SVh6K3dDRjlvUVpOVVdG?=
 =?utf-8?B?Nlo1U2JXRUtLYkxqSGI3S1J0RDEvallTbDBic2hKREJTNEFUQ0hzbGlOZ2JV?=
 =?utf-8?B?VnpIY1R2WExBbUd0UmRBSk1lL0h1cG1LbkRoa0IvSnl2cUNKT1hsalhNQmRX?=
 =?utf-8?B?VFpxNU1Db08rQzdqdkdUYzZtbHVDUlpGa0ZGQmNWTGU4NjY2YXU0QkVhbjN0?=
 =?utf-8?B?TEl3b0Exdzg2UVVNMEF2OGhGRWZkd3BtdnEydVFFamJzdXR4M3p1MDM5Q3dj?=
 =?utf-8?B?empIVjhjREFDdWFUcHZUSkZqSHBqOWhhTm1VWUJnR0hmUHV1UW1McDBwNXdl?=
 =?utf-8?B?ZkpTT1JWZUEvNy9nZmFEeks3UHliUDZYOEpYc3M5ditKcElXRjlsUlR6L0gx?=
 =?utf-8?B?N2V4NkpUZHdxQVRONW1YcU9Ebkt1RjQwaEZaeExPWUdIR3Rld3U0NnBibXM0?=
 =?utf-8?B?M0UrR3g5MnpJSll3U3JGUDloRHpZdmdKeTVxNWVjamFvMlJ3bWhXaTRUTFZE?=
 =?utf-8?B?a2RWUmI1RVdoNko0YSs5RmdWYVdqblk0dzRJYUtWWjlxUURDRDRIeFdqbC95?=
 =?utf-8?B?ZmNLVVZSU3VjTUNmVFN0NS8vYmVmODg5aVJyYWxDZ0VWRkpHTmhsTW1pbWZX?=
 =?utf-8?B?eFlCclVJY1hadzJSSTVhSW9sQzJoOXdpYUIrcjdkT21McHJJNkp4ODhiYS9M?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFFEED4B6B54F549B2616C1C16657847@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be2861d-d38e-434a-d580-08dcc3b9ab80
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 21:22:19.3153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWlHDOsQKlwsDOhSrTm2Kx4f6uzWNl/z5t/tZaAQ1w6n7EoybLzaZDi+H2RWp/s6q9rbNB+POfZ58YcfPiEIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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

SGkNCg0KT24gVGh1LCAyMDI0LTA4LTIyIGF0IDE1OjUzIC0wNzAwLCBEaXhpdCwgQXNodXRvc2gg
d3JvdGU6DQo+IE9uIFdlZCwgMjEgQXVnIDIwMjQgMTI6MzU6NTEgLTA3MDAsIENhYnJhbCwgTWF0
aWFzIEEgd3JvdGU6DQo+IA0KPiBIaSBNYXRpYXMsDQo+IA0KPiBUaGFua3MgZm9yIHJlc3BvbmRp
bmcsIHRoZSBpbnB1dCBpcyBfdmVyeV8gaGVscGZ1bC4NCj4gDQo+IE1lc2EgZm9sa3M6IHdvdWxk
IGl0IGJlIHBvc3NpYmxlIGZvciB5b3UgdG8gcHJvdmlkZSBzaW1pbGFyIGlucHV0IHRvbz8NCg0K
RmVsaXgncyBNUlsxXSBpcyBvbmx5IHVzaW5nIHJlY29yZF9zaXplIGFuZCBudW1fcmVjb3Jkcywg
aWYgdGhlIGRybV94ZV9ldV9zdGFsbF9kYXRhX3hlMiB3YXMgdGhlIHNhbWUgc2l6ZSBhbmQgdGhl
IHNhbXBsZSB3ZSB3b3VsZCBub3QgbmVlZCB0aGUgaGVhZGVyDQphdCBhbGwsIGlubGluZSByZXBs
aWVzIGJlbG93Lg0KDQpbMV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVz
YS8tL21lcmdlX3JlcXVlc3RzLzMwMTQyDQoNCj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRv
c2gNCj4gDQo+IA0KPiA+IA0KPiA+IEhpIEFzaHV0b3NoLA0KPiA+IA0KPiA+IFNvbWUgaW5saW5l
IHF1ZXN0aW9ucyBiZWxvdyBbTUFDXQ0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBfTUFDDQo+ID4g
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBEaXhpdCwgQXNodXRv
c2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAx
NiwgMjAyNCAzOjM4IFBNDQo+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+IENjOiBDaGVnb25kaSwgSGFyaXNoIDxoYXJpc2guY2hlZ29uZGlAaW50ZWwuY29tPjsgTmVy
bGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT47IERl
Z3Jvb2QsIEZlbGl4IEogPGZlbGl4LmouZGVncm9vZEBpbnRlbC5jb20+OyBTb3V6YSwgSm9zZSA8
am9zZS5zb3V6YUBpbnRlbC5jb20+OyBDYWJyYWwsIE1hdGlhcyBBIDxtYXRpYXMuYS5jYWJyYWxA
aW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8xXSBkcm0veGUvZXVzdGFs
bDogQWRkIHN1cHBvcnQgZm9yIEVVIHN0YWxsIHNhbXBsaW5nDQo+ID4gDQo+ID4gT24gU3VuLCAw
NyBKdWwgMjAyNCAxNTo0MTo0MSAtMDcwMCwgQXNodXRvc2ggRGl4aXQgd3JvdGU6DQo+ID4gDQo+
ID4gSGkgSGFyaXNoLA0KPiA+IA0KPiA+IFNvbWUgY29tbWVudHMgYmVsb3cgb24ganVzdCB0aGUg
dWFwaSBmaXJzdCwgdG93YXJkcyBmaW5hbGl6aW5nIHRoZSB1YXBpDQo+ID4gd2l0aCB0aGUgVU1E
J3Mgd2hvIGNvbnN1bWUgdGhpcyBkYXRhLiBBbmQgYWxzbyBjb21wYXJpbmcgdGhlIHVhcGkgd2l0
aA0KPiA+IHdoYXQgd2UgZGlkIGluIE9BLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
Cj4gPiA+IGluZGV4IDE5NjE5ZDQ5NTJhOC4uMzQzZGU3MDBkMTBkIDEwMDY0NA0KPiA+IA0KPiA+
IC9zbmlwLw0KPiA+IA0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIHN0cnVjdCBkcm1feGVfZXVfc3Rh
bGxfZGF0YV9oZWFkZXIgLSBFVSBzdGFsbCBkYXRhIGhlYWRlci4NCj4gPiA+ICsgKiBIZWFkZXIg
d2l0aCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRoYXQgdGhlIGRyaXZlciBhZGRzDQo+ID4gPiAr
ICogYmVmb3JlIEVVIHN0YWxsIGRhdGEgb2YgZWFjaCBzdWJzbGljZSBkdXJpbmcgcmVhZCgpLg0K
PiA+IA0KPiA+IE9uZSBxdWVzdGlvbiB0byByZXNvbHZlIGlzIGlmIHdlIHJlYWxseSBuZWVkIHRo
aXMgaGVhZGVyIGFuZCBpZiBVTUQncyBhcmUNCj4gPiBhY3R1YWxseSB1c2luZyB0aGUgaW5mb3Jt
YXRpb24gaW4gdGhpcyBoZWFkZXIuIEluIE9BIHdlIGRyb3BwZWQgdGhlDQo+ID4gaGVhZGVyIGFu
ZCBhcmUgcHJvdmlkaW5nIGluZm9ybWF0aW9uIGluIHRoZSBoZWFkZXIgdmlhIGRpZmZlcmVudCBt
ZWFucw0KPiA+IChzZWUgYmVsb3cpLg0KPiA+IA0KPiA+IEFub3RoZXIgb3B0aW9uIGlzIHRvIGFj
dHVhbGx5IGFkZCBhIHByb3BlcnR5IGZvciB0aGUgaGVhZGVyLiBTbyBoZWFkZXJzDQo+ID4gYXJl
IGFkZGVkIG9ubHkgd2hlbiB1c2VyIHNwYWNlIHJlcXVlc3RzIGhlYWRlcnMuDQo+ID4gDQo+ID4g
PiArICovDQo+ID4gPiArc3RydWN0IGRybV94ZV9ldV9zdGFsbF9kYXRhX2hlYWRlciB7DQo+ID4g
PiArCS8qKiBAc3Vic2xpY2U6IHN1YnNsaWNlIG51bWJlciBmcm9tIHdoaWNoIHRoZSBmb2xsb3dp
bmcgZGF0YQ0KPiA+ID4gKwkgKiBoYXMgYmVlbiBjYXB0dXJlZC4NCj4gPiA+ICsJICovDQo+ID4g
PiArCV9fdTE2IHN1YnNsaWNlOw0KPiA+IA0KPiA+IERvIFVNRCdzIHVzZSB0aGlzIHN1YnNsaWNl
IGluZm9ybWF0aW9uPyBXZSBzaG91bGQgY2hlY2sgd2l0aCBMMCBhbmQgTWVzYSBhYm91dCB0aGlz
Lg0KPiA+IA0KPiA+IFtNQUNdIEwwIGRvZXMgbm90IGN1cnJlbnRseSB1c2UgdGhpcy4NCg0KTm8g
dXNhZ2UgZm9yIHN1YmxpY2UgYXQgdGhlIG1vbWVudCBpbiBNZXNhDQoNCj4gPiANCj4gPiBBbHNv
IGFib3V0IHdoZXRoZXIgVU1EJ3MgbmVlZCBvciB3YW50IHRoZSBoZWFkZXIgaXRzZWxmLiBGb3Ig
T0EsIFVNRCdzDQo+ID4gd2VyZSBoYXBweSBub3QgaGF2aW5nIHRvIHBhcnNlIHRoZSBoZWFkZXIu
DQo+ID4gDQo+ID4gPiArCS8qKiBAZmxhZ3M6IGZsYWdzICovDQo+ID4gPiArCV9fdTE2IGZsYWdz
Ow0KPiA+ID4gKy8qIEVVIHN0YWxsIGRhdGEgZHJvcHBlZCBieSB0aGUgSFcgZHVlIHRvIG1lbW9y
eSBidWZmZXIgYmVpbmcgZnVsbCAqLw0KPiA+ID4gKyNkZWZpbmUgWEVfRVVfU1RBTExfRkxBR19P
VkVSRkxPV19EUk9QCSgxIDw8IDApDQo+ID4gDQo+ID4gSW4gT0Egc3VjaCBpbmZvcm1hdGlvbiBp
cyByZXR1cm5lZCB2aWENCj4gPiBEUk1fWEVfT0JTRVJWQVRJT05fSU9DVExfU1RBVFVTLiBGb3Ig
RVUgc3RhbGwsIGUuZy4gd2UgY291bGQgcmV0dXJuIGEgYml0DQo+ID4gbWFzayBvZiBzdWJzbGlj
ZXMgd2hpY2ggcmVwb3J0aW5nIGRyb3BzLiBTbyBzaW1pbGFyIHRvIE9BLCB3ZSBjb3VsZA0KPiA+
IHJldHVybiAtRUlPIHdoZW4gSFcgcmVwb3J0cyBkcm9wcyBhbmQgdXNlcnNwYWNlIG9wdGlvbmFs
bHkgaXNzdWVzDQo+ID4gRFJNX1hFX09CU0VSVkFUSU9OX0lPQ1RMX1NUQVRVUyB0byByZXRyaWV2
ZSB3aGljaCBzdWJzbGljZXMgYXJlIHJlcG9ydGluZw0KPiA+IGRyb3BzLg0KPiA+IA0KPiA+IFtN
QUNdIGhhdmluZyBhIHJldHVybiBjb2RlIHRvIG5vdGlmeSBvZiByZXBvcnRzIGRyb3BzIHdvdWxk
IGJlIG11Y2gNCj4gPiBwcmVmZXJhYmxlLiBUaGlzIHdvdWxkIGFsbG93IHRoZSBVTUQgZGV0ZWN0
aW5nIHRoaXMgY29uZGl0aW9uIGR1cmluZyB0aGUNCj4gPiByZWFkIHBoYXNlIHdpdGhvdXQgbmVl
ZGluZyB0byBwcm9jZXNzL3BhcnNlIGVhY2ggcmVwb3J0Lg0KDQpCdXQgd2hhdCBjYW4gVU1EIGRv
IHdoZW4gdGhhdCBpcyBzZXQ/DQpJIHdvdWxkIHJhdGhlciBoYXZlIGEgd2FybiBvbmNlIHByaW50
ZWQgb24gZG1lc2csIHNvIHRoZSBpc3N1ZXMgZG9uJ3QgZ28gc2lsZW50IGJ1dCBpdCBkb24ndCBu
ZWVkIHRvIGdvIHRvIHRoZSB1QVBJLg0KDQo+ID4gDQo+ID4gPiArCS8qKiBAcmVjb3JkX3NpemU6
IHNpemUgb2YgZWFjaCBFVSBzdGFsbCBkYXRhIHJlY29yZCAqLw0KPiA+ID4gKwlfX3UxNiByZWNv
cmRfc2l6ZTsNCj4gPiANCj4gPiBUaGlzIGlzIHN0YXRpYyBpbmZvcm1hdGlvbi4gRG9lcyBpdCBu
ZWVkIHRvIGJlIGluIGVhY2ggcGFja2V0IGhlYWRlcj8NCj4gPiBFLmcuIGl0IGNhbiBiZSByZXR1
cm5lZCB2aWEgRFJNX1hFX09CU0VSVkFUSU9OX0lPQ1RMX0lORk8gYWZ0ZXIgYSBFVQ0KPiA+IFN0
YWxsIHN0cmVhbSBoYXMgYmVlbiBvcGVuZWQuDQo+ID4gDQo+ID4gW01BQ10gc2luY2UgdGhlIHNp
emUgaXMgY29uc3RhbnQsIGl0IHNlZW1zIGFuIG92ZXJoZWFkIGluY2x1ZGluZyB0aGUgaW5mbw0K
PiA+IGluIGV2ZXJ5IHJlcG9ydC4NCg0KZHJtX3hlX2V1X3N0YWxsX2RhdGFfeGUyIHNob3VsZCBi
ZSBvZiB0aGUgc2FtZSBzaXplIGFzIHJlY29yZF9zaXplIHNvIGl0IGNhbiBhbHNvIGJlIGRyb3Bw
ZWQuDQoNCj4gPiANCj4gPiBUaGUgSU5GTyBkYXRhIHN0cnVjdCBjb3VsZCBhbHNvIGluY2x1ZGUg
YSBjYXBhYmlsaXRpZXMgZmllbGQuIFNvIGlmIG5ldw0KPiA+IGZlYXR1cmVzIGFyZSBhZGRlZCB0
byBFVSBzdGFsbCBpbiB0aGUgZnV0dXJlLCB0aGV5IHdvdWxkIGJlIGFkdmVydGl6ZWQgdG8NCj4g
PiB1c2VyIHNwYWNlIHVzaW5nIHRoZSBjYXBhYmlsaXRpZXMgZmllbGQuDQo+ID4gDQo+ID4gPiAr
CS8qKiBAbnVtX3JlY29yZHM6IG51bWJlciBvZiByZWNvcmRzIGZvbGxvd2luZyB0aGUgaGVhZGVy
ICovDQo+ID4gPiArCV9fdTE2IG51bV9yZWNvcmRzOw0KPiA+IA0KPiA+IFRoaXMgd2lsbCBub3Qg
YmUgbmVlZGVkIGlmIGp1c3QgcmV0dXJuIHJhdyBFVSBTdGFsbCBkYXRhIHdpdGhvdXQNCj4gPiBo
ZWFkZXJzLiBPciBldmVuIG90aGVyd2lzZSBpdCBpcyBwcm9iYWJseSBub3QgbmVlZGVkLCBpdCBp
cyB0aGUgdG90YWwNCj4gPiBzaXplIG9mIHJldHVybmVkIGRhdGEgbWludXMgdGhlIHNpemUgb2Yg
dGhlIGhlYWRlci4gUHJvdmlkZWQgd2UgcmV0dXJuDQo+ID4gYWxsIGF2YWlsYWJsZSBkYXRhLg0K
DQpTYW1lIGFzIGFib3ZlLCB3b3VsZCBub3QgYmUgbmVlZGVkIGlmIGRybV94ZV9ldV9zdGFsbF9k
YXRhX3hlMiBtYXRjaGVzIHNhbXBsZXMgc2l6ZS4NCg0KPiA+IA0KPiA+IFtNQUNdIHRoZSBLTUQg
d2lsbCBhbHdheXMgcmV0dXJuIGF0b21pYyB1bml0cyBvZiByZXBvcnRzLCByaWdodD8gVGhlbg0K
PiA+IHRoaXMgaXMgbm90IG5lZWRlZCwgaGF2aW5nIFVNRCB0aGUgcG9zc2liaWxpdHkgdG8gcXVl
cnkgcmVwb3J0IHNpemUgd2hlbg0KPiA+IG9wZW5pbmcgdGhlIHN0cmVhbSwgdGhlIFVNRCBjYW4g
a25vdyBob3cgbWFueSByZXBvcnRzIGFyZSBpbiBlYWNoIHJlYWQuDQo+ID4gDQo+ID4gPiArCS8q
KiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gPiArCV9fdTE2IHJlc2VydmVkWzRdOw0KPiA+
IA0KPiA+IFRoaXMgY2FuIGJlIGhhbmRsZWQgdmlhICdleHRlbnNpb25zJy4gQW5kIGlmIGhlYWRl
cnMgY2hhbmdlIHRoZXkgY2FuIGJlDQo+ID4gYWR2ZXJ0aXplZCBpbiBjYXBhYmlsaXRpZXMuDQo+
ID4gDQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykN
Cj4gPiA+ICB9DQo+ID4gPiAgI2VuZGlmDQo+ID4gPiAtLQ0KPiA+ID4gMi40MS4wDQo+ID4gPiAN
Cj4gPiANCj4gPiBUaGFua3MuDQo+ID4gLS0NCj4gPiBBc2h1dG9zaA0KDQo=
