Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E3D3B98A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 18:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548810E03E;
	Tue,  9 Dec 2025 18:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7oMfbgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7E210E03E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765303808; x=1796839808;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xG6kUnW+b12+nJKAVDPjD0ozQM05nuSSwAORPwACuJg=;
 b=k7oMfbggIiMGcJZ2az/t94vYqVEZ9iq9RkAldowe3CCoqoUgRSzv6o7W
 CiruUeRGMZAjBrvk/lumCvoLZIODmZj9sao2biLVSIj4buliF7ShZtGxw
 N6PEdM5jcVqa+MvpI+j0vp7QVo0fBUfU0zCJczEAtGV2C05Qtee20P4n+
 aTxOqWWpkTEKISu80yXSzkmt5HPayuubFUyXdoyQ+KVHVkF3yGT2FJx+h
 qI23dqP1GwY5KD7RkzaTzwnxhNpXUi2VkqMlCoLKchJBS8K9Wen1E9RvK
 NMQlVtJ6F/88eJcivV7/6pRaRV3BNrTZmJGJNP9aKl7KRn+3oG96VvITi g==;
X-CSE-ConnectionGUID: TXTXWoZeTj+Me67ehls8lA==
X-CSE-MsgGUID: gwoo8A+xTq2zcZbBZqPULQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67226864"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67226864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:10:08 -0800
X-CSE-ConnectionGUID: UpPp3YtiQk+9PgC0Yw5FCA==
X-CSE-MsgGUID: UkACjXGPTO2/nBBhPd5w1A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:10:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:10:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 10:10:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:10:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTC6h/POuBzmg11HxGZtgOc1Jl+EOxbu0Dnzphr/+U7qefxzNVoTndzPl5hWt6fQBXyGHQuWYHPRUIB6eGvoDPpd5UXTJhkbmY3dh/UXPiphB/w7El/68D7hG2lBKtEbwtIrNkx5HiHt6K+a0FAEBjEFnUa3cCQezGufQH99irL///QszxHiJQWxF7VOEvG4wi4Xb+/L1Oz0ckZ5YjOpbmRGFTd0dyNQkMchsudW4XgKYIUX0RP7zARAF3PNIsigNhNSf7GPkMMJ4dH3wMTLwfvBWkGkfNYkMHzXWzhwh07ZGlFXwWHRBtGq+JKLmV5gM64ld6ttXax36g0uMQjrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5xW3mCZdDYvZQvSjIT3COmZ1VdpjmEu10GomfU6HUg=;
 b=UWq8hJ/BlQpF06uaXuJ+X/+pHOeNT4zBGTKF6wVmuBYJ34sgtLrXOXBTNe2NwBYjP+8Bb+YCHXuF3dvK10pYDXWKfWVLQ1NGxGGIFey8AGrg4FNHptEEME8Iwf0vI5QxcRw9EtlnIO0SwKkqV6veHJ364+JkubvM6b1ZN6qe/q4bXNOG9bAKMmqOeGvQTN2tdj0Y2f+K0Z0g6+ta9qJEOgVA2/5Cgo00E2YazIjZ4IPoXzbA0znpe2qIBkOlDR1IBvV5HQC8827suDlShH8feovvbfcA9XkEdjM+UmEevocWDE2lWoyqMDVEtrVr+Htkv4rteZRJtdI5wZhdVSvyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB9499.namprd11.prod.outlook.com (2603:10b6:8:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 18:09:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 18:09:59 +0000
Message-ID: <f6f9adf7-74da-4895-b399-a0005938e669@intel.com>
Date: Tue, 9 Dec 2025 10:09:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/xe/sriov: Add debugfs to enable scheduler
 groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
 <a203d8b9-628f-4b5e-94ac-fadd45b1e9c1@intel.com>
 <d6580e58-9e7b-4d5a-ae43-42154099260f@intel.com>
 <948063c6-f8d6-406a-9e07-25983777dbad@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <948063c6-f8d6-406a-9e07-25983777dbad@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: c56a3036-98ba-460b-5f7f-08de374e2a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1pRMjV6dEdYMnJYSkZXRWhNVmZoRzZDMVZCaHZGRkxxNjdzcUpEYlUvamZl?=
 =?utf-8?B?OXJBN1B1SnZ1S21jenBFd292RllqeHMralB5L2t6Mlp4MkxLTzY2dzJpQ3ht?=
 =?utf-8?B?RmV1K3JpTUhOMVRqWjJpcllTRGNNMHo0UHBvT2oydXZvbm1xRlNQYk4xMUR5?=
 =?utf-8?B?Q1ZlMjcyb2xqbmVpb21kdEw5TEpHRlV2akNNN3dWZm04RjM5K3RpUzE5ZU9X?=
 =?utf-8?B?c1I1WEwvdERNcmxBS085VUxRanBJb3dkWlBucE5hU21ZNVhqN1hCVjFsWitS?=
 =?utf-8?B?RUoxaUs2QUQ3Wm1ZVXFReXB3Mk8ybm02UEpMRi9pUVBodS91N2dzeWZLTVZO?=
 =?utf-8?B?MVViaUhsZzUxcnNadmdIYThSdUdXRlJDZEVoRVBaeDVVaVNwOXhqSXhLVTA5?=
 =?utf-8?B?SEttVklBRUd3Z3BxOURBc0ZDQ1FqUjZ1UHd1bFZmZnhOOFJPN2ZwMllYTTVE?=
 =?utf-8?B?T04rQUtzVFl1OUhTaG8xaGZ1R0UxMmNRZDBIMlBITE5oM28ySzU3aFEwQTZN?=
 =?utf-8?B?ZEtyQ1hsODBDcDNFSkFEOUJQQU9ING01bEU0WnNkM0FQSC9GMVBFakY4NmtY?=
 =?utf-8?B?S3gveWd0UTJoVUdVb2pIcnl3WU5aMW1jaXphOTVDc2hnUHBKbGFodGdwUTFp?=
 =?utf-8?B?enJFZHZvUjVmWXRiWG8rSEFOM2RKaGthNlp5emFZWkRoN3F5UlBCUjRXVnUz?=
 =?utf-8?B?Y2tjR0s0R3BrS1lEQ2xiQ1NxVW5GRy9peCtIdEpoVmw4MTVCZjR2RUFaR2ZX?=
 =?utf-8?B?dVRQdUp5bmtPZ0NjQUNnM2gwZlhhaHB4NzJIQ1FnWXhoakhWL3dEMUFlTG9I?=
 =?utf-8?B?bHl3RjBvZ0JsU3BRa2VQSGlPZ1dxVmxZVzd0Z2VqdEU5bEJ5NzJsN3crbWli?=
 =?utf-8?B?UG9Zbi84VG9ueTFGM1lSUEViTFd2dGlLNlZaWlNEQ3pTRUFCakNpa3JIcmdG?=
 =?utf-8?B?eUVpcGhzc3d0Rm1ldjhiZGhQaWNWQ1dRNFIvaGQ0bjNBbnZqSytjTWpISXRF?=
 =?utf-8?B?dlE2Qk1uWGpRM2J5N29rVXZVTFF5bnZDS2gyNmpxSVJnclFPNVNTaFV5LzlO?=
 =?utf-8?B?angvbEZpMWd3cEdQSy9NYkJNaEhoSmh1MWR0KytBUXFPTEh5QXhqbENUNC9k?=
 =?utf-8?B?Z1pBVWN4dkJtRFFxSHpybEdwazVocm5SZXJITC8rbE50MURnUlh0UlNwU2d1?=
 =?utf-8?B?dFIvNk9yeEVXTGREbVdCTlpCMkI3WHNoTTJBMjlERTRUV1VqeEhrWWlNZjRQ?=
 =?utf-8?B?TFloTVF4a0JqbFdqdmZGcVNiTHBEZ1FaVFZpejJKSjFMRnROWkxqSVNBZG14?=
 =?utf-8?B?cjI5OVVURFM2SHNJam1CYTVuRUVmTlRKSGM2NEJVOUVJM3VWSm5VRTBFWStH?=
 =?utf-8?B?NkRxZ2szM2cwQWF4aEt6MnIwbkVSYy9ZTldNVER3RXVOb2NUMTdxVjMxc0xt?=
 =?utf-8?B?RFNTc1dhS2dTa3g2Q0xhMXhIeSt3dHZIUU9kU09ybUVBTWlHUXpPK2F1NVAz?=
 =?utf-8?B?M0J1MTRITThybzlnQWRsTEdiYVRZQzFFUFIxQ0drazl1TnF1NFlhcTNhelJM?=
 =?utf-8?B?WlNidGV3VCt0QnR6ZUxIUUVyNytiYUFoYVpHR2syaVBGa0Y5YWFnWWFjQ0Ju?=
 =?utf-8?B?UWdNbTNTdGVNbDdCSlJvSGNEQVN2UldGc3JYMndqYXUxb25ObGVueWx0eEtK?=
 =?utf-8?B?OTA2NVhSclJzSG9HYXp0UU1HRXFuQ055MEdaS3FRQ0UyMmdHRWhKK3NWbjVE?=
 =?utf-8?B?TzFEaHJTZHM1VjRudm9mL1d4UURyOWFaUWlzOFA3Y2pZQ0tjSnExVU42UE5O?=
 =?utf-8?B?RlFmUGg1L2t5Z0xMdFpvc05pUkhTQXZ4bENTK2E5SUJhczZvTzhNOE5wTXRj?=
 =?utf-8?B?dVVLN29QSU05ZU1BQ0hrUnE0c0NvUnk4WUtPeUpqQXlwQWIzRm1rTzgyWGRN?=
 =?utf-8?Q?bCBPzWZbpJxuPquCNiza9xLkaek3gaCY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZHOUVoWDJWUnpkUHJhMXdacUVVRS9qS1BDU09pcGIxZEcyUmIxVGpBRFFC?=
 =?utf-8?B?WFpGRzdLQWZ0SGNyQmx6cnBKRFVya2xXSlBXck9PdHNhVG9ENkd3czE4OFR2?=
 =?utf-8?B?eXQ3MkxYVmNjNkU5SFVxdFhpQVkwSStucmhPcTBncURpczBITy8yRnVXMkgv?=
 =?utf-8?B?NWlQSm9raXFmVy9ndmJMenVVNXNId2JBUm5aS0FNc2c5V2xkelV5VEdMRGx2?=
 =?utf-8?B?NDRMYis2ZnVYS2xlR2pBb2RhOXowVkJYeUUvSEpzYmlmeStyS1FFcEdxTnkr?=
 =?utf-8?B?RjAvZ1JlZm9xVk1IOWJCVUMvTXExc3ZRclpKUTB4YTgvUkxaWTRrTGpUenFh?=
 =?utf-8?B?aHdLa3FtU0lkZ0V4MXBEUUhCNzFmeFNqc1dLZ1BIa0lQT3pwdnY2R2JSV2R6?=
 =?utf-8?B?MG1QZlZWajQ2aGFYNnB4MTJLMjRtTkVKN3FMTXN1bnNna3FQU295Q3BheStO?=
 =?utf-8?B?WWoySHAvR3FIMVd3Qy9vYU4rd1dhWWllQmp0Ui9WY2t3YzU5Snd2ZTJpRm1q?=
 =?utf-8?B?OHhjRGVHS2VOSHBGN01HSHhvazRiKy9acDE1RmVXSU1mQzM1YklkK2QyVEhF?=
 =?utf-8?B?MS9rV3NDNVpBbVdieW9iaTM4UmhtNjJ3NzdNTElBa1l5NXVkcFdKUnd1ZFVp?=
 =?utf-8?B?WVEwdWRuOGVBYk1hdVBCTCt1SHJrY1l5QTNBbG1kYXdBNGFJZ3dlZUYzY1Nl?=
 =?utf-8?B?ZmtkYi9mU0E0aEtadEFSVHE2ZEhUM0F1L0x4SmRTajd4Y2owVWVJWjdmMEJp?=
 =?utf-8?B?V0w2TDF2dk42dCtkQ0l3RE95clJWNnBEMVJJaGpuSjdQUHgvekZMcWxodS9G?=
 =?utf-8?B?RDg0YU1RQzUrcmFaSU9nL1E1OUhUa0JVWHhVN1BBRVRuWk9tZmxBNVdhNjNx?=
 =?utf-8?B?KzVMU2J3V0tYSVJ5RURmRTQxOHlRTGc2d25ZT01UNWNEa1J2eDZjS203bk9i?=
 =?utf-8?B?UVRWUDMzVUNZL3BmWDl5enB2T0kzSnFQWlJaQnpja3JCeHpJN0hxNzhpNkhZ?=
 =?utf-8?B?M3RwSW84RU0vU1pqZEFpMGFwRCtzUmJuRjBmY2Z6OVQxbXU4dFFGVVA4OWo1?=
 =?utf-8?B?VmN1SUQ4WEpSWVNYaXRwU1hDdTdpRDNSZnlqaTJnNi9vS0JoSGROMm10cnVr?=
 =?utf-8?B?T2JORE1NYko1UjBkZ1laMnBmcWVuL2hMOWNiSFdUc08zVlE0NjFkQnRRVklB?=
 =?utf-8?B?bjBCMjlLN1Q1NTdKL01waDlRaVozZzNGOHlMUENXTGRiRnd1NEVMQ25WdTlK?=
 =?utf-8?B?YUpieDJJZGdZOTRhbVVOY3dORnNtQnM1bCtqd2dTRnQvWHFXMEkwbk5XUmZD?=
 =?utf-8?B?ODFQT05jcnM3VG9EQVRseG5oNFFyTDUwRDZSdEtSVkNkZE4xbTRQTmdvcWhv?=
 =?utf-8?B?T3paT1ZENi90OHJQOGZXWnNSaCtHM1RJYzhmL280YnQvYitNVGFpQUVWY2d0?=
 =?utf-8?B?ci8vTGtCRXY2M3h5UWxsWnp0UGJaTTdGWFJEWFpiT2EvOUZYNkszTTU5aWFq?=
 =?utf-8?B?S2lHVVpTVElsM3NBNnJXdmpVcWtnUzJuWTYrNHIvckRyVkN3dExSdTZCTFRU?=
 =?utf-8?B?MFpla3F4YWpXODdZSTh0bUVJS3M5UHlvamQxeThjZUhOanovYU9kRDhGbTJs?=
 =?utf-8?B?NDVWTWFjZjBobnNoL1owVGY5SEpXaGxTTDNuTlYxVzVYRzNVdUpLZzkycVdD?=
 =?utf-8?B?UFo2WmlmY0FPN25ZbHIzMG93UGpWYUNhaFgzaU5TVnE2ajltcHNJTWNFZDhN?=
 =?utf-8?B?cDhVUm05TWtRNjRiMGZ6UnhXK2Y3am5BMjN2eGR1TkN2ajdURGkwbmxMc01j?=
 =?utf-8?B?Q2hMUG5lU0VENWh6QVpTVWpCbzRmNmFiRDdPWTl3MzlEMnZNSkp0MG1LQTlD?=
 =?utf-8?B?Z2dISWl2dHlhWFVqVXN5USsyVkpnNFc3eWVjUmZXV2lWNW9MT1dIV1luOGlE?=
 =?utf-8?B?TlVsTklzVkhHSW5xU3dPdzN1cXBSUS9CY0V5emUvR052TXh2NTIwd051VE1q?=
 =?utf-8?B?YXZ5UjNBTkRncWJOMVlTeWtWc08wTWhYS1o2OFF3bDRnTlo5TEQzRyt1aFpZ?=
 =?utf-8?B?aVdUVnNnNlZhUHZ5V1dVOTAzcFVwVEJIN0o5aXdMQi9HbEg4b2g0WGZ1WW90?=
 =?utf-8?B?S0FqR1dSVnlkQVpUamU1SWpmRThBTEM4Rmo2QXhYOFF4bDQ3SDZaQkxMblk2?=
 =?utf-8?Q?cMMrJ6J/qqwF5KihHu0T0VU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c56a3036-98ba-460b-5f7f-08de374e2a9a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 18:09:59.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQwxqquYvF6HbUhXa1oTfClE6+DuerK0OYH2W/kxvBzx8L+FlR7KFpWhTL0XWPwrOPWkywSDAmwVborejpHbemAjzA/pmeg5ucBF8MLvGaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9499
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



On 12/9/2025 7:07 AM, Michal Wajdeczko wrote:
>
> On 12/9/2025 1:36 AM, Daniele Ceraolo Spurio wrote:
>>
>> On 12/8/2025 3:38 PM, Michal Wajdeczko wrote:
>>> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>>>> Reading the debugfs file lists the available configurations by name.
>>>> Writing the name of a configuration to the file will enable it.
>>>>
>>>> v2: don't print anything if the feature is unsupported (Michal), add
>>>>       TODO for reworking init order to know if there are valid groups
>>>>       when we register debugfs, check for basic feature support.
>>> btw, recently in Xe we started to follow core kernel rule and put the
>>> change log under the --- line
>> ok
>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  19 +--
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   1 +
>>>>    3 files changed, 139 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>>> index 5123ff1fb116..1be23809e624 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>>> @@ -156,6 +156,131 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>>>        debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>>>>    }
>>>>    +/*
>>>> + *      /sys/kernel/debug/dri/BDF/
>>>> + *      ├── sriov
>>>> + *      :   ├── pf
>>>> + *          :   ├── tile0
>>>> + *              :   ├── gt0
>>>> + *                  :   ├── sched_groups_mode
>>>> + */
>>>> +
>>>> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>>>> +{
>>>> +    switch (mode) {
>>>> +    case XE_SRIOV_SCHED_GROUPS_NONE:
>>>> +        return "disabled";
>>> maybe we should be consistent and use either:
>>>
>>>      "none" / XE_SRIOV_SCHED_GROUPS_NONE
>>> or
>>>      "disabled" / XE_SRIOV_SCHED_GROUPS_DISABLED
>> I am ok with switching both to disabled. Or maybe we should just go with "all_gt_engines", to indicate that all engines in one GT are in the same group? Because AFAIU from the GuC POV you always have groups, the question is if more than 1 group is actually active (and it also counts as an actual mode instead of just being the disabled state)
> I would rather try to keep debugfs as close as possible to driver POV and GuC ABI, not as exposing GuC POV
> so IMO in case of no groups configured, we should show them as empty == not configured, not fully configured
>
> but we may want to change the approach once we promote EGS to sysfs
> where for consistency we should show "default group" with all engines, where EGS is N/A or disabled

My idea came from the fact that even with EGS off in sysfs we 
technically still have:

group0: rcs0, ccs0, bcs0, bcs9
group1: vcs0, vcs2, vecs0, vecs1

So the default state is 2 groups. But as you mentioned we can re-discuss 
when moving to sysfs.

>
>>>> +    case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>>>> +        return "media_slices";
>>>> +    default:
>>>> +        return "unknown";
>>>> +    }
>>>> +}
>>>> +
>>>> +static int sched_groups_info(struct seq_file *m, void *data)
>>>> +{
>>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>>> +    struct xe_gt *gt = extract_gt(m->private);
>>>> +    u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
>>>> +    int mode = 0;
>>>> +
>>>> +    if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>>>> +        return 0;
>>>> +
>>>> +    for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
>>>> +        if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>>>> +            continue;
>>>> +
>>>> +        if (mode)
>>>> +            drm_printf(&p, " ");
>>> nit: drm_puts() ?
>> I'd prefer not to add newlines here.
> it's not about newlines
>
> /**
>   * drm_puts - print a const string to a &drm_printer stream
>   * @p: the &drm printer
>   * @str: const string
>   *
>   * Allow &drm_printer types that have a constant string
>   * option to use it.
>   */

Sorry, I just assumed this would add a newline like the normal puts to 
stdout. Will switch to using it.

Daniele

>>>> +
>>>> +        if (mode == current_mode)
>>>> +            drm_printf(&p, "[");
>>>> +
>>>> +        drm_printf(&p, "%s", sched_group_mode_to_string(mode));
> only here you need to use drm_printf, all else could be drm_puts
>
>>>> +
>>>> +        if (mode == current_mode)
>>>> +            drm_printf(&p, "]");
>>>> +    }
>>>> +
>>>> +    drm_printf(&p, "\n");
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +

