Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3A6C7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 16:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807DC10E140;
	Fri,  9 Jun 2023 16:24:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE0610E140
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686327886; x=1717863886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A3TaQ4wk1vjoHXnPmviOaAJr4zUmVbLoQwArxqFvDLs=;
 b=U+XPNptY8nESNrz9zCyOEdSYsGzsF4RUQkKMZ1PZ2u0AErbaHRhjvsTl
 2jPLyOLvLBemLLnSA7ohhXTzeJCZgSPh+YmeoZyo2Mx0t2GdoH00VvcHg
 gV+T6/LB2gTN+xomwFLP/I73LBWvFiKJHizC+HpXI3dCQU8Utg3Zhw6bn
 vCPndBDqFSXhSJgP3ZJRFtr1V9RhJeePTK/Ig+wMqXmWdWxenLMucv6lP
 uo6f6Trzi6w80LFqEp+rmNNtw/m3U2V3iboRRgbMF4+LXOPFoHdOn+mdG
 ybd2XaJ2IyQVrIT7PkUtqusPUC5jKuzJFSBp12fltK5CAmWlRvNSr6TGQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337270517"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="337270517"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 09:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775552107"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="775552107"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2023 09:24:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 09:24:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 09:24:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 09:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoW/gGZinnm2weq3LdhVJZ5BR+/mJWug5ai0lP/YBpmJS05T8tOhvzeY60svUvcWZdBzhRuKl1F3G6G4ZD+523rsv1UgecGh63QqcHVC50/PGXG/21ywXBo4TG2bJaenHNiOi8VPxiYRoycdkqperwh0Pps6fWWuAW1V6W2SKbMJ1ZS1dnB4zUOajg7FmBZ2uMjpaLqDtfWMJ4r0lfbkMf2deYMtpW4PC+s0AY0+q9g3FTnz0OqJXtINwvyGfFM2Llui218iU8gYzEOG/T+nH6nwgwq5CCGtiQt7hXrpT4t182ySWZJayx5ga4qcU5DSvHtvNfGA6eoUrxgNKeuYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyqaSsVV/jlShSpwC7zsY7wMBIsr1HM4BNcZbF8TCUw=;
 b=mI3BIPS5fP5z04Cm2pWjkGBnv3Ysvl4eXy12Gnf23kNzk3Wti1azCc0t1ixWuOj6KOM7ndT1Ku6+gyXDBNtKmw0dWlCUpqR5/+vhXJDY//B2p0v8FRcf+fZ84jrwJ/LM2aqyOsrp+HFSCWAPNuDP8/kmwg5aQN0Z1AX9JkG5UtTr6odLYE+NtBNNsA2fXi2rAwyP9f+wfRr8AdCDZN9GCMnBeiglza/NTeSpucn5WtHJbT5/rxia2dBMrsNmfm9OLuw7ZLScCt8/DuKppcp8ZP+bMRUjAPovkb7a6ObW3ZLXnBOLAOJr2lWJU6RPaYOkg/8GE+Zg13jabSYFSuwPfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 16:24:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 16:24:44 +0000
Date: Fri, 9 Jun 2023 09:24:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <3wvsk24pjbm22zkx4aitlydntvvdk7wj7w3pguszr3bepxhpxm@nox4yhvjo6zz>
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
 <20230609143815.302540-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230609143815.302540-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b893d4a-88dd-4c97-66c1-08db6906092a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yfGe0QKZ1UvbPl4D5v2tcu83r1kK81OfDolWhis9mJQw2SIL/0ZvWcv4fY51OuTNgtQiZr00V9LYGmYx2RVN421WUxNzQDCy68vhoiLFwr+m7jQQWZilQPzxj4rofvYFAqSgk7VdCJxne94ceQeoSZZ5AnGfH+ekpgAwXul0/g1g5HtqmPXFjFvd3VCu20ygckYdk0eojuuWZo71o9XZ2Jw38SCgba0lUr1vZ1arWMBc104QE3mrF4RysyckMEvzWXxcn/7gAhF3P9foRPHJk/g7XESZzODmjsJmsKPNqUC662q9Hde+HnX/0w0ASzulKZ56WAqsAcKMeM0snuXppOYb3oj3fL9uQsEw7/OKqGrKrp3pSZs1s1g5mmkyvc9DZ+YylwTfrCXjVJ85NHAWrgmaxzZ31baJ4mUqDGRlR4ktWGNF1XI9ipm6G2dbziXb+bLlnflv/phL/kPWgQIcRIvYL0CQ9sAauunf1COfO0h44B32kH8D8BnwDBv+5ZKLGmAokkOmepnAXsga3zP/TDnovmD8erNJ9T2yKLhKo/xBOYhjP9hALO2F4hxCB7Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(8676002)(66556008)(478600001)(6666004)(186003)(107886003)(6506007)(6512007)(26005)(9686003)(33716001)(83380400001)(6486002)(4326008)(2906002)(8936002)(82960400001)(38100700002)(6636002)(66476007)(6862004)(66946007)(86362001)(4744005)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYPx7XmvRB3Huyma9C/6rr5O7CHivtv6HvZIfgHyHFtZ6swWEnxlorAI2dqo?=
 =?us-ascii?Q?xtl/DnEjm9gfue1Eo3AYTxqkK6SgK3ZZedS6p1yerLPZwISxrSbfiLVu5WYp?=
 =?us-ascii?Q?ejKn6N+nnf6jyqkvp4LCBXjuljQZ5rPJ4gTPnVVoGfY9KyVNsK5jz7TWrjUI?=
 =?us-ascii?Q?dy/zzQL4qm8JPiN4S9Bt2rWEaGLejMbPTKXsTgjAe65Ikiv/2d8iI/vNGjKk?=
 =?us-ascii?Q?4kXHlK+MH+nIEy9uBf275OvM57Md7NLrRKGee22bAmZLZRSgcC+9QXM7fUU1?=
 =?us-ascii?Q?7CydvkyNL/rCcUl6573/rMUBj+eAyA2HptOLohIdpRtleMcCOfkeHC2dE74V?=
 =?us-ascii?Q?qyZRTv9Pbv3Vj9gHuxq0RtiOJu7jo+4bVQtg4607KqKARduxGO8cGQTwHs6P?=
 =?us-ascii?Q?gxPPTbl/KxVUdYDwC+A4pFkVdh4XLLx4fdV1IJF1WI4UAW3NPzJmTP1skY8A?=
 =?us-ascii?Q?eQoAjMxguEs3jDBssCbtu87gcxsNI3vTUqOjY2haYgBj2A3jAUgil5PDK95M?=
 =?us-ascii?Q?tiZ+geGTXTxRjLlM+cE3EgCVS2VfcIrtKAWVgOXPgJdvj7W3DKgWIWAcpA9X?=
 =?us-ascii?Q?DtVm8e/G5zIFsiypfNW1/IkqvpfrPiZbGRrIAQAIyP1jq/1g89OwGu5XC3BH?=
 =?us-ascii?Q?JyLsaN6kqTD7Otw7KKM69hmiXvAKvJLHNwhum1p3pmRPr5lbbBoeQ/kzqCZl?=
 =?us-ascii?Q?rSyAZ/qwsxU18lVHLf1DdSSiHuOV0cM+aGdlurvRNyA78YtnVzbPz9fF485B?=
 =?us-ascii?Q?KxpGWB4W+uAL+l7aEzft+vOnrRWoajmJF/2min+XL3viZ2NtptdWHBeqA6Gn?=
 =?us-ascii?Q?x7Xo3AHoV6KX/7CFbV9S5v/2P69qRQeh815LDScuxI7RCYL9RFnW0rHsGPah?=
 =?us-ascii?Q?cBg9Mr6snjiFxmel+M/E1lE2w90WKPAW1XOW624cA0POD1nw+PUBFlMMdWz0?=
 =?us-ascii?Q?9XuO6KXqKlkepLdyhq5X8ehdMggDhqyReLZXPeHsCCQAaQDU+sxijcZ/TeXJ?=
 =?us-ascii?Q?NEcljYvYzem8Z8eLX+OQ3lXY5UtQ81ypvWpWbOxxTTLEG4GTqfFWooaBtMhw?=
 =?us-ascii?Q?qmItpvcduUGwRKlaK/uq3VQ4AVJN8WDkT5LxCU4/XvXEv3c8LOVJ0/LjwBDx?=
 =?us-ascii?Q?QRJZlFUYi1TEUl7I2HfEveEIFNvynZ+fWq5h7arpgH59YQggXuGT/XChBSj9?=
 =?us-ascii?Q?BW82NMeI/IAys1fZzxABAxsdGUEgsE3vGftUDUlhEh/fkf2kiUshNwtolhfL?=
 =?us-ascii?Q?fsJga8vWBEUMpJHN9SEjcz01l/e6+TH9dpRJFBkJEg0wok1zm84AtbVKkmX6?=
 =?us-ascii?Q?5ibq/nbBWm4O31pFhu6qndD8w8PNn+I84Wv2AhSfe6WchH0S7RQ3Xrrew3mI?=
 =?us-ascii?Q?/Jnc9wqn83Wq8YzlPdHeAoXlGk8r1tpJ9HVaCt3axW2pVEkW/G9o78bqb+Aa?=
 =?us-ascii?Q?cLlcaKMhbQYRB+p0nysnLuSIyhO57uRs94vvsGpZbBP4iacXznoEnTM+BBBL?=
 =?us-ascii?Q?3liwXo3E5Sc/1yMWA5fDYBMkvUv+CCgyS7Tf1JvzbKZJf+6ALo/fJXBqZaFs?=
 =?us-ascii?Q?dfAGLEm08YOIpmJbfXLSShb6Md5fmN1Bm2LLRsFl5g4Dmbpxz9U02ZqT+Qod?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b893d4a-88dd-4c97-66c1-08db6906092a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:24:44.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvcK0PwHESAr3F50MT9iINNIK0S7/TU2hAdp1W3NX00dIr90oHwjezlA2fz5lmAmgyW1HAfInMDNv+G79/KJKRsysvJComy4LohCmID6vag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/reg_sr: Apply limit to
 register whitelisting
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 11:38:15AM -0300, Gustavo Sousa wrote:
>If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>slots, then it makes sense to refuse going above it.
>
>v2:
>  - Use xe_gt_err() instead of drm_err() for more detailed info in the
>    error message. (Matt)
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
