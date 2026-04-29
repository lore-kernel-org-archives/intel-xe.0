Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6DFF8873
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5262910E3F9;
	Wed, 29 Apr 2026 20:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTXQVQ68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7510E3F9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777495230; x=1809031230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VxifcvCJGgqDDhro0Vq5O+m7QMKi7bZjzgMHQ4dSPLw=;
 b=QTXQVQ68o2k4YUUAs9ddIYb0ZvXiadKpLVHc+MuDC9PzWSkRWi1nQJDy
 G2caafVCSHsNAxZWMKySIZG0oNya8jnon4hWtJ/CCnz2SA+fXUUUOIEso
 /nSxnn9zRtrLMaZhPYEv2PkRkabvSxJ8Hi2ec5J43pC+Lcnof6Eck9GtI
 6/EAQeO2QyXmAWNLPA2DGDgXjQAlPAaLtRiXXCset0PpiZ8iY2am/gLRN
 Jk3xkEN76SRtA2b1YoJlDIgBrugtYMY23p3NZLaBvEf+U8azNxjzCoyXX
 7Ma4rqZ4prEWc75wm2UFtZY2DDh+Rzt43khAXSURvZY0M5IoKMZwjyxMH w==;
X-CSE-ConnectionGUID: D8jYOV2VQ5+KlSzd8nALmg==
X-CSE-MsgGUID: 1ovm1MSCTiWe/mgvtpFCng==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89128196"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89128196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:40:30 -0700
X-CSE-ConnectionGUID: qREafOyYTYifFgZa4lllVg==
X-CSE-MsgGUID: MJZioRDRTZ6au+i1WLINew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234250097"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:40:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:40:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:40:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xho+tl77iNwEoVJ9TGrXgSAws7/NYlG1MHgd8iJfTPiHknhEAnf/BJzINH4qXgpYhCE8rJmuYEdhRiRxDUF+2l2mOpFbGpJEnyABWEYtnCgyO2oi4UrTQGdPSsdZIOT0VGg1t9BBNoQ73vc0pLvA7FXNwOup/qjCYz86jibFbFH/oxQhuTELNswpNeDcb531QDZiZRGCnRRiGDzpdqtE4IqB00YxN+n2nBUhBQqzVX0CSyZunyMDDwEnR0lp1Wby1iSFiGKVLW/fdqAtwTuPdYB0QZU4dzFml9gCmhA1+MlcZp7EZMfpW8H5smecEJevvgE8b9OZpqyKaJQMoBGVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxifcvCJGgqDDhro0Vq5O+m7QMKi7bZjzgMHQ4dSPLw=;
 b=KAuen+Z1PsXfQkz10+hPtBvsBx4MJyH2cdTkj+XafTyU4LeT5WnKGZeq5NoV2dwEdY9g6xQ+6eP/XJWq1546L5mPxZk4+Gx0l1gTcSn+SpVVy9FRNGMG8Q79Fr3IwXKeKu0z7k3nWqSMStY1tEcIZYr96itaseu7BnYFUieEMfVSexbhl7ag4bt28kBjX07xe5GOgp/dFGuTlDCUVQ4fMIN7ZdcRvB8GPxHmBaz3A2WgNLrglHcSAkDMFuPzlPN23YXxLUSNDqz2nxm+lsZVwKM1OTTK2Ct9j/w0+LTVMe0J41Lx9WddC/dkMav5dI4aA1E+8I4ZkreLmWrFzpBOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:40:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:40:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Topic: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Index: AQHc2A2l2RRAwRTmW0y3yjZbjnXLm7X2fI2AgAABDkA=
Date: Wed, 29 Apr 2026 20:40:25 +0000
Message-ID: <DM4PR11MB5456B025ABC174BC637AE1CBEA342@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260429192259.4009211-1-shuicheng.lin@intel.com>
 <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
In-Reply-To: <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB7915:EE_
x-ms-office365-filtering-correlation-id: d0502a04-90dd-496a-d4a3-08dea62f8abd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: pU1kradDUdfQzHbFo+Gthh6NULALhtlZ9ofeksz5zkJSUmix+CBkUlRaOBOu9SIr6N145lUYZPErMy66C3zm/QJrggn9DTdw5nNIhyeluKIlsltOrltUkPPRCJVPKs5GROYQhH0c/f9om+PAeCJ8F0avg8jvVVVcz3jIyIOEiIEAgeBBN+TJLbBtPRhQJVw+T9frxX+3iI2HZwozWWOARC1a+bMdX4pjkrVdwaSKMIXHu/lr9suyer3zvyYd0jCbm+Dnz2OpsnTE1vh7buzGRTUYzMPF6lvnxgGl9s1JXk33gY7OqHxGzTiIRmTZF1b06Y+NXfhVze7ILNoXBmLAmPO6qWpaJHKjIuMl+k6VaoS4uZz6wcer5M+WJrWh+TXx4Q5XIFuYpLqwO5QfL6x4wbrUt55VSSF97J5qlF/ZozPmLbPVl1lIqPllkbhyIKM1SBGEExe0DhsdqtIoJ9p4tEcdyBzKYR9c3h3jqvq3lc5h606CkuSH470Z7nLbZlr3pdgCFmxIPJb7j36eqTWEUCShVzbgUiZKkO5enK8JTQ6R/Zn8FZA9ys4CCo8t038cFpt5R1E8iL5DPHKvVEpbmIAtKgKPlOZiJVzCoA/9Dl0iopA96MyPdm/+WE2I9sA4NWnQxKd9wo1AJ34cZWrMDoCAXUIVVbQhReF9ewYmuVaU+wrRXTs+wCQ+ggfUNdlnl63gYA2VTG7tjXKA+Yd9hvPUgjfohw4zDs8qhvOfVp6Lq+smxAJXtYkmyzsylKCPrpDZDZkDW4hAU4S5sWwSaJITe2IKtF4ysAemckXBPmY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHRzb0ZJbGFQRFRyUEc1bGo0eG92WHBlc1JaQzBwV21EOHBma05oR2dpNUla?=
 =?utf-8?B?Qkwwd25iZ1RCMWVYRWxwRnFpK0ZGT3pLN1ZmOGJacGh6RC9iYThpQ0VOblFI?=
 =?utf-8?B?ZWVEK3lpZnN4NWlEbnovR1J2Y0FybzN5THV2SjFtc3dSaWtVaWhhclIweXVp?=
 =?utf-8?B?WHpVRnljelU2NS9SYU1EUmdsZlpqWHZwdHdlbGttQjhYRU1GVWZHN2ZYUG1Q?=
 =?utf-8?B?VFhySkExQmdjeWNnMGRzTGFZbHhiUDhMOXZVTW1KVXY0eE5UYTU5bGN5MmQz?=
 =?utf-8?B?NEFUUFJEK3FKMSszT1lCcjFkK2RCTzdlR3ZjeWlrR1JEUzZKZU1kV0tKTzRa?=
 =?utf-8?B?eFkzTUlDRDBVQ3NnS1RrNThVRnVWalJBMnhhLzRvV2RwT3IvSEJVbW4yYis3?=
 =?utf-8?B?MTc5c3U1UjVsRkVjeE5VTTlyQlhIWFlpTlVwN3JVT25PbU9mSmlidU1QN1JC?=
 =?utf-8?B?aVpaOXZMZUdTT2NBeFpSSURKaU9ZVzNKaW9LbEtZNVpqYmJXNkNtQXlCWHlE?=
 =?utf-8?B?VGNDV0RWNmNkVTRYdjVONVpTaDhINGJ1bzUwaUhiOE55bDFsUVNOL1VscEla?=
 =?utf-8?B?cjRCSDllcjhNcmYrUGoxOU1sditacGtOcFpiWUl1eUVYajU3UnQ0YUpPM3Zj?=
 =?utf-8?B?RHNNQzlQQ09OTE9CZVZMd2FsMEVib0RVQjQzV2doUVZvb3kyTDNqZGR2Zzc0?=
 =?utf-8?B?aXNLbTJVWnArZW45eU1odmlzenpxem9lYkJ5NnJYRzZGZFZWdkQrWGlWbUhW?=
 =?utf-8?B?SHgxS2NUZm9kMHRGQkJpUVVMSUNBc0Z2aElCOVNmZU5hd2lBd3FDMVMxR3ZJ?=
 =?utf-8?B?MXFMSTloSGRSTm85L0dRQ0FsOEFqN3Y4T25KdmMyN290dGdtWEZEZ1BZZXB1?=
 =?utf-8?B?TmZiaUZtMDN0aThtWW9keFRYTHhJQ0JQaHZseGJNSFo4RXZNNDh6OG9lU0F5?=
 =?utf-8?B?RDZFZHc5WDRTMnhpdmdYWTROQ0hBdG9HcEFCMG56ZjcxOGN3UzNYSzZrRGpF?=
 =?utf-8?B?UzFObFlSWVZpRWR2Zkc3MGMwUms1cjUvK0c3OUg2NTlWaS8xZENoMzUyenRi?=
 =?utf-8?B?L0NGN3lGQ1VZNzd5NnJVeHY5TmRERjROR2dxaXMrVnhLUUhjcm9xNUF4VWYz?=
 =?utf-8?B?S0NhaExKRmczb0JqdnNON0VGMi8wMFZQL2RCOFRwU2VUOTVwTnNITkw0TStY?=
 =?utf-8?B?a3puT1g0TE5EdkYxekNtNGphOTVNU1gxZEFCRHJ0WTJQYWxobitxSk9MVVNr?=
 =?utf-8?B?NmJBUFd2YVc4NzZkMkRac29ldHE0c1Vub0IvMi9kS2JHSXhoYnJKWjM4Wk13?=
 =?utf-8?B?ZVlMVW1zQmVaam9oeE96VjJMRm1WOG1CbUNLM05vNFVXTzlxRXdzdVFPOWRB?=
 =?utf-8?B?aTVXWndpZ1ZibkdGUTNWb2R5OExrK0tyazgxSEgyck90OTFIeGlMS1hwOFdx?=
 =?utf-8?B?WC9Ta0tYM3JkUnJQUnVVdTJva3Vlci9aUGs4MnRSbFBvcVl5aG81bGE2QVpm?=
 =?utf-8?B?dE9LNVhOVXZyT3ROMFYxbGp4bEV2UlRrUzA0TVdkL0pTdUdSVW4xTmhZNFBa?=
 =?utf-8?B?Y1d1RkxsY2haTGk0eTZucE5FcXo1L1VSTWh2aHI4OUJJYlR6NDVycWVmYitX?=
 =?utf-8?B?SHBmMC92OWErMml0ZnVGNUtHd2JDTzBFdHkxb0JadkVxUUtwK283dnE0RkZO?=
 =?utf-8?B?WWpzUkNjUlp2U1VZSWVJSExZdysycHNFbS8zczk0WjZTRmFFK24vRWY1RWI4?=
 =?utf-8?B?VTdpVlRRRTE4ekwrWTJXWUR1QUtBYWhJRmEwb0g5MHRUUGxsVFRtRGo3YzhR?=
 =?utf-8?B?R1R4ejR2dzBIMEIvU201aC9lMStNMEtvMWhRdWFqTEl0VUc5dnNWWENqNjNl?=
 =?utf-8?B?MVduQkJZbXEzOTVsei9teGxyU2lQWU84RW5ZZC9MNFF1L2pBSjNlQndwSHZq?=
 =?utf-8?B?cmN6SGltWEJ6YW9wYzNxR3RMaklsUnVycitENDYvQ3NhMGFNQmljY2QzYWli?=
 =?utf-8?B?dWZHK0ZMM3hSckFWa0hPVlBuNU5JbVBKdnNscFpoUk1yejhjR1c3R2g1KzZ2?=
 =?utf-8?B?RGpiekRweTh5bk96aUZCaHUzWmFRZDBHK0NUeHdOV0JGZUJiSit2ZFNUbFl2?=
 =?utf-8?B?ZUg0NDFmcjVZSHJ2bWdmNmFreTNyb0RKNHkzSlZwajZMTlREVEJMNGNidjhQ?=
 =?utf-8?B?Q01scEZ0eTFGcGFtcEZZUFNyandXNlFZbG12ZUY5UU1SREtYemZETENtVEor?=
 =?utf-8?B?MVc5VWVVRWNWeERqK3ZLTDJHM05IdkQyUFh1Q28zbGRTbGlkQU92ZTJKNytJ?=
 =?utf-8?B?azJUcjVxcmIrSFN4cURDVUR5bGE3QzZBZzlGMEdBWHlKaHR5T0dwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lnxZ2weIBBLy4x5Ad3o7Ua9oUB7kqSsRcspn2XP8JDCIoeL/FIwhb/ESwXKYV8JREY1bwgSH75QAv273mshq8+a7z6+Hm4+IkyMfxPECnvwjIpMRPZl3vRC7JAi/pLkke/+7nfVip+47B+nxOg9tjcEVq7xzCd4jGMszjjqNtt4PYxrW/r3urQ7SRDJaGdyNa+O/YIjDCDbzzGlL2RHaC1hFUJFB03HBprAk727qt/rLhN3PmvY8HOdw9HyWqOTKvxVsPmv5FlA+U5CpEQs4OWI1DuVFazomqc4bvhkIVC4YUF9UGE3sN6um9hGhUi/SevdhRnN/K20EJmw9OCgFwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0502a04-90dd-496a-d4a3-08dea62f8abd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 20:40:25.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfXrFcMCDIMETxDM0gqSOYjtVyjPitGNLv0Fp5/KEDjJTcK/aTEBP84JwGCifcsf87W0xCroPENWpRhWz1gjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
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

T24gV2VkLCBBcHIgMjksIDIwMjYgMToyNiBQTSBTdHVhcnQgU3VtbWVycyB3cm90ZToNCj4gT24g
V2VkLCAyMDI2LTA0LTI5IGF0IDE5OjIyICswMDAwLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+
IHBmX21pZ3JhdGlvbl9tbWlvX3NhdmUoKSBhbmQgcGZfbWlncmF0aW9uX21taW9fcmVzdG9yZSgp
IGluaXRpYWxpemUgYQ0KPiA+IGxvY2FsIFZGLXNwZWNpZmljIE1NSU8gdmlldyB2aWEgeGVfbW1p
b19pbml0X3ZmX3ZpZXcoKSBidXQgdGhlbiBwYXNzDQo+ID4gJmd0LT5tbWlvICh0aGUgUEYgYmFz
ZSkgdG8gYWxsIHhlX21taW9fcmVhZDMyKCkveGVfbW1pb193cml0ZTMyKCkNCj4gPiBjYWxscyBp
bnN0ZWFkIG9mIHRoZSBsb2NhbCAmbW1pby4gVGhpcyBjYXVzZXMgdGhlIFBGIG93biBTVyBmbGFn
DQo+ID4gcmVnaXN0ZXJzIHRvIGJlIHNhdmVkL3Jlc3RvcmVkIHJhdGhlciB0aGFuIHRoZSB0YXJn
ZXQgVkYgcmVnaXN0ZXJzLA0KPiA+IHNpbGVudGx5IGNvcnJ1cHRpbmcgbWlncmF0aW9uIHN0YXRl
Lg0KPiA+DQo+ID4gVXNlIHRoZSBWRiBNTUlPIHZpZXcgZm9yIGFsbCByZWdpc3RlciBhY2Nlc3Nl
cywgbWF0Y2hpbmcgdGhlIGNvcnJlY3QNCj4gPiBwYXR0ZXJuIHVzZWQgaW4gcGZfY2xlYXJfdmZf
c2NyYXRjaF9yZWdzKCkuDQo+ID4NCj4gPiBGaXhlczogYjdjMWI5OTBmNzE5ICgiZHJtL3hlL3Bm
OiBIYW5kbGUgTU1JTyBtaWdyYXRpb24gZGF0YSBhcyBwYXJ0IG9mDQo+ID4gUEYgY29udHJvbCIp
DQo+ID4gQ2M6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4N
Cj4gPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+
ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LjYNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9taWdyYXRpb24uYyB8IDggKysrKy0t
LS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3Bm
X21pZ3JhdGlvbi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWln
cmF0aW9uLmMNCj4gPiBpbmRleCA4N2ExNjRlZmNjMzMuLjAxZmUwM2I5ZWZlOCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMNCj4g
PiBAQCAtMzg1LDEwICszODUsMTAgQEAgc3RhdGljIGludCBwZl9taWdyYXRpb25fbW1pb19zYXZl
KHN0cnVjdCB4ZV9ndA0KPiA+ICpndCwgdW5zaWduZWQgaW50IHZmaWQsIHZvaWQgKmJ1Zg0KPiA+
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSkNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAobiA9IDA7IG4gPCBNRURfVkZfU1df
RkxBR19DT1VOVDsgbisrKQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVnc1tuXSA9IHhlX21taW9fcmVhZDMyKCZndC0+bW1pbywNCj4gPiBNRURf
VkZfU1dfRkxBRyhuKSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZWdzW25dID0geGVfbW1pb19yZWFkMzIoJm1taW8sDQo+ID4gTUVEX1ZGX1NX
X0ZMQUcobikpOw0KPiANCj4gR29vZCB0byBnZXQgZmVlZGJhY2sgZnJvbSBNaWNoYWwgV2EvTWlj
aGFsIFdpIGhlcmUsIGJ1dCBJIGRvbid0IHNlZSBhbnkNCj4gdXNhZ2Ugb2YgdGhlc2UgTU1JT3Mg
ZnJvbSB0aGUgVkYgaW4gdGhlIGRyaXZlci4gQXJlIHRoZXNlIGV2ZW4gZXhwb3NlZCB0bw0KPiB0
aGUgVkY/IFRoaXMgc2VlbXMgdW5zYWZlIGZyb20gd2hhdCBJIGNhbiBzZWUuLi4NCj4gDQo+IENh
biB5b3Ugc2hvdyB0aGUgZXJyb3IgeW91IGFyZSBzZWVpbmcgc3BlY2lmaWNhbGx5Pw0KDQpJIGhh
dmVu4oCZdCBzZWVuIGEgcnVudGltZSBlcnJvci4gVGhlIGlzc3VlIHdhcyByZXBvcnRlZCBieSBz
dGF0aWMgYW5hbHlzaXMuIFRoZSBwcm9wb3NlZCBmaXggaXMgYmFzZWQgb24gY29kZSBsb2dpYyB0
byBhZGRyZXNzIGl0Lg0KDQpTaHVpY2hlbmcNCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4g
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZvciAobiA9IDA7IG4gPCBWRl9TV19GTEFHX0NPVU5UOyBuKyspDQo+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdzW25dID0geGVfbW1p
b19yZWFkMzIoJmd0LT5tbWlvLA0KPiA+IFZGX1NXX0ZMQUcobikpOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnc1tuXSA9IHhlX21taW9fcmVh
ZDMyKCZtbWlvLA0KPiA+IFZGX1NXX0ZMQUcobikpOw0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAwOw0KPiA+IMKgfQ0KPiA+IEBAIC00MDcsMTAgKzQwNywxMCBAQCBzdGF0aWMgaW50
IHBmX21pZ3JhdGlvbl9tbWlvX3Jlc3RvcmUoc3RydWN0DQo+ID4geGVfZ3QgKmd0LCB1bnNpZ25l
ZCBpbnQgdmZpZCwNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZ3RfaXNfbWVkaWFf
dHlwZShndCkpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKG4gPSAw
OyBuIDwgTUVEX1ZGX1NXX0ZMQUdfQ09VTlQ7IG4rKykNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIE1F
RF9WRl9TV19GTEFHKG4pLA0KPiA+IHJlZ3Nbbl0pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbW1pb193cml0ZTMyKCZtbWlvLCBNRURfVkZf
U1dfRkxBRyhuKSwNCj4gPiByZWdzW25dKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgZWxzZQ0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0gMDsgbiA8IFZGX1NXX0ZM
QUdfQ09VTlQ7IG4rKykNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIFZGX1NXX0ZMQUcobiksDQo+ID4g
cmVnc1tuXSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV9tbWlvX3dyaXRlMzIoJm1taW8sIFZGX1NXX0ZMQUcobiksDQo+ID4gcmVnc1tuXSk7
DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ID4gwqB9DQoNCg==
