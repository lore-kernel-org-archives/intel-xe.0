Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA03C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248D31127A7;
	Mon, 15 Apr 2024 19:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5HmxeD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470A21127A7
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713209497; x=1744745497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=64keK/k1Vry49dEEUm1UZGc5uD0Wg5WZDZ8L66sENS0=;
 b=W5HmxeD8T/TrDztZyLOtq/y4E23J18CFGuSqDgdmk6HtuyCWk4TaSYXA
 0UUbrUsSE1xbrNa9PpU65DesVdRTdhP4GaYmviJIphVsHVdnnxBy6H0Wv
 j5SS/oklu/r/TXE4OdZalQvEWwGPsgKxzWdY9xUloqaT1I/GvY6Fhezlx
 AIoaWXVYFTpobVWLiZRCSptmojltWU1/Eb6K3HOQqyxLwp+764wYcWiZf
 F5Q1ad6/jYeHbUg0hCZcmXAGb3wyKkhjxAPDtBI9Emb+TxX7Ld+dNVq3k
 0eVe8UhQs9eIf+u9WWDN8qfcUdK5CDYfjFrMpjg2BfI8VydGlVdsNisV7 w==;
X-CSE-ConnectionGUID: L5emzoD/SESfe3vDOSarzg==
X-CSE-MsgGUID: sY1atZTtTyikXmw9P2cQRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19222310"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19222310"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:31:36 -0700
X-CSE-ConnectionGUID: sWM88U9QRN6XTrkNXgzTEg==
X-CSE-MsgGUID: wLj8cGj9SCupsT7IbqZTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="59456128"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 12:31:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 12:31:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 12:31:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 12:31:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 12:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+mWDgj31cyrfNvgbjr0Ffd91kS/WShluEwlfEb6TV2vld0bMPEdUb892i8XiwqTP7GNMjhnKh3XLutPUIRw3AfEx3yrGkP6/JYn5X2DcP+DSLvOPIxajCtwqTOyQzXTNEntOmB2Vp2QWK756WaSm/PAoVjL6b7C8cAW/I89rMn1BrQt7FC1waSh620u+tNHGGP9t9YOkj+p3V//0GCnc0TgwdTXQb8G6B5vlTfXAPvXPyI1io/4Iv2LQE57aB9Dj0pObZGjeVRKGAXENNkxSvpMPelyKE8TXUvOruXrIgwDWYszPz04ktQLU7hx4s/mnr8PSiPUyzUACIIamvr49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64keK/k1Vry49dEEUm1UZGc5uD0Wg5WZDZ8L66sENS0=;
 b=ME5H7/VClN/1DYCrjSsVGQIR/IwnpceKxXjDnXGTUCajuEKXAQnF2VPWKR5aFwIcWt8Irb98iZG72k5geDKFTlbir0zW5UX2zx0EQ1e6cY3UYxuwBuX1b27hxB24KQbVTPpz4Qr4r9zoDsQuBpwL76fhoQaUVVbyfxmlGCKBn1eqAgST4vOIRcUmGHiVZBlWNyUJy+JpxNNYrg6qo8uquorml5znzfboXd3TnNHkfsdudy4lkHohBJY15hWeFrImWxPeQUMVbqujvGbEMZnBIO/kX5B61006Pq1tA6heqHcePwHHpr7nNVpcyplgy39TvcGWhvoztms3ughXlij+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 19:31:32 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 19:31:32 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Topic: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Index: AQHaj2dpu4NkcfZ3OkSyM6EQP5aqO7FpuDiA
Date: Mon, 15 Apr 2024 19:31:32 +0000
Message-ID: <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB7122:EE_
x-ms-office365-filtering-correlation-id: f7a65223-0d93-457a-b04b-08dc5d82a7cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OBiYaLQfiMZeJ7131RFvssArHWyrL84do6Ki/jqsZ6OexmS9s/yUqmRM4+ryOtMfjc9QRKZJpDROfiIegThOy1JSF+ZDsxyLoe5swTpbqEBBELJYMr2Ru1SjBe1kVZbOjdv3xbxUQlbu0qIcVMJKHKYSfYxn3y/iGQzDKikr49hNL0H/K/ttixEoBkogondEhxgin6eWo7c+C06nrabOH55+Qyyf39g4/28TU18X2QpnnHt+LvKN7kNIqDZI0Ei+4UNYCzV/W3J6KTbBpxJkjxBm/NSckmLgaWoPpZu+xkNPi5dqPz2YXBGzsbxQbh1wWPodj5Udhk/9SIlI7FWrhFKICV92hcSNHs+ddLNwxVqTzvVAiHNbQxdc6CTqrmKcmvjGd6YCMRYowQHMzN3TALaG0Sl6gXDqbsea9eFtvNQTskFpLU5Q3EhugrvP92GGzAS2qBrqjzyalx+ml2sWdKIylReukbBEioBbzDXKKUkVoywrH6zJKMJYFBBT6mjzrnJlxoid9gPrLAhkcPvT2PBP55ytPSFis5fCAO6qgtWBnHqz0hVTL+egNNEOeZt/tJ8LBPPpXhBiSqSyGF1ig0Hj+O8KxY3VgDyREmTwN+mGWTd0GJj7f+7Nzl1YHLWTyE5E5Ffqy9rftYOvWBBIneEnOoBUazhQpDJQFnT74IBsE4M6AvEf+cU0elU78XejRtbyaGrO1WAx2Dqw5DD3c97hI78iP+7yT8peLITFezk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTRqdEJPb2xnOTR3UG9WOXh3a25wdmdJNkhmZ3F2MEpyYlg4c1g2K0REZ2cy?=
 =?utf-8?B?Slc1UUxtcUdUQkpkQ3ZIanZOZnN5NWU3QVp6Z1FOTVVQOEZxWW9nSTJoU3hN?=
 =?utf-8?B?V1RtMVhaUnk0TlFpVVZLd29JNnJ4L3NuNkxUQlhQbkExaXhiOG5CMzhXYmVy?=
 =?utf-8?B?VFByYXVFU1lWT09kdG5tcVNSekxqSlpwSEJCcGwzb21UMmg0V244a3lQOGd1?=
 =?utf-8?B?TEphRmRmOWRrT3M0OVNUa0NXeFlPUFl0TG95R0VsK1d3akk5TVBwc3hwNzhU?=
 =?utf-8?B?UkVqVUZUTXg5cm5XYXJDYXhHMnVrdDR4Yld4K0tqaXNDNW1wOGxqdVBRQmNP?=
 =?utf-8?B?WllHa0E4UVVqem9WNDFJNko4d3JDc1lJLzlpRzZGSjBydUExVXQ5WFJ5TGpk?=
 =?utf-8?B?RXI4MFcwaHB4ZXFpOGdFZElSb09BOGhVK0trd3BlZUNGMUpSc1JJU1hIT0pq?=
 =?utf-8?B?TUphUzAxY1YvNnV0cUxhanhobHFZZDZEUTNGdWt3U0M1SW1ndzFIS0RUOWh2?=
 =?utf-8?B?TDJ0WmU1K2M3STdFSk5ocWVHMG5HZWJBb2RPaHozVysvQk94MUk5TGU0RmFO?=
 =?utf-8?B?MDJhWEVOeUZXclg1WTBCVm1EdUVGUE5jOWVJS0ZLYmhCTU1UTitidjJJWDZv?=
 =?utf-8?B?R3FMQXVwN1V6TTRqYyt1R3BQRXRaVWZJaGRMdHBFTTZyVnhVT3JJWFVnOWVI?=
 =?utf-8?B?SlZraXFyUnhjcVY0QWNBVGtXWjZVVGVrbjRHZTVDRDZyRmpQejAzMkdiZmhq?=
 =?utf-8?B?MkV4V1BSNHdBV0F3RHAzQk5obStVaEF5NVNzWUR2S0x5T1paWk1oZ0pUUUxE?=
 =?utf-8?B?ZTdoV3owVDFPT25LM0c1c3VNQTJJWHFEL0JYMWY1aEpvRHVlTnB5RWxOdk1R?=
 =?utf-8?B?T3VtbVVBUHFZK0NiM1NYenlYcVBOQU5VMkQ0eDNCeDdJNkROc1YvRElHcC9Y?=
 =?utf-8?B?Rm5aNjg1QjJZL0NHYjFqQXlPRXlCcE1yZFJhS0pKYXdyTkdvc2JHUTdCSlhm?=
 =?utf-8?B?Q0pHVFFpL1ErY0FFQnJ1STdyRy9QdHZtU1AyNW5JTzMzTCtsTElMMlNUUmt2?=
 =?utf-8?B?ekhBL0ZpbnUvYVhtam1WS1d5NDhtaVF5WUZMbnpJa3ExMFh2dExWMjIyZS9t?=
 =?utf-8?B?dnhaMnd3eC9IODJMR0xhSDJpdjB2ZHp4M0Z1TlZlbFEzbGNMZUxQV2FNVXpQ?=
 =?utf-8?B?a29va09FNm41Zk51Y1hVeEptM1RuT256SFBpS2VYeE9rVnFlZ0tkNUdFQklh?=
 =?utf-8?B?RGFtRVZPa2tGckJXeUdVWXFzWXVPUnU3ZWpzZit3OTcvaUNldThoaHFyVDB6?=
 =?utf-8?B?b29UZ1pIMjRKdXlNR0IvZDNRQ1l4TU5kcDZwY3RYcjR3d2Rnb0EzRnF6ckxX?=
 =?utf-8?B?SVVwSTk2ekpJZUJieDlpWnRDekF0bUdJRVZNZ2pSMlJjT0tJV0hLS1BZNTdC?=
 =?utf-8?B?cm9CQmYxakN3aWRnWlVMZ3JyRGR1OUt0SWtSOThqang1VHlLZG5yQUZjVWVU?=
 =?utf-8?B?eU90bUdjalU1V3Q1bTRoRGIxQWY0Z3BIR3ZLaDZ4YVZseXFVTVlCRys4eVJo?=
 =?utf-8?B?ZFdieS9LeGZyRkhrdVhvb1E0cmlxNmg3UHJUdTBvbHJYclZzWDFERERiaTVM?=
 =?utf-8?B?TU1EcSs1S0FpL2hsM09PYkdrRndQRkovc2hsSXg5cS80OFFXVkl5MGhIZmkv?=
 =?utf-8?B?RFAxaEJXRHJDMmx1WWVsM3Ridmt4VWpxSTVZNWNnd3hBWDgvVzlnUndYSW5z?=
 =?utf-8?B?aHJDUWloK2dKWFp6QUJNZ0M4WFh4WUlrT3EyOUl2UU5mQzRVeHZhNkpnODV6?=
 =?utf-8?B?SDVpZVNJblpDOUdJYk5nR0h5bVozaXNaUlRGMjNUUmNGeEN4Yy9GM0V1ZEJV?=
 =?utf-8?B?SktoYko3OEswR3hIQkVKVktFb0g3eUlhZ3hMelVWSlF6c3BXOFdxYW9LYnd2?=
 =?utf-8?B?TGlvZy94QmZrTEFnQ280SW16Tk4zSzYvQUg4YWdJOStvclhuUDl3bytkbzNI?=
 =?utf-8?B?NG90SFhSVncrdHB6akJDODhQSnA4aGxkditOYW1WYTFVR1JjTGt2RDNhdFAr?=
 =?utf-8?B?SHUxSjg3ZXlMSS8wTVlobUpxL0hIUjhFN2hiTVBtWDZxL2YxSUF1K1MzQUFa?=
 =?utf-8?B?aHEva1ExWW1BcTNpVTMrWnIzQ0dyMXJVL1ZlYjN5UzBEK2tPaFQzZFZRbWhu?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1CA7C6B4F550A41927DA4CE7A4F411B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a65223-0d93-457a-b04b-08dc5d82a7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 19:31:32.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGcJj0jg8ASFpAawhmZjQk9tVaiJdGF9AZe8n2k9Vq21DOg4bR1gY4uOdV/lmrNL6v3ZEPYE4v7nnge+2QARq4k5pvKZ/QK8/iqZQfoh2uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
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

T24gTW9uLCAyMDI0LTA0LTE1IGF0IDExOjQ2IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IEFkZCBkZWZpbnRpb25zIGZvciB0aGUgZnVuY3Rpb25zIHhlX2xyY19zZXRfcmluZ190YWls
IGFuZA0KPiB4ZV9scmNfcmluZ190YWlsIHRvIG1hdGNoIHRoZSBkZWZpbml0aW9ucyBmb3IgeGVf
bHJjX3NldF9yaW5nX2hlYWQNCj4gYW5kDQo+IHhlX2xyY19yaW5nX2hlYWQsIHJlc3BlY3RpdmVs
eSwgZXhjZXB0IHRhcnRpbmcgdGhlIGxyYyB0YWlsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9u
YXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBDQzogTmlyYW5qYW5h
IFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+
IENDOiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBDQzogTWF0dCBSb3Bl
ciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2xyYy5jIHwgMTAgKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9s
cmMuaCB8wqAgMiArKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9scmMuYw0KPiBpbmRleCA2MTViYmMzNzJhYzYyLi5lOTFlY2JjY2ViYTVj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+IEBAIC04MzQsNiArODM0LDE2IEBAIHZvaWQgeGVf
bHJjX2ZpbmlzaChzdHJ1Y3QgeGVfbHJjICpscmMpDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ib19w
dXQobHJjLT5ibyk7DQo+IMKgfQ0KPiDCoA0KPiArdm9pZCB4ZV9scmNfc2V0X3JpbmdfdGFpbChz
dHJ1Y3QgeGVfbHJjICpscmMsIHUzMiB0YWlsKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqB4ZV9s
cmNfd3JpdGVfY3R4X3JlZyhscmMsIENUWF9SSU5HX1RBSUwsIHRhaWwpOw0KPiArfQ0KPiArDQo+
ICt1MzIgeGVfbHJjX3JpbmdfdGFpbChzdHJ1Y3QgeGVfbHJjICpscmMpDQo+ICt7DQo+ICvCoMKg
wqDCoMKgwqDCoHJldHVybiB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCkg
JiBUQUlMX0FERFI7DQo+ICt9DQo+ICsNCj4gwqB2b2lkIHhlX2xyY19zZXRfcmluZ19oZWFkKHN0
cnVjdCB4ZV9scmMgKmxyYywgdTMyIGhlYWQpDQo+IMKgew0KDQpJIHNlZSBsb3dlciBpbiB4ZV9s
cmMuYyB3ZSdyZSBkb2luZyB0aGlzICh4ZV9scmNfc25hcHNob3RfY2FwdHVyZSk6DQpzbmFwc2hv
dC0+dGFpbC5tZW1vcnkgPSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCk7
DQoNClNob3VsZCB3ZSBjaGFuZ2UgdGhpcyBjYWxsIHRvIHVzZSB0aGUgbmV3IHdyYXBwZXIgYWxz
bz8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2xyY193cml0ZV9j
dHhfcmVnKGxyYywgQ1RYX1JJTkdfSEVBRCwgaGVhZCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmgNCj4g
aW5kZXggZDMyZmEzMWZhYTJjZi4uZjM1NWIwZWViNTY1OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xyYy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMu
aA0KPiBAQCAtMjQsNiArMjQsOCBAQCB2b2lkIHhlX2xyY19maW5pc2goc3RydWN0IHhlX2xyYyAq
bHJjKTsNCj4gwqBzaXplX3QgeGVfbHJjX3NpemUoc3RydWN0IHhlX2RldmljZSAqeGUsIGVudW0g
eGVfZW5naW5lX2NsYXNzDQo+IGNsYXNzKTsNCj4gwqB1MzIgeGVfbHJjX3BwaHdzcF9vZmZzZXQo
c3RydWN0IHhlX2xyYyAqbHJjKTsNCj4gwqANCj4gK3ZvaWQgeGVfbHJjX3NldF9yaW5nX3RhaWwo
c3RydWN0IHhlX2xyYyAqbHJjLCB1MzIgdGFpbCk7DQo+ICt1MzIgeGVfbHJjX3JpbmdfdGFpbChz
dHJ1Y3QgeGVfbHJjICpscmMpOw0KPiDCoHZvaWQgeGVfbHJjX3NldF9yaW5nX2hlYWQoc3RydWN0
IHhlX2xyYyAqbHJjLCB1MzIgaGVhZCk7DQo+IMKgdTMyIHhlX2xyY19yaW5nX2hlYWQoc3RydWN0
IHhlX2xyYyAqbHJjKTsNCj4gwqB1MzIgeGVfbHJjX3Jpbmdfc3BhY2Uoc3RydWN0IHhlX2xyYyAq
bHJjKTsNCg0K
