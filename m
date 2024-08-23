Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE620C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 04:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885AA10EC13;
	Fri, 23 Aug 2024 04:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6zKW+YD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6C10EC13
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 04:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724388409; x=1755924409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3FIVMLz03z0SZEcY+814rXOGcvSlyntcyl35EJSMfWw=;
 b=P6zKW+YDw4cCG4XQuJl+upCvo6HCjXVOkR54YOoYy1aleVNPUfwLTxLR
 REKhGCvd1cfj9mrfoTtGx7AhdZfjv/nOj2arGnbjnm52u0oBdFaVV2RPY
 NvfA63MW7XFEtAKV18w1UGRJWmP084OdJ6sP5fxUjkzIwTmRLRvbh6pVU
 1DuqQQfZ4Tw5eD1rJ9FApTJyOuw85gIPv1AJGRDXm6BMoY+AymzLBzK0X
 jJLq2TVE5OtlF1YY/HxansHAbori1BmWNt51jPPIltktA8xy1QE7cwS9M
 2dx8pNUU3dOkdY611sg2C6MhKluKndMBtK+o41G2GyeBDcl8wCItWKU6x A==;
X-CSE-ConnectionGUID: UCx2xD2fQYaay4WdT5N+wg==
X-CSE-MsgGUID: VOtF636XRgWTNtDVyXnBgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33503821"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="33503821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:46:49 -0700
X-CSE-ConnectionGUID: 5glGJ8SFSwyujr2V6OOHwg==
X-CSE-MsgGUID: 7QvQz8v6RWiZPvEM4wVCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61356950"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 21:46:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:46:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:46:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 21:46:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 21:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5oX/9iXtUK34fbNMpISJW6TRdEpZikLb6FfzyF1NJWJ+whLBhY0bYWmwkybta3Gwave1dlsRRVj81FpVCa/905gqBRKSvuN13UdaBvPN2Wwgy8EJ7jJFW/F8egkpFNmlom6AhjGnrdUALFgE/DSLnbpCIfJkQddbxm65M8VkQWz1JZs/xDuAnGNYcllKSVYSwEIACGpzeSVQbxD1idbmHioEXc6dvSb1qtlVaVJAoqJWv4cIoQkhWzm+gTEkVMfzgU0gxinnBEES9rXazmXKeB2sHzA86DFzlLYURrQHCZdrQH4xJzFlduQMh0A0jQAj0GIXosLDAb079avKMDQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wYkyevlfGnW/Ruq8kP3A52gFS66tVY5IExIETNg7Dc=;
 b=YkUNGu5gwdfBMH9VG4cNRE/edacM81nlvy79RM4hD0DvvWjw0c/xW5NBz50EYbafdASekTgrkmwhg5IYq8BRlkjSSXJ7o3CoD3d0hqnNuWIYg4e0SIWk6+yMAkEx41xtv0AiO3vTMxN1NgGvlcb8bevNF3PnRTVlpSW0KOpssrCbEj/Fh8QNwf/7AbQZf/2yeA5ypWv2gEc5Xa+iN6fFDm7onInVpEPP4+e2zcwd2FjijPsu1hbEq54i2NsK7z6KYiij6nuyhFrSJ68ffhus0IW9M8Sj8rz1yoO7mYF0FT0jJp1ZG5l3Xjsi0Orgyf4vAVo6ubKHKFVCqvugYu3CiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 04:46:46 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 04:46:45 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: RE: [PATCH v3 1/3] drm/xe: Suspend/resume user access only during
 system s/r
Thread-Topic: [PATCH v3 1/3] drm/xe: Suspend/resume user access only during
 system s/r
Thread-Index: AQHa8yRuJzF3LLi9MUKerbjYATOyArI0MpPg
Date: Fri, 23 Aug 2024 04:46:45 +0000
Message-ID: <IA0PR11MB730714374E4333929EFC2194BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-2-vinod.govindapillai@intel.com>
In-Reply-To: <20240820171408.192309-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM6PR11MB4563:EE_
x-ms-office365-filtering-correlation-id: 03bf54dd-febc-4ea2-f452-08dcc32e9796
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nJCfB/DxcB3kkSzxiuGhmNt623D48s41eLkKbu3RQHfrZsaEVPqBkWxi7oZo?=
 =?us-ascii?Q?nGEqsCwDtrXhUwomVErSjLec6boJPgiHBxC/hlwKcLZaqQLK8+Ji0jqevanJ?=
 =?us-ascii?Q?anVwG8vfaHqfZBUYYETyvtdyhHBTa54+IoyMR6ETau0q3sbbanzoRIRmPd4p?=
 =?us-ascii?Q?HtlGkgCdQlfmsqBzsBsESs6w7+I7FhABTnVtY3gUJJ7LR+WirZWqFaKoB3CT?=
 =?us-ascii?Q?MZIz5kpxUIpuStHFF3tbBopXS06Xotf9O5ZaUHPqAL7W6C13xCxnAikZRjtL?=
 =?us-ascii?Q?eQM6VFKFWOrwdaxu8mExPfPMzsZqKTSAhvlayfRgBa2NKxXUGDVxnU9PrfQQ?=
 =?us-ascii?Q?MW7/2ZFEAAtVbs4HJB8H323DSeYBeHsb+NmPsM45Zb465VDNEXKlF9HHPYRa?=
 =?us-ascii?Q?aE6XO2AtcYb2cF6bMJ+QuwvfwyxUvJ1MM/in1nywn3DX1gKANIKsuqHmM6jj?=
 =?us-ascii?Q?9yFv/P6Ebsjqn7vloODR3CFvr8jsPHR0vgp2nun1dptPsDQS9J/S7ybFRbG0?=
 =?us-ascii?Q?pDYXSR6x5VSQ4ZhpI5BjYcqvxyiJX/GWmKMNZWgGxPPGYshQ3Z7mFYLjoXlt?=
 =?us-ascii?Q?uEShxmK/6Pto+eZlGP+1BDE4srKhiytiofRmRXPuHq4M63UCu6bE3qPcfSn2?=
 =?us-ascii?Q?/HEV4PHSFUXlPhwsN0FcT9pch+rdj5tpwBDGo1vgW1rivm5OYVOdKOihrrLr?=
 =?us-ascii?Q?MA7xbvdqJC9SQCFnKMfKAt2vLpfskn/lyAn1l8kNCTX18BozW5jUCXVEI0rM?=
 =?us-ascii?Q?tbVdEu2tAyxY55QZlacABpA/IdZidbj/MU7LvsZ/alg3eISOBo0tVg/I8A65?=
 =?us-ascii?Q?tP5mGyhCKBFiGWwiDcVrntQiy8qDafPk7dIdt/ZFy85ADtQoRz5j2/b7OgdI?=
 =?us-ascii?Q?lFBWi4gKQRtXbKCJHR7biZaxEkiCz+nysMLT0Rg01JJrVu9mxWF3m69BIen4?=
 =?us-ascii?Q?vUNlIWR1+wmq8kzwTmcTMNP9NabS2EGT6hBNhqsbx10pxGdwHP4lFB0xN4f6?=
 =?us-ascii?Q?tZqmi2q+piQM1DQjR7TKqYxrsU1Fh1d+9cIApeWDVBKc/d16icBaV13Ir7xz?=
 =?us-ascii?Q?uWl75W38M17T+jEI4pAbLAD5xTZylBeqd4lBkSVsBuuC2ImrYZgxc60rO6Tq?=
 =?us-ascii?Q?PBvYoXfpGdhMe/NlpKL9r+Md/GxA1+7i60ntMKO0uvYITgfnW4tUv/gXPtYs?=
 =?us-ascii?Q?cSL28etm7qda888PDT0K9+xg2xVxecKa87VusXhhvsz0+jzBn6vgZk49X3D3?=
 =?us-ascii?Q?Q5pR0+dG51HCrH6Mn+asP+H9mqPBixRhBBNiZ8xNL58hh1k7LT3oNnV+10U9?=
 =?us-ascii?Q?lNsyVcno3MJtUX5EVDkU7plxaYIVP8jHaArWTozNeAFeqLkbaGUNF70DD9qA?=
 =?us-ascii?Q?DS4qFLox8afD/GvFCIzu13FW4TAU3oClz6xEUq34whbqjI5etw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NCSPmfug6HIUuPgT0TGozBLmpQxvIcTMlrp1CHUQ890zylzDEU50TabGTr6f?=
 =?us-ascii?Q?AmCiX1B8pGnT8Sgz2qO59y2epJ1sjfaOXfAoGS2+GAAcTFoMdMrSBTKvBElW?=
 =?us-ascii?Q?wTg/HMfmjJALKm/ayJbDeraEwlKoD32F6zqZ6JpazaJ2RBFxBuZ6QjxbD900?=
 =?us-ascii?Q?/H2b+wzGuCqV3p92L+lvM4R/Xhxd6H9+HwWJ4tNNs2YMwHppRzYvg4ISFGM4?=
 =?us-ascii?Q?AKSvhUGEMNvmI0EjoEksjhkWCDbbZRCXK0ZVCPk1Q4HONKfI9ei1GqhVIL5n?=
 =?us-ascii?Q?Vo5DY0TfVRN2JpWfmSzPx8eNFMps17zNkcfK9VBZ5k0ucT+mTl7HyLcUPKJo?=
 =?us-ascii?Q?hxQl8HvBQtbbf9bzIBFnln4lUbVyPta1PXkgx1eU28SW8zPwB5YARSns+oT4?=
 =?us-ascii?Q?Fy+rCxZwwXSOTLEf2bwUl8gj+KYykPbFYeoJy3QA9IBZ93rcmrCWcnqE/hoz?=
 =?us-ascii?Q?bFSpp9jNqEoPNw9Y69ulNtwQn23HLmpE7eMZrciicVr0Mc+8Ng/QZLIe5ob8?=
 =?us-ascii?Q?TT0F1dj9A8f98lj84e6lw5gxiR9dFwEAeSjr/WEaz9V67oBQ3B+N4NZMhplw?=
 =?us-ascii?Q?YxvvG4YAksFRgXlriAuBeThQfNkDP8a8rN0RB6NkTuwLPA8xiQKCtZa5YAbk?=
 =?us-ascii?Q?K74SKHbXVfsrtZoKguM2mb7NbYYf0flnbXQPINb2VtQ1NnZhU1/MffIJedBQ?=
 =?us-ascii?Q?xQup255zrlnBuAxsgII6ctfIbVGsTvzV/jMFpkkF3QUoQgGeYFy/4MO6wqx3?=
 =?us-ascii?Q?cZLRLkhXkLy60mpxGoYCGiZkrhsrabfSh6b5RfZIAnsHHWzRVN6Lwpt9KF1N?=
 =?us-ascii?Q?siJDGGKU49OvrfC4ojk9HaYiil1eRzLMwmz24zdsh78cON9s6p4eAGYgM1w7?=
 =?us-ascii?Q?5d/a95snHQhB6djcctDcSgYANNX/ymPbq0HtsHDB4ZPEc0gBngCqPPf4umAR?=
 =?us-ascii?Q?G5qwhNAZR6hItJrvkXnUQDEKga/1VsTxZB3a+rPnh9WUKCqcEo5bD6tk0Myu?=
 =?us-ascii?Q?loD1qZm/N6MnGnxV2mta2YefoqqVwrFuIfHR8rawJ3lDW/ocWnv3PyUKRa2U?=
 =?us-ascii?Q?bcv22rno3ttXJWkoqtlfRwAGR6lQ/B2JtcpcYGCRXnAPcQAuuoyOBAPxkEy0?=
 =?us-ascii?Q?ehFG+1AW3n00WCI/NnB2CUfbk0w69waETcydvTzSUgVyQSH8/iGg8XdlJnvR?=
 =?us-ascii?Q?XZ73Q54y2n4jKcPT9AcIAzAVl7GqN06TaTO/dh2XvUjfBJA2qqqe9m+lqE9N?=
 =?us-ascii?Q?4PU1NX9JaXo1RjIovmnedBsE3yGzWBpcgo+duobrIYGdQc1bGTlka33BJkq/?=
 =?us-ascii?Q?WWeV4EIUDn3j1809SEC/pHLt5lK6f4GbALk1NK9XaiNiVLehu9HJppRwBq0o?=
 =?us-ascii?Q?wsNVTyAWeHbg/cU48yTbzv6oWdW3eoPGtWoSL2JBI7pqCQUOdXze3p0MDY1m?=
 =?us-ascii?Q?OzpSgdB9ZewJbdCAuGPv8Unl5N1JGP72E2Uur7CiHJElnfgyz8mIVXSkCn6W?=
 =?us-ascii?Q?FRtaqPPONzTOUTPg7OSqasxTaK22Lw7/7WObCFO0VYc6qAB1WiXISVExXv0f?=
 =?us-ascii?Q?vHeA0oXi5PD5FxkljpSEdxuYDB+GjqtJMYho4gXW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bf54dd-febc-4ea2-f452-08dcc32e9796
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 04:46:45.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6YFUNASKAL6yPW3DZNUb67YRz4gQ0w6DHRBsevgu/5fN4QOUuDGhod6XQf9tdGRbb/PPOLjx79pCt9JsiOMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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



> -----Original Message-----
> From: Govindapillai, Vinod <vinod.govindapillai@intel.com>
> Sent: Tuesday, August 20, 2024 10:44 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Deak, Imre
> <imre.deak@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> ville.syrala@intel.com
> Subject: [PATCH v3 1/3] drm/xe: Suspend/resume user access only during
> system s/r
>=20
> From: Imre Deak <imre.deak@intel.com>
>=20
> Enable/Disable user access only during system suspend/resume.
> This should not happen during runtime s/r
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 30dfdac9f6fa..ad7fc5137b42 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -323,7 +323,8 @@ void xe_display_pm_suspend(struct xe_device *xe,
> bool runtime)
>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>  	if (has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> -		intel_display_driver_disable_user_access(xe);
> +		if (!runtime)
> +			intel_display_driver_disable_user_access(xe);
>  	}
>=20
>  	if (!runtime)
> @@ -335,7 +336,7 @@ void xe_display_pm_suspend(struct xe_device *xe,
> bool runtime)
>=20
>  	intel_hpd_cancel_work(xe);
>=20
> -	if (has_display(xe))
> +	if (!runtime && has_display(xe))
>  		intel_display_driver_suspend_access(xe);
>=20
>  	intel_encoder_suspend_all(&xe->display);
> @@ -381,7 +382,7 @@ void xe_display_pm_resume(struct xe_device *xe, bool
> runtime)
>  	intel_display_driver_init_hw(xe);
>  	intel_hpd_init(xe);
>=20
> -	if (has_display(xe))
> +	if (!runtime && has_display(xe))
>  		intel_display_driver_resume_access(xe);
>=20
>  	/* MST sideband requires HPD interrupts enabled */ @@ -391,7 +392,8
> @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>=20
>  	if (has_display(xe)) {
>  		drm_kms_helper_poll_enable(&xe->drm);
> -		intel_display_driver_enable_user_access(xe);
> +		if (!runtime)
> +			intel_display_driver_enable_user_access(xe);
>  	}
>  	intel_hpd_poll_disable(xe);
>=20
> --
> 2.34.1

