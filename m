Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AEDC48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 13:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8710E6F6;
	Tue,  6 Feb 2024 13:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK3qkTPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29F610E6F6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707227446; x=1738763446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hAgq7GZ/YNS4HujVVxwE1leNBkRSfOZGCSJagmj69cs=;
 b=cK3qkTPwW6vryYw7GJa5W/iTiAtP4ocHEFwA7uQIb1aK3Yf1tPoJzCEb
 yV51YBlptb9VB+WDLkMC+KRwTqdtKe3gt9JEJ0Xag0XaDdRrHIXcDM55T
 zHacKYevQlhIqAZakrhLY/0sQlw4uEMN3FepO/SxIhAvtOBKo655pJs8+
 6bweqWf59VLVkbbxorNbgJVgyjz5SGlWgGR2KgByfZAUK/R2apo+Jywlr
 bNzOSfnh2H6F+kLHxoEyY+laQRMB8SzMm2HY5+RSVwvtOLccICLz0ic7+
 fcXrqi1bULSmUBCd3g5/avvvEvpEaw8uk4e3jujB6l+GRCkx7a+gAF+vh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="904079"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="904079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 05:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1008087"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 05:50:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 05:50:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 05:50:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 05:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiFWruGc5aCESu2lFEwayT3Ge5bx3zVFTlKTaPHAhJ6iYVqPWpXasGkJyL6OtQbsjtFQHXeY9bEmQdJQ2b5PmdKwIBsoNg9G1Q3IqwRoFHaap6mGom8EqPNk/JjfANvx/lh4/PrZ67ci05fGxn/KkBUjQ+NgFViQB2j8V39HixioBIagoGbxe4p0BSzWBJ947Xiy+CXQP5HLmVmo/daDXBUGQNG9RakL9bJN/f8YLV1fv6+rXw2JRP/1iwKX/s6+cxtemlEmCNH9J/47/4AxRIXhFjZrqdgO2czr5tXa/aHj88yAQ3i5ytzr1FYpTiSnTPt4qxe0NoBIaV87/TZ3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uXpY74+V5nuX4aQEvPgjpw8l6qzZs8BWx8c86zk8p8=;
 b=Juz7KIiIoS/ISYEYsoe34QAt+p+Pfxb4260xXuu+Pp/InixkZkI41FR78fnDuTvYYQmgsfPMHTipYjFeKpuINWT2xlJKiiOZJWwvegfW43Vz3CJwfML8zjzTSfOLs2hMTjDuYoiHjHGmA6vyhSJeGVJi7eMn5UaY0zHmlD+FqNMTJ5xdynedR74bRjhkacDXhBFPRNLy1BmilGMlYVGOxpQKwXt4WHNPlU9Rk6ydDxrkF/3H7XGmFp+Y/7JJzO4QxeorXaqTrwy2nBcBBgUOh5KvQblNMP131ja2/iz3RfqP72qAArupHP2F78gJ7G1N/PR4A5pKvHpxNEPTav/dQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 13:50:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 13:50:40 +0000
Date: Tue, 6 Feb 2024 08:50:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/pm: add debug logs for D3cold
Message-ID: <ZcI5LAt5W9BkLmfp@intel.com>
References: <20240206055917.2629027-1-riana.tauro@intel.com>
 <30bccff0-56d2-45a4-9709-34f3bd83ed9b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <30bccff0-56d2-45a4-9709-34f3bd83ed9b@intel.com>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 21155d03-aa76-4701-931d-08dc271a9abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1MG//0OkN+oMY7Ne8aVgPiulNypNRmBYI3dhlq+nK78ZMS3MJUqcCOk5se0zIQ/SolLrrOCC+FKnTYDytDEUUiZrEAbVkDn1rVsouvUL/Ie8a3P1bvTTPd32FVQC+GOrXfD4X205qY9UN1+Va2yDu/jdmZ8RNlnfhPu+ffOsRl7lmHZf6nNGmnP7gl1b3h9E3lfmPNcrWJk6ILvOU2rLnKvmlG4MWwbrwoF8iKqIG5UlOnOx1C4yGycAjONQAQMeIUxO9MoyyB5fClDd929nKw1x5m+HZMBvDR7DvI/aiakzYCv1BlHB8/J6TcjsjFeQbfa/vRUTxSVdyOyay6elT9IJTTfE56ulO/lya92u45w7XOt8AhPL53GVZAlT101p377HZB3/xX/vMM5KZ5YYzNsYHBV9tqit3oh3eH4mKznJM8it75gtvNhbhbJL2VuMpah/+Q0EBkFw/du3qtzRoKhQjZE3+5kPh7dDFHPUASo25k34m7uAnp8BkPy38avDdp7YqeAflkdfe3SxDIIfRjz1juaeuxACbOmK0dlLGsnnKBdAlZHMEGN/awFXMty
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(41300700001)(2616005)(6486002)(316002)(36756003)(37006003)(6636002)(6666004)(6506007)(53546011)(478600001)(8936002)(8676002)(6862004)(4326008)(66946007)(66476007)(66556008)(26005)(38100700002)(82960400001)(107886003)(6512007)(86362001)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1p5MIH3t1cFsr7dfMZFq22KqibJcAqswVzdclJG8zEZLNf29n0IjZseG4+l?=
 =?us-ascii?Q?300yA+pbMMuDvXCbCXmWiY7vOU1djY7cCjsRpk7et8naYtv3vmd/ZH07yR6W?=
 =?us-ascii?Q?vhoKsR8eVdR0vgc/ZcDU7bYOa+FxL4ENytVwzV5s8CdcTn6dGKrzePzw1/6q?=
 =?us-ascii?Q?C7yZ/A3pAbKGI+5Se2P4GuW5vr2asq0du71N0WoyZGz3T1gStWudmXQEcENh?=
 =?us-ascii?Q?qwX5ykkEc48jTRWzdHbDd8XGqxCnPJeIkh5kU1ngVvGFBzMKUI4bTSWan0F0?=
 =?us-ascii?Q?b7qOMlhUBg4BS2K2kjHCcjRNfHIhAA5trIoq3iijbRyWLX7cDr+1SCSXfGVH?=
 =?us-ascii?Q?jbhbYUmy9m3MQ/Urph01p7oRoywnm58o5NdYLwFUfnLH6U/vWioe2KgF6U5X?=
 =?us-ascii?Q?2fB4z2wk5sDw0RtVAc+O8nSbQW46AiDkcVaU+xLJViowkf727cDE79kr4WTE?=
 =?us-ascii?Q?dnkQ9jzkTbN3Oc646wE3dfyz8BZWOYs0/hoBTRSr926pR/Ms1sSHs40RfTP+?=
 =?us-ascii?Q?NH04QuMcGfPtWXq/AoxtgKvZAA0gm8cd3o99uTEaDI7EzR4Lx49u87DdF1qG?=
 =?us-ascii?Q?SU6ekH2Y+kb3G/kp+vBIzo7YMygg7fXE6G/Y1hPwrxI8F2FzmO1wSpX1nHIe?=
 =?us-ascii?Q?5b81jKTNTGOmh7zbJ5GSP/edXvSmBgaXcl+UMrQXaIRz6X8lItYyOkcsSJJi?=
 =?us-ascii?Q?U+l5HMB7J4zqE9Wm2z/Dz7ayQY2xe9N4PKQK936FSh1wU1LuJPrE02I5bXxK?=
 =?us-ascii?Q?TyVN009W8xIR+AEDBKOgjFzaf6XmViKDrZ4oyTwwRXkeYU30nFHsdsJWvIA/?=
 =?us-ascii?Q?XaDtnSiAHkLQf5dt1hHGQ4rd+Dn0d8SnxQMt+ENhIj6aeY7v6Ga3xH7/9T+A?=
 =?us-ascii?Q?sF1IpZhtbkC2qR74goQLgD//JWBaO9G6356mcm5icYCXI1HXf7528rJT0ZT6?=
 =?us-ascii?Q?TW1C+tgTOFjJH6j1xLTrvqL4FJAXzqTDgqFnEkcEvxxtGpsuy1qaXYx5hAZ3?=
 =?us-ascii?Q?J88LaobMIyuvBgS52YikjOxXnzYWZFVoOe8Aai4uvouawdlHprtHiF4W6L9r?=
 =?us-ascii?Q?lx8tS3vkOIWG8hiZObEeM14Sdc6P+M8v0u1itRdZ5XDVE0uy0Mdle20yppJb?=
 =?us-ascii?Q?5sNuuASzFvlldmM1I6t4zm0rixRVz8ZRxU8KKuzAZI47t4VRtoJRLi89xQjw?=
 =?us-ascii?Q?nnMElhqHPXsR4wq7Kvz2xn+Rw15HW9U9Yr4BGXVHJxHZiXpOsw477t+1xOzW?=
 =?us-ascii?Q?mJUhymJ9l/dHdq8rAWQvBKHOrAhwoMtJ7BX6vc8/yqAnHYzfaVXWURrmA6qO?=
 =?us-ascii?Q?8Ct01AjkucpJFKND6TGoc6w1S4WTtEm0X42xjLzum0ndS3uVdEW+KvyLazhH?=
 =?us-ascii?Q?php6ybcNBLkmL+RgwP6r1KCnrozij10BvjI9pWZmnDlNaB7iuAoKh5wTrz0N?=
 =?us-ascii?Q?NTJ8JxvU5ooPIPyF9FM3gPi/dQiIFUluzeqDfItv14Bnra9rRV4O8nFtukR4?=
 =?us-ascii?Q?U3Wy0XsxBV5SGUV5D5sKa6cWbOnA036KivrPBvJM5O7/MICmw83EFXCxhpzv?=
 =?us-ascii?Q?QWm3gUziDtn8xIHRYwDkayi5YOZY6hRfXsQVGB3YOP88IDM6GCZMT/2QV+KK?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21155d03-aa76-4701-931d-08dc271a9abb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 13:50:40.0497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+miyVx3GHLBQUTCEIpQuTOk2lAc/1AjxYX/loG/oVYQ6DkFE50sLLZijcMBpxbwjacOACozfdj0HiteXRR8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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

On Tue, Feb 06, 2024 at 02:14:18PM +0530, Nilawar, Badal wrote:
> 
> 
> On 06-02-2024 11:29, Riana Tauro wrote:
> > add additional debug logs for PME# capability and
> ^Add
> > presence of ACPI _PR3 resources. This is to identify
> > the reason why the card is not capable of D3cold.

good idea! Thanks for taking care of that.

> > 
> > No functional changes
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

thanks for reviewing

and pushed to drm-xe-next

> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 19 +++++++++++++------
> >   1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index d5f219796d7e..3d55ff77f7c3 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -125,17 +125,26 @@ int xe_pm_resume(struct xe_device *xe)
> >   	return 0;
> >   }
> > -static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
> > +static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
> >   {
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >   	struct pci_dev *root_pdev;
> >   	root_pdev = pcie_find_root_port(pdev);
> >   	if (!root_pdev)
> >   		return false;
> > -	/* D3Cold requires PME capability and _PR3 power resource */
> > -	if (!pci_pme_capable(root_pdev, PCI_D3cold) || !pci_pr3_present(root_pdev))
> > +	/* D3Cold requires PME capability */
> > +	if (!pci_pme_capable(root_pdev, PCI_D3cold)) {
> > +		drm_dbg(&xe->drm, "d3cold: PME# not supported\n");
> >   		return false;
> > +	}
> > +
> > +	/* D3Cold requires _PR3 power resource */
> > +	if (!pci_pr3_present(root_pdev)) {
> > +		drm_dbg(&xe->drm, "d3cold: ACPI _PR3 not present\n");
> > +		return false;
> > +	}
> >   	return true;
> >   }
> > @@ -171,15 +180,13 @@ void xe_pm_init_early(struct xe_device *xe)
> >   void xe_pm_init(struct xe_device *xe)
> >   {
> > -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > -
> >   	/* For now suspend/resume is only allowed with GuC */
> >   	if (!xe_device_uc_enabled(xe))
> >   		return;
> >   	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
> > -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> > +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> >   	if (xe->d3cold.capable) {
> >   		xe_device_sysfs_init(xe);
