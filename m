Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFEFED3F2
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 18:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EB610F681;
	Fri, 24 Apr 2026 18:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHWPHmV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD710F681
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777054517; x=1808590517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xm6hny+tOde2xUTsboekxLSzYMQBJofxPcfhASQwGvM=;
 b=EHWPHmV1kfkf78ziiJa6jb3N8uMEGyEaVc+ZQnPtfT0paV5hetMkBOzv
 eagW6FCXAJkokZGMBo2xrx2e6y4jHEgXLrkxQxS162LznGUPeUeobg6/H
 m/b+F6lhVpRUosLkIzG4SKUnnDLG/GFH/ajGt2i8VQywFNU293w7fiJ9S
 Lxb8mV2F7JF4ShamJbS76RkBMJlCzp3L/kR6/M8GuBqf1Be34Z2AMcz7p
 jbj4BN4MJmeVjcwVlMRrs3PMB4E/pACDzhi8CCIhjiYO0H95SBIee8ZD0
 gnRT1f5Q8ofjKf8BRktOTabobYWZ1rSlQrqtd1Rm5ajKABAWrGg/vc9u2 w==;
X-CSE-ConnectionGUID: iifZiTj6S/+T3pb4ORX0yQ==
X-CSE-MsgGUID: C5AIjIy6QYect0tCVzlE7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="89123265"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="89123265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:15:16 -0700
X-CSE-ConnectionGUID: k95RpQyuQGuQHrO45QbxlQ==
X-CSE-MsgGUID: CN57S2y1Rpm/Lqg9cpItLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="238015520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:15:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 11:15:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 11:15:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 11:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfdogqzY/pntDBTinnWyZz0TNM5soRcC83t6NnV+jLRdo4zsPUWBzy40UI/k6VYEP3RlhbYLJyTUFBpgZjaogYWhAlEeWsIRSjRuNNrUAJSTLjEjYFHQS4XRajw9jBc+Ru5yKOZE/j3y7ZAQgzya1OCqscjV5m3YQ1s4TrhDJAuhsJhTvg3oDiXWkw+bg2uCiszMMJ5gbr6HUJvexYF+w4kxV+ChN6zAl8xIWsF7FhokYisBPMtypcjads/kCpeYmA+U8kLXyS/InotZQSeQUzYYt43xhGP0lmITXCkClaJvo7dyqqMMjVkQA0pHFRbVb/z0/VyiiBC79e4EeKeUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm6hny+tOde2xUTsboekxLSzYMQBJofxPcfhASQwGvM=;
 b=b4fG5qoM9phF+0DiBQ9a0k1cp4e/lBUrDPfNSwI46C8MR9npjbKar6ryVnWKHfuaJHgh8n2wUsWlgxdoHyQYr/R8s9WGtZUl/XnQKdz4yAq3y/VBxkwwGfkRuBH9am6HXFbxRvqoQdmTpamkZNxCzouiFyUYV7tqSHe1BKXwrOd+CEAyVuAYY6lIam9OC0asZcCPE5uDVj6iOjT72utEySnXeprWJq+UjqYaqhh6ro7RCEb9inkQTUMp3+bVCt1lkk1K7cQFkpw/sKqgehx5jACiKHSU5Rfj0Z0UY4KPQA7l2pBaCTujTEp+pKegAMrbgykSA6n1F29IgmGkigo+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Fri, 24 Apr
 2026 18:15:12 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 18:15:12 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 04/10] drm/xe: Move HWSTAM programming to RTP
Thread-Topic: [PATCH 04/10] drm/xe: Move HWSTAM programming to RTP
Thread-Index: AQHc03N4j7ySzvfeOkGdxKXfVRwq/rXuhDmA
Date: Fri, 24 Apr 2026 18:15:12 +0000
Message-ID: <DM4PR11MB5456E786E067C466F12988B4EA2B2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-4-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-4-baa94014e3e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB7768:EE_
x-ms-office365-filtering-correlation-id: d7c41b1e-a5fb-4647-132c-08dea22d6d6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: vf7/BxHEyeDCk6bZL0Fj15JBX2kphGWMEJD3YuBh04lIMLyXm1nAkuJWOS0UXtafYwe0p3SYTbNvCEll7p+EXR5BLQkfZYGlZ1g1fhDd/S6he7u3kdAcWGPfbBiyX//veooYRxsG8kemMdKGTJaH7O33uvmtAdvXMe7pw829j7ii5T01X3FxOAPxVPMLV38JuGr7+Hy7CGlEYUJCZ/ESYX3F8oM3IzhduP85HHY39zmkCdYrDCf/j4lWt3ThbdinXePR0/2ORovAyWCfqs8/ec2iGyKwl3pnjJKG6aYemA7dhJ4nrbkl0R+6lizTXJMY2ZiDnYDz4e/8WVA045/f+q81Cr8PHXMh3adY6wXaB+QPdI4N0jPNItZrcWYg8wl7d3XFjc0KBRG+G9HXCWMwWKqUm9+NUCuK3dBOoWVzAQGK2PPHf/ibK+6Y0LVJIBUtMLrOUusXtogKbgEhU/qG5m7Gw4cdrMVx3SCW2QXtrKd0B3xEb+bSJE6EjjSxLxwGEr9plpSGlnwGgC/H75kON4cG9MGHAoE1Qh/IogMJyuSxCydCc9RGXthaKviKDF5eH84Ms2xPZaBH6wbw+igltlk4wBoiLEIimlvo2seSW+oT7RNpOMcAKKkyE70CpGWhTaVCAf1/a3/cOQ6Njypup/9reYM+WG+J08N7A4wpEHUd7ouOmifceszXvcpcm4fbYsdzZAOxO6K3O/7tNKcHyVNk1ldwzsjMal0kze+OzS9OKy2jfNgWxYmzpI/oBc7ctT0VmPxe3SIEasxhLfTa5ZQPKyvDn9V1530Vt0bVdvU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkRzbjJWcW1hYnRwQ1hYODhlb0QwWmFZb1F2R0pSRjNKYmRNQThYZDRBSjBu?=
 =?utf-8?B?ditMd05aaTBNYVYrWHY0MGRxTllXMm1VREtLWnJVYmJha004bVlBVkJhWVB3?=
 =?utf-8?B?WXhRWVRyTjdLREpHNlplUHhjZDhaY1I3c0d2bDZrUkRydDZ3NmpRY29ySlNy?=
 =?utf-8?B?d1hITFluV1plN2p1N3N0d3NxcGt3cmZFMU9pNUFFSUdua29FTndsblUrZ3k4?=
 =?utf-8?B?YWFJRXJKVzRqY2poVHBYdlM4dkEyVzYwbjZocGlzY3lwUEJnQ0xmQXVYbzFS?=
 =?utf-8?B?NXNTSFV1enRZM0IvMEQ0eGwxNzdIWnBaTldqRHRrdWt4WFp0aUdGcDFBZFFR?=
 =?utf-8?B?Vzd5N2N5UkZPUm5qenZxQUdQUWt6Wk4zMk4wenJ1SVVOWG9LZjFFSStXRTVZ?=
 =?utf-8?B?K2tzMy9aUTExV3RLRndocm0xS0dLNnVyMlFpSncweUZZeTlSNnNoK0xvUVZl?=
 =?utf-8?B?MjBqeE1aa1pCNVovbElIcHlMU25kN2ZsYzNZcGRCR0lFQWVnWW51NWNhVkh1?=
 =?utf-8?B?ZmowaHE0dmZTeXJ0eEpRTWdtb28wNDlLMW5Mc24rN21mYU1EaG8yY3BwaVZR?=
 =?utf-8?B?MmVjTTMvdXVsd2JaV3hjQ3ZsOHdhNlFKb1hBb0NzRFp1bzhGZEFXT0NnaktX?=
 =?utf-8?B?V0kzU1RiTUptZ2pzL0kwZnphamJEVDBHODN0WjJkbUx6d2Q5VkswcEhoT2tB?=
 =?utf-8?B?a2NCNjRRdDlsc3RJRHJkVlJWdlVuUExHZ2w3M29vVWVTdDFLUFBDd3l4Qm91?=
 =?utf-8?B?WTd6WE1WTUp4RzZlK1NxTTNMRHhIOHJRRTVjUTMxUXRrbnVuZitlSGdQdUps?=
 =?utf-8?B?U29lQ1YrQytOcHV6dER1UWhDdVBJRDRRTEhGdkhzU1VSaXRGMHZnS0d6U2Fi?=
 =?utf-8?B?UGUrYWtZWWQxOFhpSXpaRFpTRmpuZW5KWmRiNitLZWVkZS8vMUJDYk5UR2pT?=
 =?utf-8?B?TVVYbitRVEtidWhOVkN1RUJ4akpKVXVmVUpxdXl2cWNkb1ZQK1FybmpTakNZ?=
 =?utf-8?B?a1BiZ0VRc2NsVWhPMnRPMTFkNjA0RHNIMS9kU0sxSmxlYWQvb3VJMW5GR05Y?=
 =?utf-8?B?VXVWeEhuZzNLL1FBRDNZTnlFVlMwZWZyTmpsVGE3S0o2Y0l3NmxrK1pIUTly?=
 =?utf-8?B?WEpZcmxUTldVMWd3WGVocmVsMWRPd1dSb2lPNkVqZWhPWlg3NjRPcitoR2R0?=
 =?utf-8?B?OE1DWU02eVp5VnhFTndZaExYVHFHZFpoMHBJUG5TeWV0NHE2RlB6Lzdtby9G?=
 =?utf-8?B?YXhqVHh0akhuWkErcXovOVlVbHFTZ1VMRDEySjBFWTlSWFlNYlM4TkhHMDFs?=
 =?utf-8?B?U0t2dkhEd0ZhdndyUHJoclVlTXFCRGhBZUpsT0E0TCsyU0ZlSXRnMENUcnR1?=
 =?utf-8?B?Mm1xbzR0ejU2SFozK0ZVajI5WUU3akMrc1NuS2ZYWEdvL2FaSnlBUXJnL1Nu?=
 =?utf-8?B?SHBMTnFoL3Z6VWdhOXdQTitrRFg5UWM1RWlSOUY2KzA5TVNtNGtraDRBWmhv?=
 =?utf-8?B?OTVxTEh4Qkg0cFZqeEZidHJ2U1M1R1pPaWNWR21WZzBsSTNNUFNPNnlKWWM1?=
 =?utf-8?B?UWJJU0w1NG1ubFhpbkhydWExRDhPWFZTZW04K1NpUzMrSGYwOHNDd3VBM2JR?=
 =?utf-8?B?QUprTERWZVV4QUQ2QW9yQkM5bFkyeUEwUXlaWmhmSkdMY1JLa3c1UEh0d3hu?=
 =?utf-8?B?c2JVN25aVFF2eUZUUlRJeEpXVzFhRW03Mit0YU1qc1RoakZwcS83ZkVneGVV?=
 =?utf-8?B?TmRsT2ExRVJsalE4alhhSGgwTGZ4RGt3WGw2eUlrMDlrbWplSURBUmNhVkMv?=
 =?utf-8?B?cmJURHVhbEZPWnd0a3RBMEZHSWlRVnhFR2VkdkZEVkVLTVYwcjEzaFJVWHJr?=
 =?utf-8?B?dkZpZ0x1RTdvVERaSWNybVEwcmlMc0tzelFmbEovblJRQ2k2eHB5T0dEUFRj?=
 =?utf-8?B?bmY1TnBlQmR2WHR5RUxqR3E5cklXSFpvNFA4UWtCR1VHR2JCSkJKS0ZFSXJE?=
 =?utf-8?B?VVdmWEd0Sm8vQy9VcVZzaE45UkcrT1BNNXg1QURVSU9vc0VmVmFpY3VGTkcz?=
 =?utf-8?B?cDZLbVU2UEZDRUtvOURmaXkwdmZPQ0plSUVidHNadTBwMHRTaTl6RW1GTXNk?=
 =?utf-8?B?NVRrNmVhS2hiVHAyajJzcHYrOVl6bFV0WTZnUGRmQXJ4Njk2bFdjdkh1MU9C?=
 =?utf-8?B?UElmVitSR1ZVOUEwZ2liYkhaUXVnb2pmUEZrT3c5VGx1Q3E3YnB1T2RSMVN3?=
 =?utf-8?B?SURaQjdYMWdFZWdmTDMvMisva2NuQk85cW9YTWpLcklWVXN1V2NqZ2h0SVhR?=
 =?utf-8?B?dHl3K3d1MjcxdUZhQVdGWllsNkgrdnR0aWdUUVdMa0ZERXZ4em01QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: odBCKw4PDxibezLT/W7S/sr0dZQmIMgcctsleoZ4eirlHwHzJ/gxsphPJbLOMI+vo/PA0FeLCtB7iub70F7jsWL9ARgOdG62NldCjHYAHqegu1BhgXI3kwSSqbU07V/NjVmacpyVISKCSdXiO2b+vbEusvntP84eA3WIma5/bqxMatN1beabsDC1Keftbc5p04BN7qFcRFqkDREOBBIUhD1lYt8xe/AoYlQ5KDx7nnyHXonZCSj1KRGeDPVVytaCnD6yGUBkkqFuwt90kCGxiqd9Yfgyxs4JxUOQPAq1m2uC46TMTV8mfe0JhYCqzd8NNI3U373Arx4D8tBLUc9yRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c41b1e-a5fb-4647-132c-08dea22d6d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 18:15:12.5980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TneCf11mxoRp0FXrWAt7yL4dDEC2rPR7GmH1NeXapxfkQDnzOZMG3/QszG/5kwc4LpcJwX8SoL22bAV8nEPOWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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
dGUgdG8gUklOR19IV1NUQU0gdG8gZGlzYWJsZSBoYXJkd2FyZSBzdGF0dXMgcGFnZSB3cml0ZXMg
b24NCj4gaW50ZXJydXB0IHdhcyB1bm5lY2Vzc2FyaWx5IG9wZW4tY29kZWQgaW4geGVfaHdfZW5n
aW5lX2VuYWJsZV9yaW5nKCk7IGl0J3MNCj4gcHJlZmVyYWJsZSB0byBkbyBzdWNoIHByb2dyYW1t
aW5nIGluIHRoZSBlbmdpbmVfZW50cmllc1tdIFJUUCB0YWJsZSBzaW5jZSBnZXRzDQo+IHJlZmxl
Y3RlZC92ZXJpZmllZCBpbiBkZWJ1Z2ZzLCBhbmQgd2lsbCBhbHNvIGF1dG9tYXRpY2FsbHkgZW5z
dXJlIHRoYXQgdGhlDQo+IHJlZ2lzdGVyIGlzIHByb3Blcmx5IHNhdmVkL3Jlc3RvcmVkIGFyb3Vu
ZCBlbmdpbmUgcmVzZXRzLg0KPiANCj4gSW4gdGhpcyBjYXNlIHRoZSBIV1NUQU0gcmVnaXN0ZXIg
d2Fzbid0IGV4cGxpY2l0bHkgYWRkZWQgdG8gdGhlIEd1QyBBRFMnDQo+IHNhdmUtcmVzdG9yZSBs
aXN0LCBzbyB0aGVyZSB3YXMgdGhlIHBvdGVudGlhbCBmb3IgdGhlIHZhbHVlIHRvIGJlIGxvc3Qg
b24gZW5naW5lDQo+IHJlc2V0cy4gIFRoaXMgZG9lc24ndCBzZWVtIHRvIGhhdmUgaGFwcGVuZWQg
aW4gcHJhY3RpY2UsIHNvIGxpa2VseSB0aGUgR3VDDQo+IGZpcm13YXJlIGlzIGF1dG9tYXRpY2Fs
bHkgc2F2aW5nL3Jlc3RvcmluZyB0aGlzIHJlZ2lzdGVyIG9uIG91ciBiZWhhbGYsIGJ1dCB3ZQ0K
PiBzaG91bGRuJ3QgcmVseSBvbiB0aGlzIGltcGxpY2l0IGJlaGF2aW9yIGdvaW5nIGZvcndhcmQu
DQo+IA0KPiBPbmUgb3RoZXIgc2xpZ2h0IGNoYW5nZSB3aXRoIHRoaXMgcGF0Y2ggaXMgdGhhdCBI
V1NUQU0gd2lsbCBub3cgYmUNCj4gcHJvZ3JhbW1lZCBvbiB0aGUgdmVzdGlnaWFsIGV4ZWNsaXN0
IChub24tR3VDKSBpbml0aWFsaXphdGlvbiBwYXRoLg0KPiBTaW5jZSB0aGUgcmVnaXN0ZXIncyBk
ZWZhdWx0IHZhbHVlIGlzIDB4MCBhbmQgdGhlIGRvY3VtZW50YXRpb24gaW5kaWNhdGVzIHRoYXQN
Cj4gaXQncyBvbmx5IGxlZ2FsIHRvIGxlYXZlIGEgc2luZ2xlIGJpdCB1bm1hc2tlZCBhdCBhIHRp
bWUsIHRoaXMgbGlrZWx5IHdvdWxkIGhhdmUNCj4gYmVlbiBhbiBpbGxlZ2FsIHNpdHVhdGlvbiBp
ZiB0aGUgZXhlY2xpc3QgY29kZSB3ZXJlIGFjdHVhbGx5IHVzYWJsZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpS
ZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgfCA2ICsrKysrLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCA2MmE0N2Q3ZTNmMDIuLjA2ZWI2NTVh
NGFlNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBAQCAtMzI3LDcgKzMy
Nyw2IEBAIHZvaWQgeGVfaHdfZW5naW5lX2VuYWJsZV9yaW5nKHN0cnVjdCB4ZV9od19lbmdpbmUN
Cj4gKmh3ZSkgIHsNCj4gIAl1MzIgcmluZ19tb2RlID0NCj4gUkVHX01BU0tFRF9GSUVMRF9FTkFC
TEUoR0ZYX0RJU0FCTEVfTEVHQUNZX01PREUpOw0KPiANCj4gLQl4ZV9od19lbmdpbmVfbW1pb193
cml0ZTMyKGh3ZSwgUklOR19IV1NUQU0oMCksIH4weDApOw0KPiAgCXhlX2h3X2VuZ2luZV9tbWlv
X3dyaXRlMzIoaHdlLCBSSU5HX0hXU19QR0EoMCksDQo+ICAJCQkJICB4ZV9ib19nZ3R0X2FkZHIo
aHdlLT5od3NwKSk7DQo+IA0KPiBAQCAtNDM3LDYgKzQzNiwxMSBAQCBod19lbmdpbmVfc2V0dXBf
ZGVmYXVsdF9zdGF0ZShzdHJ1Y3QNCj4geGVfaHdfZW5naW5lICpod2UpDQo+ICAJCQkJCSAgIHJp
bmdfY21kX2NjdGxfdmFsLA0KPiANCj4gWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9CQVNFKSkp
DQo+ICAJCX0sDQo+ICsJCXsgWEVfUlRQX05BTUUoIkRpc2FibGUgSFcgc3RhdHVzIHBhZ2UgdXBk
YXRlcyBmb3INCj4gaW50ZXJydXB0cyIpLA0KPiArCQkgIFhFX1JUUF9SVUxFUyhGVU5DKHhlX3J0
cF9tYXRjaF9hbHdheXMpKSwNCj4gKwkJICBYRV9SVFBfQUNUSU9OUyhTRVQoUklOR19IV1NUQU0o
MCksIH4weDAsDQo+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkN
Cj4gKwkJfSwNCj4gIAkJLyoNCj4gIAkJICogVG8gYWxsb3cgdGhlIEdTQyBlbmdpbmUgdG8gZ28g
aWRsZSBvbiBNVEwgd2UgbmVlZCB0byBlbmFibGUNCj4gIAkJICogaWRsZSBtZXNzYWdpbmcgYW5k
IHNldCB0aGUgaHlzdGVyZXNpcyB2YWx1ZSAod2UgdXNlIDB4QT01dXMNCj4gDQo+IC0tDQo+IDIu
NTMuMA0KDQo=
