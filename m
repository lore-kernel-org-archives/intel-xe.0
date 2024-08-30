Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F67CCA0EDC
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 17:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76A610EAB5;
	Fri, 30 Aug 2024 17:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBw5CzSD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1410EAB5
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725039117; x=1756575117;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G79I2XZNgj729AI6cu1BqsysaASrKXXk13NaMi+HPS4=;
 b=VBw5CzSDhI19E985Rk9XpFX0riKh0E1aS0t3YCod+xSFgFw4H5joQ9lv
 cYGzhWDubMFf7QBR9IgjVhJIm8FB2CrIKTCf+2cAs2DKxpnbO9EZmDJ7+
 eBX+KeBE3VPdDxoWpFhe8PDGA9mpKdHYcdSDL8e8GyZSl8wwXtPOsBGNl
 Zu4Sp2XrfsMWLWeIaqQ51KSqAeR379m77uCuomau8fw8OviC64GqV+XPG
 WmMQCuaPJ6eaC5E9GUfSSnDtmA4Kcc0G5Ge34agN2NrPU4v+855u+iiOW
 HtpQz7UmlxGxkyjdT/EZoi1CGJf6GuXokodcEXhfUiHMCbOQJWT84YrcL w==;
X-CSE-ConnectionGUID: 5/4J0SbSRYWm9T+ADkZ1RA==
X-CSE-MsgGUID: pIXg5daITZGZcCK1/cOgUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23854785"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23854785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 10:31:57 -0700
X-CSE-ConnectionGUID: Hc39GIfVT9uuI0NKnqYg3A==
X-CSE-MsgGUID: v/xUiMgqToqC/MbZeUonfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="87199466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 10:31:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 10:31:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 10:31:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 10:31:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 10:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMmNlaKFTO7TMqN7Z/k/Kai9DGfzPL/YaPeoglUSChdVG06DwKK2P0byjyCLkOioSJptcHk6a+XoCZ6zuHQ6HPtswaSluZYhjwFS3micO9Ugme/tINs5mqjdXW0/UyTtAWbULxCzXbuMvQjsWaT9NZmQNjCXiJWg3UwfOqWLUbPJQ+aDCsDHhrnL4EQXZWS75UvbwvNdyc0gfKH63qzGEAPrwBMWLfWmWOotYQq/vpbwATlvxwKYxFN42Ia8DXvga8Ae72Rq8OQzdKdhyVGgXG0mxIusTxyrw1Z1cfTdEsFwu/0Ltv4u7gwqJURnyyvLhbh3KbWKk10gwg9wL3nO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz0tOe4uiwaPwcWQBlzun9Eh8oWpddA2dD2lTX+dDXk=;
 b=RVt6F4zLX4PfWuJH0T46xOK0oeF8ezii0W38bhpynxz//Tw8JL/58ASDgZYSQtu1vwDYnYC3t8SWEMteyg92ZCs6AuEr6vv8hK8Cg80UpnsXQ16UU8N9tFm3w/Y5hdnFeySipg297gwaxhDYhi4L8k2LCYwTLj3N4DxRRhoZXDf9qGwChaQolG6Poz9RJkFrh2AYl/RM6nMvWStPOxYxWt5tqGR35tcDYRtMf3U1oJlxi5MmVAjwN6+6cpKcfEI/ti61BdSFoFtAxsq2O63uwBk6yXA3D/qvyx+cHNN1ugglY2EeM4+G2Oyle97Ir4Fa/UgY3KnK0fqz7yBLYJeTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 17:31:53 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 17:31:53 +0000
Message-ID: <966190f8-c9de-473d-add0-116969b6f2b5@intel.com>
Date: Fri, 30 Aug 2024 10:31:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
From: John Harrison <john.c.harrison@intel.com>
To: <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
 <20240830062310.3450387-3-John.C.Harrison@Intel.com>
 <3792b964-9c47-44b7-b2f0-808cff4f239c@intel.com>
Content-Language: en-GB
In-Reply-To: <3792b964-9c47-44b7-b2f0-808cff4f239c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 512d5478-8882-4224-184a-08dcc919a35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjRHSWRXMTd2RTJGTHU4bmpBRWUwRGZaUzlOSnFVSjJpTG9tVGhQaWtVeVN2?=
 =?utf-8?B?QTZRT2N4NWFlZ01GY0hhRy9WNUE5T1oyTTZHUStjQmdGU2tlM3o5NEp5YWQ3?=
 =?utf-8?B?QkNEdmtsNlFocWJWclNsdHArWk1kQWhLSXFXMUkxb20ycCthMGl2dkNKZFVC?=
 =?utf-8?B?My93Qm9VeHl5ZTFiQ1p1Rkw1WTMwbG5Dbk15VmNHaG4vNXplV3U3T24wU3JF?=
 =?utf-8?B?Ti83VFV1NjltNXVwTXY4RUZRSW8xbnhXdHZIVm9QWVZvSEJ1WmZ2MWlRYUh5?=
 =?utf-8?B?QVBXWlplSFhpSkpSdXhoVGw3SU11VUt0cDl1Umh5Yktna2wxZnR5UDlndEt4?=
 =?utf-8?B?RTQ5Y0xaUkxZZ3JMRFpySkJkaUdjZFBERHBya2NsL0gyeGVyeGM1YUtkelc0?=
 =?utf-8?B?bVkvNHZDOTlTRWVGdnZSei9DMXA4bG5rUWxjbC9xVlpjT005bldJRTZ3U2t6?=
 =?utf-8?B?dmh0c2I0RzhSWUZ4b0RFSkdJaWgwRUxuN0xuSHRtWmhuNTJGMzRpUVNrTElM?=
 =?utf-8?B?WDljdjVFNG1WQ2lPZDBtQzRtR0xlbmFQY0tFNityUXpSZ25KSGN6RThCb3dw?=
 =?utf-8?B?U1FwZ3RUZ2M0ZjZQbHNtOU9ZdUlzVmVqUXBjelp2TUY4ZzBPTUswcE1NSFl1?=
 =?utf-8?B?S3hvWHFoVWNrZ1BjN1VoS2xxYURkaEFtSzIrVjV6ZTlwdGdzdERhejJMMHpJ?=
 =?utf-8?B?cmM4YlZya3ZEb1NrZlAyaE9Fa2lSRkQ1TXUwUnh4VG5LT3cyWkZKbnBERWla?=
 =?utf-8?B?YzEvZjVuSEFHS0FhbnJhZGFITFpPZUNwNkp4U2g0NkJZLzZPZmowZVFYaG9l?=
 =?utf-8?B?ejRwM2VtQW1EYWh5NndwN3dNU2VQYnpZV2pGcDF6RkFneVE1Q3hSaThYVE8y?=
 =?utf-8?B?aGs5SGhvdkszeGI1TDBXR04zNmxMMi9MdGIzdkMvOTgyK3ZwdCt6MHBvWGxx?=
 =?utf-8?B?L0U5b3g3OGtSM2F1QmdKUTk1dkFxMUhQRXl1MXdrd0R2NVZvaEFFSGZac3g5?=
 =?utf-8?B?dFpZSUZkUFF5QzFIb1VsQU9nTDg1RkFOS2xqV0lTSzVtODRONUFGMHNsUnBD?=
 =?utf-8?B?MmY1L0gzK1pCeUNLNXNFajBjbHhOWEl6NXYxTjk0Kzh5WEJPMjNGalJ2MFJu?=
 =?utf-8?B?VEFtbjJTSCtVTkU2bHdhRGhkVWJpRVh0RlZ5aU51WS90aFVQeTVLRUVPSjlh?=
 =?utf-8?B?b1RNSFJoOHhBa25oaTExM0QwK1VmeHZCNnVrT1Q1U21lZWtWa2tPa2J0UkhK?=
 =?utf-8?B?RmNhTTFxdGNZOGRpeXF1cmFNNFFFOGdCTnh6Q21rTjExUDlVam5iZndQY0U3?=
 =?utf-8?B?TjAvWmZXbDRZNjNDbXIzdDBpc3AxUzRObUtYRCtuSTFSR2k2YzlyNXRJTG4r?=
 =?utf-8?B?M2t1bG5FSmtlV1BtcXZLM1dxY09yQmZKT0NHWC90eS9nbjBLbGdmSWpDVm1w?=
 =?utf-8?B?SHNwUmtwK1U5dVhlN3VDbFZjL2RndlJxeVNRaUlrdkEvaWZDRVFGZ2FqeVhn?=
 =?utf-8?B?THJGc0JrNjZQam1uOEo0QWtQVVpYTGNybVlnQzJwVW1IOWc0Q2dVZnRkaldO?=
 =?utf-8?B?NlVCeWxmZjltYVlTZ3dVVGFCbTJOaTRjTUt4WGtkdGRId05xb09KTkgwcjBQ?=
 =?utf-8?B?SzhlaDNGdTVCQkkwYk0wc2lRUnFRakRFYXR4aG5sZEJmNUdDakdYY2d2QUZ5?=
 =?utf-8?B?c0RrVzVRcENxYm1meEF6S2hRdXFsZDBRMnp1OXVxbVdsaG1SQVE4WE80ZlhZ?=
 =?utf-8?B?aFdnQk5yWnNEdWJia2E4WW1Vc0V1QW9JOEJvN0J2cmFCdmdVUmM4Y1RCSHgr?=
 =?utf-8?B?SDkxdlRnamkxeUNzNER5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBYS0Q3VXVVL2p4NkNOZTJKTjNrbzdOaUJDVkdpdGpic3VlbFVaeVZTSUMr?=
 =?utf-8?B?YzhnSDZIZE5JSC9KSm0xWncyOUZ0dGtVNzlwZnYydHEySkF4M3JQWW0zV1Bi?=
 =?utf-8?B?aHJuMHU5dnRkdThpZGRsRXpRSUc4MG9QM0I5czRRNDJnQ3cyVGtna0lvUFAw?=
 =?utf-8?B?dytrL0IzTUlvMkd6bFVzQmozQzNEU0t3d0Y4VG1SK0hQQkVPSXpxMU5udkNs?=
 =?utf-8?B?Y0R1NThWaUJ5U0lqYnQ5aW14eGFaRWJNMU5wQUhWY2txQjZyQ2RqM3NkNlRv?=
 =?utf-8?B?cTdjVWd0SVdrakk5cWdCeTU2WDNkSFM4V0kvY1F4SUVEQnhHN29VWEpZbVdx?=
 =?utf-8?B?ZXA4MEFyb0Y4QUEzN3E1bmxCb1Q0ZllJZW5rMWFRazBDeE5HaUY0bmxkYWl5?=
 =?utf-8?B?U3MvRlRGai96WXFKOGxWSlFIc1BLeWc3Z0xqMmw0ZWR0Wkl2TzVJRVEwS04z?=
 =?utf-8?B?UVpIZjZzZmo0aEdGMWZhY3hvTkNUYXlXbGhETjQ5MFFsVC9sNG9tanRWOFZL?=
 =?utf-8?B?L2Myc0xiQ3ExSlF0TStWeENwVFcvSWh0L0sxd1UweWpheS9ROTliUTZTeFg5?=
 =?utf-8?B?ZUZXZ0Nmd3dnbVJWR2p2OWJ1MWx5azRiazFkcFhQZk5wRnJ0T1d0ZGtuOVkz?=
 =?utf-8?B?NlpZZTlnbXpzYTgxdENrWEpzVDl6RjFVMVRMOWhlS1FsZms3NjZqdGJlNktR?=
 =?utf-8?B?RUtoanNBalE2TndVUnhLWEtxMkRRcE9lRk1jKzg5YnN3ZUI1NzhFcTZYRVp5?=
 =?utf-8?B?a3MzeE9BSUtlanZPYURVdG9DcHI3Yy93TzdGNm96UDQxL1dnV1VZZ2YwVS9N?=
 =?utf-8?B?Y1ZpQi9mMi84Nk5DNXZRRG5PRGJOYko5ZVJnSHpMdWhYZWVzTTd5V1dpQ1RD?=
 =?utf-8?B?NTJMbnR2WlZmQ0JzaTZZeTU2Q0dja3I5OCswN3h2T1NpOEwrQWxtdzFlZUF0?=
 =?utf-8?B?MVVlY2NNQU16UU9yZGdDd3MvbVg3Yy9WQzFhSkQwU0xzQ1Y1OHFFWSt6dTZB?=
 =?utf-8?B?elJGZU9qQjVFVEhaTENMZlI4d1FhenFuQkltcFc0M1ROVVhONTZqbkRtaFVE?=
 =?utf-8?B?ZHdBWHhGRzYzeFRPQUxJTFhmdkdweWQ5dkNTczBKT1RVZitrNGxlcUtZd3h1?=
 =?utf-8?B?T3dpanlVTTB4enNyMHdqYy8xM1doWFluZ3hNUUw1MUxVaGYzRXdFVnpBaDFI?=
 =?utf-8?B?MUQxMTFnMlI4K04vZHo1d1h5R0YzSHIvT0hOaXA5amNQWjRXTXJxckhueWg4?=
 =?utf-8?B?V1Fzd3ovYkJvU2dLcS91WkR2TExDTzZLbGdHMldVY3drQ2VPZGRmZUR2Znd2?=
 =?utf-8?B?Q1phNXl5YTdicEN3TWUzWHZkSFp2aG5KdnU3amR4ME0xblUyQmxRQnZGV2RF?=
 =?utf-8?B?RS9rUmRzc3NBZWRoWVhKeFhpN3JVd0xTK0hONWlRLzdmbi96Ym9GWEhXR3hN?=
 =?utf-8?B?UVJ1Y0xIWTdyV3JPS1Z0enE2bDYwQ0VuRmxGMTZYSXFFbzMyYUs0QkZJWFhv?=
 =?utf-8?B?OHVSSlhYMWRGaFFBSjVXbEJLNmJJZVNrR1U3MUNWSXpoUHRidFNjSkdqZ0FM?=
 =?utf-8?B?VmlJUFIwVUZvS2MzanIyNW52c2dtbnhrTDVVcE51QjNKVm1pUWtkckJKQW5I?=
 =?utf-8?B?OUNZSUV1SDk4ZzgxUmV3ci95QXF5MUJJZVkwVXBRSGIxS21xMCtyNW5TZy9t?=
 =?utf-8?B?Nk4yaXhWbVpqNkVJTzQ3V3Z5YkY3Q3JtVndLc1hCS1Z0K0VSZ1F2cXEvaHZl?=
 =?utf-8?B?UXVKdzFHd0EzeHg2a3YybDRzYWhxTi9NalZ2cGRsN3JTR1pUNWppZWRNUHJW?=
 =?utf-8?B?cW5OZXUwYlBRL1IyTmRLMWNja3YwZW5ZdmhVTm1VZGZPUnBUb2V1REdjZzQ5?=
 =?utf-8?B?MFAzYW5vdk9aSHlvaktsbC9wZ3FCbldnZDZYWElMck5VNytScUNNQU1zR3cy?=
 =?utf-8?B?QnFQeG8vbzUzNDMybnJSMkJhUnIzTE9kY082R0tjdW5uZ21DbG82dDljWFcz?=
 =?utf-8?B?YzcyMW1vd0pxV3o2TkIyZFVDQ05KQU1Wc3QwcCtUUHZPZmpyWjlpcnFMU09j?=
 =?utf-8?B?YUltZFowQkZWd2h5U0VoZWhBYzNUME5IQnVwd1p3VGl6WXBmSTFPME9xekZk?=
 =?utf-8?B?RFVGL0JZUmhTN1JLelhPdzdQZUIya2VpciszRlVrVDVLbjJMZHBDQXRsMndO?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 512d5478-8882-4224-184a-08dcc919a35d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 17:31:53.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri3lwCWIHp89mVVoGCto5A7kp4Nl0S+CnUy9l5AgrzCoxMJ1X73yQ1SFLND1i99GH7zGI3uU511DHJJn0o//cG45aWb7vcDU6VETjLxY+Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

On 8/30/2024 10:29, John Harrison wrote:
> On 8/29/2024 23:23, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a need to include the GuC log and other large binary objects
>> in core dumps and via dmesg. So add a helper for dumping to a printer
>> function via conversion to ASCII85 encoding.
>>
>> Another issue with dumping such a large buffer is that it can be slow,
>> especially if dumping to dmesg over a serial port. So add a yield to
>> prevent the 'task has been stuck for 120s' kernel hang check feature
>> from firing.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> The intent would be to use this helper for the existing ascii85 dumps 
> in xe_lrc.c and xe_vm.c. Otherwise those will hit problems with 
> maximum line lengths when spewing a devcoredump to dmesg. However, 
> that will also add line wrapping to the regular devcoredump via sysfs 
> output. And I'm not sure if that would confuse the decoding tool? 
> White space should just be ignored when decoding ASCII85 but the tool 
> might well not be aware that the data spans multiple lines.
>
> One thought is to move the line wrapping out of the encoding helper 
> and in to the drm line printer helper. However that would require 
> putting memory allocation operations in the line printer and that 
> seems more problematic as that could be used in atomic context. It 
> seems much simpler/safer to just allow for line wrapping in the sysfs 
> output.

PS: Meant to add that using the helper in the LRC/VM code would also 
allow those to benefit from compression when I get around to adding that 
in. And that will significantly shrink the devcoredump file size. 
Especially when dumping large user buffers!

John.

>
> John.
>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 76 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index bdb76e834e4c..eec7b89ab48b 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_devcoredump.h"
>>   #include "xe_devcoredump_types.h"
>>   +#include <linux/ascii85.h>
>>   #include <linux/devcoredump.h>
>>   #include <generated/utsrelease.h>
>>   @@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
>>   }
>>     #endif
>> +
>> +/**
>> + * xe_print_blob_ascii85 - print a BLOB to some useful location in 
>> ASCII85
>> + *
>> + * The output is split to multiple lines because some print targets, 
>> e.g. dmesg
>> + * cannot handle arbitrarily long lines. Note also that printing to 
>> dmesg in
>> + * piece-meal fashion is not possible, each separate call to 
>> drm_puts() has a
>> + * line-feed automatically added! Therefore, the entire output line 
>> must be
>> + * constructed in a local buffer first, then printed in one atomic 
>> output call.
>> + *
>> + * There is also a scheduler yield call to prevent the 'task has 
>> been stuck for
>> + * 120s' kernel hang check feature from firing when printing to a 
>> slow target
>> + * such as dmesg over a serial port.
>> + *
>> + * TODO: Add compression prior to the ASCII85 encoding to shrink 
>> huge buffers down.
>> + *
>> + * @p: the printer object to output to
>> + * @blob: the Binary Large OBject to dump out
>> + * @offset: offset in bytes to skip from the front of the BLOB, must 
>> be a multiple of sizeof(u32)
>> + * @size: the size in bytes of the BLOB, must be a multiple of 
>> sizeof(u32)
>> + */
>> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, 
>> size_t offset, size_t size)
>> +{
>> +    const u32 *blob32 = (const u32 *)blob;
>> +    char buff[ASCII85_BUFSZ], *line_buff;
>> +    size_t line_pos = 0;
>> +
>> +#define DMESG_MAX_LINE_LEN    800
>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /* 85 + "\n\0" */
>> +
>> +    if (size & 3)
>> +        drm_printf(p, "Size not word aligned: %zu", size);
>> +    if (offset & 3)
>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>> +
>> +    line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
>> +    if (IS_ERR(line_buff)) {
>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>> line_buff);
>> +        return;
>> +    }
>> +
>> +    blob32 += offset / sizeof(*blob32);
>> +    size /= sizeof(*blob32);
>> +
>> +    while (size--) {
>> +        u32 val = *(blob32++);
>> +
>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>> +            DMESG_MAX_LINE_LEN - line_pos);
>> +        line_pos += strlen(line_buff + line_pos);
>> +
>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>> +            line_buff[line_pos++] = '\n';
>> +            line_buff[line_pos++] = 0;
>> +
>> +            drm_puts(p, line_buff);
>> +
>> +            line_pos = 0;
>> +
>> +            /* Prevent 'stuck thread' time out errors */
>> +            cond_resched();
>> +        }
>> +    }
>> +
>> +    if (line_pos) {
>> +        line_buff[line_pos++] = '\n';
>> +        line_buff[line_pos++] = 0;
>> +
>> +        drm_puts(p, line_buff);
>> +    }
>> +
>> +    kfree(line_buff);
>> +
>> +#undef MIN_SPACE
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h 
>> b/drivers/gpu/drm/xe/xe_devcoredump.h
>> index e2fa65ce0932..3f82188590ac 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
>> @@ -6,6 +6,9 @@
>>   #ifndef _XE_DEVCOREDUMP_H_
>>   #define _XE_DEVCOREDUMP_H_
>>   +#include <linux/types.h>
>> +
>> +struct drm_printer;
>>   struct xe_device;
>>   struct xe_sched_job;
>>   @@ -23,4 +26,6 @@ static inline int xe_devcoredump_init(struct 
>> xe_device *xe)
>>   }
>>   #endif
>>   +void xe_print_blob_ascii85(struct drm_printer *p, const void 
>> *blob, size_t offset, size_t size);
>> +
>>   #endif
>

