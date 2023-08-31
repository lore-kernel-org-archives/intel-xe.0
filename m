Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E9DC83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424610E1A0;
	Thu, 31 Aug 2023 18:26:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905F310E1A0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693506392; x=1725042392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7O4Gpr8rgFhjyhKN6MOnYJkosgK7TBrX4lddUMQwGM4=;
 b=fAZiVofoeMSQdnEkE8umSwxWapUXYXPdkML2APLHPwuvd/BzdoGYBlXd
 wvBEeInFjxDRtVZlAGzwd91tWEXWlG+Iu9HqKg0+sd5U5aeo0J4lqsgPe
 2PFAmgzVq0df2PcZQxclqBKdbNoh1S7/kurVAKEbkD1ROtCCKSJc6YENJ
 +U2PPU33l9TKuPnjTIllWG3HiiH3q3ggThoh018qeMDlvGv7cWnvlHPtm
 OQWDGSmuzwxoUqaZMJz3Y68UHnD4j1x4VK11Ao5g4hrMwrQDBCTxvlPkC
 Pr/08qUy3v87Gz1a/+zXeTt5R7xLM6voP+912ZClw5S01EKHMQ2bYf7YD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355526541"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355526541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 11:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913404790"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="913404790"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 11:26:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:26:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 11:26:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 11:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cmknw2Jzi6ABoo3X1MJiU8/e3q2Q93EQeYz1G6JGadV5Kxn0q6BTQY+JWMg6ixlEIGp3KhaFUDEuyvrn2MxRPzQP2QoGyWtLt+rMK3u/LFr4rsBTaqDbb+HoCla8gGheVCFpOQHXzvNnzqt4mP3d1/y8nDyApxcL+1waifrg1uDjMdPSPbW8XhmKczUE9ALJnyDmauqwEyuVw+0Fiq54Po5mpeA54BPFDI5CyQ6VuJAgE/6nZAAajn0Ot02kmkIRSD/Je67PtcPALgQbUDUZaoc6v4W4mPnVv6IEBxYS+PNBhU+NZqEa02C3vmfNTc29BAL6FbHbR/WpusSNVVh/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QB/4lLyCpHKEon53kn8VL8/pr2dPMMfC7CWrjOh2LU=;
 b=HL5hBC9MZNLLCi+27B6wfs5LENVyB8+4bEsB3EIiRdj+vJ+TJaRCguc2HMi15szTFqNhlqQvwIOD/nJcbsayBHVYwFHlKNZ9Hexlb0LAaNJ5DtLj1EMh+PRCQ0qdX/gOaiq6SaE1HEtypEbI+VVmaMYgIHEiLV5r1CFRihU0tw0doB6He/d24QLvU+mj01jCBNdspWSxmL+vkpUaRA3i1iPKCUtN1D9qTaibTWC/WcwB5nBS0H05c8giLnU57W4s5vSCOCAXzl/DdK0LE9J1gskG/WLU1CL00OrJAfQ5iuCuiVuN1QxO7MTRVPjPze/6IqJMgvcbGYzuQElrerslUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 18:26:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 18:26:28 +0000
Date: Thu, 31 Aug 2023 14:26:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZPDbTz5JXEX7+yix@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
 <20230831150048.1760018-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831150048.1760018-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fdb3e6-6765-45c6-2b06-08dbaa4fcaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLMEeeUyB8yA6LmZxl9BRIn5+Q3i/AdAzQdwjaJbMV+gPwIh2+10fNYoP2XSJVYBFMMx9ohDFuGR9ihOjSbRnZHOBIhFuj5M5T/VEFBrWKlIWytKg0jawtUODmDdDS5TcfXsmcPv3RmRkvgkvTuLvIdSuAbCTKVJQVnRw49Q4S4OuNNlwqvzVF8LiGdscjxrRC2cfaRFbJyfkJrA0sgP1iOOpUye1ikymR/TFyZhb2upqEt2knFy1u8OrmMB6v0xv/ZaqjjKuDUOlPjKaGms6DPxwP1mncGiAnIfD2u8ArvCBpIjzsvJTPjZagrjvb0OwfMx0A7CzJIweZrCqthuj85F058WGFjuqJJEh4UPSGDt+8L40cN+A9+OqLmEYDzYNWUDgIPuGJJ7gnCbVwTpjXG/RhuKWMygOionCs1JZKVKSEqO0XLrIfCp2+Ha/bM8dmjQwibXqFt7yHudFaaAgUu5LjBUrGfnB6HnkXwW3T4TmpGUncnvfkFkv/6S+gYg9/hYBZuYer6BVydYHpbKDVPzKXlPkgccFHC3Y/bgteGN/abSpCiEEn7b0AOYSFNoJ5xxeebnOM5cmxTxaosjqKTGUXrBzjbQAeGPTy+F5Zs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(186009)(1800799009)(451199024)(6636002)(66556008)(66946007)(66476007)(37006003)(2906002)(316002)(82960400001)(38100700002)(478600001)(83380400001)(41300700001)(4326008)(6862004)(86362001)(44832011)(8936002)(6506007)(5660300002)(8676002)(2616005)(6512007)(6666004)(6486002)(26005)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkS+uQncb8VsqCMiMYR4P0YQluLZxOI2ICt91CyNh4zf5mrpZyCqbekVBLz/?=
 =?us-ascii?Q?W0/rNP7QaO2SJ9Tr6TxRy87gNhKS/qMHSdsCrA6XzEVKjjRtdFMGNY/xdfHj?=
 =?us-ascii?Q?cFhHtqjWyISC0J134orawh8j7PhSkzl711dC+emLEqBVDKWN3PqjRNBFY43R?=
 =?us-ascii?Q?xbtBPJLOcJYMrVLbVQybN/DlC+Vx4QClkIignBIq7FaQJR6T4t3dVXTY9yrK?=
 =?us-ascii?Q?0FtdkWSTIemmZ324OHY8oG4WfjFI4PWfFjHi2oRXZWZH7fAxet4RiBr1t9bD?=
 =?us-ascii?Q?utKh++kamx+a4+MP+YVRYt/189NW/Ihnqe0xdWZxu0uDkVUqbsQ5qv8UNO9z?=
 =?us-ascii?Q?JDA7Grsqk5FohZsOrlX2ALjGcKv7N37nxJE6nDcJpLyVvkSqYg9nu0/EAXiT?=
 =?us-ascii?Q?EDEzfMzpbjYS1SYugKcvg+ZaiXT9OMlpZW2Dq616l+72/WwkaKrXrwnktBQI?=
 =?us-ascii?Q?/XNN+9UKsTlbXDNxUg30JqJwYO6q6N449Z5h1BRqkqPuRRQz0TF3ejmgz765?=
 =?us-ascii?Q?1DV5FiDPkzMPgzTzbzxuTaFFv/BHtA1/EKxpHnxCNiU3RZDCirzueSwXdQ/k?=
 =?us-ascii?Q?J9GVLmi8Fwcs/pRTXV4bqF6yp0DOvjo3BqOoJB1viI6VmkYJYZHfj8YulR/S?=
 =?us-ascii?Q?m32osRzG8NiwE3DslvO69bDhKYcgKBaMrUepzC/yXHGUaAXaUKECnv744aR4?=
 =?us-ascii?Q?/RZHiJTPSXkByhhJZ+IINXHTe066hHgmKcAd1snyDlOwkvMrpYiqVf3JD3tg?=
 =?us-ascii?Q?UBdES/11K06xcNJr0DMZKz+ZYtc0FvWjrCNoCfS8YVYiMSyUf4OMP52ZmMUK?=
 =?us-ascii?Q?NFc1LD8bB6mHF1F5Fic70ellioB31GIELIcOTYPNnXA0OIphWE476MSVlwnd?=
 =?us-ascii?Q?Ci7y9mQkXD87z0I5o5MQspjm0c8YTVyz9ifisc1pKUjgfQtkHfDL/0L7oW5y?=
 =?us-ascii?Q?FRdwtP6yX7UGfihUKs4A8wDf7ecGBYRUcTwbOgSSxmXY7Cy6378Lk+349n/k?=
 =?us-ascii?Q?UX5V5Cdpg9/BNNjQuPEAriqM+MuN5l88XhB3f2E72MGRSDimmHmDb31pui05?=
 =?us-ascii?Q?6DQLIkl02wg6iqtigoMEaEJJjE9BtQ3tbw9LYgU9jbMaLV34WZBoxxp9V7nr?=
 =?us-ascii?Q?Vio74XoDJZBPSG3tVFnHYMuWfp8BMe9uLWbw5agPUCdHcs8BZfbmqZweIWM5?=
 =?us-ascii?Q?pZ9H9Qm7+DRV7Fsolu6YuvqU8R48Z0j6cRmTCkKFfp55CnD7627LuDcTN/W/?=
 =?us-ascii?Q?NY/FXHBkPuzLfn5Iey0MQmKHDOBDC7rzUXcqQccmLnSbmcfdtljY/Wf5GDHs?=
 =?us-ascii?Q?W3q2hz7FkN+btGe0pISXd3OgR37f4m4RmmPLqfKoSKT6O685MoRZ9S2PSnQC?=
 =?us-ascii?Q?fVoTkGHXruWQvbyXArISsRQKtkKFM/9kQrl7wNigpkrPgqrk5Da1CWHVO95u?=
 =?us-ascii?Q?sYalYrxx7lUts1GzygHwEe6st8T0e98JbFYXkZ/Pqd4j7vy7CEpIZCwtFCMw?=
 =?us-ascii?Q?4ayymTSvRZyn8Z65rH7hZ6iL1Muik0RMVz1+n2ssbZCbjDBd72Mzxg34CmXJ?=
 =?us-ascii?Q?OwHxPoWEUV9bW7tMNMzeI7WbEjQEMNayP2PmU75X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fdb3e6-6765-45c6-2b06-08dbaa4fcaa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:26:28.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R7IuGJ/5y8UwQl90NWr2lcJU++NObgoSl3PW4gMtRzAHL6FGvRdg6J5hH62x2Ruz5yCPpLWvgI7aqvffxe5HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Covert xe_vma_op_flags to BIT
 macros
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

On Thu, Aug 31, 2023 at 08:00:45AM -0700, Matthew Brost wrote:
> Rather than open code the shift for values, use BIT macros.
> 
> Signed-of-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..4bcb54ccd93a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -377,11 +377,11 @@ struct xe_vma_op_prefetch {
>  /** enum xe_vma_op_flags - flags for VMA operation */
>  enum xe_vma_op_flags {
>  	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> -	XE_VMA_OP_FIRST		= (0x1 << 0),
> +	XE_VMA_OP_FIRST		= BIT(0),
>  	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> -	XE_VMA_OP_LAST		= (0x1 << 1),
> +	XE_VMA_OP_LAST		= BIT(1),
>  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> -	XE_VMA_OP_COMMITTED	= (0x1 << 2),
> +	XE_VMA_OP_COMMITTED	= BIT(2),
>  };
>  
>  /** struct xe_vma_op - VMA operation */
> -- 
> 2.34.1
> 
