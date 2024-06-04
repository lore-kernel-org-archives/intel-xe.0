Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555DDC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 18:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB2310E5C0;
	Tue,  4 Jun 2024 18:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmIxbWMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC8910E5C0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717527453; x=1749063453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VZFLBAiy0nE7+uxpCou55/tYWSIwLntI4fb2s6DU+ng=;
 b=KmIxbWMPJucpoW+7v7vhNDo6Z5HXuOT9bH9jc/EtNcTQwx0MlfhuTvL/
 OoFRUHNjVa3hIBdssqL8hd9uIDF2gi2n24YRWJt8pUydTHv+C4hbmNi1R
 +ouKWviNr/kKd3lkDKj2bMNpFxzn82ZdmMhipH+vJ6xtl87ZRMw1JCT0H
 FbUhP+1f43MpyBqMdoHORm+WShMek2RFcWLoTbXHjKN9sC+4DYIWQpCmO
 f2FpF+2CHjsphZbiIgIaQw5z2zHrMWbor2+ixbiqgewmbWyQDWQqbDm+H
 OdzpUno1xmdh31vE24QhZpElSwfHdJHA+nd2A/MlPaoFYKIvgjy+ft2MM g==;
X-CSE-ConnectionGUID: 1GvUvMqsSjO/osdtG1S5pg==
X-CSE-MsgGUID: R+/KWqUVS2qqtYkxCXXhlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13905988"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13905988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:57:32 -0700
X-CSE-ConnectionGUID: ZMuxIlInSXaSKAxSt41SgA==
X-CSE-MsgGUID: xmENbDd+R+ekT/sJtINfaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="60523446"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 11:57:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 11:57:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 11:57:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 11:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs+AyzyxMpRuFs9U2Zb8iIRM05lQLj89vTJ05/bBD1jS4Mc+iD/RyCxRXr2Jx5WZCQ0Qap93UMXVB4STWBbQTBx9bJJVVblKSDIsnzU4UKsnr6WAmsz2paq9vHhEz+7cph1VlVDqteNU9G4rMAU6Gv4jD/XaEMkLDdRokddT9bXoBlV6tQnmg/SYx2ySJgVdWI7P2DY1zpseO7vHRQD5N/6wP2DOAFroB5HqrS5CR6O3IAYaNGq408jq4eNVUioSpVJvdeILhflwS0sIhGrz8IjcnSXDu3zp+W8vvnba1quNvGh05jlexTL0yRPrNuE3BNYAUUUw7XiLdGtsXVgvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg0y7H9HYWqZsOULzkY4jrhemAwtTAqvLVDDf4h+af8=;
 b=AvuMw70gI/R/5U0p5EecxZRewy4OYufVXD1zpf2rwoCRWPLEmsKX+xd1fGJPsbT02HwIu+nEI3+1hK4evmPkSR9ea/2Xe0DaH4GhkNpkLXlZsf6D4+0piKBX3rM+8PQf6Ct+GHVzNsHB0wO67Tqjg/sG2nHbM7rxZSwK3/zl41Gxx51pX8lhKXC+Psr2/OrUiuNaPeIcaAW0du/T/Q8APwz5B9o5cL+0uLMYRuWtuCsuhhDdBQX0UtIyIUoSxURIKyAXqIh1ACdYOznQfHjOQ7R2kxJzfeRyYqwbeTqxm+NqcjCLYkbsqO51bzcLEzloC9SpXZbPX/pu/zERM3nErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 18:57:25 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7587.035; Tue, 4 Jun 2024
 18:57:25 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 13/31] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Thread-Topic: [v2 13/31] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Thread-Index: AQHairlkzj1txGzmNUWWtgljipsrH7FiAlaAgFYcJwA=
Date: Tue, 4 Jun 2024 18:57:25 +0000
Message-ID: <SA1PR11MB69913723DED66E2C09473D8992F82@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-14-oak.zeng@intel.com>
 <ZhcA569I7IajGMHH@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhcA569I7IajGMHH@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB5897:EE_
x-ms-office365-filtering-correlation-id: dbc15870-a7c8-4c14-763e-08dc84c82c8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ynouu6VOiFtBBZWQtCN+6sIcJiLYIlxpFDRkUvgsez7ntK7aCzznt0o271?=
 =?iso-8859-1?Q?PeTjs5USMh/1z3o2RsiCx90CZW+7GzFBFOAidAClArlHuZOh7fgZh8szX0?=
 =?iso-8859-1?Q?1NxDveqRPi67QAXPx5bABTWXYCzPuFmShREJfhuzAmNgFGG4QQ3DAjHBmf?=
 =?iso-8859-1?Q?zxoKc8CiL8gf1gMy9I4L3CfhOnqoqQklNtE3eDkbRhPGw55KZbuGFP0IBD?=
 =?iso-8859-1?Q?uilIj5LHAeedQxJ6V0xOBV0Ynu4tStFijYYxy4BOCuidxq+UWFAGb/IMmq?=
 =?iso-8859-1?Q?PrXqgiQwaQcQtefON1UDMwBr5RWPfZbRBZKmDBigk/IIE1mSLWloFLiMNu?=
 =?iso-8859-1?Q?ayWH/LxDWK+fBPWXFEsIeR1BQAEA8aTur5MpZMSVe2ZAeV1Ykv2pQ4IUqv?=
 =?iso-8859-1?Q?a/DwQxafiQ4Vpdht3A+oju1IuEbbEZHxECyPt4zcwccaJG/lSYYnH8AmiP?=
 =?iso-8859-1?Q?pOy8jHMyD9dU5b7F/gWTlJ3o1xk0QPB91Sirtvx8N5edLr5ILWTA32VJy5?=
 =?iso-8859-1?Q?8tH1cRuYkP5KlF93uAhSzLsbqWDnQWtedZg5hwqNh8JFgtKLuGHkh5uKc5?=
 =?iso-8859-1?Q?QO05lncjALxSOj26SavzJn4yFy5ciBmfSI8NGccCGdP6aCJBEvyMvyXbef?=
 =?iso-8859-1?Q?Vt91q+Y4WCeNwSnOFkW59zyUmmtXYFy4FYU4u37a9I9UNoOLdEssP5vM18?=
 =?iso-8859-1?Q?6pntjhpeal/Rnx3lWwLRN0pri+L/vKI5qMVMUVjTsdvQ0fNNXlTTRXOoRm?=
 =?iso-8859-1?Q?tWH0bUnf2uND5F2IyhgZxL/rUIrGwWiJ5OyZ2K8aFyKT7r+lfKs03beC5i?=
 =?iso-8859-1?Q?N8Q+4cCS/AgKFxo4Nt/Qxe8XCG74NqLaduLCq8Q/kd0yT92yz6rKlAAsFB?=
 =?iso-8859-1?Q?WCncxFRbkuYlgOeuNotdstVoZUQz5ddDACz/Hcw5FCKDSe1nW4mwOFQCG4?=
 =?iso-8859-1?Q?1m+3/LK0e0nwaVvGLlpakdnZPZOR44LqVl411vFmC7OStUULqihhvC5gdl?=
 =?iso-8859-1?Q?yH0udISGXEsYgS8GSoVwIrTLbxVqlCCfTUhAs+cfoEsKfATjplJABmOlxD?=
 =?iso-8859-1?Q?8LtnwteeAVDTolDEZvDcZCJoKA5x8fYdy7IiyuSktxI0cQ/VP9vnLn/IJ3?=
 =?iso-8859-1?Q?zBCQChmeeIzeSuITovbfpPw1g5EFuYHecA6Oz0mXz7leMaC78NlBaClCM0?=
 =?iso-8859-1?Q?9f0hnvnjGULExNuPU/3XQYei+B3kiIRyjDFK6ewD+tU28r+IxxiKBv8kBk?=
 =?iso-8859-1?Q?EMLYTrYawsFXhcAOWv88PQ5vravbZ3Z5MWDp0kTSu0/3Dp+KB/YSWY+FOU?=
 =?iso-8859-1?Q?uR9LAnIAk2CO/FPTGSwmslCfP+tqFr/Fd31ggTuD0JZXP0fB+UZoOK6bgY?=
 =?iso-8859-1?Q?zlmAGJeXKdGONI7HDqoeQSwxvdK9JZ91LeBiFf+k0xcPLvQAmleQs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?I165PF/TaieKag9tD6JINpRlns0bCes4gEE/hbSsSt+7rAUeW5VxqgkY8/?=
 =?iso-8859-1?Q?Rvs5B6IJZeQLqe3soVjE5Np+eJW93mmBWfdmDVqzsk4A3kaxtKvgPro2MP?=
 =?iso-8859-1?Q?1e5+r6b499unUWc/2EFFx24qU7P575x60ggdS2l7j6Hyr+33w6LHIosuS+?=
 =?iso-8859-1?Q?dy2N4/JWSF26F6TQWOOkU+thR7iCXAdlDFBIAlp8HVdRbkcd7MQyleykOd?=
 =?iso-8859-1?Q?kyrA9MA3Gnk5J9G2IQaG+TILGhXyb12tX7+XYqGF4x5FPVm1DYiHtb/KIW?=
 =?iso-8859-1?Q?TRzNGecC0PeaXnzzkQV5TVJSu0MXgRwnigmjv1emfQvqvE1XwLqup0ZEpm?=
 =?iso-8859-1?Q?YUn58hf584cY7QINl5N17lcXEswiz7HJuWxKVr5ihInAd2JIuCLL65w5j9?=
 =?iso-8859-1?Q?SGylGd26CazfCQoiTfC3PyV+yLqy33c9zAv5zuCReWzvYlnHaanOV/XYhh?=
 =?iso-8859-1?Q?bf/XLSr4k3BiKi9bYCGCojMJdQOijZy5LQxvZSgkhSkIzSR/iQjKaLY9KI?=
 =?iso-8859-1?Q?7Gc1AcW2e74rghJrzWxOpTutP0ZCXZChUKNEckuT4oPwEB6nJARQgfAaIX?=
 =?iso-8859-1?Q?/UtwNb6xjKCYTqv1GdLZXJ9WCfPaG7PfguUw8AbkJ8y2B4/XlIX8qOZ5TU?=
 =?iso-8859-1?Q?nMM8abmRGIVcia16c99NXwWaKfd/fafiiztqsfHcLVmLFz0X+uFrUUzZw0?=
 =?iso-8859-1?Q?SihMAMFXbUSWgiceFdbVrU3uO5R0/N8PPUloS1dSx293fOnxkXyIi4aDrI?=
 =?iso-8859-1?Q?D25t341AM8tl5htfoYdyRh0BtwMjvuPNcdhWoqLcU2tX/sqmLFyyPUMM4h?=
 =?iso-8859-1?Q?i94mqBY4YJNGCMggqC59K6Mma/+z+lpVUPvBUtpyr4kA6AYGVRFYS06mdo?=
 =?iso-8859-1?Q?pX3Me726b2PnOjQvZqi3/zK8fPcPn6Mzz+tXPvdogs8e9dIYvgppiL2fU0?=
 =?iso-8859-1?Q?DSzUXxfHUWi249zaOUhWoEDkcXjcJt1UZs84vMWE/f0PfiHhBbdu2+jgJc?=
 =?iso-8859-1?Q?wf2JfcEQPVoDX/0zxyJ/MUYjYzh4GbmsqRrSGxaBrQ8L/RQI2s+BVIyTzT?=
 =?iso-8859-1?Q?FCMrseeOgXiSEty6umBXghqQzpz0BpSPPg89E9v9CBGVNqeRKvb69FL9QP?=
 =?iso-8859-1?Q?sG2MhduCdRixanuO4UK+bwMt42hD2QfQ375wsfE5qSBdkdTKwEeuhCK1pX?=
 =?iso-8859-1?Q?yLzoR5UTpvFl/XXTtKjrHq9Es+T6CGoFz6h+DYzq93eOK47gbmXZc9/D+4?=
 =?iso-8859-1?Q?3ewFqr5jH83uMdpD7iW159D5eOyqjFfP2kT45e+Jtj8P/+MvW0mZk6rkl3?=
 =?iso-8859-1?Q?lnuhcL951cDfgKZe39pcPPCC/Tozzfii1KJ6GBTjSzJfE9lqC7CyaY7mho?=
 =?iso-8859-1?Q?uC0LV989TC1yh5rIprIjRxAaXV+e5n70VqYl8WzsWH/uzVuZPOQpVjovRg?=
 =?iso-8859-1?Q?cNOIbboNX8oN8N69Z1z4SCNVPBgELA3U1sgmQ1vKBM9OclMNRgrnTLRTC7?=
 =?iso-8859-1?Q?MbFLPYRkBG+DhOPcei4WH9gDYHYIvFpfDxBTg3wANHoimzwbAdyJlQbjDk?=
 =?iso-8859-1?Q?BNvfJIE7AmojHmqBEKVid0gXcUaEsAp0Y2sxCJQERVuD6LhwM5bJHwQq48?=
 =?iso-8859-1?Q?CpvPfqkrt6E4Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc15870-a7c8-4c14-763e-08dc84c82c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 18:57:25.5256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIo43pOFydu3GRnvCcd6GebC+ceXwiZENFL8u3eUNCB+dKpMbTLbOOMULM+US/ud4hg6a3PbpzWEMC/+XtGWgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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

Hi Matt,

I replied a few to those review comments. Then I was interrupted by the v3 =
respin of this series.

I now come back to revisit those comments, to make sure those comments are =
either get address in v3, or I reply if I have more comments.

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 5:13 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 13/31] drm/xe/svm: Introduce DRM_XE_SVM kernel config
>=20
> On Tue, Apr 09, 2024 at 04:17:24PM -0400, Oak Zeng wrote:
> > Introduce a DRM_XE_SVM kernel config entry for
>=20
> Maybe consider another name for this? I could see use cases for non-SVM
> where we still want private pages mapped (e.g. VRAM userptrs on
> non-faulting devices). Don't really have suggestion but worth
> considering.

It is first time I heard the concept of VRAM userptr. Do we plan to support=
 it?

On a non-faulting device, you would have to allocate vram for userptr at vm=
_bind time, right?

>=20
> > xe svm feature. xe svm feature allows share
> > virtual address space between CPU and GPU program.
> >
> > v1: Improve commit message (Thomas)
> >     Avoid using #if directive (Thomas)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig   | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_tile.c |  7 +++++--
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 449a1ecbc92a..0accb2cb81d6 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -84,6 +84,27 @@ config DRM_XE_FORCE_PROBE
> >  	  4571.
> >
> >  	  Use "!*" to block the probe of the driver for all known devices.
> > +config DRM_XE_SVM
> > +	bool "Enable Shared Virtual Memory support in xe"
> > +	depends on DRM_XE
> > +	depends on ARCH_ENABLE_MEMORY_HOTPLUG
> > +	depends on ARCH_ENABLE_MEMORY_HOTREMOVE
> > +	depends on MEMORY_HOTPLUG
> > +	depends on MEMORY_HOTREMOVE
> > +	depends on ARCH_HAS_PTE_DEVMAP
> > +	depends on SPARSEMEM_VMEMMAP
> > +	depends on ZONE_DEVICE
> > +	depends on DEVICE_PRIVATE
> > +	depends on MMU
> > +	select HMM_MIRROR
> > +	select MMU_NOTIFIER
> > +	default y
> > +	help
> > +	  Choose this option if you want Shared Virtual Memory (SVM)
> > +	  support in xe. With SVM, virtual address space is shared
> > +	  between CPU and GPU. This means any virtual address such
> > +	  as malloc or mmap returns, variables on stack, or global
> > +	  memory pointers, can be used for GPU transparently.
> >
> >  menu "drm/Xe Debugging"
> >  depends on DRM_XE
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.=
c
> > index f1c4f9de51df..a1a436912fe3 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -159,9 +159,12 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
> >   */
> >  int xe_tile_init_noalloc(struct xe_tile *tile)
> >  {
> > -	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct xe_device __maybe_unused *xe;
>=20
> Just assign this here blindly? The __maybe_unused should suppress the
> warning CONFIG_DRM_XE_SVM is false and should just compile out if it is.

Did you mean:

struct xe_device __maybe_unused *xe =3D tile_to_xe(tile);

we have an extra xe assignment when DRM_XE_SVM is not enabled.

Also if we assign blindly, we wouldn't need __maybe_unused, as xe is always=
 assigned (so used)

Oak


>=20
> Matt
>=20
> >  	int err;
> >
> > +	if (IS_ENABLED(CONFIG_DRM_XE_SVM))
> > +		xe =3D tile_to_xe(tile);
> > +
> >  	xe_device_mem_access_get(tile_to_xe(tile));
> >
> >  	err =3D tile_ttm_mgr_init(tile);
> > @@ -177,7 +180,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> >
> >  	xe_tile_sysfs_init(tile);
> >
> > -	if (xe->info.has_usm)
> > +	if (IS_ENABLED(CONFIG_DRM_XE_SVM) && xe->info.has_usm)
> >  		xe_devm_add(tile, &tile->mem.vram);
> >  err_mem_access:
> >  	xe_device_mem_access_put(tile_to_xe(tile));
> > --
> > 2.26.3
> >
