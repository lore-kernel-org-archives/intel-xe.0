Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCD3C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 06:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE51810E580;
	Wed,  8 Mar 2023 06:28:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A772010E580
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 06:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678256916; x=1709792916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rG441/YT6JAqpdFPVLHPhgNnFnCSVJBMCw7YraSSFxo=;
 b=Tp56KMpTUT5b2WeUNYeTQtS+XRR1DyHhz6mXMvlIrsmN9XQCElok7txP
 pnk1IA6BZCM8pNBHuhS6Wp6cIs+5FtEGR/DkzUHMZDUzrIk0o+++vJVSx
 +J+AnwFUM2+GgChoFzY3u9HFjTeMCXbIL7o7grr4N4Lj6uzAH7dtcqEVx
 Wobh84gv/jUYpiEORXNvJlr9lPfSqv/+LO0qRVD5Ljez29dQcbKE7Y4UV
 AKI8q59Y+12Nz8B1iFPKlr40b1NiAe50t9HL86mGui1MH+gwbwx8eaFjZ
 ebeUhX+KpwXE9PQz5hP5z8BoWVQkFnLrpvOvI0oECXmLjvuEdUb7BnDF+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333546983"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="333546983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 22:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006187845"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="1006187845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 22:28:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 22:28:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 22:28:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 22:28:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 22:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceVp5SoBjzoW6RPB6mTvxIFgqq4tQaOMnyY/RuwLea4Hnbxap6O2Rq7v8XGxCG3V6Z8Sjpw+iK6+K8JC8KRmpjxZWBfxmrb22oFfBsrZ4wKMdSx31uxP3YqUw4Oyhifh46Xv1we+uM2ygp0akN7MN8mbkZ3BOd+AdCpHF19XIWJBotZPxriYdiHuRyGUKNRdZPPx15mfIFEqncMXRsORAB0XcthEC6ssHtBCtae9v9Ufi3rr8qETer1TmnNNvC+ZUV+mUujgA098ztJm+bOUS8F1N67zr7GBEAGkjqCfghTtOGY1Vc/wX1ZuKNacTJc42MzQ1A34YbB/FXjr5SVZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HH/eLrQtNRzZktdLXAUdjvxVxegW93KlZ7CPRiFdEsg=;
 b=hAi4+wtKwPF4MUL2jeisE9YKaePddmJ3hLnEMdY8TBJohk74tRGPQSuXyP/HBPYryIbmpQwAcKy5L2L4pNmGPqLl3yfspUfxHN/aZssGJ7pjJe7QiNQ55J2cbFhMBeqE8wDNi1/OTTpJ9yXoK2jWBlWv9F5+dOXgV6XUSUp1tZQbzXOEsonpMzRn1uFbSqxxjx6VQNEpsbbrRJ2KST1f7OxjrfTYWF131d+rv4qsYx2mbbZmp4nvHydfz4FtspnQPfgPMA2IPkHCFkLg0wbb8TLbvDRmADWfR/46APp2K4iEovmaOP5AuuCp/Jo0B6MXksqYHfVgdMUEISB3HoojAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 06:28:25 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6156.023; Wed, 8 Mar 2023
 06:28:25 +0000
Date: Wed, 8 Mar 2023 11:58:15 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZAgq/3Rh3fb2iyRD@bvivekan-mobl>
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
 <20230307090643.z5ncdvt6vmyimosf@ldmartin-desk2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230307090643.z5ncdvt6vmyimosf@ldmartin-desk2.lan>
X-ClientProxiedBy: PN2PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::11) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6368a550-6131-47fc-1037-08db1f9e5266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmthM+G8tgNxLlZ4bv5mDmLbWkxcqcm5YUNoSxmFT0zxIurvan7KxCE1CjlbAVj/FDMpVUUZlpwrWnJgvfvBJxhLgv55hGyALRzR6zg8ICMBz/fw1V4uYNqFc5PYDHiPF7i22KHXQGUxJXuSLV6jJvpGpQZjUVLlNFTexHV4Ody4MT06KgmdOLKt1lfqPJcZIAhD8R4Cs/4y307KlxI3Y9nBPtamQJgWyiiUcodOlqonokKHnaBpTetmzIAQyXzH8OVdCSNy3q8VvcJ1nvlEySIN1a6NX/jxWKz/4oMfg1B8zH5zCwivnMiYI/gjQ0QZAfDT0OnPxs4Qo1570lMrlgZKprCH4a8ZTutQaMo/7zxit7qeEhvcb2aSNFkWf9UfHwfAhkDeg1b5ZZPd+JdwM+iaQmqoH4gYobT2/LlfmddX3v6rI2tqLBXem3HVoLj0J55la77o3zHuwTdXjZdOfiCeXaZLGUGSVcWuv9gGIuABARGZPwF1ahO6L9We/XPdHpuStDGIFiLNbhjCkkKQIgKwXXH2S/+PYlNJUvdP1PEElc5OUEWQdBpNhn1eBx7yONZxnJj7sCmPtQOKxrnbv+X4J8JjgJYdOZAoWTmOmbIUCWqdzPO7d128MWW3Qd2Ou/v3F5cORKlsFapFC+x/bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199018)(186003)(2906002)(38100700002)(82960400001)(53546011)(44832011)(9686003)(26005)(6512007)(6506007)(5660300002)(6666004)(107886003)(6862004)(8936002)(41300700001)(6486002)(33716001)(66476007)(86362001)(8676002)(66556008)(66946007)(4326008)(478600001)(316002)(83380400001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnJuQzBUb2lpU2tsUm9CMHd6MTdmM3ROVE45VmVyN2JYNWJUYVFXVXpNWmMv?=
 =?utf-8?B?d3ZoNGEvYVREWVMzTzdoQXhSYWgzOURobUJoWEtsVVF2a3ZIc3dWcitUQ096?=
 =?utf-8?B?KzZjMGYvRlVuS2ZFeUJ6YXFKSFpUcUUyOHU2TFpaWnB6Vkt1ZjJEaUpyT2Nq?=
 =?utf-8?B?Zy9VaUIxSmhodk1qbHBRSlhDbWJFTmxrYmJtTTVOSE9oQ2FPenIzZkhJaTRm?=
 =?utf-8?B?Q1ZmY1llZUFydm5xU0xRSDNPVExhRkpJU1R5Y2tJeGwxUDdlUUxMdStvZlhX?=
 =?utf-8?B?Y04rOW9vSCtyR3h6ZHd4UU5HcDV2R3FBMlF6MWUrWG9YZW1PSmtYcjl1RlRo?=
 =?utf-8?B?K205dlliYnJONmdXdkNDZUFQQmh2THFzYVVZNjNUcmdGUDlJQmtDZEJOZzZG?=
 =?utf-8?B?T2g1NzVCaVVCZDlHSlFFOGFqYmIyZjlaRkZCUDlNaXNSeWczRXhCUURUdG9s?=
 =?utf-8?B?Q05vMTdtMGsxNFZtM0RCc2RjM2lFbVV6L3owOHZJeUJHakhFKzd6Qlp2VHNo?=
 =?utf-8?B?Q3R6WEZod01aVkFLTFZpY3RwMW9sVXFjdlBTYS9hdEdvTFZsRjgveTJORG9V?=
 =?utf-8?B?OUc2cG5DbytrOVFjb09nU0hhbkwzR1NPTzNPMzJ3dTRLM0VzTUswT3lLS05M?=
 =?utf-8?B?b0ZtaWltamZiOGUxV1I2Q2lWa3lMMTBVVUVrSDQxdGxMNlc0QnhPY3NKUG03?=
 =?utf-8?B?aWxJUEtpN0ZXelgxTDQ3a3FmSFNBQ29kS2tERVhIQUxnaHJNYWJySU9mMGFk?=
 =?utf-8?B?V1hocUF5TVpvSjZwL2NuZ0YwYy9kMnJiSFhGeHZGc0FUbDhYZC9HU1VQUWlk?=
 =?utf-8?B?akZubE1EOUxXdTQyTS9mSVdUeXhteDBncHkvMXlXQTg2WWZiQXp5S0VWeVFL?=
 =?utf-8?B?d1ZDNjl1VHRNUmJ4dkdnS2lJNDFqdlJNeHBIU1Nwd0dTdVIwK0Jva0NsQVFC?=
 =?utf-8?B?anlMMktyUWdiQkF4RS9NMEJlWW1sT0pkVzEwZzloUWtmdW9CRE8xTGg4aUg3?=
 =?utf-8?B?Mk5UaitROHp6cDZ4VGJQTklsVEU0Q2tzNU9SeTdKSjZlZnFYZkR3QkNKUEpG?=
 =?utf-8?B?N3BkM081UWR2ckR2RGEwSGRucFFhS2I3OXM3UUp0OVVIaWdGNU5PUzhwK2Vx?=
 =?utf-8?B?UzBEcUo0RFduQ1JTUWFPa0RQeVRycmQrN2pRbzR4VHA5UGZhK0tWWEh4SERX?=
 =?utf-8?B?WWdGUWVDaDJuaTZqdHVwMzVaWU1vd2wwd0xhQmFERXN3UDVMWUp5aWJSTzI3?=
 =?utf-8?B?ZUlqUHlRek5RR3h0SWxPSTZuWFFKeGRXVjNDSlZnZXQvd3QyUllDemJMdm9Q?=
 =?utf-8?B?WEVBaU5PS0VJY3paMGVyTnBLbEcwbmJMVEhkRW5TQjA0Ynk1YjVlSzJzL2Zh?=
 =?utf-8?B?UjFjTWsvOWlacS9EbHg5T3NkNlNKRzVsU2JyZ2JDOEpCWEFEMndnaWdVQjJL?=
 =?utf-8?B?MUhYZ2hIKzl0N0g0WWtJLzJwNGVOc3pvSG5KQUVNWFEyKzB0bUM1dm0wQkVQ?=
 =?utf-8?B?L1lHMExLWHJrUXpNbmRaU2RjY0hMSmtDcDZ1eFZQVFp5NnhKMU5EUzNBdVBK?=
 =?utf-8?B?a2k2ZkM2czZKZ2gzbTByTTRncjMrajArUmJqdnhJb3h1RlV0alQ1VkY2YjZK?=
 =?utf-8?B?S0VEczdmcUFIS2ZrRWg3YXFocGFhVStxdk96RUlRQmFieW9kZ0tycktqN0x1?=
 =?utf-8?B?Y3JVUkt3dkhYSmxkT1hYVllScEhVa3IyWVZDYy9OMUlLVjRwbDduVXdkYnh0?=
 =?utf-8?B?VVVBUWk4bjcxR3prN1J3RW1pcGFkZnNiU1BJdnJsK3dlZGZ6RWlPNmdKeUlR?=
 =?utf-8?B?ekdGOWJNN0xJT2hXR0g1QjFaWlE3TlBONUNBRmhwSkM4a3VIQW1Ic1lPejFh?=
 =?utf-8?B?aGhCeGVGUW5xeGRKQnR4OXZwL1FQZHlBRWxtQ1ZFb3ZoMVF6NElkaFdTd2ZM?=
 =?utf-8?B?QjlhVDJrdUxaQ2tGRXp1VzlKUzhPNzBnOEhYU2t2aG1OQnVwR0k2WXZTY2Nt?=
 =?utf-8?B?aDZtdXdtaWd3Q1dka2dnV2x3dGNSeEVDeXhCL01MYVZlRGpFVjFOdjRUSmdQ?=
 =?utf-8?B?SDdNRDlTR2xtWS9rbzZ0MGRCaTV2YmI5NEs4Z2ovbEpNNi9kVGZTM3FhTFov?=
 =?utf-8?B?b2F1a1g5V2lLeTRUWXlnZ2JVdHNXb29pNUZKMm13U2pOWVFHeUt6RWd6NjVu?=
 =?utf-8?Q?09GqqXXHCe0+jUvrh3ohZ3UzxPGwfdZ51vf8L6tKBWUE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6368a550-6131-47fc-1037-08db1f9e5266
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 06:28:25.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbVUzCB6msYRgF3Is6VFRBpUL6c/Zne6i/RZK/K29ixd37evdHvPFMdiWH5jBc0wuXL4YI3BqaQJ6EkrmhprXKiHFo3IQQcnyTjNfBZ5bFQmdrhH/wqcsLsXBzIT+W+P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 07.03.2023 01:06, Lucas De Marchi wrote:
> On Tue, Mar 07, 2023 at 01:39:16PM +0530, Balasubramani Vivekanandan wrote:
> > Link copy engines doesn't support the XY_FAST_COLOR instruction.
> > Currently this instruction is used only at one place to clear a ttm
> > resource while migrating a BO.
> > A new device_info member is created to know if a platform has link copy
> > engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> > MEM_SET is used which is available both in main and link copy engines.
> > 
> > BSpec: 68433
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> > drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> > drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> > drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> > 4 files changed, 60 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 288576035ce3..df9ed4fbf2bf 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -6,6 +6,8 @@
> > #ifndef _XE_GPU_COMMANDS_H_
> > #define _XE_GPU_COMMANDS_H_
> > 
> > +#include "regs/xe_reg_defs.h"
> 
> for the uses we are making here, it should suffice to
> include linux/bitmap.h
This file is using the macro REG_BIT(), definition of which is included
via the file regs/xe_reg_defs.h . So I had to include regs/xe_reg_defs.h

Though REG_BIT() was preexisting in xe_gpu_commands.h, this patch
uncovered the missing inclusion of regs/xe_reg_defs.h

> 
> > +
> > #define INSTR_CLIENT_SHIFT      29
> > #define   INSTR_MI_CLIENT       0x0
> > #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> > @@ -56,6 +58,13 @@
> > #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> > #define   BLT_DEPTH_32			(3<<24)
> > 
> > +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > +#define   PVC_MEM_SET_CMD_LEN_DW	7
> > +#define   PVC_MS_MATRIX			REG_BIT(17)
> > +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> > +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> > +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> 
> wrong order. Should be defining the most significative bits first,
> like they appear in bspec.
I will reorder the definitions in the order of dword, followed by most
significant bits of the dword.

> 
> > +
> > #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> > #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> > #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 199bd37fce9a..a73c5e1d7503 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -95,6 +95,8 @@ struct xe_device {
> > 		bool has_4tile;
> > 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> > 		bool has_range_tlb_invalidation;
> > +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> > +		bool has_link_copy_engine;
> > 		/** @enable_display: display enabled */
> > 		bool enable_display;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index bc69ec17d5ad..59fd588a1faf 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > 		      u32 size, u32 pitch, u32 value, bool is_vram)
> > {
> > 	u32 *cs = bb->cs + bb->len;
> > -	u32 len = XY_FAST_COLOR_BLT_DW;
> > +	u32 len;
> > 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> > -		len = 11;
> > -
> > -	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > -		(len - 2);
> > -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > -		(pitch - 1);
> > -	*cs++ = 0;
> > -	*cs++ = (size / pitch) << 16 | pitch / 4;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs);
> > -	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > -	*cs++ = value;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -
> > -	if (len > 11) {
> > -		*cs++ = 0;
> > +	if (xe->info.has_link_copy_engine) {
> 
> I wonder if instead of doing this we have here one example of function
> hook that could provide some value. +Francois.
> 
> And take a look at the discussion in 20230303145015.1018870-1-francois.dugast@intel.com
> 
> I wouldn't block this series on that though.
I am very much interested in the proposal. I wish to have such a change
in the driver. Like you said, we can take it up as an improvment.

Regards,
Bala

> 
> 
> > +		/* MEM_SET command supports setting only 8-bit value.
> 
> leave a blank line:
> 
> 		/*
> 		 * MEM_SET ...
> 
> is the more usual style.
> 	
> > +		 * This function is currently used only to clear the address
> > +		 * range.  So the value agrument is not really used. Need to
> > +		 * have a better handling when there is a need to actually set
> > +		 * a value. Print a warning if a value bigger than 8-bit is
> > +		 * passed
> > +		 */
> > +		XE_WARN_ON(value > U8_MAX);
> > +
> > +		len = PVC_MEM_SET_CMD_LEN_DW;
> > +
> > +		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
> > +				(PVC_MEM_SET_CMD_LEN_DW - 2);
> > +		*cs++ = pitch - 1;
> > +		*cs++ = (size / pitch) - 1;
> > +		*cs++ = pitch - 1;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
> > +				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> > +	} else {
> > +		len = XY_FAST_COLOR_BLT_DW;
> > +		if (GRAPHICS_VERx100(gt->xe) < 1250)
> > +			len = 11;
> > +
> > +		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > +			(len - 2);
> > +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > +			(pitch - 1);
> > 		*cs++ = 0;
> > +		*cs++ = (size / pitch) << 16 | pitch / 4;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > +		*cs++ = value;
> > 		*cs++ = 0;
> > 		*cs++ = 0;
> > 		*cs++ = 0;
> > +
> > +		if (len > 11) {
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +		}
> > 	}
> > 
> > 	XE_BUG_ON(cs - bb->cs != len + bb->len);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index c4d9fd2e7b2b..e555f13395ab 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -72,6 +72,8 @@ struct xe_device_desc {
> > 	bool has_4tile;
> > 	bool has_range_tlb_invalidation;
> > 	bool has_asid;
> > +
> > +	bool has_link_copy_engine;
> 
> I'm not sure if we should tie the availability of
> MEM_SET instruction to the fact that the platform has link copy engines.
> It seems to be an instruction to carry forward regardless of the type of
> the copy engine.
> 
> +Matt Roper for opinion here
> 
> Lucas De Marchi
> 
> > };
> > 
> > __diag_push();
> > @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> > 	.vm_max_level = 4,
> > 	.supports_usm = true,
> > 	.has_asid = true,
> > +	.has_link_copy_engine = true,
> > };
> > 
> > #define MTL_MEDIA_ENGINES \
> > @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> > 	xe->info.has_4tile = desc->has_4tile;
> > 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
> > 
> > 	spd = subplatform_get(xe, desc);
> > 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> > -- 
> > 2.34.1
> > 
