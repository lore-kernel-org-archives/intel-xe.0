Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCCBC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 07:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D6510E77C;
	Mon, 20 Jul 2026 07:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2VcikKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87DA10E7A9;
 Mon, 20 Jul 2026 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784532538; x=1816068538;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LfUrAFQElNUD59IhBjGvdv83ZR5VKVjvkxJb73wnXBM=;
 b=N2VcikKEHcNd4UvIGTaAobXQYKizeDQqFqTt3Ob38xaRPH/PsiPSfFIe
 35pnmqnU7JbJXGRJmX6N5iXrnGDkne4DIc8oS+jrTgQkDuRY5nGb6/x+f
 j2NuKf681/WpANeGxVBLlIhAhGLh0MCfGDJjk8YXg8nDhNbaSWxzIadwi
 E7yzk7NvpbOWqrHuc86bYBai2jF6v3E2ixCffjRJENVqOsujnUFVTi+Mo
 2o6Sjp5sMee5sF6Ba6iSBN6v22e1fmxi4BerH7qAkIMNuY3XL2bBN9Bji
 4cyYT1vnSAN0JyrHh8x1DRGsP6aMOao44IhMJhTGq9YUuwfH+8qSt3zRb Q==;
X-CSE-ConnectionGUID: jJx0EvbNS3a9OlIp2rsRkw==
X-CSE-MsgGUID: 5lRKlstwQLSWyVAa2NefPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84230146"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="84230146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:28:53 -0700
X-CSE-ConnectionGUID: K5ktghYZRXG/g3P5jQRsRA==
X-CSE-MsgGUID: H8Df9s0JQJSReMOK++drnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="255603724"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:28:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:28:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 00:28:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXh2RSDTqVgIJdG6O8CxJFjuooCuLB2f++/QVyrbkpFM4yD/Fa2EsyGa45fTQ8cZ4Ji3gwcFgMhCuVjDHRdP2iwlaH1458d+s6xW72uvVF3gsQrXmHvhB84tPCt0pOEV46RxSKIPHnf+jHwf1SAQvDJ3KZqepS7Y7HnpJEtSs5aB3k+o2qioaP1HgEzGMG3P+MUSebLHNdQJaJK5o+QR8w0uMSWv8lDeRex/iRcrOo1JSqFKgmaSrTIFqzk0c56Ie/IGvSuYVDgYd7vDFWXutyTVvp0hnYWd5RKtQbiyOjP6rOdlK35SOfA/Px4OnR4z2XACOKBVfOXdaunVkLpk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfUrAFQElNUD59IhBjGvdv83ZR5VKVjvkxJb73wnXBM=;
 b=acpLcheRfjV77jgBx+kaPkGfvYFqqPamXwDeQO9MUPUS/7mqaZabYzQPd+f/q0m10bj2iBz6+nfkkHv6odLJPluRAtRaPMAYAjffzGsYA9YLUtRJR8xOiwhZYY7C2KfViIKquQZeLGnZKBhZmag3Ffl6NmrQNDtzgA73QSJOkloPr3bOyDZ4yF90X3KitmvyGeLRkykmWTuFnmwSgfMJtQpTIFWRF3widhoIPHDJD0qjgt+G25JmlMxFJT4uSo4iiH0M5rVHBsllxMi7TqqzpjSWoYQxCXcwsEVoRs2oK6hIQP+X/0sBTonhtI9PWH/DButtbwhd4TOIg4SJ7LTMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 07:28:48 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 07:28:48 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Garg, 
 Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Thread-Topic: [PATCH v2] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Thread-Index: AQHc/wg1l3AV7y9oYEOVRbMJaQvUk7ZLqaOAgAAKSICAKoC7AA==
Date: Mon, 20 Jul 2026 07:28:47 +0000
Message-ID: <a9be442c3277c3a0cf326fbc911cb4658c0e17b8.camel@intel.com>
References: <20260618095210.853339-1-jouni.hogander@intel.com>
 <IA1PR11MB646760B05826CB3EE6901F59E3EE2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <IA1PR11MB646798C1E944E91275464961E3EE2@IA1PR11MB6467.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB646798C1E944E91275464961E3EE2@IA1PR11MB6467.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA0PR11MB7882:EE_
x-ms-office365-filtering-correlation-id: 6028379c-e3ff-49a6-23e7-08dee6308a1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|10070799003|376014|10067099003|4143699003|3023799007|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: GWCHvJo3TWa53wdnXjR5Adwa4jGybTqp45Rqe6NLnUskrp3GnlTgChoHGjjmFWqJTC/GVROrFA0pmQttUCfGUYgGA6i01Yz+a2MEwW3TLhclBhy9wxB+lEaIrAW1wuC78xe/H8r8D0z66MaFILztkc00YD3Oa4Y/dZX1xDCF/+DQcKk7b7GKqE3ph4LG3WoOnSnuHI7ivw/u2Z/Jcg+UqBEXVXxWiF//1O8tdTbozbW1yZZlUjW/KElghcTctZpaBU6TFvJUkTIpNmOR9PVh6TVlyavHFOlai28MtJs0sMmjEQadtv9Im/BhHPoTaD72Rv+qEx62MkTJ17EVWFmU/yhVthmhv0HkBjHnkYUWu8cc+SRua4S15hZ8QnjPvGYiZle3h0/AiUc3DATjKxYcjzVVVkmq+RdYLRdo9YzmZsKfJIp5Y54yQpVM3oKauHBYuIQwzyZgK37dlZ92Xn25LrRs7OvmWg+F8TLYheQIJeUDeuY4ahakJ3czB/Mk9nhv2Mr3Vw3eM0h+WZnlslYrP3+XGaMtrBkWq3U1l97mR6cNuiIHJpGBSO6DguJMsczcErbmM7d4uKa9ZY9hsqiYCMHH2AHdJWDAZQy+qGY7RWtprwPoGOV1Of4LGp+Yv3eqVVk77ieVXk+i80TOVAa8JKbAdBZOn480wgH/iEAaKZ0IGGTCeiCQvoS2AGX76+FmBn7J/y2TbxLFmfCladRRSoYMKrWt0jaCUs0Gieka4Js=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(10067099003)(4143699003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZFelliR29rZW04V3ZFZlZlc2lZT3RFTWdFRUNGcjROVmpxTnkrTGRlSnJY?=
 =?utf-8?B?VW1GdmxuYmRoUm9KalRBMGliUXlWa2pKMU0xQVN5M0VEL3NFdU1kL0gzaU1k?=
 =?utf-8?B?T3YrNGw2Z0JUazRKU2ZKaEhnNDUxQlhoUHJGV3F0SzBhd3JMenp4RlgwMGRK?=
 =?utf-8?B?YlF6TzlSQVpXWG9wVEVDdW5jalhCRldhYk9vS1I3N3A0OVFLTDVsN0tuV1Ay?=
 =?utf-8?B?TTRBN2dLTm5rdThPVTNERVJqYkQrcUtmRWs4OWNVUXNQVHM3WUxPdTdRMXRT?=
 =?utf-8?B?Sy9DOUplbGk0Z2s3amVCVUxhd1ZDbzlBMnAxdC9HQVl5dHRpYjRFTHhreEFY?=
 =?utf-8?B?YzNZVS9UK3Q4cExoNWFiU01zYkRWU2dlOTlzZWJoQWU5YUNGa2Vsb2NKZTV2?=
 =?utf-8?B?VGFIYjBQaFNDRmg4SE9IbWs0cm5JQ2ticlRUOHNQLzNHa3JGMjVRRkY4Y015?=
 =?utf-8?B?WS9RWDZ5bi9GMjRsL294Ynd5RXNUSy9Cck83eTMwTjFXSTIrMXM2UkhSbVd0?=
 =?utf-8?B?Kzd4SEx1TWYwVElwZ3ZCdGpaelFwNG9LT3F1K05rYU5zZTV3cXZnaVR0QmRQ?=
 =?utf-8?B?dWMxUHlvNXhnVkpRQUhnMXFTeE9ROS9JNVczditBVkNRdVBYVHlpeE85UkFL?=
 =?utf-8?B?UXphSCs0OGpvU0IvWXlmSDFYTE9iY252K0hiVzkzaHdWYTdoU0h2SmRDSTJ0?=
 =?utf-8?B?RkNYZ25reEJ1SkdGZ09UUTJhZkNpTlI2Z05MYmhWakNPSVY2MFdTb0NRS29a?=
 =?utf-8?B?aTBoL1drelpXR3FyNE9wTms4b25YcktlS3UrNHRTMDN0bjdvZ2xGOWU5WVlM?=
 =?utf-8?B?RmI3T0FPQ0pla1U2eFkvemNYVHlBbFdYSGNkQThpMUpwYTJUckpWa3lzMXpJ?=
 =?utf-8?B?Q29NRkdJellra0xNSDlQa0QzNlg0L2tIdWt5bW1MMFhuTUc1U1VaY0VlVk5h?=
 =?utf-8?B?aFZxRDlrU2VHMjMrTW1UbXhncTZUZTRwUklMNGZhUWMyMXFuK1krY0ZxQllG?=
 =?utf-8?B?ZjBSNWdHZTFqSHYxeVQzTzIzSlJiTmlaR3dxeHIrajB3eXdGcGdza3FsVWJU?=
 =?utf-8?B?UXVhQ0NqaDBBZUp0YlN1UmZwSWhCSzR2QkFtaWpTampXMXlhNXJ4cVRNbjZM?=
 =?utf-8?B?bm1tTDBoVU9SRTU4K1hrckQ1QVpPb0VTczdselFNajBNZEVuNGhnbEx4Tm5K?=
 =?utf-8?B?YUE0dENxYXIyMWIwS2Mwdi8wek9xc1FWK1AzcUdGZVZGWkF4Ky9IU2JCbTNp?=
 =?utf-8?B?aXV0OUs5NHcwNG5lKytHbmtCdkJCbHI3VHI2WGtNMjdKMERUMU5FbkVIU2d6?=
 =?utf-8?B?MmZvc1hKQnZBbjB1bk1GMStlc01RUlpJVFYzRi9lT0VOeHV0bndQMUYvVDUy?=
 =?utf-8?B?NEtCeEhGcnF5aHIzekhzU3NwR003ZTVCUGZmQ3NOSUlDSE02SUFmODFSZjNS?=
 =?utf-8?B?NzJ5NzVQckFieVlrWTVyVDlJUnhNelI5bXRuWVA5NWUxNVZzcHV3QzRVQ1I3?=
 =?utf-8?B?RXhhMjNLS2N0WllXVW9SRjRpb2h2bWFKTWNyY0hwbmNMQ1ZDNDVyWUt5TGQz?=
 =?utf-8?B?c25nelFoRXU2L0NHRTZhcTJCWnQ0RWhnZUdLUGtxWVBiNDRLdFpSMDJHZU9l?=
 =?utf-8?B?cGtuY0FmUi9TaVFMV0xRZ1hrNGVvSkxiMERSLzFwWTN6NTVieC9DQXUrQ0Nn?=
 =?utf-8?B?U1p6c1pqZlFpd1Z3aCtlY0pENEo1MldHQXBNRFgzaldVUFFHZGpVbEN3NHZW?=
 =?utf-8?B?U3dNKzAxK2hjUm5WUkNDSEVxMzZXV0dzR3JoTit2V0NCcUZ2R0h2bGtzc1ky?=
 =?utf-8?B?eEJQQXEydXVnU3R3QjFveDFDZ3d0L1IvZWZ0U2FJUjJLVkVZRXVqOU5Sclhm?=
 =?utf-8?B?cTI5dHB2a2tPeHE3Sk1FZUFZWGkrR2RweDNLdUcwd1Z2Ky80L0puYzA5cTcw?=
 =?utf-8?B?WXJEOFo3QTZiRHl0aFhYanBMZjNqSjIrMHNWRmJvaTNyM1IvS0JwZkxpOW9p?=
 =?utf-8?B?eGZ5TWxGaHdVc1JjZUJDbERBalh2NFRvNFRZbVY1a0NnUTRCQk5sZytiMzlu?=
 =?utf-8?B?Z3pPbXUvYmFyR3hURThldDVscEFBUGVtSm5RNDFJL0VYOEhIYlVjU3FGTFha?=
 =?utf-8?B?a2dZeUNOT3pvN2FJTkRXdisrUjlnVHhUaE9ZWmhwSDRaNFN5VGRtUjI5SVFF?=
 =?utf-8?B?RTZDUnJ5bmdNOW5qLzFVSWNrT0dtalBDR2xNejg1dUJ0aElHd0w2MndRcS9N?=
 =?utf-8?B?T1JMNm1udDZEYk5CNm5VNFd3TDlKbEJtYVo3dW5HbEZ1WWY5N3ZlRVl6b3U0?=
 =?utf-8?B?amlOTVVOQ1V0cTlnOGpzQkYxL3Y3Y2hJOVpZeHY1WW5zQ0p1c3c3NEh5SVls?=
 =?utf-8?Q?hdv3JoYu/5ajHKeRUL9ROKc18x+1qEY9QrV1m75FTuV+n?=
x-ms-exchange-antispam-messagedata-1: pxBdTdH8HIvWs202JmMQKGcEZzK5IXtGFIA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5C56D630811E44FB8B044D3EAC0EB00@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XIXM6g5We8gbv67HBFBnHgaRlHFgcjdW4ZRjuYfbG4cvs7I57JMmobXlGWePJySnjiMPdicxuMnwJZZwJgQHHOcLTTMDzWGhntKwtRY6sKCqWzPfIECssFvMzG9zVcQNcyKeFaYg/MvmhvRmXJr4fSZZBoN3MG6IlplQ9RPNBeYJeAb6fy5zoE+eH0GQ7w7uI0s4C1PUN22UoDX0Wu/8uzdtNZPnCPXRRsNpNmwe/ZFjAL15FnPU1kRmOfsb+sZs8U101V81lsOW2fnYdTfF4HjRvsvUnbJ2g1lkWOp9Xv5+irxWAxm2mB17XvyciYO71+ow2+ChT/pMWijg01hdIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6028379c-e3ff-49a6-23e7-08dee6308a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 07:28:48.3022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TT6OSGGNvs1f6wpuvIqOZMLvbP4zXaanV3NBA3WoEaAGxC1uXpSLP+rBUl1sEA1Pt7CcPebqBKsGJAEdsPEMz1PhdWjujZCxzQrHUcRRMJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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

T24gVHVlLCAyMDI2LTA2LTIzIGF0IDA2OjI0ICswMDAwLCBHYXJnLCBOZW1lc2Egd3JvdGU6DQo+
IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEdhcmcsIE5l
bWVzYQ0KPiA+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjMsIDIwMjYgMTE6MTggQU0NCj4gPiBUbzog
J0pvdW5pIEjDtmdhbmRlcicgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT47IGludGVsLQ0KPiA+
IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4g
PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyXSBkcm0vaTkxNS9wc3I6IEZvcmNlIGZhc3RzZXQgb24g
ZGVidWdmcw0KPiA+IHdyaXRlIGZvciBlYWNoDQo+ID4gY29ubmVjdG9yIHN1cHBvcnRpbmcgUFNS
DQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IE9uDQo+ID4gPiBCZWhhbGYgT2YNCj4gPiA+IEpvdW5pIEjDtmdhbmRlcg0KPiA+ID4gU2Vu
dDogVGh1cnNkYXksIEp1bmUgMTgsIDIwMjYgMzoyMiBQTQ0KPiA+ID4gVG86IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiA+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2k5MTUvcHNyOiBGb3JjZSBmYXN0c2V0IG9u
IGRlYnVnZnMgd3JpdGUNCj4gPiA+IGZvcg0KPiA+ID4gZWFjaCBjb25uZWN0b3Igc3VwcG9ydGlu
ZyBQU1INCj4gPiA+IA0KPiA+ID4gQ3VycmVudGx5IGludGVsX3Bzcl9mYXN0X3NldF9mb3JjZSBp
cyBmb3JjaW5nIGZhc3RzZXQgb25seSBmb3INCj4gPiA+IGVEUCBjb25uZWN0b3JzLg0KPiA+ID4g
UGFuZWwgUmVwbGF5IGlzIHN1cHBvcnRlZCBvbiBEUCBhcyB3ZWxsIGFuZCB3cml0aW5nDQo+ID4g
PiBpOTE1X2VkcF9wc3JfZGVidWcNCj4gPiA+IGlzIHNldHRpbmcgZGVidWcgcGFyYW1ldGVycyBm
b3IgZWFjaCBEUCB0cmFuc2NvZGVyIChzdHJ1Y3QNCj4gPiBpbnRlbF9kcDpwc3I6ZGVidWcpLg0K
PiA+ID4gRm9yY2UgZmFzdHNldCBmb3IgZWFjaCBjb25uZWN0b3Igc3VwcG9ydGluZyBQU1Igb3Ig
UGFuZWwgUmVwbGF5Lg0KPiA+ID4gV2hpbGUNCj4gPiA+IG1vZGlmeWluZyB0aGUgY29kZSBhbHNv
IHN3aXRjaCB0byBmb3JfZWFjaF9pbnRlbF9jb25uZWN0b3JfaXRlci4NCj4gPiA+IA0KPiA+ID4g
djI6DQo+ID4gPiDCoCAtIHVzZSBmb3JfZWFjaF9pbnRlbF9jb25uZWN0b3JfaXRlcg0KPiA+ID4g
wqAgLSB1cGRhdGUgYW5kIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4gPiA+IA0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Iu
YyB8IDkgKysrKystLS0tDQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiA+IGluZGV4IDkxMWFmYjljYjI0ZTMuLjYyMmVkZmI2
YTdmYjIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jDQo+ID4gPiBAQCAtMzM3NSw3ICszMzc1LDcgQEAgc3RhdGljIGludCBpbnRlbF9wc3Jf
ZmFzdHNldF9mb3JjZShzdHJ1Y3QNCj4gPiA+IGludGVsX2Rpc3BsYXkNCj4gPiA+ICpkaXNwbGF5
KQ0KPiA+ID4gwqAJc3RydWN0IGRybV9jb25uZWN0b3JfbGlzdF9pdGVyIGNvbm5faXRlcjsNCj4g
PiA+IMKgCXN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCBjdHg7DQo+ID4gPiDCoAlzdHJ1
Y3QgZHJtX2F0b21pY19jb21taXQgKnN0YXRlOw0KPiA+ID4gLQlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubjsNCj4gPiA+ICsJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yOw0KPiA+
ID4gwqAJaW50IGVyciA9IDA7DQo+ID4gPiANCj4gPiA+IMKgCXN0YXRlID0gZHJtX2F0b21pY19j
b21taXRfYWxsb2MoZGlzcGxheS0+ZHJtKTsNCj4gPiA+IEBAIC0zMzg5LDE0ICszMzg5LDE1IEBA
IHN0YXRpYyBpbnQgaW50ZWxfcHNyX2Zhc3RzZXRfZm9yY2Uoc3RydWN0DQo+ID4gPiBpbnRlbF9k
aXNwbGF5ICpkaXNwbGF5KQ0KPiA+ID4gDQo+ID4gPiDCoHJldHJ5Og0KPiA+ID4gwqAJZHJtX2Nv
bm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGlzcGxheS0+ZHJtLCAmY29ubl9pdGVyKTsNCj4gPiA+
IC0JZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm4sICZjb25uX2l0ZXIpIHsNCj4gPiA+
ICsJZm9yX2VhY2hfaW50ZWxfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7
DQo+ID4gPiDCoAkJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGU7DQo+ID4g
PiDCoAkJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiA+ID4gDQo+ID4gPiAt
CQlpZiAoY29ubi0+Y29ubmVjdG9yX3R5cGUgIT0NCj4gPiA+IERSTV9NT0RFX0NPTk5FQ1RPUl9l
RFApDQo+ID4gPiArCQlpZiAoIWNvbm5lY3Rvci0+ZHAucHNyX2NhcHMuc3VwcG9ydCAmJg0KPiA+
ID4gKwkJwqDCoMKgICFjb25uZWN0b3ItPmRwLnBhbmVsX3JlcGxheV9jYXBzLnN1cHBvcnQpDQo+
ID4gPiDCoAkJCWNvbnRpbnVlOw0KPiA+ID4gDQo+ID4gPiAtCQljb25uX3N0YXRlID0NCj4gPiA+
IGRybV9hdG9taWNfZ2V0X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubik7DQo+ID4gPiArCQlj
b25uX3N0YXRlID0NCj4gPiA+IGRybV9hdG9taWNfZ2V0X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwN
Cj4gPiA+ICZjb25uZWN0b3ItPmJhc2UpOw0KPiA+ID4gwqAJCWlmIChJU19FUlIoY29ubl9zdGF0
ZSkpIHsNCj4gPiA+IMKgCQkJZXJyID0gUFRSX0VSUihjb25uX3N0YXRlKTsNCj4gPiA+IMKgCQkJ
YnJlYWs7DQo+ID4gPiAtLQ0KPiA+IExHVE0sDQo+ID4gUmV2aWV3ZWQtYnk6IE5lbWVzYSBHYXJn
IDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQo+ID4gDQo+IEp1c3QgYSB0aG91Z2h0IHNob3VsZCB3
ZSBhZGQgYSBsaW5rIHRyYWluaW5nIGNoZWNrIGJlZm9yZSBmYXN0c2V0IHRvDQo+IGVuc3VyZSB0
aGUgbGluayBpcyBlc3RhYmxpc2hlZC4NCg0KSSB0aGluayBsb2NrIHRha2VuIGJ5IGRybV9hdG9t
aWNfZ2V0X2Nvbm5lY3Rvcl9zdGF0ZSBpcyBlbnN1cmluZyB0aGVyZQ0KaXNuJ3Qgb25nb2luZyBs
aW5rIHRyYWluaW5nLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiA+ID4gMi40My4w
DQo+IA0KDQo=
