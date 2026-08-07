Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFE6C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 19:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A0110E24A;
	Fri,  7 Aug 2026 19:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZSeJSKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69310E24A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 19:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786132687; x=1817668687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8aK5J45R0FKKrVK0o0RCDYXBwMdlmmKFJpTmJInIjTQ=;
 b=BZSeJSKjDNgh1ScQXVz3jvHqcpFqMmusS5GiBlEgL2b1bvGGI28NbKBo
 v8qUqU56+K4jbqc7uwHZ0M7WbPDDe9LssXQ88H1wOp6DqM5utJHP7/+ag
 W3erT/EGoLDhdxBSYS9i7jxUaLeX94brdB0oAbkLrkGtJp/nLmWIYmwRu
 5kG579YOBNoWmkecNJ0xErROtplKOpLO5Pu/AZgxIRH5QKSrsj0TvW/vM
 NqtCMCs7L++zc7TVE21zTAcofYrkTJczeoVoYu1otboD8OXviLHcOEi6I
 +AkgZGQKorljsXbqZ1iFks4Gwqsti1Rg1xd95KbnUgbyW1Kju6lfh/nSb A==;
X-CSE-ConnectionGUID: GO9HParXR9O7SFJmvH80ng==
X-CSE-MsgGUID: hGDCrfU6QJawL4vx/UKE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97100531"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97100531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:58:07 -0700
X-CSE-ConnectionGUID: nZNHNc4DSZmcDhHXT3cYcA==
X-CSE-MsgGUID: e2xhnCcFRX+Cbg8ZprjEYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="259866214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:58:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:58:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 12:58:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOMHKvv8WsjABc7ZzMV5SwUlua3xi0oMx4evDWGdghvFbZ76iBH8F2Al32y3E607IreHJmX8u8TP+cZRvaeIYh3wSCUgWQT4FdIQYwbjVrv/vxfPgITb9Z4aPgv0z34jYY037Tzbp3qgkZEOq4ufG/ck80MX8dCRhj/IzKEqEupdaDjsHUpw5jE8uAtd3ctPzylmD8IFXSPDVtU7mbbxTTp/L490Fx1LIyEqsIXsYkim6ldgmeyertZ7lEIWJX+/gMTAc3gdpyMuEf428guQSkeaDw48RkGtGg78bb66hk257Sh/FkLL7BfiDNkSSz56OLdtuzmw56lYzdVNpIDAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aK5J45R0FKKrVK0o0RCDYXBwMdlmmKFJpTmJInIjTQ=;
 b=i6em7yYJWnf2idzi+WRXVqBQncpldI7F5r3DcJyzJ39UuptdF0YUhgoV0CKI7oSLQVIt1mV3S+zRsysCPnpC1yfV9Vi/EqOGRG69fEv/j3YGOwa/J6JqjfHTJXhxo7cpnZoTsFjzGW3z5JwIKsGpMaZhUHzN/elsuRBEemE5rAuXJVP7ML1Z+MVuyZ8gszotTJeZ0IZiBl+z3HfQohUWxAHs1++6oFscnfkm0R4u+jY7sTDmZtLwjfN8H3mpamoUSD94WdlgQDJJKqgpd1HvaXA3bAk0k4st/1LQexyZb40PXOTlxqtpYr9W09jPHK1pz600NJJMI9Oc+PsUohD1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by IA3PR11MB9350.namprd11.prod.outlook.com (2603:10b6:208:574::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:58:02 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:58:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Thread-Topic: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Thread-Index: AQHdJVQ3cBqoZUbJ1kyT+NC9cJwUTraRYiQAgAAC2ICAAZ50AA==
Date: Fri, 7 Aug 2026 19:58:02 +0000
Message-ID: <a8ef91582b768a63a3f2b5528a2b5f093392a357.camel@intel.com>
References: <20260806033205.3858054-1-matthew.brost@intel.com>
 <68a4c12e90c7f3fc08a62a6de41c9bb26b38fc23.camel@intel.com>
 <anTdHVUUQ+P86IrR@gsse-cloud1.jf.intel.com>
In-Reply-To: <anTdHVUUQ+P86IrR@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|IA3PR11MB9350:EE_
x-ms-office365-filtering-correlation-id: 7fda4583-934f-4dd0-5486-08def4be307b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: sI5fbEYG3A1zFU9spGLn6ksawGAnPiBhbcPLFsLDbsi01YVWfM59KrTHqR3+r/Gtg0TWxw2Z1uP73PzOZSdIOcZbo8vhnS5jUEEFV8Tvb5B9vbWfUxMECN6X+Q9PwrXbtHieK0jruX0dxmy4X2wST8Vh7i3i+llXR6GQVAwJlxeztnbxtiuzhEOH92agEjrj+LF3f4VCtTnzoSLBKe3lA529VKHQSXwaTKjF29CvMEEkkL+neh5kzlBeAUUqGwkx5jGxoczKCGyZ4Zse2z5ZazNnjm7lpFw6BIm5gFjcvyrezYoMKxuGVBm5+8jmnJhcqsY+34lR5prza0HppvTvDsbQMvamvrI3nxkn5dkHcbrNnd3z12vqTzWPR+YTj1vaxHtNtzKa5aTYgWLfbl96/Yz4sEvLmPP4bgsEMlxV8l6eJdYjA/ualFF2XD1oaEBTUiWSvskO5kgczUfmUQldoxFviAKKUJ8s/4ZXJq9Zq71mebJNn3+0lTkKAsFt3e0Mqx6Q+n/BU+zyag2f1olpOartyduEiXMOFuih9RJzb38CUvopZ6VQrExhp44yWGYbH+ghUuqG2ght7fI85FP4wbnDhiika/XDuUekcvNSh+OFfphk0vlmF45hEzHXosJ0OHVlGE864Hqjfaq/EkSL0KMUdyXNt2NXxpyhSHEvwRC36DKH1TOin37PU85tvhnayIsSgNnJWgmg298CD4GwmktrxfhxNI2hj0bVDgXj1V0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2lkWlUrZHhuenllY1FNK1IwTFZIdFQ5d3N1dGxOM3JaT2ZOTUphc3p1ZDg2?=
 =?utf-8?B?V0ZEOHBXUkFNQmVpcEwydmNBMTN5Nm5oTUNyZ2hkdGw3Vnl5bFdwZGZyeEV5?=
 =?utf-8?B?SEV6Nkx1eVNGSTQ5ckErRnBoU0pENnhGSXkrRnFOMjFSSXJmUGJYTGhaeDRr?=
 =?utf-8?B?alAzS3hIeFMvem9PY3dxRTI3bnhacDFGNTBReWFsOGhteWtnRGJBWUFWTFhT?=
 =?utf-8?B?eEtkeGlZZWcxMVBXczZuelN2TXFKV3RFRzdQd0FnQmhwSVFuMFpJc0dFVTVL?=
 =?utf-8?B?dzYwZlNwb2pPSmU5dHphMFE4RDlmaXArQnVpOVlIMHM5UU4vdERyTG10dEpQ?=
 =?utf-8?B?NVV3UFFGNWdTYVp3MTI0eWU1Y0c3eXhjT2pPSjRPTHA3VjFHcjczR0NVNFRp?=
 =?utf-8?B?ei83VDhIcEZBTEtDWWJJWkNRTnlKbkpOdisvMmtsSm5rYjRLeWZTQVY2elNa?=
 =?utf-8?B?azFKYTdlSXNRbUlMdm5NUGJaVk03UG1ub2cxVWZqc2dDMmVRUEhVam42MXBG?=
 =?utf-8?B?UXI3Vjlicnh4RTRCcnAzbW5XSFlyQlFQMHF5dmNHcnlaMjFUZnNkb1duUlAz?=
 =?utf-8?B?ZVFCcU9ySTA3SmVocVowSmFhZ2YxeDFzYXc4REJHcVIvdDBiekdPdFZQWlpn?=
 =?utf-8?B?bzVnK2Jud3h4TWluNzA2NEFOK28wM1RYcWRvcFpiNHFZU1NCb285RXlXT0xL?=
 =?utf-8?B?SjlPT2g5RUFKd0VpaE5yK01XdGFzYm9JM2lOMXlCb2lsUktaek05U3JnVE1D?=
 =?utf-8?B?RXBQTXZZMEIrUllnS3BrVnV4T3U3dzZZS05xZ0E4RWNwYndnMFYzVVNiY1hK?=
 =?utf-8?B?Uy9WOTB2dHkwaFE1V0VOOHJhL01hWmJGVlZxUHBIbEsrVWtsYjVMVWVlcXpT?=
 =?utf-8?B?aUFkeVB0Ri9yMkxQbE1LT0p3djFjTUx3K1BRcWE5Sk1FalhSZEl1RTJUU1lj?=
 =?utf-8?B?alJ5dW5uNk5YVmJUY1V1YlJnWEJIYTlqZ1JiNW1QRUtqQkN6VzhrZ1pUNlFn?=
 =?utf-8?B?SC9zZVVwRnJ3OEpxakRsdmJWSS8ySWpackE5R05QTzcvU2IrK0FUK2tpVzRT?=
 =?utf-8?B?UHgyUGc5V0VOS3pVemwyd1lNRVg5WVlnQW82anpPZy94RU5sNnk4VW5sMHNx?=
 =?utf-8?B?OFljKzY1RmdIQU42VmJGUnRMcVBFbmUrallORHFEUHlPdU1ybXltYWUwMTRB?=
 =?utf-8?B?dWlIdlkrVmt2TDRVU1FQS2JLc3d5L2Y2dUVqMTg3QjRzK0RuNFFLRXZCcFAz?=
 =?utf-8?B?YVY3aUJveGd0TVArcEl4dXc3UXdxUnBXcEk4UU1Ea1FJeE1zbWg4YnF0RDFu?=
 =?utf-8?B?U1UzUEx4aE91eng0cVU5WFhTaWdhOFU3TWFiRDlrM2lnWnpPenc4Ui9jNVZY?=
 =?utf-8?B?bGlqNis1K2Fub2F4ZE54N1NpeTZ1RXh3N2dmMVJMZ3lDdmZxTnNjM1AzWHdL?=
 =?utf-8?B?QVZlSURzNkFEaTRkR3dHSzNMdWc4RXZpdWI4ek9wekpoR0RJdGk2MnRSNVUw?=
 =?utf-8?B?UTdzSjhhald0dHM2R2hUbjNZVDFxV2Zpck5zaU5yUzhaeFBWRkdBVlhUbXdO?=
 =?utf-8?B?WGFXV3AyZlpkZ3E1d2ZkTU5QcFl6aWNvTmtuMFI3MkJqT0pVOWlKNXFldmt4?=
 =?utf-8?B?ZlVQRlNWSmFielRaVnVJb216WDRIOEdZWC8rM3YraXF5UHc2emxIV3NSbFZN?=
 =?utf-8?B?bFFRQU9HQWNndDRKRWF4WE1aWGlCZU45Q01iVHpwYW85c2lDWVMrZC90SW1y?=
 =?utf-8?B?eFI0TTJvRlBmZFNEMS9VRVUxTXRTS0d2cjE1Z0hNZzRCMCtSYjUxRmV5M2pH?=
 =?utf-8?B?Z0phMXYrRlp5M3hlTVB6ZGFRSDhRdVpDVGx6cmFvUHk1Y1lJeUhqWHQ3Z1Ni?=
 =?utf-8?B?N1ZlbkhFSnJxNE42Z0p0cEl4M1ZtakNqSUlHcitnRThlNG5aRE9QbXVhUU5V?=
 =?utf-8?B?MUpnSEFqcGtOTWs4bUs1QlA3bUs3UUJNci8rcXpIUmw0V3hZODhVbGw2ZWlo?=
 =?utf-8?B?K2RFRUVzSzZ3UHpKc1NpYWFaWlB5MjZKaVJwK3NORDlGODhMRmpncmVjeHpO?=
 =?utf-8?B?UHVhRHpNbkxJb2Z3OU4zclNRaVo1eFBSUVhsZHJHSFEwT29qa3pjdldRWkZL?=
 =?utf-8?B?ZUxNYWNiRnFkL0twM09OandMblp1aSs2Y3pUK2VjczFYQm9ENU12RVBvVk90?=
 =?utf-8?B?S0tLRnlJSnFWc0c0V2tnc2hHc0RmSnhieFFsTkwvOGFMZUtncm16eUUycG9i?=
 =?utf-8?B?RkxObGZjZHYvQzBiRkQwMnJQTlRBcjc5d0pacUhOaFpsMGNIcGJsSmVkdGMx?=
 =?utf-8?B?UTFUYXFubTZJbVdBUmhCT0xKbDhuUVBKSHJocUJIVUFtMDhaOGtwRUJBQXlJ?=
 =?utf-8?Q?ENTqqZZ3/9mrIxLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <355AF42A34699446BAA53C62199C0EFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Do1VqXSmgyQ39HXoY0IQ5lEiUc9BsTB6i4OkTGJHQllbvEI7r0mwSWH9jiHuTwfGit3uwMxswz05jNbZaBYqjqfpFINB+VmtHoJe7Pllo6qnMBoOT8t8MPBESkHmf3uSdfV8nyChkrCXxIfHBPCY7irgQKPXOFOUtS4bvq15imimLiyghxb0tE4EAugfHk3GyRJzMkwiazw+AULu21Vyi5fTTPoxAjO2Dwox92EFKA3Wh3aCL4hYRUzk7GQn24vcHpMRxtPl65AS2q5+MsiGeskxfry/dXUbN6SnQztnl75VpKnwf2Eq3xOp14QRW7IBM/zOZHasDSDrZgMQTy319w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fda4583-934f-4dd0-5486-08def4be307b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 19:58:02.6088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hE6z27vZAvJswqkAEszCfxF3J9zz48TdSg3/sPiR715894iWCLDpn/JdSgVF1nonhMB5guZqYXMy4b/BRPUxcIqAfQ+4mHplAtzCTLxBPHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9350
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

T24gVGh1LCAyMDI2LTA4LTA2IGF0IDEyOjE0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEF1ZyAwNiwgMjAyNiBhdCAwMTowNDoyOFBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI2LTA4LTA1IGF0IDIwOjMyIC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gSWYgbm8gZXhlYyBxdWV1ZXMgZnJvbSBhIFZNIGFyZSBtYXBw
ZWQgb24gYSBHVCwgaXNzdWluZyBhIFBQR1RUDQo+ID4gPiBUTEINCj4gPiA+IGludmFsaWRhdGlv
biBmb3IgdGhhdCBHVCBjYW4gcmVxdWlyZSBhbiByYzYgd2FrZSB3aGljaCBpcw0KPiA+ID4gZXhw
ZW5zaXZlLg0KPiA+ID4gDQo+ID4gPiBTa2lwIHRoZSBtZWRpYSBUTEIgaW52YWxpZGF0aW9uIHdo
ZW4gdGhlIFZNIGhhcyBubyBleGVjIHF1ZXVlcw0KPiA+ID4gbWFwcGVkIG9uIGl0LiBJZiBUTEIg
aW52YWxpZGF0aW9ucyBhcmUgYWxyZWFkeSBpbi1mbGlnaHQgb24gdGhhdA0KPiA+ID4gR1QNCj4g
PiA+IHdlIGNhbid0IGJyZWFrIGZlbmNlIG9yZGVyaW5nLCBzbyBpc3N1ZSBhIGR1bW15IEdHVFQg
aW52YWxpZGF0aW9uDQo+ID4gPiBpbnN0ZWFkIHRvIG1haW50YWluIHNlcW5vIG9yZGVyaW5nLg0K
PiA+ID4gDQo+ID4gPiBUaGlzIG9wdGltaXphdGlvbiBpcyBwYXJ0aWN1bGFybHkgaW1wYWN0ZnVs
IGZvciBTVk0gd29ya2xvYWRzDQo+ID4gPiB3aGljaA0KPiA+ID4gbWF5IG9yIG1heSBub3QgdXNl
IHRoZSBtZWRpYSBHVC4gQXZlcmFnZSBUTEIgaW52YWxpZGF0aW9uIHRpbWUNCj4gPiA+IGRyb3Bz
DQo+ID4gPiBmcm9tIH43NXVzIHRvIH4xOHVzIGluIHN1Y2ggYmVuY2htYXJrcyBvbiBjZXJ0YWlu
IEJNRyBwYXJ0cyAtIHRoZQ0KPiA+ID4gaW1wcm92ZW1lbnQgdmFyaWVzIGJhc2VkIG9uIHBsYXRm
b3JtLg0KPiA+IA0KPiA+IFN0aWxsIGdvaW5nIHRocm91Z2ggdGhlIGNvZGUgY2hhbmdlcywgYnV0
IGlzIHRoZXJlIGEgY2hhbmNlIHdlDQo+ID4gY291bGQNCj4gPiBkZXJlZ2lzdGVyIGEgY29udGV4
dCAoc28gbm8gcXVldWVzIGV4aXN0KSwgdGhlbiBtbWFwIHRvIGludmFsaWRhdGUsDQo+ID4gdGhl
biByZWdpc3RlciBhIG5ldyBjb250ZXh0IGFuZCByZWFkIHN0YWxlIGRhdGEgaGVyZT8gSSB0aGlu
ayBpbg0KPiA+IHRoZQ0KPiA+IGNvbnRleHQgaW52YWxpZGF0aW9uIGNhc2Ugd2hlcmUgd2UgZG9u
J3QgaGF2ZSBxdWV1ZXMgd2Ugd291bGQNCj4gPiBub3JtYWxseQ0KPiA+IHNlbmQgYSBmdWxsIGlu
dmFsaWRhdGlvbiBpbnN0ZWFkIHJhdGhlciB0aGFuIGp1c3Qgc2tpcHBpbmcgaXQuIFRoYXQNCj4g
PiBzZWVtcyByaXNreS4uLg0KPiANCj4gV2UgZG9uJ3QgY2FsbCBgeGVfdm1fcmVtb3ZlX2V4ZWNf
cXVldWUoKWAgdW50aWwNCj4gYF9feGVfZXhlY19xdWV1ZV9mcmVlKClgLiBUaGUgbGF0dGVyIGlz
IG9ubHkgY2FsbGVkIGFmdGVyIGFsbCBHdUMNCj4gcmVmZXJlbmNlcyBhcmUgZ29uZSAoaS5lLiwg
ZGVyZWdpc3RyYXRpb24gaGFzIGNvbXBsZXRlZCwgb3IgR3VDIHN0YXRlDQo+IGhhcyBvdGhlcndp
c2UgYmVlbiB0b3JuIGRvd24gZHVlIHRvIFBNIGV2ZW50cyBvciBhIEdUIHJlc2V0KS4NCj4gVGhl
cmVmb3JlLA0KPiB0aGVyZSBpcyBubyByYWNlIHdoZXJlIHdlIGFjY2lkZW50YWxseSBmYWlsIHRv
IHNlbmQgYSByZXF1aXJlZCBUTEINCj4gaW52YWxpZGF0aW9uLiBJZiBhbnl0aGluZywgdGhlIG9w
cG9zaXRlIGNhbiBoYXBwZW46IHdlIG1heSBzZW5kIGFuDQo+IHVubmVjZXNzYXJ5IFRMQiBpbnZh
bGlkYXRpb24uDQo+IA0KPiBXZSBkb24ndCBuZWVkIHRvIHVzZSB0aGUgcXVldWUgcmVmZXJlbmNl
LWNvdW50aW5nIHRyaWNrIGhlcmUgdG8NCj4gcHJldmVudA0KPiBkZXJlZ2lzdHJhdGlvbiwgYmVj
YXVzZSB3aGV0aGVyIGEgcXVldWUgaXMgcmVnaXN0ZXJlZCBpcyBpbW1hdGVyaWFsDQo+IHRvDQo+
IHN1Y2Nlc3NmdWwgVExCIGludmFsaWRhdGlvbi4gVGhlIGludGVyZmFjZSBpbnZhbGlkYXRlcyBh
biBBU0lEIHJhdGhlcg0KPiB0aGFuIHRoZSBDVFhJRCB0aGF0IHRoZSBHdUMgdHJhY2tzIGFuZCBy
ZXF1aXJlcyBhIHZhbGlkIHF1ZXVlLg0KDQpPay4uIHNvIGluIHRoZSBldmVudCB0aGF0IHNvbWV0
aGluZyBsaWtlIHRoaXMgZG9lcyBiZWNvbWUgcmVxdWlyZWQsIHRoZQ0KZXhwZWN0YXRpb24gaXMg
d2UnZCBhZGQgdGhlIHJlcXVpcmVkIHJlZmVyZW5jZSBjb3VudHMgYXQgdGhhdCB0aW1lPw0KDQpJ
J20ganVzdCBhIGxpdHRsZSB3b3JyaWVkIHdlJ3JlIG92ZXJvcHRpbWlzaW5nIGhlcmUgYW5kIHdp
bGwgY2F1c2Ugc29tZQ0KaXNzdWVzIGRvd24gdGhlIHJvYWQuDQoNClRoYW5rcywNClN0dWFydA0K
DQo+IA0KPiBTbyBhbGwgb2YgdGhpcyBpcyBzYWZlLg0KPiANCj4gTWF0dCANCj4gDQo+ID4gDQo+
ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4g
LS0tDQo+ID4gPiB2MjoNCj4gPiA+IMKgLSBNYWtlIEdUIGdlbmVyaWMgcmF0aGVyIHRoYW4ganVz
dCBtZWRpYSBHVCAoVGhvbWFzKQ0KPiA+ID4gwqAtIEZpeCBhY2NvdW50aW5nIGJ1ZyBpbiBlbXB0
eSB2cyBub24tZW1wdHkgKENJKQ0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfdGxiX2ludmFsLmMgfCAyMCArKysrKysrKysrKysrKysrKystLQ0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKy0t
LS0tLS0tLS0NCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfdGxiX2ludmFsLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190
bGJfaW52YWwuYw0KPiA+ID4gaW5kZXggMDQ2ZDA2NTUxMjJmLi5hYjA0Yjg3Y2YxYzMgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+ID4gPiBAQCAt
MjA1LDExICsyMDUsMjcgQEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9hc2lkX3BwZ3R0KHN0
cnVjdA0KPiA+ID4geGVfdGxiX2ludmFsICp0bGJfaW52YWwsIHUzMiBzZXFubywNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3N1YmFsbG9jICpwcmxfc2EpDQo+ID4gPiDCoHsNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3VjICpndWMgPSB0bGJfaW52YWwtPnByaXZh
dGU7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd1Y190b194
ZShndWMpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3ZtICp2bTsNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGludCBlcnIsIGlkID0gZ3VjX3RvX2d0KGd1YyktPmluZm8uaWQ7DQo+ID4g
PiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJnRsYl9pbnZh
bC0+c2Vxbm9fbG9jayk7DQo+ID4gPiDCoA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNl
bmRfdGxiX2ludmFsX3BwZ3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LCBlbmQsIGFzaWQsDQo+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqANCj4gPiA+IFhFX0dVQ19UTEJfSU5WQUxfUEFHRV9TRUxFQ1RJVkUsDQo+ID4g
PiBwcmxfc2EpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgdm0gPSB4ZV9kZXZpY2VfYXNpZF90b192
bSh4ZSwgYXNpZCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKHZtKSkNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFRSX0VSUih2bSk7DQo+ID4g
PiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBkb3duX3JlYWQoJnZtLT5leGVjX3F1ZXVlcy5sb2Nr
KTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghdm0tPmV4ZWNfcXVldWVzLmNvdW50W2lkXSAm
Jg0KPiA+ID4geGVfdGxiX2ludmFsX2lkbGUodGxiX2ludmFsKSkNCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSAtRUNBTkNFTEVEOw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgZWxzZQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHNlbmRf
dGxiX2ludmFsX3BwZ3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LA0KPiA+ID4gZW5kLA0KPiA+ID4gYXNp
ZCwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiBYRV9HVUNfVExCX0lO
VkFMX1BBR0VfU0VMRUNUSVZFLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJs
X3NhKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHVwX3JlYWQoJnZtLT5leGVjX3F1ZXVlcy5sb2Nr
KTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHhlX3ZtX3B1dCh2bSk7DQo+ID4gPiArDQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOw0KPiA+ID4gwqB9DQo+ID4gPiDCoA0KPiA+ID4gwqBz
dGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2N0eF9wcGd0dChzdHJ1Y3QgeGVfdGxiX2ludmFsDQo+
ID4gPiAqdGxiX2ludmFsLA0KPiA+ID4gdTMyIHNlcW5vLA0KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5jDQo+ID4gPiBpbmRleCA5ZTAxNzY4NjFjYjYuLmUyNjY3MjAwNDYyYyAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiA+ID4gQEAgLTQ5NDYsOCArNDk0Niw3IEBAIGludCB4ZV92bV9h
bGxvY19jcHVfYWRkcl9taXJyb3Jfdm1hKHN0cnVjdA0KPiA+ID4geGVfdm0gKnZtLCB1aW50NjRf
dCBzdGFydCwgdWludDY0X3Qgcg0KPiA+ID4gwqAgKiBAdm06IFRoZSBWTS4NCj4gPiA+IMKgICog
QHE6IFRoZSBleGVjX3F1ZXVlDQo+ID4gPiDCoCAqDQo+ID4gPiAtICogQWRkIGV4ZWMgcXVldWUg
dG8gVk0sIHNraXBwZWQgaWYgdGhlIGRldmljZSBkb2VzIG5vdCBoYXZlDQo+ID4gPiBjb250ZXh0
DQo+ID4gPiBiYXNlZCBUTEINCj4gPiA+IC0gKiBpbnZhbGlkYXRpb25zLg0KPiA+ID4gKyAqIEFk
ZCBleGVjIHF1ZXVlIHRvIFZNLg0KPiA+ID4gwqAgKi8NCj4gPiA+IMKgdm9pZCB4ZV92bV9hZGRf
ZXhlY19xdWV1ZShzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiA+ID4g
KnEpDQo+ID4gPiDCoHsNCj4gPiA+IEBAIC00OTYxLDkgKzQ5NjAsNiBAQCB2b2lkIHhlX3ZtX2Fk
ZF9leGVjX3F1ZXVlKHN0cnVjdCB4ZV92bSAqdm0sDQo+ID4gPiBzdHJ1Y3QgeGVfZXhlY19xdWV1
ZSAqcSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIHZtLT54ZWYpOw0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgdm0gPT0gcS0+dm0pOw0KPiA+ID4gwqAN
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8uaGFzX2N0eF90bGJfaW52YWwpDQo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiA+ID4gLQ0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoGRvd25fd3JpdGUoJnZtLT5leGVjX3F1ZXVlcy5sb2NrKTsNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqBsaXN0X2FkZCgmcS0+dm1fZXhlY19xdWV1ZV9saW5rLCAmdm0t
PmV4ZWNfcXVldWVzLmxpc3RbcS0NCj4gPiA+ID5ndC0NCj4gPiA+ID4gaW5mby5pZF0pOw0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoCsrdm0tPmV4ZWNfcXVldWVzLmNvdW50W3EtPmd0LT5pbmZvLmlk
XTsNCj4gPiA+IEBAIC00OTc1LDE0ICs0OTcxLDEwIEBAIHZvaWQgeGVfdm1fYWRkX2V4ZWNfcXVl
dWUoc3RydWN0IHhlX3ZtDQo+ID4gPiAqdm0sDQo+ID4gPiBzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAq
cSkNCj4gPiA+IMKgICogQHZtOiBUaGUgVk0uDQo+ID4gPiDCoCAqIEBxOiBUaGUgZXhlY19xdWV1
ZQ0KPiA+ID4gwqAgKg0KPiA+ID4gLSAqIFJlbW92ZSBleGVjIHF1ZXVlIGZyb20gVk0sIHNraXBw
ZWQgaWYgdGhlIGRldmljZSBkb2VzIG5vdA0KPiA+ID4gaGF2ZQ0KPiA+ID4gY29udGV4dCBiYXNl
ZA0KPiA+ID4gLSAqIFRMQiBpbnZhbGlkYXRpb25zLg0KPiA+ID4gKyAqIFJlbW92ZSBleGVjIHF1
ZXVlIGZyb20gVk0uDQo+ID4gPiDCoCAqLw0KPiA+ID4gwqB2b2lkIHhlX3ZtX3JlbW92ZV9leGVj
X3F1ZXVlKHN0cnVjdCB4ZV92bSAqdm0sIHN0cnVjdA0KPiA+ID4geGVfZXhlY19xdWV1ZQ0KPiA+
ID4gKnEpDQo+ID4gPiDCoHsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICghdm0tPnhlLT5pbmZv
Lmhhc19jdHhfdGxiX2ludmFsKQ0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybjsNCj4gPiA+IC0NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkb3duX3dyaXRlKCZ2bS0+
ZXhlY19xdWV1ZXMubG9jayk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFsaXN0X2VtcHR5
KCZxLT52bV9leGVjX3F1ZXVlX2xpbmspKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGxpc3RfZGVsKCZxLT52bV9leGVjX3F1ZXVlX2xpbmspOw0KPiA+IA0KDQo=
