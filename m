Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2A1EE14D0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 21:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5C10E1C9;
	Wed,  6 Sep 2023 21:26:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709B910E1C9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 21:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694035591; x=1725571591;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=b7BT4umY35rfZyLMVsTSbMQkdUVWbVtJ10pbR1zBr/4=;
 b=XQsR/vOUE7FuIK4KItIzJ7I7B/4WwfjWTvH3YoAT2kk9PKNb5SpAFcrj
 HAxVO+GTZmjkPUaBieRvoJdGC2P5bzUXWEtk9w4dG4V77k+o33cbgNsIF
 Cgpz9IY04tWxrbj6JfzzP0ZEkoUXSDteQaUjuFNyAnD9s8iHibd8SpwoU
 wH9zS3nUtptsq6fu0nRBLTq8Noeypz9Mn/mBZ3SpmzxPgtgqW0gskFeqz
 yuDCSPutpN7MuNQwkkCe/+EESr9+xQosLdE4oLg3Xq8dROZvtudlBVgWb
 AawLDo0RUthYspSli2PxuQt5ogsWDGDOUeftx2gPMrQoywB6AInANCR0C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374582035"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="374582035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718431273"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="718431273"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 14:26:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 14:26:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 14:26:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 14:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5bnmCjcA/tdp5jxvogCoNlwKZ0C/248URyvyt9ItprgYt8vfwpGvOKkYQrD6w6kI9DT8SBU5PHwDoPMCPycdLHbbJsK8OAsaU9Xy2fpjpd7ygHWAjaQehiRbNJBmoWSOI6F6gj1r+Q0+drsUhXJAHKwKf6hcR5a8YPdKpk6g0nIiol+1hQ0nb1tvl2N0S8tOM5e8DjVMsjwsJ+r0TEWzCMNrE+SRmWe+7UAZM4ZAcDMa0mdDi1bpu7YDT+fE2hsg1q7r3x4unxlIJsAIzPDFqt1/KwCGLfDlf+xFmnDLYrsIvLRCAkU4VmRhieyoEZ75eKth9D+g3fJRNxZwHL0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnp6jz8TFzNJli/8K4Yx9BrQ9qVkZVHBpnHa2mfsE08=;
 b=mVkwlQYhbfaVmKDs0C568XaPvUMqxoD+4ELDwRQjz1gpptF+G/GQ6ds067Z8b2FeOOJ48h8ryGiFJextm6DldhULGL0DMWYqekd36I/aepP/vBo/uxROvhwy81yl5zrWRHMyHS+iAkJYDzBLmwBSCKDbndwh2mzXrJKacOy8MTMT3sfORZMBnT0tI4x0HyBY9SEVPXEMlMfBPqm4WND31SXb12DeOYSFRgg7QJsRzyAAfam2J1aQMWCAHVUcUbbwqWDwDsaISYg9tf/ojndaRkghThsQHyv7kYO67aYaGc8Zj9kJSkxqOAA6Ix0wrNEChBWb1EE/YqRjW+Oow/sFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 21:26:25 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::b535:230:d75d:bba0]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::b535:230:d75d:bba0%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 21:26:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <diyxbzamuccprdppcicllahgvkovvs5mjmfiucimrrwkikpeur@2q3ta42nq2ie>
References: <20230906200049.49674-1-gustavo.sousa@intel.com>
 <20230906200049.49674-2-gustavo.sousa@intel.com>
 <diyxbzamuccprdppcicllahgvkovvs5mjmfiucimrrwkikpeur@2q3ta42nq2ie>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 6 Sep 2023 18:26:19 -0300
Message-ID: <169403557948.1922.4921965314184804625@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 381ce5c0-5c09-4d81-a164-08dbaf1fecaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iY7WIru59yXZIlPp82FowWYZooHHDTcjzpYJx/JkwbJZ9XP0SUx4tW5HDOvYAONDwaIC0q+gaFT2HcWI96pgxoP2xo430SyKy8D9z6o7IqJhD61AVPIhxpMi2KYvOh5PqD7dU+P9JmkDvqmC6V0iYNzXiTaQ2LVvrqguUpApv1XxdN/Xc2k4wtVf1HwSd0czSb57xDQZCmr8fXkTvcnXAVjMisDJQrAampzvZiTEooXU8krcGc8kUb4JMDcj782r772mted3PxebrkpwvEAjaXfVZP8f49qq4mHTLpYu1Q//er8LK2UzUrtwJVdPiFw9twyOgUM9wMPeCiCZZWB2dq1bpqmQPHPQ8fpHU2ddALrt6CkaCGn4yaM/WyPcRREKvq1cuea1AOJlyrNGJiMYTcZyR9KhXFS08UU37Dp9OTq+k2HlGab4fejQNuFcs2rJX7OEDSgi3w8JGty3M8HG5ZcdWqqdLuzez2xkPhiqB0RJZWnt09eK7TCXya8EBryyrBTW5rqayYrTWh6Dga82egRQ0JQQFvkswC9AUCn9L7ltauwzlp0VcIaG5cDFCrz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(346002)(136003)(376002)(186009)(1800799009)(451199024)(38100700002)(9686003)(6666004)(6506007)(6486002)(82960400001)(86362001)(2906002)(26005)(6512007)(83380400001)(478600001)(316002)(8936002)(66946007)(8676002)(6862004)(5660300002)(4326008)(41300700001)(66476007)(44832011)(6636002)(66556008)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzN2NjZBbmtJRjNaM0NmYUg5RUpjdDRnblE2VUNjWUdJL3ZnQ3RNRytEb1RQ?=
 =?utf-8?B?TFFSb01JM3p4VUxQbUVsUHFSeldhcUNVUFY4WE1NcUxvVU52QXphWmRUSjUy?=
 =?utf-8?B?SFdZakNKOU14bVlLL3lsdVZERjM3dEZXS0JIeGQ2d1I2VVQzN0Y2clJPdjZa?=
 =?utf-8?B?UjRjUzczcEtHVGpnNlB0Y1lNblFXYjd5alNsVk90aTFzTUNLQVJWZ0M0Vk5m?=
 =?utf-8?B?cFZsRldZNlBzZnM5SnpScE9LTUFZS1Q2SHhwUGZlYmowazZtYkZiaE1IeGc3?=
 =?utf-8?B?a1Frb25oUjBqTmwzUTZ6RkoyOWNwVTRUN3NFOFF6aUpKUkMvbzl1cFV4VjJE?=
 =?utf-8?B?enU1VlphZ1gwVFhNQktKNzFXWVU4NnA1T1hzVFVmK0NxdThFZ2VVQk05WWdj?=
 =?utf-8?B?K05xOWpLOUNpSkcxQTIrcEt0aDI4NzVMczhRd21zWjFISk5PZ2tENTlYck9o?=
 =?utf-8?B?eU1sVmx1NFd5UjR1TGJZREs1STE5bHJoV2E5WDF6Q3FzdEVHN0lqalR2dEpu?=
 =?utf-8?B?V25hd1hYaGxjMlJQV05LREw5OHl3VkxaNTNlWnR2c1M1UW9CZUhONktnbVl0?=
 =?utf-8?B?MlVVdFdNeXZseVBoUzdnVFlwN3FxNmlvSmQ3cDYrbmtxQXZNdEZkZGFuR2tk?=
 =?utf-8?B?UTdCKzVaYUJHOUxadCtlNkNMQzhiRmZhaGVqQ21GQzc5MUM2SGExL2MvR24z?=
 =?utf-8?B?N0ZxU2RhZVJwNGNUWVhVYWFrVzNVd3gvaTZCTnQ2U1IwcFF4RVNUd3M0VFBi?=
 =?utf-8?B?UnB0SW9NUEdIcG9SNmZZVUY2WmdaMFQwWXp2ckZ4RUJ1ZTBham00QzBESUVs?=
 =?utf-8?B?MldvdVEybytRUStEaExVZGpxd2RRR0VTaU5sMjROYlJuTUJPcnk3Z3dqc2Uy?=
 =?utf-8?B?bTI0Z3BZNVlqN29ZWDYvUlZ3czhmbjNzZllYRVNzU2xjeU1tUnlJMkpQbytZ?=
 =?utf-8?B?K3ZPOUg5a2tjUHF1WXZWeW82dEg4MU43Um5HdHdJVDZKUnNwWW94dmpQbTVo?=
 =?utf-8?B?UHJqYXZXbjNscEZjWDl6dWlzcXhCNlNBQ1Jld2tDWjc5RndNRFRYQlE0bEFU?=
 =?utf-8?B?cWNDNUppaUlkdTkrZG13Z3luSlZNWC83VXUrQ0J5WGJwV2oxWUhjRURmcEU4?=
 =?utf-8?B?bWdQVnpYVFJLc21VNnhtTHhCNkM2MFdrUkdQaUdDNy9NaHBSeWNHaGdWVnFQ?=
 =?utf-8?B?UkhkWUljbk9LVzFidzI5eUtrRHU1S3NYeFoyTzdJT2V3dzVkUjVJNlczbnJ0?=
 =?utf-8?B?a2d6UmxaUXJtVlZ1eHRpcU9SR2NWNXRtWWtxNU9WM01GNEZsekdrR3VxZVVz?=
 =?utf-8?B?aTVvMVNvUElFQXdlRW5zWnVFWUFrejZnM0VCQS9rT1lsbDREeVF5ZFNkRXcx?=
 =?utf-8?B?USszOUZkK0JRN2k0dVN3SVpkQ2c4S3JnM0t0dUpiek5nanM3K0JuM25uTVpD?=
 =?utf-8?B?ZlBjSUxLWEZ0OGxjTDZqamlDM1ZXV1NpUFFPMWNyM0lJRCtFNk5ueTc5TjBm?=
 =?utf-8?B?NXoyanRrcnUydEJiNDNSK3VHcTgrR1JHejJvck8yRkQwK0Z2Z2UvUDFJS2F6?=
 =?utf-8?B?NkVFOFMxRGpSWWdhQVIzOFVEZENORWRWYTZIUDZMK3JhVDdYOWNCY0hXa3Vy?=
 =?utf-8?B?S0FMandWd2xONjViYzkyb2o0MXk3K1F5eVJZMVdydXkwR1h3RVZmWFBQV25Z?=
 =?utf-8?B?M1Avb3pIeksyT3MxY2Z1MFMvenFSaVU1T0hSYWhWM21XazdWODhZWldzUHVW?=
 =?utf-8?B?eHZhZ1JXMUEwSEVJczFQQ1BlNmgzRHNQeW5RQkh0Y3hmNXZUNHBiakM4VUx1?=
 =?utf-8?B?NzlneXpETjdlVWtPYmY0M3VaU2N4N1hnUmhvQW1PVmx2eW44SHRMMXJ0RnFN?=
 =?utf-8?B?VG9RM3Y5UzZDamRUUVFDajJFVUdEeFVxdWtNSHJWRkdUOUlLWmU5dDJvWVFF?=
 =?utf-8?B?Sk5SM0ZETzJoaTZPYzNjNDFPNXN5TDhYc3hUS0NucjZKb1plem5ZOTZiNHBq?=
 =?utf-8?B?N091L3Qra2pUVW8zQlRXQy9JMUtIWHlQV3UrZUJmUkRrQzNmRE9qUTA1SWdR?=
 =?utf-8?B?TWxUQTlWMFZqQVhUak1jaUxSNGhqdVlrVEZkM3Vpd1JDNThWblJweUYzQkc0?=
 =?utf-8?B?elM3RmJJdCtrMjYva0F1NERPbU8wOWhNUnlNRkJpdXEwOHlpNzdKd0g4ZUVI?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 381ce5c0-5c09-4d81-a164-08dbaf1fecaf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 21:26:25.3818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRl4wupIXoq/KbLrzTfYuj0CckVo58WTfZ2aYn9ZvCX5ECWutmL9qSFnPthw6ZuaRvs4OBR1X9+cff2Ujakyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

Quoting Lucas De Marchi (2023-09-06 17:49:55-03:00)
>On Wed, Sep 06, 2023 at 05:00:49PM -0300, Gustavo Sousa wrote:
>>The function xe_display_driver_probe_defer() is supposed to return
>>-EPROBE_DEFER when not yet ready to continue the probing, but the
>>current implementation is actually returning 1 instead of the proper
>>value, which would probably keep the probe operation to be attempted
>>again. Fix that by returning the expected value in case we need to defer
>>the probe.
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_display.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_disp=
lay.c
>>index a453946ad108..bf475f9a7e14 100644
>>--- a/drivers/gpu/drm/xe/xe_display.c
>>+++ b/drivers/gpu/drm/xe/xe_display.c
>>@@ -45,7 +45,10 @@ int xe_display_driver_probe_defer(struct pci_dev *pdev=
)
>>         if (!enable_display)
>>                 return 0;
>>
>>-        return intel_display_driver_probe_defer(pdev);
>>+        if (intel_display_driver_probe_defer(pdev))
>>+                return -EPROBE_DEFER;
>
>but now we have the odd situation that xe_display_driver_probe_defer()
>returns an int (with < 0 as error code) and
>intel_display_driver_probe_defer() returns a bool. I'd rather convert
>xe_display_driver_probe_defer() to a bool and then force the -EPROBE_DEFER
>return code in the caller, like is done by i915_pci_probe().

Sounds good. Just sent a v2. Thanks!

--
Gustavo Sousa

>
>Lucas De Marchi
>
>>+
>>+        return 0;
>> }
>>
>> static void xe_display_last_close(struct drm_device *dev)
>>--=20
>>2.41.0
>>
