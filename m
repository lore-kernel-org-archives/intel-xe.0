Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AC7CD5BC7
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 06:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48B910E3E0;
	Mon, 25 May 2026 06:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0Yd0O6B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2FA10E3E0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779689873; x=1811225873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RCaR+BjrZw/bZPS2ui7glul5ITpVcNrnk2g4nZbJO+g=;
 b=f0Yd0O6B7mlJDxWjum4P6H39rTvKB7YTLyOn6OYmzAeZL7c/BwWsyroG
 jfIg93b7tViR13gTNQhQlGXYsRPSlEaWTSw/VpNrOl29LhtQbGYVYhiea
 QlIt8DNqXHxbfKkgCKCQ92/l6shw2O+joHAQNQblsD1t13oiVerBYUDa0
 ClH36LEl5CaZlrTUeqof+LCvV8e6SxYNTz/QS01xbG5QdIGnS0l6aaK+s
 2poeRykzGZj+xmz2WgZA4l/dmx7MWrsmlCljJlrmb7hX6x/64LfzZbJ8t
 t9IO/yT3AzkpBN3zpt/tc3ryaFLUVhX1P86zbnyixhUWJhkfi2R7TGC1Y g==;
X-CSE-ConnectionGUID: ZHLdvlm+Tj6grBtSTKLLqg==
X-CSE-MsgGUID: QLIXYaKwQfyFJsBPDpYJJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84129493"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="84129493"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 23:17:52 -0700
X-CSE-ConnectionGUID: K20Y7GimRLetNIWzSNLamg==
X-CSE-MsgGUID: 4/3xnKobRcekYuN1SRCxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="235154781"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 23:17:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:17:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 24 May 2026 23:17:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3Il5Pbw2E+3G4q0TEjVZXLcvPYYugo4/r0i/eUzFcXu54+N+6v1nsrOcMxOfiVMEWdERhudHIRtFlX8fTf3aYrKFa6Fpr6AOOV3/9flDc6T1SP4gLCfKbpOOV1Gz9BO9BFyYFnY/7UzvPT7s0MBgK00AU4DIDOY0OBecXg7YaPkoHYsxozflKgGW5km0iGRcGFqZVrS+Qq6fku/fu1vOx0wSz/mpkCVmd8UhwN1u4rWvkXimaIj3xcMdnMtOE24quINBaEz7VbLXGM8arIA2mziBl1YzCMq6wDfkbwVE868fwvN8CBviZsxZ2+vVFDVJ/VcRXHdL6xtJg26AMjMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCaR+BjrZw/bZPS2ui7glul5ITpVcNrnk2g4nZbJO+g=;
 b=PGnNnn46ZrQiIjXxjtFkSDR5RjnIF+UhUkCqeJpkZXomHxPPTkC9GlJ5PbueMmto16UzSBIX+oz6CNB9sIU+oRNRXcdnPYQlJXednC+C1a1g/zyCMjXt0QYZHekVfsoIZ/s4Pui+gVRTf0CrkyTuhggbGWcs9REqDptVVNYsxK9WWQnCWEFb3w+vDbdiHUexKNlzCBUaLVs1/oAaNWyoYNiAZAeHKbt0ZENm9GaiTmirf2D3zA8JI/FBvBExqomJdX7JbRjtBGhu0uI2a22ZUkJ5j+CffSWq+2FluJAjaynQi0TbKjgNBFTl1ALOghWwpD6fY2mmxB6hoUWtIVEUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 06:17:14 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:17:14 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Muqthyar Ahmed, Syed Abdul"
 <syed.abdul.muqthyar.ahmed@intel.com>
Subject: RE: [PATCH v1] drm/xe: Fix decompress validation in
 vm_bind_ioctl_check_args
Thread-Topic: [PATCH v1] drm/xe: Fix decompress validation in
 vm_bind_ioctl_check_args
Thread-Index: AQHc6/69HozyLIpK90qK4qSihBDAi7YePJoA
Date: Mon, 25 May 2026 06:17:14 +0000
Message-ID: <SA3PR11MB811814B5E1EDA1E26E56020ED00A2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260525044239.83893-1-pravalika.gurram@intel.com>
In-Reply-To: <20260525044239.83893-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|IA1PR11MB6194:EE_
x-ms-office365-filtering-correlation-id: 54d1bb59-f283-4b8e-3cb2-08deba254371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|11063799006|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: qGLmEXSisUiMmuXvqfwhXmTzWdOCqusFpgz25MAVsZEuq7NYfb4DiOFpoADPLVonSMfJtvyWqwoDS7vfVDo+EPA8XnAqZUhqQYUr3ujDgptKuLJ6CppApFAnxhlQ18fVjq7Mx7oRiMBfENmlflmBR5pe3Lvnf99WFKPyXbbZ7RYx62cDVkl76DCf9Haw36ztOpS2JmK5ron8lKthTyL2THN2pas/UJYDyyx0KLvoGIp1HAWXBUfpRWmSaMIv6ogq5GhopPzlPQT5KnQoyf+AD/qhntC1NFj9gAk9N5aXextLQS+wpQRc5wKECS40SX2JBc52VfneR52QCa2cAOy0XxhHVCHehISid57LqHoW54u3r6SGfRbx3rD8p4M36umqiMLSGE7FNAZuhfOAV8vcWOmONMFLzxjqRrViNCKAwbjkn5G7rlj0IIWJpQTQ9oi8xZPVi2cO8IUlJNeRN88YB3uoj8KhMPduphbboZHs69yvE5Pa8jUjR+EOyHg7iBPMTw7lyYFpi5iEOjW1L6A4qG7y+TtLNl1XDBvHbvrNEJWpulF5EGjf5pNO+YsSxrGgJ+9qUwjr43ngpKS31ULfTIXWdUWHqakDysgZ8AnAilF1qO9Gvz+qzDfdhKUZ64pq7wQRKp85qfKxES2kai/+/1ea6ENrAUdiX0bxuMvW65Bmd53rFk+6t3UdVmVmcVvPozCXVjGt+l16WGOy2PHoJTzkh+wgtSTfMkQw+9eeQDOZMhrmNbYbvSa7nVpL5QO4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2ZiQ0g1ZVp5RXBzTlgvVTFqQ2EvZUZRSnc4cENxQUVTR0pMUm1RVkJwTWd4?=
 =?utf-8?B?eUpwTGViYUpPcHZjREJnaTl6UjhpUjNqSmNTOU1FbGoxeUwwUDI5bjFNbXNy?=
 =?utf-8?B?ZXBRenV4QlhHTmxKSkd1cVRMY3dabi9KR2tzSkJXejBzclFyU2Y3VlNGQ3N5?=
 =?utf-8?B?a0RvU3BVWWdNT2Vob1R0T3JLYU9XYzBhVWQrZDN2N2JVQUJjV1RZYXk3bHpz?=
 =?utf-8?B?RWhsRWJWM0RHRHFadnl1R1IrVkRTeWJMbSs5REZUN1Q0UGtiU2tLNUFkNDRy?=
 =?utf-8?B?ZlE5K2tyYk9FY2ZxZVBrTGxIb3VVbnpJS3NiOU8yL3d5ZE1OUG5zWmVNN3d2?=
 =?utf-8?B?OTZXS09vUWhJWnlTOWJuaUV1ODRYZW1zdHE3Rkc5ZElCaFMzbnVGeXM1cVJ1?=
 =?utf-8?B?MTg0MjRZaXlFdGk3ZkNLS1ptZmo1U3RlN2JUMk9TZUp2bzMweXZKVUo1TnBM?=
 =?utf-8?B?N3ZDNTBrQjRCTFNKQjZIMTNDS3ViNFoyLzRFdGl1RzFwVElncEt3LzhITEJr?=
 =?utf-8?B?MmdxWmlxcmRIUEZVREpVNmxEYVpTbDFmMDM3b0xUWnBlQlJsU0U3L3h6STc5?=
 =?utf-8?B?WGpqZlhkMzVEM3NLWVoyUFYzSS9GSE9Ua1ZvZUFLMnBJMndrdFNKZlo4dVZo?=
 =?utf-8?B?OU1ISWN1clN5bjVOM0ZlcFpGNEpjOXlpbVZQN21NaGhpSXhwSUlCQnFtNkNj?=
 =?utf-8?B?L0prMnA5K3ZrSG5oRHlLVmpMdU1FaEloRkNOcDRiNlZndlFsSXkrM0tEdWFo?=
 =?utf-8?B?SlowVzJrZEs4U0drakd2L2h3ejlnTys0N3F6N092bDNhcEE3azk5dGx6Vzlh?=
 =?utf-8?B?WEU2VmN2Z3dpcUVRR1ZOTE5XQ1QyVXJkVVl2ODN1ek40ajZGK0ZEdTJXVFFH?=
 =?utf-8?B?RTF1ZUpzVlZsbU9TSWlJOEtMcE9PQTBoM2t3SVNLQ2tnanRxTGozYWtKZ2lY?=
 =?utf-8?B?NGtIVjNlanpkSDd2Qit4TE1uTENJTzM5b1htUXZPa1FqMkRSWURJTXRkUkNh?=
 =?utf-8?B?VU1IbXFnZG1Tc3h1WHNlbGQ3MHBEQVF1SUthSTdXQWw3VFp3OVErOWpkTC9E?=
 =?utf-8?B?NWdEMHhNdmRyaHNzOHU4ZU42UjYwQ2VZVC92YzhjeTVGNHRVcXQwNy92TXZF?=
 =?utf-8?B?T3JFaWNWT2M2WmRJMXFPRldFQlAvOG1BUHhiMlJJZVR4cWJGTGNPVFR0NHJB?=
 =?utf-8?B?QkxHQjJvSHdtRkU3Zm13a1hKRy9ONkwzZ08wb2Y0NlRWRE1vZ3cxQmZJOFM3?=
 =?utf-8?B?UVhWYksxclZDSCt2MDlnaUdBMFB3dEdFb2VVYURscXFhOXN5RnBmbkpNVXVG?=
 =?utf-8?B?UGFvUmRRUVdnQlhDbHgrQXQwUE9Mak9MdmgrOGNYWm9xdlRqRE5sV0Z1cTNm?=
 =?utf-8?B?S1VmV0JGbGNrQ0xqSVhNLzFTc211ejhPN2VGdjl0RGdGeWRWNW5NREpkSFox?=
 =?utf-8?B?U0ZTVDhSU2N4UjB4YjMwZUNRdzkwTlo3ZzFpRGJaVlIydFA3RmxpdHphbUli?=
 =?utf-8?B?UDJCakpuNzVYdHFKSlV3QTg1V3lCam1SQ2duclNYNmZzUDNzSTY2RXhacTdC?=
 =?utf-8?B?ai81N1dweWEvZ2xaOW5WSXFlMG9HU2RsbGovQlY2aTkzdUVZMUVhbjlhbjRu?=
 =?utf-8?B?U2JsWUlyTjl0WU5CUVFYS1RZYnBDTlF0ajBaMG5Ic2w2ODd3MWdteW1FVVlG?=
 =?utf-8?B?RlRGZVpjM0RpMFZOcjIxUm01Qm1TZnpCQWl6dWx5dnZSSWFHZVl5THV1RFMr?=
 =?utf-8?B?TWhkRDViQXJxTnRTSGxjOGpUK1dVNWM1eldxdHl3M2FiN1ZMbHBHR0RnMnVE?=
 =?utf-8?B?T0NZU25jUFpZd0YvSmZjRU83cERybThKQUI2QjhHL0ozRzdnUnFZU01qcFRh?=
 =?utf-8?B?M2ttaThyVHNPd3JvOFBKWnIyOWZINDJ1ZnRxWkw5QW5DQ0FRejZjWlAwTHhi?=
 =?utf-8?B?aXExT0ljQjRqVTl5Ky9BeUNad29Ea2xocU15U3ZqWWdxQzYwRHZ5ZlBLNmFN?=
 =?utf-8?B?M2crNGJuNzlaV2dIOHZGZUZ3WHFucnpWdzZjTGFZazJXQVVzNFV2WEtUWmg0?=
 =?utf-8?B?SkRJNzNUeUhtNm5JelZ6V1BVK3RqNlRPM2NRRXRpNFVuRUYwdTdkV3U3TEY3?=
 =?utf-8?B?SWtFTGZmeUEwVUpJOEhYRit4WmZ3VHFBMXI2bUVaQlFrakFlRjVWV2xuK0E2?=
 =?utf-8?B?YVJpR1FDL2QwWmszZFRJSzZ4WUhWaFhqMjVxb0h3VzJiQS9PL1lDVkZRTS8r?=
 =?utf-8?B?U0pFT0VGZHZSd0FYWHQybmZpLzRYdEhoeDUzaXZrUHRmNTUvb3BlVEt2bDNm?=
 =?utf-8?B?czVRSlhnVWxMTWg2VmxIS0RpMFpQOXVzWnA5WkttcTVWb2dBWHgydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pHLQPATtB81Qo8LiAJdFTPvpxKpvh0Asoh+9aA+dqURdChLgfEY/VFHZNCd5dazQZfTjv585OdaXYEZ0zwSvjfAu+/UlRK4iXMcmS+wirjCPSFQYDGx56n6F2EqcsRq7cJ6XSa/EqsvqR6XRaBXHqIQgWPXHlHCkZqPr5dTkYey89bmvKrCp7qOCxmgotTYzBMGSYjJBgc7BBzwjjk/BsclqdXbAQo0WSX7/GSeYg5vmtMVx5KuwjGz/lsh4DOynvzxFMAj24SOX4Z+dcynvkEuiCdEycZrLsStHkAGk0FY3XtMh/XJ4w8q+u+Np+inZDwfOShiLiV2lY3NEBwkipQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d1bb59-f283-4b8e-3cb2-08deba254371
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:17:14.1134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/l3TMr/pWcJodt5nqE2Tqa5zt2EY1gJpWtkq2by2UnzznFTx964dnsIVnpcnjkBx1z8XTMfuWzC/iP1NqJFAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VycmFtLCBQcmF2
YWxpa2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAy
NSwgMjAyNiAxMDoxMyBBTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+OyBHb3Rl
LCBOaXRpbiBSDQo+IDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
djFdIGRybS94ZTogRml4IGRlY29tcHJlc3MgdmFsaWRhdGlvbiBpbg0KPiB2bV9iaW5kX2lvY3Rs
X2NoZWNrX2FyZ3MNCj4gDQo+IFRoZSB2YWxpZGF0aW9uIGxvZ2ljIGZvciBkZWNvbXByZXNzIG9w
ZXJhdGlvbnMgd2FzIGludmVydGVkLiBJdCB3YXMgYWxsb3dpbmcNCj4gZGVjb21wcmVzcyB0byBo
YXBwZW4gZXZlbiB3aGVuIGNvbXByZXNzaW9uIHN1cHBvcnQgd2Fzbid0IGVuYWJsZWQgaW4gdGhl
IFBBVA0KPiBpbmRleCwgd2hpY2ggY2F1c2VkIHRoZSBHUFUgdG8gdHJ5IGRlY29tcHJlc3Npbmcg
dW5jb21wcmVzc2VkIGRhdGEuDQo+IA0KPiBNaXNzaW5nIG5lZ2F0aW9uIG9wZXJhdG9yICghKSB3
YXMgdGhlIGN1bHByaXQuIE5vdyBpdCBwcm9wZXJseSByZWplY3RzIGRlY29tcHJlc3MNCj4gd2hl
biBjb21wcmVzc2lvbiBpc24ndCBhdmFpbGFibGU6DQo+IC0gaXNfZGVjb21wcmVzcz0xICsgY29t
cF9lbj0wIOKGkiBSRUpFQ1QgKHdhcyBhbGxvd2luZyBiZWZvcmUpDQo+IC0gaXNfZGVjb21wcmVz
cz0xICsgY29tcF9lbj0xIOKGkiBBTExPVw0KPiANCj4gVGhpcyBmaXhlcyB0aGUgZXhlYyBxdWV1
ZSByZXNldCBzdG9ybXMgd2Ugd2VyZSBzZWVpbmcgZHVyaW5nIFZNIGJpbmQgb3BzLg0KPiANCj4g
Rml4ZXM6IDJiNDg0NDE5NzAwYSAoImRybS94ZTogaW1wbGVtZW50IFZNX0JJTkQgZGVjb21wcmVz
c2lvbiBpbg0KPiB2bV9iaW5kX2lvY3RsIikNCj4gDQo+IENjOiBOaXRpbiBHb3RlIDxuaXRpbi5y
LmdvdGVAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2
YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgaW5kZXgNCj4gYjAxZjMxZWQ0NDE3Li43NTgxMzhkYmNj
OTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0zNjc3LDcgKzM2NzcsNyBAQCBzdGF0aWMg
aW50IHZtX2JpbmRfaW9jdGxfY2hlY2tfYXJncyhzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSwgc3Ry
dWN0IHhlX3ZtICp2bSwNCj4gIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgb3AgIT0gRFJNX1hFX1ZN
X0JJTkRfT1BfTUFQICYmDQo+ICAJCQkJIChpc19kZWNvbXByZXNzIHx8IGlzX251bGwgfHwNCj4g
aXNfY3B1X2FkZHJfbWlycm9yKSkgfHwNCj4gIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgaXNfZGVj
b21wcmVzcyAmJg0KPiAtCQkJCSB4ZV9wYXRfaW5kZXhfZ2V0X2NvbXBfZW4oeGUsIHBhdF9pbmRl
eCkpIHx8DQo+ICsJCQkJICF4ZV9wYXRfaW5kZXhfZ2V0X2NvbXBfZW4oeGUsIHBhdF9pbmRleCkp
IHx8DQoNClRoaXMgcGF0Y2ggaW52ZXJ0cyB0aGUgdmFsaWRhdGlvbiBsb2dpYyBpbmNvcnJlY3Rs
eS4NCg0KVGhlIGN1cnJlbnQgY29kZSBpcyBjb3JyZWN0IGFzLWlzOg0KDQogICAgWEVfSU9DVExf
REJHKHhlLCBpc19kZWNvbXByZXNzICYmDQogICAgICAgICAgICAgICAgIHhlX3BhdF9pbmRleF9n
ZXRfY29tcF9lbih4ZSwgcGF0X2luZGV4KSkNCg0KWEVfSU9DVExfREJHKCkgcmVqZWN0cyAocmV0
dXJucyAtRUlOVkFMKSB3aGVuIGl0cyBjb25kaXRpb24gZXZhbHVhdGVzDQp0byB0cnVlLiB4ZV9w
YXRfaW5kZXhfZ2V0X2NvbXBfZW4oKSByZXR1cm5zIHRydWUgd2hlbiBYRTJfQ09NUF9FTg0KKGJp
dCA5KSBpcyBTRVQgaW4gdGhlIFBBVCBlbnRyeSwgbWVhbmluZyBjb21wcmVzc2lvbiBpcyBlbmFi
bGVkIGZvcg0KdGhhdCBwYXRfaW5kZXguDQoNClNvIHRoZSBjdXJyZW50IGxvZ2ljIGlzOg0KICAt
IGlzX2RlY29tcHJlc3M9MSArIGNvbXBfZW49MSAoY29tcHJlc3NlZCBQQVQpIOKGkiBSRUpFQ1Qg
CSAgICAoQ29ycmVjdCkNCiAgLSBpc19kZWNvbXByZXNzPTEgKyBjb21wX2VuPTAgKHVuY29tcHJl
c3NlZCBQQVQpIOKGkiBBTExPVyAgIChDb3JlY3QpDQoNClRoaXMgaXMgdGhlIGNvcnJlY3QgYmVo
YXZpb3IuIFRoZSBERUNPTVBSRVNTIGZsYWcncyAgcmVxdWlyZXMNCnRoZSB1c2VyLXN1cHBsaWVk
IHBhdF9pbmRleCB0byBzZWxlY3QgYSAibm8tY29tcHJlc3Npb24iIFBBVCBlbnRyeS4NClRoZSBL
TUQgaW50ZXJuYWxseSB1c2VzIHRoZSBjb21wcmVzc2lvbiBQQVQgaW4geGVfbWlncmF0ZV9yZXNv
bHZlKCkNCmZvciB0aGUgQkNTIGluLXBsYWNlIGNvcHkgKHJlYWRzIGNvbXByZXNzZWQsIHdyaXRl
cyB1bmNvbXByZXNzZWQpLg0KVGhlIGZpbmFsIG1hcHBpbmcgdGhlbiB1c2VzIHRoZSB1c2VyJ3Mg
dW5jb21wcmVzc2VkIHBhdF9pbmRleC4NCg0KV2l0aCB5b3VyIHByb3Bvc2VkIGNoYW5nZSAoIXhl
X3BhdF9pbmRleF9nZXRfY29tcF9lbiksIHRoZSBsb2dpYw0KYmVjb21lczoNCiAgLSBpc19kZWNv
bXByZXNzPTEgKyBjb21wX2VuPTAgKHVuY29tcHJlc3NlZCBQQVQpIOKGkiBSRUpFQ1QgIChJbmNv
cnJlY3QpDQogIC0gaXNfZGVjb21wcmVzcz0xICsgY29tcF9lbj0xIChjb21wcmVzc2VkIFBBVCkg
4oaSIEFMTE9XCSAoSW5jb3JyZWN0KQ0KDQpUaGlzIHdvdWxkIHJlamVjdCB2YWxpZCB1c2Vyc3Bh
Y2UgcmVxdWVzdHMgKE5FTy9Db21wdXRlIFJ1bnRpbWUgcGFzc2VzDQphbiB1bmNvbXByZXNzZWQg
cGF0X2luZGV4IHBlciB0aGUgdUFQSSBjb250cmFjdCkgYW5kIGFsbG93IGludmFsaWQgb25lcy4N
Cg0KSWYgeW91J3JlIHNlZWluZyBleGVjIHF1ZXVlIHJlc2V0IGlzc3VlIGR1cmluZyBWTSBiaW5k
IG9wcywgdGhlIHJvb3QNCmNhdXNlIGlzIGVsc2V3aGVyZSB0aGlzIHZhbGlkYXRpb24gY2hlY2sg
aXMgd29ya2luZyBhcyBpbnRlbmRlZC4NCg0KQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCg0KLSBOaXRpbg0KDQo+ICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsICFvYmog
JiYNCj4gIAkJCQkgb3AgPT0gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQICYmDQo+ICAJCQkJICFpc19u
dWxsICYmICFpc19jcHVfYWRkcl9taXJyb3IpIHx8DQo+IC0tDQo+IDIuNDMuMA0KDQo=
