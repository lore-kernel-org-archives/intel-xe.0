Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD010C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 23:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F7010E91C;
	Thu, 18 Jan 2024 23:29:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC910E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705620588; x=1737156588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8oVvEH0sWZgCJcD1iWtuml9X2/Ld85PIouobccGIStA=;
 b=AOaQDxgKIWX1XpH7bWNq2T9Q863XXX4gMSayj8bDff84FBmMyeKYHAlr
 B0tiGCNpXa3aO14piLCTbTrxkqShjJzy1RzbiPPZcHRQGKuUgKcCriYd6
 gMEQ1197rwlUzNZYFExkQ/wnTqV23ie50JVfkCWA4t8nslCQhYFVynAYH
 gAmaaOkdDhFP2KKn8KNJCu7C8ZmVFcB7+mUekx/caYOv2pAm63cEjIVCJ
 s4gsE9UtR4qqlBzOcxm1bkzET4v8tW3xOf5iIqt9ow3VLLBkgXfIX42Kz
 Sq/Ng/zeArshlHdVcD/gXO71LX0qnyBZwi8/biPwUmqWy/o7cu4PrvXUr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="498207"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="498207"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 15:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957966545"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="957966545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 15:29:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 15:29:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 15:29:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 15:29:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 15:29:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSh5Hja7k87LZCDRFgxnQTQztziuH07eqaOu9OeeivJAxJWf8kJ2kHwCE6rbeEcLdHEg4aHXk26iTyfM0PG6QbC7OKUUvNged7vvTcqoaqXH6geuyHLGggIaLYBdeTLxONY9zVKiboj9ncvwHa89ROo1E0j9bRqnRY7EjxpfcXN2gU3cBlIAh0Pu2lxoQYc4zTfBmCoPMu9n7KWrOr5VSHfU+5duKq0OFs9XKK3VLH2AL24C1OOpfsV4k/20LXc3iUCDvH13CbNz9nJuTdClyvursXxFja5gmQD7anDwdTjHjLiV9V2FcNubAY5LfFT+IdUWQWZ18eji+OCBu0aZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UGRjf90pdCulPJmJrwpSC4cdgV4NI/4j3mT4M1fLTY=;
 b=YESJQGXAek2JjDwpPEfNFLxqnlO9A5/ukXpPTseik3/SgFWZiN/f1VWgbbwT0wjl1WwaC1Jp5nY/qq4XBGjf51olLxik+pnVD+HEAooo5TpZrYBIggsdXTAZm8kLyIhkC0s44M8gKlkRvWWXgpieLzigleD7YiNP8OYilkEfFIP8zQKe8ydw9Oo/ICj+RhnIHlrHQ6SikL7GmVE2M6ocCd53gTt6+MrFO3GFRgrcRRtW3xdVnhq9wjsBlCGbylikk3Sgcm8HRToBWczB4HJ9t8Nx2+RfZQI6WSltGFxHOZvZPv3jP3r+BF6v7OWtO85CxJMjNlh7G5tUdv/0q/9vyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 23:29:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 23:29:36 +0000
Date: Thu, 18 Jan 2024 17:29:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rae Moar <rmoar@google.com>
Subject: Re: Re: [PATCH] kunit: Mark filter_glob param as rw
Message-ID: <rxbsgrgk35tuolfskj6kca26y7ikawg2agmibtfhszi6iiak26@gnroerafwuw5>
References: <20240112001240.1710962-1-lucas.demarchi@intel.com>
 <CA+GJov4-sWm=MHp6S+4+WsZJjeFjEdLTB462j0sOym8P_sjKLA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+GJov4-sWm=MHp6S+4+WsZJjeFjEdLTB462j0sOym8P_sjKLA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: ae70bb36-0866-41e8-7669-08dc187d552e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7+i6fPSbHudItZfr6LKy/5dXCHYxHFLpK/6TIEFcVRTsvyvpMs5OBnC2hSSMfQ8kBdJdW44SgqCsxDv6K9X3QzTtF8MofXRlMuI4DNyV7DJ2uXLpZJJyVizzSHGjnu1iuc8u3+zQdLCo2UZTpiBplzgPsNVUHTD4Xd4A32kK95EJzbViFJjgE0oQptwuqk3WsI5BvLOVsFPM1IZ3dm3Hlw7d15kaQFF+Gop4Mo8A1xY34DofKs25bXwGNBpVNQL8nU8LH9X7HDML/+PPlOC8m8jYv5efkafGdG+peAEW/jIVhKWykmANgNxR6rS3rK7/u1LIrweGzmPPj07Ype5GYbMHRBdBBjWIdU6vkSv0b5uB6aTxOU03BbMHgrjucuEqU8YKOb/pWenC5VScWRfWbDEjtwTV4lb0uE5iW06SWNNJmL7NBhDaLYIX48tUpdVJwu1htc9ntTuWAaYzvgD/Nzy4DThreXSi8XXHuK61lFoXxJHb/BRxk7Pwy4oez8waPFITFrfb8fytDtRhox0bmOLr74EJ6mSPU+nmZcbGe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(2906002)(5660300002)(33716001)(41300700001)(86362001)(966005)(478600001)(26005)(6486002)(6506007)(6512007)(9686003)(6666004)(8936002)(8676002)(82960400001)(316002)(54906003)(66946007)(66556008)(66476007)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dNS2R0SFBoQk1GZnovajhueXpXamdXM3h6TjFIYUpMMnJaMW5QOTllWlp4?=
 =?utf-8?B?ZVk5bG4rT3JpM29laDY3cUZuRDFleE1VUWx6MWp3d05mcWVYa1lxbllmdWtL?=
 =?utf-8?B?YTUrMSt2VHpCVEZVcE5mbjZzcEkyYTNyUjMzbWhMenRTRjFidytNOW83U1JS?=
 =?utf-8?B?UlVsWVc2dkVRamtNQy9mZTlycWJVTy9tZExwZXczMzIzcEJLeDI2RW8zZHp5?=
 =?utf-8?B?aXBpenJoL1IzZUxBdlByNGFhek42UW9zZmQyOGtGckE0cCtrVnFORVVyZkZw?=
 =?utf-8?B?dmVlODdGSW5sclN0anVHamRPNDF5UEpOWE9yZWQ4SmZ5a3ZzbUdmUUgycVU1?=
 =?utf-8?B?TDJ5VU9obExSUE5FTGJnMFprTlA1T2FKMldWSDl6VlM2OGczcVAwenlkZ3hx?=
 =?utf-8?B?NkpYd1JCWk43aFdHTlJOSGRPM3VVV2tQQ3FJc09vbUhHTWJULzlja2hGeEZJ?=
 =?utf-8?B?d0svc2YyeVpLbllpbjhTYTNGVW02RG1CRmYxZlZ0SXdGTTAzWkxGOFBGelpo?=
 =?utf-8?B?cFM0OCtXZkpJSzViUXUwZmNMOEdNMmFMQmcxeXN5Zm8wZXlITS94V1FNcGtU?=
 =?utf-8?B?OG10djJjRnFETGZqMjVQWDE2cldjRmp5MElVU0gxNitLSVJwVVFwZkpxeDRZ?=
 =?utf-8?B?NWpteS9DdDJYUWFybnR5WWI5T2hvRDNuSUZkTlFyZHdiNUlPQTBuQXZFMXQ5?=
 =?utf-8?B?T0VEV2ZOL1VkOUFLUExramVwVVQ3eWdkOVhFZTFObll0SzhEcEYxa05OYVZH?=
 =?utf-8?B?OEFWbzhDNmZ2UmtzL0lwNTFGckJrbm9zZlVQY2Q5YjVMTE14bmNTT3NuVmFO?=
 =?utf-8?B?aXdSTVRwSDRSUHo0cmNDTFdqSU5vMVF3S1YwUVZ1LzkrTTFSOVYrUnZEUmM3?=
 =?utf-8?B?SHJ5MUxRdE50U1BIbjVMdFZmakMrcmhMN3FOMi9YUDZIVElGM2RvR0J1Lzlv?=
 =?utf-8?B?VTRrY0dYc3hPQVlXVnpINzNKbVdTWTZhZ1ZqMjY2dVdWcHdVMElVNFNVQk82?=
 =?utf-8?B?VzhmUjQwRDhGbjRMYjFiSlFOcVVBK3pkQk50aEtjY0pkUWxYQUhLRldZcDlr?=
 =?utf-8?B?Nno3Z25sOHM1MXBzU0JJNXpiWjVJODFuYXlLSnlnUVVmekhSYU9LM2w2Q3pk?=
 =?utf-8?B?TlVXVlNyUEYwNi9ZZVQxOS9XSWdzQlVMUjhobnVmN21Tc0p6TGZhYWRFbnFq?=
 =?utf-8?B?WDFTYVQ2OGdTR3BvQkxDYW1KV29XbTFnMTgzQzhiOWFYcmN5Ull2VWxPR2NZ?=
 =?utf-8?B?aVJ0Q2svTDR6U2hZcGVudDNhRTZiU2FHK0srMTlBQ1NvY2FHWE5lVEN6MStq?=
 =?utf-8?B?ck9ZZnBRUzhnaDB6SDZWcTFqVVYwbE5nTjRJUExEN1FTUHB3em80ekY4bEcv?=
 =?utf-8?B?ZUhmNnA4UFFBTS9OTEo2dkFyUDNySTZLNHlPcVJTTGN1bVdkZ0RCVHdIZFRq?=
 =?utf-8?B?YnBBbXcreWlKcWJBOWJobWFuazF2SDBXR2tLdVZVQkF0S1BJdVpiRVhYT3ZZ?=
 =?utf-8?B?SHJEU091UUpXL0dmcDFKRWo5RXRoWW9uWVdnK0l1WW5RSFlER1JUVW9KRFMr?=
 =?utf-8?B?TnRTNnlRenZQbXhjVU5Ya2RjSFJCUzc1UFdMd1ZCZEs3ZkVYSktQcFJCNmpY?=
 =?utf-8?B?NzVyOEN5ajZYS0tXUWxyTWlKNDcvN0llVm1mTmdodWNpRVhoUlZvTTlOWnZ0?=
 =?utf-8?B?T2NiTUJjNXNOaXJ6Y3RVMzl2OVBGUGdCc2YybHNZWFpxZkV3TEl3L0hMR3dP?=
 =?utf-8?B?NjI3Y2JBenc4UVo3cVM2Z0h6MmplbDZWdmpML1pYZUlGNEo4dUVyYVVHYWVu?=
 =?utf-8?B?K3l2UE5hMlJ2ZjZiY0Fack5iVnl1Z1pHS1B6UTM1Z0ZlOUtkeEdtZGZjSjc0?=
 =?utf-8?B?RWx3ZlZlZzBySU5QVEIzNXRlYnhFSCtLOHhTSnJIMVNQb3RMVUJZL1pWNGVt?=
 =?utf-8?B?VS8yUzBrVXB1Ti9rSGNyRm5SYU41TFZINXFScnhpQTY2aldtY2NTbzlkc21r?=
 =?utf-8?B?Snd2V0JqMFRteC9VdWZMMDJxcFdjeHNhVTlnM3BMSFFQMjV2T0M3Yzlma0Zq?=
 =?utf-8?B?eU1HdnBkVFZvUHh0MDBycmVSSlZGdDdMMXcrbUJnNUZQQkx1SWVRckJlSkhK?=
 =?utf-8?B?M3AyVWJsK3FnazJQMkkzNXhiOEVVQkRXZzBsQkdRM0JzaHYvZExsNFFVMmFr?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae70bb36-0866-41e8-7669-08dc187d552e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 23:29:36.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smAt5UW8qXNKkQb2CkLMeoQmOhlZqBb0gcgBEz6G5KgwbRmxeUWTm+qSl+KikSvRD3IT3vz83vJ3FfDK8evQvovE2+BocPVIHrQxW4pVF0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
X-OriginatorOrg: intel.com
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Brendan
 Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 05:23:33PM -0500, Rae Moar wrote:
>On Thu, Jan 11, 2024 at 7:13 PM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> By allowing the filter_glob parameter to be written to, it's possible to
>> tweak the testsuites that will be executed on new module loads. This
>> makes it easier to run specific tests without having to reload kunit and
>> provides a way to filter tests on real HW even if kunit is builtin.
>> Example for xe driver:
>>
>> 1) Run just 1 test
>>         # echo -n xe_bo > /sys/module/kunit/parameters/filter_glob
>>         # modprobe -r xe_live_test
>>         # modprobe xe_live_test
>>         # ls /sys/kernel/debug/kunit/
>>         xe_bo
>>
>> 2) Run all tests
>>         # echo \* > /sys/module/kunit/parameters/filter_glob
>>         # modprobe -r xe_live_test
>>         # modprobe xe_live_test
>>         # ls /sys/kernel/debug/kunit/
>>         xe_bo  xe_dma_buf  xe_migrate  xe_mocs
>>
>> References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Hello!
>
>I have tested this and this looks good to me. I agree this is very
>helpful and I wonder if we should do the same with the other module
>parameters (filter, filter_action).

yeah, after I sent this I was wondering about the other parameters. I
don't have a use for them right now, but I can try a few things and spin
a new version if people find it useful.

>
>It did worry me to make filter_glob writable due to the recent patch
>that requires the output of filtering to be a valid virtual address
>but I think there is a sufficient amount of checking of filter_glob.
>
>Thanks!
>-Rae
>
>Reviewed-by: Rae Moar <rmoar@google.com>

thanks
Lucas De Marchi
