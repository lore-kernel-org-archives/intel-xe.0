Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEEFEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB9910EBDC;
	Fri, 27 Feb 2026 17:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB3l9PDY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8019A10EBDB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772214614; x=1803750614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ivDe9FcHzI55kLLVtG7V2Pfnth3t3u4I7g7Qn0QoGCs=;
 b=CB3l9PDYl3yP7YS4vXfdiEr66r8M4shwRwjkS2WdsyYBtXYf6H6eFtm6
 Frsd7uVv84Xw3/dCicZOQUfztTKAdi2S7Yso8mA70HiuI+uJwztHkhsVg
 mYa3myMZa3GED5fqpkaUwfFf+D/MvjXGDhGMg7q+kZ1V7MIjCn5ORlcsq
 L9NNb1ObL0/DnOWsYB22S/DosZicmh2hj7ldq2BL8DxGTik4tobvfToyE
 D6xhYR219EO9F1UEFSpge6amFfHGlqY8i+vejxKpxbW/Kqf9UnG1A0ovz
 w00xzPL0povsIVFSKvPEVFa18VcLgwfo/7yvspEVnMVthkS2pmN3PQe1/ w==;
X-CSE-ConnectionGUID: v/6P2C7mQDeZZyKaz8yEHA==
X-CSE-MsgGUID: QSxit4xnSoGZsXUev9nogw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="76910872"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="76910872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:50:13 -0800
X-CSE-ConnectionGUID: qUwM2DaORMWGahuPBEZzhw==
X-CSE-MsgGUID: +GpR6iDESceKSdpfJinnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217072982"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:50:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:50:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:50:11 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pq6bMHkoQTh2Pvg+Bf5nPW+ARlJisb4TnYFOi5Ehql/JgtQk/bqgy6pWl3yRWMYJIRG34Z6hsQABuQpGPgsVfwN/LFAev2T52FO4OxT3a7f8+7xlFzz+Mv9g7XgRbjByMfOMJjAqEp3RcK2xZfr/3rxGkOFcPm3tS47F6TbXdQp+G0la+VlmwraFe8lQ7s4DeWbacLhRRrAVvlnAb2NL+A2ipJNt7RHYMwI7ufLY+3WCeyKv2/FYD1V1rwm9Ay7C9+fLGAxNbqmp1i70kC4KI1x5ALfoJ6X/8xnH423gJ4sKKzKBDdPkqdFy/M+0i7AVsuNp94pNeoW/2swx9f7IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivDe9FcHzI55kLLVtG7V2Pfnth3t3u4I7g7Qn0QoGCs=;
 b=Ht+FEhO38ivV4m05bIGZ2H+SD+xnVhxPh/v171AIz9pcul18iMLbPXJxQIMYmGGVqAlioKViYFqk2P1eBmD/pElq1kVH3QAWNMaXWcmZDg8IPN0JaKAabKqbZiHFXqZBfQCyWR55GPsXfIwpQ1ou2RDZrs+my52p5TDjWfSAWIBAzOtgUt7iTf4/Dh4eFI3lKJ2WvkMJoNUe/+FYP6uawiebMoXkbVWJnO//cqO/5a3BJ+z0m0CawN4G/NZQIBIWa+dCHuqRWvoqWsUNG/G6POvnHpqiS5eENakhzNwLaXU+tWgciQWdM098Y/k+mgh1OLA9rnzV8npTn3jt3Wp1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9181.namprd11.prod.outlook.com (2603:10b6:208:571::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 17:50:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 17:50:10 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>, "maarten@lankhorst.se"
 <maarten@lankhorst.se>, "Tauro, Riana" <riana.tauro@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 0/9] Introduce Xe PCIe FLR
Thread-Topic: [PATCH v2 0/9] Introduce Xe PCIe FLR
Thread-Index: AQHcqAr8nu4SIBRTC0OMWIluU+3d/LWW0vAA
Date: Fri, 27 Feb 2026 17:50:10 +0000
Message-ID: <862708b5517c71684b875eb43bf9b1691825253d.camel@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|IA3PR11MB9181:EE_
x-ms-office365-filtering-correlation-id: 9d532f0e-0766-4229-274c-08de7628a6c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 3B1vEsicUlHsfNUx5aS9H+ge8KULkprdBe1Z9/OPpRbiDnndWPxZVCmlntI+o0kNy98daRNKVrmnrZRjmzd/wc/W9ROVPnT7Gn7WDqGoP5J5hd/NjXv905GurAqN1G7IUMPNLXHoxoAu4XMb9DKtiWiOHagla13hV5Z/AEZAHvYcdDk7MrakWCz7v2lK9KQpOs5kDeHqO2pMTV89asfUlKu8qV8upUmCmJvCj/djF4R536l3oTUTorVo9hDLHKuPwZDgYcxwpLDZPeEy9GSxXFLaD/4cVx3mMi/gcBHBXOAWdj/bSnsrYG6gK1nziSiKWyWUoTWkMQy6UXwDpqBBD3LmyiCXiCZ8T0vB3crcvhhMxugduUTNJxsQ+8wX6zrLHSCMbT0KfXu4NuBoVpMpXjkvhRmMrkOVL/RL9jDLctFP9dwL81/aM2kKh/kDXB44J9FHRKzBcOUqd3MxOiXrKHJZfPR0t1PaAtzyleR/bsipX4tpwTvp6yaRvRsosSNZjsvKMqsVZG436gGxazUmuVthKUwHHY76Wc9FH7spBHLz9HeRQPpCfF3k87aHkhLr6DMbDF3jOC1EnAcj8APo0Yz5Nf4aNPIhTGuDZXHobQ+vxoSAX1vs7k+JFaYhZzTNNRT/N1W80HZbEkXQ9Y5lsH/QyGUdwl8w4tg5BuvxA670qmiF6T7Chgbn0ff6d72FX216jZ1FKBBAMGFlNsncwAs9d28c5JKt6idqK4bj2i732A1apNEYHQC5u6BE7HzpUv8rVeURrRaQZ4f4adZMma58sWJ54CWEAMrVNaN8/6I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHh6a01YakViZk1XRWpVb0tvNExwOG91MXVtdWpTZnZqNkZFK3FZam5nN2Zq?=
 =?utf-8?B?NzFJSFFPcmdNYm5hK0lCWWEwSVNRbHNLeGxmRCs0TVRhdWpUTVFFamZUVWMr?=
 =?utf-8?B?OTBieUJuc1NXZzIyRkY2OHROb0d3dGhiTXZwZnJJdWFVaGhWZDlzMm8rRlN6?=
 =?utf-8?B?ODRrZ2NGZmNWcnZGYk1qbUdoNzJsallLQlFBRFhxLzVzUHlhNlhEMFJJMlly?=
 =?utf-8?B?Q3lZUE5HNml4QXdVSC9XMlRXbFU4S2tNYkd1SUhtSHh0WW9hZFRZTzQweEFu?=
 =?utf-8?B?clJzWW5MTUtjNlhORnRRM3BZWVpUeWwySW5BVEJlUkxTMjQ4anZZYnliZUlu?=
 =?utf-8?B?Z3dwb2J1QXc1dFdNVHdwd29xM3B6Y3dGVytlY2pOWWNvMXI0SDFxWlkzSGg0?=
 =?utf-8?B?YllYa0pYNWdLZHZGK29RenJyVit1V25jTHllaTJlWm1kblVrQm96ckwrTktT?=
 =?utf-8?B?b2l4MFNCZUgrcXg2RWI3Rm42Q3RCUFpoM2VCVG1tZVJjcVdJUGc3bzBqc0hL?=
 =?utf-8?B?RDM2TGlEYUQycll6UlM3N0RDUlBNYTNoSUprYWd2aWFsU3VnY3J0ZUx0U3p6?=
 =?utf-8?B?K2xqVU9GUzJmditoWTduQ1JEY1JjbHc3dlkrQkFXRk1HYlJRZ3pmVndBMEgx?=
 =?utf-8?B?MStBUnVDWms3Yk04VUdMcGF5QTlLOTVTYzQrT0lvZWk0ZmlOelZrT3dzQTg0?=
 =?utf-8?B?MGdERWNzNG5IZGpkK0RRc0dzdkxaUmR1MjZOeFBxK0o5alh4WmZ2TWhvVHRt?=
 =?utf-8?B?MUgycE5mVGJZSjJ2a3pzdjRkSks4ODhQRVVHVEJod2wvQTVyd2ZYVGFMV2xm?=
 =?utf-8?B?TGp1SFQ3NmNYNzZwUTJZL1BneDFXUjVRSlMxcXVsdEttWUxjL0EwcExyWFZo?=
 =?utf-8?B?aCtFMEM0dlhGQmxMQTh2UjBXdHhVKzdsYWlreER6Uy9hbzZ2UVhwemNNcnhP?=
 =?utf-8?B?Q0g2OVJ0aFQ2SXdWTWcyQUxXamRhYzRWTDkvQUkxSzUrNXluZGJOS0VUYi9p?=
 =?utf-8?B?bFNjQ0hvS1g3SmpoTTlDRSt6ejJUSGRpeUpnYU9mTzc4bllnQ0ZzSm5FdEFW?=
 =?utf-8?B?ZTJXWndwQjJSUXROaHdESlgvN21PcC9mMjVQcXM5b28xVW9ZVkN6TngxdDV3?=
 =?utf-8?B?UXhTVCtFaTl3LzljNE9ZZ202YW1ROFdUNWdEeXZlQjFLWDVZWHdGV0xGeGM2?=
 =?utf-8?B?Qnp2VUs1NElkRU55QnF0NGZMbFh5cFkrRFZHdDM3SmcxTTlLYnowUmJxd2pr?=
 =?utf-8?B?eTFHa3BIbEUzWUJhOVAvT3JyM01NT0dQL2dYd0lXZU1HUFpPYklMV2tENG4r?=
 =?utf-8?B?eW5iRlVZWkQ1TkVQNEVTQWFGZFdSaGJUaWlCeFJoOXdWTmJhQkM4REpMRFNy?=
 =?utf-8?B?QXFPU0p0NndKWk1xMDR6UUFtUUtzTlJtallDK09RZHphbHpVNnQ4Vi9FYU90?=
 =?utf-8?B?NHpiRmdvUUo4azRqYjhiRWlXRWN5MWJxaFJpZUMva0hlOXVIQUJCWDhSTVNn?=
 =?utf-8?B?N0U1MENPS01mZTE2NlFHZzBHUjc0RFdLay9hRnc2WWp5VUcveVlwZjdpa1Zq?=
 =?utf-8?B?eG40OUVwYnA1eEZVZzFKU3J0Q1NFeTQxZVorWkJmZkpuZzNZdGR3K0JISGJQ?=
 =?utf-8?B?TzZYay9TMWNBdm53OXdkREl5UDFYNFA3YjRSamhTMi9YVzJpTjJOZ1o0dU1m?=
 =?utf-8?B?enl0cUUvb1ZJT2FYN2pXcGpwaTlkWDlvNXJ5d1UvT0d2NVZlRU5Qa3g3NUJk?=
 =?utf-8?B?SHBidmhOKzN5QTdDRGFmdVJNTDU2TE9xT3lDaWtGUGI1MUl0Ynl2aVVsQVZr?=
 =?utf-8?B?NmYwaUN1Z2I2SytaUy9DL3NYQTNrOCs0b05yaTNNUVVaZ2NFcDRqVHFUd3gr?=
 =?utf-8?B?UEhmLzRqclFmTkxvSXFsd0J1dVZ6cmdBbjRLbitXd1p5ZDFKYjhxT2RPNVNX?=
 =?utf-8?B?OTdJaEkvMXRiRzhDdzJiK0FrKythdlc4cDhQd3Vnc1BpZ3Frc0ozM0QxWWc0?=
 =?utf-8?B?Zm50aFRGZXdPdm5Bb28xMWFKUEJwblBIMXczQnI2TVFBSnZ2WVNSNDFHZFVS?=
 =?utf-8?B?Y0VKd0xXN0xCcUMyQTJpUzJlVWp5WThuRzB6OEpXSlV5ZTFjbllxa2ZLSlFv?=
 =?utf-8?B?VFZqN2xSeG5OekJpWVFqSm1PVUhQZTM5aWF5WEJVUFdnNVJmMDdUQWQrNnZU?=
 =?utf-8?B?MTA4Yk9KSlI4VldwaGlhMllxbUZzV3g4N053SjhTVnIzc1FmUWh2ckRFQ1Jr?=
 =?utf-8?B?MEc3TmJFcHNkR3pWMGhMVDVnSXU1ZWZYcGxPOWZWbUlQWE1zYXozNzg5b1hm?=
 =?utf-8?B?R3pTTzVWSk5nS3pNRzUwbmZZbEd6UHExODh5OFdJY2Iwb3c2UlZiM2ZVYVdw?=
 =?utf-8?Q?QOX//0kWS/szQ01I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EF0FF08B2FC934B93942E53108BBD4B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E3Wy95e2l2tqIC7nYib4YUfzG1reNKuXJPlZlM9LJhAinap45COON5G44/sXMroNhKAW1UVDbvuXJ48fgcaBXOhrrWmMUavAOIEQcHlFQoT90wu/okZMlb5L8lQcTnyp4/V1HTuMAT4nuB2XLEvuPXxCME+Yfqsjm/0cmlqJ0jegCKtQceFeGxBLsoUIE0rAGxcSJcQ6Ks8fz1mqZejFt9MggjxCz3tKn3f41bZjc/wB22m0ZxvnAJNlT7QFQu6PIJ3CVoVoeOFAS4lmMhHpa5Kw1UrGSzYgRuEPCRbijiHwd5QAVvQoMkq2U1PUMjMs3LgO29z31YnN3KlWH/+pjg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d532f0e-0766-4229-274c-08de7628a6c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 17:50:10.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7f6UcvlAKDT9vYs47EDzQ/3eL8rHIX+n/ubanww6lDB98HdrgBGHUI/Zg2TrMPrPj9+spwkr7QXIvaYfuFKC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9181
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDIyOjMwICswNTMwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBI
ZXJlJ3MgbXkgaHVtYmxlIGF0dGVtcHQgYXQgaW50cm9kdWNpbmcgUENJZSBGdW5jdGlvbiBMZXZl
bCBSZXNldA0KPiAoRkxSKQ0KPiBzdXBwb3J0IGluIHhlIGRyaXZlci4gVGhpcyBpcyBvZmNvdXJz
ZSBhIGhhbGYgYmFrZWQgaW1wbGVtZW50YXRpb24NCj4gYW5kDQo+IG9ubHkgbGltaXRlZCB0byBy
ZWxvYWRpbmcgR1QuIFRoaXMgbmVlZHMgdG8gYmUgZXh0ZW5kZWQgZm9yIGEgbG90IG9mDQo+IGRp
ZmZlcmVudCBjb21wb25lbnRzIHdoaWNoIEkndmUgc2tpcHBlZCBoZXJlIGZvciBteSBsYWNrIG9m
DQo+IGNvbXBldGVuY2UsDQo+IHNvIGZlZWwgZnJlZSB0byBqb2luIGluIGFuZCBzdXBwb3J0IHRo
ZW0uDQo+IA0KPiBQUzogQWxsIHhlX2V4ZWNfYmFzaWMgdGVzdHMgYW5kIGNscGVhayBydW4gc21v
b3RobHkgYWZ0ZXIgRkxSLiBHaXZlDQo+IGl0DQo+IGEgc3BpbiBhbmQgbGV0IG1lIGtub3cgaWYg
YW55IHJlZ3Jlc3Npb25zLg0KPiANCj4gVHJpZ2dlciBpdCB3aXRoOg0KPiANCj4gJCBlY2hvIDEg
PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy88QkRGPi9yZXNldA0KDQpXZSBkZWZpbml0ZWx5IG5lZWQg
dGhpcy4NClRoYW5rIHlvdSBzbyBtdWNoIGZvciBwdXR0aW5nIGl0IHRvZ2V0aGVyIQ0KDQo+IA0K
PiB2MjogUmUtaW5pdGlhbGl6ZSBtaWdyYXRlIGNvbnRleHQgKE1hdHRoZXcgQnJvc3QpDQo+IMKg
wqDCoCBBZGQga2VybmVsIGRvYyAoTWF0dGhldyBCcm9zdCkNCj4gwqDCoMKgIFNwZWxsIG91dCBG
dW5jdGlvbiBMZXZlbCBSZXNldCAoSmFuaSkNCj4gDQo+IFJhYWcgSmFkYXYgKDkpOg0KPiDCoCBk
cm0veGUvdWNfZnc6IEFsbG93IHJlLWluaXRpYWxpemluZyBmaXJtd2FyZQ0KPiDCoCBkcm0veGUv
Z3Q6IEludHJvZHVjZSBGTFIgaGVscGVycw0KPiDCoCBkcm0veGUvaXJxOiBJbnRyb2R1Y2UgeGVf
aXJxX2Rpc2FibGUoKQ0KPiDCoCBkcm0veGU6IEludHJvZHVjZSB4ZV9kZXZpY2VfYXNzZXJ0X2xt
ZW1fcmVhZHkoKQ0KPiDCoCBkcm0veGUvYm9fZXZpY3Q6IEludHJvZHVjZSB4ZV9ib19yZXN0b3Jl
X21hcCgpDQo+IMKgIGRybS94ZS9scmM6IEludHJvZHVjZSB4ZV9scmNfcmVpbml0KCkNCj4gwqAg
ZHJtL3hlL2V4ZWNfcXVldWU6IEludHJvZHVjZSB4ZV9leGVjX3F1ZXVlX3JlaW5pdCgpDQo+IMKg
IGRybS94ZS9taWdyYXRlOiBJbnRyb2R1Y2UgeGVfbWlncmF0ZV9yZWluaXQoKQ0KPiDCoCBkcm0v
eGUvcGNpOiBJbnRyb2R1Y2UgUENJZSBGTFINCj4gDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2JvX2V2aWN0LmPCoMKgIHzCoCA1MSArKysrKysrKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvX2V2aWN0LmjCoMKgIHzCoMKgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuY8KgwqDCoMKgIHzCoCAxMCArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuaMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlLmMgfMKgIDM0ICsrKysrKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1
ZS5oIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2MuY8KgwqDCoMKgwqDC
oMKgIHzCoCAxNCArKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjLmjCoMKgwqDCoMKg
wqDCoCB8wqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqDC
oMKgwqAgfMKgIDMyICsrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5owqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCAyICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmPCoMKg
wqDCoMKgwqDCoCB8wqAgMTQgKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5owqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h1Yy5jwqDC
oMKgwqDCoMKgwqAgfMKgIDE0ICsrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9odWMuaMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuY8Kg
wqDCoMKgwqDCoMKgIHzCoCAxMyArKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmjC
oMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmPC
oMKgwqDCoMKgwqDCoCB8IDE0OSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmPCoMKgwqAgfMKgIDY1ICsrKysrKysrKyst
LS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5owqDCoMKgIHzCoMKgIDEgKw0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfZXJyLmPCoMKgwqAgfCAxNTANCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuY8Kg
wqDCoMKgwqDCoMKgwqAgfMKgIDM2ICsrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dWMuaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3VjX2Z3LmPCoMKgwqDCoMKgIHzCoCAzOSArKysrKystLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV91Y19mdy5owqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gwqAyOCBmaWxlcyBjaGFuZ2VkLCA1
NDQgaW5zZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfZXJyLmMNCg==
