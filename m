Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D5C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 15:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C1410E0BC;
	Fri, 17 Nov 2023 15:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7C310E0BC
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700235848; x=1731771848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=42xDgO8yqMDNGqg3fp+cexj78gbmGAkquR4qGWli150=;
 b=AwvSYxj8B2rkJ4Un8KRUV+TL0zBueO3BUh/0FX7FOeRL5T227MkG5+Bk
 AyyZXdiZSdEj89c0L6ieckDjEdEcAXnpGTt/D8VEv+vii1KZ1EhfxRzw+
 bm9swu/4u5co5zXIrnRXi2u49MUXpib73UGCmy+EAs92V3YGz9QszH81b
 lEXVcvoX2w/CKiCYDzTrMBWxMjdS8+qG9i/vYWRE4L7LFG5c+zcd7Z5bV
 YHy7aWkMsVh85C3wuzyi8uIGwahZGUfzF8V5LmSJjYhmNiR+AZEaFMWRv
 RWI5wX2LIScovhzRQGpZhPHXFUswhLLgmjPFQHd0LUp6ycHaJDZkCiuJc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="395244347"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="395244347"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759211580"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="759211580"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 07:44:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:44:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:44:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 07:44:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 07:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaBejdwCX7Va8My+wJDd+rS5GqqG90zhgsJFlzLJes/LosmeAzweGQRJskMCih/tJNzDwBpJmS9rgq1xVtY5yTQjMqyhMo2LQ3JWlGp54STqaeATfTb1DzR5nxkknML2cshAKeQ/EXBiq8ltXkEZfsO+VkDuZKYg5vVzOcwIKUPIO7YEpxHlRxnZdCiQsgdyRe5wQ/+V2pXgRohcpXhYmY1AfFMIPB6+jwVom9putcsvq0gYAvJsjTEwKBb4KoV9FJo3JiQSNemsjYCLrJKhZmHfeFdl5cKe/JXscmCAqpslO4hf5DduaKazZG3b66MHIq3U5G2k7BXoRyhj2oTPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLQ8DohB1A8heLnaBo8GxeoTaJPUvJbNfSq5FjqozLU=;
 b=gIfn9ilD4wmjQkYpwTQfmZqc+jqLPPOoZGuLvs3hdZvzHuXQTgiht7yCQ6tlBKEnuMHP6X0wxcRXTYcSZefxY4QGQYj4ESD9pg+nfVFDTtRSDFSH1OMqeOjLxFmJzhPhQAkKfdVyTd/3ehA2QNmHtLX2KlWweDJgTj9glquJTN8Or1Rqeilz0pwI8VbJvyoXRgshsIpEneHXuqxHyLwUoFuo9a4v3ABjeKc3r/uJG2diCWHVJHmvtQj8zI5aF4YX3FKg1f66DN6hhoiNhmQLXfAKi67pXNVnzBjISKDvBZCQr8ewENhlHk0A7WJJF7kBH0TctsUGGapx4fNGp69bKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Fri, 17 Nov
 2023 15:43:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 15:43:54 +0000
Date: Fri, 17 Nov 2023 09:43:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <arxp5oxru47oacwu4jp6azwhlsebcrie37xfqfkr6l52kf4bb7@obcj6lvtwrxm>
References: <20231115115816.1993-1-michal.wajdeczko@intel.com>
 <k44j466umocyafacwppftvjgfiosfqar7yvfql6d6jzo4dfgzd@l34dku4avpjb>
 <92551146-9a5b-442f-853a-7c00f363a7a9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92551146-9a5b-442f-853a-7c00f363a7a9@intel.com>
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: c019a763-ab2d-4a48-1b87-08dbe7840106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30fRx5gyNYxOC9hbW82Coxzd/5tCrtHG8DFcRvyGT95w8x5DPkewD+0l/d5aBwFmtGKSj00GVc/BdP0/KYlvoDLcTLBAYgxhGrPYozljVHkoKIeNDvqE9kCfzq3X1G0DK6KNzBx9w1Wk6tnc0FujlAn4nNPGRD/q/5CeRjtvVIQ6U6CvieSRrOpNJY7akwzUGr2aGZTuWxYZGCy0PKmyUgUXET5UtIjeIgzcT9wnjZ1aBTphC099HuxfvkzEdjsJ7bv3Z1uRJ4XBngEjeGHGoEfqlfi05/+TitHzuSppycsxmbVBT6GYLHX5ECeU89cJDhQZBH3qEA5gJgf6l61h7QxdsJqdULWQHyAljBnCCr5VqsuF0V1OjeU7+zNH+XSxySbsZNLra9QecFU3laCjj9lo7G7zCIvVdOSIZvwSapz7a06RmmMVEQMVHaPrGb4Y1V8HeIf9+SXhx4wjxAxdHToLTT3fGm+lA+ybu6zyFdivhQh5hzCn33gBEXrtOHNhnbeNdLfR7lGC6oMdE9N/a/maLC+jpKdI9aZVVZXvAE467xDnfe0WElck7fhxpn+s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(9686003)(26005)(83380400001)(38100700002)(82960400001)(6506007)(5660300002)(41300700001)(33716001)(2906002)(478600001)(6486002)(6512007)(4326008)(8936002)(8676002)(6862004)(66556008)(316002)(66946007)(6636002)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4iDzaP7OB1xL23klwQeDz8VFMmxDkKfzEZOmEFU8IXx6I1EqMXg/qLR5p0?=
 =?iso-8859-1?Q?gCHK61Omm61CcU8CDh+Vq/brK6FN6i7cYp9MwsMZmJ3DA3d8BioBywGfyp?=
 =?iso-8859-1?Q?8NOgH7yd3SRSzztUrR3Fzw6vmHIuY8SEglGyGvEKfNhSM6zgRPW6/pb+fS?=
 =?iso-8859-1?Q?BrVCgseOZLrSHaMYjqsm/32Q3t5TNPHcTFNA4/QiHdoDtCW5l1aFVpThc3?=
 =?iso-8859-1?Q?ei0V3PNjfGyjI2/u1VEgkeJcUySfZMDcSgtLXho89alimcUcv6NsshHKES?=
 =?iso-8859-1?Q?Bx8FlOGoVmqrgKUkba/bZYFODrUg4a1TS1raCK83JUzBSAw0LxP6G8TOaS?=
 =?iso-8859-1?Q?GiJJ7n3pTpjH3ZQInPjy+TdVFhkTygZeHvWBsYlR2EzZvDjxgY+t8MNGPl?=
 =?iso-8859-1?Q?3uy0jO1GunkBudO5wYNxweLtfivfuPGnmP9BBBJfXDzX+YUg6jX6ajq4tZ?=
 =?iso-8859-1?Q?77C4NHFM12Fp1qv5M2cDCYsDi+bDhhfRdOkSQMX25GrRC26efM75JXLo8/?=
 =?iso-8859-1?Q?FOKWd3ycY8/E/f4st0+2Hx9sg5MeimN5+UAB/PvwAiGo9samMVU4uEGCn2?=
 =?iso-8859-1?Q?JpFnaVo0IaqSS+gKMiouiN/uxThU2+sy7DL6AkAly3l8pKVNbjZUCFfEe/?=
 =?iso-8859-1?Q?EYOoG6TpzmFZGXxZeqv83fpKxNbf8jezYHfM0c6EqxwMTF6qKWvPQcISFP?=
 =?iso-8859-1?Q?2M4S6SI1fTQL0H78DZmTvvisgjBzy2nLJJm0akuYzkvQJ6fY2hZKllzn/Z?=
 =?iso-8859-1?Q?MUDyYoMqn6OGEkRK2F438gsFbzXhCyOXZYGiYxqfFtuO8RVSi0GJCXtg3o?=
 =?iso-8859-1?Q?qub2lXWNmbJpdOOgnSMCmBvMFbGLS2BlohFluZSthXdxm/9RvdqKx9ySA0?=
 =?iso-8859-1?Q?j4GeEEFap7KdOVdr4sexGo0eO5ermYmyA6KEkz8MlW2fYPrL1r/yq5fdDB?=
 =?iso-8859-1?Q?RJ7DZ8LMpUiGhRxAdEEnDWuPxzn/2otd6em6dVEV7QRCh/P5NQZUDHj9NK?=
 =?iso-8859-1?Q?abzNMtFaWqOfMf5UHcDBN5VGsrQm5TWqvVnMgRzrbhRgVl1wAU31AcMGJv?=
 =?iso-8859-1?Q?Th84/SDOQq4oMD2yke+tqFYNue12TfuxB+wDTcEwhKoqsoG4aPxXobr936?=
 =?iso-8859-1?Q?8+3+G86ze11FKUuvm/EeSHYHb74ne/VSSr9r3DFQL6ODavLDB877IMTgUF?=
 =?iso-8859-1?Q?e19TqRoG9yQAj1N9yKW3Ju/b5oH2WWtT1zm6FOpbn0qPA/e5tl3GOJXon6?=
 =?iso-8859-1?Q?Hnk6oiKowxeNxAebFuv8+aEwW1+3zcssHeuBIrl/fXgYgjoQfKU4kCaEVa?=
 =?iso-8859-1?Q?y9ULpFm+OYaZSPGjvwPC7HDhVSR2vhtSTIVIzTO0zfb8B5jPK97OkYA1Cu?=
 =?iso-8859-1?Q?JaT37OzDqHm1qv1z3EporX6rf0rqLr+wZTAMYfBf4J5kLAR+R7L9IXW/65?=
 =?iso-8859-1?Q?+Cc6o+Et7/EWGBvdRikveTqRXKbwDGNk+XQNZbGcZ6yxGFtaJwMZNo2gpE?=
 =?iso-8859-1?Q?lxX3nV3b7h+dl1PAlx1B7stt/94L1m7umjSXMUVUoKIiu3LHkGw/sRqFh9?=
 =?iso-8859-1?Q?6AsnoK8lywjt2m/JYL70G3izcprlOjUbC6Wg9VUycxXI6PbBfQys4oqCGV?=
 =?iso-8859-1?Q?gMFYWh5/328MjRtnPtrZBgZfra+afVzuiTvIpfhZTpPXDusr3kkW3rAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c019a763-ab2d-4a48-1b87-08dbe7840106
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:43:54.3556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vllyKmyWoaasQ7OTwhKS9cWXW/1kPFwEz8OBqj3eVDHd3jGrqPfS811oylGGohEKDytJEkqR6pVvPlikpFBZgSCQSOs3gveJIcOWFE7NAhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/kunit: Return number of iterated
 devices
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 04:38:14PM +0100, Michal Wajdeczko wrote:
>
>
>On 17.11.2023 16:18, Lucas De Marchi wrote:
>> On Wed, Nov 15, 2023 at 12:58:16PM +0100, Michal Wajdeczko wrote:
>>> In xe_call_for_each_device() we are already counting number of
>>> iterated devices. Lets make that available to the caller too.
>>
>> anything useful to do with the return? Is there a follow up patch here?
>
>there is, but down the road together with some SR-IOV tests
>
>but IMO even if there would be none tests right now, if information is
>available at no cost we should make make functions as useful as possible
>to allow future new use cases

just need proper justification in the commit message if we are changing
something.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_pci.c | 6 +++---
>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> index a40879da2fbe..306ff8cb35cb 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> @@ -42,8 +42,8 @@ static int dev_to_xe_device_fn(struct device *dev,
>>> void *__data)
>>>  * function. Across each function call, drm_dev_enter() /
>>> drm_dev_exit() is
>>>  * called for the corresponding drm device.
>>>  *
>>> - * Return: Zero or the error code of a call to @xe_fn returning an error
>>> - * code.
>>> + * Return: Number of devices iterated or
>>> + *         the error code of a call to @xe_fn returning an error code.
>>>  */
>>> int xe_call_for_each_device(xe_device_fn xe_fn)
>>> {
>>> @@ -59,7 +59,7 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
>>>     if (!data.ndevs)
>>>         kunit_skip(current->kunit_test, "test runs only on hardware\n");
>>>
>>> -    return ret;
>>> +    return ret ?: data.ndevs;
>>> }
>>>
>>> /**
>>> -- 
>>> 2.25.1
>>>
