Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CCACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A5F10E1EB;
	Tue, 29 Sep 2026 19:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y234DXHO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5351510E1EB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790711288; x=1822247288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FkiCGZOdfLuFnLP6uWXi2+OCH/D7ltOZQmaEhOJd35M=;
 b=Y234DXHOskiy0FszoOMoZack6LnN80WspnNdPD4E585AfTIpKAOIKsYH
 R4ej1cF18l7rOpFfgLfrvsvRZclG5+MUO68tYa+/ixncqh7alX7uWYNYR
 YZB1ujgog1N+MV26zbwyoGt/OxtfaX4/4aDKWc1rrDrv+diKudaZEnpjc
 pxn6ELj/nnB+O8/d0HFNFhiJj3WQq/QdSpCKWr5OH/PD6w38wZqUQ5aI1
 c4C53NL9NnSOagFMRXxeAliVZ/zsWeePbgZxsI/a5DI/ppQc+vwBBFkXv
 KoEdGsgZ8BtKEf7UNSwyz1Ilrn8ZFXfXnuoyE2i7DcIjczdpQVPARSptl A==;
X-CSE-ConnectionGUID: plTntwnvQtyrgfypBTRZqA==
X-CSE-MsgGUID: 8AVG9SfoScmR+So9g59ojQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95255326"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95255326"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:48:08 -0700
X-CSE-ConnectionGUID: uT+sVD3nQVS2rRbpwjZyRg==
X-CSE-MsgGUID: luZg7jQbTty6s42sycbS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="279276779"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:48:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:48:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:48:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpLOksKqFub34BiEtnE6cupnED7I+FEup8eyvMPo/u69FjkFCF0wPdoGUXXiBIkgWgRIbExSQ9STbRzB56WcNYjse6NBxHQZwZcXjKEt43mTTrxXTZQV/3/lgeQHFBYy1a7pL/PgPN1v0BWHYeFsruJkHMqKRnPXVOw/6Pwt//od913styoHd/M9690hhrDQwBx2ZnzKl3HcLCGx2xma6aIs9rdOCDYQa6qmBlmMVroaDLXGm2t5xmFaqnpxiciQUMd0vaoXH/Tlv7QYwxrALd4EkeuFO9WX5bAOSgmef0QFEGa4TA66af6c3pxyNDb8p7GFlilZOmT50DbwjRrHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkiCGZOdfLuFnLP6uWXi2+OCH/D7ltOZQmaEhOJd35M=;
 b=nFczv9eCrm8OU7AUw8KnI22/X7g9ohPUZ5gzV28vPt0ch4PBjjnLhD0N4TTOXGTOqGRz8yIECTwmXPgQjwXpzBbWxBioWNYkcnOcj3VhSESQ/ra3ez8naeuPJ5YN/fLxofFjWEOqoAoUHdfrvSxlceuVy0W1wBNLOyWxFyzU3hKRnAuozs/M14see1lrWKTIuN1hKMBhmG45Nc/QEtDXrfA5OBwcUjFEJ8/8/TVKD6aNoTz/3M0cURdiv8xDDqn+dEQskkcZqV4/t7pd+VPM2C/cupchECv9B9Ru157Xl71dns2eyzD9AioCxQjZgW2+prALpLgp2EO9+bbYBylGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SA3PR11MB420097.namprd11.prod.outlook.com (2603:10b6:806:531::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:47:57 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 19:47:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "zhanjun.dong@intel.com" <zhanjun.dong@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Gupta, Varun" <varun.gupta@intel.com>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
Thread-Topic: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
Thread-Index: AQHdRqv4rB+B82epLUKIDr33JwluKrbT934AgABxGQCAEZQsAIAADLyA
Date: Tue, 29 Sep 2026 19:47:57 +0000
Message-ID: <816a0e24cd31ddf6dd41346b25dc2810bd6a67e5.camel@intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
 <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com>
 <aq1MOCcJoTYCMToP@intel.com>
 <20260929190220.GM730887@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260929190220.GM730887@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SA3PR11MB420097:EE_
x-ms-office365-filtering-correlation-id: 48f6d668-2262-438c-2bee-08df1e628f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: HFRiolDTtq/aquqrs2DRk2FSoKe22RDABVkKCy48bmiLdy/y5EyiYt9a79XOy1XIe278D//5WtYtuoAPzYT4eVNIbNFZb1aahzTn/Vw121vORERM3TWGKViIyP9DX8ZDTes7P7TxumLwDRcDga37VrB5Wa+XhYqsxE2vMl4pwuprEiwQ39vGSrEaqVbSM2G6Q6i58uLki7fIE7RV1thWjPT3w4JdaUU1F+yo9El6dSHLgF4S1wlhAt48Hi6ugi/njesrHT/rTXIZ2y7j57GV1GReyIengDLERg+QLfHoukGSCveUgECaCSKvjhnZPaNM/k6UbRBxbMKY++rmkf40o577LiMn+W7Jk5KDZHcJeWYupuTSLAx12bEo/wt/nVY2aB8wEogzNHDrMFfhnvJNrLwGQfRQ8IHzPgwQOcLLeq7IrpDljpw6lv+G7frc7sLERJoqCHY6XkkIxC2fdesUfQ6vBgnHHy5tvr4HV/jJBAW5vmXsOn1B+pdF1pTpSyYkOw+AErkPcKIwRurDOm68+ORoLy7PYPrVjB2CFi2LFExBSkNrFqKrbya2EAfiArfc43Ak9XlzEK8naNHgHzepa+LB3b4Nav4On5LBWPbU7KpZIVXnhR/Pjk7a7Q/80xfVMc9+Nm1yiwfYSUcAXnwdkmP0o/djbuHlw32umyUy0OzTw9UbB/x0IJ0iBCmaLCzmpZ5231OoV3LC/f5c7t8KFRwO2isA+D6YR/Qz06/6kyE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek10ZjNYelp3S2tmVHBNRlpGaWY3bnpBem1LZExrUnZhMFgvTXFlUUNQQ0JB?=
 =?utf-8?B?YTJtaUpVdFg2QTdqVUpWbU9EdlRXbFZzZjRKU2M4UjFqeUp3R0pDYTZZcHhi?=
 =?utf-8?B?Ri8rdHlyZTVMa0J4NjJ1V2xOaGcwclFEb2xua3RUWXhSNS8zWHpPR0doWkFo?=
 =?utf-8?B?ZXVTMHJKZkZMNGhPWmlHK3kxNzc5Qm9PQjNlZDBhZGZWaTRHR2dVVERyMlR6?=
 =?utf-8?B?U2RWcGFkQVh1RHFvS1RFWjdTcHJ5WmVuOEt5TDl3dnp5bzdna2hoaDBKK0cy?=
 =?utf-8?B?RFp2RTVKdU5oaHo1TytZUjZTcUozNUQrSEZYcHRHNzhZbjU0UTh4TXdkSzl0?=
 =?utf-8?B?RHZOM2ZxTUw1VEZoRXRKLzEzWmowNkJUWC9nQjkyWEVMZ3A1TEU0N0lTR1Vr?=
 =?utf-8?B?QWlNMW9Cakx3N0paVlI1V3doajZxbTJmWi9aYTdpbkIzREZnYzd4cVovSStT?=
 =?utf-8?B?aHpkVml3Q2xkZGtBbHVxYkY4UGNROFlvcVlYVWFoYlZhdjJrZklRVjZBVis3?=
 =?utf-8?B?MUp1bk5rY3dsK0gxZVBiUU4zMWJQUEdMOW12ZE9aekNDSFRnNElvYy9ONmEx?=
 =?utf-8?B?cENndk9UYzBOTlNlNUtvalpqeWFnT0s4QzNOT25Cekx1Yk5KN2hUcFF1VVhy?=
 =?utf-8?B?cTF0NGhMbnI5RnY3cTBPUklOYVRuRDlxQzZtNHZqVUt0MWZsMHdoa2IySThu?=
 =?utf-8?B?QVNmZkpNTjZ4TVNQTGNGaFp2czE2d00yM1hiVXJ2Ni81bE4ydCtpTHM4QVY3?=
 =?utf-8?B?QWFaVDVnQW52UzB5VHVkVnJWSm1SSGNxS0gxYnRLek94bnk2YXl1dWFoSEtX?=
 =?utf-8?B?U0xCUDlrVEU5LzN1K0EyTGdKZndDQWl1MjdiSXBWM1FabHJwYzd6a0VoK0Fu?=
 =?utf-8?B?ZU05WWh4SVpyVVVBbmJUVWRXOEpsSSswU2lrcVpVbTVPRWVibDlYVHdTTTgw?=
 =?utf-8?B?TWExVHpKZ1loRzRjL09DaFdyLy96NUs1T3R2RkdxbTQwdjRRQnlZWG1ySUFm?=
 =?utf-8?B?cXVGUklQbkg5ZFExdS9mazNKRVRPTnRIWjdRTHoyLzM1U0NJTFZUNExvSFZ0?=
 =?utf-8?B?eTZQd2YwZG13Szgxc3B0c01xVHIyVkZkZENYVEp4MUo2SDNaRDVxYzNtWVVz?=
 =?utf-8?B?ejV3QUpVb2JvQzVZSEtCTUtXTDIrM3hkQUNSclREY1RHQzErVWRkVm1LTS9z?=
 =?utf-8?B?emdMbXhOdklGNVdzTUxTVjZhTW9FZWE0V1A2Mk5YMlpudlVSUnhDd2tqcTlJ?=
 =?utf-8?B?OS9Wb2VsRVMxYjFHZEtHUDMxNStobnlFZW5TZHdUK0YvaWZxaWVML2VITGo4?=
 =?utf-8?B?QVVINXVLQmFWZ3VhVm5XUWp4ckwxejFSRkxFWWx1WlBHUnRHWHk1Tkx0RHND?=
 =?utf-8?B?WmxTR1hoYTlHVnJLclNrRG9jYWgrMlYyYWFHbDNpKzZtWkhlTG9rc2RmRWJk?=
 =?utf-8?B?S01tcGU1cjJweXl6R0t4Y2RsTXdYQ2ZockZTMHR2UTAvYTRkWlhma3AxWEJM?=
 =?utf-8?B?Z2M0SHN4RktKZGIyV21yeXUwQW9GRTNwN2JpNVBkYWUzZFZhRHVIWFJmQ0s2?=
 =?utf-8?B?R0gyZGYzdStLS1Z4NTNSUGUzQlQrd2pHS0I2R0R1blNESWdMS29VaFNvY0JF?=
 =?utf-8?B?eWlJajJydkY2anBad0tJUDQwdFoyOFlKdm9haURpUFRMcDVBVTVWNEZma2hs?=
 =?utf-8?B?aVZJVzNxaEQyS0F3NjJlWkRjdWxJaW9wcmtPbDVubkhlckRkSmd0VVY1ZDN0?=
 =?utf-8?B?WHFQcWhiZktTeEJva05vcUtJWnFad1dTSTBpaWtpdFN4aXZHV2hvRmw4NTlT?=
 =?utf-8?B?YzFBRS9PbHJWRU11eFRPREVkNUtseVJicUsreTFDWG50RHp2QTEvS1N5ZnBY?=
 =?utf-8?B?UkR2V1JuSkxqbFcydGZTeXZaZDBpQkd1NzFwcWgzYTdNeThScWdBckdKM2pJ?=
 =?utf-8?B?V3BLUzBjdXljWUFtaGxCMStsM1pvcmpmYW1ycVdaL096dzMyVnBWdmNKSE9j?=
 =?utf-8?B?ZUdBUGlmc2pJOWdqSWRpVkJISUlRbGg4RjRYMklCRnlKSlNuWkhWby9DeVZo?=
 =?utf-8?B?QUFibndrM1dhaUlMM3E3NFJDV3VNUG0xNWlVWlMwTllMNFFNQkdROVpNUE1W?=
 =?utf-8?B?clhrTkp3VGNLYmxnRFlRTzRQamcvWnViVWFzRkcrUHYwYkRlRWFRVzUyTzBr?=
 =?utf-8?B?RkEyc20zN0FSTHlROEtsVUR0RjB1MEhOb0RqWXhoN0ZKckY1Slg0UFlqWDd2?=
 =?utf-8?B?M3pGY1dJSkhSYm1qS0w1VE9XSWlaTXZtSjdkVGJqRW9td3FUUkxld1YrckxJ?=
 =?utf-8?B?WS80K05lY1c4c3c4ai9Dbys3RmlwaGxmVS9zQWFuMUo1bXdTUGNramw5blZS?=
 =?utf-8?Q?Zz2LvLJOsZniTKwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAC15843A204D46A33DF2BB7B1A279C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: US9pIIPRvps3IWCqNCVDrv7ESzjhimKYF6qM7Tt1rY7kQabZC5MNbnMKV0y9tvhLZwTd6yDyo/pN2rqJPr6xOmf20smNoh2BAfNzHOWbEag2H5lVAd3JodvvNM/A6J+2H8mSWBzQ5R5DtsoUzMAOZufnCSgRknsuIyHbCkCsiJAFzKIfPjfGV0kDZ4TbjYwFH0RrSBtG53mc5HAWgjeHQhVWJXHdGD5lMlKDIPQLnKz62shKJLgUolArpXWxNmRc2TWhqaKOp71WXrkxOAlfDGFoRwzluLEcoPzbilVd+VwMbadAYvWkdhp3ICpKHpV8kZt0n67QsBiYSgLbCcSbPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f6d668-2262-438c-2bee-08df1e628f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 19:47:57.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pDcFyTj5Vq3srYHoYpcB3eZWqrXLMq6TFE1WnsZMYL7dLZKfzmxvy+cWhc1lTebBO6sMat2Cu8BJKsjPB3x5dTeQhdDKDfowCYkNt7I6y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB420097
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

T24gVHVlLCAyMDI2LTA5LTI5IGF0IDEyOjAyIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBGcmksIFNlcCAxOCwgMjAyNiBhdCAxMDozNTozNkFNIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3Jv
dGU6DQo+ID4gT24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMDk6NTA6NDhBTSArMDIwMCwgTWljaGFs
IFdhamRlY3prbyB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiA5LzE3LzIwMjYgMzo1
MyBQTSwgVmFydW4gR3VwdGEgd3JvdGU6DQo+ID4gPiA+IFRoZSBVTkNPUlJFQ1RBQkxFX0xPQ0FM
X0VSUk9SIG5vdGlmaWNhdGlvbiBzZW50IGJ5IHRoZSBHdUMNCj4gPiA+ID4gaW5kaWNhdGVzIGEN
Cj4gPiA+ID4gbG9jYWwsIHF1ZXVlLWxldmVsIGNvbnRleHQgdGVybWluYXRpb24gcmF0aGVyIHRo
YW4gYSBnbG9iYWwNCj4gPiA+ID4gZGV2aWNlIG9yDQo+ID4gPiA+IGRyaXZlciBmYWlsdXJlLiBU
aGlzIGNhbiBiZSB0cmlnZ2VyZWQgYXMgcGFydCBvZiBleHBlY3RlZA0KPiA+ID4gPiByZWNvdmVy
eSBmbG93cywNCj4gPiA+ID4gaW5jbHVkaW5nIGludGVudGlvbmFsIGZhdWx0LWluamVjdGlvbiB0
ZXN0cy4NCj4gPiA+ID4gDQo+ID4gPiA+IFByaW50aW5nIHRoaXMgYXQgRVJST1IgbGV2ZWwgaXMg
dG9vIG5vaXN5IGFuZCBjYXVzZXMgZmFsc2UtDQo+ID4gPiA+IHBvc2l0aXZlDQo+ID4gPiA+IGRt
ZXNnLXdhcm4gZmFpbHVyZXMgaW4gQ0kuIFN3aXRjaCB0aGUgbG9nIGxldmVsIHRvIElORk8sDQo+
ID4gPiA+IG1hdGNoaW5nIHRoZQ0KPiA+ID4gPiBhZGphY2VudCBDQVQgZXJyb3IgaGFuZGxlci4N
Cj4gPiA+ID4gDQo+ID4gPiA+IHYyOg0KPiA+ID4gPiDCoCAtIEFsc28gcmF0ZWxpbWl0IHRoZSBH
VUNfSURfVU5LTk9XTiB0byBtYXRjaCB0aGUgQ0FUIGVycm9yDQo+ID4gPiA+IGhhbmRsZXIuDQo+
ID4gPiA+IMKgwqDCoCAoSGltYWwpDQo+ID4gPiA+IA0KPiA+ID4gPiBGaXhlczogNGU1NzU3NGZh
M2EzICgiZHJtL3hlL2d1YzogSGFuZGxlIEd1QyBsb2NhbA0KPiA+ID4gPiB1bmNvcnJlY3RhYmxl
IGVycm9yIG5vdGlmaWNhdGlvbnMiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWYXJ1biBHdXB0
YSA8dmFydW4uZ3VwdGFAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgOCArKysrLS0tLQ0KPiA+ID4gPiDCoDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gaW5kZXgg
ZjNiYThhYmZjMjI4Li42MTQ0YTE3NjdmMTAgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiBAQCAtMzQ4Nyw3ICszNDg3LDcgQEAgaW50DQo+
ID4gPiA+IHhlX2d1Y191bmNvcnJlY3RhYmxlX2Vycm9yX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAq
Z3VjLCB1MzINCj4gPiA+ID4gKm1zZywgdTMyIGxlbikNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oGd1Y19pZCA9IG1zZ1swXTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
IChndWNfaWQgPT0gR1VDX0lEX1VOS05PV04pIHsNCj4gPiA+IA0KPiA+ID4gYnR3LCBzaG91bGRu
J3Qgd2UgY2hlY2sgZm9yIGd1Y19pZCA+PSBHVUNfSURfVU5LTk9XTj8NCj4gPiA+IA0KPiA+ID4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiR3VDOiBVbmNv
cnJlY3RhYmxlIGxvY2FsIGVycm9yDQo+ID4gPiA+IHdpdGggdW5rbm93biBHdUMgaWRcbiIpOw0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyX3JhdGVsaW1p
dGVkKGd0LCAiR3VDOiBVbmNvcnJlY3RhYmxlDQo+ID4gPiA+IGxvY2FsIGVycm9yIHdpdGggdW5r
bm93biBHdUMgaWRcbiIpOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAwOw0KPiA+ID4gDQo+ID4gPiBpZiBHdUMgc2hvdWxkbid0IGV2ZXIgcGFzcyBpbnZh
bGlkIGd1Yy1pZCBoZXJlLCBhcyBzcGVjIHNheXMgdGhpcw0KPiA+ID4gYWN0aW9uIGlzIGZvcjoN
Cj4gPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCJOb3RpZnkgdGhlIGNvbnRleHQgd2hpY2gg
Y2F1c2VkIGFuIHVuY29ycmVjdGFibGUgbG9jYWwNCj4gPiA+IGVycm9yIHRvIEtNRCINCj4gPiA+
IA0KPiA+ID4gdGhlbiBJTU8gaW5zdGVhZCBvZiByYXRlbGltaXRpbmcgdGhpcyBlcnJvciwgd2Ug
c2hvdWxkIHJhdGhlcg0KPiA+ID4gZXNjYWxhdGUgdGhpcw0KPiA+ID4gdG8gLUVQUk9UTyB0byBm
b3JjZSB0aGUgZXJyb3IgZHVtcCBhbmQgcmVzZXQgZnJvbSB0aGUgQ1RCIGxheWVyLA0KPiA+ID4g
bm8/IA0KPiA+IA0KPiA+IEhpbWFsLCBuZXh0IHRpbWUgcGxlYXNlIGRvIG5vdCBydXNoIHdpdGgg
Y29tbWl0dGluZyBwYXRjaGVzIGxpa2UNCj4gPiB0aGlzLg0KPiA+IA0KPiA+IFRoZXJlIHdlcmUg
MiB1bmFkcmVzc2VkIGNvbW1lbnRzIGluIGl0Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqB9DQo+ID4gPiA+IMKgDQo+ID4gPiA+IEBAIC0zNDk1LDkgKzM0OTUsOSBAQCBp
bnQNCj4gPiA+ID4geGVfZ3VjX3VuY29ycmVjdGFibGVfZXJyb3JfaGFuZGxlcihzdHJ1Y3QgeGVf
Z3VjICpndWMsIHUzMg0KPiA+ID4gPiAqbXNnLCB1MzIgbGVuKQ0KPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKHVubGlrZWx5KCFxKSkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVQUk9UTzsNCj4gPiA+ID4gwqANCj4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgeGVfZ3RfZXJyKGd0LA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIkd1QzogVW5jb3JyZWN0YWJsZSBsb2NhbCBlcnJvciEgZ3VjX2lkPSVkDQo+ID4gPiA+IGNs
YXNzPSVzLCBsb2dpY2FsX21hc2s9MHgleCIsDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBndWNfaWQsIHhlX2h3X2VuZ2luZV9jbGFzc190b19zdHIocS0+Y2xhc3Mp
LA0KPiA+ID4gPiBxLT5sb2dpY2FsX21hc2spOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9n
dF9pbmZvKGd0LA0KPiA+IA0KPiA+IEFnYWluLCB0aGlzIGlzIGEgbm8gbm8hDQo+ID4gDQo+ID4g
VGhpcyBpcyBub3QgYSBDQVQgRVJST1IgdGhhdCBpcyBleHBlY3RlZCBpbiBhbnkgcGFnZSBmYXVs
dCBjYXVzZWQNCj4gPiBieSB0aGUgdXNlci4NCj4gPiBJZiB3ZSBoaXQgdGhpcyBjYXNlIGl0IGlz
IGEgZ3VjIGlkZW50aWZpZWQgdW5jb3JyZWN0YWJsZSBlcnJvciENCj4gDQo+IEkgdGhpbmsgdGhp
cyBpcyB0aGUgcHJvYmxlbSBoZXJlIC0tLSBhY2NvcmRpbmcgdG8gdGhlIGhhcmR3YXJlDQo+IHBl
b3BsZSwNCj4gYW55IGNhdCBlcnJvciB0cmlnZ2VyZWQgYnkgYW4gdW5oYW5kbGVkIHBhZ2VmYXVs
dCAqYWx3YXlzKiBnZW5lcmF0ZXMNCj4gYW4NCj4gdW5jb3JyZWN0YWJsZSBlcnJvciBvbiBwbGF0
Zm9ybXMgbGlrZSBDUkkgdGhhdCBzdXBwb3J0IHRoZSBuZXcgUkFTDQo+IGZsb3dzLsKgIFRoYXQg
bWVhbnMgdGhhdCB3ZSBhYnNvbHV0ZWx5IGNhbm5vdCBhbGxvdyB0aGVzZSBkbWVzZyBwcmludHMN
Cj4gdG8NCj4gYmUgZ2VuZXJhdGVkIGF0IGFueSBsb2cgbGV2ZWwgaGlnaGVyIHRoYW4gZGVidWcg
KEkgYmVsaWV2ZSBldmVuIHRoZQ0KPiBjaGFuZ2UgdG8gJ2luZm8nIGxldmVsIGhlcmUgaXMgaW5z
dWZmaWNpZW50KS7CoCBPdGhlcndpc2Ugd2UndmUgZ2l2ZW4NCj4gdW5wcml2aWxlZ2VkIHVzZXJz
cGFjZSBhIHdheSB0byBkaXJlY3RseSB0cmlnZ2VyIG5ldyBlbnRyaWVzIGludG8gdGhlDQo+IGRt
ZXNnIGxvZywgYW5kIHRoYXQncyBnZW5lcmFsbHkgY29uc2lkZXJlZCBhIHNlY3VyaXR5IHZ1bG5l
cmFiaWxpdHkuDQo+IA0KPiBJdCByZWFsbHkgc2VlbXMgd3JvbmcgdG8gbWUgdGhhdCBoYXJkd2Fy
ZSBpcyByYWlzaW5nIHVuY29ycmVjdGFibGUNCj4gZXJyb3JzIG9uIGFsbCBjYXQgZXJyb3JzLsKg
IEkgdGhpbmsgd2UgcmVhbGx5IG5lZWQgdG8gZG91YmxlL3RyaXBsZQ0KPiBjb25maXJtIHRoaXMg
d2l0aCB0aGUgaGFyZHdhcmUgdGVhbXMgYW5kIG1ha2Ugc3VyZSB0aGF0IHRoaXMgaXMgdHJ1bHkN
Cj4gd2hhdCB0aGV5IGV4cGVjdGVkIHRvIGhhcHBlbi7CoCBCdXQgaWYgaXQgaXMsIHRoZW4gd2Ug
YWJzb2x1dGVseSBuZWVkDQo+IHRvDQo+IGRvd25ncmFkZSB0aGUgZG1lc2cgcHJpbnRpbmcgaGVy
ZSBiZWNhdXNlIHdlIGNhbid0IGdpdmUgdXNlcnNwYWNlIGENCj4gd2F5DQo+IHRvIHRyaWdnZXIg
bm9uLWRlYnVnIGxvZyBlbnRyaWVzIG9uIGRlbWFuZCBsaWtlIHRoaXMuDQo+IA0KPiBXZSBtYXkg
YWxzbyB3YW50IHRvIGZpbGUgc29tZSB0aWNrZXRzIGFnYWluc3QgdGhlIGhhcmR3YXJlIHRlYW1z
IHRvDQo+IHNlZQ0KPiBpZiB0aGV5IGNhbiByZXRoaW5rIHRoaXMgYmVoYXZpb3Igb24gZnV0dXJl
IHBsYXRmb3Jtcywgb3IgbWFrZSBpdA0KPiBzb2Z0d2FyZSBjb25maWd1cmFibGUuDQoNCkkgYWdy
ZWUgd2Ugc2hvdWxkIHB1c2ggdGhpcyBiYWNrLiBTaW5jZSB0aGVzZSBhcmUgc2VudCB1cCBmcm9t
IEd1QywNCm1heWJlIHdlIGxldCBHdUMgZG8gdGhlIGZpbHRlcmluZyBiZWZvcmUgaXQgZXZlciBo
aXRzIHRoZSBLTUQ/DQoNCkkgZG9uJ3QgbGlrZSB0aGUgaWRlYSBvZiBtb3ZpbmcgdW5jb3JyZWN0
YWJsZSBlcnJvcnMgdG8gaW5mby9kZWJ1Zw0KY2xhc3NpZmljYXRpb24uIEJ1dCBJIGFsc28gYWdy
ZWUgd2UgZG9uJ3Qgd2FudCB0byBtYXJrIGFsbCB1c2VyLWxldmVsDQpDQVQgZmF1bHRzIGFzIGVy
cm9yIG1lc3NhZ2VzIHNpbmNlIHRoaXMgaXMgZXhwZWN0ZWQgZm9yIGFwcGxpY2F0aW9uDQpidWdz
IChvciBpbnRlbnRpb25hbCBDSSB0ZXN0cykuDQoNCkkgZGVmaW5pdGVseSBkb24ndCB3YW50IHRv
IHNlZSBzb21ldGhpbmcgbGlrZSB0aGlzIG1lcmdlZCB3aXRob3V0DQpwcm9wZXIgcmV2aWV3IHRo
b3VnaC4gQW5kIGlkZWFsbHkgd2Ugc2hvdWxkIGhhdmUgYnNwZWMgcmVmZXJlbmNlcw0KaW5kaWNh
dGluZyBhbGwgQ0FUIGVycm9ycyB3aWxsIGdlbmVyYXRlIGEgbG9jYWwgdW5jb3JyZWN0YWJsZSBl
cnJvci4NCk90aGVyd2lzZSBJTU8gdGhpcyBpcyBhIGJ1ZyBpbiBHdUMgYXQgbGVhc3QgdGhhdCB3
ZSBzaG91bGRuJ3QgYmUNCnBhcGVyaW5nIG92ZXIgaW4gdGhlIEtNRC4NCg0KVGhhbmtzLA0KU3R1
YXJ0DQoNCj4gDQo+IA0KPiBNYXR0DQo+IA0KPiA+IA0KPiA+IE9ubHkgY29tZSBiYWNrIHdpdGgg
dGhpcyBpZGVhIGlmIHdlIGNhbiByZWFsbHkganVzdGlmeSB3aHkgeW91IGNhbg0KPiA+IGRlbW90
ZSAqKmFsbCoqDQo+ID4gZ3VjIHVuY29vcnJlY3RhYmxlIGVycm9ycyB0byB0aGlzLg0KPiA+IA0K
PiA+IFRoZSBlcnJvcnMgeW91IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXJlIG5v
dCBhIGdvb2QNCj4gPiByZWFzb24gYW5kIHNob3VsZA0KPiA+IGJlIGhhbmRsZWQgYnkgdGhlIHRl
c3RpbmcgdG9vbHMuDQo+ID4gDQo+ID4gVGhlIHBhdGNoIHdhcyByZW1vdmVkIGZyb20gdGhlIGRy
bS14ZS1uZXh0LiBQbGVhc2UgZ2V0IGJhY2sgdG8gdGhlDQo+ID4gZHJhd2luZyBib2FyZC4NCj4g
PiANCj4gPiBUaGFua3MsDQo+ID4gUm9kcmlnby4NCj4gPiANCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkd1QzogVW5jb3JyZWN0YWJsZSBsb2NhbCBlcnJvciEg
Z3VjX2lkPSVkDQo+ID4gPiA+IGNsYXNzPSVzLCBsb2dpY2FsX21hc2s9MHgleCIsDQo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd1Y19pZCwgeGVfaHdfZW5naW5l
X2NsYXNzX3RvX3N0cihxLT5jbGFzcyksDQo+ID4gPiA+IHEtPmxvZ2ljYWxfbWFzayk7DQo+ID4g
PiA+IMKgDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV9ndWNfdW5jb3JyZWN0YWJs
ZV9lcnJvcihxKTsNCj4gPiA+ID4gwqANCj4gPiA+IA0KPiANCg0K
