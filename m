Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF19EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 04:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02810E13D;
	Wed,  5 Jul 2023 04:53:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494FB10E13D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 04:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688532779; x=1720068779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZxUs27heuXK7x/TSxZbPg9b/P5q1DxpPtyAg57j1DZ4=;
 b=JWptgrVDTwW5Kjo0AP+jDJefBR5J2seg41+VrMo+Ece3QLHRhlmHo8EU
 x0Q/VK3Bnz7+Y7jf+h4Ko6pA7oiaCr3A/XjsD4bmoLU2MWmOgHS2WphCl
 z4KuwDyPygl3HXefsaY9sMwj6tXpuskCqJj0Vv41NaR3+HGyBRSr3Adv/
 5TO2f4gurQ2y2pfszGwQc/lEzhUtAQp1Ww3C3B6aNrCrTkbL/jxR8DNfd
 pdKOUtqruYn78rO0ooTTWya6maHKGffWLRZ28Vl6QT8sFmnWOdML8Pv8W
 ObGwe6FDt3cm+e3poBZ3rmPFYCzW3qwoAFgr/xjv4FizLUEKM7QVIV1Di A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348039075"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="348039075"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 21:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843155769"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="843155769"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 21:52:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 21:52:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 21:52:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 21:52:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 21:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0wQp1dSVq7LRqhpAGjSeeoixF1EKnj9Hnjan78WmUa/yZZ/nHoFcEFxh93l/RkxQ162XfDn9UzbjekIYExwDt9N7Epo0ITQfm0X3PWf5+vA+FOri2/O0U8xeIAwexbMjDZsfoJsMQaDp4WUIHIQY80HmDzW5x6fcDbjbVhK+GSUyCEZGy5JZ23Z4xAVFFRhEIOMMfeHVzYNTAKMmAquaKzdqJvK+gagHg3FVf4kgiqJ9P3wDI4YiOZ6ffayOW+hLHuAw1X+W7hFs7WCD4A11eMAqGnfsap5/c8aWSf6LcH5geQAmW4MGHihHFaumFijFI3rdy48mvlCig1fkacqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9fMFc8JWV7KmnaGDEXbpbf6Dh3Lq/Z8i7ZZnjgihHQ=;
 b=iJAsAJsHjKcJqBqrjG3+NxuD3KY/7XzwDivVh+ye331zFjaLJMo9iYV/axHGpXKPX7QwG+F2+TAbU/UQ0Zg2qzDoBQsFpXNcJUf6HDXLRMqsH4+j7hajr5/J3FudPHjHFCksuOA1tn+27qHaMNiHmcnibSWRiFKZgH4EZJa6p83BLFkKQfoA8yITKOzsQkLTmMXjJMqm8uFIM+kvDIfXuow2tXm2H4Yz/PHY1OEogV9icD3iWHwtE3KRT5zbfKiUj79AL3B8dEcfP2uJy4AVmQuRRMGC2Q8b1phbRpFNU0Gm2sTJ1bOmbENUZHPPilc+dJnTCeGvCUptQTkPd7os9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:52:55 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 04:52:55 +0000
Message-ID: <9fbfdb89-7645-5a27-7163-41bdd352b1bf@intel.com>
Date: Wed, 5 Jul 2023 10:22:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <MW4PR11MB70568D48B6B9782BC7DA237CB32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <MW4PR11MB70568D48B6B9782BC7DA237CB32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::19) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 914ae035-8ef9-4d30-0b41-08db7d13b1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMjRYMTniAuMFBPuGLGT0dhQ7o8LUnvNnOrVu5gzJSgIIln7d6L+5TJC9T4VW5jxBOrVpFQHZylzmrT4MQz9NOkeu8q+3eKUBrQNyG8p0e0ahm2qiWwGYV0IUvXABGeJrOm+yBNU13ECZuRBHzO2B/oQF1TG9HB76xs64psbNMQxRYkCvdI33AU6HObi5niSg+BRq3CXh1Ep8Wsp9pd0EI3sKAbsaFpxdnruC55lcXvvqYMbQUKM8PoY69HPwlaiiSLyTrvb0gjGRlPP1vRxXnOkuAZn04gXLlwMXZSPJTKn1jbsTY20xJFAV4ZbW4yV4QsuJO6W+eVIeTwG4aRO382yi6Lr9NuHSidXmyYXkPrkJcReuHtQ/NksziWKtdF7+BxGDpeI96RZxBujSA8egX7VcLdsrDOyInBPqG0FY2L7/g5bNza2p9ONVdVt/Z8TIIN4fqmVmbHw8UkWi6A02XdNfe88T1k33Si9mVj9y/Qix5XnJH33pK8LKemB1SFKvc756vV8XyOGp073qzxB0o6o4QuAM+gbydpy2khLsKZIkDU+BSayIMWVhPA9WQp8OwVa9dudTa3RiqOsJmwhZK0oeNiDpTqcyrV4qHUcNEQnRmfXCLs2vSsq+hODVZVQa75rF0JtH+NVutDKMbDonQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(478600001)(82960400001)(26005)(6666004)(31686004)(6512007)(6506007)(107886003)(86362001)(31696002)(2616005)(186003)(54906003)(38100700002)(66476007)(4326008)(66946007)(66556008)(83380400001)(110136005)(53546011)(6486002)(316002)(5660300002)(8676002)(8936002)(30864003)(66899021)(41300700001)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRienlhVnFJSXF6NzI4MEpPay9Sek1zRWVGL3k5cTZPVHpXNjF2cHE4UGFl?=
 =?utf-8?B?QXY3S1RXNWt6SVk0NkhxZmsrdVZuOURnSnhQb0ZyU1kzblhYa2NpTHl4MkM4?=
 =?utf-8?B?eFVkSlpBN1hZSFFadjhVRTNKWUJBTmlNazVrWEZ1d04xRDBBcnZIWklCazJU?=
 =?utf-8?B?KzFGZ3hFdDBqOVBKNlp4Wlg1Y1hyZ3JjRDVaVDFUaVJEN0tQMTREVytYTW44?=
 =?utf-8?B?K0tzZUZnb2sxdEV5VlA4cHZiM1hWNy8wcDVLdXNmbXkvM1FwVkRCM0VhV2M5?=
 =?utf-8?B?aWpXTUlTUVpNSVB0ODhxMTMrNk9uOWRENUZYaWhoUGVldTNzcmQ4cjVUSk4x?=
 =?utf-8?B?SUxIZ2VzTzJ0VnRmYTkvQkI2QmJzekVxWnVCSzh3RWlsRWttMzlHcTNvcVNM?=
 =?utf-8?B?YWFEYWJjb0krRzAyVVZnMzgxWXJWT3pzRkxkbzFBMUJsL2JFcmZHYlA3SmJH?=
 =?utf-8?B?aDREeVV2N3V3YUJVbkh2SUVKdWdlcjRiemZ2S2oxbUJYbVMxR0FndXdxbW5i?=
 =?utf-8?B?WUdCdm12NERBR2JsYys0MHRKY3M5U1UxWC9GWUtKUWtaYXl1MVZVWFF1QTcz?=
 =?utf-8?B?ZmhnV0FQLzJSaHc3K3VNSnJkVEVQeVI1TG9ralNWaEcwWU1obUJUYmZ2K1Bv?=
 =?utf-8?B?Mkk3cUxNU0tBdityQkhqWDQzZDhPR1dKVTh3L2IvMGVKbUN0T3VLazBJZURi?=
 =?utf-8?B?MzM2RWZpV2pkQ05HOERPaGNHV04xT0FsZzFETWpUTTNWdjZHbEsrWHVrSzlI?=
 =?utf-8?B?ZFpVL281SHZXZFloS1Q1M2grQzIvMVNWeU1wV0I1dmtIbFBySHdnZUg4RXRh?=
 =?utf-8?B?WGdPVXc1SXJLOGpEVUtrZnNkM3J1cVVjUVJWS3MzS1pLRjh2K3hqQXkrRERO?=
 =?utf-8?B?dTQ2WFF1clRaVXB0U2hwSVRzQ2xIUm9FSkhKK3VIVW1VallJdXZkZ3lWbklD?=
 =?utf-8?B?NklnbWR6cE9rWXBEZFBQck91ajRnRkR2S0NzU0kvZ1U4cllVckN2Q2NmUVBU?=
 =?utf-8?B?bzZ3ZXk0Wk5GL2FJdkVRdnFSaG91ekRNelZ5NDhubjlpWHorNFl3bUpSU3BJ?=
 =?utf-8?B?Rk5hOFM2RnZRb2djY2EzaCttV0txOUhpQTM4Y01LR1F4WVNDbkg4UXRDcGRw?=
 =?utf-8?B?Vko0L3lmUGN4WThNR1pQVmVHeThoUXZFZkdlZlB5dmtzdDhPK2lraUI4MWYv?=
 =?utf-8?B?MTJ6czMwRjNvOEI5MUJHS2VJbSs2QmtJMXZYa0tpblptLzVJZUlOTjVuUFlX?=
 =?utf-8?B?bkdpWGR2NGdoYkdXS2FFY1hWK0wvd0RSeE5Sak5jYStTcW1DNEtDbHJkbk5P?=
 =?utf-8?B?TzF6T3RNRUNBV0ZoRU9WN1poY2QzN3hhVlJyVFZ0RFhsZ1hHNk8yaHJSYzlZ?=
 =?utf-8?B?a0VNNCtIU0NqUlo5dHpkdFpIQW8xNlR3UDBHZ0oyeVFBdUx1NDJKa3ViTU9n?=
 =?utf-8?B?WkNKWThmR1ZwT0tvTGJOS2VBMGJNMVRSb0RWN0ptdmZ3NCtvbEFiNUMzV2Vi?=
 =?utf-8?B?R3lrdjZrRzNad1ZoaldlV3FKblRLV0dCSW1nRHBlZEVyTzBsR2p6c2JqN0R6?=
 =?utf-8?B?NG5MdkdKWmZycDhHZHlxUVRyTW9YSmxzTTlja0Yxa3pXWEV1cmZTb0tzd3p6?=
 =?utf-8?B?NDNhL1Y5MHZZSU9FTlhwMnRTbU9GZnFBMUYyNmxra2FxRmRnTVFIaHEvSlh3?=
 =?utf-8?B?WnJvYmVxejI1Tnp2WDNjNjVsMWNCR1JIYWRESTM4SXM0TzZJMklpS0MzZlkw?=
 =?utf-8?B?WW0veDdqN2ZMczZMT3Zkbmhnazd4TmVsUitOU1VReThrRmdad0FSb3ZNRUk3?=
 =?utf-8?B?WVV0V0VRdXBSVVVsUU1jeDZaSFpnYXlPY1B5Q3VwWW1XOFVCMDhxcTMyTjVu?=
 =?utf-8?B?K0h2RlphTWt1ai9UbkNBOVY0NmtrS0h5U0ExSGNKakFSN1dUQTVGWlR2TEdS?=
 =?utf-8?B?RklnRUUzcVdUbU9CSFpCYnE0UXpsb1FTbjRDNjRnSTViclJkREpEcnZUdlRN?=
 =?utf-8?B?d2JJWVVjVy9KV0R5QkJabkhWM1dPL0p5VDEvdzF1dGpiZzBFam9VbFFKM1JK?=
 =?utf-8?B?VGc0YncweThtVzZMOUIxL3FGbHhVSURqZHU2Q3lqeXNzTWhxOStuM2tqUWdZ?=
 =?utf-8?B?OVFTQ1VGUmhyalhzMytFc05ESDZvWllyZWZob2dXTlIrYjNBVnZETVpQNUk0?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 914ae035-8ef9-4d30-0b41-08db7d13b1fc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 04:52:55.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3uSBvJWqgDbuY315EQALdVryvOeW+/2uemTS2lPM2QTNxk7ZmK/viTmViIAeQxG3AmyP4u6bvAHtF2sXu8h1JyQuxWaIFED/kPQGMrKzoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 04-07-2023 09:04, Ghimiray, Himal Prasad wrote:
> Hi Aravind,
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Aravind Iddamsetty
>> Sent: 27 June 2023 17:51
>> To: intel-xe@lists.freedesktop.org
>> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ursulin, Tvrtko
>> <tvrtko.ursulin@intel.com>
>> Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
>>
>> There are a set of engine group busyness counters provided by HW which
>> are perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729
>>
>> events can be listed using:
>> perf list
>>   xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>   xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>   xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>   xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>   xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>
>> and can be read using:
>>
>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>            time             counts unit events
>>      1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>
>> The pmu base implementation is taken from i915.
>>
>> v2:
>> Store last known value when device is awake return that while the GT is
>> suspended and then update the driver copy when read during awake.
>>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |   2 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>  drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>  drivers/gpu/drm/xe/xe_irq.c          |  22 +
>>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>>  drivers/gpu/drm/xe/xe_pmu.c          | 739
>> +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>>  drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>>  include/uapi/drm/xe_drm.h            |  16 +
>>  11 files changed, 902 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c  create mode 100644
>> drivers/gpu/drm/xe/xe_pmu.h  create mode 100644
>> drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 081c57fd8632..e52ab795c566 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -217,6 +217,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	i915-display/skl_universal_plane.o \
>>  	i915-display/skl_watermark.o
>>
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>  ifeq ($(CONFIG_ACPI),y)
>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  		i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3f664011eaea..c7d9e4634745 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -285,6 +285,11 @@
>>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>
>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE
>> 	XE_REG(0xdb80)
>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE
>> 	XE_REG(0xdba0)
>> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>> +#define XE_OAG_RENDER_BUSY_FREE
>> 	XE_REG(0xdbdc)
>> +
>>  #define SAMPLER_MODE
>> 	XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>>  #define   ENABLE_SMALLPL			REG_BIT(15)
>>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c index c7985af85a53..b2c7bd4a97d9
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
>>
>>  	xe_debugfs_register(xe);
>>
>> +	xe_pmu_register(&xe->pmu);
>> +
>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize,
>> xe);
>>  	if (err)
>>  		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0226d44a6af2..3ba99aae92b9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -15,6 +15,7 @@
>>  #include "xe_devcoredump_types.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>  #include "xe_step_types.h"
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -332,6 +333,9 @@ struct xe_device {
>>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>  	bool d3cold_allowed;
>>
>> +	/* @pmu: performance monitoring unit */
>> +	struct xe_pmu pmu;
>> +
>>  	/* private: */
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 2458397ce8af..96e3720923d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_msg;
>>
>> +	engine_group_busyness_store(gt);
>> +
>>  	err = xe_uc_suspend(&gt->uc);
>>  	if (err)
>>  		goto err_force_wake;
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index b4ed1e4a3388..cb943fb94ec7 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -27,6 +27,24 @@
>>  #define IIR(offset)				XE_REG(offset + 0x8)
>>  #define IER(offset)				XE_REG(offset + 0xc)
>>
>> +/*
>> + * Interrupt statistic for PMU. Increments the counter only if the
>> + * interrupt originated from the GPU so interrupts from a device which
>> + * shares the interrupt line are not accounted.
>> + */
>> +static inline void xe_pmu_irq_stats(struct xe_device *xe,
>> +				    irqreturn_t res)
> The res parameter seems redundant, the caller should call xe_pmu_irq_stats
> only in case of IRQ_HANDLED. Do we see need to pass this as an argument from caller and 
> check in this function ?
ya makes sense, as it is being invoked just before IRQ_HANDLED.

Thanks,
Aravind.
> 
> BR
> Himal 
>> +{
>> +	if (unlikely(res != IRQ_HANDLED))
>> +		return;
>> +
>> +	/*
>> +	 * A clever compiler translates that into INC. A not so clever one
>> +	 * should at least prevent store tearing.
>> +	 */
>> +	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1); }
>> +
>>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)  {
>>  	u32 val = xe_mmio_read32(mmio, reg);
>> @@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>>
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>
>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>
>> @@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>  	dg1_intr_enable(xe, false);
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>
>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>> b/drivers/gpu/drm/xe/xe_module.c index 75e5be939f53..f6fe89748525
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -12,6 +12,7 @@
>>  #include "xe_hw_fence.h"
>>  #include "xe_module.h"
>>  #include "xe_pci.h"
>> +#include "xe_pmu.h"
>>  #include "xe_sched_job.h"
>>
>>  bool enable_guc = true;
>> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>>  		.init = xe_sched_job_module_init,
>>  		.exit = xe_sched_job_module_exit,
>>  	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>  	{
>>  		.init = xe_register_pci_driver,
>>  		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644 index 000000000000..bef1895be9f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,739 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
>> + *
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config) {
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config) {
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT); }
>> +
>> +static unsigned int
>> +__sample_idx(struct xe_pmu *pmu, unsigned int gt_id, int sample) {
>> +	unsigned int idx = gt_id * __XE_NUM_PMU_SAMPLERS + sample;
>> +
>> +	XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
>> +
>> +	return idx;
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int
>> +sample) {
>> +	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur; }
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64
>> +val) {
>> +	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val; }
>> +
>> +static int engine_busyness_sample_type(u64 config) {
>> +	int type = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>> +		break;
>> +	}
>> +
>> +	return type;
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config) {
>> +	u64 val = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt,
>> XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt,
>> XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return xe_gt_clock_interval_to_ns(gt, val * 16); }
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config) {
>> +	int sample_type = engine_busyness_sample_type(config);
>> +	struct xe_device *xe = gt->tile->xe;
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	unsigned long flags;
>> +	u64 val;
>> +
>> +	/*
>> +	 * found no better way to check if device is awake or not. Before
>> +	 * we suspend we set the submission_state.enabled to false.
>> +	 */
>> +	device_awake = gt->uc.guc.submission_state.enabled ? true : false;
>> +	if (device_awake)
>> +		val = __engine_group_busyness_read(gt, config);
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake)
>> +		store_sample(pmu, gt_id, sample_type, val);
>> +	else
>> +		val = read_sample(pmu, gt_id, sample_type);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>> +void engine_group_busyness_store(struct xe_gt *gt) {
>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +	unsigned int gt_id = gt->info.id;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_RENDER_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_COPY_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_MEDIA_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id,
>> __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> +XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags); }
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config) {
>> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>> +	unsigned int gt_id = config_gt_id(config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +	if (gt_id > max_gt_id)
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_INTERRUPTS(0):
>> +		if (gt_id)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		if (GRAPHICS_VER(xe) < 12)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		if (MEDIA_VER(xe) >= 13 && gt->info.type !=
>> XE_GT_TYPE_MEDIA)
>> +			return -ENOENT;
>> +		break;
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = config_counter(event->attr.config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 val = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_INTERRUPTS(0):
>> +		val = READ_ONCE(pmu->irq_count);
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = engine_group_busyness_read(gt, config);
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count); }
>> +
>> +static void xe_pmu_enable(struct perf_event *event) {
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count,
>> __xe_pmu_event_read(event)); }
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags) {
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +	event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags) {
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE); }
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event) {
>> +	return 0;
>> +}
>> +
>> +struct xe_str_attribute {
>> +	struct device_attribute attr;
>> +	const char *str;
>> +};
>> +
>> +static ssize_t xe_pmu_format_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf) {
>> +	struct xe_str_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_str_attribute, attr);
>> +	return sprintf(buf, "%s\n", eattr->str); }
>> +
>> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
>> +	(&((struct xe_str_attribute[]) { \
>> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show,
>> NULL), \
>> +		  .str = _config, } \
>> +	})[0].attr.attr)
>> +
>> +static struct attribute *xe_pmu_format_attrs[] = {
>> +	XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_format_attr_group = {
>> +	.name = "format",
>> +	.attrs = xe_pmu_format_attrs,
>> +};
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf) {
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val); }
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf) {
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask); }
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \ { \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +	.global = false, \
>> +}
>> +
>> +#define __global_event(__counter, __name, __unit) \ { \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +	.global = true, \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64
>> +config) {
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +		bool global;
>> +	} events[] = {
>> +		__global_event(0, "interrupts", NULL),
>> +		__event(1, "render-group-busy", "ns"),
>> +		__event(2, "copy-group-busy", "ns"),
>> +		__event(3, "media-group-busy", "ns"),
>> +		__event(4, "any-engine-group-busy", "ns"),
>> +	};
>> +
>> +	unsigned int count = 0;
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	struct xe_gt *gt;
>> +	unsigned int i, j;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j,
>> events[i].counter);
>> +
>> +			if (!config_status(xe, config))
>> +				count++;
>> +		}
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry.
>> */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j,
>> events[i].counter);
>> +			char *str;
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			if (events[i].global)
>> +				str = kstrdup(events[i].name, GFP_KERNEL);
>> +			else
>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +						events[i].name, j);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &xe_iter->attr.attr;
>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +			if (events[i].unit) {
>> +				if (events[i].global)
>> +					str = kasprintf(GFP_KERNEL,
>> "%s.unit",
>> +							events[i].name);
>> +				else
>> +					str = kasprintf(GFP_KERNEL, "%s-
>> gt%u.unit",
>> +							events[i].name, j);
>> +				if (!str)
>> +					goto err;
>> +
>> +				*attr_iter++ = &pmu_iter->attr.attr;
>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +			}
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu) {
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +
>> +	XE_BUG_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node
>> +*node) {
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	XE_BUG_ON(!pmu->base.event_init);
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we
>> must
>> +	 * ignore to avoid incorrectly modifying the shared
>> xe_pmu_cpumask.
>> +	 */
>> +	if (pmu->closed)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu),
>> cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_slot = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_slot != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu) {
>> +	if (cpuhp_slot == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu-
>>> cpuhp.node); }
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu) {
>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node); }
>> +
>> +static void xe_pmu_unregister(struct drm_device *device, void *arg) {
>> +	struct xe_pmu *pmu = arg;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	/*
>> +	 * "Disconnect" the PMU callbacks - since all are atomic
>> synchronize_rcu
>> +	 * ensures all currently executing ones will have exited before we
>> +	 * proceed with unregistration.
>> +	 */
>> +	pmu->closed = true;
>> +	synchronize_rcu();
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	pmu->base.event_init = NULL;
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +static void init_samples(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>> +	unsigned int i;
>> +
>> +	for_each_gt(gt, xe, i)
>> +		engine_group_busyness_store(gt);
>> +}
>> +
>> +void xe_pmu_register(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&xe_pmu_format_attr_group,
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +	init_samples(pmu);
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name)
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +
>> +	if (!pmu->name)
>> +		goto err;
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups,
>> sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister,
>> pmu);
>> +	XE_WARN_ON(ret);
>> +
>> +	return;
>> +
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	pmu->base.event_init = NULL;
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n"); }
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644 index 000000000000..d3f47f4ab343
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_gt_types.h"
>> +#include "xe_pmu_types.h"
>> +
>> +#ifdef CONFIG_PERF_EVENTS
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu); void
>> +engine_group_busyness_store(struct xe_gt *gt); #else static inline int
>> +xe_pmu_init(void) { return 0; } static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {} static inline
>> +void engine_group_busyness_store(struct xe_gt *gt) {} #endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..e87edd4d6a87
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
>> +	__XE_SAMPLE_COPY_GROUP_BUSY,
>> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +struct xe_pmu_sample {
>> +	u64 cur;
>> +};
>> +
>> +#define XE_MAX_GT_PER_TILE 2
>> +
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @closed: xe is unregistering.
>> +	 */
>> +	bool closed;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 *
>> +	 */
>> +	struct xe_pmu_sample sample[XE_MAX_GT_PER_TILE *
>> __XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @irq_count: Number of interrupts
>> +	 *
>> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
>> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
>> +	 * occasional wraparound easily. It's 32bit after all.
>> +	 */
>> +	unsigned long irq_count;
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
>> 965cd9527ff1..ed097056f944 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -990,6 +990,22 @@ struct drm_xe_vm_madvise {
>>  	__u64 reserved[2];
>>  };
>>
>> +/* PMU event config IDs */
>> +
>> +/*
>> + * Top 4 bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (60)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define XE_PMU_INTERRUPTS(gt)
>> 	___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 3)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 4)
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> --
>> 2.25.1
> 
