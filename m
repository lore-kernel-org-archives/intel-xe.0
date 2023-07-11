Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011F6EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 16:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23CE10E3DC;
	Tue, 11 Jul 2023 16:19:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62E710E3DC
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689092383; x=1720628383;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HCpMTg7FKELLfRrsicNOkuL8xEpawnxIsGuB/ysDT8M=;
 b=W3hJT/ER1g5byEmhP11ZY2klQyWDj2HYfMf0kmn6FWlo44rc/I/A7KMp
 1ofUmSojeZbPcvabNqpGCxgVx0Q6dkktz2SThh6Mfwn+NJHG/WgW2rrTt
 WcrPt/2/gFhkJCocmlOm+r/6ip+Xo7s8kw4mZ1jYfLLwlSFraAk7vaRE9
 PqVqlUHu7NceiMs9h1EmT3Ipcp2P1eZR4jqorzY8HnOQDxz8HYJh6jTS4
 2yjosQFzTFTXZP4Q+LbNlWTcLb9F0fIsWwHI+sDz+6ryPG6ZAK5H4PV6V
 t8E2UM5UiK6cxtettE8rBhVSIwd3f2Im8SQdJSbsK8+9LSe8aVqB+QnMD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344265684"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="344265684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 09:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698471939"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698471939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 09:19:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 09:19:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 09:19:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 09:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3I98xJf0cx6NA+2G2sZ7hTuWhAMCQW67NkcdaGLoeyCh7Fu2eBpKPRXzZRTantDHJt5ZhB56DpZ7aT/KiY/SJ42UVSiHj+uCbG1h99zt+DlyXQ3pkfDZgtPlDW+7QZJT9pd1lNDOuTI+v8OkhiUVGXTKVkaLHZArh3L433JxsM6SyqKPGsaELcTD06ioexeIFO48lf/26FmhgRP14ptErwhYfnPVYLsjNP3SLQs6QI6EM/L92cTwMTw9rS44a/ATbgasFT01DR69YStEoHclhlDSOfFnxf2ccomfIM1GwAY0i2SG2VPfek2gb3b+FvZG8V0j4eFDCSJewHuZtZCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83np6PwI+TV7QlvFzKUjwG4YJOU6drkyS5W8QIcwhlU=;
 b=eV47n/QE8yx4xLaKtZDuDHQLX5bUf+00IKTBR9zg2T/EXanxJrboUHeUUtBqbBqmmiY629KnLLoREpkHix6jXoD0H2fptMFO+9tFyS39jw4clVZvjmy77LBFg9vnLclcQzC6NEw8MJS/OkO9+n9NO1zZoTOTEzwJ0hQHMABNiHV05U7uo4VfGMkrLAt9yvq+Kl1IRT+E705nssNIZJ81KeomWhDPqSskLoRLiSnmVtqrh3klieUrzkYklAoQ9NEQoU9JZZkr4JIs0YPxrHq1BUZlCyZvfAaPXN5hLRFAFsd5KFChkLF9ExMua0vTkKpXFAgG6n4IhaX4bNyfn7a9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 16:19:34 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 16:19:33 +0000
Message-ID: <266f491a-66ac-083c-990f-bc99c42883d2@intel.com>
Date: Tue, 11 Jul 2023 21:49:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <878rbsckzf.wl-ashutosh.dixit@intel.com>
 <3c4bec6c-7af0-ade7-91bc-bbd3bfa46357@intel.com>
 <877crbct36.wl-ashutosh.dixit@intel.com>
 <953a6abf-5e07-ef87-667a-57ceef40369f@intel.com>
 <BN9PR11MB5305E0D08C2C1705AC72BD5F8B30A@BN9PR11MB5305.namprd11.prod.outlook.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <BN9PR11MB5305E0D08C2C1705AC72BD5F8B30A@BN9PR11MB5305.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::16) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b5e3d0-e085-4437-3a1e-08db822a9cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /s5ptbsC1MWGXLzTLf4cFv7XUsnzNi9ZxKoyuXNpI8au1V8uxdVQTK+rB+PXbvuqqqqaFgmVecDn+p5TccGoTeLseBtog1oi9p/q9fxvFGzjXtnC8rdZBatjO1YnyQLQheS46U6godN1bFXU+zxb/3k86t2s+GL9JshKJfkkUM9OxSUG0hDVkc/dKjRt+UZrr6y3WHmBP6m2uXle78IDIMvMmKn1Ggry6lDMECaFnSV2+YCx+6PFO8DzY8nLydx6h1P1xcNxPGPP5+wAhfU9R26LZcOvcK5+PGVtS6q0lUnDKUG9D9rlzwgaD61Ji1mMtsX6jCxpEsqA3dHRucMXohVTXON+I1q9PPukvGjSs+9t4GX9PaEdHAaxHnviXaDvzm8jlEhHEyS7eZAXEMduuMkW0DnUHcY4m3J0EISf1ynGmp5Aewb5O77pglBRPiO7rSimmGsn06vLRrMvDyFx8Qp+gabdmWKJIwSIbRa8NIAttjhi0ohlVIfmj9BxPiGq6UK/PyHQwwnwRLPVgWx6hFhuVhMoku+uIs7JujE9vJhzNTtqDaqqAEdl5sPpOwz8njp5KF0o9CKNoWx9JaoMiQfpvH8eftd6mUk1drdfVK1CNrXy8EU8Yd7wR3r/R1Ac2cb0u4u82ndMME88Qp+U5C6A379Og1Unc5ur1LyJ6/f34FSQv8RalUUzdz+HcD+k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(53546011)(186003)(26005)(6506007)(966005)(6512007)(107886003)(2616005)(6636002)(41300700001)(316002)(2906002)(66476007)(66556008)(5660300002)(83380400001)(8936002)(8676002)(4326008)(478600001)(6486002)(6666004)(66946007)(110136005)(54906003)(36756003)(16799955002)(82960400001)(38100700002)(31696002)(86362001)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U21WVzViVXpsOEZPWjZBd2lHTllmSTJsRkxsUzVsR2RORnVVS0JnYUNiOFB5?=
 =?utf-8?B?M2NkVVNqanFmQkpyOTVYUy8yeS9qWUVncmpTODdiK1U0THVDRkJoaVIwQVYx?=
 =?utf-8?B?dFhvTjJjMDBKUENwMEJWL1RSSzV5TC9GNDg0ZTd2dHo1Y0g5VDlXWjI4R24z?=
 =?utf-8?B?QmVyK0NSSFRROVZSWkorbkZkWEU4bGp2SlEvbkpFSWtQSitld21lSXBYeFla?=
 =?utf-8?B?eGNadEF6RmFkQ1NNdFBRSUZyTnpUd2ZwS0NGRERJdHRRazRDOW1ndUF2SWlx?=
 =?utf-8?B?NDdJMnlHQStueXJacnFINU9RZWIxMTcrbmpIWVVZVDd3cndnUEhDWEVlUjg1?=
 =?utf-8?B?RVdqcU1QeGVhQm44RG1GbWFQbFB4L1NRRGNlVlUvSGlBSy9iVWFHaFVTdWVN?=
 =?utf-8?B?SUZTalpFSms3TEc3Z2VRU2dIUXF2Y1p0VGdaczhzcW5xZGNLb3RPYmV6aEJm?=
 =?utf-8?B?UzNad3VweUprdmUxemJnYk84VlFrNDZSVkUwTDZDdmZXYkVkZzFYSE5XSVpT?=
 =?utf-8?B?NUZGV0R4VkZtTm5aOVdNMmwvM2tJekI4cU15aHZCSHNHNTNzd1dmMEJJWlR2?=
 =?utf-8?B?VTlxT212bUhYbDgxNC85dmpyUVdFNkxDOEVyQkVCRW5ndmdFOUdsZy9IOHNi?=
 =?utf-8?B?OXEyNkdjclJPVStUeTJvc1ZrT3YzTnFZVHBaRmdJRnY4Tmx2bUFJSGpaMDht?=
 =?utf-8?B?akpzRDBoV0RXMEw0a1ZEMEQ2ZDEwRmJDN0ozWGZKaDQxb3RQMVpnK1lwSWUv?=
 =?utf-8?B?ckoyalhOVDFYMjZENCtOL3JwbHVKNVJuVENOcWNEY2pGZXVxa2E2VkRDbUo5?=
 =?utf-8?B?aFRtYkx0VFJmTWRyUTY0d3d6Tm43MEJCcmdCMFlKY2F1YXlCRitkdHlSRlpP?=
 =?utf-8?B?QWFLeUJONGpsM3UrVnljU2lhYUx6WWhoZ2puTlU2bXUzUlkyM0hXd3A1aFZM?=
 =?utf-8?B?cTZUZG9vZ0NHSS91aHU4U0diQm1LdWpPUEpNMGRjY2dNRksvbVVKNWRkYUw5?=
 =?utf-8?B?aUhXSXRnYzQwcVNXejhQamtlQk9ORTY4czdjbTVnOXY0OE5tUDNSZWlGaDFq?=
 =?utf-8?B?SDh0eVYwbjJvbXUyVFNLVllTakdBbmhvaDhlaUNZWnZjZ1BvVC9DNlJncjJp?=
 =?utf-8?B?aWd6eGpZZDBMdmNBcFlBWDBBV0xJaE1HaURTaEZCaTBtU2hTSldTUFJGMlNH?=
 =?utf-8?B?eS9pNHBnbm1Tc3pmdUE3a2FUakFCYVhGMXdJZEl0MW1OeDk1WXdFMmJuanoz?=
 =?utf-8?B?Z3ZlV25oKyszYVR0aE5lckNtcmlWUlRiY1I4VUJLcExUUlFzRlNVaXV6WHJm?=
 =?utf-8?B?a1JQN2syU1BkVDJYT0JDdVlYaEJPdEdrNFQ3SUd0N0FTM2x0Vi8xQUJnQ25S?=
 =?utf-8?B?WTEwOURaUzkvdGp0VVBZbFBUdFpKS1lmN3lJdWdyTE0xTnBXZ0dxckpyL283?=
 =?utf-8?B?clpIN1lOMEFzZ2NNSTk0MjNNaUMzQjhSeUtrck5id003ZVErZmxiQURkUSt0?=
 =?utf-8?B?elFqWXFiMEpURWFTWmJCbWZMVy9GUU9XYm45TnNWd2Q4b1NGa0FaYUVnNGJM?=
 =?utf-8?B?aE5CUGwyY2QyVDhpTFF0MFc1Z09UYlRLMXZoMkFyejJxOSsvZTY4NTVjaTl4?=
 =?utf-8?B?RTJ0Y1RuVnZZenRydXg0MkZ5aGhMTzBDQUtMQyszNmZ1OTJNa3pta1RzKys2?=
 =?utf-8?B?VmZGQzYyVmpBNTdKNjJ1Ujl5ZEx1OEI2SzZpZjVhd0hOR254SUxxUzNCcFFB?=
 =?utf-8?B?UTFDbjRVRkxDc3Vya2JvVXhmc3lFNFVrUTRoZDlqNmw3TlFNWGJIZnoxN1JB?=
 =?utf-8?B?REtmdythOTAycThxZFBEQjFnbVQ3WE5SRkg5eHNaVWVrNWd4Rk5VNTM3dHlC?=
 =?utf-8?B?aFB0cTRZcWNjbEQzZWJhaGphT0NaZ0JETldNZDBZM1BLR2dma0ZzeklOTEFa?=
 =?utf-8?B?V04zbEl2RGNjTTJicFVtaUVZRmZnaHVLL2pFaVBISkdSMEZicTA4UkhUREZH?=
 =?utf-8?B?STJFMjEra1c2aXFVVUk5MDZoUEgzRFhLclBGemNkdk8wWEpoV3RBbGl0MjM3?=
 =?utf-8?B?MHprQ2Vadkpoa2dtby9vc1FhdGFDNzFaZmliSk1ldXBMYlhNK1k4T21VaHVH?=
 =?utf-8?B?SHJTNGh3R0hremx3T2xyUGwvNVB1Wjl4NnJXdHdkMU9MVnh3UHA5WW5JeDVl?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b5e3d0-e085-4437-3a1e-08db822a9cac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:19:33.5561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueoLEjSYaUJFUPJt6ljqG/Mk2duBLx0oEiZ4e2s4SzSeSnezdK2C6N0r9DZWu2GL8Wm21N6MwhdjXfdhO4ctX7Vz1qcCcJ5bVxmrwUl6IJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Ashutosh,

Please let me know if you have any more questions around this.

Thanks,
Aravind.

On 10-07-2023 13:42, Ursulin, Tvrtko wrote:
> 
> Hi,
> 
> A few random comments:
> 
> * For question about why OA is not i915_perf.c and not Perf/PMU read comment on top of i915_perf.c.
> 
> * In terms of efficiency - don't forget the fact sysfs is one value per file and in text format - so multiple counters to be read is multiple system calls (two per value at least - unless that new ioctl which opens and reads in one is used) and binary->text->binary conversion. While PMU is one ioctl to read as many counters as wanted straight in machine usable format.
> 
> * In terms of why not ioctl - my memory is hazy but I am pretty sure people requesting this interface at the time had a strong requirement to not have it. Could be what Aravind listed, or maybe even more to it.
> 
> * For sysfs there definitely was something about sysfs not being wanted with containers but I can't remember the details. Possibly people were saying they wouldn't want to mount sysfs inside them for some reason.
> 
> * The fact tracepoint names are shown with perf list does not make them PMU. 😊
> 
> * I also wouldn't discount so easily aligning with the same interface in terms of tools like intel_gpu_top. The tool has it's users and it would be non-trivial cost to refactor into wholly different backends. Most importantly someone would need to commit to that which looking at the past record of involvements I estimate is not very likely to happen.
> 
> * Also in terms of software counters, the story is not that simple as i915 invented them. There was an option to actually use OA registers to implement engine busyness stats but unfortunately the capability wasn't consistent across hw generations we needed to support. Not all engines had corresponding OA counters and there was also one other problem with OA which currently escapes me. Needing to keep the device awake maybe? But anyway, that is one reason for sw counters, including sampling on ringbuffer platforms, and accurate sw stats on execlists.
> 
> Sampled frequency (more granular than 1 HZ snapshots) was also AFAIR a customer requirement and i915 can do it much more cheaply than userspace hammering on sysfs can.
> 
> Of course the user/customer requirements might have changed so I am not saying that all past decisions still apply. Just providing context.
> 
> Regards,
> 
> Tvrtko
> 
> -----Original Message-----
> From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com> 
> Sent: Monday, July 10, 2023 7:05 AM
> To: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>
> Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
> 
> 
> 
> On 08-07-2023 02:55, Dixit, Ashutosh wrote:
>> On Fri, 07 Jul 2023 03:42:36 -0700, Iddamsetty, Aravind wrote:
>>>
>>
>> Hi Aravind,
>>
>>> On 07-07-2023 11:38, Dixit, Ashutosh wrote:
>>>> On Thu, 06 Jul 2023 20:53:47 -0700, Iddamsetty, Aravind wrote:
>>>> I will look at the timing stuff later but one further question about 
>>>> the
>>>> requirement:
>>>>
>>>>>> Also, could you please explain where the requirement to expose 
>>>>>> these OAG group busy/free registers via the PMU is coming from? 
>>>>>> Since these are OA registers presumably they can be collected using the OA subsystem.
>>>>>
>>>>> L0 sysman needs this
>>>>> https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes-engine
>>>>> -properties-t
>>>>> and xpumanager uses this
>>>>> https://github.com/intel/xpumanager/blob/master/core/src/device/gpu
>>>>> /gpu_device.cpp
>>>>
>>>> So fine these are UMD requirements, but why do these quantities 
>>>> (everything in this patch) have to exposed via PMU? I could just 
>>>> create sysfs or an ioctl to provide these to userland, right?
>>>
>>> PMU is enhanced interface to present the metrics, it provides low 
>>> latency reads compared to sysfs
>>
>> Why lower latency compared to sysfs? In both cases we have user to 
>> kernel transitions and then register reads etc.
> 
> The sysfs will have to go through filesystem which adds latency but here i think the most important aspect is requirement of read timestamps.
> 
>>
>>> and one can read multiple events in a single shot
>>
>> Yes, this PMU can do and sysfs can't, though ioctl's can do this.
>>
>>> and it will give timestamps as well which sysfs cannot provide and 
>>> which is one of the requirements of UMD.
>>
>> Ioctl's can do this if implement (counter, timestamp) pairs, but I 
>> agree this may look strange so PMU does seem to have an advantage here.
>>
>> But are these timestamps needed? The spec talks about different 
>> timestamp bases but in this case we have already converted to ns and I 
>> am wondering if the UMD can use it's own timestamps (maybe average of 
>> the ioctl call and return from ioctl) if UMD needs timestamps.
> 
> here i'm talking about read timestamps not the counter itself and when we already have an interface(PMU) which can give these details why to do duplicate effort in ioctl
>>
>>> Also UMDs/ observability tools do not want to have any open handles 
>>> to get these info so ioctl is dropped out.
>>
>> Why? This also I don't follow. And UMD has an perf pmu fd open. See 
>> igt@perf_pmu@module-unload e.g. which tests that module unload should 
>> fail if the perf pmu fd is open (which takes a ref count on the module).
> 
> here I'm referring to drm fd, one need not open drm fd to read via pmu, and typically UMDs do not want to open drm fd as it takes device reference and might toggle the device state(eg: wake device) when we are trying to read some stats which is not needed.
> 
>>
>>> the other motivation to use PMU in xe is the existing tools like 
>>> intel_gpu_top will work with just a minor change.
>>
>> Not too concerned about userspace tools. They can be changed to use a 
>> different interface.
>>
>> So I am still not convinced xe needs to expose a PMU interface with 
>> these sort of "software events/counters". So my question is why can't 
>> we just have an ioctl to expose these things, why PMU?
> 
> firstly, PMU satisfies all requirements of UMD, requiring read timestamps, multiple event read. So as we already have a time tested interface is kernel why should we try to duplicate. secondly, using ioctl one has to open drm fd which umds do not want.
>>
>> Incidentally if you look at amdgpu_pmu.c, they seem to exposing some 
>> hardware sort of events through the PMU, not our kind of software stuff.
> 
> the counters that I'm exposing in this series are hardware counters itself.
> 
>>
>> Another interesting thing is if we have ftrace statements they seem to 
>> automatically be exposed by PMU 
>> (https://perf.wiki.kernel.org/index.php/Tutorial), e.g.:
>>
>>   i915:i915_request_add                              [Tracepoint event]
>>   i915:i915_request_queue                            [Tracepoint event]
>>   i915:i915_request_retire                           [Tracepoint event]
>>   i915:i915_request_wait_begin                       [Tracepoint event]
>>   i915:i915_request_wait_end                         [Tracepoint event]
>>
>> So I am wondering if this might be an option?
> 
> i'm little confused here how ftrace will expose any counters as it is mostly for profiling?
> 
> Thanks,
> Aravind.
>>
>> So anyway let's try to understand the need for the PMU interface a bit 
>> more before deciding on this. Once we introduce the interface (a) 
>> people will willy nilly start exposing random stuff through that 
>> inteface (b) same stuff will get exposed via multiple interfaces (e.g. 
>> frequency and rc6 residency in i915) etc. I am speaking on the basis of what I saw in i915.
>>
>> Let's see if Tvrtko responds, otherwise I will try to get him on irc 
>> or something. It will be good to have some input from maybe one of the 
>> architects too about this.
>>
>> Thanks.
>> --
>> Ashutosh
>>
>>>> I had this same question about i915 PMU which was never answered. 
>>>> i915 PMU IMO does truly strange things like sample freq's every 5 ms 
>>>> and provides software averages which I thought userspace can easily do.
>>>
>>> that is a different thing nothing to do with PMU interface
>>>
>>> Thanks,
>>> Aravind.
>>>>
>>>> I don't think it's the timestamps, maybe there is some convention 
>>>> related to the cpu pmu (which I am not familiar with).
>>>>
>>>> Let's see, maybe Tvrtko can also answer why these things were 
>>>> exposed via
>>>> i915 PMU.
>>>>
>>>> Thanks.
>>>> --
>>>> Ashutosh
>>>>
>>>>
>>>>>>
>>>>>> The i915 PMU I believe deduces busyness by sampling the RING_CTL 
>>>>>> register using a timer. So these registers look better since you 
>>>>>> can get these busyness values directly. On the other hand you can 
>>>>>> only get busyness for an engine group and things like compute seem to be missing?
>>>>>
>>>>> The per engine busyness is a different thing we still need that and 
>>>>> it has different implementation with GuC enabled, I believe Umesh 
>>>>> is looking into that.
>>>>>
>>>>> compute group will still be accounted in XE_OAG_RENDER_BUSY_FREE 
>>>>> and also under XE_OAG_RC0_ANY_ENGINE_BUSY_FREE.
>>>>>>
>>>>>> Also, would you know about plans to expose other kinds of 
>>>>>> busyness-es? I think we may be exposing per-VF and also per-client 
>>>>>> busyness via PMU. Not sure what else GuC can expose. Knowing all 
>>>>>> this we can better understand how these particular busyness values will be used.
>>>>>
>>>>> ya, that shall be coming next probably from Umesh but per client 
>>>>> busyness is through fdinfo.
