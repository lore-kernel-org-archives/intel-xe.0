Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E811EDEBF9
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91D810E8ED;
	Tue,  3 Mar 2026 22:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTbz+x2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D50110E8ED
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772577758; x=1804113758;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wXmQz6a0ctm0aNra3y6u4sNoRoF9lOFavccPrnRJN3I=;
 b=RTbz+x2vz8Zd6wuuCEgiMmassQGrZ0bxPSlP+u9gfyJjh52vAuP2mvgo
 5DdQyGdacrPg1YJTa69gkGRUxpcZFsUApOt8i+21weEG+A6fKMvYOZSoN
 mW6qnxjXH80CuO6w+PRWRMHDnlAg1AD9UgXcp7iSqZirahvPwg+QYtoGl
 tgtmcQ5+NwqYeYNuNnQeIXPEtxqGF1EarLRsVOv4dPK11n4+47+CcxUJ4
 H6jcZWrr7TTlfe0B3nwrcPPwQdQQ6x1cQU8C4KkcC9m4IhPQUyioWXGhF
 k0SdVSxn2qZ9oEguVkBly5Nb46AjXr8Kvzen+wb526hLPgBI/tyCsej3Z g==;
X-CSE-ConnectionGUID: SKUNBt8BSZOcN+vqS8TCrQ==
X-CSE-MsgGUID: tP2iqqkeQZ2o+RS1FpG88Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73679659"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73679659"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:42:37 -0800
X-CSE-ConnectionGUID: 47SN5NxzT36voFEuvka3oQ==
X-CSE-MsgGUID: o12vhhidRjKg0cvpHEnKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217304446"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:42:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:42:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 14:42:36 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp9p1F+dPKQPdEzV8TpdKsU4mfA1OZtumd4o1uRFX4+zSw6mQsPr2/gP4N6x2+uWBUWaLoPnWWkmyV98tOokTvo59+hq3ZDBC4gOac0GhBxJ+zlST+SkVuiT4YiXO9tdng4jpY4+BvRyOO/1inr6Q+g2CxkLkDZvEOyB4r1LFsGNC0KOP1pLm181PzWrHghRew+YUdhC5bzYtph45pk9YZFYYTKYuZJTqUkW2OzIXrCsuy/1CNakvR8WJLaRcQAjM4bddeccj021CX2/XpbXvgM6V9Oa7nD5N0qllEIz5PDyOTLrpWv6MJHEsvwGlC/fOgbG7El8PyD3s3FIfiNKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YWQVH2CBfl8yaKzy7wma6ARK90IqV2v2mi1KPocEuA=;
 b=HfWXZjGXMGtHQfi0USgvRPbndoTWDl90G+pS3VTlEHoYwIAOVMVOkpaR85FnKQnatFpppQvBG6YJNZnNKtqOy6yzdamp0/rHFvVQHtreOWNt7IVAtBuTH0TssQYVthe2UDl4H4rn1u1spFTqi9QvwMahHwpc2u6klmb2buN+pL1SLkZoe4YvzS8tTfRuXgUJtNqgEGo6SY6/edojRgzAGHRMANJDNOB5TC1wBhT6aujHgpr90XQldP2OeBpLluSu1+EQHrIj1CQJ0Ls9jik0ih6o+lgeqaOnB7nCL7Tgip+NajTKOlhhEMdiX4wZbnAimymrNRAxxss81pC7NrieJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 22:42:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:42:34 +0000
Date: Tue, 3 Mar 2026 14:42:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Message-ID: <aadj2K8I7Bom1vXJ@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-4-matthew.brost@intel.com>
 <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
 <aaX65nBqdWvXGmZF@lstrano-desk.jf.intel.com>
 <fd39339c6fc8461bb32fa01454754c58bb88f835.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd39339c6fc8461bb32fa01454754c58bb88f835.camel@intel.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 24965cfa-4e90-4337-55f1-08de79762992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: zQVJlumXyzFYqJgW1msuoJJi4s/YY6Vm5HLv1HvZv7xyrQJbkyaFcnaCwDQfMb7HDmAPNcQJzjjS6JspcAB1xgE89k+EBG2zba3sPtZgodL7V/HdEx/CxAbzt5mYkJPR0EtgAiFbxJEnFmaf+noMpR9/yeR1OA1znc9Keicg0EeJAeSDbzULdfU3aJ5k6gDCNi2cILe5NeynSysTce53QxlfIIL7cM3Y5T2QfZSwyvq2NlppRaSjmZCp6lOjkT9J32y5iwvwb7tUC2klFDmK9hl/SG8MwsLcC9PplAWPRQYiMcJvaqm4qr6xx4NxlDISUaLojRqfJeDqzPy8rJHewWcDBMvKljEFmCN1L3DGRXz9DIENrxAzUJM+7KJaXXuNMqKqrWMtkJa3grL+AXhzI62Ac/K4S3N+UJI+vFhTCkule19cNugKSa7TZULQqITOEVoJw8iBFaIgo1YxmALXEBWhB3XvTr47Xo+/FwoWXQelZPebCokXb9WBGoduA8HOtjnu83Al7D5YJ5MavCQTfRJCqkf6sa/PGaxGesVo4ML7mFYhKL/NKI8ujco2uFqlYlmXjNkCiGg/2eKd91ErNwzdGI094fNwjY7sovhPCwZ2wuc3qasOixyqoxHRe8nRNL6znxVDVOoksU6Bcr5Wjh6gB7MwkZGoBKg1CVe003vhFf3+mDu2t43frHN4nq15W3wh2UrKFYcf+RkCwXG6bbA2BwCGnSwMIkCeVUR+c7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk0zbTg3cHRhQWJBcnVJQU84M01Zdy9LUXU1YjVkUzVrMVJxVzdjSDBCN0R1?=
 =?utf-8?B?S3hYbU9iWVRPUkNGN0dWejUrdlZ1elhQOW51bUhWZTROdXgrQ092cCtDTC9F?=
 =?utf-8?B?d2VSQjNuNVVVTDRHUEFtWFRxR1k5UVdqVDRxczNtTk1NWHpxY2czUUdiVmt2?=
 =?utf-8?B?TnVwRXFuSGozckNCelNiZGFnT1IrdnE5Q3ZUZ21WMWw0Tm4wdEh3Y3d0U2lj?=
 =?utf-8?B?dWtDYTF3NGxqUWxGVklUVGcvWEJKNFFqN1hEbzJ4akQ0blFvaXNseFRGSnFv?=
 =?utf-8?B?NHBoenVOS01adlRoYUJPU2ZVT1ZUY0x2aWl2SUpidEdnVDlqbHlWditwYVZH?=
 =?utf-8?B?S1pzT3F5VEtqQzhLaGl4QVVWNm5YekpDMWYxWElBVkRIRWlQdkNtN0p0S0g4?=
 =?utf-8?B?UGc2clhYNEJEOFU0bG5sK2JKZk9nbjI3L1ZHYXkrbUhBdHBHTTVELzRkK0NL?=
 =?utf-8?B?Y0l2eEpWSk9WU3R1Ri96WWJteXdVTm9pTFczL3JCMDlxdHJ4YlU5QWxzVmRL?=
 =?utf-8?B?N3QrZnVDaVR2ZlQwM0hHWkxiSEVMUy9ablhhZ05kdEVmT1VtV1ludVBTQ01l?=
 =?utf-8?B?NFhzRnVwSkdJQkIvcWpQUEdFVVNYWWtqZWpoRVZNQWV6bjBIaUxJZGZ3QnpJ?=
 =?utf-8?B?WnhwWkVjTkpjWWNWZFhlL0FacjdoVXpLRHJPUzk3WDB5b1BqSzRtTjhuR3Ny?=
 =?utf-8?B?VW5QeWFCSTJoWWVLMm45QllCdzJHLzAwYVNHWjFLUGxoTVl3dzdiS3lRV28x?=
 =?utf-8?B?Ni95WUx5RjdmL2xWNWNFbmxpUGZSR0o2NDhTOGVzMGprTnJDVm12MHJtRDZV?=
 =?utf-8?B?SFlKRExFeXJIc01PS29YZUFreTJJRExqRzgwdCtaQUN3eEZOTUFFeXJsTkQ1?=
 =?utf-8?B?Q3VmR2hXNzUyNGUveVVSc0huL3lLWWRrT04yKzdoUmJReEFsS29NaEtHRVNZ?=
 =?utf-8?B?MXZyS201QVk1OVAyb0lPQ0FTY3ducUZqOUtLS3VyTTg3OGdDTXQzMzJWeDd4?=
 =?utf-8?B?cXJoT0JtUFpOaVV6R1V3bmhmM2k5bTRMU2p0YUJmWm5JdUowODl5MW9JUzJF?=
 =?utf-8?B?S29kWlpxR25KMStnTCtYNSszTzdEd01CNjNzZlVQU2RDVGhzMXdhdHo3WkxL?=
 =?utf-8?B?aG1EM1I4NkU1SUFuelR1cTJHcjVxdko4dnVVQ1RRN3ljZ1FYeEMzS0hid3BD?=
 =?utf-8?B?ZTh2eVV6MWRvUUJ1WXRycjZER1FveFludnhFMWhsZFB6MGVla0t1YWZObFNO?=
 =?utf-8?B?UExsSGxEaXJjRjFJSis5TzhPaUQwTk0reXMxMExiTVMvbGVLVy82STJQelRT?=
 =?utf-8?B?UUcwTVFDZ1ExR0dwVnA3SWxxRHlTcVQ1MUdaVzltODF1UUcxTnZvZi95VVBi?=
 =?utf-8?B?ajRkWW5hUHlRME5pN2pSMmZqd1NYQ0xVNWRlbEJ6L250NEJhaHdUbEFEUE1s?=
 =?utf-8?B?VGZ2azU0Zm5idVpsZkpVMXJ1N2hqY0k0MUEzQ0NwN09wUE5XdTgzS2xTNml2?=
 =?utf-8?B?S215ZDV1aUhod2tMZ3o2amxROUxqenJ1ZG1sWXVjbC93VHhyemZGQlJOTUY0?=
 =?utf-8?B?K3hMSm9oL0hyTDkxV2ROdnBQME5ISERhTEx4T2hmbVdVZUNuck96TURHMDR5?=
 =?utf-8?B?dzZXaytvVnRBdmpmUmQ4TmpvZmNRNmxlb29RV2NyL29wQ011NHBsREZGYVAz?=
 =?utf-8?B?bTRhcGtQby9pSnd6SWowd0VPcFpFcnRPRGw5N1ppSU9jMU00SWROSDBDMDdG?=
 =?utf-8?B?aXZ5ZFgrV1RTYXRIMUZHQ1g5Y3ByazZPRHE0Q0dqdTU2TkJFRlJEbXJMNkxy?=
 =?utf-8?B?Z0VzZ1lQNkdwWFk3N0I1VVpsZmwzUFJpQ3U5bjdUVjN4bWM2TVhGc3gzSmVy?=
 =?utf-8?B?UE9Icng3dDFWb0QxKy9CWmdVUFFTOUNXeEdrL3VnRFYrZTA0ME9xK0xkWWow?=
 =?utf-8?B?Vnc1YXNudXBHVkZqZmJwdmgzeUFUMTg0OFZLZkU1ZFF4UmM0UXRNbGliRFJy?=
 =?utf-8?B?bnZ4ZEFGcnRjSlpUZ25FV052UUlRaWRudDJTNFB5NGl4NnllMDlUbWE5TWh5?=
 =?utf-8?B?VmZhUExFOWRQejZnUGY2aTl1YnJpNXRnMWtHYnFnSXQvbWIraSsxVXFuSjg3?=
 =?utf-8?B?aUdBOW5SSGF5K3lFSVdnWmdLMlN5K0JqOXdkMnFUOUo4aW1FUnVLTWhCbzcr?=
 =?utf-8?B?WnBvR2x2NG1sWnUwSlRzSWZYYmVxdzY0K3cvaHdJRTBwZUtSUEFObWN5SWdB?=
 =?utf-8?B?Q1g2anFiTTU0dXFHR3IvSW96UjVTL2VnUEtYR2VSdGdtaFRzTHNDK1VPY3dI?=
 =?utf-8?B?WjlaK3FsREJuQ0R4TTdYM0ZuZjhqSTZ4N0MwMldETkVZS2pFbkdmcHhIM3Zy?=
 =?utf-8?Q?Q+V98XI2oYaeVVW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24965cfa-4e90-4337-55f1-08de79762992
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:42:34.5535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvRaO4MbsBayTsFL+YUUXKZzQlt/oLne0x7Q1ldPjpsXNro4JVKL2O4LOL6GNUJCtreJLzomTtCGVnVwubaFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

On Tue, Mar 03, 2026 at 02:26:56PM -0700, Summers, Stuart wrote:
> On Mon, 2026-03-02 at 13:02 -0800, Matthew Brost wrote:
> > > On Mon, Mar 02, 2026 at 01:50:11PM -0700, Summers, Stuart wrote:
> > > > > On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > > > > > > We already maintain a job count for each exec queue, so
> > > > > > > simplify > > > the
> > > > > > > idle
> > > > > > > check to rely on the job count rather than the LRC state.
> > > > > > > This
> > > > > > > decouples
> > > > > > > exec queues from LRC-based backends and avoids
> > > > > > > unnecessarily > > > coupling
> > > > > > > idle
> > > > > > > detection to backend-specific implementation details.
> > > > > > > 
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 15 +--------------
> > > > > > >  1 file changed, 1 insertion(+), 14 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > index 2d0e73a6a6ee..b3f700a9d425 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > @@ -1382,20 +1382,7 @@ bool xe_exec_queue_is_lr(struct > >
> > > > > > > > xe_exec_queue
> > > > > > > *q)
> > > > > > >   */
> > > > > > >  bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> > > > > > >  {
> > > > > > > -       if (xe_exec_queue_is_parallel(q)) {
> > > > > > > -               int i;
> > > > > > > -
> > > > > > > -               for (i = 0; i < q->width; ++i) {
> > > > > > > -                       if (xe_lrc_seqno(q->lrc[i]) !=
> > > > > > > -                           q->lrc[i]->fence_ctx.next_seqno
> > > > > > > - 1)
> > > > > > > -                               return false;
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               return true;
> > > > > > > -       }
> > > > > > > -
> > > > > > > -       return xe_lrc_seqno(q->lrc[0]) ==
> > > > > > > -               q->lrc[0]->fence_ctx.next_seqno - 1;
> > > > > > > +       return !atomic_read(&q->job_cnt);
> > > > > 
> > > > > Still looking through the series, so might be handled
> > > > > elsewhere, > > but
> > > > > just looking at this patch alone, I'm a little worried this
> > > > > will > > cause
> > > > > unexpected issues in the exec queue cleanup. This function > >
> > > > > currently
> > > > > ensures that the job is idle from the hardware level. The
> > > > > change > > you
> > > 
> > > The current check is actually incorrect if, for example, a queue is
> > > reset and the LRC head != tail. However, I believe the only places
> > > we
> > > use xe_exec_queue_is_idle are cases where a queue hasn’t been
> > > reset, > so
> > > it happens to work in practice. It’s also just an advisory check,
> > > so
> > > nothing bad happens if it incorrectly reports “not idle".
> 
> So reset case aside (which not taking into consideration anything you
> said below :) I'd consider a bug here), it does give a false sense of
> things being actually idle on the hardware IMO that might be extended
> out to other areas without realizing in the future. I agree that the
> current use cases match what you said.
> 

Yes, so I would say this patch is actually improving things and opening
up this function to other possible use cases.

> > > 
> > > > > make here moves that to a software level check. And this is
> > > > > getting
> > > > > decremented and checked before we tear down the exec queue. So
> > > > > presumably, GuC and the command streamer could still be doing >
> > > > > > something
> > > > > here and we're falsely telling other parts of the driver that
> > > > > rely > > on
> > > > > the engine to really be idle to trust us here.
> > > > > 
> > > 
> > > See above for part of the explanation, but the other part involves
> > > reference counting and fence signaling. A job can only have its
> > > last
> > > reference dropped when its fence is signaled.
> > > 
> > > A fence can only signal under the following conditions:
> > > 
> > > - Its seqno is incremented via ring instructions (which corresponds
> > > > to
> > >   the LRC head == tail if it’s the last job on the queue).
> 
> Right, so technically I guess we could have a hardware hang after the
> sequence number was written since that isn't the last instruction
> there, but seems very unlikely. And if we did hit that case, the reset
> handler would cover that.
> 
> Maybe this should be obvious... but just so I'm not missing something
> here..
> 
> So I think the signaling here we're talking about is via the
> MI_USER_INT in:
> xe_hw_engine_handle_irq -> xe_hw_fence_rq_run

This is where fences are signaled or if we time them out in
guc_exec_queue_timedout_job via xe_sched_job_set_error.

> 
> And that dependency you're talking about is here (xe_exec, although I
> know there are a few in xe_migrate, xe_pt, etc)?
>         /* Wait behind rebinds */
>         if (!xe_vm_in_lr_mode(vm)) {
>                 err = xe_sched_job_add_deps(job,
>                                             xe_vm_resv(vm),
>                                             DMA_RESV_USAGE_KERNEL);
>                 if (err)
>                         goto err_put_job;
>         }
> 
> What is the expectation for LR jobs?
> 

This is completely unrelated but in dma-fence mode (!xe_vm_in_lr_mode)
we can't fault the device so we issue rebinds in the current exec
IOCTL for anything that moved since the last exec IOCTL - this ordering
exec IOCTL submission behind moving memory back into place + rebinding
it.

LR mode we either:
 - Rebind in preempt rebind worker
 - Let the device take a page fault and rebind

Because of this we don't even take the dma-resv lock for LR VMs in the
exec IOCTL.

Matt 

> Thanks,
> Stuart
> 
> > > - We time out jobs on the queue and signal their fences in
> > > software. > We
> > >   only signal fences in software once the queue has been kicked off
> > > > the
> > >   hardware (i.e., scheduling-disable H2G triggers a G2H response).
> > > 
> > > > > For reference, I'm looking at xe_sched_job_destroy() where we
> > > > > do > > the
> > > > > decrement and then the exec queue put.
> > > > > 
> > > > > So my question is, how are we guaranteeing that hardware is
> > > > > indeed > > idle
> > > > > after this change? Are we moving the sequence number check > >
> > > > > somewhere
> > > > > else?
> > > > > 
> > > 
> > > I think above explains this.
> > > 
> > > Matt
> > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > >  }
> > > > > > >  
> > > > > > >  /**
> > > > > 
> 
