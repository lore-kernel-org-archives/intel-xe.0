Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E5DC02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 19:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF6810E7DC;
	Wed, 15 Jan 2025 19:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTlDhZWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763A10E0B8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736970134; x=1768506134;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MmOQ646L+wf5M/Ym6aguQ7TGdmkFx1G5o0WlR+MN5Z8=;
 b=WTlDhZWtVQXQQA+tzUC8Y/6PHv+o48fJR3gV967uBt2ljozhyXaVFc6L
 XRJrymDp9jq/ZJ54mTzVZzlMMJ7wZLGfmGmOaceUn4yd9fJBWZfRMyZtw
 Z1V9eReVH22WISSse4xgeoJ+g9BupGahMLxcfovklOd3inrxFpt+LXDC1
 YvsNrF0p4GZY7DDhqw4NsYcf3tPPbTfxl1yrIHgZssRP0jXJu52D9wifv
 vKXkKX9baPMTFHHJt0hlOHMscVXzvJNoamjBc2zz3Mldo1DRhIOGV3lnS
 2IDVA2/6wYdY1OW8moiYvvAMaN63+GFoNBai3aEmojL+uboxPF9ovo+O/ w==;
X-CSE-ConnectionGUID: 0RoJ01GDTxKXUUDbBEUZGw==
X-CSE-MsgGUID: AYnwW0sySBqrHfb5mxl43A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48326304"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="48326304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 11:42:13 -0800
X-CSE-ConnectionGUID: bQUVl20AQZWKbpPceuJE4Q==
X-CSE-MsgGUID: pJr03rCySPykOuQsTi3mCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105014740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 11:42:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 11:42:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 11:42:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 11:42:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSP1iWv+twayaLbSZUpaS7mhQYqT1eqfIZPZks1f2QgujWF5qyh0HfFfG/QuYBcreChgN3wBeRyqxx3+C5WOQ4dQz1UW+GylXyUAr6qeV/eD2XVLSXvTueKW3RE59+9LoGT9VNBJ7w5bOJjPkEsCFv5JXkoBOGSBrAdT0duB5v6InUqdN7d6hndp7g/HUtjOvRMUKsn19wiLqd8AbHno4EcDIoFL3B9CFDeKdXwHBRSz79RXB8dw24Co5AxudJCbr0P33QHz9BxQeGjouXOU9r5qtxoiJowymmG83cpwhVrPb6q5dWe7YMuBNo2hYifuK6Z3MkgNGX3p7+Egg3/Lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOwfWEYg5Z+EzRn6vfajGcBoAVqCpKu+o48h5Zr1Nkg=;
 b=gpRH3O8JfseEYfDGjdwVNCPSNXC+rou1DLr4pfbtSiShMsulq+Qbfc+c6Fck2g28Soo6iiXMjXPxmD7ogv31nBODuSJOC90AVhaDEmhJmMfeAosB4GdR9lklMHipDFqfob8CPCmbPaYrNDZ6Xy2LAjTvBcZz3m/JshdH5NbiuCtOrvgLl4+4viPJINkP+5G7e7LD18TQCs4u8MKIcQ5upyABPlUkkA8mpLHMB+YFrUkWR8axAJVNpq4GjIgILgcEsmICnIV9m3Sn7Eb1uVDqPIPqAIKWeCV1nouxugIym+zndGhJCiLA3wQILeBH60/q4J88mBOCSXuhM76stkyf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 19:42:09 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 19:42:09 +0000
Date: Wed, 15 Jan 2025 14:42:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z4gPjdxODiIq0pZt@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-2-riana.tauro@intel.com>
 <Z4E7DB6pbb11QDWT@intel.com>
 <bfb3420c-dc1b-4947-bfa7-2d60d6bce2db@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfb3420c-dc1b-4947-bfa7-2d60d6bce2db@intel.com>
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdf1918-dd10-40bc-0479-08dd359cb2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEgxZ3FZVi9JTGs5N0VwcGgzZmkxSUlXTitmVFgxdEVVdUQrelhlL25YK0JH?=
 =?utf-8?B?bnlTaFhJNXEzMWdXUGoxak5vVlhBWjJETW82T0k3SU9SdFIzRlRGbWlobllK?=
 =?utf-8?B?TXJKT244RHJjdjVoR1pEZkUvM2xWc2pJTU9nMjJLSnBjZWtDNUVJZks4K2ZP?=
 =?utf-8?B?OVorZzFEWVhvbzlBaDlleXgzTUpGbUN0U0pzSFlDZ0JCZU8rT2lVVjZOeUpu?=
 =?utf-8?B?YnJ0SjhEdzBIYnpuMlNad2Voc1F2azlZYXA4eUVwREhuc3JNcmtaYW96Ly82?=
 =?utf-8?B?YVdTUmN2cE14Syt2TzlOQ04vWW44WG1BR0VXOWNqWEsxVFZYWVdJbGtqK3hu?=
 =?utf-8?B?dlB0TVZZZGNibGsyVVhwRVVmek5OY25KN2o4aG82STVFUnlteUpNWlpZY21h?=
 =?utf-8?B?WUtSK0g2M1MyL0FrL3RZdEdJbStyUUUxYWdkS1JDNUYyamdnQ2xnMHV5R1Q5?=
 =?utf-8?B?b2lxbEJuY08yTzVlbHByNStpeUNnUmR0eEN4a1VTbWJZMGw5d01Ja3VRTWdB?=
 =?utf-8?B?MTJkMXo4L21qY2hLOFBCeGhsUUYxVXlCUnFQTEhKZTVqL3B3V1A3WGtxNE9n?=
 =?utf-8?B?azlSYnR2bjllVDUySXRpZ0pPdHNaZEZCeTRxNnRrV05kaFBkT1FVbWJYbStH?=
 =?utf-8?B?Qi90c0E4QitBOERWcTdMcjZmckRyeWJCY05qdFRQaHYrVXQwSGJsck1TTE5Q?=
 =?utf-8?B?Zm91UGwwamsrNkV1N21xRkV6bnlRZFVLVGUralNFb3hDdVpuQTFlZ1llc3M4?=
 =?utf-8?B?ZXhvMXA5eVorZDdueElHVzJSK3h4dkE4Q2RuQ3ErdU5UVk96MzNtSFZBVHdT?=
 =?utf-8?B?SldtOHluOXlLODdjV29wTitWNGZPTkVoQmVaWHNoNEdLNTBOQkhZeHFDYWQ5?=
 =?utf-8?B?Z2xsbjJZaStTZU1QMDFrQVlrYlZLNVRQVURmL1lMVTlJT0VYQjNXMXFQOFRB?=
 =?utf-8?B?NXM4Szk0NGV6SVVvWmlmdGJwMUJaUElPcUxTanJ1bFNKaXdSZkh3ZURNOFFF?=
 =?utf-8?B?YU1TMmsxdTBtZ3RoSFRHM1BrZzcrSFd6UUlUZDA2elRKejF0RkpGdXhNS05R?=
 =?utf-8?B?OGRoTVRaSURkU3Q2NjE3UWpFWjhXNysvemhvK1FqQ2o0d0ZWUlRZWXhpQVha?=
 =?utf-8?B?Ri9mL29FVWZGY0FUTHEyVjlSdVdXNytZY0NPcXJHTHJmYVhGZ3J4RkMzVXQz?=
 =?utf-8?B?RnMzY1RGbyszWWJKM0l4R3gwU1ZRS21pczJKQWxWOGw1R09uWUJlUFRITXJK?=
 =?utf-8?B?UmxFZU5seEp5OUQxL3ZFZFcrRENIUEo1MlhEOGNKQ0ZYT1RPSEZYaGRJclUv?=
 =?utf-8?B?WTk4L21ockVLRWxWbnZsTENydmEwRU9oYUdPWHMrNDBwUXZ0bjNBWm9EQjVq?=
 =?utf-8?B?emU4MElsRmNnQWhjTHZ5bVB6dEZRTnRwUVZhazZoZVdrU2V5QjJzVFBHRDRk?=
 =?utf-8?B?U2E1SlFtV0RodkpITng0MGlMSjhreWdmZHMyQXBEMEZCdFRvVTNGVi9ZQTBB?=
 =?utf-8?B?Ty93a05GUFRHUDVBN3hLbUY5L3VUZGFsNUExb2RiOXVXZTFTZUVHRUtUSDAz?=
 =?utf-8?B?K1lUUElPSEdLVDE5Rk5xVWlFMi94bmxsVTJ1SkRjOXJsQ2VObHp4b3VMekk5?=
 =?utf-8?B?eFpwVm9OY00vSFBhLzJGR0dYVWpYUGFVaWdHVDh1bmxQelJsUWZVaFh2TUZz?=
 =?utf-8?B?VlY1L1ZaNWxnVmxuM3A3VnJsZ2tVWnhaeStwcEZCNlZ6V3hqVTk3YmdsQkhj?=
 =?utf-8?B?K29vT3UzQXR3UXRyRXlwUUdzdGEzZjJIcDNhdk1ZdUJ4d2k0eGwvODl2V2t2?=
 =?utf-8?B?N3cwTHQvbm1JcUVJOGJBUktaZ1BYdFlnc1A1bVpZZHZnazFRR3NTLzljb3A3?=
 =?utf-8?Q?gz57Fp8lSdQOR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXJHdnMva1JuZmVrWktQSzJYQTlSRyt2UUN6YW15cXVBaG95NzB3MThlNTZJ?=
 =?utf-8?B?bzN2T1MwZFhnZWRraVVjQU5XUXo1L3k3bDNrc0RlVFh1RnZ6ZzQwZTlTeWRF?=
 =?utf-8?B?MVd4M3FCY2U1SXEwQ081UGMyOE1BWm9iNnc1cWhjRjBJODk3ZVRCUW83dytL?=
 =?utf-8?B?UGU4MmQrT1JXby8vN09BQ2dBcmlJc1BnemhLSUlZeEw1SU92T0FXeWMyRW10?=
 =?utf-8?B?YjNMRWRpRDlCZVJLZjBBbFdyaXU5NXRMa3JLTFppb2RJM0Urc1I1Z0h2S0l3?=
 =?utf-8?B?WlB2L1N1V2N4bmgxQ2w4U2lPYUh3LyszTFpkRzZidnZEd0lheE9Ba1hxayts?=
 =?utf-8?B?MmtVQ3pVR202cC9QVXB5bFUxOGZMa0NrSnI1aEVqZW94aUNLWFJuNEI3alQ0?=
 =?utf-8?B?Vm8xQXhMU3pXK1l4Zkt5VkdlMGxsNXdERXNNRmg3bGRpNjJGV2lydnpQSXBj?=
 =?utf-8?B?M1pJY1lFdkZZNnpvVEp4SjhHQ3NEdGRtTEkxdXVRMXdJSE5qZ0p5dll3M1JQ?=
 =?utf-8?B?eFNYa0x4REQ4ZW1XdmZUME5BZmJ2cHlHMzlSWnMrK1gyYnFSbEQ3YmFKSXpN?=
 =?utf-8?B?RnpaazZYcElSQlZzNlVuNUl4YnJLYU1JOFY5cE9HZUMwRGpDdG5ZY25GSDFS?=
 =?utf-8?B?VXYzZTkvaXhOMGV4OVZLbTNyazlUQm91YjZoME9PM1VRNGFydUdJZXhHUk40?=
 =?utf-8?B?YXdSMG1NYWVzSzhkVkJJdXIvQXhqazR2bnBXSEl6T3lSREpRNDlsRHFRMHJr?=
 =?utf-8?B?Y1BrRkMrcHJOZklNVUZTRGU2OUFmVUNCbWlET2ptM2xHa3N3YWhuSGwxVnBu?=
 =?utf-8?B?RzRxK3gzWXFaYWFUSkZaRDEydlU3NWtVdEVvZSswT0VUUENkelYxZjY1TjJE?=
 =?utf-8?B?ZkF1ZVplV2lSL3ZhMTQ4NkkraFJ6cFB0dEVOOE8rYmhIRnpGUVp1YUhFTlBa?=
 =?utf-8?B?Z2g5OWlKVENoVjNYdFNNdXkwV25saEVQSEFxTlkva2NuTGRESitRT0NuNy96?=
 =?utf-8?B?UTZ6RDljUDZ0ZFVwSit5UWVWTi9jVjBKVk5Canl3ZjcxVFVYNVZsNnNuUTZw?=
 =?utf-8?B?bmZpOXRXSndqM3NDcVJ0MEw1bEl3c0JNTzBCL0Q5ZUdXbDZDUytxeC94OW53?=
 =?utf-8?B?eXJvNE1kdVlMSXhvL25PMlp5NGYvMHJOSnZzWEVyUTlXeWdkWndzZ2ZZckND?=
 =?utf-8?B?ek5UVDQ2UVM3MnBheHRxeHRVRzQ0ZVBWd1hoQ21FdGJZWXBQTmNNTlRKZkRt?=
 =?utf-8?B?M1ptbVRIUzY3alhoM253RGJ2VkJmSWVIb2R2WkY2M05KT3UwWjFZUUZmNHRh?=
 =?utf-8?B?QnRndjByWG9OamdCaTY2QVZGMTF6ZWJtUS9lb2dpN3RQRHhzNGNkZWtncHI3?=
 =?utf-8?B?M2JjNnBnMTY3VFhqWVRkdjhyYnFFYTZ3dW5Oa0NqOE5zNDFOMW9oVnVkUHVl?=
 =?utf-8?B?aXp3UlJ3ZFlIdUQvaFY3SE9SWkxjTkVwN3ZHcG4reHdmYkU5L0ZSdTlDeEhE?=
 =?utf-8?B?VUhRcEdjaENlcDFzZDQrYnFQMG8wZFEzRzFEK0c5dFhOUnRLclF1a1UvR0Z0?=
 =?utf-8?B?NHZtVGMzWnY2RWdXMWM4U0xyMjNZaWJKTk83K242a2R5dGFiVjROenFEMzJ1?=
 =?utf-8?B?Q25jbTZmU1MwaHozR1BZRHRHNzRic0VvdUg0cWVndkVMYlRuNW4xdmJoWnJZ?=
 =?utf-8?B?U2M2VkVNL3Z6WlFjUURWTTlTUTQ4Q0JtS3ArcDdEbUJlODFsMzE0NWJrNnFx?=
 =?utf-8?B?clUyL1BzblhjeGQwWVk3ek0xV0RKajBaRlBUTWxqNW5vUUo3Qm80VlJFTzFJ?=
 =?utf-8?B?Q25Rb3Job2podnVNUnVvYVU1cUE1VkZFNldBU2R1MXFDcTJGSnZvRytoU0hk?=
 =?utf-8?B?dS85dzl3S0NKWnBJbURBQXkxV0FUenJjOXpnLzVEeHBRRUhaazRlclBic1dq?=
 =?utf-8?B?Q0NFVFNFeUZHZWdDTHd3U1h3SUVqUlRJQnF2WjJXMXBoNWQ5Nys4TWRhVlN3?=
 =?utf-8?B?SG5YdjdjTU5Jc2xXN2FkVGJERWFDSGwwaVZUZlgxczlYMEdRSjd1aTlRSVZJ?=
 =?utf-8?B?L2VTQXdkWDEzTG1TRmdIL2JidVoramxFd0Q2RjgzcTk4N0VsUUk5L2h5aVIv?=
 =?utf-8?B?ZU96aXV1YmVSNCt6dmJCZWhKcFBwblJUSzZYNDlyMFU2SzRheGV6UHVKVUd4?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdf1918-dd10-40bc-0479-08dd359cb2fd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:42:09.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BKOJU7yRav99PfJwRLYA7WEAP48MlYLBs6Xx9NpPzBvbIUrASFDl4gijHEeBD4ziwjYLIZQaJarc6Wa9Nwayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
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

On Wed, Jan 15, 2025 at 09:47:53PM +0530, Riana Tauro wrote:
> Hi Rodrigo
> 
> On 1/10/2025 8:51 PM, Rodrigo Vivi wrote:
> > On Wed, Jan 08, 2025 at 04:09:57PM +0530, Riana Tauro wrote:
> > > Boot Survivability is a software based workflow for recovering a system
> > > in a failed boot state. Here system recoverability is concerned with
> > > recovering the firmware responsible for boot.
> > > 
> > > This is implemented by loading the driver with bare minimum (no drm card)
> > > to allow the firmware to be flashed through mei-gsc and collect telemetry.
> > > The driver's probe flow is modified such that it enters survivability mode
> > > when pcode initialization is incomplete and boot status denotes a failure.
> > > In this mode, drm card is not exposed and presence of survivability_mode
> > > entry in PCI sysfs  is used to indicate survivability mode and
> > > provide additional information required for debug
> > > 
> > > This patch adds initialization functions and exposes admin
> > > readable sysfs entries
> > > 
> > > The new sysfs will have the below layout
> > > 
> > > 	/sys/bus/.../bdf
> > >               	     ├── survivability_mode
> > > 
> > > v2: reorder headers
> > >      fix doc
> > >      remove survivability info and use mode to display information
> > >      use separate function for logging survivability information
> > >      for critical error (Rodrigo)
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile                   |   1 +
> > >   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> > >   drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
> > >   drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
> > >   .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
> > >   6 files changed, 302 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 5c97ad6ed738..fb1cb98ce891 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > >   	xe_sa.o \
> > >   	xe_sched_job.o \
> > >   	xe_step.o \
> > > +	xe_survivability_mode.o \
> > >   	xe_sync.o \
> > >   	xe_tile.o \
> > >   	xe_tile_sysfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 8a7b15972413..0f5a052150c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -21,6 +21,7 @@
> > >   #include "xe_pt_types.h"
> > >   #include "xe_sriov_types.h"
> > >   #include "xe_step_types.h"
> > > +#include "xe_survivability_mode_types.h"
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >   #define TEST_VM_OPS_ERROR
> > > @@ -341,6 +342,9 @@ struct xe_device {
> > >   		u8 skip_pcode:1;
> > >   	} info;
> > > +	/** @survivability: survivability information for device */
> > > +	struct xe_survivability survivability;
> > > +
> > >   	/** @irq: device interrupt state */
> > >   	struct {
> > >   		/** @irq.lock: lock for processing irq's on this device */
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index f153ce96f69a..4e373b8199ca 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -49,6 +49,20 @@
> > >   /* Domain IDs (param2) */
> > >   #define     PCODE_MBOX_DOMAIN_HBM		0x2
> > > +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> > > +/* PCODE_SCRATCH0 */
> > > +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > > +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > > +#define   HISTORY_TRACKING		REG_BIT(11)
> > > +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> > > +#define   AUXINFO_SUPPORT		REG_BIT(9)
> > > +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> > > +#define      CRITICAL_FAILURE		4
> > > +#define      NON_CRITICAL_FAILURE	7
> > > +
> > > +/* Auxillary info bits */
> > > +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> > > +
> > >   struct pcode_err_decode {
> > >   	int errno;
> > >   	const char *str;
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > new file mode 100644
> > > index 000000000000..077422ae009d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > @@ -0,0 +1,231 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_survivability_mode.h"
> > > +#include "xe_survivability_mode_types.h"
> > > +
> > > +#include <drm/drm_managed.h>
> > > +#include <linux/kobject.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#include "xe_device.h"
> > > +#include "xe_gt.h"
> > > +#include "xe_mmio.h"
> > > +#include "xe_pcode_api.h"
> > > +
> > > +#define MAX_SCRATCH_MMIO 8
> > > +
> > > +/**
> > > + * DOC: Xe Boot Survivability
> > > + *
> > > + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> > > + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> > > + *
> > > + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> > > + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> > > + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> > > + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
> > > + * survivability mode and provides additional information required for debug
> > > + *
> > > + * KMD exposes below admin-only readable sysfs in survivability mode
> > > + *
> > > + * device/survivability_mode: The presence of this file indicates that the card is in survivability
> > > + *			      mode. Also, provides additional information on why the driver entered
> > > + *			      survivability mode.
> > > + *
> > > + *			      Capability Information - Provides boot status
> > > + *			      Postcode Information   - Provides information about the failure
> > > + *			      Overflow Information   - Provides history of previous failures
> > > + *			      Auxillary Information  - Certain failures may have information in
> > > + *						       addition to postcode information
> > > + */
> > > +
> > > +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> > > +				   int id, char *name)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	strscpy(info[id].name, name, sizeof(info[id].name));
> > > +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> > > +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> > > +}
> > > +
> > > +static int populate_survivability_info(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info = survivability->info;
> > > +	u32 capability_info;
> > > +	int id = 0;
> > > +
> > > +	set_survivability_info(xe, info, id, "Capability Info");
> > > +	capability_info = info[id].value;
> > > +
> > > +	if (capability_info & HISTORY_TRACKING) {
> > > +		id++;
> > > +		set_survivability_info(xe, info, id, "Postcode Info");
> > > +
> > > +		if (capability_info & OVERFLOW_SUPPORT) {
> > > +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> > > +			/* ID should be within MAX_SCRATCH_MMIO */
> > > +			if (id >= MAX_SCRATCH_MMIO)
> > > +				return -EINVAL;
> > > +			set_survivability_info(xe, info, id, "Overflow Info");
> > > +		}
> > > +	}
> > > +
> > > +	if (capability_info & AUXINFO_SUPPORT) {
> > > +		u32 aux_info;
> > > +		int index = 0;
> > > +		char name[NAME_MAX];
> > > +
> > > +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> > > +		if (id >= MAX_SCRATCH_MMIO)
> > > +			return -EINVAL;
> > > +
> > > +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> > > +		set_survivability_info(xe, info, id, name);
> > > +		aux_info = info[id].value;
> > > +
> > > +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> > > +		       (id < MAX_SCRATCH_MMIO)) {
> > 
> > This is a clear case where 'for' is better. But also, generally here we
> > try to limit while usages...
> This is similar to linked list with the address of prev aux registers in the
> AUXINFO_HISTORY_OFFSET. So used while.
> 
> Using for would be like below
> 
> for (id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info);
>      aux_info && id < MAX_SCRATCH_MMIO; id
> =REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info))

I believe the right way is something like:

if (capability_info & AUXINFO_SUPPORT) {
//you could move all declarations to upper scope, or move this to a separate function

	id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
	if (id >= MAX_SCRATCH_MMIO)
		return -EINVAL;

	snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
	set_survivability_info(xe, info, id, name);

	for (index = 1, aux_info = info[id].value;
    	     aux_info && && id < MAX_SCRATCH_MMIO;
    	     aux_info = info[id].value,
    	     id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info),
    	     index++) {
	    	     snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
	     	     set_survivability_info(xe, info, id, name);
	}
}

> 
> Isn't while better?

just by removing the duplication of aux_info = info[id].value
and by making it clear what is the start, what is the condition and what
is the iteration fields, I do believe 'for' is better than while...

> > 
> > > +			index++;
> > > +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> > > +			set_survivability_info(xe, info, id, name);
> > > +			aux_info = info[id].value;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void log_survivability_info(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info = survivability->info;
> > > +	int id;
> > > +
> > > +	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
> > > +		 survivability->boot_status);
> > 
> > hmm, since we are avoiding the drm, should we really use drm variants here?
> > or the pci/dev ones?!
> 
> drm variants use the dev ones and prints the prefix if drm is not null.
> Will change the drm_info in this file  but the logs in mei and vsec
> initialization would have to be retained.

ack

> > 
> > > +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> > > +		if (info[id].reg)
> > > +			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> > > +				 info[id].reg, info[id].value);
> > > +	}
> > > +}
> > > +
> > > +static ssize_t survivability_mode_show(struct device *dev,
> > > +				       struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info = survivability->info;
> > > +	int index = 0, count = 0;
> > > +
> > > +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> > > +		if (info[index].reg)
> > > +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> > > +					       info[index].reg, info[index].value);
> > > +	}
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> > > +
> > > +static void enable_survivability_mode(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct device *dev = xe->drm.dev;
> > 
> > do we really have this pointer valid at this point?!
> This is allocated in xe_device_create. Registration is done later in
> xe_device_probe so the prints and xe->drm.dev will be valid

cool then, thanks for the confirmation

> 
> Thanks
> Riana
> > 
> > > +	int ret = 0;
> > > +
> > > +	/* set survivability mode */
> > > +	survivability->mode = true;
> > > +	drm_info(&xe->drm, "In Survivability Mode\n");
> > 
> > same here...
> > 
> > > +
> > > +	/* create survivability mode sysfs */
> > > +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> > > +	if (ret) {
> > > +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> > > +		return;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * xe_survivability_mode_required- checks if survivability mode is required
> > > + * @xe: xe device instance
> > > + *
> > > + * This function reads the boot status of Pcode capability register
> > > + *
> > > + * Return: true if boot status indicates failure, false otherwise
> > > + */
> > > +bool xe_survivability_mode_required(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +	u32 data;
> > > +
> > > +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> > > +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> > > +
> > > +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> > > +		survivability->boot_status == CRITICAL_FAILURE);
> > > +}
> > > +
> > > +/**
> > > + * xe_survivability_mode_remove - remove survivability mode
> > > + * @xe: xe device instance
> > > + *
> > > + * clean up sysfs entries of survivability mode
> > > + */
> > > +void xe_survivability_mode_remove(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +
> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
> > > +	kfree(survivability->info);
> > > +	pci_set_drvdata(pdev, NULL);
> > > +}
> > > +
> > > +/**
> > > + * xe_survivability_mode_init - Initialize the survivability mode
> > > + * @xe: xe device instance
> > > + *
> > > + * Initializes the sysfs and required actions to enter survivability mode
> > > + */
> > > +void xe_survivability_mode_init(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info;
> > > +	int ret = 0;
> > > +
> > > +	survivability->size = MAX_SCRATCH_MMIO;
> > > +
> > > +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> > > +	if (!info) {
> > > +		ret = -ENOMEM;
> > > +		goto err;
> > > +	}
> > > +
> > > +	survivability->info = info;
> > > +
> > > +	ret = populate_survivability_info(xe);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	/* Only log debug information and exit if it is a critical failure */
> > > +	if (survivability->boot_status == CRITICAL_FAILURE) {
> > > +		log_survivability_info(xe);
> > > +		kfree(survivability->info);
> > > +		return;
> > > +	}
> > > +
> > > +	enable_survivability_mode(xe);
> > > +err:
> > > +	if (ret)
> > > +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> > 
> > same...
> > 
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > new file mode 100644
> > > index 000000000000..410e3ee5f5d1
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_SURVIVABILITY_MODE_H_
> > > +#define _XE_SURVIVABILITY_MODE_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_device;
> > > +
> > > +void xe_survivability_mode_init(struct xe_device *xe);
> > > +void xe_survivability_mode_remove(struct xe_device *xe);
> > > +bool xe_survivability_mode_required(struct xe_device *xe);
> > > +
> > > +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > new file mode 100644
> > > index 000000000000..19d433e253df
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > @@ -0,0 +1,35 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> > > +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> > > +
> > > +#include <linux/limits.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_survivability_info {
> > > +	char name[NAME_MAX];
> > > +	u32 reg;
> > > +	u32 value;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_survivability: Contains survivability mode information
> > > + */
> > > +struct xe_survivability {
> > > +	/** @info: struct that holds survivability info from scratch registers */
> > > +	struct xe_survivability_info *info;
> > > +
> > > +	/** @size: number of scratch registers */
> > > +	u32 size;
> > > +
> > > +	/** @boot_status: indicates critical/non critical boot failure */
> > > +	u8 boot_status;
> > > +
> > > +	/** @mode: boolean to indicate survivability mode */
> > > +	bool mode;
> > > +};
> > > +
> > 
> > I believe the only blocker is the while-vs-for loop. I believe the 'drm'
> > could be avoided, but not a big deal if it is really working...
> > 
> > > +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > -- 
> > > 2.47.1
> > > 
> 
