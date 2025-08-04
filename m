Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBEAC87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 14:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1EE10E58B;
	Mon,  4 Aug 2025 14:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYAp6qhs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15CA10E58B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754319074; x=1785855074;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ynt+9ee+1iymOEfR0mirbPf2VM0wEB/oNBKzkyJfn5I=;
 b=HYAp6qhs0J6JM5q3DaAyM5MUEYSR+P0QGDPnP/aXYHQ8FoD3+NxrFPNI
 3wwje5GKmO0m0ZED0HZf75ogsw//DviWmOTktFWSxDz22OHL5838p1zqh
 9mghuToyDV0tHwsUDES079jW2Ofvr5huH4oaFWnpm1rlZ1+Lq0UbmpQAG
 8rOgoNMqktAPBctu7QDro2nRLUpy/yV2j3/48LH1y5Nuo3S/b28SuYLJk
 +6gUDPkoijvsjBjcEkjNrO4usdoXNT7nvQuRraGPS4+f5Geyubh7RU2bu
 QEC6vd42aQbxPJcVKA1If2vEgdK3LwvCC0hdq8XjV4FttixSet7ySvod1 w==;
X-CSE-ConnectionGUID: 5rJjoezdRACo6hIunvryUA==
X-CSE-MsgGUID: RFmmAAnyRDuNccbbXqB5mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55787978"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="55787978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:51:13 -0700
X-CSE-ConnectionGUID: K1f7gTwwS0OL6hOjp7JPoQ==
X-CSE-MsgGUID: 9yOxPoB3QHS/fpN8OfxC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="201355626"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:51:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 07:51:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 07:51:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 07:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOSNv+GJfJAroSPZFnQjGrPtl+nEh7iVHwyT52/7A1zQ4SX/63+tgeyjqotjLMamju38KAuYIgPxVZRp76NIBqrhLaK8xGb4FgtXIBEzqINmJzgW8siXWvhlTbhGRlPXaR+0gFGyI2mg5sRJXLwkrnWxDPj60zyDnZCDEAZLceFADjURfq5y92dtEzoRqBOIKoy8hTO0THCzcSFEiFaR1Kc3fodXT0TAdmLo1QwcO4BBvYvZdofeAs5YJknF3JcazTN//U2QHjXrfPRTmMYRaamzOWA0zoAe2v7LI+J5cLp54L13srBymLxTIolOr8ceF1eTd3C6JK5khJPfdHNJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRgl4aJsM0xvA/YvL68r9h99Y73pqC0836cH7XtXXFA=;
 b=DYWAUfU7thYKvllbjg+7EheaccuHCMaCDNRRRBAe7rKBdNwQlOIWtFlkw83heDooco5s5nrbe3hIJ2mLXAT8+4MK9u8F1Njz+gfVOdMz7AenoUuIB/HymmAt+krQHGtiJ79lk90v3ubqz8vEP2DCHIs3ROf1lPNCOB0MZOiWbafZqeVtOrYruNM0kcSC5vNrFZfq0xZ041bxDyzGcrg51u0y2e7vbfwNd4H7ilQ45a5rho8KdQWYnVuzlnwdVcRccrnEU0hCLyYtXr4IAGKneJ9EF862qG5y8Bx172nDUMgbEcAPzSIH6MG1zPHzDe98fLUQh2M88ruq6CvH0OOOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB9463.namprd11.prod.outlook.com (2603:10b6:806:45e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 14:51:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 14:51:11 +0000
Date: Mon, 4 Aug 2025 10:51:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
Message-ID: <aJDI21VmY6Unf9Vw@intel.com>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ae5fc1-daf1-45e4-8422-08ddd3665a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWlUYUhDZS9zTy9RaDhiRkM5Z0hGZ2NUTUtEVmtZNUZpTithaHNwTjAwcUFn?=
 =?utf-8?B?SHhlclZHLzdFT2hlMEZWakJuWFdtZ05YeFlBbHN0QWpMRjZSeXVIV05YSFho?=
 =?utf-8?B?MkR2dEJIdDdVK1ZtandUVnVWL0RHM0E3M2hjdHRISXJra3lFTUxhQlExZWpw?=
 =?utf-8?B?UWVtdEd4aVZhTVVQYmhTeTZ4ZDVpT0E2Q2tSbjBrRFhTWVdnVkFBN0dZeW4r?=
 =?utf-8?B?NUUrVC8rRGp3S1dCaVRlMFNUU2ZaVkRnUDJFWTk4a2tOWEk1bUt4OU80UmlO?=
 =?utf-8?B?c05Dc3gxOVVSK1BzNGVtNWxrbndyWkpGMWFRdWRoQUltekhQYXArM2NrTWp6?=
 =?utf-8?B?N0txNFhJaU03cERlZTE1dzRUOGpBL3VhV1dvZHgvOGVMNDdKY1I2U1RsRzRW?=
 =?utf-8?B?NW1kb04vNlo1SVRibDNKNER5NC9YeHZXVTlRM25lOVU0a0EwMlVnd0s0dXk5?=
 =?utf-8?B?MElxM0I3SVc2blBtdi9aaEFnVUdQVW5LdDB6MEFXSDhGQTZVazFvbGV3dXZr?=
 =?utf-8?B?VmxKNzVLMUFNRnBuSU9YY3BCS1pKbjZVYUlna0c3QmxIcytKN1V2TDVReDRL?=
 =?utf-8?B?L2ZoVlJQb1ZTWkY0VHpoRXhJWmhNcnBsaVE0TlkvaDNQMXN3Wk9IS29rWXh6?=
 =?utf-8?B?V20xeVVSM2l5dnJhTmVXTnNHR2xTL2JTeTZzUjdCdUZBY1VxMzdoSUsrTXJo?=
 =?utf-8?B?SDkzT0d2b3gwSEcyOFZTdVVxaVFjZldJZ2xjckxSUnRGRVpveXRFTmUrYjNj?=
 =?utf-8?B?YjdlY1FMZnBXNUwxVDU5WDEyNlFlNjlLYXhxcUJUb1VweW5HbUIzU1Nhekht?=
 =?utf-8?B?K3I1R09rNUdpeUZiajBwcXFDbmdHaEdPQ2xYZGU5Mk1nZmRaWlBPU2lxYjdn?=
 =?utf-8?B?djlVZEJJMG9Ebmc4RTdNWU8wd0t3eHhVNllYRHRMck1XZ0NuN0xkcjBjYmpS?=
 =?utf-8?B?Q283YU1UTGJ5RDJXVitaem9tUG9BUGRJcWl0TEhzSDZkaUxDdTVUcXg4YnZh?=
 =?utf-8?B?dEpEakNJWGZtbEI3NG92ZlhqeFUxbERlaUh4cUtDdVh5OThMS3NpT3laUUoy?=
 =?utf-8?B?WEVvb0lEUDBVK2RRUEdnbnl6Vitad3k3KzhGRG85YXNFbGxkM3ltaEVWRkpk?=
 =?utf-8?B?OVhaWFFjUEZCeXljSzBtL3ZrdjEydnJaemFzQVhBbytSR25ScGZ6d3RnVGdF?=
 =?utf-8?B?S0g0b2d1NVM2bnlMUkIwMnBLbnVqUEtQUG5yeEtReDZ6UVB2bFp3QUVpeDJq?=
 =?utf-8?B?TlZoTUZCNzFWbTRXN2lQWE1zMll5TGdZTkxVNGtlK2kwN0liWFV3UXo2TlVh?=
 =?utf-8?B?YmNwTkVjSzZtdkMzWDhZb2tEMTJQaDRVaFE2cGVzdjJlejRxVmZpTjBHZWMv?=
 =?utf-8?B?d0tOVDN4Mk1sUUxlMXJRTHhOUktRTXpMNVBXb0tNY0lBM2pFNnZZSUU5N3lu?=
 =?utf-8?B?TGFUWmQvNXN3N0VDbmRVMXo3MjkrWmJsS0FTbjBDc1NZZmkvMnZBeG5PSFNJ?=
 =?utf-8?B?YlJ6RjRrdFBTQm9aMmFlc2Q0aTJHT09pZEgwKzZYZHJIaWF1SmYyVG1BUWdV?=
 =?utf-8?B?VWhJd1RxUDZTNTFiRWFEZHBnTjV1ZEtMN2RkRmw3cFgweDd6Zlk1dzMyYVg3?=
 =?utf-8?B?MW94dUhFOXAwNTlxZE5jdVUxd0U5TUlGWkdFcXkrRXVjVW9ndDFsVzdBbEZQ?=
 =?utf-8?B?bTI0QVl1SUdyNFZnbENJTElDOVRpNEMwMEx4NW5JdXBlMnhDbVNMRXl3ZVlp?=
 =?utf-8?B?cWtybnA1WG9TSm5Uak92TWx1Q0pVMXRvUFhqWml5TFBtZHRTdkhMbERTV2Y2?=
 =?utf-8?B?aWN0QUxUcEpOWjhXNTBJUUtCYjZPV0hMMFJvS0IreW9vMGV1SnR2THdjN3dF?=
 =?utf-8?B?Y2lCdTRlMXFCNG01Wmo1OWthWmJDUkJyL21FVGJ0UDRiZU4zaDJsQzJWYWMx?=
 =?utf-8?Q?nFbX4pXB5FI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNwc3p4ZWZ6VEJDcEhqTkRBWERiTnBNeWJ0RktUQTVZRVl6TUhVN1FZT2x5?=
 =?utf-8?B?c0xPVk9BbFRDcExjRFAyZDI3TnNqMnZaandJUFcwcnRWYjBOTENwUmpFVWNz?=
 =?utf-8?B?RU1EMWZtZ05MenI3d2hsZ0piRE9yaVRQSEJwcWhxZk5MSzRrZkdWeEp4NVEv?=
 =?utf-8?B?WFNBUnZjRC9ZRTU0elo1VjBGSmg0ZmhxUTVvb2w1L0w1VGloY1pmdjZxbTNJ?=
 =?utf-8?B?SjV1MmUwTVFDY0xVTnpuSm1UR2s4OUt3Z3c0UDJEcXNPNlJVcUxrdXV5NjZF?=
 =?utf-8?B?aUhFWU5FMVJrV2dKRG56RnF6VmJPLzlyTVlxaHIyUjBpSDdkWjkvU1RBOVBE?=
 =?utf-8?B?b01vWmRSc0p3Z1FiYzhMbG5zTWRBTWNrKytaNVdpQzB4WXgyS1BkYnVuTFla?=
 =?utf-8?B?Z0o5K0NnQ3d6UnRra2d5eEpYZ1l3dlB4MWJHdWF2T3I3dlY3SXYvM1Iwb0Ri?=
 =?utf-8?B?enJCaEM4TjFDUjJPaFlnd016MUVuTnlURXkxdTZSdjZvTE4wRG04RTFrNnVW?=
 =?utf-8?B?Sm9jOFZiTkZHWVNwMEcrWnRXNFRSS2lnb3FUeDhtMDg5b0J2dEdnR0wwd3E2?=
 =?utf-8?B?bU9iNVVOUlVoN1ZJYWU3U3p1OGVSNlRhYTBvL2p2REg5a3drZnlKNlAwaDRN?=
 =?utf-8?B?T3dvWlRZYWg5YTZGVnNXVXF0SmYzVmkvSzdIeExIdUs5MHU2SUdNeHBKYXdT?=
 =?utf-8?B?aFhIcU0rbWlVMDdJdTNrc1NVR3cvcTFPQjVhV3ZaODdoZkJlRjVuOXVpODho?=
 =?utf-8?B?eS8vVXhac1ZxdS9CUEViNXJ0RndyNWE5QkQxZjgrcGtwRy8zSnkvNTlPYUpj?=
 =?utf-8?B?VTNrSlNaOVV0c2ZZdWVDeHEvZmdzR3hkNGdCNmpaYnZpamVpNlFTM2JGb1Zl?=
 =?utf-8?B?RVcybDcrbnBCYy9DTWN3UmZsOG9zdHByUEYrN0cxdTdXeFBWSlpQQ2ZldUFG?=
 =?utf-8?B?ZmVEby9aRGRiVlVGOSs3dVhuY1hZOXBpNWNpbkowOEUzckkxcTNvM2VRTWkw?=
 =?utf-8?B?Q01ZUytuRWN5UzNzdGlhSE9FWVhXNEJubVpFbkE4aXVqRWZtMW8vZEpNcnZ5?=
 =?utf-8?B?dTBKY3BjRjYzM1lkREQ1MDlhVkJYNEJwdUdBVFdTZmhGd0syUnJYM2xEaHBp?=
 =?utf-8?B?ZUltQm1lRDBCZmNvbUVkVkUwZTlycEJ5RllPRTc1R0Zzd2JkcmFKWHJzRTlo?=
 =?utf-8?B?NGtuaXNSSE55WFR1Q1ZuUDQxWWNEQXBoM2JrR0kvR0s1Z1ZnM1RwRlZBSUNM?=
 =?utf-8?B?L1AyTm9ldnFGODlDcW9HTGxjd25KdFhKSWdFb1I4TmRBamFXc2NlNkxyUmtO?=
 =?utf-8?B?Y3V0cmpSQzdnOS82NG9ubUlLNFVPdjdMWkNVa1Ird2NCN2ZkTjNGL01tTXpZ?=
 =?utf-8?B?V0FFMlVmUm9kQm01VWdsZHp6akNLYXR6YmJ0WFh3WmcxZmJpUW1wc0hKNFN3?=
 =?utf-8?B?WE9iTmdNazNGSXFDRE9QV1FKdTJhV3pRd2tMcFdXTlU0MW9hNDFjaUlGYk1E?=
 =?utf-8?B?cllqWElnNDdESjJCRVNkK1UzRHhsbm9uSU02VG9qQUt2d1NNdnBvSkpvM2Fj?=
 =?utf-8?B?ZjBzL09Pd1dYeml3RzJDYjVnazdSa0kzTnFSOXFHTjJIbTdyMjdETVBvd3BN?=
 =?utf-8?B?WEwzTUV0Nm1GVXQ1YksyeHVnVWZGWXdVbW56dG0xVDVwam82QjZhVmExc3RW?=
 =?utf-8?B?ZG9SVENnZVppWXpYSVQ0ZHYzYThBNDAxVm0zOHo0NHg2TWFFVlgvYlM2NlZ1?=
 =?utf-8?B?QzBuYy9MemRyZytmMnIvaWs4Q3V3Ny9WSTlFRElSSlM2YUNLdFRCNFAvUU91?=
 =?utf-8?B?WGVKckVod3BTdzZXMzd2aGlnbGdxTUFlSExmYkI5dTNrT3c5VWtNKzZuNXFP?=
 =?utf-8?B?ODFobElQTGRTbzlzRENrWldFYzYrWjl4R2lBMmpGSkpJVnQ2NERqMk52NzBY?=
 =?utf-8?B?cUxETlc3MXFuNEZKdWFCUkU1bTQ3MmVRa3NCOUlUSDkzeFZZOEVuK1lWTkIr?=
 =?utf-8?B?MzdLVVBmNjQ5emZDTmNUeWsrZjB5a3VwS1RITy9kQWcvMXBoM0ZTMENXUlM0?=
 =?utf-8?B?OEFSa3QyZHVadlkwSlE4SEp0bjJxQ1Y4YjQ2ellVSEUzS2hYY29qdDFacnBn?=
 =?utf-8?Q?HqUoiOpBj7sNGULV7pysscF17?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ae5fc1-daf1-45e4-8422-08ddd3665a2e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 14:51:11.1965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2pWIWuWBJ8bW596IxOYfFpuuptpevwep65QtW1zMDnb4OoQMmg6HKo4lVx331RIBBJ9lT1TaOblz7m0qe59Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9463
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

On Fri, Aug 01, 2025 at 10:00:17PM +0530, Satyanarayana K V P wrote:
> Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> their native Power Management (PM) capabilities. The specification (as per
> section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> that Virtual Functions (VFs) without Power Management capability inherit
> their associated Physical Function's (PF) power state.
> 
> As per PCIe spec "If a VF does not implement the PCI Power Management
> Capability, then the VF behaves as if it had been programmed into the
> equivalent power state of its associated PF"
> 
> Since Intel GPU VFs lack PM capability implementations, VFs power behavior

If this is a true statement your patch below is wrong.
It should simply be if (IS_VF) return;

> must mirror their PF's state. During VF creation, the PF remains active
> from the PCI subsystem perspective. To maintain consistency, explicitly
> disable RPM for VFs missing PM capability to ensure they follow their PF's
> power management status rather than entering low-power states
> independently.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Michal Wajdeczko).
> 
> V1 -> V2:
> - Disable RPM only for VF devices when PM cap is not implemented.
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 8aae66660931..019de04fa7bb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
>  
>  static void xe_pm_runtime_init(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	/*
> +	 * Disable RPM for VFs if PM cap is not supported.
> +	 * As per PCIe specification, "If a VF does not implement the PCI Power
> +	 * Management Capability, then the VF behaves as if it had been programmed
> +	 * into the equivalent power state of its associated PF"
> +	 */
> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> +		return;
> +
>  	/*
>  	 * Disable the system suspend direct complete optimization.
>  	 * We need to ensure that the regular device suspend/resume functions
> @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
>  
>  static void xe_pm_runtime_fini(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> +		return;
> +
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_forbid(dev);
>  }
> -- 
> 2.43.0
> 
