Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065F2F3C9BC
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 17:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916D410E5ED;
	Tue, 24 Feb 2026 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kul4wNQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D2710E5ED
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771952646; x=1803488646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FpbD/UtigfDMgdH3Akp5mJZmIH20OcJkTXcAAsGxfX8=;
 b=Kul4wNQ6ScZj5jGndWOsF4t8XIvFO1+eyvNSCt20q44oVXq6tLo2JKl0
 RXRmbzIfPChJQcYVJgwQclwY9rpo61BYgCL4lvrN4YKJuo11ozFMPKPMN
 VptIdMp591E02pVFcpHaxEjlQ3iakZKn9okI3KNPPSzkwYlZ87Wp7rYcM
 oGVo3cW41LbkH91C0/II/MgwDMtIkL8nuBkJGLbahtNkfdsxVs6r3D63E
 c7cZUJzMjJUFujrWsrlyceWqyVFpr6zikLSRVdYV8Trt1TtqM5IlrDIoX
 i6DNEN5a485sEo23hoiJ/TyQon3mKf8hP95V6Q5B1xl3ppSRxUIHhF2zK g==;
X-CSE-ConnectionGUID: B1ogeGMsQPio+/gYa6gxHQ==
X-CSE-MsgGUID: qumkfsaaT3S5JupsH0kK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84068953"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="84068953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:04:06 -0800
X-CSE-ConnectionGUID: 8i1d1wQVSFe0wcPEuSnl+g==
X-CSE-MsgGUID: 8d0NpPuQTuSmFjJaO6Fxlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220955984"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:04:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 09:04:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 09:04:04 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 09:04:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuk2LbzBwX7kUsfZ9t1vXgyi8337QR2mkMW9XxjJn9+lsGWBPBI3qF9EtgpEpY+aikv5kUtnrvvwzxEmYIwVAVjhm++xoLVSHLCZ9plNjPSI96/6XoPl22H9dJkZJEKPQ/sQ4Rk7gFjskDqO6/y7WUO9hfatVqvQeUB5XsHqCNSgPv2ogCc2PprFD79SgQstkfFeLG7zMYh5TGqlxijNQZzOwhaxVX+tMSsken60AkZQ0vnkxmqAwfhTbRTYt4ppZFbjwyFoOtvaJcNSOodUb9+1P6CVkZhOqK9kWsklA5RJw4kVUd0xhpgBZ7aUUwqnzSqMWuqOXKaABdyNA5MXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is9NdnBQ77XRPMZgKNFbxRBMjjpx5bmWjmIX+mAQFvk=;
 b=jEtbJr95GR+wK9hPKUJXkv9MPsmFFBy3kFzyBCZqBuxNratdiwryUbn6PnoT2VwCdjttuEJpsw0IkWHxevlx8elHKbYr7wmeiOtQODMlV4MqomC/A3sjNzso9lbQTw8uCc9m+Gq1Kyo1o0tSA4MolO2fT9klo0Q0vAjhkq4QXWV2f3J2eCpk3Dfh6W6j2JDpEsaqV0vL7LAh3aOCOO8/ijuu7o1Gxrcc0hmkvix4o/V1t/ahxxNd+pwa/5jXUa8u5Lp/5t/2BHIu7UKJA73XWkeYcKZtej8ZNIR1UTLN/7B662wVHGQVq6UJWh5iv9xm05PSG8YLIafGhtx1ZwfWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF93A1BBECD.namprd11.prod.outlook.com (2603:10b6:f:fc02::3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 17:04:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:04:00 +0000
Date: Tue, 24 Feb 2026 09:03:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [PATCH] drm/xe: Skip BO migration when platform supports CPU
 atomics on VRAM
Message-ID: <aZ3Z/fGBaTBtyd2K@lstrano-desk.jf.intel.com>
References: <20260224092758.1880683-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224092758.1880683-1-varun.gupta@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF93A1BBECD:EE_
X-MS-Office365-Filtering-Correlation-Id: 829dd61a-fc83-4d39-0872-08de73c6b49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3ZRQmpOQytER3FIUmZzYjFSYURqSWhpV2E4ZElZS1pBcUMydFZ2ZS9UMkM1?=
 =?utf-8?B?SXE0NDVoMU5oZVpOei83eis0eUtnVkYwWmpwSklUTWYvVnVJRzUrYjVkSTI5?=
 =?utf-8?B?SFM0R2hBUWg5M3lIRzdhVUgvYVlIMVRpYlFiTlhpWnF2RlJwdmlrUW5naCtM?=
 =?utf-8?B?Vi9obzlKK2g2eG9oRGF0RVZLdWxVZ1hhRWErTThKTlBZUndRY3ZxeUJCdVNE?=
 =?utf-8?B?Z1NnS2Znd1h4VlpDTHZ4eUMvT1RMSDM5dlVtR1hkMzNKZEdSOHdFQmhna2Z6?=
 =?utf-8?B?RVlZQ2FncWtYT3VTRzY1dDBpZUZTTkVNZmYzL0laUVUwdnV0Tjc3MzNzNHBS?=
 =?utf-8?B?OG5TMU1PSUhna3BIdUhaT08yRUtNbEpZTkdXM3BkVDBjNldNM0d1R0J3NUVK?=
 =?utf-8?B?VVdtOVJBbmptellyUHVRelhJNTBqaGN6WE5oamJzcitxcXNKVmtYOUlub3Bm?=
 =?utf-8?B?QjRXdW5lOTMyT0lrWEpValBOSWQ2R3grOHFpM2l5TzRrN1RQNThwVFNhU0lS?=
 =?utf-8?B?YjNraDUzd2U5SDFNbDRHWWFpNGUzMWhpU3llTTdYT2hoc2F0cldNMStUVldy?=
 =?utf-8?B?NWp1T0dRYXpha2QwVmdxSVFNcVVVeTg5WFZ2dWZkelRXVUdJK0cwTGRvbXpp?=
 =?utf-8?B?VFhCYmFHNUlKVFNVZ0dxMktMVlJMRjlRQ3kxdjF3UE1waUJadC91MnRMeWI3?=
 =?utf-8?B?cDBhd2N5bWtpS1VnY2tCVUF3STV2N0VHTmxjWFhDR0xhVytVd09mMGRRS01B?=
 =?utf-8?B?d3NEdG05ZFNsUnovcFFDbnRmMTM4UnR5bmttN0xrY0RNcXBiZmFqSjNVSks4?=
 =?utf-8?B?ZjIzTy9xQkRXR05sUThod25qendqZjRzUW9ZNXJUY1FsYlhIVE9GN2thbGd3?=
 =?utf-8?B?SnozSnRldEVwUWhSVWRVWlBhZ0dTaStZVjZicUhWYXNXUXo2VnB2cjkvenNP?=
 =?utf-8?B?c2l1NzVKNjBWZDlqaTBGQmdIYnRmZUMyUDN1MFg4ZEVwbmR6NDBlb0FzNlFL?=
 =?utf-8?B?NjZIYkRpZXFWMCs4ZVB2UGFic1lsMUpYVUVodG1obmZNRDFqb0JHL2tma0dj?=
 =?utf-8?B?VWx4R1R0bU9haE9HZXJ4NnFHZ3h1R012Z3EvS04va2VudkVJdVVsb2Zab1h1?=
 =?utf-8?B?OGdiN1dvc0JxWE5nVkxWSGE1WDQxODRUcGtzZWQ3SEF1ckIyMEJtQVBDY24x?=
 =?utf-8?B?K0J3c2pveDYyWkd3ZWdabXc3WmU1K3pULy9BMGRmWHVIUmZjUVlBN2JuMW13?=
 =?utf-8?B?ejBWZGl3SytBVE5PQzB4ajk2RTE1M21wQjlMTzJONHgxa2k4ekVuVXUyUnhY?=
 =?utf-8?B?bmJsOXVTbEp3Q2FKMDdWZENrY0s0QUMzczBwWS9pMTVqd3VSVGlDcTk0bk53?=
 =?utf-8?B?K2ZKb1JQeWFkUW9MYlE3UE1pcWVYcEw4RitHOFB5Uk8wNGcwSjdNVzBWbkh2?=
 =?utf-8?B?VmtDcUpKY21CTVdlMkI5SUc1UDVLT1FETnNVNkhOSTdKdjhWb21rZTRybXg2?=
 =?utf-8?B?b1EyclNOZU55N2hxcms3L0xXSWI1L1pVVVNORVBjYWpRRUJHREZVV0lKMDBJ?=
 =?utf-8?B?Q3R3czIwMFZnWnNFUTZSNGV1ZG5udFZpdmM3ZHlqU2YycmduZ3NIbUNBa1p4?=
 =?utf-8?B?OXNnTTZKYURrcHlqNk90cmdnUmZXbS9zQURQdHFDQktxTTdOTnpCeEhoOVoz?=
 =?utf-8?B?Q0lER1dFSVVvdHZQQTJSVmtFZXBvbkZGNEpKdFpaNmFwT2RmQmF6RWs5K2tD?=
 =?utf-8?B?SUkrYlpBUEYxNGdTbWM2U1Yxa0hNS3VYNU5tQWlaM0tVd0xQQ1R2SDJPM25t?=
 =?utf-8?B?ckFnRitlSXB4U283MHBlazMwNDNsOGtQQVZFdTRGTTNTSUFTK0p5WjdVTGIx?=
 =?utf-8?B?K1l6TDB5d2hjdld3Z2hDK2pHSldlVm5va3k2T0RqWTFIYTFsNDBHVG1oZGJa?=
 =?utf-8?B?YkxnUkhiODNCSGJuK1A4ek12QUR4cWVPeU43UUt1N1YzTWJTT1MvQnM5VEx2?=
 =?utf-8?B?eW13cCtqckdFUmJybVZ4ZkdYelg3cnZjSGZqbWpycFovMVIrMHpZaW40cTgy?=
 =?utf-8?B?V1ZZbFo1dHJmdis0d0JZb1c1bTErckZwa3FLSU9tSHBPdTJQRCtXVHZEYk5m?=
 =?utf-8?Q?xlP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVXWW9kUitBMS9uRkMwTnBNSG52dmpGWHFwUUF0ZC9JUW9LMkZ6OUtrcHNa?=
 =?utf-8?B?YnNqTFd4d1VCNklhMGU4TmNkblBzdUhBZTdYSWJPemtQWlY1SXJSRVlpU0RG?=
 =?utf-8?B?Z1hyOFRzdU1CWkN0a1orbGNWZThYQ2dBNFRXQWFGQVVLc1BnZklNRTV6Q3lq?=
 =?utf-8?B?SXJ4ZFppODMrTm9yaXFoeWdsckU4M2wzVElRZS9NTXBZem1nTzl6UXIyY1pN?=
 =?utf-8?B?ZnBMMVZ1dnlBOFNVSTlPeE9WQmpBZWlFQnVGZ1hlQ2RJam1CbVNlWGRHaFpE?=
 =?utf-8?B?eU1CaG45Vk5jNHNKU0FXaXdKenFxM3QwUUdDdXVuTlFFNmxKZ3VZK3hZRXcx?=
 =?utf-8?B?bklSOWltQlJJdkJVaEFRLzRaTFc4cEdJRzNBVDh4SHhaNk9NVWs4MGVrM0J5?=
 =?utf-8?B?NkhmQlRnZi9LWFJQL3JuSkZVQUZmMUFqQ0IxTnJVR3JBdzZWNGxzSDh5OC9n?=
 =?utf-8?B?LzB0Y2g0WlBOUEdsYVZ5TzBLRWs0em5HcTBmdWYyZXVkL05mQm12K1VwNjFC?=
 =?utf-8?B?NnRFRk9XWUR5dFVEMTYrWWNuWVFjdkZkd0tDaE5rTnVncWc0ZWV2aEtjVjdp?=
 =?utf-8?B?bzdqNHl1ZXNUU2FmaktJdzViRUtXU2FwQW8yNGFYK09uSWlzSGxTU0ZPeEpG?=
 =?utf-8?B?VkthSE9JVW5FUjJBTDlGZEJQV3d6VEY2M2VqblgwZEs5ak4wK1ZHK1hneVBI?=
 =?utf-8?B?QVk1eUVXOGg5L2N4YU5GUHVyZnk1ZUpPSm5WbDNjRjMxeG81RFhHUjNQSVBJ?=
 =?utf-8?B?S0ZSQXcvUVJkeVdZUWpvay9rcEFLZnkrMDBrdVlqRnRqWTlOaHM3RmFzdnB5?=
 =?utf-8?B?a0ExZXl6N1h4c0ROZ01lOUFybkVkVE52TkhBaHdTVUZleUtzT08razZHM0No?=
 =?utf-8?B?cGdoNWIva3U5YzBBL21xRlpHb2FlRGtkK0FQcHNDQXpkbFJ1SmRLUlI3Q3RP?=
 =?utf-8?B?eXRTUGM3b2tpRTdjNkU3VnVTbjEwZ1hQU2VaN2ZKS1lYUXhzU3J4bS9KeGFI?=
 =?utf-8?B?eGJqL09TdFFqSzM0NVlhSWdXVjg5MVpIMkFuRmtNV0ZVR0ZxQ1ZkOGdJVkZ5?=
 =?utf-8?B?bXBOVFQya3N2MEkxZWdENEx3VG1Wb3ZET3hlRzNHYXFyN1JHSmdhSjVoeDVX?=
 =?utf-8?B?ZVJ4WUJORzY3cGpjVDVEeG1MSVA3aWpKQlFxSDZKT3ZrQm83OFRwenVkdEdl?=
 =?utf-8?B?NnBPMGFJb0Vlb1h0MldGa0o4RERsazZxMjRhWjUrczlseXpGVVlqbmhxOHM2?=
 =?utf-8?B?d1dockdEMkpKY0puaUlBZ3ZLUy9rTytHYmJHVGtLeUlWdXJMQ28wUkFJVm5m?=
 =?utf-8?B?Um1sU0dOTVBYdVBTWUpLT3NmengvQzd6blhVLzNLMERXV2pnK3ozL3VYSUN1?=
 =?utf-8?B?Ti9US2JHWC9BbTdETHVoSGtlSHU5cldYTVRuTndrcGFENndlMVR2VmdtMFZt?=
 =?utf-8?B?MEVUbjhqWXNMOW9CU0dTMU5ka2ZYUUErbGRLZk95dThTS09pUjVMWnBZWk00?=
 =?utf-8?B?WVNicHhIUmNhSHRkWW95QWlrM3RLL3Q4RE1BL1lzaGI2STNPeGJ0V1VLZk9X?=
 =?utf-8?B?bUUwbS9TOGxSRmJPYnhGL1ptOXNQaGNpVldHTSs2eEQ4T0tOYk8zUEFVSTMx?=
 =?utf-8?B?ZVFhOEpOWHJsSW1UQkVaR1phRk5ZMmFKUWNrZE1YMEhra01vRWpWVDQ1WFdS?=
 =?utf-8?B?enhkVmhwOXdMZlFjWVlpSXVNcHdrYXNaV1BaVmlUcVV0Wi9SaWpralpxQU5i?=
 =?utf-8?B?Q2pPRENXYjlmdkdiZi8rQXBOVWpyY0RmemJkNXk5Mk5uSlpZc051Q1ZFNGsv?=
 =?utf-8?B?NlN4YkIrc1ZsYVgraEh1aXM0MHY3N1FPb3k5SXZSdTliMmRZUnFvem4wM0Ja?=
 =?utf-8?B?VmhYLzBqcnZHS0V1SG9lTzlSVXVSZG1yUU1DckExNHF0MVZTYTZRSUlvR2Uy?=
 =?utf-8?B?ODJyUXJIWi9LSmxIZUJOVDVseUNld3pTNUM1WUttaWxtZWhFYzBnMm1PTXNm?=
 =?utf-8?B?dnI4VytQWWhhS3gvNFN5MSs4cW9PQXJmWVhNUWR6TWdOZXBCSTRVRWM2WEoz?=
 =?utf-8?B?M2dKdXNlOEVXeXg4end3YkNBdFNickRCMUk5d0lZS1N5THFFQUhmSWtzQzhi?=
 =?utf-8?B?dWFicWE1NkZjak94TEhtVHI1SFhHcG5LRW1LZHhUNFlJU2drK2IzZnJXcU5W?=
 =?utf-8?B?N01La0Z1T2Jva2ZTVDhKNWcyVmpvMWZZQlAyektSaFNRSzR5cjBWQzg3RWZM?=
 =?utf-8?B?QmZzeEw4NFBHTXM0ZTRNVWNyREJMTGowUHRNaFVIMk4wdWs5ZjdDeFRlVFBU?=
 =?utf-8?B?MHFCL0t0Y2pMNDZrbXBranNYbTQ2MUtmcFF5L09GRllBVlk2KzFYUXllVFFM?=
 =?utf-8?Q?fFmkURQC94gzjO1g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 829dd61a-fc83-4d39-0872-08de73c6b49a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:04:00.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3QM0tfRLjDYs/ypV8JvLmZLByug3JeuBoo4d8mXlrDmMfRn4a3Oqv49Uf2muPj4AaHv/46pqyLcQaOYMBR3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF93A1BBECD
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

On Tue, Feb 24, 2026 at 02:57:58PM +0530, Varun Gupta wrote:

Are you sure about this? CPUs supporting atomics (i.e., CPU instructions
with a LOCK prefix) over PCIe is news to me. Why do you think this is
supported on Xe2? Also, wouldn’t the CPU factor in here too if it were
supported?

If this somehow works—which I doubt—I think we’d need a test case where
the CPU issues atomics and the GPU does too. Then verify the result,
e.g., both sides perform 10,000 atomic increments on a VRAM page and we
confirm the final value is 20,000. Maybe we already have an IGT madvise
test for this; I’m not sure.

Matt

> should_migrate_to_smem() forced any BO marked ATOMIC_GLOBAL
> or ATOMIC_CPU out of VRAM on a CPU fault, regardless of whether the
> platform actually requires it.
> 
> Introduce has_system_atomics_on_vram to the device capability flags.
> should_migrate_to_smem() now gates migration on this flag, eliminating
> redundant evictions on capable hardware.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 16 +++++++++-------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c          |  5 ++++-
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d6c2cb959cdd..848467ca6700 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1771,14 +1771,15 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  
>  static bool should_migrate_to_smem(struct xe_bo *bo)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
> +
>  	/*
> -	 * NOTE: The following atomic checks are platform-specific. For example,
> -	 * if a device supports CXL atomics, these may not be necessary or
> -	 * may behave differently.
> +	 * Migrate to system memory only if the platform does not support
> +	 * CPU atomics on VRAM.
>  	 */
> -
> -	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> -	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
> +	return (bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> +		bo->attr.atomic_access == DRM_XE_ATOMIC_CPU) &&
> +	       !xe->info.has_system_atomics_on_vram;
>  }
>  
>  static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
> @@ -1804,6 +1805,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>  			       struct drm_exec *exec)
>  {
>  	struct ttm_buffer_object *tbo = &bo->ttm;
> +	struct xe_device *xe = xe_bo_device(bo);
>  	int err = 0;
>  
>  	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
> @@ -1811,7 +1813,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>  		if (!err)
>  			err = ttm_bo_populate(&bo->ttm, ctx);
>  	} else if (should_migrate_to_smem(bo)) {
> -		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
> +		xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
>  		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f3ef836541e..2fe643c179fe 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -205,6 +205,8 @@ struct xe_device {
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>  		u8 has_64bit_timestamp:1;
> +		/** @info.has_system_atomics_on_vram: Supports CPU atomics on VRAM */
> +		u8 has_system_atomics_on_vram:1;
>  		/** @info.is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
>  		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 56a768f2cfca..f2d86e08e190 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -925,8 +925,11 @@ static int xe_info_init(struct xe_device *xe,
>  
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> -	if (xe->info.platform != XE_PVC)
> +	if (xe->info.platform != XE_PVC) {
>  		xe->info.has_device_atomics_on_smem = 1;
> +		/* PVC doesn't support CPU atomics on VRAM, Xe2+ platforms do */
> +		xe->info.has_system_atomics_on_vram = 1;
> +	}
>  
>  	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
>  	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
> -- 
> 2.43.0
> 
