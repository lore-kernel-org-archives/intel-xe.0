Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E9CF11CF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 11:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243210E8CD;
	Thu, 10 Oct 2024 11:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL9M+D0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F0A10E8CD
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728558199; x=1760094199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q0ws/Nwz+o4rIK6L/vXqVNBF4s4a1nL1ELtf9a+bmwM=;
 b=ZL9M+D0/hqxsp7dR1wLd9NClO8P3xZc3KpWJSi2B5Wj0Fg2xKBgYA/Lf
 HMkYvqoRhBocR5gQuHwmxp+DO9P/yrFU7ZcZE5q+8bQB4oV7KDCACA/VI
 O5u7TYH0cXi/xg4aKEZ+jbAFGTF/aCh2RkZnIF28f6FPuXg/gzQVI4CN5
 AK9s7zoDnSxETSpPjivf8Ym7/MdwjoV1JlGXTTFf9ZcY48dIYIRF73e2v
 4y3IXZ82kS5G+8/VotCCX3sMYx/mmSlCZeumggdWhI5QrMynZLrvvU8u5
 AZN9VO4MsGVfPYnNA/OLwrkLQ/H5VmQLZqKU1boS4Sy0gaZRlN47s4JDv Q==;
X-CSE-ConnectionGUID: RpTkVx1WSzK53o00OEABaQ==
X-CSE-MsgGUID: tE+n1bPbTiC89oL9SFV27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28022870"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="28022870"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 04:03:19 -0700
X-CSE-ConnectionGUID: ULzXcoPpQAOi1Wo5MaJ5xw==
X-CSE-MsgGUID: dYzqONQ0R1qp8hbOYudbaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="80564441"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 04:03:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 04:03:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 04:03:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 04:03:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 04:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OejP8FvfnRnDPfY4VErHbwcNKm+H0Mz4dQ2qXDBu44DIr1l8njxziegrUSMQYL+5KWbR3q0pQJvIVmzJL1pOFcOIYJU5DFMFRvvkt1pgStuDDen612VIUJXiRe8VLymREfWushMfy4GntQ+qqEInc8coX2mtuYJQuTDa/J8pBGklZXAdPGaAO3Maw6ObiM5aW8kp+hom8l/jUoqDFZcnjKIvj1Koi9Zh+Bos811Oz+OoNAAocNTpcKYnETiLbga6kmvX6oirAJNVVsfCyJ8cy32jmRN0JCWvU3kkSR/iekMsr5qlN753aHD6s5/87QonK0EjN9wPQY3Mu5Bll0Bszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ4NsAtb0nhgy85uz/pMnB85LY28jbY7CmAJGaFB8iU=;
 b=HhflZBoj4EUHaRugGD50+nyDy/xVUMBQPGFK/BWgOV0dMEXlaL15bIH7UTPOOqPZMcn4ERx9PqUDjZIdHUo51N8mOspDCfR0HP/cM93JseyuZJEkY9r3uN4wqm6/UVcz3To/2cgqpEmbelRn7h2h6W8CC5h8KFsmRI2dMRAzhiW5BotiC68mv43eGUnhRjXFFJicrnuyJ2TmsOkoF9xoMD2K0sVGFv1jZUjF9ZbQzjIDB7bqIc7acTYFXLktt0hUGgMDYMRpkRSvV5CIW7527+VbJGyvOwXodxnvm+S7VWFLiT+Ddhrezv5a58BjDNUsb0909qsyqJNh/eNiwV++uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 11:03:14 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 11:03:14 +0000
Date: Thu, 10 Oct 2024 16:33:08 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c92b7e0-453b-4769-d244-08dce91b2330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdZYXRWZmdvWXZRQm9HeEtuRWtEY2REbWRob0J5d1FROHg4eGpmcjY2TlVh?=
 =?utf-8?B?cVZJUG12dmVjY25qV2s2dVVVZXZ6UlY5QnhyRE4wSTIxWlJ0TmlEM1ZZaFV2?=
 =?utf-8?B?a2Evd2RaS1RZVkZXL3g2V0pCb3F1VjN6RnRjdVhGWFpGWGtTMVZHSjVoMnRx?=
 =?utf-8?B?N3EzRzRtQk9ZVWkvRE9selEzOVpOTkp6YzZXN2hTREphVWVTQ1A2cncxaXQw?=
 =?utf-8?B?d1JTQkVyRnYySXhTVjk3ZkEyNHpQaDNKanRWWGxUNS9WK3QrdlNQbGMwRzJu?=
 =?utf-8?B?OWpYa0ZGR3E0QzNGcVBWekR5bGc0SWJhR002bHdBVUNDR3NjcHJpejRxRjZo?=
 =?utf-8?B?YW1FVUdXS1ozdU91VnQ1SWNzT2E5ay84N3hGbUlZNWFySzQxRGI2WC9vWnY4?=
 =?utf-8?B?TTVuNHVqR0hDYlZPbStkYjFSOXRiSkdqVllYaEtWR2hGMksrNWJTZE5kb3Fo?=
 =?utf-8?B?dXRBMEI1VWJHUGlVUmR1ZHRaR0tzbmJRTTNIVDBlZTEwWVFTbkFvWmlsb1l4?=
 =?utf-8?B?a0xnK1hPU2d3Q3hxUDJZRUMxUGV5NkdmR1cxWjRXSUxMR3lwKzIwQ1hjMGRU?=
 =?utf-8?B?cFpjTmRHbFVqeVpPazMvUlhpS0I0U1l4dWhuVTJ2Z3ZVOHV1YzI3cFg0R1FU?=
 =?utf-8?B?NENKY201VmhYWmZMS1phRDd3YUltc3F3bVpyVnBwWEVJanJ6WmM0R0pMRUhi?=
 =?utf-8?B?YTlUbGJ5d0h3V2xIdlRLRFVyV2NScGJZS3kwZFMxQzh6eWE3SXR3d0ZqT3hr?=
 =?utf-8?B?aTBBemtpdW5odlJESkpFSDRiTTB5WjRWN2k2MXRISjIvSjNlS0tjbTdBTFZS?=
 =?utf-8?B?MHo2Wk9GbnRLRUYzOXZzUk1heE05cVdKTXNPTXFwZFh4ZERWUEd3bjdwekpW?=
 =?utf-8?B?TlJ6Y2lYSEV3RHlaY2tTVlF0dktrdmxLNG5Dalp4bkU0MjJ3Sk1hcE1VKy9B?=
 =?utf-8?B?aFJ0MFR0ZGpzV0kvbUhvQzV6RE14SDVyV2NsTVJaYXRscEx2clpkZUhWNVJx?=
 =?utf-8?B?L0pidzlPY1UyTnZTRFRBUThGNE1OTHF3QW42QWZmejRCQm00anpkVnZBSlBv?=
 =?utf-8?B?ZzFMS0cxWkhXTXlRaDVSTmE4L1BnN2p0Wk1tNUZMQ0RJVkFRdDBRcFlXN0oy?=
 =?utf-8?B?bUxiV3B3OEg1R0lJSENTbUExVWg0dVJQMi92eFhZa2xUdjVwcWpNMDZvRlhU?=
 =?utf-8?B?MUVDSDdGT2VPVmYyRlBnUlhaUXJIRFBwS1I4VFd3VW4wejJtOGdXYm1HOEtK?=
 =?utf-8?B?ZW9DWXU5bHM2dEJNelpnZ0UwRkhER3U2RGFEL29FbGQ3b2RseUVsSnBxT2Qx?=
 =?utf-8?B?R2tDQzEycVgxc0xVRGVWb3ExdDJqZnM1NXZQeWVONWZWWnJGbmxpZUp0MEtE?=
 =?utf-8?B?SnB2MVZSbDI4NU53bm5CZjJLRXBNeEltUTVSeng4OVBpTzFGNVRIL2loUW44?=
 =?utf-8?B?WWhLRHRLbXFkZzhXcGg2YVN5MjQwL3NEdUhWRHhGd2xJRFB3emJZU1U3ajJw?=
 =?utf-8?B?NzVJb1l6YzYrSFBrNGQ2WXczY2dQa0dXcVhqMGZqZXVUclN5SGhEU1U3Z2pZ?=
 =?utf-8?B?ZE9XMjVlOTErU09ZeHlqRjhOR2wrMy9vQmh6a3FoS1JCWnRHTW5KUUxDMW9S?=
 =?utf-8?B?djV3UG15LzBZWDNWTXlYSnZVeGdYRlVyajZ4TmQ5UlpOU2pVSW1iT3NFZlZT?=
 =?utf-8?B?RGFuSHppanJKeGhwRWRidTI0VC9QY1Zaai9Yb0lDMHBEQ0hzTVIvR3RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEw0WXp4WEw3dFlQYXFZYnhYcEZVRVc1MzJ2UU12Unpzb2JFUEN4QnZCUlow?=
 =?utf-8?B?S1ZoQjU0TmVSYldCME5qbkQ0aEp5NjJIVUpvZkVhY1NSNnNsS01sbjJ1RU5j?=
 =?utf-8?B?bXJHNHA2ZlB1cWV5UmN6RTFYL3BkWWtGVEE2b1pJZHI3SXNOaXNmSVRSZDlp?=
 =?utf-8?B?bVFSa2hqYlFnU1l1T2J6WmY1MWVOb0pFa2NTRUVkVWR3MnJ0VnJxUEtmZ3FU?=
 =?utf-8?B?S3hmNTZ4eEtwTkRjNms4VzBNTmVGNkVKUk9JT1gvVjFxTVF3b1NHcU9VQVMz?=
 =?utf-8?B?T1F1aEVrSFdrMnFybWExZlRoQWZGc3lwQW9hblJ1NkRVUVk5QUpDQXRFRURo?=
 =?utf-8?B?VDIrL2FkNythazZxY2Jpc1p1cGZJUUVmOExkc0VHVmF1L2NPOE9OT2tQL2cw?=
 =?utf-8?B?dzRSY0lEZFlWZ2tyVy9CTFpEdmlYY0phU050MWlxNjNFRjhSSnZ2aXNtWjZ3?=
 =?utf-8?B?clhIeGtCV0RkVVZndnUyN3pPZ05sT3JiVWRlWkRPcHA0NGFvcjdkVzRxTDRx?=
 =?utf-8?B?WDc3VGVNK3dSWHJvRHFzUXNOSTZXcXhVQVl6LzlsMzZzTUdDSEhmclBhWDVU?=
 =?utf-8?B?RFFXTzY3UDBwbVYvYlBGdVZNdUQ0NkVCM1VlWi8rOTNDWUVzMzRyRllpL3Jl?=
 =?utf-8?B?bjVrUGhQTWFBdElqUGs2eWVTY3piazZOS3BxSDJLbWU3anhnTU1mdHVxWk9V?=
 =?utf-8?B?eVNYVUhZRVRrd2VZNFJqNmdpUXdxQ2N1V3NvdGtKQkNjemYzM2JvYm14RFUr?=
 =?utf-8?B?akxMNndXTGJxbGhRUWsxaC9ZUFhvS1V3SXI3dDAwWm9ueitycmtuZ3B5MXg4?=
 =?utf-8?B?Q2Fkelo2dHg0U3pNanBvak0rWnVneUZtS0JYUUp3aXpDQld3MXdoU2V2YU5y?=
 =?utf-8?B?clpoS1dCTU1IVXR5MXFWQ1BhbldYSVRFN0F5eDJNd0pudUQ1Z0pJNkpjdWha?=
 =?utf-8?B?aGxscGJIQXJSOTMyaHJoanhpbUI0SjJqeWJPUWxVaDh4YjRiaXBPU1ZQbk54?=
 =?utf-8?B?QndzRmxZM1hqUzBuQWIyOWRMTUgzUEJRc3p4a2lpT2h2L2JUTG0zY1M2SHR5?=
 =?utf-8?B?dEtPWjN2OEZ3ekpRaTg4cG81ZFhlalV4KzE4bFZKd3hBUm1sc0NYcm15amUv?=
 =?utf-8?B?TmZJcmMrYm5yQWlrOEdRNG5VZFBjZFMvcmY4QlZ6T2xDSnFGamRMeWhWUHFW?=
 =?utf-8?B?M3ArT040VzNIODkxRzg1SHdMc0dCWDJ2c1FGN2g5d0oxZWJlRjZwK2MvODlI?=
 =?utf-8?B?WllqbTJkMDdDanRrM05lem9PeHl6c3NnOEhiOFRCNlIyVzdzUnhFQk43ZlZC?=
 =?utf-8?B?dThlRHV4ZmE1Rm5wSzMxa29FNVk5ZGR0SGp5STdCem0rODhZTWNPTkJSeXBD?=
 =?utf-8?B?VkcxUkpXQkZLZSttczJBZ3RBa21uRFpVcG9MQXVjSUJuaXV6cU1VVG5mUTRn?=
 =?utf-8?B?NnBnTk8rc0J4bFpudzRxR0NrZStJTzdCVDhRa0pYMU1XK1cvenRSR0dRVUMr?=
 =?utf-8?B?a3owTHE4dXQ3Zy9iVmg4WklpYjdVNmovelhKVXBteTNkT085RWx0MlNud2hP?=
 =?utf-8?B?Y2ZTM2FvQTNRU2pkdWtHdWhTcmdOWk91ZFZaSFNOdTR3WVNFSUlibFcvUGo4?=
 =?utf-8?B?bW96dFY3YmYxVUFxRENEZ05VTnhYRjU2bkF0MldMMWRTcHM1aHdFbDhNODlI?=
 =?utf-8?B?TEdRdkJ5UWNwT1drSnVqYnYxSHJtaFNXYnYyUkJjbXB6anpwZGtwbUkvWldW?=
 =?utf-8?B?NVl6SUNFMThJWld6a25jTlRodW1Bcm5KZDBSaG4rL0x5NlpqMWJLOFZlOXFx?=
 =?utf-8?B?QTBabW5qK2t1TEtsWTNSeEhPSzhGUTBWRzdmL3BYKzNETG5UZ0lmV0cxenJp?=
 =?utf-8?B?ejdOZWRmTjhPMmlrZDYrdjBic3BuZGF1aG90Q1Z6U2YyVFJ3SkRac0RGcXF0?=
 =?utf-8?B?ODFFNnU1YytsOFQrTHJIcDVVdjI0V3JOSHZUTkI2aU9jN2dyVyt5S3pPSG9S?=
 =?utf-8?B?d250b0t0bkdrblFuT2duaHkramllS0VWK1RYQVRrRDgrQlNwN0FxN1FKSDBC?=
 =?utf-8?B?VXFYdkFQTVA5T29MaUdKbkkxU0ZhOWt4UXlIdUx4QjY0Um42WElzYlVhS2tv?=
 =?utf-8?B?dk1GK3NJaHVEWmhzTU9DVzFpb3JHNjNRZzBHek05WEhaamxBZTFLN3lRemNZ?=
 =?utf-8?Q?2dydxQH/fv+QxiRJ7Er6CTQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c92b7e0-453b-4769-d244-08dce91b2330
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 11:03:14.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKw3l03xQwv3sU+LF5vUT1wyN9h1BIbyy+nIM+Je8TpajK+nNvsyU4Ohmld7DuJR3p88kKJus5T8lUsVm78DtLmgVt5AiKJ0QP5p/tmo8NZUzMIzMOe1U02xhATWCn+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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

On 08.10.2024 18:00, Matthew Brost wrote:
> On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
> > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
> > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
> > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > > > > > Drop the exclusive client count tracking and use the filelist from the
> > > > > > > drm to track the active clients. This also ensures the clients created
> > > > > > > internally by the driver won't block changing the ccs mode.
> > > > > > >
> > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > > >
> > > > > > Is this really fixing anything. As far as I can tell nothing upstream
> > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
> > > > > 
> > > > > should fix this case:
> > > > > 
> > > > > 	open()
> > > > > 	close()
> > > > > 			<---- race here
> > > > > 	change_ccs_mode()
> > > > > 
> > > > > because the close is not completely sync - the cleanup where the
> > > > > previous number of clients is decremented is executed too late and
> > > > > subject to a race fixed here.
> > > > > 
> > > > 
> > > > Ah, ok. But then IMO just move the clients.count decrement to
> > > > xe_file_close. I try to preach solid locking / layering and this seems
> > > > to go against this idea.
> > > 
> > > why do you want to track the exact same thing in 2 ways, one in drm and
> > > the other in xe? "Are there clients connected?" is something drm_file
> > > answer and doesn't need to be duplicated in the individual drivers.
> > > 
> > 
> > Well layering, making assumptions about the file list means, and not
> > randomly deciding what we can and can't do with locks we don't own.
> > 
> 
> I looked at this a bit more, if we want to do it this way then I think
> at a minimum we need a drm helper for this.
> 
> e.g.,
> 
> bool drm_device_user_clients_open(struct drm_device *dev)
> {
> 	lockdep_assert(&dev->filelist_mutex);
> 
> 	return !!list_empty(&dev->filelist);
> }

Still the driver would be required to use the filelist_mutex outside the
drm layer. So will not solve the layering problem completely.
Otherwise we can define two helper functions in drm, the first one would
check there are no open files and returns true holding the mutex.
The second function can be used to release the mutex.
Does it sound too invasive?

Regards,
Bala

> 
> Matt
> 
> > > At least it's also used for similar reasons in amdgpu and vmwgfx:
> > > 
> > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > drivers/gpu/drm/drm_client.c
> > > drivers/gpu/drm/drm_debugfs.c
> > > drivers/gpu/drm/drm_drv.c
> > > drivers/gpu/drm/drm_file.c
> > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > >
> > 
> > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
> > meant to be traversed by drivers there should be an exported iterator
> > IMO.
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
