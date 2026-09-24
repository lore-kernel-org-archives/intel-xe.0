Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D5BC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449D10E1F0;
	Thu, 24 Sep 2026 20:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iid2gLyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA6910E1F0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790282666; x=1821818666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PfDQNNXI8Yiu3BpeQp5v9bcmNiCufq1ek0WLXZxeMhE=;
 b=iid2gLyoBTcnqdhEvBF3DSHw1PJtDOZ3cjoq6R03X5/5cTOSGpGpJwcV
 G+8B4/bR5t2B5VP1whgbxr9G21s0ryUTZojbrwR+zEaE1trQpRJ9LwOVU
 qMG2n/7P+sAJpVyq1/EqACrxrfrrwaH8dnUK1SrF9LpRvnODZy8SUxOKF
 Lv3m08llnqHVANcUQWAHQnrQqsVxKJNOYGn2+LUvfyDw6dvcHmoicRpLo
 9aAbvl0iiWlRS+Bhkci5pfKOTR6rqSn9vuxe9+roqm8CIcC50WBssvudl
 sqMtIsZxzsVBjRCP1PWQTefoGt6QtyLf2dfQksU4u1T8ZphmAaY9xUcqy g==;
X-CSE-ConnectionGUID: ay3/PENHTQCRomTz0+bmxA==
X-CSE-MsgGUID: iuaUa9crSS+ORuCzeBnN6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="112855046"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="112855046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:44:24 -0700
X-CSE-ConnectionGUID: aIt/9SpHQUWx5/aH/fWt8g==
X-CSE-MsgGUID: qQDVPclfTH61EIgaz3sLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="302071096"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:44:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 13:44:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 13:44:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 13:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhSFH4QC4wFOtxALV1JUR4MEl6dNs1+kdJTipPrX/sAHaax72XfVGWPyBxbm7v/v9hk3qYv+zTPjnRGtc+rD79v+CR/il69/fEPUj6Vi6cd2OVB2QsaScVyx3yE/IQKTsaAHN05jgHSV27PMcXK7Vmpuxq4FyzUByNDUM+7wm7U4zIE10pPt2SRzmIgeQnS5kJLPE8m4EGBNK5IxFo/nygpEVK3wkLyJBk8Zb/GqBTGfmP86z0cqHDh13I3wfWfJstLoeHiaeciWyfuKKv0INiOOWT/mSTT2t99gN+0XlK3CzDX9dnUnaw0mjMjjTlGYQXC+WUcYNUvdwcvgL5PHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfDQNNXI8Yiu3BpeQp5v9bcmNiCufq1ek0WLXZxeMhE=;
 b=AFMomLiaclAkqiAfEc9Em48e8LMEJ7RPDk/JHC90Hujvf2CmP2Dt1ixFHPBrFaT6hsV6GeXDVqcXlZ9jb8WZWqw6AasgZqZQiNHqiQgP9nBKO9Xb4trMUY72f3nFLvnxfPZhjd6/I79hJn8xB/Jt7HiEIS7TFPskCFpEGNiknn5tLzyq2lcr2BsVdNSFf60ZnZE9EBoUAO+CPrFVdezSTwHNMFHl6JD7NWfjPROULrstBNA7kond/n4Q44KFIdD6xZJNh1J8dAia1UA/0OzWEFzhHDUtbtr9DV3GZtSmEFmRQidpxkKPl7Px4kRwCQdw1c7mh7l3PG6kKMj7iim6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DSWPR11MB9763.namprd11.prod.outlook.com (2603:10b6:8:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:44:20 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:44:20 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL
 check
Thread-Topic: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL
 check
Thread-Index: AQHdRK9euWXpSm+vB0StTS3ktOfXorbeHEQAgAAkVFA=
Date: Thu, 24 Sep 2026 20:44:19 +0000
Message-ID: <DM4PR11MB54561853ADFA943F9045CCCFEA812@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260915011229.203424-1-shuicheng.lin@intel.com>
 <dcb7229c-74ac-428c-a8f9-10dcd8efe3fb@intel.com>
In-Reply-To: <dcb7229c-74ac-428c-a8f9-10dcd8efe3fb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DSWPR11MB9763:EE_
x-ms-office365-filtering-correlation-id: 3f46c3f1-7040-4131-8cb1-08df1a7c9bae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|5023799004|56012099006|11063799006|4143699003|38070700021|22082099003|18002099003|20052099010;
x-microsoft-antispam-message-info: It2Tt5IcvIoD5c/cbHxbschkZhvaLgcDe/2Thru7lSjWRO/6/OfTwbYXZ5RsPpuAYO4XlEskbT0Bz0e+yiaaySkIdPxwgVJrPKOsnkS6Is0YgIa0ultLhQvshpcUpwFsTENpc3x/3DPCzuMqVvUprCcrE5iUf9Vx560GqD7IdOp8cE2YZJWIfRVgklXVclxmdrgP3ACTzEF+7+M1Fy2OsYICt25t656hPa3dXt5PgDuQH+uobTTDYExhw+sLhhgrJDORFgV8tPI4Aj19Ay09M26o4MMJnLS6SIK21spNAbAMDmq71fAGJbR6MbSnKWH1NP0ECIPQFUlfpc/dXRhSJc7nlp8WIu6bcWFhwgWqx0C8FFGUOGap0ahHAi98vXDFSjpd3TFOvVfgWzYQX5tAOBIX1hMNeMpFO7GRgLUSNPaghwrmwz6zC2ErVXDMIkRZd7phBgrPXglewzSmpFmyn1uzQgUR7sL8jQwLyXjkB3rZ5uMkiKhzZbvDyISIeC3bvSzlhak1YholRTLtQ5RFSix+ww88Nb4x8P2qYjSCnNAfHSXwQh/L6BYoGUJk87njkry+zDG12y5Mb/MMDeNb842pt5Z+eKvHyfRXl1Zts7QON78bMQw4wEpLRWLbTVLYMi+Be3W+9rdEs7KtAJBg2/eaiWYu22h7fK5B+PSBMPvZpTuRuXx6rKv4GrKslCG7Bci6//E0jtZl2RT+mieoLZ1iy0cVoqxEIpD2hlOSMLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(38070700021)(22082099003)(18002099003)(20052099010);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTF6S1diWG5JMk5GUEwyeHNNTW9kMWN5STJSSDVxVzFIU1FIb2tTNTRuR3JC?=
 =?utf-8?B?SjV0QXIrMytUaHhHOFgxZ2VZZTdITHV4bWw2R25BWDh6ak9xRWRlbEtzdUww?=
 =?utf-8?B?Q3B4Rmdqb1BoRUVIY3NkOGtCUFVqcU10WWlBYjlpNy81M2tNeGNPdGd4Nkp0?=
 =?utf-8?B?cXIzSC94Zm1Fcngybk5KOC9Dd05CdlpHM1NTTUtSMVFCN2wwQUcrQmpoOXNj?=
 =?utf-8?B?dVp4cmpwcTNTODF2WlRqOXVUOGJsdDFKRjg5T1ZsMVhSa2RtZXowaUExQzBw?=
 =?utf-8?B?WXpwNVJWU1RkZEIwRnFTNW5TOVdmcE4rd25LazhlNW9DTE9hYzBub1FCRjZ0?=
 =?utf-8?B?c3lJYTh0SG9rYmpqZFN3TzFLKytCNi9uV3kxNXB3WWFWZFU3TDJnZzFCTDBj?=
 =?utf-8?B?cmY4R3dqRVpMNkI2SzJ3Z2pueTVNL1BWL2gvVzVEczZEblFzZkY2eGdITDgr?=
 =?utf-8?B?ZGVBbGZGOU9yTlpwckF3VGUzODZ5dElsRU9GRUpZOWNaSU05WTJ0UGFlWTJn?=
 =?utf-8?B?RFBSTkEybFpqNXlCSmtuRDdnZ0QxdkxwK2hRRHgxdys0SVhjdlZDVTJjR2RL?=
 =?utf-8?B?dUx0c3MzZlJneUZESW9WUG5wenJ0cDhidy82QlRMTkNpWGNSSyszSmVsaVJU?=
 =?utf-8?B?bmU0N1haeTZpUFIxV3F2YitlWXhVYTh4NWQ5U0l0Z0ZUZEhwdGxKQmoyLytG?=
 =?utf-8?B?Z2IvMk9kZWNwWU41OG5IczJDbEJ3bEZoazM0RHp1UFk0TGNYK3crTFcvaDQ2?=
 =?utf-8?B?d2VDLzZDVHQ2SHpjazJKbEltWlJpM0JwVTYzeGphQ09UNmFGWWg4L0Uwb0xK?=
 =?utf-8?B?d2pzQ2s3cUlPRG9XWW1rcWN0dG1VT2xNS25FRTAzYTc2VHp4cWtZQ1pFSnRE?=
 =?utf-8?B?OFFCUUFCVENKcHpzRVFhRHRoZkNIeXQ3YkVCa3lpbDBuU2I4TUpad2FXK1pi?=
 =?utf-8?B?ZEl4VUhFME1RRHlSaVpjaXRDbEpPTm4xQm5GclZxeEFvaXVZOE1IaktmVk1x?=
 =?utf-8?B?M1lOY2VpbVhiTkZYWEhtVHNhcHoyZEF6YnlHVWx0bGZuZ0xQbkI0TE1Mb3hU?=
 =?utf-8?B?ZHgxbkxDNkRrL3BNSkRkbWcxZzlYVTF3VmFxVkd2c1QxV0pFYXZVN1F5WjVI?=
 =?utf-8?B?NlgrM2pSb0w0Nlp0RVNSR3F4NVZpZEJFb1NXSWVHSmlGOWNxK01CRW84V0hV?=
 =?utf-8?B?cS9xUGNvZVJhYlc0ZEx0TlZpQTQ5NFdML2xTWGc1SGVCdGdiWlpvdVF0VWJY?=
 =?utf-8?B?VTVQd2w1MzlYcmlEam9sSjgrMkpENnUycmU5VERYWHQ1YW9YMlVXeGducndk?=
 =?utf-8?B?UHN6SG5BNHdNbDQ3ZE93cEhsOVZHNTdReG4rYVlNOUVJcEdRemVnTTBESkJ0?=
 =?utf-8?B?aG84WHQ0bUU5TkJTNS9aekl1T2JkS1JGaTczbWxrYTNmRUNiU2Rod1RQTXpV?=
 =?utf-8?B?NitCNVNBdXdoRDc3UjlxTnE1c29jWEVqZFRzOWNNUlN1b1R6d1JLc0E5M1Ur?=
 =?utf-8?B?ekRtMFBJdWxJVmhHdUErVnJMOEZlZ1FBb0taK1RQTzF2bWlGYVU2c3IrRFA0?=
 =?utf-8?B?V3I4Wm4xbXE5WUxtR3RvVEY0RDQ0MTZUd3YwdURIRGlINU5BOXRsS2RZQ1hC?=
 =?utf-8?B?b2pwT2hLMjhWS05LaFZOQWdHcThDcGdwemhSWXZqM0taQzFsbXM0ajc2VHVp?=
 =?utf-8?B?VnNIakpHWkJ0NGNGVjdCdm0rZEduZEFUN2RneG9oRUF3RlJScjRlaW9pUlZn?=
 =?utf-8?B?b3FoMXcwc0wwaXpMcXRYT2pTYVBrOFJ0R0t2UE9jNDZkcGIyTCs1bmo1WGJq?=
 =?utf-8?B?VG16dVZreUNOdHFMZFFnbkNQS1B4ekRsZ3k3bktIcjdPeGVQTVVhaGdic00v?=
 =?utf-8?B?UEtuVzNWMWdKRXdEU3I3SVdqbGJra3BaRTdEQ1p4ZmNjVXNGd0I2SHo5aUpM?=
 =?utf-8?B?dEVob20xTm12TlVEL1l3Z0FvU29kVTlnbnpnVFFlTTJoSXdrWERmV2VoZGRp?=
 =?utf-8?B?d3J4Z1FhcUNqa0crRmRCOGk4Mm03YmYxQm5lVncyeGsyMEZQTFltazkxS1hK?=
 =?utf-8?B?dDBuMVF0ZUQ3V1NzM0xGSXB3QVQreUhqOE1BTzdwOGZsb1JvZVNRa2NTWlhj?=
 =?utf-8?B?bU1uQVliaFhhQzFPcHRhaVcwZGh1ZGF5RXZJTC8xYlRYOERGRmN4U0pZOUNj?=
 =?utf-8?B?MzRySnNONHdLT3V5bENacmxOcFhPcExBQ0Fuc0cxaTNuZnQzbk5jNm56WnBD?=
 =?utf-8?B?ZUJuOUVDSlZrdVNkOXNCNWJlL1NRODdFUzFzclZvYTNwV0NCL29oQy9CYWMr?=
 =?utf-8?B?eGRkSmZxbllSZ0dRVnZVMjNUQTVsaEJ4Q00vZ1NzQ2FWYnM3WGpHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SBlfMEzRC4kuuccS6baXuVW0RC5ldhCvN9OAN7p1SR17C9BjL+n4uVGXHnEd5xpMh6LCyJ8QGTGNb11g1CIDY1UbI2ioW4OyX/heboNWn+sRUTo65MXOekjLkeuW+XFI5qKMHWoVx4+1hMBvaQlsXBt1/RtgmnYsSHvFJrZ3PjtDgwLTaP/ZpD/8bH6CfzQKqVqjJk0cN9lAJ+thEXeOQr/NEyb2+Fwg4ZJp9h+6fPl/EbAUZgmZ0/nXeyTwT3F+fIIPPbRX8zTADOzmi4KjjoN2kPFvTt89AtDO8IUr+4Xy+ZPwjbHjyTLY3LJzeb6hAY/fULWB74fTxtwNEwk4Ng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f46c3f1-7040-4131-8cb1-08df1a7c9bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 20:44:19.9817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zt30PjaM9ihNLQSdX/0xd7y7ew/74BSOaT4eh7zvgv0gO9Bc82Aa4OJCJe33A9kf9r/AY+x0FrUIXsigbepl0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9763
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgMTE6MzEgQU0gWGluIFdhbmcgd3JvdGU6DQo+IE9uIDkvMTQv
MjAyNiAxODoxMiwgU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiBUaGUgTlVMTCBjaGVjayBvbiBt
YWR2aXNlX2Z1bmNzW2F0dHJfdHlwZV0gaW4geGVfdm1fbWFkdmlzZV9pb2N0bCgpIGlzDQo+ID4g
dW5yZWFjaGFibGUuIG1hZHZpc2VfYXJnc19hcmVfc2FuZSgpIGFscmVhZHkgdmFsaWRhdGVzIGFy
Z3MtPnR5cGUgdmlhDQo+ID4gYSBzd2l0Y2ggc3RhdGVtZW50IHdob3NlIGRlZmF1bHQgY2FzZSBy
ZWplY3RzIGFueSB0eXBlIG5vdCBwcmVzZW50IGluDQo+ID4gbWFkdmlzZV9mdW5jc1tdLiBFdmVy
eSB0eXBlIHRoYXQgcGFzc2VzIHRoZSBzYW5pdHkgY2hlY2sgaGFzIGENCj4gPiBjb3JyZXNwb25k
aW5nIGVudHJ5IGluIHRoZSB0YWJsZS4NCj4gPg0KPiA+IEJleW9uZCBiZWluZyBkZWFkIGNvZGUs
IHRoZSBjaGVjaydzIGVycm9yIHBhdGggKGdvdG8gZXJyX2ZpbmkpIHdvdWxkDQo+ID4gYWxzbyBz
a2lwIHhlX3N2bV9ub3RpZmllcl91bmxvY2soKSBpZiBpdCB3ZXJlIHNvbWVob3cgcmVhY2hlZCB3
aXRoDQo+ID4gaGFzX3N2bV91c2VycHRyX3ZtYXMgc2V0LCBzaW5jZSBlcnJfZmluaSBvbmx5IHRl
YXJzIGRvd24gdGhlIGRybV9leGVjLg0KPiA+IFJlbW92aW5nIHRoZSBjaGVjayBlbGltaW5hdGVz
IGJvdGggdGhlIHJlZHVuZGFuY3kgYW5kIHRoZSBsYXRlbnQNCj4gPiB1bndpbmQgaGF6YXJkLg0K
PiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+ID4NCj4gPiBBc3Npc3RlZC1ieTogTExN
DQo+IFRoZSBjb2RlIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lLiBPbmUgc21hbGwgY29tbWl0LW1l
c3NhZ2Ugbml0Og0KPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLWFzc2lzdGFudHMucnN0
IHNwZWNpZmllcyB0aGUgZm9ybWF0DQo+ICJBc3Npc3RlZC1ieTogQUdFTlRfTkFNRTpNT0RFTF9W
RVJTSU9OIi4gQ291bGQgeW91IHJlcGxhY2UNCj4gIkFzc2lzdGVkLWJ5OiBMTE0iIHdpdGggdGhl
IHRvb2wgYW5kIG1vZGVsIHZlcnNpb24gdXNlZD8gSWYgaXQgd2FzIHRoZSBzYW1lDQo+IGFzIHYx
LCB5b3UgY291bGQgcmVzdG9yZSBpdHMgQXNzaXN0ZWQtYnkgdGFnLg0KDQpUaGFua3MgZm9yIHRo
ZSByZXZpZXcuDQpMTE0gaXMgdGhlIGxhdGVzdCBzdWdnZXN0aW9uIG9mIHRoZSBkb2MgYXMgYmVs
b3cuDQoiDQotICBBc3Npc3RlZC1ieTogQUdFTlRfTkFNRTpNT0RFTF9WRVJTSU9OIFtUT09MMV0g
W1RPT0wyXQ0KKyAgQXNzaXN0ZWQtYnk6IExMTSBbVE9PTDFdIFtUT09MMl0NCiINCg0KU2h1aWNo
ZW5nDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiBDYzogQXJ2aW5kIFlhZGF2IDxhcnZpbmQueWFkYXZAaW50ZWwuY29tPg0K
PiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBDYzog
SGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0K
PiA+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jIHwg
NiAtLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiBpbmRleCAwNDc0NzY4YTM4YWEu
LjVjN2FlZmM2NDFlZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1f
bWFkdmlzZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYw0K
PiA+IEBAIC03MTMsMTIgKzcxMyw2IEBAIGludCB4ZV92bV9tYWR2aXNlX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsDQo+ID4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWwNCj4g
Pg0KPiA+ICAgCWF0dHJfdHlwZSA9IGFycmF5X2luZGV4X25vc3BlYyhhcmdzLT50eXBlLA0KPiA+
IEFSUkFZX1NJWkUobWFkdmlzZV9mdW5jcykpOw0KPiA+DQo+ID4gLQkvKiBFbnN1cmUgdGhlIG1h
ZHZpc2UgZnVuY3Rpb24gZXhpc3RzIGZvciB0aGlzIHR5cGUgKi8NCj4gPiAtCWlmICghbWFkdmlz
ZV9mdW5jc1thdHRyX3R5cGVdKSB7DQo+ID4gLQkJZXJyID0gLUVJTlZBTDsNCj4gPiAtCQlnb3Rv
IGVycl9maW5pOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgIAltYWR2aXNlX2Z1bmNzW2F0dHJfdHlw
ZV0oeGUsIHZtLCBtYWR2aXNlX3JhbmdlLnZtYXMsDQo+IG1hZHZpc2VfcmFuZ2UubnVtX3ZtYXMs
IGFyZ3MsDQo+ID4gICAJCQkJICZkZXRhaWxzKTsNCj4gPg0KDQo=
