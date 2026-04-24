Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23903FED3EF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 17:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55010E0B6;
	Fri, 24 Apr 2026 17:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv6FM3no";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C8710E0B6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777051479; x=1808587479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ErBWks1lhxtX1EsRGIj+gPMkqUxi3CYL+i/Il58Lyc=;
 b=nv6FM3norFkXJfvdZxzjDjNd5+bOxgoYjG6kxgLPU2fHdjMS6MvySIkE
 qu+W2uri+IXctXe2oCcs1giNZOAYSjy2dss49ng71ZdaRSFV0yqGXovQ8
 QcGoWWDOJJch9VHmFnq+Ml1qphcyg9u+pzOZHUs/OPPL3uqmfi7WI08t6
 shAw3F2rbL7DSjGiBJgY7Cz1zDEOCzRqQGTKAjqvRmvws+cekcX/Q5oy0
 axFoakS9B7Pg26borM/3KTcKkqS+Ldjh6oQXKKvJ39F1DWhTwEkerDgGo
 GDeJeI2lgDj6M9Xf9yOLl98JxnHvhmulkt4nFrP2MlWbTZa0PSZ+8ap8W g==;
X-CSE-ConnectionGUID: 71imij5DTveFiiQd6qOkJw==
X-CSE-MsgGUID: lbtgjCsPRKCgAUi7gLXKJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77923111"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="77923111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:24:38 -0700
X-CSE-ConnectionGUID: MLIq9TBqTHSxCC5uajOwjQ==
X-CSE-MsgGUID: ET+IgdchRCmmboVfXarctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="229811265"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:24:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:24:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 10:24:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3lSJDjEtfjQaQEYivKYCexX/EYKR6g+nDLwDgQEgZ1yDdBx8F0ZbZ5+8wWI11+jnOn36crDw7dNmLZbolSUlhzR6ve0pqTbDc+kDR8JUjs6NhkFpQZp7ul44YmmMCeQuoLAHYxsmsJTUsnUfhMddYU6xJ2AvX1LCFT3xzsGwGjqFQ2AZAv31rJ15kOv8zcVfwop5sPkzlbAKb05YDHCldu+HcmXnDC3eJ45hLlRDGIGpqGU4jDCzHlpqqN3snowpW2638bROEbkjbqTUu2Vi7AO2Bt9lyJC5SA/iaAYeq8xjBxC3+lcyadwKXY6fHRXH8PEKjMWrOTsibZbGWCFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ErBWks1lhxtX1EsRGIj+gPMkqUxi3CYL+i/Il58Lyc=;
 b=hpG3IVO93NGBN5MIPXKSM/MX3GWKlGNY7kSxg8D9GZarjnsw2mTghWY7RwYVHMnntHR5I4QZ4u5K3iaBu7BQW+rMFFxVd9iJwCawtQoP+YgA9cy8hIv5LLcXzRMDETTGRH8EVkiyL8h+tGhZFNQ88U1XGdzWgeWafcPg88uWGU2pz6jHz8eigy0j0JI9Vo9sezN5LuXDz6HeWjNAjjs2HOcmQIKCaI4jzE7NXmdvY3XO0WcbXvD8BP96HBf/pMCj7Tho2iTFfoQO2YxDHy7E5sChWR6U9f//6w24OuDmURCDph9dffoP0kC6GZ32ZRvEPlG0RsNSE9iembJ/WXNwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 17:24:34 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:24:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 07/10] drm/xe: Move GFX_MODE programming to RTP
Thread-Topic: [PATCH 07/10] drm/xe: Move GFX_MODE programming to RTP
Thread-Index: AQHc03N+NLz0ASqJdES9+yS1H2zAH7XudlzA
Date: Fri, 24 Apr 2026 17:24:34 +0000
Message-ID: <DM4PR11MB545632D32FE2965688621FEEEA2B2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-7-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-7-baa94014e3e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB6848:EE_
x-ms-office365-filtering-correlation-id: e8a9f409-9b1c-4e89-70d3-08dea2265ab2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: gAW4DRyI5thuCOAhnvNIOqYf7FHprsrdH5PUYB5rO/9HZb80MXT5CdjsVQ0EO7BrEE+gbE0MIVmDiPa994lbgXBNXbOGlWUUl1VVYwCILGz3dp4z+u1m/NUFoN6f9ND9oKMSkVUXRJziVYJHjNLONrbWMYwCVeJdmuIouGIpUKqBrk6hOu7XfipUu7lBKK4KNdmwLWSRlVp8ZD0Y9MuxdcPcx6Pwo87EkPyQ6ls5s1wNzEELs88Zj9Cy12XMp4WF0xG8xYYTYtpBDLO4f7eTrwFp8Dv5PNCeDDXpg68tsgDWOvwvNqTPIzqFNwjQMhD+rJINIdOkiTg0Zb1juvCSht9LA0iHT2ziZCEdf7LlLHyoefAztuwmRI79E7thWDnyKhl0DWPdUsCpbUJP+5/cSGStt9yzXdO4j5qsKyRnDFqtgPILwhw0jdQhrzI7kbqtZvFS7F5hlLMMuehgQtSkibppgfspy5+LXqtygYDFk25b8h5U/vEVc2Bg88NJReoim6ifO7dSutKL4p7qx9zjahcwj09WrneXPP7lwO/K5CXW0Jz/JD5/VF4VLwsfn1T4HKvMdCd/Xrs89qdhyvi20yfElCwCK11ZMqkFNKVCrffLEcfoHEsWrbbqqUebKQSA+CgQiHumUYCukCTFyX8qkQZlNhqaUS72b4NFMWiUf0SSn722GfS7+gSHUurrm3uGGoig28lE3HO2286amrJG9GMO4tZf07ImEylmsTq4Ywu3AqiUQr//7XbzHvNDeE2imXsyS9O4+ujPrDGeVJrm+1TA+u28VhqVT7SdbhO9shI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blFmRHFVSUJyYWQ4TkppdUJjQi95N3FRejQzTDBXcEZqRW1HMFBjZDE5V0xD?=
 =?utf-8?B?U2xsUkIxTTc4S2JqTDdtZUVqNzZTYmkybk9ndDRWUnBuUnRkOWZXWklPdTVN?=
 =?utf-8?B?YTAvMGJNYkVSd2VjeDJXbW15Tk4yTlZNS3dqZC9kVXdSM3NaNUZPZkFRZEJO?=
 =?utf-8?B?dE5NdjlHdEVBVXVOMWdjTEpWeERhOWtyVVVPdGVZeWppQzdrSDVvMHVPVnpi?=
 =?utf-8?B?ZDdHM0Voc08rMlZXaGxEYUdzNC8zWmphVzdXeUM0ZFhGUFJ1cjVFZGhwQUJi?=
 =?utf-8?B?Smx6dlNHemMzUGx1b1hMR29FbVlhY21HbGRmRjFhWTZXTExDQjR2SW55ckRw?=
 =?utf-8?B?dWp3OUlJbWUvODJMTzJqdjJyY0I5NEhJMlhWYUpsZEFZWnZzZ1Z4RGkyQjB3?=
 =?utf-8?B?YjFsancxVXI3amxabHJrZUM4ZmtYYWhucGNYZ0JZS3R0WGY2ejhLMlF0QWxa?=
 =?utf-8?B?UG5NVHRRZTlqczM2STl1UG1iOVBrcE1kbUhEcVJzM2dRekJwWWpFVFVQOHlH?=
 =?utf-8?B?dGUvcmhxVVJDV21WQzlFNkFLM3kwNDhESDNhbHF4eHpiLzNnS0NHdkYxWUNP?=
 =?utf-8?B?V0VoMmc3dG1KbHdGclp5QjY0dmNObDROdSsxLzBTOFBUa2g3ZFdWRkVxUUQv?=
 =?utf-8?B?ZHRTQzhaVjJqaXNETlgyWS9sYVdDdm0zUnh1Wk04VnN1cnRaVkdPT1FQd0JI?=
 =?utf-8?B?RzQzczJTY0xZNjFoNjZDOFY1RFdkdXNtUGE3M01PalBhcForKytpcWVSZ1Fw?=
 =?utf-8?B?dDU2R2M1REVlVUdzMXhnb2ZIeGhUMHRUNGU4ZDFESmxFSkFzYU5mWXNKS2ZT?=
 =?utf-8?B?a2RhKy9hT0g0ZjBWZTJuQWMvdHF1MzNaa1A1WjVmQm1QNEFvTGl1ektXTUg0?=
 =?utf-8?B?ZUJvdmc3RjJmZ3gzQ2Y3R21Dd3pNMUhiUVk2d1dkMldRclg5YmdrWGZsRXkx?=
 =?utf-8?B?Q2t4bUd2dnBPOFpFeU9udTkyejQ2UzRnclcyaTNrUTIxK2o1dDNkMTN1U3Vk?=
 =?utf-8?B?TTBVV0NMN2s3ZlFxeGs1U2hwL0JvbnBYUkpKcFYzNjhwVFRoa1hTOUNlcW9u?=
 =?utf-8?B?YjUxOTBJa2lZS3pUTFM1bjZDWkFZYmVFTGRzb2g3UDRsc1dlVGg2Yk5tditY?=
 =?utf-8?B?Mkc3aXNIblUydEVTRkVNY2RjU2NBSjBJWUhGVXJIWjl6N1ZHcFNTY2tCRVlU?=
 =?utf-8?B?azRvcUtBN24rTmMyaFB0S3oxREh6dFFRWU9zQWl5TkVrMFd4RmkyZTB6aHVu?=
 =?utf-8?B?V0xmSy9MZE55RW5DOHF1b3RPQUJMWk10YnFac0YrMk80SlB0WjZ0ZE03bkhy?=
 =?utf-8?B?S1dkVGR3Ynk2S1RwSm04ZGJzQmU1aERmMHlpMXhNV2RwcVlBQ25DaUpaS1dK?=
 =?utf-8?B?Z1BaZ1pBMkNiV0wrV0x1QW1Uc0c4a1g3cE04ZG9GM1hZYXpYUmR6cXlXQUdL?=
 =?utf-8?B?M091VnNYTFpEK1dwTW1uYVZUOUJRZUd6MnVCWXdBNVJEYzBHdHhyWHlTM0Fv?=
 =?utf-8?B?NzBsbFhZaFFZTkFJazc2MFBsaVk5TVprckJVYnphTURYUjMzYk1wbkQ5VzZq?=
 =?utf-8?B?TEcxYStVU0VSU0g4RlMycC9LT0dBbGRwamF6cCt1VDJKd05adXM0VkY3WGxI?=
 =?utf-8?B?ZkN2L2pnU3RDRERDcWhsY3UvTjN1SGF3YjE3Q2dUaVdoZEQxRHFUNEhjRyt5?=
 =?utf-8?B?ZlpyM3BkelRXcTI2K2gwT1JKRFFPTmlDKzBZWDk5WWhJYXhsQmlXL1NmTDhq?=
 =?utf-8?B?ZXZPL2hZYnRCVUdBRTBWcVFkdmJPOHJBajZRTzZPZFdBc1JLbFhqS0dyczY5?=
 =?utf-8?B?RkNSK01vMkdzcEF3Z2lwWFZCZm5GNVdKWWtvK1JQNTVNcnU3dVdsbVdtbnh2?=
 =?utf-8?B?aG9MT3lmTkRjTW11cTRqQmJRRHJieWw4Y2p2TVdlTUdUVlo0bUU0U0lHL3Zo?=
 =?utf-8?B?OUpieHN6V1pYaWcweEd1Q0R5T1NSRVk3Sit2Y3VDU00zcVpHOFdCdHBISnp2?=
 =?utf-8?B?RTlod3MzVEkzcmozL2JWcmtoSThpTGxBYTVtdjBZY0d5VTM5QlZycWhQKzRZ?=
 =?utf-8?B?bkRBeFNrbjRrWGF0eXFtc2xMV3FRMDJoUFpFS0JhWStmMjlsNTdKcWJBdlZ1?=
 =?utf-8?B?dW56Wmpva2U2c3BhanVQNW5CSDUwdjRjN0NoTlUyWkNCV1hNaVBXUCtrcDlS?=
 =?utf-8?B?bG5sY2FWZDdTMlhWT0p0NFJJRnJWdU9FRnNZbHd6Z1VidnRGKzFVRWlINHMw?=
 =?utf-8?B?eXRPU1FaUytkOU5oeTh0ZHNkazlKc1AwZEJPM28rQ3AxandsU0ZFUWVsMVhC?=
 =?utf-8?B?V1oyUEhzc3liNmV4V1o1YURxeHczSjFNZ1dCUm0xVTc4cE1tM2tHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DpnaB9SR4oLrWFEk8VApeDx8QrLM8qUGiw6kmS6ey4RrVZMlj3t0/Z3Xh6+4ig/H/A20eUoXkkl9JbNDpjqqJ6AB/bHUQIW/JJXDCeJDejUoT/icRCaCkP5kGhjD/xjGlOQHJ4TunaKGPDiHii2v/jyyDR7lniamGxX5b30NE339AiR8Ba5w2hCaWdNklkAxX2dXPHTXm6XO2XOMAioYz2QCozp2fmv1YvXYpOY+6wMxOdeA2naCy6hLdtC8y4C/uox94K/HCOK2gj2XUnyDPIvBoqlwE3aNVRna9rtnNnolGwFJ+gZGt8DBsqfDzySZBxIM/Zf5rZnR7kjdvx4ckA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a9f409-9b1c-4e89-70d3-08dea2265ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 17:24:34.7061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esGgL6rvbueBVY4ichnsCeRgp/bnjN9J8UeJq5ElFB2v6PfQyclm2Nyxcs3I1oITNrcuGkfw6CF47sEXiNMPmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgMzo0OSBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBUaGUgd3Jp
dGUgR0ZYX01PREUgdG8gZGlzYWJsZSBlbmdpbmUgImxlZ2FjeSBtb2RlIiBhbmQgdG8gZW5hYmxl
IE1TSS1YDQo+IHN1cHBvcnQgd2FzIHVubmVjZXNzYXJpbHkgb3Blbi1jb2RlZCBpbiB4ZV9od19l
bmdpbmVfZW5hYmxlX3JpbmcoKTsgaXQncw0KPiBwcmVmZXJhYmxlIHRvIGRvIHN1Y2ggcHJvZ3Jh
bW1pbmcgaW4gdGhlIGVuZ2luZV9lbnRyaWVzW10gUlRQIHRhYmxlIHNpbmNlIGdldHMNCj4gcmVm
bGVjdGVkL3ZlcmlmaWVkIGluIGRlYnVnZnMsIGFuZCB3aWxsIGFsc28gYXV0b21hdGljYWxseSBl
bnN1cmUgdGhhdCB0aGUNCj4gcmVnaXN0ZXIgaXMgcHJvcGVybHkgc2F2ZWQvcmVzdG9yZWQgYXJv
dW5kIGVuZ2luZSByZXNldHMuICBUaGlzIGFsc28gaGVscHMNCj4gY29uc29saWRhdGUgY29tbW9u
IGxvZ2ljIHRoYXQgd2FzIGR1cGxpY2F0ZWQgYmV0d2VlbiB0aGUgbWFpbiBkcml2ZXINCj4gaW5p
dGlhbGl6YXRpb24gcGF0aCBhbmQgdGhlIGRlYWQtY29kZSBleGVjbGlzdCBpbml0aWFsaXphdGlv
biBwYXRoLg0KPiANCj4gVGhpcyBhbHNvIGFsbG93cyB1cyB0byBkcm9wIEdGWF9NT0RFIGZyb20g
dGhlIGxpc3Qgb2YgZXh0cmEgcmVnaXN0ZXJzIHRvIGJlDQo+IGFkZGVkIHRvIHRoZSBHdUMgQURT
JyBzYXZlLXJlc3RvcmUgbGlzdCBzaW5jZSBhbGwgcmVnaXN0ZXJzIG9uIHRoZSBSVFAgdGFibGUg
YXJlDQo+IGFkZGVkIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjbGlzdC5jICB8ICA1IC0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jICAgfCAgMSAtDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMg
fCAxNiArKysrKysrKysrLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmMgICAg
ICAgfCAgOCArKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3J0cC5oICAgICAgIHwg
MTIgKysrKysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjbGlzdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gaW5kZXgg
MzM3YjliNGU4YjRhLi45ZmI5OWMwMzhlYTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjbGlzdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlz
dC5jDQo+IEBAIC00Nyw3ICs0Nyw2IEBAIHN0YXRpYyB2b2lkIF9fc3RhcnRfbHJjKHN0cnVjdCB4
ZV9od19lbmdpbmUgKmh3ZSwgc3RydWN0DQo+IHhlX2xyYyAqbHJjLA0KPiAgCXN0cnVjdCB4ZV9t
bWlvICptbWlvID0gJmd0LT5tbWlvOw0KPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9f
eGUoZ3QpOw0KPiAgCXU2NCBscmNfZGVzYzsNCj4gLQl1MzIgcmluZ19tb2RlID0NCj4gUkVHX01B
U0tFRF9GSUVMRF9FTkFCTEUoR0ZYX0RJU0FCTEVfTEVHQUNZX01PREUpOw0KPiANCj4gIAlscmNf
ZGVzYyA9IHhlX2xyY19kZXNjcmlwdG9yKGxyYyk7DQo+IA0KPiBAQCAtNzgsMTAgKzc3LDYgQEAg
c3RhdGljIHZvaWQgX19zdGFydF9scmMoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlLA0KPiBzdHJ1
Y3QgeGVfbHJjICpscmMsDQo+ICAJCQl4ZV9ib19nZ3R0X2FkZHIoaHdlLT5od3NwKSk7DQo+ICAJ
eGVfbW1pb19yZWFkMzIobW1pbywgUklOR19IV1NfUEdBKGh3ZS0+bW1pb19iYXNlKSk7DQo+IA0K
PiAtCWlmICh4ZV9kZXZpY2VfaGFzX21zaXgoZ3RfdG9feGUoaHdlLT5ndCkpKQ0KPiAtCQlyaW5n
X21vZGUgfD0NCj4gUkVHX01BU0tFRF9GSUVMRF9FTkFCTEUoR0ZYX01TSVhfSU5URVJSVVBUX0VO
QUJMRSk7DQo+IC0JeGVfbW1pb193cml0ZTMyKG1taW8sIEdGWF9NT0RFKGh3ZS0+bW1pb19iYXNl
KSwNCj4gcmluZ19tb2RlKTsNCj4gLQ0KPiAgCXhlX21taW9fd3JpdGUzMihtbWlvLCBSSU5HX0VY
RUNMSVNUX1NRX0NPTlRFTlRTX0xPKGh3ZS0NCj4gPm1taW9fYmFzZSksDQo+ICAJCQlsb3dlcl8z
Ml9iaXRzKGxyY19kZXNjKSk7DQo+ICAJeGVfbW1pb193cml0ZTMyKG1taW8sIFJJTkdfRVhFQ0xJ
U1RfU1FfQ09OVEVOVFNfSEkoaHdlLQ0KPiA+bW1pb19iYXNlKSwNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jIGluZGV4IGI0MDNlZTBiNWU3NC4uY2U2NTFkYTZmMzE4DQo+IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gQEAgLTc0NSw3ICs3NDUsNiBAQCBzdGF0aWMgdW5zaWdu
ZWQgaW50IGd1Y19tbWlvX3JlZ3NldF93cml0ZShzdHJ1Y3QNCj4geGVfZ3VjX2FkcyAqYWRzLA0K
PiAgCQlzdHJ1Y3QgeGVfcmVnIHJlZzsNCj4gIAkJYm9vbCBza2lwOw0KPiAgCX0gKmUsIGV4dHJh
X3JlZ3NbXSA9IHsNCj4gLQkJeyAucmVnID0gR0ZYX01PREUoaHdlLT5tbWlvX2Jhc2UpLAkJCX0s
DQo+ICAJCXsgLnJlZyA9IFJJTkdfSFdTX1BHQShod2UtPm1taW9fYmFzZSksDQo+IAl9LA0KPiAg
CQl7IC5yZWcgPSBSSU5HX0lNUihod2UtPm1taW9fYmFzZSksCQkJfSwNCj4gIAkJeyAucmVnID0g
Q0NTX01PREUsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5kZXggZDI4ZjUw
YTY0ZDg4Li44ZDU0Zjk0M2Y1MDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMN
Cj4gQEAgLTMyNSwxNCArMzI1LDggQEAgdTMyIHhlX2h3X2VuZ2luZV9tbWlvX3JlYWQzMihzdHJ1
Y3QNCj4geGVfaHdfZW5naW5lICpod2UsIHN0cnVjdCB4ZV9yZWcgcmVnKQ0KPiANCj4gIHZvaWQg
eGVfaHdfZW5naW5lX2VuYWJsZV9yaW5nKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkgIHsNCj4g
LQl1MzIgcmluZ19tb2RlID0NCj4gUkVHX01BU0tFRF9GSUVMRF9FTkFCTEUoR0ZYX0RJU0FCTEVf
TEVHQUNZX01PREUpOw0KPiAtDQo+ICAJeGVfaHdfZW5naW5lX21taW9fd3JpdGUzMihod2UsIFJJ
TkdfSFdTX1BHQSgwKSwNCj4gIAkJCQkgIHhlX2JvX2dndHRfYWRkcihod2UtPmh3c3ApKTsNCj4g
LQ0KPiAtCWlmICh4ZV9kZXZpY2VfaGFzX21zaXgoZ3RfdG9feGUoaHdlLT5ndCkpKQ0KPiAtCQly
aW5nX21vZGUgfD0NCj4gUkVHX01BU0tFRF9GSUVMRF9FTkFCTEUoR0ZYX01TSVhfSU5URVJSVVBU
X0VOQUJMRSk7DQo+IC0JeGVfaHdfZW5naW5lX21taW9fd3JpdGUzMihod2UsIEdGWF9NT0RFKDAp
LCByaW5nX21vZGUpOw0KPiAgCXhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX01J
X01PREUoMCksDQo+ICAJCQkJICBSRUdfTUFTS0VEX0ZJRUxEX0RJU0FCTEUoU1RPUF9SSU5HKSk7
DQo+ICAJeGVfaHdfZW5naW5lX21taW9fcmVhZDMyKGh3ZSwgUklOR19NSV9NT0RFKDApKTsgQEAg
LTQ0MSw2DQo+ICs0MzUsMTEgQEAgaHdfZW5naW5lX3NldHVwX2RlZmF1bHRfc3RhdGUoc3RydWN0
IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiAgCQkgIFhFX1JUUF9BQ1RJT05TKFNFVChSSU5HX0hXU1RB
TSgwKSwgfjB4MCwNCj4gIAkJCQkgICAgIFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkp
KQ0KPiAgCQl9LA0KPiArCQl7IFhFX1JUUF9OQU1FKCJEaXNhYmxlIGVuZ2luZSAnbGVnYWN5JyBt
b2RlIiksDQo+ICsJCSAgWEVfUlRQX1JVTEVTKEZVTkMoeGVfcnRwX21hdGNoX2Fsd2F5cykpLA0K
PiArCQkgIFhFX1JUUF9BQ1RJT05TKFNFVChHRlhfTU9ERSgwKSwNCj4gR0ZYX0RJU0FCTEVfTEVH
QUNZX01PREUsDQo+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkN
Cj4gKwkJfSwNCj4gIAkJLyoNCj4gIAkJICogVG8gYWxsb3cgdGhlIEdTQyBlbmdpbmUgdG8gZ28g
aWRsZSBvbiBNVEwgd2UgbmVlZCB0byBlbmFibGUNCj4gIAkJICogaWRsZSBtZXNzYWdpbmcgYW5k
IHNldCB0aGUgaHlzdGVyZXNpcyB2YWx1ZSAod2UgdXNlIDB4QT01dXMNCj4gQEAgLTQ3Myw2ICs0
NzIsMTEgQEAgaHdfZW5naW5lX3NldHVwX2RlZmF1bHRfc3RhdGUoc3RydWN0DQo+IHhlX2h3X2Vu
Z2luZSAqaHdlKQ0KPiAgCQkgIFhFX1JUUF9BQ1RJT05TKEZJRUxEX1NFVChSQ1VfTU9ERSwNCj4g
UkNVX01PREVfRklYRURfU0xJQ0VfQ0NTX01PREUsDQo+IA0KPiBSQ1VfTU9ERV9GSVhFRF9TTElD
RV9DQ1NfTU9ERSkpDQo+ICAJCX0sDQo+ICsJCXsgWEVfUlRQX05BTUUoIkVuYWJsZSBNU0ktWCBp
bnRlcnJ1cHQgc3VwcG9ydCIpLA0KPiArCQkgIFhFX1JUUF9SVUxFUyhGVU5DKHhlX3J0cF9tYXRj
aF9hbHdheXMpKSwNCg0KVGhlIHJ1bGUgc2hvdWxkIGJlIHhlX3J0cF9tYXRjaF9oYXNfbXNpeD8N
Cg0KU2h1aWNoZW5nDQoNCj4gKwkJICBYRV9SVFBfQUNUSU9OUyhTRVQoR0ZYX01PREUoMCksDQo+
IEdGWF9NU0lYX0lOVEVSUlVQVF9FTkFCTEUsDQo+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZM
QUcoRU5HSU5FX0JBU0UpKSkNCj4gKwkJfSwNCj4gIAl9Ow0KPiANCj4gIAl4ZV9ydHBfcHJvY2Vz
c190b19zcigmY3R4LCBlbmdpbmVfZW50cmllcywNCj4gQVJSQVlfU0laRShlbmdpbmVfZW50cmll
cyksIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcnRwLmMgaW5kZXggNzI4OTMzYTFjMzRmLi4xYTRkY2JiYmMxNzYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ydHAuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcnRwLmMNCj4gQEAgLTEwLDYgKzEwLDcgQEANCj4gICNpbmNsdWRlIDx1
YXBpL2RybS94ZV9kcm0uaD4NCj4gDQo+ICAjaW5jbHVkZSAieGVfY29uZmlnZnMuaCINCj4gKyNp
bmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gICNpbmNsdWRlICJ4ZV9ndC5oIg0KPiAgI2luY2x1ZGUg
InhlX2d0X3RvcG9sb2d5LmgiDQo+ICAjaW5jbHVkZSAieGVfcmVnX3NyLmgiDQo+IEBAIC00MDQs
MyArNDA1LDEwIEBAIGJvb2wgeGVfcnRwX21hdGNoX2hhc19mbGF0X2Njcyhjb25zdCBzdHJ1Y3QN
Cj4geGVfZGV2aWNlICp4ZSwgIHsNCj4gIAlyZXR1cm4geGUtPmluZm8uaGFzX2ZsYXRfY2NzOw0K
PiAgfQ0KPiArDQo+ICtib29sIHhlX3J0cF9tYXRjaF9oYXNfbXNpeChjb25zdCBzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwNCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ICsJCQkgICBj
b25zdCBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ICt7DQo+ICsJcmV0dXJuIHhlX2Rldmlj
ZV9oYXNfbXNpeCh4ZSk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcnRwLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmggaW5kZXgNCj4gZDA1OGE2Mjlj
ZDNlLi41NjIwODJiMThkN2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
dHAuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmgNCj4gQEAgLTUzNiw0ICs1
MzYsMTYgQEAgYm9vbCB4ZV9ydHBfbWF0Y2hfaGFzX2ZsYXRfY2NzKGNvbnN0IHN0cnVjdA0KPiB4
ZV9kZXZpY2UgKnhlLA0KPiAgCQkJICAgICAgIGNvbnN0IHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ICAJ
CQkgICAgICAgY29uc3Qgc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gDQo+ICsvKioNCj4g
KyAqIHhlX3J0cF9tYXRjaF9oYXNfbXNpeCAtIE1hdGNoIHdoZW4gcGxhdGZvcm0gaGFzIE1TSS1Y
DQo+ICsgKiBAeGU6IERldmljZSBzdHJ1Y3R1cmUNCj4gKyAqIEBndDogR1Qgc3RydWN0dXJlDQo+
ICsgKiBAaHdlOiBFbmdpbmUgaW5zdGFuY2UNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIGlm
IHBsYXRmb3JtIGhhcyBNU0ktWCBpbnRlcnJ1cHQgc3VwcG9ydCAgKi8gYm9vbA0KPiAreGVfcnRw
X21hdGNoX2hhc19tc2l4KGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiArCQkJICAgY29u
c3Qgc3RydWN0IHhlX2d0ICpndCwNCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCB4ZV9od19lbmdpbmUg
Kmh3ZSk7DQo+ICsNCj4gICNlbmRpZg0KPiANCj4gLS0NCj4gMi41My4wDQoNCg==
