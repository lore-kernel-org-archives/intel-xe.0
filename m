Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8919DC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2A610E230;
	Thu,  9 Nov 2023 18:57:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412710E229
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556240; x=1731092240;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TtYjZhKbAqyuUXZZHAiNFQ1dqn3pyV1aqiVbsRpQ7xA=;
 b=BiAdJ27yDZZtUPgIkC0XSbwP9kf7o4e5gcBga+210lis3kDPUyrO0Crn
 YLI27gKrGZx2m728CJjgagN9htFzllh5lN9rA3lVzWABLCz25HjsiWDUo
 sATjhTlVD5fwkWbc8ep6NcVS/zPF5q6pBBsVB5KqiWJ+qY59kgFEW0YZ1
 6KemfjzvW1xZVgd55oSEfW06hJ3Sq/d62VLkNNRBTykFZFMx1wPJdFek3
 GFerFFbV1NlbKrsE2CyNzXdrQYwtlyyxyDWCPTUZO+0gjSfLLdoXnRCfS
 Q3CmKOqHtbOWDaJHpzpY2n+iKMxBElrpf4wg7eJZqlKKzLKuMHC8EZcBJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380446150"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="380446150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="4638405"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:57:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:57:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:57:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:57:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:57:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILcYUd37ISxVKsHN9CbQRVEnHOStzuS+T+OgKnpK/42ECDsZs4nqdf2QvP79D8nL1CpJFLV8hNEVgHbMUFfpPAWJujU3tORKzHmZhqpnAuywjUvMN6OIISRInqKyNxL/rBTfsMPiHWdPaG/O8dhyjw4WG2p9xig9qSDBsQ5t2PXlTAa3hgBfZ4JmStuyYGPifh88GIQus9AGeO24E9vmPI2B32dOZNxdW+SLvQNuX5hEjIF8ToVkbBVD+lj6r2Cs66a2iXcxA2+5sW9G997/URao6alEZQHbLUS4paFjnfihpVJuHwqy0szhXRygOyQwMzZ5OL3ipucRXnQVWnNwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZpZ0qleQWbtutCttActVhEt1E+HhbkpjCSmbO8N+4I=;
 b=QpACo5cfCp/3dP2wRMpfYFo7Ls6tlvBwgAmCJBktGtPyUXYswqvwor9xktiHZogVq23pE7aQIANKJR+UiYvaw93rtxY7G/w2mCF0kwaY08+RBwFES5+BTP8K+baNI168bIr/mfoEg1qQmvpcmNOAssx5wvFulRva+eh4wPGN1LtYdA/u9JeRfh7j9Zry1PXVpEzhu35/sOZT28xfMSXIbXbuCB2XjAwtpqbxgOvibIbP0cT1AGCEQHw+nKOqf3bQtcaAy498UtrBQsvGDNuIIKa44UPzcGIRWKtTD/dgcDBUPl8ukrKgCzd/gC+NPIlg1JZKB4ShI4YGHNV9vJgq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:57:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:57:01 +0000
Date: Thu, 9 Nov 2023 13:56:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ZU0reeajpBgzq9in@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-46-francois.dugast@intel.com>
 <e19494be-fd50-4aad-bdc0-44e9901fec37@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e19494be-fd50-4aad-bdc0-44e9901fec37@intel.com>
X-ClientProxiedBy: MW4PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:303:b8::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 449e5f2a-f576-4ee9-35b4-08dbe155a7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qOVs+lKAcZYrvyxRnMSaQlgDTEJTRWXT4b6dhqzGcfYWc0QyQbjN74SHn2opIz7WeDM/f1FbCf5/89ZYI9PXmcXGf3CwsInZ83147apGzgqvvxqgvehvK3g6jSRQ8r8Ihl85Isu8SJ239tn5T7yM2ywbiOYQ+eBw1BZhLN93+MFXALoFtHV5Jrye1/R4F8KTQzxS1rIqPVCgMM0MFqOtp31AH4vMrH6GgksQR3QA1jwOMXq+0BafUbDaiBjVLHAbFxpW9gwmpCJW9T7jVl9JaSVOavmLdKY8+smID7sV7GZGSpNnlCOc1T91N9z9zjVcr/z9h7qMsYLf3uVj6ncXMGbTJfdOctDfi+L5tECPU3VQm0NcoMbMt7rJo1O+uaA21ox3ez+sfRBXMqQhOYc+wkJZKXN2xkuPl+rB/IaZw4Imos6mw6zt2rRQAfbQvISr6QPvw4ujIA9QXxkF7Jj1RAqc0sk7AdA9bPe8oepHNlHRQhsIbtBM6cy5zQXjokIzXGnyIW+qE3GjNwLvvM0rEWGJn4qYfe86YZdMuKrgmEAXcnQkMZh483JlOWZaI4tR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(53546011)(41300700001)(6666004)(26005)(6512007)(6506007)(38100700002)(36756003)(86362001)(2906002)(83380400001)(82960400001)(6862004)(5660300002)(6486002)(66476007)(44832011)(8676002)(4326008)(8936002)(66556008)(478600001)(37006003)(6636002)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?80gGECZAwVpU8xLmqvyw/Tq0KHOqqq4nStgTGmDl7cxJTkaV9hi0pZDZaTVZ?=
 =?us-ascii?Q?XY8LbRRWCwJvu8b5YkbtESHvsgvF704tL6iXoZoiVoMM5b4WNZ3kpsbF7BkT?=
 =?us-ascii?Q?8vYhc6VESFL1zeMSpk5u64haex/7EmFlQfMkbZHovR6XBNfroFlZk0s/5XmK?=
 =?us-ascii?Q?bckPJfT5ksXklTFm+HLJaCgYMnTfTvQ8zIf6Z6w0GKbXL7iR1VdhnzZnf+E+?=
 =?us-ascii?Q?T9AVNOgtzt8GBUfIP1yOhi/gccjxpV4T47thaeRz/c/7jIllIohVk24FrAql?=
 =?us-ascii?Q?gaoN+MK10EyhwwJfIdK7dTU4FgGrQDtDz/KjTaiAbL+HPmqC4dEaFHrpU056?=
 =?us-ascii?Q?OU2+DnT5/upmmiuEH1SLS7nlDGziHWsI6dZwIwWjEMUsKSnlqkqsL3fHUe8k?=
 =?us-ascii?Q?JJNBAU8rIFk+r96jadUKmnJt+vZ9B/GRpEZHU7i/aFpiXuGCKq+b+h6QRUwc?=
 =?us-ascii?Q?e/QmZpqmEja9bHYhZwpmGT+NTCxR+UFD0Wf8L5tSu9pzFkUgbNz+32/hCv5U?=
 =?us-ascii?Q?ctnFoKWZn8HoJG2+rFNCjUrpW0odbEo2ndi7Y5lAMmOzJPeWOFcl/u3o8Noa?=
 =?us-ascii?Q?Bpw+tciE6R73z7VIgBYIdOPw6uWu53KMqFRX7oK6KYV1nyBX/v8vVM8B0kE5?=
 =?us-ascii?Q?qx+4cOuZ7IHWSzCuB2x68pnHTocuG7ggfTHPa3b/Bevy7Cj5f9sdBNXXMsak?=
 =?us-ascii?Q?3E/iRZFziSzuGIGROfbVaGBbGIXyxEzcNln0x0XqG/H1ZBiY5wHX5zPiFVHr?=
 =?us-ascii?Q?QV+kBHHPGxuxLiMzHCDNlb/YBhbTuDb+Rdrbg3+tfv3I3VqOIoH+fj648O60?=
 =?us-ascii?Q?i6BRNS/7giGJlo+9sc1SKh7S+LhDvqph3G14J2whN0prcE/O86wBw6fifjrN?=
 =?us-ascii?Q?Yxj/dHAzwR3TYyxHv7xlpVlLr7e1gL9Y9ABD3G8aWI+UTO7TonG55Lu0WiKe?=
 =?us-ascii?Q?K5lQ4F+BQ2/756E6Q2CiqX8Of8PsMo6vIBFXn6F4WlBfGdw5NSbBr4LY4jxP?=
 =?us-ascii?Q?OE3QYIcS5XCaxMrRQ/3pcWa8IvdUggPGIx4Y3Pd821xFNWcMdLlnChV1j3vd?=
 =?us-ascii?Q?xIyQHNGQxhoXdfZSwW5dbdl8HSEluXfiG/hJVR9RwoSr5bzzDk8zuJ4XyL+R?=
 =?us-ascii?Q?uYAnAs7XNvwcPkzvW0JCYum70vvxyopVXsLvuKF8TKdbwqSm0EM04pszBBij?=
 =?us-ascii?Q?MgzzEPJHlXVsrLK7C0M9Q+mCQhuOUSe7JSHdROC405Qlh/cV4/yiq366kWFq?=
 =?us-ascii?Q?9u3qqSxaWlx0fWLyNrDeV9xVzqGzPPym5NogmMT24XFBxuBH/8Fev7Y82lRd?=
 =?us-ascii?Q?mODn7JbajWdxHCjNwh4h609j0oPXuk1PiWaqPKvVVeekMFKWfknLwrEiMLmx?=
 =?us-ascii?Q?O4DB3G5QpCGdiL5TFw1mGa93+DIKccUOuzEW6/9qvGQ7QBUb3r5ZorN35SHO?=
 =?us-ascii?Q?wcOkedFKMScaOEQRbAYIOYgv+9o4VSVh8gZiCfsRgT8qhk+jWT3vc8U3IxHj?=
 =?us-ascii?Q?EZf8CK+n5Tl9sMyqLB2CvBp721aLd3eUZRfkFkiXheayQfZUHKZS1lK7dEc6?=
 =?us-ascii?Q?cxcMBBmLhs7ulwn3nIC2HYhZ8nb9UsDf8ze0GdlMeiPSlLTFpGWCrRQxWcBt?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 449e5f2a-f576-4ee9-35b4-08dbe155a7e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:57:01.0889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNIv31F0/0pA3rCxttTnR3hwKAnxFg5L6h1KQM3VZbZzXphGyebOjufxLKE0ADx1I9o0wTt04ki8F2V0V6RZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 45/50] drm/xe/uapi: Remove bogus engine
 list from the wait_user_fence IOCTL
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 04:05:54PM -0800, Welty, Brian wrote:
> 
> 
> On 11/3/2023 7:34 AM, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Right now this is only checking if the engine list is sane and nothing
> > else. In the end every operation with this IOCTL is a soft check.
> > So, let's formalize that and only use this IOCTL to wait on the fence.
> > 
> > Upon timeout, userspace need then to inspect the engine properties
> > like BAN, in order to determine the reset status and any other
> > information that can be (or be added) there.
> 
> I think the point of a per-engine wait was for long-running context?
> In that case, a large timeout value would be specified...  and then if
> engine is reset (due to hang for example), it would abort the wait_ufence
> early and return some error other than -ETIME.
> But as you say, understand this is not even implemented right now so
> makes sense to delete it.
> 
> If this is indeed needed in future, this can be restored again using
> the drm_xe_wait_user_fence.extensions, correct?

yes, we could do that. or even returning earlier with a different error
wouldn't break the compatibility, and then the userspace inspecting the
engine status with the properties.

> 
> -Brian
> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_wait_user_fence.c | 56 +------------------------
> >   include/uapi/drm/xe_drm.h               | 17 +-------
> >   2 files changed, 3 insertions(+), 70 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index dcbb1c578b22..a9d231548498 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -58,29 +58,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
> >   	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> >   };
> > -static int check_hw_engines(struct xe_device *xe,
> > -			    struct drm_xe_engine_class_instance *eci,
> > -			    int num_engines)
> > -{
> > -	int i;
> > -
> > -	for (i = 0; i < num_engines; ++i) {
> > -		enum xe_engine_class user_class =
> > -			user_to_xe_engine_class[eci[i].engine_class];
> > -
> > -		if (eci[i].sched_group_id >= xe->info.tile_count)
> > -			return -EINVAL;
> > -
> > -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].sched_group_id),
> > -				     user_class, eci[i].engine_instance, true))
> > -			return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> > -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> > +#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> >   #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> >   static long to_jiffies_timeout(struct xe_device *xe,
> > @@ -132,12 +110,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >   	struct xe_device *xe = to_xe_device(dev);
> >   	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
> >   	struct drm_xe_wait_user_fence *args = data;
> > -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> > -	struct drm_xe_engine_class_instance __user *user_eci =
> > -		u64_to_user_ptr(args->instances);
> >   	u64 addr = args->addr;
> >   	int err;
> > -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
> >   	long timeout;
> >   	ktime_t start;
> > @@ -151,41 +125,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >   	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
> >   		return -EINVAL;
> > -	if (XE_IOCTL_DBG(xe, no_engines &&
> > -			 (args->num_engines || args->instances)))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> > -		return -EINVAL;
> > -
> >   	if (XE_IOCTL_DBG(xe, addr & 0x7))
> >   		return -EINVAL;
> > -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> > -		return -EINVAL;
> > -
> > -	if (!no_engines) {
> > -		err = copy_from_user(eci, user_eci,
> > -				     sizeof(struct drm_xe_engine_class_instance) *
> > -			     args->num_engines);
> > -		if (XE_IOCTL_DBG(xe, err))
> > -			return -EFAULT;
> > -
> > -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> > -						      args->num_engines)))
> > -			return -EINVAL;
> > -	}
> > -
> >   	timeout = to_jiffies_timeout(xe, args);
> >   	start = ktime_get();
> > -	/*
> > -	 * FIXME: Very simple implementation at the moment, single wait queue
> > -	 * for everything. Could be optimized to have a wait queue for every
> > -	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
> > -	 * work with the wait_event_* macros.
> > -	 */
> >   	add_wait_queue(&xe->ufence_wq, &w_wait);
> >   	for (;;) {
> >   		err = do_compare(addr, args->value, args->mask, args->op);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 757e6da97f87..aada6f75b905 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1278,8 +1278,7 @@ struct drm_xe_wait_user_fence {
> >   	/** @op: wait operation (type of comparison) */
> >   	__u16 op;
> > -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> > -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> > +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
> >   	/** @flags: wait flags */
> >   	__u16 flags;
> > @@ -1312,20 +1311,8 @@ struct drm_xe_wait_user_fence {
> >   	 */
> >   	__s64 timeout;
> > -	/**
> > -	 * @num_engines: number of engine instances to wait on, must be zero
> > -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 num_engines;
> > -
> > -	/**
> > -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> > -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 instances;
> > -
> >   	/** @reserved: Reserved */
> > -	__u64 reserved[2];
> > +	__u64 reserved[4];
> >   };
> >   /**
