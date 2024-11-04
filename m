Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A5BD1BDD4
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 17:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AA010E4A2;
	Mon,  4 Nov 2024 17:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKIi66Dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2958710E4A2
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730742850; x=1762278850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vhgc93NblYpDTJAzejeAC2plB6PnbcHCNBRvOaR0ZE4=;
 b=SKIi66DnXyEklPqptbufEoQwCQx7hNCotm5KO/9kBHG7OT4vglsWXuYU
 2RYwSjy+o558bVGx8MoyZp+dfOWq9a619TO3zKZaZbJgaQTZieGCyf99j
 nqOhqpaAz7KsP5sZQZxTwYAZGEw1QzV9Evz1JU9xcyn8WiEAGNqnThG8E
 J8lVPiE4dlRCTjwoaO2cXOZB14gDUdJZ9lQuLAXMzWrxnIxPU3KUkVeNv
 y0l+tgz7ovjxkjXUoK+A1f3fVB2IOpPsTJn86wglSM5x5d15zNP07ZbjA
 RlONcMzAtOFX3IlhOFJr/2yAH9s+HFEfYAMA+6NWwiGf2X3g5m+fsf0D+ A==;
X-CSE-ConnectionGUID: rXC/3jaRTFaYrbhYewlX/g==
X-CSE-MsgGUID: xTeUNlWZT72DELAZ+K9Zfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41560007"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41560007"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 09:54:09 -0800
X-CSE-ConnectionGUID: i6JdNeyOQVelsnsUXoKnAA==
X-CSE-MsgGUID: 5sLJ7bVgTLCagND8Iyt0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="121207008"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 09:54:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 09:54:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 09:54:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 09:54:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7zp3nss013ksD670ulglwgOdC8BRPPY6RPgDNuRuVnzsNRPh/FKNOsUKJxXCPClCDjFug0DB29ZQVj7ner4oDBqYUZsOrZTajVMbPeB1trbFbCh9hgrEjzvmm1zCWdomd6HjQ6jQaS6I7aGaGyneKcHWdLtIBk/JaPtQK0shbnFildRunkt88IDrtK45HFnPno3ZL5uT3Myytq3flnxukiudw7ya021MUYMi9lm8nVyTAYUX8CTFrs9FwhWxkPg2Q6fPXPwh4cxMTbZJdZIGhW36LdKXrw5zvxPAp6etUsIAXJpd4ROoFDL+anxNeGl+2NIT0Aqs+5N3lfxemCzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GM3dKUErktRHy6OiqgtzUaOuIXov0RJWE+BAZS/iMQ=;
 b=oZxwPB2oaefY+P+ZCfpU9eEm6IeN55qr3Zyqa4Ha8dozT75Pa82Fkq8mA7bS6sfhdFlwJ1EEeFHt6+tCnx4mZRdxSG6RFN/1bUa1NjUaiXyez7ByNDjF9rvDw7+/vftaT01xVJTytnjf9BWNT9Sqhx64d4VC+kZygXk4ZCy2ddL4HA2Frfxg0bl8I58+J970uANd8ohxo/Az3IqAnT1EHcP4J1RmEp+K6lB09JUwTeZQN6zqZqb9moccU1Rne9TzqnuXGBveNi0EZdJgaiJ216d37Sm2hRywDcoQ+FXZmxiARX39GMG4xdUz7dhKJ21jeEumpkALR87H5KvaO+y6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 17:54:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 17:54:06 +0000
Date: Mon, 4 Nov 2024 11:54:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Wait on killed exec queues
Message-ID: <zaabktbnnwhysogfhv72cm3f7i2lecrv3pjjnucwttgab7am5u@76hsjobttcy7>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-5-lucas.demarchi@intel.com>
 <Zyj2dFOOqKnTaNPq@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zyj2dFOOqKnTaNPq@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e236f74-11d0-4105-440b-08dcfcf9ad41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iXT4eEEP5i3bXme0wZPRk3e5uGne3jbNRPZ6CP2nDvgve67mJYP+afjTJ9JY?=
 =?us-ascii?Q?8wk2YEztb+bbwAoav2Ijpkd2FRym7gFfytY6WSmJrhm8Q+aE711roAd1qKKW?=
 =?us-ascii?Q?YlVFv/V8Ik7OrnVPWgT1I4ijdSCALyaJIMRl5wRF6jr1qi/TpK+D0EzvtWaj?=
 =?us-ascii?Q?b8/+dkWr4nZOrwlYlo61MiUyAjeomyaxnuZFt2hLSv4IufBWxqr/XcPNX8++?=
 =?us-ascii?Q?lXg9LGA0LHljIINF30/6c9HMuXv+s7h5Wvwz/gtSqSW5os8kC//daDCkxURZ?=
 =?us-ascii?Q?/rSNfqsZEKQyKournL7cjWSgcHycUyL31vd1NIJFAfQ2TPEJUgV7GU3Z6KPU?=
 =?us-ascii?Q?9KEdeP9m1FjKx7M0a12E2DUYiqHUqq3Tvy8OE5zP5QuTKZVWGZq2pq5ydo7K?=
 =?us-ascii?Q?qPikxvWQepNXLtKU2WlTeanND/vHDWf+ZfV2OTQuL9QpiKXuLdnVAklKIvnx?=
 =?us-ascii?Q?GNf/EmLJTk8sBE3t8l4LNsbAhYVHbXfDlCDgluRd4kUVzuCuYbtLCY2X8NWM?=
 =?us-ascii?Q?riLEKXXHWBhKq12at7gvB5TXbIMTlQ4y4AawciEULK72sINiAEBbCvR6kD/q?=
 =?us-ascii?Q?3F3NxlMfMUmsZR9YDSGAJpqmBrkyjP5WmWm4aPp1BNJrrxSxJRI1LLUB1pyW?=
 =?us-ascii?Q?UTHOmutvDtD8OI97heSW24s9JjD6EoIXoZQ0RMzh+fQY9oCmeY+sGXU+2LEW?=
 =?us-ascii?Q?lR2GTSIURD+vXWyh9ONciwyn8gwuGxTjmONrBfJgNa5cfjayFnTydV74e3fY?=
 =?us-ascii?Q?RXv5RWaLHB3/b86BanQFBMYOOTjiAZGnN4m7N73/YX6zd/YUd4abyaQXvfZq?=
 =?us-ascii?Q?xJtl2OupH0S8apWYTtcWpzuVIA698MbLEHWmD9CIYVQkz5ln4aJ+M7akSy8o?=
 =?us-ascii?Q?A7OPoMS/Sfj/FSLIGk6kFc3qUElp046v9arhXFGbpkPUiXq4W4MMAK6aq/L4?=
 =?us-ascii?Q?tX8yfgAtwR0oXz9H3E2vX7SBc2A20L6MBSndR/gkuvpWcPCYAPR8WDKmYGU2?=
 =?us-ascii?Q?vS/mmGcScjaXyBrr3YgH/95QDxDBoc6Vnnmd6X1hW0YRrJmAO0TqI0oItOGS?=
 =?us-ascii?Q?ucqH2XAZ5FfpcXfklFnPvhMu4pU3TiMpyVeFYEPuo1PTGlJEzqggqfyLMoEg?=
 =?us-ascii?Q?lAWzN61RbDTQgoPdV2wjjNZgRfuWu6EL6Mz4Hn6OGzQTbRrGGO5NTOTauZan?=
 =?us-ascii?Q?4Jz9KqhdXJTrdjkMm7JT3Av4aD7n0Cj3kR6TtKTpqUEUYYeyGbl58kHfqAoz?=
 =?us-ascii?Q?+DtL8qZ0OSBR64D3Ryqp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1EVnRhop5bnWuzdSVpK/6Fpcp7cx1V+R+Rgp7Jts5I5lsYtKmEkc9kSwOZ6l?=
 =?us-ascii?Q?Ht1RP5B5Dj3jHHjSdXQzRNJyJWxSBFAmmpolEskY44r+qoxlUKW45ZIBX/8b?=
 =?us-ascii?Q?0l0TO8Al0KvGuT8LpQMGRD1cmsmIwZ2iNXzE1R6j+nxAB18C+PQfFXYR43Vq?=
 =?us-ascii?Q?no9MciTwciUWeFkDfebRCf7vrGQDAgYRBpUw00qgW7Vl64Bh2D187mc9L6Bk?=
 =?us-ascii?Q?592MBmp1rP0DeCic4kP5rNm6oN3lw/IZwDAj7rojZrA8ddOAj8x+sfBKMDdT?=
 =?us-ascii?Q?44AsqV/WYVgeBkcKA/0myWK1iYGc6VPDWGIwJZZiKH09sMADCQtxQQrVxN71?=
 =?us-ascii?Q?Dcrxy1DiHzWNrdAlYgeu0cZgthHpOrJ3q4Lr7LC8mlfdoJNB389EjNrmpLVf?=
 =?us-ascii?Q?gx911F1kd4EYB2IsAdMtyXdSK6aVuIJ2SU2I3zxWJdzbbB6zVJ/xGIgdBDps?=
 =?us-ascii?Q?WKy2OPNSjNVvBaPf23OzHCOPKoBKMHzViXLUOv7O5xqnFr+deuLagB6Yh2Vi?=
 =?us-ascii?Q?QAA3hE5x959zEvEFZ6CEopGfXRvdUzaYeaeq72fGRyz+FaqJLV4kEh9lF6yk?=
 =?us-ascii?Q?RjkAPKinsAGwttauFrARcoU2B+hcoMDXHz4v0LIgUbIwBBOUXC+2+9ttKhu6?=
 =?us-ascii?Q?E5UzOYs+SRA5mBM8P4rdTWqHabAGphhr8munZLHt8rUow+xsscauzXrNRJ4S?=
 =?us-ascii?Q?G+QneHMnMeq/+Z1gRrdBxGjqCIC5kf/edfdLTiMkcGlqIIDvOCO9dJOGOGeZ?=
 =?us-ascii?Q?yHg7CQ/1vqOx4vmdoZvEEvMp8Pcs1R2S5rDctmpmpPGKeNZ5Ur8ZawgqstWp?=
 =?us-ascii?Q?CFc+Q9+ue4LtewofIiMRwcJfsTPogvJtx3jjy0rK4jpPAvFM5iWW6MAxxmgR?=
 =?us-ascii?Q?mMFGYjepIpxi5yoREqE2qsyOnSmToj+Qs6FcjunaHBO3lwACT1bFwhXwWHq0?=
 =?us-ascii?Q?H1kSZ4Ird/3aQ6e6UVnWInBBFG7Nm5P16osBnNvunQXu4B4Up7cRLeceo16K?=
 =?us-ascii?Q?aVYedZQxFqxatQOIGbbVnKyfFINo0oxpBnJWD1ZheIKaDZnoegLJtHEbiALx?=
 =?us-ascii?Q?kmweBM9neYk/Z7WG88cQWVcS8R3h7jTnNY2StzmsJ+uMUtA3CYL+5RLhTrJa?=
 =?us-ascii?Q?gQnFv6A47RJ+WF2w8CYAKbRQEsMSYST6h4anuTpc7yiTpYr1mZ1GTELqUOR5?=
 =?us-ascii?Q?yGak3Dp/ll9QKsZE0y3YWN345zGtNe/EkNCufj0H84gtJArkpUMTXl+FLOi/?=
 =?us-ascii?Q?qSojnQjSoB4tP4bFTuVZjilPr1+OMJcLolJlle5qnHp2ndJ44lwy3YHq8HTb?=
 =?us-ascii?Q?sX6Ly1GDiDheNoDPZevrSj0WY4NJQil/Fbkm0RNW1g4thKJqw8vtj0wCynHR?=
 =?us-ascii?Q?AR6o+D21pZB/9p4lCGCf/uet/qtHTmIyvJwrPXj8/a80FZ8lXLNjXV7Z5vT+?=
 =?us-ascii?Q?QIbRioetxgydm4W3nHFcCnQS4DhhXOrRoQ1obVLyidKjs/o5HvDfprBj417i?=
 =?us-ascii?Q?Y80gyagyByYntaDieW1e0NexaGX+zQ7NS8UeUcksbPwn/ZH79iZjt7FhNRK+?=
 =?us-ascii?Q?J9nCGMT8DA9LbSut97LXNTuzo78xeLgvJqXpOFrL54iO1V8xYpeIk5Sk9cSP?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e236f74-11d0-4105-440b-08dcfcf9ad41
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:54:06.5629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvnSzelNStio5umrx5jNPw9rtYsXqsBrHG6JgKDY+Q1rukYyHHQPs429ONnIZHX9G9/edI2U0m5QFQR7p5csyV75lBcxuNWQYeFpuascAkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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

On Mon, Nov 04, 2024 at 08:29:40AM -0800, Matthew Brost wrote:
>On Mon, Nov 04, 2024 at 06:38:14AM -0800, Lucas De Marchi wrote:
>> When an exec queue is killed it triggers an async process of asking the
>> GuC to schedule the context out. The timestamp in the context image is
>> only updated when this process completes. In case a userspace process
>> kills an exec and tries to read the timestamp, it may not get an updated
>> runtime.
>>
>> Add synchronization between the process reading the fdinfo and the exec
>> queue being killed. After reading all the timestamps, wait on exec
>> queues in the process of being killed. When that wait is over,
>> xe_exec_queue_fini() was already called and updated the timestamps.
>>
>> v2: Do not update pending_removal before validating user args
>>     (Matthew Auld)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 6 ++++++
>>  3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index cb193234c7eca..ed6b34d4a8030 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -605,6 +605,11 @@ struct xe_file {
>>  		 * which does things while being held.
>>  		 */
>>  		struct mutex lock;
>> +		/**
>> +		 * @exec_queue.pending_removal: items pending to be removed to
>> +		 * synchronize GPU state update with ongoing query.
>> +		 */
>> +		atomic_t pending_removal;
>
>Would the interface in 'linux/completion.h' be better here?

I think it'd be counter-intuitive in this context

1) most of the time it's "done" rather than "pending", which is the opposite 
    of the completion interface - note that you can't call complete_all()
    multiple times

2) we'd still need a counter to support multiple queues being killed if
    we keep it on xef. Imagine userspace did:

    	for q in queues:
		ioctl_wrapper(fd, DRM_XE_EXEC_QUEUE_DESTROY, ...)

Not clear how you'd do the complete_all() thought. Could probably be
more easily done if the completion was in the exec_queue, but the task
reading the fdinfo doesn't have access since it's removed from the array

did you have a different way to integrate the complete in mind?

after writing this I'm thinking the wait could be the first thing when
reading the fdinfo, even before  taking the force wake. That would
synchronize well with the scenarion in which it's the same task doing
the destroy/read-fdinfo and for others it wouldn't really matter.

Lucas De Marchi
