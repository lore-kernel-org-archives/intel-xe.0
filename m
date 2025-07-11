Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84301C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 17:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04910E2C3;
	Fri, 11 Jul 2025 17:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf6OkSvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A86610E2C3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752255339; x=1783791339;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ERr1icODx3p+TR9kM5f49GtYRQTIlrp87Tc6BPnpShQ=;
 b=Nf6OkSvt7ZzzCgY/vd300WLpSDOFP1+dMMpPmlCcoQE4LZNkWSfictOw
 L49T/vKiRia2m7KdiHHYgZ7OCOfq5maCghaaLQJutn1pyUogha892nAOt
 Hbwk1MXj7RP642AYzB9nsDaRCB6+Gc866BjL2mUlQIfPTbqBKKxBAP9Hc
 52ziHs9JhlLF9OuuqFn4vkQtEGWOhZJiwrhH0W7fvAM25pHtOx1Pearc2
 tunm3TT9he4aUGgHG0wt1+WR6OGjy0MgTQnrBkoAoCUWno8p8AFeWMAPd
 UoOcuwAt0abZsv5u8+oKBS0DlQxvkQnEotdudmKgVraJJyK5aIPk6kqhU g==;
X-CSE-ConnectionGUID: +jF1DLBFTJ+NuTFn8+2VLA==
X-CSE-MsgGUID: eylYQVywR+CU6TeXq4VgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65256989"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65256989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:35:38 -0700
X-CSE-ConnectionGUID: feEm3g80RjaWhVgrL1PV5w==
X-CSE-MsgGUID: nPc032m2S7C4FXO+YiXUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160719857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:35:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:35:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 10:35:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkxYhkpbmLMh7RT99mKVeiwxpFS2YtNOudIcrU0Xriuqtmz1PGMDsDwahF1MQx9GXB6l7z5tZojbElvsSN2xZ4alGCgCLpoLFAwnt2UcW2CDF472cyKrKK4VLodYfo/7fLmdXGLpLBrS7tHVntT4XG1oPs7Y6rnh+PD3fTxqu2ucBBMYoHwQwMfYRL3lali24uYOXxmYIt4hGzMKwE1d9opNmkMMutGRw2nNRK2HwSoexfCuMyCi6M06s9vhT8VJ2nf5pWksKCPTCIrRxhZJOmP3D3k6ERik28axSA+gtkSPAiNM8ZHlA4VrhNl6c336HtUBYAuzoglF5A4haFqi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKYhn5Q7zHNPpzx0gox7wAAB8lnA5PdeQwbE6FJV9wI=;
 b=yMMd/3v4NeFsNx2bcrxBy/1DsaNWCaZJ9r+EgHSBsubo6HOIqzWnEWjPFao4IrfH4wrpPm/sYVfsMEfB9PhlapQvzj5sveLQyUArkVn5pqxXh0HS9/jRatxpIBMdYq8bINHUpmmibBv1Q9aCylm7H/C/B2bwkZR0AyTPf/AGtmQePhiIAETZMuJYh1xIo6RAlJH26AsCkxnvGHvVXhr/rD12STkjnc+tI/SV2N9du2+ZouxRDfdYP8hZatWPp6wQYsZBk3ptKY129cq2iYGqgsVHClW05HkjSdHcMLlfqkspA83RR1tl9f3pUYVvCdWNAizd3CwPNhD9vMDMepXkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 17:35:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 17:35:01 +0000
Date: Fri, 11 Jul 2025 10:34:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 7/9] drm/xe: Add support to handle hardware errors
Message-ID: <aHFLPpCsOq1Jv5jP@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-8-riana.tauro@intel.com>
 <aHAsEY6SY6O3DnMM@unerlige-desk.amr.corp.intel.com>
 <31500245-25e8-4f98-89a6-c321b56271cf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31500245-25e8-4f98-89a6-c321b56271cf@intel.com>
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d2daee-11f3-4def-5f33-08ddc0a1435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1AxdmJuSkw4TE5DUVFGK1FoM1pYN1pUNS92Vi84MjNVeW03TnZIOXYwY2Zh?=
 =?utf-8?B?cy94OGpsOGg1bS9rY05MWC9vakFMNHNCR3BIMUFPUWVkT2tuS3FrUzJzTG5h?=
 =?utf-8?B?V3YvYmxxdDZFZWlkRTZCZll5Mi8wMXIybnZmclpDRVdEQ2M2ZXQydkM1Um8x?=
 =?utf-8?B?bjcxc3hCRTNPWWdlbnQzTXhOL2N6MVZpOE1BV3M5dUdDZ2FqbG91bHF0R2Jl?=
 =?utf-8?B?RDRBcnUwMWhRS1ZPQ2hWMFNpZThlSjM4bW1HeUtoSTJGLzVGbE01SVJVd0Z4?=
 =?utf-8?B?Nzl1cUpYNkRRd0tLMm1DNnpQY1lLYkN3aHhyV2tsUnhmY0VFWFJOMkpTWXpu?=
 =?utf-8?B?d3NDYXFjMHVKRkNBaUNZaVZMTW1USnc2ckYyUUFWZU1uSTdMS2tiemRqTXhG?=
 =?utf-8?B?RXVjSHhUSnl6ZVFRNFM3RE8xUkJ6MjVMSzg5eDA1dEtTSjkzTUJvQ2dROWJx?=
 =?utf-8?B?REFYbldPTHRJV1QxQXFqb0RQamo5VC9lMmZmMUIybExsRE5KcHlWci9MS2dD?=
 =?utf-8?B?anZBdFpaM296RCt4UVNUY0lDTHBXYkdoVWNpWkFtM3d0UllvL0ViRUdJdFNQ?=
 =?utf-8?B?TFZGOUREekgyQmlxRmsyckl0c0FaaEtVaGk3eDBXdGlSY0FGK2ZtYTZSVk9h?=
 =?utf-8?B?MGlpb3JQRkVRcEtSUldDL3pocmoxZTZ0QWk1bTAzZ01vYWRIWE56a3ZFblpU?=
 =?utf-8?B?TW9RaHpnMUtyWVhsYWNmNkRza0dtemVaYWZxRDMwdXpuWUN0Qmo5cnVyVk1o?=
 =?utf-8?B?Y2NTcEdyT1lxOUY4WE9KeGk4aG9DS3FqMXBDYm1wN3RXRjNKbDVEbVBxRzNm?=
 =?utf-8?B?aDFjSmczVDVubGpNd3NxNncxa1IxWHEvTEZXRTVzVklXUktYWEJGa3JDVmZs?=
 =?utf-8?B?VjZVdm1neHdKd29Vc3gzOUhnN3BoQUZ1czJtaVR4OVVBTzNPWERLNGptUERO?=
 =?utf-8?B?TDZLY3ZWV1Z0QXRCYjFoZGhtYXJKeTdRdlF2ZzM2d2J1M25JSnhoTmlVMDBo?=
 =?utf-8?B?aC85NUdxemhnbllMems3dEF0c2V1SjB5dEhQRTlycjZjOUNQYlllWUd2c3NY?=
 =?utf-8?B?ZUZHK1ptRlJmVmsvRnJJMG1lbU5LcnNMWVp5dGhDWERORmFkVFB0NmlEb2Iw?=
 =?utf-8?B?UHJwWWlZRDV6U0J2Ky9KZVg3bXpkV3lXK0trRDR1S0VNSjhTQnZhZWluSzJX?=
 =?utf-8?B?WGFmcFZiU2RzWXJUWWZkaWp4ZTVnTjM1VjJuOFYzaUxlangwbTJyOEI0QXEy?=
 =?utf-8?B?MlJmOHh0OXltbnBTbGRNSzV3eGF2ZzdybURlbUVjckphZ1h5Q3hoUDl4VWdO?=
 =?utf-8?B?aTlGTnE2WW8yd1poMTRZaWtYTEJVRkhGS3pKdDk4K0dWWHBSMHAva3VtNGcr?=
 =?utf-8?B?RTBjbkVqZC9kT3lnZWR4VDJCUVU0YU0zMExSWU55TlFYbFhVWmNJZVJXTnRh?=
 =?utf-8?B?aGRUY2lKazNtMjEyVUErbFJYbkl6NmlhS3hrK1NYTnpjbk9vc1JWbWUxc0NG?=
 =?utf-8?B?NGdwMWppZmN4b0ZoS2ZaSHlqVFNqRjFEU2FtaWxSbUdPSHJtTE9JK2Qvd0hK?=
 =?utf-8?B?MzJJdDN1citmamFWbkdZZ2N1SURlcjc3THJHeENFODJ2TUgyVGdHNjRkNnJF?=
 =?utf-8?B?R2hDV0ZFNkhZVEp0Tkl4RVlZb1RuQ0RuS2Nyc1pnZ1FIOCtRRFhacG0xS0lz?=
 =?utf-8?B?RWczS0VEWmdGMTQ0SmtjblhDekIwdTVaTGVEL2RSVTlaTG45L0J3NzAxdEZm?=
 =?utf-8?B?aCs2dHhQRWhJc3dmd2ZwTjRNbFFRZW8vZ2IyVm5WdXgxODh2OXN1bzNGU0Vh?=
 =?utf-8?B?SWVPTHVhWTQzODgyOUtpRDB3SmVLZ2pNd0pzNzgxbnZML1ZYNTB6UUlmTHJY?=
 =?utf-8?B?QzcwMG5BSlN3cjNYdW9ON2t5clUzNnVoTUxEMk1RVEdhenova2hxY1RKQXEr?=
 =?utf-8?Q?vaPgeZFHVpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNXQ2FtTmdDNVRkV29TWU9QeW5YUkhjYk9BaDhLRm9OOXV3UWd3WXM5ZldY?=
 =?utf-8?B?dXJQNlB2T2k4YWRsZlJPSzZaT3lvbnhqcG1VWjNDbG45bU9ZYmJEOEFwN3Jt?=
 =?utf-8?B?NVdad29QUCttRGNhOTFUSlIzT1pVUWdET2ZydlFRYmFPZ25NWmJ1U3VRQmpk?=
 =?utf-8?B?a0VBejYvbUFYaWpIY0VrVDhYMWxkenMxWm9MUXEwYStkN25lYVBSek0rMGZ4?=
 =?utf-8?B?SjNGaEVqUzhjUS9tMzl3Mm5JMmZKUWwwbDBWZGd3TS90bjBpTXJ2RTl4TFVy?=
 =?utf-8?B?dHFnczRWUHNTKzhHbFFWQm5USkxTS0FSVmd2RXN4N0RyMEc4V3Fqa0syRGhL?=
 =?utf-8?B?L3JqOGw3YlJVVXlPSnJ2cGk3b2JqblF5eDA4RTRVZ0kwZ3lYU3Q0d01vUEdC?=
 =?utf-8?B?bDJtN3g2S3hvZjZoUUJVL29PQWNXQnJvUlhBRk1ldm04a05vdTEvTXp1OXZh?=
 =?utf-8?B?VTNIY1dhWVFqSkN2QlZUdEhvTXc1S3B4YlVmQ0dkaUNVeUpvZjdoSmc3bTdY?=
 =?utf-8?B?eEF0b3RMcUxkQklYRUlxNDBrTFFlNGdsc0RVUHYwK1l5YmNTMjM2dnBxM3d6?=
 =?utf-8?B?d0dBSWhyUFVVZU1ZelNlZ2t2cUlxR3daNC9BZEFVOFVYQXhoaVpTaXJIcVFJ?=
 =?utf-8?B?K0tkUExYOHptT00zRmY0OHIrVStwa0d0UWp5MXE3dkZwWUwzTkZEMUluL2JE?=
 =?utf-8?B?RTd6UkxWSDVTYVZlNlNzY1hISEx2SGpVQjhibEFpTDVaSENhM2hmaTU4a1R0?=
 =?utf-8?B?d3g1M0VSdjJjRGtveFFURzZ6Qk52MzFHcklzWVk1RldDUXd5TEwyQzd3cm44?=
 =?utf-8?B?LzVQbFhmd2FEa0ExV2ZhSSt2Z2VHM3A1TUZXSEx2SWczK2dtWVVxb3RGcTVt?=
 =?utf-8?B?ZTUwbXBMSGhaU0dzR0ozMjJtamM1aENVQWtqS3dnak9HOXQrbml3Q2hmRlR0?=
 =?utf-8?B?WVNmdEJqMlRFQmtXbzBUSHE5QUlXU3hteWZITURxUWN0YWlUS3ZEVHUvSWE4?=
 =?utf-8?B?MFlXRHczY0Z4Q2xnY3o4YVhXZE01eXNrVUNickVUQ2dFcVdpT0FHK3JPdE51?=
 =?utf-8?B?TWhkQ2tyMWFwUXpYQ01YQ3hiVGdZU01PUzlFdU9JZ0FuWVdvVEQva3BVajVv?=
 =?utf-8?B?WS9tQ0sxYWI2UUw4dGxBMHNXMG5VSk92QjJpNlhsNFhqMndSUXpCYzZzZ25o?=
 =?utf-8?B?U2F4KzV5dUFkcGJVRVdVT1JJZTgxZ3VicEh3dmJwUStOcjJwRmQrNFpMTVg3?=
 =?utf-8?B?Q1h1UVMwSHUvYWoxT0p6NndFbGJBR0dhUHlXYjM2Wi91cTVZYlg3QlFzWC8w?=
 =?utf-8?B?NDZ2ZlFpL2ZESFE0Nnl1bHJqS3pleUEwcndQL25BaStyQlgzTk1rQUk0emVU?=
 =?utf-8?B?YSs2VVhvRGVWcXFSYWNNeUszQzV0SDRvemFwSk9vYUhDV2t5b2w0QVJzNEFO?=
 =?utf-8?B?M0ZUUmlPNTFTVERvaWRuU2UwRERzQlB2ek04UjU1V1B1U3hWSjZ0QVRITUht?=
 =?utf-8?B?Y3hDaCtYbmlWMEdERHdJSmpHc2IrZ1NWbXBNby9ZZmtsaEpNTk8wRTFFNWpk?=
 =?utf-8?B?WmdpclVsZnBITUJiOERMNWo2dUd4ajA3bHBhWm1mTElpTlE5Y1RQWUxTN01F?=
 =?utf-8?B?S0hUSzdNTDVBWjI1TFNGQnY4SVZ0d2hIdWZ5RTJSSnpWb0tneUJGTzBZemh0?=
 =?utf-8?B?U056ZlFzTjE4UTRualVmeG1rWTRDbVJGQytrZkRRaUk0ak1RUEloTGo0U3FX?=
 =?utf-8?B?dElhbDkrQzF6Y3U2azRhRDhCZ1kweVNQYWIvT2xXditxRmxRVDlwZFd2NXJK?=
 =?utf-8?B?MktJZ0MxQlh3STRmY1UwazdHQ2JNNDdhWXJ4c3ArUEFqdHFaTXhJNUxtcEFj?=
 =?utf-8?B?ZjdmaHB2MFJTM0s5RFNXbzY3QStqNmN5bUhOMzhFWXgyaGw3bXhnelp1TXRn?=
 =?utf-8?B?TTg4MTMwMXBLWlFDaE1oREwvay9BUGo3M1V2SzVKWG95aWtkeVJScTJrRkt3?=
 =?utf-8?B?dmVjb0hsUEttZk1TRlVWTndGZ2ZTUjYwZ3dIVGwzMStpQTdZS1NzZUhLRTlz?=
 =?utf-8?B?dHA1UkRqYkVSRWNXRWh2US80THBvQUdmdS9QVWlkVG8rcDNVc3dCVkFiZENE?=
 =?utf-8?B?ZW40NlZQV2EwaVZtTU5TdDVhdVBwOUZnMkJndmN1azJqNFJqYzlEd0hiSVA3?=
 =?utf-8?Q?BZukfQx63ouZW/xMwrSfTiU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2daee-11f3-4def-5f33-08ddc0a1435d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:35:01.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgvzoaV/GP23t3HDNk5kWZlYKR2lXxFF4vOgUcc7NXZlqNE5N3bv92vYtdyWGEI15Qa9k7YEkQimgabC8yGTIfkKc//ajCclT+R7ez+X738=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

On Fri, Jul 11, 2025 at 11:05:04AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 7/11/2025 2:39 AM, Umesh Nerlige Ramappa wrote:
>>Resending since it got lost earlier...
>>
>>On Wed, Jul 09, 2025 at 04:50:19PM +0530, Riana Tauro wrote:
>>>Gfx device reports two classes of errors: uncorrectable and
>>>correctable. Depending on the severity uncorrectable errors are
>>>further classified as non fatal and fatal
>>>
>>>Correctable and non-fatal errors are reported as MSI's and bits in
>>>the Master Interrupt Register indicate the class of the error.
>>>The source of the error is then read from the Device Error Source
>>>Register.
>>
>>nit: Since Fatal is a separate category, maybe a split here into a 
>>separate paragraph and some formatting would be good.
>>
>>>Fatal errors are reported as PCIe errors
>>>When a PCIe error is asserted, the OS will perform a device warm reset
>>>which causes the driver to reload. The error registers are sticky
>>>and the values are maintained through a warm reset
>>>
>>>Add basic support to handle these errors
>>>
>>>Bspec: 50875, 53073, 53074, 53075, 53076
>>>
>>>Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/Makefile                |   1 +
>>>drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
>>>drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
>>>drivers/gpu/drm/xe/xe_hw_error.c           | 108 +++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
>>>drivers/gpu/drm/xe/xe_irq.c                |   4 +
>>>6 files changed, 144 insertions(+)
>>>create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>>>create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>index 1d97e5b63f4e..fea8ee3b0785 100644
>>>--- a/drivers/gpu/drm/xe/Makefile
>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
>>>    xe_hw_engine.o \
>>>    xe_hw_engine_class_sysfs.o \
>>>    xe_hw_engine_group.o \
>>>+    xe_hw_error.o \
>>>    xe_hw_fence.o \
>>>    xe_irq.o \
>>>    xe_lrc.o \
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h 
>>>b/drivers/gpu/ drm/xe/regs/xe_hw_error_regs.h
>>>new file mode 100644
>>>index 000000000000..ed9b81fb28a0
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>@@ -0,0 +1,15 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2025 Intel Corporation
>>>+ */
>>>+
>>>+#ifndef _XE_HW_ERROR_REGS_H_
>>>+#define _XE_HW_ERROR_REGS_H_
>>>+
>>>+#define DEV_ERR_STAT_NONFATAL            0x100178
>>>+#define DEV_ERR_STAT_CORRECTABLE        0x10017c
>>>+#define DEV_ERR_STAT_REG(x)            XE_REG(_PICK_EVEN((x), \
>>>+                                  DEV_ERR_STAT_CORRECTABLE, \
>>>+                                  DEV_ERR_STAT_NONFATAL))
>>
>> For x = 1 and x = 2, I don't see the above result in correct values. 
>Can > you please double check?
>
>I had got confused with the same when i took the patch from the other 
>series. But the second part of the macro becomes negative and the 
>registers are correct.
>
>Calculations for 1 and 2
>
>#define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>
>_PICK_EVEN([HARDWARE_ERROR_NONFATAL = 1]) = DEV_ERR_STAT_CORRECTABLE + 
>1 * (DEV_ERR_STAT_NONFATAL - DEV_ERR_STAT_CORRECTABLE)
>					    0x10017c + 1 * (0x100178 - 0x10017c)
>   					    0x100178
>
>_PICK_EVEN([HARDWARE_ERROR_FATAL = 2]) = DEV_ERR_STAT_CORRECTABLE + 1 
>* (DEV_ERR_STAT_NONFATAL - DEV_ERR_STAT_CORRECTABLE)
>					    0x10017c + 2 * (0x100178 - 0x10017c)
>   					    0x100174

ok, makes sense now,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Thanks
>Riana
>		
>
>>
>>What about DEV_ERR_STAT_FATAL?
>>
>>Rest looks good,
>>
>>Umesh
>>
>>>+
>>>+#endif
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h 
>>>b/drivers/gpu/drm/ xe/regs/xe_irq_regs.h
>>>index f0ecfcac4003..2758b64cec9e 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>>>@@ -18,6 +18,7 @@
>>>#define GFX_MSTR_IRQ                XE_REG(0x190010, XE_REG_OPTION_VF)
>>>#define   MASTER_IRQ                REG_BIT(31)
>>>#define   GU_MISC_IRQ                REG_BIT(29)
>>>+#define   ERROR_IRQ(x)                REG_BIT(26 + (x))
>>>#define   DISPLAY_IRQ                REG_BIT(16)
>>>#define   GT_DW_IRQ(x)                REG_BIT(x)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>>b/drivers/gpu/drm/xe/ xe_hw_error.c
>>>new file mode 100644
>>>index 000000000000..0f2590839900
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>@@ -0,0 +1,108 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright © 2025 Intel Corporation
>>>+ */
>>>+
>>>+#include "regs/xe_hw_error_regs.h"
>>>+#include "regs/xe_irq_regs.h"
>>>+
>>>+#include "xe_device.h"
>>>+#include "xe_hw_error.h"
>>>+#include "xe_mmio.h"
>>>+
>>>+/* Error categories reported by hardware */
>>>+enum hardware_error {
>>>+    HARDWARE_ERROR_CORRECTABLE = 0,
>>>+    HARDWARE_ERROR_NONFATAL = 1,
>>>+    HARDWARE_ERROR_FATAL = 2,
>>>+    HARDWARE_ERROR_MAX,
>>>+};
>>>+
>>>+static const char *hw_error_to_str(const enum hardware_error hw_err)
>>>+{
>>>+    switch (hw_err) {
>>>+    case HARDWARE_ERROR_CORRECTABLE:
>>>+        return "CORRECTABLE";
>>>+    case HARDWARE_ERROR_NONFATAL:
>>>+        return "NONFATAL";
>>>+    case HARDWARE_ERROR_FATAL:
>>>+        return "FATAL";
>>>+    default:
>>>+        return "UNKNOWN";
>>>+    }
>>>+}
>>>+
>>>+static void hw_error_source_handler(struct xe_tile *tile, const 
>>>enum hardware_error hw_err)
>>>+{
>>>+    const char *hw_err_str = hw_error_to_str(hw_err);
>>>+    struct xe_device *xe = tile_to_xe(tile);
>>>+    unsigned long flags;
>>>+    u32 err_src;
>>>+
>>>+    if (xe->info.platform != XE_BATTLEMAGE)
>>>+        return;
>>>+
>>>+    spin_lock_irqsave(&xe->irq.lock, flags);
>>>+    err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
>>>+    if (!err_src) {
>>>+        drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported 
>>>DEV_ERR_STAT_%s blank!\n",
>>>+                    tile->id, hw_err_str);
>>>+        goto unlock;
>>>+    }
>>>+
>>>+    /* TODO: Process errrors per source */
>>>+
>>>+    xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>>+
>>>+unlock:
>>>+    spin_unlock_irqrestore(&xe->irq.lock, flags);
>>>+}
>>>+
>>>+/**
>>>+ * xe_hw_error_irq_handler - irq handling for hw errors
>>>+ * @tile: tile instance
>>>+ * @master_ctl: value read from master interrupt register
>>>+ *
>>>+ * Xe platforms add three error bits to the master interrupt 
>>>register to support error handling.
>>>+ * These three bits are used to convey the class of error FATAL, 
>>>NONFATAL, or CORRECTABLE.
>>>+ * To process the interrupt, determine the source of error by 
>>>reading the Device Error Source
>>>+ * Register that corresponds to the class of error being serviced.
>>>+ */
>>>+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>>+{
>>>+    enum hardware_error hw_err;
>>>+
>>>+    for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>>>+        if (master_ctl & ERROR_IRQ(hw_err))
>>>+            hw_error_source_handler(tile, hw_err);
>>>+}
>>>+
>>>+/*
>>>+ * Process hardware errors during boot
>>>+ */
>>>+static void process_hw_errors(struct xe_device *xe)
>>>+{
>>>+    struct xe_tile *tile;
>>>+    u32 master_ctl;
>>>+    u8 id;
>>>+
>>>+    for_each_tile(tile, xe, id) {
>>>+        master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
>>>+        xe_hw_error_irq_handler(tile, master_ctl);
>>>+        xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
>>>+    }
>>>+}
>>>+
>>>+/**
>>>+ * xe_hw_error_init - Initialize hw errors
>>>+ * @xe: xe device instance
>>>+ *
>>>+ * Initialize and process hw errors
>>>+ */
>>>+void xe_hw_error_init(struct xe_device *xe)
>>>+{
>>>+    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>>+        return;
>>>+
>>>+    process_hw_errors(xe);
>>>+}
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_error.h 
>>>b/drivers/gpu/drm/xe/ xe_hw_error.h
>>>new file mode 100644
>>>index 000000000000..d86e28c5180c
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>>@@ -0,0 +1,15 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2025 Intel Corporation
>>>+ */
>>>+#ifndef XE_HW_ERROR_H_
>>>+#define XE_HW_ERROR_H_
>>>+
>>>+#include <linux/types.h>
>>>+
>>>+struct xe_tile;
>>>+struct xe_device;
>>>+
>>>+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 
>>>master_ctl);
>>>+void xe_hw_error_init(struct xe_device *xe);
>>>+#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>index 5362d3174b06..24ccf3bec52c 100644
>>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>>@@ -18,6 +18,7 @@
>>>#include "xe_gt.h"
>>>#include "xe_guc.h"
>>>#include "xe_hw_engine.h"
>>>+#include "xe_hw_error.h"
>>>#include "xe_memirq.h"
>>>#include "xe_mmio.h"
>>>#include "xe_pxp.h"
>>>@@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, 
>>>void *arg)
>>>        xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>>
>>>        gt_irq_handler(tile, master_ctl, intr_dw, identity);
>>>+        xe_hw_error_irq_handler(tile, master_ctl);
>>>
>>>        /*
>>>         * Display interrupts (including display backlight operations
>>>@@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
>>>    int nvec = 1;
>>>    int err;
>>>
>>>+    xe_hw_error_init(xe);
>>>+
>>>    xe_irq_reset(xe);
>>>
>>>    if (xe_device_has_msix(xe)) {
>>>-- 
>>>2.47.1
>>>
>
