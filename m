Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60EEC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DDD10E53F;
	Thu, 18 May 2023 18:40:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83110E53F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684435210; x=1715971210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8QdsFAgHuLnJGyWFKnagFBiKq56p5E/Von2Jd/+hD3w=;
 b=fH0bhQYdmpwvUkG8BZrEC7Jeg7VsuFmOEjedr1tqRfNIe2X0ZqSiprQW
 NjtK9/ij6nHlXKV4i5UIf8A/gQ4KcLnxsRqHuLcqkkJERs/fCJkWgyNFm
 cKWr/3gFTC+815EsBIZ6tEVLto/eomBJhtpy+pGzqo/N4Botv3HkpEgMZ
 0r1dPsR4ZoCAfMKYwLQX93LlWWXiShxafkLBQNAfGASemvpi8agzIRb9k
 SO2/n6xqEuRgOXdNYVMbUg+AZza3rjwtkPA6bgzbrLgiuTqjB3X+v/Lfm
 1n8CmdZcWfj0xBs6xEWnLoDGI5O4nmzmHNhJKLQMqktJg3BNOMWZPDLTW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380372070"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="380372070"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="652770631"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="652770631"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 18 May 2023 11:40:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:40:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:40:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:40:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6MR3NL4DNG9L/DlSBDiaOzWKVUx9AKeDHRotOL5u4CYpCLwKDprT8zY5R+crEzjuKJ0OOWtfWZFudnAyVxHa9So0dBTL0URiXoOvbfRMF9RRFwfa4E09VkTfvytenJN3fQU49cCpCAKzW7Qz6Rp6T0yc3hBLtaZXeCuIOofVtmi8Al3tBQLZC4usNExrmZxrdFV+mjtGCbUBLEJktBL8iBUZpwNlZPUN2myGyhRXx8PrT9H/fWALCcG1GMmZ0EUqHK17Gc68JwY709H4h6X52yz+x8COZrmhE7O8jqn6RlewW2y8VXyS3oZ2CG5PyOCziJ3BQQJBm/MGMzMCOLoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+bcS6XJB4ieGPBoQyoPhyiaDjJJ8/yz1+Vp9K7SEao=;
 b=XszYqs7ruFNXrexCAyrW5o1kYgIn747bh1GvPgUdnoyCmn80jHTfI3EZJ9RPicdho2rQG56VH8qQlA3TWvQnUbdPCG7vuHqT5JxDkvq4V9VnmzD6zDKlzJtLd+dqu58QDrBRva+DwRUmRHzzWCseTlRea8P5WtK/zCZ0faBsSHF3uaHUAKvDEvCw9iK1B8xuFSQ+bR+W5oVzrT98xjrR5hdRbp0R8puhMwOo9z4kTHGg8F9Rm6Lkb5BEEY7JQTCOw7qkMK3kLblufE7bJ1lOM61l6kSDU/VYy8FMaGdeiCJBxVc5v21XyxEF+3/qrgpF83kRgktWgEjh3Qx/cS65dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 18:40:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:40:04 +0000
Date: Thu, 18 May 2023 11:40:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <crcpt67zmk5pcy34er4jpuscatnr3qlgwgughudvkputweicfr@yqgionjqopfr>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-18-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-18-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: c101924f-6621-408f-e23a-08db57cf4bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTqwS/TDZOhHKz3fjtWI/bHDQXO3K+SA4QkjxAguRdjowFI3CmapMOO95P7wFuUSGExWaLvil3PbeHcAic+TYg5O4+WI0euJpPRFykwXhU8UGftQcsDpHwaeRAkSguRM8iSLq5qp+KxryJt2UNSFapW6Kf2RNbxWUP4KScJrPsI7G7lASFZV+KzQFzi6xVa40fTrXPj6tsKskK+1k4G0THno/dUOGWjoks6YR3xkU7p3+t3xhB0esS8aXpy6xfzieHeUlB079nJfMTfYg+hmVlDEgIGV9JBJDLDyxHD5B896nhnwr1bkO44/XaGCRz6TXknfVnLWvyy3BSEPID+xfky84B7DgfuQnS2Aw/2QLXhnqorC9dEBzZEfJV4pEJlrdKgamNyqzSliZ2gzqzVg0idZUFEI7mPv2cH55w8qzPYTOgB+q0AnaH/Wzv8n4jVb2hGqRb+QCZD90H4vUWwuhRCEZ1k5n9YBjmwCqCVAyDh3NxmQ6jU8Xf+P2tqu2BbGpAMpRQMgEr22DyOgNMrFP1lYlmaZ9MXtewD1L4HEQI4CR4Blk1FScR3/BkEiDf7/pvJUWpNmI/y7H3qHG7tRQ9bx/fdG0Ym7DZewdR+AlIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(6666004)(6486002)(41300700001)(38100700002)(5660300002)(9686003)(6506007)(26005)(6512007)(33716001)(186003)(4744005)(2906002)(86362001)(8676002)(8936002)(6862004)(82960400001)(4326008)(6636002)(66556008)(66946007)(66476007)(478600001)(316002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cUbhs7eAEqRHG9l4PQdUaAigU0Xb95aWgsFWZ6TeBweunKTj4B9un+Nuqvju?=
 =?us-ascii?Q?jg1Igw4K4iT5o+NqGWNFhw9tHkzUb4HfTumBxTyL3siwmLExlqKLmAxdkjjk?=
 =?us-ascii?Q?EWxZNALdBEVQH3RkQ0Xh1MK9+aFv0MZG9X/8aH+plbvWKqT2vuEHrRjIYsoE?=
 =?us-ascii?Q?gdgpAaRp2sRgWr+Sg1WMU+QyeEYfuh6R8MnSix+R8/H3QQUiBhd37PaVhlwr?=
 =?us-ascii?Q?WEkA30gSZ0Z//DzOty5tf9/bRBVQY8t3lcXtkroJxVgxzDoFg9mMkZF7h7Jm?=
 =?us-ascii?Q?iGl5xwRj1bAcqeU7dRkkDzlvm3gEEYa5ox38e1NDQwscKSB1sI8o2tn4SnGp?=
 =?us-ascii?Q?aYGeqGtuDG8yZQm8DQqvsJfYGXw4QZD65fGL4ybtZKicaNM7g4vip3K7K4vd?=
 =?us-ascii?Q?AjWAuRKc4ng7Lah1d3G9yJkafaG9SZvgRgnCPQGeM4+ZssTSv8sKuCEMy75c?=
 =?us-ascii?Q?9ZvOSA2D1/eg4AdvwzKa96n6M0O9vJZiGdKSiCBkxfBtDWymXqemyi1Xpli6?=
 =?us-ascii?Q?4rbBm8wfdVTl4/eHgaTXA726lx7+rle91EhW+4KwoQV6rK93aM6coV74QTCw?=
 =?us-ascii?Q?nkDOqzyIqjUOceyykDC2jsIbKa2Q//QbOkhnR3cMg1x7VpMjxO7zJfc7Trst?=
 =?us-ascii?Q?FPNHpAwCyQksWiyZbjFmmEnFTZPxMxPVaEQSUbRIJFz03KlzpJeaK/uo0TJp?=
 =?us-ascii?Q?ovcicSKc5eXLba97wAHMWBK6CJ4jffO2qgzyIfC8skzvEv+hQDbl4e5wA9i9?=
 =?us-ascii?Q?doSUGrrJt6PK5BlMhQU6nbrVew0BsTjdwwpGqKXFRPOcK5gFO5ygukb2p+os?=
 =?us-ascii?Q?pn4mFCjcrYH8Kh8YJggx1pprbndXyFegWIX/mhOdrFTNNAUL8GhEQMLjim8p?=
 =?us-ascii?Q?E/6E3T1hNEFb0r/GnqYqs1LK3UxnMlvDAArMmpBCgmvX00yp40LgwvMr/RAu?=
 =?us-ascii?Q?wPIb4ZP6jdn2uRkAThLjQRscwD/PQpx1MyymEWVsv3JTzViYvQsyHMeOHCXN?=
 =?us-ascii?Q?MViyRzyolYETnGayY+D5C/p3ko9bPYTaLR980D9ZXjBLnWYD8GUnvKk0xPKs?=
 =?us-ascii?Q?NQ/pATBH9ruLMk8o6hibpt+arx2Gh8Q/tJvp6Y6jBtCK9sNLLeE0PwKO+j6Q?=
 =?us-ascii?Q?X1dp/6UXFfpSbf6YydfindQUdNr8sMQ+R38iooKSSP8kuaChALpm6Mly+gaE?=
 =?us-ascii?Q?T6jKk7bTx0MYj1bPkL3iToExwCmV5cFdbYaMsusysQEAeZ0t714ISd8+LndO?=
 =?us-ascii?Q?+F3iN2WZ8xawW5+A44eFfRz+VAFDPCZAHIgSSmDfFYbQ66BHAK3AKSwVBZ51?=
 =?us-ascii?Q?gy+vkTwVKR6+YAgHQU6KZ/MhuaD/6mX8JTLAC6gjmRt7LwjXDsLl+5jjgXCb?=
 =?us-ascii?Q?fMFvyqnpYJmmcoGCkWMSWgAfkOLG7RfEpcxLde89ncIXNrmwAvM8GrQAxjAj?=
 =?us-ascii?Q?6R6hWbzvaaRJ1Job8hhYxvmyPREVXpj2IZkefJ6CO7xn/vksfowHP4IAHNmg?=
 =?us-ascii?Q?Z7d+60RNL5CLMLiWFgOoDtmWAbjqoVVhh1NuKC7GHIKYikmKO+8nRjcMYqev?=
 =?us-ascii?Q?JYW9rXASPsDE0qP1FDdsm5t0oEiicbDIJF8ultdDrAOzKZj/GgLifLxeei2/?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c101924f-6621-408f-e23a-08db57cf4bad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:40:04.4337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYO+K+pmrj/5OKq5uZvT+yljUkJAZLuG7tr+7rgXD5IZIbEpTKWtJohXjSv/jvmZseAzhA3MKdjlUce8JWaGJWTT107blaYwdWd3fx2xEek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/26] drm/xe/irq: Actually call
 xe_irq_postinstall()
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

On Wed, May 10, 2023 at 08:47:13PM -0700, Matt Roper wrote:
>The xe_irq_postinstall() never actually gets called after installing the
>interrupt handler.  This oversight seems to get papered over due to the
>fact that the (misnamed) xe_gt_irq_postinstall does more than it really
>should and gets called in the middle of the GT initialization.

shouldn't we then fix that in the same patch too, moving the call to be
inside xe_irq?

Lucas De Marchi

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 02f44b58ce3e..2549fd9fb5cd 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -588,6 +588,8 @@ int xe_irq_install(struct xe_device *xe)
> 		return err;
> 	}
>
>+	xe_irq_postinstall(xe);
>+
> 	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
> 	if (err)
> 		return err;
>-- 
>2.40.0
>
