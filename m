Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376C8C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 20:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBCF10E38B;
	Mon, 22 May 2023 20:46:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EDD10E38B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684788415; x=1716324415;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=cvLUMTdGDbYo+Hhk9HAzgttYhI1f/36g0WiIGa7BrhY=;
 b=RNYEsdM7CM/k0Nr3bOzdoE49Hr7LZSbpugqfVT/7NtAGfmwn3C6wgoP9
 opgH1aYRYPhdZEg/HWVpESYd/I5zd4R9cgC1SSocQqGN/DsoHlmCNJ6K8
 kGwVxJvbKK7Lwv4LQHW8V2xMVVMGVMcqXp72u/QmYpnBUFTnI255nwgHl
 +73UNTNZ7ex6ZLvfxy6GkBr8/DCt2hr37sLSSuDY046HnisuexZ9Pq5Qi
 c9pW1wdTihCj2+varvdYFLVDG3toyDex8R9YWPNqJ/ggvdLroTU5uT0gu
 y1HRsftP/eZQcLl8VZWCn8dfobwYlmpHOOrziR4y8GpoMNPndMi/LQWSz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342493160"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="342493160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="815827602"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="815827602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 22 May 2023 13:46:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 13:46:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 13:46:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 13:46:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 13:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWghHVuW5lXywY6mb4R07XTo1niELC1dwqHNfOPu71olqMrBbDbVDm2K5VcMUziyoas6NoOVAddugfV5OlHhM4BWwDtYP10pRo8pQ/zxnuUy1mZHv+iDqUgnp65EiTA2Nzsl357SXFRLmk3rEAXhMFWd7UyWste2xd6SD6OH6l7tmfpr5CO9NsRGvfo3wONGh6iS6TA5313eEH3Y8YXt9gQP2/tIYL5YRWhpm6ZLkpFaUrRBxyQ47I6ut/4RHMRU6/EL64hfihriLFjoqCq+Mw1jaFeYpCncY9RLWI21cehNfsJw0pSqt8bnRcgFEinEKDfe4COZ/zovy5ahCvOHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwz0WxkMyZLKjpCJG5zYidmxYJwDvJA59PLn8qcTqDo=;
 b=ive1suCqwvYHE+1COu24cWQMPVssD4y29tkMgpfwAAWO5x9+oKZTtKj4HLzGp7FQKEK24+gMqrWMwgHvUuv1oTNlNLGC6+UY6MWkNxqlKllAi5CqkB+cqfR9Hibo4NENmPKYWM+50QG9V58ZVb9kkrPcdNEIxJlDaPvqTT6sGNxw8pVmFuIXMdOOx+rsMbWmSwjKTnUYBK/wEDX4+YUdrYR1csrM8cuO+GzQC3fm/4JmJawaKEeeUzaEh1OBPRFdiIADsyVcn1gpqtiJuMLKjIqaYGVPKW4YLj5ZjJRzDorMYpQtDl8POfWNCiTdgD7WLq1arQR0s4shvkrqJo0PIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by BL1PR11MB5382.namprd11.prod.outlook.com (2603:10b6:208:31c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 20:46:39 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 20:46:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230518215651.502159-1-gustavo.sousa@intel.com>
References: <20230518215651.502159-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 22 May 2023 17:46:35 -0300
Message-ID: <168478839502.2146.7175424458038490918@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|BL1PR11MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e10eb30-86ed-47d0-2ed8-08db5b05a488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0f/Y9tA4EOCbfVAguSlffEgGZtraMwKMguhgT+xvZAba/9QqWy4nvBacNVDwFJaNdlB2lAvbm/3kZqggG5Pz2nGgH1Akv9PAP9DrEOJUQdTzieERxrk7lHQo+ghzy3M/tsd78bN0wisv0awk910sfgpHneYu/ClA59XLnBFFoihNm2SwAeKTJH7y4ijeALHmplmije5mAb5IEeb+td3RVpATgtomSVRYd/XB6Guyhc7CfEmf6hpTsxS8tj1N/q7TwIe4iNrduZo1K4I6z2/+xQTxUlfzPvtE2l8XJLBKLF2mQ9oxiCfalzccFZeUXGPZzod+6H5ZDZtIOOsraKCSqoI2xsu1mP+ZTAKTQjC+8+S2318ZgUJq8NWlxPLZN1StQgmVPgyfaZDPGeTAj8s19K3FLgDu43JLPxYrjs7dpo7XH7XhiK0rKiK/2JZ1I3xQV+WsFGyehU/a0k2fxn8u8xMTESiPLu4gph4/0hmmQsnokJBqCfMJC0yDUVrYWR05iBpC4D6dTTTLhhaQnRttPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(478600001)(186003)(26005)(5660300002)(6666004)(966005)(6486002)(66476007)(41300700001)(6916009)(316002)(4326008)(6512007)(6506007)(44832011)(8676002)(8936002)(9686003)(2906002)(4744005)(83380400001)(66556008)(66946007)(82960400001)(38100700002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1GM1dkRkZtQ28za0o1dlNieE1FTDFNUjB1Y1dQdW15RGIwTGlHa0xmbzVh?=
 =?utf-8?B?TWo2Q2dYVmdvcytNYmFYSmY2eFpxdng3MStxaFM3Y1ZrQ091NytKZUNGN0Jr?=
 =?utf-8?B?SE1mTTNZdWtRUm1YLzh1dHl2QjduRGtCU2pXRW90R05UbjZlcy9VU3hFT2Np?=
 =?utf-8?B?cXk0dHphTXN2WWhRMGpkVzUvQmpwd3o4VytJY29oQzNZWEtOMm5MbU85NXUz?=
 =?utf-8?B?cTBlT01OUHNheGxKMHduSlpBWWl6UU82a3RqdmxFOUMzUGdGQStoYkZXYklO?=
 =?utf-8?B?R1dxWWRYUHJmeEFJY3NNSU8wMk8xRm5Zbm5kNFZVaFZ3ZFE4R1VuRDJaVFZG?=
 =?utf-8?B?Q3JqWTlyVEVRZnFGZjNkNCtFU0tIRlU5bGxtS2h3ZzdPei9WV2FQdUhHcUVs?=
 =?utf-8?B?VXdpVkpyS0o2WEcxSDJBVmdRM2E4U3pDcTFrSGJuT2NCbWF6Q3RFMkV1YU5r?=
 =?utf-8?B?MjZITTI1MzNzWTlRRmw2YlZZSEdPSm5UNE1TN2MxdGxkZWdUWTcyaXVrT3Bw?=
 =?utf-8?B?b3o5aE5CZ2tIdUlMbE8wcm1vaHNCZTB3K0syTlJwellTUzcxNDM5ZlhiK3Jk?=
 =?utf-8?B?NGxIck5SQTlMWXlIK3Z6OXJlZ2l4d0Jsb3JuWVQvRG5QU0hZUlNGeVBkU1pY?=
 =?utf-8?B?NHY5UEpwTytlSGw3NERNNkhodHhSeGp6OFNLelhGakVzZm1ZNVUrcis4aDVl?=
 =?utf-8?B?UWxiTG1FS2gxOUtCQTV2bktWMW4zakpoZnR3T3JjTVBqOUN6VW5LaHh1KzJK?=
 =?utf-8?B?VFk4aFR5S2wxaVBIbmV3aGcvR05MQ1ZSaGdDQlkzWVJDa0tmc2FTaUtibjNj?=
 =?utf-8?B?YnJQN2dRZ0NCRjFtVkt5MEV5Kzh3RUpSdjhlZVNxMTdHSlVDRytSN0ZRWUp0?=
 =?utf-8?B?blZvNkhYLzhXWHdoNzRaT0hvRy9VbkdQNTBnNFZ5MHRRZ2ZnQk1nQ0krRVlR?=
 =?utf-8?B?U2MwV04xVXRSSWdTd1I2blJjenl1QUk4bjlhQ1IyaTg3SldublFmaVJZcDNm?=
 =?utf-8?B?VzBoUHhmQSs3SVBSTWM5Q0N4NThGUGl3WnY0RW9vRmhyZG1xaVk2aTRCbldj?=
 =?utf-8?B?eXZ2cmNyY3RidFJJYW5aMGxuNkwwR2JMSWpCOTFZOGVBZWxaTVJ5Z0wxaGMw?=
 =?utf-8?B?RmgyaGNwTERzaTB3WHVQY2J3R0FBcG11YmVuQmJjRW1lb3ZCYktlQ3JnaEt2?=
 =?utf-8?B?UDdBeGh4Z3Q3MHFPZW5CUldsN2NLbnlLeUlTdXhoWDk1N01LbExQUy82ajI2?=
 =?utf-8?B?VzlhVjY1UW0zeFlLTmR6RlhZbGdlZXUvZ2QxQ1c5VVRwcWtBaEtJUm9GeVJP?=
 =?utf-8?B?aWt1N0NYV1pFOWlKNUhXTXNrU0pIeTd0VkFHZEVpSVllWndnUEdyU0NnRld6?=
 =?utf-8?B?QnFYVE9VYTIzN2lHTFNCSGZPb29HYnp3ZjJka2lwOG41REQvZjA5M29NU2Z6?=
 =?utf-8?B?aWdiNjF1MGx1Q2NUSk5DTEp1RTNuL0l6eHFoY0tlVmFjVXhtZFBJUUxPY2dj?=
 =?utf-8?B?WmtMaTVIVC9PU0p4WXJsNm1tMkZQcW5aS0lvbEQxelo2US9nOEFWN3VNZHoz?=
 =?utf-8?B?Zkg2YmZQSXZZODRNNFZaeDBzaU5QZ2N5bGliUVlORzlXbWhzbDc4OGI4a2Vr?=
 =?utf-8?B?Um9kaG9RU3BEcjEzMHdOcG1VdXNzaUoxbThlaDRVSncvY3NrSlBEMHBDRXp6?=
 =?utf-8?B?SHBrdE00WjBldUI4OEtGNFVZWmtuMGpjOGk1bmZBMzR1S0tYM2QvRTZpNzY5?=
 =?utf-8?B?aHFZSWtPUjEwc2lxVW9sNlZqZFFqd3VHQU1FMm1jVVovamFqZDdIMUVLQm1S?=
 =?utf-8?B?N1o5ODRPK3lTNC9PWTE2clFOU0JUOFI5RTNWUjRrbUtCOXNsRjZGMjlqSVJm?=
 =?utf-8?B?Sm5wSFA5QStmK2xvMHdxMzl4RlpjckFaVEk1Rk1ia1l6ZVlqRk9DKzkwQy90?=
 =?utf-8?B?SW5qanBLeWJKa1I5azJacGJkaDQ4c2sxQUE2QkYyUTRDZmhGb0FHN0QyVjZk?=
 =?utf-8?B?Mkg4ejRENDcydWt5b3JrM2g2eEFLT2tMUnQxbWZqYlAyaGRGZVB4UFZVUngz?=
 =?utf-8?B?d2xQNEJHVmNrd0lYUUZsS212clRPRUFONzZEalB4d2dtdys2OXMrblVEYmNF?=
 =?utf-8?B?NDBWeHczUVBwQ2h5Z2UvVTNzaDJpa3lhbHQzMXZQQll1eG9tU3FjczBzbVlD?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e10eb30-86ed-47d0-2ed8-08db5b05a488
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 20:46:39.7841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIgVNcvOnEZHbT59tw2lLBbNLlcAXdmGL0NxgB99zCiVK8vqxt0lFjh842OK3MKm+5WF52zca/sUbFwRX3D9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5382
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Proper cleanup in
 xe_device_create()
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

Quoting Gustavo Sousa (2023-05-18 18:56:49-03:00)
>This is a followup of [1], with an extra patch moving the call
>drmm_add_action_or_reset() for a proper cleanup in case of failures.
>
>[1] https://patchwork.freedesktop.org/series/117967/
>
>Gustavo Sousa (2):
>  drm/xe: Call drmm_add_action_or_reset() early in xe_device_create()
>  drm/xe: Fail xe_device_create() if wq allocation fails
>
> drivers/gpu/drm/xe/xe_device.c | 18 +++++++++++++-----
> 1 file changed, 13 insertions(+), 5 deletions(-)

Pushed. Thanks, Rodrigo, for the review!

--
Gustavo Sousa
