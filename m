Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC28310ED656
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F31210ED28;
	Fri, 27 Mar 2026 10:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBPqiJwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA610ED98
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774608879; x=1806144879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fm+NJS2z9PB8P3O/wxCJKLqM46kkzhR0WPABotv6IJg=;
 b=GBPqiJwtO+KJkNV04YCzvKKozkwiNmQBHvh27ZG74SHsXvmuWLT70Wu+
 eq5jV6qBOTTpWd9FWx7/cJ+oosNWeA8QigWI0GpFdocj6mP32lQsY/MBv
 mXfYiFNjNNFP5m1+GeiO3oNIYp7KrN/nsUj4/4K5fc+c9CIeiFAwbbiyH
 YxJ9B138lLonclQLnFEV9ieOl1J4k5iryYbv2/+bvHeG7t0m65/Nlg5sT
 vJrLwRj+QtXRSXMCZ2tQM7BozC9nJeG7QtaH5xl9lzF11Hb5dJbTr+2r2
 MVGlBxoaQyDFJzUcJAdZ0apvrODd/pY/Sy7WLFZHwdoo9Qwwu2m48cOXs A==;
X-CSE-ConnectionGUID: bhxTBve+RXaPiN383HZD9w==
X-CSE-MsgGUID: 60jEb3A6SZ6D+MtZTGTgYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75701516"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75701516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:54:38 -0700
X-CSE-ConnectionGUID: sK1f4kbmRFekjbYakB7o2A==
X-CSE-MsgGUID: 5YfSUY8CT12KeCwKMYIjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="218664540"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:54:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 03:54:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 03:54:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 03:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goIS+zz047MC4a8VT1uYz0M7+81LzTo+16ecsTj3JCImXIWeg4Bzg8sExKtxpz3kS4EQcY0rGHgLqwS3iTGYPRtGc29M2LQvO7TkLAqZ1l3Fc04i1Mdci/RVV7ws455S8YGCrjHcTTAB8MW7foBRaWItLjB8XeY+w5U9cLQanze3K8yGcRQCkFrYYW4OiEPYk0KsZkEW/IIua110Ldp6sD1uXdmx0V0+bTxFZFFIKpzSXtdhcEg87uIRz8XbYOLmrKgiJBbmta6BJtz5QkOsn9veNdrBa1h33T9x6xwhMNOXQAydex4Q9GoGLNYJbbFrUCCkrTLTt/RMXivF9jAcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS1Y8vRrhume8YXkGJlX44ug9lhWsrPmPWVGxSzljNI=;
 b=FdAq4Y5x0j5Srntw0tQVdYNLjYh1hslCbpbI8emgAOPi9IqphUMYUJB2w4+X7liWHcD5u04xnk7aKTuJOc93NcaNwFJVfQGv6v9t0GWDxjS/KvJs5JTAZCGAgVZVeR7eDSiU9XuZCSoCA+FHeavghFSYK8b7OcBMCFQvoWPGfWz7pofVrO0gmyw1O1QAjqWdsnMpjiWvRKg92SND/ESAXJMoilV+S8plOZA836HO4OKxQvVe4P1wOgcxMIgYo5D+0MD13b2D2WvgYMy8j9egrx9U8QAJvYvepmg0kg4mKmA6kAifj0WNuL5VRHj2vdGIo3XeL8Y0wauivMRTB9OPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 10:54:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 10:54:21 +0000
Message-ID: <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
Date: Fri, 27 Mar 2026 11:54:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
 <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF0000012E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8ad) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: ed21416d-05a8-4458-b260-08de8bef3372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 4dklgozDEAvh0T/Fm6Uk4IpEuh92TnBqflKbGN8mh2rvVMxsT6NYKT05AQU4viX2Tm7+ItUJhFXAbSZhbiFfS3u3ANsI6NuTEkJAEn17r17WBleXZlfOOTUBlwUo4vP8mbU5kYmhhPhSNqED0avU/eCfZLcNPayRmXpH304KKDlUSJ182SgRGRZ7RxjLhT+9lQaLfGtILC62vg2CfOO8ywGito354+hW5x/4XnW3tveHSvfNghTXqan98UnPyBFciklCNvqzi0dH8tP/sADdyNF/W2q+tmkPTLyihoq4IJsqSYnMGmN6JD5PtFTzsOnmdexLLsQQt3EQg/gAnvWXIyR+FDeGaPS/n5jxy102h0JG/oHZKF8gVX1vyqq3wpWQUIzVfxA7qjeEIhAMn4bRdhuk8rIxWc96U6h6qzsQMNLLMjkQfL/6AdKwrBqQG30NT7uCYSafokWmTl6Zk20Zaj700KIoYPyRoM15aWKqb53M+Gb2c1IIPo1d/csnavA9EtDnz+jSUoic+LbQ/fCJze54XOUA+n7Ygqpp658owqzOHgfcZe+Z4JChitoAHZOKJqM1iofg0LZt/8LBlhTxFbQRkXWSNN+0LtpD+LFIu5DD3PJpo3TxUbTW9sDUginjvNnY1B4y4gdFTfHbTZqZxCGQc5t5WZUmLRCJ7O/RvS4K+q6dBdlBsuZho8OamfutHyVx76d8KOwNZSDsRQWxoqsk7VfVdJTIbQx3urmuUAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akxwWjdhM2ZQRE84WEJmZjBsYjlOZG5Ed09kRklBMFN3QmJteVE2TWJ1dDEw?=
 =?utf-8?B?cG02TG5KdVNZRWhPbnNTc29nVWxlOTB2RXQ0OTVabExCejhtSTdISUF3ZG44?=
 =?utf-8?B?TmR6S293Wkc4N1FZL0lrRGhVdkJkc0xzVUswZk9mTU4vOU5QQjN5U0hGU0sv?=
 =?utf-8?B?cU10SDhQSmFLa2xBVWRWSzFJaTNkcUxzUFdTMCtKWFhibFduRXkrUzZHTGl2?=
 =?utf-8?B?QWhCb29BbXVoZ3dSTnROL3lIT0NhaStCdDl6TytMK1JLRlg3bXp1VVVsajlj?=
 =?utf-8?B?STNUeGlmem84dk9SeGtmLyt2bnNoOHB6Slc2QURReS9OazFEYmgzWlArR0Js?=
 =?utf-8?B?VzIyb1VTZjBFYVRmaXNHb0F3R0Y3TElEK29WRVIxRGFSbEpaUHVYUzZZeXBG?=
 =?utf-8?B?RjZFNVRVN05vNlVwVGpSVTZobFZzU3QrMkxzK216QU5yQzdpaTRYUUVyY1pL?=
 =?utf-8?B?ckRwZjFkQzEwWFRINVM5RlliMXppWW10V2NOOThicmp0Q29zMTRSem5wYk5Z?=
 =?utf-8?B?TWQrRlVGM0ptSllDSkhBdndnbHlEUmxzZHNZRG9jc1dsSHc5UFM5RkRFWXlk?=
 =?utf-8?B?ZFJSUzg0ZWRhS0o5c2xpbDJYY3lCb25yNXZBWVAxVEZCb0FDN1JuSHYvcjNj?=
 =?utf-8?B?OGxGRmRBMXZnc3F2VHFSaFN3WlE2K3M1ZWpMYThad2ttc1F3bVp5MkIxSWU5?=
 =?utf-8?B?M241Uy9ma2F6eE92Sjl6TVc3ZU9qL1lVMDRRQlM5L3R5VGtVcmg2SXlVRHph?=
 =?utf-8?B?bHFDbEJhYkpGSDBPQS9RR2xwV1FtMFMyS3djZ0JUUDY3UEtHNkxQZ1ZpdXoy?=
 =?utf-8?B?R1pMTzVnK09iRGlVWXBReXozb3hUSmNsVnFQRzhFNGxNd1NiaWxVVmlxNlQz?=
 =?utf-8?B?MHRwTXNDOWc4aFE3WEpneGx6MTFIekZHYzI4TWZuTitSMlpOSzJDRWxIYTNx?=
 =?utf-8?B?RHZUZlgwRnJ4bGxmQlA3QjVaSFliZXBBSWMxWTdmY1VyaDRyWEJVNHp0UFdD?=
 =?utf-8?B?ODh5c0pMelhtZGsxY2VXc000QXBoQkhlQ0FPcnZEd2VZZ3BFQ2hhMjNsRmhq?=
 =?utf-8?B?bVRIeEc4OFdLRjd2RUdqQXVSb2NVY054VXloV3lwUStqbmk4WVpkUUJNYitN?=
 =?utf-8?B?ejl2R3JOS3UxUXBYWHdhYlI2MXBsckZMNElZa1d4OGRmbnN2a0ZIZXoya3pN?=
 =?utf-8?B?T0Q1Wlg3cEFzZ1RxenMvUUs2ZHo1WUEraVZRdGg0a1NtSGJnRDdvRUFpZjlE?=
 =?utf-8?B?ZmFjY01BL1NBeUlaQXRiVE1vaFhvMHhmbGpkRDNta1pXWjdEU2RCNUdaclUy?=
 =?utf-8?B?OXhZSmVEYzlqa2JlVURiU2MzcXI4UVJnM2ZoYU9KNHJpbUJLeDlLeHp2bjlT?=
 =?utf-8?B?QTV5YWpaQzNkYUtXbVZvdFVXQ1NGNEZtSU1uaWlYWUpjNTlxTzFVRFJjY0xq?=
 =?utf-8?B?QUVKQXowVHU4bi9sbkdrc3Y4dktQbXNxakVkZExQOUdTMDJMdVF0bDg4N01m?=
 =?utf-8?B?MjE0cDBaQWdId3Z6cGhZUU8rS0JURUErenpzb0hmS0MxbW95ZlZKaThXNnV5?=
 =?utf-8?B?YUJnbE8vSkppdFJDbGRkUVZIMkw4blNOOURzRXNpY29OWk45KzNGcGtoUXEy?=
 =?utf-8?B?Lzg3V0ZyWVdtcmpsMXppZVFwQjNXSkY5TTg5UkhqY2NjN1J4TTF6d3FPU1RR?=
 =?utf-8?B?WDIzQ0lWWm1nZmJ5M3JNOW9UaGNIUytmN2hvSzF6TWFJcEo3ejZpVXJKeTNX?=
 =?utf-8?B?cGZEM3E2NHVMeWNWdkR4ejFDNkhVd0w1aGJGYWpkQjdUbmNrVVYybFRGZ3A5?=
 =?utf-8?B?VDc3aVpUSDlyenV3cEVyZTh0bml2QXdzWm05WmNNMlhzN05TNFpJUHptbHBs?=
 =?utf-8?B?djVWbCtNZHZOYUovMkxqZ0MrMG9JQlNMN2REcmJDek9sTU5Rai9aajNDcWhB?=
 =?utf-8?B?Ny9LUzAwY3B2aXNLbmdVS01NNDdDbmdmbXByTEZZbTZKMkQ1Uk5WUml6em12?=
 =?utf-8?B?U21PWkE1aGxxV08rYis2NkJPRDlCeVNaNlVzQ0FQdTRuYll1UnpoaW83OHZU?=
 =?utf-8?B?ZHNmaDBlNG9mcVNUMzFhUHVGYnlWWkFLWUpuWEJ3MGNBcWtmdkk3RmdRYldZ?=
 =?utf-8?B?SlhTSkI0dGNPVXlMZGhIblUrdUdGc0pVQWlXaVpOTTczOTFieG55bTNlL0Vl?=
 =?utf-8?B?UmFYNkt1cUp3RW1zelZYdEh1Unl5VjJEeERXMmhzQndLWnlVY1NBMm01VjlW?=
 =?utf-8?B?R2tKNlFVblhlK0pOQ3RTSEhHZTFmUVZpTU00cWE4UFhwa2lWZm1JLzdibGRI?=
 =?utf-8?B?WFpyQjBkeHNQNFRqbzJkTWloWXJaRWJBaGhkbUc2bExMd3k4YjMwZFVLUUFC?=
 =?utf-8?Q?lYlJi88OyNs5Utzk=3D?=
X-Exchange-RoutingPolicyChecked: rvKXjHIesl8vxmvbn0fXgxri6RlcRi1tol2/lbsIFScKLZkvcMWeUesZTcqSA6LzLLNAA0TVu0jc0WKTWvpB8Mpk98uW4jUeuQ9Qmn3INye6RKUMNMXJo+KxAzWO+RfFYgaksURbAJwvozigNg3L6SYmQnSE2tD9WmdBpbM0oO4aFbQkJTB3wgFRr0rZXZlYYgn/gG2f6aEKZDvUSUE7WDDM5fuB2o6aO7pRdPjbCzvsFl5TobCfw7+jPD82QsJL0HBLw6ovJ0P/4diKUSkLbBmHnfpAFdPWqO3hv7g8ic9nbGEtwbXNTKVKz4+GD/UVnLAwl6rMPvAV5COTOI70Fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed21416d-05a8-4458-b260-08de8bef3372
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:54:21.1293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oAR9XH27JH/wpEYUJaXey8eFVuNK5eJYEU30KjLhC01nvnrNIl+rolgQoY+25tBKtswHve5SPqFPhtf8l3VlZurGYLkQijQMoCk5UCWR/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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



On 3/26/2026 8:57 PM, Thomas Hellström wrote:
> On Fri, 2026-03-20 at 12:12 +0000, Satyanarayana K V P wrote:
>> Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed pool
>> using drm_mm.
> 
> Just a comment on the naming. xe_drm_mm sounds like this is yet another
> specialized range manager implementation.

well, in fact it looks like *very* specialized MM, not much reusable elsewhere

> 
> Could we invent a better name? 
> 
> xe_mm_suballoc? Something even better?

xe_shadow_pool ?

or if we split this MM into "plain pool" and "shadow pool":

xe_pool		--> like xe_sa but works without fences (can be reused in xe_guc_buf)
xe_shadow_pool	--> built on top of plain, with shadow logic


more comments below

> 
> 
> Thanks,
> Thomas
> 
> 
> 
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |   1 +
>>  drivers/gpu/drm/xe/xe_drm_mm.c       | 200
>> +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_drm_mm.h       |  55 ++++++++
>>  drivers/gpu/drm/xe/xe_drm_mm_types.h |  42 ++++++
>>  4 files changed, 298 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile
>> b/drivers/gpu/drm/xe/Makefile
>> index dab979287a96..6ab4e2392df1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
>>  	xe_device_sysfs.o \
>>  	xe_dma_buf.o \
>>  	xe_drm_client.o \
>> +	xe_drm_mm.o \
>>  	xe_drm_ras.o \
>>  	xe_eu_stall.o \
>>  	xe_exec.o \
>> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c
>> b/drivers/gpu/drm/xe/xe_drm_mm.c
>> new file mode 100644
>> index 000000000000..c5b1766fa75a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
>> @@ -0,0 +1,200 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>

nit: <linux> headers go first

>> +#include <linux/kernel.h>
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_drm_mm_types.h"
>> +#include "xe_drm_mm.h"
>> +#include "xe_map.h"
>> +
>> +static void xe_drm_mm_manager_fini(struct drm_device *drm, void
>> *arg)
>> +{
>> +	struct xe_drm_mm_manager *drm_mm_manager = arg;
>> +	struct xe_bo *bo = drm_mm_manager->bo;
>> +
>> +	if (!bo) {

not needed, we shouldn't be here if we failed to allocate a bo

>> +		drm_err(drm, "no bo for drm mm manager\n");

btw, our MM seems to be 'tile' oriented, so we should use xe_tile_err() 

>> +		return;
>> +	}
>> +
>> +	drm_mm_takedown(&drm_mm_manager->base);
>> +
>> +	if (drm_mm_manager->is_iomem)
>> +		kvfree(drm_mm_manager->cpu_addr);
>> +
>> +	drm_mm_manager->bo = NULL;
>> +	drm_mm_manager->shadow = NULL;
>> +}
>> +
>> +/**
>> + * xe_drm_mm_manager_init() - Create and initialize the DRM MM
>> manager.
>> + * @tile: the &xe_tile where allocate.
>> + * @size: number of bytes to allocate
>> + * @guard: number of bytes to exclude from allocation for guard
>> region

do we really need this guard ? it was already questionable on the xe_sa

>> + * @flags: additional flags for configuring the DRM MM manager.
>> + *
>> + * Initializes a DRM MM manager for managing memory allocations on a
>> specific
>> + * XE tile. The function allocates a buffer object to back the
>> memory region
>> + * managed by the DRM MM manager.
>> + *
>> + * Return: a pointer to the &xe_drm_mm_manager, or an error pointer
>> on failure.
>> + */
>> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
>> *tile, u32 size,
>> +						 u32 guard, u32
>> flags)
>> +{
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_mm_manager *drm_mm_manager;
>> +	u64 managed_size;
>> +	struct xe_bo *bo;
>> +	int ret;
>> +
>> +	xe_tile_assert(tile, size > guard);
>> +	managed_size = size - guard;
>> +
>> +	drm_mm_manager = drmm_kzalloc(&xe->drm,
>> sizeof(*drm_mm_manager), GFP_KERNEL);
>> +	if (!drm_mm_manager)
>> +		return ERR_PTR(-ENOMEM);

can't we make this manager a member of the tile and then use
container_of to get parent tile pointer?

I guess we will have exactly one this MM per tile, no?

>> +
>> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>> +					 
>> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +					  XE_BO_FLAG_GGTT |
>> +					  XE_BO_FLAG_GGTT_INVALIDATE
>> |
>> +					 
>> XE_BO_FLAG_PINNED_NORESTORE);
>> +	if (IS_ERR(bo)) {
>> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for

xe_tile_err(tile, ...

but maybe nicer solution would be to add such error to the
xe_managed_bo_create_pin_map() to avoid duplicating this diag
messages in all callers

>> DRM MM manager (%pe)\n",
>> +			size / SZ_1K, bo);
>> +		return ERR_CAST(bo);
>> +	}
>> +	drm_mm_manager->bo = bo;
>> +	drm_mm_manager->is_iomem = bo->vmap.is_iomem;

do we need to cache this?

>> +
>> +	if (bo->vmap.is_iomem) {
>> +		drm_mm_manager->cpu_addr = kvzalloc(managed_size,
>> GFP_KERNEL);
>> +		if (!drm_mm_manager->cpu_addr)
>> +			return ERR_PTR(-ENOMEM);
>> +	} else {
>> +		drm_mm_manager->cpu_addr = bo->vmap.vaddr;
>> +		memset(drm_mm_manager->cpu_addr, 0, bo-
>>> ttm.base.size);

btw, maybe we should consider adding XE_BO_FLAG_ZERO and let
the xe_create_bo do initial clear for us?

@Matt @Thomas ?

>> +	}
>> +
>> +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {

hmm, so this is not a main feature of this MM?
then maybe we should have two components:

	* xe_pool (plain MM, like xe_sa but without fences)
	* xe_shadow (adds shadow BO on top of plain MM)

>> +		struct xe_bo *shadow;
>> +
>> +		ret = drmm_mutex_init(&xe->drm, &drm_mm_manager-
>>> swap_guard);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>> +			fs_reclaim_acquire(GFP_KERNEL);
>> +			might_lock(&drm_mm_manager->swap_guard);
>> +			fs_reclaim_release(GFP_KERNEL);
>> +		}
>> +
>> +		shadow = xe_managed_bo_create_pin_map(xe, tile,
>> size,
>> +						     
>> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +						     
>> XE_BO_FLAG_GGTT |
>> +						     
>> XE_BO_FLAG_GGTT_INVALIDATE |
>> +						     
>> XE_BO_FLAG_PINNED_NORESTORE);
>> +		if (IS_ERR(shadow)) {
>> +			drm_err(&xe->drm,
>> +				"Failed to prepare %uKiB shadow BO
>> for DRM MM manager (%pe)\n",
>> +				size / SZ_1K, shadow);
>> +			return ERR_CAST(shadow);
>> +		}
>> +		drm_mm_manager->shadow = shadow;
>> +	}
>> +
>> +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
>> +	ret = drmm_add_action_or_reset(&xe->drm,
>> xe_drm_mm_manager_fini, drm_mm_manager);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return drm_mm_manager;
>> +}
>> +
>> +/**
>> + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the shadow
>> BO.

do we need _bo_ in the function name here?

>> + * @drm_mm_manager: the DRM MM manager containing the primary and
>> shadow BOs.
>> + *
>> + * Swaps the primary buffer object with the shadow buffer object in
>> the DRM MM
>> + * manager.

say a word about required swap_guard mutex

and/or add the _locked suffix to the function name

>> + *
>> + * Return: None.
>> + */
>> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
>> *drm_mm_manager)
>> +{
>> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
>> +
>> +	xe_assert(xe, drm_mm_manager->shadow);

use xe_tile_assert

>> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
>> +
>> +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
>> +	if (!drm_mm_manager->bo->vmap.is_iomem)
>> +		drm_mm_manager->cpu_addr = drm_mm_manager->bo-
>>> vmap.vaddr;
>> +}
>> +
>> +/**
>> + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the
>> primary BO.
>> + * @drm_mm_manager: the DRM MM manager containing the primary and
>> shadow BOs.
>> + * @node: the DRM MM node representing the region to synchronize.
>> + *
>> + * Copies the contents of the specified region from the primary
>> buffer object to
>> + * the shadow buffer object in the DRM MM manager.
>> + *
>> + * Return: None.
>> + */
>> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
>> +			   struct drm_mm_node *node)
>> +{
>> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
>> +
>> +	xe_assert(xe, drm_mm_manager->shadow);
>> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
>> +
>> +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
>> +			 node->start,
>> +			 drm_mm_manager->cpu_addr + node->start,
>> +			 node->size);

maybe I'm missing something, but if primary BO.is_iomem==true then
who/when updates the actual primary BO memory? or is it unused by
design and only shadow has the data ...

maybe some DOC section with theory-of-operation will help here?

>> +}
>> +
>> +/**
>> + * xe_drm_mm_insert_node() - Insert a node into the DRM MM manager.
>> + * @drm_mm_manager: the DRM MM manager to insert the node into.
>> + * @node: the DRM MM node to insert.

in recent changes to xe_ggtt we finally hidden the implementation details
of the MM used by the xe_ggtt

why here we start again exposing impl detail as part of the API?
if we can't allocate xe_drm_mm_node here, maybe at least take it
as a parameter and update in place

>> + * @size: the size of the node to insert.
>> + *
>> + * Inserts a node into the DRM MM manager and clears the
>> corresponding memory region
>> + * in both the primary and shadow buffer objects.
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
>> +			  struct drm_mm_node *node, u32 size)
>> +{
>> +	struct drm_mm *mm = &drm_mm_manager->base;
>> +	int ret;
>> +
>> +	ret = drm_mm_insert_node(mm, node, size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node->start,
>> 0, node->size);

iosys_map_memset(bo->vmap, start, 0, size) ?

>> +	if (drm_mm_manager->shadow)
>> +		memset((void *)drm_mm_manager->shadow->vmap.vaddr +
>> node->start, 0,
>> +		       node->size);

what about clearing the drm_mm_manager->cpu_addr ?

>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_drm_mm_remove_node() - Remove a node from the DRM MM manager.
>> + * @node: the DRM MM node to remove.
>> + *
>> + * Return: None.
>> + */
>> +void xe_drm_mm_remove_node(struct drm_mm_node *node)
>> +{
>> +	return drm_mm_remove_node(node);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h
>> b/drivers/gpu/drm/xe/xe_drm_mm.h
>> new file mode 100644
>> index 000000000000..aeb7cab92d0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#ifndef _XE_DRM_MM_H_
>> +#define _XE_DRM_MM_H_
>> +
>> +#include <linux/sizes.h>
>> +#include <linux/types.h>
>> +
>> +#include "xe_bo.h"
>> +#include "xe_drm_mm_types.h"
>> +
>> +struct dma_fence;

do we need this?

>> +struct xe_tile;
>> +
>> +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW    BIT(0)
>> +
>> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
>> *tile, u32 size,
>> +						 u32 guard, u32
>> flags);
>> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
>> *drm_mm_manager);
>> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
>> +			   struct drm_mm_node *node);
>> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
>> +			  struct drm_mm_node *node, u32 size);
>> +void xe_drm_mm_remove_node(struct drm_mm_node *node);
>> +
>> +/**
>> + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back
>> storage BO
>> + * within a memory manager.
>> + * @drm_mm_manager: The DRM MM memory manager.
>> + *
>> + * Returns: GGTT address of the back storage BO
>> + */
>> +static inline u64 xe_drm_mm_manager_gpu_addr(struct
>> xe_drm_mm_manager
>> +					     *drm_mm_manager)
>> +{
>> +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
>> +}
>> +
>> +/**
>> + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard swap
>> operations

hmm, do we need the _bo_ here?

>> + * on a memory manager.
>> + * @drm_mm_manager: The DRM MM memory manager.
>> + *
>> + * Returns: Swap guard mutex.
>> + */
>> +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct
>> xe_drm_mm_manager
>> +						    *drm_mm_manager)
>> +{
>> +	return &drm_mm_manager->swap_guard;
>> +}
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h
>> b/drivers/gpu/drm/xe/xe_drm_mm_types.h
>> new file mode 100644
>> index 000000000000..69e0937dd8de
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DRM_MM_TYPES_H_
>> +#define _XE_DRM_MM_TYPES_H_
>> +
>> +#include <drm/drm_mm.h>
>> +
>> +struct xe_bo;
>> +

without kernel-doc for the struct itself, below kernel-docs for the
members are currently not recognized by the tool

>> +struct xe_drm_mm_manager {
>> +	/** @base: Range allocator over [0, @size) in bytes */
>> +	struct drm_mm base;
>> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
>> +	struct xe_bo *bo;
>> +	/** @shadow: Shadow BO for atomic command updates. */
>> +	struct xe_bo *shadow;
>> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
>> +	struct mutex swap_guard;
>> +	/** @cpu_addr: CPU virtual address of the active BO. */
>> +	void *cpu_addr;
>> +	/** @size: Total size of the managed address space. */
>> +	u64 size;
>> +	/** @is_iomem: Whether the managed address space is I/O
>> memory. */
>> +	bool is_iomem;
>> +};
>> +

ditto

>> +struct xe_drm_mm_bb {
>> +	/** @node: Range node for this batch buffer. */
>> +	struct drm_mm_node node;
>> +	/** @manager: Manager this batch buffer belongs to. */
>> +	struct xe_drm_mm_manager *manager;
>> +	/** @cs: Command stream for this batch buffer. */
>> +	u32 *cs;
>> +	/** @len: Length of the CS in dwords. */
>> +	u32 len;
>> +};

but we are not using this struct yet in this patch, correct?

>> +
>> +#endif
>> +

