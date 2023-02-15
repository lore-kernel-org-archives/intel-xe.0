Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7802FC61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 02:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141C110E0F3;
	Wed, 15 Feb 2023 02:59:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A0610E0F3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676429975; x=1707965975;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=iG8WuclGwZgc4mx75eB8/KO5p1AHJmJZrOwV9+i4zcY=;
 b=m0H0gRWyt48pgyfiTd+vxo6LLa1SItrjLmLSzVT+o0wyQemGLwJ0zji7
 2RSeQFTqJ0yhwA3udC3eWuPL5xg5cTtTwvzXMl1POLw1a7R9CBXvtlkdY
 xY/NCJllsEO9ZcXloJc1KsXigEjVbeHZY1A+/YEqfd3dO/1pB0ohOAG83
 iqn3Mv+wXIwk/yLRr3Nsp0M/DOv5PIHrqtsosAQqHHOklS9EoJgw6Mht6
 yRTUv5I3cF7YOi2Q0t0IesA/Um4btPBTO5F4qgrrX71ppYBBaW9IbYiEz
 PGQ/rA0lyGgVx+iuUWnpjS4L8lDLop13NnRm+Psik9YX2kIHh6aRhlLeF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333468543"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="333468543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758237821"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="758237821"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 18:59:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 18:59:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 18:59:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 18:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwi91u5YFbiu2tb4mSG/ydxdRUvzn45ihbfTWDRoSPWGLZCmBSmEHWVxld0TwH/wOham9jR9AjCRBds+USQVmnyFuxpDUbDrIXhb/U4P0OEcir5iLK7wO3tqFBLiReyR7pMx1TI/k00A9r9Shytlj8qSZgFFeqNTjTpIDWov6tpYkHfylhbRccyVDlUZZxPqNGyj5kxL4hDHdjq9pU0un64wAqM8uVP/RIMT1aUeQsp37OjclwRyZVNwgonbh5a8Wko0rIjHVSMG8JlufuxtxMCnRoDkS7ZOunz3ZyKdISDVx2Uqj+4IQHp+9KAOuvmBJ/yWqWYUMwIKbFbGWajChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzqbHjBGAtdw+YfMvP0roIlYHqXz6aJlzoe+2j26ZxE=;
 b=UY1FAP5K5lLusKobD5wfj0Gq+bmZX8/Aod+yUcs6zzvW/OWdv3lT86W7u8VVV1gnHDJTxDR2vEOy7w3b8Ys+Jytzxa/AS2tYdHpqwPBDjMgRedGUiq/VWvC7srJdXprAQqUOyA/7cw9E7WP7XEB/6roJPWcbaBcEvarmfCL1VYBkt9mSZu1atfaUR8xgmyHwhYKfvTWDeo2Soh6B3ajnXE6p0G9SYl/p4tbvQ93juaN9iB4KZPudNft7HLb/RW9+iRUsV35p36voLaRlwpp3y+GnsLTemomzrqb0Qqd84gjwktwnnxZnFnNwksTPYGpbJPeljA82TanDVooQtrHFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 02:59:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:59:31 +0000
Date: Tue, 14 Feb 2023 18:59:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230215025929.uqwx6hbouoxo3h5t@ldmartin-desk2.lan>
References: <20230214083320.2199178-1-lucas.demarchi@intel.com>
 <20230214083320.2199178-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230214083320.2199178-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 717bccc4-986c-44d8-4111-08db0f00a8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FDrDwy04C2XayBpC8V8uHu63Sf92gG5kCUPY+ajJOQZNC0T8fZuatq9OxiZX8z7QL2OtduRawJ2xQcJaek+B8aT6sXT/8BKZFglMzjXL1u35h5XOyhTi1PbsJ+quZHFXfJzWdl3kwm7ZnRaWyBXc5xfuP/k+zM8WxB8aJQJ1D9xvp/k/G+dpsN6mUnNxm9edHaMdWyJDdV1P5a18UnPq/o+q/xJoA0ATqxpOsYo40ltZbEjMT48uxIGIe2SjuUwhadLNDGp/22VRZ9R3RZLaccuw+2KfPa4kjlZJ465vQc5tnYIQFX3grWSV3w6281OoiazfJeHa7cH+pvkRliU6c2+n03G7cElIFrLAM2zt7EBa/OoMHwMBZf0QYcBTWIE0V58W7Tv4inGIXfxYgLzR0Tqihy6uepZpWHTCpbBTefKoXya9ICppICeywIzTVIiOwUY1fiv/b9lzUUPStvdCutiyLK3ozvk3FZX3L6fBKJ5JKSqfsdqIy4P/R/LWQcylB4IgLV015qQLDXsqOZUgKMdUWlYcLzPRtzWjbWzzT/ZPDqQ7usIpzmNPYliUBHXza+RAyzqCokP0mtmR4WYE0Jn9HGExGD94EdL1CVUwFCY8ish2+yZPYkFi4IND2qbeFAa8y/x+WkZnYmdAbWd3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199018)(6486002)(36756003)(9686003)(6506007)(6512007)(478600001)(316002)(26005)(1076003)(186003)(38100700002)(82960400001)(8676002)(6916009)(66476007)(66946007)(41300700001)(66556008)(5660300002)(2906002)(86362001)(8936002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8eCua6u2jqihfg6f1En57Zixj16a4HlP9P2PgEJfq5IZ+1dKDJpEq5ryvgl?=
 =?us-ascii?Q?sO0BV53IWflt0HXPYV0CX4hC7vyuFXvxVj6LSgSBn+aGi5Yu0q1vZ0BKogkr?=
 =?us-ascii?Q?sCOZCry/Jl3x4o4lNwYijKKIIqIrQQNtegIEdsuDs/QlVsG70lYJU+DSiJ04?=
 =?us-ascii?Q?w3T4MWF9ePRCKNx5QJuIUXZeigeXhJjCQZqGeJox/uTQU3BReru4F3kXzIJs?=
 =?us-ascii?Q?1iY5gmPUb+EuNLxnaa12j2XJ2QSTRb3/TUgb5Cgx+q5ivX4OQvTET7DloqoI?=
 =?us-ascii?Q?37SNtUnTotxRYGL5ZoMZAkRu4pVpRVNl1q6rhIFqHP0vDXG8ENWqOnckhGfB?=
 =?us-ascii?Q?KR0XaViY6rV9Tr1Pdxo+MnTfuDnxo6H1XX/iLLTL3zM7EkQIucNs3MD9YVMx?=
 =?us-ascii?Q?pQdFYlbBiBeJliJ7iHlSmhuQihFQB247bCH2noi2qvAf4Q4pYnL7Nb4LRWjJ?=
 =?us-ascii?Q?/t59gByaYc7Z+kOA9J1SWsSGpKkxVmn/lOmO0faByB2kn3GTpPEW/MAGR2/+?=
 =?us-ascii?Q?oF37bcPadd5LvC/bGAIs3Zsa8YzBKEOVlUcYlw/1fek21Q4bqytouIEFPH3c?=
 =?us-ascii?Q?hvMv4tJGLIR9IbvHv9plt4o+92kofJWOvopCc1oY4xyvmAwx0orVrG1ejHqt?=
 =?us-ascii?Q?EHM2+/9klZmbA7r3+lVYXlW+W8dUHm/SDFJ0WacGjH6sRrU3BlBW/8WOUf4k?=
 =?us-ascii?Q?PgDlbhgn0zoVgNFMpuEbg4wE258M5OCNuKvL1DLH3nNtswS6Eyj7F79A36Wg?=
 =?us-ascii?Q?e/3YDj4wKlyHJum/lOkm9BNQlm6NLVnJRxVeCsniUBnyEjZD6yEoo5c3SkFP?=
 =?us-ascii?Q?esXgl5L3l2iygsPkzsc9T7w5y1cKQVptlpu7kdxeVNV5iP/YKX0kYinRgOXG?=
 =?us-ascii?Q?nTmmiBfXoBAWr3uRxJPEGUfwoFu9FeLz15U1ybA8IJUyT6u7DmxUNu/TMbV+?=
 =?us-ascii?Q?ZhtGTk1DfQQXYSERhTgdoc6+wGNDlOBNs5c0bIiHXR7W+RnnsbTA+vcETYCY?=
 =?us-ascii?Q?QbPLGaWXNkmvMeotSPgJtmgwYksFP2XSWCLAPQ9QOMHNUW615tfnyuGklv7M?=
 =?us-ascii?Q?Zzj3phNsrTdrSaf5rzLH8BbU1jWG3kft8az2GtyHEi6c3iP+FVCTdDfT0rKf?=
 =?us-ascii?Q?zUeFPGKp9W/dNIKUrSzVVy2nOKrGMmGfuiNFbnex3y8hcka00fwEub3FksZ1?=
 =?us-ascii?Q?kc081vuTFl4FkPjWvv9u93GDU9kzUN5ag4jVBUVMrT7EzaGpfJNERT47xtWk?=
 =?us-ascii?Q?FOuOlR1LBNANMOtuA7YsbfxyDU/7OhQTUT1qALUoBuFePnAdEG0bu1THJ8el?=
 =?us-ascii?Q?8gWrSRjZLp4nRm3+6NC9bZhttFBComBCGIyBs710NtWcs5nBGMURIAl0XIht?=
 =?us-ascii?Q?T9UJuG+qXR0EbaePu0Ub156KFc5If5rg7F1TF7LpwTQNeQATj7e70kQtPcp5?=
 =?us-ascii?Q?HgQT1IMjokszc9/SCuFqjJlkjOyrVtWiFrJaRAkKEt0yLSap/whcu5fQydBQ?=
 =?us-ascii?Q?E2q3aoAvNxljcSHPSfdtvlkCYpkvx69GRB+FjWK1+q7vJu4k4BwgAAtVDc3L?=
 =?us-ascii?Q?GpX2JT9PGtAZivKR9LMNbV0t753kMFgQ3DslFLiqWmmcxMVG3+KSy0ad+YKI?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 717bccc4-986c-44d8-4111-08db0f00a8c1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:59:31.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWivYc/2WE+1N3ug5qzjspr7KaoAlTal95vy9S9g46R2xOqLsYgyqxtmf9wlOpOPddOn/Ty6xwnrRGd381jLSvLPbIOsKhIvqXhcrXJi9NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Remove dependency on
 intel_engine_regs.h
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

On Tue, Feb 14, 2023 at 12:33:20AM -0800, Lucas De Marchi wrote:
>Create xe_regs/xe_engine_regs.h file with all the registers and bit

in v2 I'm rather using

	#include "regs/xe_engine_regs.h"

IMO it was odd to have xe_ in the dir name.  I finished converting the
intel_gt_regs.h -> xe_gt_regs.h and will try to tackle i915_regs.h
before sending out a new version.

Lucas De Marchi
