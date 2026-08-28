Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41B7C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 03:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F6210F235;
	Fri, 28 Aug 2026 03:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2Ghyihb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68A410E43D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 03:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787889335; x=1819425335;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XrlEim95CJKB22MxKLKn4PheGeJs4RAH7Gdrp4pFzKc=;
 b=U2Ghyihb/f8hPo5qfrSHX0jHIC20Y3bpkY/DnDgWF3UMMJDYqMA60dS8
 60aBAn9Z77fb3VwtGbuiJvRy4blpWCEa8Q/4tJlDGa8WTJ7I0Cg5JzJdn
 58t/Bw4PROxn94O54Vx2kwAqjkPBIeTggdHCD32vYhV2/mtjAmLIN66rj
 S27VgvcHrm+tFnPrGZ17DZs2AKrFRDh/+XmtR3oeL9jeljYeaFSxrKQkL
 FxyMXF7Th8NO1Zl34a6xZCv0FluvTDVOc8O/s3yhkW6ejgT5jy63uwI1r
 v02jD1pVR12xHXYTQy7GV1EkYlzwPmh9MGJLdbu2jlisyCwfKEAbHWT7s A==;
X-CSE-ConnectionGUID: K2BCKdT2S/yYID0oRGWUzg==
X-CSE-MsgGUID: NXxNdjyeRgeIznUb2OaOcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="98730996"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="98730996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:55:35 -0700
X-CSE-ConnectionGUID: QYJSGvFDS+yQxIOwn32Acg==
X-CSE-MsgGUID: oLUoZlpjQeiAd/WUfAShpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="273309147"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:55:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:55:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 20:55:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.31)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRB8IGFvmVBrXiRoyRWNDxx1HDzJvzuFCcoKqYAxIVcaDEx23/IWggsSNNQbhWw+J3YA2lZsqnvKryX35QH6mK5FvkcRS6tj5qbEnTuC/GTC5MTOvghQ7p7VckYUSmZFOAQ+e/rjdOKVB98kdMjGKUWnFRGd8w4JwoS+6Vf61JhcwpCHQKdJVPeEY5u6PGTv7xMd7TXghjJ6m5+zwPgbik+GFla47+j4gYnH2a7gT0UrGsZN2+SZQoLlzk79SGyfQmN9LZpbKIpEfOUhpaGyKCZQcbpQOpZV8xdQb1xAUnTs0lHuhD6fxSbElysqbTSsFitdSA0rKgdU3zXWyZNAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrlEim95CJKB22MxKLKn4PheGeJs4RAH7Gdrp4pFzKc=;
 b=H2abwEr1+WiF9yK0ywK0ZSje8aqxhyxxZc0YSU0VBh0uK29ZGqz1jyK7g0ejqOEbLFYOQL9kuxyn1VUcI3obHoy7rmQBwT5d37+jH1up9AjgLDAvLg3aK11QKXgLD6MT1VnRfSrAFyPX2nVnu0uGDlbndz8fasU+jdda2tfhkbEutAvl5UUyVoMuWjJZ9Xpr2i7mmVSM6uu014n21Eyz1KIqiTHD/pyOYoZrsp9SEW2J53o8USC0GbAJSmHf6B0gg89kcUiKqblaDYXEsW2fPT5DmU2ZoM80NbBOKkOhvp6pan6lHu2w9xYoXns8IO7G1raQ3CGebrUaDAB8tCsgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by PH3PPF6D09CA9CB.namprd11.prod.outlook.com (2603:10b6:518:1::d2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Fri, 28 Aug
 2026 03:55:30 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 03:55:30 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Thread-Topic: [PATCH v2 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Thread-Index: AQHdNX4bg+/KG9WqnEGQJZZqm00a97ay1xKA
Date: Fri, 28 Aug 2026 03:55:30 +0000
Message-ID: <f44d20610ac8d6d2660179294b0de6522590b9c4.camel@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
 <20260826171149.708378-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260826171149.708378-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|PH3PPF6D09CA9CB:EE_
x-ms-office365-filtering-correlation-id: 19c01dee-9be5-4e1f-f73f-08df04b8341e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: z6tSTTSBh7T1GmugUk1SJgQBFeM1VKt0UbogCJYM7vgK/pGR6RB/MMJYyQW8ORCHlb+KRuH8V8or58XIazzYvGuTNilwYqgWaJlAqkyQDZ1PBw6ljPSYGoM6CQ0ZmvXjoOF/L2jAmWTXFxFIjcTIQhZVDFSIBPJnABWX4Zgn/IZb5d87lbykEuWBwbJbHsJ3Q42ehhI42Hne8scFrM18BcKzHDBh/7eMqdpXes7HfgQ9DHIUYPnNrIAhyldfGM2uM0V0gh3yE65tR5laLRXl70BE9nuoIRbua4BC2nZ08Ih6LRvEkAGJNiIpek1eLu0CJMKvbdGhTZHM9FroqvZ4kKpB2uKFVnVhgJcIFnMpbHBcXHZGMuhvVqA2xdp31tYO9ivsr3TdHTHcr4XBW4uOLG5T17TpAad0zXKaEXv5QkG1vSHv8C+Ir7TJ/Nrw1Kng91fOLKVDjcp8SczScfwYROdhrIqlWC92rKQk0ehABUrWYOChEjeM2uldQMopzqWWvXif5a1/ay0JhC3Nz5dIuAtbhkXPThCM9kAsw+3BCxWD4CSf2BbNidzVchrhalNfKOKd4TgNBNE3ua3aO2GrmfuNTnB0k2UkSDjuRj0+13O22EXvk3GXR5Obf8+wUC1uWM80CajWP1F8+0HIE/jfX0EJiEQf7RXNP3sb+s1z4hPMusj9Zdj1QymgK77ji9hLD/auppFHlrcYgl8gm05K1fajxrBYpeecr9a1PrbfU8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnNmRVFjakVMT3BkdUR3V3UyVkRnbkxuc2JRN1h0cGhUMHJwVjB1bWZCU3po?=
 =?utf-8?B?aU1ObUxFNWhQSVhKWFlnM0M2aUIyK2MrZHJ0cEtJUit1b3JlUVpXQlYvOXhr?=
 =?utf-8?B?Tkc1b0Z0ZllEL0pWR1FJYmVyM1k1RklIeU5xYlFzVmgyR2pMN2lLeHNrcW9B?=
 =?utf-8?B?ZWNiUnJQNjI0bXNlZGtXVXVSem1IM3RNQjJieVNWUGF2WWtYeUNFR0VwRDZz?=
 =?utf-8?B?YUVJM3hvNzI3VnVtWkV3SzQ0R3gva0ptQk9Remt3blZXT0pMVkxObWpmZjdQ?=
 =?utf-8?B?SDlPUzF2aDk3NUZYa1NDTUM0VWFWeTcwUHdWNElEdm44YkNjYWFXT2VIYVcz?=
 =?utf-8?B?anVOWVhxZVZXTXV5a1lDL2ZoS1FieDJES3YwbVRRUTRSTVIvOWRWMzlydGpC?=
 =?utf-8?B?Q0dEc09tZ2ptRnh2NFJCZ2hPRTArdC9Fd1ljY3NNR1BvRTA5aU8rSE1MTndi?=
 =?utf-8?B?VU1HM2FzaTRwTW9sa1I4c01oSGMvdnJrWlVYWlFBOFVoR0h3aUdFTjdoYzRk?=
 =?utf-8?B?b3V3VXZoL05zR3c0YkNDcFlURGV6cFJST0lsZnloUk11bjc2TFFFTzdSZlFX?=
 =?utf-8?B?WDNVWloycUUyUHBkVFY0MWZWdHY3NXJVYWZSSW96eHk4Kzd2ZWszVXI3eHJ1?=
 =?utf-8?B?Z3NsOTVIM3JsSEVBdmF5S1ptUUJxTHBuckRTRk1sUFljczlLU2NkT3ZOR2N5?=
 =?utf-8?B?ZGRLT0RJL084WlJyUEo3SjlTYlhXb3ZJLzFYVjBjZkVQU1dxMEFTRnltUjhi?=
 =?utf-8?B?MXBPSUlwTHc2T0hUK1RBdSsvNkRxTzdWVDQrMjhXckFjNzZheXJ6KzlMaW9G?=
 =?utf-8?B?OEw5WnVYS1lkWFBRc3dkTkVMZDhHWXJhaVAzbW1GY210bWtFSWE3SjRwd2dV?=
 =?utf-8?B?eEQ2SlNjYmhQR0U0WEtza0ZHckZmclM4ZFd6MjFVbUExYkVVR0JCRlFRbzZX?=
 =?utf-8?B?ZmRYT0ZTUTkxQ2hHcU01dWhJR3dWY0lSeUJtL1NxQ1kwV2VnY3EwbDNHUi9x?=
 =?utf-8?B?bTNacVJDejBKRmFMU0gvTDJVVjlhSWp6Skp6Zi9LVDZ2cURTeDA5UGVabWFk?=
 =?utf-8?B?M2w4ZGJNTzYyQzArZGVYYktGaDFjKytQVDVwckxFUSticHlwTXM5Zk9IU0Fa?=
 =?utf-8?B?M3orV2VPYmVYMjZ3M2hheGNtcXEwWjNndEJWOEFYck84elFSeFpIc2hmRHZD?=
 =?utf-8?B?TTJFTWZxOHJneHRjcmkzWTQ5N20xV0NJSmd6VG80M1pybm9TbGV0YThyVFVu?=
 =?utf-8?B?QVV6MENMVEZMSlhGTFk5QnViYVRRdjBhVFBxQjU2elpqdmczc2s5ZUcvNWJZ?=
 =?utf-8?B?VFRMVFFjWmx5aCtoMCt0NmF0TjRhbm5WL1hLc1B5elBUUGNVcjJEN1k5ZkRJ?=
 =?utf-8?B?MnpoWHpXMXZEMmFLNC9mSjZzK3B1d2k4M3Rzam1aZnJvSGJMUmxhcENVY3Nv?=
 =?utf-8?B?ZXhXWVpoS1ZzMURMeHVmV1BPNjJYZU56YU5PQkQwb256TFJnQ2xmMmU4cjky?=
 =?utf-8?B?dzJDTGVmbzlyd1E4Uk5lTWtjTWUyNm5OQXZuQWZ5elNnZmFON1JaSnpoSU4w?=
 =?utf-8?B?aE5hcGRBMS9Fc0dPdkpLT0V5UEZRVDVsUXZaQ09EYTR2RkZxeWFrSThBUUZV?=
 =?utf-8?B?Zmx2ZlJIaU14OWN2Ly94MGkwSzBLV0ZJdm13MUJ5b3dQdEZWZzlqNkNYVW5R?=
 =?utf-8?B?bm94a0l3bFI4bkZXZWRTMUtDT2VRNWMwU1RidWV6OThQOGoxS2pGRThmejcz?=
 =?utf-8?B?bEYyQVlwT3NOTk9HWmV0cnJvQllUeGNuMzdidkpBVzRDMjVubXdIdFhuNEEy?=
 =?utf-8?B?T21EOVVxMHozM0FMQ0I4MlJKOXgzQTI5UU5tUWNUenc5akwweUNPQUtoMmVa?=
 =?utf-8?B?TU1iNmhmb2NhMEUvcUJERGlLTzVvY0RWOFRhMk82OENUNVRZalEvVHFzanVH?=
 =?utf-8?B?Y1FwVzcvd3hzbHRNbnpCV1hBZGRTNzAxdTV0akxudERycUZLNzVQZUdhQ215?=
 =?utf-8?B?QXVsS2xMeHZXYUo2a1JKVzMrQ2J2QWMvemkvSTBpandjTW9raXp4SjBsNEJL?=
 =?utf-8?B?MlYzcUtnU24xbTRsbEMzN0V3M3ppN3EzbHJYcmZHNkErMkNIYm9HL2NNaGJX?=
 =?utf-8?B?c05xK2ZLdDBPS3FMOTdoZWxpWnQ1NHIxU3hSc3dRZFN6dkVzbld5STYzMW11?=
 =?utf-8?B?ZUxvMDdiVFAxQ3NUelNnRkVBS0FUaDIycWt6RUJlUmNWNEVOTXJFOWhTMVl5?=
 =?utf-8?B?a0hwQ0FTWkpMNmZjR3RjNk1kU3ZtbkxxNDVZYTBwbEppV3ZUZEQ2OXVUV1VW?=
 =?utf-8?B?VlFHYzFOcDhQVWV4cURMMk1NYjBxd1dEU1RKZGdvR1RwdHlVajJ4bjEyRVI3?=
 =?utf-8?Q?IHTPXX0BalTTuXT5lkCraVIiOm5hBoalD6dWD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DCDA41D8AA0424AA712422367282D6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jQ0fL+HbgjDQ269d5tgudQyaHJMk9+e9kkypUOWwVkqCKj0aWbSPqHtEfgS+uZtItjhmTpiwxn1x+lprORqBHUTLiryCUA4yDdvQ1l4S+NhrLGe6iPkyXG4+b0pnWtdW4JCar8lV7eI3sRGr0Hpjfe+BWyorZAbRSdK/3WiI0z9Pqx8ul7tkH6036Qy6SlgHGt4haKHtmF4jO3GvcKqYnH1EQ7s/iqcM0zryog5bgxb7yXZeLWRJ9apHCzSmpJeKSmmNPzORip0ETYmcHiupIjraVVUk0T6N06BIGMMLUj5JFtP9gZVeKEIoJ6PLPc6WWRiU/hGHgYPAjcUvpHst3A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c01dee-9be5-4e1f-f73f-08df04b8341e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 03:55:30.4507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGinntVLyBoWlwjhsJjBKWJW3VcackTybGps28NWwzWGXlIyPAE98oJTsKxaA6/eUrC/Y2H4eC5NK8MyAc3lSB7JjPA3i9/zK2qyD/hYL/PYWFZ/GvFRpdwIiVCMRdqW
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

U2luY2UgdGhpcyBpcyB0aGUgcHJldmlldyBvZiB3aGF0IG1pZ2h0IGxvb2sgbGlrZSB0aGUgcmVh
bCBwYXRjaCBidXQgY2FudCBnZXQgbWVyZ2VkIHlldCwgdGh1cw0KQWNrZWQtYnk6IEFsYW4gUHJl
dmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQoNCk9uIFdlZCwgMjAy
Ni0wOC0yNiBhdCAxNzoxMSArMDAwMCwgRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyB3cm90ZToNCj4g
VGhpcyBwYXRjaCBpcyBqdXN0IHRvIHNob3cgaG93IHRoZSBzZXBhcmF0ZSBXQ0wgZGVmaW5pdGlv
biB3b3VsZCBsb29rLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJp
byA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3VjX2Z3LmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jDQo+IGluZGV4IDEyZmJjMjVkYzZiOC4uZGM0
ZTI2OGYxMzc5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPiBAQCAtMTQ3LDYgKzE0Nyw3
IEBAIHN0cnVjdCBmd19ibG9ic19ieV90eXBlIHsNCj4gwqANCj4gwqAvKiBmb3IgdGhlIEdTQyBG
VyB3ZSBtYXRjaCB0aGUgY29tcGF0aWJpbGl0eSB2ZXJzaW9uIGFuZCBub3QgdGhlIHJlbGVhc2Ug
b25lICovDQo+IMKgI2RlZmluZSBYRV9HU0NfRklSTVdBUkVfREVGUyhmd19kZWYsIG1ham9yX3Zl
cikJCVwNCj4gKwlmd19kZWYoUEFOVEhFUkxBS0UsCVNVQlBMQVRGT1JNX1dJTERDQVRMQUtFLG1h
am9yX3Zlcih4ZSwJZ3NjLAl3Y2wsCTEwNSwgMSwgMCkpCVwNCj4gwqAJZndfZGVmKFBBTlRIRVJM
QUtFLAlTVUJQTEFURk9STV9BTlksCW1ham9yX3Zlcih4ZSwJZ3NjLAlwdGwsCTEwNSwgMSwgMCkp
CVwNCj4gwqAJZndfZGVmKExVTkFSTEFLRSwJU1VCUExBVEZPUk1fQU5ZLAltYWpvcl92ZXIoeGUs
CWdzYywJbG5sLAkxMDQsIDEsIDApKQlcDQo+IMKgCWZ3X2RlZihNRVRFT1JMQUtFLAlTVUJQTEFU
Rk9STV9BTlksCW1ham9yX3ZlcihpOTE1LAlnc2MsCW10bCwJMTAyLCAxLCAwKSkNCg0K
