Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0031C87FDA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B252D10E7C9;
	Thu,  7 Aug 2025 11:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhZQ5NDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6C710E7C9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754565760; x=1786101760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IwYYHgAygz5LcPgn8FZEfTILr+z7A8YEqZ7xVIx6tEw=;
 b=QhZQ5NDv/xVUcuZJRasqBBg3mkRkw2eQztTSTMCmR7o3yOMELED/MreL
 UFA4RlA36pasrvUH7rmE0tEutriZmIzHnTSS2/HHUnJ4sjv5Q/SM5btD/
 NFjtbGz8xNre5m+/cVvURZ3E/cDTOoTNukWDZRySDeMPG0v2JgKO0uBZh
 rz5SBDmywQ3HMVi6my+L6PRQzswWXsFp/xeS8eUCi4G3+7C7DqWm+bnAz
 mIhDLmcDh001QQKQRIQUqLAzGAw5q+pvWG+vIUBxrg6jgdcAFr65Sn4vR
 Dzuge3+sygxZ0gVZ4MmeH9ueVDbkjPauvCaD+ZwWpZs0IZwM9eQfZzlVa A==;
X-CSE-ConnectionGUID: Y5Ie7IUTRDqC/BvTUgubxA==
X-CSE-MsgGUID: qrZVqO7GTuyd4PsAO1OUeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56606778"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208,217";a="56606778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:22:40 -0700
X-CSE-ConnectionGUID: DTTmUfhdRGy5HH9/Azj7gA==
X-CSE-MsgGUID: lZUAMOn5QqGJheeKaOzJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
 d="scan'208,217";a="170408293"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:22:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:22:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 04:22:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNcj9wN1TOa0p/NBhN0tpKALFXbezmVRhqGoMgawJXl9lbz3WnswxBichsX5oCpkru3gCxMrrKkhttO3ntl4Xxud5Asf5/B98uaS81x1MF2vUaVrHPKRodz0TTrVLBMrOJxXtc2SxampgPtyI54j/AJMlOqtwhT8JuOTYKg8MTNkYuSf75UY0om0NoFMjK820Vt4pdh1GrwSIeVbvt/bo/2cI1eEXrRCcrEqj4a8PuLVdOQ7AxumLmXg8D9DXYSvmLcV/3xrO3irsbnItRRBeLs2JEMlsbbSQtGjlydzf+ke0FJbS3zdRiPHrgfHRUXq/cLWZmO/ZYE0aaiQ1bxOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfAJ3VSPQTOEtJN6CIGWz7Gv/uQhM8JGo5GC2YuB77Y=;
 b=eWH6SVKpuAhfvaDtB6PAu2FUNJZ4XqflGLR2NL2peGxqMfVPJopIz5HBMS8zCgNQx/hKYIkXuAbiI5lLeBe/SifF+eNGhgi5qUx3+ElWd6W3uRfI2o0gGcn22rhls4gzWOuTB2LLLtloHwsGzD7CrGsIpmS14qxNyF4GphYp6dC+0VfFAJ0GhiD3msHblNSxj3tAYuXgvJN6RAZG4YF1nH/jD70TAOdEhkbrLKOJfujqjjMErgAKOAxU2FArGQG5E8OfglkgXOkJ9L/aSAaI+fCPZ3tqr3sqPEa6eeG6kBVvyLDvQsdupxHG9Vy+6tK2ISy4t6ZoCb+PNfbg+VExKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB8829.namprd11.prod.outlook.com (2603:10b6:208:59b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 11:22:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 11:22:36 +0000
Content-Type: multipart/alternative;
 boundary="------------0kpj2qbkm549SsbtgkwEeupA"
Message-ID: <bbbc9ff9-3547-4e5c-a491-3768cbbdb820@intel.com>
Date: Thu, 7 Aug 2025 16:52:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Add SW clamp for power limits writes
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250806172626.3226676-1-karthik.poosa@intel.com>
 <1d47f02d-2824-485a-ab4d-002cbfb06f1d@intel.com>
 <12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com>
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 392f769d-2a23-4486-79ae-08ddd5a4b5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pYaUtoUWc0ekZjd0l5Qk5tTWtMOXhGcmlFbWk1c1BDYjF2MFEyUXRNUVc0?=
 =?utf-8?B?UkowZ2xBTWM2YnliaXdubUk5Y1pmNXJSamhuM1hQaE9ialROWXYrRmxoOC81?=
 =?utf-8?B?TExKbTJzV3JPSFg1SE4vSUtCSWFWSy9ZbzdVZG01UVJqaGxVNFpJaW12RWly?=
 =?utf-8?B?RWtQRVhjNldTY24yTis0QzRPZFBweDJJY09zaW81T1VNb1NEb0haM1M5eU0y?=
 =?utf-8?B?Vm9EWjlvS0F1Y0NSQjNMMC80RnYreW5mMzNhUFI0c2F4cm5uclBCTEw1Sm92?=
 =?utf-8?B?ZU41SjIxZWNWdWlmZGJJcm1zT2UrcGZZcWl6cUdMSmZGUGxMTVdaaHl0ZFhm?=
 =?utf-8?B?V3gwc216cUQ0KzZRRG0rTDVTM3dzWGJmRDBLWFB0NEFPdklISUVjT1diUU5S?=
 =?utf-8?B?WFBJQzVwSlR4MndLVEQ5SGVoL0RpZTVMcGNpY2RqS1FqaWQ5ejNWZFRsSEVQ?=
 =?utf-8?B?MktiMXZvT2s5UW5oVG9xd3IrYUNveWFoZjNNSCtIWVpoa3diY1l0OEdwWm9l?=
 =?utf-8?B?T3E0Z2ttUmNhZ0tpM0FlaFpOT1ZBdmhsNWN1WGFVeldtNy9wVHR5djJvcUd5?=
 =?utf-8?B?eFNnalBmUE9hNnhKS0FvT2tNQ1gxc2xCb3pVTWt4VHIzc21zU0swb001VzVN?=
 =?utf-8?B?UDZrMklXeWtwRC83ekR6M3Y1d0dHQ1VNUnlZdFA3T3Nhd3NWNm43cmxzMmQ1?=
 =?utf-8?B?ZmtWRGhPdll6c3FpT2lqSkoxd0hnb3UwQjBXNVlIWHROenM4WkJkQTQ0UmZL?=
 =?utf-8?B?RnZaekhZLzA5SDZZcGcyVXB1NHlZQTU1ZGEvRWlONDMzWW1nR0xQYTRJRzNQ?=
 =?utf-8?B?VkExQ1Z4Nlo5Nks2S0hZY0NjSnJMOVU2K240b21ZbVhGS2tobmtkVElOcjRG?=
 =?utf-8?B?SVFGd25md3RZWnFRR3Jaa05zblp3aFc1cVFScUl5dXBnUjBlMndRd2JxS0Jk?=
 =?utf-8?B?SUc3WmpPd2hPREJkc1Fnb0JMRFA0VUtkNXpaTFJ2a0tDK0d0ckNKdm9OOFVG?=
 =?utf-8?B?dzltOTY4akhZYUp4WDZOb0NUMEUyRzR6WmRBcHVXU1BNM0RRc2cyaWhXdXpO?=
 =?utf-8?B?bjV0VDMva2pPMUtpd2l4QU9tRW5ZZ0U4OUEvbFQyb3RIWFl6eGluUHhnOWJv?=
 =?utf-8?B?VG5sTlo3NmFNT3F1QnowTW16MjB0RzNjYTI0dkl6M2M4ZkZCNzFzbS9JTzFT?=
 =?utf-8?B?SU81R09MRWdXUGh5dTBvSUhnMnRMTytrbzM4WHUyWDFXdmJPa3NtS2N2aGY3?=
 =?utf-8?B?TVFFSkd6SHk3dElMUDJmcmVnN3VVclVJZ3IzakpLRkp0SkpsOFlMUnBUcS9j?=
 =?utf-8?B?UXB0VnZJRkd1U1JoazU4aGI2NWdtVnVTV2NIYitnVkFIZTl0UlV5R1RJWjZV?=
 =?utf-8?B?ZXZuS0Q1a0hPSmEyQVg4blQ4L3Q1bTNMcmtaQlpqcDFDU1B3ZmlPQXI2aHFS?=
 =?utf-8?B?YitsRjZhaW9iS1FPcnllZ3lBdFdST3ZpcGl5dGNTa2Jyem4yT0Nza2dyZlg3?=
 =?utf-8?B?L2l4YWh3cTY5UHFVRDNraDVMeTNOaHcyR1B5QjRid2pQSzZpS1dWU1FlMG81?=
 =?utf-8?B?TEQyVmxleHNFOHRXVElZdTNXQkVGaDhuVXV6NGhMV0tneTFyZC9CekpDcTB1?=
 =?utf-8?B?RDBDdWNJK1hKbDlrNnBJWUtVd2t6KzJKZDV2aWtkdDVsb0NJa21rbkk4R1Fm?=
 =?utf-8?B?Q1RscGVvTklvdGF1VmY2Nno0WXF6QnpLNlVlOUJFei91UzNBc1hkMzFDRlgr?=
 =?utf-8?B?dFVXdnJwR1RkQlNDdkx3S1hNOGI0WnhHSWVES0RGRXJyaGNkVVJ4UUxXVHNE?=
 =?utf-8?B?dHZWRHFCNXYvYlpVRDN5c3gvcHFpNCtFVzhFYWNRR0NjVmx2dVUwVElUK1NI?=
 =?utf-8?B?bzlaa2dMclJNaXhpR0ZVbU0rQ09LTGcybWNyMlhDRnY0VXF4Z0pDazR5Mzdo?=
 =?utf-8?Q?BpgPBGhNiB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hMbmVSVmFLZ1orMnVkL3kyejRqVzcyRlpSTFlvVVhKV2Y0Z3ZMTzdRaGxi?=
 =?utf-8?B?WUNRMTZqYkYydURjaDNCYVVaeHJGekJqNE9FRU4xeUNlMHJyWVBKaWpzY0RB?=
 =?utf-8?B?cFBYdERnOSsrNjE1UGhGSUEzZTNRWXgzYTFQcEhkRWh1L2JRMjBPZWZWMkFJ?=
 =?utf-8?B?VHRrWDZGekZIOEt6MmcrNUFDMENaenhQMDFVWS9zemZwa3pvc3pweDdTWFc0?=
 =?utf-8?B?ODhaYmdtL2NQVm9mUXdWMERrK0dWUEVxMkEvdDl0bVVZdzF4dWlWb1JvdEZS?=
 =?utf-8?B?emNqaEE2R2hNVlNqNktUeDNRRm5mSXRsY1ZZdENLZmZMMklXWllHQWF4Q3F0?=
 =?utf-8?B?RHJBQ3dJaW10UEFSTm5HaUhKM3NzY2g3ZlI2Q215OUM5Zm5JSlBZUXd6QXdz?=
 =?utf-8?B?Uyt4RUx6UmFObUpsakd0U2Nxa3VOTC9TS0g3b2N4K3BKUk02N1FsbFJHTGVr?=
 =?utf-8?B?L1dlMGQrNFprUFdzWS9zQ0cyMEIxekM3VUdXVVF5S2pCQ2lKcnVhNnpQT3BQ?=
 =?utf-8?B?RXM3SEpVYi9kM2wzOS84VFhWY3c1emxZMFZqMXlnZ3ZSSll6K0ZURmRJVGlR?=
 =?utf-8?B?cXlrVlV5YXV6VW40UEV5WFU1cnQzMUcxLzdHUzBvempsUThtZzd4Q0pqQkIw?=
 =?utf-8?B?RDhlMkFPZ2ppQ2R4SEJ6S3RnNGJpYk5oMC94RDd3eFBnQUs5ZTJ0R0ZxYkdy?=
 =?utf-8?B?SVl2aFZqTVY0R0kyNlpPNXc4VEp5dUxsTmJjdnRqZW9TME9NQWFjWTMxV0xU?=
 =?utf-8?B?VnREdnRQMXlmaEtITlZVMEJnMEZFb3pWcTVLWjFiSXVKK1dWVHM2eTk1L09h?=
 =?utf-8?B?NmN2TUFDamFqTFpFRERTaTc5Wk40dnVULzdPLzR5ODN5cU12cmRhVGFBL0VQ?=
 =?utf-8?B?SjBxZkp6aCtLMytGWnJQMkw2Ty9Oc2pVYklDRzNBVDBkN2lnd2k1NnRlcTd4?=
 =?utf-8?B?dHBweTMxVkVkSG1qVkk2NzVEWDVkN21CYmNMY1c1bWFFNzF5cHJ5L01takdB?=
 =?utf-8?B?blhqQzNwMWYzQTRzTXVMcU05OHgrWHYyTUpWVTJScnpJck84SFZQcnRCaGt3?=
 =?utf-8?B?SkY0S003cVc4eFYxN05OZGVTVmV0OWI5WCtYZXBYdk5JQ0tFa0QxeS9pRHJI?=
 =?utf-8?B?VGVzWHA3cEtWdFdEWlRyTkFXWWVodGd0RmdvQ1NiV2VQZzJCMGVQVG1vNVV0?=
 =?utf-8?B?TFlFRkMyK2lGMDV1UUJ6b0VNN1puOUw1dFFMMGtUTWhuU3hVMHZweHZ4bEor?=
 =?utf-8?B?cnVlLzZEZ0tqb2V3cS8vbEszSy9ycm9vQmtlMHF1RW83NDMvN3dBOFhXczE4?=
 =?utf-8?B?L01tN2hDOGh2ZzhFRnNMVXMwZjJtV1hpeG80M3lRc2JXWDA4WTk4S21CMCtP?=
 =?utf-8?B?Y29qZnBueXhSNDJWOVpiUjdsN250Rk5BelJuYWFtQzcxKzBqaGFwQ3BsNVk4?=
 =?utf-8?B?UlpBUlFNMHlCRHhIRWxNcXF1US8xeVRTbkkvUUZJdHdaTDVwaGF6WnNBbWl3?=
 =?utf-8?B?aGVxRWR6R2NtaGsxeXRLM2Z5bXVpWlE1eFd0Z0lJZHVuTU91L2xVOGM2NTRu?=
 =?utf-8?B?a3hoRUhEMGVRN1JVTWZVQUhPa0hTOUU5cWhReis4NWVuT3hydSsxNmREbDlX?=
 =?utf-8?B?a1ZnRzE0Q3djc0hDUFJjeGJidFVkRFFJZzZidFdxaG1lbTNLOEpxbDRuVU8y?=
 =?utf-8?B?Mi9yeHZqMExMMzkzZGh6Z3FwRU4wOWhJZ0lWMnVPQlllRmtGcUZjZldPSEJh?=
 =?utf-8?B?ck1vVkNtV2VpU0Nwdllmd0FEdFAzRTdVVkVOajFVVDJXalV3TXYycGVyVVBn?=
 =?utf-8?B?TEpiQVhRM0YzSzJteXdpL1hzOGxNV2dqa0xwUmFLbHdrY0xDdWVINHZiYWIx?=
 =?utf-8?B?MmlaYU5TcE5OOXJ1WEJUWm50SHlhQkRDTlovUkVvYkhybkZ1Wm9DSlQ3T1RD?=
 =?utf-8?B?VklVSCtKVTJlV3B6YnNxN1lxU0txaDQrNlQrSGRMMi9ZQmN5SnBuOGcySS8x?=
 =?utf-8?B?MDFoSVB5d2lhSklxbHczbkkxNkphdHl2WUthcm00V1hHakRna1ZvcXBYMUJE?=
 =?utf-8?B?VEFGSWw1UjFKM2FiL1FnT0Jha2JxT0sydm1ZcGhYeWVyL3oxVFlweGF2bkg1?=
 =?utf-8?B?QWJ2aEp4aGZINjMzWXZqSUhUMWlyTFZmNG5DWGxMZXhqSEo5UW82SGREcmpF?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 392f769d-2a23-4486-79ae-08ddd5a4b5f7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 11:22:36.4142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lb4wFoEKkQaOc1bS5u/BdxZ+Km5R0rLo1kh30XWLhk8obCZ1bxVohseD8akQ+pX+lzJemoBOZbv/fHXB9TZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8829
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

--------------0kpj2qbkm549SsbtgkwEeupA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-08-2025 16:39, Poosa, Karthik wrote:
>
> On 07-08-2025 16:03, Nilawar, Badal wrote:
>>
>> On 06-08-2025 22:56, Karthik Poosa wrote:
>>> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
>>> powerX_max, to the maximum supported by the pcode mailbox
>>> when sysfs-provided values exceed this limit.
>>> Although the pcode already performs clamping, values beyond the pcode
>>> mailbox's supported range get truncated, leading to incorrect
>>> critical power settings.
>>> This patch ensures proper clamping to prevent such truncation.
>>>
>>> v2:
>>>   - Address below review comments. (Riana)
>>>   - Split comments into multiple sentences.
>>>   - Use local variables for readability.
>>>   - Add a debug log.
>>>   - Use u64 instead of unsigned long.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical 
>>> power")
>>> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>>>   1 file changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index f08fc4377d25..768a942ab0e7 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct 
>>> xe_hwmon *hwmon, u32 attr, int channe
>>>       int ret = 0;
>>>       u32 reg_val, max;
>>>       struct xe_reg rapl_limit;
>>> +    u64 max_mbx_power_limit = 0;
>>>         mutex_lock(&hwmon->hwmon_lock);
>>>   @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct 
>>> xe_hwmon *hwmon, u32 attr, int channe
>>>           goto unlock;
>>>       }
>>>   +    /*
>>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>>> WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
>>> +     * max supported value, clamp it to the command's max (U12.3 
>>> format).
>>> +     * This is to avoid truncation during reg_val calculation below 
>>> and ensure the valid
>>> +     * power limit is sent for pcode which would clamp it to 
>>> card-supported value.
>>> +     */
>>> +    max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power) 
>>> * SF_POWER;
>>> +    if (value > max_mbx_power_limit) {
>>> +        value = max_mbx_power_limit;
>>> +        drm_dbg(&hwmon->xe->drm,
>>> +            "Sysfs value for ch %d %s exceeds limit; clamped to 
>>> supported maximum\n",
>>> +            channel, PWR_ATTR_TO_STR(attr));
>> Is this debug message still needed?
>
> Having this debug message helps to identify clamping from driver due 
> to oversized sysfs input. I think we can keep it.

If the intention is to surface clamping behavior to users or developers, 
then this message seems more appropriate as a |drm_info|rather than 
|drm_dbg|.

Regards,
Badal

>
>>> +    }
>>> +
>>>       /* Computation in 64-bits to avoid overflow. Round to nearest. */
>>>       reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << 
>>> hwmon->scl_shift_power, SF_POWER);
>>>   @@ -739,9 +754,23 @@ static int 
>>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>>   {
>>>       int ret;
>>>       u32 uval;
>>> +    u64 max_crit_power_curr = 0;
>>>         mutex_lock(&hwmon->hwmon_lock);
>>>   +    /*
>>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>>> POWER_SETUP_SUBCOMMAND_WRITE_I1
>>> +     * max supported value, clamp it to the command's max (U10.6 
>>> format).
>>> +     * This is to avoid truncation during uval calculation below 
>>> and ensure the valid power
>>> +     * limit is sent for pcode which would clamp it to 
>>> card-supported value.
>>> +     */
>>> +    max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> 
>>> POWER_SETUP_I1_SHIFT) * scale_factor;
>>> +    if (value > max_crit_power_curr) {
>>> +        value = max_crit_power_curr;
>>> +        drm_dbg(&hwmon->xe->drm,
>>> +            "Sysfs value for ch %d exceeds limit; clamped to 
>>> supported maximum\n",
>>> +            channel);
>>
>> Same question here?
> same reply as above
>>
>> Regards,
>> Badal
>>
>>> +    }
>>>       uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>>> scale_factor);
>>>       ret = xe_hwmon_pcode_write_i1(hwmon, uval);
--------------0kpj2qbkm549SsbtgkwEeupA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-08-2025 16:39, Poosa, Karthik
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com">
      <br>
      On 07-08-2025 16:03, Nilawar, Badal wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 06-08-2025 22:56, Karthik Poosa wrote:
        <br>
        <blockquote type="cite">Clamp writes to power limits
          powerX_crit/currX_crit, powerX_cap,
          <br>
          powerX_max, to the maximum supported by the pcode mailbox
          <br>
          when sysfs-provided values exceed this limit.
          <br>
          Although the pcode already performs clamping, values beyond
          the pcode
          <br>
          mailbox's supported range get truncated, leading to incorrect
          <br>
          critical power settings.
          <br>
          This patch ensures proper clamping to prevent such truncation.
          <br>
          <br>
          v2:
          <br>
          &nbsp; - Address below review comments. (Riana)
          <br>
          &nbsp; - Split comments into multiple sentences.
          <br>
          &nbsp; - Use local variables for readability.
          <br>
          &nbsp; - Add a debug log.
          <br>
          &nbsp; - Use u64 instead of unsigned long.
          <br>
          <br>
          Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
          <br>
          Fixes: 92d44a422d0d (&quot;drm/xe/hwmon: Expose card reactive
          critical power&quot;)
          <br>
          Fixes: fb1b70607f73 (&quot;drm/xe/hwmon: Expose power attributes&quot;)
          <br>
          ---
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_hwmon.c | 29
          +++++++++++++++++++++++++++++
          <br>
          &nbsp; 1 file changed, 29 insertions(+)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
          b/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          index f08fc4377d25..768a942ab0e7 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct
          xe_hwmon *hwmon, u32 attr, int channe
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret = 0;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reg_val, max;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_reg rapl_limit;
          <br>
          +&nbsp;&nbsp;&nbsp; u64 max_mbx_power_limit = 0;
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;hwmon-&gt;hwmon_lock);
          <br>
          &nbsp; @@ -356,6 +357,20 @@ static int
          xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int
          channe
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto unlock;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp; /*
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * If the sysfs value exceeds the pcode mailbox cmd
          WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * max supported value, clamp it to the command's max
          (U12.3 format).
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * This is to avoid truncation during reg_val calculation
          below and ensure the valid
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * power limit is sent for pcode which would clamp it to
          card-supported value.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          +&nbsp;&nbsp;&nbsp; max_mbx_power_limit = ((PWR_LIM_VAL) &gt;&gt;
          hwmon-&gt;scl_shift_power) * SF_POWER;
          <br>
          +&nbsp;&nbsp;&nbsp; if (value &gt; max_mbx_power_limit) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = max_mbx_power_limit;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs value for ch %d %s exceeds limit; clamped
          to supported maximum\n&quot;,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel, PWR_ATTR_TO_STR(attr));
          <br>
        </blockquote>
        Is this debug message still needed?
        <br>
      </blockquote>
      <br>
      Having this debug message helps to identify clamping from driver
      due to oversized sysfs input.&nbsp;I think we can keep it.&nbsp;<br>
    </blockquote>
    <p><span data-teams="true"><span style="font-size: inherit;"> If the
          intention is to surface clamping behavior to users or
          developers, then this message seems more appropriate as a </span><code class="skipProofing">drm_info</code><span style="font-size: inherit;"> rather than </span><code class="skipProofing">drm_dbg</code><span style="font-size: inherit;">.</span></span></p>
    <p>Regards,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com"><br>
      <blockquote type="cite">
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Computation in 64-bits to avoid overflow. Round to
          nearest. */
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val = DIV_ROUND_CLOSEST_ULL((u64)value &lt;&lt;
          hwmon-&gt;scl_shift_power, SF_POWER);
          <br>
          &nbsp; @@ -739,9 +754,23 @@ static int
          xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int
          channel,
          <br>
          &nbsp; {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 uval;
          <br>
          +&nbsp;&nbsp;&nbsp; u64 max_crit_power_curr = 0;
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;hwmon-&gt;hwmon_lock);
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp; /*
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * If the sysfs value exceeds the pcode mailbox cmd
          POWER_SETUP_SUBCOMMAND_WRITE_I1
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * max supported value, clamp it to the command's max
          (U10.6 format).
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * This is to avoid truncation during uval calculation
          below and ensure the valid power
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * limit is sent for pcode which would clamp it to
          card-supported value.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          +&nbsp;&nbsp;&nbsp; max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK &gt;&gt;
          POWER_SETUP_I1_SHIFT) * scale_factor;
          <br>
          +&nbsp;&nbsp;&nbsp; if (value &gt; max_crit_power_curr) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = max_crit_power_curr;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs value for ch %d exceeds limit; clamped to
          supported maximum\n&quot;,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel);
          <br>
        </blockquote>
        <br>
        Same question here?
        <br>
      </blockquote>
      same reply as above
      <br>
      <blockquote type="cite">
        <br>
        Regards,
        <br>
        Badal
        <br>
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uval = DIV_ROUND_CLOSEST_ULL(value &lt;&lt;
          POWER_SETUP_I1_SHIFT, scale_factor);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_pcode_write_i1(hwmon, uval);
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0kpj2qbkm549SsbtgkwEeupA--
