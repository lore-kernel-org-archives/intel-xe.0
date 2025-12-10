Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC53D3C520
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 02:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E433A10E23B;
	Wed, 10 Dec 2025 02:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvuUPO4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD1510E23B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 02:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765332811; x=1796868811;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1AI2cHBs4awrnBInxIEd0oc4YuNWaq9Spsf3CZcNlos=;
 b=jvuUPO4VWDVtISkvuJRckqvUqWJlNa3FFL3av59m2P4YbjFdjmb0RI0Y
 7QYyey3aac7UyRXJ8C/zSJxBa0HH/5RaMV2lV3bhNL03USvjrLEz8RkTT
 I0DRpEyYJ4s5x9qIFsa1HHNBOE7RPPCXHooDw6NGeGdjn/nsZ0PXBhH75
 LP0X/z9Bw+zlHZ1RJb7mvyYY2rgNrrQRwRDQMrpDywSFOaxaNrpO0dAb8
 sKsd1pwDg9ot7XOMuyiMXakU4YGYZWaV16kFCClnJBkY3b0Jqmol0+koV
 GvsJ90amUHhSnYe9sjTjyK7/fGsCRqFc9cGFugSkFj4cpm6IUr1YDEahq A==;
X-CSE-ConnectionGUID: rHgsbuBuRGGBP+haMTUonw==
X-CSE-MsgGUID: ogXqufM7RUeuPvsd4V5MgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67259178"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67259178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 18:13:31 -0800
X-CSE-ConnectionGUID: PT3cUjxcRui6Ha0Z8qyOUA==
X-CSE-MsgGUID: UHbcVIjSQWue22rvryZyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233789107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 18:13:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 18:13:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 18:13:29 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 18:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGDqqp2kGPy9Jpyanfbg1CyIPxhRzoVNZhwWVNPwh19vPkcslF5tk31V4Ertv2xDIZxQvXZx+TFI+0uBmZsAlNy6rxzk9QFRs2Md5Fy+9jupa5J6DvrLfspJk8Gyxp+4WUDb04DaPRcKtdK7ZFuPAisvlmMggM0/YjJKWiHbIi+WtSUicAFJuGMShEi+qr31xdd3Cmo8xrd2PigabwlIp61RB51ACtr+3CDG5+QUin3rjyoSNYEFsW9bqRleyzTN66xTEXzFcZoBoADnM+sCgLza9JbrV+Kus72sMkqgEhuCMvGoor6HcoVWRquBYLp6S3c7F8BpQ4w5uFyZDYxH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN4hghKjIUYd51sjZzWEPcGeeGxQ0/FqZUrpmGEOB2A=;
 b=JzSJolvyBzOg9jW5R1tq9zt40mF4GWcMXR2JisRvIm9sMJyfscM8nTN/6rtJZOL3b5MdSzwXnDHDCOaoJJWw3MLDi+Nr6wxYx2EPFVgq66ACjd5oSHezQR5RKD+WPCL+x1PltELMHQ9VBD4s2BOA6T5Tol7hEZo01DV5lPu9bTxOUpcOINR1CddGg0xNTynLMc+kgKj1clWw9kBi0JrvZlSlozl9RxwHzAQ+y57HPJy8DNDgyjI3Hq0AjEhnB0G9loTeytP+9dUTLMjFiY6Y3Gi16pxXAB9Ko/Vo3Ff5XXYkNJJ0rcys2Uwo3JzGMrxg0TNlVw5PaEDJWiNjfUR4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 02:13:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 02:13:28 +0000
Date: Tue, 9 Dec 2025 18:13:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v5 05/10] drm/xe: Create page reclaim list on unbind
Message-ID: <aTjXRbEHlylasObD@lstrano-desk.jf.intel.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-17-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210014517.3184135-17-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: b8526f43-e3e7-43f9-f82c-08de3791b4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lKZyah26okqNl/wV1ykV62D6clvGDa2Un1EqF5VmEbQ4+P2hoPQI+1NocU?=
 =?iso-8859-1?Q?L5cb+ZKlFZkp6pj0SLe34ex/fRlB7r9XTSsKgDDKtVrpFEpOQAI0VDmDAH?=
 =?iso-8859-1?Q?93dglTm67AViP4jk1aR9qZdbANPiyhr8Gutauf//soNTaclkn/ozrJJVuy?=
 =?iso-8859-1?Q?dfXIL04vT5RgxIOfJzgLEFGDoN2QTAHjrRO1W61Mcv+O4IqYDWsqiFarPO?=
 =?iso-8859-1?Q?ad14IPpzTpiG637SQ+HxPN63ZGOhqcynTHDS0B9rTEfgM/L8MY4IQNvEWf?=
 =?iso-8859-1?Q?8SfWKvgAGwQHkap6GPObfCwgc2tN34Cz7W5CybdeS6Iubw/LC8KeK30Y0p?=
 =?iso-8859-1?Q?og3AuwXIa/TE3JYcdqEIYYWKmzOK4zuN/TPxxGOZGR4EXkeVYhir0OC6lJ?=
 =?iso-8859-1?Q?hKk1rblGKFbgxw0wPxqXu+7+U0RXKo1BAkkvO6XmRAYeggQuEYccLSnxbN?=
 =?iso-8859-1?Q?GR4tiHEcTPTnnUVlpvhjh4F3RUNqc9DaHvsah75qmWnN6im1yLJpQQ4uFK?=
 =?iso-8859-1?Q?nLs+QntuJG/QfOi22XS3XIrKNk1RaA05/dB1bFSaREu+8GTJe9uhZeER29?=
 =?iso-8859-1?Q?4KfIiRek/r2nLzkV+SHvzvfs/kAljk2wFzWq7MSYTtIn1UZuygRLKmWTls?=
 =?iso-8859-1?Q?JJv9MjqsdU02c1UyCs1ULxxzRpB2eGVbjvfNF6RHPw+pyQ8h4ZGxgk7ljr?=
 =?iso-8859-1?Q?Oewsxz4a7eKoK6JYRilrRxfSmjErF1TvcXB7jKBNBglwltZoIyJkN8DYbD?=
 =?iso-8859-1?Q?nqtymWEFc4D5iDexpW+oFzb4ng+27FQxKMiEnYH1ptZb9b1tNq5FVN1FLp?=
 =?iso-8859-1?Q?1/nA9oUVJyo9Zm1kEms7YpOawUdFqPi6ztGs1vjdbspI6prX0Gb6YOP1uJ?=
 =?iso-8859-1?Q?10fWI6UazXLHTbjjyahymcUbau2p/XkAyfFbokkkHGGT9ULVQIeksPJkDr?=
 =?iso-8859-1?Q?MrRH+hDRpNIgE4dO23l6JnzDJcywJFBOliLCFmxAQYp06or3QqLm+LP9Nn?=
 =?iso-8859-1?Q?yoAO+IhlYLWfzCapjebbobMiVPmUbhYQUMFM1trOGIlRQoOi6x5kIIxM6f?=
 =?iso-8859-1?Q?WxW1AiXDTiPDWl558kOZ1VXPdEFTiWCSOWx+Uq/oGm8shbyHR7aukijN3P?=
 =?iso-8859-1?Q?yHl7bAxfCn6hM7pUJo/l/SBR9vJr/DXnuuJPTyRQE5dcaflbcqcGKQfJJO?=
 =?iso-8859-1?Q?EZapRRhRSMzOlxGtAchlRMuWOXAGqO0RNKT0S1smef7IIQU8pewyeO3bNP?=
 =?iso-8859-1?Q?V7HwcMmcuS5w9kIy0bZjfJHMVMIwVyqtPCYoGUsL8+mN37Kmd7dSJG0kfG?=
 =?iso-8859-1?Q?mKafDwH9Z7RHEN7AAnzB4tgTR229qECTatnarydbyV8K2j2CBmDm6JYzFv?=
 =?iso-8859-1?Q?dpy4F+tN7BBb9Wni5gsyNeNfmOcLNFtZeMAMqKjiZTLdGyvTI5Tlj+qdLq?=
 =?iso-8859-1?Q?XcEDSQv8BGVjuAJ2NnkxPFcSAZczVC//Ni58P+R3uCkjorFG9EOeKhPBZ6?=
 =?iso-8859-1?Q?/p2sWIQ6hyOTSvYsWMV46Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AN3TVFNJxLQC8eTdOAOX4lMm8WwNhdaF/iRDeRfHPJsImBle/cXHJboy+3?=
 =?iso-8859-1?Q?bDIh1ADawIRSbmgkPrVjXymEL7lbaRB9QI+/j4odkxm7L9hFXmlVNuq+O+?=
 =?iso-8859-1?Q?Tk8QBwznLhNlPxw+k7AC7l7hXVEGlBa8Et2KjGWvCQRfUQiH2QewN50JxM?=
 =?iso-8859-1?Q?wEQN+WUgOlsgfr72xxd6V1YNK0FzUaoOuCOv57f67Poiiz+tio2JwvjVPW?=
 =?iso-8859-1?Q?jNdvdDWtFMaCDwROUk1eAjwnUQTeP6U3tBvCSS10A97qOPLiy44t5lYlqf?=
 =?iso-8859-1?Q?7GtmA6wpZze2MdC+rCyzFVcbSVH3KOeDRUrovSFtTLWvjBpjx9/Crd0oZ9?=
 =?iso-8859-1?Q?pSt1SZN8CF2Er0miLD7zzyUAPFYjK/Zh0GN23d/A1DuhdIyrS2oy51OSj7?=
 =?iso-8859-1?Q?pyQo6iWb+l/l4QoEOs3Fpg5/4z1DZrpF5lbB4qTjppbV6pMMX1M8Qs0YUm?=
 =?iso-8859-1?Q?AStLbVNBGP9+K+qrm4K7OvOUdD8dulB3Q6YKAIiJHH62Rs4t+zwfkSZCOO?=
 =?iso-8859-1?Q?bC5oZvUTCQSU6BSeeTvpEEKFsrdmZWBYIP51Z5eK7kh1mBYN4/bY7OsMJB?=
 =?iso-8859-1?Q?8jHINt9/GNObAUmgqhnNwU3ecVixUVLqXc9WAh9PPungGL3o8BXV9uqxj7?=
 =?iso-8859-1?Q?oiOGISX7E3w28WbIm/7FSOAloAXzlMLUUcT0a1WpfA2Y6KJxyDQf+QNXIX?=
 =?iso-8859-1?Q?W/x7cI2QB9NWQoSjv492u/I04hAzi3XzWRKfMRsc38wXImIonCGPX2hO1e?=
 =?iso-8859-1?Q?3hOGmC5sJRDaddfNLDHvtY4zrPOz29DCvgiQeOSsa15/8yMzARygV1t5bY?=
 =?iso-8859-1?Q?RVoHdUea3zurO8iTfP3cEMgqDt1qRnEyEK0vE0p6xaOrNLvfiSwsvGgX2L?=
 =?iso-8859-1?Q?lgTqkg9ifFw8S264DTB4hWDfe227qacG2DBl6hI5D3SIVzYXHQJcSEeB7m?=
 =?iso-8859-1?Q?QX2o/klA8gclwM+AqPMXbnObJ/H7jnMWzEKEEr/aD1sSJeA0GE9jejg/c0?=
 =?iso-8859-1?Q?I9T5boq8FK8Awx8Id7XmoIf3/qOrVicfoz88oAIi22q/Phg577mrYHlInw?=
 =?iso-8859-1?Q?8wRBtQ8IGPqdt0TwaY9jxp/Ef97qNWBXPkMAjDDKoHKeWcMKPQLnT5+Tad?=
 =?iso-8859-1?Q?6VUGSUCZGbN4GDx2HUvJ1xF/ZZP9OlGfSF7J3gnYrsSb2lWXN6aFSv0KGx?=
 =?iso-8859-1?Q?Lwe/wrP8tdtGFTyfbzaMzKPzrqFsV4eSGH9c4LtKWWuQSs+mu+rNuG5Clj?=
 =?iso-8859-1?Q?ysmJ0tzQ6RZJ0NdjOoLGEWuncbyNtCQYW6XHPoevLlDFFGaiyPm6oZEzxB?=
 =?iso-8859-1?Q?h/uzYBL8WMaW++AlBW1o+VWrldXokAGKbFrF3998sM59Q9ho4wokcs5JK+?=
 =?iso-8859-1?Q?P0wHQZksA08179mOYHVOVmAvaiz4j3Z4DtrfY5rwUPYVO3B0xZgp1ZLecR?=
 =?iso-8859-1?Q?ORs0gdsP3WVwPay6+lK/BsdR3oxdunuXFyZYTc3gtPga0RGHZKYppG+SNR?=
 =?iso-8859-1?Q?8/gzFUuQXIKkgMiNDROEBdqoZcjBJCIWottghdN+1buje+RpUW7Bvnb5GY?=
 =?iso-8859-1?Q?GyJczOlyo9QwB59qZKBGVZP3zW7dZKCYP4bnMOGTe3dU82zzOBmidmZEHW?=
 =?iso-8859-1?Q?Udwe9KKxtAhMWsouVF9waUoQtjjMRF05yJnLgNP8Xc6elUFrF06rpZxg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8526f43-e3e7-43f9-f82c-08de3791b4e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 02:13:27.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLEuN2rP6hi7KlJ1aLdDICBsRnNTyqlafUtpxpskNZK7KGZmkcypiGLJzv2cX9Lov/DXzT7LPPQQS43p1gaKZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Wed, Dec 10, 2025 at 09:45:23AM +0800, Brian Nguyen wrote:
> Page reclaim list (PRL) is preparation work for the page reclaim feature.
> The PRL is firstly owned by pt_update_ops and all other page reclaim
> operations will point back to this PRL. PRL generates its entries during
> the unbind page walker, updating the PRL.
> 
> This PRL is restricted to a 4K page, so 512 page entries at most.
> 
> v2:
>  - Removed unused function. (Shuicheng)
>  - Compacted warning checking, update commit message,
>    spelling, etc. (Shuicheng, Matthew B)
>  - Fix kernel docs
>  - Moved PRL max entries overflow handling out from
>    generate_reclaim_entry to caller (Shuicheng)
>  - Add xe_page_reclaim_list_init for clarity. (Matthew B)
>  - Modify xe_guc_page_reclaim_entry to use macros
>    for greater flexbility. (Matthew B)
>  - Add fallback for PTE outside of page reclaim supported
>    4K, 64K, 2M pages (Matthew B)
>  - Invalidate PRL for early abort page walk.
>  - Removed page reclaim related variables from tlb fence
>    (Matthew Brost)
>  - Remove error handling in *alloc_entries failure. (Matthew B)
> 
> v3:
>  - Fix NULL pointer dereference check.
>  - Modify reclaim_entry to QW and bitfields accordingly. (Matthew B)
>  - Add vm_dbg prints for PRL generation and invalidation. (Matthew B)
> 
> v4:
>  - s/GENMASK/GENMASK_ULL && s/BIT/BIT_ULL (CI)
> 
> v5:
>  - Addition of xe_page_reclaim_list_is_new() to avoid continuous
>    allocation of PRL if consecutive VMAs cause a PRL invalidation.
>  - Add xe_page_reclaim_list_valid() helpers for clarity. (Matthew B)
>  - Move xe_page_reclaim_list_entries_put in
>    xe_page_reclaim_list_invalidate.
> 

The helpers looks much better, thanks!

> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
>  drivers/gpu/drm/xe/xe_page_reclaim.c  |  65 ++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h  |  96 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c            | 123 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
>  6 files changed, 290 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6ecba27d85f7..7f08b4cd91d6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_oa.o \
>  	xe_observation.o \
>  	xe_pagefault.o \
> +	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4389e5a76f89..4d83461e538b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -9,6 +9,7 @@
>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>  
> +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
>  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
>  
>  #define GUC_GGTT_TOP		0xFEE00000
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> new file mode 100644
> index 000000000000..018d546fcf50
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +
> +#include "xe_page_reclaim.h"
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
> +#include "xe_macros.h"
> +
> +/**
> + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> + * @prl: Page reclaim list to reset
> + *
> + * Clears the entries pointer and marks the list as invalid so
> + * future use knows PRL is unusable. It is expected that the entries
> + * have already been released.
> + */
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
> +{
> +	xe_page_reclaim_entries_put(prl->entries);
> +	prl->entries = NULL;
> +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +}
> +
> +/**
> + * xe_page_reclaim_list_init() - Initialize a page reclaim list
> + * @prl: Page reclaim list to initialize
> + *
> + * NULLs both values in list to prepare on initalization.
> + */
> +void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl)
> +{
> +	// xe_page_reclaim_list_invalidate(prl);
> +	prl->entries = NULL;
> +	prl->num_entries = 0;
> +}
> +
> +/**
> + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list entries
> + * @prl: Page reclaim list to allocate entries for
> + *
> + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> + */
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
> +{
> +	struct page *page;
> +
> +	if (XE_WARN_ON(prl->entries))
> +		return 0;
> +
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (page) {
> +		prl->entries = page_address(page);
> +		prl->num_entries = 0;
> +	}
> +
> +	return page ? 0 : -ENOMEM;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> new file mode 100644
> index 000000000000..93f19fe6d146
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGE_RECLAIM_H_
> +#define _XE_PAGE_RECLAIM_H_
> +
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/bits.h>
> +
> +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> +
> +struct xe_guc_page_reclaim_entry {
> +	u64 qw;
> +/* valid reclaim entry bit */
> +#define XE_PAGE_RECLAIM_VALID		BIT_ULL(0)
> +/*
> + * offset order of page size to be reclaimed
> + * page_size = 1 << (XE_PTE_SHIFT + reclamation_size)
> + */
> +#define XE_PAGE_RECLAIM_SIZE		GENMASK_ULL(6, 1)
> +#define XE_PAGE_RECLAIM_RSVD_0		GENMASK_ULL(11, 7)
> +/* lower 20 bits of the physical address */
> +#define XE_PAGE_RECLAIM_ADDR_LO		GENMASK_ULL(31, 12)
> +/* upper 20 bits of the physical address */
> +#define XE_PAGE_RECLAIM_ADDR_HI		GENMASK_ULL(51, 32)
> +#define XE_PAGE_RECLAIM_RSVD_1		GENMASK_ULL(63, 52)
> +} __packed;
> +
> +struct xe_page_reclaim_list {
> +	/** @entries: array of page reclaim entries, page allocated */
> +	struct xe_guc_page_reclaim_entry *entries;
> +	/** @num_entries: number of entries */
> +	int num_entries;
> +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> +};
> +
> +/**
> + * xe_page_reclaim_list_is_new() - Check if PRL is new allocation
> + * @prl: Pointer to page reclaim list
> + *
> + * PRL indicates it hasn't been allocated through both values being NULL
> + */
> +static inline bool xe_page_reclaim_list_is_new(struct xe_page_reclaim_list *prl)
> +{
> +	return prl->entries == NULL && prl->num_entries == 0;
> +}
> +
> +/**
> + * xe_page_reclaim_list_valid() - Check if the page reclaim list is valid
> + * @prl: Pointer to page reclaim list
> + *
> + * PRL uses the XE_PAGE_RECLAIM_INVALID_LIST to indicate that a PRL
> + * is unusable.
> + */
> +static inline bool xe_page_reclaim_list_valid(struct xe_page_reclaim_list *prl)
> +{
> +	return !xe_page_reclaim_list_is_new(prl) &&
> +	       prl->num_entries != XE_PAGE_RECLAIM_INVALID_LIST;
> +}
> +
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> +void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
> +/**
> + * xe_page_reclaim_entries_get() - Increment the reference count of page reclaim entries.
> + * @entries: Pointer to the array of page reclaim entries.
> + *
> + * This function increments the reference count of the backing page.
> + */
> +static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		get_page(virt_to_page(entries));
> +}
> +
> +/**
> + * xe_page_reclaim_entries_put() - Decrement the reference count of page reclaim entries.
> + * @entries: Pointer to the array of page reclaim entries.
> + *
> + * This function decrements the reference count of the backing page
> + * and frees it if the count reaches zero.
> + */
> +static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		put_page(virt_to_page(entries));
> +}
> +
> +#endif	/* _XE_PAGE_RECLAIM_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 884127b4d97d..89802cc16b47 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -12,6 +12,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_migrate.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> @@ -1535,6 +1536,9 @@ struct xe_pt_stage_unbind_walk {
>  	/** @modified_end: Walk range start, modified like @modified_start. */
>  	u64 modified_end;
>  
> +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> +	struct xe_page_reclaim_list *prl;
> +
>  	/* Output */
>  	/* @wupd: Structure to track the page-table updates we're building */
>  	struct xe_walk_update wupd;
> @@ -1572,6 +1576,68 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
>  	return false;
>  }
>  
> +/* Huge 2MB leaf lives directly in a level-1 table and has no children */
> +static bool is_2m_pte(struct xe_pt *pte)
> +{
> +	return pte->level == 1 && !pte->base.children;
> +}
> +
> +/* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
> +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> +({									\
> +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> +	ilog2(page_size) - XE_PTE_SHIFT;				\
> +})
> +
> +static int generate_reclaim_entry(struct xe_tile *tile,
> +				   struct xe_page_reclaim_list *prl,
> +				   u64 pte, struct xe_pt *xe_child)
> +{
> +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> +	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> +	int num_entries = prl->num_entries;
> +	u32 reclamation_size;
> +
> +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> +	xe_tile_assert(tile, reclaim_entries);
> +	xe_tile_assert(tile, num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1);
> +
> +	if (!xe_page_reclaim_list_valid(prl))
> +		return -EINVAL;
> +
> +	/**
> +	 * reclamation_size indicates the size of the page to be
> +	 * invalidated and flushed from non-coherent cache.
> +	 * Page size is computed as 2^(reclamation_size + XE_PTE_SHIFT) bytes.
> +	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for page reclaim
> +	 */
> +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> +	} else if (xe_child->level == 0) {
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> +	} else if (is_2m_pte(xe_child)) {
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> +	} else {
> +		xe_page_reclaim_list_invalidate(prl);
> +		vm_dbg(&tile_to_xe(tile)->drm,
> +		       "PRL invalidate: unsupported PTE level=%u pte=%#llx\n",
> +		       xe_child->level, pte);
> +		return -EINVAL;
> +	}
> +
> +	reclaim_entries[num_entries].qw =
> +		FIELD_PREP(XE_PAGE_RECLAIM_VALID, 1) |
> +		FIELD_PREP(XE_PAGE_RECLAIM_SIZE, reclamation_size) |
> +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_LO, phys_page) |
> +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_HI, phys_page >> 20);
> +	prl->num_entries++;
> +	vm_dbg(&tile_to_xe(tile)->drm,
> +	       "PRL add entry: level=%u pte=%#llx reclamation_size=%u prl_idx=%d\n",
> +	       xe_child->level, pte, reclamation_size, num_entries);
> +
> +	return 0;
> +}
> +
>  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    unsigned int level, u64 addr, u64 next,
>  				    struct xe_ptw **child,
> @@ -1579,11 +1645,48 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    struct xe_pt_walk *walk)
>  {
>  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> +	struct xe_pt_stage_unbind_walk *xe_walk =
> +		container_of(walk, typeof(*xe_walk), base);
> +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
>  
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
> +	/* Check for leaf node */
> +	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> +	    !xe_child->base.children) {
> +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> +
> +		for (pgoff_t i = 0; i < count; i++) {
> +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +			int ret;
> +
> +			/* Account for NULL terminated entry on end (-1) */
> +			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> +				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> +							     pte, xe_child);
> +				if (ret)
> +					break;
> +			} else {
> +				/* overflow, mark as invalid */
> +				xe_page_reclaim_list_invalidate(xe_walk->prl);
> +				vm_dbg(&xe->drm,
> +				       "PRL invalidate: overflow while adding pte=%#llx",
> +				       pte);
> +				break;
> +			}
> +		}
> +	}
>  
> -	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> +	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> +	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> +	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> +		xe_page_reclaim_list_invalidate(xe_walk->prl);
> +		vm_dbg(&xe->drm,
> +		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> +		       level, addr, next, xe_child->num_live);
> +	}
>  
>  	return 0;
>  }
> @@ -1654,6 +1757,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  {
>  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
>  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> +	struct xe_vm_pgtable_update_op *pt_update_op =
> +		container_of(entries, struct xe_vm_pgtable_update_op, entries[0]);
>  	struct xe_pt_stage_unbind_walk xe_walk = {
>  		.base = {
>  			.ops = &xe_pt_stage_unbind_ops,
> @@ -1665,6 +1770,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  		.modified_start = start,
>  		.modified_end = end,
>  		.wupd.entries = entries,
> +		.prl = pt_update_op->prl,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  
> @@ -1897,6 +2003,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			     struct xe_vma *vma)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
>  	int err;
> @@ -1914,6 +2021,16 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  	pt_op->vma = vma;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	/*
> +	 * Maintain one PRL located in pt_update_ops that all others in unbind op reference.
> +	 * Ensure that PRL is allocated only once, and if invalidated, remains an invalidated PRL.
> +	 */
> +	if (xe->info.has_page_reclaim_hw_assist &&
> +	    xe_page_reclaim_list_is_new(&pt_update_ops->prl))
> +		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> +
> +	/* Page reclaim may not be needed due to other features, so skip the corresponding VMA */
> +	pt_op->prl = (xe_page_reclaim_list_valid(&pt_update_ops->prl)) ? &pt_update_ops->prl : NULL;
>  
>  	err = vma_reserve_fences(tile_to_xe(tile), vma);
>  	if (err)
> @@ -1979,6 +2096,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  	pt_op->vma = XE_INVALID_VMA;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	pt_op->prl = NULL;
>  
>  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
>  						pt_op->entries);
> @@ -2096,6 +2214,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>  	init_llist_head(&pt_update_ops->deferred);
>  	pt_update_ops->start = ~0x0ull;
>  	pt_update_ops->last = 0x0ull;
> +	xe_page_reclaim_list_init(&pt_update_ops->prl);
>  }
>  
>  /**
> @@ -2518,6 +2637,8 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
>  		&vops->pt_update_ops[tile->id];
>  	int i;
>  
> +	xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +
>  	lockdep_assert_held(&vops->vm->lock);
>  	xe_vm_assert_held(vops->vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 881f01e14db8..88fabf8e2655 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_walk.h"
>  
>  struct xe_bo;
> @@ -79,6 +80,8 @@ struct xe_vm_pgtable_update_op {
>  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
>  	/** @vma: VMA for operation, operation not valid if NULL */
>  	struct xe_vma *vma;
> +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> +	struct xe_page_reclaim_list *prl;
>  	/** @num_entries: number of entries for this update operation */
>  	u32 num_entries;
>  	/** @bind: is a bind */
> @@ -95,6 +98,8 @@ struct xe_vm_pgtable_update_ops {
>  	struct llist_head deferred;
>  	/** @q: exec queue for PT operations */
>  	struct xe_exec_queue *q;
> +	/** @prl: embedded page reclaim list */
> +	struct xe_page_reclaim_list prl;
>  	/** @start: start address of ops */
>  	u64 start;
>  	/** @last: last address of ops */
> -- 
> 2.52.0
> 
