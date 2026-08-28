Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91039C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 03:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1695F10F232;
	Fri, 28 Aug 2026 03:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyqLpTRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F48F10E2D9
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 03:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787889016; x=1819425016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=plD19D5Qwcda1Bayzmx40gx66MuJXcx241LCgfCbnmU=;
 b=DyqLpTRO1n7aBn8YfgA0V6pY3Y4zYJOX/JKrjj9+oSI2yqW7TvM6UbTm
 DkAmqQLC04NnB91KJkCfV7Eg/vigbe3AoK5/fJJEdRaOQ0idehMFi7LfZ
 LIkBoR103+lC5QGNGL9Zm5nsu8L1iGJ8YpxJiOhLaK8L8GAZjOmBq3YJN
 nrlLSX46C2iPc1WTq8DBIcLYx3vf7p4GCx0K6QD6dgEfSpIOO5jpg18nt
 utsRJ/pbEVs/7GysMpk4XqEC8qlMjUb4xMebsjWtVt1oBFqDkd4GdN65r
 td0t1D2c24ipF1V17dZE0FUsHX5UN+Bid12jddZF/UwkinPZJvZeqBqVn g==;
X-CSE-ConnectionGUID: dCxYVZ7aQUaihpijdahbtw==
X-CSE-MsgGUID: yFEOMR26Q2eiP6wckCgR1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88601547"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88601547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:50:15 -0700
X-CSE-ConnectionGUID: 00RiAYnrRDy1QvPpz2+g4Q==
X-CSE-MsgGUID: h04QzEcPTuSnOoxrcNh9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="271860491"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:50:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:50:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 20:50:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1sCbmryZ0aJyfNAs4ElcRaiCjXQDUCPnD2v8wOVnBe3cOb3JZ37UgeCYpFTyW3QRKmqVZzzygn0vOE3nrAw7WwHYSE3GtKq6JkwYmHu9JD1bCPEcacdpmcAH0EQBDlpLEuoSQF9CRCTya3IjozW7MJ2StwdhPAoICJMPdgqbYQguxy+eFSKN1cN+BG4POaWFjyqHQBxH65cyZzmyMbi87kWKjdHhsjUvjE10pdoyqOeEknibr1MBGQZGY0L6LLw6E9hcRVMxLIb+8D1f4QseRJ9Q7Pmz++yEHVglsoyUlJS+V38D2nGa+F0LXMGw22P3bgJIpkW9t3nJMXaupQ/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plD19D5Qwcda1Bayzmx40gx66MuJXcx241LCgfCbnmU=;
 b=aLHmdTdwFJJaw8s67KF0mJ9m+nSAoxC8IcQp4Y4DawFcYS+rA18fb9IE+oZSwexd14x2c6vkT0kYAtahlmZvWgrnD77xyzqV+ldxZS1zYZ2V1k3b8Ax/VPU71QFAkeTxvBDJQfchKCMjsvgE73rF4PK3GhMaMpLINzUFVarMRBdlXyLVj2nPurlMhrupYvGoBsqYXQ8qsqBHSSch/SbO8kbPl3gtyCdPcEOqntHp0vdDH2Arx2xaYwkPASYsQpYSCvGXxBhiNIEAOWqv3G2PbFY1RCJyrOavy2vFw25STkl4kZlcpubXS8rKPHDZOct6x1kG30g9V0Venh7O4uCGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by PH3PPF6D09CA9CB.namprd11.prod.outlook.com (2603:10b6:518:1::d2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Fri, 28 Aug
 2026 03:50:10 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 03:50:10 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/6] drm/xe: Define WCL as a PTL subplatform
Thread-Topic: [PATCH v2 1/6] drm/xe: Define WCL as a PTL subplatform
Thread-Index: AQHdNX4U54YRMow8ZUydGK8+D5f1Dbay1ZMA
Date: Fri, 28 Aug 2026 03:50:10 +0000
Message-ID: <0d34b74bd860de38b56c139b3b84dfe53b754e39.camel@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
 <20260826171149.708378-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260826171149.708378-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|PH3PPF6D09CA9CB:EE_
x-ms-office365-filtering-correlation-id: 03d8f213-3234-4008-57ad-08df04b77581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Ptmq32CzNcd8JBPH7mUo9VGTT8C4Po3xe9B7Kask3wLnjP5jqq8yZdJl4LwdN3BsMOAWnc/TcBoxTrPRsP9T1J10vmestSJP3BfN/8IBBeoHGXwWYjlRnAnhJLhehzgDQtYgzvELI7XQeflmsO/0JMCBaorJKcPGI5+WywCJhVzAZ1HWqZi8cdeybvzIAPOsDHY2l6DlDiFQLwElMOCls4HEo5SvSt5GrXlTGzW7BFZEG7IZ9K0Ou/iY6F+FGY6Km4kuQgsd9JERVxFaSmkUxeOUwD4RAgb3jutyepzuKrijrRRlz3nJSOLnMgbYu3XVqL7fxZsBoxXK6NtCksJ84IZDaWVY6fwcHNkfZsBIG52aySrkAOaZLezWrlMrC1OXxWac51nLUTl9Kov3Vl30Pkj4GFibzU+YcKoAje5leL1U/OJo6vZjYZ8rufmpcY6uC8oo0tFS/+XqOi9CbfEFZIdwlTGNdjYJk9/FvR2ciScx9a1yaOv3vhWoslehpo3ILtYTNUQK+3IQn9vV48Zuxdi7afItEse0p1FnF6WDS2nficGulMbbSafcO3cgxNbh/vOGg6SHBhASAnR58CYx/H2CvoCpt72tPELB7ERkPG/MimAa5x6wIzofCfvVvTj19O+FsFLfYwRLeoSuihm99N98VP0c4x6ucuDxB/qwYVESVtWVzHR0T045C9JwKaSvrZ3aIlZ3SBcP01egnY44cG699iwE2GoRG1ZKrt597Ts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG05ZW9uSXZzOC9pRVpqWjRzQ3hWckNjT3hxSVVpUTBzUlZOamI5eEZvTExv?=
 =?utf-8?B?bEQ3RDA0RHlabkk4Q3NlRkJhcDlRaHJORjN2SytLcDV2Uk1HdnpuU1cwRUdr?=
 =?utf-8?B?MVVHa214VVBMYzFIZXllSzFQTjl4UjVicW5VbkY5UUY0d3hKMi9ibkYxTEZy?=
 =?utf-8?B?NDE4RmFSaXp4VGdLN2x5ZyttR0ROMkxqTFhqZmZKRkJpMEtub3ZUS2l5YmlU?=
 =?utf-8?B?aTN2dWxUaEVRdDR0czlmREtoREkzdW1zQ1pXVHRCMUh2OHF4S29WVThycnZm?=
 =?utf-8?B?dytqVW5vbnRabGgrd1ZsS0tKVTBici81bWNOL2lidkZmekFMRG5YNU9LS0kv?=
 =?utf-8?B?Y2Rocm5ydUJJc0RSdklFek56czVRSllWSVFKWmV5QUhmYTZmK1Bob2lJM2Fr?=
 =?utf-8?B?Z2U4bUEyWHV0d2hyeDZDUXVqMmFvQXJ1aVY2b3VKNkxHUEhMM2JhSVNLQm9s?=
 =?utf-8?B?dExnV3BoNWN3UUxOTFpMdkkxVlJiNzlTTE5zWnFqOGRCK0xockFTZGlHQTZv?=
 =?utf-8?B?ZE42dkV4OXFuMlpWQ0J1VDduMHJlTzBRUkNBc2pmK3hIeDdDcXRrS2NjMU5k?=
 =?utf-8?B?aCsyVjNMVlFYS3YweWk3QXI4aVdVZTB5Tll4RjlVVW91MTZ4cE9oOVh3MVp3?=
 =?utf-8?B?MzVJRVIrWS9hL283R3JQcEJDUXJhN2RhcXU4a2FMRisxN1g3Wi85OXBiTDgz?=
 =?utf-8?B?WllLbytVbmtyWHQ2QXNqdnptUFlMNXZ4RXdBMExFSEdpOHJKdVk1cEpYaXkx?=
 =?utf-8?B?alZKOFFwVy81TE9zTkNOUmtSbHdkYWYzYll6djgzSStMSkI4bkFjL2poMHRH?=
 =?utf-8?B?Q1V5VnZyMVlNQnBLU2U1UGtxNHI1MER1c0VvWXJkZ1d2Y0NhKy9mVzk5azJw?=
 =?utf-8?B?cXh3aVF0ZnlGQlJWUWp1QWw1RVhTdjFZUEFBM1FmbTdoazE0T3RaQVdveWJJ?=
 =?utf-8?B?Q3dNM3Y2aGhoRncwd0tDL1ZFaDIydUp3cWdqem8vTTlEWW5keSs4ek90VUFD?=
 =?utf-8?B?cWl2Vktob291N1ZJb3l1MWR5SlBkYjdLbWR6aGF5RUhsVGRVODZnRy9SaWVp?=
 =?utf-8?B?NFc1eExFNllLT29STjIzdzVsL0hqY3BSU00wWlViUnFoNmFzdDI1aURDNmxS?=
 =?utf-8?B?TFlKak1XdG96TUx5R1VDSTZpTG1lS1VYZEtsOGtOTWtuSDJvcS9lZk84TzVn?=
 =?utf-8?B?KzlvNmQwVFhlUENiZ1RORTFqYzAvNnRoR29lbHh2aEVHMkl2amR4WklwR0ha?=
 =?utf-8?B?bVg4UENacEdrOE05SmJ3TnJnNnk1b0d2SUY3VGNmVGJhY0p0WmNHdThoYjFB?=
 =?utf-8?B?UGdIQm03Vjc1a1RjV3ErdGs5M2FoOUE5akxNOStpOUl1Y2w3TnRzQ01LSUoz?=
 =?utf-8?B?UmtqRnJ6U09GZXpXeVppY2gzUHBjOGhFbHNSdUhZeDd2M0xkZXRERmE1WW1O?=
 =?utf-8?B?REMrc2htVHpmMWMwOGowUkMxVzJWQkdwVytYSkYyZElOWWYyVENJTlFKUk45?=
 =?utf-8?B?a3YySG1LOFZyRzIrN3pTMjMvWEhTL1ROSlNLVWlzRFYxL3pnLzRXc2RCcnNE?=
 =?utf-8?B?dkNDU1JOY0VKSzNYR0RBL2IzMG4xL1hxWFY1K2Ywd3I1bHRwdzIyZzV6UVlY?=
 =?utf-8?B?UXZQQStOS3k4cmZRWlBiTmZaU09YMUkrcFZtb2Q5eis2c0p2SHJYdGhTUkFQ?=
 =?utf-8?B?aTlSQ01rU2g4ZE9FTlg3U0k0YVhNK3VxUUkrcU5HcEd3SVA2MXN5Ny93d3A4?=
 =?utf-8?B?NXJCcFExdEpPZE9VamdrdkJUZ2xDTXBGdkdXUE1IeGc2RUp2akNiWTBlR0ZM?=
 =?utf-8?B?S2JBZyt6Q2hNLzNMWVRpSHVpNFlrcE5mTVBkTGdUZ1laQ0ZjUjVvM1JoajV0?=
 =?utf-8?B?TDh3Qm1CT3dDSFdVaU5obzNYVkUydXF6Y0NzKysvNHVSSWVrOXhZelVrRTJL?=
 =?utf-8?B?RWtHZnVaaUtqWENVRnFmalVLVVBrWG8wRDdLVVc2Q2puSzJNL255aUpXSnE5?=
 =?utf-8?B?cHBhSTB2SmdoVDRyelNTWUtVb2FBV0tqQy9rZDdNek1OVTlZT1BlVFRwNGhm?=
 =?utf-8?B?dHc5RmRsU2dGN3FLNVJHWHZ5RzFnVGVONTdYalFUelNERUZwcFBuU0dGOHVY?=
 =?utf-8?B?Tnc0ajYzekF0cGQvYnFmaGpUV0NyeTd1SnVOSUxNdyttWmxqaXNLMDZTRTgw?=
 =?utf-8?B?T0ppTElGTytCdVNUMGpMNEpscXVIVUd6eWdPMHhHYkFiT3JYUUY4eUtjcytx?=
 =?utf-8?B?MzAxZXhUOUllQVVQeUdtNTJLRWpUWi9TbGV5TytYY0FNWFB6eGs5clczbTNT?=
 =?utf-8?B?blhRTmZLVWZaUEViQlo1QVh4Nmh6dzN4MFc5SnoxS0oxM0hUL0R1Rkx5SC84?=
 =?utf-8?Q?gXxxmWKwXKMCsn1FEM2yjdBgZggxUCfLyyAMX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <238D85921CC0714ABC93691E3AE90CA5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xFCp6Y5lg3LhvrtZLhTEOj1u0xj80+Mgtg8H+KOi6hJB+lwDAfrmATWh6tT4BqnDQ5wWJHPhMo7hdoMJuLwBrPhCEsqo3AQnxTjt1jCJ/U9OTbV1tenYdCAtnf4lWrUvdfFl+Yf4upKuken88QLzix1EC4477kQfkSEPX2qblxR0nu/StTGY4fPLaeQRnVMwMUIVeXxW0Y0VvoPfJL1DeIpt+fQ8Yvulm/bRbMu4wr9Hc0ilKl1+vtti3C9D4+gzHTUrodi3KH8LUhN4M5T0kpN8Rc4uM98LFfDuQaLZahYdYCAZOfaB7cfOpx+U8iMloJJdl7wZcDA302SQDNjGMw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d8f213-3234-4008-57ad-08df04b77581
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 03:50:10.6502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuf3qi65kcwjsTnZabo38eZOVbRb8uXmY7SmthY2O+HnN7X9yXmj5/rR7jVORQMR5H4AF1uYTV14mXGuS5c13lKK995eTlewBxFCEhoK0FYYC44HQTdMZPVufkoMS7va
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6D09CA9CB
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBXZWQsIDIwMjYtMDgtMjYgYXQgMTc6MTEgKzAwMDAsIERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gd3JvdGU6DQo+IFdDTCB3aWxsIHN1cHBvcnQgYSBkaWZmZXJlbnQgR1NDIGJpbmFy
eSB0aGFuIFBUTCwgc28gd2UgbmVlZCB0byBiZSBhYmxlDQo+IHRvIGRpc3Rpbmd1aXNoIHRoZSB0
d28gcGxhdGZvcm1zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJp
byA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKysrKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oIHwgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNpLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gaW5kZXggYWI0ZGExZDlhOWYx
Li4wYjJlOTExNTBjNmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTQzNyw2ICs0Mzcs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGJtZ19kZXNjID0gew0KPiDC
oAkudm1fbWF4X2xldmVsID0gNCwNCj4gwqB9Ow0KPiDCoA0KPiArc3RhdGljIGNvbnN0IHUxNiB3
Y2xfaWRzW10gPSB7IElOVEVMX1dDTF9JRFMoTk9QKSwgMCB9Ow0KPiArDQo+IMKgc3RhdGljIGNv
bnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBwdGxfZGVzYyA9IHsNCj4gwqAJUExBVEZPUk0oUEFO
VEhFUkxBS0UpLA0KPiDCoAkuZG1hX21hc2tfc2l6ZSA9IDQ2LA0KPiBAQCAtNDQ5LDYgKzQ1MSwx
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIHB0bF9kZXNjID0gew0KPiDC
oAlNVUxUSV9MUkNfTUFTSywNCj4gwqAJLm5lZWRzX3NjcmF0Y2ggPSB0cnVlLA0KPiDCoAkubmVl
ZHNfc2hhcmVkX3ZmX2d0X3dxID0gdHJ1ZSwNCj4gKwkuc3VicGxhdGZvcm1zID0gKGNvbnN0IHN0
cnVjdCB4ZV9zdWJwbGF0Zm9ybV9kZXNjW10pIHsNCj4gKwkJeyBYRV9TVUJQTEFURk9STV9XSUxE
Q0FUTEFLRSwgIldDTCIsIHdjbF9pZHMgfSwNCj4gKwkJeyB9DQo+ICsJfSwNCj4gwqAJLnZhX2Jp
dHMgPSA0OCwNCj4gwqAJLnZtX21heF9sZXZlbCA9IDQsDQo+IMKgfTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BsYXRmb3JtX3R5cGVzLmgNCj4gaW5kZXggMzQ0Nzg0OGI3NGUzLi45Mzk5MTk4Mjc4
YTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oDQo+IEBAIC0z
OCw2ICszOCw3IEBAIGVudW0geGVfc3VicGxhdGZvcm0gew0KPiDCoAlYRV9TVUJQTEFURk9STV9E
RzJfRzExLA0KPiDCoAlYRV9TVUJQTEFURk9STV9ERzJfRzEyLA0KPiDCoAlYRV9TVUJQTEFURk9S
TV9CQVRUTEVNQUdFX0cyMSwNCj4gKwlYRV9TVUJQTEFURk9STV9XSUxEQ0FUTEFLRSwNCj4gwqB9
Ow0KPiDCoA0KPiDCoCNlbmRpZg0KDQo=
