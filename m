Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0087C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 14:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EBD10E39F;
	Tue,  9 May 2023 14:51:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5B510E391
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683643865; x=1715179865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EyNqIPXff29e3+QVHOLpOmyHkVcPagbJm9i+JGg0E6o=;
 b=Mq1Ci4XiMfpD/rn/cckO2o7h0hJWg5EjbvFllZ7lp1VrfSxeaqXfQu0P
 XSiTXDW2I0kgt9/lT7WoacdsrYSZS2UpWi4MwPoWMtDjSMsLmIxlKRVuf
 k0k84PUV/8aZjB9VXfAtbizO4lL7vZdg3DBQ9CRusM6rvi3D+Q6M0FfK1
 amtQrA6tTMagDOz5SQUgLOMbHn3eh0MG06xjYB8Gg85jteXXF1lpInwRw
 yBC8ayMrcU5zN38BWZjSkI5hzyAAS9giwQjRjGKZuLcrb4aYFHrn6Jl0K
 R4ZhCbYrnWjaRyGcQKwqh4LDO06Kk5mbaibxMai+KqstvWea5UrjTt/06 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330310861"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="330310861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729546779"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="729546779"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2023 07:51:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:51:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:51:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf3Abhw97IqDOMa4E4Pgsg560vn/tmNJASOUJALWfNqPrm+k7qYyalrOnIgR81IiaB/HXK1u7dyjAg4VdpV9pg1/4CcGInvfB54QNwyY2kI7wwXkv/ylyjfpc0ICxtIWd3HdmhkgQBCzzCqtG5D3R0/ZDrEZZolL+LShOwWtqRRZXaYEpI8sIVy1GUwLg8dknsQJliMTSTMAmj4tbamYI2qivjR8Cz9g+dkiU6uQGc5II/5eoBXyMGDJ5fv0WgDs5/wUqg1eKKfidmNckSHnZ+M6Rw9azp5mnJjfTFKQ98wQMTUOK6gpLhHpEO2huibcRkagvJG0vAYSvvMNP5aq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHPWAW1oQCqQXpBcBV6WN1cQqECJ46s2kMZQiF5lNXI=;
 b=e0btbBvDzWUU2iW9itj0I6chI9fDtpt6e8R1c59b4QZRsrXgUx1lyiiMMmOTHGGa2BLtFFkrbXHH5hTfXV7HtVUtoFLhBveRQmQrILLxx2C/Wo2Z0mVGjH3ih1SPr+eEZfQEp8Nb8xuxeyDE+XW1dvpfaNy+8PLbTgWSeX4F45BKjc//mh2NRN4QBBA6wgP1lt7KCnQ3OByuy8EH7/vp6gYvI+/rpE8NIWeLQBDW8l7+rEY5VPL1CwAz7kTXBoinx6icXWWs+KTXPPUhP9PPr17H8KHEMEwWJEqnxRiTroMBEBFU+xbPW/yBwRvDnJ5xBvA94R/dIyEk3cHQJSpk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 14:51:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 14:51:00 +0000
Date: Tue, 9 May 2023 10:50:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFpdyh/APHs1JPmK@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-30-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-30-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: f149db25-3559-4913-8b84-08db509cce05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwjrRdZEWTItAI5vF66EcMuPAo8Tr/p4eczgByjSM0ERpOpWWWaQwv74304+JdpykIcJ+tjT+tZfb5U7F3ysnOjy65gBblKVpYZh13PW/fo9UtlCiE4lqMlCYn2WhFcPsr9rxeXFHxF+wgqK9pKErhSuB/pWPDtN1brf5pWe6/t1kwPPdWktW0TcHqvwjYy9YEtGva/ENi870+4c5zyWzYCGi+uSdP+rHSjs+3/OHZ8f356hTm0IQaU18iRE5p/+2fzHh23FJvI69y6qhc5fSk8pT3DN0qkhU2S45RGumBCmSHbWtBnUp2vCW6qcXKbT7KJsjkOI9nSSloYL2Er7qiYZmU21r6q/NEh8HskBmvCCdCYUUZVOFvW/gWrgLbfvn5wqJpXLu6Hr4LMh0/lLe0pJUkTQXOCQAxO1WGJqpCABpcAd1UcwEX2ZXxtrQphTQc61dqDxvZXHXLrtoTTLn9FHJWs7kCRtW5uFIuIJU6VwaF0B8JFOjcUo81skcZp4VjCqRikjRQvyekArvgJeFhf8clEB7UoHwTCyAPC2z9u/4IGH451mlCOVJ/mEcFH7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(36756003)(83380400001)(2616005)(37006003)(478600001)(6666004)(6486002)(26005)(186003)(6506007)(6512007)(44832011)(2906002)(66476007)(38100700002)(82960400001)(6636002)(66556008)(66946007)(41300700001)(4326008)(8936002)(86362001)(316002)(5660300002)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jqxByYdkBq+21ja08XWeNIh/qeI3J64IqGz08mR880w8CfX9gWC4Czzpblh+?=
 =?us-ascii?Q?nDt1DM+9EoFHamufbdvZRQ8Pc7+TJsbUw9kvoAi0VXU1MqyPKBGXwZ+KhgI6?=
 =?us-ascii?Q?zJgmDN0y7BKJXe3u4Ajonr+473U5xcV1s61/AblQGATYr9dckNZoBrwRN0mN?=
 =?us-ascii?Q?whBi7r7TjVJCxBNjjO3FGYgB+Ydp/w897Hx/gABidimoJW3nnhv5Onw9SaLp?=
 =?us-ascii?Q?QC2mufj9+KL6vT2VGMyR/qcupn77TrfKy7OOWqd5IWnvQxNWWxCAN4dqrCPZ?=
 =?us-ascii?Q?7MzByFewar3Kv404yoq/UeeslHljTZQDGmtTVV/7a4ddjhJiINqpAHVkiSHs?=
 =?us-ascii?Q?rf+5f+COI7m+HqDitqhTyq/I2/IxJwtUmuKG9DVVDdiPpO5xntoiVw+ar7yj?=
 =?us-ascii?Q?DLTGEajHEO4oC45bIN1J0Xn+JYldK0TIvfYp+VY1+Rm9UJ9FH3ttKfGOdWSS?=
 =?us-ascii?Q?yekMwmVPRWrGTL0244UN8NsDjXpZzmZBsq98/U3CbONdDEDwikiOOQoJxoD+?=
 =?us-ascii?Q?t2J4bphYceASDBwbXzk/cgNMYoc6vvRd7o50aIdCnGV46sheOmLq+TbtBkJZ?=
 =?us-ascii?Q?c1ip1NyOfQs1qHEkjALTNCNRTOhuKiDJMkOI1pbI4naeZUPh+eJtJE5qQuob?=
 =?us-ascii?Q?TK+AEPqSs7Z7+kilMen+K/lfFj1Wn9aCUOBTtHSnRncUCgz7ezPkfU1lFCRp?=
 =?us-ascii?Q?aQTsKKFiNgeRFOM6bS7RauM4Euu0zsKH2ENEXAO2SDoQnLVxiyEC3gum1HAx?=
 =?us-ascii?Q?MKcbNW3VYxBlrrYwCKpremyHZzrbNLI9KNxK7rwiFZTntIL2/J0MWe1LqDPc?=
 =?us-ascii?Q?SAM3vtmDKLcsn0aNXYnvDQGqhcRH2bJa0G+4Nzet+mq7Psy2ZPL1hZwkwCOn?=
 =?us-ascii?Q?buiyX51QtBHaAYF/IY+/xkhGQ+67t8lVu1f9h2+94HEIpuFZmYrMJfNdkm8t?=
 =?us-ascii?Q?qhH4g72oGBW+dw4HUjx/doNFzyMe7xoG4gSfPwDCzJIfRiRVnnNDh76eHEnM?=
 =?us-ascii?Q?JTN7hlvMM1Dbg187Fhp2uECTaAC0qmIbgiWR55Ikzi42YlCP3gn0EQEt7KmW?=
 =?us-ascii?Q?do7oQgBVbVt3HTns1tQ4kxOWA4t+oxyAUutjLIvFkPWI42a8WdZmCA8GTaV5?=
 =?us-ascii?Q?wNvp5n4UvAqRi5vR/UsMwKWSZaY/647HW7/yb3H4L1o+a8aVw+KUKC1kmPt2?=
 =?us-ascii?Q?o9307DIpZ9EJ1f/0Hsc+ZTrh1BWFPmRNcszkrUstPm9a2obsDUnqUq+juVuj?=
 =?us-ascii?Q?EaDQdKEvAJXhdrwkWfiSvKdPmySNHTiI/l3BFnJLUdv7OCXKEIIcX7O8kTpS?=
 =?us-ascii?Q?FvDFNRFbrx6BOW5F6uzMRYx6TPrMnPJCrKunAcj/PeunhGwxzwzCNhPZOSWT?=
 =?us-ascii?Q?8R60wNHzUCf8c+nDLxsE7fG59vobztgGy2zCFJA162xLP4PgZXusXqJJsiFb?=
 =?us-ascii?Q?3VKRlRytD3qfwsR4u1nvqG7omTt2f36zpdiIQwa5BEW87aWHEB5xGHYH+P2d?=
 =?us-ascii?Q?iWAfkWHvrKYMZd9Msu2B+s2znnRqcFe8bcIEsDSjyAmaHarVKPWfCey52tdZ?=
 =?us-ascii?Q?lihnILRyYq7vUHXfqZrIWQAmM+ld2qBR8dT5boZKskLyJVzPW/GM7dQYKUH/?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f149db25-3559-4913-8b84-08db509cce05
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:51:00.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTQunopuMFFmYod8TCq4lXxbGW5p+mU+xdn0exD/1gLYfBYhV3h6yxCCnjtNVs7AeuXvVEuerpPbO5otR8qmmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 29/31] drm/xe: Allow compute VMs to output
 dma-fences on binds
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

On Mon, May 01, 2023 at 05:17:25PM -0700, Matthew Brost wrote:
> Binds are not long running jobs thus we can export dma-fences even if a
> VM is in compute mode.

is this true independent of the series? or something changed in the
series that made this to be true?

I wonder if this is not a good candidate for standalone patch...

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 55cced8870e6..07023506ce6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3047,7 +3047,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>  					  &syncs_user[num_syncs], false,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_fault_mode(vm));
>  		if (err)
>  			goto free_syncs;
>  	}
> -- 
> 2.34.1
> 
