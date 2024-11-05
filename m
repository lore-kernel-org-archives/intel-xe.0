Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0170D1CA3A
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 06:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D6710E1BD;
	Tue,  5 Nov 2024 06:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqzqWarJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCCE10E1BD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 06:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730789299; x=1762325299;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tOoeu2wZBWLE6/XF0dbrf37BsJRRVH7Nw7XiR4+ub6Q=;
 b=cqzqWarJuDCybLLkYKGinyLZpOu0wiIwn12RfGPdqG4kQ5Qltq/30xmu
 xzrs8nCyZQQ9znmKi4C94rPN8QWaFKr0f2QeFrHpxl55c96CDNNza5Niz
 Z9pfiv56/osc9NvLjlbDow7Y6O6qkpEjnD8tXA7AfawM5/82zuGuOUOMO
 rIZSmDU3gSj+1QZUsNO9V2OF2xar22gOr4VJk4c4DIHVaBJXYrO3DJ4fS
 wRYp/dGqCTmXcblN+50gmwCxN5ZHKZR3CY524DO8ygQWmHAVCe9vr2HjA
 EipuTGI9jSa/c6hmQpESKPInVJ1cDJFPlTfMNp8E+BGDLO4MJM4dciBsq g==;
X-CSE-ConnectionGUID: xx9TLmyLSFacq580uXpR4A==
X-CSE-MsgGUID: t9NhB/IiQZub+MPNq2+LqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30633611"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="30633611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:48:19 -0800
X-CSE-ConnectionGUID: mDLIHC3RQ5uDffkMkHW4Cg==
X-CSE-MsgGUID: 0eDbYFG6TPqTKAkm3674wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83838811"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 22:48:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 22:48:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 22:48:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 22:48:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc9Jhq7qk9HzS/ac1ThFxHvKk76gDD18/9x9GHzYocyPV7cD8LqCb84DMqaGxc5YARRK2TW2IbiqJXNdGjqkrci9wC3JbaW59O43DxRUQ+rQK7Sci/0nWlPaB3Zqv29dgRXf7YyPZHxQHzGpDwk1Gftcmkbsx7inQPIWY8z4Ag62Gid7G2K0R3uitWgl+h/57ASJW+yQrVbDdiiLiXk9PM9h3ARmZoghZNerLKKB2HofTSLFezLZ+pRsHeddNA4IoVwazYY/yed4tyntNrQHu9+Qx/ZALwP9dOxg/mIkCGeCsjDyju5e3h7LAF/sCoxiEBxL2zgmdW9JJwiJDbK32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrLrYaDnTNhEWVE+34QPZqViQTV6WSnTXHCo9mPrYnA=;
 b=j6/+LDL+8rTJW7o1rAl8IG7Re3TCyrGJWhMeEwZdLLtrJ2dUdS4lIS6D+kmmQyTILNUuUIIvghttIpDkBdCTug06SL6HmH59l0ljkg8sQVU0fXDF89jussgL912Rk1PuU8lIWgAvoV6joqlNW4MN2mulHuzQWx4fX2nzwKvLu7++ISVwFd05+dWAxrV0JMUamigrBv+BlBBDr83Qmz7VS+9nd+xpytYCVTR7AcY+JZfu+rrFR7oSeaf9PdXBa1QLc9i/CsFF2xZqx++8qQg8yeJvHKIgeO85Df1GU3JTBimLnj2qH0y24oISLWj/TM2nzCQQ7ZZkkrqF/QeIXzGXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 06:48:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 06:48:15 +0000
Date: Tue, 5 Nov 2024 00:48:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix drm-next merge
Message-ID: <fct3dx2z34aiudw3kqrle6gl4ovoweqqvfykoj4sraiz4qjeeo@3gtunc7axtl4>
References: <20241104183104.2265275-1-lucas.demarchi@intel.com>
 <2f2ed0abb1260579d004fa6746a8f4b8e75064db.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f2ed0abb1260579d004fa6746a8f4b8e75064db.camel@linux.intel.com>
X-ClientProxiedBy: CY5PR15CA0116.namprd15.prod.outlook.com
 (2603:10b6:930:68::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f882805-d9a0-484a-c799-08dcfd65d33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D4kEDR+tHFcQqZ2mq84NVH8xb9F2T1MhUHF0MQ9zfVvJagnNxRGKztG8Qu?=
 =?iso-8859-1?Q?wOJ6Hl1vKnS5ttD0zzSwxxrncN3JyiqOuDd96k2N/alCNKQfQhcsh/hOEu?=
 =?iso-8859-1?Q?2kFZAYn+GV5Wxc6od0Ga2bt79K2t+4qwHYotnUUNd39u3Kio/gkLIFyW09?=
 =?iso-8859-1?Q?x71S1GI+wTmz7C4cXrIL3OwO7gew+YwM6uwzRwpkyvOEMdsAXbq+Zhgj5S?=
 =?iso-8859-1?Q?qOR3VIsZ5q0BFvT0z4rK8oOKstD0cB+nV9Y07uvhuN6PXeXUvlSBA2M2jV?=
 =?iso-8859-1?Q?a4e+9DDYFoLKHzXi2+RjODP0CHUiTNgFcMI6q4OrhDpJHITiISAxyxDZiv?=
 =?iso-8859-1?Q?WpCs39K0GYnPcfuG2h4fDmQGMS1Eey1rcErAKRbXoia1rLF4pff1TNnGKb?=
 =?iso-8859-1?Q?8zfCtlH/x7YlNdKowi08Q2KeGNY/dPIsXr8l45SG3i4d8gGOHyNAHiPZKQ?=
 =?iso-8859-1?Q?ILF1NgWwuR/Wid41Vgp/TnrLlDWhyEneZgjjDfj3CeUL1vs1Qyjc1JYPlp?=
 =?iso-8859-1?Q?oD5bZ3CMALQXMGDZhAftg9U4LrjRcvLNvDrRgNaO8Pz9Wt2ntq/9MzK7Ve?=
 =?iso-8859-1?Q?R0nSePaotrpULy/thDyxvnGwqytlNvEq2seqxRwqJpUSNYFNtbrv/xj3o3?=
 =?iso-8859-1?Q?+A3/OfmcP1seKpd7ujfEIXufJYerIzun7I5XWbjd/SX2ZqlaKkqYm/zFNb?=
 =?iso-8859-1?Q?OeMwPc+udKD61F8/EXscvlQEJ/JXBvY2KkZ0s69GDalIK3JohabzBOuys6?=
 =?iso-8859-1?Q?qG1+H3hNL+H2IEgJp5SRYAISVHxN2ubnJSroeGV47DrlyP9cdTUmM9Iijc?=
 =?iso-8859-1?Q?Wi7UwWytbI4i01ckSadEMH05PS6slfzNSz9pW1k4iNLebopRgK0QfKKR51?=
 =?iso-8859-1?Q?6R5RNl+3mLCiqbySm9E01iwkg5O1X8p11GRF2oLQ7ciRidFm1rTDbkJSa4?=
 =?iso-8859-1?Q?1W8R2+bX96qOsp4acCP9LmzgFjHL2btp7Zuq4FxyweEeNneXZHT2QPMqqd?=
 =?iso-8859-1?Q?knED/mvAYYedCMB0XVP3jzvMqI89yRU/j3EUayeAxJqYZLtDdEItxQqfiu?=
 =?iso-8859-1?Q?GkgICjPbU6A+ASndRkTzUCMt4smWa8NLIkTP/U0HWMOwDwrXzrGTuVRkHP?=
 =?iso-8859-1?Q?S/VyRyh0ICuftnBg7V86oXlFP9cNY4+iRU1AeWDm0mQOf4o2laskcT9f88?=
 =?iso-8859-1?Q?vNrRaFRjW8cuQVd/W04dnZjUEBSt8uMMazkgD3SRVH/IxSyp0h/o5a/udd?=
 =?iso-8859-1?Q?MLTJG2EaIhZoFhgtU7txo6O/6XYrjKwjkN1HomG3Xg/fPwv+MxAKbcTIml?=
 =?iso-8859-1?Q?6jUGlXMycmdUXLsBwjkLeO+1clObun6luCzv0kfhlovNQ7quIQbhWKGQsX?=
 =?iso-8859-1?Q?TVOArODxak?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TSJHlq85YadEN5hWvGDLYE09tim+SgiYoLzkFgqMce5Y465qpbj4Dx7lPQ?=
 =?iso-8859-1?Q?W6N1m/F2Vw5b5Wd2N52jSXQCjH9YAfXHJrlQX7igohLiihWIoK0kDAYH8B?=
 =?iso-8859-1?Q?xBqwMTmQpJDpbYyg+BWR+aFzmnRj6GnihA1MD0cpyz+BexmmE0uoEEXGbg?=
 =?iso-8859-1?Q?tElzIuQRjUjlRhdtDipVC/0ZqAEROyqBUo5GI6HpW0yWxfxD+WFfuH/+22?=
 =?iso-8859-1?Q?AYNiis4rnxX0K4tk8JptPfyd5vJYynpX/dKOvuoAT5kZjDQjdm0ooHiDdq?=
 =?iso-8859-1?Q?MXoA77bAOYhAFtoTFqEHtr0EGCZkGLc1Z1U8HHg49YgDTBPt1jA+FVVoWd?=
 =?iso-8859-1?Q?blRIu9uHvOegOCcBwa+BfHGzpsXXf4EMdbu5fjz0420DOpIng3olZiF56O?=
 =?iso-8859-1?Q?NSNDUDA/trQVRsfurtscEGyX8eBqCylsuWpO3C3aAjRiLrVzE/DK4bbSNI?=
 =?iso-8859-1?Q?Cqz3rCpmpOrVp3sjvcNekyExY3qT7ScBcV3n/nttL+jisfLyIMz7Ph++iD?=
 =?iso-8859-1?Q?fwprnl6uwSAz3uifsCGbhLLJwr2cIRI2GVUGRHWMJrlMk6H0fzqRnYnpmK?=
 =?iso-8859-1?Q?XhSWEF7ICpYG68cbUyt7TV6S+z1mdAcLFxuoNFIyNsiEzeYVclqEKRGB0s?=
 =?iso-8859-1?Q?QmORt/8VYJAtJgbUUgNKweZdNMlOF5gB8yLhfykRZH4GxsOB95H5IYQBVP?=
 =?iso-8859-1?Q?D0RqjA4IStgshmyd47FSKz0jdTqp7aPDFvqvQB95Mj3UDdKaHEg8VOYOZ6?=
 =?iso-8859-1?Q?YSlurewAoxpGX8G5xXTBe7Nhc7ve4HpJAUGjuekA/lM781dQkuytcK1Kbj?=
 =?iso-8859-1?Q?MG0MPPSwond5AZU69jU9DOX/MmM7TzmN4HaWSiJO8UjBuzlmaodHM5x9bz?=
 =?iso-8859-1?Q?MeSxwwIw85HP0p9h6ng+46oj08Wk6WmzsLPd9wyhkwQkPtWAbuHxU6SGYe?=
 =?iso-8859-1?Q?WBy5wWxvshVlk5RijEbRe15IvUuhYJg3U8/g0V531jd7k36vxidlyCi7HW?=
 =?iso-8859-1?Q?2vYoCHwipQFqVjy/t0VVIEfIPLwLtG928YH/G/lOCRNmj/mW6whxcK5UUr?=
 =?iso-8859-1?Q?xRT1ysZH8EGoZr/mjj4G/h0NcgizH1ta5cLWl0omWCgF0p4T4KkOcnxbpp?=
 =?iso-8859-1?Q?/frwuzoYz1aIYrWutzGlaN+NXsQSpr+MB4sjdRyLfwFFS2VctCBy7HcpQJ?=
 =?iso-8859-1?Q?zjCKsWaamxiwzUFTolBi1FnHBc6UgvE+10AWqk0Q3R9cRMKTZXHkEnqn91?=
 =?iso-8859-1?Q?No04mAEeMYlF9izSPGcR+yAj1esAxrE6174qAfYqU0VIYNsysy3DSPS6Lb?=
 =?iso-8859-1?Q?lQY8tUkl9Q5Kd0aJHZzjiHvljSekqisBVLo/pL6/qXErNQUwrlaQIYFep2?=
 =?iso-8859-1?Q?nvawb+ovrwf1zpFBfLSZQN+sTs/LXCEGn4PVhm5z9xEVI8/TaHfCDeoAu2?=
 =?iso-8859-1?Q?Q7TIvQi1CDj3LuRmcoygdJ1KwsJ82SxjK5Wh6YPXk+eCnPDT0YuYTesEFR?=
 =?iso-8859-1?Q?T29zOA2Rkrh7mxWQxVT7ufYpaSuy61HJvl8qy8AxiB4c7Y6TLyPEjpG+DI?=
 =?iso-8859-1?Q?um23AGvoDzU+r/J/s66eh7QD9GMGqR9zIfEac194bdYPVL95w10KPwfgXj?=
 =?iso-8859-1?Q?/XDPvGHN1R9GaSDkzdNVgWk6+Qm/Qhgc0uuk+cPNcMEZJp5IzJy/5V9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f882805-d9a0-484a-c799-08dcfd65d33b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 06:48:15.8863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sf4KbZQkjP9ei77yuZIESXzKtWkap1k9y6iRcGOzwTHxFQiN+ba06XpnOfXSZIThzSjS6dW5prURnb43IZNAq3LBQcWJAWwpJ7Ge+Ymoe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Nov 04, 2024 at 08:24:16PM +0100, Thomas Hellström wrote:
>On Mon, 2024-11-04 at 10:31 -0800, Lucas De Marchi wrote:
>> Fix merge in commit c787c2901e2c ("Merge drm/drm-next into
>> drm-xe-next"). That workaround needs to be done only once.
>>
>> Fixes: c787c2901e2c ("Merge drm/drm-next into drm-xe-next")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 19 -------------------
>>  1 file changed, 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a405b9218ad2d..550eeed43903b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1017,7 +1017,6 @@ static int guc_ct_send_recv(struct xe_guc_ct
>> *ct, const u32 *action, u32 len,
>>  	}
>>  
>>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done,
>> HZ);
>> -
>
>This looks unrelated.
>Otherwise LGTM.
>Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I added a note in the commit message about this line and pushed to
drm-xe-next.

Thanks
Lucas De Marchi
