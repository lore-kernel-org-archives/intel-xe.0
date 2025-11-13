Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856BACD8CAF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E6A10E10A;
	Thu, 13 Nov 2025 17:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/2COaX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8310E10A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056563; x=1794592563;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=jbMacYZJboHoOPAYI5Yd8Yamt+6w+MfHEAmvFNTgkpo=;
 b=M/2COaX2+i/2Uw6CFOG7remR1uYLpaKA81mceMWfh2xLtc3qT+lx7rn/
 lXT7ndogGeKVrL+1VuR6uEZ/AnzjXe6ERKWGTyK5/24FxyPmxSc5NOAC/
 GOt4M972drTJ5/8ugW5xesFFM9FL6l63lmJV2AK8LW3DvGLhUJ3Bhs7Sm
 fZuyKPTqDfR5AZJAERq4QIvc+/zbwVZlnuBh3OWH6JjcdFnZso1IguBXJ
 SOUA/Vy7F9Do0pC967a7zKR/O/HczjLM5HSQ362CTgZyiWXo/0tnqDiXZ
 /zg9BqKIdRyjnCnnktG+bWEFG/rvdWveo1v6JRZyZfv2RIj4KbjVE11JB g==;
X-CSE-ConnectionGUID: fxUhzHyNRhSSUqfj5WiX8A==
X-CSE-MsgGUID: rYlttdegRoqeOtJ3z8GYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76489976"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76489976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:56:03 -0800
X-CSE-ConnectionGUID: pFKAE7MCS2mMZTpM8nOmdQ==
X-CSE-MsgGUID: NsQcfYsdTROXGk879YEstA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189406245"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:56:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:56:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:56:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:56:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSXA6C3KyXGgykiIm9XAceL/Zy1ZiaZDkHbc9KUR7wuIX4+OsWiAK0d7jCRPVi2bw+2tXDcT9DruE7sfGV5YaXSVlk3irZM5J1AZgmKqetFcvJ3xS9hCks051UpHUWD2fegj0s4o8G9LSjnOQoCJgg3bKfoYhGQSgC1QWM/4Ok6vAX+/1edpKKoOLN4UWCfp6Zvi/tOp3z6l2vD+PEbVYr69lAnjpFh5oG5TZf9vfSSlThwn59R7mrf+AxWDkO8eW8pe5UWgpQBs/PUeYVECbl1OTf+C4U73PWbn3P4wDLk5AuF7zlVTyahJOhHGf7RZFOStEGVI7K3wwogrh/s0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXnYiFF6jkeXxlFQJWs9dm+FMXIsOMTVuZ2/JL/1juM=;
 b=p5+IltsuOZJdiLH5GlOPkZaIEEhNvAl2qQrtWkF4X+VXA3cf6CrkDrNbClEZoYBnFhnOZK1SyesNqosSn9gQ+dlZKLY3KQDG/G2aBBWXg/xThJoEObVZ2PltAeLAYBcCdXMn1FD3+D+ubYL816qjojlL4ipY6fyOgNo09okPp/bDXps6Tp2VDW8kwqqrDiu6SHxvMwOR1adBYfB8lc5oLUtKOL7yMfbIa3k0I3/MEe+FCKw1k4tOwGCrR4XX2k2vF3Ur31JwjqB/Kk5RZ0h0T87Eq5OPTcGgkGBwLUSehHPQ6RV7sqG0ceKZ1gQH1/3yefV1kBUf/+dN1Ywec4Q7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 17:56:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:56:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-57-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-57-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 25/30] drm/xe/ggtt: Use scope-based runtime pm
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:55:39 -0300
Message-ID: <176305653904.3698.795996523301397056@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: efe870e5-669b-4190-fdf8-08de22dde789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2JpNVN4RGRXQ2tEaDJ4djl1Ujh6WHE2bG4wSHJRZ3d2YktxaHVzZk9PYW91?=
 =?utf-8?B?ZncrNzhDRmV4OXNoYWRlbVkwRklZZ3RqbmlEc3JQSURaTlNSNCtrcERmS3JT?=
 =?utf-8?B?U2xjSFlLUFJrTVBoZWc4aC9iSjdvVis2Q3p1T2IwVnBxUVBHYURBdWQwM01m?=
 =?utf-8?B?SW5TaTRlZmVEcHJocHFIOW0wamQxRmNIL1NVN0J6K3RWbWlQMDJQVVJxSzRo?=
 =?utf-8?B?cUwxVXltUU8xSis4Ti9pT1JrZzdBWE96NWNWSmNjcjhMbVZqS09jcVZhREQ0?=
 =?utf-8?B?Yk56YjB2UDE3Yi81emtIYzVuUDZhMHRhSzlnc2pFSDNLdWsyaFQybjBNajRY?=
 =?utf-8?B?VUFtczNkbWNLL0RONXc3KzZtL0I0MGNVdFdSa0kxUXUxbjdQRHE2NTV3b2dt?=
 =?utf-8?B?T3NjVjkzdzR2Q014cGk0cktPZlpmYXpqS2J0T1gxMjduai9OVUVmR2I4bkJ4?=
 =?utf-8?B?NkJaZi9wTENoVWdJZjFqNXV0WGt2ekxSaVVVYnRJVGUwRW9RTXNzWmtqeUJy?=
 =?utf-8?B?R2RJekowMzZDakthSCtnMkNWV09DRHhOSHNZRW1JYzZVYndna3pRUVM5V1VP?=
 =?utf-8?B?eUlLWmNLRHkvWmtyWFdpcnUvUkwyaVJYak50bGVCbEh1R0dvVktQekFOc0dC?=
 =?utf-8?B?c0svOFJRUThFWHFiOVMzOFNqaXlsUDlJNVdkMjZ4akxoa2UwTVZodU84c0N0?=
 =?utf-8?B?bEZ4a3BFeVlmczY0emZiSTFjYmxobncvazlGNDFpdnd2MllZbFZkOVExeitW?=
 =?utf-8?B?d2c4RXBsdVJ2czluMnJFMU1CV0t1ZzJLaFV5WGljeGhDMzhMNG1yR0dXYjVs?=
 =?utf-8?B?Z3BHSHRqMzlqZkN4K3E2WTRzYXRlZG5aZWZSeXdJZTgzSis5M3pWQUI2QTNZ?=
 =?utf-8?B?eGpHbmF4K0UwSzdjaXNNNkE2L3E5UTM1VE9BeFJrbVJvWHJCNHBJdmllS0p0?=
 =?utf-8?B?VDFrMHlZbTdERERocm9IRXY0UE02WFBoMllGWUJJeEtnc0FpNWo5RGVDdUM1?=
 =?utf-8?B?cjlMWmFTRjUxdkdvSHBPSmYvcC9hV3lVR0VTd0pPcjZLVVRzdXNNaFFpTy9C?=
 =?utf-8?B?SFZSejB2MFI2VFVGZjNHbmRJdWlnS08yUmF6Vm9PZjR1a0ZpVENxZmNwRWdt?=
 =?utf-8?B?cWpxTEVqYVZXTzRMbHdVTWVTbE5CaURRTmR1Q29OOTdWQXNyWGRvRjlLWDh5?=
 =?utf-8?B?R0ZvamZaRk5FVjdwM3pPcldxNzhTeTl6TU95a01aZ3RSSU9JY1dxZng1Q09X?=
 =?utf-8?B?OWptNFpKbjJScHZFZnQ3czVJdGtxWTYwekw5aUtWN3NRY0hOMW1HMCt5ZE43?=
 =?utf-8?B?YUdjNThSVk1sanFYQWVSS3luQi9nM1dJdzNZRWo0aGZDL05sSy9QbWJFVjcx?=
 =?utf-8?B?aWUxRjVMZncxc2xTcTl6aHM4Sk9NRzkyWEhjU2xJZmpoZVE4YVBaRTFwQ3Vq?=
 =?utf-8?B?a01FbnMxVFByczhVWHVEQ3V3K3NxS3lBVndYMkVTTDhPbEIzemFzUW5UbFZk?=
 =?utf-8?B?VzYwOHRLUTc4MzlyQnl6T3VFL2tZVWs2RUdVYjhUN003Ty9vRi9GRmlvN2ZY?=
 =?utf-8?B?eEdnOG9FQzNUQlVISUcxdmwweHUrdk9NSEJLSUIrVlViakNJRTM4cUxuakRC?=
 =?utf-8?B?SjQ2YWoyU0xHRjdOYmpUK2RiaWxhRGZVem1hbk1waEh2M2hvQ2NoKy9CVUdp?=
 =?utf-8?B?N3lGVDNFY0k4MEIzQVVIS0JkRVBsUmFzaGM4ZGdJcURvY0ZsUlI1TGRYUlJR?=
 =?utf-8?B?SFEzV3ZiVkR6di9YbUxPMFR2eTdEWERybGdwdXRCYWNycHRuTnFYd1pTbW9s?=
 =?utf-8?B?Zlc4eWR0ZkZpMzBaTXZtcEZHbjhIcEk3ZURJeVlXU3hOYzNIVm52bmVnTFE3?=
 =?utf-8?B?dEJFblhjTHROa3BEUm1RTHZvdVNvMzFTYmo5blp1MWw2bkc3SU9oZXdicU85?=
 =?utf-8?Q?sKY4+tDms/qPIiEzBHn6weOHeckotWe+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Y3Y0dTNEZ6TGhQSG1NUDdsSUEyZGZBd3l0VUt5MWgyeHNNbnUzOGVPVERM?=
 =?utf-8?B?YlBGeWZoT1ZTSXE4cjRTZ3FabnhmbUdTYk0vSnFKUS9yYkVSRHVwTHY5VWtQ?=
 =?utf-8?B?TGJiM00wcit1SjM5V0ZnOXJLdTh6SkpwcHFkcFNid2x3WHZaT3NMZXBKTVlH?=
 =?utf-8?B?ZVE4c01NMkVDMHdRaGU2WEJXb0srQ0dBb0JEazR6cmN5dzJ4L2FvVVRUTkRD?=
 =?utf-8?B?TU1vK2dhaVppS0ZEUHNvTjBLOEZPNlJnd1V2cWtVKzN6V2lIR3NObzdpdUF0?=
 =?utf-8?B?d25ROGRWZXEyWmQwQW5DL0NESlJ5WTBGUHY4YWZqRzFqaS9tVjdtMkJVSUVR?=
 =?utf-8?B?N0lZdVlDeFhXVHRmSmhmOE9ycHREWWp5NWlmQVFuN0cyTkRZeE92OWE3bEhF?=
 =?utf-8?B?N294ckJOYlhObVVWKy9yZXRac0xUa1JuSW5HTDc3U1BCWVlVd3Ixd0FTWFYx?=
 =?utf-8?B?OXlBaHZ4cFQ0WC9WeU9yamRtaUhjZ1pYRVVvRWk3c1N2TGV2VXdYL3l3UDY5?=
 =?utf-8?B?U2lDb2RhTzgyWkIzNGhETjNzNVNCV0ZsY1NBTlo3Q2hTWVRFUTNMUzVBWGx4?=
 =?utf-8?B?a0VhNVZIbGI3ZGpaMTc5UExXa2dEN0xPdXR0YjVwQW85UmdXd2FEK0hQRC9q?=
 =?utf-8?B?WWRzQ3BLOUpLbFNkS0NWZ0NtcWhJQ0hDKzBqVEFTSytrcHlTN1Mydkxack84?=
 =?utf-8?B?dVJwNzRIRDBFSCtZR0NoVk9DamVMMmkxM1NKYlZRR1h3Z3pWOXF6cUp5ZVVq?=
 =?utf-8?B?Q2ZPOTBPMWhXYXRoTjJKOE56dFpreXBkTjJleHFHTks4ZGhtdVhMZ3pWeGQw?=
 =?utf-8?B?TFBkbUhNTjRsYWY3SmtxNUtvVWVVRDlRbkpVdE9oRXV6UmxPVzVndFJ3MUZU?=
 =?utf-8?B?c3pIMlBIb0c1bHJHeE1HMlp6ZERWTWVFbWlJNk9peVI5QTYrUXRDQXNPbkJS?=
 =?utf-8?B?QnJnZ0tITzc3ZmlkYVJzekdadFUwY1RzZWQxY0RoTU1GdUI5aEJEWlQ0c2NK?=
 =?utf-8?B?Y2N3a0lqMVJyT2pYZitSNExXVnN5emRKZUovaWJ0UGlOUVV6Y0lYQTNWeUpW?=
 =?utf-8?B?azlxNGYzZmF5ZnQweERSQjg1ejE4UjA0TWhTWUdtRUYwbVR3Z25Sb2VDcVpI?=
 =?utf-8?B?dFFHdEtlVTVTU1BsY2xEZ2lIa2NxdFJoc1pGV1QxY2lEdEhNS3NrNGZHd0dR?=
 =?utf-8?B?Y1c1cmJCU0RMZGduMnl6NFVFalVZQ2t6VTdRZlpYdDg0SHhLNzVES1JHd0pq?=
 =?utf-8?B?NFVydGxZN1RwRlhCUi9rOGU2dE9Xc1E0NmI5TzBNeHU2SGtvay9hZTRvSlQx?=
 =?utf-8?B?UjY3dVBuL1JyRlpCWnlVenhlRThIS2lOVFphdys4ajd5UHJtMUVSblZua3hC?=
 =?utf-8?B?QitDSUg2ek9DdWZCelVPYXFCSGFidzVxOWIzbUZ3UGh4YXhyMGlsMWhjNm9S?=
 =?utf-8?B?K2V1d0x6SUpweVRXbXF1b2w3aVM1b3o5VEEzVGpJa2I3SzRsZENxbW1BdTVN?=
 =?utf-8?B?TmZINkQ4SEEzRzYxeGx2RGlZY0thOFc0UmJYZ1dqMTEvcXkzTEtqZkxnUEp0?=
 =?utf-8?B?L1NJSlYwZmpIem8yQXRVZFVTTFlmUnJ0ZW5OcFVUdVA5QzJGLzhGaFZ4UXoz?=
 =?utf-8?B?SjUrWmF0N0ZnemNjOHV6WHFycERoZ1BVdXZVRUY0OWl4TERJYlhUei9WSTFM?=
 =?utf-8?B?d3lzUHBKWUdjaXJlSllROUxsSllyaEYxT3V5RDFZVzl2ZUcwZFh2RjMvZHky?=
 =?utf-8?B?VzFLVzE0RlZQWldUUndyMitoY1hTQWpsWTZxYjBhNnVJMjBZaW40YU8wTnJK?=
 =?utf-8?B?MnY2VGlWYS9KWU9wNmVJQ0Y4cnREK0dhK1hsN0hBVnI0aWFRMFhuMW1vRkFj?=
 =?utf-8?B?MkxuT3pxQnlKRmpQcHIvRVZsR01XWHhGTU9IR0NaL3dac0ZnYktzRmQ1Q1o1?=
 =?utf-8?B?Rk1rQXFZMVJTQzdUZndZUHdXREJEcm4wbTQyUmY5TXFkQUpqeVBsS0pQK2xD?=
 =?utf-8?B?TitDK09DKzQ4QlpCZUViSk5jVmI1SDlQeFNYdHBMNkhmaGtqc3lVTm5FMnRu?=
 =?utf-8?B?UUc1bitVZlFzSzdiSlhiTXduOGYzVkV4b0tQZ0pZMEtXYTRjYW84aVJzbVNv?=
 =?utf-8?B?NWdvYk5ucEFwMTJ3dVBDRnVYRXBaUk5nRkE2cXNxM1dMb01DdVdjVGVoMUpF?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efe870e5-669b-4190-fdf8-08de22dde789
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:56:00.2076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQgYuj97T8139dtdrm+qh0PxLhj9swk19lWn6ajMrtwW/lYHfMS2anTRE41yUtDph3izjaG3V98VXpCGxCZdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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

Quoting Matt Roper (2025-11-10 20:20:43-03:00)
>Switch the GGTT code to scope-based runtime PM for consistency with
>other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 20d226d90c50..5e1cd18ec611 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -385,9 +385,8 @@ static void ggtt_node_remove_work_func(struct work_str=
uct *work)
>                                                  delayed_removal_work);
>         struct xe_device *xe =3D tile_to_xe(node->ggtt->tile);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ggtt_node_remove(node);
>-        xe_pm_runtime_put(xe);
> }
>=20
> /**
>--=20
>2.51.1
>
