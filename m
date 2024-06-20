Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BFC2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CA410E2D1;
	Thu, 20 Jun 2024 10:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkCIyRBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42810E2D1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718878008; x=1750414008;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4Zw8bhl1TWri7psFPlutKKaVPcIZNBJAZVAvcWMnVS8=;
 b=hkCIyRBLzSoVMzaNgxUGCT5QQ/qECpSWIfZ/Wdzzv4oD2O/S9oROh3C2
 MSWgdp7OXljFFuUlB1EDbUVZ39ryATQQ2kLj+4oPNLzz4OeC/xp/gpnlQ
 86OCishvumjAU98BkeX3mbcY9tdx/2uxa/HLaCzBUdlM4nZ1xTkdhrG9w
 PJwA4Q05eEGXkONrsTIE29jItEdYToK2q3TqcozsOdLga0mhcV1gcPmtV
 z3r89yx+5aM1EYafSspUhpzM3C2X+ELN9ZmkXCtlEu0t7PvwPKN5CDVmj
 sBAi7T4evy9huJqbH7remc9Bgvep7axmCePv6hnlChmydS/4P0MNG+ZM2 g==;
X-CSE-ConnectionGUID: nSWYztBbQamxZy5PNWJP8Q==
X-CSE-MsgGUID: vjp04dETRoiymkFmy31VVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19619765"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19619765"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:06:47 -0700
X-CSE-ConnectionGUID: gwGITkvqSQSjiVZdqGlaCQ==
X-CSE-MsgGUID: y2j1NCaXSCWHw0ERYFBwNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42051388"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 03:06:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:06:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:06:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 03:06:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 03:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN2/rDKs5njYFY8dCAtR3dGyZRZU/PAgYpiUFJbr+I4UMaUi6OyRal9Z3wzCj+/Bpt9FcvGImPukkX0jT1643EgNug965wIGn0u3LWYi5cDCULW6IGr4HILQrkfd5DYSIFpzUPfRaXb9wOxZg7pd6GZGH37H0ktkYqVU0f1eeYs0gz20Die09bjYvrlaiyPoOlBau/dwWB1zo/PuBnI8IXmeXX1X6nyIBcbWIZd+s+qlQ4rp40ODnnfX+nAEhaclKpuI5ZEkcAfi4TRSbLuNOI/V1iXM+Yo00ttHFsBcpkDcCPTaKSopsa3eEXIjUrVhhWliwS7U8Ssw81NHyt545A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zin9vtp4/yHiCJmJcvZeoA/j8SR1BgVvFV3VtoG/2Sw=;
 b=h6wfPUH95O7QV9rD4F56ocB3X1MAsEdLQa8t9YMCe2iVgTBK0VEpXkuhmfu1FU8IsNGeCJDwLb5RkNsYQbCSetnfS6xEl5G+VGC5SoFLgakcf4NcqqV+9Xc5Qr5pdSRE1pIEPXRmLUgNAQVpA0gYDckFr7lxEK5s5Xi/YMhdWLSbsq2oNPrOLkq1zZ0cd7GPLtOSA8DyPsA9dK1H2AFemzaQynprv96q2XwkcX3N0oVCTTCDlC46uEagCDv+2EbZclRCgeKwWvEN5LqtnLR2zgbZrCM3guz5mG4pSKYy1Im3EKw3C7RT0aYJyl0MF0ozkZ1jopOhaCWnrzo8+bahvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 10:06:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 10:06:44 +0000
Date: Thu, 20 Jun 2024 12:06:39 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/9] drm/xe/vf: Disable features that do not apply to
 VFs
Message-ID: <20240620100639.cnl3jnc2np6wvcy3@intel.com>
References: <20240619214557.905-2-michal.wajdeczko@intel.com>
 <20240620100147.949-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620100147.949-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:802:2::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: cbafa36f-c029-4d73-84dc-08dc9110b062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnVaa3N5cEQ2SjRrempUc2NHQS9yNHc2ZVhjWHJYcHlOcSs2UWlMWWlhajBM?=
 =?utf-8?B?ZlZkTXRNcEwzWUpva2x0Tmc4ZmI1dmdoNHNSYjV2bE9vWTJPUDdCRU9ITUs5?=
 =?utf-8?B?dFlTZEdFOW96eVJkMkdLZTZaTUovY2J5RE9TaHBYOTY3VEpRaDJ0dElJR1Qr?=
 =?utf-8?B?SkJYUUdSVlUrcXNxNVM1VEtobTJMVExVTkVaZ0lacWMwdWF4cUh1YWFmNllR?=
 =?utf-8?B?ME5pcFdIMEhQZTFZcG1KVWx3Q0V6bWx4bzdaTVdLUWlPM0d2a1R5N0RGUTQ1?=
 =?utf-8?B?TzBHcTdsSi9kTEpId2lFZFBjL2kxanpjdFdZVkJLdXRjc3V4RFJvdXp1ZkQr?=
 =?utf-8?B?Q2QweWhhb2NDR0dtKzR4SEIwa0tMYUZLZXo5UWtUZitkTjlDRDZsbXZaRDNo?=
 =?utf-8?B?bkF3UU14VFBZZmxnb2NPcmZjVkhTVGRLNXZMaXZEUTlSSUN1MTF2bHRSalUz?=
 =?utf-8?B?YVp4VEFEYjZkUnk0UjViNDV3VWVTdzlRZDlnd2NzVnkxK3kzamtTRDU4eTZR?=
 =?utf-8?B?bmVPSmZNaHBjVnlUN0pwa0pWZkVMMnBKVjJBbG5sQlZWL0QwNTUxcG1SWFRy?=
 =?utf-8?B?T0Z6SXVTQTZrQk1sT0NnQUlBRXFUL2FjZW5FTDZURVF0M1lHZVlxZmplekIw?=
 =?utf-8?B?L0NlVzZjTC9GQzRVY1VBQysvRFZJckpnU0p1azBteXgvVWhhN21wWUJtL3hF?=
 =?utf-8?B?TU1lQUxrYlZtMi8zaFpzeVpPR25vYW1LRWVtWTZhdy9MV1NSSjJpcEtXZ1Na?=
 =?utf-8?B?N2RZK3R5VHRVelRkUjFWZXF5eGIyeDlJRXJ5dTVFYzg3c1lWeEJtblJQNk5S?=
 =?utf-8?B?RVRrU0lEZExLTjRtUUFqVGF2NGltbmJscS9PbUx5Q2JPNUVZb3NoVFVya29L?=
 =?utf-8?B?YUxFak4yZENrek1nMzVDUUkzUUpRN29CRnhidVlWdVlpNEZXTCtoYnRseDQz?=
 =?utf-8?B?OTZvbTNUMjZiNnVOVExsM2hnMmRiSHdhTGdoczArWDd4TU9Kb1M1YjRnYWNY?=
 =?utf-8?B?bi9JRWdyUUllRXU1NG1GTnVUbmZzTzJvd2xVVUsrcXpYUWNsMnJmMWxia0Vt?=
 =?utf-8?B?ak9Lbi9XT3pmR2pGdFdEVnlyMWNDYjByU0tWWGh3UmZpNExrV0lJMXZQNERu?=
 =?utf-8?B?cnBhS3hBaTlqWVgyc214WGdGK05yelcxWHYzelBRWDBldStkcWx0QmV3SWp6?=
 =?utf-8?B?dGkwOXM2YkREc3Z5bWlPbmVGK1JnYlhBTUZEUk5LcTJycHpQTHoyZ0hSUHpz?=
 =?utf-8?B?UlZ4Q0dVeDUxTFc5dlo4V0czNUQ0L3FZanN2WUhKZmJWS1hVd2pxQVdqYi9L?=
 =?utf-8?B?amJnYzVSUERMRXlEYU1Fb1BSSjIrcGVlbTl4S3NEbk53VEY3N1VuS3RtVWs3?=
 =?utf-8?B?QVpWN3YyK2hZQnpYMXVwd0t2UTNpYkpCRnovaVlGOWI5Q2h4cHFTejIzcSsy?=
 =?utf-8?B?QkYxc2F4OUNxM01rbUo3L0pVUXZzemY2R1RWRy8wYS9MeG9EN3I1d1NBUnM0?=
 =?utf-8?B?Vm4yWjBoOHF2UFZJaE1rNGRjSlo4eTVqcHpGMCtEVUVDem9PSGhjcDVjYVdH?=
 =?utf-8?B?bHJ2bHhPSXZmc1orbE51RTVoTDh3bmxacjExVkRzUjJ1bXpjdzlpTng4aEs3?=
 =?utf-8?B?cEtRUFhIQXJEa1BzZFJSOTBsdGJBNUhmR0hFTklrRmFmRnVDYTZvUi9Pak90?=
 =?utf-8?B?NlRnV2NKbytPUEpwZnhnbmtiNE1RdmtmMkh4VXVtRStJRUlENjlpbllDUjJu?=
 =?utf-8?Q?XG7AkX0NvDyj6iI0yCiQev48JAiNeRBwcIlzAbC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVErYXZlUVkxa21RV29PMFhST2ZkZWFCM2ZGMWlPNWpyVUYzMEJrVGc1RXgr?=
 =?utf-8?B?WlFwcTdwMHlqdWpNM0FLUlAwbnZZR0x6Y0U3ZGNJUUZtdmlMcTJGSGpvdStz?=
 =?utf-8?B?MzNIMUFTQmVHcnI0QnI5OXB3dlZRKy9EWTZVczJ1M1B0eGg4YnJ0MGNCUVVL?=
 =?utf-8?B?THJUWDdBMFpvdHBBc2VJS1Z3c2I3bEVyM1ZSRW1HK1hIYTlMdi9ZMEI0SzBO?=
 =?utf-8?B?Q3M2WXlOTzYrK2pjZ0hEUDlvMUlTQjhzNkZOVzNVbEhVd0FHMHk0anFNT1Ni?=
 =?utf-8?B?UStPREFYNDVzbkE5SEo4L0RpbFNtRFdHWDNSU0hhUlA1QTVqUFZrTU9rNzAw?=
 =?utf-8?B?M005T3dpcTAweTNzT016eVdENzVQTFpwU1ZYQ3VDaEg1QURjemhCeko1NFhQ?=
 =?utf-8?B?Tmpac3BoM3JvNFRsYWJhamcvN1JQbVRhcHVoN0tTWHo5OFZDQnRRTzdNZTBz?=
 =?utf-8?B?NU0wS24zNmhNMEFwVEZha3oydnZ3cTI4Y2Nka0FGak05R3ptakd6TE5WNlJr?=
 =?utf-8?B?bCs5Ui9XWjVvZncvL1l5TVErd01KaGUwS2VBR0xCekRvNW5FRkd4eUw0RENk?=
 =?utf-8?B?ZERYWFFvckoxdXFNQjkva2pQOUZQU2xtc2dVRGRRU1lNbW9obnVnUlIwMU03?=
 =?utf-8?B?TVdJQ0g5RVhvdUVLN2g4QUlBdWJJVkdGNWhKZDZvVG0yV0RzRktBYnQxNFla?=
 =?utf-8?B?TEUvYWpNNlV0OXNTQWVTakMrYWJiS1U1eGc1YmVQaDlQNUl0UjJaQjkxblJl?=
 =?utf-8?B?REY2dzV6UDg1Rk51UjZhbDZBNGVzN2gweGxyK2xCZHlZbFdJcFplRjhUR0xN?=
 =?utf-8?B?aDQwUHEyR1ZCQk54MWszbVZMNEhaVmRpZzFQek5PbzRKWklZSm9GbEJDR3NU?=
 =?utf-8?B?bnJOL25Wb2RMSmpVVnFaWkNoZXZ0NW5VdTFSV25ZN0VadEpxQUFLOG4rUkRK?=
 =?utf-8?B?Z2hRb3NkVFBKaGVIem5LMXJpSy9TS0M1YUZmL1R3OXNma2plMklidXRMT1dH?=
 =?utf-8?B?QzhwRVFwWUdGZ0ZQVU9HRFBQdDlMZUNQZ21Yc1ZGd2krTzE0VzRWSFdrQndE?=
 =?utf-8?B?dXNnUkJDYzZEamRQbm9SSC9zTExZOGdhc0JnVjVMVFRMSzF6KzVUaTl4TUdR?=
 =?utf-8?B?SXlYWVFVU1lXQzVmd28vdnphTUQ3RW11cEt1ZXIvTkI4c1FWS2dVNWMvSDZL?=
 =?utf-8?B?b0kweUhkZ2dyRkV2Ty9BUDdKNFhZZjlST01ReFl2VXpha1llZW1BV2JWamRw?=
 =?utf-8?B?WGNFVGIxNDFBRTNQSWhRTHdwekdvUW5JQlNPWjNsaG8xUXRBWHJLcXhrYzNE?=
 =?utf-8?B?WTNkeG5YUmYySkRieldwemoxL2JLSlJKbmlORGxrWUZtODB3UTBwUEpIVHhI?=
 =?utf-8?B?cEw1NERzNGR1TXh6M3NCR3RURUpGU1F6aC9EYitnY3lCaTNBbUY4MjIwa0Zv?=
 =?utf-8?B?ZnhPMTlscXdLeVE5VysrWkVaZHpQREhrU0RyUmJ1aTZobjFrZ29hbk1qaXlX?=
 =?utf-8?B?dWR0aXpqbTcza2ZkbmhDM0U4ZHRqQUFkVVZrQjRGQ0EzZU0waG80TEZvblkx?=
 =?utf-8?B?ek5BSDV6Ykg3S213QmJkOEJrajJzRitnay9nMWxlbUFCVTE4eEJVMFBWUmMr?=
 =?utf-8?B?OFpKU0xaMGFYUVlZVUtLbVVsLzAyeWtTYWR0YzJ1TEdpTW5qZWUzdWRWSDJk?=
 =?utf-8?B?ME1ua0pubEJKMHhITW4wNkFSenJzSVFSSlR3R2F5dHdkb3hIc3Z3aElYL2M2?=
 =?utf-8?B?MXd4VzZDREo5RUhpbWJ3a3ZHMXJ6RWRLSXBoNVhLRGpGY1IvY0x0bTArWjVX?=
 =?utf-8?B?RWpsblJuUDNBdWJRV2V4cEFCcDZFNTlLMTlPc3BuU2c2cTV2eVBkdWlpN2JO?=
 =?utf-8?B?ajh6bVAvQmQ3TDQ5QkVxTnhCYU0yRWg3d1MrRUFtemVDVEFTeWc5MjBTOW0x?=
 =?utf-8?B?TzJaS1RaczJBMmJWc0Z2TzNDd21uNjBIYmFHWS9NZ0lXNWh0QzI2d1drNVAv?=
 =?utf-8?B?MWtkYnowNXovenR6VzFmYW1kWVVXVHN4OElEUy9ZdncxT1N3Nk1IbFlGTXZp?=
 =?utf-8?B?ZmdHR3lna1JkaHdYUmVLNkFyVjFEemVYTnpnNFZIb242RnA5R0Y3MVJKRUhr?=
 =?utf-8?B?eU5rZ3BuQ0tsK29NQ2g3RytGd05pdWtZcXFGWGhsaUtNNTBFaE5UY0M3Nkh2?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbafa36f-c029-4d73-84dc-08dc9110b062
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 10:06:44.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS4qQUvVRNUvSPRtA8o5WtdI3jEMzvOWaBBWJ+PcuBbwlCO6lQbZe/ePr+niZd6cI3D/gEXORRZ/W0AY69cjLGgsjuClPi/N364zDw1tY/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-cze-20 12:01:47 +0200]:
> We already maintain several flags that control the availability
> of features on a given device. Disable features, like PCODE or
> GuC PC or GSC, that do not apply to a VF device.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: also disable display (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_device.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75d4c8ae9234..0d57eea8f083 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -486,6 +486,17 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void update_device_info(struct xe_device *xe)
> +{
> +	/* disable features that are not available/applicable to VFs */
> +	if (IS_SRIOV_VF(xe)) {
> +		xe->info.enable_display = 0;
> +		xe->info.has_heci_gscfi = 0;
> +		xe->info.skip_guc_pc = 1;
> +		xe->info.skip_pcode = 1;
> +	}
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -506,6 +517,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	xe_sriov_probe_early(xe);
>  
> +	update_device_info(xe);
> +
>  	err = xe_pcode_probe_early(xe);
>  	if (err)
>  		return err;

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
