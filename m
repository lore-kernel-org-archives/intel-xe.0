Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2320CEB2CC
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 22:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F2C10E00F;
	Mon, 30 Sep 2024 22:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaLBFqNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2548A10E00F
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 22:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727736498; x=1759272498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1aDCyorSJztPmxweAhC9+4BJFIIOmGMVIwBZsvNx4Uc=;
 b=IaLBFqNH9j8ype8Pv4MCGQjN7miq1TL/aMzaLrHjGQ7C5L3A10SxtdBm
 32rrG77NnLkrxKkPdlGkLwz04C63nQTUrdt4p8yI66HGkopj6cXUypgSC
 rWsdXLXXDpAeubg8Q2JFAFeBitVM6sVoHnGFhy+meSxUmCZSKIEo3pqhe
 I4/GOWJJIUHJ46yZfUWzAYq43jWNNynlDSmZ6c8Raww4ncBNVGWcNNScy
 skJUgkHY7/89SolLoOkWDrRKodfEcggZNcoOc43UiahJcVcJYPua1rjCf
 3UGxNf6u7vafaFLxkep9mH7Kz24qlJOIWOFw6AGpKD6pCtPchwMkA97+M g==;
X-CSE-ConnectionGUID: xAejG+ftS9S/+gMZP3UNLA==
X-CSE-MsgGUID: GphvJXbnQkaqXMGnopzDqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37523102"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="37523102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 15:48:13 -0700
X-CSE-ConnectionGUID: vv1mViZtQBqNxaDIe5d6DA==
X-CSE-MsgGUID: 7CtWGpc9TiaSVRTLPuJDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73578685"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 15:48:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 15:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 15:48:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 15:48:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 15:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7h77ycX9Rfwg3nmKirxiCsG5dJPUP+VArJhtgMfsg9IJc1w0+DIH7cxnzGNfkXZwb7zk48GtsBxDi1Yus7KbUnWHBSZrT49jOBoC7mBDZvRY775WXPk4hNZrK5I7gRIZkIP3dY5h5OFhbzKEOiR8VaT6uIvH4pgDv3xrAHEVn+dzSj8tGVltN8VmHRDHSHhqVc3RXxiMClS8pJaQGlZvkdR7NZCI/6kWxM8LIG2wL/EjbCtNzccmUbytPYkrIUb2jUoJ8LbphFf4eUypkoFAvg5sZNxNZeXGknqNLRtExI+KqUIZX6vVQnoYoMZWFVfDK5MX4y9U64fXLLN1odJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm/0ZxbgZvOQ8RadVAZMubNc4nDC+UfxJ2vG1Mlfdec=;
 b=gs9MEiohDTE+OMru6N6wdRU6ysyXeGP78zPQPjU/i2wHLCZMElhs02x1wHEkeVQIHf21txA3I8lUE1KAEp/31TsaigK3iDXvjWaUOwPICRxO3deiG4NwsUsbQWN3PFEfWZZ97jTJWCC+Ui77AoiXJPYKrPgJ8UZjpqOCInm7CM8Yc7qFWPeo0ioaT2UEvHf8O+3HlM7vHCVHREXEmtVTPRU7J6uSS6uY7OKdb46zyNrccvtzHccRE/gr+jmHXo/rGp+GmyUhHI+6hhKNIUBL5DeO4q8iT6OOMddQCmxOMr76HJKl9l/D0udR2RvH95zA0Iadf8Azvgx7IDaYFzTvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 22:48:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 22:48:09 +0000
Message-ID: <16c9b1b6-c857-4053-9ec5-6b7096603b04@intel.com>
Date: Mon, 30 Sep 2024 15:48:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
 <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
 <7e64c52d-3b38-42eb-8f63-ad6c37ef225f@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7e64c52d-3b38-42eb-8f63-ad6c37ef225f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 876fcc51-f7bc-4dce-1158-08dce1a1f4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGZ2dHMyb05mdndjbXVSY0MwcnorY3ZmU1BYV1FVUjdSUTNBZ1Q4ZGIxdFpy?=
 =?utf-8?B?YWRMQjdyUmg5YlNkenNLcGl3UG02VzlPbEQ5dkkvMVVzbGdRbTRGWEpsVmxn?=
 =?utf-8?B?Z0c3eG1ISklHeWdFcjUvemYyK2VXR1JNOWN4bGxOYWVKNWc5UWZQL0N5bVRN?=
 =?utf-8?B?OXBXb3NDTHpuTUNZeXpCekdmOGFZbEdHV0pNdUIwZ2poQUhLcmFpdkwzTXRs?=
 =?utf-8?B?WGRJRzZ1MzN6Y244ekRsUWsrWmtQVlZJdnFmN1grOVJaSDFWU1NQNWR2OGdG?=
 =?utf-8?B?YzFRNHh0bTZzRURRMk1OY1VNeUZRQ2lnc1JoVU92bUZtZkU1NXZVaGFDbVhr?=
 =?utf-8?B?N05FZ2FLSTdzaHM0RjRROEdKSy9IcFNoZWdjNG5CZm5od0MrWUJadFJNK09N?=
 =?utf-8?B?ZVNXbmpnMkRHRUxubjhKTEdaQ2JRTGlVUzRVWXllemJIZ1ZDNy9QVkNZZStZ?=
 =?utf-8?B?ZVNneENCLzRXYlBpazNhYXoxVDVRSHp4ZHZOYVhTUHRRUlhzOFJKUytNYjFZ?=
 =?utf-8?B?U0hUeFpGemFMeU9jRmg4NzNPWUJyblI5Tm50NUoyeTNTeFNSZm1LZTRXM0ZO?=
 =?utf-8?B?WS9lMGVZRkhlV1YzTXJpTDd0bGRWNml6UXpZNDZwL0JCUTNUZzRBYm9CdURR?=
 =?utf-8?B?Z2RUcjZIcmpiQmVSak5rVEM5ZXplcFdJdG00dFgwenhhYklqQWMzakVtQ1NC?=
 =?utf-8?B?M3pWcVVNaGppSUVLVmdSRXdNUXNkTU9XaURlZVJpVXgrSDlIcnkyREhKay9p?=
 =?utf-8?B?NUdjZVorNGxuUjVVN2NkSEFmbHRreEtFSjI2aUdjOUJZQVQ1UFNQR3N3L2Ru?=
 =?utf-8?B?YmNTR1VIT0ZweHFSNnNUelhMQlY5dEk3SnBreEhkVGM4WUZpS0VWbSs3QkpD?=
 =?utf-8?B?eDBsazA4YmVCVEQ2QzVVa0VxQXJaYWNtMzhYMFhxVEdBcVRnNktLNUk2eCs4?=
 =?utf-8?B?NFdMZ2w3cDU3bWpDMFBBcDh1UTZvRDFPYTRTQUNienZwelRYNDBTK2RtdGZR?=
 =?utf-8?B?R0RGbVBzaGdZaXJndSs2cmJTd0tmM1FtTVZnN2JMak1lOTA4Q2t0NCt4dFB5?=
 =?utf-8?B?OU5uU1JmNjc0MjBRM2xwK1ZCVGRYTDdpdG52dHdNR3dyNGo4YnlNL1pPUUFV?=
 =?utf-8?B?Ky9WUlhnNUhVTWI4YzhXa25HVGZWV0t1WGdtdE5DQ3pFdjhReHRLUVROUk5m?=
 =?utf-8?B?a2VaMDhIbUx4RkFqbWJQaEJCbEtlZmxES2tUd09HUUNza25JTW1vYlZwUXdh?=
 =?utf-8?B?c0dsQkFJZTNzRGpzRnpaa3Z1cnFoa1ZMcG1sR1hKcDJoRnozZnN6RTFmNnV1?=
 =?utf-8?B?VXlHT2ZlNm5ueVVoWUd3b1BiNWNIbUs2L0N4YTVaMHVxVEEvTmd5eWdHQjZz?=
 =?utf-8?B?SzZZVU1aNndVSmNxQi9PZTFQV3RrbFFhZ1AvNXMzbHlHRC93Z29ZR2JQdlZ5?=
 =?utf-8?B?eVBQcEw4Ny9OOHhtZlladUtuUk1EdlNJbCtCWGRWaFkxcjZ3Rk5PSkxjMmlP?=
 =?utf-8?B?U1EvM0RCS21UOEw0MmQxay9JaEpINWpYWDBqTStPV0VGR1Vzb2plRDBDRDFr?=
 =?utf-8?B?MzVwaWE4MC8rSjZHUC9FKzdSN3BpSmNMOVRaQnRCT3FzbVJ3OHREZVovMmRN?=
 =?utf-8?Q?Zw2wm5jBINgzvK+vRodf8LL8QKzvkdjRWpsFEe2MU4Rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlJM3FweWI4RVQ4MS9GRjFReTFWcjJDUEJmS3hqTmxWbWVvTXFpOWYxRjBK?=
 =?utf-8?B?R0VjczA2U1FZbFBYS1N6eUtURHZQZmxyM2VtenhMeW1meWVNK0c2QW5NZHFD?=
 =?utf-8?B?TGdkUXl5cEdZQWQwY1o2eDJqQUFmcUVnU3NraEdJNnoyTk81ZmdBQ2oxa0xJ?=
 =?utf-8?B?ekxJWFhQYVdWNDFqNTV0SG1jRWhicWY2WUlvV1I2bVMrSStLUlBscGE3YUdU?=
 =?utf-8?B?NkNubHp1RGtKd0FZa0Z2Z0FNQmdSUmpRREhNbzZCdFpidldMM3BVQzcyc1pM?=
 =?utf-8?B?Mzh5ZmRndEdpdkhHeTNMaDR4VnJ5QzB0NTJhaUg5SXdmVTJSaG9FdW1lZzlr?=
 =?utf-8?B?MmMrVVI3dzc2OGdjN09JeXFPRnFSUnVNb01RZWVObHJSU3BkdXBURjNBeFhD?=
 =?utf-8?B?UEFLQUovOHVnWGh5U0NzN0RZNWpqb2Z3L2tPa0E5MzMwUFpEREU4blM1ZGF2?=
 =?utf-8?B?OXJ2QnZaaCtJL0pScWwzZGJFMzFXKzhacW5vL0V4UG5mRnJrb0xZQ1pObFA2?=
 =?utf-8?B?ZWxpU1Z0Ri92QVJIdVExMXlkLzZSUEd1TlloRllWUG1uMGRQenk2N1RlaUxF?=
 =?utf-8?B?ZEpZTGVxMjU5R1FJNU93c2xxbXdKdWFpd1FuajZxUDRsN0hRSHBGbTBIVWx1?=
 =?utf-8?B?UURoeWpFV3I3S2psM2RxY0RrR2FUZ1hLRFlxb3ZlSWhsUE0yQmRoNnRjdENF?=
 =?utf-8?B?UHNjWHQ4OTRBbXlJOTZJM1B2ZXVQMjA1eWRxQmZSZkRGMll1UlNkd0IwK1R3?=
 =?utf-8?B?OFFSenZITmFVUjZFUTI0eHphWmVIdkIyNk5oWWhiUkMvdCt0NndmMWhqUmU0?=
 =?utf-8?B?TVErOGpIcUM5UC9zU1N6dkVoTitlOFQvZzE1WWY1Yi9Edmx3MjV3dHM0bFRy?=
 =?utf-8?B?VDZZTDJ3dzdlMHArc3hPTkpNS0xTQ0hSVytyc2pHZ1ZKNHFuais2dWw2R3c5?=
 =?utf-8?B?SjZLWFJtdEFPaXhBTFRJSlEvbkc3NklkM0hzOUhIdFVZZWlVckJnWnVhUFI3?=
 =?utf-8?B?RGZGeks0MnlMSkwwRmZ6SU1OUTFkb2JIM0ZETWt3MkRkSXVDT2Y3OHg5QUNp?=
 =?utf-8?B?dkJBQlNzTUFMMzhKUWRrSTRJWEZIazRVRVVLcWFVMit4NWl5dWxIMGtWYXc2?=
 =?utf-8?B?eWdTMDdmRG1NeEdoaGdIdUQ2UEE4SHY0OWI0eGNMYkxId2xkNjJCMEZKNkpo?=
 =?utf-8?B?Ry8rbFg5WHlCbVV0M3dyTUlKNnhHaG04VnpTTHoyMWJQZzluOVJRUXl6Mk5I?=
 =?utf-8?B?YVIrWUlEODRFRE9lU2crdTBMbEYvVWhoSll3dFdGZE83SnN1UVZuS2dwcjEx?=
 =?utf-8?B?VUNZSFgrdTJuVFB1TGhsTFhhY2FndXhFNFZYRklEcTc2NGNYWGF4ZFh3Z1Vx?=
 =?utf-8?B?d1NRbFdkdTFFb2hXK1hFaU5yVmdBS1JQUC9paVpBZ1A4QkVVcHEyeG5ONDR3?=
 =?utf-8?B?V2NoV01CdEpwY3lTWGtma0t0QldwaUdCajFwbkg2WGkwTURRR3RqMkpSakcy?=
 =?utf-8?B?Tmh2UkpqUGpOa254VmlEK2ptaXI4ODFpd29aN29ua2kvZWxOL1o3RDhjRGNX?=
 =?utf-8?B?blMwRm9WbkQvZTBuc1lmQjNBaDBCZStDY2I5Q0t2SWZnWXJvOWV0anBSVWpS?=
 =?utf-8?B?Z0MvQlFETmY3RExJUFJSNFdrT0FKLzdrRHhKYldHUjJPU1JqSHkvV1YvbXRv?=
 =?utf-8?B?T2NrWUxDRmlpcS9UOGg0RjZRK3YvNndCY1l2bDFhY2IvVUJFNHNUL0ZRNGg0?=
 =?utf-8?B?YzcxYWYyUGpOelhWZERlZGFjWVlqd3lQZGR4WDVlb3Brbm9wc3VXOGszelFK?=
 =?utf-8?B?aUR6V0dJYkRJSUFsS21TQ29DdkQzdXBMM2lYamZOY1lNWGloWllham1FcWV3?=
 =?utf-8?B?RU9EVVh0N1VabE1ON0lDdWxTRW1RV0EvNXV4UTk1bVpxMUUvZ0tyWnZhTjVo?=
 =?utf-8?B?ekhqVE5MR2QyamJlNHNBWFc5cE5EYjJpQjRLaFZQU0NnYmt6WGQ5cFFlMzlF?=
 =?utf-8?B?dGpEU3Z4Z2VhSHVVVWtBWW5rUUhqMVFNSnRhcndyR2xpY2cwN1RBYzgzZlBS?=
 =?utf-8?B?cUlZMDA1eE9FTjErZHVjbDJCby9pNm9KZnJVcFdReTlJdUJiMk1FRkxMMGMy?=
 =?utf-8?B?RU1CTEsrZyt4ZkhhODFuZGxWa1JUaFlkZWNYTUFRZlFIaENYNWVxcDNuKzVm?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 876fcc51-f7bc-4dce-1158-08dce1a1f4c5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 22:48:09.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wuw+WdCzP9tEYt79zeAzVyHCeH/J+4M4j5kM8jtWidr80c3xkFTxRDZ6mD6rxlxbwm5Sj1ynbDV1zv5WClsAJTLQKrlVzFYLBxzysMQWWrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

On 9/30/2024 03:00, Matthew Auld wrote:
> On 28/09/2024 00:05, John Harrison wrote:
>> On 9/27/2024 06:35, Matthew Auld wrote:
>>> A few things here. Make the two prints consistent (and distinct), print
>>> the guc_id, and finally dump the CT queues. It should be possible to
>>> spot the guc_id in the CT queue dump, and for example see that host 
>>> side
>>> has yet to process the response for the schedule disable, or see that
>>> GuC is yet to send it, to help narrow things down if we trigger the
>>> timeout.
>> Where are you seeing these failures? Is there an understanding of 
>> why? Or is this patch basically a "we have no idea what is going on, 
>> so get better logs out of CI" type thing? In which case you really 
>> want is to generate a devcoredump (with my debug improvements patch 
>> set to include the GuC log and such like) and to get CI to give you 
>> the core dumps back.
>
> Yeah, patch is "we have no idea what is going on, so get better logs 
> out of CI".
>
> From https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638, one 
> example failure: 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/re-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
>
> devcoredump wired up to CI with everything thrown in sounds good.
Just in general, it would probably be worth generating a devcoredump on 
this failure anyway. You actually have access to a 'q' object at this 
point, so just calling the existing devcoredump code is trivial. 
Although we really need to get 
https://patchwork.freedesktop.org/series/134695/ reviewed and merged for 
the dump to be particularly useful in this kind of 'GuC did not respond' 
error.

But if the buglog repro rate of 29% can be believed then it really 
should be possible to repro this locally and get all the logs out. And 
even to try with a flush work fix/hack to see if that is the problem.

>
>>
>> And maybe this is related to the fix from Badal: "drm/xe/guc: In 
>> guc_ct_send_recv flush g2h worker if g2h resp times out"? We have 
>> seen problems where the worker is simply not getting to run before 
>> the timeout expires.
>
> I don't think the schedule disable is using guc_ct_send_recv() 
> interface, so I don't think is related but not 100% sure.
That just means that it won't benefit from the same fix (aka hack). It 
is entirely possible it is still suffering from the worker thread not 
running in a timely manner. But it would need its own explicit flush and 
retry prior to returning the timeout as it is a different code path.

Although as Matthew B says, if we are seeing the worker being delays for 
a second or more on a regular basis then it suggests that something is 
badly wrong somewhere. Linux is no realtime OS but that kind of system 
burp should not be that frequent!

John.

>
>>
>> John.
>>
>>>
>>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
>>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 80062e1d3f66..52ed7c0043f9 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct 
>>> work_struct *w)
>>>                        !exec_queue_pending_disable(q) ||
>>>                        guc_read_stopped(guc), HZ * 5);
>>>           if (!ret) {
>>> -            drm_warn(&xe->drm, "Schedule disable failed to respond");
>>> +            struct xe_gt *gt = guc_to_gt(guc);
>>> +            struct drm_printer p = xe_gt_err_printer(gt);
>>> +
>>> +            xe_gt_warn(gt, "%s schedule disable failed to respond 
>>> guc_id=%d",
>>> +                   __func__, ge->id);
>>> +            xe_guc_ct_print(&guc->ct, &p, false);
>>>               xe_sched_submission_start(sched);
>>>               xe_gt_reset_async(q->gt);
>>>               return;
>>> @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct 
>>> drm_sched_job *drm_job)
>>>                        guc_read_stopped(guc), HZ * 5);
>>>           if (!ret || guc_read_stopped(guc)) {
>>>   trigger_reset:
>>> -            if (!ret)
>>> -                xe_gt_warn(guc_to_gt(guc), "Schedule disable failed 
>>> to respond");
>>> +            if (!ret) {
>>> +                struct xe_gt *gt = guc_to_gt(guc);
>>> +                struct drm_printer p = xe_gt_err_printer(gt);
>>> +
>>> +                xe_gt_warn(gt, "%s schedule disable failed to 
>>> respond guc_id=%d",
>>> +                       __func__, q->guc->id);
>>> +                xe_guc_ct_print(&guc->ct, &p, true);
>>> +            }
>>>               set_exec_queue_extra_ref(q);
>>>               xe_exec_queue_get(q);    /* GT reset owns this */
>>>               set_exec_queue_banned(q);
>>

