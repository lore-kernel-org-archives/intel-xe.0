Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF27CC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 12:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437310E392;
	Tue, 20 Feb 2024 12:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bs0NksN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DFF10E229
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708430947; x=1739966947;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QPU624deqXaz7E2161eR8BqN52ZvVtPfuBrzqYb8DKA=;
 b=bs0NksN3l0K/fAdNbdUm8XkOc8Stqy8Q0F89w04zYhJPelAJ+WLKl5vF
 swHJvfUY9Lxfdf4XCSV9PphRRTMbD3gZEP1CAPPbrWlFhtXHGFHPXeQQk
 i7lRWVQJFezzwoE3pMeIjOXMA3c7ELq1DNt98uaNoc9ApN+QmnIiT4I5q
 +uFhxVxeybdG5NXTAFBEmDkri7GvDweLoE2jymWSQFzQvkopbbJdsJ/Rt
 8FBh4XJ402HfdhGt/9Cq4AOpy2frykyEyXbHIsWMSPI6BiMXWNAFr0wzl
 z1x2Qv1r5jfDeRXIMS++Nbbhh+8UI53rUHkMM8Gdjb0yWEAZytP6HRf51 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2393598"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2393598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 04:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936444978"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="936444978"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 04:08:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 04:08:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 04:08:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 04:08:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 04:08:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/sh2848TX0xMWB5tBhfgCymxkOzMUza60bRDAxKnFSl/+xzv0cKndb+/4+C+8t+Zg4Id+GKBoJips6LIV78bvI58W2n0kowQ+8k1lzs0tydIodzcrG42Cd12r/fPMwxipK4vIG8UYWHrqshf6wlxnNMU2EDP0fQILd11mwpldHCMgK5USG5lx+BRt7qkafLfEZzOELxYH7Vhe+I78xZY4FexbCYZePGFQBNE3Xc7Wr1Xsl20EEXFnu3pJs2Amh4ksLt5dSv9LCgZkDIfpIaEoXXpYjR2E72TEbJwo+5joGfULCgE4ptVMGco2V6BxINBjZ/Y/OT+ymE0jwoyrjY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPU624deqXaz7E2161eR8BqN52ZvVtPfuBrzqYb8DKA=;
 b=WSnqql4htfRtV3zQ5IIRHKxKd1S3X4zjpo4+GcHP9Q6knfuruSk7UZhd/tbgNmbxxmEVBB0vetLtvz1aIGyBnNymRtykf3wUfbn51JDF91RkqrNhc3CClXw6vDH0a+nq3c3YUUKJ0Uy6JJpCjnug8iSVsNHrpUZ+CjTPRIL4hXqUEkFvKpB3Kr2soBU9878wxSBtQrwpwW9bMrLgk5qoXcHmdIpo6GXFDAqNyybr2eRCr3KdoYrlBu3av3YYpI3LBJVjvO4DSuAcMCOSkXYnV9q7tAVQB9E2P2IzEuOpvVe3pReVo+ZzNn3HTXAZ+Q6dYEI7b43Y7XCw35QlCHnFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 12:08:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 12:08:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
 <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
Subject: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Tue, 20 Feb 2024 09:08:42 -0300
Message-ID: <170843092294.13484.17436593152022385360@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d1134c-5e00-4ee7-dee0-08dc320cb1c1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZlxHgu58O7RstfAPsJ3b6E0rQDJ6L13oks5D+ockpCjtSUShw5CbF/SnuqF+YaW02ZU6nTEjQ6yrE4KxYRlvv8EMO7xM3GQS6VEsllys0dIUxQaBm7D5tmkOdxtyeyLpCQmTdJ8gjV/roKX8NZTEhNjkNo5aw1vLqRahhrVIPo5aw43wOw2XwpBWmThFmn8R6m2znl2T7hILZn2FPMRlQPQ4KfDXwkvbATOyxMwzzy7Fbk7SmiVWgwdu0DnwW6jtTFUTM0p1NHOOpcpTacCbs4sLS2qePybvGpxS4A95zU1g3TPyOGhAZfZ8FcxchGQEGYmiXULshnh6czVjAPT50oz7rqm5TwDUQTxzlFjRs4ucI1jP8awAlW8GP2/5HPtHLvQvz3UeQc+BudmXKIuu6WXxUrMKjgbLfTIlvKt7BUP/lYdtclmGVf+aCWUNKu8CA3VTqEFYMnJ6fG6zPRTSbd+DSmv5x8IAySmWogLtVjlD0JyDVO4dS9TH38brU4RkuM1tc9eXgwKDYfMNTXxrfh6Eudj3Qy3CSyrORxdhFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJYSVFnODRmdDMvMWFqNDkycjdUbWc1U2hyenFMclh2TDEvL21xS0lrU2xZ?=
 =?utf-8?B?TXg4MGtwVGV3TnNsYmdkOVVaYVRXR1YyNmg0ZU9vc05sSFBOSjBBWDlnRnc3?=
 =?utf-8?B?Mi9Na2RjUU9PZGN0RDU5aFhISkFXRm5SWm5UTzFpMWhNSnMxWkpTTjVtUjRu?=
 =?utf-8?B?bDQ3VzE2alRJWGEzcDZPMWJ3UlJxaTBMMkdodzNSV1JENXh2Qi9yRU15M0xq?=
 =?utf-8?B?K0tPbGxMTVZQTUxXTjJ6bHg3UmdXY0pCRlNsd20xYXBmOGFjY3NvNTl4Y25K?=
 =?utf-8?B?TUZWc1FVNFVwSjB0RXFibytSalUzcU5UVk9Rcjl5aS9WS1JTVnkyc3NZVHcw?=
 =?utf-8?B?WTVOZ2Z5b1NJalN6SkM3a0tHQnhWb1BwamJIZEpUVDhNbVZiQ0RISXJCYjNu?=
 =?utf-8?B?YmttTlRFMXh6YjloYk11R1Q1N1dLWTIxSG9BQ09ZTExiUmdyamR3Y2tKUS8x?=
 =?utf-8?B?d09pNENZY1d0a3dCR09ValJFSjJwemhzZkI2Z3ZpZnFEVE5GR3Nydnl0eE02?=
 =?utf-8?B?d09iRzNOcEFLdGNCNFNURmdUYjVqOUdrRzhSZ2d2ZC9QUUFTa1l2clN0cm5O?=
 =?utf-8?B?N0dEa3M4dFk4L0hnbVJZMUd2cFdlaU90VjFuRGRmTjNVZ1FYU0w5ODJlQUcy?=
 =?utf-8?B?NmtTakRuVkFJL21sWFRveUtmQUNSU0V2eW14TENSRjBaMmpNeHVnYTdQbUlL?=
 =?utf-8?B?N2JDUzVyYU9ITmhhcEZhek9IOExEREt0bDVnSi9vaDNnZCtqaDdabktIT3VS?=
 =?utf-8?B?NEh4eXFqSjhxam5pM1p0UnE0SmsvTU8xSkJZNG1vMmFBQWplZk5mTXVJaTV6?=
 =?utf-8?B?SjBEVFZCWUI4RFd5d1JkTVJGZzBFMVhQTEtRcGt2M1VoUEpFcVhyeXVkTnJU?=
 =?utf-8?B?d1lBSlc0TUw2MDFBY3dHZjhMSlVhZXR4Z2tPNlR1Tnhsb3Y5NWI4TWU0MXdx?=
 =?utf-8?B?cmE3WWRQa1dhTnZVd21hYjkxUTNFaFdzc083MFFQdjdYdXMzTW1LVnplQVN6?=
 =?utf-8?B?MnlhNEpVSXI2NC9NMk9WckNxcnNxam5tcEZ3TTN6RGpFcVN0NGpMWUoyNzNX?=
 =?utf-8?B?ZThvZE81ZTdRZ0xzcDFhOEx1ZTdDcW96T3p1OG5TN1ByWmhkcVI1MHdld1F2?=
 =?utf-8?B?TENOTkNvcnViVUx3a21hSjVIMzk0Q1JrcFZ0R0pjOUZiOVBKc0NmVDlZdEdh?=
 =?utf-8?B?VnF1SFhKaHllMHN4eU4yOHpsVUJXSnpOaDRkVUk3KzMwcXV5WEY2YUlMdllw?=
 =?utf-8?B?ODlNaFNZUlBTN2FTeWxQR0tlS2JsNXFOOVZFQ0M0dTBSREpJM0NJSWFiTEVr?=
 =?utf-8?B?ZHMxT0RnZWY2Mjc3aXBzeEVnTDVZZGdBbEoyM3FnbmJhTzAzRVBLUFZWMmZO?=
 =?utf-8?B?ak8zY3pjOTBHTUNoeVI5Y1JFSHpOeVJmdVVZUVE0a2RqLzNlOVZuSkt4UG5i?=
 =?utf-8?B?eEwwQ2EzOE5rSzJrVGc2bStpM01tN0M4Mkg0L1BHN20zV2dUUjVSMjNCNFA5?=
 =?utf-8?B?UG8xNHVmQmxubWoxRG9qUTRyNEhHaDFZMFdEKzJDMTZaTnE4azBoM2kyZ1JH?=
 =?utf-8?B?cnk2eUw4OTlYSDIzaVl5Y0grVy9kUENES2oyeFFJMVVZa2lOTktCdnpjbXRa?=
 =?utf-8?B?WXZHbFpxV093YmUzek9PdExYZmlrTyswbGRMRzhGT2ovaDBDVHlkNUhnOUc4?=
 =?utf-8?B?WnBrM2o5d2dwUjZ1RWVWcUt6eFlUczRlTTYzTm1LamYxNUhVNkJsN2RaRUEv?=
 =?utf-8?B?dE51UDJ0MW1RcXA4d1hpMkZ5SlJlcXVFV1A2UUoxWXFxcGdRazlHNzQySmMx?=
 =?utf-8?B?M2QybURGb1k2a1g0NmloZmhwaTNVMnlya3VkTjlVRHY2MWVNd05Nd1ZMZ3Z1?=
 =?utf-8?B?SGtsT1kreXp3NEM0NmduRTdCWE1qR1FOZkFlQ2ZKaFI4c3lkR2M1UkV5Q0pM?=
 =?utf-8?B?UUVRK1VNM0puQ20vSStkVnYyUjZ4UnkyamhuSzV2U0Ivd3FUbERRbnYwek5s?=
 =?utf-8?B?c2REeWYzMWVETnJUdzcxZ0M1VEdJTmw3VUNLWXBEODJSMzVIWlRxTThMNDRR?=
 =?utf-8?B?Uko2ZCtOQlVMaWhhUVd0dVBJWkRoajdWbVRhSTFESjdRYUlyeXZFcDhHRmVr?=
 =?utf-8?B?aUFsSFNmVE10NmNFcGhpUnA5UmtpWFY3OWVQTnI4Y1dYaVl4R2VvYlMyTFV0?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d1134c-5e00-4ee7-dee0-08dc320cb1c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:08:48.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG/jz8S0rOALYl9MhFZFJPWZxNoW1n21ytmOBWVssOx1H+Raq+BDdDSMwHEQ5Nru1IrPZe+RO7VlKQfhSfKXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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

Quoting Lucas De Marchi (2024-02-20 02:44:57-03:00)
>On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
>>The feature 'grouped target' ('&:') in makefiles is only added in 'make'
>>version 4.3. This cause problems in older version of 'make'.
>>(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
>>in the source path instead of the build path).
>>Avoid this feature.
>
>but it was used for a reason since a single invocation is supposed to
>generate both the .c and .h from a single invocation. AFAIR when
>implementing this, not using grouped target would be a mix and match on
>having a succesfull build. Does removing it really work with incremental
>and parallel build?

FWIW, the root Makefile does what it calls a "multi-target pattern rule"
trick to get the same behavior.

--
Gustavo

>
>Lucas De Marchi
