Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B4C7619A
	for <intel-xe@archiver.kernel.org>; Sat, 18 Mar 2023 04:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90B78876A;
	Sat, 18 Mar 2023 04:35:53 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8C810E036
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Mar 2023 04:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679114152; x=1710650152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QltIeo4DQwvFDfPGKy5mrYEHy3ym4Tud3uG2uh9Fa8w=;
 b=IW1fv4Itw/vlDyOATHHSyipJuiwkIhVQzVMA3osTTGZtV6cPS4Wz4HaZ
 L4Zlx2Z6idQh2kuARIdE40a2TIV5OPUtbCmfjRhLCMyn1E+sqEiypnuXI
 tCkLxZoeHm2UzP0015t9855DBxZzSeWwIUblqEe1XGUZHdmlLeV8d6jhz
 Lk9yfRzcVOm/O4QceXMm1WN8Xd6Kuhnp/dzbLT1NZunDvm2x90+3aRUXi
 4DvwzQB0hOuDIqyfiTZPrIlDFi3EKRVQXXl8fopXuVI8f17+S5lngvT+o
 Ay2C7o0alwDUYNif2KKxmLNlQbJ87cQNuLd0qGkgkMCSzYWf6zL8RIQLU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326770614"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="326770614"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 21:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823885362"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="823885362"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 21:35:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 21:35:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 21:35:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 21:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfbGd+XkhZFFlv2ypq/Q/Q5Ej2lYFyiccmv2Xzfq8bcXxzGVdEEp57QfHa49yDbm1myAQ3Fk2jwH/YnzwJWFxp40PlcsaPJIKReHOOfETLkFTA9c5b2alkyqFT3iKPOAhPTShpVlhRcux9eZ+LVOCHkxqSHjJLf/2NMNOMrehAGQvcruLHjwUI0zWnNLhtrYyi7+EYUBo8SgbeuCBBvW9S0GB5YOPbL9YP6c+xQJFB6/r6xkbRH/9CRwJtycPCFjXoEFsrNaDEeK/s3PmOjtcU3CxdH3RsJgH5sqo1G1G95hbP6zhCji/6hKeee4waxqGL9asTeRgQHTruSYlcsNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QltIeo4DQwvFDfPGKy5mrYEHy3ym4Tud3uG2uh9Fa8w=;
 b=cKZMvJDbuA1egqVlqYMv1XcjP0aN5CT5PfNXQJ2PQjJ5d/Pgk3UL43ZQMq04CmFTIZsBYT0SWEfPuwLUts3DqqnZjBuFm50xX9jxVv6cp6d1B+7q0ETZ4mFHs+7lkH1NVQK2qZ0wZs8+1VRHIP+gxXOk+RLfxN9xi+l418b0xxRGRwg+d3RS6ZLItAJMHf3NmmsYC/7rK8wDz+wkWqnpXjOOZBue76LDvD6w72b3EZuAntdQA9tyQadTGQXbSGrNvtQ4VRmh0PmKT/uC6yu0Bg9HyesvMPprcwhWdyr74g4dKDorJATW+gH04DK7YXfxInJjEJYCJW/na0TfP6aNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sat, 18 Mar
 2023 04:35:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Sat, 18 Mar 2023
 04:35:38 +0000
Date: Fri, 17 Mar 2023 21:35:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230318043536.dqv6xcd2d7mr4i24@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230317062213.225989-1-matthew.brost@intel.com>
 <20230317154503.ckbb64gbcxwhzouk@ldmartin-desk2.jf.intel.com>
 <ZBTdHB8gfEYvQN9o@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZBTdHB8gfEYvQN9o@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4dc995-9f9b-4d33-3f95-08db276a38fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJhKnOnpG0GwPF8glMRykwq0JxnISVWwzhOuiYMz2aYTtxsJzgIXJPg37hwqiDW9a9mC4v/5tvpE/ot3bAQDEEHN5GSCKhNJHqIdkotUojaph/qTlEiXdIVw7tj7Wr1lFrZyutyiUGE8zYW17e03YrPfure7fwP1CFEAbhgQIMimJwikOGAZFstSUEOecsFMDBIs96t+xZvymMqVy2yrHXhQQyqryBAXtKx8G7NB2/10ofOCob2/dA5ZbPGFnctm//h8Ud3ArAX+zMO4g/XgwLKPxXGIMG79z/VjD2giySb6xRN1yOWLDjhkPvpt4FtEINj0vgFY+0MDH6Xm0VG9le2Uxigx5SjJ0RelzO7jCoXMXh8Pye/3NLqjCkfYuWPIIfrsa9wUHiwknpyHF9X5n9h0LgheNnEXA1KTX+x/nj/Wlwqn9E+bSSmep6JFWv2kvQfcgiXwHPuZw8G6pN+MRoYv//5wN5cpnz8stC9GeLzp2KivWV192nS+bukkz9Wi+dQtLvtmszdlDAAgxQne9Tewf/yIbji5Rx6FFbhA+WYbeiL9f9XL0UHn3B26k4RcUUcCl4KCDsoqHgT8Lq1USCJSAWbzADTCv2bhOsAklJHPsT9mKHXKtw5FmDjgKIWvxQ0SB77HQ8bSR0tasGkFyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(41300700001)(82960400001)(6636002)(66476007)(4326008)(66946007)(8936002)(8676002)(86362001)(38100700002)(66556008)(478600001)(26005)(1076003)(6506007)(6486002)(186003)(6862004)(6512007)(2906002)(4744005)(316002)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sL7AQSzcGKEkKcJ37WG7KxJ0l04Kx8JvAJVimO6U8ierztrW0rsNBQ+Xfq78?=
 =?us-ascii?Q?MJh1JPdcO1Zdr/fJelBDZdsXsPcV1zdhGk0yz0hnp6PPnl54EbbZPkLoLaNT?=
 =?us-ascii?Q?jBDOyazd5o6TlNRs3Le4C5SO7LZVVYInABKwIYVtborKb+PXsaRtvnblyeWY?=
 =?us-ascii?Q?szmyGcb1wPTBPHrLr/nRM82zAm9G8mz3apnmXj6Q7eRfQRT4xNAS+X0+/bWo?=
 =?us-ascii?Q?hopP+FwnJXvLaHyC4I6/mgBU/NhsXO4m8+yusrgtFxRg+g5sKvZwA2XiI4m0?=
 =?us-ascii?Q?BykjWKD7WJUFHRnfajqsTcYVq4Y/DszLy4gntNiaDYCWBXRHSHPZ7Aisqdv9?=
 =?us-ascii?Q?JdwjIRY6rPR67Ds5f7wNGgMyCL3F70bF0fyKtPc2dq7UPganvzXD/KdYaE3U?=
 =?us-ascii?Q?037NDlHYM3w6A9E1C+MiZbqz2uqEsh3WclFo3Ofv60MXnJDGpzZIQz6Gdav4?=
 =?us-ascii?Q?aJexRWRyBCXrtRoVL9IP1VntYdHLouoMGc263jtlpgWyprXDVd5KfeUEbeNv?=
 =?us-ascii?Q?eADrsFUryU1ED2o3bvvmG6jlrjJFUO08cpjxq8zAdTXDcs4p9QvL+IQjJBA+?=
 =?us-ascii?Q?rhI43/3ShIWmtap9eaNZ/z0xqEddb/JWvJPwml+nX1meuA98EBQmvvU30kcb?=
 =?us-ascii?Q?OCclmBpGqSY67nVeYPXHZzHO9ePOT9HtrICbPBHRI1njJBhmUM3KMlZhj8Du?=
 =?us-ascii?Q?27QaoIJHHeGJPqZJz4BZH1jXPSMHW3q0I6LdZ8+f8Kxao/yPTgKhvXIsfqR/?=
 =?us-ascii?Q?lWZIvw1UEmCEAsb6a8e9XvYyIsQn8DRcqaW0Iysm0f4gBEB4Nd4VGsZ5fxH+?=
 =?us-ascii?Q?/Ddb/z5jfph9uBdjJSzjBHbJyQemxzanrmshaRsIzo5GI1tb6nw+wOb7XFjf?=
 =?us-ascii?Q?434p25Njmp0zw6S5oMZHq1H83ouPUdnu2lwutwTIQAkxFlpyHHGlsOoTEeL9?=
 =?us-ascii?Q?U71am/T8bOMe0ZYcBPJa4MhhmZzKcov2V10vSxDGv9UhWtB+CHIEmwUVtZB7?=
 =?us-ascii?Q?xl21Dz1qvGRQ06NcmE6A1ae5IscHaqZEgpb02ldRwIkr+n5+BPBNBrJyu7j0?=
 =?us-ascii?Q?4fMnmXfEDmMPT3eeNxKnkl1z0aSz6nVd2fDpZZeQj9/5YJe26hy1O78lfFCB?=
 =?us-ascii?Q?C0XrprH/QJS4mGgbAE5X3iX1K9/4MnxiNy6K0ynrmqQphRRGbVWii7x4h30O?=
 =?us-ascii?Q?nRM7UcNFqZgj3Ol+wYim2R6E4SHEBzUV7u+IAY5yYgTrUPd1zl9KJyFrlKfA?=
 =?us-ascii?Q?8lH/QiAF/tKOODVbbOUvLsA3XowTdZz51oZa/kK6/aeUJK3KO1jw3y7d5IS8?=
 =?us-ascii?Q?n3q08hdDrk+UHvtvpZIeMhF0YPWFVjowg9UcJnvH0jl9rni9XZBhVyG5cMhu?=
 =?us-ascii?Q?unzzqy7/aEYQ22lV6aOmEGMQds3NCN2HOQGXJvldHk+PWbYM0uOEUuOaKarP?=
 =?us-ascii?Q?jdeuiUylTRRYKfBfokyygIHFxMPA/DvOZwIHnIthQqjRsyPWUI0/FVy08vbc?=
 =?us-ascii?Q?0Iu+7lfBN0j1bpQxoR6E3Pjz6hJvbprYw7rgEXg+h6rE9oUjToT8GgIe4+Qy?=
 =?us-ascii?Q?L6Wphy3EuEOvxx6F5V52FyFVly9x2z4WHEjCj3203aO4M1YIsWCqlKdNIeju?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4dc995-9f9b-4d33-3f95-08db276a38fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 04:35:38.1615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxKQYu52jonU2JNlgqkqGDjqFb7vTW5KzFzXqf1qY5qa8+fwh9cqp1HHN8mJrk5RbXW5fQop106PMqe2rqL+rvIMfNn/Yzl3XG+l6qIvKys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

On Fri, Mar 17, 2023 at 09:35:24PM +0000, Matthew Brost wrote:
>On Fri, Mar 17, 2023 at 08:45:03AM -0700, Lucas De Marchi wrote:
>> On Thu, Mar 16, 2023 at 11:22:13PM -0700, Matthew Brost wrote:
>> > Rather waiting for the VM to be destroyed (all refs to VM go to zero),
>> > drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
>> > This avoids a window where user space can create a faulting VM, close
>> > it, and a subsequent creation of a non-faulting VM fails.
>> >
>> > VLK-45296
>>
>> you have garbage leftover here. Please open an issue in gitlab to be
>> able to reference it.
>>
>
>So no referencing internal Jiras? I thought iy fine to do so.

no, it's not. It means nothing externally. The only acceptable number is
a bspec reference, probably for historic reasons.

in upstream we should be using

"References: <issue in a public location that has more details/discussion around what's being fixed>"

Lucas De Marchi

>
>Matt
>
>> Lucas De Marchi
