Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A665C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FDD10E734;
	Wed, 24 Jul 2024 15:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9t296ih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4276210E734
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721835736; x=1753371736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qxyX/7Sf9loAbxZ1/B9sIKYl4qQfoDj5Q356/cyQFd8=;
 b=N9t296ih7LGfe9AwjGmvBJ4snbhacJdfPqe3Yqekl77rwzqvwWc1qbUH
 VjFzUVvER0lzJe4pF34Hf+4rIJAdDqexsFm2jbhUrUXmIQ5f9toybqb3R
 XBEDe8oZuqp5jLwhAkUs/PQKOurkxcFToH6Xvj1Q7KAMQWNQ/35p0OSXZ
 QxIM2gT483/niKYNf0BTS3IskAsaWxAWl+zocUSyunxvlJYJ/ZJnOOEhE
 77wl7D+XQHWBFHvdDfM5ECZQyxtot6UkdYeljvTjBMnORXDpKb2sLMKLE
 HnJPXpUfN0d0dtLeKofSanKmmZc7NGwYwPNH04t/ZJdDUJAKiONcgh78G A==;
X-CSE-ConnectionGUID: 0Q2wykuMTwaxynkMFMOrvA==
X-CSE-MsgGUID: aAyV8sWWTE2W82lxTqhKXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30126444"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30126444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:42:16 -0700
X-CSE-ConnectionGUID: JjDzxfigS2KLDamZcwLspg==
X-CSE-MsgGUID: endvyvLJRNaSiVJU3l8ScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83230876"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 08:42:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:42:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:42:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 08:42:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 08:42:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4PkR2g4JovZcZv6g2HHUfC0HjFyNbP2TqSWESXps7Kl2Sc6YAWL+ByvxI6rP1BgePZPjM82XuLYAG/JJTaDKj/IkfYDLSrFLgOlKW/gAxwU7gyVpZ6B2CBFkGmlojpNohAm2zpHWqXdfCxhdlkv8qA5L+8R1jVrr9RN3U8vgkAv0LK7EwaPZOe6hPXNM6akJJuTEx9H656bt/v+DWdSVbi9nqZKzlmiH0tiYgLb1gyva+ghaSIf5i2qHbAkPRDm0h23Q4BY+89luLEdZfqouWtHI8XBhl3t4TqOUl55KrXZxbJ1pcf6/enuV7ETxdsbD1tMh7qZoeOnrGQeLMIk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztdbYaXtDcbgQ4D6T1XoiBCKkACLKUCmsAvHLndPP1k=;
 b=XKvtfhtBBNMXQA4lNp4vbSy+BfIIQIQRcKY1WpZ8Io3ZPEkNF/WGv+bNNvww4vwUEV/tK8Ua4Xm95h5fi7grLWfkd7bcNCfAmR/OU7TX2f0OfskTxL2luxJ50PI79py/Gb+gp3lR6pP00v2B4es45//0za5aZs/XP0kAkq7zMbjwEni0e+jEBB9xrcnY/Gc0+9VcJlk5WZtlJJg+yFQr7vaO5ujn8mVHDjXvrKOjM5IhrGbNPnzm71ADNuLy5kIY13NzRjaEz5GW/AWeQL6QQwvVKFqrNvjf8r89yP+d5Z1zeG8SnyWDUpvL3LBqAyqRvXuF97GsQlA7sJqN0fD1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 24 Jul
 2024 15:42:12 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 15:42:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: RE: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Thread-Topic: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Thread-Index: AQHa3TUdpQIQuInySEqkSQazFSOogLIGBVXg
Date: Wed, 24 Jul 2024 15:42:11 +0000
Message-ID: <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240723191903.1753729-1-matthew.brost@intel.com>
In-Reply-To: <20240723191903.1753729-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5166:EE_
x-ms-office365-filtering-correlation-id: 0b607808-768f-4514-ae36-08dcabf72f59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BYgdx5lfIPI83JNn0ycpZiCQWMScZ5Rsm0E4kLV/+9Y490DJ0hPNCHpZwh5+?=
 =?us-ascii?Q?ZvH3eSUgRVjV2AEGXTYWE2FTpylMPHzOP5+w/D4LuRHrMew+zaepRRb5yhC+?=
 =?us-ascii?Q?AFtJ9GwCHsEy5DKipMBmOAAyf5FueMWx605oMmEU3SEhebrv2z9TvjJ/CiUi?=
 =?us-ascii?Q?F4iGotj2dl/3mcdCxmPQNj798dnTNtLfoH0dCmZsaWq0frF3ZkXZRz3Tfd/E?=
 =?us-ascii?Q?9SyWQo9H+f5Q7OSwntHNZMZ/Od5s9MbREX5Il0LgixH7PwTRc7tkhh3lHgTV?=
 =?us-ascii?Q?uVqCT7La3b/GQpNNv0L/FWV6MWqP4rZob+KFQa5lRk8uHk3hg62NTR0eDpCX?=
 =?us-ascii?Q?JS/UeVmWawpTSb7rYhWfTynj2mfPunveJg9Pd4+UJoEKkY0yXRkM7lS/gLau?=
 =?us-ascii?Q?IZNMJREpiFIO7s0E24IHVIPJxeenKHj6V3c4TDp1RG+Rsyd0ertczeAGGW0L?=
 =?us-ascii?Q?g34ksMYtDkob+Dd270+xp/QBg98DVsZGxF3lp/m45JLzTKP/q/Qa1ypIzkeg?=
 =?us-ascii?Q?ekozoXtu7hUSEEfmMcyIIlumAYkTkXix0E8Cr9onvUfmttwqCo9D6np3wIN9?=
 =?us-ascii?Q?WcM5Xc6PSCyY8KQo5cWnaEuxn3xtCXxYt8iJh8AmmDkDCzqKMzIPQrB+vKzt?=
 =?us-ascii?Q?5WtYeLh1GKJ3hV09Wdxp/4uzQNe08OrxtKOfH/o3PH4SCzKrzTJ881qxylWw?=
 =?us-ascii?Q?5IhFlNoH0dtkRCJQnAF+vfgqLhuhxgTPv8IT6wdaNi+NhFAX5P1BpcT9DGtH?=
 =?us-ascii?Q?v6pYIK0G9hxyIdoANVW0tO31mM7OAkKZqEdAHe8Z/6NdNgLblXlbrEybY4l1?=
 =?us-ascii?Q?9z3/Y3i25cA3pzEJOqTkkhAVYHFXm0+3xX83W04uWtHf0e8aMZ7MZzOcRhhv?=
 =?us-ascii?Q?kBlC+aj4sL1VhvddRJyamP8cb5x1xwicRhaOkNhjbUD3H8hP8JfJOd3tkZOJ?=
 =?us-ascii?Q?Vv1quQXeQn9FgZnAf/FRvmGUEhWPFDZ0KJVst94AcMoa6LT6pNUjo7iRehsy?=
 =?us-ascii?Q?Tv4FvB/KxZ3c3h3hynHBeHCu7Yg4fOg41gXpd2RbI27d+2A9u+1yI8XjPzf8?=
 =?us-ascii?Q?4V/sdHr7Q2veMU0NM8CZ0P5TwEOdN7ib7H1aknbwrC7Sh1VpXZve0G/bk6sK?=
 =?us-ascii?Q?SweVacbJ7+2cjlk1uyYMXCyMt7qcb2IPWtAkGXB7ze42JXZ84wQVbDeJYRGH?=
 =?us-ascii?Q?hcJjVkPQbH9pZ2UaFamEf94M91E7up0TRmIfZ4B9nLJGBmFvxCE6Go5zzW+p?=
 =?us-ascii?Q?GBmVn7L4OjrX7+fTmMeX73udNzwZipS20ZrB701rNm3j1EnMukek3dM0arRb?=
 =?us-ascii?Q?99Knl/CXCqYbCTiJ5HXWk4FHcZGXJ2fMzn37PrdKi+EYsKpoeraF0JWN/BZW?=
 =?us-ascii?Q?CLY+RDc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/eeb9fj9xVmw/QRGLLfqfB1+KLwQEtEogcXll5qsfFnslindX8kRErT+B5BM?=
 =?us-ascii?Q?XLZbOaBugxdsPUKmx77ZEqJddl+zTV3XFKH/Ojd9zEiWXX+WQV/TbiwdaFKu?=
 =?us-ascii?Q?6an0oOSzjbYyq+eX7vzuFByok1dgh6rID08UdWKwlvMuE2fhnLzRnTkkb0zg?=
 =?us-ascii?Q?3BjLpIEvJnmyUek5MhjryuuWdbISUsZomaJvCcRDEaP1S4Uqp2YepJRJVYwV?=
 =?us-ascii?Q?03cS+brn7LKODmMIZ+pyzjAexkwjVHFV6Iyivf6EVHl2n/hjIlazkA2nES3R?=
 =?us-ascii?Q?23JY0+/NSNFYPbqBQ7kA7EK65vh6rkVj0BbCtwM8+QLcEyzVDg8EjDtNfcdH?=
 =?us-ascii?Q?oSYC6r3KViDrcpiPcU46yElpHfWcYR93lIskZc8F/rs1MbVgnUH8/sfLeIOx?=
 =?us-ascii?Q?E4KSfUj1NgUrYFCRfl4yUsUAvE4ScB13gWM8Z6oXZLOLfQc/1C4mdWuF7qGW?=
 =?us-ascii?Q?Rupr2jdbE8hamTaPTT2e7sxnsM+jbi1IRQPaEyilYCRoMp1O0Mk2WTSW4U6z?=
 =?us-ascii?Q?FKSN6ZsaLz+Sw0Zw8uV9MXgKbOPs4IvBKCRgNzNUirSGWfmY8L2lgMb10CWw?=
 =?us-ascii?Q?PqgnBWw8OXvcIAqTkLzgBbESHhQlnmF7vSKUwQygbS7z/zzBE/WSlyiycdId?=
 =?us-ascii?Q?DWMoj3RdpXutnuC+1rzUkv+DsbrB0CUoYWoPGcTRcX91qFlslS3WvFHKuz1g?=
 =?us-ascii?Q?g0KhECiYKVAqDq8XfQozI9g+2ijQxC+qiuaOQbl/SY0ILRXCb0dIUaxoD0ku?=
 =?us-ascii?Q?cJGhgxSb4rdAL+hvzO8WvHFrbR23mXwdHyzxFgFxMnT8GLF1NzI0YY/tUPLO?=
 =?us-ascii?Q?GHWhJx9WNCV3jCwhTLkCXhEw/Gx9F4Zznnvs1ic1SNiEr+x63V+DJQ0StgGw?=
 =?us-ascii?Q?vLDWTxaPgm5msJn+xypmKVvQELN6/URDaX0c3rvdeR+8NTaA49ovZ3a/adrl?=
 =?us-ascii?Q?J1EGoJ0KoUSjeF98SfeBeYBhLxSDJDZTtGI4aWCYRm98lhOMJF82RKoUqb+m?=
 =?us-ascii?Q?qeAIznjBKn/K0I4TpPZpLNlZdaLZQZgF65bTk5qbsss2jaHT6jZ6ku+zMlbC?=
 =?us-ascii?Q?hkiwFzNUwnQ/tcc5MZZWXyIZ2hBemc0BolIxQBPPu+VL+dJW1c9ERFPPcyY0?=
 =?us-ascii?Q?FK6keutAvyf8a8d/UTf7+eneSDkMvQpCSsFkcS+Z9mO6TPOjglfB1DxOv4tM?=
 =?us-ascii?Q?hXt3aiI/pxhqPqnwq/X0bX/MzJZWZMwgPWsdBwHz1CEvo6e+kFHjg8YIrwaJ?=
 =?us-ascii?Q?1sNCKvp2rHY1ul/SG+0gzKUlOS++Uf6DM+wRuUVa5sqawc0KkyKEelNBpHNp?=
 =?us-ascii?Q?BIZAQ/BNtKcZ9qagOyI1Ieduh6ZDZi7vv/yJKrX68L+F9pvmOFyumnzNRS7I?=
 =?us-ascii?Q?bP6B0Sov5u63pRTp8kEVurasZ6+B5PLse0/3sJ4bPSP+fyEKsMBwHKp6Ge/V?=
 =?us-ascii?Q?K6tS89phUPWtUIoMM2aAPeQPkyPnTKGc1oLdDA1dgl1LVJHwTkS1eJnxw9B/?=
 =?us-ascii?Q?fv9H5EAOAL7W3Z7tOWzma58m+t2n7zfWdSXsRM87lMuI6EehyMY7Z90wuOiY?=
 =?us-ascii?Q?gUd9VK1j3/x6aNfAHdm0UpKK741nVi6FsG2+xxYa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b607808-768f-4514-ae36-08dcabf72f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 15:42:11.8819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +sMiT2mKIkuRS5T5GRNOrhyx2RztjGc6JXsMU+JrmftyNzyTuRAQhu1p4uiBUzFCnwv43AkDBbtqPWy/Citdb2JhrWp++FxBDJj0NELt5FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, July 24, 2024 12:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: dan.carpenter@linaro.org
> Subject: [PATCH v2] drm/xe: Fix possible UAF in
> guc_exec_queue_process_msg
>=20
> Store xe_device ahead of processing message as message can be free'd in
> some cases.
>=20
> v2:
>  - Including missing local changes
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
> Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index da2ead86b9ae..b8f938539a90 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1395,6 +1395,8 @@ static void
> __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>=20
>  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
> +	struct xe_device *xe =3D
> +guc_to_xe(exec_queue_to_guc(msg->private_data));

If msg freed at this point, don't you need to protect against NULL, just in=
 case?

Thanks,
Tejas
> +
>  	trace_xe_sched_msg_recv(msg);
>=20
>  	switch (msg->opcode) {
> @@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct
> xe_sched_msg *msg)
>  		XE_WARN_ON("Unknown message type");
>  	}
>=20
> -	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg-
> >private_data)));
> +	xe_pm_runtime_put(xe);
>  }
>=20
>  static const struct drm_sched_backend_ops drm_sched_ops =3D {
> --
> 2.34.1

