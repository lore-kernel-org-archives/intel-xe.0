Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EFDCD8CB9
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F244C10E354;
	Tue,  9 Jun 2026 15:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e14v5T54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FA810E354
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017452; x=1812553452;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=WMIfT7evzvh9qzan0V9ar/DZ+tnrnFLZhdwrJMcc1hI=;
 b=e14v5T54NRo44uwJ7UiTnNbzQjXHoyLxoibdHXb7YfFffbhvh+hColJH
 fhuZB4ugnYH0vx0xlC40vdXYUZ/b0CRuZCktPFfJXqFn63aLD5Ibozhek
 JDmjV8x4p0jLADAansBEBbAGNIBLv0mY8HBqmgzoICgrpItZ4yOej53+P
 gTw7lqjEpTnEXF+cSBnpTr30Poqjd7Qd2Gy/GwVvod4DVFXJVAjL1IYL7
 36fPJ8pS7cwSRmSitiKnDAFPRCxRkg/wQAi3Ag8tIYwFNe1RU7t0z/V2b
 UqhOiiVM9lnDqd/ccrxjgHe5qDd2+19dqTunR/l+ny1vSG5fPpmxAwMVT A==;
X-CSE-ConnectionGUID: 45+oT7V6Q0W8bPz0vlODKw==
X-CSE-MsgGUID: l+uYTd/aT4u/CGxyNaXeaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81687669"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81687669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:03:50 -0700
X-CSE-ConnectionGUID: f1DTN90nT9WKiCuf1c3r+g==
X-CSE-MsgGUID: TCUZHcdkRxGD9hp2Kz2HhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269565579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:03:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:03:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:03:39 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn3GhFXgQRBxvv7i7u4f92bd69oLh+ktXS5XYw5cR6irpfx4ZPQGHqoiTZvOOyKCnl609ouFZCPy0Aj4g0vLijB1cwdHvdRtwZikSjkQSjxmZPsBw+GWIgXkRpFu68i3PZ7SdhqCYNYlM4/mc+VdVs3VeQstoUJiiCpf1SEjddBqwMqzUaEYRmc76JlDCC858ki/iCfpU/7Nza4BR6dtf+JQxr9YlcvGxRk+ybCJifrgyWTUP8ZvYV8sKSXGVqiu5G9XKMhfI+dGxan7vtdhgmCzLdcjgTD3Anqa9qE18LGoi5d7H7CJHU2iEcIeMoqNdqN7eNCSXWKUo4qnubqlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMIfT7evzvh9qzan0V9ar/DZ+tnrnFLZhdwrJMcc1hI=;
 b=vjZm9F7zX/7F40S/ulMyYH5LWNuBAom+7K0A4vYn638m1Phm7nNbDwuquMvhK7uPMjtlhEDj6PHFbDXmHSeqdK5SCICCuVW+v06utGURT+uYvmbwXD3UtEh4dPpqkKUX9rp7y9a6xcKSGk5ASCxl45ME4OPYm/PqaXAEPzyXzy4MWNed7r0oDhMFCWhTCa/qVvNrm9KB4THFohjuyd0mCCnZNSHjf4Z7JFCr3Y4SGFSWZz8akDuXyrziuf8k/z1SwizkHPpVJA+T+8Q/t6tzrClpGPtchZP0jLotWQrtQuMfB83qmaZrlAfwVRQWX2cYjF4hnx+Qxpo3nA/e3Y/o1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 15:03:36 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:03:36 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: drop unused xe_exec_queue_ops::active callback
Thread-Topic: [PATCH 2/2] drm/xe: drop unused xe_exec_queue_ops::active
 callback
Thread-Index: AQHc92PTjrn1TDRo5k6ML80U68NZtLY2U4KA
Date: Tue, 9 Jun 2026 15:03:36 +0000
Message-ID: <bb6121cbb1e2da956ddde3650ea26e338388d0ab.camel@intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
 <20260608162745.338725-3-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260608162745.338725-3-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA1PR11MB6917:EE_
x-ms-office365-filtering-correlation-id: 4a5469cc-e3b0-4d88-6e94-08dec638481b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|22082099003|18002099003|6133799003|38070700021|4143699003|11063799006|56012099006|3023799007;
x-microsoft-antispam-message-info: efXRaTzZieAwpA4FE6fbn5kZMT8hGJ5WAp6WFaPdBhaBAtxA9wh4Uu/3FONqw7hxg1AvQm9cq81vT+xWjuI2BeA8po09vB72uWrY0tkES30yBXcgDXoPafGw6QOcK28H/kzJlpsj20kHWoayeNg3FV0kOnkGK8rloGBAIzxmd7ExvpoQeZ9PJ49dshiKYi46y7ewNCKx0LDR+KrnE7okJnf52J+dGi4C35GA4sXbM05cX+F04o+8Vf1KpjpUeIPfgupb5I79SKSjdL4KkrbHfMNoBlCVjmqjmXI06NYFV5kzA229cYdCQS0wKin+PMooFKYkMzY/lHYkVlwLXOxcb0o0TKrnoUeieepEcxLBYxXdXY79oDobQGGb0ZBIeQQ6E5+OcyruVj+/iuJJVwUS5VjU/lh60XRqxk0LEKFJTNVTwMax/eDxDboDfK6p+lMfcUUp1rAFgfctYAB1aiYNbiHaQPqZ/30nl169hOacR1yfTtkC5rDeh67zjZ0g07SRif2VeIBtKSplDNzPjvgrqnxxu+NUY61Utd9ogmltFwATbn26JGTmWV5ejPG7gh7yZuh1xpIIt3Mcwj7PeGwDKcQlpCi1QvI75LExdx2D8W5MJRVmjIWf8vzbyrypw6jKIa5eeu5Z3IQlCqVquDxAQR5hwJNXKdXkaMkiegVsO1ckR2B3tRE4nQsUy0gEPkpBdWm4t8AaOhbhtEEf/ST5c8tKwjrYcY3RVwRl+K5L0uQwjPEreRiNQ58ZbivG2bIz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(22082099003)(18002099003)(6133799003)(38070700021)(4143699003)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEpTdFh1MjEvVU1vN2hrQitDUGpTWkRrZTlkdUkvYjlYdTB0ekNkekRkVTBs?=
 =?utf-8?B?Zk1Sb3JYRHF1cno3Umg4cU5YNnRNZ2hFTzU1bEdiVEpwcXpJR3Q1bTJOQzNV?=
 =?utf-8?B?amJNRXIzWTVFUlNZM1JkRVJ0U0Y3ZC9uR0ZOV1BjdmxwZEU4UnA2cmhkNmtT?=
 =?utf-8?B?N0RKL1pTR0JNZkw2VExpeWVwVVdOVGgxU0RZV2NFSkJqbFM2ZFNDMnowOENu?=
 =?utf-8?B?SjE2bXdHZisvQS9oYTZVYkNDS2tSS1NEOEEzVWwyaXk0azZRNmQ1OXJtL3ZD?=
 =?utf-8?B?bEgrN0lWbjFBT1gxdFphQW1UY2s1d0JHbWpsYjcrSEZQT3BacC9hWm9Xank2?=
 =?utf-8?B?cjVJTzIweWY4UUZFVitXUEtDUk9HMnd0WGdYejQ0YUdPQThaUytlS2xKUUVF?=
 =?utf-8?B?ZittTm9XdWJSWGJJQUhScHdqd0FGOFhyRlRNdFlPZGFMazViTnhSUXowNEox?=
 =?utf-8?B?eW9QL0V1U0Y5TnNQcG9QWkpVZWVkTGgrWGEvR2VwY1BaaStQMlUrWWVWOGxt?=
 =?utf-8?B?eFlGL2VYOU9JZGViRStyUUZ3VzJsamkxbDFJSUNWbUNIaFNvaGxDMG1INHds?=
 =?utf-8?B?RDhncVkxdmxWV1M1KzJCRUJIMityL1ZBQkRMckdiQVFiVWNKazZsZGRKMmxx?=
 =?utf-8?B?ZWRoWVlRNFhsemVGdGlmNjkvZTVWdEwrRktrSzFiR0pxZDNyblIyVGRzSlk4?=
 =?utf-8?B?YzZ4RmZyRlF4NjRxQ3cyVkxmYVVYVHdqdGN1WU5UeHlld0xjWWphTG5HM3JH?=
 =?utf-8?B?TEM2RmVyWU1ITzlwdmZ4bkZIeHpHMWNUaGI4WmNCa3oxY0IyMVlCckVCNVBD?=
 =?utf-8?B?SG1zZmNRUFJlQTNOcG9SYStsVHM2Z3VYUTR4a0dWYUljdHVJVXdVbHZ3Qis2?=
 =?utf-8?B?Q2ZGNnYzVnZMdW83K240M2NKajY0dDB6cVhiYTF3RnBPMjlNbUxCS0l5SHlZ?=
 =?utf-8?B?OW8xMmJCTEpac05GRk1OMXBUNHMwbGlGZEFPdUtEa0g2c2hWL3dWaUNMR1JZ?=
 =?utf-8?B?T2REcXRtajVlMmtHOXprZnkwNUQ5TzBOZkoxanJ5dEl6YjUyRHczak1MNlBE?=
 =?utf-8?B?NEVoUTdOOW05ZmlkeEs3R2J5ZlNNNjJrbVNrY2JXaDRybFZMM2o5Mk1EUXN4?=
 =?utf-8?B?SWFBZXlJSG54QkhzaHF5N3lPV0NiWHkzY053U2FaL0ZmelgzL3J1Nm9tRlJE?=
 =?utf-8?B?MjZ1ZmRRVGt5Njlob1YyY1I4M3pURWF3TS9zcmUzMGxuS1BjYWFodEtEUVVm?=
 =?utf-8?B?SG9Vak9SVFBvb2Q5NjhPOEtRRHYzZ0g4RG9paWYvQkNKMWE1ZnZYVFFPQStE?=
 =?utf-8?B?N2Rhc0VBQTcxcGFHQ2JDTGVVYkNrcVlZVHcrWWhLaDFoUnR0QlJCZG5mT29Z?=
 =?utf-8?B?b0EvRlh6WHpIYVppdlhIbzRDYzFEZFMyYVlDRWFsc0d3U3hFYmMyU3FZSStp?=
 =?utf-8?B?clg3bnpSeU5MQUJrRjdrMDVsamhFSW1ZVEI1bllCRlMzL2pYWXQyaCtFSk5J?=
 =?utf-8?B?WUVXdHZaaVArMktKaHRHNkdnV2xjUjcvS09zMlZIY3pPUlY1T0RxMW5PdnZP?=
 =?utf-8?B?NGNkUnFoaDJRM2F5QUlqNmR2dzNVUHRtNVRTcU5MK21BSlVneUoycWNVQ2xJ?=
 =?utf-8?B?VEtGQ2YvNGJBVlRIdWJQNWIycVd4ZHYwejFMclg5bFRmMDZDTERMVjA1d1BG?=
 =?utf-8?B?bWM1U09wNGxsQWRzZ1JLL1dVeG9LVDJLQ2pGM2k3YTg0VEJBcnRwMDhJSmNR?=
 =?utf-8?B?aTFrT0hSTnRPSG1Xb052bG05QU9wV2h2TGNDRXl2ZTRxWEpORU5iYnFJSlZD?=
 =?utf-8?B?TmFidWlDenkyTWdxd3JPNHZZdmJIcVJrS3l3dlhIM1A4eVA3ZnhOYit4UUFK?=
 =?utf-8?B?YTQ5TWxvQm5uZExadXZPL3dGWHBpWjF4Qm5SSWp3dVFsU0JQMEdNVHYxcWR6?=
 =?utf-8?B?RWt0b1hjYXdIZHdBWnRBYUlrTXh3MU5aKzhxQ0x2emJYY1FUK1ZTcWJSbnRX?=
 =?utf-8?B?Z0ZMYnRLR3lORVM5WGNYbkZ3VGFMcFV6YzltTHJGa3JjanFrbVlqUlVkUExY?=
 =?utf-8?B?Vm5hVW5pR2F0NjhzcXdBSy91M3VoVFlicmo3Um9PTUlCa3JLdndMODU1SDVw?=
 =?utf-8?B?V0FhVGJEeXlFa283UnZPVTFvUU9lZTBFYUduanJJS2FSTVdmOVh3c201WHlu?=
 =?utf-8?B?clhjc0NweUVRMkNwMm1PTTZUeWNpWjVaZ2xYNDMzaEZSMGsvZDFaamZSYity?=
 =?utf-8?B?QUw4Zk9tcElVSWxUZWJ0OFIzOHF3Z1dmUDVpTVBlSnM5ZGxIUUU4MUhsMyty?=
 =?utf-8?B?YmFnSUMwYTY2Q3FpWXhhWnpEMWFBcHZjR2RuVjY0c1puYzQyZnBhTFhnU1JS?=
 =?utf-8?Q?TFXTucoZdb6QElWaMIa5O/5KpgTRD4IN++T/c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFF26797CE12DE4C966C97B838057AAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XqKGJPqzudfg8aH0dTWZD+cJ8ttxScbwUVtRz/mwEueD+9ZCptyluggJHyV9lD28KF92/YrbT0wEBDSPpr/BPtxCAHG1LhHfXanjvCmtdONG2bQCA4qhV/ALTRv83lgTUsh5hUv+4E9WPf4WrR2LxOzmF6PDpGruijprm5ffTro7g+Va3Yp6vndDdIS0SNu6e0kYALWRHH1MnPcc2oB0bXcu1IqhwQ8RCqyG35hBYmG6kai4IcP91WgTbDCvNelFDO7hejg/OxCdRxLIHnMPVt5VJ1U/o3NR8CWcwi0xfSBE48esFN9/62HCREwf96w5ivtwhD+YOpq9c1Pa5ar+qg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5469cc-e3b0-4d88-6e94-08dec638481b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 15:03:36.2845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gkZMzvPLacMyG9zVD0BAKq8yU4905Zj3ycHDtxQOqYCg6RL0neFqiZ15EcAm2a2DV75A4S5+xb2RU7OpdQmXqcmUT7tSfpbVsY5s1hayBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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

T24gTW9uLCAyMDI2LTA2LTA4IGF0IDIxOjU3ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gc2VuZF90bGJfaW52YWxf
Y3R4X3BwZ3R0KCkgd2FzIHRoZSBvbmx5IGNhbGxlciBvZiBxLT5vcHMtPmFjdGl2ZShxKS4NCj4g
VGhlIHBlci1WTSBleGVjX3F1ZXVlIGxpc3QgaXMgbm93IHdhbGtlZCB1bmZpbHRlcmVkLg0KPiAN
Cj4gV2l0aCBubyByZW1haW5pbmcgY2FsbGVycywgZHJvcCB0aGUgLmFjdGl2ZSBvcCBmcm9tDQo+
IHN0cnVjdCB4ZV9leGVjX3F1ZXVlX29wcyBhbG9uZyB3aXRoIHRoZSBHdUMgYW5kIGV4ZWNsaXN0
DQo+IGJhY2tlbmQgaW1wbGVtZW50YXRpb25zIChndWNfZXhlY19xdWV1ZV9hY3RpdmUoKSBhbmQN
Cj4gZXhlY2xpc3RfZXhlY19xdWV1ZV9hY3RpdmUoKSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBU
YW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRl
bC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQoNCihBbHNvIHNlZSBwcmV2aW91cyByZXZpZXcpLg0KDQoNCg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oIHwgMiAt
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jwqDCoMKgwqDCoMKgwqDCoCB8
IDcgLS0tLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmPCoMKgwqDC
oMKgwqAgfCA5IC0tLS0tLS0tLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlw
ZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gaW5k
ZXggMmY1Y2NmMjk0Njc1Li5kMjdjZTI0ZGFhZTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiBAQCAtMzE4LDggKzMxOCw2IEBAIHN0cnVjdCB4ZV9l
eGVjX3F1ZXVlX29wcyB7DQo+IMKgCXZvaWQgKCpyZXN1bWUpKHN0cnVjdCB4ZV9leGVjX3F1ZXVl
ICpxKTsNCj4gwqAJLyoqIEByZXNldF9zdGF0dXM6IGNoZWNrIGV4ZWMgcXVldWUgcmVzZXQgc3Rh
dHVzICovDQo+IMKgCWJvb2wgKCpyZXNldF9zdGF0dXMpKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
KTsNCj4gLQkvKiogQGFjdGl2ZTogY2hlY2sgZXhlYyBxdWV1ZSBpcyBhY3RpdmUgKi8NCj4gLQli
b29sICgqYWN0aXZlKShzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSk7DQo+IMKgfTsNCj4gwqANCj4g
wqAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gaW5kZXggOWZiOTljMDM4
ZWE4Li42Yjg2YjRmOWNjMWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjbGlzdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jDQo+IEBA
IC00NTgsMTIgKzQ1OCw2IEBAIHN0YXRpYyBib29sDQo+IGV4ZWNsaXN0X2V4ZWNfcXVldWVfcmVz
ZXRfc3RhdHVzKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiDCoAlyZXR1cm4gZmFsc2U7DQo+
IMKgfQ0KPiDCoA0KPiAtc3RhdGljIGJvb2wgZXhlY2xpc3RfZXhlY19xdWV1ZV9hY3RpdmUoc3Ry
dWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+IC17DQo+IC0JLyogTklZICovDQo+IC0JcmV0dXJuIGZh
bHNlOw0KPiAtfQ0KPiAtDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9leGVjX3F1ZXVlX29w
cyBleGVjbGlzdF9leGVjX3F1ZXVlX29wcyA9IHsNCj4gwqAJLmluaXQgPSBleGVjbGlzdF9leGVj
X3F1ZXVlX2luaXQsDQo+IMKgCS5raWxsID0gZXhlY2xpc3RfZXhlY19xdWV1ZV9raWxsLA0KPiBA
QCAtNDc2LDcgKzQ3MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMN
Cj4gZXhlY2xpc3RfZXhlY19xdWV1ZV9vcHMgPSB7DQo+IMKgCS5zdXNwZW5kX3dhaXQgPSBleGVj
bGlzdF9leGVjX3F1ZXVlX3N1c3BlbmRfd2FpdCwNCj4gwqAJLnJlc3VtZSA9IGV4ZWNsaXN0X2V4
ZWNfcXVldWVfcmVzdW1lLA0KPiDCoAkucmVzZXRfc3RhdHVzID0gZXhlY2xpc3RfZXhlY19xdWV1
ZV9yZXNldF9zdGF0dXMsDQo+IC0JLmFjdGl2ZSA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfYWN0aXZl
LA0KPiDCoH07DQo+IMKgDQo+IMKgaW50IHhlX2V4ZWNsaXN0X2luaXQoc3RydWN0IHhlX2d0ICpn
dCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGluZGV4IDRiMjQ3YTMwMTlk
Mi4uYjI5Y2MwOGU2MjkxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
QEAgLTIyMjAsMTQgKzIyMjAsNiBAQCBzdGF0aWMgYm9vbCBndWNfZXhlY19xdWV1ZV9yZXNldF9z
dGF0dXMoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEpDQo+IMKgCXJldHVybiBleGVjX3F1ZXVl
X3Jlc2V0KHEpIHx8DQo+IGV4ZWNfcXVldWVfa2lsbGVkX29yX2Jhbm5lZF9vcl93ZWRnZWQocSk7
DQo+IMKgfQ0KPiDCoA0KPiAtc3RhdGljIGJvb2wgZ3VjX2V4ZWNfcXVldWVfYWN0aXZlKHN0cnVj
dCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiAtew0KPiAtCXN0cnVjdCB4ZV9leGVjX3F1ZXVlICpwcmlt
YXJ5ID0NCj4geGVfZXhlY19xdWV1ZV9tdWx0aV9xdWV1ZV9wcmltYXJ5KHEpOw0KPiAtDQo+IC0J
cmV0dXJuIGV4ZWNfcXVldWVfZW5hYmxlZChwcmltYXJ5KSAmJg0KPiAtCQkhZXhlY19xdWV1ZV9w
ZW5kaW5nX2Rpc2FibGUocHJpbWFyeSk7DQo+IC19DQo+IC0NCj4gwqAvKg0KPiDCoCAqIEFsbCBv
ZiB0aGVzZSBmdW5jdGlvbnMgYXJlIGFuIGFic3RyYWN0aW9uIGxheWVyIHdoaWNoIG90aGVyIHBh
cnRzDQo+IG9mIFhlIGNhbg0KPiDCoCAqIHVzZSB0byB0cmFwIGludG8gdGhlIEd1QyBiYWNrZW5k
LiBBbGwgb2YgdGhlc2UgZnVuY3Rpb25zLCBhc2lkZQ0KPiBmcm9tIGluaXQsDQo+IEBAIC0yMjQ3
LDcgKzIyMzksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2V4ZWNfcXVldWVfb3BzDQo+IGd1
Y19leGVjX3F1ZXVlX29wcyA9IHsNCj4gwqAJLnN1c3BlbmRfd2FpdCA9IGd1Y19leGVjX3F1ZXVl
X3N1c3BlbmRfd2FpdCwNCj4gwqAJLnJlc3VtZSA9IGd1Y19leGVjX3F1ZXVlX3Jlc3VtZSwNCj4g
wqAJLnJlc2V0X3N0YXR1cyA9IGd1Y19leGVjX3F1ZXVlX3Jlc2V0X3N0YXR1cywNCj4gLQkuYWN0
aXZlID0gZ3VjX2V4ZWNfcXVldWVfYWN0aXZlLA0KPiDCoH07DQo+IMKgDQo+IMKgc3RhdGljIHZv
aWQgZ3VjX2V4ZWNfcXVldWVfc3RvcChzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdA0KPiB4ZV9l
eGVjX3F1ZXVlICpxKQ0K
