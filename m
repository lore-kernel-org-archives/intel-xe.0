Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EDDC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 18:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9EC10E0F6;
	Mon, 24 Jul 2023 18:15:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE0A10E0F6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690222554; x=1721758554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xsIGJcl6w5uaA9B+v15EMO6VFr7Qu/dxedE5pS68F1o=;
 b=FXnd4xAmi9V85+A8cht+7dnTSySQ5RO8NZRHq1YpnFJLWtJOzy5M2WvF
 GoGhlralYtYfBbQaZT3jRGdpmwj/WszIRZ09E2AxA3MG0LjX6k/GyFSLA
 k4gSafJqScFgh8v0kvszS3snUEzflhQIrnsCk0BB+1nIT/R0074BUAyQ2
 0f9S7wuCFvL7N+r7EuV5zeJ11Cn96Ta7o6QTFKYkgI84qx5ptVNkWkHx7
 51y1NR0FaxPOPMsAhvoRSfPsPptc88Mj0qFu0n1p/UuoWk0Gt6mO8gI7p
 i0DXlg3A8uUQhK9pMjjKMcMfo9IVwLrMl0YIbjt3C6wAkvaZ/ZKTLo1MK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347794239"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347794239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 11:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056502671"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="1056502671"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2023 11:15:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 11:15:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 11:15:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 11:15:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 11:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4PbyrNH+h0ft30IE2O7rOR6LwC+NT1JqwJOKaobJ2aRE/ejZEcg7Okqm9b/NUFxdbIzAK+tTuAYr2G4KkdrQXovVU2L7oKH9lY10zgzyCXQ3VUq7BAxlWJnFCbBIWROofJIN6e/CcIjegHWGdgil9HsP1YMKgi7AMb7HIdZl85828xwtrMBMoZInIeeOloAfzT14bnixwi7AvdrFY/z1nwAw16M7yoeIUHy33oMdz9PH+bAw5jV0j+w0ZpULBuhXJAsBixWVhYpj6fdRuho9Jxe9+nBA8yT2nlpjeQZ217sLFjrD0Oc11BBxMejrhvcywxNmoZkK/w/tWWwPU3sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r15JbxagXR5O1vVfAbxw+ZMsKdGWwc9L3bCyEQ3pnzA=;
 b=SSrfkicgOiu2RJV4ZNFs/3E9Pp82YjJ+USX95Pa3DDYA0Yz4Gfh6c/SIpXYFk1NIUagBTD0eg9OOyZ3v7wxB1YImv8yeue/7YHr7nwIz+XPJF4e7Vq34Mo9AAlaTHhFNS+zLI1jKZW3hc7UFwrPkwGlSsvumw9GDnNGu51HJW33TqdoxO53NvqBMJpbJ5b99C57aLI/Hg8VMnFPgw/DVVGfYFBMSVY10wDos9Bpr7u6Kcpw1Ad+U+06LtXFRtP1xg9je0t6mRlWKIHekDAWLVY/F6RonlnAqUNqj4pc4hkh3cw2JN7AXw00uZZrRdYwvdZ0yGwtBxmU36INa8L5f6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 18:15:49 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 18:15:49 +0000
Date: Mon, 24 Jul 2023 11:15:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZL6/zpodlu9+1iE/@nvishwa1-DESK>
References: <20230722075224.22458-1-niranjana.vishwanathapura@intel.com>
 <ZL6yODFgIof9MNab@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZL6yODFgIof9MNab@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 49843fcd-ec40-422a-9c70-08db8c720263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8V4IG6uW4wZXrURGeZI7Vx+XtWWqH4RJkbC0eE2jhtQYCmj+ft9zSyFi7hXWlTXh/XkI+cMEjS3VU30Cy9xc5yRZcyrO81TWMf75F50eYqeqI0qfkH8D8+E4UBiyNkxJ7GsT+NGWXjkZhO1L5wddePnPvfnvlHsd4dMKyKNqKxtzwOwimvp54Q4gJp+qe/U6QDsYWC0HxqaIxMHqW/ve+SW8b2Q8aU555RIst0W1qodfEIufwMjt67+LsqSrXF9VyZQYj/3PQ/TAWcigr7FORUQICbR7NJ5JH3hrIpI4jQz4x9y2+OZ5xif7wEUW9kCSazniyOoRUyN4TfOC68J/+JA1E6zVXrq6Ql3212XFba/XywEu+7XKdwoeJpyTaPIt146FaYBsxkAJ7dlLYNcUWiV0K/a5rWXPKpsbZ/QPAC3Dx+h3moU9JzM9Eq3VL/MQJh6Z1hFOmVsdmc04ya/AUprYrBYsjCcj2BHiGMSZJ3e8Fce878c2nlcL3FieR8aUrkfMph4nZCYJBrOMVDrlUjK8l1ZeVfusILIh9Dz3k8e1jN5J/DWZxwWcE+DE3uU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(6512007)(6486002)(186003)(9686003)(82960400001)(6506007)(26005)(478600001)(66946007)(66556008)(66476007)(4326008)(83380400001)(38100700002)(6666004)(6636002)(44832011)(8676002)(6862004)(8936002)(5660300002)(316002)(41300700001)(2906002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHOV5hHgHfo4vZMKqy0LlZbFUrB5uQXySVb+nvyAxZATxQTY82ucu9UuggiZ?=
 =?us-ascii?Q?LyCn1sbdjnobo7ckQ6PbemDPUxuLIwYu0NW9JQ0sgxrdT0W+emxN1W+CA8w0?=
 =?us-ascii?Q?hG+BZ8Si9+oZwy3hL8sP3GsYoMFuy5OcIzgzQaDiHKoBuRV0v1LC//6Y85t/?=
 =?us-ascii?Q?C6V8WvQYmXyihkqzVMl1T1VBVYumuqKrBZzmuWbwNI+M635qQEtg6S1nJycs?=
 =?us-ascii?Q?qvl1bY8+a4Yf4Gh11iBBKcqwl/liIJR9hVmVSTdQ6mNimBgUBOnIX5y51u9A?=
 =?us-ascii?Q?fFWaLVwI8O+LEi/jsmCea4G9b2o5UIbXhJ4J+BDH98Vy5729KcLLqnvk2QJj?=
 =?us-ascii?Q?bokh105LrhdZIvBJ6PbUcbNzGUQtT+vX7XflgZrw2hF2fAqdqtTiYseTAGYp?=
 =?us-ascii?Q?QNutitm9I/x4HuKslguC6u0+6RayMmAnTvHS72RdZq5X47mli9EAkjifUi8v?=
 =?us-ascii?Q?C3gV7BbCIA7ln6cTTMCTDgAwG3AtrZn0x5P9KzXpbm+M8GxV0XuBNrcmy7XA?=
 =?us-ascii?Q?y/QfGCAd0/YhjOKu3T12E9wXHd6dkx5Mo7EoWYNJaquBk7nI2Sj9N0gyhtgU?=
 =?us-ascii?Q?5dGlssvXGCK7CtcFNnrVpzRpiiHtjWWePIX9ReS4UDIXqtIm0OSF1jSQUAUj?=
 =?us-ascii?Q?Z7CioDP92AQiDbSxemsTm7DCbHgRn9sR7ppqY0frvVrj/txlr3RsfroylOPO?=
 =?us-ascii?Q?Peifjud/dauf6nJvyBvxuR6A2oW8LDPMjDhhwSZr61CpN7gooCdQz0CwvqDl?=
 =?us-ascii?Q?KKWZ49nu5ZIT6IGtnqJkLYzl6NRKA1TQhyf9HX9BN7B5v0+RmWYC3VxGbmyN?=
 =?us-ascii?Q?3g5ViIU7QrH0xgqW3TBc1ABNS5Ey5Eeq9l8yClqB4hwdLjQi87jpFq8r/+Db?=
 =?us-ascii?Q?I2lqkqwlrIxhkdX73kOZubYiQHLsmWB1P7cqKMoMAAmlc2SwEcKpxUpATEvC?=
 =?us-ascii?Q?1NvriZ4j3N1CinGxU3yKDzLDCAKobNiZojXTuJLmm3MTdmq1SN7ah2hVTfXA?=
 =?us-ascii?Q?MDKFsIFhQ8+gz1pDyfNT7wR7gODxWxEmZDDnLFHgNLccBEOH96BrOZDTPoo9?=
 =?us-ascii?Q?p+lHREEk/ddWZHizzso6Hq7xZ5w6bPSq/JUxyZBGomQ9T+NSqL6cbdnrR+wZ?=
 =?us-ascii?Q?cWnFt9VvH+rUwPImTD0nl7Z9Nx9sI7ZsWdirYxiO9c6soGPNbCViNA9+DY3I?=
 =?us-ascii?Q?eA1iBz9TkxOYUcpxRmDDVevNI25cw5l3noNNQhOZhRA/PLRkjk1Mf/lEc97d?=
 =?us-ascii?Q?kSD9FMgEDmDTlLNbVR2DxH74+QiRRkyRm2jKx11EG2rV5z9OxGl7d8B8qtoB?=
 =?us-ascii?Q?JMBVkUHfuj2qNOq7wiuErq5g6I/3HwnzWEK+2X10mk0+wbc9fEDNMMjXzehi?=
 =?us-ascii?Q?EjeiFy+IakC99mNQ30JDKUGGie2X7R8yu77JktP3gPJ1Ab9zLdBSDbVwKRwc?=
 =?us-ascii?Q?FPleNXULnvTW3RpPz3HenjQ+ShkQj3L+DLdgU9VLWiKzsiQLfTv9WEo2nPIN?=
 =?us-ascii?Q?hLg1DC8GN5AAlxBjofg52/BHo+6Jw1wcm0lQo6LYGZrix9/bxvesDatBupN+?=
 =?us-ascii?Q?9Nzt3Q1nGX28iZaf09zHWZeybe3L3Wmvl3nh3ecIzc6zK5OBGUSSeeSwQpoa?=
 =?us-ascii?Q?8uV8o0MOexteMoHucdEWEkI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49843fcd-ec40-422a-9c70-08db8c720263
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 18:15:49.8529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmopyA+F7tVSzW2PST76Y+3D/nTqfOiUouNZOy9dTNx9gZ44gY2EV6J/ycn0aZLEyLGI4gJhI2ln8LO7u+LV193iYyPe9e1+NRnUPUfsQKnXJR/cqAddYHxb0BxKR8N3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use kvmalloc_array() instead of
 kmalloc()
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

On Mon, Jul 24, 2023 at 05:17:44PM +0000, Matthew Brost wrote:
>On Sat, Jul 22, 2023 at 12:52:24AM -0700, Niranjana Vishwanathapura wrote:
>> Use kvmalloc_array() instead of kmalloc() to avoid
>> memory allocation failure in xe_vma_userptr_pin_pages().
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Change makes sense, just wondering if this failure was ever seen?
>

Yes, it was seen during a UMD run.

>Anyways:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>

Thanks, pushed.

Niranjana

>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 62a99c393d6b..6429d6e5113d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -72,7 +72,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>  	if (notifier_seq == vma->userptr.notifier_seq)
>>  		return 0;
>>
>> -	pages = kmalloc(sizeof(*pages) * num_pages, GFP_KERNEL);
>> +	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>>  	if (!pages)
>>  		return -ENOMEM;
>>
>> @@ -152,7 +152,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>
>>  out:
>>  	release_pages(pages, pinned);
>> -	kfree(pages);
>> +	kvfree(pages);
>>
>>  	if (!(ret < 0)) {
>>  		vma->userptr.notifier_seq = notifier_seq;
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
