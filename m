Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBAC4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 18:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926D1125CB;
	Mon,  5 Feb 2024 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzrJOjJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFAB1125C9
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707158564; x=1738694564;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FMGD8NdnOuIdsa+4QO4puW6/Rt4osLpIl0zEMfXbwmc=;
 b=TzrJOjJSypyTVVZc5hUh8gE95r5FhzQDlaI9m6xzP0gR+Biath5TVTLf
 gX+Kob8hrU9DOZGdcwo8SGHrekcg0z8H0Ht7PP7vbkozbsFNLaByr9uan
 WVLvHKWyhASpDEGtQKWc1dwO+yFjrnECRBkOUEEGVYzPIQs3xDPo1QcGP
 qCqk3rIBXGtTLqHTQ1ht+/R4AgrNlDMKbJJBtk6Xu3pTcqTQew2fTDzj8
 tX5C20XTbs9dXk0zOnUlXfiGNAWBpG5nwgVkfaZUi/2PjzcBFhLoyygT6
 NhzrzNs+HoeGMYKDXXmKDLaD5XFDCPjhGrZZIlKzVLCaTBH4er0W43Ksc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="485977"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="485977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 10:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5415283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 10:42:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 10:42:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 10:42:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 10:42:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 10:42:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPPHVYEM5eE9R98GaWEfyr1WyuUCo/tz/w8vA/b8xFFlo8RjNo4Egdecqn99BgNv1qw9KYqRuuo+9n2FlzlDRZfiXa3BkKHNuKmMHXwg0jd7J7Y6faAp3H9/FCmUW7pLtypUvPYy5MFHXytu3CsEbNkQm2gLC7Z2gu3FvtHMW/n/Exvg7KbCMQtzHRFrb050csCfKMQUfp6ltEF5ZA3gq4dbR2sasekH41L1wBtzYSxifmGYIw+4ZOh2mymoKXk/SKz+DLR8szuE1mnR8/YRmegF3GWqTZtA8Pu/lbjxyeEOQj9tcA597gTFjj65cnoUwLjGzAxWYHIBXIuDjubUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm8LbiyAtGcjeBjvZpMdGOJr7+nBgNX+Mq8XM/54dTE=;
 b=N+6SMZIyq8yjuh5NMsThyWzgtORqpxL/PmCQ3eNI+4zUDARk/utrMM1EDpOmLuuarT/Z6hpP0gTlFg8uufpI5GAOdFoX7mIUNhi9sa8nzYSevGp44Xp1Mgx1q0kKFm/ZFuYc5T3W52UhoN1/cOfraqKwVON+g7pu9aBtkFOMA1LzD/2rCWbJIj3bZZh2tOMRo7WAWI42nSoZ8nVZarD07rn/B8VMNxTFcwZFUIh7A+xK5RXWiy2pHrp6uj5OAfkvch4uLMhg79zuhjlhVybRqbb8bo8DZi2hYIb+XlBaE/1xqpc7MsgNGYJuTBiOtsdmUPA7AXyyau+QnbBrWTs21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 18:42:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%6]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 18:42:38 +0000
Date: Mon, 5 Feb 2024 18:41:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: don't ignore error when in_kthread
Message-ID: <ZcEr9axBgGiIoFee@DUT025-TGLU.fm.intel.com>
References: <20240202171435.427630-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202171435.427630-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb1b956-36ea-48a7-2f56-08dc267a3a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBK8H2pObPC54YUg9tRwjN4ADJ4AXMsgG+hV7Egl4zUtqrLCX3f+BgmDINyp1QTz6JE1yFGxnUnDbA/gsyagNxoVtr7y43Fsm8pPLkiNY2Niw28fAYtvrILBTXve0/PZlPZXJYrfCY7OfJJ4X3fXMob7J94hHV/irAB5mxBwDvNgyTaYYbgsyYjLPhK3E18m6I5c7JsewrL4lWYsiivYI7xKAAz7IZycEj5CC5pYLN30H5cfZqdKhA/JFNxKGcq4B9BE/vkVK6VzwDn0myvlCy6MWZYDgaUXkhKV82w960dSOaFAHUlK8wxTLncgla7XiYO9bigMUyk5KgWgcwanOZWLqR4PTo76kvtq1TKNqm5fJ347gzbVCS6SM8xQNAW9smY1vQ3NE3c1k84Y3xUd2/c48wbNO3dgYZ4CkQcMyI4EUkgASM5HSG3rqXRPanc5TtKuPIwaQOHHBE/zz+4uCMAVysiSJaPYkpiEIaQASx/LRZoacm+mOmEFV0g2cZjxo0QCI9cCZZkvo3Tjw65MtOmZRB30Hy470yQ8kgHDVBzCv2VghkaAJvfmmlmnAb5j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(82960400001)(44832011)(83380400001)(26005)(6486002)(86362001)(6666004)(6506007)(478600001)(6512007)(316002)(6636002)(41300700001)(66476007)(66946007)(66556008)(6862004)(4326008)(2906002)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZO9AXTfNgMvgCa1S0Q8LIYn5C8IY0igC5I+hGakPd9uD17oAY2R4VtsFuH?=
 =?iso-8859-1?Q?h1pJo/0zpYQ3cfwmpQAibrANirDrIGChcQObccLFxvQhiWG0GGJCi6abkQ?=
 =?iso-8859-1?Q?hEz7E+QEXWXDQ4O4z3r9YxdcnRcZoQQfnIMxzxp9Flvmz+/WgqpIXgHkZ5?=
 =?iso-8859-1?Q?tBXQUkqujDTFBmFlibPZHFvAr22e9DB4yLDjpboXTZZ1bDrIJZ3icy8qRO?=
 =?iso-8859-1?Q?Jh1OQuHqRmPEoLD2NFB8Sd4X4+lSky0zBFi4SVUWnvHZ1LJmWpMAfU9ddp?=
 =?iso-8859-1?Q?WxtKp+P3v0D8RsTZtWEVAQol57u4DgwfDMqAqUy/XYHlghpH4/oWSaK2EH?=
 =?iso-8859-1?Q?KJx411OUMss1FwbufIuy50F5sdl/Ic7LYvkUXA0cZ+oZaDAxa7VL7GkIDc?=
 =?iso-8859-1?Q?PJPzq4zby8vF7+6pbqdDbiYnYqxZb+vefiX3Urr2aexwS+/BcfJOUktTQ3?=
 =?iso-8859-1?Q?Hx06SSSoQlziDXepNhzYzXdLt3JoHibqEJ1aJMeK0KxDG1DiyhhZXpzEtd?=
 =?iso-8859-1?Q?78dxt9Irbcv+Z/DneTUZV+IgnDcc88NEfMzwJOAF5FDtsIfHbA65nsCmSy?=
 =?iso-8859-1?Q?mEN90ScSgE7r0VH/V81xdet5YeUHL3qGICdqARjHNjO3NFSXMVkLrY9Gzy?=
 =?iso-8859-1?Q?P9qxS5ATZ2e8wh0QFgaMtYqcN4+a2WZeGtnKrNfVArgrHZ8Th8qFozWn5b?=
 =?iso-8859-1?Q?BVxbAenr5lvjB1hffXFAjIKXTvw9DSmgrYK42vv6h8ApnGngf+0P0dxlTI?=
 =?iso-8859-1?Q?eTE+R7IPqbTh0M9tQrPdC58itp/kgTXLyiTaUL1EkQnKVMMJvF29sfq1dZ?=
 =?iso-8859-1?Q?xSCN4Qa2sUOf13CNcgvH9MUmf1T+P0jNlbw1G51snLMF/HD2jia8cqFY3v?=
 =?iso-8859-1?Q?rInsoZtlVKmn+qOGcRNabDDrpB6rQ/YyrG1FXIpCnUozAW06XdwTCEWeTc?=
 =?iso-8859-1?Q?MOTcrMAG97CG9cjE/X8l95OitaJAgnW966wcUAHmqqH+KqrNbNG+RwnxsY?=
 =?iso-8859-1?Q?4/ZuOVp95+v7PjTMbjr5qwU1cVahTiWk8kBiZ+RjkZIlo/Ben5teWK/1LN?=
 =?iso-8859-1?Q?R6F1zwuO2ZL0H5j7fapr+5Dw4bhMEzKUmdpxwaLfIUS2dP5jSNRVAJDW9f?=
 =?iso-8859-1?Q?0bVhNw7mUTq7E8q0iVzyhc1ZqtbnMn5I012k2kk6meBFOC5TRtwPsTXd0e?=
 =?iso-8859-1?Q?r4+Cke8gxDyWjnHnDFmK93AS+dwp9hEGqAGe5SZY/n3bOWzU2lwUCDBEoa?=
 =?iso-8859-1?Q?GMHNvH0tyAPaC+94uajO6XLTbKRxKTn+t5ZpmVJ6wdIRjhtRW29ezFl3Qe?=
 =?iso-8859-1?Q?bU6kW8YqvaqTA+t1CCClAJ31VCfii2E+9KgsB1iayINLdCmw6zPahUrKhD?=
 =?iso-8859-1?Q?5l9aVuswvHCBdwJZ0+NdmmoyZhz6+mVPD+hN57PWUBpEP1SgD7Tr/Ui6JW?=
 =?iso-8859-1?Q?xZFdi9nV7dmTLuaCYJIWiRhOaKe1RXsflg6Qbeqjq69hY4iHp9tgS2kcqX?=
 =?iso-8859-1?Q?1Hpqbbs8dckAJFobnkJdhJjfkSSORvJEKr2oGNcY7Ni/8QJ+ep5xuEqV2U?=
 =?iso-8859-1?Q?hzbQIbbIQHW/PLEdTQC+ik2KcHzy6ylF+ZptsDoTz0JMznzUZl+u+t/Kbz?=
 =?iso-8859-1?Q?fO8zSZHaCMyTF6llkVoQWAueYa0ic3uJ0U26w/9CsgwcLmC7NTx5Tc+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb1b956-36ea-48a7-2f56-08dc267a3a0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 18:42:38.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Krxy6oR+BeTLiFyhRuBx2YHSe1gmgKcsgJ5deuqonkeYifGNKIclSh2yFXffKNPBC12M0SuCBq0S79tjvoB6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On Fri, Feb 02, 2024 at 05:14:36PM +0000, Matthew Auld wrote:
> If GUP fails and we are in_kthread, we can have pinned = 0 and ret = 0.
> If that happens we call sg_alloc_append_table_from_pages() with n_pages
> = 0, which is not well behaved and can trigger:
> 
> kernel BUG at include/linux/scatterlist.h:115!
> 
> depending on if the pages array happens to be zeroed or not. Even if we
> don't hit that it crashes later when trying to dma_map the returned
> table.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Someone from Habana point this out a while back and forgot to follow up
on fixing this. Thanks for fixing this and looks correct.

Should we include a Fixes tag here? I am thinking so.

With a fixes tag:
Reviewed: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9c1c68a2fff7..63aeb3aead04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -114,11 +114,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  					  num_pages - pinned,
>  					  read_only ? 0 : FOLL_WRITE,
>  					  &pages[pinned]);
> -		if (ret < 0) {
> -			if (in_kthread)
> -				ret = 0;
> +		if (ret < 0)
>  			break;
> -		}
>  
>  		pinned += ret;
>  		ret = 0;
> -- 
> 2.43.0
> 
