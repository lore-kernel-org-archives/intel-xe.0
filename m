Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB094C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA6112F7F;
	Tue,  6 Feb 2024 23:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aam2PjMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991CC112F7F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707263521; x=1738799521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5zgzOkDfYUHU+MYc1X2t+2NvUTRJbEUlfx4sDWXjmG4=;
 b=Aam2PjMl05UKzJ8mV1Ywh7zsUmtH12MWQ8a7dUq4/iF6FTsi4E5cp71L
 kmEPp9hBSqctY9XiseuZSNQIk7tBOVpDzQcmz7jcBZwqeE1d3oDa6oCbq
 eYFAcW8CmlavRnFwOb4HPXnQEvjD66+JiwuigzCMoe+q5kSIq6qsNC+U+
 biisL1VB1/sJYRoy9a75oJ3tzMKwIjIZ62H7IFFoKhddt/HaDFt+ReXP+
 +67+LBOOQoxpjWDRsAwY/bYgaYBBl5OwF9V/ero9ZWCVhOsyEyvnosC3y
 z+3YOjY6YuYRfmFk3qZ2Qxaeo/ii9d49RXQpb8GALihYQTnnOUxL7k/uQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11454193"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11454193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1472808"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 15:51:55 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 15:51:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 15:51:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 15:51:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdUGZ+Ef6sTM5m6S+tjmRbj13AHx29ydBw2QxJ40s2b5xUjW2jBmIUtwDpatGDpxEn0xd9E5DElBucdhQU5pyp9/lJ4UzVz6YeQF4Y/U/CavN3xzuBFD96k5kzwR4CjOXzdQuRUACktLUq5NyEO/gi1e/ynBV6Zv15BZnl1uemtwSOnXq9MbPCIXVd7IPgm//Jb2EA+THAuhIWpwfQbcK46Tek2m+61xEA2t6Pb+gRtSKXD9KD9LudN2Ybrb6hHISFDH9ZDl1Qv6+vs9BmW4jyTpVcAUv4tbsLhP2WtSybaUjdVXzuvy4Mz6s5X6C6zfEuE4rMmysmPBgjv2kXoKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1sl6P7um//xLPlIahYOnLdIhjgjXF66Bh/EptEKFTQ=;
 b=R0hHNgcnLBi342deS7fe//VGhe/it1peOpKRXGhOMSaSynBphAeucYlbSYEikwCL+j15Htl2kWZC97TQHAhDRJU31G4Sk1YNhuKl26g4lPyXchoA9WAjJWYhhtTbcORMjCSgp7aZRrEQZk7bt0VNrGsD4TW+Gq2CXC1lsyqes4lZXzwhCnO3AoCl2MpcTSKUKFdGTcesXo6Im5enpbcZ6dJR6cip/Q0GV6O44RUw5yUkIofDLPVxJtRk6kwbKHh009HhH7yL4S4xz8xk/Gnl++H5iI1OFoRwoGJIbszY9rKb82vdi1AW/zcOuV4YGORizWYfr9rP6upGK1EROQZhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 23:51:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 23:51:52 +0000
Date: Tue, 6 Feb 2024 15:51:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 15/17] drm/xe/oa/uapi: OA buffer mmap
Message-ID: <ZcLGCddGTHAt9kFy@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-16-ashutosh.dixit@intel.com>
 <ZYZIUsd5Mf2BgfyY@unerlige-ril>
 <85r0icbsx1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85r0icbsx1.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f304ce-1b3b-4330-4fa2-08dc276e977b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1AbKwpvF2m4iMJcmG7sjYyn0Gr3uvbXZm4nl7GPvARZyx9IsQ/EjDEJSryfv3eW+NSXFoKoAwt97Kv2R5550EGkoNyMNz78f/66S+u449jfqDjx7t9GwpEqtPx2srgCQKMKqDt5UaBk4UjwsmVWi2P075BzP7KSgVV82CXR4kZLw/nnYKegxuxjjRAAXhLKwxw830IfS3Hg1fbL89mfNQvU44vhQEv8uH9Bk8sjc7YnrhQErdpnOjtG6LohE3bu7cvqvI7p6vdZ9f+bJuuZOtM2yELqPSvi/GdVMcizTsu3WMf33dCeF894KpcXNHf3y8EOcKw5sqIMFHhMyDVXiJG0hZfs6mkl21RLpXR2iKcO9EnTvloqJ1ayHdDTOxntVgnkEGWv/j2iXTzpy3CJqAZQsIqAtuS8xzJGZQuzeZKS6TWIkXKGg/rlzGwe8Z1jm4NGeAJ78rhBGH4+JJSz9DULnb2xK+CBzKmVmLat92JlbcWSDz9lEv+G8j9LJFUESrOLxFc9yOiBtb7N+DhG5PgulT9LEaiKf9VSj8HF+YNRKKscAgFRTiiKN5NHgFKk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(33716001)(41300700001)(86362001)(4326008)(8936002)(8676002)(6862004)(5660300002)(6486002)(478600001)(6506007)(6512007)(9686003)(6666004)(26005)(316002)(66556008)(66946007)(66476007)(6636002)(83380400001)(82960400001)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUlmZjl1MVRjWUswemxGTFAxaHh5QVN0Tk5wZVE1dUJaMmpmUkxmRXVMbDJV?=
 =?utf-8?B?TDVXdnV6UVNjUXJpeTJicFVIdStrbEpuUEVJKzRXTUhtc3I4S3lBTmRTdVQ5?=
 =?utf-8?B?RkUzakVGWEJRaWdFd2FJbEFrM0NocWl4VTk4a2xwcHROTk1Ydk5HZUpxUGtZ?=
 =?utf-8?B?cEZNRGROZWJrVFJTejZ3T0x0MG5zamFrcFA4S1pzSCtyZ0lNYnlvNFIyZXBE?=
 =?utf-8?B?dzF0WFNlblRtOWp4aE0za0FDcmt0Y1hXWnlhVWZoME1IOEhNY0h0alM0bnQz?=
 =?utf-8?B?TTJRM1BocGhzRlN3czhtL3dleFhIb3g1c0RHTStqa0tkbUQwY3VGanZ3RE5L?=
 =?utf-8?B?aklwU0x6bzFwbTZIQkRwZ3I3bUx2MndzQXZqeHRrWU82N0NOTkV3T3R3MGk2?=
 =?utf-8?B?MXhsYlB0VS9CYlUrRlZJYXkxeG83K2E0cjR2WUZDUEYrbnNhdWVnNUxqM0Vw?=
 =?utf-8?B?UXc4VEFUekwxaTdvUEZlOW1QejNTc29DZllrUzB3UlM2N0NNWlJNYTIzOW11?=
 =?utf-8?B?eW5KV3BIUHpDLzBSUmxnSlo4S0xXM25YbUFSZ1BSVTFiVUlRQkRCTDdjODRE?=
 =?utf-8?B?VlQ3OVJySUFoRFhoZzlIeU1saUpGNVVBNGNwbWJQK2szaktPakVhcWRoME16?=
 =?utf-8?B?czgycUtib05nMlkvWFFDZVhTVy9JdkJveDg2c3ZySnIyRkdzazAzd1lXL2p6?=
 =?utf-8?B?MGt6dnpLWkVyc0FZWFkzY3lSZk9GMnhoeFptTWM3ZllsakxRWGdNMzk5aW51?=
 =?utf-8?B?am5tekVsNWFvcnFheVl0T3BxeWk2Q3BoTGZNOUZ1RCsrRGxXYUZrZlVXNmZR?=
 =?utf-8?B?SFg3QjBIdGdTYStvTmRKQjZoMmErRmFqenlHdEd5WDNNZGM0NWR3aEJpaldw?=
 =?utf-8?B?VVVqMmhvOWpPT1RzNUdyK3drQm1LVUIrbmRESkU2ZzVsUi81eG15OUY5WXRD?=
 =?utf-8?B?SEYvSmlLYzNUUjdjOXRxRkMzN2JrZi9maEtFdVMxcmxVd1FOL2puUmRGVVV4?=
 =?utf-8?B?blQ2U1FCSWVRLzMwR21qMkR5MjY3MDJ5aWg5aGVVdXMrcE1nTWZvQ1dVZEk1?=
 =?utf-8?B?VkV4WUZqSlE4S3NaeXlNV25TRnRUZ28xMUsxZ1d6NThqVGN4bjlTRWlIaUds?=
 =?utf-8?B?amxsaVd6amRsVzZoSWJlRHRwblhOLys0UHY4cy9abWYyZlNib2xNenhRVi8v?=
 =?utf-8?B?aEo0K2l1aGd2R29rRWpKS3ZvYU1rWFdYMHlOenJvM0thRmgzT2p4bEt1eU5v?=
 =?utf-8?B?UzZCYXkwZlVNSzlsV2dWUGhPNnJJbkZwY1dDbTY0YzIyMllpS2VUVGkvSVV1?=
 =?utf-8?B?cjZZS2Y0bXdZWjZlNmZBWGJheUw2MmtpeTZvTnN0RTZpczZBWjY3VDEyUU5K?=
 =?utf-8?B?b1JjTDBTL2JJQ083TjR5UzFqLzlCaEs2ZUtYenV3M3RwazNBNkRHeS9ITCsx?=
 =?utf-8?B?QlZvRm9xSnh1ZU9YaWNOZGtCclFMcUJUdVYySUJtSFNUaHNPLzBpSk1XOHFJ?=
 =?utf-8?B?TlBBcklTNG1saVVJR21qNm5HRXVQWHhnMHVaNmlyK2ZiTTkxWS8xRXVTV0Vt?=
 =?utf-8?B?dm9WRFZwOUJsRlpsN1Q2TnNQbEcvd1RJM29PT1pLa3Fod2p2K1NoUzduSHdC?=
 =?utf-8?B?MXB2Tzd4R25wTUV6NkxnYmtMbG1pTXpOay9oVEloVSt6WWhOT290UWJUVE9Q?=
 =?utf-8?B?SW9VZjkyK2ZNL1cwUG0zYnp5N0F1OW9md21KRnZtamlPTTltQW5QUzY0K3l5?=
 =?utf-8?B?NmdtbmZiRmJ2RUo5aUdMRlgvQ2NYZmFqNGhmZ1oycG9QQ2VGWUZxVDBJMFJE?=
 =?utf-8?B?dzN5dGJZREo2S0U1NmVnaitWb0tncEwwTmdCUmJVeFY0TElPcWJURlQvT3pu?=
 =?utf-8?B?TFlRNExsZ1dVU1VKS3BaTnNzL0hRYWUvTDh0UzZXTzl3TCtLN1RFd0d6UWxY?=
 =?utf-8?B?M3VXbFFEeEI5MWsyZHorR2kvU2djVzhaODNVS1hKVFNXREkwOGhwbmpMTENO?=
 =?utf-8?B?QWlwbHQyL0hFcWlYcHZXT1U2S2pIZXpCcXo0Wjl3MTVVNzJEVS9PaFlSU1k0?=
 =?utf-8?B?QVJvTmN6Wm0zcUVoTzJIVEp5VmdOTWNRdWNNZ0RYZm9CTVhWcDl1T2c4d1Yw?=
 =?utf-8?B?dEdWZEs1RmZNemdTbmVSSUc4blVuWVVJYmNqRFhCVkRiYUdzNkJvT21NUkpM?=
 =?utf-8?Q?yqJbSJjvX1jah/Ov9ezw5JA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f304ce-1b3b-4330-4fa2-08dc276e977b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 23:51:52.3323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4d4iaEpoEX+3Se0liB7YvX9Xbk7r8ANqxnQoPuXUJKBCHE2OJf4W0JSfk4MunLqEzob3iZh0rAzadsCJlNiUNtk5z2/TKb/i0OJBAbePFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

On Fri, Jan 19, 2024 at 07:11:22PM -0800, Dixit, Ashutosh wrote:
>On Fri, 22 Dec 2023 18:39:14 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Thu, Dec 07, 2023 at 10:43:27PM -0800, Ashutosh Dixit wrote:
>> > Allow the OA buffer to be mmap'd to userspace. This is needed for the MMIO
>> > trigger use case. Even otherwise, with whitelisted OA head/tail ptr
>> > registers, userspace can receive/interpret OA data from the mmap'd buffer
>> > without issuing read()'s on the OA stream fd.
>> >
>> > Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_oa.c | 53 ++++++++++++++++++++++++++++++++++++++
>> > 1 file changed, 53 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > index 42f32d4359f2c..97779cbb83ee8 100644
>> > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > @@ -898,6 +898,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
>> >		return PTR_ERR(bo);
>> >
>> >	stream->oa_buffer.bo = bo;
>> > +	/* mmap implementation requires OA buffer to be in system memory */
>> > +	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>> >	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>> >	return 0;
>> > }
>> > @@ -1174,6 +1176,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>> >	struct xe_oa_stream *stream = file->private_data;
>> >	struct xe_gt *gt = stream->gt;
>> >
>> > +	/* Zap mmap's */
>> > +	unmap_mapping_range(file->f_mapping, 0, -1, 1);
>> > +
>> >	mutex_lock(&gt->oa.gt_lock);
>> >	xe_oa_destroy_locked(stream);
>> >	mutex_unlock(&gt->oa.gt_lock);
>> > @@ -1184,6 +1189,53 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>> >	return 0;
>> > }
>> >
>> > +static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>> > +{
>> > +	struct xe_oa_stream *stream = file->private_data;
>> > +	struct xe_bo *bo = stream->oa_buffer.bo;
>> > +	unsigned long start = vma->vm_start;
>> > +	int i, ret;
>> > +
>> > +	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > +		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>> > +		return -EACCES;
>> > +	}
>> > +
>> > +	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>> > +	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
>> > +		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
>> > +		return -EINVAL;
>> > +	}
>> > +
>> > +	/* Only support VM_READ, enforce MAP_PRIVATE by checking for VM_MAYSHARE */
>> > +	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
>> > +		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
>> > +		return -EINVAL;
>> > +	}
>> > +
>> > +	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
>> > +
>> > +	/*
>> > +	 * If the privileged parent forks and child drops root privilege, we do not want
>> > +	 * the child to retain access to the mapped OA buffer. Explicitly set VM_DONTCOPY
>> > +	 * to avoid such cases.
>> > +	 */
>> > +	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY);
>>
>> Would help to just use the vm_flags_mod where you can specify both set and
>> clear flags.
>
>Yes, good idea, done.
>
>>
>> And then just to be paranoid about it, maybe add an assert to check that
>> the flags applied correctly.
>
>Don't think this is needed, code in vm_flags_mod is pretty clear. So
>skipping this.
>
>> Assuming you ran the existing mmap tests for this.
>
>Yes, existing IGT's have been ported to Xe.
>
>> I think we should also add an mremap case. I think that should fail with
>> EINVAL since this is a private mapping.
>
>Ah, mremap description says "mremap() expands (or shrinks) an existing
>memory mapping" so the relevant flag seems to be VM_DONTEXPAND rather than
>VM_SHARED/VM_MAYSHARE. I will see about adding a mremap test.
>
>>
>> > +
>> > +	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
>> > +		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
>> > +	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
>> > +		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
>> > +				      PAGE_SIZE, vma->vm_page_prot);
>>
>> vma->vm_page_prot is set to the state of vm_flags that existed at the
>> mmap_region() level. We have modified those flags here and we must update
>> the vma_page_prot with vm_get_page_prot(vma->vm_flags).
>
>If we need to do this I think the call to use would be
>vma_set_page_prot(). But, looking at vm_get_page_prot, vm_flags which
>affect vma->vm_page_prot are (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED). And note
>that in this function we have not modified any of these, if
>(VM_WRITE|VM_EXEC|VM_SHARED) is set, we just return error
>(vma->vm_page_prot seems to determine what we write to the PTE's and the
>flags we are modifying here are more like "software" vm_flags).
>
>Also we would see some test failures if we didn't do this correctly, and we
>are not seeing test failures.
>
>So I am a little torn about this, vma_set_page_prot() doesn't seem to be
>really needed, but may be nice to have, but it is also rarely used in the
>kernel.

I think I misread this earlier. I agree with your description, so I am 
okay to leave it as is.

Thanks,
Umesh
>
>I am copying Thomas and let's see what he thinks. I'm skipping adding this
>for now but if Thomas or you say we should add it, I'll go ahead add it.
>
>Thanks.
>--
>Ashutosh
