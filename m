Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF95FC79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9899E10EA17;
	Thu, 10 Sep 2026 21:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5QM27Pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEBF10EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789077552; x=1820613552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lLtSidHfQ2nwDcGqZkfDK6gOb/0wvarey9OW2RcgHNk=;
 b=G5QM27PzGYxJP2CIqAG6Hg17FEvt/LPm8ru2j4Orx2of+YQ9G7Vx8ix5
 RzjJOIHUJ8EpEEcVzyMStTbYPzmy/3ftK48v8tXZPrS2bTI62FJgSxCLx
 gbJ9oZ4kweqIm+YJFvE1pWXZ3Xb+x/iFEB3VhaObL2sdtwLc3mRXbs+Yh
 CUkQ3Qdbu0nxBAiHAKbza5Ps4gXcI/Y+2vCOygtjtAFfbeR5w3A8Sx6j9
 ypde070J8HICZydRMEd5zaE+tv2eN6uWvK5UKs3yaOLQfkZpJIGk1m6t0
 y9Ak/uTbFEM1etoerbHxAwece7ire/QzF3j+Tenm2IZumKevN5jpqKgaM A==;
X-CSE-ConnectionGUID: tXONXvuGSrK4RgFQNA7oFw==
X-CSE-MsgGUID: PwXez9wMS/OKu/HB4rdcUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99870722"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="99870722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:59:11 -0700
X-CSE-ConnectionGUID: ofTJwRlEQZ6+ncoPJTX9UQ==
X-CSE-MsgGUID: CIMdXFfdSEa8wyLo+uRWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="276988804"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:59:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:59:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:59:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouF1+8jckudS4vNNUIxemQ2W69y8jAnVy9x11j6mv/ul/mzLUSlgJbpfVMgDbU1aPxFcFMOnlOOdy4Ce2fsw25k5Uc7ZTvPP0SvgU3ws+7x17TFUUQJgWmp10POS48gZBNxfb17vJ3XJGVv/gE4OPI/kFK2wLswo0GRoeEiM+RO89ZkWFqizWaT5IWLrBLIQqd7sVe5AlaHPGumETt5AQ2cImGp4vR7A5R4h1h+caH64g5K5hR+++K3Xade/QYp2GdWMgzWz4WzQC/HBV3bK9Rsd7fIfWjIQBUZD/v2M0TxzE+cBxB8kOpcCpXlrgR5krj8oKXFFVq41J1u512B/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9ZLQ6wyuEjedvLpJ04hl8iOJaqw1WmyErelLoEijnE=;
 b=tyL5NvagYqWJdN28Gm85RmJDm+5LTrAyocVesn+pdbPuV1apU8/avl5nmrlly/S/IriMqnccQyHgZYerPL34YZRxCxXenuTspgkAfnrvhi+N4MVNkz/OzAvdxzkmNWhrmzds2R42h8bE0vW1rWKAmAWKmzf/GUZJ3mJYL91o7zPDO3+FSfCiMk20TrTXb15ImAEilDJmqhnrsZIYKQEnPYWEQgZAzv530Rfq2NeIp6XFS21Nm4NqoH6alkvPMVoICZqnnsB2OJXDn3ZXtMWvI3+r9skcOGO3Kw3MTci6zA24UuBtArq/vxKSZvzMWmWvaWnoYOr1HWPcypsLH3R9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Thu, 10 Sep
 2026 21:59:08 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 21:59:08 +0000
Date: Thu, 10 Sep 2026 17:59:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/pcode: Increase default pcode mailbox
 timeout to 10ms
Message-ID: <aqMoJ4bePB4G8zJG@intel.com>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
 <20260907083520.192418-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907083520.192418-2-karthik.poosa@intel.com>
X-ClientProxiedBy: YT4PR01CA0272.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::24) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa0ac73-dee2-48c5-8dc2-08df0f86bcbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: utQwffTNCZGrSgfbbSeZmzVjLr33n3VzApFviOBJSxj2v3wSvscBQ2mIKfDRZCHapW1U8UTQjMTw5FYo8hfITx2rk9ZGKR0z3HG+oNVr3hd1e6H4CmXD2jz1ToX0hCiQi75JQK90k7CqADh9MzJfjAgYQ940diGwC+R9WifRY/xby3J94f33NK5FqhSEuHwdXYbwkDQatiFzgef0TTSj6pQkAt/NuT4IxLERp6xi3kI4WXd1fGAeeGnK020InpQlmivqgAAKVZgfuZbPWlSNzHe4nM+HnFGaWtaJ7XXA95ofByR8tFcbJjUscQvWQShC8rCLL142RxbkzBSd3Xn/TxiPguWRCoOGJw6OGVE08VfCXvLkDGfaPuI/Y5dbUkXINlQWTXY6PbaaCD6gtC15s6sPNRP8ksgaHOJ9jsLUnNQZCkYeITV7+gUpVUwN36r+eJj4QRzxpXXuOSlGdUuUbtrOQQKbKm4Nms0xUcOETdxromk0b5wE+fQhObSPoNVc8bYBKqqxlF80Y/iS3D4iulxqNSyv1/UZa4+Zo6NF9E1EB8sTwjLwf1lJEQ10un6c1W6cmV/cWoY+qAa6TvI4NBixAxsemWAI/4jm43QbHS4K2B+tbmYqmArAJpAYMTfpj/KoKYDPJ+Gq01bFlzIvxM2Oh1lsU1Mvghu8x4I247M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVaOrVYwekJ0NjR32eiUGEUyDh4FHAGteFz0449GgEsJK/yhBxFyEWBP87eY?=
 =?us-ascii?Q?xiXKNytJ6Xk5q6sGU38Ze2oTvFObsyiPOV/2796iCB1NPfTDeiKrJfSZT/4m?=
 =?us-ascii?Q?ngMTRCVbCD+ywBIAmV1XLLs681LOwFWy1mcoJEHEAYKo4Fh1TnHdzb1qDtmP?=
 =?us-ascii?Q?23Qz/5n6XtjkVtnsRMPAQOaQ7msaeLqBYDwqYz/Ee+2PUvsj1qFwXRo5BDY2?=
 =?us-ascii?Q?FhSK7Ez6NQeeEm3HmfQU2io+JRCbl8l6U6av13RpnQ17yQLojKEAStMdRkRI?=
 =?us-ascii?Q?8AO1lpZ2pn7eWABYITFC8lWO/jOmWd3LsKspRi0iSd7VRLQ3PvbD6Mw73p0G?=
 =?us-ascii?Q?flz4anwI1hpxB4sxe1YwP/ib0P8Cbi/Zre4UKIuJQJYAxExlzpBvYhc899Kb?=
 =?us-ascii?Q?uYtorH8j4MLUM86bG7C1oJJ28w3CLv/xY2ClKvh+Z6h9qkSK01gHPlHwatyP?=
 =?us-ascii?Q?6gBBfODvNhc/vikRVYFAcyk0HwE0TGKOHdh66xzgyFtxBq68OT7dgo1SK2b7?=
 =?us-ascii?Q?SG2o+uPHhdnTZsndefyUDnskEF7Vnarfwm+sutrtXiZysHdq7NTtjKqdJPO7?=
 =?us-ascii?Q?LFRyYaTh49J6REB/yDO1IeprqTmIQGlc5onnzcpGzXEqbSvOpaxsD3yG7VH+?=
 =?us-ascii?Q?QPfCCfHHGXh14YKidYM9+T95fAmt2M6j1xeAvtkI+ZAE4/ONJPP47Cd8DE8v?=
 =?us-ascii?Q?x9LAUdjANhjQjO5QO1Z42PIAvQsMNiqOwr98jtGsjwOooo2CHaaGOX9+5TcA?=
 =?us-ascii?Q?yau9CF70pwf+Ef3v0ihTMuI+K97zcbdecwgxnFidMYhFXpVte5ZUDMwykMlx?=
 =?us-ascii?Q?9q8p1pMsokF6B7edG+VQTkWpzRnqjflIuaUF+uxn8Ub/sByzhrn93ncdog3T?=
 =?us-ascii?Q?sWPRQ9TWhxOHojv0z1KcOxyjpFCkjcEOLa0WE1D7ZTHPLQCLYOAUHDL4zd3d?=
 =?us-ascii?Q?Hic7PV8Ml5MY3IP2xTkCyhPf2IiudImmqvDgtkYQM6J4bp+Ugnj7mrfkRsIa?=
 =?us-ascii?Q?z+TZ/bJ6ugfWdAKSsvlU3jv1zxrey/Uq7evZ5Ax+NkXJPx2FviqvFD2W04Wc?=
 =?us-ascii?Q?VKv/n7uHMWSyl/lcMpAxJbjSDyT2vBhQzI8FtJFrd6RNLEtpn+YkpSKWoGp3?=
 =?us-ascii?Q?aqC/utfka/O1fVtOkeiDYosZhdooTTGEj7nZSqCMA4idFfYbsPltGPeEq9t3?=
 =?us-ascii?Q?xdN4QF3XHdcTN6tkWNAy+KeQzMTOYD1tHaplnRXOj9EAjKHO7+PF0kN4Nr/h?=
 =?us-ascii?Q?IpGemmgm1ZbvoxR78nfa8V54GujbvKEZA0eEkMHZIUB2RZHih1XnzGAt+TrO?=
 =?us-ascii?Q?zoFEVo/Lz8YJsIVf8oupxLslQbbc1j3EDNW1XxpyfbOhnGcN+oeGhy9QFLFK?=
 =?us-ascii?Q?fXnfyKBm9jJqGrOkcN4O/szKqwHMFuGYVLtHGSLS7Ucjhy7zSuHfdlYCWTC/?=
 =?us-ascii?Q?sjrWgqTTllP1877mtHL0MMZ1ymLM7S9gMmlffB45out4XIknMDsVDlodcn24?=
 =?us-ascii?Q?a26/Z5MCbaZZmb3y4rkb7u0YCYB/phmiEgy6xPMdsDX+Ar60nXdWjn26Ivn5?=
 =?us-ascii?Q?UYU9s/Ij2ohKkUq+Wq5RZrepCvbAYTCk5XKntIPNqp0GvANibupXJUmXUHkj?=
 =?us-ascii?Q?tOBZY2gFKGV2becfi2KUf6IWzCeJjahcT8u5r3jsQ2vd4pm7GFb2SciMgiL6?=
 =?us-ascii?Q?IScgQp2bWN1CJO5oX7eUnjGAaqubdhi0Nf+UmsWmCYMXbkPqo8o5iB3sbORo?=
 =?us-ascii?Q?2eTobdCroQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5f2xeb5rNHEuRcXsIUhzQbrwmkJRIulLGIRr707Eg1Fo/HdbLpHiq/iW8QoC90Rqi78no/PN9xC19CC2iE8embdX57pVm74hC82zjxvou1Z19YNiL3uQoGueDATMiu9R5OaW7ALUoMysvGP9xGBCbCkP66wnFjChuJMfBeZvdTZ4HLeQF6ReqJd/6+Jqxj/SJZfNB4dZvncf8CGiIpuNxCXBy6bURpxDuF0aMkqK9F3K7KoX16i4GUZditA11NFyhJDThOi/qUui6dMcExvcU8Arzj30ewvvNBENYsg9lKWTWYmjPAQcEJJPxWpkNWC7cyhpsRjvwwKazTeBgVT42Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa0ac73-dee2-48c5-8dc2-08df0f86bcbc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:59:07.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp7WcXoj2ZmOfhET0YuCY0mrZhUWMTaEufhy5soqd+VQMf5j3yyYHxHYb+rov99a9g6VriEr2XHyu4YMCxxWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

On Mon, Sep 07, 2026 at 02:05:19PM +0530, Karthik Poosa wrote:> The previous 1ms timeout may be insufficient for some mailbox commands,
> leading to spurious -ETIMEDOUT failures under load. Increase the default
> timeout to 10ms and introduce PCODE_DEFAULT_TIMEOUT_MS for a shared
> timeout definition, in line with pcode mailbox specification guidance.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
>  drivers/gpu/drm/xe/xe_pcode.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index d502205bb72a..266deecbb100 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -140,7 +140,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1)
>  	int err;
>  
>  	mutex_lock(&tile->pcode.lock);
> -	err = pcode_mailbox_rw(tile, mbox, val0, val1, 1, true, false);
> +	err = pcode_mailbox_rw(tile, mbox, val0, val1, PCODE_DEFAULT_TIMEOUT_MS, true, false);
>  	mutex_unlock(&tile->pcode.lock);
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index ba8a1d1b2152..7e43792b0037 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -18,6 +18,8 @@ struct xe_pcode_version {
>  	u32 engg;
>  };
>  
> +#define PCODE_DEFAULT_TIMEOUT_MS	10
> +
>  int xe_pcode_init_early(struct xe_tile *tile);
>  int xe_pcode_probe_early(struct xe_device *xe);
>  int xe_pcode_ready(struct xe_device *xe, bool locked);
> @@ -31,7 +33,7 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
>  
>  #define xe_pcode_write(tile, mbox, val) \
> -	xe_pcode_write_timeout(tile, mbox, val, 1)
> +	xe_pcode_write_timeout(tile, mbox, val, PCODE_DEFAULT_TIMEOUT_MS)
>  
>  int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_ms);
> -- 
> 2.25.1
> 
