Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0F2C77B7F
	for <intel-xe@archiver.kernel.org>; Sat, 20 May 2023 05:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9810E12D;
	Sat, 20 May 2023 05:01:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE3E10E12D
 for <intel-xe@lists.freedesktop.org>; Sat, 20 May 2023 05:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684558861; x=1716094861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kueNZz/CUlPRKJg+FMNJR4LI+ZrAS4eSNcDqYyOC9Sw=;
 b=Q9pTg32FnAQWyhuvEAXdM9MHv0f9UCDHzwE+6oqb2nZ/33SKjm4BJFRY
 PydxpjvfeFQmJDY8XRI9PgpdF/hOE5neNZ5FGiN3beLNYo/2axTHxEs8N
 aYzgJkXoTWal40ujnl9NYlsRLASSgtdL6gS0/0lx91HWIz1JN27WPSf/9
 RFLG7ufEAKZmE0IF2+rTk2eJghxQzcN65kUVl+zTPsIESgRKcn8n6N6bJ
 A7Hj4N1zuLtds85C/7C9A7IwS+4zy3yD3+M8r9vuui+5QX6vFjfdzZKfD
 OhoW+RcMTxC35N7vG6EfqS9IZoklhF5525JrVwVMR39FoOt1x16ON0kar A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="341994717"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="341994717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 22:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="792602447"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="792602447"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 19 May 2023 22:01:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 22:00:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 22:00:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 22:00:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 22:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WATlRO5cl1HgUHlbQHpzUSwgKsFuvNyv9Na52Rv/fTrTgTZzgukVlV3+zzDZc5m67t0+r8PGxHGpJIaQYKlo6CU44xsAarVHziEu7Pn9dCX1razw4yzX0ikwKxbdgiTsdwWjo7oiBP/Mi3qWBubNVkQ3IObL6HaE+Bbi4ZGBkQMY5RoKz3FXfMc39vsbiHUJRM/oJ1mNVRhbwRhHOG46brDPIsc6Kgo0fL+V9sIoF1fz0SZEFM+LMjxlbPsf0hvyBiJCDnz8WrohWH/jt4sSov1pSirwEL6HgiGPPKL/5V6WIuhnppsoeCGhweaTD8vNFDhKIruwZ2e/s4vz9PeW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6VYKQkjauJrCJGGrM1TNn54NptvWbSPB8ohtzC/0Vc=;
 b=W9eW7ak3rYLj1tgUj3GqgwPmNzffjrW2LMuM4uNH8KOBtudQBJTFDyCtFavP7706Oz5xHMoGDrXQ7OLvA6eG0sNKA3eVuKvJYNYpaGuf/e0qmdvOqsgZ2HYd+K/u5zf5HljSawVCSIa6lI3ju9JSiqwxcRibNQAODmUeshNlONT/8TdwZ7okAn3Lt3IrDSEBFmVOuQk+tfg0E8OhjSMz0ziB0M5a+xVcRcJDe7ajD7VP9hbE2dMOpwVODiRM8P1VXaiOhnPbfDXNn+WNpkM/2h492DtvesYnd8VFpUe+7CZ4KtYbK3KZPYRLMvLxFlhK0UdNpkunXq/pyRNTa0QGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Sat, 20 May
 2023 05:00:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 05:00:49 +0000
Date: Fri, 19 May 2023 22:00:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <koukeqwn2rtsn2n3bhko3oppcs667i7jboiikh77g6n7j2cjkv@znq7rxwdsaiz>
X-Patchwork-Hint: comment
References: <20230519095618.1160-1-michal.wajdeczko@intel.com>
 <20230519163944.GD10045@mdroper-desk1.amr.corp.intel.com>
 <e58e0776-014e-32ed-c0e6-98eea9376adc@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e58e0776-014e-32ed-c0e6-98eea9376adc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f5bea5-4cc7-4c0c-be25-08db58ef2d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XhllTpF/GoFFYvdG8ofYr8H41hilWkpxpNljLa5R6Gbo1x2rtFeQ17Umn6PxmR0VS5zPU1DhL2JthfqAgUaYUtQEkDCLjvdi0OVGjcly+PWmw8fL08UCyUjCWAG7y2FxCyGhp25deuU6HP+b3xNvA7UiXlTV6YCG8YYeW2xYgrXBUqIHwOycdKFeCbitxluxYSJKF8Vz9I1IM2bEbhTlcUEnhm5m11oEqRvNvTrY1H0/J3IHMjALmwA9TMISB5ySbL7/lzppHhDMjJem7byaXvhiOYQDjXI2ZCfqn0KifhI6seYkFSSOfH90rZw+rwbGX1UpDCAuRihIvvm1MyyAr2/dFoYjO5NXR29i8FQO6UFIUZIviPN9Zcif9ePw0gJ4Qvr2dQ6oGF6XyrwO8fSTqBqKSafWRa2xMBsaFwe2TTTABbRlV/1m2Kt7imgJw8/qm9CB67TnJ2OlKnukNtXpeHxWwtqa3S8fb+wch3B6h7+uparJGVO7pTXjn1DLEoC5o8zT3vrua/v5YZO+75S1lteZlxG5Fh5uFa4+W0ltXMEFAS0KjNTVupygyR8+woh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199021)(2906002)(478600001)(41300700001)(6862004)(8676002)(8936002)(6636002)(4326008)(316002)(6666004)(6486002)(66476007)(66946007)(66556008)(5660300002)(6506007)(6512007)(26005)(9686003)(33716001)(186003)(38100700002)(82960400001)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6EkVuseK+xobaq29EtKsRYCZHiPmD777esFBIFHD5r/8tDK0hL7bPd+C0yX?=
 =?us-ascii?Q?oMbqhhX5c7yyBo7Hba/cDg4MFuHi0zjj5uTh4Xya4Yg1Nm2ZWpHumDBegCaQ?=
 =?us-ascii?Q?rflX07Wuiov19HY9QhwSUtnZjPaLI5Y244QdESN79s1y8lV07ERr5DM2Z6Og?=
 =?us-ascii?Q?LuRZx1JHV7wUJGgzo+JkGsrbn/yCxVOEca/RRgzsuX79rYqNd28x7LVrIfLk?=
 =?us-ascii?Q?/OWT6hrKtbnIw9r7XRFMhitBF9doGqaNWy54fZvdh84bcfcVG5i1QIrLUluy?=
 =?us-ascii?Q?txrRzjaDFs5i6VaTE6ySYcJxdN+baPdh7mmaX/WoSH8kt+3B4LFD6zgY4Yis?=
 =?us-ascii?Q?Qj70x96Z+4R4fnbpXpRoOh2DfJRvyHy/lmdwiw7Yhp/ZgOolNLeUHJ4QeW5U?=
 =?us-ascii?Q?g4A1SlL/Mp4QcTx0owzRIYobQ5kPbGSMDkj0omBm8JuoC0NF0qFy+/Ou5xgg?=
 =?us-ascii?Q?ks+Wm81CW5/cYZgpcbHUPiuPFzJMTAX5vnxNDCBqsiNISgiuy/BeZjn3HSuQ?=
 =?us-ascii?Q?mOUZduAVt1Q6AVmOrWH47CZiRUWwHcvd6f38uzZYLIJeAfMp8LUsj6yzxwXb?=
 =?us-ascii?Q?jQoFBIIE3WcPNrsbygH52OIA+IJHs1OXZeOD6EVyc53jNdCXQkOejrE18fCu?=
 =?us-ascii?Q?0fCEc3xa1bMaCVLMZhsAloNzA23eL2Ujgw8ltiIv+x2HILhxrDGhu8UjThcy?=
 =?us-ascii?Q?yeq055SJG/5tYoPjdZuPx0e/XDwLg7cirhFvGTcrUGDN6jqfC1Mds4l1VLtu?=
 =?us-ascii?Q?lfIfptElejMd5VacLzN4X57mKQabL1qbvXM3x1ACKz80TEkkhxjEOzlry44S?=
 =?us-ascii?Q?VjII4Pz5AlIe/efKC/xp8RyJ3BfnA/pVOha/J5ihozK16HTpiG/zLdWU58Pc?=
 =?us-ascii?Q?HwaSa5yZ83ueZruc2aOwLonYaKwiz3sNY/uPuzqntD+EWYdvwq0jfLzBSYSr?=
 =?us-ascii?Q?uqgXDyoNG1OrSffLbMfc7ypXliao4k0+GvJU+bP772QUIBRmBM07q59IBDT5?=
 =?us-ascii?Q?NMV4NQcwkjiMfl3EkeI3x8wvGHQcyGWqs5X0yxjY47p1ZwBEg88XIXJuD0hK?=
 =?us-ascii?Q?YS8a+Fc71IXLiXTG3FN99X3MBeS1+fnKfI7uivrfv5qQj8iti1749VTysye6?=
 =?us-ascii?Q?nJZYPNQejZcC8Gd8v6FoMJnvfSseo8o8HRuOaml+4yDyoYYTlVIA1IUMLJTB?=
 =?us-ascii?Q?PaLQKYXEU9rX3T6lSDrMUBsmg6lZm6A9EmWiDwNcD3mFTirm7qSeym/aqzfC?=
 =?us-ascii?Q?oTP06NNVtjBZ0s7ioie/QQ14/R8GV/lcMAnE8H0tBfPb3PzO6ufbyFQipH3T?=
 =?us-ascii?Q?wHamzc5jdpxfawV1c6Z5Rm3Zebb1XpGNJt7BooBDCRJ3czjQOK+xRo7NiiuC?=
 =?us-ascii?Q?NMTdbRj+6VLggth5Zbay+SN5xwQSHNHIuoVnWbtH9B9/USpquw5ELi29kUKT?=
 =?us-ascii?Q?/WfjWTn+E+MJmDn+B7CLxY86jzQar9/9n5x3ra+QKhSRQiUtTicItQc979cU?=
 =?us-ascii?Q?wYQn9QM3vSX20mLCLdakxTxGs6ooza4BEVbgHeCRYS2VRblVPghZI7weEVbV?=
 =?us-ascii?Q?Hyn4pGVz/yE83u81e4v10bGGIxjnwoJ4eKEs02Biq+blQ0snkm95OWHxrvIg?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f5bea5-4cc7-4c0c-be25-08db58ef2d7b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 05:00:48.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8UZHGEH8r0Cc3EPhT8gvmSqmzuQI6OI+IlIkIRJtK9aOJxv68VAh+p21h4EU0R7kue7+xv3fiZGR7ngo1fjgRnmOFybdwZKqBcaXvPkxoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Change GuC interrupt data
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

On Fri, May 19, 2023 at 06:49:53PM +0200, Michal Wajdeczko wrote:
>
>
>On 19.05.2023 18:39, Matt Roper wrote:
>> On Fri, May 19, 2023 at 11:56:18AM +0200, Michal Wajdeczko wrote:
>>> Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
>>> additional payload data to the GuC but this capability is not
>>> used by the firmware yet.
>>>
>>> Stop using value mandated by legacy GuC interrupt register and
>>> use default notify value (zero) instead.
>>>
>>> Bspec: 49813, 63363
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> Looks like GUC_SEND_TRIGGER was only relevant to the old
>> HOST2GUC_INT_REG register (0xc4c8) that was used through gen9.  Should
>> we remove the #define for that bit from the header as well?
>
>I've already prepared follow up patches to fix that, will post now:
>
>drm/xe: Reorder GuC interrupt register definition

that would be better a commit reordering the header, possibly in an
automated/mechanical way.

>drm/xe: Drop legacy GuC interrupt register definition

better not leave the unused define so this removal should be done
together with the last user of it.

Lucas De Marchi
