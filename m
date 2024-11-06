Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD686D59F7E
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 22:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348210E799;
	Wed,  6 Nov 2024 22:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEVzV9Lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E962D10E799
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730933134; x=1762469134;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uuOGz0H3xKU/VFLirPvdepgTDnXBlBMdyy5hAap2NSw=;
 b=hEVzV9Lgc/RdS270G+oRBMJ0yNzlaTZfUnntbU+zbLDFFCiBtMMSdP2z
 o9rf7thhJSyFGMjPfxOyL8yW6HzanwIM96GiY16VbRBIVwxAbIEcgetEs
 24waKQAg1+SIS+BLgRI+jRjW7ndU5Ns3pzOweL/aJtrpyzG0yVp1jRKac
 qpZCWsg+PYzT+/YzyWoTJK860yd0opsT1yc/5plWmn378ejOeRWaP/DrV
 Qk1YkPyczyBtwzz9djOsl6w/tl4oR4iIicShuSuRA9LNQzPus+/a+U02K
 ok9H+dkLAoGoCONp+cBUN3xgrYFvx9ACtWuAsR7tORqMUzd/7BFeX+94v A==;
X-CSE-ConnectionGUID: UdCIJJPvSfyR6P8BBG3EGA==
X-CSE-MsgGUID: QQLSSeqyQJaHOUZ5D0XmRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30857851"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="30857851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 14:45:33 -0800
X-CSE-ConnectionGUID: PhUFftA4SyOnOyjhQl6Cww==
X-CSE-MsgGUID: MmC8enbIQNmpl7xYqlidwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="89641553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 14:45:20 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 14:45:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 14:45:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:45:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKYOvdnmNk3a6JHeSKMDwUaXNJt3V89aJFJYAYIWwbEFTWeeWQ7r6xvvVvXJkYrUgKlTKhROPjYiPhxmpeEsAQY3E0BhgujHqiLxHvWn9/Q9s6T+/v9eU1hu/QDf/DvfZB6mN272r71Bgye/N8BntHUWeoe27k4PH3uOSbfPR9JihBADRmZ66OXgSk2gtnBzCUgig2SmBW/jsNQn1lTh6pwafojx1nuU4IF828rHAS3+XWfXiMiVNRzsc8JU3N6asUIy9+jm0klKqsTFZyKserQxTeNc/YqiCk88UkhqjR9gg6WSNxYrsL+4sZBpo42Ql2P86TubhLmdDgSOTQ9Ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbeCWlsEufW500DrlB7iPa+t+EoMsJZrwVlCk+IVnHE=;
 b=UvNzH5gHkotbCbqphVottlKmXagqG4QRZzWLLgCQqeVN7NjwHlSYkgOZQFWZmx4f55bvbFZx7Okl4616xWMjZqKOUwYvIq2lpN2eOWNb7kW/uIZSBnRU3LJfAlsVrA3bEssYt3K+7vRjE1ZNitKCCkg6eYMOLiX51ZPVaQ0aEiRBh3HFy/eBfXyk/0Cdk3tM6NcDLpKBIQSyLPRXd8ntqfVhOnf1d7pyg/b/BX38IzvPxXT3HLxq3hJXHl37BSIs2KOoQrVblVVT43vMjJGwvvwWUUHHS0p+tM8bFO+IVoFtOt0zzaICyIphsIxoUW2eUhAbmA3CnZgjF859ua30sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 22:45:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 22:45:11 +0000
Date: Wed, 6 Nov 2024 16:45:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <lionel.g.landwerlin@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Do not allow scratch page on long running jobs
Message-ID: <63zay5uysgin6amsktxqwzu63hcxcgjbov5a5455lzwgbrehnm@4yvoutvjmpx6>
References: <20240919104704.3591977-1-nirmoy.das@intel.com>
 <ZuxIuCF+dsxOT253@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuxIuCF+dsxOT253@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ea0c9a-9150-4de6-2de5-08dcfeb4abdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4sFtAyCCWo4wB5ny2z1rKpWLoCZiZptNPqsPwv1RFwRlP0kuSuxQGfDJR7?=
 =?iso-8859-1?Q?mbp5vXYarGp5dhPeC0b+wcYa1pN84pf1b76UFkG0mxGI4wIkIfMrA0os94?=
 =?iso-8859-1?Q?mga5ladGJovoqJPvbqZM90sKo7Luxbpo9jtQ0PNBxfM/+rZFHMJIzLONqY?=
 =?iso-8859-1?Q?IKqvgl6rQDRwtm9ADP1hq7dPalurktcDE8dbnMOVI/rKcgjqjv4hxK6zBv?=
 =?iso-8859-1?Q?YfqHgUtvQjdJ5pEpR3dVDf8U6cXlOJyNF6ssM0GUieHA+Wpo0oLl+7/UT2?=
 =?iso-8859-1?Q?m0hVK2t8/O4rYoHbXIHoLQIglDW+KJNd4JEkrKx+SdC9UfIDoAlT790Wfx?=
 =?iso-8859-1?Q?6I1qRU9jzGjuQR0kX/lIlnBZHKi6iGsuif18tAzamhsKF15R/h9DfgNpYG?=
 =?iso-8859-1?Q?FWkD5FS4ew8cn0GBvox0IoQHErJ9y7Y0ser0ZhTluVdmX5lFadhbLK0dRP?=
 =?iso-8859-1?Q?6wrbR25BC40os3eXf2TT6pHoA66cOMzXE0B0tkp9TTiVa4WzjC006X8L5q?=
 =?iso-8859-1?Q?FlNeh5CZKGHGdA6H8DoLBrKr6h2cWUhOn+x0j8bOampIwVsajaEkuZkeqS?=
 =?iso-8859-1?Q?Wh2ljpLmZQSzkwMG+X6X6j5tE288DHhh+7Xaz179JLNb+p/EeicQ4Sglot?=
 =?iso-8859-1?Q?fiuQ56ZRirjAvTNW688fcYWK5Mg5iZMrrzzVXtvvhwk05bkGztThwZvZfm?=
 =?iso-8859-1?Q?VwX/zEH9mCHv5pMpSvhbSqv+TfTOVXqSnRwAnZ29yYb9ywwQ6ncDgkb7M7?=
 =?iso-8859-1?Q?m/xTH/uMWekGkWZAvjIakUUoHCos7Tl72+q/BhAsxhyAdBN9Uz+5dOFjxu?=
 =?iso-8859-1?Q?xVzBagtT9pnwBtR5VCcdldk/qayl1ZzH8CPKqH/vaYMU5qDTUomON5VXJE?=
 =?iso-8859-1?Q?dC5jd8Rqubgcq3GqUJLqZflBfC0dszMiUeet3iAfZDdcu0qAoKemgNkcxq?=
 =?iso-8859-1?Q?sBerIk/5WDLBE8kgepr/SrE79ikWeFsxRGH00Ix9gLjt1WscCyu2hQL7q/?=
 =?iso-8859-1?Q?sQM7TSja41Bg3W3Pa+9ENFZqKJyI+jrG4zI+pOUlvhZKM5Q72zNZcClO/M?=
 =?iso-8859-1?Q?kstwhQfw83NyETasW0laq53DF4bfZfg4xY+z/CS+0N0ZBaVVCwXflI3tyv?=
 =?iso-8859-1?Q?18fcytp7xuao8yNDWK9PRKSAYSBQwo8j7irrXedfmVM+IL87VlEAOVSFL2?=
 =?iso-8859-1?Q?nOBwTUSYRJexAGajMBsO1kRCZUH7H0DOM+vU1OMBX9DBj4WLJgLkE+VaNR?=
 =?iso-8859-1?Q?jQPxqh1XoKBtnUAMioLG7cnmno3bVbHYYlxkrSJkHox20D3a0Li4XNZM8O?=
 =?iso-8859-1?Q?0MprLzzgc6Vf+JRsNVX/MYsL8s0cgXPH92/5kJvdhXmgr0bfV0BJOmmy9v?=
 =?iso-8859-1?Q?ZEHGyxrr2d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H7CWPMi3BHtEdv0wa90Yei3s4GX83cMMgx+zFW0CwrnMHQtxknRlQ5Ggdt?=
 =?iso-8859-1?Q?wOXIneNhuGMPQ6Fxa18QZK8juwZHznvr5u4VAR3J+pHzUI3hymDyZS5kk4?=
 =?iso-8859-1?Q?tKts2JWYXQ0QnejL0ZshkTHYz7/kFdVpq6M0Pj13FVylWs4SH0tJZ0f8uz?=
 =?iso-8859-1?Q?Gx1Dvr7UoUIWat/f4rHd0qr7NnkI0hMRZyGFHWLfA22zAZQYwBFjES2yCK?=
 =?iso-8859-1?Q?dbmUbmv2VVpWWjwKvb5KrZj6sgo266EafGhSo9XUn1TYXZafLGSYIdTBE2?=
 =?iso-8859-1?Q?O2e8E5l9OiISc6es8cb7NPpC9WLaOkfj4zMXwzopMNYbFBNR2uDz3gzY6D?=
 =?iso-8859-1?Q?11BVrBezidjmyfJtVcidm6IlAMCNf+r6ptg18/pVWs0qpe/ssO+LaEM9s+?=
 =?iso-8859-1?Q?9pCDPYe2m8ppSOAXeLST/JXfmM/fGWs1M6FhQlErL7LfrOA71E52efYzlW?=
 =?iso-8859-1?Q?B2pvm2NR0OkPwMdmWta/vaZ8cc8oGtiJJfoWAS+1H9o7EVOXc/Sf24Dd1k?=
 =?iso-8859-1?Q?imFGZtszOzzsvP8JohNSSQpAt0PWIU84gmwc/bmp1HY5DnCPeS+WNejDwv?=
 =?iso-8859-1?Q?D35PTRyJWLwqdX80d0y/kzy6QaAoEYsM6aT+KWhfZVLIYlksPe2kAoiNy3?=
 =?iso-8859-1?Q?giftOMpStymmY8hf8DdqgGM9PsUk3SMxPhKYK3Fi3D7IUhPVFzeIkW70u0?=
 =?iso-8859-1?Q?y/NYxLt4p8Ep0NnIEzGqk3ONOzUSGf266CDBqDrn77s4OwwMfeOJq/BIyx?=
 =?iso-8859-1?Q?a1y2V0T+HoMhFKez2RDlyMniKuOjsL/QOxt6QrAceajtP29O0qfMtFrX5F?=
 =?iso-8859-1?Q?o75XHAk1WzLDU4QityM0rr8uheuMp0fwKTmxEjz3y/TfqBJrbCBbpZCKxk?=
 =?iso-8859-1?Q?CiX+CsiBzPzb9amy1ipuick7nkGil0kVzOXBG295vHu0ORba4eHfLW8jZl?=
 =?iso-8859-1?Q?6AGjsPi9hUvGAAt5dOFFGnx6BPBcmhSuEtSLfNyEb1A9jtXEVHHLfRp9+/?=
 =?iso-8859-1?Q?o43k4bNmPeOO8zXQAx3jNu8tvNq3YR2+Xo7Qq5S+KsdDNeqwOyA75k/ojg?=
 =?iso-8859-1?Q?rGQAZywEY2ywL1+j2RFTiyC7lDfrkiWuaSA0cisoIv58C4Rvs27zW3W8SY?=
 =?iso-8859-1?Q?D0i+Jj06EnbWv8XCYYTVZBqvOyrPVGdHkYBjn/zpPVnzGWhFHZiNfcov+C?=
 =?iso-8859-1?Q?Olny1zilZ6gQIi4cpW8F3JT6b2JojohjM0Pdp2/cdSySr/CSTuVpb4DQDi?=
 =?iso-8859-1?Q?/Pn6Pfm6yMCIsqp10loaCo6dVo26ziNyF5SrPl3heq7jG0jgGRc6HrVPCt?=
 =?iso-8859-1?Q?XT0Uq/2dppZ2l0YcMEXglOXSOODeq8Nl6BzlX16o/VwsSt1bbutOoFhCMZ?=
 =?iso-8859-1?Q?NrA+xR3Er4LKvssnAI1s+cFyBaA3039PGOvqvnU5sEJFJ+3AxATCjwE4fP?=
 =?iso-8859-1?Q?KlwPB8BFQs2ZnWJoOc5dnztu0FzY1PqRQMMcJjP/v9o0n1Pz3k3/n8wSh4?=
 =?iso-8859-1?Q?1KHxHlPEdoc1GL7N2KIeGFI/yt+xJ1vaXufyzm3YfMdJxeiC5vp76MrelK?=
 =?iso-8859-1?Q?jafcyJ+jspgX2ErhqjxdbW3u4/14w30BbAuvfF63Q8lmtMelDjVh4dfdeK?=
 =?iso-8859-1?Q?b0OrhhTJb40TdQNCpQvcH5HLxAT3W9o51qFiPXPsc5n6HoGApZfyWhAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ea0c9a-9150-4de6-2de5-08dcfeb4abdf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 22:45:11.2883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtM/JKAO3T41CaCdxFZ4WoQjU5bqsZpVsjF8RUQQecDB7vey5HpxfbSix9aXD3m5TVr0ljzdcyCNQtHVxzTuoHx1owD3SMouY4KNLUE8Ssg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

On Thu, Sep 19, 2024 at 03:52:24PM +0000, Matthew Brost wrote:
>On Thu, Sep 19, 2024 at 12:47:04PM +0200, Nirmoy Das wrote:
>> This was agreed upon but not enforced, so enforce the limitation
>> of not allowing scratch pages on long-running jobs unless absolutely
>> required, which is currently the case for a DG2 SKU.
>>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>
>I think this type of change we will need a maintainer to bless and

Sorry, but nack as this will cause breakage on UMD.

>likely someone from the compute UMD.
>
>It does LGTM, with that:
>Acked-by: Matthew Brost <matthew.brost@intel.com>
>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a3d7cb7cfd22..92dc55f3479b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1711,6 +1711,11 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
>>  	return NULL;
>>  }
>>
>> +static bool xe_vm_device_requires_scratch_page(struct xe_device *xe)
>> +{
>> +	return XE_WA(xe_root_mmio_gt(xe), 14016763929);
>> +}
>> +
>>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>>  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>> @@ -1730,7 +1735,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>  	if (XE_IOCTL_DBG(xe, args->extensions))
>>  		return -EINVAL;
>>
>> -	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>> +	if (xe_vm_device_requires_scratch_page(xe))
>>  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>>
>>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>> @@ -1747,6 +1752,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>  		return -EINVAL;
>>
>> +	/*
>> +	 * Scratch page is disabled for long running job unless absolutely
>> +	 * required as this can introduce hidden bugs.
>> +	 */
>> +	if (!xe_vm_device_requires_scratch_page(xe) &&
>> +	    XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
>> +			 (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)))

I don't think this should be imposed by kernel by simply breaking
userspace. Rather get our UMDs changed which should cover most of the
users. Possibly all if we consider long running jobs. Then much later if
we see there are no users we can consider something.

Lucas De Marchi


>> +		return -EINVAL;
>> +
>>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>  		return -EINVAL;
>> --
>> 2.46.0
>>
