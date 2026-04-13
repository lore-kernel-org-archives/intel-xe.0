Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E7F34C51
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0339010E43C;
	Mon, 13 Apr 2026 13:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5Wy/cnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8149010E43C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086008; x=1807622008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/CU6+LukUXSim92S9kJjiuBoVaOxd6+jfLYMgAau53g=;
 b=i5Wy/cnL/QXMESC/9dIH54CVZYEkwIM3WDxVrcv27vonruDgwWox9cJH
 YthNv+ooueUc0N3MZ405PmIvX3vujnjXDBuovZgs4EUpf9V5EFl0GU9aP
 y7/oWj7zDtVRee0VXuxKRoWEAOLYxnQrDA810fA5CFYbvCeAwDXjY072v
 YCqfqU7dHeNNCpTQ9xpAD46pnk03vr44ndeEVAEM/6QwOi+7hN9/pL/Ou
 KwH1bBdS7A0yDj236Y2bd3UhZA6t/qf/+Zv9AaOKltXDIF05pBQ9VYkB8
 5yyXajN58UUxPGRnFR8DfMvme2xlFzpTNWd3h4MaTsQGYYpBpadNugNvq Q==;
X-CSE-ConnectionGUID: UAVF+lOWSVCqAYPAtsZGzw==
X-CSE-MsgGUID: RnTN/4sGQPSQ+unpn36FjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88402319"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="88402319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:13:28 -0700
X-CSE-ConnectionGUID: fu2IlnOPSaeD5/zIAwN47g==
X-CSE-MsgGUID: pGA4Vlc1RueAbe3eBJ9N8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234763598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:13:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 06:13:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 06:13:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 06:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCG2tJnVysu1ELZmJDLhoad588ITUAoHJJ4jpb/tNAPLP0KzJsoNZmP9ut6ZmTOa0cdtDU+wkwnmDyZmsekQ/03rp97Ds8TgNWJPERmyi8WeoG4TK3q/tXK18w7IT6R0qxSHOOJn5+EJvVTkiC46IRqwhIImvQTiMHP/U0SKnOx3ulKrLRqvmHnku80DWU8MC2uI7PItZTg6AoW6LWlGhpXXEk65qYfmSdemqdR9gw/TPu0OqRpCjwxGJmpPghQV17vD+sA/ri1YyQlvf/irhNc9XNi3dz8q4aUfaCcelMoR/3P7c47tBsLFp/rmPk1/a+1NRlZS6ipbXsUx0e2qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CU6+LukUXSim92S9kJjiuBoVaOxd6+jfLYMgAau53g=;
 b=fI2tc8wIcXmHPY6+5bX8PmApMH59gyQ2EyS75LgKTZqyXsd6TEqqtQiGlbbszyHbF35Yl81ejk2SU0U9p9Jqv8P8VhXGYiNe4HtsU+gNLRbnwRovC1jVZ+J+hzWidiwYuucxcyjp1lgFleKcHGIrhfDknypoqRYDlDoxZYovBoTdPQVwohZqzeZRobJvVKdxzDR8eqA805p0eDuur2ndAEOTrDKInRe+i/0gp5W0B8tUQLlIh0S2DU+aekY1zj9yNcqhqCzMkrnnJs09+oNCYddIZnopQtAY/sVl7LmDzriJDtkjfI3tgechZDEvSXiO8TEs/70e413UbVm+jsOjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 13:13:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 13:13:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Topic: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Index: AQHcvd/CEYQrJDR9/kOeC41aP51gA7XK7iEAgACpkwCAEXqnsA==
Date: Mon, 13 Apr 2026 13:13:22 +0000
Message-ID: <SJ1PR11MB62040B7EB12572CB3C3DB1C781242@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-11-tejas.upadhyay@intel.com>
 <ac2zqvxb0/hxGPgm@gsse-cloud1.jf.intel.com>
 <3297278d-9f36-484c-b4de-8a22545f0b5f@intel.com>
In-Reply-To: <3297278d-9f36-484c-b4de-8a22545f0b5f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB6685:EE_
x-ms-office365-filtering-correlation-id: 6a70870f-b116-427f-85f8-08de995e706d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: bOS+9PDXBCxlbLhxC+WehjRMUAkeYLt17e8m2wkv16/gaVogT9hSLkGrn5mCZV9ii8G/d0I+sJ+WIOxRE1YLYnP2KkS2pv5eGLnujFv7YGaZKYkLVpjPQjP7A9pwRi8ictI84AYWea58lVvFDLAWBWOLmC0CbFri/cuYV+XtKi4kcZNBGivAS1H3IUMhvpkqF3nlaBsORzG+/efUEMDQTfT77cQhagR7oWnTGmIvYVIKXHVnUm36L1QQdL4AKezoTrTGUCK/tSLdPPt200fs+A18eVldcd/8LaItVrOesG2EIveYZnhyOwcw2I0kPSVJ7PBWpFiWqGMA6tQqG+Cu0vaX3Ou/NBWwH5JfNXXQCLcZJC7CeEWzrKRbspEe1/3XyYpfzmg4AiDezADHkxb+OVUaXtRXOXDnNTZYPlt6FOv1sMkVqs3iS+NKy7AUASb+93rHJ4irgAyPlKAIwNZXEck/cgmP5N2jw+Smj2YGDrhrbsfOI3D08OpaYY+VJtzZP9QTf0/TXLeXOZ6t0/2vGR3FRZMyVgGozquRYh51cXtSZTmg+bhniFe/uUQx7y6F9C2+gd9zNAFBQqXGwvHPfm/hflnEw9fDmE/GYzZ9fHpvBA9fl7qK//169aL/xRTgP1mhcqOQ9mfapkjaIrCWSIZgMHzspF+W9NOjOpdsn9A5PPz9gFLEMIQALgLoxAT4P2CIBXTu7JjzO+s5njsby7ETFXgQTSn30B4fi6ePz0wt/vzTSHJGoUW/cA7omHM3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXIrY0JmeTczWWM4ZmpNN3MyYjNwd2UrWmpYTzduOGNqdDJUdW1JR2RmWnRM?=
 =?utf-8?B?b1l6Tk9RQWwrYTAvN3pkU2tTU3lReXp5TnFVellqRXdVQUdjNnNFalBSQi9W?=
 =?utf-8?B?NGwvaUk5QjB2bUhrbUVWMjcva2d3dGtYWjBJMFhzSWozYm5NRGZRTWxxa1pw?=
 =?utf-8?B?YjJGTy83K05SL3cvZE41VHY2RW41QmlOZnluNEpGUXFoWkRKRUhLdy9QT0VP?=
 =?utf-8?B?S2M5U2liVVRiYlN0Y2hvVTFvUEQ4N0o4dlB4ZjYwWjVoeVFhYkdnUHFENWIz?=
 =?utf-8?B?Y010aDE4aVA2aUFDUnlMcFNXY2hGWUU0SXJnem1hTWFBUnpVY0p4SmcwR2VH?=
 =?utf-8?B?bmRsbDFBNVBEczBrd3pPRE12UmNqV1RieTFXTzEyZDBWeCtUN1YydGVzcWpX?=
 =?utf-8?B?b2VDbnU1K2ErdC9rNHJpcTdzc0V5d1lKUXVESTRsV2VHb2orWVAyeTZsenhV?=
 =?utf-8?B?VVpFdHNoZ0p4YWZETTNlVjN4b3FzMDdpY01PSm0xZWY1OWFFNlY3YmpSQVN2?=
 =?utf-8?B?bm0wOStkWGl5bS9ZNnU1eVJaUGpiTVBxTWJ3dHVxSFhEcVJGbGQwbGFqcE5a?=
 =?utf-8?B?OENoV3kyWUV5a29jWjBCblFsdVhjSllzRVJKbkZhQ1NlZUkvdTQ2TElIY1dC?=
 =?utf-8?B?aEZFVW5ib3pNU29WNjR1aUg2c0I4NUtBYVFsWVNPcVkzRXp6TjNzdVJmc0Iw?=
 =?utf-8?B?NGoxelVjaWo2WVI4UlpSdVBDeWxra2pWY0l6T2JwRmdXODF5dFhVS01zampz?=
 =?utf-8?B?bXlFazBtR3cxTXlGdldkbUU3c2EwWERUeExyYTA1R3p4VHp3cWtLT1d0Z255?=
 =?utf-8?B?VDRNYkFwYnFaY21HQW8xd3dNajVIQ250RG8xSnBBVDU4aHd2RmMzbjdTMTlk?=
 =?utf-8?B?S25lUUh1eW9zZ0gzMG5OUjBMYnYvY1YwUXhiMjFkNXk0M1NyZVdFYTVURHJw?=
 =?utf-8?B?S284QXh0Ui9nZ2FGK2VBWlB2ZFpPNU9oODVyNk9lMERNL3ZLU2Ywblh0QmZX?=
 =?utf-8?B?cUhTWlhiWUJDSUU3VzhIbTJrbjhqYjJYdld6YTVYOHpnZUpBT0ZzbEN6Mzd4?=
 =?utf-8?B?WHJmZVE2NGt5ekVXbzF3cnFEV0hVNlJFZGwzeUU2bWVDd003SC9nbWd5eXlr?=
 =?utf-8?B?NFZCOHB6VEZ5V0g0N0pjYlcvcTExeHBMN2ZIMUZnTzB2OTRFVUcxejlzZjIr?=
 =?utf-8?B?U1AxaWZySHFFUEZrYmduaWVieThlcnRqTy9hcGR0dk9KQnRvZTZxeTNRbHBT?=
 =?utf-8?B?L096bnk3WmVHVXdjdmgvVkdjcUYySlY2QW9KblFWMktqZ1RCV0d4UENoTFk4?=
 =?utf-8?B?Q1lTd0cvUER0cDB3UlBRSkVxM0NhUkI5cmRROXRFdW0vMzdLVG5DUHppN1FU?=
 =?utf-8?B?OGxaZ1BiQ1AwOXNNWTJYNG9Va2xzbVpGa2dUdzZUcENoMG9DVmtQaFdHQWlE?=
 =?utf-8?B?VXBITzVHT2NvSHZFZzg1MUFBc2tadFpwMUNIQ2Q1VVVRMW5EaGVEUCtOa0Ni?=
 =?utf-8?B?ZTRDU3N0UFN3SGhNWElwVEgycjBsL3RMUGtSMzZFUEY0cWNQeVp1cE1QNFVK?=
 =?utf-8?B?MXMwa2RLRXlWWjI1NlNRTGtDWkxyenNQUnlwSlgrQjJ2NTZZd1VId0xhdVd4?=
 =?utf-8?B?WTRvR1FxbnVkYS94VkIyTmp5a0VhSGlPWHo1Mks4dG1MSTdjc2x5ODVyd1B4?=
 =?utf-8?B?WWpFQXVGS1M4a3NpK2hFVGlQYUxqQkhRdHdyWVJDNlRVNXUyaXNMM1JrUlRP?=
 =?utf-8?B?T1lEQ3d4MGI2Mi9KNG5mUmM2REgxcFNJd1BNQUNIcmVkSW9OdG9ZZmVYSjVt?=
 =?utf-8?B?clJodEdjNThhWWhpU1VGcnVEbk9EQnJoV0UzV1Y0UkRHRHMzb2F3Y3Z4d0Y0?=
 =?utf-8?B?Rm5Ua2psSTU5bCsyY2ZPdlJoYVdNaTFsZDdqVk9PTGVET2p6eEFYR3JraUZn?=
 =?utf-8?B?WEFvU2s3WW94QVcrend0cFF6dWJQbExUVE5QOGtxQ0xQc29aSUZtUzhRb2dU?=
 =?utf-8?B?WXYyVlZEa0JNMnFzQ3haUEppSkhMS0dSOWhNWCt1OXY3bmxkcktneUEzNklI?=
 =?utf-8?B?MFMrZUFEendPcFVlMm83NURDRmZkRkNSRE90WmdSNWxwNUk4UGtLaFFFeWY1?=
 =?utf-8?B?R2pJS3V1WWJ1ZFJSN1U4Y28wdHZ6c2lrR295eVJES3ZrL2NJblNidkZFaUNu?=
 =?utf-8?B?aHYzeWRTNUhaMXkzRHNyMnFEWUVIRStFcVpCNS9LQlhjcklmdFF0UlNPSXRK?=
 =?utf-8?B?UUd4Wkp1b1dzY1NKb3NsY2kwQ0JjQWFvK3JpSmh4VlMwa3RLOXd6OFdOTk8w?=
 =?utf-8?B?c2lnUnEvL3grTmtOdkk2ck05ME9sTEFJUUdoaGl0ZGJqMVFjdGZwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LRtI6nScBwVpGkWuL0n7UaYCd6yyMX/l2Gybz8HxuIW/iDvy9EdbTSwQh03Nc5RCHRI2Y9X5c/k47IPK6rm9vVoR84bNLb9CHVQoE2FXr/hhuNnmQ1fg8LJjFPQnA1w6U/i7F8D502PY6Q7xcKFNzB2sXsegOa4/+kCy7NZUUx63pMPD7dtkzfOcmAxiQkN84vNwPH2OGeCskGkruBhJdZycN3KqaWtdh3izBjfts0ryL1Grtmyo9aDcCkg/dMUXukUBHgx2q+Xoajiv32OX/niKsLldX3ARJJomVlva3YdCI7QxMucAU2bVsc9/sUVAijpk2zmFbVQtUFtONe049g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a70870f-b116-427f-85f8-08de995e706d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 13:13:22.4561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrAoLme4jdrIjfR07rtnF0YZAt/WGYZAeO8UbPUziUkUPwpceDjAS+eHLkh2SwukDbrKy4N8a+CC2l7v+dUdU6/SFdyfToffdmccfqq0yIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMDIgQXByaWwgMjAyNiAxNTo0Ng0KPiBU
bzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgVXBhZGh5YXksIFRl
amFzDQo+IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tOw0KPiBHaGlt
aXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1JGQyBQQVRDSCBWNiAyLzddIGRybS9ncHU6IEFkZCBncHVfYnVkZHlfYWRk
cl90b19ibG9jaw0KPiBoZWxwZXINCj4gDQo+IE9uIDAyLzA0LzIwMjYgMDE6MDksIE1hdHRoZXcg
QnJvc3Qgd3JvdGU6DQo+ID4gT24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMDU6MTg6MTVQTSArMDUz
MCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4+IEFkZCBoZWxwZXIgd2l0aCBwcmltYXJ5IHB1
cnBvc2UgaXMgdG8gZWZmaWNpZW50bHkgdHJhY2UgYSBzcGVjaWZpYw0KPiA+PiBwaHlzaWNhbCBt
ZW1vcnkgYWRkcmVzcyBiYWNrIHRvIGl0cyBjb3JyZXNwb25kaW5nIFRUTSBidWZmZXIgb2JqZWN0
Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5
YXlAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9idWRkeS5jICAgICAg
IHwgNTYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+ICAg
aW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaCB8ICAyICsrDQo+ID4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA1OCBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9i
dWRkeS5jIGIvZHJpdmVycy9ncHUvYnVkZHkuYyBpbmRleA0KPiA+PiA1MjY4NjY3MmU5OWYuLjJk
MjZjMmEwZjk3MSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvYnVkZHkuYw0KPiA+PiAr
KysgYi9kcml2ZXJzL2dwdS9idWRkeS5jDQo+ID4+IEBAIC01ODksNiArNTg5LDYyIEBAIHZvaWQg
Z3B1X2J1ZGR5X2ZyZWVfYmxvY2soc3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4+ICAgfQ0K
PiA+PiAgIEVYUE9SVF9TWU1CT0woZ3B1X2J1ZGR5X2ZyZWVfYmxvY2spOw0KPiA+Pg0KPiA+PiAr
LyoqDQo+ID4+ICsgKiBncHVfYnVkZHlfYWRkcl90b19ibG9jayAtIGdpdmVuIHBoeXNpY2FsIGFk
ZHJlc3MgZmluZCBhIGJsb2NrDQo+ID4+ICsgKg0KPiA+PiArICogQG1tOiBHUFUgYnVkZHkgbWFu
YWdlcg0KPiA+PiArICogQGFkZHI6IFBoeXNpY2FsIGFkZHJlc3MNCj4gPj4gKyAqDQo+ID4+ICsg
KiBSZXR1cm5zOg0KPiA+PiArICogZ3B1X2J1ZGR5X2Jsb2NrIG9uIHN1Y2Nlc3MsIE5VTEwgb3Ig
ZXJyb3IgY29kZSBvbiBmYWlsdXJlICAqLw0KPiA+PiArc3RydWN0IGdwdV9idWRkeV9ibG9jayAq
Z3B1X2J1ZGR5X2FkZHJfdG9fYmxvY2soc3RydWN0IGdwdV9idWRkeQ0KPiA+PiArKm1tLCB1NjQg
YWRkcikgew0KPiA+PiArCXN0cnVjdCBncHVfYnVkZHlfYmxvY2sgKmJsb2NrOw0KPiA+PiArCUxJ
U1RfSEVBRChkZnMpOw0KPiA+PiArCXU2NCBlbmQ7DQo+ID4+ICsJaW50IGk7DQo+ID4+ICsNCj4g
Pg0KPiA+IFRoaXMgaXMgc29tZXdoYXQgb2YgYW4gb3J0aG9nb25hbCBpc3N1ZSwgYnV0IHdlIHJl
YWxseSBzaG91bGQgdXBkYXRlDQo+ID4gZ3B1X2J1ZGR5IHNvIGRyaXZlcnMgY2FuIHJlZ2lzdGVy
IGEgbG9jayB0aGF0IHdlIGNhbiBhc3NlcnQgaXMgaGVsZCBpbg0KPiA+IGZ1bmN0aW9ucyB3aGVy
ZSBncHVfYnVkZHkgbWFuaXB1bGF0ZXMgYmxvY2tzLg0KDQpIaSwgd2hpbGUgdGhpcyBpcyBzYW5l
LCBJcyBpdCBvayBpZiB3ZSBkbyB0aGlzIGluIHNlcGFyYXRlIGZvbGxvdyB1cCBwYXRjaCENCg0K
VGVqYXMNCj4gPg0KPiA+IFNvbWV0aGluZyBsaWtlIHRoaXMgWzFdLg0KPiANCj4gSSB0aGluayB3
b3VsZCBiZSBhIGdvb2QgYWRkaXRpb24gYWxzby4NCj4gDQo+ID4NCj4gPiBJ4oCZbGwgZGVmZXIg
dG8gdGhlIGdwdV9idWRkeSBtYWludGFpbmVycyBvbiB3aGV0aGVyIHRoaXMgY29kZSBpcyBjb3Jy
ZWN0Lg0KPiA+DQo+ID4gTWF0dA0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuMTkuMTAvc291cmNlL2luY2x1ZGUvZHJtL2RybV9ncHVzdg0KPiA+
IG0uaCNMMzQxDQo+ID4NCj4gPj4gKwllbmQgPSBhZGRyICsgU1pfNEsgLSAxOw0KPiA+PiArCWZv
ciAoaSA9IDA7IGkgPCBtbS0+bl9yb290czsgKytpKQ0KPiA+PiArCQlsaXN0X2FkZF90YWlsKCZt
bS0+cm9vdHNbaV0tPnRtcF9saW5rLCAmZGZzKTsNCj4gPj4gKw0KPiA+PiArCWRvIHsNCj4gPj4g
KwkJdTY0IGJsb2NrX3N0YXJ0Ow0KPiA+PiArCQl1NjQgYmxvY2tfZW5kOw0KPiA+PiArDQo+ID4+
ICsJCWJsb2NrID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZkZnMsDQo+ID4+ICsJCQkJCQkg
c3RydWN0IGdwdV9idWRkeV9ibG9jaywNCj4gPj4gKwkJCQkJCSB0bXBfbGluayk7DQo+ID4+ICsJ
CWlmICghYmxvY2spDQo+ID4+ICsJCQlicmVhazsNCj4gPj4gKw0KPiA+PiArCQlsaXN0X2RlbCgm
YmxvY2stPnRtcF9saW5rKTsNCj4gPj4gKw0KPiA+PiArCQlibG9ja19zdGFydCA9IGdwdV9idWRk
eV9ibG9ja19vZmZzZXQoYmxvY2spOw0KPiA+PiArCQlibG9ja19lbmQgPSBibG9ja19zdGFydCAr
IGdwdV9idWRkeV9ibG9ja19zaXplKG1tLCBibG9jaykgLQ0KPiAxOw0KPiA+PiArDQo+ID4+ICsJ
CWlmICghb3ZlcmxhcHMoYWRkciwgZW5kLCBibG9ja19zdGFydCwgYmxvY2tfZW5kKSkNCj4gPj4g
KwkJCWNvbnRpbnVlOw0KPiA+PiArDQo+ID4+ICsJCWlmIChjb250YWlucyhhZGRyLCBlbmQsIGJs
b2NrX3N0YXJ0LCBibG9ja19lbmQpICYmDQo+ID4+ICsJCSAgICAhZ3B1X2J1ZGR5X2Jsb2NrX2lz
X3NwbGl0KGJsb2NrKSkgew0KPiA+PiArCQkJaWYgKGdwdV9idWRkeV9ibG9ja19pc19mcmVlKGJs
b2NrKSkNCj4gPj4gKwkJCQlyZXR1cm4gTlVMTDsNCj4gPj4gKwkJCWVsc2UgaWYgKGdwdV9idWRk
eV9ibG9ja19pc19hbGxvY2F0ZWQoYmxvY2spICYmDQo+ICFtbS0+Y2xlYXJfYXZhaWwpDQo+ID4+
ICsJCQkJcmV0dXJuIGJsb2NrOw0KPiA+PiArCQl9DQo+ID4+ICsNCj4gPj4gKwkJaWYgKGdwdV9i
dWRkeV9ibG9ja19pc19zcGxpdChibG9jaykpIHsNCj4gPj4gKwkJCWxpc3RfYWRkKCZibG9jay0+
cmlnaHQtPnRtcF9saW5rLCAmZGZzKTsNCj4gPj4gKwkJCWxpc3RfYWRkKCZibG9jay0+bGVmdC0+
dG1wX2xpbmssICZkZnMpOw0KPiA+PiArCQl9DQo+ID4+ICsJfSB3aGlsZSAoMSk7DQo+ID4+ICsN
Cj4gPj4gKwlyZXR1cm4gRVJSX1BUUigtRU5YSU8pOw0KPiA+PiArfQ0KPiA+PiArRVhQT1JUX1NZ
TUJPTChncHVfYnVkZHlfYWRkcl90b19ibG9jayk7DQo+ID4+ICsNCj4gPj4gICBzdGF0aWMgdm9p
ZCBfX2dwdV9idWRkeV9mcmVlX2xpc3Qoc3RydWN0IGdwdV9idWRkeSAqbW0sDQo+ID4+ICAgCQkJ
CSAgc3RydWN0IGxpc3RfaGVhZCAqb2JqZWN0cywNCj4gPj4gICAJCQkJICBib29sIG1hcmtfY2xl
YXIsDQo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dwdV9idWRkeS5oIGIvaW5jbHVk
ZS9saW51eC9ncHVfYnVkZHkuaA0KPiA+PiBpbmRleCA1ZmE5MTdiYTU0NTAuLjk1N2M2OWM1NjBi
YyAxMDA2NDQNCj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaA0KPiA+PiArKysg
Yi9pbmNsdWRlL2xpbnV4L2dwdV9idWRkeS5oDQo+ID4+IEBAIC0yMzEsNiArMjMxLDggQEAgdm9p
ZCBncHVfYnVkZHlfcmVzZXRfY2xlYXIoc3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4+IGJv
b2wgaXNfY2xlYXIpOw0KPiA+Pg0KPiA+PiAgIHZvaWQgZ3B1X2J1ZGR5X2ZyZWVfYmxvY2soc3Ry
dWN0IGdwdV9idWRkeSAqbW0sIHN0cnVjdA0KPiA+PiBncHVfYnVkZHlfYmxvY2sgKmJsb2NrKTsN
Cj4gPj4NCj4gPj4gK3N0cnVjdCBncHVfYnVkZHlfYmxvY2sgKmdwdV9idWRkeV9hZGRyX3RvX2Js
b2NrKHN0cnVjdCBncHVfYnVkZHkNCj4gPj4gKyptbSwgdTY0IGFkZHIpOw0KPiA+PiArDQo+ID4+
ICAgdm9pZCBncHVfYnVkZHlfZnJlZV9saXN0KHN0cnVjdCBncHVfYnVkZHkgKm1tLA0KPiA+PiAg
IAkJCSBzdHJ1Y3QgbGlzdF9oZWFkICpvYmplY3RzLA0KPiA+PiAgIAkJCSB1bnNpZ25lZCBpbnQg
ZmxhZ3MpOw0KPiA+PiAtLQ0KPiA+PiAyLjUyLjANCj4gPj4NCg0K
