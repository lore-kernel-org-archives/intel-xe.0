Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870B1C04FF7
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61C10E546;
	Wed, 20 Sep 2023 19:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1694410E546
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695239787; x=1726775787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6m/CAlif4fW4P7iRjUB2Tg40qJ3vVZ5aZ5Jj/WiI4H8=;
 b=bVsi63aWUqOPvwey7V0a50MzI1rwsHY+wy9A24teq1YApHsLI+HLe/Ti
 XdeKd0hBVpiFAyEyk6RvfzNRbB+F4NRvyXGdSQm1UFLqyvCa26Os/h/qG
 IiPI9qOW3NB7GWJmmGizdXRFDv5mFujifXl1nKLu0A0ZlmtzcZ8VQ2JTL
 HrFklsG1DpOHl0Lr7TSdppKUzUbtxRdegoISv5NhBB7EF0ZLDyh9Ff6UW
 d4EAnkict9PeJZy0qcgXqsL7BKgdL8eDeIALftkZEGutTM+2xWV9ugqai
 mFnxsSGqJa1Dc3O5ErhR/MFIemoCInkzxGIms9Us9DYWx9izPlY+SLUnk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360577306"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360577306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750067931"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="750067931"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:56:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:56:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:56:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:56:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:56:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSOjEr1j1mdurwKgFk8KyYhhDU34FVDH2VR8IWxoihyxqlO+5MZUvpYfEow/h/Mk20vFaNgVvkpg72y0uXzekBqiwOqMtfH5jdsuduNpTBojq44zJ3Wz3LwLuns269FN8585RsAlcKCU6Fzq060+hEmNvl8P0m3IF+CSMXmpB4Yxu847xbyMxGqItCCtdiMI1+DsDsFc2RfRSRmXvNG0rTwvj2bzOEOS0dTKc69U7/FtMOCOwlOlBj396OR7c5obkYZJnCCecUWMjHr6QnjT+5p2CVKtpvQgm/3F0fdUNKOVnlrk92hFlyNDhTzDNqaedsyNyg4lyge32DK+B3QbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m/CAlif4fW4P7iRjUB2Tg40qJ3vVZ5aZ5Jj/WiI4H8=;
 b=a8fLU1NPyjQd7w7Py5mZU/nKmj3anrV8JCVLTB4F6XtcwKzMf7GH0oX1ShYjPEtoIyEV3ZJ4ScBcMvlktbXb796W6aXpqTqrq6bgUKpvzULmWC9Te013PV3aQC0v6vn8dlsXEN6OHZiDLYf0HfgUUwHM5hP1wD7Zx4Gm5O7i2hHIFo4IxM7z6SxPhJu5gYdbC8pj2Ve8vQY1gjXHw9AfrMl1ncXUmhDE3e3kpWcQVLxAufX8IKYrB9quMcb312uao/TrHNfn5LE6zdzgJTzVnysNz8T4XTT4cWUUCX+Mzxl1Sgj4G8d2ncJMpY3Xy79R4EQjS3GOVnoKqEA/d1a2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:56:17 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 19:56:16 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference Clock
 updates
Thread-Index: AQHZ6/kgX36nKQVj+0qKNbSy1REPwrAkIRMA
Date: Wed, 20 Sep 2023 19:56:16 +0000
Message-ID: <0a7476b25f2c183acfe4af5da8381f46cac42169.camel@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-20-rodrigo.vivi@intel.com>
In-Reply-To: <20230920192940.135004-20-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB8025:EE_
x-ms-office365-filtering-correlation-id: e8296d86-1a26-4fc2-71e6-08dbba13a6d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zQISXIVZ3glodkpWG6f5qLRJKUC599q/uEzF5Kg9C/+Uzr6vAUzzgbAgcIoLsaXnNXZdX7dVMBqu65IpBdsh8vKWT2W/+7K8e6mGYM4nXqqdRNxc5RrAvK8tPO+JvyGt/m3AI7CcWKdWv/iDWIh81cpK8XzgDallTtyJWK/5u3O4jW1a2+vynBFVgtGV5zB9z1Gf9j3+Gz5pu+x0UuNYZTLhNJ7zRXvIGDli2Af4ZqRnX1oE+5ublPRK7Piw4XxQZlF9uJob+nrRfGGaMjgqt/LdjBY5O67spCTKgRp8uchm16/fKZt35xE3SfTeoXmmFJdJ5v9SQooorauVmMjC5IwsCm+K6kz/kzXB0PMfGB4gqeIdAN7DELe1GsAh3EwOgjHfq8crt8AYQgtpbDWrshLUGwIRElDJnJmBwddzYIsLgA1jbSC1ZxIq5zzjbIC/gXXsdBKPbIgKejkXcokXIGx0E/zO+99T365gMup+QBA+3mEcMaln8fY6Q7SrsQPGToaxlTRn41bKKYT+eTA974zYwBrmg3kmKwMm53p/4ucyCxzHPhg8gKYpd8vm1K0tJUIU+/xeYON0X+G0L3wUkY5ZBcuumGj5tCQNph8V9lgC4yqfGz3MPJqtHTEXnJTK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(1800799009)(186009)(451199024)(71200400001)(6486002)(6506007)(6512007)(83380400001)(36756003)(122000001)(82960400001)(38100700002)(38070700005)(86362001)(2616005)(26005)(107886003)(54906003)(66446008)(66946007)(66476007)(110136005)(91956017)(6636002)(76116006)(64756008)(2906002)(316002)(5660300002)(66556008)(4326008)(41300700001)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTVrUkdVdytxTXVQTVdQaWxwdXVOZ1lXS3dMRDFtU0o2dllDcVZWa1puUE5W?=
 =?utf-8?B?YzBFcTBEemFUc1RwVW5Uc2YzbnUzcXhsTnFIRUs2c2xYZGI1NDZKM0t0aTh1?=
 =?utf-8?B?R21wMkdSM2FKaGY5dWpBR2txRTdUc3JmRDBEMWo5S1o3L1JWSVNudExqMDBv?=
 =?utf-8?B?bTlxOElWREMySjZER2x6NWJTc01qY0NxM0lIZlBpaVRZN0N0QTNlRExVZEhN?=
 =?utf-8?B?ZCtQMVRNQm1KaDhqKzFmZk1nWjRHNTVybzNmanY4b2hUQTlQK2dDWk43OThl?=
 =?utf-8?B?UnVqN1o5VUZmK0RlazdpQVRTbW5ZOU8xMnRIaG9hbEc5VmdvajBGMk90YVNK?=
 =?utf-8?B?U0UvaTBCVVp2bTVnRFZrS2Y1S2M3bUJJQ3JlZDdHNElMY2lTWHZiZ1ZrUFJE?=
 =?utf-8?B?blkzeHlGL252YWJDRjlqeWNHcURGTUVoUzJEb3hQNUhIb1AxYkc3UG1TdVNI?=
 =?utf-8?B?MlBYb1VmSStJL29TZFlwRE5LTE9NcVZQdWFUdUhTWFp3Y3QrTVgvZVVPMTNh?=
 =?utf-8?B?S3JLR05sRy9FcVJHcyt3dWZPak80WFpScDl5VkdRaGlRWDZEY1FibmxJN2JE?=
 =?utf-8?B?NFVxSkdpZTAwYXNpa0FCL3hLQmlDQ1BOVDBIRTVDV3hsR1NOeVVpamtpNis5?=
 =?utf-8?B?MkhWMTVhelJXN3V4M0dteTBGd09GeEpjRC8vR0xyNUdaY3V0d2U2djhvVzJi?=
 =?utf-8?B?Mm1QV0k4dGVDTXYyQmpWV2JheUo5MXRlZytyTjVHdnQ4VGx6SnYvME02NWxr?=
 =?utf-8?B?ajFTdzJkZURaZ0Urb3hkVmg1c2p5SG9SdnNhSnZ4SjlsbDdzWHR1UDhwYUhQ?=
 =?utf-8?B?M3RpRmQ1QVJNeG1Ta0lDaE9nTm93Y0c1OUVwU291YlZpeCtFU2tnSW5RODRa?=
 =?utf-8?B?bHVPaTFXL2FRRStTTW1MbXhDVGFzbmFwUE1wVG5vaWt0RVRNSERXaitFOEt6?=
 =?utf-8?B?MlJITEdwUVo3cVMrRXRIazRSZHV0SjF5eVB4dzdkdlJjQWd1NlB1d2pIMURa?=
 =?utf-8?B?RlU1NWNFV0ZYVDQxOVpFNnNCT3ZYL3dIeUhZNjd6TmxJMytqK0s1N3owcUFM?=
 =?utf-8?B?S2pYditFOG4rNDIyVkVwTmM2UFNrQUQ2d2pYMDNiOXBxTTFFZXJ3MXhLTGwr?=
 =?utf-8?B?L3ozbXVaUjVpYUxoM0ZWWGtDMjFrVGZBZytpNGJpbldvc3lPK3hyUVRzOFll?=
 =?utf-8?B?UWkzbXhOV3Z2bTNhMWsxelBZcWgwbzdySGE1K01aTWprYmt1ZlBzOHlCR3B0?=
 =?utf-8?B?QStiVTlhNW1wYlFoaS84Sys5dStXV1FGU1UyaTdKbDV3ZVJGM3JjQ3ZQZ0lX?=
 =?utf-8?B?WVkvL0x0VnZNTDYyRjk3NW9hY3JRK0s3b240dno5VGNsMUtQbkhJQnllZkJ2?=
 =?utf-8?B?MTUzV1ZLRlFIVCtaVGpNWVlmNDZidE5iMWVYOGhBN0hUNklmdUhwZVVNM0Fv?=
 =?utf-8?B?eW5JemdGSUVWUCtuZ1BhT3J2Y2VPYW1XTS9RTWlzb21oQ2VKLzNiV0hmNnB5?=
 =?utf-8?B?OU5JRzJ3dG5saDZYUFVldGFSTHViTUR2MS9ibEdCTzI1UC9CSkNINTBXWCtD?=
 =?utf-8?B?TC91UVRIQW5seHUrSXluS1JXVEcxc3NIYUx0WHlLbExpeTFBSzlVU1FVaVMv?=
 =?utf-8?B?M2xraVNTQi9PUFROQzN3UWdYa0JBUzU5SzB4Q0QySWJJY0RiaUEwZ1pMbmNw?=
 =?utf-8?B?L1lOMndYaWpjbzJSQUlLVGpTMnVHZ3VWMnY0MEhqbEs3elhqWDVLNUFIcy9W?=
 =?utf-8?B?SkFsYjF6WTMyZDJuRWxoTG5sdjd2K05WaFIrNGNFUXlmMXNXL3NUTHlKdEgr?=
 =?utf-8?B?RTNINGFueTZ1SkJZK0R1Q0NYU2lDRktSYUx5R1NTQ1k2dFZXdGRpSisySzVn?=
 =?utf-8?B?QXZSeWlOazFpQzdkWHEwa0xYU2t6R2lKQTJreDJkalRDalIwalorMDdkWWNS?=
 =?utf-8?B?d0RTRENWUDlNYnlqL0Q1dk9sVVRneDhERVdOMzdXUmZmeE9mWGxId2xHTy95?=
 =?utf-8?B?R2FmZVJOVnBoZExEcnRXOU9qcU85TGRhbkdhRzUyUGtwczRNVWFWS2dva1Ew?=
 =?utf-8?B?NzY5Y0I2MjZpWld3ZEM3UWlOcUhOczdzQk5ENm5KYlVmUUxvbFhnZVZ0aEt6?=
 =?utf-8?B?MWRvQlNHYUNXTjZOcXRLS0I4V1lxZWFWeHg4YzZWdlRYcHFTTHNSMDR2YWxE?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E93E1FE82030F48BA5FD714AB92F9B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8296d86-1a26-4fc2-71e6-08dbba13a6d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 19:56:16.9044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PukBstj/Wl6LsBVytfGcjr65JIvppDF385WmV9UeYW4D1volYwQKclLM0n/HIohmHGs5fclOdlAL/naWuSkKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDE1OjI5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEZpcnN0IG9mIGFsbCwgbGV0J3MgcmVtb3ZlIHRoZSBkdXBsaWNhdGlvbi4NCj4gQnV0IGFsc28s
IGxldCdzIHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIHdvcmQgJ2ZyZXF1ZW5jeScNCj4gb3V0IG9m
IGl0LiBJbiBnZW5lcmFsLCB0aGUgZmlyc3QgdGhpbmcgcGVvcGxlIHRoaW5rIG9mIGZyZXF1ZW5j
eQ0KPiBpcyB0aGUgZnJlcXVlbmN5IGluIHdoaWNoIHRoZSBHVHMgYXJlIG9wZXJhdGluZyB0byBl
eGVjdXRlIHRoZQ0KPiBHUFUgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gV2hpbGUgdGhpcyBmcmVxdWVu
Y3kgaGVyZSBpcyBhIGNyeXN0YWwgcmVmZXJlbmNlIGNsb2NrIGZyZXF1ZW5jeQ0KPiB3aGljaCBp
cyB0aGUgYmFzZSBvZiBldmVyeXRoaW5nIGVsc2UsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgdGhpcw0K
PiB1QVBJIGl0IGlzIHVzZWQgdG8gY2FsY3VsYXRlIGEgYmV0dGVyIGFuZCBwcmVjaXNlIHRpbWVz
dGFtcC4NCj4gDQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+
DQo+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgIDUgKystLS0NCj4gIGlu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiBpbmRleCBhMjdiMTA1ODNmNWEuLjgxODRkZjRhYmRlMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTE0OSw3ICsxNDksNyBAQCBxdWVyeV9jc19jeWNsZXMoc3Ry
dWN0IHhlX2RldmljZSAqeGUsDQo+ICAJaWYgKCFod2UpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0K
PiAgDQo+IC0JcmVzcC5jc19mcmVxdWVuY3kgPSBndC0+aW5mby5jbG9ja19mcmVxOw0KPiArCXJl
c3AuY3NfcmVmZXJlbmNlX2Nsb2NrID0gZ3QtPmluZm8uY2xvY2tfZnJlcTsNCj4gIA0KPiAgCXhl
X2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7DQo+ICAJeGVfZm9yY2Vfd2FrZV9nZXQoZ3RfdG9f
ZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gQEAgLTE2Nyw3ICsxNjcsNyBAQCBxdWVyeV9j
c19jeWNsZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJcmVzcC53aWR0aCA9IDM2Ow0KPiAg
DQo+ICAJLyogT25seSB3cml0ZSB0byB0aGUgb3V0cHV0IGZpZWxkcyBvZiB1c2VyIHF1ZXJ5ICov
DQo+IC0JaWYgKHB1dF91c2VyKHJlc3AuY3NfZnJlcXVlbmN5LCAmcXVlcnlfcHRyLT5jc19mcmVx
dWVuY3kpKQ0KPiArCWlmIChwdXRfdXNlcihyZXNwLmNzX3JlZmVyZW5jZV9jbG9jaywgJnF1ZXJ5
X3B0ci0+Y3NfcmVmZXJlbmNlX2Nsb2NrKSkNCj4gIAkJcmV0dXJuIC1FRkFVTFQ7DQoNCkluIG15
IG9waW5pb24gdGhlIHJlbmFtZXMgYXJvdW5kIGRybV94ZV9xdWVyeV9jc19jeWNsZXMgc2hvdWxk
IGJlIGRvbmUgaW4gdGhlIHBhdGNoIHRoYXQgaW1wbGVtZW50cyBpdC4NCg0KPiAgDQo+ICAJaWYg
KHB1dF91c2VyKHJlc3AuY3B1X3RpbWVzdGFtcCwgJnF1ZXJ5X3B0ci0+Y3B1X3RpbWVzdGFtcCkp
DQo+IEBAIC0zODAsNyArMzgwLDYgQEAgc3RhdGljIGludCBxdWVyeV9ndF9saXN0KHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkNCj4gIAkJZWxz
ZQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9IFhFX1FVRVJZX0dUX1RZUEVfTUFJ
TjsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4gLQkJ
Z3RfbGlzdC0+Z3RfbGlzdFtpZF0uY2xvY2tfZnJlcSA9IGd0LT5pbmZvLmNsb2NrX2ZyZXE7DQo+
ICAJCWlmICghSVNfREdGWCh4ZSkpDQo+ICAJCQlndF9saXN0LT5ndF9saXN0W2lkXS5uYXRpdmVf
bWVtX3JlZ2lvbnMgPSAweDE7DQo+ICAJCWVsc2UNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDQ1ZWMy
MGMyNzY1ZC4uNTE1NmJhYzg0ZjIwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTI0OCw4ICsy
NDgsOCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24gew0KPiAgICogcmVsZXZhbnQg
R1BVIHRpbWVzdGFtcC4gY2xvY2tpZCBpcyB1c2VkIHRvIHJldHVybiB0aGUgc3BlY2lmaWMgQ1BV
DQo+ICAgKiB0aW1lc3RhbXAuDQo+ICAgKg0KPiAtICogVGhlIHF1ZXJ5IHJldHVybnMgdGhlIGNv
bW1hbmQgc3RyZWFtZXIgY3ljbGVzIGFuZCB0aGUgZnJlcXVlbmN5IHRoYXQgY2FuDQo+IC0gKiBi
ZSB1c2VkIHRvIGNhbGN1bGF0ZSB0aGUgY29tbWFuZCBzdHJlYW1lciB0aW1lc3RhbXAuIEluIGFk
ZGl0aW9uIHRoZQ0KPiArICogVGhlIHF1ZXJ5IHJldHVybnMgdGhlIGNvbW1hbmQgc3RyZWFtZXIg
Y3ljbGVzIGFuZCB0aGUgcmVmZXJlbmNlIGNsb2NrIHRoYXQNCj4gKyAqIGNhbiBiZSB1c2VkIHRv
IGNhbGN1bGF0ZSB0aGUgY29tbWFuZCBzdHJlYW1lciB0aW1lc3RhbXAuIEluIGFkZGl0aW9uIHRo
ZQ0KPiAgICogcXVlcnkgcmV0dXJucyBhIHNldCBvZiBjcHUgdGltZXN0YW1wcyB0aGF0IGluZGlj
YXRlIHdoZW4gdGhlIGNvbW1hbmQNCj4gICAqIHN0cmVhbWVyIGN5Y2xlIGNvdW50IHdhcyBjYXB0
dXJlZC4NCj4gICAqLw0KPiBAQCAtMjY2LDggKzI2Niw4IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlf
Y3NfY3ljbGVzIHsNCj4gIAkgKi8NCj4gIAlfX3U2NCBjc19jeWNsZXM7DQo+ICANCj4gLQkvKiog
RnJlcXVlbmN5IG9mIHRoZSBjcyBjeWNsZXMgaW4gSHouICovDQo+IC0JX191NjQgY3NfZnJlcXVl
bmN5Ow0KPiArCS8qKiBSZWZlcmVuY2UgQ2xvY2sgb2YgdGhlIGNzIGN5Y2xlcyBpbiBIei4gKi8N
Cj4gKwlfX3U2NCBjc19yZWZlcmVuY2VfY2xvY2s7DQo+ICANCj4gIAkvKioNCj4gIAkgKiBDUFUg
dGltZXN0YW1wIGluIG5zLiBUaGUgdGltZXN0YW1wIGlzIGNhcHR1cmVkIGJlZm9yZSByZWFkaW5n
IHRoZQ0KPiBAQCAtMzgxLDggKzM4MSw2IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZ3Qgew0KPiAg
CV9fdTE2IHR5cGU7DQo+ICAJLyoqIEBndF9pZDogVW5pcXVlIElEIG9mIHRoaXMgR1Qgd2l0aGlu
IHRoZSBQQ0kgRGV2aWNlICovDQo+ICAJX191MTYgZ3RfaWQ7DQo+IC0JLyoqIEBjbG9ja19mcmVx
OiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+IC0JX191MzIgY2xvY2tfZnJl
cTsNCj4gIAkvKioNCj4gIAkgKiBAbmF0aXZlX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0
YW5jZXMgZnJvbQ0KPiAgCSAqIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgdGhhdCBsaXZlcyBvbiB0
aGUgc2FtZSBHUFUvVGlsZSBhbmQgaGF2ZQ0KDQo=
