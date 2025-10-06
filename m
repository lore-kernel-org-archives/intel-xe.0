Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7D7CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 17:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA77D10E433;
	Mon,  6 Oct 2025 17:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMeVWAdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C056D10E433
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759772783; x=1791308783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Npe62SSVyla1kWcX8FPVM2QXWndSyFqvXlQHv7dLaFI=;
 b=BMeVWAdRenZbmv32/VAifDjA04ie9Im+GzZD8kJ3zaRF1rg7oG5/tKCD
 UzH/9wDrz2y+Y8lrMOVEf4zgXBJ61QROUxE/GAsVo61EkV8nlDhnuRKKn
 h5SX7LOC7hB9CGUh4gP33oX1EFaFk0FVHYAJeOEWowzimnTnYcqtFxeW7
 z67kWzbYRijEmBQ+Ukz2YWBYAQ6iWFLM8wQIz+Dx3IUMPGhcni1tiO9BS
 5r9Tcv07++iaesQ/DhKCE34DsBebDmiU/g681pkjvke5UU6FKEOaEHrYo
 cHw7UAjQpaSlZxzClXh7NDR4Z5C1vBDUgo5nRq5ima+IAz3+ikV8oWqq7 A==;
X-CSE-ConnectionGUID: RPHuLNYuRpO8p5+kAXGRqA==
X-CSE-MsgGUID: vnpIJVxmS+CagXNYP1S0Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73373155"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="73373155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:46:22 -0700
X-CSE-ConnectionGUID: T7yeO0iEScGrdq6b9pMIbA==
X-CSE-MsgGUID: uSPchdsdR9OMpWwaplBwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="203677431"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:46:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:46:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 10:46:21 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfapw5eh182juqfO0+F2ANkGlHVDF9Rr0MReJJ7TSZqZI3dEElLew3DnUvcI5lXHUSEzU3PPZhzwqaSe2TMAQ4hNtI9ADa7cs0mRb7uwcWlAun7k+iYaEMiQLtzYCoVzOJn+X9RtbLkv6I0QggTbSiFyeNI0HqQvpshLK44Hpa/kojlQiibdNt7HPJ050cYvrqlwfzp8p7vMzqF5I6pJ0Jp+6iY20MZRoXVehyjGbEQAK+HxRqbXc1Vk80wR6ZfBSRRlFBsT17icPUJKCPVya4blBTiiSYjFJ1eVpPqmnv8B8r7NFRHbmi4Kc9osN8AK6ywU94LQ7MFJL4UMtgOqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqjtZF3KdOsFjmaiJT6tkwuKUcoQIEeP49wO9uUrPio=;
 b=VMGX9S1hrfgH+YNjW8KnAZdcBv/F6R6EEEU9cJTVkfJhN4PEeBEFsVJSwZ4Jd5V6MuqjXRt2NZolF+3JkvXakowX8VvaA6RUBwtfBarrfLBiSce3jk3Az0bgOOk1O0ushPb8Tx/PVxJx1EisM85AKJVh02ECDHMudYEpPu7DuZvPdIEadDenlUZsfY5CvyaBJXM2ztfZX3geAasoAWOGTRs010MW8xp6zoOHarBNZiKipvJtFREKZg85kDVE7QOwnzbFkipGxgE38lbGNZxW0DKnuzFR/UkeTLTBWSMTIy8Cl8okkqpOQxC03motGzXm8TruadK9E+fuV8c1XUac5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 17:46:15 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:46:15 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Topic: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Index: AQHcNMLHh33Qlgclfk6Q3yUnAYEY9LS020CAgAB9LoCAAAN24IAACtGAgAABO2A=
Date: Mon, 6 Oct 2025 17:46:15 +0000
Message-ID: <DM4PR11MB54564716E68A87209CA70D32EAE3A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004000425.2489291-2-shuicheng.lin@intel.com>
 <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <aOPywRsc9aw_p3-1@intel.com>
 <DM4PR11MB54565D54961E7F19539D7B2DEAE3A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aOP-u6m84ol6iy6k@intel.com>
In-Reply-To: <aOP-u6m84ol6iy6k@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB6914:EE_
x-ms-office365-filtering-correlation-id: 6d7722ae-9777-4542-345e-08de05003f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?krgUfPtpgoi+b/QP6720/kBwGojWXiFX7afpAg8nPJ9lRCuCyFjVqR03F1hD?=
 =?us-ascii?Q?Xulm6EvN819R328AIG1fQzpG8dWM3qSyOAIB9s7cXNN0arcFcevbF7y0UDSp?=
 =?us-ascii?Q?ysdxQLegZdp3GVicVfA459ITkgFjGae/ax+ezvsN6xkmuyISscPgvSkPA75E?=
 =?us-ascii?Q?OA5vh7LFzKGeQHxbZL/l6NxkYj7gVzYyqfygGQFfy6mWpAWKSfKhNoAw662E?=
 =?us-ascii?Q?/q7Z/JgragnkTcfGnQCIl10vSX+edwKKLiB//lCqzkjMe5SB68MV8VrBw6Mu?=
 =?us-ascii?Q?VuaZnvGoNi5y+EEJf3+YrsblDO/tW631Un9hn66CrS1w4dc+hCP7e2HXmiSf?=
 =?us-ascii?Q?EmWOKlVODL3svIzo+HRlMO5R6Tc60Ff7iigQPERBY/dZ/39RoCKq7S1YKLQ3?=
 =?us-ascii?Q?Xjk21XkVNE8BWNYlpmO6owCtkf9FYVdtI/r48w2fX2sXzgOtEB7renR2xjTI?=
 =?us-ascii?Q?OXY7WGhscxFUcueF8oeXH55BQrkcs1uPQFP2IkMlqwZG6M8TccursRnyWQqV?=
 =?us-ascii?Q?2jjv0PiC5tHQEZFwEbzSksTg80KsLJQEit1zq4eK2cmHdcDq7tz2mUBd6Ijy?=
 =?us-ascii?Q?SXQoHg9IddeAs/Fg962R6mldiYzA6/VzlnfeVLgWRQ913tqvaH6wV0n3J3hX?=
 =?us-ascii?Q?IEUC0Fo6mHUQ8U+fd5soycbkFHlXdskr2DjNady+Rbmveu1OrxgmmAeAC7dz?=
 =?us-ascii?Q?8Jv/8Xi3FENLYEkdFUv/05pb3bqNrOTMeopnxB5M83UiiOlhc2cM2XmyvbCt?=
 =?us-ascii?Q?jAqwUezSKHJOa7RNn65eJDKAhs5/jRunUWoqhy1WNg4fLErtlW/LJN5kRvih?=
 =?us-ascii?Q?Tml1fq2bU9PqLSSmEckggg61UDIojYbiaESiy9PJR7QNjD/qZb7lhZzHohcN?=
 =?us-ascii?Q?NsZ9GzG0WkD5mDPhj0fWKoj5mv1glvRxgZWa4JrV1aNw7sb17ZI1KWZdVnXo?=
 =?us-ascii?Q?dAS2PDWsmoz3pe4pftBMGHGFjHRE/VByW7ZWTODodveRWtXT6JtaVZ0hseAJ?=
 =?us-ascii?Q?Kh9RykQXWnmBkBayhpET9TjpffANUDrN+mq9MQFVE/LZG5veizXowxvKpZYa?=
 =?us-ascii?Q?XLUTCP3pmprELYBQiqj7/EEHVOzUOIKlnUH/tO3wmvqie+YzfZGFJhdpHRYK?=
 =?us-ascii?Q?cs3SDFGpuuRvUBziRVhoHOP8/Omj5ixGs4vjXwGZl6c3Z+1Zm67Rw0h+XXhk?=
 =?us-ascii?Q?rPw2JzIT9INlFwA4kwOY3VC8qXyZqJ9ZoodqXvHbb9MrlyE8jd7fFsxvhQBe?=
 =?us-ascii?Q?SmLV4cBs1KdKcXYuxsCQQRlIEQ0UNIaYizgl95xevekDTvkzi6HPxUFRXrgE?=
 =?us-ascii?Q?yoNqIz6nQrmpHpe7uy2szycBtT9L1pjEcyHSUFpzjnpyNft9sZvL5wR/ZM2f?=
 =?us-ascii?Q?Wkfquvuo8W1JXZiQLBr0gPTPz8LkC5GM5xuYkhXX7MD9aW2pdIdiVluy6fB6?=
 =?us-ascii?Q?ZDmzJAPY5Trez8R2gYSd47oFcBXu9hfPmm1DXn98VQtkn2CpDJBnt4SiHAaQ?=
 =?us-ascii?Q?zI0RzEfSydfNwxWIbU11GYoMROQdJaFiuEpK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iY7CW+J0Xne2qRXNJcURa25M0qSxQMWysKrmKPe9KDGPyocNEt1L1jYs0ePy?=
 =?us-ascii?Q?xOKPMVTaapeYj8SKKY1xiZtgcw3NE+LDcvtfDMj+g686bDwNfggD9xPjoLeG?=
 =?us-ascii?Q?8ZJegu8GQ2n7sFu3bvLPVk9ztIpQAml37MKpjIdWSD1fa0QD0n9bTWX/LfJO?=
 =?us-ascii?Q?rSVG+p6S6iBLVBzT8ZVESdlds6omHoaF7URNZKxkYg4cv7eeIo9mF9+X1W5h?=
 =?us-ascii?Q?rDpzS3I9pooQGquMkhWm5uVXeDj8tWHDeCKLNfVenyE3azf4tsrv3Se6eJgZ?=
 =?us-ascii?Q?CotZIR/ulc5cZZiVVdDafeRKnMPst4FPcw3y9duv/KMwaXXMmSMiHPcE7c0d?=
 =?us-ascii?Q?QlirpkrREnVSkEgoHPMSO3JBVLPRCQYurD2MuoN/8nUOUlfpr92uPZYStohj?=
 =?us-ascii?Q?Iztujubq59jCdqd4orR0NfuBoWfl5kLWWXUWzlwm36jzjzua86etwfEk4tqy?=
 =?us-ascii?Q?hkrg9P8Is40+36YMiO0X8Pm0JcUnvHEBYG8yCiKBdQQoK4Hd9a8uY6LYBHAH?=
 =?us-ascii?Q?trI+p4kI0jmvSG3U5vKI9+6D/30b8W0UGEqQ0Cu/KHDYm12CQuNI3lkjBfz1?=
 =?us-ascii?Q?pzbHT+Shb7A1ZDLEO+teDJhFl97SZQLFF+z3stBR2FGoRwfh13XHc7Gt9Jm4?=
 =?us-ascii?Q?Fp+R9wJyYT4zyz4hW3NXTiBvs1hK5NapopgtJ1M+02M70lmB8v7dq6E3r4c/?=
 =?us-ascii?Q?4PwfAek1Zx0U+zSb6n9Ch5xTvKvZKv9QJqUpdQNL5RbN/QS/ypJ2K0bov2Ca?=
 =?us-ascii?Q?FbIyHo4mRYVzi1+IIurfIZPQssC4Yg86JL9cud4GfCSosjfnwiGynoAqR9fX?=
 =?us-ascii?Q?My+66xxuZfPUS/HFjNZPJ1/1D4UIW8Vb3O9PQsUYkl/330NGSNJ4M0BJiMWv?=
 =?us-ascii?Q?HEvo3WYVSfsKWZOkMQg1347Bk0bokBLNSytA+tBH4EnoiZae5LVPZWIYzC9w?=
 =?us-ascii?Q?piEZnDpiAXcQjSylE7vBQ46zMCGQOx7RoKq6hqc+UmP73CtZaZ0dqpex8zYO?=
 =?us-ascii?Q?rFyyZLaR4Nv2ehz5AwEPWFSYPfQykfVd1mjpj1607HDPBUqgdTNxDkaEglu1?=
 =?us-ascii?Q?rCCfA79WGt3Z82nHOP3ln6mdtwVDrjxtnYb0ZpCBczGppbJgxzGhBPQGPseP?=
 =?us-ascii?Q?ufa5IxqiHCd6jMCvc7v4Qlcqun4bIi0eYB1yy8OpoxnJKV5/6n2OILF9mq/X?=
 =?us-ascii?Q?Bp12adbAJsui/lamFahM6+1T6htkPQbeTyL3dmUqVf2mh4TUApP5IrYGNRQo?=
 =?us-ascii?Q?BpJXJq5BMqVVaZE+KVyPP77zyfN1O++KqKeMKij33h5SolJ0V7tywh4mK1An?=
 =?us-ascii?Q?34zMaUwJ1K4j9u13dzYHeZ3BmjMlt17XYCNA6NsY6PSasZvjnn28kfwdH9Kc?=
 =?us-ascii?Q?JvOinUnT2q+TFl+/O8ILCgxD16TM2GCaWVtNdOtZRidy5cUH0j3ktHNInh7y?=
 =?us-ascii?Q?/LNipmv9s4J15Pat7DoeHDRCBmrmhA3srjLEFglts2zphIs6Fmvo8mAvKChu?=
 =?us-ascii?Q?i1Y/USomYftjQOPAWB4hASs+9vKbBj3gsynR3wFcxZncaE7DpXAlfwTYtLBj?=
 =?us-ascii?Q?4tOlfGtlNcZFQVJRfxmhQyQr8/94YqSwILLqqSw8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7722ae-9777-4542-345e-08de05003f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 17:46:15.3889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okdXvan5ykYa9wbtOUjBjOTSkc8dCWw1O05AONE9UQbqSWwN8Hp1Wy42n5TwYpHPG3FbGCSzyvAsM6hL2pw2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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

On Mon, Oct 6, 2025 10:39 AM Rodrigo Vivi wrote:
> On Mon, Oct 06, 2025 at 01:03:32PM -0400, Lin, Shuicheng wrote:
> > On Mon, Oct 6, 2025 9:48 AM Rodrigo Vivi wrote:
> > > On Mon, Oct 06, 2025 at 09:19:59AM +0000, Gote, Nitin R wrote:
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Shuicheng Lin
> > > > > Sent: Saturday, October 4, 2025 5:34 AM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> > > > > Subject: [PATCH] drm/xe: Fix copyright and function naming in
> > > > > xe_ttm_vram_mgr
> > > > >
> > > > > - Correct copyright year from "2002" to "2022".
> > >
> > > patch pushed to drm-xe-next. Thanks
> > >
> > > apparently we still have 2 more occurrences:
> > >
> > > drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c: * Copyright (C) 2021-2002
> > > Red Hat
> > > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c: * Copyright (C) 2021-2002 Red
> > > Hat
> > >
> >
> > Thanks Rodrigo.
> > Will you take care of it, or would you like me to handle it as well? Th=
anks.
>=20
> I would appreciate if you take care of that as a follow up.
>=20
> Thank you

Got it, thanks.

Shuicheng

>=20
> >
> > Shuicheng
> >
> > > > > - Rename ttm_vram_mgr_fini() to xe_ttm_vram_mgr_fini() to avoid
> > > > >   confusion with generic TTM helpers.
> > > > >
> > > > > No functional changes intended.
> > > > >
> > > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > index 9175b4a2214b..9f70802fce92 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > @@ -1,7 +1,7 @@
> > > > >  // SPDX-License-Identifier: MIT
> > > > >  /*
> > > > >   * Copyright (c) 2021-2022 Intel Corporation
> > > > > - * Copyright (C) 2021-2002 Red Hat
> > > > > + * Copyright (C) 2021-2022 Red Hat
> > > > >   */
> > > > >
> > > > >  #include <drm/drm_managed.h>
> > > > > @@ -284,7 +284,7 @@ static const struct
> > > > > ttm_resource_manager_func xe_ttm_vram_mgr_func =3D {
> > > > >  	.debug	=3D xe_ttm_vram_mgr_debug
> > > > >  };
> > > > >
> > > > > -static void ttm_vram_mgr_fini(struct drm_device *dev, void
> > > > > *arg)
> > > > > +static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void
> > > > > +*arg)
> > > > >  {
> > > > >  	struct xe_device *xe =3D to_xe_device(dev);
> > > > >  	struct xe_ttm_vram_mgr *mgr =3D arg; @@ -335,7 +335,7 @@ int
> > > > > __xe_ttm_vram_mgr_init(struct xe_device *xe, struct
> > > > > xe_ttm_vram_mgr *mgr,
> > > > >  	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
> > > > >  	ttm_resource_manager_set_used(&mgr->manager, true);
> > > > >
> > > > > -	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini,
> > > mgr);
> > > > > +	return drmm_add_action_or_reset(&xe->drm,
> > > > > +xe_ttm_vram_mgr_fini,
> > > > > mgr);
> > > >
> > > > LGTM,
> > > > Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
> > > >
> > > > Nitin
> > > > >  }
> > > > >
> > > > >  /**
> > > > > --
> > > > > 2.49.0
> > > >
