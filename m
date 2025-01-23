Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86165C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 19:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415E010E085;
	Thu, 23 Jan 2025 19:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nxdcir8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F22810E085
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 19:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737660958; x=1769196958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vINkj86gdyHtGm41Ih9Gv2qO08u4E/dlyOJRdC3Y1dI=;
 b=Nxdcir8Dtqx4+3qVplPjS7JaUhvwTHGKkh2Hj0y7eqtxkvwCVll7QuKx
 V2YDfP54j3IxDacHr272YMWGIJ1LAwbDUO1Rn2XuwTINc35GfjIC77EhG
 OfjxFKwoIJxPa0wIKZnvICVZfQHpxD6knLaMvbM6F7eqWo7iZ1z6omxWl
 QIMxA2amqqn0woviY0WDe3Iv9Gd95P5L/Md+I2OphT6AqUXRbgGg7yMqn
 QmFQskqSyuJFxpqXR4q9xDvrLjlFp5hjzpRgKQZnvNHXzxPfKHVU2OPwr
 AEsAq2FWSrjEBVFndOkPwEIZz4RKJx+J4lUSzO4ckBPt/Cf2UAyRoR84b g==;
X-CSE-ConnectionGUID: Fy+6y7wRR5WomsRdaeOAVQ==
X-CSE-MsgGUID: s7r7LZnYTFqqAyQJQY/osQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48771259"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="48771259"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:35:58 -0800
X-CSE-ConnectionGUID: DKpQQMoVQRe+NpbUOPCZow==
X-CSE-MsgGUID: 8e8p4JmBQn+q8r9s91YW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112512960"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 11:35:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 11:35:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 11:35:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 11:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d27qhFYRcAffpkIf8DPZzLtfKSHrbca5UbNKVgxktunpyh+BtHns9SSlmqZE40nSL8EDzOvZW0sPCd6MPpawirz2PWa1zmexNRmBPq0dEIjG6oxGJK+WAeEM9VbyF19Mc+rx9vFjHwKnVxAte5kKjNaovuwrumXLzodKRb49f17Kux6iSn/IJTZEZbLky0JKqXa1MiSy+haF+9D/I04EiQlUjq4ioxdxz/iMIczSIbeHYnRkrcrRjaFytVP5R1O4TkiIx7LRBVrq4/80fEkHm11gZjSTGaNd9mU1228X29Wd5hsBC3vdv/AT9F9EcJ0khrH/96R5MyLeY/0pnRiUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vINkj86gdyHtGm41Ih9Gv2qO08u4E/dlyOJRdC3Y1dI=;
 b=vLMrmtsA+SaUlzkdf3gDuYr++tKsxbO04KWXV8CpZEXqdsTKTuraQVryjrOrhuMHuf5MXCzuxN6ISDMg+d6hGkfKSdUhZhra3/QuD7r8/oWzawLMP/VO/qL+iMUqsKlUQEDBX87ZwrvyP8hL3sqn3vdLr8R60SvkWkoIxVvwe9D0XrptgI+zoGDV2WqlBCOju7BR0j9rvx2O10tknM9VaibdZuTM5hTk3YrAIPB1fD2OdtGryEv+qJnzAYcjc0FufOdPJ6qUXntQ6PDEyqwz7xPUFZpzeIQKCUzz+PrWh0gpPXhuc3tb0e8knTKwL1jxUUsoYce73oXOhJheIhBZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.17; Thu, 23 Jan 2025 19:35:14 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 19:35:14 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Topic: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Index: AQHbbcEqwvTX30vHV0akKUUxs8P7+rMkqsiAgAABswCAAAGlgIAAB4GAgAAIo4CAAAIOgA==
Date: Thu, 23 Jan 2025 19:35:14 +0000
Message-ID: <2310bce60e6afed539da5c6bd0f9deac3dee0355.camel@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
 <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
 <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
 <75d315bc086d8382c6cb89a65b1be0b65547e0a1.camel@intel.com>
 <1af7bdef-0602-4f1f-aaca-2e68a5b94685@intel.com>
In-Reply-To: <1af7bdef-0602-4f1f-aaca-2e68a5b94685@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS7PR11MB6061:EE_
x-ms-office365-filtering-correlation-id: e4408ad5-2936-4716-1721-08dd3be50f43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHpUTjNiSldNMDNPRVhSWnAwaGIxS25HMVBmdFlQaDRMbjZQdnBwVEtKVUxl?=
 =?utf-8?B?aTdWVXVtRkVvTmR0Z3lmNG9FbDNteVNPK2dOWC96dmFmRkp4Qi9aQ1plK3A0?=
 =?utf-8?B?NEZKRmZLTWZOUEg2WGJsYUFXQy9QcWxXcnJTK0s0ZVl5dldhcUcvcEdCS2hS?=
 =?utf-8?B?c0dGOXUwWkM5TUpMbS9DQ3NmVGI2bkNXT0U4OHJvbjJjTVJlOSt1MXViQTNi?=
 =?utf-8?B?MEhQT1FkUGRiTTEyTUZETjhZKzhLQlY0YXFSZ1l3dGttS1FmWmNLcDNoZXFw?=
 =?utf-8?B?VUpmZ1gzNTRyWVBmNXFLYklhQWduRGRGZ2tJZjZpQm56ckxOeXZNWi9VcXo4?=
 =?utf-8?B?VTlFeTY2V0Mwd3hxYnpFc3RDaFRuazMySTV6VFVEdml0VzNBb0FHaU1ta09P?=
 =?utf-8?B?YWtCV3dTSU0vNGVOcmh3UUlzNjI2WDJCVjF6aEpIYnNVZjhkVEF3WkdJWnBi?=
 =?utf-8?B?bXVXUHFaWTNWSE5lRjlreDNZNmNQTUNKaGdySk1QWlhvK0NvS3V5ZGh6cnla?=
 =?utf-8?B?UHRWWU45a0RLaEV5TmlJbExOaS9xdmhqSXVQZ0NKazFQTnFrY1Vid1JlU21o?=
 =?utf-8?B?a040WmxnY1lzU3ZUVWFKU3RNc3lRc0hlSy9IbzJaN3FIMDN4NmlSb0ZkR1hZ?=
 =?utf-8?B?TDBORDVJamZYcFZ3b1p2VENscW43T3RzbU5aY2VBaWFXcUp0U2U5WiswLzZB?=
 =?utf-8?B?cWV2Skp5Y3pOdkt1enNhUDE5OXdlejd0cFRFcENRUEU5YWZPd3h6bjF5cE9y?=
 =?utf-8?B?aGFKeUpnZS9OSWpwNkhsd3lma3FYQjY4dWJIenFCTVl1OCtOc3pMUjY4cVF6?=
 =?utf-8?B?RVU0bVV1YVdWN2x4U25ORVNJa3ZmaHZ4b0RrNGlIUnFtTCt2ZGVraUpHMy9k?=
 =?utf-8?B?bVlnZ2hqZmU0aWwrdXlVeDZWalZCZTFQM2RhMGQzYytCVWVxejZnYmovRzFj?=
 =?utf-8?B?TWI0SUdSY091aTA3MzNsbU9BNGJ0THZyZDkwNmZ4TmtXay9LYzN5MWU4L2x2?=
 =?utf-8?B?NjhjYytYa3lOdm9lSWoyalhha0xnTFFJeFpDQW1vQWM2WVdSWjZsQjVVVE1q?=
 =?utf-8?B?N0t4QjRhMkk2dmthZFEvR2N6WUJ0ZERIQnAxZXFjS0hRVkhjbi8yUDlWWnhZ?=
 =?utf-8?B?c3BndkhGV2ZTaG5lalJPUkhmTXdLV3hMMEc2Smk3d3crVGZ1ZjdaSzZHNTdI?=
 =?utf-8?B?MTRWWmxlZnc0cXRmWkJIZjg5UFBLL09TSzNWWUJTNWdzS2JwcVR1RjFXZWhS?=
 =?utf-8?B?V1RTNko0RkNaUGZqemJqWEtYNi83b0tVSFEwYlQvak4xM3BJWDdRdG4zby9D?=
 =?utf-8?B?YzA5cTVaZEJ5SlF6THlSRHNDbGFDWDU4NXF4ZkF2SnFuOVlsb2w1dldIaUVY?=
 =?utf-8?B?VHRSNmk4TDI1anMyZ0pnYzlsVTRBN0V4ZVNocHJFRFVuTzFlZkZ2VXRDK1FW?=
 =?utf-8?B?dTVCbCt1Sy9wZm9QRHpENDZrZDBlMkNYN3Rldzd0VG5HaDdsa1dtQjhtYzJZ?=
 =?utf-8?B?aGwxbWJNemhWeVBVY09ZU2tiSlluYVJ3dzJMR0c2SkQ3VWNKcXRkWDA0VHYw?=
 =?utf-8?B?OGJPdmt1dU5sYWc1b3lVaUNZWHhzM042R2JCVDRXOFBkczFIWDNkOG55SjYr?=
 =?utf-8?B?Sk5yMWVzR0diZDR6ajNPc3pqK3ZTVEhTb2hUOUNpQm52QzFqK09FbXk4SDly?=
 =?utf-8?B?UXhCZzFCRFBJNk1jenBWMncwdkdQMU5qdlZzb3VFVkVQNHlkQi9MVEVnT3E2?=
 =?utf-8?B?TCsrUVhKVDNlKzErMGZKRnlFWGxRTzFpMllnZWdpZS9ZdE5mUzBZVjVNV0tl?=
 =?utf-8?B?OVpmdUpmREpMK2tKYVM5eTBrdWswQ1haQ1ZRakFLbUhEaTh4blk1WUtFd3dF?=
 =?utf-8?B?ZkNsc2FiTXhEQzQ0MlVZU25jR2djQkFXMGppZnpGdlZEVERHdjRwZElLSEpi?=
 =?utf-8?Q?BHDal1KTnEgAZjpF6SDbLRxAIuM/Q5RG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am1CRXR3YWdMNFFXcitkVTBFeE5VZjd0ZkhaayttQmlqT1BtNXpuL1NPS2hw?=
 =?utf-8?B?dTdJbGFTbzNIWXJoQ0szWk0xMEcvVEhLclJwTm9qdng0S0VvUWxYU1dJdHpR?=
 =?utf-8?B?OHV1a3FDUytzMC9JSWk1aU1LQThHaDNUN1VQNjFkdXRmL3M4NDREc0hGYWFB?=
 =?utf-8?B?VzVrbDdxUGtSbXZsd2N3YjdNYzQrQ2tVZXAxNVpvTWlDcGU3WmY3NjI0WUhN?=
 =?utf-8?B?STlkWVF5eFdTSVpTL2J2NXFxRWZPSjA0c0ZaMXl4bU4yZ3YzZ2xGR0E1UDlx?=
 =?utf-8?B?YTM1bDFiZ2VqZ0t5dnFRWGRoMHk5aisvZ2FQSEZzMEJuTlBCeHFpVjh1NUVD?=
 =?utf-8?B?cGpDV3Zjeml2U0VuOEpzTVJVZW01UkRFRGd3dDY2SHA5c3NxRFJWaHZ1dFRl?=
 =?utf-8?B?cWZlaUZhVjdhU1J6dzlCQTd6YzNGNXBuK25DZXlrd1h5a0psVXBNVG44cURx?=
 =?utf-8?B?ZElWanRsWFpCeEZSUTlvNFViOCtFVFlXS3RuMy9QSnlwQmU2T0puRGNVSit6?=
 =?utf-8?B?dnpEdkEwK2I3bURKcUlHZ2FNcm01MEc1WUY2NlNuSm9QbUhsdVVkTmxsRGZZ?=
 =?utf-8?B?TlV6UXl1Y3pXTlFKUDVLN202ZDRySmZYeHV0ZHAvcHFmYmdwRGhDT3duRFZL?=
 =?utf-8?B?TWxqc0k5VE5IQnp4b3kvTGlncDhBcjF0cnpvcFlmdWI4RkRVRTVOMFdCYjRS?=
 =?utf-8?B?UUhCTkNKelZpZUs2dEM0QW9MY2dmRm1EV09TRi9XanBnR2h5OTlESi8rMm1W?=
 =?utf-8?B?dFlraDJRWUh5aitvS3NBVXBFQ0NPRFRIdVVHMVBGNUNVWHFvSG9nY21IQ2JC?=
 =?utf-8?B?ODF4OE5PQmVUaFdrczNYbjNTVkdsYlRZNmVIZjBna0dJUzlMVngwZVZkd2dI?=
 =?utf-8?B?TXR0ZDJYTC9Gb2FVNExMVm1hakRsUktjSjVFWjU4TzJnYXVaTmRWVzliTVZF?=
 =?utf-8?B?ZUx4WXpsQnRCaXJLRjRoS3gzbGxoTW9QRWRSVmhySStwOE9scGtNYWJMTjJu?=
 =?utf-8?B?bjFObS9mbWE1VXJhNnJxN1N3a2MxdVVVTnU4ZW9wNjQ1ZUNtSkE1M3NzYVhM?=
 =?utf-8?B?SXlYWkNhOWhTSFIxRkNaSUhMOHloRDVZM0I0R0RmdGc3UDVFeEpOOFlyK1Yv?=
 =?utf-8?B?dFJPN1hmamI0Z3J2K2FNYVVvSE43cW92WlVQdTlJd0drMWRnQTh5TGZwVzAv?=
 =?utf-8?B?RnRBQnpZZDZCRUswQTJDS2M1V0tZRFFlZ21ndkJQcmtqaTlabEtQQjhzbkMz?=
 =?utf-8?B?MllMTVhvY01rWnZBTkF3Z1NyWEh6bm0zcHdmY2tDTXJubjlieENOLys3dGJR?=
 =?utf-8?B?eE95a1M2WjlObkNZMDFlREZpQkxZNm1MMnRQRExMUlNCcXh4NEpMWFpIYm1a?=
 =?utf-8?B?NkF4UHd1eWtyNFU4cTc4d0c0VXlWaUhJTXgrYVJEVUthL0V2ZWRXNW9aNmVK?=
 =?utf-8?B?UER2dm0xNmtLR1B4TGZ0eXRYYkFjczNVSUQvc0RzTEVaTS9iRGVrSTBwK3pS?=
 =?utf-8?B?eWhKejlEbnJIcXAyajBROXlZdUgxUzBKemVoSyt1T0pOM2dnWkVYTkljK2pq?=
 =?utf-8?B?dUYrTGtMNFRCYmZZSzVodEpycUpNdTVUalhjaE9VcGV2K3Fva0hEUVdPZ1dk?=
 =?utf-8?B?ZmxuYmV6bHlVaVMzYnFpNGlpV3I0cU9qeGJVblFHM0RqK1M2cktFTlhjaTBw?=
 =?utf-8?B?NFVrTlZuY1I5WlFFWWJTRE96Nm9FajN4b3JjalF5anpqQmdnR3JFSmsyQXd6?=
 =?utf-8?B?SzlRNVlRYjBSZ0lXdXpqNTNES2lkNTNRdWMxMEFPbzBhRFdiS3dyREZxM0pO?=
 =?utf-8?B?SmZnSVhXVGtuTTB5ZmdFcGswUXYzb0lrdXFnMEFqSEFYYm1vN2FYOGxlTU9k?=
 =?utf-8?B?NW1icXEwYytxQlNDN2NuamJnbWxrdjZaeUM4VjVhVEMxVjA5UHg1WUZsNUJX?=
 =?utf-8?B?OTUzZFZkM0prMXg2eGthR09jL2Q5TkFhaHpOcjBoQktscEMwUHpwUEdBZlh5?=
 =?utf-8?B?a2hYUmpHVG1pTnNiQytERDY2bnFsemx4TSsvY1g0dU1JL1orbDVjQmh4NWZM?=
 =?utf-8?B?b2tSVUtaZ2pnMjNhRkFzckpNYk9QL1p3TzBWSHE2UThQMkthQWtSeUQxcURm?=
 =?utf-8?B?d29SclFCQXFPZU1PMEJSNEVQRENmbjRSUEtBYjVVcUxuNWZ3dlhnSmZ1ZWMr?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71DD392C32CF264088A5F701F12BD19D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4408ad5-2936-4716-1721-08dd3be50f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 19:35:14.5845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9ICcIzxJKrz79eQsasl1eqInoZd39XNKQNfBfl5VI9i/Z0AW1oCTj4Vx2MmbyIBnk0SFFDsb+EXB85N1LiqQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDExOjI3IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxLzIzLzIwMjUgMTA6NTYsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAy
NS0wMS0yMyBhdCAxMDozMCAtMDgwMCwgSm9obiBIYXJyaXNvbiB3cm90ZToNCj4gPiA+IE9uIDEv
MjMvMjAyNSAxMDoyNCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgMjAyNS0w
MS0yMyBhdCAxMDoxOCAtMDgwMCwgSm9obiBIYXJyaXNvbiB3cm90ZToNCj4gPiA+ID4gPiBPbiAx
LzIzLzIwMjUgMDk6NTksIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+ID4g
PiBUaGUgR1QgdGlsZSBpcyBhbHJlYWR5IGF2YWlsYWJsZSBidXQgd2FzIGFkZGVkIGFnYWluIGlu
IGNvbW1pdA0KPiA+ID4gPiA+ID4gYzI4ZmQ2YzM1OGRiICgiZHJtL3hlL2RldmNvcmVkdW1wOiBJ
bXByb3ZlIHNlY3Rpb24gaGVhZGluZ3MgYW5kIGFkZCB0aWxlIGluZm8iKSwNCj4gPiA+ID4gPiA+
IHNvIGhlcmUgZGVsZXRpbmcgaXQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEhlcmUgYSBk
ZXZjb3JlZHVtcCBleGFtcGxlIHdpdGggdGhlIGR1cGxpY2F0ZWQgaW5mb3JtYXRpb246DQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ICoqKiogWGUgRGV2aWNlIENvcmVkdW1wICoqKioNCj4gPiA+
ID4gPiA+IFJlYXNvbjogVGltZWRvdXQgam9iIC0gc2Vxbm89NDI5NDk2NzE3MCwgbHJjX3NlcW5v
PTQyOTQ5NjcxNzAsIGd1Y19pZD0xMywgZmxhZ3M9MHgwDQo+ID4gPiA+ID4gPiBrZXJuZWw6IDYu
MTMuMC16ZWgteGUrDQo+ID4gPiA+ID4gPiBtb2R1bGU6IHhlDQo+ID4gPiA+ID4gPiBTbmFwc2hv
dCB0aW1lOiAxNzM3NTczNTMwLjI0MzUyMTMxOQ0KPiA+ID4gPiA+ID4gVXB0aW1lOiAyNTg4LjA0
MTkzMDI4NA0KPiA+ID4gPiA+ID4gUHJvY2VzczogZGVxcC12ayBbODg1MF0NCj4gPiA+ID4gPiA+
IFBDSSBJRDogMHg2NGEwDQo+ID4gPiA+ID4gPiBQQ0kgcmV2aXNpb246IDB4MDQNCj4gPiA+ID4g
PiA+IEdUIGlkOiAwDQo+ID4gPiA+ID4gPiAJVGlsZTogMA0KPiA+ID4gPiA+ID4gCVR5cGU6IG1h
aW4NCj4gPiA+ID4gPiA+IAlJUCB2ZXI6IDIwLjQuNA0KPiA+ID4gPiA+ID4gCUNTIHJlZmVyZW5j
ZSBjbG9jazogMTkyMDAwMDANCj4gPiA+ID4gPiA+IEdUIGlkOiAxDQo+ID4gPiA+ID4gPiAJVGls
ZTogMA0KPiA+ID4gPiA+ID4gCVR5cGU6IG1lZGlhDQo+ID4gPiA+ID4gPiAJSVAgdmVyOiAyMC4w
LjQNCj4gPiA+ID4gPiA+IAlDUyByZWZlcmVuY2UgY2xvY2s6IDE5MjAwMDAwDQo+ID4gPiA+ID4g
VGhpcyBpcyBhbiBvdmVydmlldyBvZiBhbGwgR1RzL3RpbGVzIGluIHRoZSBkZXZpY2Ugd2l0aGlu
IHRoZSBnbG9iYWwNCj4gPiA+ID4gPiBzZWN0aW9uLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
KioqKiBHVCAjMCAqKioqDQo+ID4gPiA+ID4gVGhpcyBpcyBhIHNlY3Rpb24gaGVhZGVyIHRlbGxp
bmcgeW91IHRoYXQgZXZlcnl0aGluZyB3aGljaCBmb2xsb3dzIGlzDQo+ID4gPiA+ID4gaW5zaWRl
IEdUMC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJdCBpcyBub3QgZHVwbGljYXRlZCBpbmZvcm1h
dGlvbi4gQW5kIGlmIHlvdSByZW1vdmUgaXQgdGhlbiB5b3Ugbm93IGhhdmUNCj4gPiA+ID4gPiB0
aGUgaW5mb3JtYXRpb24gb2YgYWxsIEdUcyBiYWNrIHRvIGJhY2sgd2l0aCBubyBpbmRpY2F0aW9u
IG9mIHdoaWNoIEdUDQo+ID4gPiA+ID4gdGhleSBhY3R1YWxseSBiZWxvbmcgdG8uDQo+ID4gPiA+
IENhbid0IHlvdSBnZXQgdGhpcyBpbmZvcm1hdGlvbiBmcm9tIE5hbWUgKyBjbGFzcyArIGluc3Rh
bmNlPyBpZiBub3QgdGhhdCBzaG91bGQgYmUgcGxhY2VkIGluIG9uZSBvZiB0aGUgc2VjdGlvbnMg
YmVsb3cuDQo+ID4gPiBOby4gSSB3YXMgdHJ5aW5nIHRvIGRvIHRoYXQgb3JpZ2luYWxseSBhbmQg
ZGV0ZXJtaW5lZCBpdCB3YXMgaW1wb3NzaWJsZQ0KPiA+ID4gdG8gZG8gcmVsaWFibHkgZm9yIGFs
bCBjdXJyZW50IGFuZCBmdXR1cmUgcGxhdGZvcm1zLiBIZW5jZSB0aGUgc2VjdGlvbg0KPiA+ID4g
aGVhZGVyIHdhcyBhZGRlZC4NCj4gPiA+IA0KPiA+ID4gSXQgaXMgYWxzbyBtdWNoLCBtdWNoLCBt
dWNoIGJldHRlciB0byBiZSBleHBsaWNpdCBhYm91dCBkZWJ1Zw0KPiA+ID4gaW5mb3JtYXRpb24g
dGhhbiBmb3JjZSBwZW9wbGUgdG8gZ3Vlc3MgYmFzZWQgb24gaGV1cmlzdGljcyBvciB0cmliYWwN
Cj4gPiA+IGtub3dsZWRnZS4NCj4gPiA+IA0KPiA+ID4gPiBTbyB0aGlzIHNob3VsZCBiZSBwbGFj
ZWQgaW4gb25lIG9mIHRoaXMgc2VjdGlvbnM6DQo+ID4gPiBOby4gSXQgaXMgbm90IGluZm9ybWF0
aW9uIHdpdGhpbiBhIGNvbnRleHQgb3Igd2l0aGluIGEgaGFyZHdhcmUgZW5naW5lLg0KPiA+ID4g
SXQgaXMgdGhlIHJldmVyc2UuIEFsbCB0aGUgZm9sbG93aW5nIGNvbnRleHRzLCBoYXJkd2FyZSBl
bmdpbmVzLCBldGMuDQo+ID4gPiBhcmUgd2l0aGluIHRoZSBHVC4NCj4gPiA+IA0KPiA+ID4gQW5k
IHdoZW4geW91IGhhdmUgbXVsdGlwbGUgR1RzIGluIGEgc2luZ2xlIGR1bXAgdGhlbiB5b3UgbmVl
ZCBhIGRlZmluaXRlDQo+ID4gPiBkZWxpbWl0ZXIgdG8gc2F5IHRoYXQgYWxsIHRoZSBmb2xsb3dp
bmcgaXMgbm93IGluIGEgZGlmZmVyZW50IEdUIHRvIHdoYXQNCj4gPiA+IGNhbWUgYmVmb3JlLg0K
PiA+IENhbid0IEkgZG8gYSBleGVjIG92ZXIgYSBleGVjX3F1ZXVlIGNyZWF0ZWQgb3ZlciBlbmdp
bmVzIGluIGRpZmZlcmVudCB0aWxlcz8NCj4gPiBJIHRoaW5rIHdlIGFyZSBhbGxvd2VkLCBzbyBo
YXZpbmcgdGlsZSBhbmQgZ3QgaW4gJyoqKiogSFcgRW5naW5lcyAqKioqJyB3b3VsZCBiZSBiZXR0
ZXIuDQo+IE5vdCB0aGF0IEkgYW0gYXdhcmUgb2YuIFRoZSB3aG9sZSBwb2ludCBvZiB0aGUgJ2h3
IGVuZ2luZScgc2VjdGlvbiBpcyANCj4gdGhhdCBpdCBpcyByZWxhdGVkIHRvIGEgY29tbWFuZCBz
dHJlYW1lci4gQW5kIHRob3NlIGNhbm5vdCBicmlkZ2UgR1RzLg0KDQpObywgSSBtZWFuIHRoaXM6
DQoNCi0gY3JlYXRlIGEgZXhlY19xdWV1ZSB3aXRoIGluc3RhbmNlcyBpbiBDQ1MwKHRpbGUgMCwg
Z3QgMCkgKyBDQ1M1KHRpbGUgMSwgZ3QgMSkuDQotIGRvIGEgZXhlYyB3aXRoIGEgYmF0Y2ggYnVm
ZmVyIENDUzAgKyBvdGhlciBiYXRjaCBidWZmZXIgZm9yIENDUzUNCi0gb25lIG9mIHRob3NlIGdl
dHMgaGFuZw0KLSBkZXZjb3JlZHVtcCBzaG91bGQgZHVtcCBpbmZvcm1hdGlvbiBvZiBib3RoIGVu
Z2luZXMoInhlX2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJlX2Zvcl9xdWV1ZShzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZSAqcSkiKQ0KDQpzbyBoYXZpbmcgdGlsZSBhbmQgZ3QgaW5mb3JtYXRpb24gaW4gKioq
KiBIVyBFbmdpbmVzICoqKiogd291bGQgYmUgYmV0dGVyLg0KDQpidXQgd2UgY2FuIHdvcmsgb24g
dGhpcyBhZnRlciB0aGUgR3VDIGxvZyBwYXJ0Lg0KDQo+IA0KPiBKb2huLg0KPiANCj4gPiANCj4g
PiA+IEpvaG4uDQo+ID4gPiANCj4gPiA+ID4gR3VDIElEOiAxMw0KPiA+ID4gPiAJTmFtZTogY2Nz
MTMNCj4gPiA+ID4gCUNsYXNzOiA1DQo+ID4gPiA+IAlMb2dpY2FsIG1hc2s6IDB4MQ0KPiA+ID4g
PiAJV2lkdGg6IDENCj4gPiA+ID4gCVJlZjogMg0KPiA+ID4gPiAJVGltZW91dDogNTAwMCAobXMp
DQo+ID4gPiA+IAlUaW1lc2xpY2U6IDEwMDAgKHVzKQ0KPiA+ID4gPiAJUHJlZW1wdCB0aW1lb3V0
OiA2NDAwMDAgKHVzKQ0KPiA+ID4gPiAJSFcgQ29udGV4dCBEZXNjOiAweDAyNWUwMDAwDQo+ID4g
PiA+IAlIVyBSaW5nIGFkZHJlc3M6IDB4MDI1ZGMwMDANCj4gPiA+ID4gCUhXIEluZGlyZWN0IFJp
bmcgU3RhdGU6IDB4MDI1ZTMwMDANCj4gPiA+ID4gCUxSQyBIZWFkOiAobWVtb3J5KSAxNTINCj4g
PiA+ID4gCUxSQyBUYWlsOiAoaW50ZXJuYWwpIDI5NiwgKG1lbW9yeSkgMjk2DQo+ID4gPiA+IAlS
aW5nIHN0YXJ0OiAobWVtb3J5KSAweDAyNWRjMDAwDQo+ID4gPiA+IAlTdGFydCBzZXFubzogKG1l
bW9yeSkgLTEyNg0KPiA+ID4gPiAJU2Vxbm86IChtZW1vcnkpIC0xMjcNCj4gPiA+ID4gCVRpbWVz
dGFtcDogMHgwMDAwMDM1ZQ0KPiA+ID4gPiAJSm9iIFRpbWVzdGFtcDogMHgwMDAwMDM1ZQ0KPiA+
ID4gPiAJU2NoZWR1bGUgU3RhdGU6IDB4NDQxDQo+ID4gPiA+IAlGbGFnczogMHgwDQo+ID4gPiA+
IA0KPiA+ID4gPiAqKioqIEhXIEVuZ2luZXMgKioqKg0KPiA+ID4gPiBjY3MwIChwaHlzaWNhbCks
IGxvZ2ljYWwgaW5zdGFuY2U9MA0KPiA+ID4gPiAJQ2FwdHVyZV9zb3VyY2U6IEd1Qw0KPiA+ID4g
PiAJQ292ZXJhZ2U6IGZ1bGwtY2FwdHVyZQ0KPiA+ID4gPiAJRm9yY2V3YWtlOiBkb21haW4gMHgy
LCByZWYgMQ0KPiA+ID4gPiAJUmVzZXJ2ZWQ6IG5vDQo+ID4gPiA+IAlGT1JDRVdBS0VfR1Q6IDB4
MDAwMTAwMDANCj4gPiA+ID4gCVJDVV9NT0RFOiAweDAwMDAwMDAxDQo+ID4gPiA+IAlIV1NUQU06
IDB4ZmZmZmZmZmYNCj4gPiA+ID4gCVJJTkdfSFdTX1BHQTogMHgwMThkYjAwMA0KPiA+ID4gPiAJ
UklOR19IRUFEOiAweDAwMDAwMGVjDQo+ID4gPiA+IAlSSU5HX1RBSUw6IDB4MDAwMDAxMjgNCj4g
PiA+ID4gCVJJTkdfQ1RMOiAweDAwMDAzMDAxDQo+ID4gPiA+IAlSSU5HX01JX01PREU6IDB4MDAw
MDEwMDANCj4gPiA+ID4gCVJJTkdfTU9ERTogMHgwMDAwMDAwOA0KPiA+ID4gPiAJUklOR19FU1I6
IDB4MDAwMDAwMDANCj4gPiA+ID4gCVJJTkdfRU1SOiAweGZmZmZmZmZmDQo+ID4gPiA+IAlSSU5H
X0VJUjogMHgwMDAwMDAwMA0KPiA+ID4gPiAJUklOR19JTVI6IDB4MDAwMDAwMDANCj4gPiA+ID4g
CUlQRUhSOiAweDdhMDAwYTA0DQo+ID4gPiA+IAlSSU5HX0lOU1RET05FOiAweGZmZGVmZmZlDQo+
ID4gPiA+IA0KPiA+ID4gPiA+IEpvaG4uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiAJVGlsZTogMA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAqKioqIEd1QyBMb2cgKioq
Kg0KPiA+ID4gPiA+ID4gLi4uLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBDYzogSm9obiBI
YXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gPiA+ID4gPiA+IENjOiBMdWNh
cyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0K
PiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmNvcmVkdW1wLmMgfCAzIC0tLQ0KPiA+ID4gPiA+ID4gICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
Y29yZWR1bXAuYw0KPiA+ID4gPiA+ID4gaW5kZXggMWM4NmU2NDU2ZDYwZi4uMjk5Njk0NWZmZWUz
OSAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3Jl
ZHVtcC5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1
bXAuYw0KPiA+ID4gPiA+ID4gQEAgLTExMSw5ICsxMTEsNiBAQCBzdGF0aWMgc3NpemVfdCBfX3hl
X2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBzaXplX3QgY291bnQsDQo+ID4gPiA+ID4g
PiAgICAgCWRybV9wcmludGYoJnAsICJQcm9jZXNzOiAlcyBbJWRdXG4iLCBzcy0+cHJvY2Vzc19u
YW1lLCBzcy0+cGlkKTsNCj4gPiA+ID4gPiA+ICAgICAJeGVfZGV2aWNlX3NuYXBzaG90X3ByaW50
KHhlLCAmcCk7DQo+ID4gPiA+ID4gPiAgICAgDQo+ID4gPiA+ID4gPiAtCWRybV9wcmludGYoJnAs
ICJcbioqKiogR1QgIyVkICoqKipcbiIsIHNzLT5ndC0+aW5mby5pZCk7DQo+ID4gPiA+ID4gPiAt
CWRybV9wcmludGYoJnAsICJcdFRpbGU6ICVkXG4iLCBzcy0+Z3QtPnRpbGUtPmlkKTsNCj4gPiA+
ID4gPiA+IC0NCj4gPiA+ID4gPiA+ICAgICAJZHJtX3B1dHMoJnAsICJcbioqKiogR3VDIExvZyAq
KioqXG4iKTsNCj4gPiA+ID4gPiA+ICAgICAJeGVfZ3VjX2xvZ19zbmFwc2hvdF9wcmludChzcy0+
Z3VjLmxvZywgJnApOw0KPiA+ID4gPiA+ID4gICAgIAlkcm1fcHV0cygmcCwgIlxuKioqKiBHdUMg
Q1QgKioqKlxuIik7DQo+IA0KDQo=
