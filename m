Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8015CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 15:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968910E5F5;
	Mon, 18 May 2026 15:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYfm/ndc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9310E5F5
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779118598; x=1810654598;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=idCeez0p7EXzu6KdSyxO0XgaKdftCnaIGU/a90qiiwM=;
 b=gYfm/ndcdOiqO2hflV4F3nM/G55V0fNCYuiMpqjjl/Ssxen77XYVpto+
 zZeoUYweHeyCOOZyTxwya2wSlb5LybznjGIxFF7fTWmui3Luxy7qyH1MP
 sdr63LbY5cPuRjo/CamTw5IvKCsnlFlvqCRhvYBsUAptgtJJjgIwnfkLG
 RT1PBDLD94ch3cb0aBXDWwRw7NOwBBgk8UkckpVctsF494YGM+KIQ4rKx
 BUSjMn/uukLq2Vk3CYQPR1kk9sg/df0TPgCfoOp58gjAItsUpg2KJvHsR
 19FfpdM49AqH6RuL/3jkSCji3YfFtBFGyp0sI3Kzq7U/CSev42TY4VlcT Q==;
X-CSE-ConnectionGUID: 000i4rk+QCmVxJuYreD0Fg==
X-CSE-MsgGUID: mZikJW8tS12uQNSbkxbnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80145753"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="80145753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 08:36:37 -0700
X-CSE-ConnectionGUID: +RGxjWXTSqqCJ75ZghJWfg==
X-CSE-MsgGUID: W6ZbUiZBQqeeBsJKmQ29hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="244435240"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 08:36:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 08:36:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 08:36:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 08:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZur/0nWPu8MrJMe25NQJ9L6D3tDbU5Q7hzuAcjCY0uylNdJG38J4qTeyuH58dKjPZdUS9DwhKzg3Ob19Od88Pq3f7dS1gD/hoJ/qIbUYlBUjeJo9ulbVonSr23TuQQ4BR8CYLbYOdILK7LsgJMZAsZ2G2lKvhVpco4JQZr3haMf0STjjKUQpU3tFuXuSqlmC7+nHiD4ZfdLmaCYhwVo57p2hBDzizm4C7Hykm3O1gUaZ56A+nvNIMPL5dJz45PjETTi17lGqTBRTWiwu5o6+GPPDFlG/78bpthm9qjyEWbf9pS5vJNsHzcOtSjf4TQmOwzOTQIjUBXAXKKeDNBqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idCeez0p7EXzu6KdSyxO0XgaKdftCnaIGU/a90qiiwM=;
 b=WleejTI9AqC5M8BkK3sN1O1Ao6GGeQV82l6xqDtK7gK+fiJzwZSvq1EY1zbF6Kiwc/uoDdCWGshuHBE+/0AsL9JFIgZF+ei66wlfIU60aB+rrqP+LKWqUITUef0mcuoz45u6JkrdqV8XRLuW8qjGt3XxiQPCzBoQgMMP3rgjV7bF4ZzhovHThHCOGVF3oLH0+mLQn3JlYLCDU8Nsa+s+b35Oh98r8kZJ9trqmdL404rUQSEgDeVZqr0l6k7F/0yvLUUiTXKxCbPsYDMBpCTc9eO+EGii5PrkB97HAdDmUduBakIBtDH3ASfcjkSyV9j8tZU0U5MnPyFOUyVwotZoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 15:36:30 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 15:36:30 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem free
Thread-Topic: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem free
Thread-Index: AQHc49ZEg/pTKhtdrU2HZOkp/ivD97YSDYqAgAHM5ACAAA5jkA==
Date: Mon, 18 May 2026 15:36:30 +0000
Message-ID: <DM4PR11MB5456904142E1BE17CB332DBDEA032@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260514191649.592407-1-shuicheng.lin@intel.com>
 <ba5b737e-0200-4912-b839-39fe4ec6aaeb@intel.com>
 <559613ff276c92d19fc9a976a8c1ffde044a2c46.camel@linux.intel.com>
In-Reply-To: <559613ff276c92d19fc9a976a8c1ffde044a2c46.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB7082:EE_
x-ms-office365-filtering-correlation-id: 1621a290-3a92-476f-9866-08deb4f33bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021|4143699003|11063799003;
x-microsoft-antispam-message-info: VbH91NV4bAhDDj7r33Ki3Gck8CExaaN6Mq/4uibEbofdjwyIdZfnXirgzFdzUmkQsGz5q1ZbuPsUo8CdmMTeOQovhSm2vKEHFGGVGbNWQyF4/hWoSigjo/MbV+2dqucHEA1PyDdOXUlq1CxsmK6d8IuFah0ljCd8PhJhaN5L8s1opDKgF21FYjDQaU3wG8Vk8PMAbUCQBIbhjnq5JLNAzdvg4NcRt8p/rPjSYMnWO2Drvr2G/g1ItnSaf/hwFD4UzTwJcV3TpVbAYf7CliNHQ23Mu5gnDdu85St603Jar+kCfrrpQrpDQEUMbmadTnxIhdKJHJiN60M987+26RJmN8C6bAQvBsd9IpNZ15RJPcQ+/AUatEjhxaUhi6+DC8NlkyAT9vDH8AE8HnAgOT2WzPwQ0O9w4otBZfGVe8HGuK3UslA96cBnnvJJISpD9x1x8PuKZQaJ0JBCLoG2n70tbtE0WiaSFAiYStsv1Opap0/YG5/U7JuM3jmy4FGHbz2UNCPfPxvZgfzBGfIYmjYX0vn1x6x0CyOdblInJcKHGJu19Qm3PDmvRTzErNV+/2+ezwY7L6XOMIiaLXY6Wx0AROmu9CKqSbocr7B0KEntJ+xX7TAORAfTjjGTE8B5e9+4NYZFUKRxHGDS4ER0QwKzQgyMGG9OK2iXGEKKQzMVhr8M1iGlSEo31VCmxuyrSxxHV/b+05cL8z6py4Fl5zYjvJkgkmdbEzNdfvGd6GE26G29POegoeB1yVtPf7UcCzu5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDJ5TFNiN3FxUDZNWllUSSt2T3ozTEc4cnhIb0ZrS3h0Q2pWV3llSEt4b3NT?=
 =?utf-8?B?T3pFeWlkbUdlWmNEaW5vYm5XVU5FSHFQdHB1RHBqcXdUbmFuL1E4V2xEbDRm?=
 =?utf-8?B?amhUcEZSN3NkQUIxdUgrK1ZUVWYwVk9WTkpKYzVFUG14c2szOE9DWWU4Qy9Z?=
 =?utf-8?B?ZC85dDZhT29wMGx2WUVKaFRoZm1PVDRhelNhYXRsZzFuTjlidWlMT2tqUDdp?=
 =?utf-8?B?OWtVM1IreURCQmVpOEhxaEwzYm9iMDdnWklENDFCdzNLZzhCZWFmaDhHTnFV?=
 =?utf-8?B?bnN1cFFhajN5QWRSaFE1elB2RUFTS3FURkl5TVlSa2JyRHAyYTNGRUJ6b0c3?=
 =?utf-8?B?LzVTdVB0UTh0THNaWG90Si8vdjlKbUNTQmphNVptNURibHBFSis1S3VsV0dP?=
 =?utf-8?B?SS9hMitwQi9KUlVsSmxGdExkY24zTHNkVzhBMDcvZDQ5dStFbWdiajdEbkJs?=
 =?utf-8?B?bCtXcFR2VGZtUFVQb1FZNWNHaU9oRmlTejNvTXM4cE9xUW9HQVRLT0hJRGF0?=
 =?utf-8?B?T3RacnJQL0x3amtocHFVQmtGYTZNWW9HM3lSZk9TdCtIcldrcVk2R2xob3I5?=
 =?utf-8?B?Q3dxY2Y1cVZwam0zbE8vT1VUM21sYVk2SnZIV2NsTElyTmJqNzh2MGI5NWlm?=
 =?utf-8?B?ZmxXT0lLR2c3NkdvN2hVZURmWjkxS09SZkVyMjA3STFLZVltWjkvdm1RVVRy?=
 =?utf-8?B?eWdZcFB2SkhYNWhRY2Y1THNqb092WXhDa2t6ZmhqUmM2ajZLQUd3RXJMbGVx?=
 =?utf-8?B?cVZCd0wyaElIbjBVcmhCUE5IN1dSY1Q0alZJekVneGMvVytodDlsY2lFa2Zi?=
 =?utf-8?B?dTZIQ1lpT2p2TDhSSHlLcnJ6RTAxZFpBSjlSS2JPbzhQZkU4eUd2N001Z1Rh?=
 =?utf-8?B?aVluM2d2RVR4ZkZtVEZKbkR2ZlAwOFhJK2owN2VyeFYyZVJaUHVPMFNkUmxQ?=
 =?utf-8?B?Uk44WVFEL29YZDlpeDk3Qm5mT0g3WlFXcitFazNkMFNKS0R5c0RhRDIwTHNP?=
 =?utf-8?B?Z0lKQzc2SlZPL0ZtOTIxbnFrczhQL05LQ0o0OGhGV3RLd09ydzh1WncvVVFE?=
 =?utf-8?B?dEQ1SUp2Rmtua3RDOE1iT2plVWwzM2d2cVBianBSMHd3ZDlkRmU5UHp4Q2w0?=
 =?utf-8?B?cWJ2OFk3d2QzbnpPc2ZUWnFrV0JJY01sUlg3OTBvRno1bFUrTVdkUlJNWElp?=
 =?utf-8?B?bi8vMktpeWFqVVN6b2d0ODZDRzkzSFB1NysrL29aSUp6d0JualRwSDYwZm5V?=
 =?utf-8?B?enk4bWNLR09PSitNeHBBZEJ1WnIxc3NZd1JHRjNFOTRIQ0RzSEE4R1lXZWxu?=
 =?utf-8?B?VXBYVlp3L3BKdmh4cmJyN0ZQbE9URHNGR3cwMFQraWxyRHZLck12blJaUS94?=
 =?utf-8?B?aUMvUXZ6ZjdyT0lvQkx3M0c0NkxJUzFySXU4cDJaM1pxL1EyRTRnN1JPZjB1?=
 =?utf-8?B?Y3JsanByY3hKVzB5cGpuR1k1Y0FwNXZTdnl5MnA1M2xPdnB6ak8vLzZVVmFy?=
 =?utf-8?B?aXVGYVBpQXBOV3ZXVHhJNzFkeVQwckFRdGlzU0YyajhCY2VzRk9HWHFmd1ZF?=
 =?utf-8?B?d1BKNzk4VHM2eTRWNlBCMGhQZGhybnNlWkE4MzZmRjZCK1J2OEEvMkMwUnBN?=
 =?utf-8?B?QlhlYldLUGdmYVR4VFRoaHo0OHBibjdZSFd0ajQvM0x5Ty9RclRpVXE1clVM?=
 =?utf-8?B?OHJMVm1FUnZ1T3JHRVRPR3drVWRSM0dDdlpFbWZObzlvTEJRVUVYMENRNHJC?=
 =?utf-8?B?YWJuWnV1ekhxb01nQVR4U1djbmxjeTZFR0RYWE1sdDFUQWF2TDkrQi92WFhr?=
 =?utf-8?B?ZVJzeVVvQzBZR1NXZHI3eVgzaXVtcGhVOGQxUHNVSzAxR2xIUGtrUjJnUk9R?=
 =?utf-8?B?cElSTmhSTGUvS01lNkZjMzJ4ZXc2Y1JNVmI0ZnFxREFxV3ZWQllzblRpNFpo?=
 =?utf-8?B?VnFHTUlHYnN1SmduMTZhSThQYndvd0ZIRVl0U1NMTVNic1VXaTZ1RFNIQWRT?=
 =?utf-8?B?TFlLMS9LOUlsV1FwRFVxbklReVpSa0hUekk3Tm5BdHMyczVBNm5mb2I3cXBs?=
 =?utf-8?B?c0dZdW1LQ0w2Q3VsdkhxemFqZ3hNWWxTc0VURnZEUjFJMkNiWFpuWC90RXU0?=
 =?utf-8?B?eVhVTXliZjNicHhjNzBXbGFkVXM3eUhuU2s4L2k5Wnoza1BLZE1XMzl5TDNL?=
 =?utf-8?B?TVp4MlFkRThFL0NxQ1p1ZUdVbENFQ0NDNHpYRG5KSCt6VlhCUmxwTnF2L1lC?=
 =?utf-8?B?VFpmQmNXTFZCUzFidlVvSDJjbnpoUk13alVoS0lJeG5nU3dweHJhc0tjWmlX?=
 =?utf-8?B?UU5VenhnSmh1Qm16U01jdFVwRE4xZVF1RmZ5NVdmSEY4M09jKzRtQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ElQwtrpX9lGeXSKTEhmrBJPKJqoRfasXm+lrMs5sFw1PC2wrXye1BtJ1d6tD98frQ9fhSps7U1BQOTnVhPqSbSHG1AGj6XU1rrb/0KTeQmVCI/UIHftb/S5Ar7WcZSO8GyzyTXg/GfbX3og8KPfDhTLdLITfxHHbm6z97DRwgY5Uxi4h5Rnf2jDQC1N8L4Qy69uf6hPKxly5bEjba1LTDIOknrwZv8J13HY1/i1FzuHgvzk2MeA6pRJ/s8UOmr5Y3k3dyJFe9aCmxCX8KLmS+ggpMNiAh2lg5Vdq2XKsmXlDS5u+SvTk+CKA6X2hTMiP9dt1/ufM1OdT/y1F1A9Uig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1621a290-3a92-476f-9866-08deb4f33bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 15:36:30.5854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/uSOp06ZmkE5feMZWcSeIB14F9sxhCRS+i90R/vDOsv3lwCbIRklPDKQmFgdkA/lyTDJeikIjpOTfibVXHVFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgNzoxNyBBTSBUaG9tYXMgSGVsbHN0csO2bSB3cm90ZToNCj4g
SGkhDQo+IA0KPiBPbiBTdW4sIDIwMjYtMDUtMTcgYXQgMTM6NDcgKzAzMDAsIExldmksIElsaWEg
d3JvdGU6DQo+ID4gT24gNS8xNC8yMDI2IDEwOjE2IFBNLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0K
PiA+ID4geGVfbW1pb19nZW1fY3JlYXRlKCkgY2FsbHMgZHJtX3ZtYV9ub2RlX2FsbG93KCkgYnV0
IG5vdGhpbmcgZXZlcg0KPiA+ID4gY2FsbHMgZHJtX3ZtYV9ub2RlX3Jldm9rZSgpLiBUaGUgZHJt
X3ZtYV9vZmZzZXRfZmlsZSByYi10cmVlIGVudHJ5DQo+ID4gPiBhbGxvY2F0ZWQgYnkgZHJtX3Zt
YV9ub2RlX2FsbG93KCkgaXMgbm90IGZyZWVkIGJ5DQo+ID4gPiBkcm1fZ2VtX29iamVjdF9yZWxl
YXNlKCksIHNvIGl0IGlzIGxlYWtlZCBvbiBldmVyeSBjcmVhdGUvZGVzdHJveQ0KPiA+ID4gY3lj
bGUuDQo+ID4gPg0KPiA+ID4gU3RvcmUgdGhlIG93bmluZyBkcm1fZmlsZSBpbiBzdHJ1Y3QgeGVf
bW1pb19nZW0gYW5kIGNhbGwNCj4gPiA+IGRybV92bWFfbm9kZV9yZXZva2UoKSBmcm9tIHhlX21t
aW9fZ2VtX2ZyZWUoKS4NCj4gPg0KPiA+DQo+ID4gR29vZCBjYXRjaCwgYnV0IEkgZG9uJ3QgdGhp
bmsgaXQgbWFrZXMgc2Vuc2UgdG8gY2FjaGUgdGhlIGRybV9maWxlLg0KPiA+IENvbnNpZGVyIGFk
ZGluZyBpdCBhcyBhIHBhcmFtZXRlciB0byB4ZV9tbWlvX2dlbV9kZXN0cm95IGFuZCBjYWxsDQo+
ID4gZHJtX3ZtYV9ub2RlX3Jldm9rZSBmcm9tIHRoZXJlLg0KPiA+DQo+ID4gLSBJbGlhDQo+IA0K
PiBXaGF0J3MgdGhlIHByb3Bvc2VkIHVzZS1jYXNlIG9mIHhlX21taW9fZ2VtPyBXZSBzaG91bGRu
J3QgcmVhbGx5IGhhdmUNCj4gdW51c2VkIGNvZGUgcHJlc2VudCBpbiB0aGUgdXBzdHJlYW0gZHJp
dmVyIHVudGlsIHdlIGhhdmUgYW4gYWdyZWVkLXVwb24NCj4gdXNlLWNhc2UgYW5kIFVBUEk/DQoN
CkkgYW0gZ29pbmcgdG8gcHJvcG9zZSBhIHVzZS1jYXNlIHRoYXQgYWxsb3cgdXNlciBtb2RlIGRy
aXZlciB0byBtbWFwIHNwZWNpZmljIG1taW8gcmFuZ2UsIHNvIHRoYXQgVU1EIGNvdWxkIGFjY2Vz
cyBzb21lIE1NSU8gcmVnaXN0ZXJzIGRpcmVjdGx5Lg0KVGhhdCB1c2UtY2FzZSB3aWxsIHJlbHkg
b24gdGhpcyBmdW5jdGlvbi4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFz
DQo+IA0KPiANCj4gDQo+IA0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGUgeGVfbW1pb19nZW0g
aGVscGVycyBjdXJyZW50bHkgaGF2ZSBubyBpbi10cmVlIHVzZXJzOyB0aGlzDQo+ID4gPiBwcmV2
ZW50cyBhIGxhdGVudCBsZWFrIG9uY2UgdGhleSBhcmUgdXNlZC4NCj4gPiA+DQo+ID4gPiBGaXhl
czogMWZmY2Y4YjhhZThhICgiZHJtL3hlOiBTdXBwb3J0IGZvciBtbWFwLWluZyBtbWlvIHJlZ2lv
bnMiKQ0KPiA+ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LjYNCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiBDYzogSWxpYSBMZXZpIDxpbGlhLmxldmlAaW50ZWwuY29tPg0KPiA+ID4g
LS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvX2dlbS5jIHwgNSArKysrKw0K
PiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvX2dlbS5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tbWlvX2dlbS5jDQo+ID4gPiBpbmRleCA4YzgwM2VmMjMzY2MuLjc4
ZjZjYzZmZTlhMSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlv
X2dlbS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pb19nZW0uYw0KPiA+
ID4gQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgeGVfbW1pb19nZW1fdm1fZmF1
bHQoc3RydWN0DQo+ID4gPiB2bV9mYXVsdCAqKTsNCj4gPiA+DQo+ID4gPiDCoHN0cnVjdCB4ZV9t
bWlvX2dlbSB7DQo+ID4gPiDCoAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgYmFzZTsNCj4gPiA+ICsJ
c3RydWN0IGRybV9maWxlICpmaWxlOw0KPiA+ID4gwqAJcGh5c19hZGRyX3QgcGh5c19hZGRyOw0K
PiA+ID4gwqB9Ow0KPiA+ID4NCj4gPiA+IEBAIC05Niw2ICs5Nyw4IEBAIHN0cnVjdCB4ZV9tbWlv
X2dlbSAqeGVfbW1pb19nZW1fY3JlYXRlKHN0cnVjdA0KPiA+ID4geGVfZGV2aWNlICp4ZSwgc3Ry
dWN0IGRybV9maWxlICpmaQ0KPiA+ID4gwqAJaWYgKGVycikNCj4gPiA+IMKgCQlnb3RvIGZyZWVf
Z2VtOw0KPiA+ID4NCj4gPiA+ICsJb2JqLT5maWxlID0gZmlsZTsNCj4gPiA+ICsNCj4gPiA+IMKg
CXJldHVybiBvYmo7DQo+ID4gPg0KPiA+ID4gwqBmcmVlX2dlbToNCj4gPiA+IEBAIC0xMjEsNiAr
MTI0LDggQEAgc3RhdGljIHZvaWQgeGVfbW1pb19nZW1fZnJlZShzdHJ1Y3QNCj4gPiA+IGRybV9n
ZW1fb2JqZWN0ICpiYXNlKQ0KPiA+ID4gwqB7DQo+ID4gPiDCoAlzdHJ1Y3QgeGVfbW1pb19nZW0g
Km9iaiA9IHRvX3hlX21taW9fZ2VtKGJhc2UpOw0KPiA+ID4NCj4gPiA+ICsJaWYgKG9iai0+Zmls
ZSkNCj4gPiA+ICsJCWRybV92bWFfbm9kZV9yZXZva2UoJmJhc2UtPnZtYV9ub2RlLCBvYmotPmZp
bGUpOw0KPiA+ID4gwqAJZHJtX2dlbV9vYmplY3RfcmVsZWFzZShiYXNlKTsNCj4gPiA+IMKgCWtm
cmVlKG9iaik7DQo+ID4gPiDCoH0NCj4gPg0K
