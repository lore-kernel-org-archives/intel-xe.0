Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF0BC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 06:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362ED10E5D3;
	Tue,  4 Apr 2023 06:22:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EE010E5D3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 06:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680589331; x=1712125331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MLVEzaIdHq5IGlZRE9sA0HZOkpWces1jMe8Z8gEVKw0=;
 b=Jqd4TGfGVlBfWGeMT0NgMwigdhLDkgR7/6quGhz0PsDn90MXjfKFEtsa
 cGULJaufQXsXqBWOFzNFxQH/zH0c0ng9MBh3LHtQ7SCC7KVGoe5q1fVlF
 mJ78bWW6mHkJxPc0Hn8flhWazun/q62pPkMxyCjmHrvkwBQyKd2Y2sMWi
 VxsE2sYxMLH7jEEVirAy2zNrfz+E4Ieh5fmvOIyQprbf/GzOAQ+BBqDVE
 g82bbI2fWr4LjivCGq/1MCN4hbKTXQ+m9ElKSE+Zl7Is5ZxlxjU2a0BVe
 hsDEVfMzyYks18KbvT8YJUKzeTvQXLugpb/8j7U6WqtDWXLhKmGngtLvc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407161870"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="407161870"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 23:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663465714"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="663465714"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 23:22:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 23:22:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 23:22:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 23:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8Bf1wNuUXeq+xLaK2C7+KVgkopG48CnuItzRa1MR90B0vRplzBs4P8fxdUdrxgGmkLK3ico3+OklUrG5WPbuzSTRFZXpgEMpIxUa9Mpw/u0yn8LzWJsoBK5+/HInuLxIIixC6npHYTj8/Yor0uwe33YFOjkT/5Q7UewYsv6+HdwBMsLMh7IqG99p5WPi5CL9JYbq4WSkBCBnFu3ZUMWfv5J9F08oBfrsLAt4D/rbUWCck9jLLvAfS11q1ba8+uttPUzxR4lQ0XrlezhfaEMT+kJMr19eky1EwLUXd71OortGRe0Qf/AcYXtt1RcIsSeMLwdxB2K8dYTaKgA7wFIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Knut+e1UVmTUyKx6IozKiKPAdySv/c/iGO19qCbIlAQ=;
 b=nvR0irmJlCYtLa2yAVoWYz8gnI4CbRvaC0zCA0t2PQSCW7MxgrLVja8nzqsSXmxdB2cKERUOvFZCV/ptW5H+1Td+RTwJJ1ZnFRDG9hBvx8bmOgbqclGtJYzD4Pn/zFvs+vJdcK1XhajjjEQJzQZtPJYQKCGnUqMsOANeg37lzefShz4kVlWRhR+JF03psWnOojWqOlOhbZNdO93Uw7UPyamppWApcDh0lSBeVD7F999LLDJ8hxNsRhJJdYE96NoQ5a5ky+ORJ6KAe19XZgWmBeQ3SqaWbFJr+FJQ+fnBvWmiHauOQOry/vQKk7DvtsIzUbrC1LmzchHf+RmK6t70fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 06:22:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 06:22:06 +0000
Date: Mon, 3 Apr 2023 23:22:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230404062204.h5zmotacuye6bodf@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
 <20230401002106.588656-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230401002106.588656-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0052.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0fbaf4-edca-49ad-bf9a-08db34d4e953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFLLzum8MMrf8ucTuVgA6ZX2Nvj4kIYhHALui6nFmGxtCZuZYq4vU1LjUHrpIJZu9an/CM8hNW8i77fVXcYgTAmxH1khIR+oRTgxdWvlWmGZeq+DNbtgx/TyMPx/T6/EROxNjUsVViO/4JaHrF95LhlCHJ1vF6VztFCGNCPHnOLX5fSW0y6CK2/GnlO2JnX70ONMyhx0EmBpJnxMrI6H3oHbC4BTi1QQktMYHINb34Y4gI8V8DdYLq7XCixaYjyaR91XIAVHHefXioed0bTiJyd4PxBMH54KUsAaDmTPOVXZ23PB5/SJCtEGz6O4sPEmky9M8Z1GbABN4hFgCEr8h9AlwV8Ww+D4efvqCJTtyupUkwKsqRMrWs2vWOEDBPf8Ha4nBYVFdo4IE7SrSjuaTG9KqiJcNo1JHa5G7yJC7Eas+8TnkiRzexFiwBvQxgbXWPhvSmpc6MHXGK6vFGXkSzY5fo+/q11v6gr19gaPmeltZRiGL2Gvz7+NzImQbSLSKES1OuVOOENh0F8nAKYyLT/REzfDgX3bbd0AIJVQFfLGeDojpCXwE08bL967XXTa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(38100700002)(4744005)(5660300002)(1076003)(26005)(316002)(6486002)(36756003)(186003)(478600001)(6636002)(86362001)(9686003)(6512007)(6506007)(82960400001)(41300700001)(4326008)(8676002)(8936002)(66476007)(6862004)(66556008)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mh4qGX4moNAq5Vydg3kMLJsYq//HMH+Cmp9zG2uhmN3DuW3UPmEsaiK3/s22?=
 =?us-ascii?Q?vnP9Q945bTFK+gvnldC+CwxV9jKwSmBa+mkaUQDe1kKfgeGkFOBl07eaXh5U?=
 =?us-ascii?Q?dnVV8KVn4mA8Fqv14Yebc/n6U1ELMGKYBY5IztWriGa1cBpbAvA+G9m+uCU+?=
 =?us-ascii?Q?fpI7FJt8nIocozL/ExqdU01fdotiX8s5AxvdAidfPq2oNdSmgtlOiJ1a1FA9?=
 =?us-ascii?Q?qr0WJ+grqETJl1FAVBQpQh28G9vxfyQpLSVuKtq7KTO4tvhysPPoPYWuRLVd?=
 =?us-ascii?Q?ZBEv0BCEda8qYRwawzusmeXjiib7eL8rIVcrFlf+94hqk+bUeybYBNgk4L0Y?=
 =?us-ascii?Q?on8QqVN7fKoF1RuyUxbMLMJkuADfnkh2sUXA6FMf0+sYMnSVEtetzzIGJWks?=
 =?us-ascii?Q?jaSh4Lz11ZyoxHejTG4js9CaIypewgfTN/NzwtewOeQ0FCibZYW1xt43pl0l?=
 =?us-ascii?Q?dM497kex7Jptk9nroInCXoCfxn4ljcJ8pfQHW1mkUi3ZscjB8Vf8nZGqeEAu?=
 =?us-ascii?Q?n3kuZRmS6vpodH7O7l8lAXJ3OjV0L5UTXabcy5GMDeSVBvNkRWobkU6Iv5/D?=
 =?us-ascii?Q?iOXrpP27ObO09F114yZU1txwuhSu+xOF9DA3dGhYg5LL/3NJCZhy9z2HTssB?=
 =?us-ascii?Q?1xK77mP4odei8/N3NYrW/VT8aE/TEv6MZLBrFFqZx64jLJPB+KP2uUs4fua2?=
 =?us-ascii?Q?htfABgqoP+Q/eUrp1CES40f1Y0E9C/2PFBwg+gYv1dJWO/8B40Xefi5IgJXB?=
 =?us-ascii?Q?xV4OZIkC9BjnBq93BfWMvLIRBwftUSLZQLV7W8rUKfxBPCDLlyzGA8QyTPsc?=
 =?us-ascii?Q?rQOQxEDRB1bqu1WjS5A7lxkPRvsAb11Wqwgb5X1hpfcKq6EEwebwBDNqkTyP?=
 =?us-ascii?Q?v8Rusk/JUBNMiJK5K9MTerzUb/OHL+xB5byQWaNWD+ONuDsrdsiRAQiwl/+z?=
 =?us-ascii?Q?flSGqottBuJg/vDacR7cUTrOP5Mt1LcWfvWL7WBNSstypNqBGXKj8XwzDdee?=
 =?us-ascii?Q?aYHWsqzS6QgE51YRs1zLUmVd85f4bRUQeqdhoOw1LBIGU17f0Wwv3ajjtn5f?=
 =?us-ascii?Q?bW7iaJhCRfY/GHJ3LVwwKjtDM863iVIFRWERBW/ZwkWz+QNv6UXsl3KRh9fy?=
 =?us-ascii?Q?k2DBHiem9aNO46k/UorqANKTeD3WTN/SHDpgvJdd1t+u7zK01Gap7GHsv0c/?=
 =?us-ascii?Q?9jrdSR0YTTAfUHwxhHA8/SHJUs8F8gs5+xZh+V7sQVojoAFr3FejqAEWUN5R?=
 =?us-ascii?Q?alIy4xu0XqIq/kF8QQdyLIaULSaED2A3DOmRnyyxUboVFaCIjZbpql4Q/2kj?=
 =?us-ascii?Q?knZTeXw9vuteTBryGlogHIJCSjwH2xJCeKEoY1Rxz8FS8CHeiC4Hu4sFy4dp?=
 =?us-ascii?Q?mvdoCxPdATO+O1Uv2borFDvhVW20GuPGSYK4wsCyPB9NFRQ9sa1JJnRweot1?=
 =?us-ascii?Q?UeAJWdh4gSV10qt0zhGTz24dRymHhR/7MqtswB4/62s9Ax2/n7nXQBrD10+7?=
 =?us-ascii?Q?5TIe11F0gMpkhYKLV4emlDOxnzFAuWF9EReD0zUCFjjpt1hR6/VxMCyEGCaH?=
 =?us-ascii?Q?WgDBaa0VVVOCxKRqjbTRsGZ85qM/LL1kRcOGfp2/kSvP1eQdkJhsm5KC/Pvu?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0fbaf4-edca-49ad-bf9a-08db34d4e953
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:22:05.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEv1IFKVHyhU3DCwDl+nG2nMzSqlNg0xCPqIHVNP7GtrhdqWM97+MdqQw6MM39zbX7COUMSwr9hoV5z/8G1BoFywoxkXDOV+DjBV/ooQHjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/8] drm/xe/irq: Drop IRQ_INIT and
 IRQ_RESET macros
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

On Fri, Mar 31, 2023 at 05:21:01PM -0700, Matt Roper wrote:
>It's no longer necessary to wrap these operations in macros; a simple
>function will suffice.  Also switch to function names that more clearly
>describe what operation is being performed:  unmask_and_enable() and
>mask_and_disable().
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
