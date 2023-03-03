Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B2C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 18:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA7210E146;
	Fri,  3 Mar 2023 18:48:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF6210E146
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677869284; x=1709405284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dSAM0JZYcE6yaOsUkq0Za/LGaz8BjpuSxpotwjAaOgE=;
 b=WGnu+4A63rQJY4tQAvRb0X78E7ifQQ5tut7wrWQYtIrgAGPz82dNKYue
 PQuQh/ZWbF7RTZIM/9uNsBl7Wx1AOcLcIj19cH8Y7BDZW9VbPwdTz/1tN
 3syvXGDypKSpqDyyyAWqSOBb7UvvA04eruA+cBCI4I1Yrn+YiQBzkrVig
 F1BNpcBR/WNPF9Q1WZAuHQho/DY+0MQ0dhykpLXywUiERVxGRf89zALj1
 dC5Th/VNhO3QWxY25rvPbKJS9qw7zZg/L04fashk/xV9e02xVVOzB+4oW
 BlJcbrDALe3iBme5QgoCLgoY+JEv1UZAciyMZ7OJsxJV8Dnw87Izf7atx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="362721668"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="362721668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 10:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="625443190"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="625443190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 03 Mar 2023 10:47:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 10:47:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 10:47:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 10:47:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 10:47:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB43k0rhowRa8oxND3IFV2G/PxeTQ2zFqGN6yee0qmNjr24+qWxhFaMaco7hBJv7XFSkhs7jLNQSitegQhkW+rJ/c9ydqLh7HSEHxplR6u2q9bldsX9L5KnFGfSznTDizlLte7+r+cEhLhxwZFvpBDKeZZJ2akLAazTR+2FiTNoiwctXGBXI2B/cYZ7SDWCpepwlDkKlcAvRHHTmrxJ6YFaqOuRcreCrpJY9hPs+OG+YaiIURQE+a8EvPNFyJVKb4EG1SOqQGh+us7j2BBxnITSXpM5pOU3B6kzPOrlseRRg3iT9QbOqyzFj2TkthiZ2cNlZVDF70zUrs63AqZ6t9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSAM0JZYcE6yaOsUkq0Za/LGaz8BjpuSxpotwjAaOgE=;
 b=d2AW2insISjt0PVVorPiaMSWai153sEwiSscMvlI7wZl90Pz9oZSxUvXlg0G/VjFDLYuQP0PiVFgWHKBRf5xl1/7z18bjW2Mjavr7iU8KB2FU/HnPdW9BecAlZOCPJT8w8LvRmTZaQkC5PIps3iFlvSuGzmCEVinfVG11sBzTXElXk3TAEAAISTmVe3ThlL8ShFM6nhutPCdFQvXfmS28wwYjay1DQUI4Au3TJ72TPZsPSMicWGyvfL2YkvOXIyvmbaqhfqQcS5bWxYZ/C1Mx0xAdiA/NIcEBKkojlRwEwO9ZCscQb+f5exv0jUPIjLIjoYd23QuIOINRvI2JgJtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5394.namprd11.prod.outlook.com (2603:10b6:610:b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 18:47:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 18:47:37 +0000
Date: Fri, 3 Mar 2023 10:47:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20230303184733.25wvjfiatd2xpldf@ldmartin-desk2.lan>
References: <20230303145015.1018870-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230303145015.1018870-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5394:EE_
X-MS-Office365-Filtering-Correlation-Id: f645a16e-83a1-45db-6967-08db1c17c1a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uXHp1mwI8mzTrmlPvf15KEhXa7z2Fe+JJ4xs491dpGuIdJwCLhbz57PwhJFvSOjXWDCDXQXMwlkG9m6KoQYL6CwmhkFMXGVDhJg0RzQKIEYvgj0E9mQqxkr5vc3p26OryR2dUa5UXIWLdLW0G9bTKdfJNH2xUlQn6jFsb5zR5iJo6ax9U76UmBdr9c/Zh0VW4eX+lAbc+YgkBd/QET836vdl3MXfLQ2Hj5m9NCdI1ERgkQVjX6ZpxeeHRi9vgkVHr4LYbuwFq7T8XobnvPwP1jkCzDo5M8UDwuIY5kgJ9p2TvAUTuF8GpHVfW580GDpXEVIodttlR79rkuIHB9ABwwQFbPv7Z9WnW9IWIefYk6Mou+tVIq7hs7YGL9u8gM7TmMWyUtoBQe3faWoL6ephesmuyfiJBXhNie0mNyZ/Xgj8tBnc4RnrLc7AXwDCGCwBHhz0doL1sNaUzg1BO2EVu9M1KtYY5gEqkPZg5JQN4r6EqC3AWp97npHh05PbDZkveIyjWDcx78Jcopg3YFs9NTeeUPqgxS41bE7MZA1iNksjP1KxtJxVL1DaCk2cKlaIuRyvvP/RLCYAde3pk9eUiPthu0ekthvkGL8GSEzpuVTaLX81epXcp7EuQTx46fFhS5Jg5oyQcEy4YeXk15yfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(86362001)(478600001)(5660300002)(66476007)(2906002)(186003)(9686003)(6486002)(6666004)(6506007)(1076003)(26005)(6512007)(36756003)(83380400001)(4326008)(82960400001)(8676002)(41300700001)(6862004)(66946007)(8936002)(66556008)(6636002)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19d9kextiTsFoGLd+usT4Ui/JIfa1V4N+VOad3QY3JRfHtQvdKAKt4oEQBN2?=
 =?us-ascii?Q?rQ+HicPr4RoGZkRMwx2xJraotQkpXwXb0RgwJ+aNLD4nNHHnHrg8C0mcnnjY?=
 =?us-ascii?Q?L1JHaWJ60GN9iV5dB6WSmLBomMTBG49I6GQxzwxJMftXWraN7sWJPQ6gk6Om?=
 =?us-ascii?Q?TOUVu7bLSQxl4r0/ktgZd1sLnTmxfV7jcxhPXC5O8fIUp1KBCTw0pAA9y+rO?=
 =?us-ascii?Q?l1qh6T2cRlKx+QmIowAg8jUNX6GGUJ91CWOiPjm+ALixt1JFTC/N571iN1CN?=
 =?us-ascii?Q?d6zQ+qhVbyYEectXxhmAMoVOS43y1Vk7EYsvq9ipnTpZzXKJ2QrykDsGo0Qs?=
 =?us-ascii?Q?WgJ3A9Kq4D+oiQnlwXICCz/pJOQNQA8manC/10aupkkWkOAPXGk+ujnvr820?=
 =?us-ascii?Q?Hq5mdSlk1o5tJXtbMLIpN1gyCET/JGUVAtsP0dfdr0W8/beeC+t8d9X+bXp8?=
 =?us-ascii?Q?EA1TYd72KNX5nbT6qyGDI+w8AIwaU3wxAyY8E5yiw/82rjmwaqiqGTkljEfG?=
 =?us-ascii?Q?hpElYgfMQEwj12NZdnmIl2HxqR3aTNkZ1pwRQOtY12bReaGLaYJWtEEx1jFf?=
 =?us-ascii?Q?vcq7yIfebRVTLXbGFGsqsNwty1xtZjnjagmm8JZHOl3rdBxCl9y449RLYRp2?=
 =?us-ascii?Q?5bFr/joiCoy8EUFuMTyXmlqIJnlopqBsBOCp5EmTwjgnONm0TFIbip3Q1Awr?=
 =?us-ascii?Q?jtpuTJQooO2aJu+qNJJhcUP4U4hMMutGpnj6Ey6wRYNE3zIbLK+nSP6KzqDv?=
 =?us-ascii?Q?pQOBwWDnlZuFYYGvgybWx0tKacx8DTrALM+0zop88zOPqwJwiRpns6sH1tX4?=
 =?us-ascii?Q?qYpxt1cmleadynmJ/NEhQNIi5gGZKJIRF/PIySAZgmqIUa2EE8oxvZTddxsT?=
 =?us-ascii?Q?6fB4EvGxxudfSkIfHCGXqM21w+AQ1yEgAWX59y2mUbRy+2gGSJ1CF2B0f7li?=
 =?us-ascii?Q?57/raP5GGIaMWO+eY1GMDQJ5zEqsk75PXMDx8KraE/D5oHZ9+rJLz4sCEg5m?=
 =?us-ascii?Q?lIzRSIp23qadbcgEMSnnQbAV1squpScPGvWYUMxziRszJoFRehXHJM90c1e7?=
 =?us-ascii?Q?cARZgGSUgYi+nUHkqlVM+KmFtszAoi5PYXPECls5/x+FqwUkqtDRnutW7DT5?=
 =?us-ascii?Q?GOFQtuqSDF+tjvNk7D5t3FvxRzQ4LL17fspMbPcsLOlm41jDrSVvB2xsVMco?=
 =?us-ascii?Q?c3o7PZRwuuzP6fzIhDgk0mLkr7WWU7BDHmsp1Xpd8scebTcobAneLixJlI1p?=
 =?us-ascii?Q?XN8Qu/as5urm7bnvE0dQo8GyvfmzdkNJp4oacC9piII5nzfdgiO0p/wxWHjI?=
 =?us-ascii?Q?AJHH373ZICtUlJs3qu31JJEbDb/yXn84XZTaLysj2oDY0kF+v2QDy3j07wCo?=
 =?us-ascii?Q?QyCdeO10xuK38cQoQ8nqqEaKeONDTnMPP4tgN+Eaoe/3kUF1/aHjMi3x3WUC?=
 =?us-ascii?Q?T1vj8gtnZMYsmAZQlRm3E6FAkc2KIH6vtb1UYGdo0qNkJmVWrBAeIXehHsBH?=
 =?us-ascii?Q?IMiQhMORucdtNvgcvHyVRRduB5vq4M8x6vQh/V4G45wVmzb8VHBtcifktlHB?=
 =?us-ascii?Q?tBl6PnS5gEOfTKqowxGN1Iaps6Rteq8zD03QVLXETcv2s+55YDHgwc+VsJRC?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f645a16e-83a1-45db-6967-08db1c17c1a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 18:47:36.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9eLgWfnsUBPKhdUgjcxJAiVZvey8l6X3IbRhe6Y1is8T6kpNgoV5oto9AKDU0JJc1m6nvOOAos0t/Es5rCzFxMA+aeUEEzL0QWcs01ru28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5394
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/4] Split code between common and
 platform specific
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

On Fri, Mar 03, 2023 at 03:50:11PM +0100, Francois Dugast wrote:
>This patch series explores a code split between common code and
>platform specific code, which is moved to separate files. The
>minimal hardware abstraction layer is implemented with a structure
>of function pointers, similarly to what is done in accel/habanalabs
>and in drm/amd/amdgpu.
>
>The objective is to ease the addition of new platforms by limiting
>the need to modify the common code and centralizing specific code in
>a platform file, potentially in its platform directory.
>
>For now only one function has been refactored as an example
>(setup_private_ppat) but this shows already how platform specific
>code and platform switches can be moved out of xe_gt.c.

I skimmed through the patches and I still have mixed feelings about how
this is done. I think we will need at least 2 more places converted
in order to really have a more informed opinion on what it would like.

My main concerns:

1) The xe driver is split in several small parts xe_gt.c, xe_wa.c,
xe_pcode.c, etc and each compilation unit encapsulates as much as
possible from that specific area. The rest of the driver doesn't need to
know the inner details about how things are implemented. By having a
global platform_funcs set only once, you have to expose this.

2) Having the platform functions in different files means it's harder to
share common helpers that are specific to that area - you'd have to expose
them. In your case you have a xe_platform_tgl.h exposing
tgl_setup_private_ppat(struct xe_gt *gt) for platforms to reuse that
hook. But what about the case half the platforms need a common part +
a specific one.

3) For the ppat we are trading 3 localized, static functions, that are
only called on init / reset, for a bunch of functions spread in the
platform files. Couldn't we rather have a global xe->funcs like you
have, but delegate setting the hooks to the individual compilation
units? Also this is probably worth only for things called throughout the
driver rather than the localized functions we have here.

Lucas De Marchi
