Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B6FD9E1B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 22:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619010EA0E;
	Thu, 26 Feb 2026 22:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBrH3Djt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A7610EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772144860; x=1803680860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hSHEy6e6HCjf9F23dY1BqswahQJBftBPtNNOvNAJuUM=;
 b=DBrH3DjteOHOtsB5uUjPRUelQ5hQOGVDnK4LIk2IOrTdBR8fSCBNJET5
 VEaBuRCUpOoO5/rW327UFKFt4T129je1rhj1ZtXiSskscWrNSYUFE8o/e
 pJM0h2UM1bgOah2nG+TuhOI3UPgZ6zmotmxp0vodypMTVv4EKKXEij/PH
 ugUoZcpPX2IUAKA7o7EE+Eo4GFe2zRTRJX0Buj5t0hUlK2xYDOcEDaTZm
 Kpge1Lfe+ns4Wc54sJNOrK1NZDNeFHfxZroN9AanoGY02tsSYgHLvGz0q
 fVu0kszZgrqsZ1LENXoUoNwr1mfkLFr4VM6d0KhHXWHvbajmo9mlG6v2d Q==;
X-CSE-ConnectionGUID: HMWKV6wHS5e78uuFMXMNBA==
X-CSE-MsgGUID: CFn4dvonSOCa22/2VD5FKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73328049"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73328049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:27:39 -0800
X-CSE-ConnectionGUID: +Jgc4jo7THKtNIrVrbYMWw==
X-CSE-MsgGUID: UyItz00VSuqpotTA94ubsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="254480116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:27:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:27:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 14:27:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:27:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a44GgXrzzznFd7NAGVL4qnoweDtgAkjIbx+xH6zhdAjSIcrMRz14mb90vTuwhPPBhqNFps6swHaPBJ00aR2nhIsFo2CVR7f4oX/mxUgEtSHBTiYIPbCYb+kKhKsC0i8Hsn5vaaB2VEj/dlD3hMxKpysJophikYYh+Pd+1W4g5UJ8ybcOmtCGrTI6y8nsWSocv+6sbCCNuabXql4HB4WaTe0qZzM+y+kkdXGiZ2q5ZCkKIeYhvFY+28FK65hOj1U5M4eengx2YotHXsVp+T+gcMuAPrFMek5zinE3QGFFdiDo0A8DEZHJYo8nAsNyNGJk0U8bqIi2uJUbK6LPse2JhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMpRmfB4GWD3BzVIVy670S+qP3VpfYTr7M3H8gWzKg0=;
 b=gRbmwGuUE5TWGDxCGqkrdZwqSUGwmPsjvVC5g2DtCdXYO62acjEvAMw5L1oodDwQhSaRUVsAAkMrNq0hO5niyQ2KSWiuCSTyM8DKJAxZm/eiCrfiKJSom5hnUpMDMiSiWsZ1RPVKV5kJ2mlGYA+BufyBd7prveYNTMRt7ir2CMiOy4dNS4lSzhy6Jmz00h5bcc55IQPOOkbbMjeDEDLyR1PZyTBxjFe+qyZ/kU9b5Wu4K2aR8ThaqpovnzH1tYvwQ7aSRcjF0knC+oRq5l92qVyljSemwXnvEhD9svJJWY6+m3JIiTYWcb1p4JtxsCEaKdJIDmv0o2lnL0bmXqy6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 22:27:31 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 22:27:31 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v4] drm/xe: restrict multi-lrc to VCS/VECS engines
Thread-Topic: [PATCH v4] drm/xe: restrict multi-lrc to VCS/VECS engines
Thread-Index: AQHcpf1OgzyZGw+ov0OvUB1YzXYgUbWVkciQ
Date: Thu, 26 Feb 2026 22:27:30 +0000
Message-ID: <DM4PR11MB54569B07EC6F956911061B45EA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260225022014.45394-1-x.wang@intel.com>
In-Reply-To: <20260225022014.45394-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: 196d0703-5de0-4e3a-3bfc-08de75863b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: DXU5UMe6V34ou/ezFJo7BBiSIO0lKbpVQqtYItZDRKxbs5WDcHlu18HzHIpqVRpjV2jTtzctaTNFfKlpYbuX5RLfZR2SG0PbQeo1sP/hyyNFeLyBywFRILj0wZfGQsRDWS9F7jBUta5YITO9Ejmue/HXlhhm1rTR7smFyk2OpUunvkp2JhxOhJI4bmFmgg88wf0TQJTRJuGkmN9C6GjtuA5GN/tGbzDNRkWl1WxMURW/Ak3eHMcXAt9LF6hf8qPVb0e9VZoZN99qg1L33IZx9U0hkPLXNBbz7lhdhcXAs/1g4YSMHAaAGKEvpLewFotIDo+z7awtcLb2p/jqrnlvTHhytbdY5zSFPUGf3opZutwPKANX4wEvPujRKKKcum7WuyOI1UHRNuAL1wAmRmeDV6he9g1mDIdSypf7VdfS8xzPxdeTXstTthcHmB6mQcfbHgdUonvt3aOtwGXWIUmCg7EnSk7kRdVoK44/dku3+W+Nm0UPUTsD/cKQGAjk+M5jlb94of20qOPMeyLF8rDdsKpVb7+SYhzpS5yseSoNuYbIIM0EKraQPRpSzzp3HeBNnG/31++6vazn8NvVcroo8My6Hg397dQrewnBdckouJ4Ic0wvVzAidIpVULKbopPifzlMQWwAZF26Qgf6yT8Sso+KLm0HkE5dU5YYyrgIVDcnb/g4AK9viFv+aR08+WwEMgCkgavkSh9S4uLb7rtzPmYJYOvOEmw/tyM5IOlqJSw0+sRfJNNJmfOJeBpzWc7jWFRBGGcYFQwbgVYykC1x7LZZRoCwxJpy7dKRDBEt4SY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uunc9pbITrm3DZ8mKi8mZw8AFIseAfDUkoM4fBHhJ2W0HseaTUSjQNb5Gxfx?=
 =?us-ascii?Q?8xzhmWApvBgPz4bN60svn1BOoXmf6MMZgYgZ011TQUBf4Hem3qt8ahiXZ/AA?=
 =?us-ascii?Q?idjEBQ6ImCti/rTeEQDqEVfwJZQlOo9CCVYJzj84V2DbpVSZNa7FWei2rWjL?=
 =?us-ascii?Q?y1SVytqfjDBR3A1HUlsTmQ5to+6eFGnOhMP67t2E0w3JDyda1zJFSl6MKX1s?=
 =?us-ascii?Q?FVQKAzgk85gcerNlIaVGLRjjxbgjDOmvr5XZccUghsuztjgI8zSHqJATznkv?=
 =?us-ascii?Q?LgRCA0L1Ioqj0ZIN4SnjcsTnkWr4DnWdbaCljQoctNATm8TW+HrUa5pAp2uf?=
 =?us-ascii?Q?vRE98Bt+DP95wmI/zysdch9nATSwYsC/83vXth9UQ5pFzVGGH4nXHSBVj6rr?=
 =?us-ascii?Q?wPV5lxmGxJEK+rEKrVBHlFfWk2w5GOxQAF+mIzq67vaS19yt89bA0sRatKi/?=
 =?us-ascii?Q?X6ZfIo/9Hmy3RDXi26w8S2PEZMC90obS+DDQCY8d2sjYk2A0jpjXjOkZER72?=
 =?us-ascii?Q?W1CtnF8JE4hQx3tfG4j5g5ps3bOMLLibvU98QJrCDJpds36ERW+GbCRM2VsF?=
 =?us-ascii?Q?hI/QD5LEHw1ibkR4jL7dSQKiXPbBe1wKgZPhRTnruXeWdqGd8P3W7CvjfH5J?=
 =?us-ascii?Q?zAuSZHKXPuPpmriZ3ejuKAbcyt6VsldLCiVZa+6j3XiRwnTCbI2rLbAc0VGq?=
 =?us-ascii?Q?0h2FrfZZCgw0TjmImJkdkDOMLLRJAgyNAnKansMH6A59jJcxQ0GWDbZH9ac1?=
 =?us-ascii?Q?uyXBVES3myIR6TGi+jRJnCbKhiEh1buunpWR+3RKg1YC6TuPUHnhw2bCENmv?=
 =?us-ascii?Q?xB5X2F62E3fG6IHMDHZWPKGzdbFceV69ANYTv2oVRYg+GxrziXrUk1v62lFp?=
 =?us-ascii?Q?dkkfTCRydfLJU1CB2bvxHKlDDUM6+Ce1kkj7tDqW/eMhTSdqKpiJHS/i+Olz?=
 =?us-ascii?Q?sFYHp5X7IV+N2Keo2dGyW+xZv0tTeHhi0/20mppltnFC49GeqrYpIaZqDtgq?=
 =?us-ascii?Q?Tn4PhfRxJnAAq62aVyYzjWbPj+bUje3ou5L4O0IpccX53RR6h1CpPUZPlRJg?=
 =?us-ascii?Q?LJBgaXYr55Zt81C3P6iBIh+HCjVmsNy8efhyh/FBGjJqhgUoID1ogvxvygD/?=
 =?us-ascii?Q?TiNaR5XODO3n/bqWxadDcs9IVvDtJNpGW27h/Zzp1mrHYbWviYkOtlR2YxFi?=
 =?us-ascii?Q?yT1kDpo+wDB1vasLHRzU8gUzSE6B0dIWN0KqQ+1tnPJhgQK2QIAmkttFR9ib?=
 =?us-ascii?Q?W/UYHAw63PnWVLowNxkheN9imKiPeXf/6KmRVJh+QfBYcaxfHnFw26IRzj1s?=
 =?us-ascii?Q?kq+eNfYcbNJpsvYdo+zsOvKNsxxQPgyMj6Gk7xeg87ziRPY7ox0gG5VJeOqh?=
 =?us-ascii?Q?+JTyDpAendnOmnlu4GsDDxkXHr847suW2xhQOaIuiafRASZb6o9nR7vtHnQp?=
 =?us-ascii?Q?Vm8pQnIrsIn9VcjzMvkOP5AaVNeZpardKilhw5jch3aiMjarOO/1cCEoG4gm?=
 =?us-ascii?Q?4N7eKyDivlh51rC+Dg9ALJS28QWCAEBslFcbqeJVLdWSxew8/db/ODIvaZ8s?=
 =?us-ascii?Q?FKgwgRye1KsVa8TwJ4Xz//tdug/4/yfKn4O4Z/D63CTeaamBxAI9tRWud/lh?=
 =?us-ascii?Q?LCnWYAZUWV02JIZxFF0ZN2fyipzPOJD1DctBBu+5zLzeMxiDzYcKYNHZyRCk?=
 =?us-ascii?Q?LCoR8hF5d1PhUikHZf26FGcuIdAXvm+gwcsFDY1uQYM+m8MWrZAAcCJ7f0KI?=
 =?us-ascii?Q?CazsGAaT3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d0703-5de0-4e3a-3bfc-08de75863b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 22:27:30.9783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjcKM4ne6VcKxc1XoCVGHkbk4bF7Pq29dkWN13qpDCze45FkkF79DkVukc11s+LFtU05xEUryRnIlPOTMPRswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

On Tue, Feb 24, 2026 6:20 PM X Wang wrote:
> Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
> VIDEO_ENHANCE engines only. This check should have been in place from the
> start, as the driver typically avoids allowing uapi cases that we have no=
 userspace
> consumer for.
>=20
> Additionally, the GuC firmware on ModSched platforms no longer supports m=
ulti-
> lrc on non-media engines.
>=20
> V4:
>  - use a unified mask for all platforms since engine instance count
>    is an independent runtime check (Matt Roper, Matthew Brost)
>=20
> V3:
>  - store a multi-lrc enable class mask in xe->info and populate from
>    xe_device_desc in xe_pci.c (Matthew Brost)
>=20
> V2:
>  - correct the typo (Shuicheng)
>  - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
>  - remove the graphics version check (Matt Roper)
>  - input more details in the commit info (Matt Roper)
>=20
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
>  drivers/gpu/drm/xe/xe_pci.c          | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f3ef836541e..caa8f34a6744 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -138,6 +138,8 @@ struct xe_device {
>  		u8 tile_count;
>  		/** @info.max_gt_per_tile: Number of GT IDs allocated to each
> tile */
>  		u8 max_gt_per_tile;
> +		/** @info.multi_lrc_mask: bitmask of engine classes which
> support multi-lrc */
> +		u8 multi_lrc_mask;
>  		/** @info.gt_count: Total number of GTs for entire device */
>  		u8 gt_count;
>  		/** @info.vm_max_level: Max VM level */ diff --git
> a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4..5abb29454d1f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  		if (XE_IOCTL_DBG(xe, !hwe))
>  			return -EINVAL;
>=20
> +		/* multi-lrc is only supported on select engine classes */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
> +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
> +			return -EOPNOTSUPP;
> +
>  		vm =3D xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
>  			return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> e1f569235d8a..3ac99472d6dd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -184,6 +184,10 @@ static const struct xe_ip media_ips[] =3D {
>  	{ 3503, "Xe3p_HPM", &media_xelpmp },
>  };
>=20
> +#define MULTI_LRC_MASK \
> +	.multi_lrc_mask =3D BIT(XE_ENGINE_CLASS_VIDEO_DECODE) | \
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE)
> +
>  static const struct xe_device_desc tgl_desc =3D {
>  	.pre_gmdid_graphics_ip =3D &graphics_ip_xelp,
>  	.pre_gmdid_media_ip =3D &media_ip_xem,
> @@ -194,6 +198,7 @@ static const struct xe_device_desc tgl_desc =3D {
>  	.has_llc =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 3,
> @@ -208,6 +213,7 @@ static const struct xe_device_desc rkl_desc =3D {
>  	.has_display =3D true,
>  	.has_llc =3D true,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 3,
> @@ -225,6 +231,7 @@ static const struct xe_device_desc adl_s_desc =3D {
>  	.has_llc =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS",
> adls_rpls_ids }, @@ -246,6 +253,7 @@ static const struct xe_device_desc
> adl_p_desc =3D {
>  	.has_llc =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU",
> adlp_rplu_ids }, @@ -265,6 +273,7 @@ static const struct xe_device_desc
> adl_n_desc =3D {
>  	.has_llc =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 3,
> @@ -283,6 +292,7 @@ static const struct xe_device_desc dg1_desc =3D {
>  	.has_gsc_nvm =3D 1,
>  	.has_heci_gscfi =3D 1,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 3,
> @@ -313,6 +323,7 @@ static const struct xe_device_desc ats_m_desc =3D {
>  	.pre_gmdid_media_ip =3D &media_ip_xehpm,
>  	.dma_mask_size =3D 46,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>=20
>  	DG2_FEATURES,
> @@ -325,6 +336,7 @@ static const struct xe_device_desc dg2_desc =3D {
>  	.pre_gmdid_media_ip =3D &media_ip_xehpm,
>  	.dma_mask_size =3D 46,
>  	.max_gt_per_tile =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>=20
>  	DG2_FEATURES,
> @@ -343,6 +355,7 @@ static const __maybe_unused struct xe_device_desc
> pvc_desc =3D {
>  	.has_heci_gscfi =3D 1,
>  	.max_gt_per_tile =3D 1,
>  	.max_remote_tiles =3D 1,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 57,
>  	.vm_max_level =3D 4,
> @@ -358,6 +371,7 @@ static const struct xe_device_desc mtl_desc =3D {
>  	.has_display =3D true,
>  	.has_pxp =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 3,
>  };
> @@ -369,6 +383,7 @@ static const struct xe_device_desc lnl_desc =3D {
>  	.has_flat_ccs =3D 1,
>  	.has_pxp =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.needs_scratch =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 4,
> @@ -393,6 +408,7 @@ static const struct xe_device_desc bmg_desc =3D {
>  	.has_soc_remapper_telem =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.needs_scratch =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
> @@ -411,6 +427,7 @@ static const struct xe_device_desc ptl_desc =3D {
>  	.has_pre_prod_wa =3D 1,
>  	.has_pxp =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.needs_scratch =3D true,
>  	.needs_shared_vf_gt_wq =3D true,
>  	.va_bits =3D 48,
> @@ -424,6 +441,7 @@ static const struct xe_device_desc nvls_desc =3D {
>  	.has_flat_ccs =3D 1,
>  	.has_pre_prod_wa =3D 1,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 4,
> @@ -445,6 +463,7 @@ static const struct xe_device_desc cri_desc =3D {
>  	.has_soc_remapper_telem =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 57,
>  	.vm_max_level =3D 4,
> @@ -459,6 +478,7 @@ static const struct xe_device_desc nvlp_desc =3D {
>  	.has_page_reclaim_hw_assist =3D true,
>  	.has_pre_prod_wa =3D true,
>  	.max_gt_per_tile =3D 2,
> +	MULTI_LRC_MASK,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 4,
> @@ -746,6 +766,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_pcode =3D desc->skip_pcode;
>  	xe->info.needs_scratch =3D desc->needs_scratch;
>  	xe->info.needs_shared_vf_gt_wq =3D desc->needs_shared_vf_gt_wq;
> +	xe->info.multi_lrc_mask =3D desc->multi_lrc_mask;
>=20
>  	xe->info.probe_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> b/drivers/gpu/drm/xe/xe_pci_types.h
> index 470d31a1f0d6..47e8a1552c2b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -30,6 +30,7 @@ struct xe_device_desc {
>  	u8 dma_mask_size;
>  	u8 max_remote_tiles:2;
>  	u8 max_gt_per_tile:2;
> +	u8 multi_lrc_mask;
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> --
> 2.43.0

