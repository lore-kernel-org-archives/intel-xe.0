Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8A0C982E4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 18:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514410E919;
	Fri, 16 Jan 2026 18:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QV9twtnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160A10E0EC
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768586731; x=1800122731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pnp0KHYzezYEKCHXZPudxnPwYzU7O+lGod1QTMlHPm4=;
 b=QV9twtnhbORAKJPcy1EtrE/cEQKf62lmBNHqE/j9qLbIJgjVV/xw2MjW
 ngYjzxApfjsQteLP9mrOsLusrCzVt6NWzREHRpfrS+AGVy6fmjg1INZTf
 lrMcf6A1AxsP42yjwR5obGPFEeQwsAlaKvdyDIt+OVIE3yP5zvtS8Oo+v
 UobLyfEH0f16wn/Zyvk/ej4FKp/BrOARfipcp5jlE54vqUIlnnMzXzzvK
 7mfkkQfYTIVyWPcX/F/dHwg1HUFN8JnTCcupks+kqJP9p4ihu1u/F+IQc
 wbXrLcLIAlM0c4Wdp+2HYfiWAmZWmfQEQKv0LwDAOAIIVAu6Slzyo2N+w w==;
X-CSE-ConnectionGUID: GMbgp6Y4TIOyOIY8bCk4HA==
X-CSE-MsgGUID: kPrECHC9TZqyvgMthhNXEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69107122"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69107122"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:05:31 -0800
X-CSE-ConnectionGUID: l5/g0HOAT065ms7tG5ZRjw==
X-CSE-MsgGUID: 11dMd2BRS+Se/sySNe9USQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="242844779"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:05:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:05:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 10:05:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:05:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/A1qtm8MySG5NCc2VR1VbNY1I4m0g/xBElGjIDXGhAlRPqZVdO3MqfrmzgRczpsG3lDsVv5f5+5xIyfFp/3OSRpQmxGEwlCmS0jRllpqnyc9a5RpHGX6TzdHwKYVn7UEWt+DOZvZ+PNSK3Yk338bpoEQ9dOQKruyHz14d7C8YaZUYo0yKfWNPVOU/5A/YvY1emxnS15xBhxCnsLSTSv5fcZj8mhX+9WiKN7tSuf2NZoGlTH7pzhV+beVKH868AgC6DfGc6W77bJh41+OF5Ta4a+maojSbuFz5GJb0OpyLZuv95O02wUNNRxSKSStnlqredcAskSK/yGm/AgtIg6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2bafgp8avgtVv8lA81MarYYTVesCRxJYRUIOoUoMUk=;
 b=OBQo6Z+MEf1MA4ybk2+8Y0lDCiLpmEM3EUQTI6GcYNiTUycg8KCo2t6GAldqQiMKVi7PXCjh0Ql0rwrELbTrnwgJqzZS+YZyIYvk2i116KdEadfol+a6LdpMoWo5ya7aQrIe07aBRC9JlQ+m5ofyNaSZ6F0hhhY0pt81wKkcce4rW6NnEAnm9ig9Y+ItF5oIQ8+Hc+17U+Rg7Q4/4fRyfohhgRz7gtLA9RF67CnQ9hbKnc/P1d6K799RZhMOoO73FEeoOLvwYbUH1w1YIchzxn92rWhEPElj8O2TRaMd6stFXlxvOC4V3yJ9pzx8O9x67CIhEIZ4g+x5AKJT1mh1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 18:05:25 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 18:05:25 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Topic: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Index: AQHcgbPNwQALQWx4uUecG1/tOmwrrrVVFJTA
Date: Fri, 16 Jan 2026 18:05:24 +0000
Message-ID: <SA1PR11MB8839DA5521EE46BF29CC2D64AA8DA@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA4PR11MB9279:EE_
x-ms-office365-filtering-correlation-id: 95f4161c-3625-409a-ded9-08de5529d2ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gH77B86aka2SbwihoAOGlBjS3AiHBNRka6syAB29OAhaR7RyBmyi9mejlLSz?=
 =?us-ascii?Q?BfmDXIRtcdizgi8WkQ6+Hz5iYwLT+OlTt+GD1LO4mN1R5/Sb9pcmdRu8y7Tq?=
 =?us-ascii?Q?cD5/EAoy4QrKTfyIbR/hjKNBK0EvG6HJ5O7MVmkdSWdv+j7Nah6rbVTA+N9E?=
 =?us-ascii?Q?hzqi5h+Ctqhg9/O+f53oxSNin2FbUcYzo51uBqSXNkvQRrMDDxqQwZAwifdO?=
 =?us-ascii?Q?eGJMNngYgGKlrLGCYHawKU9BsEa1RkSm9Tl+GNExYTNYg/tLMSZeKZgwPcxA?=
 =?us-ascii?Q?8dJN5gKGxSHreWFpf5Q/oP4ACeqhuPV7oITktZb7PdeSp/IxiCxI2m7367+z?=
 =?us-ascii?Q?ajOgPiPjcMHv/6TVXYtHcn/treZfDD1oJsWk84r3/Qlnnsr1/JWb7P7uk5/K?=
 =?us-ascii?Q?Egh/wIIX7qJoVz+STzcfXLN6sjCGzNi7QvdkdAYTlZy2Zs57Z0+JfFw2zuhS?=
 =?us-ascii?Q?+ZqFHFZzEbezEuKS7PqGaMm5srl1z7jib9txLHk3mqF8l55Xr2vq2T3h0fhi?=
 =?us-ascii?Q?OLYTEkRQ2pgWVMoyiMbaAjQB78vx07ulW6dMudHFbzzr7a5PQWA1dFq8xq6P?=
 =?us-ascii?Q?eKrbTNUy750WrVWrifmN047G4E9KHtATtIE/aUiLvhGQFpU5D/guen031lt7?=
 =?us-ascii?Q?/qq9hfYrAszsFwtOPIEYMd4gvxV7XpzD0mLDZ/Dhb/w00H5wG8aD3ah00d4X?=
 =?us-ascii?Q?HAXf7H/AhZ6DDj/k4J+IHx8WOxac99aLBP57+0nsN6NVCIllHnG3tpe7jJSr?=
 =?us-ascii?Q?7YVpejyAZBZpJCjh5ZNd914Q9VLVv5vIn48BvxWwo0QQys15jnTThTaIZGTC?=
 =?us-ascii?Q?DXYSZ9qJ5myMJmcEWmQoilMuKglahelZQm3DF7wZ+gM8DGbsf5CuK5FM1pCj?=
 =?us-ascii?Q?fi1K3mfp03+wUkxviQMJYGwPSvfwrOBQaGuU8MEqpfWrOeHdEYSyhhdUXyle?=
 =?us-ascii?Q?QPp6Vl1YQ7bKGjn4qqFqT9Bo178wks03Zg8i9HRxfL2JIrPwN/aFvajG/OsG?=
 =?us-ascii?Q?mDyharsam9nCcBCYuKayNhyeQc4ARk2rmOCX8LCo/Nb68FOfGQS5TJBgytzu?=
 =?us-ascii?Q?73vFqqZ0LMP7YtqloZ5SLRK5kyTOESzh7ggZI4J6oDCImwaGhaV9NyBsR8Qp?=
 =?us-ascii?Q?sCa5oj8N9WJh3jWcUwas/jL1OEMAOL/99ouyt7wMoNOZ9xWxXBlSSqfd8ZYs?=
 =?us-ascii?Q?XKfFQBlrLuTKB30kfuvLUA01Ul4q0cjaksZc+uNOIW9BIzZGrnXBEsHbVwRv?=
 =?us-ascii?Q?BZxd7aUoL3dAFA3Fun6MIBQ3a6SHn3ZTrDvvYLW1V+xAV8XBxdKGvTKgeMYJ?=
 =?us-ascii?Q?tvSh7wBBVWRLKvZ7Tf76sO33Hxzzi+dg2wj3qMLUo/pLAFs/lHa62J/6nI8P?=
 =?us-ascii?Q?d3GbCJ1Q8RakufF/XVEuIVBBDBlzPIIouhRUUjx8vbqB99XyWCYLfDP/8jSj?=
 =?us-ascii?Q?rORNObiqmFM6hcv2KBKWfqTOAsylK9PLzMPoEumsYE+LL5S3C0fJ8ZMjcgvV?=
 =?us-ascii?Q?66l6SS8QYrXXJpgf5p3A5B83CeRHhjsvasEFNRdvFA/uUOxc4FEYbsuNSaET?=
 =?us-ascii?Q?BA1WZVaX57oFTm1QM9m5UvN+QVNFAzJu3ysEzQHWZdvJ/jTmGW2tXfY1RTPU?=
 =?us-ascii?Q?RN2mOWii7fsvc7Kr1jjKS/w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vaWm45IcZ151pqX5HDPITROBR8hSOyNSfIfpwl9QnsyGxUvFZuS7svPqw1Ud?=
 =?us-ascii?Q?b5ii8fD4ojqARUj0UCKRtzMTm7hJv5Jg3ndYsmQtmDke0gdq+duJU+OPHFhA?=
 =?us-ascii?Q?PUQL8/+5N9c2L/Tce3jsuwZFzke1Hm6Nk2lPdZBRx9BuC/c0Zt6kAC89PgX+?=
 =?us-ascii?Q?pvR+CUWYPnoKwzExbuaE42VO89SRj/SB3Heysayr+OKCK5hCNhWRdrCNFS4U?=
 =?us-ascii?Q?4dNS/bD/lo5MRLzjm3nz2U4ynBVWp8KTV9D3mpgZgGHxtmdU3GhzvbpomYaS?=
 =?us-ascii?Q?RaKlA5egMKxXQLKeymzk7pNzkyF+pCXsr4cczawCJAq2X8Kybenu45XgbFR9?=
 =?us-ascii?Q?Ceq8UD2eAJAs2SVa/OrbBKSgtsasKy5piNdLP9BKZqKhJ8u3s2aYjWmwnJMb?=
 =?us-ascii?Q?902Ecohjl6UyJN72Qawi1D/bpmC9FjsGt8mrnp7yzrQ5QMYFANUhi/UUaPIX?=
 =?us-ascii?Q?xN5lPd9tybIvGB0Tgzdm422PklPprKHhNr322MLbrXrzseeb0iWBeOgmNUu1?=
 =?us-ascii?Q?vOTCUiEF/pg0yAk5x/Bo6vs8iHJDptXLXo7mvQykRf1MXE27vPpy36lOJCM0?=
 =?us-ascii?Q?1dm9/dTf/4kz63nOMso+qCw5vimGK+El2cHKkWYCeeKOX7Fw876W4gbLENHt?=
 =?us-ascii?Q?DeJbDzfBtu+ijRK32kT8jScnwBVx1yGtScCk8ZMTJNUWwYUyV5ojMPI42FwT?=
 =?us-ascii?Q?GpWcciyHpLQvhPo/n7sg3tMhIJaLA30AymWl6Y6+EYWcXyDR6P62ATCvrQGA?=
 =?us-ascii?Q?+w0LWn/q9BdbLp/1C61Ab6rZc/3Urr9x0zkCW0DUbEaFyiYchQHYlAAc4tac?=
 =?us-ascii?Q?8VZ0CTw7/eCpXq6myiyjfoi3As1FTEoANS6+OYBpjtRHoC6zC5AukHoWzQRk?=
 =?us-ascii?Q?iXCRT0hX8idV2zR+3OXPbXuGGTcJiQwVg0TqxQRlBWIrEX2GmfNikpmesSZK?=
 =?us-ascii?Q?AAYKnzM4uRxlY3m4NgYVRrNCNWT+o3cht/jy3Ab086vVR9xxRMemVqnVzVs5?=
 =?us-ascii?Q?YXTZJ3Em1uN1Uki/4sBQhYpzyfWZ72vAeZxyTKQI9wV3yBVns5Y7YP8m3Q2u?=
 =?us-ascii?Q?UbcV6Eo4fXb0XUsQMY7LdIszH98QJkTPuUDtNGPb3c8Qv70r2qYZoRwmqwkO?=
 =?us-ascii?Q?2S84yfdjTaeb4Dii85VeNR143KysMNxK7zvyE5W3B/Fk+06scvCH58HRDUq9?=
 =?us-ascii?Q?xtmlGp9VhWJiTy58uPiSanJUS3HFzvCBDBXQUhQesKH9rsCr2Yidx2bVD6eT?=
 =?us-ascii?Q?e+yLZFjzlM8d17k1GgmZfC1S8YbDXGW5ray0bY/L7+BIazD5WLsiNzc1GxTP?=
 =?us-ascii?Q?/+tc4elEhoZYbFj7pO/Z9dBInAzotQSGhAajNT2PIrVxHVlBj/bG0i8iVFXX?=
 =?us-ascii?Q?aNcduhrf2HPsiRgI/Io2bg8hhf2K/zza6Ljw8BsulQxU6KnKCikmUcUh14SU?=
 =?us-ascii?Q?xg+SO5Uo2tyenzEPy0QjcqKYQTi5Ma0JYQhOfWrhynLBg2NXr16tGQHfmwGn?=
 =?us-ascii?Q?zr48OXyUTkA6bhFF1X7ludtOyj0oi3SvK9SC+83AnTrI4OuzYLfSi4+1BliC?=
 =?us-ascii?Q?tImOzy41ITm9MxfTX2nYAzJQk8e3mfacM+eX3ZzSP29srPJ7LYwtuHp1U1Py?=
 =?us-ascii?Q?Tkye0IoCdZEOxCDz4EMciOTk8HOmlYORexsCUFK8TLfHy1q0VXywSagtWzUn?=
 =?us-ascii?Q?A/DqMbfTm7gW8jyQW7olg3B9uvtEP+SP6S1/m4XqXEZLXJb++2lsDIiFNxsp?=
 =?us-ascii?Q?97RRM13EqzUlhMlnw8kd/mDYeS8nK0fogEhFlQoQS5ub6c2PxyFoKEDsALX6?=
x-ms-exchange-antispam-messagedata-1: D475Q7IoEyb0kg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f4161c-3625-409a-ded9-08de5529d2ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 18:05:25.0327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LN4NBifq8ELorm1TsIepIQEEYHrwcBMCNJY9jL+pwpxgIlb/C7mIkAottgOvzwP7ZoI0HHzRW4PyXU7nTSt5/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
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

On Friday, January 9, 2026 2:00 PM, Shuicheng Lin wrote:
> Move nvm teardown to a devm-managed action registered from xe_nvm_init().
> This ensures the auxiliary NVM device is deleted on probe failure and dev=
ice detach without requiring explicit calls from remove paths.
>=20
> As part of this, drop xe_nvm_fini() from xe_device_remove() and from the =
survivability sysfs teardown, and remove the public
> xe_nvm_fini() API from the header.
>=20
> This is to fix below warn message when there is probe failure after xe_nv=
m_init(), then xe_device_probe() is called again:
> "
> [  207.318152] sysfs: cannot create duplicate filename
> '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/=
xe.nvm.768'
> [  207.318157] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   =
W           6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> [  207.318160] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.318161] Hardwar=
e name: ASUS System Product Name/PRIME Z790-P WIFI,
> BIOS 0812 02/24/2023 [  207.318163] Call Trace:
> [  207.318163]  <TASK>
> [  207.318165]  dump_stack_lvl+0xa0/0xc0 [  207.318170]  dump_stack+0x10/=
0x20 [  207.318171]  sysfs_warn_dup+0xd5/0x110 [
> 207.318175]  sysfs_create_dir_ns+0x1f6/0x280 [  207.318177]  ? __pfx_sysf=
s_create_dir_ns+0x10/0x10
> [  207.318179]  ? lock_acquire+0x1a4/0x2e0 [  207.318182]  ? __kasan_chec=
k_read+0x11/0x20 [  207.318185]  ?
> do_raw_spin_unlock+0x5c/0x240 [  207.318187]  kobject_add_internal+0x28d/=
0x8e0 [  207.318189]  kobject_add+0x11f/0x1f0 [
> 207.318191]  ? __pfx_kobject_add+0x10/0x10 [  207.318193]  ? lockdep_init=
_map_type+0x4b/0x230 [  207.318195]  ?
> get_device_parent.isra.0+0x43/0x4c0
> [  207.318197]  ? kobject_get+0x55/0xf0
> [  207.318199]  device_add+0x2d7/0x1500
> [  207.318201]  ? __pfx_device_add+0x10/0x10 [  207.318203]  ? lockdep_in=
it_map_type+0x4b/0x230 [  207.318205]
> __auxiliary_device_add+0x99/0x140 [  207.318208]  xe_nvm_init+0x7a2/0xef0=
 [xe] [  207.318333]  ? xe_devcoredump_init+0x80/0x110
> [xe] [  207.318452]  ? __devm_add_action+0x82/0xc0 [  207.318454]  ? fs_r=
eclaim_release+0xc0/0x110 [  207.318457]
> xe_device_probe+0x17dd/0x2c40 [xe] [  207.318574]  ? __pfx___drm_dev_dbg+=
0x10/0x10 [  207.318576]  ? add_dr+0x180/0x220 [
> 207.318579]  ? __pfx___drmm_mutex_release+0x10/0x10
> [  207.318582]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.318697]  ? =
xe_pm_init_early+0x33a/0x410 [xe] [  207.318850]
> xe_pci_probe+0x936/0x1250 [xe] [  207.318999]  ? lock_acquire+0x1a4/0x2e0=
 [  207.319003]  ? __pfx_xe_pci_probe+0x10/0x10 [xe] [
> 207.319151]  local_pci_probe+0xe6/0x1a0 [  207.319154]  pci_device_probe+=
0x523/0x840 [  207.319157]  ?
> __pfx_pci_device_probe+0x10/0x10 [  207.319159]  ? sysfs_do_create_link_s=
d.isra.0+0x8c/0x110
> [  207.319162]  ? sysfs_create_link+0x48/0xc0 ...
> "
>=20
> Fixes: c28bfb107dac ("drm/xe/nvm: add on-die non-volatile memory device")
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

QQ unrelated to this particular patch below, so RB

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c             |  2 -
>  drivers/gpu/drm/xe/xe_nvm.c                | 43 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_nvm.h                |  2 -
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
>  4 files changed, 22 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c index 329d17fd6100..e08d95554f2a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1068,8 +1068,6 @@ void xe_device_remove(struct xe_device *xe)  {
>  	xe_display_unregister(xe);
>=20
> -	xe_nvm_fini(xe);
> -
>  	drm_dev_unplug(&xe->drm);
>=20
>  	xe_bo_pci_dev_remove_all(xe);
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c in=
dex 01510061d4d4..1202a7abc46f 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -95,6 +95,27 @@ static bool xe_nvm_writable_override(struct xe_device =
*xe)
>  	return writable_override;
>  }
>=20
> +static void xe_nvm_fini(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	xe->nvm =3D NULL;
> +}
> +
>  int xe_nvm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -153,30 +174,10 @@=
 int xe_nvm_init(struct xe_device *xe)
>  		auxiliary_device_uninit(aux_dev);

Performing uninit here would kfree xe->nvm already, so having the additiona=
l kfree seems wrong? Unless this
uninit doesn't properly call the release dev function until auxiliary_devic=
e_add has finished executing but quick look
doesn't show that to be the case. Am I missing something here?

Thanks,
Brian

>  		goto err;
>  	}
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
>=20
>  err:
>  	kfree(nvm);
>  	xe->nvm =3D NULL;
>  	return ret;
>  }
> -
> -void xe_nvm_fini(struct xe_device *xe)
> -{
> -	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> -
> -	if (!xe->info.has_gsc_nvm)
> -		return;
> -
> -	/* No access to internal NVM from VFs */
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	/* Nvm pointer should not be NULL here */
> -	if (WARN_ON(!nvm))
> -		return;
> -
> -	auxiliary_device_delete(&nvm->aux_dev);
> -	auxiliary_device_uninit(&nvm->aux_dev);
> -	xe->nvm =3D NULL;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h in=
dex 7f3d5f57bed0..fd3467ad35a4 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.h
> +++ b/drivers/gpu/drm/xe/xe_nvm.h
> @@ -10,6 +10,4 @@ struct xe_device;
>=20
>  int xe_nvm_init(struct xe_device *xe);
>=20
> -void xe_nvm_fini(struct xe_device *xe);
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 31456f432fc8..ff406e9a82cb 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -234,13 +234,9 @@ static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);  s=
tatic void xe_survivability_mode_fini(void *arg)  {
>  	struct xe_device *xe =3D arg;
> -	struct xe_survivability *survivability =3D &xe->survivability;
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>  	struct device *dev =3D &pdev->dev;
>=20
> -	if (survivability->fdo_mode)
> -		xe_nvm_fini(xe);
> -
>  	device_remove_file(dev, &dev_attr_survivability_mode);  }
>=20
> --
> 2.50.1

