Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF378CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 13:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81010EB26;
	Wed,  7 Oct 2026 13:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yvz01Dhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AFC10F5E5
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791381108; x=1822917108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bv8jrcxWyQHLdH791zote1t7Q+T8PM24BxX1n0uinDE=;
 b=Yvz01DhfP4+20Hn+3Dqu1f0kBSJmst7sd467w1iMTuD8QU+rz2jNayV7
 SrZpoByK//SGtvonkpff6Wu4SfXLQIehv24+WZtlkMrd6HXJuL4SNVSau
 Ho9bJSMoiX0uKpqLW4fXWKMEM7mdoSw5ipHdNSuoWjTAiRi6O2Rrcftzk
 4OOnhh2EypzWG6JRfe9YopSHA22x2p3Bvr4SgkiNTdFI06WYXh6z29JNl
 SG/C8BfWNkGfJjKccsByg7JQpwiNspO9ki19QagCQA27E2kvxK6kAffVR
 b1ezbfv5CkH4a3lZ/iFjuBMzfNF1my2FRuIQe7xTEN0A6FGjZ8cx+kPNq w==;
X-CSE-ConnectionGUID: /aIil+iETr+xrcMxxqRsFw==
X-CSE-MsgGUID: RGL9UUpOSVWPgJL7b//EHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="25730"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="25730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:51:48 -0700
X-CSE-ConnectionGUID: yCPcPPHIRA2eMfoocsbZ+w==
X-CSE-MsgGUID: t/X2dynzRxS5q2TiNgjhOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="69086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:51:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 06:51:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 06:51:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 06:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+E1NuneygX2NJH2novgmktWv1YL1B6ZR73CZEPfUXEJO2ecpY/5fhV+1OM1OlSulTn2kjG25GP2wlJT1yJ6NgpPcIdv/qz7Ls+flCt4DxMndY5sppsRrcN1pPYl2D76Ycvf3sDul5dsRYQHf6ND2OUCusSnO3T/u0IhYLQWwrhct9+stVmcdcS2zs5nW7obElD0rgesVUSyJn69D1N105pmQCXHGaZgawpr0i7hK8Z4SaODUOGgo163V3w6KDyCnIK25qGed9VLFdmpbXObsEk3B14RfG94Rqk7zuz7i9DjpheaES6q1XnoW9c6giAL3D6zoPD8oJ6MddTGxPLHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYvEIwsjoEWO2DpcnSwlL9Kyvj7A7OXCSAP1/7C0pMc=;
 b=QfMOfqLCxXRcvRptHblUssUjDEMy8P+Y0CjhRvmtxTen+PUsx52fm6OBybk6JPA5+a8oDEpQTqq/A3Hws2lW7mDhkahppxcfAbajB2+7oggGB7/i642V2vGwgIKj+XzaCEpblf2Mx/pEx3B+6+f57YYfQOR/2iIYGx39Xlx2xL/lPnrgFbFZoJMxVo72EdEET9KurwzpWZcz8/KLKhMVKFEgsSZEbxzMy3LtV6Y8w8P31YuXbI3ttf30Zmf8aSXokK6PeuV7ZRZGyx66svGE20iSv/GI4Os0OzEjboDt6t8EsRtsRg7aYJXC8wQ77dDnvFgQlGEveEzthddSHSGlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 13:51:35 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 13:51:34 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>
Subject: RE: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Topic: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Index: AQHdO69NSAhdGyDvoUGvr0W+owZUzrbyTKMg
Date: Wed, 7 Oct 2026 13:51:34 +0000
Message-ID: <DS0PR11MB871883C996488A6420860C6281942@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
 <20260903141834.1315675-2-naresh.kumar.g@intel.com>
In-Reply-To: <20260903141834.1315675-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CY8PR11MB7244:EE_
x-ms-office365-filtering-correlation-id: 0c94244c-4766-4688-3430-08df247a19b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|10067099003|22082099003|3023799007|38070700021|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: lav7X7+bCVgLGObII9b6Akj2A13r5eVBZI3upsXfPfNcBK6eaNYnNJ1pLyVxr3brSlY4KdGNcxq8odhOQq6trDNp7Ai+/XIF6vd2KSEofLmxf4OpoU5Apv5nyJAW88J/n9cVbg/e/dYvewuctNkRDsF/WdGNxNHw9wTLbKxrJGk9+DkLQNKIa0FBJZWzCTkdab0RZY1nLFMHbRUAuaqZsnTwdzl6GmKRnjVhmDx3B/xemlOwWHkSIQuNQDJUgUj4kFGFoXrw6CUg9vw9AJMh89ll0Qcw3HIVn0BWKCV+Yp1wRcJ/InLcNd2Q5VqQ1l7RleU8Lw0R2GGEpqZexf9ubd9tfLNs4Rma+tsGYyphb+TLlqZSM0eSB1oJxxkWTxQAbwSeRVyxx9o/vLX7MqLxQBAJ7f4vNDKvYHpR+zYSJuCTn5lsfu/8y4fjF+vFVweqXyZV6L9TgUeK914vVNfy9D/o/Psa93hCcwl9y+BDTQVib/APKJ3Gw1V2yrN8t7psgPhAKxeW7XvSMgpFh0SIfjSjmwYrmm2IpQhXJd+6iZZunODgm8N7NQ4o7iPVuZE5j7AMKIWmveqrwYWwrs5n3nM5F7kTps+xdirpLEqAZqBIEeXTOlZH/0DJx0bJFxojm+ZqwesPs1qPTHGGRi2tJ/eliYZbsTxECtPaK5GCBOc+05BUSBUP5m1a9YS60r6x2b1nQbWnGNl1DbYxeDN4F0YCnGnOJwTyYKTZbJglU/k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(38070700021)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kTAT37ehhmcCD75lpm01r1Gjed9MEsmDi0HDq42J9wYpiYh+VO1kfz0YQEge?=
 =?us-ascii?Q?7bvbBw+BHZNqQTZM/Ep4K3rbx5UAb/iP5pCnQLpmZVRZ5fULygrLV8LKbKCn?=
 =?us-ascii?Q?ObozdVxQO4eN07KQFdpGghEgPRWv2HS61xmLvGzdgeWCkdXtF8HkBaWgLfuX?=
 =?us-ascii?Q?wjzR0zNdQYUJ+SpZMh0813WVrT+YjF0yDt7uESNxQesmKrNXJAz4MI4MQAlU?=
 =?us-ascii?Q?iBDgeeAcRdVsS08InAFTMUPfv9xq0Fm7K4wBDDQg3CE2LzC1qymYbPM90qBP?=
 =?us-ascii?Q?F8+eFUnt/RGg4DdKLVx12hVX9x4wsGgLGISxw1JdC4f10ZetS8WB4EFLUVjJ?=
 =?us-ascii?Q?eBWdEyqfVStcknyKCzxLPG8fXQ0xRm4BmD7ztF8pKcgfuHyXN8JW3prvgj43?=
 =?us-ascii?Q?rduGEylZop4UNbteNbcn0REym/QdelWMh6IbHWRXqR8qnElxTcJgt8HKozEY?=
 =?us-ascii?Q?L0oW0YYSoB1XF1ItzTyIu6qn3eU4HeUnOqyncpBTmFahDzZT1CV8ylH0u6Ca?=
 =?us-ascii?Q?G2kFg/kTC9AkPD9Eyqn2LPFTdOahCTpX1lkXC91sNnEk7EFoKBJ8bZIWdmr/?=
 =?us-ascii?Q?bWsRy+7uoN96VA6vQy13Tb04qa1Z2HRTU6MDfD+fJEgE1VLEOxLH2uNWcjvn?=
 =?us-ascii?Q?EK/06BaAij+e/fwbWRdrtsHNevawmyr7hwzSER9pyEJqGo731/JC3lzWA1xv?=
 =?us-ascii?Q?JJpVM7e5rTCi9sPYWFry80eFVLbdrBTZLML636bkce2wUK1A9vh37KnjeXs5?=
 =?us-ascii?Q?YZgNZZe3IEt1kPXLBCIK52acBMLO6pJQjuuNpcVP+/qys0ab3tiHDXszUtC/?=
 =?us-ascii?Q?dtVlfJOyTQWQxCsjceszj3Haas3X93dy0khEeZ7t1UdVtx2dLNpXdPg0naxL?=
 =?us-ascii?Q?uuC1B3y2YiDMFjsY+VCe2jmjOI0PAYzdtWbAGUVoKDD+EuDLahD0ThT7jthD?=
 =?us-ascii?Q?sTcNVMSzqJxKgANVY9YDZuGow2t3je9wTqS/SvAaS9Jlwnj+DwIAH2SOWEFi?=
 =?us-ascii?Q?tyU6YFlwkT76NoI6Ft3T2F2fJv2juH1FGeZuP75kZiJFoY0g3/YJEnFu+6Ne?=
 =?us-ascii?Q?31TFMDjA3kC19H8xZO/mXAhlzvcbUUXnAd73wYwtm7BQI16Ugu3VJWs0pfsO?=
 =?us-ascii?Q?y+e89vTh5+Ie+7fBQ5jbXhMI17sCGbvZB3oainh2BjllvK3DsTEXKbq+YOrm?=
 =?us-ascii?Q?mDF1P8cO6o3kre2LeXnjD9qOdqlZweGQAJZKOyWbvevAhJlqnaYYXEv9l2mp?=
 =?us-ascii?Q?0Vp+eYutchzLILQaGx8n0JCfPuPqKJ3f6GciYRjR1mTI+1jhfLNybKHcbjN4?=
 =?us-ascii?Q?h9N4I8o28xEAypzv2fGAviYgW+F+hasv5opMBnYmG0EWcRGm3PNgGqnCxWpG?=
 =?us-ascii?Q?wvDh9rO+AfSE3bm0IWF0kMrrNmxvBacAzU0VNX4umJ6uoak+CkIoO4Y9sWOa?=
 =?us-ascii?Q?SyG0D1OPkSw2c08PodbPSshVJYfDS1VS/dsDrt1MIw2mvBkxVDhsysRzL11U?=
 =?us-ascii?Q?9/0uUaclpgtmdZvk/4Hsg15rlFLgEcmC128M26SDZDHyen1dRLQM3k7V+Vu7?=
 =?us-ascii?Q?xhOiBqHHGqQKPGbs3Q0IpCwYiUyteHDSNiHyYQB4X5OcCJJobNzrDmOPLpCy?=
 =?us-ascii?Q?HvGElIh93z3q2Jzs/ceOCXB2TwRHyEyuoUVBua+Sl4RIKBPDUXINd1px4dwI?=
 =?us-ascii?Q?D1P0ipMqozYPHYvxgYsiGsFUpSAuk3s9TVQ0rPGjiEGbTT4QpWOyd7/maS84?=
 =?us-ascii?Q?WmbH9b+1nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: thAs6xH5OqHxbsOysAZZuWOri9O9dfO3ozwy5HBZABuU2X9qaYk0oVnS/Gy6MecEsn876AouqODqYL6JIFbZCpIdCGOg0OgW/kiB76v2kiIe7IzzpM2Jn0t6uRW7uxplopReKUlG+cZH2YNz0/i9LN8b5akHP6OQBWl27QajWTgvXnzJosTIQY8IYm4QrsCSUrpMXeWOihGzoX/0zQGrGREEelT61w8nrBPwA44C+83TTS+eTXxm54FJsIxamlzpw3+9oqm32SKIvNOQqHwbjkhkQhgrl+YyOZvlIcVH//cg81n5NnKu734xgO3oebYxp4xNPFj9DE6VWzWWU7zRag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c94244c-4766-4688-3430-08df247a19b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 13:51:34.5263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joffIYQXizACqQqwGtD+QqWC7RCgulnP26Nvs0DZ265n4MoBLx7Rm97YR2XjCxz9l4WWuAfcc/9p45XkBx880j5xnyh/UAMGcTtKra82z0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 03 September 2026 19:48
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Yadav, Arvi=
nd
> <arvind.yadav@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Kumar G, Naresh <naresh.kumar.g@intel.com>
> Subject: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
> devcoredump
>=20
> Capture fuse-related GT register state in the Xe devcoredump to preserve
> additional hardware configuration information for postmortem debugging.
>=20
> Add generic register snapshot storage and helpers for capturing, printing=
, and
> freeing MMIO register dumps. Use them to record both primary GT and media
> GT fuse register state during devcoredump snapshot collection and print t=
he
> captured values in the coredump output.
>=20
> Also add the required GT register definitions for RPM and mirror copy-ena=
ble
> state used by the new dump paths.
>=20
> v2:(Sashiko)
> - Fix GT/media fuse snapshot capture to use the correct GT context.
> - Add non-fault GT force wake for cross-GT register capture.
> - Skip reading registers when SR-IOV VF.
> - Skip media GT capture when media GT is absent.
> - Add RPM snapshot print/free handling explicitly.
> - Add POWERGATE_ENABLE register to get render awake status
>=20
> v3:(Sashiko)
> - Check RENDER_POWERGATE_ENABLE of POWERGATE_ENABLE register
> - Replace "render is not awake" message with "render powergating
>   appears not enabled"
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   4 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 255
> ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  39 ++++
>  drivers/gpu/drm/xe/xe_device.h            |   5 +
>  4 files changed, 303 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 48c515d91882..19f0a65cc3d2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -22,6 +22,8 @@
>  #define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
>  #define   MTL_CRST					0xf
>=20
> +#define RPM_GCD
> 	XE_REG(0xc98)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> @@ -274,6 +276,8 @@
>  #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
>  #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
>=20
> +#define COPY_ENABLE_GTFS_GCD			XE_REG(0x9174)
> +
>  #define GDRST					XE_REG(0x941c)
>  #define   GRDOM_GUC				REG_BIT(3)
>  #define   GRDOM_FULL				REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..fe38bb2296be 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -25,6 +25,8 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
> +#include "xe_mmio.h"
> +#include "regs/xe_gt_regs.h"
>=20
>  /**
>   * DOC: Xe device coredump
> @@ -69,6 +71,233 @@
>  /* 1 hour timeout */
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
> +/**
> + * struct xe_reg_desc - Register descriptor struct to make reg list
> + *
> + * This struct is used as descriptor containting reg address and name
> + * of the register to dump its value during coredump for debug purpose.
> + */
> +struct xe_reg_desc {
> +	/** @reg: The register */
> +	struct xe_reg reg;
> +	/** @name: Name of the register */
> +	const char *name;
> +};
> +
> +#define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +
> +static const struct xe_reg_desc xe3p_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE,
> "GT_GEOMETRY_DSS_ENABLE"),
> +	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE,
> "GT_COMPUTE_DSS_ENABLE"),
> +	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
> +	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
> +	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE,
> "GT_VEBOX_VDBOX_DISABLE"),
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(COPY_ENABLE_GTFS_GCD,
> "COPY_ENABLE_GTFS_GCD"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2"),
> +	XE_REG_DESC(XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2"),
> +	XE_REG_DESC(XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> "GT_COMPUTE_DSS_ENABLE_EXT"),
> +	XE_REG_DESC(XE3P_XPC_GT_GEOMETRY_DSS_3,
> "GT_GEOMETRY_DSS_3"),
> +	XE_REG_DESC(XE3P_XPC_GT_COMPUTE_DSS_3,
> "GT_COMPUTE_DSS_3"), };
> +
> +static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(COPY_ENABLE_GTFS_GCD,
> "COPY_ENABLE_GTFS_GCD"), };
> +
> +static const struct xe_reg_desc xe3p_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"), };
> +
> +static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +};
> +
> +/**
> + * struct xe_reg_desc_list - Struct for register descriptor list
> + *
> + * This struct is used to reference the corresponding reglist of
> + * various component
> + */
> +struct xe_reg_desc_list {
> +	/** @regs: Pointer to an array of register descriptors. */
> +	const struct xe_reg_desc *regs;
> +	/** @num_regs: refernce for num regs in reg descriptor*/
> +	u32 num_regs;
> +};
> +
> +/**
> + * struct xe_gt_regset - Struct for register descriptor list for GT
> + *
> + * This struct is used to reference the corresponding reglist of
> + * GT and media GT
> + */
> +struct xe_gt_regset {
> +	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1]; };
> +
> +static const struct xe_gt_regset xe_fuse_regset =3D {
> +	.gt[XE_GT_TYPE_MAIN] =3D {
> +		.regs =3D xe3p_gt_fuse_reglist,
> +		.num_regs =3D ARRAY_SIZE(xe3p_gt_fuse_reglist),
> +	},
> +	.gt[XE_GT_TYPE_MEDIA] =3D {
> +		.regs =3D xe3p_media_gt_fuse_reglist,
> +		.num_regs =3D ARRAY_SIZE(xe3p_media_gt_fuse_reglist),
> +	},
> +};
> +
> +static const struct xe_gt_regset xe_rpm_regset =3D {
> +	.gt[XE_GT_TYPE_MAIN] =3D {
> +		.regs =3D xe3p_gt_rpm_reglist,
> +		.num_regs =3D ARRAY_SIZE(xe3p_gt_rpm_reglist),
> +	},
> +	.gt[XE_GT_TYPE_MEDIA] =3D {
> +		.regs =3D xe3p_media_gt_rpm_reglist,
> +		.num_regs =3D ARRAY_SIZE(xe3p_media_gt_rpm_reglist),
> +	},
> +};
> +
> +#define XE_GT_REG_LIST(_type, _gt_type) \
> +	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
> +
> +static void
> +xe_capture_reg_desc_list(struct xe_gt *gt,
> +			 struct xe_reg_dump_snapshot *dst,
> +			 const struct xe_reg_desc *src,
> +			 u32 count)
> +{
> +	u32 i;
> +
> +	for (i =3D 0; i < count; i++) {
> +		dst[i].reg =3D src[i].reg;
> +		dst[i].value =3D xe_mmio_read32(&gt->mmio, src[i].reg);
> +		dst[i].name =3D src[i].name;
> +	}
> +}
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_reg_snapshot_capture(struct xe_gt *gt,
> +			    const struct xe_reg_desc_list *reglist) {
> +	struct xe_dbg_reg_snapshot *snap;
> +
> +	if (!gt || !xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
> +		return NULL;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return NULL;
> +
> +	if (!reglist->regs || !reglist->num_regs)
> +		return NULL;
> +
> +	snap =3D kzalloc(struct_size(snap, regs, reglist->num_regs),
> GFP_ATOMIC);
> +	if (!snap)
> +		return NULL;
> +
> +	snap->num_regs =3D reglist->num_regs;
> +
> +	xe_capture_reg_desc_list(gt, snap->regs, reglist->regs,
> +reglist->num_regs);
> +
> +	return snap;
> +}
> +
> +static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
> +				      const struct xe_dbg_reg_snapshot *snap) {
> +	u32 i;
> +
> +	if (!snap)
> +		return;
> +
> +	for (i =3D 0; i < snap->num_regs; i++)
> +		drm_printf(p, " %s [0x%x] =3D 0x%08x\n",
> +			   snap->regs[i].name,
> +			   snap->regs[i].reg.addr,
> +			   snap->regs[i].value);
> +}
> +
> +static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
> +{
> +	kfree(snap);
> +}
> +
> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	xe_dbg_reg_snapshot_print(p, snap);
> +
> +	if (snap && snap->num_regs >=3D 2 &&
> +	    !(snap->regs[1].value & RENDER_POWERGATE_ENABLE))
> +		drm_puts(p, "render powergating appears not enabled\n"); }
> +

Can you think on following thing first. It looks like too many structs and =
apis :

Struct side: one array instead of two separate named structs. Something lik=
e below?
enum xe_dbg_regset_type {
    XE_DBG_REGSET_FUSE,
    XE_DBG_REGSET_RPM,
    XE_DBG_REGSET_MAX,
};

static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
    [XE_DBG_REGSET_FUSE] =3D {
        .gt[XE_GT_TYPE_MAIN]  =3D { xe3p_gt_fuse_reglist, ARRAY_SIZE(xe3p_g=
t_fuse_reglist) },
        .gt[XE_GT_TYPE_MEDIA] =3D { xe3p_media_gt_fuse_reglist, ARRAY_SIZE(=
xe3p_media_gt_fuse_reglist) },
    },
    [XE_DBG_REGSET_RPM] =3D {
        .gt[XE_GT_TYPE_MAIN]  =3D { xe3p_gt_rpm_reglist, ARRAY_SIZE(xe3p_gt=
_rpm_reglist) },
        .gt[XE_GT_TYPE_MEDIA] =3D { xe3p_media_gt_rpm_reglist, ARRAY_SIZE(x=
e3p_media_gt_rpm_reglist) },
    },
};

Capture side: one function instead of four.
static struct xe_dbg_reg_snapshot *
xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, enum xe_dbg_regset_type =
type,
               enum xe_gt_type gt_type)
{
    struct xe_gt *target_gt;

    if (!fault_gt || !fault_gt->tile)
        return NULL;

    target_gt =3D gt_type =3D=3D XE_GT_TYPE_MEDIA ? fault_gt->tile->media_g=
t
                         : fault_gt->tile->primary_gt;
    if (!target_gt)
        return NULL;

    return xe_dbg_reg_snapshot_capture_target(fault_gt, target_gt,
                          &xe_dbg_regsets[type].gt[gt_type]);
}

And then,
ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_FUSE, =
XE_GT_TYPE_MAIN);
ss->media_fuse   =3D xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_FUSE, =
XE_GT_TYPE_MEDIA);
ss->gt_rpm       =3D xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_RPM,  =
XE_GT_TYPE_MAIN);
ss->media_gt_rpm =3D xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_RPM,  =
XE_GT_TYPE_MEDIA);

Also please think something storage side also if possible to optimize.

> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_reg_snapshot_capture_target(struct xe_gt *fault_gt,
> +				   struct xe_gt *target_gt,
> +				   const struct xe_reg_desc_list *reglist) {
> +	if (!fault_gt || !target_gt)
> +		return NULL;
> +
> +	if (target_gt !=3D fault_gt) {
> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(target_gt),
> +					     XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> XE_FORCEWAKE_ALL))
> +			return NULL;
> +
> +		return xe_dbg_reg_snapshot_capture(target_gt, reglist);
> +	}
> +
> +	return xe_dbg_reg_snapshot_capture(target_gt, reglist); }
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_gt_fuse_snapshot_capture(struct xe_gt *gt) {
> +	if (!gt || !gt->tile || !gt->tile->primary_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(gt,
> +						  gt->tile->primary_gt,
> +						  XE_GT_REG_LIST(fuse,
> MAIN));
> +}
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_media_gt_fuse_snapshot_capture(struct xe_gt *gt) {
> +	if (!gt || !gt->tile || !gt->tile->media_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(gt,
> +						  gt->tile->media_gt,
> +						  XE_GT_REG_LIST(fuse,
> MEDIA));
> +}
> +
> +static struct xe_dbg_reg_snapshot *xe_gt_rpm_snapshot_capture(struct
> +xe_gt *gt) {
> +	if (!gt || !gt->tile || !gt->tile->primary_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(gt,
> +						  gt->tile->primary_gt,
> +						  XE_GT_REG_LIST(rpm,
> MAIN));
> +}
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_media_gt_rpm_snapshot_capture(struct xe_gt *gt) {
> +	if (!gt || !gt->tile || !gt->tile->media_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(gt,
> +						  gt->tile->media_gt,
> +						  XE_GT_REG_LIST(rpm,
> MEDIA));
> +}
> +
>  static struct xe_device *coredump_to_xe(const struct xe_devcoredump
> *coredump)  {
>  	return container_of(coredump, struct xe_device, devcoredump); @@
> -114,6 +343,15 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>=20
> +	drm_printf(&p, "\n**** GT Fuse Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->gt_fuse);
> +	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
> +	drm_printf(&p, "\n**** GT RPM Register Dump ****\n");
> +	xe_gt_rpm_snapshot_print(&p, ss->gt_rpm);
> +	drm_printf(&p, "\n**** Media GT RPM Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->media_gt_rpm);
> +
>  	drm_puts(&p, "\n**** GuC Log ****\n");
>  	xe_guc_log_snapshot_print(ss->guc.log, &p);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> @@ -149,6 +387,18 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_guc_ct_snapshot_free(ss->guc.ct);
>  	ss->guc.ct =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gt_fuse);
> +	ss->gt_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_fuse);
> +	ss->media_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->gt_rpm);
> +	ss->gt_rpm =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
> +	ss->media_gt_rpm =3D NULL;
> +
>  	if (!IS_ERR_OR_NULL(ss->gt))
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
> @@ -349,6 +599,11 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>=20
>  	cookie =3D dma_fence_begin_signalling();
>=20
> +	ss->gt_fuse =3D xe_gt_fuse_snapshot_capture(q->gt);
> +	ss->media_fuse =3D xe_media_gt_fuse_snapshot_capture(q->gt);
> +	ss->gt_rpm =3D xe_gt_rpm_snapshot_capture(q->gt);
> +	ss->media_gt_rpm =3D xe_media_gt_rpm_snapshot_capture(q->gt);
> +
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>  	ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index a174385a6d83..75f317a5fe36 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -14,6 +14,35 @@
>  struct xe_device;
>  struct xe_gt;
>=20
> +/**
> + * struct xe_reg_dump_snapshot - dump register snapshot
> + *
> + * This struct is used as generic reg dump snapshot in the format of
> + * register, its value and its name for human readable format.
> + */
> +struct xe_reg_dump_snapshot {
> +	/** @reg: xe register structure*/
> +	struct xe_reg reg;
> +	/** @value: Value of the register*/
> +	u32 value;
> +	/** @name: Name of the register */
> +	const char *name;
> +};
> +
> +/**
> + * struct xe_dbg_reg_snapshot - Register snapshot
> + *
> + * This struct contains the register values captured at the time of the =
crash.
> + * It is used to store the register values in a human-readable format
> +for
> + * debugging purposes.
> + */
> +struct xe_dbg_reg_snapshot {
> +	/** @num_regs: Number of registers needed for capture. */
> +	u32 num_regs;
> +	/** @regs: Pointer to an array of register dump snapshot. */
> +	struct xe_reg_dump_snapshot regs[];
> +};
> +
>  /**
>   * struct xe_devcoredump_snapshot - Crash snapshot
>   *
> @@ -35,6 +64,16 @@ struct xe_devcoredump_snapshot {
>=20
>  	/** @gt: Affected GT, used by forcewake for delayed capture */
>  	struct xe_gt *gt;
> +
> +	/** @gt_fuse: Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *gt_fuse;
> +	/** @media_fuse: Media Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *media_fuse;
> +	/** @gt_rpm: GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *gt_rpm;
> +	/** @media_gt_rpm: Media GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *media_gt_rpm;
> +
>  	/** @work: Workqueue for deferred capture outside of signaling
> context */
>  	struct work_struct work;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 6c4cfaebc44a..e05951b6988b
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -260,6 +260,11 @@ static inline bool
> xe_debug_page_size_mode_is_mixed(struct xe_device *xe)  }  #endif
>=20
> +static inline bool xe_dbg_reg_snapshot_is_supported(struct xe_device
> +*xe) {
> +	return (GRAPHICS_VER(xe) >=3D 35);

Since when these dbg registers got introduced, this almost starts from NVL-=
S based on your check.

Tejas
> +}
> +
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long
> method);  void xe_device_declare_wedged(struct xe_device *xe);  int
> xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> --
> 2.43.0

