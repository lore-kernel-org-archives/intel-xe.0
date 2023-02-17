Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122D4C636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 22:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66010E1F8;
	Fri, 17 Feb 2023 22:30:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164910E1F8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 22:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676673014; x=1708209014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nb6ZwbJei9J65ReqqZnoL9RizfUuIH14NymKPYEqXFc=;
 b=fw6HInFP0GwahBYKJklimh9jvMTYNxRW//K7WZ22i24ML2STjqVw7c0V
 qa8T2R1zNL2BB7vNFSL/ut/z1tBjrn4R7do8L0ENlGxmcSqOc2JwqU8fx
 k95iYm7AQYJQFczAtfyWOrazekZujeC9C/gft8RaqIWXGlqsP1LPzvRSN
 SoQP4Y+a0zyQsg1d7IJFZ/EHZ3iLAcKOtf/Efa6vDOJxOxoiblmef1kq+
 D89ygjZBUYciqCCMJB5R66/uh46/sjv4KuHyKdSalBTPbRs09bo6YwvKy
 PsLvpacCAEThHuc1HI/McUMa83tlXrVwdatwQo0RsaMOdrRTZiZvGyR4I w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332111013"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332111013"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="670702254"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="670702254"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2023 14:30:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 14:30:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 14:30:13 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 14:30:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hy+xbD1EVE47uwe04F2hkEdnbkQtMcma6tCaGu58aRkmfZlWgXITizWSK8cxreMnKoHGHXPNve+5XMYOBXcweAVhf+5m7teDnvssrNRkatU2aQ3YEQ34Z3e6UfeYjAPOs7i0+IwPzcT0HGYd34PPsDiw3yU2JoN2RzJ838d0I4ErsqECH9RkbXUi45cpcoN05+OkFUiDD/3/iYdrpwfUbOYd0yg5ekoReDD11S3QOysvtg/GAB4/NDXUTCSKTWUvV7i6/Kyt485UGGUQvbB4ohuXBNJZEg9T6dkfOLGmLuscIA2E+JiJlalgi5qtr5UDT3/FEGhg5m/HnjaPvX53qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLX7sOW3mz4Mcaj2pB6mQSxFzsYT1LqX4aXTczUHoEs=;
 b=m1OcYEv5SuESAO6OdGaRN02poyGn0pSZlRPoTWhkr7sEZfTSU+Zsv0VUIi8TP0wjT9IseWyAARDl+5zoI+mj8DE6xPRNt6ccP8io3S3i+ZnM6XzQkWHY+qaE3nva9mVUxNeEZCoq9KUVkwqF+Fe9C+GsTZh1stRL6lXRwBMpPzwwFZdC690qsc9UsZ+1ehBxZiKCrBqMNSM01jr+xNwFkjw5jhLjZEAtTDIePta39qYbA1fJGDf4e8zgfNdejdaObh4seMDnXz43hersQ36oSzrGIcBUOq+Di23kC7iyPXMknt+xtWBn0iStA0lOBmcpfq4BKBoabVr2Zp4u4pBaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 22:30:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 22:30:11 +0000
Date: Fri, 17 Feb 2023 14:30:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230217223007.n5cwcflrscv6giid@ldmartin-desk2.lan>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-12-lucas.demarchi@intel.com>
 <Y+/jaCK7TSG+qHa+@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+/jaCK7TSG+qHa+@intel.com>
X-ClientProxiedBy: BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdd2c7b-de2a-4bd7-32d5-08db113687d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8US1PiyVYCgwv2mPwzSDSx5TLbiUrLmUiPHdbxNYCDERxCEt8PHFKcSPPydZCEy50GAXrBg5vvlOmgBwTMCfaCXDaZIKdzaluQ5VdeRlRNup1FGaOln9OLltESRZz+P66nU9QEzruD7DOgM8asrZFoJ5mTPhubOdzRccmp1eite2DcOO9KbqRBUn0uWWnX1hlQ1sUjdgS8ffZh1QowUjyO8TIJ2YHVFuUzWJ355y/bmgv2EQao/Y1TQEzLf7roRIP3GIjqVzCsfB7moAAwQQAnzXATAloSX8PsDfF8/mJtylvXlXgtEpTKVg0PLVSi2ZDoFwpF/wBlhJtWwa6MSuk7fN4AO0bxP5dEy24kNb5N1ZNTtrLUTqYLnUmsaBlcs6JoxHnSH/ZKLjgl0bv4f+HLtWluZH6wMGMn+iuFvVGogv5J6zhzWmsN4bRLphKod5TNZDKUB51J6NdLfELB0xLtM5bRdTY1B0EnVvm7UFAvcVqtrQoXqCIhauhBEgEl4uVt32wVJBSx5ET6lXJtzx0AAnjKWAXPl2ZK0O0LR0/hEeZGiX0Xc3LNYvmJQJgNHB96PYzJAMPjtHTMjSUdrM0ql2Jk0MdhNTJw3E6VJliCcL6RrEcoM5FUJpG389iYVnPlua3j5z/NurUbCE5wOzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(2906002)(86362001)(82960400001)(38100700002)(6486002)(6506007)(186003)(6512007)(54906003)(6636002)(9686003)(26005)(478600001)(36756003)(8676002)(83380400001)(66946007)(66476007)(66556008)(316002)(1076003)(6666004)(107886003)(41300700001)(8936002)(4326008)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3APSsh0TaWDZdzXKdg3ggvaTzJVeGXIe5tGjkHGCQ6L4puTzPktKJALFSiFM?=
 =?us-ascii?Q?B7Jo28vRSj8uIDjC3YzQ1FfzjOmiuGO4sh+tzFv7Dtor+dSd3OwQcYQXXMjz?=
 =?us-ascii?Q?QuiZCsrGdHDWL0g6QB0CnH7wmDijiWa8zcQQOKf8WNKtRU1SzESSYpSdQ5sr?=
 =?us-ascii?Q?NJ9quJV3SNFPOo/fUNNwnFQ0xXJM4wGJroz7Axsg9+foqIZdke9rX45gFWCQ?=
 =?us-ascii?Q?C6E2jZ6B9/zSU6d84OD9Ps2uzb5kMZAB1ZmfK1+ukIkZ0quxCo1Ri5XrccfQ?=
 =?us-ascii?Q?SWEPffmXjEGN8WlUVZmOxRfrIsCTGuYFuGqcr4pcTw86bS0HDVnlp84xeuQt?=
 =?us-ascii?Q?/NK3OI3QvUgZptPEbagcdPPY4ieJsFwqQ95bbs+EKOSBRgQuC+Djw+2G7NpI?=
 =?us-ascii?Q?thrHFb9nDZEXnNIczPjr5d/UTSoQ2PHHWrMl+ZU3B19KPZQo+4k7ZNZmKo0R?=
 =?us-ascii?Q?zIc9YZlX/mJSzGt69xo6xZ4Tw8T3LvfZz2bzAPFB4IVUKK1YwzjuiBZg4ne1?=
 =?us-ascii?Q?/mAu++dNfFoWAmvir5FTv6PuvO7JAMG2jyvkRZ+EHxzIi4dtSSJbKr8LknAq?=
 =?us-ascii?Q?Rp7at5kn8Zuf5S4QQSnqUdAOADjuBykr86eyF/EgJA/bFML0YCbEr0UrcZnS?=
 =?us-ascii?Q?vP/NPXlvosxkP0cJSmAjDk4DvBQsMgBv5wn33vSoSXehcNqyLjuJcJAZH/8+?=
 =?us-ascii?Q?6wEU84X2CePZiJvltVHZ9PahU6hJd/BpGXORg4uNqRsRYwo5y8yBx89zhSo5?=
 =?us-ascii?Q?LFOxxxC2i75bDwPk4eBGTB3MwOgSLc3Kq5ojSm7C1OV4g6cDocxP32G06Jln?=
 =?us-ascii?Q?qZbvgfn0/gbvAYTNpUG4Kr5fFur32eJz9WCB3bcD5DXwcy82NfDfjmY1yFPb?=
 =?us-ascii?Q?v+Ll6sFka5IQfabu115Ud4WJPXFl2SuLsKI1n7NRXBp62WACUoBqR6bTB+7t?=
 =?us-ascii?Q?Dt5iHYYE/k4cRrEwG6jG2IKGD8A445J6ugeLRiVgIZoLKfrscb32xiUlQ/3J?=
 =?us-ascii?Q?Ni8OrUYPUweCvyyvB6V7t+DGWIZcYrH+9PzagdheG2berURSq3w8Bd8JeOwv?=
 =?us-ascii?Q?eTJFujZpK51frKEEMPE73G7zWFqZpy1f91iK6xzm8wlVS/vRPjQ0aZB4ISsI?=
 =?us-ascii?Q?Q4hwKXEPvLzxHO5gnQMobFFZeKTg7pu6iKz7i78R7Mg0/dpFqxjq6blLCAlW?=
 =?us-ascii?Q?VWZumFzq0VB0b3Q2CvamoNXdsSfu2zlEzZwlikuJwROkdorFKutisi9RtK3u?=
 =?us-ascii?Q?Yd7If7yWEEClaaPjzeZHOv5kAcl6bwU9oDINGXpdu3/KfS1LGmoEFa24ROck?=
 =?us-ascii?Q?5wvpD90zA8GgoZ1FcEuW37AkbN3ZXvdpWXmYVJKcckQ1druhcmsJVIrXWSZy?=
 =?us-ascii?Q?IUYxP+13J0BRON+Au6WtKyADO8a86HiCjzAFnyA/jLSrGK/OuK0Q2UuZkidM?=
 =?us-ascii?Q?P5pYQRdIrPx0HSt5sy/yXfWXKGZJ2Wc78uXA/Glzr9XMK7jswKFikSK8VW4Y?=
 =?us-ascii?Q?VrPWn4i47qTgtcWXWwtzdbN+8QkCIIr07WO74FbXwoc2B/F97sV0266TnW+O?=
 =?us-ascii?Q?Ityz4mg+TCpTploLA+DUVtodxxEuBykE3WZfR0MBH9RiGtbVKsXn5zwab8xZ?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdd2c7b-de2a-4bd7-32d5-08db113687d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 22:30:10.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xA3dWkkrEut4RT5+AzHS/AdF0f3n2zuP6ttD7BzTcBr7qjw4Cgx9/+cxBzG6eDFt7hwMVrUuV35W3uvswM/LCkuFTQZ/3In16LothJIydzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 03:28:24PM -0500, Rodrigo Vivi wrote:
>On Thu, Feb 16, 2023 at 04:52:26PM -0800, Lucas De Marchi wrote:
>> With the goal of eliminating i915 includes from xe outside of the
>> display area, it's better to use relative includes for the only shared
>> header, i915_reg_defs.h.  With this the build system can be changed to
>> stop adding i915 as an include dir.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/Makefile      | 120 +++++++++++++++++++++++
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   2 +-
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   2 +-
>>  drivers/gpu/drm/xe/regs/xe_regs.h        |   2 +-
>>  drivers/gpu/drm/xe/xe_gt_mcr.h           |   2 +-
>>  drivers/gpu/drm/xe/xe_guc.c              |   2 -
>>  drivers/gpu/drm/xe/xe_guc_reg.h          |   2 +-
>>  drivers/gpu/drm/xe/xe_reg_sr_types.h     |   2 -
>>  drivers/gpu/drm/xe/xe_rtp.h              |   2 -
>>  drivers/gpu/drm/xe/xe_rtp_types.h        |   2 -
>>  10 files changed, 125 insertions(+), 13 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/display/Makefile
>>
>> diff --git a/drivers/gpu/drm/xe/display/Makefile b/drivers/gpu/drm/xe/display/Makefile
>> new file mode 100644
>> index 000000000000..eee576972427
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/display/Makefile
>
>shouldn't this patch also be modifying the drm/xe/Makefile?

sorry, while trying to resolve the display situation I squashed this by
mistake here. Next version I'm giving up on the idea in this patch
and I will just create a regs/xe_reg_defs.h. That will be the only file
with the relative include.

Lucas De Marchi
