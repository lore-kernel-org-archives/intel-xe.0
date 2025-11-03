Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176AECCFA00
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 01:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C979010E282;
	Mon,  3 Nov 2025 01:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9kQMPKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721D610E282
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762132522; x=1793668522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uDX3RV+EebRmLDwkwhhhV/hZ4jUOA5HuswsTn7Q/l2M=;
 b=m9kQMPKr5aNlWS9ilK+5lzWAFEJnShfyM0WmIFvH5XOmQon7WLjyej8+
 BnC2qVSx7CPNI/xX6Mx/JiCyWSJXfqclo6zsxy04USS1CWZdwk/b5V+ga
 346nezzEDcotbKENcLVIqcnVMVVLK09qHWA8hsKNzZBJM+W/K59jjCi4P
 uPNXLFA2Oq3ehpmM+01c1/VPLzxLLeu/QVInc698dP1ToI5CTUqtZWW8q
 Xg1fETjKtRt/JttzGmJ+ZzucrUn6e8Mlg8RARIBntmvF6YI90GlS4Q773
 ldMR+fQbLYy6ALNH+qu0JA+Ht6o5WQwtlqd57meV+jEG1kA0RGy/nR+65 g==;
X-CSE-ConnectionGUID: SYH7G9x2RrGFc2p9eo5OHQ==
X-CSE-MsgGUID: jG/w70+mSrWpv3KxG47kVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68045630"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68045630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:15:21 -0800
X-CSE-ConnectionGUID: ziZwyIGSQHmlYxLP7D7h9g==
X-CSE-MsgGUID: tPL77OyQSTudO7+4nEnXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="223980919"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:15:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:15:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 17:15:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9fRTtkrPSjVAePRXhrAnoLDupOPnv9/UHYtSP+wZJkAM6tll2Z73Ib2EKqTB7wmM232+Ax3lk/FyGaQPjOFD4IiVepkuUeHT3cHH85ZTh0nzaWz6heheu2Soih97DZ36RgE1aEjt4F5M3CobNeDxkI7eHXl94Km8HOqF/e2ct/TirkIPC9J33UeTl4AcfInMQIe1FU0ZFEucwftzYuWeJXUhkWgzteYlEhcuDoG7jbhZEINSZiS65Vqe4vLz4aXWMv6xwiHjku76/fIERAAuiDmDVhQDCLb6akGBPwr1Fd43m/sWJBpGrAufBPo9SMkAz9gHO3/S5t3Yx9QAYSRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmG8z+qHknmZtVvuVIJq8Uicm5tcJ34VkfnGV7LvnxE=;
 b=tcG4tKezseOHzP3EbI029/8xeld7BfmRBpJvWxesFV8/sTl+BL4+9xti3SYKS+ntpAls56x22qtdnUQ+ORb/T3W2txnZbDHtkj+C9ajkzMfEEWX0wAfXTyfX9/rp6u9ixlttCaDMNTUhTjlxfLSzNNZcJMlsv+y9u6S2/3HZWwz/D5c463gqL9MSMJjD0uDexCAgvLsXJwkhS4tWajKfHdJgkrnAuS2BRGuPtaLj6q6Df3T+bMn3GNV5YfhEyJR/AYRMlku9/HO+FnG1vYe0whaXd51Vp3ZkYc8FlDnFc4J8K3PIe5gNOkF/yi7b97Dju5FkUusYlqmMqt/GAzeZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 01:15:18 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 01:15:18 +0000
Date: Sun, 2 Nov 2025 17:15:15 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/16] drm/xe/multi_queue: Add multi queue information to
 guc_info dump
Message-ID: <aQgCIwKMcL6AaqfO@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-9-niranjana.vishwanathapura@intel.com>
 <aQZSAMUYdjbKvAbm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQZSAMUYdjbKvAbm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f0bd76-8217-4725-5bad-08de1a76738f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gVQAb4jDArw7mU4wn33Qljs8rVE4kZ8P6/3v9VNE5wG/cAO/N9v0qGbzSKfa?=
 =?us-ascii?Q?3mzFVlJunlz3TabBRZ+ps0h9kKz++bB6u2cU5LU4JQ1UMkHgoodenTxGSm0b?=
 =?us-ascii?Q?0zWqWeg7utfR0pZjnkgP03skSBpgvEbM2jY98RmnOInsQDLkf7Y9aRmW2QMd?=
 =?us-ascii?Q?OOkmH69DaQaxKSV32RiozG6eHf4l11UkfhQLIcCeDRdlJO9NAHygasAcnMZn?=
 =?us-ascii?Q?+r2BKN34Rf/wDDZG7av84eiQjPA1uolhy5EQgyQXH8bOeUXEkXL2DsqLGdjq?=
 =?us-ascii?Q?sWfSKu8ZY+m7iUYEfQNm0UEdu7gL0IzQQUTda9FgkzMoIqGylP5SyRhu4P7d?=
 =?us-ascii?Q?TCmNl8zxjrLMWx/wkIEZUqe1eHrz9NF0WkBDX/PqCSt0xE9C2r/1J8NvmXwO?=
 =?us-ascii?Q?kgKPVxeoLPSKXe2KYiXG4Q8m97fI/demfpIS5rkoe665eVV1zKmR9WiGJQzL?=
 =?us-ascii?Q?afhey8LrjAbblLlTw5s3arAiq9OIqGhNOuxerAprNrzmNLWDrB7mrwOjEHxY?=
 =?us-ascii?Q?ig+qxlEZh4XdsRPdxgksbb5fZE3ybj5fh7oiZ2uUBwTXFFuf3upw4S2YKDaO?=
 =?us-ascii?Q?LUPw1sgAcy62PK2dQ8YEyH4/IUqevmbJysi9WGG/L4PIliD5VjB0m/QRdrGV?=
 =?us-ascii?Q?PywFhYUFTvdWTBw/qLg7bzyz8f0a7wzB4r8eqmNygRdSkDspfBzVYSdIXYbh?=
 =?us-ascii?Q?wI0VodV+imdWDtZNpB89V6LocWYoWp8ARvQkmqsFiysXhl7J928O5CvSXWq/?=
 =?us-ascii?Q?Q2q0kdPi00pPp+kndn9OoqstM25ndi441f3AyQ8SakY3Sdr90cnvJ6yot9Sv?=
 =?us-ascii?Q?4lOuyYhkHTWkTvb3wXXU0ZVMc12Ss8XhOYYNrdMB5g/0Px0QtbVMeZvhCKQ2?=
 =?us-ascii?Q?z6dt6CZEzzDQiZPMGmqrm3m+0TXYLODfekFWSUC6CCwg2PMXftzGviETxeh4?=
 =?us-ascii?Q?YeGbKQcgXM4S35JYxceOPWViD5ykaBQl1kRmohaiBn6jTdsSchxanqDMp9NF?=
 =?us-ascii?Q?0KXmFzSfVj3udDkA0wSgdIC17VdKKgaHvDlG5c17d2F4GPBMQQThN9L5fH5w?=
 =?us-ascii?Q?KUKBUtNtJ7Y6u8gKFA3dLkFKDoPNDT38SHl9Zb2yEgeFHXHpPgSze5uetWpe?=
 =?us-ascii?Q?Pz6jXHIzwMHEYrv00ReHtptoHhpZDPPk0KjR/EfhBzJN8idbsiarDdKaeRud?=
 =?us-ascii?Q?Bbr2baspIJa4qfuQxhu8IZRXSB7HFQ+rJDqwN1krv2EKH2dP5tAXMhJmaB6k?=
 =?us-ascii?Q?4Msj2cDiV3NbcXy2kyY1dpX3ofmKE1fM2Pi0nzGGJhuShXWBCdjFtYJt8i4U?=
 =?us-ascii?Q?879Rjxabu7Z2XtxOLJUIWu7Z+0ZYCsaz0Jsx3jHQU5WDRtyHiipiP1eLgofN?=
 =?us-ascii?Q?WPohNAJ9mAut7z1C5m3RJbZ0yrmqLgMvfcAvoUYpysvSNfmtVkOuc8a+/ujp?=
 =?us-ascii?Q?d1EG+4VojrbatxAoHVRVSkO/LRfHS6fk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2rLQVBOkdq102EV7KUhs+jy+1nqQCd9xxo/1SJ04gJcxCZo/ZZhfPyzJMN4?=
 =?us-ascii?Q?+F+XJQ4iZVKIG4QuhiKJ23pGkxablfFe3ED2E4h5fCUs7Sk/M8GS+5RHbdf8?=
 =?us-ascii?Q?20E6V8pIN7hl5UukFGA2YT8UFagmaxwLWXRF19j/ZqGVuMTPJ4rCjJV8u4B2?=
 =?us-ascii?Q?hyn4jqSZf8c3gOkIJIbn5+AB0JFR+bqMwJmk7WNKA7/VdoMLPhdmDaE6/eBR?=
 =?us-ascii?Q?1u/00OsLRmsEbfp9f9c+9pAehbNzNR2GRnEPChNXhVIA+YMC7WcqYNwA6mXV?=
 =?us-ascii?Q?rt0pCgkUh32xmXbty4Vlw49tbG2jLQ9rF/L4TRUdBtimc+z0g3ePH62nvxmX?=
 =?us-ascii?Q?g4De8hJdUL3XwMaophGU2dQ0r4CK1rjoiZqpexnlQH1yM5PO7Y1rv6OHmTTF?=
 =?us-ascii?Q?GwrU+w7s7j/z4f52shu4u6Xm3ZtdbYvtjBuft/BGxxgXu8ux8AI2kQvJfLOU?=
 =?us-ascii?Q?chZCyArGRiU1bU8neU7QE+ps0WJ60mKnZ5oNdNE4hVDiak+pPHeryUgvxfiG?=
 =?us-ascii?Q?MkmQg/U9FdMVpPcY/Fk9suFyCLfdXIzBU+TAIll55hEvZz118bQJ6iua61ua?=
 =?us-ascii?Q?mnyryPACinG4QtXWL6jHJPOThfGvVLvP87pD4mGScxzwsgsrDaOFpSV9I2lH?=
 =?us-ascii?Q?E2rI7bJTEO4t8tSbzjMuVlIZZGnVE6IA85FGowHMOqI5DrbqfYnCpnULSTtt?=
 =?us-ascii?Q?BvDP24ettHg1K/1NnKgKSQ/A8LCqgZYRvE9QTYzWUs4jOqF4idi7YK+5NBYa?=
 =?us-ascii?Q?+1rkPq7zBA20/w0mdEeQx6goyCfjsJZwM7opeLuV9pKt1SGXjlsF98cERuIj?=
 =?us-ascii?Q?S6G1y6a/a+oDbhXQdp/3hYwkyow0Jn23JWx6V+YE6VMfVp2cQAWDfI7KRPSz?=
 =?us-ascii?Q?XCU7z3TxsDVfnRngJCxMORsl/P/ZfqMTfUhPmAlR8MxBm/8ewmwhAbeK0d0G?=
 =?us-ascii?Q?ry1JTblEVBa0QM8USWmkq5Jy3bR6RseC1P0Fp7c+mYaE3FqwuNdEIwuEipnZ?=
 =?us-ascii?Q?0oH1XCkNZU2XxNnk+K9UUSIJbXEBBHyEqX5kcIAJA4awUMY1CWJviPffuNFH?=
 =?us-ascii?Q?V375P35pEf5aAHQF2kJXXt0F/gNMVTzRvciC+hxjq5k50TCVG7LY22h6nqaD?=
 =?us-ascii?Q?faC3s2d4wNrLgddIImZhIf45f1ld6LC9fycmpOYQfxxsvPoYZ0RFzNs3DTax?=
 =?us-ascii?Q?k9HZKHd0Bdh+uRrY+XfXCFqigphd1WAFw2NToIKAigzmWWgOHY2I1jc6PWPB?=
 =?us-ascii?Q?uhEEurcEPWoPMIEMMLhrV4MnqIhjzP2a8YpTY0wwGvAIRwW1RR/6ddkrarQh?=
 =?us-ascii?Q?Iuoe8Ktt607c4WOaUyEi3DewVM+Wv+orHu5N/hmMhi23KBCAD/gk2Th59XM6?=
 =?us-ascii?Q?Af7sD0Uu+Tg4ZYb11DGVKHd3ILfgRzzM6UqSyjfHwgmD3tsVvE702dt+84W0?=
 =?us-ascii?Q?fA06XbzvwBlpTGiVOmC1qGwj7sldVsPvuQK7c3RAkyersWEjmZ89qrb9J2T7?=
 =?us-ascii?Q?l86FhwGvpkOX9JAFblZfSEzb3WgasqFzHnFw/DMZgYtbdrC0at4DgfSiBPCZ?=
 =?us-ascii?Q?8RrH4El67qnaugIqMpS+1U9r99Gfu9SGMod+dPwaj2g/U4LTDJSIE60UU2Me?=
 =?us-ascii?Q?zzrcdUC+ttr9/GmUm0Po7MU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f0bd76-8217-4725-5bad-08de1a76738f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:15:18.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4YAnOzFGTf1f+fhbyFtpJHdPYDSJjPfA3iI/NziJxO7tShG1J2NEe8LkNZ3uoAoKwi/Qwe8hx9tZ9pzWL3F4T978t+xjiflQGhyfKID/SftwPItmmD6z1lZNguBmiK8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

On Sat, Nov 01, 2025 at 11:31:28AM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:28AM -0700, Niranjana Vishwanathapura wrote:
>> Dump multi queue specific information in the guc exec queue
>> dump.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
>>  drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 426b64ef8d99..b84a0be2eefe 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -3032,6 +3032,11 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
>>  	if (snapshot->parallel_execution)
>>  		guc_exec_queue_wq_snapshot_capture(q, snapshot);
>>
>> +	snapshot->is_multi_queue = xe_exec_queue_is_multi_queue(q);
>> +	if (snapshot->is_multi_queue) {
>> +		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
>> +		snapshot->multi_queue.pos = q->multi_queue.pos;
>> +	}
>>  	spin_lock(&sched->base.job_list_lock);
>>  	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
>>  	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
>> @@ -3114,6 +3119,11 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>  	if (snapshot->parallel_execution)
>>  		guc_exec_queue_wq_snapshot_print(snapshot, p);
>>
>> +	if (snapshot->is_multi_queue) {
>> +		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
>> +		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
>> +	}
>> +
>>  	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
>>  	     i++)
>>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> index dc7456c34583..20dddf50d802 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> @@ -135,6 +135,19 @@ struct xe_guc_submit_exec_queue_snapshot {
>>  		u32 wq[WQ_SIZE / sizeof(u32)];
>>  	} parallel;
>>
>> +	/** @is_multi_queue: The exec queue is part of a multi queue group */
>> +	bool is_multi_queue;
>
>I'd stick this in the sub-structure.
>

I guess, I just followed the 'parallel' structure example above :).
Yah, makes sense. Will put it as 'valid' inside multi_queue struct below.

Niranjana

>Otherwise LGTM.
>
>With this nit fixed:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> +	/** @multi_queue: snapshot of the multi queue information */
>> +	struct {
>> +		/**
>> +		 * @multi_queue.primary: GuC id of the primary exec queue
>> +		 * of the multi queue group.
>> +		 */
>> +		u32 primary;
>> +		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
>> +		u8 pos;
>> +	} multi_queue;
>> +
>>  	/** @pending_list_size: Size of the pending list snapshot array */
>>  	int pending_list_size;
>>  	/** @pending_list: snapshot of the pending list info */
>> --
>> 2.43.0
>>
