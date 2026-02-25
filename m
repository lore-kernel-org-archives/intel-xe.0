Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B5EFD239
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 10:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEC910E229;
	Wed, 25 Feb 2026 10:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BH/6/90X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EB810E229
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772014226; x=1803550226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rm3cXDJYY+AuH2EwPZRFN/sCtTFffqvz5pWm3NZXnVc=;
 b=BH/6/90XqGFP31jwGWONBC2sRrNhytC8gY9uHzrAgt3Getc8Y3Y3LUbT
 qA6DRMCxv/rPAx0mHNlcvKeMoIKjxMXFxtisasKXPBw3au9SYT5Q4IUKg
 aev5fsdmFWvV6HbNdzCFI0AKL4VrVJoBuILzxIpZ+e8mRste47M8AZ9+3
 0MUm+OpjwtdFwoLchPI5bv3DGscurnswDWuApdbMiWJmjIKHG/RtPa4hx
 cdz2Uy1bpFvG7aOWf1WevMaRL7PAIvbSm6zr/vnUaf/G0AP+zBxndZF4i
 qZVln6qCA/V2LOgfICJq+v550MqQ+scJPijpG/GI8hVfOlnCzgE8SR3v9 w==;
X-CSE-ConnectionGUID: bOeGIgsdQiGU8q9AxbiUlw==
X-CSE-MsgGUID: 9R07o03tSsaZCSunpTB1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73091200"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73091200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:10:25 -0800
X-CSE-ConnectionGUID: njbXSLUdQCKEdVkL2dRr2Q==
X-CSE-MsgGUID: pkFKYjtgQf2l62MszlpTZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215300494"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:10:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 02:10:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 02:10:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 02:10:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HicPt3vBJQH8VTNaPZj+kRcSkjvKJD0Lp7Iv9CGUKWYyFarWINHJzriWW/vT6xZ7J8XhNe+jqTNK1YSSEcWkiQdvJcJ7VDQS55pBu1iVoTDeuxA7/5yJzDfH1Nu95+mxT8gtwchhL2lO3fHZEBbmPouQbxxm0r0CGD7OJ1TOzL0YKPx7hP5b0aHqwOV5y5f5WPnxaBi6Ynu1dpKbU2qTQ8n6C2MJw6mhyQQ47SZiS3AI2Y7I9pO7eKLReEXLERcDoz+9MkzoRhmdfX1wqqn1pDlf4ssZT6OrTipcz/5QNVGaU9BSqCn9dJX82X/rvMl0+h1PNQ9GOqE9WjvtNOwcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDJdm/Mo66egYyxrSfEZjjORHFt5xdHABR9khW6sN9U=;
 b=c6hG+jMbsy0r7OEeuT/QFAiEbYfQzuY+4yy2bk0xVLJTMkg1ZbQOBJV5HWY83/TyYhuqtpfhGzkaeMTZkYgfK0IBMm9FL9UPOwzCS5yjiOGA1U1FKCW45WAnIbNaqlLYIuhzrG9JAnSjoQIvKtU/KzLFwCGrjGOGbFRoR5B7NnFiSxIx0KMUw2yEE2TrnIPVTCBuN+DACVmr8xJEAYKVwQxWtVE/HWUA+IL/8GBtje/IF5toeqsQZQHH1hr3FQx51eb4VZapkguvqkofJUQApcYpUOtEuqum6J5j8oRgyV/o5B4pNA4NXaUMBWU9fP8uXY7BfbTaOldlgooBIQxsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 10:10:22 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:10:22 +0000
Message-ID: <607bfa10-cb3a-4696-be2b-5d5246591ad7@intel.com>
Date: Wed, 25 Feb 2026 15:40:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
 <20260213081644.2085314-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260213081644.2085314-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0099.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b9::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d82b8a-7d9e-4ae1-a795-08de745615f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: FRz4zlIspYCX1OYKoWwP6guox2QY/hrhr9WvDMpdo2Q7tXtzRcOcNwMlfF4j+SfVuvfiBUKMZDOjPp2FOc61ijh8mmcLEbImTKkwA9pccrQBBJMfNv34J8I4/J4hgUFBscnqnsB49H4b9MLrUEzuDvfTUwtTJsqyEr9h6Srz+wrpd5oqcKIIuETEmjF0VNtq99jsjWml4hz3FpNw+tK2xs5l9od+8Wm/9Wt9jJTZsx5tJ9BGq2DYJxhuJLWpNzgm+Q2B1zVOzM2YeUS5ijoxFfgnV35X7jaDolGIbgxonFuD2esgmxPZ2Pvjwr8+MvT8s8t9pE3NUSuzUFL+wDLagXhS7xUl8uzBgqDxSlTi4QGs2mJOudEUXy6vLRL15HWU/ttTEgo8Pkn+T6LimPT4wXA9p4+CEhWDDcI3x4osk+4xAeBrwaFlD9eZGJEHs+V4HAnT/1v0npaq0Ztg2+WpfO+YMWgIwNz9wIkCqT92f5m/hXF3T8ETDpIzNP30PkOWvrvyLPFPpHviHbcybla0Q9r9wB/P9iZVeTeLkheR9j+QB1YmPEhBmGbqJxWH8YembpocII2bkni+oDGR81inJ7P55PPlKKN/g8eUdH1SPR2IWHKvbYh4I+hvkvpCOZD5VZqMwjlFE6w1N3+xpyEOlIB2fAZOD2Rz0vbaCJonL5w8JQUC/jluo7VpyFvMlz599HH9Z/4qSXSj0b6W4uxMPSI8xkvZLxo+REbg3gy1Lnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJPV0krWXg4bmRza3hOa0VkV0dTSlN2WFhRdVp6YWErUXNsbHpaZHgrVEcz?=
 =?utf-8?B?RlYvRnhhV0cyOE1US2ZGakNnbEVwMW5raGlFNHloNVRUUTVCZmp0c1R0K3lY?=
 =?utf-8?B?QWx0RmtZakYyRU9oWlQrazhjcm0yNisyRTV1dThYZG4rcFF0UFZQUlYzb2ly?=
 =?utf-8?B?d1pLVlgyMzFManQ2WkorTmh5ZUI2dkdzTERkY3hxRkpkcFQrWlZNR3pxME93?=
 =?utf-8?B?VHc2T24xKzB6RkwyOFZRNWJpM0UxZC9BV2g1QXgxWk1mVVIvNC9lK2ZUMlNk?=
 =?utf-8?B?cWJxOCsrc3BCZG9uODVncW9BN2N1UmhJakI1VzhTYUJ0RGhxUlQ2Zmw5amx2?=
 =?utf-8?B?ZGJzY1E4YnBhSVR6ODIvdTVrK1k5UkFndUowaUxZQzNVWER1V1NlYnBnSG5F?=
 =?utf-8?B?cnlHQlhrVWdCei9mZUd6VXpPZzB1cnJvMWlhZUoxV1FGL1kwZ3YzcDQrSFI1?=
 =?utf-8?B?N3I5QjZhTmYrVDhpblVYSTFlUGY4VjdvN1VQQUNGdWxxVTRqSmNmQ3IwZk1t?=
 =?utf-8?B?eTlJRnA5cVlSZllIQVlxUmorZnJMQXYxL0QxenUxaU41bDQ5MW5oQUNlU3hS?=
 =?utf-8?B?ZERXeXVqTnZBamt0S1NMR3J1QjZNcUVHMXJRY1M1bitNejJEaXRwWnJ2ZHEr?=
 =?utf-8?B?ZE9qdEZkaEZGdUNmTEpBa3NFTGo4c1JuODZyUE1YRFdtS0QwQmFzMEk2b0RV?=
 =?utf-8?B?VW9oYWVLYzBQeldmM1AzR3p1eHI2WHJweS8vRkZvNFl3aDBORTYzU0FQN3ph?=
 =?utf-8?B?SnBVd0JLbk4vcVN6SmFwQ1pmMU5zU08wRElmZytFQ3RDWlRCaGFXcHJ6RmZD?=
 =?utf-8?B?MUlHd0tJQWMva1kwQjBCZkZmM2dJS0NLVVF3QVdUVmtlUFh2WEpZbVprTElZ?=
 =?utf-8?B?MHFOSjROcHQxZ0hLdGtNVW1tNngwaEQxQWJ6Wm4xRmt1MElLdWxlVmZabGNC?=
 =?utf-8?B?aE15TENMSVNkVDRadFRqalBVZytqNWdPRDlZT1RVTTdQSEFaYlhVZTY2UDBO?=
 =?utf-8?B?N0U0REpaRnNONEVPcSs4a2pUV3VVcFlteFNFbjBLTWZMVno5dDg5VURQcGJ5?=
 =?utf-8?B?SVFFTjc1YXpielZ3cjZNYXpwMGcyWDdlZWpnYjRzVVFhODhiRXdKZ1dQc2Fh?=
 =?utf-8?B?MFQyMktSMGQrUEt3UnNnUFE3K0xLcHhDVzFHdDhUamxGMFJDSWNjWVovWlRX?=
 =?utf-8?B?eUdMem5BNHZBbXVTdXZxTW1XSjFtTHRGbGwyd0gxb3Nsdm9Nd0FCNkVNREZu?=
 =?utf-8?B?eG9FQ3FqL2tVUE1YN3R5b0xYMllEOHQva25OV0xUUVJ0T3RHZUtLdlhIUnlt?=
 =?utf-8?B?US9rb0xCTTdodWpQai9MUXgvcm8rcWVQUUZkR1IwaDdmSzV6U0hUN1o1SXZZ?=
 =?utf-8?B?eHhzQjRDZWw5T3ZPU0RyWjhTaU1KZm9LL0JEeXRKV0NFNmVFZ0pNZDBSa1dK?=
 =?utf-8?B?Z1ptSzIrRCt4akR3dTVpWk4zckN1QUZsdmtSbTdNY0lXQk96Sjg5UkxETDRr?=
 =?utf-8?B?bVg5MDhKdFI1N2c2MmNWMjd4U2hJT3lPR2dVbCtVUjk0SjNEMHZQVitDWW1u?=
 =?utf-8?B?U1M2OGZkRGw0bEJXNGxCbGtiS3B3elJ3L3NYWnE5UTgxNzNIRGJMVzVLZkxs?=
 =?utf-8?B?d3dBZllGYlczcjd5VVIzaU5uakE0SFVuV3JJMWdaNG00bmtHSG9xb3FIcElR?=
 =?utf-8?B?bmlkWm05NXZoajE2WU0vekNZRUp0cFF4YVI0Y1hWc3R2ejl6Ni8vRFQ2dVdv?=
 =?utf-8?B?RSt6RmhvaXRBVCtIaVU5cjVRa2dXZmhhM21NU0ZkMzBudzIwOHdZcUt3WWQ4?=
 =?utf-8?B?OGRmeTQ1dGhxL0Znd1RJNE56L0hxUTdDdFFpcDNQMVFaYnRXdEVUVHZQU0hm?=
 =?utf-8?B?ZFlZNEsyTVc1U1BORzFVWlZiVTRDYmQxUHpiMlhucXRHL09sb3lvT2V5TFBW?=
 =?utf-8?B?QzAwdm5OSWJlWHNjRXFPcnAzRzhXWXFSQXVwTnVkSlQvZ2JWNDBSeVhaNFJq?=
 =?utf-8?B?OFplTlRDUHRhcld3VjMwU1NBUnd0eldGTUpRdUE0N2xrUFgyYlJyR1pOYlhM?=
 =?utf-8?B?NkdTTk54a1I4Rnlob2lvekJ2bjU3RlUwblBOcWg5WXdoWHQ4V0FIaDJQQlg4?=
 =?utf-8?B?cm9DV2RZNllmZDhDcU9WYWFXSDR4T0tkaVFhYzE2SmtZSUJyYzYvdDJzSUc0?=
 =?utf-8?B?b2wwMEdoQThsMS85dERLejZSRHcrRGtyNlB6dGVIVCsyQXh4UFVDTXhtdEMx?=
 =?utf-8?B?WW5pMzZLNVlKT0NFSnRDcU1TaHJRVFdPeXRhWXpiTk9LZlFEemJEaG52bVB0?=
 =?utf-8?B?M0N6c21hRUpJVnZRSUZiMCsrMXlnak51L0lTWFRPVVNJS1FIbFYralVkaWJN?=
 =?utf-8?Q?RY08hB03Cna1CBOc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d82b8a-7d9e-4ae1-a795-08de745615f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:10:22.1168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THQH15ye9nE3sTDysGac2DzyNfh3DI7V0VzyzbPcpphPzrrq3hWT9FNk+HKtn+DJ708NEdNyTCL1K8sZ/3xiPDSX1uRJoDu2dmrPUuXwueg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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

Hi Raag,

On 13-02-2026 01:46 pm, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add worker for scheduling
> system controller work.
>
> v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
>
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>   5 files changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>   #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7560a45f7f64..9e49e2241da4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   
>   /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   				xe_heci_csc_irq_handler(xe, master_ctl);
>   			xe_display_irq_handler(xe, master_ctl);
>   			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>   			xe_mert_irq_handler(xe, master_ctl);
>   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 430bccbdc3b9..aba2166650aa 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -7,6 +7,7 @@
>   #include <linux/device.h>
>   #include <linux/mutex.h>
>   
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> @@ -28,10 +29,16 @@
>    * with the System Controller through the mailbox.
>    */
>   
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>   static void xe_sysctrl_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
>   
> +	cancel_work_sync(&sc->work);
>   	xe->soc_remapper.set_sysctrl_region(xe, 0);
>   }
>   
> @@ -56,12 +63,6 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (!xe->soc_remapper.set_sysctrl_region)
>   		return -ENODEV;
>   
> -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -
> -	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> -	if (ret)
> -		return ret;
> -
>   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>   	if (!sc->mmio)
>   		return -ENOMEM;
> @@ -74,7 +75,31 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = drmm_mutex_init(&xe->drm, &sc->work_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   	xe_sysctrl_mailbox_init(sc);
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
What will be happen when multiple interrupts arriving before the work 
execution?
> +	if (master_ctl & SYSCTRL_IRQ)
> +		schedule_work(&sc->work);

Please use system_percpu_wq instead of global system_wq in order to 
reduce contention and improve cache locality.

Thanks,

-/Mallesh

>   }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index ee7826fe4c98..5919310b9db9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -6,8 +6,11 @@
>   #ifndef _XE_SYSCTRL_H_
>   #define _XE_SYSCTRL_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   
>   #endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index d4a362564925..bfaa9ad085ce 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>   
>   struct xe_mmio;
>   
> @@ -28,6 +29,12 @@ struct xe_sysctrl {
>   	 * messages to help distinguish message boundaries.
>   	 */
>   	bool phase_bit;
> +
> +	/** @work: Pending events work */
> +	struct work_struct work;
> +
> +	/** @work_lock: Mutex protecting pending events */
> +	struct mutex work_lock;
>   };
>   
>   #endif /* _XE_SYSCTRL_TYPES_H_ */
