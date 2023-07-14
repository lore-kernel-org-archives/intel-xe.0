Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C5CEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 03:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF9C10E101;
	Fri, 14 Jul 2023 03:44:10 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760A310E101
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 03:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689306248; x=1720842248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4wT08BSTgHja5uCSxtwAV406gN4Gilgw2eZmOLW0eEA=;
 b=F5/LoFBwh0nRFtFlzSqLfACeCv85ybJw7r081VeXqAnTa3g7l4mHtMy5
 peqcONEg8Gxvn/ZZss2SnaCJwq6c4DJHz8FyDom3VgF2HMrtf0gIbSd4/
 7lfz7g1MthC2cheFYvkhIB2xDmE3ScgP5le4Wztlq39hnC6xRDZlGpYDu
 O92ak+cHadmIqKxskNOWiPogFUojsmm4URH5Ww5uMzcUQLDipUsPvClF1
 6A7gljVYnqd35kuHorqZD1mBop+AGyBTrZeCs/stMTNSnbImIDtH6Us/a
 1CvLC4EwlKcOdJEGwvvVCpYsxE2kPiD0sprfUMMecJ0+HxQ2Fdqh+vNjR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451745545"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451745545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699525481"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="699525481"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 20:44:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:44:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:44:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:44:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOoLuEyF+ppjH6DjiMuvHGCiG9VbekZPNBOhqcIjkC77mtYarZWtx1mAjTpnb90NoPT9o/8fqXRVCjGPUfI06gOUr5sWHJiYA1xUgRPNFI3TXccVfoW4q2RKEDaxQBvhve4FQqUVCRAaDnvFAsfmG7dmI2++FB5+U+5GDpx/ZAwgqMvQJA6Xd9k2vKCn7tthXdEaz4J8WBrBMMvhyrQ65/yNTUJX57iUQaNnLgetZiEHoCdZJWHGNtEbk5N2oX9N1rLtf4ZyDrz0bmhMe2Etjp8RlLbzQMGiKvWHgnJoDn7qb6AICr3A2tIHIV75JUB+DdKkfcXpYeyfxm8BUetgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD8jUI89uQaY9z2vxgaaqs64ZVqqv+Bux+h3xFs2yCo=;
 b=EldxkZfix25s2JfEOHLPOK5I+L9UA8hRmiS3i8UZlk3Y4uN4zj9gwyXcJbaeiokmQRU3Sua26pFLVn5IGAtzXgXx1QzL+/jkiXEYcz9mLS6bpbRrrmeDophJKMbM/Xi9v+GYPKsptDYSK9ooQXMk+u2o+ugMW8Tnoe62Iboihiu+f9KdESySz9il7zT6DU3TqGovPAaSoHU/w+9jtvpohW4QFBNrm66Utj23WU8IWU7p/U4xXbm2eYuBh3Fu243vy+l/ZrrU06wPqLNiXjaoq5nK5Q+B2j1ivRKDS9J1DyFeFZHgQVrRWz7w1rN9TQynIgwdP/1Hv+4WfK/o5ta9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 03:44:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 03:44:03 +0000
Date: Fri, 14 Jul 2023 03:43:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZLDEUkdgIv0JG4s9@DUT025-TGLU>
References: <20230714000222.12396-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230714000222.12396-1-brian.welty@intel.com>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dac2b42-27b4-470f-3287-08db841c9127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngkjhspLPgVzCYE1qaui9bldPAd/kggfHyggEpRP9QBlPkkNk99qbiSiBk0Cj7u5VQlVPDa0n9wDd5QMHyYedpKPYaGwETPleG5hWEmznz2hJ9Nkf5u+l08DnQlA8myMZbAHp1delGAb7FJbkqNHjx+rxoXPa9QHTiknJHhDEyNqgaWPlNMrGZzFa/mEdZRJAbowvqr62cU0xbNStaIlLRhztutTgQFaMoR5I9HMt3pHvChVamkzmPZjjmqhuz5aJjSZ4ZQ4Rgomge8iiDd8utE8uiLfunAlt+IZmd837x5M550GGdL5xZXzUGGuMZ7eHtH0ruSMYW61ycfSA8RTp3zjeCfx0OO09SOitk4v2WKjRuFJZvneZh38xGv4YlQHCe4WIjWrZV9AZz6nb5SgKTlenKVix+1zI2mPB14cLtvbV+OhCgCpcrMUL0rARxg+x5UGVDq/MUvWiCi956Qn9s9FuSmF1hZ+ImPNJcteGvn/SG0lwaQ0aFNvPyk0cJ6ItWx0lTI3hwcFgyDXF8cBhatcEQwYxDOhPJr1EyPzjt0a097MdkPZ1b4Kx879GkLE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(8936002)(6862004)(8676002)(316002)(5660300002)(44832011)(4326008)(66946007)(66556008)(41300700001)(6486002)(6666004)(478600001)(2906002)(6512007)(26005)(9686003)(6506007)(186003)(66476007)(6636002)(33716001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/v/uKaf0o+ALGjl2dAwQU0GCh5sj0cHIR/XYXQhzNNyQXgQjxKnJ7YRgSXgH?=
 =?us-ascii?Q?woG5Z7k0Hh/Nf6Km8XyW8/7NAFuYKZQicvCG0c03+sbh+N5P8Ylnv1/7CqMJ?=
 =?us-ascii?Q?NzHrW7UaOTp8kyPjhEdDQ1bYDatYR1IwwyyLAtC7Nao90std1xkWOUc6TZaJ?=
 =?us-ascii?Q?4ue1PjlIa/OUNwVX6RMsB4kQT31btoSoCBR+MXizHTS3VNps9M8LOj/YHdWw?=
 =?us-ascii?Q?X5D9cy4LIanObRN7OEYIOIvacnP/eZ76w4GwWktpcyGBl9jaE0GGp4TJdScu?=
 =?us-ascii?Q?I7CT11H9Lm9s5k4mnhwQj2l+AsPpvz4QYuEnKXcCrFlWdqMI9IV19UFRak7C?=
 =?us-ascii?Q?YLtKCY8aIWqLv9d/ioebDpnnXZ79OlAnqNI8KTMnnwrSH0QWKtjABYmFrroc?=
 =?us-ascii?Q?5JY8l++fsrFz86y5YJn482i8TYIB1VKM3SChrhbSZBR8WA3xeN/ZA6X4I9XR?=
 =?us-ascii?Q?Fp7K5UptjeQZ7rfYEs1SbOMv1amrUxz2OR87ndtzNp0u7QKso4t/vHcdXopV?=
 =?us-ascii?Q?PnINChIEpPpJHlZ3/WPnPhD8Fd8TKMoLhrPRXOOC8ANRJ7pvEfTfxY2lE3Vx?=
 =?us-ascii?Q?SGKfHty7Cy8w8E+jFkNBHJeFDqOQvPdFxiwc65oatIbWCC8AHDV007tsNNxm?=
 =?us-ascii?Q?MYDZFSTteu96OLFbGc9mm0oaEBv5x2UZEVh69w0o/Ah/Scgk+gamv3lvMrz1?=
 =?us-ascii?Q?euLS2IWb8rrkw6qe71ybsjRbLmvUI5g8q81RSwUaM8R+OeeQUyfKWCwAkHBf?=
 =?us-ascii?Q?5oYR4u/iBmSxYdVeAKWBbPNEAG+qq9MFtTnfYesA2K7fIi2Nr7lY+ZzrA4eW?=
 =?us-ascii?Q?XOP5kulG8ahGE88xAJ2L/CCjMDJI7KoZDE//0cjEiBDrIhJmACG8LkArU/cr?=
 =?us-ascii?Q?N1f8pqmUlza/lafI0qQDoKMYKvJPfrSjogE4O1Sq5iagzQodOgxils1HXsrv?=
 =?us-ascii?Q?JBAGd+bjacZeYcqIhhPQKHPUFrLiAooYZTMluIi9ihDAyTPmvDZbg5BvetRD?=
 =?us-ascii?Q?inFtquuzsb3NuaKPpUmN/4v8/MDI58mDDSLvz7X6l2neshZTIAVz4xwsPe/Y?=
 =?us-ascii?Q?3hCpA0CAkChulkFTOt4t+kOFYLmpnU02NyvuPZnIugMW9eWb4JZ/2ltjWnsf?=
 =?us-ascii?Q?Yl9yDxNfH96JBQ6Qxs+W/weZgtzHvhwFWiISs3lYlP0F+3/Popo0HrYFQTLv?=
 =?us-ascii?Q?i1gViXavZu07IOVXGlX6osOg+M/SWjwQKzSP3ejSqHEpUWCZTnNXd3jbV+qt?=
 =?us-ascii?Q?iu8DDclUiKIM2HXrUNFkPCLv8QTcuhMpt3C/gEfgp24ks4Lzb61+kkwUthnW?=
 =?us-ascii?Q?KA+XHJb9QIllcstFgKWf9g1jyC5zyvTSwbIFuKJ/enpxPss0r0WcdtEF72TO?=
 =?us-ascii?Q?d/F0ld4mj2ePEhJjkxggn7FqPOrsM06G+I3Ufs1FiOpcqqpn+aXg0S87LAxM?=
 =?us-ascii?Q?LQ+vMnk5N1gk6E+elZ1NBUI2APaQ0NPLbGcYxQuoB4tRXUMHdwp3uWW8lP8+?=
 =?us-ascii?Q?OXrXzVm22fmDIvmn5h7d2ix4avxOrev9MpekjXC3wEYSuRhKUHvQeFGhlz9A?=
 =?us-ascii?Q?NomsYuLJGwO0Y0elhtJETewFDgbMrIxToov8Lo9feWFfAYMXtCgqGxSPeSXb?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dac2b42-27b4-470f-3287-08db841c9127
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 03:44:03.3736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5W3hpxe0eSay9LQCraDFi4eSl5L0NqRKM4wF8sASKSUKd2/56feEo5LOjwKerozrmint+22xdT0b3mm8Zb/ZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix BUG_ON during bind with
 prefetch
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

On Thu, Jul 13, 2023 at 05:02:22PM -0700, Brian Welty wrote:
> It was missed that print_op needs to include DRM_GPUVA_OP_PREFETCH.
> 
> Else we hit the impossible BUG_ON:
> [  886.371040] ------------[ cut here ]------------
> [  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
> [  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m
> [  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
> ...
> [  886.371517] Call Trace:
> [  886.371525]  <TASK>
> [  886.371531]  ? __die_body+0x1a/0x60
> [  886.371546]  ? die+0x38/0x60
> [  886.371557]  ? do_trap+0x10a/0x120
> [  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
> 
> v2: add debug print for PREFETCH in print_op
> 
> Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..fc4d54425160 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2230,6 +2230,11 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
>  		       op->unmap.keep ? 1 : 0);
>  		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		vma = gpuva_to_vma(op->prefetch.va);
> +		vm_dbg(&xe->drm, "PREFETCH: addr=0x%016llx, range=0x%016llx",
> +		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
> +		break;
>  	default:
>  		XE_BUG_ON("NOT POSSIBLE");
>  	}
> -- 
> 2.38.0
> 
