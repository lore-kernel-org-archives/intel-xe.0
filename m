Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302AC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 04:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26F810E05D;
	Wed, 29 Nov 2023 04:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16010E05D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 04:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701233344; x=1732769344;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LUJa6ZlTk675kLuBOHPC6rPMN76hdEOITnOGmRlsG3w=;
 b=Bo+3KyB+DIJzzuO+9dnejBoPfXn2iHLf61orG0EK4w6MZR1HQ6Plw71n
 bHBqstJfP84hskwWfibF7vqjVbykBW8yntD/dyvcNfyaH9BgCEdXhOAKd
 GVTfoTByc5QY8L+S8d3QlOIYjigucAOx3WJX4D5UqQQLAqxP9EDqLDNC1
 CYdcu9RKlwh7m9VFttVhbzxobbnN1DfyJKihw9GKmx6Ejz4C3NjLheEel
 Y3y8LR0/t/3ezEhLz+RTAZKsvoQ+Sssypc7JT9GNmR+da6UnLhucB6NHP
 EAPzZlatirX0tvMFtIa2jvtczF3FMraaiXMCHmuKAJpSEunERwnuqPOQv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6359553"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6359553"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 20:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100364939"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100364939"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 20:49:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 20:49:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiNfzHHpCWmMjSPPexGmuq2F2cJ/Q8tjSFpV1MUzJ8sR0iy4yI4kR0YC2/NjxGWdPbv9FFy9JddDIdABZH4WSmNNmbagmmMyaBZEmR/eNb2ZrTPDdCLQ3eFCt1wHgpPPgkVa439SD2zCKdMHzLOsG1kAVrmvf7ss8ycIFBzaT+RW8sIzbNX1Zt7vs9F9kXHibA0K0DHLSCUd0PF15JBKH3617KckfP92njaDRPs+m97VlnGU8rq1iA70lRBtOfc8ryGiav99JB78TMU5regmhqsL3RLq/SNdVCyXhAHHYPV0UdkOhFeDfKjXw3euWNkyl8WC6OSF2EyHWdjH6P7ftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUJa6ZlTk675kLuBOHPC6rPMN76hdEOITnOGmRlsG3w=;
 b=XZvicUfCdFTNDBFZK6Dq6AJNmjscJWd7ZHcLw5R5Kn6B8R0N72Eaaz00N7hsl5ABLSx/Nx1H9+1zFCgYMD+9SWkp6cEbloX7Ua4yfui02iRkLv8fWwQNVXcfkA3qKP/U5gAS4HhW1qk18fHEee/02O9EOdOUnb1DkxZruwTNcxKu0ZYeaCmS1P6+v9u685J6pILs7O/o6uNcSmEvxdPtu0uirKfHIgg49S3p0PJjxLHVHbULrdj0ZYtjkPoTl1rnpy4/lbX+CmEtKQPyzhN4iWSxijNS/lG4dQz+HcNDU4BPBwPv3KdzTBTejTEOK9fUtDEP7q51hB4uDpc44DXunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 04:49:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 04:49:00 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC v2 0/6] Enable compression handling on LNL.
Thread-Index: AQHaHGHBGtybRkFQ80G1iqgplqwCWrCPxyGAgAD+tSA=
Date: Wed, 29 Nov 2023 04:49:00 +0000
Message-ID: <MW4PR11MB7056671904879531AA17C312B383A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <273d22f529cafde3bfae432ae2f2de4d921a1239.camel@linux.intel.com>
In-Reply-To: <273d22f529cafde3bfae432ae2f2de4d921a1239.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CO1PR11MB4914:EE_
x-ms-office365-filtering-correlation-id: e4f84b51-09d5-468c-706d-08dbf096811f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJvqREinCxbK7dcl9Z1o4vnx5Immj4t8QIqSVu/HzFBNlqB3zTpKNlQjOqEAWxiy7kn/g850qkcKXp0UXgN1J0joqPa6hpnF20sf+l/PJzd3OIGzm+rPW9RSJOiEBgdfCLlQWWw2nYL9gqfYoOLwayhjKE8ZqJHHV6vq/qOPiqY7+e+CgRvLFbnmjsyGyQffm8L7DPWgzteVOSgn77pyiCQprkw1/i/T5p4bT0hr7PdJu61iUY32L6dKMdFfNo0rhXKDSXSjYHM4djKZastQdZeds0kz1KjfVp8D+PHB5MQEGaw0GpsfL2KuxNT6fPrXg/AjulvHzua4u/rR0AqmEoytSZ5HI+2MFfqRj8eiZoBNr1fRSyvIEFVfC30Ic/LHUW5fFtTuA98ElUVoaOY7U9TFCwz5xYL67ALyJPy7ivnw8isKUXEnyYca1nB57AoV6tqoLHZ3en5HhginJqFCsqaNZvJQqp2Qv6EX4ZRvNBN6S7rSLMXrfkHV1pa+MoB2Fkq5fTtEoNLb+v5A8s9MOGm3ftTAE3d9syAirlYQhNwYiGTklItEcAo/suIMfPzyAyDIxlhkBKi2ZlS++ClRUH04gmQkE5jhKciqW7Hw06os4DHMAtamU9G+NhMmziok
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(55016003)(71200400001)(9686003)(478600001)(26005)(122000001)(82960400001)(33656002)(38100700002)(86362001)(38070700009)(41300700001)(2906002)(83380400001)(5660300002)(4001150100001)(7696005)(316002)(66556008)(66476007)(66446008)(64756008)(52536014)(8676002)(110136005)(76116006)(53546011)(66574015)(8936002)(66946007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2FHNkNIN2JwM2xLTWFzVkVEVU1WNnFFRm8xR2lmcDVuRnNvcFNIeTIxMjAz?=
 =?utf-8?B?RUhmQ094VzYxOUF3elN6YWlBbVcwR3pZY3VXbG9PY0FRTm42bVVtc2RnNWp1?=
 =?utf-8?B?WFNOb28rWjJ3dDlwQ29HTjdvWUw3L3E1MGI2Szd3UXpGV25QeUd3M3B5SXZV?=
 =?utf-8?B?Lyt2ekhBb1pINjZ3QXpDbGMyYXJLUUZSWS9paXdHV1gzT3RLYWhNWi9HVEt0?=
 =?utf-8?B?cjE5NEY2ckNkdXp5VHdoVk8wTTZhM2xOclVOT1BSY0Y0NW5nbnQ4UTNVVXF1?=
 =?utf-8?B?UzEwRUFNb3FFQ09QSVBJSTl6NkxadXNPdk5HTTZyYzdwQlpQOTVmcTI2Rkov?=
 =?utf-8?B?VG14OTh5Qi9CeUxCcE1YSCtSalN6d3FlMmtuV2VSZW12N2xHVzNRUXoyd0Rl?=
 =?utf-8?B?Nm1MSUNIbVRvUmp0ZnZjc29SVlpCSnNWM1c5dTlrN1lOdEJ0TGMxaC83b3JK?=
 =?utf-8?B?aTlMM0ZSeTRDS1J6RTBDd3FiVUJnRCtwL2M4bkludkRjay9TaWFhK21KMWw2?=
 =?utf-8?B?YVFiczhkbFRqcm9IODdSVElhRTFaUjhjaTEwelVYenBTOXdmdENJVlppdjZv?=
 =?utf-8?B?TU1mczRMTjBQVG1GR0RhcTJ6V3VyM0thVGh4VlFUMEJnSmdES3FUMXlhNU85?=
 =?utf-8?B?V0F3QTR1N1R5eC9xdm5aa1IzZHpkbnA3V0R6K0xCVVN4UDdnc1JXcGMzTTRa?=
 =?utf-8?B?UG5LMy9aWWh6dklJbEtrYmZ0RFRoVXhuL0NHdk0wTFV1NllvemM1WjNHQlF1?=
 =?utf-8?B?RnFwaE5nWHNHL0hZcWtKOGx4aG1XNDJZVUJvd3I0anlha25LRW1OMlFsNjlM?=
 =?utf-8?B?WVdJZGN3cnlGVXdUUk9hWHhGN0swcTIydmtROVF1RmE0bVJmNE9EVUM3dFlL?=
 =?utf-8?B?TG5IbWp0cFVMRFl1aTBrdE5OQnFKS1J0S3RDTnQxeVU5ckNXMmhyc0FEWGRM?=
 =?utf-8?B?aFVmWDdFekhKaGR0TUZsZWxlUDB0ZHdrcjJWbFFWVSs4K1dHOVM5QXNVTVQ0?=
 =?utf-8?B?WUFnc2oxMnhtNTJJNytTL3BWSm02SktYaElGdnBTTXhzNjZkcTNWNjVwcmsx?=
 =?utf-8?B?emZDNHJudTdDNTFvMHJGYUZxS2JRN1JVc2s3OG1WWmZOTE40MlZTbnlSZ3Nx?=
 =?utf-8?B?djFGbEgxTDlBU1pPWUM3RTVPSCsyeGZlelZtWlFwd2RJalZRdzg3T1UzZlNy?=
 =?utf-8?B?YW9NSVZ1c0xYV0xXVThIRExra0d3bUxoQm1BbWZpN3lUTjFTZmQvQ3dSWkhF?=
 =?utf-8?B?L3gzdkZHcndZWjJIWUVYRzhYblpzSXhpZlY1ZVZjeVJxdmNyK0hVcnNuMDJ0?=
 =?utf-8?B?L1piYmk4UnBnNVF4R1dtN2FEQnh3dzdsMXptYWR4bHZGcGdqcHB3MmhuaExH?=
 =?utf-8?B?Q2dsNVRncmMxSnpPZy82UkVqdFVvUE4vQ2hVL1o0azFHN3RNbU5kM3ZKRHZE?=
 =?utf-8?B?bWF5MEtUMCsrOEsyQkMvK0FZSExrWFVhUGZReFpxR0ZYTzgxOWFQdHViQUY5?=
 =?utf-8?B?YnZ1SW5vK0M4amsrM2JYa3VvQmw5S1V5UFJ1dTRkQ2xleHBJSHJYWFVpcVJO?=
 =?utf-8?B?NUx1dUw2azFTT1FPenk5c00rRjVTU0FlQVJWN05hQm5tVzdiOG9QaE9ER2FN?=
 =?utf-8?B?eWNkaW5LQVUxVkJrL29TMk5uT3BxY3ViU0VEam45VEtOaXY3ZEYyT0VHU2x6?=
 =?utf-8?B?ZHpwVFVacTQ0SnBNUDNsUGFaN0FnaHdTWkNxUUIzbVJoM3REMUd0T3FueklZ?=
 =?utf-8?B?RTk5dEpsWWNyRTl0RGlGLzRHcWlPRDJrVFVUbzJ6UWpSWms3VSsxSnNVbW1T?=
 =?utf-8?B?N1J1UDV4Y1ZBQnY1S3A4cC9RdEhEbnhBL3RaM1pYZlZUVUtQK1dCQ0VCV1ZQ?=
 =?utf-8?B?Vnd6MGJDUG8zMzhib1k4d2Y3Vi84ODd3KzFTUnYrOHNTdmtFTElWdG5mNHZ3?=
 =?utf-8?B?OG9qRUtlVVVVMnV5bkR4bzBzUVRHN3JZVXRLc2kzVjhFNFhlLzJPMFBlNHZX?=
 =?utf-8?B?UlBVb2FPMDEzcWsxbzhtUGFCaXYyTWpZaVlTbGtubEI1MmhnVjhHVms0RFc2?=
 =?utf-8?B?VTRmT0h3SkxPS2d3elVNUnJKRmVSbms5VGIxSlB6bXkwcHFSYzJEOFNHTWcv?=
 =?utf-8?B?TVNybGhqbnhGZWdtaFFyb2c0U1NQdGVmODlxemErb2FrR0JWaVpUbDA1Ujd5?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f84b51-09d5-468c-706d-08dbf096811f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 04:49:00.4523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnYb1d37dcSgInmwPse2B/gjpOE4bdQQZR9BLwCiLzKgsgj5eUiStbtf5dXP2W+ri/3+5sx2Rl5qYetwi09I1MjHfUbNbPcn3DQyLIbvGB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 0/6] Enable compression handling on LNL.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyOCBOb3ZlbWJl
ciAyMDIzIDE5OjA3DQo+IFRvOiBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQu
Z2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1JGQyB2MiAwLzZdIEVuYWJsZSBjb21wcmVzc2lvbiBoYW5kbGluZyBv
biBMTkwuDQo+IA0KPiBIaSENCj4gDQo+IE9uIFR1ZSwgMjAyMy0xMS0yMSBhdCAxNTozOSArMDUz
MCwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3RlOg0KPiA+IFNlcmllcyBlbmFibGVzIGZsYXQg
Y2NzIG9uIHhlMiBpZ2Z4IHBsYXRmb3JtcyBhbmQgaGFuZGxlcyBjbGVhcmluZyBhbmQNCj4gPiBj
b3B5IG9mIGNjcyBtZXRhZGF0YSBkdXJpbmcgYm8gY3JlYXRpb24gYW5kIHhlX2JvX21vdmUgcmVz
cGVjdGl2ZWx5Lg0KPiA+DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0
cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hp
bWlyYXkNCj4gPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gPg0KPiA+IEhp
bWFsIFByYXNhZCBHaGltaXJheSAoNik6DQo+ID4gwqAgZHJtL3hlL3hlMjogU3VwcG9ydCBmbGF0
IGNjcy4NCj4gPiDCoCBkcm0veGUveGUyOiBEZXRlcm1pbmUgYmlvcyBlbmFibGVtZW50IGZvciBm
bGF0IGNjcyBvbiBpZ2Z4Lg0KPiA+IMKgIGRybS94ZS94ZTI6IEFsbG9jYXRlIGV4dHJhIHBhZ2Vz
IGZvciBjY3MgZHVyaW5nIGJvIGNyZWF0ZS4NCj4gPiDCoCBkcm0veGUveGUyOiBVcGRhdGVzIG9u
IFhZX0NUUkxfU1VSRl9DT1BZX0JMVA0KPiA+IMKgIGRybS94ZS94ZV9taWdyYXRlLmM6IFVzZSBO
VUxMIDFHIFBURSBtYXBwZWQgYXQgMjU1R2lCIFZBIGZvciBjY3MNCj4gPiDCoMKgwqAgY2xlYXIu
DQo+ID4gwqAgZHJtL3hlL3hlMjogSGFuZGxlIGZsYXQgY2NzIG1vdmUgZm9yIGlnZnguDQo+ID4N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oIHzCoMKgIDMg
Ky0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaMKgwqDCoMKgwqAg
fMKgwqAgMyArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNDAgKysrKy0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvX3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMiArKysr
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTM5ICsrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4gLS0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0K
PiA+IMKgNyBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgMTAyIGRlbGV0aW9ucygt
KQ0KPiA+DQo+IA0KPiBJIGZvcmdvdCB0byBtZW50aW9uLCBpbiB4ZS90ZXN0cy94ZV9iby5jIHRo
ZXJlIGlzIGEga3VuaXQgdGVzdCB0aGF0IGV4ZXJjaXNlcw0KPiBiYXNpYyBjbGVhcmluZyBhbmQg
bWlncmF0aW9uIHdpdGggYSBDQ1MtbWV0YWRhdGEtZW5hYmxlZCBiby4NCj4gSU1PIHdlIHNob3Vs
ZCB1cGRhdGUgdGhhdCB0byBtYWtlIHN1cmUgaXQgcnVucyB3aXRoIHRoZSBuZXcgY29kZSBhcyB3
ZWxsLg0KDQoNClN1cmUuDQo+IA0KPiBUaGFua3MsDQo+IFRob21hcw0KDQo=
