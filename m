Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FBCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 10:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8788610E480;
	Tue, 26 May 2026 10:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYOIa3EW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823210E480
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779791618; x=1811327618;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=E8vcx3Y5TyPktKBHUzdd/+UucpZ5RfAZQh5DmgY7ALU=;
 b=SYOIa3EWIcbssTrIY5ZGuvymQ3EOTiXxeSB9XmmZc3Ie/MM/YKkD65Xn
 G0jz0AG+o6qnCaumXiEgJ8EbwkigkTG/qpZehsF8+X4haBmNhm/YsY2St
 yOrdv1d7pcPBGUnFwRmeAGlsNfye4PdCp0CyQjAnrhUxV0OKzSOxrz+2G
 xJ7KGbTFVvAB/T8iWgT23S8T8XhJzbucwvTfqWOOIBa5kB3y5WhqkUvY7
 KLtiHMhjIAF4ylYA7+O2JGJUWiuYK71Fgwq7EGEKSKaBO8pmkw4EIlC5+
 wWg7HlIxPGjwIfI6DVYxrRSVz1pAwpJ5VOQUY0i6TwucNyS9X+JDhAgMP g==;
X-CSE-ConnectionGUID: Kskf2aDsQWqQcVKTnze2Sw==
X-CSE-MsgGUID: YrECX3yYR76lRt8X1/DWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98024458"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="98024458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:33:37 -0700
X-CSE-ConnectionGUID: I33iK0NfRkiA4+8M8X0oOg==
X-CSE-MsgGUID: gTldcs0AQ1CjzvNhP50t4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265747427"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:33:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:33:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 03:33:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib1OguYtSUA/2sidYP+TMegSyEf8QdG0fHWxKIIr+Uubr0z0xOlLk/KIb5IhTh0A6Bw6aqtOp7uhIcqm1rlf4IdtMLdVZF95MeC3V6d+IUPqGojOuKe5Khn1fCr+wFmpV4utKFKvLkzk8ypNPu36YMMT3sjVueO1tPFb2eBe5McyWBgoqxjU6bKxXPLyQ5c7wP5+8lRvsltKysDKLtQtpXb/Pa0h8zlBU3sdcZOZf1rSLlIdOpWkndjcpl7cvVqNjpiqWubZWciF1oTKb3HrkCrkIOoABRWNl/HcNHnc0IQkpMSlMbr8D0jRJnnHCruXkzh0agxCRRwqlGF+BXiBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8vcx3Y5TyPktKBHUzdd/+UucpZ5RfAZQh5DmgY7ALU=;
 b=LOUXg9pv6//oE32BUez+8A6IBBbiNlPM5RnqXPPkiA6OmfrhJxbD704+xMiOwCY1FSji93Au5L2vi5HpGCXu3VeBgKRWUuPeWmPpfmZETYEBlTJqKwUloYwIbCbl9rRf48wVybl6rc301PxKZ3voRTKi09DnV8rb8syOz+bgRb0S7jbCr01yZgdtlMJte/aM1l/5gU6UJ/yqsojrWC2cqoMZf6qVCGuyxieysob0pyd6lFkV28Nrs86AagQnjP3PmTA6bvr6ZQFbAfcj2X13I3EBpzpdN0yMknQGlIShggRyfIimCcZoCrhGqOVmyNVVcfztlEIVQabUcxgic3kmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 10:33:30 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:33:30 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: add exec queue suspended ops callback
Thread-Topic: [PATCH 4/5] drm/xe: add exec queue suspended ops callback
Thread-Index: AQHc7OmGOByNvC+EikG/St46RTpisLYgHFyA
Date: Tue, 26 May 2026 10:33:30 +0000
Message-ID: <4d2739eba4edd450557c91c12e1bf5028791be05.camel@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-5-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260526082700.1383831-5-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB6020:EE_
x-ms-office365-filtering-correlation-id: d4c150fe-c934-44e9-99a3-08debb123afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|921020|38070700021|11063799006|6133799003|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: XFSISt5C3IaLdc9QSMqeL3WwyhWYMWE7b7gVDOl2a2WkJHj+2n/H0emq9vdZO66ID2GaNYzjE1SMXkiT2GpeekPMhqc/CKupoVeycrQVbFEwtneDhCYVs29a/gCns31kAMBmgcZxEZJEnXXZuiDbKuelB3vYuPuz19VN7z0XHAAex/TOJEaDg1+4gc1fo++zVsHZXiGm/p092f7wm3c8fQSYBJQE6HbxF07fNcSwdxneR1zFVpokAj7c6DU3sBH3CWlZbxet58x1//mx8WjX8VfUVobMHh+j10AQ4E4MMbODVXiKWVLzdV0g405A7wPaFWhetNkPpFKs+a4vbcbNV4uwgeShUlWDXn3BkzCRwXZFwefgzEnsXgJrE0eIbtz421ITzHdOzVImcYoCX3WjL7gaxQehlX5wA89gKW3kRt7E+yKL95axaxKRlsyzg6FrI4NhwbjTVWp/VIGQofC4QyfAp5OMpOtbv5d/zsxNy0ml3U3g7dTG1NCbe4i+fl5wjsZ5Ipp1u4HV1vXDDixAVK5+ESdiFv5zaXeDLz/B+ukMXtaTy9eew5f05gDOxXA7WwByQTiMlMy1LscZakPaz+2qS3qAuNsdwBupqySM1H48EuAJweFSc9NFvN9Ao6GnNawtvhmc3wvAS6FiYNGLs8on7s/nJyJPuZ+gD5UFHHgE3m9q405A/Jvbi5cgGpZlkXO72BMyC7epcYH8tuSEbfj1FmIQHkPD3cxVr9RSB6tikikff+ZgML4Fk+IjN3JBOlHfuoNZBy7dYthlJzyxXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(921020)(38070700021)(11063799006)(6133799003)(4143699003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlV4My9Kd1VuNlJ4QS9idkxybkVhaXZ4MXFyaUE4TmF6VzFhVENEUENtOC94?=
 =?utf-8?B?NVVoWEZ2MWtBMlNwVzBXWWRWbWJ1emFRTmIzSmlBUHA2TG93Z3hobUhHTjdH?=
 =?utf-8?B?ZlB1NnF6NzE5bXMvZ0lxWVp6YXRteWlZc2Z4R3FQTTFQWmlRelhkK1FvWVhV?=
 =?utf-8?B?OFZkZllBOE84b0s3cEZVc1I2MVNieEF6RHEvazhQbEhKVVI2enF2aDRlUWJW?=
 =?utf-8?B?QUlzbXBZTml5aFI4RXI4V3g1YW1KQVBQUU0rVVJRMmdxSHZlSENYOEJEMzlh?=
 =?utf-8?B?RWsydjArTXpGT2RxUHZWVFpkbkxqMmdRdU54TGp1V3U4WCsrdmUxVEVBc1U4?=
 =?utf-8?B?Vk5WNThsNFVWVlBKMno5Y2RnWXhNVmpFNGR5cll5bjFYWXpIL2NVNlovVkFM?=
 =?utf-8?B?dTNGZWdKUkVIRjFsclFiQWpzbVdFaTZoSi9aNEgySXBPcmRiK3J5VkIrVUpi?=
 =?utf-8?B?SzVUN1hOUmE5M21DenpHcGlKemVLN2hHMEVKU2VkSVNBampSbGdqdk9JNjRz?=
 =?utf-8?B?bTBGekpIY2JFRkVaSHhjSUhOc294Y2JDLzFzVXBoMUtDSzM3cmFrOTQrZU5n?=
 =?utf-8?B?Sm8rZFlKVUM5T0x3aXJRdENxRmM5dEMvUG5XYjNlMzdVeUJZVWpGQiszNHFW?=
 =?utf-8?B?S2Zidk9mcDJTYlpORytNcVJMQWRhc3k2QmRRSWFHcHFWVENCWk5MWmtuOUVJ?=
 =?utf-8?B?TlJSWlhLL0JRc3F6ZkEyOFdxa3RvazlFYlJFZ1dnUWJYN0lpYWpXWkxSNHJa?=
 =?utf-8?B?L0hLYnphcktOaGlybnQrMnp1Q215ajRJTWF2NFRFMDZWbStOc2tteGMxbzE5?=
 =?utf-8?B?dEZUVmVndlNqekgrY3c5TnczTk9vWVF3THRHWDFWOHpDWkl2TklNYzRTd2hv?=
 =?utf-8?B?czRLQk1WZ2hHNHltVjltcTlkNTBRTzdiaDFncUR3RlQway9BVk9zUzJUOVBn?=
 =?utf-8?B?WXE1b2xOUFJrWVU4eTNTeU9WUXpNaVdmL2NsbzdQaWdqczNPa2VkSUpCNHpC?=
 =?utf-8?B?Q1BDdk16NWNCY0JGWDRxSGVMN0ZlRFAzV04ycjdYWnl0Q0xGSVJQdGNZaGRu?=
 =?utf-8?B?VXVXZkdaOVZvaThJcys4cnNmVDg0WkxNeU5tTENqcStNTmt1blUzL2gxN3dk?=
 =?utf-8?B?YVZqOGpwTTAzL3V2TGxZbVZoa1RHMUFCVVFuYzVSRHJqYmFlVzF3ekd6M1lH?=
 =?utf-8?B?L2U1ajZQcHR1NVZFZ1AxbnMvclcvSWx5cFhPVkd4VTBVVUZPNkVSeUc5U1Vv?=
 =?utf-8?B?ME9oSUs2Z0tVQkc0Njg4TVJVTlN2L1hrQVpCUjJUWVpYVms0dGE1b2Z6Z2RQ?=
 =?utf-8?B?dzRVWDZMVEttdkh4S3dLWWQwN1FUcEloLzNLZUpEb0RJNUtaZ2ZLOHpaT1Nl?=
 =?utf-8?B?azdnbXRYYkZId3BLYkhHOWppdU5xS3V1QUMyU3hOVlU0RWJBOHZOemNycDhm?=
 =?utf-8?B?bmFsS21KM0FvbmhYYU1UNGtUWWltN21ydWljUDc5ZlZlVGM3SWU1Z3lZcjcx?=
 =?utf-8?B?NzE5ZGdma2tNYWdDWTBVRUI3U3FCYmFxbUpoc2N5TldoNmZnTW1BNHhZY1pI?=
 =?utf-8?B?T2lpR1Jzc1UzR3VtSnozUUlwcTFNU01iWmtzdXB4dWh1Uzk4NjFjUWVNRlZL?=
 =?utf-8?B?QVhZczREUElMZHFTL2M0cXJ0QlIycnJKRU9nVHU2d0ZSSVovV3I4bW1xRnNW?=
 =?utf-8?B?blVDbW90ajJPVWpyRXczd0hzRUczTWJPdC9uTmdQZ3Z4dUZVY2NCR0VMam1w?=
 =?utf-8?B?aWtyTTFJaHJTL2g3MldmdUU4VlVKYWVieUd5aXNSTzI5UEVJSk1mUHg1WjFt?=
 =?utf-8?B?TFVzSHozaGlzT1hNclhWU0JaSk0vbStqRVV0cjFqZEJWSFVURUZzcnBtNWZG?=
 =?utf-8?B?NW1HQWNObnhyM3ZmYUVyclVCbHFqZ0w2ZXNObWIremYrTHl0WTVxdDM1OFEv?=
 =?utf-8?B?cUNjeU9MZ2xEYy9xZC9JeHA5a3ZFS3E2SG14a0JCMXY5RS9uUnZRUWRVa3Bw?=
 =?utf-8?B?S3NpVGpsOGtBWWI3WW10VnFqR2VJdWo0ZnNST2w3MXZNRWdiWnllK1djU1E4?=
 =?utf-8?B?Vkw1QzA3c2pDYXFwMUFCa0IvVFVwcUtua2hjdHlFR3F1ZDJXbFp6b0dVaUN3?=
 =?utf-8?B?NmlkTzFtdmwwWERWemNEN0ZzZEdaK2ZFWFRDbjBBYUszZ1o0U0preFB6bE5i?=
 =?utf-8?B?VGJIRFh6OFhEa0Zna01HTXg3akFkTy9TMmFQVGZKQ0lYdEhEQ0c5NThsREU0?=
 =?utf-8?B?WFNlbVhScEk4ZjZ1Yk1ZZlBNbzVrSWgrZC92OHA3Nm5NQWVKZWxxQXFRaStB?=
 =?utf-8?B?UEVEVDZXL0orT2VDL2MwRTA3TlgrcHhuMS9kaFJ5QlFJMmV0RjlidE9MV29C?=
 =?utf-8?Q?pacVR0ugQXd54q1oaI7cTZGzDNoQqhEswEtOV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9EE57DF9F40A84F8DCDB5937E98B8C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jMn1z3YHK2FfrJDgE4zznwiLcqs/vGJbpeVid3ilsfn0sOFxMqWXjcodQTVEaXkQMrlEblB6mQOBif+8X8fZXbL3hacFCHrkurlmfoniEG0c3dPGGez8/LwGY0vTpicEWtt/asCYpT8UNBvaS4UflFiVGCTbJBEAuskCFTB6Od2jWYRh1UoVFLtHxU67tePox3AIMleEYFeKots+N9bNMt5QjuxZETfe0YzDJ1Ao4yr3+mHAVb4zPLz3W/bRLZMjeBcXRpR6sKGS0QCMlQFBvWV5J+S+vi1z+CHoM43Ru5BXP42g2xCQ3N8fU5NUv47lt2ihJ0sNjjzJgWpqF/pIDw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c150fe-c934-44e9-99a3-08debb123afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 10:33:30.6219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QIAk9bd3hhdROHujnR5zo6LfwvP6tONJ+WvW2a+slWSbM8RFo3ddk29kKsgvuYWK59fABGwrhVL08H2sOnWHiV5wrEtTKPp2ObkSCM4hm2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

T24gVHVlLCAyMDI2LTA1LTI2IGF0IDEzOjU2ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gQWRkIGEgc3VzcGVuZGVk
IGNhbGxiYWNrIHRvIHhlX2V4ZWNfcXVldWVfb3BzIGFuZCBhIGdlbmVyaWMNCj4geGVfZXhlY19x
dWV1ZV9pc19zdXNwZW5kZWQoKSBoZWxwZXIuDQo+IA0KPiBIb29rIHVwIGV4ZWMgcXVldWUgc3Vz
cGVuZGVkLXN0YXRlIGNhbGxiYWNrIGZvciBHdUMuDQo+IA0KPiBUaGlzIGFsbG93cyBjYWxsZXJz
IHRvIHF1ZXJ5IHN1c3BlbmRlZCBzdGF0ZSB0aHJvdWdoIGV4ZWMgcXVldWUgb3BzDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCj4gPHRpbGFrLnRpcnVtYWxl
c2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjX3F1ZXVlLmjCoMKgwqDCoMKgwqAgfCA1ICsrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWNfcXVldWVfdHlwZXMuaCB8IDIgKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3N1Ym1pdC5jwqDCoMKgwqDCoMKgIHwgOCArKysrKysrKw0KPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjX3F1ZXVlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5o
DQo+IGluZGV4IDAyMjU0MjZjNTdiMC4uYjY2NjM3MzI1YTExIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjX3F1ZXVlLmgNCj4gQEAgLTExNiw2ICsxMTYsMTEgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiAqeGVfZXhlY19xdWV1ZV9tdWx0aV9xdWV1ZV9wcmltYXJ5
KHN0cnVjdCB4ZV8NCj4gwqANCj4gwqBib29sIHhlX2V4ZWNfcXVldWVfaXNfbHIoc3RydWN0IHhl
X2V4ZWNfcXVldWUgKnEpOw0KPiDCoA0KPiArc3RhdGljIGlubGluZSBib29sIHhlX2V4ZWNfcXVl
dWVfaXNfc3VzcGVuZGVkKHN0cnVjdCB4ZV9leGVjX3F1ZXVlDQo+ICpxKQ0KPiArew0KPiArCXJl
dHVybiBxLT5vcHMtPnN1c3BlbmRlZCA/IHEtPm9wcy0+c3VzcGVuZGVkKHEpIDogZmFsc2U7DQo+
ICt9DQo+ICsNCj4gwqBib29sIHhlX2V4ZWNfcXVldWVfaXNfaWRsZShzdHJ1Y3QgeGVfZXhlY19x
dWV1ZSAqcSk7DQo+IMKgDQo+IMKgdm9pZCB4ZV9leGVjX3F1ZXVlX2tpbGwoc3RydWN0IHhlX2V4
ZWNfcXVldWUgKnEpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVz
LmgNCj4gaW5kZXggMmY1Y2NmMjk0Njc1Li4wY2I3ZDQ5YTFjODMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiBAQCAtMzIwLDYgKzMyMCw4IEBAIHN0
cnVjdCB4ZV9leGVjX3F1ZXVlX29wcyB7DQo+IMKgCWJvb2wgKCpyZXNldF9zdGF0dXMpKHN0cnVj
dCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4gwqAJLyoqIEBhY3RpdmU6IGNoZWNrIGV4ZWMgcXVldWUg
aXMgYWN0aXZlICovDQo+IMKgCWJvb2wgKCphY3RpdmUpKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
KTsNCj4gKwkvKiogQHN1c3BlbmRlZDogY2hlY2sgZXhlYyBxdWV1ZSBpcyBzdXNwZW5kZWQgKi8N
Cj4gKwlib29sICgqc3VzcGVuZGVkKShzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSk7DQo+IMKgfTsN
Cj4gwqANCj4gwqAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGlu
ZGV4IDc4N2EwMmM0NjY1Mi4uMmQ3ZjI1ODgwY2ZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMNCj4gQEAgLTIyMTcsNiArMjIxNywxMyBAQCBzdGF0aWMgYm9vbCBndWNfZXhl
Y19xdWV1ZV9hY3RpdmUoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEpDQo+IMKgCQkhZXhlY19x
dWV1ZV9wZW5kaW5nX2Rpc2FibGUocHJpbWFyeSk7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGljIGJv
b2wgZ3VjX2V4ZWNfcXVldWVfc3VzcGVuZGVkKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KDQpN
aXNzaW5nIGtlcm5lbGRvYy4NCg0KPiArew0KPiArCXN0cnVjdCB4ZV9leGVjX3F1ZXVlICpwcmlt
YXJ5ID0NCj4geGVfZXhlY19xdWV1ZV9tdWx0aV9xdWV1ZV9wcmltYXJ5KHEpOw0KPiArDQo+ICsJ
cmV0dXJuIGV4ZWNfcXVldWVfc3VzcGVuZGVkKHByaW1hcnkpOw0KDQpXZSBuZWVkIHNvbWUgbG9j
ayBoZWxkIGFzc2VydCBoZXJlLCB0byBlbnN1cmUgdGhlIGNhbGxlciBob2xkcyBhIGxvY2sNCnRo
YXQgZW5zdXJlcyB0aGUgcmV0dXJuIHZhbHVlIGlzIHZhbGlkIGFmdGVyIHJldHVybi4NCg0KTGV0
J3Mgc2F5IGZvciBleGFtcGxlIHRoZSBmdW5jdGlvbiByZXR1cm5zIHRydWUsIGJ1dCBiZWZvcmUg
dGhlIGNhbGxlcg0KYWN0cyBvbiB0aGUgdmFsdWUsIHRoZSBxdWV1ZSBpcyByZXN1bWVkIGFnYWlu
Pw0KDQpBbmQgdmljZSB2ZXJzYQ0KDQpUaGFua3MsDQpUaG9tYXMNCg0KDQo+ICt9DQo+ICsNCj4g
wqAvKg0KPiDCoCAqIEFsbCBvZiB0aGVzZSBmdW5jdGlvbnMgYXJlIGFuIGFic3RyYWN0aW9uIGxh
eWVyIHdoaWNoIG90aGVyIHBhcnRzDQo+IG9mIFhlIGNhbg0KPiDCoCAqIHVzZSB0byB0cmFwIGlu
dG8gdGhlIEd1QyBiYWNrZW5kLiBBbGwgb2YgdGhlc2UgZnVuY3Rpb25zLCBhc2lkZQ0KPiBmcm9t
IGluaXQsDQo+IEBAIC0yMjM3LDYgKzIyNDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2V4
ZWNfcXVldWVfb3BzDQo+IGd1Y19leGVjX3F1ZXVlX29wcyA9IHsNCj4gwqAJLnJlc3VtZSA9IGd1
Y19leGVjX3F1ZXVlX3Jlc3VtZSwNCj4gwqAJLnJlc2V0X3N0YXR1cyA9IGd1Y19leGVjX3F1ZXVl
X3Jlc2V0X3N0YXR1cywNCj4gwqAJLmFjdGl2ZSA9IGd1Y19leGVjX3F1ZXVlX2FjdGl2ZSwNCj4g
Kwkuc3VzcGVuZGVkID0gZ3VjX2V4ZWNfcXVldWVfc3VzcGVuZGVkLA0KPiDCoH07DQo+IMKgDQo+
IMKgc3RhdGljIHZvaWQgZ3VjX2V4ZWNfcXVldWVfc3RvcChzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0
cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpxKQ0K
