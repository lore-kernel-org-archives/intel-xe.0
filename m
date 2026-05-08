Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319F3CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 08:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB4E10F3F3;
	Fri,  8 May 2026 08:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlrGG6Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F510F3E1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778227552; x=1809763552;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TexJrhGml7wElTSjisoJ1yWsc03x8k3WbtcEOMYu748=;
 b=IlrGG6DxftOo81KECb/Cfqt6bALvzSTZ33IqQEzxJ1K+B0X8Phy/9oql
 XbJ0MBErCKu6rDkYDe3vD0wgdaVXIO1/LXboYFd2cFmvK3B+BKXAr0iNz
 3FjKNA/Wwm9z0WGh+3qwsX0qa4CUqSad4WKt1LOFz8155qifyDIOw+Y/3
 7vP79zxGilxkhsUC2GFUVanLUk/EGr3GthC0AEYBEq6C7w6bEq9/OVpLX
 5crWMgmaSGtOyKTT2lvGgTP2bhttll7JF8uMRT62w7QLp6+CIOYW/Ajga
 Z26JTd+b0dnH33uvkdkza6j/Z7AEUFA3D97Oc/LbWr+H3KV6MNgT5due2 Q==;
X-CSE-ConnectionGUID: BuI1LqohRW6FC8i6GCr27A==
X-CSE-MsgGUID: zWACFajTTqCFJaqXItpvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90654319"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="90654319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 01:05:51 -0700
X-CSE-ConnectionGUID: tHWGd4dbSICuXXC9Ge2QLg==
X-CSE-MsgGUID: Lj5PxCipRMGeFPwRxIfwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="232356919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 01:05:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 01:05:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 01:05:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 01:05:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clYZuY/2hQt02KDtttP2P96Ukjw6avsWmbiczhwqS45YHf9dBq1JrpwBTw6CSrnO4KdHOPhlfHIGDxgf1lGWSEJSakl2X8mzUPYoxhEZxqH7XowFAvamukwQYC7sJ5LVJK/9JqZXsEbz0wMz1YsDzJ0JehKmK+VK29sAfGz9wuaI65GgCcWRjAezFaGZqHjIV/48CJ3oLMl6rlzaRDdZXftZrULsSyRD1+nohyI1yXHm3P/saWWEOeVMyozC+6LN9lDQ7sdAz+QUEY8KCzgZG4yP7b1SMWULyGME7BpYvHFHhrLLkZlwOw/EabXiy7//yjtnZf1L7Zi2Aq1zO5g28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw/4FangWBjwg8hDRHNhHzTxvdVkiaubOSwa2Yv6CR0=;
 b=i8zhyt0XSZfUHproZ2AwMAA47z4QZpYpTR0RX5PLd+0SrzSAI7ltHLE53DmdsksIdCbmC5DPzJHpg5gwdqw2qq+bg3F57YHFBrstnu+TiaxrNCiYfewVjuugDuFNqGclG7fnVvmy3WO1bHy7R13i/rgAQq3/bXuBknWw+QmpPPOF5jzhypUdftrNrgpnpxCKq+lkbSnvCd21tnPmbVtRt1AKdQMbeJ5N1jPEpBLvytc0x0Kf6dXn5I3a7Aoo5duCbS2VKo4SEqcZTfm6tQwui0U0vTSvbPFp1QOk+PiNpg4mcBdRmprfkkMioib+zdNRyvyNdJ8x6nstDy40ouywBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 08:05:42 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 08:05:42 +0000
Date: Fri, 8 May 2026 13:35:36 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Make decision to use Xe2-style blitter
 instructions a feature flag
Message-ID: <af2ZUCs-B8GWW8JD@bvivekan-mob1>
References: <20260507-xe2_copy-v1-1-26506381b821@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260507-xe2_copy-v1-1-26506381b821@intel.com>
X-ClientProxiedBy: MA5P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: bd379c5a-250f-45bc-f890-08deacd899bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|17096099006|3023799003|56012099003|18002099003|22082099003|18096099006;
X-Microsoft-Antispam-Message-Info: NuaNaIOUy4i+4io5VAEXD9hTUYSrcBo9eBXi601UKi7r+b9UZtEvjNNPeW07V89WA5Jjzur35EcgCAkm8HMMvfCfuiQpRqpCAmefPZm/pcQKmGuslXy6usStsBKHQRyik2PBOhwjLw/CJH26TAIsEl5Vk7OvUCWpqcx3dWROn4ZP4V2wf0vakkrQxCAIcrFlvXu2k2+MjC/0VHceQnHGsip9ZRtnlYZskHEN1vdX0L0LiCgIaX/4Exu/6/sdhFUKGHVUVLKMUYvIFFq6YCrZly5URDwwr63dsVY6nueeSNy4+edZEBCYy/TkiMpufRmK80mwvqGZcGNBe1M5uYBdIT61LQDHHRWy8FY72J7phS9auy7P56W/ELU6zilq/S9jepu32ZWWhoAjYebV40uRAZf/oJOpYW9t//Gm4gKv4FNOuKUIZIVz9dvtLDZ9lfi40ADOZapx2A9oXRtBmt4CgX+/MS4JO3tlLO0Vu76wLTmb4GC46qD5sJtm0ZweEdgZnZZmCjv8ij20q2pNdYVE0/sGpOfhkilJXXUCxzfVqs7T5ALlkipeLGHTswx4ZMfqs4QhvjYIuS4ByM98ANGVXDFm+bfrypg4BiXNDuUiQxaoPogXbhZ3pf22dxzoQlOptNQoqtePeZ1WpLqznBLoApFaIxtVu+JKuSFQtCWdsYK2qxYS+YZV/1/un2PZGvCj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(17096099006)(3023799003)(56012099003)(18002099003)(22082099003)(18096099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWtGVjg2VTBXYTI3MFVmUjNCbEpuM3RhQUllb0hvTVdYb1JRZGFaem54cDJR?=
 =?utf-8?B?QTFud2JiLzZLZm9tNlhZK1NhZDV1YjhUUFo0MHg4T1BkWG4wUTFGVGdsSXk0?=
 =?utf-8?B?OVVGbUt5Q3VHblVCZCtldGdhdDJNWjdQRVkzc1NBNURwN2ZEK01pd0gyNTBQ?=
 =?utf-8?B?NG8zOHdnYmtrTG9kc3hXTzNkdEt2WUxHRlkzTHF6d1hVTlhmRTl3U1hGRjFC?=
 =?utf-8?B?U1dobHFmb1RkUTd2U2ZONEVMRkIzMnl0MXREdTBkK2ZHczUwZEE3WCtzZ1BB?=
 =?utf-8?B?Tk9Qc29zYW05VWlMOC80Q2tHK2Z3MjBYUjRPbnkvS0FkSjZZZVpXWmVmdzdB?=
 =?utf-8?B?b003dkkxMzgrT2Jsc2VXeG9yb2MxNTNtenVYNzgrUDY3Vk9qUWhFNjFqeFdy?=
 =?utf-8?B?d0xQTjlPdzJJQ2xSc1ROVFpITGVBQXphYnRBN0x6emZJaWRzMThzdWxKdHdH?=
 =?utf-8?B?WndtenZ2MDg4K0ZaK09CNVpFdE9SbEZUZ3pQVHFXY1JCZnd2MXQrMGR1ZzJ0?=
 =?utf-8?B?M2ZtaksrOTkrdEhDMTJONkZOSjRyWTM2am9EME9aSzRob0xmK0o0N2NQODJk?=
 =?utf-8?B?bUF3eTJ5MzFRekxsK2x3Z3hib3NyS3JlOW5PTC8wd2lCVXdxSmZEZXpIZCtv?=
 =?utf-8?B?VEIyUy9WRjJtTlRhUmc3bXFMaUVQblJ3SHJleHVPTzlCWWdUQjVsaXI5cWZC?=
 =?utf-8?B?SFV5YmNwVTFhNm5oRGFmdzg2ejhLazh2NHJQYjRJOHUvbmpsbGlVSG9laWw5?=
 =?utf-8?B?dUxJWGZuV3NSMFBjRktPMk1ZTzlDNVdMMGZQS1UwMEZMb0pFM2FWVDB0VnEr?=
 =?utf-8?B?ZVZzc2FMQkVpOEFlUUk3a3JUU2d4VUFDdEFidXo1bENxYmpxc3dXL0ZQVjAw?=
 =?utf-8?B?bXV2T2d4UVJFdkhRNlF0bzlJOEtDY1B3NG1ObmliRExEZllMd0gyL3drV2VC?=
 =?utf-8?B?eDVTRzVrZ2NoMC80T0ZKaGdJdTlxcUJTTEJDTU5relRQN2RTUUdNcjc5K01Y?=
 =?utf-8?B?TUJlOU1UWDExaEQ1NGRrUlQ3TkRkbDlXSVBBQzI3cHl5eVA4cFBQcXI2S2dx?=
 =?utf-8?B?RExTUG9oNFBHM2F5RnVRQ05GVmhBbnE1aDZvbVZJZ3dIc3o3cGl4Uk9JT0RH?=
 =?utf-8?B?U2Ezd3N6RlMzMXZzMVo3ZzZBL01aUjVvbVhZNEJyNGhoTHRrNXJPWFc0WGdN?=
 =?utf-8?B?c1BYTHNkaFFqTkdxTmpTWktiMTFXdFlXRExaMFBDSDI5akN4YXBoSVhGeitQ?=
 =?utf-8?B?TCt3Y2NTT054cVQ1MEVhM1dXQmwxR3g1NDlLVDhLR3lpRVBkWXdtdlJrV0Zi?=
 =?utf-8?B?enJVMnYrc0JZemFmSm8rZ2VGci96RHdwUXJJZDNrNmV0cTJjblhNSk9VZHpO?=
 =?utf-8?B?eWtZbGwxQXhqWUdyUmFVaE9mUGdzTkFBQStmUHpBS2NWT3FQMzlISGt0NFE2?=
 =?utf-8?B?b0N3SWJOWG5BSFhhR3o0R1g2MjdIbjRUN0NlUGNPaGtzWEpIYjByVVA1Unhq?=
 =?utf-8?B?aFdiWUhDQTdDK1ZyeFpJVkdoaFkwTnh4OHBnSDMzUDJ1U3NzdTVXTFBScms1?=
 =?utf-8?B?MkJwVGhoWkFwMnhmV2dSSHh1bVVvY0dHODMxaWdSLzJpNE5rKzFUWnVnRkND?=
 =?utf-8?B?MzBrQThIbnZMUzJ0MVM4R2JoM0pkekxXdlh5UXo5blBVSVBjSUF4VWJUTXJa?=
 =?utf-8?B?L0hycS9hejFGYjZxUU9sUHMzaUtzdUlORXllcnJXVGVpRHBaT1dqdkFFeHFp?=
 =?utf-8?B?aTZZRTgvaE1jTUZpTVczdS9ISkt0MlNGSmMyY1FmNUIzamFLQnRXc1MwZW9B?=
 =?utf-8?B?Ukc0b2cvY0RrT0ZNcTE3OFowcHpEbmhIMEZIdnpaL3ZSd3ZHVjZlRlpXaGda?=
 =?utf-8?B?U214Z1ZhZjBaUFp2akxXV1VLR2lnb0lSRDFiSjVteW1STzlmTWY0VnVHTWF5?=
 =?utf-8?B?WWhVdWFhSUJ1SVo1Q1dQVUdGMythNXlVSWd0ZHljV2VYVzEyY2ZORU5Uek05?=
 =?utf-8?B?UkRzc1FUVXVJeWVQOUdHSUZBTVNEdWFDYkRQNUdpeXVobUdWM2o0MGVtZ1RQ?=
 =?utf-8?B?M1hQbFBBY0Zyc3pVQUxEZnUzZkhZeTZIR1dlcWVXMER0bHNCeVVETnBTRmpQ?=
 =?utf-8?B?U2h0WVBmeWFjZXNwUzBWeUpGNTY2WXRMWDQ2RjVLR05hbTdnWGJ4Tjh6WGhQ?=
 =?utf-8?B?OW41QTgxaDRaNlRxcHBBQmt1UElUeG9iMnptOEx6S0JVMXFEcGlRVXRBNDRu?=
 =?utf-8?B?Q0Z5aHB3TXFRZkFXbm41N0Y4RnJVZDVWaWJ0djlLMEkrRDQ5YWx1UU1FVGFF?=
 =?utf-8?B?V09hKyt2clB3eUxWd0VaZlc4Z2xmVU4rUFlYT3h6VDFIWmlxS0N0bDgxb3Jq?=
 =?utf-8?Q?n/hNllYSxtD8IFojm7SABOWayhKiGA9OeAMb1?=
X-Exchange-RoutingPolicyChecked: HXFuO9elmOWBu8IZGbJO3a3xnushoYQ1+h8nC9C8jOOy8cfZhAFVRYS6QOvRyH1M5mUtDoSO7KJS6WPPDHo/6bFwxxbFqkMQ749iD3M47vhIgGiDty5lfEU0KV3XQneSwS0FBxgGA9DKBpQtHL6BaUIIfbSzPi0TVXLPLh2fDsph8bG/IWzdnrlYfCZ1O7aV9eZFd5aWFX9plJpZk4x83TS2SVVWsCrx347EowottZGKFYpRs47kE1qlMSeAHQhgdF/um4UasWGnEikPZiPzjRUOA3J4V8PV/ezxBelOrkjEeLT3AClpwoDqSmod0Ka2I1HucFeJvJQKZ+CculOGlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd379c5a-250f-45bc-f890-08deacd899bf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 08:05:42.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IYXPBOp+W/Tlj+xmKjKvMhcjRZvAv/oJ/z4iI0g8gkmWtWyjWgsg52EpFVQ0UBjxw1HvTg9VprwAWkkHVnI3CGxD7kgOKY3nG3GU000qO72tlal11uWXyx+mB8CJGvF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On 07.05.2026 14:00, Matt Roper wrote:
> The blitter engines' MEM_COPY and MEM_SET instructions were added as
> part of the same hardware change that introduced service copy engines
> (i.e., BCS1-BCS8) which is why the driver checks for service copy engine
> presence when deciding whether to use these instructions or the older
> XY_* instructions.  However when making this decision the driver should
> consider which engines are part of the hardware architecture, not which
> engines are present/usable on the current device.  For graphics IP
> versions that architecturally include service copy engines (i.e.,
> everything Xe2 and later, plus PVC's Xe_HPC) we should use MEM_SET and
> MEM_COPY even in if all of the service copy engines wind up getting
> fused off.  I.e., we need to decide based on whether the platform's
> graphics descriptor contains these engines, rather than whether the
> usable engine mask contains them.  This logic got broken when
> gt->info.__engine_mask was removed, although in practice that mistake
> has been harmless so far because there haven't been any hardware
> SKUs that fuse off all of the service copy engines yet.
> 
> Replace the incorrect has_service_copy_support() function with a GT
> feature flag that tracks more accurately whether the new blitter
> instructions are usable.  In addition to fixing incorrect logic if all
> service copies are fused off, the flag also makes it more obvious what
> the calling code is trying to do; previously it wasn't terribly obvious
> why "has service copy engines" was being used as the condition for using
> different instructions on all copy engine types.
> 
> The new feature flag is named 'has_xe2_blt_instructions' because we
> expect this flag to be set for all Xe2 and later platforms (i.e.,
> everything officially supported by the Xe driver).  Technically there's
> also one Xe1-era platform (PVC) that supports these engines/instructions
> and will set this flag, but this still seems to be the most clear and
> understandable name for the flag.
> 
> Fixes: 61549a2ee594 ("drm/xe: Drop __engine_mask")
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_migrate.c  | 18 ++----------------
>  drivers/gpu/drm/xe/xe_pci.c      |  9 +++++++++
>  3 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7351aadd238e..231555092435 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -144,6 +144,12 @@ struct xe_gt {
>  		u8 id;
>  		/** @info.has_indirect_ring_state: GT has indirect ring state support */
>  		u8 has_indirect_ring_state:1;
> +		/**
> +		 * @info.has_xe2_blt: GT supports Xe2-style MEM_SET and MEM_COPY

nitpick: s/has_xe2_blt/has_xe2_blt_instructions

> +		 * blitter functionality.  Note that despite the name, some Xe1
> +		 * platforms may also support this "Xe2-style" feature.
> +		 */
> +		u8 has_xe2_blt_instructions:1;


>  		/**
>  		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
>  		 * registers the geometry XeCore mask spans.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a87fbc1e9fb1..f3c2ef269ba8 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1525,23 +1525,9 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->len += len;
>  }
>  
> -static bool has_service_copy_support(struct xe_gt *gt)
> -{
> -	/*
> -	 * What we care about is whether the architecture was designed with
> -	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
> -	 * instructions) so check the architectural engine list rather than the
> -	 * actual list since these instructions are usable on BCS0 even if
> -	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> -	 * off.
> -	 */
> -	return gt->info.engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> -					      XE_HW_ENGINE_BCS1);
> -}
> -
>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  {
> -	if (has_service_copy_support(gt))
> +	if (gt->info.has_xe2_blt_instructions)
>  		return PVC_MEM_SET_CMD_LEN_DW;
>  	else
>  		return XY_FAST_COLOR_BLT_DW;
> @@ -1550,7 +1536,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  		       u32 size, u32 pitch, bool is_vram)
>  {
> -	if (has_service_copy_support(gt))
> +	if (gt->info.has_xe2_blt_instructions)
>  		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
>  	else
>  		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d55e5af4f4b7..2ab6d2f483fb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -850,6 +850,15 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
>  	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
>  
> +	/*
> +	 * Even if the service copy engines wind up being fused off, their
> +	 * presence in the IP descriptor indicates that the platform supports
> +	 * Xe2-style MEM_SET and MEM_COPY functionality.
> +	 */
> +	if (graphics_desc->hw_engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> +						    XE_HW_ENGINE_BCS1))
> +		gt->info.has_xe2_blt_instructions = true;
> +
>  	/*
>  	 * Before media version 13, the media IP was part of the primary GT
>  	 * so we need to add the media engines to the primary GT's engine list.

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> ---
> base-commit: 36eddf6e5c9411ad95c4939b092ed1ea77f13d61
> change-id: 20260507-xe2_copy-90d059dabe75
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 
