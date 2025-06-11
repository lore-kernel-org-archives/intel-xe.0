Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678AEC71141
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0210E707;
	Wed, 11 Jun 2025 18:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJHNavJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8DD10E707
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749668118; x=1781204118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BphP0fX1FBvUmJCA4S4vNX5UemtcZG136lM/Xr2n4XY=;
 b=EJHNavJa82nf4pG1iVN7vIea6SAMK0FujBMs2zsd3bpNhRloDe+eWSeN
 vUb2alWk+PzZvYH+QF3U5Vp60JFNJDyehPexHiZPGKRyNhCZG/mz4DHnu
 gCLjsihRSqSZwX0nGcUbryx7ycbKXe7ASkg4Yww1f5Sy0dYYhfDcMtS/i
 /ITExutGvznGLXDM91KeJjhL5R4VSW5NFRIpUXLPEdMwib38rIUS4WpuE
 6zxuQ0azfV/uFrNGQ2XQYS9ZWtth1dZslyWj94Gbn1B31R7l+Qf71CEDw
 5oAhYFj9Rnl1GzwVzY5xNqKgTzEQLunFHPt1Tg1JdzFyYmj/lx0NWzou5 w==;
X-CSE-ConnectionGUID: WRpA1T4iQa+Mu/OXJbAyYQ==
X-CSE-MsgGUID: RY+djpVfQtCnW1fGd3IJqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55619239"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="55619239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:55:18 -0700
X-CSE-ConnectionGUID: mx9bgdhRT1yP21sgt4tWyw==
X-CSE-MsgGUID: r7MABtUfTA6jkzLvFTYgVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="151078160"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:55:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:55:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 11:55:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+1zxKqNIXAEOyqC9lLO0PyVaRA+lAdfbNCmwXIeJrtU/a9qIxzB/uZxyMpZcacW/qSykQmW3d/2ywqSzIVMjlx6esd6orSkNvlWpevBDnAal2UAmftL/ekBT8bO5ITpQBmXcHQNqxw9IXdHcBEXjDMelHdQIwXugIY3EIbYopXkmhjMmCG/m7wxx6UUC8pxXx0CfHbbNIcnRAS7XNTmS55Ycn7Z8ACJtFwW/IkfKgCbjS/CQKFhZl4PbWzfbe+E3G0OPKYkuQtqrct6R6/gDFdwo6qKp7gJ1Og2B28KlibwkigDRKdIBVtBCI1L6+7M8bBViNLc2REFuRxkh9N32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BphP0fX1FBvUmJCA4S4vNX5UemtcZG136lM/Xr2n4XY=;
 b=VbwZpKBLe/X2k8SoqQu2Ny2czlTM21M8242pj81s7JxhSmZxp2kza7xQW/meBt903VxU+eBw7oHHIfB4xMR9J0u11sTrU6PT8qpNtjlhtIlN4ewpeHvaBiSGyz9XldvLVlE4myPqm/rgXAcQErGqQNoXbzQCyPbw/VWoLq5a4VbQWNAO8AwfdG9YK7j60QbvwHISnUuWhAnhy+d2fvoqzoFvlIEMdPs4BZ/IaWojya5Z+A2orj4OPrcvpqFQzXF1Mkcspe5ZNOBRHxyvnOisW8C8tamrCIamjJ17B2lqOCA0l/fVBL4We/ny5ybvu08yp6LGMLMY03S1zmAxDF5geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Wed, 11 Jun
 2025 18:54:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 18:54:46 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Reorder 'Get pages failed' message
Thread-Topic: [PATCH] drm/xe: Reorder 'Get pages failed' message
Thread-Index: AQHb2cPoc0s/PSLmZEOlYi7UL+tYMLP+URCA
Date: Wed, 11 Jun 2025 18:54:46 +0000
Message-ID: <54752013e63df693c82e4964303c7c6c2dd36c0b.camel@intel.com>
References: <20250610045649.3149801-1-matthew.brost@intel.com>
In-Reply-To: <20250610045649.3149801-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: 529bfb5c-6c5f-43e0-7507-08dda9196fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enJXNTkwd2RteTZjQXlvZVlPcTRISUE0eHlESXNTeXpja1RRMldwYzBjRk9Y?=
 =?utf-8?B?bk91bWprVzVHVisrVHR2a1poVldvKzNkakdKSkw2b2Mxd3BWQmQyNlF2Rno5?=
 =?utf-8?B?Wk9jcmEvdStXbW11T0RVaWNtVzBWbHkyb1R1bjJqNjJ2ajNPVSs3Y0lZREZF?=
 =?utf-8?B?c3FBdGgxdlNiekJjTTVnZit5T0FETmY5cmJIZVZOMDZXUEZ0WjVXMThXY0ls?=
 =?utf-8?B?ZkFSOGp0cE9EOEpnWE9sNXZjYXFuRkZoUTJYWHg1Lzg4RlpXbUVtU1JtaEhO?=
 =?utf-8?B?dW1XZXB0cUR4UjJVdnVnNEdZUjVUT1FIQVVTMHkrNEx6VEJzRHluUTBnSFho?=
 =?utf-8?B?dlhHZFlwZ0FQbUhnclBsQXU3MnNhUldJYzViVXRlT1htZG95aFVFMHg2aTk1?=
 =?utf-8?B?NFUzajQ3dGJxQ0Z3UXY1TkxwMVVuV3cwa1NzZGI4c00zRFhYb2RnOTVEK1RH?=
 =?utf-8?B?MGhucXpzMURoektVeVpXbG5leXZ5SjV0OFJiNW1xeFROaUhEWDFOby9EQ0Ra?=
 =?utf-8?B?OGtZNzh5RGUrRnlHMDgvRkZNNFU0NXY3M0Zpb1Z2Q1E5RVdZNHV3MkFNVEZI?=
 =?utf-8?B?a0tYcm5DU2tsbisvVlAzOGduMmRZQXN4ZmV2cVl2TEkwWjgrVnZDZHRkSDhB?=
 =?utf-8?B?OXJXSXlOWlhXdnpxZUk0YTJhUG4yOTNlUDh3RGtKTXk5cW5Tc1crMEw1bmh4?=
 =?utf-8?B?THppN3lreEhSc3JmTi9KSnJDYzdoaUJzMm4rRGtaM3FEYWxtOWtZV3hYZ0FK?=
 =?utf-8?B?b0s4TG1LYndVRmhZS3ZaSzcxVlJCR2NpeVZCMlRSVnloZjQ2Z202WGtZdWFN?=
 =?utf-8?B?c1lHY2gzYlhXalVoRmUzWDhUSElnamFUdlc0TTNsRDU3TWRTVjN2Ukl0RER6?=
 =?utf-8?B?OXdJQ002U0Jrdnl3RXhsY211UjJneVpNVXp0K29LbTB5ZFVTRC94N3VDTyto?=
 =?utf-8?B?dWlhNm9JbUVnUWllbG5xSlhxaElmYVZHWWw0bkc3VUEzbzlpejdrbk1pem5Q?=
 =?utf-8?B?K3JXRkZQTFNXN1Q3VzcvRThaWW5QSkF5WVpXSFRIcjBnT25BN0xoOTVGQ0t3?=
 =?utf-8?B?d0xidUE3RFRsOWthMzV1ZWNXMncrc0lobHVoUHpJYURBY3JlakRpdktTVUpL?=
 =?utf-8?B?YnNmbVhIbHNyaDBTUDFOWFdUUW1DVDBSNEpBTmVURkE4dXVJNVZYOHlhcHVm?=
 =?utf-8?B?WVpjZHc2T2drMDJxN0VQcWZhK3UxVWQ5WEFqQ3pJRUY4cDlWTncxeW1DaU1l?=
 =?utf-8?B?YUVVM0RZN3VXMk5PbzFNQVQ1RHBBdGNjOWc0RURSaWNPVlJqN0tlT0VjaUNl?=
 =?utf-8?B?cGJCSk1kbGg5YkdwMVlPTWE4Rk9QamxSWngzVHlvWERERkZJSElOTHl0SWNr?=
 =?utf-8?B?Yk1jMjU4NVVjam9scW1kcGdrb04rUGN2a2lCNjFWMXA1L1VMcXhaN2k4cURi?=
 =?utf-8?B?THNGcjVjUVh1UUMwWGNlc1QwbkxqWGxFN0RaZWJ1TkplcFdLeFpUQ01BLzly?=
 =?utf-8?B?WU01SXJScElLc2h4a3EvUXdKTVZnR25iY0k0UjBPdHpxWkhBSlQ0QnQ3a2c2?=
 =?utf-8?B?NEJLNVpXZVQ3SVYwS3g0OS9DbjZOS1Q3QldnNmVSbFdBcWtEK0pvcWZZVzJV?=
 =?utf-8?B?QldHYksrM3Nvdm5qbEhvNkd0eVBnOWhhenRJZ0FBeHJzVVJoVCtNcDlyaWNO?=
 =?utf-8?B?UitKZ1BsWnQwTXNKc0RKMEM5YVNqR2hQbVp2RGpBU1NBdE42VHJjblg2WVlE?=
 =?utf-8?B?UU81eWVpZEE5ZG9CR1VvbGd6eWhxRFRXMWVVNkliUk41RTdqWXB1bkJUaXlW?=
 =?utf-8?B?M3grMngvNnNZUzNGdCtZZlhPMVlJUnp2L3B3REU0NWt6QUgzRHd4R1Nqemdi?=
 =?utf-8?B?SVJ4ODhHL1Z3NWxlU1h3b2VNdDIreHNQVjhqWlB3Sjl0Vk9MelovNEFEU3pH?=
 =?utf-8?B?TnM3U0VIYnM3Q0kvZ0RTY2hGaGRDQlhaampKQS9GT096bzUwZmlKKzlBVVE3?=
 =?utf-8?Q?ehrMtbjW1oGaRJ+m+r668uVQuqx/dk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1IwaHh5Nk1hV2k5cG5PeFV2M3lybWtJQkdTMHd3cGphVEVFaGxZbkVJOGpJ?=
 =?utf-8?B?YmFVcnNZajlmZ2RJQm9IK0JvMElLMG1qZXpFeVRjM2x5LytRZmNTMlFrdHdn?=
 =?utf-8?B?cnRWY3pQWU82Q3hYSk9MczMvcU9lRmJuNDIxa3kyK0J0Sm1YNUJuaDl3WmE3?=
 =?utf-8?B?c0lSRjU2N3o0U1lTYWlCbmpLbVVEWW9HWWlHVUYwSWZIWWF5SiszSEs4NzZO?=
 =?utf-8?B?cEdkbTVRVW01UDVJREVHb0JKUVRvRTh3Q3Y0Qi9YcEh1SCtWdCtCWUw0QkY0?=
 =?utf-8?B?MVZpWGZ4MGZ4eGhjZEg2Tk1FU0lNYnJqc0VjUDJlMHUzRTNXL3VIQ1NjV3dJ?=
 =?utf-8?B?QktWUmZYeFV3cUI0a1l4ZDVJR1V5SEoxRnJoUCt2b0hpMkwyWmN4WTNTamNM?=
 =?utf-8?B?VUFKb2JVYU5UMDBKTXNIdCtWV2Y1cnVURlhyN1JjUFVQU1k0NDFnamFuNVN2?=
 =?utf-8?B?bDlxUW1INkxsTUtqdDJTcEY2ajdkZEFPc0VyWmhVVzRmZzlGcWRna20rN2xS?=
 =?utf-8?B?YWdXc1ZSRzVxek9XdFNhVXpBSzRNNmdJL0hReTFRSnUxamtFbHJLS09TeFVM?=
 =?utf-8?B?VE0wMUlRY3F0YmhHY050cytvdENjZXN0dmVCbVFTSTlCVk1XdUlYWjg5dVdo?=
 =?utf-8?B?b3RqeXNjbjMzdkVoZXVpVVBscjdIb04xWjJOU1NEdk5tS1VlTTBFSUpUZVNI?=
 =?utf-8?B?TzBjTkpqVkpoSER5YzFSSWY1SlNWSFZobU0wOFp6L1ZWUXM3cmNkMnZUdGQ4?=
 =?utf-8?B?K00rdkJwWC9jZ3RDNWI3MnZidTVKWG9iZjUzTHd3VHp0S3N2YisvdHpxWk5N?=
 =?utf-8?B?dTBhN1V4OFV6VDM0ZXU3Zm9xbEtrQU1HMUd3MVkzUWdPU0NoVFIzQ01tZXpx?=
 =?utf-8?B?ZXBmRnY1TzZxNEdDVFlDR1BwNk1aZ0RueEdxT2N5Z3k0Z09FTFdycGVNWW01?=
 =?utf-8?B?YnNFY2REVWxWQzlkbEMyT1NqTmFSb0tlWmwveDNXRjdUZlh0c21FZDJ1UWh2?=
 =?utf-8?B?bnYvdmtlK3hGWUZ1VnFhK09QRURzM1FUNDVvVkNtbU5FRXpwQVk4TW9uVFhG?=
 =?utf-8?B?UEVoSDJhUnMvR2llS0N4NWdsTlVNekVHYlZlUVFZd3FsVEloQkFTTUFnd1Yr?=
 =?utf-8?B?cUp5NUdUVUYxbHI5ZzlvcU1JNEZvS1gxU3JyNjZVNkRIT3VHaGorb1V2SXJt?=
 =?utf-8?B?RGR3dmpsZzJoWkJrVjVwdWVXMXFLSWhKSW4yL1RzKzVKTFk1aXRSTG16UVlG?=
 =?utf-8?B?S2U0UndmbDJKZjc2aUFjRGZhUXZDOHYxbW1JUkZadHVFR0RqQVZCWitXYUdr?=
 =?utf-8?B?V3p6cjZ2Vmp6RDFVWWhaWTBNYlRSSWlibkUvKzA0aWNXRkw3UG00TXlsMFhw?=
 =?utf-8?B?SzJZbHpxL0k2bHNybXJaRXdsN1ZrVFNFMjJyR1pXVU1oNTRIUmpwTFFsMlRR?=
 =?utf-8?B?K3BrL1BlWEpJR2NWcEx5d2VmRkVlVEVPb3pMV0JtNzZvSWxzTGtVNDhGYitI?=
 =?utf-8?B?M0pxekIxck00NXpWeVI2bnJ2YWRZOGdSNEthaHBwN3dsVC9rVlN1RFdoSURP?=
 =?utf-8?B?WnBZTmFncGd1TmM2djkzN0VLSGJxY2J6azVtTnBKWVFYRFpuaUc0dmFEYzZR?=
 =?utf-8?B?RU5EWkl4dkhhWVRtOVVmNTgxZkVZekY1TUdmYVlxZHBBSEh0VXhyMlNSQ0Fv?=
 =?utf-8?B?Szcrejh0VTgxeVJUdm9oZlA3ZzFNMzRvejdaU0dQVlcxNkFNajc2NlppTEY0?=
 =?utf-8?B?R2ZCYkVySTJYNFVsNUtPOEp2R1ovdytUa1hLcVRBSG5vaFc2djJ1SW43RXVM?=
 =?utf-8?B?VCtPakdYdE9jRnRYVXVhTXQ2alc0Ly9nQW83eUNiZXZZeXV1VG1ublBEL21q?=
 =?utf-8?B?L3J1Zk83dS9ORzFUOWV6S2l0c0dPVTFlWkR4N1k4ckhRM3h1OWdwQVdtdWR3?=
 =?utf-8?B?a1U4b2pFUGQxNEtDN1F0S29ROTF2T0Q4K1JRdWtjc0pLYU95ZWU4MGVYcEtB?=
 =?utf-8?B?Zk84NjZlSWJYZGdaUVE3ZHRUdSt0TVAvbzNOK00zV0x4amQxd2lBTzBoZy9v?=
 =?utf-8?B?cU5TbFN2cHdhZ1N4Z0F2WDVEb1E5emVTcTg2bG9LZUU0aFJ2MGpkb1VIMisw?=
 =?utf-8?B?dENWQytvUXlrWk5ub25IVVJ0dm1ZbW1FVC96b0hudnFGL2hEaGZ4T2JhdkdT?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <802D16C954A1C8499866E993F5E53D4B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529bfb5c-6c5f-43e0-7507-08dda9196fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 18:54:46.8766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWyaV284I06q7KBtRoBMTQXp0DwVr+ZpiLsj2HIj12+rR0i89IpC3bz0oQgMujoXvtoxGvk1eJj4pmGWUT11A5MoEOjxY/mjHsamftD7xNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

T24gTW9uLCAyMDI1LTA2LTA5IGF0IDIxOjU2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFByaW50IHRoZSBlcnJvciBmcm9tIGdldCBwYWdlcyBmYWlsaW5nLCBub3QgdGhlIGNhc3QgdG8g
LUVOT0RBVEEuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+CgpNYWtlcyBzZW5zZS4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8
c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV92bS5jIHwgNCArKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gaW5kZXggMThmOTY3Y2UxZjFhLi5kMTg4MDdi
OTJiMTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+IEBAIC0yOTI0LDEwICsyOTI0LDEwIEBAIHN0YXRp
YyBpbnQgcHJlZmV0Y2hfcmFuZ2VzKHN0cnVjdCB4ZV92bSAqdm0sCj4gc3RydWN0IHhlX3ZtYV9v
cCAqb3ApCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX3N2
bV9yYW5nZV9nZXRfcGFnZXModm0sIHN2bV9yYW5nZSwgJmN0eCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyID09IC1FT1BOT1RTVVBQIHx8IGVyciA9PSAtRUZB
VUxUIHx8Cj4gZXJyID09IC1FUEVSTSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSAtRU5PREFUQTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJnKCZ2bS0+eGUt
PmRybSwgIkdldCBwYWdlcyBmYWlsZWQsCj4gYXNpZD0ldSwgZ3B1c3ZtPSVwLCBlcnJubz0lcGVc
biIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHZtLT51c20uYXNpZCwgJnZtLT5zdm0uZ3B1c3ZtLAo+IEVSUl9QVFIoZXJy
KSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
ZXJyID09IC1FT1BOT1RTVVBQIHx8IGVyciA9PSAtRUZBVUxUIHx8Cj4gZXJyID09IC1FUEVSTSkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBlcnIgPSAtRU5PREFUQTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3ZtX3JhbmdlX2Rl
YnVnKHN2bV9yYW5nZSwgIlBSRUZFVENIIC0gUkFOR0UgR0VUCj4gUEFHRVMgRE9ORSIpOwoK
