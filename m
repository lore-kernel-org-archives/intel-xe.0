Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1850C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F210E49E;
	Wed,  2 Sep 2026 08:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViPx+J4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229D88EFE;
 Wed,  2 Sep 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788338521; x=1819874521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7UYTl0R9k7PAzBLB+V675rCo8XMw4IBfgD0Kn66ulVo=;
 b=ViPx+J4WvTouol4smTzkATYCqsO3sDSGvDdjPV++EY9TfEy0E1B5mqb+
 c95/CXr7Hg6toSmuim/h1xNqkIENFIV/dkCRjfyirmHgHW3KrmejzULvs
 Qd4LUqaB+cOJHwONZIiY4rhp6wwXTsEbXPypRUjwO/Ov39KoG7F9YOxS3
 ld3p6oBBfDlwBwEVO8oFTiUuU/WJ8zHHSwNh0GcbX2kAcIjDW4mCJpY25
 Uvda9e6iHgriY4NbZtuFb9zVSH51Kti8yxBoSlwNwlflvhjOgUUPg4jOK
 bu4d4+QxaeN6niHSQC8pUgYd5e+yQ8BYZeQ9SBt05TdXTnnahY8dTcJhz w==;
X-CSE-ConnectionGUID: Er1NVl4lSq60xsI8IVTZFA==
X-CSE-MsgGUID: UhHsnMDgTXOX1dFIlO6hDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100302124"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100302124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:42:01 -0700
X-CSE-ConnectionGUID: 0ZZ+pbe0SW6QhPEqn6xEBQ==
X-CSE-MsgGUID: ZoN53FSySOqAp3tYqnGMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="267573412"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:42:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:42:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:42:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9QdpnPSCQKjRN5nk//tidbQ/QlisgGORvlpSyMLie6YEeVgdG7mp2eCkEtl/snJDN6wgsItNuaQs3Mn1WSlTjFc3GFrM3RYeOwzG/1r1AmkMjKumsVQamIvQaBq7E8gWwYV3t/Ih4yifa3rf00Zolc+VmVxacHBpBW5OWveLoXxFrWPFxlMZ2fkRA+1eFsq0cwn732K8pCfAusAo0eE6bMAaZLVnesTzBlPKiwrtb2eYcNuu/Nb1G1zatW9xtW53pFs77tJEJEZk8CyW3AF/P0lFs1p6XAOkzNOqlBMDfLj5Ly5wwYeCRZ47UwiHZev2a5Ny/Z4Ed1IEgoQcT+UVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UYTl0R9k7PAzBLB+V675rCo8XMw4IBfgD0Kn66ulVo=;
 b=ykdAXkcbcb9ELmNulVXyjhu0Tw9DAofUTdlTaVqjOVbeSyzfp1TaZl3lcRGiaWYrXhcPotg+VCbv2Srfqyb3AQR/qApqJKjNuUA+2pNPl5SXo5IPz6dqFo5bZBTV7j4gOtSFXOOR2rtg1skrfFHmO/P4kS3PvZ+YwcVc1OtVU3BcRle1S40bNTm3HMrHyN1LzMt+6c+bsNHmxf/LXYG/w9CmFbcZ9WuG7Ez4eF9uFuNwlnIvy80RMDXl9nYtZftmIgDXk3/AKDcCfrTtxwU5Hpyo6j38JzoW4+6KGgP60amNsIdno+g0zZ6Os0j9t3S3sRir2/MWpr4iA+iIyy42DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 08:41:52 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:41:52 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
Thread-Topic: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
Thread-Index: AQHdNFm1X7IpLkzDMU+O/O+9kE2/Jba7BRaA
Date: Wed, 2 Sep 2026 08:41:52 +0000
Message-ID: <dfbac2e7a2a2be4bb2d7bad8aabdd0b24e88cfb4.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-9-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-9-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB5946:EE_
x-ms-office365-filtering-correlation-id: 2d240f06-69cc-4b5d-2ea4-08df08ce093b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|4143699003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: d52gxaO1wGSVEiyYMZJ/yZT4n0tIujGbv/5ZWGhLS3WSZ3n0EVV4FnpKSJwRR+c1/KVhip3c27Qt9DLBe8uoCnIIi98hmOUf6VkQ3aEFP6vP7mqr85t1L01ONs0bO2IeSK3mnBhbKqxh2m+mK6d8RqCvTgEWL4FCWomV6Ykk/xpw3XRhs6eFgFZtg3hRymOkpLU3iSUhx5sKsJJCYyojXptZsKReD8LEIW3rI209EknhoAEzc7nwfeCN3hN0WAPguqx1Af7M7ZsDlQhQab1tx986JDiAlelek7em8SNfFd5yQUUW5YkTT/n0fvPRhlCTr2PRYSB5ldrKv5yIXsAv0VN2BrySTYPfVTJgzOfQZbarqtuHGbzRcmoBtz7X0DaWsjcgdr8PHDpRQbMSpSUxX2N4S11dJ3UZcsHHTNvVvwnEOiYW/lpmVdKBIUoF2ZFghu4tZMTn3sCGku8D9jEqy9Vz1xbHELke3BidFN/q9MP8pUj4uHaYRtB8OVUcxzFFKU82bmJ5EettVFcXb4x/q/9clf0vNyWlxIrCexEQdctAVgOmTjE1CdT+IEiWDKZQswfGjRaGCOTX2wVv0U0/oDI7c2edyDCbTpIM3FzmAkyZMQqD/sh5pY1Wlxv1t34+EHwy3O/LWMWZsxC6Z1Wvc5DzEYeXRiDLVBLtGvHVO4TTi+kqJ0W624RQMq1XHjKC+QtJGpBNqKijs1vIANMRTMu6raakPWaAfb+7nRVid84=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1gyYUhOa2N1RkdZRUs0TmlPZEZ4cm9abUtJMnEwSnFxNCtCcEZ6ZXpROFpM?=
 =?utf-8?B?S2p4ZGZSOVoxOUxNZ1crSXQ1cGdnSXdnWml3bEpnd3JKTElodzB3ZlZXNDlW?=
 =?utf-8?B?VzJxSWcreEdNdU9hKzVxT1ZqaStzNlcvWkQ2M2VRZ3hjdG5halFIdi9FQmh3?=
 =?utf-8?B?enRrdXNUU3l3NFVxRXFqNzBLZTR3M2hzOHBhZzlSMkVjWmFxSWp0Uzg0c3Ix?=
 =?utf-8?B?djRaMWtRTHBNNkVFZW1va2J3VGZXbFpDejhRTllZQUVSeVNLZDRvMGpoNmxG?=
 =?utf-8?B?Smx3LzFjbHJHbk5BYy93aGh1LzZuWFE2MlZKV2VLY2NVTzd5TUpFWk1nOEVt?=
 =?utf-8?B?M2RaemRWMmRWaVluaVRyYVhPRVJGUDdzMmIzR1FSdEc0SWhoS05SUGhaNURJ?=
 =?utf-8?B?WkRGN0llV1lLQy9WSHBYajNYZGRaZnpORDFrcHp3QjJRb1NkMFNFa1ZPakNO?=
 =?utf-8?B?M3Noa3JSTXZ3SkZlb2VwVVdZbHgwYTVEU3F3QnFwYVYySUIzYWtPQTFuNlJH?=
 =?utf-8?B?dnRPTzVIUEliQVBiemVHZHg0cUFrZ1dsK0k4MGhpMEY2WVdqSmxMcjlzOHJs?=
 =?utf-8?B?SlVBODZjLzFyNUxaYm1wd21pT1FxRk11WmYzQXFZK1N0bXp5emxEYkZRVVk4?=
 =?utf-8?B?R1MxNkdsUFE5WDNJV1EyaFlQeDRPaXRxRDZMTXp0b3RvMEVmblB2bWlhQTY5?=
 =?utf-8?B?ZHc5KzlEeUZZM0NuN1o0bmdPNjAzRTB0T25kTkRsMnBDSDNKV2tVcTc4Nm1y?=
 =?utf-8?B?eWNHQzg0Y1cvbk5nVHl2b0JHNmxBcys4ZXhWUVl1NDUvR2JxN093eTlYdTF5?=
 =?utf-8?B?UkxjODVLYlF4aFhKVWJNWXQyWmZ6TFByS2dwYUxCQ2ppUWFwVUtUTHRpR00z?=
 =?utf-8?B?QnBRSnVscXJhcmF1VzY0cHpjRlpPWm5sbFZ0a2tib0xyUlNqeWtxY0NnZ1kr?=
 =?utf-8?B?VUU3SVZJSmY1bXVUMU1mQVIxK1htZDRKTGZaU3QxUHFqSU42YjlKWDNNWC9s?=
 =?utf-8?B?MVZEd3pyWm1QcC9URnJvdnIzSlFLMkxNeDNLNW50aHdoUU9kU2laS2d0WHl6?=
 =?utf-8?B?T1hlTUFWc2gwb25GcHRLNU1udjlzMTN6cFBnQzYxbXFibnB2NTBrODAyWC9o?=
 =?utf-8?B?QmhiRWw4b1FlOHNneFlTRTJPWmtsRDdxQ0dsRDhLNmxkeFhxM3VHNnRyaWdj?=
 =?utf-8?B?UEVsMjNUK1gzS0d4OGxQeGlMTzRjdUc0SWN2bXpYaDFTRG9xem1JMXl0N2sy?=
 =?utf-8?B?cmFFMjBMckZJNURkMG0xWVUxYVJERjBNSUxkeFdKUXZORjlhQWpYUnphOHd6?=
 =?utf-8?B?VjdJWDREM2VoNkNTcFZGdklEazBYTFhNODhha2wwOE40dlc4blV0UkFSSWNl?=
 =?utf-8?B?ajl1WlNpMFlXK3JOdDFmaEpCRkxpU0pmWWZvMTZKR2VsTGhNV25pdkp5Zi94?=
 =?utf-8?B?V3NSZzNYUkJiQmVSdzdQRUJBbXlqSUZoNzMvaDZsNXF6SnE4aEF2SzN1TUh0?=
 =?utf-8?B?QUJwajhzODNxSmk4cno1ZnVWaHhmSzJlWVNoRG9xMm5ITDZoN1ZLeTFyZndm?=
 =?utf-8?B?NWx3aXhUR204VllzcCtUcEk2VHBSaFNxZkx2TEVFQktiOFJqOHlhbnpRUTF6?=
 =?utf-8?B?U1djdXBVRENWTHpVWi9PaEpKNWo3bVV4b1RhK3IvUHdRaGgrMkhzbk91cEU1?=
 =?utf-8?B?MXhVVWtxRDFaWWg5RVU1RUlXN3ZnVHhBT05qWjZoT0RQTktFaFdXd2VXWEZP?=
 =?utf-8?B?S3llZm1MaVpxaUxmdXVQb1FjRWhCa051RmtwV0E2dE9CUVhVYmp6VHowZExx?=
 =?utf-8?B?NEhvYWpRejlyQ1hIS1VVODFUL3UvUllVSHV6NEtHYnU0NHlkTTBWZHNTSit3?=
 =?utf-8?B?Q2dvNDQvMVdJNXh2bEhsejJhRWdOd0dTdW9scUpPNzNQNHNhN28yMGwzL1Z2?=
 =?utf-8?B?ZnZSNHAxeUpnM3N5cG1TOU5mQ0VNWTdIdEd2QnQ1TENYTU9iTEFmNmxoU3Rq?=
 =?utf-8?B?SGROTG9RVWV3UTMvMFZycWVEcFliU3o1SVdFVVAzYXA2YXhoczFpTmQ0VFpt?=
 =?utf-8?B?a3k1cVZhYkFtV1k2RjJ3RkJsVGtXeXdCNEorVmdNZ1Q2MXp1MHQwVmJiQUNM?=
 =?utf-8?B?SkRZdkhFZHlteG5XUWpad1htZkdWZ1JsTVppVGZMZCtXOVhGQlYvajFOcFlp?=
 =?utf-8?B?MGFGbXRsMEN3ckRxcE9mU3JNOXNPMW9ybXBaajhkWnhKMlE0VjBtaEY4R2l2?=
 =?utf-8?B?S3hUOVVpOHJFTUowVkowVWFQcGNnL01PWmwxZUptOVhmUXpkRWhHUjVqcTBj?=
 =?utf-8?B?Q2Nyd1lRcENtMkxZbHBBblBSUEhweitSTXZhWi8vWWZYYlFvWHJDTHNRMGEx?=
 =?utf-8?Q?DxaM5rAZ9toowIz8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9B551A99CB377478165BEC6129DE191@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dhxNDsn5Tan0EadvTQB3/YcUoUTbwFVFgawX7OmSq4bR1pfEjwZwUGukttXu6XO4g3J91zwsBZXms+qmEAOEpscUEpNE4kNZLT5NLAtEx/BUiGz4J64fapdMlPk1t4rghZVVK1CszDjfMN4DxABgrDLcid5CgDEdAY0Y922uqx4ciJEJxZOrlMv+6Jca0CwMRERQvrn+ESPEVIEZlFQXWafSj+QZwKT36BSrDHDScqvrz7+lPB+I4KTYdcdxOa4gWZkppKOgvj+bbz4Knh66R4z7SUZY7RH5GchNQRrRLXLIuUGmqczF5cbbnKIOPgMn3QnUX/Y04jmflRBm9gYFGw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d240f06-69cc-4b5d-2ea4-08df08ce093b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:41:52.0644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VScEFwlwvZ2X8FzR1W5hWdbxc113h7vkin9WqY1iAZn7QMOKt4cp7KhckpW0gi0UAfprdISARw18VdUzHtR22boSfA/EyMTR609aBDh94mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBBZGQgc3VwcG9ydCBmb3IgaGFsZiBMRlBTIGN5Y2xlIGNhbGN1bGF0aW9uIGZvciBEUDIuMSBB
TFBNIGFzDQo+IGRlcGVuZGVudA0KPiBwYXJhbWV0ZXJzIGdvdCBjaGFuZ2VkLg0KPiANCj4gdjE6
IEluaXRpYWwgdmVyc2lvbi4NCj4gdjI6IEF2b2lkIHJldHVybmluZyBlYXJseS4gW0phbmldDQo+
IHYzOiBVc2UgaW50ZWxfY3J0Y19oYXNfdHlwZSgpLiBbU3VyYWpdDQo+IA0KPiBDYzogSm91bmkg
SMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFu
aW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDE4ICsrKysrKysrKysrKy0tLS0t
LQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gaW5k
ZXggMDc4ZTA0YmI2OWQyLi45OGFhNDE4YTZmZjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBAIC04MCwxMiArODAsMTggQEAgc3RhdGljIGlu
dCBnZXRfc2lsZW5jZV9wZXJpb2Rfc3ltYm9scyhjb25zdA0KPiBzdHJ1Y3QgaW50ZWxfY3J0Y19z
dGF0ZSAqY3J0Y19zdGF0ZSkNCj4gwqBzdGF0aWMgdm9pZCBnZXRfbGZwc19jeWNsZV9taW5fbWF4
X3RpbWUoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQoNCk5v
dCB5b3VyIHBhdGNoLCBidXQgbWF5YmUgYmV0dGVyIG5hbWluZyB3b3VsZCBiZQ0KZ2V0X2xmcHNf
cGVyaW9kX21pbl9tYXhfdGltZSgpDQoNCj4gwqAJCQkJCWludCAqbWluLCBpbnQgKm1heCkNCj4g
wqB7DQo+IC0JaWYgKGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgPCA1NDAwMDApIHsNCj4gLQkJKm1p
biA9IDY1ICogTEZQU19DWUNMRV9DT1VOVDsNCj4gLQkJKm1heCA9IDc1ICogTEZQU19DWUNMRV9D
T1VOVDsNCj4gLQl9IGVsc2Ugew0KPiAtCQkqbWluID0gMTQwOw0KPiAtCQkqbWF4ID0gODAwOw0K
PiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0NCj4gdG9faW50ZWxfZGlzcGxheShj
cnRjX3N0YXRlKTsNCj4gKw0KPiArCSptaW4gPSAzMjA7DQo+ICsJKm1heCA9IDE2MDA7DQo+ICsJ
aWYgKGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0VEUCkpIHsN
Cj4gKwkJaWYgKGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgPCA1NDAwMDAgJiYNCj4gRElTUExBWV9W
RVIoZGlzcGxheSkgPCAzNSkgew0KPiArCQkJKm1pbiA9IDY1ICogTEZQU19DWUNMRV9DT1VOVDsN
Cj4gKwkJCSptYXggPSA3NSAqIExGUFNfQ1lDTEVfQ09VTlQ7DQo+ICsJCX0gZWxzZSB7DQo+ICsJ
CQkqbWluID0gMTQwOw0KPiArCQkJKm1heCA9IDgwMDsNCj4gKwkJfQ0KDQpUaGlzIGlzIGdldHRp
bmcgbWVzc3kuIE1heWJlIGl0IHdvdWxkIGJlIG1vcmUgY2xlYXIgdG8gaGF2ZToNCg0KaWYgKERJ
U1BMQVlfVkVSKGRpc3BsYXkpIDwgMzUpDQogICAgZ2V0X2xmcHNfY3ljbGVfbWluX21heF90aW1l
X2N4MCgpDQplbHNlDQogICAgZ2V0X2xmcHNfY3ljbGVfbWluX21heF90aW1lX2x0KCkNCg0KQlIs
DQpKb3VuaSBIw7ZnYW5kZXINCj4gwqAJfQ0KPiDCoH0NCj4gwqANCg0K
