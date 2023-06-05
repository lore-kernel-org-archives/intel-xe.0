Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E544C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C2E10E303;
	Mon,  5 Jun 2023 17:27:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7110E306;
 Mon,  5 Jun 2023 17:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685986053; x=1717522053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B1yHjyZhoGWEmk7CTBg2OJriu4pgrF398pxIjTD3shk=;
 b=lUj4UOGX1iNxj0cC6QEp+0dBR1Jk82M3OGw0uW4bWM6Vf9ucvnUgR3Ox
 VNShV6nsFNsEWou4Al0ExAS4NVe+flyxpNJKWQ3FNMnI6eK9HxlDjWFKF
 BkXHWJk4/nqYno8VGJiADPzYvnu35Wl/oa8G//f/NDOUJatrtlg+6veZ1
 MIiUzCYOf1hZFT6X6Ndgcv9yFsZpo3kTtpCuNz+eXyUyugmeeTlQq/Ung
 IKUkFk3BOXMPvurC+trjpJ7/2X0+RV4B60O3QOelCj++yJYU5UwASC5Hv
 Pj5P1F78sPrVpUfdSfG7S4Yp9JJacVPNkbFmDFMts2R0Erlbh2UqIiwpW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384736163"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="384736163"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778641997"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="778641997"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2023 10:27:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:27:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:27:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:27:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDyNJX+fTF7r6m2FGHsi5wYEehmMHmccjLltZcsviXmLtYNssmdxYM/GE/7QWZdN4t4NChSkMQu82shQRKnSHOwJBK1+cG3ZlMcc47vFRtJDAAKiJL5DC9+CaC5rGCV08pdYSNIPCFab51fJ+7I6yVvnuAVDAE0A9EQmKrZPURE6/dDyNQKlb9V1gve4sSH6IcQKjkmY8O4J+7T8Fvy/skPDbovo97YpTTnWyfTWwl1QyazvolNjEtU3x8b4AkZKfoFtFjBcO4Gb5ibkelUQ8OduN7bRsXnLoTgdvMQQriJ1nB9Uw7tZT3UO6sH7PGi8PWHX937t7lbgggk35GC+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5V+Yi5dy/U7k+g8zIq76OiFJ/CRUhLeg2QSYRy7N+U=;
 b=XByyimZ04yXj8UivDL5ML2GEMkwi74LDI0a5gdk/WgGB+sr65F8uRmyad9Ly3QdOlxjctmnGScS9isnrTEKhdrxqpK6A/0sqQ3u0r1xbFgIxc0vdoaKZ+j/qDnJYqLcNZA5f+mw7Vvif1E4HxsycBWMaY40yAF3CtZGXiggOG4q5Oap/ZvuJEeHiz4BHHUojAYDSUkH3aA+z40Wb346nkgz/B3sK+Nka9wqRmYYgiACnAkNlDO9Q5OlUA63WW4nepMLtKChr3/u4XHJ+5U+S6O8S+MyKJebXofTInzDuaEqgm87nq2lOkZgkEMtmwkFeS5WTu5WuPsW3iXIrQmtnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Mon, 5 Jun 2023 17:27:21 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:27:21 +0000
Message-ID: <e0eaec0d-3c54-aa4c-33f5-d7ac68f8a588@intel.com>
Date: Mon, 5 Jun 2023 22:57:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20230526163008.428809-1-aravind.iddamsetty@intel.com>
 <20230526163008.428809-2-aravind.iddamsetty@intel.com>
 <e6c3e67d-63a5-13cf-86b3-4cf35cf33109@habana.ai>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <e6c3e67d-63a5-13cf-86b3-4cf35cf33109@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::13) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e11e88-f5d2-45cd-be4a-08db65ea1e51
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sb+G1nf6uz+TKes16gY0NrBh/vLezz+KFLKyeM8TN8WgP6i5PVzW+/562bXEcug1ZsO70eVRuQ4XC9pUw0QX0yt6oPte2fSxdRjdOEZUsn2liU25+Rb6aF8B5Yj0CAj9H+dR6bMjyBa+9QXzHQKJY8a3jnsr0UV4pCqRzM+7CtsPjwyjfE+0bUPMEAPNibPel976kWzphl3kI3BHhPlPAOydgehP0opPRJCw+XvoPN+fFH0LphRHY/k8f+Ttqf/tX7JfiU3T1KKnuPes5hJEGpp3psGDKPDcpQnmdPWMCEcF8ienEH9rDKI748zR+/0m7YDsLb7AXNLo6UKB9kseTnWEX3CTNMPRrJ5ZpVRPmEa9jChaPwY6RRXjpplG11Awy2E6n4PP7wK9/uAXz7fsDpWdKDqMwka8rOmz4YY3p2fQXWdzTQfr0qAb5RpE0eOdj/gpDWn5LFhfRYnp+LybO1LAo8U8/daQybrjeFCQsnE1v26WNocsW3aOT+kTD1RHvsMDCbsAal/XSEH9vXPDnWIj+AFyCy9i53NKkazDDEo/Y0FUrluCq9fyqnNE0bd10iXlTqT5PjqlRjSW+/NqNmdfxs3Fv82KSpQRNZZJAgsqpDgCjpaPK7sca6j6UqszTGR0C9depLs/BJfMQ3WZFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(83380400001)(82960400001)(110136005)(54906003)(478600001)(8676002)(8936002)(41300700001)(316002)(66476007)(66946007)(66556008)(31696002)(5660300002)(38100700002)(86362001)(4326008)(6486002)(36756003)(6666004)(2906002)(30864003)(26005)(186003)(6506007)(6512007)(31686004)(66899021)(53546011)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djNsQWhNUysyRytzamVNbG5Pc1FHcFJWbFg4SzhpWWdHemE5VkFrZkxKVVhI?=
 =?utf-8?B?UFZYOFBqOEFwMWJtVUFWazVPOE0yZUtKVUV3OTNHL0tId1VPZTRpcHV0bUg5?=
 =?utf-8?B?VTdOYVYzT21zYTdORk9aTm82TzJGR2M4d1RDKzVzOFJoVFk5L3A3encyN0gz?=
 =?utf-8?B?K0djU1BmaWRITjdBQkxuNWlDejhoT1V1eE1GUlE4V0Y5QnM3ZlJFUnIwQjNF?=
 =?utf-8?B?U0UvUE8vd291UHpYd0RNV2YwSndRL1JGWWpDcXd2c2xnVCt0ckxTRjJaUC90?=
 =?utf-8?B?ajFVTjNTM3RWaEsyUjlvZUNvL1orOU8xcDJIbDl2d0lndEFKaXRYaUZTV2tl?=
 =?utf-8?B?WkRUOTRTaGM3N0JmRVZtdFJmTDBqaUgyZ0V0SUpsVWpGTGFGa1Bna1E5dnFB?=
 =?utf-8?B?a2Q4dEJOUlE3SW84ZFRndHIvcGorY3dHRFQrOWxjbytOTHVOazdsNGg2U2F4?=
 =?utf-8?B?UW9xWW9aWFB4dFdTS1dDYVgrTGRieWJIa1lodm5uWEZCY0lUTXhYQWJqUGJK?=
 =?utf-8?B?SUx4VElmc2JvcXJXMWdWUVU3N05tR082aWNOcThvMURCSlF3YjBSUHpEdGow?=
 =?utf-8?B?bElkd3IwWGl1NEtPT3ZjV2tlRW1jZm5oNDFiaS9KMUZYSVloRkVMNHU1VkdL?=
 =?utf-8?B?UGVxWE51cVZFNmgzUnhIMmdXd2V4SlB5WGNKOVBrMjEvSm5RcmdjMlZtSFB2?=
 =?utf-8?B?cmZsd3lXSVBtdzd0SVlHaE9nYUtaT3VKZ1VxOE1od2gyUUZUOFpDaXhyQXpE?=
 =?utf-8?B?OE8rQ2JPTXM3eWt4MXJtejJSWVBsV1JzMUtvR1B4eitnYmVNd1NxSGNWcDZw?=
 =?utf-8?B?SlZnSFBUNXJiVUNrMlRyQVA1QUhBNndxMmVyVmw0NWptL0IycWJac2JBY29u?=
 =?utf-8?B?R0tEVGVCRzAzWFpOVUxKQjVoNk5QUXBLcWR4NHpGcDJ3OFlFTHVNRDkranRy?=
 =?utf-8?B?alIwNUwzd0twUTdnSEIybi9ucFhGTUNQUHRMOUtLcW9kUG1vU1B3TzdFRXNw?=
 =?utf-8?B?a09CUGQ3eW04V1doaStobFdOakpmZHk3ME9wMUVQWUs5RVpDTGI2UlhBRU95?=
 =?utf-8?B?UUxGMVFvMmUwalZ1ZFVrdVJJVkErWmZnUFNYSzZXc0twMy9VeU1JWkVKQ2xW?=
 =?utf-8?B?aXcwQm95VUc1TitpZE1iM2wyUlFrc0pQK1V0YzlOM3YyYjh6YSt3eVJxd0ZB?=
 =?utf-8?B?M0Y2YTBZbUJrMjNsekNNSG5RQklJenRScFdIa0ljeVU2NGdwQlB1TU1Gczl4?=
 =?utf-8?B?dWNnYmZSMzVKSGhPT2lLU01XWlNSRkx1Um5BRmZhejArV253TkZ3ZjBZTVYz?=
 =?utf-8?B?ajZaNWQrYUEybTBzVEN4U0w2STk5RHV4SHM3Zk4xS0tYWC9DVTJEWjdWNTls?=
 =?utf-8?B?aWRKcHBjZTBMOW1yMFMyQ1dhRWFyUHNHbFJtaEptUE1VOFlhdndHLzEzd1A5?=
 =?utf-8?B?QWhpeHUxa3FiWnRURjVDY0xBYXRmaDJ6MEdxbi8wQTZhc3pOOFZvS01kaHpR?=
 =?utf-8?B?SXBJME15OGVBWHdkd253UFBFNlZPMmU4bVF1emJkVU9NVXRlSThjdERjdlUz?=
 =?utf-8?B?bm5jWTlWM0Y0NlRIVjZoc0FwOTNydDgzelM4UE5Kc0NFTVR0aUM2cFJlTG1p?=
 =?utf-8?B?K3BYSzNCV0ovUndHd1VIc0YvTHZTVks0QVc3ckxZSlBteW5iRFM2ckVXQXln?=
 =?utf-8?B?ZTQ3N2luU2Q1WUp6aGJ3Uitrc1ZrWTVBRHkvNGViN0dKTC9zY3hDbkQ1REdV?=
 =?utf-8?B?ZUJRVHlqQXNlaDBjRWdQenBhMVZpRW5HQS9FcFloa2lLNVBqOHdZSGtNZW1o?=
 =?utf-8?B?OG9BeWorWDFNWFBYa1U2bXlUcnZRM2gwWnVxaEczY3BiWDMrekhaZ3o4ci9w?=
 =?utf-8?B?N2VaTmJLamI0V2s2dHEvYU5kMXFBdXpHQk1zazRiVzRCWUZFZVZrOXZTWW5N?=
 =?utf-8?B?NVhkRUNxMHNUMkNtdzM4ejAraklBNkFuTi95VHdzNXhvR1hiWEI1bGtUS3RW?=
 =?utf-8?B?MjduaCtIcmlUUGFISVlXc1RDa2FJb25iaUpPbnhMRE4zK3pnMmYxanVmdnBk?=
 =?utf-8?B?YVVScVJMTWpzVHpYV3RvNDI3WGtqRDhsWm94RnZ6M3c5Z3BFa3EwTUdId3FC?=
 =?utf-8?B?eGdFblppSVNzS1FXc3dhWVlCRWtCc2NwNDNMQUFtRkd0NmZoUlI3VUtKSWJH?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e11e88-f5d2-45cd-be4a-08db65ea1e51
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:27:21.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMxBVCnsjvE6rFfgnfY0J+uZhOVyu2COJHjYc/2DCWXkbG3b8NEX5SHwoEn9ec9IlpAMS6yDl4/wpQHw1bQmoypXj+Po6AOg+p2V8+yl/Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC i-g-t 1/1] tools/RAS: A tool to read error
 counters
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 04-06-2023 22:39, Tomer Tayar wrote:
> On 26/05/2023 19:30, Aravind Iddamsetty wrote:
>> This tool demonstrates the use of netlink sockets to query and read the
>> error counters on a hardware. It provides following commands LIST_ERRORS,
>> READ_ONE, READ_ALL to read counters and WAIT_ON_EVENT to wait for
>> occurrence on a particular event, presently hardcoded to wait on
>> occurrence of correctable error event and read a error counter.
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>   include/drm-uapi/drm_netlink.h |  58 +++++
>>   meson.build                    |   4 +
>>   tools/drm_ras.c                | 403 +++++++++++++++++++++++++++++++++
>>   tools/meson.build              |   5 +
>>   4 files changed, 470 insertions(+)
>>   create mode 100644 include/drm-uapi/drm_netlink.h
>>   create mode 100644 tools/drm_ras.c
>>
>> diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
>> new file mode 100644
>> index 000000000..a41d658c1
>> --- /dev/null
>> +++ b/include/drm-uapi/drm_netlink.h
>> @@ -0,0 +1,58 @@
>> +/*
>> + * Copyright 2023 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef _DRM_NETLINK_H_
>> +#define _DRM_NETLINK_H_
>> +
>> +#define DRM_GENL_VERSION 1
>> +#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR   "drm_corr_err"
>> +#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR "drm_uncorr_err"
>> +
>> +enum error_cmds {
>> +     DRM_CMD_UNSPEC,
>> +     /* command to list all errors names with config-id */
>> +     DRM_CMD_QUERY,
>> +     /* command to get a counter for a specific error */
>> +     DRM_CMD_READ_ONE,
>> +     /* command to get counters of all errors */
>> +     DRM_CMD_READ_ALL,
>> +     DRM_CMD_ERROR_EVENT,
>> +
>> +     __DRM_CMD_MAX,
>> +     DRM_CMD_MAX = __DRM_CMD_MAX - 1,
>> +};
>> +
>> +enum error_attr {
>> +     DRM_ATTR_UNSPEC,
>> +     DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
>> +     DRM_ATTR_REQUEST, /* NLA_U8 */
>> +     DRM_ATTR_QUERY_REPLY, /*NLA_NESTED*/
>> +     DRM_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
>> +     DRM_ATTR_ERROR_ID, /* NLA_U64 */
>> +     DRM_ATTR_ERROR_VALUE, /* NLA_U64 */
>> +
>> +     __DRM_ATTR_MAX,
>> +     DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
>> +};
>> +
>> +#endif
> 
> drm_netlink.h is not identical to the kernel uapi file. Is it intentional?

If I split up the kernel header as I mentioned there it will be same as
kernel uapi file.

Thanks,
Aravind.
> 
> Thanks,
> Tomer
> 
>> diff --git a/meson.build b/meson.build
>> index 7360634fe..269a9310f 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -141,6 +141,10 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>>   libudev = dependency('libudev', required : true)
>>   glib = dependency('glib-2.0', required : true)
>>
>> +libnl = dependency('libnl-3.0', required: false)
>> +libnl_genl = dependency('libnl-genl-3.0', required: false)
>> +libnl_cli = dependency('libnl-cli-3.0', required:false)
>> +
>>   xmlrpc = dependency('xmlrpc', required : false)
>>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>>   xmlrpc_client = dependency('xmlrpc_client', required : false)
>> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
>> new file mode 100644
>> index 000000000..f0ac99c79
>> --- /dev/null
>> +++ b/tools/drm_ras.c
>> @@ -0,0 +1,403 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include <stdio.h>
>> +#include <sys/types.h>
>> +#include <unistd.h>
>> +#include <getopt.h>
>> +#include <linux/genetlink.h>
>> +#include <netlink/cli/utils.h>
>> +
>> +#include "drm_netlink.h"
>> +#include "igt_device_scan.h"
>> +
>> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
>> +
>> +struct nl_sock *sock, *mcsock;
>> +int family_id;
>> +
>> +enum opt_val {
>> +     OPT_UNKNOWN = '?',
>> +     OPT_END = -1,
>> +     OPT_DEVICE,
>> +     OPT_CONFIG,
>> +     OPT_HELP,
>> +};
>> +
>> +enum cmd_ids {
>> +     INVALID_CMD = -1,
>> +     LIST_ERRORS = 0,
>> +     READ_ONE,
>> +     READ_ALL,
>> +     WAIT_ON_EVENT,
>> +
>> +     __MAX_CMDS,
>> +};
>> +
>> +static const char * const cmd_names[] = {
>> +     "LIST_ERRORS",
>> +     "READ_ONE",
>> +     "READ_ALL",
>> +     "WAIT_ON_EVENT",
>> +};
>> +
>> +static void help(char **argv)
>> +{
>> +     int i;
>> +
>> +     printf("Usage: %s command [<command options>]\n", argv[0]);
>> +     printf("commands:\n");
>> +
>> +     for (i = 0; i < __MAX_CMDS; i++) {
>> +             switch (i) {
>> +             case LIST_ERRORS:
>> +             case READ_ALL:
>> +             case WAIT_ON_EVENT:
>> +                     printf("%s %s --device=<device filter>\n", argv[0], cmd_names[i]);
>> +                     break;
>> +             case READ_ONE:
>> +                     printf("%s %s --device=<device filter> --error_id=<id returned from query>\n", argv[0], cmd_names[i]);
>> +                     break;
>> +             }
>> +     }
>> +
>> +     igt_device_print_filter_types();
>> +}
>> +
>> +static int list_errors(struct nl_cache_ops *ops, struct genl_cmd *cmd,
>> +                    struct genl_info *info, void *arg)
>> +{
>> +     const struct nlmsghdr *nlh = info->nlh;
>> +     struct nlattr *nla;
>> +     int len, remain;
>> +
>> +     len = GENL_HDRLEN;
>> +
>> +     nlmsg_for_each_attr(nla, nlh, len, remain) {
>> +             if ((nla_type(nla) == DRM_ATTR_QUERY_REPLY) && nla_is_nested(nla)) {
>> +                     struct nlattr *cur;
>> +                     int rem;
>> +
>> +                     if (cmd->c_id == DRM_CMD_READ_ALL)
>> +                             printf("%-50s\t%-18s\t%s\n", "name", "config-id", "counter");
>> +                     else
>> +                             printf("%-50s\t%-18s\n", "name", "config-id");
>> +
>> +                     nla_for_each_nested(cur, nla, rem) {
>> +                             switch (nla_type(cur)) {
>> +                             case DRM_ATTR_ERROR_NAME:
>> +                                     printf("\n%-50s", nla_get_string(cur));
>> +                                     break;
>> +                             case DRM_ATTR_ERROR_ID:
>> +                                     printf("\t0x%016lx", nla_get_u64(cur));
>> +                                     break;
>> +                             case DRM_ATTR_ERROR_VALUE:
>> +                                     printf("\t%lu", nla_get_u64(cur));
>> +                                     break;
>> +                             default:
>> +                                     break;
>> +                             }
>> +                     }
>> +                     printf("\n");
>> +             }
>> +     }
>> +
>> +     return NL_OK;
>> +}
>> +
>> +static int read_single(struct nl_cache_ops *ops, struct genl_cmd *cmd,
>> +                    struct genl_info *info, void *arg)
>> +{
>> +     if (!info->attrs[DRM_ATTR_ERROR_VALUE])
>> +             nl_cli_fatal(NLE_FAILURE, "DRM_ATTR_ERROR_VALUE attribute is missing");
>> +
>> +     printf("counter value %lu\n", nla_get_u64(info->attrs[DRM_ATTR_ERROR_VALUE]));
>> +
>> +     return NL_OK;
>> +}
>> +
>> +static int mcast_event_handler(struct nl_cache_ops *ops, struct genl_cmd *cmd,
>> +                            struct genl_info *info, void *arg)
>> +{
>> +     struct nl_msg *msg;
>> +     uint64_t config = 0x0000000000000005; /* error-gt0-correctable-eu-grf */
>> +     void *msg_head;
>> +     int ret;
>> +
>> +     printf("error event received\n");
>> +
>> +     msg = nlmsg_alloc();
>> +     if (!msg)
>> +             nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
>> +
>> +     msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0, DRM_CMD_READ_ONE, 1);
>> +     if (!msg_head)
>> +             nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
>> +
>> +     nla_put_u64(msg, DRM_ATTR_ERROR_ID, config);
>> +
>> +     ret = nl_send_auto(sock, msg);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
>> +
>> +     ret = nl_recvmsgs_default(sock);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
>> +
>> +     nlmsg_free(msg);
>> +
>> +     return NL_OK;
>> +}
>> +
>> +static struct nla_policy drm_genl_policy[DRM_ATTR_MAX + 1] = {
>> +     [DRM_ATTR_REQUEST] = { .type = NLA_U8 },
>> +     [DRM_ATTR_QUERY_REPLY] = { .type = NLA_NESTED },
>> +     [DRM_ATTR_ERROR_NAME] = { .type = NLA_NUL_STRING },
>> +     [DRM_ATTR_ERROR_ID] = { .type = NLA_U64 },
>> +     [DRM_ATTR_ERROR_VALUE] = { .type = NLA_U64 },
>> +};
>> +
>> +static struct genl_cmd drm_genl_cmds[] = {
>> +     {
>> +             .c_id           = DRM_CMD_QUERY,
>> +             .c_name         = "QUERY",
>> +             .c_maxattr      = DRM_ATTR_MAX,
>> +             .c_attr_policy  = drm_genl_policy,
>> +             .c_msg_parser   = list_errors,
>> +     },
>> +     {
>> +             .c_id           = DRM_CMD_READ_ONE,
>> +             .c_name         = "READ_1",
>> +             .c_maxattr      = DRM_ATTR_MAX,
>> +             .c_attr_policy  = drm_genl_policy,
>> +             .c_msg_parser   = read_single,
>> +     },
>> +     {
>> +             .c_id           = DRM_CMD_READ_ALL,
>> +             .c_name         = "READ_ALL",
>> +             .c_maxattr      = DRM_ATTR_MAX,
>> +             .c_attr_policy  = drm_genl_policy,
>> +             .c_msg_parser   = list_errors,
>> +     },
>> +     {
>> +             .c_id           = DRM_CMD_ERROR_EVENT,
>> +             .c_name         = "ERROR_EVENT",
>> +             .c_maxattr      = DRM_ATTR_MAX,
>> +             .c_attr_policy  = drm_genl_policy,
>> +             .c_msg_parser   = mcast_event_handler,
>> +     },
>> +};
>> +
>> +static struct genl_ops drm_genl_ops = {
>> +     .o_hdrsize      = 0,
>> +     .o_cmds         = drm_genl_cmds,
>> +     .o_ncmds        = ARRAY_SIZE(drm_genl_cmds),
>> +};
>> +
>> +static void send_cmd(int cmd, uint64_t config)
>> +{
>> +     struct nl_msg *msg;
>> +     void *msg_head;
>> +     int ret;
>> +
>> +     msg = nlmsg_alloc();
>> +     if (!msg)
>> +             nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
>> +
>> +     msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0, cmd, 1);
>> +     if (!msg_head)
>> +             nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
>> +     switch (cmd) {
>> +     case DRM_CMD_QUERY:
>> +             nla_put_u8(msg, DRM_ATTR_REQUEST, 1);
>> +             break;
>> +     case DRM_CMD_READ_ONE:
>> +             nla_put_u64(msg, DRM_ATTR_ERROR_ID, config);
>> +             break;
>> +     case DRM_CMD_READ_ALL:
>> +             nla_put_u8(msg, DRM_ATTR_REQUEST, 1);
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     ret = nl_send_auto(sock, msg);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
>> +
>> +     ret = nl_recvmsgs_default(sock);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
>> +
>> +     nlmsg_free(msg);
>> +}
>> +
>> +static int get_cmd(char *cmd_name)
>> +{
>> +     int i;
>> +
>> +     if (!cmd_name)
>> +             return -1;
>> +
>> +     for (i = 0; i < __MAX_CMDS; i++) {
>> +             if (strcasecmp(cmd_name, cmd_names[i]) == 0)
>> +                     return i;
>> +     }
>> +
>> +     return -1;
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +     char *endptr;
>> +     enum opt_val val;
>> +     enum cmd_ids cmd;
>> +     char *device = NULL;
>> +     uint64_t error_config_id;
>> +     int  ret, mcgrp, index;
>> +     struct igt_device_card card;
>> +     char *dev_name, *dup;
>> +
>> +     static struct option options[] = {
>> +             {"device",      required_argument,      NULL,   OPT_DEVICE},
>> +             {"error_id",    required_argument,      NULL,   OPT_CONFIG},
>> +             {"help",        no_argument,            NULL,   OPT_HELP},
>> +             { 0 }
>> +     };
>> +
>> +     cmd = get_cmd(argv[1]);
>> +     if (cmd < 0) {
>> +             fprintf(stderr, "invalid command\n");
>> +             help(argv);
>> +             exit(EXIT_FAILURE);
>> +     }
>> +
>> +     for (val = 0; val != OPT_END; ) {
>> +             val = getopt_long(argc, argv, "", options, &index);
>> +
>> +             switch (val) {
>> +             case OPT_DEVICE:
>> +                     device = strdup(optarg);
>> +                     break;
>> +             case OPT_CONFIG:
>> +                     error_config_id = strtoull(optarg, &endptr, 16);
>> +                     if (*endptr) {
>> +                             fprintf(stderr, "invalid config id %s\n", optarg);
>> +                             exit(EXIT_FAILURE);
>> +                     }
>> +                     break;
>> +             case OPT_HELP:
>> +                     help(argv);
>> +                     exit(EXIT_FAILURE);
>> +             case OPT_END:
>> +                     break;
>> +             case OPT_UNKNOWN:
>> +                     exit(EXIT_FAILURE);
>> +             }
>> +     }
>> +
>> +     if (!device) {
>> +             fprintf(stderr, "missing device option\n");
>> +             help(argv);
>> +             exit(EXIT_FAILURE);
>> +     } else {
>> +             ret = igt_device_card_match_pci(device, &card);
>> +             if (!ret) {
>> +                     fprintf(stderr, "device %s not found!\n", device);
>> +                     exit(EXIT_FAILURE);
>> +             }
>> +             free(device);
>> +     }
>> +
>> +     /* get card name */
>> +     dup = strdup(card.card);
>> +
>> +     while (dup)
>> +             dev_name = strsep(&dup, "/");
>> +     free(dup);
>> +
>> +     drm_genl_ops.o_name = strdup(dev_name);
>> +
>> +     sock = nl_cli_alloc_socket();
>> +     if (!sock)
>> +             nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
>> +
>> +     ret = nl_cli_connect(sock, NETLINK_GENERIC);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Cannot connect handle");
>> +
>> +     ret = genl_register_family(&drm_genl_ops);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Cannot register xe family");
>> +
>> +     ret = genl_ops_resolve(sock, &drm_genl_ops);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to resolve family name");
>> +
>> +     family_id = genl_ctrl_resolve(sock, drm_genl_ops.o_name);
>> +     if (family_id < 0)
>> +             nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", drm_genl_ops.o_name);
>> +
>> +     ret = nl_socket_modify_cb(sock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
>> +     if (ret < 0)
>> +             nl_cli_fatal(ret, "Unable to modify valid message callback");
>> +
>> +     switch (cmd) {
>> +     case LIST_ERRORS:
>> +             send_cmd(DRM_CMD_QUERY, 0);
>> +             break;
>> +     case READ_ONE:
>> +             send_cmd(DRM_CMD_READ_ONE, error_config_id);
>> +             break;
>> +     case READ_ALL:
>> +             send_cmd(DRM_CMD_READ_ALL, 0);
>> +             break;
>> +     case WAIT_ON_EVENT:
>> +             mcsock = nl_cli_alloc_socket();
>> +             if (!mcsock)
>> +                     nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
>> +
>> +             ret = nl_cli_connect(mcsock, NETLINK_GENERIC);
>> +             if (ret < 0)
>> +                     nl_cli_fatal(ret, "Cannot connect handle");
>> +
>> +             ret = genl_ops_resolve(mcsock, &drm_genl_ops);
>> +             if (ret < 0)
>> +                     nl_cli_fatal(ret, "Unable to resolve family name");
>> +
>> +             nl_socket_disable_seq_check(mcsock);
>> +
>> +             mcgrp = genl_ctrl_resolve_grp(mcsock, drm_genl_ops.o_name,
>> +                                           DRM_GENL_MCAST_GROUP_NAME_CORR_ERR);
>> +             if (mcgrp < 0)
>> +                     nl_cli_fatal(mcgrp, "failed to resolve generic netlink multicast group");
>> +
>> +             /* Join the multicast group. */
>> +             ret = nl_socket_add_membership(mcsock, mcgrp);
>> +             if (ret < 0)
>> +                     nl_cli_fatal(ret, "failed to join multicast group");
>> +
>> +             ret = nl_socket_modify_cb(mcsock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
>> +             if (ret < 0)
>> +                     nl_cli_fatal(ret, "Unable to modify valid message callback");
>> +
>> +             printf("waiting for error event\n");
>> +             ret = nl_recvmsgs_default(mcsock);
>> +             if (ret < 0)
>> +                     nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
>> +
>> +             nl_close(mcsock);
>> +             nl_socket_free(mcsock);
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     nl_close(sock);
>> +     nl_socket_free(sock);
>> +
>> +     return 0;
>> +}
>> +
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 4c45f16b9..a53d3917f 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -107,5 +107,10 @@ if libudev.found()
>>                       install : true)
>>   endif
>>
>> +executable('drm_ras', 'drm_ras.c',
>> +           dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
>> +           install_rpath : bindir_rpathdir,
>> +           install : true)
>> +
>>   subdir('i915-perf')
>>   subdir('null_state_gen')
> 
> 
