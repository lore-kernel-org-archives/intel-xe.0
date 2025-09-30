Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FE4CCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 14:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAAF10E5E7;
	Tue, 30 Sep 2025 14:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnv4rAZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5CC10E5E7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759243230; x=1790779230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ylLLzHhJl3SUZpc6KY+z9aYyT7KRg6s++MIrcKItRWs=;
 b=gnv4rAZF9ogwJWbjSXi18BsKLgfhrZ2+bhKy+bNB2BW8BYMMv1oP6OKa
 GSCetryCY5iGPrH9sC36k3Nc6FzpOWlcqqTg/uuJfrvb+vyuq/MXdiACg
 1OHVxzTsVJ+ejWP7M5mhXoL/Iy015oX43yQRguvfY5klpiymShjyN3x7k
 y977zy0MzDMmqAC8nj/NRPfZJu5A52IxsILXwZUfOSJ7GfbLiq10bRwH2
 7e476vIqhZb5aRIyaY62196OuJWfMET4IaNxm9cOQVB/lUZgp8GEYhg+n
 xpkhkhwZfq/F3AEb/kMQcAJAubIiGQ+/feAPXQ5BvaBdWRRH0R6ejjS5G Q==;
X-CSE-ConnectionGUID: iz0fiq6ySW+xXdp0vfX4Vg==
X-CSE-MsgGUID: 6Vghb76zQzWmK7KhYGt2Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65322998"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65322998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:40:30 -0700
X-CSE-ConnectionGUID: IOrvYLbGRg6do78DL87x0A==
X-CSE-MsgGUID: 0yinNmq8T1uUhlC4Wr+0Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177811834"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:40:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:40:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 07:40:10 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBEhSuuEmAoqCgiOv+E5H/zU427/osES3sZHhPJ3hg5WTOiojubIVcBVrWgibLK78BQ+y87lpoZSURnSQ+ncMF/aCj1jIx6Meio0rmwI6x8nnGwLD+054j6keaf6RSKFEbKu23HZVp9voLcivdq+sipZ5CErE4sPrW9ypmqyO2HaLEkRw7MtoOoE3YOv6NLn9Guew91pUT10e7ewz/iCCRQwmOOaio669FP6+dVM1lCaMLW5LdSMi8pUgmZ8r1gw2X+2G5RwYrYgnqQdgPKW8Ng0EYwKAcyNdu2DrsSz2/JoV1hDpKXRll1Ksf2/yiVtAVNw5ywS37WingNOhYzWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubXke/nOIl/LJq45QvdvguceUjECLdjlR9ts1VqXpe4=;
 b=USZ7dPS6ramoPcxP2W0kRu6/6U8Nf05YY+m1LFtzVnDB6lhohjnGWPdlomstyqD4PY96pSEzFE8Kp3nthM5Bq22nUk0TzfYcKqW8Uxrrhb91lq8q+bnYlV1htd4EIzQWDNXG9LUsXTgGwZFy4Se+zyU3Jg4DiiM47sokUAO0qkuqGcdhdq82YqsVhX3NmNEZpbXTqvwQ/tPcBDCRjkh0U9jaZaS+s/BK0bocy7TUUFhu8yPBcX+wQ7t/1UQ16jIfrC2WEJ6NtJN1AEPFIcICdjgGHNXrykK5tFrwY92McEmGTbf1oPrhtjYxudZblxzZKdboC69xWHAncyhyo0uF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 14:39:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 14:39:19 +0000
Date: Tue, 30 Sep 2025 07:39:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 36/36] drm/xe/guc: Increase wait timeout to 2sec after
 BUSY reply from GuC
Message-ID: <aNvrlJjaR8UD/KOQ@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-37-matthew.brost@intel.com>
 <7caa086c-d90d-4ca8-ab1b-7241e9d8c0df@intel.com>
 <aNvPhmgEhCpGSGW4@lstrano-desk.jf.intel.com>
 <e810ff32-f250-4ee2-b6f7-815bd48c412a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e810ff32-f250-4ee2-b6f7-815bd48c412a@intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: dda01ea0-8aae-4343-5b5e-08de002f2335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hIifOH4R1kbN8IKqtHA6uQW8Wlv+UQo5xb3Khgc8y/siUruZskjqFhDMan6K?=
 =?us-ascii?Q?7RIAmrx3RdxGYY9968/jgLSM5dLqfNQnQ+N7DL4Sdt/SOGcVXhBcytgJQLVJ?=
 =?us-ascii?Q?vRrRWNdTX7jLpECpq1EWgXtEU4jKrhmmtT9Vsf2e6QHobLc8qSg/RYOKlCjR?=
 =?us-ascii?Q?OjWx9u0nXl2s7l4bu2I2BWVL6ggT1bWs2oSYxOMJJDcTTAjQ9psNZqadQDc9?=
 =?us-ascii?Q?C36LwwxOaN6feCcnq+gEhNIA10kYVGCuzz4w9LQAYwkiOTmfZUBv9oWq2Afp?=
 =?us-ascii?Q?dcVUt0eb2rT8q9w2MybkDJgx2jo8JEcr40hyP3KlHTqY3+PP86OdfKGTYKQh?=
 =?us-ascii?Q?LpsQxteomwU6KyU7LUOOqH30+YTf/S1or44lYjeBahg8puZY53CcKrnp8KT7?=
 =?us-ascii?Q?6d4CWjBgqoRRF552/Ucjz8lfXv1Ph2Wzw5zwVmTOv8C4gXUoAbqmD97Is3yl?=
 =?us-ascii?Q?ME1T4pTU5dNpDsQ6InfoqjukIR0BPNRsbN7eqrohe37YBBTdH9i1NXckse1j?=
 =?us-ascii?Q?mb1iUlISOjdIGcd0W+ek8T6aBb7J9qOKwmETqmf3uUIUWDgt9utfXqeEIPK1?=
 =?us-ascii?Q?uXBp4B6tyOYigfbxvM3SKthplS+b7lvaceYE+GweF8Nx6mMECh5K3DJt7f5U?=
 =?us-ascii?Q?3bWVpDL05SZTur0GBtzGor7cmtBiH1Q5lS8/NIBKyr6TMmqN0KiG6B18itDk?=
 =?us-ascii?Q?bTiX+zXU1Cwa+C2Jo1Q5Y9B7Y7swMntka94OBzdJT1kDmRVGXuTzdILgeMlF?=
 =?us-ascii?Q?50lIyqbv+3IT1OsrGj0ikd/keQ9z+KnZ9K7Tr/4mCZn5MSzLd1S7kpsvB6TH?=
 =?us-ascii?Q?t5uprxDYoPbphEDr82ei4pr1COiFoyZVzYyKC1G8gF0TmSYZTEcITXdRzHMT?=
 =?us-ascii?Q?+O3pH5RqAcTDcQ4+b2tfIdmz8d7c1tDaItOtTMwzqY+Fg/vEmPD/7xxqE+P+?=
 =?us-ascii?Q?CMP3VURtVBNurHlqzODUISN7CjP1FWW1OIHV10+DHVgsqf1zlf2sz5k4APTQ?=
 =?us-ascii?Q?FcfIWI3jCff0Pz5tXGGq9r7th7CfpOxC2hQmsuD/Ob18pzDomZlAVPVdcVY2?=
 =?us-ascii?Q?eQETuqr9ccLhURTfMGvrgrSA4Gsw2lHi2Eqfz4O8cg13QqyqWNn9wG1fvoEp?=
 =?us-ascii?Q?1AMoVPvDqdHJ4kf/TF/h62fj0f1a+otfP1pM8eTsHZIa5udYSLpjLJWMkwW6?=
 =?us-ascii?Q?IJrTutbP2dn3mrR9JfWWxvSnLWeyCwe0Sg3cDIaF9cMB87x0rVnB3JJnudrr?=
 =?us-ascii?Q?OaK5mnlGhmIo3dKLNpJhmCJmzKpZHdte+JJ21YMlKyyxFl5DN+VVdGqzzCLi?=
 =?us-ascii?Q?vCcIyWm5YMiKxWijsVjZ2/mS3lldJPmdNIFaWEJGHe52Y5ItMGbEWa5nm0y1?=
 =?us-ascii?Q?QvlpsVOrs7aU3KqtYN9k1ktMDI6CaiREd5d0wbNhe12sfh4vCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kyXjxnI9TArGh9/JGrL1+PgUKa2teG3OpLvAVL0r/RCcuUUnL6IE+WpN8Bg?=
 =?us-ascii?Q?qfXiukxjGkWwckYfVcEm5hseMe94ge5/phokSJvCQzheRbTruWp47LmNZFgw?=
 =?us-ascii?Q?wms8bIkD6Rp2elBpsieThDxU08z6lEJIbzHXJKYJ5JtrPk4hjno6Pwnxog81?=
 =?us-ascii?Q?RhmENgPouLGWmXTMlGGnFNRkvtD2YbDYaHb1YtKu5osWAJpTGgqnaYJO8/3N?=
 =?us-ascii?Q?hgpw3t8XAg59aqeQlfU7mdDjHG8qBlVIzrYb6XVWgeOorVbr8KVkCYWvsu6q?=
 =?us-ascii?Q?AB1WIdyrXLiOLNlBhY6e5DbZwHdzLEI7g74FNEqQ/SPEW7kBiKpfv4byhMTk?=
 =?us-ascii?Q?NFoQ0wN/SkBqui1iHCc7fbOQl2blfgq8zhiiI8CsarhEFQYix11QN4+Jbyld?=
 =?us-ascii?Q?jRn5dM5N6C9iirBPB/PROYNFNg785lwzZik1QI65r/L3W/Jzsu1TCiQmStm3?=
 =?us-ascii?Q?6oxEnYwd295QUMAAF77N33Wnwkf3IE/EoF4KsVK5V2/WpA6gl+rlgqwD5AfZ?=
 =?us-ascii?Q?FG33rpfx2m4MQURWd9s0GOHfZg1WmtM9gbwGpfuxFv6ooSVOre4F2pIXnUVD?=
 =?us-ascii?Q?f3A1zJRD3jgR/g5n/ysYU4DJJjCl0GfgO21zgOufNOmfU0t6ZkwMvMapuy18?=
 =?us-ascii?Q?O64D3QaMLamq1ADWtbVNvET7ZxsJgb0XF2e9YE3b/USACO8F+enPPrG1TA4W?=
 =?us-ascii?Q?+Jyh0js3efF66nZozakahOnw/ktWWms6DWq1t5mLyaz9LYzuHrVMLmhvNny/?=
 =?us-ascii?Q?9h0rkv70eejoreaUcOTs1lsFPsf76kaHA3pHU/8yAxwzU9AfQcMQ/FPSb/xO?=
 =?us-ascii?Q?MbtnGASfHuG+jTLWwrAJhhj4Pvd84ax4rLWsIhIGgnypEEbzXxOJBHIn//64?=
 =?us-ascii?Q?6NO1v9P3DWbdxSiXrdm0aqDZ7kMalcIdWdx4e3L9zWa5Ys5jPeyEOeoe384L?=
 =?us-ascii?Q?to7IVgf+RKW06u1QEW8vmNFgGp2uJPPsLNZTXoIlW+AhW5Y3bYjB/XAexHub?=
 =?us-ascii?Q?HInrdEfVIZ33Qkcdbd0/AYVk2UZuQwIKTYQ1pNk5CWb1fnFfuT9ZvJqXd0sJ?=
 =?us-ascii?Q?tW4NtiOZ2KC0G5bGlVRE06bMAHKb2noWxiIN9c97fowRNxzqkJX6R0hBvT3H?=
 =?us-ascii?Q?75HvQpHI39+NUH77RBglmeSuXog71AtbUabfwH1FZsx3GWAyTdnm0+atdDd6?=
 =?us-ascii?Q?l/0yJcxlxO5Pxxc7yZ9T56SD53QLUvd+jSWu8ewEiSrC80oIe4xTeKHX07sw?=
 =?us-ascii?Q?KI1cHOqDBzcvZJmyS3XAdrNIrWQubrIU+/kEaaskVkdGsTJSTF5fW5B9fYZ4?=
 =?us-ascii?Q?A9eaK7MEfXlW2bT0zvaKnUSmS5/kdSKOQVyPlG5/myEFqRpTPKFrZj1O8UaX?=
 =?us-ascii?Q?N70MpEtT967Z8cPH9UWa30YrV2byj7QOt13a5o9SFYLhbTDusTSHD128by68?=
 =?us-ascii?Q?akYyAD9zRv4inp5c+GCt3HGGehKYy6mNRNYsu06WIxH2mYJCQ37qtl1LMFYe?=
 =?us-ascii?Q?oggfrAjKestRURj/FOnJBj2bu+JjeRCkMAsB3wkjOf4mLBTFffVzJdow9/Ct?=
 =?us-ascii?Q?RCuNVdCrgkQS1lRONpbLRezbGX8otobTQz1AfXTY2hxXaemvGN2lW3+v+ccs?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dda01ea0-8aae-4343-5b5e-08de002f2335
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:39:19.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW0QoChqAv87SSLqPGqe+HAsG57SkgkKyvCeo/kmt2WATh4ub7Z+dLtDlugq6XBpUnYxqltSSzZrG1E40cqdhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 30, 2025 at 03:38:43PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/30/2025 2:39 PM, Matthew Brost wrote:
> > On Mon, Sep 29, 2025 at 08:47:33PM +0530, K V P, Satyanarayana wrote:
> >>
> >>
> >> On 29-09-2025 08:25, Matthew Brost wrote:
> >>> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >>>
> >>> Some VF2GUC actions may take longer to process. Increase default timeout
> >>> after received BUSY indication to 2sec to cover all worst case scenarios.
> >>>
> >>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/xe/xe_guc.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >>> index c016a11b6ab1..f0de1fa61898 100644
> >>> --- a/drivers/gpu/drm/xe/xe_guc.c
> >>> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >>> @@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >>>   		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
> >>>   		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
> >>> -				     1000000, &header, false);
> >>> +				     2000000, &header, false);
> >>>   		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> >>>   			     GUC_HXG_ORIGIN_GUC))
> >>
> >> LGTM.
> >> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > 
> > This is your patch, so can't ack by but anyways:
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> but shouldn't we wait until your previous concern [1] is addressed ?
> 

Nah. That comment is actually invalid too. I misread the code - I didn't
relize this was in GUC_HXG_TYPE_NO_RESPONSE_BUSY path. I think this can
as is fine. We have relatively large waits on the GuC all over the
driver because in practice timeouts shouldn't happen unless the GuC has
died. If anything we should make this timeout bigger here.

Matt

> [1] https://patchwork.freedesktop.org/patch/675316/?series=154682&rev=1#comment_1240144
> 
