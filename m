Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4634CD5BD4
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 07:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263F810E57F;
	Thu, 21 Sep 2023 07:21:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C389910E57F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695280904; x=1726816904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SC4OGvFLh754n+jWAw70FdQkzReieDKQqhKyrbEfIYI=;
 b=W5khwpRUbPmHwqgmPmL44fG37LBxi26m7oQ+/Ed2hBHXL5GQ8WR+hocn
 FpwS5iADESKaxj79rf7wtMWjFTOQn2q+VCAwo1kTVlsUoHKyIJiuvIqRW
 ffTlCE7TAl7z8jmpaigyixY7K0MrACVH9woTln+HSCtRGh12imXV4eypK
 8CcBnSLSursDKqYxBTs0+L5QrbXJ5u5WzEjeJ4bIVqBFsYnvXF4t8VnY+
 Nq/1eKfPjx4SE9Q70jbSPxXcK6GPgAroBDEFr7YjMIbvc9sT/0HUnuMYh
 ZscIgwDwz/P63kmzD0emWX3BR1yHjJC+GX9EzFxIc1rTqfHf7GAUxgi6K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380351899"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="380351899"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 00:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750263853"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="750263853"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 00:21:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 00:21:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 00:21:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 00:21:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 00:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKJzRkS52deJJlSGMcsPVfiMO5Jiq6ldTfVIOtQApYRjEfE9LYMJ3KaEX5MMPrLh1yfIRcUEiLOCWiF06tLq4vw7SLk+B55HOCrAgcCeQs0TNEAHdQ+aG9nMqU6VVNwAv6ivdSHfhuk1Pi0LChoIdOmQW+jFd6s+ir/vFCBJzID5lOmQ0VaBASWNsVRDCQNtrq+BmrodrVFwygFt/ISrrKlqXhUqsoAX+0GI5pYRCoD4L4S6tSc22/q5NnNwQ05uyplGDaSZ51xEk7Quzey7vIrSqd0eMxMUktyPzUQdVuDPbRmDjSL3lIhVltDAVVlH2G7T0LDJBaYi/C8o8piD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JabwVMphglIK5iYF4cvvPg9jA66Ml1FopCO1ZzkR60k=;
 b=gNEEuCoONhLM2Nq/ioimVq0mi2vFVgiPJS2bgDWbbKAJepzFq3vR64QZ8tWnlGvYGmURBZl11ayOzF/vWCKoDGtdwBAK7rY8KbZScyVwskS6bR1m2taLMU0+8VF3jCLXAqPcJ4d0Rj3OtAgVzd1O65pPGQzuSLwrfQoE6AMbMRyjhPB6rT8lqPtXOxQVR1D48aotUdz8nM1CH8RuarnSMSUCLMRmZldBXLOPPLToKNioQCbXB5smHPV0P0ghigXC4aentTZHdbUBHdQPQi3aqfEK/uVBIIodyz6BpidbybzYuBcyyZZ+0MHFsQ2BYRwHu7xC67FcWy6T58vRlPT0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB6741.namprd11.prod.outlook.com (2603:10b6:a03:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30; Thu, 21 Sep
 2023 07:21:41 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6745.035; Thu, 21 Sep 2023
 07:21:41 +0000
Date: Thu, 21 Sep 2023 12:51:28 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Message-ID: <ZQvu+NrJ9J2OkZ8t@bvivekan-mobl>
References: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
 <87cyypezsx.fsf@intel.com>
 <eb6q46xjir2vo745evqhy4jzj2jxpkvyipqetrygurhmg3zqcz@k7yott3gcmlj>
 <ZQFq3Xxr/Uu4m312@bvivekan-mobl> <87y1h8vn41.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87y1h8vn41.fsf@intel.com>
X-ClientProxiedBy: PN3PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 0006e847-b0bd-4d3e-5aa6-08dbba736650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYtcpU5W+6xvNRbw9HW6QHbfA+cgl0q1WphDldhMT/FkvcwGVf2B4vwXSwfmLVELgbtXWpQvjcTwrIkkvnduCI+4dXMkOwImd9ypdeA6H+3m5Jq9l1+lPLm4bDNtYL1tC9MJH/jn4G8m/I5PC9a4AklOIldSpCU9J7U3h7sWRrNMWNe1ZqDzwkrQg+qM5xhIsUNhShJp5eVMu8CYUjQ6TC2t/D1c7p5zYDBnsujLmitmJdJnWOv7HS/A1In1zl1V3Taus2BWRlaDPnDydgOJ/w76f53mECUxqB/uQvNUxayUoHwHnt3gi/iezK/a+5r6hgq50i+SSVWY6Qiw29ViR6qdmJTT1wl+VekOQc/jn4OVpwzvmWUTZDQZG3Z4htc7YXQ4kNFH4kJsx3GMT/RRpR+bYSNHnyTcY3mZPXk3+Dxt2qq7NJro/JQqIbz2Rwz8Jo2OM4xiH7Io/Z/HkTMiAOdA+WzoKfULx+FL9r3vmDBv3j++bQAojw06RFcvq2aEBC1ijDvj0odF4Hr7cH+8PJ/tjh+D3VFTxmps8WHyCHP1nQnA2E0c/gLaZjjiIImjLd5HJYpT9gE0Y1NjcSnRTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(53546011)(966005)(6512007)(478600001)(83380400001)(2906002)(26005)(66946007)(6636002)(44832011)(33716001)(66556008)(316002)(66476007)(54906003)(4326008)(110136005)(8676002)(41300700001)(5660300002)(8936002)(38100700002)(86362001)(9686003)(82960400001)(66899024)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThScnNDUVltM3BBQ0pnNVVPUHBVaEVtSHdmeStLbUlyOTZjbjdKV1RGckFq?=
 =?utf-8?B?V3VzVW1Cc2UzZGdWZ3QydkhvaWtqUmpJU2xWMHpLZ3JlY3dqVFNrdFk2MHJQ?=
 =?utf-8?B?aVJCSFFPdkJCMFpmM0Z3bm1zdHJBUVVQb05Qa0cxZlpHbStKQm1aVDR6eWlD?=
 =?utf-8?B?U2p0bGNDcXczNWVqQ0xxUlpJNTYzVjVkUEkxT0J5MWE1UEV3OU15T0RYZEpx?=
 =?utf-8?B?aVNCR0VZQ3NJNFlENUtoY1cxQUUyRVdJaDE3N0lVdkp0NnpHNkcwN3k5V3d1?=
 =?utf-8?B?ZXFBdEVNMGxnRG5XQjBKaHJPTTJzQkRKcVloZ3QydGtmeS9CQW5QVkZEdzk0?=
 =?utf-8?B?eTVBbjIxTzI4alBPUUVsWkZpeDVuVFpjUm5oRDl5ZlBXakpoUWZGRU8zVmpF?=
 =?utf-8?B?NEh1NmZvdlM4cFpRSWJveU5MeHZQeTQvRnVLSVlMdjdvaFJTd1NjNnRqalF2?=
 =?utf-8?B?cnJRb1M3VHpOV2djcEVleERwRmJSZWs3TzljRzYrbzVvWHJtRnFERjY2RWdu?=
 =?utf-8?B?RUx6N2poZ0l3WEVvQXZ4NDNnM3B4c0hCS20rS2NqaFNBMXVNT1V0YjBsemw5?=
 =?utf-8?B?d0xCQXhIOGtqa3N0RE9HbVZ0SUkvVTc5RVZGUVlTclVDRmhOOVhaTC9NRzA0?=
 =?utf-8?B?T1J5U0E5WEhubjJuSWtycFplRm50dEhrZUJGcVhHNXdVdG9ISWlIZW5QR2px?=
 =?utf-8?B?ZDk4N0hILytPaHhlcXpHWGxzeTlWeVVUclJ5NVZ2NHkvTnFqczQwUkd3MWs2?=
 =?utf-8?B?bWJZdlJDai9nV3ZpZTQzTCtYUzdFcEFIWWRqczdrSjVKcmJqTWM4T25VdExr?=
 =?utf-8?B?RHJPbDlBcEs5dDRNOEVFTC9UUTlBbGxkdlVKdm5qT2VkYVd3UXVmaUoxZk8y?=
 =?utf-8?B?RUVJWWFORUFPM1pPUHlMYzg1ZExydDZkS1VZK2g3dDFoeWlwQUZwTmxVM2tu?=
 =?utf-8?B?RWd1N2RlMHVkd2ZpMGFmSTBCVHVqekFPc3BHeTBxR2FvdkphMnhhejBSdi93?=
 =?utf-8?B?ZE1NTFNtK0U5NjBaYWhyckdLQTJPcVF1dkxleXduYk5CTk5Gb2dnNnEwRVVh?=
 =?utf-8?B?RWdVMU9qbzN3c0c0ZktaanVlZDAzZTNKdDZ0Y3VmYTRsS3ZLRXd1NkNxckp1?=
 =?utf-8?B?a0ZNZmdrMGEreXkvZDRzK3NiNlliNHE1Kzk5ckp4N05KR1lPVUZsQnZoZms1?=
 =?utf-8?B?bmo1bFFyQlZMYk1QODQxM0p2bTlwanRFWFI2S0JQUVVWTFVmVlBrNm1Ibk5N?=
 =?utf-8?B?b1VFdy9vUkMwNTNvYTJvdlNOZlVhOHFDTDRSNmxJNnhPNkRmUm9iQWZ5bHI5?=
 =?utf-8?B?MTJnM3YwMGc0eER2VVhjR0ZGa1dDMnhGYkRsdU00S21zUXNCd1VncG9mN1FE?=
 =?utf-8?B?U0JlYzJkVFRnOU5ZSmFYZE1PQktWR3Jybmhtd1AvQnVrZEVpSldOb0ZRUW1T?=
 =?utf-8?B?TmdPK1ZURmJBbGQ1bkdzR2haZ1V2YXR3V01oam9RR3E1cnBtY212VjZNUkto?=
 =?utf-8?B?SFFBbFlvVVBqYnZpWVA3bWdhK3NwOGM5RlozUG1yeXJKRHBublhEM2FRcFJU?=
 =?utf-8?B?cW9xcUEvU08yVGZ0QSs3UkJvRy9nWHJId045ZmJaZnhONXcvcWFnRlN0ZjJM?=
 =?utf-8?B?UkNiT1ZYOHF0cHFLYjlPZWVIaHlLRmk1MEVxa0JzWmxkYUdWN2xqREdLSHZD?=
 =?utf-8?B?MFlDZGQ3cFhGeXNmMkM1YkdqcUNSR00xaVh6bEQ5YjhBdHVibG45WTRwK1lP?=
 =?utf-8?B?TFV4RVNhMTZTZHFqcTFvQ0dWc2RlYkM4NUNOdC9wUFV0SHl6ZHY0eHAwblEx?=
 =?utf-8?B?Qm5kVVRqWG9TbjNSMUtDdm85eDlYU1haaEVqR2JBVi93UHB4M2pSVGYydUhx?=
 =?utf-8?B?SG9RNnJHZlFsQ1hYbTl4U0xRVlJmd3ZaL0pnL1BaZ0hqZG9vZ0VQRnRXS25P?=
 =?utf-8?B?MlJWOE81aFlsS25lR3F0U1RCb1Y2UHIreE9XdS80V3FWTDJyUmdINUp4eTh3?=
 =?utf-8?B?R0phaDQ0TEV6d1owZndWcmpVM3RuNjdaR0FsZnFTWWRrMEhSdHA0MjYwWmg2?=
 =?utf-8?B?bm9RR1JBTzNBN045SWVKVnZTaFJjSGpFWXIyMU9PaEZoL3ROQU1qZkowckdV?=
 =?utf-8?B?Z0ROUjR3SXhSdXF5MStEanJBTXlQalBrV29UdkNSZjM0b1BUSlVFY3hMQU1D?=
 =?utf-8?Q?v3HZOyfafWady+BIuRijHPM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0006e847-b0bd-4d3e-5aa6-08dbba736650
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 07:21:40.7387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtTisIAmvwTdUoa/4dqHWutFHuYInobzTrdlcDOUK6QISmi5oga85wIOoqAyEb4dD2O/7yS6Hn8a6wUjMe5yQepEW80sXH6cZshh9QBT02Ix0TY1G5c6fBG1fybnNbQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6741
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 14.09.2023 17:35, Jani Nikula wrote:
> On Wed, 13 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> > On 11.09.2023 09:01, Lucas De Marchi wrote:
> >> On Mon, Sep 11, 2023 at 02:04:30PM +0300, Jani Nikula wrote:
> >> > On Mon, 11 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> >> > > Print display ip version and flags during module load
> >> > > 
> >> > > v3:
> >> > > Use the existing intel_display_device_info_print() function to print the
> >> > > display information. (Jani)
> >> > 
> >> > So this is an improvement in the sense that xe core doesn't poke at
> >> > display data directly to print the info.
> >> > 
> >> > However, I still think the interface between xe (or i915) core and
> >> > display should be minimal. I don't see why we'd need to add a function
> >> > at the top level probe to print display stuff... the display code should
> >> > do it internally, in some other high level probe call, when it's done.
> >> > 
> >> > Even having the function adds complexity, because the call site now
> >> > needs to be aware about display probe order, and ensure it's all done
> >> > before you can safely and accurately print display info. And that's
> >> > display code implementation details.
> >> > 
> >> > Superficially this is all benign, but this stuff adds up. We've been
> >> > trying to untangle i915 core and display for a long time, and the i915
> >> > probe is still a huge mess, with a bunch of random calls to display at
> >> > random times, and there seems to be no end to this. It's all so
> >> > intertwined.
> >> > 
> >> > Perhaps in the future all of the calls need to go through a framework,
> >> > maybe aux bus. Do we really want to put all of this to that interface?
> >> > 
> >> > So the direction should be to reduce and minimize the interfaces between
> >> > the high level components, not add more.
> >> 
> >> Agreed. I think what is missing here is: what would be a good point
> >> inside display to call this on. Is it ok in the end of
> >> intel_display_driver_probe()? Are we ok with display info now showing
> >> up before than the rest for i915 or should we also move
> >> i915_welcome_messages() to be before intel_display_driver_probe()?
> 
> I think just move the intel_display_device_info_print() call at the end
> of intel_display_driver_register(). That's the last thing called in
> display inits.

Created the following new patch for i915 moving
intel_display_device_info_print() inside
intel_display_driver_register().

https://patchwork.freedesktop.org/series/124032/

Regards,
Bala

> 
> Except, whoa, nobody seems to be calling intel_display_driver_register()
> in xe. That needs to be fixed!
> 
> We can tweak the order later, I think.
> 
> 
> BR,
> Jani.
> 
> 
> 
> >> 
> >> Lucas De Marchi
> >
> > Hi Jani,
> >    can you please provide your opinion to the Lucas' query? I would send
> > a new revision based on the conclusion. Thanks.
> >
> > Regards,
> > Bala
> >> 
> >> > 
> >> > 
> >> > BR,
> >> > Jani.
> >> > 
> >> > 
> >> > > 
> >> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> >> > > ---
> >> > >  drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
> >> > >  drivers/gpu/drm/xe/xe_display.h | 4 ++++
> >> > >  drivers/gpu/drm/xe/xe_pci.c     | 2 ++
> >> > >  3 files changed, 15 insertions(+)
> >> > > 
> >> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> >> > > index a453946ad108..45ffc418e636 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_display.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> >> > > @@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
> >> > >  	intel_power_domains_enable(xe);
> >> > >  }
> >> > > 
> >> > > +void xe_display_info_print(struct xe_device *xe)
> >> > > +{
> >> > > +	struct drm_printer p = drm_info_printer(xe->drm.dev);
> >> > > +
> >> > > +	if (xe->info.enable_display)
> >> > > +		intel_display_device_info_print(xe->info.display,
> >> > > +						&xe->info.display_runtime, &p);
> >> > > +}
> >> > > +
> >> > >  /* Display info initialization */
> >> > >  __diag_push();
> >> > >  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >> > > diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> >> > > index 9e29de012df7..b18bf5583229 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_display.h
> >> > > +++ b/drivers/gpu/drm/xe/xe_display.h
> >> > > @@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
> >> > > 
> >> > >  void xe_display_info_init(struct xe_device *xe);
> >> > > 
> >> > > +void xe_display_info_print(struct xe_device *xe);
> >> > > +
> >> > >  int xe_display_init_nommio(struct xe_device *xe);
> >> > >  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
> >> > > 
> >> > > @@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
> >> > > 
> >> > >  static inline void xe_display_info_init(struct xe_device *xe) { }
> >> > > 
> >> > > +static inline void xe_display_info_print(struct xe_device *xe) { }
> >> > > +
> >> > >  static inline int
> >> > >  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
> >> > > 
> >> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >> > > index 24b16863bf3d..a4886ea8794f 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> > > @@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >> > >  		xe_step_name(xe->info.step.display),
> >> > >  		xe_step_name(xe->info.step.basedie));
> >> > > 
> >> > > +	xe_display_info_print(xe);
> >> > > +
> >> > >  	err = xe_device_probe(xe);
> >> > >  	if (err)
> >> > >  		goto err_pci_disable;
> >> > 
> >> > -- 
> >> > Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel
