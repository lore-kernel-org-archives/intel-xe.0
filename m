Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E2DC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642010E464;
	Wed, 29 May 2024 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbdNEnTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433F310E464
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716999898; x=1748535898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Uwy1pXKZLV+o1mksRTEMwErYyF0UvNiwencMmhVdxs=;
 b=HbdNEnTIC2TvVq84AWLKtlnaAodJPfjVjBu9cR6SOGGdK3L7/bxWaU3a
 X5s6231r1kOQ8rQBRoJQ514EvhnZXlUcvlYDsX4PQbOEBWwlm7AC+2yrf
 LTf7b5GkDuCjctBRXujEXSzySX8MBPT7UzZmQOTsbYHj9sZeVGvNsUSmr
 ax8+uWlhRXByg8oJpnoY0cSFHp7a0fqHOtVukLv88fXuxoAd+Z5lTEOQN
 v12CbZwhdarLocDTt5aZfnrNfTcNhybu/RvxN4Vznh2nthzwMctpF8et3
 ZdBzZzgkbHYiZt8wi2XUm8rMMQaIYvyPaYER8Osz4w/CSxt5Fj4+mrJ96 Q==;
X-CSE-ConnectionGUID: or+YjBiSTtSQnUhYADs9LQ==
X-CSE-MsgGUID: CRr3Svs1QoCd+I0TAm/Odw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13600369"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13600369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:24:57 -0700
X-CSE-ConnectionGUID: mnaSYTDaTNS/8jSLQvx1lQ==
X-CSE-MsgGUID: MqkaWMwET8uSFzNZppTzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40349985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 09:24:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:24:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:24:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 09:24:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 09:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoC4J7uzgaLR79nXY7B2hqMVlGtxnsMaL0ZDPvQVNxIijXtjTDiVMsAC9BwZgJWPqL8kSd0KyPu2c4QU5cjuexYcFDB4QzSbsNPwe/mmGOxzyoSbEYVL5ZsVk7vNkokubMC6qTZJ5rTqJ9XLFxNr7znOZoxYGqJ/hYCKuhyTEVhhf5mgECuE47wYimZ6cJNpR4xJY6qSe8M7V1yKFQW4jebETadUg/bM3Min0mpP+h73T1jwRjWRnVOulsk4ybJonoIfaN4YPaESdMjzcOdp9eojFAsPzz3jundm2txWPdSF+7eTtepRrm0BDTRE4cEs2dTQTKg2zGRXyOIoqusq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVY0+S936POkRSa9XDUTZXkf5LqhE3VxikOjpDdkScw=;
 b=AyVN4wLr6fL/g/aIc/srgCsqMnFjAZswDQ6He5oKq15Ij0gv5HNB36FBJEyHgun+5C+4/fu0CMOwhHd/E6HWV1YbrWiUEWpkizGPi4YfDeEEI6LEP3BRziItqyPmnHm/FWvHBiLTrVBvcS3RjgaeZ/Yf1f5E/Ami9K35CJ61jUD8sjePfxUzMeq2iyGiLIbyxKzUCPu2N3bg5/O4f2FQchnNoZTawm1Xt21Zduow6vpSg1A00sFXsXx2TrVxv+nA0zlCh9TkVg7X51MCUZ1T9TRdTA4+zko2ZyjERYdUKpx5eMOKYzA4fNNlTEK64BeFWt5G8NtXG7J0/jwIJqwh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.31; Wed, 29 May
 2024 16:24:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 16:24:52 +0000
Date: Wed, 29 May 2024 11:24:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
Message-ID: <fuhisr2cplvzrtm2cjjyiodzp25mysclp5v2unv4drct2bh3ul@szs5jha3l3fs>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
 <ZlYSzzsY5xepVreW@intel.com>
 <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a741d0d-9a1b-41b3-cd3a-08dc7ffbde88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o4AEcxje1ZvSHEt+VTcaqg9OMEb+pRXZAib3UQwolO43wFfQt+zO6TK1p/Fh?=
 =?us-ascii?Q?J+TALP4aeAUahWjBzmSdBEnng+gqNLElZoWWkKxAvOZEWrkB0MTi8gLPKxUT?=
 =?us-ascii?Q?70MCAE7CSgk76nZtU/aRO77VTjoXJPjyiaxieIDvLjyaYhH0YfAjITvs0VAm?=
 =?us-ascii?Q?utX9JuhH4GMgiXFVvD3T9oHstGFlxWFAtbzfJGqe6stRjLQ0owXcR4oq2VIB?=
 =?us-ascii?Q?ptHsz9GtMxj+wehqi3DS6/5eilE6PDTQrOW3wM/cNHE9PrrWOaY8RNVVsX6q?=
 =?us-ascii?Q?VkhYH5OEdpJKNsc7lO1GCUvC66qirWXK9yUrKioHz8LUdq7vF6Zf0FiwABbR?=
 =?us-ascii?Q?zWSTVmPlNhD6KveMi0JVSUz+FrklVGI887x9ikpE8mF1WzPLBF+uVdbMexFG?=
 =?us-ascii?Q?e2hQd/wLXJhVRwySwLWG8M5Q1hHmvhNG+858DauLfQOh/YR1DAF0029HJml9?=
 =?us-ascii?Q?PCgC+C0IsF+EWlgB3nx+rVsxs55fzWVy2MgKpwg8LeRC0zK3cNlqFm0QvuF3?=
 =?us-ascii?Q?/ic2Pbk4mo/rcVjqzOwQCjSTbAbueG+O4carCLt3yEGFwCfBnXVdpcy9/qub?=
 =?us-ascii?Q?t7n1zd+bneYT5UUIAU5GiZq0ljTab0Euw/DhYofcaPuuGHKNEV1lbDKYDC3E?=
 =?us-ascii?Q?Oc9ie3FDKiChmH70+vwLF7WRdLJAOlZvxgRDQ7TAPyPJWzWlERhrsYTCccfR?=
 =?us-ascii?Q?O6fSvDVWq8/mSoZUtnHlgW1+b0pvwvAi8di8KBHZBHPLeETjlNBm8OUw9Rr1?=
 =?us-ascii?Q?4WAZglyHZXqXHo7TnGx/8Pe1dW1Z/Xj/QcEqeQE6pVcdN5oWYRLHI75tntBR?=
 =?us-ascii?Q?sTV3Mrapf4W+GRD3IHZw0cTtUtAAIy+YZQt4NTG8BHxo6I/58w1dGacLljdP?=
 =?us-ascii?Q?SbiOYGBYmN5fsvMjxZwX7a1GC3eRbBtvr67OZTSewyPwiA2G6XTa5rfHK/y8?=
 =?us-ascii?Q?turS8cu9iopUdOIhUajr66DwLTQabAedDYDSNjv6FbPevAH+NYLKelw5YmjH?=
 =?us-ascii?Q?DoVNY3A32mI4HCs7hSiutjy8+6ee1c0ljIsTLjxj5tRX44pg6FvFGTPwykJA?=
 =?us-ascii?Q?e5jTPh1tPOM/qm/dbYUmD/qznpicZJWl2rv14U9VflAyanuvWLSE2qmJvUcv?=
 =?us-ascii?Q?skGmEtuU+ZaaxqG60OaWLWKf0Rd3NuuUN/We+7N3eHVA/l2Urm/Ifdtq+/5b?=
 =?us-ascii?Q?kD4Zvo0VQ/Z0+iXp07mcGeu/ONM27S5G8BMBROGhOjmTeM7WORJS8+wVtVOI?=
 =?us-ascii?Q?GM/5UAc8ZTXH07RMgFA8QUmj1ISsHkHDQHTUf5gmTg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JCaWte82Mhd7+FD6WScNhBPCCyP64yAqIEuvcVZHFPrtx8TuXRE/F2BtSZsD?=
 =?us-ascii?Q?2X54ivaMtPHxBEiWgSDQAKPgXZvIx08E5OS+xjZ2XHQ8NJyKI7LJS9AntaFS?=
 =?us-ascii?Q?cV24YoJfMAKntu4wC6wtjpHHXA7wjwoYWzHDy2OcLj/lzoyHFBXpMJSN14wI?=
 =?us-ascii?Q?gSBdCL33+7x/dNBFA1Wpn/xy9CXqfYUC3/t3EBVeYKaJzL9UBlH9j9zQfqap?=
 =?us-ascii?Q?+QINLREyRKqqF2zNRALVYO0LltwUKVCi0qYPON3gvOIoM2HmjVx1x6kYKvbO?=
 =?us-ascii?Q?b8wPUoau8Ks6vJj7jRttKdY2dCvQ8NH1SIwTaF0c5p8C95Om/y8CeqI+1x3w?=
 =?us-ascii?Q?xIuerNiLVfbaq+OuAptFygNOBowWXo4LUIXZjzSsNqy0UebL0vWmyOKJ4L4s?=
 =?us-ascii?Q?XHtDqg5bE3t+dnP99v8bT7ooAFJuHWwAXBaNoihZ4euP31nC/+z3SYsqepRl?=
 =?us-ascii?Q?bESlswJv1x6CLk7Z+bKJi80J2wmDsKhsg5rULroL7kdDwMckX2tIc/ZL4CbS?=
 =?us-ascii?Q?Ik5TqjVU/nLZ9L9pgUG0bXeEOLKhKELyhUpzCzEBkDWwhDy7AHDaeHSz3yA1?=
 =?us-ascii?Q?NlU1bzgfys7lqYw+2GgC73p9S2RCWxYVT9NJjzMYj1Nd99Ka597if0Yff82W?=
 =?us-ascii?Q?Qz92wPilTUWEsN0Z6zjLlI6CDXR/pCL/Khx+MXUb7P7FKiYiU4q6r24LdP8r?=
 =?us-ascii?Q?iBiTvNZnqqUG8PkyOdHklHvSmvHHrRYQN7u+bnI7wtYUVnidRkEltQJmIfq7?=
 =?us-ascii?Q?pZth4b5IVvTuXjR8xCUG4tfLrtZWMWm2wf5Kwvmmep4O5qMrNjRX92kdS1YT?=
 =?us-ascii?Q?rSvJAbVUasvDxHsFq5zHOLvCX4l/wKCu9gdZpZYhuoURMjlAB74GYmoCjMVf?=
 =?us-ascii?Q?+J3jh2TgrNUa0uPa963lZdtTr3MknxnPuSqqvBPPUqH7OJmVuDGdvkIBr8w+?=
 =?us-ascii?Q?2gurYgq3euayORqce4pk1n6Eu4sSV3NmR7Bo2Rb8mOu6wRxsq0QGPO3GR3S4?=
 =?us-ascii?Q?eSEe0eb4AAqKfPB4rSQhN4Tb5Y6UPw4icXLZlcjm4bhMGsJOip3h0YOIueQ6?=
 =?us-ascii?Q?+2KjwSsiU/Hm6TfHgJNmEPZ7BXdIqCjVtgwI2rihN+1d9+mcyw+INjaAlQrX?=
 =?us-ascii?Q?W+PwWc3bUyzfOEaq/zCRAxr7iX7sQwocpvICYFK1eQyh+DYvn7mjl9nfgvGq?=
 =?us-ascii?Q?rSZUrIvSnMZWcSjpa5DEFhcQC4juE5OL87z4LGtjUGIKuYYtgKeEs1SqhIqv?=
 =?us-ascii?Q?VqF4xaJdZq1Q81nVuKTi5qZmy4li0M2m/rdV+O6Z3BexY4xy/jQpLVKPGKT4?=
 =?us-ascii?Q?MXHwAb/qRqBcftRh+T2pyZ4ieDEVQkHU8eh+bQ07nTTtcsteJ5yCWrpq0nsD?=
 =?us-ascii?Q?KpM2Bux06I5Ej7qmS6xptX+G9UkNWcv485L4Kc7qgDRl6HacZ6OCup2kxhXP?=
 =?us-ascii?Q?n9W5Cl7v+5RdEEgjjRTsrjlWLK7E7CTRwvvldZJE5A8KDM/MpvGsoGvwioW+?=
 =?us-ascii?Q?3krYtsi+9mlvI6n7Znz4QK2uucWS1Lc/Pfo84l7Y9v1xCfuRWGrW+SDml2jS?=
 =?us-ascii?Q?eoJK16xoOylBkZQfpjN3MUkr8SLHTpHVPrnQbSvPQGKpc6UpQUAXwrUDEHX5?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a741d0d-9a1b-41b3-cd3a-08dc7ffbde88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:24:52.7849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1HTys313Kcg5SI1zLS+rAAJbK6qbABQNiL/rHSvkk4HpKAx9P3hdkL8vViIuduLCKashze8w+TbjEgFrwT6UgCUUzYE6egyd02a1UHgy7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

On Wed, May 29, 2024 at 10:50:34AM GMT, Nirmoy Das wrote:
>Hi Rodrigo,
>
>On 5/28/2024 7:22 PM, Rodrigo Vivi wrote:
>>On Tue, May 28, 2024 at 12:11:32PM +0200, Nirmoy Das wrote:
>>>xe_force_wake_get() can return error so check it's return value
>>>before reading gpu_timestamp value.
>>>
>>>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>index 4a19b771e3a0..0c13395ffd34 100644
>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>@@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>  	struct xe_gt *gt;
>>>  	struct xe_hw_engine *hwe;
>>>  	struct xe_exec_queue *q;
>>>-	u64 gpu_timestamp;
>>>+	u64 gpu_timestamp = 0;
>>>  	xe_pm_runtime_get(xe);
>>>@@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>  		if (!hwe)
>>>  			continue;
>>>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>>>+			break;
>>worth adding a debug/err msg?
>
>xe_force_wake_get() will throw a drm_notice on error. May be we should 
>add a __builtin_return_address() in xe_force_wake_get() to know the 
>caller as
>
>the current pattern seems to be to just return early on error ?

humn... but just continuing here and returning something with a gpu
timestamp == 0 doesn't seem something good. I think we should set hwe to
NULL, so the function doesn't continue and just doesn't print anything
rather than printing wrong data.

Lucas De Marchi

>
>>
>>but up to you:
>>
>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>Thanks,
>
>Nirmoy
>
>>
>>>+
>>>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>  		break;
>>>-- 
>>>2.42.0
>>>
