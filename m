Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94561CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 10:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5979310E3EC;
	Mon, 29 Sep 2025 10:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7hidSPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0427110E22C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759142458; x=1790678458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qKjLQOnm/fMtmMV8kB07yaxP+/CF2h4c+9/2Z08GSz4=;
 b=I7hidSPkeRF9i+JvSiUZ9ZeX8ahPl+CViQXhKX8NC3pseiY9KTMOPixv
 uuRu/lK+gjSokCzEOgKTKonRvCb5hKvnnp3bUEKflm+3+2CY6cp7NJCys
 ZsmRGqIf6sBReG7PX4R79tGUsDMD/N95qnBjJW0KNBbyElmthm56sfvFT
 brdEcXZsoXKFH4CGbDTYMYDSLHAhaLKQ6f/rqEaC2Mq/oxeynHUnRUx2j
 YWrhstbA/1jutK5xEdjhKsNIRWXK/nbYKgDcmAgzua8M/FG56tYoGv2Ff
 bGeVM/jXD0dUB1RUJRbCxrSyPWbHEyvtYC74oZJ4oIKak8vz+7rGM0pwX g==;
X-CSE-ConnectionGUID: H2/21hzhQnGadMQQopyAPA==
X-CSE-MsgGUID: EFEPNbNzTcyaspEQtU15/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61428476"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61428476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:40:58 -0700
X-CSE-ConnectionGUID: Nta7NSEuTMiM8jESB1esMQ==
X-CSE-MsgGUID: uawAxa96SYmoxVba3NF7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178023780"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:40:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:40:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:40:56 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfDtvSeWgZYUyHRipVDBAT8yVj7NYXUROiruGjKoqAEQw+AAzFCE6CXbvuf6UAyrP/2x/5aRQLE1Fysx5B3Ul+EPjT2z6BGZRRgYbv/iaNQ7TgsXwX1N0s9KuXj6edMqAVEKubbwIaK9s2fFqxe4psBgY91c1MdO4orhluMWoNoFo7ofYr+cIkotzTbAxgQQaQ4TJJqckpN/A/sXvxvAC753MET5UKZVZ8I6/rhUIyyquZdmR5FbW3UOhuaIo7V1HFdeu4RiwnLT5Wm0LUMQ4kWd8tvCk5tYumohiPUZylbO+VtL7DQq44vJ4l0LHkENd7gVH5jwSxA7ZEHjAnspbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0+bntSjrvJFtdBFhkY217n/ev+xXa7O8ry+rSyvfQk=;
 b=KtBQZAT4goQUEtST2LpzU/i7TWhQ8ECTr1b3uRP0jPELrj2wKP+z/Oeb7hPNykwF5jpYe/zy2iwc/5YkYeW8JxZ6Qc4pPZi0nJMq6upoSa22tLmiXGWaMHTXC/t0VB442wvvVO0TUWWIJx5ZnaY1EB2nIzFK4D+GZlYhbqivFuLnx/oF6K8PAitHHmHU2oZrO22YzkuVPu5LYaSClY4sPeuRYpLN3Fkzthqhyqfeno40MmQB2vb3mR9uLa6g1F98QwOPUelfHd++ZlnsaU2N3W2sIUq5TbHN/hA9M8GJu9h14ps7yXmK/Wz9vX/7oIt6SFmJcI+/G6YU3qpsuspl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:40:50 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 10:40:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Thread-Topic: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Thread-Index: AQHcLv6kkIO5A6VD0UG/DPYWF3sX1rSp/MhQ
Date: Mon, 29 Sep 2025 10:40:50 +0000
Message-ID: <SJ1PR11MB62048BB29D6FD62F75921492811BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-9-jonathan.cavitt@intel.com>
In-Reply-To: <20250926155948.145934-9-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB5108:EE_
x-ms-office365-filtering-correlation-id: 52afa3d7-71b0-4482-03e0-08ddff44a858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FlxEVm0Mems30lWm0QrccwOriDJOSAbsX/kz7u/0us+O4UgjORI7ZJy/+Wih?=
 =?us-ascii?Q?RBUvpTjByRbnxY8Z3a0pVgUVwrQpE6KHqZKtkICakzGQ/maoWUeJXhGq8jks?=
 =?us-ascii?Q?6vi8VspWauMq/QWTTpCuy1QeqR6rZHkRAJzJQr9KEUMthlyM+V/3LGCNS3JM?=
 =?us-ascii?Q?MSKFCqyrYRB2qCojZHXlcCWsXoZ3SedRisQr1YJbCXnekg9q+YM1qapSfz8l?=
 =?us-ascii?Q?PJ28AwmmDtqmmcjmXFKBctkH5rjWqBqw6udphfw45FvQQ0+AElOaJq00Rb/p?=
 =?us-ascii?Q?bRY3OWt/KI+6lhDNSMmnaBNlFxJ8ILyYzY3a5x6Rwsxh3TOgtQu09TxzpaQ1?=
 =?us-ascii?Q?nqWFIT0XCFrAW4qq2nzUTsSvnYzZ3em/o/ArS4iwtMICOt0BIiXgGToqnUEZ?=
 =?us-ascii?Q?f8mbVzEvNpp7hxSoCjaYuvFDMGh2UeE5Vx0+CwmyHPXMMhu8XR8vAQSUDyfD?=
 =?us-ascii?Q?zacL/NemdIRTEkjNsKk1/zbjIaXNH9iWtjOqPJq4bVdAu88gkvgAFpp5Jt+D?=
 =?us-ascii?Q?pRnmWe/f84NhLIqI2mIxUT0mi5n89nAzDmIiKdcykjEz5NoOJiM9YuMtAS3m?=
 =?us-ascii?Q?I1B2glnbNyh5baVDvf42OcrYSu8ouvxJVuXIf+PDIWThSL3t49mmxcOXaP3H?=
 =?us-ascii?Q?l+0KZjnHvUEAcIszTwaADFiIvlFj7k3diMXJctAp9kzEgKTx4cn4+iLzf7Qe?=
 =?us-ascii?Q?2N0Qf8gGIRZgenpsLgYufcQ+a4sRvl4sJCn4C/4ObZrsEeEP9xKNTmNmz1kH?=
 =?us-ascii?Q?l46UiJEZfcn3SgCyo73YGCIv0F8SpHV5+pgW5uzgJD0+eJgD4W8bGXMNL9CU?=
 =?us-ascii?Q?gvWFM3ooQLLMhbwRqGrmrac1OjUaXSGHl5EpBFZYrJl3bJfpadSmb1DMjeoc?=
 =?us-ascii?Q?3ny0Ho9DBhDZ0ifPkY1zahCw0J+dVes8teNTlkX72eq5BkedY0299CGa4Clb?=
 =?us-ascii?Q?2wOfwa2zx8fG7YvAHklQQ1fBa6p6BW30M182YXjkbsTm0hnp96xpNo304MeZ?=
 =?us-ascii?Q?GQ4J5xGDFR9X+xxuGXLAxRHFvKOqyQ4ku58oclJ6PQkGvATBWMCKmaUXpJCY?=
 =?us-ascii?Q?3a7UcPUpnTCcexjL5d/Og7G25F0i/0wTBlkPGIZtzt/r401fomaghSgYUQsj?=
 =?us-ascii?Q?MOFDQp7b/m5I6FIJf7noU3YGj5hSKq7wdd7E6jrL3QgrcQLbfnzwaBwk1bXj?=
 =?us-ascii?Q?bOxcRyy6TaC/put+iTIFeUbr6IukiGq02JSFWpfN88Yh4gcAMOkWbKysojVt?=
 =?us-ascii?Q?w55Y5f0dLRxLhUDHqdr/0PR7wNDAw5kagqJWdSp/8Vr+qqPDkqi89Jlh6jjA?=
 =?us-ascii?Q?/RnCmbad9jErz7+97d0vykCaPtCB0B099V8TgATSUPiNYPhns/9VVNkTgXAm?=
 =?us-ascii?Q?rehnHHPJAfwK1C6oIWlhdn12WGW0VzYvSQhGseqmrUDWgePvBIhS0T++ffc4?=
 =?us-ascii?Q?BL3nl5wurYr/J5MbomAU29R71mH27hGEcOcfQYwkNw+286HpP6DYCWr2dL4Z?=
 =?us-ascii?Q?1vQmqYVdSvkrw0gcHfAHjnqJP5XmDxXmwI3l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQPlMomOR4WxCpKTFyo0Q2oARbNmloL40JNn0ORBVALMcJA/1njUKMCB6xl6?=
 =?us-ascii?Q?6TfYyHGahcgMFoNbwVz/RoVkuKBbYgBLsuXO3LUJYF8fSpvl9HP6/2OpE/KM?=
 =?us-ascii?Q?UfoDMD2V0Is6Pyeap3x2tamJCNKxXbVk9HhXtZa5eXDtBuVdY/ppkwIZENlk?=
 =?us-ascii?Q?hEl9Ux22SSss6RSoSZd8quaMWuZOZGS3hKebUeBcb54JLvj8TQcIp/sOBuqK?=
 =?us-ascii?Q?OPXdBkpuSD18CExYpG2NLDgHwSz0gRNo2HdDM+5hGysoR7+nEflZCSMgOs9n?=
 =?us-ascii?Q?fEcamijSPMgYK2Oza+TkF445LK8c0SJ+sRgV8vM2ppyMMII1B9o6A7kWzyqc?=
 =?us-ascii?Q?2FMRvtj+a//X1lXYzilFlH5KnMFnYDn99HJe1BxGJcD/CLO0hBav3VTY0UDi?=
 =?us-ascii?Q?mxjzj7L+UcPC/nesTk6jC4OXJwJo6ed6l6ejZfk6dQ35Egkfy6TZcJTPoXWL?=
 =?us-ascii?Q?J9ni7uJBCZyFo0MeOiWtgwOj95GyiZ0YlFof2uxqdS56ebAykJT8EdRub9c5?=
 =?us-ascii?Q?S1s5zPHNk/vWYfvumtpfiCD+wFGAK92p+eKwgdnPKyql7ea/wAPqqeceVvfX?=
 =?us-ascii?Q?sVlsVlfI29Cwcqi/fxaDOyFO3B3UwiMSSrVpGEkeRuTl2HoCsgj+e6nAgWBR?=
 =?us-ascii?Q?14h9Mry12mr00C2dcRdWX4JW/fkioEJkek8jtivJNSQrLYkNznDZoseMy+Sq?=
 =?us-ascii?Q?dqUZ2RpMVsYRpzvkIi9HqX+eL7W7uvN342UrEy23z4KIMlS8uIRET4CKy7le?=
 =?us-ascii?Q?paw0EgttgXZMJnu9lzw0rq5ogOKzhnoQsra+XragVQ29LNCeMnK/xN2k/5hd?=
 =?us-ascii?Q?PyBecOvxg+bNNBOHqh2xuD3BSt8PH8W5E/I/LyonQ8+83p8aOBNmNfuS5VIu?=
 =?us-ascii?Q?MNMVsCqhd987w9hvgPAup7XRqAolOhdDiU0JNmoK+ZFQyinyJ9bQwRV+txpo?=
 =?us-ascii?Q?u6/Ldf0jwya8pSrVjlCM+qRGz4vWz8bp+1VTFFX+XwyW3A3UE8+Fu+/s9oGi?=
 =?us-ascii?Q?qJzMi+CCaVItgHIk19yVgIOuMKIPjI03ZHQ6oi5uiWxJUsHDdlduW56YO6HW?=
 =?us-ascii?Q?Tcr3lqCpRFtcYOF58cCi3Im+lfua34LIm42KokvEdujW3osYbqqHntxD5eyQ?=
 =?us-ascii?Q?TgBjBwLvu2uuRPTfwQm/tpYLB8IFLBU9CpM3WME4Cg33T4uewjtLS7OcUUUw?=
 =?us-ascii?Q?b+1c3PXazBsYqBm0wRszPfYJsMjpz8kU3Cc50AZslFHuH6XqlSv2KbqbsIrX?=
 =?us-ascii?Q?FStldqjhAPTMCYtctlswZhfMmfTeFJndu1WCNUKClwcTMS7Gm2ilkiov2bvK?=
 =?us-ascii?Q?banfug4RFad7mFqJ1/N7GxARwaTVyz+3v185vnvwZnYpOFmuxZHuD096KMIF?=
 =?us-ascii?Q?9Z0LxIsbALkQUX1TR6JEC1XGq0cCkwzbtAMswvfUu6K73hMnt/CDsuSzGcGj?=
 =?us-ascii?Q?720T5aeNcf7TXuobbq5NMrWV3of1TMi1iu5gGThbU6NuaLCn+TUH5e0cJg9o?=
 =?us-ascii?Q?rKIZQ6jrHEN6lZLIPOwb+pAYIzwSqjHJrkt9gM9z6TvXF32oOzISY8wMCshQ?=
 =?us-ascii?Q?6z5sveyyPT1f1yaJIj+TgBH/sDw6GvaDOLYZZ0du?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52afa3d7-71b0-4482-03e0-08ddff44a858
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 10:40:50.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IT0Z/s2VujHz095AHC27zP4OYi8SnBjkAUAVyas3kEvhEr196p/TSGfcfokhEAOSYTa1QDySnmm+jId9bzFHBEp3m5deARBLm3snNUxMBSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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
> Jonathan Cavitt
> Sent: 26 September 2025 21:30
> To: intel-xe@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
>=20
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but =
several
> use cases don't check the return value before performing a dereference,
> resulting in a NULL pointer dereference.
>=20
> Add guards against this in xe_pmu.c:
> - Use xe_root_mmio_gt instead of xe_device_get_gt for the tile 0 case.
> - Check the return value of xe_device_get_gt when this is not possible.
> - Return early from xe_pmu_event_destroy if GT is NULL.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index cab51d826345..531022d80731 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event
> *event)
>=20
>  	gt =3D xe_device_get_gt(xe, config_to_gt_id(config));
>=20
> +	if (!gt)
> +		return false;
> +
>  	fw_ref =3D kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>  	if (!fw_ref)
>  		return false;
> @@ -219,6 +222,10 @@ static void xe_pmu_event_destroy(struct
> perf_event *event)
>=20
>  	if (fw_ref) {
>  		gt =3D xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +
> +		if (!gt)
> +			return;
> +

I think we need to reverse state of device even in case of gt is null!

Tejas
>  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>  		kfree(fw_ref);
>  		event->pmu_private =3D NULL;
> @@ -497,7 +504,7 @@ static const struct attribute_group
> *pmu_events_attr_update[] =3D {  static void set_supported_events(struct
> xe_pmu *pmu)  {
>  	struct xe_device *xe =3D container_of(pmu, typeof(*xe), pmu);
> -	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> +	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>=20
>  	if (!xe->info.skip_guc_pc) {
>  		pmu->supported_events |=3D
> BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> --
> 2.43.0

