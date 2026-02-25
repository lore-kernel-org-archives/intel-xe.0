Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F90FD45F1
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 22:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911910E076;
	Wed, 25 Feb 2026 22:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLv7RGbv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891E10E076
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772057958; x=1803593958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X9hhBg7XANGdiE5oKght+9/oM7iuDR29v2LXO83UGnQ=;
 b=FLv7RGbvF/XaN7IDUVTO9/pVw5R4IuSkCZg0V1AZMsoWPgk2lFwY6rNa
 adpZkc3s+yYkJGLqrsacdx2V1U/iyv8DglHOjYV27LlcnjFwu30kYwQHI
 O20489Q6abJu/ecd8R2flMeXVH5uxaEkJ2LAcl4H0PRtT0KUtlYMthpKL
 FbSc+eo3EBk3FuXTfWCXwyI1tdkMkWiwH6bj4McfRQiYCRwRa1Pz+hPyC
 nlOc2DbB01m41sm65HMqsAeg+Tl90BF7Q7cFJvVDWr3BlYyVQvoq8ye5m
 urCbyVajUhLkkG/CrEiKVbZ1S1QHtFofpAsXgNoi25zzl91wLrrjSUN8W Q==;
X-CSE-ConnectionGUID: mD3dbq0oReSOD8q6VC7Lcg==
X-CSE-MsgGUID: af7Z+gS6S+uFEfheaKQG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84567930"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="84567930"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:19:16 -0800
X-CSE-ConnectionGUID: iYwIrT0USnWmyT5ym1eFIA==
X-CSE-MsgGUID: B99/HdAZTFqKm3BDc/8gRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="214629340"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:19:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:19:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 14:19:15 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:19:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOBQHdxS/cAOUNS42wALrrHZYyBe9TrFKgYhtHoVb/KETiiy02Y3THeBUDbqE+OmmlkxP7wwSa3QjlOpUHnN6NNvH1kDs43CoHKGudaSsBGxbNasMpMSyGfq2Usf4mAZGRt4R0FzbjdKf66hkDFyWwhbPBr0/g0rDWbfG4wBbov6eohxeONfgAwacXwh2UCRLsJ4TBZr+p7Ld0Hb0xJamTSWOPkfgn6dbBvU2hGjlfWA5e7++F0X129vB5mgfsfkMye4vijhTR45ll+RaqN05+fOlnFN297nILAh15z6cF97Ob46aDWTI4TyvdyJTgg5Ev++485tZSrMt48xVVzGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OM+BQYOdy3Kte5epf/3aUlRzK/yNo0eft9AHDOLbNQ=;
 b=hZ6LyuLf+oZ8EJJ8M3CFnUZNIGCxkqo5OzYKweM+ua53PdH9fVQ4OeEBCP0n5oxxn51C/MV4s3vfaS3xTd5YAc2SeMwZWUWXzBSEDBASJHubRDsL73mbYw8ITt0iNJICHBXtuSe00EIVkOP5nLW58SsHNlvpsMoeWBLC9GwDN04ciR5lbK7FGIMtTFzceKc2H0Q+JAjrU/J3MftdOxmsGapOIDNBo1DIWvfb2YSURKE5KIe80KoyhXw+s1DwpXDYJkoayXBom3NyNDm3gZXGbpsTXxAUsgZFPdceNVNNWOGK7kH5uaNqeqPksjcGMzFJIZfF6E00UUO6+rvrCrODHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5450.namprd11.prod.outlook.com (2603:10b6:408:11f::5)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 22:19:08 +0000
Received: from BN9PR11MB5450.namprd11.prod.outlook.com
 ([fe80::7e6c:d915:2899:6628]) by BN9PR11MB5450.namprd11.prod.outlook.com
 ([fe80::7e6c:d915:2899:6628%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 22:19:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe3p_xpc: Drop stale MCR steering TODO comment
Thread-Topic: [PATCH] drm/xe/xe3p_xpc: Drop stale MCR steering TODO comment
Thread-Index: AQHcppaas2SSilnYz0qTOKkuvFgXXbWT+2kA
Date: Wed, 25 Feb 2026 22:19:08 +0000
Message-ID: <BN9PR11MB54506ACF0AC02000AE1EF092EA75A@BN9PR11MB5450.namprd11.prod.outlook.com>
References: <20260225203719.3310570-2-matthew.d.roper@intel.com>
In-Reply-To: <20260225203719.3310570-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5450:EE_|SA2PR11MB5130:EE_
x-ms-office365-filtering-correlation-id: 1e8901f2-91a0-4783-11eb-08de74bbe544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: ZRNBIGyGwfj8hVbPl2U8YfUEl8J7jA7r+l1LkJEoN04MjNCns0wCfq20xMpOMG8yvVMgwXU5ke0W/nWcKbk0y6K/+yLqNnke0reqApkcSuQ5xB2Clo0vxTeONURI22gew5VcAvcSDvPo8MtNbCeU2+RCWDymuM1tZJP+MjcQkbg4xW+ZyvZB+BS9MgUYY+hpkHWqW5LWuieir6Dlokq5RszhuGjgx/g83HchMJy6O9Cco7PVBSYujE6sv2e1I7otAVmxwLHqXDymJYDRIGp+Mbyp4Sslrhv/4w2sMg+OY/o1wTcf/GiUdxs0Ku/JKDrqjwR7CTBlC68r0FW7UePTkG7dV67nb3XhJkLLpA43p5Gf1JFk+v8DzGH5agWSwJfluxGpKTpexftN/v017L9yMF4TmSPolgWW+XdEz8jJ5TfV6N/UFM6lw1UBYkT7NFS6bFzI8edNggbub3e0UuXxzVPKnXtTRMwdCD12ijkZygCMHqDJbADkic5ySBf/Ycpds2PIzXYucEfwCgQSzoH0zggoVkHlU1jPbruvNseNVnpI0PeD0Tp6eOrv5LQClGvhr8Y/71xn+1cqD9LqB6lPnZ2tiFC4GyatidvYUmWYoLY9lH8sOTXUQsMAhfNUMzy6LByZR/osdnKh1vBD9PSYa8UPlqUUq4cA2x8oyzAkoq9XCqfIyerg61B6QNOLlLB1XEYouUMF8Ttn1Jf3PoKEiyYhSZtemOW+ZB/KhLARHYXdKJNqwGtsQpeLyyfpMw8n+cd7FZ6oBEVxH1+FQzCndNfVcpjARTyc0N5XtyG7Za0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+biwE6C11WXpxM+H+oPyUJmYX2pk9UA1IlHUW5Wt6PmlB8MB0ldjukQA/7G?=
 =?us-ascii?Q?gkDiCrvKbScrs3K0oOVQe++py0TNVkR8rn7ceaf15fs1hslGffECpqdNyiNQ?=
 =?us-ascii?Q?0G/kH/wu53+QoScahqnv8Q0Ukam6B3bLdnJLbWqlfgEKVJC6K0EZIIl8bNQv?=
 =?us-ascii?Q?sJkhCSS1Hnb14c+L39wCl6iLFIWLnReKrFecD7muCE51lbMrXim27OGP8X2Z?=
 =?us-ascii?Q?sd3zk9pMTBoY1Db2SQ4umVO2EPai5qjMK2Oyg0vSNq5gdOFhGrkyz/4fxYLU?=
 =?us-ascii?Q?2yLwTtWQUD3T/GtX6zEgPjOM1DOHg2J0qhV2WbhSJxKZV2JnXb5lXR9aRdOD?=
 =?us-ascii?Q?2LBU73oZnjXPqITCA+M8Osd+8aV1n8GrBUMCCRYlfHPdcMOMo5Zm/RnBnFcW?=
 =?us-ascii?Q?/JrhkGWTgk5sGkWqmTY2/RMFEEM2Q6me09a4RAtSNM76NzHcpreRZzpX+Yy4?=
 =?us-ascii?Q?hn4AgrSIDuO38LfSH+KvxWSmgZptpjS795Hsd4Rr6gPs6TPYHizgZiCCs9Gs?=
 =?us-ascii?Q?3Zg16lh/Q7rKTqPF4aN+5t9W5JH65zoPoJLavPhwupCMqL2Q+ojG7elqpJLe?=
 =?us-ascii?Q?XHZ5EKrRVbhR8ywynyojJ0tzq9x76ecfh4zGk7CMFsZqpBUfalL2X7diiLX1?=
 =?us-ascii?Q?Wlkq7N2BGIHjUMfm6+Ul40goqb5cvmYHXfoXNZGLSCgDNOeIiPTi/NI5SX9y?=
 =?us-ascii?Q?WlNRdiinE6A7Dr0Zlpl9KR8hOGGmBgD8TkI3jeK6ZIV3bWKSfUIx4UotWJ2c?=
 =?us-ascii?Q?mUOR0mFWFquNq7gsn4RruaiVwFErAyMh5KuCvTgglHNFsKbotzu4nH3xTOyd?=
 =?us-ascii?Q?IKSU4abpZl+h/0BCaHEX7BDkq7jBcAspSZqKG0r9AJy96rJPzvYfGHwLM4Q2?=
 =?us-ascii?Q?8YXmrGkGLvS86jx5vmDUo17ZWfnQ8UMq/GZaS79kCYvHIodR06o8hP/kfR6A?=
 =?us-ascii?Q?EXiZA93wadNA9HRK/F1Q6L5IV6O9nLl5QzRMwJOe/rVXrZhwhzmAqEby1Mir?=
 =?us-ascii?Q?u9Me4E9O82FVABs/z1sQdMq62onMCsDcfGBttC09YtEg6//0xTxBPHQvCmDM?=
 =?us-ascii?Q?tKfDDU1PRyt9FOOtltJ9gO56uvQNBqEmH2EdUEkAnnC0XR144LplFlqqsXaQ?=
 =?us-ascii?Q?SYVU+5cMiDSK7RfSOeS4+HLfUPHCFq9mttflvSqrfDSlx9m1eNSfxYN2yLC5?=
 =?us-ascii?Q?46lzSL4566+UBhOnbTpmYwtZg0HfrOIgwsGSrA72q7K2krXGbXzxCJ1X/nTw?=
 =?us-ascii?Q?us2Uf8M9iFxcLvNVGV+SCrojJb3BGveqVVNXugqpFwLstYnxqd5+2OBr8DX8?=
 =?us-ascii?Q?+mmQmdVOOKgFCGzt2WPFKk2tMyHrK2WySBfQSfiVMKEBgJz5qT/qAWqxA4Ii?=
 =?us-ascii?Q?X/8Wt+sctu4xViHlWqhE0v7x5jG1E1fC4JFnQGdANyJLAnJHxTHdXAobrQWT?=
 =?us-ascii?Q?+I/fnYcYjWwrOI2qyMTbeIyfz36ku4Ub38GhlTxrb5QJGfekSodbpzYz8utO?=
 =?us-ascii?Q?78QRItW3SE3uLB8Pdz44oUMFZmlmEmho/+xgpX2AS94DTUwNttU1PzedbJcH?=
 =?us-ascii?Q?fc/vDEUVoH82cRELi23lQKhiEspYw+wgISiacSnTP7V3rTTHXaDMLhuKmh+k?=
 =?us-ascii?Q?1Ol4yvgYQdflSKh4Kfmf5aHgP3GvOqpvdMpYL5lw/uqi6tDuF03VOBBGV/3B?=
 =?us-ascii?Q?M4eeSkmRR9Va9p83EaNuE+cz9AFNYCPAFI0ycRkikcb81LBKKdDNiSQ22eIP?=
 =?us-ascii?Q?hbUC0w5CRQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8901f2-91a0-4783-11eb-08de74bbe544
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 22:19:08.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2qubSwTTyG7V2JtCjwYfugR4Wo1EgdMD0aeDV41USo2TawoeQlv5RuHLO356WFnwWtC0hOMgjJ9d2Oayhphuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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

On Wed, Feb 25, 2026 12:37 PM Matt Roper wrote:
> Proper steering+termination for Xe3p_XPC NODE and BANK multicast ranges
> was added in commit 6d5511e56b2d ("drm/xe/xe3p_xpc: Add MCR steering
> for NODE and L3BANK ranges") but we forgot to remove the corresponding
> TODO comment at the top of the block.  Drop it now to avoid confusion.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> b/drivers/gpu/drm/xe/xe_gt_mcr.c index 8989d02ea84d..7c6f039c880d
> 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -532,12 +532,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  		}
>  	} else {
>  		if (GRAPHICS_VERx100(xe) =3D=3D 3511) {
> -			/*
> -			 * TODO: there are some ranges in bspec with missing
> -			 * termination: [0x00B000, 0x00B0FF] and
> -			 * [0x00D880, 0x00D8FF] (NODE); [0x00B100,
> 0x00B3FF]
> -			 * (L3BANK). Update them here once bspec is
> updated.
> -			 */
>  			gt->steering[DSS].ranges =3D
> xe3p_xpc_xecore_steering_table;
>  			gt->steering[GAM1].ranges =3D
> xe3p_xpc_gam_grp1_steering_table;
>  			gt->steering[INSTANCE0].ranges =3D
> xe3p_xpc_instance0_steering_table;
> --
> 2.53.0

