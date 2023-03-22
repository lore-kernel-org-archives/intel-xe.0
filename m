Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C924CC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 04:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8721410E04A;
	Wed, 22 Mar 2023 04:11:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66F010E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 04:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679458270; x=1710994270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xIZTjLpzUirpqmxrm8djteUgHlJFRzEKmChaNsRzLLA=;
 b=TueF+ij8i7bkC1xzqnc9Gp9MVk2A0JgG+BKB2X6Yp4HdH0uT++TYC6sJ
 wUKhWR3fFatHu6bGcuTZw5YGMpRGIKMY4WvR+FKadz6f6I+Dzh39Fzka9
 BVJt8Pcv00PFb1D3yow38eg1/aiECqxK1eCcWvcCMwujWDjNjj2mak1cu
 sFOKLkZJrhfamZVlxfLcD6pXYhH9uk9lfOzTcPkqYKlXGedd1NFKmZWvw
 ObjPx8dH9Ndo3HjcBF2jZAFL4rOEQWcL+9FU6V6ncyPsLiXc7+sp3tEw3
 +DlyjwT9/KkhVb8rtcygOLfJ6ckkdVl+SvFRiDEFlFE126aycGwSdbUko A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340658708"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="340658708"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 21:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750899181"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="750899181"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 21:11:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 21:11:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 21:11:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 21:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVNipFuq7uFRx/PeqQ39hUnD56t1XRbfBIr0pshjAD4H4sMYinSHD8NOlftCX6p87RTp+jlogRuVl245vRBlfOaftjRqu7PzUS3svqkz43/1B5j08ETzZ2JWZ1r8nlII+4g2nUq1ZNBGz5XM/U7+pMx+kXR4zXt4F5iXMg67J3W3pTxZ3rFS1155WmOLM4lD4okOYSP/N3X11iFZBHCfwWiWlm/shuCHpAy0seU9ajcPDQYhHvZTtJCaBdclX5PagipCyWA4jRJrOlE/Ym/de38iJ64c4SA5iNHL1VOsZ+phOrHELyRM/7ds+BS+P0n9WOgS4Ti71GkcsW/Mm4Afug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIZTjLpzUirpqmxrm8djteUgHlJFRzEKmChaNsRzLLA=;
 b=Agx0mdw5X9bgfCzBlfZfSM7DzLWWHVnBP4eZf+NPBRqzehQZnzE0sdYm2TpnOcoRSXNP34wHwaaTTPL1gujPXKYYS5FyFK2JiSrHc6zVFgQvQgWA6Ru6mQ8xOTM4gfqVYfTXKKFGh6euawM++/BttR1/va79TK2R3foQPwpaHoXQ4ca1FY1jgeLVd3JvTGfMHl2r6WK3wly8HX2kk4scbsbF4rrp08R+l12hKXmYYSvF+c2ZJ4yY6sgtsVKqc4AYB2HYGtFqyr/j1X0tJEx/+sd0tbbsFp94SQEADjZgvmt1dHmONLUkj861YpWvKbJqZqWms05QeL2775yw8KjuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 04:11:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 04:11:07 +0000
Date: Tue, 21 Mar 2023 21:11:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230322041101.olgzg74xbu4ei57b@ldmartin-desk2.lan>
References: <20230320174944.650704-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230320174944.650704-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d7c9a7-937b-4890-1784-08db2a8b75da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPINv7cGzz8KBekL0OqSf1hxMc2pdBn29xdfiJll1cAeBNlm+t/Dy8LJd/7LJjqwliqR1FLSkCG1W3KWKUhrkcH5Xn9ooUr7bh1luGPMoW6sKYzqJAv7hzXy7FAFIMQT/vvnZexMPLrtfi43Pqy+7BCr/soCEDDEXaxbzBvHhYVc5/tZ8K/mPMCRT5VSWchoYWFB9XD7Xa3YT1cm3cc5T1IeLkEdTJcpZ7656j5n/wz1ps1KF2xmT/1NrVw+37CBOW+ZIQM6CrVZ0NwYa0ba5kD1UcGpneQ2VM+cw4yLxJKDnD5lBmE8ImxccgbY66d/4VTwFbT/APWKS3TnC82trDxWuhhTym35vr+IrZxahscL7v7MU1UwJcghhoNcTTx1c7737Ys6xo1QUHjnfepguecHkugxYg9ZXIQJJSjjCAZqMYOZGwjO4AnSpmCa0+EHHOOpjrE9IKijrQNq5VkvJQ2EjVGA9uEtNupzv4GeDyVfNc5qQtxOLmYUpAEG4yyKy96f3YGKoxlAQN5UEJbR+MTm/uEQhdT/53EC/SxCdIq4crIIF9mSvt7v7fRNFM2aegUOh56yI03dS9biPP4g6cB6WXjkb3OLYYeSAJCYAE+IWziaTRlaY7PA3bHkljMr+QoA95YDAiFiNzJ4J6/Mzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(6512007)(6636002)(6666004)(1076003)(26005)(5660300002)(478600001)(186003)(6506007)(9686003)(6486002)(83380400001)(316002)(38100700002)(86362001)(82960400001)(66946007)(4744005)(6862004)(41300700001)(2906002)(36756003)(66476007)(8676002)(4326008)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/5WowfOc2AWpjqafsuM2WKJQMT7vbaEMmtBTnxQNLy+FUQKODd+9+N1yDSK?=
 =?us-ascii?Q?L21HztZddQ3UqnH+OUWwl1f5+iKy49bH9BSUdb6YNum/UvL7sip0RtAaQknc?=
 =?us-ascii?Q?z8KR+TxdXUzdgDJeGFNa6kBqXGbSJqnIJ9Ly1Lw3Lc5KrgtA/gf/A4YG7VQV?=
 =?us-ascii?Q?rxXmjSrrUH61d8oAKE9FY9seJgepZKVqDMp0r4xoaSibglmjSnlTjM4ACSyX?=
 =?us-ascii?Q?YpM/3iIv9dfHw34De36kPZDrYXd2rsVpqUPw7FK8dmVQz/mnPkL6U0WqdBw2?=
 =?us-ascii?Q?0Oh1eGn8oKzOpM0qBhrkYgqMC+/h29Yjn/fBfxCcoCL1AZg7bxHeKXRHiM5X?=
 =?us-ascii?Q?rkgXp+bHEW0FLs2Lae58PoQ1pysxrTVhmq2HwzLmRCrdEbBi4o+Rr8TW8kn8?=
 =?us-ascii?Q?GjQs+ORIu/mmvMjUkQ2n5cGQHKSkXkYSbMv7BD3Us6AA9ouHoAS3ifrcPYTh?=
 =?us-ascii?Q?g4nZ3C1T587E9pCk8Kq5kkckKrIFf+O/DeBS5TWhW/7fkw2oGe4YkeqPaGay?=
 =?us-ascii?Q?qZ2d17eBAAdCtnRBPsUcvMJ81fF4SV9UtEw9eTRUPfOb0Nq5aihExk6Z9keG?=
 =?us-ascii?Q?d/KAnZMg3M6dKpcyiwExY/e30fyRoOKpEp/3m14Zf8wt6R5CiexETQQ5Eis2?=
 =?us-ascii?Q?bok+gw64w0dFQOq9SIHsRR6R11MO6pyHHcQzWg7HTVLKi8Q+DbrYsp8xLIgH?=
 =?us-ascii?Q?OBt6ecIcXJnApI8cCjChd59fwnv0kTJmRMKvl2Hkh/oK1bkPerjsfFVg8wug?=
 =?us-ascii?Q?c+2FLhXMckx3tAdfimFopYnkj88KnfRDIXh1KfoLerYUfjI2paFPMhk3lpoH?=
 =?us-ascii?Q?hgXqWKPjvf8d81stOTYDOJyJmON1LmdZv20eT1mqqOmX6c2e8P277+f6lwqT?=
 =?us-ascii?Q?vY5GtIZy4G7VTcoT4nmTNGw3FUiEHkh/b6N1voCLaNG7G8dF/AXnh7rJARHj?=
 =?us-ascii?Q?Te8Wb2Na6x4riy/QpGi7S9ffw1TRlpjvUU9QrzWNT4zkNLfqD/vuUcWe4Ynu?=
 =?us-ascii?Q?UmoSJ7ZF1iV3hgCQFTFX3qaRLJOxUughLU9+AHMjyI397znsmeAKZGPAypdc?=
 =?us-ascii?Q?aT6iNkEsm0PGJhMnzF1groJt2Hkn8pQy4n6eK5/jVEXF5apald+kOyfONzw7?=
 =?us-ascii?Q?RlBxjMEQaMHbhxuQs8GyqnNlrJqton+dpQTraLwpkbkIuI3WPmXqrHgzNzpX?=
 =?us-ascii?Q?eGYGBMBYvWwe44NdHRlp0RsXPVyZUAAOK6/TR33kRHSbQY097EVFATXx2FNE?=
 =?us-ascii?Q?bTk5OPXbBYQ5/nV84L2cwdY7AWk/5v4xqKX2Ws5b5xttZCnvf93pNWY+uh2t?=
 =?us-ascii?Q?Lpky623qpsXXsnG+V/hj6gSOzl10f1tKTHxLdNVhklQ4qtJemA/JBs+KaHiT?=
 =?us-ascii?Q?7dbqwt3LANzy/c3tPcB3C5Vpuwq4jzZlEoKfVO71iXLgTPhGgSAQkQPnopms?=
 =?us-ascii?Q?E2Dwb9G8kJPQx6j1f0X84BE7j/lHeThnlYXt6lGyToCgOytt8nsHRnnSIwFw?=
 =?us-ascii?Q?YMuAXLyy8SdrtdkyueGnIw4237g31hZaejxn6l7ql+eYvpL/WDxT57jCIXmi?=
 =?us-ascii?Q?UZryiskomqKLE9sIzu+hVMvAmZclBV98YXQSbpldFG72Dcoa/FRCFhfpbrSk?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d7c9a7-937b-4890-1784-08db2a8b75da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 04:11:07.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhbwS4zk2ShVzfZulLjEeAeCyaMnPVR6GJW8zinvdhA17X1txBSX/hsHVagmcKcdrgdZ6SWxQJCC5i+cU7bUXbR7GryQB/HJxxT3b47FCwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop zero length arrays
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

On Mon, Mar 20, 2023 at 10:49:44AM -0700, Matthew Brost wrote:
>Zero-length arrays as fake flexible arrays are deprecated and we are
>moving towards adopting C99 flexible-array members instead.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
