Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC6CC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 17:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4779710E294;
	Thu, 16 Nov 2023 17:56:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FB910E294
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700157413; x=1731693413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a3xS7VicDpehdzAAzm/9YxE7w4/sGhFpZJ/JkXupkyA=;
 b=almm4WQK2scQXPcI1gvYRITEXw8SKTHrBzeDwaR8hTSARhwY8Q09x1Tv
 JZ2FuDLPvMtAv8Wxe+fVFzNkIQ2qwVe+s7POz7mBeDlOsMLoxfVKoJH5c
 OUyJKhuHKAQSfbBXCieDxekXRlJucQ8fRjeIjwgWKPgwHvTsNXwR2Z40c
 HAdQbNKc399xogdN273lpeYcoUz7gnZbAAeVEomltq6CCc76YE57bXDW8
 sL3eUmpK4g4xW2n5zS1h8/O3z4U98pZotvmpzJHChkW+qn2Ro++1YD5+J
 s9psbUfGLLV6oSw5NArclaRTap1I1J56d9GprKCAF0u7bRex2O0TcIf5O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370502084"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="370502084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 09:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="741834200"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="741834200"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 09:56:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 09:56:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 09:56:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 09:56:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHSLEajSem9ye3g0WpbnOJi1FJqbNX/fHTE2g6y68aPygcWEj522tTW9xIi/5rPLJVTF5FlvZO8zHcNi3niOVTE5nPDy7xpbrnFkzHRddKIf0pMzIshDFy6+Uo2iKf94BnIuM86juWgpOZ5OWpbozR4OlD4C/o7FhagqhwBBn3W0n8TbMOg3YhG7MaQ0hpjPPQ4giRYdA3LGOINqmY23ZHrzVfvXhed0aGI05Y3s/7WGMyFFBV54wiiX3qNz5bD8cdlPzQXGJAJFhWWsiL2MfgujtZEgSuoxBpAnBCAwahYDOqGnRj1qj21A8GuwUypjoO6NownZY82wzqQYxIExKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK7YjHbrNMjAANQy+/wj63qXZ0KFgqRAZdVjzbgZGKM=;
 b=BdFZeoBZX6BG1Ve8WE7vYH2N7kKmfYj0+gIbMt1NnaEoi6PT76O9rN2TOGWcqe1435ArVPA46zIzbSpp9OsDKXU4a7XwV0QAlBdkk9KaB2dTX4r2MpLYLV4Jy8xIRUxOQ14TM2KWOVaO92b5xGZDA/fUlc5hpvHclCz/K9lxNNe4rPRooRix0qXOQM1PoeHOGNmNkaLGRuFMZjN6pLVT1BO+pqsdj4Zt0Ptz8NfIe1PwEGx3jsXb98/cnq9R5J5535jWejTSjOlzNPik9ilvixG1mizrZBbdMRqOpgjeAnk5ApOokzcsTnMA9ZGI0zFWat7GMoirgcjxSROGkUUfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 17:56:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 17:56:45 +0000
Date: Thu, 16 Nov 2023 11:56:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <77gxl3ydbvrtco4bflsirceyblgotpdmmldwuq6oxpn5j4vaje@bz74sfgkjm5z>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
 <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
 <170007111735.1634.7618023957528021915@gjsousa-mobl2>
 <us7s43n2woxnrfbuyo5x43nxflj3ajf7yamvznk4di3awh75zq@zyjf4wnucgrn>
 <170014215216.3216.9843661827530194162@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170014215216.3216.9843661827530194162@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:303:8f::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 121ebae5-df86-46f7-24b3-08dbe6cd659c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7kmKTOGySwvmtGb3MjCnritZCsLkT6k+Tw5U3OYIi34ueg9jmsDvVtW00SA3+wCy4zu6p4T9J7PfPqfWQo6DiiOikuP3v2DM1lp7+XEImkHW8XY4GQ9DoOCx31nlX0GfPmo6+l9Vk53Ugh+bajnVXNVa4Zou794ZzDHHwajQX4f7XQzilnGmJW2r+kPRNnF9f0wv7qtplvE8Xoyj3J/JXd200pZOHpnjGeu3Q7Sfs0xvbdz9NI8dJGLn+WKbxg0jdvEPdAtp3+pogKySFi5AAAy1/RJMPvp6PNbwy3an9dWlxzygcs9O4qDJiqkSsGOB1hSYGL4jyMzED+WhM+RkKS4SHdkIV2UiTAYrPRRKIMLQnb9vDu/qeww1VvEPbuehBgOkg7C0fm1EQaAPT6/FraXWEqgTa7uW6IgZt5ZiTnwlOCU2unh/CJtRs2zZw6Ih6WfgHG9iMbGwUif9gb+Ou7uohbwQZcG5rGaSAv9UXdIE3mJNeUMJoehVUzpNw7WmHbl78H/Pultcsx7EuZJgNQE4UXmx2yRMeFd5/izn3Yd/Xw++owxkdtmDPpJY8ggWcmhR23uSsZbY+UZ7F78hwnXVkWHTl5wJCk66QoXwmf77D8+WoxPMJNVKH1ON+nu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(376002)(136003)(39860400002)(346002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(451199024)(64100799003)(186009)(4001150100001)(2906002)(41300700001)(6666004)(83380400001)(478600001)(5660300002)(6486002)(86362001)(26005)(33716001)(6862004)(316002)(8936002)(107886003)(6512007)(9686003)(82960400001)(8676002)(6506007)(4326008)(6636002)(66476007)(38100700002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGkdgTORXE+KCgRQawoRVrRDN3n9LzDJRCr/NAiAtCfu4r2ODizfooJ5tf0s?=
 =?us-ascii?Q?8Cg47x11RmmxpaNQ0HMnDgo1m1xHaYiMJdbdmnuAgqG1aZpp6OCtqXOLh+zI?=
 =?us-ascii?Q?LCJJ/F+3BRvxD2yhiCg5VTA4PoIlAWQX9KbbqsQgh6oJM/cqdpmaSKJO24wC?=
 =?us-ascii?Q?As8XPeXJPTdh3rKOvW1NLevUURrLFMyJYFecOPOk4R37f2DMOixPhZQynXhn?=
 =?us-ascii?Q?2n7oPrG124mjmBsrU7bqgFd/c893CogLyuReB6QDZw1MgaT5BZQvsJHH4xZz?=
 =?us-ascii?Q?J6nJiUPd75Bz+7UXht3tg53s8lx4yg4lzo37x+FA5zvvbtP3Brdmmarfh/wA?=
 =?us-ascii?Q?Lq81bsE4ehH5Iizqz1rSOwu+SpMO8BNP+yLxjmtEwYJ2QHUdGoW4BCWa7Z/y?=
 =?us-ascii?Q?ZsWWVxmdtpX9hVNYnvftvQn54B4T9Yf0ZlzwJJCRYqwxud9wsGJS1dQTeXXC?=
 =?us-ascii?Q?7yii/TtkYkdY0SYrvttVYsTNVkapUYK13QjDdfwinz2WPjNYN4CVlFEfgyoI?=
 =?us-ascii?Q?ua0v6/OuZHhjDxqYou49z+lddLo0JtSOHosud/SrfwO4IsgTJ2iAmbPZHt1S?=
 =?us-ascii?Q?TCTNlAykiZpTpbVNQ+MRRXORpF3AvlZi9er98Z9BtzKT8Y6rZIyxpjlumhyS?=
 =?us-ascii?Q?YVPA/qAVRqXDI9lfR29/ZmysQuODSbI12Hl4+7eoqyaZ6nmmxpONUUWM4q8m?=
 =?us-ascii?Q?Zz5j6YDmo7OyU4AznS1gV8SBO+/6KxnNRNv6JcNLh6LYQjt74HkHl8XJFpMw?=
 =?us-ascii?Q?4cqlEqF6Uq95dOwwVPXdt9xHZ4+6G5VrB39jQZNRV79t0kGTSBuYUQHWnYtD?=
 =?us-ascii?Q?U8zhyGudhLjhMsm8PMwZla3dFhkQiD1+sZFJydlsY1qTWF9dmlnsLUL7ZGrH?=
 =?us-ascii?Q?li1ari/PLMJjyifCXF3Qd5q0cNiguSAwpozxHOBfVIUeHeViaz9YUWWlo9qL?=
 =?us-ascii?Q?x0J2XGE83qcZ0hrhszzHJVsX9YmRuAfFeX77Y1IQ6piQ8y/sDEJ1pA02CK37?=
 =?us-ascii?Q?3xkrREiSkbEF0Dq+3UCA1SCl0cOfF1wMcUg408nYIVjV9AJ+wEW2rwDnGzer?=
 =?us-ascii?Q?uzDcnMebAnbD/M9523m0LVwBOOO4IcC90Imr8sc8N13QdEJ3gQjIqDkRbuiY?=
 =?us-ascii?Q?zJu+7Qo0QV5Q7GWR/h0e9tyf4ptm62D8eFaq+XnC30j6Gm/6b/85Hzei0tT3?=
 =?us-ascii?Q?a/h8IP+59rMwpXpWgyWav2o60bk2aBUdzHSah8UgbqFDjbypF94+21VVgdPV?=
 =?us-ascii?Q?uBUevKkxMbXNWkw0eJOxGYQV+/1SAy08xW8cuiKIPoiT3Mf9314lE5Gsirl5?=
 =?us-ascii?Q?oQzQtmEv+kFnisJPUy++vgyPlmp0uz9+ENil+eE48hxiHVALk7xdHlq3A6Ui?=
 =?us-ascii?Q?pZcKrBxs1FwEvrNf6Jm3foXsJp1KKkJ0A4DrIaV52SR1b8QBZFMbJPcZM75N?=
 =?us-ascii?Q?fY+XBXRBEEIYU15zxWN26u8lN5ec3ALb3WmhTjTP76PFyFAk2sEc6Q3aBMVf?=
 =?us-ascii?Q?CAH+B/4v+XYZyabsVflM70REYANFO8IeLugNv8LXMe7vFjfEI1wV9IG6rgb4?=
 =?us-ascii?Q?I4/fBgCW2dtX1Q9H0cgFPXtHUETwkMkjgTP48FXNv5821Sz3MioY/Mdc8AGO?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121ebae5-df86-46f7-24b3-08dbe6cd659c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 17:56:45.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dvpxhqn6uEnFVSgLVlUJAMJTgb9TAOGFYXNZYb4GIRW/0sfOyedi/zYLIlpJY/Y7QN5Ns2S8NeS7T5C3TFpF0Xr8ur6LfCahsq0m2oE7MJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 10:42:32AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-11-15 17:04:37-03:00)
>>On Wed, Nov 15, 2023 at 02:58:37PM -0300, Gustavo Sousa wrote:
>>>Quoting Lucas De Marchi (2023-11-15 13:51:41-03:00)
>>>>On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
>>>>>With the current implementation, a preemption or other kind of interrupt
>>>>>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>>>>>interruption (specially in the case of preemption) might be long enough
>>>>>to cause a timeout without giving a chance of a new check on the
>>>>>register value on a next iteration, which would have happened otherwise.
>>>>>
>>>>>This issue causes some sporadic timeouts in some code paths. As an
>>>>>example, we were experiencing some rare timeouts when waiting for PLL
>>>>>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>>>>>we found out that the PLL unlock was happening within the expected time
>>>>>period (20us), which suggested a bug in xe_mmio_wait32().
>>>>>
>>>>>To fix the issue, ensure that we call ktime_get_raw() to get the current
>>>>>time before we check the register value. This allows for a last check
>>>>>after a timeout and covers the case where the it is caused by some
>>>>>preemption/interrupt.
>>>>>
>>>>>This change was tested with the aforementioned PLL unlocking code path.
>>>>>Experiments showed that, before this change, we observed reported
>>>>>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>>>>>reported in 5000 runs.
>>>>
>>>>good find :)
>>>>
>>>>>
>>>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>>---
>>>>> drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
>>>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>>>>index ae09f777d711..4d0e816a81ac 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>>>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>>>@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>>>>>         u32 read;
>>>>>
>>>>>         for (;;) {
>>>>>+                cur = ktime_get_raw();
>>>>>+
>>>>>+                /*
>>>>>+                 * Keep the compiler from re-ordering calls to ktime_get_raw()
>>>>>+                 * and xe_mmio_read32(): reading the current time after reading
>>>>>+                 * register has the potential for "fake timeouts" due to
>>>>>+                 * preemption/interrupts in between the two.
>>>>>+                 */
>>>>>+                barrier();
>>>>
>>>>we are only protecting here against the compiler reordering this. I
>>>>don't think it will due to the external call to ktime_get_raw(). Do you
>>>>get any failures if you remove the barrier?
>>>
>>>Makes sense.
>>>
>>>I put the barrier here to be sure that the compiler doesn't surprise us, but I
>>>haven't tested without it. Maybe it is not really necessary indeed...
>>>
>>>>
>>>>Anyway, we probably don't need a full barrier and just using
>>>>WRITE_ONCE() for both would be more appropriate.
>>>>
>>>>I wonder if we could do this logic better and have a header / wait /
>>>>tail approach. In both header and tail we read the mmio and don't
>>>>care if timeout occurred.
>>>
>>>Yeah. I was thinking about a something similar, but ended up sending this way to
>>>have a single place doing the register read.
>>>
>>>The difference from your suggestion is that is that I was thinking about
>>>adding an extra read once out of the loop in case ret is still non-zero.
>>>Basically something like below (the patch below would be a substitute for this
>>>one):
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>>index ae09f777d711..2b65d8387cd1 100644
>>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>@@ -118,6 +118,12 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>>>                 wait <<= 1;
>>>         }
>>>
>>>+        if (ret != 0) {
>>>+                read = xe_mmio_read32(gt, reg);
>>>+                if ((read & mask) == val)
>>>+                        ret = 0;
>>>+        }
>>
>>
>>yeah, I prefer this no barrier version. Small tweak on that maybe
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>index ae09f777d711..bb8f079e3cb6 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>@@ -93,16 +93,13 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>>  {
>>          ktime_t cur = ktime_get_raw();
>>          const ktime_t end = ktime_add_us(cur, timeout_us);
>>-        int ret = -ETIMEDOUT;
>>          s64 wait = 10;
>>          u32 read;
>>
>>          for (;;) {
>>                  read = xe_mmio_read32(gt, reg);
>>-                if ((read & mask) == val) {
>>-                        ret = 0;
>>-                        break;
>>-                }
>>+                if ((read & mask) == val)
>>+                        goto done;
>>
>>                  cur = ktime_get_raw();
>>                  if (!ktime_before(cur, end))
>>@@ -118,10 +115,17 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>>                  wait <<= 1;
>>          }
>>
>>+        read = xe_mmio_read32(gt, reg);
>>+        if ((read & mask) == val)
>>+                goto done;
>>+
>>+        return -ETIMEDOUT;
>
>I believe we still want *out_val to be filled even when timing out.

right... it looks like xe_guc.c is the biggest user of it and will
use the returned value in error messages if there's a timeout.

Lucas De Marchi
