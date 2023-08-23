Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CDBC27C40
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089E310E0DF;
	Wed, 23 Aug 2023 19:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679A10E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692820011; x=1724356011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XHgfV5w8TbVsb+yU9h4BfCiNIRr3WjmkuzF9DMNXUWY=;
 b=DweHmpEsIunLnslLHqeEOEDRLdA9lOm+TjvJz5unGR9mKsKXnR70Otqy
 2kz2PZBuhUnVgqwEybC9MD+0izXZlv2ffLydhmGHPMdUeo48OscwGShXT
 oYP5T2+evGJ22+sHjHAhpT78SJF0FLPDi1UQ4xV+3r/Pkef/EovKrSij0
 XN7pYuDnS9gsbz76+HPvTImp62uGWBQwy2qY+u2ME8g6Ljul2U5lH0qqA
 EQ2F51s4hpi2xcL801KxwsdLPBLvM/Ei7FnwUifiC7iuCVqE+N7/s2OLv
 8BzrPF4SeqVWAF8E/REGPyaIGuJdyYh+tN3G5eR+pdGmjN/fdPi555ezZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405259960"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="405259960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802262104"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802262104"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 12:46:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 12:46:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 12:46:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 12:46:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 12:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRO8Hg2ToCAk8T3RMC7u/ZFF82+04DRRqnaFblEJuyD9yUxga+6aUslirYVZ6eOiGkMZU8Mge0qvhMrLW0zb/bjx2NIWX85M7R2mZQFzjPkapldL/W32+MBWH9iVAPyvjwqRCRw/TzdR9nw2LguyGeJ4Dea3tyBiAGK6M7zIMC2jEiM5sc0GNQ3zAFtLe4dHI9Nz0wj3iJWnRZudrBNBCKHx3LcgBFFcmUf7QAysYVToA984ENTAoEkT/BDKmV6bj0tiDHVDJzilz90yFP90LvPWINT0NbCqDWGKuewryCUGNM5ksael/Ivnt3xJqbT5FLmCgff07zR8rjIOrlR7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk2Gt+DmSHpNfgQcsLQ+oEVfFyJ14IGS2lfjBaqp5zM=;
 b=RDpYHMG3SHwTsGO69F7Sl4pKyA+ZRrECPVYuLGW9ufPRfOu9+y5o4hRYkR8T3zdpZP7vLbSgE4c3xCUCN6UV2anC4sDSq2fnaBkdPbIS4R/ack2pmlZ0lhe+bECte9DeU+pjMvqwQeR3iKKpwWfxConkbRGpOrgu8XZT4kur2i9/i86qu/VlGzmEjGkyjaG21oqsKsHu3A/ubk7603pRJ7qEwcyut8RefDDjSmwgsnxYMFpfwA+jSrJT+0mAdNJtLqr/m95/tFxJc6UCQYjM4THjTbHjMZJRAIVegWhLphwQzoHDbilOyGlCtPdnaXRJ7RuNUyFHanC7cLXP6gYLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47; Wed, 23 Aug 2023 19:46:48 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 19:46:48 +0000
Date: Wed, 23 Aug 2023 12:46:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZOZiJae52mnaeIxp@orsosgc001>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230808013159.38811-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:303:2b::6) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: d35bac33-35db-49e0-1f15-08dba411b021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QShgi7IK1dE3Q5nbi5E4yN/Ht/uuRDzx6nkNQH+/aTN3im+/i2KUHBkP+Q0EwQAQ8n9OpLyIvbzVd5dC0Nphmc9t0oKHT6O8FlV22w0xt9/a9Qu0ork01935P8p4TmbrO+eXa/29xQ3FU4n6Ydd5T7lucWGM1CRl8Y+NtenYzUW7X+AiLJgKnF3OkySsLfb0xcAH6yaj0+E2jSRnEeCmK9WoYmOZINvw8w1jdpFy1d2NwyFEmAL97elYkZPsTwEd7apU3TTiDxqk+GOenExqFCGynFgfG2rj5MSmHjMwTk6fzNf5LSxb/rE+X0Y6+LMurthJoNrLSAyfGsqQtNt/GCzkJ5cHH78ySRajzEACbgGEw/SbzHf+4MuCTvw2nxjA93sYfy2HuYYYPOKsB969Zi36xyK0HVPxLL61/AEquiz/2nu4/UqukJHSTg9q6wgquVxsGWT+S04vrhpT0BXHF5XIZCm3B8PucnBNqcQHrAaq0TJtqlC7ruf3SF8HdVyMijXRtJQLmLye+bC8gg7AvrWM95+p8/9rzc3IGMgusxVj5o8hQF9oqXdYHEQuDwcL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(186009)(451199024)(1800799009)(66946007)(316002)(6636002)(66476007)(5660300002)(41300700001)(66556008)(38100700002)(6862004)(8676002)(4326008)(8936002)(82960400001)(33716001)(26005)(2906002)(83380400001)(6486002)(478600001)(86362001)(6512007)(9686003)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhZRGNkNHAvL2o4eTR2eFRZaGZLZURaSU1nbjk4VkZXNCtGZEY0UmdUVktU?=
 =?utf-8?B?TUtwMkgzVzB0a3pBVmdDV2FteW5RWEhSRlVBNG5oUWJ5bnNZcGIyWFVWemth?=
 =?utf-8?B?aDBlSkhBMUpXQ0IzVndlMVpOLzBVMkhLWjhzWlpMUmxuMkR3R2tzbURQM2xZ?=
 =?utf-8?B?b0ZtR0xNU0g0NHRoMkxYWnpOMFdLUXR3ZnE1bkdJLzJ2RkVRYmdvbkExTWk5?=
 =?utf-8?B?WjNib2RuL3Z3YlpZd1FhdHFQL2d2SE1ndFIvUW0vbWdXZElBMHI5ZWk5WXpT?=
 =?utf-8?B?ejNRMHV4Yjk2KzU1ZlNEd09QaUVMTmJnWWRtS05MbjJ4K2t3eGsxNkFwN3Bi?=
 =?utf-8?B?cjNNUFMzZ1ppV2pVcXZFU210c2FDeVRlaTNocVdKU1hiYkdkQmU4cG5kV2dN?=
 =?utf-8?B?ckU1Ty9yTTUxWVFtMnBBcVhsUnhQU1ZTcUNjTlRGNjlUZ2pYaHhwQWlNR0xQ?=
 =?utf-8?B?dzNvT09wVFVuM01HRlJ2cGVBSmVsM01LRDZrd1dQY0dRL2J5SGJneWJCSzk2?=
 =?utf-8?B?a3M3U0IvbXFoTGIrUGs5dm1DQXJhTFYvTGoxREtvT2M3TEJQOHQyQUZNdSs4?=
 =?utf-8?B?STZkVVRZOHlMck1WTE0vZllGL0NoRjJCN1AwVXBXdUozRTlpU05QSE5DSmdR?=
 =?utf-8?B?RlhuR3hoWkpPaEJSbjVRUmZsK1k4bWpCYlphQVJQa2NCMlluc2VwZ3crMjM3?=
 =?utf-8?B?cVFlcGU1RVNHODkza0FSeFBYSnZrTnpVd0g1enlYZXJDM0ZHSEgvWlFXdDR3?=
 =?utf-8?B?UHA4QmtmM3gwR1RTQkNJRzFtS2NmODFLZzJuRm8yZEtIaFYycGRNMHM5bWl4?=
 =?utf-8?B?R1E2bzZaM2ZkTFAzaGtrYUg2UGNqOGJlVUFiN1o2QWtZWUlTR3dzVEs0L09U?=
 =?utf-8?B?eCtHQ0Z6aE51QTJnNE9hYzByekhmcWhidEx4R013NFVmMmM0czBnR3JidTBI?=
 =?utf-8?B?Mm05WTRLamg3bTRqbkQrdEc5MHN1V01WOVpYTE9FL0RVbk12eXV0NmFzZGlZ?=
 =?utf-8?B?RllGYklqSDRjQm1oSDFzc3dpSWlYNU9oaGxNWUpYc285eVorZVZYc0xYUHhS?=
 =?utf-8?B?U0pKZFNid2daelBhSlhsTVZ6SFBwNi9HT3NDQUNrNHNkMVMzKzAzZDRkWU9s?=
 =?utf-8?B?bWhudlNSa2NSbG5YaDJPUWhYS3JYYVJmeEFxZzN5M1VqcjdINGhnejd4WWdr?=
 =?utf-8?B?ejgrU0cxTEVSUFNoYXduL0FtUzB0SzJaMlNCZDNhaDcyWHFlQVNVTzYrV0Nh?=
 =?utf-8?B?WE9IZ0pNMm1admN1d2hNQ2JsN2xpV2xqalhDNGVMQnIvNTU3aHpmL0NGSDBV?=
 =?utf-8?B?bEl6akJnN2ZRb0RmRTgwbkx3NGl4VWcvb0djcmtSMk5ENmt2QzMzV3ZPTy9q?=
 =?utf-8?B?MEdBNVZsaU9FYnpVZ0V3MGRsQXJacHRxc1ZqNjQxVmpna0t5b1dTKzV5VWJ6?=
 =?utf-8?B?Q3MyZVRiVm0yVm15dVhXOTlTZFRpeTF1d3pkcUtCWXJRcXF3TWxoYW1vMklu?=
 =?utf-8?B?YXlvMHJGaDM4WjhmWGVKaVNCZVhmZS9DUHJxVUc4ck5JcU16U0lMZmxMMjYy?=
 =?utf-8?B?b1dnc1dMczBiRXN6bUg3VzE4cjBtbG0yZ1ZUQ3JWT00waHgrN0RtWUxwaEk4?=
 =?utf-8?B?aGJRYmxrak1yQm9LSjBKdEhjVjAxYSs1QkpnZ05zMGtpWmlTOTJZd0RXQXJu?=
 =?utf-8?B?OFdyWjUwT0R5N0p2d2Z6bmtka3FBVm9zY21WcE9ETVJHeFJ2WVVBM0VlajRB?=
 =?utf-8?B?SThFUzBTNW9pb1VqUVpHNitsTjVnU1ArSjJ3dzhrcmhNKzhFUGFGU2FydTdS?=
 =?utf-8?B?MytJcXdEM3JoZWxsL09LQTYwY3BNeXUvS3YwYm5WMFBtMFQ0dnorelNyaEta?=
 =?utf-8?B?U2V2eVVqNHJTcytCZ2h2QmN5RnYyMWEyQnZEcVpNd21Dc25MQmtDWE94amNL?=
 =?utf-8?B?UjlXcDR6VzV5S1ZUSXNFbWk5MUpLcm90MFEra05sUXVnMkFOSnRaOWV4SGpG?=
 =?utf-8?B?SHF0N3lia25XYVI5RmpXM09NOEttcW1YNHJ5cEZNRisvc1drc0VJTVRjeWpT?=
 =?utf-8?B?R2dJdVFpNXpxZW5wN1pJR1c0NGg0MTM4RzZkWWoxRTNvejhSN2ZiaVl5R2pu?=
 =?utf-8?B?cnZDUTNUaTBnbFI3RWlNdUtMOGQ3UEcrM2U1VXZKa0p5cjRWTW1NNWNTUlg0?=
 =?utf-8?Q?eyIIO44dBuh+pPdcG5pA6QQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d35bac33-35db-49e0-1f15-08dba411b021
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 19:46:48.0988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S/rdVLx5jH9joQ2heMcwAByPaDGk4oFhOG0bwqWxSz9Ai7eu4mLKeNRXzwo+jbmCuOr7ksUOPja+CdM1tsJZAR7ZEwprcnofxqMk8rOZEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/10] drm/xe/oa: Read file_operation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 06:31:58PM -0700, Ashutosh Dixit wrote:
>Finally implement the OA stream read file_operation which was the only fop
>missing in the previous commit. Both blocking and non-blocking reads are
>supported. The read copies OA perf data from the OA buffer to the user
>buffer provided as part of read system call.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 359 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 359 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index c97180997427e..fcbb352f36a48 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -146,6 +146,29 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
> 	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
> }
>
>+#define OAREPORT_REASON_MASK_EXTENDED	GENMASK(25, 19)
>+#define OAREPORT_REASON_TIMER		BIT(0)
>+#define OAREPORT_REASON_CTX_SWITCH	BIT(3)
>+#define OAREPORT_REASON_CLK_RATIO	BIT(5)
>+
>+static u64 oa_report_reason(struct xe_oa_stream *stream, void *report)
>+{
>+	return FIELD_GET(OAREPORT_REASON_MASK_EXTENDED, oa_report_id(stream, report));
>+}
>+
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)report = 0;
>+	else
>+		*report = 0;
>+}
>+
>+static bool oa_report_ctx_invalid(struct xe_oa_stream *stream, void 
>*report)
>+{
>+	return false;
>+}

I think I had posted an updated patch for i915. The context valid bit is 
applicable to gen12 as well, so we should implement the context id 
valid/invalid helper.

>+
> static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> {
> 	return oa_report_header_64bit(stream) ?
>@@ -153,6 +176,29 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> 		*((u32 *)report + 1);
> }
>
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)&report[2] = 0;
>+	else
>+		report[1] = 0;
>+}
>+
>+static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
>+{
>+	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
>+
>+	return ctx_id & stream->specific_ctx_id_mask;
>+}
>+
>+static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		report[4] = INVALID_CTX_ID;
>+	else
>+		report[2] = INVALID_CTX_ID;
>+}
>+
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -234,6 +280,199 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static int xe_oa_append_status(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset,
>+			       enum drm_xe_oa_record_type type)
>+{
>+	struct drm_xe_oa_record_header header = { type, 0, sizeof(header) };
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	if (copy_to_user(buf + *offset, &header, sizeof(header)))
>+		return -EFAULT;
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset, const u8 *report)
>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	struct drm_xe_oa_record_header header;
>+	int report_size_partial;
>+	u8 *oa_buf_end;
>+
>+	header.type = DRM_XE_OA_RECORD_SAMPLE;
>+	header.pad = 0;
>+	header.size = stream->sample_size;
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	buf += *offset;
>+	if (copy_to_user(buf, &header, sizeof(header)))
>+		return -EFAULT;
>+	buf += sizeof(header);
>+
>+	oa_buf_end = stream->oa_buffer.vaddr + OA_BUFFER_SIZE;
>+	report_size_partial = oa_buf_end - report;
>+
>+	if (report_size_partial < report_size) {
>+		if (copy_to_user(buf, report, report_size_partial))
>+			return -EFAULT;
>+		buf += report_size_partial;
>+
>+		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>+				 report_size - report_size_partial))
>+			return -EFAULT;
>+	} else if (copy_to_user(buf, report, report_size)) {
>+		return -EFAULT;
>+	}
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>+				size_t count, size_t *offset)
>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	u8 *oa_buf_base = stream->oa_buffer.vaddr;
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	u32 mask = (OA_BUFFER_SIZE - 1);
>+	size_t start_offset = *offset;
>+	unsigned long flags;
>+	u32 head, tail;
>+	int ret = 0;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->enabled))
>+		return -EIO;
>+
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	head = stream->oa_buffer.head;
>+	tail = stream->oa_buffer.tail;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	/* An out of bounds or misaligned head or tail pointer implies a driver bug */
>+	if (drm_WARN_ONCE(&stream->oa->xe->drm,
>+			  head > OA_BUFFER_SIZE || tail > OA_BUFFER_SIZE,
>+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
>+			  head, tail))
>+		return -EIO;
>+
>+	for (/* none */; OA_TAKEN(tail, head); head = (head + report_size) & mask) {

We can drop the 'none' comment. 

Umesh
