Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17EBC282D2
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 16:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9092310E656;
	Tue,  4 Mar 2025 16:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMooEgDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3010E653
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741107058; x=1772643058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1rVnLTt/ZJdiPwdhE71AZgtEPtNEFsi/+bdNfrIkfbY=;
 b=mMooEgDp6ojlQ2AT6Qyj8Ongku6pO4Vp/LBxBZ5WVbkujMJmWJyORGLL
 XstVfAE95X91bBW9LqBbF5ZefVzan9o4OZWJTgC8Onw1E536wmeJvnPD/
 rKyehsOsOzvmsTS+NNWXQS5p/o4ecoJi830Bgxjxd0mGUQ65Cy2QAgqN4
 fAmj38QoqB8xDE+cNXvj4fciSPpe16yQBgBv9RdnqgsJNBW9qvVqGwy3q
 mLckxb89eDI9FdZh/An6Lodnea8JxSZUbneVzqn8Wjtrq7KgBvAxUUTzw
 +sji7s9CN0pJ3cbriDBiC6XcTWya8BSOXbW2CJouhM9usVrmUtELFiDZw A==;
X-CSE-ConnectionGUID: d/lhYdgCR36JvBybXL8CCQ==
X-CSE-MsgGUID: hvUX9UGgQHW9iLIeglz14w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45686170"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="45686170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:50:58 -0800
X-CSE-ConnectionGUID: f/W164KzQ4KHs06lweV1PQ==
X-CSE-MsgGUID: 1mD1QcerR7WnHTde3vBWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="149210225"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 08:50:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 08:50:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 08:50:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 08:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0+V3KvMsHpGgU1rzQVea5y92r2S40Q483T+JYSVOy7tqoUyWF5tYAc18N+73hp64yE3eZis2IMV6G8ofM8b2OW/7c9ui+lrA/oUeYKlyZ6G0ybCRi+8tDO47hCQHedHM+hLAzF0So3OqpGUOa0+Soc+zC7S8NBG34ihsEcVrx1478LhW5x8DVqyEDE5zh1KcF5FHEBM4z2QoM+4mCIK5/usPOeOLO0HqHT47rRgzpZ+FKF3P3iRpQLdhslmfOGsbTse6DK0OWnM1tNpOWielHCiUjGLJU7XRLG0SHOjIo8ccWeadGma5lbDQDpMqvPkRqqMzcy/jkuq5sjPGwOP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rVnLTt/ZJdiPwdhE71AZgtEPtNEFsi/+bdNfrIkfbY=;
 b=ukHBaHFU/mBxckuoMWiCh3J3WP5TmiO3DMRAREErrQgZuef9IhHn6imWL9hInJeKmbWz+jZmZ4hDUhVtVXHEydfdWU97aqIXABW20KJMApBekVEMlMzPNAKHq5RNfxNvDmW1FfxPRM43aXdWglcj7VSV5ufkrEWWCCXEUPYEa3Mqf5PPsMV6vy/SSGbin1simyVonahs/XSs+ZzbwL6+CyImdufYEvgnqqUB9tziXEz8FoWr9WG9GupgMkF0fWM/pYgSYStBKfpmc8KTeY3P+hDrjteCkJ910V1he0N/vYXQRngr/4eeJVKIskL3VStAvrg8MOKlHQZnh0LTlaxsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 16:50:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:50:52 +0000
Date: Tue, 4 Mar 2025 10:50:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Avoid reading RMW registers in emit_wa_job
Message-ID: <jidzxrlzsroobautw6j65ukza3yo45koikdmldor47diub46fr@4kwtis4bickv>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-4-michal.wajdeczko@intel.com>
 <3vm7izwczds45yaktuljfpges6rwsf27afgn7esuo6mdwontm5@vqtj3zkmnlmp>
 <64899758-d054-4f0c-a38f-8931473bada7@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64899758-d054-4f0c-a38f-8931473bada7@intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0183b2e4-a37d-4cff-f03c-08dd5b3cb959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejUrZTFHZ3NrNG1wL3prT015RGluNEl1NXhGeG5PVzd1aTJzY0tTYWdmTlF1?=
 =?utf-8?B?VzluOVNNYmhmdUwzWXFFdzRPeTk0Wlo0NGFLdVZjdEdxOWFFZHgzeDZGaW5W?=
 =?utf-8?B?WkdMYXY2dWxPV0gyVnJDRFpqak1HZHhsQ016T3RndmRuN1FNWlZKTG9jVEMx?=
 =?utf-8?B?c0F6RVdsbk4yaG1BcWxzVUkrc1I4eWh5Umc0UmwvTFNGTjh5ZkxNOVlQWkgr?=
 =?utf-8?B?T3dETUdHV2VGa2JrWnZPTWY3QXM1MGUxNCsvcEJ1V2k0d1dva05LNCtRZFRS?=
 =?utf-8?B?TlRVYWhqK0l0aUk1VHhpRnJjL1g0czVpRDZWTkxhdTJMS0xpOVBZUU1rSjd6?=
 =?utf-8?B?Wlo4M3dSS2hCd2QrS3hncVhNNlAyRmVZZzk5L1RJLzdGZDBpTncwMm8wK211?=
 =?utf-8?B?MjJ5eDlzTGx0dXBJenhtTGtuVXRDeUFKVFArOEVXdVhLNDdkRzZzdW5ibExj?=
 =?utf-8?B?c2FUajhjbE10UU1KSTBCQ1N1TWNhTEtDNm5ySEhVNjhEcE1pcllqWmttT0hu?=
 =?utf-8?B?bGNQc2hxNytjZ3h1dUZZN2p2dnRtMTRHZEtlM1pudXYwSXlDM0UxcDQrUVZa?=
 =?utf-8?B?VFJWNm8wcFFEcjVSZDNhQ2czS3B6SFBGU2RHWFdYajJGQU9WR1k0UTVzSmVo?=
 =?utf-8?B?NDIyVGZ5aW9YSkZlNzNWU2FEK3hBZzE2eUhvT3Btd3Jab3lLa3BJSFlsV0Z3?=
 =?utf-8?B?Z2d2NEI1d3c2cHlCbVluTXJURFl1Uy93Y2h1WjBSRFhFTHdTVG9FSjhRZjBD?=
 =?utf-8?B?czRPcTVGR1JIaGNDTnNZOWQyaG1GTE1SSGd5dzZnZDR1WjhycGhuUDJwZEtU?=
 =?utf-8?B?eTFYeC8yelU3djVaRXU2d243NTI1UlZKZnpKUjF1REdQaTBabDcxWFhFQkQ5?=
 =?utf-8?B?OEt0SmhmZ01HZHIxcHBZaFdrUmxoZ2o3aVgrTStlOWdNUDQ2YnZhclZKT3Br?=
 =?utf-8?B?VU10anRVSlo1NTVlTU45QVNtMDdMcnh1M2hnMnNuRlVadmptaXB0cUMyMzBB?=
 =?utf-8?B?ZU5ueDdhUTFvTkx2QlVyaGloWWRyem1yV01HNysveHU4aS9mdHhnRi9CSUtk?=
 =?utf-8?B?R0VnT1dHNmM5TXpxUW9rcUVnS3JFbVRtbDBUdk5jbERaeDJ0ZFJlR0FxVnYv?=
 =?utf-8?B?eTlsekp1REZHU0JwbkRVd3F0RUNFbmlUbGplZ1Z2L3hQRkZtK0x3UGxFSDVQ?=
 =?utf-8?B?OWYyM0g3a3NQelpVS09zN2xsUjhnd1FJNlRob1hvOWVZOWIxaVQyYkNpQ1R1?=
 =?utf-8?B?WXFTREVxRVdJWDdZeUdMb2ZGck9aVnk4SlN2N3Rhck1KVU9aMUJQd25SV2tD?=
 =?utf-8?B?MnMzZ2Z2VUlPTDUxTWROYVdydHlhU1B6MkdmZlRoTUdRd1h0dm1NOHYzdSs1?=
 =?utf-8?B?QlczMkdyeFV3Q3Ntd2dXbDJqVDAraW9DVFVHeE5iZVpMMzZkSjhpczFIZnh5?=
 =?utf-8?B?djZETGxuYmIySHVkWnhCQXdvbjg2NGpxV3BWb1kzZzFlY1dxYk5ZYTlQU05l?=
 =?utf-8?B?RWZnUC9SUE9WTThqUjZrMHBHK2RtbmIxQi8xK3JwS2hHMlZzVHNoWHVPVDlY?=
 =?utf-8?B?K0gyR2pjZ1FFQktScWFsTEpadjIzU3Q1WFBVODFibHdVS2Z0UmhIQjlGR1Nn?=
 =?utf-8?B?dlBoYlppcWdMWlVVWVhMSGtLMmJySnpYYzhXajk3T3Y1SFdXYVJ4bWlZOEs1?=
 =?utf-8?B?Q3ZRRzZPcnlOa3ozM080MXdydVhjODdYa01QNWZEa1l5ckdib2Q2cFJDM3NX?=
 =?utf-8?B?eGRkTmhhUW44MThsM1AySWpLRktkbzRUWDYyUXFhMy9FcTY3OGpmeE9HN1BY?=
 =?utf-8?B?RG5GNnU5MXpGWnFFWnZyVjI5TlRZdi9DbmdWSE13SjYwQUNyc2FiZ0lmVXpD?=
 =?utf-8?Q?+psALYaD5AYmz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkRwZ1R2Y2JETCtKelR1N3RycnltTWxUQUVKYTJldWJsdnBLZ1RFZDJFTTJF?=
 =?utf-8?B?RVpXRFZUM0w1R2hwRHZuRHVCSVRzRFdMMXZkV2VxRWdkdkpDbjd4VHMyUml0?=
 =?utf-8?B?UURVQ24rM3ZvNnVKL1FjVHUxU1lpS1FXN1NiZWI4RmhhampQOVAreCs1ZWND?=
 =?utf-8?B?cktaaHIzenlwaUY3aGdtbEJTKzlsaDNoV3ltSmFnMG5LSmVaVEV0dnQvd2lG?=
 =?utf-8?B?WG1UeVNIV3dmK2RZQndWUEc0U1h4RkVTaWw4bDdvNkQ2cmZsOW1JUGpKclBl?=
 =?utf-8?B?LzhiTDBqWEpieFpFYWFyazBzZUp6bHoxbEo4d1crdWQwVmMyNmsxdzl1cjA5?=
 =?utf-8?B?MUE4eS8vUE1IRFNnNGRUaERuZHVyRVFxaTg4UkV5MG5hNVRnaWdrWWFKVG9z?=
 =?utf-8?B?SjdDcElzeE15ckZ4SUxoRC9MTDFaVExZN0xnNUFiYzJ2elhsQXpleDk1SUpD?=
 =?utf-8?B?SWZ1aVM5RCs2a2I5MVZYZlVoOHhCMS9Lb3J4Y0ZMT3VkNW41Y0oxbTVmeGl0?=
 =?utf-8?B?VW1zbnI3M3dPbTlqTGhFWHN0ZmY4TGVISzBONFM0SFJGSnN4T2l3NEhPRVpj?=
 =?utf-8?B?V1ZOM2JyK296T1dwWUZyZkx0Q1V5SkNPS0NmRFI5Qm5McG0zdkMwS1VPQTVQ?=
 =?utf-8?B?T1RWWkpGZ1F2Rk9HSWl4WDlLOUdtNHV3V2wvWktYYndORnpCckFZbHBWU3Vt?=
 =?utf-8?B?SHQyd255VFg1d3hrQ3k3Mnl0QnFtaExwWWxmSGp2SXJpVk93eUwweXAzc09O?=
 =?utf-8?B?N3VtcFBXMGk5OUd6dXNNZ0IrdmlKdllqRnppQjNvclJyVVoyOEdIbUpmbmVp?=
 =?utf-8?B?NzdpcFNiK1h5dm5LWDJKNGJGZmFUczFFTlFOT2R1RHVaYkptWGxrUGJEeFNm?=
 =?utf-8?B?QlJMK2xPdmZuMytyKzlmbTYvS0VHRWtyNW95YUJhbXJoSE8wdUZ0TnFTTnVB?=
 =?utf-8?B?L0dRcGZBREhwRVZ4cHZ3Y2NnbytzcjJHYWxsNlduMlFULzRtNzJNa2JTUzU1?=
 =?utf-8?B?VE5NZ0UxbitjYzdaemxLWHBJOGdweEo5d0RNR0FUYS9OeG9LVkxUMTlGUU12?=
 =?utf-8?B?SDY4WE8xNnE0dzQvR1RERWRBbktMYUQ1d0w5OEVhODZiZSt4YnJEY2ZCWEJG?=
 =?utf-8?B?Ky9QWHpLa2tsV0VCd1A4UHFDdjlGcGtmRGRnbXU5blhRdTdGcmN0WmRCOHBK?=
 =?utf-8?B?aTRnWmFudUd6Lzd4VzRLRm9Vb2RkOVg1NW9iSnpDMGpMZ214U1NKSmVRQ3Iy?=
 =?utf-8?B?U3RmQzVYMVh1M1Nqckp6U29FVWNwYkx4dmNXUWxsRkpVMGljS1p4K3JoUG9a?=
 =?utf-8?B?ZnVtOU5iQUR1VjlTQ2NiL09PdlkveXo0M3VqZkx5SXcySGk4bW96NjMvc09h?=
 =?utf-8?B?aGw3Tm4wM1VDZFZnblFrYjhYRTlFK0VWWnlQWjZUNllxQWVNcDI4K3Y4U2py?=
 =?utf-8?B?TTBIZjFRK2hPL0dsUWdPS1RPMVpESWllTWdwREtxaE9DYTR1Qm02KzczVWZO?=
 =?utf-8?B?Z2J3aHUySjFhVkNuSDJaWFFiejZoL0pxUEZRL0svY0owL2paZ1hSZjdFNUFC?=
 =?utf-8?B?VEdZTndQL0pyTWE4eUZJNURETHZQSkFRY2k5ZDVOMU4yRXJaZFRjYkF3ODZi?=
 =?utf-8?B?bTBBK3VtcG1JTVNoSkQ2QXBHZTFSU1JXcG9WNm1nb0VPMjI2cUhnZlY4Mk9R?=
 =?utf-8?B?TE1qOWxFeHpwWWZQVkpzMnhnRzY2aDMrblFFNGZpLzJJUG55NjMrQjRVeVR6?=
 =?utf-8?B?WWxGclpaV1lPZmg2MDM5QU95QklLVmNvQ3hZUTg0RW1EQWYxK29tSDF6d1pU?=
 =?utf-8?B?Yy9BSytnaktuWnZlYXJIVm8rNGlxN2N1clF6VFIwLzgrQzVsTWhVTFFQeENu?=
 =?utf-8?B?Z3d0QkphMmZYd0hoM2tmVURSZ011ekJkdjVhc0FxUlBpbVlOeGVjSnpCOXFY?=
 =?utf-8?B?eWtXanRmTzNKc2lPMEtGSndYLzh6TFp0NDJIVmlQV2tsd3pNY1VTUG94R0Uw?=
 =?utf-8?B?dEtMcjArT0RWdzc4c3NnVFVaUldVWm5NOFY5blFSSTJLODEwdXp3K25Pckt6?=
 =?utf-8?B?VThmN2ZaNEFudVlyaE1EclY0N1JNQm5xbFk4U0FDN2dSaEFsd01uQ0tZQkd3?=
 =?utf-8?B?RlpDUmFsVHYxZ1BQZEJveGYvd1ZEZm1iSUxrM3dFaHBtV2NtRGY3ZmFDTCtZ?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0183b2e4-a37d-4cff-f03c-08dd5b3cb959
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:50:52.4201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2s+fWSrX4Dh9d4t+HpfHz8G1gLDJBUj3/zrKMTTNxNcR0Hkay6P2SllnJEgz7NmfX/eKuSOZfC85EsmBlQIzccRybTznzDDwltpgbVp9xYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Mon, Mar 03, 2025 at 07:47:50PM +0100, Michal Wajdeczko wrote:
>
>
>On 03.03.2025 19:06, Lucas De Marchi wrote:
>> On Mon, Mar 03, 2025 at 06:35:20PM +0100, Michal Wajdeczko wrote:
>>> To allow VFs properly handle LRC WAs, we should postpone doing
>>> all RMW register operations and let them be run by the engine
>>> itself, since attempt to perform read registers from within the
>>> driver will fail on the VF. Use MI_MATH and ALU for that.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt.c | 84 ++++++++++++++++++++++++++++----------
>>> 1 file changed, 63 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 10a9e3c72b36..8068b4bc0a09 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -12,8 +12,10 @@
>>>
>>> #include <generated/xe_wa_oob.h>
>>>
>>> +#include "instructions/xe_alu_commands.h"
>>> #include "instructions/xe_gfxpipe_commands.h"
>>> #include "instructions/xe_mi_commands.h"
>>> +#include "regs/xe_engine_regs.h"
>>> #include "regs/xe_gt_regs.h"
>>> #include "xe_assert.h"
>>> #include "xe_bb.h"
>>> @@ -176,15 +178,6 @@ static int emit_nop_job(struct xe_gt *gt, struct
>>> xe_exec_queue *q)
>>>     return 0;
>>> }
>>>
>>> -/*
>>> - * Convert back from encoded value to type-safe, only to be used when
>>> reg.mcr
>>> - * is true
>>> - */
>>> -static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
>>> -{
>>> -    return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
>>> -}
>>> -
>>> static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>> {
>>>     struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>> @@ -194,6 +187,7 @@ static int emit_wa_job(struct xe_gt *gt, struct
>>> xe_exec_queue *q)
>>>     struct xe_bb *bb;
>>>     struct dma_fence *fence;
>>>     long timeout;
>>> +    int count_rmw = 0;
>>>     int count = 0;
>>>
>>>     if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>>> @@ -206,30 +200,32 @@ static int emit_wa_job(struct xe_gt *gt, struct
>>> xe_exec_queue *q)
>>>     if (IS_ERR(bb))
>>>         return PTR_ERR(bb);
>>>
>>> -    xa_for_each(&sr->xa, idx, entry)
>>> -        ++count;
>>> +    /* count RMW registers as those will be handled separately */
>>> +    xa_for_each(&sr->xa, idx, entry) {
>>> +        if (entry->reg.masked || entry->clr_bits == ~0)
>>> +            ++count;
>>> +        else
>>> +            ++count_rmw;
>>> +    }
>>>
>>> -    if (count) {
>>> +    if (count || count_rmw)
>>>         xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>>
>>> +    if (count) {
>>> +        /* emit single LRI with all non RMW regs */
>>> +
>>>         bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM |
>>> MI_LRI_NUM_REGS(count);
>>>
>>>         xa_for_each(&sr->xa, idx, entry) {
>>>             struct xe_reg reg = entry->reg;
>>> -            struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>>>             u32 val;
>>>
>>> -            /*
>>> -             * Skip reading the register if it's not really needed
>>> -             */
>>>             if (reg.masked)
>>>                 val = entry->clr_bits << 16;
>>> -            else if (entry->clr_bits + 1)
>>> -                val = (reg.mcr ?
>>> -                       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
>>> -                       xe_mmio_read32(&gt->mmio, reg)) & (~entry-
>>> >clr_bits);
>>> -            else
>>> +            else if (entry->clr_bits == ~0)
>>>                 val = 0;
>>> +            else
>>> +                continue;
>>>
>>>             val |= entry->set_bits;
>>>
>>> @@ -239,6 +235,52 @@ static int emit_wa_job(struct xe_gt *gt, struct
>>> xe_exec_queue *q)
>>>         }
>>>     }
>>>
>>> +    if (count_rmw) {
>>> +        /* emit MI_MATH for each RMW reg */
>>> +
>>> +        xa_for_each(&sr->xa, idx, entry) {
>>> +            if (entry->reg.masked || entry->clr_bits == ~0)
>>> +                continue;
>>
>> why can't we handle the normal writes here as well and avoid having some
>> written from the CPU side and some from the GPU side?
>>
>
>there were/are no writes here, we had reads only in case of the RMW
>value that had to be programmed in LRI (previous approach)
>
>and we have two loops since first covers all simple writes as all could
>be programmed as single LRI command, while second loop emits separate
>MATH commands per each RMW

alright - I was misremembering the part of this code. After double
checking and clarifying it offline, it makes sense. Thanks.

Lucas De Marchi
