Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9980C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94D210EB87;
	Thu, 11 Jul 2024 20:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPTGdlvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7153510EB87
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720728138; x=1752264138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKVEu24wQb1GBxFh28P8l2dDAo8I5nRctQxjlIIbE84=;
 b=nPTGdlvvre9UPS+FeAuqPCNG+U8CzTIrT/xJgAXvyxHHuvKtJnD4r1rq
 vpjvlBybAReCYpSQHicpCH5CRdYIKGYzkhDQyETNDgSbghSytBZ3vnsJ9
 Yel6Gz1taxZCY972muV9G3zGj1LE/Ibmg/VoRFFyzv2Q1yXM4hbsZcOzm
 rtE8hhQ1pcavY6N4s1aDtfG33lRlrjNsb4hwuThmC2ovwwyYEh1fjyUFq
 ISl0FN9ug2w/7yh/pFscOVOTk1v17MA6sTrxP84goMIjbIocrlb0WXu9n
 CfMJIsE9ZQ7WEBAdr2cuxrDWQsiVXQwyEz8HoqAVoxkpHmbGCpQLe2myX w==;
X-CSE-ConnectionGUID: GadDE7FGSE+cSXu+iLaJVA==
X-CSE-MsgGUID: 1Sd1Oa+3Svq4z9nOBAkEzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18287106"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18287106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:02:18 -0700
X-CSE-ConnectionGUID: jn2MpCbKTBann1IJ7QsPsA==
X-CSE-MsgGUID: kvHDSPXDQq+v1fbnv30d7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48748665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 13:02:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:02:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:02:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9J7q/1prLoOYrQa7COgq8eY5yBTviPKa8Xy9vdHv3UfHKHm6RhrtfSOFbSIBkPPmtxZ3OT+08oNYcsS+zqKq1FRTFpCudG67EpiPaza1cl+RQymeei9I5qyTJrpojSb64E12WNzh2lz84oj5nalwbhp8aHeDRpodoYWqT/GhJDbXeXGCSc8OPDjibE71GdJal152AVBp9+E4GhlqbaidSIBXuk9lyJhBkLww5kIW6taymiqDUmJibsPyW/ScKAT50iaoHOj/wazPlxP3CbV0ko2yRRmbJFUZ+QaZZzNNMMnXIagIVsYs1wzfmUrF+WsdFyBetvHmBOK3OkJ3J11IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlbwSfp4ZWv3gWaS6DATAfn8IDxmRsnIVWuAQfMDaIk=;
 b=WjVGRviyGkb0UGaJKJv/vrh7WGLT7GHbiV2dsd/2MekaQbCxmeQAvaMbvy++BRSbQTeGFhVXzS8ksJ6Q+cxWr3u04KsCASDOPgpQ44f4R6vWZnzgXQzCQrVRmM11h54O3p9LHsseZi8igLTtobqWVGyeq89i4Exyuj6rqlSEKZUJviTfFtry3nD7BWVgcxJcC6VoBzEYNCtpU0mHbrsQD+ais0UT9+M2la2/cHW/zGsK/SoOybwEnxv0zDxPrE8wdVW+0ZqRZ8fnRWfxN38Fh65C2i5qnMGsYGeVvc9aZIsxrGx3fojqnRWK1wtOvbJThJnfLXwO48LJa3Oii050+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Thu, 11 Jul
 2024 20:02:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 20:02:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
Thread-Topic: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
Thread-Index: AQHa08fb5E5Qf6RJd0qD8kkn2VjaArHx8i+w
Date: Thu, 11 Jul 2024 20:02:13 +0000
Message-ID: <CH0PR11MB54440F4C13371762AF17DAB1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-2-michal.wajdeczko@intel.com>
In-Reply-To: <20240711192320.1198-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: 4ef1e8d8-727d-4866-f99c-08dca1e45b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Ogr5vcm5ADumHm1cnQo6otZTPbH3PIuboq2GZt7ZSwCaCdsx+zW0G25cQ/9W?=
 =?us-ascii?Q?gxTAjYJHmA4QFO54ImseGrOIoySIG29VgZrMMLL4cqVEm1+TWcaC1tr6Finu?=
 =?us-ascii?Q?/HhgkMlrhNQBK4JIx0ptleNv7PwGhFGaGpuHdzB6TWNkWkOFe4eGu5ThrVcq?=
 =?us-ascii?Q?8U/SXNDGK1+Ym6OxcYHoRBLly8wpoiIaJNHM/xubwliIp3SA+nN+JIf671p/?=
 =?us-ascii?Q?87itcRNjrkBZ7xsugHLnFXaT3e1auhf0FjyYR3587zCQseS2CgwVO32OJA32?=
 =?us-ascii?Q?40fgxoqFM1MdBzWNE+bjEn3f9KbcHsoQfKppEq1TEy8C79Y6hUcorHKs93oH?=
 =?us-ascii?Q?FwDG4ULhm2xXoJnFG4tnsPqAzJECoDOSTqS2kQMBovJQuBjrRk7TrUpjaaj1?=
 =?us-ascii?Q?zKkwLr35qSEeVr1IdYU5JAmgn7oPXG8huHETSAyMoPbopnjexUzDtc60OFM+?=
 =?us-ascii?Q?dbMs3GB/m+SsbeiSr4bK7+uHbv1bctin2AHaSjhlNk9wxoL7BcKcLKqff/WD?=
 =?us-ascii?Q?IJPWLEBkfqvB0qUI4U0Sm7VhIXzOsfu/SccnNRSogecYlQpo7EgquSpAsJ4a?=
 =?us-ascii?Q?MYtGnw8ofm785XANYr2zWSmUWGJzwBjLeNGzVygSxejfBEu7mXv8HGHUxWD2?=
 =?us-ascii?Q?onVSaG+ULz1dKRJ/kxDnOKuTQZgjuFfotuHPtibSUGhcRMMFNSyXfu/ro5O1?=
 =?us-ascii?Q?A/kdQaYUGBym/jMu35WolWTKyx9QNhcP8fXM4X0YDnq4cH/yrNor5DzhaTB3?=
 =?us-ascii?Q?UUcnZBcBewTVUmXdDr3o6ynUEDclHsChhGeyysOX/g5rEcyKjyhbGRU8aq4Y?=
 =?us-ascii?Q?eYBLLZCth9/wHhRIUHBJSdfeZwD5F9Cx6kda+bSdmsAl/l7xij/3wtCWzRbz?=
 =?us-ascii?Q?MjdlwDIFWDaZraxnCfJ8zWCxSX5+0UR5OLlYAbXTEymz1X6dI4V/FZ+ndMsc?=
 =?us-ascii?Q?WV2C5md1FJdBPUfL2RUKpLTpQMlc9JsL0Gd1GCF90ZzsJon62qdF6YIlGCFi?=
 =?us-ascii?Q?F1MtLPmk8DEAOS5EBmRMF00FzDPvV2ZlRyllKobstFdx8kr1Zk3iOhu4Zcya?=
 =?us-ascii?Q?kN+y6DDexj1UnMHH2lsft8ScJ2M8SlVZtw92K1X4yOwESzdNBHmVXQ+ZMgUf?=
 =?us-ascii?Q?I6x1pztcB3xyNRkt+DY02eCYighzBu/Fk21LITHD4ZBmTPaz/GgnTj7BmD2T?=
 =?us-ascii?Q?aKUtIzMftOcAckbCUEytivuE8kYJxN6Q34i01Ndop1OlE6iKrPO4C1Igjj/8?=
 =?us-ascii?Q?JWdHwkDpRXKHeU+uUSd4XWWEedr4McYzHBcJhFXjdUchn7T9cpRuHMh47Ahw?=
 =?us-ascii?Q?I+aHG4RlIuiNK3GZvw2SATaLHLC+GqHg7q9IJ/S2U7IkyO9jvdpQ3OwbjYjH?=
 =?us-ascii?Q?+A+RhdPVqzm5LEuMhCYnrijwp0m2Kc1tJJeUsvCX1Pcy7RJ6gg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K2coTj2ppC17exXFKWzmUAbTD6BGddi8GSkldzQ4eKnC7XKZwXEKtkgx1F8i?=
 =?us-ascii?Q?3QUUBapKkfmFnGhvcIOZGuaI2OYjVbZVl0ncQFar/caL3SDYfOJuMV9tX9uj?=
 =?us-ascii?Q?o3zhiKBi2e5qyAALUitMXvpRSSmwOSyhzmZdv90PCmNz4QAbhoH7/fONv33B?=
 =?us-ascii?Q?JjU/Fxak3QTZKg//kh2UtHWwHkz6AVS1bP80+Y8QwXJPhIpHwPOnG4ygEWSW?=
 =?us-ascii?Q?eb0Y+L/gGQQs8PZMYFm1Tfdar4WMMAbRbSBZpKJAbUB12w7JwC7vmSAoU/ss?=
 =?us-ascii?Q?exftL1cNlQd4tcnlvf5F+InNyI+aOLkLtCoAwWeN7y5c70GaK8TjQsWn/C+H?=
 =?us-ascii?Q?GHfLOSLcQo7ay2FKxUS90SJ2kTiSaW6ZvxohV0/EWvhnMOZkBbRw2HDV3BRm?=
 =?us-ascii?Q?PCJ1slyYQE8mV+djIbuImUt3z/EVt0Rl+FdNm3hVwbGL6XnnZACs6ioU/X+I?=
 =?us-ascii?Q?/1JIcdTxkZqsmZUCh2tM1RHO47RzQOg/CyEzDRJFg3RWVvQj/ZGWEehBoA7D?=
 =?us-ascii?Q?QYkao52peIlBb8KYF3j4eCc3JvtxTgy/3u9bmt3heh6xTYS3wVys5mCQjxOq?=
 =?us-ascii?Q?J+5OqFCPF1I2OgLIVNS9wYwFkaa6u72kypF95cif3WvDGmwQgj/uzRepcqJ1?=
 =?us-ascii?Q?0fjpeiHT19wmx2imszjuBVETyexndFLirBNlFADZ+aPaHDzKHsU+JvAhgmDb?=
 =?us-ascii?Q?0iwWXxdIiaQZNSNag/NJHsmkZ16qhuGlyF1Z+uIQpsZoYrWjEjdCXcIMJm8Y?=
 =?us-ascii?Q?O2cIPxB7TGMthzZGwfxzXNISVAFIU1c1I3+KqvDeUzLe0MDPhr4VkE75riL8?=
 =?us-ascii?Q?HUftBoeXg02IoN5g35bWDk2IDo1+v+uE5HO7PJR0qnnWsci0eNd3MqbDNrsr?=
 =?us-ascii?Q?V9drOy0cIUaN1ZT6LKJ1rDyVFeuj8Au40c+Nyv+Di//Y+CDSbRUf1/QRoJ67?=
 =?us-ascii?Q?LLc3sQV24dwbHhRGSbGTILqY1a8oHMSWvX+DoDQezZyT81++sNJx7+LhSmAx?=
 =?us-ascii?Q?NOlLVq0xJSKgV+6r/VXR4C4pDMlivmphxU5JHPw+YAdt4z+fI/30HZVmba5g?=
 =?us-ascii?Q?ziN17/fTPZmw1rL2R/K1e+lky9ptWtTTOWrct/uWT0qaax7qLP7pZATo3p4A?=
 =?us-ascii?Q?ZO3IPAP4176G+XTn0CfMC/i6AfcEeKGqnLP4GG+0BhQ9hHVaM/ODFsF8Ug53?=
 =?us-ascii?Q?afYJMvryf/ZTutr/FkT3ez4mXy2fh71lujePWQKh0fKbEJOgaCIBSvtFc7GV?=
 =?us-ascii?Q?bBUgX/OTW+bNSmUQk7fSEfa3nF9ZYNeRyaSggeI7jOYSaqgdctf/H04JiTPy?=
 =?us-ascii?Q?VrD3WllLLd06BjAaPXnp+teC5NkQVDaX5ptVxGVWbjIJlp63dPOV3Fli4QSo?=
 =?us-ascii?Q?+thBp2800RFcZCqEHdYuF2+A6ugh04zXfg3fz6mSR5Ac31iMomOTx3bxL8Tp?=
 =?us-ascii?Q?9K/bKEOu1WvFdlWMcfrUSOsG5oOcbMLGtc1E05ri5sb015PkxyZy4mJvnpRe?=
 =?us-ascii?Q?GMk85Y4ufAjBuJ2RStc+9nfcXKYlK/eOAoym/5UkQOcW0+dR3hRtgdXnREUy?=
 =?us-ascii?Q?9Vaxo5JLWr//9vhRYwgwV1eHjXUUxhNNYTMCiiHj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef1e8d8-727d-4866-f99c-08dca1e45b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 20:02:13.9516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zh+vzKlu5ieP/X8pBOCsVatwGTszdWbWD/8scvlRMxlPjDu7EAigoMZT/yjJ9oe3Pp6jLb/0GambExU/c7v6LLw1kdrAzNlu1Yrfx/tcidk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Thursday, July 11, 2024 12:23 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
>=20
> Due to the current design of the BO and VRAM manager, any object
> with XE_BO_FLAG_PINNED flag, which the PF driver uses during VF
> LMEM provisionining, is created with the TTM_PL_FLAG_CONTIGUOUS
> flag, which may cause VRAM fragmentation that prevents subsequent
> allocations of larger objects, like fair VF LMEM provisioning.
>=20
> To avoid such failures, round down fair VF LMEM provisioning size
> to next power of two size, to compensate what xe_ttm_vram_mgr is
> doing to achieve contiguous allocations.
>=20
> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index db6c213da847..4699b7836001 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1543,6 +1543,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, =
unsigned int num_vfs)
>  	u64 fair;
> =20
>  	fair =3D div_u64(available, num_vfs);
> +	fair =3D rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy l=
imitation */
>  	fair =3D ALIGN_DOWN(fair, alignment);

If the alignment is also a power of two, then ALIGN_DOWN here probably
isn't necessary.  But I won't block on it because I'm probably just
misunderstanding something.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  #ifdef MAX_FAIR_LMEM
>  	fair =3D min_t(u64, MAX_FAIR_LMEM, fair);
> --=20
> 2.43.0
>=20
>=20
