Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CEBC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523510E2F9;
	Thu, 14 Dec 2023 22:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CD210E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591761; x=1734127761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GxgycrUTXBa/QTRAKEae1OYFYmZf1sQypNg7SpUc1Ww=;
 b=WZ0VcACeqZAFZ7K4CEBeVxQTpDz3BwGKbCzGhrHc0ljVI4EFCCP6Mej8
 9RHMihxVpnNgrjEkR3yAVDhriwf1Gk6c0ILdleWfyHDYnIEgpXIzvWBVv
 aWV90oWqbzBQ42XdRTNbaiOInLXH1vKNoT4NVez0kG9NpfsNYb7fhUSWt
 a6c8VauFXKam697EUsvIFiiilrHiz3Lgkv9U4iei6Ba7nj47wClD9xk0o
 de5yiqkbWfuR5x3YjZda1hc7pj2Shb3BfqqYahpcoE1b8BH6mesVbuzeu
 zFSPJJWo1Ss8QSR5fIAOArS3SL9CCnmYJTxXVhpExBt6BnpnJdSkkRJqg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392368908"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="392368908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918202853"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="918202853"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:09:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:09:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:09:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:09:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:09:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/LftP3gRq6PujDtP/fH5hMKIHnhCAq+zwzOemVlkpJQMUQ3D5woCrgknvQ5SoXWrGd/FVPged77ChP2RIwQwaDnLQQ0yW0GSNvjYjXHNiDRyhxv911yHIuACmfPklb1pGx/MeFJxnB6Q7nc4t+RAvXWp9D0SjJwnAB3xtCuvdCMXXzIsAXqk2zShb3+J85Fw5JUeKID4sDIiptU1UQly8ZsVibynQdGM9NG800go7wnDkw2qIM4wx7F2xtVkw+PmcVFQLdr2CZXVGhLuxtuUzCBqxg4O/ydn7DKt3A3vH3eBJjrP9xO5sfllHBBvj8Sh3yOlIvg2YExcVKubtcXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDcgpMihogErv4PaCWzg0h9LxAnU6RevfHJ9WIVeHfw=;
 b=fmpx4OXvZqN50QYgvm7X/Qk5NQMcLVcg4arEDz3HXMq97szgdcjw1+LlB7NXx5yY+yWV2yn9t63u23ywfkYT1Dvgq+c6Fvp23gBKpRRkyn5c+zP4n+xTflzWhNnQNYqigmk6i1Tvse0wL65sySwsDySOnAat3UqGfB4JOXLfnAQWQec2XYQEI5A4X9YniX+gko7WQGemvRrw7yJ9ndDYClmkKULUyWNGlF5QcZ/dhAJub68E7OdCMbb20ZfIWRQDoFZ5EM56C05YnVfFZNEohc+SpkwwP8B7eiaGAHBSEeDHra9KUFo92TXzUTtc8Ekz8GZOCSptM4dY729U4pf8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:09:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:09:16 +0000
Date: Thu, 14 Dec 2023 16:09:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/8] drm/xe: Fix whitespace in register definitions
Message-ID: <wdmxk4deqa3rten66zgozpvd2uaamo5w6yuqxtvlgunhaoezne@tq25fb4mpw64>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7c39ad-1210-4671-bcd2-08dbfcf1501d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+lDfsZ1xjpHUidzKvOvHvMKoAUXEQcPo55ad1N0ILmVTo56DwQVknv4HGNyBCJrGjgSujbpKxu5NK3WOTEF6I6x0YBlAVZj/lYNOC6FxuKdlu9grLGzfYLXpkeZ+vF4Ir++tfwKfeml4tgSa6p67eKZQEb9Lg4w/uai+nkR31Tl/vgps4DfoN/MKFEYLE+R8gBcgCwpxTy9vMUVwbtph+eWJJ5+uWVaKx6qy9+mF/iEL8/zBAuDA+NXlnvq6UZNf9k2deBx27OowTDNWp62Hv884MqlnZdtsSZi2BWtYnCI/I93epV6dsa+9hXlQwpUJxRmDuIb1a9Q3QLwuCtVeXntRRecGuiwAv1vH609vI33n4r+yvg4tJG6ko2dWhkccBQ2pw07u7yvbe/0jIxATEif0MDhhrObxA9lHpgYBALnJiJ9lUdeNWcpA/JEzVOEXdp+86hvoztfvFZ+LN9A/WM+SvJiWwmbxsES/oxnJHk03NMaZih1bRCOAD9Ql2S40BZUJ2AM2bpI8Ehlm6SHXNX2xjkgsizB5qX0IH/UHEde0KcK7f3pG7EUb0S3krA2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(86362001)(82960400001)(6512007)(9686003)(26005)(6506007)(66946007)(478600001)(6666004)(6486002)(66476007)(66556008)(8676002)(316002)(6636002)(6862004)(4326008)(8936002)(41300700001)(33716001)(5660300002)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zl9WcWT5+4XkjC1OGyS//dhPRHmKxLY9qmHGQwRg71B597GIKtbW0wzYZ3gm?=
 =?us-ascii?Q?FRYo6h7lyEW9QdIsDFK1YchGekzhI4QNx6IbcMcBAzU2SjmywBwYQBxkPOTK?=
 =?us-ascii?Q?0UlRvRGJELKXmRaEJQupnrow4f4X2eg0cCyXq7Cf3dWjLHzS5MmZhSK0knlH?=
 =?us-ascii?Q?OiqpmX2NP7sPiVWBIAqJKoAcN//8xh7CK/s5vHPlyyRCsYWDgC2aXJg1aW+l?=
 =?us-ascii?Q?OHFfS/o3R2/TiYsucdK6eYsEl3+2UIWfCVswvYi1/YhxG0bBIthqganZdpy/?=
 =?us-ascii?Q?/5GGgHsovRxjE4wm7SroIiKIPV3iKmgy+2SKe9jRjbS3hlo4+if7V9wyhyVf?=
 =?us-ascii?Q?1n+SjYlc/BDz5RyfreuzhlNOocqCfkEw/xkSNdWcdhkb5xOCtzo6RoMPqg3j?=
 =?us-ascii?Q?MCoQyLFmWygoNlXapaq5Kv0bJ1/KVdvcAZFcNhzEeC32ATIPzQXAXIbvLR08?=
 =?us-ascii?Q?fDfxsjLvtNhS5ysA4+mMYf/Dp05IkzRxE70H+iINqrvRIzM1t4Da3CBVUNRH?=
 =?us-ascii?Q?mbK4+sTq900+DZWmxcrCvQb4gYJDnYKaZgl/l6/iNMYjOf3yDOpszLkIXzBU?=
 =?us-ascii?Q?fSkmvv9IMGUX9npeJgoPoqj6sgw258XIAFm2XpkbLV5nkas1sjKNiqJwHVD6?=
 =?us-ascii?Q?2fAXX9vK/JC4bmi8oPsYTohRQtIZft/k4Ogrmw4zI5Uhr5bHfvdsAn9SEeXI?=
 =?us-ascii?Q?FdZqTPB9VjAo88CvTk9eKCMAJ9VMODu3jN1Pr9LsXXs7/sZ74VmzIs7BxMwD?=
 =?us-ascii?Q?QCGFp1Vib7w7uY4jL39xLkJMoSrUpKgPjcX1QDuPplZv9lGZWzW+qlwZDoYE?=
 =?us-ascii?Q?idWe773Xw9Jy43YGR9R3oEbrp/veFjI8WlTUxNGgSIhCIm5IFwY3HcJucGSE?=
 =?us-ascii?Q?iDBH+joDv2c7slpKwPaP9ul4XlpupO1mgda5NjAJzCXGDLtqhunHe56744Jx?=
 =?us-ascii?Q?/lAj8ZsePVKZd4CzbpQDE3Lnpu8m8rQd+a+NmFST6qM8aHzfu+v+0zwkslVY?=
 =?us-ascii?Q?cRSje6Wd3nSIoEkEddr/pqpxe3ZTBDtcUQFqye83hGjpK1gr62BNTrm79DEz?=
 =?us-ascii?Q?AxQaSBXFeXJbkzPt8QCsU6KsDbg24iKJ8JUvkzYZhGpm+9lAASB3pMFm89mu?=
 =?us-ascii?Q?cDVZuGlkefqXRCvrkw2CH5gRmScfOOMxmZmR5EHLsf9BhiKwAdwZJlFPHP1G?=
 =?us-ascii?Q?rfY40//uUW1K/6kuijUAqcTGAIJnQ1gPfMCH9GICcx8T2ciFAYJNk2JOBm/C?=
 =?us-ascii?Q?TmyKmq9pXE9hW0Ly1xFnvyA0yPV48RgW/dfUHzhWXD0xiPr+qAIAD3+EfC0d?=
 =?us-ascii?Q?40tbLLMdsG9zphga9OrBUcZ6pcgVWjYyqBtpkg4HdayMhvY3k6AgHWYdTJUS?=
 =?us-ascii?Q?LSw/d5hdmIGZ6ZlJ+dA38i3MXnTOEK6RwN7n0efzuopQBX553F34XFGOthAu?=
 =?us-ascii?Q?1IgvgKx+esisByhsdG1I1/8LFt7WBqn314lawRsqe1A56XqxKux38RzfYv9g?=
 =?us-ascii?Q?MofuC//0bUzAfHPoMGDqmI9ZUqvwYC34RHtLJdy/FdcC0tcMlvxkBVoM1E6J?=
 =?us-ascii?Q?4YjbjCNgOgVyQz9lz6MQy2V724KBAdqIOMMA2iThQ0CQeDZlS6yDllF2oVNs?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7c39ad-1210-4671-bcd2-08dbfcf1501d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:09:16.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RXaLQlOLv0HRwSujYZiCQW82IFbzHGENaecXywJK0NQCuyy75ZAa6rhh5LhrKd6dr8WryTDr6w8mxmsD53dttqdA/mds6wS7uAh/N0iRjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 10:47:03AM -0800, Matt Roper wrote:
>Our register headers use tabs to align the definition values.  Convert a
>few definitions that were using spaces instead.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
