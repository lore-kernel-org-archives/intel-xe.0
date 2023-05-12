Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF8C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474A10E22A;
	Fri, 12 May 2023 18:03:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612AF10E22A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914611; x=1715450611;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HXAFdctMdsphCspy5E2IFlkEGCCNISv39GTahRwU4Mo=;
 b=PCAcDHWk1g0N+BsDjDgO9PULDuP1jnhtKUYOdLRgBJ++XlLY6LbwPMi6
 vygrFrgkXyf8QkwhuEPSFzCCn/u8gAzw5hG2Bpajc4fD7aKX88Qpzp+5u
 AKgrLQ8NSTY2RId3T3R9j6WTNbHChFUsFyqElpKPqOgW/AeZobdAJ5OKN
 Opw78ZrZsFdW38utVMKdZZSXBhWXOrfDmMYHXWuOeNwa4MxQQeHQTSlMM
 JnNbzE3AI3BEQqA8uWuFb1wqUu3RMHuTBqNAqON8DaAeGGa5NO4NdcSsZ
 dzQgEwYqQOblTPkfKCoFCK+iG1A9g35IajyvtehpLV81qzR0ZwHTrCCa+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349694300"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349694300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733130530"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="733130530"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 12 May 2023 11:03:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxcTdJb80IRgKml6UEQOaS6CFGH76/39EpFYvHqlGIyV+8Oetzoz/Rmq1+dgJO7piZ7UsO2ILZMbAQFloKHfyRiZP9k9EdESkjhZcWI/bgGy5Bqe9gtbIXzGnYtx3RNb4TKvv1pXetRAHT6SLydIe+afj3BAIHAGmf2zJUivfPEkr+MIAQCb1kXiksmvhHpGXMTTVPQJgmomR9iSIDFjWJ4LL1uPVhy7RSrHDMJopZMCVYbKwSZbUizV0k8Bk9Wo5H7G2nuWbOg8iZ6PXVT41UnN5KyZTFDcnkU9Vw6TbdOrJZQldWbwJ1yPyB28P9j10rASC2wtdVzE2+QYMyCJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l/7DfoHDWJbJx5PVn34JcKg9iyX3lvCGoYYzMiPs20=;
 b=EamceHKvwKPZs2tgcuV0yAm5l/iFCzhyLgiOG9aTntlMxzy+B5dTgBW+7JCsyOlY4qmlt49i0KzWRitHBKL+9V7+p7VaVJgXFJGltaFdxfqyCj5rGRHeYRU5Txipu2f1Uq7qYFSuEhxVzQgUb0vSptEWyXVb94k0GX8wewoBr4RX8QgYkeXcTZW1P8qDbV1foS6A63fLJDVLRQoWQmDhx0cgnk3R311nFrIxE18MZ5smyRaG161wZehPt8a84BiPzlNVGx/WUkb2b5Ef2m+r+2M4GtN+pAHyE/T46XEPuPThczQjMRTS0RFf6eN4tSwxTjvIsyIaW/92Yi5Elh76tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:06 -0400
Message-ID: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5b7f74-fbad-49ba-7b75-08db53132c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgNit4jsaffhYDRWX3ATzwM5qPahI6vqLd4e0UU3OOcNObY9JIr5P2CTS2Bn689fBsCtHxrMGZqKByA89/uHkqJVbm26lA+VdZwzefbMoJGC2DO8m9RtjL8OM1+C0Klm34BFCO9h9IdS3J07sr/gf/Een9R6KvDk2knHz7Azeg9V+7Z8S0C8gESW5rLS701Kg38xtYHzYm4jTu1WdEWaQLFHYlaxtpdr/IKkGsOKsS17Gdn3WQgdtz0fT+PtV6gOD/9s7mjjPFSN4DgnW6ZqHaXcJ92FxwemBr+HQAfwWW1g5D8WNqtpYaFTHXwl38XClH8xeWheZqBdeHlxg7YKyr1ClAG/oCNx41pyEtktMTdEtUK1c0NuGYOrL+mVyjMN/vinxv/8crZVCQgB9li0bGj7DKePEiQlMi3zunoPvEpKCyak7F+zIQ+xKBMuOaTncl4lthFLHbNk7Uw4rP1WCN6fOdp5AjqcAWvWqMMb7t7LxwJsSz1IXhDsGJRMKFyZlr18cM+hlni9N/cX1k2cBxAFM1sLVK5x6UuxMjTG/uLklqip/3+iv+g1Wcfi3vho
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(4744005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZpZzVtU3MxTDEwR2VJM3lhVGZ2T3gxOG12aTRBbWlteGR0eTM2ZzRkaFdY?=
 =?utf-8?B?RTZoNVZuOGlqNTk3TmdlQlkzUERpcWErUHNKRHJoSnlKQUFpenhrZXM4R3Bs?=
 =?utf-8?B?MGcwUm1IR2VUV29IZHpmQzdGWkhHZ2RzVUtOcmh1Vng2NkMrVUNVaDRGeGVU?=
 =?utf-8?B?YzJ4WVlXSUpMVWJpckYwOEE3SFBJZGdhWU9Zbzh0OEphbmlPWURRaTZRaGJG?=
 =?utf-8?B?cXo2V1JCYlh4VXYrWEEzTFIxVng0QlA4OHc1Z3ZCYjVrMkpzS2x2ZUh0eURR?=
 =?utf-8?B?ZGF3ZUhldUk2SVc3ZXRyY25QODBNOE1nTnFyTFlVN0twK0RwOHoyQmxaWVRE?=
 =?utf-8?B?TndoQTlndEdlMkQrQ21MbEtjYVJ2eW1NdEJVKzZ6S2J1eElUSmFQNDU4ZTUz?=
 =?utf-8?B?MVRaSUVTSkZ0T2pGam5wTkZNaThacmZWcHVxUlZCRU1FdDNGQVM5OWhOZWk1?=
 =?utf-8?B?TzBBQmJxUzQvRGJNNTQyek9ROXhJVUowdzFaMFZnbi9OdGhXTytldlREYnRS?=
 =?utf-8?B?UkdOMkFYL3VEUEZtYmNIZDQ1TS80MzFKQ0xyemZtT0dJbmNLeFU0dTJ1UWNm?=
 =?utf-8?B?K0RKQ3RQa3ZxaktNQnQzNXU1WmVwU1FTMXdqRXkxbG5IR1NGU3hKUWdaSklV?=
 =?utf-8?B?czRZaUZMdm1kbURBbjQ0bUNhOXh4WHUzSmpxK3Zua1BQMkRyK216MHcyRDlu?=
 =?utf-8?B?dmNNMnRqZ2RnNXl2b2M5UEhJY1NBdHNlMFlmTjdzQ1l4TzV5dkN5WnB5UzVU?=
 =?utf-8?B?cVQ2cVNOWkZEOEttM3hPdnVTd0hEUlhuSVBCOURZbis4ZmFmUHNmYWxWNFBS?=
 =?utf-8?B?VXNPUkdXRHNIZmkvalRVd2x4aXg1SWhYb2QzR3ZKT3ZhYVJiRDFaczloelp0?=
 =?utf-8?B?WHNucXZRRklqVmxwWmJRcmgvbGJMV2M4L284YkYvVDJNdmNrUzRTV0NHc2pN?=
 =?utf-8?B?S2NuTkQvUzNEbWx0OG90a0s5OFBrUVNYNkZlalpSVEgrQUJNOVJ5b1lCTUVx?=
 =?utf-8?B?TVdjd2J4SW54cVVlenFqSksxWno3M0pGZGUwOXJkd0RGRHZPNm5kTk40RGI3?=
 =?utf-8?B?VUx0MTR2OG1JMWFvR3grL1RHWndVTnczdW9FaW5UY3FsaENFOFRIS2EzZUQz?=
 =?utf-8?B?VUxGamx0eFBzaUxNRm0yUEE2b3dQWUQwRjcvNnJCdmxzZlc0WndNTXNBbFlE?=
 =?utf-8?B?a0tsbndXd25uRDJ6TjArc3prektQMkRocVdEVWdyeXIxNC8wTWo4RzUveFlO?=
 =?utf-8?B?ME1jam9HLzZnS1BDMzJZQ3R6ZGZBSTBhV0lDblBHdmo0OCthblVwQXZuUm9G?=
 =?utf-8?B?Y2JBdGlMd09hemltcDVZM040OVhweFFGc0kzNHQ2Ny90RmNUeGNML0I2VmQ3?=
 =?utf-8?B?ZHFIWE5LN0ZmY29DRkg1ZHRLZEJBRTE0aFJrWng0aTJOV3hEK2JhOVdTSTh5?=
 =?utf-8?B?MHVvTGp1M1FZKzVzZzdFWUJra1dPQWdpUUtXVERZMGtveVVWZkdudlhvNFJZ?=
 =?utf-8?B?M2lhZHhUVUcyNlg3OFJmYXRIaS83MUtLSk5pWDF0WnVyVjllSHlBMjJJc2Jw?=
 =?utf-8?B?bHFuaWRROXp0VUFrNlRWUEFPcWh2MjBLY2hxTXpDWkNiOFhBN0U5ck9KREdZ?=
 =?utf-8?B?VFJqZ1ZpaHhNL3NEVTVudFAzNElrZmg1U3pkSjVKMHJINjVrWm5oeFBvZ0NY?=
 =?utf-8?B?akEweHdtRnVEbzhaVFBOckJXdEI3SmI4TlJ1ZlJxWlZqL0h0d2JhS09UOGZr?=
 =?utf-8?B?YnIzSDE5dmJmZ2NtbHU3ZVFhblMyblg3YTZlQytTSjczOHhXNU94OExyRzlM?=
 =?utf-8?B?K1NwZTNJNWJGNWhaT3JURnZEbnVRbWo4bGxGZzN0Y3BtTytVUi9BbGdqQlZK?=
 =?utf-8?B?NEExQ28yazRIc0RDbXQ2dTZQdE1Sclc3SkpKbmpEcXplK05IYTVGMStabEo2?=
 =?utf-8?B?STdsWGJQcmR0NkNTakVLdTdhU2Q3OGJrQ09aOC9QNDFmb1lRaVlmejlYWFhs?=
 =?utf-8?B?cUpocmJXeXY3T2c2Tk54RGlpTUNhYUxmQmpVSCtUbDRBWTd6ZC9Dd3BWZHBs?=
 =?utf-8?B?L3hmZkVvUFBRdHZUellqUmN6SjNTRkRNZ0tjYXptemFjaUpDVTZMN0RkdkZ5?=
 =?utf-8?Q?JhHvaWqKT79bIeMzL35nVxUAn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5b7f74-fbad-49ba-7b75-08db53132c10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:21.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf+x3IXNx4BtNeFqsM0BIgEwu7U0x0EilpurBONPf1iGYVIeHBvB+ykEIsVuKgakbIIj/hXxrC379U4zXqyq0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/7] Fix intermediate build issues.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series is totally non-functional.

git diff HEAD..origin/drm-xe-next
is empty!

It only fixes intermediate build issues and all these
patches should disaper on a clean-up rebase that we are
constantly doing for getting display code clean.

Maarten Lankhorst (1):
  drm/xe/display: Dont call intel_display_power_is_enabled from irq
    install/remove

Rodrigo Vivi (6):
  DUMMY Revert "drm/xe/display: Dont call intel_display_power_is_enabled
    from irq install/remove"
  DUMMY commit: only to get the fixup applied.
  fixup! drm/xe/fbc: set compressed_fb to NULL on error
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe: Cleanup page-related defines
  fixup! drm/i915: Remove gem and overlay frontbuffer tracking


-- 
2.39.2

