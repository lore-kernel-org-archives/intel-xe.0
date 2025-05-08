Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD491C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 13:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A566010E3A2;
	Thu,  8 May 2025 13:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQTOLZZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D4510E3A2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746712563; x=1778248563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fNr+LHLktQ8e+HBlOwkkasXuGu1YjN5d2nonmpMhxlI=;
 b=iQTOLZZF/FldWmBEzBbEp2xzByx0i31hi5y5HPNjSz1X80Dg7OYMokYO
 6J81CQ0paRQFTOb9YRfTrY6NDzM3vJaraNyHk5+c7BYozYirmIe9Om4BV
 Zs2DlLP/YWZIGKSoQJqeZVL1SfYGXw0eu/1xTAWMbwbPYRRf6C0l9Vsff
 fDKPrCXeyGhaQ7vnRqfbePmDfAM2wUlyrX3xixFhcY+yVC9l4CDqgLtSl
 w/nPhGHwxzD9UMiIGTrOXzkfoQQHdkYi+f6u6cKO3I6sas2e+N9QaKiT3
 xZ6+lhK4u91JvsLZIJBz+Cg2GGExOClT72WzOXUYqzeoIrtBzY/zpj9dm g==;
X-CSE-ConnectionGUID: wCM2stzMSPyoRE0CP5zvVA==
X-CSE-MsgGUID: M0cqeny6SSCWZkAFZWj25Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52306192"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="52306192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:56:00 -0700
X-CSE-ConnectionGUID: 8WxCpV8KTgetCBhjQFmo1g==
X-CSE-MsgGUID: Obbm9d39REWEk3Le2uPp9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="167386166"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:56:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 06:55:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 06:55:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 06:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu2DAomxe/iVDjScqLxBiVnr10c7MzqAttvd6uV7Fep7hWPYuQKln8jhq6CuIzEv6mR+AhqjYwsUBu3CHMGhj1jJxb1akM0V4HTthVJ+M8sbmkce8hHp34Zy2vZaEv/sDS1H46OfvIa3wMRYnP8ynKZwDAn/aDX0N+PQlmeD9xr2A3En3AtMX8kPMsjakyXjIW+GzBeXtlK1ydOCarqUSJoRNY4xZkY1ZtlbcTC2b27augPo3DZ+bnGT3s7WXUhnm69F9Vx0scmzbh89zbdEQ1SiYa8MYlzQZthI318P+KnD2KaQSL2mDEmFSav0j0UqoaJBt14FpGHKs7iOVSy7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPnrN1b0f/L6lnuvlSD37U/Lj5Kqq9v7NmamoOpDeK0=;
 b=QeDwSoxchOhdiVDnTvSrQTtJiqXrSwVdo3FhlAuI4jTQEUZiiAOUKMcnBThFAJIvVDQ3pcTUDMi88nkxLhYxt33cgQHH3BhP1mcX8inHVHGNa7VyZvWZc9A5xuZT3ug0Hc+nJBA0njPWsmpUaNkLTcfQaue/qrMwonLl94YZluwKBt6JZ+oWdqCz5mRQV5a9sGDu/orqKUGWDwRejc5Tlup0xHCLUrbCbk0Rk//BH6iepVog8bbigaIA2CHafHf0Jr50NVKv7qvp2zZxLbQFybmEOfo10JTTSLlUoCpc7pQlOMavGIV8rAkcstQLOBo7fvnA/0zjKqO7lJnqx3XTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 13:55:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 13:55:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Thread-Topic: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Thread-Index: AQHbvzhoGgF/1G1jZk+XRiKf1XRZ+LPIwypg
Date: Thu, 8 May 2025 13:55:52 +0000
Message-ID: <SJ1PR11MB62047A2D7451CFFF32ECCE66818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250507101112.4678-1-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN2PR11MB4568:EE_
x-ms-office365-filtering-correlation-id: 0162d707-5e1b-47e6-0583-08dd8e380ba3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?io72PK+oNAeQBpjzPN9nHIGn99Ezv3rNcKT3qsBoAfS7U6NbAqo0guExKqEr?=
 =?us-ascii?Q?2PIO7iXVVWT8PZXjvswefwzN9TwLiiQ8AxvwH7eEm5qsWPmKRaHJFUYr9Xoy?=
 =?us-ascii?Q?LeSmQQ+Vug8Sql2MXWpwR3Jl2/Uk9s9LsAkezCMB6r//f3mjVTs+sg1CR1/y?=
 =?us-ascii?Q?4trEGT92Zqo/+2t34GLLfx3oMGhqAV6u6chpUODgpanvYC/XCySWteN/15BR?=
 =?us-ascii?Q?YY2fT1UOBhJqgbK2+LOvpY7Uq+XwrsYuQrH+HLt5WKpIopk3T0U+hfEFwY6R?=
 =?us-ascii?Q?mpndrfUxHrC+KfYios487++HioUXNSOXey2r7KRLGqCc0qgMTb63H8B1jLUp?=
 =?us-ascii?Q?v1511xeeuL508TeX9zKrZai9xm+CnG7++qy6UaW3jD2I5lE8FIpFunk4KF/7?=
 =?us-ascii?Q?Hwjbh0R4v2vhPyDBPdOfau6H+Ws6AGWaQ7H9QVk5gPB5s8RBawWK6NY4Ivfk?=
 =?us-ascii?Q?HCdWGV+5a4Q0xFv4UmBbfJQI7yvf9c1x2mmDu5tnrGT39Ia/KnTLPUh6GrRJ?=
 =?us-ascii?Q?WCMuXqwZv3ZrvoEmkX33zdR2lXrmF2yGdNgGZ74LOEp4KJdseoITD/5XYKhj?=
 =?us-ascii?Q?vbVu6Fk1IF7uKnvCcFmCU027eE7dJb+yPFORsEnDgmNjYmxLrzsx0O7h1OEH?=
 =?us-ascii?Q?Y0BBsx1khyPWkmhI6oUXALFUqGv/o7z0lzpr3Dkt7YSGWwHS0I8YO/smxNd1?=
 =?us-ascii?Q?2mo/rmnPK7T1Jt+l77UiGxUXahFDDWcm57cVgZ9ZXbOzDDCDoAN/4Y5JOELl?=
 =?us-ascii?Q?UR3CHfix85EDlQPFWQSfHLfJbcw5g0tgymPFVfEsPFBwwYaqsmPADb+agp7/?=
 =?us-ascii?Q?g+3QsJgZkskte3xVxP54RqHAtWpfBWcjSAnFZcT+hVwAARKaPjBfse33Hpcq?=
 =?us-ascii?Q?NH53EzxAYpmJf7xH3iEpMYU7M4fJyW2UkmhWJdHFjK8VZeudO74dMnkTLUs9?=
 =?us-ascii?Q?xm+KqxSIweiCXzZmDT3MnIy1eaYIQ94H3EZUv1Ll2/KMPkl64zXMZ9YFx+B9?=
 =?us-ascii?Q?745nAh7GJ0X4Ru/oAAZvL8rT1716e0XZCiT+aWGnMKNYlBDCP8qGJlQJYwsZ?=
 =?us-ascii?Q?EGeVLoi9hes5XvXZezDIY0d/VJDvOIFMSjLePMAkTQzDcN7XBpx63lA0+iKV?=
 =?us-ascii?Q?R2HTjsfDoaKNKRo6siWlmrUP33wbzGwyZrwN6RYT7w2+eog3hyllHosYM9JR?=
 =?us-ascii?Q?wQdmDR8dffj59z7sn2MJBKQUTtPox1j3Y7/nANyD3+0lB5POe224fc/+K/Le?=
 =?us-ascii?Q?sPIi6zcTuzBUJJZhOoG5akYhFcIO+uTzRxq4u1uu9y62UvIyTJI9ql4DNV1Z?=
 =?us-ascii?Q?ER15/XxP/4BwcXBJCkfBgYXuNCKv2puef9XRvZXS/4eatiIkrVjdWKXphEwm?=
 =?us-ascii?Q?QU7m8AKf5mrEpMk7K4fYz235UKBvfitF5P/AlBZqV5Lfp9Cnbe5052Hj5Pes?=
 =?us-ascii?Q?OzTjmXBXAQnOOkmoOwcWfIOUe8zL6lQL95PINE2ookEIvy6185I/Zg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WFI1SedHWid14PAXsU8ZN1LsYkhEQI7eO7RHksBK2Vg22rTRxtvkNCCSXBuz?=
 =?us-ascii?Q?xOAKcENih7o6NtdykS1bhFaAigpow0pi8AOpApS4vzimJUIPHCT7GCrcPigz?=
 =?us-ascii?Q?rqF6hiKIzCyIOSHxiFUoYlikXoV0GLjsExO/G1RQghgHRd90QBDmaQPX7xvo?=
 =?us-ascii?Q?O3MzFb4anvxVGAJDD5QU9K4Zayn0fu0eLtsWifTgcgF4njPQFCDlUuC3fIj9?=
 =?us-ascii?Q?GxBTiemDaM1Mv/l/tSAzlvIX37k21yxq63w5BSCD/JycDdJqwLJ9Vdal8UUy?=
 =?us-ascii?Q?y4hFSg01XSXzjEEwUaYawTW+iAFzqv22dnILyHWNctpZ5hHZQ88wBCrXr/zt?=
 =?us-ascii?Q?5nf6Q564XoQqTbpv8xGqtLDTsj3ykNWS24adQf8cwgsR/Tp7N5zujjbgwW0d?=
 =?us-ascii?Q?3r73l9ONlUCJzUAZ7W6gOu6qKm7UU8/PfIwidEa/f7JECYu9qv1boi4YVsFN?=
 =?us-ascii?Q?cPMnytDTTK9/dfBZHDoiM08yjQg575NxAHN5nIPZzVGmss373amXn1cb8/ku?=
 =?us-ascii?Q?Qz1/sxAEj67w8+qXp+KTHQ+XP4NhOvtreqx3f2lPBBL5SIcobskgb9kIdjtu?=
 =?us-ascii?Q?tevwJ/JekztLueFyuQD779FZwD3X41K0uRBcq9snmHhoga0scHt5CPCMJkGq?=
 =?us-ascii?Q?amNfCbAlVjl9kr30Wd/d3yXOdYoxNM5LkMvAsz4ASOUbisPiC567fGdcSn9q?=
 =?us-ascii?Q?JoGyI6F8NIG7WLykZd1m5GKEnJ8JimYiMYbDIbZLj+meXvdfnSwyTtGXhm5d?=
 =?us-ascii?Q?5N3dYvZ17fB2S/5xVw8SY3wL7Sx2m91xzLYkscgV1rxJpzhlU2tZX4XUKHoJ?=
 =?us-ascii?Q?sn81iefL+WW8qXrDB4KM1Y9RBrvCbCFUkH53HrenImMYWFDG7eRNyg+uLqZD?=
 =?us-ascii?Q?7eUmt9xPzvKXRcvnSS7bhrNkhiDURwuuc2/2Vw+/H44+wENLcmyNSB2OhSuh?=
 =?us-ascii?Q?NB38saHZ0R8ZFNpcrKFwZA3TtroJnR/ArpQUs6aAornt73TNbrNz7HU3Kqdy?=
 =?us-ascii?Q?tFrBSX9DHQwjhCVPzdwP1QnbdxqZjAcRlvC9aVHq8kO8uzSPK3ho2EaBONqi?=
 =?us-ascii?Q?XebN0j0LbSW1TztMQoPX1KYhPSnjVJrkH9psCf7cwpehpuXdmmzl9G3qatzy?=
 =?us-ascii?Q?gETbAeljG77FhoQv6PS+jR/dy5UuJKr125s+MhFY2EN+m/qS/EIiTtLzL2+S?=
 =?us-ascii?Q?eZpn42XFKbt6nRQCgLo93ih9wVVggdnKbJti5+GGa5n66zVTBJQk5VNWMSdj?=
 =?us-ascii?Q?JZmG6cn6oZjZN+CQgUav8J5dimivay/8eJ6GHnDF+dePjc+SgORV7LaOFwQa?=
 =?us-ascii?Q?gBH4qkrYmcAKGZKq+Mk2otaghMJJUCGy/GP2HRyynO5XvJpDgsPgBl+6n0/O?=
 =?us-ascii?Q?WG6kUNWRMZ+csadwo7Nvhia715u36Qs3CYwd3XQ8gFtWlN9cfLh3onnZJXRM?=
 =?us-ascii?Q?smN/NcsnfS8nv4D9QUn//uir9WtMcsb5tWDjI8YNyIxB+Z9c/Dq53h4ejKQi?=
 =?us-ascii?Q?L01mc4SBwKQJobvW2kzlaA6mB6if2Mhmqa2a2a40Gt0w992EXi0YGNvaVswg?=
 =?us-ascii?Q?qn5btCGqmSXWJVRrh680dImFo2pUSkkeg6vhI5F1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0162d707-5e1b-47e6-0583-08dd8e380ba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 13:55:52.0562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0fY4+u8E4XZlkxMUhQvsfJbYRGimmF4hEYLSpZ+7ryrxITlj0cl4pg4NXPne47fz0hj9DmUDLWIdsbPlpShYCxeX1uN/yLwXrAx7uhIbSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: 07 May 2025 15:41
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
>=20
> Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.
> It is a permanent workaround, and applicable on all the steppings.
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
> Changes in v2:
>   - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.
>=20
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cbb9f7cbcfc0..5cd5ab8529c5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -156,6 +156,7 @@
>  #define XEHPG_SC_INSTDONE_EXTRA2
> 	XE_REG_MCR(0x7108)
>=20
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300,
> XE_REG_OPTION_MASKED)
> +#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>=20
>  #define COMMON_SLICE_CHICKEN3
> 	XE_REG(0x7304, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 6f6563cc7430..67196baa4249 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("22021007897"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	},

Changes are ok, but why its LRC WA?

Tejas
>=20
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
>=20
> base-commit: a127cd437da1f18b6ecc9e03226d8e2b2aa79dab
> --
> 2.43.0

