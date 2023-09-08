Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5BAEE14D8
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 17:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E810E919;
	Fri,  8 Sep 2023 17:11:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E510E919
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694193103; x=1725729103;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/A3NOLYqdmSj0mnpuzHe8VK3x3HMo8QlyY9fMzCfJxg=;
 b=IzQPxW6CLu5dGP2ptd3dqzdsfkk/EDUJxxQiIT/0GLori4tt2DCzdCx2
 H9XFmqiNel4QZBtfjzTJh4oU0wuXYi+ZTL2bAsxYa3FX7zC4KPorYNc/M
 dwCEZNPYOjVoOcXMrwH8c/uuUJFsUyoQDrCEiEDxlQdpwhJqM99/+UrHt
 G5oHTkylv2H+CSc3NCQPKoPEnU+ywoLPGz2VRJw8H+NQgijDmuO45tMvX
 t04kyLGSEZ3XPbHL3Z4ZKclW1wxHvksX+8KVsFUWolUwZfr3cv1tTel2p
 l142p49787s0vuRGfEMW4fJXGW8VzIm6pX25J3s5VNCYHfhsfAZIKh8gF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367960688"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="367960688"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 10:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073386559"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="1073386559"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 10:11:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 10:11:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 10:11:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 10:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uazi0pcMrIlDPN0ZwTl0swtoCJTBsitTmPTD9shsTazZr/sCCxsKSW+F9wvhO4bkhufh0SDPHfsKvw8UJrgEDAlUx0c1yjAm058+GWlLVnTy8vysUssKeYv47VpBoMNL3g+OTGZdbjEZ560jMBISpkoPN+2FwxN1m0dqKsYsDDOLG8AKnS4ID+Isb9bHGNRRtx6DCNH+jVMNeV+9FD9E26S7RWwXLjEHZvGyIV1t/AsQHL3DlFEpf4+76JT28uTu0nSO3XZJgESudxqKmPXCW3Q0sXG5uJKqgWdhDvZHEOp9DcNyZRoQtGZwOX+dDiOJEBSSmhZl9u19IsgQKE4F/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8OsGSxERYAsRRxjFaE9ZYLCVmKW0zy7037fURtj9F4=;
 b=Lni5lm9U9yu6VU6dFe4KmtJ+SjRcRo7VtBVBLWg9HbMzg0uRwhgeLbI7ouFcfFsx1AJLbBoMH23BPIQaRMze8q6cxEA8+olQmgzzSk6b6v3ULGms4784K7AjmS5oHeQ/fdGRds/d575hs6PjiNglzcNYvW+SEIXoD4Yv/Rmj+AD6SbidLHc5HK3n4Msrptjmjg9tAgYRSmtcsGWexRC2pHMqofcy1zS6seF0yCzKRHIBkmo341SMaTjYkY3uxlIXBXScyWAEBbkEgKLhktKU3MVryRTO1qfQB7phJBbwsnBZhfYhl/eZ2khouR99fkCyVMRG4G/nhTbWyt0MACY7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 17:11:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 17:11:40 +0000
Date: Fri, 8 Sep 2023 12:11:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ksv24ikn5dye3zi6ydiru57sl2vergo5t722opgfaogkamjels@z3wbp4cmfkya>
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
 <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
 <871qf9gejk.fsf@intel.com>
 <ru3jqocgwkfmhyfgdvttfwewmoducukeqhrl43shkutsyjrvru@hvyfaxmnnlqu>
 <87wmx0fw2i.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wmx0fw2i.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 11568c77-27e8-49ff-915c-08dbb08eaaf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZj9shV6OOvLKyIyqA6dSSi5kLE/yqsb3br+hVd5uZDpV9qq7T5OYkHt/92ZhEYDzO0Olsk8u8hixxnwokcqt1tvxNoN+Gw0dum/IaMO+uEpIPSVSM/duU0PJQr54DRDwFqOEsgsoLnBBrTSpgnx72MiIkvucExohyRXNZPmniZL2WNLE2LjpixNX2sp0naRm4tq/MY9lCTJOKeYUne4d1UkGEE/1cKI//GnI9UpK/eYB6HNPqvaqyHkNLsrei8yueCKQJ2vCDpUXEsji022aXJhzDob3mYf61d65V54XjXfGU9JBBkbZwm3XoGjRxXn1usikJqgRCcp1QYtrMh3M5krNPdDE7Mx7TvvV7m/BnZl492cyAOFftpT30UO+xkXg4saWIWVkGx7o6tVkJIAFf5xaxwjcUs0V3wtYW6Pl2RRvzhTZ8eRwWGo0hyzsQiEf418RneXy+9gCM/ZAelqstHbyq+bDE1sOuSFY3zpCvXHc4XL3WcH5nj3BZQiSmt1YziUMp8aWgxq25XMzxfTilxHEVTijSGgEDOuOPx1Ics=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(366004)(396003)(376002)(39860400002)(186009)(1800799009)(451199024)(82960400001)(6486002)(6506007)(9686003)(6512007)(478600001)(83380400001)(2906002)(26005)(66476007)(33716001)(66556008)(6916009)(66946007)(316002)(41300700001)(4326008)(5660300002)(8676002)(8936002)(86362001)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEKJoZLilgObAowjJR72rwKtlVw4bq5Rtqf4YPncfwojPeCdBTnLjEEN61GD?=
 =?us-ascii?Q?tZWuEXDSgrfimtYm3G8xGQJN+3+/wCYLYl7pWoPFt/J49m9lYE2vVan37ow9?=
 =?us-ascii?Q?AqIo1j4i7Job8xIvIblpvUX0PbV7TuXwPyHyL3lbVwbthnEOwF1QwDE3TSw/?=
 =?us-ascii?Q?Gd49pWayQHYz3jirtQxngxJfJqEQElxAGnW/6upkMxGNd/7/cXy8A4BGhn0Q?=
 =?us-ascii?Q?iDb4dByRDJccFB11nRZhwm8eAjEzVZba95aKDPsO1avit3t7KRbmCqcu4Nks?=
 =?us-ascii?Q?qbdL7tN51/JBcAFgK8Gz0VjDvAbVb24Cur0/8SCj9B0M9tnfHGYycw4fTxXt?=
 =?us-ascii?Q?H+S24+y8mQabqUFhZXHmWdVEdCmbW9zJbIw6O9lZ/BIAiGTJHn4SzxAfGK0a?=
 =?us-ascii?Q?oBXSg/CtbizPe/bupDIQLU5OP2XtLnMdhujF/wKFabHM1lIWJ8a1PmpYZTUm?=
 =?us-ascii?Q?8HE6xqjYceyuedWrmrPrj2EVzZPR0z8c2RGLM3L9BTMcj9c0EGfVG7muYfBk?=
 =?us-ascii?Q?PrTQBumIZwfQznG4pjs/qlICH5CdG6d9FY0TNTXgbUF5YLB9IF8ufzBEgP2h?=
 =?us-ascii?Q?0UFI7T/ZzQqxyZAZGS3c8MCOtcwllXBU/Tw2/C1kgKwfKHbIdDFK+33ujvO8?=
 =?us-ascii?Q?bx7BlIf0qY8j/e2aqLe1U4oDTdm+LgQSnlBLR6Cr8rg0gi9YBm2/LticM0iQ?=
 =?us-ascii?Q?8AiXX6vcA1XjfXtRpG0FBMbfmlabs7HWM7kd5kFrEhhdJn7MaVK/zObraIHI?=
 =?us-ascii?Q?MjqWF6wA3tGWAbc9vQ9O0Ptdq2EJF1c9qdBTelSuc7GcfF1WTDHjHvAQsm/n?=
 =?us-ascii?Q?OD4f7q+PqUcAgiOexb5Yl+FpSnIAjXL7qh7cHwy0uTZ27lxI4PktgJoQGIAl?=
 =?us-ascii?Q?43CdXn3J9kuZuKYRDqoldttW1mRJoGigF1GLuRFtQuIOW7I2K8EOBZhzUcfl?=
 =?us-ascii?Q?JdcrS18epcetE8nifs7WCSSw2xRHogay9ZQ3gZ+/Zrm1ryK9jkFy8IyhYBWg?=
 =?us-ascii?Q?e9yg6YysnS4R9+nCMabF2yLYkQmrbcII1dM6rpAIhxLepJWJcKiA5UzQO7gy?=
 =?us-ascii?Q?BWRTh1/0JGi1pM7d1hRX0BMtZ8xcrczjicwzmkYrPIEjkprg+ENMcgs9rzHs?=
 =?us-ascii?Q?dlBkwanMtyLpMZktbmExIGWk0nMRPuptI7PTFqkjxV7Fl8vysZag2x0R0rGy?=
 =?us-ascii?Q?auLJJpxdcq0R22LbkPN3BOR9FFbPeb4YTw4t7t6sfVFPv78EJSDYimn1NKXk?=
 =?us-ascii?Q?o9FQXApGrDgkXsAiTrMhlsnEyx4Q5ECHM2h3JIYYbebxDpISdKobz8TpsXWZ?=
 =?us-ascii?Q?dnJT8EHQbPUOs+2YPR/nWszovulTql+xakBtYBS21ovQqJoj//3Mxa4GGZwW?=
 =?us-ascii?Q?RzyNeCovGaLame0tnUy7w4ppIzeWdrgx6r+e+BVwJLInTgTSYtl2U/o8F6S9?=
 =?us-ascii?Q?AB1ebrNasomgBbS8nJovuwkk4I6JRYS3p110qcZXNLJWH1AwxxzVa1sz3y/C?=
 =?us-ascii?Q?cwbDhET8IcsqvIVgC9suZpqj6dEhuDIGzNtJVamH3mFVgpxsBQ4gtb5WBPKj?=
 =?us-ascii?Q?a+aBFt4efXnppO2ZuPvfzJjGQ/53vKDz6o+CVrilA8ayRgasBuxLIgSh8bZn?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11568c77-27e8-49ff-915c-08dbb08eaaf4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 17:11:40.4858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6ce1rCtQ5vqIwZN0wtHS9Mkv64KKEiEQ9bz565EuTZ8L8fRgCPGOX+GuBho5neXgLjS8YzTMc7vyVOVGBgUY0Z6IEUAldRKxJtpIDH3x7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

On Fri, Sep 08, 2023 at 07:50:45PM +0300, Jani Nikula wrote:
>On Fri, 08 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Sep 08, 2023 at 01:11:43PM +0300, Jani Nikula wrote:
>>>On Wed, 06 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> On Wed, Sep 06, 2023 at 11:04:57AM -0700, Matt Roper wrote:
>>>>>On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>>>>>> Print display ip version during module load
>>>>>>
>>>>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index 60f3474844e2..fc01544346d5 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>>>  		str_yes_no(xe->info.enable_display),
>>>>>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>>>>>
>>>>>> +	if (xe->info.enable_display)
>>>>>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>>>>>> +			xe->info.display_runtime.ip.ver,
>>>>>> +			xe->info.display_runtime.ip.rel);
>>>>>> +
>>>>>
>>>>>Rather than printing the display version here, it might be better to
>>>>>call intel_display_device_info_print() somewhere appropriate which will
>>>>
>>>> Somewhere appropriate would be xe_display.c, so it only gets printed if
>>>> there is display.... or if it's moved to a shared function in i915
>>>> itself that we already call.
>>>
>>>https://lore.kernel.org/r/87r0nbheil.fsf@intel.com
>>
>> not sure if you are confirming what I said or saying it was wrong...
>> A call to intel_display_device_info_print() in xe_display.c seems very
>> reasonable.
>
>Just trying to tie two threads of review into one in a rush. :)

ok :)
>
>Just calling intel_display_device_info_print() from somewhere, anywhere
>in xe is an improvement. But perhaps it could be called from i915
>display code after it's all been initialized. *shrug*

humn... but then on the i915 side it'd not be together with the other
"welcome prints". Anyway,  I think both approaches are doable.

Lucas De Marchi

>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
