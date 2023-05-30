Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8255C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 04:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F31710E32A;
	Tue, 30 May 2023 04:03:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD86610E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685419386; x=1716955386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oq+ElQ3W8WPiCA9o3fxlI5u0JicdBmehBM2Ma9OeZ/I=;
 b=FWC5XN3OCUTD/p3sLU47oga3Yo+OFrjQjaAIN0OZ0SgWkKt19phkIcdE
 sl8BumAivqGxLneGnXXUtCx82fRLpqNXCbOXmXYpuliHDJ7JuyGrAni4k
 4nYSk/UvaCkx400R0kjDQE7QcWM3SPwBsvh/m5bQIoBbwuBetRbFcv12A
 Bk91BqxLDn+kpoIAzXD9Ba3/gPL3QcDIg4Mzk6oePci7HtApX1Ec0LEDk
 2PqgpgkqD7o0CkvQyLA64eRdY6M03px9G/NZSy+WtmMcpgDHlxw3UIkhC
 YeksYG9HrICNPktKHs8q+8Xd8kLjZHaMl0vzLzsSnXnnl0Q4e96l2PNl0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334432730"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="334432730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 21:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796110542"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="796110542"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 21:03:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 21:03:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 21:03:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 21:03:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 21:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aldigJBOqYMpNGjH+5YUqv6h9EglaVe5aK/blEyR5YdqDrbyuBUhAfD7unyZbIgGxfx2Biwr+PlahTm46j1s1i8iTQFyzEfKtQuwYT/clBeFIw7tzMsRV7GcqtaeTXM+ATClPIoJMcK8/JnNyfdgZV+vGxOZeylnHv3ItGKNqRnGshZp66+I5mG7AUxssdnxL6qo8q1o0jAe6I+SjrVgzWFEzAsNJOaOB/tNDG1FtUYG2OEwXX7Y8Zmn0HuC2Vpn+uToxY3WgMkEXEmVprhbyp16toB/BSUBUEVvNNHefMfJPeIrlQkYa5VR1k8ToGUDk1WUMVps/O1doKWCbLi/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlhBohkBKvEZaPMIU70yKtGYKis6eJojtQi9uWRQkcs=;
 b=h6A8TGF8Xf6cd3TYEEfMk+NWimzQrr9D6VaWKeVpTcxKLGOlZr5vA5lBsvCzxRhsADEPlakZNXvhv0HGjv1f9twx49d3I/cfntSef6hTLJHAGHKAirXgDeInTPGIDnYjM+CfQYGRe/hONyOkZX0NUi1Hl/K0WrKMSmX9tEm0TVR/x/jeuvfWdxmsXjvhp4Horgn4r1WiGVaaBLSVmnkpIKL8zv9Ne0VT+Vq0t4ugpnocdfFXvtzkUUbbyj3j9k/JIhJGCauboE5z2WuBxOZHodoPJxFsYtVom5+7Lpu5xE3VkSL16TM8HuSDuWi6xiPU8kdNOh5U+w2f5Qsjtx4/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 04:03:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 04:03:03 +0000
Date: Mon, 29 May 2023 21:03:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <53as2nbkzwgnyv7n3kbbl5rlzwquiuqazks4wkof3hm3rsgzon@3l7vhj7w4hrv>
References: <20230529211914.659551-1-gustavo.sousa@intel.com>
 <20230529211914.659551-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230529211914.659551-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: b67fdd06-d9ff-4e23-b7bc-08db60c2c3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZX6/3NP+x9tjV3Sr3jfFurv81AmWT57pTHpz/mxWCikW49hW6LERv4195BNhNuqN/uq0FCTRiwnNnyRazOWxsImTod51t3JYHActsYBuTiV4G5/kdN22zvfswC3gaT6ELunGJS2yvVoJrMcDYd237edL0XSXCIMYtw3glusG/pXex2roQBHLfaN0pJSuRxxOsVPKfV0kiIQql8e83BEtPnkPktdqev18U3Po+DOSHzlf29eNQVwWOlRHi2Oy87+YxacrpWFOSQk6GIYqQJonrlBrbiivo/UiOUqu6pLNGAlBwHBe06EGhUmfvXleVjcoWPs9Jol9asjuAZJ4MHLANbUQJvTArV+0EUpFhb4HYpxkUqG+7MGaoTJTyGZciXQNUGOQTVmec6FbKlVMPUUk74JG6OmiRdFHIMgrScUHn4ycpQ6JSPACYj0YYE/JYq6dUCEHTpPbeKhdhivtx1nKCANmgCaAN/kZh4X3qkIUEz0LUIb+/zg7QtkWowdQQf2YkvBSeGcjx6YOsB42iXpDFGxXxTwRTstzs3ENtocDCuFacS1kLmhNK4Pq/M6xv88e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(9686003)(6512007)(4744005)(2906002)(6506007)(186003)(26005)(478600001)(86362001)(6486002)(8676002)(6862004)(33716001)(82960400001)(38100700002)(8936002)(41300700001)(316002)(66946007)(66476007)(66556008)(5660300002)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pPxjdtGkMbhDAsmb7VCYLrYQL8ZMoJlPkt78hrmJOvLrXCCma72D3Yp3mG8r?=
 =?us-ascii?Q?UiM55BB86MozpETEKViP9AYgE8XUXquR0r2z7y0cEnRjbDlYluvMsp189YP+?=
 =?us-ascii?Q?01lioM7iejr1SJdufY+75po+i2aYzgqCx3XTAdFE6uKDYN/qSXFsaq3qJh8v?=
 =?us-ascii?Q?YdSQwPgeIS1zCVn5UVoVggVPbJME1F3BeOJZkKQiXEHte1HTLXQiv8kb+Ygv?=
 =?us-ascii?Q?0exMR68hQstNV+ssgDXekLrAFn3wtKxwtH1GqEkBMv/jxg1vjYkwnLRoB+fL?=
 =?us-ascii?Q?jQXV7kl8ckSIbpBMNZAGzIHj+QF/sNRw9SgYJflpgWn2tE2dWSxpu0CEi6kZ?=
 =?us-ascii?Q?2tdDRZNrDttgOWJLxWBPPiHuyCSWG57AcAseUw27aWCp61VGTe6OtN96blpI?=
 =?us-ascii?Q?HfnfRm0GppWH0gq812VNUP5GUm2fU0sUZ3u0VoBesyln326bLVFO/qTSDikp?=
 =?us-ascii?Q?UQcxYKJckiPcYSpRX2PVUnwIaCdhBjxAn1dka4Re8dqLvYv3NpXFFt/eHHfZ?=
 =?us-ascii?Q?UMqSIZfg1hoa/3bCXiAUKSRf3+hUDV+Lw/i0+0aWMXAcdgErtxbpPKCEP0/e?=
 =?us-ascii?Q?Xw3vwnlcgvypchJuRJf253qyeiMhE7ltufTk0Rrmfzu6PtRmGR4AdsSVb2Ne?=
 =?us-ascii?Q?9OiPeYzU8UpWuIGTrl1ggcnKZQdQqGdOwgI34BnOj+eMuSLslq96d0vkbRLL?=
 =?us-ascii?Q?KCeIkPE2o+VlBvagPJgS41gZLBfKE+CIga0XW65h5Um3JUZe0PzkWfRowfLb?=
 =?us-ascii?Q?uiG6/YAvd9Z0aHeTK2pZsWM61Aw5kbLdy4fMoQrHdh5X1W2xocgZpEPe9Yv4?=
 =?us-ascii?Q?YV6EedlUBPSmeEauFZusdDbwiJzXJSntpP+gmZatS3OCCGIIgrHMSUL1JgV0?=
 =?us-ascii?Q?MtAX0rKzqOWScUaGD9LrAssTu7xS2DXoJxqwcZuyavoS+sRUh9YVNeyIO8Vi?=
 =?us-ascii?Q?NebzzdQZK58tqrXQW4z+rC+HWufVrzafT8DPm3cMfDWmIEks9SvH/1rjPD1H?=
 =?us-ascii?Q?1fSe9HzCCndAniRYXdktW3tjIfxqdVE0HOTRBbid+gHmPJ9xZcDbRG6v5sun?=
 =?us-ascii?Q?Ci6L5wX/B+L5xjOdbub5WAUjv4KMvAoa5wdhz5W6w9bvgMqW6A4BTVLj93eL?=
 =?us-ascii?Q?v+XA7aiUhfrfGYc+WcMtSIgS21vP29iNDTVeWEZxW8uLPJE9j/Y+ZX7zlDVa?=
 =?us-ascii?Q?JBdeckHKBIz8gN+c9YVv8HVNgE4x48KEEGofjjJJcOy7pMGWJqXD0xb60/qC?=
 =?us-ascii?Q?vcVQY43YzFsIM3o80oj5uHICYqB7CcR7NDn8Qo9NwZVFBflu3SdoloZG79KF?=
 =?us-ascii?Q?8aQsGu7ELnVDqccUg6y+FSKNUYpb8feWAks/uTRQnN0oNIJURbMQx86WtmQI?=
 =?us-ascii?Q?uvGGc65LgLC97DIW/gXngDAPEL+0IDAUgkQQOl1hV6/qVvqy+EHAArGYZ0+A?=
 =?us-ascii?Q?kRgIzBaArCQz2LfRHqCKguAdl5PTXSFUtkdA9hJy2R2unvcMoMZC1r+fnfCQ?=
 =?us-ascii?Q?DD/X0oVhGKJi1YoCSMTL5qzBiUinTTtXbSROcDVNm3SN6mtVzW2lnDHx1ZQQ?=
 =?us-ascii?Q?ho9AJ6Z1HEIuwCyWwHJcEpukK9BtypAC0v1q9gtVu4S/Qqom8eZs7I2rCFUj?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67fdd06-d9ff-4e23-b7bc-08db60c2c3cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 04:03:03.0679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oa90fXRy7k2zuML2hoZinauDqBZaU/Ug7I9YoYHEh1KqnbdWiTjpt9qKB+1Xo/vD6vEs725Ec+tnL1gCLvp9Giv/TpmnDMsICULLmlbqBBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe: Add support for OOB
 workarounds
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

On Mon, May 29, 2023 at 06:19:14PM -0300, Gustavo Sousa wrote:
>Add gitignore entries for generated files from OOB workarounds build.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks. Not noticing this kind of stuff since lately I'm mainly doing
out-of-tree builds

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/.gitignore | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/.gitignore b/drivers/gpu/drm/xe/.gitignore
>index 81972dce1aff..8778bf132674 100644
>--- a/drivers/gpu/drm/xe/.gitignore
>+++ b/drivers/gpu/drm/xe/.gitignore
>@@ -1,2 +1,4 @@
> # SPDX-License-Identifier: GPL-2.0-only
> *.hdrtest
>+/generated
>+/xe_gen_wa_oob
>-- 
>2.40.1
>
