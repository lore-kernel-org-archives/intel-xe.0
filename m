Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E700C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 07:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2005510E0F3;
	Mon,  9 Jun 2025 07:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVNfsNVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8710E0BC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749453090; x=1780989090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oibDTEmqf9xxa1Jq4qtODUG8PjxrVCZqhrkS0wI8Q9w=;
 b=NVNfsNVffacSECN/fAoJGOjzffhJtCXkfK6t9BEaFdBHUyMngGx+NVTt
 p2n32ED2ZjHfu/g078wNKRp2189SegdIyJMiNfdt+UUGItlvpgpYB/OwS
 gaExgPw7wIfcQeWgVcRY6Ek06GE+tWew1LrtC8StrXwyY2EVvnf+C0ACt
 dXQQ4BMBUBjGOY8ucdYBuVi8CxwZjwOi/KWnyVVULh79ykDU92Tfo5+OQ
 acXPAEhIUDFVgf9wMbCrE6PsrnydvQIlF05k0h9aLc7Sm9SyXLqrYE0qL
 ByCobM+3nS++VFlZBlzCpRiuvzm08F3VmfTp0SsGjKk0iLVjb81qEEXEL A==;
X-CSE-ConnectionGUID: KlZTtYI4Q6SVXt+j8INALg==
X-CSE-MsgGUID: QD4zKiriQBu9POdYeASYKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="50632431"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="50632431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:11:30 -0700
X-CSE-ConnectionGUID: d8TuJqqrTPCBCYhLKTTLIA==
X-CSE-MsgGUID: WDxdQ8aeS5GTo2suXqLvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="146317911"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:11:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:11:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 00:11:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.87)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 00:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjbRLFgiHiSisFbMiTW005cNCRMDYObACv4jBy0u26GwpEuD+ySZKiFUDvSG3wDi3OgWBnssguIlfIEL8mKZIkBIdw6301YnD1BhWbHZcTIzfwQtbMFykCRhT7DOXIaBhBn/PlbzJH5cvg71vJ/gC0r6HXBRQFW7hSEriu3u8Z0aUA6/DTpTqVXDj/jcOUy/bPJBK7DWN4wm7hRsVIOAROwD7f7OFn9lECE/q1eaN/7ZEShoi5Txr+EAPJszHKpmSw7GFGiFngUQ+dvfYSGRbbPnfMxufNoFS0rFMH80Hk13c0Eydsk+iXlL54cNjvIIOjTMRnLuhK5kIdq0rVyqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3llxjsHn3NxgJz401oG66c+TDPdzfiOj6xA7EERQAUo=;
 b=jq97Q+sqfUklzcf2MkGsl2aTJQj5LVFclgLKUn4GClmjIpLWj5fOQnlMbZQvkqJWSK4N1VqWOaTWUtTj2xqWNC5KpGn7gU4JT/+pKmiuWocEEitr0YUWuLQwVAO8ItJn5C7SpNHIYcKggVTnMglDNqd27R6tT8dZRmHxD3BMx2G9WMBePFKsJF61WYxUzkdN++STIKhyU6CWHNPjcNa4xQ8bk2KwvT6YNYrGcYvhteBlGz8jEbMmfzEsq+Nywwux7iROqa/lPvYTbwBJgseCLVatgq4we3Ax1w8a2BOu/nQ7qpozSfyZ1NGhPoDatNzXIXVjCEzAYzQ/NPZ8on6o8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA3PR11MB9255.namprd11.prod.outlook.com (2603:10b6:208:578::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 07:11:25 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 07:11:25 +0000
Date: Mon, 9 Jun 2025 12:41:18 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/9] drm/xe/xe3: Add support for media IP version 30.02
Message-ID: <aEaJFndEK6pwoB3P@bvivekan-mob1>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250606195104.1771715-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA3PR11MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: caacc47e-9e4a-4c54-94ca-08dda724d8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG85YjR1TUFhcFNzNmF4cC92M3dKR3hjWkNjRDcyUWlhVS95bUJVNWFCVER6?=
 =?utf-8?B?RWdIbFFZRUdFM2hGMjlob0x1MWFzR0hPYm1xOTArdUJEZXlBbWppSzl2dVZl?=
 =?utf-8?B?TzU1RmdDcDNiY1JWenIrZENaSFFoTWtlK3FBdGV0a1BhaFZqejd4Q3h0dG1n?=
 =?utf-8?B?Z1lqenVZSzFpUHdwUng1V0Y0QzRWd0dOTEVmTkNFQWxVQ1MxU0hndjB5NDUz?=
 =?utf-8?B?eUUzNm9ybWtscmloQjY5QXBtY2JQdi9NUStrUUdwTWVSY3ZwRHpBamJ3WTI4?=
 =?utf-8?B?N09kakFsY0R1OHB3ejQrR2ZQQXozYnFwZFVaZVo5a3VLVjdWelFETXQ1UXdF?=
 =?utf-8?B?VC9GMHJTMEloK0dIQ3NOMFAwWVlob0dQVTIramJER2JUZ1h6am9VYjdVTkR5?=
 =?utf-8?B?cTQvZ1hVRzFKakdwUTlTMkVTRVNiNW1KblgxYU1ieEZvV0ZGWCtGZk9zbzVX?=
 =?utf-8?B?Z1cwSk5uNHdRcTFGMWN0OXphRTJaV005MUlPUHBpeHJmS2NBSlViSXkvb3oy?=
 =?utf-8?B?Qnk0MDZpVURLYUkyLzdJNmtSVnpyWkhxR0lWTi9NdUhWWk51OWIzTnVMMXNX?=
 =?utf-8?B?M0Z2TXQxUUVGNGw2T2lhQmhOSW03SWdkbGM2Z3lyd0tEUi9DMTl0VFdYU24y?=
 =?utf-8?B?NlowMDE0TU93cjBEM1RHcmRVeWF3NVJyeDJieEhNRXRLbjYwN1IvYU1KRHVa?=
 =?utf-8?B?M3c3ZGpFSVhXRW5MTWpYZWs1ZUJueTYwTkpuUzBtRDJXSVVpZXBNeU5SL1Zn?=
 =?utf-8?B?TmZLdzY5ZmZPMEVyMUtIZ2NJTEpOaDhjNFV1eXhEYXJVMC84SlVXYjRQYnZj?=
 =?utf-8?B?a3J6OC9OajdBZ05xd2NxSGN1UnlpOUlxellmNDNjQmxqOENuVzNIUzlmWFRY?=
 =?utf-8?B?eExIRmJycW1JVjk3a1ZFVk9zQ2RDSElFQlpwS1VqMkZRTmJENlYvc2p1MVNI?=
 =?utf-8?B?R0FmdzhCYUtMMVQyWE12QUtQQWlueUV0RG84d2xJUGtleitHM2VJUEM1dFZn?=
 =?utf-8?B?WVNHajRhNmdLc1JlOXduT2Fqa2RDS1R5dFljSWxqc0paTGR4U0dWMGRaeUVT?=
 =?utf-8?B?SUtKckROeExvWHhEK2w2emNiMjhnczY3RUpidnNtUFFoZi9vUEcyVkNDT0dH?=
 =?utf-8?B?ekMxaDB5WTEranNlRzFvcVBaaEErMHp0Nnc1Vm5TSFBZRDd5VHFWTWxiWWJk?=
 =?utf-8?B?THh0ejAyc2xIZnNyb3Nud2hyckJBR1J0blFXQ0xMK1lKTXI1dlEvaVNvNWw5?=
 =?utf-8?B?cGlqZklSTnJsUm5tdTltMk5ualhhYnFIU3l4ZkQ5c0F1SFdrMXg2RW8wNTl2?=
 =?utf-8?B?UTltR0hTODJhQk05KytzL3BvMlBqVDY3YUJhWEZGd3BaL3h1NVJEa2wzYmNv?=
 =?utf-8?B?WjlpaUwycURWZDFCRU1DRG9LVWFpaTRBMzNrWnIzQm1rRStEejFEOVhuWnlY?=
 =?utf-8?B?K3FsVlBtOEJ0dEU4SXZsUDlPZzZ4MXg1SnpKK0k2Q1Z6OTNSY3B6V2xDUVpw?=
 =?utf-8?B?WkR5ajJzWmpYTVBmSWRZUHU5cWpGNVp2RUJUR1FjemNBV21VcGtBQ3ZyazZS?=
 =?utf-8?B?UzA5djMzcXJvTUVYczcxbTJxZnVjd3VmZDltMi9QLzhMYnhLMkdXcXVvNGJ0?=
 =?utf-8?B?TkF0dngySXI0S2M4QU9CQzhPNTRhM0dHYXhNdlJPcHhhMzdLN05tcHp1Y0VG?=
 =?utf-8?B?SmxzZ0hZY3RiRTJZbFBRc1lwZDhIY1hINmQvQTNOcGI4QitUeW1CT1JxSHNB?=
 =?utf-8?B?K3hVaXowcllmMDdrSzNwKy83ZzNrYjNVYzhCaUowb01LRnFQYk02VUdkaUtB?=
 =?utf-8?B?VWVrL0UzUTE5T0QrSFpDeGVWemlSWGtyUUpvQThvbm5sUHBqK1Q4MForSVpZ?=
 =?utf-8?B?bnhmVkQ5amFYVjRQVkpGTzkyWWRxbUtYdUN4QXZrSVVVa2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNRK2tGS0h6UXRXaVFrcnpRNWdTbUR1c05uR1MweVpwcyswT3U5eDNNV1RP?=
 =?utf-8?B?NjQ4ZXFWT1l6bDhrbEVlZE5MZnJadmJaN1IyTzhxTThHbkVyYTEzc3pOR2dT?=
 =?utf-8?B?eU83TjFCUHlvcWNkMXprM3pMa05GRXNGN1Q1SldhYjdWeVh4clBpUU1aejFZ?=
 =?utf-8?B?Q09zeUZwK0c0VmZsTXNHaXRuTnpwZklzRHZxYkloQlExU2V5b1pIQVRqVXc3?=
 =?utf-8?B?NDFLSWJoNTNxd0dVVTRqVXNpWDNTcnIydkk3ZVlJOXl5V0hWRlhEN2k2UzNL?=
 =?utf-8?B?MEYweS9zQlJtODFIYkxESC9nMEtzN3l6RTZKYnpKODgxbmVMSXU0SWNvNCtF?=
 =?utf-8?B?Ulk2TTM1elEvUUV1RzRwTFQ3d3FjZXdFSjdhUHliNUJ4RnJkVEcveEs1N2hl?=
 =?utf-8?B?aDZKTytXQTEvRjZFbTdQVCtybG1IUzErd0VGQ2l6U0ExWEtXdDB5RWpFYlFi?=
 =?utf-8?B?THRSdFNaQ3FDMkxGWnZGdjBwMU9aZng0d2xhQWluVkhrZGJNTUJ3dUR1dTVE?=
 =?utf-8?B?R3V3UVllWlR0ZlB3RVhDV2pqcEtnSlNvMzJ4ZnZoQzIvRTZjeFRYdXBuWTJZ?=
 =?utf-8?B?UGg3QXB0VEQxanIvb25Ja0ZZYjF6TWd5K0RaNmZWUXFxTUVXNDVZcWVGdmxp?=
 =?utf-8?B?NkJxWkluZTlUWVB3Y3JuQ3dGazBrdi9VdzN5cmF4WmVaUmdZOCtwTXVLYkph?=
 =?utf-8?B?NHJxQWpNRWdsYTMwNloreTVXejdvdm55OVFKMnprVUZpSWJUbzZadlA2NUVE?=
 =?utf-8?B?bkMrTVhucGFBZFdjeDR4R2REZFhyT0JqRGZId2pZcnR6eGhIVDd0Sjlxb3FC?=
 =?utf-8?B?SDUrUVpNMFNEK00vYTNnNWxiT2MzajV1OWkxc05NWWZ4a3VsZ0tBOXl2NHFk?=
 =?utf-8?B?d3FiVG5oNEV2OXZNaEhkSDloODN0RUoxcWlzTG14Z3lkbXBEL1NUaW5ZdlZi?=
 =?utf-8?B?ZGtDazFWSnYvWDJpOEtoQW14bVN1RW8vTkZVbGdGOGl1UHR0bjJFZzlVRmJY?=
 =?utf-8?B?ZldXUmJYS1FNajI1cS9jWjNvaDhJMEhrS2dLbHlLZW5CdWVFNGw5N2V0aXdy?=
 =?utf-8?B?WFZhd2x6VngwYU9yTW1QeDdzaTdGTVM0RGpPTTJaMVF0RE4wZ2xxZjR1VzdY?=
 =?utf-8?B?V0YwYUNURTR6aGR4VUtHWmRWT2tvRDJXOGgzMUdpdDdJYjM2TUJaZFcrZWVN?=
 =?utf-8?B?TlVicUpOYmJ4MzFETXNLUDkvVUpFMmVjcUROLzRnMWpZemFNOWpLMFVsQSt5?=
 =?utf-8?B?NEdsSFkySnBFdTEvQjVKTHN6NWg4T3FVYWVHNlA2cmd6Vm9OYWJpeVU0bjVZ?=
 =?utf-8?B?dGx1ZGwwbjdBM1h0YVFhMWU2eG0yaVdVdGM0czRQRzVtK3o1OXVvWUh2YnRK?=
 =?utf-8?B?TS9FS3NrL3drakhENmtFREZmdzQ0d1pjaytURURzY3drRldUdmFOTE5hUE9i?=
 =?utf-8?B?UGtMRkIvamRBZ1FEbGtoeFZYMTd0b09YT29tUVdOcFZqZkplUDBLUytGWUhV?=
 =?utf-8?B?TlBDRkc4UXYzWXNTMzYyZVVuYjF0SjNvRGRkR21VOFBVZFZFYk1YSTh0aEJk?=
 =?utf-8?B?Y0FIVXJITWh3dkxlOTdDOTFxNnZjMnBtYWgvUHNHQ3ZrdEJzSmNvSVJhTUc3?=
 =?utf-8?B?blpHck12VnpBT2RmazVaaDJZMmVZdFlrRDJ2bzZoS01VSUFNUjBYY0hrSzdN?=
 =?utf-8?B?NGx2aE13NEsyRFZkODZldlY1Q2RSaEpwSHUzdGxvakRlMUE2N3lqQWJBYnBL?=
 =?utf-8?B?ZEVMUUZXWkZLUUtvQ1BmVkd5ZVBBOUdhUmFWaWlmUlUyenVlL1F3UDdGNnAx?=
 =?utf-8?B?Q0J2bUtRNFpSZXU3WlpSc3EvdHZxb3ArV2FHN05YS1d5azBHWnUyYk5Cb0RF?=
 =?utf-8?B?ZURoTTR0MFBZcXh5OEIxeldBSXNveHZIaVVkMGFjY2xYaEhLdXlQdTJzVWQx?=
 =?utf-8?B?VHBIZkRZQndaS2lPbW9laEExSHdjaFd4R1pkMEVMWTk4RTJRdy9DcjFOdHB1?=
 =?utf-8?B?VENtbFFjS2cvc1lsbmNBM3VDNkpqUzN2d3JlT1VCR3RmVWZrRHpKTDZBSUdS?=
 =?utf-8?B?ZStRd2Vhby9pdjgrT08xNEpTMm9vNHlIOHNIYXIzYm9nZkdlSVFqblVhVGtZ?=
 =?utf-8?B?ZmgwY0FqaEE0OVB5alVTc0V5a0FZQ0FnS29adkl4MVNTWDVXM1AxN2pEOVRr?=
 =?utf-8?Q?Xg0Lq9SxwYIRACnq/7fZxOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caacc47e-9e4a-4c54-94ca-08dda724d8cc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:11:25.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIzM1j6keQrDUqc48OL3ZFzHbrmC50FoLMlM5/uFABGexZuNA+bzsDx3xfnQV60JqkuzV0k5FgWHdlhl42ab1W4KKVmKpHaevVtVi2M2YyZQLTTauAeYYphmFEwHTPOQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9255
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

On 07.06.2025 01:20, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Media version 30.02 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        |  1 +
>  drivers/gpu/drm/xe/xe_wa.c         | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8824a8016b1c..46d4d9af0ed0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -196,6 +196,7 @@ static const struct xe_ip media_ips[] = {
>  	{ 1301, "Xe2_HPM", &media_xelpmp },
>  	{ 2000, "Xe2_LPM", &media_xelpmp },
>  	{ 3000, "Xe3_LPM", &media_xelpmp },
> +	{ 3002, "Xe3_LPM", &media_xelpmp },
>  };
>  
>  static const struct xe_device_desc tgl_desc = {
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5f750054a9c4..7ff79abe23e7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -285,6 +285,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
Instead of adding new entries, update the existing entry for
MEDIA_VERSION(3000) for both the WAs.
>  	{ XE_RTP_NAME("14021486841"),
>  	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 557d23c1bb9f..e46b4975ebef 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -59,6 +59,7 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
Same here, extend the range in the previous line

Regards,
Bala
>  		GRAPHICS_VERSION(3003)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
> -		MEDIA_VERSION_RANGE(1300, 3000)
> +		MEDIA_VERSION_RANGE(1300, 3002)
> -- 
> 2.34.1
> 
