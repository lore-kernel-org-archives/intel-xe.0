Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4CCC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769CB10E236;
	Thu, 14 Dec 2023 22:01:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF5110E236
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591278; x=1734127278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ko+6iYGUVuKFn6rAHqEEtYdqaDUfLISMMiiWqafEFdc=;
 b=apqDQ2B/V9U1M74t9k8awB1dNAB/euxTLArm5ZaEC+f0+/M5yhVKVSsk
 KoOQUVb4tf+dUdQE8Z6OQrOqJ29DaZf/TYOxHEIlP0TsRAiVymUIN1hgU
 XP1LGQQSVys4k9zERuVRU7W4eUbafwPTJ0XE+VL4+TmDSUAWD/FgBKR95
 IyCl0aC7QYILEmXzA2rHXi1xbu6ECk2BUSDR60JTzT/EFkt7j2DIdVvpM
 J93AyzfUB9r6rEJa/ABTj10lldmp2w8ivRvIG1nsdiZArFNx1QaIVLVN+
 Eu88O4i2J2k5QnWVqtAeBQa2qkS/myuZLAYd+cPIwnpdhU3iENN+lh/du A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385610178"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="385610178"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:01:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021714763"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="1021714763"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:01:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:01:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:01:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMxRqmd3P9ppZI0AaSz8zgif0o7BlGQQHkCzen0iVwcQZAgkm+/XrGK1wFKFbmL016aPaAAuX3VnYlSB07hTOwk4GQV0lHPHndCS7AHjRmaBj0x0ymkkrM9ccmhxyqXrvfYgYgsuKHIF/o5N92fXGaznicV69WQVJODZDnZSm8XG3T+rdVI4B2JQjJ7gzsyAWsSs4TjB2c2NCJ7GA3M7KvZwo/0I6RbZVgDjeloHAESi0L8JSrz731QE/xBLclTZmMXt1SjAB8PxgVnoLp9Cag+jxyu7LQYtZHwgzgWc69pfuKqqTVXcYNBLhQj17Di6VFT7Ka7NIgnCoVLkp3LWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oDZIiC5JvZvqEVh/Z7HfjpYPtwfvkkXNdlRd/M+Qxw=;
 b=mbsnADHPtahhSbBjKPdrzbF4uTZfeB3G8TADQvPqNP8/1QQUkdrUWgCPHV3vSX12nDwST2zoN3vF8UCpHQfAA8PfKAUBhKTdcsNsi0erRHneoDiaF9g19f3DAfkVoO5f8t8UVe0PmSTUyZ44EAHcaYLTvaWwCxfZuq0OhJCdu++v4q07rldN0Db3cN3jldnAsugzklr+4rXCvksfh8XT2UtA0GGYIdnBH3nyDKtCKx5Z9BpDebqOUExpfgj1hhgmO06ttE5qdTQ6Fet8+1vD5++uOpnGNBfuwTF4zt6lEJaveuOMQr6dygsdkkBgQYcAZAD7UVCwSgffGMViUqpIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5269.namprd11.prod.outlook.com (2603:10b6:208:310::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:01:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:01:11 +0000
Date: Thu, 14 Dec 2023 16:01:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/8] drm/xe: Move some per-engine register definitions to
 the engine header
Message-ID: <djlznzt4x4cwnqp464upyqz5dl6cjyhmbxyj7y2oiufarv6glv@p5eyabvqhl55>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-12-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 6573a3ab-219b-4a15-619a-08dbfcf02e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qB/aelNW2n1RIUMo/nfTsk1XAi3U31f5nQhVolg/kdpjiqMvfuwLDu9ppAvl4D0YAtzCOWli0vaTz3vJR3hfap8+aFG6riyBcHCSI/+10+E9UDgD/mvSLVxvxdYo6W/4t/249D/okxOEyldT/ROzSLTWh/qoYmtCh2TIjAtIiIdKTLmNeyEXHd0OLja4x35NVhuy9o+DMaADVYoRiazR9Y9wbTn1UgLEoeiLGK/RxrvRmk0MIOpf00IIlETfiHbVaHcgODaxORpvWHRtKKuZyWj2lX1/RgQJ+CA2XCgg2ULxcgHwjlptpTP4JQYjqgUvl8LrT10x/DWiFqSkl6ETropYLeTew40UrQ7nD11KjHdHxR6gkEE/VqjAD+98nyBczjkAHD2EZLWf12Mpeqe+u9kSeXGxPH8W09VBsmV4LzgxfGA9RPBryOjwfDQ7ZYEP2GOl0qikaaeN5SO4yiTosokRCL66H1dJ5jOQ8ZxE1e6eVtsqp0Qj0f+2sEFvDQxfHfLyvaN2LFXC42gQ3EJT0u8zcogVwjNrHApIjEuCdT/cNpetw+dEUc0WEpu/Q3dH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(4326008)(6862004)(8676002)(6666004)(8936002)(9686003)(6512007)(33716001)(86362001)(6506007)(2906002)(4744005)(38100700002)(5660300002)(478600001)(66556008)(6636002)(316002)(66476007)(66946007)(6486002)(41300700001)(26005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?218hVCRExmK2ePwkFVhFRCYiCdutC1lF3BVvVjFLyPHQHBw9oyh+IUvS1OM1?=
 =?us-ascii?Q?7gFUo8OK6kWzwGxZAwwktr5nLal4CAFJRZV1Ywc+LHDV8iII7y+L6lSFfZpC?=
 =?us-ascii?Q?A/6GODovXsHKfb4oK5E0F6aIMYhY9cNLazV9WqbMUkZXNL3QShWGj/ZjAgMn?=
 =?us-ascii?Q?SSornkgE4fE8A8Pn+JU0yzqjWP8Vh0TDisMG8YMgm3GLM2bMih2um/r9drrr?=
 =?us-ascii?Q?RHGU2hnyaxXmeHfWj45MK9EviTzFLCnvAKexBgq/Cn1lH5ka1UkLrRkTA1+K?=
 =?us-ascii?Q?tqxRnayESCIfYlxwyJPoZolt1/pP3WX6NwZ5eIQ7zZlQlDqDvuGAfNHtciOT?=
 =?us-ascii?Q?rKhEfHb4dYdB1/HWArnl23yVs3U7ZjQK0HqHoejy3quQ6uUgCL+zOp1ZyKTB?=
 =?us-ascii?Q?eten9JGhN36NwOw+aVs8IT4vBQ1/gfjtqe6pgYY7ADnAcFGqtoWFeyrHJWJz?=
 =?us-ascii?Q?yO1Y4OhfwQ0kadg++oGVoaTJmZ6bHHbrIjWvFOi8eXTHTdaTdIxocJoc5KCL?=
 =?us-ascii?Q?ejqrFV8IQByls4IJgugRTQHlaKKk/U4VVjFkImwdvrZd1CQreLVIjwOBzcG7?=
 =?us-ascii?Q?e/wAkQzZNfM2aeZwoVknegdlbiVeSQm5LcTCPmthtW5mfSmp+x7Nn+/VGy1P?=
 =?us-ascii?Q?ihv8bdRQmoN4eb/XTFJtW3XZfcTIXACPDXcblyESDC2parFY99CjA9ICr2gl?=
 =?us-ascii?Q?bNJiPKmixLXvs8kQ0OzzKJfHcdMFO6nFH/b7Qij4Pks+7ALKSrIvKRGAm95q?=
 =?us-ascii?Q?WFNJXG+dfffwdbW7m1qwAtXp4jTafwAT3AOipbaVkstGi/ORg+Qifg8WX28u?=
 =?us-ascii?Q?cf3L+8eVGkikI4p1nP/1kwa92kfPUAJzWnSywMbewhPTGDbt2j3t4+4Sss5g?=
 =?us-ascii?Q?SFdz7RZ41ZPVFULByc5DZ5GOY1vSA6W2wBejgQNqxn5iG+80LJG8gj2LGxkn?=
 =?us-ascii?Q?KYFDpRD8ZZpVepLDaA+rlAh156eEbyx2uNxHgL8wI68ko3VSUDqpkCPcRZfM?=
 =?us-ascii?Q?P6GtQl4z358wS+XXQT7J3c0hNLF5EhhYqFZJECfNCCEV1eFCXDRihHqp5pPf?=
 =?us-ascii?Q?sWIZmhSgve1Bo6KsjXRg93+Tag8pmMzGr1ke4c7y4eHi+SJY8S3tWpSbAxkl?=
 =?us-ascii?Q?lLKLcFUcaxq9vf4E+vx6eecW4p9wnNBnym2zyH08rua06Fsy9birFlyPIIt2?=
 =?us-ascii?Q?RrXsPi7qCnY8mshRNnHbqfv5rkXy16u1IvXV1t5ivmNKD/Gqk9hbCpVW16/2?=
 =?us-ascii?Q?S7ekuYIFZEJOz4O4H/QeZgg6CNWljVsWJZOoBqycx1ZvjwYHq4KrtbEq2xxe?=
 =?us-ascii?Q?9iiyLRQTJoAzzbGxYxaU58CyYeqPHgJ3WNICZaTjCifXqxQBLoKbdl7h/Am4?=
 =?us-ascii?Q?H+rGhxV45s1qyfVvAaPozqS5NiOFyZZTNjRHyWI1hpWL1wWA5ouEmlSNkHxA?=
 =?us-ascii?Q?nKTCWW6P7loOH6BVUL4nJd9ox0R6a83VkpQF4uhdkxZBB0VVA7OquTn6L28X?=
 =?us-ascii?Q?GnnautZsPN5UI3PXerpVKsq380QUyMGoQcXI9/rLtMkJxSMZ3QX/UUw2B6Gg?=
 =?us-ascii?Q?4p+oMqjBDKLPtidW/E+WSDyhjOMzyBHU3sW5a6r45apexQ7pp3pOCbH6JDCy?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6573a3ab-219b-4a15-619a-08dbfcf02e8e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:01:11.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEDbZ50pTdEAbzRn6+5EN7xUDLzjBOVXUIokQ9sgcerLnZNGEfeM8rV2pSnRkS27JtGO7gTs3rdw1h0Cpy9I9RavqtheORRA/ePRTaMj2/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5269
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 10:47:02AM -0800, Matt Roper wrote:
>Although we only work with the RCS instances today, the
>FF_SLICE_CS_CHICKEN1[1,2] CS_DEBUG_MODE1, CS_CHICKEN1, and
>FF_THREAD_MODE registers all have instances on both the RCS and CCS
>engines.  Convert these to parameterized macros and move them to the
>engine register header.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
