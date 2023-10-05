Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDAEE92725
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A8B10E0E6;
	Thu,  5 Oct 2023 18:27:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D92810E488
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696530443; x=1728066443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vFs7u7NhLHOs1nRpIP0G2I+JjoU/+8AcTg/uFjfD1dQ=;
 b=WzDKM2QsCcN7SB0aIqmSGNEuqrmW8wBBGdNoBT/3M2HLUgXI8YFHULJm
 GXC+1o7E+sQj7Qyblrsn0Qy67na0LIEElO1HILDZx+HwdIIk6vpbsbRvv
 Cch8RWxQRQ0OZf1glVKlf9XxEgusW59cC8zpp49cTMObXzZ/yKoyqyyc3
 z4U4k+jkOJJJVfFvpLUvgfqmxz+PYcXEvgVKqISKr/9vEo0Qf/ur1IuZ0
 PQMCa5Ds6CdGtEq3avPGvbs4oP+R9R4SvRRojQy2BHNcDQNf75XYe81sq
 p6kY69XlnyeqV5newfCHvE0PVribgQgNi7mG9Omv77K2KVM9JZ+kt3Ai1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368658079"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="368658079"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 11:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755561083"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755561083"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 11:27:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:27:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:27:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGbmYStdCK63s7QVfvIk7DjY8X+jhqcqhCIT8RfVkZ7QamvBPpIEC0TWcOEcy1TYZvlVIJN+OBlhxu8te98DDT6DYuMQbAbWRD6E6+xTgxZzoBKdXQGLd8t3YtkCPSdm62BgKGpI9r4Eq9OhyFDUSk5Ihxs/S9pd8af8tai9Ld1x8+HeuR5bXUrtrQwHSlMLy+SpLt9+Nn2aO+sml8+rPLcRfd9C7t1jEPcnnfQGXLp0RUIJzj3Y852cQY6aF2XjGvcRzKRnmnx/2jQ8RvhcnQwiyjyPc+Tu3ybvGfzo+SzaER0uS47Ordq0vLMJJWYvFHEwkGNtdcy2ahTDV5gokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyW9pLX1UIVuDvtCxlwvalkel0o26Z8AfrVuxX/goDE=;
 b=L2eWYjmVxCf2LHzRDOpK5KxXD+9N1cwGHe+wP6Sr/9WheMxwxvvvyxCzyni+tpRyeeJNnn5MG6x+k8rLyGhkiqyPkpPaSGfxT6jSffa6Ckua7ur1PMwl8xrrsLcObaHgfZ5cNEYBHrrbT05rJXw88vE8oN6Xz6Gv564DgMREZbx99P7TosTUUTrN1Zpbf2c4P6CSrqYPhz7yhtuy8A5FCY52+VNS5YSYSNQdnEmj+CrD/dA4iaouUSi1GAK0kZUs3Vz8mTqzMk+VvIoc22oYvfXFWA8dzAYJnTWCv9npTV13CRYX2BrrnYT5Ane59MCLwsLTrROZl3MPRyuLUV+zXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 5 Oct 2023 18:27:18 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:27:17 +0000
Date: Thu, 5 Oct 2023 11:27:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZR7//BINGYSWhDs0@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-14-ashutosh.dixit@intel.com>
 <ZRzMnBMYSDWdjd3Z@unerlige-ril>
 <87o7hd1vwt.wl-ashutosh.dixit@intel.com>
 <87jzs114cp.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87jzs114cp.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: d856ff59-d572-400d-ac59-08dbc5d0b45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rwP6023XETopYDdIjKjxx9YeMiB/+uQ/4gPwwQcK8qW9S1sT0AG0tYzrbr/FnbEyVY4XerqiAomL+UeC614wHQATvXCJVvY4zp6DI2cJwwt58BWQx4VZJ/7E9eRcXDpsrS5AVymCY0zken/pGlR9Q3AIZ5eMnGXhOvSGxf+EKkD3KVkPrqBsQAtU2K2ytFbkR4cZZYfOCvhvCapeUE2e227/GjMNCo2UXjuvRq+c6/YZ5BOa/9YhWb04Zqhtu4YAWWxtYx+GlYeeOkCuxf++Z3a3FCTSZJbktE6bcC8yop0/BRm+viuVAfqldNFLpHawyQXvlC5Q5UIQY/aeYYXPLpp4L/NoU97TjY9KlGaDlzdUJ65ngBlGy92oXdaZ8YgU41UdQHJ2dbbnq3g814ZfXHsSlvVWlTzjj3AGki61xWkcjwuEcYVRPTr688Ry3rlMi9ajRw/ax4tqJikEAEE3WyFEbjkXaqXYBjx4YGFnX8sNXTnVpyu1GEeJyBgK8c0mmFw8hmfSsvs3OQWoLOKZ6K06+JlnnyzwJ0g7DFWlLKnBN+cq6qSPzYBBHesIu30
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66899024)(33716001)(6486002)(9686003)(6506007)(6512007)(26005)(66476007)(316002)(66946007)(82960400001)(66556008)(6666004)(38100700002)(478600001)(6636002)(83380400001)(2906002)(86362001)(41300700001)(8936002)(5660300002)(8676002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhwME0xbTFHdDVoVTcrOGYwazlsR1lwQnBjbFJwK3VDcitTTmpZTDdnVTdQ?=
 =?utf-8?B?QnAycHF1SUQ0WVFvMDlvQmRnV0cra0FITElacGd3RGpndEZBOWwxREdKeFRT?=
 =?utf-8?B?YXcyL1hmaXYxd2N6T0FGM0FPUitFU0tqN05yWFIvTVJoMkFONG83YmluZFp6?=
 =?utf-8?B?VnQ4VVpHUzZkMXVwcWU3bU9zbGFMNzM4ckcycG0wUlpPUVNEMlRkYkl2NlVj?=
 =?utf-8?B?MWJQaGFnajlmRDRsUGpBYnN0Qmw4STZDRGNwVjAzYVpRLzFlSDlyWGlpL1k2?=
 =?utf-8?B?anMyUHBqU0FZM2Jrc3BSaWZLd3FHcjBpNm02YlZxRXBHSVIza0tjQWhOb0o3?=
 =?utf-8?B?K0dKb0svQnZ2akhFNmozS1Q0b2ZVYlpPeUdRZlF4RU85UWxjNnZjeHMyQkJk?=
 =?utf-8?B?WlplUDlWdEtsMXZWcW02MFFqMVU1aG5KNWJwK1lWbG1lN2ZOWEhJVHpWTXFR?=
 =?utf-8?B?ZjJ1enRqdE84cnF2cEhhdE90c2FXZkVOK3Nxb3puYUZhT2FnS2xka1oyTGN6?=
 =?utf-8?B?N3JWcnRjbWM2bTlKN1hsbzZxSGwvcS8zSG1hV052dk5WR0lUZzVDRElXU1JU?=
 =?utf-8?B?dW9GaStpMmhRejhPRUVwRXRPK25XZnlrbytGdTUwbUVxdkF1SEZWekJza25U?=
 =?utf-8?B?Y2VLWVhDVnZaaG9GTHZJOURFSW5xVlhBbWZtT2lwK0pxWXVDWnBlUnFMcjc2?=
 =?utf-8?B?T05RUTlzYUJQZUwxL3lUdEk5SFBYVlM4ZWRTZ2pmM1luUHFnaVpMRFNCcHB0?=
 =?utf-8?B?ZUNsNGtVMFYrVnlheHFlNDh5b1VZK2V3dWJKK0lMVlYxNlZVWDIzTnh5TXps?=
 =?utf-8?B?aXZhbkJ5Z3VYYWxjWnptWFQ5Mml5N3FXaW9Db01jNUdzREtzdUQxdFlwYkpJ?=
 =?utf-8?B?V3duN3FlWXVKcU1OMVRrcnpRM2pFbzJQK3A5Q0VzYWErZWIwN3B3MmxZcFdY?=
 =?utf-8?B?cnpxc25HVjZzR3dSNHF4K2o3T0dQSXpYRXZEWXd4ZXMvN3h3RHVKdmhWYmp2?=
 =?utf-8?B?cFlrWXorTmY3bjNjUjBjQms3Unhhc2lYRTQya1plTFFTNmlGL1FueWhHMGVo?=
 =?utf-8?B?RGdBdmtCdWpDNDVwanhybmJVWk94NmFwbnZONjZabDFJbytVa3lUOXdLaGdZ?=
 =?utf-8?B?ODBhYUJtNmxsWFplUXd6QlRrUms0WUZ0V1pQL2RDcFIvN3JBZGhmbk5uSWQv?=
 =?utf-8?B?UzRtNjlpZjEyQkVMSWorakNYT2oxNlAxTmlSTUR0MXBCUHE0UThMYlRiTDN6?=
 =?utf-8?B?ZUV0QnRvYitoUmI3aGsrNXB6R2JLNGJmVVVSWFlUTE9ObVFlTnh1cTY1dkdo?=
 =?utf-8?B?Vjl6aVdHVTVLYnVhV0E2Zm5CZS83VjZZdG12VW1tRDBKSVovL3VKa21oNXBa?=
 =?utf-8?B?dVZzaWJJRHpKOGkxQTdXNHdTQmlUQ1c4WW1FU3hDaW02MlNVRDFRbVBjMU5z?=
 =?utf-8?B?VU9xa0hlMk5za3pMZVVvQjlQc2x1L3VvOWJpWTV6WmlOQmFzYlpjbDlHM0gw?=
 =?utf-8?B?WjRTV1czZWgra3Q4VVZVK25qaG5sRjFjZVd0aGpJWEtWZVExdGU4cXBJZG5F?=
 =?utf-8?B?NWg3Nnp1cDhBSTBUc2N1RFFHNGh2OHhoV3NmeGp1dHh2ZjNoalhwRXBQRE82?=
 =?utf-8?B?UGVucFFSV3RzcEtzWU1qQzZXUHpBRTV3eFhrVFgzWXVuTjhBdGhHSGxoRHRQ?=
 =?utf-8?B?ck9LaTdGY0svb25CRjh1VTNxc3A1Qk96ci9XWHZXMGJUQjBFb09vNjlCMUFY?=
 =?utf-8?B?TzJKTjFDY29lcDRKb2VEYTRDNkVUSWkrSCtTelhNNFByL1Y0M0JSZjcrc1hU?=
 =?utf-8?B?eWorVFBVTWovVlFKYURRWm5TZnNPUVlGaXN5UDVLQ25GV2xuUkR1d2p2TFRX?=
 =?utf-8?B?Y3AraVdTWSttLzRtTWg0dGw5RDYvMHhLSHZMeGt5cjdlUHFGazZkclQ0RWdn?=
 =?utf-8?B?MXZyY1pRTlNqMWNFMlI3L0N4SDEzMXdmYi9XbHY2akNuRUkyYzlPUDRvczlr?=
 =?utf-8?B?UFlCVklwWE5ORWVmSFMzL3REMDlQZDdzS3VmanFYcVplUDd1QkRSWjVpRjZh?=
 =?utf-8?B?dlh2NUdjOHJqOThoeEp0eTgxWUZscEk0Mk55cHJxNlBIamU5THAyako3eGhM?=
 =?utf-8?B?dHI1dmRXVEJpMktleURNcGtkWjV1emlIWUtFbUVmZWpmQnRBVUF6b3ZoVzQ5?=
 =?utf-8?Q?a21j0/FeDnIGxGJwHbLZxNg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d856ff59-d572-400d-ac59-08dbc5d0b45d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:27:17.5113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5ImmHRad7+2GFu1paWK40YaACbGJwdz25LYhfzsoObNoyKwtiHtDNE8EXTkWQ/IqOA5tQ9cy33pz95hwT5UY3yeRAX7MTmIpcvbY8lD/bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/21] drm/xe/uapi: Multiplex PERF ops
 through a single PERF ioctl
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

On Thu, Oct 05, 2023 at 08:22:30AM -0700, Dixit, Ashutosh wrote:
>On Wed, 04 Oct 2023 22:27:14 -0700, Dixit, Ashutosh wrote:
>>
>> On Tue, 03 Oct 2023 19:23:24 -0700, Umesh Nerlige Ramappa wrote:
>> >
>>
>> Hi Umesh,
>>
>> > On Tue, Sep 19, 2023 at 09:10:41AM -0700, Ashutosh Dixit wrote:
>> > > Since we are already mulitplexing multiple perf counter stream types
>> > > through the PERF layer, it seems odd to retain separate ioctls for perf
>> > > op's (add/remove config). In fact it seems logical to also multiplex these
>> > > ops through a single PERF ioctl. This also affords greater flexibility to
>> > > add stream specific ops if needed for different perf stream types.
>> > >
>> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > ---
>> > > drivers/gpu/drm/xe/xe_device.c |  5 +----
>> > > drivers/gpu/drm/xe/xe_perf.c   | 32 ++++++++------------------------
>> > > drivers/gpu/drm/xe/xe_perf.h   |  4 +---
>> > > include/uapi/drm/xe_drm.h      | 16 ++++++++++------
>> > > 4 files changed, 20 insertions(+), 37 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > index 770b9fe6e65df..24018a0801788 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -115,10 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>> > >			  DRM_RENDER_ALLOW),
>> > >	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>> > >
>> > > -	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
>> > > -	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
>> > > -	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
>> > > -
>> > > +	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
>> > > };
>> > >
>> > > static const struct file_operations xe_driver_fops = {
>> > > diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>> > > index 0f747af59f245..f8d7eae8fffe0 100644
>> > > --- a/drivers/gpu/drm/xe/xe_perf.c
>> > > +++ b/drivers/gpu/drm/xe/xe_perf.c
>> > > @@ -6,37 +6,21 @@
>> > > #include "xe_oa.h"
>> > > #include "xe_perf.h"
>> > >
>> > > -int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > > +int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg, struct drm_file *file)
>> > > {
>> > > -	struct drm_xe_perf_param *arg = data;
>> > > -
>> > > -	if (arg->extensions)
>> > > -		return -EINVAL;
>> > > -
>> > > -	switch (arg->perf_type) {
>> > > -	case XE_PERF_TYPE_OA:
>> > > +	switch (arg->perf_op) {
>> > > +	case XE_PERF_STREAM_OPEN:
>> > >		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
>> >
>> > It's a nice idea to reduce the ioctls, but if your struct drm_xe_perf_param
>> > *arg is overloaded based on the PERF_OP passed, then I would recommend
>> > validating that the right arg is passed for the corresponding OP.
>>
>> I am not following what you mean here: which right arg for which OP?
>>
>> The PERF layer only demultiplexes based on perf_type (say OA/XYZ etc.). The
>> perf_op belongs to the perf_type layer (say OA), not the PERF layer. It is
>> the job of the perf_type layer (OA) to validate the perf_op, not the job of
>> the PERF layer. It is just convenient to include the perf_op as part of
>> 'struct drm_xe_perf_param' (rather than inventing yet another layer there).
>> See the function xe_perf_ioctl() in the patch.
>>
>> The xe_oa_ioctl function above could possibly be moved into xe_oa.c. I just
>> left it in xe_perf.c since it didn't seem to matter much. But I am open to
>> doing that.
>
>OK, I think I figured out the right way to visualize this. It's as
>follows. Let's say we have a an OA stream inside the PERF layer. So what we
>have is:
>
>struct drm_xe_perf_param {
>	perf_type;
>
>	struct oa {
>		oa_op;
>
>		struct oa_op_params {
>			...
>		}
>	}
>}
>
>So basically I have eliminated 'struct oa' and merged into 'struct
>drm_xe_perf_param'. But oa_op still belongs to the OA layer, not the PERF
>layer. So the oa layer handles the oa_op not the PERF layer.
>
>> > Ideally I wouldn't go that route since that would require some sort of
>> > signature in the arg which would identify it as the correct
>> > param. Instead I would be okay with retaining separate ioctls for the 3
>> > operations.
>>
>> If we were not doing this multiplexing based on perf_type (as in i915) we
>> could have separate ioctl's for each operation. But since here we have
>> anyway introduced a multiplxing layer, to me it makes no sense to have
>> separate operation ioctl's (only disadvantags and no advantages). (Note
>> that the multiplexing layer implies a (non-obvious) additional
>> copy_from_user per operation visible in the previous "drm/xe/uapi: "Perf"
>> layer to support multiple perf counter stream types" patch).
>
>The drm layer does a copy_from_user for the first layer but any second
>layer structs need to be copy_from_user'd by the driver.
>
>>
>> Also we cannot assume that a future stream type will only have 3 operations
>> as i915 OA did. The OPEN/ADD_CONFIG/CLOSE are really OA specific
>> operations. But it appears other potential perf_type's will also be able to
>> use them, at least initially that is why they are left defined as PERF_OP's
>> (rather than OA_OP's) in xe_drm.h. New stream types are free to introduce
>> new ops in this design.
>>
>> So retaining the ops inside a single PERF ioctl eliminates the need for
>> introducing a new ioctl each time a stream type introduces a new OP.

I think I misunderstood. This is fine as long as the underlying layer is 
able to validate the arguments.

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
