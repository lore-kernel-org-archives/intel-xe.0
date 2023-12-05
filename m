Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10AC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 17:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6B210E5D5;
	Tue,  5 Dec 2023 17:26:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512110E5B9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701797181; x=1733333181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DjXMLxovLc/7yvjthY1yrMvL0w+dBr345G1JIgQDl/0=;
 b=fIR8kV2b1/JkKlfsDEIML3CBsmaWNZr8IxNDFHgjSC1Nt+V9adAUHsta
 AAEb4awq5d+dMhnO5EgcBFcquSvIq83UjslVCulAGii7XoNS3H97NDrun
 oW6nluROx5VjJAqNULHeHab7eEJ+4J+kJ+HM/wR5hQgrU9HBZECGTi1P8
 /+al5zGjIktCeqSClioBDzgUWRTY3q90FpCltWbjC+8I/B4++0DpGlhOa
 zWTlYT5SRg0nzbNoDEo1Lj/cEUBm6riqp59tgqRGWtsB5pnjv9fyz77RO
 f2xbslTFy9ViV/6aHwzuqP3dCMcEQuFW/TRTxEZzHMv5MB9clKI1JUCD5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393662603"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="393662603"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:26:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805342242"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="805342242"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 09:26:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 09:26:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 09:26:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 09:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5YbtBxRXe94KVCN3dBu2QGRs8gDul2DN/KdTqEkJC+8u73kh5eGqP8FHzHn3WA34YdCGfvYSF18MhEm/atuyXbxX6YWXKqLNLrLbW2IVCW2NWuc7OgPELrPUDMsLr94g4/ooLWEdHZS5tW8AyYXkY7sa3PSVnwMagI6UzMX0m9uh4BM7wTp3dPdc+eMr3GGP/wi5Seah89C3tMqW8aKbsy9dTjUVtqv3WIoQYyPwxGSjTOs/NQcYbMD5HtkktN0OCzzTmI98KizraEAgbccayaot3X1Mpp2jsXOBPvammf1ooxqGyGagZrf2h9cpJj8aZEOCcHbxjujL3eKzgfcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEAsPdPZeh0ti3gz3wngOP2ml2+ahaOMgv1W/GA61Pk=;
 b=AqEPRiu19saASJBjBysO62hR6wqqv0+BcqgP8iExx/SkC0bsyEvKB6BDCCG1nXn/G+/eu2gW5u+3T0jfaTGmHgG+tYMcRGU51nAKV6eekMXnwf479KCNnYVT9X0cM+ER55UfencnihG/eYGbHSjxzobczf7hP4qJFUM4AIsKFDYvnuKMJ1/RuoP4Ebr3w/xz2mGtNG1t5UM7p9KkQBHZv1T9/PFzaffngdL+7GNQzd8xlvpvfhkYNd55SeLYjr0BreHNNkxvf848Ed0eCh7zEVaN5HYjJDmBR28RMSgYiopAcdKcoNPPrWZfACb940DuNJxrOCNRwJlKYy/tgsV7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 5 Dec
 2023 17:26:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 17:26:17 +0000
Date: Tue, 5 Dec 2023 11:26:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <hvryv6lm23gj4lz6wpdyhhd2x65ntrmwugdedm276i4zswospg@4lgyd2lxcnpf>
References: <20231205112717.1349830-1-jouni.hogander@intel.com>
 <170178179552.24283.8397006447644198745@emeril.freedesktop.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170178179552.24283.8397006447644198745@emeril.freedesktop.org>
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 23278509-9102-430c-9acf-08dbf5b74a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIMDm7r6c46ZKhtQw3MRG7aljGpGvox+Sol+vd/2pJH5Cmnnc+9W5/g4zPQfphLHiSjPQdTA/VTUeJP3D0FfGFJFdLtPfF3An2X96ty0Ony0PU7S65CJ0tViAj0stpxh8Sa9V/+8qXbbg7/ILtaZuLBcNj7T6YP7BUGvDXHvDPPTCJ8EeqjJ8jAugaYyPsweOYGY4piU5LFnE56Oi5nr7IJ8H6BiwaSGFMXEdosWdhVJ3DkI35L7KAPeZ23VtMOV/j8kH+wjaD6S8uGwd7pYtr1M5mJv0vvfOOOy5dq0vXYYs/vkEJ+Hd9PtI1xQOqH5NnEm2FZgKHp67XrFZg0pY4kRen7eeoZb/5STzWNfgiu9l6KkPuvHPWfCJZsLIzQyDUwM1AVZxre8mPBu3/fC+W9EyJpCb/C+vOfMuaD0pJWyBhEz+6L+vLjU+SpLdhdvDg+y5njDPinczHse+9JeNr4cBoqtSD0Fh/yXHJmoTCqyeFLaEZCnk3VxaqOb3Q3dqyMQVRhNt2POtx5ue1oGIHTAxGQepnbALsVbcS8mpnu2DRXloi/9QYHt3v8b2zIoUI3GXiHSzQgPj13Yd9gAEOu0hwv0kavP89uAqG3cDDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(39860400002)(346002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(82960400001)(5660300002)(38100700002)(30864003)(2906002)(86362001)(4326008)(8936002)(316002)(66946007)(66556008)(66476007)(83380400001)(6916009)(33716001)(6512007)(107886003)(478600001)(26005)(966005)(6506007)(9686003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBGekFsdytZRU5RTm5MYUZIWjhvOEVEdmZUODBrKzN2d2E2czF6ME53MzBj?=
 =?utf-8?B?amIwOTBUK1hrYnpGUmFQQnl0dExLVGtkTldIR0hEbFdMN0RnSkFPY2N6U2NE?=
 =?utf-8?B?ZnF6cExFekEzSXBTUW40bU9HVlJST1duS0F4MlBBazlEQnYwdEU2bTJnQU0y?=
 =?utf-8?B?K2xLNXM1MUZRcjFJQm5RNFY2R2s4c0FUOFZZdHJ2eUlzRDIrZHRha3A5V1hr?=
 =?utf-8?B?VHhvd0R3MDlXcmliaEpZMGdTU29EZm1OTWx6Y3pqOFdpdTAwUXJTLzZIdFg2?=
 =?utf-8?B?SEVJZXRIbVUvMk54MGJBMFc0Nm5aWmdWNkRVOWZaU0o5bTQ5cS9kQUJlcEth?=
 =?utf-8?B?MkpDWURZNy9wSlVxU2ZjTHpSL0xMeFZOWXdiNTdqU09IdWlnZi94L1Vnd1Vy?=
 =?utf-8?B?dFU3dVMrN1RnQVNCOXZTbVhwdnZUM2ZTcVA4YXdWdjRuaDJCZGVUanVHeHdM?=
 =?utf-8?B?U3FpMVZFOHI3MkpBSU41SHpsZkhXVy9XODFuMTREUUN3TGlIV0JyLy9tN0dN?=
 =?utf-8?B?dTEra3laY0Rkb2VNL3Zrb1FJNG55OUlNWERTQVBvRHdTdGRZNHBKLzhIbDh2?=
 =?utf-8?B?ejdLYWxVeDFycUpYV29aTzBsSVRVVHJOK3pkYXdRYWNQQUlOWFQ4OWgyTUZN?=
 =?utf-8?B?ODBRVnI3ZHhOMU1qblpZNjdXNzdJVVEvQ2lyVlptT1A2bzlXVjZ4TUgwemVi?=
 =?utf-8?B?MGx2YStKQkRoTjBMQ0V4ZW5DV2YyMFdhaVN2RUcvU29nVnFqR09kM2VyZUZK?=
 =?utf-8?B?NnFFL3ZoTnRLWlUveWZJWDM3RGdvclZDN1puMUoya210OXJobFlLS2xSUm0y?=
 =?utf-8?B?SGFNakYrS3gvNVk2YWk1Z0dqWTJ2TEpaUTVpTnVJRTFRaDRRZW1RQXpuS1VS?=
 =?utf-8?B?MnUxRG9CQzFYZ0hucEhEcG11RTBvblhzSWVrL0U3MVExdThUY0RxMkJlVG8y?=
 =?utf-8?B?VDlaa3VNeVlRaG0raVBidFFkTXNZMFoyNlJWaDk1c0UzTVBpRTMzL1hpcFFi?=
 =?utf-8?B?Q2N5c1gwYVFWaUphNWRMNms0U0E4L0luS1k4U1VnUmEzYjRDSHVYM2FPVXow?=
 =?utf-8?B?WlhaWDdrZ2oyak5WTk1PVCtFT3V4SHlTdXdIN1pPclFyN25NZ2pYV2sxWS9t?=
 =?utf-8?B?SEhzQkxtc0lCRGNTdXZyREhwYkRJWStBbDNpeGJSTE81UDNKUm9kclJvM0hZ?=
 =?utf-8?B?UGwxd1hxR0dFZFJacjZmZTFNbkczelRET1kyYlhJSFkvYVdhdkFYZTNnVEk1?=
 =?utf-8?B?ckZ4ZTVRK0RXMlZJNE00VllibldndlI2NGpmWFJWZnkvc3o5UGxEUG10cXJV?=
 =?utf-8?B?Y2ppS2xHYWVyM2l3Um1nL3JCaXllZTBxSFZKOSt0VnQ1b3ovcDJJNnFnVG5V?=
 =?utf-8?B?dHdwdEZPSURQczNrdlRvdlJEeGZsVi9Vd2pSUkhUR1VGL2Zwa2Y1SzYrL0Ni?=
 =?utf-8?B?M0RRSnVvRnVVVFZyMm9sTFBHSCtIRW5ISkZ4NGNCbGhhaEVqU2ppVmlxTEc5?=
 =?utf-8?B?aTdnQjBpS1NNM0VWTGs4aEZaVWdBaE1BWGNoay9mQW9BbnhOdmpmU3VkN1RK?=
 =?utf-8?B?OE0rOVA0QWdhMkRHM2FEMFBPWno2cmJCOTMyWjdPMFNaZEpSWVlnNElOOHN4?=
 =?utf-8?B?dVZrTURLdXRlYzJ3UCt6eTM0bGkrVEM0Vm40a2pFUzBwZWYwNFR6a3FKRE9w?=
 =?utf-8?B?YWRnU01kSXBvdmhCOGpjL1FHOXlKYXNJZDUxWGx2OVh5SE5pWlBlc3BUZ3kz?=
 =?utf-8?B?YjZsK245VG5COURUYU1TUUlGd3FqbmxGQ2tjZFZ2TGtUZ3ozdXBJQ1JvMzk2?=
 =?utf-8?B?aE1CVllTMVdQMGFIY3BVeWpQUi9iTEJYeHBwb1J6NERiNitZSmJDRUpjT3B1?=
 =?utf-8?B?aG1uTXFNbUNkTm1pa2VHcHJvN3dXRlU2Y2tkendlakNHbnpteDJOdndkbU1L?=
 =?utf-8?B?RStMZ2NCQlZrM0pRVjEvbkl0azVVS0VuY0RLaTR4cnZSZmtSdkMrWFpaMUVT?=
 =?utf-8?B?VDhoKzE1RlhTU3N3elN6T3I1L3dsYUpjSG9UNk1WbzVKM25SWkZwTzdUOW9B?=
 =?utf-8?B?bGhNcjREODA1Rjk1Uyt4T0lrcXlibjB4b1B4YVdEQUd0eW1XR0VOWC81UVdz?=
 =?utf-8?B?TVY5QzFmUlZ3enpUZ08vTUlWazBkZURaLy9VNG1odmJZelZLM0t6Mk04Qy9N?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23278509-9102-430c-9acf-08dbf5b74a32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 17:26:17.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxWCkLwrldji4D0smC6kcCqvUdg7kDDpawqMhvp2mK7/HfXXeSM9UBzllVZ+WB2RMyYtL0gOro+Resc6KAy1ev70I7iXrre2cbTtb+Bv0WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_Intel?=
 =?utf-8?q?=5Ffb=2Ec_refactoring_=28rev6=29?=
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
Cc: Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 01:09:55PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: Intel_fb.c refactoring (rev6)
>URL   : https://patchwork.freedesktop.org/series/126505/
>State : failure
>
>== Summary ==
>
>run-parts: executing /workspace/ci/hooks/00-showenv
>+ pwd
>+ ls -la
>/workspace
>total 932
>drwxrwxr-x 12 1003 1003   4096 Dec  5 13:09 .
>drwxr-xr-x  1 root root   4096 Dec  5 13:09 ..
>-rw-rw-r--  1 1003 1003 801136 Dec  5 13:09 build.log
>-rw-rw-r--  1 1003 1003   3129 Dec  5 13:01 checkpatch.log
>drwxrwxr-x  5 1003 1003   4096 Dec  5 12:59 ci
>drwxrwxr-x  9 1003 1003   4096 Dec  5 12:59 docker
>drwxrwxr-x  8 1003 1003   4096 Dec  5 12:59 .git
>-rw-rw-r--  1 1003 1003    813 Dec  5 13:00 git_apply.log
>drwxrwxr-x  4 1003 1003   4096 Dec  5 12:59 .github
>-rw-rw-r--  1 1003 1003    233 Dec  5 12:59 .groovylintrc.json
>-rw-rw-r--  1 1003 1003     78 Dec  5 13:09 hooks.log
>drwxrwxr-x 31 1003 1003   4096 Dec  5 13:09 kernel
>-rw-rw-r--  1 1003 1003  41148 Dec  5 13:00 kernel.mbox
>-rw-rw-r--  1 1003 1003  28940 Dec  5 13:02 kunit.log
>-rw-rw-r--  1 1003 1003     48 Dec  5 13:00 parent.tag
>drwxrwxr-x 44 1003 1003   4096 Dec  5 12:59 pipelines
>-rw-rw-r--  1 1003 1003    793 Dec  5 12:59 README.adoc
>drwxrwxr-x  3 1003 1003   4096 Dec  5 12:59 scripts
>drwxrwxr-x  3 1003 1003   4096 Dec  5 12:59 src
>drwxrwxr-x  2 1003 1003   4096 Dec  5 12:59 vars
>drwxrwxr-x  2 1003 1003   4096 Dec  5 12:59 .vscode
>+ uname -a
>Linux b2913b285b60 5.4.0-164-generic #181-Ubuntu SMP Fri Sep 1 13:41:22 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
>+ export
>+ grep -Ei '(^|\W)CI_'
>declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
>declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
>declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
>declare -x CI_WORKSPACE_DIR="/workspace"
>+ '[' -n /workspace ']'
>+ git_args='-C /workspace/kernel'
>+ git_log_args=
>+ git --no-pager -C /workspace/kernel log --format=oneline --abbrev-commit
>11e7835c5 fixup! drm/xe/display: Implement display support
>12527c308 fixup! drm/xe/display: Implement display support
>ca2ab80ff drm/i915/display: Add intel_fb_bo_framebuffer_fini
>cdd7cf187 drm/i915/display: Split i915 specific code away from intel_fb.c
>4ef8f62e9 drm/i915/display: Handle invalid fb_modifier in intel_fb_modifier_to_tiling
>7a90c0e2e drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
>e027a49b7 drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
>8cb436784 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>6781ab7f1 Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes"
>ac7b89571 drm/xe/uapi: Kill exec_queue_set_property
>run-parts: executing /workspace/ci/hooks/10-build-W1
>+ SRC_DIR=/workspace/kernel
>+ RESTORE_DISPLAY_CONFIG=0
>+ '[' -n /workspace/kernel/build64-default ']'
>+ BUILD_DIR=/workspace/kernel/build64-default
>+ cd /workspace/kernel
>++ nproc
>+ make -j48 O=/workspace/kernel/build64-default modules_prepare
>make[1]: Entering directory '/workspace/kernel/build64-default'
>  GEN     Makefile
>  UPD     include/config/kernel.release
>  UPD     include/generated/compile.h
>  UPD     include/generated/utsrelease.h
>  DESCEND objtool
>  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
>  CALL    ../scripts/checksyscalls.sh
>  HOSTLD  /workspace/kernel/build64-default/tools/objtool/fixdep-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/fixdep
>  INSTALL libsubcmd_headers
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pager.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-command.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
>  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
>  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
>  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
>  CC      /workspace/kernel/build64-default/tools/objtool/check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/special.o
>  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
>  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
>  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
>  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
>  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
>  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>++ nproc
>+ make -j48 O=/workspace/kernel/build64-default M=drivers/gpu/drm/xe W=1
>make[1]: Entering directory '/workspace/kernel/build64-default'
>  CC [M]  drivers/gpu/drm/xe/xe_bb.o
>  CC [M]  drivers/gpu/drm/xe/xe_bo.o
>  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
>  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
>  CC [M]  drivers/gpu/drm/xe/xe_device.o
>  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
>  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
>  CC [M]  drivers/gpu/drm/xe/xe_exec.o
>  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
>  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
>  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
>  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
>  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
>  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
>  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
>  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_huc.o
>  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_irq.o
>  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
>  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
>  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
>  CC [M]  drivers/gpu/drm/xe/xe_module.o
>  CC [M]  drivers/gpu/drm/xe/xe_pat.o
>  CC [M]  drivers/gpu/drm/xe/xe_pci.o
>  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
>  CC [M]  drivers/gpu/drm/xe/xe_pm.o
>  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_pt.o
>  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
>  CC [M]  drivers/gpu/drm/xe/xe_query.o
>  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
>  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
>  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
>  CC [M]  drivers/gpu/drm/xe/xe_sa.o
>  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
>  CC [M]  drivers/gpu/drm/xe/xe_step.o
>  CC [M]  drivers/gpu/drm/xe/xe_sync.o
>  CC [M]  drivers/gpu/drm/xe/xe_tile.o
>  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_trace.o
>  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
>  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
>  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
>  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
>  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
>  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
>  CC [M]  drivers/gpu/drm/xe/xe_display.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
>  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
>  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
>  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
>  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
>  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
>  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
>  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
>../drivers/gpu/drm/xe/display/intel_fb_bo.c:54:15: error: no previous prototype for ‘intel_fb_bo_lookup_valid_bo’ [-Werror=missing-prototypes]
>   54 | struct xe_bo *intel_fb_bo_lookup_valid_bo(struct drm_i915_private *i915,
>      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~


this is failing on all latest revisions of this series. Have you seen
this?

Lucas De Marchi

>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
>  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
>cc1: all warnings being treated as errors
>make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/display/intel_fb_bo.o] Error 1
>make[3]: *** Waiting for unfinished jobs....
>make[2]: *** [/workspace/kernel/Makefile:1913: drivers/gpu/drm/xe] Error 2
>make[1]: *** [/workspace/kernel/Makefile:234: __sub-make] Error 2
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>make: *** [Makefile:234: __sub-make] Error 2
>run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2
>
>
