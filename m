Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1ABCDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 15:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE14310E043;
	Tue, 17 Oct 2023 15:12:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854CB10E043
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697555556; x=1729091556;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SNukpk7c5mPoewTyZKDABSRpsichdH3gVb9N8TNi3Ro=;
 b=nfiSLTCi8Vf2smA/Mjl6DczKcsbS+xr5wQlS2LJ3COfe5dVmT8+ecinS
 WepmF0lRrTU7H7qjgJg62nuqhKyTX8M5tEITwUbBgdLbz0zQNjv38H4sZ
 RlxqoOO2DqSN/DvAhuNo0QjT9MkU6Pe7se+YYJUo1jKHI863eUXcYYe8+
 MHzZx5TGdyn6kJPM57hoF/3WT9TO/LTprVESakQLYDV3V2BTWF5NZH+D8
 6ljwBApAdUVDTW1Pq8r6EjYK8CXTbevMmyoC/hhByLhrEE5gOUH/pkYDZ
 zXSz736xp8vm1mg5n4Ajf7294LYy9wAhBX/LRGQ9Xm8BtvNAE87un2QHD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388665895"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388665895"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791258672"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791258672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 08:12:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 08:12:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 08:12:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 08:12:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 08:12:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBO7K7dsa0eryazu+ggW6ormhWsTAn9dZPa9R1WP5KtC7IS8rHOBBRsXml0VCnibK9AiLwKTc6Z7lG+sg79+vj8IWwwFt6a/sJzjdpDbjGPMytG8Zp06bA37E9zy1QNZhB+eGitNaRvrJrOmmpF9k4/VOXZlwfHbc1Bm2GHVWcr0TaoTk4SYutt1D23DEtui9AEHJczCtkDvkW1R/2VaUijYVrz8t1uwzWQOvTFaMP4XPww3ec65KtWDsyw7ZNIrmtvIoa/BqDxot2GLsjo4P0lU1i0N/GTK6WSyB5gnpSpmj04Ww2So4FOcKCLJR/fPAMr67IXhRcrJFqR0HNE7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5X3JRO91oA21nUEP+LeWkMdp1qNj4yA7WId9C3juHs=;
 b=FvCOnX6pHy0pu6QpRRlSSX4Eau+c9YcsxhLgpoWnyKEeWGz6mxHzL/RCe2+s8hFjlK9LxK7NwTxg5lIQYV3FB0vQWmUsaTwknlaQGWKzAtSvkxZnStkg4dTls86FOFmgl2zzOkwmhJXxt3ijaH3EzV4zRwJlEmrpU1UDZFEx/+2Yr+n1lWJNuuch8xsu1yiIDK/llykENY6lcK8YlKKQdxIIHU9N3AwC+zs+yUYNqKnNGzj+O7VFDxclvYtAVIaP+c3QpWey9R3da3Y+9GoQev8bxSIZTVDymM7y2cxgsrWQpdy2Mz5NIw7JWdyZpXPtW3oYf9S55mYcYLaL6jHtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 15:12:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 15:12:30 +0000
Date: Tue, 17 Oct 2023 11:12:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZS6kWW9oULDTRPjY@intel.com>
References: <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
 <ZS18QYFnoxZBRAtl@intel.com>
 <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
 <ZS2YMf+umJSSYkh3@intel.com>
 <eeb0a65118c80a61c8cd1e301ad3c28592cfde40.camel@coelho.fi>
 <ZS20xlCm8DMTH4bQ@intel.com>
 <20231017005841.GB1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017005841.GB1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf4066f-feb5-4631-c932-08dbcf237af6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oB974xp0PNf5Kcjz/yJs/Z53+h52gRNBh8+0qbdcRrHk8C4CDwI587wblC61/vKSHfRRgkuEHDf0ADfhsIsj0eRj+T/WGEfmIlqahsuMTrKikROJ+bbmTG9+x7iVQc/CP6tpBT+q1kVb6SOQmrqHGIevVo0U+qPOaFMNpZgFEDGYtqMN6jGQdGM2r7uOjMbOZ12Pa6quy/UnrRzImHBojOtsOSBsyzPrbprZqtFBagJPt5H4xZCUlPw+mOkFCpotloJBoH5dqRioCbVn9JlnidsXWz8eIsPOoJUn5dCXriisaOWRgd6IkrlX8jXTAKroaIlWh5IIRygiZfODzRjkTBWZuF9CoaBViS10sqmjz2uFKUYgRWit0/Mlk0vgEdn5ZUCxjvoiDyxz0fSqbPpz0d0zG4vwPVccwgYXbPOZIy6TMmRIrcRPUxiPaLzj8biagGkC08QbaeBYuf9RRPkY/6p4SI7sk19oL191JsBs1E0lIzUBEzVqh9oI6SxqOjE5yGSyAjQ12wJEr6xbbh+91bMj0N89hGwSLBG5St5XZrd9gs97EueV8axn4DFw6yTU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6486002)(36756003)(82960400001)(38100700002)(83380400001)(6666004)(26005)(66574015)(6506007)(2906002)(66556008)(54906003)(66476007)(316002)(37006003)(6636002)(2616005)(478600001)(66946007)(44832011)(4001150100001)(86362001)(6862004)(41300700001)(6512007)(8936002)(30864003)(8676002)(4326008)(5660300002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHcxY3dLdXg2WU9LOE4yYk9KTWZGdVNjLzJLRHN3TU1MT2dHc1JoeWpSRDFt?=
 =?utf-8?B?Z3Vqb2I4TGhKT3Fic21mU3BUbWtheTZOMys1YU85TGUzbmh6VEM0SnowS2VI?=
 =?utf-8?B?K0g1MWQ4bDBkT3A5ZHFyWmFiUS9NQm8veTZZeW02VHNqVEZVc0lwQWU4dmtz?=
 =?utf-8?B?Vmg1bFE3RG9RamYvNjBwS0NSRVRuOWNwV0RVRXZyUy9WYmh6V1BuRUgvQlNv?=
 =?utf-8?B?Q3dmNVVZT1RkK0VaYU4xcEJ0TzU3MERNeDlybDZtMUJ0d1drSzBXSWg1VkZ4?=
 =?utf-8?B?N3kyQ2VyM0ZCeFJXY0Z1dEdzNGVHT1FBL2NIZUo5bGw3VUtldGU4VC9zOGVM?=
 =?utf-8?B?a0tDd2t0UG93emZLOVZJYzZMVjNKYmNPcnR1aHg3TGlsZVp6aXhJVXdMb093?=
 =?utf-8?B?WlZyaHg3K3RLWkxqdnZQTHFLbzZzdmhSV2ZZU3lRNGxxT1lQWTJEY0o0a1h3?=
 =?utf-8?B?YnpXTVIwUmcvMGJzbGI1dEJ6M3dZNHR3alEvdnNsT3JscklTdUp6MkhITDBV?=
 =?utf-8?B?NlJyK21mYUNVb3hIdHltTEYzbHd0dEhvM2FRaXgvVTdEc2E5UGsvNFF2L0NZ?=
 =?utf-8?B?d3dVOGcyYWdpSXRta09LZ1QycGdGVjVuR0Rra1pVZDAwTzJ5VkFQNUtzeTBG?=
 =?utf-8?B?Nm1QZTI3N2VOQzFUSGNGdkdGVVZUbWY4ZTlScnN4dFFFMjhpa1FpNk5wUDJj?=
 =?utf-8?B?M1ZrcjhWS0N1ZCtpcnpkdXh1WTlXRGtza0pYQkFpcWprOW5GdDU0dlRXanpx?=
 =?utf-8?B?c2FyOERZcUo3UFV1WkVDM3lXRit6VGwxc1VZWmNSa3M4SFQ4TUxETzlOV2t3?=
 =?utf-8?B?Q0Zld2VWbzVHUHJOTXFYdTB3bWw3aHRsUENwSDVaQkphd2crOGpVcWE2SXNK?=
 =?utf-8?B?ZWtlWkxqN09zY0FDQit6SXl0VFg5aHhrWmJLakJ0UjQxb2JxRzF6Q0xDd1dI?=
 =?utf-8?B?OE5EYTlOTHluTnQxTjFuc2luSm1GMi9JdkRDaktjKytiWjVONWttOCs5WXU2?=
 =?utf-8?B?eDJsQmlUQ1FNSTg2QkZVOUpKdUk3b1hWcWhSaW9wenR0amFVcjZ6aTBhSGxH?=
 =?utf-8?B?QkFyb0xSTnNxNTJMZEE5SzJoQkNsTzdkNEZHUTZsNGdIRFJmbmlwc0oyclNO?=
 =?utf-8?B?by9oVE5jVE1JUjVQeng0N2M1ZVA4QXI2U01INHNGbktNQU9ZVnlpVHpJV0FI?=
 =?utf-8?B?ems5dHpOM2MvaU9ZTC83ZzNlc2JvRUU1MkZ2R0tLSGViR3RTako4VkVSaG9M?=
 =?utf-8?B?V2ZJV0svTGRueU5TbXkralh6SUVja0JUbDBiVzRHTGdUY0tqb2FZWUprcUpt?=
 =?utf-8?B?bDRnZU05UkQ5em1DZ1VqTlJDUlhKbmtocVJ5dVJodmVuQ1dKbkxISW9yK0FI?=
 =?utf-8?B?ZzNSd3F5ZGVsQ095UEhvUEsra1o4b1hWTDdIL3l5NjdNUDIxbkVtc0RGQjVO?=
 =?utf-8?B?c1NhM3d4MXZucVNlZER4bCszclFkRjg4blVSOFlLQTBlaHU4UjUzeFRGbHZN?=
 =?utf-8?B?SWgzZmwreUUxajUydGRNMStGLzhSM3N4aXEyc3A1TkJzd2pTM3VwZVhOYWlH?=
 =?utf-8?B?bENVNEc1eElFQ2tJZzU3bGNUYmU3alY1OXRqeG92MlBsS2ZhWW02dzJBODdV?=
 =?utf-8?B?N1AzY0RIcENReWhXcEZBcE5Kejg3U29QbzRmeWRrZ1VhaFN1SkhJQXhQWnNw?=
 =?utf-8?B?dkhVMExTemdySkNyMXF0UXdaWGViaktFSmRaWHpZQ05JNWNaWUxKaE1rSkNM?=
 =?utf-8?B?eGNjTHEvWE9xOVBoODdYdXBOM3FaNEpielBkVUZxUHNNR0xueUNtT295elY4?=
 =?utf-8?B?Si9Yb3pmekFlNWhGTENwa3M2YnpvMlJid0VDaHMxV2FuRGxUeXYxcGNpcmdm?=
 =?utf-8?B?b1VXeFhBUWkwUzZZVFJNZ2l0enFhWlRyVTNNQWFEVFZCNGJUcndwZjBjQ0VR?=
 =?utf-8?B?dDBJTFdkbUJXbW0xcUJjWXJSbmltSVc1bFZ3Ri92RXlZbGN1bTVHSHJJdnpx?=
 =?utf-8?B?ZzhYVURmNmJ4dHJINkxzc3hYVzJuNzdxZWVDaWdPNWtaZVJhMVFaK252MUY1?=
 =?utf-8?B?K2wzNUtpaXpTY1JMdGNISmxNQ0hUVkNTTkJ2WGpwR2RCazZPUDFaVkd4cGxv?=
 =?utf-8?Q?MumlXQHOKfYG+wpTyU7/WMDH2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf4066f-feb5-4631-c932-08dbcf237af6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 15:12:30.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3b0SmwIoRKowTfbbHeN6rEca9bfn2zWPb+mk1FHV7m/Fn/eOKc48+mqCuDFHwI4vysINHtQF39JIYqC7HPyuuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 05:58:41PM -0700, Matt Roper wrote:
> On Mon, Oct 16, 2023 at 06:10:14PM -0400, Rodrigo Vivi wrote:
> > On Tue, Oct 17, 2023 at 12:33:39AM +0300, Luca Coelho wrote:
> > > On Mon, 2023-10-16 at 16:08 -0400, Rodrigo Vivi wrote:
> > > > On Mon, Oct 16, 2023 at 10:40:12PM +0300, Luca Coelho wrote:
> > > > > On Mon, 2023-10-16 at 14:09 -0400, Rodrigo Vivi wrote:
> > > > > > On Mon, Oct 16, 2023 at 01:22:32PM +0300, Luca Coelho wrote:
> > > > > > > On Thu, 2023-10-12 at 16:04 -0400, Rodrigo Vivi wrote:
> > > > > > > > On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> > > > > > > > > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > > > > > > > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > > > > > > > > Hi everyone,
> > > > > > > > > > > 
> > > > > > > > > > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > > > > > > > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > > > > > > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > > > > > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > > > > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > > > > > > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > > > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > > > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > > > > > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > > > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > RFC
> > > > > > > > > > > > > > > > ===
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > > > > > > > > > > > Xe than anything else.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > > > > > > > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > > > > > > > > > > > the name suggests).
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > In i915 there were more differences between fw and non-fw variants
> > > > > > > > > > > > > > > of register functions than just forcewake handling:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > > > > > > > > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > > > > > > > > > > > >  * _fw() functions also assumed that the caller was already holding
> > > > > > > > > > > > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > > > > > > > > > > > >    the lock around each register access
> > > > > > > > > > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > > > > > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > > > > > > > > > > > from a performance perspective.  For display registers, a quick binary
> > > > > > > > > > > > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > > > > > > > > > > > determine that no forcewake domains were needed for those register
> > > > > > > > > > > > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > > > > > > > > > > > level at all.  For display registers, the more performance-relevant
> > > > > > > > > > > > > > > aspects of using the _fw() functions was doing all your register
> > > > > > > > > > > > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > > > > > > > > > > > holding the uncore lock over an entire set of registers rather than
> > > > > > > > > > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > > > > > > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > > > > > > > > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > > > > > > > > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > > > > > > > > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > > > > > > > > > > > accesses).
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > > > > > > > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > > > > > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > > > > > > > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > > > > > > > > > > > the MMIO.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > > > > > > > > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > > > > > > > > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > > > > > > > > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > > > > > > > > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > > > > > > > > > > > the domains (as we do during part of init).
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > MMIO access that requires forcewakes really only should be in a few
> > > > > > > > > > > > > > places, off the top of my head:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 1. Init
> > > > > > > > > > > > > > 2. Reset
> > > > > > > > > > > > > > 3. Sysfs / Debugfs
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Please chime in if I'm missing something.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I think as we implement more features in the Xe driver we're going to
> > > > > > > > > > > > > wind up with a lot more places where we need to access GT registers at
> > > > > > > > > > > > > runtime.  A few examples off the top of my head:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * EU stall sampling
> > > > > > > > > > > > >  * Perf/OA
> > > > > > > > > > > > >  * EU debugger
> > > > > > > > > > > > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > > > > > > > > > > > >    times in the driver.
> > > > > > > > > > > > 
> > > > > > > > > > > > Hmm, ok a lot of these I could make the argument that these are not
> > > > > > > > > > > > normal operation so just grab everything and call it a day. If some of
> > > > > > > > > > > > these fall into the category of 'normal enough to be optimized' I can
> > > > > > > > > > > > also make the argument it is no more complex (perhaps less complex) to
> > > > > > > > > > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > > > > > > > > > forcewake.
> > > > > > > > > > > > 
> > > > > > > > > > > > What a compromise of in a debug mode we auto-generate the asserts based
> > > > > > > > > > > > on a table but we still explicitly grab the forcewake?
> > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > > > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > > > > > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > > > > > > > > > > > >    of some specific one?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I think we're only holding ALL domains during init; for most of the
> > > > > > > > > > > > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > > > > > > > > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > > > > > > > > > > > need.  Although that might be working right now, I'm a little bit
> > > > > > > > > > > > > > > worried about how that will scale in the long term when a single
> > > > > > > > > > > > > > > register might be in several different domains depending on what
> > > > > > > > > > > > > > > platform you're running on.  There have definitely been cases in the
> > > > > > > > > > > > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > > > > > > > > > > > between platforms, so the exact domain you needed for an operation
> > > > > > > > > > > > > > > varied by platform.  And things are even more complicated if you're
> > > > > > > > > > > > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > > > > > > > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > > > > > > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > > > > > > > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > > > > > > > > > > > we decide which route to take.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > > > > > > > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > > > > > > > > > > > information and double check it?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > > > > > > > > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > > > > > > > > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > > > > > > > > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > > > > > > > > > > > the Xe driver will eventually support if the power management handling
> > > > > > > > > > > > > > > changes.  I think that was part of the motivation for encoding the
> > > > > > > > > > > > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > > > > > > > > > > > change as much these days as they used to, but it's hard to say whether
> > > > > > > > > > > > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > > > > > > > > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > > > > > > > > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > > > > > > > > > > > domain.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > > > > > > > > > > > encoded into the driver, it might be worth doing something sort of like
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > > > > > > > > > > > anything like this in Xe.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > When you say unreadable, are you referring to the macros that generate
> > > > > > > > > > > > > the table lookup functions?  I don't think that macro magic would be
> > > > > > > > > > > > > needed for Xe since we don't have to support old platforms that have
> > > > > > > > > > > > > very different forcewake behavior, and we also don't need to generate
> > > > > > > > > > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > > > > > > > > > > > (since I think everything in the GT is 32-bits these days).
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Just the entire file is unreadable in general, trying to avoid these
> > > > > > > > > > > > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > > > > > > > > > > > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > > > > > > > > > > > 
> > > > > > > > > > > > Matt
> > > > > > > > > > > > 
> > > > > > > > > > > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > > > > > > > > > > these days, and if we move to autogenerating them from a text file, they
> > > > > > > > > > > > > can become even simpler since the text file will basically be a cleaned
> > > > > > > > > > > > > up copy/paste of part of the bspec table.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Matt
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > > > > > > > > > > per-platform tables into a human-readable text file that's more similar
> > > > > > > > > > > > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > > > > > > > > > > > replication type, etc.) and then provide a small parser program that
> > > > > > > > > > > > > > > will convert that into actual code (and do things like consolidating
> > > > > > > > > > > > > > > adjacent ranges).
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Any other idea? Thoughts?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > > > > > > > > > > > I plan to follow up with another series that creates a more appropriate
> > > > > > > > > > > > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > > > > > > > > > > > target (even for things completely unrelated to the small GT subset of
> > > > > > > > > > > > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > > > > > > > > > > > operations against a specific hardware unit, and then the info inside
> > > > > > > > > > > > > > > the MMIO structure would be able to figure out if there are additional
> > > > > > > > > > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > > > > > > > > > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > > > > > > > > > > > >       device.  Only used during init (e.g., to read the registers that
> > > > > > > > > > > > > > >       tell us which tiles exist on the platform) and during top-level
> > > > > > > > > > > > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > > > > > > > > > > > >       the root tile).
> > > > > > > > > > > > > > >     - No forcewake needed for register accesses through a handle of this
> > > > > > > > > > > > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > > > > > > > > > > > >       types of things.
> > > > > > > > > > > > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > > > > > > > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > > > > > > > > > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > > > > > > > > > > > >       but if a handle of this type is used to try to read/write
> > > > > > > > > > > > > > >       registers outside the display range, we could have debug builds
> > > > > > > > > > > > > > >       throw some extra warnings.
> > > > > > > > > > > > > > >     - Unclaimed register detection could be confined to accesses through
> > > > > > > > > > > > > > >       these handles.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > > > > > > > > > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > > > > > > > > > > > >       I.e., sgunit/soc registers.
> > > > > > > > > > > > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > > > > > > > > > > > >       if used to access a GT range.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > > > > > > > > > > > >     - Used to access GT registers in a specific GT
> > > > > > > > > > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > > > > > > > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > > > > > > > > > > > >       check+warn like you have here.
> > > > > > > > > > > > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > > > > > > > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > > > > > > > > > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > > > > > > > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > > > > > > > > > 
> > > > > > > > > > > Just to revive this thread.
> > > > > > > > > > > 
> > > > > > > > > > > I've been discussing this proposal in the context of a change we need
> > > > > > > > > > > to make in the display, which is to introduce a wakelock for some
> > > > > > > > > > > registers access in order to be able to remove the DMC trap.
> > > > > > > > > > > 
> > > > > > > > > > > We came to the conclusion that this new implementation is very much the
> > > > > > > > > > > same as the forcewake proposal here.  From the display point-of-view,
> > > > > > > > > > > we could simply have a new domain and range of registers to protect.
> > > > > > > > > > > 
> > > > > > > > > > > We _could_ implement a separate "wakelock" mechanism for the display
> > > > > > > > > > > part, but that would be mostly duplicating the entire forcewake
> > > > > > > > > > > implementation.
> > > > > > > > > > > 
> > > > > > > > > > > So, are there any plans to implement the current proposal? Or any other
> > > > > > > > > > > plans related to the forcewake implementation for Xe? As I see it, the
> > > > > > > > > > > "wakelock" implementation in the display depends on this.
> > > > > > > > > > > 
> > > > > > > > > > > Any thoughts?
> > > > > > > > > > 
> > > > > > > > > > Hi Luca, thanks for raising this again here.
> > > > > > > > > 
> > > > > > > > > Hi Lucas! Thanks for your comments.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > So, as I said in the past, I don't have strong opinions regarding the
> > > > > > > > > > overall forcewake approach.
> > > > > > > > > > 
> > > > > > > > > > The since GT MMIO is not used very frequently, I don't see a problem of
> > > > > > > > > > leaving that up to the caller to take the right domain when needed, or even
> > > > > > > > > > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > > > > > > > > > go through this extra steps and then have to opt-out with the '_fw' [sic]
> > > > > > > > > > alternatives for the cases where the forcewake cannot be checked underneath.
> > > > > > > > > > 
> > > > > > > > > > So, for the new display wakelocks, that's the problem of adding them to
> > > > > > > > > > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
> > > > > > > > > > from i915's intel uncore are happening to xe_mmio? So, when using the
> > > > > > > > > > intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
> > > > > > > > > > mmio calls you just add a wakelock_get/put around the xe_mmio call with
> > > > > > > > > > the display domain. And in i915 you implement inside the intel_uncore.
> > > > > > > > > > 
> > > > > > > > > > What's the downside of this approach?
> > > > > > > > > 
> > > > > > > > > That's more or less what I was thinking.  I don't think there's any
> > > > > > > > > problem on the display side in calling the same framework.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > Trying to understand all the pros and cons of different approaches, and
> > > > > > > > > > bringing some people to the discussion.
> > > > > > > > > > 
> > > > > > > > > > If we implement the forwareke underneath the mmio call, display needs
> > > > > > > > > > to anyway implement it twice on the i915's intel_uncore and on the
> > > > > > > > > > xe_forcewake, no?!
> > > > > > > > > 
> > > > > > > > > Yes, IMHO we should start making Xe the base implementation and
> > > > > > > > > backporting the new implementation into i915.
> > > > > > > > > 
> > > > > > > > > So,for this specific case, I think we can just make i915 call the new
> > > > > > > > > functions in xe and have them backported in intel_uncore.h for i915.
> > > > > > > > > 
> > > > > > > > > What I was thinking was basically this:
> > > > > > > > > 
> > > > > > > > > 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe​
> > > > > > > > 
> > > > > > > > hmm probably a new component then?! xe_display_wakelock that
> > > > > > > > implements and export the get/put domain in a similar way
> > > > > > > > of xe_forcewake, and then on the wrapper you add the get/put
> > > > > > > > around the existing xe_mmio calls?!
> > > > > > > 
> > > > > > > Yes, I guess a new component, but part of Xe.  I don't exactly know
> > > > > > > what you mean with "xe_forcewake", but it's the same as Matt proposed
> > > > > > > with the different functions for different domains.  These functions
> > > > > > > would do everything that is needed for the specific domain, such as
> > > > > > > keeping it awake, checking if the registers are in the right range etc.
> > > > > > > 
> > > > > > > 
> > > > > > > > > 2. Display code uses new APIs (xe_mmio_for_display ops)​
> > > > > > > > > 
> > > > > > > > > 3. Update uncore to handle "wakelock domain"​
> > > > > > > > 
> > > > > > > > then on uncore you would need to parse the mmio range and then
> > > > > > > > call the get and puts, that in that case would be static inside
> > > > > > > > the uncore itself like the forcewakes ?!
> > > > > > > 
> > > > > > > The callers will use the new Xe APIs, so in i915, the display code (and
> > > > > > > probably GT and others too) will be the same as in Xe. 
> > > > > > 
> > > > > > I confess a got a bit lost now. What's GT need here? Does GT need this
> > > > > > new wakelock or is it a display only thing?
> > > > > > 
> > > > > > if it is a display only thing, we have a new xe_display_wakelock component.
> > > > > > The mmio wrappers that translate intel_de mmio calls to xe_mmio would make
> > > > > > usage of the xe_display_wakelock functions. And no body else. no need to
> > > > > > disrupt the working GT code.
> > > > > > 
> > > > > > But maybe I'm completely misunderstanding what the wakelock is about.
> > > > > 
> > > > > Sorry if I was not clear.
> > > > > 
> > > > > First of all, I don't think the new "wakelock" mechanism is any
> > > > > different than the forcewake implementation we need in Xe (which we
> > > > > have in uncore for i915).  AFAIU, we don't have this forcewake
> > > > > implementation in Xe yet (which was the original discussion in this
> > > > > thread), right?
> > > > 
> > > > wrong. we have xe_forcewake. But it is up to the caller of the xe_mmio
> > > > to decide if it needs to forcewake certain domain or not.
> > > 
> > > Right, this I have seen...
> > > 
> > > 
> > > > What we don't have is the xe_mmio calling the xe_forcewake based on
> > > > some pre defined mmio range, like i915 does.
> > > 
> > > ...but this is what I meant that was missing.
> > > 
> > > 
> > > > What is this wakelock about? is it only a new display range of forcewake
> > > > with a new display domain?
> > > 
> > > For some reason, it's not just a new display domain.  But it's a new
> > > range (or set of ranges) that need to be protected by setting a bit in
> > > DMC.
> > > 
> > > 
> > > > or is it a new sequence of display mmios that needs to be executed
> > > > before and after display mmio calls?
> > > 
> > > This is the case.  We need to set the "wakelock bit" before making MMIO
> > > operations on specific ranges.
> > > 
> > > 
> > > > or even before and after gt mmio calls besides the forcewake domains?
> > > 
> > > No, AFAICT there's not direct relation to GT.
> > > 
> > > 
> > > > > So, my proposal is that we should implement the forcewake stuff in Xe
> > > > > as Matt proposed, with the different APIs for different components
> > > > > (e.g. xe_mmio_for_display()).  When this is done, we can add a new
> > > > > "domain" (or maybe even reuse the xe_mmio_for_display() one) for the
> > > > > new ranges that need a "wakelock" (which IMHO is the same as the
> > > > > existing forcewake mechanisms).  If we do this, the implementation in
> > > > > Xe is solved.
> > > > 
> > > > I really believe the wakelock should be totally orthogonal to Matt's
> > > > proposal on the mmio split for device vs tile vs gt...
> > > > To me, mmio_display is mmio_device anyway...
> > > 
> > > And couldn't the wakelock stuff be handled in the same way? My point is
> > > that it would be good to abstract this HW intricacies from the caller
> > > (in this case, the display).
> > > 
> > > 
> > > > We already have a wrapper for translating intel_de calls to xe_mmio,
> > > > why that cannot be used to implement this display wakelock sequences
> > > > anyway and regarless?
> > > 
> > > It can, but adding this logic inside the wrappers doesn't sound right
> > > to me.
> > > 
> > > 
> > > > > But, of course, we need to make sure that the display code will remain
> > > > > the same in i915.  To do so, I'm proposing that we make the display
> > > > > code use the new xe_forcewake APIs, even though they won't exist in
> > > > > i915.  So, for i915, we provide wrappers for these new APIs so we can
> > > > > convert the calls into calls to uncore.  So functionally, the display
> > > > > code in i915 will remain the same.  We don't need to implement the
> > > > > "wakelock" part for i915, but we convert i915 to use the new
> > > > > xe_forcewake APIs where it currently uses the uncore's version.
> > > > 
> > > > i915-display should only call intel_de functions this should be a wrapper
> > > > to i915's intel_uncore or xe's xe_mmio... maybe intel_de itself is the
> > > > right place to implement this display wakelock?
> > > 
> > > Again, I don't think a wrapper would be the right place to add this
> > > functionality, but it could, technically, be there.
> > 
> > Agreed. I had never told to implement in the wrapper. But the wrapper
> > would call the implementation in the new xe_display_wakelock besides
> > the call of xe_mmio. And then the implementation of xe_display_wakelock
> > ported to i915's intel_uncore.
> > 
> > However I don't believe this is needed as well. As more as I understand
> > this, more I believe the right place to add it is inside the
> > intel_de_{read, write, rmw) inside intel_de.h
> > 
> > You implement there once and you don't need to call anything in Xe and
> > you also don't need to backport anywhere. A single place and you are
> > covered on both drivers.
> > 
> > If it does not affect GT it shouldn't go inside intel_uncore. And definitely
> > not needed inside xe_mmio itself as well.
> > 
> > > 
> > > 
> > > > But i915 should never call xe functions directly.
> > > > 
> > > 
> > > Okay, I missed this rule.  I thought Xe would be the main driver and
> > > i915 would start becoming obsolete and all the current wrappers were
> > > just temporary, for the transition period.
> > > 
> > > IMHO the display code in Xe should become the main version of it while
> > > the display code in i915 should be frozen and become obsolete (or
> > > legacy, with updates only when needed, for old HW).  But I digress.
> > 
> > The work that Jani is leading is to make the display code independent,
> > and not replace one dependency by another.
> > 
> > > 
> > > 
> > > > > We won't disrupt the existing GT forcewake usage in i915.  That will
> > > > > remain the same.  But we will need to implement forcewake in Xe, which
> > > > > GT will use.  But the GT from Xe is not shared with i915, so no need to
> > > > > create wrappers for that.
> > > > 
> > > > The big question that nobody could ever answer yet, is why do we need
> > > > the intrinsic forcewake underneath xe_mmio, that is not already covered
> > > > by the xe_forcewake call by the xe_mmio callers?
> > > 
> > > I think implicit handling of all this would make things simpler (or at
> > > least more localized).  But it's a matter of style (and most likely
> > > details I'm missing)
> > > 
> > > 
> > > > Looking to the '_fw' variantes of the i915, we see that there are many
> > > > cases out there that we don't want the intrinsic forcewake and then
> > > > we had to create this bypass option, which name is extremely confusing.
> > > > Opposite of what it currently does and means.
> > > 
> > > What are these cases exactly?
> > 
> > They are mmio functions that doesn't take care of the forcewake.
> > Basically they are like the xe_mmio functions.
> 
> i915's _fw functions were intended for tight critical sections (e.g.,
> interrupt handlers and other hot path code) where we want to explicitly
> grab forcewake once, perform multiple register read/write operations,
> and then release it.  Using the _fw variants in places that aren't
> performance-critical is heavily discouraged.

yes, but the point is that if you take the path of intrinsic forcewake,
you immediately need to also support the path of non-forcewake, that is
what it is currently already there.

well, if we take that path, we should at least choose a better naming
then '_fw'!

> 
> > 
> > It is up to the caller using the '_fw' functions to take care of
> > the forcewake.
> > 
> > > I had understood that this was only the
> > > case because we didn't want to thrash the forcewake when we're
> > > accessing ranges that need it several times in a row.  Though this kind
> > > of thing could be done by using a timer to add quiescence.
> > 
> > so we already have the need for the case where forcewake is not needed
> > underneath, so the simplicity here might be to have just one single kind
> > of mmio functions and not 2.
> > 
> > > 
> > > 
> > > > GT MMIO operations are very limited to small usage during init, reset
> > > > and resume. And the underneath range seems like an overkill and historically
> > > > brought us many trouble.
> > > 
> > > I think the implicit handling could also take care of the state (i.e.
> > > whether the HW is "initialized enough" to need the forcewake) and use
> > > it only when needed.
> > 
> > not possible. Because we don't know who or what woke up that block. It might
> > be a firmware underneath. So if we trust that the block is enabled and avoid
> > getting the forcewake, then we are at risk of the domain get shut off in the
> > middle of the operation.
> > 
> > > 
> > > 
> > > > Again, I could be easily pursued to the opposite direction of the intrinsic
> > > > forcewake, but so far with the current arguments that we have at the table
> > > > I prefer to stick with the caller's responsibility on the forcewake.
> > > > 
> > > > If this 'wakelock' is something new that is bigger than display and that
> > > > maybe justifies the intrinsic forcewake, then we probably need more
> > > > information and details on the wakelock.
> > > > 
> > > > But if it is a display only thing as it looks like, I don't see why it
> > > > couldn't simply live in the inte_de wrapper that calls xe_mmio...
> > > 
> > > Okay, so there seems to be a lot of history, complications and legacy
> > > in the forecewake implementation that I have overlooked.  Though I tend
> > > to disagree that the callers should know and take care of all this.  To
> > > me, there should be a component that provides all this hardware access
> > > without the callers having to know all the intricacies and details of
> > > the HW implementation, such as what and when we need to have forcewake
> > > protection, which domains to use etc.
> > 
> > In general this is the part that I pretty much agree with you.
> > But this hidden magic underneath already brought us many trouble with
> > missing cases, only because the ranges implementation or even the bspec
> > were outdated. While if we had a simple wake all domain or we were used
> > to think about domain when implementing new mmio calls for new hw, we
> > would had saved a lot of time.
> 
> No, this is backwards.  Although the cpp macros are a bit ugly (and
> could probably be replaced by regular non-macro functions at this
> point), the range table approach has been an absolute life saver for
> maintaing the i915 driver.  

now we are talking about the right points in this thread :)

> 
> The bspec being wrong is not a concern here.  If the bspec is wrong,
> then you're going to get the wrong behavior regardless of whether you
> handle it explicitly (at callsite) or implicitly (in table).  The
> difference is that once the problem is identified and the bspec fixed,
> you can make one very simple change to a table rather than needing to
> audit every single register access in the driver looking for callsites
> that need to be updated.

good point!

> 
> The real concern is that in the long term it's pretty much impossible
> for the callsites to know what forcewake domain(s) are appropriate for a
> given register access since register ranges move between domains from
> platform to platform.  It's more of an issue for the media engines than
> for render vs gt domains, but in general just because some register is
> in the "GT" domain today doesn't mean that it won't move to "RENDER" or
> "NEWDOMAIN" on the next platform down the road.  When you enable that
> new platform in the future, it's much easier to create (and review) one
> centralized table that matches the bspec rather than needing to go
> through every single register read/write in the entire driver to see if
> any of them need to grab additional/different forcewake domains.

another good point.

> 
> Honestly I think the decision to not use forcewake tables in Xe is
> pretty crazy.  It may work out okay at the moment because we're only
> actively working on a small handful of platforms with few forcewake
> deltas, but over time that's going to change.  Also, right now there are
> places where Xe is just being lazy and grabbing all domains because it's
> too much of a hassle to figure out the platform-appropriate domains, but
> if we wind up doing stuff like that at runtime it's going to mean we're
> needlessly powering up unused hardware units which will be bad for
> real-world power usage.

Since our usage is so limited on that, there shouldn't be a big power
impact. Specially in the long run or in the certification scenarios.
However, we might be thoughtful about power consumption. Every single
Watt means, right?! If we can save even a little bit, let's save.

> 
> > 
> > > 
> > > And this is what I had understood from Matt's proposal.  The caller
> > > would just say "I'm display" (with an xe_mmio_for_display() call or
> > > whatever the wrapper would be called) and then access registers or make
> > > larger MMIO operations using function pointers that were assigned by
> > > this initial "identification" call.  These ops could then take care of
> > > whatever is needed for these operations.
> > 
> > no no, his idea was simply to avoid display code or even display wrapper
> > have to have to think about the GT at all. But for me the 'device' portion
> > of his proposal should be enough to cover the display and the display
> > won't be needed.
> > 
> > In general, if caller know that the MMIO is for a given GT it calls the
> > xe_mmio_gt(gt, ...). If the caller knows that it is MMIO for a given Tile it calls
> > the xe_mmio_tile(tile, ...) if it knows that it is for the device it calls
> > xe_mmio_device(xe, ...)
> > 
> > But those have nothing to do with the forcewake anyway. Likely for all the
> > GTs and maybe even for some Tile ones you would still need to grab the forcewake
> > and orthogonal to the discussion if it is inside or outside...
> > 
> > The device likely doesn't have to grab any forcewake, but if it is display
> > apparently you would need the wakelock, but that it could be outside that
> > as well anyway.
> 
> Yeah, it sounds like the direction we're going now is that display code
> is either going to remain part of i915, or maybe become its own
> standalone thing at some point, so I don't think we'll actually have
> display MMIO accesses from within drivers/gpu/drm/xe itself.  The non-GT
> register accesses in the Xe code will be sgunit registers, so the
> tile-centric accessor should be sufficient (or device-centric in rare
> cases).
> 
> > 
> > > 
> > > If we had this, then the wakelock implementation would be handled
> > > inside these ops for display, without the display itself having to know
> > > about access details.
> > 
> > But it is a display thing, why do you need to abstract the display thing
> > underneath the MMIO accesses?
> > 
> > > 
> > > But maybe I misunderstood the proposal.  And, if this is not the plan,
> > > then the only way to do it is to add the "wakelock" logic to the
> > > display orthogonally to the general MMIO access operations, which I
> > > wanted to avoid.
> > 
> > well, let's have it inside intel_de_ and we have only one implementation.
> > no port needed. Regardless of the future of the xe_mmio or the future
> > of xe_forcewake.
> 
> Implementing it solely at the intel_de layer sounds reasonable to me as
> well.

yeap, they appear to be orthogonal discussions. Even going with the
intrinsic forcewake inside xe_mmio, I still believe that the right place
for this wakelock is inside intel_de anyway.

> 
> 
> Matt
> 
> > 
> > > 
> > > --
> > > Cheers,
> > > Luca.
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
