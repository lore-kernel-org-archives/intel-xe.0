Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B16606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kTOtcvqj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GSsPVr4R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04E210ED2D;
	Thu, 19 Nov 2026 21:37:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DAC10ED03
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795124249; x=1826660249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kwkbiHlXncIF47I0r7CkB4724QBe61VuMLGO8Vz47BM=;
 b=kTOtcvqjcvmwHUF5irPMURgeB4qNU4e+00LULD8V4+cCT/izTYL6Lrpl
 bBhRry4k10mJJ79+3K93ALJFy09NkMBGmL18z8Wtv+W4c27EiTVOBaZ+5
 4C1Q/8cQHibAJsZwb/kcplzPXRXqgeYBOC0dC2YL5zXJ60uI8kXZec/2N
 Ot+/I9KySy7onTYz9qTesVDFFTKgrKOVuLboBzAS0jHt/fNQagOnXkhaW
 OtR9ielQKmmLxmQbFBeI4khNhELVnpNeffE0de82x8zKgffEd3Rx8aNmc
 uRZaB1lpSIH5zQOYKIG+2oht2h/CP6g0GUQ93jbH1xBE577vGoLXj2OYq w==;
X-CSE-ConnectionGUID: uvY4oh+IT4unxcDjppo+gw==
X-CSE-MsgGUID: OOBSYSMZQrCShDrfwUze1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3888685"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3888685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 13:37:29 -0800
X-CSE-ConnectionGUID: I+K7fWohTFi/oFlRDFdUeg==
X-CSE-MsgGUID: /2xcbcGESoC4e89t4l5epw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10429301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 13:37:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:37:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 13:37:28 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:37:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrerq6b3RLUFh9uQBZuWe0L6E40aXQiwxzr5o/DBkUi455o2IISn83DroYBc3Z1hIk1SrkOnoxD2HTOy1vQmIINTrPHoZVdQp/Hn5vAcGWR6HNKTaK6bsyJdDBQuf0WI9MKP5+mOGi0IbgLmySolEqAW3yM/PmpGSzFdgC9UFwQDHoChRsYKjrOObKtp89MV/HUibDMBlLt0OTmu+6lXDp+ChzkMK3+yLHuy5lFZ/GxZjN8+Y2yvxy5JB0m9zlKeR+F/N51aNSePGMOvTc8MynZKpScNwRP2cSW59msUSpk4F5LJ6T4+zqJ2PeRdRb676Ap+263N2rsTpM7SA+dotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwkbiHlXncIF47I0r7CkB4724QBe61VuMLGO8Vz47BM=;
 b=R25mCjTlx31tSI9RaqtMdl32a7zKbltffozaVU/0lqTLhCWr351nSiss86xR1roYWaHdXaUa2wRIeJlDRET6PE2Yy4DhxbEyCZHOWPqDPpGIiKBldH8FL7NEZmceFgNUtG+NnSVSi3zzSdnKG6NYEtF6azNZEQUCLoNX2EhnwONUhJvGXP4Vs6bLsg+jPSNftI11vd+Q/ufchro9or2/80aoi06ySdvb8TlUIMazuY14aLdUDctWK+s1vcwdL9Sn803uj905BfEVkweQhTBYCVFotqZnM4/I3b5tAaodkn2PV+pcq7w99apoFtrJvUQKWnWCWwxXYtwlxySJn2jC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwkbiHlXncIF47I0r7CkB4724QBe61VuMLGO8Vz47BM=;
 b=GSsPVr4ROxcnCRmewQIE5h2oqV88DaU0VvfediPKLZnT5H9VOQ5OLkfUElaf6VNOGc07q281DvnW2ZxQfzSsCB04GytPOtZLXd10pFOGQqiBmdo1icchKLA2CWre1Fq6CIZVtXGYMuX5T+2bZEXK1voUuRnVU7TVaof0nTQyNNw=
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:37:24 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:37:24 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if
 already running
Thread-Topic: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if
 already running
Thread-Index: AQHdd5lBQ/WtXtfp6E2uUN181SQnl7c0ZzqAgAFWH4CAAC/GAA==
Date: Thu, 19 Nov 2026 21:37:24 +0000
Message-ID: <9f52d2b54a7d7b9fb1b6a7e388f0b3d3a32c9160.camel@intel.com>
References: <20261118195705.3231462-2-sk.anirban@intel.com>
 <0b6959abf3f037aa28da11aa90bd9dc893eb0b49.camel@intel.com>
 <e506170f-5a7e-4804-8fac-d9581f7a0e4d@intel.com>
In-Reply-To: <e506170f-5a7e-4804-8fac-d9581f7a0e4d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|PH8PR11MB6755:EE_
x-ms-office365-filtering-correlation-id: 0fc76a75-4780-485f-f18a-08df46854cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261026140227099003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info: mvuKYyxJhPB3zfvu0sWs4qzTjDtS//wI9Ux8IpsstdeuEOpKbF1a9XMTEPP8GUjbiM+CdV1/Xe4C8FqrK0Zy5hD5/MYzXXPBZQthh+LWL2qRQk7tHYcb1Mab3+e3n6mZ0DMe92Bsplab470uc/YJkuQ7IGYgfzjVsnI7HrecK1RcRaZLkiDs+ivgOnzZnhQNHbWIr9adz6ieXQJaMZu8BT1VeCXdABNyJzSrW5xoxo1LzfQh8EXhqJGis8Jcu15Ys9mUMM+2NOniyggKa51aYytwWylv+RQmeQ5P0PoKA02L+4SLl9Yy8wS6yFEnmlfPpM3LN9Kp4OZUuM5ZXHVs9n15GomvEJtpfnhUvI6QxMMl/+lPT/xxAMkEnamknaK+OsedHbg5C6j158Gz1InjIiPV7b7sCTmIchK1PurjpkSUh72ikCmLDzdIza45GkGudgYlYfgSdDCNftORRK48wMcdk7XUKgkvpiJd1evLROZWVp7OuzW6TRsihzSqifJZ5unOClq1AI1g+OjJDxWRC99wPFuA+x0HIIF1jEJkwpnYnJIR0XEobfXz9yDN65F8q/YIzEe7niFAMlJ1b7EkyANMBR6ao7ApSeiJf4CMXlgPtyB99/18MQTmSKu/6IRZK/tmjp05y8Y3zOOtB5rCu2kSVbgylRJYdJQsP2y1+i9Ef2mnqRD9d787Bs0fUDIxi3e90wIvz+lHfmQB2o+PJORksTbaS6OREnWcLwmAhLA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022113327099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elVXVUxNWVJ4QlJ2U3VLbXVvZ1JBRDkxNm1VRzliOTYyQXcwcnJDU3kvSDFQ?=
 =?utf-8?B?ZUhLV3BhaWFGdWhOZjdvOUt0VVJGT2cyQngydENldlFldHlWbU4yVUMrREFv?=
 =?utf-8?B?S3ZZTGFvVWJIVDhPK2lJYllOdFR3YXVmOXkwSlNkcm1jMnVjcmNBZXAvK3Vi?=
 =?utf-8?B?OVRIWXcySFdMWlJvMFNVK2VjYk1mSTdJWk53SCtweUdVSzBFQnY4RUlQRUVH?=
 =?utf-8?B?SDIvMENFQ000Q2YvZ0YvUjNMVnJKb1l6SHVaZWlTWXZ0NDcyaUszUkF4eVRo?=
 =?utf-8?B?YjdEK0QreWNySGxlVTBBV1FnZmFhWGJPZnhEbUVYcG53NjZ3RXFGN010d1Np?=
 =?utf-8?B?WXdsR1crQ213dnc4UGt0T1FsRkhrTWdHSWp1THEvRnJEcjM2UTMvTW85OW42?=
 =?utf-8?B?M0tuVmlBWnlUbVZrMnVla3ZuK3IxQUxKMGxmcHJaaExONGdIN3hWVzZyQldY?=
 =?utf-8?B?ZmI2T1dHNHdmMHN3d0VxZVVXQUJ4eFZBNGhDRXZGSWZsTm5QMHd2UkVjei9u?=
 =?utf-8?B?WGlkd2VycThYQUg2enpIc2gxUnFXRDFMY0x3Y3VzZStNMWpVOXQ2c2JUK25l?=
 =?utf-8?B?Y0VSMUs5SXYzMWk4SitweVdEeno4MzNkWllCRjVQNTBFdk5tTklTMWxMVUtl?=
 =?utf-8?B?dDNtQTNsUjBvbVJxL0JQNHd2RnNka0ZYRzY3K0xabExOMjJySWhmeEdrODNU?=
 =?utf-8?B?RWxKWkhTbHV5NVVrbS8wWnJJOUFGZnFXVHBmWnlaYitIcEdvNXF0YTBjYy8w?=
 =?utf-8?B?ZFdQWDZEU1l1UVhmWFk5R1k3djdWVWdNaTNkQWNiVkpNMGxrQUZxeXNxVlFX?=
 =?utf-8?B?ZEM4WnJxT1BpWHZldllDMkxGL05TME5zQ1c4aWhvVisrZGVvdFI1VEpEcGxR?=
 =?utf-8?B?TTZOcEU2UjNDb2VTTW04a1N3WmwvaHgzZUNLVVZRaEVwMjdkU1FuK0d6TjEv?=
 =?utf-8?B?dnRwZnExU2tGZ3pEeTBGdWNJMmhIRldRa010c3RlV2IvRTdScVJKRkMxWXNy?=
 =?utf-8?B?UnJRelFSdW1JdVpvWVo5d3U0dEhweUY0UjRscGQvWnZRdGtGd3ZSVjlqQUtr?=
 =?utf-8?B?WW9HV080S0hyT1NUWHRoeThud3RUTFBuRHNZUHp5UzRXZWJuVTNqSFJNS09R?=
 =?utf-8?B?YUtxODNkS2drb2xKTytzVnBDamdlYVdNS096NXJsQ3hwRzJDTlArN2dtSEx1?=
 =?utf-8?B?V0xxRERDbitVcVQzRGxZZmpGZHhDK05QSGhleCtZSU1HQ2hMTWZ2RkdDYy96?=
 =?utf-8?B?QmlGaGRYajB4R28xaGFIcXhqOXRCcys1QmFHbEVHN215UGFONnJRTHIyTHNp?=
 =?utf-8?B?QWlVRUplc0xiSnBIM3JIcEtQU0RVNHIzQkhSRVVUakdHUlUxZU5MbExha3VM?=
 =?utf-8?B?VEZVdE5VemR5QWp5ZDcvMHFuTnA3b1JzdlBvNzhGRHJ2aUFzR2Y1Q2dwRklv?=
 =?utf-8?B?d05XS2xNSll5ZlgzSER3UExRQ0tCN0ZxK0hGTWZXb2x3NzVJTGF4UVk2cmVV?=
 =?utf-8?B?VnBCaENYL04xWDB1UUlxNFlQUWFTZ2FzSXFYbEVUS0xjbWRVNXlBWEVJM0Y1?=
 =?utf-8?B?Z0dwRXpNSUM1TE1xU2FUdnowWHM4WERuZkx4VFJoVHMwTENtWDZTSUJwVTlJ?=
 =?utf-8?B?RVV2ZzE2b1kwMEtaaFJQSVRiRXVkdzUyZUwwSWp3RE9INHB6bHgvS2NnNFg4?=
 =?utf-8?B?YjNwczR5d0NIRDVxUEM1ZFZCNEt5TU00aFRSWXNhSnVHall3Qm9aUkFJZEh3?=
 =?utf-8?B?L0dZcVFEMWlTazRmTU9lMnprL3BrcEc5eHM5V2RIVENjL1BuRFdaYzBYbEF0?=
 =?utf-8?B?bU11V214SHdsdm1BWjZzZXhtUllRd2RZR1BIZno3WnIvdVFhajVEb3ZRTVJi?=
 =?utf-8?B?YzE0dU1mcHpIZnlpa2YzU0J5VHRXLzBwT0RGVG1JOHlUWGpZVklaTjk0L3NE?=
 =?utf-8?B?SEhVZTMzSmFBMnk3UndSZSs2TjhITGdhZnpVWjZ0UWRyQUd0U2tpOTREN01Q?=
 =?utf-8?B?NDBQR3BGSXREV1ltNjJLSzA4dytQVEdWc1dmOGFFZXlrR040bjhPS1ZsUXVH?=
 =?utf-8?B?MWRET0Y1RVZhY3p1dSsxWnRjRkUzekZjb3FOclVVUXhwRnlUOGRHTThybDhN?=
 =?utf-8?B?MzJLcWoxbDZQZmZ6eU11M2UrZkp5emdYYmxjSzFyeFVkNkhmb29qa1RRajNU?=
 =?utf-8?B?OCtubGlnbklqVVhzYXowSzlya0t6NWRidTJkNnhzd2ZqSjZqdS9EakxuQkJm?=
 =?utf-8?B?Mlk5WVZmT1VpN0diU2o3WVRSWUVZRjJyT2FvYThoTXA1akNCZTVnOE40cS9D?=
 =?utf-8?B?L2lpT0FWeWIvcmNpYmdoS00weXo4RDVpR2hOVFNOZmg3SGNVL1ZzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94DC351AB25FA34D84C9DBDD4ED260EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5dNaOj+xZbQco1vFFt8Q153cnlno1JU9ROoi8pVo2iZh939dpKWw7zQoqkJUADwDjK9ZNkM4SQF/tge0DVGilNetmCsqKOitC2CUvYi5JafHmaZF4/+hQcyfniYlbypfHZsEbJ+QKghSmz0+w3MZ0q3Mk2GhscG1yvzi0A0t7kJrIznQ4LKIL/FipepgcbMs2qAW7dFaLxA0LpoA/XU3PzctpJRoCtL4DoJAEkKjJRrYvBeAx4sv0R7Sw53H9YUQyffWW4f7MUMxwx4EHdMnt/Yc6Vj3YLz5mqajftS5PU/SYD+Qp+ixZ2FxxG+O4eRnmGnZmGYmk81tX6lLXqvWxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc76a75-4780-485f-f18a-08df46854cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:37:24.2523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lc5BA5XhFbHt8ZmcJ3wKM8yyqiqvOgu2e5tOUb2BB7wQj6JS+YCrX1KiJciPtX0JIM6A6ltLae+FUyAI1MeJPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTExLTIwIGF0IDAwOjE2ICswNTMwLCBBbmlyYmFuLCBTayB3cm90ZToNCj4g
SGkgUm9kcmlnbywNCj4gDQo+IE9uIDE5LTExLTIwMjYgMDM6NTEsIFZpdmksIFJvZHJpZ28gd3Jv
dGU6DQo+ID4gT24gVGh1LCAyMDI2LTExLTE5IGF0IDAxOjI3ICswNTMwLCBTayBBbmlyYmFuIHdy
b3RlOg0KPiA+ID4gT24gcmVzdW1lLCBza2lwIHRoZSBPQ09ERSBwdXNoIGlmIE9DT0RFIGlzIGFs
cmVhZHkgcnVubmluZy4NCj4gPiA+IEEgbmV3IGJsb2IgdGFrZXMgZWZmZWN0IGF0IHRoZSBuZXh0
IGRldmljZSByZXNldC4gUHJvYmUgc3RpbGwNCj4gPiA+IHB1c2hlcyB1bmNvbmRpdGlvbmFsbHks
IHZlcnNpb24tYmFzZWQgc2tpcHBpbmcgb24gcHJvYmUgd2lsbA0KPiA+ID4gZm9sbG93IG9uY2Ug
YSBydW5uaW5nLXZlcnNpb24gbWFpbGJveCBpcyBhdmFpbGFibGUuDQo+ID4gPiANCj4gPiA+IHYy
OiBTcGxpdCBwYXRjaGVzIChCYWRhbCkNCj4gPiA+IMKgwqDCoMKgIE1vZGlmeSB0aGUgc3ViamVj
dCBhbmQgY29tbWl0IG1lc3NhZ2UgKFJvZHJpZ28pDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFNrIEFuaXJiYW4gPHNrLmFuaXJiYW5AaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDC
oMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jIHwgMjEgKysrKysrKysrKysr
KysrKysrLS0tDQo+ID4gPiDCoMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbGF0ZV9iaW5kX2Z3LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVf
YmluZF9mdy5jDQo+ID4gPiBpbmRleCAzNTVkN2M4NDE4NzEuLjM2ZThlNzJjMDNhMiAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZncuYw0KPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+ID4gPiBAQCAtMzA2
LDcgKzMwNiwxNyBAQCBzdGF0aWMgdm9pZCB4ZV9sYXRlX2JpbmRfd29yayhzdHJ1Y3QNCj4gPiA+
IHdvcmtfc3RydWN0DQo+ID4gPiAqd29yaykNCj4gPiA+IMKgwqAJeGVfcG1fcnVudGltZV9wdXQo
eGUpOw0KPiA+ID4gwqDCoH0NCj4gPiA+IMKgIA0KPiA+ID4gLXN0YXRpYyB2b2lkIHhlX2xhdGVf
YmluZF9md19sb2FkKHN0cnVjdCB4ZV9sYXRlX2JpbmQgKmxhdGVfYmluZCkNCj4gPiA+ICtzdGF0
aWMgYm9vbCB4ZV9sYXRlX2JpbmRfb2NvZGVfaXNfbG9hZGVkKHN0cnVjdCB4ZV9sYXRlX2JpbmRf
ZncNCj4gPiA+ICpsYmZ3KQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUg
PSBsYXRlX2JpbmRfZndfdG9feGUobGJmdyk7DQo+ID4gPiArDQo+ID4gPiArCWlmIChsYmZ3LT50
eXBlICE9IElOVEVMX0xCX1RZUEVfT0NPREUgfHwgIXhlLQ0KPiA+ID4gPiBpbmZvLmhhc19zeXNj
dHJsKQ0KPiA+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4geGVf
c3lzY3RybF9pc19vb2Jtc21fZndfcmVhZHkoeGUpOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+
ICtzdGF0aWMgdm9pZCB4ZV9sYXRlX2JpbmRfZndfbG9hZChzdHJ1Y3QgeGVfbGF0ZV9iaW5kICps
YXRlX2JpbmQsDQo+ID4gPiBib29sIHJlc3VtZSkNCj4gPiA+IMKgwqB7DQo+ID4gPiDCoMKgCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gbGF0ZV9iaW5kX3RvX3hlKGxhdGVfYmluZCk7DQo+ID4gPiDC
oMKgCXN0cnVjdCB4ZV9sYXRlX2JpbmRfZncgKmxiZnc7DQo+ID4gPiBAQCAtMzE0LDYgKzMyNCwx
MSBAQCBzdGF0aWMgdm9pZCB4ZV9sYXRlX2JpbmRfZndfbG9hZChzdHJ1Y3QNCj4gPiA+IHhlX2xh
dGVfYmluZCAqbGF0ZV9iaW5kKQ0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgCWZvciAoZndfaWQgPSAw
OyBmd19pZCA8IFhFX0xCX0ZXX01BWF9JRDsgZndfaWQrKykgew0KPiA+ID4gwqDCoAkJbGJmdyA9
ICZsYXRlX2JpbmQtPmxhdGVfYmluZF9md1tmd19pZF07DQo+ID4gPiArCQlpZiAocmVzdW1lICYm
IGxiZnctPnBheWxvYWQgJiYNCj4gPiA+IHhlX2xhdGVfYmluZF9vY29kZV9pc19sb2FkZWQobGJm
dykpDQo+ID4gVGhpcyBub3cgc2VuZHMgYSBTeXNDdHJsIG1haWxib3ggY29tbWFuZCBzeW5jaHJv
bm91c2x5IGluIHRoZQ0KPiA+IHJlc3VtZQ0KPiA+IHBhdGgsIHdpdGggYSA1MDAgbXMgdGltZW91
dCBwZXIgd2FpdC4gSWYgU3lzQ3RybCBpcyBidXN5ICh0aGUgdmVyeQ0KPiA+IGJsYWNrb3V0IHdl
J3JlIHRyeWluZyB0byBhdm9pZCksIHJlc3VtZSBzdGFsbHMuIHYxIGRpZCB0aGUgY2hlY2sgaW4N
Cj4gPiB0aGUNCj4gPiB3b3JrZXIuDQo+ID4gDQo+ID4gQWxzbywgcGxlYXNlIGNoZWNrIG15IHJl
c3BvbnNlIHRvIHRoZSBvdGhlciB0aHJlYWQuIExldCdzIGF2b2lkDQo+ID4gZXZlbg0KPiA+IGlu
IHRoZSBwcm9iZSBhbmQgb25seSBhZGQgdGhlIHZlcnNpb24gY2hlY2sgaWYvYWZ0ZXIgRlcgZ2l2
ZXMgdXMgYQ0KPiA+IHJlbGlhYmxlIHdheS4NCj4gPiANCj4gPiBBbmQgcGVyaGFwcyB0aGF0IGNv
bmZpZ2ZzIHRvIGFsbG93IGZvcmNlIHRoZSByZWxvYWQgZm9yIGRlYnVnIGFuZA0KPiA+IGRldmVs
b3BtZW50IGNhc2VzLg0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIEFncmVlZCBvbiBhbGwgcG9p
bnRzLCBmb3IgdjM6DQo+IA0KPiAtIE1vdmUgdGhlICJhbHJlYWR5IHJ1bm5pbmciIGNoZWNrIGJh
Y2sgdG8gdGhlIGxhdGUgYmluZCB3b3JrZXIuDQo+IC0gQXBwbHkgdGhlIHNraXAgb24gYm90aCBw
cm9iZSBhbmQgcmVzdW1lIChJIHdpbGwgYmUgbWFpbnRhaW5pbmcgYSANCj4gZGlmZmVyZW50IHBh
dGNoIGZvciBwcm9iZSBwYXRoKS4NCj4gLSBBZGQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIGEgY29u
ZmlnZnMga25vYiB0byBmb3JjZSB0aGUgT0NPREUgcmVsb2FkDQo+IMKgwqAgYXQgcHJvYmUgZm9y
IGRlYnVnIG9yIGRldmVsb3BtZW50Lg0KPiAtIFZlcnNpb24tYmFzZWQgcmVsb2FkIG9uIHByb2Jl
IHdpbGwgZm9sbG93IG9uY2UgdGhlIG1haWxib3ggaXMgcmVhZHkNCj4gdG8gDQo+IHVzZS4NCj4g
DQo+IEEgY291cGxlIG9mIHF1ZXN0aW9ucyBiZWZvcmUgSSByZXNwaW46DQo+IDEuIEZvciB0aGUg
Y29uZmlnZnMga25vYiwgc2hvdWxkIGl0IGJlIHZpc2libGUgb25seSB3aXRoDQo+IMKgwqAgwqBD
T05GSUdfRFJNX1hFX0RFQlVHLCBhbmQgYXBwbHkgYXQgcHJvYmUgb25seT8NCg0KeWVzLCBwbGVh
c2UhDQoNCj4gMi4gSWYgdGhlIEdFVF9BUFBfU1RBVFVTIHF1ZXJ5IGl0c2VsZiBmYWlscy90aW1l
cyBvdXQsIHNob3VsZCB3ZQ0KPiDCoMKgIMKgcHVzaCAoY3VycmVudCBiZWhhdmlvdXIpIG9yIHNr
aXA/DQoNCmdvb2QgcXVlc3Rpb24uIEkgd291bGQgc2F5IHRvIHNpbXBseSBnbyB0aGVyZSBhbmQg
YXR0ZW1wdCB0aGUgcHVzaC4NCg0KSWYgRlcgY29udGludWUgdG8gaGF2ZSBpc3N1ZXMgdGhhbiB3
ZSBjaGFuZ2UgbGF0ZXIgZm9yIGEgYmFpbCBvdXQgd2l0aA0KYSBiaWcgZXJyb3IgbWVzc2FnZS4N
Cg0KPiANCj4gVGhhbmtzLA0KPiBBbmlyYmFuDQo+ID4gPiB7DQo+ID4gPiArCQkJZHJtX2RiZygm
eGUtPmRybSwgIiVzIGZpcm13YXJlIGFscmVhZHkNCj4gPiA+IGxvYWRlZCwgc2tpcHBpbmdcbiIs
DQo+ID4gPiArCQkJCWZ3X2lkX3RvX25hbWVbbGJmdy0+aWRdKTsNCj4gPiA+ICsJCQljb250aW51
ZTsNCj4gPiA+ICsJCX0NCj4gPiA+IMKgwqAJCWlmIChsYmZ3LT5wYXlsb2FkKSB7DQo+ID4gPiDC
oMKgCQkJeGVfcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoeGUpOw0KPiA+ID4gwqDCoAkJCXF1ZXVl
X3dvcmsobGF0ZV9iaW5kLT53cSwgJmxiZnctPndvcmspOw0KPiA+ID4gQEAgLTUxMSw3ICs1MjYs
NyBAQCB2b2lkIHhlX2xhdGVfYmluZF9wbV9yZXN1bWUoc3RydWN0DQo+ID4gPiB4ZV9sYXRlX2Jp
bmQNCj4gPiA+ICpsYXRlX2JpbmQpDQo+ID4gPiDCoMKgCWlmICghbGF0ZV9iaW5kLT5jb21wb25l
bnRfYWRkZWQgfHwgbGF0ZV9iaW5kLT5kaXNhYmxlKQ0KPiA+ID4gwqDCoAkJcmV0dXJuOw0KPiA+
ID4gwqAgDQo+ID4gPiAtCXhlX2xhdGVfYmluZF9md19sb2FkKGxhdGVfYmluZCk7DQo+ID4gPiAr
CXhlX2xhdGVfYmluZF9md19sb2FkKGxhdGVfYmluZCwgdHJ1ZSk7DQo+ID4gPiDCoMKgfQ0KPiA+
ID4gwqAgDQo+ID4gPiDCoMKgLyoqDQo+ID4gPiBAQCAtNTUwLDcgKzU2NSw3IEBAIGludCB4ZV9s
YXRlX2JpbmRfaW5pdChzdHJ1Y3QgeGVfbGF0ZV9iaW5kDQo+ID4gPiAqbGF0ZV9iaW5kKQ0KPiA+
ID4gwqDCoAlpZiAoZXJyKQ0KPiA+ID4gwqDCoAkJcmV0dXJuIGVycjsNCj4gPiA+IMKgIA0KPiA+
ID4gLQl4ZV9sYXRlX2JpbmRfZndfbG9hZChsYXRlX2JpbmQpOw0KPiA+ID4gKwl4ZV9sYXRlX2Jp
bmRfZndfbG9hZChsYXRlX2JpbmQsIGZhbHNlKTsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoAlyZXR1
cm4gMDsNCj4gPiA+IMKgwqB9DQo=
