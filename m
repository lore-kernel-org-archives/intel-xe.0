Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030FDCD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 12:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFD510E455;
	Wed, 17 Jun 2026 12:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrWv3qME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1970710E455
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781698278; x=1813234278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojY3TPDWJ2h01WBAVsYkkulJLhOc9/lDYUC6NrQGIWU=;
 b=BrWv3qMEJ6ZpLDPfOxkNvcAEdRp+09/WCLPVj3ACRJ3DBP9MTM0pwkos
 erWOUyv/ATIiheOJXPKUBQRsTqyqhmcSKKmV89Ld3QAE4PyaWXYIGXd63
 +DDWemoeT0Lo0i8t8YjOwQqZg4fCpnVm+mK3fsMtE90V/ysqpC+CV3nGx
 UdnosKqQEHr7V9JkO5ayeJ/dFLFGF1zBujxNC/7WncMu5tSIcRy4Wd6Wp
 IaNfG3fmz+IuwkhIoD7WI5uy5r6ETcYjKmJMEwq0bljIdR2g1elDaeGbK
 qct96REx4viS5ESWt4UvM/bE3SwQrrE39Zrl/Bt3XcM2EGb1a++HcF/KC w==;
X-CSE-ConnectionGUID: PxWiogXcStKy26GTWwr8yQ==
X-CSE-MsgGUID: dagGDsWKRb6zEdkWUUyEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93057306"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93057306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:11:18 -0700
X-CSE-ConnectionGUID: gObgBhP3TNGUQYxrnBbvhA==
X-CSE-MsgGUID: LVx9/fnnQ06XDvscvAOAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="271765105"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:11:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:11:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 05:11:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGvpdJJsxowWNboNR6/OEJLAXSqhWtVnoPqzTCiAb+RE1sh12W52LkHFsNGL1GWvxB2aXmOHVe4porjYnAJO8bRm/EMvWaTW6S4x6npn/kcrk5vn8fEgyxYB8O+Du8NSOkvT9GgiJRgJqME1Ynr9NHgUaNIrAdwFmK13jZ3Gu2nShlMNTn5UShi9jEUtHYeuJmnLdsXOReA0e49j7061m6QaqPqS9N4ISP95LTbNDShEBHL+TCBEqJmhjui4C5u2UijI2upiRjNy21pXPksanNtAFp0Y2Ox3ZwLylAbYkKa8I1urzv6HYbCnHD/cNwT+Hk6HbmBNXoi5k0xyDIEXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojY3TPDWJ2h01WBAVsYkkulJLhOc9/lDYUC6NrQGIWU=;
 b=veIQcaUvDjibBnCjEcuEjFmcUfaTfl4og98pxEgSbuHL4qvMT7BtwtV0DlKUTpt9dYzCyNumC+wNkWUyI937HUCfLTIcegcmHnceaM4MwMjXES81dhZxOhQ+dstdr+alDOnDPU0MHGnRvK0R+up+dckuCmKoE87pqss1BdvnOxWJM1dZ3gJHVLbdbuklr8gV3RvCKainQEvhRJ1+kXn5kJCIUQySIUWTF3tg20ekvNk5k9HkC44+tm190GM3zvHVwHZm8TVu3kySqIAhp/8f7bqb3ILBhXFKvTF8wqYScb2/vrC3J+sv0S97Y96kbNpaCFQF7i5VrDB1RtBl5jiFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 12:11:09 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:11:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Topic: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Index: AQHc/jJPmagXjUd9qEyGGBaQF4GogrZCm42AgAAMIEA=
Date: Wed, 17 Jun 2026 12:11:09 +0000
Message-ID: <DS0PR11MB87184F6177D8A066EFD592F081E42@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
 <e8e282bf-c7e5-4fe5-b228-cddcea4f8b35@intel.com>
In-Reply-To: <e8e282bf-c7e5-4fe5-b228-cddcea4f8b35@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MW4PR11MB5776:EE_
x-ms-office365-filtering-correlation-id: d49b5dab-4cd8-4c67-7d49-08decc698425
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|23010399003|1800799024|11063799006|5023799004|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fzFPZ9LLFIyniOyr6xggK0NZw3xRTRkWNStqTf4z6BD13HPsb56pxX9Y0bqTq7RPHJa/WLlNPZr0ahR1Ds/kk6T9TUqqOzpZevjgkk9Pa+Uw0EoyHr3tN0yeBU3npO89GWobzHWGRoZyMinbi0P91N3D016cyaciQCjNxfbxmtSR2ynmYdQB+2c3ffD1tob7kqoTD4IPyW872PPD+MuCDrEL+siBlGs8ZBQCPVrnhW+APViDiC91r5n+I1SbVEuTgp2wHfPecU3VUQGsyIGLBMZfZg+6VkEskGMOOwJ4k2+rD+sAbXpoAPOqQ71IoETqN31+8b6BdzfOyJsjmLr0qJxX7h1lM16GnjQyzkP9Nl2dNy0seqRIKthshxLPd5Zy+TJdOUKNTPSQZmnbjsM1Rn27SDYNhrDSgxcMnFepv00dH5hDycPnomXMU+HDJR427aUh5eep34iXCMPYKgjmCNgNP1Cv6MBadInRW1obIcyq+Lg0WKyld+ystSjTsY6Zk+A7uWqfnoUQTdG+Kf5Yc+3P7mz0Vz/vMp5hhBPMC9RNTXpxcV8yKiCCdXMKcl10JejOFSzLk0v7hzXMG3ZqJ1nE8LMqBVb2QuXK/C/r6P09xMniO79qGCKQ5dn/l2uEE/evOsH/vuzdv+K6E8OdGhaJnA1GNjzBA2dlSsGASXA5x5GiyFJFCeJOYS+EKK7T+roWvZT0WxyqWenn6/yfQZJP0sEmV5cZzfV0TbVZcbkZsS3AI/aleYs/tnc8Z22K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(11063799006)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0FqeEJsQTV4OTUyVnlsclBIdUoyWFRXNW5aRGRJRFZBdk5lUlFJV3d3bC9K?=
 =?utf-8?B?YkZIczZiRzVKT2JBblo0Q1lXdVdwTVdvNkh6T0h3VHR5MmV3a2xJMWdzemt4?=
 =?utf-8?B?MmNDckJ5VVUydHhPV0NpbUxQSG4vK2tpcThEY2pFVDFOTVBHUFFiN202UUZh?=
 =?utf-8?B?YWtvT1hEZ1dVYXQ4VWhPVys3YkZEa0dLcHVMZmdONVN0bk9xSlYvN04xVU9z?=
 =?utf-8?B?R2hQSEtnZFUrRGVpTVdkb2tCSlZ3dW9aNEFUQzR6RkNabWhEYnJUbnFxTDBO?=
 =?utf-8?B?ejdHR0hNdVpDZkxON1pZWHI2VnZDVHZzajhyTDZnbDMxbndUbzlEaXIwbWlh?=
 =?utf-8?B?Y3EzTlp4TUNhV2pTYkpSZTJIM09ybTd1MllnaCtQczJRMEYvd2EyU25RM1M3?=
 =?utf-8?B?RHE4NnNNYWlSaHFnMkJVRWNjaFVCVHJhbHBqR0twRjdFd1FwMm45N0FSMTd2?=
 =?utf-8?B?cFZ2T1V5ZXhIU3laNHZpRG1TWS9IeUxZbmFVS1d0U0s4TkVUOWhOMU4wSTVh?=
 =?utf-8?B?TnQwTWdpWXN1cWNIcC9rcDR3dG92MWt2dzkxUFlzMUZVRGFIaG1Nd2JnSlNq?=
 =?utf-8?B?eXFuaXZoSjNLcURwYy9uall1YTRUcWRWeUROU3NvellrSDR5RDJyQkM0MmNi?=
 =?utf-8?B?L2ltcmFaM1VwSUhzemJNZzhreFJQZXVDMjlRc0xja0NiVUpkQ1kxcEZrckZr?=
 =?utf-8?B?QXJnWlMrWTNxTVhieEZaV3drSFBFM1dBTEc2OXljcTlHaXB6K1JjemJ2enZM?=
 =?utf-8?B?RGxDS0NkRTh4SlRRQThia0oyWW1Cb3liUW1FQVBBSnU1dlpoa0tqK2FWYkkz?=
 =?utf-8?B?QWlQOFdnMFFRdjNFN3dYUnpaMmNadFFSSjh3UlAvVFcwSUpidDV4RE9Fand0?=
 =?utf-8?B?MnFlNEMzZytqYWprNkRBYkFGWng4V1czVHYxbDdwTGdJaWY4dWNYY05hRVMv?=
 =?utf-8?B?ampDMm5xQWErWWhGK0dteTlJcDRhSGcyTkdGTnczZVlSTlhaeHQydWZ4cTZZ?=
 =?utf-8?B?YWFMeU1IR2cxbVlZRVEvdnNTVkdvL0FuOVh2R1FDQ0lnTnlnVFl4MUk3T2Zi?=
 =?utf-8?B?dzNuUGZ2N0tWKy9WcEZXaTljZXUyRkxsT25NU1RGNHJwSERxQk1TSXpsQXZo?=
 =?utf-8?B?ZWVkcUJBREFRVU9aMkhwc2RPZmpJa1czNDY2c3RCcFQwamxyOGwyRGtnSVhm?=
 =?utf-8?B?VUxrU1QrVG5SZjdpQlFrZEViS09qb0tmelUzYVpKQm4yZHBmREx3V28vOFlo?=
 =?utf-8?B?bGNwc3gvNU1JaG4xbnlHdzdMZjhGaWZMMWRKcklqcFZ1QmhGVHZ6TmZVQUc1?=
 =?utf-8?B?dysxbVpNSzE4MnN6OGc5U0pxNzN0SHM3d05OUzJJamdSdHBLZGFLZVh6enMz?=
 =?utf-8?B?Y2ZwRWVEaHcvWCthNlhYQ1FhMStiQ293aTRpeWZZM3BwVGg3cmFTTm9CYlFy?=
 =?utf-8?B?N0doZ3RUY1h3NGNFMTJHdFZWZm85emhNWUovK29GU1VEQVViaVFMcnBES0ht?=
 =?utf-8?B?bi9UM3lDdUR3SUdKSnNwamlQVjE2OUt2WCtLVVBUVS9lem1YSVdNb2xSUUZR?=
 =?utf-8?B?ZVJRU0xDNnAvZWpZL2dwZkIxZjY4L1laelB1WWhnbThUWndiWGkzWWxXOGs4?=
 =?utf-8?B?MFVteXpCV3lYeHFQVVlMZDErT1NiUzR5ckdwNkM1VHQxaU0rMW8xZnc2cE5M?=
 =?utf-8?B?bkYyMVMrMWZFdjI2VmRtV3VDWWE0NjRqTDNKVDZwYUZIZ3dPalRjUkhYckZs?=
 =?utf-8?B?VlpTTHQwZCsycXJrTU1ZMmtkYklvOFUwTFRKOExlZiswdzJ3eTUxZExXemxh?=
 =?utf-8?B?NmxEdlFnVHpYcmJXWkw0M3pKV092L3ljZS9UQWZzMkVnbVIxTGhBdDljM3dt?=
 =?utf-8?B?amxJNXNpckhybGVYdU1OUjhpTmRUMVVsTGVWa0s1STNBaUdKR2Vjd0FnNGRC?=
 =?utf-8?B?dEhGSXZDemFpZ3J4UkxOdjNsMlYyOEJnMEdXSHVjVWd2WHBqMUhDS2R0MTV3?=
 =?utf-8?B?dW5lenh4ZlBHbml3d3FBVzJBNXYrc203UHdtSG05Wm15MGRUbnA0NEJHNXIz?=
 =?utf-8?B?UWRxWG10UWd2RDhzbGR2NXZXbzJ2ZE1nRHl0eVkrU3VObkJGc1JDbUlzL1cw?=
 =?utf-8?B?UGxranFNM3F1QVk2MGRMR1RkcHZZaGx5ZmpCZ00xa1BodmNyYVEyRFEySVFF?=
 =?utf-8?B?Zmk4T3VXK2NMUmxVK3ZsdDRmcnFXT3A0U0VwMFZYeFZ0OWZ1UU1NeU1CcW9j?=
 =?utf-8?B?a3I3TTZYTkdxcTFGZnc2VlBiY0JaQk9xV2toU29JSkpzNTcrYy9oVmhhYWxz?=
 =?utf-8?B?NnB0MTlOcjFsM3VyS3Mzd296ZzVPbmFBWFlYalRmTjRvMHlZNUpDaDhMaXRW?=
 =?utf-8?Q?ww/PjENtVESG7RtSeOKaKQ5ywlHzfVF2rAht/h6DEjtVp?=
x-ms-exchange-antispam-messagedata-1: vuLHjXNWim+ZdA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WSp00SVMcy586fRZMWT/qxWe6svwmieJ1jzZRImaU/KhPI8a7rRS7t3zZxt7J/AA7kvZG0KATjWFti5o54978p6+ZSZyDbkegRg/wXf2S+vf0LwRx4h/1oACRcsN8hAVtYM5F1Y/qPFY1W36g8CzXSovPuniXYLUxGKYjYpOstMvbRmqw75PzcmYlEF1Tni0EXRV7Yyx6cqY67mVzos9eb/yA3/bZo4m1eV2qU6jptPJ2mnv67FxVRUjKaCt4HAVx/8EDa5R59etIomI46wDpKJ47Hz0qWX5uJly9toyk7MFO8jVqULPT/qYU3D8Gvuo+BBRCC+m/Z8zaYsyr738EA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b5dab-4cd8-4c67-7d49-08decc698425
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 12:11:09.3673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eheAozBL4hAriucfPMPXg0vWtFPIgFbES40afKF+ujC3ZFXf+PudMYV3/EFZXDm34mb86DhM8+RvDoBnySSPCnGV5r0Sp7HpAbzungW1fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5776
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMTcgSnVuZSAyMDI2IDE2OjU1DQo+IFRv
OiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBs
aW51eC5pbnRlbC5jb20+OyBOaWxhd2FyLCBCYWRhbA0KPiA8YmFkYWwubmlsYXdhckBpbnRlbC5j
b20+OyBKYWRhdiwgUmFhZyA8cmFhZy5qYWRhdkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS94ZTogTW92ZSBkcm1fY2xpZW50X2Rldl9zdXNwZW5kL3Jlc3VtZSBvdXRzaWRl
DQo+IHBtIGJsb2NrIHNpZ25hbGxpbmcNCj4gDQo+IE9uIDE3LzA2LzIwMjYgMDk6MjEsIFRlamFz
IFVwYWRoeWF5IHdyb3RlOg0KPiA+IEEgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IGlzIHJl
cG9ydGVkIGJldHdlZW4geGVfcG1fYmxvY2tfbWFwIGFuZA0KPiA+IGRldi0+Y2xpZW50bGlzdF9t
dXRleDoNCj4gPg0KPiA+ICAgICZkZXYtPmNsaWVudGxpc3RfbXV0ZXggLS0+ICZ2bS0+bG9jayAt
LT4geGVfcG1fYmxvY2tfbWFwIC0tPg0KPiA+ICZkZXYtPmNsaWVudGxpc3RfbXV0ZXgNCj4gPg0K
PiA+IFRoZSBkZXBlbmRlbmN5IGNoYWluIGlzOg0KPiA+IDEuIHhlX3BtX3N1c3BlbmQoKSBjYWxs
cyB4ZV9wbV9ibG9ja19iZWdpbl9zaWduYWxsaW5nKCksIHRoZW4NCj4gPiAgICAgeGVfZGlzcGxh
eV9wbV9zdXNwZW5kKCkgd2hpY2ggY2FsbHMgZHJtX2NsaWVudF9kZXZfc3VzcGVuZCgpDQo+ID4g
ICAgIGFjcXVpcmluZyBjbGllbnRsaXN0X211dGV4LiAoeGVfcG1fYmxvY2tfbWFwIC0+IGNsaWVu
dGxpc3RfbXV0ZXgpDQo+ID4NCj4gPiAyLiBkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyKCkgLT4g
ZHJtX2ZpbGVfZnJlZSgpIC0+IHhlX2ZpbGVfY2xvc2UoKSAtPg0KPiA+ICAgICBwcmVsaW1feGVf
ZXVkZWJ1Z19maWxlX2Nsb3NlKCkgYWNxdWlyZXMgZGlzY292ZXJ5X2xvY2suDQo+ID4gICAgIChj
bGllbnRsaXN0X211dGV4IC0+IGRpc2NvdmVyeV9sb2NrKQ0KPiA+DQo+ID4gMy4geGVfdm1fY2xv
c2VfYW5kX3B1dCgpIGFjcXVpcmVzIHZtLT5sb2NrIHVuZGVyIGRpc2NvdmVyeV9sb2NrLg0KPiA+
ICAgICAoZGlzY292ZXJ5X2xvY2sgLT4gdm0tPmxvY2spDQo+ID4NCj4gPiA0LiB4ZV9leGVjX2lv
Y3RsKCkgaG9sZHMgdm0tPmxvY2sgYW5kIGNhbGxzIHhlX3BtX2Jsb2NrX29uX3N1c3BlbmQoKQ0K
PiA+ICAgICB3aGljaCB3YWl0cyBvbiB4ZV9wbV9ibG9ja19tYXAuICh2bS0+bG9jayAtPiB4ZV9w
bV9ibG9ja19tYXApDQo+ID4NCj4gPiBGaXggdGhpcyBieSBtb3ZpbmcgZHJtX2NsaWVudF9kZXZf
c3VzcGVuZCgpIGJlZm9yZQ0KPiA+IHhlX3BtX2Jsb2NrX2JlZ2luX3NpZ25hbGxpbmcoKSBpbiB4
ZV9wbV9zdXNwZW5kKCksIGFuZA0KPiA+IGRybV9jbGllbnRfZGV2X3Jlc3VtZSgpIGFmdGVyIHhl
X3BtX2Jsb2NrX2VuZF9zaWduYWxsaW5nKCkgaW4NCj4gPiB4ZV9wbV9yZXN1bWUoKS4gVGhpcyBi
cmVha3MgdGhlIHhlX3BtX2Jsb2NrX21hcCAtPiBjbGllbnRsaXN0X211dGV4DQo+ID4gZWRnZSBp
biB0aGUgZGVwZW5kZW5jeSBjaGFpbi4NCj4gDQo+IElzIHRoaXMgbm90IGp1c3QgaGlkaW5nIHRo
ZSBpc3N1ZSBmcm9tIGxvY2tkZXAgdGhvdWdoPyBUaGUgcG1fYmVnaW4vZW5kIGFyZQ0KPiBub3Qg
cmVhbCBsb2NrcywgdGhleSBhcmUganVzdCB0aGVyZSBhcyBhbm5vdGF0aW9ucyB0byB0ZWFjaCBs
b2NrZGVwIGFib3V0IHRoZQ0KPiBoaWRkZW4gcG0gZGVwZW5kZW5jaWVzLiBGb3IgZXhhbXBsZSwg
YW55IGxvY2tzIHlvdSBncmFiIGluIHJwbQ0KPiBzdXNwZW5kKCkvcmVzdW1lKCkgeW91IGFyZSBu
b3QgYWxsb3dlZCB0byBob2xkIHdoZW4gd2FraW5nIHRoZSBkZXZpY2UgdXAsDQo+IG90aGVyd2lz
ZSB5b3UgY2FuIHBvdGVudGlhbGx5IGRlYWRsb2NrLiBTbyBoZXJlIG1vdmluZyBzdHVmZiBvdXRz
aWRlIHRoZQ0KPiBhbm5vdGF0aW9ucyBwcm9iYWJseSBkb2Vzbid0IHJlYWxseSBmaXggYW55dGhp
bmcsIGl0IGp1c3QgaGlkZXMgaXQgZnJvbSBsb2NrZGVwDQo+IHNvIGl0IGRvZXNuJ3QgY29tcGxh
aW4uDQo+IA0KPiBUaGUgYWJvdmUgbG9va3MgbGlrZSBpdCdzIGNvbXBsYWluaW5nIHRoYXQgY2xp
ZW50bGlzdF9tdXRleCBpcyBoZWxkIGFuZCBpbmRpcmVjdGx5DQo+IGVuZHMgdXAgd2FpdGluZyBv
biBzb21ldGhpbmcgcG0gcmVsYXRlZCwgYnV0IHRoZSBwbSBzaWRlIGl0c2VsZiBjYW4gYWxzbyBn
cmFiDQo+IHRoYXQgbG9jaz8gVGhhdCBzZWVtcyBsaWtlIGEgbGVnaXQgY29tcGxhaW50IGFuZCBz
aG91bGQgYmUgZml4ZWQgaW4gdGhlIHVwcGVyDQo+IGxheWVycz8NCg0KVGhlbiBpdCB0b3VjaGVz
IHRoZSBldWRlYnVnIHN1YnN5c3RlbSBhcyBpdCBtb3N0IGxpa2VseSBjb21lIGZyb20gZXVkZWJ1
ZyB0ZWFyZG93biwgc2luY2UgZHJtX2NsaWVudF9kZXZfc3VzcGVuZC9yZXN1bWUgZG9lc24ndCBm
dW5jdGlvbmFsbHkgbmVlZCB0byBiZSBpbnNpZGUgdGhlIHBtX2Jsb2NrIHdpbmRvdyAoaXQganVz
dCBibGFua3MvdW5ibGFua3MgZmJkZXYgY29uc29sZSksIG1vdmluZyBpdCBvdXRzaWRlIGlzIHRo
ZSBtaW5pbWFsIGZpeCBpbW8uDQoNClRlamFzDQo+IA0KPiA+DQo+ID4gVGhlIGRybV9jbGllbnRf
ZGV2X3N1c3BlbmQvcmVzdW1lIGNhbGxzIGFyZSBzYWZlIHRvIG1vdmUgYmVjYXVzZSB0aGV5DQo+
ID4gb25seSBibGFuay91bmJsYW5rIHRoZSBmYmRldiBjb25zb2xlIGFuZCBkb24ndCBkZXBlbmQg
b24gZGlzcGxheSBwb3dlcg0KPiA+IHN0YXRlIG9yIGFueSBvcGVyYXRpb25zIHdpdGhpbiB0aGUg
YmxvY2sgc2lnbmFsbGluZyBzY29wZS4NCj4gPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBCYWRhbCBOaWxhd2FyIDxiYWRhbC5uaWxh
d2FyQGludGVsLmNvbT4NCj4gPiBDYzogUmFhZyBKYWRhdiA8cmFhZy5qYWRhdkBpbnRlbC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3Bs
YXkuYyB8IDMgLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYyAgICAgICAgICAg
ICAgfCA1ICsrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlz
cGxheS94ZV9kaXNwbGF5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5LmMNCj4gPiBpbmRleCA4MTBkOTNmZWZjYmMuLmVjNjVkY2JjM2ZkYyAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiBAQCAtMzA0LDcgKzMw
NCw2IEBAIHZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0K
PiA+ICAgCSAqIHByb3Blcmx5Lg0KPiA+ICAgCSAqLw0KPiA+ICAgCWludGVsX2Rpc3BsYXlfcG93
ZXJfZGlzYWJsZShkaXNwbGF5KTsNCj4gPiAtCWRybV9jbGllbnRfZGV2X3N1c3BlbmQoJnhlLT5k
cm0pOw0KPiA+DQo+ID4gICAJaWYgKGludGVsX2Rpc3BsYXlfZGV2aWNlX3ByZXNlbnQoZGlzcGxh
eSkpIHsNCj4gPiAgIAkJZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKCZ4ZS0+ZHJtKTsNCj4g
PiBAQCAtNDYxLDggKzQ2MCw2IEBAIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0IHhl
X2RldmljZSAqeGUpDQo+ID4NCj4gPiAgIAlpbnRlbF9vcHJlZ2lvbl9yZXN1bWUoZGlzcGxheSk7
DQo+ID4NCj4gPiAtCWRybV9jbGllbnRfZGV2X3Jlc3VtZSgmeGUtPmRybSk7DQo+ID4gLQ0KPiA+
ICAgCWludGVsX2Rpc3BsYXlfcG93ZXJfZW5hYmxlKGRpc3BsYXkpOw0KPiA+ICAgfQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BtLmMNCj4gPiBpbmRleCA5OTU2MmY2OTEwODAuLmQwMGM2MjBkMDkyNiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEANCj4gPiAgICNpbmNs
dWRlIDxsaW51eC9zdXNwZW5kLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvZG1pLmg+DQo+ID4N
Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fY2xpZW50X2V2ZW50Lmg+DQo+ID4gICAjaW5jbHVkZSA8
ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ID4gICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50
Lmg+DQo+ID4NCj4gPiBAQCAtMTc3LDYgKzE3OCw3IEBAIGludCB4ZV9wbV9zdXNwZW5kKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAgCWludCBlcnI7DQo+ID4NCj4gPiAgIAlkcm1fZGJnKCZ4
ZS0+ZHJtLCAiU3VzcGVuZGluZyBkZXZpY2VcbiIpOw0KPiA+ICsJZHJtX2NsaWVudF9kZXZfc3Vz
cGVuZCgmeGUtPmRybSk7DQo+ID4gICAJeGVfcG1fYmxvY2tfYmVnaW5fc2lnbmFsbGluZygpOw0K
PiA+ICAgCXRyYWNlX3hlX3BtX3N1c3BlbmQoeGUsIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygw
KSk7DQo+ID4NCj4gPiBAQCAtMjE5LDYgKzIyMSw3IEBAIGludCB4ZV9wbV9zdXNwZW5kKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAgZXJyOg0KPiA+ICAgCWRybV9kYmcoJnhlLT5kcm0sICJE
ZXZpY2Ugc3VzcGVuZCBmYWlsZWQgJWRcbiIsIGVycik7DQo+ID4gICAJeGVfcG1fYmxvY2tfZW5k
X3NpZ25hbGxpbmcoKTsNCj4gPiArCWRybV9jbGllbnRfZGV2X3Jlc3VtZSgmeGUtPmRybSk7DQo+
ID4gICAJcmV0dXJuIGVycjsNCj4gPiAgIH0NCj4gPg0KPiA+IEBAIC0yOTIsMTAgKzI5NSwxMiBA
QCBpbnQgeGVfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+DQo+ID4gICAJZHJt
X2RiZygmeGUtPmRybSwgIkRldmljZSByZXN1bWVkXG4iKTsNCj4gPiAgIAl4ZV9wbV9ibG9ja19l
bmRfc2lnbmFsbGluZygpOw0KPiA+ICsJZHJtX2NsaWVudF9kZXZfcmVzdW1lKCZ4ZS0+ZHJtKTsN
Cj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAgIGVycjoNCj4gPiAgIAlkcm1fZGJnKCZ4ZS0+ZHJtLCAi
RGV2aWNlIHJlc3VtZSBmYWlsZWQgJWRcbiIsIGVycik7DQo+ID4gICAJeGVfcG1fYmxvY2tfZW5k
X3NpZ25hbGxpbmcoKTsNCj4gPiArCWRybV9jbGllbnRfZGV2X3Jlc3VtZSgmeGUtPmRybSk7DQo+
ID4gICAJcmV0dXJuIGVycjsNCj4gPiAgIH0NCj4gPg0KDQo=
