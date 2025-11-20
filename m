Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28FACFA446
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 21:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982110E073;
	Thu, 20 Nov 2025 21:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1yxsUxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590810E073
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 21:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763673512; x=1795209512;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6GTkuTt2p2Ahr5SlXPma4fCh+LDZZ2y+RdieYLAr/CQ=;
 b=N1yxsUxZeFoe+gxpa3Sozo0GkM3GPPolXAkboWkKUbigyozz1OjvXgAv
 59fFjH+PppHmTscxvfZbcfjMIqekcD/EjXZ1+O3e5fMJb2pKWsgn+6lmw
 CGbSUZXfjCTTKtQMU6u1XNmOJYFWlhnFPk5rMbet8RhoUi6BgS5kHaYvR
 jeKuxFvU1EHyB0vgA4LPXPmuXnOAorhzIBhfwRlVV/yDoy6sQ3zqSHOP/
 JFHbP4aVQl/OVtiaMUPbuc49wesaSsTzZ8Dh8QFNT69/3Bhf8OGqse58b
 A54RPaEiAiHV9YtRF95x5SDHNZwAHIZOqOjII/UWQGjS7RtMs8OyKSDtN A==;
X-CSE-ConnectionGUID: zr5/UAePSqG/zoFmeq0Paw==
X-CSE-MsgGUID: smZaO15aQJmBk/vzKL8+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77228182"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="77228182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:18:32 -0800
X-CSE-ConnectionGUID: FIfzEsFUQS2BBVjfFQzgkw==
X-CSE-MsgGUID: +LpnPKSPQPuaAcyjKE437g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:18:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:18:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:18:30 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:18:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMRrBeQ399mUm6CT1oWaNu5asMhO2HMXs3ktyKgMcsjn2HE3k6oLQwXks3t4GA3sAHrDEv4KPCCewgDZ9/QE/IDKlibKSABz+TuiqYd+0ni34im2vuBrb1YlSAU+cRkYekGL39l1J7snAEx13mVg+HT5kkDZ2X2327zXGuwtejmUExTswO2tlGANkXN97q5Sbb93MBW8Q/ErIpDjodTHbxAhtZoo3s7FYBr+ZNqDituO+On3TKTI67QODrdVsbBwSzdHzTMo8VKH8qjrLIIW0/zuwqdjdTkYXR4rrcoLUm5kngdiLsNhvdgTbEs92s1fEmx7o+K03hV9zUHgyCxQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq+gUwbxu2V/IUsNdJXdUWutmXdQTu9T8Nnjtx6oCYI=;
 b=IqxFSxv3Ypd1FzzvtUYi3c9jyi0ZulRTpX+niQMUHhZPh2u0INsQpQaX24mIGrDmTclWeBuY5f1ZyK+6jEhatgkbGBavmE0Zjx93GkDxxLWb8K5s2MEXI9v5TsL3EV3Ls1OELqvbkMKecvE7DGxENXbUWRs03L6mgkGPPF2n0G/ilIKabZN2Nx1EnhzDzLveHBiYtN4brfjcda8NOEeuva/itSPVD8adCiqKOZNXmBd20vzPctkla18eihCQ04rML+XY4V6ZR5Hm6bEyC4tJVax3liXtaO/gTezYIUDdPu44Mj275T6sMCua5wCykR/gCEF2UPi4f2dM7Ffx9RNBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 21:18:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 21:18:20 +0000
Message-ID: <ee33f64c-052f-473a-a8f9-08d597dce87c@intel.com>
Date: Thu, 20 Nov 2025 22:18:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/vf: Enable VF migration only on supported
 GuC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
 <20251120145157.6995-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251120145157.6995-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:8:1::24)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 864b29b5-9af6-4fe9-e4cd-08de287a53d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnFTSTZ2SGhZUWFlU1d3SHJsNFlRTjkrNDM4cDZjRHRWTXJMN1cvUXVLRGlP?=
 =?utf-8?B?aXJXTTlGZmRpWmJJaFE5WmxFNmJnWnRFc285S0pqeGZscm9PRlhnUVhHaVhS?=
 =?utf-8?B?TTJhUC8vbjZEN21vYnJWN1lUeTlFd3lWN3hSUmZVSE85NDh5c1U0RjExL2NL?=
 =?utf-8?B?WFJ0TkV5UytaRmtocDFTMXREbmtQaGRZbnFmMW11b09hRWhLaUJUR0J4cCt6?=
 =?utf-8?B?dURCSnhZMWdITFR1QkVGclFyQ0tqSmNWTHREcU1uZloybmQxVnE0R3J3dlBR?=
 =?utf-8?B?eU1IUHl1UlRFRE9uVHlWRTBWaFlBSUFOME93N2xJbUZrQkh5OXhIT0t2c1Fq?=
 =?utf-8?B?a1JOSVh1RGpwREJWOEt1WVV1WU1IRG9uWDI3aUh3MERMbTEzaDUxdXVmQTdH?=
 =?utf-8?B?YjV6MmY0eUo1blo3UkFEKzFMRHA2TDRQZEFjYjNJRW5CbDE0TG5xcVBMZ2h0?=
 =?utf-8?B?c01NYmM2WlhlclpWRkFqS1lqMk5yT2ZLQ20zNmU2a3Z1U1V1Nm95Y2VCWHVZ?=
 =?utf-8?B?V3puL1RYUHhqSHMxbkhzbGtiQzZjVGUxY0ZyMTJXc2szSE1RcFhGYlg3SmJ5?=
 =?utf-8?B?RGl4VDViL3NsUDdiTE9PeEdpdVdVM0JDL3d0NnhYbkE1MlFNdnV1QXhmbU5q?=
 =?utf-8?B?OTRuazVWMVNCUlBqeTlPeVJYNFJNblphS2twSURMc0VYMlRHdVVlYjlPRmtH?=
 =?utf-8?B?WEEvTVJYWTJyMDArSXVTYm9qcnViNmNxVnFnR21FejEvOExkOGQ3Y1c4NEVn?=
 =?utf-8?B?WStjNEc3ZnVqNm82T2RORngwSWZ2K3ZINXk4ejlvU0RldFNJeWFVWi9zM0dG?=
 =?utf-8?B?MHlHT2xrUGdhc2lqcXpPQTQ5UmdzR2xHWjNZUHk3YU5GR09iWll2OUZGUlVB?=
 =?utf-8?B?SmNSWFVBeDRRMFpLQzRTQ0xlVFh6TjhlcUM0QyszRlhuN1ZSWHY3RUdnK1Ev?=
 =?utf-8?B?dEJsMzNXZG5tSVVDQ0RxZ3ZvbGZIRUZDN1VLanlpWWlmNzd1WXh6RWR4aTlx?=
 =?utf-8?B?TG94aTlxdXI2c0dDQVJ3QzJ4ZWlDU1UxU0tBOEU0SEZhVzNCbTdPR3JEdDFM?=
 =?utf-8?B?V0ZZWHU1TGFLU2pjdWVTSGtjUnN5bk9jdklpajZzakNGRlpNeFdXR092L2w5?=
 =?utf-8?B?eGp4cS9DQ29ZRFMvcjVJR0psTDBEYXI5QTFPMC8wczBTVzg3NVJCWHN2V0lR?=
 =?utf-8?B?V3RnRldzdjREcXBsQTBwSWV5TkdjRzU5WWRBNFBWUXdsWVhTTW9WeGI1YzEv?=
 =?utf-8?B?dFR0N1UzQ3lXby9GQ1lxVjN0TXl0ZGV6YjI1a0xQcURxSWRGNDU2aENCRFNt?=
 =?utf-8?B?NDY1NWs2SWpJWkNuR3ZMVTY3UGdXYlcrYVFXclBsclBoMnY4U2NQcEdnbEp5?=
 =?utf-8?B?WE9IWGxwVkc0R01GQnJ1R2REcm5rNkQ4Y3k1TmpCNVo1SFVkRzFRaEZWSWlP?=
 =?utf-8?B?Wk1vREFscDZlajZCSXFRS29vRGNaSjBXekxkLzJITkNVb1ZzUCsvZlZEN1dU?=
 =?utf-8?B?bUNDYjlldUtmQW5lajAyK0Y3UTcxbndHY1o2VTlLN2J1RHhsRkpsbTBadjRj?=
 =?utf-8?B?THJXdXcxakZrNEtKblh1OXpWb0xGM01yM1ZpRVZPVFN1R0Ira0lRdTFmVnYx?=
 =?utf-8?B?VG9VU2JEamNRY3lsWGtMM2cySjV3eVorM0F4OFQxQUwzdGFNN2FmVCtBdzlI?=
 =?utf-8?B?UGpJWlo2N0JEOVFlb0dWZldDOTB0cEoxVVJrQnc1ZHRQaGpHNW91d2tmUUpo?=
 =?utf-8?B?dVlPZmIzTURkQldNMmtlTnBtRjVqVFJQakxJMzZEUEVlRTlkcjRncld3Um1T?=
 =?utf-8?B?YzBSUXF6NjdxVm1WdjFocjJaeEhpc01kdm5wWFVXc25pcldzZU0zaU03ZkRp?=
 =?utf-8?B?aE5DMFgzVHlzS2w5SzRYWDhselRublFMcmE4ZVJidlFXcjVhSVVXNE9QR29T?=
 =?utf-8?Q?n85tdy2cEI0+SnUqHGoAotSp/6FSGNm6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBSM1crMXFPS1hPRXhaMTkvVUt4a0JjNVZGT3lJc3l5NFpwOE1VR2JESlVu?=
 =?utf-8?B?aFJFWm1TNDJ0cEJ5ODljb0FxcUl1czEzN0dtbXVXQkh4aitxUEM2V21KWitj?=
 =?utf-8?B?RUE0NGZqRzk1UHZtS3IydTZWSks0c0diNEFiL0dQNzJrMktaaTlJMVN2QS94?=
 =?utf-8?B?R0pnMS8rdHFTOTlFckdWdUNiMHVQVjBkOXZPUE83VEZsc3YxbHhuRmxNa01Q?=
 =?utf-8?B?aUI5aXVBS3Z2ak1BMzJ4ckhVSG9pMTR4UkM2OFlXaXhiRHA4MStLMTB1bFBZ?=
 =?utf-8?B?bExBSE9PWFhYUGZXc1BpRlRoQWRaWitFMUI5akh2emZod0Z3eTYyd2RJVzc0?=
 =?utf-8?B?cDBmbDVNUWdQc1luQXV1bUJUQmhkL1RPejc4Q1p0SDRJb3hQVXFmays1MzNM?=
 =?utf-8?B?MGlIZmQzVzJoVFJvODlTOFJ4MDNUSTF2RFlMYlZCeDBFSEhVVlpYMHIyNFFx?=
 =?utf-8?B?cVJ4WXYwdlRvZ0hoQmZqOHBUaXlHcXE3VUpPNmRRNGc2VmRRYldwOGdFZ2ta?=
 =?utf-8?B?Y2xYdXpWVUFBMXNHY2d2aGJTZmlVbmZDcG5Fei82clR6TFFSRUpqNFlzeVQ1?=
 =?utf-8?B?VWdvMEZNZmg1bXUrRkdtTCtMdHpjd3cwVThuV3A2Zk9sVzNnVDR1czViKy9B?=
 =?utf-8?B?aE1WckFMNmJSSlRyakFrYjlKZUV2WEE2MDBRako2Z3ZkV3haMTJzK3AxbU1q?=
 =?utf-8?B?Yk1tZ3ZWTmY2Z1ZzM3FDTHBtNVF4VTFaTFQreG81TDNzNlFac2pGQ1h1ZGFE?=
 =?utf-8?B?Ym9KV3lvL0kzc2c4ZEZITzZ1UUV5UmlyaWNmcWpZdnNZUHBuUThhWWRqYndE?=
 =?utf-8?B?bmxvNTB0QVloUnhGR3NBNWpIaEN5M2srZWp5aEpUUzM4YisxR1UwRWxqNERF?=
 =?utf-8?B?K29HVURKYWw2WXNKYSt3YVJFdldDV1FNaFFSYjk0Vjd4YzdyVE45RzhrMHlP?=
 =?utf-8?B?SjFMUmdiczI3RUlINHF3RlJqUkd0SGZTWXdsS0JuQVljU1Zka3FreE5jSS85?=
 =?utf-8?B?VVBwWE9jc1FWMmZDTnFVMzZSU1h3cUd5TjRkenlJQS9HU1FDSkFuN096a0Mr?=
 =?utf-8?B?MEY4ZzBFSzlSS3dnMDZZT0gxR2NkMVdxNUpHUG45ZTB1SllrZVJ0dVM2dGRo?=
 =?utf-8?B?aDFxSmhEVWxiQWcwcUdDZGtFcXlFblUrSUFRWUtDR2VjSkZLSHRPcTJTQmpn?=
 =?utf-8?B?bWVJSHpmVDNMdUpnWk9tS3B5RHBUZ1JjR1hSdkYyV005WU9qZHJEaFpBQlhi?=
 =?utf-8?B?YXZiQmdHUEltUHFuNVZnbE9GTUozSFFvdjR4Z0pWR0lCNE9qcnB6TVM1SHFs?=
 =?utf-8?B?b05RNWx2MFB4OUNqV0dMZksxNWdjQ1RwUEd4ak8wNXYzbWlQZlo3K3FhelJk?=
 =?utf-8?B?aWdNN2ZRTm1MNW55MW9rYVM5Vk9IcmU3WHdsWVRaeTFlMzh3U3FzLzQxWHVv?=
 =?utf-8?B?M1A3MDBySW8vcWZ1eVYyaUtmUHEzNEFTY0o0UWpaaG40T3dtTURLdm5VMk0x?=
 =?utf-8?B?bWdCWnhKSWh0ZnBuMFhxM1IvejhEZnk2V1ZmWkNLNzVFaXlGSzFZMVVuZEp4?=
 =?utf-8?B?a3E0aWRHREpIbE1qTzhua084ZjdPWkJZLzdwdUJ4YXZqbElxOFdBaFBkc3lm?=
 =?utf-8?B?UFB2aUljd2lXb2hlbStlUjVrUmJjY0hTakgrckd0cHkydmpuNkppRW1jSnFV?=
 =?utf-8?B?Q2tmcEpIZUp4UmpmcG01aXRuWUZpLzRDbGs4ZFdMRTNBTkRkU0xYTlkxSVJ4?=
 =?utf-8?B?SUJ2NEJBc2VJL0dXdUJTdFNwekdJeEN6S2JwKzc1bWlWdmo4SUxiM0VDcGVZ?=
 =?utf-8?B?czdvYTZZcEx6WGJncGU4a05BQU1rSHBBWE5UaGp5ajk0ZG90NTdYRGRGSmI2?=
 =?utf-8?B?NVdUdFcvOFhZTGJRM2tVRC9IVHo1OUxVcWh0b01OcHFQUkhpVENNME9kL1By?=
 =?utf-8?B?NFg4TmNxTHpMYk1XVFFFZjkvSHhYSmM0SGRCbGlwUjhMV0dSWFNsWklGdlNZ?=
 =?utf-8?B?QXB1cENpZWNraU1CSGtuSU9YZkxZL0RCZXZROHFlVjVoOHFPcldET09aekps?=
 =?utf-8?B?dTg5WXdXWjdJVlR5VGpXb2RybjBpVTdvc2x5ekJFbXZONW82U0l0QjZkcm9X?=
 =?utf-8?B?dFlRMi9RaEVHSG15TGd3U3ZiK2FhUTBTaW1Dd2pQWDFhczl6ZXRQd3F2TjJ1?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 864b29b5-9af6-4fe9-e4cd-08de287a53d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:18:20.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQd499/J3I+zLp0f/RiSOr2TILohSBm3pgPmxSyVPGVdGd3sqMrydUw8qlvm7mBUQXjko4vw6IUU8zDtS4ycL/ftwrIUyKnBRKJwUthErlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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



On 11/20/2025 3:51 PM, Satyanarayana K V P wrote:
> Enable VF migration starting with GuC 70.54.0 (compatibility version
> 1.27.0).

this is only says "what", for the "why" part we likely want to add:

" ... which supports additional VF2GUC_RESFIX_START message required
to handle migration recovery in a more robust way."

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V4 -> V5:
> - Created new function vf_migration_init_late() (Michal W).
> 
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 284ce37ca92d..13cacdbbf2d2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -170,6 +170,20 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	vf_migration_init_early(xe);
>  }
>  
> +static void vf_migration_init_late(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;

maybe we should call xe_sriov_vf_migration_supported() too?

> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
> +		xe_sriov_vf_migration_disable(xe,
> +					      "requires GUC ABI >= 1.27.0, but only %u.%u.%u found",

s/GUC/GuC

> +					      guc_version.major, guc_version.minor,
> +					      guc_version.patch);
> +	}

and return bool/true only if we still claim support for migration?

> +}
> +
>  /**
>   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>   * @xe: the &xe_device to initialize
> @@ -180,6 +194,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> +	vf_migration_init_late(xe);

then here we can have:

	if (!vf_migration_init_late(xe))
		return 0;

>  	return xe_sriov_vf_ccs_init(xe);
>  }
>  

