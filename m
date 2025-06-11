Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2954C61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 05:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93210E301;
	Wed, 11 Jun 2025 05:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6Kf8UI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDFD10E301
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 05:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749618285; x=1781154285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YVDMIPDYkmcGP2PIc2p8GGVYObdVIwdLkHWa/IKnIjU=;
 b=W6Kf8UI5NehhunrLrtkEaqwGC+OdpugsAQTJW4OsHoyuD73fRTzoY4/d
 BeBG1RPftb0XSvsWwr8lteDa9pcGC9OY5fMSu9GyYk+6iUMCYNK/vWMu5
 oKv3gFUTBK9vODms3tYpnw+bRercYjB+FP5ifaCYJ68QQxb/jK3o3BdeH
 WkuhW4Ym4Bn+VFdckCL+cyXurhChIdl4JIYufw88iT0ezf0Qz+b8VfTNN
 Kh9HzGN5ZX6eaSyy8VI/8aCPd+ExyvWBaLChogv7xQuaUKMGHvm3ZG3+M
 M/g+saPtXdVDA7W/20y0rlvPuZHtdIPrE1ZlCbnAnYn6WTl0B93v1nwQP Q==;
X-CSE-ConnectionGUID: f6wKFCLvRKyFSWtapE4yKg==
X-CSE-MsgGUID: ELphV+2CRfqpAakHbZ3tDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62030101"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62030101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 22:04:45 -0700
X-CSE-ConnectionGUID: EgwMtj8PRq6RiEvMqQ/isA==
X-CSE-MsgGUID: i/SMUsOuSamE+imvk2Khjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="146918483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 22:04:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 22:04:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 22:04:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 22:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpEk/tP9tuixn48dpmzF9JgbuqwgAwCBEtfuqKFNWFV91ufTm6N/8hc3IxBUCLzx6hhyg+Iu4Iq8Gy/5EtIyVZXuGTlghr7+d6P3/tAxrA+PWWjjzExksse2zdZBVVSQ549qjae6nNcSxjcQFl86FulC+vZznsg0otIseqiXGcU8iffdcBGsqALkOrUPrKolTnQPEued+btyUB11ob0CMEILGTkHUNWOHWQLFaChEGGBFm7NY42c3qIlZbc97CIrjSCkZaiMLy6R2gYesQxFOb+DEwKZAQTWBkX/2yMkJqAitBezOwg35koR+it7qFNNDdXxeWqYg0ocX7f+namFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2EnEtDSZdMVE5zsNCnFwrJxt4jjPdoMTIiwILsI8Lw=;
 b=GveXoLDW8izFjXDU+jLDOB9UArp/3W1y52q3UbM/8azzUx6N019H158qWWM3B2yZL9lQggH5pYYdknTMcJIgMiTHmmkfVjjr/edNihkc89LgPhQOIWhZlM+Zsa9D/Da0VBrv3xglQITJ5GekvXeEA7a4xgeOHtlFBXUVX4oYszKer3meBAkXmUQKNV3zmUsgx74uFZ8TOIWdQ+ejpzUs/55kpdmpR6rwmRRabjv7ZkUrtO/q3J/ed7ZM/NFj1lQkNYQn6Dn+QlXjEhIWQYQGWRhk/zxLZxZJllzIUL0j+Hp+nsDF+1HmLKRabZwtzdMyh9f3AlqEa3sZlNHYss6jMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 05:03:59 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 05:03:59 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] Revert "drm/xe/display: use xe->display to decide whether
 to do anything"
Thread-Topic: [PATCH] Revert "drm/xe/display: use xe->display to decide
 whether to do anything"
Thread-Index: AQHb1d0MQwur++EfE0mK9AMvMZ95G7P0MtKAgAfbtoCAATxvEA==
Date: Wed, 11 Jun 2025 05:03:59 +0000
Message-ID: <IA0PR11MB718568265F56A8EC2FC009B1F875A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250605054247.386633-1-vivek.kasireddy@intel.com>
 <fc535785263b34ee08802dba3a451fb99469ca58@intel.com>
 <27e47fe60426f4ae41e405cc9eb9ac059ddfb79f@intel.com>
In-Reply-To: <27e47fe60426f4ae41e405cc9eb9ac059ddfb79f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB6714:EE_
x-ms-office365-filtering-correlation-id: 54aa37c1-fc64-4b98-6e4c-08dda8a56050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?j6lQtR5bk0+ya43kzdpiWhZpB9fwr4lVwtO0Pxis2TiztZy6pOJXoX2YzvtM?=
 =?us-ascii?Q?3ybsx3uf9xmmqm8gZ34EjRUMmZ4+GxkSXMrpHNc49kkGcpHujsHgXkGOWg6C?=
 =?us-ascii?Q?oxOmTwZtup9UibrncsSvxKrFA6CoAWmKlZvH48MkI6EsCI3O5zsTxx3xRhvV?=
 =?us-ascii?Q?TzBd45aRcBmqYWWL4OeC94Em/JBdvVwPE/vxvlv+J+WAtehcG89TH5gWAr6i?=
 =?us-ascii?Q?KSQuTecxM/9tSHCbNRnVCpq2dJYgTByMiiUWqWop5NghnLPCynXjZB/2VdzL?=
 =?us-ascii?Q?/VK9qOgqpQqiJSVUMJ0Nbil4Oz6wgB2uXtCS353M2qvgJa5f5YTxLbZnTC9k?=
 =?us-ascii?Q?n5Kkk8Wtr7MTnm5W7s5YSxhRDRg5NwOZD2BtYF2C2r9VWtPVIyzyjT2EgKTU?=
 =?us-ascii?Q?OzZ3+Lh4QrPEuLiFe2xjF0baqfKNkxCf6PfEL4rFJcSOglxdENY29MaeZPni?=
 =?us-ascii?Q?jVH5BxQGMJBOxnX8xJqBS4myfZZ6zuHnLpmE7N3Eu/yldSXC0LMUv4VLOF3w?=
 =?us-ascii?Q?KT0TQSq011RLIMYjLiVFiKORhakocxLn8xzGI4gG3pzKjz0lDbDgRmjeQiRE?=
 =?us-ascii?Q?LZknzI1DpjzKxk23cJ+qzNsuLZi08GT1tqRtOqgUQlH7VbEJxfCPL5y9wMD5?=
 =?us-ascii?Q?AxYhxmn6L7loUMVNljZgChlv+zXf39TijnLE6SsIugNB8+yjjVGViV2GvDJ8?=
 =?us-ascii?Q?6qJjKI7sOGE84qskVYR0W25i3cC0NaKyxBiRId6WUfP9PyeEmHTPZorZ8pVy?=
 =?us-ascii?Q?6dOzwkeyyfl0Czd5nX+5bZ9PxBZCvLZ0dyIYL/s2InYk4Wb3MIxWhdqsEE4X?=
 =?us-ascii?Q?9E4NX20sn2y/gAiNU7cEy6qkSdIDUM76RYaLr4VJOyOgXB2d/yIqAEG3Ybcd?=
 =?us-ascii?Q?1UkIU9ZXfQO5yyRESHseGePc7C8yImHqomgmHGzO5uPCfZKKWFr60xHY1ioX?=
 =?us-ascii?Q?dRmcKBqx6BU4uoZLOBNdWSI6BXYdohtGxSzT+JqxdFPoS83HXdD0kkwdqYAI?=
 =?us-ascii?Q?nJYzZm+E9jpaG3n9i0RPHklO8PWd4SsNloXQ73HV7EKWFr/TxUC4GhC0ThI7?=
 =?us-ascii?Q?E9y0AVWs6u/R6UsT39zKg0pU+7aCaLuPrZ+ykbKn064eV0qc7NUse78qd0ta?=
 =?us-ascii?Q?sR8DtjBWS0nOvqaux1KTYafzeFL7FfcugRBEt7S52I0Y/1KFfoiFi4TWeOcF?=
 =?us-ascii?Q?Bsai5eOql09VLjGn8X6t1Ua2x+Z6NvEHCxOg3GP2MECidB/6pWB2KqB3B6UD?=
 =?us-ascii?Q?Tbhpd/h7XGcPetM6uVZjjVMfMWYPKRJynJncQGSFBiP7HIwQsYEJklnvRXjt?=
 =?us-ascii?Q?4fSoX56Poe0KL3qwOUH3tGDrY2uTgqIkjZLv1HW2H1gLBtkb7O8cmKRiNPmB?=
 =?us-ascii?Q?IPNDsxZoxStZsDvyD1v7al3mwETaE6kvjsex5WxHUcPWdCi3Evu4qJPpeDDy?=
 =?us-ascii?Q?mUzOWj6jzF9pCmVE4+a8hyV7s0WJTLntFlljNjsOlypZdU1+NuwMtg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gm8RBskSUyQB8BsfIaSp6soZWozRL72uJZqdLj7KU1cRd03V9m576/KD4bq6?=
 =?us-ascii?Q?biAGQk9ZjeeZE9+2QHXWnU3Ny5SnZQ8kTB9G+WkPCvoEPoFgVdt2B1nzdExe?=
 =?us-ascii?Q?ie+Xkt3FSEBfSCltvPPXRJl1q5CkFV4wqkzr4SBkBLHXvuUwo09b8I2AJC1r?=
 =?us-ascii?Q?KnAY0xW60d0WGA5AIRSXKnN+/UmfzX54+G/jc+C8XKRltGA7wiTa6Nm4vE/a?=
 =?us-ascii?Q?AO1OSkQvJZJdHgjulsYx9K3XjmXkhvF//PgqKj52RuHwMVwe+UAAAvpMrGpF?=
 =?us-ascii?Q?66bduR1KBoA+L+nLV4urzVmalxujCHsEG1pnnq4HiztQES7GjEtXQCUxyHj2?=
 =?us-ascii?Q?DGkRaTDmWzEznsXoHXV1foguPCGj2P5sf6eBJb6tZGV1hYZW1HBrWV+W/7vS?=
 =?us-ascii?Q?Ze3ncJUOsUe/QkrdH5vSqa1khlrwnwNFZgd2kWrrC9pOCrTNbmd/j+OmeGPh?=
 =?us-ascii?Q?/6hPO4icnudHyIUOitCRTY+tYGO7sNfyKwgMvnGxLxsfSA5JGd2xDJGCEz7y?=
 =?us-ascii?Q?MQHEM6z9CHx2g20hDeMQyKC7d+jd8A8m/mjXJzacWTs64Cd2MiosFzhBjXtl?=
 =?us-ascii?Q?rkaFPKy6cPkQ5+rhPUkNakeYwbGakAB76SFovpR+Aa+/0ahqlHxbLUypWkl3?=
 =?us-ascii?Q?BGYUuCLM+IOH7Thjjw0KyrylFQkbYBZjyEEoO9UK5Cgs1l6kqxAlb2x7zKgy?=
 =?us-ascii?Q?nxii0KcHdYeZdE3kvY6PrASBuA+iZy9i7yjQy4vGe2E+nEnE7NBLW/3Xckce?=
 =?us-ascii?Q?U1V892/zjOgt7NACWowWPKqmLjPan1hx4btUglpjC15hBYUnhTQaE2tBkM7c?=
 =?us-ascii?Q?uI1d07arIZYu2Qw7+nHfVFxgMTPabyY3SoQHseuZ3FwPT4kVvlTTxrvmbrk4?=
 =?us-ascii?Q?kMvxT23k707MEIZk9IfMYQb3L6nuV/hSl7kZSpQe7+UjQSFeE1AmPJQHIwcM?=
 =?us-ascii?Q?t9icDjVx6zZxS5IpiyM/Nwo999Kh7HPchKtDLQi+NqKmiJ2S4hpk71bTU2gL?=
 =?us-ascii?Q?cSqMtF8RLH6cq/Qr5DoAquqrJ+JOC3YvlYSvhsF3pKHSbsZxr7wPoFsvm5mA?=
 =?us-ascii?Q?dICPevPyuowOndfQIK07z6Xlz/hW9uneuF+KEQqRH64hujBYY+Rw/coJN6jw?=
 =?us-ascii?Q?SwjpF8i8izXgpqB0pDZm9qYsFkYxV6DDUMi2AM/S/ZAS8MaLHqlh/SZwOnYf?=
 =?us-ascii?Q?HvZWrBodR9w4Cbfza2B9RGSEitsj8Lhnw2JiIiclhC3zgP0tGCPLI54HChYu?=
 =?us-ascii?Q?NFopLuZf4JLuVkiigF+AegQun0sLI6rr6E0KZmEG4zImmRiYdPYzVs1AxVNK?=
 =?us-ascii?Q?4d06DUaZnUkjym4Yqw5M+ew+c0VT4MR6e8kzq7FHIk9z3iCeS1XY60inudlJ?=
 =?us-ascii?Q?KweRcpeUv5kAB2fyZcSqf0Vx3949/OQZiPSowbSIq4NWFnQv+y77XxH66oVV?=
 =?us-ascii?Q?dtjhbZCytSwve8hzxNnxzV3ShJYaPACu079osPV4+U+DryORlDcXa4eulSa9?=
 =?us-ascii?Q?sXCcFztGVVOtbM71oQm1W2ZGlVUSAdTCdWfocHMj5fNh8gW+/oonLf44LXgE?=
 =?us-ascii?Q?MtL1u9Uru/4Fj6dg6nHHvTSwlJK9Xz39ZEfaFoZ1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54aa37c1-fc64-4b98-6e4c-08dda8a56050
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 05:03:59.5207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrVaEM6C28VLofKHeCP+qDMTqmXf2YHwIVX1UnBFiXy7txgjm8ktc3KqqU757WV411126AJ9qUfKOahKayHh8ZemckIkOyY9V4XPl3AByk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

Hi Jani,

> Subject: Re: [PATCH] Revert "drm/xe/display: use xe->display to decide
> whether to do anything"
>=20
> On Thu, 05 Jun 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Wed, 04 Jun 2025, Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
> >> This reverts commit 5a9f299f956ef9764f56044cfca7aafa23cea1d1.
> >>
> >> The following crash/regression was seen with the reverted commit
> >> on a specific BMG SKU with no display capabilities:
> >>
> >> [  115.582833] BUG: kernel NULL pointer dereference, address:
> 00000000000005d0
> >> [  115.589775] #PF: supervisor write access in kernel mode
> >> [  115.594976] #PF: error_code(0x0002) - not-present page
> >> [  115.600088] PGD 0 P4D 0
> >> [  115.602617] Oops: Oops: 0002 [#1] SMP
> >> [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G
> 	U      E       6.15.0-local+ #62 PREEMPT(voluntary)
> >> [  115.617332] Tainted: [U]=3DUSER, [E]=3DUNSIGNED_MODULE
> >> [  115.622100] Hardware name: Intel Corporation Meteor Lake Client
> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS
> MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
> >> [  115.635314] Workqueue: pm pm_runtime_work
> >> [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
> >> [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
> >> [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX:
> 0000000000000002
> >> [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI:
> 00000000000005d0
> >> [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09:
> ffff8beb0c1b06c0
> >> [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: ffffff=
fffffffff0
> >> [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15:
> 00000000000005d0
> >> [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000)
> knlGS:0000000000000000
> >> [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4:
> 0000000000f72ef0
> >> [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> >> [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
> 0000000000000400
> >> [  115.738113] PKRU: 55555554
> >> [  115.740816] Call Trace:
> >> [  115.743258]  <TASK>
> >> [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
> >> [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
> >> [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
> >> [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
> >> [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
> >> [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> [  115.774797]  __rpm_callback+0x48/0x1e0
> >> [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> [  115.782614]  rpm_callback+0x66/0x70
> >> [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> [  115.790173]  rpm_suspend+0xe1/0x5e0
> >> [  115.793647]  ? psi_task_switch+0xb8/0x200
> >> [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
> >> [  115.802502]  pm_runtime_work+0xa6/0xc0
> >> [  115.806238]  process_one_work+0x186/0x350
> >> [  115.810234]  worker_thread+0x33a/0x480
> >> [  115.813968]  ? process_one_work+0x350/0x350
> >> [  115.818132]  kthread+0x10c/0x220
> >> [  115.821350]  ? kthreads_online_cpu+0x120/0x120
> >> [  115.825774]  ret_from_fork+0x3a/0x60
> >> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> >> [  115.833768]  ret_from_fork_asm+0x11/0x20
> >> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> >> [  115.833768]  ret_from_fork_asm+0x11/0x20
> >> [  115.837680]  </TASK>
> >> [  115.839907]  acpi_tad(E) drm(E)
> >> [  115.931629] CR2: 00000000000005d0
> >> [  115.934935] ---[ end trace 0000000000000000 ]---
> >> [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
> >>
> >> We cannot yet use xe->display to determine whether display hardware
> >> has been successfully probed/initialized or not. This is because
> >> xe->display would not be set to NULL even with GPUs with no display
> >> capabilities (e.g, GMD_ID_DISPLAY =3D 0). However, this might change
> >> in the future as Xe and i915 code is unified to deal with no display
> >> cases.
> >>
> >> Therefore, for now we have to continue to rely on xe->info.probe_displ=
ay
> >> (which would be set to false with display-less GPUs) to decide
> >> whether to invoke any display related functions or not.
> >>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> >
> > Thanks, and sorry again for the trouble,
> >
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Are you going to merge this? I think it needs to be merged via
> drm-intel-next, that's where the original changes are.
I do not have commit access to drm-intel-next. So, I guess either you
or Matt would need to merge it.=20

Thanks,
Vivek

>=20
> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel
