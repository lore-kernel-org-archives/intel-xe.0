Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62167D0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FBC10E43B;
	Tue, 25 Nov 2025 19:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c87zKpoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7054E10E43B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764098043; x=1795634043;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7NqDSggHdzUlw/m/sb9gJQgXkehp57If4gfD/SYpeYk=;
 b=c87zKpoiPEv4ugRUPSVf4Y+nauKtszfEDp/QXr9fTmg7bTY+IGmiNdq0
 3DRtgfmNZo/gwP5AiIHK2ZeTT4CvzZCWL1DZuPEZ/A98et65FiVnIxRth
 /JyPGDGs1vjhlMXllhl60sL+5nUWqtpJfEYzlxJ3U7iVDuK3yq6eObibv
 tBOqGqcSobemIo2jbKQIehpEdl0hWBfF4xHMu7IoAA/JpCUYFK7UZTpoY
 N8PzIjWOOtHLBJxewy2PbuEA+sZFt+4s/Co3LiiWLouu6RYmRlS4nEIMm
 i8a2lZnqCWlZONMYWaPehat6NqhKB9IeM3JWzFTFUpHRca0ryLl9pcIam w==;
X-CSE-ConnectionGUID: PpUVWB6kTQGB+QmIG0uG5A==
X-CSE-MsgGUID: 2ZoOPyvfSgGrCGjNuFc2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77237871"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="77237871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:14:02 -0800
X-CSE-ConnectionGUID: /pqpqaC6Q7a7qcQ/L6NxmA==
X-CSE-MsgGUID: ychTOMviRkefxympv8z/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193159338"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:14:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:14:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:14:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUizSuBYRudOpD6Lx7Q3ZTwkMIlxA64RYsRZRAQ9KCQN9pvVW5ELBP6Red7A0IcWq9woJ4ktp/WcIdlJaaAekcAdtxdZfmRVdYpNkEicTZpKIl4uvDAoQsd0hOSZR43SFGtSPYDJenvJpyGkaXcG5q+B+u1SAnfW8MqhXPdHWRTU4LVjrgVXRvxuqw2Q9DNSUamsW6Eyo63xmgFk8e8jK1UrVT6OMw0BtdU9pB41T8GcLgDR994ycBjZ/k0wqVOWdpmbUAs51LmPwGHWOfD5RPtpEf15/Vg6c4upSaCWkb76KAtB+QLxuA+na2HR1kuqeaTMNe8Sz7saQI5lBHKXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBH6FboqyedpGO+gmXLJVV8KlErcoEaXgd9EP3mq3ew=;
 b=rN0MSAdI/93+s3j5sWisBqWt2FgijhQ6UU/8utQLK6NDOzcOvb77igXZYRVmObAQtjiW3zdVKOWDgmb0f9chsDJdh2H29yYOtyTRV7lL6K25Am+mzzBoGL8bNRKkwwpdzBWBD0kqKAagm13p2Y/HUsF+L3wRw6jTmUvSdADVgSkHYSpSeBFwE7/gq58TwbdR6qIzqyH86X5xwaJYybmWVQJZRbr2lRIAAXjAlhS83sWPKmGYNnsho0Hgp5+DtPjMCRS+o56WRwW/p0F7FSZgtICy74eMDtyWBjYwe4UqparMIl9pGUqWraKiBAKYa+BKVgLYj27QZhyG1NoVWnfzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 19:13:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 19:13:56 +0000
Message-ID: <d30cc881-706e-4c6d-9307-4cf927343504@intel.com>
Date: Tue, 25 Nov 2025 20:13:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 PATCH] drm/xe/xe_gt_ccs_mode:Mutual Exclusivity b/w Multi CCS
 Mode & SRIOV VF Provisioning
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
 <20251125165749.2616038-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251125165749.2616038-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: a7845e7d-12e3-4d80-94e8-08de2c56c794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXNUTVIxZ0FKWXI5NXdzT3k1Y2dIdTFHdWtwdHFjNUQ4QkRmL1BCRUIrNlJ4?=
 =?utf-8?B?Sm5tQWhTdkFtWHFKOTFLTTF5dlJDQ05ET3oycnFkeDFKN1pndTZEeXZEeFZU?=
 =?utf-8?B?MlplT0c0UU1pYUdMNHJ3OTJtRkFrU1U3MWNKaGJGVXg5QVdFWWlubVhmVzE5?=
 =?utf-8?B?aDdITElNM2w2NHUyaklGRUp4Q3duTDRBWCt4S28yZzh1MmJKTlRGR1M4azBG?=
 =?utf-8?B?MFVkU0NDNDZIODJRMGxxQkkxS3l5bHU3b3FLa2xiT0tTdVFKeXZEMDVIQSts?=
 =?utf-8?B?a1BuU0MzL0lyb1U5dDg0WGNzcVBEcEdZZXpSWUJGemcyclkyVFdLTmdOQ3M0?=
 =?utf-8?B?SUpaYUdlNHZoRTJra3l2Tm10WTdmQnFObjB1YnA4TmdNeCtsZmM0WWY5UG1o?=
 =?utf-8?B?N2NBRDZYT3JyWlhBRTdnYk5RV09ydktkemtyUFhZdVRJSG81ZkxzOEhUMGEy?=
 =?utf-8?B?T2pHb0E0SllwdFMzVVRBdXV5S3pZRFo4UmlPc0krVlplVWtiQVhjcXkxMlow?=
 =?utf-8?B?VENXcGJ6emNMei9NYVQwdzI1Wm4ycXhIV1laNW82cTJYUG42ZGw5Z2tTVzdo?=
 =?utf-8?B?Yk55aHgxN3lpVEdYbTExRXdFdGhyT3lucnMxSXEweW1nSjJ6Y1p6ejg1cWJH?=
 =?utf-8?B?RWxKYytjcEhsS0VnZmRKREQxSU5FczdYdmc2UGNRNkZpT2I3NHQrWGd0MExq?=
 =?utf-8?B?UitiZVVrRUdzc3EyVUxDMDVmUHoxdUNXVHMzaC9YdWdZTE5kZ2Fxait6SE9V?=
 =?utf-8?B?Z0xLZHgzbXFtelE5RTY4Y1g4TWJwb09CeUFFNzUxRGdwdUNtSnZTKzZwY3hs?=
 =?utf-8?B?VVZLSG5RdDhMZEYyc2hndnN2NThlRjRhOTJXb2JHWmpMbk1DUnVVSlJVZUh0?=
 =?utf-8?B?c0RiQmRTV2xScC9kbkFjdkNrSDlHVXhJRm45UjlKcE51NTg2K2lYOHRhSFdx?=
 =?utf-8?B?L3JTelhGZjdWekNvQkdKb0VyVTUrL0xHL0dVRVVxWlJTOUlQeVd1UUU2eC9o?=
 =?utf-8?B?Y2VvUi9OaWhuRjNiK1p0TWpwMDl2RTdNenZzS0FFeEV6SnhtdjJPb2xXNkFl?=
 =?utf-8?B?cHM1ekxWdko0MWFjRWw0NXhUQlVxUlg0Q05LbEZiZEd2SUo1WnJQZDkvKzRQ?=
 =?utf-8?B?MkJuSXlyaUJ5MzI1cmJZcUQwMkFyTDV6NzExVm1YRkVFdndzNHlNTHNDQkNL?=
 =?utf-8?B?Unp5NHphazhFL29YdnMzSjQ2dXJ3WVhYajNwV1o5SFlxSzhvUzRCYmp1VGcx?=
 =?utf-8?B?VHlyNFpLT1N2TEdMcTlsN1BZb3NrNi93SHFqSTRzenNteXU0S2QzOGVPTXcz?=
 =?utf-8?B?cDFXTnBucThyeEpkdFF6WjZZdjFad0JzdzRZcFBKY1RzY1hTanI3bktjaFBB?=
 =?utf-8?B?aWFYM3FzY3c1YkVMM2lmcXg2KytOOWlsZXJhM3JBYVVvc3NGRkJyd0VqanRl?=
 =?utf-8?B?cS81WWhTSXhHS2xDL3phNmQySDBxZUx1ZS8yRWRvcVFkUHZOOUZUcEdoVTdP?=
 =?utf-8?B?cGZQZ1RVSzFVQ0E1RUxuUElQa1pxVk1WQ2xndlVmWWxlK0xHUUo4TGo5ZCtJ?=
 =?utf-8?B?Z01NdExhRzBTRWJrN2hzTE1oMWh5NFBONytQdDJDbFJVV015NGppQWV1enBl?=
 =?utf-8?B?L1RDMFFiU1BRVFArbnJxeC9VNzJlODlOZjNMaEt4R1VVcU9MNDRMQUVDRGhk?=
 =?utf-8?B?RGpNQ29ZZlRBd2VaQ21uT252LzFYRnZkZGJWSng4c1ZPMzFLU1BkRHNmWExw?=
 =?utf-8?B?bitvcUMyK2R1WnErRHJ6L2UzNnMxMXFFMDBKTDM0bnVlbk1LbGpTNjNvVGhW?=
 =?utf-8?B?Q1V2NlIwWkRveisydG5VdWVpY0VOTXNVNWlXLzdRSFdWWjRMRmdoanBQY2Jx?=
 =?utf-8?B?RkRQS1dxVElIaFR5eENOUUs1dldFNXhVUXN0SHMraE4zN2kvcXkzemZTMk56?=
 =?utf-8?B?ZEp6ZGdTUEM3ajhXeWt0b3pKeDlqeTBlZVF0d1dUSmg1NTVta0d1aXoxUTFG?=
 =?utf-8?B?a0RwR0hOdTJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1Ntc0p4VGJXM3VmMVduR3Bha2NuOFRaUTBDb1JzOVRXd084NzZrRGVLVEwx?=
 =?utf-8?B?ZlhxNzcwMDZOWStONm1QMXJCalQ4YTNMNkJ6M1JMYkJPU3hsL3hSamM5ZmEv?=
 =?utf-8?B?c0VQRStrSXVETVIreEdZM2NvaCtHYzNMdHdPQmpFSnhPR3diMFFLcytObm1M?=
 =?utf-8?B?QnVsQXo3ZWZOekc5NDVMWFovclpGcHNaQkR3Mk5aSThNa0hRSDVkTTA0eGZv?=
 =?utf-8?B?TE52enNrNTQ1NnV0N3pSelF2T24yaDZEdEo2bWNua05NUzBlZzJwZGIwQTJx?=
 =?utf-8?B?QlJzSGRrY0t5UDB2b05RMFpFN3NyOFo5eE0vRlZKRk91YXdRdXlsb052NUFG?=
 =?utf-8?B?WC9LWFlRTW1GS0ErRjlzMmJQczJHTFdQaXZGWEg1Q0NDVVpreGRiTG9tSkRv?=
 =?utf-8?B?czYwMlFURkRNcnhSVHRhYk41Ymg5Q0NzRVF2SEF5RkU5MlJpU014OXVrMGFR?=
 =?utf-8?B?SkY0QVRjOExja1ZiRFQ2WitLU3c4SG1wQWdHOGlKcFViaERHaUNhWG4xektK?=
 =?utf-8?B?V3lOanRyZjVlMjB4UlFvNHc1VnZOeGRJbE1TYTlDSHpLa2hDM2thdkFMY041?=
 =?utf-8?B?dFlxMXhDalVvbVJEMDFOblZSU2NyTFJNZUZTa0QrOVlLOStRaGI5SGpXVzky?=
 =?utf-8?B?ZTl5aGVRVUdOZzAwclBxckN3WHBINVoxWS9TK210MnpIV1luWTZPcThpOEhF?=
 =?utf-8?B?MEZBaVVnbEQ3aDRTRnNPckpTTTV2K1ZkdUpZWVZlemNhOFZhdndmUE93TGYz?=
 =?utf-8?B?Z3MyTmJibVUzeUcxZEFtK0ZTL2Rta2ZtNFc0UmJLcS9aanBoa0o0NmdtMjdW?=
 =?utf-8?B?QVUrY2VCOFhrVXV4OTNRRWtuVVFaNDQ1LzhUcEppSm9yUG9nalEvdGVML0pI?=
 =?utf-8?B?cCt0NWtXYk9PTmo4NzUwMSthL3F3bjl4ditCdnphQ1dpZEZVZ2hCZ0ZodWw3?=
 =?utf-8?B?ZnY5emFSLzl6WjQ1dXNqbFhkV2lsci8wVTlwZmVoNGFvZmw1OStDcnJLR3d3?=
 =?utf-8?B?aWxtWDAvOGZQTGZEUEIyeEJQSkU4UW9YZ2JLQXdydXU2TTNvOEJlM3RVL0ln?=
 =?utf-8?B?d2FKL2xMeFJQWkNjVlp3WjlWSmRQZkhHSU1lNlU0N2ovWnRiVTB0RDAxTG1I?=
 =?utf-8?B?STFrM2VMRTllVFIrWStOQ1UxL2NreEc1bDhnZ3RmbEZtWHl3RnJlalhiQkhr?=
 =?utf-8?B?Tit1RVBIbU0yc1FPckRnS21VMHc5dDcyR1BRaHprRzhhZDF1ZHVUVDJTUTlj?=
 =?utf-8?B?K241YnYyWUNTemdKOHVtUytHRW5lR3hUQmdieEtnN1RqLy9DNlR6VGl0aS9L?=
 =?utf-8?B?ZXgrdmVlWGJENTU1LzFialRrelJyRjVheUNMQW03RlJZVlY4dng3VG1rS3FY?=
 =?utf-8?B?N1RqVmZqZDRNMUdFMkhrRUhocUdNU1djN2FTTHNzOGE2cHZtRWRPS3NBTS9H?=
 =?utf-8?B?c0VZV0FpYlBlakhXQ0VvSVFob1NLYmNWMkZSMTh4OVhlOE4wd1BWcGp5VFlq?=
 =?utf-8?B?SitPSEpJU3hnUDBsblg4WVdyc2JGT1A0Y3dPZ3RYbnc1NW9JYlpPZmd6TGFp?=
 =?utf-8?B?dWg2aXRhNVBrVEI5ckErYURyUU9pclhGN0NMdE9iRDBvTWF6cXB6TGJLZ21C?=
 =?utf-8?B?ZExwM3ZDbFVtSTFrQVpraWZYQlEyb3A1cEtFTHdXTWxPOHdXSlFoMk85bFYz?=
 =?utf-8?B?ay9PeWtIRWc5T09TSlVJTjJUK0pwenhYN1BVbHpvK3hXZXhTdGhzcDFnM3Vx?=
 =?utf-8?B?SnlVallkSHJ5enRwR1VhL0pabmJPVHFtemtDYmJ6RjNEM3RlZmMzT2RtTk11?=
 =?utf-8?B?cFVjRUJIdUY0dHhpQlNzU3g4cTcxcWgzOG1iSVpFN2xJTzdyKy9NZDk2UW9i?=
 =?utf-8?B?UlFpczYyRTNVaktGZitkTlNQQkpyVFBheVYvM0NwWVRUYUhuNGQ4RzdSbzZL?=
 =?utf-8?B?UVdaVVZsOXY3REpnSmhpOExpK2Y1b3h6YmR5U1ZrcTBRQWNDeGRncEV3bVVC?=
 =?utf-8?B?NHAyRHEwWnVwNytycEN5OVZCd0xzMG5qbnREeUtaYjhaVDc2T0tGcFdHN1I0?=
 =?utf-8?B?TnRHNks0UVlBYzJiSmlPc0tJSnRURXBaaTExWG90aVhBa0JzcWxPRXNJN3I2?=
 =?utf-8?B?bU5mcVlIbU1pSVJUdmhxdG1BZnBoblM2MEllVnQ0QjhCTHorRS8xdFRQZzJ6?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7845e7d-12e3-4d80-94e8-08de2c56c794
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:13:56.3832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8dgftL6GBYWe8ohjuBvrbpgJRpiwY6/jYzOcXY419osirp0hWx8uHOD3QH4T0yZ+JxzNsU3sW54K5uYcauBs15NFhLlz9lilDVoHnjDvpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

subject is little too long, maybe:

	"drm/xe: Mutual exclusivity between CCS-mode and PF"

On 11/25/2025 5:57 PM, Nareshkumar Gollakoti wrote:
> Use PF lockdown supported functions to enforce mutual exclusivity between
> CCS Mode and SRIOV VF enabling/provisioning during CCS Mode enabling.

please explain in commit message "why" we need this

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

and also mention about a change for the VF case (no sysfs file in VF mode)

> 

and then you can move whole below change log under ---

> v2:
> - function xe_device_is_vf_enabled has been refactored to
>   xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> - The code now distinctly checks for SR-IOV VF mode and
>   SR-IOV PF with VFs enabled.
> - Log messages have been updated to explicitly state the current mode.
> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
> 
> v4:
> - sysfs interface for CCS mode is not initialized
>   when operating in SRIOV VF Mode.
> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>   enablement.
> - remove unnecessary comments as flow is self explanatory.
> 
> v5:(review comments from Michal)
> - Add xe device level CCS mode block with mutex lock and CCS mode state
> - necessesary functions to manage ccs mode state to provide strict mutual
>   exclusive support b/w CCS mode & SRIOV VF enabling
> 
> v6:
> - Re modeled implementation based on lockdown the PF using custom guard
>   supported functions by Michal
> 
> v7:
> - Corrected patch style as message written as subject
> - Used public PF lockdown functions instead internal funcions(Michal)
> - Creating CCS Mode entries only on PF Mode
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 48 +++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..468c3a6790d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -108,6 +109,29 @@ ccs_mode_show(struct device *kdev,
>  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>  }
>  
> +static int xe_gt_prepare_ccs_mode_enabling(struct xe_device *xe,

nit: usually we don't use xe_ prefix for static functions

and there is no point in passing *xe since there is *gt

> +					   struct xe_gt *gt)
> +{
> +	/*
> +	 * The arm guard is only activated during CCS mode enabling,
> +	 * and this shuould happen when CCS mode is in default mode.
> +	 * lockdown arm guard ensures there is no VFS enabling
> +	 * as CCS mode enabling in progress/enabled.

this should rather say just something like:

	* We can't change CCS-mode when VFs are already enabled and we
	* must prevent enabling VFs when alternate CCS-mode is active.

> +	 */
> +	if (!(gt->ccs_mode > 1))

can we have helper which name would describe this magic condition?

	bool xe_gt_ccs_mode_default(gt)

> +		return xe_sriov_pf_lockdown(xe);

note that all xe_sriov_pf_xxx() functions expect to be called only in the PF mode

so before calling this xe_sriov_pf_lockdown() you must use IS_SRIOV_PF(xe)

> +
> +	return 0;
> +}
> +
> +static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
> +					   struct xe_gt *gt)
> +{
> +	/* disarm the guard, if CCS mode is reverted to default */

"guard" is just an implementation detail of the "PF lockdown" feature

> +	if (!(gt->ccs_mode > 1))
> +		xe_sriov_pf_end_lockdown(xe);
> +}
> +
>  static ssize_t
>  ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	       const char *buff, size_t count)
> @@ -117,15 +141,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> +	ret = xe_gt_prepare_ccs_mode_enabling(xe, gt);

shouldn't this be done under below mutex?

> +	if (ret)
> +		return ret;
>  
>  	ret = kstrtou32(buff, 0, &num_engines);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	/*
>  	 * Ensure numbers of engines specified is valid and there is an
> @@ -135,7 +157,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>  		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>  			  num_engines, num_slices);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err;
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> @@ -143,7 +166,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	if (!list_empty(&xe->drm.filelist)) {
>  		mutex_unlock(&xe->drm.filelist_mutex);
>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto err;
>  	}
>  
>  	if (gt->ccs_mode != num_engines) {
> @@ -155,7 +179,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  
>  	mutex_unlock(&xe->drm.filelist_mutex);

to avoid such manual unlocks, you may want to start using:

	guard(mutex)(&xe->drm.filelist_mutex);

but then make sure to do not use "goto"

>  
> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
> +
>  	return count;

	return ret ?: count;

> +err:
> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
> +
> +	return ret;
>  }
>  
>  static DEVICE_ATTR_RW(ccs_mode);
> @@ -191,7 +221,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))

btw, the "xe_gt_ccs_mode_enabled" name is little misleading,
IMO better name would be "xe_gt_ccs_mode_supported"

> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);

