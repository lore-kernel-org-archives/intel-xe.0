Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EFC61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1710E6A1;
	Tue, 14 Mar 2023 00:24:45 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800B10E6A1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753483; x=1710289483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VoeI5cb7RuB07usjbVU3vksgz6lo76UVRZFqAJbp7+A=;
 b=XUGaw/vjippFzkCHr4ZWddCU/tD0O4aKPRcMXxGY+7RZ2A2GPgsB4CJ3
 m+CnQCQVzR0qzqHXoiPn6hz7PfuDuunLiT7Hcz7CyGwteqhyqslRFaeO/
 QIecbqr7cGboHTaaVMUV77TWHL0Q5aMxPBH+cxrZCs2RtsJhpbU4zXeie
 2VXDNhk7WYCys79iAcid5iZkzbPAFVmqWoxO9bJbWA8jSISgymL4x4p+e
 bRojDPkLfXrEHSmtPgurcv3xibIx8OQMK6tqE0IzVaOAR4CsQbdgtaz0f
 MbL16VbqsLSyGnVMw2S7Knma2tNK/jSUTzwe1dWudV7KK5JQ9U+N6OJ4K Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316937631"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="316937631"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672111588"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="672111588"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 13 Mar 2023 17:24:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 17:24:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 17:24:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 17:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCsthy23hjuEnIYRt2Fr9/cfInCdSpmKrwW+0iII2AmnmJ0fQOXeOUt/OjaEXS5z6C11CKjE9sQD/L8JBZb5RZwI63WmQ4VIXc8w0bQUdTnrjlR+2fjzYE8peakD6ZNE95zz7/dp3LDKuwXtROHxFgMZBY5JA+CblFtv6RWoV5wyI5Qi9K6VU2nN38YoL3V/xMLNBxDqP2AM+dYBFyjURDrwiN1LJfBn7LcbOhHfiEVdD5LVCyckukTt4wPPuXJzUoxCaGpEFkFzafaKwnVg0vmiF4dR8RTT9C1ClsM/oulUC7QgrcIS5c0ygQV5vdyyll6c/TwPAkPJPmVpg2SGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgLTRx1LINnUjEMZMyDQAWSTOWJ2tckJVAmuj1OpCVc=;
 b=M3uRcemU0ncsbI03NW2ThlpepXa6CMIzCBlb1UJoi9ASFZ3KQjVkjBUlR+sJZHAOeOL/xcgn86ogL7P3NA9y51i5b2ZeAhRlZvym2LhDBKYI+Nemz1KOBlJ25dCib2US3nwfCv74MVz/GBjtx3PlcUO/uYdnJsOneOYrZ8B1CttvCVOKO0D56E+MSJcUyh/RmT0kr9VQt0bHUeRFOfvwW4QqtzD8I/ElVWvn+aWe34iNdIeKyQVHInp+4aQ4qXsKj3KMPwWNjlkSq3TTrpSWUk9wFE5RDjnbNTuTj0DNIayjju5JYbBvHlG/aJKIRqfbClE2DutyC82/jcYjjH4jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 00:24:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Tue, 14 Mar 2023
 00:24:40 +0000
Date: Mon, 13 Mar 2023 17:24:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230314002437.baxfkjubclrc272a@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230309122133.486044-1-jani.nikula@intel.com>
 <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bd4646-47b0-4990-6188-08db24227fec
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3652VKHTMD/JMuH/bsrqC8TcJx4WZW2Bv8WTOmUzyLtvKQvAxlMomKF6+7HJs5Gt3KyZIviukLCiR6QhqwouwgUbhFrtGKOEzJCsI4FqvnlstmiHF86VThQ4Hcg53QfpEaD4JGLOyiTVUmJ0GI3W25ziBgkB/rcDyWJvXsRRY8JiA1ICJZwwB2p5ht+3Tez7cykuVOlnmKCaXm5j8j+jHmlyV47ZRYIl8148+MxEoC4lMHqk814Q2K9U180I2egdM9h3XMIrHSVx015hJRR4brZtB1P0ALJ0zgN7xvvz5FuqUOx0f18Rb8tATCp+QlpHZmaLvo0hcle9M0mZC7YyqQOuO4RxMArLFHH2ZxRyjtvl+w9wSsR9/cqYFzkzJzwM5DNAgEy55UJRuYKT+sv48PxoaF3+o5DoBYS/ckQc9529h+jdKZhrB6Aj5FEj3VHdeFP40FKonEZP711M2Y7bbp/bSqbiv/OSPPuYli5iLnoeQwo7u4Sc3GR1oJ0XIrf3cdVQ9QaTdW/ig/cCVl+eVBbbmCn4X0yi+BUqR+pf7cMWnOHtwrbz9gg/RuS40dMF/IwZRtSQL6xRvTpAwQGiBohBToK1k3m3t73aNFupTtPTaSefsS6nTJNl6d3G39s6A5g7/OYQGzEl1NAGAd3Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(5660300002)(36756003)(83380400001)(186003)(6506007)(478600001)(9686003)(6512007)(1076003)(6666004)(26005)(6486002)(4326008)(66556008)(66476007)(41300700001)(8936002)(6862004)(86362001)(6636002)(8676002)(66946007)(316002)(38100700002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kBgAP74LevC8rUoQ4hyZuirXJNh6cbKPEIRc+aruYLs6RwxT3GN8X45FjsAf?=
 =?us-ascii?Q?TPfkuyQsOzsbr7/wsLeHuLvRff7oVZveX77b/g1QVtw1gKJUvTNPX2FuA6Xz?=
 =?us-ascii?Q?NWmxLEHItsKMd2ymI1ZJH0Vvg5vgKU5xYSBebgJiACf69revPnp194TP9aXA?=
 =?us-ascii?Q?OllHzIBWIvPGfgndfjnswOSZQlrONsUc9K69nzFa9Fvm6mybIjSgCrt6M9Db?=
 =?us-ascii?Q?3oXYOi575iUr9SZBauZZmEd1A18AgfnI1xc4UvYd+E3tCmiRqdlmwbARvKqk?=
 =?us-ascii?Q?fCuz68SqPRC6KL8vCx1rh2gs/mw3fAyt3nmnvx8alhj8ehMGbXlnhsNB0kmd?=
 =?us-ascii?Q?OxLHwpIlbmAEHNDvZ5MYB6Einnm0rsIBw+PWwrw0qT7XHSjQLdPplgFWzgF4?=
 =?us-ascii?Q?3Y0O8J2LTY9cPwIJ0Is1DlozBwpM8IZti6cmJVZhhsskXawvP7aD4DdJfb/2?=
 =?us-ascii?Q?7BJ247BY6eoE+BtX0lRFjO4eh7YrkWXUn+ZAluub7i4v+m0v8/SYx+oKQohM?=
 =?us-ascii?Q?jGyRiH/Wll1KGKCagyT1GWDF43G90TDOOtolrRHz/LwTQ6IUlanDZFNeG+dW?=
 =?us-ascii?Q?a8Hr+PioyCdp9AwFbT7mkuYYGD5Ge3EHSrpfNJEqCoFcbqDxRKfuBT3chmbi?=
 =?us-ascii?Q?izxkXvLCju2ohH3+inY/LQnS7/HE2NAyghCgwXMcFWyw6n63DBHu7+/fxX2K?=
 =?us-ascii?Q?blE6u2NxdiFWO07j6W4jkLQbybvOm5pzASK1383HwoAfwQc3OcDVSV5Ptrbm?=
 =?us-ascii?Q?9M/nqUcYDOM01gjbPaM6kQOVB2gLuUM1RTi7htMp4VZfRZIju5y81Imx9/yU?=
 =?us-ascii?Q?0itlpXsC6udTVzLLY57dcj5Goqrm9MhOLEi4BOs0gaBN3wGhs+HWPneeZeiy?=
 =?us-ascii?Q?k+vzaUNUW7CZ0suSwXg1LbM9sP8/LKRcn0VjOzxAeFezqB5E/FYn+/Xr09j7?=
 =?us-ascii?Q?fGH3XBRpslhRI1DW8z4odu+9HOmmujReLx8K1QZnaYgf8tclF2hJrgZIRg0m?=
 =?us-ascii?Q?xOlHxosE5m2YdFZ7sTZFELSuIUAz8EqLzcTFCmJgyBB2kYsUYM3sjiTGqfkU?=
 =?us-ascii?Q?/jwSZMRrfWGJFZAdg8CA1tj5vf7DsYyrR4QqDR2ORPf53K9VW8kerZiJY5np?=
 =?us-ascii?Q?JIaSBqeP1s60T7W3eu+hXHLaZWDaBbvnKe2IAeej02zDLAmbtIXRMcGNbUUY?=
 =?us-ascii?Q?aHB0Lxvgu7X6epyKSfjHkaRVbjJvgpKVcmGQD4gqtVstAsDXuS81NyL3w8l6?=
 =?us-ascii?Q?25/vc5He788DzZZEC/MLnqnzHOk0IhSzLlnJiNCk7fN1vfKHi0/C+wuAneFw?=
 =?us-ascii?Q?/VkDUTvcPmp6dM7rqfvA2EwB+3gr7Kfrg53KrvmVRAai5HsUOugTip3fV01L?=
 =?us-ascii?Q?KW6aOwg77ABM48dwxFa1PXzd/dgkLB6IFfTTLs/jgchkxIRdw4/rXIUARjqF?=
 =?us-ascii?Q?MPbynKT/KLKWXsmKlAyBVJ/5d3Bkk79SMu4aruXwd4GJOAdzW8/HX/btGqDD?=
 =?us-ascii?Q?EJ1JK8DEYenxhdaMs2ofqMHGEMgKrEu6w2wXpTGEvQDkfFdOQL6dvBlX8THD?=
 =?us-ascii?Q?2S9h8zkJFbkwKOXoc4OJmGedVHYFxj1TBPbXFvzvGv7P1e4mKmASIM+yZRw4?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd4646-47b0-4990-6188-08db24227fec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 00:24:40.1273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLdIdWpwEljv1MNgnBwWfekE1RLun0mqaEJDKcyifeDXHUYQfPSoDRQPSlwsRv+yveDCkub9e/E6ye6OsBCLJ+wR5Jox9VjCQ7DqH5t3Oso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable
 need not be static
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 09:37:34AM -0800, Matt Roper wrote:
>On Thu, Mar 09, 2023 at 02:21:33PM +0200, Jani Nikula wrote:
>> It's just a local variable.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but the commit message should probably say 's/need/should/'. Setting it
as static pretty much breaks setups with 2 devices like TGL + DG2.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index ae2f65c00fa6..529b42d9c9af 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>>  int xe_irq_install(struct xe_device *xe)
>>  {
>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>> -	static irq_handler_t irq_handler;
>> +	irq_handler_t irq_handler;
>>  	int err;
>>
>>  	irq_handler = xe_irq_handler(xe);
>> --
>> 2.39.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
