Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B1110A62DD
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 14:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7603410EA87;
	Thu, 26 Mar 2026 14:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpNXrCLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2418510EA87
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774534121; x=1806070121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=uQdknCItY89R3uv1dKqAjvuBFykJ/vhmvg32D7L8cok=;
 b=BpNXrCLWks7hl14LX7zJuu5oe0/ZDXP1RfCDTMoMBx3Rzn5DEF+L2Wvi
 SeEVXTNuDi5bXAi1EvherHZa/1qtrY6g91Oqub1hnYlCIn28Z7Eog8A3M
 4IlNb3S2IM6e6azVbcwAdSXMaFWcXUjpBtYPb7ZuQtVexbEfocFgvJ01A
 rEHQr3z3IVxVAL7O3g7JnN854w/rRwWQvHZ5G+/K5txKtB3llBf0/rBfG
 iO6OYRIIuMmpybtaJzsWTLp4dVps/Vh4zq0GhvFeJnCTqa0rBsbcJVW7i
 ffqpwPG2NMd8913I/V24eGJdUdtpxbtpRbgKI7z1RjDRG/xTqBcwf2lfE Q==;
X-CSE-ConnectionGUID: 6/97tY65Sze9HXXkz1v3hw==
X-CSE-MsgGUID: BrKlY+WDQVqlyUV9qdVRcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75475118"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208,217";a="75475118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 07:08:41 -0700
X-CSE-ConnectionGUID: UNaGXas5SqSJn56nKuZCKA==
X-CSE-MsgGUID: rooCio8YQumu2WHmqUUHBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
 d="scan'208,217";a="229456645"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 07:08:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 07:08:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 07:08:40 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 07:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXFj7Z3ABYhJ2LBHw5wgZICtqmz8TZynLbYxH0U9whvQWxmBuTMNlQ4wzcctza9AM7JowS/VTxYwv6gflu0eqApXOM1vcDqcTsiiCnxq4dsk+s+dH5oVAuUcIby0UeNC5WRMr1aquq0jzSqAR/duIFGZUIr7yZVrKqhMilK3uXVAIPywhMHhPVXUk2yLw1BMdV0sGY4WywgjdqTYwPzs3sZJHVoZ+LxF1fKyL7B5hj9hcvrHkQcfa3q+JbMnXt7Qw9djEV4InfuKvdOtQyr5VfVrYrzD/j7B2PZTjqJrV928RuVMyDwW7ugFPtbDBGxBQD7aZYONnNhC4oksr0avDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNabqDvuD4OQcR3nR0drmphBnCuKNQVXwXD5BTXXPb0=;
 b=Jq8zTFAW2qs1TyZbGmFhyIl73u3aT9XCfjQbn7x2cznS2C0VsIbBnvc61HV1ONh5XXtMv3pePMmjB/9C7J5whyrcStanMl2YfI+O4Ps97yxfEX4etFu13LXUbRYmv49+jWY1p0tr4hxP/x+zFxzScQsOtJ9XQe7FsWzHinHfw1WGl7rG0Kw36KeXDv24F0U1huLYaEnNoS6EHrwZwuO0od5AA2Oz18wQZF5cpv3tU9RiTeWoZyeT2VqLROMcD+zS6D4ACBDihsQrnmC7XuiablZpYYNWE80CJ1fkkEQClOvRoq0kCmymyuFCjNJPJeDOkrT8ztiyoQjUiMlXsKHVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 26 Mar
 2026 14:08:35 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9769.009; Thu, 26 Mar 2026
 14:08:35 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: drm/xe/hwmon: Enable energy attributes for CRI
Thread-Topic: drm/xe/hwmon: Enable energy attributes for CRI
Thread-Index: AQHctccjJlU/Zaapc0GkBLdplRftjbW3Y7YAgAnbmwk=
Date: Thu, 26 Mar 2026 14:08:34 +0000
Message-ID: <CH0PR11MB5249B830A627AAE39D478053E556A@CH0PR11MB5249.namprd11.prod.outlook.com>
References: <20260310122018.2734260-1-karthik.poosa@intel.com>
 <ff7a6228-1741-4a54-978c-dd70a16a2973@intel.com>
 <6cf0b3d1-8bb8-49c8-b4fd-9fcd6954753a@intel.com>
In-Reply-To: <6cf0b3d1-8bb8-49c8-b4fd-9fcd6954753a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5249:EE_|PH7PR11MB7662:EE_
x-ms-office365-filtering-correlation-id: 85803064-3b9b-4021-d1ae-08de8b412b69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003|8096899003;
x-microsoft-antispam-message-info: S3ixEl58MSwTO5/M7fCVCmr0Z6+aOfq509nRIUdQyaJNLvk2S7rqtLvqMKnZeVqm/EiOLOIm1H1fLp9F3hYi8ovTvv+qLm7zdzkQBMbfMDlET5aC1eUjiOWb+bjrnk0UdPRFnB+rD2fC2L5zIb40GaAZTfvfPVdQGioJodwTi4r9C2hTplg91sPNqIxdGHX/J6vQS9DMLtM/FZgc509d3GDurmPz/WrvBZSsZ+szjDOCPIsfMxnA5JckvSJouhco+EwaOEmE/gLaS9dEyLhl0T3Yxe5PyBoJLkhKmfC3dIDVl0XfKHlOgOsBXRPblgJUhBr13pUiU3AfvhCZ8MY7tkgdEIU8jbg4KXdmm+mDM+GwNSLXqsA8OwYX0GpGkzT3UInFY2XhZWT8Z6bgPaF2S5+7fOFG1Cpt4wjaObYQaXJdO6C9qhoBKJGC6YgH0W8mCBoW2luwOwoEcHuucaZH9wfqAhHkw3y6i1nUMib0DrN4651yxst9UfsP4J8Lmrl8uI/IzjUYuyhFAbn99B/gZAtAAkc3ar88UJCTmfH7M0gmxfUabyggDUoBDYwwcCewCG7hjm10cCwsaALVf/mWdh/v3KT4Eyr36jR301YdzY5G+78VKkw158Zs7JI/ywwLXH5x5UWkD+W7TvdGT+UJl4ISsB7lnAax77ifgGrqPpRUDPzv6ZdFYszrElFvb7pJPjJGKPVnsuHFjpmmf9YJ4qhCsr/MXHLSMwpNMuncV4CS/7Wg6PFDorN4508s2i+Cz2+k2wkLaWvBsvvMwHE6VmDCSn1hy4/U6nxSNrDFqLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Dw640b2Qlrqj6z1XnHWOCnQFHAuyyHL7aSUqGRsUM5B/N8EbUJv4zjIuH3?=
 =?iso-8859-1?Q?BT6LEeCw2dQQ9NBIwr6Lc7/j2JPwfJhVPgVHy9lLDQqiZNdzO+fNINkDjL?=
 =?iso-8859-1?Q?ruPKnbpnc3royqT+9+KJvexwE0dOimiQ5OXdsUdsGMrLbUIWoXgNCXfZd0?=
 =?iso-8859-1?Q?f9PaRWAOOUZx6Til90wYr9UJ9JzYK25axH0pR/h59/3TefdV7U8eBvc5AR?=
 =?iso-8859-1?Q?3/JotqC9/py4IdtUn71M+mBODBWcdhYJZOf1W85zT/xM2mq0jmZHmS3Glb?=
 =?iso-8859-1?Q?4Y7sI77boxJcTR5yEqeDzPYoW6mXlWegN/7BxcjR+SjcNhOZBO8oEggL+R?=
 =?iso-8859-1?Q?eR9U7a6Syawvt0pxuHrgJv+kBeAhrEgjt/JAhONxlbQCmRqcwgxe1lLEpA?=
 =?iso-8859-1?Q?gPAk8xk3eehTH/Dre7enDLFgvmegjML4n9B5ObjUG1JojkRCPJ7/0KxDAB?=
 =?iso-8859-1?Q?e08c0cTt+ANh03kkqGZGFTa2/7j+axJSPJVK2bFhB1+TKUlTbgR5K0kJgG?=
 =?iso-8859-1?Q?W8NIVY1p20stsaQr01hWnVrONeYjhMfK/ly57Evv84hAwCt9YG0B8SFpeL?=
 =?iso-8859-1?Q?WwIqwV7nrRDdeUqEkKlESQQUnHQ5AFdKX8tTRSHV9n1x3ggNOU/S1FOrz2?=
 =?iso-8859-1?Q?EqNLoXFDOVncNnBrmRfYq+Q5EksqgfMM0NdSyrh1h5JxKFLju9vM1ZeCpX?=
 =?iso-8859-1?Q?zWtNNxjpwi+FX2UtTd9QO9YRtA+JU44H0cD2MdrFOayH9lhUt7QkqF9k+4?=
 =?iso-8859-1?Q?WjDIVcCyRT35Nj68WTgIuecBH5KBdDU28lmEAPV5kvQDKSRB1lCR3YzoNC?=
 =?iso-8859-1?Q?TvZxEWpofB+Nep19y2Nbu7fpppP4fsEhzZ4KLNCdCUmkUw2EzI2Y7onRI1?=
 =?iso-8859-1?Q?q/QXvXFm0+FCCxSsYHF+RyEAaqsj124fLfPQR/vAPXy/dRibOawFgfKb7Z?=
 =?iso-8859-1?Q?TDwxZgFVqllzmrYj48RZ/nNQF6WZz/nwOtkHFu+DxMAd78U8S4DbUX/WAm?=
 =?iso-8859-1?Q?jvJe8M2fWaA4TEKKCj5FD7k3E3Ab3nLYBMmu/EtkFhNzQxEKmYXMiTmB+a?=
 =?iso-8859-1?Q?FwxKwx2Tbt/jMhOp+ZaaDRhPHl9rk0gUVdrIinkW/1wsX+MUyN5md40YNE?=
 =?iso-8859-1?Q?z8Rpxgjv/blK2bRfQ2uNKuX/eAV8rC+r/lJPF6eB3X25EkYcLwvCVkic45?=
 =?iso-8859-1?Q?jBDl4mN8HSZB1PZ5pi+nEuMUBSMb+BV0qszhdhfp0Gnt6ndL6W83tUd8qC?=
 =?iso-8859-1?Q?GNzSm2FgQyt8JECa1+EecqmrElCHgLdWtm7wqI/pmt/Bj3Iy8KQCUCHkEI?=
 =?iso-8859-1?Q?xwnGLIGy6YfDXvIBdy77oZZNlyNrdv5bq55Vft9i0gPXoRpH0M9YqDQ36T?=
 =?iso-8859-1?Q?Gcm4KsF2AXjbLPnNubBwcydpNxTMMkpCKdD901G+OW/sHLeAcCCDjqj0bz?=
 =?iso-8859-1?Q?MgzBm5u4cGPOBv6WxFsPELJH/CvYfjj835ygrpmt537/dA2U8/hUBkpLiu?=
 =?iso-8859-1?Q?sZIczGYNmlCe32fMw94gnNYPQ8J5UiD4XzeAFoDVWB98sNiadeEjpVai46?=
 =?iso-8859-1?Q?ousyThCFh57u/BTo/B+eclC0+uVQu2OrKgMgBcYFTij67SZMVKnbGKpMjA?=
 =?iso-8859-1?Q?RAzoTajH3ccjvshxNqdI4NAzTAJq+6oYo9j5ijfXSXcmVCIeSTvJolFD7U?=
 =?iso-8859-1?Q?GibeNi0U8lzjIqk/1Uqi5m2QWQFLbRqgUUL3iacYRqlD2So3GOCB9aWnYL?=
 =?iso-8859-1?Q?OmCEPenVVgf30NOLIciQlgu7oEXPNMHfpiA+YJI0CzhGaX9GMDPpm//DR9?=
 =?iso-8859-1?Q?/GKMeNoglg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5249B830A627AAE39D478053E556ACH0PR11MB5249namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ePztDE1WAgfJRA8lmeF0x/EJ97AGChYk3UXC9fauO+GiGtzn809+HmTZzqz+G0CqNGZgCLjtAKE1Gj9E7IWvldtvmCCd8PxnblJhI4/IdfdlU9cx3ZfmwGoRWdBFiVUcTLHyBfBdnNXTuFR/Oc16MujvfPnk2m7cd5O+HmrYY5ENKX3RJTImHyz3mmSUddtueyopluFXGOhSs3O/ASkqdcF360Bk9UA32bkeGflz08V8zvVp1WZ+8QOxTDX/T+I2Lpccm9y1FkkOgw6MyNawn+cBGKnTyYV8iXWdZPH9qtDxD2YgbuuT3COkhUP9dqxsJYNQahRnuY+a9WAq70FRtg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85803064-3b9b-4021-d1ae-08de8b412b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 14:08:35.0116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +itEST8j++6O10RJ+3IRfryc7kvnYl3IDQnBSpOTOpAVWa879eFharFxIQVu2bqYMvU6oV/q5ijun2mSE2CGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

--_000_CH0PR11MB5249B830A627AAE39D478053E556ACH0PR11MB5249namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Poosa, Karthik <karthik.poosa@intel.com>
Sent: Friday, March 20, 2026 6:16 PM
To: Purkait, Soham <soham.purkait@intel.com>; intel-xe@lists.freedesktop.or=
g <intel-xe@lists.freedesktop.org>
Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilaw=
ar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav, Raag <raag.ja=
dav@intel.com>; Tauro, Riana <riana.tauro@intel.com>
Subject: Re: drm/xe/hwmon: Enable energy attributes for CRI


On 17-03-2026 10:02, Purkait, Soham wrote:
> Hi Karthik,
>
> On 10-03-2026 17:50, Karthik Poosa wrote:
>> Enable HWMON energy attributes for CRI which is available through
>> MMIO registers.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>>   drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index 4b3c46eb858f..c63b409d7a82 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -27,4 +27,7 @@
>>   #define   TEMP_SIGN_MASK            REG_BIT(31)
>>   #define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>   +#define CRI_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>> +#define CRI_PLATFORM_ENERGY_STATUS        XE_REG(0x138458)
>> +
>>   #endif /* _XE_PCODE_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0fd4d4f1014a..852681bdb84c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct
>> xe_hwmon *hwmon, enum xe_hwmon_reg
>>               return GT_PERF_STATUS;
>>           break;
>>       case REG_PKG_ENERGY_STATUS:
>> -        if (xe->info.platform =3D=3D XE_PVC && channel =3D=3D CHANNEL_P=
KG) {
>> +        if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
>> +            if (channel =3D=3D CHANNEL_CARD)
>
> Instead of using if-else better to use switch-case here.
>
> Thanks,
> Soham
That will need refactor of this entire function. Those shall be handled
in a separate patch series.

As per offline discussion, switch case was suggested for channels under ene=
rgy.
As energy is supported only for card and package channels, switch case is n=
ot needed here.
>
>> +                return CRI_PLATFORM_ENERGY_STATUS;
>> +            else if (channel =3D=3D CHANNEL_PKG)
>> +                return CRI_PACKAGE_ENERGY_STATUS;
>> +        } else if (xe->info.platform =3D=3D XE_PVC && channel =3D=3D
>> CHANNEL_PKG) {
>>               return PVC_GT0_PLATFORM_ENERGY_STATUS;
>>           } else if ((xe->info.platform =3D=3D XE_DG2) && (channel =3D=
=3D
>> CHANNEL_PKG)) {
>>               return PCU_CR_PACKAGE_ENERGY_STATUS;

--_000_CH0PR11MB5249B830A627AAE39D478053E556ACH0PR11MB5249namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Poosa, Karthik &lt;karthik.poosa@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, March 20, 2026 6:16 PM<br>
<b>To:</b>&nbsp;Purkait, Soham &lt;soham.purkait@intel.com&gt;; intel-xe@li=
sts.freedesktop.org &lt;intel-xe@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Gupta, Anshuman &lt;anshuman.gupta@intel.com&gt;; Nilawar, =
Badal &lt;badal.nilawar@intel.com&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel=
.com&gt;; Jadav, Raag &lt;raag.jadav@intel.com&gt;; Tauro, Riana &lt;riana.=
tauro@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: drm/xe/hwmon: Enable energy attributes for CRI </d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;"><br>
On 17-03-2026 10:02, Purkait, Soham wrote:<br>
&gt; Hi Karthik,<br>
&gt;<br>
&gt; On 10-03-2026 17:50, Karthik Poosa wrote:<br>
&gt;&gt; Enable HWMON energy attributes for CRI which is available through<=
br>
&gt;&gt; MMIO registers.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Karthik Poosa &lt;karthik.poosa@intel.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++<br>
&gt;&gt; &nbsp; drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 7 ++++++-<br>
&gt;&gt; &nbsp; 2 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h<br>
&gt;&gt; b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h<br>
&gt;&gt; index 4b3c46eb858f..c63b409d7a82 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h<br>
&gt;&gt; @@ -27,4 +27,7 @@<br>
&gt;&gt; &nbsp; #define&nbsp;&nbsp; TEMP_SIGN_MASK&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_BIT(31)<br>
&gt;&gt; &nbsp; #define BMG_PACKAGE_TEMPERATURE&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138434)<br>
&gt;&gt; &nbsp; +#define CRI_PACKAGE_ENERGY_STATUS&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; XE_REG(0x138120)<br>
&gt;&gt; +#define CRI_PLATFORM_ENERGY_STATUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; XE_REG(0x138458)<br>
&gt;&gt; +<br>
&gt;&gt; &nbsp; #endif /* _XE_PCODE_REGS_H_ */<br>
&gt;&gt; diff --git a/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt;&gt; b/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt;&gt; index 0fd4d4f1014a..852681bdb84c 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt;&gt; @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct<=
br>
&gt;&gt; xe_hwmon *hwmon, enum xe_hwmon_reg<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return GT_PERF_STATUS;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case REG_PKG_ENERGY_STATUS:<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;info.platfo=
rm =3D=3D XE_PVC &amp;&amp; channel =3D=3D CHANNEL_PKG) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;info.platfo=
rm =3D=3D XE_CRESCENTISLAND) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (channel =3D=3D CHANNEL_CARD)<br>
&gt;<br>
&gt; Instead of using if-else better to use switch-case here.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Soham<br>
That will need refactor of this entire function. Those shall be handled<br>
in a separate patch series.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
As per offline discussion, switch case was suggested for channels under ene=
rgy.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
As energy is supported only for card and package channels, switch case is n=
ot needed here.<br>
&gt;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return CRI_PLATFORM_ENERGY_STATUS;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; else if (channel =3D=3D CHANNEL_PKG)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return CRI_PACKAGE_ENERGY_STATUS;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (xe-&gt;info=
.platform =3D=3D XE_PVC &amp;&amp; channel =3D=3D<br>
&gt;&gt; CHANNEL_PKG) {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return PVC_GT0_PLATFORM_ENERGY_STATUS;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (=
(xe-&gt;info.platform =3D=3D XE_DG2) &amp;&amp; (channel =3D=3D<br>
&gt;&gt; CHANNEL_PKG)) {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return PCU_CR_PACKAGE_ENERGY_STATUS;<br>
</div>
</body>
</html>

--_000_CH0PR11MB5249B830A627AAE39D478053E556ACH0PR11MB5249namp_--
