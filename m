Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F86DC77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 05:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B7F10E3A1;
	Wed, 17 May 2023 05:01:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFDB10E3A1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684299691; x=1715835691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aUDX2kfyPYu17nd2w9wxJqc12QEmF5zNLOao9jpFDeU=;
 b=doA+7sHhvDukOY9rxMqhDZbgAF5YTqK7Wh2L9MapHl8O/eHQCBKSNFRP
 GbWr2HhUQjIG/Gw0/sXIu5grHuH/5Hj7wLaTfK4eqjk0p7e8qFwJBzekK
 i4SpHqZ8WUhK0bTB2xmFVs2CVO/CzOAS7xPlkT9GJso4T/MkSIT2+kGNO
 R3HF40QT5mnzkUFdqhMg/WpZjtfhvFxSkjQ6lcD2XBV6QdmV7jI+Pb/Cp
 upPws4UbcKVZYeRFEQfLNVJQgxEGoxT6OCyEdtzYR3IrvqzbPf0lm22Zi
 YLogNiPLjQ1pJsPQTEZEctpSHSKrDIkjGZ0WZ1hGD6UIjZLiTu0t1pwkm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415073767"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="415073767"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 22:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695727737"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="695727737"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 16 May 2023 22:00:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:00:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 22:00:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 22:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFbasw5Ue7FvXV7AP7d0jq9w5+Lu+F0DRC8kpXUhBeUj+EUD20MuPHT6wOAHjUp6UCiq//bnU5q+xlUohAoRdDJQyG8IFlzUd9Erb/G7DgTU50ryYO+Zn8sZiA9HHweXWsjH42svY6l9B9z2xLhy6arFt1MvbsGtmeYe46HZKFaKFOgLOVdokbkMbGm1ZCf99bolYjPbB0Jp4a/Vt0rRP14BfDkr6sbar+LkxvMySD6BbCgap1yj9QUHpk25+kTThKFlfWwT4jZWHVyl1P5yaMMZwg5j9kMZDsu2apRNehYltvdqSCGqFO9vPeF7G2DASvdTp3AzSOOKt94h/EC70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXbvoi6i8KD6Ou9uc88bGrUmzwFl8bYft2q/FMT4Cno=;
 b=XxjmmK/hfNp/oPK7P0OpiwY362FgjRjIIb7V04+Q6gm0guI1P4OmIB+1X2UZmVoUpPnYldEKqWriE58JcPgYJhuHTH19zNuMkKlWBlZdkT/XxPQoEQCcHHnZ7fZxBEhjTKavFtsOM3AI5OReIuCPnlklFDy716TG8LNSJuwAlTWge3DCR1XAzL4pC32rVrWAb4d2/eHt9r5rhuxer9I4IY71WTyYl2EqNcNXmdS7I0BBZIpuBqUEunCVOOHOMcK3mB6bL5aRc14NQ3rChSxbY0fgXulucyFz862UWS85FqRh1u7/zahdX7SMQx+YmE7bTUSOFwM7xtX3+e+Iwcjhxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 05:00:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:00:31 +0000
Date: Tue, 16 May 2023 22:00:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <z7y5a2lvw22pfoozlipcwqd4ewertbswyieyddsplhi2tx5qdp@pse3us6mfmy3>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 183e3398-8f97-4008-87eb-08db5693a3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/EYgSnEBdhEYfwLUOUYO7qiME3cnIy57GCGgNfJfynSmqzCI/feeLmtfPozIvJQZLKfBsdPsPRqauGP5MO78nR42WV9C6rSurzjb8KZd6uhQQJlIvior1ILXWrleu/4mGLyBjAC4A/2GVYCvY/ciSHl15NKENf8AOLOYWLW7RqIVx489APZhknr83wm+x4tmaMxIYrgErRyphK6d+p/w2PvYP4TJitCJCCBJt1bnOiMbPM9ka2SEyJi1Vyz0/YG7YzavfswcFGg9CE3gekChXiVlq21hPP1mfysFb3XtSPcNtCIsDkeKSAo/FIyaenCX+BElOBwXQDuXlJXw/EVS37XAXEQMNiH88gH2lpd6T03q/+DF6A3QFsXWWU0BVWT6pIwKk2sLt02OlYHtY5Fd4lNd2E/U6+rWEZZKFdUP8XpfeyqPOVPSa6vkXIu9GEXvBhfkr8qi6oba/5+1rlOX6w67VFtClO89CaRKqYe3f5mDuRC+bGdMZ6hffslDLL3HFHGH9/sPFUBFjNkA0BnK5Bxyj8SNY7KsK05ja0gXy04RHT19qfyHtf4B4jEUVWC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(4326008)(6636002)(6666004)(33716001)(6486002)(316002)(478600001)(66556008)(66476007)(66946007)(86362001)(5660300002)(41300700001)(6862004)(8676002)(8936002)(6512007)(26005)(6506007)(9686003)(186003)(38100700002)(2906002)(4744005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YG1RdUEQ7mbPLliiM3WVdxRZQEMwMUFxNa16+347ZWVYKWWc8Dg5ZNeZSNw5?=
 =?us-ascii?Q?ROZGvVwW7S1lt1xYDIZiXX6GowmYWiR0eSwBZwb34yzWh2vhR81BzEmUhaGG?=
 =?us-ascii?Q?Ft2gfNTHAoEE91mXnmn2ld14ge+4pc2qIo75KyRC+UQwMf63Sr71cRWUSbvg?=
 =?us-ascii?Q?/YRKrnyheoZBBWon/I3Exc7zp9W8oDNL07iG49KthmIZhqcElwlzIZyKudgx?=
 =?us-ascii?Q?1VTBVHSWJDWb0g/Gzs8BsN4xfLbFJzhZ1xIWEIEqwsD3jvMd5VsRBwW/fxnZ?=
 =?us-ascii?Q?T5Kdzb4Gv2tMHJIvjKu5G5rJOZablAjwIr7SJ5L/PlzLh8/mWxD/68u6O6ld?=
 =?us-ascii?Q?zhJ6FIx2Hdg3gLKz1mxm3NqGEK5BSNJmRvbVF1KCBnndwBg8qSRTCh6NbY+Q?=
 =?us-ascii?Q?BVBlMc8eqTl/HD6PidAf328W69J3XaouHtjGMT3NsKkq5z1Jsnk0yL75Pk+L?=
 =?us-ascii?Q?hWrBjpWi5a1mylqc7qi5KixlDauJZ4XAxAJR9W9lF3HeZpaTc2kCQHKkbiXv?=
 =?us-ascii?Q?iRr2ZyaBmBg/1oUbvQYgDzHf/WyGz2FR7Ma8W+G6VBIyTzfcayTcYR/uGO5p?=
 =?us-ascii?Q?9SEqtFc9X0TDCta/3tQ3HOqvqHnSiMTEfaeTvd4s8I73mLHuMrdacGN5p8A9?=
 =?us-ascii?Q?vFuPJbYf40T3M66KgueyE0rx/7VsMF1O1diLw2TJaJj6aBwLG+CLxT5Hz2xy?=
 =?us-ascii?Q?Xn34h8aAHos48VPJJ9oQrf9d/2jH6DLxpd0JRzXtir1XjvOO8793Poizt72f?=
 =?us-ascii?Q?9831bR3xnpcQilHvuI5AwJ8/Tg+9OlUUBNJv30AAm9AKwWnThhTHM9ykzXYN?=
 =?us-ascii?Q?PX+xgrDCXtm3fh3MD6ZgY5mBow0+bFQidjUPrxnXOXbwXC1sS6Mcck3juMTL?=
 =?us-ascii?Q?oSmvqVp3qfrCguGddsCf4Npn0JqAtTalljDf11srJe/qomDUWJrb+xX2D8rH?=
 =?us-ascii?Q?bUKqne5YlrRsSXOYZEY6kRDJfWY88B1VCoa0fAcsb+WVinZopZmHNJFqz4aT?=
 =?us-ascii?Q?1tJiQFtG7BXQ7lT3ltDe0Zd7ylyoAcf8ewlKyuWXKGNwhnPv0wKvwXtE3085?=
 =?us-ascii?Q?v/O9TS17/veLI5IrFYewDCL82meFkwQmiYFNsC1A9DXUaQpkOuhGZkAStfNG?=
 =?us-ascii?Q?DYq6WQyks9U1mbR+Er7L2kCezQn1+6vNYYSirKjSzvPSurecxhrE4mf5GSBJ?=
 =?us-ascii?Q?n8H5RirtgHYOm3YO5zuZKBpOpIzz2k9dxnE1NXjT1P6zHtwrW6Q+yOiBWsYJ?=
 =?us-ascii?Q?YMNamVTGwTLI47mWUjtH4LadWeXKUpJxjtR23PUAbB38vW75LeP17KI6/DoV?=
 =?us-ascii?Q?na6P7XBU6F+V8siNMP/gZFHY26Hm370k6BPbZssRIoOfXFPuxmX3myrc8tn9?=
 =?us-ascii?Q?ex+k7WmA5roAedQS3QFi68Wsdwhn5jxyMm8j3yWHXyy33rafdtYH2lCCujRr?=
 =?us-ascii?Q?YQ03Rh0fzHfw2efcHiIZJH7oUXN//ir49sWc4W1BxkRcpRfCm/cAPayMOMPy?=
 =?us-ascii?Q?+Ng/f+XU11PLC6YfTyMgg3NHAk1L1NGdrE1f25ielRCjVkCt+XnL7RXBlcfk?=
 =?us-ascii?Q?013u+zUaunYJwah1T+u1oXj+imkjgxh9VTlRAccp38RrYN7Vq50ssRUWUOMO?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 183e3398-8f97-4008-87eb-08db5693a3af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:00:31.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cha8DUQSMi6mprR6MJ1Y0qpp8zQapbV8AjUE9CnRIMbhXyxxBoYcr5D/PPYfDFcBnLz70A9zjH/hlaC4G2XIX5DDAGhXzBsIRJ504Wv49NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/26] drm/xe: Move migration from GT to tile
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

On Wed, May 10, 2023 at 08:47:04PM -0700, Matt Roper wrote:
>Migration primarily focuses on the memory associated with a tile, so it
>makes more sense to track this at the tile level (especially since the
>driver was already skipping migration operations on media GTs).
>
>Note that the blitter engine used to perform the migration always lives
>in the tile's primary GT today.  In theory that could change if media
>GTs ever start including blitter engines in the future, but we can
>extend the design if/when that happens in the future.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
