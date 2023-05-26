Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D99AC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6842D10E1D8;
	Fri, 26 May 2023 16:35:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51DE10E1D4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118914; x=1716654914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UdJ3XcJqv/sii+Y4op5eKkrlDeqX+1HSGIU0jUW0T7Y=;
 b=VTAnlQqTWIBCkE+53znQIAULZwQiXhXhXCiyvmkigC0PBJVxrhF2nmfB
 sVWjtD4Y97TnQeLqaUtCKcuk71ebpmXDVt8EFkaEa7tysFSv/XRqsvdgs
 OE+DsKQi+3kpKgkfCY/aQPl7L5COfbugHGjGBdXjhqfPswrZkaF/v/XkG
 m5woOXmZTd7o2JXMzVp/0Z+kdZ4nm312Pg6oJBTjmEEP7E1F9DZFJLUeh
 OyPC2r3hFdmGi5ias5TguCNIiC8+nLRN5GzXVSx1KLq767QpLWeNjka1/
 /7pja6frzR996pPR9SxMWuwyYqBieYARvqpu/7CZVKUGjGqXnCVEUdGfp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="417729865"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="417729865"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879587979"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879587979"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 26 May 2023 09:35:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:35:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 09:35:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 09:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wre1CLIktfAV5BvIEtefsduX7R6eZELsxmYR5PCp7ixqdosng8h0DZKdMnjKqKJ+HSJYMT2bo4EfH8mE0ko/pBcQvslFy6R1U+7tyOzJOaZxh7REHOg86+dWj5L4hZxX+GtaJW9/uIn4MM3CjP/0h7LMq9gnwq3+U90B9CnKZ/RGWEaFmk7SNJkY2ULxU/NqtRGf1laIgkHLA9ukgzYvmLKH5naXhMWaja1X4Syxno3fz5r7q18f4zw5zqiUQpSStR9oVPG7VtG3ofdyNFoHia4eA9bF1rMFVDVlPH2GjUSLMLoDmObZm5hWw1+yqiOCHls4qqRcoByXsubGYaWGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SISNRPgt++G0DwxGJUqjueE9hKv+McyzPcSlgmefwPI=;
 b=l24sr5MXu8CJnKLPMXN0p82ONh6GL+CjoAGbsrRhVKRxajHwlAaOF9OWMwwmd2BC+j9PKwWL+djU4BA3EMaIPTyBph4fs8S0IdAWx00HkF3PwmiPOyasAvXSYv+ieZviuuOlxfA3J+Sm2nEAj57mDcDMevg/UMUmzjxxjtqDsGnd6/8bwexLWwhhrIpECwOas8LrvxA5qnOpreoZ2C9OO0nJW78n6H867uBZfNaXFOV4g48DuNNn7cGmVp3y5A6tLU5Noi9BdKHtMBWokzbG5lkhnwJWWAv+d/NNEPJYYUgXDOIouKPPzWxBXuS8OfKiWoLOoawKte5TegB4mrfvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 16:35:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 16:35:02 +0000
Date: Fri, 26 May 2023 09:34:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <gbs47mikaccbwfppxwwbaw4nskqi2ldpavapjwjmsfehcltqik@pkslkh7abf3x>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526004235.745730-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c895b3-6695-4fa8-dc06-08db5e07272e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9lxKVAFccSUnTcgDjW972uEo+0MjN6SVfAnkryPubmRK2nAebckI7bsB33PwiAgRS85EQzfeg1tomM6RiHLwLRL7BNj4yUxzX0GbFUN9fuUfhGMawzjoqLhcbt6KEZuMa19cMlXr7Abtaw7vs4KKhkxZWpbPpngY9EIRZr9vLao562DO5VFhnm7bTk6p09LM5DSM8CQrvNePStTY1av3pIRY9pPTSMKDnGNES9NhHkSkywS09pNMl6Bqj+yzcTkvRlX1L+JgyAVMjhJLasaTZ4U1QrHsBq371HUNa6TrbrCWrWXJeePQd70f12RumjJrJE4nIr/yp8u3uCXhuKei1e7uKSbAWuzC+K/g1KRotd4fM7XVTYN9RIx847SGu/DmhDFoDr0W+BU1rklIRGqBZnKlKeW35LoxKR8icPEXMJnYXDsF6CrZcb3j7liUWJeA6fsMqBUh4goi9DmqOzN2oY1LnjdS0d+EJH1VruaCrnacd+7KJqS/WdPqPDsAM3Dr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(38100700002)(8936002)(8676002)(5660300002)(6862004)(33716001)(478600001)(6486002)(316002)(6666004)(41300700001)(66946007)(4326008)(6636002)(66556008)(66476007)(82960400001)(86362001)(186003)(4744005)(2906002)(83380400001)(6506007)(6512007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXHwP7qlFGNKleED5+4dRcroEJI65FyCACUjSTdc990Xd0DMJ+0lIOBVa7Kk?=
 =?us-ascii?Q?GVGK7I9d4XnT5Wnzk++kg3NVX5BonUpUPqUkAuiCityvly7Ej4LMOpBsNCoe?=
 =?us-ascii?Q?oJ2JSDpPCdzcEhP3AbvTQiyTky0XLuRkVF4el7+0yXHhKo5VwR8fRuAymwwr?=
 =?us-ascii?Q?un4NE6w9mDzOQAdMflndNS5wNr+JqzJsp3F/2OcHgk7Ewwm4IBcSlEeoMZmb?=
 =?us-ascii?Q?hVezx1BQog0OrEqSTj/uoXrgol2kl7GODEBxfpbijkVAvWDeNd9+FQWBcSBc?=
 =?us-ascii?Q?Gwl4kIhKyJsJytxmyk3J3kKOxE0SH0zZvHx1XG9HvJbTYEwvzM7I+baqR6zz?=
 =?us-ascii?Q?pJ/VmZqDoMpSPi8gl9AVHyjtcOpkXTt+YODaz9JU0HwGCALdT1iln59tYbAQ?=
 =?us-ascii?Q?yYg2sWW2HREsP+hiD2DnHj6VjOyzuihUxQew8QDWc0we8Wa0w5fIxpZT3uxG?=
 =?us-ascii?Q?Cp/ywYeDhePBai9prZ21c8IabDlj6ulawaF6WbdI6xrZsdCSeVOP1ZkmDJ+G?=
 =?us-ascii?Q?G1A04rYTdnw5AseFhCVKMJfUs//WxxKmyHpDtJCJDM77oxtjDua0dmhROcGO?=
 =?us-ascii?Q?3pxxGanlzbqvi2i3erDZIKn7oT8VQCYIN6vChBrb/qGIH712EodxVD2sYpDe?=
 =?us-ascii?Q?huCI168RIXhjEYAZpm2slrtFfMzSRc0cIwsDAti6aQBcAPbVPd/wr1f5pxz4?=
 =?us-ascii?Q?hZWkhm+UgCev8lHZcXDhwdP3ZyOyAlCWld1/rxT/AKtDER/WMtmUZAShHfMM?=
 =?us-ascii?Q?q7/MFevNCA2k40m6dSXTQgLx96NZwZ4AUADXk2co1lEcXNowLAgj6wAnAcHG?=
 =?us-ascii?Q?l64GBpBsCdRO5qC3fJJ59SYEoSCC84hgc0l8w6z0GAY12IdVCYCIPTfkAyT0?=
 =?us-ascii?Q?kKx4XrN+0qwMY7j/DN++nWUs4qhsY8znUiGA4QDfpjg04or9DVmxB0zsXQHK?=
 =?us-ascii?Q?JboYyHqGiocNeIuCbV1el0TdJz6GNhyLLHlbgCeFUpi8lSMqbDTEpPZQ4PMx?=
 =?us-ascii?Q?TfnClZXY0PUTnXkQC2k0ahAHPGPb640s8WOkocId64zKMsmjliQXgWjadoFy?=
 =?us-ascii?Q?/HzLYhbvnRjDXsqLAvWHYxrw3ScI++a9Xt2J2DZwno5Gi5CNTS/p0u9Z8UHg?=
 =?us-ascii?Q?VISOBcWNtqF0rnvveSUY93tj6NeoqG3EhZCg51HxhXNhBvEXmrc6foQYqdrW?=
 =?us-ascii?Q?epCeLlSr2YRvDY9iYXdsl9IQ7S6Noc+xXHVsrQ8xolu9wpR8OKVcTTpqW3BK?=
 =?us-ascii?Q?+bjVzsgEJkpWlmLA3HxHbpriR/ulwGvpUH+XyY+dcceh0qNJzNrvrn0evL6I?=
 =?us-ascii?Q?sFdHsFKug5p2NguwN0C2Kb6JL/LrhWmzKjoKPhQHa5ELHHAAAD29CYdGQlfP?=
 =?us-ascii?Q?9UpQ+Fk9hmKLvlYUUBx6DZqfEmkUGOT5jFAQbJu5j1l3t0O0YBvu27+BeeSw?=
 =?us-ascii?Q?3i+k2VZ1NkrTWBCxNctnXHtYvbiY4/F6gpKGCgS/v04fBmvJ7pXMHeIXHLHE?=
 =?us-ascii?Q?Uag8ImK4hLUDPzDsoCdJFTNZN821pJdgtJQIg7Z8qWwkiKzDWpsv90hD8dCQ?=
 =?us-ascii?Q?XdMFEwqLKQeycVp53VTQnTsmLrvOd9LLwAtakf1VANYFrPbL1Gv36MXKbWf7?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c895b3-6695-4fa8-dc06-08db5e07272e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:35:02.1386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x5LWZbJZgIamurHJJhrgs9XDarSJrblzKDZGetoap7CFVdTMCrG5e68RV/njSM5qxmgk0i8n9vBunqXcLJhj6iUUHrgi8oMyqCYhUXZHJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe/debugfs: Dump register
 save-restore tables
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

On Thu, May 25, 2023 at 09:42:34PM -0300, Gustavo Sousa wrote:
>Remove repeated header inclusion.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

do you know a way to check the header includes that we could add in
our CI Hooks
(https://gitlab.freedesktop.org/drm/xe/ci/-/tree/main/hooks)?

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 0312823101ad..24d9c73ef279 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -9,7 +9,6 @@
> #include <linux/align.h>
> #include <linux/string_helpers.h>
> #include <linux/xarray.h>
>-#include <linux/string_helpers.h>
>
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
>-- 
>2.40.1
>
