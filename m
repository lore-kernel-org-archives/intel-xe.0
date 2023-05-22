Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239ACC7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 22:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6D610E39D;
	Mon, 22 May 2023 22:15:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0330410E3A1
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684793736; x=1716329736;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=oL7Mdwr6h7bcclJtZ0yri01UxQzyNjw0fGsJmAJSsCo=;
 b=ine7ww7iu3vWH7ZF6o1YwpBoXsfabil5/vsTmuZjP9RqFYP9cDvzmVYg
 dbG+4l0LjCTFTTAzgAlSlxiGcFPNsDc5MorC05cboelRCiQUA90JGwBdd
 yG8vDOLHZsYp+wym3Nf5kSzNEpp6irxS7+aShvapNcDtMCTcGd8zT1zsb
 38Vt4z+qkCHKhrArl1HZdV4YJfnv6bSfRRroqMsanqdsa0HQ6YMl2ff97
 dtbKW/M3RdJJw9Prk5Q0MZZRJAMpP21JTpLLlnw6nX3ME6/u+srHHeoi7
 PBlbaEVUOkOgsRjOg1m8KWOiRr1/6a/N2B+L0BiaLudyXUoQokKbqOvC9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418764941"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="418764941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 15:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="734466708"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="734466708"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2023 15:15:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 15:15:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 15:15:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 15:15:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 15:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcEfpyXF9eFymQoEaYsdMrtX9cBYctfkLPSJEt1d55mXtGUOCiHI4/3Bzd1SwOkwzAcGZF+oNI5LT24tr6iZy+amiIK/myuQlEARd86r0z2jgMC5MJjAS3CYuW6iJzOuUu969mf2SrrjKMT5JxvZiC3Xm3xCVTqhdBLt9uRjJBTSV02Ozv5afD25p5MmOlG208cQ6X8UPu+3Y70X6C+ROwv6OMgizFeLPmRJ2rhBvuLPJmm8CeEaPzNG/gH/23dynM+JIM7XY21mloev+1ZmhK0F9/jP/mALBF6kHy4mkms9Kw0vsNgz+4IUKwr4qSJxSRfoiTVyGM3WvnjKkB03Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeQROVKsJzPd1jbA79T432cHJyNn+6yPKjNXTabJXVQ=;
 b=YM2Mo30zNmu6GuqHtsynL03kA+ZrFndwSGHE0ysm9Of2eNRskD/NYCk6l66eZDk43q6VK7DVAgdG/bCyQjGm+ZhLbZZSZM9xXqaLf8SKPXx8uuwwOMzGKFlyXijW6kCGbjqjIzvmBL01+mCJKcMkn+OyY36JshqwuL8ype/ASxi61iyIFtcRysz4YWQNK0hYLwuQwU+cJnliSfumGZyokxWbmeJymREgo/TW3wWqplxLwqhLhhz1nG5zEOJ3N1s6/Qrb8VtTC5LXablDMV4MP8Z7Ay7W0fujv/WmYutChUdPGJic2EakvJ/xNbm+OU3zDbwTJpM/JekDs2KAB7zubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 22:15:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 22:15:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 22 May 2023 18:15:27 -0400
Message-ID: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: d31ce628-06bd-4c11-ca12-08db5b120e92
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPIcqaioLEGmlOE+FFXmcNZJnUxK29B7qy2XA+yeXy7vWZJak4mRsIZuRLqyGFNng5zVJmcgC7geEA0FTD+lZ2AZMjwgfw6TeTzt4ZlogpnH90FN5mGZoOi7jfqnQoh6k4E2+VTSo53r6MbIRHQ+wp3N5h1bOk5KMFD6E/HwzKd2VL7k+gclXpmkc6WVfE2B5zuqX+EjyWPPcwCpC39xJpujx41AJl8m7vgXnVpQpwZzbmmjWBUbFUbtovpuxXvkZL+cNqQGyodhIlEFG3X2IdZNz1XSWVdkC5RXcJVV1hlueZEQKADYET62IHVLcurflTiIpXk912O58oRJ4HKuvCyL4H5Acv8Lsw2M47aXG2AHuaE5JbVxFTXCoBISKw6RyqhRkamutJU9pnoLOdkc29Y1QrwKY72P/vNbQ8JBB8HQqj1l5jX38hT5tYtEtAdjrtzddm+KZC2xJH/vcw/mRx0M9MCdB+VqJvLsarPNqtWx+xQSo5DP9esrH6dJvRKtF9kRfsh2THxCLWA83b6zSTNjuJPuCQxLWrstGltT5DTQ36d0V/rDnamSBZEqDrIPdQT4uagxJgPzdn3+uEWHZ0TWPl6ADxqMHZZVy6VTfjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(8936002)(8676002)(66574015)(5660300002)(44832011)(186003)(83380400001)(6512007)(6506007)(26005)(2616005)(1076003)(86362001)(38100700002)(82960400001)(41300700001)(6486002)(6666004)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(36756003)(478600001)(54906003)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FOUWVKS1Z4b08yNGFHaWZicElLNVFCTjVsYVZ1VjBIVWJ2K00veHBGS2pX?=
 =?utf-8?B?TnJ0ZW5Qc2VIVVVXZ25lc1djdFdHcm5ucis2QXkwbDZSamVZVEJpQk00QnJa?=
 =?utf-8?B?RU5tQ1JFbDVGQ0x6cmh5TmlBSU83V2xhRnc5OXZlYUJhVHNTc01MRi9XdlJC?=
 =?utf-8?B?WjdFOWRKNEdtNVYwUkprQTBhcnk5L0Z1ODI5N3pReHlkUm5mNk0rVmZsTzVW?=
 =?utf-8?B?WUQ0djlwcXlDcWRKb1E5RitVVENGcGU0OGhvL0pDTmxFM29CQXpJbHErc0hG?=
 =?utf-8?B?V2lkMVlHUE8ycDRzWHhNbGdJVUhOcVFqT0hLQW1VSS91TlhVb2dzcHBvMmxL?=
 =?utf-8?B?MjRXdnJzd3dmcDUrZzd2NWF0VDFPRDFBb1NGclgvdWZYaFhoQXJtSmNxV0t4?=
 =?utf-8?B?NU91SGxqWlNORmgwb0FrdzIzYnlQZXdOMDEvbGhUOTNCenpIZXdpQmp6TlJa?=
 =?utf-8?B?RjBaNTVkbldkODR5TlYrTFcrSnRwb0RUVEUvS1MrdVJORTBWMEM3VmFiaWtZ?=
 =?utf-8?B?bU1NQzdoSkRkaHZtazdzd2p3WVBYOVR5L21oSVovdDhSZWQ2Qit3dW4yTjVE?=
 =?utf-8?B?MFBacG1ZUFpQQVZIdGNSZWdtdHVKc242K0JtcHVMUVFxaDU2cU1SN0hoYWRP?=
 =?utf-8?B?dWh5N2NjUXgzZHRVTk9Jckp1RmZSY0ZYTDdWSW53Q2ZYUnpRZnkrNUY3bnU2?=
 =?utf-8?B?MjdaSldFNERjU3M5WVl2NnNqYVNFYjhGd1pwY2g2T3RLMTZvRll2VldPNktk?=
 =?utf-8?B?cFQySUVPdUwrY1EwNEI4MFZuOHRkNWhSK2NEeWxlVjAxZjlnQUFjdVcrVXhN?=
 =?utf-8?B?bTYwdEx5VzNTV0YzVm0vamRCRmE0azFrRit0TjVnSVhGOERHcjRtTjl3a1JS?=
 =?utf-8?B?dU02Q0lFSTNLQUdzc1dzcjc3RmRxdFhsWUFmNTRFV2pNVnJyT1JHYnZFT2VE?=
 =?utf-8?B?dGs4M0RObENYWENaRjhhWlBHaTFvNjVmZHZZSmdDdE5idDhOYWloeWVKaS8x?=
 =?utf-8?B?RWxqdE5hWkNINWtCN3NuYnRtb0J6WWx5RU5rdmFIckhDN2FZbjl1YitucUpy?=
 =?utf-8?B?akY1UjdlMnR5TzNBYzN3SldESnYwZ1FtTy9EcnFWN2ZCVlVRUXBSS2c0WWdw?=
 =?utf-8?B?Um9laFFoY2dwVFJaZTk1VzBJYUZYRVNVcWw2VmE1RGVDNEd1MkVWT3Q0STBV?=
 =?utf-8?B?cW9DMkUvblhNbmkwVlh3MGxtSWppaENjTDQrcDR3V01TeWVkdDFDUjBBemov?=
 =?utf-8?B?dGpENmJtNVRGcVlGb2JDOVFVVmd1Z1JGTkZ2em0xRXh0Sk5NMmRTaGdTMEVK?=
 =?utf-8?B?UXloSFZ5eW1LbFdUUGtwZFVQOXFGeUh4aXUzTWN3S1Fuemx5cDdiOTcya29l?=
 =?utf-8?B?WVdvcktOaXIxUmpmcjVaNFZwM2NiR21yTFdjWTRpNURPeTA0cHFlWU9BdFpQ?=
 =?utf-8?B?a0EwclFDQlVnUk1KQUFjb3NRRFNZaDNURGxoZjduVXRWa1Q3WmtOVjl1OGRz?=
 =?utf-8?B?MlE5YXBuZGNZSHJFdXQ4UGltT0RhQ0dMTGtlRUEzVXVBTXJuRzRDVkpiYlRn?=
 =?utf-8?B?T0IwK3dyTHpIbFRaWVpKcHc3ZXNPYVd4TnJDL05pR2ZoNkNXdXpqdUhMQ1ZS?=
 =?utf-8?B?dUJpaWwwUjh0U3Q5UnhUWWN3YTljMUc2L2Eyc3ZSV09PMGt3L2xaVzVqdTlh?=
 =?utf-8?B?UzNYS2ZURFdZVU9VV3ZDc2EwSGtUdm12RUFpU0tOSlEvYzIwT243ZkJqRGVq?=
 =?utf-8?B?RUNVcTA1ZERFbHlWMkRZT1VtUGtESElGd0RSRTBYRTVkYzN0c0JnYzlaeUt5?=
 =?utf-8?B?VUtJRm03M1VOcGpFdWJNZHBOT2FxaHZNaDgwa2xPcStIa1VUeGpsRU5XWVJm?=
 =?utf-8?B?RlErTklMelZHb28xZ0FoRlJWVW9CS2w4U21oQm9pdHNwYUtubVdqb2Q5VmQv?=
 =?utf-8?B?dFdTRnk1MXBrK0VzVnhLTGpBK3haWUlQeW1IWUxwRlVHcjVzS2c2RUEwR3lD?=
 =?utf-8?B?L2JwckZYSHpCcG5vYWFwZzNKTFVSaVFLRU12STdyeW1VTURFWWdENmV4Rll5?=
 =?utf-8?B?R0p3b1NIZko5U1g1cmNWUkRxSFEzQ1FLL2pGU1lKK1pPM2Z6ZzBOREM3NjM4?=
 =?utf-8?Q?w1Cx+Bl3ZajRZqnOQAvD7o6b8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d31ce628-06bd-4c11-ca12-08db5b120e92
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 22:15:31.7947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPzkQ9EgWkYBzloFz6a+ExnWmtbcez13ub9I2d7/3291pot8fvU6mtScFn2gNb1G1ZZbK12eo7hb/zjRq9jVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake domain
 on xe_mmio.
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It is the maximum protection we can do with the current infrastructure.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---


RFC
===

Okay, so, this is more an RFC to brainstorm the future of the force_wake in
Xe than anything else.

On i915 the force_wake is built-in the mmio functions at uncore component.

With that approach we had few historical issues iirc:

1. Display performance with vblank evasion that requested uncore to provide
the 'fw' variantes that are actually the ones that avoid fw (contrary to what
the name suggests).

2. Missed ranges updates. Sometimes we messed up with the ranges, there were
other times that the spec was updated and we didn't get the notification, and
there were cases that the BSpec had bugs.

For these reasons in Xe we have decided to let to the caller the
responsibility to set the force_wake bits for their domains before doing
the MMIO.

However I'm seeing many questions and doubts popping up:

1. Are we confident that we are not missing any wake-up?
2. Are we confident that the domains are set correctly?
3. Are we not wasting power if we are waking up ALL the domains instead
   of some specific one?
4. What about the display disconnection now because i915 and xe have different
   mmio approaches but reusing i915-display?

It looks to me that the cons of the current approach are superseding the
cons of the i915 approach. But I want to hear more thoughts here before
we decide which route to take.

Maybe we have that domain as part of the mmio calls themselves? Maybe
a double approach where the caller is responsible but mmio has the range
information and double check it?

Any other idea? Thoughts?

Thanks,
Rodrigo.

 drivers/gpu/drm/xe/xe_mmio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1407f1189b0d..6302ca85e3f4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -18,8 +18,26 @@ struct xe_device;
 
 int xe_mmio_init(struct xe_device *xe);
 
+static inline void xe_mmio_assert_forcewake(struct xe_gt *gt,
+					    struct xe_reg reg)
+{
+	struct xe_force_wake *fw = &gt->mmio.fw;
+
+	/* No need for forcewake in this range */
+	if (reg.addr >= 0x40000 && reg.addr < 0x116000)
+		return;
+
+	/*
+	 * XXX: Weak. It checks for some domain, but impossible to determine
+	 * if the right one is selected, or if it was set by the same caller
+	 */
+	WARN_ON(!fw->awake_domains);
+}
+
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
+	xe_mmio_assert_forcewake(gt, reg);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -29,6 +47,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 static inline void xe_mmio_write32(struct xe_gt *gt,
 				   struct xe_reg reg, u32 val)
 {
+	xe_mmio_assert_forcewake(gt, reg);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -37,6 +57,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
 
 static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
+	xe_mmio_assert_forcewake(gt, reg);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -58,6 +80,8 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
 static inline void xe_mmio_write64(struct xe_gt *gt,
 				   struct xe_reg reg, u64 val)
 {
+	xe_mmio_assert_forcewake(gt, reg);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -66,6 +90,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
 
 static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
 {
+	xe_mmio_assert_forcewake(gt, reg);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-- 
2.39.2

