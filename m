Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B61CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 06:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379E10E2D6;
	Fri, 16 Oct 2026 06:32:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686BD10E2CD;
 Fri, 16 Oct 2026 06:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792132317; x=1823668317;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nh8mao5eQn97ugHd2PiIdc/qyhUm/YH+kOFHq+86zK4=;
 b=Fy0ExXLig1cLr0zCnOr8UfssP/l2Evrx4/r+KlqMTnSTPoelJ/PRKFnC
 rOd6dlh2+oPGeR1whjE0E3xpQnsFPiJ8UvTscXo9FT+lifbZof8O9WUd7
 Cs1bi5Fbx5xKWU1Dy1BqY6/n3wQGxhNLkkL2qS0PuOf6MRBOL/uKufRzR
 57LxMCmWMrgSTC/VwDizYKpLw4heaVxMJ4/nBobggpnaFeVLsUKEWoLyF
 qHHwG7A7QdbqhmrelIG7U6FiZxwUCq13DU0/6hFJSE01YSzX+YDH87GcP
 QsLeCXakZZRNkcJSyZy7wavJYuM6yylTDUm45S56PeAP0Mi8j/e/ldgtX Q==;
X-CSE-ConnectionGUID: i41hRWXkSZOepQYg3MrQ7Q==
X-CSE-MsgGUID: B3JST/tVQgyv55NXSVtDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="810787"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="810787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:31:57 -0700
X-CSE-ConnectionGUID: 8DnCEpOXQZu49mBM041Sxg==
X-CSE-MsgGUID: X9HfRj/+QIWU99hoiKql+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1879745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:31:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:31:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 23:31:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfB4K2tAwLEkvZ59zc15KPdUd1pj4239DIjGlfCdEJudNYeGMyzs/fJDuCj4bBMFGX4cM2ZaC6ncVjv8F56PGysiCpUPnsAaj65iVNEJdn7h9lCfJumor/k6gBfJTsO7CaxPncUrmcYrPKMzca1kVjkApxoLURIS7E+z/dLTdI7oexeBvtiICyRuWe2dvAN2CYBcWpucA854t5bdV8YzpRNrvcQ2PIYwCJzhw1y759hon7k/0kfquQc+shFOxuPQgxD41DC8WwUT5C+idzRlKlyYzHM1dY3nwOde6Fuq97b2ETpkJ21XeMhYHSJRJ0vmTSSeZCypqz6pF9+upDsvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh8mao5eQn97ugHd2PiIdc/qyhUm/YH+kOFHq+86zK4=;
 b=BJYphtQAqgBXSEhGPqJiRpr5goQq+OSyo619H3RO4oRJEpZ1LwdYY8bSIvM7hV4qWmuO6Efzna/sRQD79Z0psJD55hZUnowBUWiRBLg8YGZh9gjeeTraVSAcxU3HGUbKsbbdiBlO8WD8TpfOmo1Nro8HDC61WVbeKjW8meLtz4i1+mcxMosxWoILgUZ6AzzOETAp2wu1sMtBVnCVczRjIH7f40kD9BxSDkt2k5xSV1sqpCDg2nsU4P8KN768rGudLz1D4KWdLihvQ6L1+ueeH1Zp2gTv62MXRs40wT4TGivPn3of/6Hbooy4/gNh3rGG7Aws6/fNg0Z/2cfdaLWy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 06:31:54 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 06:31:54 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Topic: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Index: AQHdW8o8DVMWgMUYpEeCtbvuRKKZG7b9DR6AgAD2DQCAAbQtEA==
Date: Fri, 16 Oct 2026 06:31:53 +0000
Message-ID: <DS4PPF69154114F4EFEA120A0D910DF50FAEF9B2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261014105306.2761683-5-mika.kahola@intel.com>
 <20261014134601.2846027-1-mika.kahola@intel.com>
 <DS4PPFE901A304F7183CAB8F9D03B7CD119E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F7183CAB8F9D03B7CD119E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DS0PR11MB8230:EE_
x-ms-office365-filtering-correlation-id: a027c4b8-b962-45c0-396f-08df2b4f2b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|23010399003|1800799024|366016|38070700021|56012099006|260925022911599003|260925021911599003|260925021311599003|5023799004|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: CjzMnusYt8MujjcCXBKwfXQmcWTWZNfFWWnvnxYq1cAXoFXGOWlt/Lt3kHhwJLMYTFqeahQURL+ouhqmvfISmaMo60C5N0smtdyZXg09bSGMV5zy29FY489FmWGPmeMownMqlfQZ451St8Q1GDaMiQqrv4OxDW4YqbCxMr2eIcDPkZCzYW/90KTIqlRAgdge9JmWZVhwabNl7Sr29u9d0iIKUNRUnXeZivs+sOzxg1HFC+qVDKSSSj8SrxYii5v39Fopy+HD2mTUeOkotQRQ9WMsu9aY8XQF/FQ94/kYJwqUFmHiKZagP8E4VLwHFvUZVcmykEdJDidp/Hg5kxHn0cICYoreAr+7l7jIsy5KIYvUVF81j9y6DcMb0o8ZQ1G6SBJgZbclfV9XCUnuYpMNBo44ZCrS5FEZ+09p+Hf9zqyN7gUOe7zB1Fg7otbRuKm9rCUzVFSwcivk7ZRuFMi+NRaJp6ZO2N5xwzmCzE8WAYGqWNM6qO1/KiJaCA1bR4xUUXaHTEDT4D9i/5bWYN6ldmidot/1U+qVhCOWcgbsLaenhypO4V53VuyK9qE7zq9LuXxUpzH1pdvBZs8ZNu6pYo1dsQ+D8Sq5oosetrQ6cBulOFXNNYEYaWxP1WQ0Dlm+t/ExXu5ZM6XZzztmaRUrjqYhnH8m75nnL3CwyIHpX8Hrlpq1ia8g2RwEwQ5030+Wmg6LYQ2hKc3xHGyRc7qldA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(5023799004)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWVpQlIvbU9Sdmpib1BDTHBsVit5K3JGSWQyZVlSSWlnOU5zWVlNOGdPaGVv?=
 =?utf-8?B?eDczWWJzeG5ONlhmUHBmdHhKQ05QYjBiSXltaDRiOHIrNm5Wc3pNdnBNRDh0?=
 =?utf-8?B?a1ZuTldwWnZKNmxkYWp2RjdiNUFiVnFHK1h1RlJVRU5IS2FDRHRjTHJveE5B?=
 =?utf-8?B?SmtML2JLZ3RBeHdSTW9LR0lZL1Q5bVVTVDRvWnQwa3llSTJyd2Q5blNnbXVa?=
 =?utf-8?B?UGJkRzZTL00zdlFrYU5WcnJYb0tHblpacmdOeVpwT1Rtd1FSQ0xUcWx2OWQ2?=
 =?utf-8?B?bTkyUXNvMEM4SHVyNWNTMzdtR21DZjFTcVFwYk1GWjYxbUZXaDhaNjhUNDJi?=
 =?utf-8?B?NVNaZ0RWV3NodFdLZVpEK2lEdEFwQjdmWVRycEhCRFM4anJmN3V0clBUSDNY?=
 =?utf-8?B?S3lFeTV2SmZ6K0xWbndENjZUMXZOM2wvMXBxMVEvQjc5WGE4MmNVZExPeTBC?=
 =?utf-8?B?UklZVWQ0cEp3UU1kOGxtRTdSMkU5bUlSWWE0STY0aEloaEcwOG1GNUp6QnlZ?=
 =?utf-8?B?RStWOU12aFVCdVhzVWYzNENxUGczZ2hra2JBVUNqTUI0Q0tCaVFheVJ4ekVF?=
 =?utf-8?B?bDJSREp1dFdpMkYzS3RyUE4zY0VFVVhvdjQzRW40akxuM3pjMXM1MktNTkMz?=
 =?utf-8?B?ZFd4SW5NSmRvallRcmwxZm9aa0ZVbWVwL1lYSnBVQUZFVVJDeFhiZ2JLa3Az?=
 =?utf-8?B?WHhOK1lOUVJsZGZtM0NoRXVrSmtNaG5vY2JONXpEcHM4UFdQWGlDdHpmS3l5?=
 =?utf-8?B?SzVZRWxXUHlaejlGdFFlU2tkTmVyeWdkbUlnMEd0VTFhcFF1Qy9NdS91N3BT?=
 =?utf-8?B?MGhRVEQzbExUL3pVL0xtMVV2aGRzR2pzU3hvWVBkaXJRNFVhZFQwb0Qra054?=
 =?utf-8?B?U0ZZSnJWa096TW42Ykd0VFhQOWFSdkpnWjR4NnhmQ01SMDZySUR4U1J1OWMv?=
 =?utf-8?B?akkrUklDRi9vT3JIaUNKd2xndmp3Vy81eThYOTdBRnZBNm9jN0t3eEZIRFpL?=
 =?utf-8?B?V1E3MlAxZjV6dDJrcEkzR3EwUmpFRGtRYnhpdHMzQnR5ckY4bFdhNktuZUhO?=
 =?utf-8?B?bUtsL0VCa1RRcWxzWlhjZWZqZ3p5c281VUc5ZTlUaHJxRzJ4VnlkUUJFOHo3?=
 =?utf-8?B?eCtvK21RSXVFb3VXR2pvZVNlRCtkSjF0MmM0cnpDRVBlazJvQVJFcUlBL1pr?=
 =?utf-8?B?bUE5WkVzTTZGNmZ4NVl5aVN5b0JTakw5clRUeFd6MlRzNnFCYThMeitQRmN0?=
 =?utf-8?B?K2FheWVlV2I4aUFTcTFwZFlzckNZL296a1E5SDE5eGVXVlNWd0hZeWZpRXpu?=
 =?utf-8?B?QU9GWjU0cWtPMWRsYmhNL2FHdm12UXNyRS91ekpNRytOekZCSWIveUJmV0Mr?=
 =?utf-8?B?WnB2bEtKR0ZEYms3N1p0bnkzVmNwSXVQTnU3UWVMYnVaWG5LcTR0YVROSE1C?=
 =?utf-8?B?VnQybHQ3Q1NaL1RBU2orR2crcnJTalQwMEFTclNJc0E5Y3k4WWxkNm9kd2NZ?=
 =?utf-8?B?MzFUWnlPQWJCc2M4SGJwMTI3M3YyeFJuV1N6aERXMWxnZW1UNExSSnpoKzJO?=
 =?utf-8?B?TkpxMmZYNnZYY0FwZHY4TUg2ZXFLR3NYYzhpczdoSm9ERXZZRjdPeUkzMmxZ?=
 =?utf-8?B?WDlTSTFoWGlUMmIyVmpIQUliZlBqRFpKWlRtU0VHbTBVMys0eWxHeFdYSWN3?=
 =?utf-8?B?bHVUdEYrSnpBbTRJdDMwaEZqdWExY3lMVG9tMHNMMllOcG80QklxdTJ5Y1RJ?=
 =?utf-8?B?MDhzNEZvdWpVaWRSTzRJbEMzTHlUeVR3OFk4Z2hQQThZVURseFRaQTZLMlBX?=
 =?utf-8?B?ZFZQWHJDWHBOc2hFWDYzZ2diUENkSGQvcC81aFBVeHc1NTU3SzkybjlkMk5m?=
 =?utf-8?B?VXJZOE11M2pmalB0Rm1KRDd4VVJodWgyUmlPVUNjVTRxRHpVUnQzU2sydWZ0?=
 =?utf-8?B?QVJwK0dsck45VXlrWVJtakc1QlBwM1dmY0ZYNXArcVN1VlVCMXNxTy9YSTRp?=
 =?utf-8?B?dTcxcTNxVDhDZUZHaENKRmp1M0pNWStodVMyb2xic1pDMFduOCtDSk5rTkx4?=
 =?utf-8?B?TW5TZ1lVV3RndmJ5TXNDUHNkRmtZOWZMRVZHRUdNeVVZOVUxTWg0NWw2bGk5?=
 =?utf-8?B?c1hianRrL0tlb0ZzSUM3L1R4cWx3dkdUZkJjTFR3WkRtSDcxcFBFTkVjbFRF?=
 =?utf-8?B?bGsrOFpqYzNXeExyOXF2M2ZxUzViSXlPbjArWWwySlVGM0ZxY3BpUS9IS0xn?=
 =?utf-8?B?QUpiTlZ4N3VINzBXbUhEditMYU1BZUlZMUpGbVQ5VzFsR0Y4ZkZVR0FxOHdS?=
 =?utf-8?B?ZTBKUlZGRE0zZFFoVmJ2OHc1eFNIbkNCNkxmdkhJcGJHNmkySTlwc1hOYTRt?=
 =?utf-8?Q?Zgft0NYhLjuS+n8lmzJDw8irnRKMG9AZ+m9t5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: goKlfgDK4AT2Fw6M4BPtBqRX73NhFLHce/DiQDkJvi4o2RvOwXD25rFzkzcw1VDQ/EJUq0oN1bmU4INaqKVzsR+tbQKrZA3/Sg4BCwS48pmP6aa+QXNWD7NDhG5Nv1uU3yaLAFl3EM4i0JOq8t+1v9y0TMLvgqvaxeGVuQP8gAuztVgMWqPdO14APYlYXQCEUbtAU6lvYVdet5/tJl7YxYkZrOn5V86K9EOSYFmyayFB4YTnOQErtlfbCNLfm6T0tg0zBoK7i7kMeneg1ascAj5ZfwtybEuIKhSmhiRCEdNV/JCAwPX4nOpblTIBr68cd5zLnLzEVpTDFS2GjgiGgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a027c4b8-b962-45c0-396f-08df2b4f2b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:31:54.0144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j++Xc/2fj5V2S4TjJ6koD5w+fHjRm7O6FtAWt2kOAOiKL7fKWkm0n0VnpeUkVOpbDJgA29fQFOMuxyLXQxogRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW5kcGFsLCBTdXJhaiA8c3Vy
YWoua2FuZHBhbEBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCAxNSBPY3RvYmVyIDIwMjYg
Ny4yNw0KPiBUbzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+OyBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
RTogW1BBVENIIHYyIDQvNF0gZHJtL2k5MTUvbHRfcGh5OiBhcHBseSB0aGUgUExMIHBvd2VyIHNh
dmUgVy9BIG9uIExUIFBIWSBwbGF0Zm9ybXMNCj4gDQo+ID4gU3ViamVjdDogW1BBVENIIHYyIDQv
NF0gZHJtL2k5MTUvbHRfcGh5OiBhcHBseSB0aGUgUExMIHBvd2VyIHNhdmUgVy9BIG9uIExUDQo+
ID4gUEhZIHBsYXRmb3Jtcw0KPiA+DQo+ID4gVy9BIDE0MDIyMDgxMTU0IGNvdmVycyBQVEwrLCBi
dXQgb25seSB0aGUgQzEwIFBIWSBzZXF1ZW5jZSB3YXMgZXZlcg0KPiA+IGltcGxlbWVudGVkLiBQ
b3J0IEEgaXMgYW4gTFQgUEhZIG9uIGRpc3BsYXkgdmVyIDM1LCBzbw0KPiA+IGludGVsX2RwbGxf
cG93ZXJfc2F2ZV93YSgpIGhhZCBub3RoaW5nIHRvIHJ1biB0aGVyZSBhbmQgdGhlIFBIWSB3YXMg
bGVmdCBpbg0KPiA+IHRoZSByZXNldCBwb3dlciBzdGF0ZSB0aGF0IGJsb2NrcyBTMGl4Lg0KPiA+
DQo+ID4gQWRkIHRoZSBMVCBQSFkgc2VxdWVuY2UgYW5kIGRpc3BhdGNoIG9uIHRoZSBQSFkgdHlw
ZS4gVGhlIFBMTCBzdGF0ZSBpcw0KPiA+IGNhbGN1bGF0ZWQgZnJvbSB0aGUgZURQIHRhYmxlcyBh
dCBSQlIgYXMgdGhlIEMxMCBzZXF1ZW5jZSBkb2VzLCBzbyB0aGUNCj4gPiB0aHJvd2F3YXkgc3Rh
dGUgaXQgYnJpbmdzIHRoZSBQTEwgdXAgd2l0aCBpcyBtYXJrZWQgYXMgZURQLg0KPiA+DQo+ID4g
QlNwZWM6IDc0MTUxDQo+IA0KPiBTbyB0aGlzIGJzcGVjIGRpcmVjdHMgdXMgdG8gWGUyX0xQRCBX
QSdzIGJ1dCAzNSBpcyBYZTNwX0xQRCBhbmQgb24gdGhhdCBwYWdlIHRoaXMgV0EgaXMgbm90IHJl
aXRlcmF0ZWQuDQo+IFNvIHdoYXQgSSBhbSBjb25mdXNlZCBhYm91dCBpcyBpZiB0aGlzIGlzIGFj
dHVhbGx5IHJlcXVpcmVkIGZvciAzNSBvciBpcyB0aGlzIGp1c3QgQnNwZWMgbm90IHVwZGF0aW5n
IFhlMl9MUEQgV0EgdG8gUFRMLFdDTCBvbmx5Lg0KPiBCZWNhdXNlIHRoZSBQSFkgYWx0b2dldGhl
ciBjaGFuZ2VkIGZyb20gTlZMIGFuZCB0aGlzIGlzc3VlIHdhcyBhY3R1YWxseSBzZWVuIG9uIFNO
UFMgUEhZLiBXZSB3aWxsIG5lZWQgbW9yZSBjbGFyaWZpY2F0aW9uIG9uIHRoaXMuDQoNClllcywg
dGhlIEJTcGVjIDc5NDgwIGRvZXNuJ3QgbWVudGlvbiBMTkwgbm8gbW9yZS4gTGV0J3MgcGxheSBz
YWZlIHNpZGUgYW5kIGRyb3AgTE5MIGFuZCBjb25zaWRlciBvbmx5IFBUTCwgV0NMIGFmZmVjdGVk
LiBJIHdpbGwgc3BpbiB0aGUgc2VyaWVzIHNvIHRoYXQgaXQgYnJpbmdzIHRoaXMgV0EgYXMgcGFy
dCBvZiBXQSBmcmFtZXdvcmsgZm9yIFBUTC9XQ0wuDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyEN
Cg0KLU1pa2EtDQogIA0KPiANCj4gQWxzbyBGWUkgSSB0aGluayBwYXRjaHdvcmsgbWVzc2VkIHVw
IG9yIHBhdGNoIG9yZGVyaW5nIGZvciBzb21lIHJlYXNvbi4NCj4gDQo+IFJlZ2FyZHMsDQo+IFN1
cmFqIEthbmRwYWwNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fo
b2xhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcGxsX21nci5jIHwgIDUgKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2x0X3BoeS5jICAgfCAyOSArKysrKysrKysrKysrKysrKysrDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmggICB8ICAxICsNCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcGxsX21n
ci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMN
Cj4gPiBpbmRleCA2NWNjMDI4YTkwZGEuLmRmNDE2YTA1ZTY2ZCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMNCj4gPiBAQCAtNTI0
OCw3ICs1MjQ4LDEwIEBAIHZvaWQgaW50ZWxfZHBsbF9wb3dlcl9zYXZlX3dhKHN0cnVjdCBpbnRl
bF9kaXNwbGF5DQo+ID4gKmRpc3BsYXkpDQo+ID4gIAkJaWYgKCFpbnRlbF9lbmNvZGVyX2lzX2Mx
MHBoeShlbmNvZGVyKSkNCj4gPiAgCQkJY29udGludWU7DQo+ID4NCj4gPiAtCQlpbnRlbF9jeDBf
cGxsX3Bvd2VyX3NhdmVfd2EoZW5jb2Rlcik7DQo+ID4gKwkJaWYgKEhBU19MVF9QSFkoZGlzcGxh
eSkpDQo+ID4gKwkJCWludGVsX2x0X3BoeV9wbGxfcG93ZXJfc2F2ZV93YShlbmNvZGVyKTsNCj4g
PiArCQllbHNlDQo+ID4gKwkJCWludGVsX2N4MF9wbGxfcG93ZXJfc2F2ZV93YShlbmNvZGVyKTsN
Cj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiBpbmRleCBlMDVmZDIzYjhhNjUuLmQyODZkMzNhMDNl
YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0
X3BoeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9w
aHkuYw0KPiA+IEBAIC0yMzEzLDYgKzIzMTMsMzUgQEAgdm9pZCBpbnRlbF94ZTNwbHBkX3BsbF9k
aXNhYmxlKHN0cnVjdCBpbnRlbF9lbmNvZGVyDQo+ID4gKmVuY29kZXIpDQo+ID4NCj4gPiAgfQ0K
PiA+DQo+ID4gKy8qDQo+ID4gKyAqIFdBIDE0MDIyMDgxMTU0DQo+ID4gKyAqIExUIFBIWSBwYXJ0
IG9mIHRoZSBzZXF1ZW5jZSwgc2VlIGludGVsX2RwbGxfcG93ZXJfc2F2ZV93YSgpLg0KPiA+ICsg
Ki8NCj4gPiArdm9pZCBpbnRlbF9sdF9waHlfcGxsX3Bvd2VyX3NhdmVfd2Eoc3RydWN0IGludGVs
X2VuY29kZXIgKmVuY29kZXIpIHsNCj4gPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5
ID0gdG9faW50ZWxfZGlzcGxheShlbmNvZGVyKTsNCj4gPiArCXN0cnVjdCBpbnRlbF9kcGxsX2h3
X3N0YXRlIGh3X3N0YXRlID0ge307DQo+ID4gKwlpbnQgcG9ydF9jbG9jayA9IDE2MjAwMDsNCj4g
PiArCWludCBsYW5lX2NvdW50ID0gNDsNCj4gPiArCWludCBlcnI7DQo+ID4gKw0KPiA+ICsJaWYg
KGludGVsX2x0X3BoeV9wbGxfaXNfZW5hYmxlZChlbmNvZGVyKSkNCj4gPiArCQlyZXR1cm47DQo+
ID4gKw0KPiA+ICsJZXJyID0gaW50ZWxfbHRfcGh5X3BsbF9jYWxjX3N0YXRlX2Zyb21fdGFibGUo
ZW5jb2RlciwNCj4gPiB4ZTNwbHBkX2x0X2VkcF90YWJsZXMsDQo+ID4gKwkJCQkJCSAgICAgdHJ1
ZSwgdHJ1ZSwgcG9ydF9jbG9jaywNCj4gPiBsYW5lX2NvdW50LA0KPiA+ICsJCQkJCQkgICAgICZo
d19zdGF0ZS5sdHBsbCk7DQo+ID4gKwlpZiAoZHJtX1dBUk5fT04oZGlzcGxheS0+ZHJtLCBlcnIp
KQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwlkcm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0s
DQo+ID4gKwkJICAgICJbRU5DT0RFUjolZDolc10gQXBwbHlpbmcgcG93ZXIgc2F2aW5nIHdvcmth
cm91bmQgb24NCj4gPiBkaXNhYmxlZCBQTExcbiIsDQo+ID4gKwkJICAgIGVuY29kZXItPmJhc2Uu
YmFzZS5pZCwgZW5jb2Rlci0+YmFzZS5uYW1lKTsNCj4gPiArDQo+ID4gKwlpbnRlbF9sdF9waHlf
cGxsX2VuYWJsZShlbmNvZGVyLCAmaHdfc3RhdGUpOw0KPiA+ICsJaW50ZWxfbHRfcGh5X3BsbF9k
aXNhYmxlKGVuY29kZXIpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBpbnRlbF9s
dF9waHlfcGxsX3ZlcmlmeV9jbG9jayhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwNCj4g
PiAgCQkJCQkgIGludCBwcmVjb21wdXRlZF9jbG9jaywNCj4gPiAgCQkJCQkgIGNvbnN0IGNoYXIg
KnBsbF9zdGF0ZV9uYW1lLA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2x0X3BoeS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2x0X3BoeS5oDQo+ID4gaW5kZXggMzY4Y2VlZGIxZTBhLi5hOTE4MDEyYjcxZTggMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHku
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgN
Cj4gPiBAQCAtNDcsNiArNDcsNyBAQCB2b2lkIGludGVsX3hlM3BscGRfcGxsX2VuYWJsZShzdHJ1
Y3QgaW50ZWxfZW5jb2Rlcg0KPiA+ICplbmNvZGVyLA0KPiA+ICAJCQkgICAgICBzdHJ1Y3QgaW50
ZWxfZHBsbCAqcGxsLA0KPiA+ICAJCQkgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfZHBsbF9od19z
dGF0ZSAqZHBsbF9od19zdGF0ZSk7DQo+ID4gdm9pZCBpbnRlbF94ZTNwbHBkX3BsbF9kaXNhYmxl
KHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyKTsNCj4gPiArdm9pZCBpbnRlbF9sdF9waHlf
cGxsX3Bvd2VyX3NhdmVfd2Eoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpOw0KPiA+ICB2
b2lkIGludGVsX2x0X3BoeV92ZXJpZnlfcGxscyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSk7DQo+ID4NCj4gPiAgI2VuZGlmIC8qIF9fSU5URUxfTFRfUEhZX0hfXyAqLw0KPiA+IC0tDQo+
ID4gMi40My4wDQoNCg==
