Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC0EC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 14:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2CA10ED45;
	Tue,  7 Jul 2026 14:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSb/VaXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E518510E4CD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783433084; x=1814969084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=168pQfj2hL7fgBLmXh8o2qGGqIM6A+F1LYkwGHX8NmU=;
 b=hSb/VaXoXO0eubiEmcJb+rHwmyey2UEhniZmQosQkuOv4/F1Ayfe/UkN
 Fqyo8HoeEWBD/rr1Qn9liM58Hy8OI3v5Y9KFJYicpKbqNyzRTfbvpTcuc
 fQOFURpVkTs651qqnpez8LHu8tKw41zuT2aRe0Ff8uQXUevkIAgLuEr1/
 WQQ0H47Kn9G3OOYjpkOW6aEK8kMw7TRl5ONv7TpKs2NU14U4JsR4FdWhA
 BWHKcgO88yBmacgvigPOR8SxBwvFJTG/edcbF4+tZeVKAUskTLUOif2yE
 +nLLJHxmTE2dC9SsXT92pMh+5Ja+gv8rRCxzmNi5aUmNXdXVvVhsfbM+a g==;
X-CSE-ConnectionGUID: em+ZbmdkQTC262RDUQDsuw==
X-CSE-MsgGUID: ybwqLm2lRH2/jBoExBfrRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83187428"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83187428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 07:04:43 -0700
X-CSE-ConnectionGUID: EkTcSsrTQp2GbjslA31zNw==
X-CSE-MsgGUID: ySMLPHP/S+CEsfuHqeCrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="252926236"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 07:04:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 07:04:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 07:04:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 07:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xx34fAlCBMXe4Z9uDg+X+7E+HY3HRTYb9Osj9YFoM0+A69MoLyMoipu9TU1Q9HQ3omw/U7c7SHApaQ8uzoH4nG2EHMzgBm5mD0PUv26YvXdLEgvhwmBYsaGvo5gl9FSvsxdw9xf7v5BDD+Mr810Zbmqsmeo47AvK1JsDVZT0AHpvQhqUde8fGW1xf5Y8uSsMfRWlIEsGNsZss37pvF+VmzBRdoVcqp4d/QSHhH8FL//pqVeuh9yzbhCIZFESCtft3Z9OtV8K8uX39iNk5+Q+0DAPDIcpdbnytUmZL9FpliD8kv6CerbGD6TuWja/MN5vL6xOBg9DfHwqwG43Ghs/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH1naTX4YHhjfIiKy0mUDI4EVdmRL5JhB2RWEhJ7GuM=;
 b=u7Yvgi/cTlzTzDLt1zzky3hllfLY2lxRUQWmTekB4n/eg24zTt3DU0fstXoi6Nlt1LtJiB7C7sbGnHccgrlTx1wi+t+uN6Fp76FKcO9gFJfpoqtP9U7X+dAaE6KrBkZ/dQl1Qy4dNGUPGhtjzUc8XhIBUvQj0jXnEIQbOd30a4Plq4IGERBTwIpho/Rq/KEy0ZxDzpxX7CKggUf3av/nMIDsWmF22V9R5gY+ZqUF5yMlGnza8jgonl6FaCbu8jC13oua5bQR8HaYtKEflJPGfyyzWphBiWwF/WhPh8aa64BmP2d14aFjx3VVHqMw7sUHOBZJZEcmJEZbNPZRvH0YhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 14:04:37 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:04:37 +0000
Message-ID: <6722093d-f65c-4b6a-aafe-cfc6ad3c9864@intel.com>
Date: Tue, 7 Jul 2026 19:34:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/xe/guc: Hold device ref until queue teardown
 completes
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
References: <20260624041029.2357470-1-arvind.yadav@intel.com>
 <ajtaGUaavUkXWVnI@gsse-cloud1.jf.intel.com> <akf_FtBIU-4IhIId@intel.com>
 <akg3drhRXtTEBQPP@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <akg3drhRXtTEBQPP@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0348.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dd6edf-1013-4de9-2294-08dedc30ad86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|6133799003|7136999003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: cAVr+8DK9NXR0BUVUhl7TDVOSy+/UmSGGI5rW6L53iKsLudBYSuKGAzo137mHkyZEfKGEYtJfRqgVYcr0wpZ7NRJsHKFG44NpxRh/lih37/j5AlQ+lD2ZJjHMGD1RF5iFDMzqkPDAVXAL99dXDv+wcgwE41YLXYdZb/htOmNkGPSVDvPprRO+Fp92MtF0i5k7f/CYdZHHCYu2USsuBsclgI3VYiHCKETUYUCncU4UjAyb65ppUscNQRbLj/6uqx0feB0f6fIFeiPVpjQJ6ioUeZjyclsL90JXcZOEq3TFpvk38GUUstTaU6m/QupHuZHdKYy/DJXfJ0HhUvQO2sg3zpgz0vKizRR0sID3gh9cwRcPznp2kWlmBFawn2ulHvJbYvzDroenN7Q2PlwE5m8FfJO+Xi6aomKEFkN0QufLNl1XBqXmw7DU681dBVagmecIVSMDPLcJZPasBjoGQDO0yln3BvHXrZvPTA5DhrW+Yi+Xfg2gc5b69USb/d1YobEN6dJJH+E0u+YFkgEpcDZlFpi5Nn3SS/tvC1ENnbFa++Nr5AE5RrEX1/43orgp3nJ0mieGg/2f2VgnP55Wp1UPbSdbhwo0VEif9BuuIyjtHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(6133799003)(7136999003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RvajkxRTRiRUkrbUZlLzlraXJSQ2h3MmdQR1ZxZ3p4MVZ3KzdTZWptbVRX?=
 =?utf-8?B?aUcxTDByRStLK3ZuL3hJdUVUL0FZcUc5dmdKdWpXbExWcGpYM3ZybEljTFZO?=
 =?utf-8?B?R2tEMm0yK29yejY4Y3ZWY0YrMXRvUzRSb2VnS3hZa0JNM1JscWNXVk9nUkVC?=
 =?utf-8?B?VXJKQ1gwZk9CRzFjUkNtQ0hJMnpCRnV4aTN1VHNNcjJiZnBDcDJZOGtqQzdk?=
 =?utf-8?B?cW9Ob3hvOXk3N3cyZHFQdEN4blVZNWlNMm9HTUQzS1RrOXJWRHVVcVllYVEz?=
 =?utf-8?B?Mm1qeHM5UVlIVkJVRmFpQnVZcDVXUkZZa3NuQXBESTB3Y3I1cUYvRllOV0Zt?=
 =?utf-8?B?aW1iek5xb2ZaSThzWnBGek00clpVL0U1VUltTU5rSEVDdkY3SDBUSjFpR3Jw?=
 =?utf-8?B?dkhlTTh5dCs4RnZ4dVNlNEZxcWRoZG5WL0QyREoxZmlQS0lmM01PdDNpMkxU?=
 =?utf-8?B?UkNFRmRZQUFqMXEweUdBYTBXd1VVamExVnlQM1J5d2swWGFNQjJ0YWxIQ3Fs?=
 =?utf-8?B?aWRjSlZoR3lhNGt3M0VQcEM4b0l5YXhvTHJNUDBRM2ZIdVdXT2VtTURaQ3ZM?=
 =?utf-8?B?TUZkakw5SWtaYjVTTkFEY2lOMHB3bVN4VEZRSm91L3ByTXFiQVpiclU5REkw?=
 =?utf-8?B?SGpWUWI0R1p1SFUzUjd2Zlh1OG5xclNKblc4d2I5VmhDNEx5dzBXOTRCM2xr?=
 =?utf-8?B?M0pRNmdTdGZMbU0vRkR1L3l3bHRJcFlQR1U3Q3hwcUZjTTVPbzdrN0FVNUwv?=
 =?utf-8?B?QmQwazBIMnBIckRFcS9zeHBlWTY3cE5ETWlnRUk4OCtCa2hEYjlreXZxdXJ0?=
 =?utf-8?B?VHVXTk1iZnhFTWRmd2xDVFZXWXZGZjRnUmZnQnovNXEvZUNYT1MzUUFpMlBI?=
 =?utf-8?B?UXRFV3VnV25LdEJaUkVUZDB5OWtXbllmSTg4S0VjWDQraWtoNUN4Y1RRWCtp?=
 =?utf-8?B?UTYxK2pjMEI2Smh0SHFnWVZ3YTVXOXRvWU5yOG9hMTY3SU1VNThJMGpnUXlX?=
 =?utf-8?B?bUR6ZGoxcURrSVBjdUdkOGQ1VUw5YStjaDVtcms2QlhLamlnVG5Id2dSMERq?=
 =?utf-8?B?enNiM3VtcUd3TXlYZ0t3ZmpDYjdhdUhOWWgrRkg2em1RcVF2ZkhFcXZSYTFz?=
 =?utf-8?B?bTU1NXdqRDBaZGpjVytsN1liaVVTcTNFT29FQTloV3RKdTZsb1VJRVZMQWtI?=
 =?utf-8?B?TTJzc0IxdG5ySlhIS0I5UDJHQkhtRFowMFNmTzFKbWRkeFFtYWd0L3RvSGxL?=
 =?utf-8?B?dzVrWTJYUXNPTXlCTk1iSlZNSmMyVm1Rc1F3YkRYbnZld25yWHJ1UU9ESGR5?=
 =?utf-8?B?NW1vUzhXV2pYTlFZRXh6VG5wRndqU2Nsa0d3Y2NwQ2s5emo3Yyt6Z2hsYVlV?=
 =?utf-8?B?M1AyQ29IMm4rTUZNYmQ1dTgydzZDOE9UMzg4elBtVk5naXJxZFpWRUhYaFB3?=
 =?utf-8?B?VDBZYnFIZStvdzErRVBKdXo2VEc3UWVnY09ybzdmUHlmY1Vra2FNS0YyR2Vj?=
 =?utf-8?B?Sk5uUFp1ZHdrK05SbmwyNHFKV1lTWWI5Mks2aXQyYlJNSGRDcEVqSmQzK0da?=
 =?utf-8?B?NmFpcWgyV05Ub1pPZG14MldMWHZod3JhWG5QM05vOUFrc2t0cEZ4cURNU21k?=
 =?utf-8?B?TnMzb2VDOXY2YnFqR25tQ1l4QXFKcEJ4OEp5eG95OUtXakdzZjFKVzdsdzhV?=
 =?utf-8?B?dmF4Q1FTTk9OV0U5YXBaSWVEL1pZbXpEOTh2S3NseWRGSFgzeFl2WTJLRzBk?=
 =?utf-8?B?UHBuRmljQjQ4MjRCbkhPRS9ybXdlYnRINHJoR3N6U1ZlZ1B5TWcra1pJTC9y?=
 =?utf-8?B?bDZsSE1pTU0zSGFwb0Q3bVU3S1g1T2p3Si9zNVdSak5pTmRkd1hIQmxVYURu?=
 =?utf-8?B?U2lrcnRIeTNvZ0p6c21kSHFuYTllRmJPbkZwYWNDeW1xR2lnRnc3QjkzYnJK?=
 =?utf-8?B?aXlmUWtnZHpFOFF5QytsUDVyTDJ1cStDM1FCM1cyT0V5cXlBN3dsSS8wWDhk?=
 =?utf-8?B?L3JxREVIWEx5Nk44S084bmtjb0l4SllZNjNhT1RvalAycnlDNFNIdzNaZm5U?=
 =?utf-8?B?bUEzbTF4aHJzZDVqK2RWVEZFZzVuYVBrYm5pVGlCUnV0Ni81MjNLWStTL2cr?=
 =?utf-8?B?aEVQV3lVSDJ2UW16WHBiTDNjKzBLUDVFQ1VybXlKQ3UwWEFvSEZ6RnlMd0d1?=
 =?utf-8?B?WWl3NGxvOGIzQlhEL0ZUSkNWRTBlMlFxMXdpV2YyVUhHVlJRSXI0TzhjWktO?=
 =?utf-8?B?RERoWU1iVVVxbjBRTEl0TWQyYUc3UWxpaCtHYUNIUk1tMExDTjgydXVWSWxJ?=
 =?utf-8?B?UWtwOVFZQzJidEtlTG5kY2gvY2pxRFl2dHZOaFhDNFozb2toVHk5dz09?=
X-Exchange-RoutingPolicyChecked: fAgxTdI8HHpFs00OdcImD1M5RDV71RaNakAUqZGF0C3QehLcn/meJclbBjCEMX8q5JJJWSG8ttxB8rtMMTC+Wi2yJYldEvyUrXcKXhFsrIS84fB61j1Kqj9zBDSjHXNbJ4weYpI31JBotW+t65qDvDYWLYuJCobDtj7LKwpp3UwBlI73JO2Et46ci5A3h0fKHhIMK1Tid2Kbp5HyNoxYFmKaq6r42Y9wedtqu/d3C0f8P+WgMpj5SZCls+hpME+eZJEuTj5sEDormQdKMW9+wi/o/vsDY6xcXvmlEGo8UYiK2w5oW10e4mC55/MWH0huLTN2Mm4c3+vs3+cIc3ESdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dd6edf-1013-4de9-2294-08dedc30ad86
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:04:37.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB83BkXEOHXWzQEtQA248P/GXCYEgBGurJlOZF4jq+ibeGaCRleIhMr89XXR5+2RdkjSn38nhTEI5E/GUhQJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 04-07-2026 03:58, Matthew Brost wrote:
> On Fri, Jul 03, 2026 at 02:27:34PM -0400, Rodrigo Vivi wrote:
>> On Tue, Jun 23, 2026 at 09:16:25PM -0700, Matthew Brost wrote:
>>> On Wed, Jun 24, 2026 at 09:40:29AM +0530, Arvind Yadav wrote:
>>>> GuC exec queue destruction can run asynchronously. If the final device
>>>> put happens from a destroy worker, drmm cleanup can end up draining
>>>> the same workqueue and deadlock.
>>>>
>>>> Hold a drm_device reference for the queue lifetime and drop it after
>>>> queue teardown completes. This keeps drmm cleanup from running while
>>>> async destroy work is still pending.
>>>>
>>>> Move destroy work to a module-lifetime Xe workqueue and flush it on
>>>> PCI remove so hot-unbind/rebind still waits for pending destroy work.
>>>>
>>>> With queue-held device refs, guc_submit_sw_fini() cannot run with live
>>>> GuC IDs. Replace the fini wait with an assertion and remove the unused
>>>> fini_wq.
>>>>
>>>> v2:
>>>>    - Rebase
>>>>
>>>> v3:
>>>>    - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>>>>    - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>>>>    - Drop separate deferred drm_dev_put worker.
>>>>    - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
>>>>
>>>> v4:
>>>>    - Replace the guc_submit_sw_fini() wait with an assertion and remove
>>>>      the now-unused fini_wq. (sashiko)
>>>>
>>>> v5:
>>>>    - Move destroy work to a module-lifetime Xe workqueue instead of
>>>>      system_dfl_wq. (Matt)
>>>>    - Flush the module-lifetime destroy workqueue during PCI remove to
>>>>      preserve the old device-remove wait semantics.
>>>>
>>>> v6:
>>>>    - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
>>>>      letting it outlive the xe_device/drm_device. (Sashiko)
>>>>    - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
>>>>      can be queued from the reclaim path.
>>>>
>>>> v7:
>>>>    - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
>>>>      for SVM pagemap destroy as well. (Matt)
>>>>    - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
>>>>      helpers because the WQ is no longer exec-queue specific. (Matt)
>>>>
>>>> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> I was going to push this patch, but have you guys seen this:
>>
>> https://sashiko.dev/#/patchset/20260624041029.2357470-1-arvind.yadav%40intel.com
>>
> It very hard to reason if this is correct, but in general for safety we
> should likely call xe_destroy_wq_flush in the a devmem fini handler that
> is registered very early early during device probe so an latent cleanup
> or we should hold drm ref while is xe_pagemap is alive, or perhaps both.


Yes, agreed.
This is hard to hit, but the remove-time flush alone is not enough for 
the SVM pagemap path. Pagemap destroy work can still be queued later 
from reclaim or late release.
I will keep the module-level destroy WQ but add a drm_device ref for SVM 
pagemap destroy and drop it after xe_pagemap_destroy_work() completes. 
So the async worker carries its own device lifetime. I will keep the PCI 
remove flush as well to preserve the GuC/remove ordering.

Thanks,
Arvind


>
> Matt
>
>> ?
>>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_device.c       |  6 +--
>>>>   drivers/gpu/drm/xe/xe_device_types.h |  3 --
>>>>   drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
>>>>   drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>>>>   drivers/gpu/drm/xe/xe_module.c       | 50 +++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_module.h       |  5 +++
>>>>   drivers/gpu/drm/xe/xe_pci.c          |  6 +++
>>>>   drivers/gpu/drm/xe/xe_svm.c          |  3 +-
>>>>   8 files changed, 101 insertions(+), 40 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 089872507bdd..0d8848e66d6b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -469,9 +469,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>>>>   	if (xe->unordered_wq)
>>>>   		destroy_workqueue(xe->unordered_wq);
>>>>   
>>>> -	if (xe->destroy_wq)
>>>> -		destroy_workqueue(xe->destroy_wq);
>>>> -
>>>>   	ttm_device_fini(&xe->ttm);
>>>>   }
>>>>   
>>>> @@ -580,9 +577,8 @@ int xe_device_init_early(struct xe_device *xe)
>>>>   						       WQ_MEM_RECLAIM);
>>>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>>>>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
>>>> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
>>>>   	if (!xe->ordered_wq || !xe->unordered_wq ||
>>>> -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>>>> +	    !xe->preempt_fence_wq) {
>>>>   		/*
>>>>   		 * Cleanup done in xe_device_destroy via
>>>>   		 * drmm_add_action_or_reset register above
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 32dd2ffbc796..1ed993dffb52 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -355,9 +355,6 @@ struct xe_device {
>>>>   	/** @unordered_wq: used to serialize unordered work */
>>>>   	struct workqueue_struct *unordered_wq;
>>>>   
>>>> -	/** @destroy_wq: used to serialize user destroy work, like queue */
>>>> -	struct workqueue_struct *destroy_wq;
>>>> -
>>>>   	/** @tiles: device tiles */
>>>>   	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>>>>   
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index afe5d99cdd8b..982356513f3c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -10,6 +10,7 @@
>>>>   #include <linux/circ_buf.h>
>>>>   #include <linux/dma-fence-array.h>
>>>>   
>>>> +#include <drm/drm_drv.h>
>>>>   #include <drm/drm_managed.h>
>>>>   
>>>>   #include "abi/guc_actions_abi.h"
>>>> @@ -37,6 +38,7 @@
>>>>   #include "xe_macros.h"
>>>>   #include "xe_map.h"
>>>>   #include "xe_mocs.h"
>>>> +#include "xe_module.h"
>>>>   #include "xe_pm.h"
>>>>   #include "xe_ring_ops_types.h"
>>>>   #include "xe_sched_job.h"
>>>> @@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>>>   static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>>>>   {
>>>>   	struct xe_guc *guc = arg;
>>>> -	struct xe_device *xe = guc_to_xe(guc);
>>>>   	struct xe_gt *gt = guc_to_gt(guc);
>>>> -	int ret;
>>>> -
>>>> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
>>>> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
>>>> -				 HZ * 5);
>>>>   
>>>> -	drain_workqueue(xe->destroy_wq);
>>>> -
>>>> -	xe_gt_assert(gt, ret);
>>>> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>>>>   
>>>>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
>>>>   }
>>>> @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>>>>   
>>>>   	xa_init(&guc->submission_state.exec_queue_lookup);
>>>>   
>>>> -	init_waitqueue_head(&guc->submission_state.fini_wq);
>>>> -
>>>>   	primelockdep(guc);
>>>>   
>>>>   	guc->submission_state.initialized = true;
>>>> @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>>>>   	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>>>>   				     q->guc->id, q->width);
>>>>   
>>>> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
>>>> -		wake_up(&guc->submission_state.fini_wq);
>>>> -
>>>>   	mutex_unlock(&guc->submission_state.lock);
>>>>   }
>>>>   
>>>> @@ -1685,6 +1674,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>>   {
>>>>   	struct xe_guc_exec_queue *ge = q->guc;
>>>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>>>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>>>   
>>>>   	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>>>   		struct xe_exec_queue_group *group = q->multi_queue.group;
>>>> @@ -1703,36 +1693,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>>   	 * (timeline name).
>>>>   	 */
>>>>   	kfree_rcu(ge, rcu);
>>>> +
>>>> +	drm_dev_put(drm);
>>>>   }
>>>>   
>>>> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>>> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>>>>   {
>>>> -	struct xe_guc_exec_queue *ge =
>>>> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
>>>> -	struct xe_exec_queue *q = ge->q;
>>>> +	struct xe_guc_exec_queue *ge = q->guc;
>>>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>>>> +	struct xe_device *xe = guc_to_xe(guc);
>>>> +	struct drm_device *drm = &xe->drm;
>>>>   
>>>> -	guard(xe_pm_runtime)(guc_to_xe(guc));
>>>> -	trace_xe_exec_queue_destroy(q);
>>>> +	/*
>>>> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
>>>> +	 * Keep the device alive until the PM-runtime guard unwinds.
>>>> +	 */
>>>> +	drm_dev_get(drm);
>>>>   
>>>> -	/* Confirm no work left behind accessing device structures */
>>>> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>>> +	scoped_guard(xe_pm_runtime, xe) {
>>>> +		trace_xe_exec_queue_destroy(q);
>>>>   
>>>> -	xe_exec_queue_fini(q);
>>>> +		/* Confirm no work left behind accessing device structures */
>>>> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>>> +
>>>> +		xe_exec_queue_fini(q);
>>>> +	}
>>>> +
>>>> +	drm_dev_put(drm);
>>>>   }
>>>>   
>>>> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>>>   {
>>>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>>>> -	struct xe_device *xe = guc_to_xe(guc);
>>>> +	struct xe_guc_exec_queue *ge =
>>>> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>>>> +
>>>> +	guc_exec_queue_do_destroy(ge->q);
>>>> +}
>>>>   
>>>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>>> +{
>>>>   	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>>>   
>>>>   	/* We must block on kernel engines so slabs are empty on driver unload */
>>>>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>>>> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>>> +		guc_exec_queue_do_destroy(q);
>>>>   	else
>>>> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>>>> +		xe_destroy_wq_queue(&q->guc->destroy_async);
>>>>   }
>>>>   
>>>>   static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
>>>> @@ -1927,6 +1933,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>>   {
>>>>   	struct xe_gpu_scheduler *sched;
>>>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>>>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>>>   	struct workqueue_struct *submit_wq = NULL;
>>>>   	struct xe_guc_exec_queue *ge;
>>>>   	long timeout;
>>>> @@ -1938,6 +1945,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>>   	if (!ge)
>>>>   		return -ENOMEM;
>>>>   
>>>> +	drm_dev_get(drm);
>>>> +
>>>>   	q->guc = ge;
>>>>   	ge->q = q;
>>>>   	init_rcu_head(&ge->rcu);
>>>> @@ -2014,6 +2023,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>>   	release_guc_id(guc, q);
>>>>   err_free:
>>>>   	kfree(ge);
>>>> +	drm_dev_put(drm);
>>>>   
>>>>   	return err;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> index c7b9642b41ba..31a2acb63ac3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> @@ -100,8 +100,6 @@ struct xe_guc {
>>>>   		 * even initialized - before that not even the lock is valid
>>>>   		 */
>>>>   		bool initialized;
>>>> -		/** @submission_state.fini_wq: submit fini wait queue */
>>>> -		wait_queue_head_t fini_wq;
>>>>   	} submission_state;
>>>>   
>>>>   	/** @hwconfig: Hardware config state */
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>> index 4cb578182912..473be717e2c4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -7,6 +7,7 @@
>>>>   
>>>>   #include <linux/init.h>
>>>>   #include <linux/module.h>
>>>> +#include <linux/workqueue.h>
>>>>   
>>>>   #include <drm/drm_module.h>
>>>>   
>>>> @@ -91,6 +92,51 @@ static int xe_check_nomodeset(void)
>>>>   	return 0;
>>>>   }
>>>>   
>>>> +static struct workqueue_struct *xe_destroy_wq;
>>>> +
>>>> +static int __init xe_destroy_wq_module_init(void)
>>>> +{
>>>> +	xe_destroy_wq = alloc_workqueue("xe-destroy-wq",
>>>> +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
>>>> +	if (!xe_destroy_wq)
>>>> +		return -ENOMEM;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void xe_destroy_wq_module_exit(void)
>>>> +{
>>>> +	if (xe_destroy_wq)
>>>> +		destroy_workqueue(xe_destroy_wq);
>>>> +	xe_destroy_wq = NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
>>>> + * @work: work item to queue
>>>> + *
>>>> + * The destroy workqueue has module lifetime and is used for async teardown
>>>> + * work that can outlive a single xe_device, such as GuC exec queue and SVM
>>>> + * pagemap destroy.
>>>> + *
>>>> + * Return: %true if @work was queued, %false if it was already pending.
>>>> + */
>>>> +bool xe_destroy_wq_queue(struct work_struct *work)
>>>> +{
>>>> +	return queue_work(xe_destroy_wq, work);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_destroy_wq_flush() - Flush the destroy workqueue
>>>> + *
>>>> + * Drains all pending destroy work. Called from PCI remove to ensure
>>>> + * teardown ordering before the device is destroyed.
>>>> + */
>>>> +void xe_destroy_wq_flush(void)
>>>> +{
>>>> +	if (xe_destroy_wq)
>>>> +		flush_workqueue(xe_destroy_wq);
>>>> +}
>>>> +
>>>>   struct init_funcs {
>>>>   	int (*init)(void);
>>>>   	void (*exit)(void);
>>>> @@ -112,6 +158,10 @@ static const struct init_funcs init_funcs[] = {
>>>>   		.init = xe_sched_job_module_init,
>>>>   		.exit = xe_sched_job_module_exit,
>>>>   	},
>>>> +	{
>>>> +		.init = xe_destroy_wq_module_init,
>>>> +		.exit = xe_destroy_wq_module_exit,
>>>> +	},
>>>>   	{
>>>>   		.init = xe_register_pci_driver,
>>>>   		.exit = xe_unregister_pci_driver,
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>>> index 79cb9639c0f3..e8e54f701cf3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -8,6 +8,8 @@
>>>>   
>>>>   #include <linux/types.h>
>>>>   
>>>> +struct work_struct;
>>>> +
>>>>   /* Module modprobe variables */
>>>>   struct xe_modparam {
>>>>   	bool force_execlist;
>>>> @@ -27,5 +29,8 @@ struct xe_modparam {
>>>>   
>>>>   extern struct xe_modparam xe_modparam;
>>>>   
>>>> +bool xe_destroy_wq_queue(struct work_struct *work);
>>>> +void xe_destroy_wq_flush(void);
>>>> +
>>>>   #endif
>>>>   
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 78fc2e4dcfc6..dc35f8a8c4b8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1049,6 +1049,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>>   		return;
>>>>   
>>>>   	xe_device_remove(xe);
>>>> +
>>>> +	/*
>>>> +	 * Preserve remove-time flush after moving destroy work to module
>>>> +	 * lifetime.
>>>> +	 */
>>>> +	xe_destroy_wq_flush();
>>>>   	xe_pm_fini(xe);
>>>>   }
>>>>   
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>>> index e1651e70c8f0..6ff99310fdb4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>> @@ -1732,10 +1732,9 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
>>>>   static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
>>>>   {
>>>>   	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
>>>> -	struct xe_device *xe = to_xe_device(dpagemap->drm);
>>>>   
>>>>   	if (from_atomic_or_reclaim)
>>>> -		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
>>>> +		xe_destroy_wq_queue(&xpagemap->destroy_work);
>>>>   	else
>>>>   		xe_pagemap_destroy_work(&xpagemap->destroy_work);
>>>>   }
>>>> -- 
>>>> 2.43.0
>>>>
