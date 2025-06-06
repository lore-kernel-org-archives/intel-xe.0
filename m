Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7CC61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C42410EC6D;
	Fri,  6 Jun 2025 21:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c78REXcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF66910EC6D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749243992; x=1780779992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zXt3/sPp3FD04mDHlWReIK+RJtb6MxcFJsDVPviVLMo=;
 b=c78REXcdLkiZ4dsEnt+7d1lF0nYum7dJl5hIcO6aF3VnV0UunTwJwMFj
 3QMsM5NeWNiEsKpspyw4XnB9Mj8Wfu3iIo0bVw27f54w6twQ7jRmp0bQe
 rtpw1BFDnKt0f6uFDncDT/VNgZ/J0QUe/c1ht1TIhkIfQiYdWlmg6zZj8
 Sm5upE85oroz6vY6M8uUZsNjB3Gy94lqbGhROKWSqs7XCbk8yrELuH3ZN
 w4XoedJaJmiKTXhnL6VjB78j6N9VoTiduKfWeaWVOPRDns9J60sUTLrSP
 Wu2HxgdJrz8kVzIHKllbRHVnOMGHrzp70RP+QdXy+KetoUB0sZbRxZJ3t w==;
X-CSE-ConnectionGUID: J17efUJURIuSqUSguCX/4g==
X-CSE-MsgGUID: k417BI/DR2Wk/GkM2z6/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68845409"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="68845409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:06:31 -0700
X-CSE-ConnectionGUID: /06SyewPQOSmwrLWqMedQg==
X-CSE-MsgGUID: l8u/qh40QuOizTJ+MLSKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="146519186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:06:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 14:06:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 14:06:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 14:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/xRvLFdtf+xTPWHrbp0tg7V/09q7iO6GvUxe2HZ69IyKVet+HT9u1MFNcQHMawS91T+Sr4Zoeiu/1hFxAJA09Rtl5sekGKoaq1EvH9n1a8umPdzSJRWP5xX+T0Lr7KacWZ6WwoHibYj8OfX5IZVLPzGn5sQSGSS24zvL61fo8g1FGlhG6oGoFUlk8ip17gzO3if//5FzDgM/7U27COX7pNDUFHYkyNNfQk7rBN50ZGofucSxHRaDVPlyfCkkTX6s1COTWFpIjTO+3Jc2QMx+Be6pETUY9+wfYhNAaAKsofc6JrF10sqRmC3Fe6WvZvnoZoNAB7t6SjecEnHkUwF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjDEQG5XMSnXPi+UVmJzWXMKNZb4LxuBXYRW0EHXzK0=;
 b=pnJNzp+0EVaZjzehOiiNm4gEAhBJr2FCJxpm+z2B0QRB0JqRxuIK6eo8I03QcV8qoYXX7eTu1uemjedqXVpHthqBR2TJYQCXAiE6C/Sh+X/Ti/ETmybfqQSPWg+DiMgk9lrUBLiuizEZoOnPUkC/Y4uw7bBdTvxdZrLx2fGal0Tav7uqlYEBJIgO9VGZK37ASt9Y8lRu0BRfwQKWn2Wx9m5prGUXEOedPRXbXw7d/orGhf37aTthCIM9QbUsgk5dpxFNkwKh9ROO51UpPr44FJDYbib8ERsN6Y99BR5L3AcalBxGMKUJw37Yl4IvcBo9JkRy7QPTJnJcS5RmFhQ4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Fri, 6 Jun
 2025 21:06:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 21:06:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/uc: Use GT-oriented firmware messages
Thread-Topic: [PATCH] drm/xe/uc: Use GT-oriented firmware messages
Thread-Index: AQHb1yO0LIDRolvo+0qKB6NnLi4SXrP2nX8g
Date: Fri, 6 Jun 2025 21:06:26 +0000
Message-ID: <CH0PR11MB54443964EED73B914EDBB509E56EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250606204311.813-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250606204311.813-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7316:EE_
x-ms-office365-filtering-correlation-id: bcd0f04f-c814-4d50-099d-08dda53dffe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K/p/UNP7hvrfNOJRklNxfjHIHaEbxXYb3xs6A1tc0OLfA6anxioQebairzDY?=
 =?us-ascii?Q?pBsJToOgSJ5ugZKWSxRnq5y41/1ZazrMN9ia9ftF74m7Mx4EDdo70ClkKXnu?=
 =?us-ascii?Q?rtufTfLacM6UCO7dsuFSEW2F6PGph96xY2jJIDK6MHOKHpbzGfY++z48cXGK?=
 =?us-ascii?Q?ZqIdoBkNRLuN9HvtzO0PUj1xtEYhBQIe0SFSx7juXhvC9bdhG5nwYBSylOy2?=
 =?us-ascii?Q?jo4aMT2L63NY5qZJpwniyoP2a+iX/lsy/xRDddlNNttIstWzELHlpQPsPWPX?=
 =?us-ascii?Q?3gikJdm9tfVkneZGzQXleSLFmAm/Scg5Ej/8WqAjLPatRCVAbaOir6DBLiQe?=
 =?us-ascii?Q?q+CG4GFZhp5mh20Tn26pGUe4d0NoadQEn8SCGyiwb1ciHsdl541H/LpUNzXM?=
 =?us-ascii?Q?jsd1VW5pMjeqqC4Ebzi3H83EqWmZAPDY/y7DHLYXHXAM6lfzGZVygvEI1IGU?=
 =?us-ascii?Q?8szLebBfwXsMGlotxe9TOkBkyZVXWf7X4SUTS7sG2WkpB/VXuMqLWzPE4OfC?=
 =?us-ascii?Q?oUQbzfz8OBjg8egDCwndUPC2UlE3ehwBpD5EQifbIzaAvmJjgRRTS3ot+l7U?=
 =?us-ascii?Q?sJhcwQp7FZGUl/tK/H7H34bMVYhxR2SNAFmHrE4Qbkq9QGJBUvXDbcqYh64e?=
 =?us-ascii?Q?RYYf1Ira/GDuxqY/CkqRrgysoicIrssci7nwSc5Ef1HFcECLf52VS6Fn+NTo?=
 =?us-ascii?Q?Zz/pH6VrjQMp6OewFK1p/+bpvbQrttPcIqLACvrCB4gcsKBgiwoHnlDvfGOM?=
 =?us-ascii?Q?THroSf/TPSpIRpSZ3xUBlTTUS2t6KfKjIzLJOn1kaHKpBg671dm4kXRgr3lD?=
 =?us-ascii?Q?QvpOqg0sYunpENC4GeU7XbDRP33sYA1UOlTQ4RavxSu0b8wkYL6j6VSGj4DM?=
 =?us-ascii?Q?hZy3xiO0VWGg4O3gVgRjM2t04pfM7gTqJKxT/S04a3+LLPKaDLGKzTQaB7VP?=
 =?us-ascii?Q?8PXvsASUAv53NX022vr/35/UtWS5trv4nfRfwEhiyeZuOArfBgzI/gLHSOps?=
 =?us-ascii?Q?SVT8i+0VnFfK7gJduzhPfLKgimKIAK/x3E6Tvj105FTwkczSIYRr3EfnLzwM?=
 =?us-ascii?Q?+7xIlK7lqAkfmIMYwzr4J7dG6PIFjn4iJLHSOJGQ6MdjhGZUtsQyHU2dDu4R?=
 =?us-ascii?Q?1LO6TDRLaGk1jDYnlZbMP4w8fqR12k6v1JeLeX3zWbDly13As7fcMkMwbels?=
 =?us-ascii?Q?5EQrG3a7HuGFSbgGSXArk/C2dtcF9/IolhInY624MOTSnsbVKWCBPmZncHwk?=
 =?us-ascii?Q?cMa23iuk/fDGXUnoS2J5toTwm86ng8JqwOFAggDJ7/qcrV9SJJlsR7+bmw46?=
 =?us-ascii?Q?AxMMh42Ua4MVeg5emwFkOEn+pgPFRfw0nIOjAeVA2FG8OCBZ8YvHOccbA8uo?=
 =?us-ascii?Q?n/yRNatKa8nYk4MdGC2iGjE3gWmCUjnQmLxYQmP/WSONf1q4SfmGuUBk15Bi?=
 =?us-ascii?Q?TP7Y1Q8HkOPz7zeb2aoCXK4NriBPZxgH+KvKJOZIV4pPm2hwYqZLtGwscCMX?=
 =?us-ascii?Q?AbrZ388K6fCP4sw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rECzbwmzQBk5M58vDLaflrjsx8/2N2nsj2dTfksXGpun1cniO79ajFV2K2/V?=
 =?us-ascii?Q?MtK9ChF9r1VbFdyL9xcJu3Bbi6laFbxreNbnCQHmAmNFRCjSbXd1RWKbAD9E?=
 =?us-ascii?Q?yScEPfwEMOfiEF/YFmlHf3U6FekGwhv7LgOfNUYx1504kxWiplIHaiC6y8Cl?=
 =?us-ascii?Q?bkMhekhLZOcaQnCUk5O+8vBh8+tUDIl/45nn8tI9YxUCjNxB03e32/6a/xMO?=
 =?us-ascii?Q?WF9/q/M7fsTaOCuack+zSmcnsGwlf0+zxhPzcj2/NLeqYyC/ZhfbF7saa6Tx?=
 =?us-ascii?Q?wxTzsLy+jypRz14b9KxqOSsetuQmqZqPIcz1ykaMRWMZ0bDYw+6dWOgp3c1J?=
 =?us-ascii?Q?sBR2C/QmC8Tz7M49N3rUPS1vRfE8dwFTpKtwLEsR3aq7yoZLkNCNUI7jgNIK?=
 =?us-ascii?Q?3hEqgmARvAV5bFamHyqgrI81tb9+1lvCEB6A5WkkyiR5rWqvdkUQjYyonSeX?=
 =?us-ascii?Q?soSAGGDiL68QyjUoJd2dHJKv/Ryrtz1mHpWDzZLdwPQJu9ZBrH/6F7CNc48N?=
 =?us-ascii?Q?6/3xVER2heJELVr/eLSZGoXVn/ok+WQcWXkc5HabEAIj8UhLLnjjhDTqw+Mi?=
 =?us-ascii?Q?8Vh/cgyMIXF73M2Z8Pr8EiDSLTeDjGzWDKr8971hopocuGPUf/nebWfE/TKU?=
 =?us-ascii?Q?ymVLXuORRqagcCc6skikZlGH4t14aDF3L860ll3ZRowTUoI7DMDVmoWaYfxu?=
 =?us-ascii?Q?PSelu7NPTHWsUidlvNID4ip0te2lSOPOZVlfEZCvmXN8WqGsHJA8fO7EBe4s?=
 =?us-ascii?Q?LRq+WfEGuKOReY2eImlHr5EY4vn2v/RP6Onz79G2QuglLktmu2FD77fne9Mf?=
 =?us-ascii?Q?hW/InVxud8wqwcJ4EnMP2a1FjNTHSY4dfUSNt7DvpFA9oq7xq2Zphl4emjjw?=
 =?us-ascii?Q?sz1+EPm2q0uaptvpbqkk3vJYw1X1MH/I/HHsKXZgTb1MmwrtNU5XVz0RnRlk?=
 =?us-ascii?Q?5NMTpYKQLS7juDJh24+StAjGecWM30TLpUORMTRSgwCIR58v/7dOGRWLc55u?=
 =?us-ascii?Q?aJ6QSOmFjiwqU6F6ABlC9KAz+gpzohxeh4NSI8N+vfU+/pj5bYRLJioL/kM1?=
 =?us-ascii?Q?LJA9OD2KxQM2wbK6l7Y8N/XCAXRw7ZUSosCG3Vg12wyxTBUJDwCty7p9jseb?=
 =?us-ascii?Q?749Y0P69l+/CJlctOppn7lRRToLaBiNaSCAOU2KmW5Dt/wag3lOukU+p+XvC?=
 =?us-ascii?Q?WzixVa6FrYxSQLm6skB1SrE2uhCnZq/N9ZmojcUuNpNF/O1dfgRsjr90GVrx?=
 =?us-ascii?Q?E3XLYati4qG6y312o5E67ZoDXSXt4hp7KcuknkLV/S5S+FJ5h+QY6W0StOK1?=
 =?us-ascii?Q?UpoCOBR9MQsdGoyX2p8dAZMr4cyRkGwxoYicQXtp0c0jAaxNKkEgGHA1vbyC?=
 =?us-ascii?Q?5SzTPAxxI/QJ7myWcAPsqZbnHnfVhjL/+C1+J4vfu5QhwszaqDq6T0fDZOWW?=
 =?us-ascii?Q?5nXWNtHL2BkxrleyiSomDuhAOo59Z/m/2+7JRLUyHS8S+nqsjkaV8VGGb8SM?=
 =?us-ascii?Q?ygrK+hEQJ5u0hmRnRdVxNDdoycu6CcgJFoQDB/qHYXavM48Dnx6/p82Z5HJG?=
 =?us-ascii?Q?Hu3/JU4yBYHGe/d86efAJqBcn1/WjCNticSjFEGp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd0f04f-c814-4d50-099d-08dda53dffe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 21:06:26.0604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c++8WqwqhZ6lwrfHUpJTMODwJIsiMtFToCguFTAsPD7/GSuHBiJ/jnbMkPiBPD4yvX7XB4b/hNjcsjJWK39lqyVuUz7ocziBMAylilTdyMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Friday, June 6, 2025 1:43 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Ceraolo Spurio, Daniele=
 <daniele.ceraolospurio@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.=
com>; Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH] drm/xe/uc: Use GT-oriented firmware messages
>=20
> We are already prepared to define firmwares per-GT type, so we
> should also prepare our messages to be GT-oriented.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 7b2d01d39b86..dcc3021c9f5a 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -668,8 +668,9 @@ do { \
>  static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware *=
*firmware_p)
>  {
>  	struct xe_device *xe =3D uc_fw_to_xe(uc_fw);
> +	struct xe_gt *gt =3D uc_fw_to_gt(uc_fw);
> +	struct drm_printer p =3D xe_gt_info_printer(gt);
>  	struct device *dev =3D xe->drm.dev;
> -	struct drm_printer p =3D drm_info_printer(dev);
>  	const struct firmware *fw =3D NULL;
>  	int err;
> =20
> @@ -678,8 +679,8 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, cons=
t struct firmware **firmwar
>  	 * before we're looked at the HW caps to see if we have uc support
>  	 */
>  	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
> -	xe_assert(xe, !uc_fw->status);
> -	xe_assert(xe, !uc_fw->path);
> +	xe_gt_assert(gt, !uc_fw->status);
> +	xe_gt_assert(gt, !uc_fw->path);
> =20
>  	uc_fw_auto_select(xe, uc_fw);
> =20
> @@ -703,7 +704,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, cons=
t struct firmware **firmwar
> =20
>  	if (!xe_uc_fw_is_supported(uc_fw)) {
>  		if (uc_fw->type =3D=3D XE_UC_FW_TYPE_GUC) {
> -			drm_err(&xe->drm, "No GuC firmware defined for platform\n");
> +			xe_gt_err(gt, "No GuC firmware defined for platform\n");
>  			return -ENOENT;
>  		}
>  		return 0;
> @@ -712,7 +713,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, cons=
t struct firmware **firmwar
>  	/* an empty path means the firmware is disabled */
>  	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>  		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
> -		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
> +		xe_gt_dbg(gt, "%s disabled\n", xe_uc_fw_type_repr(uc_fw->type));
>  		return 0;
>  	}
> =20
> @@ -745,10 +746,10 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, co=
nst struct firmware **firmwar
>  			       XE_UC_FIRMWARE_MISSING :
>  			       XE_UC_FIRMWARE_ERROR);
> =20
> -	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
> -		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
> -	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
> -		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
> +	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
> +		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
> +	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
> +		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
> =20
>  	release_firmware(fw);		/* OK even if fw is NULL */
> =20
> --=20
> 2.47.1
>=20
>=20
