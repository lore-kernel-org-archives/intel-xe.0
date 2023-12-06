Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1024C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2BF10E129;
	Wed,  6 Dec 2023 17:42:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F9510E129
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701884555; x=1733420555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mBp7xXYGElLQcsa61vK41AFONhzpagzuNGox/QcJNo4=;
 b=gJ6Zm2k7/dYF6l2jsPJ1VjaoMbJJ88Quu3TnpBSES6CgXkfxKYiG1y9Z
 4Fu1rD7RL5IWTjxKxu9FrGW3AN+PIkX2oyCVmpewdES4z71KCXlnD61rN
 hgy/HxpHemKn9mzz2WG2QafdKXBUEZX80R647erxwQ2IEpVJqWvv84jOW
 jrAfWHRqyIK42M2dI+3qkxcOpd/R7uCCArUTFMWfO3Yz/HgSfImSlv7RA
 I0xc6RXibH3B1o0DxpVo0QXdjpx55LzWwIQXioWVWtqKg0bVI9sMFDLue
 B89JYh9TsK38TZ257CTiMtm6slpJxZ6VeD1csCVNS+X78yndE5EnjC5Zz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1168312"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1168312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:42:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747676633"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="747676633"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 09:42:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:42:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 09:42:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 09:42:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewY2f2eqruw2LBIMvNkJ+zXqhV/rTmSGyYQptG06XwFPZSAKDn0/r+R8lknagDswVTPKn0qNL64EriiEdiJyVJ2MHuqAey0n+YGlF1xdz1KyHevX7zsFTMjTowemHzhFvNTjEnN3l15kDEDEV/yhDgawwawXzr752T9Jj8y732lX2oPWcCxdIakyyOvokugcvH2eW6msRIeLSfnSqlvOEW/zs/edxVeZopAqztoiGgzZbp9txda7dVJyV2oq8VE0Z7eO6NlLE7x+1Jxl3xQcnNL9jig9LBjRETJNqdDVkO33KvNDfHoAw0iCbdZmiSjaT2pbakJrcUviweIH7zV8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYshdo7XqZYbbsIEpjEHLHmHcmEF3iEYpZMggU8Fpnk=;
 b=Q/SR9Qy5p8xLvXrnl/7qXGfF6Xd9D6V1CxhB1eGKdE2OImjx0iNRZAsDp2qlKF5xaiJIpU0SEnEpArEUo2thCnLXkw0kN6Pu3k9/+9hKFC1imrj0/aaTI5aNJKogKzWfDRbPwcPyopdZDGVlc2AW5R9UN7iwTTapPaxo//Aa6d47ATGZyYmRp7CmtGQObGvqSmQBLgSvtpYd44LKfZhOtP3atBnke/ZrTSXAwwmpvPACIS11WPbay1RxFATxY1J1Q8kNqgcnB2nwlgO4DDWWBRu3Mc8akVqwYj42EQ8NLaat0w35ZwMts9xpw+U9CFDbI79+YkXYeQgfjL6rq85Raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 6 Dec
 2023 17:42:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 17:42:31 +0000
Date: Wed, 6 Dec 2023 12:42:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Message-ID: <ZXCyg6rlskWo9T2P@intel.com>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
 <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b53d06a-85d8-4b88-ef8b-08dbf682b8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKqjp5a1VpaO5k53AagXveUiOu/boTUgTeBWIXd8smQMTsjUigG0bKqRi7VzAGchGAZ1HR48G+p3Zi7r7b1k8dsUM5pEPa1lrIs2ARjl+jm0QbxKKw2N+5pgLZuyFafrzRS/x5GgwgOVMg5tWsjfgWTmJuvTUaXDhzaeoHkOTIxDmm+I+SVg/k+WSzmartWtr8wsvTXtIusGIcD6uhjMnkdCCUNTZ7Q27Sj30D9sQFIRjzP0Fa7jL1NfSFDKWxikx6QLMFoaRBvAxYEpAGC7qbwlQlBB3TcwGJwApJtFkkHlJByiinUFBiNUTAU9TvALkwhWTyOwonE36vBwwrXpWrtrArJ/9/Talpm8rmpWskSNOCh13qi4RpNIafJJqOfqXDSWY0I1AyAYWBUlqGiaegrxIrjMy09A5rxX4ho4TFS1fqkuIevsqjCtGw3NfRuo96NmbDMaYLQeQ0oXp+lsrHqUdV9wZylduKM30NFn3Pll6bx2zRc4pndqJ6V9gLB9VCy/F/3rcmUjB49akDD7d8h8kEH5p0mrtQb+x+u39r+OVcUwpYhh6xQCzgvSRKzN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6666004)(8676002)(8936002)(4326008)(6512007)(6506007)(478600001)(316002)(6486002)(6636002)(66556008)(110136005)(66946007)(41300700001)(38100700002)(36756003)(26005)(66476007)(86362001)(2616005)(44832011)(2906002)(82960400001)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZrWX3Vn4vz9ddwMBOYjTHbX5GSb50ifi15hguP0PQ12x+mkrD/cdZwQ8Ec1K?=
 =?us-ascii?Q?7FnLgQCpD6QZm3Z6QrUqALX6ZYR/fSylH6y1DBLElkqXDCp/p68TZYuotCyG?=
 =?us-ascii?Q?mtld4u5jhFr9xK/BenmFAPJSvNZPtNYAMnCcCi/1Wt+yHhLohji+eEzQ6jSV?=
 =?us-ascii?Q?FvMN9+rrU2eawx8eykkkxaecJk9sJ2j0ZZrYulsNYRLyMVj047UDUA1eceqq?=
 =?us-ascii?Q?n1p0i9jq08bw9z8l1t5rkwKuqzEuM4ZnulvN9SjuEj/5y/xzBukFIOWOQWbq?=
 =?us-ascii?Q?QbQZG4pCk+tIALGJXWIZ0Qx1UgFWL0uUtXejivG33NO77+du38dWfrfCvTox?=
 =?us-ascii?Q?pvlLz6R+7WP2R8q+mFjaTanJ2L/vfir1AmR4gcfNJ4g8jTYRGy2tyQp9Prhw?=
 =?us-ascii?Q?XUSkQw2GyeUEs59r2XHGPDO0buX8QrpVnfCrl4uZPQshahPU+W9I3/X1Ja2q?=
 =?us-ascii?Q?W+dJH6WePgaYnhDUNsQE7njtYCtcJyvE4/WF81spETqr/iyOUiKYHyP027cJ?=
 =?us-ascii?Q?lZ/HO2r0paqa0CIziJMpkoSo6Bipiga+jvKWeg+UcaWnuW+hseXnIlr8R/n7?=
 =?us-ascii?Q?+7DLxFPSOZBIsi+bNh0RvwSvWBDkQzqf3GSr9oieKYaHyqCDtcXmMIxPz+LL?=
 =?us-ascii?Q?TLPp2AE//D687sZqv+b9N9fMhGt9ou/Fa4n920KUzjfODxGv2guta0970l/m?=
 =?us-ascii?Q?YKQ/VFUd9FoIN6hkGFeOuSAmY7BsAQAMMNlb8QAofr4TdKsOggmpyvnodAU9?=
 =?us-ascii?Q?rWuKdXWTIQ7vUjIZT2ZMvGZoJMgFLHwblBat3gDQCg1+s53MhIv5AjekQ2oh?=
 =?us-ascii?Q?YK41NWrlkjmU5q81HZIixWScgkQPjiRM1CnPdbC3Z2/u/CJHFqG10yvLQTbF?=
 =?us-ascii?Q?5EWn0ccK7FOFrc3kAT6AsUFE8tfeT2GnCMqidh/Yk/yVpBXt0/SMvkbGzlfP?=
 =?us-ascii?Q?m1K6pfNZBzu/dXEmmKIDnmjE+RRpLNtVeaWPWVZdJZYv8a5fdI7l/D31emVE?=
 =?us-ascii?Q?Ph3PmqSVFW+/slfRDYgVAJquPntbE3wn7MtpeMhWplEkZhQP/rxKWOy7tPcD?=
 =?us-ascii?Q?4IaNo6rvLE75h6OAPJAMRUc9uE+TdDjvAJs1k8oC666B5NrgG3NC8R3g5TzO?=
 =?us-ascii?Q?nTLj0ADbBgJ4gSagUhlm3cREs0tvtEuBiHDTNBTNfr10KIGO8P2XtYT+MZct?=
 =?us-ascii?Q?5bXPt9BELjR64ld7V6PU1fCB8jueZnQT8bVygBP+UwDsSyrkJhK97LQrM2Zx?=
 =?us-ascii?Q?9uhCiPJ6K53th3vI/BEIe5fZm1b/EMC2boJhXcIBho23DXvzb93P8nG4ToTX?=
 =?us-ascii?Q?HtnfCAQ80AJIfkiVCszzCq6AbolaWeGgeA4U8S/VOC8S6ctp/UJZqEAf0LUo?=
 =?us-ascii?Q?YJDhySvZ1LGlkUJniHxNjKiSEJoxhfwyKvfULOCtvsabO/oAPbyoEQhYxX3d?=
 =?us-ascii?Q?Hrg0Y8gUH9X1hB1IpVFjw0xTPfs1OFs5+ptMauVs4hQyeWiwOGOitRlKp5Xq?=
 =?us-ascii?Q?NqQVTl87bntjAB9v42PJECHQeF0Xb3H3I6U1EfmbsjszpV4fgLSAIlZfEXuq?=
 =?us-ascii?Q?Ta5xktNvlWoQ9eP3+Pb/1fdH14xqSn8QNuRVtdgODaGap7b3w9GbQbTIr/13?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b53d06a-85d8-4b88-ef8b-08dbf682b8ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 17:42:31.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dwux9uwcjqweJJlFy5ogIgcNfAcvhYiUflieoX+tiTTfy2LCbkCt41lhwOOJi9yJOUkO3i78r7WCEbWrazra7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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

On Wed, Dec 06, 2023 at 10:33:35AM -0600, Lucas De Marchi wrote:
> On Wed, Dec 06, 2023 at 11:26:18AM -0500, Rodrigo Vivi wrote:
> > On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
> > > On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
> > > > The exec_queue_set_property feature was removed in a previous
> > > > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
> > > > longer usable, struct drm_xe_exec_queue_set_property does not
> > > > exist anymore, so let's remove this.
> > 
> > my bad, sorry
> > 
> > > >
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > 
> > > should probably be a fixup to that patch? Anyway,
> > 
> > no because it is in the uapi header that gets "copied" by the UMDs
> > and IGT already merged and Mesa likely... and we cannot do fixup
> > on their sides.
> 
> wat?
> 
> any UMDs would just copy the header and point to the commit it came
> from. It doesn't matter if we used a fixup or not.

But history wouldn't align. If they have already merged the commit with
the sync pointing to a kernel commit that we do a later fixup, there
would be a mismatch. Anyone looking the history in a later time would
think that the UMD code was wrong.

And instead of blaming me for having missed this line in the first
commit they would unfairly blame whoever authored the UMD patch

right Jose?

But I would be okay with a fixup if that is okay for Jose.

> 
> Lucas De Marchi
> 
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > 
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > Lucas De Marchi
> > > 
> > > > ---
> > > > include/uapi/drm/xe_drm.h | 1 -
> > > > 1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index dee750385161..346007e8074d 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -53,7 +53,6 @@ extern "C" {
> > > > #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
> > > > -#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > > > #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > > > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > > --
> > > > 2.34.1
> > > >
