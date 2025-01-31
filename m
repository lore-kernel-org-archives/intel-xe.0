Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E3BC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16C410E226;
	Fri, 31 Jan 2025 22:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FctfgN0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD34510E226
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738364370; x=1769900370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v2X7OBXuMIgocNJUxkXpznDvu8poogY0zediNKGSPEE=;
 b=FctfgN0CxsMhex6cUfW6KtvzRqi1tHxgp0Vb4J0fdRTQzWx5kAysn2eL
 C0MkC8pTfF/CIduZ4Hy1ji5xmLYyiS2fP2nwQryV+WBBIbC09VYL4jqpP
 o7e4/mGYU11kpVDF2GcA3w6dElsaHFCNrpl1J4stOxBJQHfejx9FR25Tc
 TERHLWgW8R2fge9sF/aB8FDTBbbhm4V5d17L0NCWDrpPUl8jxrqfNe3+X
 FqwPBEiX3HiBcyCSpTt+BztqW1zmb8GAdE/1QHkByE6QGDDXMqgplcafo
 xFWwBueCIQaF7LUwG1fX4De+za0CQUaHFvEkBeoORVnMy/0IUaKMLfR+f A==;
X-CSE-ConnectionGUID: DsuoqxcbTJSF5HXY62BA7A==
X-CSE-MsgGUID: E6G6OUWhQWKk3Ps+Fnzg0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38177975"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38177975"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:59:28 -0800
X-CSE-ConnectionGUID: a9ccnIggR/2vZisdpJc4Qg==
X-CSE-MsgGUID: Pk+0DWepQM2vzmqZy6ia1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113773242"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 14:59:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 14:59:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 14:59:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 14:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5UeVCkeeLC+qPora48Q1eBQ9DzFiiTulaxW375JNcZ5pMkI6auVpKETwYCjVakdzGYiC7U9N+gH+6C020RBKC3i+L96MLMZChZwQI4Ovw4Xgt+He/Yss9VoHVDiihvxbxvyGOkkU+P7sQWAEs3lhQmBdTw0B9PZ5M8Buq6tNGNi6paPgu8pWCBE9ZXyG4nkLsZ25cV8UxPKAIVEIT7dK9gf0PuCSVQaT0N2dkgBxXMmxSBN29FmqKxS+B6cg5q7CgBNiUA03EM8aYuFk/0KpNonQEbb2g8JwdT6McC5WhnQZVEqSMMnLSCDeUFqGjQNpoWzdrYk008jC3eHl9OaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcOnOZZdH2cE6H1ITP3FV5tVN7Vh2gJCA+OwdLvu1F4=;
 b=vBCuj7laKv+hDu9/buc8LfMdc4lYa05ZaGPMVoZW78vHe4iK9sXMdpCoPEfi3XZqFPyhcuUKXYpFUO8twJFD4kH1zJymzxGy6cKLoLkU9hFBBXyrzAi0HL9mje6TNVqntTaZJglBo7R7BRy1CeIeATxXVFfvBl0ERSzpVCSd5zWKCROPNVPX0rHl7EqjUATe8SkQbXxtMTPDH9QzChqId0kIiSl619LIhA2fM0YpI8Br0SOVXVD1Ac2TFMxU4sIFHZqybAOaC6vRiizmfAtShQKqGdU/aAR/7nEm2ZMEkwsys3pr8/FIZo2uj7+pnKAUGrU7VE2p0zF35ZH1ojqsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 22:59:19 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 22:59:19 +0000
Date: Fri, 31 Jan 2025 14:59:16 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/7] drm/xe/eustall: Return -EIO error from read() if
 HW drops data
Message-ID: <Z51VxJa6KjavSAol@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <9dc0f747ae215f9704fe1edec2e7007e19f8dd0b.1736970203.git.harish.chegondi@intel.com>
 <857c6cgb94.wl-ashutosh.dixit@intel.com>
 <Z50ku-fhUr3ip6lz@intel.com>
 <85wmeaenx9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85wmeaenx9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 529b2e03-729d-4da6-911b-08dd424ae505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkFJMXRHMVhuM09IMndCT3R0V2FGRmxxbGlsa29KbDkvREpIK0RFaWNaWkR2?=
 =?utf-8?B?OE9kK0I4QkcyQWJLcG80L1FNek9WMXJHbmNLSzNsTHpUODNSMXBhZ2lTeUxB?=
 =?utf-8?B?VlBaWWhMbTJZY1hlRjltWlE4R2FxZmtNZDFHcVJWWkNLK2NoL2k1ZVJHTkc1?=
 =?utf-8?B?THI5bjkyM3dnMXZDMHZxRmNXVmFicUh4a0lPMGJwQkZnU1YzY1NoUE1ndTU1?=
 =?utf-8?B?dWg4QmRraThQU0VzT3NXZUpKbGtOb0dsdWlDSjZjY1lTeUpCbDJxRFZ3MWhG?=
 =?utf-8?B?S0JRYm5nM3dpWGN4enlZVUNiODhFQm5qRGZSZzZrTERFUmFGZ1RLWGErdjJO?=
 =?utf-8?B?NTBtUXhvNm50MmxWMTBMcGNVVVk3TWN2YVRtK3hrN2pXQmdvTXY3cmg4VVh1?=
 =?utf-8?B?clNIOGVJM01rWW5qQXNRdHhIYXVRaU9Hak44MXgvVEZxdEphTDNwVkhRdnBB?=
 =?utf-8?B?YVZ6MDRqOVFyM2YzaVhLRjV1VE8veno3QjRUcTdycHgyUloxNHRTcFlLUVhN?=
 =?utf-8?B?cTdXcVNSYzNzQnozWWlNK0N2RW1rMGpQMVk3TUlkSXRMUHZLZU9GS0pqdVkv?=
 =?utf-8?B?VjMvVVd6YXJDRDlBRndWbTYxZzJoRVIzeWk4ejBvUGZEekFtamRpN05vQkl3?=
 =?utf-8?B?UkVZSnlyT3ZqM2FEOG1FdTV2dW03NlQzQ0pGMStqb2tmM1pZT0FNRjRQU0hP?=
 =?utf-8?B?YWE3MVplUGRzOTlrL05vdzR5cStOT1c2bGFaaDh0VnF4dU93UDhHNXdmRHpo?=
 =?utf-8?B?aUIySThRUndJRzNoRGR0bllNTTJadmZIY21mck1CSEEvSDJMTE9sV1BJenVt?=
 =?utf-8?B?eDJaM2h5RHJ5eUE2MzRHZ0M4M01NUDJBSCtwL2Vta0dKVGMvU2FTck56bldX?=
 =?utf-8?B?OVdVZW9wbGl0MDRRU1RHSHdka0drYTc1YlA0MmZnR2doVEh3a3I0bE5KT1cv?=
 =?utf-8?B?YmVtd0c3cDNKMll0UDVtQ05zZWNyV1lxSmZvRWREQjl2dXJkcWRET1NwYS92?=
 =?utf-8?B?cllJN09FYk1nQWt6WUljWUNOSDhLKytpMmVJVWNvUnowMmhjMUFUZkFJUWV0?=
 =?utf-8?B?aVdRclhSRDBWYzAwaC9rOForT3Q3TDNkUUxEY0IyNUxaZ0tQY3pXU2dJUk1M?=
 =?utf-8?B?VVRpTnFNMzhGVFNzQy9ISC85ei9jT2pPUXlHdURSMzRkTVl4RUpPclVnelJ5?=
 =?utf-8?B?c1hMQzRzUFdWcVBwRlJYTnRhbGtRQ2lXRzlqUWpxMTQ5ZVZkZ0h0bEM4S01v?=
 =?utf-8?B?NkU2VE1kRkx5MkNENk5PMEc0UDgrd1FtZFViWTRZYTg3NHAvcWx5dDM5Q3Nv?=
 =?utf-8?B?aHBjN004VjJYWCtESkVROEpoMUJRMllkYWxDcHZrNUs0NnJEa3YzeGdmV3B3?=
 =?utf-8?B?ZmIvTUJ0VitEbGFiRlhZTlRsdnU4MVMxU0VqVTBIYXpROVBQRDV5REZIZDNV?=
 =?utf-8?B?VzB1a29hL0p6N3RlcExLbWlVU1kvZHR5Sm96L1NDd2g1NUpFSDhmUDk1SlVP?=
 =?utf-8?B?TlNLaHo1Rk9vM21RNkJSMEltT3hZWnFqTzZYSmp1aDBrVDliVjFWc0JCT0FJ?=
 =?utf-8?B?clVzU3VQdEF3dzYyVi85djduYXRJV1N1QzVvTlhuZFNpWTFxd0FDVHdkNE45?=
 =?utf-8?B?Q1UrQTluNkdkZFd0MnplWFU0bHJ6ZkYvUVE3QnlTUU0yMVhGUHFlQ3BHcjlS?=
 =?utf-8?B?Q0k5NXkyMG9nUlNMMjJpeFNJZWtTZHY4TWh6cDllajdYSmtTaG9kT09NdnJE?=
 =?utf-8?B?Y3A3aUM1a1hveE5vMTczT3JDRVFvM04vQkNEVXFnbnNPdXlXb09YVjBQMlJi?=
 =?utf-8?B?bzVZK1FSdlQ0aHhrdkFLZWJlTmw4VHpxcVNOUFNWVnBqaGh4bjZ1NlJBYXdE?=
 =?utf-8?Q?eVjuHgGpkhdO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFvMUZWUzlHWTBTb0dxeU1FcXRpVkZEK2hGN0FwckZlb2tGS3RCSGsvSG95?=
 =?utf-8?B?aFZqUmtHejZZaUQ4Q0UxcXNUak8wTkFETEJ0c0dZYmF4Um9ZUUJoWnRVcjhW?=
 =?utf-8?B?cFdlN0dKTHQ0QjJXRUxDM2Z0dzUwbkJBYm42Z3FYMmQwNGpOb3NxUXNhYjlU?=
 =?utf-8?B?Vk04SERLMmxEY2RSYmVOaVNZNGpwTEorZzk4VFdKdTFpcC9QanMzdjI2OVRD?=
 =?utf-8?B?dTNkb3BjanloajkwS3dVYkt0dk44dGpsN2UvNTYzczFDbTM5UDBQMThCR0hq?=
 =?utf-8?B?TldPdUNYOTZ6Z2N0Z2VjSXdnM2VVRG1tNUF3bkcwaURDSEdRMUZpaUthcDZ0?=
 =?utf-8?B?MDdpZmRMNWhtQnRuZzRYV3FTQ0N4dS9xTGVmSURpYi9PVE9UZzNtNHBJWm1j?=
 =?utf-8?B?OFFBTUN2em1Hd1lOWTR2RHk2TEF2N2R2T1g1RHduc1E3cnprMHJZOFkraGpm?=
 =?utf-8?B?RFd5MGJmZjlPdEVlTnN5RGYwUkpRMlhPL3AyNHhzcTNDaC81T1RaVWQ4YUZY?=
 =?utf-8?B?S2dIc3dxZTkrd2pmVDdxVmNqZmJyQW5neHJCR2EzcXh4MGJqWk9XSUdkTzJD?=
 =?utf-8?B?YTR1WUVBSng1VmxPbVNrbXF1czNPR2xhOGtXRHhzWDRzNWdoOEp6aG8rTzBI?=
 =?utf-8?B?N0UrSnFOOW1wcDNDS3hXeTF2RjVSMnlvQ2x1NVdKZTg4NFlYRUtaUXZKV2Z1?=
 =?utf-8?B?cS9meUc3T1REUFBqS2RDZkZuNy9NTk95cTB1ZU8zakhvVzRlYWFoTDFBMXFv?=
 =?utf-8?B?amNwem5DRlBiZDlmUDM3L0U0OFFFNDVXRS9Xdk4zNHpNUU5naGxWcGpoT2hQ?=
 =?utf-8?B?dGFwYkM5MEZBSWEyMHpncFlxc3BKcGNEVzlwR3RPT0ZCVzQzaHdRTVRxRnBL?=
 =?utf-8?B?L0NxVXYrdlBUeDNDRGg3eEFXd3BhRFJ5T1FEOEtBaldpa0pPWDJxcGphRmxZ?=
 =?utf-8?B?QmVnMEkrTW5wQXJpcnRRdHZJemxDOE1IUW1lMWtBTHpFVVQxeHd5U01zR0NQ?=
 =?utf-8?B?OGtkRGVCRStHSW1haWRQODRsNG9tRkgyVmlxWFBJbWdOREltZisyVkhQQ05Q?=
 =?utf-8?B?Rmw4YlFNVmpoTTlpUDlzQWpOUnpHcTZxOFlQWTc0Uit3YmJXWmVNcXYxM1RO?=
 =?utf-8?B?RW1ZUlhtUC9waFhPRTJlUjAwVGhjQ29KUG5BcXZ6cHkyM0VpQVBTOTJlS3BM?=
 =?utf-8?B?TnZ4eFQ3T2FLL0cwbGxwTHRPdFhEdGM5eFdHbnpOeG1ueGJId2ZNcTl5SDFp?=
 =?utf-8?B?aGh1REk2WDZ4UU1rV25GS2UvTmRHMXdrU1JObXRzSjhqbklSRnFQT1BaRmNB?=
 =?utf-8?B?ZUMvclliY0k2SlR3NXF6YmVxbTliWFlhYlhZT0pmTVVVMm9IYWlOdzFOTUh0?=
 =?utf-8?B?THZubndMQjVYSXJQN2RNTjQzdktIV29BSWRaWmowc0V3N280WEhDRE1SRzM5?=
 =?utf-8?B?STFSWkx0eWcxaTdVNURxKzZYS0NUL3JVaXJzTjhLdjVJbnhTcExHbStSLzU1?=
 =?utf-8?B?NkEyQ01iblNGSlJKamxZaHVuallxQTVzaXo5UExabGtGSUpOUWs3cXRzYkJK?=
 =?utf-8?B?Wm5HV0JrRkRGaHo1a0VXZWlaSUx1ditVb0dVKzFVVE14akZyR1BsZXBJa3NS?=
 =?utf-8?B?VE04SHZjdVpzL0J6WkpGMTB2bjVrek0rdjBhTjFhc2E2ZkxlWTlubEY0bWk3?=
 =?utf-8?B?NytNNUZibndISU1pcklLQ1pxWjREQUtxdjFhMGxpUGVHOHhlaktBRzZtVHpW?=
 =?utf-8?B?UkpuRWdFN2VMNW1PT2F1a2hKVzlDWSsvdmlUNUNOcDNvR3NqYzd0aXZLam1F?=
 =?utf-8?B?elloTVNsMy9JaFYvYlR0dXVsZGJFdjZISjZGRDM2WE1RR000eVV6U2N1Wk1E?=
 =?utf-8?B?ZXVRSUFxM2tXT05OR2ZJNy9maG9zNzB0NVRzSi9HZFZoMU94R1ZKazZ1c2Nn?=
 =?utf-8?B?U2QxTitxUk8rYzBGUGdzai9nUENDREl2cHExWmZJUS9lcjBqSnQxaWl0SWtN?=
 =?utf-8?B?cEx3MzF2UllsTGo5TTVtbTBjM3ppVmM3NGExQVVqSWhhbWdRWGlVVFhuQStP?=
 =?utf-8?B?Wk9wZGlIdkFtUXlpUG0xcHFyOGp6WVpjMnlGeE5UbVFuaUZJVUhLM3lsZTVQ?=
 =?utf-8?B?WVpXbzZVeDdZY0svc2N6VGFHVnVwZEg0QVo0Zy9lLy9EaE9YS3hyUDczV05C?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 529b2e03-729d-4da6-911b-08dd424ae505
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 22:59:19.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt4hZwm/S97lgC6MRwyNg4psUo/PqMWt+03Qro7PYXsUGHcgOcDVYJjGc+tbsU+lgWMHUmORntFrNqHccl441+2Yk9+esKzc0KhSZO4lack=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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

On Fri, Jan 31, 2025 at 12:19:46PM -0800, Dixit, Ashutosh wrote:
> On Fri, 31 Jan 2025 11:30:03 -0800, Harish Chegondi wrote:
> >
> > On Wed, Jan 29, 2025 at 08:45:59PM -0800, Dixit, Ashutosh wrote:
> > > On Wed, 15 Jan 2025 12:02:10 -0800, Harish Chegondi wrote:
> > > >
> > > > If the user space doesn't read the EU stall data fast enough,
> > > > it is possible that the EU stall data buffer can get filled,
> > > > and if the hardware wants to write more data, it simply drops
> > > > data due to unavailable buffer space. In that case, hardware
> > > > sets a bit in a register. If the driver detects data drop,
> > > > the driver read() returns -EIO error to let the user space
> > > > know that HW has dropped data. The -EIO error is returned
> > > > even if there is EU stall data in the buffer. A subsequent
> > > > read by the user space returns the remaining EU stall data.
> > >
> > > As I mentioned earlier, entire dropped packet handling should be in this
> > > patch, so we can see the entire logic around this. So data_drop struct
> > > should be defined in this patch.
> > I worded the commit message that this commit is about read() returning
> > -EIO when data is dropped. So, I didn't put all the data drop code in
> > this patch. Sure, I can reword the commit message and move the code
> > into this patch.
> 
> Yeah, the "unit of functionality" is not returning -EIO, it is "dropped
> data handling", so that whole unit should be in a separate patch. This one,
> I don't want to compromise on.
> > >
> > > >
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_eu_stall.c | 12 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_eu_stall.h |  1 +
> > > >  2 files changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > index c388d733b857..437782f8433c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -472,6 +472,7 @@ xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > > >   * before calling read().
> > > >   *
> > > >   * Returns: The number of bytes copied or a negative error code on failure.
> > > > + *	    -EIO if HW drops any EU stall data when the buffer is full.
> > > >   */
> > > >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > > >				       size_t count, loff_t *ppos)
> > > > @@ -485,6 +486,16 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > > >		return -EINVAL;
> > > >	}
> > > >
> > > > +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> > >
> > > Since data_drop.mask is being touched elsewhere under xecore_buf->lock,
> > > here also it should be accessed under the same lock. So this returning -EIO
> > > should probably be moved into xe_eu_stall_stream_read_locked?
> > data_drop.mask is being accessed via set_bit(), clear_bit(), test_bit()
> > and bitmap_weight(). set_bit() and clear_bit() are atomic operations,
> > but test_bit() and bitmap_weight() are not atomic. So, not all the code
> > accessing the mask need to be under lock. The code that is under lock is
> > under the buffer lock, whereas xe_eu_stall_stream_read_locked() is under
> > gt->eu_stall->lock. So, moving this code into xe_eu_stall_stream_read_locked
> > would not make any difference. I think this code can exist outside of a
> > lock. If one read() just misses a data drop, the subsequent read would
> > report the data drop.
> 
> OK, let me see what happens with my suggestion below (starting with "I had
> also outlined another...") and then we can see if the locking will be ok or
> not.
> 
> > >
> > > > +		if (!stream->data_drop.reported_to_user) {
> > > > +			stream->data_drop.reported_to_user = true;
> > > > +			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
> > > > +				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
> > > > +			return -EIO;
> > > > +		}
> > > > +		stream->data_drop.reported_to_user = false;
> > >
> > > I don't think this logic is correct. We should set this to false only after
> > > we have cleared all set bits (e.g. only after bitmap_weight) otherwise we
> > > might keep returning -EIO multiple times?
> > If the subsequent read() reads all the data from all the subslices, it
> > would clear all the bits. But if the user buffer is small and it doesn't
> > read all the data from all the subslices, some bits can continue to be
> > set and can cause multiple alternate -EIO returns. Ideally, the user
> > buffer should be big enough to accomodate all the data from the kernel
> > buffer.
> 
> Afaik we are not exposing a minimum user buffer size in the uapi, but we
> could too.
Starting patch series v6, the per subslice buffer size is being exposed
to the user space via the query IOCTL. Recommended user buffer size is:
number of subslices x per subslice buffer size which is same as the
kernel buffer size.
> 
> I had also outlined another simple way of doing this in my follow up to
> this email, which doesn't have such issues. What do you think of that?
I don't think driver dropping data is a good idea. The HW drops data
only when the buffer is full. Even though HW drops some data, a buffer
full of day will be useful to the user space.
> 
> > >
> > > If HW continues to drop data and keep setting the line, while we are
> > > resetting the bit, it is possible bitmap_weight might never become 0. I
> > > think that is ok, we have returned -EIO at least once to indicate to
> > > userspace that it is not reading data fast enough and HW is dropping data.
> > >
> > > Or we may return -EIO multiple times as is happening here, where
> > > reported_to_user is set to 0 before all bits might have been cleared. So
> > > what is happening here might be ok too.
> > >
> > > To see this clearly and evaluate it is why I am saying move all of this
> > > data drop handling and -EIO return into this one patch. So we can decide
> > > which approach to take: return -EIO just once or return multiple times.
I will move all the data drop code into this patch.
> > >
> > > We can also maybe defer this patch and merge the other stuff first if it's
> > > a separate patch.
> > >
> > > So maybe this is ok, maybe not, anyway something to think about.
> > >
> > > > +	}
> > > > +
> > > >	if (!(file->f_flags & O_NONBLOCK)) {
> > > >		do {
> > > >			if (!stream->pollin) {
> > > > @@ -680,6 +691,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > > >	if (!stream->xecore_buf)
> > > >		return -ENOMEM;
> > > >
> > > > +	stream->data_drop.reported_to_user = false;
> > > >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> > >
> > > Stream is kzalloc'd, why do you need to init these?
> > >
> > > >
> > > >	xe_pm_runtime_get(gt_to_xe(gt));
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > index f97c8bf8e852..8bc44e9e98af 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > @@ -31,6 +31,7 @@ struct xe_eu_stall_data_stream {
> > > >	struct xe_bo *bo;
> > > >	struct per_xecore_buf *xecore_buf;
> > > >	struct {
> > > > +		bool reported_to_user;
> > > >		xe_dss_mask_t mask;
> > > >	} data_drop;
> > > >	struct hrtimer poll_check_timer;
> > > > --
> > > > 2.47.1
> > > >
