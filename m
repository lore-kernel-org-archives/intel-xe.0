Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8DAC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 21:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839810E298;
	Fri, 31 Mar 2023 21:57:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6810E298
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680299864; x=1711835864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nYT2pai2iAYztp7vQ7ab77q0T57LQX4QZQfdxoFMV2g=;
 b=j8ijwGEi7XvSTMW954sPR+AuXuKcuB3/ivhUHRw1xIrx3u8HGQydh/5s
 oOogSN3PvACCNEQzNYgudy9geUbmsKqXA+Ty+JuAjQPArNnxLs87Ce7nS
 JTKvTaDWZhulk54O7FFgSgB61G10lXhSBUhR+7OXdOP27TWx7aGem5aqU
 PYQK9Ny6NAD6Ur/AIwcZP941WFxwxWFIVq9EP11GacZVPSKVC0Le/Adgl
 O4qK1cGl5O0gSQ+rGMOrKBgC4CrPaWN94YRlfxon5q6N+vnU5j7HCt1Ml
 hvKNgn9WlvBwKc/Kwc+MgJ4BoyGCJeYsu0uyvcBp4M2ou6dg0nVn+CMdo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="427842492"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="427842492"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 14:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809178726"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809178726"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 14:57:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 14:57:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 14:57:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 14:57:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 14:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8XMc/u2nS/sQ5tf/yzAQINUKPK2eF1fpvCpBtnQaMxOh7RXFHkWh5EsXvNzLZZ/UktcepfooHzIiueBVcta6YvYdtVVaH70q+RdvapeTVdjbV5u10psyE9UnIefpfaJHVP3V8zpKfa2K8Y+K7QMhoSN6OsorJT1Y99mTn4knGmAcojWCfs/eWokfebzqlv3KfZZJ0LoFzSvDb7EIaBAZntPi8vKYXD5fUPmjA6KFFitvsHDY0EnehH/912kzykB8mdHgHRFYj70qroLS+PhoELQ1lbNYNyeOwfry8LI+PzL46CHusZGGC/KcNWVPrdJqv+BOqd2aSr6o/hFMRsXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYT2pai2iAYztp7vQ7ab77q0T57LQX4QZQfdxoFMV2g=;
 b=QdymykE2+K/2QxlMwg8rTdtUTy3I6TNSS6AvNFrgBn0EQ6gckDUZMlVWdrwPDMiw+wHLJyAtQcZZW+YY6yAR7prR4twA0XUHHwNgoPawRkZbhljnYf9zQ2zEfZp/IfzciR+DcyIZ+cD8WRGrJqG1pVLBEtXCSVCsdcHsHl2TsqJ3TARlEFPhBhKNfVEmyew2Rtt/3DVPDJBTm8lxWonzCEZlDFmX8ZPGgZYm8TQ4QVaiTWb8iUQaNL5GB+5ZTqX1Xv7AusSAe1WAoX9dGQD4qNX+pejBYSpohN7DrtR/WisXVYwvPHwuc54ilnERB0y69TNiR5AhbTINhFP+wmZXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 21:57:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 21:57:41 +0000
Date: Fri, 31 Mar 2023 14:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331215738.m7lniqouzelst3yp@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 09973c5f-d068-4b9e-450e-08db3232f2ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PscYgvOJIr2ef5AMNjIPR7rttLSnVgYi8l5qO+cEUua4wH/XnqE1flbSnImBhHpVCprAoUggwIWraS5puQXMQSX1fkN2mMnrOKOXa2RJZnpNdV15ospa/Fzoa95ihFS56dCVr2h/Be+XzrvHGSKYT1KRJnUoM8eItOCDiVfv3p2HT7ZptHr3JF96YETbLXJJB8Ua5hnZbMeVbKMzeghpaMZSn+gU1r9oDOpxOBKhle7lxUA6eyJqzjfihq0eyD1oddtcP7jeOofUc3bLL0KkYXjIRSy691PceA4adzbvAbXEZ53L4IelDJZ7G5or6CS0afoLw8GEJiMbXkokzSBlePeNxwKpthUGw1269vkhSMZKcji45n6RASXmWZ4v5JHKwV8M/+/HhVL/DkZlicFxlvQ8U5I+iA/lddW6QglYq913rN3vUn+tyIqO25pyo2qfV7iwBfXrEukY8MMyfuzdmIfAczDwXS73P29np/s2xvlnwkDUL251T5pSV9qA7gCNV8Zr9eQR2vEGMeMjZXFYCma6r/1/zNBt1Lkuo4ZOzu55VUMKGxvK5wvZBThIzKt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(6486002)(6666004)(9686003)(6506007)(6512007)(1076003)(26005)(6636002)(316002)(478600001)(186003)(66946007)(8676002)(66556008)(41300700001)(6862004)(4326008)(86362001)(4744005)(5660300002)(38100700002)(2906002)(82960400001)(8936002)(66476007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w/Fa/uWvGkpGmrbdfFINCsTCuJ3Edo2SAOIfRKWVqyvcjRfwPn4ek14wMJfm?=
 =?us-ascii?Q?WWcmGkjC908iN3UuB0DxGpsR2yKDT4fjsa5NpsC2J9QEfFlMP3PIbClzay65?=
 =?us-ascii?Q?8So3gljRGmB808KmRsnDbHvMmiRskgs49hjqn8S02dhbiT1bXMaB+umEoSf/?=
 =?us-ascii?Q?ZtX0IrrigSc9LBnsuBrXjMAEE4LGwNgoCLjxC8aJjGUVq/ltnyDOSqwpnqwt?=
 =?us-ascii?Q?699B/QlDrXzj+ubksPyuKAL/drIc9Iixw6aHgRJLHaGJfJwWuN5tmKe3Tk8w?=
 =?us-ascii?Q?gYeNgv1UqE5HQ/uDIqahUe+eIFiYf7pmQmVuGqJaZ7zYHP2ixK5zAEhhJ5tL?=
 =?us-ascii?Q?BT570wRYFXp6fRbsosU/47U+uTLeRo3+ErhbxVBJSoNq5wEYghJtB5JVRsff?=
 =?us-ascii?Q?rlhzQI4hWd7QWWe+m3TTHhdo/OlObSSiGsTZGJhYgiLY9ZWn41GXTocqxW1G?=
 =?us-ascii?Q?vVsji9XGYlXRB7kBCVC8rt+arz8GoKR1rUJ0uYgmgN5IPUDOHmBC/F5yM8iV?=
 =?us-ascii?Q?6Ly+6fsTaqjMDUYFYqW2fiZQYhfhA4NUTOcAdY+p7FyewZGLHj/XGoSa8tPH?=
 =?us-ascii?Q?WF9S31ITnwd4+F1HPFTi5t4ZbdoILyF6L/qqnt7oQjv7mE2C65YqiGfK9LJQ?=
 =?us-ascii?Q?LYUNdYMGb6CUX39uekAKTglj8irwPqdvZ5tcE/sli4/alsp0eyubnYZASBEL?=
 =?us-ascii?Q?rshIj+eplzwOY5afnchjsBSBXCr3uvjlhtDrHtPj5zMCJWYF7H54gWU02Vex?=
 =?us-ascii?Q?UZarTz5AP7BDQcCRrt5bD+mQBqP/HjvW2x5EfTxtJlMRTspafm+NTOq7Trhk?=
 =?us-ascii?Q?6uXX+BS/6wVyqxz1uRPz6k840Kw/tPstBXf2fe++CPtA0325mPXYB2l/gHK4?=
 =?us-ascii?Q?5YbrP5Vak0jR37u1wcKhxPlf3Oa8706smiwrpxIhmY9GFCMMu0C8VKqWNn/x?=
 =?us-ascii?Q?hD/J7dMPXHHOR4p3yEcP8O025oSPYRh3Mx7HyhK/ztIAehCk1FNe5pT9RnWv?=
 =?us-ascii?Q?hm8zbia3Cmdy7I4zhC4OTkjKM+g8BJvR/+oaGyLW8Vowgz9SSjHxIz/B8+NT?=
 =?us-ascii?Q?JRiwnA4MxvqCPX85yWKZlExdg2cjvdm4t3X3zDu3RZCWpVj6x/cAPn67WhmF?=
 =?us-ascii?Q?A4vkjLlSbDOPyWRhqwijYC6hVJeIEAiAmHgVjgmobKcryBVFEaVbykm1/Ifp?=
 =?us-ascii?Q?7G0xqXcjKyR2s74u/W3YiPgE9AJ4VSdIr6SIDYWYbua35F7ClAsDwLhgxDUT?=
 =?us-ascii?Q?w4yUNppKhI35vDfRzYDYyReeFulb506PwwvVbCFDpM+q5xUi1mOkQ7M4Kx1S?=
 =?us-ascii?Q?vvA8Qy8bWhRB2RMd19Y0/DbiKfkGkYMPI4QGGb4HQz3El0kuVwT54xvMYGUq?=
 =?us-ascii?Q?N8NNf9hcOC/Xp7hO7sPtfRnvoxxpoLw80wApxwhphMIHvNuzfn2ZZJShFkGI?=
 =?us-ascii?Q?8KbDKcW/Z3qN86kQ1010LSgUlXkJ8PlQ6gs+pnpcrNeQjZ2O+wi/7Z/TdeY8?=
 =?us-ascii?Q?qB6GEiWSQRL/TxTBNW8CoInVifQKlDIidNQYVSCTpXDXDMeDGJzYkUIB1DW3?=
 =?us-ascii?Q?jb3mCvyQlwq5MY9xf9KTEHLdIwV2yXyEtd22l4PV9X9CwwNVxD66XneQHDqF?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09973c5f-d068-4b9e-450e-08db3232f2ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:57:40.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRzfRYplqEQ2hoZDRyzBbcTe3TVHW2IAG4hr9u1asS5iIk3j50f/5uyBwKXzj1UVZNa+oXLugD/Hd5XBYCYeOeiRv2A0uVi9g699FUj1B8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] drm/xe/irq: Drop gen3_ prefixes
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

On Thu, Mar 30, 2023 at 11:23:58AM -0700, Matt Roper wrote:
>"Gen" terminology should be avoided in the Xe driver and "gen3" refers
>to platforms that are 9 (!!) graphics generations earlier than the
>oldest supported by the Xe driver, so this prefix really doesn't make
>sense.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Not sure what we are going to do with
drivers/gpu/drm/xe/display/ext/i915_irq.c that is tangentially
related.... I think eventually it will be dropped, so let's ignore.

thanks
Lucas De Marchi
