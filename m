Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11052C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 15:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE6410E04C;
	Thu, 25 May 2023 15:14:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243910E04C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685027651; x=1716563651;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Pv3SvTtVVOA/NmfBRPVGGVAVCWf7f6jiqOvern3/B5E=;
 b=jXm6ZXX6bReq9tvuDwsMoN3MnlE/jgCdWhYUcNQaGNQnSDZV27jOEhF2
 EOIiuBsgP1F3IXGb792ETGkj29QrJxyqaQhgaOmZlknpUQpfTA9vgzF7j
 gHq16Di8s9qPARz4kjjyQz/8E6jSHwktuytYL3P3RWsy9G+93iDetFL7L
 MNJhrE5xGX5vVmOEHgsXxy/NznTWbQ0h0928Wb5B8QMmBr2jRI2T0IJM8
 AeKJM90pTnyzkJ/Rc8xSV8Ahz0n63wl5SpZN4I1H6hI/PNdwtYRkbbWdw
 zdbdR5Q510eFZNQQdw+mdpwAvR2GOmej8DQj3HV4NnXBfTdhk+wuVN9qU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440270435"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440270435"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682361747"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="682361747"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 08:13:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:13:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:13:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 08:13:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 08:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnAxOLCP9w+fYULj1nmzBFVQQD20A+98kj3LyC2UWtPmrkyN5jQxZ6fqJKA2IWaNO/xWHfA7JefeJEZJvJO/WBnsnbp1dfRWgxuI+XwfZri+bi6aZl4JMNeCW0c3I8NSl7pJ+NPCZZ04dNiyxC78T4DH8XUh2UYukPG4CY6iYzoSm4RD/PbPw7FpCJS91BErx2UMnj/MW+OYqdv+/9eYn6yB7mbFyTOnqKEQPzo+B3MlJln3P+pO96sje/kY2pzLXkYUQu8GugfQN9jnGIJdHPc+bliPU11D2Po9WaF+//Pmh0kb7OjQxAR8Xecch+AkX/KnRGgVYqCJvDNLj+7zTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXqHj4ZkBpntNMHO6M6HkbLLpmgvN/p9bqtPE5cdlNw=;
 b=NVo8/L/3zj0MkWOcc//TVoGNs5UU+Pi0OvAgOYf1ovooy4yZWGyLEuB3L+Zg8AeKQtltDPtQf/+kFNgMA6N1LOOfQSiW3DR2b7cOjS/H2fTtYHGfNiCwf90jY1GXgjP5lWJOxAzila4ripUxfmhkxApAo0NGXirwXL9dMD+3JNBe9ju05LvIP4ofKwMH4YML0eOhhpjM8qcUsVVdIuCq1Z6U3crgBVel42sHrj3zxX/JGx1JSCmBO4dScIwFylN8bUGH6rEOFSjY2kt+hqmtsRtGSSWKnckcxfGUg0REJowfURZVPRkbejmsSHWHYFhHmtZQD5VVezPpopbd7vDUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6655.namprd11.prod.outlook.com (2603:10b6:806:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.25; Thu, 25 May
 2023 15:13:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 15:13:46 +0000
Date: Thu, 25 May 2023 08:13:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:a03:80::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0e8c63-fbcd-4452-f01c-08db5d32a24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtikxPoJ7tHnPvZ8pZDmfvWhQuuROmOFR9ZeOyjQOw6oGQfRwz6Apz7h9hO6N4ftMnFPrUJSx1pzIp3nReKYox0NUEj4s7Svb60GiHOB/+sR5sQNyA7sOUOJ1pxFz3sQ9eVw/448HTdKTTFP5Lk4F9nynV6gd/eQXOXySElksBcC7Y5FSyepw5Go36ALiZDKCI022ED6A+J1/yl2zAMOqOV4JDWNJJ7cjJkaS9ZAqWR9E6t9CW1m2BcoGwxAGnar0xWKAX45haeItUCENLW5qkGYyws+0Uf4ZeCpR0vcy9GmnNN8Z1yOB1mIx8aCLUlpX0gV/oBJN7yC+zjZ70oma0+C/1yf6Wpn8UzSXysb3z5A9dABA0sCfG43RNH4kTwjrjriPBZPGhRljmWGABQ6brv5jPOAg4g/ySqj4OR3bnUpuGrf6gSw7/UR8+Oqo2Xp5WwigsK77ETOzc9HzWjbASb4xlP7lAdawYKeq1i5n7bZtB7hpLhWAVdFytOJnxlwKRUJG8X+hpgVWebhjD54vFYx6Ygcuo07vQCa+Lf1QhJsyij3CGR9Oz8jnmS96Eh1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(316002)(54906003)(38100700002)(66476007)(66946007)(66556008)(4326008)(6636002)(33716001)(82960400001)(41300700001)(6666004)(478600001)(6486002)(86362001)(5660300002)(6862004)(8936002)(8676002)(186003)(107886003)(9686003)(6506007)(6512007)(26005)(2906002)(15650500001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jCY+YhoauJUCEPlUJTF5nrrFHhvY/V56gJFWAk9gkfckYP2F+fF0P00OgD?=
 =?iso-8859-1?Q?U2KkRbHlcP8q0HquPScx01cR3cqvAnpydJ5xfe2G4g8u9aGyTrQWigNQDT?=
 =?iso-8859-1?Q?f14TRNDGW0UaFRQXpMXBu+B4Yoeu55hgA9dcZ+JCJSBP/MsY7ZZpiNjyel?=
 =?iso-8859-1?Q?T1N1lh6gl4WM19C2GoD06NJ7wERS6ZMGSWUGvbv9uygyH3TA8rlRzGPzVp?=
 =?iso-8859-1?Q?ie6s5/W5Rx9gBQj8w7Keq+tBb1YEH0ifjj+kCPuKrG8RIsYjgHYqfVj1cP?=
 =?iso-8859-1?Q?tP0MTj+Er0NP2q/Xsj9Aw1iUw0Q1CqZzXtIRAye1kElpj0Op7Lpe/q6N91?=
 =?iso-8859-1?Q?BhaAegJr6cEHxl2vfb5nJSzKVpCsIWz9DD4o1vLW8L21lrcgoMGEzOSdse?=
 =?iso-8859-1?Q?b7da/0xbkbYU03sXxgaI4e2kUInka7G+k06Ma4W3fbwxT8zIKNw7rov0X5?=
 =?iso-8859-1?Q?VvY4N5rCbIVZEuMaWrFNtKrtFM5jDZVg9L/5ie3/EsnDoFNmxusbezaSSs?=
 =?iso-8859-1?Q?KrBx9Ebt2GtwCa4bI7u2MQgUbV47JKxTgfb7OHWgvauBXK2jfpz7WbSB2r?=
 =?iso-8859-1?Q?af7icxzeuhmI8UWrnkzdmqNA4YWNzr/5WNGW56+RRnUQ+S1s5fLax+lVte?=
 =?iso-8859-1?Q?Do4W2c/ljPus637Sv4vMHyESILp6g0N0jrJfS5xE6vVogbAb4QupsMXUeW?=
 =?iso-8859-1?Q?Qgx8iDwQMdJCuNif+066KUXWdlV7ya+oQ1IQbrWmzHQln0nshx3j9h4XDx?=
 =?iso-8859-1?Q?lFWKO2DsGU5v4AiYPkodB5BMTttffwvZYaqF+VHm50pF+L0SJe/YyTud5n?=
 =?iso-8859-1?Q?e5m70ekapnLiJOftMOWgcsrh6NUXhqWyn8u0ZLIMniNVjddyM/XfHkJxpP?=
 =?iso-8859-1?Q?Fvu2vMzLZAyU+bn677exNaKuX/IMgM0Qh8GIBbAGQFRtPkCx7iwaYD40AK?=
 =?iso-8859-1?Q?zR/MsHW2JI35OC5QsYZekkUkheVrMXryApbCdGmX5rpYSCST0k7fEPW1Az?=
 =?iso-8859-1?Q?WoNMg/bUwacE732WJjHN7U9GUjB9To1kO3wYgZhy/ypQuQECIm2lf2zb6Y?=
 =?iso-8859-1?Q?WwNWKG81V11VKHb9eqhKVEE5h1BiSbQDPbkyyQ4/476aXtZaWf0/pa45S6?=
 =?iso-8859-1?Q?63TfHjeHpk1EiKykBJwmAFWUV8gIwYWaaSegei4KcZ5gmsNVwjgZoU77O6?=
 =?iso-8859-1?Q?sthAEt6hliUYANXGWfh6GTdaXNRTxGFxry5670wFXO/Lwo3C3IAYytlXVE?=
 =?iso-8859-1?Q?Qa20scMOLisKsLpZy6kfsR03eCirmOsrUOR1eE+rn7d2Cab/CxlsSi0/kz?=
 =?iso-8859-1?Q?3jB3Xf4Seno2Sis3GMKj10B1U3VT79cpaCPOw+yt1u+q58tov+9JHH3wJr?=
 =?iso-8859-1?Q?j5AN4uymwxteQYrfaNx/xK/Xved1kYUJYIh7+x7erZh9srHoCHm5HKFLPH?=
 =?iso-8859-1?Q?DhV4NBKIwTjT6TpGIyFhnkSmzLNGNtq7/46km4SARrQN1teKDjC9zGvr8/?=
 =?iso-8859-1?Q?zAMyyq3qVxVavAKvyl/IMDBhBcO4/dczQXtn1/agDds5mQqbDKT8R3MaOL?=
 =?iso-8859-1?Q?42VlprPphdp0KtJuY3RaAl98kzT10VMPHiud2N+xsjGiKgcqkl13AJwNNA?=
 =?iso-8859-1?Q?oZ5oXSSl9eCQB8eq5l4EwYcHuKvv6OszBLmBehl0pr7oP+e3wiTfgb0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0e8c63-fbcd-4452-f01c-08db5d32a24f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:13:45.8804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfqcShjf/4NIV2YcP/gcJF7VNysvuN7crK+kCfFhOIHSpi2Dm3gxXYKcHBFpZASnkrsNmyIetxicgYIrXcjSze1131O6OH7q3WfB6x+dwng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6655
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
>Hi
>
>Planning to push this today,
>Christopher already have sent the Mesa MR and IGT patch series.

the whole point of this series is being able to fix it without having to
synchronize with the mesa / media / igt / intel-compute updates. There
are some reordering in the structs that would better be done before
applying upstream and when that is done, then we need to sync all the
UMDs. But not for this.

Lucas De Marchi

>It should not break 64 bits ABI but would be good to update intel-compute and media as well.
>
>On Wed, 2023-05-24 at 18:56 -0700, Christopher Snowhill wrote:
>> This series takes off from mlankhorst's attempt to do the same, except
>> instead, it tries to be as minimally invasive to the original uAPI as
>> possible, by only inserting padding where appropriate to ensure all
>> 32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
>> aligned. This should have zero effect on 64-bit hosts versus 64-bit
>> userspace, so existing native software will operate the same with or
>> without the update. The only real change is 32-bit compat support for
>> multilib userspace, which was previously broken.
>>
>> Also introduces field validation against all of the padding and
>> reserved fields, which must be zero, in a separate commit.
>>
>> v2:
>>   Removed extensions checks where there were none originally. (José)
>>   Moved extraneous parentheses to the correct places. (Lucas)
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Signed-off-by: Christopher Snowhill <kode54@gmail.com>
>>
>> Christopher Snowhill (2):
>>   drm/xe: Add explicit padding to uAPI definition
>>   drm/xe: Validate uAPI padding and reserved fields
>>
>>  drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
>>  drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
>>  drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
>>  drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
>>  drivers/gpu/drm/xe/xe_query.c           |  3 ++-
>>  drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
>>  drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
>>  drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
>>  drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
>>  include/uapi/drm/xe_drm.h               | 34 ++++++++++++++++++++++++-
>>  10 files changed, 85 insertions(+), 16 deletions(-)
>>
>
