Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C428CC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 22:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0D510E1A1;
	Thu, 10 Apr 2025 22:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3CRvdq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B210E198
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 22:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325125; x=1775861125;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A1EpOpbsclIBww04kj/c0jBlW/6q/ZrJ1uxff9OOpsg=;
 b=P3CRvdq4MR3vBzxRgi6lq8s5cFGlBXsiS2rcQHJw0Uu+v3H7u4pih80Y
 vX8Ntj3XiI+JvTYs2eCEsLRj8+7W+yedMD9W3bYgZmaevw6ux/snMug7w
 kMLpESS6BkevwfXoj/EobG+UdzE7MreEwcKg7KStN3LwNEsXc56bt5DKZ
 +1E5AQd+dHd1HA8yl8e50Kd5kmvGEfja9dJlzWVlVNRN11flObhSoS5pi
 eYij9X9kIDKRf/QHZ8n7EpftOCgIZz770efgsC1TLenUPm7L3XPD7NCKx
 DVyvoD0Wu5B8IC1sCn+LCijRr60bZJBim5eP82Kg7xRjtRBXAOnErlTM3 g==;
X-CSE-ConnectionGUID: 6NyLWLNkS+6tj5amD9gOqg==
X-CSE-MsgGUID: bkBkmDDdTAye5cGM9W/aGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56846554"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="56846554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:45:19 -0700
X-CSE-ConnectionGUID: 5eN3j81wSy6j5Y+86cX6qg==
X-CSE-MsgGUID: LXdZr0DCQnSxK7/bVnvwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="134011584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:45:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 15:45:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 15:45:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 15:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRT7NW0V4v1vT/pE6ERvRNK1nXWjYbdF25SJ+z6QbuL2R00tZ5oMr6JpynYlndI/BbUgi1Xj+jRAtoY0P9gXOr+Mfg9hXhZt7JqLnTC4PhyFVp7WqH9ZFvYiobwerMy2N8ct0HDuQL1yJbh2SxzJBKZ8Z/gzIZ2RI/hWZbBO+DVLo8XKelw0pGfsMDwho7H6yNShtJnSRKaaFnOebBfKFcgq6BjyvlXNh+AsgKvIZZsuyUU9mHybXV4uS20PWYiyxnprqT0THvUkjT+E9XxztELK72fTgJEJ7to6CA69GBCs6AE1unDm9utthlhQJq1nTP8e7dZ4EPzV8NDxMlo8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQffrkjUZoCyNh+iE+DvtW71UpGl+LOjveaGNNI4t6g=;
 b=waBpNZE0d9xdruoW80Kxj2rqGSgg2pSq2F/yw/J7CZRC/PXkPP6Tm876N4cwI5zyRWwYaBdjvWg1ialYQG+vTYqwl4pJAIiwnEvKiYb42ce/IhNEDovSvKuqmzbg51gG5I4iZ08ZX2ZmXWLTjAnwVNxo+0E3SpPxJg/iZ2iv1bGAg39Y2lt6s04m88QChU+GMKG1HJ/wJj6nMAMFlxKelfbAz7GCxMwMKm07xwnevopuCImnWSDQCpbdCrq4LysIHNlzvGBsoiqaR3McQhtsT875fo0BIGNTevSPqH7frGzl8voMiyWyTG3vCIHyMmlonNOD9oPii20B2iJ9I/5jUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 22:45:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 22:45:14 +0000
Message-ID: <597c25a5-fc66-43dc-862d-105295210184@intel.com>
Date: Thu, 10 Apr 2025 18:45:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-3-zhanjun.dong@intel.com>
 <CH0PR11MB5444090E4ED9567250307AE4E5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB5444090E4ED9567250307AE4E5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:303:b7::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3389cad7-459d-43eb-0a88-08dd78815b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzJ5SVNXczJULzI1b2Z0K2FFaGdaYUNpNU1lNFZzRGNhMzU3b1BmY3lpc3Y5?=
 =?utf-8?B?UjBhZEpldDlxQnlkOHpmbk91V25ha2R4Mm5hZXBFNFFIeWVqbXpUckFabFo4?=
 =?utf-8?B?MDJON2xHTHhvWStnT3hybE1XWk0xWVhZQlNlSHIwV2tNYXRBQmJuelBYc2FJ?=
 =?utf-8?B?bjJjUnFrMFhlc0NUS2dVZTYvMzdFd2VuWm1qZk1ZNys2ZDFMSDRoSlNVa3c4?=
 =?utf-8?B?RGJpK0lDMzZFVWU5bVBCMmM3WnF4T29XQlRtdTB6azFSNGd1Sklqd1BySTNM?=
 =?utf-8?B?dmpaTXkweE0zTmM5UzhCNzZnejJleEsrOG41cFYyK0E2ZDlZVFE3cms3dDlo?=
 =?utf-8?B?dFFrdE5ra1g2VWpDeEoxWldHcDVmQkFaYnZVemgwNEoxMmkvdzdCRENkajI4?=
 =?utf-8?B?TnBlS3FLcVdXN0Zld0tXS1dHS1JuVVFiK09QbnVUSU1jWXB3ZGVKMVpMNUt0?=
 =?utf-8?B?bGJYQk1vTUhEUzFya2o2OHh5Z0RoZVJWdGY2SlROZzJqdDRKcEowb1ozdzN6?=
 =?utf-8?B?RlowS2hSbEpNWUFZV3hMVSsvd015Tm1xaXI5RmJWRzkrZmtocVZyOElpQUo4?=
 =?utf-8?B?ZW5WNHYrTVRLK2hRdWw0cmdaeGN0Y2VobDlHVjN2V2pON1c0QVdTTkpIMEpJ?=
 =?utf-8?B?TlMrRGZVdEQ3RHZVWW9CNVh5TmlybUNPcTBOLzZxMXZJWjl3SFZHT3d3QWpq?=
 =?utf-8?B?R2ZxK0I4L3JrS2tzZnd3NDRZVXZlMTExaVJsZ0NVTWx2VFBsNm5TdFFEakpr?=
 =?utf-8?B?cHJ4M1lkRU5yRXgyU1YvWWVxUHZzRGs5RTlmbmdrc21HYVVLNlY0NUMrOVM0?=
 =?utf-8?B?SW1WaFFLdG13NkVwWmxKb2VpRllQbjRxNzlEeGdkdEc5c3l1eHhZYTgwUXVC?=
 =?utf-8?B?M0hrRjU2SzFXRE5LbU45NmlJYTJSeXJTMlczYituUSsyd0YxS0NZMDhNeHZP?=
 =?utf-8?B?ZlNQTmV0UXl5OU8zajJYVDdLcnVyS25ZL2c1SkM4VS93cFZtdW1IZENsNVl3?=
 =?utf-8?B?SnFWR2VkL21RNjNka0tkRlJtUGQrNnFHcUdQTUdJWWVpOUg1cnZiUERXUkZB?=
 =?utf-8?B?Q1habUJtbGxqTDJIRDhXSm1qVE4zYmloK3hqbzJKQWxOaHJFRVhKTktFV0hP?=
 =?utf-8?B?RGMvYUFrKzhUcm8xUlU0VlRHYitkdXNaNjhLa2NEZW9qYXV1TDJ3TmUxdUVy?=
 =?utf-8?B?T1ltV0NXZkMrSG90S1BwMmdER05wSWIvY3FaZkRHNSsxdk5wS0tSemQ1QmJT?=
 =?utf-8?B?S0owamJCcUxLRHducVJGOGtVc1dBbWdCeW1RSXB5MEloUkQ0UUhuZ01rQU03?=
 =?utf-8?B?NWNsR1VJek5hcnEwdzkrSFViMi9NcGozakJzd0hMZ05tb3dhWjZsNEVaSFdn?=
 =?utf-8?B?Q1B4Zkx5T0NNVzUwemxOWkJCOTRZam00L1h1S1c2d1RDa0t0VVVXbDFib1A5?=
 =?utf-8?B?WFhOM2ZWL0MxRGtiK0hmM3orR0hoenJhNDIwUlpES1FybVkzVEkzc3NmWkRW?=
 =?utf-8?B?akhIeEFUQ3cwejRWQU81cUR1U3ZzcXYwNDY0Vm5YckJtWXg2ZkV6RU9oaDd5?=
 =?utf-8?B?VlNGeFRjaDZNV1pqb01hbmt0NURqS2ZTMURac1JMWHk4Rm5MZnU4ZzIybFVX?=
 =?utf-8?B?V0F6Zkd5cXp5TDVtWGRVaGRlMDRUVHpxdHFWem5uRzd6cU1VZUN4QVpiTURM?=
 =?utf-8?B?a0ZlMmRLYXZlUHFpcFBXbFEvcG8xTTh0b3RSSkRweDB5Ky9zSlRBdHZoOHJE?=
 =?utf-8?B?RXVBK2JYemFxNm9iU0VSeVozNnBsMHZvd2p3Nm9WSGJnenlDdE5xSWhLZ0x2?=
 =?utf-8?B?T1JrdFJVYVZONjIxYlBGZzlvLzljQ0UzenVrMGdpSVo3NnRHbkQ0MWJTVWpm?=
 =?utf-8?B?TnplT1dxZk9rdFp6SWE1b2x4bVBsWUhYVDJuV1ExR0ptREFTV2VDNWFaMFBp?=
 =?utf-8?Q?r49RVOqemBM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVXSk1Bdms4d3dwcXIxeUpiL3VvbHQ4d2ZyTkNYL2twR0RxMk5qYU9waDZu?=
 =?utf-8?B?UzdiRHBUMjZzdXlqSTltRFNPTXRrZ2NoNGZhUStxU3BlSmx5MWo0R3EyeklD?=
 =?utf-8?B?RjBiV09Cc0hkVU5HWE1hTlJvSnM5WGs5SlVEdHdPZ1pGSnI5YW1aTVJaVVlq?=
 =?utf-8?B?ZnB5ZUNUakZHUEpDMTRpcEdmcGhTWVNrc0NWWW9Id2tENUpLT2FQRnBJTUE1?=
 =?utf-8?B?STRQd2FVSE9ibjRZOUtFc2NVV2szMlpVMitJd3lHTXNiUkQ0aXBDVUZkMVVC?=
 =?utf-8?B?K0VqdTU5VmNZT05ldWRFMnkyZ3JoNWw3MW1DVlF5RnlySktUb1hPc2gwRXJ2?=
 =?utf-8?B?LzlWZkJjaElybjl2Zlpoay9ET3cxTm05Y05SemZZdHZ1dWNyNHVFK3VMZll4?=
 =?utf-8?B?M0Vrd3llZ3o5NFRBK1MyNTNJWkZwS3R2T2huRWFpWjJDUUdYQmI0MERhVEN4?=
 =?utf-8?B?Wm9PKzdmUkFWSjBOMyszRm5kL0hvd2FsbktNanUydUJFcXNyMHhJSUJUWm4v?=
 =?utf-8?B?M3NESEI2ank3QytXY0hwSXJWTjFvL3FYalNGUGhwQk4xWEZ4dkEyamZrNkF1?=
 =?utf-8?B?SjBEeGNrUWVwMFdwRUJZMHl2WlhHYmdiSDdXZ3V1OFB3bmY0T0RZbHdVczNP?=
 =?utf-8?B?Z2p3bk84MTYxYUZOTE5HMG9LVmlmSytNSVREaWZiNXExWTBLUzZTU0E4R2lo?=
 =?utf-8?B?N1RIZVc1d3ZEV29yMmV0OVhTUHdTUklIV3VabUtleVBNdjdkeEwwYS9BVFVN?=
 =?utf-8?B?ZXQ1YjdhQ3pWM3BZbVRBcjNEalkyd0k3UG4rM0VZbGw0OXlDbGRITnlpSFVQ?=
 =?utf-8?B?WXFjWU1tTmFsU29xd1hRNS9UZTNZNmp2ZlZ6SEV4ZHVJRkFpdlRnSUkwc3dt?=
 =?utf-8?B?SVRRVmVXWmpFd0J4alliWUhrWnJ6S1J3bHhYVkJaOXZZSkVoNW1xakdGSEhT?=
 =?utf-8?B?TmFHT0l0UGs2WUpaQlBZTmp4T0taRzNTRDFzb2JOeFJ4L0h1dmVaaVpZaXJM?=
 =?utf-8?B?WmxRb01qTWw3VXlqUzhpSUFhZjFHWmdXWTdlQ3ZNQXliMGt4WStxSkZEMzl3?=
 =?utf-8?B?YktWTmhrck5NSUU0a2w1akVXK2pIbHFoK1l4Mkg3UytEb2tpd3c5UXNObnNw?=
 =?utf-8?B?YWM1TElRdXRKME50L3BYQTVwc0wzTjg4MlkzbHIzRVh5MCtUTFJrYVVvbUdr?=
 =?utf-8?B?dlhJd3lBWTdpd2gydUlXd3RMZDBVQzR3c2Z3Yk5CYWFzUWt1cDZYZEdHb25u?=
 =?utf-8?B?SHllRG9XSUxLR1RPYmkwSWRwL2ZKZ09Cd1NiUlVYeE93K3EzRGZubUpMN2Zo?=
 =?utf-8?B?cHNTK2RIdDZYZUs1TkZHOEhsQzl4UTBwV2tOUXB2ZEhVMHFadXFjTlpHbkd3?=
 =?utf-8?B?a0RwRlUwRWFWblNhc3dpdjJPbi85Y2FyNEI5eE9xeWp1TTJJSE44ZlJaN0kv?=
 =?utf-8?B?VW5HWWl5dElRbmQ1cnd6cnR3MlV6QjZyQ2NjWVNSU2pkdk1sNGZxc3RTZGFn?=
 =?utf-8?B?NVNpbDlCZjRlU1NITWw2U0t6YS9CK3hFSTYvOVRTYmFFYTRLbzdKUktUbHZI?=
 =?utf-8?B?RGJhWHh1Z0ZxUTU0T3B2UnEvWjI5YWhpT1FJWnpvZXAyeHZEdndibkVnb3M2?=
 =?utf-8?B?a3dzSW83aWRjRjRwVHkyYlJEQ2ZGU2tuWFQ1WEZVYXpBUHM0ekM4ZVVjV0w1?=
 =?utf-8?B?Y2ppaXlwOTFIL2UxOVhJQ0hMRUpSVzJDT3Y1a2U2aGcyWTlYUWxaT3EvSGwz?=
 =?utf-8?B?UWVaMzlnUnlIQmZUWlJqU1M2NlVzVHVjWmlEOHNVME9FS2UxcHJRbEE3MUxo?=
 =?utf-8?B?QWMycDZUTTNZM3NGQjVqNElhM2lMdm42Z0xkOVhMQ2dTS0hFLy9uMTNoc3dN?=
 =?utf-8?B?R1pWLzRYUmFYcThrenBPaXU4WFFWZXRiYXZvdmlrcy9tem1JUHhkZm5rbEdI?=
 =?utf-8?B?NXp4TmNxdDJ1Y3BQc283dVhqM0VoQkN4QkVJMlNKNTJwdWpkNGVKMzEwUm53?=
 =?utf-8?B?RXBNcys3SUhQeEpjM0YxcWl2cWxXZ1ZlbnBMbmZ6d0xKNjhGSmVLTGZrOVpw?=
 =?utf-8?B?NXhGUWN4NmEyRUFFOFlyTmtTZzIxVXZnMkExc3JEYmVnRjhmd0c4d29UWEdo?=
 =?utf-8?B?dm94NXJ5bERuSllncDZrS0I2UndLQTFoUkNFQjdHWGJJZ2ErRzZ1QVkwcWRI?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3389cad7-459d-43eb-0a88-08dd78815b9e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:45:14.1928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9NYiVzlCDxFarEYLpMsQoUbKHOncPimvHZURFbBOxqi6Tf2IYWJlIN5YhJMF98Hxn/wJ1PsQRH2GLdNa2P+FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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

Thanks for take time to review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-10 1:50 p.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanjun Dong
> Sent: Thursday, April 10, 2025 8:59 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
> Subject: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format output
>>
>> Add new debugfs entry "guc_log_lfd", prepared for output guc log
>> in LFD(Log Format Descriptors) format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> Some non-blockers below, but otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 34 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>>   3 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index c569ff456e74..6449c9a69b8a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int guc_log_lfd(struct seq_file *m, void *data)
>> +{
>> +	struct xe_guc *guc = node_to_guc(m->private);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pm_runtime_get(xe);
>> +	xe_guc_log_print_lfd(&guc->log, &p);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>>   static int guc_log_dmesg(struct seq_file *m, void *data)
>>   {
>>   	struct xe_guc *guc = node_to_guc(m->private);
>> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"guc_info", guc_info, 0},
>>   	{"guc_log", guc_log, 0},
>> +	{"guc_log_lfd", guc_log_lfd, 0},
>>   	{"guc_log_dmesg", guc_log_dmesg, 0},
>>   	{"guc_ctb", guc_ctb, 0},
>>   	{"guc_pc", guc_pc, 0},
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 38039c411387..df849a0ee7e5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -216,6 +216,26 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +static void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			      struct xe_guc_log *log)
>> +{
>> +	size_t remain;
>> +	int i;
>> +
>> +	if (!snapshot)
>> +		return;
>> +
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> +
>> +		/* To be add: Output snapshot in LFD format */
> 
> Non-blocking:
> Debatably, one of the following two things should be done:
> 
> 1) Squash this patch and the next patch together.
> 
> 2) Swap the order of this patch and the next patch, such that patch
> 2 adds all the functionality needed for this function to operate, and
> patch 3 implements static int guc_log_lfd and void xe_guc_log_print_lfd.
 From the previous version review comments, Matthew suggest to split 
into more smaller patches to make it easy to review. Right now, patch 3 
is already 400 lines.
For 2) I wonder it might trigger:
error: ‘foo’ defined but not used [-Werror=unused-function]
May be keep it as is?

> 
>> +
>> +		remain -= size;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>>    * @log: GuC log structure
>> @@ -251,6 +271,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>> +/**
>> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
> 
> Non-blocking:
> It's a bit weird that specifying the log is being printed "to some useful location"
> is the standard for this file, when this doesn't appear to be the case outside of
> xe_guc_log.c.  I wonder if it's because we have xe_guc_log_print_dmesg that
> has to specify it's printing to dmesg?>
> -Jonathan Cavitt
Agree, we already have xe_guc_log_print_dmesg print to dmesg, new 
xe_guc_log_print_lfd behaviors same as xe_guc_log_print to debugfs output.

> 
>> + * @log: GuC log structure
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>> +
>> +	snapshot = xe_guc_log_snapshot_capture(log, false);
>> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
>> +	xe_guc_log_snapshot_free(snapshot);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>   	struct xe_device *xe = log_to_xe(log);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 5b896f5fafaf..37ff4d11e6cf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -40,6 +40,7 @@ struct xe_device;
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
>> -- 
>> 2.34.1
>>
>>
A
