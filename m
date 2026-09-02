Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9132FC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB710F20F;
	Wed,  2 Sep 2026 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3QUrxZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBCE10E5D5;
 Wed,  2 Sep 2026 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788358130; x=1819894130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w8iPHG/WWhwDg0O6YyJv7ZeIbMcG4B36Em4f11kX5GM=;
 b=M3QUrxZnjdwXforblKD2HYLApfZ6ejfMd0DaunAva0TMxbbKmIsbHDrY
 Ax5fKSE47YddgTTQ13vuhby8vgzr2Abi+zg3QIOJ33zsfqJl37QDB+49i
 978elrU8ICohgK+KfnyGw003OQZoQaMCcT5oJdiAEqIzVasJNZkquFn+z
 R4U4gk52Lj+mqcc5EkNRmzroXFYwiyNe9ewYuPiWTrjIO6D/12/IIqW5C
 zRd+6nj3Yt0tgtHEMO7PHd3kaK0CM+flc+rx5a6NK6iEDIUB5ZnUtK2cf
 SONVwFEY8zS26+gacGSGpX7xd+1dDWymjTeStxsJevBrHHOhnbXm4q/XY Q==;
X-CSE-ConnectionGUID: 0bqkMo0nQbC6vTsCxV3lWw==
X-CSE-MsgGUID: FV2urcfGSlaaW6FweYKLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89028384"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="89028384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:08:49 -0700
X-CSE-ConnectionGUID: hPmZ74XfTBCQPiLC43GOuQ==
X-CSE-MsgGUID: 5c/nLBDtTROSCFFd0bdTVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="274693457"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:08:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:08:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 07:08:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUKIK+OsG2catkgDQOxwO2+iIQS8wlYl0zX119yRYghyO2f8G9JRXERcSGp+lBOI2zPDIF7QFyYCY/njzYOz6SdVVerdJcxQldMGCCoFXZ6eddXH6L82PT0NWB6gi6kZMPaIRy6TexlK5p1pO0nLPMJy9nslS/hsEGiAMvl6LcMPnfGTyuWHIpQfK8BE7D5j8+vran+ziAmp7TD5zpHfl3bL+s2u+NFkuQL64cSMy4RujdfH47dJZDWzg20CGTK43YAD5mvSVSgg2HGPHg+nj2Viw0MuDZUqv9XcbHnFGXWtnXpqeoUgp/D8Dp7hXT2QoT9gZgmxTEYGUTQpiFEcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8iPHG/WWhwDg0O6YyJv7ZeIbMcG4B36Em4f11kX5GM=;
 b=VJRyjoBtOLcIxZiMiujSBt10lDoEzR3wBicUl/Swidw3+umvMgtRoEL40130C4rHgPVlCCl1eeNBtEXRarYcbWYaF4KfCU7IuZwbdVl6Dj09I66EO98n4v1PGkdk8W7zgiuPj2fhd1lGaFk5jR85fy71GWqhug6FuZsgpCNSwazAn6KFtTgJIrFMqiKSRi+GpCmM2TY7Qy3c8TTl0hoD9ytvu5mZpqTTgHXvlslKpuLpqgibMG5P6HtIcvmnIwJPDZCgaTXcNQyzeTZKaBujyyQs8bgORQVl8MXQfkl5MyXiX/FnIQ2+uqsiABm8ra8ep0a11c6e7FvqgSm7Cm+jKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CY8PR11MB7193.namprd11.prod.outlook.com
 (2603:10b6:930:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:08:39 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:08:39 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/i915/display: Reset use_flipq when duplicating
 crtc state
Thread-Topic: [PATCH v2 2/2] drm/i915/display: Reset use_flipq when
 duplicating crtc state
Thread-Index: AQHdOsmCZSGEss6WUkyUSA9nLLeDTLa7Sa2AgAAJxcA=
Date: Wed, 2 Sep 2026 14:08:39 +0000
Message-ID: <DS4PPF69154114F87A9943A2371B82BAF51EFB72@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-3-mika.kahola@intel.com> <apglo7fGdY24TjSs@intel.com>
In-Reply-To: <apglo7fGdY24TjSs@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CY8PR11MB7193:EE_
x-ms-office365-filtering-correlation-id: 8247f10a-f62f-4e66-0c48-08df08fbb019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|10070799003|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: XISHHIoEreVOsjOM+X9DA4/QBBCwJvLQ0O1piTUCF3s+jnlQUo+uCGz4mm38zRYx63Q0WSffckHOZbrkl85yGGemVGfHbEfPlswT/mwK8tvG+kBLLmnBHtXKALyvwSHvvKhRv7qH67M71HAu9nJ9wlw1EB+fWMS6KLWylTPLwm/0t2Ut7BVYdmddBXgwIWuOTqMJXOzg1hEAf0HCLpVU0dlLfYsVu9CZbDsHtabytobnw66/yIGcw4aDCC+lppN0gL2WnYdIe8e/wBzR4sAjELtr1TzJll20rN5uOJ1l7yWVXCgjfhAombkV0H5whR4GY5P5XuLYXN1b2OpNC2rbwcrNVxn79mu71oD85P2cwHmB2wlmc3NgEL2i4wFIe7uvFPaWfqOeZCu+qvkWtxkxPnEECyDurRnOJkRFRPLslMlMHwE5PvdFtbCj41/CmhPIpXLVGxCGTmFKW35kgK1wc1Y5SLUR+OYyOkfYXhBpjalP4Q0EVgU3Gx8jvwWgO1JyicgIiNgRraclpVgkTYP3Kh7Qc4a3/eauJOtPoTJ3UgYVDzj/ttYZiDn25UYEBJoT+zb5G9VAkSTNusaux0dTFcUpayE/uXDGvVHmQKjPDpOEtpaFmUtVGfiEC21D3e8cJ6GgzrHurqzMk/5rdoJcRSBjJr8PQQG6ryKRSsJb2dwyxgKRvtxNi3IIGPqHCnPpy/jskvnKIW5FdidobMDUNFdkUu1W1H6ZeCxy07uv8dc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG5XeVF4TTRTUWk2TlFielJCaitYbnh6NTEyYkVDb0M2ZzlaVDI0RHNJRE9q?=
 =?utf-8?B?Tzh6Tm1Sc0ZKdnlhYnpWa0xFOVVYY21sdjE2MzArUnBRZnQ2MmExd2ZBMGRp?=
 =?utf-8?B?cnFodVNUZ3lwWCtrWDU4RWRSRXhIdHc2NEpTd3dkaStDVFF5R0tTbU1Rcmsw?=
 =?utf-8?B?QnFwMEg0dmNTL0lSWWVQSzVmYnk4THVTaXllVjlnTW00NGVaUTR4aFZIWmdD?=
 =?utf-8?B?YzBUTUhva0gzWE1HNkZOdVU5aFV2TjdnZkdsajZzWTVYTy9Pa2lVT3J5MXZm?=
 =?utf-8?B?ZCsyaGpPVktxNzFGL0pLQzR3SCsrNFNZbWNZV3FMTzVRY0VnTWl0RUx3N1h2?=
 =?utf-8?B?QVZTMWF2T1FJZC9hMzg3UzhLclh3M3BpT1hYWWxYUlE3cmUzdkdpN2YveHBw?=
 =?utf-8?B?cmV6Y1dtWXFTcWdOQjNTeXQ3UVNPNEhjZ1V3K1NWWFBxd0lRRUZpdittWU42?=
 =?utf-8?B?VXQrMlc1NXJaT3dvUHA5blRxOS9YQVVlUVpBR3I2ejR2QW1nV3V2emdtK05n?=
 =?utf-8?B?eWEyYlA3Q251Wjc0SlFOL1IzMlNKMDNsZitUN0twMDlsQUFoR3VDNUJxenlm?=
 =?utf-8?B?YkhkNGdDMVJ3eW40K2RJRmFlWXRiWEJBVFkwK1FLU2tmTUZiZWFReFYrc2NM?=
 =?utf-8?B?U01DczVWNzhMQ3Bic01HWUwzRkdTWEpDNENNMm4xOU93bytobVpZSWxZWkhl?=
 =?utf-8?B?QUgvZXEwNC9LWlRoL3NNb0Z2UDdpQWFQRWVrOUhNYmMyU050N0FPN3U1YTAw?=
 =?utf-8?B?VzhZY1RQNCtzQ0Y1bTU2TXBROVlzb094VzhFbTZvMEdXbTNNT2xhcWVQL3U4?=
 =?utf-8?B?YnpnaDlZOUFUK05pcVhwRGJ3dlM4RXVlVkcxUlNUL1NoSUxYQXpGN3lIOUQw?=
 =?utf-8?B?RzlOYmp1Y25zVUxaZ3B3dE55d2FuUEkrc3RGN0dOQ3ZjbkdPcWJSZWdxSkRi?=
 =?utf-8?B?SFVMR1dXOUdwT3hTcGhmL2lYenYyaS9NenZ3N2hlWHg1eE1XSDhSVitSQlll?=
 =?utf-8?B?MUJ4Ry8rTS9INnArMW9meExuUktJemttZlJMQW1CS3d2Q3kzdG1GQjdnY3lI?=
 =?utf-8?B?OFJiVi82aXlCMWhYb0UzZUljdGlQOVRuQU9FcUIwMiswM093aTRiWkhPdWZ1?=
 =?utf-8?B?RkxTT01ZS3U4TExDMWpLQUFvcXdxUlh0bzA5YmtlZHJUTjlYVFVGbmw4d3V4?=
 =?utf-8?B?dTJzREpSd2gxeHZaRWcwM1UrZ0JtcWdrWlo5UDFQT3FJY2tTNTFJdUZSQXlm?=
 =?utf-8?B?OW52V0hmMU9ZTm1UTVRQVzRBVUdjOGxDK1JmVUt1T2tuT0ppMmY1TVNVN1Js?=
 =?utf-8?B?dkp5bDhCT3FJWGt5SWYveFRQMThrYTFkZ0RWaUQxVVNBN1N3b1dtQUxzVVJP?=
 =?utf-8?B?K2kyN3lBaUJiVk94dFBmQnUzQVJFT3p3Tk05S0U0RTJTWjhMWHpJdTZSNklW?=
 =?utf-8?B?TlZlRldRZVhCSENoekpsNDcxTlFnVUlzcVFQcmVPellMRGNUL2RHWDNCMFg1?=
 =?utf-8?B?TGFuTGZDUXVnZ25xRFdvaHpNTUhzTmpUREJvWU9TQXJRS0QwSUVYNTMzcUJO?=
 =?utf-8?B?QkdKSy9GOUlpMkovZ0VjV0FvaEU0M1JoNEJyeWw2NCtVNzBvMVJhR3g2bGFZ?=
 =?utf-8?B?elZhRlpTa25uRys4VHZKZUVCZUM3YmtKUzlpeGpVUjVnNzlQU3lHeUVwb05P?=
 =?utf-8?B?NGZUTGJLOE5iNjNzQlMrNjJoS0tvY0RwNEE4bW9Nc3ZrMitJMzMrU1Voczd4?=
 =?utf-8?B?RlN3anBocW5PdFdrRDBNbkFqbDJ5QStyaFQyZ3dTYkp1V3h3TDR2WEtSNFBa?=
 =?utf-8?B?SWtMenAxa3UxeDcxZG5lb3p6UDN2cUg4ZWl2MXBNKzBxVy9XdGsyS1FDYnRZ?=
 =?utf-8?B?Y1BydW5nZ290OTcwNTNBVGJMYmx0Njk2bmJ2N2YvYlZlYzF4dndVSXByODJW?=
 =?utf-8?B?ZXRYd1R6Z1BIMHFKRXpKN0RXZEZnMGNwVytiU2FaY3JqY3hEVEtBV0hQQkdG?=
 =?utf-8?B?c2w0R2hjQWhLdmtJblVGRVVwMll5T1BxTkxreGg1ODZGTnEvLzkvTWlDMGla?=
 =?utf-8?B?NHBOZjFYeHpUVGozUldzRFhFK0ZuSzk5b2F1UFhSM3JRM2NMSFFyUlhRQmkx?=
 =?utf-8?B?dHkrY29oUjFZZXdORW1rdWw0bmxDL2NJbUl2aVA2UkN0ZDdsZDY2RUg5b2Vt?=
 =?utf-8?B?bHhHeE1GOE0veStpYnIzdGFRNXpscWhrUFBNcEdnWXFlRHhQZ0RlbVFZaDd4?=
 =?utf-8?B?QnlDTnNRVnY4TFJWU2JzK3E5RS91VkR4ajdVcGcwWlNqRDhQM3VZWDJMNnhr?=
 =?utf-8?B?VWhWWHhMbDY3UlROMFhDTlBuVWlCWmcvUDJvMmgyUklCRlpFU3R4Zzlyb1pP?=
 =?utf-8?Q?As+yqxMaUjCSlnQDjNNg6ypCu38m/zQ9BGX3e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: igSsdqqBGn/ALxnV1HYAXtX6hGNvm+IQR7+ShMsO8MTHsacwdWqKXkAgPwNmJtHpooqqkaVktmPkoIbHjr9b1H7Hh4R3swMNHPlr5C68YSdMo4iGmj8kxgCntSe1dI8dOQ18n5G2KBKZpGUVptQhTYGJDbcYq6iNdoG/vIWDjP57B/zM2tvryS4/RsxO/Z2jc6sDCa7MTAjwy4P71JQXytPvM9IoZs4oj+1Yln/U88p98qwbkK4BuB0zcsnr2CUL9kFA3Tb+53tApABNjbzhfg2tw6udllj7uO7TNf7lSboA4CLBUPwN62pt82v86BrXHjd+JPCCA19B2+O7mr1IVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8247f10a-f62f-4e66-0c48-08df08fbb019
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 14:08:39.3800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBmVGWbfpzp/MfpJ807bg+vFrOn1rrmbIM+fQPn4V9d9hjDrZQ0dSX5XvSrI68eRDdqvBXp1CrxeKz3n1CqBAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDIgU2VwdGVt
YmVyIDIwMjYgMTYuMzMNCj4gVG86IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBkcm0vaTkxNS9k
aXNwbGF5OiBSZXNldCB1c2VfZmxpcHEgd2hlbiBkdXBsaWNhdGluZyBjcnRjIHN0YXRlDQo+IA0K
PiBPbiBXZWQsIFNlcCAwMiwgMjAyNiBhdCAxMDo1NDo0N0FNICswMDAwLCBNaWthIEthaG9sYSB3
cm90ZToNCj4gPiBpbnRlbF9jcnRjX2R1cGxpY2F0ZV9zdGF0ZSgpIHJlc2V0cyB1c2VfZHNiIHRv
IGZhbHNlIGJ1dCBub3QNCj4gPiB1c2VfZmxpcHEsIGxldHRpbmcgYSBzdGFsZSB0cnVlIHZhbHVl
IHN1cnZpdmUgaW50byB0aGUgbmV3IHN0YXRlLg0KPiA+DQo+ID4gUmVzZXQgdXNlX2ZsaXBxIGFs
b25nc2lkZSB1c2VfZHNiLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1p
a2Eua2Fob2xhQGludGVsLmNvbT4NCj4gDQo+IEkgaGFkIHRoZSBzYW1lIHBhdGNoIGluIHNvbWUg
c2VyaWVzLCBidXQgdGhhdCBtaWdodCBuZWVkIGEgcmViYXNlIHNvDQo+IGxldCdzIGdvIHdpdGgg
eW91cnMuDQoNCk9rIGJ1dCB0aGFua3MgZm9yIHRoZSByZXZpZXchDQoNCj4gDQo+IFJldmlld2Vk
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAN
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWMu
YyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWMuYw0KPiA+IGluZGV4IDlk
MGQ0N2M3OWRkMS4uYjY2YzJkNGJhMmIzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jDQo+ID4gQEAgLTI3Niw2ICsyNzYsNyBAQCBpbnRl
bF9jcnRjX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQo+ID4gIAljcnRj
X3N0YXRlLT5kc2JfY29sb3IgPSBOVUxMOw0KPiA+ICAJY3J0Y19zdGF0ZS0+ZHNiX2NvbW1pdCA9
IE5VTEw7DQo+ID4gIAljcnRjX3N0YXRlLT51c2VfZHNiID0gZmFsc2U7DQo+ID4gKwljcnRjX3N0
YXRlLT51c2VfZmxpcHEgPSBmYWxzZTsNCj4gPg0KPiA+ICAJcmV0dXJuICZjcnRjX3N0YXRlLT51
YXBpOw0KPiA+ICB9DQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gDQo+IC0tDQo+IFZpbGxlIFN5cmrD
pGzDpA0KPiBJbnRlbA0K
