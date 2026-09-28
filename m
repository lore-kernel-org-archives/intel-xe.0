Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28212C9833F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 13:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB12810E8AD;
	Mon, 28 Sep 2026 13:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnKTwwVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B0110E8AD;
 Mon, 28 Sep 2026 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790601581; x=1822137581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vtfWo5CIV+nhYWTWM32DxupK4XKsPONg+4YzXkhvqm0=;
 b=SnKTwwVZlhfDLu6WZpOLAIEfGe4LB/5hpIR12OKH2R9kmkHnLNv/Pn0/
 EjxnYbod1EUCRNorxFqfWjd7bjsnb21a/0hxUB91ztMQQS+nM1NpyraSD
 4/YU3Mhuh2oifvEqYnMmq9KotcGg0+ruMNhSeXizU4t8iACtcr3ZaK9ci
 hPH09L3/6MEpTpSLaJzQ6dqkmUXkT5fOvh6OfAn/nq5ATcaybW29bSkGx
 aXPJ7TGdlcv7n30Bj4aNDA1VYjJpKG/jgzbx5PpBfbRpsfta3oJ9r2NPN
 1+Gn+UJa9wAtCQ3UFL/3S4r3ojrsYINkqaRURRITQHbk7/eo03gs7T7nr g==;
X-CSE-ConnectionGUID: pCLdVK1OTWaKREbBOlgD3A==
X-CSE-MsgGUID: wA+O4DsbSGOWlRc1/V4NpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="95113643"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="95113643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 06:19:41 -0700
X-CSE-ConnectionGUID: 5kgzDwecQaGtHRZLT7IWNQ==
X-CSE-MsgGUID: 8QtJGy26TCW7ZPK5+x6YQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="271537924"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 06:19:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 06:19:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 06:19:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 06:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWr2Ot6kwK9+iWQF6zR1v3eYyba2BzLg0KceYj9iLiLCtwysuyptDtDjy99igq00R8X6g2k/6d9TvQOuNJmXrlWYza9bkyMyUnG+MMowsQQ8WvcLaN6W9NWFUp25e7cUzkvMI1wU7TOxi4eRYg0kQ9ff+W47Tx6KCfJRG2gWFq/xDVfodNiNLGkAO7V7/ysxIL6TokywPmrcn4BR833aYk8tmwU5q4RFurcPLdEkF5xrM1ssNWtqo5SVa/K8GiJS9rJhwk1v4NTK8vDROQYgoTmjsojXb/ptQtdp0SPjwW+7BWTJ+BM1tZtbasO0ow6pH1ezhPzlpLm3IsW45SJH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpYmkCA5nZJsmF97ESeXuAzyX1jJGSu97wb6uEtitH4=;
 b=aYT8c4XqieLUphv0sWgqNgCfRRRA/PfGhCGgATcWKIiJxSUu/ynd7waYb4J06VgtuwPOJqAfZkp+D6zd4g0zc7VRofxCg++2tsUNohfK8gUwmsksg8NT3b52XFsDGKry8k2knbQxtKoo4YCGDCXj6MbIuqKX0OJNtbCwisp8xVUnXGiIJ7IFjrLTniPskKfTEZce3AECFJ/d9jAgQQv/JqQ4ytzK2X4Rg+Le7ikTZSlczUwVqqaJgSx9RvCENnwqebB4wJneRFCOIor3klkxIJy5Y4CI89s709C+3UbcHao9/mo3QvT1uC6FNnYVcfqP9FsgDDcGHUgfeZ7ycPPz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3787.namprd11.prod.outlook.com (2603:10b6:5:143::10)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:19:38 +0000
Received: from DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc]) by DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:19:38 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 1/2] drm/i915/dmc: Harden DMC firmware payload parsing
Thread-Topic: [PATCH v5 1/2] drm/i915/dmc: Harden DMC firmware payload parsing
Thread-Index: AQHdSpdfLyDBfMe1LUqdk1Ve4VugBLbkAr1w
Date: Mon, 28 Sep 2026 13:19:37 +0000
Message-ID: <DM6PR11MB3787E3E264884E9D89ABCA0DB28D2@DM6PR11MB3787.namprd11.prod.outlook.com>
References: <20260922133535.3180973-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260922133535.3180973-5-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260922133535.3180973-5-dibin.moolakadan.subrahmanian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3787:EE_|PH0PR11MB5063:EE_
x-ms-office365-filtering-correlation-id: ade68f5f-8cf2-4030-ce8a-08df1d6325a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 21x54NNs+jcuaLLlLabsoZ+INiGqYoYYlbGg/ra3hoIMJjnXXSyUMOONTXZNESFFVUsRCmP8WqbdQnEvR1nLlj9EK9eqbTrDC4gDudLwopdIyahhBMtAYNf1z8hE5egj1LVtR1rsoCgp+8wYRnFj+uo6Nf0bSL9Zs349+5R5D68DKraj0juoIEyjk0HWvfXhrSoVnaa01y40n0sQbMr2Jd0Sd3r51Ik7r6JTQj468S6M3xoqY8apNZL2xDybC902T7rLueTjCMwOGOREn/4MehiXFZ0/qXBOaDDusQPmUD8RAln91kjo1sKkatXJ0BcaeoSiDQCCyFovxfgK5Tvvhq8kT6Y4a/mYI0YN+sH+xOBESrdnjN1UQgXGqNbPCCs0pH+6senymzLM4HAn/YqlaxVnv0ysuqZeGW7Mch8Gg2NuzhFMcwPg098BfvxWa1/srJDQ7ZsWlofMFpLlgzIu2e9Xv4hM1GHCTAvWkVtAQG02Irh/sOCCULI9JFmoALs8SCFDe7XCZbIPtLtx73Ah58RspdI6JT/Ums09td1vwdw5X5f/a/nDcO0+sk+ChKlpAR5d7WGrC8EmHZ4qxfQzDcDaLNv9DeiFZHzKXKBAbOHiEBt7BPDmMlysQAHJwCu/0EYa9DfmWh0ZU7nMQ4uT0xJ1B4m7gfntyfK7dMNcGGdo3bRlWobuaVEQzRoCgYaHrGG8WpA8gxwJ6MLQZUkPum/OH74EAYroiBSxoi0ci5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ksgYYCZ9hpdiElvaz9cSspty5WgkqWL9vvrZp2EixpfgZpyNPWCMPQ8Mhlba?=
 =?us-ascii?Q?8h04SdT2QKJwL5siDOp2LTSJFGuW85sADl/ex/iF5Z9h9aK0NgPw6DtfSfcF?=
 =?us-ascii?Q?odH56KLzDvB2rL68wyfw/hxnLXsGp1qjuRVAen1zvPLVKYfdGYhfh864RnZG?=
 =?us-ascii?Q?j3Zh1frLeUdVySXNwObhMBUZpZmGUqlRsfvn4cM91xQDVpsC4ttjCayl0FP2?=
 =?us-ascii?Q?vA4203dni4ouw/kiHFHzsltVoGq34gcMT8+UzBF5XfwcyHlvAdzV/OxRQS+E?=
 =?us-ascii?Q?k5LvH/ON8AayuigjRC/v7qJgDLAIEQU3TjkB4Gn3dKRRwy851wA++hop0tRC?=
 =?us-ascii?Q?v5pC2X59RovJZJirx6ac0qpLvitF/C8xlDy6mpKLdZK6jSG8gLa+MFb5/kGS?=
 =?us-ascii?Q?CB19P0hq1ip8qbnyiauVmvTkvu5EAdDl+JTFsWpbhoMNzrtl+VTFt27g/3f7?=
 =?us-ascii?Q?xHaHZSwKAhnl5qdEEymz7TmQbUb/d7iUeXS3uCeo0IH28DJ+8E+kzhPzs2NN?=
 =?us-ascii?Q?BP4SV3D6ekKFz20nd1Q/l6R0LnHoZcGhketyq3bYQXVAntSqVt3aFvRHtDx6?=
 =?us-ascii?Q?MXThI1kFzSWSP1NbnYRDWuFQYKc+LsUpYUh3e2sLG807JT2QyVYfkuPl9JMq?=
 =?us-ascii?Q?v/nOJWNU4Vt3AMpaCmXo2BTdvjqJ0KBNV7nTtGLQEdSEa4mTcFRd40edYASr?=
 =?us-ascii?Q?LMc5D5Gsr7ozSoIi3gmP4GwoBQ5VIlzVDXJWC0wxdmnTYI1dMvUc0sl22KvP?=
 =?us-ascii?Q?lFOtTVqrtn0XklWbi+yQoduNdRyKX4bUlm/pfvKbGHEhJnNz1GNYnx4ao9bh?=
 =?us-ascii?Q?dPq/AiHKIQ87mZ8GlwkJMfWWKkE3YY+QRUhH+hyCs4nb+Jbw7Bp0zFiWoDFQ?=
 =?us-ascii?Q?1PIzfPCkY6mu2GoWE+ucYGRpXqDrWbzOHwRPbICp59hS0WzLBzwFBVWujQpX?=
 =?us-ascii?Q?EJa1koPb0Bzpy7k5pGDhcjyQ9hSAxlbNxb5fWHKA7BLtfwmq5qS2iUBYkH9i?=
 =?us-ascii?Q?y3sTY6E2c8vY9cDxKc1+dQgR3RnBC6DCr1tdHW6h9roXpn9QPvn4MT+Ea3pu?=
 =?us-ascii?Q?F4qTkrx2xUuIwYsw0UilWR44ncya1+BPlggT2e4x6wm9wgoAThhunZszecyQ?=
 =?us-ascii?Q?Bn3WBx2VTp8/GcqjDDHKBMt0feJnpM9QucsKXOgGpatjMlPGPvC0kLA0qE6h?=
 =?us-ascii?Q?swQkBmpIl8kvcNcAuKdVbLiDOJtcUw9c1+/MDryOr9cxrFpBmd3cgWpH/LmM?=
 =?us-ascii?Q?G9aDDaxM8EclzTc10Fglfb2Vx9P/BY4QLvjqZHHhCD9YUhw9XFpOyCmMHiPP?=
 =?us-ascii?Q?6EOTYe2mTcnt5mBiwxw38ttdaxnd+1q/L0xH7tFD/z7uEQ+bji2S+RYaFbfl?=
 =?us-ascii?Q?zn7qjnHQHX7FiN1GfHW9riKCh1rhBHHPI+FPu+bBwRBMnwlVh6eyzK81bjxN?=
 =?us-ascii?Q?pz3Nqj1w/TRBlWitEQotgCiZmKYcmSrEloTTRL9TTU+wqWmtx90HmVLvSCqW?=
 =?us-ascii?Q?CmpqmPCJoePaap44EyRAc5b9XFIAGW2BOj5BmwpTTPfmmTqSrImxgAYjI+jA?=
 =?us-ascii?Q?y+DfmdZkKNbqnrZWt+0UtEnl22GYPtosPGec4XV0hlXNt0hAqjLdoBGag31T?=
 =?us-ascii?Q?zrGxDTO2RkEfb2Vl0+atWAG82Ejf12e1xcjvAMi/rozg4Z/sqeQD2nf0XmL0?=
 =?us-ascii?Q?ZZUTEQ6fz3IVX29DtNmLrmi0bPmtB0rUUPR3iYFgCfKMzhgL+W68/xlcI6Vf?=
 =?us-ascii?Q?kNE0JWNBzIy7BoyZlxJueQrj3jo6fD8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WKeQKXcMtP/dkcbSHt4559RV2fiY+f8x+XNhnYGXg49M1GahEh2K1q+WaylEGbpWz9BxWGez7nYGzDC7Sx0uX0ZNEz12itOoDu+q3yvVpyGcRZcheuCqXRfPv6s5BduOaVE6NamXeZYz5et/2mxmiduglVq2137kLLNDbhQYBBWmQhIwYttLbj63rdoVH5Gp3mteMFdRljPnd1Ij0pXEwA5x3nntwaW97rq9l/IM5R6Mh9yeXd2px4hNN41yGVRHNp1PXVswtkgw8P54MhiymugKG5HwangT+pGm/KNryH021ycLvSmCQKGJhYMRSwzRhxvj7kBD/mgTBum4cbJoYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade68f5f-8cf2-4030-ce8a-08df1d6325a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 13:19:37.9616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QW6d+/F8+GZF8n2fC1M2K7F3K6MpUnplU+p6dgc43NN1Km9WYMqdgIY1iroLeK9uSKqs7KJg4I7Rm4TYqs2QVeUHBt63zhAzA9BfYQf7Kd5exIdW5byzkTylENonBg+v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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
> From: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> Sent: 22 September 2026 19:06
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> jani.nikula@linux.intel.com
> Subject: [PATCH v5 1/2] drm/i915/dmc: Harden DMC firmware payload
> parsing
>=20
> Validate the conversion of the DMC firmware size from dwords to bytes usi=
ng
> check_mul_overflow() before calculating the firmware payload size.
>=20
> Reject zero-length payloads and zero MMIO counts in the DMC firmware
> header so malformed firmware is caught early. Also set dmc_fw_size only a=
fter
> the payload allocation succeeds.
>=20
> Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR
> firmware.")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude-Code:Sonnet-5
> Signed-off-by: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
> b/drivers/gpu/drm/i915/display/intel_dmc.c
> index a191eee240d9..725481012578 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1120,7 +1120,7 @@ static u32 parse_dmc_fw_header(struct intel_dmc
> *dmc,
>  	}
>=20
>  	/* Cache the dmc header info. */
> -	if (mmio_count > mmio_count_max) {
> +	if (!mmio_count || mmio_count > mmio_count_max) {
>  		drm_err(display->drm, "DMC firmware has wrong mmio
> count %u\n", mmio_count);
>  		return 0;
>  	}
> @@ -1166,13 +1166,21 @@ static u32 parse_dmc_fw_header(struct
> intel_dmc *dmc,
>  			    disable_dmc_evt(display, dmc_id, dmc_info-
> >mmioaddr[i],
>  					    dmc_info->mmiodata[i]) ? "
> (disabling)" : "");
>  	}
> -	dmc_info->mmio_count =3D mmio_count;
> -	dmc_info->start_mmioaddr =3D start_mmioaddr;
>=20
>  	rem_size -=3D header_len_bytes;
>=20
>  	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> -	payload_size =3D dmc_header->fw_size * 4;
> +	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {
> +		drm_err(display->drm, "DMC fw_size too large (%u
> dwords)\n",
> +			dmc_header->fw_size);
> +		return 0;
> +	}
> +
> +	if (!payload_size) {
> +		drm_err(display->drm, "DMC firmware has empty
> payload\n");
> +		return 0;
> +	}
> +
>  	if (rem_size < payload_size)
>  		goto error_truncated;
>=20
> @@ -1180,12 +1188,15 @@ static u32 parse_dmc_fw_header(struct
> intel_dmc *dmc,
>  		drm_err(display->drm, "DMC FW too big (%u bytes)\n",
> payload_size);
>  		return 0;
>  	}
> -	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
>=20
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);
>  	if (!dmc_info->payload)
>  		return 0;
>=20
> +	dmc_info->mmio_count =3D mmio_count;
> +	dmc_info->start_mmioaddr =3D start_mmioaddr;
> +	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
> +


Changes LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>


>  	payload =3D (u8 *)(dmc_header) + header_len_bytes;
>  	memcpy(dmc_info->payload, payload, payload_size);
>=20
> --
> 2.43.0

