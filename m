Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE86CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 16:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ED010E7F0;
	Tue,  2 Sep 2025 16:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZc0vyvC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4903710E7F0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756831801; x=1788367801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cZ1f8s7G+ufVpKOKsQ8zB8FvuHwBcowpxkeUYDSecCw=;
 b=aZc0vyvCFzybmY9GFjGmbMDZTq3FcK9rqFhTfrP5HCeFxtrK+nad0Urs
 tY98hU2g/S2Zr3fRA3MpEqjFtWzYNzsI59+u4DukJtxMh3CZXrRdb6gfV
 RnplfEeN4MKc+jmLM4ybS2IgJkIOFFUALWB5h7WG5gIFbqI35F5gDC+gC
 SlVe4z/nuvmgH41TDZU/1/xHHyfQSBAuqrNyD7jbJJBRzSr/dpFiG7MdI
 71vBWPCfxRFCgWqK+Y4XWlJqhkckQn3hiQP7mFZsVHPZ/QPOuxn+F+Tsb
 NwW6hjSHnaoJjV9f1vYa+Yg4SlSDGsT8O1xhcJGx289uukJXjmu+tVNwc w==;
X-CSE-ConnectionGUID: FSY/m0DYQmil4Am08bVuEg==
X-CSE-MsgGUID: mx+mE8weQzWE3UMp9IHbEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69378083"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69378083"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:50:01 -0700
X-CSE-ConnectionGUID: tMHoqJz+RraeyULRcVZHXQ==
X-CSE-MsgGUID: w+fw42JzRoWMARjrJwt4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175704442"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:50:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:49:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 09:49:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:49:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Elai21O9JVX6bf++FyaR0Uyxzpqpjy4s1RL1VyzslhC7ugzAF/rUZzmCmCdi4gBrFQVSYa8Rj3F3ma9zB8hMjdglUc8imlIpUp75SQbcOMtVjcwm1N++tkCPX4ju82m6HPI8JQb36kQJYaoDXgJO6Yn+Wzywwt2mhaCKyw83d2Bhciw6avHI1AGua11Sk523CxL4sEJl3eEnUcZJ/EqR7VWg6djbSUaDfoYDlK9RcmTtTDOFJFz6F8I3Uox39+C5v6OdrobsdlCA+dfHShAABFFbcq0eZIoCeZW8eQGa3oKuzeBooztH7zoD45BMGk4fTrK/UeRgIWUUihIDn3Q8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUjBPjMQAIqkJUezFBD6l1KuRAF7rduKRvNF0DWzcoE=;
 b=U0HexaW98gMoAel3XRO9HJitWiZ3wmB3iIyRoSSo7QkNosTEaUn2WSoP8eglHoQaYTNkNS0DR9wve0D/8QLuQR6wx/zK5y7ogjaptq56ZVUOK+aGYMN6bhIzy/sLuDpOprmTTAsrks5p7MpacdyJmZVkFyb4Ers6CMlrgjxFv6pd73Zndo2wSRszo5i+/blHJA5PdyDsULdkU/qaStdSFlHGEEF9Nx2CgiH4CMSCTCE0esYNEHsAAtjD3BHp6Nu2AWx1s0+j19EH+XD9JT/pPkgUqhjYanZxXfedy2IYCWP6g0PIVBVfjXoaf+LIBdGaoJPMLFV2hCEr+Vq3iMctFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 2 Sep
 2025 16:49:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 16:49:56 +0000
Date: Tue, 2 Sep 2025 12:49:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Move sa_info from gt to tile directory
Message-ID: <aLcgMFriYWNJ9aZz@intel.com>
References: <20250829201106.1263-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829201106.1263-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba55840-29eb-4d1b-8eb3-08ddea40bf43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHM4T04zYm5oRFJ4V0lMdjd2NnBRbVJnSGR0MEpNblcwaXBlQUVaSWdZaWxX?=
 =?utf-8?B?Z2pWcUcrMndqVUNpUjZiY3hrU1k5VUFnNHZoeVc0aGZLSVBZK01XZ2hta3N2?=
 =?utf-8?B?T3Z6cVowSDVMSWJsVUNDUlpaUXdDb3hHejlxVEoyL2NBenB6QlpqQXlucDlF?=
 =?utf-8?B?VlpDL2tmNzRJdU5yMUZTSmFpUVhLN1ZHQVpTU3gxeFFjMGYvSitPOWIyZHZH?=
 =?utf-8?B?czE2KzhHQUtndWpXTFA1b0tJZzRrU0hvZkhiaEprTG8yWlpmeXVMa0NXZ1Ni?=
 =?utf-8?B?WjcwWFNzWlRJOEJOTzAya0VrU3ZMMHljanZUZzNZNVpIV2czZ0xzZUJRejlv?=
 =?utf-8?B?TXNDY0FxWG9Gdm1ZU1lyK1JQV3hEY1pGUHhHeERZZyt5aGtMUE5oK2grYzdU?=
 =?utf-8?B?ajRQeHZTU3JyMUdlQ2ZhUGwzMUxxWjNxS0hZemRGdWhET2FybGJvc2VGdEls?=
 =?utf-8?B?ZEFQNGJUOVZObEJBSGFoTTUvcUJ3cmFab3V2Mm1zV2FvWkRHOE41QWU1Rk0w?=
 =?utf-8?B?L1V0MHdGZTRlKy9tM0NUeE1sb09Ia0EwMnpWL1NtS2U2TzYrcVNRQmFBUFNh?=
 =?utf-8?B?Lzh6QTlvZ3hCVzZudDBYaHVLUlVIaDdSNGZTNU5uZ3BaVHViVDJRZTR4a3Nt?=
 =?utf-8?B?aUVYRHNwM28veEVnZnBTVG5wdTJMTDZVOUdIY2lFYVN4aFpDNDdyUHdCMzBx?=
 =?utf-8?B?UEltNGhlZG5JV0NOTThnTldPM0JpcFhtNDk0d2RmWGJ4OVd6MjExSnpIbFh5?=
 =?utf-8?B?MlNmNjJJVDlxbmhodHZTSFQ3cnRCUzhvRXRSRnk2alM4MWRCdmRpMXVMNnVU?=
 =?utf-8?B?S3drQ1N2U0REdFQzSHVaNkdXdytGby9VVU8rT0RlQ3p1MGVvU2FGbzRuYXJu?=
 =?utf-8?B?RG1OVDZMVnBxTFgxWUZpcVJLUHJFbERROE9aZnNkcmJCazhnV1JhTnY2cHZs?=
 =?utf-8?B?SmRwVnU1N1FtTnluaS9HY2YrRkhFWEU1dUlTQy9zd0YyVHNTUTBBaHZSM1Rh?=
 =?utf-8?B?RVV4NFZ6VUpoNU4xUk5VaS8zSURROEdqU3dwck9tdmttQ3JEbHVZeGtpdGNK?=
 =?utf-8?B?RkI5YlVjanBtQzR0SHRFS2hocVJSYm5FL0pLV3VOa25PWkNwWDY0ZnpJR2I4?=
 =?utf-8?B?cXlHK1o2ajJLUHB6S09XaVk5T0xKUTRCUUhuY2VPNEgxRGhVR0E4aFgrSGNx?=
 =?utf-8?B?bWJrT29QY09HbjZnQzJsMWUzQVBsTUl6dGJvUXdaV0hBeURYd2FCUjQyQVNC?=
 =?utf-8?B?aUxleXNORUh2ckxuMXVIVUxsRGkvZjJXWUJUeXpudG11dmVERVo2OUdQcjlu?=
 =?utf-8?B?bXI4ODlqaDZTeXJNdUZ0d0xKN29kNTVQMyszL1ZHNkp6QTA0elQvbjN4bkV2?=
 =?utf-8?B?dGVNcTFBYXdsTndRYzFicHgwL0luTXVNVStpcTFWbjdublNwYWwxMERnMVU5?=
 =?utf-8?B?eGhzYjBxYXo5dGpRM2R5QjYxSWcrRmNBSTU3Q0NRUDdvcDMrU3J5eWlmbW83?=
 =?utf-8?B?N3ZTd3FKN1l4ditmdnVYTFo2MnM5bU01Tk84KzllcHQ1VHRtNHRYR09vNnBp?=
 =?utf-8?B?Z3Fua0lPSlNwUWZ0SnN3UVhlQmZ6SVp2UGlzREozeDlOZWlNOVpwTWcwa1RG?=
 =?utf-8?B?R3dvSUhpWXN1SXdMbEZ1czJXWGZ2RDF3b0gwc01JT1RRRGhwbkVRRS9ZWUw5?=
 =?utf-8?B?RVFiUWtrUDBZOXJGM2EzdHd2NTFndm91TFF5K09tT3BjQkZIT0IyM05KdWJH?=
 =?utf-8?B?TG84RWx2Sm1jMFF0dm90WTFQQzJpeGhjLzhNYmlJUXhuVlIrbnVkNWYwMitj?=
 =?utf-8?B?VEZFL0k0RGFhSkFHbytobTg1aHlNcUoxRVFaVXVqYkx2RHA1Q2NKeGd6bUk3?=
 =?utf-8?B?Y2JpVzlVSjd0aUxQd1BXY2tnOXAyZkgwNjA2ZHgvSkpaWVc5RGViZzNVbm4y?=
 =?utf-8?Q?/hq0G79zJvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTVSU2hvMmNFcm52a3JlV1c0dS8rTzQ1RStNdm1LMmd1blRNOUNzZml1VnZ6?=
 =?utf-8?B?QTNwSzJEdER6ZWlUM0J5aUpYalBYcVdzcVE0enN3OU9PK2hyTGdsUFBkOVBQ?=
 =?utf-8?B?c2xOeGliem42UWdZYW9SNlJjSnA3MG83cjE3M29HUERIcUpkRnZpUTZJbG8r?=
 =?utf-8?B?R2FVcUhqc1V1RGZXeUNGT3IrNytKLzVuTGx2ZDgvdmw2UWx2cjBoWDBqSEp1?=
 =?utf-8?B?Vk0vV2JtM0RSYmFMY1B5VUZ0NVA0N0hkS0x5bTZRZnRhaE9odVBQOUswZnNt?=
 =?utf-8?B?WHVPZW5vU000dVJsU1ZYSkZLaTlVTlFiV3dmczU2ZFFpRXpXWldFUEMwdW0w?=
 =?utf-8?B?VzdqUFlXZFp4bkh3eGdJaHJzS3VsTVhPdGpiaHpFQzhOUTFnTEtkZDI3NnZr?=
 =?utf-8?B?aWNYUXVJejd0MTh2bW5JVkdmbHBlN1lOWWtSL092T3VuL3M0KzVDd2RZQzBN?=
 =?utf-8?B?R2pnUi82REV2VFY0NG02YVVkYmRoL0xBM282eSt1bkNsbDNqMjVicVE2Vkpy?=
 =?utf-8?B?NFB2YVg4bml3L2k3WWEyNXdCZy9reHEvend2eENkc0FuRjdSZFU1WDVvL0w5?=
 =?utf-8?B?M2E4MVcreDkvQ0ZDV0JFSGRiTmxBNkxZanVsNGowTk1iRmtVcFMvZURpbzVD?=
 =?utf-8?B?MHZ5VWZxNm5vbDRkUGY5REdaQ3JIQ3JpL01BUUV1elhsbXhpMDA2VWFvU0th?=
 =?utf-8?B?QjE1eW1rMm1GSGRWMXhpcE8yeEFqNWFNcHRYcEwzditWQ1QzdTVxNWZkVDZ1?=
 =?utf-8?B?ZHJPejVPdUtVL01TVVErcW9mblMwb0tnYWNXWlNWVjQvb3dRNHJwMkM5SXZ3?=
 =?utf-8?B?M0ZNcFZxZUFsNDFYV3lSTVY5R3gwQ1BuOU9FSXgwYjgra2Q5VE9PNHRIK1Vx?=
 =?utf-8?B?QTFQbytJZktINGc3eFdyeGV4eUFtQm9CcjE2WVFubGlHZlJHNDhOTnNLTU9R?=
 =?utf-8?B?V1hENGROcjhab2dwS1c3K1lCOHlJSVNXR2Y3QXJTdkQrWUxaalJ6SVJDbVdh?=
 =?utf-8?B?aUJLVzVJU3FZajFrNU5pZFFhb0RJd1BqNzJFaUhFWG5zSUFVMHFHWmtmUzQ3?=
 =?utf-8?B?aVdpM25uNk1hMXYrZXJtNXgzR0d3SzQyZ2o4Zk5mYTQvRVZhemk5bG5LazV5?=
 =?utf-8?B?M1Q5TXVmZVYwcDgxeFRZVWpvUnVZT1IvQkRtckUraVg5K0dWQ1VmS3dHNThP?=
 =?utf-8?B?d2pualZrc0dxMEYzZ2NCREJBNmxBWngrS2NHYk1GNStSOWhndE1HVEl5MmZP?=
 =?utf-8?B?OXU0UnBWSnhkWDlNVGhvSXRLVUlFTUxLOGQvT1FCRGxwRmJXS1FmeXN5QVVt?=
 =?utf-8?B?R2kxdUE0L2dEZ0trSkRPTTBXbEdObHZWU2RiYWRhdXM3VE5CY0tQT09Ceisz?=
 =?utf-8?B?Qkx1UGY5MEtYZ0tjUHBZQkhsTGtQM3JDODZkaWV0bWxsS1FKQ3JyQXhJdURL?=
 =?utf-8?B?T2duaUdKZ1oyMGp6b1BmRlIrbzlWbzVYN1FqdGYyNDJuSkdYc1RNWlRJVXlz?=
 =?utf-8?B?eVlSbDlVWkIzd1RkZ3VDZm9POWRZMGxvdnNuNVozVXJnUFpPNXFGYmVZOFA5?=
 =?utf-8?B?SStRUFJHMHRPQkNxUkJSdG1lbU5qTHF1MzhMZThjZ0sxMmo1YUcyTzBHYWV6?=
 =?utf-8?B?ZjZyOHVoR0EyZXdBZVBscUlRQXlxNSs0UzJBR0RmeXhPdXI5REpRR3dsL2ox?=
 =?utf-8?B?N2dSU3l0ZHZVeU0yZkNETGNMUEZ0MU11YmxwVVZGTnZMSkJDd0JRWmx3dEgv?=
 =?utf-8?B?N3o5cjRrWUNhNFFUUUg2VE90OVEycWJPS0pweU1naU80d0MyRWs2UElPckxI?=
 =?utf-8?B?ajF2ZHFJbXJWMmc5bXBlbnhDZ1M0aHRscFVBdk44dzFPUzlyMGhvUGtxUkVj?=
 =?utf-8?B?eThrTDhKdk05aCt2cUNreDlwRlliNk5UTytUWjRXaUhiWkNmbjk2YlB3S0tv?=
 =?utf-8?B?RG9QZ0t2RzhEL09OendhcXdkbTI1UFNZbW9BRWpreHEzUkZ6NDIyRXpNRDdk?=
 =?utf-8?B?NGJFcDNuWXZvZ2JXTzlCVEYrSVVQdHorYm5BSm9ENFgweG5HNFZMWVlUb0lr?=
 =?utf-8?B?aFdSRjZudUFsVGo2enU4UlZ4aGJaSmRlUXphdCthcDRVYzJrb3oyNXBwWXN0?=
 =?utf-8?Q?m+ar4wu3UlGMQSwBwHXcaNYZU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba55840-29eb-4d1b-8eb3-08ddea40bf43
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:49:56.7024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llwGf1a29VH1m8N0P3HZRQy43F/rLBi5PCeKR3wmrXut5Z+j/8PsdBqXPL45s9BdsCX5al6ntKLt5xPt1RyvjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
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

On Fri, Aug 29, 2025 at 10:11:03PM +0200, Michal Wajdeczko wrote:
> Our drm-based suballocator is implemented per-tile so it is better
> to show its debug information also per-tile debugfs directory, not
> under per-gt directory as it is done today.
> 
> To allow adding more per-tile attributes, prepare necessary helper
> functions, like we already did for per-gt or per-uc attributes.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_debugfs.c      |  20 +---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   |  13 ---
>  drivers/gpu/drm/xe/xe_tile_debugfs.c | 135 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_debugfs.h |  13 +++
>  5 files changed, 151 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 987e4fe10538..95c0f0a9b403 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -325,6 +325,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		xe_gt_stats.o \
>  		xe_guc_debugfs.o \
>  		xe_huc_debugfs.o \
> +		xe_tile_debugfs.o \
>  		xe_uc_debugfs.o
>  
>  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8d6df6bd885e..4b71570529a6 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -25,6 +25,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_step.h"
> +#include "xe_tile_debugfs.h"
>  #include "xe_wa.h"
>  #include "xe_vsec.h"
>  
> @@ -329,23 +330,6 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>  	.write = atomic_svm_timeslice_ms_set,
>  };
>  
> -static void create_tile_debugfs(struct xe_tile *tile, struct dentry *root)
> -{
> -	char name[8];
> -
> -	snprintf(name, sizeof(name), "tile%u", tile->id);
> -	tile->debugfs = debugfs_create_dir(name, root);
> -	if (IS_ERR(tile->debugfs))
> -		return;
> -
> -	/*
> -	 * Store the xe_tile pointer as private data of the tile/ directory
> -	 * node so other tile specific attributes under that directory may
> -	 * refer to it by looking at its parent node private data.
> -	 */
> -	tile->debugfs->d_inode->i_private = tile;
> -}
> -
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -398,7 +382,7 @@ void xe_debugfs_register(struct xe_device *xe)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
>  	for_each_tile(tile, xe, tile_id)
> -		create_tile_debugfs(tile, root);
> +		xe_tile_debugfs_register(tile);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index bf3a67b5951c..f7a362ac8030 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -123,18 +123,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>  	return ret;
>  }
>  
> -static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> -				     xe_sa_manager_gpu_addr(tile->mem.kernel_bb_pool));
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
>  static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -316,7 +304,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   * - without access to the PF specific data
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>  	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>  	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> new file mode 100644
> index 000000000000..5523874cba7b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +#include <drm/drm_debugfs.h>
> +
> +#include "xe_pm.h"
> +#include "xe_sa.h"
> +#include "xe_tile_debugfs.h"
> +
> +static struct xe_tile *node_to_tile(struct drm_info_node *node)
> +{
> +	return node->dent->d_parent->d_inode->i_private;
> +}
> +
> +/**
> + * tile_debugfs_simple_show - A show callback for struct drm_info_list
> + * @m: the &seq_file
> + * @data: data used by the drm debugfs helpers
> + *
> + * This callback can be used in struct drm_info_list to describe debugfs
> + * files that are &xe_tile specific.
> + *
> + * It is assumed that those debugfs files will be created on directory entry
> + * which struct dentry d_inode->i_private points to &xe_tile.
> + *
> + *      /sys/kernel/debug/dri/0/
> + *      ├── tile0/		# tile = dentry->d_inode->i_private
> + *      │   │   ├── id		# tile = dentry->d_parent->d_inode->i_private
> + *
> + * This function assumes that &m->private will be set to the &struct
> + * drm_info_node corresponding to the instance of the info on a given &struct
> + * drm_minor (see struct drm_info_list.show for details).
> + *
> + * This function also assumes that struct drm_info_list.data will point to the
> + * function code that will actually print a file content::
> + *
> + *   int (*print)(struct xe_tile *, struct drm_printer *)
> + *
> + * Example::
> + *
> + *    int tile_id(struct xe_tile *tile, struct drm_printer *p)
> + *    {
> + *        drm_printf(p, "%u\n", tile->id);
> + *        return 0;
> + *    }
> + *
> + *    static const struct drm_info_list info[] = {
> + *        { name = "id", .show = tile_debugfs_simple_show, .data = tile_id },
> + *    };
> + *
> + *    dir = debugfs_create_dir("tile0", parent);
> + *    dir->d_inode->i_private = tile;
> + *    drm_debugfs_create_files(info, ARRAY_SIZE(info), dir, minor);
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int tile_debugfs_simple_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_info_node *node = m->private;
> +	struct xe_tile *tile = node_to_tile(node);
> +	int (*print)(struct xe_tile *, struct drm_printer *) = node->info_ent->data;
> +
> +	return print(tile, &p);
> +}
> +
> +/**
> + * tile_debugfs_show_with_rpm - A show callback for struct drm_info_list
> + * @m: the &seq_file
> + * @data: data used by the drm debugfs helpers
> + *
> + * Similar to tile_debugfs_simple_show() but implicitly takes a RPM ref.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct xe_tile *tile = node_to_tile(node);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = tile_debugfs_simple_show(m, data);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static int sa_info(struct xe_tile *tile, struct drm_printer *p)
> +{
> +	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> +				     xe_sa_manager_gpu_addr(tile->mem.kernel_bb_pool));
> +
> +	return 0;
> +}
> +
> +/* only for debugfs files which can be safely used on the VF */
> +static const struct drm_info_list vf_safe_debugfs_list[] = {
> +	{ "sa_info", .show = tile_debugfs_show_with_rpm, .data = sa_info },
> +};
> +
> +/**
> + * xe_tile_debugfs_register - Register tile's debugfs attributes
> + * @tile: the &xe_tile to register
> + *
> + * Create debugfs sub-directory with a name that includes a tile ID and
> + * then creates set of debugfs files (attributes) specific to this tile.
> + */
> +void xe_tile_debugfs_register(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct drm_minor *minor = xe->drm.primary;
> +	struct dentry *root = minor->debugfs_root;
> +	char name[8];
> +
> +	snprintf(name, sizeof(name), "tile%u", tile->id);
> +	tile->debugfs = debugfs_create_dir(name, root);
> +	if (IS_ERR(tile->debugfs))
> +		return;
> +
> +	/*
> +	 * Store the xe_tile pointer as private data of the tile/ directory
> +	 * node so other tile specific attributes under that directory may
> +	 * refer to it by looking at its parent node private data.
> +	 */
> +	tile->debugfs->d_inode->i_private = tile;
> +
> +	drm_debugfs_create_files(vf_safe_debugfs_list,
> +				 ARRAY_SIZE(vf_safe_debugfs_list),
> +				 tile->debugfs, minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.h b/drivers/gpu/drm/xe/xe_tile_debugfs.h
> new file mode 100644
> index 000000000000..0e5f724de37f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_debugfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_DEBUGFS_H_
> +#define _XE_TILE_DEBUGFS_H_
> +
> +struct xe_tile;
> +
> +void xe_tile_debugfs_register(struct xe_tile *tile);
> +
> +#endif
> -- 
> 2.47.1
> 
