Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA866C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AAB10EA6F;
	Fri,  6 Jun 2025 13:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhUCXKZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E5910EA6F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749214993; x=1780750993;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=/u5MJnWbvpoAdv80S9/bq0SuShqk9n25yAhdLEJrcc8=;
 b=AhUCXKZdIQuTJZeqLT/0h8TksAR6js8Vihzyk9nVkDojYjax4CFCuvEh
 s2zpbVb65GyqtMUCAhSIa/9X0RIATsWDTyAm9laarl0AzEoH097QBwl7I
 t6zopGPh07uvwrLttkNIqiq+PMXrpOfUma1Rh90QRFCsqUgkehOe8Pskc
 J9Z1PEkMZdfhA2HShbERfyFWih3bR5BahtBc3p4CnXESSwWsV7l2RaRkB
 yAlFg5T0nZ5nuzJDOeILaSB4RqKlCgv4fqVKA8yRgHnr9074tkqr2ns8a
 +UFFGyK6NDz71sQI/Ooi5EeG9QJC5e+ZcYW9ZSYN+JHatwoCpKboFpUBZ Q==;
X-CSE-ConnectionGUID: y4IM3lgpTia2bX8H0YiH+A==
X-CSE-MsgGUID: X2LgA7KSR6CDDhl+ugt2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55025076"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55025076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:03:12 -0700
X-CSE-ConnectionGUID: 0v8xfwRsTqKhaHoWax+mpA==
X-CSE-MsgGUID: QNvH03KyQmKDMPzahFktSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="169006623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:03:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:02:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:02:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuuI6S3PmW+OAAA/aNRUOInJmgFYVxdzmf5hq52DFXfqyFdgouxcp/4U0P0v7iwWbHUWfcuqHIO6vBiFtcwreuFQH7RudgENhi6+DalW6ow1qtddWnPxT7o8CQZ2ZFob4Z9H6wlig3DR+iJtfw2hCXMHuTJYvq7A5+q120+pwQb/I3FGVkbyx+Nf6yE6691jRae2DCwiioO9CsWvLS7EVz+kvnO1raV7ajKjwu3FiPEFjpAHVVocXQe5TkWlIXYlV8lQGmCsA0NTfa5IzAIxI7fcOQQ813AIYzqAUdnd8t3FAqO83jVKqBWVLDNOQr6b3HDFHbHa0QuRYAjC0f611g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93GLzOj0fN61J/rlHeO3WnYPh7ke7Iw8o74chhVtkwg=;
 b=Rsz1jDwJkBedhyLBA0R1skl0wxeEgg/dbrxMevXDzsOL7lHdo1lw7E3rEuJ7O4ZNfgTVWcB8cZmHd8vmQxACJByJ8LcCiC1/Xp2a5e7xMC63uS61yUmk6yjk4qcUdOqyc5wKHBzEi14qkCw7/4Sl82kUfuWAApi3rpPDe8BINxjTFojV0WpINBEgaHh0OCLfEd6NqtlkpOUTsqxWWSvIjCxLM9eO+t+pzMcJ+heJ0rs2k7A2HYJzFMFkYO20uQZpgJQqdAk0bBskQttMajSqipOI8iezA6GBWFxdgTPbVYaYgONn1Jap3MyBNN7Elp3m/HpYqcmutiIVeXKz73Kwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 13:02:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8769.033; Fri, 6 Jun 2025
 13:02:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250605225352.2333981-2-matthew.d.roper@intel.com>
References: <20250605225352.2333981-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: GSM size should be constant on most platforms
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 6 Jun 2025 10:02:49 -0300
Message-ID: <174921496965.1605.2646622421829934712@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c06a410-6f3e-48b4-efc9-08dda4fa74a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVV5WUFQanp1andsckJDdGNqOXBYdWFISDY2R0VGRlZFb1doZVhIeXVkZzhm?=
 =?utf-8?B?a2lKYk5kaHJLMVpJOHc5RUdTS0lpZUJUWEMrWUJSYUxLbjNkK2JqZUc3MEF0?=
 =?utf-8?B?MVMvaTFta3pLYnBIdnlHbTBDcGdRVXJQNEo0RVVEY3NPQUlzMzlTOFQzMmpJ?=
 =?utf-8?B?N1NlSGhweHhqTWpVMHNVRWc1Y0psYVd1eU5SSGovWFl6RzN1a2pmMXp5VDlO?=
 =?utf-8?B?ZVpXR2MyRWhja1RnOHA3WDArSmhQZVdhMHpLWWJ3QlBGbHpPVGN1SHNqTHJF?=
 =?utf-8?B?ZmR2UW5ZYXF6dVRVT2I5S3hVWkNUVUovSk5ZQ200VS9qSStPWEpNNHlSWkw3?=
 =?utf-8?B?RDZHUU5lcDd3TnZza1p0aVpzQnd2QnJoUWxLUmNHejE5eVRwdnliS2F4UnV6?=
 =?utf-8?B?TlJvMDl3Qkk2T3czSjdxVEd4NmpGbjdFTnovTXpBRDc3NGVmTXZQZ042b3Q1?=
 =?utf-8?B?R0J3Ym1aNEU2TTVqRUwxRGtRM2QxalR1Sk5VQlBQeENubkIzem5rV01xYXgv?=
 =?utf-8?B?OVJiK0Y3ckpkSzZ0L1J5QXdEWlN4dGZNb2hPOEpoR0tHZWhUNlpJS1I2U3Vj?=
 =?utf-8?B?b0w5RlJUT3lFTWFQUFlVdTF0TER3SENoTURIKzBMU1B4c2hqK3hvWllRTW5S?=
 =?utf-8?B?bjZMUXE5cjRQWTZDbzBmSmlOUzlMazkrV3ZGc2lVT0xnRjU3a0RELzJ4TFZZ?=
 =?utf-8?B?bEllUm4vZFNEMWdJMHU4bFgyKzI3ZGJnb2RGY1hKdmtZTzZPT1lNdW5UK0hI?=
 =?utf-8?B?OFBKQXJraFVSWWV3dGVLTEdmWVBPUU13OWxmbFZPUXFKNVRTQStCNTNIeTBn?=
 =?utf-8?B?UkU3eDN1MXdjK1JkbkllOEQrZDM4cFpoMTY2MUxyN3lyY2FVUWZ6WlJ0T1FY?=
 =?utf-8?B?TjVwOEJWcEtlRUpxaDlyRXFUS3VyWEtDaUsyUHNSdE5yMnVYSzVFZnV0aE45?=
 =?utf-8?B?Um1iQzU3b2oxZTMwQXRNbk9tWHpPK1YvNkdhVEVEeVdLc3JwTHhid3FQMThw?=
 =?utf-8?B?cDQ2d1VGZUkzOEVlRFhaOGV0U0NUMVYraVF3RVBDcXAxNG5DNnA5cktGL3hV?=
 =?utf-8?B?VlhKNmRKaDBiL3pxMUJyMFFsMkRYQUprUkM1RWZoTmJFSWs0Tks5akVRZkRh?=
 =?utf-8?B?UGlOdFhDaFhWVktzbUpUaHB0VW5jaHhLbEpEbll3M2Y2akFHMUc1dUJhMnpL?=
 =?utf-8?B?STlsNUlXL3RMcDN0MTBjWFdJdkJsRVBKSUx1VDVpZGw5MFA0cUxpMERNM2pp?=
 =?utf-8?B?UmVSRFdEd2dGSWlNL2hGU1A3d0F1U3pMcDQ4QlByblFKSys1aFFCOGNnVFB3?=
 =?utf-8?B?a1c3ZVdwdjNYK2tZRVZSR1lyZ2txVzVvbXNlblQ1WlJJQnJGeDR5c1VnazJC?=
 =?utf-8?B?V1BnVnVGenhQejhZZHZ6eHk5K1VoRDhreW04azExMWpZNlhxTFk5c2VsR09V?=
 =?utf-8?B?OGxsZ1pTVkpaaERqd0VqdEtDR1R2ajZmZHNnMlIxWUNiK2huenZMUW52Z3Vi?=
 =?utf-8?B?WHJEejZHMU1tVVJXa0o5MzV1RDZzZ0NqT084WVcxTGZ3N2MzdXRza1ErWDVL?=
 =?utf-8?B?MW43T3hoZS9SZTFXSFZCZkF3cXJuV3RKNzFNajRPcjFSZTZqcTh0OFNlVDFm?=
 =?utf-8?B?MHFlMHVHUEZlQVRrd25TYUF3d1dsTWI0WURCanlnWWdYMWZvLzBwL2JuNWVF?=
 =?utf-8?B?QnZ2K1VjWWx6OGI3L01RQmRaa1VlTVpVVVhTa2d6bC9pa0JyU2Vtc2Q3bHBl?=
 =?utf-8?B?eTZobnQwZngxK3Z2YzRDOTltS0VWMC9ienp5T3JjQWkvRkhaNlA5TTVMMjZi?=
 =?utf-8?B?M2ZNR0pvZmc3WUNBdDJnK0VTK0tGd2RpVW9ZVlFibWIzSXNjcVBZY2lKRHd4?=
 =?utf-8?B?MGZDSlA0VVVHTzU0V0dqMG5tUzljOURqelcwRktibXBXcXhMeVE2Vnp1TjBa?=
 =?utf-8?Q?QhVXUbvesbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xGcFd3TXNDRC9OR0lpV2RlS1FndmloMVBreUlaQ0pBQyt5R1A4dnlobFNQ?=
 =?utf-8?B?TzdWZXMwcDBmc1pWUk91Y1hYQ1plaGNYOWQvQWVsd0ZCZWRTM1N6eXFFRmt0?=
 =?utf-8?B?QjcwN1RqSjdEZEJkWUNhcE1KbUdXREd1eWI4UHg5azViVDlKNXQwSzJ1QnNG?=
 =?utf-8?B?aURONmp2dEhiQUNFNjZVQmRaNnlPV2JLTElTYVdvTmpYbmZYWVhsT2FwYnlt?=
 =?utf-8?B?VG90Uzd1RmdtU0dVRlVETElYclM2VmZBeTNOalZWSXZCcmVVclRiV3pib2ZD?=
 =?utf-8?B?aE5mVkswc2d5Mk5IMDdoQ0lWbGswcHNMaTdRVERGcDZsaVhqd1NUQWp6bXY5?=
 =?utf-8?B?V25WMHFDdzZ5cFdnOTA0My92VmgxVkRIdFdvaFREUWZ3aDdLUDgzc3Zpdm51?=
 =?utf-8?B?WG5mdWNwd0FsekJqSkYrL0FzRnRqWVJ3WnN5VUJlejhab2FmR011UlhlVHlG?=
 =?utf-8?B?U1JUUU9aelJuM1VxMUlXd2Q1eXNXZDRPMVZRVXRnTHdneVNPZHh6RnNwbkUz?=
 =?utf-8?B?c1N5VUhLSU8vWFVjdUh5WFFYSS9PbkU5OEh5bWkrdHdYN1ZnU01VY1k2SlUw?=
 =?utf-8?B?bnQ3QUlqZ0Q5WldTaXMyMXFydkI4TnBvWTlyMUMzK1BzOStKckpyRHVWa2dz?=
 =?utf-8?B?OTdTb2xzM0FyRUF0UXhoVVA1RHEvUnd4U0ZzR3d2YVc2R2N0Z0U0bHN1elda?=
 =?utf-8?B?c1RpWjdYcTc0b0VyWkxDd1Q2Qnlwb29JQUJITis3WGR2RzluU0ROeDVwSzVH?=
 =?utf-8?B?dlg3cWlJQjBmbngvaUlZUmk4cFQzOFN5K3B5UU1zUEJVVGF0amtReUVqenhl?=
 =?utf-8?B?QldMM0I4N0R4VkxPM2s5L2pLbVZtZE1SSldlYnVRY096ZnQ5TnBiV3luc0d0?=
 =?utf-8?B?TUhLM3EyS3piaEtRbVZMbVpTTzU2cUpRbUpmSEZwT002TFhLdlFEZ1hLbmF0?=
 =?utf-8?B?YXNxSFRrbnRCZkFxY3FLeFMzWmhHcmFwMmtvMHV5V2E2a0tZQ3BQQ2JZNERt?=
 =?utf-8?B?c2grdjEzemtDNnJNcTRqMkk1QlhTOU8vZEtSaTY5VXNQUFROb0g2bHhrbGEx?=
 =?utf-8?B?bjROMU1mcHJrWU01NmRKT3AwbkhlWDNiTnd1TTBaZjg0K1hJN1F6MTErU21I?=
 =?utf-8?B?a01aSnkzaUJyRm5FNEtrVmZ2K1VkYlVFdzFGK1NBcWZhcStYd1hpczhUZ0RH?=
 =?utf-8?B?dktmeEJNbTBEb3RnMVVrR043UHRyVW1PNGpKdkRObDJEdVRxTG1BZlIySWZM?=
 =?utf-8?B?QmZlWjYzS2xOdzZZTUk3ZGdrekFVTWRxeUd5NklvQmxuMmx0eDZKVHk0YjlI?=
 =?utf-8?B?ZFhUQ2NTbUNEeWNzNWg0ZkpDOUVoL25kMnYrOFArb1RuanhWOG9LcXF6Mm1o?=
 =?utf-8?B?aUNVNjFBVCtxa1VoQXNxYVd1cHl2ZGhpUmRnVzF2Nk9iV1JjVHJjZVBOeExq?=
 =?utf-8?B?V1RWR0UvRzErRU1tR2lQTkIrSzJQZWp3TUV4Q1h1TjR5QVFTZm5mT21KMGNk?=
 =?utf-8?B?RjVIbnpzU1FMMFg3ckE2NlM2eUxlRS9Ua1QranRMTVlXRXZWNGtJK1cxU1VO?=
 =?utf-8?B?YitXYmhGa1JsRlRLcnJGT1Zndk45dzRBL3k0d2JIUE41VTJtRmwyZnVFMWwx?=
 =?utf-8?B?d0xlMklCOHBtZDlkT2paV3hsZGd6V2JzdUhTekZRRHNXS042b2E1cGdNWTBq?=
 =?utf-8?B?bmlIWmJTRGppS0FyVElCRVdOSVJsNGNmKzJ5NzJJWG1iVzI0T1Vjc2xyb0t6?=
 =?utf-8?B?d2NqL0ZCeUZUVDNkM0R3VWZidEtRcG5uU2dhdWN6bXpZd1Y1Si9ucWpKc2pu?=
 =?utf-8?B?WU1ibllhT2s2b1B5YzlGVEZsNDdKUEZ6S1JxUGpWZVpyYVpYZUVna0pLV2lB?=
 =?utf-8?B?czNqTTdXWDNxUjYzYTdySC9KcDFJdVlhR2lHL1NNbTB3d3doczhmZ0xrNnNv?=
 =?utf-8?B?SmJ2ekZqZVdjWEFaUkFzZE4wVjBrNnZBa2VScGt3M2pGaWlNWWNpeG5KTGNt?=
 =?utf-8?B?SXVuYmxaVysxMWI0bTZvSHRVbno4VDk4WjIxMjU1TmR2QWtxMitnZHpEZi9Z?=
 =?utf-8?B?NENrMHpxbVIwTEpjSmpJaDVDMForTVpGL3BoOW5mRWI0eGpqc2ZtODdRZ2tF?=
 =?utf-8?B?ZDBRcTk4bmgzN3JtL1Y0ajR4ZklkclgrZ012UU1HVHdXeWlURThHbGVrM3Nm?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c06a410-6f3e-48b4-efc9-08dda4fa74a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:02:56.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3Uy5G8w41HYNtvsDFdqVdFG/YJE0mGT1luFM6x5cXbEoRH+Rx+KeHFHS762gIcGGRfXJdWZtA8qKbN+59k9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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

Quoting Matt Roper (2025-06-05 19:53:53-03:00)
>On old Intel platforms, the size of the GSM (i.e., the stolen memory
>that holds the GGTT page table entries) could vary, so the driver needed
>to read the actual size from the PCI config space.  However from Xe_HP
>onward, the GSM is now always guaranteed to be exactly 8MB (which
>translates to a 4GB GGTT address space); this is always true regardless
>of what the platform's much larger PPGTT address space is.
>
>The bspec doesn't document the PCI config space as being a valid way to
>query the size of the GSM after Xe_LP platforms, although so far it
>still seems to be giving us proper values for Xe_HP, Xe2, and Xe3.
>However we suspect that the config space will stop providing correct
>values on some upcoming platforms, so we should stop relying on it.
>Instead just use the hardcoded 8MB value as documented elsewhere in the
>bspec.
>
>Bspec: 49636, 67090, 50589
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index b9a0fd5ccaba..3c811f6e79c9 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -219,7 +219,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>         unsigned int gsm_size;
>         int err;
>=20
>-        if (IS_SRIOV_VF(xe))
>+        if (IS_SRIOV_VF(xe) || GRAPHICS_VERx100(xe) >=3D 1250)
>                 gsm_size =3D SZ_8M; /* GGTT is expected to be 4GiB */
>         else
>                 gsm_size =3D probe_gsm_size(pdev);
>--=20
>2.49.0
>
