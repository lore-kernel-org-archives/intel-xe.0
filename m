Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153B8C636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC03D10E38E;
	Tue, 31 Jan 2023 19:23:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5A10E38E
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675193003; x=1706729003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fTUy3PHSaBDmy/xA22HY1XCzTL2DquCeNJUw2rY6hrg=;
 b=aFsprFoEa2v8odO16QsQC8t4ETUgKS05tc7MmhokW3nhKfug7b/G5nfm
 mYDEAxiBGthEWJuPlEO+FFhZuKkHpB8FG07b0FWfa2T7CezA3Ismf4JfD
 WCpp29zglSgYYK/VInLXfyG0laQ2D1CO20vZhOQEJyhNa0sTUxPJ7JZqF
 MtNDR4o+rc7JQbWDLbUMb4BzBz9vokzu7MXab2SbOt6Fi5CyjIlRUlGFb
 XM4nwvGqR/wF84TuATcHktOkarC/MSKVmJndpX6xZaNiVV2iPnX4IDSe3
 F7D5Nwu3H2EbJOUyfci7xZXc1lvdMyUecb3eMehFfPc3iZ0QZraRZcWwq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329204392"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="329204392"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="993393966"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="993393966"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 11:23:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:23:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:23:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:23:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:23:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGSnPQRUbj1KzCNsUqE7UontqwvEmR+8UHJvjzE2YNl9CwWKiCzgu9bp2EePEvL5kHAu/bftaidB7ChYLV02UdDRGPRAAu8Pe1VWYCdCU8nUz6yOmand3l+QTVCBKOecnG0X5Sq3cRzKnSPFnSTZHrbMSy8x46ioqVusxz9rFG4bqqPVqux10EA+SPEtjxCkIYHfEzoFBZMqVRBSV8jk+w5K0A0FvuC9qm8mlOP2SmVNwg70M8mO4NghttHqLINdOREhCCwg51gqYaGPeYbllBtkI3IVQ211OeE2vu6SNOLzxx3A5WNb2OWzbaBVsMrJdXljnHHPNIzMtDX5kIEsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddN3anriPmzyxA48QLsGhM/K7UGF9ySGdynuzFZIeqg=;
 b=GiT5yFQKPhj3M7zYK/K+QwuqQyXInuYXjPq5JJoxyFmfEx5PI8FtlwaufNlboSdeS9bmRvD1oLutYfS0sa6JKD/5eGPvNX8B1L4wb1ATiyzef0hVSM+Ue3bZEjx4vDoExrUY8HyArw+mxoS5HH6gAy9aNGUrWO2/pCFu0wim4LnPv9R0+FLw+rXfO9pO4VdtFl0wOizinVblZXlrolMKa9+UWxG03UaPIrKOzr7g/SQXBxFEGSRvEhysD7jYnbSv44sKMCOQ9E1/RKmo+5UoatNa85GeYWYzId4Hyi0r6XwduZntkFTPb4TNchPw5kfPWBofg3IvCi5s2VC72Y4E1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 19:23:06 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:23:06 +0000
Date: Tue, 31 Jan 2023 14:23:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
 <philippe.lecluse@intel.com>, <mchehab@kernel.org>
Message-ID: <Y9lqlnSsA3L343uY@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
 <20230120204426.68104-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230120204426.68104-13-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ed3576-5916-4f72-f7f9-08db03c09426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGsr3a08sJ6eUR451O69Gx5w9nIUza7Hat16Ces3/Tk9AyQ2pTIhsPOEgIUbQ/wtw865xPqmxbtQ1j0gRXmwHgVGJGDpzserC/Mzhkx+QzEHpIYmWCjhw7RqKpbKqMWJxO3j2fN26cH9tRXizHArUXbhSsjXWMMGodwxw3c6lx9MDMv2qMhTCn/6kOJixBBYD5JLmk61OG8eV+x+U5j+lLS5AK48C+Z+sU6D9xSvq4slKsq4gWUmRSbG8JpyTf18T3Ez3plGftmdx0TU/Er2V7g36WgxicZc53JMNK2znDSPldHde4KC6cw3LYR8oqGXIOGSlSAdg70/FgF7gwQ0zfCUsVMREVqRgD7VgLDEy2sOl6FiVUzC97sFzVHCMJRn280EOODdSiuwrMvGFesB+YLlqYXiaAH3g5N+gBqrrRvthwL7xVhhoMBWxPq7ESZtd19nwN1aZdcPPDBdqB/ZHVulC5IQGiLkSvgrmXVP1vGN2os/dEYJ0l60TL+JuRC2Km74W8hBkGMsRm0XG+9JYGQ7H1xaAyl3PBN8tCQdXhZ3LLsqV5cRebmjAuaJEnDX+st1JqtYp9w/nWRFahfsWWVlxgFeKb9FkE9/S4quUra8xdyqfQt+Q7OUH/rTnr8huZ546YM401AatRsdXGKlUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(4326008)(186003)(6512007)(26005)(6506007)(36756003)(44832011)(5660300002)(41300700001)(8936002)(6666004)(316002)(66946007)(86362001)(38100700002)(2616005)(2906002)(82960400001)(66476007)(66556008)(8676002)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?673m9g4niccmf1aD65UTfrpIweDn0HJssbQNlkIkdHHchjLEQT01/pOluAfI?=
 =?us-ascii?Q?0HLmf4xsamue9l1ubUrOigC4AjAGYagL37Tkl0BUQarJ0kWtFZXnUMJVuznU?=
 =?us-ascii?Q?I/h7EfagxWENg/+IXQoGbzlCe/UaOMVrEhqS4KdIJkMJBKPREClJMzjm8lUL?=
 =?us-ascii?Q?4FALltJrI4/vJoxh8ag2zWVequpTbVgEa5g09bb3Uf2MmS3FXif8IMUsl+NE?=
 =?us-ascii?Q?Q5b9V0XsMz/iWqRkPeELyeroDavkc7xU5XHL/u1gjjb1t6cm/bnSOUNfi1G8?=
 =?us-ascii?Q?knA0hTIaTCB4dncllm1R2njWPZC1kiZL8I8pMDR2OOdNRX6qWZn6PBJno58y?=
 =?us-ascii?Q?3JID0A5sIK/0Dqon+lDK0VmS3xbXqNpd71zwMtWbwSic7XLpaSV0KUOk3qVQ?=
 =?us-ascii?Q?kfixcXkS/gBv37v2tKmh+a+AMjzdhgj4VJunVsAN1JJRx/sD7ndTzH5l15pR?=
 =?us-ascii?Q?nI9oL/XMhMd6R803W0ofmhxEaDNn08IrvE4oEAdXM4cKzWlWFHOeeh+rMMXK?=
 =?us-ascii?Q?H3wWDIc+DaB2Y7w85V1yNEESZIqJMWHcgv7pSVbyyBEI2H3kXletmrgNtGwo?=
 =?us-ascii?Q?UvAY79FW7gZF8ywcUF2Y4ovjeadKEUzMYdG2xYjGLbAV1fY6iFvL11GhJ0Ny?=
 =?us-ascii?Q?6Ayy7OYkeguvWFr4z09eBmPxxh2Iv/05ZemXagWaWVMMuZsVAVm8vkWlMt7F?=
 =?us-ascii?Q?1qaAVXCe7e+OuTxpOwXujdYnZAPnkDBqXmSYz3q+gklHTH5li00kYaiQ3OP3?=
 =?us-ascii?Q?Oa7LEQ6HJsjJoJVVIPvIOVdSJ7T+MkSqRSriUIlNSR0NgoYL6ZwDQumm9mbo?=
 =?us-ascii?Q?Bcgbslrc5t0WLtbc4lCm3+t+n3R9uf2NjAkEz3/slJVnt6xoRmdQAX39RtgB?=
 =?us-ascii?Q?SVTspb8JsUAs1hqox7RdqXTPSgFrfolZrjKTSDMmh4i9VWSlfd4leSNw089I?=
 =?us-ascii?Q?Xy9IBj1b+UhCux2j2tmmWELkZp8jaVcIfiA3mpMzoWi4OtryRKg5ovIfxgEH?=
 =?us-ascii?Q?M+UoUl4TXWsBpjnsBRPLeFSUsl1OQGkZmDC4W0sdkToOgafMheIqbJLBs2D4?=
 =?us-ascii?Q?fXF9om4mhr3Lq2NHNWbJe0Vdci3TOlr2ftxS5kFo5Fxm8lx5NjCT2MdMuRnM?=
 =?us-ascii?Q?JrA2mqCZZ2o4WIpPd9slIn4VSDNuahLet/j0mSydSADIxGd2PoHEwrtvkLmX?=
 =?us-ascii?Q?9fANrG8AxpnUTk72pYgZLw2GEmL63WPLSW7HqvIv1C9e8ZRbDeSGJ9Z+b2lW?=
 =?us-ascii?Q?RZXbX9n0PVtUt6rD2eth8bPbKfTmNQdxXGQkKGAJUEsYmVPVdBa3bGF69UR9?=
 =?us-ascii?Q?++7eTKH9IAZO862fmGCY8zodoK7ZCv7k7PSU22yJInIXyYK2G7ZY8Dhktu6j?=
 =?us-ascii?Q?L220Z1/o0FSySa5hESfo5FxZUU45/BiWDY2cHGhJz80YXbz+h+6bLlTvIBiz?=
 =?us-ascii?Q?LzilTOiHC/NIYm09OjNl/7m7bwRXCdb4t4X2kIa9ba39cZWjXKKc/77s4k9E?=
 =?us-ascii?Q?qK4+ogzGZYH5t4xMKHjnNKNajQhbVmvuhWDPEu+CsCeW9UVJBUx3bAe8oUpE?=
 =?us-ascii?Q?9Xn5iCNRkJ36zKWzNCjTbpDT5G0UWaExJL/Mk8m0ALhIxl2WTLPNWzMlCoRL?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ed3576-5916-4f72-f7f9-08db03c09426
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:23:06.0055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GXvtAaEx+gyuA2Ar5dMAy42K/T7YGNt1bNN5OrzwGL76sA4hnVvV4ZV2KhbDCPU9oYpXA7e2pwRH8gi4+W9FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/20] ]65; 7002;
 1cdrm/xe: Add min config for kunit integration ARCH=um
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 03:44:18PM -0500, Rodrigo Vivi wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Some of the tests may benefit from running with ARCH=um, forgoing any
> additional setup on the CI build side. Add min config for that.
> 
> Tested with:
> 
> 	./tools/testing/kunit/kunit.py build \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig \
> 		--jobs $(nproc) \
> 		--build_dir build_kunit
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Mauro, may I convert your gitlab approvals in rv-bs or do you intend
to go one by one here in the ml?

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/.kunitconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/.kunitconfig
> 
> diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
> new file mode 100644
> index 000000000000..ce8a4348669d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/.kunitconfig
> @@ -0,0 +1,7 @@
> +# xe dependencies
> +CONFIG_KUNIT=y
> +CONFIG_PCI=y
> +CONFIG_DRM=y
> +CONFIG_DRM_XE=y
> +CONFIG_EXPERT=y
> +CONFIG_DRM_XE_KUNIT_TEST=y
> -- 
> 2.39.0
> 
