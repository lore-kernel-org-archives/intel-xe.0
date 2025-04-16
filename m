Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02DEC369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 14:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AD610E95C;
	Wed, 16 Apr 2025 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWf50jlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4B10E955
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744815169; x=1776351169;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8zYSk3UQ9rvfcxSU/GPdy9/hJ2v2nVJop5zwQ6iUTVU=;
 b=kWf50jlh7GPkOGzNYsvA77i2Q6uusMzfncghTknBT/l0rScYaZr3ZXei
 CNjeJFpdsOVT9g5CLjqMX9hjhWUhFhq1qyVfiXSik1l+VJWve/qv6MrNN
 vd7jP079MadNhU7O3Wk+y/ZOA5HXxu30soKz4cd40alLjxVFFqEnPCNC6
 tBDyt2PGaAqPPxsANj2XjOq3Z3YbPEPIdpi0b4hdem5+Vw1ImGWj6thwp
 UTkQF11VViCFVirjZh6hHLPoZpHqsssD0XG8SBdnbt6aG6GUNVCdpePye
 z2OG7rvfeChz1Xz5uu5ROiPHNzaPqYAGS1A6JfxGouNF3SMwg9Z0yvBJ2 w==;
X-CSE-ConnectionGUID: QQZ4uVTLQkGyrvG6HOFcWw==
X-CSE-MsgGUID: f2LFSSO0T/u5RW71lLxnYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="33984622"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="33984622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:52:49 -0700
X-CSE-ConnectionGUID: Q8FqgRzxR0unqJgPkeUZtw==
X-CSE-MsgGUID: ojF3IpX/RYu+XRbU3ORGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131028825"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:52:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 07:52:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 07:52:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 07:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSJThQhHJwZ9ZUYmrB2AqAdywFkxUImMZQtiTH6xhGluXYTtzwlxHOp3/FsIcPqXtMR3enjTcNlNxo38Q8/OLMR+2VCAyaU/3I0PZmYYyNDk/n7rPMilTs8uK1+IVcN1BWX/AKcTsVeMpqrKUbX/JOQsCWJKke+C9nDEzxNsDJUchIytRl0+/1vg/aLyYfTZOsEHZQJ3DkvSf5D0SdigS2aCS/4YxjOxokmRuOaLu3CG3KBEaNoA2uqjhSsEo5Sm7Nll2j7lPtFYCz4y85P8hoqjHxD6/BKvv01UjfMcnURAcJMm1In+oKZ6ETgKpBk7Q/6co/2AB8za0nS9xKp6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZYt1I425RYmbfcJox4w4u1mdwQ1BJsnTFiDNxFP9mw=;
 b=JmaDW1+o4h2mnCMwLYBj3Dx872UQL7x9u2esHot5o6RjDvPjXG125DKy/ry9ETRqs9/Xmt6T7EUzERd31kVvjoBVZ3M0lbDyse6pDxYkPtpiGWH1D3YHzsT2a4zBQOuvKgox+NCgOSpItGny1jEDGfdvRhspHp61CxEix5dpdY/HW5AN9JRiqRMVD/jH0mYo5DBqybkmFJDBbwnRRmXDKIVAQrdt7gWcmYjbfMsZGTiYXjURtCJaJckL3qFPsMQfV7bm3JMUALK5RrGx2H+IpDWXLA5SmjafmyvPQM8m5OY+k7xVNmOIreTCSVvocUjoBogrhVxxpQgHxmX2YVX6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF9D9CDC305.namprd11.prod.outlook.com (2603:10b6:518:1::d3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 14:52:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 14:52:46 +0000
Message-ID: <16165ccb-25f8-4cd1-9ac7-63496c965be4@intel.com>
Date: Wed, 16 Apr 2025 20:22:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
 <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
 <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF9D9CDC305:EE_
X-MS-Office365-Filtering-Correlation-Id: f56180fb-45cb-4dfe-485c-08dd7cf6592a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THBXcUF2ODM0T2FGbFBiUkRPem9USENKVmYrZ3dZeVEyNWxKZllCSGJGc1VJ?=
 =?utf-8?B?cFY1RU1wQndMMlg3VW96R3ZLb05wWGoxRzk5cDY4ODFsQ0pTYUdGcUpBNWtB?=
 =?utf-8?B?WWNCKy9qbEZaNGdTb1lOc1BEYnpMNGxlK1U3cWV0Ymtwd0NTSkZLQmpDa2FV?=
 =?utf-8?B?L09MNHJLM2g2MkcrM1hBT2w5SWRDZUpnSjNWRDJWdm41UDdEc0xKWnFMaE9E?=
 =?utf-8?B?bVR1a2VlOVBHNDBlTVprODkxVjdQejZkaUVyMVV4TkJWKzNLa1lMWG80bE5w?=
 =?utf-8?B?bEgrVG9TT3djWnBZQzJHV3ozbSt6RVAzR0M5SFg0M2RwQkZnUEdkTllkeFFT?=
 =?utf-8?B?Q0dKbEZKblk0RVFSUlRaZEp2UXd6cS8yelAyakRCZk4wWm5mQ3VvVWJxdGhH?=
 =?utf-8?B?MnhuSGpXOWM3Qk1COVZ3STFJeWY2OHdlSlpSbDVSMGJmc3FkYXdYZjdVdWhO?=
 =?utf-8?B?R0hRZGpvMnVhR1Q0dmVDOU03M2pOL1ZqRU1PeWE4MTFxQnZzVHBPd0RwYWpk?=
 =?utf-8?B?OTBENDdEaDlaNDhHVXNzNFpNdHd2UzlQS1pLeXhVUFIxMDdaTUY1TlF0Z2Zx?=
 =?utf-8?B?QldmR1ppbHE4M2hlQzhtVzNkR1VXUEZva3VESTM2L0tBVHVQQ3hGRlFOWjRF?=
 =?utf-8?B?c0RtZXhjMTA3SzNlV1FQdDFISnpEYjdXWUk4RVd0enNETXpFR0JYZTEvODZx?=
 =?utf-8?B?MHRRQkRlWHlFendzaDRFYktVUExkSzR0TElxV29SMEI3NXJDOXg3UHJ0RCs3?=
 =?utf-8?B?MTRnNlEvWDQ4dHg0QzM3YU1CaTNHbEdxRTBkWGFNUzdQU25YbUl5V3pDdGUv?=
 =?utf-8?B?WFVtUlVvdmt1REUwZ1JWU2VYdlNSNWI3LzN0RitpNnY0bFZ5ZlJXUjdxY1ND?=
 =?utf-8?B?ZDVib3NxZWQvbE5XZzJXYnVCc09kZmlIbWd6bGRYTUJvc3JzanlVZXAxQTQv?=
 =?utf-8?B?SGY3QVlOZGZ1QTgyMGkrNnZxenBnT1V4MTljY0U4TFZOaTV2dUpDZU9iSDRk?=
 =?utf-8?B?Vk8vQzd4MDdPVXBPYnRrdFBHV282R0xiZWRaUHlTV3RlSTJpMkw1YVVSRGRy?=
 =?utf-8?B?bjJEMlZ2c21CbG9ScUxpa0wwdjVzdE5MUVAyYjlvQ21Zc1piaWFjOHNzaGU3?=
 =?utf-8?B?enMyRGlQKzRtbkVVWGQ2WVA2c3JVc0pOK2ZzcWg4R2ZLVDZiQy9paVdXUnJP?=
 =?utf-8?B?TXRWRmFZMitFcmhtUkV0YkhDL1dVeWdWaGk1QUZrYWczOWtVYU5uOEVydWVH?=
 =?utf-8?B?N3ZGbFBFbEVzUXZ6S1lTMWpPaWk5NEtOVVNzREI0MnAybmsxYzVEYnV1bjd3?=
 =?utf-8?B?WjJDajBJTDJtVHFFUzNpQzNQYWdXRXQyZEwxYmYxWHVBUitUVnpXWmFkaDd4?=
 =?utf-8?B?NDVGdWpQdi8zUEhad2NsakIvN2M2eHlhbUdKQjB3WUlFZFpNaW96MjUxMzYr?=
 =?utf-8?B?SGpESGc4OFpESDRJdld1bXU5L013RURDc1M5YkdYUUZCdXVadDdJRncwdDJa?=
 =?utf-8?B?WUxYOUJBeEZSWW81akRpMlpHa2l4WmdNQW5oaHcwRzdUNmt6bktDSzdGNW4y?=
 =?utf-8?B?RkhKM281dTdZcWtXSDBoOVRSVC82M1NRMlRaZTVGZnhqOUczSnl0OW5OcXFN?=
 =?utf-8?B?KzZ5Z21QR2J3aG1nNDVHdFAwc2MySHNrWEVSSnpuL3BJUlNBdnBLS3RDMjZE?=
 =?utf-8?B?Y3JrNkNqb2VTeHdMSzlkK2k2dXVxdmNhSE03bEdMSVpmSDV2NE9neHZrdmxK?=
 =?utf-8?B?dmNNek5kcy9nWWp4aGl3MXFpMWRiNldRY3F3am81SnpoS3IxZkZIMFNmaEtK?=
 =?utf-8?B?enhZSlVHUWVoM3lxZU1IWFJ5Zko4d3pTbHhrNkgvNHBGRExRMm5YTWtFSzhY?=
 =?utf-8?B?NGFaUnIrL1dQZDFibXNBSkNSa2p6OTJyQ1BaOWNRNmYzSkMyNHlzVFhOUTJV?=
 =?utf-8?Q?we5B0oz2SqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndFbTNmbXFHSGh2akF1ZENPWENkY2ZFNG82Y1Q1aWJUd2tDTGNmNXZ4UWVn?=
 =?utf-8?B?ZUN3M1R5NEhTVUJ0WXBBeCt0SXNidnhuRS80NGdldUNjWE1VTXcrWUpmd09x?=
 =?utf-8?B?aEN4QUZoVVFWYUJKbm10Y09UcW5BV3hOZGpjVVpRVFNGSG84azVEdFJFSERF?=
 =?utf-8?B?MXFuNnZ5cTJ4ekdib2NWU0sxZHlQaEJOYUlQbjVzUzBTSzRabVdrREZza1Vr?=
 =?utf-8?B?blFneTkzaW95TnI4a2Y4aXdUR3EwNUtHTUFieWl4QzhrdHMxQ2pETUJZNjhV?=
 =?utf-8?B?akRDUlBoc1BWSmd0Z3hJK1lKT0cvWkFhNXVENTJxQXFKaHZ1TWQ1YklYa2Rp?=
 =?utf-8?B?bWhzRkptVFNzRjhpRk1vdVFhY0ZDTFdlRVovQWFGRDVQRW9pT2Nmdm5hTTkr?=
 =?utf-8?B?TDRqZ2VuTUNVYkYwV294UmRrN0FYa2VsTmp2eFZyeDRuem9sNDJseG9ZL0ps?=
 =?utf-8?B?RkJxV1ZKcllpZ3FneWw1bTRZZmxKNksyOTZ0VmNTN1cyeVhZOWNzZlNvUzJ1?=
 =?utf-8?B?V0Z4R2xuWEloYlRnTDM5L1JQV2Nna01NdDVSRlNxYi9ERHJBcUw4NzY3cGhr?=
 =?utf-8?B?NjRuTlRmMkx0ZXZGTWdFK2p6NThnSit2cDk2WE0ySzhoQVdsK1Zrd2JnVDFN?=
 =?utf-8?B?S2JpSmNEc0loc1JQbUplWnIwY3RxWWVNUTZXTWloUElRaC93UXZkZ1VNWXA1?=
 =?utf-8?B?eVo4Z21ZTEdONDA4UFNUNDdaVklBSko5a01GdHNXOUVXRjMwOE5kbG9IUzhw?=
 =?utf-8?B?UDA2SGpveEIxNmpYNHdoQVVtVVRma2RCWVFtZUVYVTEzblRpL1JMeXlUTzFs?=
 =?utf-8?B?L1RSRllnMmFjaTNZV0ptdU1kRytNWHFTY2lueElpd1JFZ3R5WlFuMnVpQW4x?=
 =?utf-8?B?Y1YraWdYSkRqWGh4Vm9uWDJ0c1RXcXk1TkdoK2ZFT3dpUFNac2ZoK3Rva0Zs?=
 =?utf-8?B?UHlUU25ZdHVwb1JGc1R0WkpGNE5oU1NYUUJlVlRSeVVqdGEzc3haZVRsd3JU?=
 =?utf-8?B?MzB5V2tPTHpneVBmeUFCY2d0ckpVclhRRjFLTjZlSzN1anBCNThnblVmNUNn?=
 =?utf-8?B?WW8zNEQ1SnYyN0FlQ2FSOEZmbGQ4ck1NaHhOdTloaWZqalFRdkN0MkxMSk9W?=
 =?utf-8?B?MFlMY1BWVmNrMTUzUCtXbHBzTzVyZHlXa0VQWHQyTU9jTm80MDZxV2VCOWI1?=
 =?utf-8?B?SGF3Sll2NW1PVGFMTW9laWdPMVZRS1JRcGpLaXpGUXp5bDdlMXUvM1NZY2tY?=
 =?utf-8?B?YlkrOVFQdGhJWmpNRFlLMmZteEJZbSt0emFieHdTU0RjaDI5NDRzT3dYZmJQ?=
 =?utf-8?B?U2FyM0dvSGxnd290akJsYk5jdzFSZEFMTllzbEFaUWZMWGl3RWw0L2ozQ1g1?=
 =?utf-8?B?U1FBZlFydC94TlE3c2ZFdUZQdS9PZW91Z0Rwa2JPM3BVV3dqdlpVSlFsOGtr?=
 =?utf-8?B?SGUrYzZxVFhHWDgrSE1tdDFpZW93Nno5Y1B3TDcwWERvWmVicEdqakVsSnZq?=
 =?utf-8?B?N041bU9henhHNWlTU0loOWQwYk5DQ2E4TXZENGYzUkFoMUxsWUl4UVhWVm1i?=
 =?utf-8?B?cGg2K0hHMU1mTDJJZThZcXRmZE83NHg5QmZVdnpXU1ZqNnE4V1BkSGdyRFVI?=
 =?utf-8?B?OWdWL1YwL1BRdFg3MUZWcTdSRDU2OHowa2dldHdJVkRWdjVCUUtiaVBWSFUw?=
 =?utf-8?B?TllqeGhlRElZcUdSd1Z1cXJ5cE9DckxiNk5ldVhabENtYjRsQnQ5eUxwWmcw?=
 =?utf-8?B?MXlzUTZhTzlpTlFJVUo0UWNxaFQyZnMrQzFDeTdWL0RKMFlxNFF5VEdGQVQr?=
 =?utf-8?B?R2M5NU5md1NUSmN0L3BRWUl2Q0s1aVUyS09sdTJaSEU2TDIzT1g2ZzJ0cXFq?=
 =?utf-8?B?Ly9ZRm56OXRGV3N5UGxPQlc0VHYrbVZsTjN0eXRPN2xuM0dNbUpPQTA5Q1A0?=
 =?utf-8?B?V2hNWGYyUWpRRmxZQVFUQWVKR2RmWWxKb1ZRSGgzQXNGODhXOEdrY2xCNlJO?=
 =?utf-8?B?aWZuTnVhY0VYejhISXRWa1o4VGx1REx4cDQ1cStIQkVPbHM3NHJ4YkhSNkhl?=
 =?utf-8?B?eGtQOUdwZElPS0FjbHJJeUF6OGJ4SGs2azVhUk1zNlZzWldJY3RmeEdESE5T?=
 =?utf-8?Q?g9d/IprMF4qP4VMiH8Et6d4kp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56180fb-45cb-4dfe-485c-08dd7cf6592a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:52:46.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4EayR/4pEx7/xA0l50ndNYKkGsm9zmpkZzAXlLKMxLuCCLkpdhdKlTcMDO+8UXOp/i5qi86xRi35Ax+ZSJ7IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9D9CDC305
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



On 4/16/2025 4:28 PM, Raag Jadav wrote:
> On Wed, Apr 16, 2025 at 03:36:55PM +0530, Riana Tauro wrote:
>> Hi Raag
>>
>> On 4/3/2025 11:17 PM, Raag Jadav wrote:
>>> Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
>>>    2 files changed, 91 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> index d4c73acea1cf..4e6175907832 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> @@ -11,6 +11,9 @@
>>>    #include "xe_device.h"
>>>    #include "xe_device_sysfs.h"
>>> +#include "xe_mmio.h"
>>> +#include "xe_pcode_api.h"
>>> +#include "xe_pcode.h"
>>>    #include "xe_pm.h"
>>>    /**
>>> @@ -63,12 +66,85 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>>    static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>> +/**
>>> + * DOC: PCIe Gen5 Update Limitations
>>> + *
>>> + * Default link speed of discrete GPUs is determined by FIT parameters stored
>>> + * in their flash memory, which are subject to override through user initiated
>>> + * firmware updates. It has been observed that devices configured with PCIe
>>> + * Gen5 as their default speed can come across link quality issues due to host
>>> + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
>>> + * faced with unstable link at Gen5. The users are required to ensure that the
>>> + * device is capable of auto-downspeeding to PCIe Gen4 link before pushing the
>>> + * image with Gen5 as default configuration. This can be done by reading
>>> + * ``pcie_gen4_downspeed_capable`` sysfs entry, which will denote PCIe Gen4
>>> + * downspeed capability of the device with boolean output value of ``0`` or
>>> + * ``1``, meaning `incapable` or `capable` respectively.
>>> + *
>>> + * .. code-block:: shell
>>> + *
>>> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
>>> + *
>>> + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
>>> + * instability due to host or motherboard limitations can result in driver not
>>> + * being able to successfully bind to the device, making further firmware
>>> + * updates impossible with RMA being the only last resort.
>>> + *
>>> + * Link downspeed status of PCIe Gen4 downspeed capable devices is available
>>> + * through ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value
>>> + * of ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
>>> + * link training (which is the optimal scenario) and ``1`` means the device has
>>> + * auto-downsped to PCIe Gen4 due to unstable Gen5 link.
>>> + *
>>> + * .. code-block:: shell
>>> + *
>>> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
>> Why downspeed? Shouldn't it be downgrade?
> 
> It's distinguishable.
> https://lore.kernel.org/intel-xe/Z-4CxE_CDYHk_nxS@black.fi.intel.com/
> 
>>> +static ssize_t
>>> +pcie_gen4_downspeed_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	u32 cap, val;
>>> +
>>> +	xe_pm_runtime_get(xe);
>>> +	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE4_CAP);
>>> +	xe_pm_runtime_put(xe);
>>> +
>>> +	cap = REG_FIELD_GET(PCIE4_DOWNSPEED, val);
>>> +	return sysfs_emit(buf, "%u\n", cap == DOWNSPEED_CAPABLE ? true : false);
>>> +}
>>> +static DEVICE_ATTR_RO(pcie_gen4_downspeed_capable);
>>> +
>>> +static ssize_t
>>> +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	xe_pm_runtime_get(xe);
>>> +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
>>> +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
>> indentation
> 
> Can you please elaborate? Shouldn't it follow the parentheses?
yeah it should. DGFX_GET_INIT_STATUS should follow PCODE_MBOX parenthesis

or align PCODE_MBOX instead

ret = xe_pcode_read(xe_device_get_root_tile(xe),
                     PCODE_MBOX...

Thanks
Riana>
>> +	xe_pm_runtime_put(xe);
>>> +
>>> +	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_PCIE4_DOWNSPEED_STATUS, val));
>>> +}
>>> +static DEVICE_ATTR_RO(pcie_gen4_downspeed_status);
>>> +
>>>    static void xe_device_sysfs_fini(void *arg)
>>>    {
>>>    	struct xe_device *xe = arg;
>>>    	if (xe->d3cold.capable)
>>>    		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>>> +
>>> +	if (xe->info.platform == XE_BATTLEMAGE) {
>>> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
>>> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
>>> +	}
>>>    }
>>>    int xe_device_sysfs_init(struct xe_device *xe)
>>> @@ -82,5 +158,15 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>    			return ret;
>>>    	}
>>> +	if (xe->info.platform == XE_BATTLEMAGE) {
>>> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>> This should be create_files. If second one fails, none of the other files
>> are removed.
> 
> Sure.
> 
> Raag

