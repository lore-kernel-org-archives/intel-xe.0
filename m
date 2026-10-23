Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03063606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6toj4lh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E8112AA6;
	Fri, 23 Oct 2026 11:21:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88461112AA6;
 Fri, 23 Oct 2026 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792754510; x=1824290510;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Cg4uDQSPKEm4CwAjZF7T5qhfSapzhi3icHSUN8sbv6Y=;
 b=K6toj4lho8q4PYLAahW4mFkdYzt+xBPssK9TP3NFwBVW92t8DRF7uh/J
 R1wwaJzopCYE+aUJLr6ycHYpQZ+QmHE7k8bp8z5Lo8ASznQcTFrqdDXuI
 P8Xkt4yfZyd2Dtp47v4jJW6GwsiCH1U0RY6wR3XewZJMDQNbLjIiQWY1E
 tFxwZTAllobipLlVFgLD5a091D8HV6vTuPmN2SqxA9TF0h7P1wSL8I1qa
 5S0jvLR60rQxBA72El+IWmUprGFfoGQMtqXH01FaMJO4uPMEjk8L4zCgk
 PbHWC/v+itCyS+kPZaF+RrokNHP+pD5TEn/zCPGGuD14d14GxYPGLVhIo A==;
X-CSE-ConnectionGUID: vPJVz/8nTVaDT/rTgLWb3g==
X-CSE-MsgGUID: zYMtwFswRK6oT5wfFXHcvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1398494"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1398494"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 04:21:50 -0700
X-CSE-ConnectionGUID: 8TNrWRD7RFi3IDBWYNoXaA==
X-CSE-MsgGUID: I9mYwn0bQkuMt7jieJc1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3970509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 04:21:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 04:21:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 04:21:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 04:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE4AwQnu2i+L2Kgy5W8q3W/C4yqH0LNlBTeATISVyuACFIz13BbseAU348q1gc6ljfs8LCmoLubTRq09e11QjLOYucMeFtD0vA44/XMEM22fsOeGGKlIhJyI/J070lmQL+oo+DVwqUWuDz4i8+2GwjNazQEZKN6YxJ0EdeXT9JGzeaYy1n6/E5QWyvj0LhBuu0gY/DZvSWKlpFxXRet8GJpv43argNZbJLZaa1HiG7HPPr3ABwcK2LcojAcOTU+J6uqc9PLCLdoCDuDcA9knPfGHnQJEc8CpXM+B2U2kwRgmC0EgwuqxQk++CWfhn4NHzaCdVaLlb3h8XH438jZv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cg4uDQSPKEm4CwAjZF7T5qhfSapzhi3icHSUN8sbv6Y=;
 b=YwFoU5OPvwEgo4+5s+tRZXMuW7OqZ2tRC7RIrRLoWKqKHLuOFX0MZ5VmhQ8gdLrjBFBZ63iW1Hria93SIuL4R+XFuSYPvphksWqYp5/6h6u6e2DXLrD+aLdetg7ZE5d1QTkvOhMS8OnrE14FJ39DeWncDvT9Lo5IO6GD5hBKdm3iN0HQ/+/VeCQw2nRnyYo9gW8OibuzNPDFWgjYhluDDRGtky1VNTmMUnfG46mpCk4Za+torT2Yu6kdL7bicnIBTSjX/bKeHZ31mxRrgwTbaqVNW7Tf1ULp5yQV7WhbDndlRTpEY28h1sftANQcfzmyazc0u+6pcRJ+Uhqw5YXMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Fri, 23 Oct
 2026 11:21:40 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 11:21:40 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/9] drm/i915/psr: Exclude the joiner secondary from
 active_non_psr_pipes
Thread-Topic: [PATCH v3 2/9] drm/i915/psr: Exclude the joiner secondary from
 active_non_psr_pipes
Thread-Index: AQHdYtVw9q7ktN+MrUaX7aRn1zh7zLcK7zCA
Date: Fri, 23 Oct 2026 11:21:39 +0000
Message-ID: <30de843c04d77484ca3abbfc914854c3619cdd7d.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-3-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-3-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA0PR11MB7353:EE_
x-ms-office365-filtering-correlation-id: 2241aa3f-dc77-4d4f-8228-08df30f7cf20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|10067099003|261021121427099003|22082099003|261021123027099003|38070700021|260925021311599003|4143699003|11063799006|261009223027099003|260925022911599003|56012099006|261022105027099003|260925021911599003;
x-microsoft-antispam-message-info: Lu3hLp1Ssgre0yLgP7ZpjPOfZGOZAKNvMetfl2SEhlk9bx+7SIVqVyUyQSnXSNhzGg8jav2ZwMQkoPIWF9ApmHG823lcxdxcZzdOQz+YI9XAPzW8RqiAGkb+eoV1BmOD2C9CxaiP3XiyU5fKRJ2hw/zheFgRT+L3Zuu2g63Wx3DAxOMk704+eJCaaRsGw3Moqwn5LiK3uuESRmHJBqp8KzUaGKyx9WWEs8fXHeECon7fLiTYeI6N/iDKTZVGhPSwoSekkmHx46frvWF1X+QRIYLLPcbjVelafa+vTcZDz2l4jWgmVdAIodg79aamlphlfWcmZqphXncDfQ3AcaOyL7eeR4wUVyr/O6FfW6XNVRpZyf1MispfYISBZ0NPMM5sQIIuJ2q7/Md1t04wIeTWdsnnMt35aZ7Xp9k/n90N5MX1sJU9iNLwQjVjL3+ssdQDI9W4UmM7ipTwTfToH+YPZjtstT3cit0G/xIY884IfCLcJaiFhZolHGZ3yI09h2opCy0WW7ANyIMC4suECh9SDtR/EmNSFyrfr/fY7mYG9LKyd8LWqabS7fkaWTK5RLhe+KLjWabn5GZ7HZPayFVOUU1d+j1UDdb7rxM03J1RsH/BfreIcVtaftjpd6oRcg7qCHJ5kfU2ntB9YDCFprN694G2HaPq+IdRiYPe7rytZWC6n0pW0Snef1DeUxa81uJJqJCm2Jdyy9av+sBmePMKSGKh5XUuyQKx/VQG6DzYaCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(10067099003)(261021121427099003)(22082099003)(261021123027099003)(38070700021)(260925021311599003)(4143699003)(11063799006)(261009223027099003)(260925022911599003)(56012099006)(261022105027099003)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTBGZ0VsUVQ1ZWNsVHo0R2NHSkVLYnZaN1dLWWtUU0lJdnRjV0xralpIYVRV?=
 =?utf-8?B?Mm1RMFhZbFdnTVBDT05maWpTTXB0aWx0SjA4N2RGZk1nSWVvQlhYOFpoYXcv?=
 =?utf-8?B?dkUxU0RrK25NZXV3M2RuUm5iSzEwQ0dMWjJ4bm1qSmtKaUgrdkpMTVJQaHlq?=
 =?utf-8?B?cG8xUndCWG1UL2thQ2Y4R0w5TzBXNWFFYUIzWkxtdlJQNUt2TDBpNnNSQnhS?=
 =?utf-8?B?djFQbTNTYWY0M2hlZ05mVk1wbEpwYnBtMlNPckRIL1FUcFkwbjBUUUdnWk9P?=
 =?utf-8?B?RHVBcUNqMVRPZWFScndnT2doT3FNd216cWR0YUdDWU5wUUdMMnUrQUhnS0hi?=
 =?utf-8?B?Q3lPU284WlRpRHZvdFpnUU5sWXl6bXNIOVBwbUlVTUZTRkUxUzIwSnduQXFB?=
 =?utf-8?B?RlJiMEx0S25pZFNPYk8zVnM3S1Z0d0dxOVpnTUFYYkcySnIzSVRsTC9LTUU5?=
 =?utf-8?B?ZmowVDB2MUxsSE5lRFRsaDlpalVMd3h6U2k3eUszTDJzYkFLTlpRYWJtekpE?=
 =?utf-8?B?bTc0eEtDd1d5OWNkS0ZCZTZvTGF5WDZEc1I4RnZTQk5wdDRvdERmSUM3aG02?=
 =?utf-8?B?NnB5YUtPa0pEYmZ1SHRvZlovSytseW1LY1VmSVJkSmNFekowUE54cDhvYmtB?=
 =?utf-8?B?M05vVy9pVllZUWpMWTFTSXJLZFYxTHZhOU5LYXU1eE1DTVNJM3k4VzFvTEdJ?=
 =?utf-8?B?ME1mNGNwcDJGMlA2Vk5VYWdxb2tvb0J2MEVPL3pDeHN2bFFWbGpHdEZvSjgw?=
 =?utf-8?B?VXZnWlNENDhhVlAzMENGVXZ6d3VMMUUrSitNem1NRkFyYXdva2xTdm90VkRn?=
 =?utf-8?B?bjFya1dwOTZ6c0g2Z3JwU2plMTBjenR3WFdLTHBuUDVqMER2UlpOMXZwNHY1?=
 =?utf-8?B?MHJ5M01HeS9LdlhQSHBwTEs2YjlPZUlXeWxMb2ZVVDVUbERSVXBaUWVjbDlG?=
 =?utf-8?B?RVVnY2lFcHljNkt5SDNPdHh4bXZYR0FGaUlWaHQ4cDdud05ZOSszQVVieFdS?=
 =?utf-8?B?MkhuUlg3dnArdklzVlQ3RzhtUkFyZDczWm9vZFRmN2JaQ2JaOThnRXdGejJ1?=
 =?utf-8?B?SkE4NTZTVW5Eek9PbGZjRG8xTUpYdW1KeGNySHhlY0RCK21KU0ZkNldvajl4?=
 =?utf-8?B?SHd1ajBMTXF0TnpGN0ozdFlpbnJlN0RSVXVKNklJSU94NUlBZS9PVlh3SGxr?=
 =?utf-8?B?ZVN4SWJPb1lZRFhSd1VMZ2dmN3pPMzZPTVR2VDMvMDhsTEo2WkVodmkveFBP?=
 =?utf-8?B?RXRRME11MEJHamhpNmxydjZWaG94VS85TTQ1a2w0VCtyUHppdElyQzZxSE5I?=
 =?utf-8?B?NTdXdXB4dm1KdU1Wc2JjZ2RJN1dXRXNUUDZrUEhhcDhPK2Q4Qk1zbFhJUVRC?=
 =?utf-8?B?OE1wUUJSaHIwV3JXNzJybkRxdFZFNnNzUDJQY0JPR29SN25IRXpwUUFJa21O?=
 =?utf-8?B?aHd5Y29IaGRzVFUrV0w5QlZHV0VsSlloVWJZcng3ODdPNkgyN0hSZUFWOVN5?=
 =?utf-8?B?a05ObkgyZTE3MmVPMFpuSkY1dTFNMHhvSjFQWXNHblBHVk8vb1dsbVdKYU9v?=
 =?utf-8?B?UlFmSTNZbWcwN3kxYlg3SGJFMEtOQnM3NERKNkxmNTZ3aVdiM3NBVWc0Nzc4?=
 =?utf-8?B?c0xwUDhaWEtRQTJFQnpaR3J2eUlmdUtNTFBVZEZtaUhWQ055K3BWaEpvbHkr?=
 =?utf-8?B?TVc1bnE5aTFaNzd0bDFlTDN5TDF5YWhZNVQrTCtha0tBNXFwaFBQMXRZd25n?=
 =?utf-8?B?WkYrWE1jaW9SYlNqaXg3bkJWRGFUSGJFcjc2aldZb2FVU2pIa2ZiYXpjVWI1?=
 =?utf-8?B?ajFLR05qbzVXRlZOK3RqajB6cmVEaUZhQmZicDZmd2FGRXJ5UHZOT1B4ZGRy?=
 =?utf-8?B?MXZZbDlOUmpLZk9LYU9VOEdJUkxaNGhINlJqUkVzNC9TYnhPeGtxVS9oQmNm?=
 =?utf-8?B?ZnBKOFpYUE9Md3lMSloxNXdNaFdSNHJ5VHZaV3E0cytqamZYNFF6bitBNmpR?=
 =?utf-8?B?bnVYb2szcGFJemdidGFteEcwSzN4elRaL1VyU1BVVkwvUXppaDlLVHRNNU9W?=
 =?utf-8?B?Szd0MzZpS3dMK3djdDlRL3dFMnBPa1BkK1VXWG1PVjV6ZlRsV05WL2xZeDhv?=
 =?utf-8?B?RUFTZTVXNGZ3NkpSbDdlc1lpbVF2R2ZUMzRNeGU5alZzNEJWWEhtQ2sxM2ZJ?=
 =?utf-8?B?NTBuc2xqdm5ZV3RrQkpkd3l5VzA1KzB5T2xXdU9GSnF2Q3B6WHZySXcva1Nk?=
 =?utf-8?B?VXROdjNpcDA3S3JsRGZFOHRESzkrRllYTmcvRndycDJVVEpDUWpDb0poeThp?=
 =?utf-8?B?c25wTGNlcFlEV1RZRG1VOGFhRzZDbjJoQlNmT29GRW44a3FyZm5PaTd1MTRq?=
 =?utf-8?Q?BZWoVLlFGJi1phkg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7631029224393459BFD2229C9F7B695@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ED01L4pMCAGncSC3f7XAeJnQZrizxlX8kv8HMD3SQnhtvTCACXm5kuR6bGR3uHkkLNzJnHI4Tmqt+TPO9e3DaDzFxA+C+lT7qDUoVYFX+/oG/oOr6D3UzFgCtzjiBiMbUEnmwF1spJr0uV/7NgzHnTqXVaTWvEO4WHTNleX8+7LGHZgHUTEZmweiCpa7JMUzQlOfCKyne+rXl3uJFpae/vV15G55ZoJobQ0DkzvAIZas2UhPKsOen6+70D1u6iOxQniH9QxPdRp03KN2J8ZuiC9h3z7/UqJ+5uw6hx8+nNAyVDuJj/l0zirQSHm6+U2E0FIGALhOyd8bTpplDAsT+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2241aa3f-dc77-4d4f-8228-08df30f7cf20
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:21:39.9772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hODe5vMly2GNsvcbBaC85ymYxN2G1Ywpje0gVib9oC1SsSAoT98yCwrk8/FKIKSd/BIlkR1v9Vvez8UtVLbyO8AZilDu4F94TsAFEXRwPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
YWN0aXZlX25vbl9wc3JfcGlwZXMgaG9sZHMgdGhlIHBpcGVzIHRoYXQgYXJlIGFjdGl2ZSBidXQg
bm90IGRyaXZpbmcNCj4gUFNSLiBNYXNraW5nIG91dCBvbmx5IHRoZSBwcmltYXJ5IGxlYXZlcyB0
aGUgam9pbmVyIHNlY29uZGFyeSBjb3VudGVkDQo+IGFzIGEgbm9uLVBTUiBwaXBlLCBldmVuIHRo
b3VnaCBpdCBiZWxvbmdzIHRvIHRoZSBzYW1lIFBTUiBpbnN0YW5jZSwNCj4gd2hpY2ggYmxvY2tz
IERDNS9EQzYgYW5kIGtlZXBzIFdhXzE2MDI1NTk2NjQ3IGFwcGxpZWQuDQo+IA0KPiBObyBmdW5j
dGlvbmFsIGNoYW5nZSwgam9pbmVyIGlzIHN0aWxsIHJlamVjdGVkIGluIGNvbXB1dGVfY29uZmln
KCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9wc3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4g
aW5kZXggMjdjY2NjZGM3MjMxNS4uZmI5YjUwMTNhOTY0OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0xODYyLDcgKzE4NjIsNyBAQCB2b2lk
IGludGVsX3Bzcl9zZXRfbm9uX3Bzcl9waXBlcyhzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2Rw
LA0KPiDCoAlhY3RpdmVfcGlwZXMgPSBpbnRlbF9jYWxjX2FjdGl2ZV9waXBlcyhzdGF0ZSwgYWN0
aXZlX3BpcGVzKTsNCj4gwqANCj4gwqAJY3J0Y19zdGF0ZS0+YWN0aXZlX25vbl9wc3JfcGlwZXMg
PSBhY3RpdmVfcGlwZXMgJg0KPiAtCQl+QklUKHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+dWFw
aS5jcnRjKS0+cGlwZSk7DQo+ICsJCX5pbnRlbF9jcnRjX2pvaW5lZF9waXBlX21hc2soY3J0Y19z
dGF0ZSk7DQo+IMKgfQ0KPiDCoA0KPiDCoHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQoNCg==
