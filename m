Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129BBEE0212
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 06:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ED310E9E5;
	Wed, 11 Sep 2024 06:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRohgE0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ACF10E9E5
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726036796; x=1757572796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3iVYyLeKAHobwH11E6xwtXtkXhV441yxGQ6/aEsRiHI=;
 b=VRohgE0NvXylMZJIqd1p9DUXx0yDFnqoQ7AJHpTc+9Q2NNWuCLSZ71qp
 zbt+31Dv7u+lX5/cVnpMS5ZIZZKMJuyFvrfCiTq26+rcf0aDr32OshGo6
 YqML1qKffMvPPzXaHH2txvZ+nZ+3BzD63klYdVK3+SLUD9f8rTe5tayw1
 UdYAROvCkGtMsvBNzA5x/acj9snpmiYKZPcjOKk2cpCQgtijs4LqdG+nb
 Q//Zx/vPSPnrcXLUc1pUF/+PB4VlS5v/dJ6rY3I2Prs1qJUQJl8NP3Kn2
 /p8trXrJenBXr75OPpvkr8cOTs1rUQhSSl8LmHCGB0u/3Rviw+3aHBixB Q==;
X-CSE-ConnectionGUID: k4tuOuqDSruPhduoGz+Swg==
X-CSE-MsgGUID: SJEib/niTHGysieCBT2+iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24694818"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24694818"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:39:55 -0700
X-CSE-ConnectionGUID: 2EEW7GfYS4a+xMNg8emqtg==
X-CSE-MsgGUID: xfmqrtQZRuCS0Pp8zMIt2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71405181"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 23:39:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:39:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 23:39:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 23:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Om4PJC5NCM0f3EzOc+v4vYXWytqiAnuD23MR/5O9e8snUb8y3b6H5tJwm/oQ7FoelXeWbO2a1J4SI2uxuO5u/p/j+8WWYv14hnqgObnrxV3MeB+SzDMyDmOUF3Oa6eVgAG8bft10JGgDZULm2q3M7pH9SIIWC16ZxLsCIl3R8KbbM8h19oxbxFUKhiq8eObd0g6r1HZ8S6j/9nIHGsnvOI1MrKr00bKpn7cTV4YUsqE9wzxAO0dNLQIfMyOrBHdRKRNKD8uBvCAyhO+Lvy389e4JP1aq3m7KdbNuth62939hb2GyJH7pTK5s1dPPiEifUEZToHLIGNx1FU8jQ/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVxlux1bh4hII+1xVKucLFTh+j7Q76XGSBMYu2mn50g=;
 b=WgOQdkzTQh3am/5mhNr7hLyvN4VOStaCNIrVcLxcxMKan5UW+tr71g8UnhOHmDjA1BRXng0fp8uvnyn8gwDpWK1w8sA8zvulEmuf1KOZcD7TllnS+XMTNzCgoiGtobWnmWJiYtRkLhjsKGB4ryyxMVl1qnqvjDoh7KxrJS2gnp+YE6bvlMq5t4rVerULHP8ZluWk+FGBA6kIqwt96GIw+fsLr+dufxM3SZQxxF9NTIFhcrZFuYDh71o1rX311OaK4XgOa0Xfu3M2HdZruZ21ayaT0qFr+2bHOkw1DKjfv+0yKXiD/c44FX0VTWbFoyGG6v0U8aWqrldaU1Tmjfqm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:39:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 06:39:52 +0000
Message-ID: <597355ff-611b-48a0-99dc-2c40f5e9c8c9@intel.com>
Date: Wed, 11 Sep 2024 12:09:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <jani.nikula@linux.intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com> <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
 <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
 <ZuCAnYNYC8_ICcKC@intel.com> <ZuCFyhH5SMSMglSw@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZuCFyhH5SMSMglSw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff59104-6e74-4831-87f6-08dcd22c8a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXRvRy9ZNTUrRVpqVUlKN1BZQ05veDd6MUV4RCtNWjZmTDJIbEZIMHk1ZVJU?=
 =?utf-8?B?MGhJaXNRQkJzK05wYzFUNEZEZ2dpanprVlZVbjRXbXRjRkRHUC9iSU8rL1Nh?=
 =?utf-8?B?ZXBFd1UwYVdTRm5ZNldYNE1RRWVVU20yUjk5Q1k2YkgxVFNMcHRhNFljU2ND?=
 =?utf-8?B?aU9wVC9KeTFLT0J1SDllRWRjdUJYRnZMS0o3WVZjbzBtTVdENTFVRkE4OTVR?=
 =?utf-8?B?Q0g4TWR1dnZYWXp6RTFuT1Y1dnhFbExHK3hzbW1IVUhiQVVDdVl6bkUyWXkv?=
 =?utf-8?B?dDFEUTRnYlVjanc2UWNNRm5JVEU5Vm5VbXJlNmVLdGsxWVlORjkwOFZTRXFs?=
 =?utf-8?B?eVExTFpiRUtlS1RUSUpSR2F5MGhQZjlpTit5UUcxa1FUcC9IOFMwc01xeHgr?=
 =?utf-8?B?NS8wT3F5YTFpSWV0SnJtZlIwa2pMRUhnSnF0ZFhOb1ZIUk1OWUpSTnNZb0tw?=
 =?utf-8?B?NWRsanB2RU1zMklmejRDb0pEbnU1OG5MdjY4OVFGdEFDT2Z4VmN6UDNTb3N1?=
 =?utf-8?B?L2JLS2NQdUwvOG1IcFNlR2czRWV4YWkvcWhxdFBPVW5UaFV6QU1mc2svdnpx?=
 =?utf-8?B?MG9XQ2dkdk1WcjlHZi9WbGFlWGxIZFJYWjVjZlEweVk3WDVzSnhFSkhHcWxJ?=
 =?utf-8?B?OFJpRCtLSmJUWXY3S3RLQTNKWTFhemRXdXdCYS9wdUlhQVBPb2tMSExBU1Vr?=
 =?utf-8?B?UEtpMFo3TllZREZ0TGU3Yzd3bHlrVVcrT215aHdkMi9iZU9ZOGx5VmczQ09x?=
 =?utf-8?B?R080MWVXdmJjVFMreGNGWER2WlNMTXNRTGEzMnM0Z0c0UFd2ZGx1Z0I2Q3Uw?=
 =?utf-8?B?MCtRODIxYWRYOVA4bWRUQ3QrUjBlbytiTGZLdVNYVEk0bk9PbDZCTGpGTGZG?=
 =?utf-8?B?M0FKQzNucmxvWDZ4amRldnQ2TFN5dTZjVHBlMjhpWFI0QW5mZzdMQlpqQUxK?=
 =?utf-8?B?TE40T2x5Mkw5QzNPakMvK1lNbGx3SG9LVGJRZUcrR0V5UGpkTm1BOUV0RDlE?=
 =?utf-8?B?UHl1ZUxZZFlFM2pSclpOV0Z4emlZZ1BVRnhrM0M2b0d1R242MGRVbWhSRC8y?=
 =?utf-8?B?cVNLL0pYS2VkYlIyZzRNYmtWajdOWTB4NlpzZ3dkdHBpeWZva0pvcksyWlRR?=
 =?utf-8?B?eWZjOUJmekZBOTMyRGFTUWdFb1gzTUVWYmtQelM3alp3MlE1MkdDYjc2azUv?=
 =?utf-8?B?R2xjZEF3M2VSUlNIeGVLSnZRUFRiNkMzeHB3RXJ4akJIMmlaYVFDSklBNUo2?=
 =?utf-8?B?c2I3c2ZEWCswUjl0QmZtRXNzamhPeFhUSjJ4Z1RiSVJqZlg5d1NNb2Nad1ZQ?=
 =?utf-8?B?eGRiVENMVkUyUjVHMStkWjRFZXdFRHlvU2lOMlV4R2dZMnp0WjQ3MC9ELzh5?=
 =?utf-8?B?bTlTYnJlR0JuaGFHcXFNTE9vcEM3b0laYUxqQ2NyRVlVa0tqU0xBK0trSldq?=
 =?utf-8?B?bEY3WGMvODFKSENqaU5hZnJ3aUNUQzZYMnFyWEFCbUJlK2VpREE1NVpyTjNR?=
 =?utf-8?B?WkNTNnY2MCtlWDN0RUl5VnhHTVJwLy9wREwzQzViWVBObFZjVXVNQnozMHlM?=
 =?utf-8?B?QjV3NWhDdHROZGZMSE5NcnJOTnNyUWl2eTN0UDhWTi9nQmFwOE9oRmNSdXNZ?=
 =?utf-8?B?bVgvV1FvTjlyZ0VUbmdsVUhIb1ZMTkNYUFBZODNvYTEvampUTDJqQkF6d0hQ?=
 =?utf-8?B?dHo2dU9EeS9ySjBoV1dobjYzUE9xaVJ2R2M1dTJsVnFyRjN5NG50Rlg4MFFv?=
 =?utf-8?Q?DFp1iFFKluGS95I6kk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTd1YXhCWFN2ZHllYUNEL1FVc2V3dTJUUTRKRkgydE90V0kxcVV4WktobG5k?=
 =?utf-8?B?amZkLzRvbFM0YzRveUNsKzVNUnBmL0ZLNjNNOGxhT09XdXFyQSswWHB3Rlk1?=
 =?utf-8?B?QmdJQ1pWanplZms5RG13ZnJGZ21sNVhzL0Q3K01SKy9tYURpU1N2aUJ0MVdC?=
 =?utf-8?B?bi8yQ1FMOVlhUlhkdGRCN3lFcHI4WkFRQzR5Zyt1TVZYN2VFVHdBUUpzSk9Z?=
 =?utf-8?B?Nmp6NS9wZW1nWFZrVU11eGVhV3d6VE1QdWpDbXFCa3NScUdhMVMvNTZJK2xV?=
 =?utf-8?B?THFka3dWanJQMnQ5MXpqVE5EQk5tL3NlNlc4d2NrR3R0WUNvcmdWWWF6VXll?=
 =?utf-8?B?dE9tUFhpSzR1VDNtV0hYWHhWMHdSVXhpdTNvMm1xKzZLWFFFU0wyR1V1aFdW?=
 =?utf-8?B?cG9Fdkp3N3U2V3c5cFV5Rm5uSUFxZUl2WUk2Q3ZXN1JJSU02c1V4OUswU2Mv?=
 =?utf-8?B?WDlxNnVMMVlNYjRWTzR3d3lOa094cHE3Uk0rTnhZc1pvU2JMZzlHczRPUEIv?=
 =?utf-8?B?Qzh5aWd4SFZ0amUxdDdZSUF2dUxKTjBSaWZxbUxYRDA4NUFlMXJ1ZFVlVm9l?=
 =?utf-8?B?K3lGZ2dWUzJPY3A4TXZycUlIMjl2TFQ5UkRZNEI1M0VaOGxSenRkM0g4Mzdh?=
 =?utf-8?B?ZThaSEJLb2pCWU9PbnNHb1Rhdmw5U01IUzBQNXhZeGJyb1pSd1JFODFTcFZz?=
 =?utf-8?B?RTZjYUEzWnFlMFBvYUcyNVEwaVN3WEVQdTRYeFZiWE9BWlNWM2luTWhCM1di?=
 =?utf-8?B?aWRWcE5rdVo1SzB0ZnV5cjRNVnBZN2xkNXFydUhaOTVxUTN6MWkrOXNiNzF5?=
 =?utf-8?B?b1JKSS8yLzFhaWdobmdSRk10Nkt4aHMxVUdTcXRDamE0WlZ4Kzl1T2l6NUNL?=
 =?utf-8?B?T0U0dW54UWxicTUyZEQ5QmFQY09abXB0TEJmU2lzQXJvNVBVazFpWkNOVnZU?=
 =?utf-8?B?S1E0RE85Ky9QZXkyWjFEZW5wbTJqQkcvdWFVdDl6VlIyTVMrS2lXMyttZS9H?=
 =?utf-8?B?M1NHdmdWSHdlSHVPVkFhSGJNWDVKU2tzeE5NbFhHRjA3ZlhaVU81UjdPcGNK?=
 =?utf-8?B?VTBzTjNDVlNsSjFSZS9JbkxJYStCejgxckQ5ZG04Ri9xNGR0TkdlOU1JdDNv?=
 =?utf-8?B?emt3K0RJenVjQnZZc2hLTkcrdlZmeGFxeEFDb3JBWkFsZkpueFBDWDZydGFP?=
 =?utf-8?B?Vko0Tnl5TzJxQ1psTDl1cis2MkdUaHljb2I1TGtsV2twRnlBUlpOUE5zSkRJ?=
 =?utf-8?B?NHVISlFidkErQnNtaW1jb3hzaGVaa2Q2Vml3VVZGSGtCeHZyQ1RKd1BIMERx?=
 =?utf-8?B?NFlDM044RnAycjJWUUg2M3RCWVB0ZEhNeUQ2d21TZHNWcnBQdm9keWRiM083?=
 =?utf-8?B?eENOSUtOckxSbXd5VnFQRGtaeG0rSE9WeVlCcnVIK3pPOVZOZjNMQ1VZV3dw?=
 =?utf-8?B?NFdFcFJEcHd6ek1GMGZYK3lDaTJZNEZLaUJtbFZxTy9BcUUxc1FvYy9UcUNj?=
 =?utf-8?B?TlRDL1N1bUwvYldrejJmekNySE1PbzZRVDlmRE9LWDk3M2NrU3JlUG1JRDly?=
 =?utf-8?B?NkJQMEJUWmJVRSsrWjJzSXZhUTRrNkd1T0MxblhMUjdaUHVJQlB3OTRNTmxC?=
 =?utf-8?B?cHYvQktCVXRvYzlnd1VZSEkxaWRvMWFWY09sVEhnYy95TnZMR2tEc0V3WlQr?=
 =?utf-8?B?QXJrelk2M3ZWYlpaOVdtK1V3QWhZY3A0ZU01Q0NjdElPdVN3cDNKNXh1NlJF?=
 =?utf-8?B?L3hpdUNIRU5QMVIrcHRzMnIwMGdiU01TaUEyd0RRa0YyR1BNNTRUbzluay9z?=
 =?utf-8?B?bldIZlMzNTY0TXFQWTU4dHNieTFZR0EwbFJJU1Ywd3psSlBEbndMVDYzMXVO?=
 =?utf-8?B?LzQxV0daZmF1YmY5TDZVdWQ5R0I1VFlVeGlDZ1FRWTlQbEpmUE14TU1MUnBJ?=
 =?utf-8?B?SXVpUnJvOWppSFBDYlBPakU4ZTUxbGJRWUpJTVUwTlJENUlrQzVzaUp3QTda?=
 =?utf-8?B?NVBFYU5xM2tSM2QyU1ozZEhoeTBwOWh3c09tY2RaTld6KzY2VlJzSlNkVmVZ?=
 =?utf-8?B?cEVET3U0WWUway9GaWx4aWkza1g3a2RyR1hiZlpYZ1BXR0ZGVGZ4eDdiZ3Bw?=
 =?utf-8?Q?MYk6nawUVU2niE5PEOtpeVngM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff59104-6e74-4831-87f6-08dcd22c8a12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:39:52.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1TM9hrvSoz+moa9urlk1Tto+lUMqAm8FLJBfAJVoPctGT7BLeD13x2cOI7kzcW9NVpchZouzEVPb/Fk33s51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
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



On 9/10/2024 11:15 PM, Rodrigo Vivi wrote:
> On Tue, Sep 10, 2024 at 01:23:41PM -0400, Rodrigo Vivi wrote:
>> On Tue, Sep 10, 2024 at 11:48:20AM -0500, Lucas De Marchi wrote:
>>> On Tue, Sep 10, 2024 at 09:55:23PM GMT, Riana Tauro wrote:
>>>> Hi Rodrigo/ Matthew
>>>>
>>>> There was an error when this change was merged to linux-next
>>>> https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
>>>>
>>>> The conflict was because the below commit
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
>>>>
>>>> Jani suggested to rename or remove it in
>>>> https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
>>>>
>>>> Removed it for now, will add it once the commit is in the tree
>>>
>>> I think this should just be solved as normal merge conflict.
>>>
>>> It's already solved in linux-next with the right conflict resolution,
>>> which is to drop the local helper from drivers/gpu/drm/xe/xe_gt_idle.c
>>> and just use the helper from include/linux/string_choices.h.
>>> No need to drop it here and then eventually bringing the same change
>>> back.
>>
>> Well, indeed. Since the function is exactly the same let's just do it.
> 
> On a second thought, this can be bad, because this conflict will need to be
> solved over and over again. It is silent (only detected at bug failure).
> And the worst part is the inclusion of a line (#include <linux/string_choices.h>)
> in the conflict resolution.
Inclusion of the header file is not needed as other functions 
(str_yes_or_no) from same file are used in gt_idle.

If https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au 
would be taken eventually, should i just drop the correction?

Thanks,
Riana
> 
>>
>>>
>>> Lucas De Marchi
