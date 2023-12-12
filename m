Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79604C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489AD10E1FA;
	Tue, 12 Dec 2023 18:30:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5010E1FA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405816; x=1733941816;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OmzP9T7njd9eH/xm9La+mbNCxl1D9iyC12s3RYUe0dw=;
 b=dUCR43z5ysiPhujGhRvc7TCxS+jhQjUKtAmIJa833lIgAPn5z0XEMX02
 88wKadyDP7zp0lVkAav5o/UWPhAlszZY4wGUvMKBZGHwABTZLDiJMrhmf
 XolZCdH0aqT7yOU6Cl0N/eFjtwlHZmJnmbL7eoOx6Y6y/82VRoyWgRD1T
 Wqm8+a2q+p1GPezwwsmyDJhlXihVq5BXdl2y/4IWp2MCpdtNfk6bvv345
 BSjGWzyElnudGnhgP0WYIecoAzuQ8ZZNYvICmK+mNJzD3qRv2xO7r/Mcn
 Ur78QYordcl/n0Zysvh6uaFPBhUESTFzfk6K/Xmzz74pHB86ULON0JV3I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425970679"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425970679"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:30:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749809365"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749809365"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 10:30:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 10:30:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 10:30:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 10:30:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4acetL5061lkKdXuaf89fzX/t0SlbnOUfYdpy3aep12ZA/YtlVb4V9wuPio66LibyTUHZhDL0lQy97mTVmwNPixP93Zwvs2zuR6h0lOGBXJjN2Aue+M2ERxkgJWaZrAhmYixMGfw+VTlJtFo3nJXrVtbfri5jA0TSgx0wskq+6KRPdpd+68+efQDUDxQ+z4oUDvoG2bUyjJ4xN0j0LL0xwjpU7NOzeRLnnJeNZGUCcLCkUilw3B6+rery2+fGqnVFPk5koKfcLfG92foEFMHKSGxK6iEFGPQg1Pwez8U+J65vrbTLmboGNzN3ZGg0fSKK8sMH6pj5FJ8RKbYg38pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N09YyZT3nJXWdd7oW8LI8FF+nCVDhsoj8mpbRkaoclI=;
 b=oJ+F/1eFg1tLTxuESrheK6kSfcYFodanOpyyJqVh413x9ptC52qIbmMaxeWJNzz0/bk8HATUeNXiVhB5WITpxUmhtsVWn7kRY3tsyIRTTkqxJd1L+YmSjUFIRCC2i/52qfLv3No1XXp1t51bXFf7zWwOJt9zE1pGMN7KUb+1Tv1zBtAvoIwTg27LOrqbnyfZnyEf4glBPRShPbU83tD0MbRaUYaZBrllrSHDHmRDVmg3rh91XR6cqM6EFMbS1SVB+s4+28dZsrRv1yL4jWr6oA11bz7JGxf8vvL54Qsnke3KjM4KN8zs/JIsxO/fK6iRxDhlhxvWfD+Cfw9cQZtqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 18:30:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 18:30:12 +0000
Date: Tue, 12 Dec 2023 13:30:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/2] fixup! drm/xe/uapi: Reject bo creation of unaligned
 size
Message-ID: <ZXimsPIKlMnbVAUX@intel.com>
References: <20231212040102.2888700-1-ashutosh.dixit@intel.com>
 <20231212040102.2888700-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212040102.2888700-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef79720-e51b-4088-6c65-08dbfb406098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll17IiCjW9x+2MWI8agPbrrVYUWmkk+crz/ENjlEtmTGOL2a9QJhgZKokNG6R7Md14qMkgPJV/ke+W2DLB8F8dGoppTuKJg+xucQd8o2+/iNEMF2bWqEuBu4r1Mn6KPnHduLV5Dphv09Rq2vW45zkbd0vk5oMtdLWlBgxKKy1IdhgksZDsgKKKheZnpJwEzS2cc13C5Ts/4xczFOTy5ho6s5kV4l5Mpuw7f9Y8+w1dY3DYfnCjlZbFfPKy5J3SM6JjOGdb3X94kb9ZVNSprdC5ehiJsQZ/HqfXCkuofGnbBeqr38+FqjJYbrr3hJO4y8IbvaQpffPFhqUbicihxg/bDQW60Ec1EdRuoQV6kmhvPluoWrv6Z3h1+zbjv8ZbyUWjERlz+HcznHSCJS55QE7+zUCJPfa0PxMGcOAd7NugQkOmNYseor83O/qaaNYmK9Smv0AlekXHsOkAwQ5uihDiRzh+0cCTXDgz0sO73qnlAnExmekZhovnjUBeF9wi+WPOGShDMJVC14xZLqrdTdZuubGE3LhZBsaniPpWqDbBnG/etyLYAI08sGjOkmG1Nd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2616005)(26005)(107886003)(82960400001)(66556008)(36756003)(38100700002)(86362001)(83380400001)(44832011)(5660300002)(6506007)(6512007)(41300700001)(8676002)(8936002)(6862004)(6486002)(66946007)(66476007)(6636002)(316002)(6666004)(37006003)(2906002)(4326008)(4744005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uo5fwHvzt+WPpH+oDo8+pteAjOaLKpbHlcHJsEuf9yflerlaFHDa++bVFk?=
 =?iso-8859-1?Q?abP8Ya7q9gqgaMcfGwi5+K5/QwFJeLV77hKkkGavy5yW/nT83QCem5iMrK?=
 =?iso-8859-1?Q?a1aygJrIc/l4ZGifQ1xvnu4APMnfBln25Dg/LPmVVZlKf/MRrWjg1VT7EU?=
 =?iso-8859-1?Q?I1NIji0PDt3LWw/WpiU+QskTj/HMmjOLTLlL5BDuJ32kf0Zp76pITmBiSd?=
 =?iso-8859-1?Q?zveM+NxHFYmcQycKqcshhW0SmoZAmOONxpCUU5PK/9bcAGb/XCSPB2YB2h?=
 =?iso-8859-1?Q?JGjzHCPLFzph/a1DoVMoomXswcu17rPs0ML6QwxGhE/JWGQJz3qIZB9xVZ?=
 =?iso-8859-1?Q?AEW2S0/4ZACQWRqnsRI7sO4aTnSNwk7Ui+db9EUE1PaPjsyYIcAow3MPb7?=
 =?iso-8859-1?Q?2yrmk9GWoV9kErug6BfqJdoAz0/g8XdjuvdstSZ9f1YTFO6Nc7ip2oyaO9?=
 =?iso-8859-1?Q?Zo9yTWC8tMh4pkE+7htroDk2w9FyYwoagMXgoxO0OyO4MBfIXlratZmxA7?=
 =?iso-8859-1?Q?z8tGBmrHUoDIWgfmoPgQbF8Nj5HIqDgZBcU5GhYTTK/RhQGVj/bXKqji5q?=
 =?iso-8859-1?Q?Q0dVj3yqhNY2DeC4YNwfDaPc0/hijnys2fH2u1jraeIlGwenN/m8/YuP6H?=
 =?iso-8859-1?Q?nS/FmnDlwW3I1zHsPtybekpuNmq8DxE5RIg/8JUybaJNsJin0kU3ebhJQ/?=
 =?iso-8859-1?Q?p8L9/fl2W/QqnZHRpZY66bRUZeh2MmVZp8FQ2SCukVRaOotSWVtTP7WhQs?=
 =?iso-8859-1?Q?vJ93itb65ptYzN6h0gwIv2hcZoWLUjgu40qL6aaeor1LO3zkxtdGilWyKZ?=
 =?iso-8859-1?Q?nTKlWO3gnrsIraGMsMS4tXac6qhVBdQp6aQH3DVuP4MeQZU0xQmdDC2lHM?=
 =?iso-8859-1?Q?qtgP5Da8UACPIipnrYSukEiWzD/fODIwIFVyWkJXYEY+fa/Mpv75Hr7GQ4?=
 =?iso-8859-1?Q?qRCB6b3Ka+q5gp27+NPgtQocLmj6JovXRL0/9E/S2Z8xTTCNR+LMjeujLe?=
 =?iso-8859-1?Q?SMAyXxfXkKNI9osSf5RbYxT3cKwhe4aNlQQvrRjhOslgjNtQvzI9Td6JWD?=
 =?iso-8859-1?Q?FGTzQABzC66yEmqPUa8KlYOwGrWmmhMLubYu95xEEsnTxj/29q7o7Gye8Y?=
 =?iso-8859-1?Q?/wmW5sJCkY9cqlyKfxDtt2LgPpq74dTGOiW/WFS67aYv5tIO2RVJchS82P?=
 =?iso-8859-1?Q?KnCYo+lllRaA9G8WxsjlEorygSz3lTX0Ow2ptAXyfEJHejwVcmvWrxLKRU?=
 =?iso-8859-1?Q?yoyGtYN/dH8gpy471llBm5yGEpf+0h3hPUntb8N3shJlkLunsC7VBPNgd5?=
 =?iso-8859-1?Q?KQxd1/7CWuXzHaBk3DnVf5LBU/4tAkkieWdg99hdhEgnrqFo74ikw7HQpq?=
 =?iso-8859-1?Q?DVnpprHjjUN1pIyV1CXuWVOzmbWzapQH6DfMcjk07tOy8zCvyrFyNASHF3?=
 =?iso-8859-1?Q?qD6daKbj/xL+gPZSIxwCCKkBYnuTGn/rJc4czzFld2ALdVGIQ7Oe+Vth0z?=
 =?iso-8859-1?Q?gtWahYsh49GrcsyEEJw8iDiiOZGIbqJFYAtNQvPh65EZhRotMMZjglFH6Y?=
 =?iso-8859-1?Q?yHP7MSgbE3JBDfTny21Uzf6mRAo88gT2YQgyQUusGyeSrPj51OazEJB4Lx?=
 =?iso-8859-1?Q?1Uwn9wCx9zFi+f0A2DMfY9Q3zNM7qJ6j65?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef79720-e51b-4088-6c65-08dbfb406098
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 18:30:12.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUiWLnPgmzniYfn1xG3kZfo59T8Jfuomd4nWkI8VDET0pJK/m04lmPCgPAga7cUB3jAUeViqSjk1ieQR34gPhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 08:01:02PM -0800, Ashutosh Dixit wrote:
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I'm pushing this patch right now separate from the PMU uapi since
we need to stop the fixup rigth now in order to rebase onto drm-next
and fix the 'Fixes:' tags for good.

> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index bb6f6424e06f6..9f6d571d7fa9c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <drm/xe_drm.h>
> +
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
>  
> -- 
> 2.41.0
> 
