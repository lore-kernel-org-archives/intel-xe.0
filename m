Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFA3CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 22:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C7610E2AC;
	Tue, 16 Jun 2026 22:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqjhRlcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333F10E2AC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781648822; x=1813184822;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZnpXSX8xjgTeuKH8KTQ2nvEwW4krUpw22GgMMV6YYWc=;
 b=NqjhRlcSjBgbHgfvOHAOyfiMnw8wXyMtRfzcIsknNARsUw8v5fO04xnK
 OmEYC8qRkw+L2DcxYYESOfKqPn6H2HPRc72meJDdzcOUDJkfepRJKLM+u
 1f9/kBQBj8AIlOgP3apT3sJG6byJEaRyjqegt4rXXkLeRAYOnq7eiLPBq
 +RIJK1B8FPAjcvtY6UF1mzXwuJhtxOLW3TN268MdQ05MSDarhE/m6VLKd
 FKelTvNLLQooG0bPqtsoJ8MXk8L0vZFmlLB1obkx3NrshR0PJf6bOYgfV
 Z2HKBTImf2k6X9/rgipWhb6mj8lqW/WIzSskWXGRv6AAOjw6nUjOyL6HZ g==;
X-CSE-ConnectionGUID: hDKpkTetTaeEkmtMu0XFkg==
X-CSE-MsgGUID: Spn5w22oQc2K+3kIpqy9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82332784"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82332784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:27:01 -0700
X-CSE-ConnectionGUID: QEXFai9JSoOzrGcgrJGscw==
X-CSE-MsgGUID: 49YO2XNMSXay++FE5SCXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247969998"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:27:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:27:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 15:27:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZRrE9dPF8sqbQrxX85eRCpFDyza/O2TdOw/kNRph1LNLzammQyproBwX6NUScF0gDGceFZK1N/oIpiuWC+pyma48+e19gD0rwHz2OgPDtYBpPgqlQtya8Xl/Of332dEAS5MZa1YLCwoYs6jraxiiRxfDP8ioBnKG7G48uu5bqU3Ke5wjCjOrREr4fJdxrPIkivS3kq3dcaxBKuqTwY35x/YJmgZQt4e+G5ALkBhw5nxRmfpl69eNM8ijf4HMEtpRO+jq+X0Wd1OKjEWRcpxkwC61UZxDUaW8AjbjTwtPop8TitLAE0iPlzrR7FdgZX3e80QcWLeg3et0runrM7J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajkt0ItOTYRKEl7RlPWZ3ZhdTi1Z/YeXnluQsCdIzbE=;
 b=QiyViI2LB/UTjU78zgEvbwWt+m2V7AQz+WhHiBrnvgVfeEN8TJ0zLbwgjc8ZNrjypkul0u1sNjBRrN2fPlhvvjLONuG/6KyViQcA7RbTFxxVcQJB3noh1RXghMPcsb8p2T96/a8ncxmGVkDeMYC+eCbxYc0K3/EjogQsb8bqbPuXhPIp3o2aofDc+goDpprEHfGHpKwKfu35FEtll8Lq2s3ul3fvWtOlRmmLEDzMKlsC3icrlc7M0FVphoMP0IQf7rJMDeMoGgMUQOIyxux5SJwgraWsHIYR8W2l6bs5VrkTX+sE29XwppSxmq6pHmlWgFrP1se7JEraZVHipiGHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:26:52 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 22:26:51 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Move engines' LRC programming RTP table off
 the stack
In-Reply-To: <20260616195417.GM6214@mdroper-desk1.amr.corp.intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
 <20260616-rtp_with_dynamic_vals-v1-3-f2b47bea9dd3@intel.com>
 <20260616195417.GM6214@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 16 Jun 2026 19:26:47 -0300
Message-ID: <87wlvyt93s.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bf11da-12b4-410d-143b-08decbf65d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PhvHvFW8v13yuEnqwGhYX1m9RyEOYMoe5f3IN6TmHyWIZk6ovzDgXl2iwcLoc9pCxj6LAcUKU4Bx8l8JZ99CgSzHJWxTRSRqne7xcKEKSOvpMxfme2bIZY6nwHu1zJF8nkr5ra9AjPZM8Qd+MYvUnSqP4W2Lyi/iz70R+k5ErRFXn80xWVRkvNF7c3l6zWmiDhPHRvLjw50YvsjXFh7xHBwMwCzfxoG72D6Evotqu5YrgUZyeg9Vb7LjJaYnHSiscpk8bGa2qqRLCqEAGIYjfXvMAszAxKPvEaNFao2koVjCdJNu16qKS+V/FQBBO0pwg01oImDei3o9noF9eWoD9Csw4TPkzqWEScRE2tnULoB0oa/y3zvGXqMmykYGHIYB7m7hwFkPTEmEEuCtSmTVo0PtQnu5Y7cl8dUDnMP6Fwj6pLDs4bBn+C1Cj/eIsqJgtT4zzD0Z40bWVQsoZGlwJfHi5VbRJA/MaNnMByEHyqjngZPne4d7ttszyc3aKocAufkwcdQW9hXKdJD4QxSK0xxZ0U5AkSWF/CTWqFyuqmq+IXJ0u1WVDxt6FdORbQJkytFrjwlpWUXyoR8njhGUMgqRkP80NjMI2+T+LUk6/1iLXg/V0rcDEz79x6gNQ1B6gZIUEi0K7+7c0rQN73a1hLUa/CeaQl0jOOD+9JwOT3K0LivkeLpWDVu4V6rZlyRm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1isH3rLBE6lYB0VqmfE6EHq9GYZ23JJMcEtGf5Gon5NtlOvW4+W3D8MWzYi6?=
 =?us-ascii?Q?YXRFYMFX37k5bH7H9m3pYLw/oL1+LyOdQF39pW4nqxeRr6YO3ufCeM+/lu0h?=
 =?us-ascii?Q?NRW6NDKXPW2vX6D8pLfeezZa+WWmDWC74Mlm3ROHW/sq1Bx/TDlC9D2kOIHi?=
 =?us-ascii?Q?7ZCclbfsIQENurZzkyOMc9pVHLsdy3nmQgxwra0pG04Sfv1puhAfOL8SVigX?=
 =?us-ascii?Q?m1OJ6V8+tiwutebO/hUBovuHoGx3wjrFl3SmSzcX+J+BfZJ7ncJSpYwvmI9r?=
 =?us-ascii?Q?Ogj3HVOEPLYBcABe2a7N5o9Ex6ILdBGBvzcZZvDV3fG5y4G+4hMYHniIGVkv?=
 =?us-ascii?Q?9dUNwPQEIX03G5SCNDqfS3XrkUvhe6KnQ3N3jg+z0s46YF9BF4PMjvxeJwCI?=
 =?us-ascii?Q?n14qXKlbv9QLYChaknaztYZzrKalHtryvYm7eWxKAobBy7Jmux6d7gwj5sQ2?=
 =?us-ascii?Q?ql/Lsf0j4Flgons9tYQmZTCMJeIC1Tstuu0gNa5FBJkveMtjn8ChT0UZRykU?=
 =?us-ascii?Q?IaVOybzQiNudRWb1xxu0gfcnEhpbOC93NmOQlbzw5oTv592FK+uY/SrRE3Yv?=
 =?us-ascii?Q?gcrgIr/If3bJtt6V4lZH8XgZ2lviffxuOaxcKB6Z2pfDh2cACwR5AwvGOOrg?=
 =?us-ascii?Q?Pxoec5rsSYjqtnrJPSKXGBk3troY7I9/HZpOgwV9drBKQ2Pa4nP8hTBnyXc7?=
 =?us-ascii?Q?hIgrtcDxaOmpuGt8cVRaJbflQjqAqhTTIwz86jXL3e8IEAjGWBujPN1Anh3F?=
 =?us-ascii?Q?LlR3v87c50bgTgRyiFBIsSEBthkPEb4icO0DZiPeob1tnk6JMJjB/ZiIl6Vn?=
 =?us-ascii?Q?KGCMBV3LxBUF3LPFnXBFzXmYgv/tpSmcWpYx/5sOziR4l1t8sncgd3204ok9?=
 =?us-ascii?Q?5R9RbspORBWazHLH1tQLnZFHYr/x7HdgcpYIh/cWQPY4VadZ9NsIjPkAdi1C?=
 =?us-ascii?Q?7HfAyJH2CiRKhd+bGadAzsydLjxGMffnm4TcQ9YUOONbfLLT2qutrnj9oh9I?=
 =?us-ascii?Q?OwCq3jiJ8fphrnBicX4YozMTT8RRKjiIrgBSedmrflsA0ngttETYwPRLHOcZ?=
 =?us-ascii?Q?vltj67eOiJI4vX9+/jBxJwINKuCLk9HD2yjNXjTEQOW+4opjjlte+vRws3Jr?=
 =?us-ascii?Q?P6JzkLq2winvuBReSE8NJ4VGur6yMLKSya1FYSKO5CRcFxqZGIepYgQH2SyA?=
 =?us-ascii?Q?v9P3D7ftZsl0WzeQvIsLSS1/Pua4McyqzL3gL2avdOAtD2ZTd0tvA0mU70kk?=
 =?us-ascii?Q?RsQqT4Z1VLAMg5glEhQeVth1qFBjVG3Nr8qB+t9wwS+Wu//as704wkwfxUDY?=
 =?us-ascii?Q?cQ12QVf7ri98Hi3w6a/MQ7En7rv/vkgJWf9ZrObrei3IYQaUjCt2XO8Ifym7?=
 =?us-ascii?Q?w+FIDYq8+ZOefPFBdYxSqL5frmJlQRQEttqhcnUAZbTVFdSR4TMsw/fYgDm7?=
 =?us-ascii?Q?ny8o+hM4wpWUVJVrvgtYG7bOToDMzC/J5Nl69wEJr5fHtt6Km1/+C+39O1/x?=
 =?us-ascii?Q?laSr9Oqdj0gqGPe9jBM+gLiXbxhoewQfKp5yOl2pvLqgDOlXOXecWGXoLlqh?=
 =?us-ascii?Q?SdQny18tLU2/D65EbaKyUJm2bG1ov6D1zkshyvPunsqREIXDgBwuZu1rnaSE?=
 =?us-ascii?Q?IlcsTHrOHLut8Xr0MJAFXZGp8+LlYIdRL7H2Brf1x35RF69i3JBvpMeNIv6p?=
 =?us-ascii?Q?GBT54hb2v2C8776IlBW/4I2rCemNPnx0iO6kIIbEJehyyPyrklenTOUcoAcG?=
 =?us-ascii?Q?ZpKbtKQYgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: e15R0L+Tp5PIzEyPSHpJfSUb724wPdUONzfEshvlWu4bsGTqPdsF722zPHHPUV+QEhl5QpgZlZfOpamri1bEsnHTrRYYNYDm8Ak+JswtIFCxl+ALEcFKCUsH+JElLtKboi0aUj/TjVWX8M9PgXT4NorjEJlDaByS/r3mPZhTrVxxwNjFpS2mXaHsGnYGOZdfxiEjDapsDjNxv8U+vyxIeDkii2AgDQSnqrEHE6yFcddaO2nxY73Qw5wBA4Fu6SmImpLUEqYB7aBLkJRf4Wke6GzQfNxZAQLNv0XdnvN4BsIgefxvbAsZGuT+vO2liFG9r/ZfZOeXZE+rK0mJ55IgqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf11da-12b4-410d-143b-08decbf65d19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:26:51.8897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABpiD5wCQrp/D1h1X4ySTFPaygUjCI5xALXub+RXxscAC2tn5InOIbL9yMMjt3QavwZK63/PrLdwg2CtAxE1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jun 16, 2026 at 12:21:53PM -0700, Matt Roper wrote:
>> The 'lrc_setup' RTP table was allocated on the stack because it wasn't
>> truly constant and needed to calculate the proper value for BLIT_CCTL at
>> runtime based on other stack variables.  Using the FIELD_SET_FUNC action
>> allows us to make the table itself truly constant and move it off the
>> stack; the BLIT_CCTL value is now calculated during RTP table
>> processing.
>> 
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_engine.c | 60 ++++++++++++++++++++-------------------
>>  1 file changed, 31 insertions(+), 29 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 98265293f2dc..0b688b851b71 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -337,39 +337,41 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
>>  	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
>>  }
>>  
>> +static u32 blit_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
>> +{
>> +	return REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, gt->mocs.uc_index) |
>> +		REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, gt->mocs.uc_index);
>> +}
>> +
>> +const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
>
> This (and the table in the next patch) should have been 'static.'  I

With the addition of the "static" keyword for lrc_setup,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> initially had VISIBLE_IF_KUNIT here, but decided to drop that
> until/unless we actually have kunit tests that operate on them.
>
>
> Matt
>
>> +	/*
>> +	 * Some blitter commands do not have a field for MOCS, those
>> +	 * commands will use MOCS index pointed by BLIT_CCTL.
>> +	 * BLIT_CCTL registers are needed to be programmed to un-cached.
>> +	 */
>> +	{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>> +		       ENGINE_CLASS(COPY)),
>> +	  XE_RTP_ACTIONS(FIELD_SET_FUNC(BLIT_CCTL(0),
>> +					BLIT_CCTL_DST_MOCS_MASK |
>> +					BLIT_CCTL_SRC_MOCS_MASK,
>> +					blit_cctl_val,
>> +					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +	},
>> +	/* Disable WMTP if HW doesn't support it */
>> +	{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
>> +	  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
>> +	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
>> +				   PREEMPT_GPGPU_LEVEL_MASK,
>> +				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>> +	},
>> +);
>> +
>>  static void
>>  hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  {
>> -	struct xe_gt *gt = hwe->gt;
>> -	const u8 mocs_write_idx = gt->mocs.uc_index;
>> -	const u8 mocs_read_idx = gt->mocs.uc_index;
>> -	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
>> -			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> -	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
>> -		/*
>> -		 * Some blitter commands do not have a field for MOCS, those
>> -		 * commands will use MOCS index pointed by BLIT_CCTL.
>> -		 * BLIT_CCTL registers are needed to be programmed to un-cached.
>> -		 */
>> -		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
>> -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>> -			       ENGINE_CLASS(COPY)),
>> -		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
>> -				 BLIT_CCTL_DST_MOCS_MASK |
>> -				 BLIT_CCTL_SRC_MOCS_MASK,
>> -				 blit_cctl_val,
>> -				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> -		},
>> -		/* Disable WMTP if HW doesn't support it */
>> -		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
>> -		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
>> -		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
>> -					   PREEMPT_GPGPU_LEVEL_MASK,
>> -					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>> -		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>> -		},
>> -	);
>>  
>>  	xe_rtp_process_to_sr(&ctx, &lrc_setup, &hwe->reg_lrc, true);
>>  }
>> 
>> -- 
>> 2.54.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
