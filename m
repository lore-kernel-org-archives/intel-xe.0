Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B5FF6E9B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 23:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDD810E171;
	Tue, 17 Mar 2026 23:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAFEWFNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D021410E171
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 23:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773790100; x=1805326100;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D5m/i0VPmidDqEXSvo/f/gpqjV2Qlbtpw1A6NIC7SJo=;
 b=kAFEWFNcgeMaf659QRtArFgZJ3JNRS6aRQ+5RBGkoOG2Ghi26ZdcnNRk
 C4H1wPzZaAlxl8M1L8DDBph6v+HFjLjqJ8QG5l2hbBYmLDN0JBaazU3Ac
 e6BuF1M0YerhVFRhQvDmTr+PZQkRZkqBgC/kHHO6zf1FGrjXwF65VH05S
 PucVvUPa5kwQb9OiBk66JxTbMqXIf5aW4pByKqQjVbykJ8S6UH+6wZQIx
 hr+i9z0LEVsv0ZqvmSo1ZLvDu7mGUaMTzb2ecgaBldJtQlNuqkSQspfQD
 PTHVi9GNz3t5AUiefKK40bCCeOcp0mcNoKKMuSUtBAB2GMV9v2rVxQgS/ Q==;
X-CSE-ConnectionGUID: NkjQFxPVTfucWkk215Wokw==
X-CSE-MsgGUID: qjdF6Y91S0+lU/i7SBuvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85916131"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="85916131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 16:28:19 -0700
X-CSE-ConnectionGUID: dI+2CETfQF+10OCc3h3c9A==
X-CSE-MsgGUID: vWSgUS0oSIOm/7jHGkKuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="252903482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 16:28:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 16:28:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 16:28:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 16:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSy/dOCklks/LDcQ8Rpw4K1ZPUhIeVHWbZNTY/thePVpH8ffzNP33KLC5sb8vCXkpKI6sxtlD6Xwgh84Yc1H6MnL7ctZWBAySGbDOhJ6F2ecQO4cAktMt+cAfbuixr3V3u+ma6RDZq2bS0OjyQJyUx7fEVsHB/nCi00tdJ9gI9DqSwZ6FFLVTgbthDxkZTqMcjvipoVfYCRNeuGkYqeoGkAmVQ1Jb6vHJTDnT+I5gYsH0WpZ5P8ayfuywT1VVx2e7v8E78MnLsm4tJewqNI0IoovdwzjrsXApct/bZoQBQ7RG0kzqj4Eo8OiK/7Q56Ous+cyncnSprNUoXXwDQ/pIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5m/i0VPmidDqEXSvo/f/gpqjV2Qlbtpw1A6NIC7SJo=;
 b=UpPNGADxZRaJJziH3/wxjaZaVWaoqLb7Co5SdJdT48TwFo9ttv5kO5AS+K5Gz+n0sl1tMi/FqebxK/H2S7d9S0t/cjgdvtdbnT96rXj6Hpn6evywxj28vLO9CJsDVUAazYGfavvofTZ/BOpRf+wk/Sxzseg6IhPu3aHW/5T7nWdicQhMHiXsnf0rj+I0oYlUWzdYKjyg30+d1IMNuVaiO8o7hI197A/1d6CmA7LcdJSKpz6a/X5vMbB/5E5jGiT1VZ+Nnnv7bFT2xKMLhhr3LR96S2Rv4Gb7A65+UgPzJY6BLF/6yXjO+cfma9FOSleIBZosruBLp4k3eYKnol2Azg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 23:28:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 23:28:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next TLB
 inval.
Thread-Topic: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Thread-Index: AQHctmSEO5zpufOzFUqgugTO0yAsGLWzXqSA
Date: Tue, 17 Mar 2026 23:28:14 +0000
Message-ID: <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
In-Reply-To: <20260317232133.4106716-1-fei.yang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PR11MB8733:EE_
x-ms-office365-filtering-correlation-id: 5211e84b-03c6-4f42-27c4-08de847cdcab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: OlRRlEq1NVBXC/q1IOKjfcdNQUAMS6ZeVA4UgcR1nW8h1FsDVAjGkSV221IIEryDUoK/OcqeIB0tCnP8d+pxEyottPr2L80h7i9wwylHVe3pbwas2vdFaLtW1m5roY90uyNIRnJv5rIAf2ewKOgi6wJw2NjQZfraG2PU70b5k/x97ZF21541xaSrH+/oZDMA3kdMY7CXh28OztK1nZ8r14r6fMvpnb7gDsOO4jBYj9XgZQ5RW++bCQY4392SR5V4ROzg2sbULYxehHdeDJNoSPwwTp2okAfa9z3QUG0TKEr/DYJqriIPT873akCyLlrcw86/y4fsH1qzjnxX02aP8g/ku441ZGSz/wtejSyF8HcIyGsrjYD5pttgs3trajjH+CXSBenJdhlLvMryoWn9eoFyM0DHd3nH+AKtS3ubOi0irtvGWvyI4gMMW6R/zpO9QXm1ydMOUAcb1QPNQ7f8nyGkdhxf/ghvmVifnDbsJ19fIwyqqD1VIKS1IVDxjt5aP8FhARThpRB0xJEtWYAmPCk59RZqEPTdkVspgm/H0/cJZ+YoCs/Q36ZJcBRDEVt3/o2ZQy5PeuZdHKOMB3M8iIZ9BXjTIm7drrFMWMYuIDwPLqjMEqPXqEbo11wnNqmvQawY1dqEJb8h4ktQNeBm0nvR9bZwmL3VXopHjkcUaspOKp0FZv16GG3erXkmPVCeW/aZxctoF+X2dkWjFsVWkvU/CSbc+NFZYJRZUGcXhUoElg3VZDhQv2cubl7akUE3uuVOF9suNJBQBQZnT9Fp9hJjBqHxxpryJV/yfpGUIvk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3kzWnBFUFB0YUUrYW5ISS81T1RjcjVkVWRTR2VvTDRiZHorRnZrWTNkSFdR?=
 =?utf-8?B?cGU3SmE0bFdvS0Jhdk9LeW9pNjJ5dzQweUZKZ2E0eWJpcHNrdXRmbGxOVWgy?=
 =?utf-8?B?TmxkcGd5U3NPQ3Q0d2p2bVZqczQ2TzZDSE1GVkZaaFJrSk1nUVJPMmRCYlls?=
 =?utf-8?B?STUreU5kSEJ1aXFacTF2aVdNMDZMUlUwYzRVMURJUUowTnhvSUZOWHJNc1Va?=
 =?utf-8?B?NmNtN2Z6SGFjczc0cVhhMGxicm1iZ2ZHY3dvemZHYTFXbTFQellXZE13cmhl?=
 =?utf-8?B?cjl2Tkl6SkkvdE9kdGtzQ0xXdUYzL2JpSFNCN3UyUDJYeWU5a2dPS2JWVWNq?=
 =?utf-8?B?TWptNmdJOUpDSXU1REFOZVNpUXVIRlZXWXVMOVlnQVFrQ0xreVhnWlhjZUNY?=
 =?utf-8?B?RHYxZ25TeHNMSkxoV3VJaDd6RHZUdE1WZ0p3UzNaZ1FlcjNZSmVuY1EwWHBq?=
 =?utf-8?B?ZXExbkgwMWhTUkcrNEZJRnkyS0dRdnZrMjRnUDFLb1R6aTlJbzluQzFRTE5Y?=
 =?utf-8?B?OU1WZGZFYUdsSWl4VlJ4ejhaRWlnWVp6b1Z1WXF4c1AwNlJuQXpjUHRxbW9X?=
 =?utf-8?B?RytzV1hXOTVNdU04SVBNYStqZGVJSCtHUzNselEyZDdPU25lNEVST3ErZkFs?=
 =?utf-8?B?UkdwaitrTU85NDViejM2WkpPNk0xOUhDeENIejA1MTB5R1VESy9MbUw1MEhC?=
 =?utf-8?B?ejVtSzlyZVk0V0IzQmxKcTBTYVREMXdKUStCRWJpZkZQR2xndFN3LzFlNitX?=
 =?utf-8?B?WUdFTDRyZ3hYaDNrN3ArMytYdVkyZGlqOWZqMnJEeHNXb0ZPdWI1ZytJZEVv?=
 =?utf-8?B?eksyZkpzaytkTDE2emdMbmNNM3Zmalk3VjZhVWp3RElMdWkyVDFCaDFJdVVP?=
 =?utf-8?B?RXJkTFQxOHlpVkpoUHozR0t3dHVNSmJOMWdIaXBxeUtVK29qUlJ0ZEZjTjBm?=
 =?utf-8?B?VDRQd3MvQ0ZJb1lBcWZBaVhqVnowQzAvam5oWWZWY0M3VEFXaFpPdUdURU0z?=
 =?utf-8?B?Q0c3YlJEWFVEOVVSZllwYUhaWkNoUVJPdlNxMk9ETFFyMlRmamIzeG1qQjhk?=
 =?utf-8?B?RzhtRHlmYmNPWTlTRk9aWUh3aUpHMHpsSXc5WFVqMXhtZ1ZGTzNrQmhOUnVB?=
 =?utf-8?B?dW9ZTlFDODFtMVRYbzFrdFkxMnlTMi9jVnAvK3JmN2NpVDZBejdxdjA3bWdj?=
 =?utf-8?B?Unl1UCtGZndJUkFKdFhpZkFXaDlFeG5mQXFiN1pTL0c3NWFzckJVdEliblUx?=
 =?utf-8?B?U1E3MEZNT2RZbkJ1Mm8yMEczMy9HS1FPZmQ0Um9MV3B5eTFwbjRPTDFXSWZz?=
 =?utf-8?B?b3A3UVFhZlFwTFZFSFZlMDUzSkR2ckcrUnpyVWZSRDZRT25XaGw4cWJibzRp?=
 =?utf-8?B?RUpQcVFBc2l4UHFlejNIR1FITkYwSitPOXFCaVF6WTNyenY2NXJYSWorVHdM?=
 =?utf-8?B?T1V4YmpNaUFMVm5sck5Weit1YnZ0YlQyNzg2WUI1bENQN3VDWTFBUlBFY0d1?=
 =?utf-8?B?OGlEVzhLaDg0Q094aXhJQnVjbWNNNU5ZakowMllIZWhkRnVhY0tpWHhFQ0pV?=
 =?utf-8?B?SzBkMzlVSjNuMGVBeW5rREw4SG5oMzRxWHBLNTBKL1dkR0F4bXpxeDJuekto?=
 =?utf-8?B?TlJSRmkrUldmYkdIZEMwOGJOK2dzanhQYWF1Yk5OMDV0b21UWjViSGJDbEcx?=
 =?utf-8?B?Y3piUm9IQlRwN0ZOYktYUExKMUIyRGFjUkU2VStIa1RpVVdlRXVxZlZ0Y1Zi?=
 =?utf-8?B?TVJOVmhyTGJjRDlGMVV1VUhDNlVacVNQYWVMYmhaVUpCVzNYS05WMUlNQ3J4?=
 =?utf-8?B?b0FzRHFRLzk3L0x5VzMrOFUwUXU1U2N6ZmRQRmMrYm42WFNVaU5ZeC8rVVJu?=
 =?utf-8?B?NnRmSS9OVVJKSGlkWUN3bUNZbzY3SHVXSG40ZFJWcjF6ZXFWQ1RMeUVIc3Nr?=
 =?utf-8?B?T01veE96TWhEQnZUaSt6ZzRNSFN3V09lVTNHMjB1cjYzSFB0QVVwQjFSNGsr?=
 =?utf-8?B?T1Z3NkFNUGR4bXM2MGEyUUluaHpzckdIU0ZSd25WRVRtY09vd2ZoSmpwUFdE?=
 =?utf-8?B?M2I3bDNNaDExZUwrMFpnMC9DRDk4RXFvZkl0MjRmTklReEZLUTJtc2luWURV?=
 =?utf-8?B?Sk5VdmJKdzhVNWRvRmduS3V2N2t5RnBNUGxyOStqSEd4NmJTdnZTREFTNjNE?=
 =?utf-8?B?Y1dNMFBTSVZRaERieHJoMGFaZnFoTU1sTVg4cmgvVm5NZ0l6QXpqSVgxbHpY?=
 =?utf-8?B?ZDUwMkJhWHR0Yk1ycXkwOVlQMEJmQXNKZC9vZ1hHRFRPem95REdON2M5UlFo?=
 =?utf-8?B?K2xuUEJNMjNaa3pxc1dIS2ZHcVJlZmtGYWJMTXNVRXU2L21pdWhJdHZST1lU?=
 =?utf-8?Q?wGvgKOHv9v5a6UxE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58FA08F2BAE5244A92B261298C80D59D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KkhjzlPVAX5GjIM8U3WykbKO1zdTcp7mUTgWxQn9a6xNd1N/HQWCVNmZNfWNkC5cE9fCNlF8LJ1PV+vWXISYezmm7VAl+viELBVIeXGGMFa1wgFk3nPf8/dz7HwGbPYJ3cWRfQyeq6rQhonsWM7P7moGIhGnkEB3LyvDMcK8DNCLqLkgGb4LTHXqve1kfGgGWQ1rI0wnTAsU3DLPrZiZR+9pAfT8ewd5QWuwE4J3lBQvpo+SuTMRo4NYMPe1lMWUX2XlSSzfTCo892o/FVVnlzLsIAyLHfUljlkvDCNAKKw0fg6gKw8B3id1pzDEn9DBMk5cGNXz0sgAUA5qtKn0nA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5211e84b-03c6-4f42-27c4-08de847cdcab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 23:28:14.5771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeaKL6GmrNwE341G7jJqbbRGsOFrMBIr6m/eyR1SixbQ76NHgxBmkIDR5UvrJWy+Gle2b//kcfiHfXYxISTidi1oBCAbuGocCfOkcui3sy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDE2OjIxIC0wNzAwLCBmZWkueWFuZ0BpbnRlbC5jb20gd3Jv
dGU6Cj4gRnJvbTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4KPiAKPiBIYXJkd2FyZSBy
ZXF1aXJlcyB0aGUgc29mdHdhcmUgdG8gcG9sbCB0aGUgdmFsaWQgYml0IGFuZCBtYWtlIHN1cmUK
PiBpdCdzCj4gY2xlYXJlZCBiZWZvcmUgaXNzdWluZyBhIG5ldyBUTEIgaW52YWxpZGF0aW9uIHJl
cXVlc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4K
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMgfCAxNSArKysr
KysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBpbmRleCBjZWQ1OGY0NmY4NDYuLjRj
MmY4N2RiMzE2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9p
bnZhbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+IEBA
IC02Myw2ICs2Myw3IEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxfZ2d0dChzdHJ1Y3QgeGVf
dGxiX2ludmFsCj4gKnRsYl9pbnZhbCwgdTMyIHNlcW5vKQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfZ3VjICpndWMgPSB0bGJfaW52YWwtPnByaXZhdGU7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0
cnVjdCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2RldmljZSAqeGUgPSBndWNfdG9feGUoZ3VjKTsKPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJldHVybmlu
ZyAtRUNBTkNFTEVEIGluIHRoaXMgZnVuY3Rpb24gaXMgc3F1YXNoZWQgYXQgdGhlCj4gY2FsbGVy
IGFuZAo+IEBAIC04NSwxMSArODYsMjUgQEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9nZ3R0
KHN0cnVjdAo+IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLCB1MzIgc2Vxbm8pCj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoENMQVNTKHhlX2ZvcmNlX3dha2UsIGZ3X3JlZiko
Z3RfdG9fZncoZ3QpLCBYRV9GV19HVCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDIHx8IEdSQVBISUNTX1ZFUih4ZSkKPiA+
PSAyMCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogV2FpdCAxLXNlY29uZCBmb3IgdGhlIHZhbGlkIGJpdCB0byBiZQo+IGNsZWFyZWQgKi8KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX21t
aW9fd2FpdDMyKG1taW8sCj4gUFZDX0dVQ19UTEJfSU5WX0RFU0MwLCBQVkNfR1VDX1RMQl9JTlZf
REVTQzBfVkFMSUQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAsIDEwMDAgKiBV
U0VDX1BFUl9NU0VDLAo+IE5VTEwsIGZhbHNlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcl9pbmZvKCJUTEIgSU5W
QUwgY2FuY2VsbGVkIGR1ZSB0bwo+IHVuY2xlYXJlZCB2YWxpZCBiaXRcbiIpOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRUNBTkNFTEVEOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfQoKSXMgdGhlcmUgYSByZWFzb24gd2UgYXJlbid0IHdhaXRpbmcgYWZ0ZXIgdGhl
IHdyaXRlIHRvIG1ha2Ugc3VyZSB0aGUKaW52YWxpZGF0aW9uIGNvbXBsZXRlZD8gSXQgc2VlbXMg
bGlrZSB3ZSBzaG91bGQgYmUgc2VyaWFsaXppbmcgdGhlc2UKYW5kIGF0IGxlYXN0IG1ha2luZyBz
dXJlIGhhcmR3YXJlIGNvbXBsZXRlcyB0aGUgcmVxdWVzdCByYXRoZXIgdGhhbgpqdXN0IHNlbmRp
bmcgYW5kIGhvcGluZyBmb3IgdGhlIGJlc3QuCgpUaGFua3MsClN0dWFydAoKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9tbWlvX3dyaXRlMzIobW1p
bywgUFZDX0dVQ19UTEJfSU5WX0RFU0MxLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUFZDX0dV
Q19UTEJfSU5WX0RFU0MxX0lOVkFMSUQKPiBBVEUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX21taW9fd3JpdGUzMihtbWlvLCBQVkNfR1VDX1RM
Ql9JTlZfREVTQzAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQVkNfR1VDX1RMQl9JTlZfREVT
QzBfVkFMSUQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFdhaXQgMS1z
ZWNvbmQgZm9yIHRoZSB2YWxpZCBiaXQgdG8gYmUKPiBjbGVhcmVkICovCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9tbWlvX3dhaXQzMiht
bWlvLCBHVUNfVExCX0lOVl9DUiwKPiBHVUNfVExCX0lOVl9DUl9JTlZBTElEQVRFLAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLCAxMDAwICogVVNFQ19QRVJfTVNFQywKPiBOVUxM
LCBmYWxzZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAocmV0KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJfaW5mbygiVExCIElOVkFMIGNhbmNlbGxlZCBkdWUgdG8K
PiB1bmNsZWFyZWQgdmFsaWQgYml0XG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVDQU5DRUxFRDsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9tbWlvX3dyaXRlMzIo
bW1pbywgR1VDX1RMQl9JTlZfQ1IsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHVUNfVExCX0lO
Vl9DUl9JTlZBTElEQVRFKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KCg==
