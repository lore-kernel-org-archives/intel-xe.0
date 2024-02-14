Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A617C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 16:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B3A10E209;
	Wed, 14 Feb 2024 16:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+b4qYJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D904210E118;
 Wed, 14 Feb 2024 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707928163; x=1739464163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yg2S4qdyXaEiv4IbzHq5bJKj2H1Gew5vc45134C0b4s=;
 b=P+b4qYJw+u/AYNs/04d4ajKyOAVjYDvthDOLb5ktpOcqGjRWD3zMlimz
 DQ5n6HKdC7kAG9Y8gx+szTfa3qyTVN9c/k2u4ZIIel1p36I0rzojZJfn9
 od/+XVhnGOJIxyvoqhIHoSA0gnZb8Ty9LNEhxyWHOtOLBx8naQKBDwj5/
 kJq2Id7NBxQriJPSgyy3s6CuKT/KUWigzltDbsDl5YkfBBZDMVT001/ET
 Yujy+JYnWUhlZ44f3B9DJzEawy3HgnkCDyOVIc25mHXN7y2ype0Qdmn8g
 LASKd0ZvQ40yc/SbrthN4/p0Vhz5jPiwdmHZuf16E/voOfJIYKBA0pneE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="4944490"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="4944490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 08:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3218947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 08:29:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 08:29:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 08:29:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 08:29:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDO2UxqcLTa56PaQxY3KZQq6b1tjKhXYpX/5TtP5b/5iCQbAolKEfl4a23wFrNsmGG9bwRQJ4EOru6gyJ/5Srutctz//rAxkuYR4jHB6TSU7RD4ITDqjoJN62lhe1/cCmC2tn9GovciBKgsxksdhgAW7bGF9+WgLMRLK4f2jERqyXnDNVjrzXj8pzajS5gtQ8566EMsINmkYvJG7x+le5Z1iV7sYDoVn0NgenTVhT3wMEKzDl2gxC8qPZz2aJfXgEVLIu/Pm5jCPiIoePOQsbJjL+65HNg428jcSteWPh/hz4QyJpbbVw6m6zc9tIzdls8saIfuizE+8Yk2vdfvnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epiAqhYnFwIDzZBxnjinFlxDdFeDfcGFU7ghTKSVHRA=;
 b=APYKCrHm/2uHQo/wTZEasm+TnzeXEshtlfRcIqLCd5F5if7GVvwXSNqkR+/yDtIa5KtRtVT4L4A8otfhR9U+pbxT3SL3fmzgO5rOeUldsitMnSBu+1+Psta8JpYH0JZhdLTofXI9mPbXxZM07kmSGBzlqFDlT3g27/dNaxMesurm0CBIMhNlGzZ9zZSf3bE4D3F1n1LiybXtOrqUBbZ4jcZjeKQGL7tE2O5qbzevjrHvtgG9XcIJomkhlC9zXeiSOoNliEqZl2k2wC0deV3lgXp8tL8f59TFYoX6Q6ipU56I7aQpc1aF6NIwoHilCIwZ+1655yUYef54rbDbXzOIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 16:29:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 16:29:18 +0000
Date: Wed, 14 Feb 2024 10:29:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: Re: [PATCH i-g-t v4 4/8] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <7lanhi3yqhvrk2ltd36vavj7hrztopdrxtlazvf5v554pccndo@k623tcsfqhp3>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <20240206101514.6897-14-janusz.krzysztofik@linux.intel.com>
 <3377122.usfYGdeWWP@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3377122.usfYGdeWWP@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0064.namprd08.prod.outlook.com
 (2603:10b6:a03:117::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 134be680-d832-412c-144a-08dc2d7a1755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQ0CqxtLUBtUUejJkqbEP7Cngw5GOMjAUsXB6nB6uqSNNuJimH7NkAFrHHLgu0vxi/x6aLZIgLnKM77tHeXKlpoX0EjzX6rqgX9KRmGXizijkmqZzNWBgazH5l7/TX4aeneDhSw3x7WYHZ7ZarT10/XX+HGlSJp6WziydR3/NvfT2VzhverSZmnfonyiRtqx4zkBpmUNxzwnv0kXFlhWfre1h0/QfT47jpaT1yXDxApXUCDRG8Vt2EA+wSlFnJFgKv2FH9FpjhCayW2EkcRHF/IVOhNv+V68KteH6++eBSR5hMcWyXLsvQn80wj5EUxicdtLhsEyczcM8KpzVD8hQItkeWWAWrgoPg7bRkw9t1S0O8ZNCJnKqhhvOeOf4Aion0IntX+Uli5WwBwzNbkiFshxho/WYcWBx30iPpH29AVtOp/B54RzbOdt83Ic5uFYJYLjb7KYt8QvYvpK7McncX8z9wxzlceMSawP9VLs5HJgndHD8h/zF/O56NYrkWfji/QH9IVEStIRrHaW8oPMxMtLrKmZHZ5Ld1r+ZQNFaQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(33716001)(2906002)(5660300002)(9686003)(4326008)(86362001)(41300700001)(38100700002)(82960400001)(54906003)(6512007)(6506007)(316002)(66476007)(66946007)(6916009)(66556008)(8936002)(8676002)(6486002)(83380400001)(26005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAeuPKI9nux25qXTKrziB0VNR+NzT04m4ItlITqwBnjdwQm7+d5Jz+PHP1bV?=
 =?us-ascii?Q?GEFQoEOwUeO+jy4HSRhls3mVOLcXD16pTH7crb/tkt7tA/gr5JwPtOWH3jmH?=
 =?us-ascii?Q?yG7uYQdDZ3yi5W5Io4qS+lmmAxLwHET1A20p+68zSbWCpvrhux52putiatpC?=
 =?us-ascii?Q?0JLWutT9JRczIATfBcBo+iXRU0HQRLWMwHFgH2BTNSaKNZvHE8sESt6nAzhd?=
 =?us-ascii?Q?ckJ//OwfRFc+YVcgH2bdPj7BdMwrFCoiNoqrClNyuMTlqlcpeTY/8cXHd9FJ?=
 =?us-ascii?Q?bcoA9U5/oDDeyIdLprefu2/3Z70+cGhBiB/1aUdtRVCYWldDgvj9/WKNPGzX?=
 =?us-ascii?Q?BOurBx1uZHBEIjblNmpVXD6EzOGOm6VC5MVrVzszSgzlYD4QXUFtTtZLGoD5?=
 =?us-ascii?Q?kxkaVO3MA8HtlFZDZBgkUGzFOvKTf+2cARnjUCWTvmXGQkMn8eEnRv0ndvux?=
 =?us-ascii?Q?RF58zMJTfpeyijj9Y6zUJxtEW77/8un4nYhvenuF6bUCHUgq9fviNvHwifJi?=
 =?us-ascii?Q?rPIFT0fBAasog3q/WKIjXCOIWDMeu8fwHBzXnEbF3iII5blPxjFGmVl+TpqD?=
 =?us-ascii?Q?n6MjA6NGkKg4+lt4zaIKLRnomXw3JvZfBdmDDzv/xc3B344/uVW2K62SG7lC?=
 =?us-ascii?Q?i4qB0uDYvFqqPUsl5v6JJ35Xo73b7gKCk0ScfoPMqzx1432LT3Gk0nU3Cj8L?=
 =?us-ascii?Q?Z3GZm9L5x3vHMSn6FaQ9SL1c14+cN4n2NK9sFX8dPhGQ3KpRVBEGEF+K2MSZ?=
 =?us-ascii?Q?HOPfv0NgnRS9z+Sz/El49U8oH4sm39GKvZ6X90vm2rjqRwCqi0j1xxHFtL4d?=
 =?us-ascii?Q?z+t7kD4fwUreK2/3nPxxdtDgNA9Sjvs8DbHFchYHIBVCCcbAn7fRm42+aCbS?=
 =?us-ascii?Q?wj9v+suRj2x7VHt3+pKwAlCeAoRS7cj8jbOneP1MClnWOKOUDRa0RPiL0ZEC?=
 =?us-ascii?Q?LquPsIMm5Iyt+WD3RZpPGD+FXOLt0xId2lSxm685evpsGF/7KWaaqmCezYyN?=
 =?us-ascii?Q?A6r9sg39hEqCeuvOybWgrJT2BAkbEn+rwOiQT2jnL2EZQG+cCiMvmvQ330ye?=
 =?us-ascii?Q?uIFxwPNbqR8sIuRX8ZhGfx4hXNPStkp43tUrUJLTkdUxc43mtlLwYVqIIxBE?=
 =?us-ascii?Q?GwOq2q5+nWkkzT0qPLoH9dy6XT9PeKZnE6xZu6prxLPczOGZy6DhT61yIrbv?=
 =?us-ascii?Q?PWakGP1zeHcIeOJfbGXyY4TcploM7JxUQgQ12oD86lkC9bGwqlzeHBFLMAqq?=
 =?us-ascii?Q?jRPHR3EJD4WUaEev0LwzV/tO5aO5kUOgCWy0STOWy5dBcyD3E8y5hrq8YTjP?=
 =?us-ascii?Q?QU20aK0W6ZOEs7ZOd+ODc5FZuZv9dmm/vi/ldWqquoSTu+bWLr357c9OMh7N?=
 =?us-ascii?Q?poNPDlUe2waACfv6iQ8FBCQnVN1t+BLnzV/Eskbl7k1hZO6aAjKvFCfFXpT3?=
 =?us-ascii?Q?Swwy9gNoyGQvZwvE98AIMAbTgc4JWgPdiWiKkncGGod955j8bmhRaBqTA8kW?=
 =?us-ascii?Q?h3DF2Qnh8ezEYyu1ZrMJaEXIxcqgky3W8zuZ6JTkF7eaMRaofZoZ/C3AIReK?=
 =?us-ascii?Q?4pFP1qSzBLksxwvgeyXZ0oTo3aNFvAmrZi9eUsmQLPxcjCSTvh0/yBrHgG3c?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 134be680-d832-412c-144a-08dc2d7a1755
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 16:29:18.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8afq0B6Mlksykz1mb+5XCsYUnEtAqJFY/LjRzzghLzWQ6SQjFd+XlZPFFOpYW4Ws0RsR1hSnJAeQArPMEuPgmxFwpRoUf9pilWPGyk1Reo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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

On Fri, Feb 09, 2024 at 01:11:39PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Tuesday, 6 February 2024 11:00:28 CET Janusz Krzysztofik wrote:
>> Instead of wasting resources on reloading the base Kunit module each time
>> a different set of filter parameters is needed, try to write the required
>> values to sysfs representation of those parameters.
>>
>> This modification will also serve as a workaround for the issue of
>> impossibility to unload the base Kunit module on Xe platforms, available
>> to IGT as soon as the module supports writable filter parameters.
>>
>> v4: Return early when opening module parameters directory fails (Lucas),
>>   - use error unwind pattern on errors from sysfs writes,
>>   - replace "human-readable" with "non-NULL" in comments about strings
>>     used as equivalents of default NULLs,
>>   - use empty string as filter_action NULL equivalent, but verify if
>>     successfully applied when critical,
>>   - refresh commit description by removing a statement that addressed an
>>     update to a comment on legacy path, no longer in scope of this patch.
>
>With your closing statement in your initial comments to v3:
>"... if this works, seems ok for now."
>(https://patchwork.freedesktop.org/patch/576817/?series=129174&rev=3#comment_1052127)
>you seemed to accept v3 of this patch even if you had some ideas for further
>updates.  In v4 I tried to address those ideas, one way or another (please see
>v4 cover letter for more information).  Since you haven't commented that new
>version, may I assume you are OK with it?

yes, please go ahead with this if it's working. Further changes can be
done on top.


Lucas De Marchi
