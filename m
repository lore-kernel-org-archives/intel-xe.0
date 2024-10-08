Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A2CED253
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 02:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5010E0F5;
	Tue,  8 Oct 2024 02:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwTSTl/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E7F10E0F5
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728354191; x=1759890191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fdisEo7K/q3mIp3mv74igplujDYGBEKKDmzqJuKibXw=;
 b=QwTSTl/7KwVaU1opeCPqvNAyGNVnal5S+MmMsH15ZOtrMjHH7wIiKYJT
 xH8tQrm5jHLapi0om/tOLOgfqosMlMBq/X7GN4wpawUGfxZd9nMm8PrU4
 R+QaVp2qDOraPv2G7tG9aasMuJnVIFEIySrHZdstBLwQQaSmJlEGYXw9Y
 JZGzRNIYZ+mnxzIoKolsLrqdXaXgMrK42kHBCVILyMgqdD5JduuNltATl
 KCjBSIh84R3TIks7bw0AVvHx97pLjsQH/HR3F6PKPzzMq3s9q0MjK5fKz
 +CFhtVTFYt2kf5f1uMrmRLcY8dxg7hSRZK1R+yj0vb3YoLyUMXc0KuE/H w==;
X-CSE-ConnectionGUID: 2ERN5tCPTFCpSlODzeqXcQ==
X-CSE-MsgGUID: 0YIX0jcFSSWFKgGZxYKcjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38889154"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38889154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 19:23:10 -0700
X-CSE-ConnectionGUID: fEzg2iEdQ2uuXUHKHjGN1Q==
X-CSE-MsgGUID: 20/PLtPDTkGtBZZ0HNrcjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="75239206"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 19:23:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 19:23:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 19:23:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 19:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJ+n2QqHwwAYFOH0wcQTDcU5OzfA6k2uRJmkHDW/OHIugoYchH23IGfDrhQQCgsEJKxE1fqW+5u8N2UB9lst5lqJYwROJToj4k1RGD0km28uuKQVFNKeNyutGVKj2EVmcQj2Tw2GMj7XydiPaT0SxmnVQuYJq04pThZQV3KixKDIO81H23rIgdvNsO8gwUr3yc1kKS5FfXi1GlSeFEPOn5kBT7TGTwUd75TvW+JlvvX79pwsfqyFgKBs22W9MuAE7rwb0Xa62u96TJ4Hxgih3H7l8/uu6mCskMuKORmo4pKKJLeA3bwVjCMatx7cl67KSm3/q4kMf+nvxrOQCH1YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+FS4VoPRXANezLv+tfpjLvYMFrXzbrF8mS7Cx4o0TY=;
 b=qq+BOLijj9cR5/SA8VDQGXWe6MRdiqJEXsgNInnYHxxjeqNMjAOmuDVO7ka1Uh+tbhNfOUS7taIJivHOj92NapSgLDnZP2bONxC9dxxp0Q+3tPE/gfGOpOmQKHvxJ7HPpPFvQm1bfAYZ7WObQoUrSGnjoPvAPXz8hEWtE7PPHYfVcaB8I1qE/KuTO4Ik8OsRKf2Z89usrH8EIYBNz8askvtS4NTq73nnuDFIJEw9uXLSGriTbwNZtsnNybgi1Jl6K7VG4P08ccIyz+I2zaBf+zFPODuhH1IE+xZNHMbghChrVSkkNjIL1k3IhcPhfndDBuQ7qHp8hOiWdZ8yA/MBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 02:23:06 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 02:23:06 +0000
Message-ID: <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
Date: Tue, 8 Oct 2024 07:53:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Haridhar Kalvala <haridhar.kalvala@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-3-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008013509.61233-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b638fe-e0c7-4fdd-6254-08dce74024f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05WMWpSalo4YnBkQkhSYkYvUDdiTkxseGp1SmpzNmhSZURhODlvUHRwaENH?=
 =?utf-8?B?WE12SmthM0UwWlhUU0l5TGNtQk9lZENTdTVOL25RYlRmV2tRaHlDZVNVWkJi?=
 =?utf-8?B?SFJySG55RnJmcmtUTUM3Z3lwUksyazQrcUxoT1BUQjE4L1VoZkRpZ3lrVzJL?=
 =?utf-8?B?cEs1OW9mc1R4d0VVU0sxVDB1L3kycVFscWV6bkp3Z2kveUhmSEpUS1kvNHVQ?=
 =?utf-8?B?Tkp3TWZPWmdLSk1WRW9aR2pmWWhsUERiYzBoY0UyeC9lOUJ6SEh2RGVTRDdO?=
 =?utf-8?B?bmVnQnliMGE5c2M2bzVOS1YvUFhMRklOQzFQRlA3OWRkUklyNDE0SUpaY0dX?=
 =?utf-8?B?T0NNSERNNVoyNGVlOHFPNjU2ajEwOXh1UnVtaGU4aFIrZ0VaNmZ6b1U0VFNE?=
 =?utf-8?B?ZHhzcFBiTU1HTzRVQ1AzVTlTNUY2SkxwTTFuSXo0QURJYnpZaE1iNEl1K1Ez?=
 =?utf-8?B?WU0vVVVFQWk5aWtlRjloZ3pTTmhIejJWVTJJd09LcXk2em5uU2IxZGpmejZP?=
 =?utf-8?B?ZmlNenI1ZlhSakNoZTd6QnIxSXU2U1RmbVVZWE9WT2hGZmlVSDZJdG5lZmdE?=
 =?utf-8?B?aXBvWlVMc2tYTmxwaDNvOXlweGthR2VZRWd5VG1HN25BenRrSi9IQXZSS3JN?=
 =?utf-8?B?b0wyTzRmTWlCRWg5Y2Z2YjQwQXJCM1VlMlJHMkViNzZQc1MvSFRCNk1NYyti?=
 =?utf-8?B?d0xVc3NtcnhIOEdmY3E4QTJHU3ZUSThuMHl2a3Jwb09wNVRnZnFxelZDNHps?=
 =?utf-8?B?YUFjalFabWF2eU4wSlhWbDJ5WlQwN1FveTdpeG5kOW04a3hUOWpRbVIxemd6?=
 =?utf-8?B?SFkzOGlUL2Q2Y21BTGhBRk9YY3ZUVlRUbXlYbCswSUY0eWhad0IzdGpsaDc1?=
 =?utf-8?B?dTdrcUJDWmJjUk8xNHVDNHltVmRRN3JHQWFoa0gyUGxVSWNnZzkxOFZjL1dZ?=
 =?utf-8?B?RStCSDd3QlJ5L0JjZjhTdmZqcVdlTjhnenVEYWpaYjk3RytkVEtrM0twOC9n?=
 =?utf-8?B?K0VjSWJGSFNIeHhQSENYb2ZjM3hXVmQ0WkNoWjRNT2hReGRZZVF2QTdiWDMw?=
 =?utf-8?B?RkJrL2lpMEp1eXFlUnJCa2ExdE5GVXphUVpQMno1ZHRYV0ZFSFFFY3pEcGtM?=
 =?utf-8?B?RS9iL2crMHhOMS90eTFXSnQ0VXBlS1VyZlZYYlZJdnFTcHZ0eWFTbUUxbHZu?=
 =?utf-8?B?RDgrSVVtRTlOVTdzWEdUbFljK1ZXaTdNQ2ZMTnovZnBaTGNGNTlUd0lLZ3pZ?=
 =?utf-8?B?SU1HTDdKeno2VjBIZzRNTXJFbjVnVlhJczVyLy9GWTh0YjBpSi9aZEN3bzN3?=
 =?utf-8?B?ZjNWckFpSEc0QWZudDg3QUcwM3NIdmVleW5QRXZ0cnlNYUQzak5jTXZNZmk3?=
 =?utf-8?B?ZjJDNGVNaDRqb3Q3TTlsUGpLdkRHZElPS2s2QkgzS0lIbHRvSzFzdldrdmxa?=
 =?utf-8?B?Vnp3aFArd1g2eVkySG5GU0RWbXdTQk5mZkcrOVdJYUtOR0xnUzA4TVhqaGdS?=
 =?utf-8?B?TEd1RTE1a3lWODk2YTZGMlkrYS9CaDhuVzFxUFk5RUVwbzJ2K1RBLzhVRnQ1?=
 =?utf-8?B?NUo4Z3NPTXNJZGVjZmREZytEellnekprM1ZxREI2NnAzWWJvQUdKRGZQYnhC?=
 =?utf-8?B?VGRDcThMWWFEZ1NnNktPRkpTWDNGMEVyaWZRQ3g2Ty84d0p0N09kUW5QcWpT?=
 =?utf-8?B?RHU5WndDYjNsUk1yWDN2MTBqMXRycDQraUN2ODZ4dXhqbVpVUHUxc25BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZDRjcwOXhmcE1jbDRnVHBxUDdFWHVsaEZaNFRzRDFFb1AxTUYxRWh5MU9i?=
 =?utf-8?B?UytQQXI1Sml2ZU1YVWlrTU9Qb0hERmVVaHNkYnRjMU9LRS9IdFI5TldIOWZL?=
 =?utf-8?B?R3BJM0ZVUDVla3hGamxsS080ZTcxeFVsak16a3Blb2lrblNEMXN3cEVIMElt?=
 =?utf-8?B?bTlZTEo0eTJuejFxSytmMlNOQXVnbTQ1eTZxc2lEZE1uZWl5WVRLSU9UTlVw?=
 =?utf-8?B?VUpMYWZTSXBaVUdJZlY0RHMrdmd1a3loM0lqd255eWtma2MzTGR4bW9MLzhD?=
 =?utf-8?B?Z2dkbXlVdG90cjlwS0hBUkxYOXJHRlJGQSsvQXh1WnYxUGNRdzJKYnlueFJL?=
 =?utf-8?B?RlNzWnhyZFI2R2xOQnUrMnNyZlNLMU82VDE2cXNyT0pHa0hsd21mT0JKUWR2?=
 =?utf-8?B?NHB0NnQrR2ZTOGF3WW9WYjhKUFBJdU1KVm5mRzJwSEYxeXp4REpMeUg0eFpH?=
 =?utf-8?B?SyttdGEwaldncjFHaDVZNkp2T1h1NXNhdU41MjZiUW1sUU91RVRUbDhjTldL?=
 =?utf-8?B?OGdWQzdza2JkdEtLYkd0aHB3WVo4VEZDYmVUZHQ3NUx1UjRrWHozcXJRd0JI?=
 =?utf-8?B?Mkxka2l5cFIzUVZNMTF2UmV1OWtvWHN6anhQRDdoenNEUXdBTk9Id0pnZzFV?=
 =?utf-8?B?MzIzSHM1aTdLcDdCNjRNQVVqUEE5czdicnczb2cxSFN0WDVSYzhiUzFDM3Zh?=
 =?utf-8?B?S2kzR3V1V3BVdDRhY1R2bDdQdDVKNkQzL0dsOUJESVA3c1dTOStDQ3NFQ1BQ?=
 =?utf-8?B?eFFHeTBMRHRhbGQ2MFRvNTNZR2xYbTlzVEhmcWduajVVemovcTdKVHhoSkZr?=
 =?utf-8?B?MnVMYzNVT1hXTk5veVlZQk45aXVZanJtMG1JNE9maWhTWmtERklVWkQyVDlO?=
 =?utf-8?B?dHpYMEE4aUJ6dWJLYTdHaTAwUUNhMkZGY0xickoxQzUvT09XYnlQcmZwNWlw?=
 =?utf-8?B?VWdpVTBKOVdpVi9CTUJ5alFxcXNvMThsT09sdEJKVm8vWDkxVmVlM0tTeGJ1?=
 =?utf-8?B?ZGNCaGxEMzIxQXZ4U0tNV1RLSE05N0Z5bE1kUVRQVld4TE1oVkFzQkxmSVBB?=
 =?utf-8?B?RSs0OUxnTUdRbmQ2VXhoTy9JY2xLR29IeW5YQy9NaG5vdGNoYTh3S2dPUUM4?=
 =?utf-8?B?d2pPMFltbXZ5dGxVUHdDdS9rOVd2K3MzTklHVW1FYi85eWhrRkFETm81aWJ1?=
 =?utf-8?B?SnVpY0twK2ZNWTlXcGd0M2xiVFZacEZCbC8wZmxZWHNjVFlGbm5YTWxLcHJx?=
 =?utf-8?B?TWZvN1dvSnZ6WWUwOXJ1MzhLeDRsTXI3a2I2dkRSSkYxbmZwRGUvVTBuMFJW?=
 =?utf-8?B?UE9QY2pqdWRubDY1Rk5WQUpSSE0xUkRaM1lIK1JaQW84bUJ3R3g1NlJzampO?=
 =?utf-8?B?WkhmaWRTaE1HUlkvVmEyclp1Nnlobi84bGJPTWhBVnhSdU1zQTQxMHNaSnYr?=
 =?utf-8?B?R2tQNWpjNEFXdmkwUGhGS2g5a2h5NVZ6eVBUdndwV2Y5UDNLTDBGeWNiK2Fl?=
 =?utf-8?B?TUgyM25xdlIwZW9mQU5TMlkyVXQzUmptazN6LzNnZHR4SDhub0RGR3J3UC9t?=
 =?utf-8?B?cGNtdzVqRUVhUU9QblMrL3oxUzFoa0ovcG84VmpTd0dvNUN3N1YxRzJETmJ2?=
 =?utf-8?B?RW5DYWlPb3M5Mnk1a3ZXd1JGMjNDMEhFeXlESTc0cnRIeTU0OW9tZjcxakRt?=
 =?utf-8?B?Q3RsZFpmOSsycVF0MkZWWkErN1lGNlBBckVWcnFiWnI3bXdqL1FicWk4a2Ex?=
 =?utf-8?B?REIxL1FDY3JSYTlvQnhxWGh6WFhJTS9pQ2c2WjFjOEtEOTZDR2VyUnA0c2Ew?=
 =?utf-8?B?eEZNcTRPVGd2cVpqdmRXaEhkNnVPcGlGSW9FalUwYU9icEpCSzR2WlFtKytP?=
 =?utf-8?B?eTNFU01TSG9lY3dwZm94bWpBMnhhMWRVSGpqYS9zSWI4SHQ3MmU1elNSOWVo?=
 =?utf-8?B?aW42eXJpZlpDeWZsYjIyWFZSNkFMNmZkU3ZnWnhhMkUwRzlJSHhHNUpkMnpX?=
 =?utf-8?B?TDJjQjV0aElMelFXTzNwTUJLdk16VG1rV3JObnpvK3Qxc3lBUjdqdTMrLzAz?=
 =?utf-8?B?QVNVRCtYcmc5b1REbHgvRG1sUnNjcFVsQTd4RUVSbkhhdGZWM0kzeUZnRFo3?=
 =?utf-8?B?VmNFUEp0bGVRNTY2aVBjcjlCbzBGTm9uK2d0OWIxZjhFMzVzdmt5ZVhlVjg5?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b638fe-e0c7-4fdd-6254-08dce74024f0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 02:23:06.6472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSkVt6OGHZDa86n711l2RwF0J48Q5yprjw/XLK35F/Dv1xIXy9AhtSqV5hyb/hX9rQzOwwa7XrBGJqVFB+IdVjXz4MItwBCmyPtDynzUia0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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


On 10/8/2024 7:05, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>
> Define a common set of Xe3 feature flags and definitions that will be
> used for all platforms in this family.
>
> The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
> platform.
>
> Following B-spec details inherited from Xe2 feature flag definition
> commit.
>
> v2: reuse graphics_xe2 defintion
The patch itself LGTM, but since we're re-using Xe3_LPM with media_xe2, 
I believe we can have a v3: Reuse media_xe2 definition. Also, there's a 
typo in the above graphics_xe2 'definition'.
Both of these are minor things which can be addressed while applying, 
so, with that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>
> Bspec: 58695
>   - dma_mask_size remains 46   (not documented in bspec)
>   - supports_usm=1             (Bspec 59651)
>   - has_flatccs=1              (Bspec 58797)
>   - has_4tile=1                (Bspec 58788)
>   - has_asid=1                 (Bspec 59654, 59265, 60288)
>   - has_range_tlb_invalidate=1 (Bspec 71126)
>   - five-level page table      (Bspec 59505)
>   - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
>   - platform engine mask       (Bspec 60149)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7ffee06fab13..2139edba9062 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
>   };
>   
>   static const struct xe_media_desc media_xe2 = {
> -	.name = "Xe2_LPM / Xe2_HPM",
> +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>   		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>   	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>   	{ 2001, &graphics_xe2 },
>   	{ 2004, &graphics_xe2 },
> +	{ 3000, &graphics_xe2 },
> +	{ 3001, &graphics_xe2 },
>   };
>   
>   /* Map of GMD_ID values to media IP */
> @@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
>   	{ 1300, &media_xelpmp },
>   	{ 1301, &media_xe2 },
>   	{ 2000, &media_xe2 },
> +	{ 3000, &media_xe2 },
>   };
>   
>   #define INTEL_VGA_DEVICE(id, info) {			\

-- 
-shekhar

