Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63345CE7AA8
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 16:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309D810E0D3;
	Mon, 25 Sep 2023 16:59:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A210E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695661169; x=1727197169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ALQTuKPlavBfEKSao9GW9xfhvqKEOSYV2LjfNjEY0UU=;
 b=iUXYOB5ocwpPJRflZe3dkGc8f/oyio2YmKKDul3nlWUyT34P01HO4K1Y
 UvrqkLW3CQFs3UKPajPUtre6phaaEz9giD6BeAStniEu5Mw5wUZRO0Per
 Y/aiSXbcaXYSVHAnSk/vaQ149xGOA8TGIm40cxGtFGtf7+YkC26En4ND2
 A516bcaHGi3wACIFnx5wm4QTBtGRh/KvKubPLiPHICVt9sdi5kZKNHqhL
 SlpYLzLChRZPyv9zJ60dzMvjzGU0qKmcV9z7KhyrMpg7xkJUMz1OQKH0i
 xNRX8BJIQiQ2ng1utv1GX4UDZOLISbM4IA+5WkMj+oPQycJt+zskO4lOH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384068369"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="384068369"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698054313"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="698054313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 09:59:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:59:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 09:59:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 09:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsdOsksR+qYDhbMnDhIfRckaZ6FSdIdnmAXz3dtKteW7ymoxlRa2/um4Uvci42KNXAmV8c11F6j55g517V4CBdgondtU0+cR3b5I+CzhDcdK0zxrv70VVPKPMb5KaVAMsen3g55uLUTR5LnzJGSrH8S87OEC76Wcx04I5lJBOER9xoyKX981h70D0pPj6u8cZ6Nnaytl12p5AXgrcRw8lSqmBUfvKhmjTiW9WQRec5Ft+9JSVd4o5MIph/bAIE4W6MXI27Eo1Rzh24NHepLtAXJoG9f0lS56H6RBgNe6i4aiVDjKiEbZEqjzlcDDJNv7MpB5izjZC0Ln6PlqVgAhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZU+kLyFpRsTfOaiwl6G+phZItgxVYqz3cHXi0qoViA=;
 b=R0e6baasKOtofK5b1NEJA7Cp0w/JLjRYsnmGyB5EadGgcbRC6cnL+dXMNKKRUBA3Nh0BYYIy0tdw6HwrZ1M9eSZ+DiLG3TbJ0aNKf6aYvkdefDAQBZLxqkslTQVsNacg2nFEVNIQzntUKKIawE5LDJdt2iGDJ+aSU+J8jWSArbz4qRKyom4Tp2Y7MazYTYUz/7Z+MDaK2QiiRMhzfwpqLM+ujRPkU4Lo/sDWOdAp8jLnS3SMalW9qSrxQ/tnvldZYgD8162egQnmMkTRGibqqusCpffyu1eXpOAbO1aysE8X8iTmv0AE4Yu5vb0Z0hbFxDqK9go+Tv47tIbnhM1Djw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 16:59:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 16:59:25 +0000
Date: Mon, 25 Sep 2023 11:59:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <oksal6a2rhhrilihwzh67lepjljgbp6edoy445jsdv4mcbqalw@nenbmlify6ho>
References: <20230920213259.3458968-1-pallavi.mishra@intel.com>
 <5g5cmnsvxmxum7gaft2frkocsvclbg2qtw36ikdayoustbdziu@g6rx3grhddmc>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5g5cmnsvxmxum7gaft2frkocsvclbg2qtw36ikdayoustbdziu@g6rx3grhddmc>
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a7d281-d497-4e7d-e50c-08dbbde8c59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwZqZQ/qNaHOB82YCLjCi8TAHAf/qzmx/IE21zDZsz6L2CWmEbOKHpCTcA5k7ncUJewpHHCMNO6KjLuLg0/omjoEbWUOufoTLYbj+Esx+H1hHVC4hN+5Qx8OVqTeB7O0lf+Y7Pz1b2/QUCK8mXXRpZrhCSVQGgLeiu0SuMOldNhqh8ETXdxpe6te9OZmGwlITWtklygmlIk1ra2hIJ3u8kcMU1zG7PjpXEyd/MbAxJSprvzC/GO/SD6XCq+InQMLPmc9uPsVNH2N9o0URcla+jOv2SodBoYigVD1/G6I0VIwZuPZdSAzEZuDZUpYWDsdq3m2mlrIqKQgsvUnvPY3bw9s6BnMBENhHgXsafM5Tnn7OmyvwUM6yGGPgT3fhpYH1uGdmN9x/XjcKT05UfRaTvbAnlDBJm5kX2u4fPIeJll9040OidWlkS1gMgcQlUPLrONLGS8Yto3KiEryboZ35BH0EadSWUvnLGPrmoLxhA9/MSy0fJYLAnBRq8NC5fioZDmz03HtQc/u+gKpHhINPPH46HM90iQYv2Dxco9dFsJ5iTmbDxgZmBBIMKPHr+gk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(4744005)(6486002)(83380400001)(8936002)(26005)(33716001)(5660300002)(478600001)(4326008)(6862004)(8676002)(2906002)(86362001)(6666004)(38100700002)(316002)(6636002)(66476007)(66556008)(66946007)(41300700001)(9686003)(107886003)(6506007)(6512007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NUVSuQU3Nhi52cXNTCKCF6AMO50BjeitOerJciHtBMg5PELD3x0V40i+bge0?=
 =?us-ascii?Q?d39OPAn+fT0PYqZwB+YGD/AnVmT+GAnD53zkzdBFTz3z8LkLJTD1iUupjKhg?=
 =?us-ascii?Q?C0CxYDTg4sQ3ZHlqTktgWJzpSqFx9BXuoz9wZHp8BCzNc3XxwKnMSlTgACOq?=
 =?us-ascii?Q?brDmI0JZfGqiNJA3xxScNeRomT8rYxgjAXjSQvUnQdcJMud+97F4bGpBnODX?=
 =?us-ascii?Q?+e5yxbR5berTxUFEPCbisQGs9wOJHHpfKPzxF9QpflJXbZbZrO7dQIzEO9K5?=
 =?us-ascii?Q?b5N6WHeOfhwlt7vFqQUOOqchXD/hec4jBqdIWpILcfiMzaXhe7WQW1zY6QRV?=
 =?us-ascii?Q?ED7OCoy84/cRYitl/Hxv6sq4h7Khwr7qtB2FJyqqMQM9bRCyYNrP1yx/TBHG?=
 =?us-ascii?Q?4builkWNCzrC/yxk3KKPaA9u2ckapN2VqbNqMCpGv/8kAnBy0ISg7xE3dmF1?=
 =?us-ascii?Q?ktxoGoOnZ8bhA0ePPJCrYKDD/9exWDugfL0JxTzW1aJz8LuJ0saOYVrWWFKX?=
 =?us-ascii?Q?YhLBjqG+QBOpAGOvn3uPR82RKQ85g8XhP+UCBrwFhkdsCZVMGQFwZcsEP2dF?=
 =?us-ascii?Q?BrGIG+DMFxQSqo3Kju6q98fnDwy7L39T6x6XMgCs+GuukE/IDwwxK1n/vX7k?=
 =?us-ascii?Q?NABSDS0TlcJ+9zJFf21JboTIf/EgoLZh/+Nk73OUquaPcHG6b4u2O9oQUNJA?=
 =?us-ascii?Q?AQGePHmaTtThNkxcMBcrNGFt8f+Lqf2R2+wQMg6lGEgG7h/xpCsWJoHPZrw/?=
 =?us-ascii?Q?hU9Yl8micE1jyduZub06/+rpQQ6KH6UPEuVUlwPcK0MIjkIUDlifZcsMFzRO?=
 =?us-ascii?Q?ppPbLavOzAY1X+OM+/H3zbLAs3+NVs+8QQJmW3G6U/XSNHa0lqIWseU/trPe?=
 =?us-ascii?Q?hrKX2JZUvlV/OON3whZ/ureIvz/zw9zxCvV4+0P+KgiO+na/aoQbctF79O9f?=
 =?us-ascii?Q?aa6WywMUGeWtMUrHK8xo2sAo33sBkQs0xdLrKVtecfnch24CKVb5lqa+zGQN?=
 =?us-ascii?Q?HosX3WpJPdGqdZxICY8z/lt8dni/pKK3I+VnJo8eWfM7/DMBcj/k6qilJ1PI?=
 =?us-ascii?Q?HP1ouhjkkSnEWhFzN+oSJyCIQwKYxugo1+G5PlcHWeCc52T2cS+1JOrBLG56?=
 =?us-ascii?Q?CJdU6hDSNQ6BCZM01/z7nNXZTZAV3/pOrgRVf+b+Aa73WwNv8Jqqk2W8AUOr?=
 =?us-ascii?Q?7OvqFjj2X3cXm+qPi/ePG9JmzhjD0iPNKilBGkazcRRefodebTLacHmMyiVU?=
 =?us-ascii?Q?pC0uxxQrBZiiAv2mk5ZQadzqgIIBVxQp6bBZ6+I3hubPdEeZWwQeMXtCwAy9?=
 =?us-ascii?Q?8SnP/YOKLeL9YXt1mOdBNbk7NDgf0gnZ3PNVcPzavBoDu9RyLEC7Nd0VnIZW?=
 =?us-ascii?Q?+mfpBW+wmexubKNi37PhZ2PxS8iQy3ckaA8m0/iu5DGGPttBkwaNTtL4sQfT?=
 =?us-ascii?Q?gbWqWXL+GBe/yVM3Dttvjz4M0wll2OaMs0RnNymM7RZ1VJCMWDhw+wSNe+vh?=
 =?us-ascii?Q?VC5JmYFpqwJMGlXt+DG5I356gaTvOYQlXE2G6uDpIe9hqvKWa24Q/iKsghsX?=
 =?us-ascii?Q?k+ghyX4YHyLB7byiG9VuTU+VfYeiRz1zIyCEIwEAggcMRMWPjZnseumiaX1M?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a7d281-d497-4e7d-e50c-08dbbde8c59f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:59:25.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkckZSWaIqP4D6p3KMo/N9FG9xLZApg0L6IdI4Au5l8NvDWBvvMS+B04VB6u+BlFTE3K6nHqrM8DmuvpRBTZN/yzhM2tUR1hjFg0GtDZLNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 11:54:58AM -0500, Lucas De Marchi wrote:
>On Thu, Sep 21, 2023 at 03:02:59AM +0530, Pallavi Mishra wrote:
>>Ensure alignment with PAGE_SIZE for the size parameter
>>passed to __xe_bo_create_locked()
>>
>>v2: move size alignment under else condition (Lucas)
>>
>>Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed, thanks

Lucas De Marchi

>
>Lucas De Marchi
>
>>---
>>drivers/gpu/drm/xe/xe_bo.c | 1 +
>>1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>index c5e4d04c4d58..59c57430918b 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>@@ -1218,6 +1218,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>		flags |= XE_BO_INTERNAL_64K;
>>		alignment = SZ_64K >> PAGE_SHIFT;
>>	} else {
>>+		size = ALIGN(size, PAGE_SIZE);
>>		alignment = SZ_4K >> PAGE_SHIFT;
>>	}
>>
>>-- 
>>2.25.1
>>
