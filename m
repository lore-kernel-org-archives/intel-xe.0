Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82AFCCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 16:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7106C10E444;
	Mon,  3 Nov 2025 16:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZYBc1XG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836BC10E444
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762188263; x=1793724263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8E3GJ/vqRjaOfvKwSXqOolIrGbNF7hiiG2OdygpXWuk=;
 b=SZYBc1XGlGRTScEsWravqdhvwrBxkEja1l0WwEmX1K+L74dfsP7srpZB
 CoKzf1OQZemsFIGWwrRn4NHid0tP6TU3V17560cgsOTkB1DvoTk19avyA
 0/vlRbMNM03uEPD92TCFgqmPULkRj3L1V6ZM8pRS3D1fC02V9Itv68D8+
 Oqi7UDKpFSF2yVd4hkTAM/movRR6OPvz8b9/AGrl+dek5YH5wvU43rfAK
 1T31uxstAIBxjMUGYUfqEILD16fgLcgZG1fmR8XVaTRMmtQ/GYDHlMIjs
 fxyZePnRz5/yKvUtq7QRYT0TERGeZzqVUALJPgVL5Hm1f9/mKDqdtCpyz Q==;
X-CSE-ConnectionGUID: /k94X/oOQ4ChyN+96L4vgg==
X-CSE-MsgGUID: ZumNBfkxTiy7fQNXwnLxPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63471037"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63471037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 08:44:23 -0800
X-CSE-ConnectionGUID: wR4pt90rTFa8QC7gdp9cZw==
X-CSE-MsgGUID: QpaG7RL7S5CqZmOythv3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187227335"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 08:44:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 08:44:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 08:44:21 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 08:44:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+w631OhiLH0xANt0/xI63CMPdXYBBxj9nyNjVsmeXep4PztaRtfoSCOSdhSEhX2hj3DeG6rMtt2qfDYGTAFFT082Im5sTkDQiYeZCQvYzkJcfNiNUbltA7twr4xiNT5di2ROAYZr7996q3tK98Xbb5U+lN53sbhLci7Vofxau5NnJ/tbMwRx20j7Vaa4vRovSv9ObzWV78nYOm+eqUrRCq97RPVhycDt+59gq1LzDE1z+ah5q5sAlarVfnYqTVlx7yJoKowM1XCZjtfpa6PNItGV6mX348EWJlGNiOEConr1no1BYNRCRv+Z3epx41NUxhhLmPVr8qFCHkCiZqveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOw/h2ulDAL8JUKUwHMwdhNoT+7Eay4zY2AHjPR469s=;
 b=C46c3WFm1QOHMrU6U7y1WVZWGDHohIQlcLE3DJXwQMlXlThbIZ4j4sxD4aEhxPJT9JeTp3xS+NxrQxQ0Mwz+3L9NxHXxqEnj/Qcio8J2f6CDtBI/W1iMCw3pk+HG/ZAj/szOZSTbiw7lEn2By340Asui97GRngM4RommX11wxjipPtc680shpNXr7oRSvFV0KWkFuQf5nMiNfdY3RmjQWnMqL/SVrxwbbWn2ursDwp8DGE34dxAnhpzxq8GEkJCI+0FrVyDWCISrmfMZZdBZ2Yv2gml2eYlvhXe8NwkfVlYmcqBFj+opLKWat6FlbbWXRtVrsPDv4z9bm3kHCV7lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 16:44:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 16:44:19 +0000
Date: Mon, 3 Nov 2025 08:44:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] drm/xe/multi_queue: Handle CGP context error
Message-ID: <aQjb4PmAC9VBZ3FP@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-12-niranjana.vishwanathapura@intel.com>
 <aQejDCgeUTRRIsTD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQejDCgeUTRRIsTD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: bafba710-218e-490d-cc59-08de1af83bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cvKyApV2+4lC4rNlpzI/VkiES5uoncFhOCytBeKjcG2mtN8v6jdBN/V20uqk?=
 =?us-ascii?Q?mYcMvwU4CcHD7wajOrwFuypX/R+itDgxt3Z9DsLTHCSmTxZEG3fT9r0WwuBw?=
 =?us-ascii?Q?jZTrh7yMfsdPeiIIYp4chQjqgRxZAE6L5AIXIpRiE6cMzFkrcRk0CBaTrqpm?=
 =?us-ascii?Q?+CP/OnbNm9YJgjV40J97CYU2AGEyxWBqWF18OUqqFtFwew5t/gmIN4yO0rei?=
 =?us-ascii?Q?NhhJGk5ue6X4qf+bYI1y3nTiFfKQ0C2k3lJkopDuPV5lvFKqyB0C7hnH89SU?=
 =?us-ascii?Q?rit3QeZlQeLb25KidOGyEgRJevKk1wpyDGc3AtFoRPcWL8ClltnClZXlH4R4?=
 =?us-ascii?Q?jaZO3yy+8Sho3nY3K29UeOAAo3ffmsQ1HslmXhLG8OGoDgErMpYuvKUoFtwi?=
 =?us-ascii?Q?Vsdu+w6upn54iba2gPzg2hxEKZqOKAfYDUwRLHlxx9Q1Z2BxnEB3EkBVS2/N?=
 =?us-ascii?Q?slxscsgMr2PR64L46xK5Q+v4WARhBCSReYScKhcPM1rQgTLRBkUD4l8RGwhS?=
 =?us-ascii?Q?WgDvJBsntaQ6mV4ECxy+g9vPuM/NKMNEi/s9joEsYB/MYxJ5HMeKs8K6dhVQ?=
 =?us-ascii?Q?pbA/fLyKK96iBPpqU4tfG3OS4/rnQqOBv1FRtkOXZq8rmjpFNNDjp0bzh8Mt?=
 =?us-ascii?Q?5r5D2ShwbmaabPb8xf+cvpPZCIVl8wrTuBmjIV/Mfj1EZgEwirfqRa0wulBU?=
 =?us-ascii?Q?fmdIhXX9dmrnnrVhzkBF9IwwSXttOvN+WfQFuzvtqweGsmktY860+sh5q6qp?=
 =?us-ascii?Q?AwX1fzLZRunwBKOevkjVjEJU6XY/IPTzcL5igvW0FX9o4lRM5JjnytObQtBB?=
 =?us-ascii?Q?125+5XElPtGEgHqM/UpqDfE2b4wYsef6d9AtG3wu2qalW9m9M95XYFEvg/j/?=
 =?us-ascii?Q?2JJHdlZim7+mwumcDXt0YoezUFTqSAe/3GxgUimoCoRQ1irXc7nKb+tbjvFs?=
 =?us-ascii?Q?3SOjmAEnOGEw+LzP7j8JwogDokeeaCqM1XRb2kbyvQgMbbCfudRa/mMiFzzH?=
 =?us-ascii?Q?SPWUR3nXvbkvvZD+A9/nHcCekniaicnStaWgx/WgRPfdbbCFSrza9mL/nGFa?=
 =?us-ascii?Q?PlGjCQFm+irRkhe8Db3KmT/5vOcwgNbz2XM/FIpab67G/fds/5uAF4MgJgw+?=
 =?us-ascii?Q?5zxzhh1ZXQy36ZMKpmlWVBFn6DU/jNMtdBjb2i7RuFZuBguGgJmu0mityiom?=
 =?us-ascii?Q?p4Vk33wtZzJ9fUuRCFsWu5NyLQ49hNpNuloJYq++NlPinw3na4aoiyrEHzP6?=
 =?us-ascii?Q?HNWTAuvs4InI5N38q/vSpLKO5W0EyEAifKYaLXIaa+jmWqS/gu4bPNTMzPHl?=
 =?us-ascii?Q?9WDu4qtb85++SlDVK4B1TqE3oRJ2RDwP9ofQcLZSZLXO/W42KL7Awwwo5mUb?=
 =?us-ascii?Q?FgSh5AAe54jmHdi0WnEt2IjbyHlReQczGD8SA+RbfnANVfGsPD9jo83sIlo7?=
 =?us-ascii?Q?piRVRnQl3Tj+aLRkn/uFZddyZChbQFnG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f087w+WqRw5+jAJ4RfYk8Cl0YoubYez7B+GvAEtnmfhipJcN41kB5UcDZQuC?=
 =?us-ascii?Q?mf6q8nT5boIwJ46R38rPL2jk8fx9C6HSOJdyUhqccoqmYdiTfn+9wJRF7Kfl?=
 =?us-ascii?Q?0036QRM4gnmL5VV7BeAcbScEiKnpiLCoDWs/EJ8F+1jWdkGm6GrFa7c6xNkU?=
 =?us-ascii?Q?L4WOHd3qzvZiSBWZxl5h34Ot1SbffZYB2zkPTjuag25WownPmIsoi4VRcYDb?=
 =?us-ascii?Q?wXlvPI2dnIkrAeiMS+ODW7ysuXYRkdwjcAOxfR8uWFEGhaiqEXkEUAvPKz9U?=
 =?us-ascii?Q?JyQBQJheMl0U9mWBw4IJ+AIkX77Q6FQljCo4ExkVhjX2e/GmUveXOfycNpkD?=
 =?us-ascii?Q?Fm+1L+cRKyJ2LZ+uknGPRQlBhjHI+TOnQCHbatCTg5ABMLH2fKOZWzw0u2oh?=
 =?us-ascii?Q?dLd/QfssdZt/1MjXanknusa46IMoYzCMHS6DD1VTGsKsM4w1wtxq19QvmifD?=
 =?us-ascii?Q?jyY9ORgI8amh+3xPD3HsJKzzxgH/hvZCxiPpD15of+DKDXq5M10E+fb+i2yg?=
 =?us-ascii?Q?lvUj9Shyi2roIB1QBVNWArloUHyIIy6Qtc6IPojgpvz4dzh2rc4ykBNOA7HA?=
 =?us-ascii?Q?busRokorTkEuBofUHQnHhxeXXYnAkFXF+St2OvCpUyiKzVUrPwJD6i6SedQU?=
 =?us-ascii?Q?NYvt+wq1KfkXUfBKzxBxS2BpcIieCQD8hvFUXJDi0zi8IFOhwCZKuZSaJSWj?=
 =?us-ascii?Q?F/xZI3sB0Ta+lKVVyIWEqGTjqA5/KX9V+3r5OIczA1e8X3HC5IvQNb6eGcNP?=
 =?us-ascii?Q?nt8eDDOc9YZ3e6pGsh7+xMCZuMEtJ3sRQLvZuIYyH9/aGW5gNOBtlEndeVPn?=
 =?us-ascii?Q?Vtr7u3ESYsgUQM4Jp9Bl013x/ShNMxxuc/QR2NdvTFAXd9U9/n77hnndmv11?=
 =?us-ascii?Q?F/fha6gUrCAqHq4HWTXWAdh3ZedizA8P7Px8Bkh4LEyTjVa4GmN/QuMFj4IE?=
 =?us-ascii?Q?6kPpPaqDlMnr+3YggWZ5Sv2w09KgmZB7k+OpcfsnM0/BbPhOsA02ZK7d2eah?=
 =?us-ascii?Q?aHqsokZuywRB5QtRTM+1kI6VuEhNrD76p1Ozcv9LwKJxDQ0n+en4POhSzZMD?=
 =?us-ascii?Q?u30+eLcsfEwZIW6cK5C4z29NMX6j0M90lOQ1HJcwdWr4xrFh9rDuHyHpXWBt?=
 =?us-ascii?Q?9HiSg+n6ARPQImTppJ+2hxOpq3JxvTerIinLbI+e9BwT8kFkKWKNiuQeJBkL?=
 =?us-ascii?Q?mBH+4EubFOyNBan3rg4YHF7HiV0MkQd4VUC3h5197e9fu9Zd9rdexQlaUs3S?=
 =?us-ascii?Q?qqiBO0Zh25un/xFGgkQ053TMEAYFzm5pXdEVN++p0XX0PAkkpvWr7xtpk+zc?=
 =?us-ascii?Q?xTuJp3tTO47O0H1xFDPPPbkoqa1OFU6nWlnIgmD9/xh9tpEC0Lhc1Q3AQoMC?=
 =?us-ascii?Q?a11Cm8q5y40EvzGzkBTtdXZXugkDEEdq0jFD4mNSEbmevrjXIIWlV8dz1pTh?=
 =?us-ascii?Q?K0096Aq8mF1uLFc+RCNK/YlXURuFp/OElvjIcKKYyiCajxGf46FBUpWfrnvr?=
 =?us-ascii?Q?d0SXzSjndciev5e2SgTPvCw43qUQJW4vxo9yASD/BMvDPksBLog/c9ujEJGp?=
 =?us-ascii?Q?X5vmvXAaPacWHwEC+uPVNOI9a3S9sWdWSyRN6xeTf59Ht6pHgjnctpGK/Nlz?=
 =?us-ascii?Q?JO0aN3mHxAgR4v5VMP0LE+M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bafba710-218e-490d-cc59-08de1af83bd8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 16:44:19.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIE6+46HWHhL51hdgbyQ2HhbJ0mPeG+aNSNhmgPiHBRseXVyz9hN4roa/XhgK47qIj6kEJZu/dh84obHFUweLwizL525s7OMV+kitZRKSFtN3wT+FS5GAXgKLoD1XAQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

On Sun, Nov 02, 2025 at 10:29:32AM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:31AM -0700, Niranjana Vishwanathapura wrote:
>> Trigger multi-queue context cleanup upon CGP context error
>> notification from GuC.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>>  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
>>  drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
>>  5 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 3e9fbed9cda6..8af3691626bf 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -142,6 +142,7 @@ enum xe_guc_action {
>>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
>>  	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>>  	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
>>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 48b5006eb080..d0e19af0b4d2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1574,6 +1574,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>>  		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
>>  		break;
>> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR:
>> +		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
>> +								  adj_len);
>> +		break;
>>  	default:
>>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>  	}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 87c13feb2cef..605352145d76 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -48,6 +48,8 @@
>>  #include "xe_vm.h"
>>  #include "xe_bo.h"
>>
>> +#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>> +
>>  static struct xe_guc *
>>  exec_queue_to_guc(struct xe_exec_queue *q)
>>  {
>> @@ -3001,6 +3003,37 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>  	return 0;
>>  }
>>
>> +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>> +						u32 len)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_exec_queue *q;
>> +	u32 guc_id = msg[2];
>> +
>> +	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
>> +		drm_err(&xe->drm, "Invalid length %u", len);
>> +		return -EPROTO;
>> +	}
>> +
>> +	q = g2h_exec_queue_lookup(guc, guc_id);
>> +	if (unlikely(!q))
>> +		return -EPROTO;
>> +
>> +	xe_gt_dbg(gt,
>> +		  "CGP context error: region=%s err=0x%x, context=0x%x LRCA=0x%x:0x%x SgId=0x%x",
>> +		  msg[0] & 1 ? "uc" : "kmd", msg[1], msg[2], msg[4], msg[3], msg[5]);
>> +
>> +	trace_xe_exec_queue_cgp_context_error(q);
>> +
>> +	/* Treat the same as engine reset */
>> +	set_exec_queue_reset(q);
>> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>
>I don't think you need the exec_queue_check_timeout check.
>

The check here is same as in other guc error handlers like
xe_guc_exec_queue_reset_handler() and xe_guc_exec_queue_memory_cat_error_handler().
Hence the reason to keep it here also. Doesn't exec_queue_check_timeout()
mean TDR is already underway?

Niranjana

>Otherwise LGTM.
>
>Matt
>
>> +		xe_guc_exec_queue_trigger_cleanup(q);
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
>>   * @guc: guc
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index abfa94bce391..01b013a90b1b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -35,6 +35,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>  int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>> +						u32 len);
>>
>>  struct xe_guc_submit_exec_queue_snapshot *
>>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> index 79a97b086cb2..c9d0748dae9d 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -172,6 +172,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
>>  	     TP_ARGS(q)
>>  );
>>
>> +DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
>> +	     TP_PROTO(struct xe_exec_queue *q),
>> +	     TP_ARGS(q)
>> +);
>> +
>>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>>  	     TP_PROTO(struct xe_exec_queue *q),
>>  	     TP_ARGS(q)
>> --
>> 2.43.0
>>
